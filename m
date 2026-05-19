Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7A6332628
	for <fuse-devel@lists.linux.dev>; Tue, 19 May 2026 05:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169263; cv=none; b=NX0CcRpSGSYlIo/92IHVjNwSNzarhwD9ayflfKHXbLbfT4leN9+ZZih7irzyi88ih2T1sNIcPdreCaVvTgUpTLpurRAZa3s4dkkKHKhcLvowx1SBWgPSUSY9kHg2W78W0ALvIEuXjwdyOyW56uoAcA6ZJzyAU9NgVwTI+1F/L2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169263; c=relaxed/simple;
	bh=OQbleJL4yAVyUvV63NOb8s6YEAQMgMl3/cmA+8Sehjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qu/WbaQnek2+k5oj/Gci9s9Ec3MTaXRLGDtOTsThwgFVskAsxQtnCMwTQkf3AQBYouK7bkCnuy6+30dqLrqZEOdrKW2fUUJDJHBVp7kNDEWqYPw73TmPXvLKHUwenNBb6qdw7wNcS+oTrJqavMk0LzuMz3o10VxbPc9+NW06CIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bu9LE70C; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bu9LE70C"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7c52e49d978so25624467b3.2
        for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 22:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169261; x=1779774061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=43pbQ5ZD2eCg2UHToz4qgl0khUcjpV2e1snhFPWHvs4=;
        b=bu9LE70CG30XeESPxWQbTVkyFlxsCuIbXVzdh7dLEjSGV/Tdx9a2gxMVkgTLo6Z35M
         0t8XxBetMvc7cw7X8J5qGgsnnuDo1/CZxB/m6jVjb1C+tr2fqeMi352tBLsuWiLseoxG
         cy/oITVZaWh1NLtaoKncwM54EJHNkr4xdmW/IquOTXnFj6RdoFjYDlByI+PYqyFKW6/p
         LSc+NllYAmJ2cigpjK3fMZ9RcAosRxWrXmFCiyaUmKkZbqKTpU7UCXl62r8IGO9uLTC9
         g+AxVPRG4foGCU4eJz7mB4pjXUVI5B3kTdOKgTEIR+eGRGvrH2zDjhpwb4CBYsw+pSGA
         Dxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169261; x=1779774061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43pbQ5ZD2eCg2UHToz4qgl0khUcjpV2e1snhFPWHvs4=;
        b=Eq7MosoPc11GTIxZEvKcHJ0n4oss99aAHlITzeeoeJyvtfcfI2kSarjq2l/a5TXSS/
         7A0ZozPkWFku+OkR6a1A2j0DJdW01kdqjwsoN2zZe2wN42Nz8qkALwDb4h5UJem+7M1u
         KxzjwkH/zfXc8meWlQXV3ECRmFE6e2+dHSxMYZAkjLABFZgmz+dymCub5WpGBj0C0bu3
         E2a4rjND9dPJvB0OzldizjakNkUlYDH6UVy+2dbNiEWYnkxGUyBTmmrL5Sa62sU/cC8V
         Q/2y3VNQqjHg0zauDSY+MG0hnPVKxzo+vTn3BiIQc1Zn86Lwav8pVZHHw1Q5OLUHCtb2
         oflw==
X-Gm-Message-State: AOJu0YzvKPoaNzMY3El0EdIOarVdDKeH5WiwUuv6h4SPzmAUw5V/fPRW
	3hUW0Cuat/bV8zeCP3C+wqbGRwcJzS9RO0tlAsjxrBfh7PiATDKw+rkN
X-Gm-Gg: Acq92OE7LR0nDJGvHptKCm7G1xC8VeWtQ3tjPCcoMi7GRVicfxcTWz9YbfCPRe/Nz8w
	qS/KNsMRu+XFHvOmryJPuCeDeuzxqdWreBlSuRDDt1O3TMjBWcs8dhOkvy1OooioKm8bM45B4mQ
	S++zt3Y8AQ9c+31EGDPls/XvL+/5rCXUxLuMwbmntPFHTnQo4bsGMe2WsjEsCBn4p5Pz+XXfED9
	7sMD2jUz4roFBqsCBfsGVvj53WSBw+qAUQHvZN6RPGtYWRnin+wt0W++GM6v7vnCDjGT3islvmM
	7pa3iePsgSq6jyJ1j6fckqJp44SyudnST2Z82FXNpDK+sKr/jrxr2HnhvUHkMUGMHIRwAiLrJXS
	BnnRI3iOpgtpeMyqtfLDn0PHePrK1InIR6VOnx491OWHus8fC8Or8GwlljJGVFSMOob096lUWPG
	sWTOUVXYfj9dAI+8t0hD3R
X-Received: by 2002:a05:690c:885:b0:7b2:bf20:cdc3 with SMTP id 00721157ae682-7c956752091mr206361557b3.0.1779169261234;
        Mon, 18 May 2026 22:41:01 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:42::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c939asm32250337b3.6.2026.05.18.22.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:41:00 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	stable@vger.kernel.org,
	Lei Lu <llfamsec@gmail.com>
Subject: [PATCH v1 1/2] fuse: re-lock request before replacing page cache folio
Date: Mon, 18 May 2026 22:28:06 -0700
Message-ID: <20260519052807.1924269-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_try_move_folio() unlocks the request on entry but does not
re-lock it on the success path. This means fuse_chan_abort() can end the
request and free the fuse_io_args (eg fuse_readpages_end()) while the
subsequent copy chain logic after fuse_try_move_folio() accesses the
fuse_io_args, leading to use-after-free issues.

Fix this by calling lock_request() before replace_page_cache_folio().
This ensures the request is locked on the success path which will
prevent the fuse_io_args from being freed while the later copying logic
runs, and also ensures that the ap->folios[i]->mapping is never null
since ap->folios[i] will always point to the newfolio after
replace_page_cache_folio().

Fixes: ce534fb05292 ("fuse: allow splice to move pages")
Cc: <stable@vger.kernel.org>
Reported-by: Lei Lu <llfamsec@gmail.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index be4e66ed633c..37b11b89ce1b 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1158,6 +1158,10 @@ static int fuse_try_move_folio(struct fuse_copy_state *cs, struct folio **foliop
 	if (WARN_ON(folio_test_mlocked(oldfolio)))
 		goto out_fallback_unlock;
 
+	err = lock_request(cs->req);
+	if (err)
+		goto out_fallback_unlock;
+
 	replace_page_cache_folio(oldfolio, newfolio);
 
 	folio_get(newfolio);
@@ -1171,20 +1175,7 @@ static int fuse_try_move_folio(struct fuse_copy_state *cs, struct folio **foliop
 	 */
 	pipe_buf_release(cs->pipe, buf);
 
-	err = 0;
-	spin_lock(&cs->req->waitq.lock);
-	if (test_bit(FR_ABORTED, &cs->req->flags))
-		err = -ENOENT;
-	else
-		*foliop = newfolio;
-	spin_unlock(&cs->req->waitq.lock);
-
-	if (err) {
-		folio_unlock(newfolio);
-		folio_put(newfolio);
-		goto out_put_old;
-	}
-
+	*foliop = newfolio;
 	folio_unlock(oldfolio);
 	/* Drop ref for ap->pages[] array */
 	folio_put(oldfolio);
-- 
2.52.0

