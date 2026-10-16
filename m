Received: from mx.n90.eu (mx.n90.eu [65.21.251.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2061420E89
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.251.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155425; cv=none; b=uqbN8rr2p/Yozpuj/5Hdthr71ajHoOkHR3ACPurEIGb3dypGMo5HwaSU6EUqlv2wr7V9nvI07cWJgI4EYGD3+b0jcngbS7AioFAcdw0OLAEJw0aFjoMX2vWygyor2rKtCgnM7AFwYizSHkUqwXLZb8Yqf4FySTIbd+tqYtvSAN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155425; c=relaxed/simple;
	bh=8tf3AgVsLhjZjVO196616Trs4on58Q2aet4VUqyt4BY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmRAfgmpPag4gXfH5k/YSCbRL8PB04gzGsv9lLoPIEmdFITwih1fslxBHky+4fvTEzvv+uRMEzuPAYxl2CmrWcOST6JqSGh0s+fr5u5O9IYwJ6csaQ9306ehkNIUT4AQm3GW3Z9dW3WWGJ4WgGZ7/UE7aI1DbtHV+Nd19NcjrjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=n90.eu; spf=pass smtp.mailfrom=n90.eu; dkim=pass (2048-bit key) header.d=n90.eu header.i=@n90.eu header.b=e8ygEU6V; arc=none smtp.client-ip=65.21.251.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=n90.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=n90.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=n90.eu header.i=@n90.eu header.b="e8ygEU6V"
From: Aleksander Trofimowicz <trof@n90.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n90.eu; s=default;
	t=1792154915; bh=GnqIyK5xYWDVOAhioxDV1M6jSEfy2+f44itGtnKzVbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e8ygEU6V4wuyBe29V/Teqh5IQuv16u9RQefj1ErSAs7t08qTaFcihOntJpxP0SPXL
	 VhkCXTWG8C4DaDtcVN4mBYcmOIxirxXOLdP02vn+j37XQRE9euHbOwPb9b71pth0et
	 SJOrywStKsr1lICCXYB4GxxjDn5BM4P060hBBsZrU6FLQbdezppVnQiWZ9Hc7mSuCl
	 IcsKx9f1F/eKtvjLonG9pPwZiG4ZTXSJVEYwsxa8Srd7DuvWws7ZJrSo1ujlXG6IAe
	 1H2XaHv6/ro6l660zz6LxnHYiwCSodhbTpaZbLTaFTcJuiK13ZNVIzxHABIJMYtWjb
	 W/rQKOgyIVbNA==
To: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Aleksander Trofimowicz <trof@n90.eu>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Bernd Schubert <bernd@bsbernd.com>,
	Joanne Koong <joannelkoong@gmail.com>
Subject: [RFC PATCH 1/1] fuse: per-queue background request accounting for io-uring
Date: Fri, 16 Oct 2026 12:48:11 +0000
Message-ID: <20261016124820.316741-2-trof@n90.eu>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016124820.316741-1-trof@n90.eu>
References: <20261016124820.316741-1-trof@n90.eu>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On many-core systems the connection-wide background request
accounting is the dominant scaling bottleneck for fuse io-uring.
This change addresses the problem by the means of
per-queue background request limiters.

Signed-off-by: Aleksander Trofimowicz <trof@n90.eu>
---
 fs/fuse/control.c         |   5 +-
 fs/fuse/dev.c             |  93 ++++++++++++++++---
 fs/fuse/dev.h             |  22 ++++-
 fs/fuse/dev_uring.c       | 187 ++++++++++++++++++++++++++++++++++----
 fs/fuse/dev_uring_i.h     |  32 +++++++
 fs/fuse/fuse_dev_i.h      |  18 ++++
 fs/fuse/inode.c           |  13 ++-
 include/uapi/linux/fuse.h |  11 ++-
 8 files changed, 347 insertions(+), 34 deletions(-)

diff --git a/fs/fuse/control.c b/fs/fuse/control.c
index 21ffde596d61..611a9e93da5f 100644
--- a/fs/fuse/control.c
+++ b/fs/fuse/control.c
@@ -126,8 +126,11 @@ static ssize_t fuse_conn_max_background_write(struct file *file,
 	if (ret > 0) {
 		struct fuse_conn *fc = fuse_ctl_file_conn_get(file);
 		if (fc) {
-			fuse_chan_max_background_set(fc->chan, val);
+			int err = fuse_chan_max_background_set(fc->chan, val);
+
 			fuse_conn_put(fc);
+			if (err)
+				ret = err;
 		}
 	}
 
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 4fec31fc0b84..e025f7155cf1 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -114,6 +114,9 @@ static void fuse_put_request(struct fuse_req *req);
 static struct fuse_req *fuse_get_req(struct fuse_chan *fch, bool for_background)
 {
 	struct fuse_req *req;
+#ifdef CONFIG_FUSE_IO_URING
+	struct fuse_ring_queue *bg_queue = NULL;
+#endif
 	int err;
 
 	atomic_inc(&fch->num_waiting);
@@ -130,17 +133,39 @@ static struct fuse_req *fuse_get_req(struct fuse_chan *fch, bool for_background)
 	if (!fch->connected)
 		goto out;
 
+#ifdef CONFIG_FUSE_IO_URING
+	if (for_background && fuse_uring_per_queue_bg(fch)) {
+		bg_queue = fuse_uring_bg_admit(fch);
+		if (IS_ERR(bg_queue)) {
+			err = PTR_ERR(bg_queue);
+			bg_queue = NULL;
+			goto out;
+		}
+	}
+#endif
+
 	req = fuse_request_alloc(fch, GFP_KERNEL);
 	err = -ENOMEM;
 	if (!req) {
-		if (for_background)
+		if (for_background) {
+#ifdef CONFIG_FUSE_IO_URING
+			if (bg_queue) {
+				fuse_uring_bg_req_release(bg_queue);
+				goto out;
+			}
+#endif
 			wake_up(&fch->blocked_waitq);
+		}
 		goto out;
 	}
 
 	__set_bit(FR_WAITING, &req->flags);
-	if (for_background)
+	if (for_background) {
 		__set_bit(FR_BACKGROUND, &req->flags);
+#ifdef CONFIG_FUSE_IO_URING
+		req->ring_queue = bg_queue;
+#endif
+	}
 
 	return req;
 
@@ -159,10 +184,18 @@ static void fuse_put_request(struct fuse_req *req)
 			 * We get here in the unlikely case that a background
 			 * request was allocated but not sent
 			 */
-			spin_lock(&fch->bg_lock);
-			if (!fch->blocked)
-				wake_up(&fch->blocked_waitq);
-			spin_unlock(&fch->bg_lock);
+#ifdef CONFIG_FUSE_IO_URING
+			if (fch->bg_mode == FUSE_BG_MODE_PER_QUEUE &&
+			    req->ring_queue) {
+				fuse_uring_bg_req_release(req->ring_queue);
+			} else
+#endif
+			{
+				spin_lock(&fch->bg_lock);
+				if (!fch->blocked)
+					wake_up(&fch->blocked_waitq);
+				spin_unlock(&fch->bg_lock);
+			}
 		}
 
 		if (test_bit(FR_WAITING, &req->flags)) {
@@ -392,16 +425,28 @@ EXPORT_SYMBOL_GPL(fuse_dev_chan_new);
 
 unsigned int fuse_chan_num_background(struct fuse_chan *fch)
 {
+#ifdef CONFIG_FUSE_IO_URING
+	if (fch->bg_mode == FUSE_BG_MODE_PER_QUEUE && fch->ring)
+		return fuse_uring_num_background(fch);
+#endif
 	return READ_ONCE(fch->num_background);
 }
 
 unsigned int fuse_chan_max_background(struct fuse_chan *fch)
 {
+#ifdef CONFIG_FUSE_IO_URING
+	if (fch->bg_mode == FUSE_BG_MODE_PER_QUEUE && fch->ring)
+		return fch->uring_max_bg_per_queue * fch->ring->nr_queues;
+#endif
 	return READ_ONCE(fch->max_background);
 }
 
-void fuse_chan_max_background_set(struct fuse_chan *fch, unsigned int val)
+int fuse_chan_max_background_set(struct fuse_chan *fch, unsigned int val)
 {
+#ifdef CONFIG_FUSE_IO_URING
+	if (fch->bg_mode == FUSE_BG_MODE_PER_QUEUE)
+		return -EINVAL;
+#endif
 	spin_lock(&fch->bg_lock);
 	fch->max_background = val;
 	fch->blocked = fch->num_background >= fch->max_background;
@@ -409,6 +454,18 @@ void fuse_chan_max_background_set(struct fuse_chan *fch, unsigned int val)
 		wake_up_nr(&fch->blocked_waitq,
 			   fch->max_background - fch->num_background);
 	spin_unlock(&fch->bg_lock);
+
+	return 0;
+}
+
+void fuse_chan_per_queue_bg_enable(struct fuse_chan *fch, unsigned int max_bg)
+{
+	spin_lock(&fch->bg_lock);
+	fch->bg_mode = FUSE_BG_MODE_PER_QUEUE;
+	fch->uring_max_bg_per_queue = max_bg;
+	fch->max_background = UINT_MAX;
+	fch->blocked = 0;
+	spin_unlock(&fch->bg_lock);
 }
 
 unsigned int fuse_chan_num_waiting(struct fuse_chan *fch)
@@ -652,10 +709,24 @@ void fuse_request_end(struct fuse_req *req)
 	WARN_ON(test_bit(FR_PENDING, &req->flags));
 	WARN_ON(test_bit(FR_SENT, &req->flags));
 	if (test_bit(FR_BACKGROUND, &req->flags)) {
-		spin_lock(&fch->bg_lock);
-		fuse_request_bg_finish(fch, req);
-		flush_bg_queue(fch);
-		spin_unlock(&fch->bg_lock);
+#ifdef CONFIG_FUSE_IO_URING
+		if (fch->bg_mode == FUSE_BG_MODE_PER_QUEUE && req->ring_queue) {
+			clear_bit(FR_BACKGROUND, &req->flags);
+			fuse_uring_bg_req_release(req->ring_queue);
+			if (!test_bit(FR_URING, &req->flags)) {
+				spin_lock(&fch->bg_lock);
+				fch->num_background--;
+				fch->active_background--;
+				spin_unlock(&fch->bg_lock);
+			}
+		} else
+#endif
+		{
+			spin_lock(&fch->bg_lock);
+			fuse_request_bg_finish(fch, req);
+			flush_bg_queue(fch);
+			spin_unlock(&fch->bg_lock);
+		}
 	} else {
 		/* Wake up waiter sleeping in request_wait_answer() */
 		wake_up(&req->waitq);
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index 8d25378c0918..e2730105ff13 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -4,10 +4,14 @@
 #define _FS_FUSE_DEV_H
 
 #include <linux/cleanup.h>
+#include <linux/types.h>
 
 /** Maximum number of outstanding background requests */
 #define FUSE_DEFAULT_MAX_BACKGROUND 12
 
+/** Maximum number of outstanding background requests per io-uring queue */
+#define FUSE_URING_MAX_BG_PER_QUEUE 4096
+
 struct fuse_conn;
 struct fuse_chan;
 struct fuse_dev;
@@ -31,7 +35,8 @@ void fuse_chan_release(struct fuse_chan *fch);
 void fuse_chan_free(struct fuse_chan *fch);
 unsigned int fuse_chan_num_background(struct fuse_chan *fch);
 unsigned int fuse_chan_max_background(struct fuse_chan *fch);
-void fuse_chan_max_background_set(struct fuse_chan *fch, unsigned int val);
+int fuse_chan_max_background_set(struct fuse_chan *fch, unsigned int val);
+void fuse_chan_per_queue_bg_enable(struct fuse_chan *fch, unsigned int max_bg);
 unsigned int fuse_chan_num_waiting(struct fuse_chan *fch);
 void fuse_chan_set_fc(struct fuse_chan *fch, struct fuse_conn *fc);
 void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_param *param);
@@ -95,6 +100,9 @@ void fuse_copy_finish(struct fuse_copy_state *cs);
 
 #ifdef CONFIG_FUSE_IO_URING
 bool fuse_uring_enabled(void);
+bool fuse_uring_per_queue_bg_advertise(void);
+unsigned int fuse_uring_per_queue_bg_budget(u64 flags, u16 daemon_max_bg,
+					    unsigned int user_bg_limit);
 void fuse_uring_destruct(struct fuse_chan *fch);
 #else /* CONFIG_FUSE_IO_URING */
 static inline bool fuse_uring_enabled(void)
@@ -102,6 +110,18 @@ static inline bool fuse_uring_enabled(void)
 	return false;
 }
 
+static inline bool fuse_uring_per_queue_bg_advertise(void)
+{
+	return false;
+}
+
+static inline unsigned int
+fuse_uring_per_queue_bg_budget(u64 flags, u16 daemon_max_bg,
+			       unsigned int user_bg_limit)
+{
+	return 0;
+}
+
 static inline void fuse_uring_destruct(struct fuse_chan *fch)
 {
 }
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index c6dd420c4034..d1778403348b 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -10,14 +10,27 @@
 #include "fuse_trace.h"
 
 #include <linux/bitmap.h>
+#include <linux/capability.h>
+#include <linux/cpumask.h>
 #include <linux/fs.h>
 #include <linux/io_uring/cmd.h>
+#include <linux/minmax.h>
 
 static bool __read_mostly enable_uring;
 module_param(enable_uring, bool, 0644);
 MODULE_PARM_DESC(enable_uring,
 		 "Enable userspace communication through io-uring");
 
+static unsigned int uring_max_bg_per_queue = 1;
+module_param(uring_max_bg_per_queue, uint, 0644);
+MODULE_PARM_DESC(uring_max_bg_per_queue,
+		 "Default per-queue budget of outstanding background requests for io-uring (0 = disable per-queue background accounting)");
+
+static bool uring_max_bg_per_queue_force;
+module_param(uring_max_bg_per_queue_force, bool, 0644);
+MODULE_PARM_DESC(uring_max_bg_per_queue_force,
+		 "Activate per-queue background accounting for io-uring even if a daemon does not negotiate it");
+
 #define FUSE_URING_IOV_SEGS 2 /* header and payload */
 #define FUSE_URING_IOV_HEADERS 0
 #define FUSE_URING_IOV_PAYLOAD 1
@@ -29,6 +42,32 @@ bool fuse_uring_enabled(void)
 	return enable_uring;
 }
 
+bool fuse_uring_per_queue_bg_advertise(void)
+{
+	return uring_max_bg_per_queue;
+}
+
+unsigned int fuse_uring_per_queue_bg_budget(u64 flags, u16 daemon_max_bg,
+					    unsigned int user_bg_limit)
+{
+	unsigned int nr_queues = num_possible_cpus();
+	unsigned int max_bg;
+
+	if (!enable_uring || !(flags & FUSE_OVER_IO_URING))
+		return 0;
+	if (!((flags & FUSE_PER_QUEUE_BG) && uring_max_bg_per_queue) &&
+	    !uring_max_bg_per_queue_force)
+		return 0;
+
+	max_bg = daemon_max_bg ?: uring_max_bg_per_queue;
+	max_bg = clamp(max_bg, 1U, FUSE_URING_MAX_BG_PER_QUEUE);
+	if (!capable(CAP_SYS_ADMIN) && user_bg_limit &&
+	    max_bg > user_bg_limit / nr_queues)
+		max_bg = max(user_bg_limit / nr_queues, 1U);
+
+	return max_bg;
+}
+
 struct fuse_uring_pdu {
 	struct fuse_ring_ent *ent;
 };
@@ -120,6 +159,20 @@ static void fuse_uring_flush_bg(struct fuse_ring_queue *queue)
 	}
 }
 
