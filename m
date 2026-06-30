Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7D0270EC1
	for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 21:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854217; cv=none; b=bL4sXu3Bll5xRAhv/Eeez60/kPfLucrPiLYmtY1eAkpGcued+pKIHNBGzbU+66WZV3f4MKwQa3dxnS/VFtXyxqyoR5xJvBtrqEEMxW+9Px9KgWG8X4Yloxh0gfu9LqFjYJlUlMsRUi5kkUPjtZpzDwbpFBqWOZrGfZs+2z9xW2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854217; c=relaxed/simple;
	bh=bvmyDUi/bKqRzUxB3q1q3CsXqMJRnEG+8Cmpw0FeOE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MW/8v+DvR/KVRb2TxzmuOSa68sEKXutMOdOak0fOGok+KiMI3LzZkcRTR8SGfWqS3zbYl9bjw3Bc2UGEUj03gsWuOsiTTcbkzTpOx/bJb/VmW+Zc/9C7KA8NCYwNNLO4qMg+VRikyuJqAkpIzPFcozLMPplD3c4VeA0MII3ph8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QI3pr7uV; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QI3pr7uV"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6a1905287a4so676857eaf.0
        for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 14:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782854215; x=1783459015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YywL/4UyAfLmON7G0QTtCz5aNKOTQfredTU6cV6en4M=;
        b=QI3pr7uVD+5mhh2f3gGh8TSQ/MtnLe/4fST+mJhp0nEYDi4ErgrRG6TgSy5OsPsoxN
         1+Iz7fSqERZdRGjflTzeGMGcbiCgINL1+JQNML6pbj5uK53PGrnBSnXxBUdSLqQf+u9l
         yGHKVjVotX4t7gv//vJQMRICN3UNGVbL0O6LTDq1iTWeaQkZGeAJ6HDqoYTi4bAqeWCX
         tOvzy/P9FCeUcIz1Jj/X1pjAuJgAo+SiDnbr53JPw8jj/+rdcQnGiKzXAtgmpqmsa5FL
         u3jY0fWOI3M7NmDF9YuZcyVO/ng5MRYfZVfNXrKDpdbQoYxoVBHcYr07D9lMi4ZzyxIG
         Z8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854215; x=1783459015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YywL/4UyAfLmON7G0QTtCz5aNKOTQfredTU6cV6en4M=;
        b=Vmt3rwluFrmVzSy+NdmMA7vWfJqRJaICF9CtMTwFEjYbI5vp0ebApwmvV13xOwOTuD
         +QiX5WB4+RHihCgdyK1BU8PFVp4sSDfcLldGnQZb4tkdCnJryt11tXrtIpZi1vD/3utx
         hZuQExAHpmdC3NnX9703R2R7p07ZfyTocSLEBMBFCmB/Ih/jNEObH7irm7Dw4jJJv4nT
         AJ0zc0SIDaM9HNKYUlJN8AfdSn4N+dlpexJuCW99kOdBHDl7LcdOshWavvDN+vSmYWgG
         4OkAmVWtiB6CqvS9yZv6alzWj2oviLc7UuM202bopvk8zJAB2yCsrcMxdB8AP8y0s1sY
         zNtg==
X-Forwarded-Encrypted: i=1; AFNElJ975a/WEBdGeQOhxa4TKIaT6Q5xYxXiAT4etMBQjkDa8ECVheFhqyhEhIlJxCMYYsKT19ee9F0D2Yij@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ4ZXGGfCRWpq5uHVtyZPa11XzkEGfI88a9OJZ2g/yT5SyMrkj
	IOKSgPWiOC/OzFSmgcusV8Cii2NLJgeK51hcH9LoiE2iou2yzR/ZDf3U
