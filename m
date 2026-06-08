Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D8737649A
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780952630; cv=none; b=tsBGoZTNzVpNZQPrRAu6TF4wkS8dL4IHhP/Bmq+YF34RyWoNs0CJy6i1t4XaP5xBPZeaX9jnW3E1V2hKk1Ya2P+b6JmSTOI8F/3cHOV+wDn4CD2QHqg+MkpZJ0pqq+PIUZvn7QcM6gmn8jDg5NuGdjADwz38yGBWVeLC8Ev0lF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780952630; c=relaxed/simple;
	bh=mZyS7SsktFugCjS+KbSVx79DJc7xyOnT3XAR/yl1Xq0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RvW+bRrLZcLfn4/wFJ3hoXHGOxWspM5hr1zUlsF4vASW0/DDbPNmeSX2YNybZf0mo/Jr7HEeFaMpCG6VSmf8QdRKvL1dwTwn8T58TLhL7r855b2uLTjUyFrLTU9pcFa8iy5hvVR9QOuG5lHehN3PiYQEF3vIF1musLmWihi+BzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFVvc8uo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFVvc8uo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65F34C2BCB0;
	Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780952630;
	bh=mZyS7SsktFugCjS+KbSVx79DJc7xyOnT3XAR/yl1Xq0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oFVvc8uo6k5pO5R0oq+OlWFP1pNTAgfTl4dhpnYRpR1KxGcA8WD7EMwfcrP0e5gv6
	 TDvlS738mORDjBr0AugKC1LUbcLd7T04BM24MB0nGuzhDndS7vyIduAKVexkyREmcY
	 GqBbbmoKdBvPxgrfR3laE/ibqvIKNPnd7Ez/rSLjguaCssZcQqFN7OuhN8XQolaNxm
	 1j2zXdizjmPfpXcDVfLcTILBS72vnpBV7as4t/nWBJL2YFiVjQ/JqcQjnAN353o4sw
	 NnahHnihhn9qFUZt6edJcj5cYoZRgHGlEuFCY1zzUaVwkPr+Vug+NPHIgKx39bJPNd
	 Yi+dCnXFkBn5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDFDCD8CA7;
	Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Subject: [PATCH v4 0/4] fuse: Fix several io-uring race conditions
Date: Mon, 08 Jun 2026 23:03:42 +0200
Message-Id: <20260608-fuse-io-uring-race-fixes-v4-0-fa410089a0a1@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NTQ6CMBAF4KuQrq3pDyB15T2Mi7ZMoQupaaXRE
 O7uwEaNCXH53uR9M5EE0UMix2IiEbJPPgwYyl1BbK+HDqhvMRPBRM0q3lA3JuwCHaMfOhq1Ber
 8AxKt1KFmpWCt0EBwfouwHnB9vmDufbqH+Fw/Zb60f6CZU0ZlbRUY3WjDm5NJBuLQ7m24koXN4
 pNSG5RACnTFZN06KC38UvJNIbZBSaQct0IoVmrH2Tc1z/MLknsxVlgBAAA=
X-Change-ID: 20260518-fuse-io-uring-race-fixes-59760420d2ae
To: fuse-devel@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>, 
 Luis Henriques <luis@igalia.com>, Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, 
 Zhenghang Xiao <kipreyyy@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
 stable@kernel.org, xlabai <xlabai@tencent.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=mZyS7SsktFugCjS+KbSVx79DJc7xyOnT3XAR/yl1Xq0=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLLU9Yw/7N8s1H5mkd9M9dciZRNXfZW9/KxsolVWaQe/+
 I4THtZbO0pZGMQ4GGTFFFm6JPbYTvnHJ6v2df11mDmsTCBDGLg4BWAi80wY/gfNvaqUVaFlekL0
 5YZPk0/3ay+es0jo9/88nSPr9GN4Dpoz/JU8+0HRTIC1gJ+dxW3Suys192p9jyq/8a9eVDOzdrq
 7BScA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

This is to fix race conditions reported by Berkant and Zhenghang.

So far not well tested yet, update about that will follow tomorrow.

To: fuse-devel@lists.linux.dev
To: Pavel Begunkov <asml.silence@gmail.com>
To: Luis Henriques <luis@igalia.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: Berkant Koc <me@berkoc.com>
Cc: Zhenghang Xiao <kipreyyy@gmail.com>
Cc: Joanne Koong <joannelkoong@gmail.com>

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

Changes in v4:
- Use ring->chan->conn directly, without variable for chan (Joanne).
- Link to v3: https://patch.msgid.link/20260605-fuse-io-uring-race-fixes-v3-0-f1c22904af10@bsbernd.com

---
Bernd Schubert (3):
      fuse: Avoid use-after-free in fuse_uring_async_stop_queues
      fuse: Avoid queue->stopped races and set/read that value under lock
      fuse: {io-uring} Make a fuse_req on SQE commit only findable after memcpy

Zhenghang Xiao (1):
      fuse: clear ent->fuse_req in commit_fetch error path to prevent UAF

 fs/fuse/dev_uring.c | 48 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 17 deletions(-)
---
base-commit: 040d71ac647099f7bb5e480fcd74ba68abc3cb18
change-id: 20260518-fuse-io-uring-race-fixes-59760420d2ae

Best regards,
--  
Bernd Schubert <bernd@bsbernd.com>


