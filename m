Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4FF3876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723542; cv=none; b=kH+luMoFC37ekAX45m9l6ZB9zb8J364c/HRFh621NJDsWuj7sQwSDkxHIIyLnbhJEnGi5R7tc5lOGc4X4sYAaSuLwSv0jXw3pC3ERWh+/mjbxSo6iRA9e5jfeO/4fWZRYDuLlwVMdkT47tyxeMdXZNdQdgKnPHqFABnm/3oPqvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723542; c=relaxed/simple;
	bh=aGkErjM6ZvL0RrfJhKTfP/i56QoR7Dpv51Ubbc33zLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=By0ZiNp8ijvfyGD0EbBkOoTZKU0tNakFjpMgEL8ZImk52RbORZbKcPtDyA81PqA9rzF9pk+8BBYP+bMjcy7Ai8fkK1dlROUlObPuwbt9fzlGEujIUYS1Grz2IkZ9uTwdGRYAHZ6lIAtxL1qM3/9JwN9MVag/Fyy0BVtRRwtSWqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4ARrrFt; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4ARrrFt"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a9296b3926so20524335ad.1
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723540; x=1777328340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4H5GsvbxoE5+/z3cSTlcVrGPTXhWnAs/RqeR2VWh+k=;
        b=Y4ARrrFtBERHpFYv0kF6CRacRXEIFSJP4rGLB7scW2ONR6/DltmEAsvFz6lqlnUohJ
         wa6PdAMTdXEu0a/vgmmXlbH4dPHQgUS2/P2ZleRZUPJgY336nq84DPnQbJtLlJ93Nesv
         gQOZZO7IaDYIudevDvdRMQ+0FgRbrzga3Jfcsn5CEYk1C8z0ky5IOaIJvo+4L8r4mQSt
         RIh8IJ3lFjI6z0RqJVtec60/j4tjyNE+PcnA/m287OPkW+iWz6fGILgqFY8zoeo5aYWm
         buE9eFlP/HyHEzd04txoHvAC49FuiXZn32+PpMyxLOu5qmM6DLBUmVAyoSvzSm5yVkFV
         g4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723540; x=1777328340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s4H5GsvbxoE5+/z3cSTlcVrGPTXhWnAs/RqeR2VWh+k=;
        b=tPJbgUMk5nwGttd2GgBSxXJwIhiRcDjzvnmcyGruc5wRyoNy0NbCg63Si7sxb4tUbg
         YsKEqMKgpxc62YdMpw1duRoY0eFnICbfRxF8RI+QJL/qRklc+Ts38XMWJkuCbzU3MFRN
         5AFiqlPrFd6w8icxEg0058V/RISO/WEka44evwgrOENB9TWwxL01pGzADmswVqDdSgJS
         2wyiq4AOj9Q2UJWPdMbsd7qluOFnflKByzlEdj9M6n7+b3juphxlzlgKYB51yP5CEBIl
         ZoN0rh9wJNpPT1XFP7hzf8CboJJRD3v89ZTGaa6iwZTTdZk5wcc54YkWhxbQnRthbOX9
         rV7A==
X-Forwarded-Encrypted: i=1; AFNElJ+Z+AySkuR1EU4TjExmetqrcMqTJ9IlHSQxqdFzxOs3QFr7z65wCQmgrxiKETpwsSX/hBl4zC+/eoh6@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+1w4fZ8v+CGC0VI3xtGUfb20Yi3Me30Xl93rLZfBHv8r+SM4q
	myBrZg7NOn29YfbSV67KRr4nRdLfyHMdCPLDppxu3qK81Yvsr1NhBgc3
X-Gm-Gg: AeBDietDx7xJmgLZJFas/P7+AaPk3Osp4x/wHFoYOAhf50pTghzDRLoj/eXOw72fWGu
	BUJbY1ab8Fa4fB/OxPUj9eyMf4Ofa+jFLW+szYfwOayh9WQ3jZRQHQkrponeFRAecfqKEZDpspR
	Rur8kfRcEV02okYGUj4BoGPGjp4CRCIeClK+TF3LVBlR9lfwtxlhB9vvt3IzosTDHzqOlrLCG0E
	RkBRMoRH/bVGCVT90soBgoS4cj/H/sFaJMbOlpe3D43+XSPYlku0Q9/4FHAHR1XaKfHD5n1cyv9
	c4l5V0VsI3E9aNEtcwXsAn3uqiprWXhaIgjjmWcCgq4ITOqSFtXYpqCR+TPCoOWksDCG4b5df+l
	y7bdYybITrRdxZn8ACOu8k5/6Z8IlD8/hPhQqEn3HrGO41zKVtTmeDaRmlRHc4IaQ4LY07HlI9B
	2eV0IPNElvHpx8sk8MdQ55GoNEdAQ6
