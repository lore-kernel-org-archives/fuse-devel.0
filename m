Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7B74A0F1F
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 06:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057445; cv=none; b=CteFqzAP/410FaAwailSBaYT1uIi1E/Toug1yypxg1E8Bsmc9xeQ/Umew977S1LZGxmjZXwoj7YZ7+uohAO/kSj71z5Jy4MXDcRqElndwmqsBznjzHH2ZuiKgIAs1ILJLhbBGK5lHvlAc45xUaCIr9ZhvwkIEBJpa7S+yQbtC1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057445; c=relaxed/simple;
	bh=kQY1dHJnvl46m8jvxZ3yqBDNRMrLIsfRlIU/mWD5lXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=J1E8baYLVOzj07Jwjh4rvMgmJtn1QgK7iP6ks25MzttkDAOxrQSeQ3BWENilGyxm0ln/NYSnVuM4BZasZZhMxWQWCsO1dw8ItXwwLghUHO6xcuhGrFLcHH8zdQuhFuh511UbBUe1wYZoDHwdBAiMY8NVEc+EdIuXOiBMGHWQ3cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LqEQmPRP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LqEQmPRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790057443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5/zXRfvsEH6wexBr1R+Tp7nNH+GNNq1W4nRc+6Jr1h8=;
	b=LqEQmPRPmaMhv+sedbBjQW3bssLBTcQPdjYIIO1UztnDcenBwvV65rBHrio2QLRjERZxBe
	5caLrJmF/0aDzSbWBJrSTvv1NltXNhxM6qsCe4TSWBIrLiRfStx4nf2cYE98FmhAR1HdF0
	lZbldHVbxaj1NgmrvmtcJV77Pjes3OA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-wLYiPkuaPI2f5GH_jHzEaQ-1; Tue, 22 Sep 2026 02:10:38 -0400
X-MC-Unique: wLYiPkuaPI2f5GH_jHzEaQ-1
X-Mimecast-MFC-AGG-ID: wLYiPkuaPI2f5GH_jHzEaQ_1790057437
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a9a19c8bdbso1009558a12.1
        for <fuse-devel@lists.linux.dev>; Mon, 21 Sep 2026 23:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057437; x=1790662237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5/zXRfvsEH6wexBr1R+Tp7nNH+GNNq1W4nRc+6Jr1h8=;
        b=mAam1/rnBatTENieG6kLUhreXws47BkrA8QxnFsvr5SOR7FE10mbVC9lmHcVOE1olZ
         haiNo2aM5hc410HpOEbUbmKKDxtctqkxcfIQd5zRp2NUnRqSqG0/miN0J9Nm+7ukj6az
         6PfSaGy3tZuEpH94yJKjB3eUDJMAoeMBHsDeVVY3jrT/i8S7ppguQ1fy5qXh9rx2h/Pv
         3yjG3IvBJnov5fvG0Y2+q3hx37fVdicB2/SA5B7SttbiXTL80dqI85xjR9VUQ+0qhq4L
         yrsB0X68IurtLuiAVS1JBazJyV08zWOAjl5wF5955y7zWeL0CsiSeLrXbkT+PzjLxRRY
         9FBA==
X-Gm-Message-State: AFuF++nOtwC18N44JRcP3f58Oq/alYzuhxk4ESM0aCTQ+WUuFq7a0n3F
	Zp3t16aRWWC1ZNuK3OndcEzgv6zs/1kBq5ZdaqW7TGJCrfPSIarfr7EOJkNjxVWFFtuVMAk2LZ7
	hZy1qWfQ41WDaAQCo2tyqHueNMpqyUux1od3kMlE7GypWpAhxzRYVkpQj+0l1WQN/boPNoepPn7
	0bl0C1AyMUr0oli/NXGOTcWCDzl8d3uoBkg5QnRkfFCbGQQOo=
X-Gm-Gg: AYBFou0v8WkFriu2wjeqLjwC7npMlAkjwqF6AR6zCS+/by2R+u6cDMgK6okLhKT3VdU
	BWZ5IEjo6g2eCmM3w2eoJqFhjkW2lfdtWGX3lGaJ1FGoGqzwn6M266kpktbJEKqyM5KijT2vkJ5
	n2hIwXIMfxPQPsq0HFQx2pJGToYWSn2uuQLKvQ1yKeSzYXsLzv4J8d8LliWKa1iTUApVbzlxyUG
	aF39+EfXWnZSsjiOXJ9xq+d4vOZtaCxb1WBo0ZyDWoF4VFqzEIfwrG3aKHDZNrLmJ7QrvAGn34b
	LLWCM8fKkFp15jBFSMeHPm65PKqJYJ/6ar1opSq7vrIjh/689U+7EyX4LAObqsrcBJepE+R3ETE
	7w3hRbio3sI1gShbhtlb1LsA7qeqyVIcPO8qP9reGH5J80u++ZxHs1q++MR7fCGE=
