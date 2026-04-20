Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05B33876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723527; cv=none; b=J7YQu7ppGEjm3g6AvvH+iitfIuDvc0UTKwQHj/v/FVfYg3gCYmo40XY66HDLaEeCGii3g1WdSlml43D1woSkkC3A0c4Ym5qr9SLIq+Hp5TvCL/lx6H+e3KOhWgYSU8L7uQEZpLM5EWh0VBzI2BU/+wBMUgMC9OxlSqrT2SAup1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723527; c=relaxed/simple;
	bh=PCWC4Y5NYPJUMqfsrys1M6FrOES94PHYiA32E0vi3R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQr0CGNir/LFDRUk+X1HjRsiQnBfX6Y40TM3fIrUUz5/dMiD1+ythmuzDj2zIRxfVSQgTvnx8sS5aS+z9OcO1VE74abT7rXAA5PWfBLHvmMgiB798+Nh1U2bSuq/I+sYTbGbsIbw+/3aJC82bfs4hylqbRtouedWZjFrD4vEkOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MT7NfVgd; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MT7NfVgd"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b24fdac394so33947935ad.3
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723525; x=1777328325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dLK79G6FTeXZEed3MWkEzaAwoKlVX+UHcbIxp5W/kM=;
        b=MT7NfVgd9hCQw7LjFHYfcFWIkNjXr4IJRs6be8ae9/iZBmp92pe9UvT4a4kwOaRf/u
         w2dmJr8szkYLTNxlWwsRTi4wF15rAbpeP/Wc3jJrwFWQJYi+pXO53czwEsOqSjDr7LRM
         pAgSx+bMxgPgCqDpCgMyE9ErxqTAZfiQBMEkNuYmgts0oRbtQW/0l+I0DEJ6HqYaoPOg
         MzqQNYRHVumMjqB5KYZ7SPi9tFREZ82C+A/V+DJYIkJn0l54cBodK/rsw1UnVhgURNpg
         mFVrPwgi9j9PlV+owJ++Xbq5lgT3PMOn4aUDICCACKW51VrpsA8WiTNaHQ7dQg6bim9C
         4uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723525; x=1777328325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2dLK79G6FTeXZEed3MWkEzaAwoKlVX+UHcbIxp5W/kM=;
        b=GRdfZSLsxi067lwWimWWnlRWQ6WUUXXMBLY5SSYBF6u+hgu//20N2EFyTLdy/feC1O
         H8uOoaV5zW8NMybPWiICcGfi/srbI2IGAGPvfCLQ+3cVCqVbNAzRtNblnuBo9X51EieP
         ckGipaPhoaMcPOns1WOoU58D2k0AM2Y2wUrp2KxKq0tMkqgfDCa2V5JRbjTkB1SCrlHF
         R5mp5++popgcOSCDak3r+abeknaAZadu0ktXd3/OElkVFtILZvVPvc1OnSb/y6/GtN3g
         LVNjHnIWlS3J6R5hX6SbV9ia46utkcJaxYMErX3nSQjBSZAI9Jl0nuDDc1Le4oJ7QcYJ
         07UQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ZQSvwJsjAMqyJzar8U7u19ZRLaUUb8yUmjdCC5Q2gypgKmT7TchU7uSd8Mm7MV6WOO2/V/ZrlEC1+@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+5M2TFlFn/jGdfufn1BSGAajoSzkZAsGbNq+7HELZJvx4xbSB
	nvfM3fLFpSYg4jDF8AN90HWBJIm2nzUW2E9g8a1Jvn0pragG6xGmnOI/
X-Gm-Gg: AeBDiet/M7KY6Te6POxTnborwVE3bUKeL7DAWfNsux2mkSn8shukgHD9oXVSe+XZstQ
	zCfDgTmqnzVHx/AWpIuzalmFefoMGYwJdZabLS+GDzA3IeOcKC9h+qMAObmOZW83yKWG+z2RYrn
	iKZJu3dtjTR0Hxw8QQkPZnYUoEY8Lpg81T94vvSyLENIBETn9MaSlv5OBnG/+EU325kN28/6Iep
	KIaJoxu4Ladi2kTcFk8iZ9RVYKw+dixV91/Jp0najEPH+Zfx1Jk9LXFY8auOClqslC1NMtVt0N5
	UZ/boKYhpyiSWoJC/V8uAUVTcmu0cbGGZ/p7fSP1sqJ+nqjE+kC8o/ASvFaHXJPMSnVNEK85zif
	MJ91QEyhzu4u9qz0s5/VhyU0Rt2Fr/IgJOetfPM4mx1W2yd/iB+9R5X/tNDPRbGGgsZtC0PvnDE
	64yEmVBIxQEv6vkH7IFVSWyimyTeb3
