Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08B33876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723525; cv=none; b=qWfk74DO9BF0mJqhpI9m2rxlZgV8/AxtJgBmdlkAM053jbAeoCboYBBcmhCVni5dvzHrgA0aXUCIQtvl+cCiVLKe6dH9uMnS1P6xN0YRw2WRUoj7+G3d3dCvBa25W2dN1EPUabqpQcDNVgYC78KhK8J8Xm4NTopxi1tR+z7V+Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723525; c=relaxed/simple;
	bh=XxTSY8mIfZB5Hs4G6owioHpXv5uwsVUdR7Ra//JaHiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ahnawn8vlxkvgCtwfootAL7j32MTnCwF8PPc4ksvZXiS93nJShePM8G3XT8XU8jr7FZvD9JQRjlk9bu6h0cGY3184tE3xqaYYcKu9tNpFYPQ1HB6AJmnlkhjayoPJ92FeUfLpBK17RpbwQ91hT0KQAuODFAnv/ZR+z9e566rD5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEwwSdCd; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEwwSdCd"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35fbca04006so1902595a91.1
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723523; x=1777328323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1W0SFFppKQ1m21HjpQdvoKgRhEwg3SakKhxaOhV3p3I=;
        b=ZEwwSdCdQI84dnwHtvM6U+E1306kWRhLzQzCAflAFYiMtAYMmdAmYBxVXPeuy1T3+t
         bqPdF62LXs0EVlAxir3NJoN9CfClMZ32KmcEUofXOYqitUEXr+nQjFCfAaj27I+4nwM1
         H6fv+7sMDjbrwG/w3V+Tu1Xm3d0PLxrYr5q/7uOYGuaNR3vO7E+W6KLON+B+23qtNeDx
         aJngfawV0XjQ980pIa3DeJKqk/cRxilsF84c2RXgdsX5BmuvbzoiXxPDLLOrH4lZQ/jp
         tsVrD1eXgQValLOijBPQP08f482hPk2IT3wCV8MxcRbO2bbkkMJt0KXzeBH6JUzcZmn2
         NSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723523; x=1777328323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1W0SFFppKQ1m21HjpQdvoKgRhEwg3SakKhxaOhV3p3I=;
        b=EC+w+OgpZKV+tkcjA3iwct4Plw6XOeGrAdTuUXTALRmAbIRXxs2+5LphcUoX8iLi/J
         XFpHqoXPHAcg8CpaejY/S5Q0SKoz+u/EAbDCpLPXzlPkp2+aVjFPDkRbj8KO4QQ/NFj4
         IIOlR8xdE0g+QlaI10DDsfbVpnJhrBIaNzK3/tLjFQnkdVsUpzBOSvEaEYbgZCz8Xsdz
         IZwKrWyKRyQh88U8VYz5FLdo8fxrrnBX6LfSq1j0EkwnmXSkvnsBlxfEvfcRrXmmjy8U
         ZrsnGqfw3XswDi/MQIEWJOjttmYuNT8cBGqoqLNopoFt05VwyWIJEl9N6/g1fEakyBxz
         061A==
X-Forwarded-Encrypted: i=1; AFNElJ897L7fS7mPgjdfzFoQNGJ4UQ9e9PvFFGG0OerbpSCBidZdE4v9IBzy2wIpTo1j+ibIMeEQIVtpRN2S@lists.linux.dev
X-Gm-Message-State: AOJu0YzXnjFGc12eu+Ipik+CDhJ+XursBmP1lUFzB3sZStRhY9Cut+ej
	ygVHmg/sMIjvaHkjbEM0nLdIHVGu1kq+/yOw+ureT8ZK3Jr9g3N+DB8e
