Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E79139A04D
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331035; cv=none; b=ZQiFQXtgSx5m8Xfn0iMot3Izm6XOaClaJeLKL2Im/H4qnz8ZdFWQaXq3Sh1AQIeiSwdgWCTqG1N95sDtt14ueKTIjmyPRciPrEmkzQHT5nffzV2J06RqUQqTZhHRm6QJU+v/bLnxdMyFy2Jw7f7glgdajm2Aee74SRlLowzX8jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331035; c=relaxed/simple;
	bh=y+orVCH+zQgPdqn2Eusu6Cek91uZkd142JxB1UoYGcY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=LJbLXFD/QyxxFp0SGevEj8Qgmc/g1+l1hzIwhCWMpB4ISlG32E9w+OD1WQysi4UmD/K2BHG7h85EqnVy5W3yy2yZUeaD+lbVyGXmCngmzuvUfs5sNxwXo0I7dSS95Yu/ZCKgJ0XuPyF662E3Fex8O8m3tIkCMGc3EtvvtgA7X9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eDp5fMPv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eDp5fMPv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yhm7tF2hpHOWx+f/PeP+VBuIollGckemDuVHUk3dgZU=;
	b=eDp5fMPvG+isBiRUwuTkylLK56AgnaSzXMHyVIbU8Xh/TEVYUCHZlv7zyRuMVOZM3Of2Nv
	0Y8aIvcaHLbBVusf7DibzYEw2iMD1N7Ega2g9HWbaMrAqKdnRWOZyoEx80DIne8rUp/qEM
	9MkJ4KfTf6Tza8+a06RyAB3ph33fR9c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-RD3p-lvTPXigGax8yO6zsw-1; Thu, 16 Apr 2026 05:17:08 -0400
X-MC-Unique: RD3p-lvTPXigGax8yO6zsw-1
X-Mimecast-MFC-AGG-ID: RD3p-lvTPXigGax8yO6zsw_1776331028
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488c0fcc6deso47782855e9.2
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331027; x=1776935827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yhm7tF2hpHOWx+f/PeP+VBuIollGckemDuVHUk3dgZU=;
        b=VqX3j/Sf/eI4kq5xiCD8dCYPYp7fz9jGnVmbDwIICfnU36Tc6yyW7EH1ytjc8DiPmB
         pJsYErGb2ohVtQTXNwNoyWQh0wkCekX81Bd56r700kJ3nhq3v7lJtWEPyn/uBgtUcJUW
         sDaecrkNLQpZ3oFXGXPgKiUwxZMGFTLoWphbFhQ+2MpN4weoy9bAnc9Hng83yd5hVHZD
         S0cSZK3Enh2bbmby7NbpHk+ovkB1tMM2XKOU1uwQM9RMSX6P6QZApwHNETIgze/+QM52
         lUfaxDxMf0XrEtZ+W/Wx0FFJ0Cyof+T3UWbekJJe179Tl7NB/qWm4woUdO9sJOqUrGr+
         55qQ==
X-Gm-Message-State: AOJu0YxKzg0Qc+OpSGz8Su762cqGRG8vNh/pSHU4Qh/lqSoKSUxRreIB
	B79rF3aXsy/7x7qs5KaRc0PJrMitH47jl0sCWqRNNMgU5mUTbHTKlcmynFr7JUbR1JoDp73bAOU
	7+Ve5fPzg6n4L5pwoD7uzKyrSDXvLXqorG5NxAWKZk3Xl1DkZzy4NdaMHyi9Ydk7zWzq9rK4s2b
	VUd8566DVX5LO+qVM3J9ySgIkvkRmOy7rVcyUV37rtpqhfM5Q=
X-Gm-Gg: AeBDietxyabccehwoQoLHE20jsKSWkwkmT4w3xdII/0XFSs6UEiSAslOuOxTygC4+aj
	PH0O37kRg6U2xarrUOUZbRCKJ3Z4ySKOtW2xo/82+e5BLpuR97TF2KC8jBlx2JbyXd2b352LhE+
	rFKIHQvGqP/SvO1GAc4AxQAqMNAOw+VwjxlVDAQMbDWicmsf+xYgHOFNE8ADfgnbeCnPpHL6miQ
	zpfHFz3f4AhPekYClnaiQF60Bf6Xd3fG9QTn8gEiueN9CiM48XatYZhTyWaYNIz+KPKJ3rTMps8
	Ah4zQ7RjldIH3cXZg13jM+GDa4GrvOgq63hlyvHp9jm1X8cEQQhUqSRm8/p+RtcWIYuVkfinNOD
	GzAjOK3cFEqQ4GInKRBlG3HpdmXTv9YBxGMTg8SV3XjSJ5ErlHv+CmgxjxERIns0tKnqT+lMwq6
	uUDWFs/A==