X-Received: by 2002:a17:903:3905:b0:2b2:5840:80c5 with SMTP id d9443c01a7336-2b5fa007e8dmr159421485ad.37.1776723525219;
        Mon, 20 Apr 2026 15:18:45 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:72::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm111850045ad.20.2026.04.20.15.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:44 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 08/17] fuse: add passthrough ops gating
Date: Mon, 20 Apr 2026 15:16:28 -0700
Message-ID: <20260420221637.2631478-9-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260420221637.2631478-1-joannelkoong@gmail.com>
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Route existing callers through a passthrough ops mask check to verify
whether passthrough can be called for the operation or not. The check is
only done when FUSE_PASSTHROUGH_INO mode is enabled, which preserves
backwards compatibility with prior passthrough behavior.

It is safe to get the backing file by accessing ff->passthrough directly
in passthrough.c because passthrough.c is only compiled with
CONFIG_FUSE_PASSTHROUGH=y and the caller has already done the ops check.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/file.c        | 14 ++++++++------
 fs/fuse/fuse_i.h      | 14 +++++++++++++-
 fs/fuse/passthrough.c | 12 ++++++------
 fs/fuse/readdir.c     |  2 +-
 4 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index e719c54c12d2..a1de70bc589d 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -324,7 +324,7 @@ static void fuse_prepare_release(struct fuse_inode *fi, struct fuse_file *ff,
 	struct fuse_conn *fc = ff->fm->fc;
 	struct fuse_release_args *ra = &ff->args->release_args;
 
-	if (fuse_file_passthrough(ff))
+	if (fuse_file_passthrough(&fi->inode, ff, 0))
 		fuse_passthrough_release(ff, fuse_inode_backing(fi));
 
 	/* Inode is NULL on error path of fuse_create_open() */
@@ -1838,7 +1838,7 @@ static ssize_t fuse_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	/* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
 	if (ff->open_flags & FOPEN_DIRECT_IO)
 		return fuse_direct_read_iter(iocb, to);
-	else if (fuse_file_passthrough(ff))
+	else if (fuse_file_passthrough(inode, ff, FUSE_PASSTHROUGH_OP_READ))
 		return fuse_passthrough_read_iter(iocb, to);
 	else
 		return fuse_cache_read_iter(iocb, to);
@@ -1859,7 +1859,7 @@ static ssize_t fuse_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	/* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
 	if (ff->open_flags & FOPEN_DIRECT_IO)
 		return fuse_direct_write_iter(iocb, from);
-	else if (fuse_file_passthrough(ff))
+	else if (fuse_file_passthrough(inode, ff, FUSE_PASSTHROUGH_OP_WRITE))
 		return fuse_passthrough_write_iter(iocb, from);
 	else
 		return fuse_cache_write_iter(iocb, from);
@@ -1872,7 +1872,8 @@ static ssize_t fuse_splice_read(struct file *in, loff_t *ppos,
 	struct fuse_file *ff = in->private_data;
 
 	/* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
-	if (fuse_file_passthrough(ff) && !(ff->open_flags & FOPEN_DIRECT_IO))
+	if (fuse_file_passthrough(file_inode(in), ff, FUSE_PASSTHROUGH_OP_READ) &&
+	    !(ff->open_flags & FOPEN_DIRECT_IO))
 		return fuse_passthrough_splice_read(in, ppos, pipe, len, flags);
 	else
 		return filemap_splice_read(in, ppos, pipe, len, flags);
@@ -1884,7 +1885,8 @@ static ssize_t fuse_splice_write(struct pipe_inode_info *pipe, struct file *out,
 	struct fuse_file *ff = out->private_data;
 
 	/* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
-	if (fuse_file_passthrough(ff) && !(ff->open_flags & FOPEN_DIRECT_IO))
+	if (fuse_file_passthrough(file_inode(out), ff, FUSE_PASSTHROUGH_OP_WRITE) &&
+	    !(ff->open_flags & FOPEN_DIRECT_IO))
 		return fuse_passthrough_splice_write(pipe, out, ppos, len, flags);
 	else
 		return iter_file_splice_write(pipe, out, ppos, len, flags);
@@ -2397,7 +2399,7 @@ static int fuse_file_mmap(struct file *file, struct vm_area_struct *vma)
 	 * in passthrough mode, either mmap to backing file or fail mmap,
 	 * because mixing cached mmap and passthrough io mode is not allowed.
 	 */
-	if (fuse_file_passthrough(ff))
+	if (fuse_file_passthrough(inode, ff, FUSE_PASSTHROUGH_RW_OPS))
 		return fuse_passthrough_mmap(file, vma);
 	else if (fuse_inode_backing(get_fuse_inode(inode)))
 		return -ENODEV;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index a15fb508fd28..45d9184d0f7a 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1630,9 +1630,21 @@ static inline struct fuse_backing *fuse_inode_backing_set(struct fuse_inode *fi,
 struct fuse_backing *fuse_passthrough_open(struct file *file, int backing_id);
 void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing *fb);
 
-static inline struct file *fuse_file_passthrough(struct fuse_file *ff)
+static inline struct file *fuse_file_passthrough(struct inode *inode,
+						 struct fuse_file *ff,
+						 u64 passthrough_ops)
 {
 #ifdef CONFIG_FUSE_PASSTHROUGH
+	if (!ff->passthrough)
+		return NULL;
+
+	if (ff->fm->fc->passthrough_ino && passthrough_ops) {
+		struct fuse_backing *fb = fuse_inode_backing(get_fuse_inode(inode));
+
+		if (!fb || (fb->ops_mask & passthrough_ops) != passthrough_ops)
+			return NULL;
+	}
+
 	return ff->passthrough;
 #else
 	return NULL;
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index 514e4af46d79..8ecce2a97ee8 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -29,7 +29,7 @@ ssize_t fuse_passthrough_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 {
 	struct file *file = iocb->ki_filp;
 	struct fuse_file *ff = file->private_data;
-	struct file *backing_file = fuse_file_passthrough(ff);
+	struct file *backing_file = ff->passthrough;
 	size_t count = iov_iter_count(iter);
 	ssize_t ret;
 	struct backing_file_ctx ctx = {
@@ -56,7 +56,7 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file_inode(file);
 	struct fuse_file *ff = file->private_data;
-	struct file *backing_file = fuse_file_passthrough(ff);
+	struct file *backing_file = ff->passthrough;
 	size_t count = iov_iter_count(iter);
 	ssize_t ret;
 	struct backing_file_ctx ctx = {
@@ -83,7 +83,7 @@ ssize_t fuse_passthrough_splice_read(struct file *in, loff_t *ppos,
 				     size_t len, unsigned int flags)
 {
 	struct fuse_file *ff = in->private_data;
-	struct file *backing_file = fuse_file_passthrough(ff);
+	struct file *backing_file = ff->passthrough;
 	struct backing_file_ctx ctx = {
 		.cred = ff->cred,
 		.accessed = fuse_file_accessed,
@@ -107,8 +107,8 @@ ssize_t fuse_passthrough_splice_write(struct pipe_inode_info *pipe,
 				      size_t len, unsigned int flags)
 {
 	struct fuse_file *ff = out->private_data;
-	struct file *backing_file = fuse_file_passthrough(ff);
 	struct inode *inode = file_inode(out);
+	struct file *backing_file = ff->passthrough;
 	ssize_t ret;
 	struct backing_file_ctx ctx = {
 		.cred = ff->cred,
@@ -132,7 +132,7 @@ ssize_t fuse_passthrough_splice_write(struct pipe_inode_info *pipe,
 ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct fuse_file *ff = file->private_data;
-	struct file *backing_file = fuse_file_passthrough(ff);
+	struct file *backing_file = ff->passthrough;
 	struct backing_file_ctx ctx = {
 		.cred = ff->cred,
 		.accessed = fuse_file_accessed,
@@ -150,7 +150,7 @@ int fuse_passthrough_readdir(struct file *file, struct dir_context *ctx)
 	const struct cred *old_cred;
 	struct inode *inode = file_inode(file);
 	struct fuse_file *ff = file->private_data;
-	struct file *backing_file = fuse_file_passthrough(ff);
+	struct file *backing_file = ff->passthrough;
 	bool locked;
 
 	pr_debug("%s: backing_file=0x%p, pos=%lld\n", __func__,
diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 49226f022339..1f2ff63cd317 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -593,7 +593,7 @@ int fuse_readdir(struct file *file, struct dir_context *ctx)
 	if (fuse_is_bad(inode))
 		return -EIO;
 
-	if (fuse_file_passthrough(ff))
+	if (fuse_file_passthrough(inode, ff, FUSE_PASSTHROUGH_OP_READDIR))
 		return fuse_passthrough_readdir(file, ctx);
 
 	err = UNCACHED;
-- 
2.52.0

