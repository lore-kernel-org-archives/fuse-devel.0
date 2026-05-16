Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D44122F01
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892743; cv=none; b=rYKxCPv/ThKnVY/NaRPBN8K5opbPwJygPzk8VtsHh8nylVVSYQIGsNJtlS7aqr8DZJt3znSlQkevCMojex0WIM86gq8uYLQl4ftTOsk6GktbZNaO3Iyk+1INrS7Wr1x2eC20uNvRicZTD8BkfEWo6bWoemCv8K1cXe6a/7bobUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892743; c=relaxed/simple;
	bh=10D0ja0jF1GRSukhZRjVHm4xdQKInIOaKWH83rqfQHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/gUwYvdHSPSPbLtetBWhnUwqkKWU3Hd4XyCUHDnUUiz5jtWTu06PXArXFJJbkv7n5Uu1+IsuNKqBVxfUeuhJNLvDU6/gtM2zSXKxZR7YWI4nmTIGpPu4YRA2yZ8Fa5qW6g6JPky5BsFAPSIyjblqXg2zo+yxRGLXvCtx6fG7HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mO/zJyd8; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mO/zJyd8"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7bb0d18c7f9so411947b3.0
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892741; x=1779497541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sABNTlcrpy8GkKAinGpMmGxZyagpdpaCZg/KPONrsY=;
        b=mO/zJyd8ETPJJE1M8cCMhbpb3r/xHfSKJPpaC34rEopBZNFIjGYThyqvNXb51tB+ZB
         70KQMw9hA+Ig0IwX/x67Vlg1qO2WVjlSudbQT45t2ArfaehMB8xYMWrUKFk26NrSFlBT
         UpbD2BR9PRZS7o5P1UcvHCYA12qfGQsnTlKLSAkGTIWropDxi1snplOAVpsX3HVLL4Qc
         kr9cTDowhf+9eRKn0jANdbqxzQy4/Y/D3z4OqJeFqtHfNw1L6UeYUMNsDahM/F00gVob
         PRbKkbw0VAIor21LPOHiTM+Xcy7Czltb7g/Tl96E0NBOvTw+PZMP/IZcb4oRIcnObXFW
         pXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892741; x=1779497541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0sABNTlcrpy8GkKAinGpMmGxZyagpdpaCZg/KPONrsY=;
        b=TWeaOzkkMlMaUZBJrKBJ9XkWPDvwyUI4yWJPITppDc1enU4zYgApPfcYo4LsjAAGwj
         4myuY2lE0te1PhMsBPOw4Z3U0XJMQQjAoyXZYO0K3v5zx479nc3uETZMDOVEiP5Pr86r
         OoniF2e8cP//pwvqbVK8qWs1nw/51pu/VI/RZ6bs6Vbhq6DX559nxvyf+g2wTkWSFlxL
         yC91ynaiaCTVZ7qjmuAizxVjJAQIEnVmsGmx9til3fZJLFw1dofxTZ7NnhWXFnNOfX8G
         21iSgX8OSIxqjHZfAqzgtt5jMM4BCTmpBYebxj/S0EP9U+iKllpozk/tgr/5/JzBLg1K
         7nTw==
X-Gm-Message-State: AOJu0YzTnCImIVIqaIyk7ZJHPAgHR15CGALBTssITwhUp/GUdzz0iRod
	FppbGmyuaFBOrTq9czyJpSE3ybFVsRNpu16imkqFQH/GC+UR4ywfJ5RN
X-Gm-Gg: Acq92OG42ScvEgWgMSVeho1zpJSqwTwV3+986jU+6ExJi4v0hh6TNuDk3AAHsiBKef/
	OTG5Y6Oei2578b/0tr7KFhZEilTp6rzzsrEIQrAxauI6ywGM90SJDcpk5J7mVf2iLAFK+pKezGe
	IOC47qc+T3sk0EcbkE+8Sq1bCRYsSUE5DzTlxRG3Hv+tpUu/Id3ff1EkzKcRN0VntMywskfpYXF
	8eTxENtmAHmbYkYZsdYTtd3AIxi7Qs1lLUeuxqbW+SAGzLpS7ln1Be5gbGIwU+yXzrvY8dulT4x
	fA80lCm92c+WqCmX8g0VGiz/ynb4rqhbxvU1WLjB6q3cmlT6EWbqhn/1pGiMNx+mEy4946L0OJ4
	tUuvnHX4QSNIrKzRGHNmVhwU+cyrev/YpDKKZtOZICV06DPm4NI22gf81jOoa5ySdi1oUa5ruk1
	L+eb/zX+kTLT17VSI+ahc=
