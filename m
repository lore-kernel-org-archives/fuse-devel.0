Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607E7399345
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331060; cv=none; b=szAN0HFUP/nrUR2sZol/tYLx8sQgpU8gvBP/dodjQSXRrrVo8qLRlSFkAB2a4uLzZSXfz9s6Qgfm4mhPRvtubLzbaM20WiY1QCRQODjlFG8tjKdAdTN6AxaJG4PwVik7yB2Uj5hlM7Wa9p+bvaQI9/xSwXvssfgIK7nSyZSGeVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331060; c=relaxed/simple;
	bh=/WsXvBvGtjgMv62tgmQ6XWbX9eLFvWirZFGDtxFZanU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=TSYE1Q11SNtnSqIs7/xgL2M4N8wgV8y7m0HD4D92R+i6LEzfLT2qLFnW24Nlxf22My9O0AqLPnJKEJTgeqSNdsX1Pr3sKJ4bI1nmB5CEZNJBrJxqm97slndENfefzAHhHE56QNa7KEhXdMjjc4AMc8zFLWNQEYftryjChmG/yCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SM0vtLix; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SM0vtLix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJGjyLLnQZaRSgIVo9Df8T3YOv3JarZzvqooAjEHjA4=;
	b=SM0vtLixLL1uqtbyU7iJOgW3uwda439KjfqvprQhvQQmZvlPlus4RmRdMWjgC2AEL9kCJs
	ckU3FP6oY5595kCmCWqlvGqyG1jTRZIGTcMZllgro5ZDcJjGLAnpUZk73ZSZLjnvSnxQIU
	rmQmYtmN+Zl/7rsmHsVAJDShCqrObjs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-94_dpqu8M6-eq1PayeCyYw-1; Thu, 16 Apr 2026 05:17:30 -0400
X-MC-Unique: 94_dpqu8M6-eq1PayeCyYw-1
X-Mimecast-MFC-AGG-ID: 94_dpqu8M6-eq1PayeCyYw_1776331050
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d03db814eso8210293f8f.2
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331049; x=1776935849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QJGjyLLnQZaRSgIVo9Df8T3YOv3JarZzvqooAjEHjA4=;
        b=RrrYSNZr9As3oKzy5ekGXWX+SyFcAbaHU457dyD9TF0n+aQECSGYzR8avPzTEBDuqj
         lRmaUDIpHh+PXqRQc6m5x/Lhoqegz4z57fSqmmcTm6zCkUngQX/MPj7IoMAu9nhBk6FB
         0Mfw9dE4hL7+azqRQuoNZMSGFcrEiP9IG/Lmajrx34wK+qQXaoi1TQFxIm/fDj0heu9O
         MYlbuL3jLpOjhaXhn1ZrhHvPUrNVJlwfmXbJbXveaXZchzKhDZw/mjy8xLbwwjXD8MoR
         CDZLhEcY+dJ2yU0MzKiF3rWEZz2AW7oCmt4kwJn1og/1ncvLM9BEGX2oLgzAHxW/XlrU
         VI6A==
X-Gm-Message-State: AOJu0YxxfMK7AjACsjbtbIA+8bjc59Cjw0/Kj8ysAkfreMh3LlquwzYw
	GKT3O754+RRN4WYE3osXW/RK7R+/dxUy0oYSOz5DK8z+OSQ9uCenJETX53duV5qKtDV0HuYYCY1
	N66H2+92ItfHUV+GOH+/GujJLTOQmhGhKil9hfrEJkoNVFu0j4pf18UBNj3FfZrkQwusSxNp2Ct
	htFSuJo7b4+Hh/9Kws9wXmqU2P9GSTBYujdN9EHvGkZshZBs0=
X-Gm-Gg: AeBDiesQ4e1albYiM8FmziXI4AmelGiIU2wggYXNBslUQ7ytlFgqYyX8UH9PJrmy2sr
	OnidZ77t7Q1shF7Wwk+n7nbp1Wm+TgbBMz/nWVfK42BDLuAoN7YOkL7wp2QHzjhB4z8L//GcTYB
	5Dj7+dfBHzPo4enoW+KNVpI/cGwaWhtoer0vJEiEidN+JLw6VYMWUpksXhC0k+FpM3YAnkGFXzJ
	c/6AbOSxHreNYgRG4l/02Hlhcw4wRJG0/rao0K6VqFEw36MsHGDVzp0M7yrfjTBBOJRjRrM/KRx
	Kt/9BwBgGuZamn3SV4LzmCDuRAtUdmk5dngm4PwddpqT3C0f3O2G9XLMktHjunu7bwdVvZMRDPe
	WrSCfisr2jtWRXQDoVsXSq7Y7sl56TIAU1neEVdcDFqMKxoZ5kZHY3mysPaW6drxqev/dTxSmV/
	OedITHPA==
