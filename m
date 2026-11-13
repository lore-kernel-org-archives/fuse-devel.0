Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561561;
	b=RZDrmszDFB8GDmY6qg4u+Y/nc+heUh46rT7uw17BFj9/k6yApzSp3f/zfy28DENUeXdK
	 VGGJW3lmoXMcFixvcs6jM0w7es8ITAG0gFlrPO8m98hvbX3Fq2NC71eWkQmybNi/svkS4
	 mu/ejtOx9C30iMgmfoJk9bDEhyQvFtB0pwAeu9sNaiQD9UDIwlfTEKntPT6ydeK7o3q8b
	 DKO22Zvp0zSQrTUBiEED8zLSsCCwg5VCEh4QHhUU08iHnERKCc+I5/tQFx+aGpp0kUFIq
	 e9ISmZXsP7MfTiNr2BXXQC2FAYcBSggXNxd39voWIWJYl9RGWU5H7PgiN0NoYMCM/tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z1LQUshJLGbDwVy+51FQZk6WUkcWSvGfBiCbiuDiBL4=;
	b=cOo7PmQRbTPpWCgfeglbMrqvBQY9pBuKEt8a+2HIGZd1/DNu/5U811je4HVZzFg4S43o
	 yB8TupDnbpvYXrrAE8naSno0qc4b8YyMOdZ5MDdMGmwSDlFFHjAs9pjrKtJGDfdVRBqqg
	 XS1ToJ/7CxRvRZW/Y6YyBFD5IuwCkaX5pm6O6DwJ52T1swDWHmprFFcM7ecR81qfY0Xjb
	 rfhoKnrltH9BghiQJDAEC5Kp0bdOcobhapGkl3O579rMPIZ2YWLK6Dsjl/YgULl5N4Nzy
	 Gif+0AisBmWB4WLQCOqyk+xEgQ0mT3rcMCPnAERJPfoUzV90qTVl3iaTwyDHOTiyQgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=odbWdDRX;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C378E606A323
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 09:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C378E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=odbWdDRX
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b147e50af1so105054a91.2
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 01:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794561560; x=1795166360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1LQUshJLGbDwVy+51FQZk6WUkcWSvGfBiCbiuDiBL4=;
        b=odbWdDRXlEuT8Jx3VH2wOhyZP5klurmqml0EOOVp3Yi4qK9wpcIRF9ctUe/2zS7s3H
         IeDXOMlWjak3oqEUzfum0LCamfsDpSlVD6M4rw9yjV/6k+jmtJHKaC8sptURs5JpzHEF
         /qLnesrWfaHB0rz/LQC6RdsPR7ZakNSok+N+MVwuj+a13ghfFAAfJEZgR1N9uK8m3P8Y
         rFt7vcjuVpFQJFt+nmlVgrwc3xvtyzQ4G9MID/uZXZSg3h9G0x+W08YEBFxzNOI/2qxz
         aVElsaKgj0um7OjzH8xSFut88Q9W0Hy8qM/QkTY4UFvm/RYen8kg9++MUI/SKts2URlt
         I60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561560; x=1795166360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1LQUshJLGbDwVy+51FQZk6WUkcWSvGfBiCbiuDiBL4=;
        b=vMNk+/G2gqD/gmkqsBQHUL/n6rkPCE7+vLo4E56cQ1PNcV0jnIw+VC8ZmgB6s3boZE
         OvibkH3NiCANHpQlk5WmLUst0Qz6LUALZhu5aWHSynb2n09pophj5p4tvexcurKgwve7
         Q4ky3ANsTLaYvwTmrpnI1GydCjFKouzQfxfLHbbNDc9Zlu+ThLMlliyBYM3f6t1JveN3
         iGr2dopy9x4qbhSohH+ZxLxqSYMlKAsaCRnCtbTeHVK6TO9Wtx0Y+EYrTV6ItDri+z6K
         Lk2+LoSe9/S9DcEccHlPzPert6FR89Sff5h4nDQDQvEM1sMoqFAc+ZAvmZUVZg+mDRa5
         9CeQ==
X-Forwarded-Encrypted: i=1; AL+hErGxwdSmWB3U4y0V+Gv/Cg8Goe4N8z+B3zBsgVHpm4GtitbPjtvlqyCYDOo1nSEJGhsZc2mmqLoihjvl@lists.linux.dev
X-Gm-Message-State: APuU4Z/zvaiuoEvgAAMbi7x2ftw8udMu8VV7W522DYQvVxFuG7dadM8M
	Qt6DE9t4gzyu88PpvkkhRK4jWDammDEdeaQ1NYQhspxp2NE5aAx4FhVn
