Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E354446F4
	for <fuse-devel@lists.linux.dev>; Fri, 31 Jul 2026 15:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512839; cv=none; b=PqflRRKr6ppaqIZ5SVGBBWnbfaN1mDotPWyuOk5frFUWEfMkQsCHUWBwBWKLbAK+mqww4BS5ehGm+BeFFmWuyeirQ50EF/zJPxmKnW8um/QJYRNwGE3eH0YOa9VTtI7urD99rL63aLGDEPI1RIxgJE6EhJVFgTxTS5XbVeHXg5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512839; c=relaxed/simple;
	bh=q9fTxzQBxBbEOD0ugwC1u9DmGKFny8cbzCFkkk/qHaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i8BQvR9ti4qY3wSJZPxSw6OGsrowEWv8mhFp0bzU8l/MBvySDOkTNEAYZt2uHwbplEgFU2IrTp0I7cm3Mv+nh5wC+cyUBM2spzOvgb4Dn/JArNUMIyrCvlmDaiH19oSuchN5goujSTwXHQbaF9PmjHAVqB47+ShPBtzYxhsIR/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VgxyQ92C; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VgxyQ92C"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8487214ad2bso1729621b3a.1
        for <fuse-devel@lists.linux.dev>; Fri, 31 Jul 2026 08:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785512837; x=1786117637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ztFk56Q0jQFdzSj0FNqD8W6vnZr/B9xHGh5NLKm3eIQ=;
        b=VgxyQ92CSKawkmEsEJly8Zix7OlYsuFdgIIjm9VPRuALcavZyjjDA6VwvWKuN5Slo/
         YCwl2ip6tDmv+Dlw9qisoH2i4jPh3cepiplHr8TKzXwA4+POkkTDmBZUh4meci0kQEtm
         cyq7DPyIGpkpPW3oh+9qDea2EsF4J9ntK7p2h8fmG1hvSaLx6bIdW2GLwkRanGGS0jn6
         fPgfZcTrW2WUaUiXqG+DehAzEz86SxDVG9aIqTxJ3CXKU0+E0LLVFr4mse2fR6dIv7dq
         XFUNJRrAGVj5GtYRLxwdauZPHAnwoOwA2wsUoGjlwMyjtIImXwNh1AxACqSNO24/QJpB
         Sj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512837; x=1786117637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztFk56Q0jQFdzSj0FNqD8W6vnZr/B9xHGh5NLKm3eIQ=;
        b=TKLwZ/T5OEKfdgJW8ct7zvNOLRxEnWZebvz6Q8oagt+Cs1EQXFDORE7tHLuf/EkfDn
         2peDhDX34Zw/v5NHlo2wuJXhmQKDdGSO8e0xDbShqS9AUx72JHTlSq3dGBy0a5Vb+UeK
         pqQtjYvOFaCEr9vGEdL/vif2L3EKF9UaoeNqfV+tMyrcxxbXhlb3giBbQQzxf2tgG3sK
         LqweVZuyrbF+mxJFHc9mi/TpbRoMQJ+aHxLiRT+zOUC7N968uoIL0S5mJAdPwGihLRjj
         O76YWixIUKi2i8gQix6PdRo0GVIked0hwqjNXq2AuOdo8697MpWz1cdodIrhTH8sSOBo
         cZOg==
X-Gm-Message-State: AOJu0Yw3lQoDA6mJc/Jg5Iejh5kq58hwNQEyHC5a85kOaS55y57P2WJU
	jsYdsWX63wepqTe+iStTUPD8nfJ54JyvGrt3oaFJCQdDAaVLgk55xnW5
X-Gm-Gg: AR+sD13xPRFZ38IdjqU2vwgfV4t0GKJYUc3rQQ5uc9K4QTE+fzzhWQLeFLBHI0GWZhK
	3QaJ4mptCOdwO7+1mHSZuKjpEi5OkXez+d5XTdiyitqFtafdTuFYY24X2LfJAfZmo/pNctGEnfO
	92eFWb/9i3XL7EWq6sa/H7ot9TVDI1+lcl/gyOAvfkZm0ZlhKKfbt+tze8nJmUFUUrLLEKUUaqF
	vvFTgwSxct62hAJqg4kknkt4x8IrKuUDkdgDVVqIF6ZIXF9e0fQbrbwo1bSzV4klkwjkkr5LyHR
	jkUip0RK3oCe5usTY/pRWT1Ld9lXTGXxgqgKN/RKUOg49HferXKpi6iI1NPKBmytmQaR//ncUUr
	Hc/RYvuafW2+x5QGO9OvMHi7RlawJ2UwJIeMmdh8GwthcQaCYJfkAvjsdCLMeUY8DT9BO1w598O
	mAXTgSnu6H6dmpWAS6dieb+3iDU2Y5Boi3VorE8aGsAZBSgEMWH5o9SSs=
X-Received: by 2002:a05:6a00:e8b:b0:848:86cf:267b with SMTP id d2e1a72fcca58-84ee4956bb8mr138216b3a.61.1785512836463;
        Fri, 31 Jul 2026 08:47:16 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39eb13dbsm753566a12.29.2026.07.31.08.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:47:16 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fuse: use min_not_zero() in fuse_init_server_timeout()
Date: Sat,  1 Aug 2026 00:44:36 +0900
Message-ID: <20260731154440.1117457-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_init_server_timeout() limits timeout to fuse_max_req_timeout with
the same logic as min_not_zero(), and returns early exactly when the
computed timeout would be zero.

So use min_not_zero() instead and return when the computed timeout is
zero.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 fs/fuse/req_timeout.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/fs/fuse/req_timeout.c b/fs/fuse/req_timeout.c
index 6cc6fc491343..95a1acd7bc08 100644
--- a/fs/fuse/req_timeout.c
+++ b/fs/fuse/req_timeout.c
@@ -128,18 +128,12 @@ static void set_request_timeout(struct fuse_chan *fch, unsigned int timeout)
 
 void fuse_init_server_timeout(struct fuse_chan *fch, unsigned int timeout)
 {
-	if (!timeout && !fuse_max_req_timeout && !fuse_default_req_timeout)
-		return;
-
 	if (!timeout)
 		timeout = fuse_default_req_timeout;
 
-	if (fuse_max_req_timeout) {
-		if (timeout)
-			timeout = min(fuse_max_req_timeout, timeout);
-		else
-			timeout = fuse_max_req_timeout;
-	}
+	timeout = min_not_zero(timeout, fuse_max_req_timeout);
+	if (!timeout)
+		return;
 
 	timeout = max(FUSE_TIMEOUT_TIMER_FREQ, timeout);
 
-- 
2.43.0

