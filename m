Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A048B379C33
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298409; cv=none; b=qQz6HFJrvKhJCLtUeH9/4TTV/V/ctl7FrKWtqIqE6bPlhxBntczmIAKCRa7qiOClTjuW2sIEo5mFKdkizwkpN/fTtzytBEc8sbaEp7IvKNpgfKy0wGIfMjFxcE81f3xeeGjXJ9TyjzqRNzjW1Pt6YsU00F07pa3a1y5sCPU06X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298409; c=relaxed/simple;
	bh=jmFzJg9jd75z83PoWvCIM/IpaJD1CmAX42oSlkBpOrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qWEw3ZZFPRFsV/SmTHHRUw9KCyGMO/ApHF14MvJwWiitjFhTBuHUyGqHaAhrRR9P+7YngAH1cQ9x/1B1KfLppC5lt3hFmM1JXmTB+NR7v9MtRM604llyRhbhG0lRCKXOCZOwZqtlCRCG26RjcLoNP10Kt9AF9pcUKUEhpMiGD6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FejXymwx; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FejXymwx"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36da8439078so1269701a91.2
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 14:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781298408; x=1781903208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOXuEIWP1H1YN+RO9zIoVBOVs3DXIx1IwLwB3Lmpezg=;
        b=FejXymwxboWxHbohnMVATqD+ilVRAOr9bzYU6BBbOoa8Gd2bLu6myyg1xT7hv9LBnX
         Q4uvlesFpLhzeR1Bjgx54YEdWGxQWE3wSJ4/dAsQBU1I2i8RsK+TkoPvzeD+afD/sSiy
         r793h8ljR6SsCKCNBPt6wqjxz65DeHFI38SOK0nT8RfC579UaWjIawyHmh27vPXtSkVB
         VKiKHFc1wWrj6+w0GqDSNXWPiSRF1qWu36ALMF7PIPf8AuCd8CrwaGjyATq9sZnysOzc
         sHOVWMUwnEgLoekqYhvawpAOpFwLqi+vObi1c33Sunt6SzOjVEwtKLjkf38QUPaMbV4D
         63MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781298408; x=1781903208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aOXuEIWP1H1YN+RO9zIoVBOVs3DXIx1IwLwB3Lmpezg=;
        b=PyZs0rUbkSKz3iiCLFMV/QQ0zgHSQYsRWSQCiGuVXSsetj0H6zCwCB0IT6jkjkVrih
         lwB1I992X2xXdmi2Fyo+mIR2vxsBzQqyZjwmQMpJKfFOieyoJ12gI76TgoJzWMtUg3d+
         KeQSu696J2d66di88li3cc3yrVFc+iHxlzv/Ou6WR1m6sK5uIJjb8GuLjZ83rX/j7Ag9
         FpMpIReAFeycDrs5bzgZTDOOKb7veI6tQtiQcIrBhWltXQzyXkfdLJbPEJl1vIoOe1sq
         iqUuNikH/eD1t1xHQj0/lhTi3MinjSIbdzoK2Qbf62bRbJcK6tiBxXAY5xpDF7GPH1If
         sCCw==
X-Gm-Message-State: AOJu0YyN8aiWpGCuW7lIhWN+F0H4Timn/kxkEltxJ7qnNc0yMVF31reQ
	onHnmSncFl8hxmK7lCEs+IQpFVtxIrS5A8km6mlMux/5O1+EOE0FEPiN
X-Gm-Gg: Acq92OFFmBbKWWiBmshKa5Rkm2P/Yq6evVXliEfwbaffgjgFWsPHuHWkFxFHk3yQZfq
	TxExYQhJUYe0MZhpi6NrKbPOugexEvZDHENmgMrfIGI0Xt+zkmSJAfCvn/k3w0ByjWY2iYh8dTa
	9Cco6fzdSQyXxFOwvDvpQV/ruYtJ+7MrcEufpQJK9BAfLlZtp0hXwHthY0sA5PJnX/AhCEO19QO
	17/a0zBGmd5h/240zlKcTUWZApKu3VW+YkLc5WWgTTyAHvrBAog/ZeacBi25m1F2DS3ge5gV8M4
	boo8FiTwD0lP3nPakBbIjwa0p2QNgsad7t1Zo5bBy+azDk0ifrWI/UdjbK+Jtnk1QtHcAR8wKNm
	5Qv9TsVHhj7TjOSXThlbaW8q4XhGGtNsfu8BQHzY7GvWQM8JhhslP+aPGref/BWgfehWQrhjiD6
	l6WcDkRiIqmtpWWzkiZP5OYd3SZpqIqABwqh9sZhVUgzMuQydMWFWpw5jqpgJg2ilE5I0En7y2P
	Q8+NIrvrJMe+g==
X-Received: by 2002:a17:90a:fc45:b0:377:36af:c996 with SMTP id 98e67ed59e1d1-37a040b3518mr4756438a91.21.1781298407733;
        Fri, 12 Jun 2026 14:06:47 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:56::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e754e02dsm1472282a91.1.2026.06.12.14.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 14:06:46 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	axboe@kernel.dk,
	jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	bernd@bsbernd.com,
	Bernd Schubert <bschubert@ddn.com>
Subject: [PATCH v4 01/10] fuse: separate next request fetching from sending logic
Date: Fri, 12 Jun 2026 14:05:04 -0700
Message-ID: <20260612210513.1516038-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260612210513.1516038-1-joannelkoong@gmail.com>
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the logic for fetching + sending off the next request.

