Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186A736F918
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 22:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697602; cv=none; b=TVe1d8dd4riFLzCQpqG1v16L1f7uZYnUMxC7fFEmi2eCx1at/uI/x5/NVQiLSxRZFAcSsv1oBmYU7LTjvC++y0gx1mLxUlS/kd/tcnTzkccZLRiMgiYCDgz4cstx0qbtyUcHzFE3iw/1X+yY39KkN/JBVcxPxMzMhq06t27YE4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697602; c=relaxed/simple;
	bh=J6KptcaQBq4KPovDIcfaQ+JmIINLYYuyLx6GdCcTrrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GT3yLgyTI9WdL4cvMPKTvkTcd+9dO2ESA5lQpYh+ZVOv2Eg8lBFVQi0zSgBoS70xnSSqjan61IMzyEAJ9gFnbv6/+l9g0YMx3eFV5UFDunkghKJiEPcqG7Z2RWkASv2t5HVi0+UBrHSgzUuXaYqNi0SF9y7wV5oUZCAJOgM38FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCJtA9Fi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCJtA9Fi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBA2AC2BCF4;
	Fri,  5 Jun 2026 22:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780697601;
	bh=J6KptcaQBq4KPovDIcfaQ+JmIINLYYuyLx6GdCcTrrI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UCJtA9FivhKJdzRnMmu1UoB11LVznaqqg93bn4J4+P3yHC9ibCjBS72dLO46y6o4q
	 FEWu5Q+RcfG1TRN464GNBEOtet0cJDzMYl2tP52jj3B5tlnmtnvYHY4bEkmPl4TeH9
	 f49BRQxKSXykfPPGFSKwu5k7FbI9SagomBCB3d3lo5e2itYRmfEdTFUAzPwbmNG93x
	 Cy7hMcSqmq3RHskFw32Lltc0xMHhgnrQmjlRrWsCHXhFu9nq0CxHPnQ0/zyyqTeVbl
	 OEwG5OVL39HwHDkrNUCP9aIDgTnjihA9RGIRQNk3mqqQa4rJp1pWTJ2TPEU3SlPWJF
	 i1xYtluCfLNAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4099CD8C86;
	Fri,  5 Jun 2026 22:13:21 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sat, 06 Jun 2026 00:13:09 +0200
Subject: [PATCH RESEND v3 4/4] fuse: clear ent->fuse_req in commit_fetch
 error path to prevent UAF
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-fuse-io-uring-race-fixes-v3-4-6fdf5e5b3437@bsbernd.com>
References: <20260606-fuse-io-uring-race-fixes-v3-0-6fdf5e5b3437@bsbernd.com>
In-Reply-To: <20260606-fuse-io-uring-race-fixes-v3-0-6fdf5e5b3437@bsbernd.com>
To: Pavel Begunkov <asml.silence@gmail.com>, 
 Luis Henriques <luis@igalia.com>, Joanne Koong <joannelkoong@gmail.com>, 
 fuse-devel@lists.linux.dev
Cc: Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, 
 Zhenghang Xiao <kipreyyy@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
 stable@kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=tYtRrEKG1PHNzaqyDaz7VjNICWcCdHWNmTzgi1CbCj4=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLKUvRhO8VYc49dwZ9Vb4cF0eqVSuN+NHpvSasa1GSsbl
 lTPn7m4o5SFQYyDQVZMkaVLYo/tlH98smpf11+HmcPKBDKEgYtTACYisoeR4bbWB5t7yzLdJr5h
 lJ7wmb/4Yeftzrnxk4XKo3dYeYXpf2VkWHVE+LJ5g+uz2U7mUpceeseUWc3Yt29xsvZh5uuJAvs
 DGAA=
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Zhenghang Xiao <kipreyyy@gmail.com>

fuse_uring_commit_fetch() error path calls fuse_request_end(req) without
clearing ent->fuse_req when fuse_ring_ent_set_commit() fails. The
still-pending fuse_uring_send_in_task() task-work later dereferences the
dangling pointer through fuse_uring_prepare_send(), causing a
use-after-free.

Clear ent->fuse_req under queue->lock in the error path, matching the
pattern in fuse_uring_req_end(). Add a NULL check in
fuse_uring_send_in_task() so the entry is gracefully recycled if the
request was detached.

Annotation/edition by Bernd: The UAF should be fixed by other means already
and actually has to be avoided that way.
Just checking for ent->fuse_req == NULL in fuse_uring_send_in_task()
would be prone to race conditions, because if malicious userspace
would commit requests that have passed the NULL check, but are
in doing args copy, it would still trigger a use-after-free.
Setting ent->fuse_req = NULL in fuse_uring_commit_fetch() still
makes sense, though. And an additional sanity check in
fuse_uring_send_in_task() does not hurt either.

Also reported by: Berkant Koc <me@berkoc.com>

Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
Cc: stable@kernel.org # 6.14
Signed-off-by: Zhenghang Xiao <kipreyyy@gmail.com>
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 fs/fuse/dev_uring.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 5dde86e8653b..df5103679c8e 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -935,6 +935,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	if (err != 0) {
 		pr_info_ratelimited("qid=%d commit_id %llu state %d",
 				    queue->qid, commit_id, ent->state);
+		ent->fuse_req = NULL;
 		spin_unlock(&queue->lock);
 		req->out.h.error = err;
 		clear_bit(FR_SENT, &req->flags);
@@ -1233,6 +1234,8 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 	int err;
 
 	if (!tw.cancel) {
+		if (WARN_ON_ONCE(!ent->fuse_req))
+			return;
 		err = fuse_uring_prepare_send(ent, ent->fuse_req);
 		if (err) {
 			fuse_uring_next_fuse_req(ent, queue, issue_flags);

-- 
2.53.0


