Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00370399345
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331068; cv=none; b=ZmijOyTyAaUmiPRrvTTJa3aJpGLQpaL+Fns2NANboaiylSXtsqgX0jc9VSNTFhKWk5gQC7cS3EMaq6SbzO3sZn79wNiQyAWoXenoyewpkS66ghVdVAvcaq7r5MjeLJxGp1lbEe/4nO74o4ENXNfhx3jMhXSIRYHUuWy9QK/PAiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331068; c=relaxed/simple;
	bh=QEYv1JyCIHd66D8a10UakWcyKxxHsU3W7wi/WtXwWuM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=P0yYiXzhsaslJtdX7lmiZymjZo3e/kVYuuS6b2kwionFnzu+PdpaunqWJ3epWY5INrtz0uaOG8p17PqL7a9q+4hKhGTL7jdcVj9xyN2AYwyveZU/F46Kx599p0gQbObxHHMDgpeRwBHpXAqcTAqWg8i1JlUJutA1abHWv3ZMKLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AHLOC5Fy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AHLOC5Fy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UYs2aH9cnC/FcYAafN5ozvPOzmP2OG0VJ1IJjySXv9g=;
	b=AHLOC5Fym3Cj+yuCthTiSthpmYLwmAO4q/ksqKTGzigw4ABWIYosXcJSUwMM1gPaY7gFrA
	bwuJM+hLRHh0aonGkxVh8JYhrdOiqqwiZ/SObWv2uJCJZWprlvslpaWcva9SKXS4aZinHq
	cyet+F1al/8QrDovaZQH82WNY1IeoJk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-joh016_9MX2wSGsIhaxzJQ-1; Thu, 16 Apr 2026 05:17:38 -0400
X-MC-Unique: joh016_9MX2wSGsIhaxzJQ-1
X-Mimecast-MFC-AGG-ID: joh016_9MX2wSGsIhaxzJQ_1776331057
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488dcaf2f2fso36318715e9.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331057; x=1776935857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UYs2aH9cnC/FcYAafN5ozvPOzmP2OG0VJ1IJjySXv9g=;
        b=NP8QoDvKQww4KBsxzdKnUU58ZQgsPYEA6z2JWjUHQpuDwgraL1aoS/y81i2tzXoc4H
         IxmXiTj52+C+gyKfxclcUU6SCRVnVn3w4UWMYxKs46lLgLqXFwAqJU9VpP45OtUZ7rsm
         mF9B/nTSJmkV75N4YTnc4ztHbvQQlm1j5qblUp35hyhAkXcitIH4vDB0N+0127jQbrD8
         Z7e1FUf0kocwTcocZOEDv7N2rOTP9Sai5IQLNolXAsZLTfb5pq18mLqaQS4VPkriXEdD
         V5KQxFxiQcl0ilu1W2/btSGEpy2/CdIwMSDezhfGlggY7UStpWIiFZXK5mlfm4KQ+7/Q
         MQaQ==
X-Gm-Message-State: AOJu0YwF7qzyAYaSlr7CbPpPMMrPeLpRDrTcsUOIceK4aTSTqfgoSt2+
	3ZwV/6eD/nWBw/juDlLsD85beodcB4T5NJ0aHTT8wV6U9GOGmwGYPXT7RtjonyD2Bbwic73zF/k
	pMw8TXfcoCgWjO81qaxF1XnQnC6CeHVr/qHwoMFSTejTRADcHOItc7e0MIjjqHsgFjbPhmCOkMX
	gVJuryrbv4RwfQxk6YQGMkxMMUbWWwPmIl7fn/lFbOR0NZPq4=
X-Gm-Gg: AeBDietX7ljCuG8boc91c824eufyxGt3M5U2lFuaBvjMAADb6JVF4VW0W6GLYQtWE8l
	K1GVgZJbXo/jADOymxHcin7H4iprd79rsGY4pQi4ijbJkAHI7zo3K1R9hnaYQ52nSDQSarAGhSH
	pPKSXMnB2KGJsiS1lSnk3CHHxpDy8dqGwtJH3l1omjuPeiwYHlBBIYDB33a9wGtqSvWWtmLyFss
	2vQHaWX6/AuBxRisp6WoJbdVq4r7gYe2fWumv725JGS64pBjZvsg2L226WQgmjWhN6EjzbMP2+D
	a+PLL9lqO6aPLhpAIRSGMzAZYQJZQFX+XVOwKa5tJ7BeLLzbmgo+ftBpQWQFRupbBQAMK/fZEgC
	ebhaSWnGJcSftviRPKJzV4tEgmohNOz+yey2CAHVs8DBJKxIPLmjimbj4DFIMi6McExo40pMTgR
	9mNl+Xyw==
