Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890464;
	b=QbzYx9XBBIuDpudx5dVV9UwDu54V5kG4IaUFUxi39oKuVRFK4qVeF9yI/skj82VIfqtg
	 X93pVUNnLOM53dff7YVG1QmbDopWwBOIOHNShCGid6vB5owTTFevPlivL1kOQdHAOY/cY
	 tNIMTm/qCu7xbRYrNZygCG5uHi5CczLZHIuypYqpbF+wm81t+0hndYlySULItQvXzyumW
	 m9QQe4tBbvWF0p5o5uN3XmVJB53h1ceCtYGLOHXnN5cXxSLGHudKCEg2cILRQ2uS3j1EA
	 5XkjOZ35tbM5Hqb0Wgqp3g6RI247jCHxGm2qm4JD7fWi6V54UtlUPxXmMJkJEmsCieg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890464;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=1Gb0ovzsCrO9WAYNvMzw66S9UoQLmYtegApQAprK8VY=;
	b=X1tUrixrt22aSpkLz9uGZ16RVph7jvtsum9Ltv5WalrQaJjIkAyGfWbspWty77OJtEV6
	 aOh3U4Bf7Gl72wRmSbaGT4FWvHPxBPQHF9ADEA8MWxIciyn2LWRudmzwcnHbpzy3JMPim
	 u1mqmPFpHCrc8qL2keo8E97aLqwE18HKS9DrPr64OU7jZQmwDq3LXOODZRRtz+1GTFtNv
	 AzFW6GuwJ13aJYwNh2whGk+0prn3RTM0LSoT1VoV1pl3xjvdCsHAiJPMf2Ncod0tENt+8
	 q56TtykkqMkqXTIisnClaX5bclpuJkAn8Bj1EG4LLxUKsbUYlKcPsDL1J7Ng5RJzKdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F80EhByJ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2ED606A31B
	for <fuse-devel@lists.linux.dev>; Thu,  5 Nov 2026 14:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D2ED606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F80EhByJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793890463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Gb0ovzsCrO9WAYNvMzw66S9UoQLmYtegApQAprK8VY=;
	b=F80EhByJv7Y8k9ZSog9DOrOvGWSR15jtToCO2V0+Da63KLNpwUi+YNvwVlGTi2MlL1h8gk
	Sd7IUC2ptbRaVoK0akI1mMBTkUZpepCu4HdkmXPB6vx6NccAjp3AL/al9Et21tKXsU3nv7
	sLVNNpSDSDlcuxT0tnVOXKR/nUpNchE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-VKovkd6bMEmJXJFxaztikw-1; Thu, 05 Nov 2026 09:54:19 -0500
X-MC-Unique: VKovkd6bMEmJXJFxaztikw-1
X-Mimecast-MFC-AGG-ID: VKovkd6bMEmJXJFxaztikw_1793890458
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49187ad6a72so583366f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 05 Nov 2026 06:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890458; x=1794495258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1Gb0ovzsCrO9WAYNvMzw66S9UoQLmYtegApQAprK8VY=;
        b=m6IDAl1DmmGNGvaw6di8HJVa9LXe49RlJsBmDRS9UXa4mo46RulMacJ0Dpg0ukw9FE
         YPdZ+8RGpEnYt5sxHHIWWnSE8sXg5TjQ+VDDUoQQUa/KZhDRR8rZ3sjFnP68Bqr9Ot82
         PaCSb8NZ1B4d1PwZxLpxNgIYoT5A6L38qLFisYWx1yMJnnHpt7gWLrCjpj6aNKtJq9v7
         LPiYpmt9Od5ATDn1RY7iI19EN+lxboGEWDVJqdwu9OsIC5FlwmKia++7B/5+81O/jhUP
         EQehPVTVY12NPSevrhl96eJ4sYSYzn3GllBaFUHWt6j7e+VIPQNXJAxAtFflKJO0ZzHt
         h/Zg==
X-Gm-Message-State: APuU4Z+jmVejgpa/BQaBUzIVCp9uJeGQxbjQzo6rd6W1p0p6MwZLii2l
	B21x9ay2AcauB07T59Li6r72x1fdA6vMGtxn/WTEDNRIIFZomfc4XPggURn2xeBjj9U0+Aw5k41
	lCt00e1HX4tEvRDd5dEW/tdr1cZG5rAc5mYFmhHSzF2xV2Iliug24HGpFitu6Px2yr8g2KH0yHH
	T6rpFnb43jgrzGXdac9cN906Lgp2pOiBlsbjcm3GV75uU1a2c=
