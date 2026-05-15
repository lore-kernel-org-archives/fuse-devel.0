Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C9D3CF03E
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 04:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778821023; cv=none; b=ln3unjWQTcWtYbl883fUxZzHoab0tbg/BKWB78UXhWHQPLAHYWYofF6x730o56FBjf58nzW/srXxmihVLNyje9NV4Qz7C9Z8aZuJW3dgcPLaabzRTk2rZlu+7PBh3j0V7FZ2A6Bjj3QWmJ5QBj6ClEqvpzmsZ6aPg+qTgCEqJpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778821023; c=relaxed/simple;
	bh=eQWJsLFYCOoe95iYFeHwefeY2wFnssmrqOjdoF/rwMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0OySmN5htFIuQEcHBQPe27ywLgoT92DajhlZuJ9d1rOvCI6f/E21osU34YbFL0T+nH8fLbdGbkBKYmxExB/o+qnSP3JFu3aCyF3XDjpbHLFe/rQZXyXoSKgGPZIRihwMfK4UdRqgmKvi4lBFzwvqCN6wnYeVxWDZImxO8y4hNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pLVlfLNV; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pLVlfLNV"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6579254f996so6657207d50.1
        for <fuse-devel@lists.linux.dev>; Thu, 14 May 2026 21:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778821021; x=1779425821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPsE9qWZdOb1TR1AHrKLa6S3PYltxNEP+yyKsE9R4/0=;
        b=pLVlfLNVnnwK6/Q4e8+O89KYqdub0m/hG+1yKOoxOqKGhPniU8rAJtDxr6TI5hBB3K
         gZsHrUhsqtQu+5KXe6AErGP6PdJY7HtdzeD80YssvMYw9oxApf2mS8uKqqrSSYleuIo+
         XeR8YEBIAoKfyDpnqJGIuwzYpumIm+4VM6pccYvMHq+C/1ACs2VyL0nhLr6wpv3gKiJu
         xpSlATzvhOQDDAUhkdyf4NV8Rzl4+ktwMK/K5r+D9k+13RxR9IKX/ZCiBf7T/dk/cOGY
         QgSELbKmznCXuxrHbCpL0f3Cx5WKDZNPss+bmyrn7xDJ9W8cu2w8Xb1oG3dJ7xvoRfU7
         tdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778821021; x=1779425821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QPsE9qWZdOb1TR1AHrKLa6S3PYltxNEP+yyKsE9R4/0=;
        b=Mzevs+c2N1WGOFsySdUTx7sVnsibApjChQKox7GLj6jWHi6yCubVsP4fTyZQSM8dp9
         rfnihP/O6c6A5YNFuLM3XG5Yf/h2yWBfMSO9F5WrTILFwXAZHXy8szzqJIu3BNEocQm4
         M5OwxZCZKbypo6/G46bk/EOuI2kd807TccRARDpMdZ0jGOFDLqudk5sHgFHYhbf99JHe
         Yn5D1jj7P6ti9qnBfewLFPKwtCwvXyCVbz9PnBdZbXH09bM2y+/FOygqpILcXI6aLGmi
         oKuQrsKMLpZncNT8Uto2lbq0uRWeAQ5+vAsMOSJ/FSk6UNvszDTA+71ZhSY8Ps/e0BG6
         synQ==
X-Gm-Message-State: AOJu0Yx4MdRYZxtGlM16hBLqoRbAKCkPWltHzpGF26wmGBV8fcOpQugq
	ULe9fmOEPn324grDeNq+F3RdMMbx1PxRwG0CXYuhJtO+6s2qhWtmTLP1
X-Gm-Gg: Acq92OHQxpetvZDw+Nn/GhvWHD/ti4gomD6G08bHcx/5iIuSgiEdBAmZ9bvpXG/7wpo
	Te2ZlNjYP/6+bT0XRJI09So7sL/8a0tDRlif0ubLg5RAVBkwTsCXT3qkJz/ZDte10aZR5w6E5kL
	cNBiWdmwmXLqs3PzMfnYhqrmcvjvydnZAzdKYNsRyFmDzDSv53/HR4Y4yK20bNV3JAbX7+hm4KA
	gbyUvasvsaqGBbjckS96J1/x05kmAIk8tAxva6VUXMQLpF71yTQjx5NcvU/zhxAl2QEEcbsCtXl
	95qfCvTbpuOH8J6WvQeSjLsPqG9+CmGjxMfZFAhYnZcsV+IXffOlqDoTxoatYCEpuoD4mnZW92Q
	XFBtqYl35ENSb7IZzFLgpqJhmTiLdoQ4sAXptwrLQF57+BoIUgBGnSmDIGK0iOvER98GGLP3v9D
	FUkmhzllWoctUTVy1ym3pX
