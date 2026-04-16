Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF99539A800
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331048; cv=none; b=RELA7AuWx+Fo/ABVdQ+myxLrEWreLOLJMPCwStZVynIXy4GTqpd1cJvpCEGRuvHQAyLOsdD7IE1jn4clQBH6BLdk/Py8/Ps6T9nMYjoTRyFiDdjc/ajx2NaEhN98ohqumsH6l4xBKjNAyAJRst5oajseeUQx1bvwa+SE6nldJ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331048; c=relaxed/simple;
	bh=B6tfrUXgHMIplKvxjVlZ0rJuFia4j5csfd5kXqSFBAA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=nxvT/2jrEfIzjyzJMjeurVKMuyKsL1tu9flS0QJPArsNXzTIQuSv7gFrVNHUF2iFHZDiqgcB7Gn1huZexxqYhbjTO+aznp0BNocy4STq7O6cMsqGmPthsTOPQdfM3ORZ2CmrI3lI87m7OCTUkQxMpFojQ0gBYDT0mj4dOhaTDPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gcWX92H2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gcWX92H2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qaFpey7Gno59NYREHz6EyyD8pDWjNfZ7ACS9nMM9NnU=;
	b=gcWX92H2ZJ8cml+Kp5JCjkwP35uzSVxykssZYl4JcHqo7FRFypslne4D/VRT3wtO6Ti0Ge
	c06Lkw9SD8/wL0Ai8G5kfYv3krZbgnNnkZK+VoYQcUnloTZDHxZEx/MuOgDR8f0dxk489W
	9Mv19vWXtS+9+SUy5w7AXY85fqltzv4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-rWDKN6oiP9GKes_kPNBjbg-1; Thu, 16 Apr 2026 05:17:22 -0400
X-MC-Unique: rWDKN6oiP9GKes_kPNBjbg-1
X-Mimecast-MFC-AGG-ID: rWDKN6oiP9GKes_kPNBjbg_1776331041
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d121c4271so4918678f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331040; x=1776935840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qaFpey7Gno59NYREHz6EyyD8pDWjNfZ7ACS9nMM9NnU=;
        b=jn32GEeKwN/JcmFQPy4M+sH4lIlZLRT1OoO2kPlvKjLPYf1q1zP/Ta5Vaki4paVHLt
         Axms4s7MtrtgH+/IYSo7l2KWewoMtOLdx4Unt94DWmzPZDnncU3srtOihjoj244/dWEq
         LwIsDZnS1wlGLgypnH+x7xsVZS7jT0AoB7jdh2iuTyeBH3uijRnEZbl9F7C7UNcxNuww
         j2qxZt9EQj2uo5Jv1cg4UN1UNKVOgXPE1qJcV6Fey0Rj30yk3inHrpGOzRT8FvJS6X3Z
         Y48ny9FpiUsdsgt4Xsj1k0nsVEc6y0HMmbEu68ajPWQgs7l9b5VEJtyeFajp7V0dEitH
         XEoA==
X-Gm-Message-State: AOJu0Yyq0gDHeaZIas57oSSahkdLx5yM6mxYa+211mw7uYjJ74V2rK2m
	YPcZOfzV2X+FAkuAz3DBJLcHWLn63UUwa7i0Mdy0vI26JZH1V6qpRYBKHP/WZCk2FcpoYfwTn/O
	nyQW5FP9l8/VNRNvb+flTy9DSP3PvZQRQ0hyuyVGu/KMTMK7HOvqeKBI6BEDn4eY01AMZfjVTFJ
	KpnwSIUGeVONO/XOxNpbB0xnixMhhixRE/6SLXTDxgnnPYdZY=
