Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D8B37998B
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780952630; cv=none; b=C3PZbS6toMx6Xc8ZRABI9dKuk4BVw1sFDRR8m+/7LmkIUw9/cuLOhd8Xzp4qWreBIhdhUIanFcNbYSJEDJLLRKeHeJkZ4Ju4XLD9Ut+0kpHY1GVjs7HVUQKOLTWud/w+Q/zi2vwS1dvYYqJtib7X9w2qsNjNFtKDkOaN3WNGV4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780952630; c=relaxed/simple;
	bh=n9QBk/L+SrD0PMt/Cd3yOcQvvc8w9FqFF0KiuAvdetA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CsjbtJS5xbg/faIds6i8BZTu20F76WQRlE+wv2ai+VYaTfOOCiIrhxs5hURpFRa8EnKGMkyC5DceD51V2kmtv8MUN7eqfmMFXQmo8ctpd0B9em3j4Qt4ZnAmDjVTFPTW9ppr6pMOJGOC9Fb6LpBh9xnzmD3LdXdRqytpcBX8m2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvM4rjk7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvM4rjk7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94844C4AF0F;
	Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780952630;
	bh=n9QBk/L+SrD0PMt/Cd3yOcQvvc8w9FqFF0KiuAvdetA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JvM4rjk7+J5MAkkhpGnGqVzBxLtVOAOu9H9h+VrnuqK/SwYTdUl5KjY/svZkMey3R
	 mTrvMqNdcKJP9L/DpOJEtG9vWyO/Tt9vDlfh8/s5GOoTNMyVhB1copkI3qbVG6oTbR
	 NSJ4A5cr0SM90j+/Hvv1orS/pkzX5lzcSHfUG5hQgSgYW7/GuwTJTQ+Qk9c02eBmVk
	 aQ/rS0c/uM2Iaeos4nTmWqqu4ik6iRQz7U8kepi80Kuv1WYOp2Ig7y87wXTY+j78tb
	 Wgn6sE8pcEmTWZlxCkJvf48/6dY/w+doKsSAdpeUWAY8Wdo4PA4LEpg4RgT3jyyFHb
	 Lee9eSeCNOf3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B96CD8CA8;
	Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 08 Jun 2026 23:03:44 +0200
Subject: [PATCH v4 2/4] fuse: Avoid queue->stopped races and set/read that
 value under lock
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-fuse-io-uring-race-fixes-v4-2-fa410089a0a1@bsbernd.com>
References: <20260608-fuse-io-uring-race-fixes-v4-0-fa410089a0a1@bsbernd.com>
In-Reply-To: <20260608-fuse-io-uring-race-fixes-v4-0-fa410089a0a1@bsbernd.com>
To: fuse-devel@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>, 
 Luis Henriques <luis@igalia.com>, Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, 
 Zhenghang Xiao <kipreyyy@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
 stable@kernel.org, xlabai <xlabai@tencent.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=qrK7SJaHksIoFJw9cL+mcBPW6PNfg0Dk5iDL0kEgAao=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLLU9UzC649t9d6qGi7UvZVb5r9jdmbCzNueU4xiZcrU7
 itYW6zqKGVhEONgkBVTZOmS2GM75R+frNrX9ddh5rAygQxh4OIUgIn0dzP8jwzKz+tkFVk4+XVf
 ohrHqjNMJc+1XE9affPPCLRh4pM+ysjQNbFVdYmdS7HUvNWdT7dcunq+eIn59IeyDXfO89aF1Oq
 zAAA=
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

There are several readers of queue->stopped that check the value
under lock, but fuse_uring_commit_fetch() did not and actually
the value was not set under the lock in fuse_uring_abort_end_requests()
either. Especially in fuse_uring_commit_fetch it is important
to check under a lock, because due to races 'struct fuse_req'
might be freed with fuse_request_end, but another thread/cpu
might already do teardown work.

Cc: stable@kernel.org # 6.14
Fixes: 4a9bfb9b6850fec ("fuse: {io-uring} Handle teardown of ring entries")
Reported-by: Berkant Koc <me@berkoc.com>
Reported-by: xlabai <xlabai@tencent.com>
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 fs/fuse/dev_uring.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index d658ef6877a4..c31240967932 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -130,10 +130,9 @@ void fuse_uring_abort_end_requests(struct fuse_ring *ring)
 		if (!queue)
 			continue;
 
-		queue->stopped = true;
-
 		WARN_ON_ONCE(fch->max_background != UINT_MAX);
 		spin_lock(&queue->lock);
+		queue->stopped = true;
 		spin_lock(&fch->bg_lock);
 		fuse_uring_flush_bg(queue);
 		spin_unlock(&fch->bg_lock);
@@ -898,10 +897,15 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 		return err;
 	fpq = &queue->fpq;
 
-	if (!READ_ONCE(fch->connected) || READ_ONCE(queue->stopped))
+	if (!READ_ONCE(fch->connected))
 		return err;
 
 	spin_lock(&queue->lock);
+	if (unlikely(queue->stopped)) {
+		spin_unlock(&queue->lock);
+		return err;
+	}
+
 	/* Find a request based on the unique ID of the fuse request
 	 * This should get revised, as it needs a hash calculation and list
 	 * search. And full struct fuse_pqueue is needed (memory overhead).

-- 
2.53.0


