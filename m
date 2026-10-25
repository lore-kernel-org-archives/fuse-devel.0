Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792967365;
	b=VI8lNht1knUjcFXC2dKvWKYX4aAc4WgcxoVS1zGoBRxbju9bhmav20DOtmTJF1CEc5Xb
	 flgcJWnVF78qbIwNkzlzFNdY07yl755s2msa88XMe/BFzCT9us1I8F1R+t5y6H1d5pcpA
	 XFGWKuq7ASB7k40Hmoa/yp+kphaFRs13flvACMy2YZMDeXX0hTiqD4sB5U48qH6F0yenY
	 Zf6nrSVxv9YKYgK5wcZxR0Wkc+ev0At0X1QnPjmRDURvHxFTHTm63Py9F63D+BKoVpAyG
	 xeLfJq5wkpQiUAliPsEQSOLJov0YZFmfMSKVIZb26I4rst3UATdXWI0AXuwJPAt/6/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792967365;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l1HVtPlEC/RbPtIFHaPAftS/uPqpaSW1SlpP88CuvIQ=;
	b=bARAvyhOzdA1hZPU54DG/w3aAz00C1e8rKnNo/7MT7HLRHQ+QjbSE8nu857/vsOuFkuz
	 ZXL3Hez4OlYXmYP+1Mj5ZPF8+vvykdMfQNtMOQIjnA0JcIGIIQIQq9ZlT1sY97+WJyTgm
	 IfHfxWicINQ6Ur3uZ3DQsapO6Zsqg8lJP5kg3b4c2BDu1Qf4kgjcWJDJFYh6DngpIYG6L
	 JnQw+85AAvri/Bvf+h6AoGZWP4+V/ZdHARt1rkuaRgOPX03w7qFPzH1e1ON64W8AHOOBg
	 NDr0soPcIf2K7Q42vxXVJ8idojq8kU5u44xRO7MIKfI/aREyzITw6OAHNYTyFMh9AEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUGkJBfM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AF4606A31D
	for <fuse-devel@lists.linux.dev>; Sun, 25 Oct 2026 22:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUGkJBfM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792967364;
	b=urjigljy5veqSX+fnou3tSidQyUNxe5NYp0hsCCsF9VkpvtIDpp7Hmlbb4ZO2I3JHyuc
	 LsBuW3DuUi3cwesKepz/poYAEgFpbyyM/VT8NyOqhRhid52cfBt8LUGszSgWSJR/LQONG
	 cOh8q22gFjkLNmf54bW22hnqb0cL20Rm7JxDdJwt09BFTD9dVA04GNDj4DoAUST1ywNa9
	 uvYfYGz/qb4a+o04kkQ5Yns5jOl29t3jDT3GKw7uUhOkBLvgKG3i/UT3uQHiheHy9JGWV
	 ET1AamhSG7g53XBfnMfUA+vI49mcmk8ne61wGIxTzEcswhPsMEeqzbCXA7g8CcgIGsQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792967364;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l1HVtPlEC/RbPtIFHaPAftS/uPqpaSW1SlpP88CuvIQ=;
	b=XevLutKpvflSx2YhpdVVqD681INwSC88HEl6UFuvbEGMEJj22E0D3MoGS3pMDJcUyBFz
	 y+XyUOm3UCHY/sjxdYnIz78lPYyhXxL6pa6hGARmbRWD8uUhYGn6gXGq8KxoRfdA0rkeJ
	 q+2nZrSv3CtcRww74PQIGb0qvMWfhYLNZs8P8NSUvZ9+7gs65LvriTcMf0dfY2J+/cPqT
	 eOxXm4fqNwAIMEI/+Kq4ZWGddBFb3ONSMj6agDEk9mhFTRRJqnyGdPGmQnTTN2IVvBwZ0
	 O+Pe8xjqwZ4ReRiDeC6j733Y0xc0iWKCiMQv9Zj33EylHgZKBlopuzmPVB2RFoLccew==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA8621F01829;
	Sun, 25 Oct 2026 22:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792967364;
	bh=l1HVtPlEC/RbPtIFHaPAftS/uPqpaSW1SlpP88CuvIQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jUGkJBfMwqPJExMgqq3sTf2C3gAIJSPOKStSk6uLMTafVcbi25wj5posWNH1zFj7j
	 MlHd8/NBRaFbPGO8kKaY8k9b843tgqEKss7ufGEJ5Q2cazU8zf8I67G503qN6UzDYw
	 KXpfehf1TN9VIdTcW9NUxDo5mBW4fwI3TM1jzaufAR1yMYp3ZnPA3GnK7KWa4BMp/P
	 OufQ5oSLzqyLKS93JJdm7MpL2y/B40WbO+R78Qha1wb9q5n1VCXVkYaWqqomYKkJSO
	 cjcVTBAdkxvRkvFlpELHYoipaq+iJOQRMZSZ7iiiWk4XfZXGPr/9zQbWvusLW5amem
	 a+7p5UQ2lASQg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 740A744AEA;
	Sun, 25 Oct 2026 22:29:22 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sun, 25 Oct 2026 23:29:10 +0100
Subject: [PATCH v8 2/8] fuse: {io-uring} Rename ring->nr_queues to
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
Message-Id: <20261025-reduced-nr-ring-queues_3-v8-2-8a2570e8d2a4@bsbernd.com>
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
In-Reply-To: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=4621; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=zahWFXAlAGLUS/1774IaoMuoQhlkxGF5zpMuxg/js4Y=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLLuNe3buklY99rjrbX2iy9NrvV51VixIf2QUfmN650Td
 QQvHuaZ3VHKwiDGwSArpsjSJbHHdso/Plm1r+uvw8xhZQIZwsDFKQAT0exlZPiss0jt5W5Zk2el
 22Terv0Zf/OLedWzIynH7tu5THq3gu8UI8OpJZ8FhfPc40r/a8YHJH6LVpdQ4AhweliwRNZUYyt
 TPx8A
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


