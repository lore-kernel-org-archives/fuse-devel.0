Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700EC3793D0
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 21:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298427; cv=none; b=MYhPJQfDptFO67rAUQwYYp2QBJkoXNO5dbGe/Xw6UhANdnbz5CMxoJXVDC6hbdW6Vx7UkQPQAUERmiAnr8bfiDiKKL6VL6xuTLRtGiYqEW80aSDs0lW3L+dhBwZd3zo2t13HEuzpp1NHIvX+ADrl/8fVoOgobVVtNQKd2bUiGT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298427; c=relaxed/simple;
	bh=MmckQ5E7lHJ0nNsLcOywGfk8khoggHmEMNz/RPeiOQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2SLygYkx+YrPrW/Vnuuq0J4f36ii67zW0N/sKCnNESTNhAWAnBlS2xDHeKZNTnRSvY0NCOgs41AjLFYw1DezEucssHIQdKU4XCBA8VMfenoA3htnJN34nskdIL6HIKGTSDF3MAMPkVfV4Fb4/DP0GtdsUnqTtDASUnAH0YOCQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iy9Eh6FS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy9Eh6FS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c3543590so10210585ad.2
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 14:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781298424; x=1781903224; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUuTjYk5J7NdcGs6nt1yb9mCuEJMZG1dQbcLCNfz4HQ=;
        b=iy9Eh6FSVaoMgi9mN0pcheiDIEtHYbaq7THC7Y+xKZRJs5nUkH9+Z9pcLVk5EJanYL
         zEA30gQ2TMkTQPgcL2AJER1RDndklNBS7sNZXpnDRXwpCo6D8Gj4W7MPMFPP1vSoc9f2
         m25VAwS0m+NWbd23JsirY512wCw/fZMZ6O90kiuz/ldGCq0C72HDU2wqHy14oHKF7jrf
         XwcswVdsYS5uYVDLyOy08E1lmZvZqMfD/+wzbPHu5mHqRQpp5lGxVZHa5hHby0+UpY3i
         mJ7l5ZQSVpWiDD9bWbyrUmr5KanLMZX7vDb/EFgcllxZQ7AeL9hIlnz4qLdze/bINMma
         omKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781298424; x=1781903224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HUuTjYk5J7NdcGs6nt1yb9mCuEJMZG1dQbcLCNfz4HQ=;
        b=tRAyWoKxkJDpTXauJkpLLxBpfuf1AX4BVdgyB8rMCPxB/2g52TmXShUEoqrzJGJrCa
         oPIj4YtNMNILg3V8Q1kTyaF9HyKIk1/9Hre/jV+9D6ULhL47r7VjDGHB+58NIFPONJxj
         kWpWKBF5gBuXdHgT5sopl14XzEBRa4iIMG/ZLfbK8do39j4fIvko30sqXLCEvaJLPGWL
         Rp7dDhmuJJz7Jq71JkqFHX/PxJ4VTYzNUx3HRuuvjY6oboXOqsII3O5XGAxg1T97jnQK
         VCCjaCwg8gfZ4jok9HJ54K/k8Wotti0rKBbG3Wr7IfKVVtnph6mbxag+7W+mk+tTiXgc
         IzpQ==
X-Gm-Message-State: AOJu0YwTkAeeZDyu0xYk/HHk13kstRHPpZsSUOLwriY1zCwWQhJWyuiI
	CwX6DDOWMh2RTkTsz0JZ8YXJPjiS3j2ah2kkz1F4v0s4IXnGe7VmsqUo
X-Gm-Gg: Acq92OFIsnFhgGWwt0rnx/1hfgtYPGotny79vK7kuFEX/U1LkbcD3JkOxepyl+KWcbh
	sKCM/prDEIvvJXyktlg4Zjm218MM6M1roBLAFBdgnPdwAHH9t+H7nfIwC+57r0vYyAbdIfj66+L
	+BhztSmw+ZQzOBA2ON9GE/RQi4afuO/f0XIWVDRzfHnoulFHXhgq7hBTLDGQTgh9iGLmL6OLYBo
	meKSpDsVSBKaKx1VtNTQiqToVBzAxobABhXzzz5T2n+lngr622UWA6NEKb3H3MMoCA9Iijr8hEM
	bdA9qoiyZ9GsznSV/LMe8PW/wRJmvKDTQyJSz3fey9/guPLd7e3n8t1M6wWCGhVzY0sFhQQULe5
	U4h11P5t9SUSo6CFSv0XNI4maMI2xk+E/9eI8TI+OmB70JhLWP60GEs/zPgTwuTY3EBfY6fqpL4
	DC3P+ney4+HTNwD/QcJd+Fp60jimYp1ywOHLOWckrwz/IaRKm9UBwkwh2Tl8LAIv2GI4yaBgoM5
	YQ=
