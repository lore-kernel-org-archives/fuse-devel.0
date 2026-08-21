Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD9B494A1E
	for <fuse-devel@lists.linux.dev>; Fri, 21 Aug 2026 16:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329156; cv=none; b=KGYtw77GTtfIl052jrxHc9bGgnOVUlazf+E30RkTbJVt2ZNhFA4Mc/4LQUXpdKc+ij+N1ZRqtYkac+ElQEjFkEJ+kO9ZACygZ0LLtVlrPjupLN0FZr1JEn7DHF8RIwr0bfEwpiUTxWOYHJzLrHAVO43gHnfDbs3iUSNe1PBiSLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329156; c=relaxed/simple;
	bh=jnUlTXasHGk+r6HNeeigydBLj/voi7Led5fgjz6m7bU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B8m27Dayg1pwzG5fkyFMJi2nOOViBbF/AUwdC/NfPlhS2B7KlII0jMzRvMcmI8ApJP4NQVfDSZ6FWkzN+VvO/oxTMcUKNzI4SOOaP4iet0652N0rlHCTlPkQQ84AgH4YFk/Tf1Xe0mKESGi8VMvkzccRgi8lwZ9/JwzPMxAjIEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZfRmwKD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZfRmwKD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BD53C19425;
	Fri, 21 Aug 2026 16:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787329154;
	bh=jnUlTXasHGk+r6HNeeigydBLj/voi7Led5fgjz6m7bU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=TZfRmwKDnGeKYI35GT15VnbQRssL/mp4cb5s56xFGf32VVI0XRGaJaoJ16mscRc95
	 znt1RR7v42BHMuTBCBp9AnwM8j2BDEXH6vjPhgupRukiGodJj1i0wOqCkDYYx3ziBz
	 LXN5gP3R88VvBMbn23a12pw1MRsEtvkMrDmkuXGezYnjIt71E4mF4mVnoDiGPa9u4g
	 sZF2HGqnMdXeW7c4xYFp9lvIW3EUDPtN6xNEZ0P0TuTBjrGjV5vpbf3IaoG/pyonYa
	 cT+OdsX/BPX0XCUyvubVH2bmjHNJL3NGgAAlCuoBwAT7EaejHzI9IzxqHyu4erGh/r
	 zinWHCibSdcUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408A6C5DF97;
	Fri, 21 Aug 2026 16:19:14 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 21 Aug 2026 18:19:09 +0200
Subject: [PATCH v2] fuse: Fix the condition to enable over-io-uring
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-fuse-fix-enable-condition-v2-1-35a386d3d443@bsbernd.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSw6CMBRFt0I69hnaIK2O3Idh0M+r1GhL+oBoC
 Hu34AYcnuTccxdGmAMSu1QLyzgHCikWEIeK2V7HO0JwhZmoRVsrwcFPhODDGzBq80SwKbowlhU
 4r6TWjRUnq1jZDxmLt7dv3Y9pMg+04xbcjD7QmPJnP5/55v3zM3Pg0CjlpTRC4rm9GjKYozva9
 GLduq5fWBoNnNYAAAA=
X-Change-ID: 20260821-fuse-fix-enable-condition-df87aa4c25c8
To: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd@bsbernd.com>
Cc: Joanne Koong <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev, 
 Baokun Li <libaokun@linux.alibaba.com>, 
 Thomas <thomas.fractalbits@gmail.com>, zhu <zzsheng@gmail.com>, 
 Stefan Hajnoczi <stefanha@gmail.com>, stable@kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=4122; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=jUQYqgugAEmYi2fMM2GSsrtAuh84XLRvxWs4GiKHi2A=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLI6qhoO1Z1ccsmkmWXOoc9bq16VBLA7ZP/I0F+cwBHX/
 twqfIJvRykLgxgHg6yYIkuXxB7bKf/4ZNW+rr8OM4eVCWQIAxenAExEKZCR4fcJ1X6V7ZIH0uQn
 vTGfLXT20NSwLW+yJ3Qd4XWPFXK/NZOR4dg/2ZfNgRPY6i/PVEi7c/VF63274ohdUqlGfjODv2/
 y4AUA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

