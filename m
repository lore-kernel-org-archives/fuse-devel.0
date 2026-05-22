Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC40538330E
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 20:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779483572; cv=none; b=kHCEpFuC5FYpLdatsK9ZPpvD/AwcN+vGiE4yBjGUdYMo+qeWJ3Wg4Z49MeXj066i+QS+DYEsu986gU9I5DuViCq6GCYmjNZpQD6VYIDcnTVCIN85gv5xd6Zy5DEjHdclOSGLL/0wbSKko45q/pEMcncN07rzD84YMJMjPoPnxn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779483572; c=relaxed/simple;
	bh=ldWz+bnoYmpCnWnZ+eDWk1gkHlDU6PGGPX1Pt/EGaAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXAQtbiCeNuOxsiT+/Z7RXe3KpQRNNT5hhq82df3nc9nzxHHrW/ikWWL4x0RqlcSrl26DyK2N1qB5i09O7U+PZWUmsmAhivGtLgOZe8UHDvDgFmAK/Vfc2RxQnzFpKm5elwZ6Yurt6x5iPOE6cbhCawhMa4h14QWSY11EyXcchc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pXbSJXeV; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pXbSJXeV"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7bd4c61765dso76510307b3.3
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 13:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779483570; x=1780088370; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/kYyrsw6guG7/izKM4sfnc++htXynO2nRoK06fpzTw=;
        b=pXbSJXeVGU40jvUFuOHfSg4D3TjSBsbHE0VlxgXZv6NeV1FYEu6W8MtxCUJGHl9fUV
         B+n7Ns5MyLw+H8evXjrBNNdy30Nv2ZRdmAKrvTKtu8RRoHrh8kts4qLPlp/nPJTgDF6L
         6x4nCZtyu6pAsZrNOChJ6M8CWqZ1VCG/CnqDnoc0gV5Di6ZcqC61MqLn2/pd+UUGMrAj
         AKHQCs3WEtrlW8M1aR2yJOl34VcFdsbUGSoB+uu8deuH3Yy3OtS4k0JM2S5OiA92P2Oc
         +pcyBAoj3x7vpvKjmg3VrO4QSZas7Sa35w/0q8KDnEbckIi11aeEZpbTP5jYBqdT4c2N
         RrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779483570; x=1780088370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/kYyrsw6guG7/izKM4sfnc++htXynO2nRoK06fpzTw=;
        b=QKwUXj/hhhtdVrrR00PL8RbapXbtBLNSmCJYl9CxFhIA9BnP/160zQlSpe2EmNUqZl
         76DJUYGcDw15qksrr39SP8EmFbUsfaeOW2ztr+ANG/ek7O/AeNRr747P0j3wYynQaSR8
         rZE8fAc5qdUjMDn41WIpDnb7z7oCOMkakTxsxtbQNjVUjN2h6xTcJ4/Yn0fQEoLl/B/7
         xrym1//xJQ/7/3Gd56C2O7mQZl4NMNi8C03efIwgjn8mWEVGjTq+CP/hx3nF19JzykLA
         GPkrOM2EQlXB958erOYHg2IEJRBNbUU40lllTlni2jTH0gE235bDOsOfUMFotuogyVmX
         ucfw==
X-Forwarded-Encrypted: i=1; AFNElJ8jt0stgsj8umFedrs6xZdvuUFEd+lTr8UiCzgBjd9lKoDXGuDe1gCi9GLBC7T9EHWSd9DbidG3nT43@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1TlnRBFlCR7RwBDJ7s7+9UM4QcvEesubVVYLBG63U3v1SfH65
	QCxva8nlal2NNgU/kdREM0J+b8nRgfcHeepGvJo3xW8OJ+SzjWeshZnI