X-Received: by 2002:a05:690c:9304:b0:7ba:fdc5:17e4 with SMTP id 00721157ae682-7c95a087a3bmr61536887b3.22.1778892740736;
        Fri, 15 May 2026 17:52:20 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:a::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b2d44sm38058107b3.11.2026.05.15.17.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:19 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 02/21] fuse: prepare for passthrough of inode operations
Date: Fri, 15 May 2026 17:39:45 -0700
Message-ID: <20260516004004.1455526-3-joannelkoong@gmail.com>
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

So far, fuse passthrough was implemented for read/write/splice/mmap
operations for regular files opened with FOPEN_PASSTHROUGH.

A backing file is attached to a fuse inode, but only for as long as
there are FOPEN_PASSTHROUGH files opened on this inode.

We would like to attach a backing file to fuse inode also without an
open file to allow passthrough of some inode operations.

Add field ops_mask to the input argument of FUSE_DEV_IOC_BACKING_OPEN
ioctl to declare the operations that would passthrough to the backing
file once it has been attached to the fuse inode on lookup.

Setting the FUSE_READ/FUSE_WRITE operations in the ops_mask is not
required because those operations are implied by FOPEN_PASSTHROUGH.

When setting operations other than FUSE_READ/FUSE_WRITE in ops_mask,
non-regular backing files are allowed, so we need to verify when
attaching a backing file to a fuse inode, that their file types match.

For simplification of inode attribute caching, for now, require a
filesystem with FUSE_PASSTHROUGH_INO (one-to-one mapping from fuse inode
to backing inode) for setting up passthrough of any inode operations.
We may consider relaxing this requirement for some inode operations
in the future.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/fuse/backing.c         | 13 ++++++++++---
 fs/fuse/fuse_i.h          | 30 ++++++++++++++++++++++++++++++
 fs/fuse/iomode.c          | 16 ++++++++++++++++
 include/uapi/linux/fuse.h |  9 ++++++++-
 4 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 3d3f49c2dd42..1fbb4d876eec 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -87,7 +87,8 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 	struct fuse_backing *fb = NULL;
 	int res;
 
-	pr_debug("%s: fd=%d flags=0x%x\n", __func__, map->fd, map->flags);
+	pr_debug("%s: fd=%d flags=0x%x ops_mask=0x%llx\n", __func__,
+		 map->fd, map->flags, map->ops_mask);
 
 	/* TODO: relax CAP_SYS_ADMIN once backing files are visible to lsof */
 	res = -EPERM;
@@ -95,7 +96,11 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 		goto out;
 
 	res = -EINVAL;
-	if (map->flags || map->padding)
+	if (map->flags || map->ops_mask & ~FUSE_BACKING_MAP_VALID_OPS)
+		goto out;
+
+	/* For now passthrough inode operations requires FUSE_PASSTHROUGH_INO */
+	if (!fc->passthrough_ino && map->ops_mask & FUSE_PASSTHROUGH_INODE_OPS)
 		goto out;
 
 	file = fget_raw(map->fd);
@@ -105,7 +110,8 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 
 	/* read/write/splice/mmap passthrough only relevant for regular files */
 	res = d_is_dir(file->f_path.dentry) ? -EISDIR : -EINVAL;
-	if (!d_is_reg(file->f_path.dentry))
+	if (!(map->ops_mask & ~FUSE_PASSTHROUGH_RW_OPS) &&
+	    !d_is_reg(file->f_path.dentry))
 		goto out_fput;
 
 	backing_sb = file_inode(file)->i_sb;
@@ -120,6 +126,7 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 
 	fb->file = file;
 	fb->cred = prepare_creds();
