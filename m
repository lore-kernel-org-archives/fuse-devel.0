Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E2D494A1B
	for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 19:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734032; cv=none; b=C0L3Xr0yzb25ibidFUpVellhhQ1TGNvPnRYggF1ZIfd5EjPiMfkE+ocy4yQ7bDUVwf8SX5E4OrwnDtau0DO6/iLD4MzsRgOtS17iy7iyjhCCkU3rOK0ndLXEQ8wz/zu2pyrxT+27nohF5oZH2ryYrYZYAyfRD5mdHfuc2P8fGTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734032; c=relaxed/simple;
	bh=gclOFmkFIyrJQuZ3YRuE7/WMWfJ18AUHVJJ/+jcU4xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1tDoWH1+mdzRWifutsU2/FW7O8g0nSU5uvdh/gTSy4XW5oIUQ6VC+sWLMZdXDETX034qMqAmImbs/4K3UPdqMTyJjDUvlzF2wXZQ30AP7b4ymOEdCmauDgeXySFBIQ9McYRcZqF/lu1XXYWnW7A/U4E6pJhmymCVAVduAZC1Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tw8BObYY; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tw8BObYY"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1536982a91.0
        for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 12:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786734030; x=1787338830; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UAWyS+XWE6lL8cyq+vx8gLQ3K0j7s/zgmeawxJpYefQ=;
        b=Tw8BObYYj6LECp/45ZHD42pRyD52DWyENsnDFA7kswv57xh9J6C80VD7D0s+nlT8Sy
         4VsGeZFxbnrgINTNfqFtxGqMt/h9IuWm1H5UgfLO/rrEFD+V1RwNUbB8xyd/OkkObXqd
         M5VkyMXLXTTl1gz9VzACuTMtA6Yn3Va2L6gcHfNSHSFnySnWoDr0ovLwM0V6SCQZKgst
         zWpLECG5Z21DyjU2UhyPY63ZJHgJiL82Cfd8EsFxOLY86Y6Yl7r5FZuxpJ0gR4fLj7d8
         I5cFBLTm1QYyjrqUt+cB3sD27jYjKnBCT+NCE+IF/x5wWUGHZ5gQYqycx32y/PYfFdJ0
         ySnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734030; x=1787338830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UAWyS+XWE6lL8cyq+vx8gLQ3K0j7s/zgmeawxJpYefQ=;
        b=qvTbBAuHrW8TeLdKU+NmTbgsH4hq78Pu8+qUTP3vbB6PQLzkwoe6MAgkKb632TV899
         91Nerk9DScYbvh2NHx73Iq+TCp7GsC/2uMwJnH2oewiEb/QFeeeglI9epLOr3PI60xex
         HaCCC3zRML/ARBEDLwPODAzUkZ4tl6eibMpwmA5XsDP/TwV2U2M8aVxMGiFJW3oMuzLv
         cv6Sa7CuDUluB8/7FzZIq0gN7cPoQhOATVsWdB8gDuY5rvRHWjSZlh3AAZf9kADptYds
         dcP+PMxrsy5j0NtQ5crtF3rRfQgtD2vi9JREg/wjuxUUC3Ck8DFMMOYvFMq6ND6GpjAc
         GuLw==
X-Forwarded-Encrypted: i=1; AHgh+RqFrLFPhaytPN2Bdad+jaQ+rtRvcwhF3Qt4w1y20FFa02ohJDfijMkJYQ2jzLoGNUkDZpWjM88xLd71@lists.linux.dev
X-Gm-Message-State: AOJu0YxUcyVDjQC1yxmWFAed+47oeWC5D2EBMqvSeJaN7plRBnj0Iql6
	7bRXoY3d8JHUG37B6cWh8wSAzJQc7rKudSLfOH17a8wix0IMVQZGKiGa
X-Gm-Gg: AR+sD12ocUwQaIRETUf8J5QEYv2/X0BDRx2zrJxZoxxn0zgdH1IQgkOn33phwnxMSHb
	tKrksZOHpLAczNSAHhEok7SgLdQxHbakqt6ILtQ2lEr9N8DKxpeqqnsO6PuEVJqQxARvOhxx481
	V9Y89ue84zvGgTcM5LRH2wM9CEkfcukNmR2TPgcpZ5x5iJpTOdN9wamEaIqoYXrqBXtnOFpQ9ao
	1zo7TLskihwh9U8VDHPYeoZTWQ+E4Y7SXedD4Vih94/UdCzzaio5e67BZveRT5tmwbkwOZKi2zo
	gjv+RxxwSY5NBZpAunEGuekZKX4EBx/ypSHt3eVgQ6jGFljB6XzskLipkjmU6q7PXZ/WMVvxh4e
	iO7RZh0MP6Ra5ry+uM9iAqUgCOLUySbH+WU6UyL+ZT5p9CG9NgYZ3fOztbnTfY8z/Inulc5cmQC
	WKxwSo1xnLoScmdIYorR+cX6MvzFY2AUMtnmTAhHXIXy2WIof1d678bpsoX72FbqtKyRtuXlfMq
	l8XykFSSHPTww6tRFceRS5fwBtpaH2GzHCGhDm6fFbuRQ==
X-Received: by 2002:a17:90b:528f:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-3933e5d202amr8961921a91.10.1786734029909;
        Fri, 14 Aug 2026 12:00:29 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:54::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eb78f1a4sm3655127a91.17.2026.08.14.12.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:00:29 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	amir73il@gmail.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v7 1/6] fuse: decouple fuse_ring creation from ent registration
Date: Fri, 14 Aug 2026 11:59:41 -0700
Message-ID: <20260814185946.3679478-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260814185946.3679478-1-joannelkoong@gmail.com>
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
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

Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev.c         |  8 +++-----
 fs/fuse/dev.h         |  2 +-
 fs/fuse/dev_uring.c   | 26 ++++++++++----------------
 fs/fuse/dev_uring_i.h |  5 +++++
 fs/fuse/inode.c       |  4 +++-
 5 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 27dafda2a841..d8f97943e973 100644
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
@@ -412,11 +415,6 @@ void fuse_chan_set_fc(struct fuse_chan *fch, struct fuse_conn *fc)
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
index c8488ebc1d1f..9616778505ba 100644
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
index f7a0a0860a04..33773c7d129a 100644
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
@@ -1433,6 +1434,7 @@ static void process_init_reply(struct fuse_args *args, int error)
 			.minor = fc->minor,
 			.max_write = fc->max_write,
 			.max_pages = fc->max_pages,
+			.io_uring_enabled = io_uring_enabled,
 		};
 		fuse_chan_set_initialized(fc->chan, &cp);
 	}
-- 
2.52.0

