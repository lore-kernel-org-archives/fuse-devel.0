Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504441;
	b=2TlhAjsHNUEqxkfZ1HteWe+FaiJ9RwCUCoE/jSXNN6zgLFLu9WCXhpBx/meDS9awnXUF
	 sFSAhjc8xmT7NWJmjDLeo4K8/YEGyVsHHQ1c6hK3g5RZ2Bx2l3J3+5FLk5hnLlz+fHbq0
	 XcyZD8jQtvvBznEaCJRPtBerC+aSPl3+vuXLGVJUBBoCZLMvUaMSOCe9GypMPzVUB9DqE
	 7WQJzV7UaV32KelZOF/v5g5a6fPGdDBWyEsClbucu5nFqJHOpiq08eir6sAwpqXhV/5c9
	 kDbYVEGbQwfFbQsY4qw5AfPKZ4FsNGN3jFesKNQ7jlTCn1vA2HSf1Dm9LqjweoXX4IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eR7IAX7DYO3kX2lnFG0GVUYwCYi3YyU/eHHmvSkslxA=;
	b=N6c75q3+OL+rk39VOyk2DHJbhjzxWHL13jgFSgtRLvqNnPRaCkrHNCrXdEZBmXgPVRog
	 y7uwZH8+e6OCUMeUnS2TUIkmd4Fc6UXAiaV87vpbdsbWVEJLJl/QnHmgzWXATTUJv/SDl
	 85Hw4gdORku2spGRov2XDPGT1vv8d6ig7AR31VDuhWSlNyjXTKfRyMO5b8jkJX58mCf7k
	 VL2foZOxn2e8qfdhBvJFL0JdTpxegJVymTL24+f8FzJYUBsROo3RH0o9QP2j8ADFrrm28
	 ra3re7kVdYSOWdzY1gc3LrefJq1ALcfAHSiSWCl6JwLc0E9QTaA/wVxBpcZsHKINJUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XH7UcQPb;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E418606A327
	for <fuse-devel@lists.linux.dev>; Tue, 20 Oct 2026 13:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E418606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XH7UcQPb
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac847f9d78so401588a91.1
        for <fuse-devel@lists.linux.dev>; Tue, 20 Oct 2026 06:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504441; x=1793109241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eR7IAX7DYO3kX2lnFG0GVUYwCYi3YyU/eHHmvSkslxA=;
        b=XH7UcQPb/4tXeAWoiinkZ3Y5x4+03KTpP//AnEu12t+irxE9zKuFvyPrdViABgEloU
         i+8HuotWx+6f4pSdD+ECU98FoQa86Bb7i05mqNX+0++7gsImyqWCetnU6nWFSHT0grBv
         RAVfWNnGDRvv3B8dNla4a5Dut+6csnIo168SiBW18aLhIrCC743oCQ3x9ahSfPq/pUmO
         iMm1a3qCFW+Riour2BbKwIEUSLFGcc9/kZue5s+PsAU1uvqhdqmApTuET75VY/vxs6/X
         6Fxbz/y9Wh+8Sio+QIqtc3Z+zdiTemv0tLOmSbBZk02tSx4eYFK8uYmk3cVswDErrrVN
         TPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504441; x=1793109241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eR7IAX7DYO3kX2lnFG0GVUYwCYi3YyU/eHHmvSkslxA=;
        b=UpOm3fbs/+7OHs3XFZDqFSV8ABvo0LcRLJD1SxrCDW4Y3QJPlaacWwRHwTLBXrb/6r
         Z1as0e1xJTfiB//kmepFzHsAkcp55cpLNJisYzqMOTHB7jysonwHcRJHH/az6W/of0EC
         37UqxWIiVcgeZvPyQ89w4aMT9yZ/ubkOqpYFvXgqZegHCvYM7xa7Olnj+RADClluN2hQ
         d9v55+pN6DH+fP6aguBCignBeiYFOMRi/7C3RNZa1yjhuN6PH8sayr12uabSKhry1bLJ
         iyvRa8JwiUNnObS/3RnrAABqDyB16V0zrW4sdKJjzIXJyaL8u1q2kYzAaPtP7jzedwij
         rCrA==
X-Forwarded-Encrypted: i=1; AKwUvBwDzkVjcfEF5hy/F23gXuvL7ekYIT71SzxVyEcIvIMJ2FMmPv26mq2crc8Qy8VUKPzDf/kGxYgpxYHa@lists.linux.dev
X-Gm-Message-State: AFq9FYJcx+1gzWCeygUGgXs9dB59D9i7CSpiu+eIyKxgnNE8e160Xt33
	311bhz8ACf3AX9j6yjfudHr73NzHl7DK162h/qNgp5/3S1bXE3+gWOT4
X-Gm-Gg: AYBFou1xcPomncvRKiLpx7HMHKZYcL9cO4JRyCp4PUi+yzuH1a89k0gZUIcIUCG+lPi
	tW0jDMjVmzMzjLsq89rjk933JsRuxyK72FSqMe2bD/dcawa+jZwf2XG2BUVOxClkwlqMyBAxp+k
	iAaq75t+YrqmLx8qw6HjvBf6V//+csFuLCltY/o+0Qzlpm3YYLEZyh7DkFxucc4w0EI0XseCUfk
	Bs8UjFLkEDJXZbB+1bmAlNiVggeSSZqXnxG+1MWpSwOwCNQmE7Q9vG2q4zSIen1dFJEOO0ZKCYp
	hQEpO9tb8uVueWN98bB1TTs0edyJsKmGwRwLiwU9KkMRpX+mv+JUMRrtqM4Gmk5WDmMjLm5rsj0
	ScLE04rovdejts98C9a0bU91KH6l2DC3R5+6RT/VgDu1dQ/w1qWMOB3pgoPf2dFk1uFSU6cclj5
	s9Ur3a68GirMkLDchSOSPgzqTka16vqw5X8eIj2BAFXGJXjyO0QZJUygRdNTCb+roKyaOnWmTse
	Z16ER3v0EDt7UXaCpN2OJJq+Oom0NrTrq+adpyM4JifFH9icKNZj3xenv+SFCsVxEUI+F4I0Su0
