Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667BA43990E
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224806; cv=none; b=mGESqI1TMGYOrxYhEf4hGeK/8TIit/dDYndoEx1CmSWYsHzBwhPpfSOkXsJ77qZ+Lb9phXnA433g4qowoT0g01apmaQLEzwc7vULwps+cUfqqbkjalwlyQYBUAN9Kth7Pc02+2fnWRaPnePOIUp7giTasELZPfAWc9SOTQLH1dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224806; c=relaxed/simple;
	bh=A+/kFD415eHJnytkfCCpJw4M4vOP6a0q3VV7uGmi6+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MU5VOXcGnICumbHuqWJO/hyDil2cZn/ycS4/DqcfQk7akwLjSc9Z1NX14cgWJ3smXPON5FcQdgicWRvgSyZjqrYyX1zVZFGDlChI1XWII3KFNr+ZylXAEb7MJX5K6ncVkDt4o7vZ47nVFscZ/Aa2+2INzWx7r+wLj79E+mLUr2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWNm3dwI; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWNm3dwI"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6a3d915616fso617233eaf.2
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 11:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784224803; x=1784829603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhkyXRWTeUwvcziAn/6h12jp6HaYvdbFbgSNoWHmIG0=;
        b=JWNm3dwIS/2CMljoLLw5Rul0Cn/bUX+WgpEm/4MSM9BirPd0qA/lIdhbxV3BwAYg1v
         iCsI2AX6bdfd4StxPsDgQfMnwMi5ItUS87ruD9kUJUSGdTqfirZ9dxY+bspVCBbk0GSB
         7iBi+W2HizLuAG1UwxuxgttMyJpYMNkuGzMSO+9Q4QRj6ftbhZOQcdz6QbBuq9k5T7c0
         io/HWPhG3WvObGHJ8D4YahjnkWwcmvuNYMd+7EO/p0XQzj/qnaS1W5elq4vFclYHthH/
         j3yI6A4+Q8+LF5ROYwFRc8N6VErcsIj9o2p/LXHRmknBaws7P1cSNhiMctLSGMgg8QZ9
         aMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224803; x=1784829603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhkyXRWTeUwvcziAn/6h12jp6HaYvdbFbgSNoWHmIG0=;
        b=cCmIHYfOCzjpIKIfiepVjxPFUka7je3q/KT1uAIADReY/q89jWaWew5Di4lamAPWR1
         bJ3XrQL3Iz8qoVJnkpZDlXzSjEqWxmCFlT98COKO/phkZbQfJ6bVukEFZVYmZ+5cJdWO
         RUnHi1VmO++Dbbm76Ln66x+cNnicPocyguLYxUxuq21/c3aRaT1d/EDqQ2MiBjqzhj4Q
         TOYfofSvlcNKtKfnAq81SL+aNAFh2ldx2yGZYPos6MaKUv0+jyz+Fk0+hBEFSOTtj0dJ
         CQqaD3YSNikUY0DICaWqDg28npB9110pmsd2/Y8QtjXqR8IX3750N4FLk6tBgFGPMP/r
         tQsw==
X-Forwarded-Encrypted: i=1; AHgh+RoZmGz8pvMY82x1iH06ipg6hkJn4QvZGTHtaWY8S5nTXkiTggMf3h+29dYBEormzJYcYBWwO880IVdC@lists.linux.dev
X-Gm-Message-State: AOJu0YxzQg2a6vvvtLaTKl0zPG82RCIgPCxnbEoFten4fsD8H/+HAgT7
	keSQQz/QB0UCwblzt27d+oQER88IwQQxPvHKKYgmuJnoAwf44fl4CJ3W
X-Gm-Gg: AfdE7clU8BYla9H+5fFo41b9lLFDIJLlHXtkbllx6GJm3JS3cx4ZfkFt5gmVZPQWmQ6
	Ni5se9GYRroPTodmEm92/J0LqpgFDfVwVx1m3uhNvBWlOl7YFjCJpFqZYApi+Rss6OucQGiRaT9
	kDbzdPZS05otHj1beiRo3NoXzLBS7ySp1T1/+W6C2e45iOLK9n+4YlbnjslXYVhNVOQHQJAkjAo
	OpqeNKn3v9HOfUjpXbWCUjk1Uuqnm+YKDBHzZrebiQVJ3K6NmqtnRDqOY/vm/j/KL4YxdgUajGD
	90b6FNU/zurEc961l/5eW52lgB2IKgRW5ORIXhVGa1YO4VnMKsxYDGCQEpl/vw2s5VmIhMspKdM
	hspIleXaysBAIG9q/Wwx8t7u5bOKFJXMFvN27KH2fj9kcTI+73437CLhmrbdVtVffwxo9dEaJI0
	idtRyVcCm+kwz9I6jWXwDR8b0SstsdE9da0EqUxas+m6swVZEz/TtqMQ==
