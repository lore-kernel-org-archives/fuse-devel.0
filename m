Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74FD39B94B
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331073; cv=none; b=GyO5YfyC90vtP+AO7neGx8wrSglM1keM7o3290HpzBfB8SSZ9Sr9RMtmHXHl22LNfDEZL4v2Q8YLjAoWqaTqRuqDcj+8vFNId7lJHfDE8MxHg8lDscdeQ3TxYkZyjTc+NKJDn3GZLuZt60792epqdg/dLoCnpLVateCrW1fy+PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331073; c=relaxed/simple;
	bh=Gi3+d+Fi9cO/mFeXeEY77zKHcoqaGBusUXNF/IBFtMY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=FGk58JYCABQ3MWmbRpopLlGzwI+zioqEk/eSBecajbjQY24+M4ETZ8izpu/y7GP2lotwJJvsnGm/4kbU3SME2TXAp9/jfax46iCxMOpeI9FcRmT9xT9/rw+1uD1xpiwWXIckgBGkn+uWHpwlLg3JpjrmU9XE8pmm2bH0Uxvr+uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TFsMtRF+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TFsMtRF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rr2lB9mjk2I1CanusyLJPfIhz/LPmkHr/AEi1I8eAJ8=;
	b=TFsMtRF+M0UWJy/qpXgZOPt9D/kuNg7cKYPuD1cqCbjquDZtjgcrxpYMZOKLLNLCHoWtct
	9b44C5pnsFoupcSp37FXCRSBmBMZLJUxCP1x8inpciIwBGCoWo9fEJXE1X/ANRkJm7nDIl
	VXy1C7Xj0rbqB7l6lK/5jNzR7T66pzo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-R4W6u7ZoNdWPPUTk63E8Pw-1; Thu, 16 Apr 2026 05:17:43 -0400
X-MC-Unique: R4W6u7ZoNdWPPUTk63E8Pw-1
X-Mimecast-MFC-AGG-ID: R4W6u7ZoNdWPPUTk63E8Pw_1776331062
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488c2764f83so50889885e9.2
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331062; x=1776935862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rr2lB9mjk2I1CanusyLJPfIhz/LPmkHr/AEi1I8eAJ8=;
        b=GzvrNzq6InEBp/AIEGA8VYHYNxX98OawAR6pWady25pnjU/wG09kmX0ro3R3TGCmSd
         hrDycJITBllDS3dsDo73k7fw7GHF96fPH/FQTrd/Ke25KT49u8m9pZnC1euJfTiChUq/
         mAsSsvB4CouZ7fCWnIn7YMCwrGXdanfxAquG/QEczU/fHp2pWO6MowT2vxNVAsxaqw8+
         iLzSuaubQW0RrSzUs8JtmUxVR6JTVFmS2PQck0StN6cbAqtnpQ+TjiXLbOPeq1LkEP8X
         SfJG16yKxh1ID+G6vGFf1LEGkm/AC9gzROON7/Fk5IXOtn75zvQlQFwdYguXmnzYNpuJ
         uRgQ==
X-Gm-Message-State: AOJu0YxNh1AAKxFqy9FWDvIVh6hOL07DKFK7MmuOHTWJeVcoWW1PYwh7
	0MlmZAjcWg2rhl1dy7VCWj2oOPEwGIF+zC2rE4qLn2Uce2sNT/qvChqOn+PZS1I9pTQmkq9Xtpd
	MG+jg5q4rXixgtiGHsYokq9z3UsjRiJtbrm2ICB7CF7p0tDVSzPzZoxEq9XjIyktiEnVRDU0bnC
	bKlkMBEv//dtM2A/aJkd/jNXbevvRBjV4IQhBQxZ04OFG97sI=
X-Gm-Gg: AeBDiesFCk6ka2zLC7QQGSIf7a++gF+GBAvQS9dX7DmhQpWJDFFndp9LmpRIPgdJ8kZ
	id/rwU3PP6O0vy4rBaBfzwL6ZTCzQrPnUiu2KlhvCvhkSbmGNP9iABZ1J/U1NndJm0kLaRJATtw
	yUtLmfR8bS/Z52nVexgzRSN1nCyRNExTcgB4fFRzrwtFRt0fb4+NUShqqpjJVqWzXVbY1AwmV/h
	UiG11erSzk+rAuJabLpdLoBVZjAWLnOoNydv5dktz/RK92bry71qz205PSBlHtlhvpqbb26KtRw
	9bPQ1rMcM4LrRLprnK8sYUZrGd0nv4oV2v5OClGTHulaQ+ie+O3kccW3pCNZ8BYOPMk3y6pK4Ru
	TysIUyA6q5i7+UhxIFmjvspXf1srKhFYHHIuiDO16AlDlG+lWKar2+92it+7pH72zQ18ftmwvSp
	DWAlX8oQ==