The existing condition in fuse_uring_cmd() is there only to avoid
disabling io-uring for connections that already run with it, missing
was a condition to refuse any IORING_OP_URING_CMD if the
connection/channel didn't get enabled because of missing FUSE_INIT
reply flag FUSE_OVER_IO_URING. Without the reply flag the barrier in
fuse_uring_ready() doesn't work and IO could already be going on and
cause deadlock states (at a minimum one between fch->bg_lock and
queue->lock).

The change itself is trivial, but brings behavior change,
FUSE_OVER_IO_URING has to be set in the FUSE_INIT_REPLY by fuse servers
to accept any IORING_OP_URING_CMD. Libfuse does that and the only
non-libfuse implementation I found (fractal-fuse) also does it.
Qemu patches for fuse-io-uring are not merged yet, as far as I know.

Moved up is the smp_load_acquire(&fch->initialized) check, as a
fuse-server implementation might try to setup io-uring before FUSE_INIT
is processed and might have gotten -EOPNOTSUPP instead of -EAGAIN.

Also fixed is a stale comment that explains the handling of the
FUSE_OVER_IO_URING flag in early RFC versions.

If there should be a report from any library or application we
probably need to revert this commit.

Fixes: 3393ff964e0f ("fuse: block request allocation until io-uring init is complete")
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
Changes in v2:
- Seperate condition for fch->io_uring, switching from "&&" to "||" would have
  brought up another regression.
- Commit message update, fortunately bypassing the module option
  wasn't possible because of another check in process_init_reply()
- Link to v1: https://patch.msgid.link/20260821-fuse-fix-enable-condition-v1-1-488f77b27e96@bsbernd.com
---
 fs/fuse/dev_uring.c | 31 ++++++++++++++++++-------------
 fs/fuse/inode.c     |  4 ----
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e22a48c9a678..c6dd420c4034 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1665,25 +1665,30 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
 	}
 	fch = fud->chan;
 
-	/* Once a connection has io-uring enabled on it, it can't be disabled */
-	if (!enable_uring && !fch->io_uring) {
-		pr_info_ratelimited("fuse-io-uring is disabled\n");
-		return -EOPNOTSUPP;
-	}
+	/*
+	 * The ring is sized from values negotiated by FUSE_INIT
+	 *
+	 * Pairs with smp_store_release() in fuse_chan_set_initialized()
+	 */
+	if (!smp_load_acquire(&fch->initialized))
+		return -EAGAIN;
 
 	if (fch->abort_with_err)
 		return -ECONNABORTED;
 	if (!fch->connected)
 		return -ENOTCONN;
 
-	/*
-	 * fuse_uring_register() needs the ring to be initialized,
-	 * we need to know the max payload size
-	 *
-	 * Pairs with smp_store_release() in fuse_chan_set_initialized()
-	 */
-	if (!smp_load_acquire(&fch->initialized))
-		return -EAGAIN;
+	/* Once a connection has io-uring enabled on it, it can't be disabled */
+	if (!enable_uring && !fch->io_uring) {
+		pr_info_ratelimited("fuse-io-uring is disabled by module parameter\n");
+		return -EOPNOTSUPP;
+	}
+
+	if (!fch->io_uring) {
+		pr_info_ratelimited(
+			"fuse-io-uring not enabled on this connection\n");
+		return -EOPNOTSUPP;
+	}
 
 	switch (cmd_op) {
 	case FUSE_IO_URING_CMD_REGISTER:
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 1c6ee01c6796..e9552be3637b 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1480,10 +1480,6 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
 		flags |= FUSE_PASSTHROUGH;
 
-	/*
-	 * This is just an information flag for fuse server. No need to check
-	 * the reply - server is either sending IORING_OP_URING_CMD or not.
-	 */
 	if (fuse_uring_enabled())
 		flags |= FUSE_OVER_IO_URING | FUSE_HAS_IO_URING_BUFPOOL;
 

---
base-commit: d1dbc59200b54944f00251ca4dfbb2b318beca13
change-id: 20260821-fuse-fix-enable-condition-df87aa4c25c8

Best regards,
--  
Bernd Schubert <bernd@bsbernd.com>


