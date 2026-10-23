Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792795843;
	b=OIiHMoxoxtwiqPMnJAO6LsqTRMwP0ZlVZUgRqcMgztWwFDIr0XPsipVlDZtmyaqbqyGH
	 jo8wcByG7VfN1+2N4vtXvxgeLek1rk1OPMuYBD/SMH9AMPJ3U3al3fSSnMMgJfjCu4ElV
	 ups1/DyX0gQehSfBbidasatW75c3f9ixCxmVWw2AwA32Rv3L4+fEVVumVIM2PxBrfM+1J
	 u5VS9wn3bteC2dB4jTEW1CyKAgCaI9+Kr8OGKIkWyc1S77eEioC9JwNnbtROZi8T0jSW2
	 WdF7JjQFKQbWucW4iyu9S+ZA7WvQdPQzdRMZDIsSUq9CY9OID6jrXlv7c/5Uuvkp4WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795843;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qR9xMI0gJUWkO9dpJitcAGdqZ4Lbw6qM5py3dJoYIRE=;
	b=PlJNPiR3LA9OVyFYqAmQWk/L4kWh2ut/rwpb18k8DIKR7Hxq58OA/15ehVnrW5iZ/9JY
	 +LUZ8VnYufw50FFnhAySwXAF1yaFCEdgDIVXuQIsStrcbcfhPmBkVLa10o4jeSgIhl3vx
	 8aekaf1usaVzgyn15E02TQfyWsInjc2rvR3se0pea6dOmMKAPPVP4j8s1GdoLxUvOSVg7
	 BlydjtmG3d+Hs4YVXaMgNraXU2VbVT+qnjV+Zj48BmLXBwUsAhoAgq35rNEZ3HIOesYUf
	 9hVyhZaqNFJqargl4NCIh3/xn4ewNh1VTtFDLATp6M0jdtYe/E8xEvZOxggIXgxrsmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WTk9EmRu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6C7606A31F
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 22:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WTk9EmRu
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792795842;
	b=nx47swZEgM+O/Swxlkd8fPruR4yV1ZLp7KOWdPeAKGTQKMsOd8pv/t5mWVlRWz2PDB6G
	 olHW1/cl2PF+oeBKo062xS7IsdgIlqD31GoysfH9CLsWlSFnTR5fVkVqK+wvzCnKxytxB
	 /9z6ASgA4NxpfRXWq5aTRScxGLUN/v0uh4VxRMATKO1FSu0aXa2+3TKY6QNQKONMOg2l8
	 DQpJqSiAKnahDmvbVijBIueVM0yxASOPiqWj2PJaXoTYLx2spradrXvZMFfYYVT7ndUIj
	 OGOQopuGgX7m7x8UeCHLTnzsFnqwI/hyLX528f2Z6/NrIbw/kxmftVguBIieBE5boWg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792795842;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qR9xMI0gJUWkO9dpJitcAGdqZ4Lbw6qM5py3dJoYIRE=;
	b=i1GLC5wmcFvtnL+uIU2JMT1ZuJx97fsTqrTgo8GWMyaQYc9pyJgfKSSPWwNVb1IY5mP2
	 vk4u2MQcFkbPg5Tj7RINvvsIckdGDscFK1YqobRSYmyW+7taOo5zgVJ3cS9f4jSG3SxTP
	 vRQq4bFzBuTyAsIA/aNOjrZZjxC65EoRw5Nu4hpMemuHe0q645djVrLkNI/1fbl8ZdQfx
	 76ph+3Nf6M45ISn8lxuCWMoR2PxEBtc1GLqRikWOAiKhnuFzOo+VfwxmswxokElsd6YZi
	 O/01Vd+IWsEkddSJ/zpyHmPxHPBmsUUpqTSsm/fAXlNgZ8tGslU36AhsxDAb9N90DdQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 741581F031E2;
	Fri, 23 Oct 2026 22:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792795842;
	bh=qR9xMI0gJUWkO9dpJitcAGdqZ4Lbw6qM5py3dJoYIRE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WTk9EmRuSvavLplBqP+SSMTsbrGf0KT0j6KiNrznrSgx+gq9+rfsaBXtIo2V7wVqe
	 lLxMlKCczlNws1RmN5vTe2o8ANdlq1DrXIq85sEQXIzcNRUY03hHDESd+Q3rFzmsr7
	 GsGAAnTBXSk1l4Bdup6+2Ym1ImyMfgZF7kdtCI2MNMO5e7uLiZwulI3y3yvuAVp8ee
	 Kna8txpEk4GZ1YkNchOnidseH2ixat+nPlcr2ZRN7GzgVF5VJEe7M9UnUo+3sCOVYg
	 oYRDcAanjUrI7HygK0ZLua1rwFqXBsYigagmvwd7ny3E1T/4u4n2RjqI8V51CY/PHx
	 CTu/9MFoZYL+Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 157094467D;
	Fri, 23 Oct 2026 22:50:39 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sat, 24 Oct 2026 00:50:34 +0200