X-Gm-Gg: Acq92OFQs7MJC973uRgiztfcFTiltwdmGobB4T3kTlR7haslj+GwhAzhrPkILUpwErx
	HTu2CDF9oeB+0oPSSofHoU+a2XN2k+ojFBUvNCorwENFt24OEeTgFhKJLxeTQxrI3D8GQ8RqoNM
	fCRlDYLM8uN2yKCa3RuOGgqr2QywJmQCyOMkvnNrkpUlqgm8DYgdHJAszBvh5vy+RC6wgYyvhsy
	0wAnNr/vLPGJL02JNh7Q5fqw0Jwg7J1uq5eE4GyHyReLx8RIDzPpezYwjRDOJz2zk+jkHTzvM2p
	7dZQ3L4vvVfVnE6FSXh6+FY6Hr9GF3kyOiLYk+F8/L2QvFSxyKEy+rTMchKjAKaLJYnYM9FRY/v
	ZuwIDohtWBz6RkuCK72HbuWKiL6Yd+N/zuVg3lNI1aS8o6dhHS7a9qwP3NcHr6VWIeG+0Cdk4ti
	NHC0f6PabumRYlQrunerI8hThcMK8=
X-Received: by 2002:a05:690c:888:b0:7b4:1ffe:f9f9 with SMTP id 00721157ae682-7d3342da180mr62318427b3.16.1779483569972;
        Fri, 22 May 2026 13:59:29 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:9::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38c33c8c5sm13022697b3.38.2026.05.22.13.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:59:29 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	jlayton@kernel.org,
	axboe@kernel.dk,
	fuse-devel@lists.linux.dev
Subject: [PATCH v3 08/10] fuse: support registered buffers as buffer pools in io-uring
Date: Fri, 22 May 2026 13:58:21 -0700
Message-ID: <20260522205823.1597313-9-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260522205823.1597313-1-joannelkoong@gmail.com>
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
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
index where the registered buffers reside to sqe->buf_index).

In benchmarks using passthrough_hp on a high-performance NVMe-backed
system, using registered buffers showed around a 10% throughput
improvement for direct randreads (~2150 MiB/s to ~2400 MiB/s), a 4%
improvement for direct sequential reads (~2510 MiB/s to ~2620 MiB/s),
a 8% improvement for buffered randreads (~2100 MiB/s to ~2280 MiB/s),
and a 6% improvement for buffered sequential reads (~2500 MiB/s to
~2670 MiB/s).

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c       | 97 ++++++++++++++++++++++++++-------------
 fs/fuse/dev_uring_i.h     |  2 +
 include/uapi/linux/fuse.h |  2 +
 3 files changed, 70 insertions(+), 31 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 5947b834121e..2443abf21a7b 100644
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
@@ -310,7 +315,8 @@ static int fuse_uring_get_iovec_from_sqe(const struct io_uring_sqe *sqe,
 }
 
 static int fuse_uring_bufpool_setup(struct io_uring_cmd *cmd,
-				    struct fuse_ring_queue *queue)
+				    struct fuse_ring_queue *queue,
+				    u64 init_flags)
 {
 	const struct fuse_uring_cmd_req *cmd_req =
 		io_uring_sqe128_cmd(cmd->sqe, struct fuse_uring_cmd_req);
@@ -353,6 +359,7 @@ static int fuse_uring_bufpool_setup(struct io_uring_cmd *cmd,
 
 	pool->nbufs = nr_bufs;
 	pool->tail = nr_bufs;
+	pool->registered_buffers = init_flags & FUSE_URING_REGISTERED_BUFFERS;
 
 	queue->bufpool = pool;
 
@@ -369,8 +376,10 @@ static bool queue_init_flags_consistent(struct fuse_ring_queue *queue,
 					u64 init_flags)
 {
 	bool bufpool = init_flags & FUSE_URING_BUFPOOL;
+	bool registered_buffers = init_flags & FUSE_URING_REGISTERED_BUFFERS;
 
-	return bufpool_enabled(queue) == bufpool;
+	return bufpool_enabled(queue) == bufpool &&
+		bufpool_registered_buffers(queue) == registered_buffers;
 }
 
 static struct fuse_ring_queue *
@@ -408,7 +417,7 @@ fuse_uring_create_queue(struct io_uring_cmd *cmd, struct fuse_ring *ring,
 	queue->fpq.processing = pq;
 
 	if (use_bufpool) {
-		err = fuse_uring_bufpool_setup(cmd, queue);
+		err = fuse_uring_bufpool_setup(cmd, queue, init_flags);
 		if (err) {
 			kfree(pq);
 			kfree(queue);
@@ -752,28 +761,41 @@ static int copy_header_from_ring(struct fuse_ring_ent *ent,
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
@@ -786,7 +808,8 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
 
 static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 				     struct fuse_req *req,
-				     struct fuse_ring_ent *ent)
+				     struct fuse_ring_ent *ent,
+				     unsigned int issue_flags)
 {
 	struct fuse_copy_state cs;
 	struct fuse_args *args = req->args;
@@ -799,7 +822,8 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 	if (err)
 		return err;
 
-	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE, &iter);
+	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE, &iter,
+				    issue_flags);
 	if (err)
 		return err;
 
@@ -812,7 +836,8 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
  * Copy data from the req to the ring buffer
  */
 static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
-				   struct fuse_ring_ent *ent)
+				   struct fuse_ring_ent *ent,
+				   unsigned int issue_flags)
 {
 	struct fuse_copy_state cs;
 	struct fuse_args *args = req->args;
@@ -828,7 +853,8 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 	if (bufpool_enabled(ent->queue))
 		ent_in_out.buf_id = ent->payload_buf.id;
 
-	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_DEST, &iter);
+	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_DEST, &iter,
+				    issue_flags);
 	if (err)
 		return err;
 
