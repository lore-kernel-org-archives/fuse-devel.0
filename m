Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B5443F4C7
	for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 12:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228803; cv=none; b=ZbDHYGCkx+pMUVO6GAcSD/Ow2cC23BJTRbmnFcsm6rcmPIsqNj9cWUtk+ew4dmK0Yie2UkqjJ57ylv1F1rR7yEUSDG0o8SfHdZjuIrADCzgZnEkJzst5XgdZKYWikZHZsV+khsveDNmjJeA3eys017XyDiRuszsrrLUueyhl36c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228803; c=relaxed/simple;
	bh=KGy3wbb4e/85HQYh0jh64/YsxWHHeC4OzH3rdUZLBlw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p8SxI/+ggG/6TB1HO+y4Jf8KHj/Xmh/ly3588XgYnH9DmyaOvZbG0ha77adi05RW/xCgYFXVVlb+Xwg3m7dPqyrDbNNjpWQQgjPvJokbIF1iO6NbWhxny7rx2Ge8QPHsNHkYMuk8H4WdKP0v93dm3R3TTcoWTBciFVlv97VtAWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=jO9zxHVx; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="jO9zxHVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1787228802; x=1818764802;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XNDe6hzTnioBMy8ogcGWzfWkTJLYmVGcV6XW8AEfk8E=;
  b=jO9zxHVxZwY0xZSA2iz83FXmVUPYc4u57hNAOrHWdTwtfVd9TBYh6hi0
   1KNO55JZrtAaoudFpfH0JsPt9n+vySrj2ptEfdM3k4fMPvPccUf9Q2YvO
   36zPhwtuKu1Ld/dgptPeRzBOAZrSJbZV5pibHOLhYH0YCz4oiTMXATIMi
   MrCc9b0cGwHmODwEmLNKwgh2aG1mGyOlMgWV+xPs4n4LlWspDXszU2gF9
   zGGbMAJfCFXtSUlVqqGi5aKrvgxdJPrvzTG0DFRPm7bHkUsxqkJcSgGI9
   ix/Vrhjyhua47u4dkxLSyTYBBicI//bSNDbry25HT/LbsLMY9UkKQE9gz
   g==;
X-CSE-ConnectionGUID: CAHgs9wJT0OH8AUYy9+v9g==
X-CSE-MsgGUID: ja8YcO3BQuaUFHQkoCjVRQ==
X-IronPort-AV: E=Sophos;i="6.25,233,1779148800"; 
   d="scan'208";a="26266254"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 12:26:41 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:21655]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.166:2525] with esmtp (Farcaster)
 id 56275c21-e293-4b22-877d-03819bb14115; Thu, 20 Aug 2026 12:26:41 +0000 (UTC)
X-Farcaster-Flow-ID: 56275c21-e293-4b22-877d-03819bb14115
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 20 Aug 2026 12:26:41 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 20 Aug 2026 12:26:40 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: <miklos@szeredi.hu>, <--to=shuah@kernel.org>
CC: <fuse-devel@lists.linux.dev>, <--cc=linux-kernel@vger.kernel.org>,
	<--cc=linux-kselftest@vger.kernel.org>, <--cc=jack@suse.com>,
	<--cc=joannelkoong@gmail.com>, <--cc=bfoster@redhat.com>
Subject: [PATCH v2 0/2] fuse: zero the partial EOF page when extending a file
Date: Thu, 20 Aug 2026 12:26:25 +0000
Message-ID: <20260820122627.156961-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D032UWA004.ant.amazon.com (10.13.139.56) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Extending a fuse file past a non-page-aligned EOF does not zero the tail of
the old last page.  When that page is cached and has been mmap-dirtied beyond
the old EOF, the now in-bounds tail is served to later reads as stale data
rather than zeros, which violates POSIX file-extension semantics.

Some file systems get this zeroing automatically at writeback time
(block_write_full_folio() / iomap_writeback_handle_eof() zero the tail of the
folio straddling i_size).  A non-writeback caching fuse file system uses neither
path, so it has to zero the tail itself from the size-extending paths, like
XFS (xfs_file_write_zero_eof()) and ext4 (ext4_block_zero_eof()) do.
pagecache_isize_extended() cannot be reused: it is a no-op when
i_blocksize() >= PAGE_SIZE, and would increase the work in that function
for use cases that don't need it, if changed to support this situation.

Patch 1 adds fuse_zero_partial_eof_folio() and calls it up front from the
three paths that extend a file: buffered write, setattr, and
fallocate.  Patch 2 adds a self-contained raw /dev/fuse selftest covering each
path.

Tested by booting the patched kernel under User-Mode Linux and running the new
selftest, and reproduced against libfuse's passthrough_ll example daemon.

Changes since v1 [1]:
- Miklos and Jan Kara discussed whether there was a better pattern with less
  duplication between file systems.  Jan confirmed that other file systems do
  this zeroing themselves from their write/setattr paths (e.g. XFS
  xfs_file_write_zero_eof(), ext4 ext4_block_zero_eof()), because the block /
  iomap writeback that would otherwise zero the straddling folio does not run
  on this path.  File systems currently implement this separately.  It is
  beyond me to pursue unifying it.  Restructure to match the pattern in other
  file systems: zero [old EOF, write start) up front from fuse_perform_write()
  rather than after the fact from fuse_write_update_attr(), keyed on the write
  starting beyond EOF.
- This keeps the zeroed range disjoint from the written data, so a write that
  lands inside the old EOF folio is preserved by construction; the v1
  "pos - written" arithmetic and the fallocate double-call are gone.
- fuse_write_update_attr() goes back to being a pure attr update; the
  setattr/truncate call in fuse_do_setattr() is unchanged.
- The selftest is unchanged from v1.

[1] https://lore.kernel.org/all/20260731203842.540798-1-jamz@amazon.com/

Jimmy Zuber (2):
  fuse: zero the partial EOF page when extending a file
  selftests/fuse: test post-EOF page zeroing when a file is extended

 fs/fuse/dir.c                                 |   3 +
 fs/fuse/file.c                                |  56 +++
 fs/fuse/fuse_i.h                              |   1 +
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +
 .../filesystems/fuse/write_extend_eof_test.c  | 368 ++++++++++++++++++
 6 files changed, 432 insertions(+)
 create mode 100644 tools/testing/selftests/filesystems/fuse/write_extend_eof_test.c


base-commit: 7d87a5a284bb34edb3f4e7e312ef403b3385a7b7
-- 
2.50.1

