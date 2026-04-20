Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA0F3876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723523; cv=none; b=Y+aqVYEq9n60zKbb2XAYUiekFA0FwATVnl6J6wnqBiJ6iqKzrQJrPRneqpVdHW33QwX2sDPmD1YlfNitnqnXDrmITHcIRo8D+OZJccfWcjDr1o9jPz71ZGaf1lBqK+HuS9fOk7W9aB9PIh0HSwQxAZ0Tp9EfgMosgIBF8nSTGFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723523; c=relaxed/simple;
	bh=VU2IKerzbCzzAgLuqkUaloQzQ7c/vWZGIlo3dhxFi/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzMoaoMCOs+xMSLrS61KDemMG8lYeMPJ5X4dJq+lXOxpS8qoz38qdFZjArPcApwHyQVZFEgvh/LHdu18BgJ7FZKNHmtir+RU/a75AI/BT/m5F222vbVacARuv0/NLPE/ysUQChc/9SieGxdTAXMp2LWpcC5FE/PTx0d2qgeGQdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofKQzfY+; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofKQzfY+"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso2151638a91.0
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723521; x=1777328321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/HFLiwqu5Z9Ltqm1hn5ztJbQFZ5icvJkD8qdhdJUMw=;
        b=ofKQzfY+Qtvcrbvqutxm5Ggub8xRl0InotXXByrF+z2tZ4G+fG8ZekFAl9AS8TR1ve
         yhYLFsd6z4+pfUGlM0SKPS2a5fUhUu2yAFQXiJG/YIHUTZvoyTBy6/Ia6SQy6AHjaC5d
         LXZXE2A3yJKLSBfPWr2hBrLcoLfw4pMmx5hf4ujZogQWoAMVzYioqihmirMqAbwXEtxQ
         QYqgngp8NiujHtxF+nFfQFdzNZ26s6U9t6dL5MKQz+Ch8oShF/ZdHls3OK9fLDh8D5bb
         iVpd3MhI0iib/8K7t+NwNeFr7lX2yK0VuRUOn61uXRFlzFYH8xgW70w0m+tSllWI87XF
         OxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723521; x=1777328321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R/HFLiwqu5Z9Ltqm1hn5ztJbQFZ5icvJkD8qdhdJUMw=;
        b=Dp6zH6VgP61KtpqK3nZc4o1CO9EMBDzJBWmzmRITtPQGi20Rf9dqhRPIEyO2Pw/UBd
         p7P8AcddxHgQTTKz1txA2+D4Fu2lrjPhSrExuXYuRUoeicXHnzO+ivwPD7AhvsANArAA
         gdp9m5URKhR5ZzzDtbgKs9E7No7HkxfzNZ+14fMIG1ZfOwetui4VSyrDyb/dry7UXtUo
         b7J5zTupmUEmyZxkwhZU0YRummmvY9+9eRs1JPCWXUWKm2aQAGDQgME55DyLA3H92vlG
         xK1rrpa4ICh2Q9k69Nx+xRHV3f3y2+L2WnHPgd0IYjo2OYbneeJs2y/uWx94NepY0K7b
         BnAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+E1fMxtuR3OuSrjoNp+66fgjk53g/EatlmPRhKzTQ9MTmPHIB4PAEsVPSxZu6bL/yltELfvGKXypP3@lists.linux.dev
X-Gm-Message-State: AOJu0YwvJyxD/a/FU3OwiVrXu9Rq9Gk47X9rtrFGXN9Lq9g6B34rmb7h
	2Ofb4/tPmgOVwphxDAH9FYkvPh+HO8LXkQHt3HJ3SKj++LQR+uXzTeAh
