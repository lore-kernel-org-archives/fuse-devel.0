Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192010;
	b=P65k4q9/a4mz9TpnoSQj2UBu/VnKyhbCk/IAl7T1e8I8by6atP1l8eZ6NVeUNlLR+b80
	 mWPA/b40QP4Rn0DAX07YUE+JS+GWsO5OAczjUYalCnX/jLKV84EWFQOuYaaj/aWwDAfn6
	 HkXF26UlGkwLkYkvR5CkyPRegi2+ouQnOwI898sOGsOj/pN9YBm9/jWhMS2BPu3m36X0j
	 LcAo/fdOr3XEGCir9ppn9PBv3TkUCk4ZrlrYtqnBlw4Fp7ApzfrfRfNGPgcaWTXaAawbo
	 tcMH2y+F9wX4pDmk40+cI7U818/f2WahyegO5tsRRyQB2wQQzznoGRZz2OB58wYMQ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hamfHniDHGCKRAw+vpTUWbv3vFb7E6pjHS73N4V1Z68=;
	b=X3PA1T7HK+Gb0PlKT6RzMUOX12bzyShpiasJFVeAOcCoDAtt5qmN9T/v74rBpIR7EawX
	 qSHxg85wsXXPBlP5oO7uhNI/A0q5GPlwOw3eyQf7ID+23Ouqbvy4lxUBkvzQpobpTNYAM
	 HOGDp5bgGcTFMbCX6wJLPmUrx7ubmGs8i2ESaQzgThw4RxoZVTRDWVSSzJUlj27/BUNB7
	 QR8R5O8o5i0kttisaGHg15KdzjwSYzKNh/yTyym8NDKNdxlFXmWHJiSVX5EayfeekbV01
	 tz2fhvu2xKMYbkr/Wiy38O8/6+ztMqZps/BTeod58eaYpSfpJhwQMb7DuRFrmpkLrOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cFAJ4/cH";
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C37606A334
	for <fuse-devel@lists.linux.dev>; Mon,  9 Nov 2026 02:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C37606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFAJ4/cH
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed758efc93so529335ad.2
        for <fuse-devel@lists.linux.dev>; Sun, 08 Nov 2026 18:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794192008; x=1794796808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hamfHniDHGCKRAw+vpTUWbv3vFb7E6pjHS73N4V1Z68=;
        b=cFAJ4/cHaVHD4zi9cuk65SvBwQz/gqSHQHDyWYKnBdi/or+TZ9nytIT2YangvE30GN
         nWkSvFTx+hEou6Gs8xZjq608AZwDpKTa+V+MxbYmaF9mpW1yN7e4uGdp0YFaUL416MJs
         z6f7QFlRxX63WHhS6d6UWFtPd0Ke18bwolyUluv2MQOuGzFvpsdo3OZ6DTXSKVUxS0Rh
         1XzbslPsw9KNQj1byBVkRM/WlC1maAlbDgFeDvwodm6dHHH2RMakFjFVsXhVymSPk2cj
         i99+UPVshHV28PEtH9HLNr52jIk3hOhg99T6nq/dxukqpKT+IR/UH1JhSjKKtnf/4oox
         wNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192008; x=1794796808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hamfHniDHGCKRAw+vpTUWbv3vFb7E6pjHS73N4V1Z68=;
        b=JQ8GAXjBmh8VIry544aqgCYCjiHgzOQcmSk7hDOrZTEyeiUjmKCUQQ6HcFxxpney+w
         6hrTbRGyvYi/LAwFKuqptjXZZMcyzZJ3V1tAqy6na/xdhV3/oZfNwjrxq4pU7DN+7++v
         VMkfw/amOx277wk9DGzMSubWLdNlTnN8OdDgxwi/6AYPAfHy+1YsicxYSgDK8jldCnoy
         4pzF0B2oYIFeb58LI5s/nmgYVzMNivJfj0u9Hj+Kc4O51xtabCG7/aUw4nbkXDL71Qu9
         vrZoIoKP/gtHzRSzZnjye+RrTOAcmI1ERS8oi62XavMgKWNjFmBlEm/UcW7GiBT+jRJC
         jC1Q==
X-Forwarded-Encrypted: i=1; AL+hErFOhgwVaMj4wBrJ1iuysYyh/kk1JeWcaMG4bw34bawFQYb4hoBnT/D+EfALv9NpiiiQR7Qc2zDMk7Kk@lists.linux.dev
X-Gm-Message-State: APuU4Z8A6HgZSH6cZXj9g1kfCNTlPccdPNu6VVVGVO70tjfnsW9S4y0+
	Zo5o8sTt8SWN7UJQA0dM9J2iSz+r7MNQON1U/dOZ9+z04iGpYPkcOHCw
