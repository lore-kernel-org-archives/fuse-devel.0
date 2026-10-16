Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D80544C4FB
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 15:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163859; cv=none; b=HltPT/OpjoZxzG0BJ92bH4AOiyh73ZTt22qPKtq/1kvMq+xWeVkpIvueQTGq5X0aqUVpMY9nuknRYtgKRg0txE3Qy4ivrHkGpzyT59DXkxRch7zSEle/AyIPmm1nGZCxsMYzZhvP/JnTojTvH5zKUZJEG9R36QAaXZn1G75XStA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163859; c=relaxed/simple;
	bh=vdl9ioetuPoxn0PIkMPxyZ1psus6vLVcBl+I9HEHpPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=dbsdvgpYi7qFsfO3mrz+uztjIaXue4Gxskac95OyL1fGien/gomDRRwkxL+CrrFCSzSCEou4RTZ2LqqELJ87aLsPj6uklx+EgUWzfm6t5Ed95EEvSMJXueXRniu2en7v4SMX7j1Z55N+TGEFCjtP8DIR5wX4EIyzK2myZrh9VHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a5D/6uFk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a5D/6uFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792163853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V6s4tJwjbR8d5V3AVsYoByyx4BjqZ/NZdWxUGPGp4vw=;
	b=a5D/6uFkRWNsje3NMBbRRAp68oTItX3mPp7fwmFCKjqDRW1LRv/JY++wH+DusWKwIvUE1T
	qpQzhYe27R6rTk3y20XmwO+Dy6AVXE1iA1ZqcgMGA2mr8N/Opb/RyUrmiv3f9Z7dBEKEMI
	atTqi3gU0RlkzvzjnGMvdgcezOVoZ/s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-W0IMWIJVNnW7G4hdrOIiuA-1; Fri, 16 Oct 2026 15:17:32 +0000
X-MC-Unique: W0IMWIJVNnW7G4hdrOIiuA-1
X-Mimecast-MFC-AGG-ID: W0IMWIJVNnW7G4hdrOIiuA_1792163851
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a16faefac0so533455e9.0
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 08:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163851; x=1792768651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6s4tJwjbR8d5V3AVsYoByyx4BjqZ/NZdWxUGPGp4vw=;
        b=lRaO3sVILtYLa5HOxvMXmXvBMzVW1q4r65+TOWjmAWteZCyVHyBkt5IjpUrsLCWYfa
         Xb0z9j8PKCXwTgblANsOLmQcAfZrAQjxky3PVkUHzoUCfKEGdQwEqTvbkzn0ma1cR0/p
         9hrY6IH+ELVSaryyvBWu1jIrwKfuIn1XoUwunhXqJ0zJaXfMzSuKMUNNpReU96I0PmxH
         mULzoMbSm4aqtmiNVucgSOd6ufiHf2ugwr2JMLTmK0H8vat2+IxumjFqX7sNUyUd6WxK
         GSloVDu2eZbAO7e/3b0dOQlZOeWU2a/3p2x0vofg0IcSDPQfvqyUXXdp27maXyA6Vqvu
         MGJQ==
X-Gm-Message-State: AFq9FYLrFib97RTY0Ttr1IocRzo2YV6TNLL9vFq4LG7jyQHDRbr7PazG
	VpFySRmpxmmwmvmgM69/DQJ/elHv8MBpd0cEcKuh5bl/AMh0Bxjccw3XkpxTjSnmzqxhOF3sk8Q
	4xS1tp1pzU9EWqj2XMW3ZsWvtgZSxUkYB9pFsrSelZ5SYHDyqkUnTUJF450VaJI7qqiRk8hXBOK
	URozlAFQ4PG6KFF0KAA9j+NlTK5Omc7Kahe9d77cNIxO5PexI=