X-Gm-Gg: AfdE7cn21o2x+HEpYdTK5QGc4MJcywPdV0ny1PSrzH0X/KqkKAMgvKewFZCbp/a6n6O
	404VLiPI0eJMfxJkvg7CNznyIMcpzLHJGtd0y9VFJScZgtIMYzHRcpnodxZa0eACjUHZn58dS7i
	S5nPIrgErB7FTffnf3mJB+I2O0UT7QW+nKJfqCE8cj7ONUBF6/3Ya8toXDOX7hjSsUWHSs4FjMq
	p74s/jqkSH8JmkodrrMfU33qV9/++Cikop1FncaIhCI+jxHkcaBHR/C0O+QfKOEXxvuwhQNCqu/
	XPp4nVtfc5LLoSJM0Ol+HXYwyAz0iSYGpDK4BPwiHogI2cXHo6n+JP4Qj4V7yAD0ilYPrWOfC5U
	pETNPlQu/ELJkXK0s5AugsFdVBEMBcXZEsBiHfXAlyVpUQDl37KpeizbSke5LYMUrHF6BBtL5ml
	SHMh5mw9zT5G2Oz6H9kG4768iLBHQgyl9N7WXg+Q/ebLup8W4nYlkXuvPpBUpfjTWo
X-Received: by 2002:a05:6820:2089:b0:6a1:7953:38fd with SMTP id 006d021491bc7-6a18926014bmr3911833eaf.59.1782854214604;
        Tue, 30 Jun 2026 14:16:54 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:70::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a189214c7asm2823881eaf.7.2026.06.30.14.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:16:54 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v5 3/6] fuse: add io-uring buffer pools
Date: Tue, 30 Jun 2026 14:14:32 -0700
Message-ID: <20260630211436.2062816-4-joannelkoong@gmail.com>
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

Right now, ents and buffers are tightly coupled in fuse io-uring where
each entry has its own dedicated payload buffer, requiring N buffers for
N entries where each buffer must be large enough to accomodate the
maximum payload size. This is suboptimal as most request types (lookup,
open, release, getattr, etc) require vastly less bytes than the maximum
payload size and some requests (unlink, rmdir, fsync, flush, etc) do not
require payload buffers at all.

Instead of requiring a 1:1 coupling between ents and payload buffers,
allow the server to pass in a buffer pool (a contiguous chunk of memory)
that the kernel will use as it wishes for servicing ents/requests.
Entries only reserve a "buffer" from the pool while actively processing
a request that requires a payload buffer. This decoupling and letting
the kernel delegate memory from the pool for requests allows the kernel to
optimize memory usage and reduces the memory usage requirements needed
to use fuse-over-io-uring.

A pool is registered per queue with the new
FUSE_IO_URING_CMD_ADD_BUFPOOL command. The server passes the pool's base
address and length in fuse_uring_cmd_req.bufpool.{uaddr,len}.

Internally, the kernel splits the region into buffers of
ring->max_payload_sz bytes each (nr_bufs = pool len / max_payload_sz). A
queue commits to a payload mode on first use: registering an entry that
carries its own payload selects the legacy per-entry mode, while
ADD_BUFPOOL selects pool mode. The two are mutually exclusive, so
ADD_BUFPOOL must be issued before any payload-carrying entries are
registered on that queue. The queue must have been created before the
bufpool is added, through the FUSE_IO_URING_CMD_ADD_QUEUE command.

The kernel tracks free buffers with a bitmap (a set bit marks a free
buffer). On dispatch, a request that needs a payload claims a free
buffer (find_first_bit + clear). A request that needs none claims
nothing. The buffer's byte offset within the pool is reported to the
server in the new fuse_uring_ent_in_out.offset field so that the server
can locate the payload. On completion the buffer is returned to the pool
or reused directly if the next request on that entry also has a payload.

The FUSE_HAS_IO_URING_BUFPOOL flag advertises kernel support to the
server for bufpools.

