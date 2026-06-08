Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0313E5A18
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780946555; cv=none; b=QTXvh+O6T7tTukGO/JYWB2jAWOIgPcTO3BFSFGc9UgUq5Zl7v3cn3vI5C/JTcNjGphlpE6YAiiCKqC5wurrtMLBNBCSLvOYsJJvoNTA6mfePyjffasLTdLZgZdoUZDS2nUAIuRgid6eURDGCTrEaicXLWnuBq1ink0KIeAkW2DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780946555; c=relaxed/simple;
	bh=xFF3lSSBF4PfSIr4aBdQGr5g5KVYRTIexUn5lDRaoFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psMhHdysIwsay1oCVgUc9Ww07nPB1D/WPSf5Ghe+5XH+ZzkGy7wYa+JPLHoZ9i8ooJxeIWrGgnlE89aeQFPPIHhrplBOR+p8YehnJGhVosgjZk3T1f2wqzEB3duIj2qy8guHRBhu7gP1M0DSo+qD5oUVp3NPXp2X34dRY1mrR7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPwNqkZV; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPwNqkZV"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-842338c18e0so3298816b3a.1
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780946553; x=1781551353; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE+QkRviOm15Lrq7IHBkUE4kg+YsYqKqrrbCDpmsEMQ=;
        b=WPwNqkZVZjqd2ku2Bd8Pe9TmkoUt/dOkdPnqaARvab6DhZJzL2biuaKGWKm8s61wgm
         SESTmg6/LWUOWwsPFGNUYU10OaNMMfbfpLYtNGNBfqJoK/+86qL/bFPDbApMOzJ7Ad+t
         zEqJRytX/Ay5ecrIbP4F/JfZ8n+q51dZXTT6FAvdbZIagy0MYpNHJCaa9lGihwWhkCPa
         0uSH0bevzSmy32MKltAQdM9V9gig+FpSHmn3HjZfazVY6g8kVpq+AzdS7u/kkSKIgsPN
         vMM8nkTfgSLNCdXdWIhvBxf2PLzjlktbi0EKAQcIrNk4GK2IGmTfokq5i5fTZJfeZu8L
         r38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780946553; x=1781551353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YE+QkRviOm15Lrq7IHBkUE4kg+YsYqKqrrbCDpmsEMQ=;
        b=MHOORRkwkc8IlZi2iXQG2OTxAA0ip+KlSyUvU2y/xGcz+zCEKczPz9ekdJvV8yDsKU
         NE6EjTA6umb/kE1vUIBjdxi15mFKPjUdECyN5l7BqZRHh4tTq7hTD4/I32j/yen3cfDQ
         ylJdoa4PbYthLna1j8wb+Zczl6jHNZgnpwsHI+c4plI55okKGpk975l/DjjfNV24mEmp
         pV6sMqN8dQknlpcqTzHucE8Vj58B592aiYyDHPkwSylDfQNz4WH64XCqC5oNytGEZSsS
         jatHkYlRnAyDa0LzDNUMJRNCjx/NaoEQzIMyRKJwEDuAefsB/pVh5vwirIFBJ81Hs2tn
         iFFw==
X-Gm-Message-State: AOJu0YwNNYs7byqKe7yw3Bqb3Mjo13zQH980rWsdh1KIk/dRZZYjV3ad
	C3LVmRu+BsN0Rrqs99R8ggWw4xpbrm9kuFBTWf5toJ09iRY2T+iGuvmXU6HR9A==
X-Gm-Gg: Acq92OGQU/BsV/DhN2LabFwYasyuPTOpRLEx7Y937LQmdQqER2ogeAjDf9rAZRiBJmA
	3M/7Hc5qZ9e93aes/wVBXraAgVvtJELLAwoIODQUxgxIXQvs7sqS3wNF8A4Hl4soiqU2r4r7TjE
	5Y6w6bNbbc7Ytv3hoW4E+DR/0/Gy+Dn4p5k3ZEZfarxcUOZYBx1QMDPhrxAja1x5ZPoHmNwh+sM
	+4+vQv9FHSTco8AOuiUSgoqXzt0wk0C4lmo/Oh7jBlSkRVbX0fdYN1yy7VCVv+DOOy7ZSEvVn1D
	NMdFhOrqxVKSSVBDH8QNX5hacw4onhqbVIpXYe63AW8tb6MVrsIG0jbV3hPO/QPoRyF3spAA3/o
	jorpzdYgBLgZ3LAq7gCE/kXPB2GYuQdPm7TapNpDMshNYWn0pId/XJyU7tSrsSL5Esoc1wCBpdg
	94TWgqD+Fg3R8hZloY9jX382jysRBz
