Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D2C32B11C
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 18:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226721; cv=none; b=E2J9ZSKrjLz2DStw/g3u+pxhj5MzzjVAePjhdF5a3+XewbrgRIOA6ZVJV7HJys8qXVK7wHR0Q1bTFcIOcrAAXNwO/z3NOvEQoBwmrVy3UVJpMcmJNzwJXZspcaA2JkCajcY1xP5Rc7Sxe9e9Rk0lZjCjSGKAz+S1ftPFVU/DTHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226721; c=relaxed/simple;
	bh=VT18DXOtgt7oi0I3B0HOPYZr70omh2IjfVSy6WXbX+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fpuWR7lrMf7KmEablR/4n34aK3sfLn9aykgjQsE/40ZQ8dhWKBx0M7rOz+gsHTrmqXFfxxCWQc3Hp67xTRGFHJ+5ZLHsoE/x8LNHGAUIQH6v1NlKkPhqa2gxJVhVLVOgMDo2IowRqC1w6XeXWsNzZ+OlH2ZRiEwq3Me/PGWcAUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTn3MQtB; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTn3MQtB"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4513435cdd2so2873460fac.2
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 11:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784226719; x=1784831519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHB0+oZfaIMt3j2ttBM/Bcj/urTp1/X6MkZ1JSUewnc=;
        b=cTn3MQtBJPsUU1suC4LZOJogaJuzYsibNTQuREUpfNE+lXgtezbHK4/73LfUCpI5If
         cH36Dm0MFPcAdqJyqVv024ldR6Dcd9hjdyRyrkmaR0TCmYwS6aAYymMX5J7rOtf95qYq
         rx+uHeSQXksDnspTH8DomAPK8AyxdIDWDJCb2Ti2MBMMp4j/D0jZm/efLSNHRGBc/eTF
         r5o94qQJQzi5mGO7gbhH7+B60MBcLq6creFC9cPbKJlM+KERB2icAemf/fqBXdikJL2r
         Si2NM9rQJhEo8ZO7Rzhv4dqXmeVPvzdO1SOC/apMR9ntv+Cvnazh4ERlZS6ydSXSa0eu
         /vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226719; x=1784831519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OHB0+oZfaIMt3j2ttBM/Bcj/urTp1/X6MkZ1JSUewnc=;
        b=AxxkpLnBVlN7ReRoP1yMNlcV2hczfospDf7wt4csXfuAejwMlG0sdYs1cmkVmpb81g
         p5823MMEbHYB0b90BrksZrMwGub/TLdSYd2pIJ6AihgBORKwFwI2YEqY6reXBLYZmi+D
         VLMtGh+uBGWF8eIrxEK0Hfl9a511AloFpOsKwpYunEt4oPatpH2w17Gq+5QaGi3Mr+zj
         OAx5V+LDvy4JOiIhrNeuQmoqdaklXlG8qa1LZiTmpY7jrohK5YkgQG+2K1ILHgApBYKW
         +m2lvDGNR1I1+7Koy6GZTu77kj20oSq2NEFsYJIosucfsfGBfknjo+GsqctGVx76oQt9
         QdAg==
X-Gm-Message-State: AOJu0YzYocc1VT7VH7QzqsSAsCFiSgHtOvs93l5OyXCLS5mGnmi3Y27X
	w8V9D3na4kO6M2VDc6kBJKAISAVEH5ZL6RQpn4Bvz6qLgU0Jsi5Jh+0X
X-Gm-Gg: AfdE7clTk8YVruB28HEQB77bvQQeqFXxO8XFo1LNu92UqmLWdlmigj++dule8s5wyk0
	Tv8sG5YMVj9F7wMb3Cf54w2yym7hZ9SWMjOUZJpfGrrFaRdVBHjW3ffsXvi6eJ8paynOEDfCIV4
	9ZpD7/1e2+8OT/hTfOlkGustsuOTFFQ8UzRQ1SOP0OdIHYZ1W96uytH8GPpLOqorSmyduq/DZnH
	t+YP8dhWTzS1xqtjYGB4ht0l4qrjlWRbKTYVSm9O7+DEg/x4rg6ZyvrVf32UE5a7sO5KN/W9aqy
	Bj8kwyeaaYrISc7FjIDAlrqbm9uAkVF8DzwvIh44X37ERLBEpwBjADMEH3COdfJpMh1BLFdl62T
	iN3cHN2yB51VVIFQyzczDbS9d2YVw+9WhnK7vp1AwIYAEWKp3u6QoFxNOzzrI++gN8Xurbdk6VV
	1FHYdhVNhECxAzkOcQBAF+d1pPWVUojFBvP9f8hCSrachXQp1oLaCp
X-Received: by 2002:a05:6870:e99f:b0:43d:20f3:bc86 with SMTP id 586e51a60fabf-4560aea3309mr6716076fac.0.1784226718966;
        Thu, 16 Jul 2026 11:31:58 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:8::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm20985156fac.7.2026.07.16.11.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:31:58 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v3 1/3] fuse: fix missing barrier when checking io-uring readiness
Date: Thu, 16 Jul 2026 11:31:42 -0700
Message-ID: <20260716183144.2710480-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260716183144.2710480-1-joannelkoong@gmail.com>
References: <20260716183144.2710480-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_block_alloc() reads fch->initialized and then fch->io_uring.
fch->io_uring is set before fch->initialized, ordered by the smp_wmb()
in fuse_chan_set_intialized(), but fuse_block_alloc() has no matching
read barrier between the two loads.

This may lead a CPU to observe fch->initialized=1 but fch->io_uring=0,
and skip the check that blocks request allocation until the io-uring
queues are ready. This can reintroduce the lock-order inversion deadlock
that commit 3393ff964e0f prevents.

Add an smp_rmb() barrier to pair with the smp_wmb() in
fuse_chan_set_initialized() to prevent this.

Fixes: 3393ff964e0f ("fuse: block request allocation until io-uring init is complete")
Cc: stable@vger.kernel.org
Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5763a7cd3b37..bd3b48c4fdff 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -85,7 +85,13 @@ void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_param *pa
 
 static bool fuse_block_alloc(struct fuse_chan *fch, bool for_background)
 {
-	return !fch->initialized || (for_background && fch->blocked) ||
+	if (!fch->initialized)
+		return true;
+
+	/* Pairs with smp_wmb() in fuse_chan_set_initialized() */
+	smp_rmb();
+
+	return (for_background && fch->blocked) ||
 	       (fch->io_uring && fch->connected && !fuse_uring_ready(fch));
 }
 
@@ -120,9 +126,6 @@ static struct fuse_req *fuse_get_req(struct fuse_chan *fch, bool for_background)
 			goto out;
 	}
 
-	/* Matches smp_wmb() in fuse_chan_set_initialized() */
-	smp_rmb();
-
 	err = -ENOTCONN;
 	if (!fch->connected)
 		goto out;
-- 
2.52.0

