Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792795843;
	b=qUBxaWZWCBZsdsdVHUw8/vqo+8GiJ5F0L87+pSrcVjd0mYEKI0zCVGkHxmoEH5WWNCIS
	 U4+rdJWZ6zGU+lFHkelwi8LWxnQqGV4E3ix2hZhn+6gIJiRJ8B5aOnNwv7i/Z+MaI5jbb
	 zv9i2tUPVOT43P7Gau7CcbedgygEvQDnXXtG3HDN8uLdV7y8BwkuT11vMYfistcIS6+oj
	 PAO8ykjl1xmH/Yzzp1VkLb4eonC2q5pdSEs4BuCc5MixrUs86zFDLhXvije1EB4TsYOsk
	 /hBfurjMQAkDF4ztuZ9UcoMJPBBpnDRTHg6gHPuQs5jHU1tqB688VTLkiEiefPEhbRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795843;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=althFKxZqFDq5PoXufz8maronvNQk8/T5x1zQnC1soE=;
	b=ZVTP+MJVKY73vUomB8XOWZBLGwm/pFF3TAFiSoQkuH4wbs2AUssistH53zzHIavLbihp
	 TTrdW5suenGaWnkplMC0MW8dxOGndCiAjc9S/6pmR3B5yjUvIrm5FB7Cq7PoQgTeB/Jfk
	 4I+ANT3HZwoEbwfE1Er+yDrCGeTnd3P8ykXDn8tLHTKW1G7wDoOOrczKZrOAhOv4rZWsi
	 Ejbdd5CW6gIqmoXT8S9pJT5xArwfBOHYpO+7SxakQsDIHyTnvd3XRY3hqVIHu/scxrAl1
	 CmJ1ioDlg7O5E7oI4hV4Yt8SzJaXw3eO5BkUIQjbGdUB9NT9BIRENSnudFswpkQdGvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a9Fr3/PU";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E206E606A325
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 22:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a9Fr3/PU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792795842;
	b=jlD0pOKIXv6a+TcJCw0eHnmeYyLQVjuFfrKDqK4ZowwCWHpzJ/27mTPem2At+4YqUxqU
	 bGDkNi00xN5h3fEWIj/7YnfUJ9CUxvUHuoWckXMWOCAp7kO8DjWzJxoH4UvPlCKRO25r+
	 GJiQEo/3x5PYz4q8bt8Zkv3bRgS3c5bAIFEKTw3ZKHXRX1+FA0jEXprDZjJ/DczlEEdOL
	 sfLPIER+k/oecMOJyRHTAm/eHPdDCjSw78gvxxX3QX1iqmdYXKuzy33H5gqJT20J2xgol
	 rjcn0yGwN9gJNFWu4C83oF+XqSqQjlkpUsc5Nh8KgNvQEMhNNMbc5IUPxL2z1Y1Ugow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792795842;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=althFKxZqFDq5PoXufz8maronvNQk8/T5x1zQnC1soE=;
	b=NyHHbX2hdWOfb4iRIlQ/uCimOORs5lfyexhl0a4eiHkuOmonzI7cb6UzXxt8QFat9mBZ
	 xc9JEGiqKR5GJz2ZNIkLnIZz002MV/wbHjzT46IkH6rXfVIUX5BcmG5adq/dpneWQ1aon
	 MYUNuUyl9++3SfULMu52uBhhDvpNh5bIWTGktwgOVac7KmyttU8aCScqpCKP5DmU8Bm7i
	 AYABlGnUNyLvg3u1vuB84IZFWv9gVNYdjQWy2UBNsXGLTIxvnN2un0YQWK3Gm6BtxF2Xo
	 KKsS+zVVjeuvaj13DOOvJx2taXrMBAww4ho9vncZaR+JXqfnkJuemjx76Ned70Jq83Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 128011F031E5;
	Fri, 23 Oct 2026 22:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792795842;
	bh=althFKxZqFDq5PoXufz8maronvNQk8/T5x1zQnC1soE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=a9Fr3/PUG7oJMfQaEiEy/SzLXtBrQA0LYwwXCs6jutUJiRmo/O2U0H158hyfSBss0
	 jzgPvUrAyq90By5oPiuUV5slwhCgeOJt8WvU/+L4wBCsqTDU3OIw29x+7oku9K9SnR
	 OFvGq8sFoBpEdUQ33B0vIS5qJR/xhakam0CnwRIMJrlO6yic22isdGz9YgkGI/ZjN2
	 MQq7Tjla77Dz6PO/48Ogr/DeipT558c6PuCiuneV2qm4D2d35XYpg3KxEF4n+6T0Al
	 cb+kWdZhqcK1px2dsGuB5KGgKXhhVl1Q51d9WXI7EfRbzPTTBu9gKFkO1/4KwScuTz
	 bEbK7CzXSNaXg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2609344685;
	Fri, 23 Oct 2026 22:50:39 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sat, 24 Oct 2026 00:50:36 +0200