X-Received: by 2002:a05:6820:308b:b0:6a1:363d:bc4e with SMTP id 006d021491bc7-6a3da004469mr5093082eaf.46.1784224802867;
        Thu, 16 Jul 2026 11:00:02 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:44::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a83eb2dsm17488845eaf.10.2026.07.16.11.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:00:02 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	amir73il@gmail.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v6 4/6] fuse: support registered buffer pools in io-uring
Date: Thu, 16 Jul 2026 10:59:06 -0700
Message-ID: <20260716175908.2339738-5-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260716175908.2339738-1-joannelkoong@gmail.com>
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow servers to use a buffer pool that is also registered through
io-uring. When the server registers a buffer pool with io-uring, the
pages backing the pool are pinned upfront. This eliminates the overhead
of pinning/unpinning user pages and translating virtual addresses per
i/o request. This also allows servers to use the same registered memory
for subsequent backing store I/O (eg read_fixed/write_fixed), keeping
data in the same pinned pages without additional pinning or mapping
overhead required.

To use this, the server needs to set the FUSE_URING_REGISTERED_BUFPOOL
flag when adding a bufpool through the FUSE_IO_URING_CMD_ADD_BUFPOOL
cmd. For every sqe submitted (including the one for adding the bufpool),
it should set sqe->uring_cmd_flags to include IORING_URING_CMD_FIXED,
and pass in the index where the registered bufpool resides to
sqe->buf_index.

Benchmarked with passthrough_hp (--nopassthrough, q_depth=8) on a
2-socket Intel Xeon Gold 6138 (40 cores / 80 threads), using fio (sync
engine, bs=1M, O_DIRECT, numjobs=2, 30s run + 10s ramp, 3 runs) where
direct-I/O throughput is against a RAM-backed (tmpfs) source (backing
I/O is not the bottleneck):

		    baseline      registered buffers
  direct read       ~5.1 GB/s     ~5.4 GB/s   (+~5%)
  direct write      ~3.4 GB/s     ~4.8 GB/s   (+~45%)

Registered buffers bring up the write path speed up closer to speed of
reads. There isn't much improvement for reads because it is already fast
enough where it's at the copy-bound ceiling (surpassing that requires
doing zero-copy). On a device-bound NVMe though, the differences are
within noise, as backing I/O dominates per-request latency.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c       | 122 +++++++++++++++++++++++++++++++-------
 fs/fuse/dev_uring_i.h     |   8 +++
 include/uapi/linux/fuse.h |   4 ++
 3 files changed, 112 insertions(+), 22 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e9da92b46090..ed7e783bd68d 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -22,6 +22,8 @@ MODULE_PARM_DESC(enable_uring,
 #define FUSE_URING_IOV_HEADERS 0
 #define FUSE_URING_IOV_PAYLOAD 1
 
+#define FUSE_URING_ADD_BUFPOOL_FLAGS	(FUSE_URING_REGISTERED_BUFPOOL)
+
 bool fuse_uring_enabled(void)
 {
 	return enable_uring;
@@ -47,6 +49,27 @@ static inline bool bufpool_enabled(struct fuse_ring_queue *queue)
 	return queue->payload_mode == FUSE_PAYLOAD_BUFPOOL;
 }
 
+static inline bool bufpool_registered(struct fuse_ring_queue *queue)
+{
+	return queue->bufpool && queue->bufpool->registered;
+}
+
+/*
+ * For a registered bufpool, every sqe that drives a payload import (REGISTER,
+ * COMMIT_AND_FETCH) must carry the registered buffer index of the pool.
+ * This also must be called from the command's issue handler, where cmd->sqe is
+ * still valid
+ */
+static inline bool fuse_uring_cmd_index_ok(struct io_uring_cmd *cmd,
+					   struct fuse_ring_queue *queue)
+{
+	if (!bufpool_registered(queue))
+		return true;
+
+	return (cmd->flags & IORING_URING_CMD_FIXED) &&
+	       READ_ONCE(cmd->sqe->buf_index) == queue->bufpool->registered_index;
+}
+
 static void uring_cmd_set_ring_ent(struct io_uring_cmd *cmd,
 				   struct fuse_ring_ent *ring_ent)
 {
@@ -653,19 +676,42 @@ static int copy_header_from_ring(struct fuse_ring_ent *ent,
 	return 0;
 }
 
+static int fuse_uring_import_payload(struct fuse_ring_ent *ent, int dir,
+				     struct iov_iter *iter,
+				     unsigned int issue_flags)
+{
+	void __user *base = ent->payload.iov_base;
+	size_t len = ent->payload.iov_len;
+	int err = 0;
+
+	if (!base) {
+		memset(iter, 0, sizeof(*iter));
+		return 0;
+	}
+
+	if (bufpool_registered(ent->queue))
+		err = io_uring_cmd_import_fixed((u64)(uintptr_t)base, len, dir,
+						iter, ent->cmd, issue_flags);
+	else
+		err = import_ubuf(dir, base, len, iter);
+
+	if (err)
+		pr_info_ratelimited("fuse: Import of user buffer failed\n");
+
+	return err;
+}
+
 static int setup_fuse_copy_state(struct fuse_copy_state *cs,
 				 struct fuse_req *req,
 				 struct fuse_ring_ent *ent, int dir,
-				 struct iov_iter *iter)
+				 struct iov_iter *iter,
+				 unsigned int issue_flags)
 {
 	int err;
 
-	err = import_ubuf(dir, ent->payload.iov_base, ent->payload.iov_len,
-			  iter);
-	if (err) {
-		pr_info_ratelimited("fuse: Import of user buffer failed\n");
+	err = fuse_uring_import_payload(ent, dir, iter, issue_flags);
+	if (err)
 		return err;
-	}
 
 	fuse_copy_init(cs, dir == ITER_DEST, iter);
 
@@ -676,7 +722,8 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
 }
 
 static int fuse_uring_copy_from_ring(struct fuse_req *req,
-				     struct fuse_ring_ent *ent)
+				     struct fuse_ring_ent *ent,
+				     unsigned int issue_flags)
 {
 	struct fuse_copy_state cs;
 	struct fuse_args *args = req->args;
@@ -689,7 +736,8 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
 	if (err)
 		return err;
 
-	err = setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter);
+	err = setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter,
+				    issue_flags);
 	if (err)
 		return err;
 
