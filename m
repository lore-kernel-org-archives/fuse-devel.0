Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C593624D4
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 21:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298428; cv=none; b=diIZKqauA6YqtzPgDG6dlUtoPSzp910O2pkeAUXpReE6aC5xXAwYjVQ74CY0FBknp47xGJLXMy1U/JAONFPWzkCdf8SFMiU51b1vg872zfoy8Sg60+mjZrMvv3AFxNzQIFzfouZMAdrHG+JIwfjsQtlrE2awfKfsIIEQlHBrgVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298428; c=relaxed/simple;
	bh=zyIZJ/tU6RxSuR2h5KXdvJJGosIvyCyaRniL8vue5vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xp0sil2vmMo0/N13+jKBvGH8EzaIe81SK3erbVNd9jzotvDJWGilPI1RIrNuz89KzAQxiq3DyijKdNTQOLzBPO3SU6sX3C6mfzSSK6JsMLETGmde9TaxXozJE8WXs9PEeF8p5Hj9mtTLUB6H8SJNoA0d8D72Y/I2jYUNfHENFO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eb+ANja1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eb+ANja1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so10544505ad.2
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 14:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781298426; x=1781903226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Tj6zkGwC+MQnJs73nrGLlImgos2/lF/B5iXMsHRDAc=;
        b=eb+ANja1BdHC6Ht5EJSoB50fKL1Clh0Bd+1QR1ere2iijJNe6yZwoOoO8D4xoF+SaM
         d1xr9BWavx00ObP12aLG/HBwRoC0W6Zv9dE3yAh4bGwm4hAdriJ4TekQxL+G6pfs+f1u
         5aFkyMEszZ7xNsd4xIYdGotXiI3NDli0R5A/YC/cj/plcS6fVPge8/PSVUN+DBS4MQ2Y
         F1wXNVwn83iqyLP52J6fNq5DXwiYFmk97sh7sto21INEfgOKbprtq53BnSevAdTxcB0v
         7fgABVULhPqDyE6rHgPjDTFzFyS6r5yeXlfNdXm0ZXOtUH16nfDRG1wCGfaIJQD9qf52
         ga4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781298426; x=1781903226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Tj6zkGwC+MQnJs73nrGLlImgos2/lF/B5iXMsHRDAc=;
        b=dTLdC/U4aWGKff8haTxJKn4twkccwgR6YyUlGSEiDzEW/dshDY4JutNqLXSaJi7rsr
         wImuiCQw8Xtw/OJ0BBahv0r636sWBUwDIISlF7237EMfGqKQmHgWuu7xD+rE9yqP462A
         NhLzthsx0yzdtdb+Iv9JdqUFZf7HhV1uB8bQs+yUHb2LMaV9g4xEdZAyOSWnwj2rm+tN
         fG3Q9Otu/6iSMS5P1a2zWyxRSgHDOM6dxOn3O2cQNhw7YNliFNQrzdkMu4TUw+FKHHdK
         BXsJANkzHQpfx9G8tGDbRQIVgvCI/okePExtjttk0TL6wVv/G47ptLDsgdDZGeUUv78g
         eB3Q==
X-Gm-Message-State: AOJu0Yyu8GhNOxuHIvNimddheStXcny+3jDzqC0rXDy8dXGS5x1wpzLE
	3aNHebYGJP2B+87BFrQeU+Zbh6pToTrZTsDGbVEYygWjPNE0I2kQKEsGmytlWA==
