Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4A239B94D
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331072; cv=none; b=J8Z3agU/dRNfBn8OWi8i1679n8LF7K10kYQdwhiHlwidi1axpRxPDk9oV3FNr/zr8X4X13Ft2h0/FlyKUDwjexfFjf1V41AcO3aSor9o74XNzYpsqH74yMxyNGbY7nnsX7Siu6hPNGZh1OZOgD9oTkvpCAjbv09HIeDlKgsExlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331072; c=relaxed/simple;
	bh=O+4KVlniXvNGSYZZLt4N6YZeHsDhERRbEOLrDosZqwY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=hBOZrzBaGUTsnY+FAat7NunIteFcljU8sOYgPYKAIBrYe+RD78wGyDJjOB7RS6isuTaQCyT5DraT6W2YZR00XF900Aqn6WtrZy1D8GlbrSg/KsHNDy6lAn75qqjXXfnqIt2B/DJI5R6gX8dTGBh5pEQJf7ZsgbR/0HCwV19suxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b7s4c8BP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b7s4c8BP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tyd3skm6Msy+AniTzISQ/tVZvLyvz28Fd5IlGdI+aJk=;
	b=b7s4c8BP/dhBkR5INfq1LljLUwFppPcoiFwi3lezhrR0wDoZq9X4mumzQg7GUq41bO9uuj
	KanUHyhwnSeraOaxVaTT0nMStPFwF5lPvNVkYJvWQBNxJb7ZC6q7D3saxnVk6KlHUKIYbb
	NfC7LEZoD+N3aqZYLWhqQQ9o33Vvsv8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-8SbcD2AFMKW3xS-5fLCqcQ-1; Thu, 16 Apr 2026 05:17:40 -0400
X-MC-Unique: 8SbcD2AFMKW3xS-5fLCqcQ-1
X-Mimecast-MFC-AGG-ID: 8SbcD2AFMKW3xS-5fLCqcQ_1776331059
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43d70e3e4e7so4556372f8f.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331059; x=1776935859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tyd3skm6Msy+AniTzISQ/tVZvLyvz28Fd5IlGdI+aJk=;
        b=eS0qYrff+5gNCB+IeoRD2KcaWuxtTKt2nokjbBWC37rH7BbatnyCsoY24U+/XlWcOZ
         ciegnFQi0+8ROIlpRXE1ikIMuezknbOYvQAF4r+nffiX6/ZzfM2nmRE1SpPhs2uep5vi
         A7R/wimBaUkDPoPX68Kh9esckawqOvg++FsCAvuPqku+fhJzdF7U0+lk3ADRaFDCUKBb
         L4FRNNeitYWuBfjIMF2YOe+sc9m5CZFPOdbPJeDW87BKyBP8YKgz/ZHU2VqGwYtX54cj
         NNo5Y8t6yjr4hDk7BBs423+k19+2NreU1eceZzducOPbYCXeJm7j4fYrPYiDjjPogj87
         ognQ==
X-Gm-Message-State: AOJu0Yy3W7k1cjqgEJzVeMJTaXOUuSuMMfW+xrrmH8J1AeF6gVfaWIBj
	RQF2G7+PaAivbY/vXLm5AfufeVE5x5anomye5pI64B9A7otX7E/TnMQgDtFtgc9Y8s0eTT/gcDL
	mGsvhqc+SDenqURmutK07k/5hIbNegfmR/D0kScwjwn5WAVukuFjA94If3QZk7VMh2GfX5rBnzG
	6GyeHk4P0RuGqBOnjGWvtoB4KT8dQRBYPe983S7u/zJay6CQw=
X-Gm-Gg: AeBDiesSLk2SjbtqJP/WIaCemTkvDN57STBbR1FTi1Gd2qaMLqqaquFDVn3J3MM/50Z
	a3XEqbVl2tI3+pzJrrgrDo++iTH2otZk9Dy3LodELLgv2SGqavFNdcMeTZRfVhx3cRaIxnJUg6g
	ygl05X76EsjAYQwwydTpWD44/vB4qLVW3rhrFUvkaUT0Ke3YyRAoz+lL6Aehk6B1V65h+NG6OSR
	aQLVE6vPWNbR2t+opJMmw2bCHj97to/cHkSDxA2zlc3tBj2SojxVC3O2idMiDRfnB5z/mPwWJvt
	sBn0x1jvpnoruigrKMc48z8NoIdUL4RcWLxAt3xs8q7CO+V37QrE7ZGNwPQ9vGWnlQHhQRuAIeq
	3by58h184iMk3ArYNY2mDeGfja6RntGosyXaI42oyngr7Fj1bM575XCHjNY4O9JaaGBz1rJPlyG
	ytC3VXFQ==
