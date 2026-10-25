Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792967366;
	b=XXX6isyArCyy5hHgnPKGLum2jCymzlODER1335wbRCiHeLxwZ/t7EAtjfZQGKnWZnhsw
	 6wb0Otj3qJt8J3O6CeCOcrw8xy92uRJofJSsS5Cd3i/Zk3mVQoJlvDdRMt+sdfkSlyz3f
	 lM6AggWmycYTcf86e1xRhGReaUdLkeIT6t+vgfDDfhj7Kvgzu1xzB8Aw4Y1fving10bLQ
	 1r8IGDXQ8n2LqpOm3wpmzWDpk8Rkb4dsCU3u05PVsxRCKA2r8eqG8RjUmDRq+uRXVHf+u
	 GrjplHiGUD5rxD2YXn+mcm34kj/3ZigaZD8NxM1z6GW9lnyCQBD2DrN+oU96xdwCm6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792967366;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=althFKxZqFDq5PoXufz8maronvNQk8/T5x1zQnC1soE=;
	b=OsrMZH9tNrrILJra1g7p93QKcSnk8PzTVMXKsJUNdE4AzYBJniYAZr22mspCR48hPIRM
	 o5+sWeCdCSy7LBiOVtHWsR3kj/ZkNa+o3qhqkXqnuczbWBQDHi6ry/r7jxxKw3aO3DeEa
	 oiOhUjqsQuIqHesVviFVrbaPp35qryysq0z8BzOgR/X4kiG2vaC8pRrYWOwSir8hJ2qXf
	 nfgqmWkUfNio1aK8j31wrN/zUtI3NVJC9SuQryNMNmJzuAVSpd7dbnLK3c66y1PuNNWF9
	 5HDTPCgnKrXQC3oaG1gkZztsUCO+9zaBgTkx4E/Of4Mw8BXJFOFvx5UQMKm2UkuQSKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ss8F4z4s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0578606A31B
	for <fuse-devel@lists.linux.dev>; Sun, 25 Oct 2026 22:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ss8F4z4s
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792967365;
	b=yuElEBJkDG3a1UEmlwsoueDkNnKp5EFIsvpEIAlul6A5D7yi8NhfkAHwaRHuQnr6Mg31
	 p9S5yuujjqVG+HW6uvpVQoVSl8zDFt52I0A/N6Xl9KFUUgiZ/0dPRl5k/jiZ0qj5P1C9x
	 qw2P4Vo3xc4RBi6GdxPkERW8N7fipq0SOMatdLqDiibL/2YYnOZlff10lQM4gtJ8KRgvv
	 LHoUQfoXO9gaRM/twd6oSLz2yhv4o7FMEwKVyAWM2ev3dgS33P2XRt7/iaPsZPLBhLxSH
	 smd29krj/+D18KV+jUKVD46j0/GhAlD5niqy8J3Fnfgq6eAjLnCSSOEBItoxYUNzwAg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792967365;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=althFKxZqFDq5PoXufz8maronvNQk8/T5x1zQnC1soE=;
	b=xqFl+0XYzhRSK8pFxBiOfT0fs1ytkqKxWJ++N3blJNqzlImFBCNsG96dsxX0aeD3rVrk
	 dlpKRQIOtk/qiejTDK2OgqrlPZSJtXuVKSJZ4avgN2UGyw6k94qPoPWeDIAwbIfvHbarE
	 WvYGkpQ++ntlQIhSG8zy4Y5Oqd/6+ts0zQ9AorxJMiCQoDgBlUuJ1DtDGfXWfaeRXs+/x
	 dozu/Bp7UoCzImzSjUNhc2E9+5grIu3sj8hYidBpF6P1lHRMnLX6QreaZjdQ9feP4JIQe
	 zRbxPU4ZzC073mX/uoxDK+6o03oEbbaQAxr/3B0RLu2o4IFGMiKezzRZDvCHC8HgTiw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 89CF11F01825;
	Sun, 25 Oct 2026 22:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792967365;
	bh=althFKxZqFDq5PoXufz8maronvNQk8/T5x1zQnC1soE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ss8F4z4sliKyc06PG1vpRrUm5JWn9yy/dNZRoG76wlBNRDNGQak3Ga5NTX2M+Uf84
	 3zE3x1JWQ5j7RfucuqdjtU9aSMWBZOmu4+WuiMx2hhRCFtia2qZqhuFlU/J2ceNg25
	 ra/nadAwOTxs2Z5SVuEmyCM+EjypttPho8PElbgvkJlaarbjBB5mtOvxchZYvtW5T4
	 DorEbQoAhpH9QJDbCkwPFxlOTFFFH/GQpy3yD5QWy0kFgU33IBXKhvm5KYB/QDAGac
	 fO4uMwoS5QfPqIVVB+D7rRAIb53ymPuwGsN8D7XgUuU0bGQq/6ROA6zqmv91TbU4DU
	 3leUwOz6DdSUQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A400044AFE;
	Sun, 25 Oct 2026 22:29:22 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sun, 25 Oct 2026 23:29:15 +0100
Subject: [PATCH v8 7/8] fuse: Add retry attempts for numa local queues for
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
Message-Id: <20261025-reduced-nr-ring-queues_3-v8-7-8a2570e8d2a4@bsbernd.com>
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
In-Reply-To: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2856; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=adBEJ1BmwJtbJvMferBwXqU975gjTI5Gx8GJUfvKlOo=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLLuNR2o6HGr3/ojcsZRaTbu31p9eW3aDrYRi972txzb8
 faOluGLjlIWBjEOBlkxRZYuiT22U/7xyap9XX8dZg4rE8gQBi5OAZiIz22GvxISyp7rNr53XGAR
 7puzM521I3ACxwQ770JmzZdX3p341cDI8CxmZuz8vjVXLwpu/saqZ3N+tuGmZmb2zczcie92qa/
 w4QQA
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