X-Gm-Gg: Acq92OFc4jeOmlmqxPztzOOHr1EChVzmF7VsXbrr6wJFl7szuGHTSdvG4e9oMJkfWw+
	4jAQDvg+OJdDMEWLxkT69OiNyRt4rX5NG+ztkm4d/P/gH4S4SlYiplan1VZclVVjFmUnAWsY50U
	dh1SdwpDBT9+jR83GMV6bWSuZmlLEaHpzu2AxlbVbA8WlwQwIqyM0TVZAvvjcc5NHBQo1hYXbFd
	tah0xZU41WeeIDSHzi7aMq/X6X+i0R8KU1RvkSxMTc2nUQK6kqLElbsXxeq9OI/ynrg+vqfflg4
	W66e3FhN8PNeXOQwNZSo4jPCirClZYk+N7bKdm7ZMny9Pc0rQxntFkYFqKJnyrzqgNNHgzbRZQ2
	mUi5wDBIB7Pmt1oKKKOOr3+njT4RJUCPZqv9rJ8m7BFa/qkQBAQBmRoyqqcllLQPDgdb7+pNPtf
	RThsSBxPonQ/UbejmQjIwfvPBVm2HGuPBS8NSkXz+IQYLtGUPSdFntznNOuE4d5utNiIJUguGI+
	9E=
X-Received: by 2002:a17:903:15c8:b0:2c1:ef9:4516 with SMTP id d9443c01a7336-2c664227c1emr13975585ad.35.1781298425956;
        Fri, 12 Jun 2026 14:07:05 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:45::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac7fbsm31689715ad.42.2026.06.12.14.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 14:07:05 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	axboe@kernel.dk,
	jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	bernd@bsbernd.com
Subject: [PATCH v4 09/10] fuse: add zero-copy over io-uring
Date: Fri, 12 Jun 2026 14:05:12 -0700
Message-ID: <20260612210513.1516038-10-joannelkoong@gmail.com>
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

Implement zero-copy for fuse io-uring, eliminating memory copies between
userspace, the kernel, and the fuse server for read/write operations.
The server can directly access client pages or page cache folios without
copying data through an intermediary buffer. When a fuse request arrives,
the kernel registers the relevant pages into a sparse slot in the
server's io_uring registered buffer table. The server can then operate
on these pages directly using io-uring fixed buffer operations (eg
read_fixed/write_fixed) and the kernel unregisters these pages when the
request completes. Non-page-backed args (eg op out headers) will go
through the payload buffer as normal.

This requires CAP_SYS_ADMIN and FUSE_URING_REGISTERED_BUFFERS (which
requires using bufpools). Gating on registered buffers keeps the
configuration space small and avoids partially-optimized modes that are
unlikely to be useful in practice. This is gated behind CAP_SYS_ADMIN
because zero-copy allows the server direct access to the client's
underlying pages, rather than operating on an intermediary buffer that
the contents of the client's pages were copied into or on page cache
folios. Kernel support for zero copy is advertised to userspace via the
FUSE_HAS_IO_URING_BUFPOOL init flag (a single umbrella flag).

The request flow for the zero-copy write path (client writes data,
server reads it) is as follows:
=======================================================================
|  Kernel                                   |  FUSE server
|                                           |
|  "write(fd, buf, 1MB)"                    |
|                                           |
|  >sys_write()                             |
|    >fuse_file_write_iter()                |
|      >fuse_send_one()                     |
|        [req->args->in_pages = true]       |
|        [folios hold client write data]    |
|                                           |
|  >fuse_uring_copy_to_ring()               |
|    >copy_header_to_ring(IN_OUT)           |
|      [memcpy fuse_in_header]              |
|    >copy_header_to_ring(OP)               |
|      [memcpy write_in header]             |
|                                           |
|    >fuse_uring_args_to_ring()             |
|      >setup_fuse_copy_state()             |
|        [skip_folio_copy = true]           |
|                                           |
|      >fuse_uring_set_up_zero_copy()       |
|        [folio_get for each client folio]  |
|        [build bio_vec array from folios]  |
|        >io_buffer_register_bvec()         |
|          [register pages at
                 ent->zero_copy_index]      |
