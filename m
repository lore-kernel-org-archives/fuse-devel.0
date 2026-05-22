Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6D4382385
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 20:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779483570; cv=none; b=trfTCnQ5zLL1zswMw7WhsVqvGW8d6IwqHkO1OR1zK9+yuTgtd8w+K991+nKz7asbsyf6J7ygWJwEborPcfCMtks6boxIOQCnn5iSfk4BMMRjMWTEeOkK3A1WQLFj4dFgZ5qIFsDOZogXgpLObbiSTbkb/PfXBLmmHDg+w6svexo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779483570; c=relaxed/simple;
	bh=uhYwsDsov3iYELJ2Yehzz+Il6HUzxrSy3x4y6uFubG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GyU0JQYFrvloRNgYUrFROMv9AhggX7EW/emx+pAYyp9P1o/UD3FLjuzrhzMuXEpO+jYaQMTTCoOVFNs1iK+r3GIq/SBdFABHcWWEbydl9rBCWQzcBaC9cN3mVlrtwCq9TsBhF0tyRuwEr2f7bbJd76MVsJsKCZlP8zqETv7UXvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHA/r2W3; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHA/r2W3"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7cff695e6b1so47516917b3.0
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 13:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779483567; x=1780088367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s45jIQpxuV2e8btYIZVhFQRfqRcu/tXTb9RU3apchIo=;
        b=aHA/r2W3IREv6rSJtTunfUCQxHeyXkeJKkLApAotOKeq9aORvyZWjY1NBcHW6ysLMG
         88B7xG9CU7EAqLDu71kZRjuBYzXnUHA+K/IYmmXJCqtYfjH9EMOVdzVeSNpi2YkTzulp
         ekvKhloFrRr01YpwdhTPDV3NPU3tl9jXomK6hhUjUa8V8MMEFu868MqEMAPQOZoqmKDP
         MVjHOZ6bAkAabLgUwkM8pVhqcRRup4Cs1Rw8nrY+EiNGoSaLo/LARBuhrZNe46qD16zg
         OYyexCjf1w62Zs7OtgN4r664I3jFHa03RwDBueKnfftFEvYrxh3D5fOiuS2w8Szr6cLq
         iIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779483567; x=1780088367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s45jIQpxuV2e8btYIZVhFQRfqRcu/tXTb9RU3apchIo=;
        b=qSY/wbgG3t4+QBFoZUHDixQ44sckIII0sLq/cmxBrOIXieGnsVBnjg0USoSFqgVpvI
         ymHIryHYd7Zts4gBgIRnJSipyoB5YOTvBbcPg9IW8tiTl6LYVhPwf9fw6/u3W6nXclJC
         sRzCEfIxrGZf2Rpyrfc542v2fx63/1EAMSUBDc/1eA/OdSDxIKermlfsBkjsrvxzNKWA
         C0ZsqgngdMMbGTQa9QuRu7NoeiEG0gYx/AOn22CHXK79CjwdwI0sDD2ajgyhZxAHL11d
         nC7xHzntnPaZYCGQvIWSfq1vq/CcpVB72NF2tk2aEtYy8tFLP/cmUFJgtcJIkWOXfgJU
         eoEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YTigi3KxM9RjfxCk/yPVIDVr8ky7f7UIqT3Mh0DqSfwa9iUyxJdQTS3ERsBlvap3AAyvUu4rtIHhz@lists.linux.dev
X-Gm-Message-State: AOJu0YysrG96F62vFLnUhTahsYDBqBacIb8wRwD159N0fIq6AjVFsE6Z
	5iIgVj9OOnRg9BweA3vb4B8rI/FjhavwSRxU7VQpyQajMwb9YVzlXCm3
X-Gm-Gg: Acq92OFAT2R78NeY51dtNjGJkd7NarCNpbHw8SP/kuk+xz6klUdFJEH4i8Z3IJe7fZd
	vhRGFl2qSlAfZFFylH1rziIjhKc0vMmFpcK2Cw3Jo9xt5CBYbTabgKsOxY1K/td93tVcnL8cJgN
	kE392xkAvtFs4wIpKnI4aLtjsNsk1gNZGbT+aj6sx25K7ZyhnGOuVaXx48vc+zuZDtHyodW2UM7
	aN4qOVijiU+H6tW6JEn3BgeUE0YQcPOSHjFNPmAE5m7OSO2wAFiwBxWR+piFlW7X4yXPLtUtpMp
	G9ziYYMiXOjfbC81bHFlL+FtqM370FRFKjJRLCdtwaa+jRPNVN8Kh86pqA/xmYrre1rFDQ1jVE4
	0bmBEYwfQZTLGsCOiIyk6ch3YHkg1zz0owcPz1Gbfw0jbZa/m7cH0BGLmggGoMOJiSbuXTXtybh
	8Cw/+W/HXWY7SdMHNAjA==
