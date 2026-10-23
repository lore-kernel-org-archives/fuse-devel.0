Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792795841;
	b=JYAWeJqhTSMkej0O/88q6e7dqNWpBPSrZLFtgXmy5zs7YQAfTCwKFJSFe9ttguDKh0jW
	 T28k87oA5MQUWqCtPbXigxp5BOvvmPXE/7E+i4BMNG3rz6YklH3O0plttzJ3bWfa6owkf
	 gZXnscL1aJkbQUUqzisI8o4pkbapm2l8SYRAWTlppvIx6Yi3BPzs0A0zdJf0fdH6Tuv1Q
	 6BAn0JvbT/+gR0cKD4IqnNsDx90vWyERAfXdY8CMfK3B/eXo8QBbuAz8AKYPTyzvHetfK
	 l8Wi8mtELPnZwgiF65CHRjDFRgsKa7BLvHAwM8cltfjGiJ/CdCpnmlgsOHvAiMe6OMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795841;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=H5vbdGsgDzis3IEAgy9tD8q7FKauPBIaEBmObmaTyMs=;
	b=qnfKIQVZRMUIQlBWA3nr0PltrcCVnexqj0Z74YyDVAqJRvbZgRhEvyaVH3eOcjq98zWO
	 2d/qvwET0pmapn/LuWTuqdSwp1GlsrLuQHcCCTwN5sRcVATypWV0fNd2Y9qSJB//+bTxs
	 qEpEWxYqduDQa4AsXfZx4mxeePFXfnk9lROGtwchlZ3HZmAEgwdEbRh5YhT/A0kCryDva
	 Gfur4VjrjDbkGwRqgWT2QweO1ANXVIRrreTkET2eU5phlzLFrhqmPHfJvMKFCMyA5N+gb
	 eLwfIjaM8srrDisFjmTnrRVdkxw3/As3z/baf/4yKxsRJJjhmPW6NR3wVEoaZBCM0bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bE2Px5ek;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6CC606A322
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 22:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bE2Px5ek
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792795841;
	b=TNz0OwxbcUx3wgPKJIzUVob8HCyti+MEo8fUz4nRY+ofIZKVxKbWNQb5yzEpQnI1MK8u
	 CP1gzymDD/hKdgSp6MTM95t6iiL7OaDxyRizSeAksJpk5ACoKjlvUWayKye9DgPNSDzsM
	 k1Z5U9f4klHUwbxtrEjVxELfc6C/OzwTtmu0x0ly6UslAgXR1S3lByLJnScGIX+xJ6+MD
	 dqZlICCzbveT07jCjBgZ2obi6bqpU3ztxt91qunxdBo4zIo1H5OAf7UTUU0hc78AU1bvT
	 1iOkHV+biFqCzrM1ueeAaaUtcxmGj2Xe6to7uLv5rMFXGSVVmdyhoGA+MEAzT7h0zwA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792795841;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=H5vbdGsgDzis3IEAgy9tD8q7FKauPBIaEBmObmaTyMs=;
	b=tMxwMwn4z6gekiEGLaSeqB3Ix/nzVDbx6mcCy3uNGiFEJHwD4wkrHxZdKKa/JJpdt/Xn
	 7CJ2YkD1on9bvrdbWVLbMQsoOyRtEapaNB8lcOxkKLptub6bLPrPHfRQlQZ/XouUHZnZr
	 6fomDBA8vvUSraMd8KbPkN1ZdgT6g58e1W7E5HshZanv+Tt6LLVQ/Ta3dEnsz7Q7kQ5xa
	 ci6GPq7/o6DZRMkY019b2DrSwwTvVRwxEj6y6d8HHGtsLN7g5BhlDo+6SbQpkYELC9Oxd
	 TSuR28cYMDTZAIQ6G0JTfmyMEoTg0ClAIlKb5uZAU58nzrJgmAGQNQ/r+cBpwVbna1A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E7ED1F031E1;
	Fri, 23 Oct 2026 22:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792795841;
	bh=H5vbdGsgDzis3IEAgy9tD8q7FKauPBIaEBmObmaTyMs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bE2Px5ekH9AAtwzdYf3xSgS6JH/+IfdfXVJDQRA9wfueqUN6QeQDCHO5nT8Bw928v
	 uUl2oPewpWee2DZvp7EFjv6yLA3k1HJPhgIB38xK5MchvcXBePS7PNm5lpZYOGbuca
	 ftCCVFw+E5Ou5NYWRCQg/+P90msLSyZXT0Q6DGsjImDlLOzZELds9QFcNZXt26VWKp
	 360MU8fYatm9o1Vrr1H/38q3YWNsmXcvNvEK0UaFCtIt0MGmfyNhuzFchN4pyPeHuJ
	 P0qugxtvbJ3dtHG3jq09p6HitxgauefOPRx0n4bcp9fzCdIB2mL3T2MASJjw+Be2TC
	 f2qfWzxBC/pVw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0CDBD44679;
	Fri, 23 Oct 2026 22:50:39 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sat, 24 Oct 2026 00:50:33 +0200
