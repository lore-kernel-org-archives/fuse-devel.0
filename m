Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794146320;
	b=FJdKmtKZTGLmGfp+bUZGRmiVauOTNsMyblIX/l0VmevAGe3IUthZsiPaKKMl7y8lIVh+
	 Wgbfrh/tUjCXc5LuqpIOWeviEEMmjo0l9h96CYXvEtrH4z8R61amdu9neMjxB7/uJIs7p
	 aDWGagGc8/tph2qFgijz5xULJ4T2ABVwms4VrkgTxPC5qNAw32AOBozmsDhf73WoxwPzz
	 x1V3xKQuHNk8ntvT0NHURDhIyIg97Hym9f8PLM3PhJxzMCguqARBuz4R9NF3vf3RmSyuH
	 F142QXASCBo6Knv7lhtig1SbSMtWboWrnTayIHfggrS3IBXVktRbmp+cMMpkgrp4fhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794146320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nIt2c7TgqELjjufCcZKCuw1pwzNN3kz5J9LhJ3UcC28=;
	b=B62p0nQyaGpbDyw6VaBeqQBqg0GmBiXsSiF+GqLMw7JDMNu55AfIpRYLEYRK6qOvCqya
	 O7UnWvtE8oGzD/Xbg1kl34Yz50/DU8aCdJe8eR6nr5ZJzxCPtAgGJSDBfAKu9d8hj7NnX
	 ixJ1PK+EwUwoxoVwVyLUSUt0hjJbjs1AfaTLaZQsuVcU9n6h9Jje6VI8lxHsygtnof5F3
	 +4I/SrW3gaW7EKxpYBNQx/O9wDWfCqEjC1ISTp37hwqGSl86vm4Ue/2AxHKR05A/Ld/eQ
	 BR2hEdOBEN3SJxIg/gyzTIiYZ2cg460EzwfdF01Azh6kqf3TDkQyHVrW1SoXui97tjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EQkYe8Zd;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC532606A322
	for <fuse-devel@lists.linux.dev>; Sun,  8 Nov 2026 13:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC532606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EQkYe8Zd
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd63b18598dso7704a12.1
        for <fuse-devel@lists.linux.dev>; Sun, 08 Nov 2026 05:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794146319; x=1794751119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nIt2c7TgqELjjufCcZKCuw1pwzNN3kz5J9LhJ3UcC28=;
        b=EQkYe8ZdPkUeGqboo2iK7mGeLqDzWCoAGng3wkiYi877Nf8KuE5auFTRr5RIyDRRUf
         PPq/NLwrBQiNwh+slCOvOj0N/G2z7ryveVPh1cUQEUdGkYdMleXhTsyO8JO2TtCo46sP
         mbGe3hFq4RLgiIBFSI5RSRUibbVrSqW8wrvv5a7lg02/gaKUODQNzLk9IHgHSQYwVX8l
         v6H6fF6VyaivYzjFQSh5Ft//rBeec++HJPWSjtvhFksglGEaQVfjX/jZSKjXlCugwvzh
         NCJ351LMPAhFjigP6IcuRHfUiZTP9z4HVZ5cTddTb/kmZRso4nV5PTv8TlSdPMBjF5kG
         nuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794146319; x=1794751119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nIt2c7TgqELjjufCcZKCuw1pwzNN3kz5J9LhJ3UcC28=;
        b=btUWyH25DP68qqTBI25ckAuxH02IL/9upLO5Uu3UwRkftlNMgU5No7eB3RHXyPsIMS
         wLK05SqQXwvb8Ey/FQbKHU5N0TG36xnyDPQDrWmvvuHZqbTL62gUEnxy1jbenWcpMgDr
         V0X7V0z+Usf6gkmasAkhwbrocP5yRi8eS9t0lyOxR7JoVJGG6P5QwAGYXl9cpbYLYhG0
         pJH91RS7t1J5QeM6cNsEgQRANt5h/99zCqeiPytIaYFVRdMaq49vHQt0bz+YE4HiFzst
         /c+j4Qk/PzZwP/A9c1Dlu9p9VZHC3U5qW8bddcpHmEdl6Lm4fsR70D/5yqaXWhnwjR4n
         shHw==