X-Received: by 2002:a05:690c:4c13:b0:7bd:9899:f912 with SMTP id 00721157ae682-7d339f5cd69mr66993177b3.29.1779483567028;
        Fri, 22 May 2026 13:59:27 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5e::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38be31027sm13380937b3.28.2026.05.22.13.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:59:26 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	jlayton@kernel.org,
	axboe@kernel.dk,
	fuse-devel@lists.linux.dev
Subject: [PATCH v3 07/10] fuse: add io-uring buffer pools (implemented as buffer ring)
Date: Fri, 22 May 2026 13:58:20 -0700
Message-ID: <20260522205823.1597313-8-joannelkoong@gmail.com>
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

Right now, ents and buffers are tightly coupled in fuse io-uring where
each entry has its own dedicated payload buffer, requiring N buffers for
N entries where each buffer must be large enough to accomodate the
maximum payload size. This is suboptimal as most request types (lookup,
open, release, getattr, etc) require vastly less bytes than the maximum
payload size and some requests (unlink, rmdir, fsync, flush, etc) do not
require payload buffers at all.

Instead of requiring a 1:1 coupling between ents and payload buffers,
allow the server to pass in a buffer pool (a contiguous allocation of
buffers) that the kernel will use as it wishes for servicing
ents/requests. Buffers are now pooled and selected on demand. Entries
only "reserve" a buffer while actively processing a request that
requires a payload buffer. This decoupling reduces the memory usage
requirements needed to use fuse-io-uring. It allows for future
optimizations such as incremental buffer consumption which will allow
non-overlapping regions of a single buffer to be used simultaneously
across multiple ents/requests, and the possibility of multiple buffer
sizes to be supported per ring in the future.

To use this, the server must set the FUSE_URING_BUFPOOL flag during
registration and provide the payload buffer pool through the iovec
payload in the first sqe. The server must set init.buf_size and
init.nr_bufs in the struct fuse_uring_cmd_req it passes to the kernel to
describe the buffer pool configuration. Buffer pool usage is set on a
per-ring basis. All subsequent registration SQEs for the same ring must
pass in consistent flags.

Internally, a buffer ring data structure is used for managing the buffer
pool. The kernel manages buffer selection and recycling through this
ring structure. A payload buffer is selected from the ring on demand if
the request requires a payload buffer and recycled after the request
completes if used.

The contiguous buffer pool passed in is partitioned into individual
buffers according to the buf_size passed in at registration time.

  PAYLOAD BUFFER POOL (contiguous, provided via iov[1] in first sqe):
    |<-------------- payload_size ------------>|
    +--------- --+-----------+-----------+-----+
    |  buf [0]   |  buf [1]  |  buf [2]  | ... |
    |  buf_size  |  buf_size |  buf_size | ... |
    +--------- --+-----------+-----------+-----+

The buffer ring logic is as follows:
select:  buf = bufs[head % nbufs]; head++
recycle: bufs[tail % nbufs] = buf; tail++
empty:   tail == head (no buffers available)
full:    tail - head >= nbufs

