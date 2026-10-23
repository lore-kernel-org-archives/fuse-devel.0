Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792795845;
	b=dSYab7U1z/Eml5UnMHyvQFlASxetCvkDcL5d337m9x8nOOwWl2AzW8w4bcXeQyIwYFGm
	 h1qr+/qKpetdsVwJiZBZAOGKtCjfXuZ/WbLn+WxP1J9CbeOh1MWrzGFx7q89sT+MAt8YT
	 SVNFE87qOJvXwd4OiIUAEIr+PTvymePC+xsWSOVNCiNgqvdw42ufrhCK0p9AO5iXU0U8k
	 nw/EWCU6ey0THYL6wRiFUbcanIeCPn8qHBFIaqCL5T9fa1alRf7Tg6fSY8lEM/zNs1AYg
	 eVuCqdsLXsGqglp9QyWzltgdEuEwklz0KY0NYGM6cr5lAAqvwygqdXu4FKb9Wr6eWeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795845;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=na0q2E34TuiPOPsNsx7clTKcBzeXZO7wjs7O48XqMJ0=;
	b=nvKoeg4kVKg0KctsGReyRp3gIlAEGPahEYXq8u0x/3NzoVF/GYiVlASgw7xzv2G1sXqh
	 RAJUGoGDVKqVa/+iw3vmFt66AIinOUnZjwVKqRHt9UhEA81mRcQxrf/uzyL1RN46Oa9p+
	 ofduRoMlfM94Be7YiW5P5Gac61u+k5sVMy3tu7TX4s4HnxASNkbMbKR7Zj7WVO0H4Oezu
	 cvaLz6sRhiLp7++OibwWBT6z0mk0NKLDVp+W/nkLeybS4+uhI1BtLKQLeSteo7LeJ3kn0
	 IrmitBfLJKIPLW8Qab/pXWRD3XQ3iod0/UHclC7HkBfUsMzIqZAmSGoMF3W3L9MSHVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iPLE/kWB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF0E606A31B
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 22:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iPLE/kWB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792795844;
	b=sTqxn/RB2bKx7JQQGs2NJiDZW01JpoJXwO8fO7ty3jccSin2j2e10MxirGNROTP06fjC
	 agaS/OI37K3/p41Y/Mx5Zaca87+OGu+pJGdkq/0Vmtlq2oiEplWUkTnHbUs1ZFaiej3E1
	 lEPoDayR+hO3IFYAjTJL5GS6jDqD+D6mJwsKAy5WegVHKQa7wBjOPWlIyj/s8sErKWxkr
	 gDQUVKoL/J/dKEr2USDXakhs/WHIJFVuJUduWzjHwd/MaPH+n3i9o10MPAZ+lOnHnQUH3
	 dxuoCw3Amk2weIkJykW+kbc1ZT0fFu9e60HT3z4h4BH0zotCAE+HJBzjAmT7XRfuHuA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792795844;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=na0q2E34TuiPOPsNsx7clTKcBzeXZO7wjs7O48XqMJ0=;
	b=DXYUdKeudMAg3H3sG2OIHMh1xiP/ta+EVOVFNLbmz00BQnVWZlRnq2evnvuNSmK3cBjY
	 5txZZgkGRwUbLp5ym3jSS8YFwojZg8Nw3vJfZW1FVLmuf0V/wS0TDEikiKUOoPcdSQWZ9
	 4UgjrcnJJkDWdmvAD43r9Fxm0E5AXhIB/MNtXf/n7X0wqQJwepn4EpDQTsVhIIUVAFjIc
	 Zz7oHCCalK/GrBLFpTYHZaHP3nKcXtJKLijsBTtD2WesbSC4PZjxJzxPKRa+BJ0OdfBmE
	 NhlmFPrLYpx58byIPbNgkAf/MgLacZnyQnLmjq6vUQnXpCSw16913L/ZpGqY1QrqTFw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64BF01F01828;
	Fri, 23 Oct 2026 22:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792795844;
	bh=na0q2E34TuiPOPsNsx7clTKcBzeXZO7wjs7O48XqMJ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iPLE/kWBF/cHpm+8Vgi2tP0/GQqhmLo1l/ShBcfVKNRQZMJTGjMILLZQsJNPar1sC
	 GfbsArG85iJTXhTiLGTy92vvh/DxiLn1DTG+60bi0bwEAshtqHtoj05bdiBGPXJQGL
	 y4EWO6BtVLNhMgMD9fIDypwMwl8mKy9ozjBf2rBc/5fJ6dijASVc0//23VhoR/1bEV
	 b4LhGFdANBunRwHv0oZSWpl4i9cNkzU763hoeoJoSntS8d05UUV7j9rI4ffN6mXJ8s
	 CCOTaHVqAuabOWzx0zBtfi5kZ9YB0zlhjdvI6M7IUeT5+SoLNfPzyqjYL0kJjoH1If
	 wJIYhAK0xyK1g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E77BF44669;
	Fri, 23 Oct 2026 22:50:38 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sat, 24 Oct 2026 00:50:30 +0200
