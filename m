Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC1F2F360A
	for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 17:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965261; cv=none; b=CLN6ii3h19JEy1u4j8/19gDNXby3BiAuJzBrJ+XsAnSWkE+75HWR5FBisAXEX/nkbQPwDdR/K4r829I1JooJQUkttP+BV+PMcDBJ9LbHpD9dIrSROisGeKqaMmoHORzHVTSb8U0GUww8p4oH3L1Xv5+MCapAqfTQyE5zLokRmiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965261; c=relaxed/simple;
	bh=/8x+/sj8c43rBjOXg4cS8q1nWgbWzULZaiu5dbO31kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCmgjw7p3YVUVXvYMzUnRbGFBAe8o7zYMiZWV8+rDqXb+AP66Kbta57HWnql5AbMxJWF71rTHa0Ba0Dy7qR+z1t6sbIVGQ/joH0ZvOK3qF2ARDl3Hr2YovTZ0F2j6arDTLFGy+uhdmxsWaUZwZ/bgW42GyZasV9eq2hlBLpxa4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHTM/POJ; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHTM/POJ"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-49c38a4f110so131931b6e.1
        for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 10:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783965259; x=1784570059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzedxX/pazFMQj4gQD8R56KnEWLF9Jh5wSuFx6cj81g=;
        b=BHTM/POJP3nFn9pl7SfKn3GjWpLfFNPGHKge9THTLYSDjQFyufMma2WwZ2Y+GBZAz/
         e5LaY0oYWIjVeHRYgUszVPA73SfGwwJqsmoQCPqe8XYisA+AWa+fFOZo1Vg5MDfoHl07
         fQl7uKR5JhFXeZN3cW89uZcUprxhj++bKKpHqiYLoTtM1ukKzxRJXfkdygiuciOiuqen
         vyoXyQLqHt8f6BQIUkpa+s+QqD5e+Hc/qLEKNaEn/p69e5+0pOK7IgV7un4MFM4MDhyr
         3AqA/XQCJILUU/4JepVD85GhMW53/QaHzBS/OamSrgJn4rnmhCat9VkkWd97NZw8SVQ3
         tl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965259; x=1784570059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZzedxX/pazFMQj4gQD8R56KnEWLF9Jh5wSuFx6cj81g=;
        b=atl45fY5UMCu95lufg9T7WgKDssnAuG3pXLB3rnkNFMJYE5Kf2wRUirEcGDgi2vk+T
         YEVI+WXe8pdXsWhQ6wVSNoQPRwa1QbN0WceoDL3ScABk14kwMztSCGz/OrltD8GD0RIr
         39e8JOONS6hcsCfk2i0HHklLA8+6kzHKQfV/zIzzVUjodvj5UXfpFyXrigyyOuKq7rek
         8Dnz02VrNBQZfNYLKgCMzS3MVq9ilG8HxKbTq9PgBR7CFL0RPGDPb5TCvpP2kkJP+jih
         O/6Ui7gHcmkIDS/NphTxYeWTNxe+gNsaxzyzDBUooteVqOWkpF7nV7pLG9xGiUg5h6yM
         NeFA==
X-Gm-Message-State: AOJu0YwpwJouGzoebSWbu21u6S6086qaANUxL5Jq90LkG3+5jA5+PPkl
	1z3hnPlJ4q6jHbhANerlz8kwz91YZRLhN1cs9yog2FVzMnwGsedAfB46
X-Gm-Gg: AfdE7ckW9btcwYKYaH5GEfm7AtbU7QFDlehuaP/8TOt26FFiE08rKisFcge70qoLGzP
	vjBzCe+70UIrmvNqMhVegxP4kxJGYYMyiUhCOXN6MMYdml3lE4dhNfXz7p3qEPDRzV0AO1e6BRB
	INePzyZd/582GfkO7Yw9m7pg2PWkk429CbSuQeTB2KKuxBwZBgPu48okbikcAt3J5vaU5886zwp
	CiYMB3OHq72trszzNFHE/3SkiCTiKdxoTz57yNh3ps39GMLMWkGaZEiZgDoDtuQytJEdGofOf1N
	h5Pg6aqAtEcMb11wFLeCo8AYhbEacvD/o20Y85wq8rE1fmpK29HD0lx63/STbnljTDRjpUaTii5
	4Q6vkjD50MvOvlOZEu7bHqcVuddN6x9Enom0HIN5mnunelPQwGBM33zbi5wXuK1ypAwignNVtLq
	6+4fpycPV0w9UT3a81PQAdZDPn835ujllCHavI8MjCk3ZQyRTjKgjYP/lcoa6k2HDn8RQgGiM+t
	g==
X-Received: by 2002:a05:6808:151e:b0:479:ead7:2a5b with SMTP id 5614622812f47-4a42ac7c289mr6720427b6e.16.1783965259517;
        Mon, 13 Jul 2026 10:54:19 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:7::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1adca6bedsm12664742b6e.8.2026.07.13.10.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:54:18 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v1 1/2] fuse: fix missing barrier when checking io-uring readiness
Date: Mon, 13 Jul 2026 10:53:44 -0700
Message-ID: <20260713175345.2542331-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260713175345.2542331-1-joannelkoong@gmail.com>
References: <20260713175345.2542331-1-joannelkoong@gmail.com>
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
queues are ready.

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

