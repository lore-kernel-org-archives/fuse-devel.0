Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793624187;
	b=dzCe6BNZbhWZEO8rPHmeuvvZ9l8YBhzUUrj4gydP/73NA+7qWZEc2EFj6/xoByPn5IQM
	 LeggE47LkTcKu5RL0EP3BbGxixwZuEVPFv++z7oK6foU7NdWnG/PbTNRDiabbDgYc58q9
	 +EVsFfuqGa/se6SLjX1URnsN2kxA+hSnIUtfzAZmVqQ2RHBwUbQcNashNh94Y6QFb6Qov
	 Uf39GpUQ7bu2JzYb240bLpU2nO7NOt5gHfzNeBsokBmjqx13AUu1cAxBfUrMQFZY8Rt9E
	 3qc/rKEqzjLeyTabgq1Uyv8nnKp1e9tKjZQhJ3XF0Y0WBMwh7n1acgymRv9m5YTFuUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624187;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wY2lxSBOT5vrFfsC6nW4WFwo3U7fyupwQAGbfep51T8=;
	b=B8j6rBsZ5jK5Og5qzF4uINoctoknKEjDfhZzztTekt9UwC430cnjtpXswkw1EKoEP59B
	 v2s+SOSX/eyV9fYEGiSVgjjV3NVTNtIm1osWi2xaKjZGcuAMxPexD90bR2pUYUGB1Cv/O
	 PstzY/yPGfqQCeeBZHM0K/g1n5d5h2ukdA9bSLZ7i1PO/FjfuJb8EWfDonTkQb/kjZTTE
	 omo/6qLzNMFRsqa67oSLdouEzDAK9w8/SdZaITo6bDgMz+kMK2lTjqnaEXHuTPdN52JDp
	 unYg6RulZlX29VDSY5T0iVez5B6R6pvNjWf8JYRzxWSNNlaqFa5KbockZyf6ilc72/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DEkMkzSW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771B5606A32C;
	Mon,  2 Nov 2026 12:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DEkMkzSW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793624186;
	b=CQHqpHoV8sJsVZyjuTBbEdRxzkBTZIhJYcakFbaS4xSke5CSIzA3opxCDuxwRho9B0U/
	 RhTFIDLdgczEej4Wd96tzJGMS4F627xdOfZ6Zm2gS8dLiIbK5TnFZBoVrb1oIe/iZafbV
	 tIT3UmImS0floZ+vTKThAjIYFizTzqak3vuQM6cXzMAYNxV5Ge1Iune9aL+O5ev6ijJ0B
	 UC6K5azNfz2B4B4o0IC7/bsh9xt71rgBrfeRA3xibEjKOMg1IcGMndBf0JlcgL2HUc0lr
	 8wb4/JbtUefWWyHpMm07R9mdDfQAztmIKWiIwY9YWXeZzO0u9JkqDxehVlid+HTccNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793624186;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=wY2lxSBOT5vrFfsC6nW4WFwo3U7fyupwQAGbfep51T8=;
	b=DXx/o/2dZ68+ui7fcmlI4cRwltQYMiV7UADxiJu/5iIH9mXTG4c96PR7kWcqwxVV9Z+J
	 XZRUeOvou/ugBNsh30GJzVE4tq6F78jFDfLdDi7gBEHnagfHpkJCkmhVXW7e15a6fwIcn
	 r2vqMGHteZRHjn5xCnUbqS5XAf3ba1whoqbM6JTfNAjqR+0mdkhrBdpuKvpUTnToGqHCG
	 w1bkabICZv/rKulf+3D1U28Yvh11fz4vVg9j/X2y3TipyCoMoCulhvzVmqg7//oXEDWm8
	 0qZuLSWZcz+99aZdXyrG22/AgpRizKtcT/hILC06JHn5TZ+bwvhGJj0N+UqxwnrIGVQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BA2311F00A16;
	Mon,  2 Nov 2026 12:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793624186;
	bh=wY2lxSBOT5vrFfsC6nW4WFwo3U7fyupwQAGbfep51T8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=DEkMkzSW52v5w57J3ryR8frfFUlO/titOAmyt+f3DJMs8BWJdqFL1VGzuntrSF1wA
	 IsM4efMUFLGs9yTrJe48jZpzDAGavhbhbC5x98jKtMGVJStcyc23SPlC9tdZSnVIah
	 8DdWmDudUMQk2VleCaHabjiwx7sOa97+Exn2wtA6nOD/+lIpB4wwvknNpiRqT0YkxG
	 Pemxp9oyq40bd4vJiHyhvLlvjDw5Pk+NsqvoG6k0Ym4w9cix8OrAUCwQSWkDzoXipp
	 m2e4kMr/niuDnFDGGpXZdpCPDh1eVhuEtn5WzvaflrUKlHkdjhj0/HxWLjuj5iEsi8
	 d0bR8Wz1KiiHw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1C91C464E1;
	Mon,  2 Nov 2026 12:56:25 +0000 (UTC)
