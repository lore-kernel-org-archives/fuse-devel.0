Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C390122F01
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892749; cv=none; b=JB4XzmWMpADCi0PV0p5OQCsKNYZRrKoHlwCdCU6Q2l8uN1mH9DPNAiL1t3BDRMeajJ8H4k/Sf5NFAAsch/myAgTIVjJ4lyuAUU3+bnlBZ9EYZlZr0KuwJ3ALZfVnIO1fV6rzI2bpVtmYQ3f9GeTusAqqhJjHzyMvxqSHIeGBShw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892749; c=relaxed/simple;
	bh=6mw68H2uehnHuf9t5DwgGpseB/nM1CpISmDUpfaWwzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bKycCodRINtFBz1qeLC5bDUKrC8agyBi3NaRAw/B8pv7Fe9d0DY91KIHTtic3eCifZiw+YljQF1CtmpVDjNkgwZ2YYk1tItL1oWD71SlRU/KXj5YESFaBbocc7bSo6LbMf2glVtA4YMozTQcMfBhYhhL5pwMFyeK/DFQQB7nIzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qlUkE0e0; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlUkE0e0"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65c37eafcbeso960770d50.1
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892747; x=1779497547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSBHmIlFtocoBj9YDR17kM9r8pmw+LN2cP4zbRLMJRA=;
        b=qlUkE0e0eU5athSDNuKWxTkhzuNQkWLIHs3VM4uA5Akdv/UIW9SsJaGgFy5KDujl15
         b7lY8yIcqQyrfN5ppvhuUwycCk/mVKyK1a3yp03Xb5TN5vX7/3jkySSauDc3yghGhxxW
         vP5LKoeejenSFdoxQjNJ6dS1bZ85kj2U290Z5Z68hZ56ntwbYmkP1lKDZxu/mBtyXHbg
         lpGdBrrbTZpT2+cY3IsVqxO0yxTVmcCgiYHlhR54MTMhxzapg3EHX31uXVoIymn0fN/8
         lYp53FnpaIcdKiNjj9Ey568zI2uZa/u8cIXo186XCGBJFbxMbJHKgH/7lZ4Y6vPJ6GQ8
         19Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892747; x=1779497547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zSBHmIlFtocoBj9YDR17kM9r8pmw+LN2cP4zbRLMJRA=;
        b=BHM9kIU5ytEliHSDjhr/bXr37Wda2+bANSIeLWGLZE2HsE05ZWGQ588oBK6Apkpo29
         zII8R64aEr5uwglGmJflcDpmXM063KIXHgCL1E8yBWzI9mb6jOSwnj4FONyoQH08xwaq
         YWtvePLrNcIlM84gwvR4btm25tREqUtzAJ2gaGnIj5xQgBFCvAAGXYByCbWEsaSJHQeN
         X5fpamWxV0IB8VcCqCf7VN3kvfS4HifejwPc7+gQOUFBQiZdA+Xq3FNtj/aum7A0/7jE
         MKdQ0iCK1UZwczemhOVhCcpYDsKhSpZNBYuYz8dxoFvjSHpuQYqFGuvGrurN/eww5mmQ
         Ylqw==
X-Gm-Message-State: AOJu0YyV2ma3eMnnkNO2wrp3cLnRzuna5ksRH0PjpuoTOsje3+FAkG9c
	uYTP1EfRd/5wtr5DhkRyqRDqmvznQ3LgmPWWiMawqfYhFFw6K8Bw1UXM
X-Gm-Gg: Acq92OGTde4eLOpSvwFECOeoUNw/L/HwGxvwOVC7+agC/EBBJIUYq1kZxMAmnJHyPcz
	EJh94+NMwtXCRd85U1Z0iJ2QAXOIcexPV99B3E5qmGKbY4ASRnCoanzZ/Q1+eoJxSVrJwCyV44E
	Mk/riLLRdvDjWA8yoCnCMPsDA2tZH/yuxBnKdJF9idg1lyFa3HwI9HCAOfYP53JsB1Y24kqekZu
	2ZirDtX6uc27RCmplD/b6KwItF2FTmRkJrvdajrjPkLyW0kV1MA5a/vlEdpHouohODk/BUETAZK
	YpfNV5PS9pErqf78sWoth6Y0/J+b3PjyPjA+zBQVe9XQ0O2MrKtdVAd4+00cVGPlQi/JFjFSjnC
	A2ZrVGITGvDI3NgMPFBNzu8qggZQkchiaIJSfMUr6EjO7QL4JVz4B6CahdsJjTSxmvhGGMCEGW7
	01xtGam3E+obORA9qL+5E/WjXLKLbmHB4=
