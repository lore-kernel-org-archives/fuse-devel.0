Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8259925228D
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892761; cv=none; b=Dphx7pD85yMOZ855JBWDl57kojZ4DcgQuHIXzsgnv3kMapYhtrJqRWOzz/FpcijPiPXFO3w6t0yaDsvFNgKUQOvqfVzbvIoXYIQ6fKB5Avxjb2YeU9iGIxFVoZ2ns2IQVHInO/kWMo/XXEtu4TAK2w+UaJmULwfj7wvAE+LFOHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892761; c=relaxed/simple;
	bh=lLdpotCUsht2qaq4mXRTrMfqvzVTPAnSJyr+/mVop2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOAbFnVEvO7nWrsUkjETIwFHkuqkUP0gVDNunfq7pS5YtBOVw5unLCrGYjt8dlBbMLbke4sT+jkZB/e+OxhNteeqps/MOx+HD/PFz2X6Bm2z/6acaJXChobbVl6PJmzDEH8pHeyinDm+BQDH/s/Ijn/DKRLc8XZCVKQWIFWWeR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouExWyLb; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouExWyLb"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7bd87e5d8ffso571227b3.1
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892760; x=1779497560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Urxb7Eo6y8gUTxPrcWK52f4AkyOlabcVOIpv6BZ71xU=;
        b=ouExWyLbwGV9u33N45mgUw3BLQrkm7C5FT8CL7bFxf1Jvtvr+f6fYoAvMXldrEFog6
         Uy+bchL5Rk2dsrm5awXAybgU3pEpRVhnmM1GeijWuqDojPyoiIvM7Aehx/ri2VUiCQIb
         bNpjCr3Hd0k9rybzfeLAoycTnGnZX62jbii9W/PFrlKH0dmVr1a1C03MyWCWfBOi42nI
         yIlj/a4D1kMotTIDfueEqx9VZCMv6QjIqAZQN/an8cdm+5xJmjCOOS3DDkrFABwe5YI/
         N/3xPpGQiltZ1kRN7gmNMfwdazjLKSeZuCx20Rt1qHUzEYlnxLvZj+E6Mws8fcdWl/BB
         1CEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892760; x=1779497560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Urxb7Eo6y8gUTxPrcWK52f4AkyOlabcVOIpv6BZ71xU=;
        b=fxVrQYvAUTFxquaFVKm+jUDk/eTjcGcFXfdAtg0871ezl7JG82R+J5OQp0/g8V/VIO
         S8RF5zct8ENK3TILsY+/mP0n4Z3oklD/74kMg720kazy/di7nQa6N1kc13GX2DMuQpVS
         NY9Cgv4RFBN4+rU03uqLx0BjJMODFz9mlwBLDixZryVb0xJ35GRJd2EZ8SXlLzoynXwi
         F5+zXFQY3lb7jHieEy1XQA84PY30PZB1e20ms45oo1z0C3ZNtWUNYn3gGme3vZTq3o0v
         LCjQAfK4UuMVfBUcGRGXswMvU0ayIwz8zIss8sTM+Uok0H5zfAdWTqcbvr/gJ2mENpzC
         oqfQ==
X-Gm-Message-State: AOJu0Yy5vr2xHzYTkniJRO+eG0VgbmTJ6pEtXlfG/kGHq+/38ep6MpcW
	2wNUxTybdajX8h3FWShfwwy88fGWRHgQkH0eZhUYgS4EXreKSewsy7kV
X-Gm-Gg: Acq92OFNwz6jou1HSoeBPgOec75Ef/LxeSGiLtPQ6UOLQqDE5lsiWYSF88n2CKXHSj6
	zG7v1A64dB9VG1gONMXJ1FNfqn6hReLPyYiuWUHHOoHzWcgBNWJAPteYdIEEZNxLXgzwouVBuxn
	6Fz/wLHb7ZgJxB1nuxhE+y7O/TM+aAUNmoRxP3CVX99x2NgWly4lO/62HGEEA1StVTL4xgYqPUU
	j09pehHOHvr6TKPuzxKPWkUeiM7QE/V/J2IeeWN4Ea9yW9n9B6f2wneUpKEvLUvy4LSsJO4gGZn
	XIYfYi4oIA81EN7YRmc6u6PhJFLohnlcl5ZOuJvzP3ue/z1qZzvMVaP4cUsxaLOCZn0qBM+4+5v
	ZOtKmNVKG5ygyuiRXzpDk/kNtms7Ol3lBvmc7gHUL08td2m3wDgK50MN7jGJcX1x97X0xXnmsug
	ZxJVLDp8pXE+1arvlM+mkh
X-Received: by 2002:a05:690c:4427:b0:7bf:ff7:ea71 with SMTP id 00721157ae682-7c948ef4755mr50746107b3.17.1778892759647;
        Fri, 15 May 2026 17:52:39 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:11::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f21dbeccsm37662437b3.4.2026.05.15.17.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:39 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 09/21] fuse: handle partial io passthrough for read/write, splice, and mmap
