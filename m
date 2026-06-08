Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D7C3769E7
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780952630; cv=none; b=SZ3qDYF1iD1XQ5bmryv89Yhb49YGtu4GtvrMOhN390kl+uDRrYyL9m4Lqo4x8V29w4nJfGDZoJDFoMJ3nMk3kvRi1r3i7HYUyV4GykXGNfMITzH6F1nlC1I3tgVZopNnYlR2aCQnEtxJacPQGYI88U++0AI3j0/s8Uy30tbegwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780952630; c=relaxed/simple;
	bh=Yc4gSBW+Suf4sEZPeCxna/JewBVXV0hmkV0Pg1t6Q1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IfBb4vu9/aQKmnLb/BMFDqJ8JLcPuiDBdJEj7ljFM9z7dfHAS1kDLVDyYVJrCn8N/2edUsqvwKZ0avygBPuo4J8xVrk7cMUeq1apfLi5/RKG3FDMrsyvLWRWWa1qdxFCufDDNkXA6S29C4qgZPBZbXq+6i+shSQ1K3NNPbLjz/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fit3rslA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fit3rslA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 878B3C2BCB9;
	Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780952630;
	bh=Yc4gSBW+Suf4sEZPeCxna/JewBVXV0hmkV0Pg1t6Q1w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fit3rslAd7Pmyj3fdoYKZgTsHjblx4nI4msmvts5DLxGv8f6IwL3QEX0i6vU4bdnq
	 qCgSqOFN2+r0AN5gGvgcecRTsBTCPs7y1JgiT5/TSambj65xD0qDHzXtkzFViNU0NZ
	 7DPzW6P/5Biidjhmcdjo+pV2aM8wh+7SuuORiZaFVjr05kSvuN9sYHySifRrVMDewS
	 WBHMNQeMdWG/O7RxyFVpZI3ixqJ1zeG0Zwtnd3g9Z7LXC48JVUFmZDJL4HYmgYWtIY
	 1bIRmIIRcnpsYJ4vAJO8XTAKyo3prKdx9Pw5m33WE9jL2Jv5X7t5d0hi7z8Rbjgj//
	 we0MY0nqSUo3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75922CD6E79;
	Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 08 Jun 2026 23:03:43 +0200
Subject: [PATCH v4 1/4] fuse: Avoid use-after-free in
 fuse_uring_async_stop_queues
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-fuse-io-uring-race-fixes-v4-1-fa410089a0a1@bsbernd.com>
References: <20260608-fuse-io-uring-race-fixes-v4-0-fa410089a0a1@bsbernd.com>
In-Reply-To: <20260608-fuse-io-uring-race-fixes-v4-0-fa410089a0a1@bsbernd.com>
To: fuse-devel@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>, 
 Luis Henriques <luis@igalia.com>, Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, 
 Zhenghang Xiao <kipreyyy@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
 stable@kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=fClfSeFNZbN84Rlj6vwX+jm39G5aYdFCQYhhYlWFOCk=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLLU9YyXq777uvVfPrsNB1f4IZPwMAnHfs78fCZW2bh3W
 hcOlBV3lLIwiHEwyIopsnRJ7LGd8o9PVu3r+uswc1iZQIYwcHEKwESKMhgZ2lTuq0Vz79v9LeP5
 lxmhd/nrPTmnbFDxmXz73ZSzPc93XmNkWPyXxSqy/Wh2/8ZbejcZxSKSn8/dvn/H7PJuSYtiPZE
 JPAA=
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

fuse_uring_async_stop_queues() might run when the last reference
on ring->queue_refs was already dropped.

In order to avoid an early destruction a reference on struct fuse_conn
is now taken before starting fuse_uring_async_stop_queues() and that
reference is only released when that delayed work queue terminates.

Fixes: 4a9bfb9b6850 ("fuse: {io-uring} Handle teardown of ring entries")
Cc: stable@kernel.org # 6.14
Reported-by: Berkant Koc <me@berkoc.com>
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e467b23e6895..d658ef6877a4 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -466,6 +466,7 @@ static void fuse_uring_async_stop_queues(struct work_struct *work)
 				      FUSE_URING_TEARDOWN_INTERVAL);
 	} else {
 		wake_up_all(&ring->stop_waitq);
+		fuse_conn_put(ring->chan->conn);
 	}
 }
 
@@ -477,6 +478,7 @@ void fuse_uring_stop_queues(struct fuse_ring *ring)
 	fuse_uring_teardown_all_queues(ring);
 
 	if (atomic_read(&ring->queue_refs) > 0) {
+		fuse_conn_get(ring->chan->conn);
 		ring->teardown_time = jiffies;
 		INIT_DELAYED_WORK(&ring->async_teardown_work,
 				  fuse_uring_async_stop_queues);

-- 
2.53.0