X-Received: by 2002:a05:600c:a416:b0:488:7f69:4abf with SMTP id 5b1f17b1804b1-488d67f946bmr262115115e9.12.1776331058924;
        Thu, 16 Apr 2026 02:17:38 -0700 (PDT)
X-Received: by 2002:a05:600c:a416:b0:488:7f69:4abf with SMTP id 5b1f17b1804b1-488d67f946bmr262114625e9.12.1776331058330;
        Thu, 16 Apr 2026 02:17:38 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:37 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 27/32] fuse: set params in fuse_chan_set_initialized()
Date: Thu, 16 Apr 2026 11:16:51 +0200
Message-ID: <20260416091658.462783-28-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 5h6heLe6obBfnnAGz_JQFox3Hpeq8SO3Ald_IfpQq7I_1776331059
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Set minor, max_write and max_pages in the fuse_chan.  These match the same
fields in fuse_conn but are needed in both layers.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.c        | 30 ++++++++++++++++++------------
 fs/fuse/dev.h        |  8 +++++++-
 fs/fuse/dev_uring.c  |  4 ++--
 fs/fuse/fuse_dev_i.h |  9 +++++++++
 fs/fuse/inode.c      | 10 ++++++++--
 5 files changed, 44 insertions(+), 17 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index fe415454de0f..c59cbfd3ffee 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -71,11 +71,17 @@ static void __fuse_put_request(struct fuse_req *req)
 	refcount_dec(&req->count);
 }
 
-void fuse_chan_set_initialized(struct fuse_chan *fch)
+void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_param *param)
 {
 	/* Make sure stores before this are seen on another CPU */
 	smp_wmb();
 	fch->initialized = 1;
+	if (param) {
+		fch->minor = param->minor;
+		fch->max_write = param->max_write;
+		fch->max_pages = param->max_pages;
+	}
+
 	wake_up_all(&fch->blocked_waitq);
 }
 
@@ -711,12 +717,12 @@ static void __fuse_request_send(struct fuse_req *req)
 	smp_rmb();
 }
 
