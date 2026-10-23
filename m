Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792787334;
	b=IMxxMKG22vm8LlIBq3fBeNMvlUuxl/GUs7EFFVKFkChzOHslvX6g64IqcgukzkfluBE9
	 MoneE6qLnzEhPbluzicFwmr4tKWaTkp7E5rQ0KSM7+KOGhaumyJY3ehDqFb+945JiZUzK
	 Bt5FufIq0appHM7PDDtD7f43gioTYJSkQaOy0fpb88ORO3wEm+b7j5uzUe1kT3fxzWx7E
	 z8MKyntUDR6uj6oq5HAKpIzxNJ7Wh20iccmxaVzlUGd9gHVLghx6qWlnrsgGuMBGUaZZg
	 t+/oI2vCNW78i+KCBA9Nb9+eDZWtGWYHLddrUszm69UIrWbFbv3bIOtdXzujnYKt1OA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787334;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+m5nDxkiax04ILsqg5kV/Rug8tAT45BKs+0mxi1hhwU=;
	b=BAuh5GKyDkHvKoKmysQQQEsu3glqDUuajGifqioaYHjg2tIoLXcAKm9Z3a0Pjt9+UJUR
	 9fW/mAELpowt3PqCydOXPA3q7H4DS0CYvkNDxN5cF1ne1G5PcLf4suv9gFy8HdfwA+711
	 Npq8zAmAxQ14PEjz0FkOrsgCZO5VJGsiAxU/+QlXZqmXn0CYll1Qbp6ZTTa1lHA6iVQNh
	 XZUEbu6so1zEv7M6HaI2NMnaQIWOtLAalEpwBDrNvsfs+rBYw7/YyOBVuBWFxtBjs8GaN
	 1Qeopa4E9mOoM9UAV66lxvN2wseMDQ9Xqjs82FqGDk3C680cFHCbbSihb+SktJcad0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtM0mjHB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92512606A31D
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 20:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtM0mjHB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792787334;
	b=Z/5+nrMPkqsuamyDFFycOqzUSiWphs5oiOC8IEvPuWba0cKe9DYyWSyeiLAxHXD2rhCU
	 PRtvtKQPjcHMj8fmNejSW6Oq0Wx8RDgt0p2Kll5Kq2uusnXaxm+h9b3opZBGQZFiC7baz
	 3639nh14xV0Ueq3IbLihgGTNagbS92JQ3aEnvdnUNi7lPhDGnjqRsoKhiWQ0AIleOmWZh
	 SEIOmMV/pMByeoc+FCP30VJMGBWFlmOC5kg8DC701UupCO41KWnGL+1ykYAd6b8b33iZf
	 L8Ns4yLgzECHpZYLKw2bQVOzfA7wzKEech+UVN/bSTg+1FlpS9Xk3mjxPQqh9gOSVAQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787334;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+m5nDxkiax04ILsqg5kV/Rug8tAT45BKs+0mxi1hhwU=;
	b=WIjEEaczwSzKUfs+c0EXnbn8qdttKOAsLzd8lLFKup3iB1ciBOXSd50dpYSEwS8TQsmH
	 09mrg7+VE3/BSxLykJeWMUWuc4byVs46miI5kX9Xdvc/Jt4XCUbW1gSFQaoIDsGFiFnEP
	 VmX5GIq08vDFgs9LitXBJi/ZVafq5LHeaMqvWpR3PqBgHTdbOQu6otJ2GpzebhLnXZCrn
	 nIn9zxFOhXSVJ5xw1siG3dzcFI/gwsSRAEKp/qRI5CYvw+XN0HMJX2mWGfwql+BwDfQgR
	 Du3YbbVUNakN+PWHtEJmcu7ALZEMoLXE/Unl798ofyLq/Vin0gNEKHeNRcd9RJyeZqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 316BA1F031E0;
	Fri, 23 Oct 2026 20:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792787334;
	bh=+m5nDxkiax04ILsqg5kV/Rug8tAT45BKs+0mxi1hhwU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QtM0mjHBTWGyo1cWKi1b99j6y3h8ExJsgxoMMm+Po5c5J4Y4Fhqj/ikgNNmRGSCmn
	 trZFZf+JwsUNxZvWN/1it5bTncSCTYnn4Sd+MdGbd4DQknfvCLIfk9BqmUkqMxhtlO
	 nqqPXldzQH5IdKXQy74YmpMpWz5L4KD4nXgHHKir5CehFJgiddoRf866yO+DnRiwBH
	 DdG3AbRx2dQih+3QWdsc3y6jyTmFgD9OJj+cEZA2WfoQd60H+Jmsg1yTMpc/iprKK6
	 VXu3v4VgV0j9XXkYE7JVo+8tNfKkDR6LtgxrxpMMvdeHxK/Lkk491A/r9iJJaNKvK8
	 4cvTxfnR66czg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B52364460E;
	Fri, 23 Oct 2026 20:28:52 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 23 Oct 2026 22:28:46 +0200
Subject: [PATCH v6 4/8] fuse: {io-uring} Select the queue through the CPU
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
Message-Id: <20261023-reduced-nr-ring-queues_3-v6-4-658235c9b9bd@bsbernd.com>
References: <20261023-reduced-nr-ring-queues_3-v6-0-658235c9b9bd@bsbernd.com>
In-Reply-To: <20261023-reduced-nr-ring-queues_3-v6-0-658235c9b9bd@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2398; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=0bSOn8HFfQToLCRbRk/6dBwfmGzXgifFo7XsyJ2NPnA=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJuH26sOyHzzfeE854VBaELhF/8O8Fau6L3wg3pr8U/Z
 z/fElcY31HKwiDGwSArpsjSJbHHdso/Plm1r+uvw8xhZQIZwsDFKQAT0U1hZHh1S5Mx7lmddib/
 35a1laciH2pzevcbLVxi3rn1bPJENi+G//GWc4zK2xmKp00P/N+0Ynb381OKv428bh2VP1jnVf/
 qIi8A
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

A CPU id at or above the number of queues wraps around now. Before, the
request went to queue 0 with a warning.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 fs/fuse/dev_uring.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e24cca4c3df4..b683fefe5cf6 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1888,17 +1888,24 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
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
+	int node;
 
-	qid = task_cpu(current);
+	cpu = cpu % ring->max_nr_queues;
+	node = fuse_uring_cpu_to_node(cpu);
 
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
@@ -1923,7 +1930,7 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 	int err;
 
 	err = -EINVAL;
-	queue = fuse_uring_task_to_queue(ring);
+	queue = fuse_uring_select_queue(ring);
 	if (!queue)
 		goto err;
 
@@ -1966,7 +1973,7 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
 	struct fuse_ring_queue *queue;
 	struct fuse_ring_ent *ent = NULL;
 
-	queue = fuse_uring_task_to_queue(ring);
+	queue = fuse_uring_select_queue(ring);
 	if (!queue)
 		return false;
 

-- 
2.55.0


