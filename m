Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769525228D
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892757; cv=none; b=kFG1vhfnGXc+Teln8Fmjnhdil3suiH5RA2S9e2jH/552kEdUHpFOcKFzihQQZ0pe0hXYDCwiWbs/Levmz+SzupGBPFiRdZrH89Nxc2dokZUeIVqdwXX+BH1MN1cvJXIxxcos+tjCZ1jb9n46v07o5ho+3ee96NBQ0C3ejeX1WJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892757; c=relaxed/simple;
	bh=rkdoWF2UR0uq6E1mFSAg3lE3ANZj9IfGK1CxHSh7FEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HGrrg1r321Wcov2Mc6/bZkLq9BCdsnBOBgx1ZivOuLe+wq5v4V73AZq3gWd6hmXXdmHt10buaQbDjP180MYPX5Dkqx34Q6GttQvC5iIWMonJdoCSID4STZRJEcbIkRY6DBKgjwlvh1S75d7U4woA7ZA8wlMsUw6wNKoQxawm0ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrKLNEEN; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrKLNEEN"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7ca947f9b00so477917b3.0
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892755; x=1779497555; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIb2EQ0qB0qDKDILIVr7WEUoUFQaHrTDE6xGfjzccqE=;
        b=IrKLNEEN7tjJl0OqhhBJxyLdmsqIxCJO1lVuDdAQTLXZfLBTniwI6atD8avREhqNTM
         4Po7LTrohhumv1NfSibxxQdolB7vPra0vhv86Y9OKYmzUiQdFOZuouVLHX2p/IoOoghA
         Wwph00bMdJaRSYqIYEkFqJY3rk/cB2lKwdS4pjG0SoxcvcN2M/AXowYI5kgi7QMmn8VU
         FtWSr04iW6NrNUEqBFtx+LlWeG6qaKPTNkyXOy1h17q/KA/PiUVzBBsoCbEkcBw4wzRv
         wbczdS6R5vfOF/ZeA0sIHnvsFUVJfSU7ZLDtRSL7A1q1lWG75Mj6D1Tw9n1ZfsDgtIDS
         EF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892755; x=1779497555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UIb2EQ0qB0qDKDILIVr7WEUoUFQaHrTDE6xGfjzccqE=;
        b=YCRzB5nJ+rsUe3E6/PDI3N4hm7pcV20vklXKyRaqnIev/hyl3TArVCV2M12CUYsbrU
         1iG4Cv2zsieMLVFJWt9uhS3aWWezMTZFU0cyxzw+3uQppa/6+UyZwwtwKz/1eWFtmGpM
         DFUvW4RlsM2/naH/vOr3xSEBfN0Hm3butt0KZYwjxURGF1wLkg+lf+RPGwDjh/eH8av+
         uMC5STn4cdLleLLbZF3hqqhyhndnmEt9KqDXlVnLaHzwcHR+rn3lIeLjXvUiycvUMJq1
         gjWO9QlKsb6SvwO6aNCtrSe2tIpC8JMPvq15uZbSSgxttJDpAZZOtev6jMZ3fDVpMe0D
         NUyQ==
X-Gm-Message-State: AOJu0YyarRmjKON1dVZ7bq9GW5aB9Dyj87KajcFvoANLlrXx8Qo2fISW
	haQQU7SYY5H5e8KiXk37s+LWHeW4w0/ExzwvY4a+y+snXHywoQFsKPXx
X-Gm-Gg: Acq92OG7PWCjMflnuzNUCwxMdqXehDa7VqRCtRIhWuV2JtmkaJTTQlv6ECp83Xyljdb
	0+2Suu2E4CfEiYMROwt2RsxPXonIR/zcCcGmAl9dwADUGjN30I0WGiaILUHAN87zgtHtWFUebHc
	RqOe1daNogRZgb+RdZqcoh0TaY+7bnWHdgBnQL+5JBB/KLXKcWDDgageISmD1/trcOEdK2QEGSN
	uiYLf7xJtxqGDHP+fzy+K41hjrS1nzUWT1Pz7htGczDIC0ZGU7rN3gNwHq3ZLDlteRnG869Zese
	pD3KBJhk0yEJLUDcWNW6Brvbq0RDKKziKuesitUZ275UnxNgB1YXp9twZ/a4k8iE64PUGbgMHUA
	UzoJ7resz8W+/i5mxrECfClBWqbszmR1zdJrY5+nm8gi5NF1LXOr+HUlj3wZmdCDuGqs48YB+Tv
	e/+dGxEC/sBxkfjOoaE/CDr4PtcidQKA==
X-Received: by 2002:a05:690c:c50c:b0:798:4f55:2c5e with SMTP id 00721157ae682-7c95b82a6f4mr71818887b3.30.1778892754640;
        Fri, 15 May 2026 17:52:34 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:e::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c955d8d3aesm21318587b3.30.2026.05.15.17.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:34 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 07/21] fuse: prepare to setup backing inode passthrough on lookup
Date: Fri, 15 May 2026 17:39:50 -0700
Message-ID: <20260516004004.1455526-8-joannelkoong@gmail.com>
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

Add a helper for requesting to associate a backing inode for inode
passthrough operations.

This helper is expected to be used to setup backing inode on lookup
response.

The minimal requirement for the backing inode is to support the
GETATTR passthrough op.