X-Gm-Gg: AYBFou3nRPGMEHUOQ/VVA56UnLDoMQQ0Q6RlGQiatH6px1l/UnhCjT72Yx+gDY7Qkck
	jvGCuKKizIsqnhIry+fFiQUcNjhOPpnMEeZ+wT9rGwnB/GgrolfjM5LbqTZdSVlXTab2EHk3K98
	tG7PAtVcNNjvbpX6GRFxvMMdli+wGg/u9n2MjeGg9rP/AbI7YNTuFgQnwGKWon0i8DtsyrZawvA
	i/kMtmO3Xt6Q3kcUtcz+6c6i0xq70A4aq3EPZoZGFE2HpmLiOaXX/Jx6EM8LIUvN78vTqLfoXIE
	dNZczLl6UINv2aEDk6mqtu3WQJR2FVQGPw1WwBaaZVmx0geSLqGmWVZVR20PsDAHDna2Yi64RvI
	9Z6EmJfDZI2mTKqtWeTU0Fw==
X-Received: by 2002:a05:600c:6309:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1d7634cafmr2071745e9.33.1792163850925;
        Fri, 16 Oct 2026 08:17:30 -0700 (PDT)
X-Received: by 2002:a05:600c:6309:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1d7634cafmr2069685e9.33.1792163849181;
        Fri, 16 Oct 2026 08:17:29 -0700 (PDT)
