Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792795840;
	b=Kt/xu0cg6csnASH9egDnz7bb9H3IZxP+6fHHqmtNZSo+5u1yUBD3DscXKlLzXLAQNQRg
	 xbFZEn1QYiOjbSzMWkIewrmf/qyOxTUWHwmKL2rfSwNTIS9vjXGVsL7ha2qa7+zs5lOf8
	 Jn5968knijv5VuTeAOv8+eDgtadeXWAJJzWSdnCg6WzKCrjwtiZw4POVRnyQWDzL8Gr10
	 rmWaZgnhebQoWO5PQJusAGf/rW4NG77JI2c/prIAxdP5FHjETJJudtdf9V3fCb+vwEM1N
	 FHSGajskHzSW0PV2FveIQ12KePBaKATzVAyc80UbztxrkEoekPeM90hSqOH6nfh/ZPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795840;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l1HVtPlEC/RbPtIFHaPAftS/uPqpaSW1SlpP88CuvIQ=;
	b=KzSPuUvUJPGfhl/EyVrGY5gTpylC16ufNUxIbSNsqdL0Mm0oOOStZMMMkqT+2An1HZzX
	 NrTX1vQfHoYOZSh6RRukvvUGz//oDXIIqVkOyNwRKb7uGJzrWy446rxG5n+25qKCf4v8G
	 sgx8OvNrnvVxJE4JyTj1CVwp3mQnrEgEGdEmpSI57u+bAAaQm0gwoQkPFpSG2mHPLyQ6Z
	 aQ+yEPlYsi6Wi7tQyE5WMO+J32Hp7Qe5RMDqqKAoJCbxCOpMJCI+mQX5SzIrQf4uxZ+zp
	 aKO87v/BVColTv9Wfo4PnLDU1fIiL4wIddFQ8E4V3q3rmkYO+WGjTDMfujLPhANuCHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T7oXf5WU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A90B606A31B
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 22:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T7oXf5WU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792795840;
	b=N+QmYaLnO0IWTBg6rtLnogyyybbLdVXvqXWOrRftz97j5gTdp5DgtePfRRktjv9PQ3/M
	 iHpEXYB7OFGN76osEGYtGps1UBoioNlU+6+/b9fVc4ROBPgxU5S9i4tB4yBXOfM6ZM+vu
	 tedagkfr86xmYVk7BrOrXzsJKmVK9Y/RPx12anN6vzJNqYVxer0geIukTtzIqNfiAC56J
	 Pc9nuIOI+NtE3pp1tHp0FY3E2vN2Yu9nOr7vQ368jgan0CCovflvyt9AyzKGLtZj7SVVU
	 O6+pRZ4zT9coSkh6WEBn+nGuPMhRHX17u4d94aTPfGFJLiZaRC7KhMwFeIT1jy/R05w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792795840;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l1HVtPlEC/RbPtIFHaPAftS/uPqpaSW1SlpP88CuvIQ=;
	b=q3i/pffNgdJaVZrNN4ZYmHrobY9QCPYGkuzd2z/jNzSS+CpNPmfWluuEXLrO1us74AXv
	 F6lLIE5uSx9YtrxW6EicvAWqARg6veYiWOHFYdFjpBGG8li5/oU3PU7CrJlqdC7fiqtCQ
	 QEPpryCBXSeplOPou/xiFeLdTaV+UALGysH3uUKfi06mWFtd7oqLVE8I96P6ixDvf2XSC
	 gl8Unus0twd30HEqNfrLRQNP9aQlqsFY2lfPsS6JWNMiCFlHnS7nxj4tDOTi542nGC+YP
	 iYFXdxu4uEVJ/rALf8eRcHjiAmJuweIx0AqQPXuZ7j7W5ZyNxc/AQhzmCkfm2J48Suw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D90D1F01829;
	Fri, 23 Oct 2026 22:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792795840;
	bh=l1HVtPlEC/RbPtIFHaPAftS/uPqpaSW1SlpP88CuvIQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=T7oXf5WUSf/Z3Wwni2PkVRJke05e/vyIrwPAXXUxI1N51QcHgIvEqOUwK0M04Goa+
	 SbA7EIItW369Tl9wPlJ21ABrauDN739kj6TKoDD87ijEWD1rx4KL/U1VzAWpqvVEWd
	 Hk0kDfsLhyuLYrEwAmAXJEPNkfvGo8jGhdBcPGmcXp9scno54uv3RnsUSfl+4dOApe
	 E5uYpsb08kwpYZcPHPhHekThxmx+IV/FBHNLJsY5dsI4uk8CM9Mf5olhG4enkaD/bj
	 0kZ68Ti+g4PAfnNHVOa0pDrPzMajrgzLATJ0GyZpMgNoyzsfBGET4816ZmRzM28+XL
	 CROABspThAKJQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F042A44671;
	Fri, 23 Oct 2026 22:50:38 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sat, 24 Oct 2026 00:50:31 +0200
Subject: [PATCH v7 2/8] fuse: {io-uring} Rename ring->nr_queues to
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
Message-Id: <20261024-reduced-nr-ring-queues_3-v7-2-4e77e284fd48@bsbernd.com>
References: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
In-Reply-To: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=4621; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=zahWFXAlAGLUS/1774IaoMuoQhlkxGF5zpMuxg/js4Y=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJuP9n9bqdUTYp475Hbz8+rviuw2Bsw9e2e19mLqxdxy
 Z95GPVxTkcpC4MYB4OsmCJLl8Qe2yn/+GTVvq6/DjOHlQlkCAMXpwBM5OI3hr+yN0tluOvbcx8p
 tukv3rXG7eN9a9/QWZrHi76n6ydIhj5jZFj0aelrntaM5lecxemCuwNSztZk3Nwf7LixuPBHUHz
 PO1YA
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