|        [ent->zero_copied = true]          |
|                                           |
|      >fuse_copy_args()                    |
|        [skip_folio_copy => return 0       |
|         for page arg, skip data copy]     |
|                                           |
|    >copy_header_to_ring(RING_ENT)         |
|      [memcpy ent_in_out]                  |
|    >io_uring_cmd_done()                   |
|                                           |
|                                           | [CQE received]
|                                           |
|                                           | [issue io_uring READ at
|                                           |  ent->zero_copy_index]
|                                           | [reads directly from
|                                           |client's pages (ZERO_COPY)]
|                                           |
|                                           | [write data to backing
|                                           | store]
|                                           |  [submit COMMIT AND FETCH]
|                                           |
|  >fuse_uring_commit_fetch()               |
|    >fuse_uring_commit()                   |
|      >fuse_uring_copy_from_ring()         |
|    >fuse_uring_req_end()                  |
|      >io_buffer_unregister(ent->zero_copy_index) |
|        [unregister sparse buffer]         |
|      >fuse_zero_copy_release()            |
|        [folio_put for each folio]         |
|      [ent->zero_copied = false]           |
|      >fuse_request_end()                  |
|        [wake up client]                   |

The zero-copy read path is analogous.

Some requests may have both page-backed args and non-page-backed args.
For these requests, the page-backed args are zero-copied while the
non-page-backed args are copied to the buffer selected from the buffer
ring:
    zero-copy: pages registered via io_buffer_register_bvec()
    non-page-backed: copied to payload buffer via fuse_copy_args()

For a request whose payload is zero-copied, the
registration/unregistration path looks like:

    register:  fuse_uring_set_up_zero_copy()
                 folio_get() for each folio
                 io_buffer_register_bvec(ent->zero_copy_index)

    unregister: fuse_uring_req_end()
                  io_buffer_unregister(ent->zero_copy_index)
                  -> fuse_zero_copy_release() callback
                     folio_put() for each folio

Please note that on abort for in-flight zero-copied requests that have
been sent to userspace, the registered bvec slot remains occupied and
its folios remain pinned until the io-uring ring is destroyed, at which
point io-uring unregisters all buffers and the fuse_zero_copy_release()
callback drops the folio references. Unregistering at teardown would
require operating on the ring context directly, whose validity is hard
to ascertain; this is deemed not worth the complexity for the abort
race, since everything is freed when the ring is torn down.

The throughput improvement from zero-copy depends on how much of the
per-request latency is spent on data copying vs backing I/O. When
backing I/O dominates, the saved memcpy is a negligible fraction of
overall latency. Please also note that for the server to read/write
into the zero-copied pages, the read/write must go through io-uring
as an IORING_OP_READ_FIXED / IORING_OP_WRITE_FIXED operation. If the
server's backing I/O is instantaneous (eg served from cache), the
overhead of the additional io_uring operation may negate the savings
from eliminating the memcpy.

In benchmarks using passthrough_hp on a high-performance NVMe-backed
system, zero-copy showed around a 35% throughput improvement for direct
randreads (~2150 MiB/s to ~2900 MiB/s), a 15% improvement for direct
sequential reads (~2510 MiB/s to ~2900 MiB/s), a 15% improvement for
buffered randreads (~2100 MiB/s to ~2470 MiB/s), and a 10% improvement
for buffered sequential reads (~2500 MiB/s to ~2750 MiB/s).

The benchmarks were run using:
  fio --name=test_run --ioengine=sync --rw=rand{read,write} --bs=1M
  --size=1G --numjobs=2 --ramp_time=30 --group_reporting=1

Reviewed-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev.c             |   7 +-
 fs/fuse/dev_uring.c       | 150 +++++++++++++++++++++++++++++++++++---
 fs/fuse/dev_uring_i.h     |   6 ++
 fs/fuse/fuse_dev_i.h      |   1 +
 include/uapi/linux/fuse.h |  14 +++-
 5 files changed, 162 insertions(+), 16 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5763a7cd3b37..58e599c35291 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1345,10 +1345,13 @@ int fuse_copy_args(struct fuse_copy_state *cs, unsigned numargs,
 
 	for (i = 0; !err && i < numargs; i++)  {
 		struct fuse_arg *arg = &args[i];
-		if (i == numargs - 1 && argpages)
+		if (i == numargs - 1 && argpages) {
+			if (cs->skip_folio_copy)
+				return 0;
 			err = fuse_copy_folios(cs, arg->size, zeroing);
-		else
+		} else {
 			err = fuse_copy_one(cs, arg->value, arg->size);
+		}
 	}
 	return err;
 }
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 9c79ec85e685..3e5e551e4e4d 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -30,6 +30,11 @@ struct fuse_uring_pdu {
 	struct fuse_ring_ent *ent;
 };
 
+struct fuse_zero_copy_bvs {
+	unsigned int nr_bvs;
+	struct bio_vec bvs[];
+};
+
 static const struct fuse_iqueue_ops fuse_io_uring_ops;
 
 enum fuse_uring_header_type {
@@ -51,6 +56,11 @@ static inline bool bufpool_registered_buffers(struct fuse_ring_queue *queue)
 	return queue->bufpool && queue->bufpool->registered_buffers;
 }
 
+static inline bool bufpool_zero_copy(struct fuse_ring_queue *queue)
+{
+	return queue->bufpool && queue->bufpool->use_zero_copy;
+}
+
 static void uring_cmd_set_ring_ent(struct io_uring_cmd *cmd,
 				   struct fuse_ring_ent *ring_ent)
 {
@@ -96,8 +106,18 @@ static void fuse_uring_flush_bg(struct fuse_ring_queue *queue)
 	}
 }
 