Subject: [PATCH v7 5/8] fuse: {io-uring} Allow reduced queues through INIT
 negotiation
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
Message-Id: <20261024-reduced-nr-ring-queues_3-v7-5-4e77e284fd48@bsbernd.com>
References: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
In-Reply-To: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=14616; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=VhxON8hR8DSgPKiegAQZRAFyhW+W501tsW3HRdWd+8M=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJuP9mz7GES97H5KZsSNxvoH1B7lit+/xLvxg03T5SfK
 DpilHhLp6OUhUGMg0FWTJGlS2KP7ZR/fLJqX9dfh5nDygQyhIGLUwAmws3LyPDk4+0/B7gDzU6r
 flZ6WXXKdSrLfa+JW2pEgy892HoibvMVhn9aSTleLUUrC2p+vjT/bt3UtHPS3Nni1bsEfZwvzg/
 bJcIOAA==
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com
Content-Transfer-Encoding: 7bit

From: Bernd Schubert <bernd@bsbernd.com>

Main reson to reduce queues is that a system with many cores
might run out of memory if queue-per-cpu is used.

A new INIT reply flag FUSE_URING_REDUCED_Q is introduced, that
activates this feature and also expects that each queue is created
with FUSE_IO_URING_CMD_ADD_QUEUE. Without the flag, nothing changes.

ADD_QUEUE adds the queue to the CPU to queue maps. A request mapped to
the new queue is delayed until the server registers the first entry
of that queue, usually shortly after ADD_QUEUE.

Race free protection with spin-lock and rcu:

- fch->lock protects against multiple ADD_QUEUE calls at the same time,
so that new q-maps per q-create are serialized in publishing. It also
ensures ring->ready is not set before a q-map is published.
- queue is stored before map publishing, so that a sender always finds
ring->queues[qid] set for a qid in the maps.
- rcu_assign_pointer() ensures a sender sees the new pointer after
  cpu_to_qid[] is filled.
- rcu_read_lock() ensures that old maps (in the sense of new queues)
  are not freed while the map is still used

It also includes slight refactoring in fuse_uring_create_queue to
avoid freeing in the middle. Also dropped is "kfree(queue->bufpool)"
in that function, it is always NULL.

Assisted-by: Claude Opus 5.5
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 fs/fuse/dev.c             |   2 +-
 fs/fuse/dev.h             |   1 +
 fs/fuse/dev_uring.c       | 127 ++++++++++++++++++++++++++++++++++++----------
 fs/fuse/dev_uring_i.h     |  13 +++--
 fs/fuse/inode.c           |   8 ++-
 include/uapi/linux/fuse.h |   4 ++
 6 files changed, 121 insertions(+), 34 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 1a40b60afb98..47a67aef0f1d 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -77,7 +77,7 @@ void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_param *pa
 		fch->max_pages = param->max_pages;
 
 		if (param->io_uring_enabled)
-			fuse_uring_conn_init(fch);
+			fuse_uring_conn_init(fch, param->uring_reduced_q);
 	}
 
 	/* Pairs with smp_load_acquire() readers of fch->initialized */
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index dbffd5bed2f5..9222e3c27d9a 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -24,6 +24,7 @@ struct fuse_chan_param {
 	unsigned int max_write;
 	unsigned int max_pages;
 	bool io_uring_enabled;
+	bool uring_reduced_q;
 };
 
 struct fuse_chan *fuse_chan_new(void);
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index d243e124cb4c..cff8a06e6d68 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -279,6 +279,14 @@ static void fuse_uring_free_q_maps(struct fuse_queue_maps *maps)
 	kfree(maps);
 }
 
+static void fuse_uring_free_q_maps_rcu(struct rcu_head *rcu)
+{
+	struct fuse_queue_maps *maps =
+		container_of(rcu, struct fuse_queue_maps, rcu);
+
+	fuse_uring_free_q_maps(maps);
+}
+
 void fuse_uring_destruct(struct fuse_chan *fch)
 {
 	struct fuse_ring *ring = fch->ring;
@@ -311,7 +319,7 @@ void fuse_uring_destruct(struct fuse_chan *fch)
 		WRITE_ONCE(ring->queues[qid], NULL);
 	}
 