X-Received: by 2002:a17:902:e80a:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c413eb775cmr51738655ad.34.1781298423636;
        Fri, 12 Jun 2026 14:07:03 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:58::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5644sm30685525ad.4.2026.06.12.14.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 14:07:02 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	axboe@kernel.dk,
	jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	bernd@bsbernd.com
Subject: [PATCH v4 08/10] fuse: support registered buffers as buffer pools in io-uring
Date: Fri, 12 Jun 2026 14:05:11 -0700
Message-ID: <20260612210513.1516038-9-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260612210513.1516038-1-joannelkoong@gmail.com>
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow servers to use an io-uring registered buffer as the buffer pool.
When the server registers buffers with io-uring, the pages backing the
buffers are pinned upfront. This eliminates the overhead of
pinning/unpinning user pages and translating virtual addresses per i/o
request. This also allows servers to use the same registered buffers for
subsequent backing store I/O (eg read_fixed/write_fixed), keeping data
in the same pinned pages without additional pinning or mapping overhead
required.

Registered buffers require the buffer pool (FUSE_URING_BUFPOOL) to be
enabled. To use registered buffers, the server needs to register the
payload buffers through io-uring and during registration, set the
FUSE_URING_REGISTERED_BUFFERS init flag (alongside the
FUSE_URING_BUFPOOL flag) in the registration sqe. For all sqes the
server passes in (including the registration ones), it needs to follow
standard protocol for using registered buffers (eg set
sqe->uring_cmd_flags to include IORING_URING_CMD_FIXED, and pass in the
index where the registered buffers reside to sqe->buf_index). Kernel
support for registered buffers is advertised to userspace via the
FUSE_HAS_IO_URING_BUFPOOL init flag (a single umbrella flag).

In benchmarks using passthrough_hp on a high-performance NVMe-backed
system, using registered buffers showed around a 10% throughput
improvement for direct randreads (~2150 MiB/s to ~2400 MiB/s), a 4%
improvement for direct sequential reads (~2510 MiB/s to ~2620 MiB/s),
a 8% improvement for buffered randreads (~2100 MiB/s to ~2280 MiB/s),
and a 6% improvement for buffered sequential reads (~2500 MiB/s to
~2670 MiB/s).

Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c       | 97 ++++++++++++++++++++++++++-------------
 fs/fuse/dev_uring_i.h     |  2 +
 include/uapi/linux/fuse.h |  5 +-
 3 files changed, 72 insertions(+), 32 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 1c405ecb110a..9c79ec85e685 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -46,6 +46,11 @@ static inline bool bufpool_enabled(struct fuse_ring_queue *queue)
 	return queue->bufpool != NULL;
 }
 
