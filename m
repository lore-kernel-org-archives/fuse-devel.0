Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8977539934B
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331047; cv=none; b=AZBKfb1kh8+AJlHXl1taVsvOThT2NJu7YYKgv7m1sffP4xQ+dDbzP5jVR2XMbOkmuZwHbf/Js+Et0bzBmst+rGIsM7CeKstPQw3nqjto2F+0ClKaet2/flbzg1E6wEo+SfEiu4BObkPL+QQyVlnakJ1752tgyfOP80YPzKTY5jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331047; c=relaxed/simple;
	bh=6YINIZYZ766Tkz25/abZGfGK2YbVNTaar/g0XnMoulw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=pE/GaJpoRx6wKOjjbTcRzM1oDwNakuNx46Bp3o3Z/TfFycb9RXIwYERaJTSxIJf8yugXmttAkg7wEzVnis4fmsPZ9sS63OPNBLoHAz1Ju2U0fQcT5KGSkDoeWKeDXhlB8VX0QAKKvFjyog6CTk8vWO2kL6wA6S4/zeXvR4XNSss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LlXfLCnh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LlXfLCnh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UqNwrKbv1CBFR0H8qiJy6ZZmfZue/paSTki31+psO5M=;
	b=LlXfLCnho7XsZssIlMcY1rMpk3yR+ybl00Fe/VpsmSHpnABa91N1UrfLZt0B5ZIBQuI2b8
	L33cdtqksiOPL9EINedCCY2ZhuUShpIdGGuVwzOGQQK8fOmdHdDeTg2H1uNDTr5rFxkqFl
	dh6EA/FHSE9nQ8nymLkBS6j/jFvzI1Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-LXdkWPxyOWWsypvB_nlhfw-1; Thu, 16 Apr 2026 05:17:15 -0400
X-MC-Unique: LXdkWPxyOWWsypvB_nlhfw-1
X-Mimecast-MFC-AGG-ID: LXdkWPxyOWWsypvB_nlhfw_1776331034
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4839fc4cef6so3915805e9.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331034; x=1776935834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UqNwrKbv1CBFR0H8qiJy6ZZmfZue/paSTki31+psO5M=;
        b=Ngd24imZYjBDquooeTt1xnDIfaN3wqEJWQUjqgPqeBG+u4nDNdgrL51+iU0nM+hN+b
         CsK+5XpZASk3B0XWNhZ4VPDQwW8PPfNpUFR+wT/X4UYD/GXAtnYmvjuQA6nmmppYTFHX
         dXxYnzuCKsO0x9ENtfRqN/3IDsp+mENG35JH5y78px5RHlKLagEnsF8Q3n1wA3xPK1xZ
         UFB0jEnPgYtSLiENAOwJ8M2hj02bwsVNAXOoj+9E7w76YfcAbR+t35XpzGSUU52l6guH
         sNcfqOM+S89tIMsXgLCvS/nNu/qB9eX8UbPyYqK8JOTZ75px5vgNLWNNHC7IrcZqsgLu
         N8tA==
X-Gm-Message-State: AOJu0Yz8Duxau+oZwJMThvWtGB8COnS8UlhKhjaxAlxCrFRMBizHYUPE
	iPOLQSklarVR3H7pyo5CNJDw93gzzZBtORq41Cf53LBh9I3BNq8FLRIePouygsRQTdzf7BapByx
	kaKSEUYgeSXZokEx4+cfFRWI6Rert3v5BiSrVCeMY1VPO8MI5wpAh0WuQroVevgPl3B9XmTVnkJ
	1+uQ9LOQBeu7yjMC6T/YN+O+cGXbNmnmo7wYguC9DPukw+T0A=
X-Gm-Gg: AeBDietxI9od1XnADHA3wApDoddT2PeKHxery0GzUI4PDRJXEgCgHTtgHgtDY1sOyzX
	IaG7cX/S6GCsgEXtArXWUXioJ3HTswpg6ysr9COBZJmCBU0dQ8fVM+QvWq9XyE0aDFcwbEVoElW
	P6pmosSwo1Lm5ly/zfXRwAlmxfPACuXpXkCFESwGVMcd6QEunnvySFMifslwELZVC4DgLd1hP8k
	mQaLi07+xYqe4+wNzK4sZmJRGZTVttkSQpDsEtWI3zH4yEw3qcmlgw1sGqmGhHkoTGUd9qSeUXW
	ErVIJ9W70H/4z3gjClVvgcH75PNS1Y2BVg0cTCgY5LSN6ioeRvU65WngeY7sYnmGaQxzodr7qso
	1OZ9grY3FNTix+I6/4JorU3nP3l0lD+6dJxooDM4m4QFsLSHQ7NtvFoF9BPASLNjkEl2JJdKWwj
	nxIHlmmg==
