Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9855017557E
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993484; cv=none; b=rECHa/8ckURCJbRIL+MOQUx2+kpuVC9m2v3gbi7LO7dEivUuvDl9o7owtN9cxN0OCEGX7Pyi+Ax+JeI7n+F7hMwe3zcfZFPnHyOHIsVn6l3545EWe0qlezZZ0Twl3WJSUrcSXyJi/1yn9/aMVBzXIaI+kpDiqG0US1t2wR14J9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993484; c=relaxed/simple;
	bh=D7hQthI24TUOmYZSBBzqmTJV2pECdtD4Gko53OL8QA4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qsKhkmQkytUv0nkmKtc7vSW9ftYemCJDsnxLuU3tGNDq58NzEtiD8D++pud3u3/jT2mmP+hG6MJ/ORZRgIqGsM+se3XAIXBOBPNVFUdwMD85LnfSS93Zsn1+Oo7wYZ/Y5aRTMqMrgBcfsDMv9KcH0H3L6UX8yfKcRJ8CZ2/ScYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JM3OcRbg; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JM3OcRbg"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-827270d50d4so6732221b3a.3
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 18:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776993483; x=1777598283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpbjFwf7JzaR1cHhQU++mPPiZcYvIG9e93yGGOBVt8I=;
        b=JM3OcRbgFVTGXDZ95Y7PVQwNRrwXh2QcTRoTZJQ5CHWbnm777B5OLDHHIjltvuQZvl
         x5HHksZ3F07po0p9LyBcJHnZ2/fat8+ctrGqM9mroAHcrZ/K5meaG0qN6eieZXav5M6y
         s9kgmmmopJavDDZGhHSLPUCZAwM+XsYKxhZzllCwLf0aHjj5z63+qX6XAblpQ3Ft2/B9
         sNcqHKNXMXwyX6XLnS3GG1+HR0+8h45gP/34WIyQux/sAwjrWXE7xF0N8F1B/Sx9NfF6
         2VgKgCa/NGDwshwRfPoYBMXRmCYuX9DNehRTDcmM1i70gZApxO8FPP7NatOWkaZpiPSb
         dJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776993483; x=1777598283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jpbjFwf7JzaR1cHhQU++mPPiZcYvIG9e93yGGOBVt8I=;
        b=tOb3C11nN/iY66Wvh/CXzKMtcSylD4mAQ2AePp+8hcMguibmbrMmMkV8I6IGJFfXoG
         vbPCNfebpTgoeg9mikSnQka2ecfpIl2WGl6GvFwaxU7MGqIeNUgFlTVrNv7kT0fJNAX/
         dCVnOvup0GTjuLdxpRgrsfb6PhZLfAiuHG9NiD3z1qzwtpy9ZzFGacO33GxaQzh7miV+
         5vS7LWlNJbNNvzHe7BWPwP7fQDSYucV6ZtDmMZB0CBeNCwkDfphLZA93bgsnH9tnPol3
         FosuudY5w3bl6y+dcEIffUeWU4DkVfw/mooaX0ugxHcM5x3YBvQARW4MWCnQR+VhdsiX
         GQnQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mlQwbGphSiTx+sfrSSCEEe61YE9dXcz49+Pg+0cbpTP6yjhQsQzvQBoyW5ek9yIXH8oYLEeebFqAk@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl3kKp9YBsvKtKPvln4C/I9WuahCP0hX3XFEnAejXKf6JEevzV
	9r5rOobhJpj6gzODfBJydj6n+TJcoHfWxwG2fqxMjcw7JXFhASaulGEWpDq4WQ==
X-Gm-Gg: AeBDievSY719J5/3ugKeAHXIWDwyJ0B/y9yBDriRPPa18B5ShYW/XK8WWsqGe/4mUFc
	IP2NZsOoJNzw2+T/07qA4Wi/Zh2HjQqRRPHwS5dMYz1tSJ8geEcubDbF/Z7OfgJcj2wOm3QQbQi
	sm6lyLr3W/7pUdoLMPleEyC2xKD4NYREHGqXkswcXAGatB0GjxPl0fT+hYj0pIGf8RbBMSvZIqm
	LmzNOzucejYXu44K5U/Ztlhug3IdyVUV8V9GJbRq2HncuqR7t/SUdMG6rbdqohbtlzyJ8+xCBRm
	ksSB0rHxK0o5XqMB9JLJ8wqSFxnEFn308Hlt93sCjHpy2/9gbyh/ZFG/FujLHBW6j+XIdlxZK8R
	gOtqerQCAhUWOayGHXUnG49rp/96b7apSBwfNHvviLTve2Wit1PMwvPb9RpaXvk4DELJLO8kCP3
	Ypr4bt+13lbOTbKDU/rZBKVW8kKJO9jMTr9ieokPg=
X-Received: by 2002:a05:6a00:8011:b0:81e:12f1:d8a with SMTP id d2e1a72fcca58-82f8c90497bmr31618897b3a.34.1776993482866;
        Thu, 23 Apr 2026 18:18:02 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:59::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981992sm26080442b3a.7.2026.04.23.18.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:18:02 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 05/13] fuse: clean up fuse_create_open()
Date: Thu, 23 Apr 2026 18:16:38 -0700
Message-ID: <20260424011646.457682-6-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260424011646.457682-1-joannelkoong@gmail.com>
References: <20260424011646.457682-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove goto with direct return. No functional changes.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index c5b3cb001147..4a6c9e2340bb 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -820,9 +820,8 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 
 	epoch = atomic_read(&fm->fc->epoch);
 	forget = fuse_alloc_forget();
-	err = -ENOMEM;
 	if (!forget)
-		goto out_err;
+		return -ENOMEM;
 
 	ff = fuse_file_alloc(fm, true);
 	if (!ff)
@@ -908,7 +907,6 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	fuse_file_free(ff);
 out_put_forget_req:
 	kfree(forget);
-out_err:
 	return err;
 out_forget:
 	flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
-- 
2.52.0

