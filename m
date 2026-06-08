Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6297386441
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780952630; cv=none; b=Xu4clphL148Zn+tdRHnd43ixvsX670T5qTFw8Tf7SGJT2ifGkR2F0pMAYTOg9HcDv3b9CDiGrZsorq3CFF7SayxHMm15t1DnQdN2P5xCee8szXvmywCQgjUhUZOGSqtJf/S+bZrckK3oyGusuhaDfnJaUwv1gChj4bMDsiXAWZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780952630; c=relaxed/simple;
	bh=d6APBp1cxeAHl8RZ6oyKRsCy/m42vVpB0ZmWfsTW2zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VekDoBckcs0Ab2SZ0odW2jyEazz++mzF5Kp3nw1A7hXgZAy1rGzEFQiB5Y2fuxmIDWJyhfI0sJzyy7Ro+07DwuJCnx5DOKsjskYtBwcqbBV9QAJsXeJIUekoAYHpt4XRknmnRHrPAP4YSf6T71WuWHMEn14dTQkU6eJKvojvNwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ha/j2/9v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ha/j2/9v"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6C60C4AF10;
	Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780952630;
	bh=d6APBp1cxeAHl8RZ6oyKRsCy/m42vVpB0ZmWfsTW2zk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ha/j2/9vTrqE0EK0f3ikJmpCof71xnooqlFphJCxcVRD/e1XXOiW+gIVwFWyCPJUq
	 AbGvWokeqEcXG4fQOk4OYophMcaIhymovt2biQNT8I1VonUH9NbqVOvVZYBD8jbKzm
	 y8OA+dFKGLSkZfHWks8CmevlhOtvcekp5jV9ihc7aD8HC2B19sM/JbN0y+vrUux6Cz
	 8hFIgxsqeb5nSAMZV3UopymPNSU5a6Bscma3wKaliwfbP4k+ed/CR99VmZ8zoLdXEu
	 xdvX46FIaeFKCsoTfuFWVKkKfdwIBR6GTLondijir6oLn9k0IjspZAo/1nf6tLOW1L
	 qhANyM4UKIFOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8C3CD8CAC;
	Mon,  8 Jun 2026 21:03:50 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 08 Jun 2026 23:03:46 +0200
Subject: [PATCH v4 4/4] fuse: clear ent->fuse_req in commit_fetch error
 path to prevent UAF
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-fuse-io-uring-race-fixes-v4-4-fa410089a0a1@bsbernd.com>
References: <20260608-fuse-io-uring-race-fixes-v4-0-fa410089a0a1@bsbernd.com>
In-Reply-To: <20260608-fuse-io-uring-race-fixes-v4-0-fa410089a0a1@bsbernd.com>
To: fuse-devel@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>, 
 Luis Henriques <luis@igalia.com>, Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, 
 Zhenghang Xiao <kipreyyy@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
 stable@kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=W3sdzqH6BkebRFCnrUCre0PYR7t8sTt4YoX3NM1Q0Vg=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLLU9Uw4zt4JeT8n9JVQyvWjnlL5CzxezVu4qp77vAyz+
 ZI9Cp3HO0pZGMQ4GGTFFFm6JPbYTvnHJ6v2df11mDmsTCBDGLg4BWAid98wMvxWdZG+fHLpHUsO
 JsuHii9WzDvFoTnzaR8j66klizXPG21iZJh97Z4DV2OohxdnWj2bipB3MKPO2dWnpjvs6+rYv8j
 enBsA
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
index 812675a4c273..4aba82d58308 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -931,6 +931,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	if (err != 0) {
 		pr_info_ratelimited("qid=%d commit_id %llu state %d",
 				    queue->qid, commit_id, ent->state);
+		ent->fuse_req = NULL;
 		spin_unlock(&queue->lock);
 		req->out.h.error = err;
 		clear_bit(FR_SENT, &req->flags);
@@ -1229,6 +1230,8 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 	int err;
 
 	if (!tw.cancel) {
+		if (WARN_ON_ONCE(!ent->fuse_req))
+			return;
 		err = fuse_uring_prepare_send(ent, ent->fuse_req);
 		if (err) {
 			fuse_uring_next_fuse_req(ent, queue, issue_flags);

-- 
2.53.0