Buffer pool request flow
~~~~~~~~~~~~~~~~~~~~~~~~
|  Kernel                                  |  FUSE daemon
|                                          |
|  [request arrives]                       |
|    [claim a free pool buffer]            |
|    >fuse_uring_select_buffer()           |
|    [copy headers to ring]                |
|    [copy payload to buffer]              |
|    [report buffer offset in ent_in_out]  |
|    >io_uring_cmd_done()                  |
|                                          |  [read headers]
|                                          |  [read/write payload at offset]
|                                          |  [process request]
|                                          |  >io_uring_submit()
|                                          |   COMMIT_AND_FETCH
|  >fuse_uring_commit_fetch()              |
|    [copy reply from ring]                |
|    [return buffer to the pool]           |
|    >fuse_uring_recycle_buffer()          |

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c       | 235 +++++++++++++++++++++++++++++++++-----
 fs/fuse/dev_uring_i.h     |  37 +++++-
 fs/fuse/inode.c           |   2 +-
 include/uapi/linux/fuse.h |  20 +++-
 4 files changed, 264 insertions(+), 30 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 96fb3adfb414..5cd628530bea 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -9,6 +9,7 @@
 #include "dev_uring_i.h"
 #include "fuse_trace.h"
 
+#include <linux/bitmap.h>
 #include <linux/fs.h>
 #include <linux/io_uring/cmd.h>
 
@@ -41,6 +42,11 @@ enum fuse_uring_header_type {
 	FUSE_URING_HEADER_RING_ENT,
 };
 
+static inline bool bufpool_enabled(struct fuse_ring_queue *queue)
+{
+	return queue->payload_mode == FUSE_PAYLOAD_BUFPOOL;
+}
+
 static void uring_cmd_set_ring_ent(struct io_uring_cmd *cmd,
 				   struct fuse_ring_ent *ring_ent)
 {
@@ -222,6 +228,7 @@ void fuse_uring_destruct(struct fuse_chan *fch)
 		}
 
 		kfree(queue->fpq.processing);
+		kfree(queue->bufpool);
 		kfree(queue);
 		ring->queues[qid] = NULL;
 	}
@@ -316,6 +323,7 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 	if (ring->queues[qid]) {
 		spin_unlock(&fch->lock);
 		kfree(queue->fpq.processing);
+		kfree(queue->bufpool);
 		kfree(queue);
 		return fail_if_exists ? ERR_PTR(-EEXIST) : ring->queues[qid];
 	}
@@ -644,13 +652,14 @@ static int copy_header_from_ring(struct fuse_ring_ent *ent,
 }
 
 static int setup_fuse_copy_state(struct fuse_copy_state *cs,
-				 struct fuse_ring *ring, struct fuse_req *req,
+				 struct fuse_req *req,
 				 struct fuse_ring_ent *ent, int dir,
 				 struct iov_iter *iter)
 {
 	int err;
 
-	err = import_ubuf(dir, ent->payload, ring->max_payload_sz, iter);
+	err = import_ubuf(dir, ent->payload.iov_base, ent->payload.iov_len,
+			  iter);
 	if (err) {
 		pr_info_ratelimited("fuse: Import of user buffer failed\n");
 		return err;
@@ -664,8 +673,7 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
 	return 0;
 }
 
-static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
-				     struct fuse_req *req,
+static int fuse_uring_copy_from_ring(struct fuse_req *req,
 				     struct fuse_ring_ent *ent)
 {
 	struct fuse_copy_state cs;
@@ -679,7 +687,7 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 	if (err)
 		return err;
 
-	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE, &iter);
+	err = setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter);
 	if (err)
 		return err;
 
@@ -691,7 +699,7 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 /*
  * Copy data from the req to the ring buffer
  */
-static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
+static int fuse_uring_args_to_ring(struct fuse_req *req,
 				   struct fuse_ring_ent *ent)
 {
 	struct fuse_copy_state cs;
@@ -705,7 +713,7 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 		.commit_id = req->in.h.unique,
 	};
 
