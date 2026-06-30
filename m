Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D013B2C15BE
	for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854219; cv=none; b=uVM09kLrTFifWrHDiHVeI/BVXGIhEFlkQoMiLGLK6g5wyugxDRpqLxWzmzhPOuUtlvNxURarNLPBzKfc1zUMgPWTHfSwtmeJqWU5RwVMb3NdBtrH7hlsrIHYrwFYHGpLd5jzLgfFXPEZwXkMbC6KOS1/slCKYRx9xf2e2AQMcTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854219; c=relaxed/simple;
	bh=fAlKxtsuMBA8D20CWULCr2b2Yny1XOz0t8Yer6pnHBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUQ40LyGPKokZnWsa6TgRQVOGwhVxmKkPUOVIfc8Or1x7Vu7uiWq5Zbemng9NA+NZshew718vhLzIwsoo/fR8paSFAZ2vyZeeBQS3e8cISqDnxKDfOHinESrrnZCDqn/ncxToGxQieStfYhCqPxwzWtNsXPsCezzhWb1ynw5lcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vct+CUaQ; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vct+CUaQ"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-69eb8b6bea8so2458867eaf.3
        for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 14:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782854217; x=1783459017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWw+qyQz9a518XY2RJUZczi5FHmCJjuenFua4U5ny3w=;
        b=Vct+CUaQ/GX87ELC7ts7Rzxv8ocvU+H/IyHuVSq1O9ZXwrs+w7/Hg+PpX+VaWk3gyk
         2/dslXCKZMhq5bS/l+xP+ZMjjjbzSUt2oXuR2BPDn1T0B5f1PxCzPmPsifD4tjv+In1H
         Hocf7pURuW7Gvj0wRhxcbOw2dRXJz7a/17dgdqA3IVMWI0n4au8vYm28PIulajBhZ9tr
         t6pntW1m2AZbVhM1m5zL48G8Se1iXVfcgafTkbb+gDXbaXhUVjlukz8QRJIYht5y8HJ1
         3tf8bbA3+8yKWiqwG0ggXrtVB7jg5ai4RWcnCewfQcK/yDx36JUnfEHgsimD3Qabzld2
         OzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854217; x=1783459017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kWw+qyQz9a518XY2RJUZczi5FHmCJjuenFua4U5ny3w=;
        b=kf87QTIWj+5Wh6Uorrfzo6I6aVCzpXbRW6ytWSPCF/wgoVDTfRzWavA/PKIMxyUSHy
         WrA5CTRr1Gcu4PuztE9A0TR9IaVlI5UutYCYA2RsKeai6t3SpvZcgB5XDMV6O5mK6jmp
         nooMyjLlW7FHQrAkdsPkekUZl01Xc964drXgWbFGvSNvejRFZPlgJixGeDxI/+9NOz63
         QjBFlrrkKT3MzQxcnTWrt8/FjwurLX1jNBT+i9XBk2Ue9CLKZEw5djJk6F/HfkpkkVZT
         Wo8aAttexPEq9nWfVPQvStjpm/gi9/HiCapmZm6ARnvc6daWyYIR8QOJtj/Ug9boAHpQ
         Eb6Q==
X-Forwarded-Encrypted: i=1; AFNElJ83gumbgynh/4Dh39RJW9c12ta5hu//L4tcL8FZTmO1KKky3RSVE5u7W8sRBssiQfvQBoPJw82dLK7s@lists.linux.dev
X-Gm-Message-State: AOJu0YxN7T7aI4INvazMDzboWYnVWvDrkfCflmGvv2VGwuzz8TwRSZrP
	F3SOw3gaiLTv1HcF5MFahm6y/83ZJb5ddWTKmeaYiKbzvvTEtbhYFXCj
X-Gm-Gg: AfdE7cnUlHbr/eoGkcR7KAEwuBiM1bLN+SFJdBkKt/TZRbSw6GK5nvPDqN4hQikDSXR
	70NADkUvadnsLG7V8QHsVSE+imMqtYESVP0QPq0CWEo+JM++DNagOJMVcr5p/lUmu4ITIP56mME
	oyOPkrEKfpMHijmKnv4lDElT+h4nmW6Bh2Xt6cd4l0Z4Xw7Rs4ztdWXK2a/cG3FfwaXeUlB+cDa
	FbfoKVR+BiIL6yQu8VgopDzamzJXPVeU4T5Fej/f3NBKnLH0mmzdwYKPhZgjD5SPm+YRYNMKMY9
	rNCZMrz71zOXOEBS8emIAZ5OcJiClkZGFF2/TNYctAMEj3E79+5kab5WvH4qBbS3+ik9yeyEwnN
	hiIxXcUYIRoJi0KXHCkU8iJnejze3gSG3w8YG0jX1q/x95hgWcqz6ln6ZXuAK2dv24m/Cc3iScI
	dHlv8kDUkjCXtuT1tW+V2aJxTBpt1oj0vvIUiwe9aPuCsDkxMnOS/vUYGRXLoTcSwB
X-Received: by 2002:a05:6820:160f:b0:6a1:50ec:3a54 with SMTP id 006d021491bc7-6a196b8b282mr1412790eaf.20.1782854216801;
        Tue, 30 Jun 2026 14:16:56 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:40::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44c62a0b686sm5637fac.13.2026.06.30.14.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:16:56 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v5 4/6] fuse: support registered buffer pools in io-uring
