Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DD12E739A
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224797; cv=none; b=Ks12rZnK+aUKUAz1GgaE55Jt0XvHXWBA4pS2+SuX0PnhbfNRY8VnlDhfbJmKelndimBnZzE4U8o0z53yNwzr1HJHVmTwHz09LE281ydQCVy9JqEnBdS8IKH2/YPOv8hsE817Zgb+t3AaZd1w5bqVMEPFXOW2vndjH1y1hX/qGEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224797; c=relaxed/simple;
	bh=NZbB+mE4RbLbnLDWwG0wUF2Xe8E6hZu1pmZnzY42D+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FnLp+gn8lDR16XrTk9McLq5oCsZJP6qcC9lJIbhFem/0lvqLFcZ7T1Fo/FARVjM2kG16rjyi7EITTPcjSn9Wh+qVllAVNw1rnZqO3otEI2ivaHuYaulCxOnIieTjvggVRbDU+r/875aJ9jk1R6Gw8hrCde9yLdC8vl4+oSu2GlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdKY2jYp; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdKY2jYp"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7ec1e9d3359so2852576a34.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 10:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784224794; x=1784829594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hN1A/MONGDwoEFbNi4mqDmUND+Z9zyr29s0MkeYxHgo=;
        b=kdKY2jYpzsbU+Z+AlE8aaInWqkpiNnTgd/Li+YR/P86wO6UINYxBXFBWP5uXUQK8Ty
         XvA+ITr62GMKW8JfywU/0hVBdcAeXIKoIMmDf+YxFKlJ6aGhOvrf83R6pzRZE28tPFoL
         MzHPN2XIItfxj8OoX6rPO5JNcAixlN7417JOqeksDGXNimi37elbzRCsiP5zUQJEJJQ7
         vHW0jeDpM9EXBYypx4FHTDzDIsFe5/9Ss9ox13wIH8Fep+hmQxinOn1cOdPvTCMHmScZ
         NOYB+r9YeYd4Onix7pZT8JWDYfZ1Rdmch/JErNtmqrNO1o4Sh9K0Ne/Ab8VfeZ63sVby
         ri2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224794; x=1784829594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hN1A/MONGDwoEFbNi4mqDmUND+Z9zyr29s0MkeYxHgo=;
        b=TD+boSO/nbgxaW0i1ZdXe7sn4BEQ2G5eSfwdwzf0lu/p40tMEp67h6OsjgyFg0y9hb
         iYIszOgWLAN4zB2GMO3kh2clwJGYfDjlh9abFQGSk36JB6fDEuU/zLHyUfAroa9cGfjW
         NkjyO4TKP951xIxLE6nshXBd22CNnjx3Hp8K7Rx3H28qVhFLM5yeerP4YCj4u755NawW
         hXDfDUklH0O/JE5ltzW7pyGd0VmMe8pgFRhJTzz2ZvQ6NOakerCJjEdQ1UxVoBogBwOa
         8D7uetGKKvpCjNwA1KH/TXCCNUiiYDP+EhgqM3EMAhHYo32+RwnnIwfjhlacuE6LCAe6
         oEmA==
X-Forwarded-Encrypted: i=1; AHgh+RqxeJASLsZLHCOgCcmdoHHLnnZQKOYcvop1Eutl7jW8/7silnu82o+g3pVTQYhhfkbp0ab3Vp2IdGmD@lists.linux.dev
X-Gm-Message-State: AOJu0YyTofrspW5/lWUZLb3rx48kQIyDHLbG/LVENh2w/AA08RZaqWP3
	MKDGjGfRNFYwBUjLGrtnaUKY3FxU0+6O6XE/cEIYzn0TYzWXFRKpiJXz
