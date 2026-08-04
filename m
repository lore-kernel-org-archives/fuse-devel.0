Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292E43328FD
	for <fuse-devel@lists.linux.dev>; Tue,  4 Aug 2026 06:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785823751; cv=none; b=Pde3+bbGF2sFhD4t/CJcRrXOUL9j2JinApw+u12JCEx8E3IaZDH3k84ZEdlubsFqd1ZBgFbQLbuNaplFn7kYXlZ8uniWheapvZ+cSUROHUHsbBMuYCDENg6LDyf2al90qy5YlUrgFw3fLHeZMutRrFZ1ZR1e4fPjMalEeonlbIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785823751; c=relaxed/simple;
	bh=82W1jolxQXWCFZM2JCRJXessZ9IBLu9YUb9lv+2DmGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CEWEMxNl1J8Uc+xJL8c9lA9IEAGKjoLsRHR6ld7XZknv+bX84TsMuIf8C7L7TKCcYsKG1ut9DAIZ24GwXU/66J12iE24xkCIK6qXDKAjESjiJzzqfF2qySdO72Gay3wPQemn1I8FS4r54Ah5wpbZwgT8IbdPvSY+EkF+4TK/ca8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=WP9gOgfp; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="WP9gOgfp"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e512a9a6bso223625185a.2
        for <fuse-devel@lists.linux.dev>; Mon, 03 Aug 2026 23:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1785823749; x=1786428549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tre2t3DqAwsbqOY53Q7DgQbI8TFT+tAJpRwqGOsH2Sg=;
        b=WP9gOgfp6PBL/76Tj49WR4uU3+pSlfAJ82A7ZrH7bW1k6fNKDv+c/k756+7eBPD7+p
         U3udr7Sp8g9YuLpx9+NHC+3gxFp+RFcFoglXxdgqFHArZKkA28oSKTi2J9FpFtyROaQ4
         l0Mcypm3rf/DI7NjC7YBtgU2ORJRCiHzPXLwNRvFiBClslV8ls/WT/FryfPJz+Wyd2LG
         U341FB3eqKUDBaU96K33+EuQaBPBLZDaoNW/Ow+nBxx3jMdTNPp+6K8zRk68SrZtvPy8
         d9kErgPcil9oHTMx8doL+/31VoiB11cufag8/Pfh0eWwzcYNUWmFk4wjIm505PsLaMm6
         LbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785823749; x=1786428549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tre2t3DqAwsbqOY53Q7DgQbI8TFT+tAJpRwqGOsH2Sg=;
        b=Gm61lfBrf5zSckwuCYj9ADOoNjUcfXg2niO1uVMry9iw2fYjPgYX7qIr9aN6gALJWY
         FwcsLRnaRXq8tfgAkNywhFk20Sa4fVIS7/KTIbRMEJonPUUfXCRdT0kxDyMFu1IrQ62t
         SzEOmgx+qvX1JyN1r83bfdFlLSvFf2DpnaZAzAgdEuyM+Azsj9bLtkVt6qW9CEv3+Xi8
         HLTaLRaev5tiVqL0uAoaBZfpzp3pg/xgQCmhhoXxL0PiRWDmSpTIYdjJhEtxl7BfqOHJ
         Xit8t0X3egLChDnBLpusVrgKZXBDtsK8aCOzIs+wJmotyLA8rCIXq/vrJhqfWDApenLD
         Qhvw==
X-Forwarded-Encrypted: i=1; AHgh+RqAshIlswqNyCmjzZ2aevJ7HV0CQJzUfXCGLVJiyJURcnpyxR3LAfZiv1qXmLWmY8w6ApbNu6DUvXt6@lists.linux.dev
X-Gm-Message-State: AOJu0YxWbZpbtTFrO3LjeCQ3MKHbrtk+iwkTAXeXy4JoGzKFec91OvcF
	eSE1aZqX5q9AoLGGsbsiFnmBJUR7dMdkX9ItZGYRzJNHqIOWD0S+FMWcJpGv1Udiucs=
