Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792787336;
	b=D57xZdynRnkFpnVst2QL32hskHBbSR5Q3fpjmRjNoXjaLbCkkIPqitpU8RRYqYMawnUG
	 pqsoYdb2xOnudGzcMaaJRQkcMgtVWaJe0kZLGUYC1ZTv5HmEo+1owrWSOQY6eWx0VU50O
	 jAuGEmpHpWQ/I8J0wwMLj//NCc0E7ZkwdXvNCkwEs5AkG2S3vGV2k0epoLZtI/ocChZ3/
	 Bf04wJN/kQ31oWtQCbAEcX7FSO7JDenrVX/sYFWfV7CAF/299dP/cCazDSal0vye1ZHRh
	 JfWUWfaIpY7rUQNbMkTox4HTdDUa1SO5n2bWqiJluZ8oTBuWyeBGb19E5swJ2ueN+fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787336;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l1HVtPlEC/RbPtIFHaPAftS/uPqpaSW1SlpP88CuvIQ=;
	b=AZF96+j/wcvUME3pZ2qE4dsNb2xMC1f/al5r1L2hv9owR1W9WguokPhx++lc4l1kqpmK
	 Ye6nxzynhJuV+nYd3ClD1iHd5LHvkzcRHMNUFIoTteGf/bOWW5dOluh8bXtwfJNlhbKSU
	 SvJprKp6FTFRthoNzYev8t/iqyUMDIfynTFc2sjv38ylJ+z0/u59AJIxOjpW61Dc1cDrk
	 tu4DQvVc6ogBVHvCZSYjZpb1cMU6HljBSvvHegQsB+AbswZMLWJ0zowUhUFYVzdb2wGQO
	 j/bzQlWuaqTgyF4ktugpOWDIEmSdQ9jnqRSxKBqIBiCwNyHPRbhUx0O+2jAtPfL21fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AudDahz0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CD1606A323
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 20:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AudDahz0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792787335;
	b=EDtBYMttaQQ8bEiPRfXMFQ//HtN50C3oAk7l8fb9gDghVE8WaI4g2mOs6g8hi9WFPD+k
	 /P985+dbbsSa9Yp4PlFMYuXbKwf5XEx4ndjtqAg4khp3q4iduDS6nFVafsPXDx2H9RXOR
	 3oDy/gAELCPcSbF6iH2tuROqD37YlIy4l227sj9XwCCBUAWM5owRjL5zw9JjZ1sW0xfDK
	 zBfg8RCjENErpEHBR7xl0qO7KOJgpxakMjhNTBIYzFNzTpn8Cci9exX7Zq0y6/D/2VvRE
	 bfiudX5HnkSmBmXHHyf3TRD/3OU4xIqUxqD7fGyhrR8WAHUm0Xa1PCw+jsoEj8AjKPA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787335;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l1HVtPlEC/RbPtIFHaPAftS/uPqpaSW1SlpP88CuvIQ=;
	b=IDMfVuvSO0pQgAzVeS15AKftSE4HYQWKM2CtjaozhVSi2Sb5vBvFUFobriP/XLLm/eNU
	 P393XxzieidHNCsoEEQThN9fdGpR14INnhLKtewHJSnbrboVAJCA6lAN6KEbvrSAU6Dc+
	 +4J6C1EGF9JNoeiVPvaKhumyo/iLJhJCQhngBgv7o2c6jUw1d6MDvpot5Pkf6wJqsxlIX
	 rP6iVSEkYzqK71fY60z2vS2RwuY49Vh5Vx8+5sAbGg0NYtqGOTBHQn4siYYXIqA1iyW1v
	 stnbGdcsJwR3WJu9NbZa5hXgS7IgHi8IEJxXgvG2nExlZtJxvVYlOz8o1b8fsteOqsA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31FB11F031E1;
	Fri, 23 Oct 2026 20:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792787335;
	bh=l1HVtPlEC/RbPtIFHaPAftS/uPqpaSW1SlpP88CuvIQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AudDahz0xWgzK8Riwzlks7YB5JfesVdXy37KV4GeFN5a+mYZYM0p42Yow1Nzy4m36
	 oQY9A1MTIXGO7GO2iCsm1p4nx+QFZMSE3S760/XF8+oyw4HKMXUJajujYksvCUclnU
	 MWu+yN+elSL4tMA+/PshOcq7aUJqIRMt3761wbzNjCwNMb6g6zXAYn5ccevikQiHqk
	 bcnGd7N1/R6kCd4dn1AcPNH/c/iUyZrsA+Byd9+15dreIfY4AURiTE1Eyt2Mk5aKFf
	 7Asgnd94dwx1818M+wiN0vpHWan7RWpZa23LMn7UV4PE3/ib38A7mZYNeh3ZOc49jg
	 EkJ+Ye2xi7dsg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A6C4744606;
	Fri, 23 Oct 2026 20:28:52 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 23 Oct 2026 22:28:44 +0200
