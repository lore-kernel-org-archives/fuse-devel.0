Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A790B39B483
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331049; cv=none; b=Dgrq6UFG9eFpDLhmIh8eMIbv4iylkdzJRKLmGxcCjBZbLC4/mVHWoFjPVYQQLVJFpsWyXRhyTSnJHPYx6dVa+/U+arEmF24fYO354KbY+pBF6Awl4yRPyv21b4mUqIy9sqGGdfl7qiXoo9FDgSTsoWgDOdEhaEtTBvkRz1reGKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331049; c=relaxed/simple;
	bh=cuW4RAM7h5/qPuDbxPiV7iOPZiO8235c1yG7ZJFThkI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=gNPUGMov7hvd078jEhct0hzhoSxF/CkZRT7xlHlesqMsns21kuUiKgXyVpTUyq0v5gjXA5fKCK5Ob2559975VAlPFr3sRITLhEqkl6aCh9pkejncnjiVxb5ALnxWGkf3hD2trqEkD2lzyNOZFJjo0dpnhC6JeGHp1S7gGvpEFR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nm9j4U0H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nm9j4U0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mqg0UPrGn0jGPYkWOZ8y2ITdrMXe8Sb0M3HSxVKPWB8=;
	b=Nm9j4U0H2lguvUm4ZcCK93uBe2WpUY9TLGSP19xTaLNQzC1E///Ei4uf/ATLYNeWlMNVGn
	P8dJ9fH7l6KZ2LsF6EGw2h20ICvzQy6SatCUVfHutsx28yeFZQpiePV4BPM5isTHcoBYC1
	+k69puN0HbZrmgephE8qNdKGYtq9Zq0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-bnlMkfJ9N2mIorbyEVlwHA-1; Thu, 16 Apr 2026 05:17:18 -0400
X-MC-Unique: bnlMkfJ9N2mIorbyEVlwHA-1
X-Mimecast-MFC-AGG-ID: bnlMkfJ9N2mIorbyEVlwHA_1776331037
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488d4ac6ff9so45273625e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331037; x=1776935837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mqg0UPrGn0jGPYkWOZ8y2ITdrMXe8Sb0M3HSxVKPWB8=;
        b=GalN+lZ2lFH0e+psbHGdyH12cRvKrBk28P+VBm6k0GswD3YmDOkXnX041dfWWujvlM
         yoBq2OSsb/s6jXEKg2e94P5NXrJLaGecjmU9S8Tv+BXmuyVnEOPHEFasX5mQOEw8tASu
         pV8grrXsDyNQ3AUFciH/7BYKUCHyPvTJBGWzuqh/GQ3WnaDGUaIJMHzWY5NkAgKVbTcz
         lQvlOSihe1PiixV4J39tdbH1bb8uMK4n93vRRD9uNTYnLBUI57PIgdpXEtrdOyBQJFBZ
         Tk+5s8QrbE4t+XuB/tgL6/trjAqtkqwG5+wYR0OYgH9rpxmmkgEP50poQQcOqAJVkAUn
         4Hfg==
X-Gm-Message-State: AOJu0Yyntq0dMNFHB48ufpl6fA4JO+fqXweEgMM803ca+aQnO6MLlCcX
	tdHU12Qhh7RyQTj8vint0bV2PV/G24tXLT4D+7a+QxnzJhjWwX7tUbDF4FDfMs0hLgXw2QasE6e
	9ndaoHX+4kYa8dekQxl3sDWiKCSsNZJy2XLMVGL/18ChtEkwVa1vR1blWq4EIHnH54RG/24h8SD
	XdXjqAtaWkcYIpnPxXa7kXTqqKDOzuDW8nEiu8/fLeHvnimB0=