Buffer ring request flow
------------------------
|  Kernel                                  |  FUSE daemon
|                                          |
|  [client request arrives]                |
|  >fuse_uring_send()                      |
|    [select payload buf from pool]        |
|    >fuse_uring_select_buffer()           |
|    [copy headers to ent]                 |
|    >copy_header_to_ring()                |
|    [copy payload to selected buf]        |
|    >fuse_uring_copy_to_ring()            |
|    [set buf_id in ent_in_out header]     |
|    >io_uring_cmd_done()                  |
|                                          |  [CQE received]
|                                          |  [read headers]
|                                          |  [read payload from buf_id]
|                                          |  [process request]
|                                          |  [write reply to header]
|                                          |  [write reply payload to
|                                          |    buf]
|                                          |  >io_uring_submit()
|                                          |   COMMIT_AND_FETCH
|  >fuse_uring_commit_fetch()              |
|    >fuse_uring_commit()                  |
|     [copy reply from ring]               |
|     >fuse_uring_recycle_buffer()         |
|    >fuse_uring_get_next_fuse_req()       |

Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c       | 356 +++++++++++++++++++++++++++++++-------
 fs/fuse/dev_uring_i.h     |  35 +++-
 include/uapi/linux/fuse.h |  29 +++-
 3 files changed, 353 insertions(+), 67 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 5f407a79c280..5947b834121e 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -41,6 +41,11 @@ enum fuse_uring_header_type {
 	FUSE_URING_HEADER_RING_ENT,
 };
 
+static inline bool bufpool_enabled(struct fuse_ring_queue *queue)
+{
+	return queue->bufpool != NULL;
+}
+
 static void uring_cmd_set_ring_ent(struct io_uring_cmd *cmd,
 				   struct fuse_ring_ent *ring_ent)
 {
@@ -222,6 +227,7 @@ void fuse_uring_destruct(struct fuse_chan *fch)
 		}
 
 		kfree(queue->fpq.processing);
+		kfree(queue->bufpool);
 		kfree(queue);
 		ring->queues[qid] = NULL;
 	}
@@ -277,20 +283,113 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
 	return res;
 }
 