Subject: [PATCH v6 2/8] fuse: {io-uring} Rename ring->nr_queues to
 max_nr_queues
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
Message-Id: <20261023-reduced-nr-ring-queues_3-v6-2-658235c9b9bd@bsbernd.com>
References: <20261023-reduced-nr-ring-queues_3-v6-0-658235c9b9bd@bsbernd.com>
In-Reply-To: <20261023-reduced-nr-ring-queues_3-v6-0-658235c9b9bd@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=4621; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=zahWFXAlAGLUS/1774IaoMuoQhlkxGF5zpMuxg/js4Y=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJuH27Yc3y6sNmpzB8cM0pe6MsyJ53eP4uf30E4wG2d1
 LlLnb5+HaUsDGIcDLJiiixdEntsp/zjk1X7uv46zBxWJpAhDFycAjCR+DZGhn/JvLN4DwjNl9xd
 qDuT96l/go7Jqqj2RwcVf2TnZtbKTWL4w9GUkyVz4Upq2r9DgdU963IS40QuhOm/tDXR1Ur2mBP
 JBwA=
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com
Content-Transfer-Encoding: 7bit

From: Bernd Schubert <bernd@bsbernd.com>

This is preparation for follow up commits that allow to run with a
reduced number of queues.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c   | 26 +++++++++++++-------------
 fs/fuse/dev_uring_i.h |  2 +-
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 1aca6ce906f0..c9a78c2bee99 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -201,7 +201,7 @@ void fuse_uring_abort_end_requests(struct fuse_ring *ring)
 	struct fuse_ring_queue *queue;
 	struct fuse_chan *fch = ring->chan;
 