X-Gm-Gg: AeBDieuomdnhERe4LyH+Km+6JeSVdDc0kgG2pSTQc1AMkP3aNDshX2rTnYu9BET4D8h
	328mX2E66YXNEUs08XL4TjW53UvwFTNwhALdl9ymLCa7gwzxodRIZAxqRZ/FKrBYg0R+7O2LcBx
	XJYlu+oRPSCGfS2/Kn35BApEVvD1K8JGzNTkWJ0+6/8WNi2W54EoP7a02Uakt48P6Qno2ACMtQZ
	PgwaRaeAyj7fCZZ0xEW9RBvJTYO5NCZzHvBnx3Bs3UlOFrsI6HVIMqXfsMJerKAzFrxmqu8oGdu
	ib75Lb5llwx2z2n03ANJwXi+lZlODTe3kpCVSges86PxysrEEc63JBxFnuW5UiaJPPWtTbsHw9W
	EU/AJ4tYBRJ0zfvcpJf3j3jzvtIX4AgdiKKJIoESaP/ru2EMOxzDRrbDd0PkK3XeqrqAFKoDSgl
	AShsQcTQ==
X-Received: by 2002:a05:600c:c0c8:b0:488:af14:f1de with SMTP id 5b1f17b1804b1-488d67b8de8mr258718065e9.4.1776331036843;
        Thu, 16 Apr 2026 02:17:16 -0700 (PDT)
X-Received: by 2002:a05:600c:c0c8:b0:488:af14:f1de with SMTP id 5b1f17b1804b1-488d67b8de8mr258717605e9.4.1776331036241;
        Thu, 16 Apr 2026 02:17:16 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:15 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 10/32] fuse: split off fch->lock from fc->lock
Date: Thu, 16 Apr 2026 11:16:34 +0200
Message-ID: <20260416091658.462783-11-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: HKBH8-dd3J_xhKDNbU8a6qoGdNwT5WmrQy_vVMsuLNk_1776331037
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

And document which members they protect.

end_polls() is called with both, outer fch->lock is probably unnecessary,
but doesn't hurt for now.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.c         | 29 ++++++++++++++++-------------
 fs/fuse/dev_uring.c   | 12 ++++++------
 fs/fuse/fuse_dev_i.h  |  8 ++++++++
 fs/fuse/fuse_i.h      |  8 ++++++--
 fs/fuse/req_timeout.c |  8 ++++----
 5 files changed, 40 insertions(+), 25 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 34ef117daa3f..9af71016591d 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -353,6 +353,7 @@ struct fuse_chan *fuse_chan_new(void)
 	if (!fch)
 		return NULL;
 
+	spin_lock_init(&fch->lock);
 	INIT_LIST_HEAD(&fch->devices);
 	spin_lock_init(&fch->bg_lock);
 	INIT_LIST_HEAD(&fch->bg_queue);
@@ -417,7 +418,7 @@ void fuse_dev_install(struct fuse_dev *fud, struct fuse_conn *fc)
 {
 	struct fuse_conn *old_fc;
 
-	spin_lock(&fc->lock);
+	spin_lock(&fc->chan->lock);
 	/*
 	 * Pairs with:
 	 *  - xchg() in fuse_dev_release()
@@ -435,7 +436,7 @@ void fuse_dev_install(struct fuse_dev *fud, struct fuse_conn *fc)
 		list_add_tail(&fud->entry, &fc->chan->devices);
 		fuse_conn_get(fc);
 	}
-	spin_unlock(&fc->lock);
+	spin_unlock(&fc->chan->lock);
 }
 EXPORT_SYMBOL_GPL(fuse_dev_install);
 
@@ -462,9 +463,9 @@ void fuse_dev_put(struct fuse_dev *fud)
 	fc = fuse_dev_fc_get(fud);
 	if (fc && fc != FUSE_DEV_FC_DISCONNECTED) {
 		/* This is the virtiofs case (fuse_dev_release() not called) */
-		spin_lock(&fc->lock);
+		spin_lock(&fc->chan->lock);
 		list_del(&fud->entry);
-		spin_unlock(&fc->lock);
+		spin_unlock(&fc->chan->lock);
 
 		fuse_conn_put(fc);
 	}