X-Gm-Gg: AeBDiev2cCnAaJVD6FahkVd+zSDQMLP/yWBYjRqVNSlBoswlah+7rtTLMDEy3ONCcDA
	2rbS837XfKMq4iOkkKKgE1hWMbnOvgmdvhybg+xwSuYOq4f54EU3xmWQoyo6ZRRFxQMnTpjhLgU
	ojWphNGk/ikGwSt3PQrkgz5IeVwSv8vAz+Mivip7puVJGjCd63P8CkW1eTRuridK24dFfQEE9Xu
	thTt9bj8eyAZeO4vJ1w7sm+Bvvmy1z8uR82d/aXZbCDPBWrd+cEFT3kHGBe4sSQT63+MefbAGrL
	FcMQYCT0FpGrzziOIJ5YWEd/qppxUxelpFBihhi5ZHBPMG8L/OKjrmRB4M2YGQLp/6fZxUPK2ud
	CxCvEK39xG2ImPXNTPbjzRj06mfxkURbtF4wdu9z1b1GcA+9+MXl+8+xv+KSSlj3ggWZfS+TrEO
	swBPfZXg==
X-Received: by 2002:a05:600c:4e48:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-488d685655dmr353660645e9.21.1776331040327;
        Thu, 16 Apr 2026 02:17:20 -0700 (PDT)
X-Received: by 2002:a05:600c:4e48:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-488d685655dmr353660035e9.21.1776331039721;
        Thu, 16 Apr 2026 02:17:19 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:19 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 13/32] fuse: move struct fuse_req and related to fuse_dev_i.h
Date: Thu, 16 Apr 2026 11:16:37 +0200
Message-ID: <20260416091658.462783-14-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: __cLQJNlNSip_3sG6T6mJeKlotko8rGgSyalrStu-O4_1776331041
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/fuse_dev_i.h | 91 +++++++++++++++++++++++++++++++++++++++++++-
 fs/fuse/fuse_i.h     | 91 --------------------------------------------
 2 files changed, 90 insertions(+), 92 deletions(-)

diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 2e0193acc9c2..f20a28448e55 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -17,10 +17,95 @@ extern struct wait_queue_head fuse_dev_waitq;
 struct fuse_arg;
 struct fuse_args;
 struct fuse_pqueue;
-struct fuse_req;
 struct fuse_iqueue;
 struct fuse_forget_link;
 
+/**
+ * Request flags
+ *
+ * FR_ISREPLY:		set if the request has reply
+ * FR_FORCE:		force sending of the request even if interrupted
+ * FR_BACKGROUND:	request is sent in the background
+ * FR_WAITING:		request is counted as "waiting"
+ * FR_ABORTED:		the request was aborted
+ * FR_INTERRUPTED:	the request has been interrupted
+ * FR_LOCKED:		data is being copied to/from the request
+ * FR_PENDING:		request is not yet in userspace
+ * FR_SENT:		request is in userspace, waiting for an answer
+ * FR_FINISHED:		request is finished
+ * FR_PRIVATE:		request is on private list
+ * FR_ASYNC:		request is asynchronous
+ * FR_URING:		request is handled through fuse-io-uring
+ */
+enum fuse_req_flag {
+	FR_ISREPLY,
+	FR_FORCE,
+	FR_BACKGROUND,
+	FR_WAITING,
+	FR_ABORTED,
+	FR_INTERRUPTED,
+	FR_LOCKED,
+	FR_PENDING,
+	FR_SENT,
+	FR_FINISHED,
+	FR_PRIVATE,
+	FR_ASYNC,
+	FR_URING,
+};
+
+/**
+ * A request to the client
+ *
+ * .waitq.lock protects the following fields:
+ *   - FR_ABORTED
+ *   - FR_LOCKED (may also be modified under fpq->lock, tested under both)
+ */
+struct fuse_req {
+	/** This can be on either pending processing or io lists in
+	    fuse_conn */
+	struct list_head list;
+
+	/** Entry on the interrupts list  */
+	struct list_head intr_entry;
+
+	/* Input/output arguments */
+	struct fuse_args *args;
+
+	/** refcount */
+	refcount_t count;
+
+	/* Request flags, updated with test/set/clear_bit() */
+	unsigned long flags;
+
+	/* The request input header */
+	struct {
+		struct fuse_in_header h;
+	} in;
+
+	/* The request output header */
+	struct {
+		struct fuse_out_header h;
+	} out;
+
+	/** Used to wake up the task waiting for completion of request*/
+	wait_queue_head_t waitq;
+
+#if IS_ENABLED(CONFIG_VIRTIO_FS)
+	/** virtio-fs's physically contiguous buffer for in and out args */
+	void *argbuf;
+#endif
+
+	/** fuse_mount this request belongs to */
+	struct fuse_mount *fm;
+
+#ifdef CONFIG_FUSE_IO_URING
+	void *ring_entry;
+	void *ring_queue;
+#endif
+	/** When (in jiffies) the request was created */
+	unsigned long create_time;
+};
+
 /**
  * Input queue callbacks
  *
@@ -290,6 +375,10 @@ struct fuse_dev *fuse_dev_alloc(void);
  */
 void fuse_pqueue_init(struct fuse_pqueue *fpq);
 