+	fb->ops_mask = map->ops_mask;
 	refcount_set(&fb->count, 1);
 
 	res = fuse_backing_id_alloc(fc, fb);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 0b925ac3e195..8e54dc7d56af 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -92,6 +92,7 @@ struct fuse_submount_lookup {
 struct fuse_backing {
 	struct file *file;
 	struct cred *cred;
+	u64 ops_mask;
 
 	/* refcount */
 	refcount_t count;
@@ -254,6 +255,8 @@ enum {
 	 * or the fuse server has an exclusive "lease" on distributed fs
 	 */
 	FUSE_I_EXCLUSIVE,
+	/* Has backing file for inode ops passthrough */
+	FUSE_I_PASSTHROUGH,
 };
 
 struct fuse_conn;
@@ -1252,6 +1255,25 @@ struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
 void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 		       unsigned int open_flags, fl_owner_t id, bool isdir);
 
+/* passthrough.c */
+
+/* READ/WRITE are implied by FOPEN_PASSTHROUGH, but defined for completeness */
+#define FUSE_PASSTHROUGH_RW_OPS \
+	(FUSE_PASSTHROUGH_OP_READ | FUSE_PASSTHROUGH_OP_WRITE)
+
+/* File passthrough operations require a file opened with FOPEN_PASSTHROUGH */
+#define FUSE_PASSTHROUGH_FILE_OPS \
+	(FUSE_PASSTHROUGH_RW_OPS)
+
+/* Inode passthrough operations for backing file attached to inode */
+#define FUSE_PASSTHROUGH_INODE_OPS (0)
+
+#define FUSE_BACKING_MAP_OP(map, op) \
+	((map)->ops_mask & FUSE_PASSTHROUGH_OP(op))
+
+#define FUSE_BACKING_MAP_VALID_OPS \
+	(FUSE_PASSTHROUGH_FILE_OPS | FUSE_PASSTHROUGH_INODE_OPS)
+
 /* backing.c */
 #ifdef CONFIG_FUSE_PASSTHROUGH
 struct fuse_backing *fuse_backing_get(struct fuse_backing *fb);
@@ -1319,6 +1341,14 @@ ssize_t fuse_passthrough_splice_write(struct pipe_inode_info *pipe,
 				      size_t len, unsigned int flags);
 ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma);
 
+static inline bool fuse_passthrough_op(struct inode *inode, enum fuse_opcode op)
+{
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct fuse_backing *fb = fuse_inode_backing(fi);
+
+	return fb && fb->ops_mask & FUSE_PASSTHROUGH_OP(op);
+}
+
 #ifdef CONFIG_SYSCTL
 extern int fuse_sysctl_register(void);
 extern void fuse_sysctl_unregister(void);
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index ca3b28597722..5517711a3eca 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -96,6 +96,11 @@ int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb)
 		err = -EBUSY;
 		goto unlock;
 	}
+	/* fuse and backing file types must match */
+	if (fb && ((fb->file->f_inode->i_mode ^ inode->i_mode) & S_IFMT)) {
+		err = -EIO;
+		goto unlock;
+	}
 	/* With FUSE_PASSTHROUGH_INO, fuse and backing ino must match */
 	if (fb && fc->passthrough_ino &&
 	    fb->file->f_inode->i_ino != inode->i_ino) {
@@ -176,6 +181,7 @@ static int fuse_file_passthrough_open(struct inode *inode, struct file *file)
 {
 	struct fuse_file *ff = file->private_data;
 	struct fuse_conn *fc = get_fuse_conn(inode);
+	struct fuse_inode *fi = get_fuse_inode(inode);
 	struct fuse_backing *fb;
 	int err;
 
@@ -188,11 +194,21 @@ static int fuse_file_passthrough_open(struct inode *inode, struct file *file)
 	if (IS_ERR(fb))
 		return PTR_ERR(fb);
 
+	/*
+	 * Inode ops passthrough requires backing file setup at
+	 * creation/lookup time.
+	 */
+	err = -EOPNOTSUPP;
+	if (!fuse_inode_backing(fi) &&
+	    (fb->ops_mask & FUSE_PASSTHROUGH_INODE_OPS))
+		goto fail;
+
 	/* First passthrough file open denies caching inode io mode */
 	err = fuse_file_uncached_io_open(inode, ff, fb);
 	if (!err)
 		return 0;
 
+fail:
 	fuse_passthrough_release(ff, fb);
 	fuse_backing_put(fb);
 
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 4be9ccc5b3ff..0f1e1c1ec367 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -243,6 +243,7 @@
  *
  *  7.46
  *  - add FUSE_PASSTHROUGH_INO
+ *  - add ops_mask field to struct fuse_backing_map
  */
 
 #ifndef _LINUX_FUSE_H
@@ -1133,9 +1134,15 @@ struct fuse_notify_prune_out {
 struct fuse_backing_map {
 	int32_t		fd;
 	uint32_t	flags;
-	uint64_t	padding;
+	uint64_t	ops_mask;
 };
 
+#define FUSE_PASSTHROUGH_OP(op)	(1ULL << ((op) - 1))
+
+/* op bits for fuse_backing_map ops_mask */
+#define FUSE_PASSTHROUGH_OP_READ	FUSE_PASSTHROUGH_OP(FUSE_READ)
+#define FUSE_PASSTHROUGH_OP_WRITE	FUSE_PASSTHROUGH_OP(FUSE_WRITE)
+
 /* Device ioctls: */
 #define FUSE_DEV_IOC_MAGIC		229
 #define FUSE_DEV_IOC_CLONE		_IOR(FUSE_DEV_IOC_MAGIC, 0, uint32_t)
-- 
2.52.0