X-Received: by 2002:a05:690c:c513:b0:7bd:6432:dab with SMTP id 00721157ae682-7c95ced6eaemr25719707b3.43.1778821021047;
        Thu, 14 May 2026 21:57:01 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:4d::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c955d8d3aesm8372687b3.30.2026.05.14.21.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 21:56:59 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	bernd@bsbernd.com,
	ali@ddn.com,
	horst@birthelmer.de,
	stable@vger.kernel.org
Subject: [PATCH v1 2/3] fuse: fix race between registration and connection abortion
Date: Thu, 14 May 2026 21:55:40 -0700
Message-ID: <20260515045541.1171335-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260515045541.1171335-1-joannelkoong@gmail.com>
References: <20260515045541.1171335-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes this race:
- thread a: io_uring_enter -> register sqe ->
  fuse_uring_create_ring_ent -> allocate ent but doesn't grab queue_ref
  yet
- thread b: fuse_conn_destroy() -> fuse_chan_abort() ->
  fuse_uring_abort() is a no-op due to queue ref being 0
- thread a: grabs the queue_ref, queue_ref is now 1, rest of
  fuse_uring_do_register() logic executes
- thread b: fuse_chan_abort() returns, fuse_chan_wait_aborted() now runs
  and calls
  "wait_event(ring->stop_waitq, atomic_read(&ring->queue_refs) == 0);"
The abort/unmount thread will hang indefinitely in unkillable state as
nothing will decrement queue_refs or wake stop_waitq, and the ring,
queue, and ent are leaked.

Fix this by checking fch->connected under fch->lock after the created
ent has grabbed a ref count on the queue. This ensures that in the
scenario above, it is guaranteed that we either release the queue ref
and wake up stop_waitq (in case fuse_chan_wait_aborted() is already
waiting) in fuse_uring_do_register() when we detect !fch->connected, or
if the connection is aborted after the check, it is guaranteed that the
async teardown worker will be running in the background cleaning up ents
and decrementing the ent's ref on the queue, which will unblock the
eventual queue and ring teardown.

Fixes: 24fe962c86f5 ("fuse: {io-uring} Handle SQEs - register commands")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index cd75f61018ec..d9108b5b5db8 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -977,15 +977,26 @@ static bool is_ring_ready(struct fuse_ring *ring, int current_qid)
 /*
  * fuse_uring_req_fetch command handling
  */
-static void fuse_uring_do_register(struct fuse_ring_ent *ent,
-				   struct io_uring_cmd *cmd,
-				   unsigned int issue_flags)
+static int fuse_uring_do_register(struct fuse_ring_ent *ent,
+				  struct io_uring_cmd *cmd,
+				  unsigned int issue_flags)
 {
 	struct fuse_ring_queue *queue = ent->queue;
 	struct fuse_ring *ring = queue->ring;
 	struct fuse_chan *fch = ring->chan;
 	struct fuse_iqueue *fiq = &fch->iq;
 
+	spin_lock(&fch->lock);
+	/* abort teardown path is running or has run */
+	if (!fch->connected) {
+		spin_unlock(&fch->lock);
+		if (atomic_dec_and_test(&ring->queue_refs))
+			wake_up_all(&ring->stop_waitq);
+		kfree(ent);
+		return -ECONNABORTED;
+	}
+	spin_unlock(&fch->lock);
+
 	fuse_uring_prepare_cancel(cmd, issue_flags, ent);
 
 	spin_lock(&queue->lock);
@@ -1002,6 +1013,7 @@ static void fuse_uring_do_register(struct fuse_ring_ent *ent,
 			wake_up_all(&fch->blocked_waitq);
 		}
 	}
+	return 0;
 }
 
 /*
@@ -1118,9 +1130,7 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 	if (IS_ERR(ent))
 		return PTR_ERR(ent);
 
-	fuse_uring_do_register(ent, cmd, issue_flags);
-
-	return 0;
+	return fuse_uring_do_register(ent, cmd, issue_flags);
 }
 
 /*
-- 
2.52.0

