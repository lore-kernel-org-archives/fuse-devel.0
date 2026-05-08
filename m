Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812F140DFA8
	for <fuse-devel@lists.linux.dev>; Fri,  8 May 2026 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258353; cv=none; b=izYmcDFHs8M6kHA5Dn9WdBIW1jskqDYoIMrbXg6916JiJINviOWP4JgB/tykram7uzSd1wXEcEzGDVU8o0PV2uXAEn13tqtjXQXJmafj50Et8NaZa2M4TLyx3O3cLmjgmO6I6ROeOKeNxtYpmw+03LP0+0JL6cHA7lqyqs9DIkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258353; c=relaxed/simple;
	bh=FKpzn2pRe2ujPrwslK1AA0MOsML35kmyIudrCy3mTLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eocjj6QyQ2M0CqGjbKujCzptThO7XkmgMesTrmYyahvjHnMXfquuLKcc1rI89mwnYfWVbReTnFdnzloGITKCvUWD1MyLLXoGD6mCMtz+ipIyDo3NNKSqWC5EeAUuU7E575r3Ta0dhHvBFFGZwqKyKPi0TBgWXfMRJSTk6JNPEbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVh1hUs2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVh1hUs2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6830AC2BCC9;
	Fri,  8 May 2026 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778258353;
	bh=FKpzn2pRe2ujPrwslK1AA0MOsML35kmyIudrCy3mTLg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hVh1hUs2q3Ds+poHzbp+cqSpu/1kOn6lmbliKUOyR5HjQm0luAy7hx3lzKAcH7AJP
	 SQRq6wBoBz506WatWg3E72KxEJwjgGEAWS7bEPU9JmZefSDWuhAur7G564T5cLEuge
	 wHQ9+fF0SI3c7lLbpLSQMwcQbUzcYx9lTUlXtcJHySJXqTQ40Ot1pHodtrVnEo0r1x
	 fqYpvotJTMiADW3dGXBA/rmt+w+eyqgz8/YJhcGUlBzzH+evwFaz95a33FcYqf1gtu
	 P7XH1VvhxxCWLXdH3zBja1j4LygunisObYuTG5LJTPYUNrmHywd6P+1qDoRKopB+9F
	 xnpNqa3me6eKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DCBCD342F;
	Fri,  8 May 2026 16:39:13 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 08 May 2026 18:39:12 +0200
Subject: [PATCH 09/10] fuse mount: Do not set sync_init when sync_init was
 not used
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-new-mount-fixes-and-tests-v1-9-c67a0893ddbc@bsbernd.com>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3303; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=IfLpX0dAI88nGkd6gSPX+QfxV9W/urV5ERySs1L3O4A=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGDL/Ca47aO3vnnUwMczT3XB614QZDMGFJzN2SfyQStj+Y
 rfMj1TujlIWBjEOBlkxRZYuiT22U/7xyap9XX8dZg4rE8gQBi5OAZhI7AxGhr2T5h+MYedXf13Q
 fys8ZMfkszP8Nu6Y6NhhPGmaYK5v6UuGf3pt66fIvp68RFpS778xr/6S+PIg6a1yjZvTBR9mdXw
 35AIA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

synchronous init is just a hint and we cannot fail on it, but for
daemonization we need to do know when it was actually used.
Bug was that se->sync_init() was set unconditionally on mount success.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 lib/fuse_lowlevel.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/lib/fuse_lowlevel.c b/lib/fuse_lowlevel.c
index 6e078e82..60b936c3 100644
--- a/lib/fuse_lowlevel.c
+++ b/lib/fuse_lowlevel.c
@@ -4471,10 +4471,13 @@ static void *session_sync_init_worker(void *data)
 }
 
 /* Enable synchronous FUSE_INIT and start worker thread */
-static int session_start_sync_init(struct fuse_session *se, int fd)
+static int session_start_sync_init(struct fuse_session *se, int fd,
+				   bool *is_sync_init)
 {
 	int err, res;
 
+	*is_sync_init = false;
+
 	/*
 	 * Older fuse servers do not set want_sync_init or start the new
 	 * daemonize code, so they get async init.
@@ -4536,6 +4539,8 @@ static int session_start_sync_init(struct fuse_session *se, int fd)
 		return -EIO;
 	}
 
+	*is_sync_init = true;
+
 	return 0;
 }
 
@@ -4594,7 +4599,8 @@ static int session_wait_sync_init_completion(struct fuse_session *se)
 static int new_api_fusermount(struct fuse_session *se,
 			      const char *mountpoint,
 			      const char *mnt_opts,
-			      int *sock_fd, pid_t *fusermount_pid)
+			      int *sock_fd, pid_t *fusermount_pid,
+			      bool *is_sync_init)
 {
 	int fd, err;
 
@@ -4617,7 +4623,7 @@ static int new_api_fusermount(struct fuse_session *se,
 
 	/* Start worker thread with correct fd from fusermount3 */
 	se->fd = fd;
-	err = session_start_sync_init(se, fd);
+	err = session_start_sync_init(se, fd, is_sync_init);
 	if (err) {
 		fuse_log(FUSE_LOG_ERR,
 			 "fuse: failed to start sync init worker\n");
@@ -4649,6 +4655,7 @@ static int fuse_session_mount_new_api(struct fuse_session *se,
 	char *mnt_opts = NULL;
 	char *mnt_opts_with_fd = NULL;
 	char fd_opt[32];
+	bool is_sync_init = false;
 
 	res = fuse_kern_mount_get_base_mnt_opts(se->mo, &mnt_opts);
 	err = -EIO;
@@ -4665,7 +4672,7 @@ static int fuse_session_mount_new_api(struct fuse_session *se,
 	}
 
 	se->fd = fd;
-	err = session_start_sync_init(se, fd);
+	err = session_start_sync_init(se, fd, &is_sync_init);
 	if (err)
 		goto err;
 
@@ -4684,7 +4691,8 @@ static int fuse_session_mount_new_api(struct fuse_session *se,
 		close(fd);
 		se->fd = -1;
 		fd = new_api_fusermount(se, mountpoint, mnt_opts,
-					&sock_fd, &fusermount_pid);
+					&sock_fd, &fusermount_pid,
+					&is_sync_init);
 		if (fd < 0) {
 			err = fd;
 			goto err_with_sock;
@@ -4711,11 +4719,12 @@ err:
 		se->fd = -1;
 		se->error = err;
 	}
+	se->is_sync_init = is_sync_init;
+
 	/* Wait for synchronous FUSE_INIT to complete */
 	if (session_wait_sync_init_completion(se) < 0)
 		fuse_log(FUSE_LOG_ERR, "fuse: sync init completion failed\n");
 
-	se->is_sync_init = true;
 	free(mnt_opts);
 	free(mnt_opts_with_fd);
 	return fd;
@@ -4791,7 +4800,6 @@ int fuse_session_mount(struct fuse_session *se, const char *_mountpoint)
 out:
 	se->fd = fd;
 	se->mountpoint = mountpoint;
-
 	fuse_daemonize_early_set_mounted();
 
 	return 0;

-- 
2.53.0