X-Received: by 2002:a05:600d:12:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-488d67df3f9mr280274625e9.4.1776331049247;
        Thu, 16 Apr 2026 02:17:29 -0700 (PDT)
X-Received: by 2002:a05:600d:12:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-488d67df3f9mr280274075e9.4.1776331048710;
        Thu, 16 Apr 2026 02:17:28 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:27 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 19/32] fuse: abort related layering cleanup
Date: Thu, 16 Apr 2026 11:16:43 +0200
Message-ID: <20260416091658.462783-20-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: ekFDO4H11PsWD7LMBW3oKY5aWo-yZ89n2TiOIYq2VXY_1776331050
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

 - rename fuse_abort_conn() to fuse_chan_abort(), pass fuse_chan pointer
   instead of fuse_conn

 - pass an abort_with_err argument that tells fuse_dev_(read|write) to
   return with ECONNABORTED instead of ENODEV

 - move fc->aborted to fch->abort_with_err

 - rename fuse_wait_aborted() to fuse_chan_wait_aborted()

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/control.c     |  4 +--
 fs/fuse/cuse.c        |  4 +--
 fs/fuse/dev.c         | 84 ++++++++++++++++++++++---------------------
 fs/fuse/dev.h         |  3 +-
 fs/fuse/dev_uring.c   |  2 +-
 fs/fuse/fuse_dev_i.h  |  3 ++
 fs/fuse/fuse_i.h      |  5 ---
 fs/fuse/inode.c       |  6 ++--
 fs/fuse/req_timeout.c | 12 +++----
 9 files changed, 61 insertions(+), 62 deletions(-)