-	fuse_uring_free_q_maps(ring->q_maps);
+	fuse_uring_free_q_maps(rcu_access_pointer(ring->q_maps));
 	kfree(ring->queues);
 	kfree(ring);
 	fch->ring = NULL;
@@ -407,12 +415,32 @@ static void fuse_uring_build_q_maps(struct fuse_queue_maps *maps)
 		fuse_uring_cpu_qid_mapping(&maps->numa[node], node);
 }
 
+/* Returns the replaced maps, to be freed after an RCU grace period */
+static struct fuse_queue_maps *
+fuse_uring_replace_q_maps(struct fuse_ring *ring, struct fuse_queue_maps *maps,
+			  int qid)
+{
+	struct fuse_queue_maps *old;
+
+	old = rcu_dereference_protected(ring->q_maps,
+					lockdep_is_held(&ring->chan->lock));
+	if (old)
+		cpumask_copy(maps->global.registered_q_mask,
+			     old->global.registered_q_mask);
+	cpumask_set_cpu(qid, maps->global.registered_q_mask);
+	fuse_uring_build_q_maps(maps);
+	rcu_assign_pointer(ring->q_maps, maps);
+
+	return old;
+}
+
 /*
  * Basic ring setup for this connection based on the provided configuration
  */
-static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
+static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch, bool reduced_q)
 {
 	struct fuse_ring *ring;
+	struct fuse_queue_maps *maps = NULL;
 	size_t nr_queues = nr_cpu_ids;
 	size_t max_payload_size;
 
@@ -426,12 +454,15 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
 		goto out_err;
 	ring->max_nr_queues = nr_queues;
 
-	/* Legacy behavior by default, one queue per cpu */
-	ring->q_maps = fuse_uring_alloc_q_maps();
-	if (!ring->q_maps)
-		goto out_err;
-	cpumask_copy(ring->q_maps->global.registered_q_mask, cpu_possible_mask);
-	fuse_uring_build_q_maps(ring->q_maps);
+	/* With reduced_q, FUSE_IO_URING_CMD_ADD_QUEUE builds the maps */
+	if (!reduced_q) {
+		/* Legacy behavior, one queue per cpu */
+		maps = fuse_uring_alloc_q_maps();
+		if (!maps)
+			goto out_err;
+		cpumask_copy(maps->global.registered_q_mask, cpu_possible_mask);
+		fuse_uring_build_q_maps(maps);
+	}
 
 	max_payload_size = max(FUSE_MIN_READ_BUFFER, fch->max_write);
 	max_payload_size = max(max_payload_size, fch->max_pages * PAGE_SIZE);
@@ -446,21 +477,23 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
 
 	ring->chan = fch;
 	ring->max_payload_sz = max_payload_size;
+	ring->reduced_q = reduced_q;
+	RCU_INIT_POINTER(ring->q_maps, maps);
 	smp_store_release(&fch->ring, ring);
 
 	spin_unlock(&fch->lock);
 	return ring;
 
 out_err:
-	fuse_uring_free_q_maps(ring->q_maps);
+	fuse_uring_free_q_maps(maps);
 	kfree(ring->queues);
 	kfree(ring);
 	return NULL;
 }
 
-void fuse_uring_conn_init(struct fuse_chan *fch)
+void fuse_uring_conn_init(struct fuse_chan *fch, bool reduced_q)
 {
-	if (fuse_uring_create(fch))
+	if (fuse_uring_create(fch, reduced_q))
 		fch->io_uring = 1;
 }
 
