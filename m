Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F59270EC1
	for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 21:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854222; cv=none; b=YEKTn3m5cMdrsPR8ZaNLK6w5btFpYGzjX7Deii9mM7sLd+MX+7XRum+zkrSulTiPCzJCKgvl878OKxWZ9BkEY9UK349Oi0WNo9H1RC7U3fp88Mn/GRsy2Mo33JE44SQQtVdZQg3p9objrjzcNsQMEMmimyFKiF5XIMnKgIVwq5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854222; c=relaxed/simple;
	bh=e4J57Mm4PPACKqot9B03UI+chZ1iuAjS93n0qTqkHPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Roz4yxcrAfe80+ZW7bRBs45f0B2iv5t1e6SxZd1lriz/h++mB4l6o0tKIaL5kLfEow7qkTu5wSdkLvrMqeGHzPdkL3fSJMeTynzFYW7JlgdegfuAhmmxtjCO2Z0Uh7m3foYJt+O3VfCfiWcmmj+j/oWHtgKo/vbg/2m+SaqMG/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCV41eVB; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCV41eVB"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-69dead44101so4061025eaf.3
        for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 14:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782854219; x=1783459019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7vBgpoOe31lnQQtWU+1N8+zQZqXqz1EM/bdnmzFesM=;
        b=JCV41eVB6E8qSP/G5M3Z5Pq11M1BWUEVoTjmJYYee4B1d7asORDgbFhUfTR8F+lPzI
         99UK/Lwk6tiY5GFgCpr1zDlvFN6gc1f+PdRG1qG6sLhUGrb37LCCgHShu2poZT9yLTeT
         fHgdGZBtVaF835a3dhCI1544/dGXPY5x/I9JU1JnfNsb/gtMfn8Q7b5NLH9qPdO6Zxk5
         +yNZiZ6/8UtYAFYZ9gZxj7AwlFFGj53E+2SU8NT5InhecMohKueC1sYmm5NOvTZ+lbCE
         UybY9IeFLMIyYOwd1O/Caz0RSpBVcNRpfHZj8ltcDrWBjcPnYg20wskBPgMSbLSUNQ0S
         ishA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854219; x=1783459019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W7vBgpoOe31lnQQtWU+1N8+zQZqXqz1EM/bdnmzFesM=;
        b=FTK62NUtUm6wmWa0226s/lcQgxew5ZQyDav3+z4dGLiDNocZ1dbKnfCXuxerY/k9o1
         hHu0xdZAcV1a3aP6Wd/84myp0tL8Tj7cJ8qh/lmwl54mvHyZ0W75LcwOyID5VJNgxdYt
         +7MpkL5irQCo/bDRZd1ZJUy2FCA4jWC380u80ukIEb3qZMisIO023j8tm1Ke767imht5
         p0Hy7AkZUPGRtIbYXM2AKLWQjjSs3A9mOCfVt0Y1AR7r+eeAjeJkHF061MahIVR4viJc
         btgsUbSyVndiw5P34QgXXxfKUYPg9RLJCZtrHtbTjuuZVVDvJ0wDEjgSgg4y7ikSpDEv
         qHZA==
X-Forwarded-Encrypted: i=1; AFNElJ8yocXoWjFhrDB37dIzG1/i90Y7leWjyWD/UWmVFXjdzSZvxcqths4c93JUG9fCdI0qJt7lSB5U9hPw@lists.linux.dev
X-Gm-Message-State: AOJu0Yw09HJHWU6i/s8Au4C1QnRZ+uOX0yNeQPA+4zrpqvT5m/Mv6em6
	kddMLlUMeb9RGxyWLjhX0lUFuUmfvFRnVm2VQ6XuDgruZF8gFoarX1ma
X-Gm-Gg: AfdE7cmN1PiDyKrnUp99oJgeps+AlGnpn0U/H7VVLHemqQAcBU3xnjTdl8zooN+idgq
	g3Zun58GwNX64Nm+4FkuadeiK5YVz2FTCKME6pDNefqAzSDFAJoDNRSh5bUyxZWh+9cf3uToDqC
	H472SQ4EK6BjZsFYXRKC5JzHF+RJGBVNBnwpWnThq/FEcVGDxFOPFoctRzCjzO/JT203K4/ThG+
	IIjhPgG6P+WcpG1J6E66yR0AmAc+TTai8TVjHmOgmEkSxp56XUOkWxO2+NnZKng7fRNcMMfI/MX
	A+byAKEuQN+ThaLpGhjo9SHmfnZZminfzrFjF+/VyxI6F2eN5p6Y6+rgsRHmmZ6nh+3ldbNewic
	+2WvR2CsGif4PDedVPqVfaK0hgWk8m9EjvTuRjmhDSC2I2j7F3jMRcND6Zbd0S75VUWlAfqNoV7
	P/zVwcCaNVaBrNx/iuQMxelFl5cds3OAE2gn04SD9W6jnhwSZ1i24lKxWX3WQiJcZH
