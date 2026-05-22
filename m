Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E81383984
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 20:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779483551; cv=none; b=Y3NxtcFFI7wFwPrOXdyZj7FZagjMGw5Y0TO/7lXWvvJfIof4sVnmy0Xkp8MWVIJPtLDEMZxvcGA4mMMt9lxoSwxmLMjr8CKEDY/nhZDqrOhZDcHeRkqNSDc4iJG7x9MRDhJs1pZuPQeTVbYnfvKca6gLdq/p/j4rz50+1KrNhDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779483551; c=relaxed/simple;
	bh=63Oh/33yrJ5ntls61EbR6g/+Gkt+CMG6xY1vpDpt4mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfDA/1Mz8B+nIkqCZRWmh0XD3rBaRw4tn66BaYMU9+EW0ksb/qyobRZZzxhcvw0RN0GYalr+vc5WXVd07ZvrKtel9YCI2nppOZlLrbgQa+VrVliQArgwBk+iWy9/eApSLqTTCfi4dA2ML7/fXiGlAMMG7tr/dlJHfqsogH5Eplo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crDOOd8T; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crDOOd8T"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7d1bcb92072so29523557b3.1
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 13:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779483549; x=1780088349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSTt7BcBNxYJtpv76ziKQR8Oi+lgIMvPUENoVJhltJ0=;
        b=crDOOd8TVYRgDX/Cu/Dq97v52ThrTD0QnGor+vsFbAwbFgi1wEOm1/TaX/L2WcsZJ2
         pHIlgWuBwtWrmhgCy15Vk9j03Vuc67RH9mNFWp0RIHt9DTJ3Y82PNioFsVvWOV3a0++Y
         nRy+5CWJX7FZBpborejOpxn5GldgDntvPyasJsEWAoQSLn8nd38CxYsF4peuiuiWtLXb
         Q8zhOE/Q8CEB/CrMwE4wmUm4NzV5xcuI068xXHRH3GLgS01MfZjwa40VED+8WdB4e8ze
         /IGN2mH484XchnvnrFDmtHmbhquhH04/6UedVtn1YmgO19JxpbI0syXYiq3Jtfz78adk
         /kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779483549; x=1780088349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xSTt7BcBNxYJtpv76ziKQR8Oi+lgIMvPUENoVJhltJ0=;
        b=W1fq2iaeEzHdvDQ6gIvr9zzTPaww+Hf9o3jAb+g22zov8ZbOX5rsG9yOuArZT3T0NY
         Bhrca9Xi5mflyv8WJ6brIOzt3VnzzTxvDcfmfphWHtGW+B762HAguEBabnvZqkydFfHa
         ceku1SmgQxdkS+rXIpGNcP/4/s4b9DExIsSyLHymqIPSFK6GlP/ZUXo6ps6RaBr6Bc0B
         l3rivGpvgGAc0ag8IEGDyi3Kv2nlHQvbWh0pLrci5L3WQTg7t/bSOgYKt02fEmQoM5gy
         0AA0ftmF6E9uHdGXVcb+f4bU/riJYyS9F2L9zy/o/hin5nqbEJYx4QWw4FaPQTWziD8p
         teBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fm3rzU1kl3qRpU00JtCKmsEDtuPmxrFij1WxJv94MUC22/n9jQmy15KxKVvF5SzYnlrzxwJvP7s8+@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ7JIjNZu5kQPijAmg8LduVUERlgcB/MAVWWLRQ0ZyKhr5zYyj
	vEX1sSv/5c81qOzzJpMMCwXBHJmHQJGtpL2B/UPcnehPk1e/BjEQQuJ9NhzXnw==
X-Gm-Gg: Acq92OFSTbYsZ6+n0UqWqOB95XpQGw1q+CCE7IX+I6+mi80Rxfnruey1MIUxXoXtoCn
	VTkwHfK8KgbhvMpUpoZm7jtgs4S64QPigYqbOQeJH0t0jc2deQIx9aBu9YwzFxFhepWcGiNM7oY
	7WT46ib3ngkv3K78HPeVEyei+W8znVqJNU+oMk+5i2YKD3YROFxDU9m4L0ll65mbJ1smgoSkUUz
	O4Nj3J1KxQROdirNwe6+YRkip98N4F8Gil26MlFPixEoq//y3e+cTCEwNlw6obdvkGZKr+FX+qX
	vJULQE3E5UKyRnax6/8piibLiIOvrx8FSfdAB50WplN9z/gy9mf7JeqMEFj5F/jBSXKw7A8POjX
	h/pevuzEwrh3lmcvIpFkESbKKfRJU2mgi+diIV2QGYi2UB4qAcszUYHp+34/JDYmJGEyP/M6R38
	XiYKlT23yxpR+t8rk0hW9mgsyzU+Xa
X-Received: by 2002:a05:690c:d21:b0:7bd:7b2e:f08d with SMTP id 00721157ae682-7d338489c06mr62542177b3.12.1779483549236;
        Fri, 22 May 2026 13:59:09 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:72::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d389d17ffbsm13613037b3.14.2026.05.22.13.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:59:08 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	jlayton@kernel.org,
	axboe@kernel.dk,
	fuse-devel@lists.linux.dev,
	Bernd Schubert <bschubert@ddn.com>
Subject: [PATCH v3 01/10] fuse: separate next request fetching from sending logic
Date: Fri, 22 May 2026 13:58:14 -0700
Message-ID: <20260522205823.1597313-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260522205823.1597313-1-joannelkoong@gmail.com>
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
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
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 78 ++++++++++++++++-----------------------------
 1 file changed, 28 insertions(+), 50 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e467b23e6895..eb166e4da796 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -709,34 +709,6 @@ static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
 	return err;
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
-	spin_unlock(&queue->lock);
-
-	io_uring_cmd_done(cmd, 0, issue_flags);
-	return 0;
-}
-
 /*
  * Make a ring entry available for fuse_req assignment
  */
@@ -832,11 +804,13 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
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
@@ -848,10 +822,12 @@ static void fuse_uring_next_fuse_req(struct fuse_ring_ent *ent,
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
@@ -869,6 +845,20 @@ static int fuse_ring_ent_set_commit(struct fuse_ring_ent *ent)
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
+	spin_unlock(&queue->lock);
+
+	io_uring_cmd_done(cmd, ret, issue_flags);
+}
+
 /* FUSE_URING_CMD_COMMIT_AND_FETCH handler */
 static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 				   struct fuse_chan *fch)
@@ -941,7 +931,8 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	 * and fetching is done in one step vs legacy fuse, which has separated
 	 * read (fetch request) and write (commit result).
 	 */
-	fuse_uring_next_fuse_req(ent, queue, issue_flags);
+	if (fuse_uring_get_next_fuse_req(ent, queue))
+		fuse_uring_send(ent, cmd, 0, issue_flags);
 	return 0;
 }
 
@@ -1190,20 +1181,6 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
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
-	spin_unlock(&queue->lock);
-
-	io_uring_cmd_done(cmd, ret, issue_flags);
-}
-
 /*
  * This prepares and sends the ring request in fuse-uring task context.
  * User buffers are not mapped yet - the application does not have permission
@@ -1220,8 +1197,9 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 	if (!tw.cancel) {
 		err = fuse_uring_prepare_send(ent, ent->fuse_req);
 		if (err) {
-			fuse_uring_next_fuse_req(ent, queue, issue_flags);
-			return;
+			if (!fuse_uring_get_next_fuse_req(ent, queue))
+				return;
+			err = 0;
 		}
 	} else {
 		err = -ECANCELED;
-- 
2.52.0