@@ -469,16 +502,24 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 						       bool fail_if_exists)
 {
 	struct fuse_chan *fch = ring->chan;
-	struct fuse_ring_queue *queue;
+	struct fuse_queue_maps *new_maps = NULL, *old_maps = NULL;
+	struct fuse_ring_queue *queue, *result = ERR_PTR(-ENOMEM);
 	struct list_head *pq;
 
 	queue = kzalloc_obj(*queue, GFP_KERNEL_ACCOUNT);
 	if (!queue)
 		return ERR_PTR(-ENOMEM);
 	pq = fuse_pqueue_alloc();
-	if (!pq) {
-		kfree(queue);
-		return ERR_PTR(-ENOMEM);
+	if (!pq)
+		goto out_free;
+	if (ring->reduced_q) {
+		/*
+		 * Every queue addition creates a new map to make reading the
+		 * old map race free
+		 */
+		new_maps = fuse_uring_alloc_q_maps();
+		if (!new_maps)
+			goto out_free;
 	}
 
 	queue->qid = qid;
@@ -499,11 +540,16 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 
 	spin_lock(&fch->lock);
 	if (ring->queues[qid]) {
-		spin_unlock(&fch->lock);
-		kfree(queue->fpq.processing);
-		kfree(queue->bufpool);
-		kfree(queue);
-		return fail_if_exists ? ERR_PTR(-EEXIST) : ring->queues[qid];
+		result = fail_if_exists ? ERR_PTR(-EEXIST) : ring->queues[qid];
+		goto out_unlock;
+	}
+	/*
+	 * Reduced queues can be added after ring->ready. Connection abort
+	 * stops only queues it finds, so a queue is added only while connected.
+	 */
+	if (ring->reduced_q && !fch->connected) {
+		result = ERR_PTR(-ENOTCONN);
+		goto out_unlock;
 	}
 
 	/*
@@ -512,9 +558,24 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 	 * fully initialized queue after &ring->queues[qid] is set
 	 */
 	smp_store_release(&ring->queues[qid], queue);
+
+	/* Update maps so that requests can be scheduled via the new queue */
+	if (new_maps)
+		old_maps = fuse_uring_replace_q_maps(ring, new_maps, qid);
 	spin_unlock(&fch->lock);
 
+	if (old_maps)
+		call_rcu(&old_maps->rcu, fuse_uring_free_q_maps_rcu);
+
 	return queue;
+
+out_unlock:
+	spin_unlock(&fch->lock);
+out_free:
+	fuse_uring_free_q_maps(new_maps);
+	kfree(pq);
+	kfree(queue);
+	return result;
 }
 
 static void fuse_uring_stop_fuse_req_end(struct fuse_req *req)
@@ -1451,7 +1512,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	return 0;
 }
 