+static void fuse_uring_flush_bg_per_queue(struct fuse_ring_queue *queue)
+{
+	lockdep_assert_held(&queue->lock);
+
+	while (!list_empty(&queue->fuse_req_bg_queue) &&
+	       !list_empty(&queue->ent_avail_queue)) {
+		struct fuse_req *req;
+
+		req = list_first_entry(&queue->fuse_req_bg_queue,
+				       struct fuse_req, list);
+		list_move_tail(&req->list, &queue->fuse_req_queue);
+	}
+}
+
 static bool can_zero_copy_req(struct fuse_ring_ent *ent, struct fuse_req *req)
 {
 	struct fuse_args *args = req->args;
@@ -160,11 +213,18 @@ static void fuse_uring_req_end(struct fuse_ring_ent *ent, struct fuse_req *req,
 	ent->fuse_req = NULL;
 	list_del_init(&req->list);
 	if (test_bit(FR_BACKGROUND, &req->flags)) {
-		queue->active_background--;
-		spin_lock(&fch->bg_lock);
-		fuse_request_bg_finish(fch, req);
-		fuse_uring_flush_bg(queue);
-		spin_unlock(&fch->bg_lock);
+		if (fch->bg_mode == FUSE_BG_MODE_PER_QUEUE) {
+			clear_bit(FR_BACKGROUND, &req->flags);
+			if (!WARN_ON_ONCE(queue->bg_local == 0))
+				queue->bg_local--;
+			wake_up(&queue->bg_waitq);
+		} else {
+			queue->active_background--;
+			spin_lock(&fch->bg_lock);
+			fuse_request_bg_finish(fch, req);
+			fuse_uring_flush_bg(queue);
+			spin_unlock(&fch->bg_lock);
+		}
 	}
 
 	spin_unlock(&queue->lock);
@@ -208,10 +268,17 @@ void fuse_uring_abort_end_requests(struct fuse_ring *ring)
 		WARN_ON_ONCE(fch->max_background != UINT_MAX);
 		spin_lock(&queue->lock);
 		queue->stopped = true;
-		spin_lock(&fch->bg_lock);
-		fuse_uring_flush_bg(queue);
-		spin_unlock(&fch->bg_lock);
-		spin_unlock(&queue->lock);
+		if (fch->bg_mode == FUSE_BG_MODE_PER_QUEUE) {
+			list_splice_init(&queue->fuse_req_bg_queue,
+					 &queue->fuse_req_queue);
+			spin_unlock(&queue->lock);
+			wake_up_all(&queue->bg_waitq);
+		} else {
+			spin_lock(&fch->bg_lock);
+			fuse_uring_flush_bg(queue);
+			spin_unlock(&fch->bg_lock);
+			spin_unlock(&queue->lock);
+		}
 		fuse_uring_abort_end_queue_requests(queue);
 	}
 }