X-Gm-Gg: AeBDieuX8KdFosMOUq0Df7U1Xi2Q6kEDo2M1GkVPDg/HoqIMYy5CgFEp1CIK852ezBT
	fGGHNLU+Jike5K/Pq0OpmrEKfQ+MgBff7isIwd4cdtEbZup16mcRaXGAWxVgLY/mxX7//vgvmie
	UdrC1PjV5AKilDJg2dk5oWgZJIgDQvuIKZ0xF+99q+aTLTWlQEV22eVsETK93HuQ5a8kYNth5vT
	R5UKSbxzzN2LFn2GAiKVhrDo3dyOY2NtithMrRzCix+K5NLLRy6YQtIIawo6s9aqfvCfXs9BxFK
	1+vNzjwQWzaC3OUtZ4hn/r8/3yjwYHKaRL1BqcWs9Y3qqhh2VR2Hcmz7ZRM+cvF/otGZ0h+W4gQ
	A7+1zYbdvBafiKuu9nu3iobc8rqBNcgvDvKq/LTJnR1CUh8SvC4zvZQTsdPZfMOmhEF7NKLuGeu
	t7CuzWeOp4PXppcFFagXfJfr5nfw9w
X-Received: by 2002:a17:90b:4c49:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-361403f65c4mr15464302a91.7.1776723521040;
        Mon, 20 Apr 2026 15:18:41 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:48::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a92asm11207477a91.10.2026.04.20.15.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:40 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 06/17] fuse: implement passthrough for getattr/statx
Date: Mon, 20 Apr 2026 15:16:26 -0700
Message-ID: <20260420221637.2631478-7-joannelkoong@gmail.com>
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

Call vfs_getattr() on backing inode to respond to a user statx(2)
request and update the fuse inode attributes with the response.

For now, we assume that calling vfs_getattr() on backing inode is cheap,
so we never use cached attributed and always update fuse inode
attributes from backing attributes in fuse_permission() and
fuse_update_attributes().

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/fuse/dir.c             | 32 ++++++++++++++++++++++++++++++++
 fs/fuse/fuse_i.h          |  8 +++++++-
 fs/fuse/passthrough.c     | 34 ++++++++++++++++++++++++++++++++++
 include/uapi/linux/fuse.h |  1 +
 4 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 16b266b51702..2d037591a3ab 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1414,6 +1414,28 @@ static void fuse_statx_to_attr(struct fuse_statx *sx, struct fuse_attr *attr)
 	attr->blksize = sx->blksize;
 }
 
