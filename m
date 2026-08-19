Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F30285060
	for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 02:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787106954; cv=none; b=OcWAUTRG3t1k5ZQv4VJLwrQNjU/BqYN0RWxNFoHyfUMRb9BhfrTmMzqa29Pd1vUZRtg9qIrSYxdlZPuGrBbZjZHohw/RbsLon/Tm2y0mfA53eQVmMwi5p6gdOK1kyjcXnFSow4m1tzLNIQNWiHkPsNBX0PywwlkXR6flmLqlXp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787106954; c=relaxed/simple;
	bh=MGB/mqhi8W6a1vzmw4ObUd0+yGy1NdQ8CGy/1K7LuuY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pbrWaOk0sl+QQVO2+k295P2/0pY+fE6JxVLsdXK6QN8lnI7/JaBj2UJV8m5n2O2Kq1HimCf6Hevt++ca9ZnQmneLyK3aIn6f+QIw3X0M/f7HnJBHg6MPdRFp3XgqljgWxBYAYlthX0s5Ne8831rT8mpIrJONn0ji+qzG1M5mZdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZP1wyUTj; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZP1wyUTj"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so500758a91.0
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 19:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787106951; x=1787711751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fnopDGJQWguattVYFhYi/U/9aUtBjohp9pt2UySh4cA=;
        b=ZP1wyUTjpw/RTCAmn8kQk0RX/84c5ffJ8IfPjoM3Ix30sAtRym0aPMg0Fo6UEReEqt
         Rs8GfzIiG7xJTPoOI161Y5AFWyfFjdj0pgymEeMQBLaKyXQgCwyi1MxSskh27CgzJ9v1
         H37Z+MROKgwJNVXM6eKbAkQEZvYKA4L7aiZE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787106951; x=1787711751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnopDGJQWguattVYFhYi/U/9aUtBjohp9pt2UySh4cA=;
        b=YNBUiT2E1oy7sTtQND4Xbor979LMMOfwIHXY7CbE/FpKlgCyn75/e8yzTQkFtW2C5x
         C1skDabjfO756sBBU5qsx4t/8WAGOzMl1h/MWeYzou2uvZlns1CZmDkHfC1TgKOGBgMv
         l1FacwbhPgXCpieAM4VU+B+G67FvWtFrLxgHDBhthfGot0E4y9wpqOYqB16j4aTDcsRr
         p5peiV7rypk6L2rT6HFVeeM7iXEd9sTdmosqrqZWtPXo02rPPNin8bHuQ7Wcd3nYqVD2
         JsX7+ippxubTpxn20UppprOdsjgbe6wH8Qzax8amvLgw5jfcFJhnjGqEaiaycmwRRJY/
         PjzA==
X-Gm-Message-State: AOJu0Yzk4yHpDLtXZPKMEZSKyKJd6r4PGMSgO7FXICum7z5a0hr3hB21
	qpSBr62v2BirgYKWJZ5rrrQYkXxHBqTE+AUzD6wyMA5CHDaXqWWbGN2EHr7v+nd6s4YaQB2ezSk
	J1Wk=
X-Gm-Gg: AR+sD10sNao80qhXOM1BS4RNwV8hxlUzGqzva0Sv73iA9X9uxofvbVf+aXwVemyxwhH
	vQZqdbIBvAvF552OySBVPmOacrHFNanbSHUhmSgX2WKzAF4s66aMuBcxlS2MNbC1+h3koVLLgeC
	R/KExSS7n0O272b54IFVt/zWb6h6x0DaOwz4KVl5OrYdbIstv6TRS/HJHJcdc0xzQNtcYSzE4of
	Ruo13ivSMqbIBMEx9M4Frugak1gpJpaxtNc1dNZ5oqYAv6pkhG2KmS/zLTwLYGrzVu1/74ZjCIg
	Imn9UTueDYkYi66Sr9oEBEWed54tJSdywBqKqQ2HDwsoRRJBCyEGr6S5MBivGesu/MxksdHnLpc
	enoqZVaWurM4ZSsI2x/mIdbxtNtUni8U4oYMV1Z0v8mujRYH6bJsdUtGpO+js0qaAJHXdh79vT3
	QeMYWtWPM2+CjPaRdVKizwzWzkfwyuTld5mso0QQwaWnIuSjreN1ZqgJP7abNzNiS2vczq+tMtq
	EgVKVUdFPAROWzgOyfNCtZTBS0jRp+6ay8icZ9vAel1ATJ5u4uNx463k2EyW/4=
X-Received: by 2002:a17:90a:da90:b0:395:4de9:b30 with SMTP id 98e67ed59e1d1-39580a9aed7mr2767237a91.5.1787106951448;
        Tue, 18 Aug 2026 19:35:51 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:cdd2:63a8:1c1b:5219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f95a68esm769082a91.0.2026.08.18.19.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 19:35:50 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v2] fuse: permit freezing while waiting for request answer
Date: Wed, 19 Aug 2026 11:35:35 +0900
Message-ID: <20260819023542.561653-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.55.0.737.g08866a6d13-goog
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
is already frozen).

Make all wait-event calls in request_wait_answer() freezer-friendly.

This, however, doesn't address all cases.  E.g. in-place
PM-freeze of a request_wait_answer() task holding a contended
VFS lock still will block suspend.

Note: this uses TASK_FREEZABLE, not TASK_FREEZABLE_UNSAFE,
which may trigger debug_locks warning during suspend (if
request_wait_answer() task holds some locks at the time
of freeze.)

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---

 fs/fuse/dev.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 34106f6e66a0..42098ddc2587 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -701,8 +701,9 @@ static void request_wait_answer(struct fuse_req *req)
 
 	if (!fch->no_interrupt) {
 		/* Any signal may interrupt this */
-		err = wait_event_interruptible(req->waitq,
-					test_bit(FR_FINISHED, &req->flags));
+		err = wait_event_state(req->waitq,
+				       test_bit(FR_FINISHED, &req->flags),
+				       (TASK_INTERRUPTIBLE | TASK_FREEZABLE));
 		if (!err)
 			return;
 
@@ -717,8 +718,9 @@ static void request_wait_answer(struct fuse_req *req)
 		bool removed;
 
 		/* Only fatal signals may interrupt this */
-		err = wait_event_killable(req->waitq,
-					test_bit(FR_FINISHED, &req->flags));
+		err = wait_event_state(req->waitq,
+				       test_bit(FR_FINISHED, &req->flags),
+				       (TASK_KILLABLE | TASK_FREEZABLE));
 		if (!err)
 			return;
 
@@ -740,7 +742,8 @@ static void request_wait_answer(struct fuse_req *req)
 	 * Either request is already in userspace, or it was forced.
 	 * Wait it out.
 	 */
-	wait_event(req->waitq, test_bit(FR_FINISHED, &req->flags));
+	wait_event_state(req->waitq, test_bit(FR_FINISHED, &req->flags),
+			 (TASK_UNINTERRUPTIBLE | TASK_FREEZABLE));
 }
 
 static void __fuse_request_send(struct fuse_req *req)
-- 
2.55.0.737.g08866a6d13-goog

