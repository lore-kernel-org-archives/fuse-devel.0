Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792967364;
	b=eO8s1ssYP/AdiKfNF63iPjN0LRD81wo9wyb1NNVFgP7rEsnAIUKLLSSJeRvXcsrhm7hB
	 hXPgFNqE51C7veCBT+hMzGpExviGkDk84siwSk8z+gN3g8sAniNXZrzIGY+MY5KqYK2qL
	 ZW5TLnsmY1l9qI3RKuVrVHVwU53AROkrnBrVhhsAH7mKZDcW9U6UF/49VvKpK77FgI6Wo
	 zanBziVpYNVcYG/kozpivw19AzZEmbw7/L804/1QHghFgo7QOX7V1HHdn+LNbB1vUpy93
	 dYPIpsJHblPe9SZdaZb1WTnI+Hzc0nHC6JNdFBgne8i/jrDmcCHVzxGB8crA4JbLNjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792967364;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=H5vbdGsgDzis3IEAgy9tD8q7FKauPBIaEBmObmaTyMs=;
	b=DmVae1fiGGymGW6ToAkhCQdki9/+FK96wtWn+0nubWo2PhjEaK8EnImEYSkE8wQf5cFM
	 68sk+8fY8s22nsOqjAezjFjhy4KyO1Hin/GyW8QqKVXOjdhUuwp9LTlJL+oh4YJgPMqIi
	 E0IUbjHtjLlmID18ZaMiZkQhukKodBcvUsZF5yWlJY4J/iejxXLLx/GfioZ8254k4ZaHD
	 FY4BbdP6Y6xJ2g6bOP/OhcGOm46DoRjuRvwop18o3drrutx1laaPv8j7ajI96JZA94XhJ
	 uxJ5u8zIyMTAef8rBrdxnzZhnKhrMbbcevShzs9J/qSL6KaHYQzUVBcPZ23c/9slFSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENfxUE9n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C45A606A31D
	for <fuse-devel@lists.linux.dev>; Sun, 25 Oct 2026 22:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENfxUE9n
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792967364;
	b=DjnDiQbdNKdnEllFOBMWmqCDTJBCb0TcP9Ln4v+FKrdXwAMivKxmShYtPVpVNuNobwWy
	 z2n5+pMK6M5j2fGLc1rVW5h3PLOFPMYlberkccryTyDJYS72+H4diQr2kNIWuvzdZ04Te
	 6MfQvbj2JNAwXGpwYLN8WFphlpxUwPJO712JlKGeBIfrAPI8m1vjXscRWQG/+ePSkWAIA
	 hKff6qGkyo98VJxjsHCkZYPIzMAeADGBQqAeZtpaQnH4TZfV4j9JbjVLyhDijEvOra0W5
	 +AVTT9azYCM3t83v63kgGdTTFyiKbnBlCQmuqqKGfquVlPwtslvS5O3dtVy0jLecQog==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792967364;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=H5vbdGsgDzis3IEAgy9tD8q7FKauPBIaEBmObmaTyMs=;
	b=jIhBfCUIytm3V613sXJhrMMqWshwwEBrmE8oJNmLhplJi07/MZi06lmcvQ5MGT/m2N1i
	 y5KKzPJmR/d/pHW8P7iZHfKw6iJzQZhI985c6GiGOIQTQEjiVmdKZQ+Mc7ZmuC54IeXhb
	 IZ+g3QG1ETevOZppEPiFnvofMFtzVv927ZlUjZwfrhen3Y8hHq5ew5nbPxP7IkcgwaUgE
	 yUaLwPnbOuf9k8B9Pdkz84X3p4BECYYrkutEne+kv4e/qmlNE8lQP7s8UQCspvEoKcEM/
	 Fiv7NGYysbMhfwITdmQVqieFpZNWzoNceCcwdbxuuCD8WrzdKmzosXcIGPJnEdltfDA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 099791F031E1;
	Sun, 25 Oct 2026 22:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792967363;
	bh=H5vbdGsgDzis3IEAgy9tD8q7FKauPBIaEBmObmaTyMs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ENfxUE9n2Ld3BNPE7FIHQgpwwOq08Zb264H2DKIB1ATTii8Y8vRrF3PiTrir1dveQ
	 4BV/3ybAcPyA89MWMN46w40TqoF1JLGqzV/tustXXXVPaSzaJEFF4YgVrZYTdCGCEs
	 Dwyp5Kv014cpfaN8pp9r3mYIrkQZNI99P0CuDEEeUDnNA2kmzWM4TqM5AFDtXgKWwg
	 /TFhitO/1KPVN8MjHdV7slmhRSqwGTiKacXo4tRaQT3tL5kPPj/58pSw49eMTviZx1
	 M6oF1rIdFfsi13dzc4UGJfdLi4L+ThOVJaN+LZWVjONaxYhGnrZJkzK823BlvWNZ3j
	 YPfAa7igk0lGw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8760A44AF2;
	Sun, 25 Oct 2026 22:29:22 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sun, 25 Oct 2026 23:29:12 +0100
Subject: [PATCH v8 4/8] fuse: {io-uring} Select the queue through the CPU
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
Message-Id: <20261025-reduced-nr-ring-queues_3-v8-4-8a2570e8d2a4@bsbernd.com>
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
In-Reply-To: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2237; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=4GfEBMk8qXIbomD/0fLssBxsa+zlIp/Mrzffd0M4Cmo=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLLuNe2X4fU5wtf5Rd3A4rjoji9ngst2cPD/t2cV1ZUVf
 xSgEbe4o5SFQYyDQVZMkaVLYo/tlH98smpf11+HmcPKBDKEgYtTACaSFMLwP9o3qd36n5jxG9FY
 o81svjlVdjJeFW8V0g3S8+U5YjZMZmSYm2e6c52AtVbYh7v2GVq3a6IvnDiwzD1mxQWum7dXcnf
 wAgA=
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


