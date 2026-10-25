Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792967365;
	b=XqpdCP6QHPSjsOYH/Yl/jhvcEpmePxl8422jzXPbjmV6iIoadMQmjKftLZhj9c7BvV3n
	 RbJIuIMXTVNfVYPFTa3XnzGnApKov7RMzGuxuAZejNPd/IJhFmSyrveD9/Pl0wlGJgU8l
	 l8+Rwf5Q3+kUqPxfjfBFfcfskczgT6HLqGn9YaY1qr7KryKJGynqTV4Ju0Fq/HcURLLN2
	 S9xCusD/MVTQBXxFrDXDLEiTlQ5FiXkidHFhTXThmTZ8B2BSA0iDW0MKf1rRAND0JO2KD
	 y2IehJTbaJylVkuQG2HgbC8RZarObnXS/mZb1uQmNy+O31/AR8sybOHi5Ehm6EBuAhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792967365;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XzQzk1iB1+QLYQ1UDvDZ+qrq/5EHkUqaR8ovdpmn0Ek=;
	b=kabPEUv7cDCiVhto/3H20pu8VewVFJpzbjulFYHskrn+W7OKbQcVJZfpUKLDI9hDoglD
	 8dHauKIJXngAXMieDDCtLnJyAS3SVWw8ciY/rQ+Zx/ieLe/80JQkx3s9rEH3mTGSDV5Ty
	 K3amE4UBItGscTygF3RJQZjTE1e0dMqHVAaFXsBsbXqOe/KOQUC0ZHbzDlP9qUOnIaU6B
	 F1vXyaUwlMfcpeXTVnvGz4Leuxil+sbqBX6hScef2bW7eUd0ALKK5dvBgu7iJVtM8BGdA
	 DGvLEGbqtTNp0P/X1linZXRoi/jTdUnSC+1v8442Vm+XiTSev4O5LIu6+ghVGjiuMuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fB4gnIHo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9460606A320
	for <fuse-devel@lists.linux.dev>; Sun, 25 Oct 2026 22:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fB4gnIHo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792967364;
	b=dSjcz92/2fBH6LqQckhKvUqhNLxjCkJvf7ZGkXYibTubHtb1saxpUpuWymrvYIsYNneA
	 KIKXBzDBQPWzohZUOQnbr13IY9xcqQ0T8q5F1yTfD9aUopQmGBQHfWAGe05Emt9172saZ
	 ow75/TvXrA8biXD6qnixXUjwYEVtGUr9IQ87/aawJTExdHbEfs5CyWH5Xi4LEuDxMjRwf
	 Py3Z8T3/H95zfSwrVMdlMyoNJ61E0OnDaYnbzgZGQm+rEfbeVOE8ljHqJ+/jnc/Y5hoW1
	 Yh41DOmtqlje1JO07/kaOdokVXSZ72wy4Ibv3BjXYZFgqULC0ulRZNZutodxQwDZuFg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792967364;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XzQzk1iB1+QLYQ1UDvDZ+qrq/5EHkUqaR8ovdpmn0Ek=;
	b=d7ge4tD5PHVJY3qVDu1shvGXWrFnkFWsnsB/25n8+wbPIOmHOvzfVM60ZwO7SZWejbrm
	 8bzhCAe95f/mvPQD8yBNCDHUoswk1LM7MI+G48QH6VtjZz5yrTbO0JK76sDGGjKYm6zYV
	 WALz7yBfRg4MXTFwPZZnNDIOy8ttpxk1K954zQfiohq9Lym3fSNf2yfMbwlZx0D7SPpTV
	 6sBj8rfOL4Ahhuyfp1+PEWtWqTf8GOk8azcF+edejcW2EMdgY5t3mVh9mA1xmradSrUXE
	 Dhv0WlJIpeWn5OZA8iT/QnG0eXb2Ryuq1LI6wGU2rVaRfR3lRDlzWQDmfXUwH6fg5ag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E87C1F031E3;
	Sun, 25 Oct 2026 22:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792967364;
	bh=XzQzk1iB1+QLYQ1UDvDZ+qrq/5EHkUqaR8ovdpmn0Ek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fB4gnIHo+Y7k+8nNR8ZeHBLpdwfJAwIO7Q41Z3xxum/NnVxcVa71YKQ1nddEOrzJD
	 XViWdjH3+IvDLCMJLSde5Z65+PDBEsPGr1JFq9ti5nlH0ODHcdpCFTKw9VtZu5PJMj
	 98k/CrGqERRWmWU16tyr2df/U/PEUhKE7ZfdHRNLrjQIjlH8l06mRbsM6FcnVPdru9
	 qyhYqeKHCsb1fdf/31FChjL/he9TyrR5KXhpvyuAMT4x6ZvHD/FEH/U2m2LJ12LHka
	 SwqskpXSkAjESvSPR3eagPr4+S75UvyFlyO7zIf8kfMzh26DZ2W0HqT4wtUwx2/Sn5
	 ZITa9ihrWsRmg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9ABAA44AFA;
	Sun, 25 Oct 2026 22:29:22 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sun, 25 Oct 2026 23:29:14 +0100
