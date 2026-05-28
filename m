Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ABD36D9F1
	for <fuse-devel@lists.linux.dev>; Thu, 28 May 2026 22:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780008907; cv=none; b=hMMKoI1AjEn++HzWZnmiAnxKS/PCdBevSSUlY8mMaVqbaknSKyBAIZuIlsWHK+Wo2uo5nvlnlknmJ59lN/U3GKA6SsT5DFtrHDRTJikjicUm5R5+hEwz6XQRqsIsLfvtZ0bVVO+NCz9W6+6nTEv3pltzXSdjwM6LzFoZCON68/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780008907; c=relaxed/simple;
	bh=hIbfaoE3EFBZq+txBA4/459uuMRX5ioUG28oxzaTC2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOFM88g1iMmckEXk8zMg6H40hKDNTsMQbiNSCQn2iBgZ/tPcEm/sCHTgS/IhCXq2zxDJulT+Jtb9DPLNPx1n9ytdP7mdUvdYfxGlkXk5614HQdtNuXNki+qKaRVip97iQlgg+Vh2Hylpu1/V44x8Ah2GqGUgw7PFeyzLIJL2QtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=anW4jzHg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="anW4jzHg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69193C2BCC7;
	Thu, 28 May 2026 22:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780008907;
	bh=hIbfaoE3EFBZq+txBA4/459uuMRX5ioUG28oxzaTC2Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=anW4jzHgJz9WA/wuITYotn/SVL+SUOiGd38qyOtN9+jdUXQeRzYD2BUlRyKgKVqv/
	 5uHbcK3fbptDdbqu09NDbIuMeuue8ZohO3+GVnHIXHfaGVJL9xYud7ZWIptOBI5Hyt
	 lPEgOorYkR++OyhENtIkN/mijGg2W0h4sZo6TaS9mZtebaiNUu4NofzKkIdBJTRLf8
	 GRQ8zwoECNVaCnFHqsXQzUtum0/4Xt7MoA7Bh7BeG19y/AjhfaKHulUJvrXLv4idhs
	 Q7IPequpiZkp6Qc0kBQA5WQit8ILgKYZ5RrKJns886aNIYhaNHZxLtQB7A5501+Yli
	 86ngUOeSWXfHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64912CD6E4E;
	Thu, 28 May 2026 22:55:07 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 29 May 2026 00:55:09 +0200
Subject: [PATCH v5 5/7] fuse: {io-uring} Queue background requests on a
 different core
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-reduced-nr-ring-queues_3-v5-5-1dc08c2fccf6@bsbernd.com>
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
In-Reply-To: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>, 
 Gang He <dchg2000@gmail.com>, fuse-devel@lists.linux.dev, 
 Bernd Schubert <bschubert@ddn.com>
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780008905; l=4389;
 i=bernd@bsbernd.com; s=20240529; h=from:subject:message-id;
 bh=0tlq2VqFQ9bbWLDB3YTX229+bvK+tDTUjVmkTXNEh+c=;
 b=dLxmH4i34ckmZ602rxZekStqg5v2Sm7ZSOKKQAhGQWAOgqPp4/OyKAxZmOMyR3GQ51TW0nH4b
 JbzAzp6KOruChk6RhUwBmkJQwkSnqThJZ3xrYQX16NPUioi7KALHFa7
X-Developer-Key: i=bernd@bsbernd.com; a=ed25519;
 pk=EZVU4bq64+flgoWFCVQoj0URAs3Urjno+1fIq9ZJx8Y=
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/20240529 with
 auth_id=732
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bschubert@ddn.com>

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

Signed-off-by: Bernd Schubert <bschubert@ddn.com>
---
 fs/fuse/dev_uring.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index d02266b483c89d105bd6301133820697f7caba9c..a79007c36e6be33f662bd5bcb80949a814d426c8 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1308,7 +1308,8 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 	fuse_uring_send(ent, cmd, err, issue_flags);
 }
 
-static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring)
+static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring,
+						       bool background)
 {
 	unsigned int qid;
 	int node;
@@ -1332,7 +1333,17 @@ static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring)
 	 */
 	nr_queues = smp_load_acquire(&ring->numa_q_map[node].nr_queues);
 	if (nr_queues) {
+		struct cpumask *mask = ring->numa_q_map[node].registered_q_mask;
+
 		qid = ring->numa_q_map[node].cpu_to_qid[cpu];
+
+		/*
+		 * Background requests result in better performance on a different
+		 * CPU, unless CPUs are already busy.
+		 */
+		if (qid == cpu && background)
+			qid = cpumask_next_wrap(qid, mask);
+
 		if (WARN_ON_ONCE(qid >= ring->max_nr_queues))
 			return NULL;
 		return READ_ONCE(ring->queues[qid]);
@@ -1364,7 +1375,7 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 	int err;
 
 	err = -EINVAL;
-	queue = fuse_uring_select_queue(ring);
+	queue = fuse_uring_select_queue(ring, false);
 	if (!queue)
 		goto err;
 
@@ -1408,7 +1419,7 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
 	struct fuse_ring_queue *queue;
 	struct fuse_ring_ent *ent = NULL;
 
-	queue = fuse_uring_select_queue(ring);
+	queue = fuse_uring_select_queue(ring, true);
 	if (!queue)
 		return false;
 

-- 
2.43.0


