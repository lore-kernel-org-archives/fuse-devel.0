Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0283E5EFA
	for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 12:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525241; cv=none; b=ABvsVXMAn0PKHSRZKZz2oSAuUrfqkm29DEIQejp4bmGVMe+GyzMwUS1gfqi1PqzzuX3Q0oWt32dq8k0TE3LqCahREDHQbh/ziTihX47iX8PDQDKAp9LYFzu8Z6S1JTw+PEKxVhPrFdLjJYHNPFVXY8r2BoNz9k301ssHlFojnzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525241; c=relaxed/simple;
	bh=hNKxJyTaAV0/cU78qVSgYhQLnSuVU51Lhg8VrhVBn1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uI8Zzn8QSYORo6Dcp65lo+c7eVS9s88/RHgmBdzFJk+gX55U+yaT8hMVXfgsoUHRtHwiqCscvSTG/yzjaLm24+gHMKM7Pf+8tGzGIy4lFJx27cVmfvDcqLoDw7VAeJBAGNQumUA59zunZ46QF4zsVHbXQsjuTxtTLazupFXVvCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UF0KP5zo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UF0KP5zo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82522C2BCB4;
	Mon, 15 Jun 2026 12:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781525241;
	bh=hNKxJyTaAV0/cU78qVSgYhQLnSuVU51Lhg8VrhVBn1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UF0KP5zouXA4FlH1kErf7CMBJhY3+QQMpboyzDSJMz53bQ8GkGJp6uV0WgU8YoPWN
	 HJcj5a5xgYHGrpTzVrHR5oxNGHMLb56y1O3tDtPJXTuEKndapwGrFoKYrrY2LbtlfL
	 p1aLt8TFnIQMx7/JCeq7oqppE+Q5nZzsLI0N5ZJoGU1EfJX5G7trimRm8fNeRCJ5oA
	 b8+ZoTGWA1QKXaOxHaJCxDcdSAQTPNR9Dgr5M+kivTLGNTMinWfbBN8Iddsp7jQhdo
	 F2AwWdstda/OjQ5ue4yYFW4qZD2AJBgIP+gHMc3sRazt3WLH/mdzOu/eSOLjwGC6Bd
	 68NlAEzdBcvMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1CBCD98C7;
	Mon, 15 Jun 2026 12:07:21 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 15 Jun 2026 14:07:18 +0200
Subject: [PATCH 1/2] fuse: {io-uring} use READ_ONCE() for ring->queues[] in
 fuse_uring_register()
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-fix-7-2-next-v1-1-0a4c3908f13c@bsbernd.com>
References: <20260615-fix-7-2-next-v1-0-0a4c3908f13c@bsbernd.com>
In-Reply-To: <20260615-fix-7-2-next-v1-0-0a4c3908f13c@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, Bernd Schubert <bernd@bsbernd.com>, 
 stable@kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=851; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=nwGHU74m/mRySqbF1+v7DgK2QJZRMBx4cdOA2Xrs2w0=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLL0X3231F3FkvKmiL1w3o0LDE9/m21/5/GZXXnaBAa7F
 m1p88QzHaUsDGIcDLJiiixdEntsp/zjk1X7uv46zBxWJpAhDFycAjCR3RMYGRZ4M4iEpXRnGB8N
 9n53xe2SmsqqZNP4xa/3f67albRBIo3hf1p3QUOLCJ/bFAFBJ2sG7rbdNg0a0zI6m2QS2HtS+np
 YAQ==
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

ring->queues[qid] is written with WRITE_ONCE() in fuse_uring_create_queue()
but read with a plain load in fuse_uring_register().
KCSAN might flag this as a data race.

Use READ_ONCE() to match the WRITE_ONCE() on the writer side.

Fixes: 24fe962c86f5 ("fuse: {io-uring} Handle SQEs - register commands")
Cc: stable@kernel.org # 6.14
---
 fs/fuse/dev_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index ba5edf5d01b3..230177cc06c6 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1193,7 +1193,7 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 		return -EINVAL;
 	}
 
-	queue = ring->queues[qid];
+	queue = READ_ONCE(ring->queues[qid]);
 	if (!queue) {
 		queue = fuse_uring_create_queue(ring, qid);
 		if (!queue)

-- 
2.53.0