X-Gm-Gg: AYBFou20bVtfNKlThB51lgw4oXjZABLx6/zaJNbXAurUXyAXJBJw2vUrcSwbLj3blaZ
	1CFh3zZfx1b0NvZyy9FtNhL8U7kfrU3VIix3D84xLn1rb6jHeOze4MrgZN27c6lZN+7Gw5MxIgP
	9tsekES0rLCvu3ZT+is9YszwiDKmgd0QWOcNZ9+a0LMCfp9h/kA7iGdbVp+lJBbp8B44SoJmVcD
	XR66kJgI/X3jrrR1jYtfVblJ4KdckJGIRmHDx1Puxeomy4TY72RL5z5FLuW4yyQSAVbLkHBPPjt
	0YjdssAfXJhsyxCk465PnjMVxbHocXulxWS15ejdO8PWWWXkzxFLbv+hgNIzoGtGXAizB2TR+hX
	8xAUSzn0+AJxSMHtolG1ONztKmY2Jd3p4E7tEy9tXFyfpNaUQ65KmYfA3J4hWKkQSJxlKm7dFLN
	2ybbW7xK95Ayg2IfHYf1Jtb3ZqSMR6ojmq2zOiqznOkiAYAVi9grJH+jLydKc2vHqxwpmK+Mke3
	tUbefkStgpSdFbRxdE9EfBPaFlSGPDMt6lIyTgOlIy5rSL6P3gOoEgfTOTRubcROrV08J4aZk5C
	9xNf6I5mYsEUGyoArcdQzDLvhdQet7nYp7qDL+qFso/rjh4zSaaom6O+YfPadhrclAtHbR2dES1
	qp3HrdSgXizkGqGFC
X-Received: by 2002:a17:903:2289:b0:2df:8ab7:fe3a with SMTP id d9443c01a7336-2ed83786890mr43450945ad.4.1794192008326;
        Sun, 08 Nov 2026 18:40:08 -0800 (PST)
Received: from localhost.localdomain ([139.159.170.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81600c3esm6172515ad.34.2026.11.08.18.40.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 18:40:07 -0800 (PST)
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
Subject: [PATCH v3] fuse: virtio-fs: stop new requests before draining queues
Date: Mon,  9 Nov 2026 10:39:57 +0800
Message-ID: <20261109023957.34500-1-q.h.hack.winter@gmail.com>
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

Stop admitting requests on each queue before draining begins.  The flag
is set per queue, but that is sufficient: request admission,
virtqueue_add_sgs() and, on the submission path, the in_flight
increment are serialized by the same fsvq->lock.  A request is
therefore either rejected before the device can see it, or already
counted in fsvq->in_flight and covered by the drain.  There is no
window in between.

Rejected requests use the existing -ENOTCONN error path and are ended by
virtio_fs_request_dispatch_work() through end_reqs, so no new request
completion or ownership state is introduced.  Nothing has to be
discarded in the completion path, and fsvq->in_flight remains the only
per-queue accounting state.

The -ENOSPC path needs the same admission check.  virtio_fs_enqueue_req()
drops fsvq->lock before returning -ENOSPC, and the caller queues the
request in a second critical section; teardown can finish in between and
leave the request stranded on queued_reqs, which nothing drains.
Re-check connected/aborting before queueing, in both the submission path
and the dispatch worker.  After aborting is set, no request can newly
enter queued_reqs or the virtqueue, except the explicitly permitted
FUSE_DESTROY path.

Rejected requests are ended by virtio_fs_request_dispatch_work().  If
their end callback may block (a DAX release), ending them inline can
deadlock: the callback may issue a synchronous request that needs the
same worker.  Offload those endings to a separate work item, like the
device completion path already does.

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

Fixes: a62a8ef9d97d ("virtio-fs: add virtiofs filesystem")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
V2 -> V3:
- re-check admission before queueing on -ENOSPC, in virtio_fs_send_req()
  and in the dispatch worker, so teardown cannot strand a request on
  queued_reqs
- offload may_block request endings in the dispatch worker to avoid a
  self-deadlock through fuse_simple_request()
- add Fixes: and Cc: stable
V1 -> V2:
- prevent new requests from reaching the virtqueue at teardown time
  instead of skipping completions of aborted requests
- keep FUSE_DESTROY working: it is the teardown request and is waited
  for before fuse_chan_abort()
- drop the per-vq aborted flag and the completion-skip branch
 fs/fuse/virtio_fs.c | 104 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 94 insertions(+), 10 deletions(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index ba8d79c4bcac6..a46536c9fdc8e 100644
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
@@ -97,6 +98,11 @@ struct virtio_fs_req_work {
 	struct work_struct done_work;
 };
 
+struct virtio_fs_end_work {
+	struct work_struct work;
+	struct fuse_req *req;
+};
+
 static int virtio_fs_enqueue_req(struct virtio_fs_vq *fsvq,
 				 struct fuse_req *req, bool in_flight,
 				 gfp_t gfp);
@@ -348,6 +354,7 @@ static void virtio_fs_start_all_queues(struct virtio_fs *fs)
 		fsvq = &fs->vqs[i];
 		spin_lock(&fsvq->lock);
 		fsvq->connected = true;
+		fsvq->aborting = false;
 		spin_unlock(&fsvq->lock);
 	}
 }
@@ -551,6 +558,39 @@ static void virtio_fs_hiprio_done_work(struct work_struct *work)
 	spin_unlock(&fsvq->lock);
 }
 