Subject: [PATCH v8 6/8] fuse: {io-uring} Queue background requests on a
 different core
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261025-reduced-nr-ring-queues_3-v8-6-8a2570e8d2a4@bsbernd.com>
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
In-Reply-To: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=4021; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=oUbbCnwNP1quWDYI5AMQL4ZSQ9HWTbA55+IRKXYl5V0=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLLuNR1I73uisocnfzmbc84NY843Al/E7U+kvlA/8Orht
 6s3VBMkO0pZGMQ4GGTFFFm6JPbYTvnHJ6v2df11mDmsTCBDGLg4BWAik9IY/gf8cptpLc7wI2T+
 jS86G9tfay6ZwHfQeE/2d5moI8vLxHYyMvQ+TWRc+TZT7u88EaEEyQdVuRc3XPv/TC8++pS/8+M
 NmZwA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com
Content-Transfer-Encoding: 7bit

From: Bernd Schubert <bernd@bsbernd.com>

Running background IO on a different core makes quite a difference.

fio --directory=/tmp/dest --name=iops.\$jobnum --rw=randread \
--bs=4k --size=1G --numjobs=1 --iodepth=4 --time_based\
--runtime=30s --group_reporting --ioengine=io_uring\
 --direct=1

unpatched
   READ: bw=272MiB/s (285MB/s) ...
patched
   READ: bw=650MiB/s (682MB/s)

Reason is easily visible, the fio process is migrating between CPUs
when requests are submitted on the queue for the same core.

With --iodepth=8

unpatched
   READ: bw=466MiB/s (489MB/s)
patched
   READ: bw=641MiB/s (672MB/s)

Without io-uring (--iodepth=8)
   READ: bw=729MiB/s (764MB/s)

Without fuse (--iodepth=8)
   READ: bw=2199MiB/s (2306MB/s)

(Test were done with
<libfuse>/example/passthrough_hp -o allow_other --nopassthrough  \
[-o io_uring] /tmp/source /tmp/dest
)

Additional notes:

With FURING_NEXT_QUEUE_RETRIES=0 (--iodepth=8)
   READ: bw=903MiB/s (946MB/s)

With just a random qid (--iodepth=8)
   READ: bw=429MiB/s (450MB/s)

With --iodepth=1
unpatched
   READ: bw=195MiB/s (204MB/s)
patched
   READ: bw=232MiB/s (243MB/s)

With --iodepth=1 --numjobs=2
unpatched
   READ: bw=366MiB/s (384MB/s)
patched
   READ: bw=472MiB/s (495MB/s)

With --iodepth=1 --numjobs=8
unpatched
   READ: bw=1437MiB/s (1507MB/s)
patched
   READ: bw=1529MiB/s (1603MB/s)
fuse without io-uring
   READ: bw=1314MiB/s (1378MB/s), 1314MiB/s-1314MiB/s ...
no-fuse
   READ: bw=2566MiB/s (2690MB/s), 2566MiB/s-2566MiB/s ...

In summary, for async requests the core doing application IO is busy
sending requests and processing IOs should be done on a different core.
Spreading the load on random cores is also not desirable, as the core
might be frequency scaled down and/or in C1 sleep states. Not shown here,
but differnces are much smaller when the system uses performance govenor
instead of schedutil (ubuntu default). Obviously at the cost of higher
system power consumption for performance govenor - not desirable either.

Results without io-uring (which uses fixed libfuse threads per queue)
heavily depend on the current number of active threads. Libfuse uses
default of max 10 threads, but actual nr max threads is a parameter.
Also, no-fuse-io-uring results heavily depend on, if there was already
running another workload before, as libfuse starts these threads
dynamically - i.e. the more threads are active, the worse the
performance.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 fs/fuse/dev_uring.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index cff8a06e6d68..f22a1b5fc7fb 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1959,7 +1959,8 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 	}
 }
 
-static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring)
+static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring,
+						       bool background)
 {
 	struct fuse_queue_maps *maps;
 	struct fuse_queue_map *q_map;
@@ -1977,6 +1978,8 @@ static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring)
 	if (!q_map->nr_queues)
 		q_map = &maps->global;
 	qid = q_map->cpu_to_qid[cpu];
+	if (qid == cpu && background)
+		qid = cpumask_next_wrap(qid, q_map->registered_q_mask);
 	if (WARN_ON_ONCE(qid >= ring->max_nr_queues))
 		goto out;
 
@@ -2004,7 +2007,7 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 	int err;
 
 	err = -EINVAL;
-	queue = fuse_uring_select_queue(ring);
+	queue = fuse_uring_select_queue(ring, false);
 	if (!queue)
 		goto err;
 
@@ -2047,7 +2050,7 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
 	struct fuse_ring_queue *queue;
 	struct fuse_ring_ent *ent = NULL;
 
-	queue = fuse_uring_select_queue(ring);
+	queue = fuse_uring_select_queue(ring, true);
 	if (!queue)
 		return false;
 

-- 
2.55.0