X-Received: by 2002:a17:903:2acc:b0:2b2:497e:3f6d with SMTP id d9443c01a7336-2b5f9e8cdb3mr148280815ad.8.1776723540410;
        Mon, 20 Apr 2026 15:19:00 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:49::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3ba16sm117583635ad.75.2026.04.20.15.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:59 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 16/17] fuse: add passthrough open
Date: Mon, 20 Apr 2026 15:16:36 -0700
Message-ID: <20260420221637.2631478-17-joannelkoong@gmail.com>
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

Add FUSE_PASSTHROUGH_OP_OPEN which the server may set in the backing
map's ops mask to indicate that the kernel should skip sending
FUSE_OPEN/FUSE_OPENDIR to the server and open the backing file directly.
FUSE_RELEASE/FUSE_RELEASEDIR is also skipped when the file is released.
FUSE_FLUSH is skipped as well.

If the file is a directory, this automatically implies passthrough
readdir. If the file is a regular file, this automatically implies
passthrough read/write.

For FUSE_ATOMIC_O_TRUNC, the server typically handles the truncating
logic when it handles FUSE_OPEN. With passthrough open, the vfs layer
will call handle_truncate() which will trigger fuse_setattr(). If
setattr is passed through, then the backing file will be truncated
directly or if not, then a FUSE_SETATTR will be sent to the server for
the truncation.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/backing.c         | 12 ++++++--
 fs/fuse/dir.c             | 15 +++++++++-
 fs/fuse/file.c            | 17 ++++++++++-
 fs/fuse/fuse_i.h          | 13 ++++++++-
 fs/fuse/iomode.c          |  5 ++--
 fs/fuse/passthrough.c     | 59 +++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/fuse.h |  1 +
 7 files changed, 114 insertions(+), 8 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 85ac6f917779..5bc5581dd27f 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -118,8 +118,9 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 	if (map->flags || map->ops_mask & ~FUSE_BACKING_MAP_VALID_OPS)
 		goto out;
 
-	/* For now passthrough inode operations requires FUSE_PASSTHROUGH_INO */
-	if (!fc->passthrough_ino && map->ops_mask & FUSE_PASSTHROUGH_INODE_OPS)
+	/* For now passthrough operations on backing inodes require FUSE_PASSTHROUGH_INO */
+	if (!fc->passthrough_ino &&
+	    (map->ops_mask & (FUSE_PASSTHROUGH_INODE_OPS | FUSE_PASSTHROUGH_OP_OPEN)))
 		goto out;
 
 	file = fget_raw(map->fd);
@@ -127,6 +128,13 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 	if (!file)
 		goto out;
 
