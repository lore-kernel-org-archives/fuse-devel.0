Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1883B3B71CD
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 22:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697602; cv=none; b=ezNga+EXNFzKg/Y45srQsJ1EPEp8Beexg3L8/5M4mzHcELMROMJ5bkUi7s7RWSIkQBM43c3vFU9BjzyuecVdQ9aFsf9MhKGAh0ZwgggzQRAPZue6gEatlHGNhzJ8UU82f3pzF/fJajk0XOeRuwMmeEW1t1yHp0+VOrEs43qyd/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697602; c=relaxed/simple;
	bh=vGwED/AHTx5k8yPVPCGsewXJ8DE0D66o9WvQbJ7+zFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RTvvi0gN71J/SlYvQvLTfEYUgl03tW+tDR7nX+KyIWk4I1n7ldHmYEqI/pXo7BxfbU+xm6VCXKUFZnW1n+6ugeCosjMypldJg3mKlmrHGIkD4VL4OsYHK2iJLaSzGonXYKDECf80kOT+Auei9YRiU267URKRTP5uNH4RAUOfReA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CV+FLr4e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CV+FLr4e"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC22FC2BCC6;
	Fri,  5 Jun 2026 22:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780697601;
	bh=vGwED/AHTx5k8yPVPCGsewXJ8DE0D66o9WvQbJ7+zFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CV+FLr4eBaixo5ijp20usLBRnEKW60/pvpmVUGiq5Rh8KzgQtvMMWP5LcVUuoSTRV
	 vP0r1oMwnH3MGGQ/tv+eIqMVbu0xZDu6FxQSnRF7GDHVS60zZeaHeO+BjUEUBmogLD
	 rjt+xi0SDxG/Lib36K8skzuLZG4hrwfjgEBgR3X1XWL6HGGGcrB7jV1t+6npYF5n22
	 Zv4TaeMaZk5TjxM6/c3WyP1LC3heul9fwhU9ZXjuJuqpG/dkWd3tvr0NSMnQpoEOsD
	 tpdfvowk+PMcV58LtC/cCi8iOR1v7wJ6FIt/CASVMNHMQFKdI0gx0AIf9tXNTXLoNQ
	 RvrI0yqJo/d3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1081CD8C85;
	Fri,  5 Jun 2026 22:13:21 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sat, 06 Jun 2026 00:13:08 +0200
Subject: [PATCH RESEND v3 3/4] fuse: {io-uring} Make a fuse_req on SQE
 commit only findable after memcpy
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-fuse-io-uring-race-fixes-v3-3-6fdf5e5b3437@bsbernd.com>
References: <20260606-fuse-io-uring-race-fixes-v3-0-6fdf5e5b3437@bsbernd.com>
In-Reply-To: <20260606-fuse-io-uring-race-fixes-v3-0-6fdf5e5b3437@bsbernd.com>
To: Pavel Begunkov <asml.silence@gmail.com>, 
 Luis Henriques <luis@igalia.com>, Joanne Koong <joannelkoong@gmail.com>, 
 fuse-devel@lists.linux.dev
Cc: Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, 
 Zhenghang Xiao <kipreyyy@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
 xlabai <xlabai@tencent.com>, stable@kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=3598; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=0J2ELZj79o2Eiq/7V7sCD7bhhOLiecCA9UCTX0goXjU=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLKUPf8rHnvyyNkiL5Wt7T3/ZsugPQmn1UvP3t1ln+LNb
 73xlGBwRykLgxgHg6yYIkuXxB7bKf/4ZNW+rr8OM4eVCWQIAxenAExk1VeG/27V16sTyx9vKOZe
 M8VOdo7vJtZdLD/NVbgr//4Vfve55CDDP23X2cEPlr5cYcv3mHfWPNXl0+KnLT0Ye1bGdOvCBRs
 mJrADAA==
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

Bad userspace might try to trick us and send commit SQEs request
unique / commit-id of requests that are not even send to
fuse-server (io_uring_cmd_done() not called) yet.