X-Gm-Gg: AeBDievOcEtqBloKh56kmSOEIPlglMA8dRvFPlZprQfksyJd3JtAegyI0bORRK7HzoS
	m98QG8BM2dM81v+LxtHCyO7H+DIOgPTq/g/BaeuWNwcFlaK8weHnhRXqV3eEuulJglCY/gn9i9f
	HBWXG9475Vb5nkj5LpeqqCGXu1EpSNzioAXjXBRBscsRK4KSIYzEEmlzz/tiaKQaH/n4CHGLRQH
	6a13Ed8xwx/1lq2ITsjVbMbbjKyUIaZDVygiHAr1Qx0xMfcUuLZUs/IqWw+yMd9nCURPA3YrzNZ
	hqnbifdeHwX9z6BTbodK8OR0BuD5o6eejJvLWM0H4avetuoKr6qmQBKbE4RW/Y99M8U7u5yqsI6
	8CksPahcAaL/uzjuPayJSzdLBNU1wJ9qND1WFK34I3Q7vkrcnnQr0ykTsveRpQGRwqqa8lGwtNI
	K5xQt3OnNICPeTllY+qReG8rBnwIXa
X-Received: by 2002:a17:902:74c2:b0:2b0:6d33:e7c0 with SMTP id d9443c01a7336-2b5f9ecaea6mr122075045ad.1.1776723523089;
        Mon, 20 Apr 2026 15:18:43 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:48::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9fef42sm108798095ad.16.2026.04.20.15.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:42 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 07/17] fuse: prepare to setup backing inode passthrough on lookup
Date: Mon, 20 Apr 2026 15:16:27 -0700
Message-ID: <20260420221637.2631478-8-joannelkoong@gmail.com>
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
 fs/fuse/iomode.c      | 39 +++++++++++++++++++++++++++++++++++++++
 fs/fuse/passthrough.c | 12 +++++-------
 4 files changed, 68 insertions(+), 21 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 516f58e5ae18..85ac6f917779 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -16,6 +16,26 @@ struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
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
@@ -177,15 +197,3 @@ int fuse_backing_close(struct fuse_conn *fc, int backing_id)
 
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
index 1f279b5b618a..a15fb508fd28 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1584,7 +1584,7 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 #ifdef CONFIG_FUSE_PASSTHROUGH
 struct fuse_backing *fuse_backing_get(struct fuse_backing *fb);
 void fuse_backing_put(struct fuse_backing *fb);
-struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, int backing_id);
+struct fuse_backing *fuse_backing_id_get(struct fuse_conn *fc, int backing_id);
 #else
 
 static inline struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
@@ -1595,7 +1595,7 @@ static inline struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
 static inline void fuse_backing_put(struct fuse_backing *fb)
 {
 }
-static inline struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc,
+static inline struct fuse_backing *fuse_backing_id_get(struct fuse_conn *fc,
 						       int backing_id)
 {
 	return NULL;
@@ -1650,6 +1650,8 @@ ssize_t fuse_passthrough_splice_write(struct pipe_inode_info *pipe,
 ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma);
 int fuse_passthrough_readdir(struct file *file, struct dir_context *ctx);
 
+int fuse_inode_set_passthrough(struct inode *inode, int backing_id);
+
 static inline struct fuse_backing *fuse_inode_passthrough(struct fuse_inode *fi)
 {
 #ifdef CONFIG_FUSE_PASSTHROUGH
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index 54259ead41a4..7c4053160b8a 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -181,6 +181,45 @@ static void fuse_file_uncached_io_release(struct fuse_file *ff,
 	fuse_inode_uncached_io_end(inode);
 }
 
+/* Setup passthrough for inode operations without an open file */
+int fuse_inode_set_passthrough(struct inode *inode, int backing_id)
+{
+	struct fuse_conn *fc = get_fuse_conn(inode);
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct fuse_backing *fb;
+	int err;
+
+	if (!IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) || !fc->passthrough_ino)
+		return 0;
+
+	/* backing inode is set once for the lifetime of the inode */
+	if (fuse_inode_passthrough(fi))
+		return 0;
+
+	fb = fuse_backing_id_get(fc, backing_id);
+	if (IS_ERR_OR_NULL(fb)) {
+		err = fb ? PTR_ERR(fb) : -ENOENT;
+		fb = NULL;
+		goto fail;
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
index 1baac4f0cb68..514e4af46d79 100644
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