-	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_DEST, &iter);
+	err = setup_fuse_copy_state(&cs, req, ent, ITER_DEST, &iter);
 	if (err)
 		return err;
 
@@ -735,6 +743,10 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 	}
 
 	ent_in_out.payload_sz = cs.ring.copied_sz;
+	if (bufpool_enabled(ent->queue) && ent->payload.iov_base)
+		ent_in_out.offset =
+			(uintptr_t)ent->payload.iov_base - ent->queue->bufpool->base_uaddr;
+
 	return copy_header_to_ring(ent, FUSE_URING_HEADER_RING_ENT,
 				   &ent_in_out, sizeof(ent_in_out));
 }
@@ -743,7 +755,6 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 				   struct fuse_req *req)
 {
 	struct fuse_ring_queue *queue = ent->queue;
-	struct fuse_ring *ring = queue->ring;
 	int err;
 
 	err = -EIO;
@@ -758,7 +769,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 		return err;
 
 	/* copy the request */
-	err = fuse_uring_args_to_ring(ring, req, ent);
+	err = fuse_uring_args_to_ring(req, ent);
 	if (unlikely(err)) {
 		pr_info_ratelimited("Copy to ring failed: %d\n", err);
 		return err;
@@ -769,6 +780,91 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
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
+	unsigned int id;
+
+	lockdep_assert_held(&queue->lock);
+
+	id = find_first_bit(pool->free_map, pool->nr_bufs);
+	if (id >= pool->nr_bufs)
+		return -ENOBUFS;
+
+	WARN_ON_ONCE(ent->payload.iov_base);
+	__clear_bit(id, pool->free_map);
+
+	ent->buf_id = id;
+	ent->payload.iov_base =
+		(void __user *)(pool->base_uaddr + id * pool->buf_size);
+	ent->payload.iov_len = pool->buf_size;
+
+	return 0;
+}
+
+static void fuse_uring_recycle_buffer(struct fuse_ring_ent *ent)
+{
+	struct iovec *ent_payload = &ent->payload;
+	struct fuse_ring_queue *queue = ent->queue;
+	struct fuse_bufpool *pool;
+
+	lockdep_assert_held(&queue->lock);
+
+	if (!bufpool_enabled(queue) || !ent_payload->iov_base)
+		return;
+
+	pool = queue->bufpool;
+
+	/* a buffer should never be recycled twice */
+	WARN_ON_ONCE(test_bit(ent->buf_id, pool->free_map));
+	__set_bit(ent->buf_id, pool->free_map);
+
+	memset(ent_payload, 0, sizeof(*ent_payload));
+	ent->buf_id = 0;
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
+	buffer_selected = !!ent->payload.iov_base;
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
@@ -856,10 +952,13 @@ static struct fuse_req *fuse_uring_ent_assign_req(struct fuse_ring_ent *ent)
 
 	/* get and assign the next entry while it is still holding the lock */
 	req = list_first_entry_or_null(req_queue, struct fuse_req, list);
-	if (req)
+	if (req && !fuse_uring_next_req_update_buffer(ent, req)) {
 		fuse_uring_add_req_to_ring_ent(ent, req);
+		return req;
+	}
 
-	return req;
+	fuse_uring_recycle_buffer(ent);
+	return NULL;
 }
 
 /*
@@ -870,7 +969,6 @@ static struct fuse_req *fuse_uring_ent_assign_req(struct fuse_ring_ent *ent)
 static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 			      unsigned int issue_flags)
 {
-	struct fuse_ring *ring = ent->queue->ring;
 	ssize_t err = -EFAULT;
 
 	if (copy_header_from_ring(ent, FUSE_URING_HEADER_IN_OUT, &req->out.h,
@@ -883,7 +981,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 		goto out;
 	}
 
-	err = fuse_uring_copy_from_ring(ring, req, ent);
+	err = fuse_uring_copy_from_ring(req, ent);
 out:
 	fuse_uring_req_end(ent, req, err);
 }
@@ -1002,6 +1100,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	if (err != 0) {
 		pr_info_ratelimited("qid=%d commit_id %llu state %d",
 				    queue->qid, commit_id, ent->state);
+		fuse_uring_recycle_buffer(ent);
 		spin_unlock(&queue->lock);
 		fuse_uring_req_end(ent, req, err);
 		return err;
@@ -1019,6 +1118,11 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	 * fuse requests would otherwise not get processed - committing
 	 * and fetching is done in one step vs legacy fuse, which has separated
 	 * read (fetch request) and write (commit result).
+	 *
+	 * If there is no next request or if all buffers are busy (if using a
+	 * bufpool), the cmd is not returned to userspace. The entry is left
+	 * available and the cmd only returns to userspace when there's a
+	 * next request and an available buffer.
 	 */
 	if (fuse_uring_get_next_fuse_req(ent, queue))
 		fuse_uring_send(ent, cmd, 0, issue_flags);
@@ -1143,11 +1247,23 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 	}
 
 	payload = &iov[FUSE_URING_IOV_PAYLOAD];