@@ -2055,9 +2056,9 @@ static void fuse_resend(struct fuse_conn *fc)
 	LIST_HEAD(to_queue);
 	unsigned int i;
 
-	spin_lock(&fc->lock);
+	spin_lock(&fc->chan->lock);
 	if (!fc->chan->connected) {
-		spin_unlock(&fc->lock);
+		spin_unlock(&fc->chan->lock);
 		return;
 	}
 
@@ -2069,7 +2070,7 @@ static void fuse_resend(struct fuse_conn *fc)
 			list_splice_tail_init(&fpq->processing[i], &to_queue);
 		spin_unlock(&fpq->lock);
 	}
-	spin_unlock(&fc->lock);
+	spin_unlock(&fc->chan->lock);
 
 	list_for_each_entry_safe(req, next, &to_queue, list) {
 		set_bit(FR_PENDING, &req->flags);
@@ -2485,6 +2486,7 @@ static void end_polls(struct fuse_conn *fc)
 {
 	struct rb_node *p;
 
+	spin_lock(&fc->lock);
 	p = rb_first(&fc->polled_files);
 
 	while (p) {
@@ -2494,6 +2496,7 @@ static void end_polls(struct fuse_conn *fc)
 
 		p = rb_next(p);
 	}
+	spin_unlock(&fc->lock);
 }
 
 /*
@@ -2518,7 +2521,7 @@ void fuse_abort_conn(struct fuse_conn *fc)
 {
 	struct fuse_iqueue *fiq = &fc->chan->iq;
 
-	spin_lock(&fc->lock);
+	spin_lock(&fc->chan->lock);
 	if (fc->chan->connected) {
 		struct fuse_dev *fud;
 		struct fuse_req *req, *next;
@@ -2573,17 +2576,17 @@ void fuse_abort_conn(struct fuse_conn *fc)
 		kill_fasync(&fiq->fasync, SIGIO, POLL_IN);
 		end_polls(fc);
 		wake_up_all(&fc->chan->blocked_waitq);
-		spin_unlock(&fc->lock);
+		spin_unlock(&fc->chan->lock);
 
 		fuse_dev_end_requests(&to_end);
 
 		/*
-		 * fc->lock must not be taken to avoid conflicts with io-uring
+		 * fc->chan->lock must not be taken to avoid conflicts with io-uring
 		 * locks
 		 */
 		fuse_uring_abort(fc);
 	} else {
-		spin_unlock(&fc->lock);
+		spin_unlock(&fc->chan->lock);
 	}
 }
 EXPORT_SYMBOL_GPL(fuse_abort_conn);
@@ -2617,11 +2620,11 @@ int fuse_dev_release(struct inode *inode, struct file *file)
 
 		fuse_dev_end_requests(&to_end);
 
-		spin_lock(&fc->lock);
+		spin_lock(&fc->chan->lock);
 		list_del(&fud->entry);
 		/* Are we the last open device? */
 		last = list_empty(&fc->chan->devices);
