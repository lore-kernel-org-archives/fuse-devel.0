Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC12A3E5EFB
	for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 12:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525241; cv=none; b=tdHTJiXjTDalXQKRGa0dsWPCXlUCzQR3zVKfkve7GhGrwGPv6uLvAkQ8ZKyazLoJrvdCyBL5+kVLNTEjl/XyzbhiTeq3HjE5trg4lsogFtwPSuEmON7VhoAkrz/9gKZL2Pr8n/SISLiNouvsBsf9pgxyvgg8rXUtJHBRK+lFuRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525241; c=relaxed/simple;
	bh=D59Tczt7UHCecWDFEmcqrImxwSLUnFWmAPZf/E1O2N4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kzoG1lE4dPJylfZfhXG6/MWKfvnHG6E/TCTuIGNqZo/V9CsgXVAOAZO0xb0+qFcozLDK7CYf7wcMg/Bn+2e5+ILpo/9VUSfI9NeaCk0eZseB7wiffzbMYOJ4RYhj+lt8g1UBE0C/9CJTMi7knv+gIvttPUAR+DNHLHZo5VvkeYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duBU0XMg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duBU0XMg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67DB3C2BCB9;
	Mon, 15 Jun 2026 12:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781525241;
	bh=D59Tczt7UHCecWDFEmcqrImxwSLUnFWmAPZf/E1O2N4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=duBU0XMgT2wOfT/b/hCGeqRVtaxmGHQ14cooiGbVGS2nXK+g62ezBMFgs7SvoD3BS
	 3I+LU6fqGq9sFxAi+wneK/fBc/tvFEeUhOEMgykZe8BcGXCZJmUWcEkXm+xh7G4dRX
	 VVhK0TLQwxdz5nC9M8K06ArvQnfGCAZwKFSwEPCExphjZZWh669u1poTPF4kLoh/Yt
	 PHnpu78qDv2lxCp7KFn1eUo1Y9OUd01+CMyE9eWlRzoEEnm3fgZO7mvOynoH1CnwfM
	 dUD/stLZ5U9ChkzN9Kh6eS5iUgtcK4gYN5XfLpZAR9Ivv831d26WluSCHR83EbvN2B
	 uPwwtqVSi7edg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA1DCD98C5;
	Mon, 15 Jun 2026 12:07:21 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Subject: [PATCH 0/2] fuse: io-uring: tidy memory ordering for lockless
 ring/queue reads
Date: Mon, 15 Jun 2026 14:07:17 +0200
Message-Id: <20260615-fix-7-2-next-v1-0-0a4c3908f13c@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBCF4avErBtQSYWuEi0qp5oWFlohRHfPa
 vnxeP8FkQJThLq4INDJkVefIcsChrnzEyG7bFBCGWGkxpETWlToKe1YWbKV1EI5LSFftkB5/3J
 N+zse/ULD/jbgvh8a0l6ZcAAAAA==
X-Change-ID: 20260615-fix-7-2-next-47e741502d51
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, Bernd Schubert <bernd@bsbernd.com>, 
 stable@kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=D59Tczt7UHCecWDFEmcqrImxwSLUnFWmAPZf/E1O2N4=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLL0X30vrXp89qH4eru2P6oWFm/UZlqY1Dk0eCf+PZU4e
 f3ldIuUjlIWBjEOBlkxRZYuiT22U/7xyap9XX8dZg4rE8gQBi5OAZiIfywjw41ZuXJ5jb8d1n4t
 OPR14u2Q1euvZcx4FxOR7151Sfdy5F1Ghm+C5+bYLJkt0NN2zYzx6tRdL3sOORdZO+jkTfjYOG+
 3DxcA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

The fuse io-uring code publishes fch->ring and ring->queues[qid] once and
then reads them mostly without holding fch->lock.  Reviewing that access
discipline turned up one genuine data race and one read that only looks
unsynchronized.

Patch 1 adds the READ_ONCE() that pairs with the existing WRITE_ONCE() on
ring->queues[qid]: the entry is published under fch->lock in
fuse_uring_create_queue() but read locklessly in the fast path of
fuse_uring_register().  That is a real data race - a torn/refetched load
could slip a garbage pointer past the NULL check - so it is tagged for
stable.

Patch 2 moves the fch->ring read in the race branch of fuse_uring_create()
back under fch->lock.  The read was already ordered by the under-lock
existence check, so this is a readability cleanup only; no functional
change.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
Bernd Schubert (2):
      fuse: {io-uring} use READ_ONCE() for ring->queues[] in fuse_uring_register()
      fuse: read fch->ring under fch->lock in fuse_uring_create()

 fs/fuse/dev_uring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: bb43b4c7ea2a8265141aa93240f3f0ca71d85c0e
change-id: 20260615-fix-7-2-next-47e741502d51

Best regards,
--  
Bernd Schubert <bernd@bsbernd.com>