X-Received: by 2002:a05:600c:a303:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-488f480976emr24864475e9.10.1776331033767;
        Thu, 16 Apr 2026 02:17:13 -0700 (PDT)
X-Received: by 2002:a05:600c:a303:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-488f480976emr24864205e9.10.1776331033231;
        Thu, 16 Apr 2026 02:17:13 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:12 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 08/32] fuse: move io_uring related members to fuse_chan
Date: Thu, 16 Apr 2026 11:16:32 +0200
Message-ID: <20260416091658.462783-9-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: wRCXm6Dsxt4yshfVFzDxW6J7oTJzlZ4eEff7QDMlAbE_1776331034
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Move:

 - io_uring
 - ring

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.c         |  2 +-
 fs/fuse/dev_uring.c   | 26 +++++++++++++-------------
 fs/fuse/dev_uring_i.h |  6 +++---
 fs/fuse/fuse_dev_i.h  |  8 ++++++++
 fs/fuse/fuse_i.h      |  8 --------
 fs/fuse/inode.c       |  2 +-
 6 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 9885347df331..4d21e22301ed 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -79,7 +79,7 @@ void fuse_set_initialized(struct fuse_conn *fc)
 static bool fuse_block_alloc(struct fuse_conn *fc, bool for_background)
 {
 	return !fc->chan->initialized || (for_background && fc->chan->blocked) ||
-	       (fc->io_uring && fc->chan->connected && !fuse_uring_ready(fc));
+	       (fc->chan->io_uring && fc->chan->connected && !fuse_uring_ready(fc));
 }
 
 static void fuse_drop_waiting(struct fuse_conn *fc)
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e350b1dc1722..1a7a364c8131 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -159,7 +159,7 @@ static bool ent_list_request_expired(struct fuse_conn *fc, struct list_head *lis
 
 bool fuse_uring_request_expired(struct fuse_conn *fc)
 {
-	struct fuse_ring *ring = fc->ring;
+	struct fuse_ring *ring = fc->chan->ring;
 	struct fuse_ring_queue *queue;
 	int qid;
 
@@ -187,7 +187,7 @@ bool fuse_uring_request_expired(struct fuse_conn *fc)
 
 void fuse_uring_destruct(struct fuse_conn *fc)
 {
-	struct fuse_ring *ring = fc->ring;
+	struct fuse_ring *ring = fc->chan->ring;
 	int qid;
 
 	if (!ring)
@@ -218,7 +218,7 @@ void fuse_uring_destruct(struct fuse_conn *fc)
 
 	kfree(ring->queues);
 	kfree(ring);
-	fc->ring = NULL;
+	fc->chan->ring = NULL;
 }
 
 /*
@@ -231,7 +231,7 @@ static struct fuse_ring *fuse_uring_create(struct fuse_conn *fc)
 	struct fuse_ring *res = NULL;
 	size_t max_payload_size;
 
-	ring = kzalloc_obj(*fc->ring, GFP_KERNEL_ACCOUNT);
+	ring = kzalloc_obj(*fc->chan->ring, GFP_KERNEL_ACCOUNT);
 	if (!ring)
 		return NULL;
 
@@ -244,10 +244,10 @@ static struct fuse_ring *fuse_uring_create(struct fuse_conn *fc)
 	max_payload_size = max(max_payload_size, fc->max_pages * PAGE_SIZE);
 
 	spin_lock(&fc->lock);
-	if (fc->ring) {
+	if (fc->chan->ring) {
 		/* race, another thread created the ring in the meantime */
 		spin_unlock(&fc->lock);
-		res = fc->ring;
+		res = fc->chan->ring;
 		goto out_err;
 	}
 
@@ -256,7 +256,7 @@ static struct fuse_ring *fuse_uring_create(struct fuse_conn *fc)
 	ring->nr_queues = nr_queues;
 	ring->fc = fc;
 	ring->max_payload_sz = max_payload_size;
-	smp_store_release(&fc->ring, ring);
+	smp_store_release(&fc->chan->ring, ring);
 
 	spin_unlock(&fc->lock);
 	return ring;
@@ -879,7 +879,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 								       struct fuse_uring_cmd_req);
 	struct fuse_ring_ent *ent;
 	int err;
-	struct fuse_ring *ring = fc->ring;
+	struct fuse_ring *ring = fc->chan->ring;
 	struct fuse_ring_queue *queue;
 	uint64_t commit_id = READ_ONCE(cmd_req->commit_id);
 	unsigned int qid = READ_ONCE(cmd_req->qid);