X-Gm-Gg: AfdE7cmnssr2sOplYzTUfep6xU3bYtwosuXR+sabx9ic2Ag5VJiDEqyqqN+5c7izaq9
	P6xRLIF+xtNYE2mekUso+W6tEPU0B37KJLsqAeb9PeYPCXhljeWEeAxtTndzUWaedF5kZ/jHQ5g
	0QM7+v2/f3jBUhTDbE8ChufgjmGp8S+WQmoyEvyzcYleM56Gc+/vs/gkDx1Lmrekmo+E8MEdOb0
	lYEpKXJ6le0hylySaKpVYCv4WcV8ZNmbhPQavxy44lXX73naRST7A2PC9ApBNSQY2cICMUFbHFw
	N3hf52NfyfYdgDJaFha7aJZR3HbSOaZ7mbKj3UbJvBO7Npqmozu5ecG4fMwHQk5O7zWylwwNFjA
	+QMuLiZgJbHHo95knwh2YQ4d3x787CD7zHzBDp2U8eLCrgVVvlPeuHAwPD+9LsAMFPKzEYCJwgD
	rcgB2Ej0i9cXrvMUWsBZFETi5RDkohwOMSvhei5rLs6381kNfoHD4iAg==
X-Received: by 2002:a05:6830:3110:b0:7e9:b537:1032 with SMTP id 46e09a7af769-7ec423f3492mr8699708a34.31.1784224794158;
        Thu, 16 Jul 2026 10:59:54 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:44::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf7b484sm19674913a34.10.2026.07.16.10.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:59:53 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	amir73il@gmail.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v6 1/6] fuse: decouple fuse_ring creation from ent registration
Date: Thu, 16 Jul 2026 10:59:03 -0700
Message-ID: <20260716175908.2339738-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260716175908.2339738-1-joannelkoong@gmail.com>
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the connection's fuse_ring is created lazily on the first
FUSE_IO_URING_CMD_REGISTER command. A server registers entries from one
thread per queue (one per CPU) and those threads issue their first
REGISTER command concurrently. They then race to create the single
per-connection fuse_ring, which required open-coded handling in
fuse_uring_create() to detect and protect against concurrent creations.

Decouple fuse_ring creation from ent registration and move it to
FUSE_INIT reply processing after a server has negotiated and set
FUSE_OVER_IO_URING. The ring is published before the connection is
marked initialized. fuse_uring_register() no longer creates the ring and
it instead uses the ring set up at init time.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev.c         |  8 +++-----
 fs/fuse/dev.h         |  2 +-
 fs/fuse/dev_uring.c   | 26 ++++++++++----------------
 fs/fuse/dev_uring_i.h |  5 +++++
 fs/fuse/inode.c       |  4 +++-
 5 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 8b68b24af9d7..d50792162d8b 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -75,6 +75,9 @@ void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_param *pa
 		fch->minor = param->minor;
 		fch->max_write = param->max_write;
 		fch->max_pages = param->max_pages;
+
+		if (param->io_uring_enabled)
+			fuse_uring_conn_init(fch);
 	}
 
 	/* Pairs with smp_load_acquire() readers of fch->initialized */
@@ -411,11 +414,6 @@ void fuse_chan_set_fc(struct fuse_chan *fch, struct fuse_conn *fc)
 	fch->conn = fc;
 }
 
-void fuse_chan_io_uring_enable(struct fuse_chan *fch)
-{
-	fch->io_uring = 1;
-}
-
 void fuse_pqueue_init(struct fuse_pqueue *fpq)
 {
 	spin_lock_init(&fpq->lock);
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index aed69fd14c41..8d25378c0918 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -22,6 +22,7 @@ struct fuse_chan_param {
 	unsigned int minor;
 	unsigned int max_write;
 	unsigned int max_pages;
+	bool io_uring_enabled;
 };
 
 struct fuse_chan *fuse_chan_new(void);
@@ -34,7 +35,6 @@ void fuse_chan_max_background_set(struct fuse_chan *fch, unsigned int val);
 unsigned int fuse_chan_num_waiting(struct fuse_chan *fch);
 void fuse_chan_set_fc(struct fuse_chan *fch, struct fuse_conn *fc);
 void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_param *param);