Received: from maszat.com (85-67-2-18.pool.digikabel.hu. [85.67.2.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de7230sm64621665e9.14.2026.10.16.08.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:17:28 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org
Subject: [PATCH v5 06/10] fuse: add support for opening dax device as backing
Date: Fri, 16 Oct 2026 17:16:33 +0200
Message-ID: <20261016151638.2962413-7-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016151638.2962413-1-mszeredi@redhat.com>
References: <20261016151638.2962413-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KZks6s36B9l0ugIyltEYZMQzPabx70HwtlNt70Ldo2c_1792163851
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This is only possible with FUSE_PASSTHROUGH_V2 enabled.

Mark the inode with S_DAX if FUSE_LOOKUP returns with FUSE_ATTR_DAX set.

This patch does not yet provide a way actually use the dax dev backing:
when such a backing ID is provided in reply to FUSE_OPEN with
FOPEN_PASSTHROUGH flag set, an error will be returned.

Truncate and hole punch is not currently allowed on inodes marked with
S_DAX.

Move fuse_backing_put() from fuse_free_inode() to fuse_evict_inode() to
avoid sleeping in atomic context.

Originally-by: John Groves <john@groves.net>
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/backing.c     | 108 +++++++++++++++++++++++++++++++++---------
 fs/fuse/dir.c         |   3 ++
 fs/fuse/file.c        |  10 +++-
 fs/fuse/fuse_i.h      |  33 +++++++++++--
 fs/fuse/inode.c       |  17 +++++--
 fs/fuse/iomode.c      |  10 ++--
 fs/fuse/passthrough.c |   9 +++-
 7 files changed, 154 insertions(+), 36 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 15132150535a..972a145484d7 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -9,6 +9,7 @@
 #include "fuse_i.h"
 
 #include <linux/file.h>
+#include <linux/dax.h>
 #include <linux/rhashtable.h>
 
 static struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
@@ -22,9 +23,16 @@ static void fuse_backing_free(struct fuse_backing *fb)
 {
 	pr_debug("%s: fb=0x%p\n", __func__, fb);
 
-	if (fb->file)
-		fput(fb->file);
-	put_cred(fb->cred);
+	switch (fb->type) {
+	case FUSE_BACKING_PATH:
+		path_put(&fb->path);
+		put_cred(fb->cred);
+		break;
+
+	case FUSE_BACKING_DAXDEV:
+		fs_put_dax(fb->dax_dev, fb);
+		break;
+	}
 	kfree_rcu(fb, rcu);
 }
 
@@ -103,39 +111,93 @@ int fuse_backing_close_64(struct fuse_conn *fc, u64 backing_id)
 	return 0;
 }
 
-static struct fuse_backing *fuse_backing_new(struct fuse_conn *fc, int fd)
+static int fuse_dax_notify_failure(struct dax_device *daxdev, u64 offset, u64 len, int mf_flags)
 {
 	struct fuse_backing *fb;
-	struct super_block *backing_sb;
-	struct file *file;
 
-	/* TODO: relax CAP_SYS_ADMIN once backing files are visible to lsof */
-	if (!fc->passthrough || !capable(CAP_SYS_ADMIN))
-		return ERR_PTR(-EPERM);
+	guard(rcu)();
 
-	CLASS(fd_raw, f)(fd);
-	if (fd_empty(f))
-		return ERR_PTR(-EBADF);
+	fb = dax_holder(daxdev);
+	if (fb)
+		fb->dax_error = true;
+
+	return 0;
+}
+
+static const struct dax_holder_operations fuse_dax_holder_ops = {
+	.notify_failure		= fuse_dax_notify_failure,
+};
+
+static int fuse_backing_open_file(struct fuse_conn *fc, struct fuse_backing *fb, struct file *file)
+{
+	struct inode *inode = file_inode(file);
+	struct dax_device *daxdev;
+	int err;
+
+	switch (inode->i_mode & S_IFMT) {
+	case S_IFREG:
+		/* TODO: relax CAP_SYS_ADMIN once backing files are visible to lsof */
+		if (!fc->passthrough || !capable(CAP_SYS_ADMIN))
+			return -EPERM;
+
+		if (inode->i_sb->s_stack_depth >= fc->max_stack_depth)
+			return -ELOOP;
+
+		fb->type = FUSE_BACKING_PATH;
+		fb->path = file->f_path;
+		path_get(&fb->path);
+		fb->cred = get_current_cred();
+		return 0;
+
+	case S_IFCHR:
+		if (!fc->passthrough || !fc->backing_id_64)
+			return -EINVAL;
+
+		if (!IS_REACHABLE(CONFIG_DEV_DAX_FSDEV))
+			return -EINVAL;
+
+		daxdev = fsdev_dax_from_file(file);
+		if (!daxdev)
+			return -EINVAL;
+
+		err = -EPERM;
+		if (capable(CAP_SYS_RAWIO)) {
+			err = fs_dax_get(daxdev, fb, &fuse_dax_holder_ops);
+			if (!err) {
+				fb->type = FUSE_BACKING_DAXDEV;
+				fb->dax_dev = daxdev;
+			}
+		}
+		put_dax(daxdev);
+		return err;
 
-	file = fd_file(f);
+	case S_IFDIR:
+		return -EISDIR;
 
-	/* read/write/splice/mmap passthrough only relevant for regular files */
-	if (!d_is_reg(file->f_path.dentry))
-		return d_is_dir(file->f_path.dentry) ? ERR_PTR(-EISDIR) : ERR_PTR(-EINVAL);
+	default:
+		return -EINVAL;
+	}
+}
 
-	backing_sb = file_inode(file)->i_sb;
-	if (backing_sb->s_stack_depth >= fc->max_stack_depth)
-		return ERR_PTR(-ELOOP);
+static struct fuse_backing *fuse_backing_new(struct fuse_conn *fc, int fd)
+{
+	struct fuse_backing *fb __free(kfree) = kzalloc_obj(*fb);
+	int err;
 
-	fb = kmalloc_obj(struct fuse_backing);
 	if (!fb)
 		return ERR_PTR(-ENOMEM);
 
-	fb->file = get_file(file);
-	fb->cred = get_current_cred();
+	CLASS(fd_raw, f)(fd);
+	if (fd_empty(f))
+		return ERR_PTR(-EBADF);
+
+	err = fuse_backing_open_file(fc, fb, fd_file(f));
+	if (err)
+		return ERR_PTR(err);
+
 	refcount_set(&fb->count, 1);
 
-	return fb;
+	return_ptr(fb);
 }
 
 int fuse_backing_open_64(struct fuse_conn *fc, struct fuse_backing_create_in *map)
diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index cb3a42ac3238..28516a1760e2 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -2180,6 +2180,9 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		err = fuse_vdax_break_layouts(inode, 0, -1);
 		if (err)
 			goto unlock;
+	} else if (IS_DAX(inode) && is_truncate) {
+		/* No truncate for DAX yet */
+		return -EINVAL;
 	}
 
 	if (attr->ia_valid & ATTR_OPEN) {
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index d6eb2bb182d1..76c134e5aa48 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -265,6 +265,10 @@ static int fuse_open(struct inode *inode, struct file *file)
 	if (fuse_is_bad(inode))
 		return -EIO;
 
+	/* No truncate for DAX yet */
+	if ((file->f_flags & O_TRUNC) && IS_DAX(inode) && !FUSE_IS_VDAX(inode))
+		return -EINVAL;
+
 	err = generic_file_open(inode, file);
 	if (err)
 		return err;
@@ -297,7 +301,7 @@ static int fuse_open(struct inode *inode, struct file *file)
 	if (!err) {
 		if (is_truncate)
 			truncate_pagecache(inode, 0);
-		else if (!(ff->open_flags & FOPEN_KEEP_CACHE))
+		else if (!(ff->open_flags & FOPEN_KEEP_CACHE) && !IS_DAX(inode))
 			invalidate_inode_pages2(inode->i_mapping);
 	}
 out_unlock:
@@ -2884,6 +2888,10 @@ static long fuse_file_fallocate(struct file *file, int mode, loff_t offset,
 	if (fm->fc->no_fallocate)
 		return -EOPNOTSUPP;
 
+	/* No size extend/hole punch for DAX yet */
+	if (IS_DAX(inode) && !FUSE_IS_VDAX(inode))
+		return -EOPNOTSUPP;
+
 	inode_lock(inode);
 	if (block_faults) {
 		filemap_invalidate_lock(inode->i_mapping);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 9e3a6206b7a7..c6caeaebcf23 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -89,10 +89,25 @@ struct fuse_submount_lookup {
 	struct fuse_forget_link *forget;
 };
 
+enum fuse_backing_type {
+	FUSE_BACKING_PATH,
+	FUSE_BACKING_DAXDEV,
+};
+
 /* Container for data related to mapping to backing file */
 struct fuse_backing {
-	struct file *file;
-	const struct cred *cred;
+	enum fuse_backing_type type;
+
+	union {
+		struct {
+			struct path path;
+			const struct cred *cred;
+		};
+		struct {
+			struct dax_device *dax_dev;
+			bool dax_error;
+		};
+	};
 	u64 backing_id;
 	struct rhash_head hash_node;
 	/* refcount */
@@ -1239,7 +1254,19 @@ void fuse_free_conn(struct fuse_conn *fc);
 
 /* dax.c */
 
-#define FUSE_IS_VDAX(inode) (IS_ENABLED(CONFIG_FUSE_VDAX) && IS_DAX(inode))
+static inline bool fuse_inode_vdax(struct inode *inode)
+{
+#ifdef CONFIG_FUSE_VDAX
+	return get_fuse_inode(inode)->vdax;
+#else
+	return false;
+#endif
+}
+
+static inline bool FUSE_IS_VDAX(struct inode *inode)
+{
+	return fuse_inode_vdax(inode) && IS_DAX(inode);
+}
 
 ssize_t fuse_vdax_read_iter(struct kiocb *iocb, struct iov_iter *to);
 ssize_t fuse_vdax_write_iter(struct kiocb *iocb, struct iov_iter *from);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 1b6cad0dd2d8..1341b681d0ed 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -124,9 +124,6 @@ static void fuse_free_inode(struct inode *inode)
 #ifdef CONFIG_FUSE_VDAX
 	kfree(fi->vdax);
 #endif
-	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
-		fuse_backing_put(fuse_inode_backing(fi));
-
 	kmem_cache_free(fuse_inode_cachep, fi);
 }
 
@@ -148,7 +145,7 @@ static void fuse_evict_inode(struct inode *inode)
 	/* Will write inode on close/munmap and in all other dirtiers */
 	WARN_ON(inode_state_read_once(inode) & I_DIRTY_INODE);
 
-	if (FUSE_IS_VDAX(inode))
+	if (IS_DAX(inode))
 		dax_break_layout_final(inode);
 
 	truncate_inode_pages_final(&inode->i_data);
@@ -177,6 +174,9 @@ static void fuse_evict_inode(struct inode *inode)
 		if (inode->i_nlink > 0)
 			atomic64_inc(&fc->evict_ctr);
 	}
+	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
+		fuse_backing_put(fuse_inode_backing(fi));
+
 	if (S_ISREG(inode->i_mode) && !fuse_is_bad(inode)) {
 		WARN_ON(fi->iocachectr != 0);
 		WARN_ON(!list_empty(&fi->write_files));
@@ -403,6 +403,10 @@ static void fuse_init_submount_lookup(struct fuse_submount_lookup *sl,
 	refcount_set(&sl->count, 1);
 }
 
+static const struct address_space_operations fuse_dax_aops = {
+	.dirty_folio	= noop_dirty_folio,
+};
+
 static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
 			    struct fuse_conn *fc)
 {
@@ -413,6 +417,11 @@ static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
 	if (S_ISREG(inode->i_mode)) {
 		fuse_init_common(inode);
 		fuse_init_file_inode(inode, attr->flags);
+
+		if ((attr->flags & FUSE_ATTR_DAX) && !fuse_inode_vdax(inode)) {
+			inode->i_flags |= S_DAX;
+			inode->i_data.a_ops = &fuse_dax_aops;
+		}
 	} else if (S_ISDIR(inode->i_mode))
 		fuse_init_dir(inode);
 	else if (S_ISLNK(inode->i_mode))
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index 8b4774c80b11..38afe1f238ef 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -230,10 +230,14 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
 	 * Server is expected to use FOPEN_PASSTHROUGH for all opens of an inode
 	 * which is already open for passthrough.  Using incorrect open mode is
 	 * a server mistake, which results in user visible failure of open()
-	 * with EIO error.
+	 * with EIO error.  Same with DAX inodes.
 	 */
-	if (fuse_inode_backing(fi) && !(ff->open_flags & FOPEN_PASSTHROUGH))
-		return fuse_EIO("FOPEN_PASSTHROUGH expected");
+	if (!(ff->open_flags & FOPEN_PASSTHROUGH)) {
+		if (fuse_inode_backing(fi))
+			return fuse_EIO("FOPEN_PASSTHROUGH expected");
+		if (IS_DAX(inode))
+			return fuse_EIO("DAX inode without FOPEN_PASSTHROUGH");
+	}
 
 	/*
 	 * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO.
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index 9bf8ce33f549..2c87c0ef8a25 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -169,9 +169,14 @@ int fuse_passthrough_open(struct file *file, struct fuse_backing *fb)
 	struct fuse_file *ff = file->private_data;
 	struct file *backing_file;
 
+	if (fb->type != FUSE_BACKING_PATH)
+		return fuse_EIO("invalid backing type");
+
+	if (IS_DAX(file_inode(file)))
+		return fuse_EIO("dax mode on backing file not supported");
+
 	/* Allocate backing file per fuse file to store fuse path */
-	backing_file = backing_file_open(file, file->f_flags,
-					 &fb->file->f_path, fb->cred);
+	backing_file = backing_file_open(file, file->f_flags, &fb->path, fb->cred);
 	if (IS_ERR(backing_file))
 		return fuse_EIO("failed to open backing file (%ld)", PTR_ERR(backing_file));
 
-- 
2.54.0

