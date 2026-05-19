Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D151E33F595
	for <fuse-devel@lists.linux.dev>; Tue, 19 May 2026 05:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169268; cv=none; b=pIodEipXDLQi5uK4qLiPjVHPNZcy35GouIJbncnkLDbxA0bmZdoZ2fKEd/0yy7uujjyz8tOQoMwJzJyHKXI6Cql4PTrTEbEXmNC+i3wJdKSjNoigut6sSjsCyINeE8cer+UuCa1COd0xbGsPA8iXJ5xrocgdv9K2nicYh79NsdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169268; c=relaxed/simple;
	bh=xj2PXqco0OYgzWLRRPhtDZOD1JPYK8pxo4cMRYsLjhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ogzKOhF7iZU1gI+HZqvwI2TBEvqsNmZd5oFeL9BcoSJZhEHThZeMJz8f3+qNohAhFc9XnjPT9CVVIGNXBi3ub6VuDv2UJbOFXprKslHmCbmf7CAcNN+bGAqypdcH8D/JZrs8PsIKpg1ZsSolW3LXtRRvcL+kIbV0Ib6tpKlAVKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDl95hAO; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDl95hAO"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7ca947f9b00so25449487b3.0
        for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 22:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169266; x=1779774066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxEHYRPXPUF5CcnWUlQth343O/vG0e4EfUADmNe/YLQ=;
        b=fDl95hAO3dJJNH1RpZ44g32ZYFupWtt4QSNoQLafqZuTgcJbnbyLUteDi+LokBfvVm
         MG5/W5+xgGj+7f2rHRigBZZYIK9rqFS/DXay+MvNB6kRKTW+WoDvSEiWjk3FkfCU38p8
         aomF7N1W5FVdQnS0qGOpLqBBiFlHgJxexsr8K0U6EBJs8yAItvlU727pOYhhjp6AMTKW
         PKUreR23PldbZV9yQ3lEt+gNjGeyk7PlWEkVY1Pvu0Mx2HIsJKL09+fnNgBpAXioem+J
         VDULk0WNDyOHZWgGJuqnElfTX/ypbTjXR9tgjn4WfnJSdPKIEoyCF7YcJgsbDOWakwCZ
         otaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169266; x=1779774066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UxEHYRPXPUF5CcnWUlQth343O/vG0e4EfUADmNe/YLQ=;
        b=UDIMAirSGmvugBvCaB/aeagTl0u57TWo99hYStJcIK5H0KAHr3TVb+TTso+4T60tlm
         ALCytdLqlf3BZ4PLNeMTYabmlcNhpqhaa1Sn+ri+Jjasi4iwEb8G4UiGG7H/OB0ut11/
         ApvJbuJzdDVekgp/puD+Ixj+gdU2LYGYKKhODoeP0UQMaFfbgY58xSjPFLsw5ZmBYS9E
         kedX6YSoqI7eZE+vEPp5QJxy/ACVrDHttA5dK1zJC3GIAFIDoc2ySbniHgE8Q/dJ0E6y
         3my+aXCzULcWQGJwAyZykSG/MyV4QhtCrbX5e5PnqUIDqLGtV1Rx+Eybv/M6rGgamY3l
         67fw==
X-Gm-Message-State: AOJu0YyHupuKfZT0vVDYO/sStNNxFInXh5wWxBKysqA1gBAD/TnvURdP
	EBZTaywf8CVxqCj+cUAHqCFJNBygUeapidan7db4dvCsSX4xW0dV+Iw9
X-Gm-Gg: Acq92OGm3hUTosNu4E4z9r5bZqdVd1BdfitClbKFtwdVZq3GGnzx7wofsCE/n6N1bYI
	v7xLZaaL+nD1ZJG8bC2c5SS4eNxHfU/n8F0xPRBjsVSDOZ3GMQX+Cz/r74r7CUhk2jVifJpVSwp
	NVgLnJWdVB5kFJWj4+En2bY27XrrO8xYN1zizw5/F6/NH/V7XRb1uoM1wOKGLNgNlCpLSR6+70D
	Ne1YYambHjKg2BIOG7MOIVLaU8kR9A8iZ/NhtvMoQ6qdp1NhaNVzE1S1E458CWKdZ0Nde9+v9iY
	xio+bAeqYpuy8Js0QZFxkJZM9h/6mrMMH23ya8rfgEYNbpBoJIOCLZaH7vnBNUs6hEIroQ7emD5
	+ZwANryXzHdS/bYyZg98imBYY3t2SBrJ5mHQmXQwTUUodnhr+Z5u/Te7NzqpvzEcbh970Ho064V
	Tr5tOJF/GT1WyUFLcHIjQ=
X-Received: by 2002:a05:690c:e159:20b0:7ba:ded4:df53 with SMTP id 00721157ae682-7c95b82a65cmr144251357b3.32.1779169265906;
        Mon, 18 May 2026 22:41:05 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:b::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9bc0dafdsm32141597b3.30.2026.05.18.22.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:41:04 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v1 2/2] fuse: re-lock request before returning from fuse_ref_folio()
Date: Mon, 18 May 2026 22:28:07 -0700
Message-ID: <20260519052807.1924269-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260519052807.1924269-1-joannelkoong@gmail.com>
References: <20260519052807.1924269-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_ref_folio() unlocks the request but does not re-lock it before
returning. fuse_chan_abort() can end the request and the async end
callback (eg fuse_writepage_free()) can free the args while the
subsequent copy chain logic after fuse_ref_folio() accesses them,
leading to use-after-free issues.

Fix this by locking the request in fuse_ref_folio() before returning.

Fixes: c3021629a0d8 ("fuse: support splice() reading from fuse device")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 37b11b89ce1b..a9385d3597cc 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1227,7 +1227,7 @@ static int fuse_ref_folio(struct fuse_copy_state *cs, struct folio *folio,
 	cs->nr_segs++;
 	cs->len = 0;
 
-	return 0;
+	return lock_request(cs->req);
 }
 
 /*
-- 
2.52.0