X-Received: by 2002:a05:600c:3546:b0:488:a82f:bbb6 with SMTP id 5b1f17b1804b1-488d6890a46mr348061375e9.27.1776331056890;
        Thu, 16 Apr 2026 02:17:36 -0700 (PDT)
X-Received: by 2002:a05:600c:3546:b0:488:a82f:bbb6 with SMTP id 5b1f17b1804b1-488d6890a46mr348060825e9.27.1776331056288;
        Thu, 16 Apr 2026 02:17:36 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:35 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 25/32] fuse: create poll.c
Date: Thu, 16 Apr 2026 11:16:49 +0200
Message-ID: <20260416091658.462783-26-mszeredi@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416091658.462783-1-mszeredi@redhat.com>
References: <20260416091658.462783-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ICDKs57K6MEM4PFc7AsopN6csnZA3xNlwH1TwLePJXI_1776331057
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Move f_op->poll related functions to the new source file.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/Makefile |   1 +
 fs/fuse/dev.c    |  45 +++++----------
 fs/fuse/dev.h    |   2 +
 fs/fuse/file.c   | 119 ---------------------------------------
 fs/fuse/poll.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 158 insertions(+), 150 deletions(-)
 create mode 100644 fs/fuse/poll.c

diff --git a/fs/fuse/Makefile b/fs/fuse/Makefile
index 08be6817a1cc..26086bf5b494 100644
--- a/fs/fuse/Makefile
+++ b/fs/fuse/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_VIRTIO_FS) += virtiofs.o
 
 fuse-y := trace.o	# put trace.o first so we see ftrace errors sooner
 fuse-y += dev.o dir.o file.o inode.o control.o xattr.o acl.o readdir.o ioctl.o req_timeout.o req.o
+fuse-y += poll.o
 fuse-y += iomode.o
 fuse-$(CONFIG_FUSE_DAX) += dax.o
 fuse-$(CONFIG_FUSE_PASSTHROUGH) += passthrough.o backing.o
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index f3d16a224df7..a76822bd81c2 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -79,10 +79,10 @@ void fuse_chan_set_initialized(struct fuse_chan *fch)
 	wake_up_all(&fch->blocked_waitq);
 }
 
-static bool fuse_block_alloc(struct fuse_conn *fc, bool for_background)
+static bool fuse_block_alloc(struct fuse_chan *fch, bool for_background)
 {
-	return !fc->chan->initialized || (for_background && fc->chan->blocked) ||
-	       (fc->chan->io_uring && fc->chan->connected && !fuse_uring_ready(fc->chan));
+	return !fch->initialized || (for_background && fch->blocked) ||
+	       (fch->io_uring && fch->connected && !fuse_uring_ready(fch));
 }
 
 static void fuse_drop_waiting(struct fuse_chan *fch)
@@ -108,10 +108,10 @@ static struct fuse_req *fuse_get_req(struct fuse_chan *fch, bool for_background)
 
 	atomic_inc(&fch->num_waiting);
 
