Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792787334;
	b=P0wj1bNgSycxd/tDguX5q0t2nCzytu2Y768Q8eI8/E9yiAm7HUnkJAhobxiHj7rDYcwY
	 JeI+pp5XqOI41NVPZXjuEMll2A6vgO0oFW+ldnMCbtCAK9D5auzKfnI83N+T8c1leYJ1D
	 L4lu0rlZWJKvTgSbczbsd4LtiJWW1FHoG77ILXgpJDohwX6Bk9afXEsbgdVPmGPf/8TBS
	 iZdCO5SfjLWev9CU0EcC7aWegCo1tTMU1HlMeiT2PpYE1n6cc7fkcEhY/ug/CuGeD9fV3
	 wuIjyXSTMuZiVMdFsby9lHPouCDYKYhf5mG2NeUD/Hrxl59e60FLjxRCQPwH08XJWtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787334;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=na0q2E34TuiPOPsNsx7clTKcBzeXZO7wjs7O48XqMJ0=;
	b=CLCgnen2f9Dq2Cv6xFTqQna2piSPQIAXhtT4za6ZYsJfMT1yvcy9QrJwkRzotB2NqFyk
	 TwmB3WaceRuYX622Hi9R43+HFNsDnsJKMCiP2tRIbMTOmBXFpVvXmgyd5P6q+gJpNbCsh
	 knOd6y5jr/ptJy+2Ca6d2tXllmkkCDT3r2sW+wNB8h1U5iFQ+z+3pfkHfFNywOj5ccdAn
	 B1xS9wUn754Esra8ojvJPAhSEOaY6KGXU2+X0SQXdYtJZD8qYwiWLxfmkx2hEUFaADh0M
	 /LrclGa8HBUiqG+96QWEUL/wDradkgSmL9pMb7M24uIIpqOfgS3UXRS6ZY4gC6al12A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DeWmb80V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A92606A31E
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 20:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DeWmb80V
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792787333;
	b=B+oKt1zJov1g0iCZKZPVl3raip9FDEsUQOFG+/luq/ZVDsTola+Iz1BNFU8rqH8Zg8i0
	 bsPW/vOJgoPy9/ZJE5nfz0HqZ8kaWFPKGNmJ6BYHhyQWxGt3cQVmEJUJzmZD/1ajYPEVV
	 KsrdqgRT+iuFrMVrxINMEqRs3gLwUYY0ESnZun/TjHTV/1iDl1vNjbH1F2AHxz+aJOFk4
	 z2YRf0NWzizWmcbpZbIMs+aeFGPlTQ/g1G1sq6nLf0PdkbfAslt/ND0futUwBEA/GiRAn
	 XoBgXPD7Q5JNtZA7LgD9YL5HWDpZTvx5QdVyG2XaNM+siOjUNMIIyJ0mAvUHJV0GWiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787333;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=na0q2E34TuiPOPsNsx7clTKcBzeXZO7wjs7O48XqMJ0=;
	b=f8izhEU44nMgpL4vtcQVJAhQQrATB4Wbd+VnZhOT2lwbnplYzbvktG6D+1LTudiDyeFv
	 qkyBdv4z6SJfpbyVtexzd4rL4bZbextoI1png+QvqN0ze53jwdtwGEQUCvrq9iswVqwiG
	 djLrxymmsf0ml4GrTiWsXCyQCkpah1YpAcBvWpgEyHQAxeweZGPXDQ+0JT8g9//zgdYxv
	 nmsMiKUt7trY6lbBLxt72Zzb7CYjI3o4oG4vYF5vKuRQGJr5oko4pzyusnLl+yTBZTy9s
	 U0PhMnRa+6WUpcCZhoodp4jj8pkNf9bBG0bmdPC6ObnZ6iHFpSjWzH3mlcimwZn2FOg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 314341F01829;
	Fri, 23 Oct 2026 20:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792787333;
	bh=na0q2E34TuiPOPsNsx7clTKcBzeXZO7wjs7O48XqMJ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DeWmb80VqILdsCsavdB0NyZskn4RNhEAiKM6bpO6YkzYma00jPxOSTEh37fCAMADT
	 qdpY90ygVqjraUsDN3MsVCm+6vikiPCLuGEqoOQZbZ/vfkYIiEHrPZwTjEC90tCwR9
	 ag/0L7OWmhkRUtrqYhUf6dhxlf956w1MnmHRvgP4kBMSjEDxFgmaPJNPzFCXUtDVA5
	 Mik8zhQ9JPtsZgUYjYDXdgeObZN4J8uJ5wv6hHo94X6ZdsR1CjrIJ2IEa2JAYJveX3
	 4Q9Dl9spLmod1wWSLGdGAwP1NrvmUfJCfrOaNdtjdsj/PNNbAdITYgC+ctCkXWZ4eb
	 swXRvltjydx8A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9FBFD44603;
	Fri, 23 Oct 2026 20:28:52 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 23 Oct 2026 22:28:43 +0200
Subject: [PATCH v6 1/8] fuse: {io-uring} Add queue length counters
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
Message-Id: <20261023-reduced-nr-ring-queues_3-v6-1-658235c9b9bd@bsbernd.com>
References: <20261023-reduced-nr-ring-queues_3-v6-0-658235c9b9bd@bsbernd.com>
In-Reply-To: <20261023-reduced-nr-ring-queues_3-v6-0-658235c9b9bd@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=3112; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=ew8Loht7/s/v9+CJ7lFhSnfg10fFKeD1z4veh1XOTUw=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJuH24ocLj76i7z/D0Rh986JHuz7F8kHXHU8MjPXu7u8
 zqvfc7odJSyMIhxMMiKKbJ0SeyxnfKPT1bt6/rrMHNYmUCGMHBxCsBErA0Z/odKHJcy2K2y1lFs
 eiDP1Bxt7zXyb/S2LPlzpH2ZF5vdjHkM/7RYGmTNVj962dshLqd+m/9ujs5lhZ31xudCg5b6bbF
 wZQMA
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