@@ -278,6 +345,7 @@ void fuse_uring_destruct(struct fuse_chan *fch)
 		WARN_ON(!list_empty(&queue->ent_w_req_queue));
 		WARN_ON(!list_empty(&queue->ent_commit_queue));
 		WARN_ON(!list_empty(&queue->ent_in_userspace));
+		WARN_ON_ONCE(queue->bg_local);
 
 		list_for_each_entry_safe(ent, next, &queue->ent_released,
 					 list) {
@@ -366,6 +434,8 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 	queue->ring = ring;
 	spin_lock_init(&queue->lock);
 	queue->zero_copy = zero_copy;
+	queue->max_bg = fch->uring_max_bg_per_queue;
+	init_waitqueue_head(&queue->bg_waitq);
 
 	INIT_LIST_HEAD(&queue->ent_avail_queue);
 	INIT_LIST_HEAD(&queue->ent_commit_queue);
@@ -1096,6 +1166,9 @@ static void fuse_uring_ent_avail(struct fuse_ring_ent *ent,
 	WARN_ON_ONCE(!ent->cmd);
 	list_move(&ent->list, &queue->ent_avail_queue);
 	ent->state = FRRS_AVAILABLE;
+
+	if (queue->ring->chan->bg_mode == FUSE_BG_MODE_PER_QUEUE)
+		fuse_uring_flush_bg_per_queue(queue);
 }
 
 /*
@@ -1785,6 +1858,71 @@ static struct fuse_ring_queue *fuse_uring_task_to_queue(struct fuse_ring *ring)
 	return queue;
 }
 
+struct fuse_ring_queue *fuse_uring_bg_admit(struct fuse_chan *fch)
+{
+	struct fuse_ring_queue *queue;
+	int err = 0;
+
+	queue = fuse_uring_task_to_queue(fch->ring);
+	if (!queue)
+		return ERR_PTR(-ENOTCONN);
+
+	spin_lock(&queue->lock);
+	for (;;) {
+		if (queue->stopped ||
+		    READ_ONCE(queue->bg_local) < queue->max_bg)
+			break;
+
+		spin_unlock(&queue->lock);
+		if (wait_event_state_exclusive(queue->bg_waitq,
+					       queue->stopped ||
+					       READ_ONCE(queue->bg_local) < queue->max_bg,
+					       (TASK_KILLABLE | TASK_FREEZABLE))) {
+			spin_lock(&queue->lock);
+			err = -EINTR;
+			goto out_unlock;
+		}
+		spin_lock(&queue->lock);
+	}
+
+	if (queue->stopped || !READ_ONCE(fch->connected)) {
+		err = -ENOTCONN;
+		goto out_unlock;
+	}
+
+	queue->bg_local++;
+
+out_unlock:
+	spin_unlock(&queue->lock);
+	return err ? ERR_PTR(err) : queue;
+}
+
+void fuse_uring_bg_req_release(struct fuse_ring_queue *queue)
+{
+	spin_lock(&queue->lock);
+	if (!WARN_ON_ONCE(queue->bg_local == 0))
+		queue->bg_local--;
+	spin_unlock(&queue->lock);
+
+	wake_up(&queue->bg_waitq);
+}
+
+unsigned int fuse_uring_num_background(struct fuse_chan *fch)
+{
+	struct fuse_ring *ring = fch->ring;
+	unsigned int sum = 0;
+	int qid;
+
+	for (qid = 0; qid < ring->nr_queues; qid++) {
+		struct fuse_ring_queue *queue = READ_ONCE(ring->queues[qid]);
+
+		if (queue)
+			sum += READ_ONCE(queue->bg_local);
+	}
+
+	return sum;
+}
+
 static void fuse_uring_dispatch_ent(struct fuse_ring_ent *ent)
 {
 	struct io_uring_cmd *cmd = ent->cmd;
@@ -1843,10 +1981,16 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
 	struct fuse_ring *ring = fch->ring;
 	struct fuse_ring_queue *queue;
 	struct fuse_ring_ent *ent = NULL;
+	bool per_queue = fch->bg_mode == FUSE_BG_MODE_PER_QUEUE;
+	bool accounted = req->ring_queue;
 
-	queue = fuse_uring_task_to_queue(ring);
-	if (!queue)
-		return false;
+	if (accounted) {
+		queue = req->ring_queue;
+	} else {
+		queue = fuse_uring_task_to_queue(ring);
+		if (!queue)
+			return false;
+	}
 
 	spin_lock(&queue->lock);
 	if (unlikely(queue->stopped)) {
@@ -1858,14 +2002,21 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
 	req->ring_queue = queue;
 	list_add_tail(&req->list, &queue->fuse_req_bg_queue);
 
+	if (per_queue) {
+		if (!accounted)
+			queue->bg_local++;
+		fuse_uring_flush_bg_per_queue(queue);
+	} else {
+		spin_lock(&fch->bg_lock);
+		fch->num_background++;
+		if (fch->num_background == fch->max_background)
+			fch->blocked = 1;
+		fuse_uring_flush_bg(queue);
+		spin_unlock(&fch->bg_lock);
+	}
+
 	ent = list_first_entry_or_null(&queue->ent_avail_queue,
 				       struct fuse_ring_ent, list);
-	spin_lock(&fch->bg_lock);
-	fch->num_background++;
-	if (fch->num_background == fch->max_background)
-		fch->blocked = 1;
-	fuse_uring_flush_bg(queue);
-	spin_unlock(&fch->bg_lock);
 
 	/*
 	 * Due to bg_queue flush limits there might be other bg requests
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index 263d0f8b9714..5f066ea9735a 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -139,6 +139,11 @@ struct fuse_ring_queue {
 
 	unsigned int active_background;
 
+	/* Per-queue background budget and accounting (FUSE_BG_MODE_PER_QUEUE) */
+	unsigned int max_bg;
+	unsigned int bg_local;
+	wait_queue_head_t bg_waitq;
+
 	bool stopped;
 
 	/* how this queue's payload buffers are provided */
@@ -192,6 +197,9 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req);
 bool fuse_uring_queue_bq_req(struct fuse_req *req);
 bool fuse_uring_remove_pending_req(struct fuse_req *req);
 bool fuse_uring_request_expired(struct fuse_chan *fch);
