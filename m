Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F703AEB49
	for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137403; cv=none; b=iPY9zetB32CMS1fUw33jHYqTgD78a3am2/oveuvsecY7yiKCiTyktEutxQpfDcRR4764Im1Arb0LqeyzkVxYsdG3TeaGlW4L9l3mn1GQcEN5UfXsa3xq4Fuqp7JnTAoTHL2TxNslQMc3BKD6ixvlg1FQ+W7VaIqTiXFYnLNitTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137403; c=relaxed/simple;
	bh=yfpLtXbd12CAgBQljtOJxL14HOrrTCHBVY/qg/gGY+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQqfeH8tJQebucLCuUxaVNN5+8paTd9OpMjW98zlnE36/lndCdvBI+d5bA5WqtWuwEVCP0JUeTL08+9Tv7uDYWMirywYJbc+OLg/nKUI2LMKSFlNDERV09+18CFTiCdKbZ0Og2KughQuBW1y8Tv7IdAX8kUbxuHE1YDSa8jtn18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1pLR+XP; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1pLR+XP"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4563ac048f4so474108fac.0
        for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 10:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784137400; x=1784742200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTsgM1jD4A2z9rUodHyuFm6DsVyqIgLrQWyt1V+WEqs=;
        b=C1pLR+XP+XG5sQwS8AsdzhbqIM8OwvWMWp/5Sti0lKoOOfUWJwM3UQVY4HIdPR9xJt
         7bMC8BL37Nz180xH6UV+8SB4+ZFFn+vdactvtPl6TGlH9MTkcHmJgF7IxdZao5Vhqkpg
         sfOtRvPIOQBwd8OZ6D3fw6P6DW+b823B6U3g2E/NwBFhWIURCVE6Td+339LhcjXrrOqL
         s1H2Jx0AoxTd0HF0x46mINz37zRXZtYlVG1k9h5wIZkaYMp3J3+fVHJAj8Wz49c3Nghp
         jyWfrStCMVoJYt9dHyVxlcHwTlckV//JC52oiGMFsQIg0eDL0+QngVnrVAzsK13+CGqz
         43cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784137400; x=1784742200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTsgM1jD4A2z9rUodHyuFm6DsVyqIgLrQWyt1V+WEqs=;
        b=Fnw0dktsr/1Tya71HZqNolf28WqNSwV9+8h7CdVkhvDJGx+udmjCSvYmDlJTzN5MKU
         1Pj/5rgg4WE+fe5AU/QJXdtLx0ZoF8/HD51LntCT0v6q5An5IMqIYfIX6NC9ERkb0N/g
         lfOvXpE49sqLTDhZFNYOV+RUEKJKhesEsJUq/t+13u+HNM67x2JB/FOOqQplz6JyuQ49
         sR5LRqURO4XUu5TZxBil6KmK/C5SGWiiXkvO4rqBo1EbgRGE/uZZCAwWlYeN3RS49T7P
         bTnJ8zXnNZQ28REaR7cUATphRCCxEWf61XkTkf8kYZ4KMp1CaoTCkJUMqBZIxNf3CY3A
         Gh2w==
X-Gm-Message-State: AOJu0YxRs2Up8bmWRpUGtCtQEtzoKd9vf09qefAxEchZ7J2x/9AnZ6gS
	jjP2efHIEGd9K9xeqGEWjFTzRjFFwt91GaoDX4x6ubHgHBNSKL4+P7yX
X-Gm-Gg: AfdE7cn7f9HLrGFL2Fz6x8nbIQYdp7Hrp28gnOWBZ5YTfU1AOc4VhrR66FYFy6d8B7r
	FDUaFN75YoX3u2IPV0KwaJ0Pxqep2lBnNkTJFacR9QYVDBQSvguMeim2VjeGzaOZnUX5lJRt7oV
	D3lErMSE1lbT1QA0DLiJSLljQlAuG/tyK2v0XF8njQmajWEraeF+BENRaLKKKVlKNFuy3NUmNtq
	BaMaWVLuyEqh1QaHvHbLMwojn3G3P5Z3TYwGmduCoQ5FsyIelpSpOk0Y+eBSSZHhyzHZm4mRCau
	nwG5MUBctnLRfzSEsE9okMsnc/7WwjS0R0Iap1TUdVAZVjCMFaHmehaXijEq46uHOc4cXg6a2J5
	KzJHSCTdJwwY9i4fBfpr3+eIPy82PS3IKvQ/MfFOOuJiz5MyH8kkhA4asugIjYIFkLwcDtfjvlQ
	CHc4fN15PzPACoLMtKplYsvb5jjJYiLFUpW+wsRj8m2Y9avt2fpdrM0p+BzdyA/3GZ
X-Received: by 2002:a05:6871:5214:b0:448:a0ba:1252 with SMTP id 586e51a60fabf-451f13dc253mr11282031fac.26.1784137400551;
        Wed, 15 Jul 2026 10:43:20 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:70::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-455c73a335esm9219859fac.12.2026.07.15.10.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:43:20 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] fuse: fix missing barrier when checking io-uring readiness
Date: Wed, 15 Jul 2026 10:43:03 -0700
Message-ID: <20260715174305.336261-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260715174305.336261-1-joannelkoong@gmail.com>
References: <20260715174305.336261-1-joannelkoong@gmail.com>
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
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5763a7cd3b37..b70c536d7e25 100644
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
 
-- 
2.52.0

