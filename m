Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD25A37AA92
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780952630; cv=none; b=OyS9IPW630AD038g+C5Hho3/XOZuaqsuYPdHwC9CmyUENZ3zNltdOWAmpoEEj/VtrIsgA31Ax3EkuP1mhH6IgtDdBmVl2Hz4jqNGBJ8QZcKV/TnaTaUB/8a5oDxcrZTiRbekILe5H0aTP+aEK9Cy7id/Ci8SafJXGecGnghQmr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780952630; c=relaxed/simple;
	bh=EVG9Y2ztgF29+WqC/W99z/8PcnzEVyXS2zmPXy+U0Gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSRqfMV/2DtJCukPtduI34g3TT+elDGeVbOY597y2e6j3OaafrHk64sriRlNSquXAY3t5AQS4GsLKfOaZ0WyvZKM0pyh8XPY7jUv0MBaP1eRkrmvedbG1jTz6yNcBwqDaLHOYlfgzCKrCJ1DpKaFqcVHGjs3X418XsQ6PDlejO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTG1bi21; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTG1bi21"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1424C4AF0E;
	Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780952630;
	bh=EVG9Y2ztgF29+WqC/W99z/8PcnzEVyXS2zmPXy+U0Gc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cTG1bi21M/ICVWosPZXC7NJb5FKSH+d4YeMKSqx9zpJVcJq3wkp4cQM/41oD98OUA
	 Yl7BD56nFfC3F0efKCUQ2A8vsg4xKYsRBSI3/5KBeH4+DEtWlEubMrcRsFXJGHhp+O
	 E0SIfXMmbU6/7irRu2BOPxYEdjUk86HavW+bjZ8JZ4FTNTta42AvO/PllmYQshc2cw
	 px/J1TfYHrZLZPJD/e9sflp0vJikn53a2RRfOPqe4Z5YerLiVjIMBS76r/Dy2GhOLy
	 ZeCJe95wN/qdEk9BIpHtF5irb2czXfdbzVxYU5sFZhA1O5/+GKuPq8Jn1WK45N3YhE
	 L2eejUatk527A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7AACD8CA7;
	Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 08 Jun 2026 23:03:45 +0200
Subject: [PATCH v4 3/4] fuse: {io-uring} Make a fuse_req on SQE commit only
 findable after memcpy
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-fuse-io-uring-race-fixes-v4-3-fa410089a0a1@bsbernd.com>
References: <20260608-fuse-io-uring-race-fixes-v4-0-fa410089a0a1@bsbernd.com>
In-Reply-To: <20260608-fuse-io-uring-race-fixes-v4-0-fa410089a0a1@bsbernd.com>
To: fuse-devel@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>, 
 Luis Henriques <luis@igalia.com>, Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, 
 Zhenghang Xiao <kipreyyy@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
 xlabai <xlabai@tencent.com>, stable@kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=3598; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=sEv2WObwImx0VU6pliUGngld5zRiveYGe0DVPssP8Ok=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLLU9Uz6vzxeFMzFITRDVGXnVieOjHXXFvb+uxgpETPpf
 8mmFSIBHaUsDGIcDLJiiixdEntsp/zjk1X7uv46zBxWJpAhDFycAjCR98kM/wuVuGpWHHvUkSL5
 WP7LE44IBVkZRcldVveldu97saus5wXDX6lj4WuuCGge6P2cfijx8uXIC2daI7Xarv7nj53lG37
 PkwUA
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
index c31240967932..812675a4c273 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -710,6 +710,19 @@ static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
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
@@ -732,6 +745,7 @@ static int fuse_uring_send_next_to_ring(struct fuse_ring_ent *ent,
 	ent->cmd = NULL;
 	ent->state = FRRS_USERSPACE;
 	list_move_tail(&ent->list, &queue->ent_in_userspace);
+	fuse_uring_add_to_pq(ent);
 	spin_unlock(&queue->lock);
 
 	io_uring_cmd_done(cmd, 0, issue_flags);
@@ -749,19 +763,6 @@ static void fuse_uring_ent_avail(struct fuse_ring_ent *ent,
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
@@ -779,10 +780,13 @@ static void fuse_uring_add_req_to_ring_ent(struct fuse_ring_ent *ent,
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
@@ -1205,6 +1209,7 @@ static void fuse_uring_send(struct fuse_ring_ent *ent, struct io_uring_cmd *cmd,
 	ent->state = FRRS_USERSPACE;
 	list_move_tail(&ent->list, &queue->ent_in_userspace);
 	ent->cmd = NULL;
+	fuse_uring_add_to_pq(ent);
 	spin_unlock(&queue->lock);
 
 	io_uring_cmd_done(cmd, ret, issue_flags);

-- 
2.53.0


