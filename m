Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6A1311583
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331039; cv=none; b=JnJjEKRHQ4lCSzCwNpItMlO23FrWuryyd0sMveooMvnfzpjxrP9DF3LXtUCEDzNVZQY2mQPwplCi7DLHJ8PReFFsKnRz2XKeE3ml/944f8+RYoGAuLRDCzTEezCkRYHNxyEkLGo9+PHl5zfK/D05g0zuDU4D8YmGHxq8usBeYuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331039; c=relaxed/simple;
	bh=ctxnpjnWewu18DlqucHmXjni10VOaPT2KWT+iEC8/DI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=RhD7y5aFPfx++25XI08c+AevLN7ZtUNbR7ddQABDN43cSNh6rSL/ZK+evwHBBqh7RoHPCNZlsFGBIpmOc3pcJrHWBAJm/r2y0ZWQYI/q00FF8JCBB/f3Q4QSgf0Uii1Z+CSunCF1/KEK24oLiASISNFBxsGl/DjSrqkYSch/PCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d/Ghoal5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d/Ghoal5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfj5C1fDAl7CmtpUhyMXAQFh36TElG6U4zcCSJCa6T8=;
	b=d/Ghoal5uTcv7buhbswONz9A6Tz5Badg2acA8W17snRkT/zt6zPHZjGW8hSiqx1PfowgGA
	Yz0npNN1mgPNbKoa6jLiI1bz9lURbhhOD2jGqm99rYTUQ674fpGMhJvcU70vw+5QbvAX86
	yzmkUpXGaoX5c42ywKnVovVKV061YFU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-_EcQQtTLOp6YjgxtVCJMpw-1; Thu, 16 Apr 2026 05:17:12 -0400
X-MC-Unique: _EcQQtTLOp6YjgxtVCJMpw-1
X-Mimecast-MFC-AGG-ID: _EcQQtTLOp6YjgxtVCJMpw_1776331031
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488d2cd2674so66190545e9.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331031; x=1776935831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zfj5C1fDAl7CmtpUhyMXAQFh36TElG6U4zcCSJCa6T8=;
        b=ABCNRUGEH3+E0R8B3CfjXUx9vepW0MQAF8suEae/ZKOYsMEalIkrGBJ9tcNHZipOlE
         B5h3jFP2HRSRd4zto/VdazPhjmCPrJBLDmhSS0CRzyG+i391YQzIEpbfZ0TFJdZ3Q3d9
         Iy1IRLTAuXG6EnO4SUlJD+lJXFi7PpoSAkU5Wl5Af3bHzT0cGCsCT+YmajBl0hI0xwtG
         zbR3TcuckJwyc2rk4caaPQ5mY4aykLLpqLmV7rh7RfEwGRtm8R6VS7Gx984WB4zU0X0d
         g96As4czKQ/XuB5bg2uYR/uWWBkgZ7usGfYMDuX9Koseop6ItHP3BvAm9I5IgUoIbE2/
         Z4/A==
X-Gm-Message-State: AOJu0YwiEWSjklQr7yvpYPBDaY9c65JkHL3RPz8vqqqiafU7Y/hXj5yV
	IBzHKm+D0/JVkWh9KSohQaYJTmETcWPQb9FgPMNzg4N2hx0dM/sMCQADNXx+a3fmO+sLDIk36dB
	fCxhpJtBGUP1wWdnDr98lLpfaEasiD0RO0W9rwZ8Abh/9Hp2zDTX2oJ5IykYxWSNBucvAXAbrH9
	/pNcELmvbpNXRoBpDmrWROdPBSyRuM+RqOec+tv+m8iQj6Zo0=