Subject: [PATCH v7 4/8] fuse: {io-uring} Select the queue through the CPU
 to queue maps
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
Message-Id: <20261024-reduced-nr-ring-queues_3-v7-4-4e77e284fd48@bsbernd.com>
References: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
In-Reply-To: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2237; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=4GfEBMk8qXIbomD/0fLssBxsa+zlIp/Mrzffd0M4Cmo=;
 b=kA0DAAgWMvNp7peNQvwByyZiAGrb5Lyj56Seyy46e/SFaH8vjDtPJP0bak6yeilErvIVwpUUx
 oh1BAAWCAAdFiEEihi8PZT+Dh0m9a/XMvNp7peNQvwFAmrb5LwACgkQMvNp7peNQvzeIAEAyaTb
 4OInxJcRfTALTy6lX4gqv6qb4rKeVG8h1i6Rl+kA/jP8SWnrRPWFqTJrP9Mq7d8dyIAp9yMqFQ9
 eZhxhxtMD
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com
Content-Transfer-Encoding: 7bit

From: Bernd Schubert <bernd@bsbernd.com>

This is a preparation for a follow up commit that lets a server register
fewer queues than CPUs. The queue of a request then cannot be the queue
of the CPU that issued the request.

fuse_uring_select_queue() picks the queue through the NUMA node map of
the issuing CPU, or through the global map when that node has no queue.
No change in behaviour, every CPU still maps to its own queue.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 fs/fuse/dev_uring.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 32c8e2db26b7..d243e124cb4c 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1892,17 +1892,21 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 	}
 }
 
-static struct fuse_ring_queue *fuse_uring_task_to_queue(struct fuse_ring *ring)
+static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring)
 {
-	unsigned int qid;
+	struct fuse_queue_maps *maps = ring->q_maps;
+	struct fuse_queue_map *q_map;
 	struct fuse_ring_queue *queue;
+	unsigned int cpu = task_cpu(current);
+	unsigned int qid;
+	int node = fuse_uring_cpu_to_node(cpu);
 
-	qid = task_cpu(current);
-
-	if (WARN_ONCE(qid >= ring->max_nr_queues,
-		      "Core number (%u) exceeds nr queues (%zu)\n", qid,
-		      ring->max_nr_queues))
-		qid = 0;
+	q_map = &maps->numa[node];
+	if (!q_map->nr_queues)
+		q_map = &maps->global;
+	qid = q_map->cpu_to_qid[cpu];
+	if (WARN_ON_ONCE(qid >= ring->max_nr_queues))
+		return NULL;
 
 	queue = READ_ONCE(ring->queues[qid]);
 	WARN_ONCE(!queue, "Missing queue for qid %d\n", qid);
@@ -1927,7 +1931,7 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 	int err;
 
 	err = -EINVAL;
-	queue = fuse_uring_task_to_queue(ring);
+	queue = fuse_uring_select_queue(ring);
 	if (!queue)
 		goto err;
 
@@ -1970,7 +1974,7 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
 	struct fuse_ring_queue *queue;
 	struct fuse_ring_ent *ent = NULL;
 
-	queue = fuse_uring_task_to_queue(ring);
+	queue = fuse_uring_select_queue(ring);
 	if (!queue)
 		return false;
 

-- 
2.55.0