X-Received: by 2002:a05:6820:4b84:b0:6a1:7f97:6e5a with SMTP id 006d021491bc7-6a196ccec26mr1444726eaf.62.1782854219096;
        Tue, 30 Jun 2026 14:16:59 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:73::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebfd01cdsm3272320a34.8.2026.06.30.14.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:16:58 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v5 5/6] fuse: add zero-copy over io-uring
Date: Tue, 30 Jun 2026 14:14:34 -0700
Message-ID: <20260630211436.2062816-6-joannelkoong@gmail.com>
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

Implement zero-copy in fuse io-uring to eliminate memory copies between
the application, kernel, and server for read/write operations. The
server can directly access client pages or page cache folios without
copying data through an intermediary buffer. When a fuse request arrives,
the kernel registers the relevant pages into a sparse slot in the
server's io_uring registered buffer table. The server can then operate
on these pages directly using io-uring fixed buffer operations (eg
read_fixed/write_fixed) and the kernel unregisters these pages when the
request completes. Non-page-backed args (eg op out headers) will go
through the payload buffer as normal. The server can specify which open
files should have their reads/writes go through zero-copy, by setting
the FOPEN_IO_URING_ZERO_COPY flag when servicing opens.

This requires CAP_SYS_ADMIN and bufpools. This is gated behind
CAP_SYS_ADMIN because zero-copy allows the server direct access to the
client's underlying pages, rather than operating on an intermediary
buffer that the contents of the client's pages were copied into or on
page cache folios.

The request flow for the zero-copy direct-io write path (client writes
data, server reads it) is as follows:
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
|        [unregister pages from index]      |
|      >fuse_zero_copy_release()            |
|        [folio_put for each folio]         |
|      [ent->zero_copied = false]           |
|      >fuse_request_end()                  |
|        [wake up client]                   |

The zero-copy read path is analogous.

Some requests may have both page-backed args and non-page-backed args.
For these requests, the page-backed args are zero-copied while the
non-page-backed args are copied to the buffer selected from the buffer
pool:
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
per-request latency is spent on data copying vs backing I/O. The gain
comes from eliminating the payload-buffer memcpy,  but accessing the
zero-copied pages requires the server to issue the read/write as an
IORING_OP_READ/WRITE_FIXED operation. The benefit is largest when the
mempcy is a meaningful fraction of per-request latency while backing i/o
is still noticable enough that the extra io-uring op's overhead doesn't
dominate.

Benchmarked with passthrough_hp (--nopassthrough, q_depth=8) on a
2-socket Intel Xeon Gold 6138 (40 cores / 80 threads), using fio (sync
engine, bs=1M, O_DIRECT, numjobs=2, 30s run + 10s ramp, 3 runs) where
direct-I/O throughput is against a RAM-backed (tmpfs) source (backing
I/O is not the bottleneck):

		baseline   registered-buf   zero-copy   (zc vs base)
direct read     ~5.1 GB/s  ~5.4 GB/s        ~8.9 GB/s   (+75%)
direct write    ~3.4 GB/s  ~4.8 GB/s        ~5.1 GB/s   (+50%)

Reads end up higher than writes because the backing store reads faster
than it writes (the baseline shows the same read>write gap, and the raw
device does too). On a device-bound NVMe (~2 GB/s reads) the read gain
shrinks to ~10-16% (and no measurable gains for writes), as backing I/O
rather than the eliminated copy dominates latency.

The benefit overall scales with how much of the
per-request latency is the data copy versus backing I/O.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/args.h            |   2 +
 fs/fuse/dev.c             |  19 +++-
 fs/fuse/dev_uring.c       | 184 +++++++++++++++++++++++++++++++++++---
 fs/fuse/dev_uring_i.h     |   6 ++
 fs/fuse/file.c            |   2 +
 fs/fuse/fuse_dev_i.h      |   1 +
 include/uapi/linux/fuse.h |  34 +++++++
 7 files changed, 232 insertions(+), 16 deletions(-)

