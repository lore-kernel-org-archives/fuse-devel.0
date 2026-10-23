Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792787336;
	b=Yr3xW4Qm4TCN7/Pl8h9A4qXMATgvM3KpTOGDeZapFJ5IlBP6eVnTBC5yyQoWP3IbzBf8
	 YzkprIgtipXAf9KQ2nZl+s6+7V4Pee3aG7KM32fvQ3K4tgwEJ15b29008c1470vi0CY31
	 rT6xtq9D1YbvqqQYT/URiHXoPIlon1Ol8vp9dFxJ74flM4C8inCtxeauOWECTf6ovJIgE
	 QVOXPbBxplD+FXJKTAIWFKlMLPwuE6u0QdVCFUNubM+gOqLFvnhZq5t3PCy1wS+XlPCOd
	 ZNIX+VZObzQnkJPvLnwuP3LIeg6MGQXF/OHwWe6H/NPhTGRFkdWShMVGf+NqNzAuWIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787336;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xefAS/uJZviZ8Z4o6s3O/rsmqG9Y12pNIioL0esQc7I=;
	b=5cS+K0+78QXyea4jQpi2qkMS021R7ZIyE8G9hFYuEMyOvnXzarRYw69qHJFfB5bHSpwu
	 ldfKTdBDZOkfBV2ZUmkPykwQITJpXoIk/5Iap269i/Bnr6HiqGy9ipCIF700y0TFqkCIi
	 3lO563lgriqTB2i0SQuM+Xx/96czl4n6aBF3EFNSeEoKiepKWejS2FN7rbWPsACPjCAHr
	 aou0VI7QoHdVZoxYwcduS079xlrMUiv4CABc99Vx8dX2KpsLK1Vz7JtyCsK4DgD34TKwv
	 DRlnXpDNS0bi2XdpgxYy0EA/EN+3nUGljtwbYUQr/vBBflsbICJO4FXW+lEtAKq2E4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RhIGpr9C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6D7606A322
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 20:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RhIGpr9C
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792787335;
	b=PvescqcnKKaChQRYtNvfDdYlhh0gdf1oBqmJUxeCrJCh4TvXNBe1xFhNiShw1AZX360g
	 xGJt4fyUl118XPr2i3ZNe7xNBd2JUaVRZW6+iseuiSa+Milabhjuj7FJZvluYsgc7WgpB
	 I4SETRZ/yEqXrRkSiZNso6QhfnYtH1AOSR0ZZRWIEvjKxx/DwJ4dbGRwe6v3pHpJ3OIcf
	 RbKqHig6iphD2B0OfmdlmZYWlTd/y58QB1OtfSHA+Q6G62ejONI1Dw3c0RwCqR4KyGJ5T
	 hD2AZTSq+EKFdy8359CI7q9GdmcWKtbYEbq1QDrxO/p0TCqgwvIjBjEXZ0atosIwlag==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787335;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xefAS/uJZviZ8Z4o6s3O/rsmqG9Y12pNIioL0esQc7I=;
	b=IDCdGurBm0KuqT6HuZXlwoTD4+XK9DBKsgl486BUSbYST68DRptSTebxU22RbazpmH+Y
	 R5mCzkegr9niI8TuNo8aZjaIhtCDNzW3CkZrhTR0UVQRDWXXq6B2fbhmw5iB6bgDonJ3J
	 t7D9hcbIfrsI3qcBgS+b5XwezI2e57bkbl3TZHJ0MRqc+wv1wmI67bhwv7zauCFVH15iJ
	 ZJWuBIgFPpXp5z42w3hY9PGlM5dvratu9wriCUSbXNEyF9/g7aZT0ALgBV2WqQSinPwlQ
	 lwGf7JzWPs2XxBugvpOKDhJiU8n58yGlLgPsRjQ7K7xWRLy6jTpY6bHPAD3+qxWN/qA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 421A31F031E3;
	Fri, 23 Oct 2026 20:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792787335;
	bh=xefAS/uJZviZ8Z4o6s3O/rsmqG9Y12pNIioL0esQc7I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RhIGpr9CdlLI4/IFjgLrLGqpx27HYyloGo8fNCPA6g3uHzmjYgkyzBBOKVAeM8ElI
	 kFEKzfd4CAA8UK70vGZYuDFSsuET8SDau6ufuDJr8vYCScpIiZNBx8Z1EbuBAcDLUB
	 BQdl3X3d4pPC8acw2nW0kya7scm6r7ZWx6CFe49AJeqq4gvDgHl9UObiyHQKJKD1nt
	 u5rMIzel8XaXqSlR8vGlCYgsT1Frq5NJltGa2F8gxrmHcCtd0XT9drbQXlpKtsoWPj
	 mGwIXvOL8uIP403s35/CLd7aUe6jEg0785174s4yWPwdBgNzQfIUi0vBrQuGClypGW
	 g1q/DudoG5HmQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C3F7644616;
	Fri, 23 Oct 2026 20:28:52 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 23 Oct 2026 22:28:48 +0200
Subject: [PATCH v6 6/8] fuse: {io-uring} Queue background requests on a
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
Message-Id: <20261023-reduced-nr-ring-queues_3-v6-6-658235c9b9bd@bsbernd.com>
References: <20261023-reduced-nr-ring-queues_3-v6-0-658235c9b9bd@bsbernd.com>
In-Reply-To: <20261023-reduced-nr-ring-queues_3-v6-0-658235c9b9bd@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=4021; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=8MeKPCFTmCl0gpq+o5smzXXdVYG5SfMu4GgpY26S2OI=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJuH26adef1noWCDK8aQo6d1k89mGIxYWpp78lnHLfnP
 uo0XMeX3lHKwiDGwSArpsjSJbHHdso/Plm1r+uvw8xhZQIZwsDFKQAT4Z7AyHA3d8fB8gnbjyYx
 SL246R9mNzlM6fvmhdXnWkvbH8+e9U2XkeE6p1W15DT2c4u5Ni7om7NhYWt/wp2r7X+PtgcGX9u
 1xpwbAA==
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
index d5d83506ae5a..87c8ea35d2c9 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1955,7 +1955,8 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 	}
 }
 
-static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring)
+static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring,
+						       bool background)
 {
 	struct fuse_queue_maps *maps;
 	struct fuse_queue_map *q_map;
@@ -1976,6 +1977,8 @@ static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring)
 	if (!q_map->nr_queues)
 		q_map = &maps->global;
 	qid = q_map->cpu_to_qid[cpu];
+	if (qid == cpu && background)
+		qid = cpumask_next_wrap(qid, q_map->registered_q_mask);
 	if (WARN_ON_ONCE(qid >= ring->max_nr_queues))
 		goto out;
 
@@ -2003,7 +2006,7 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 	int err;
 
 	err = -EINVAL;
-	queue = fuse_uring_select_queue(ring);
+	queue = fuse_uring_select_queue(ring, false);
 	if (!queue)
 		goto err;
 
@@ -2046,7 +2049,7 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
 	struct fuse_ring_queue *queue;
 	struct fuse_ring_ent *ent = NULL;
 
-	queue = fuse_uring_select_queue(ring);
+	queue = fuse_uring_select_queue(ring, true);
 	if (!queue)
 		return false;
 

-- 
2.55.0


