Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792787335;
	b=qjsRXHD9VnKI7LCXSeYK0kXe3Q80mHC8k06kbbmeC/wiH7WsyYmw6x79bql522P8Kv5o
	 hZuDZ1VmxbOwAmioJRvVdO3dtUhPVZ85YJLtdP2K8kg8kCIIHPDqWfiOXzxwkJRYOqU07
	 +ZHPwOQj8wtQGuW9oodt27C5Wk+5dXYcJtWiwtm25TBm9vjFDXCDk03JWLDCFSe5m5qUx
	 lJIBaHHxJt999a6So4XsqLEHLeUuiz3zLinuD8zYpyI/fykStgZtlckbrVr90Mb016Vxd
	 oFIrUXNaR+i3dHQaN0ocI/8lPZELV2sTCr/iUjUS5KxFBHbRVO44asKQrwNTmLmwPPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787335;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fmhtnKxTGvvl5mLPMAb8+QUputfq1EK8p1NR0W7EUBk=;
	b=AlQxB6+I7TxJg7xyJGFU6myL0EI4nOxAoBKc1DK/19yshO6xetCQ9bLx4uzq864H7l7Q
	 mEIQCBfggaVRZ6o6Qtq2eHgrhQTFrnETCPFzqbAOelWJWzVIINaomz8BMxTzgZWqBq+1h
	 vIwh8ofhPQ5HNL/P4mg8juozK8ydjYe8JmEmfh6OWFwd2yH430K1qyDKTNOeXtlHQJt/E
	 vUNkkepnefUPUwFBtWhQK2WcC5u2RkPzj+c6/uRt8OdA0zh1WQAEcFtx/2xXxrTjxm9p0
	 OnWXV6EEK00cgyOL5L4XCrn+gabTw+mEA7v2oSnSqh2BjliZjmjy3ZVpDRSqoMmCATg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YpoR6s/e";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C641606A321
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 20:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YpoR6s/e
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792787335;
	b=JUzXMbsZLs+3unYy3aFYZIpqz6drAw692S9njWNM39i1I+wqpuYUzzIaUZbdBIn09qTP
	 ofEYE5TiLkxDrb8tY9L0kk9EAVsXxh/TDPZvC2V8mplKOLbBIDiW1LfUGlIyGs2Pc0iOd
	 IsmS9jJX1C3cptZybAopRNGO6bKoOWi1FRZFytv3g1ciTv7suX4ne9KvOLFxpWjTsxnHs
	 1fKcpAUnpy+QnkofBzA5esmfZltL2yw+OPeEG7LxGDWMMK/ONC0tib6qG6VEtfDdf40TQ
	 Pn2K3aFgJlpWca6I2ECg5V8JfcHdNc2YjpuQ5Ks/MJ7nblQgvasXC6/CCgrKQu1CnJg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787335;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fmhtnKxTGvvl5mLPMAb8+QUputfq1EK8p1NR0W7EUBk=;
	b=xEKVix42QShTQOFhmRmtSgmLZPg/0QO3uiweQCJ8sJT4AqJL/vXmlEiG+Ev9+NZ8Fuvx
	 WoiWu4jKKvj59zLP2LMvZkbSiZPp3GFE2g/aaQD36fTcNQiO7TfZ4x7Uud5q1SyKm/GA4
	 pxp1FgDYcZvmjjdvGOkPbqB6CqZ3tOpd3C5mdrOdTEmE/viE8KEwbTB7DNLB90LRdxaCq
	 t+bUdZStF5Nddj5DeZnaYlkfiDif9PAucD/WB6rkZXdpk6qH+nq9Pt3ioy+vwpBezeGfX
	 ZK43sr4YBjtQEEvzdemHdckp/dAvIoiYiCU0I2gqiBSvi6cW0JOlfmbfLb3JArqChkw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 535B41F031E4;
	Fri, 23 Oct 2026 20:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792787335;
	bh=fmhtnKxTGvvl5mLPMAb8+QUputfq1EK8p1NR0W7EUBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YpoR6s/eT1irmDtaFARsZSwSWNKnareuy3ZOxfCSiwWGCVtswfIZrlXLO9daCFUmJ
	 QSyBNCjbT3OLDqNlv2OM3zzFTHVDBKILQMvguvIm396wAqhLUOtyG3lu7oSomps9SH
	 S9Sl7lB2WYWgmlXiudaSWmgaH+iFbYyRWD4jMPtt8QESwwuCTrFhnA+jtMDYazqrlE
	 A9d23QTUB34hX4IPxtzK5rpaIRAtyYYK0ULNf5EBFWPfWkr/CXhUnYunHS3E7ipkZO
	 ejyvvxm5yt8KHhmhAi5kOskO5/7ou++61GVQKUTIpwlE+lIKhDBJKXVhv886BnmxG8
	 Tzxy1xVdJ/9zw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CA9A44461A;
	Fri, 23 Oct 2026 20:28:52 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 23 Oct 2026 22:28:49 +0200
Subject: [PATCH v6 7/8] fuse: Add retry attempts for numa local queues for
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
Message-Id: <20261023-reduced-nr-ring-queues_3-v6-7-658235c9b9bd@bsbernd.com>
References: <20261023-reduced-nr-ring-queues_3-v6-0-658235c9b9bd@bsbernd.com>
In-Reply-To: <20261023-reduced-nr-ring-queues_3-v6-0-658235c9b9bd@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2847; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=afKh8no6J8draXNBRGUiEHPXHePoWcIqpU8eOSHSuPY=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJuH24WunBoXabR9N33Mg1OL/q9z6r91zWrKKXP1iqBZ
 zheLM9S6ShlYRDjYJAVU2TpkthjO+Ufn6za1/XXYeawMoEMYeDiFICJ1KsyMlwwjWj9s0/uZcOD
 trkHEj4KB5bWKqlVOsVZ7Xh3/Ui6liAjw+z1J5ff3GAkcODy1JxrpxaemVG1+vt3t+tNEdtikj7
 EXmUEAA==
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
 fs/fuse/dev_uring.c | 42 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 87c8ea35d2c9..c4c0230d02fc 100644
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
@@ -1960,10 +1965,10 @@ static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring,
 {
 	struct fuse_queue_maps *maps;
 	struct fuse_queue_map *q_map;
-	struct fuse_ring_queue *queue = NULL;
+	struct fuse_ring_queue *queue = NULL, *primary_queue = NULL;
 	unsigned int cpu = task_cpu(current);
 	unsigned int qid;
-	int node;
+	int node, retries = 0;
 
 	cpu = cpu % ring->max_nr_queues;
 	node = fuse_uring_cpu_to_node(cpu);
@@ -1974,11 +1979,34 @@ static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring,
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