Subject: [PATCH v7 7/8] fuse: Add retry attempts for numa local queues for
 load distribution
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
Message-Id: <20261024-reduced-nr-ring-queues_3-v7-7-4e77e284fd48@bsbernd.com>
References: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
In-Reply-To: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2856; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=adBEJ1BmwJtbJvMferBwXqU975gjTI5Gx8GJUfvKlOo=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJuP9mb5yQZ1aehoZw2uzRg0pVd2xlXPbI6ybrI+52ni
 KngJtGXHaUsDGIcDLJiiixdEntsp/zjk1X7uv46zBxWJpAhDFycAjCRDacYGW4YfGFg45fRPv7n
 gH9/ab3zqe46M5Hu4oQLs1LDrd5bvmb4K+Jcqyj89gC3Wtt8qd/1+Ru3Hd3bLj71QUTRc5kFLkV
 XmQE=
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com
Content-Transfer-Encoding: 7bit

From: Bernd Schubert <bernd@bsbernd.com>

This is to further improve performance.

fio --directory=/tmp/dest --name=iops.\$jobnum --rw=randread \
--bs=4k --size=1G --numjobs=1 --iodepth=4 --time_based\
--runtime=30s --group_reporting --ioengine=io_uring\
--direct=1

unpatched
   READ: bw=650MiB/s (682MB/s)
patched:
   READ: bw=995MiB/s (1043MB/s)

with --iodepth=8

unpatched
   READ: bw=641MiB/s (672MB/s)
patched
   READ: bw=966MiB/s (1012MB/s)

Reason is that with --iodepth=x (x > 1) fio submits multiple async
requests and a single queue might become CPU limited. I.e. spreading
the load helps.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 fs/fuse/dev_uring.c | 41 +++++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index f22a1b5fc7fb..ca82965fdee1 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -24,6 +24,11 @@ MODULE_PARM_DESC(enable_uring,
 
 #define FUSE_URING_ADD_QUEUE_FLAGS	(FUSE_URING_ZERO_COPY)
 
+/* Number of requests in the queue until another queue is checked */
+#define FUSE_URING_Q_THRESHOLD 2
+
+#define FUSE_URING_Q_RETRIES 2 /* number of retries for a better queue */
+
 bool fuse_uring_enabled(void)
 {
 	return enable_uring;
@@ -1964,10 +1969,11 @@ static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring,
 {
 	struct fuse_queue_maps *maps;
 	struct fuse_queue_map *q_map;
-	struct fuse_ring_queue *queue = NULL;
+	struct fuse_ring_queue *queue = NULL, *primary_queue = NULL;
 	unsigned int cpu = task_cpu(current);
 	unsigned int qid;
 	int node = fuse_uring_cpu_to_node(cpu);
+	int retries = 0;
 
 	rcu_read_lock();
 	maps = rcu_dereference(ring->q_maps);
@@ -1975,11 +1981,34 @@ static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring,
 		goto out;
 
 	q_map = &maps->numa[node];
-	if (!q_map->nr_queues)
-		q_map = &maps->global;
-	qid = q_map->cpu_to_qid[cpu];
-	if (qid == cpu && background)
-		qid = cpumask_next_wrap(qid, q_map->registered_q_mask);
+	if (q_map->nr_queues) {
+		qid = q_map->cpu_to_qid[cpu];
+		if (qid == cpu && background)
+			qid = cpumask_next_wrap(qid, q_map->registered_q_mask);
+retry:
+		if (WARN_ON_ONCE(qid >= ring->max_nr_queues)) {
+			queue = NULL;
+			goto out;
+		}
+		queue = READ_ONCE(ring->queues[qid]);
+		if (unlikely(!queue))
+			goto out;
+
+		if (READ_ONCE(queue->nr_reqs) < FUSE_URING_Q_THRESHOLD)
+			goto out;
+
+		if (retries < FUSE_URING_Q_RETRIES) {
+			if (!retries)
+				primary_queue = queue;
+			qid = cpumask_next_wrap(qid, q_map->registered_q_mask);
+			retries++;
+			goto retry;
+		}
+		queue = primary_queue;
+		goto out;
+	}
+
+	qid = maps->global.cpu_to_qid[cpu];
 	if (WARN_ON_ONCE(qid >= ring->max_nr_queues))
 		goto out;
 

-- 
2.55.0