-	if (payload->iov_len < ring->max_payload_sz) {
-		pr_info_ratelimited("Invalid req payload len %zu\n",
-				    payload->iov_len);
-		return ERR_PTR(err);
+
+	spin_lock(&queue->lock);
+	if (bufpool_enabled(queue)) {
+		if (payload->iov_base || payload->iov_len) {
+			spin_unlock(&queue->lock);
+			return ERR_PTR(err);
+		}
+	} else {
+		if (payload->iov_len < ring->max_payload_sz) {
+			pr_info_ratelimited("Invalid req payload len %zu\n",
+					    payload->iov_len);
+			spin_unlock(&queue->lock);
+			return ERR_PTR(err);
+		}
+		queue->payload_mode = FUSE_PAYLOAD_PER_ENT;
 	}
+	spin_unlock(&queue->lock);
 
 	err = -ENOMEM;
 	ent = kzalloc_obj(*ent, GFP_KERNEL_ACCOUNT);
@@ -1158,7 +1274,8 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 
 	ent->queue = queue;
 	ent->headers = headers->iov_base;
-	ent->payload = payload->iov_base;
+	if (queue->payload_mode == FUSE_PAYLOAD_PER_ENT)
+		ent->payload = *payload;
 
 	atomic_inc(&ring->queue_refs);
 	return ent;
@@ -1229,6 +1346,62 @@ static int fuse_uring_add_queue(struct io_uring_cmd *cmd, struct fuse_chan *fch)
 	return 0;
 }
 