X-Gm-Gg: AeBDieuMgAzKJuXQo3jl82OsVHBT8KC/aIXmCUzDgirjhFdz2QvNGPfMQRipCCA8qEt
	/dVj/N8I8pFPbfnDOBb7cEI3F/F8b+DPY1PBTnu4WcdyMdAyTeLGa7Laq/tbzkOOXSx/vFGwmS1
	V30vENnzGtonuPONBdvizmB7TmHBTDo8Gc/H7WNYIiBzhCmj7WE3smUvb3iNCnuaes3o9Zc0qNy
	/KA1S8E+fBCqNy7oAWuqoOEPCrVm/onwqHQEbr4otOBrvEK7lWp8LL0619nRuccfm6FvjgRP/Lc
	4L6O7hgK19l8FNUIDxKtsHlvfcgGydN+EwDvNeFvcR6jUJtDHUePNGa9w1cV+Fto8nQbIEBTRod
	wlyC8A4KVxAcXJDpP60aszaQPAOJckAbktlTm9AsJ5eYcQUEFyjWH5ZTEaLqsJ8Fm6Oooxg3qqq
	facy27ig==
X-Received: by 2002:a05:600c:8907:b0:488:80b6:873a with SMTP id 5b1f17b1804b1-488d6860bc3mr239264645e9.21.1776331030718;
        Thu, 16 Apr 2026 02:17:10 -0700 (PDT)
X-Received: by 2002:a05:600c:8907:b0:488:80b6:873a with SMTP id 5b1f17b1804b1-488d6860bc3mr239264125e9.21.1776331030091;
        Thu, 16 Apr 2026 02:17:10 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:08 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 06/32] fuse: move background queuing related members to fuse_chan
Date: Thu, 16 Apr 2026 11:16:30 +0200
Message-ID: <20260416091658.462783-7-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: FJM4EiaXN5VSH-6W_UG0cv5ajZdH9jZHqrgfVthK7pQ_1776331031
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Move:

 - max_background
 - num_background
 - active_background
 - bg_queue
 - bg_lock

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/control.c     | 11 ++++++-----
 fs/fuse/dev.c         | 45 +++++++++++++++++++++++--------------------
 fs/fuse/dev.h         |  3 +++
 fs/fuse/dev_uring.c   | 24 +++++++++++------------
 fs/fuse/file.c        |  5 +++--
 fs/fuse/fuse_dev_i.h  | 16 +++++++++++++++
 fs/fuse/fuse_i.h      | 16 ---------------
 fs/fuse/inode.c       | 16 +++++----------
 fs/fuse/req_timeout.c |  6 +++---
 fs/fuse/virtio_fs.c   |  2 +-
 10 files changed, 73 insertions(+), 71 deletions(-)

diff --git a/fs/fuse/control.c b/fs/fuse/control.c
index f902a7fb4630..6279a37716c5 100644
--- a/fs/fuse/control.c
+++ b/fs/fuse/control.c
@@ -7,6 +7,7 @@
 */
 
 #include "fuse_i.h"
+#include "fuse_dev_i.h"
 
 #include <linux/init.h>
 #include <linux/module.h>