X-Received: by 2002:a05:600c:3b0e:b0:487:20ee:bef6 with SMTP id 5b1f17b1804b1-488d67e65fdmr352299695e9.11.1776331027191;
        Thu, 16 Apr 2026 02:17:07 -0700 (PDT)
X-Received: by 2002:a05:600c:3b0e:b0:487:20ee:bef6 with SMTP id 5b1f17b1804b1-488d67e65fdmr352298905e9.11.1776331026553;
        Thu, 16 Apr 2026 02:17:06 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:05 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 04/32] fuse: move fuse_dev and fuse_pqueue to dev.c
Date: Thu, 16 Apr 2026 11:16:28 +0200
Message-ID: <20260416091658.462783-5-mszeredi@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416091658.462783-1-mszeredi@redhat.com>
References: <20260416091658.462783-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lBstyw8-WQO9tBgTLKMRfVfcu20uSS5JQpeeLGvCufA_1776331028
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Move function definitions to dev.c, struct definitions to fuse_dev_i.h.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.c        | 94 ++++++++++++++++++++++++++++++++++++++++++++
 fs/fuse/dev.h        |  4 ++
 fs/fuse/fuse_dev_i.h | 46 ++++++++++++++++++++++
 fs/fuse/fuse_i.h     | 46 ----------------------
 fs/fuse/inode.c      | 94 --------------------------------------------
 5 files changed, 144 insertions(+), 140 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index d3bcd8a11b40..416c144c6e0d 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -364,6 +364,100 @@ struct fuse_chan *fuse_dev_chan_new(void)
 }
 EXPORT_SYMBOL_GPL(fuse_dev_chan_new);
 