+static inline bool bufpool_registered_buffers(struct fuse_ring_queue *queue)
+{
+	return queue->bufpool && queue->bufpool->registered_buffers;
+}
+
 static void uring_cmd_set_ring_ent(struct io_uring_cmd *cmd,
 				   struct fuse_ring_ent *ring_ent)
 {
@@ -314,7 +319,8 @@ static int fuse_uring_get_iovec_from_sqe(const struct io_uring_sqe *sqe,
 }
 
 static int fuse_uring_bufpool_setup(struct io_uring_cmd *cmd,
-				    struct fuse_ring_queue *queue)
+				    struct fuse_ring_queue *queue,
+				    u64 init_flags)
 {
 	const struct fuse_uring_cmd_req *cmd_req =
 		io_uring_sqe128_cmd(cmd->sqe, struct fuse_uring_cmd_req);
@@ -357,6 +363,7 @@ static int fuse_uring_bufpool_setup(struct io_uring_cmd *cmd,
 
 	pool->nbufs = nr_bufs;
 	pool->tail = nr_bufs;
+	pool->registered_buffers = init_flags & FUSE_URING_REGISTERED_BUFFERS;
 
 	queue->bufpool = pool;
 
@@ -373,8 +380,10 @@ static bool queue_init_flags_consistent(struct fuse_ring_queue *queue,
 					u64 init_flags)
 {
 	bool bufpool = init_flags & FUSE_URING_BUFPOOL;
+	bool registered_buffers = init_flags & FUSE_URING_REGISTERED_BUFFERS;
 
-	return bufpool_enabled(queue) == bufpool;
+	return bufpool_enabled(queue) == bufpool &&
+		bufpool_registered_buffers(queue) == registered_buffers;
 }
 
 static struct fuse_ring_queue *
@@ -412,7 +421,7 @@ fuse_uring_create_queue(struct io_uring_cmd *cmd, struct fuse_ring *ring,
 	queue->fpq.processing = pq;
 
 	if (use_bufpool) {
-		err = fuse_uring_bufpool_setup(cmd, queue);
+		err = fuse_uring_bufpool_setup(cmd, queue, init_flags);
 		if (err) {
 			kfree(pq);
 			kfree(queue);
@@ -760,28 +769,41 @@ static int copy_header_from_ring(struct fuse_ring_ent *ent,
 static int setup_fuse_copy_state(struct fuse_copy_state *cs,
 				 struct fuse_ring *ring, struct fuse_req *req,
 				 struct fuse_ring_ent *ent, int dir,
-				 struct iov_iter *iter)
+				 struct iov_iter *iter,
+				 unsigned int issue_flags)
 {
+	bool bufpool = bufpool_enabled(ent->queue);
+	bool registered_buffers = bufpool_registered_buffers(ent->queue);
 	void __user *payload;
 	size_t len;
-	int err;
+	int err = 0;
 
 	memset(iter, 0, sizeof(*iter));
 
-	if (bufpool_enabled(ent->queue)) {
-		payload = (void __user *)ent->payload_buf.addr;
-		len = ent->payload_buf.len;
+	if (registered_buffers) {
+		if (ent->payload_buf.addr)
+			err = io_uring_cmd_import_fixed(ent->payload_buf.addr,
+							ent->payload_buf.len,
+							dir, iter, ent->cmd,
+							issue_flags);
 	} else {
-		payload = ent->payload;
-		len = ring->max_payload_sz;
+		if (bufpool) {
+			payload = (void __user *)ent->payload_buf.addr;
+			len = ent->payload_buf.len;
+		} else {
+			payload = ent->payload;
+			len = ring->max_payload_sz;
+		}
+
+		if (payload)
+			err = import_ubuf(dir, payload, len, iter);
 	}
 
-	if (payload) {
-		err = import_ubuf(dir, payload, len, iter);
-		if (err) {
-			pr_info_ratelimited("fuse: Import of user buffer failed\n");
-			return err;
-		}
+	if (err) {
+		pr_info_ratelimited("fuse: Importing iter failed, bufpool=%d, "
+				    "registered_buffers=%d\n", bufpool,
+				    registered_buffers);
+		return err;
 	}
 
 	fuse_copy_init(cs, dir == ITER_DEST, iter);
@@ -794,7 +816,8 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
 
 static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 				     struct fuse_req *req,
-				     struct fuse_ring_ent *ent)
+				     struct fuse_ring_ent *ent,
+				     unsigned int issue_flags)
 {
 	struct fuse_copy_state cs;
 	struct fuse_args *args = req->args;
@@ -807,7 +830,8 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 	if (err)
 		return err;
 
-	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE, &iter);
+	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE, &iter,
+				    issue_flags);
 	if (err)
 		return err;
 
@@ -820,7 +844,8 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
  * Copy data from the req to the ring buffer
  */
 static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
-				   struct fuse_ring_ent *ent)
+				   struct fuse_ring_ent *ent,
+				   unsigned int issue_flags)
 {
 	struct fuse_copy_state cs;
 	struct fuse_args *args = req->args;
@@ -836,7 +861,8 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 	if (bufpool_enabled(ent->queue))
 		ent_in_out.buf_id = ent->payload_buf.id;
 
-	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_DEST, &iter);
+	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_DEST, &iter,
+				    issue_flags);
 	if (err)
 		return err;
 
@@ -871,7 +897,8 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 }
 
 static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
-				   struct fuse_req *req)
+				   struct fuse_req *req,
+				   unsigned int issue_flags)
 {
 	struct fuse_ring_queue *queue = ent->queue;
 	struct fuse_ring *ring = queue->ring;
@@ -889,7 +916,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 		return err;
 
 	/* copy the request */
-	err = fuse_uring_args_to_ring(ring, req, ent);
+	err = fuse_uring_args_to_ring(ring, req, ent, issue_flags);
 	if (unlikely(err)) {
 		pr_info_ratelimited("Copy to ring failed: %d\n", err);
 		return err;
@@ -987,11 +1014,12 @@ static int fuse_uring_prep_buffer(struct fuse_ring_ent *ent,
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
@@ -1111,7 +1139,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 		goto out;
 	}
 
-	err = fuse_uring_copy_from_ring(ring, req, ent);
+	err = fuse_uring_copy_from_ring(ring, req, ent, issue_flags);
 out:
 	fuse_uring_req_end(ent, req, err);
 }
@@ -1123,7 +1151,8 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
  * Else, there is no next fuse request and this returns false.
  */
 static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
-					 struct fuse_ring_queue *queue)
+					 struct fuse_ring_queue *queue,
+					 unsigned int issue_flags)
 {
 	int err;
 	struct fuse_req *req;
@@ -1135,7 +1164,7 @@ static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
 	spin_unlock(&queue->lock);
 
 	if (req) {
-		err = fuse_uring_prepare_send(ent, req);
+		err = fuse_uring_prepare_send(ent, req, issue_flags);
 		if (err)
 			goto retry;
 	}
@@ -1256,7 +1285,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	 * no-op and the next request will be serviced when a buffer becomes
 	 * available.
 	 */
-	if (fuse_uring_get_next_fuse_req(ent, queue))
+	if (fuse_uring_get_next_fuse_req(ent, queue, issue_flags))
 		fuse_uring_send(ent, cmd, 0, issue_flags);
 	return 0;
 }
