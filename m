Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40894A33F5
	for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 19:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734044; cv=none; b=ghuiuGeM+fvDg/Y9yDj60ibAbcapL2c7WtpTP4oYxZQvKmVKnFT0gdlPZRtroNd6iQFu+m3eRVxUtqjuTADfGT2WpyPEI6sF3JOkcjoFHgFHOQKx9327slMUJTS1HNZHmH/4WJAxHbWFHoVB+wFwn0WtDw9AKRLk+BK0Mt6A/Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734044; c=relaxed/simple;
	bh=Grd1tMv19QIkfiHPPQ+mOv+Tufzx/0ojyUfL/5NScQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bL1J5ZAi3+quDyqbb2xQOO75OcqvytrySa2RIrmCkXC6X2H1EDZzXtR1KWwHZ/SX0bP5Y+GNx8uklWO2L2OGcEkG2g29h12n9TVkqGYwrHdqHrhSGvkJ0MqJb+eK5v9YGZyct6D4WttL61auCuKsZ4eYap6hWzIO9YhJRxs+a6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDy2cCPP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDy2cCPP"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d01663d816so12910495ad.1
        for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 12:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786734037; x=1787338837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0sFUIQQOoMYwwq916kVNM5lpzZUMeU/a0scHEWFSms=;
        b=tDy2cCPPTsD7eG8jLpECm0HEgyCmTiyBpPvcN0epct4Jj2ReQUbahlx/pzJ0NnBUX+
         NrlzEDa8i8ioGSQ3czQN0+OLJeTtPN8PtO/xcW91VMqX7pokXVbzIdRrg+OW7cXj4PYw
         P3xPn74dvz30W5ctYsVQI732xrzvaJlLux2GSH5NOFKajRU/1SzBjHvBrKepssoaJg3q
         8PfU4orWE7u834fACaUlj2UuVLXX92FrGvZihF0Ks7o/aXMNKlA/RmAwpGimqoeJWyaJ
         XO/ucPtg9GGK48GtmL8rrXFdd6d1ZsyDb/AfUzCbjyIuNHQoTy85rmMayQj8/pmSP1z6
         ofWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734037; x=1787338837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w0sFUIQQOoMYwwq916kVNM5lpzZUMeU/a0scHEWFSms=;
        b=EvVFymBcIavv4PWzx7rD0a1umNijpYt1FflasPosu7OLSMY+bFyOtEMShagvWU7H+2
         WaTQ7U5BWbpWwkRFfXIA4jpvxDWtdVRPiPgUszF3uuRwUNRjeL2lCFg2fOZ+vVSFy+hK
         7Le+J0nZwhztfQkKYeNlW5lcFWNCGbrGvQzY9Uo6w5ESVTs7Ngkq0mfOpNFDfkaOIBkb
         ngfwmY5a8kTPRLOgM6RVe7winveRHuqtDoPB1JP6eufpvUxxikizhsyDaeZhJ85Zf5Hs
         UihjHkeoSc7hR+2CoNV8kKr9dNx7DpJ3vT/EeVt/BrDmb2u1z3EM+LJN26N8ew6GE7vY
         9AgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPKqRYgVUruFBJn577D1u11DacKNNXVCBxo2dTK5bO3yuIHkxC8g2c5oPa7pFf8acG7ghci5uUKo+B@lists.linux.dev
X-Gm-Message-State: AOJu0YygEGGo8BOasFNsfaJbgssfDjg+elOx3IK2xwr4lEy7ysMKWeNJ
	xgwxVba+hr+72qNVv8Zc2UPHBogn9IsYZ/e8jeOj7eQQ4t77iDiEV6QB
X-Gm-Gg: AR+sD12ov9l6wJKttZl1BF8bcptE5imSGo4dRNzhklj4q6LNpNEBik7b9b4Utj4hbwn
	nnY6dHrVj3pP85m66mO1WxaCdD1+MIaoCZycAW5a0JOlyN6khb61pr7ewcQNDLR8WMeWC6ct4kj
	dgNEddsVlAKQnEGt+RIrdryQHnCq5LplShRv8fgySaW5rKkhm4dvTGnWjkpdHKJsBCK4pXPbLpM
	WJ/N4iYHz1MS1KRwjlchzhQgFhymTMjRwY0KSNZiF/hQr50/24QQql72noAvplq7nkNRGJabGa/
	jgR1qHcgPM03mxG2XswbR7PH2DizqehRgorH5I2X7HkI7M4mqdw5U59R/B7ks5mLET/cxyJB5Rg
	MzSeClPzXcAVdJTUnGry1/tLJl0nM++3gl8WGbXdm9TE6mDADFS5XYp06UJYnEwGrtwLKl66OOX
	6ml9W4ZGhwZHCfRatM0YmJiJkhST3ZxmdAOR2973YO3MeAPaerOQIWgOO5eHf5K+Qus/dm5Onbt
	aQjY4l+jgVP0VcrrRlzO+yyqiSoAn+Iz3+KdRfdCkzFYruXsXk=
X-Received: by 2002:a17:903:22ca:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d3b06e91c4mr96842185ad.0.1786734036728;
        Fri, 14 Aug 2026 12:00:36 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:53::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae50bef1sm14503045ad.0.2026.08.14.12.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:00:35 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	amir73il@gmail.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v7 4/6] fuse: support registered buffer pools in io-uring