+static int fuse_uring_add_bufpool(struct io_uring_cmd *cmd,
+				  struct fuse_chan *fch)
+{
+	const struct fuse_uring_cmd_req *cmd_req =
+		io_uring_sqe128_cmd(cmd->sqe, struct fuse_uring_cmd_req);
+	unsigned int qid = READ_ONCE(cmd_req->qid);
+	uint64_t flags = READ_ONCE(cmd_req->flags);
+	/* paired with the smp_store_release() in fuse_uring_create */
+	struct fuse_ring *ring = smp_load_acquire(&fch->ring);
+	struct fuse_ring_queue *queue;
+	struct fuse_bufpool *pool;
+	uintptr_t pool_uaddr;
+	unsigned int pool_len, nr_bufs;
+	size_t pool_size, buf_size;
+
+	if (!ring || qid >= ring->nr_queues || flags)
+		return -EINVAL;
+
+	queue = ring->queues[qid];
+	if (!queue)
+		return -EINVAL;
+
+	pool_uaddr = READ_ONCE(cmd_req->bufpool.uaddr);
+	pool_len = READ_ONCE(cmd_req->bufpool.len);
+
+	/* each buffer holds the max payload size */
+	buf_size = queue->ring->max_payload_sz;
+
+	nr_bufs = pool_len / buf_size;
+	if (!nr_bufs)
+		return -EINVAL;
+
+	pool_size = struct_size(pool, free_map, BITS_TO_LONGS(nr_bufs));
+	pool = kzalloc(pool_size, GFP_KERNEL_ACCOUNT);
+	if (!pool)
+		return -ENOMEM;
+
+	pool->base_uaddr = pool_uaddr;
+	pool->buf_size = buf_size;
+	pool->nr_bufs = nr_bufs;
+	/* all buffers are free */
+	bitmap_set(pool->free_map, 0, nr_bufs);
+
+	spin_lock(&queue->lock);
+	if (queue->payload_mode != FUSE_PAYLOAD_UNSET) {
+		spin_unlock(&queue->lock);
+		kfree(pool);
+		return -EINVAL;
+	}
+	queue->bufpool = pool;
+	queue->payload_mode = FUSE_PAYLOAD_BUFPOOL;
+	spin_unlock(&queue->lock);
+
+	return 0;
+}
+
 /*
  * Entry function from io_uring to handle the given passthrough command
  * (op code IORING_OP_URING_CMD)
@@ -1299,6 +1472,12 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
 			pr_info_once("FUSE_IO_URING_CMD_ADD_QUEUE failed err=%d\n",
 				     err);
 		return err;
+	case FUSE_IO_URING_CMD_ADD_BUFPOOL:
+		err = fuse_uring_add_bufpool(cmd, fch);
+		if (err)
+			pr_info_once("FUSE_IO_URING_ADD_BUFPOOL failed err=%d\n",
+				     err);
+		return err;
 	default:
 		return -EINVAL;
 	}
@@ -1393,14 +1572,17 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 	req->ring_queue = queue;
 	ent = list_first_entry_or_null(&queue->ent_avail_queue,
 				       struct fuse_ring_ent, list);
-	if (ent)
-		fuse_uring_add_req_to_ring_ent(ent, req);
-	else
-		list_add_tail(&req->list, &queue->fuse_req_queue);
-	spin_unlock(&queue->lock);
+	if (ent) {
+		if (!fuse_uring_prep_buffer(ent, req)) {
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
 
@@ -1449,10 +1631,9 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
 	 */
 	req = list_first_entry_or_null(&queue->fuse_req_queue, struct fuse_req,
 				       list);