-		spin_unlock(&fc->lock);
+		spin_unlock(&fc->chan->lock);
 
 		if (last) {
 			WARN_ON(fc->chan->iq.fasync != NULL);
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 1a7a364c8131..794fb7c9ede3 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -243,10 +243,10 @@ static struct fuse_ring *fuse_uring_create(struct fuse_conn *fc)
 	max_payload_size = max(FUSE_MIN_READ_BUFFER, fc->max_write);
 	max_payload_size = max(max_payload_size, fc->max_pages * PAGE_SIZE);
 
-	spin_lock(&fc->lock);
+	spin_lock(&fc->chan->lock);
 	if (fc->chan->ring) {
 		/* race, another thread created the ring in the meantime */
-		spin_unlock(&fc->lock);
+		spin_unlock(&fc->chan->lock);
 		res = fc->chan->ring;
 		goto out_err;
 	}
@@ -258,7 +258,7 @@ static struct fuse_ring *fuse_uring_create(struct fuse_conn *fc)
 	ring->max_payload_sz = max_payload_size;
 	smp_store_release(&fc->chan->ring, ring);
 
-	spin_unlock(&fc->lock);
+	spin_unlock(&fc->chan->lock);
 	return ring;
 
 out_err:
@@ -298,9 +298,9 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 	queue->fpq.processing = pq;
 	fuse_pqueue_init(&queue->fpq);
 
-	spin_lock(&fc->lock);
+	spin_lock(&fc->chan->lock);
 	if (ring->queues[qid]) {
-		spin_unlock(&fc->lock);
+		spin_unlock(&fc->chan->lock);
 		kfree(queue->fpq.processing);
 		kfree(queue);
 		return ring->queues[qid];
@@ -310,7 +310,7 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 	 * write_once and lock as the caller mostly doesn't take the lock at all
 	 */
 	WRITE_ONCE(ring->queues[qid], queue);
-	spin_unlock(&fc->lock);
+	spin_unlock(&fc->chan->lock);
 
 	return queue;
 }
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index bfd349b88097..472ee0624a27 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -88,6 +88,14 @@ struct fuse_iqueue {
 };
 
 struct fuse_chan {
+	/** Lock protecting:
+	    - devices
+	    - connected
+	    - ring
+	    - ring->queues[qid]
+	 */
+	spinlock_t lock;
+
 	/** Input queue */
 	struct fuse_iqueue iq;
 
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 59bdabaf994b..6343218563b1 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -421,7 +421,7 @@ enum fuse_req_flag {
  *
  * .waitq.lock protects the following fields:
  *   - FR_ABORTED
- *   - FR_LOCKED (may also be modified under fc->lock, tested under both)
+ *   - FR_LOCKED (may also be modified under fpq->lock, tested under both)
  */
 struct fuse_req {
 	/** This can be on either pending processing or io lists in
@@ -520,7 +520,11 @@ struct fuse_sync_bucket {
  * fuse_mount is destroyed.
  */
 struct fuse_conn {
-	/** Lock protecting accessess to  members of this structure */
+	/** Lock protecting:
+	    - polled_files
+	    - backing_files_map
+	    - curr_bucket
+	 */
 	spinlock_t lock;
 
 	/** Refcount */
diff --git a/fs/fuse/req_timeout.c b/fs/fuse/req_timeout.c
index ef2e39e4dcf4..401d3545b0a8 100644
--- a/fs/fuse/req_timeout.c
+++ b/fs/fuse/req_timeout.c
@@ -89,9 +89,9 @@ static void fuse_check_timeout(struct work_struct *work)
 	if (expired)
 		goto abort_conn;
 
-	spin_lock(&fc->lock);
+	spin_lock(&fc->chan->lock);
 	if (!fc->chan->connected) {
-		spin_unlock(&fc->lock);
+		spin_unlock(&fc->chan->lock);
 		return;
 	}
 	list_for_each_entry(fud, &fc->chan->devices, entry) {
@@ -100,13 +100,13 @@ static void fuse_check_timeout(struct work_struct *work)
 		if (fuse_request_expired(fc, &fpq->io) ||
 		    fuse_fpq_processing_expired(fc, fpq->processing)) {
 			spin_unlock(&fpq->lock);
-			spin_unlock(&fc->lock);
+			spin_unlock(&fc->chan->lock);
 			goto abort_conn;
 		}
 
 		spin_unlock(&fpq->lock);
 	}
-	spin_unlock(&fc->lock);
+	spin_unlock(&fc->chan->lock);
 
 	if (fuse_uring_request_expired(fc))
 		goto abort_conn;
-- 
2.53.0