+struct fuse_ring_queue *fuse_uring_bg_admit(struct fuse_chan *fch);
+void fuse_uring_bg_req_release(struct fuse_ring_queue *queue);
+unsigned int fuse_uring_num_background(struct fuse_chan *fch);
 
 static inline void fuse_uring_abort(struct fuse_chan *fch)
 {
@@ -222,6 +230,11 @@ static inline bool fuse_uring_ready(struct fuse_chan *fch)
 	return ring && smp_load_acquire(&ring->ready);
 }
 
+static inline bool fuse_uring_per_queue_bg(struct fuse_chan *fch)
+{
+	return fch->bg_mode == FUSE_BG_MODE_PER_QUEUE && fuse_uring_ready(fch);
+}
+
 #else /* CONFIG_FUSE_IO_URING */
 
 static inline void fuse_uring_conn_init(struct fuse_chan *fch)
@@ -251,6 +264,25 @@ static inline bool fuse_uring_request_expired(struct fuse_chan *fch)
 	return false;
 }
 
+static inline bool fuse_uring_per_queue_bg(struct fuse_chan *fch)
+{
+	return false;
+}
+
+static inline struct fuse_ring_queue *fuse_uring_bg_admit(struct fuse_chan *fch)
+{
+	return NULL;
+}
+
+static inline void fuse_uring_bg_req_release(void *queue)
+{
+}
+
+static inline unsigned int fuse_uring_num_background(struct fuse_chan *fch)
+{
+	return 0;
+}
+
 #endif /* CONFIG_FUSE_IO_URING */
 
 #endif /* _FS_FUSE_DEV_URING_I_H */
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 4b412a76225f..4ca724994af9 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -17,6 +17,18 @@
 #define FUSE_INT_REQ_BIT (1ULL << 0)
 #define FUSE_REQ_ID_STEP (1ULL << 1)
 