X-Received: by 2002:a05:600c:c088:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-488d67bf744mr249661415e9.4.1776331061744;
        Thu, 16 Apr 2026 02:17:41 -0700 (PDT)
X-Received: by 2002:a05:600c:c088:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-488d67bf744mr249661005e9.4.1776331061039;
        Thu, 16 Apr 2026 02:17:41 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:40 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 29/32] fuse: change ring->fc to ring->chan
Date: Thu, 16 Apr 2026 11:16:53 +0200
Message-ID: <20260416091658.462783-30-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Q-J36KnwpHcCZ9Njj7qLk4k9ypTn-CWIR6VUMR3xOwA_1776331062
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Store pointer to struct fuse_chan instead of struct fuse_conn in fuse_ring.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev_uring.c   | 44 +++++++++++++++++++++----------------------
 fs/fuse/dev_uring_i.h |  2 +-
 2 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index f6bed983fea0..64883cf94ab4 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -52,10 +52,10 @@ static struct fuse_ring_ent *uring_cmd_to_ring_ent(struct io_uring_cmd *cmd)
 static void fuse_uring_flush_bg(struct fuse_ring_queue *queue)
 {
 	struct fuse_ring *ring = queue->ring;
-	struct fuse_conn *fc = ring->fc;
+	struct fuse_chan *fch = ring->chan;
 
 	lockdep_assert_held(&queue->lock);
-	lockdep_assert_held(&fc->chan->bg_lock);
+	lockdep_assert_held(&fch->bg_lock);
 
 	/*
 	 * Allow one bg request per queue, ignoring global fc limits.
@@ -63,14 +63,14 @@ static void fuse_uring_flush_bg(struct fuse_ring_queue *queue)
 	 * eliminates the need for remote queue wake-ups when global
 	 * limits are met but this queue has no more waiting requests.
 	 */
-	while ((fc->chan->active_background < fc->chan->max_background ||
+	while ((fch->active_background < fch->max_background ||
 		!queue->active_background) &&
 	       (!list_empty(&queue->fuse_req_bg_queue))) {
 		struct fuse_req *req;
 
 		req = list_first_entry(&queue->fuse_req_bg_queue,
 				       struct fuse_req, list);
-		fc->chan->active_background++;
+		fch->active_background++;
 		queue->active_background++;
 
 		list_move_tail(&req->list, &queue->fuse_req_queue);
@@ -82,7 +82,7 @@ static void fuse_uring_req_end(struct fuse_ring_ent *ent, struct fuse_req *req,
 {
 	struct fuse_ring_queue *queue = ent->queue;
 	struct fuse_ring *ring = queue->ring;
-	struct fuse_conn *fc = ring->fc;
+	struct fuse_chan *fch = ring->chan;
 
 	lockdep_assert_not_held(&queue->lock);
 	spin_lock(&queue->lock);
@@ -90,9 +90,9 @@ static void fuse_uring_req_end(struct fuse_ring_ent *ent, struct fuse_req *req,
 	list_del_init(&req->list);
 	if (test_bit(FR_BACKGROUND, &req->flags)) {
 		queue->active_background--;
-		spin_lock(&fc->chan->bg_lock);
+		spin_lock(&fch->bg_lock);
 		fuse_uring_flush_bg(queue);
-		spin_unlock(&fc->chan->bg_lock);
+		spin_unlock(&fch->bg_lock);
 	}
 
 	spin_unlock(&queue->lock);
@@ -124,7 +124,7 @@ void fuse_uring_abort_end_requests(struct fuse_ring *ring)
 {
 	int qid;
 	struct fuse_ring_queue *queue;
-	struct fuse_conn *fc = ring->fc;
+	struct fuse_chan *fch = ring->chan;
 
 	for (qid = 0; qid < ring->nr_queues; qid++) {
 		queue = READ_ONCE(ring->queues[qid]);
@@ -133,11 +133,11 @@ void fuse_uring_abort_end_requests(struct fuse_ring *ring)
 
 		queue->stopped = true;
 
-		WARN_ON_ONCE(ring->fc->chan->max_background != UINT_MAX);
+		WARN_ON_ONCE(fch->max_background != UINT_MAX);
 		spin_lock(&queue->lock);
-		spin_lock(&fc->chan->bg_lock);
+		spin_lock(&fch->bg_lock);
 		fuse_uring_flush_bg(queue);
-		spin_unlock(&fc->chan->bg_lock);
+		spin_unlock(&fch->bg_lock);
 		spin_unlock(&queue->lock);
 		fuse_uring_abort_end_queue_requests(queue);
 	}
@@ -255,7 +255,7 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
 	init_waitqueue_head(&ring->stop_waitq);
 
 	ring->nr_queues = nr_queues;
-	ring->fc = fch->conn;
+	ring->chan = fch;
 	ring->max_payload_sz = max_payload_size;
 	smp_store_release(&fch->ring, ring);
 
@@ -271,7 +271,7 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
 static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 						       int qid)
 {
-	struct fuse_conn *fc = ring->fc;
+	struct fuse_chan *fch = ring->chan;
 	struct fuse_ring_queue *queue;
 	struct list_head *pq;
 
@@ -299,9 +299,9 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 	queue->fpq.processing = pq;
 	fuse_pqueue_init(&queue->fpq);
 
-	spin_lock(&fc->chan->lock);
+	spin_lock(&fch->lock);
 	if (ring->queues[qid]) {
-		spin_unlock(&fc->chan->lock);
+		spin_unlock(&fch->lock);
 		kfree(queue->fpq.processing);
 		kfree(queue);
 		return ring->queues[qid];
@@ -311,7 +311,7 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 	 * write_once and lock as the caller mostly doesn't take the lock at all
 	 */
 	WRITE_ONCE(ring->queues[qid], queue);
-	spin_unlock(&fc->chan->lock);
+	spin_unlock(&fch->lock);
 
 	return queue;
 }
@@ -532,8 +532,7 @@ static void fuse_uring_prepare_cancel(struct io_uring_cmd *cmd, int issue_flags,
  * Checks for errors and stores it into the request
  */
 static int fuse_uring_out_header_has_err(struct fuse_out_header *oh,
-					 struct fuse_req *req,
-					 struct fuse_conn *fc)
+					 struct fuse_req *req)
 {
 	int err;
 
@@ -813,7 +812,6 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 			      unsigned int issue_flags)
 {
 	struct fuse_ring *ring = ent->queue->ring;
-	struct fuse_conn *fc = ring->fc;
 	ssize_t err = 0;
 
 	err = copy_from_user(&req->out.h, &ent->headers->in_out,
@@ -823,7 +821,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 		goto out;
 	}
 
-	err = fuse_uring_out_header_has_err(&req->out.h, req, fc);
+	err = fuse_uring_out_header_has_err(&req->out.h, req);
 	if (err) {
 		/* req->out.h.error already set */
 		goto out;
@@ -982,8 +980,8 @@ static void fuse_uring_do_register(struct fuse_ring_ent *ent,
 {
 	struct fuse_ring_queue *queue = ent->queue;
 	struct fuse_ring *ring = queue->ring;
-	struct fuse_conn *fc = ring->fc;
-	struct fuse_iqueue *fiq = &fc->chan->iq;
+	struct fuse_chan *fch = ring->chan;
+	struct fuse_iqueue *fiq = &fch->iq;
 
 	fuse_uring_prepare_cancel(cmd, issue_flags, ent);
 
@@ -998,7 +996,7 @@ static void fuse_uring_do_register(struct fuse_ring_ent *ent,
 		if (ready) {
 			WRITE_ONCE(fiq->ops, &fuse_io_uring_ops);
 			WRITE_ONCE(ring->ready, true);
-			wake_up_all(&fc->chan->blocked_waitq);
+			wake_up_all(&fch->blocked_waitq);
 		}
 	}
 }
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index 741fdead2161..b8b5a958c4f9 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -107,7 +107,7 @@ struct fuse_ring_queue {
  */
 struct fuse_ring {
 	/* back pointer */
-	struct fuse_conn *fc;
+	struct fuse_chan *chan;
 
 	/* number of ring queues */
 	size_t nr_queues;
-- 
2.53.0

