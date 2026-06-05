Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188E93B71DB
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 22:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697602; cv=none; b=ivvyRyfsyf+zPQqArByXNbTLzzH5MGRylqErG17bJ3dv9SC7qY6LA3I4+1t3ph1iRvPErLW3HHS7OKtBlFZfHTBcHG2FAltBtg3KBQJxNCscyGf9765zDS3U96LnbRQ3jbQlnjj5Q4kP7i+aB0cABwhGL8LSdYcWSkD2PqvfUvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697602; c=relaxed/simple;
	bh=OpNjot3JTnQZeq9ri+JQ0nTFwKsYd41nlkzDPgfVPfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MzS77IJGvdfaPo5XzNrddFgstsCUO8Vut7eNIxwLrZ/KWC+uKRFaWPv9izISHQzMIUHsAXIWW+SHO7iH37MoAsOAFExN+4JPCVj37VitgxOe4SglhitJ3HIoseDPrcocebDh9XFfDCCI2SOUDZBElTQVvTd1Oj/b1szRk/HKdtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7tfF1eB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7tfF1eB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4946C2BCB9;
	Fri,  5 Jun 2026 22:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780697601;
	bh=OpNjot3JTnQZeq9ri+JQ0nTFwKsYd41nlkzDPgfVPfI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C7tfF1eBf3yH6t9FJzn2vTVmUDDoKaWwvhI7cCI55IEUgNDadTjPwxo+UojSzOT0E
	 ITOd51nxmnEMtrG/Q4885wo+jrSpTB5DhYufMPyZAI0OcC7Cl+r23G3pqQqLkR9Y5B
	 FjRs+fkqqctPWPIV9mVxEopK/bXe6fUGZXhO2jmmraKiblLQJ4We4NcAsbLQ8hFxRR
	 2gJ3UADDKF3XSF7cMugJWWswIe7fyJm3N8C5z4AMuzU40Utju1bUtEaExmor/g85id
	 D9kndPERL4USTxUVs0KQi8Iy+5vhyB0BHz5HJ1Jgruq/0DfF9LhpC1cZr775F6IDU5
	 irfq4JNsLuh4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1FECD6E7C;
	Fri,  5 Jun 2026 22:13:21 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sat, 06 Jun 2026 00:13:06 +0200
Subject: [PATCH RESEND v3 1/4] fuse: Avoid use-after-free in
 fuse_uring_async_stop_queues
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-fuse-io-uring-race-fixes-v3-1-6fdf5e5b3437@bsbernd.com>
References: <20260606-fuse-io-uring-race-fixes-v3-0-6fdf5e5b3437@bsbernd.com>
In-Reply-To: <20260606-fuse-io-uring-race-fixes-v3-0-6fdf5e5b3437@bsbernd.com>
To: Pavel Begunkov <asml.silence@gmail.com>, 
 Luis Henriques <luis@igalia.com>, Joanne Koong <joannelkoong@gmail.com>, 
 fuse-devel@lists.linux.dev
Cc: Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, 
 Zhenghang Xiao <kipreyyy@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
 stable@kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1442; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=X2I4I+6k4VRNTubfnToFcPaR3hqdHMhFlXLJDCyP2XY=;
 b=kA0DAAgWMvNp7peNQvwByyZiAGojSf7IAbUqifyXmN2ExQoiAsoBRSmBOowCh3B3/B4GUzghN
 oh1BAAWCAAdFiEEihi8PZT+Dh0m9a/XMvNp7peNQvwFAmojSf4ACgkQMvNp7peNQvw1WwD/XKnz
 0hPUlNtLF8bBYvf6Z/4rYjrr/wE7aLWVG3sBhwwBAKBt4X77YYyF1f1LjjgQMAIYFRwiW5pBEND
 k+DzTi/YI
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
---
 fs/fuse/dev_uring.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e467b23e6895..c96d72250830 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -465,7 +465,10 @@ static void fuse_uring_async_stop_queues(struct work_struct *work)
 		schedule_delayed_work(&ring->async_teardown_work,
 				      FUSE_URING_TEARDOWN_INTERVAL);
 	} else {
+		struct fuse_chan *chan = ring->chan;
+
 		wake_up_all(&ring->stop_waitq);
+		fuse_conn_put(chan->conn);
 	}
 }
 
@@ -477,6 +480,9 @@ void fuse_uring_stop_queues(struct fuse_ring *ring)
 	fuse_uring_teardown_all_queues(ring);
 
 	if (atomic_read(&ring->queue_refs) > 0) {
+		struct fuse_chan *chan = ring->chan;
+
+		fuse_conn_get(chan->conn);
 		ring->teardown_time = jiffies;
 		INIT_DELAYED_WORK(&ring->async_teardown_work,
 				  fuse_uring_async_stop_queues);

-- 
2.53.0