X-Gm-Gg: AR+sD10SfALJ2Y5eLJmiL4mjijb4UjPKSovSHWKt61KERYOPwABGtPDplx5kcGYbRhI
	pPV1HtXtmE3C7XU+IG7O+btmqWCfWEh6zaH7Wvi87s2RHlMaX6hazVHVo2Q+1semijK8I4XeS0r
	fRlqe9jXcpNanC/Eh0TNZ4u0ZPT7ftRwYU+pPP4e4nbq0EKIL1mHstlj3HXD5+AyIFU9ygencA0
	doWSikN4gUYfQQ8Ip74AR3ID0F/DgMS8nPI0nfsil/GkSH87p4PhRS1wLhQGMOWbgSvH28WUfNN
	H3coEpp0ZxtF+YROppN/znmFGcLjf2TXZ33/PLSunt6VvyDXWXBsgSY97KzOOGHvUMugSA0EllS
	eMyf5vpRdhEPxBivjOO8OyOIkVAZpGxP7a0S5lFL++xJJEqhqXM58FhJ41yrBPjlHGcgg+Qb2X4
	NSEMNAIwiY585X86MGGiG/eZGMVbCZ2eiSOSkIyRCNmuC6SExxLgj7B+FqqolfRU/WMA==
X-Received: by 2002:a05:620a:935a:b0:92e:76a1:96cd with SMTP id af79cd13be357-934a0786047mr1718187385a.13.1785823749092;
        Mon, 03 Aug 2026 23:09:09 -0700 (PDT)
Received: from localhost ([146.190.222.192])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-93641748985sm5080285a.16.2026.08.03.23.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 23:09:08 -0700 (PDT)
From: David Lee <david.lee@trailofbits.com>
To: miklos@szeredi.hu
Cc: Kyle Zeng <kylebot@openai.com>,
	Dominik 'Disconnect3d' Czarnota <dominik.czarnota@trailofbits.com>,
	Sven Eckelmann <sven@narfation.org>,
	fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	David Lee <david.lee@trailofbits.com>
Subject: [PATCH v2] fuse: wait for sync init request after abort
Date: Tue,  4 Aug 2026 06:09:07 +0000
Message-ID: <20260804060908.711279-1-david.lee@trailofbits.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyle Zeng <kylebot@openai.com>

After a fatal signal interrupts synchronous FUSE_INIT,
request_wait_answer() aborts the channel and returns immediately.  If the
request is in an FR_LOCKED reply-copy interval, fuse_chan_abort() leaves
it for the writer to finish.  The synchronous caller can then free the
fuse_init_args that owns the reply destination while the writer is still
copying into it.

Wait for fuse_request_end() after aborting the channel.  This keeps the
synchronous caller's reply storage alive until any locked copy has
finished, while preserving the fatal-signal abort behavior.

Fixes: 204aa22a686b ("fuse: abort on fatal signal during sync init")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol Codex:gpt-5.5-cyber
Signed-off-by: Kyle Zeng <kylebot@openai.com>
Co-developed-by: David Lee <david.lee@trailofbits.com>
Signed-off-by: David Lee <david.lee@trailofbits.com>
---
Changes in v2:
- Restore Kyle Zeng as the patch author and correct the sign-off chain.
- Move the research credit below the commit-message separator.

v1: https://lore.kernel.org/all/20260731120353.558833-1-david.lee@trailofbits.com/

Bug found and triaged by OpenAI Security Research and
validated by Trail of Bits.

Trail of Bits has a reproducer for this bug that triggers a
KASAN use-after-free and can share if needed.

 fs/fuse/dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5763a7cd3..deee1585d 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -725,6 +725,8 @@ static void request_wait_answer(struct fuse_req *req)
 
 		if (req->args->abort_on_kill) {
 			fuse_chan_abort(fch, false);
+			wait_event(req->waitq,
+				   test_bit(FR_FINISHED, &req->flags));
 			return;
 		}
 
-- 
2.53.0