+static void virtio_fs_end_req_work(struct work_struct *work)
+{
+	struct virtio_fs_end_work *w =
+		container_of(work, typeof(*w), work);
+
+	fuse_request_end(w->req);
+	kfree(w);
+}
+
+/*
+ * A request rejected during teardown can have an end callback that may
+ * block (DAX release).  Ending it inline in virtio_fs_request_dispatch_work()
+ * can deadlock: the callback may issue a synchronous request whose
+ * completion needs the same dispatch_work that is currently blocked.
+ * Offload it, like the device completion path does.
+ *
+ * virtio_fs_request_complete() cannot be reused here: it also consumes
+ * argbuf and drops in_flight, while a rejected request has neither.
+ */
+static void virtio_fs_end_req(struct fuse_req *req)
+{
+	if (req->args->may_block) {
+		struct virtio_fs_end_work *w;
+
+		w = kzalloc_obj(*w, GFP_NOFS | __GFP_NOFAIL);
+		INIT_WORK(&w->work, virtio_fs_end_req_work);
+		w->req = req;
+		schedule_work(&w->work);
+	} else {
+		fuse_request_end(req);
+	}
+}
+
 static void virtio_fs_request_dispatch_work(struct work_struct *work)
 {
 	struct fuse_req *req;
@@ -570,7 +610,7 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
 
 		list_del_init(&req->list);
 		spin_unlock(&fsvq->lock);
-		fuse_request_end(req);
+		virtio_fs_end_req(req);
 	}
 
 	/* Dispatch pending requests */
@@ -593,9 +633,17 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
 		if (ret < 0) {
 			if (ret == -ENOSPC) {
 				spin_lock(&fsvq->lock);
-				list_add_tail(&req->list, &fsvq->queued_reqs);
-				spin_unlock(&fsvq->lock);
-				return;
+				if (!fsvq->connected ||
+				    (fsvq->aborting &&
+				     req->in.h.opcode != FUSE_DESTROY)) {
+					spin_unlock(&fsvq->lock);
+					ret = -ENOTCONN;
+				} else {
+					list_add_tail(&req->list,
+						      &fsvq->queued_reqs);
+					spin_unlock(&fsvq->lock);
+					return;
+				}
 			}
 			req->out.h.error = ret;
 			spin_lock(&fsvq->lock);
@@ -603,7 +651,7 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
 			spin_unlock(&fsvq->lock);
 			pr_err("virtio-fs: virtio_fs_enqueue_req() failed %d\n",
 			       ret);
-			fuse_request_end(req);
+			virtio_fs_end_req(req);
 		}
 	}
 }
@@ -1226,6 +1274,28 @@ static void virtio_fs_stop_all_queues(struct virtio_fs *fs)
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
@@ -1479,7 +1549,8 @@ static int virtio_fs_enqueue_req(struct virtio_fs_vq *fsvq,
 
 	spin_lock(&fsvq->lock);
 
-	if (!fsvq->connected) {
+	if (!fsvq->connected ||
+	    (fsvq->aborting && req->in.h.opcode != FUSE_DESTROY)) {
 		spin_unlock(&fsvq->lock);
 		ret = -ENOTCONN;
 		goto out;
@@ -1551,12 +1622,22 @@ static void virtio_fs_send_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 			/*
 			 * Virtqueue full. Retry submission from worker
 			 * context as we might be holding fc->chan->bg_lock.
+			 * Re-check admission under the same lock that
+			 * increments in_flight: teardown may have started
+			 * between enqueue_req() dropping its lock and here.
 			 */
 			spin_lock(&fsvq->lock);
-			list_add_tail(&req->list, &fsvq->queued_reqs);
-			inc_in_flight_req(fsvq);
-			spin_unlock(&fsvq->lock);
-			return;
+			if (!fsvq->connected ||
+			    (fsvq->aborting &&
+			     req->in.h.opcode != FUSE_DESTROY)) {
+				spin_unlock(&fsvq->lock);
+				ret = -ENOTCONN;
+			} else {
+				list_add_tail(&req->list, &fsvq->queued_reqs);
+				inc_in_flight_req(fsvq);
+				spin_unlock(&fsvq->lock);
+				return;
+			}
 		}
 		req->out.h.error = ret;
 		pr_err("virtio-fs: virtio_fs_enqueue_req() failed %d\n", ret);
@@ -1669,6 +1750,9 @@ static void virtio_fs_conn_destroy(struct fuse_mount *fm)
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