X-Received: by 2002:a17:90b:1f8f:b0:3ac:a11a:7c88 with SMTP id 98e67ed59e1d1-3aceec4ba18mr14269919a91.3.1792504440611;
        Tue, 20 Oct 2026 06:54:00 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([188.253.120.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d6df894sm3604548a91.10.2026.10.20.06.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:54:00 -0700 (PDT)
From: Qihang <q.h.hack.winter@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: German Maglione <gmaglione@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	fuse-devel@lists.linux.dev,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	stable@vger.kernel.org,
	Qihang <q.h.hack.winter@gmail.com>
Subject: [PATCH] fuse: virtio-fs: don't process completions of aborted requests
Date: Tue, 20 Oct 2026 21:53:50 +0800
Message-ID: <20261020135350.7751-1-q.h.hack.winter@gmail.com>
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

fuse_chan_abort() ends every request on the processing lists with
-ECONNABORTED, but virtio-fs keeps the request itself as the
used-buffer token of the virtqueue.  When the host stalls a request
until the request timeout aborts the connection and then completes the
descriptor, virtio_fs_requests_done_work() gets the already freed
request from virtqueue_get_buf() and moves its list node
(list_move_tail()) and reads its arguments (copy_args_from_argbuf()),
a use-after-free in the guest kernel.

Let the transport know about the abort and skip completions of requests
that the abort has already ended.  This is safe because any request
still represented by a virtqueue token when the abort starts must have
been queued before virtio_fs_abort() set aborted:
virtio_fs_enqueue_req() checks connected, adds the request to the
virtqueue, and puts it on the processing list while holding fsvq->lock.
virtio_fs_abort() takes the same lock before setting connected = false
and aborted = true, and fuse_chan_abort() only splices and ends the
processing lists after the transport callback returned.  A racing
enqueue therefore either completes before the abort and is subsequently
ended by it, or observes connected == false and returns -ENOTCONN
without creating a token.

in_flight is transport-owned accounting: it is incremented when a
token is queued and must still be dropped when the virtqueue completion
is consumed, even though the FUSE request itself has already been ended
by the abort.

Fixes: a62a8ef9d97d ("virtio-fs: add virtiofs filesystem")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 fs/fuse/dev.c        |  4 ++++
 fs/fuse/fuse_dev_i.h |  5 +++++
 fs/fuse/virtio_fs.c  | 26 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 4fec31fc0b84..90b30c5034c4 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -2178,6 +2178,10 @@ void fuse_chan_abort(struct fuse_chan *fch, bool abort_with_err)
 		spin_unlock(&fch->bg_lock);
 
 		fuse_chan_set_initialized(fch, NULL);
+
+		if (fiq->ops->abort)
+			fiq->ops->abort(fiq);
+
 		list_for_each_entry(fud, &fch->devices, entry) {
 			struct fuse_pqueue *fpq = &fud->pq;
 
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 4b412a76225f..47697adf0eb6 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -148,6 +148,11 @@ struct fuse_iqueue_ops {
 	 */
 	void (*send_req)(struct fuse_iqueue *fiq, struct fuse_req *req);
 
+	/**
+	 * @abort: Abort transport-specific state
+	 */
+	void (*abort)(struct fuse_iqueue *fiq);
+
 	/**
 	 * @release: Clean up when fuse_iqueue is destroyed
 	 */
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index f15e516ebcb5..2db5faf5d865 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -55,6 +55,7 @@ struct virtio_fs_vq {
 	struct work_struct dispatch_work;
 	struct fuse_dev *fud;
 	bool connected;
+	bool aborted;
 	long in_flight;
 	struct completion in_flight_zero; /* No inflight requests */
 	struct kobject *kobj;
@@ -842,6 +843,15 @@ static void virtio_fs_requests_done_work(struct work_struct *work)
 		virtqueue_disable_cb(vq);
 
 		while ((req = virtqueue_get_buf(vq, &len)) != NULL) {
+			if (fsvq->aborted) {
+				/*
+				 * fuse_chan_abort() ended every request this
+				 * queue still owns; the token may already be
+				 * freed, do not touch it.
+				 */
+				dec_in_flight_req(fsvq);
+				continue;
+			}
 			if (!virtio_fs_verify_response(req, len)) {
 				req->out.h.error = -EIO;
 				req->out.h.len = sizeof(struct fuse_out_header);
@@ -1541,10 +1551,26 @@ static void virtio_fs_send_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 	}
 }
 
+static void virtio_fs_abort(struct fuse_iqueue *fiq)
+{
+	struct virtio_fs *fs = fiq->priv;
+	int i;
+
+	for (i = 0; i < fs->nvqs; i++) {
+		struct virtio_fs_vq *fsvq = &fs->vqs[i];
+
+		spin_lock(&fsvq->lock);
+		fsvq->connected = false;
+		fsvq->aborted = true;
+		spin_unlock(&fsvq->lock);
+	}
+}
+
 static const struct fuse_iqueue_ops virtio_fs_fiq_ops = {
 	.send_forget	= virtio_fs_send_forget,
 	.send_interrupt	= virtio_fs_send_interrupt,
 	.send_req	= virtio_fs_send_req,
+	.abort		= virtio_fs_abort,
 	.release	= virtio_fs_fiq_release,
 };
 

base-commit: ac86e1112a6a
-- 
2.51.0