X-Gm-Gg: AYBFou0TAd0NAbUuaLh2uxDlb2L0e1JRrSPRvAIwGK3HmDbDOVWPWn6zEZReESFEMhI
	aisW7izN8TzShMNK1vTDnNtMC0gExPJRLN7lLKyTdHbFtFmUOZ8hnyeD2+dA1jlm3TNEJUnaq5z
	KwdGttfkC0uRsCZGscsBerst6jf+QsAnDSxx4FkU8thBxZd1N+jrG/XADjhr8hO3pxvqdjKU3v0
	bh6h+p3LLALkup50PdThtvXL7cRnObrOizDSKG4plKu0OmZPz5muIJmEBdfhUk4WT8u2vY2SOBb
	Iboc4pUualhPpSMtIJsM46zf/To/WGIAfTgauZRduU88dSInT+9Cl3ibpVeVSK87joSHi/YXJfK
	f/thXtH+zLs3EmC4vatcedIZcYo3d2OizVapsPPb7OQfJONjJj3LOtA9PSyOKAfdwgmSnWnsOps
	EbPYgxKEcPZTwCdQEg1iaRTUhEq+kxeyHp25Ls043lLnY=
X-Received: by 2002:a5d:64e7:0:b0:48e:17d1:16c9 with SMTP id ffacd0b85a97d-48e6e4f5652mr41100643f8f.40.1793890457911;
        Thu, 05 Nov 2026 06:54:17 -0800 (PST)
X-Received: by 2002:a5d:64e7:0:b0:48e:17d1:16c9 with SMTP id ffacd0b85a97d-48e6e4f5652mr41100590f8f.40.1793890457453;
        Thu, 05 Nov 2026 06:54:17 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (188-142-154-142.pool.digikabel.hu. [188.142.154.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed08536dsm9296429f8f.32.2026.11.05.06.54.16
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:54:17 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Subject: [PATCH 5/6] fuse: reject unmovable folios before stealing them
Date: Thu,  5 Nov 2026 15:54:09 +0100
Message-ID: <20261105145412.83058-5-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105145412.83058-1-mszeredi@redhat.com>
References: <20261105145412.83058-1-mszeredi@redhat.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iMz1Zbrf8lALPyJXofF6mAiAhuP-CpfUH8mVoeaQuL4_1793890458
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

fuse_check_folio() rejects folios that can never be moved into the page
cache, but it runs after pipe_buf_try_steal(), i.e. after the folio has
already been removed from its mapping.  For the conditions that are
already knowable before the steal (swap backed, anonymous, mapped) this
is needlessly late.

This is not a correctness problem.  page_cache_pipe_buf_try_steal() ends
up in remove_mapping(), which refuses dirty folios, and a tmpfs folio
holding data is dirty, so it is never stolen in the first place.  A
swap backed folio that does get stolen is either zero filled (clean,
reinstantiated on the next read) or already in the swap cache (the data
is in swap), and shmem_recalc_inode() fixes up the block accounting.
The fallback copy then reads the folio contents, which are unaffected by
the cleared uptodate and mappedtodisk flags, and the pipe buffer still
holds the only reference, so the folio is freed on release.

It is wasteful though: a clean tmpfs folio is dropped from the source
mapping for nothing, and each rejected folio produces an unratelimited
dump_page() splat, which a fuse server splicing from tmpfs with
SPLICE_F_MOVE can use to spam the kernel log.

Note that commit 15c20483d915 ("fuse: validate folio state before
pipe_buf_try_steal() in fuse_try_move_folio()") claimed to do this, but
its diff only moved the large folio check and the oldfolio WARN_ON()s.

Test those three conditions before the steal.  The remaining
fuse_check_folio() checks cannot be hoisted, since a folio that is still in
a page cache legitimately has ->mapping set and PG_uptodate.

Fixes: 15c20483d915 ("fuse: validate folio state before pipe_buf_try_steal() in fuse_try_move_folio()")
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 3641abb90d6b..e7d9c506afaa 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1156,6 +1156,16 @@ static int fuse_try_move_folio(struct fuse_copy_state *cs, struct folio **foliop
 	if (folio_test_large(newfolio))
 		goto out_fallback;
 
+	/*
+	 * A swap backed, anonymous or mapped folio can never be moved into the
+	 * page cache.  fuse_check_folio() would catch these below, but only
+	 * after the steal has already removed the folio from its mapping, so
+	 * check them here, while the answer is still meaningful.
+	 */
+	if (folio_test_swapbacked(newfolio) || folio_test_anon(newfolio) ||
+	    folio_mapped(newfolio))
+		goto out_fallback;
+
 	/*
 	 * This is a new and locked page, it shouldn't be mapped or
 	 * have any special flags on it
-- 
2.56.0