X-Received: by 2002:a05:6402:a0d1:b0:6a9:9ac3:aa13 with SMTP id 4fb4d7f45d1cf-6aa9fdb886emr1454063a12.7.1790057437328;
        Mon, 21 Sep 2026 23:10:37 -0700 (PDT)
X-Received: by 2002:a05:6402:a0d1:b0:6a9:9ac3:aa13 with SMTP id 4fb4d7f45d1cf-6aa9fdb886emr1454046a12.7.1790057436837;
        Mon, 21 Sep 2026 23:10:36 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-111.pool.digikabel.hu. [85.66.37.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440df9asm449826a12.4.2026.09.21.23.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:10:36 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>
Subject: [PATCH 08/11] fuse: add support for opening dax device as backing
Date: Tue, 22 Sep 2026 08:10:08 +0200
Message-ID: <20260922061019.3320196-9-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922061019.3320196-1-mszeredi@redhat.com>
References: <20260922061019.3320196-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S97a3s2ClrlBd5rBBHAm9IvxiZ0cW39dX42sK2e4k-Y_1790057437
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add FUSE_BACKING_IS_DEV flag that allows opening a character device
(dax device) as a backing, in addition to regular files.

Mark the inode with S_DAX if FUSE_LOOKUP returns with FUSE_ATTR_DAX set.

This patch does not yet provide a way actually use the dax dev backing:
when such a backing ID is provided in reply to FUSE_OPEN with
FOPEN_PASSTHROUGH flag set, an error will be returned.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/backing.c         | 131 ++++++++++++++++++++++++++------------
 fs/fuse/file.c            |   2 +-
 fs/fuse/fuse_i.h          |  28 +++++++-
 fs/fuse/inode.c           |  11 +++-
 fs/fuse/passthrough.c     |   8 ++-
 include/uapi/linux/fuse.h |   3 +
 6 files changed, 136 insertions(+), 47 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 58dbdd17c1ef..aa558a0c2e64 100644
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
 
@@ -79,23 +87,88 @@ static struct fuse_backing *fuse_backing_id_remove(struct fuse_conn *fc, u64 id,
 	return fb;
 }
 
+static int fuse_dax_notify_failure(struct dax_device *daxdev, u64 offset, u64 len, int mf_flags)
+{
+	struct fuse_backing *fb = dax_holder(daxdev);
+
+	fb->dax_error = true;
+
+	return 0;
+}
+
+static const struct dax_holder_operations fuse_dax_holder_ops = {
+	.notify_failure		= fuse_dax_notify_failure,
+};
+
+static int fuse_backing_open_file(struct fuse_conn *fc, struct fuse_backing *fb, struct file *file,
+				  bool is_dev)
+{
+	struct inode *inode = file_inode(file);
+	struct dax_device *daxdev;
+	int err;
+
+	switch (inode->i_mode & S_IFMT) {
+	case S_IFREG:
+		if (is_dev)
+			return -EINVAL;
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
+		if (!is_dev)
+			return -EINVAL;
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
+
+	case S_IFDIR:
+		if (is_dev)
+			return -EINVAL;
+		return -EISDIR;
+
+	default:
+		return -EINVAL;
+	}
+}
+
 int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 {
 	struct file *file;
-	struct super_block *backing_sb;
-	struct fuse_backing *fb;
+	struct fuse_backing *fb = kzalloc_obj(struct fuse_backing);
 	bool is_64bit = map->flags & FUSE_BACKING_ID_64;
 	int res;
 
-	pr_debug("%s: fd=%d flags=0x%x\n", __func__, map->fd, map->flags);
+	if (!fb)
+		return -ENOMEM;
 
-	/* TODO: relax CAP_SYS_ADMIN once backing files are visible to lsof */
-	res = -EPERM;
-	if (!fc->passthrough || !capable(CAP_SYS_ADMIN))
-		goto out;
+	fb->backing_id = map->backing_id;
+	refcount_set(&fb->count, 1);
+
+	pr_debug("%s: fd=%d flags=0x%x\n", __func__, map->fd, map->flags);
 
 	res = -EINVAL;
-	if (map->flags & ~FUSE_BACKING_ID_64)
+	if (map->flags & ~(FUSE_BACKING_IS_DEV | FUSE_BACKING_ID_64))
 		goto out;
 
 	if (!is_64bit && map->backing_id != 0)
@@ -106,43 +179,21 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 	if (!file)
 		goto out;
 
-	/* read/write/splice/mmap passthrough only relevant for regular files */
-	res = d_is_dir(file->f_path.dentry) ? -EISDIR : -EINVAL;
-	if (!d_is_reg(file->f_path.dentry))
-		goto out_fput;
-
-	backing_sb = file_inode(file)->i_sb;
-	res = -ELOOP;
-	if (backing_sb->s_stack_depth >= fc->max_stack_depth)
-		goto out_fput;
-
-	fb = kmalloc_obj(struct fuse_backing);
-	res = -ENOMEM;
-	if (!fb)
-		goto out_fput;
-
-	fb->file = file;
-	fb->cred = get_current_cred();
-	fb->backing_id = map->backing_id;
-	refcount_set(&fb->count, 1);
+	res = fuse_backing_open_file(fc, fb, file, map->flags & FUSE_BACKING_IS_DEV);
+	fput(file);
+	if (res)
+		goto out;
 
 	if (is_64bit)
 		res = fuse_backing_add_64(fc, fb);
 	else
 		res = fuse_backing_id_alloc(fc, fb);
-	if (res < 0) {
-		fuse_backing_free(fb);
-		fb = NULL;
-	}
-
 out:
-	pr_debug("%s: fb=0x%p, ret=%i\n", __func__, fb, res);
+	pr_debug("%s: ret=%i\n", __func__, res);
+	if (res < 0)
+		fuse_backing_free(fb);
 
 	return res;
-
-out_fput:
-	fput(file);
-	goto out;
 }
 
 int fuse_backing_close(struct fuse_conn *fc, u64 backing_id, bool is_64bit)
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 8643d9a290ac..ea33b8d60473 100644
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
index d36459487bee..00c124bcb88d 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -93,10 +93,25 @@ struct fuse_submount_lookup {
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
@@ -1237,7 +1252,14 @@ void fuse_free_conn(struct fuse_conn *fc);
 
 /* dax.c */
 
-#define FUSE_IS_VDAX(inode) (IS_ENABLED(CONFIG_FUSE_DAX) && IS_DAX(inode))
+static inline bool FUSE_IS_VDAX(struct inode *inode)
+{
+#ifdef CONFIG_FUSE_DAX
+	return get_fuse_inode(inode)->vdax && IS_DAX(inode);
+#else
+	return false;
+#endif
+}
 
 ssize_t fuse_vdax_read_iter(struct kiocb *iocb, struct iov_iter *to);
 ssize_t fuse_vdax_write_iter(struct kiocb *iocb, struct iov_iter *from);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index e88daf88f913..e6634a660083 100644
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
+	if ((attr->flags & FUSE_ATTR_DAX) && !fc->vdax) {
+		inode->i_flags |= S_DAX;
+		inode->i_data.a_ops = &fuse_dax_aops;
+	}
 }
 
 static int fuse_inode_eq(struct inode *inode, void *_nodeidp)
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index 49cae366180d..adc9d2d8e203 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -167,9 +167,13 @@ struct fuse_backing *fuse_passthrough_open(struct file *file, u64 backing_id, bo
 	if (!fb)
 		return fuse_ptr_EIO("backing not found");
 
+	if (fb->type != FUSE_BACKING_PATH) {
+		fuse_backing_put(fb);
+		return fuse_ptr_EIO("invalid backing type");
+	}
+
 	/* Allocate backing file per fuse file to store fuse path */
-	backing_file = backing_file_open(file, file->f_flags,
-					 &fb->file->f_path, fb->cred);
+	backing_file = backing_file_open(file, file->f_flags, &fb->path, fb->cred);
 	if (IS_ERR(backing_file)) {
 		fuse_backing_put(fb);
 		return fuse_err_ptr_EIO("failed to open backing file", PTR_ERR(backing_file));
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 30ec8c124c74..1ba28a2885ad 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -255,6 +255,7 @@
  *  - add struct fuse_notify_backing_close_out
  *  - add backing_id_64 to fuse_open_out
  *  - add backing_id to fuse_backing_map
+ *  - add FUSE_BACKING_IS_DEV (fuse_backing_map.flags)
  *  - add FUSE_BACKING_ID_64 (multiple structs)
  */
 
@@ -1165,8 +1166,10 @@ struct fuse_notify_prune_out {
 /**
  * flags for fuse_backing_map
  *
+ * FUSE_BACKING_IS_DEV: @fd refers to a device file
  * FUSE_BACKING_ID_64: backing ID is server allocated, stored in @backing_id
  */
+#define FUSE_BACKING_IS_DEV	(1 << 0)
 #define FUSE_BACKING_ID_64	(1 << 30) /* used in multiple structs */
 
 struct fuse_backing_map {
-- 
2.54.0