@@ -863,7 +889,8 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 }
 
 static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
-				   struct fuse_req *req)
+				   struct fuse_req *req,
+				   unsigned int issue_flags)
 {
 	struct fuse_ring_queue *queue = ent->queue;
 	struct fuse_ring *ring = queue->ring;
@@ -881,7 +908,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 		return err;
 
 	/* copy the request */
-	err = fuse_uring_args_to_ring(ring, req, ent);
+	err = fuse_uring_args_to_ring(ring, req, ent, issue_flags);
 	if (unlikely(err)) {
 		pr_info_ratelimited("Copy to ring failed: %d\n", err);
 		return err;
@@ -979,11 +1006,12 @@ static int fuse_uring_prep_buffer(struct fuse_ring_ent *ent,
 }
 
 static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
-				   struct fuse_req *req)
+				   struct fuse_req *req,
+				   unsigned int issue_flags)
 {
 	int err;
 
-	err = fuse_uring_copy_to_ring(ent, req);
+	err = fuse_uring_copy_to_ring(ent, req, issue_flags);
 	if (!err)
 		set_bit(FR_SENT, &req->flags);
 	else
@@ -1092,7 +1120,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 		goto out;
 	}
 
-	err = fuse_uring_copy_from_ring(ring, req, ent);
+	err = fuse_uring_copy_from_ring(ring, req, ent, issue_flags);
 out:
 	fuse_uring_req_end(ent, req, err);
 }
@@ -1104,7 +1132,8 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
  * Else, there is no next fuse request and this returns false.
  */
 static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
-					 struct fuse_ring_queue *queue)
+					 struct fuse_ring_queue *queue,
+					 unsigned int issue_flags)
 {
 	int err;
 	struct fuse_req *req;
@@ -1116,7 +1145,7 @@ static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
 	spin_unlock(&queue->lock);
 
 	if (req) {
-		err = fuse_uring_prepare_send(ent, req);
+		err = fuse_uring_prepare_send(ent, req, issue_flags);
 		if (err)
 			goto retry;
 	}
@@ -1231,7 +1260,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	 * no-op and the next request will be serviced when a buffer becomes
 	 * available.
 	 */
-	if (fuse_uring_get_next_fuse_req(ent, queue))
+	if (fuse_uring_get_next_fuse_req(ent, queue, issue_flags))
 		fuse_uring_send(ent, cmd, 0, issue_flags);
 	return 0;
 }
@@ -1343,7 +1372,12 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 
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
@@ -1487,9 +1521,10 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
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
index 46ef3b5403fd..f4c48ff64840 100644
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
index 5fb4a7a3772c..4347586a02b4 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -245,6 +245,7 @@
  *  - add FUSE_URING_BUFPOOL flag
  *  - add fuse_uring_cmd_req init struct
  *  - add buf_id field to fuse_uring_ent_in_out struct
+ *  - add FUSE_URING_REGISTERED_BUFFERS flag
  */
 
 #ifndef _LINUX_FUSE_H
@@ -1307,6 +1308,7 @@ enum fuse_uring_cmd {
 
 /* fuse_uring_cmd_req flags */
 #define FUSE_URING_BUFPOOL		(1 << 0)
+#define FUSE_URING_REGISTERED_BUFFERS	(1 << 1)
 
 /**
  * In the 80B command area of the SQE.
-- 
2.52.0

