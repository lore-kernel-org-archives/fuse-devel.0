Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A613CF03E
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 04:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778821027; cv=none; b=LaAOZl9jWJez5kopjE/zX+dZkM8Se8Xbsetu3/lw88zcvVx7A1hKewo145pWL2S25yBKw+v1VLmfkKEjaPL4YBT5+tgDpm08Dzf4t6a9ISajJUi9kaDh/7fJSCBj+L7aXeOlmZy1IWX8MthSMBWfMA7GcvuNl3pElI38aVfBLJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778821027; c=relaxed/simple;
	bh=8anho4fFafOkQ7VO2BHenK+uWV+NyCTbuWoVR44uJFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDxcNY26Aa+4Q2YznJgHtuQ5VC+2yX2bSkIYi6jVoM3PudYOGHoOu8mZJG4mqYXtL5bqQ58eG/InYiBLqkp6VWb/oxFpKWZmdx63w/7NCmroV4db5lQ3O9AOEFcP0BjLPyl8MXvuopLbmrMJ0Ar3xk4fG6Wrrv0rehaRH9IwMt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDCgt36P; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDCgt36P"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65d071aac6eso9929018d50.0
        for <fuse-devel@lists.linux.dev>; Thu, 14 May 2026 21:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778821025; x=1779425825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edgngAWE4Uy3YSnzl78s2yIdpRinkyGEnbGIaCerM2o=;
        b=gDCgt36P+F88k1qdPeiOTphFvqPs6SHXFXMSGTysf+rRwLrZfN1NBv2sDjHHeB1XgM
         uQY6xoIKoCDMK8+ndAC4Vm8+l1A1gz4ocrzunF90cGkczmKZtLVRqoI7BcEeouRfdkNu
         uWZ7CgM8rCZ0lAqbZGfN2ylyXItISjj8rCBqzeehL8nJmPfP4G6BcyB8vOLXNhzvaSKW
         1cBHp4Eh69Mabl9BDrBxzD0nOvOpqh/bM6xxMvsTWXnpvHs6ZfypjsFkiP/LXpLr37LD
         y5qTQpGzwrvxQoRtAfo/h5IpoSowyK/O8nhVfcPM9TwbBh2maDCgQ+WDymPk+pYtpVEY
         bnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778821025; x=1779425825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=edgngAWE4Uy3YSnzl78s2yIdpRinkyGEnbGIaCerM2o=;
        b=NQ1f7esVywi7awva4XVR4r12qvaeCi2uWY1/mHp0G/FZA2HpO8lWrY3W8aknOTpBZX
         q6Ctq1c9OL/l0khdGPnMStu9k6KC/LJ0GZe3ikbt6JCtBskj6XFsH/biLJh+6eMfvZA8
         YRZobOQNW3rjoUitmwkpj/81ZYG6InxgtPzyOWJAqggPWJxZ9yDCaCFB+oFK5OeR1zow
         y8t3AioFdLvVg/MptYTVGlYcD9nANBQ0RoYQ+2BRJ734G3dlgLqeG3LJqmx+mv+C0z6z
         EQSzP4fIynb4g4vW6Oi5RYlnpytwlPpqaZ91vYRvBXhKAw/VV2Oh3REUZtJdwVzpTCzq
         q73g==
X-Gm-Message-State: AOJu0YxoQ0VmShU+Tp7DIrgraavS2mhs6PsTWwrvRvAHvv5r9dLYH9em
	nEyFyWd0HLUV0j1HQqMhhwkYbzy6L0GeLQSoW+/9W5397qeb8ZNHz2Lc
X-Gm-Gg: Acq92OFnTcRFXDaOs9wVD14tUZguS9NVEN2np1tlrUVqqSLyhCzlHNLTFRjkH6x2Sox
	9EI76OvvguwFsusoGhNy8n8r8RqVB9sLe7aR2oegu+g81OxYRhNkMfGO009BnLcHO6y3qyGC/qU
	0ghJUw7jr0nOumJXyBATRDGTwhlR32D3pJQnIPlNQEw2ziPIQsu64BAfVo6ipoMxQ9Un5IfXKtA
	QAnvQBAptTAWNIu++qaW73dgBkOgVuPp1m3VjOVv1HHAd6ghEQuSJBcZmo5rZjbf8RzCo4h7it5
	bX+aGqYMd/UwsrOD2d7L8z8fvzF+huhjHzymfdiyWLr/r0aMVUiv1hhwoTr8HL6IQN7NbtVz0Mf
	XxN0Gyi7u0JjggMI7OlWy6tGI4o6h3jY76vddjsuG+jt2b4XD+xyM//h0A+BxodWPDcBNHTmkt2
	Rb/Nriq7dSk4XOME61bA==
X-Received: by 2002:a05:690c:e3c4:b0:7b2:9347:7bdf with SMTP id 00721157ae682-7c95c202cf2mr28579087b3.37.1778821024944;
        Thu, 14 May 2026 21:57:04 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:72::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f55ba65fsm24152597b3.36.2026.05.14.21.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 21:57:03 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	bernd@bsbernd.com,
	ali@ddn.com,
	horst@birthelmer.de,
	Heechan Kang <gganji11@naver.com>,
	stable@vger.kernel.org
Subject: [PATCH v1 3/3] fuse: fix moving cancelled entry to ent_in_userspace list
Date: Thu, 14 May 2026 21:55:41 -0700
Message-ID: <20260515045541.1171335-4-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260515045541.1171335-1-joannelkoong@gmail.com>
References: <20260515045541.1171335-1-joannelkoong@gmail.com>
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
Fixes: 4fea593e625c ("fuse: optimize over-io-uring request expiration check")
Cc: stable@vger.kernel.org
Co-developed-by: Jian Huang Li <ali@ddn.com>
Co-developed-by: Horst Birthelmer <horst@birthelmer.de>
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

