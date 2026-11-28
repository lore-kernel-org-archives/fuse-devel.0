Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795847415;
	b=Yu4swJYEM5cW0Il18GW2h2gtPG9R9gKUym2Z6AC+Q/2Fh2Vd1mOOTwYPvrVm9hORiOmw
	 5vIbNJhD+4hsEO+SrIi3ry5UKsv6KaIqCRM0AXQOnoBr3UQXDuj+nx7AQeJ8RdVpe+iIX
	 ywetgX45JzrdhUavHrBv2fkdaxj1jlKRboFmp3TEgJnLpMFMUliuvlOabtr8oGow/p4wj
	 fx63P3TFm7V/px3noEkKA1lthUT4CAgR9cu8NijXTimjT4VWnl+bjbS1jgwKfu37FnXUC
	 QtRg8R6I8u8q6q3gnN8qfLhu4d5pEe8GCqTsR78SW8gbK8wynrQzKZ08TuaQttrcGlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795847415;
	h=Received:DKIM-Signature:Date:To:Cc:From:Message-Id:Subject;
	bh=aTRJU8FssdCAZmHbDvp++0MKqg9Lzju8HJeSd9cJlPY=;
	b=lUxIqyFSYU0u3LwhKREMSDKJ0lauziF9f9Fh2XmeGXIZ0Pval69qKx1RZelCx/scpCjL
	 j/vxvA925G2esbCmMvi6+A3pM4uQBskBQF9qQzoJve/NLASd6mlyDlmbKYs7RwJSmy3K0
	 hKgHXMFiDT+Bn9cSGKeFqkwKbl2tTVM92HGVoeWyiVclPPdIfgCePGRLibdtu6AqX9+r/
	 si8vzUWIQ+WQXqNhzM8kePXqTgN57yVLO9I30cttELcnNsHEFOhG6xRdrcaXyxJGAZVwW
	 wRGitSbTIVJzHHClJqyLCdLHFZicZU84KJn60MTfXN9vAUaqttxAmGplqL4la512GRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Z7klT2QP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE30E606A31E
	for <fuse-devel@lists.linux.dev>; Sat, 28 Nov 2026 06:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Z7klT2QP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A4E1F000C1;
	Sat, 28 Nov 2026 06:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795847415;
	bh=aTRJU8FssdCAZmHbDvp++0MKqg9Lzju8HJeSd9cJlPY=;
	h=Date:To:Cc:From:Subject;
	b=Z7klT2QPWepQcOJcBTVLj4nieX3CG7OTglM7kZcxko/GtuZg+fxlHeZ3hzjI6NjQY
	 Mo819WuFJg0GL+5C8fw0Nq9MTsft9lCLmEpDb+XSK0D0WaXHG0NhUz1UZxRwIPy29Z
	 k10PUs5zXE8U07Z8qFM05BsUledZFN7bxk5zg6eo=
Date: Fri, 27 Nov 2026 22:30:14 -0800
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Kurt Lin <lylin1023@gmail.com>
From: Andrew Morton <akpm@linux-foundation.org>
Message-Id: <82801b542ac4481a85ec2c869294ca28.1@linux-foundation.org>
Subject: [PATCH] fuse: let memory-failure remove poisoned page-cache folios
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list

From: Andrew Morton <akpm@linux-foundation.org>
Subject: fuse: let memory-failure remove poisoned page-cache folios
Date: Sun, 22 Nov 2026 14:45:24 -0800

fuse_file_aops has no ->error_remove_folio().  memory_failure() then
falls back to mapping_evict_folio(), which cannot remove a dirty folio.
So when a dirty FUSE page-cache page is hard-poisoned, recovery fails:

  Memory failure: 0x7ffce: Failed to invalidate
  Memory failure: 0x7ffce: dirty LRU page still referenced by 1 users
  Memory failure: 0x7ffce: recovery action for dirty LRU page: Failed

madvise(MADV_HWPOISON) returns -EBUSY.  The poisoned folio stays in the
page cache, and the kernel later reads it again to write it back to the
server.  With a real uncorrected memory error that is a second access to
bad memory.

The poisoned folio also outlives the last close() of an unlinked file by
however long the inode takes to be evicted.  The memory-failure selftest
unpoisons the page in its teardown and that failed with -EBUSY in 6 of 40
runs on FUSE.

Set ->error_remove_folio() to generic_error_remove_folio(), as ext4, xfs,
btrfs, NFS and others do.  The folio is then truncated at the time of the
error:

  Memory failure: 0x7dcf5: recovery action for dirty LRU page: Recovered

madvise() returns 0 and nothing is written back.  The -EIO which
memory_failure() records in the mapping is reported exactly as before:
by the first fsync(), or by close() if FOPEN_NOFLUSH is not in effect.

Tested on x86_64 under QEMU with a minimal /dev/fuse server and simulated
poison (MADV_HWPOISON), with and without the writeback cache and with
FOPEN_NOFLUSH.  The memory-failure selftest then passes 40 of 40 runs on
FUSE.  Not tested: virtiofs, DAX, a real memory error.

Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Miaohe Lin <linmiaohe@huawei.com>
Cc: Naoya Horiguchi <nao.horiguchi@gmail.com>
Cc: Kurt Lin <lylin1023@gmail.com>

 fs/fuse/file.c |    1 +
 1 file changed, 1 insertion(+)

--- a/fs/fuse/file.c~fuse-let-memory-failure-remove-poisoned-page-cache-folios
+++ a/fs/fuse/file.c
@@ -3185,6 +3185,7 @@ static const struct address_space_operat
 	.readahead	= fuse_readahead,
 	.writepages	= fuse_writepages,
 	.launder_folio	= fuse_launder_folio,
+	.error_remove_folio = generic_error_remove_folio,
 	.dirty_folio	= iomap_dirty_folio,
 	.release_folio	= iomap_release_folio,
 	.invalidate_folio = iomap_invalidate_folio,
_