-void fuse_chan_io_uring_enable(struct fuse_chan *fch);
 ssize_t fuse_chan_send(struct fuse_chan *fch, struct fuse_args *args);
 int fuse_chan_send_bg(struct fuse_chan *fch, struct fuse_args *args, gfp_t gfp_flags);
 int fuse_chan_send_notify_reply(struct fuse_chan *fch, struct fuse_args *args, u64 unique);
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index bf9d51f2a508..b7c6100c4176 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -238,7 +238,6 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
 {
 	struct fuse_ring *ring;
 	size_t nr_queues = num_possible_cpus();
-	struct fuse_ring *res = NULL;
 	size_t max_payload_size;
 
 	ring = kzalloc_obj(*ring, GFP_KERNEL_ACCOUNT);
@@ -258,12 +257,6 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
 		spin_unlock(&fch->lock);
 		goto out_err;
 	}
-	if (fch->ring) {
-		/* race, another thread created the ring in the meantime */
-		spin_unlock(&fch->lock);
-		res = fch->ring;
-		goto out_err;
-	}
 
 	init_waitqueue_head(&ring->stop_waitq);
 
@@ -278,7 +271,13 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
 out_err:
 	kfree(ring->queues);
 	kfree(ring);
-	return res;
+	return NULL;
+}
+
+void fuse_uring_conn_init(struct fuse_chan *fch)
+{
+	if (fuse_uring_create(fch))
+		fch->io_uring = 1;
 }
 
 static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
@@ -1178,15 +1177,10 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 	struct fuse_ring *ring = smp_load_acquire(&fch->ring);
 	struct fuse_ring_queue *queue;
 	struct fuse_ring_ent *ent;
-	int err;
 	unsigned int qid = READ_ONCE(cmd_req->qid);
 
-	err = -ENOMEM;
-	if (!ring) {
-		ring = fuse_uring_create(fch);
-		if (!ring)
-			return err;
-	}
+	if (!ring)
+		return -EINVAL;
 
 	if (qid >= ring->nr_queues) {
 		pr_info_ratelimited("fuse: Invalid ring qid %u\n", qid);
@@ -1197,7 +1191,7 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 	if (!queue) {
 		queue = fuse_uring_create_queue(ring, qid);
 		if (!queue)
-			return err;
+			return -ENOMEM;
 	}
 
 	/*
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index 55f8d04e4b0b..d721a4fc0215 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -135,6 +135,7 @@ struct fuse_ring {
 	bool ready;
 };
 
+void fuse_uring_conn_init(struct fuse_chan *fch);
 void fuse_uring_stop_queues(struct fuse_ring *ring);
 void fuse_uring_abort_end_requests(struct fuse_ring *ring);
 int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags);
@@ -174,6 +175,10 @@ static inline bool fuse_uring_ready(struct fuse_chan *fch)
 
 #else /* CONFIG_FUSE_IO_URING */
 
+static inline void fuse_uring_conn_init(struct fuse_chan *fch)
+{
+}
+
 static inline void fuse_uring_abort(struct fuse_chan *fch)
 {
 }
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index d975073c6029..ce4891a04a37 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1272,6 +1272,7 @@ static void process_init_reply(struct fuse_args *args, int error)
 	struct fuse_mount *fm = ia->fm;
 	struct fuse_conn *fc = fm->fc;
 	struct fuse_init_out *arg = &ia->out;
+	bool io_uring_enabled = false;
 	bool ok = true;
 
 	if (error || arg->major != FUSE_KERNEL_VERSION)
@@ -1402,7 +1403,7 @@ static void process_init_reply(struct fuse_args *args, int error)
 					ok = false;
 			}
 			if (flags & FUSE_OVER_IO_URING && fuse_uring_enabled())
-				fuse_chan_io_uring_enable(fc->chan);
+				io_uring_enabled = true;
 
 			if (flags & FUSE_REQUEST_TIMEOUT)
 				timeout = arg->request_timeout;
@@ -1432,6 +1433,7 @@ static void process_init_reply(struct fuse_args *args, int error)
 			.minor = fc->minor,
 			.max_write = fc->max_write,
 			.max_pages = fc->max_pages,
+			.io_uring_enabled = io_uring_enabled,
 		};
 		fuse_chan_set_initialized(fc->chan, &cp);
 	}
-- 
2.52.0