@@ -1082,7 +1082,7 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 {
 	const struct fuse_uring_cmd_req *cmd_req = io_uring_sqe128_cmd(cmd->sqe,
 								       struct fuse_uring_cmd_req);
-	struct fuse_ring *ring = smp_load_acquire(&fc->ring);
+	struct fuse_ring *ring = smp_load_acquire(&fc->chan->ring);
 	struct fuse_ring_queue *queue;
 	struct fuse_ring_ent *ent;
 	int err;
@@ -1149,7 +1149,7 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
 	fc = fud->fc;
 
 	/* Once a connection has io-uring enabled on it, it can't be disabled */
-	if (!enable_uring && !fc->io_uring) {
+	if (!enable_uring && !fc->chan->io_uring) {
 		pr_info_ratelimited("fuse-io-uring is disabled\n");
 		return -EOPNOTSUPP;
 	}
@@ -1172,7 +1172,7 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
 		if (err) {
 			pr_info_once("FUSE_IO_URING_CMD_REGISTER failed err=%d\n",
 				     err);
-			fc->io_uring = 0;
+			fc->chan->io_uring = 0;
 			wake_up_all(&fc->chan->blocked_waitq);
 			return err;
 		}
@@ -1262,7 +1262,7 @@ static void fuse_uring_dispatch_ent(struct fuse_ring_ent *ent)
 void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 {
 	struct fuse_conn *fc = req->fm->fc;
-	struct fuse_ring *ring = fc->ring;
+	struct fuse_ring *ring = fc->chan->ring;
 	struct fuse_ring_queue *queue;
 	struct fuse_ring_ent *ent = NULL;
 	int err;
@@ -1305,7 +1305,7 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 bool fuse_uring_queue_bq_req(struct fuse_req *req)
 {
 	struct fuse_conn *fc = req->fm->fc;
-	struct fuse_ring *ring = fc->ring;
+	struct fuse_ring *ring = fc->chan->ring;
 	struct fuse_ring_queue *queue;
 	struct fuse_ring_ent *ent = NULL;
 
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index 9edb8295fdb2..5b981708d04a 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -148,7 +148,7 @@ bool fuse_uring_request_expired(struct fuse_conn *fc);
 
 static inline void fuse_uring_abort(struct fuse_conn *fc)
 {
-	struct fuse_ring *ring = fc->ring;
+	struct fuse_ring *ring = fc->chan->ring;
 
 	if (ring == NULL)
 		return;
@@ -161,7 +161,7 @@ static inline void fuse_uring_abort(struct fuse_conn *fc)
 
 static inline void fuse_uring_wait_stopped_queues(struct fuse_conn *fc)
 {
-	struct fuse_ring *ring = fc->ring;
+	struct fuse_ring *ring = fc->chan->ring;
 
 	if (ring)
 		wait_event(ring->stop_waitq,
@@ -170,7 +170,7 @@ static inline void fuse_uring_wait_stopped_queues(struct fuse_conn *fc)
 
 static inline bool fuse_uring_ready(struct fuse_conn *fc)
 {
-	return fc->ring && fc->ring->ready;
+	return fc->chan->ring && fc->chan->ring->ready;
 }
 
 #else /* CONFIG_FUSE_IO_URING */
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 8afe18ddc891..ff1c62297e01 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -128,6 +128,14 @@ struct fuse_chan {
 
 	/** The number of requests waiting for completion */
 	atomic_t num_waiting;
+
+	/* Use io_uring for communication */
+	unsigned int io_uring;
+
+#ifdef CONFIG_FUSE_IO_URING
+	/**  uring connection information*/
+	struct fuse_ring *ring;
+#endif
 };
 
 #define FUSE_PQ_HASH_BITS 8
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index a56e49c7a324..701bb18dcb00 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -764,9 +764,6 @@ struct fuse_conn {
 	/* Is synchronous FUSE_INIT allowed? */
 	unsigned int sync_init:1;
 
-	/* Use io_uring for communication */
-	unsigned int io_uring;
-
 	/** Maximum stack depth for passthrough backing files */
 	int max_stack_depth;
 
@@ -819,11 +816,6 @@ struct fuse_conn {
 	struct idr backing_files_map;
 #endif
 
-#ifdef CONFIG_FUSE_IO_URING
-	/**  uring connection information*/
-	struct fuse_ring *ring;
-#endif
-
 	/** Only used if the connection opts into request timeouts */
 	struct {
 		/* Worker for checking if any requests have timed out */
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 85ac0e2244bc..c7f7e0ff12f7 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1412,7 +1412,7 @@ static void process_init_reply(struct fuse_mount *fm, struct fuse_args *args,
 					ok = false;
 			}
 			if (flags & FUSE_OVER_IO_URING && fuse_uring_enabled())
-				fc->io_uring = 1;
+				fc->chan->io_uring = 1;
 
 			if (flags & FUSE_REQUEST_TIMEOUT)
 				timeout = arg->request_timeout;
-- 
2.53.0

