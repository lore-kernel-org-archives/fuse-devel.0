Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E64071E2
	for <fuse-devel@lists.linux.dev>; Tue,  6 Oct 2026 18:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791309696; cv=none; b=MfWUXXs7vm/w8qFiZX4Z9ptIURfKBWnPVG4HrBaBmlACl0QhdTEXWB1qkSqpSuGdg4OSVxUwWuPC+0FKINZvy/d9NG2IE3DcgcRSJrDsVR2WxJKrxl6440/0gl/MC7/NCKV2LVPasdH5SoZGgCSPzTBwwrz/yP9QzDrSgQHFgQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791309696; c=relaxed/simple;
	bh=6KfFWIKRM3xmSKrz0Bnh97YWOfQY+evsHaGwE3K6EZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=LKctrXLt5bAlq1rhpIjqJ8kco3qLcjIlwEINQNQ/jo5C8CJbsfgWQJZ3//C+qYBXy6kY+17BWBgCUZFk7ewWuwxuK78MhU9W01mvx3C1ZlXxR5ldeYaoZy/md1FPWtHt/35ISaFfVAGjXiibv3JZN/f9KHRzc+/gCBiTMVqwIJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O+6Z3yqo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O+6Z3yqo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791309694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EfZEwrRDlGyS+8oyYcwGmcAeigXKY916tuqVMNGx2ks=;
	b=O+6Z3yqosDZc7hiNmxFF2YIknichyPBqmn5aKg3ZlzXzm1xptZzSckQO7p1padIkpDgXsQ
	wZMabktrHciSdaJc6qXb75Y5AjXvOgSC3nE3GwhSgyBylSAcw7UKwgU9UBTpAiMh3v6idX
	OTpzjnbD9/b8Azqzh3kfDJHff3uoRPQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-fz_mPEFSNY69CJwiq_Dfig-1; Tue, 06 Oct 2026 14:01:32 -0400
X-MC-Unique: fz_mPEFSNY69CJwiq_Dfig-1
X-Mimecast-MFC-AGG-ID: fz_mPEFSNY69CJwiq_Dfig_1791309691
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c2e49c5ff09so356282466b.1
        for <fuse-devel@lists.linux.dev>; Tue, 06 Oct 2026 11:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791309691; x=1791914491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EfZEwrRDlGyS+8oyYcwGmcAeigXKY916tuqVMNGx2ks=;
        b=A5sz/yQMWnhm2v4w7r4GyEZEa15OZGnE+VVksqi7j7lyHjG6gBp5Rcw+rkfNFDRiHY
         XOdYSYfmN3vGhyhMKsd/HfGoZG4+s/kpAc6eJKIsCajkgngOG9XqBfMHP22+eXJBsr+v
         Nf/oYyi855Cmm7i1FCVoIQnD20NcTZR2Def+1J1Js2bW1Kv0q2f8o5UeYpXmrqaqtj3T
         8lBtNykavfWnIpMYOMznlqlqA49LF+wzhD1SDaXC5ZRfZeK4p8edRF67rWKtxRmkQWrc
         NkAo8OrEyqut1bltYPUakUN7DAiKAXkzsosL+XBe2BgpOVtc70sKt1zbkZZVHR0E7Yk5
         B0UQ==
X-Gm-Message-State: AFq9FYLJ/IxgwS/Cx2jsyrTWAVp0UF75Qu040iCbGH2ak3RFohM8nmOs
	WsDzewhnORofpX0BIC93kJoWrYMsmVmdwlzkgbJJgvun+mHX8lPG6WtBzQU8fF/MjAaMskqFqN8
	Y1DPcLZWEab9Ji9RYbxUtc/sjIO30aHdkCxOlp66bmBeSIU7ScVLz4H8djguuibug6VjVWPqYSG
	UMHKA3ZgFI01snsl2CQBINcCX2MydAK0UgyMYAQVMzdEl0+vE=
X-Gm-Gg: AYBFou2tmc6MLCy8PXpksjMIx4GVOSGSWbwqyy2vlKch5zuG794cMcY+S2GOoV5KpR8
	+wQ1SC5ONOQqdp81qKNYv8nNvYxubf5000ZSAcHi+2G2qqflIL98p69oEyZL9KFQeBewipQjA7O
	J/4Erl2gagtAkV32afgTrE7fmGp3NR/iVnCFMzVlCdS53ya/mJOhvaU/jaTKl7KGQQNI1lh8Mvn
	hwIXnz60N5tGsLWgcstdIfstg/Q8L6djtsU5FSDKDUSc3xoMP5fOZYA7/w4uLmtDPR1ib3033Sc
	E1bD7TSSmIEAHKF/kAFnqojPP+d5+yrv4365O+gWR6MQ9ZjYA6zHx84Y+mX9QL0q7f7ek1ReHRz
	DR49aV79HCoEYKyz9JJy6CYAt8YIQ+DzjXPDR3NBkzxavbaNv1qBop7eC