Date: Fri, 15 May 2026 17:39:52 -0700
Message-ID: <20260516004004.1455526-10-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260516004004.1455526-1-joannelkoong@gmail.com>
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Servers can now pass through only reads or writes instead of being
required to pass through both. When the read or write operation is not
passed through, fall back to direct io for handling it. This avoids
cache coherency issues from mixing the backing file's page cache with
the fuse inode's page cache.

Reject mmap when passthrough is partial or not set for read/writes since
mmap requires both read and write access to the backing page cache.

The FOPEN_DIRECT_IO check in the read/write fallback is not strictly
needed as the caller already handles it, but including it here makes
the fallback logic self-contained.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/file.c        |  7 ++++---
 fs/fuse/fuse_i.h      |  3 +++
 fs/fuse/passthrough.c | 18 ++++++++++++++++++
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 1173811b2ea7..5b70d8272700 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1781,7 +1781,7 @@ static ssize_t __fuse_direct_read(struct fuse_io_priv *io,
 
 static ssize_t fuse_direct_IO(struct kiocb *iocb, struct iov_iter *iter);
 
-static ssize_t fuse_direct_read_iter(struct kiocb *iocb, struct iov_iter *to)
+ssize_t fuse_direct_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
 	ssize_t res;
 
@@ -1796,7 +1796,7 @@ static ssize_t fuse_direct_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	return res;
 }
 
-static ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *from)
+ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
 	ssize_t res;
@@ -1884,7 +1884,8 @@ static ssize_t fuse_splice_write(struct pipe_inode_info *pipe, struct file *out,
 	struct fuse_file *ff = out->private_data;
 
 	/* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
-	if (fuse_file_passthrough(ff) && !(ff->open_flags & FOPEN_DIRECT_IO))
+	if (fuse_passthrough_op(file_inode(out), FUSE_WRITE) &&
+	    !(ff->open_flags & FOPEN_DIRECT_IO))
 		return fuse_passthrough_splice_write(pipe, out, ppos, len, flags);
 	else
 		return iter_file_splice_write(pipe, out, ppos, len, flags);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 9e5142a94a09..a1034533ce60 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1261,6 +1261,9 @@ struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
 void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 		       unsigned int open_flags, fl_owner_t id, bool isdir);
 
+ssize_t fuse_direct_read_iter(struct kiocb *iocb, struct iov_iter *to);
+ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *from);
+
 /* passthrough.c */
 
 /* READ/WRITE are implied by FOPEN_PASSTHROUGH, but defined for completeness */
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index f2025772c9c1..d62a1c751157 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -44,6 +44,10 @@ ssize_t fuse_passthrough_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 	if (!count)
 		return 0;
 
+	if ((ff->open_flags & FOPEN_DIRECT_IO) ||
+	    !fuse_passthrough_op(file_inode(file), FUSE_READ))
+		return fuse_direct_read_iter(iocb, iter);
+
 	ret = backing_file_read_iter(backing_file, iter, iocb, iocb->ki_flags,
 				     &ctx);
 
@@ -70,6 +74,10 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
 	if (!count)
 		return 0;
 
+	if ((ff->open_flags & FOPEN_DIRECT_IO) ||
+	    !fuse_passthrough_op(inode, FUSE_WRITE))
+		return fuse_direct_write_iter(iocb, iter);
+
 	inode_lock(inode);
 	ret = backing_file_write_iter(backing_file, iter, iocb, iocb->ki_flags,
 				      &ctx);
@@ -91,6 +99,9 @@ ssize_t fuse_passthrough_splice_read(struct file *in, loff_t *ppos,
 	struct kiocb iocb;
 	ssize_t ret;
 
+	if (!fuse_passthrough_op(file_inode(in), FUSE_READ))
+		return copy_splice_read(in, ppos, pipe, len, flags);
+
 	pr_debug("%s: backing_file=0x%p, pos=%lld, len=%zu, flags=0x%x\n", __func__,
 		 backing_file, *ppos, len, flags);
 
@@ -133,6 +144,9 @@ ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct fuse_file *ff = file->private_data;
 	struct file *backing_file = fuse_file_passthrough(ff);
+	struct inode *inode = file_inode(file);
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct fuse_backing *fb = fuse_inode_backing(fi);
 	struct backing_file_ctx ctx = {
 		.cred = ff->cred,
 		.accessed = fuse_file_accessed,
@@ -141,6 +155,10 @@ ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma)
 	pr_debug("%s: backing_file=0x%p, start=%lu, end=%lu\n", __func__,
 		 backing_file, vma->vm_start, vma->vm_end);
 
+	/* mmap requires both read and write passthrough */
+	if ((fb->ops_mask & FUSE_PASSTHROUGH_RW_OPS) != FUSE_PASSTHROUGH_RW_OPS)
+		return -ENODEV;
+
 	return backing_file_mmap(backing_file, vma, &ctx);
 }
 
-- 
2.52.0