Date: Fri, 14 Aug 2026 11:59:44 -0700
Message-ID: <20260814185946.3679478-5-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260814185946.3679478-1-joannelkoong@gmail.com>
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
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
 fs/fuse/dev_uring.c   | 112 ++++++++++++++++++++++++++++++++++--------
 fs/fuse/dev_uring_i.h |   8 +++
 2 files changed, 99 insertions(+), 21 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index d300c7f441c4..17806da93039 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -47,6 +47,27 @@ static inline bool bufpool_enabled(struct fuse_ring_queue *queue)
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
@@ -653,19 +674,42 @@ static int copy_header_from_ring(struct fuse_ring_ent *ent,
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
 
@@ -676,7 +720,8 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
 }
 
 static int fuse_uring_copy_from_ring(struct fuse_req *req,
-				     struct fuse_ring_ent *ent)
+				     struct fuse_ring_ent *ent,
+				     unsigned int issue_flags)
 {
 	struct fuse_copy_state cs;
 	struct fuse_args *args = req->args;
@@ -689,7 +734,8 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
 	if (err)
 		return err;
 
-	err = setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter);
+	err = setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter,
+				    issue_flags);
 	if (err)
 		return err;
 
@@ -702,7 +748,8 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
  * Copy data from the req to the ring buffer
  */
 static int fuse_uring_args_to_ring(struct fuse_req *req,
-				   struct fuse_ring_ent *ent)
+				   struct fuse_ring_ent *ent,
+				   unsigned int issue_flags)
 {
 	struct fuse_copy_state cs;
 	struct fuse_args *args = req->args;
@@ -715,7 +762,8 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 		.commit_id = req->in.h.unique,
 	};
 
-	err = setup_fuse_copy_state(&cs, req, ent, ITER_DEST, &iter);
+	err = setup_fuse_copy_state(&cs, req, ent, ITER_DEST, &iter,
+				    issue_flags);
 	if (err)
 		return err;
 
@@ -754,7 +802,8 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 }
 
 static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
-				   struct fuse_req *req)
+				   struct fuse_req *req,
+				   unsigned int issue_flags)
 {
 	struct fuse_ring_queue *queue = ent->queue;
 	int err;
@@ -771,7 +820,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 		return err;
 
 	/* copy the request */
-	err = fuse_uring_args_to_ring(req, ent);
+	err = fuse_uring_args_to_ring(req, ent, issue_flags);
 	if (unlikely(err)) {
 		pr_info_ratelimited("Copy to ring failed: %d\n", err);
 		return err;
@@ -868,11 +917,12 @@ static int fuse_uring_prep_buffer(struct fuse_ring_ent *ent,
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
@@ -983,7 +1033,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 		goto out;
 	}
 
-	err = fuse_uring_copy_from_ring(req, ent);
+	err = fuse_uring_copy_from_ring(req, ent, issue_flags);
 out:
 	fuse_uring_req_end(ent, req, err);
 }
@@ -995,7 +1045,8 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
  * Else, there is no next fuse request and this returns false.
  */
 static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
-					 struct fuse_ring_queue *queue)
+					 struct fuse_ring_queue *queue,
+					 unsigned int issue_flags)
 {
 	int err;
 	struct fuse_req *req;
@@ -1007,7 +1058,7 @@ static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
 	spin_unlock(&queue->lock);
 
 	if (req) {
-		err = fuse_uring_prepare_send(ent, req);
+		err = fuse_uring_prepare_send(ent, req, issue_flags);
 		if (err)
 			goto retry;
 	}
@@ -1081,6 +1132,11 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
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
@@ -1126,7 +1182,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	 * available and the cmd only returns to userspace when there's a
 	 * next request and an available buffer.
 	 */
-	if (fuse_uring_get_next_fuse_req(ent, queue))
+	if (fuse_uring_get_next_fuse_req(ent, queue, issue_flags))
 		fuse_uring_send(ent, cmd, 0, issue_flags);
 	return 0;
 }
@@ -1252,7 +1308,8 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 
 	spin_lock(&queue->lock);
 	if (bufpool_enabled(queue)) {
-		if (payload->iov_base || payload->iov_len) {
+		if (payload->iov_base || payload->iov_len ||
+		    !fuse_uring_cmd_index_ok(cmd, queue)) {
 			spin_unlock(&queue->lock);
 			return ERR_PTR(err);
 		}
@@ -1362,6 +1419,7 @@ static int fuse_uring_add_bufpool(struct io_uring_cmd *cmd,
 	uintptr_t pool_uaddr;
 	unsigned int pool_len, nr_bufs;
 	size_t pool_size, buf_size;
+	bool registered = cmd->flags & IORING_URING_CMD_FIXED;
 
 	if (!ring || qid >= ring->nr_queues || flags)
 		return -EINVAL;
@@ -1396,6 +1454,17 @@ static int fuse_uring_add_bufpool(struct io_uring_cmd *cmd,
 	/* all buffers are free */
 	bitmap_set(pool->free_map, 0, nr_bufs);
 
+	/*
+	 * A registered bufpool is reached through an io_uring fixed buffer, so
+	 * the pool is registered iff this command was submitted with
+	 * IORING_URING_CMD_FIXED. The registered buffer index is taken from
+	 * sqe->buf_index.
+	 */
+	if (registered) {
+		pool->registered = true;
+		pool->registered_index = READ_ONCE(cmd->sqe->buf_index);
+	}
+
 	spin_lock(&queue->lock);
 	if (queue->payload_mode != FUSE_PAYLOAD_UNSET) {
 		spin_unlock(&queue->lock);
@@ -1508,9 +1577,10 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
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
 
-- 
2.52.0