+static bool can_zero_copy_req(struct fuse_ring_ent *ent, struct fuse_req *req)
+{
+	struct fuse_args *args = req->args;
+
+	if (!bufpool_zero_copy(ent->queue))
+		return false;
+
+	return args->in_pages || args->out_pages;
+}
+
 static void fuse_uring_req_end(struct fuse_ring_ent *ent, struct fuse_req *req,
-			       int error)
+			       int error, unsigned int issue_flags)
 {
 	struct fuse_ring_queue *queue = ent->queue;
 	struct fuse_ring *ring = queue->ring;
@@ -117,6 +137,12 @@ static void fuse_uring_req_end(struct fuse_ring_ent *ent, struct fuse_req *req,
 
 	spin_unlock(&queue->lock);
 
+	if (ent->zero_copied) {
+		io_buffer_unregister(ent->cmd, ent->zero_copy_index,
+				     issue_flags);
+		ent->zero_copied = false;
+	}
+
 	if (error)
 		req->out.h.error = error;
 
@@ -329,6 +355,7 @@ static int fuse_uring_bufpool_setup(struct io_uring_cmd *cmd,
 	struct iovec iov[FUSE_URING_IOV_SEGS];
 	uintptr_t payload_addr;
 	size_t payload_size, ring_size;
+	bool zero_copy = init_flags & FUSE_URING_ZERO_COPY;
 	struct fuse_bufpool *pool;
 	unsigned int i;
 	int err;
@@ -343,7 +370,7 @@ static int fuse_uring_bufpool_setup(struct io_uring_cmd *cmd,
 	payload_addr = (uintptr_t)iov[FUSE_URING_IOV_PAYLOAD].iov_base;
 	payload_size = iov[FUSE_URING_IOV_PAYLOAD].iov_len;
 
-	if (payload_size < (uint64_t)buf_size * nr_bufs)
+	if (!zero_copy && (payload_size < (uint64_t)buf_size * nr_bufs))
 		return -EINVAL;
 
 	/* create the pool, which is managed as a ring buffer */
@@ -364,6 +391,7 @@ static int fuse_uring_bufpool_setup(struct io_uring_cmd *cmd,
 	pool->nbufs = nr_bufs;
 	pool->tail = nr_bufs;
 	pool->registered_buffers = init_flags & FUSE_URING_REGISTERED_BUFFERS;
+	pool->use_zero_copy = zero_copy;
 
 	queue->bufpool = pool;
 
@@ -381,9 +409,11 @@ static bool queue_init_flags_consistent(struct fuse_ring_queue *queue,
 {
 	bool bufpool = init_flags & FUSE_URING_BUFPOOL;
 	bool registered_buffers = init_flags & FUSE_URING_REGISTERED_BUFFERS;
+	bool zero_copy = init_flags & FUSE_URING_ZERO_COPY;
 
 	return bufpool_enabled(queue) == bufpool &&
-		bufpool_registered_buffers(queue) == registered_buffers;
+		bufpool_registered_buffers(queue) == registered_buffers &&
+		bufpool_zero_copy(queue) == zero_copy;
 }
 
 static struct fuse_ring_queue *
@@ -808,6 +838,9 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
 
 	fuse_copy_init(cs, dir == ITER_DEST, iter);
 
+	if (ent->zero_copied)
+		cs->skip_folio_copy = true;
+
 	cs->is_uring = true;
 	cs->req = req;
 
@@ -840,6 +873,64 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 	return err;
 }
 
+static void fuse_zero_copy_release(void *priv)
+{
+	struct fuse_zero_copy_bvs *zc_bvs = priv;
+	unsigned int i;
+
+	for (i = 0; i < zc_bvs->nr_bvs; i++)
+		folio_put(page_folio(zc_bvs->bvs[i].bv_page));
+
+	kfree(zc_bvs);
+}
+
+static int fuse_uring_set_up_zero_copy(struct fuse_ring_ent *ent,
+				       struct fuse_req *req,
+				       unsigned int issue_flags)
+{
+	struct fuse_args_pages *ap;
+	int err, i, ddir = 0;
+	struct fuse_zero_copy_bvs *zc_bvs;
+	struct bio_vec *bvs;
+
+	/* out_pages indicates a read, in_pages indicates a write */
+	if (req->args->out_pages)
+		ddir |= IO_BUF_DEST;
+	if (req->args->in_pages)
+		ddir |= IO_BUF_SOURCE;
+
+	WARN_ON_ONCE(!ddir);
+
+	ap = container_of(req->args, typeof(*ap), args);
+
+	zc_bvs = kmalloc(struct_size(zc_bvs, bvs, ap->num_folios),
+			 GFP_KERNEL_ACCOUNT);
+	if (!zc_bvs)
+		return -ENOMEM;
+
+	zc_bvs->nr_bvs = ap->num_folios;
+	bvs = zc_bvs->bvs;
+	for (i = 0; i < ap->num_folios; i++) {
+		bvs[i].bv_page = folio_page(ap->folios[i], 0);
+		bvs[i].bv_offset = ap->descs[i].offset;
+		bvs[i].bv_len = ap->descs[i].length;
+		folio_get(ap->folios[i]);
+	}
+
+	err = io_buffer_register_bvec(ent->cmd, bvs, ap->num_folios,
+				      fuse_zero_copy_release, zc_bvs,
+				      ddir, ent->zero_copy_index,
+				      issue_flags);
+	if (err) {
+		fuse_zero_copy_release(zc_bvs);
+		return err;
+	}
+
+	ent->zero_copied = true;
+
+	return 0;
+}
+
 /*
  * Copy data from the req to the ring buffer
  */
@@ -858,8 +949,15 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 		.commit_id = req->in.h.unique,
 	};
 
-	if (bufpool_enabled(ent->queue))
+	if (bufpool_enabled(ent->queue)) {
 		ent_in_out.buf_id = ent->payload_buf.id;
+		if (can_zero_copy_req(ent, req)) {
+			ent_in_out.flags |= FUSE_URING_ENT_ZERO_COPY;
+			err = fuse_uring_set_up_zero_copy(ent, req, issue_flags);
+			if (err)
+				return err;
+		}
+	}
 
 	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_DEST, &iter,
 				    issue_flags);
@@ -892,6 +990,10 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 	}
 
 	ent_in_out.payload_sz = cs.ring.copied_sz;
+	if (cs.skip_folio_copy && args->in_pages)
+		ent_in_out.payload_sz +=
+			args->in_args[args->in_numargs - 1].size;
+
 	return copy_header_to_ring(ent, FUSE_URING_HEADER_RING_ENT,
 				   &ent_in_out, sizeof(ent_in_out));
 }
@@ -927,11 +1029,25 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 				   sizeof(req->in.h));
 }
 