@@ -702,7 +750,8 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
  * Copy data from the req to the ring buffer
  */
 static int fuse_uring_args_to_ring(struct fuse_req *req,
-				   struct fuse_ring_ent *ent)
+				   struct fuse_ring_ent *ent,
+				   unsigned int issue_flags)
 {
 	struct fuse_copy_state cs;
 	struct fuse_args *args = req->args;
@@ -715,7 +764,8 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 		.commit_id = req->in.h.unique,
 	};
 
-	err = setup_fuse_copy_state(&cs, req, ent, ITER_DEST, &iter);
+	err = setup_fuse_copy_state(&cs, req, ent, ITER_DEST, &iter,
+				    issue_flags);
 	if (err)
 		return err;
 
@@ -754,7 +804,8 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 }
 
 static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
-				   struct fuse_req *req)
+				   struct fuse_req *req,
+				   unsigned int issue_flags)
 {
 	struct fuse_ring_queue *queue = ent->queue;
 	int err;
@@ -771,7 +822,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 		return err;
 
 	/* copy the request */
-	err = fuse_uring_args_to_ring(req, ent);
+	err = fuse_uring_args_to_ring(req, ent, issue_flags);
 	if (unlikely(err)) {
 		pr_info_ratelimited("Copy to ring failed: %d\n", err);
 		return err;
@@ -868,11 +919,12 @@ static int fuse_uring_prep_buffer(struct fuse_ring_ent *ent,
 }
 
 static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
-				   struct fuse_req *req)
+				   struct fuse_req *req,
+				   unsigned int issue_flags)
 {
 	int err;
 
-	err = fuse_uring_copy_to_ring(ent, req);
+	err = fuse_uring_copy_to_ring(ent, req, issue_flags);
 	if (!err) {
 		set_bit(FR_SENT, &req->flags);
 		trace_fuse_request_sent(req);
@@ -983,7 +1035,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 		goto out;
 	}
 
-	err = fuse_uring_copy_from_ring(req, ent);
+	err = fuse_uring_copy_from_ring(req, ent, issue_flags);
 out:
 	fuse_uring_req_end(ent, req, err);
 }
@@ -995,7 +1047,8 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
  * Else, there is no next fuse request and this returns false.
  */
 static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
-					 struct fuse_ring_queue *queue)
+					 struct fuse_ring_queue *queue,
+					 unsigned int issue_flags)
 {
 	int err;
 	struct fuse_req *req;
@@ -1007,7 +1060,7 @@ static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
 	spin_unlock(&queue->lock);
 
 	if (req) {
-		err = fuse_uring_prepare_send(ent, req);
+		err = fuse_uring_prepare_send(ent, req, issue_flags);
 		if (err)
 			goto retry;
 	}
@@ -1081,6 +1134,11 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 		return err;
 	}
 
