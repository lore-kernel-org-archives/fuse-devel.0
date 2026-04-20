Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C886C3876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723519; cv=none; b=oBjeF25HUMdk/0QbzbLQQYd6qw1GHBad3XrhVFZMWKkt8dnS7ofVfXTDSRLMhKQOPRIORqdwaivi+m1ZkWW/6yLpkPA/j7KIP6KVP+BTLxXrQf0V7uds80jmjVRoZMbfBUhSw86sqMt3X9qQ9VnqZe33Pc7+AduoaPtRJeZpwYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723519; c=relaxed/simple;
	bh=hh28DEuw3rF4PL2w8A385bQjUhq1nqN1U5JaMyMYwlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DE9TwkOIJpgG+Wb1Z4liR26V7z4+pkL7CiGAmfL4uG/wc5OgJvuGMXahU7uXHTv+P41oQb4e5BFwZr90ADSj9hgVx19Hjbr7/LwwHPC9n9KTnHrMv0M9wevy1mKkgFzVe043rSynaqKXmY7fULVO5PLpLdZgiyQoei4X0dOPbUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEezoLCU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEezoLCU"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso15901585ad.1
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723517; x=1777328317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcNRNUs2Zu3IbtkD0umNr3yoByZ3qBRSDxauOhD0QmY=;
        b=OEezoLCUixDf2tLotKpPNvJ4/LqnR7Tq6AmuyC61OBkK/Fz1EuIa3ZWJJyzOiJcIWF
         nV2uIZRDytIffehNj+OKWLF2PJZHvkEXJpZwc4IxLLkYtllhExISyF7U4yjADg+tlDr+
         vX0F6mh6kq02XEA1P624zL2ncoNtcLGtykbg0HxPytAfZQV3yHSPBjaRrlw1I8HqwZQQ
         30wmHSnb/duWGUqycKgQclmdg6X4c/kOMYjNlkupR1ID0lVRtMEw8H6FmVYAhg2MAEhz
         S3B8hwPpk6HBsFd7hBKn9q4kkQQ5XZWKJdSZ5P2LC6idmxQLNif8dnmcbURcsDV1QCu+
         SjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723517; x=1777328317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vcNRNUs2Zu3IbtkD0umNr3yoByZ3qBRSDxauOhD0QmY=;
        b=WNhnmCk6NFsAuLZ1/S/EGJ+h9xIBnIInz5uoNtnm4Y7PEMOPWmS+ddzD2QALFxZcxd
         Le61XYO82G8fe13ucJ158WKlCY6D7lhmpRWXPnUO4jFva6oP7XXW7zC5QwQw447sZnNm
         x07oo+PbjTF7b1aaSKrcYQxcyJ7W91VOBHmXzdqCM/vSMM6lM/ry+7PzKg2RJG1QDOdi
         Rvfsff3CMHwIeZOngGwxIQSiIUvGEa5BRXHRpX9QURGSbth9/HqBwYK4e7sADitfJ2g/
         UqHFCnvvNxIOR6199EIcqqLpLeLKJUju9nU56uVZhBYm2LlmVjlpn39nWnr4SXmQBpOb
         XlcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rdnC6W5ucXi3eTKAr9xvrKnLkOgvUzCRnEObv4kmSVL3lPhXRb8B4/Ckl/U382d2DgQ9jb0Qk4HCA@lists.linux.dev
X-Gm-Message-State: AOJu0YwkEZEISz9TBZGL3ZU325V3h3sLRDtSXCdsV51wqiH+Vjji5+Di
	hEI1+tA/F1LQ/n24wCEbreX2h5NUdygRaq4ACgTO9OUcR1/fLGXW2/c4
X-Gm-Gg: AeBDieszYguFhKtC+ReKvUKMZiMTmrTguBax0vcBNdGDTyE/aAaFvm8cgX13CCcnLQd
	8+E0Q0xRwji+Z1dKdYE1QKUGrI/PYDI844yG+8We5L/egUOr9j2V2OeRs7ha9/qvG5eAh4H+DEl
	PNkCBOUYspV3rfylkDqIjQ3EX7hNone161gpcllqQcShkHiHrx0bMRCRgHSmk+L8nzAsPoOwuBP
	2L/umxNtrn77frrRyqxj7h4D4yS+abWtB/nrvmbpaF7uU5v5ZG3illT8c29fgxIgovvHrqCzAvd
	l0eEKYMhYm2GSnb94w5GrG84GAX/nu38YyP06Yiz33ap0jfwj3ihyb1PBp/++VfSpIBX4tkF++H
	erb0f/0UWjPYF0uMU4BShwd+2qv2+ml5abZQmNFx+bQdMKHG7IIxnSCIYoAUgQHMgyICHadBhqy
	6wpXk4CED5ad9sYZn3d1i5KdCel+k=
X-Received: by 2002:a17:903:38c4:b0:2b0:6d56:8d29 with SMTP id d9443c01a7336-2b5f9f3b3edmr177345265ad.32.1776723517148;
        Mon, 20 Apr 2026 15:18:37 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:9::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm115720305ad.54.2026.04.20.15.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:36 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 04/17] fuse: implement passthrough for readdir
Date: Mon, 20 Apr 2026 15:16:24 -0700
Message-ID: <20260420221637.2631478-5-joannelkoong@gmail.com>
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
 fs/fuse/iomode.c          |  9 +++++++++
 fs/fuse/passthrough.c     | 24 ++++++++++++++++++++++++
 fs/fuse/readdir.c         |  3 +++
 include/uapi/linux/fuse.h |  1 +
 8 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 830cbe2a4200..516f58e5ae18 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -113,6 +113,11 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
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
index 015f0c103d06..16b266b51702 100644
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
index 3da4ce73e11b..0db6abcf1033 100644
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
index 1c4646ad7c25..99798a9de3ed 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1559,9 +1559,13 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
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
@@ -1640,6 +1644,7 @@ ssize_t fuse_passthrough_splice_write(struct pipe_inode_info *pipe,
 				      struct file *out, loff_t *ppos,
 				      size_t len, unsigned int flags);
 ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma);
+int fuse_passthrough_readdir(struct file *file, struct dir_context *ctx);
 
 static inline struct fuse_backing *fuse_inode_passthrough(struct fuse_inode *fi)
 {
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index 2360b32793c2..3753b78cbb56 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -200,11 +200,18 @@ static int fuse_file_passthrough_open(struct inode *inode, struct file *file)
 	if (IS_ERR(fb))
 		return PTR_ERR(fb);
 
+	/* Readdir passthrough requires opt-in on backing file setup */
+	err = -EOPNOTSUPP;
+	if (S_ISDIR(inode->i_mode) &&
+	    !(fb->ops_mask & FUSE_PASSTHROUGH_OP_READDIR))
+		goto fail;
+
 	/* First passthrough file open denies caching inode io mode */
 	err = fuse_file_uncached_io_open(inode, ff, fb);
 	if (!err)
 		return 0;
 
+fail:
 	fuse_passthrough_release(ff, fb);
 	fuse_backing_put(fb);
 
@@ -242,6 +249,8 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
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