-static bool is_ring_ready(struct fuse_ring *ring, int current_qid)
+static bool all_queues_have_entries(struct fuse_ring *ring, int current_qid)
 {
 	int qid;
 	struct fuse_ring_queue *queue;
@@ -1503,11 +1564,15 @@ static int fuse_uring_do_register(struct fuse_ring_ent *ent,
 
 	spin_lock(&queue->lock);
 	ent->cmd = cmd;
-	fuse_uring_ent_avail(ent, queue);
 	spin_unlock(&queue->lock);
 
+	/* Requests wait on a queue that ADD_QUEUE added before its first entry */
+	if (fuse_uring_get_next_fuse_req(ent, queue, issue_flags))
+		fuse_uring_send(ent, cmd, 0, issue_flags);
+
 	if (!READ_ONCE(ring->ready)) {
-		bool ready = is_ring_ready(ring, queue->qid);
+		bool ready = ring->reduced_q ||
+			     all_queues_have_entries(ring, queue->qid);
 
 		if (ready) {
 			WRITE_ONCE(fiq->ops, &fuse_io_uring_ops);
@@ -1642,6 +1707,8 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 
 	queue = READ_ONCE(ring->queues[qid]);
 	if (!queue) {
+		if (ring->reduced_q)
+			return -EINVAL;
 		queue = fuse_uring_create_queue(ring, qid, false, false);
 		if (IS_ERR(queue))
 			return PTR_ERR(queue);
@@ -1894,23 +1961,29 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 
 static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring)
 {
-	struct fuse_queue_maps *maps = ring->q_maps;
+	struct fuse_queue_maps *maps;
 	struct fuse_queue_map *q_map;
-	struct fuse_ring_queue *queue;
+	struct fuse_ring_queue *queue = NULL;
 	unsigned int cpu = task_cpu(current);
 	unsigned int qid;
 	int node = fuse_uring_cpu_to_node(cpu);
 
+	rcu_read_lock();
+	maps = rcu_dereference(ring->q_maps);
+	if (!maps)
+		goto out;
+
 	q_map = &maps->numa[node];
 	if (!q_map->nr_queues)
 		q_map = &maps->global;
 	qid = q_map->cpu_to_qid[cpu];
 	if (WARN_ON_ONCE(qid >= ring->max_nr_queues))
-		return NULL;
+		goto out;
 
 	queue = READ_ONCE(ring->queues[qid]);
 	WARN_ONCE(!queue, "Missing queue for qid %d\n", qid);
-
+out:
+	rcu_read_unlock();
 	return queue;
 }
 
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index 268570e1477c..3e6683f5d9d8 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -163,6 +163,7 @@ struct fuse_queue_map {
 };
 
 struct fuse_queue_maps {
+	struct rcu_head rcu;
 	struct fuse_queue_map global;
 	struct fuse_queue_map numa[];
 };
@@ -188,8 +189,11 @@ struct fuse_ring {
 	 */
 	unsigned int stop_debug_log : 1;
 
-	/* static CPU to queue mapping which queue a fuse request goes to */
-	struct fuse_queue_maps *q_maps;
+	/*
+	 * CPU to queue mapping which queue a fuse request goes to. Static
+	 * without reduced_q, else replaced on each ADD_QUEUE.
+	 */
+	struct fuse_queue_maps __rcu *q_maps;
 
 	wait_queue_head_t stop_waitq;
 
@@ -202,9 +206,10 @@ struct fuse_ring {
 	atomic_t queue_refs;
 
 	bool ready;
+	bool reduced_q;
 };
 
-void fuse_uring_conn_init(struct fuse_chan *fch);
+void fuse_uring_conn_init(struct fuse_chan *fch, bool reduced_q);
 void fuse_uring_stop_queues(struct fuse_ring *ring);
 void fuse_uring_abort_end_requests(struct fuse_ring *ring);
 int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags);
@@ -244,7 +249,7 @@ static inline bool fuse_uring_ready(struct fuse_chan *fch)
 
 #else /* CONFIG_FUSE_IO_URING */
 
-static inline void fuse_uring_conn_init(struct fuse_chan *fch)
+static inline void fuse_uring_conn_init(struct fuse_chan *fch, bool reduced_q)
 {
 }
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 1341b681d0ed..2d017897f038 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1304,6 +1304,7 @@ static void process_init_reply(struct fuse_args *args, int error)
 	struct fuse_conn *fc = fm->fc;
 	struct fuse_init_out *arg = &ia->out;
 	bool io_uring_enabled = false;
+	bool uring_reduced_q = false;
 	bool ok = true;
 
 	if (error || arg->major != FUSE_KERNEL_VERSION)
@@ -1437,8 +1438,10 @@ static void process_init_reply(struct fuse_args *args, int error)
 				else
 					ok = false;
 			}
-			if (flags & FUSE_OVER_IO_URING && fuse_uring_enabled())
+			if (flags & FUSE_OVER_IO_URING && fuse_uring_enabled()) {
 				io_uring_enabled = true;
+				uring_reduced_q = flags & FUSE_URING_REDUCED_Q;
+			}
 
 			if (flags & FUSE_REQUEST_TIMEOUT)
 				timeout = arg->request_timeout;
@@ -1473,6 +1476,7 @@ static void process_init_reply(struct fuse_args *args, int error)
 			.max_write = fc->max_write,
 			.max_pages = fc->max_pages,
 			.io_uring_enabled = io_uring_enabled,
+			.uring_reduced_q = uring_reduced_q,
 		};
 		fuse_chan_set_initialized(fc->chan, &cp);
 	}
@@ -1503,7 +1507,7 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 		FUSE_SECURITY_CTX | FUSE_CREATE_SUPP_GROUP |
 		FUSE_HAS_EXPIRE_ONLY | FUSE_DIRECT_IO_ALLOW_MMAP |
 		FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_ALLOW_IDMAP |
-		FUSE_REQUEST_TIMEOUT;
+		FUSE_REQUEST_TIMEOUT | FUSE_URING_REDUCED_Q;
 #ifdef CONFIG_FUSE_VDAX
 	if (fm->fc->vdax)
 		flags |= FUSE_MAP_ALIGNMENT;
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 616430a2973c..d8cb1764e2ca 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -257,6 +257,7 @@
  *  - add backing_id_64 to fuse_open_out
  *  - add FUSE_NOTIFY_BACKING_MAP, fuse_notify_backing_map_out, fuse_extent
  *  - add FUSE_BACKING_MAP_CREATE, FUSE_BACKING_MAP_CYCLIC
+ *  - add FUSE_URING_REDUCED_Q
  */
 
 #ifndef _LINUX_FUSE_H
@@ -480,6 +481,8 @@ struct fuse_file_lock {
  *		privilege that mounting virtiofs or fuseblk requires).
  *		Insufficiently privileged servers ignore it.
  * FUSE_PASSTHROUGH_V2: use 64 bit server allocated backing ID
+ * FUSE_URING_REDUCED_Q: INIT reply opt-in to 1..nr-cpus queues, each created
+ *		with FUSE_IO_URING_CMD_ADD_QUEUE; serving starts at the first entry.
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -530,6 +533,7 @@ struct fuse_file_lock {
 #define FUSE_HAS_IO_URING_BUFPOOL (1ULL << 43)
 #define FUSE_HAS_SYNCFS		(1ULL << 44)
 #define FUSE_PASSTHROUGH_V2	(1ULL << 45)
+#define FUSE_URING_REDUCED_Q	(1ULL << 46)
 
 /*
  * CUSE INIT request/reply flags

-- 
2.55.0