+/**
+ * End a finished request
+ */
+void fuse_request_end(struct fuse_req *req);
 
 #endif
 
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 7bc6c2054d1a..e6c1c161214c 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -383,92 +383,6 @@ struct fuse_io_priv {
 	.iocb = i,			\
 }
 
-/**
- * Request flags
- *
- * FR_ISREPLY:		set if the request has reply
- * FR_FORCE:		force sending of the request even if interrupted
- * FR_BACKGROUND:	request is sent in the background
- * FR_WAITING:		request is counted as "waiting"
- * FR_ABORTED:		the request was aborted
- * FR_INTERRUPTED:	the request has been interrupted
- * FR_LOCKED:		data is being copied to/from the request
- * FR_PENDING:		request is not yet in userspace
- * FR_SENT:		request is in userspace, waiting for an answer
- * FR_FINISHED:		request is finished
- * FR_PRIVATE:		request is on private list
- * FR_ASYNC:		request is asynchronous
- * FR_URING:		request is handled through fuse-io-uring
- */
-enum fuse_req_flag {
-	FR_ISREPLY,
-	FR_FORCE,
-	FR_BACKGROUND,
-	FR_WAITING,
-	FR_ABORTED,
-	FR_INTERRUPTED,
-	FR_LOCKED,
-	FR_PENDING,
-	FR_SENT,
-	FR_FINISHED,
-	FR_PRIVATE,
-	FR_ASYNC,
-	FR_URING,
-};
-
-/**
- * A request to the client
- *
- * .waitq.lock protects the following fields:
- *   - FR_ABORTED
- *   - FR_LOCKED (may also be modified under fpq->lock, tested under both)
- */
-struct fuse_req {
-	/** This can be on either pending processing or io lists in
-	    fuse_conn */
-	struct list_head list;
-
-	/** Entry on the interrupts list  */
-	struct list_head intr_entry;
-
-	/* Input/output arguments */
-	struct fuse_args *args;
-
-	/** refcount */
-	refcount_t count;
-
-	/* Request flags, updated with test/set/clear_bit() */
-	unsigned long flags;
-
-	/* The request input header */
-	struct {
-		struct fuse_in_header h;
-	} in;
-
-	/* The request output header */
-	struct {
-		struct fuse_out_header h;
-	} out;
-
-	/** Used to wake up the task waiting for completion of request*/
-	wait_queue_head_t waitq;
-
-#if IS_ENABLED(CONFIG_VIRTIO_FS)
-	/** virtio-fs's physically contiguous buffer for in and out args */
-	void *argbuf;
-#endif
-
-	/** fuse_mount this request belongs to */
-	struct fuse_mount *fm;
-
-#ifdef CONFIG_FUSE_IO_URING
-	void *ring_entry;
-	void *ring_queue;
-#endif
-	/** When (in jiffies) the request was created */
-	unsigned long create_time;
-};
-
 enum fuse_dax_mode {
 	FUSE_DAX_INODE_DEFAULT,	/* default */
 	FUSE_DAX_ALWAYS,	/* "-o dax=always" */
@@ -1094,11 +1008,6 @@ static inline ssize_t fuse_simple_idmap_request(struct mnt_idmap *idmap,
 int fuse_simple_background(struct fuse_mount *fm, struct fuse_args *args,
 			   gfp_t gfp_flags);
 
-/**
- * End a finished request
- */
-void fuse_request_end(struct fuse_req *req);
-
 /* Abort all requests */
 void fuse_abort_conn(struct fuse_conn *fc);
 void fuse_wait_aborted(struct fuse_conn *fc);
-- 
2.53.0