-static void fuse_adjust_compat(struct fuse_conn *fc, struct fuse_args *args)
+static void fuse_adjust_compat(struct fuse_chan *fch, struct fuse_args *args)
 {
-	if (fc->minor < 4 && args->opcode == FUSE_STATFS)
+	if (fch->minor < 4 && args->opcode == FUSE_STATFS)
 		args->out_args[0].size = FUSE_COMPAT_STATFS_SIZE;
 
-	if (fc->minor < 9) {
+	if (fch->minor < 9) {
 		switch (args->opcode) {
 		case FUSE_LOOKUP:
 		case FUSE_CREATE:
@@ -732,7 +738,7 @@ static void fuse_adjust_compat(struct fuse_conn *fc, struct fuse_args *args)
 			break;
 		}
 	}
-	if (fc->minor < 12) {
+	if (fch->minor < 12) {
 		switch (args->opcode) {
 		case FUSE_CREATE:
 			args->in_args[0].size = sizeof(struct fuse_open_in);
@@ -776,8 +782,8 @@ ssize_t fuse_chan_send(struct fuse_chan *fch, struct fuse_args *args)
 			return PTR_ERR(req);
 	}
 
-	/* Needs to be done after fuse_get_req() so that fc->minor is valid */
-	fuse_adjust_compat(fch->conn, args);
+	/* Needs to be done after fuse_get_req() so that fch->minor is valid */
+	fuse_adjust_compat(fch, args);
 	fuse_args_to_req(req, args);
 
 	if (!args->noreply)
@@ -1467,12 +1473,12 @@ __releases(fiq->lock)
 	return ih.len;
 }
 
-static int fuse_read_forget(struct fuse_conn *fc, struct fuse_iqueue *fiq,
+static int fuse_read_forget(struct fuse_chan *fch, struct fuse_iqueue *fiq,
 			    struct fuse_copy_state *cs,
 			    size_t nbytes)
 __releases(fiq->lock)
 {
-	if (fc->minor < 16 || fiq->forget_list_head.next->next == NULL)
+	if (fch->minor < 16 || fiq->forget_list_head.next->next == NULL)
 		return fuse_read_single_forget(fiq, cs, nbytes);
 	else
 		return fuse_read_batch_forget(fiq, cs, nbytes);
@@ -1514,7 +1520,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
 	if (nbytes < max_t(size_t, FUSE_MIN_READ_BUFFER,
 			   sizeof(struct fuse_in_header) +
 			   sizeof(struct fuse_write_in) +
-			   fch->conn->max_write))
+			   fch->max_write))
 		return -EINVAL;
 
  restart:
@@ -1545,7 +1551,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
 
 	if (forget_pending(fiq)) {
 		if (list_empty(&fiq->pending) || fiq->forget_batch-- > 0)
-			return fuse_read_forget(fch->conn, fiq, cs, nbytes);
+			return fuse_read_forget(fch, fiq, cs, nbytes);
 
 		if (fiq->forget_batch <= -8)
 			fiq->forget_batch = 16;
@@ -2110,7 +2116,7 @@ void fuse_chan_abort(struct fuse_chan *fch, bool abort_with_err)
 		fch->connected = 0;
 		spin_unlock(&fch->bg_lock);
 
-		fuse_chan_set_initialized(fch);
+		fuse_chan_set_initialized(fch, 0);
 		list_for_each_entry(fud, &fch->devices, entry) {
 			struct fuse_pqueue *fpq = &fud->pq;
 
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index 2bf4aba256d1..6437331058d9 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -17,6 +17,12 @@ struct file;
 struct folio;
 enum fuse_notify_code;
 
+struct fuse_chan_param {
+	unsigned int minor;
+	unsigned int max_write;
+	unsigned int max_pages;
+};
+
 struct fuse_chan *fuse_chan_new(void);
 struct fuse_chan *fuse_dev_chan_new(void);
 void fuse_chan_release(struct fuse_chan *fch);
@@ -26,7 +32,7 @@ unsigned int fuse_chan_max_background(struct fuse_chan *fch);
 void fuse_chan_max_background_set(struct fuse_chan *fch, unsigned int val);
 unsigned int fuse_chan_num_waiting(struct fuse_chan *fch);
 void fuse_chan_set_fc(struct fuse_chan *fch, struct fuse_conn *fc);
-void fuse_chan_set_initialized(struct fuse_chan *fch);
+void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_param *param);
 void fuse_chan_io_uring_enable(struct fuse_chan *fch);
 ssize_t fuse_chan_send(struct fuse_chan *fch, struct fuse_args *args);
 int fuse_chan_send_bg(struct fuse_chan *fch, struct fuse_args *args, gfp_t gfp_flags);
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 87066d6ee782..f6bed983fea0 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -241,8 +241,8 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
 	if (!ring->queues)
 		goto out_err;
 
-	max_payload_size = max(FUSE_MIN_READ_BUFFER, fch->conn->max_write);
-	max_payload_size = max(max_payload_size, fch->conn->max_pages * PAGE_SIZE);
+	max_payload_size = max(FUSE_MIN_READ_BUFFER, fch->max_write);
+	max_payload_size = max(max_payload_size, fch->max_pages * PAGE_SIZE);
 
 	spin_lock(&fch->lock);
 	if (fch->ring) {
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 61b054b73cb8..3acf73be3990 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -239,6 +239,15 @@ struct fuse_chan {
 	/* Use io_uring for communication */
 	unsigned int io_uring;
 
+	/* Negotiated minor version */
+	unsigned int minor;
+
+	/* Maximum write size */
+	unsigned int max_write;
+
+	/* Maximum number of pages that can be used in a single request */
+	unsigned int max_pages;
+
 	/** Connection aborted via sysfs, respond with ECONNABORTED on device I/O */
 	bool abort_with_err;
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index bda1bd4a9357..38f379374067 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1426,9 +1426,15 @@ static void process_init_reply(struct fuse_args *args, int error)
 	if (!ok) {
 		fc->conn_init = 0;
 		fc->conn_error = 1;
+		fuse_chan_set_initialized(fc->chan, NULL);
+	} else {
+		struct fuse_chan_param cp = {
+			.minor = fc->minor,
+			.max_write = fc->max_write,
+			.max_pages = fc->max_pages,
+		};
+		fuse_chan_set_initialized(fc->chan, &cp);
 	}
-
-	fuse_chan_set_initialized(fc->chan);
 }
 
 static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
-- 
2.53.0