X-Received: by 2002:a05:6402:270f:b0:6ae:550e:59e2 with SMTP id 4fb4d7f45d1cf-6afe29e6661mr2295106a12.35.1791309691264;
        Tue, 06 Oct 2026 11:01:31 -0700 (PDT)
X-Received: by 2002:a05:6402:270f:b0:6ae:550e:59e2 with SMTP id 4fb4d7f45d1cf-6afe29e6661mr2295071a12.35.1791309690716;
        Tue, 06 Oct 2026 11:01:30 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (188-142-152-55.pool.digikabel.hu. [188.142.152.55])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e5942sm5056684a12.9.2026.10.06.11.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:01:30 -0700 (PDT)
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
Subject: [PATCH v3 6/9] fuse: add support for opening dax device as backing
Date: Tue,  6 Oct 2026 20:01:11 +0200
Message-ID: <20261006180115.1425232-7-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261006180115.1425232-1-mszeredi@redhat.com>
References: <20261006180115.1425232-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BJPX4CnO-NHvp91LQXznNKp1-7Hc1xpBE7FR6nRewdQ_1791309691
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This is only possible with FUSE_PASSTHROUGH_V2 enabled.

Mark the inode with S_DAX if FUSE_LOOKUP returns with FUSE_ATTR_DAX set.

This patch does not yet provide a way actually use the dax dev backing:
when such a backing ID is provided in reply to FUSE_OPEN with
FOPEN_PASSTHROUGH flag set, an error will be returned.

Originally-by: John Groves <john@groves.net>
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/backing.c     | 105 +++++++++++++++++++++++++++++++++---------
 fs/fuse/file.c        |   2 +-
 fs/fuse/fuse_i.h      |  33 +++++++++++--
 fs/fuse/inode.c       |  11 ++++-
 fs/fuse/iomode.c      |  10 ++--
 fs/fuse/passthrough.c |   6 ++-
 6 files changed, 134 insertions(+), 33 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index bc40818778df..0ed850ddf8cd 100644
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
 
@@ -103,39 +111,90 @@ int fuse_backing_close_64(struct fuse_conn *fc, u64 backing_id)
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
+		daxdev = dax_dev_find(inode->i_rdev);
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
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 5273957f0399..e0d72b9d3c4a 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -297,7 +297,7 @@ static int fuse_open(struct inode *inode, struct file *file)
 	if (!err) {
 		if (is_truncate)
 			truncate_pagecache(inode, 0);
-		else if (!(ff->open_flags & FOPEN_KEEP_CACHE))
+		else if (!(ff->open_flags & FOPEN_KEEP_CACHE) && !IS_DAX(inode))
 			invalidate_inode_pages2(inode->i_mapping);
 	}
 out_unlock:
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index f34607eda2c0..7acf860865de 100644
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
@@ -1242,7 +1257,19 @@ void fuse_free_conn(struct fuse_conn *fc);
 
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
index b5b51865d59f..750e092c3971 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -148,7 +148,7 @@ static void fuse_evict_inode(struct inode *inode)
 	/* Will write inode on close/munmap and in all other dirtiers */
 	WARN_ON(inode_state_read_once(inode) & I_DIRTY_INODE);
 
-	if (FUSE_IS_VDAX(inode))
+	if (IS_DAX(inode))
 		dax_break_layout_final(inode);
 
 	truncate_inode_pages_final(&inode->i_data);
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
@@ -430,6 +434,11 @@ static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
 	 */
 	if (!fc->posix_acl)
 		inode->i_acl = inode->i_default_acl = ACL_DONT_CACHE;
+
+	if ((attr->flags & FUSE_ATTR_DAX) && !fuse_inode_vdax(inode)) {
+		inode->i_flags |= S_DAX;
+		inode->i_data.a_ops = &fuse_dax_aops;
+	}
 }
 
 static int fuse_inode_eq(struct inode *inode, void *_nodeidp)
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
index 4894842ad6d0..e9ab1aea34e2 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -156,9 +156,11 @@ int fuse_passthrough_open(struct file *file, struct fuse_backing *fb)
 	struct fuse_file *ff = file->private_data;
 	struct file *backing_file;
 
+	if (fb->type != FUSE_BACKING_PATH)
+		return fuse_EIO("invalid backing type");
+
 	/* Allocate backing file per fuse file to store fuse path */
-	backing_file = backing_file_open(file, file->f_flags,
-					 &fb->file->f_path, fb->cred);
+	backing_file = backing_file_open(file, file->f_flags, &fb->path, fb->cred);
 	if (IS_ERR(backing_file))
 		return fuse_EIO("failed to open backing file (%ld)", PTR_ERR(backing_file));
 
-- 
2.54.0