+void fuse_pqueue_init(struct fuse_pqueue *fpq)
+{
+	unsigned int i;
+
+	spin_lock_init(&fpq->lock);
+	for (i = 0; i < FUSE_PQ_HASH_SIZE; i++)
+		INIT_LIST_HEAD(&fpq->processing[i]);
+	INIT_LIST_HEAD(&fpq->io);
+	fpq->connected = 1;
+}
+
+struct fuse_dev *fuse_dev_alloc(void)
+{
+	struct fuse_dev *fud;
+	struct list_head *pq;
+
+	fud = kzalloc_obj(struct fuse_dev);
+	if (!fud)
+		return NULL;
+
+	refcount_set(&fud->ref, 1);
+	pq = kzalloc_objs(struct list_head, FUSE_PQ_HASH_SIZE);
+	if (!pq) {
+		kfree(fud);
+		return NULL;
+	}
+
+	fud->pq.processing = pq;
+	fuse_pqueue_init(&fud->pq);
+
+	return fud;
+}
+EXPORT_SYMBOL_GPL(fuse_dev_alloc);
+
+void fuse_dev_install(struct fuse_dev *fud, struct fuse_conn *fc)
+{
+	struct fuse_conn *old_fc;
+
+	spin_lock(&fc->lock);
+	/*
+	 * Pairs with:
+	 *  - xchg() in fuse_dev_release()
+	 *  - smp_load_acquire() in fuse_dev_fc_get()
+	 */
+	old_fc = cmpxchg(&fud->fc, NULL, fc);
+	if (old_fc) {
+		/*
+		 * failed to set fud->fc because
+		 *  - it was already set to a different fc
+		 *  - it was set to disconneted
+		 */
+		fc->connected = 0;
+	} else {
+		list_add_tail(&fud->entry, &fc->devices);
+		fuse_conn_get(fc);
+	}
+	spin_unlock(&fc->lock);
+}
+EXPORT_SYMBOL_GPL(fuse_dev_install);
+
+struct fuse_dev *fuse_dev_alloc_install(struct fuse_conn *fc)
+{
+	struct fuse_dev *fud;
+
+	fud = fuse_dev_alloc();
+	if (!fud)
+		return NULL;
+
+	fuse_dev_install(fud, fc);
+	return fud;
+}
+EXPORT_SYMBOL_GPL(fuse_dev_alloc_install);
+
+void fuse_dev_put(struct fuse_dev *fud)
+{
+	struct fuse_conn *fc;
+
+	if (!refcount_dec_and_test(&fud->ref))
+		return;
+
+	fc = fuse_dev_fc_get(fud);
+	if (fc && fc != FUSE_DEV_FC_DISCONNECTED) {
+		/* This is the virtiofs case (fuse_dev_release() not called) */
+		spin_lock(&fc->lock);
+		list_del(&fud->entry);
+		spin_unlock(&fc->lock);
+
+		fuse_conn_put(fc);
+	}
+	kfree(fud->pq.processing);
+	kfree(fud);
+}
+EXPORT_SYMBOL_GPL(fuse_dev_put);
+
 static void fuse_send_one(struct fuse_iqueue *fiq, struct fuse_req *req)
 {
 	req->in.h.len = sizeof(struct fuse_in_header) +
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index d5ccfae80115..1f8f2cf1ecfd 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -7,6 +7,7 @@
 
 struct fuse_conn;
 struct fuse_chan;
+struct fuse_dev;
 
 struct fuse_chan *fuse_chan_new(void);
 struct fuse_chan *fuse_dev_chan_new(void);
@@ -14,6 +15,9 @@ void fuse_chan_release(struct fuse_chan *fch);
 void fuse_chan_free(struct fuse_chan *fch);
 DEFINE_FREE(fuse_chan_free, struct fuse_chan *, if (_T) fuse_chan_free(_T))
 
+void fuse_dev_install(struct fuse_dev *fud, struct fuse_conn *fc);
+void fuse_dev_put(struct fuse_dev *fud);
+
 void fuse_init_server_timeout(struct fuse_conn *fc, unsigned int timeout);
 
 #endif /* _FS_FUSE_DEV_H */
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index eca9d463d571..e80409c2f496 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -92,6 +92,43 @@ struct fuse_chan {
 	struct fuse_iqueue iq;
 };
 
+#define FUSE_PQ_HASH_BITS 8
+#define FUSE_PQ_HASH_SIZE (1 << FUSE_PQ_HASH_BITS)
+
+struct fuse_pqueue {
+	/** Connection established */
+	unsigned connected;
+
+	/** Lock protecting accessess to  members of this structure */
+	spinlock_t lock;
+
+	/** Hash table of requests being processed */
+	struct list_head *processing;
+
+	/** The list of requests under I/O */
+	struct list_head io;
+};
+
+/**
+ * Fuse device instance
+ */
+struct fuse_dev {
+	/** Reference count of this object */
+	refcount_t ref;
+
+	/** Issue FUSE_INIT synchronously */
+	bool sync_init;
+
+	/** Fuse connection for this device */
+	struct fuse_conn *fc;
+
+	/** Processing queue */
+	struct fuse_pqueue pq;
+
+	/** list entry on fc->devices */
+	struct list_head entry;
+};
+
 struct fuse_copy_state {
 	struct fuse_req *req;
 	struct iov_iter *iter;
@@ -176,5 +213,14 @@ void fuse_request_assign_unique(struct fuse_iqueue *fiq, struct fuse_req *req);
  */
 u64 fuse_get_unique(struct fuse_iqueue *fiq);
 
+struct fuse_dev *fuse_dev_alloc_install(struct fuse_conn *fc);
+struct fuse_dev *fuse_dev_alloc(void);
+
+/**
+ * Initialize the fuse processing queue
+ */
+void fuse_pqueue_init(struct fuse_pqueue *fpq);
+
+
 #endif
 
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 29126f5cb66c..fd5f741693ca 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -469,43 +469,6 @@ struct fuse_req {
 	unsigned long create_time;
 };
 
-#define FUSE_PQ_HASH_BITS 8
-#define FUSE_PQ_HASH_SIZE (1 << FUSE_PQ_HASH_BITS)
-
-struct fuse_pqueue {
-	/** Connection established */
-	unsigned connected;
-
-	/** Lock protecting accessess to  members of this structure */
-	spinlock_t lock;
-
-	/** Hash table of requests being processed */
-	struct list_head *processing;
-
-	/** The list of requests under I/O */
-	struct list_head io;
-};
-
-/**
- * Fuse device instance
- */
-struct fuse_dev {
-	/** Reference count of this object */
-	refcount_t ref;
-
-	/** Issue FUSE_INIT synchronously */
-	bool sync_init;
-
-	/** Fuse connection for this device */
-	struct fuse_conn *fc;
-
-	/** Processing queue */
-	struct fuse_pqueue pq;
-
-	/** list entry on fc->devices */
-	struct list_head entry;
-};
-
 enum fuse_dax_mode {
 	FUSE_DAX_INODE_DEFAULT,	/* default */
 	FUSE_DAX_ALWAYS,	/* "-o dax=always" */
@@ -1227,11 +1190,6 @@ void fuse_change_entry_timeout(struct dentry *entry, struct fuse_entry_out *o);
  */
 struct fuse_conn *fuse_conn_get(struct fuse_conn *fc);
 
-/**
- * Initialize the fuse processing queue
- */
-void fuse_pqueue_init(struct fuse_pqueue *fpq);
-
 /**
  * Initialize fuse_conn
  */
@@ -1243,10 +1201,6 @@ void fuse_conn_init(struct fuse_conn *fc, struct fuse_mount *fm,
  */
 void fuse_conn_put(struct fuse_conn *fc);
 
-struct fuse_dev *fuse_dev_alloc_install(struct fuse_conn *fc);
-struct fuse_dev *fuse_dev_alloc(void);
-void fuse_dev_install(struct fuse_dev *fud, struct fuse_conn *fc);
-void fuse_dev_put(struct fuse_dev *fud);
 int fuse_send_init(struct fuse_mount *fm);
 
 /**
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 932d83883ce1..ac6a0b736fb9 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -969,17 +969,6 @@ static int fuse_show_options(struct seq_file *m, struct dentry *root)
 	return 0;
 }
 
-void fuse_pqueue_init(struct fuse_pqueue *fpq)
-{
-	unsigned int i;
-
-	spin_lock_init(&fpq->lock);
-	for (i = 0; i < FUSE_PQ_HASH_SIZE; i++)
-		INIT_LIST_HEAD(&fpq->processing[i]);
-	INIT_LIST_HEAD(&fpq->io);
-	fpq->connected = 1;
-}
-
 void fuse_conn_init(struct fuse_conn *fc, struct fuse_mount *fm,
 		    struct user_namespace *user_ns, struct fuse_chan *fch)
 {
@@ -1597,89 +1586,6 @@ static int fuse_bdi_init(struct fuse_conn *fc, struct super_block *sb)
 	return 0;
 }
 
-struct fuse_dev *fuse_dev_alloc(void)
-{
-	struct fuse_dev *fud;
-	struct list_head *pq;
-
-	fud = kzalloc_obj(struct fuse_dev);
-	if (!fud)
-		return NULL;
-
-	refcount_set(&fud->ref, 1);
-	pq = kzalloc_objs(struct list_head, FUSE_PQ_HASH_SIZE);
-	if (!pq) {
-		kfree(fud);
-		return NULL;
-	}
-
-	fud->pq.processing = pq;
-	fuse_pqueue_init(&fud->pq);
-
-	return fud;
-}
-EXPORT_SYMBOL_GPL(fuse_dev_alloc);
-
-void fuse_dev_install(struct fuse_dev *fud, struct fuse_conn *fc)
-{
-	struct fuse_conn *old_fc;
-
-	spin_lock(&fc->lock);
-	/*
-	 * Pairs with:
-	 *  - xchg() in fuse_dev_release()
-	 *  - smp_load_acquire() in fuse_dev_fc_get()
-	 */
-	old_fc = cmpxchg(&fud->fc, NULL, fc);
-	if (old_fc) {
-		/*
-		 * failed to set fud->fc because
-		 *  - it was already set to a different fc
-		 *  - it was set to disconneted
-		 */
-		fc->connected = 0;
-	} else {
-		list_add_tail(&fud->entry, &fc->devices);
-		fuse_conn_get(fc);
-	}
-	spin_unlock(&fc->lock);
-}
-EXPORT_SYMBOL_GPL(fuse_dev_install);
-
-struct fuse_dev *fuse_dev_alloc_install(struct fuse_conn *fc)
-{
-	struct fuse_dev *fud;
-
-	fud = fuse_dev_alloc();
-	if (!fud)
-		return NULL;
-
-	fuse_dev_install(fud, fc);
-	return fud;
-}
-EXPORT_SYMBOL_GPL(fuse_dev_alloc_install);
-
-void fuse_dev_put(struct fuse_dev *fud)
-{
-	struct fuse_conn *fc;
-
-	if (!refcount_dec_and_test(&fud->ref))
-		return;
-
-	fc = fuse_dev_fc_get(fud);
-	if (fc && fc != FUSE_DEV_FC_DISCONNECTED) {
-		/* This is the virtiofs case (fuse_dev_release() not called) */
-		spin_lock(&fc->lock);
-		list_del(&fud->entry);
-		spin_unlock(&fc->lock);
-
-		fuse_conn_put(fc);
-	}
-	kfree(fud->pq.processing);
-	kfree(fud);
-}
-EXPORT_SYMBOL_GPL(fuse_dev_put);
-
 static void fuse_fill_attr_from_inode(struct fuse_attr *attr,
 				      const struct fuse_inode *fi)
 {
-- 
2.53.0

