Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E2A418346
	for <fuse-devel@lists.linux.dev>; Wed, 12 Aug 2026 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528483; cv=none; b=umfQHb4hmJuqE0+bmT2lni087lpWqZjLYjAdVbKMYVaADR18KYJK6T38owRYjmBurkyGo4TanP6DFhUyvilXk35EmBxAKW7JqpBfSz7Ro/d3VWUJk9do0SWAQaAh2tEsoOqTEHCE4/rI3vCZqIKv0y3T6V2vUcPPWG2sPS/5zG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528483; c=relaxed/simple;
	bh=IfqoZFGbmTJ7IoZMb7y+zk4ULZ3VhowOkmWTKnvw7/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uij2PAinSt8asywQQOPs/zbsbV3Hx3dTULxCqWSQZ81QZPPWkM9wl1u1784rk7bDy9JtySgC7ixdOQpePJDHeBPcJVQlBSfn0GHvgLdUxmnkelIdi9Heow1TFnNzX5wNHzeKlm3sfiS2ZEL/c3kgd5frtzEqljfCzgxWBAkQBts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i8uCJJmA; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i8uCJJmA"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso7840115ad.3
        for <fuse-devel@lists.linux.dev>; Wed, 12 Aug 2026 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786528481; x=1787133281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=td3fCdxPcYCOcpgILhIJ1zG9gCZ53qHXXoPGzD17mEE=;
        b=i8uCJJmA2vA3/2GVuOHGjzTLLyAw1Qmbkw8vE8fjJtgHfdfPbaZTz5lsov/w4TMH4X
         WFpnjzvauRhf2tEKWjI5CdUBSexT3Acfd/Fle0akgZj+ty7s86pWiAuAAa2WsO2Mj3Br
         iqiYI9ysejdwNXvtDkGKRMkv2jg8v8FEwEtlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528481; x=1787133281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=td3fCdxPcYCOcpgILhIJ1zG9gCZ53qHXXoPGzD17mEE=;
        b=KLmdgxh5OS7XtxQ+R1K8AhU+wgEOIbjUoXAUklW+EdR7lVSFnUKnCf/lP9alTL0QCz
         s4uh3YrzIGcvkbH39n+CSn2k1xVU6BNmqBAV0isCBf3SUTUPtZBA3f1m6pMo4JflY+dB
         BSIDeeideDQXvofSa7XdlqI4rrD7vhmPQXb4FjubJCJtaqPkVp5h5toEAGYjYeoyrs/h
         UhCgMsIeMkm1MXab6lwdTg3WsA8VfGVrgC8Unj2M2ZmlldV0SeZBcohw/A97W8DhkCgs
         cWl/7kUQ4oDslaYo0aEqGfmJRFxPCndyxYth7Uk1R7D5bX+aiCsqsE9mf8aX9n1JLG4g
         bbyA==
X-Gm-Message-State: AOJu0YyoOrY7Bjf5qQC14QPjfS8mOH1kT9aEhkhZHfwqGBA3+4xxoL1a
	/lA/x2EsiE61V2rBIiJx5e5nGG0H6epK8HQ/HCTgReyI1Q3LLDDxTcKznMqDRN6m6+/yY88+G0V
	Pq24=
X-Gm-Gg: AR+sD13pGpO4MjWWyi/q7AjFk0aqge9nwQuPtCOnAorVdfacY0mZJUuTX+GPkFAE+zE
	cuBuDZg1KqfP9K5BjdMtB/mBV3hUBwcb6nlqA450TM7yYGZLmUwP+D/H/aYwUP1cH8AxP1pZ18e
	I53H6RpAgtm5bHzo3rlmKeXGcStQ3OrJTFeAx0ljVg9cW+5Qumy08eAUrJ2zUqOG1umgX8L8GXx
	tR22XIG+Ppj8665GlWXeBNJDzHe1yFlsjLV1+OnNo8GhBAncOxNUdNKXemoUuJ0H0PW6kMvefL6
	vYHJ+lrvYir53LVOvz1ZpthrwySKd7LSBA7ePWWB9/HjhTfceOq7fMweXCElLgr8wnfZPAZ3kB+
	ymkdFYXM5vrKPZD6AUPBimnpBqB5PX4EyjRPcqsfy0OAJDLAGH7RGbM5mP2zu744jRyvK/jxLyC
	7zHwQypIgkEQiPTkF1e4D0kDR6dC4/Tcz/w1Dxv3BYUnselZy6nzq8FC+cgCbvG6BTjb4FzMlry
	bK2biELuUzIbhW4wChVHqN15g+unoS93UkisPVgFQKLYQF4IJY=