+/**
+ * Background request accounting mode
+ *
+ * @FUSE_BG_MODE_GLOBAL: legacy accounting, a single global spinlock
+ *	protects the background accounting of all queues
+ * @FUSE_BG_MODE_PER_QUEUE: each fuse_ring_queue owns its own budget.
+ */
+enum fuse_bg_mode {
+	FUSE_BG_MODE_GLOBAL,
+	FUSE_BG_MODE_PER_QUEUE,
+};
+
 struct fuse_arg;
 struct fuse_args;
 struct fuse_pqueue;
@@ -223,6 +235,12 @@ struct fuse_chan {
 	/** Protects: max_background, num_background, active_background, bg_queue, blocked */
 	spinlock_t bg_lock;
 
+	/** Background accounting mode, set at INIT, read-only afterwards */
+	enum fuse_bg_mode bg_mode;
+
+	/** Per-queue background budget (FUSE_BG_MODE_PER_QUEUE only) */
+	unsigned int uring_max_bg_per_queue;
+
 	/** Flag indicating that INIT reply has been received. Allocating
 	 * any fuse request will be suspended until the flag is set */
 	int initialized;
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index e9552be3637b..a899ef069e0c 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1276,6 +1276,7 @@ static void process_init_reply(struct fuse_args *args, int error)
 	struct fuse_conn *fc = fm->fc;
 	struct fuse_init_out *arg = &ia->out;
 	bool io_uring_enabled = false;
+	unsigned int max_bg = 0;
 	bool ok = true;
 
 	if (error || arg->major != FUSE_KERNEL_VERSION)
@@ -1408,6 +1409,10 @@ static void process_init_reply(struct fuse_args *args, int error)
 			if (flags & FUSE_OVER_IO_URING && fuse_uring_enabled())
 				io_uring_enabled = true;
 
+			max_bg = fuse_uring_per_queue_bg_budget(flags,
+								arg->max_bg_per_queue,
+								max_user_bgreq);
+
 			if (flags & FUSE_REQUEST_TIMEOUT)
 				timeout = arg->request_timeout;
 		} else {
@@ -1418,6 +1423,9 @@ static void process_init_reply(struct fuse_args *args, int error)
 
 		fuse_init_server_timeout(fc->chan, timeout);
 
+		if (max_bg)
+			fuse_chan_per_queue_bg_enable(fc->chan, max_bg);
+
 		fm->sb->s_bdi->ra_pages =
 				min(fm->sb->s_bdi->ra_pages, ra_pages);
 		fm->sb->s_bdi->io_pages = fc->max_pages;
@@ -1480,8 +1488,11 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
 		flags |= FUSE_PASSTHROUGH;
 
-	if (fuse_uring_enabled())
+	if (fuse_uring_enabled()) {
 		flags |= FUSE_OVER_IO_URING | FUSE_HAS_IO_URING_BUFPOOL;
+		if (fuse_uring_per_queue_bg_advertise())
+			flags |= FUSE_PER_QUEUE_BG;
+	}
 
 	ia->in.flags = flags;
 	ia->in.flags2 = flags >> 32;
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 7435e09c87fe..847c93a8c746 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -248,6 +248,9 @@
  *  - add bufpool offset field to fuse_uring_ent_in_out struct
  *  - add FUSE_URING_ZERO_COPY, FUSE_URING_ENT_ZERO_COPY, and
  *    FOPEN_IO_URING_ZERO_COPY flag
+ *
+ *  7.47
+ *  - add FUSE_PER_QUEUE_BG
  */
 
 #ifndef _LINUX_FUSE_H
@@ -283,7 +286,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 46
+#define FUSE_KERNEL_MINOR_VERSION 47
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -464,6 +467,8 @@ struct fuse_file_lock {
  * FUSE_REQUEST_TIMEOUT: kernel supports timing out requests.
  *			 init_out.request_timeout contains the timeout (in secs)
  * FUSE_HAS_IO_URING_BUFPOOL: kernel supports io-uring buffer pools
+ * FUSE_PER_QUEUE_BG: kernel supports per-queue background request accounting
+ *                    for io-uring.
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -512,6 +517,7 @@ struct fuse_file_lock {
 #define FUSE_OVER_IO_URING	(1ULL << 41)
 #define FUSE_REQUEST_TIMEOUT	(1ULL << 42)
 #define FUSE_HAS_IO_URING_BUFPOOL (1ULL << 43)
+#define FUSE_PER_QUEUE_BG	(1ULL << 44)
 
 /**
  * CUSE INIT request/reply flags
@@ -942,7 +948,8 @@ struct fuse_init_out {
 	uint32_t	flags2;
 	uint32_t	max_stack_depth;
 	uint16_t	request_timeout;
-	uint16_t	unused[11];
+	uint16_t	max_bg_per_queue;
+	uint16_t	unused[10];
 };
 
 #define CUSE_INIT_INFO_MAX 4096
-- 
2.56.0

