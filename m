Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF8E3E5ECF
	for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 12:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525241; cv=none; b=CoH4e1FGtuNMj6qvkhh8XmkEoC/s2vVNwlBfxCETSoBid2mZoLn161EG0h/qdUEYyRFppYxhoFQesb6p9SrLJw4131QDi6BO1h89dY4bNknMVNbS+M/lg5evWhLY+/I0CPlpFvqn3jfEkyPKagV00fuS5I38Nf3gruNicFimCl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525241; c=relaxed/simple;
	bh=XyDyXP5oEPHNd1b3RSvcQZ8tfchIZjl+jPtgNruGwLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LK5uxuC0QhSUZi5va0mP/p6++S63hHRlMQY3IFFIKAPH/Fc982vknumH4tAHGahJnHHoKFWI32VI3uZ/8chOkgil/xF1J5m1V3lmsCFMJIfqRRwWewb5f2Vh3fEL2bTmYyMhmhsJmwejWZ43IwneCYR2qjy8VvLAJDcuVPeHkGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5R5k3FE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5R5k3FE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88448C4AF0E;
	Mon, 15 Jun 2026 12:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781525241;
	bh=XyDyXP5oEPHNd1b3RSvcQZ8tfchIZjl+jPtgNruGwLQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t5R5k3FEupqNJGMbdvdXoTqjRepGUTuXrkxJ1qqv9e4zwyN3wOc7FZMNCKuuFJabO
	 myvQRuMpAElvKGYXRricBzHLsnoBT+BYqFILycO3X3c0wVC+7t94N4pblahd2V2yGP
	 1equlwmsmUmC8RgWjCgaiDeJl42qnkdRbxPyYIxrOYLSieh0yfdJpweluGdmmDbcft
	 mSgXmyszW57BHHlAE6qO/CigtzNhR2k9Z+RbCpLkkOI6/REEoRskkFhzhNq3ACOBUr
	 XeO/BKCnvRvXYCkMpQ5jjQVLoPEwbJcH7uIJy/IKc1gVjPmdQsQi/vA9z+zimO2aU3
	 NuAVrbIsePeMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B48FCD98DA;
	Mon, 15 Jun 2026 12:07:21 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 15 Jun 2026 14:07:19 +0200
Subject: [PATCH 2/2] fuse: read fch->ring under fch->lock in
 fuse_uring_create()
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-fix-7-2-next-v1-2-0a4c3908f13c@bsbernd.com>
References: <20260615-fix-7-2-next-v1-0-0a4c3908f13c@bsbernd.com>
In-Reply-To: <20260615-fix-7-2-next-v1-0-0a4c3908f13c@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1021; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=3hEUA5awiqvo0JJwcXM8kQp2TxGP6Af0S0ppwcEAk9s=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLL0X/1QM/Gsv1Mky7fteu8RK3MOjSKJXRnz7yl+0GVTj
 Xl0IvBERykLgxgHg6yYIkuXxB7bKf/4ZNW+rr8OM4eVCWQIAxenAEzE14aRYU+T+qV40aXe6a9i
 w2VMV+76YbN6cm1kjefeC2UKmpIJfAz/y5/+v/aKtYxz/aqoXeoTZGuuHdz57drtFYdcAla/iNn
 2hxMA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

In the race branch of fuse_uring_create() - another thread already created
the ring - fch->lock was dropped before fch->ring was read into res and
returned.  That read is safe, since the existence check guarding the branch
runs under fch->lock and is therefore already ordered against the
smp_store_release() publish, but doing it after unlock makes it look like
an unsynchronized lockless load and invites an unnecessary barrier.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 fs/fuse/dev_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 230177cc06c6..344e8b5ffb8c 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -260,8 +260,8 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
 	}
 	if (fch->ring) {
 		/* race, another thread created the ring in the meantime */
-		spin_unlock(&fch->lock);
 		res = fch->ring;
+		spin_unlock(&fch->lock);
 		goto out_err;
 	}
 

-- 
2.53.0


