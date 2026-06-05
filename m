Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187B53B71B3
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 22:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697602; cv=none; b=Amet7/f2NvEQ8ANSW6RvyPdLA+GRN8j3gGN8cMFmtmTWEDQdUoStsxD1VOCZUhblcLuzM4mLdeA+QuA2SAdF0kmEVyqWIDkqyKWuJcjjMwrSB1WRQZvVptl/B4FCAKej72uyHDKq4Wul4ko0ugXsiTDYMwtLyrvfQK0A9EZK+jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697602; c=relaxed/simple;
	bh=zzcjR3tdjVAc0vSCUYm4sf9kV9JI7lchlMuMEr7MUhQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q3xEe36OzKCK5YABU6TglMhANfDgURm1jz/VFn1fjQBc7JRR0xnXXaK+XWdrFgCsWq+szxK+oxMbtUEaiCqGItYvExpmpV/06Whb5WHUnTn4ho7WXAkR4fKuzUEv1Ma7HXJ0KrSj4/IqhZFUcwo1En9Jo82U9KdG8mmXaRn4wrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edsypr5n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edsypr5n"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8D6EC2BCB4;
	Fri,  5 Jun 2026 22:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780697601;
	bh=zzcjR3tdjVAc0vSCUYm4sf9kV9JI7lchlMuMEr7MUhQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=edsypr5neiO11EhlaW9GvXwQ75peKM/O4+moXgUncGzXPGvBKk2RV1gbI3vcyKgWs
	 WUxPjaMNRTjQ+2XZlZoUX9TVPmIAEyZKtsuTH8djjLIGz3H1dQWqmdLTiTVK1+OSlO
	 EIzQf03bc7Jxk0D/ju45xAmH8ev8ncT9TYQZqYV82rRvzrGt+8dsAX9SvbgqOh6A8W
	 2avQNT/pvyPv+I7X3douuTtMOCP2YhrESYTT2way3FYXTYl31KuafuRIhiiDQQYSFh
	 fhixxaJSI8UVXygE3Zh0Dh3ZhFVsv1iYjyPuyc4y8Hp4bcxLwOOkaz2V7y5kp7dBXq
	 DYkoHI1zmNjAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDF0CD6E7B;
	Fri,  5 Jun 2026 22:13:21 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Subject: [PATCH RESEND v3 0/4] fuse: Fix several io-uring race conditions
Date: Sat, 06 Jun 2026 00:13:05 +0200
Message-Id: <20260606-fuse-io-uring-race-fixes-v3-0-6fdf5e5b3437@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Pavel Begunkov <asml.silence@gmail.com>, 
 Luis Henriques <luis@igalia.com>, Joanne Koong <joannelkoong@gmail.com>, 
 fuse-devel@lists.linux.dev
Cc: Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, 
 Zhenghang Xiao <kipreyyy@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
 stable@kernel.org, xlabai <xlabai@tencent.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=zzcjR3tdjVAc0vSCUYm4sf9kV9JI7lchlMuMEr7MUhQ=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLKUPb+tW3dDuibgg+rBPYsuveMurakXu+uzyeL0sxynT
 Ms/S9KEOkpZGMQ4GGTFFFm6JPbYTvnHJ6v2df11mDmsTCBDGLg4BWAi10sY/orkhT8pD70bISOv
 LLyjymwZf22q3ueiX2qu1q5a2e3Wcxn+1+9y/Prr/kqmjn3n8gQSeY7uklzkYHc10+eIcyjftSO
 WnAA=
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

This is to fix race conditions reported by Berkant and Zhenghang.

So far not well tested yet, update about that will follow tomorrow.

To: fuse-devel.lists.linux.dev
To: Pavel Begunkov <asml.silence@gmail.com>
To: Luis Henriques <luis@igalia.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: Berkant Koc <me@berkoc.com>
Cc: Zhenghang Xiao <kipreyyy@gmail.com>
Cc: Joanne Koong <joannelkoong@gmail.com>

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

Changes in V3:
- Just "Fixes: " and CC: stable... updates and removal of security@kernel.org
  in favour of fuse-devel.lists.linux.dev so that it does not get lost

Changes in v2:
- fuse_uring_add_req_to_ring_ent() needs to re-initialize req->list
  after moving fuse_uring_add_to_pq() from fuse_uring_add_req_to_ring_ent
  to fuse_uring_send in orer to avoid handling fuse requests
  multiple times (Joanne).

---
Bernd Schubert (3):
      fuse: Avoid use-after-free in fuse_uring_async_stop_queues
      fuse: Avoid queue->stopped races and set/read that value under lock
      fuse: {io-uring} Make a fuse_req on SQE commit only findable after memcpy

Zhenghang Xiao (1):
      fuse: clear ent->fuse_req in commit_fetch error path to prevent UAF

 fs/fuse/dev_uring.c | 52 +++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 17 deletions(-)
---
base-commit: 040d71ac647099f7bb5e480fcd74ba68abc3cb18
change-id: 20260518-fuse-io-uring-race-fixes-59760420d2ae

Best regards,
--
Bernd Schubert <bernd@bsbernd.com>
-- 
Bernd Schubert <bernd@bsbernd.com>