diff --git a/fs/fuse/args.h b/fs/fuse/args.h
index ecfe51a192af..5173264a1261 100644
--- a/fs/fuse/args.h
+++ b/fs/fuse/args.h
@@ -42,6 +42,8 @@ struct fuse_args {
 	bool is_pinned:1;
 	bool invalidate_vmap:1;
 	bool abort_on_kill:1;
+	/* server requested io-uring zero-copy for this op */
+	bool zero_copy:1;
 	struct fuse_in_arg in_args[4];
 	struct fuse_arg out_args[2];
 	void (*end)(struct fuse_args *args, int error);
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 9ab1f1f551ce..e9f8adbd42e3 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1247,11 +1247,20 @@ int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
 
 	if (folio) {
 		size = folio_size(folio);
-		if (zeroing && count < size)
-			folio_zero_range(folio, 0, size);
+		if (zeroing && count < size) {
+			if (cs->skip_folio_copy) {
+				if (offset)
+					folio_zero_range(folio, 0, offset);
+				if (offset + count < size)
+					folio_zero_range(folio, offset + count,
+							 size - offset - count);
+			} else {
+				folio_zero_range(folio, 0, size);
+			}
+		}
 	}
 
-	while (count) {
+	while (!cs->skip_folio_copy && count) {
 		if (cs->write && cs->pipebufs && folio) {
 			/*
 			 * Can't control lifetime of pipe buffers, so always
@@ -1344,6 +1353,10 @@ int fuse_copy_args(struct fuse_copy_state *cs, unsigned numargs,
 	for (i = 0; !err && i < numargs; i++)  {
 		struct fuse_arg *arg = &args[i];
 		if (i == numargs - 1 && argpages)
+			/*
+			 * if cs->skip_folio_copy is set, this just does any
+			 * needed zeroing. No copying is involved.
+			 */
 			err = fuse_copy_folios(cs, arg->size, zeroing);
 		else
 			err = fuse_copy_one(cs, arg->value, arg->size);
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e07bb6dc53a1..6b5387409808 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -23,6 +23,7 @@ MODULE_PARM_DESC(enable_uring,
 #define FUSE_URING_IOV_PAYLOAD 1
 
 #define FUSE_URING_ADD_BUFPOOL_FLAGS	(FUSE_URING_REGISTERED_BUFPOOL)
+#define FUSE_URING_ADD_QUEUE_FLAGS	(FUSE_URING_ZERO_COPY)
 
 bool fuse_uring_enabled(void)
 {
@@ -33,6 +34,11 @@ struct fuse_uring_pdu {
 	struct fuse_ring_ent *ent;
 };
 
+struct fuse_zero_copy_bvs {
+	unsigned int nr_bvs;
+	struct bio_vec bvs[];
+};
+
 static const struct fuse_iqueue_ops fuse_io_uring_ops;
 
 enum fuse_uring_header_type {
@@ -115,8 +121,39 @@ static void fuse_uring_flush_bg(struct fuse_ring_queue *queue)
 	}
 }
 
+static bool can_zero_copy_req(struct fuse_ring_ent *ent, struct fuse_req *req)
+{
+	struct fuse_args *args = req->args;
+
+	if (!ent->queue->zero_copy || !args->zero_copy)
+		return false;
+
+	if (args->opcode != FUSE_READ && args->opcode != FUSE_WRITE)
+		return false;
+
+	if (WARN_ON_ONCE(!args->in_pages && !args->out_pages))
+		return false;
+
+	return true;
+}
+
+static void zero_copy_unregister(struct io_uring_cmd *cmd,
+				 struct fuse_ring_ent *ent,
+				 unsigned int issue_flags)
+{
+	if (ent->zero_copied) {
+		int err = io_buffer_unregister(cmd, ent->zero_copy_index,
+					       issue_flags);
+
+		if (err)
+			pr_warn_ratelimited("qid=%d zero-copy unregister failed: %d\n",
+					    ent->queue->qid, err);
+		ent->zero_copied = false;
+	}
+}
+
 static void fuse_uring_req_end(struct fuse_ring_ent *ent, struct fuse_req *req,
-			       int error)
+			       int error, unsigned int issue_flags)
 {
 	struct fuse_ring_queue *queue = ent->queue;
 	struct fuse_ring *ring = queue->ring;
@@ -136,6 +173,8 @@ static void fuse_uring_req_end(struct fuse_ring_ent *ent, struct fuse_req *req,
 
 	spin_unlock(&queue->lock);
 
+	zero_copy_unregister(ent->cmd, ent, issue_flags);
+
 	if (error)
 		req->out.h.error = error;
 
@@ -311,7 +350,7 @@ void fuse_uring_conn_init(struct fuse_chan *fch)
 }
 
 static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
-						       int qid,
+						       int qid, bool zero_copy,
 						       bool fail_if_exists)
 {
 	struct fuse_chan *fch = ring->chan;
@@ -330,6 +369,7 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 	queue->qid = qid;
 	queue->ring = ring;
 	spin_lock_init(&queue->lock);
+	queue->zero_copy = zero_copy;
 
 	INIT_LIST_HEAD(&queue->ent_avail_queue);
 	INIT_LIST_HEAD(&queue->ent_commit_queue);
@@ -713,6 +753,9 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
 
 	fuse_copy_init(cs, dir == ITER_DEST, iter);
 
+	if (ent->zero_copied)
+		cs->skip_folio_copy = true;
+
 	cs->is_uring = true;
 	cs->req = req;
 
@@ -744,6 +787,62 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
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
@@ -762,6 +861,13 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 		.commit_id = req->in.h.unique,
 	};
 
+	if (can_zero_copy_req(ent, req)) {
+		ent_in_out.flags |= FUSE_URING_ENT_ZERO_COPY;
+		err = fuse_uring_set_up_zero_copy(ent, req, issue_flags);
+		if (err)
+			return err;
+	}
+
 	err = setup_fuse_copy_state(&cs, req, ent, ITER_DEST, &iter,
 				    issue_flags);
 	if (err)
@@ -793,6 +899,18 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 	}
 
 	ent_in_out.payload_sz = cs.ring.copied_sz;
+	/*
+	 * on a zero-copied write the pages are registered for the server to
+	 * read via a fixed-buffer op rather than copied into the payload
+	 * buffer, so copied_sz does not account for it. The server still needs
+	 * the total inbound size to know how many bytes to read from the
+	 * registered buffer, so add the page arg (always the last in-arg) back
+	 * in
+	 */
+	if (cs.skip_folio_copy && args->in_pages)
+		ent_in_out.payload_sz +=
+			args->in_args[args->in_numargs - 1].size;
+
 	if (bufpool_enabled(ent->queue) && ent->payload.iov_base)
 		ent_in_out.offset =
 			(uintptr_t)ent->payload.iov_base - ent->queue->bufpool->base_uaddr;
@@ -831,11 +949,25 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
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
@@ -892,7 +1024,7 @@ static int fuse_uring_next_req_update_buffer(struct fuse_ring_ent *ent,
 		return 0;
 
 	buffer_selected = !!ent->payload.iov_base;
-	has_payload = fuse_uring_req_has_payload(req);
+	has_payload = fuse_uring_req_has_copyable_payload(ent, req);
 
 	if (has_payload && !buffer_selected)
 		return fuse_uring_select_buffer(ent);
@@ -910,7 +1042,7 @@ static int fuse_uring_prep_buffer(struct fuse_ring_ent *ent,
 		return 0;
 
 	/* no payload to copy, can skip selecting a buffer */
-	if (!fuse_uring_req_has_payload(req))
+	if (!fuse_uring_req_has_copyable_payload(ent, req))
 		return 0;
 
 	return fuse_uring_select_buffer(ent);
@@ -936,7 +1068,7 @@ static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
 		ent->state = FRRS_INVALID;
 		spin_unlock(&ent->queue->lock);
 
-		fuse_uring_req_end(ent, req, err);
+		fuse_uring_req_end(ent, req, err, issue_flags);
 	}
 
 	return err;
@@ -1035,7 +1167,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 
 	err = fuse_uring_copy_from_ring(req, ent, issue_flags);
 out:
-	fuse_uring_req_end(ent, req, err);
+	fuse_uring_req_end(ent, req, err, issue_flags);
 }
 
 /*
@@ -1158,7 +1290,12 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 				    queue->qid, commit_id, ent->state);
 		fuse_uring_recycle_buffer(ent);
 		spin_unlock(&queue->lock);
-		fuse_uring_req_end(ent, req, err);
+		/*
+		 * Unregister any zero copyable pages since ent->cmd is null
+		 * when it hits fuse_uring_req_end() in this path
+		 */
+		zero_copy_unregister(cmd, ent, issue_flags);
+		fuse_uring_req_end(ent, req, err, issue_flags);
 		return err;
 	}
 
@@ -1282,10 +1419,14 @@ static struct fuse_ring_ent *
 fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 			   struct fuse_ring_queue *queue)
 {
+	const struct fuse_uring_cmd_req *cmd_req =
+		io_uring_sqe128_cmd(cmd->sqe, struct fuse_uring_cmd_req);
 	struct fuse_ring *ring = queue->ring;
 	struct fuse_ring_ent *ent;
 	struct iovec iov[FUSE_URING_IOV_SEGS];
 	struct iovec *headers, *payload;
+	unsigned int zero_copy_index;
+
 	int err;
 
 	err = fuse_uring_get_iovec_from_sqe(cmd->sqe, iov);
@@ -1295,6 +1436,10 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 		return ERR_PTR(err);
 	}
 
+	zero_copy_index = READ_ONCE(cmd_req->ent_zero_copy_buf_index);
+	if (zero_copy_index && !queue->zero_copy)
+		return ERR_PTR(-EINVAL);
+
 	err = -EINVAL;
 	headers = &iov[FUSE_URING_IOV_HEADERS];
 	if (headers->iov_len < sizeof(struct fuse_uring_req_header)) {
@@ -1313,9 +1458,14 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 		}
 	} else {
 		if (payload->iov_len < ring->max_payload_sz) {
+			spin_unlock(&queue->lock);
 			pr_info_ratelimited("Invalid req payload len %zu\n",
 					    payload->iov_len);
+			return ERR_PTR(err);
+		}
+		if (queue->zero_copy) {
 			spin_unlock(&queue->lock);
+			pr_info_ratelimited("Can only use zero copy with bufpools\n");
 			return ERR_PTR(err);
 		}
 		queue->payload_mode = FUSE_PAYLOAD_PER_ENT;
@@ -1333,6 +1483,7 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 	ent->headers = headers->iov_base;
 	if (queue->payload_mode == FUSE_PAYLOAD_PER_ENT)
 		ent->payload = *payload;
+	ent->zero_copy_index = zero_copy_index;
 
 	atomic_inc(&ring->queue_refs);
 	return ent;
@@ -1362,7 +1513,7 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 
 	queue = ring->queues[qid];
 	if (!queue) {
-		queue = fuse_uring_create_queue(ring, qid, false);
+		queue = fuse_uring_create_queue(ring, qid, false, false);
 		if (IS_ERR(queue))
 			return PTR_ERR(queue);
 	}
@@ -1387,8 +1538,9 @@ static int fuse_uring_add_queue(struct io_uring_cmd *cmd, struct fuse_chan *fch)
 	unsigned int qid = READ_ONCE(cmd_req->qid);
 	uint64_t flags = READ_ONCE(cmd_req->flags);
 	struct fuse_ring_queue *queue;
+	bool zero_copy = flags & FUSE_URING_ZERO_COPY;
 
-	if (!ring || flags)
+	if (!ring)
 		return -EINVAL;
 
 	if (qid >= ring->nr_queues) {
@@ -1396,7 +1548,13 @@ static int fuse_uring_add_queue(struct io_uring_cmd *cmd, struct fuse_chan *fch)
 		return -EINVAL;
 	}
 
-	queue = fuse_uring_create_queue(ring, qid, true);
+	if (flags & ~FUSE_URING_ADD_QUEUE_FLAGS)
+		return -EINVAL;
+
+	if (zero_copy && !capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	queue = fuse_uring_create_queue(ring, qid, zero_copy, true);
 	if (IS_ERR(queue))
 		return PTR_ERR(queue);
 
@@ -1591,7 +1749,7 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 
 		io_uring_cmd_done(cmd, err, issue_flags);
 
-		fuse_uring_req_end(ent, ent->fuse_req, err);
+		fuse_uring_req_end(ent, ent->fuse_req, err, issue_flags);
 		kfree(ent);
 		if (atomic_dec_and_test(&queue->ring->queue_refs))
 			wake_up_all(&queue->ring->stop_waitq);
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index e142cae43022..263d0f8b9714 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -79,6 +79,10 @@ struct fuse_ring_ent {
 	/* buffer id in the pool, if bufpools are used. ignored otherwise */
 	unsigned int buf_id;
 
+	/* true if the request's pages are being zero-copied */
+	bool zero_copied;
+	unsigned int zero_copy_index;
+
 	/* the ring queue that owns the request */
 	struct fuse_ring_queue *queue;
 
@@ -142,6 +146,8 @@ struct fuse_ring_queue {
 
 	/* only allocated when payload_mode == FUSE_PAYLOAD_BUFPOOL */
 	struct fuse_bufpool *bufpool;
+
+	bool zero_copy;
 };
 
 /*
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index cb8da4c06d17..791564f11398 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -605,6 +605,7 @@ void fuse_read_args_fill(struct fuse_io_args *ia, struct file *file, loff_t pos,
 	args->out_argvar = true;
 	args->out_numargs = 1;
 	args->out_args[0].size = count;
+	args->zero_copy = ff->open_flags & FOPEN_IO_URING_ZERO_COPY;
 }
 
 static void fuse_release_user_pages(struct fuse_args_pages *ap, ssize_t nres,
@@ -1159,6 +1160,7 @@ static void fuse_write_args_fill(struct fuse_io_args *ia, struct fuse_file *ff,
 	args->out_numargs = 1;
 	args->out_args[0].size = sizeof(ia->write.out);
 	args->out_args[0].value = &ia->write.out;
+	args->zero_copy = ff->open_flags & FOPEN_IO_URING_ZERO_COPY;
 }
 
 static unsigned int fuse_write_flags(struct kiocb *iocb)
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
index 07d12f1c55bb..7b842c3f303d 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -247,6 +247,8 @@
  *  - add fuse_uring_cmd_req bufpool struct
  *  - add bufpool offset field to fuse_uring_ent_in_out struct
  *  - add FUSE_URING_REGISTERED_BUFPOOL flag
+ *  - add FUSE_URING_ZERO_COPY, FUSE_URING_ENT_ZERO_COPY, and
+ *    FOPEN_IO_URING_ZERO_COPY flag
  */
 
 #ifndef _LINUX_FUSE_H
@@ -390,6 +392,12 @@ struct fuse_file_lock {
  * FOPEN_NOFLUSH: don't flush data cache on close (unless FUSE_WRITEBACK_CACHE)
  * FOPEN_PARALLEL_DIRECT_WRITES: Allow concurrent direct writes on the same inode
  * FOPEN_PASSTHROUGH: passthrough read/write io for this open file
+ * FOPEN_IO_URING_ZERO_COPY: use io-uring zero-copy for reads/writes on this
+ *                           open file. Honored only when the serving io-uring
+ *                           queue was set up for zero-copy
+ *                           (FUSE_URING_ZERO_COPY) and the request carries page
+ *                           payload. Otherwise reads/writes fall back to
+ *                           copying.
  */
 #define FOPEN_DIRECT_IO		(1 << 0)
 #define FOPEN_KEEP_CACHE	(1 << 1)
@@ -399,6 +407,7 @@ struct fuse_file_lock {
 #define FOPEN_NOFLUSH		(1 << 5)
 #define FOPEN_PARALLEL_DIRECT_WRITES	(1 << 6)
 #define FOPEN_PASSTHROUGH	(1 << 7)
+#define FOPEN_IO_URING_ZERO_COPY (1 << 8)
 
 /**
  * INIT request/reply flags
@@ -1260,6 +1269,13 @@ struct fuse_supp_groups {
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
@@ -1314,6 +1330,14 @@ enum fuse_uring_cmd {
 /* fuse_uring_cmd_req flags for FUSE_IO_URING_CMD_ADD_BUFPOOL */
 #define FUSE_URING_REGISTERED_BUFPOOL	(1 << 0)
 
+/*
+ * fuse_uring_cmd_req flags for FUSE_IO_URING_CMD_ADD_QUEUE
+ *
+ * FUSE_URING_ZERO_COPY is only supported for queues with bufpools on privileged
+ * servers
+ */
+#define FUSE_URING_ZERO_COPY		(1 << 0)
+
 /**
  * In the 80B command area of the SQE.
  */
@@ -1333,6 +1357,16 @@ struct fuse_uring_cmd_req {
 			uint64_t uaddr;
 			uint32_t len;
 		} bufpool;
+
+		/*
+		 * Index of this entry's slot in the server's io_uring
+		 * registered buffer table, where the kernel registers the
+		 * request's pages for zero-copy. Set for
+		 * FUSE_IO_URING_CMD_REGISTER cmds only, and only on queues
+		 * created with FUSE_URING_ZERO_COPY. On a non-zero-copy queue
+		 * this must be 0
+		 */
+		uint16_t ent_zero_copy_buf_index;
 	};
 };
 
-- 
2.52.0