-	if (ent && req) {
+	if (ent && req && !fuse_uring_prep_buffer(ent, req)) {
 		fuse_uring_add_req_to_ring_ent(ent, req);
 		spin_unlock(&queue->lock);
-
 		fuse_uring_dispatch_ent(ent);
 	} else {
 		spin_unlock(&queue->lock);
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index d721a4fc0215..cdf56f8b38b5 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -7,6 +7,8 @@
 #ifndef _FS_FUSE_DEV_URING_I_H
 #define _FS_FUSE_DEV_URING_I_H
 
+#include <linux/uio.h>
+
 #include "fuse_dev_i.h"
 
 #ifdef CONFIG_FUSE_IO_URING
@@ -36,11 +38,38 @@ enum fuse_ring_req_state {
 	FRRS_RELEASED,
 };
 
+/* how a queue's payload buffers are provided */
+enum fuse_queue_payload_mode {
+	/* not yet committed (a bufpool may still be added) */
+	FUSE_PAYLOAD_UNSET = 0,
+	/* each entry registers its own payload buffer */
+	FUSE_PAYLOAD_PER_ENT,
+	/* each entry's payload buffer is assigned from a bufpool */
+	FUSE_PAYLOAD_BUFPOOL,
+};
+
+struct fuse_bufpool {
+	/* starting uaddr of the bufpool */
+	uintptr_t base_uaddr;
+
+	/* size of each buffer in the pool */
+	size_t buf_size;
+
+	/* total number of buffers in the pool */
+	unsigned int nr_bufs;
+
+	/* bitmap tracking which buffers are free */
+	unsigned long free_map[];
+};
+
 /** A fuse ring entry, part of the ring queue */
 struct fuse_ring_ent {
 	/* userspace buffer */
 	struct fuse_uring_req_header __user *headers;
-	void __user *payload;
+	struct iovec payload;
+
+	/* buffer id in the pool, if bufpools are used. ignored otherwise */
+	unsigned int buf_id;
 
 	/* the ring queue that owns the request */
 	struct fuse_ring_queue *queue;
@@ -99,6 +128,12 @@ struct fuse_ring_queue {
 	unsigned int active_background;
 
 	bool stopped;
+
+	/* how this queue's payload buffers are provided */
+	enum fuse_queue_payload_mode payload_mode;
+
+	/* only allocated when payload_mode == FUSE_PAYLOAD_BUFPOOL */
+	struct fuse_bufpool *bufpool;
 };
 
 /*
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index ce4891a04a37..929ddbea0eb0 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1481,7 +1481,7 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 	 * the reply - server is either sending IORING_OP_URING_CMD or not.
 	 */
 	if (fuse_uring_enabled())
-		flags |= FUSE_OVER_IO_URING;
+		flags |= FUSE_OVER_IO_URING | FUSE_HAS_IO_URING_BUFPOOL;
 
 	ia->in.flags = flags;
 	ia->in.flags2 = flags >> 32;
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index cfb055c0c764..f7173b5d4321 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -243,6 +243,9 @@
  *
  *  7.46
  *  - add FUSE_IO_URING_CMD_ADD_QUEUE
+ *  - add FUSE_HAS_IO_URING_BUFPOOL
+ *  - add fuse_uring_cmd_req bufpool struct
+ *  - add bufpool offset field to fuse_uring_ent_in_out struct
  */
 
 #ifndef _LINUX_FUSE_H
@@ -451,6 +454,7 @@ struct fuse_file_lock {
  * FUSE_OVER_IO_URING: Indicate that client supports io-uring
  * FUSE_REQUEST_TIMEOUT: kernel supports timing out requests.
  *			 init_out.request_timeout contains the timeout (in secs)
+ * FUSE_HAS_IO_URING_BUFPOOL: kernel supports io-uring buffer pools
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -498,6 +502,7 @@ struct fuse_file_lock {
 #define FUSE_ALLOW_IDMAP	(1ULL << 40)
 #define FUSE_OVER_IO_URING	(1ULL << 41)
 #define FUSE_REQUEST_TIMEOUT	(1ULL << 42)
+#define FUSE_HAS_IO_URING_BUFPOOL (1ULL << 43)
 
 /**
  * CUSE INIT request/reply flags
@@ -1266,7 +1271,9 @@ struct fuse_uring_ent_in_out {
 
 	/* size of user payload buffer */
 	uint32_t payload_sz;
-	uint32_t padding;
+
+	/* Offset into the bufpool, if bufpools are used */
+	uint32_t offset;
 
 	uint64_t reserved;
 };
@@ -1298,6 +1305,9 @@ enum fuse_uring_cmd {
 
 	/* add a queue */
 	FUSE_IO_URING_CMD_ADD_QUEUE = 3,
+
+	/* add a bufpool to a queue */
+	FUSE_IO_URING_CMD_ADD_BUFPOOL = 4,
 };
 
 /**
@@ -1312,6 +1322,14 @@ struct fuse_uring_cmd_req {
 	/* queue the command is for (queue index) */
 	uint16_t qid;
 	uint8_t padding[6];
+
+	union {
+		struct {
+			/* base address of bufpool */
+			uint64_t uaddr;
+			uint32_t len;
+		} bufpool;
+	};
 };
 
 #endif /* _LINUX_FUSE_H */
-- 
2.52.0