X-Received: by 2002:a05:690e:b8d:b0:650:5316:1739 with SMTP id 956f58d0204a3-65e227f5c45mr6462788d50.35.1778892746740;
        Fri, 15 May 2026 17:52:26 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:14::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e3aa93cdasm44655d50.21.2026.05.15.17.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:26 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 04/21] fuse: implement passthrough for readdir
Date: Fri, 15 May 2026 17:39:47 -0700
Message-ID: <20260516004004.1455526-5-joannelkoong@gmail.com>
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

From: Amir Goldstein <amir73il@gmail.com>

Requires both requesting the passthrough inode op READDIR when setting
up the backing file and opening the dir with FOPEN_PASSTHROUGH.

The dir opened with FOPEN_PASSTHROUGH must not request cached readdir
with FOPEN_CACHE_DIR flag.

Like regular files, a directory inode cannot be opened at the same time
for cached readdir and readdir passthrough.

A directory opened without both FOPEN_CACHE_DIR and FOPEN_PASSTHROUGH
is marked as FOPEN_DIRECT_IO and does not affect io mode.

Note that opt-in for passthrough of READDIR operation means that there
is no READDIRPLUS call to server.

For the ls -l use case, the cost of FUSE_LOOKUP to server will be
paid for every entry, so passthrough of READDIR is not always a
performance win.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/fuse/backing.c         |  5 +++++
 fs/fuse/dir.c             |  7 +++++++
 fs/fuse/file.c            | 15 +++++++++++++--
 fs/fuse/fuse_i.h          |  7 ++++++-
 fs/fuse/iomode.c          |  9 ++++++++-
 fs/fuse/passthrough.c     | 24 ++++++++++++++++++++++++
 fs/fuse/readdir.c         |  3 +++
 include/uapi/linux/fuse.h |  1 +
 8 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 1fbb4d876eec..52fccb9ff283 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -114,6 +114,11 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 	    !d_is_reg(file->f_path.dentry))
 		goto out_fput;
 
+	res = -ENOTDIR;
+	if (map->ops_mask & FUSE_PASSTHROUGH_DIR_OPS &&
+	    !d_is_dir(file->f_path.dentry))
+		goto out_fput;
+
 	backing_sb = file_inode(file)->i_sb;
 	res = -ELOOP;
 	if (backing_sb->s_stack_depth >= fc->max_stack_depth)
diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 937165788e79..05f69b8fa4c4 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1891,6 +1891,7 @@ static const char *fuse_get_link(struct dentry *dentry, struct inode *inode,
 static int fuse_dir_open(struct inode *inode, struct file *file)
 {
 	struct fuse_mount *fm = get_fuse_mount(inode);
+	struct fuse_inode *fi = get_fuse_inode(inode);
 	int err;
 
 	if (fuse_is_bad(inode))
@@ -1904,6 +1905,12 @@ static int fuse_dir_open(struct inode *inode, struct file *file)
 	if (!err) {
 		struct fuse_file *ff = file->private_data;
 
+		err = fuse_file_io_open(file, inode);
+		if (err) {
+			fuse_sync_release(fi, ff, file->f_flags, true);
+			return err;
+		}
+
 		/*
 		 * Keep handling FOPEN_STREAM and FOPEN_NONSEEKABLE for
 		 * directories for backward compatibility, though it's unlikely
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 332032cd5622..828e3fc0ec31 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -180,8 +180,19 @@ struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
 		}
 	}
 
-	if (isdir)
-		ff->open_flags &= ~FOPEN_DIRECT_IO;
+	/*
+	 * Mark an uncached dir open as FOPEN_DIRECT_IO for fuse_file_io_open().
+	 * The explicit combination of FOPEN_PASSTHROUGH | FOPEN_DIRECT_IO is
+	 * allowed and it means (similar to regular files) a request from the
+	 * server for uncached readdir open for an inode that already has files
+	 * open in passthrough readdir mode.
+	 */
+	if (isdir) {
+		if (ff->open_flags & FOPEN_CACHE_DIR)
+			ff->open_flags &= ~FOPEN_DIRECT_IO;
+		else if (!(ff->open_flags & FOPEN_PASSTHROUGH))
+			ff->open_flags |= FOPEN_DIRECT_IO;
+	}
 
 	ff->nodeid = nodeid;
 
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 2436219338b3..23d2510f8e93 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1264,9 +1264,13 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 #define FUSE_PASSTHROUGH_RW_OPS \
 	(FUSE_PASSTHROUGH_OP_READ | FUSE_PASSTHROUGH_OP_WRITE)
 
+/* Passthrough operations for directories */
+#define FUSE_PASSTHROUGH_DIR_OPS \
+	(FUSE_PASSTHROUGH_OP_READDIR)
+
 /* File passthrough operations require a file opened with FOPEN_PASSTHROUGH */
 #define FUSE_PASSTHROUGH_FILE_OPS \
-	(FUSE_PASSTHROUGH_RW_OPS)
+	(FUSE_PASSTHROUGH_RW_OPS | FUSE_PASSTHROUGH_OP_READDIR)
 
 /* Inode passthrough operations for backing file attached to inode */
 #define FUSE_PASSTHROUGH_INODE_OPS (0)
@@ -1343,6 +1347,7 @@ ssize_t fuse_passthrough_splice_write(struct pipe_inode_info *pipe,
 				      struct file *out, loff_t *ppos,
 				      size_t len, unsigned int flags);
 ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma);
+int fuse_passthrough_readdir(struct file *file, struct dir_context *ctx);
 
 static inline bool fuse_passthrough_op(struct inode *inode, enum fuse_opcode op)
 {
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index e2e7fbaac9af..c83a070cd834 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -201,15 +201,20 @@ static int fuse_file_passthrough_open(struct inode *inode, struct file *file)
 	if (IS_ERR(fb))
 		return PTR_ERR(fb);
 
+	err = -EOPNOTSUPP;
 	/*
 	 * Inode ops passthrough requires backing file setup at
 	 * creation/lookup time.
 	 */
-	err = -EOPNOTSUPP;
 	if (!fuse_inode_backing(fi) &&
 	    (fb->ops_mask & FUSE_PASSTHROUGH_INODE_OPS))
 		goto fail;
 
+	/* Readdir passthrough requires opt-in on backing file setup */
+	if (S_ISDIR(inode->i_mode) &&
+	    !(fb->ops_mask & FUSE_PASSTHROUGH_OP_READDIR))
+		goto fail;
+
 	/* First passthrough file open denies caching inode io mode */
 	err = fuse_file_uncached_io_open(inode, ff, fb);
 	if (!err)
@@ -253,6 +258,8 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
 	/*
 	 * First passthrough file open denies caching inode io mode.
 	 * First caching file open enters caching inode io mode.
+	 * A directory opened without FOPEN_CACHE_DIR is marked with
+	 * FOPEN_DIRECT_IO and like regular file dio, does not affect io mode.
 	 *
 	 * Note that if user opens a file open with O_DIRECT, but server did
 	 * not specify FOPEN_DIRECT_IO, a later fcntl() could remove O_DIRECT,
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index 72de97c03d0e..a1d87ed51a94 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -144,6 +144,30 @@ ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma)
 	return backing_file_mmap(backing_file, vma, &ctx);
 }
 
+int fuse_passthrough_readdir(struct file *file, struct dir_context *ctx)
+{
+	int ret;
+	const struct cred *old_cred;
+	struct inode *inode = file_inode(file);
+	struct fuse_file *ff = file->private_data;
+	struct file *backing_file = fuse_file_passthrough(ff);
+	bool locked;
+
+	pr_debug("%s: backing_file=0x%p, pos=%lld\n", __func__,
+		 backing_file, ctx->pos);
+
+	old_cred = override_creds(ff->cred);
+	locked = fuse_lock_inode(inode);
+	/* Respect seekdir() on fuse dir */
+	vfs_llseek(backing_file, ctx->pos, SEEK_SET);
+	ret = iterate_dir(backing_file, ctx);
+	fuse_invalidate_atime(inode);
+	fuse_unlock_inode(inode, locked);
+	revert_creds(old_cred);
+
+	return ret;
+}
+
 /*
  * Setup passthrough to a backing file.
  *
diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index c88194e52d18..49226f022339 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -593,6 +593,9 @@ int fuse_readdir(struct file *file, struct dir_context *ctx)
 	if (fuse_is_bad(inode))
 		return -EIO;
 
+	if (fuse_file_passthrough(ff))
+		return fuse_passthrough_readdir(file, ctx);
+
 	err = UNCACHED;
 	if (ff->open_flags & FOPEN_CACHE_DIR)
 		err = fuse_readdir_cached(file, ctx);
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 0f1e1c1ec367..df366e390f0c 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -1142,6 +1142,7 @@ struct fuse_backing_map {
 /* op bits for fuse_backing_map ops_mask */
 #define FUSE_PASSTHROUGH_OP_READ	FUSE_PASSTHROUGH_OP(FUSE_READ)
 #define FUSE_PASSTHROUGH_OP_WRITE	FUSE_PASSTHROUGH_OP(FUSE_WRITE)
+#define FUSE_PASSTHROUGH_OP_READDIR	FUSE_PASSTHROUGH_OP(FUSE_READDIR)
 
 /* Device ioctls: */
 #define FUSE_DEV_IOC_MAGIC		229
-- 
2.52.0