fuse_uring_commit_fetch() ends the fuse request when the ring entry
has a wrong state, but that could have caused a use-after-free
with the memcpy operations in fuse_uring_send_in_task().
In order to avoid such races the call of fuse_uring_add_to_pq()
is moved after the copy operations and just before completing
the io-uring request - malicious userspace cannot find the request
anymore until all prepration work in fuse-client/kernel is completed.

This also moves fuse_uring_add_to_pq() a bit up in the code to
avoid a forward declaration. Also not with a preparation commit,
to make it easier to back port to older kernels.

Reported-by: xlabai <xlabai@tencent.com>
Reported-by: Berkant Koc <me@berkoc.com>
Fixes: c090c8abae4b6b ("fuse: Add io-uring sqe commit and fetch support")
Cc: stable@kernel.org # 6.14
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 fs/fuse/dev_uring.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index c24a0b5b5357..5dde86e8653b 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -714,6 +714,19 @@ static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
 	return err;
 }
 
+/* Used to find the request on SQE commit */
+static void fuse_uring_add_to_pq(struct fuse_ring_ent *ent)
+{
+	struct fuse_ring_queue *queue = ent->queue;
+	struct fuse_pqueue *fpq = &queue->fpq;
+	unsigned int hash;
+	struct fuse_req *req = ent->fuse_req;
+
+	req->ring_entry = ent;
+	hash = fuse_req_hash(req->in.h.unique);
+	list_move_tail(&req->list, &fpq->processing[hash]);
+}
+
 /*
  * Write data to the ring buffer and send the request to userspace,
  * userspace will read it
@@ -736,6 +749,7 @@ static int fuse_uring_send_next_to_ring(struct fuse_ring_ent *ent,
 	ent->cmd = NULL;
 	ent->state = FRRS_USERSPACE;
 	list_move_tail(&ent->list, &queue->ent_in_userspace);
+	fuse_uring_add_to_pq(ent);
 	spin_unlock(&queue->lock);
 
 	io_uring_cmd_done(cmd, 0, issue_flags);
@@ -753,19 +767,6 @@ static void fuse_uring_ent_avail(struct fuse_ring_ent *ent,
 	ent->state = FRRS_AVAILABLE;
 }
 
-/* Used to find the request on SQE commit */
-static void fuse_uring_add_to_pq(struct fuse_ring_ent *ent,
-				 struct fuse_req *req)
-{
-	struct fuse_ring_queue *queue = ent->queue;
-	struct fuse_pqueue *fpq = &queue->fpq;
-	unsigned int hash;
-
-	req->ring_entry = ent;
-	hash = fuse_req_hash(req->in.h.unique);
-	list_move_tail(&req->list, &fpq->processing[hash]);
-}
-
 /*
  * Assign a fuse queue entry to the given entry
  */
@@ -783,10 +784,13 @@ static void fuse_uring_add_req_to_ring_ent(struct fuse_ring_ent *ent,
 	}
 
 	clear_bit(FR_PENDING, &req->flags);
+
+	/* Until fuse_uring_add_to_pq() the req is not attached to any list */
+	list_del_init(&req->list);
+
 	ent->fuse_req = req;
 	ent->state = FRRS_FUSE_REQ;
 	list_move_tail(&ent->list, &queue->ent_w_req_queue);
-	fuse_uring_add_to_pq(ent, req);
 }
 
 /* Fetch the next fuse request if available */
@@ -1209,6 +1213,7 @@ static void fuse_uring_send(struct fuse_ring_ent *ent, struct io_uring_cmd *cmd,
 	ent->state = FRRS_USERSPACE;
 	list_move_tail(&ent->list, &queue->ent_in_userspace);
 	ent->cmd = NULL;
+	fuse_uring_add_to_pq(ent);
 	spin_unlock(&queue->lock);
 
 	io_uring_cmd_done(cmd, ret, issue_flags);

-- 
2.53.0


