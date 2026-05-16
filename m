Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8B626B95B
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892755; cv=none; b=UbqWwJxKd/fduGbEJzvrHNtkZIqx3xNpjFZypUQqNkxbk7GNaKvGtwSz5RRvMbHFJGfXXjDxb2Ogh+klHxWXh6pnW2IGEjPj8AX4zpMPuOkGQGrDO8WR1eXdwSbB1CDBe/H0p+9vMXT1/vATqmXhPuc39igZEed2dvyE1NwOR28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892755; c=relaxed/simple;
	bh=lnGWVaXe1W4lVI4l09z3D2fCyJs03GaPetOlGCDcDms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLQqalxQTJcDokKhIeNAghyxFAf8YjqbgogDYYJCaq3ns48fwGr+11EIGVrKtJWeicvNWGlkV4YAdUs0aJ/9wx9fM8cfhWRiufnu7ywdlvtuLrrSu8I7ZCgxLNv1Ul4xcaLvqBY0rXFPwr6jOTcNFtH7BybYv8z/oJuWfdzzCFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GndOmbcX; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GndOmbcX"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-65890a6ca20so849061d50.0
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892752; x=1779497552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmT6br8rzgsL/Aos2iiX0KSGLlk/N4FMdvjcXM3+Tgg=;
        b=GndOmbcXIEVvIgIRGXg++YXk3gMm4+SdNeKc4DAMG4L6dN4J1O54Y/P0O7ftSoqCvT
         OOiL3g3KnkAjGqnf3p1xTIvxJUyNOz2rPz8rpid9aBsTio5EpY8Sn7prjlY4yuoaWtdR
         Qs7874b0PC75z7+P3wLxEsSJYeb8pYkdVldWQclTHrnybyk8eLZKcExVy125tcAnUEq0
         fnAbLPeq6XWobtdzAWsineLFFmWZej8SgqrLTiYtmMKM586eEtgeTSIgG6r7UPlb7iiA
         OJGmLszkgzR6yVhKREESNQCfuUyO0M3nZ0rLsIE30bPrWTPY82ItyIaGNuKt33Kx8PWj
         sxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892752; x=1779497552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wmT6br8rzgsL/Aos2iiX0KSGLlk/N4FMdvjcXM3+Tgg=;
        b=Wr1z40e/qUfPWsPtV+DOc7BsTt3y8q2gLUIicHW6L9SGNWGbrKNAYEaT2YnS3xSFI0
         y8epcXAN9UTFj9T6BjQzrDwDfSZDjHTuyh7AlL/Oqug9qW2PERAmfX1OglM4t2BXVI9F
         WaM3Vu7l6tv+kzQu98/Wox3Pm0ghfX4C3Q+zuV2jojanovmapyMi8zaODpZEXIg7a9EP
         uGtuovbarfN/odm6Jpe/A5dQAz/6hT5fDs2cDrKui3AtpY85g6W0abaoWBI60Oz0GlCM
         l61TJ+OX5GPilqzi2rLfEh5f0RFOVGVmyiKV3mACu6dUVI+OgmeRxKBDHYcNLWSS2zjN
         S1/g==
X-Gm-Message-State: AOJu0Yxq4gBmZ9mhE3rnkLbLAcUzwRPcP/EN0ZoOu2QKYGdYhrRxPYi0
	b9JOWybaJBJpb5IGUpg4VUsTlfWeRXw7vtJCyjQBBp/vaKtko82r0yEN
X-Gm-Gg: Acq92OG+OligAbM1L3JuYYApgB3W9jW92vt93KWg8Y59AopPU7i8thdIXG216+eH7ee
	irM4XYML5zspETX74GT8J/x7xEiIOqW2ue8SD9kgl47khh2bZLVD9IUfNk3RauQhDkE/eUi4sXM
	Da8v0gzGAmk01k/UeQajcPKPp0O5haSUJUMHE++eFDDjcCKyeULsffwh8nFm6IWxAOPeRUxQX5X
	NQcTyRcFjzetXyPnPnIHXlbM1W7i5PjFWrXHMKl2/2XpacfcLNO4XqBnVZQSl3MZHFeGxDap+cQ
	yNFPU6+52v0qh+PcLKVyMDTf8DfK/RfG2Vj/0rD72Jng7Gn5tFiTgGfBj+D2e0ZQjn/v8l6uTQQ
	jq+b0swX44OBj0il2TBGQypMl98Hr3vWx796eP+rlTFooC0WdqrimmbGqGQsQPSMwE8CQjlgglw
	WIthtIGpK7XG8uGhmucLyp
X-Received: by 2002:a53:c049:0:10b0:650:dbd:6f83 with SMTP id 956f58d0204a3-65e22825847mr5927369d50.48.1778892752241;
        Fri, 15 May 2026 17:52:32 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:21::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0db0b134sm3280844d50.13.2026.05.15.17.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:31 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 06/21] fuse: implement passthrough for getattr/statx
Date: Fri, 15 May 2026 17:39:49 -0700
Message-ID: <20260516004004.1455526-7-joannelkoong@gmail.com>
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
 fs/fuse/passthrough.c     | 36 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/fuse.h |  1 +
 4 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 05f69b8fa4c4..9a8e525f4d2b 100644
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
 
+	if (fuse_passthrough_op(inode, FUSE_GETATTR)) {
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
+	if (fuse_passthrough_op(inode, FUSE_GETATTR))
+		return fuse_passthrough_getattr(inode, NULL,
+						STATX_BASIC_STATS, 0);
+
 	return fuse_do_getattr(&nop_mnt_idmap, inode, NULL, NULL);
 }
 
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 502b3b3f7e89..389e28497dc7 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -991,6 +991,8 @@ void fuse_init_symlink(struct inode *inode);
 /*
  * Change attributes of an inode
  */
+void fuse_kstat_to_attr(struct fuse_conn *fc, const struct kstat *stat,
+			struct fuse_attr *attr);
 void fuse_change_attributes(struct inode *inode, struct fuse_attr *attr,
 			    struct fuse_statx *sx,
 			    u64 attr_valid, u64 attr_version);
@@ -1274,7 +1276,8 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 	(FUSE_PASSTHROUGH_RW_OPS | FUSE_PASSTHROUGH_OP_READDIR)
 
 /* Inode passthrough operations for backing file attached to inode */
-#define FUSE_PASSTHROUGH_INODE_OPS (0)
+#define FUSE_PASSTHROUGH_INODE_OPS \
+	(FUSE_PASSTHROUGH_OP_GETATTR)
 
 #define FUSE_BACKING_MAP_OP(map, op) \
 	((map)->ops_mask & FUSE_PASSTHROUGH_OP(op))
@@ -1358,6 +1361,9 @@ static inline bool fuse_passthrough_op(struct inode *inode, enum fuse_opcode op)
 	return fb && fb->ops_mask & FUSE_PASSTHROUGH_OP(op);
 }
 
+int fuse_passthrough_getattr(struct inode *inode, struct kstat *stat,
+			     u32 request_mask, unsigned int flags);
+
 #ifdef CONFIG_SYSCTL
 extern int fuse_sysctl_register(void);
 extern void fuse_sysctl_unregister(void);
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index a1d87ed51a94..7de038960b2f 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -219,3 +219,39 @@ void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing *fb)
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
+	struct fuse_backing *fb = fuse_inode_backing(fi);
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
+	/* Always override st_dev and st_ino with FUSE dev and ino */
+	stat->dev = inode->i_sb->s_dev;
+	stat->ino = inode->i_ino;
+
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

