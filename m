Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F303E5570
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 19:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780946548; cv=none; b=JF8zBO+Z0MblZ1s/LzikbXeniZe8EJikdIvPQo3WtpDAW2nPvY6ptmRN22ybeuHDH+ip1X9HktlSIMG5/Ko6UGI7UW2MnxVVHbcN92LpgGmsjfBPZ/BIKy3OQ/gHf67zkeOozu7YC3F1HKaNjy5DP38F3K9OV5UHENXzxJkBJHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780946548; c=relaxed/simple;
	bh=AHd5YeVtutAbZkxadD/aQY5HB+EyJsk8qeRwSqLawfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KNzQgaOWJluMuJYO5Ie3jP702ZTeRlgswdH8gtpPttm/HVSg9KCoPogcjZ92JhhaQB2Rc3cCPmnotjXe0NJnbe+gTOtx5kbOpes7tGYM+uzlOZRonDIqgS8CsSm17egSFij5CzWr9CfCDcwL/TNxyB6ekDXkP22uSfRtdbq0thk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijom/3q/; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijom/3q/"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so2401023a91.2
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 12:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780946547; x=1781551347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwMIyvXLF7QVH+M7je+E+kLYonxVYHkOjT0cHPKyEmk=;
        b=ijom/3q/dCQC1/n9jbds5sJBwHoq05ke4Bg7PAIkMtWm/CC52h9ltzMvM2OKmfwnD+
         fY69ZCcN9wIfNzP2woe8yaXn6FI2d9Dr1ni6U+TcOx7EyySs92XPMSIuYTyC7o2CAZEq
         ClyZWcBB15X7OreWbQrdjcGIJ5qUTZZyCCdXsS49qpkqOC/P+4OygRyyYQD7qHF9o1uH
         De+alXTEE3rDKu0AMSNErJe2k1w8VIK5eBn47szj3SdL7CHQO55Sjn5fmtNr/oNci4I/
         XFk0YgBbh5nF3s2MOTXy56ny1cNB90QboVGItCWfQ1MP8cYO/B2kkf5KOP66undJaP7n
         3JJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780946547; x=1781551347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EwMIyvXLF7QVH+M7je+E+kLYonxVYHkOjT0cHPKyEmk=;
        b=TOz5nWFyuCcdrfJeU2xFivNVkbvLj8HMIg3FSsQBzlVTaXrEkTyOGnUqU9WV9rQzkz
         7iv55NpcD8L4r/au0VJaLAegFQoQJk0QfV+sfY8CcKC1uyDBLUCpdDBjpe8VfYef7z5e
         pCtdoddxPBzn2iDWxE4ZkBCrmpdzsxSYly11ZBD8QfBfXmg1lZMiDHR2Peqwf9225QG6
         dcCNsOsPTbYuPRw0v8GThXcSC/niYyc+VtEK4mUwqefAhP8NzpuTZ4tTp3GuFXRHhPn9
         Tu/o2Ty0bKWZMBL+hc2qFAOFJZNogYYklPH3uWfn0ardeTGS75HC5dKQKfKbr7pIJMmU
         C7vQ==
X-Gm-Message-State: AOJu0Yx8S353xfeODnHxB++vHWvbBnjnFPxTktrNI1OoGk6qIpV+FjUf
	kjfqpU3g2pQ5IpzlI88lVoF8ZOLyOfa4W5FexXCaqU9qkBYy7bBo/Aj7
X-Gm-Gg: Acq92OF1j71wiA6kgpX3gKIBfAiei1OCohTIilSgUqu1oBcWxZXCygpsGOA2L99uEpg
	K8ooUQA7nNVCA3457QzZVu5haN13VV5bZTYI24jueFB0WAl0lkdzj0LBQQh332O2AJIn4ZySYZX
	Twgb5YEC4iaDe/72pf4MF9Q5/xVyVfPhVeynudaRgBsHTJNf9W3uQ40b5ltwyVUNvgaPKzqkUrS
	/TPJhbdrHSAK72oE2QwW9ER38xaKn7oYOSy4R0Y0qCWuP7hI/vQRcx4C5OUs4c1uzCN2iU+H0xQ
	NKWSGgBSBT/Rlz2LNRgxHGJWXBMr4XgfTT5O04TEFPXrf3FQDJw1eO5uMt5spiz2OwgKVl0LJ0a
	yWwd6O5aLDd9Ve2mN6ngFaz7T8tIVD+IurrW9zY0CRwBlG3FpIUZ/JZU7cSGyyUlXBGtC78pv9j
	k0EkeSpZFzT2UtFagbRtiA9CTdTG8=
X-Received: by 2002:a17:90b:514d:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-370efda7abcmr17435561a91.17.1780946546919;
        Mon, 08 Jun 2026 12:22:26 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a28c0esm17045538a91.12.2026.06.08.12.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 12:22:26 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	bernd@bsbernd.com,
	ali@ddn.com,
	horst@birthelmer.de,
	stable@vger.kernel.org
Subject: [PATCH v3 1/3] fuse: fix race between registration and connection abortion
Date: Mon,  8 Jun 2026 12:21:47 -0700
Message-ID: <20260608192149.23294-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260608192149.23294-1-joannelkoong@gmail.com>
References: <20260608192149.23294-1-joannelkoong@gmail.com>
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
Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e467b23e6895..99ebb7c9cc61 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -973,15 +973,26 @@ static bool is_ring_ready(struct fuse_ring *ring, int current_qid)
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
@@ -998,6 +1009,7 @@ static void fuse_uring_do_register(struct fuse_ring_ent *ent,
 			wake_up_all(&fch->blocked_waitq);
 		}
 	}
+	return 0;
 }
 
 /*
@@ -1114,9 +1126,7 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
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