+	if (map->ops_mask & FUSE_PASSTHROUGH_OP_OPEN) {
+		if (d_is_reg(file->f_path.dentry))
+			map->ops_mask |= FUSE_PASSTHROUGH_RW_OPS;
+		else
+			map->ops_mask |= FUSE_PASSTHROUGH_DIR_OPS;
+	}
+
 	/* read/write/splice/mmap passthrough only relevant for regular files */
 	res = d_is_dir(file->f_path.dentry) ? -EISDIR : -EINVAL;
 	if (!(map->ops_mask & ~FUSE_PASSTHROUGH_RW_OPS) &&
diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 6dea0f8e384f..816cb7d7aeb1 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -2077,6 +2077,9 @@ static int fuse_dir_open(struct inode *inode, struct file *file)
 	if (err)
 		return err;
 
+	if (fuse_inode_passthrough_op(inode, FUSE_OPEN))
+		return fuse_passthrough_open_inode(inode, file);
+
 	err = fuse_do_open(fm, get_node_id(inode), file, true);
 	if (!err) {
 		struct fuse_file *ff = file->private_data;
@@ -2113,11 +2116,15 @@ static int fuse_dir_fsync(struct file *file, loff_t start, loff_t end,
 {
 	struct inode *inode = file->f_mapping->host;
 	struct fuse_conn *fc = get_fuse_conn(inode);
+	struct fuse_file *ff = file->private_data;
 	int err;
 
 	if (fuse_is_bad(inode))
 		return -EIO;
 
+	if (ff->passthrough_open)
+		return vfs_fsync_range(ff->passthrough, start, end, datasync);
+
 	if (fc->no_fsyncdir)
 		return 0;
 
@@ -2362,7 +2369,13 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		/* This is coming from open(..., ... | O_TRUNC); */
 		WARN_ON(!(attr->ia_valid & ATTR_SIZE));
 		WARN_ON(attr->ia_size != 0);
-		if (fc->atomic_o_trunc) {
+		/*
+		 * With open passthrough, FUSE_OPEN was never sent to the
+		 * server, which means the server didn't get a chance to handle
+		 * the truncation, so we need to send a FUSE_SETATTR
+		 */
+		if (fc->atomic_o_trunc &&
+		    !fuse_inode_passthrough_op(inode, FUSE_OPEN)) {
 			/*
 			 * No need to send request to userspace, since actual
 			 * truncation has already been done by OPEN.  But still
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index a1de70bc589d..5cbf240064f9 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -111,7 +111,12 @@ static void fuse_file_put(struct fuse_file *ff, bool sync)
 
 		if (!args) {
 			/* Do nothing when server does not implement 'opendir' */
-		} else if (args->opcode == FUSE_RELEASE && ff->fm->fc->no_open) {
+		} else if ((args->opcode == FUSE_RELEASE && ff->fm->fc->no_open) ||
+			   ff->passthrough_open) {
+			/*
+			 * With open passthrough, no FUSE_OPEN was sent. Skip
+			 * sending a FUSE_RELEASE
+			 */
 			fuse_release_end(ff->fm, args, 0);
 		} else if (sync) {
 			fuse_simple_request(ff->fm, args);
@@ -278,6 +283,9 @@ static int fuse_open(struct inode *inode, struct file *file)
 	if (err)
 		return err;
 
+	if (fuse_inode_passthrough_op(inode, FUSE_OPEN))
+		return fuse_passthrough_open_inode(inode, file);
+
 	if (is_wb_truncate || dax_truncate)
 		inode_lock(inode);
 
@@ -485,6 +493,9 @@ static int fuse_flush(struct file *file, fl_owner_t id)
 	if (fuse_is_bad(inode))
 		return -EIO;
 
+	if (ff->passthrough_open)
+		return 0;
+
 	if (ff->open_flags & FOPEN_NOFLUSH && !fm->fc->writeback_cache)
 		return 0;
 
@@ -551,11 +562,15 @@ static int fuse_fsync(struct file *file, loff_t start, loff_t end,
 {
 	struct inode *inode = file->f_mapping->host;
 	struct fuse_conn *fc = get_fuse_conn(inode);
+	struct fuse_file *ff = file->private_data;
 	int err;
 
 	if (fuse_is_bad(inode))
 		return -EIO;
 
+	if (ff->passthrough_open)
+		return vfs_fsync_range(ff->passthrough, start, end, datasync);
+
 	inode_lock(inode);
 
 	/*
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index d722382676e2..726b0004fce7 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -307,6 +307,12 @@ struct fuse_file {
 	const struct cred *cred;
 #endif
 
+	/*
+	 * Was file opened via passthrough (no FUSE_OPEN/FUSE_OPENDIR
+	 * sent)?
+	 */
+	bool passthrough_open:1;
+
 	/** Has flock been performed on this file? */
 	bool flock:1;
 };
@@ -1548,6 +1554,8 @@ void fuse_inode_uncached_io_end(struct inode *inode);
 
 int fuse_file_io_open(struct file *file, struct inode *inode);
 void fuse_file_io_release(struct fuse_file *ff, struct inode *inode);
+int fuse_file_uncached_io_open(struct inode *inode, struct fuse_file *ff,
+			       struct fuse_backing *fb);
 
 /* file.c */
 struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
@@ -1577,7 +1585,8 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 	((map)->ops_mask & FUSE_PASSTHROUGH_OP(op))
 
 #define FUSE_BACKING_MAP_VALID_OPS \
-	(FUSE_PASSTHROUGH_FILE_OPS | FUSE_PASSTHROUGH_INODE_OPS)
+	(FUSE_PASSTHROUGH_FILE_OPS | FUSE_PASSTHROUGH_INODE_OPS | \
+	 FUSE_PASSTHROUGH_OP_OPEN)
 
 /* backing.c */
 #ifdef CONFIG_FUSE_PASSTHROUGH
@@ -1685,6 +1694,8 @@ int fuse_passthrough_getattr(struct inode *inode, struct kstat *stat,
 			     u32 request_mask, unsigned int flags);
 int fuse_passthrough_setattr(struct inode *inode, struct iattr *attr);
 
+int fuse_passthrough_open_inode(struct inode *inode, struct file *file);
+
 static inline bool fuse_use_entry2(struct fuse_conn *fc)
 {
 	return fc->passthrough_ino;
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index 7c4053160b8a..5a4091e7e275 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -139,9 +139,8 @@ int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_file *ff,
 }
 
 /* Takes uncached_io inode mode reference to be dropped on file release */
-static int fuse_file_uncached_io_open(struct inode *inode,
-				      struct fuse_file *ff,
-				      struct fuse_backing *fb)
+int fuse_file_uncached_io_open(struct inode *inode, struct fuse_file *ff,
+			       struct fuse_backing *fb)
 {
 	int err;
 
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index c70478f07d6a..eb55c4b42a4e 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -282,3 +282,62 @@ int fuse_passthrough_setattr(struct inode *inode, struct iattr *attr)
 	 */
 	return fuse_passthrough_getattr(inode, NULL, STATX_BASIC_STATS, 0);
 }
+
+/*
+ * Open a file in passthrough mode using the inode's backing reference.
+ * Called when FUSE_PASSTHROUGH_OP_OPEN is set on the backing map's ops.
+ * This skips sending a FUSE_OPEN/FUSE_OPENDIR request to the server.
+ * FUSE_RELEASE/FUSE_RELEASEDIR will be skipped as well when the file is
+ * released.
+ */
+int fuse_passthrough_open_inode(struct inode *inode, struct file *file)
+{
+	struct fuse_mount *fm = get_fuse_mount(inode);
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct file *backing_file;
+	struct fuse_backing *fb;
+	struct fuse_file *ff;
+	int err;
+
+	/*
+	 * This should always pass true for the release arg because when the
+	 * last refcount on the file is dropped (see fuse_file_put()),
+	 * fuse_io_release() needs to be called on the inode stashed in
+	 * ff->args->release_args.
+	 */
+	ff = fuse_file_alloc(fm, true);
+	if (!ff)
+		return -ENOMEM;
+
+	ff->nodeid = get_node_id(inode);
+	ff->open_flags = FOPEN_PASSTHROUGH;
+	ff->passthrough_open = true;
+
+	err = -EINVAL;
+	fb = fuse_backing_get(fuse_inode_passthrough(fi));
+	if (!fb)
+		goto error_free;
+
+	backing_file = backing_file_open(&file->f_path, file->f_flags,
+					  &fb->file->f_path, fb->cred);
+	if (IS_ERR(backing_file)) {
+		err = PTR_ERR(backing_file);
+		goto error_put;
+	}
+
+	ff->passthrough = backing_file;
+	ff->cred = get_cred(fb->cred);
+
+	err = fuse_file_uncached_io_open(inode, ff, fb);
+	if (!err) {
+		file->private_data = ff;
+		return 0;
+	}
+
+	fuse_passthrough_release(ff, fb);
+error_put:
+	fuse_backing_put(fb);
+error_free:
+	fuse_file_free(ff);
+	return err;
+}
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 040fee549bb9..bfb30278f324 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -1159,6 +1159,7 @@ struct fuse_backing_map {
 #define FUSE_PASSTHROUGH_OP_READDIR	FUSE_PASSTHROUGH_OP(FUSE_READDIR)
 #define FUSE_PASSTHROUGH_OP_GETATTR	FUSE_PASSTHROUGH_OP(FUSE_GETATTR)
 #define FUSE_PASSTHROUGH_OP_SETATTR	FUSE_PASSTHROUGH_OP(FUSE_SETATTR)
+#define FUSE_PASSTHROUGH_OP_OPEN	FUSE_PASSTHROUGH_OP(FUSE_OPEN)
 
 /* Device ioctls: */
 #define FUSE_DEV_IOC_MAGIC		229
-- 
2.52.0