This gets rid of fuse_uring_send_next_to_ring() which contained
duplicated logic from fuse_uring_send(). This decouples request fetching
from the send operation, which makes the control flow clearer and
reduces unnecessary parameter passing.

Reviewed-by: Bernd Schubert <bschubert@ddn.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 81 ++++++++++++++++-----------------------------
 1 file changed, 29 insertions(+), 52 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 87f5f9eba534..0b66fe3a5da0 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -741,35 +741,6 @@ static void fuse_uring_add_to_pq(struct fuse_ring_ent *ent)
 	list_move_tail(&req->list, &fpq->processing[hash]);
 }
 
-/*
- * Write data to the ring buffer and send the request to userspace,
- * userspace will read it
- * This is comparable with classical read(/dev/fuse)
- */
-static int fuse_uring_send_next_to_ring(struct fuse_ring_ent *ent,
-					struct fuse_req *req,
-					unsigned int issue_flags)
-{
-	struct fuse_ring_queue *queue = ent->queue;
-	int err;
-	struct io_uring_cmd *cmd;
-
-	err = fuse_uring_prepare_send(ent, req);
-	if (err)
-		return err;
-
-	spin_lock(&queue->lock);
-	cmd = ent->cmd;
-	ent->cmd = NULL;
-	ent->state = FRRS_USERSPACE;
-	list_move_tail(&ent->list, &queue->ent_in_userspace);
-	fuse_uring_add_to_pq(ent);
-	spin_unlock(&queue->lock);
-
-	io_uring_cmd_done(cmd, 0, issue_flags);
-	return 0;
-}
-
 /*
  * Make a ring entry available for fuse_req assignment
  */
@@ -852,11 +823,13 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 }
 
 /*
- * Get the next fuse req and send it
+ * Get the next fuse req.
+ *
+ * Returns true if the next fuse request has been assigned to the ent.
+ * Else, there is no next fuse request and this returns false.
  */
-static void fuse_uring_next_fuse_req(struct fuse_ring_ent *ent,
-				     struct fuse_ring_queue *queue,
-				     unsigned int issue_flags)
+static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
+					 struct fuse_ring_queue *queue)
 {
 	int err;
 	struct fuse_req *req;
@@ -868,10 +841,12 @@ static void fuse_uring_next_fuse_req(struct fuse_ring_ent *ent,
 	spin_unlock(&queue->lock);
 
 	if (req) {
-		err = fuse_uring_send_next_to_ring(ent, req, issue_flags);
+		err = fuse_uring_prepare_send(ent, req);
 		if (err)
 			goto retry;
 	}
+
+	return req != NULL;
 }
 
 static int fuse_ring_ent_set_commit(struct fuse_ring_ent *ent)
@@ -889,6 +864,21 @@ static int fuse_ring_ent_set_commit(struct fuse_ring_ent *ent)
 	return 0;
 }
 
+static void fuse_uring_send(struct fuse_ring_ent *ent, struct io_uring_cmd *cmd,
+			    ssize_t ret, unsigned int issue_flags)
+{
+	struct fuse_ring_queue *queue = ent->queue;
+
+	spin_lock(&queue->lock);
+	ent->state = FRRS_USERSPACE;
+	list_move_tail(&ent->list, &queue->ent_in_userspace);
+	ent->cmd = NULL;
+	fuse_uring_add_to_pq(ent);
+	spin_unlock(&queue->lock);
+
+	io_uring_cmd_done(cmd, ret, issue_flags);
+}
+
 /* FUSE_URING_CMD_COMMIT_AND_FETCH handler */
 static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 				   struct fuse_chan *fch)
@@ -966,7 +956,8 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	 * and fetching is done in one step vs legacy fuse, which has separated
 	 * read (fetch request) and write (commit result).
 	 */
-	fuse_uring_next_fuse_req(ent, queue, issue_flags);
+	if (fuse_uring_get_next_fuse_req(ent, queue))
+		fuse_uring_send(ent, cmd, 0, issue_flags);
 	return 0;
 }
 
@@ -1225,21 +1216,6 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
 	return -EIOCBQUEUED;
 }
 
-static void fuse_uring_send(struct fuse_ring_ent *ent, struct io_uring_cmd *cmd,
-			    ssize_t ret, unsigned int issue_flags)
-{
-	struct fuse_ring_queue *queue = ent->queue;
-
-	spin_lock(&queue->lock);
-	ent->state = FRRS_USERSPACE;
-	list_move_tail(&ent->list, &queue->ent_in_userspace);
-	ent->cmd = NULL;
-	fuse_uring_add_to_pq(ent);
-	spin_unlock(&queue->lock);
-
-	io_uring_cmd_done(cmd, ret, issue_flags);
-}
-
 /*
  * This prepares and sends the ring request in fuse-uring task context.
  * User buffers are not mapped yet - the application does not have permission
@@ -1256,8 +1232,9 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 	if (!tw.cancel) {
 		err = fuse_uring_prepare_send(ent, ent->fuse_req);
 		if (err) {
-			fuse_uring_next_fuse_req(ent, queue, issue_flags);
-			return;
+			if (!fuse_uring_get_next_fuse_req(ent, queue))
+				return;
+			err = 0;
 		}
 		fuse_uring_send(ent, cmd, err, issue_flags);
 	} else {
-- 
2.52.0