-	for (qid = 0; qid < ring->nr_queues; qid++) {
+	for (qid = 0; qid < ring->max_nr_queues; qid++) {
 		queue = READ_ONCE(ring->queues[qid]);
 		if (!queue)
 			continue;
@@ -241,7 +241,7 @@ bool fuse_uring_request_expired(struct fuse_chan *fch)
 	if (!ring)
 		return false;
 
-	for (qid = 0; qid < ring->nr_queues; qid++) {
+	for (qid = 0; qid < ring->max_nr_queues; qid++) {
 		queue = READ_ONCE(ring->queues[qid]);
 		if (!queue)
 			continue;
@@ -268,7 +268,7 @@ void fuse_uring_destruct(struct fuse_chan *fch)
 	if (!ring)
 		return;
 
-	for (qid = 0; qid < ring->nr_queues; qid++) {
+	for (qid = 0; qid < ring->max_nr_queues; qid++) {
 		struct fuse_ring_queue *queue = READ_ONCE(ring->queues[qid]);
 		struct fuse_ring_ent *ent, *next;
 
@@ -326,7 +326,7 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
 
 	init_waitqueue_head(&ring->stop_waitq);
 
-	ring->nr_queues = nr_queues;
+	ring->max_nr_queues = nr_queues;
 	ring->chan = fch;
 	ring->max_payload_sz = max_payload_size;
 	smp_store_release(&fch->ring, ring);
@@ -485,7 +485,7 @@ static void fuse_uring_teardown_all_queues(struct fuse_ring *ring)
 {
 	int qid;
 
-	for (qid = 0; qid < ring->nr_queues; qid++) {
+	for (qid = 0; qid < ring->max_nr_queues; qid++) {
 		struct fuse_ring_queue *queue = READ_ONCE(ring->queues[qid]);
 
 		if (!queue)
@@ -503,7 +503,7 @@ static void fuse_uring_log_ent_state(struct fuse_ring *ring)
 	int qid;
 	struct fuse_ring_ent *ent;
 
-	for (qid = 0; qid < ring->nr_queues; qid++) {
+	for (qid = 0; qid < ring->max_nr_queues; qid++) {
 		struct fuse_ring_queue *queue = READ_ONCE(ring->queues[qid]);
 
 		if (!queue)
@@ -1256,7 +1256,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	if (!ring)
 		return err;
 
-	if (qid >= ring->nr_queues)
+	if (qid >= ring->max_nr_queues)
 		return -EINVAL;
 
 	queue = READ_ONCE(ring->queues[qid]);
@@ -1339,7 +1339,7 @@ static bool is_ring_ready(struct fuse_ring *ring, int current_qid)
 	struct fuse_ring_queue *queue;
 	bool ready = true;
 
-	for (qid = 0; qid < ring->nr_queues && ready; qid++) {
+	for (qid = 0; qid < ring->max_nr_queues && ready; qid++) {
 		if (current_qid == qid)
 			continue;
 
@@ -1517,7 +1517,7 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 	if (!ring)
 		return -EINVAL;
 
-	if (qid >= ring->nr_queues) {
+	if (qid >= ring->max_nr_queues) {
 		pr_info_ratelimited("fuse: Invalid ring qid %u\n", qid);
 		return -EINVAL;
 	}
@@ -1554,7 +1554,7 @@ static int fuse_uring_add_queue(struct io_uring_cmd *cmd, struct fuse_chan *fch)
 	if (!ring)
 		return -EINVAL;
 
-	if (qid >= ring->nr_queues) {
+	if (qid >= ring->max_nr_queues) {
 		pr_info_ratelimited("fuse: Invalid ring qid %u\n", qid);
 		return -EINVAL;
 	}
@@ -1588,7 +1588,7 @@ static int fuse_uring_add_bufpool(struct io_uring_cmd *cmd,
 	size_t pool_size, buf_size;
 	bool registered = cmd->flags & IORING_URING_CMD_FIXED;
 
-	if (!ring || qid >= ring->nr_queues || flags)
+	if (!ring || qid >= ring->max_nr_queues || flags)
 		return -EINVAL;
 
 	/* reserved for future use, must be zero */
@@ -1781,9 +1781,9 @@ static struct fuse_ring_queue *fuse_uring_task_to_queue(struct fuse_ring *ring)
 
 	qid = task_cpu(current);
 
-	if (WARN_ONCE(qid >= ring->nr_queues,
+	if (WARN_ONCE(qid >= ring->max_nr_queues,
 		      "Core number (%u) exceeds nr queues (%zu)\n", qid,
-		      ring->nr_queues))
+		      ring->max_nr_queues))
 		qid = 0;
 
 	queue = READ_ONCE(ring->queues[qid]);
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index 77f87075f62d..10e3936814cc 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -162,7 +162,7 @@ struct fuse_ring {
 	struct fuse_chan *chan;
 
 	/* number of ring queues */
-	size_t nr_queues;
+	size_t max_nr_queues;
 
 	/* maximum payload/arg size */
 	size_t max_payload_sz;

-- 
2.55.0


