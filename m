Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D967A3DB635;
	Mon, 15 Jun 2026 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781519162; cv=none; b=UyW2bKj3RnAfmY1cj7tzfZk1d6qYeIRQc+wmb148ms+aPrF+/vyiWCSI0Jrt04oqDLMRPCfdLeCayMXwxVSib6h2T2TvjaHSOsOxEHPhFspQdwaZY+F+GqGJ60/f43dAzxPcbk380W/EkUH0wVtkx0mAz/ClHiaXEWd1TDAR4js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781519162; c=relaxed/simple;
	bh=u4Vslsm8hT345MAaGWrSh3WTS1aOsil0d/JKfFF2OV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UYxvAwrxf5u4dK1R3mHBuzzNbkQopqE9IggdkbrdBjpbWLsGYF7tAIGtxtEAf879fBfm5d/5hMyyKCokl+a5MFQoS6PIIj/HEdCkVofrsCEL2ALSGBR4drv60gvMxAAJ4t+RaASPDpEnDbusJFEQsCqO8/cyQjb6AWhK9ahulA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqqyjy7M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqqyjy7M"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97AB3C2BCB8;
	Mon, 15 Jun 2026 10:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781519162;
	bh=u4Vslsm8hT345MAaGWrSh3WTS1aOsil0d/JKfFF2OV8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=kqqyjy7MrQeiABvTL4G2LkWQdKZS75q+zjIronZEpw6rV7gz64qTwcyJh85FbDxm7
	 ci3M6a6zK3EB8idfutfvSwIY3PmDwh/5gvY7TKsu9ev4ohXOSREed6b9iKJM8lfd3J
	 p3KXSgkyxm/wpMTqoiFRHK6o1UZhCt1QvfPO4uqoMBcQoBs+ao9CE/yZTuUweDfAsc
	 f0aDUE8Ush366WFzWqqqelT+KFM9vr9rQi8o3cvr/u6+7gqDwOCN0tjraUvIQT6Zwb
	 MkHJYTcwZSawGdVzQ+g3kmbhnlToJ9oNMLT79s7sUewtaR0DJc2lZptTbF4ltkoUxi
	 J0Hz93tNsWyQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DA2CD98C7;
	Mon, 15 Jun 2026 10:26:02 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 15 Jun 2026 12:25:56 +0200
Subject: [PATCH v5] fuse: clear ent->fuse_req in commit_fetch error path
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-fuse-io-uring-race-fixes-v5-1-8a360f055f0b@bsbernd.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43PwQ6CMAwG4FchOzvTjYHMk+9hPJTRyQ6C2YRoC
 O9u8aLGhHj82/xf00kkioGS2GeTiDSGFPqOQ7HJhGuxO5MMDWehQZdQqEr6IfGsl0MM3VlGdCR
 9uFOShd2VYDQ0Gklw/RrpteD28cS5DenWx8fr0qiW6R/oqCTIvHSWaqywVtWhTjXFrtm6/iIWd
 tSflF2hNFOEBeRl48k4+qXyN8XYCpUz5ZXT2oJBr+CXMp/U2oNmodAogMoioPqm5nl+AgG2Rty
 jAQAA
X-Change-ID: 20260518-fuse-io-uring-race-fixes-59760420d2ae
To: Bernd Schubert <bernd@bsbernd.com>, 
 Joanne Koong <joannelkoong@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Zhenghang Xiao <kipreyyy@gmail.com>, 
 Shuvam Pandey <shuvampandey1@gmail.com>, Berkant Koc <me@berkoc.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2103; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=NDmmBuvBA5uUNdQI4TRQ677gpt32rjgzb2l1ZiLAF0Y=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLL0L5sYXNcJa3yaectTd4Vo8tyoc+aL3dvuTJV/k526Y
 LaLTumMjlIWBjEOBlkxRZYuiT22U/7xyap9XX8dZg4rE8gQBi5OAZhI7n+GPzyLn3WLr5+tdu/6
 puf80yWcZLjfn7wX11q86eJmf2XzqjWMDNMOv/vaGr/kqTij6plnBafqvOc9kDhy+oHUhZgOCaF
 F6pwA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Zhenghang Xiao <kipreyyy@gmail.com>

fuse_uring_commit_fetch() error path called fuse_request_end(req) without
clearing ent->fuse_req when fuse_ring_ent_set_commit() fails. The
still-pending fuse_uring_send_in_task() task-work later dereferences the
dangling pointer through fuse_uring_prepare_send(), causing a
use-after-free.

End the request with fuse_uring_req_end(), which handles all conditions
already.

Annotation/edition by Bernd: The UAF should be fixed by other means already
and actually has to be avoided that way.
Just checking for ent->fuse_req == NULL in fuse_uring_send_in_task()
would be prone to race conditions, because if malicious userspace
would commit requests that have passed the NULL check, but are
in doing args copy, it would still trigger a use-after-free.
Setting ent->fuse_req = NULL in fuse_uring_commit_fetch() still
makes sense, though.

Reported-by: Shuvam Pandey <shuvampandey1@gmail.com>
Reported-by: Berkant Koc <me@berkoc.com>
Signed-off-by: Zhenghang Xiao <kipreyyy@gmail.com>
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
This is to fix race conditions reported by Berkant and Zhenghang.

Changes in v5:
- Rebased against Miklos' for-next branch - all except one patch already
  picked up
- Use fuse_uring_req_end() instead of hand coding what it does
---
 fs/fuse/dev_uring.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index ba5edf5d01b3..77c8cec43d9c 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1003,9 +1003,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 		pr_info_ratelimited("qid=%d commit_id %llu state %d",
 				    queue->qid, commit_id, ent->state);
 		spin_unlock(&queue->lock);
-		req->out.h.error = err;
-		clear_bit(FR_SENT, &req->flags);
-		fuse_request_end(req);
+		fuse_uring_req_end(ent, req, err);
 		return err;
 	}
 

---
base-commit: bb43b4c7ea2a8265141aa93240f3f0ca71d85c0e
change-id: 20260518-fuse-io-uring-race-fixes-59760420d2ae

Best regards,
--  
Bernd Schubert <bernd@bsbernd.com>