-static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
-						       int qid)
+/*
+ * sqe->addr is a ptr to an iovec array, iov[FUSE_URING_IOV_HEADERS] has the
+ * headers, iov[FUSE_URING_IOV_PAYLOAD] the payload
+ */
+static int fuse_uring_get_iovec_from_sqe(const struct io_uring_sqe *sqe,
+					 struct iovec iov[FUSE_URING_IOV_SEGS])
+{
+	struct iovec __user *uiov = u64_to_user_ptr(READ_ONCE(sqe->addr));
+	struct iov_iter iter;
+	ssize_t ret;
+
+	if (sqe->len != FUSE_URING_IOV_SEGS)
+		return -EINVAL;
+
+	/*
+	 * Direction for buffer access will actually be READ and WRITE,
+	 * using write for the import should include READ access as well.
+	 */
+	ret = import_iovec(WRITE, uiov, FUSE_URING_IOV_SEGS,
+			   FUSE_URING_IOV_SEGS, &iov, &iter);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int fuse_uring_bufpool_setup(struct io_uring_cmd *cmd,
+				    struct fuse_ring_queue *queue)
+{
+	const struct fuse_uring_cmd_req *cmd_req =
+		io_uring_sqe128_cmd(cmd->sqe, struct fuse_uring_cmd_req);
+	unsigned int buf_size = READ_ONCE(cmd_req->init.buf_size);
+	unsigned int nr_bufs = READ_ONCE(cmd_req->init.nr_bufs);
+	struct iovec iov[FUSE_URING_IOV_SEGS];
+	uintptr_t payload_addr;
+	size_t payload_size, ring_size;
+	struct fuse_bufpool *pool;
+	unsigned int i;
+	int err;
+
+	if (!buf_size || !nr_bufs)
+		return -EINVAL;
+
+	err = fuse_uring_get_iovec_from_sqe(cmd->sqe, iov);
+	if (err)
+		return err;
+
+	payload_addr = (uintptr_t)iov[FUSE_URING_IOV_PAYLOAD].iov_base;
+	payload_size = iov[FUSE_URING_IOV_PAYLOAD].iov_len;
+
+	if (payload_size < (uint64_t)buf_size * nr_bufs)
+		return -EINVAL;
+
+	/* create the pool, which is managed as a ring buffer */
+	ring_size = struct_size(pool, bufs, nr_bufs);
+	pool = kzalloc(ring_size, GFP_KERNEL_ACCOUNT);
+	if (!pool)
+		return -ENOMEM;
+
+	/* populate the ring buffer */
+	for (i = 0; i < nr_bufs; i++, payload_addr += buf_size) {
+		struct fuse_bufpool_buf *buf = &pool->bufs[i];
+
+		buf->addr = payload_addr;
+		buf->len = buf_size;
+		buf->id = i;
+	}
+
+	pool->nbufs = nr_bufs;
+	pool->tail = nr_bufs;
+
+	queue->bufpool = pool;
+
+	return 0;
+}
+
+/*
+ * If the queue is already registered, check that the queue was initialized with
+ * the same init flags set for this FUSE_IO_URING_CMD_REGISTER cmd. all
+ * FUSE_IO_URING_CMD_REGISTER cmds should have the same init fields set on a
+ * per-queue basis.
+ */
+static bool queue_init_flags_consistent(struct fuse_ring_queue *queue,
+					u64 init_flags)
+{
+	bool bufpool = init_flags & FUSE_URING_BUFPOOL;
+
+	return bufpool_enabled(queue) == bufpool;
+}
+
+static struct fuse_ring_queue *
+fuse_uring_create_queue(struct io_uring_cmd *cmd, struct fuse_ring *ring,
+			int qid, u64 init_flags)
 {
+	bool use_bufpool = init_flags & FUSE_URING_BUFPOOL;
 	struct fuse_chan *fch = ring->chan;
 	struct fuse_ring_queue *queue;
 	struct list_head *pq;
+	int err;
 
 	queue = kzalloc_obj(*queue, GFP_KERNEL_ACCOUNT);
 	if (!queue)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	pq = fuse_pqueue_alloc();
 	if (!pq) {
 		kfree(queue);
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	queue->qid = qid;
@@ -308,12 +407,27 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 	fuse_pqueue_init(&queue->fpq);
 	queue->fpq.processing = pq;
 
+	if (use_bufpool) {
+		err = fuse_uring_bufpool_setup(cmd, queue);
+		if (err) {
+			kfree(pq);
+			kfree(queue);
+			return ERR_PTR(err);
+		}
+	}
+
 	spin_lock(&fch->lock);
+	/* check if the queue creation raced with another thread */
 	if (ring->queues[qid]) {
 		spin_unlock(&fch->lock);
 		kfree(queue->fpq.processing);
+		kfree(queue->bufpool);
 		kfree(queue);
-		return ring->queues[qid];
+
+		queue = ring->queues[qid];
+		if (!queue_init_flags_consistent(queue, init_flags))
+			return ERR_PTR(-EINVAL);
+		return queue;
 	}
 
 	/*
@@ -640,12 +754,26 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
 				 struct fuse_ring_ent *ent, int dir,
 				 struct iov_iter *iter)
 {
+	void __user *payload;
+	size_t len;
 	int err;
 
-	err = import_ubuf(dir, ent->payload, ring->max_payload_sz, iter);
-	if (err) {
-		pr_info_ratelimited("fuse: Import of user buffer failed\n");
-		return err;
+	memset(iter, 0, sizeof(*iter));
+
+	if (bufpool_enabled(ent->queue)) {
+		payload = (void __user *)ent->payload_buf.addr;
+		len = ent->payload_buf.len;
+	} else {
+		payload = ent->payload;
+		len = ring->max_payload_sz;
+	}
+
+	if (payload) {
+		err = import_ubuf(dir, payload, len, iter);
+		if (err) {
+			pr_info_ratelimited("fuse: Import of user buffer failed\n");
+			return err;
+		}
 	}
 
 	fuse_copy_init(cs, dir == ITER_DEST, iter);
@@ -697,6 +825,9 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 		.commit_id = req->in.h.unique,
 	};
 
+	if (bufpool_enabled(ent->queue))
+		ent_in_out.buf_id = ent->payload_buf.id;
+
 	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_DEST, &iter);
 	if (err)
 		return err;
@@ -761,6 +892,92 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 				   sizeof(req->in.h));
 }
 
+static bool fuse_uring_req_has_payload(struct fuse_req *req)
+{
+	struct fuse_args *args = req->args;
+
+	return args->in_numargs > 1 || args->out_numargs;
+}
+
+static int fuse_uring_select_buffer(struct fuse_ring_ent *ent)
+{
+	struct fuse_ring_queue *queue = ent->queue;
+	struct fuse_bufpool *pool = queue->bufpool;
+	struct fuse_bufpool_buf *buf;
+	unsigned int tail = pool->tail, head = pool->head;
+
+	lockdep_assert_held(&queue->lock);
+
+	if (tail == head)
+		return -ENOBUFS;
+
+	buf = &pool->bufs[head % pool->nbufs];
+	pool->head++;
+
+	ent->payload_buf = *buf;
+
+	return 0;
+}
+
+static void fuse_uring_recycle_buffer(struct fuse_ring_ent *ent)
+{
+	struct fuse_bufpool_buf *ent_payload = &ent->payload_buf;
+	struct fuse_ring_queue *queue = ent->queue;
+	struct fuse_bufpool_buf *buf;
+	struct fuse_bufpool *pool;
+
+	lockdep_assert_held(&queue->lock);
+
+	if (!bufpool_enabled(queue) || !ent_payload->addr)
+		return;
+
+	pool = queue->bufpool;
+
+	/* pool should never be full */
+	WARN_ON_ONCE(pool->tail - pool->head >= pool->nbufs);
+
+	buf = &pool->bufs[(pool->tail) % pool->nbufs];
+	*buf = *ent_payload;
+
+	pool->tail++;
+
+	memset(ent_payload, 0, sizeof(*ent_payload));
+}
+
+static int fuse_uring_next_req_update_buffer(struct fuse_ring_ent *ent,
+					     struct fuse_req *req)
+{
+	bool buffer_selected;
+	bool has_payload;
+
+	if (!bufpool_enabled(ent->queue))
+		return 0;
+
+	buffer_selected = !!ent->payload_buf.addr;
+	has_payload = fuse_uring_req_has_payload(req);
+
+	if (has_payload && !buffer_selected)
+		return fuse_uring_select_buffer(ent);
+
+	if (!has_payload && buffer_selected)
+		fuse_uring_recycle_buffer(ent);
+
+	return 0;
+}
+
+static int fuse_uring_prep_buffer(struct fuse_ring_ent *ent,
+				  struct fuse_req *req)
+{
+	if (!bufpool_enabled(ent->queue))
+		return 0;
+
+	/* no payload to copy, can skip selecting a buffer */
+	if (!fuse_uring_req_has_payload(req))
+		return 0;
+
+	return fuse_uring_select_buffer(ent);
+}
+
 static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
 				   struct fuse_req *req)
 {
@@ -829,15 +1046,26 @@ static struct fuse_req *fuse_uring_ent_assign_req(struct fuse_ring_ent *ent)
 	struct fuse_req *req;
 	struct fuse_ring_queue *queue = ent->queue;
 	struct list_head *req_queue = &queue->fuse_req_queue;
+	int err;
 
 	lockdep_assert_held(&queue->lock);
 
 	/* get and assign the next entry while it is still holding the lock */
 	req = list_first_entry_or_null(req_queue, struct fuse_req, list);
-	if (req)
-		fuse_uring_add_req_to_ring_ent(ent, req);
+	if (req) {
+		/*
+		 * Buffer selection may fail if all the buffers are currently saturated.
+		 * The request will be serviced when a buffer is freed up.
+		 */
+		err = fuse_uring_next_req_update_buffer(ent, req);
+		if (!err) {
+			fuse_uring_add_req_to_ring_ent(ent, req);
+			return req;
+		}
+	}
 
-	return req;
+	fuse_uring_recycle_buffer(ent);
+	return NULL;
 }
 
 /*
@@ -996,6 +1224,12 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	 * fuse requests would otherwise not get processed - committing
 	 * and fetching is done in one step vs legacy fuse, which has separated
 	 * read (fetch request) and write (commit result).
+	 *
+	 * If the server is using bufpools and has populated the pool with less
+	 * payload buffers than ents, it is possible that there may not be an
+	 * available buffer for the next request. If so, then the fetch is a
+	 * no-op and the next request will be serviced when a buffer becomes
+	 * available.
 	 */
 	if (fuse_uring_get_next_fuse_req(ent, queue))
 		fuse_uring_send(ent, cmd, 0, issue_flags);
@@ -1057,32 +1291,6 @@ static void fuse_uring_do_register(struct fuse_ring_ent *ent,
 	}
 }
 