X-Forwarded-Encrypted: i=1; AL+hErGHcLwW1fcXg9VmIk+nLCL7Xu94zbPGnEiuHim9zsyMThPr8lzG9FCPzQ7PP47C8X7vY2KaDLOkTz4T@lists.linux.dev
X-Gm-Message-State: APuU4Z+zbd3pGs7yt7rtK5PTmzxTIo2ZnYGoB4g3qCvuqgfqnkCaEvLT
	XCW7aRM7CEeitQrfyEmqXXXcy6KuTaznM/92UgZE2LYwCIy4cAA4tF4m
X-Gm-Gg: AYBFou01eknaaWofnKsjHoabTFBTACRJ3+BK/BrG4xOinuPFHoHyTeZfpHfI4iLh33U
	ksHx5oZ6+c68673n7J+OYyQXIjRwwcqeAdc9bzxgFeueQoF9rbrt7ENzFE0u8OElYFHVfRksMs/
	dlL5reZkla/Qnl5HdbzT4Vvl1t4pRixtbtPaKVhhv7detUg1U8GQtJqydrnYYNRmbhlVDwDgF94
	cDBRd+kelxzCwcB3eU8tS8Nmf8D5hzPWLR78NuBAct0fNBYRaJi9FDjmVapKKsEGoUmh4IzqSeH
	aeumX07MeYFxAhHernMLSHwZip6eRgOghSqIf3U3KgLc5jV3akEYSvyi2VsRQYm7pcFaHaI8ND4
	RYrAVCTuoijsZMiClfXPkrDFP467dty7fEhGeomohlw5w0cnZgBu463xYoj9WmkCS9kzq7AEkJf
	vrcrY6ZOsrqkyS2YVnpS7YZJqU52zjHsvUvWMQB5r7wHTt2BA4fnnpfe21wFdivWoDMKSRBWkLT
	Xm4DTQIucOZAefjDFIqnUQfJq4XiAByWN0luoU3nq8jci9Pzqt+sZQKof++w0zN4bvYeHkYArSD
	bujSn2bD6t8Ly3kyaoj6KQw7FpVyM0WhgWI26e69SRrdZIb0YQQXg24tbxu3RaQBPBbXLIG80r3
	dnsiW4Bn3yoazxrhZbqSbyCo=
X-Received: by 2002:a17:90b:3912:b0:3b0:9a3e:bf8b with SMTP id 98e67ed59e1d1-3b12d4c5f3cmr2106208a91.6.1794146318912;
        Sun, 08 Nov 2026 05:58:38 -0800 (PST)