-static bool fuse_uring_req_has_payload(struct fuse_req *req)
+static bool fuse_uring_req_has_copyable_payload(struct fuse_ring_ent *ent,
+						struct fuse_req *req)
 {
 	struct fuse_args *args = req->args;
 
-	return args->in_numargs > 1 || args->out_numargs;
+	if (!can_zero_copy_req(ent, req))
+		return args->in_numargs > 1 || args->out_numargs;
+
+	/*
+	 * the asymmetry between in_numargs > 2 and out_numargs > 1 is because
+	 * the per-op header is extracted before fuse_copy_args() for inargs but
+	 * not for outargs
+	 */
+	if ((args->in_numargs > 1) && (!args->in_pages || args->in_numargs > 2))
+		return true;
+	if (args->out_numargs && (!args->out_pages || args->out_numargs > 1))
+		return true;
+
+	return false;
 }
 
 static int fuse_uring_select_buffer(struct fuse_ring_ent *ent)
@@ -989,7 +1105,7 @@ static int fuse_uring_next_req_update_buffer(struct fuse_ring_ent *ent,
 		return 0;
 
 	buffer_selected = !!ent->payload_buf.addr;
-	has_payload = fuse_uring_req_has_payload(req);
+	has_payload = fuse_uring_req_has_copyable_payload(ent, req);
 
 	if (has_payload && !buffer_selected)
 		return fuse_uring_select_buffer(ent);
@@ -1007,7 +1123,7 @@ static int fuse_uring_prep_buffer(struct fuse_ring_ent *ent,
 		return 0;
 
 	/* no payload to copy, can skip selecting a buffer */
-	if (!fuse_uring_req_has_payload(req))
+	if (!fuse_uring_req_has_copyable_payload(ent, req))
 		return 0;
 
 	return fuse_uring_select_buffer(ent);
@@ -1033,7 +1149,7 @@ static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
 		ent->state = FRRS_INVALID;
 		spin_unlock(&ent->queue->lock);
 
-		fuse_uring_req_end(ent, req, err);
+		fuse_uring_req_end(ent, req, err, issue_flags);
 	}
 
 	return err;
@@ -1141,7 +1257,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 
 	err = fuse_uring_copy_from_ring(ring, req, ent, issue_flags);
 out:
-	fuse_uring_req_end(ent, req, err);
+	fuse_uring_req_end(ent, req, err, issue_flags);
 }
 
 /*
@@ -1361,6 +1477,8 @@ static struct fuse_ring_ent *
 fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 			   struct fuse_ring_queue *queue)
 {
+	const struct fuse_uring_cmd_req *cmd_req =
+		io_uring_sqe128_cmd(cmd->sqe, struct fuse_uring_cmd_req);
 	struct fuse_ring *ring = queue->ring;
 	struct fuse_ring_ent *ent;
 	struct iovec iov[FUSE_URING_IOV_SEGS];
@@ -1403,19 +1521,27 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 		ent->payload = payload->iov_base;
 	}
 
+	if (bufpool_zero_copy(queue))
+		ent->zero_copy_index = READ_ONCE(cmd_req->init.zero_copy_index);
+
 	atomic_inc(&ring->queue_refs);
 	return ent;
 }
 
 static bool init_flags_valid(u64 init_flags)
 {
-	u64 valid_flags = FUSE_URING_BUFPOOL | FUSE_URING_REGISTERED_BUFFERS;
+	u64 valid_flags = FUSE_URING_BUFPOOL | FUSE_URING_REGISTERED_BUFFERS
+		| FUSE_URING_ZERO_COPY;
 	bool bufpool = init_flags & FUSE_URING_BUFPOOL;
 	bool registered_buffers = init_flags & FUSE_URING_REGISTERED_BUFFERS;
+	bool zero_copy = init_flags & FUSE_URING_ZERO_COPY;
 
 	if (registered_buffers && !bufpool)
 		return false;
 
+	if (zero_copy && (!registered_buffers || !capable(CAP_SYS_ADMIN)))
+		return false;
+
 	return !(init_flags & ~valid_flags);
 }
 
@@ -1573,7 +1699,7 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 
 		io_uring_cmd_done(cmd, err, issue_flags);
 
-		fuse_uring_req_end(ent, ent->fuse_req, err);
+		fuse_uring_req_end(ent, ent->fuse_req, err, issue_flags);
 		kfree(ent);
 		if (atomic_dec_and_test(&queue->ring->queue_refs))
 			wake_up_all(&queue->ring->stop_waitq);
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index f005dfa5f9df..81506ac4618e 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -45,6 +45,8 @@ struct fuse_bufpool_buf {
 /* implemented as a buffer ring */
 struct fuse_bufpool {
 	bool registered_buffers;
+	/* this is only allowed on privileged servers */
+	bool use_zero_copy;
 
 	/* metadata tracking state of the bufpool */
 	unsigned int nbufs;
@@ -65,6 +67,10 @@ struct fuse_ring_ent {
 		struct fuse_bufpool_buf payload_buf;
 	};
 
+	/* true if the request's pages are being zero-copied */
+	bool zero_copied;
+	unsigned int zero_copy_index;
+
 	/* the ring queue that owns the request */
 	struct fuse_ring_queue *queue;
 
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 668c8391d61c..00722fee572e 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -325,6 +325,7 @@ struct fuse_copy_state {
 	bool write:1;
 	bool move_folios:1;
 	bool is_uring:1;
+	bool skip_folio_copy:1;
 	struct {
 		unsigned int copied_sz; /* copied size into the user buffer */
 	} ring;
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index e4740a64d4a1..5b7b7b7d050c 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -246,6 +246,7 @@
  *  - add fuse_uring_cmd_req init struct
  *  - add buf_id field to fuse_uring_ent_in_out struct
  *  - add FUSE_URING_REGISTERED_BUFFERS flag
+ *  - add FUSE_URING_ZERO_COPY flag
  */
 
 #ifndef _LINUX_FUSE_H
@@ -454,8 +455,8 @@ struct fuse_file_lock {
  * FUSE_OVER_IO_URING: Indicate that client supports io-uring
  * FUSE_REQUEST_TIMEOUT: kernel supports timing out requests.
  *			 init_out.request_timeout contains the timeout (in secs)
- * FUSE_HAS_IO_URING_BUFPOOL: kernel supports io-uring buffer pools and
- *			      registered buffers
+ * FUSE_HAS_IO_URING_BUFPOOL: kernel supports io-uring buffer pools, registered
+ *			      buffers and zero-copy
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -1260,6 +1261,13 @@ struct fuse_supp_groups {
 #define FUSE_URING_IN_OUT_HEADER_SZ 128
 #define FUSE_URING_OP_IN_OUT_SZ 128
 
+/**
+ * fuse_uring_ent_in_out flags
+ *
+ * FUSE_URING_ENT_ZERO_COPY: Set if the ent's payload is zero-copied
+ */
+#define FUSE_URING_ENT_ZERO_COPY	(1 << 0)
+
 /* Used as part of the fuse_uring_req_header */
 struct fuse_uring_ent_in_out {
 	uint64_t flags;
@@ -1312,6 +1320,7 @@ enum fuse_uring_cmd {
 /* fuse_uring_cmd_req flags */
 #define FUSE_URING_BUFPOOL		(1 << 0)
 #define FUSE_URING_REGISTERED_BUFFERS	(1 << 1)
+#define FUSE_URING_ZERO_COPY		(1 << 2)
 
 /**
  * In the 80B command area of the SQE.
@@ -1330,6 +1339,7 @@ struct fuse_uring_cmd_req {
 		struct {
 			uint32_t buf_size;
 			uint16_t nr_bufs;
+			uint16_t zero_copy_index;
 		} init;
 	};
 };
-- 
2.52.0