-/*
- * sqe->addr is a ptr to an iovec array, iov[FUSE_URING_IOV_HEADERS] has the
- * headers, iov[FUSE_URING_IOV_PAYLOAD] the payload
- */
-static int fuse_uring_get_iovec_from_sqe(const struct io_uring_sqe *sqe,
-					 struct iovec iov[FUSE_URING_IOV_SEGS])
-{
-	struct iovec __user *uiov = u64_to_user_ptr(READ_ONCE(sqe->addr));
-	struct iov_iter iter;
-	ssize_t ret;
-
-	if (sqe->len != FUSE_URING_IOV_SEGS)
-		return -EINVAL;
-
-	/*
-	 * Direction for buffer access will actually be READ and WRITE,
-	 * using write for the import should include READ access as well.
-	 */
-	ret = import_iovec(WRITE, uiov, FUSE_URING_IOV_SEGS,
-			   FUSE_URING_IOV_SEGS, &iov, &iter);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static struct fuse_ring_ent *
 fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 			   struct fuse_ring_queue *queue)
@@ -1107,13 +1315,6 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 		return ERR_PTR(err);
 	}
 
-	payload = &iov[FUSE_URING_IOV_PAYLOAD];
-	if (payload->iov_len < ring->max_payload_sz) {
-		pr_info_ratelimited("Invalid req payload len %zu\n",
-				    payload->iov_len);
-		return ERR_PTR(err);
-	}
-
 	err = -ENOMEM;
 	ent = kzalloc_obj(*ent, GFP_KERNEL_ACCOUNT);
 	if (!ent)