From: Joas Antonio dos Santos via B4 Relay <devnull+joasantonio108.gmail.com@kernel.org>
Date: Mon, 02 Nov 2026 12:56:25 +0000
Subject: [PATCH] fuse: ignore FUSE_ATTR_DAX unless a dax backing is
 possible
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261102-fuse-attr-dax-v1-1-36f7b859b034@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHiI6GoC/x3MTQqAIBBA4avErBvwD4OuEi1Ex5qNhVYE4t2Tl
 t/ivQqFMlOBeaiQ6eHCR+qQ4wB+d2kj5NANSigrpVAY70LoritjcC96qe0UrNcmGujNmSny+/+
 WtbUPrInlzF8AAAA=
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Joas Antonio dos Santos <joasantonio108@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793624184; l=3369;
 i=joasantonio108@gmail.com; s=20261031; h=from:subject:message-id;
 bh=m4kc2zrIGru9miJ8HcufOYYEsonQia+fldC1h5teqrA=;
 b=FUjn2InbGAOhJkic3l8cIBqSwFOfOIPtATzqgu8Nf6MdMv9gjJW02YiPtIvwEBnXee7S0p3l3
 Sei5/UYz88zCfquXH7GRgA++ev+vPoczULuaOIg/0P2hPf7AAmJ0Jo9
X-Developer-Key: i=joasantonio108@gmail.com; a=ed25519;
 pk=ZxAznJT/FcPPdzLrDDFJQm4LLjjHVGBBqDSG3TXS23w=
X-Endpoint-Received: by B4 Relay for joasantonio108@gmail.com/20261031 with
 auth_id=1371
X-Original-From: Joas Antonio dos Santos <joasantonio108@gmail.com>
Reply-To: joasantonio108@gmail.com
Content-Transfer-Encoding: 7bit

From: Joas Antonio dos Santos <joasantonio108@gmail.com>

fuse_init_inode() trusts FUSE_ATTR_DAX from any server: it sets S_DAX and
switches the mapping to fuse_dax_aops, which has no ->read_folio and no
->readahead.  The open path only refuses such an inode without
FOPEN_PASSTHROUGH through an IS_DAX() check in fuse_file_io_open().

With CONFIG_FS_DAX=n, S_DAX is 0, so IS_DAX() is always false and that
check compiles away.  The file is opened for normal cached I/O on a
mapping without ->read_folio, and the first read() calls a NULL
function pointer from read_pages():

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  pc : 0x0
  lr : read_pages+0x5b4/0x830
   page_cache_ra_order
   page_cache_sync_ra
   filemap_get_pages
   filemap_read
   generic_file_read_iter
   fuse_file_read_iter

Any server can do this, including an unprivileged one mounted through
fusermount3 or in a user namespace: answer LOOKUP of a regular file with
FUSE_ATTR_DAX set and a normal OPEN.  mmap() of the file reaches the same
NULL ->read_folio through filemap_fault().

As the commit adding it says, FUSE_ATTR_DAX is only meant to be used
with FUSE_PASSTHROUGH_V2 and a dax device backing, which needs FS_DAX.
Only honour it in that case.

Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
---
Found by reviewing the v7.4-rc1 fs/fuse changes with an LLM-based
assistant, following up on the Sashiko review of the dax backing series
that pointed out the missing ->read_folio; the IS_DAX() check added for
it does not cover CONFIG_FS_DAX=n.

Tested on arm64 QEMU, v7.4-rc1 with CONFIG_FS_DAX=n and KASAN, with a
FUSE server running as uid 65534 in a user namespace that replies
INIT with no flags, LOOKUP with FUSE_ATTR_DAX and a plain OPEN:
before, read() oopses as above; after, the read returns the file data
and unmount is clean.  The FUSE_ATTR_DAX=0 control is unchanged.

This also keeps an unprivileged server from getting S_DAX on
CONFIG_FS_DAX=y kernels without FUSE_PASSTHROUGH_V2, which is where
"fuse: refuse FUSE_NOTIFY_STORE for DAX inodes" (sent 2026-10-31)
applies; that patch is still useful for servers that do negotiate
FUSE_PASSTHROUGH_V2.
---
 fs/fuse/inode.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 1341b681d0ed..7195e4d0852c 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -418,7 +418,14 @@ static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
 		fuse_init_common(inode);
 		fuse_init_file_inode(inode, attr->flags);
 
-		if ((attr->flags & FUSE_ATTR_DAX) && !fuse_inode_vdax(inode)) {
+		/*
+		 * FUSE_ATTR_DAX is only meaningful for a dax device backing,
+		 * which needs FS_DAX and FUSE_PASSTHROUGH_V2.  Without FS_DAX
+		 * S_DAX is 0 and the inode would be left with fuse_dax_aops
+		 * on the page cache I/O paths.
+		 */
+		if (IS_ENABLED(CONFIG_FS_DAX) && fc->backing_id_64 &&
+		    (attr->flags & FUSE_ATTR_DAX) && !fuse_inode_vdax(inode)) {
 			inode->i_flags |= S_DAX;
 			inode->i_data.a_ops = &fuse_dax_aops;
 		}

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-fuse-attr-dax-c1367d6c34f4

Best regards,
-- 
Joas Antonio dos Santos <joasantonio108@gmail.com>