Date: Tue, 30 Jun 2026 14:14:33 -0700
Message-ID: <20260630211436.2062816-5-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260630211436.2062816-1-joannelkoong@gmail.com>
References: <20260630211436.2062816-1-joannelkoong@gmail.com>
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
 fs/fuse/dev_uring.c       | 120 +++++++++++++++++++++++++++++++-------
 fs/fuse/dev_uring_i.h     |   8 +++
 include/uapi/linux/fuse.h |   4 ++
 3 files changed, 110 insertions(+), 22 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 5cd628530bea..e07bb6dc53a1 100644
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
@@ -651,19 +674,42 @@ static int copy_header_from_ring(struct fuse_ring_ent *ent,
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
 
@@ -674,7 +720,8 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
 }
 
 static int fuse_uring_copy_from_ring(struct fuse_req *req,
-				     struct fuse_ring_ent *ent)
+				     struct fuse_ring_ent *ent,
+				     unsigned int issue_flags)
 {
 	struct fuse_copy_state cs;
 	struct fuse_args *args = req->args;
@@ -687,7 +734,8 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
 	if (err)
 		return err;
 
-	err = setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter);
+	err = setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter,
+				    issue_flags);
 	if (err)
 		return err;
 
@@ -700,7 +748,8 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
  * Copy data from the req to the ring buffer
  */
 static int fuse_uring_args_to_ring(struct fuse_req *req,
-				   struct fuse_ring_ent *ent)
+				   struct fuse_ring_ent *ent,
+				   unsigned int issue_flags)
 {
 	struct fuse_copy_state cs;
 	struct fuse_args *args = req->args;
@@ -713,7 +762,8 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 		.commit_id = req->in.h.unique,
 	};
 
-	err = setup_fuse_copy_state(&cs, req, ent, ITER_DEST, &iter);
+	err = setup_fuse_copy_state(&cs, req, ent, ITER_DEST, &iter,
+				    issue_flags);
 	if (err)
 		return err;
 
@@ -752,7 +802,8 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 }
 
 static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
-				   struct fuse_req *req)
+				   struct fuse_req *req,
+				   unsigned int issue_flags)
 {
 	struct fuse_ring_queue *queue = ent->queue;
 	int err;
@@ -769,7 +820,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 		return err;
 
 	/* copy the request */
-	err = fuse_uring_args_to_ring(req, ent);
+	err = fuse_uring_args_to_ring(req, ent, issue_flags);
 	if (unlikely(err)) {
 		pr_info_ratelimited("Copy to ring failed: %d\n", err);
 		return err;
@@ -866,11 +917,12 @@ static int fuse_uring_prep_buffer(struct fuse_ring_ent *ent,
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
@@ -981,7 +1033,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 		goto out;
 	}
 
-	err = fuse_uring_copy_from_ring(req, ent);
+	err = fuse_uring_copy_from_ring(req, ent, issue_flags);
 out:
 	fuse_uring_req_end(ent, req, err);
 }
@@ -993,7 +1045,8 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
  * Else, there is no next fuse request and this returns false.
  */
 static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
-					 struct fuse_ring_queue *queue)
+					 struct fuse_ring_queue *queue,
+					 unsigned int issue_flags)
 {
 	int err;
 	struct fuse_req *req;
@@ -1005,7 +1058,7 @@ static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
 	spin_unlock(&queue->lock);
 
 	if (req) {
-		err = fuse_uring_prepare_send(ent, req);
+		err = fuse_uring_prepare_send(ent, req, issue_flags);
 		if (err)
 			goto retry;
 	}
@@ -1073,6 +1126,9 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	if (!READ_ONCE(fch->connected))
 		return err;
 
+	if (!fuse_uring_cmd_index_ok(cmd, queue))
+		return -EINVAL;
+
 	spin_lock(&queue->lock);
 	if (unlikely(queue->stopped)) {
 		spin_unlock(&queue->lock);
@@ -1124,7 +1180,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	 * available and the cmd only returns to userspace when there's a
 	 * next request and an available buffer.
 	 */
-	if (fuse_uring_get_next_fuse_req(ent, queue))
+	if (fuse_uring_get_next_fuse_req(ent, queue, issue_flags))
 		fuse_uring_send(ent, cmd, 0, issue_flags);
 	return 0;
 }
@@ -1250,7 +1306,8 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 
 	spin_lock(&queue->lock);
 	if (bufpool_enabled(queue)) {
-		if (payload->iov_base || payload->iov_len) {
+		if (payload->iov_base || payload->iov_len ||
+		    !fuse_uring_cmd_index_ok(cmd, queue)) {
 			spin_unlock(&queue->lock);
 			return ERR_PTR(err);
 		}
@@ -1360,8 +1417,21 @@ static int fuse_uring_add_bufpool(struct io_uring_cmd *cmd,
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
 
 	queue = ring->queues[qid];
@@ -1389,6 +1459,11 @@ static int fuse_uring_add_bufpool(struct io_uring_cmd *cmd,
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
@@ -1499,9 +1574,10 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
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