+void fuse_kstat_to_attr(struct fuse_conn *fc, const struct kstat *stat,
+			struct fuse_attr *attr)
+{
+	memset(attr, 0, sizeof(*attr));
+
+	attr->ino = stat->ino;
+	attr->size = stat->size;
+	attr->blocks = stat->blocks;
+	attr->atime = stat->atime.tv_sec;
+	attr->mtime = stat->mtime.tv_sec;
+	attr->ctime = stat->ctime.tv_sec;
+	attr->atimensec = stat->atime.tv_nsec;
+	attr->mtimensec = stat->mtime.tv_nsec;
+	attr->ctimensec = stat->ctime.tv_nsec;
+	attr->mode = stat->mode;
+	attr->nlink = stat->nlink;
+	attr->uid = from_kuid(fc->user_ns, stat->uid);
+	attr->gid = from_kgid(fc->user_ns, stat->gid);
+	attr->rdev = new_encode_dev(MKDEV(MAJOR(stat->rdev), MINOR(stat->rdev)));
+	attr->blksize = stat->blksize;
+}
+
 static int fuse_do_statx(struct mnt_idmap *idmap, struct inode *inode,
 			 struct file *file, struct kstat *stat)
 {
@@ -1539,6 +1561,12 @@ static int fuse_update_get_attr(struct mnt_idmap *idmap, struct inode *inode,
 	if (fc->no_statx)
 		request_mask &= STATX_BASIC_STATS;
 
+	if (fuse_inode_passthrough_op(inode, FUSE_GETATTR)) {
+		forget_all_cached_acls(inode);
+		return fuse_passthrough_getattr(inode, stat, request_mask,
+						flags);
+	}
+
 	if (!request_mask)
 		sync = false;
 	else if (flags & AT_STATX_FORCE_SYNC)
@@ -1737,6 +1765,10 @@ static int fuse_perm_getattr(struct inode *inode, int mask)
 		return -ECHILD;
 
 	forget_all_cached_acls(inode);
+	if (fuse_inode_passthrough_op(inode, FUSE_GETATTR))
+		return fuse_passthrough_getattr(inode, NULL,
+						STATX_BASIC_STATS, 0);
+
 	return fuse_do_getattr(&nop_mnt_idmap, inode, NULL, NULL);
 }
 
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 73de8a9c079c..1f279b5b618a 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1234,6 +1234,8 @@ void fuse_init_symlink(struct inode *inode);
 /**
  * Change attributes of an inode
  */
+void fuse_kstat_to_attr(struct fuse_conn *fc, const struct kstat *stat,
+			struct fuse_attr *attr);
 void fuse_change_attributes(struct inode *inode, struct fuse_attr *attr,
 			    struct fuse_statx *sx,
 			    u64 attr_valid, u64 attr_version);
@@ -1569,7 +1571,8 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 	(FUSE_PASSTHROUGH_RW_OPS | FUSE_PASSTHROUGH_OP_READDIR)
 
 /* Inode passthrough operations for backing file attached to inode */
-#define FUSE_PASSTHROUGH_INODE_OPS (0)
+#define FUSE_PASSTHROUGH_INODE_OPS \
+	(FUSE_PASSTHROUGH_OP_GETATTR)
 
 #define FUSE_BACKING_MAP_OP(map, op) \
 	((map)->ops_mask & FUSE_PASSTHROUGH_OP(op))
@@ -1665,6 +1668,9 @@ static inline bool fuse_inode_passthrough_op(struct inode *inode,
 	return fb && fb->ops_mask & FUSE_PASSTHROUGH_OP(op);
 }
 
+int fuse_passthrough_getattr(struct inode *inode, struct kstat *stat,
+			     u32 request_mask, unsigned int flags);
+
 #ifdef CONFIG_SYSCTL
 extern int fuse_sysctl_register(void);
 extern void fuse_sysctl_unregister(void);
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index a1d87ed51a94..1baac4f0cb68 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -219,3 +219,37 @@ void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing *fb)
 	put_cred(ff->cred);
 	ff->cred = NULL;
 }
+
+/*
+ * Inode passthrough operations for backing file attached on lookup.
+ */
+int fuse_passthrough_getattr(struct inode *inode, struct kstat *stat,
+			     u32 request_mask, unsigned int flags)
+{
+	struct fuse_conn *fc = get_fuse_conn(inode);
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct fuse_backing *fb = fuse_inode_passthrough(fi);
+	u64 attr_version = fuse_get_attr_version(fc);
+	const struct path *fb_path = &fb->file->f_path;
+	const struct cred *old_cred;
+	struct kstat backing_stat;
+	struct fuse_attr attr;
+	int err;
+
+	if (!stat)
+		stat = &backing_stat;
+
+	old_cred = override_creds(fb->cred);
+	err = vfs_getattr(fb_path, stat, request_mask, flags);
+	revert_creds(old_cred);
+	if (err)
+		return err;
+
+	/* Always override st_dev with FUSE dev */
+	stat->dev = inode->i_sb->s_dev;
+	/* Fill fuse inode attrs from backing inode stat */
+	fuse_kstat_to_attr(fc, stat, &attr);
+	fuse_change_attributes(inode, &attr, NULL, 0, attr_version);
+
+	return 0;
+}
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index df366e390f0c..6404ed95c758 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -1143,6 +1143,7 @@ struct fuse_backing_map {
 #define FUSE_PASSTHROUGH_OP_READ	FUSE_PASSTHROUGH_OP(FUSE_READ)
 #define FUSE_PASSTHROUGH_OP_WRITE	FUSE_PASSTHROUGH_OP(FUSE_WRITE)
 #define FUSE_PASSTHROUGH_OP_READDIR	FUSE_PASSTHROUGH_OP(FUSE_READDIR)
+#define FUSE_PASSTHROUGH_OP_GETATTR	FUSE_PASSTHROUGH_OP(FUSE_GETATTR)
 
 /* Device ioctls: */
 #define FUSE_DEV_IOC_MAGIC		229
-- 
2.52.0