+	if (!fuse_uring_cmd_index_ok(cmd, queue)) {
+		spin_unlock(&queue->lock);
+		return -EINVAL;
+	}
+
 	/* Find a request based on the unique ID of the fuse request
 	 * This should get revised, as it needs a hash calculation and list
 	 * search. And full struct fuse_pqueue is needed (memory overhead).
@@ -1126,7 +1184,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	 * available and the cmd only returns to userspace when there's a
 	 * next request and an available buffer.
 	 */
-	if (fuse_uring_get_next_fuse_req(ent, queue))
+	if (fuse_uring_get_next_fuse_req(ent, queue, issue_flags))
 		fuse_uring_send(ent, cmd, 0, issue_flags);
 	return 0;
 }
@@ -1252,7 +1310,8 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 
 	spin_lock(&queue->lock);
 	if (bufpool_enabled(queue)) {
-		if (payload->iov_base || payload->iov_len) {
+		if (payload->iov_base || payload->iov_len ||
+		    !fuse_uring_cmd_index_ok(cmd, queue)) {
 			spin_unlock(&queue->lock);
 			return ERR_PTR(err);
 		}
@@ -1362,8 +1421,21 @@ static int fuse_uring_add_bufpool(struct io_uring_cmd *cmd,
 	uintptr_t pool_uaddr;
 	unsigned int pool_len, nr_bufs;
 	size_t pool_size, buf_size;
+	bool registered = flags & FUSE_URING_REGISTERED_BUFPOOL;
+
+	if (!ring || qid >= ring->nr_queues)
+		return -EINVAL;
 
-	if (!ring || qid >= ring->nr_queues || flags)
+	if (flags & ~FUSE_URING_ADD_BUFPOOL_FLAGS)
+		return -EINVAL;
+
+	/*
+	 * A registered bufpool is reached through an io_uring fixed buffer, so
+	 * this command must be submitted with IORING_URING_CMD_FIXED and the
+	 * registered buffer index in sqe->buf_index. That index is recorded
+	 * below and enforced on every REGISTER / COMMIT_AND_FETCH sqe.
+	 */
+	if (registered && !(cmd->flags & IORING_URING_CMD_FIXED))
 		return -EINVAL;
 
 	/* Pairs with smp_store_release() in fuse_uring_create_queue() */
@@ -1392,6 +1464,11 @@ static int fuse_uring_add_bufpool(struct io_uring_cmd *cmd,
 	/* all buffers are free */
 	bitmap_set(pool->free_map, 0, nr_bufs);
 
+	if (registered) {
+		pool->registered = true;
+		pool->registered_index = READ_ONCE(cmd->sqe->buf_index);
+	}
+
 	spin_lock(&queue->lock);
 	if (queue->payload_mode != FUSE_PAYLOAD_UNSET) {
 		spin_unlock(&queue->lock);
@@ -1504,9 +1581,10 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 	int err;
 
 	if (!tw.cancel) {
-		err = fuse_uring_prepare_send(ent, ent->fuse_req);
+		err = fuse_uring_prepare_send(ent, ent->fuse_req, issue_flags);
 		if (err) {
-			if (!fuse_uring_get_next_fuse_req(ent, queue))
+			if (!fuse_uring_get_next_fuse_req(ent, queue,
+							  issue_flags))
 				return;
 			err = 0;
 		}
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index cdf56f8b38b5..e142cae43022 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -49,6 +49,14 @@ enum fuse_queue_payload_mode {
 };
 
 struct fuse_bufpool {
+	bool registered;
+
+	/*
+	 * io_uring registered buffer table index for this pool, bound at
+	 * ADD_BUFPOOL time. Only valid if the bufpool is registered
+	 */
+	u16 registered_index;
+
 	/* starting uaddr of the bufpool */
 	uintptr_t base_uaddr;
 
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index f7173b5d4321..07d12f1c55bb 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -246,6 +246,7 @@
  *  - add FUSE_HAS_IO_URING_BUFPOOL
  *  - add fuse_uring_cmd_req bufpool struct
  *  - add bufpool offset field to fuse_uring_ent_in_out struct
+ *  - add FUSE_URING_REGISTERED_BUFPOOL flag
  */
 
 #ifndef _LINUX_FUSE_H
@@ -1310,6 +1311,9 @@ enum fuse_uring_cmd {
 	FUSE_IO_URING_CMD_ADD_BUFPOOL = 4,
 };
 
+/* fuse_uring_cmd_req flags for FUSE_IO_URING_CMD_ADD_BUFPOOL */
+#define FUSE_URING_REGISTERED_BUFPOOL	(1 << 0)
+
 /**
  * In the 80B command area of the SQE.
  */
-- 
2.52.0