@@ -111,7 +112,7 @@ static ssize_t fuse_conn_max_background_read(struct file *file,
 	if (!fc)
 		return 0;
 
-	val = READ_ONCE(fc->max_background);
+	val = READ_ONCE(fc->chan->max_background);
 	fuse_conn_put(fc);
 
 	return fuse_conn_limit_read(file, buf, len, ppos, val);
@@ -129,12 +130,12 @@ static ssize_t fuse_conn_max_background_write(struct file *file,
 	if (ret > 0) {
 		struct fuse_conn *fc = fuse_ctl_file_conn_get(file);
 		if (fc) {
-			spin_lock(&fc->bg_lock);
-			fc->max_background = val;
-			fc->blocked = fc->num_background >= fc->max_background;
+			spin_lock(&fc->chan->bg_lock);
+			fc->chan->max_background = val;
+			fc->blocked = fc->chan->num_background >= fc->chan->max_background;
 			if (!fc->blocked)
 				wake_up(&fc->blocked_waitq);
-			spin_unlock(&fc->bg_lock);
+			spin_unlock(&fc->chan->bg_lock);
 			fuse_conn_put(fc);
 		}
 	}
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 18bad9089917..68a96b41f7e6 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -180,10 +180,10 @@ static void fuse_put_request(struct fuse_req *req)
 			 * We get here in the unlikely case that a background
 			 * request was allocated but not sent
 			 */
-			spin_lock(&fc->bg_lock);
+			spin_lock(&fc->chan->bg_lock);
 			if (!fc->blocked)
 				wake_up(&fc->blocked_waitq);
-			spin_unlock(&fc->bg_lock);
+			spin_unlock(&fc->chan->bg_lock);
 		}
 
 		if (test_bit(FR_WAITING, &req->flags)) {
@@ -354,6 +354,9 @@ struct fuse_chan *fuse_chan_new(void)
 		return NULL;
 
 	INIT_LIST_HEAD(&fch->devices);
+	spin_lock_init(&fch->bg_lock);
+	INIT_LIST_HEAD(&fch->bg_queue);
+	fch->max_background = FUSE_DEFAULT_MAX_BACKGROUND;
 
 	return fch;
 }
@@ -488,13 +491,13 @@ static void flush_bg_queue(struct fuse_conn *fc)
 {
 	struct fuse_iqueue *fiq = &fc->chan->iq;
 
-	while (fc->active_background < fc->max_background &&
-	       !list_empty(&fc->bg_queue)) {
+	while (fc->chan->active_background < fc->chan->max_background &&
+	       !list_empty(&fc->chan->bg_queue)) {
 		struct fuse_req *req;
 
-		req = list_first_entry(&fc->bg_queue, struct fuse_req, list);
+		req = list_first_entry(&fc->chan->bg_queue, struct fuse_req, list);
 		list_del(&req->list);
-		fc->active_background++;
+		fc->chan->active_background++;
 		fuse_send_one(fiq, req);
 	}
 }
@@ -530,9 +533,9 @@ void fuse_request_end(struct fuse_req *req)
 	WARN_ON(test_bit(FR_PENDING, &req->flags));
 	WARN_ON(test_bit(FR_SENT, &req->flags));
 	if (test_bit(FR_BACKGROUND, &req->flags)) {
-		spin_lock(&fc->bg_lock);
+		spin_lock(&fc->chan->bg_lock);
 		clear_bit(FR_BACKGROUND, &req->flags);
-		if (fc->num_background == fc->max_background) {
+		if (fc->chan->num_background == fc->chan->max_background) {
 			fc->blocked = 0;
 			wake_up(&fc->blocked_waitq);
 		} else if (!fc->blocked) {
@@ -546,10 +549,10 @@ void fuse_request_end(struct fuse_req *req)
 				wake_up(&fc->blocked_waitq);
 		}
 
-		fc->num_background--;
-		fc->active_background--;
+		fc->chan->num_background--;
+		fc->chan->active_background--;
 		flush_bg_queue(fc);
-		spin_unlock(&fc->bg_lock);
+		spin_unlock(&fc->chan->bg_lock);
 	} else {
 		/* Wake up waiter sleeping in request_wait_answer() */
 		wake_up(&req->waitq);
@@ -795,16 +798,16 @@ static int fuse_request_queue_background(struct fuse_req *req)
 		return fuse_request_queue_background_uring(fc, req);
 #endif
 
-	spin_lock(&fc->bg_lock);
+	spin_lock(&fc->chan->bg_lock);
 	if (likely(fc->connected)) {
-		fc->num_background++;
-		if (fc->num_background == fc->max_background)
+		fc->chan->num_background++;
+		if (fc->chan->num_background == fc->chan->max_background)
 			fc->blocked = 1;
-		list_add_tail(&req->list, &fc->bg_queue);
+		list_add_tail(&req->list, &fc->chan->bg_queue);
 		flush_bg_queue(fc);
 		queued = true;
 	}
-	spin_unlock(&fc->bg_lock);
+	spin_unlock(&fc->chan->bg_lock);
 
 	return queued;
 }
@@ -2521,9 +2524,9 @@ void fuse_abort_conn(struct fuse_conn *fc)
 			cancel_delayed_work(&fc->timeout.work);
 
 		/* Background queuing checks fc->connected under bg_lock */
-		spin_lock(&fc->bg_lock);
+		spin_lock(&fc->chan->bg_lock);
 		fc->connected = 0;
-		spin_unlock(&fc->bg_lock);
+		spin_unlock(&fc->chan->bg_lock);
 
 		fuse_set_initialized(fc);
 		list_for_each_entry(fud, &fc->chan->devices, entry) {
@@ -2547,11 +2550,11 @@ void fuse_abort_conn(struct fuse_conn *fc)
 						      &to_end);
 			spin_unlock(&fpq->lock);
 		}
-		spin_lock(&fc->bg_lock);
+		spin_lock(&fc->chan->bg_lock);
 		fc->blocked = 0;
-		fc->max_background = UINT_MAX;
+		fc->chan->max_background = UINT_MAX;
 		flush_bg_queue(fc);
-		spin_unlock(&fc->bg_lock);
+		spin_unlock(&fc->chan->bg_lock);
 
 		spin_lock(&fiq->lock);
 		fiq->connected = 0;
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index 1f8f2cf1ecfd..2630dab3ef56 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -5,6 +5,9 @@
 
 #include <linux/cleanup.h>
 
+/** Maximum number of outstanding background requests */
+#define FUSE_DEFAULT_MAX_BACKGROUND 12
+
 struct fuse_conn;
 struct fuse_chan;
 struct fuse_dev;
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index d28027f9d743..4a5e64a6fe8a 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -54,7 +54,7 @@ static void fuse_uring_flush_bg(struct fuse_ring_queue *queue)
 	struct fuse_conn *fc = ring->fc;
 
 	lockdep_assert_held(&queue->lock);
-	lockdep_assert_held(&fc->bg_lock);
+	lockdep_assert_held(&fc->chan->bg_lock);
 
 	/*
 	 * Allow one bg request per queue, ignoring global fc limits.
@@ -62,14 +62,14 @@ static void fuse_uring_flush_bg(struct fuse_ring_queue *queue)
 	 * eliminates the need for remote queue wake-ups when global
 	 * limits are met but this queue has no more waiting requests.
 	 */
-	while ((fc->active_background < fc->max_background ||
+	while ((fc->chan->active_background < fc->chan->max_background ||
 		!queue->active_background) &&
 	       (!list_empty(&queue->fuse_req_bg_queue))) {
 		struct fuse_req *req;
 
 		req = list_first_entry(&queue->fuse_req_bg_queue,
 				       struct fuse_req, list);
-		fc->active_background++;
+		fc->chan->active_background++;
 		queue->active_background++;
 
 		list_move_tail(&req->list, &queue->fuse_req_queue);
@@ -89,9 +89,9 @@ static void fuse_uring_req_end(struct fuse_ring_ent *ent, struct fuse_req *req,
 	list_del_init(&req->list);
 	if (test_bit(FR_BACKGROUND, &req->flags)) {
 		queue->active_background--;
-		spin_lock(&fc->bg_lock);
+		spin_lock(&fc->chan->bg_lock);
 		fuse_uring_flush_bg(queue);
-		spin_unlock(&fc->bg_lock);
+		spin_unlock(&fc->chan->bg_lock);
 	}
 
 	spin_unlock(&queue->lock);
@@ -132,11 +132,11 @@ void fuse_uring_abort_end_requests(struct fuse_ring *ring)
 
 		queue->stopped = true;
 
-		WARN_ON_ONCE(ring->fc->max_background != UINT_MAX);
+		WARN_ON_ONCE(ring->fc->chan->max_background != UINT_MAX);
 		spin_lock(&queue->lock);
-		spin_lock(&fc->bg_lock);
+		spin_lock(&fc->chan->bg_lock);
 		fuse_uring_flush_bg(queue);
-		spin_unlock(&fc->bg_lock);
+		spin_unlock(&fc->chan->bg_lock);
 		spin_unlock(&queue->lock);
 		fuse_uring_abort_end_queue_requests(queue);
 	}
@@ -1325,12 +1325,12 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
 
 	ent = list_first_entry_or_null(&queue->ent_avail_queue,
 				       struct fuse_ring_ent, list);
-	spin_lock(&fc->bg_lock);
-	fc->num_background++;
-	if (fc->num_background == fc->max_background)
+	spin_lock(&fc->chan->bg_lock);
+	fc->chan->num_background++;
+	if (fc->chan->num_background == fc->chan->max_background)
 		fc->blocked = 1;
 	fuse_uring_flush_bg(queue);
-	spin_unlock(&fc->bg_lock);
+	spin_unlock(&fc->chan->bg_lock);
 
 	/*
 	 * Due to bg_queue flush limits there might be other bg requests
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 7294bd347412..64348ffbf202 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -7,6 +7,7 @@
 */
 
 #include "fuse_i.h"
+#include "fuse_dev_i.h"
 
 #include <linux/pagemap.h>
 #include <linux/slab.h>
@@ -902,7 +903,7 @@ static int fuse_handle_readahead(struct folio *folio,
 		ia = NULL;
 	}
 	if (!ia) {
-		if (fc->num_background >= fc->congestion_threshold &&
+		if (fc->chan->num_background >= fc->congestion_threshold &&
 		    rac->ra->async_size >= readahead_count(rac))
 			/*
 			 * Congested and only async pages left, so skip the
@@ -2293,7 +2294,7 @@ static int fuse_writepages(struct address_space *mapping,
 		return -EIO;
 
 	if (wbc->sync_mode == WB_SYNC_NONE &&
-	    fc->num_background >= fc->congestion_threshold)
+	    fc->chan->num_background >= fc->congestion_threshold)
 		return 0;
 
 	return iomap_writepages(&wpc);
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 459f37ece46a..efc321b2bf5d 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -93,6 +93,22 @@ struct fuse_chan {
 
 	/** List of device instances belonging to this connection */
 	struct list_head devices;
+
+	/** Maximum number of outstanding background requests */
+	unsigned max_background;
+
+	/** Number of requests currently in the background */
+	unsigned num_background;
+
+	/** Number of background requests currently queued for userspace */
+	unsigned active_background;
+
+	/** The list of background requests set aside for later queuing */
+	struct list_head bg_queue;
+
+	/** Protects: max_background, congestion_threshold, num_background,
+	 * active_background, bg_queue, blocked */
+	spinlock_t bg_lock;
 };
 
 #define FUSE_PQ_HASH_BITS 8
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 6185b97df106..ccf0db3a4eeb 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -566,25 +566,9 @@ struct fuse_conn {
 	/** rbtree of fuse_files waiting for poll events indexed by ph */
 	struct rb_root polled_files;
 
-	/** Maximum number of outstanding background requests */
-	unsigned max_background;
-
 	/** Number of background requests at which congestion starts */
 	unsigned congestion_threshold;
 
-	/** Number of requests currently in the background */
-	unsigned num_background;
-
-	/** Number of background requests currently queued for userspace */
-	unsigned active_background;
-
-	/** The list of background requests set aside for later queuing */
-	struct list_head bg_queue;
-
-	/** Protects: max_background, congestion_threshold, num_background,
-	 * active_background, bg_queue, blocked */
-	spinlock_t bg_lock;
-
 	/** Flag indicating that INIT reply has been received. Allocating
 	 * any fuse request will be suspended until the flag is set */
 	int initialized;
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 4d958c53900f..16b9879c924b 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -61,9 +61,6 @@ MODULE_PARM_DESC(max_user_congthresh,
 
 #define FUSE_DEFAULT_BLKSIZE 512
 
-/** Maximum number of outstanding background requests */
-#define FUSE_DEFAULT_MAX_BACKGROUND 12
-
 /** Congestion starts at 75% of maximum */
 #define FUSE_DEFAULT_CONGESTION_THRESHOLD (FUSE_DEFAULT_MAX_BACKGROUND * 3 / 4)
 
@@ -974,16 +971,13 @@ void fuse_conn_init(struct fuse_conn *fc, struct fuse_mount *fm,
 {
 	memset(fc, 0, sizeof(*fc));
 	spin_lock_init(&fc->lock);
-	spin_lock_init(&fc->bg_lock);
 	init_rwsem(&fc->killsb);
 	refcount_set(&fc->count, 1);
 	atomic_set(&fc->epoch, 1);
 	INIT_WORK(&fc->epoch_work, fuse_epoch_work);
 	init_waitqueue_head(&fc->blocked_waitq);
-	INIT_LIST_HEAD(&fc->bg_queue);
 	INIT_LIST_HEAD(&fc->entry);
 	atomic_set(&fc->num_waiting, 0);
-	fc->max_background = FUSE_DEFAULT_MAX_BACKGROUND;
 	fc->congestion_threshold = FUSE_DEFAULT_CONGESTION_THRESHOLD;
 	atomic64_set(&fc->khctr, 0);
 	fc->polled_files = RB_ROOT;
@@ -1264,12 +1258,12 @@ static void process_init_limits(struct fuse_conn *fc, struct fuse_init_out *arg)
 	sanitize_global_limit(&max_user_bgreq);
 	sanitize_global_limit(&max_user_congthresh);
 
-	spin_lock(&fc->bg_lock);
+	spin_lock(&fc->chan->bg_lock);
 	if (arg->max_background) {
-		fc->max_background = arg->max_background;
+		fc->chan->max_background = arg->max_background;
 
-		if (!cap_sys_admin && fc->max_background > max_user_bgreq)
-			fc->max_background = max_user_bgreq;
+		if (!cap_sys_admin && fc->chan->max_background > max_user_bgreq)
+			fc->chan->max_background = max_user_bgreq;
 	}
 	if (arg->congestion_threshold) {
 		fc->congestion_threshold = arg->congestion_threshold;
@@ -1278,7 +1272,7 @@ static void process_init_limits(struct fuse_conn *fc, struct fuse_init_out *arg)
 		    fc->congestion_threshold > max_user_congthresh)
 			fc->congestion_threshold = max_user_congthresh;
 	}
-	spin_unlock(&fc->bg_lock);
+	spin_unlock(&fc->chan->bg_lock);
 }
 
 struct fuse_init_args {
diff --git a/fs/fuse/req_timeout.c b/fs/fuse/req_timeout.c
index ca44a7940174..ee2b4dc394e0 100644
--- a/fs/fuse/req_timeout.c
+++ b/fs/fuse/req_timeout.c
@@ -83,9 +83,9 @@ static void fuse_check_timeout(struct work_struct *work)
 	if (expired)
 		goto abort_conn;
 
-	spin_lock(&fc->bg_lock);
-	expired = fuse_request_expired(fc, &fc->bg_queue);
-	spin_unlock(&fc->bg_lock);
+	spin_lock(&fc->chan->bg_lock);
+	expired = fuse_request_expired(fc, &fc->chan->bg_queue);
+	spin_unlock(&fc->chan->bg_lock);
 	if (expired)
 		goto abort_conn;
 
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index d688a2a95753..53ce21836ba0 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -1520,7 +1520,7 @@ static void virtio_fs_send_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 		if (ret == -ENOSPC) {
 			/*
 			 * Virtqueue full. Retry submission from worker
-			 * context as we might be holding fc->bg_lock.
+			 * context as we might be holding fc->chan->bg_lock.
 			 */
 			spin_lock(&fsvq->lock);
 			list_add_tail(&req->list, &fsvq->queued_reqs);
-- 
2.53.0