@@ -1380,7 +1409,12 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 
 static bool init_flags_valid(u64 init_flags)
 {
-	u64 valid_flags = FUSE_URING_BUFPOOL;
+	u64 valid_flags = FUSE_URING_BUFPOOL | FUSE_URING_REGISTERED_BUFFERS;
+	bool bufpool = init_flags & FUSE_URING_BUFPOOL;
+	bool registered_buffers = init_flags & FUSE_URING_REGISTERED_BUFFERS;
+
+	if (registered_buffers && !bufpool)
+		return false;
 
 	return !(init_flags & ~valid_flags);
 }
@@ -1522,9 +1556,10 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
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
index 27a9d5742d8e..f005dfa5f9df 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -44,6 +44,8 @@ struct fuse_bufpool_buf {
 
 /* implemented as a buffer ring */
 struct fuse_bufpool {
+	bool registered_buffers;
+
 	/* metadata tracking state of the bufpool */
 	unsigned int nbufs;
 	unsigned int head;
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 5d377d8e8e27..e4740a64d4a1 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -245,6 +245,7 @@
  *  - add FUSE_HAS_IO_URING_BUFPOOL / FUSE_URING_BUFPOOL flags
  *  - add fuse_uring_cmd_req init struct
  *  - add buf_id field to fuse_uring_ent_in_out struct
+ *  - add FUSE_URING_REGISTERED_BUFFERS flag
  */
 
 #ifndef _LINUX_FUSE_H
@@ -453,7 +454,8 @@ struct fuse_file_lock {
  * FUSE_OVER_IO_URING: Indicate that client supports io-uring
  * FUSE_REQUEST_TIMEOUT: kernel supports timing out requests.
  *			 init_out.request_timeout contains the timeout (in secs)
- * FUSE_HAS_IO_URING_BUFPOOL: kernel supports io-uring buffer pools
+ * FUSE_HAS_IO_URING_BUFPOOL: kernel supports io-uring buffer pools and
+ *			      registered buffers
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -1309,6 +1311,7 @@ enum fuse_uring_cmd {
 
 /* fuse_uring_cmd_req flags */
 #define FUSE_URING_BUFPOOL		(1 << 0)
+#define FUSE_URING_REGISTERED_BUFFERS	(1 << 1)
 
 /**
  * In the 80B command area of the SQE.
-- 
2.52.0