X-Gm-Gg: AYBFou0IcJRSYlvH0UsN6ZWG6ZLfNMQNORqDcRpPbDF/rCl91jy+kt+nrsd4JXhjFOs
	E8ApnM7K8AQFCzVny7rLcPviDEl4J5secpDRzMmE0BkSIvkmBKIhmZEQWIeKdNwEBsjqoueolLK
	Id9vLViEPULpY4C6P9+joLtGkwPGBLNdvijT4NfAgqiRxJL8kPTdMALhtbZ/6kSh2wjLH92pl7G
	Q6cNkcLsdIFy0MYycnP1Y07K6xIiHTk6YDp8UJsQpGQv7+FYjc0Gktcrno3x+9D7wbRggoNwvRR
	p4J23jcqPXcGfy5+lAPgb82qjHlomZxm3bAWJeYE/OFKIVZZzc9MEavHDq43cGk/Jt3nbYAhTKH
	8cJfukIU3TFPm9lNeC+VUxDDXz+b9meD36EJVf/83svxPnvvNBWK5uSPxqlC6TjrzfhzC6Oh8vE
	U22qwrO7vrtbZBnDGNADpojeCFkaOMDbHB3yOb7zbgpSZODqx2Yf0SZQMKl6BHnf/qCmn6MYm6K
	MmJsLLdR/fKUYJP/8UYqfhgQ9o8ZFKnAApauEim/0RoM93E3WdvzYixHjCS8p4D4Z7L9IdLoEXB
	iUNgyJ0n2MupcMlRf+/HrMQTKjUtzUGcRmfr6MVqeBQ=
X-Received: by 2002:a17:90b:1b06:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3b1b0a0e7c9mr2734651a91.4.1794561559965;
        Fri, 13 Nov 2026 01:19:19 -0800 (PST)