Subject: [PATCH v7 1/8] fuse: {io-uring} Add queue length counters
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
Message-Id: <20261024-reduced-nr-ring-queues_3-v7-1-4e77e284fd48@bsbernd.com>
References: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
In-Reply-To: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=3112; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=ew8Loht7/s/v9+CJ7lFhSnfg10fFKeD1z4veh1XOTUw=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJuP9mt+6v7xrcNnpWnX/GYm77vTzxk924t0/udzVZ2a
 +/vVveb1VHKwiDGwSArpsjSJbHHdso/Plm1r+uvw8xhZQIZwsDFKQATqdNjZNjAkXgi/9QKFleF
 mKdSyxf/Pscz9cX3qPZtWer3HqdfiXrMyNDT+eX3i8vzOhUZyx72VUydGP6qW0DR9qT7+1u/9P3
 DTbkA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com
Content-Transfer-Encoding: 7bit

From: Bernd Schubert <bernd@bsbernd.com>

This is another preparation and will be used for decision
which queue to add a request to.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c   | 15 +++++++++++++--
 fs/fuse/dev_uring_i.h |  3 +++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 460776cd69cd..1aca6ce906f0 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -159,6 +159,7 @@ static void fuse_uring_req_end(struct fuse_ring_ent *ent, struct fuse_req *req,
 	spin_lock(&queue->lock);
 	ent->fuse_req = NULL;
 	list_del_init(&req->list);
+	queue->nr_reqs--;
 	if (test_bit(FR_BACKGROUND, &req->flags)) {
 		queue->active_background--;
 		spin_lock(&fch->bg_lock);
@@ -166,7 +167,6 @@ static void fuse_uring_req_end(struct fuse_ring_ent *ent, struct fuse_req *req,
 		fuse_uring_flush_bg(queue);
 		spin_unlock(&fch->bg_lock);
 	}
-
 	spin_unlock(&queue->lock);
 
 	zero_copy_unregister(ent->cmd, ent, issue_flags);
@@ -188,6 +188,7 @@ static void fuse_uring_abort_end_queue_requests(struct fuse_ring_queue *queue)
 	list_for_each_entry(req, &queue->fuse_req_queue, list)
 		clear_bit(FR_PENDING, &req->flags);
 	list_splice_init(&queue->fuse_req_queue, &req_list);
+	queue->nr_reqs = 0;
 	spin_unlock(&queue->lock);
 
 	/* must not hold queue lock to avoid order issues with fi->lock */
@@ -1823,6 +1824,7 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 	req->ring_queue = queue;
 	ent = list_first_entry_or_null(&queue->ent_avail_queue,
 				       struct fuse_ring_ent, list);
+	queue->nr_reqs++;
 
 	if (!ent || fuse_uring_prep_buffer(ent, req)) {
 		list_add_tail(&req->list, &queue->fuse_req_queue);
@@ -1863,6 +1865,7 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
 	set_bit(FR_URING, &req->flags);
 	req->ring_queue = queue;
 	list_add_tail(&req->list, &queue->fuse_req_bg_queue);
+	queue->nr_reqs++;
 
 	ent = list_first_entry_or_null(&queue->ent_avail_queue,
 				       struct fuse_ring_ent, list);
@@ -1894,8 +1897,16 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
 bool fuse_uring_remove_pending_req(struct fuse_req *req)
 {
 	struct fuse_ring_queue *queue = req->ring_queue;
+	bool removed = fuse_remove_pending_req(req, &queue->lock);
 
-	return fuse_remove_pending_req(req, &queue->lock);
+	if (removed) {
+		/* Update counters after successful removal */
+		spin_lock(&queue->lock);
+		queue->nr_reqs--;
+		spin_unlock(&queue->lock);
+	}
+
+	return removed;
 }
 
 static const struct fuse_iqueue_ops fuse_io_uring_ops = {
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index 263d0f8b9714..77f87075f62d 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -135,6 +135,9 @@ struct fuse_ring_queue {
 	/* background fuse requests */
 	struct list_head fuse_req_bg_queue;
 
+	/* number of requests queued or in userspace */
+	unsigned int nr_reqs;
+
 	struct fuse_pqueue fpq;
 
 	unsigned int active_background;

-- 
2.55.0