@@ -1123,12 +1324,30 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 
 	ent->queue = queue;
 	ent->headers = headers->iov_base;
-	ent->payload = payload->iov_base;
+
+	err = -EINVAL;
+	if (!bufpool_enabled(queue)) {
+		payload = &iov[FUSE_URING_IOV_PAYLOAD];
+		if (payload->iov_len < ring->max_payload_sz) {
+			pr_info_ratelimited("Invalid req payload len %zu\n",
+					    payload->iov_len);
+			kfree(ent);
+			return ERR_PTR(err);
+		}
+		ent->payload = payload->iov_base;
+	}
 
 	atomic_inc(&ring->queue_refs);
 	return ent;
 }
 
+static bool init_flags_valid(u64 init_flags)
+{
+	u64 valid_flags = FUSE_URING_BUFPOOL;
+
+	return !(init_flags & ~valid_flags);
+}
+
 /*
  * Register header and payload buffer with the kernel and puts the
  * entry as "ready to get fuse requests" on the queue
@@ -1138,6 +1357,7 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 {
 	const struct fuse_uring_cmd_req *cmd_req = io_uring_sqe128_cmd(cmd->sqe,
 								       struct fuse_uring_cmd_req);
+	u64 init_flags = READ_ONCE(cmd_req->flags);
 	struct fuse_ring *ring = smp_load_acquire(&fch->ring);
 	struct fuse_ring_queue *queue;
 	struct fuse_ring_ent *ent;
@@ -1156,11 +1376,16 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 		return -EINVAL;
 	}
 
+	if (!init_flags_valid(init_flags))
+		return -EINVAL;
+
 	queue = ring->queues[qid];
 	if (!queue) {
-		queue = fuse_uring_create_queue(ring, qid);
-		if (!queue)
-			return err;
+		queue = fuse_uring_create_queue(cmd, ring, qid, init_flags);
+		if (IS_ERR(queue))
+			return PTR_ERR(queue);
+	} else if (!queue_init_flags_consistent(queue, init_flags)) {
+		return -EINVAL;
 	}
 
 	/*
@@ -1325,14 +1550,18 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 	req->ring_queue = queue;
 	ent = list_first_entry_or_null(&queue->ent_avail_queue,
 				       struct fuse_ring_ent, list);
-	if (ent)
-		fuse_uring_add_req_to_ring_ent(ent, req);
-	else
-		list_add_tail(&req->list, &queue->fuse_req_queue);
-	spin_unlock(&queue->lock);
+	if (ent) {
+		err = fuse_uring_prep_buffer(ent, req);
+		if (!err) {
+			fuse_uring_add_req_to_ring_ent(ent, req);
+			spin_unlock(&queue->lock);
+			fuse_uring_dispatch_ent(ent);
+			return;
+		}
+	}
 
-	if (ent)
-		fuse_uring_dispatch_ent(ent);
+	list_add_tail(&req->list, &queue->fuse_req_queue);
+	spin_unlock(&queue->lock);
 
 	return;
 
@@ -1350,6 +1579,7 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
 	struct fuse_ring *ring = fch->ring;
 	struct fuse_ring_queue *queue;
 	struct fuse_ring_ent *ent = NULL;
+	int err;
 
 	queue = fuse_uring_task_to_queue(ring);
 	if (!queue)
@@ -1382,14 +1612,16 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
 	req = list_first_entry_or_null(&queue->fuse_req_queue, struct fuse_req,
 				       list);
 	if (ent && req) {
-		fuse_uring_add_req_to_ring_ent(ent, req);
-		spin_unlock(&queue->lock);
-
-		fuse_uring_dispatch_ent(ent);
-	} else {
-		spin_unlock(&queue->lock);
+		err = fuse_uring_prep_buffer(ent, req);
+		if (!err) {
+			fuse_uring_add_req_to_ring_ent(ent, req);
+			spin_unlock(&queue->lock);
+			fuse_uring_dispatch_ent(ent);
+			return true;
+		}
 	}
 
+	spin_unlock(&queue->lock);
 	return true;
 }
 
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index 368f4d0790eb..46ef3b5403fd 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -36,11 +36,36 @@ enum fuse_ring_req_state {
 	FRRS_RELEASED,
 };
 
+struct fuse_bufpool_buf {
+	uintptr_t addr;
+	unsigned int len;
+	unsigned int id;
+};
+
+/* implemented as a buffer ring */
+struct fuse_bufpool {
+	/* metadata tracking state of the bufpool */
+	unsigned int nbufs;
+	unsigned int head;
+	unsigned int tail;
+
+	/* the buffers backing the pool */
+	__DECLARE_FLEX_ARRAY(struct fuse_bufpool_buf, bufs);
+};
+
 /** A fuse ring entry, part of the ring queue */
 struct fuse_ring_ent {
-	/* userspace buffer */
 	struct fuse_uring_req_header __user *headers;
-	void __user *payload;
+	union {
+		/* if bufpools are not used */
+		struct {
+			void __user *payload;
+		};
+		/* if bufpools are used */
+		struct {
+			struct fuse_bufpool_buf payload_buf;
+		};
+	};
 
 	/* the ring queue that owns the request */
 	struct fuse_ring_queue *queue;
@@ -99,6 +124,12 @@ struct fuse_ring_queue {
 	unsigned int active_background;
 
 	bool stopped;
+
+	/*
+	 * only allocated if the server registers the ring with
+	 * FUSE_URING_BUFPOOL.
+	 */
+	struct fuse_bufpool *bufpool;
 };
 
 /*
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index c13e1f9a2f12..5fb4a7a3772c 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -240,6 +240,11 @@
  *  - add FUSE_COPY_FILE_RANGE_64
  *  - add struct fuse_copy_file_range_out
  *  - add FUSE_NOTIFY_PRUNE
+ *
+ *  7.46
+ *  - add FUSE_URING_BUFPOOL flag
+ *  - add fuse_uring_cmd_req init struct
+ *  - add buf_id field to fuse_uring_ent_in_out struct
  */
 
 #ifndef _LINUX_FUSE_H
@@ -275,7 +280,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 45
+#define FUSE_KERNEL_MINOR_VERSION 46
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -1263,7 +1268,13 @@ struct fuse_uring_ent_in_out {
 
 	/* size of user payload buffer */
 	uint32_t payload_sz;
-	uint32_t padding;
+
+	/*
+	 * if using bufpools, this is the id of the selected buffer.
+	 * the selected buffer holds the request payload
+	 */
+	uint16_t buf_id;
+	uint16_t padding;
 
 	uint64_t reserved;
 };
@@ -1294,6 +1305,9 @@ enum fuse_uring_cmd {
 	FUSE_IO_URING_CMD_COMMIT_AND_FETCH = 2,
 };
 
+/* fuse_uring_cmd_req flags */
+#define FUSE_URING_BUFPOOL		(1 << 0)
+
 /**
  * In the 80B command area of the SQE.
  */
@@ -1305,7 +1319,16 @@ struct fuse_uring_cmd_req {
 
 	/* queue the command is for (queue index) */
 	uint16_t qid;
-	uint8_t padding[6];
+	uint16_t padding;
+	uint32_t reserved;
+
+	union {
+		struct {
+			/* FUSE_URING_BUFPOOL: buffer pool configuration */
+			uint32_t buf_size;
+			uint16_t nr_bufs;
+		} init;
+	};
 };
 
 #endif /* _LINUX_FUSE_H */
-- 
2.52.0