-	if (fuse_block_alloc(fch->conn, for_background)) {
+	if (fuse_block_alloc(fch, for_background)) {
 		err = -EINTR;
 		if (wait_event_state_exclusive(fch->blocked_waitq,
-				!fuse_block_alloc(fch->conn, for_background),
+				!fuse_block_alloc(fch, for_background),
 				(TASK_KILLABLE | TASK_FREEZABLE)))
 			goto out;
 	}
@@ -2065,21 +2065,21 @@ static int fuse_notify_retrieve(struct fuse_conn *fc, unsigned int size,
  * if the FUSE daemon takes careful measures to avoid processing duplicated
  * non-idempotent requests.
  */
-static void fuse_resend(struct fuse_conn *fc)
+static void fuse_resend(struct fuse_chan *fch)
 {
 	struct fuse_dev *fud;
 	struct fuse_req *req, *next;
-	struct fuse_iqueue *fiq = &fc->chan->iq;
+	struct fuse_iqueue *fiq = &fch->iq;
 	LIST_HEAD(to_queue);
 	unsigned int i;
 
-	spin_lock(&fc->chan->lock);
-	if (!fc->chan->connected) {
-		spin_unlock(&fc->chan->lock);
+	spin_lock(&fch->lock);
+	if (!fch->connected) {
+		spin_unlock(&fch->lock);
 		return;
 	}
 
-	list_for_each_entry(fud, &fc->chan->devices, entry) {
+	list_for_each_entry(fud, &fch->devices, entry) {
 		struct fuse_pqueue *fpq = &fud->pq;
 
 		spin_lock(&fpq->lock);
@@ -2087,7 +2087,7 @@ static void fuse_resend(struct fuse_conn *fc)
 			list_splice_tail_init(&fpq->processing[i], &to_queue);
 		spin_unlock(&fpq->lock);
 	}
-	spin_unlock(&fc->chan->lock);
+	spin_unlock(&fch->lock);
 
 	list_for_each_entry_safe(req, next, &to_queue, list) {
 		set_bit(FR_PENDING, &req->flags);
@@ -2111,7 +2111,7 @@ static void fuse_resend(struct fuse_conn *fc)
 
 static int fuse_notify_resend(struct fuse_conn *fc)
 {
-	fuse_resend(fc);
+	fuse_resend(fc->chan);
 	return 0;
 }
 
@@ -2499,23 +2499,6 @@ void fuse_dev_end_requests(struct list_head *head)
 	}
 }
 
-static void end_polls(struct fuse_conn *fc)
-{
-	struct rb_node *p;
-
-	spin_lock(&fc->lock);
-	p = rb_first(&fc->polled_files);
-
-	while (p) {
-		struct fuse_file *ff;
-		ff = rb_entry(p, struct fuse_file, polled_node);
-		wake_up_interruptible_all(&ff->poll_wait);
-
-		p = rb_next(p);
-	}
-	spin_unlock(&fc->lock);
-}
-
 /*
  * Abort all requests.
  *
@@ -2593,7 +2576,7 @@ void fuse_chan_abort(struct fuse_chan *fch, bool abort_with_err)
 		wake_up_all(&fiq->waitq);
 		spin_unlock(&fiq->lock);
 		kill_fasync(&fiq->fasync, SIGIO, POLL_IN);
-		end_polls(fch->conn);
+		fuse_end_polls(fch->conn);
 		wake_up_all(&fch->blocked_waitq);
 		spin_unlock(&fch->lock);
 
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index 9a1f79b130bd..2c4d0c53ffbb 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -49,6 +49,8 @@ void fuse_init_server_timeout(struct fuse_chan *fch, unsigned int timeout);
 void fuse_chan_abort(struct fuse_chan *fch, bool abort_with_err);
 void fuse_chan_wait_aborted(struct fuse_chan *fch);
 
+void fuse_end_polls(struct fuse_conn *fc);
+
 #ifdef CONFIG_FUSE_IO_URING
 bool fuse_uring_enabled(void);
 void fuse_uring_destruct(struct fuse_chan *fch);
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index d549f47170d6..b8fd148dc109 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -2676,125 +2676,6 @@ static loff_t fuse_file_llseek(struct file *file, loff_t offset, int whence)
 	return retval;
 }
 
-/*
- * All files which have been polled are linked to RB tree
- * fuse_conn->polled_files which is indexed by kh.  Walk the tree and
- * find the matching one.
- */
-static struct rb_node **fuse_find_polled_node(struct fuse_conn *fc, u64 kh,
-					      struct rb_node **parent_out)
-{
-	struct rb_node **link = &fc->polled_files.rb_node;
-	struct rb_node *last = NULL;
-
-	while (*link) {
-		struct fuse_file *ff;
-
-		last = *link;
-		ff = rb_entry(last, struct fuse_file, polled_node);
-
-		if (kh < ff->kh)
-			link = &last->rb_left;
-		else if (kh > ff->kh)
-			link = &last->rb_right;
-		else
-			return link;
-	}
-
-	if (parent_out)
-		*parent_out = last;
-	return link;
-}
-
-/*
- * The file is about to be polled.  Make sure it's on the polled_files
- * RB tree.  Note that files once added to the polled_files tree are
- * not removed before the file is released.  This is because a file
- * polled once is likely to be polled again.
- */
-static void fuse_register_polled_file(struct fuse_conn *fc,
-				      struct fuse_file *ff)
-{
-	spin_lock(&fc->lock);
-	if (RB_EMPTY_NODE(&ff->polled_node)) {
-		struct rb_node **link, *parent;
-
-		link = fuse_find_polled_node(fc, ff->kh, &parent);
-		BUG_ON(*link);
-		rb_link_node(&ff->polled_node, parent, link);
-		rb_insert_color(&ff->polled_node, &fc->polled_files);
-	}
-	spin_unlock(&fc->lock);
-}
-
-__poll_t fuse_file_poll(struct file *file, poll_table *wait)
-{
-	struct fuse_file *ff = file->private_data;
-	struct fuse_mount *fm = ff->fm;
-	struct fuse_poll_in inarg = { .fh = ff->fh, .kh = ff->kh };
-	struct fuse_poll_out outarg;
-	FUSE_ARGS(args);
-	int err;
-
-	if (fm->fc->no_poll)
-		return DEFAULT_POLLMASK;
-
-	poll_wait(file, &ff->poll_wait, wait);
-	inarg.events = mangle_poll(poll_requested_events(wait));
-
-	/*
-	 * Ask for notification iff there's someone waiting for it.
-	 * The client may ignore the flag and always notify.
-	 */
-	if (waitqueue_active(&ff->poll_wait)) {
-		inarg.flags |= FUSE_POLL_SCHEDULE_NOTIFY;
-		fuse_register_polled_file(fm->fc, ff);
-	}
-
-	args.opcode = FUSE_POLL;
-	args.nodeid = ff->nodeid;
-	args.in_numargs = 1;
-	args.in_args[0].size = sizeof(inarg);
-	args.in_args[0].value = &inarg;
-	args.out_numargs = 1;
-	args.out_args[0].size = sizeof(outarg);
-	args.out_args[0].value = &outarg;
-	err = fuse_simple_request(fm, &args);
-
-	if (!err)
-		return demangle_poll(outarg.revents);
-	if (err == -ENOSYS) {
-		fm->fc->no_poll = 1;
-		return DEFAULT_POLLMASK;
-	}
-	return EPOLLERR;
-}
-EXPORT_SYMBOL_GPL(fuse_file_poll);
-
-/*
- * This is called from fuse_handle_notify() on FUSE_NOTIFY_POLL and
- * wakes up the poll waiters.
- */
-int fuse_notify_poll_wakeup(struct fuse_conn *fc,
-			    struct fuse_notify_poll_wakeup_out *outarg)
-{
-	u64 kh = outarg->kh;
-	struct rb_node **link;
-
-	spin_lock(&fc->lock);
-
-	link = fuse_find_polled_node(fc, kh, NULL);
-	if (*link) {
-		struct fuse_file *ff;
-
-		ff = rb_entry(*link, struct fuse_file, polled_node);
-		wake_up_interruptible_sync(&ff->poll_wait);
-	}
-
-	spin_unlock(&fc->lock);
-	return 0;
-}
-
 static void fuse_do_truncate(struct file *file)
 {
 	struct inode *inode = file->f_mapping->host;
diff --git a/fs/fuse/poll.c b/fs/fuse/poll.c
new file mode 100644
index 000000000000..bce3ee2e861e
--- /dev/null
+++ b/fs/fuse/poll.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "dev.h"
+#include "fuse_i.h"
+
+void fuse_end_polls(struct fuse_conn *fc)
+{
+	struct rb_node *p;
+
+	spin_lock(&fc->lock);
+	p = rb_first(&fc->polled_files);
+
+	while (p) {
+		struct fuse_file *ff;
+		ff = rb_entry(p, struct fuse_file, polled_node);
+		wake_up_interruptible_all(&ff->poll_wait);
+
+		p = rb_next(p);
+	}
+	spin_unlock(&fc->lock);
+}
+
+/*
+ * All files which have been polled are linked to RB tree
+ * fuse_conn->polled_files which is indexed by kh.  Walk the tree and
+ * find the matching one.
+ */
+static struct rb_node **fuse_find_polled_node(struct fuse_conn *fc, u64 kh,
+					      struct rb_node **parent_out)
+{
+	struct rb_node **link = &fc->polled_files.rb_node;
+	struct rb_node *last = NULL;
+
+	while (*link) {
+		struct fuse_file *ff;
+
+		last = *link;
+		ff = rb_entry(last, struct fuse_file, polled_node);
+
+		if (kh < ff->kh)
+			link = &last->rb_left;
+		else if (kh > ff->kh)
+			link = &last->rb_right;
+		else
+			return link;
+	}
+
+	if (parent_out)
+		*parent_out = last;
+	return link;
+}
+
+/*
+ * The file is about to be polled.  Make sure it's on the polled_files
+ * RB tree.  Note that files once added to the polled_files tree are
+ * not removed before the file is released.  This is because a file
+ * polled once is likely to be polled again.
+ */
+static void fuse_register_polled_file(struct fuse_conn *fc,
+				      struct fuse_file *ff)
+{
+	spin_lock(&fc->lock);
+	if (RB_EMPTY_NODE(&ff->polled_node)) {
+		struct rb_node **link, *parent;
+
+		link = fuse_find_polled_node(fc, ff->kh, &parent);
+		BUG_ON(*link);
+		rb_link_node(&ff->polled_node, parent, link);
+		rb_insert_color(&ff->polled_node, &fc->polled_files);
+	}
+	spin_unlock(&fc->lock);
+}
+
+__poll_t fuse_file_poll(struct file *file, poll_table *wait)
+{
+	struct fuse_file *ff = file->private_data;
+	struct fuse_mount *fm = ff->fm;
+	struct fuse_poll_in inarg = { .fh = ff->fh, .kh = ff->kh };
+	struct fuse_poll_out outarg;
+	FUSE_ARGS(args);
+	int err;
+
+	if (fm->fc->no_poll)
+		return DEFAULT_POLLMASK;
+
+	poll_wait(file, &ff->poll_wait, wait);
+	inarg.events = mangle_poll(poll_requested_events(wait));
+
+	/*
+	 * Ask for notification iff there's someone waiting for it.
+	 * The client may ignore the flag and always notify.
+	 */
+	if (waitqueue_active(&ff->poll_wait)) {
+		inarg.flags |= FUSE_POLL_SCHEDULE_NOTIFY;
+		fuse_register_polled_file(fm->fc, ff);
+	}
+
+	args.opcode = FUSE_POLL;
+	args.nodeid = ff->nodeid;
+	args.in_numargs = 1;
+	args.in_args[0].size = sizeof(inarg);
+	args.in_args[0].value = &inarg;
+	args.out_numargs = 1;
+	args.out_args[0].size = sizeof(outarg);
+	args.out_args[0].value = &outarg;
+	err = fuse_simple_request(fm, &args);
+
+	if (!err)
+		return demangle_poll(outarg.revents);
+	if (err == -ENOSYS) {
+		fm->fc->no_poll = 1;
+		return DEFAULT_POLLMASK;
+	}
+	return EPOLLERR;
+}
+EXPORT_SYMBOL_GPL(fuse_file_poll);
+
+/*
+ * This is called from fuse_handle_notify() on FUSE_NOTIFY_POLL and
+ * wakes up the poll waiters.
+ */
+int fuse_notify_poll_wakeup(struct fuse_conn *fc,
+			    struct fuse_notify_poll_wakeup_out *outarg)
+{
+	u64 kh = outarg->kh;
+	struct rb_node **link;
+
+	spin_lock(&fc->lock);
+
+	link = fuse_find_polled_node(fc, kh, NULL);
+	if (*link) {
+		struct fuse_file *ff;
+
+		ff = rb_entry(*link, struct fuse_file, polled_node);
+		wake_up_interruptible_sync(&ff->poll_wait);
+	}
+
+	spin_unlock(&fc->lock);
+	return 0;
+}
+
-- 
2.53.0