X-Received: by 2002:a17:903:2305:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2d34569b9demr33087725ad.16.1786528481279;
        Wed, 12 Aug 2026 02:54:41 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:6d46:aa38:60df:e1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35220c8edsm3953695ad.66.2026.08.12.02.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 02:54:40 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC PATCH] fuse: permit freezing while waiting for request answer
Date: Wed, 12 Aug 2026 18:54:20 +0900
Message-ID: <20260812095431.1216919-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suspend freezes tasks in random order and doesn't take into
consideration producer-consumer dependency that may exist
between tasks.  One example where this can cause issues is:
fuse server getting frozen ahead of clients, which then get
stuck waiting for req answers that never come (the server
is already frozen):

 PM: suspend entry (s2idle)
 Filesystems sync: 0.018 seconds
 Freezing user space processes
 Freezing user space processes failed after 20.001 seconds (1 tasks refusing to freeze, wq_busy=0):
 task:ThreadPoolForeg state:D stack:0     pid:7873  tgid:7854  ppid:7827   flags:0x00004006
 Call Trace:
  <TASK>
  __schedule+0x554/0x1320
  ? vprintk_emit+0x2a8/0x320
  schedule+0x5e/0xd0
  __fuse_simple_request+0x4c8/0x6d0
  fuse_do_getattr+0x1e9/0x320
  fuse_update_get_attr+0x362/0x6a0
  fuse_file_read_iter+0x13a/0x1b0
  vfs_read+0x29f/0x2f0
  ksys_read+0x75/0xf0
  do_syscall_64+0x70/0xf0

Make all wait-event calls in request_wait_answer() freezer-friendly.
This uses TASK_FREEZABLE_UNSAFE because often time we freeze holding
locks (in the upper layers), which triggers debug_locks warning.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 fs/fuse/dev.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 27dafda2a841..9e98ece4143f 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -703,8 +703,10 @@ static void request_wait_answer(struct fuse_req *req)
 
 	if (!fch->no_interrupt) {
 		/* Any signal may interrupt this */
-		err = wait_event_interruptible(req->waitq,
-					test_bit(FR_FINISHED, &req->flags));
+		err = wait_event_state(req->waitq,
+				       test_bit(FR_FINISHED, &req->flags),
+				       TASK_INTERRUPTIBLE |
+				       TASK_FREEZABLE_UNSAFE);
 		if (!err)
 			return;
 
@@ -719,8 +721,9 @@ static void request_wait_answer(struct fuse_req *req)
 		bool removed;
 
 		/* Only fatal signals may interrupt this */
-		err = wait_event_killable(req->waitq,
-					test_bit(FR_FINISHED, &req->flags));
+		err = wait_event_state(req->waitq,
+				       test_bit(FR_FINISHED, &req->flags),
+				       TASK_KILLABLE | TASK_FREEZABLE_UNSAFE);
 		if (!err)
 			return;
 
@@ -741,7 +744,8 @@ static void request_wait_answer(struct fuse_req *req)
 	 * Either request is already in userspace, or it was forced.
 	 * Wait it out.
 	 */
-	wait_event(req->waitq, test_bit(FR_FINISHED, &req->flags));
+	wait_event_state(req->waitq, test_bit(FR_FINISHED, &req->flags),
+			 TASK_UNINTERRUPTIBLE | TASK_FREEZABLE_UNSAFE);
 }
 
 static void __fuse_request_send(struct fuse_req *req)
-- 
2.55.0.679.g6767b8d81c-goog