Unlike setting of passthrough from open, this mapping is created for
the entire lifetime of the inode and cannot be changed later.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/fuse/backing.c     | 32 ++++++++++++++++++++------------
 fs/fuse/fuse_i.h      |  6 ++++--
 fs/fuse/iomode.c      | 43 +++++++++++++++++++++++++++++++++++++++++++
 fs/fuse/passthrough.c | 12 +++++-------
 4 files changed, 72 insertions(+), 21 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 52fccb9ff283..2234ab47406a 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -17,6 +17,26 @@ struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
 	return NULL;
 }
 
+/*
+ * Get fuse backing object by backing id.
+ *
+ * Returns an fb object with elevated refcount to be stored in fuse inode.
+ */
+struct fuse_backing *fuse_backing_id_get(struct fuse_conn *fc, int backing_id)
+{
+	struct fuse_backing *fb;
+
+	if (backing_id <= 0)
+		return ERR_PTR(-EINVAL);
+
+	rcu_read_lock();
+	fb = idr_find(&fc->backing_files_map, backing_id);
+	fb = fuse_backing_get(fb);
+	rcu_read_unlock();
+
+	return fb;
+}
+
 static void fuse_backing_free(struct fuse_backing *fb)
 {
 	pr_debug("%s: fb=0x%p\n", __func__, fb);
@@ -178,15 +198,3 @@ int fuse_backing_close(struct fuse_conn *fc, int backing_id)
 
 	return err;
 }
-
-struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, int backing_id)
-{
-	struct fuse_backing *fb;
-
-	rcu_read_lock();
-	fb = idr_find(&fc->backing_files_map, backing_id);
-	fb = fuse_backing_get(fb);
-	rcu_read_unlock();
-
-	return fb;
-}
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 389e28497dc7..9e5142a94a09 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1289,7 +1289,7 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 #ifdef CONFIG_FUSE_PASSTHROUGH
 struct fuse_backing *fuse_backing_get(struct fuse_backing *fb);
 void fuse_backing_put(struct fuse_backing *fb);
-struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, int backing_id);
+struct fuse_backing *fuse_backing_id_get(struct fuse_conn *fc, int backing_id);
 #else
 
 static inline struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
@@ -1300,7 +1300,7 @@ static inline struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
 static inline void fuse_backing_put(struct fuse_backing *fb)
 {
 }
-static inline struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc,
+static inline struct fuse_backing *fuse_backing_id_get(struct fuse_conn *fc,
 						       int backing_id)
 {
 	return NULL;
@@ -1353,6 +1353,8 @@ ssize_t fuse_passthrough_splice_write(struct pipe_inode_info *pipe,
 ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma);
 int fuse_passthrough_readdir(struct file *file, struct dir_context *ctx);
 
+int fuse_inode_set_passthrough(struct inode *inode, int backing_id);
+
 static inline bool fuse_passthrough_op(struct inode *inode, enum fuse_opcode op)
 {
 	struct fuse_inode *fi = get_fuse_inode(inode);
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index 6e2ddfe384b3..3483aaec698e 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -181,6 +181,49 @@ static void fuse_file_uncached_io_release(struct fuse_file *ff,
 	fuse_inode_uncached_io_end(inode);
 }
 
+/* Setup passthrough for inode operations without an open file */
+int fuse_inode_set_passthrough(struct inode *inode, int backing_id)
+{
+	struct fuse_conn *fc = get_fuse_conn(inode);
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct fuse_backing *current_fb, *fb;
+	int err;
+
+	if (!IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) || !fc->passthrough_ino)
+		return 0;
+
+	fb = fuse_backing_id_get(fc, backing_id);
+	if (IS_ERR_OR_NULL(fb)) {
+		err = fb ? PTR_ERR(fb) : -ENOENT;
+		fb = NULL;
+		goto fail;
+	}
+
+	current_fb = fuse_inode_backing(fi);
+	if (current_fb) {
+		/* Different backing file on same inode is not allowed */
+		err = current_fb == fb ? 0 : -EBUSY;
+		fuse_backing_put(fb);
+		return err;
+	}
+
+	/* Backing inode requires at least GETATTR op passthrough */
+	err = -EOPNOTSUPP;
+	if (!(fb->ops_mask & FUSE_PASSTHROUGH_OP_GETATTR))
+		goto fail;
+
+	err = fuse_inode_uncached_io_start(inode, NULL, fb);
+	if (err)
+		goto fail;
+
+	return 0;
+fail:
+	fuse_backing_put(fb);
+	pr_debug("failed to setup backing inode (ino=%lu, backing_id=%d, err=%i).\n",
+		 inode->i_ino, backing_id, err);
+	return err;
+}
+
 /*
  * Open flags that are allowed in combination with FOPEN_PASSTHROUGH.
  * A combination of FOPEN_PASSTHROUGH and FOPEN_DIRECT_IO means that read/write
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index 7de038960b2f..f2025772c9c1 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -181,14 +181,12 @@ struct fuse_backing *fuse_passthrough_open(struct file *file, int backing_id)
 	struct file *backing_file;
 	int err;
 
-	err = -EINVAL;
-	if (backing_id <= 0)
-		goto out;
-
-	err = -ENOENT;
-	fb = fuse_backing_lookup(fc, backing_id);
-	if (!fb)
+	fb = fuse_backing_id_get(fc, backing_id);
+	if (IS_ERR_OR_NULL(fb)) {
+		err = fb ? PTR_ERR(fb) : -ENOENT;
+		fb = NULL;
 		goto out;
+	}
 
 	/* Allocate backing file per fuse file to store fuse path */
 	backing_file = backing_file_open(&file->f_path, file->f_flags,
-- 
2.52.0

