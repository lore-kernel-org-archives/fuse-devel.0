Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F484288530
	for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 21:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854211; cv=none; b=CUZ0M9yaou9Ssw9VjFGl/OLY4SBRLdGCCDfyeWCsYfYUuHuUHo2q4KufWQXGfHwTwRLhHaR96wbSO1v29L+0Hpx9eycMV8OBhgwFmRcXT8cogy6oZpe6GRk7nsulGLTHpKDrJkKsA3xlN+sqbkYVMhkbcDnCEoyKsHVGY9RbvoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854211; c=relaxed/simple;
	bh=fz+sYTcLsSggtWd3tRJ5ncadKwAlDiqeYEO/3jTS3JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BnhdXTXt3k/jhAaAa8GPYSUptNlVCVDrEZ/f7+FxCza+oA23JNjvmFMAEx2L7Aze0Q4qvAxKU1EUCG6F/Ua+NaQdmeQPgrVzfm47zYiUHwDnfXltCRWoSyj5d4OP55eQ53qyAbp9xgi0e3WQqXUMr84/uH9br8gYkgt07ZivXNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2/T84NH; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2/T84NH"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso570670a34.1
        for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 14:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782854209; x=1783459009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hx5rdC/+S9lDx+8pckGeykhri//NWK2bTDXnSHPwufo=;
        b=E2/T84NHkzsGawoILb47JFnAZJPWUuWNlDPdPPn0jP6riRQ255X591zbIFb0oQAZiO
         Y/k+H1JzWxH3wf6KYas7hpYJfe4zjlcq0dSqVngyLeOLYKbqxUWCRtMFJTcMwLmZ8gdz
         aJourrbcYggWCQgIXtmbKfL8YQbGd6izD7+TCwFscaO/Dwx9Ed0Wv3iQxZmvnbyjJGVr
         IlIJshJfSd9EVclReClVLZCf3n+IIRqwD2lOwL4qdfBdofrSll68dPGZlGW9lSr65vtd
         CEU7UbLAkZUni4mx54AAICjDsTHXVFapw4l9ZDy6HbjaVQz2Z1HdSkoRY7jnPDOoQTxf
         QfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854209; x=1783459009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hx5rdC/+S9lDx+8pckGeykhri//NWK2bTDXnSHPwufo=;
        b=iMxYpc1cTwMxbKZywh7QRaC52P/v0lxonXI7p3hkN7D3ciQnrhDf1+9WpUWkiN+NzF
         gUtU03mfp/NxKvp7SB+JrJdiel8kXGab8S6VRwjMacAqmsFBw0J38rZzaok/Noe1pDaV
         hF/EOByLCTrvgqIKfdRVdYYf3Exgb65hoFN0JffemeMoo8Eshfj7Hf2oM3xSLtZIlD/d
         y+hQoIEaGnCD6fw+2csAYhKSy/7k1hCRzS8bc/xIjMn9xd+vP0NhVuJFant2q49jQAkL
         wdZ8Xn6g2fMFJh3nr68727DoBMNAqzcSVUdGhfkvjpp/8UdIF+6zUA72MwoA6Bzu0did
         jkfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LfuywqLGE8Rq1zKSZ0Kki/9r6SyJFORv+IATIvUIR7EzD+hPSpi8ixDKGxydhU0j3ikoilP8FZxJw@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgw+tremcoW9SiU0swkkrMV5en0G0lv0IImSDncKRe0M0+HtEi
	R1MfTuF4kiKjQVfDWPgTOvRlfD19FrX6a4V83wZbIFvOk6ogJIJuj/7O
X-Gm-Gg: AfdE7cm0AQsAM0WL7FkK1T90sExirNX//qFrHdvVdmC+FMtY4XuuXmZSL9dbGKYBrys
	FMtbBreDFOemHKVWe9rQ/S50hVHiYqSoucSjlKtd5ubxx4r4o+cSiy8cBe/uVRHOU9jy+lW66CD
	BV4UUKXDIQgjMNRrqNhtz5n4ms/ASH72yUB3gdrCmi4T+X8r7FSmHtltWQhuEHqlu8rShcDXPRM
	tlWq373/xSkVXLYBUT6gDk2nAKcDzah6Y+zIl1lB/XtSRF9aYGHUuepTVAjrI/7xpk+R9q9WVf6
	Vh8EZ7j12bJ3o39bryM/yg7LLg1HPom/sIesuv1qq7wUhwzODmkKDGvsIA3OV3ok2ffdIMfOkH3
	qKuWZ+ztGPaKxpQwxYu3tjzt6mdcyUoJO+i5A0cH+Nx7AzVYInsyEw0bofXA+fhuCLB3MJGZRtd
	hrUcq06lbaqklBj9IC3IwXSsNAgHFd7n3ii8M4+MtmIFMTeH8wmOWmyA9Ys9NshpH6vu4SfZk81
	Jo=
X-Received: by 2002:a05:6830:83bc:b0:7e9:cddb:142a with SMTP id 46e09a7af769-7e9fc0a6205mr1405292a34.7.1782854209060;
        Tue, 30 Jun 2026 14:16:49 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:40::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec34f898sm3268726a34.27.2026.06.30.14.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:16:48 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v5 1/6] fuse: decouple fuse_ring creation from ent registration
Date: Tue, 30 Jun 2026 14:14:30 -0700
Message-ID: <20260630211436.2062816-2-joannelkoong@gmail.com>
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
index 5763a7cd3b37..9ab1f1f551ce 100644
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
 
 	/* Make sure stores before this are seen on another CPU */
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
index 77c8cec43d9c..55e0ecdb2058 100644
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
@@ -1176,15 +1175,10 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
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
@@ -1195,7 +1189,7 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
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