Received: from localhost.localdomain ([139.159.170.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm3567991a91.6.2026.11.13.01.19.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Nov 2026 01:19:19 -0800 (PST)
From: Qihang <q.h.hack.winter@gmail.com>
To: German Maglione <gmaglione@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: "Eugenio Perez" <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] fuse: virtio-fs: fix lost wakeup on a full virtqueue
Date: Fri, 13 Nov 2026 17:17:58 +0800
Message-ID: <20261113091758.77678-1-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When virtio_fs_enqueue_req() returns -ENOSPC, completion processing
can run before the caller adds the request to queued_reqs. If no
further completions arrive, dispatch is never scheduled and the
request remains counted in in_flight, hanging queue draining.

Track completion progress under fsvq->lock and sample it when
submission fails with -ENOSPC. After queueing, schedule dispatch if
the sequence changed; otherwise completion processing will see the
queued request and schedule it. Each failed submission keeps its own
snapshot, so concurrent submitters cannot consume each other's wakeup.

Fixes: 106e4df1206b ("virtio-fs: improved request latencies when Virtio queue is full")
Cc: stable@vger.kernel.org # 6.11+
Link: https://lore.kernel.org/all/sashiko-outbox-204365@kernel.org/
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
Changes since v3:

- Only the lost-wakeup fix is included here.  v3 also carried teardown
  admission control; that is a separate change, not part of this patch,
  and nothing here depends on it.
- Add a completion sequence sampled per failed submission to close the
  window between -ENOSPC and queue insertion.

Runtime tests used an arm64 kernel with the separate teardown
admission change also applied.  The request scenarios ran before
admission was stopped, with fsvq->aborting remaining false.  The
standalone patch was not run on its own.

- Filled the request virtqueue and held the submitter between -ENOSPC and
  queue insertion while real device completions ran.  The unpatched
  kernel hung in virtio_fs_drain_queue(); this change finished the drain.
- Held the dispatch worker in the same place.  The unpatched kernel
  stranded the request; this change rescheduled dispatch once more and
  every request finished.
- Kept the queue full without completions: dispatch did not reschedule
  itself in a loop.

 fs/fuse/virtio_fs.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index e445398..68aeaa6 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -55,6 +55,7 @@ struct virtio_fs_vq {
 	struct work_struct dispatch_work;
 	struct fuse_dev *fud;
 	bool connected;
+	u64 completion_seq; /* completion progress under lock */
 	long in_flight;
 	struct completion in_flight_zero; /* No inflight requests */
 	struct kobject *kobj;
@@ -99,7 +100,7 @@ struct virtio_fs_req_work {
 
 static int virtio_fs_enqueue_req(struct virtio_fs_vq *fsvq,
 				 struct fuse_req *req, bool in_flight,
-				 gfp_t gfp);
+				 gfp_t gfp, u64 *completion_seq);
 
 static const struct constant_table dax_param_enums[] = {
 	{"always",	FUSE_VDAX_ALWAYS },
@@ -348,6 +349,7 @@ static void virtio_fs_start_all_queues(struct virtio_fs *fs)
 		fsvq = &fs->vqs[i];
 		spin_lock(&fsvq->lock);
 		fsvq->connected = true;
+		fsvq->completion_seq = 0;
 		spin_unlock(&fsvq->lock);
 	}
 }
@@ -576,6 +578,7 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
 	/* Dispatch pending requests */
 	while (1) {
 		unsigned int flags;
+		u64 completion_seq;
 
 		spin_lock(&fsvq->lock);
 		req = list_first_entry_or_null(&fsvq->queued_reqs,
@@ -588,12 +591,15 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
 		spin_unlock(&fsvq->lock);
 
 		flags = memalloc_nofs_save();
-		ret = virtio_fs_enqueue_req(fsvq, req, true, GFP_KERNEL);
+		ret = virtio_fs_enqueue_req(fsvq, req, true, GFP_KERNEL,
+					    &completion_seq);
 		memalloc_nofs_restore(flags);
 		if (ret < 0) {
 			if (ret == -ENOSPC) {
 				spin_lock(&fsvq->lock);
 				list_add_tail(&req->list, &fsvq->queued_reqs);
+				if (completion_seq != fsvq->completion_seq)
+					schedule_work(&fsvq->dispatch_work);
 				spin_unlock(&fsvq->lock);
 				return;
 			}
@@ -902,6 +908,8 @@ static void virtio_fs_requests_done_work(struct work_struct *work)
 
 	/* Try to push previously queued requests, as the queue might no longer be full */
 	spin_lock(&fsvq->lock);
+	/* Record progress for submitters not yet on queued_reqs. */
+	fsvq->completion_seq++;
 	if (!list_empty(&fsvq->queued_reqs))
 		schedule_work(&fsvq->dispatch_work);
 	spin_unlock(&fsvq->lock);
@@ -1418,10 +1426,15 @@ static unsigned int sg_init_fuse_args(struct scatterlist *sg,
 	return total_sgs;
 }
 
-/* Add a request to a virtqueue and kick the device */
+/*
+ * Add a request to a virtqueue and kick the device.  On -ENOSPC, return the
+ * completion sequence under the same lock as the failed submission.  If it
+ * changes before the caller queues the request, the caller must schedule
+ * dispatch itself: done_work may have run before the request was queued.
+ */
 static int virtio_fs_enqueue_req(struct virtio_fs_vq *fsvq,
 				 struct fuse_req *req, bool in_flight,
-				 gfp_t gfp)
+				 gfp_t gfp, u64 *completion_seq)
 {
 	/* requests need at least 4 elements */
 	struct scatterlist *stack_sgs[6];
@@ -1488,6 +1501,8 @@ static int virtio_fs_enqueue_req(struct virtio_fs_vq *fsvq,
 	vq = fsvq->vq;
 	ret = virtqueue_add_sgs(vq, sgs, out_sgs, in_sgs, req, GFP_ATOMIC);
 	if (ret < 0) {
+		if (ret == -ENOSPC)
+			*completion_seq = fsvq->completion_seq;
 		spin_unlock(&fsvq->lock);
 		goto out;
 	}
@@ -1529,6 +1544,7 @@ static void virtio_fs_send_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 	unsigned int queue_id;
 	struct virtio_fs *fs;
 	struct virtio_fs_vq *fsvq;
+	u64 completion_seq;
 	int ret;
 
 	fuse_request_assign_unique(fiq, req);
@@ -1545,7 +1561,8 @@ static void virtio_fs_send_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 		 queue_id);
 
 	fsvq = &fs->vqs[queue_id];
-	ret = virtio_fs_enqueue_req(fsvq, req, false, GFP_ATOMIC);
+	ret = virtio_fs_enqueue_req(fsvq, req, false, GFP_ATOMIC,
+				    &completion_seq);
 	if (ret < 0) {
 		if (ret == -ENOSPC) {
 			/*
@@ -1555,6 +1572,8 @@ static void virtio_fs_send_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 			spin_lock(&fsvq->lock);
 			list_add_tail(&req->list, &fsvq->queued_reqs);
 			inc_in_flight_req(fsvq);
+			if (completion_seq != fsvq->completion_seq)
+				schedule_work(&fsvq->dispatch_work);
 			spin_unlock(&fsvq->lock);
 			return;
 		}
-- 
2.54.0 (Apple Git-157)