diff --git a/fs/fuse/control.c b/fs/fuse/control.c
index e6f513eb7d4a..925a15488499 100644
--- a/fs/fuse/control.c
+++ b/fs/fuse/control.c
@@ -38,9 +38,7 @@ static ssize_t fuse_conn_abort_write(struct file *file, const char __user *buf,
 {
 	struct fuse_conn *fc = fuse_ctl_file_conn_get(file);
 	if (fc) {
-		if (fc->abort_err)
-			fc->aborted = true;
-		fuse_abort_conn(fc);
+		fuse_chan_abort(fc->chan, fc->abort_err);
 		fuse_conn_put(fc);
 	}
 	return count;
diff --git a/fs/fuse/cuse.c b/fs/fuse/cuse.c
index 728608d35d0a..9341bb5a88cb 100644
--- a/fs/fuse/cuse.c
+++ b/fs/fuse/cuse.c
@@ -424,7 +424,7 @@ static void cuse_process_init_reply(struct fuse_mount *fm,
 err_region:
 	unregister_chrdev_region(devt, 1);
 err:
-	fuse_abort_conn(fc);
+	fuse_chan_abort(fc->chan, false);
 	goto out;
 }
 
@@ -594,7 +594,7 @@ static ssize_t cuse_class_abort_store(struct device *dev,
 {
 	struct cuse_conn *cc = dev_get_drvdata(dev);
 
-	fuse_abort_conn(&cc->fc);
+	fuse_chan_abort(cc->fc.chan, false);
 	return count;
 }
 static DEVICE_ATTR(abort, 0200, NULL, cuse_class_abort_store);
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index fadad23e8369..cbf8f086536c 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -89,7 +89,7 @@ static void fuse_drop_waiting(struct fuse_conn *fc)
 {
 	/*
 	 * lockess check of fc->chan->connected is okay, because atomic_dec_and_test()
-	 * provides a memory barrier matched with the one in fuse_wait_aborted()
+	 * provides a memory barrier matched with the one in fuse_chan_wait_aborted()
 	 * to ensure no wake-up is missed.
 	 */
 	if (atomic_dec_and_test(&fc->chan->num_waiting) &&
@@ -569,17 +569,17 @@ void fuse_chan_queue_forget(struct fuse_chan *fch, struct fuse_forget_link *forg
 	fiq->ops->send_forget(fiq, forget);
 }
 
-static void flush_bg_queue(struct fuse_conn *fc)
+static void flush_bg_queue(struct fuse_chan *fch)
 {
-	struct fuse_iqueue *fiq = &fc->chan->iq;
+	struct fuse_iqueue *fiq = &fch->iq;
 
-	while (fc->chan->active_background < fc->chan->max_background &&
-	       !list_empty(&fc->chan->bg_queue)) {
+	while (fch->active_background < fch->max_background &&
+	       !list_empty(&fch->bg_queue)) {
 		struct fuse_req *req;
 
-		req = list_first_entry(&fc->chan->bg_queue, struct fuse_req, list);
+		req = list_first_entry(&fch->bg_queue, struct fuse_req, list);
 		list_del(&req->list);
-		fc->chan->active_background++;
+		fch->active_background++;
 		fuse_send_one(fiq, req);
 	}
 }
@@ -633,7 +633,7 @@ void fuse_request_end(struct fuse_req *req)
 
 		fc->chan->num_background--;
 		fc->chan->active_background--;
-		flush_bg_queue(fc);
+		flush_bg_queue(fc->chan);
 		spin_unlock(&fc->chan->bg_lock);
 	} else {
 		/* Wake up waiter sleeping in request_wait_answer() */
@@ -708,7 +708,7 @@ static void request_wait_answer(struct fuse_req *req)
 			return;
 
 		if (req->args->abort_on_kill) {
-			fuse_abort_conn(fc);
+			fuse_chan_abort(fc->chan, false);
 			return;
 		}
 
@@ -886,7 +886,7 @@ static int fuse_request_queue_background(struct fuse_req *req)
 		if (fc->chan->num_background == fc->chan->max_background)
 			fc->chan->blocked = 1;
 		list_add_tail(&req->list, &fc->chan->bg_queue);
-		flush_bg_queue(fc);
+		flush_bg_queue(fc->chan);
 		queued = true;
 	}
 	spin_unlock(&fc->chan->bg_lock);
@@ -1591,7 +1591,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
 	}
 
 	if (!fiq->connected) {
-		err = fc->aborted ? -ECONNABORTED : -ENODEV;
+		err = fc->chan->abort_with_err ? -ECONNABORTED : -ENODEV;
 		goto err_unlock;
 	}
 
@@ -1629,7 +1629,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
 	spin_lock(&fpq->lock);
 	/*
 	 *  Must not put request on fpq->io queue after having been shut down by
-	 *  fuse_abort_conn()
+	 *  fuse_chan_abort()
 	 */
 	if (!fpq->connected) {
 		req->out.h.error = err = -ECONNABORTED;
@@ -1647,7 +1647,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
 	spin_lock(&fpq->lock);
 	clear_bit(FR_LOCKED, &req->flags);
 	if (!fpq->connected) {
-		err = fc->aborted ? -ECONNABORTED : -ENODEV;
+		err = fc->chan->abort_with_err ? -ECONNABORTED : -ENODEV;
 		goto out_end;
 	}
 	if (err) {
@@ -2593,27 +2593,29 @@ static void end_polls(struct fuse_conn *fc)
  * is OK, the request will in that case be removed from the list before we touch
  * it.
  */
-void fuse_abort_conn(struct fuse_conn *fc)
+void fuse_chan_abort(struct fuse_chan *fch, bool abort_with_err)
 {
-	struct fuse_iqueue *fiq = &fc->chan->iq;
+	struct fuse_iqueue *fiq = &fch->iq;
 
-	spin_lock(&fc->chan->lock);
-	if (fc->chan->connected) {
+	fch->abort_with_err = abort_with_err;
+
+	spin_lock(&fch->lock);
+	if (fch->connected) {
 		struct fuse_dev *fud;
 		struct fuse_req *req, *next;
 		LIST_HEAD(to_end);
 		unsigned int i;
 
-		if (fc->chan->timeout.req_timeout)
-			cancel_delayed_work(&fc->chan->timeout.work);
+		if (fch->timeout.req_timeout)
+			cancel_delayed_work(&fch->timeout.work);
 
-		/* Background queuing checks fc->chan->connected under bg_lock */
-		spin_lock(&fc->chan->bg_lock);
-		fc->chan->connected = 0;
-		spin_unlock(&fc->chan->bg_lock);
+		/* Background queuing checks fch->connected under bg_lock */
+		spin_lock(&fch->bg_lock);
+		fch->connected = 0;
+		spin_unlock(&fch->bg_lock);
 
-		fuse_chan_set_initialized(fc->chan);
-		list_for_each_entry(fud, &fc->chan->devices, entry) {
+		fuse_chan_set_initialized(fch);
+		list_for_each_entry(fud, &fch->devices, entry) {
 			struct fuse_pqueue *fpq = &fud->pq;
 
 			spin_lock(&fpq->lock);
@@ -2634,11 +2636,11 @@ void fuse_abort_conn(struct fuse_conn *fc)
 						      &to_end);
 			spin_unlock(&fpq->lock);
 		}
-		spin_lock(&fc->chan->bg_lock);
-		fc->chan->blocked = 0;
-		fc->chan->max_background = UINT_MAX;
-		flush_bg_queue(fc);
-		spin_unlock(&fc->chan->bg_lock);
+		spin_lock(&fch->bg_lock);
+		fch->blocked = 0;
+		fch->max_background = UINT_MAX;
+		flush_bg_queue(fch);
+		spin_unlock(&fch->bg_lock);
 
 		spin_lock(&fiq->lock);
 		fiq->connected = 0;
@@ -2650,30 +2652,30 @@ void fuse_abort_conn(struct fuse_conn *fc)
 		wake_up_all(&fiq->waitq);
 		spin_unlock(&fiq->lock);
 		kill_fasync(&fiq->fasync, SIGIO, POLL_IN);
-		end_polls(fc);
-		wake_up_all(&fc->chan->blocked_waitq);
-		spin_unlock(&fc->chan->lock);
+		end_polls(fch->conn);
+		wake_up_all(&fch->blocked_waitq);
+		spin_unlock(&fch->lock);
 
 		fuse_dev_end_requests(&to_end);
 
 		/*
-		 * fc->chan->lock must not be taken to avoid conflicts with io-uring
+		 * fch->lock must not be taken to avoid conflicts with io-uring
 		 * locks
 		 */
-		fuse_uring_abort(fc->chan);
+		fuse_uring_abort(fch);
 	} else {
-		spin_unlock(&fc->chan->lock);
+		spin_unlock(&fch->lock);
 	}
 }
-EXPORT_SYMBOL_GPL(fuse_abort_conn);
+EXPORT_SYMBOL_GPL(fuse_chan_abort);
 
-void fuse_wait_aborted(struct fuse_conn *fc)
+void fuse_chan_wait_aborted(struct fuse_chan *fch)
 {
 	/* matches implicit memory barrier in fuse_drop_waiting() */
 	smp_mb();
-	wait_event(fc->chan->blocked_waitq, fuse_chan_num_waiting(fc->chan) == 0);
+	wait_event(fch->blocked_waitq, fuse_chan_num_waiting(fch) == 0);
 
-	fuse_uring_wait_stopped_queues(fc->chan);
+	fuse_uring_wait_stopped_queues(fch);
 }
 
 int fuse_dev_release(struct inode *inode, struct file *file)
@@ -2704,7 +2706,7 @@ int fuse_dev_release(struct inode *inode, struct file *file)
 
 		if (last) {
 			WARN_ON(fc->chan->iq.fasync != NULL);
-			fuse_abort_conn(fc);
+			fuse_chan_abort(fc->chan, false);
 		}
 		fuse_conn_put(fc);
 	}
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index efdaf0bf6f0f..a0c1212573d6 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -42,7 +42,8 @@ struct fuse_dev *fuse_dev_grab(struct file *file);
 void fuse_init_server_timeout(struct fuse_chan *fch, unsigned int timeout);
 
 /* Abort all requests */
-void fuse_abort_conn(struct fuse_conn *fc);
+void fuse_chan_abort(struct fuse_chan *fch, bool abort_with_err);
+void fuse_chan_wait_aborted(struct fuse_chan *fch);
 
 #ifdef CONFIG_FUSE_IO_URING
 bool fuse_uring_enabled(void);
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 2c7331e49630..4a0291a1f371 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1155,7 +1155,7 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
 		return -EOPNOTSUPP;
 	}
 
-	if (fc->aborted)
+	if (fc->chan->abort_with_err)
 		return -ECONNABORTED;
 	if (!fc->chan->connected)
 		return -ENOTCONN;
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index fd1ccc8df60d..534d037799ff 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -239,6 +239,9 @@ struct fuse_chan {
 	/* Use io_uring for communication */
 	unsigned int io_uring;
 
+	/** Connection aborted via sysfs, respond with ECONNABORTED on device I/O */
+	bool abort_with_err;
+
 #ifdef CONFIG_FUSE_IO_URING
 	/**  uring connection information*/
 	struct fuse_ring *ring;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index af8e05a403e5..b8655c3b48e2 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -483,9 +483,6 @@ struct fuse_conn {
 	/** Number of background requests at which congestion starts */
 	unsigned congestion_threshold;
 
-	/** Connection aborted via sysfs */
-	bool aborted;
-
 	/** Connection failed (version mismatch).  Cannot race with
 	    setting other bitfields since it is only set once in INIT
 	    reply, before any other request, and never cleared */
@@ -996,8 +993,6 @@ static inline ssize_t fuse_simple_idmap_request(struct mnt_idmap *idmap,
 int fuse_simple_background(struct fuse_mount *fm, struct fuse_args *args,
 			   gfp_t gfp_flags);
 
-void fuse_wait_aborted(struct fuse_conn *fc);
-
 void fuse_dentry_tree_init(void);
 void fuse_dentry_tree_cleanup(void);
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 88a4dc402155..5cb0cc9b365e 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -612,7 +612,7 @@ static void fuse_umount_begin(struct super_block *sb)
 	if (fc->no_force_umount)
 		return;
 
-	fuse_abort_conn(fc);
+	fuse_chan_abort(fc->chan, false);
 
 	// Only retire block-device-based superblocks.
 	if (sb->s_bdev != NULL)
@@ -1951,8 +1951,8 @@ void fuse_conn_destroy(struct fuse_mount *fm)
 	if (fc->destroy)
 		fuse_send_destroy(fm);
 
-	fuse_abort_conn(fc);
-	fuse_wait_aborted(fc);
+	fuse_chan_abort(fc->chan, false);
+	fuse_chan_wait_aborted(fc->chan);
 
 	if (!list_empty(&fc->entry)) {
 		mutex_lock(&fuse_mutex);
diff --git a/fs/fuse/req_timeout.c b/fs/fuse/req_timeout.c
index 9c48789b941a..6cc6fc491343 100644
--- a/fs/fuse/req_timeout.c
+++ b/fs/fuse/req_timeout.c
@@ -79,13 +79,13 @@ static void fuse_check_timeout(struct work_struct *work)
 	expired = fuse_request_expired(fch, &fiq->pending);
 	spin_unlock(&fiq->lock);
 	if (expired)
-		goto abort_conn;
+		goto chan_abort;
 
 	spin_lock(&fch->bg_lock);
 	expired = fuse_request_expired(fch, &fch->bg_queue);
 	spin_unlock(&fch->bg_lock);
 	if (expired)
-		goto abort_conn;
+		goto chan_abort;
 
 	spin_lock(&fch->lock);
 	if (!fch->connected) {
@@ -99,7 +99,7 @@ static void fuse_check_timeout(struct work_struct *work)
 		    fuse_fpq_processing_expired(fch, fpq->processing)) {
 			spin_unlock(&fpq->lock);
 			spin_unlock(&fch->lock);
-			goto abort_conn;
+			goto chan_abort;
 		}
 
 		spin_unlock(&fpq->lock);
@@ -107,15 +107,15 @@ static void fuse_check_timeout(struct work_struct *work)
 	spin_unlock(&fch->lock);
 
 	if (fuse_uring_request_expired(fch))
-		goto abort_conn;
+		goto chan_abort;
 
 out:
 	queue_delayed_work(system_percpu_wq, &fch->timeout.work,
 			   fuse_timeout_timer_freq);
 	return;
 
-abort_conn:
-	fuse_abort_conn(fch->conn);
+chan_abort:
+	fuse_chan_abort(fch, false);
 }
 
 static void set_request_timeout(struct fuse_chan *fch, unsigned int timeout)
-- 
2.53.0

