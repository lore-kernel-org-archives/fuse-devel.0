Received: from smtp02-ext3.udag.de (smtp02-ext3.udag.de [62.146.106.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3093BF696
	for <fuse-devel@lists.linux.dev>; Thu,  4 Jun 2026 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566379; cv=none; b=m2MvriO7b+vrp7v69a328RdU9nqbFjQEG22ZfG6Nxl8+vmbAyKtT930A9LPmVv1m5+x6YjeJSABUUpn56lxToAPLvO/sEZytPm6C3EDR1zVY4EcL8xbicIcJqxmoTQDk8Ipg+zenANF7VOsCM0JZaEkPJh0dkNiXt1Y1sCT9SXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566379; c=relaxed/simple;
	bh=3qy1TSa/3OBLwOMgwqdx7kcEEP2+b2bJNQJyPivjeR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i//pzWriPTXlrKqYLX4rEFCuM2+RoXR/oFhAHNXNCsq/Csc1FKA468y1XSPlvtN32RA3B2Ge1/Uc+7r6jH1wVLhCmx5wmvk976CwGr8+NJJUKWyrUhaj9rRl0ojZ/hTY3UwD8V3pIiJq1jNvFtVec05gKM7kNfJyfO4C0KC8OX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.com; spf=pass smtp.mailfrom=birthelmer.com; dkim=pass (2048-bit key) header.d=birthelmer.com header.i=@birthelmer.com header.b=VmFSAf3U; arc=none smtp.client-ip=62.146.106.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birthelmer.com header.i=@birthelmer.com header.b="VmFSAf3U"
Received: from fedora.fritz.box (065-142-067-156.ip-addr.inexio.net [156.67.142.65])
	by smtp02-ext3.udag.de (Postfix) with ESMTPA id 12008E05A4;
	Thu,  4 Jun 2026 11:46:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=birthelmer.com;
	s=uddkim-202310; t=1780566370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmUkGassz6a2ba4561xprEeQfCc9tIACqIF0rHcQMP0=;
	b=VmFSAf3U+ga4BjWSG3yJpwlGYsBmHyx4e03L6kbYM8zdLrqnbHWzJCQAQ0OL6r5UIOaLUa
	1B1hLn3tddUx1qk7ZXcSOH4VhEyguHQoA71TaEvteW+cdGopqnkKF8js2us1ks2inPE3Bv
	3OjS2J9vN1TUq9cgFOUoRZtgCxsBbuEtoA6P84cq/7b+5Gri7DM5VvwAT52O6zzyP6Br2m
	gmGWhpcD2TeJQYV0cKJN1dILcSRNVgpdqpj2q76EZFxykA06xSGtoNCYAOjbePux1BSkGg
	jPK0+vw3V/3jcb26rueMRCwa79jtV4NlRrxaEkdqVNLzhxZ+mMKlGYh+5vaGYQ==
Authentication-Results: smtp02-ext3.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.com
From: Horst Birthelmer <horst@birthelmer.com>
Date: Thu, 04 Jun 2026 11:45:42 +0200
Subject: [PATCH v7 1/4] fuse: add compound command to combine multiple
 requests
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-fuse-compounds-upstream-v7-1-27331d085c2a@ddn.com>
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
In-Reply-To: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
 Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>
Cc: linux-kernel@vger.kernel.org, fuse-devel@lists.linux.dev, 
 Horst Birthelmer <hbirthelmer@ddn.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780566367; l=21860;
 i=hbirthelmer@ddn.com; s=20251006; h=from:subject:message-id;
 bh=+4eAUxUEVvaDUdQ21O3P2PJbWVwxSJMmO1LJgm0JwBI=;
 b=9rwYVfaowtAdGhOlFCGw8vn6tB1BHTVbPxL+iWd9wQvSoi5IodeB3Lzfl/OIidWdHKd/ZTxwP
 ZA/qJBIIuYmB7YdEt6EU74lGH1M+woYBRC19EAexN93tkYrfLW6IUN4
X-Developer-Key: i=hbirthelmer@ddn.com; a=ed25519;
 pk=v3BVDFoy16EzgHZ23ObqW+kbpURtjrwxgKu8YNDKjGg=

From: Horst Birthelmer <hbirthelmer@ddn.com>

Introduce FUSE_COMPOUND, a meta-opcode that bundles several FUSE
operations into a single request/response round trip.  The wire
format is:

  fuse_in_header (opcode FUSE_COMPOUND)
  fuse_compound_in (reserved metadata)
    fuse_compound_req_in (per-subop header)
    fuse_in_header (per-subop opcode/nodeid/credentials)
    payload
    ... (repeated per subop)

Each call site supplies an array of

  struct fuse_compound_op {
    struct fuse_args *arg;
    int              *error;
    u8                dep_index;
  };

where @dep_index is FUSE_COMPOUND_NO_DEP or the index of an earlier
subop whose output should be threaded into this subop's input
(currently only the producing op's nodeid is propagated).  Per-subop
status is reported via *error.

The reply mirrors the request:

  fuse_out_header (compound status)
  fuse_compound_out (reserved metadata)
    fuse_out_header (per-subop status)
    payload
    ... (repeated per subop)

If the server returns -ENOSYS, FUSE_COMPOUND is disabled for the
connection and each subop is dispatched individually via
fuse_simple_request().  -EOPNOTSUPP signals that this specific
combination is unsupported and triggers per-request legacy dispatch
without disabling the feature.  The legacy path validates that
dep_index refers to a strictly earlier subop and warns otherwise.

Signed-off-by: Horst Birthelmer <hbirthelmer@ddn.com>
---
 fs/fuse/Makefile          |   2 +-
 fs/fuse/compound.c        | 126 ++++++++++++++++++++++++++++
 fs/fuse/dev.c             | 206 +++++++++++++++++++++++++++++++++++++++++++---
 fs/fuse/dev_uring.c       |  31 ++++++-
 fs/fuse/fuse_dev_i.h      |   5 ++
 fs/fuse/fuse_i.h          |  32 +++++++
 fs/fuse/inode.c           |   9 ++
 include/uapi/linux/fuse.h |  56 +++++++++++++
 8 files changed, 452 insertions(+), 15 deletions(-)

diff --git a/fs/fuse/Makefile b/fs/fuse/Makefile
index 22ad9538dfc4..4c09038ef995 100644
--- a/fs/fuse/Makefile
+++ b/fs/fuse/Makefile
@@ -11,7 +11,7 @@ obj-$(CONFIG_CUSE) += cuse.o
 obj-$(CONFIG_VIRTIO_FS) += virtiofs.o
 
 fuse-y := trace.o	# put trace.o first so we see ftrace errors sooner
-fuse-y += dev.o dir.o file.o inode.o control.o xattr.o acl.o readdir.o ioctl.o
+fuse-y += dev.o dir.o file.o inode.o control.o xattr.o acl.o readdir.o ioctl.o compound.o
 fuse-y += iomode.o
 fuse-$(CONFIG_FUSE_DAX) += dax.o
 fuse-$(CONFIG_FUSE_PASSTHROUGH) += passthrough.o backing.o
diff --git a/fs/fuse/compound.c b/fs/fuse/compound.c
new file mode 100644
index 000000000000..debf2a19846d
--- /dev/null
+++ b/fs/fuse/compound.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * FUSE: Filesystem in Userspace
+ * Copyright (C) 2025-2026
+ *
+ * Compound operations for FUSE - batch multiple operations into a single
+ * request to reduce round trips between kernel and userspace.
+ */
+
+#include "fuse_i.h"
+
+/*
+ * Copy the nodeid from a producing subop's output into a dependent
+ * subop's input.  Only entry-producing opcodes are recognised; depending
+ * on a non-entry op is a caller bug and triggers a warning so the bad
+ * dispatch is visible instead of silently sending nodeid 0.
+ */
+static void fuse_compound_propagate_nodeid(struct fuse_args *dep,
+					   const struct fuse_args *src)
+{
+	const struct fuse_entry_out *entry_out;
+
+	if (src->out_numargs == 0)
+		return;
+
+	switch (src->opcode) {
+	case FUSE_LOOKUP:
+	case FUSE_MKNOD:
+	case FUSE_MKDIR:
+	case FUSE_SYMLINK:
+	case FUSE_LINK:
+	case FUSE_CREATE:
+	case FUSE_TMPFILE:
+		entry_out = src->out_args[0].value;
+		if (entry_out)
+			dep->nodeid = entry_out->nodeid;
+		break;
+	default:
+		WARN_ONCE(1, "fuse: compound dep on non-entry opcode %u\n",
+			  src->opcode);
+		break;
+	}
+}
+
+/* Fallback: dispatch each subop individually as a normal FUSE request. */
+static void fuse_compound_send_legacy(struct fuse_mount *fm,
+				      struct fuse_compound_op *ops,
+				      unsigned int count)
+{
+	unsigned int i;
+
+	for (i = 0; i < count; i++) {
+		struct fuse_compound_op *cur = &ops[i];
+
+		if (cur->dep_index != FUSE_COMPOUND_NO_DEP) {
+			struct fuse_compound_op *dep;
+
+			/*
+			 * dep_index must refer to an earlier subop in the
+			 * same compound so its result is already available.
+			 * A forward or self reference is a caller bug; fail
+			 * the subop loudly instead of reading uninitialised
+			 * memory.
+			 */
+			if (WARN_ON_ONCE(cur->dep_index >= i)) {
+				*cur->error = -EINVAL;
+				continue;
+			}
+			dep = &ops[cur->dep_index];
+
+			if (*dep->error) {
+				*cur->error = *dep->error;
+				continue;
+			}
+			fuse_compound_propagate_nodeid(cur->arg, dep->arg);
+		}
+		*cur->error = fuse_simple_request(fm, cur->arg);
+	}
+}
+
+/*
+ * Send a compound request.  Per-subop status is reported via the @error
+ * pointer of each fuse_compound_op; the return value is 0 if the
+ * compound was dispatched (whether server-side or via the legacy
+ * fallback) and a negative errno only if dispatch itself failed.
+ *
+ * Server-side decline signaling:
+ *   -ENOSYS      Compound is not implemented at all.  Disable the
+ *                feature for this connection and fall back to legacy
+ *                dispatch for this and every subsequent request.
+ *   -EOPNOTSUPP  This specific compound combination is not supported,
+ *                but the feature remains usable.  Fall back to legacy
+ *                dispatch for this request only; leave fc->compound_ops
+ *                set so future requests may still go through compound.
+ *
+ * (ENOTSUPP is a Linux-internal errno > 511 and is rejected by
+ * fuse_dev_do_write(), so a userspace server cannot signal it.)
+ */
+int fuse_compound_send(struct fuse_mount *fm,
+		       struct fuse_compound_op *ops, unsigned int count)
+{
+	struct fuse_conn *fc = fm->fc;
+	struct fuse_compound_args compound = {
+		.args = { .opcode = FUSE_COMPOUND, },
+		.ops = ops,
+		.count = count,
+	};
+	int ret;
+
+	if (WARN_ON_ONCE(count == 0))
+		return -EINVAL;
+
+	if (!fc->compound_ops) {
+		fuse_compound_send_legacy(fm, ops, count);
+		return 0;
+	}
+
+	ret = fuse_simple_request(fm, &compound.args);
+	if (ret == -ENOSYS)
+		fc->compound_ops = 0;
+	if (ret == -ENOSYS || ret == -EOPNOTSUPP) {
+		fuse_compound_send_legacy(fm, ops, count);
+		return 0;
+	}
+	return ret;
+}
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5dda7080f4a9..7b20e4e9971a 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -413,11 +413,47 @@ const struct fuse_iqueue_ops fuse_dev_fiq_ops = {
 };
 EXPORT_SYMBOL_GPL(fuse_dev_fiq_ops);
 
+static inline struct fuse_compound_args *
+fuse_get_compound_args(struct fuse_args *args)
+{
+	if (args->opcode == FUSE_COMPOUND)
+		return container_of(args, struct fuse_compound_args, args);
+	return NULL;
+}
+
+static size_t fuse_compound_req_size(struct fuse_compound_args *compound)
+{
+	size_t total = sizeof(struct fuse_in_header) +
+		       sizeof(struct fuse_compound_in);
+	unsigned int i, j;
+
+	for (i = 0; i < compound->count; i++) {
+		struct fuse_args *op_args = compound->ops[i].arg;
+
+		total += sizeof(struct fuse_compound_req_in) +
+			 sizeof(struct fuse_in_header);
+		for (j = 0; j < op_args->in_numargs; j++)
+			total += op_args->in_args[j].size;
+	}
+
+	return total;
+}
+
+void fuse_set_req_len(struct fuse_req *req)
+{
+	struct fuse_compound_args *compound = fuse_get_compound_args(req->args);
+
+	if (compound)
+		req->in.h.len = fuse_compound_req_size(compound);
+	else
+		req->in.h.len = sizeof(struct fuse_in_header) +
+			fuse_len_args(req->args->in_numargs,
+				      (struct fuse_arg *)req->args->in_args);
+}
+
 static void fuse_send_one(struct fuse_iqueue *fiq, struct fuse_req *req)
 {
-	req->in.h.len = sizeof(struct fuse_in_header) +
-		fuse_len_args(req->args->in_numargs,
-			      (struct fuse_arg *) req->args->in_args);
+	fuse_set_req_len(req);
 	fiq->ops->send_req(fiq, req);
 }
 
@@ -713,9 +749,7 @@ static bool fuse_request_queue_background_uring(struct fuse_conn *fc,
 {
 	struct fuse_iqueue *fiq = &fc->iq;
 
-	req->in.h.len = sizeof(struct fuse_in_header) +
-		fuse_len_args(req->args->in_numargs,
-			      (struct fuse_arg *) req->args->in_args);
+	fuse_set_req_len(req);
 	fuse_request_assign_unique(fiq, req);
 
 	return fuse_uring_queue_bq_req(req);
@@ -1204,7 +1238,7 @@ static int fuse_copy_folios(struct fuse_copy_state *cs, unsigned nbytes,
 }
 
 /* Copy a single argument in the request to/from userspace buffer */
-static int fuse_copy_one(struct fuse_copy_state *cs, void *val, unsigned size)
+static int fuse_copy_one(struct fuse_copy_state *cs, void *val, unsigned int size)
 {
 	while (size) {
 		if (!cs->len) {
@@ -1399,6 +1433,66 @@ __releases(fiq->lock)
 		return fuse_read_batch_forget(fiq, cs, nbytes);
 }
 
+/*
+ * Stream the body of a compound request directly from the per-subop
+ * argument buffers, avoiding a pre-built linear copy.
+ *
+ * The fuse_compound_in header is inlined in the request stream for
+ * /dev/fuse but for io-uring it is carried in a separate fixed slot
+ * (ent->headers->op_in) written before this function runs.
+ */
+int fuse_copy_compound_in_args(struct fuse_copy_state *cs,
+			       struct fuse_compound_args *compound)
+{
+	unsigned int i, j;
+	int err;
+
+	if (!cs->is_uring) {
+		err = fuse_copy_one(cs, &compound->in_header,
+				    sizeof(compound->in_header));
+		if (err)
+			return err;
+	}
+
+	for (i = 0; i < compound->count; i++) {
+		struct fuse_compound_op *op = &compound->ops[i];
+		struct fuse_args *op_args = op->arg;
+		struct fuse_compound_req_in sub = {
+			.dep_index = op->dep_index,
+		};
+		/*
+		 * Inherit the outer request's credentials so each subop's
+		 * fuse_in_header carries valid uid/gid/pid instead of
+		 * zeros that would mislead the server.
+		 */
+		struct fuse_in_header hdr = {
+			.unique	= i,
+			.opcode	= op_args->opcode,
+			.nodeid	= op_args->nodeid,
+			.uid	= cs->req->in.h.uid,
+			.gid	= cs->req->in.h.gid,
+			.pid	= cs->req->in.h.pid,
+			.len	= sizeof(hdr),
+		};
+
+		for (j = 0; j < op_args->in_numargs; j++)
+			hdr.len += op_args->in_args[j].size;
+
+		err = fuse_copy_one(cs, &sub, sizeof(sub));
+		if (!err)
+			err = fuse_copy_one(cs, &hdr, sizeof(hdr));
+		if (!err)
+			err = fuse_copy_args(cs, op_args->in_numargs,
+					     op_args->in_pages,
+					     (struct fuse_arg *)op_args->in_args,
+					     0);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 /*
  * Read a single request into the userspace filesystem's buffer.  This
  * function waits until a request is available, then removes it from
@@ -1503,9 +1597,15 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
 	spin_unlock(&fpq->lock);
 	cs->req = req;
 	err = fuse_copy_one(cs, &req->in.h, sizeof(req->in.h));
-	if (!err)
-		err = fuse_copy_args(cs, args->in_numargs, args->in_pages,
-				     (struct fuse_arg *) args->in_args, 0);
+	if (!err) {
+		struct fuse_compound_args *compound = fuse_get_compound_args(args);
+
+		if (compound)
+			err = fuse_copy_compound_in_args(cs, compound);
+		else
+			err = fuse_copy_args(cs, args->in_numargs, args->in_pages,
+					     (struct fuse_arg *)args->in_args, 0);
+	}
 	fuse_copy_finish(cs);
 	spin_lock(&fpq->lock);
 	clear_bit(FR_LOCKED, &req->flags);
@@ -2146,6 +2246,80 @@ struct fuse_req *fuse_request_find(struct fuse_pqueue *fpq, u64 unique)
 	return NULL;
 }
 
+int fuse_copy_compound_out_args(struct fuse_copy_state *cs,
+				struct fuse_compound_args *compound)
+{
+	unsigned int i;
+	int err;
+
+	err = fuse_copy_one(cs, &compound->out_header,
+			    sizeof(compound->out_header));
+	if (err)
+		return err;
+
+	for (i = 0; i < compound->count; i++) {
+		struct fuse_compound_op *op = &compound->ops[i];
+		struct fuse_out_header op_hdr;
+		size_t expected;
+
+		err = fuse_copy_one(cs, &op_hdr, sizeof(op_hdr));
+		if (err)
+			return err;
+		if (op_hdr.len < sizeof(op_hdr))
+			return -EIO;
+		/*
+		 * Subop replies must echo the request's per-subop unique
+		 * back to the kernel; we wrote unique = i in
+		 * fuse_copy_compound_in_args() so the server is expected
+		 * to mirror it here.  Reject otherwise: a mismatch means
+		 * the server reordered or duplicated subop replies.
+		 */
+		if (op_hdr.unique != i)
+			return -EIO;
+
+		*op->error = op_hdr.error;
+		if (op_hdr.error) {
+			/* Errored replies carry only the fuse_out_header. */
+			if (op_hdr.len != sizeof(op_hdr))
+				return -EIO;
+			continue;
+		}
+
+		/*
+		 * Validate the wire length against what the kernel can
+		 * accept.  expected is the maximum: sum of all declared
+		 * out_args plus the per-subop header.  Fixed-size subops
+		 * must match exactly; out_argvar subops may report any
+		 * length in [expected - lastarg->size, expected] and the
+		 * last arg shrinks to fit.  Mirrors fuse_copy_out_args().
+		 */
+		expected = sizeof(op_hdr) +
+			fuse_len_args(op->arg->out_numargs,
+				      op->arg->out_args);
+		if (op_hdr.len > expected ||
+		    (op_hdr.len < expected && !op->arg->out_argvar))
+			return -EIO;
+		if (op_hdr.len < expected) {
+			struct fuse_arg *lastarg =
+				&op->arg->out_args[op->arg->out_numargs - 1];
+			size_t diff = expected - op_hdr.len;
+
+			if (diff > lastarg->size)
+				return -EIO;
+			lastarg->size -= diff;
+		}
+
+		err = fuse_copy_args(cs, op->arg->out_numargs,
+				     op->arg->out_pages,
+				     (struct fuse_arg *)op->arg->out_args,
+				     op->arg->page_zeroing);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 int fuse_copy_out_args(struct fuse_copy_state *cs, struct fuse_args *args,
 		       unsigned nbytes)
 {
@@ -2253,10 +2427,16 @@ static ssize_t fuse_dev_do_write(struct fuse_dev *fud,
 	if (!req->args->page_replace)
 		cs->move_folios = false;
 
-	if (oh.error)
+	if (oh.error) {
 		err = nbytes != sizeof(oh) ? -EINVAL : 0;
-	else
-		err = fuse_copy_out_args(cs, req->args, nbytes);
+	} else {
+		struct fuse_compound_args *compound = fuse_get_compound_args(req->args);
+
+		if (compound)
+			err = fuse_copy_compound_out_args(cs, compound);
+		else
+			err = fuse_copy_out_args(cs, req->args, nbytes);
+	}
 	fuse_copy_finish(cs);
 
 	spin_lock(&fpq->lock);
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 7b9822e8837b..f6eee4cff136 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -595,7 +595,14 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 	cs.is_uring = true;
 	cs.req = req;
 
-	err = fuse_copy_out_args(&cs, args, ring_in_out.payload_sz);
+	if (args->opcode == FUSE_COMPOUND) {
+		/* Stream compound response directly into operation buffers */
+		struct fuse_compound_args *compound =
+			container_of(args, struct fuse_compound_args, args);
+		err = fuse_copy_compound_out_args(&cs, compound);
+	} else {
+		err = fuse_copy_out_args(&cs, args, ring_in_out.payload_sz);
+	}
 	fuse_copy_finish(&cs);
 	return err;
 }
@@ -627,6 +634,27 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 	cs.is_uring = true;
 	cs.req = req;
 
+	if (args->opcode == FUSE_COMPOUND) {
+		/*
+		 * Treat fuse_compound_in as the per-op header: it goes
+		 * into ent->headers->op_in (matching the placement of any
+		 * other op-specific header on the io-uring transport),
+		 * while the per-subop stream flows through ent->payload.
+		 */
+		struct fuse_compound_args *compound =
+			container_of(args, struct fuse_compound_args, args);
+
+		err = copy_to_user(&ent->headers->op_in, &compound->in_header,
+				   sizeof(compound->in_header));
+		if (err) {
+			pr_info_ratelimited("Copying the compound header failed.\n");
+			return -EFAULT;
+		}
+
+		err = fuse_copy_compound_in_args(&cs, compound);
+		goto out_finish;
+	}
+
 	if (num_args > 0) {
 		/*
 		 * Expectation is that the first argument is the per op header.
@@ -648,6 +676,7 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 	/* copy the payload */
 	err = fuse_copy_args(&cs, num_args, args->in_pages,
 			     (struct fuse_arg *)in_args, 0);
+out_finish:
 	fuse_copy_finish(&cs);
 	if (err) {
 		pr_info_ratelimited("%s fuse_copy_args failed\n", __func__);
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 910f883cd090..5114b376fd34 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -86,6 +86,11 @@ int fuse_copy_args(struct fuse_copy_state *cs, unsigned int numargs,
 		   int zeroing);
 int fuse_copy_out_args(struct fuse_copy_state *cs, struct fuse_args *args,
 		       unsigned int nbytes);
+int fuse_copy_compound_in_args(struct fuse_copy_state *cs,
+			       struct fuse_compound_args *compound);
+int fuse_copy_compound_out_args(struct fuse_copy_state *cs,
+				struct fuse_compound_args *compound);
+void fuse_set_req_len(struct fuse_req *req);
 void fuse_dev_queue_forget(struct fuse_iqueue *fiq,
 			   struct fuse_forget_link *forget);
 void fuse_dev_queue_interrupt(struct fuse_iqueue *fiq, struct fuse_req *req);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 17423d4e3cfa..af4ea2af19d1 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -911,6 +911,9 @@ struct fuse_conn {
 	/** Passthrough support for read/write IO */
 	unsigned int passthrough:1;
 
+	/* does fuse server support compound operations? */
+	unsigned int compound_ops:1;
+
 	/* Use pages instead of pointer for kernel I/O */
 	unsigned int use_pages_for_kvec_io:1;
 
@@ -1272,6 +1275,35 @@ static inline ssize_t fuse_simple_idmap_request(struct mnt_idmap *idmap,
 int fuse_simple_background(struct fuse_mount *fm, struct fuse_args *args,
 			   gfp_t gfp_flags);
 
+/*
+ * One subrequest in a compound.  @dep_index is FUSE_COMPOUND_NO_DEP, or
+ * the index of an earlier op in the array whose output should be used to
+ * fill in this op's nodeid before dispatch.  @error receives the per-op
+ * status after fuse_compound_send() returns.
+ */
+struct fuse_compound_op {
+	struct fuse_args	*arg;
+	int			*error;
+	u8			dep_index;
+};
+
+/*
+ * Compound wrapper.  Embeds fuse_args as the first member so the device
+ * layer can container_of() back to the operation array.  The in_header
+ * and out_header fields are reserved-only today but reach the wire so
+ * future extensions can attach compound-level metadata.
+ */
+struct fuse_compound_args {
+	struct fuse_args	args;
+	struct fuse_compound_op *ops;
+	unsigned int		count;
+	struct fuse_compound_in	 in_header;
+	struct fuse_compound_out out_header;
+};
+
+int fuse_compound_send(struct fuse_mount *fm,
+		       struct fuse_compound_op *ops, unsigned int count);
+
 /**
  * Assign a unique id to a fuse request
  */
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index deddfffb037f..c275864710b6 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1030,6 +1030,15 @@ void fuse_conn_init(struct fuse_conn *fc, struct fuse_mount *fm,
 	fc->name_max = FUSE_NAME_LOW_MAX;
 	fc->timeout.req_timeout = 0;
 
+	/*
+	 * Compound support is discovered by trial: assume the server
+	 * implements it and clear the flag on the first -ENOSYS reply.
+	 * Unlike most connection features there is no FUSE_INIT flag, so
+	 * default-on is correct here even though other capability bits
+	 * default to zero.
+	 */
+	fc->compound_ops = 1;
+
 	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
 		fuse_backing_files_init(fc);
 
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index c13e1f9a2f12..58dd07a6c53a 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -664,6 +664,13 @@ enum fuse_opcode {
 	FUSE_STATX		= 52,
 	FUSE_COPY_FILE_RANGE_64	= 53,
 
+	/* A compound request is handled like a single request,
+	 * but contains multiple requests as input.
+	 * This can be used to signal to the fuse server that
+	 * the requests can be combined atomically.
+	 */
+	FUSE_COMPOUND		= 54,
+
 	/* CUSE specific operations */
 	CUSE_INIT		= 4096,
 
@@ -1245,6 +1252,55 @@ struct fuse_supp_groups {
 	uint32_t	groups[];
 };
 
+/*
+ * Sentinel value for fuse_compound_req_in.dep_index meaning the
+ * subrequest does not depend on any other subrequest.  The dep_index
+ * field is a uint8_t so the largest dispatchable compound is bounded
+ * by FUSE_COMPOUND_MAX_OPS subrequests.
+ */
+#define FUSE_COMPOUND_NO_DEP	0xff
+
+/*
+ * Compound request layout:
+ *
+ *	fuse_in_header (opcode FUSE_COMPOUND)
+ *	fuse_compound_in
+ *	  fuse_compound_req_in
+ *	  fuse_in_header
+ *	  payload
+ *	  ... (repeated per subrequest)
+ *
+ * The compound reply layout mirrors it:
+ *
+ *	fuse_out_header
+ *	fuse_compound_out
+ *	  fuse_out_header
+ *	  payload
+ *	  ... (repeated per subrequest)
+ *
+ * fuse_compound_in / fuse_compound_out currently only carry reserved
+ * fields; they exist so future extensions can attach compound-level
+ * metadata without another wire-format change.
+ */
+struct fuse_compound_in {
+	uint64_t	reserved[2];
+};
+
+struct fuse_compound_out {
+	uint64_t	reserved[2];
+};
+
+/*
+ * Per-subrequest header.  dep_index identifies an earlier subrequest in
+ * the same compound whose output should be threaded into this one's
+ * input (currently only the producing op's nodeid is propagated), or
+ * FUSE_COMPOUND_NO_DEP if the subrequest is independent.
+ */
+struct fuse_compound_req_in {
+	uint8_t		dep_index;
+	uint8_t		reserved[3];
+};
+
 /**
  * Size of the ring buffer header
  */

-- 
2.54.0

