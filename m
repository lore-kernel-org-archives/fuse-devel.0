Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4674F488DA0
	for <fuse-devel@lists.linux.dev>; Fri, 21 Aug 2026 12:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315317; cv=none; b=fynVKglGIsUJO2GOce+sAagopSOu2An+ChCGwxsOiDv7D8U9YGUdbXzsJ7V5PbFtxDJo3EgYSIUhkCg2oHgXMFRBG1YsXBK7bSRVNFRmQ7Y9zLsF+6zqxYCI67LIuFNs6OaMbvvfbYYoMOMTYStnlJJKwr5QN9B3rQCstt/VakE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315317; c=relaxed/simple;
	bh=WKWXpP6aQqbm2TDpfgD5ho5L8lIqE/VT2/vMAHz9oIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PvmlmoBtKgxfU0LcWIJToVO28z44TLTQZE+p7oy5hJ9bq1ar9KFQwKsZALv0l1+6Oi+X37BEI713hVztZKpG4NPtXnoV3ZaVYqP1THRvSEUQjPezs3tdQeJfG7YwOLbVUJHF5iNh6H+qLNE/NsD25ZwNC++TSgmtvomylZGMXPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7KasALh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7KasALh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9EE4C2BCF7;
	Fri, 21 Aug 2026 12:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787315316;
	bh=WKWXpP6aQqbm2TDpfgD5ho5L8lIqE/VT2/vMAHz9oIo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=p7KasALhoVtd+dFtLwOW7n73FoiYFTELLmVLJKGiVltXnSLKG9MmZfQgiEsxJhXZr
	 zovhEPSxmJ6A1nN3dx96JX9QmMalTrWO04H9GMBABEL/8cZ3eqFJEtKratpqVjXdZM
	 7SUr2yDvc5nVqFZYUQrmPtf1TXNynTRrbCm2i7IDAeF8n3brmryU8jGWTPmCgeqX+1
	 0MSprhiuyw0pZEI0ZbJWDIFqhsoordFf2eShJ4wpI9ocyu0YfDvy4ztcBgX+7DS+7B
	 GqTpdkKjQN52L1nlJ3ST7x32Evyu2qsa1QXRvCTgFKgZDxu3GK3KcY9DA485TOCHdP
	 hW0DpvvHNA6dg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9128EC5DF89;
	Fri, 21 Aug 2026 12:28:36 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 21 Aug 2026 14:28:32 +0200
Subject: [PATCH] fuse: Fix the condition to enable over-io-uring
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-fuse-fix-enable-condition-v1-1-488f77b27e96@bsbernd.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QqDMAwAf0XyvICW6cp+ZeyhpqmLSB2NykD8d
 7Pt8eDudlAuwgr3aofCm6jM2aC5VECvkAdGicbgatfV3jWYVmVM8kHOoZ8Yac5RFqswJn8L4Uq
 uJQ/Wvwub93s/nn/WtR+Zlu8QjuMEY8xDGH0AAAA=
X-Change-ID: 20260821-fuse-fix-enable-condition-df87aa4c25c8
To: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd@bsbernd.com>
Cc: Joanne Koong <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev, 
 Baokun Li <libaokun@linux.alibaba.com>, 
 Thomas <thomas.fractalbits@gmail.com>, zhu <zzsheng@gmail.com>, 
 Stefan Hajnoczi <stefanha@gmail.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=3881; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=x0saBZr76A+AJaVweFwY6LEpGdlTSPbLMHA+ayIkzFU=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLI6XIqzbqyVN3LL9K2+JbCmeUYt+6LVbZfLXpvnyLhwL
 dgd+2JHRykLgxgHg6yYIkuXxB7bKf/4ZNW+rr8OM4eVCWQIAxenAEyk1JGRYcudz3z7OJ+ITPVQ
 4Pin5+gee8tL7uQPzp1PBeOXZNSx/WD4Z/ayX6yDcVPQscdnNSu2cR15sdDTycfRNCQtIzp9uvE
 UdgA=
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

I had accidentally used "&&" instead of "||" and totally broken
the intention of the condition. This has several implications

1) fuse-servers can bypass the module option "enable_uring"
   by setting FUSE_OVER_IO_URING in the FUSE_INIT reply, although
   fuse-client/kernel wouldn't have announced availability of
   that flag. I.e.

2) fuse-servers do not need to set FUSE_OVER_IO_URING in FUSE_INIT
   reply and could just send FUSE_IO_URING_CMD_REGISTER at
   any time while IO is already going on. That has further
   implications:

    2.1) The barrier in fuse_block_alloc() waiting for fuse_uring_ready()
         is then bypassed - fuse requests are not blocked until queues
         are initialized - results in dynamic switching from /dev/fuse
         to io-uring.

    2.2) The dynamic switching from /dev/fuse to io-uring exposes
         at least one easily exposable lock order issue between
         fch->bg_lock and queue->lock. There might more issues, as
         dynamic run time switching was never tested.

The change itself is simple, but brings behavior change,
FUSE_OVER_IO_URING has to be set in the FUSE_INIT_REPLY by fuse servers
to accept any IORING_OP_URING_CMD. Libfuse does that and the only
non-libfuse implementation I found (fractal-fuse) also does that.
Qemu patches for fuse-io-uring are not merged yet, as far as I know.

Also moved up is the check for fch->initialized as a fuse-server
implementation might try to setup io-uring before FUSE_INIT is
processed and might have gotten -EOPNOTSUPP instead of -EAGAIN.

Also fixed is a stale comment that explain the handling of the
FUSE_OVER_IO_URING flag in early RFC versions.

If there should be a report from any library or application we
probably need to revert this commit, although slightly modified then
to prevent bypassing of the module option.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 fs/fuse/dev_uring.c | 16 ++++++++--------
 fs/fuse/inode.c     |  4 ----
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 77c8cec43d9c..eba322f79df1 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1237,8 +1237,15 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
 	}
 	fch = fud->chan;
 
+	/*
+	 * fuse_uring_register() needs the ring to be initialized,
+	 * we need to know the max payload size
+	 */
+	if (!fch->initialized)
+		return -EAGAIN;
+
 	/* Once a connection has io-uring enabled on it, it can't be disabled */
-	if (!enable_uring && !fch->io_uring) {
+	if (!enable_uring || !fch->io_uring) {
 		pr_info_ratelimited("fuse-io-uring is disabled\n");
 		return -EOPNOTSUPP;
 	}
@@ -1248,13 +1255,6 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
 	if (!fch->connected)
 		return -ENOTCONN;
 
-	/*
-	 * fuse_uring_register() needs the ring to be initialized,
-	 * we need to know the max payload size
-	 */
-	if (!fch->initialized)
-		return -EAGAIN;
-
 	switch (cmd_op) {
 	case FUSE_IO_URING_CMD_REGISTER:
 		err = fuse_uring_register(cmd, issue_flags, fch);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index d975073c6029..f29bd7432fa3 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1474,10 +1474,6 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
 		flags |= FUSE_PASSTHROUGH;
 
-	/*
-	 * This is just an information flag for fuse server. No need to check
-	 * the reply - server is either sending IORING_OP_URING_CMD or not.
-	 */
 	if (fuse_uring_enabled())
 		flags |= FUSE_OVER_IO_URING;
 

---
base-commit: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c
change-id: 20260821-fuse-fix-enable-condition-df87aa4c25c8

Best regards,
--  
Bernd Schubert <bernd@bsbernd.com>