Received: from localhost.localdomain ([14.150.132.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb96969220sm647168a12.27.2026.11.08.05.58.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 05:58:38 -0800 (PST)
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
Subject: [PATCH v2] fuse: virtio-fs: stop new requests before draining queues
Date: Sun,  8 Nov 2026 21:58:30 +0800
Message-ID: <20261108135830.29924-1-q.h.hack.winter@gmail.com>
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

virtio_fs_conn_destroy() drains the virtqueues and then calls
fuse_conn_destroy(), which aborts the connection.  The abort ends every
request the fuse device still owns, and each ended request is freed as
soon as its waiter wakes up.

The drain only covers the requests that were already counted in
fsvq->in_flight when it started.  A request submitted after it returns is
not covered, but is still handed to the device before the abort runs:

  CPU 0 (umount)                     CPU 1
  ---------------------------------  --------------------------------
  virtio_fs_drain_all_queues()
    /* in_flight drops to 0 and
       the drain returns */
                                     virtio_fs_enqueue_req()
                                       virtqueue_add_sgs()
                                       inc_in_flight_req() -> 1
  fuse_conn_destroy()
    fuse_send_destroy()
    fuse_chan_abort()
      /* ends and frees the
         request above */
    fuse_chan_wait_aborted()
                                     /* the device still owns the
                                        virtqueue descriptors and
                                        DMA-writes into the freed
                                        request and its argbuf */

Stop admitting requests on each queue before that queue is drained.
The flag is set per queue, but that is sufficient: each queue is
drained after its own flag is set, and request admission,
virtqueue_add_sgs() and, on the submission path, the in_flight
increment are serialized by the same fsvq->lock.  A request is
therefore either rejected before the device can see it, or already
counted in fsvq->in_flight and covered by the drain.  There is no
window in between.

Rejected requests use the existing -ENOTCONN error path and are ended by
virtio_fs_request_dispatch_work() through end_reqs, so no new request
completion or ownership state is introduced.  Nothing has to be
discarded in the completion path, and fsvq->in_flight remains the only
state that has to be tracked.

The new state is not folded into fsvq->connected because the request
queues have to stay usable: fuse_conn_destroy() sends FUSE_DESTROY
through them, with args.force set so that fuse_simple_request() waits
for the reply.  Clearing fsvq->connected would make that request fail
with -ENOTCONN and the server would never see the destroy.

FUSE_DESTROY is the sole exception while aborting is set.  It is sent
only after the first drain, and its completion is waited for before
fuse_chan_abort() can end requests, so the destroy is the only request
the device sees after the drain.  virtio-fs exposes no userspace
/dev/fuse fd (and no_control disables the fusectl interface), so
userspace cannot inject another request.

virtio_fs_start_all_queues() clears the flag, so a mount that follows an
unmount starts with admission enabled again.

Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
V1 -> V2:
- prevent new requests from reaching the virtqueue at teardown time
  instead of skipping completions of aborted requests
- keep FUSE_DESTROY working: it is the teardown request and is waited
  for before fuse_chan_abort()
- drop the per-vq aborted flag and the completion-skip branch
 fs/fuse/virtio_fs.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index ba8d79c4bcac6..c6d2120157340 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -55,6 +55,7 @@ struct virtio_fs_vq {
 	struct work_struct dispatch_work;
 	struct fuse_dev *fud;
 	bool connected;
+	bool aborting; /* reject new requests except FUSE_DESTROY */
 	long in_flight;
 	struct completion in_flight_zero; /* No inflight requests */
 	struct kobject *kobj;
@@ -348,6 +349,7 @@ static void virtio_fs_start_all_queues(struct virtio_fs *fs)
 		fsvq = &fs->vqs[i];
 		spin_lock(&fsvq->lock);
 		fsvq->connected = true;
+		fsvq->aborting = false;
 		spin_unlock(&fsvq->lock);
 	}
 }
@@ -1226,6 +1228,28 @@ static void virtio_fs_stop_all_queues(struct virtio_fs *fs)
 	}
 }
 
+/*
+ * Stop admitting new requests before draining the queues.  Admission and
+ * virtqueue submission are serialized by fsvq->lock, so a request is
+ * either rejected before reaching the device or accounted in in_flight
+ * and covered by the drain.
+ *
+ * FUSE_DESTROY is exempt because fuse_conn_destroy() sends it after the
+ * first drain and waits for its completion before aborting the channel.
+ */
+static void virtio_fs_stop_new_requests(struct virtio_fs *fs)
+{
+	struct virtio_fs_vq *fsvq;
+	int i;
+
+	for (i = 0; i < fs->nvqs; i++) {
+		fsvq = &fs->vqs[i];
+		spin_lock(&fsvq->lock);
+		fsvq->aborting = true;
+		spin_unlock(&fsvq->lock);
+	}
+}
+
 static void virtio_fs_remove(struct virtio_device *vdev)
 {
 	struct virtio_fs *fs = vdev->priv;
@@ -1479,7 +1503,8 @@ static int virtio_fs_enqueue_req(struct virtio_fs_vq *fsvq,
 
 	spin_lock(&fsvq->lock);
 
-	if (!fsvq->connected) {
+	if (!fsvq->connected ||
+	    (fsvq->aborting && req->in.h.opcode != FUSE_DESTROY)) {
 		spin_unlock(&fsvq->lock);
 		ret = -ENOTCONN;
 		goto out;
@@ -1669,6 +1694,9 @@ static void virtio_fs_conn_destroy(struct fuse_mount *fm)
 	spin_lock(&fsvq->lock);
 	fsvq->connected = false;
 	spin_unlock(&fsvq->lock);
+
+	/* Nothing may be queued after the drain below */
+	virtio_fs_stop_new_requests(vfs);
 	virtio_fs_drain_all_queues(vfs);
 
 	fuse_conn_destroy(fm);
-- 
2.54.0 (Apple Git-157)