X-Received: by 2002:a05:6a00:8d82:b0:842:46a6:e2db with SMTP id d2e1a72fcca58-842b0e88fe4mr18535319b3a.19.1780946552582;
        Mon, 08 Jun 2026 12:22:32 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:59::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828821c5sm17637440b3a.32.2026.06.08.12.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 12:22:32 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	bernd@bsbernd.com,
	ali@ddn.com,
	horst@birthelmer.de,
	Heechan Kang <gganji11@naver.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 3/3] fuse: fix moving cancelled entry to ent_in_userspace list
Date: Mon,  8 Jun 2026 12:21:49 -0700
Message-ID: <20260608192149.23294-4-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260608192149.23294-1-joannelkoong@gmail.com>
References: <20260608192149.23294-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_uring_cancel() moves entries that are available (these have no reqs
attached) to the ent_in_userspace list. ent_list_request_expired()
checks the first entry on ent_in_userspace and dereferences
ent->fuse_req unconditionally, which will crash on a cancelled entry
that was moved to this list.

Fix this by freeing the entry and dropping queue_refs directly in
fuse_uring_cancel(). This is safe because cancel is the cancel handler
itself - after io_uring_cmd_done(), no more cancels will be dispatched
for this command, and teardown serializes with cancel via queue->lock.

Since cancel now decrements queue_refs, fuse_uring_abort() must no
longer gate fuse_uring_abort_end_requests() on queue_refs > 0, as
cancelled entries may have already dropped queue_refs while requests are
still queued. Remove the gate so abort always flushes requests and stops
queues.

Reported-by: Heechan Kang <gganji11@naver.com>
Tested-by: Heechan Kang <gganji11@naver.com>
Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Fixes: 4fea593e625c ("fuse: optimize over-io-uring request expiration check")
Cc: stable@vger.kernel.org
Suggested-by: Jian Huang Li <ali@ddn.com>
Suggested-by: Horst Birthelmer <horst@birthelmer.de>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c   | 6 ++++--
 fs/fuse/dev_uring_i.h | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index d9108b5b5db8..f4ba64a1796a 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -511,8 +511,7 @@ static void fuse_uring_cancel(struct io_uring_cmd *cmd,
 	queue = ent->queue;
 	spin_lock(&queue->lock);
 	if (ent->state == FRRS_AVAILABLE) {
-		ent->state = FRRS_USERSPACE;
-		list_move_tail(&ent->list, &queue->ent_in_userspace);
+		list_del_init(&ent->list);
 		need_cmd_done = true;
 		ent->cmd = NULL;
 	}
@@ -521,6 +520,9 @@ static void fuse_uring_cancel(struct io_uring_cmd *cmd,
 	if (need_cmd_done) {
 		/* no queue lock to avoid lock order issues */
 		io_uring_cmd_done(cmd, -ENOTCONN, issue_flags);
+		kfree(ent);
+		if (atomic_dec_and_test(&queue->ring->queue_refs))
+			wake_up_all(&queue->ring->stop_waitq);
 	}
 }
 
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index 368f4d0790eb..22ec67e39ee0 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -150,10 +150,10 @@ static inline void fuse_uring_abort(struct fuse_chan *fch)
 	if (ring == NULL)
 		return;
 
-	if (atomic_read(&ring->queue_refs) > 0) {
-		fuse_uring_abort_end_requests(ring);
+	fuse_uring_abort_end_requests(ring);
+
+	if (atomic_read(&ring->queue_refs) > 0)
 		fuse_uring_stop_queues(ring);
-	}
 }
 
 static inline void fuse_uring_wait_stopped_queues(struct fuse_chan *fch)
-- 
2.52.0

