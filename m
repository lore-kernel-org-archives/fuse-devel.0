Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C815D38238D
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 19:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780946550; cv=none; b=ezCEC7rz8YifvMay7kPo0gA4QXYPkSrRyQnd0/sO8X4he3o4kuj2yV0oXSyTeRxuTqhb2hRsRlONAajNsMaInPYFBpOYNCIiA3xCAbn+BKApX69/4UGrxYx7TwfxlR+CVjih0Tpz4K77NBrtJOIlJySxHTqBQlQLvKG+IS74asc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780946550; c=relaxed/simple;
	bh=PZZ5JKgNH61Es/Hc2IRamrNK8+oEWn8kHVx+p0S3BKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avLeZm0Uc8dusVO78BhNdkNQdIuGLhmMFQvbLuJb9MGqYoQa0M1X4ISQYr/czsXUd3y9fRrCNYJ50OEn2JSZSIzkJLB60gRHJfwwd0I7v0AI7BNwyaYSK94MTso96bZJ/ROY1bJTxpXUO3MeSwsb7nteMyBrrRq5M231L1niMJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnjnlSZe; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnjnlSZe"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c85c531d4a9so1867862a12.2
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 12:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780946549; x=1781551349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KUUBm1V70Sx0Jeo8Tf25oXT82rFdyb+xfI/2ldjeDs=;
        b=OnjnlSZe5RgmNTzYXHezvUoHMSWMPKQEscuLJZqnOWCZLgMeXudbqHHqldptLWAFny
         hpOXjnrMH/tjxI8DXnyX+s7iVGKAcSyNQJjQgujpIKHo4nunQy1teWqUwusxAfyB023W
         FORtVDR0QmXo41CLOBeIsYM3cObwrdbEnpgr/Sey1ODci4cjeLNkekdf7/t3wY1I5Wxt
         kJi3pRwCugRuv5Ce/1VlgTA2oXhTk5dZqbOaXTRsPeL45PD5nV2E8O7nCLnwh1GQDPXs
         nwILqXf3eLVbEPsLAh2avWBu/DKwxy2Y2KKN6y6reDIMe2dv4OWAqgLZUllttpp/7NdO
         ErJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780946549; x=1781551349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0KUUBm1V70Sx0Jeo8Tf25oXT82rFdyb+xfI/2ldjeDs=;
        b=qLaX77ucIWy2ryxOy3wVCt87K9Y0T6E1wQQgje7vUruDKNzTTBxnMSfi/h87q2BIGk
         8buwQyGRQGZghXPhRDun1rf5YpJTFf9/3Xwo8i0TxlEtgTqJjP2oZAfV6Letfdp1VfuB
         NSBCf/5jUCRoaYV+sMWdjhXomigOpNHg6Poc/61DSwMxVk42oXglqThgPkHAXZfbpTis
         QeAGbikhwyHSkTadp0gkw6kScOGdpKgjqba9bh6ks6AnsMTWMdLkQ/N9VTrNKsM3SAEF
         fNNTAO+SLu4KyWM7MvABKfIys6O9p6SZjWJDUzatU2BjnTLIXX/Lfof4c8nEwRtXatZm
         pr7A==
X-Gm-Message-State: AOJu0YzBfDzjDlucMu4iq7dFsVSTT3QK1r2ryirEv1I7sgJIGcwp2Erx
	SNCdWPhDdE6CWAZhtH1wXlLIsKEn/fG4RzlaHlw+d0YQrvIa8f9GehQh4tp3iA==
X-Gm-Gg: Acq92OFZs7s4cU1DPUFxtQG7xiG388nsZS+1j7TiJps7MpVStGHjyRmUfcuEVxtxCvY
	L9vPK0F5XeNkmnKtv6b2ELcUDnCN/GKyzGE+mhI9HTvsVO8xgZ06uPWN3GKjwzAt6KpwBoGzZoB
	MDOpeNLjlvoPjVW6d7gTSSW1hfzTDoiBif+b7TWVFob+/zxzHrP3KtDncGuvJSbQbOZD/siJcvk
	P5n/gLplOr8LAC3X8KxkI3t0k9sXop8Cb3uNM53fH8OujYs/5k9h6teavYBgYXV5AiDCBSZi+5a
	zlSXVYDYWKvrTjZ4ZIF8vvFgUQRfGn9Haqedss0240zV2NNDdCwIOYqZYj2eOrBw46Yzo95vhB4
	xoCXb468oEsNLfBOhiwscP1KnjWbzsft34otzaGecKsCwXWJBTlqjDpPqcM8rJ1z8ASsGMg/a8l
	g3B8L6SqtsYn+VOzRN893nx5ajRJ9n
X-Received: by 2002:a05:6a00:418d:b0:83a:78ac:edb7 with SMTP id d2e1a72fcca58-842b0e12a3fmr16926794b3a.5.1780946549164;
        Mon, 08 Jun 2026 12:22:29 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5a::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e1e5bsm18550337b3a.46.2026.06.08.12.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 12:22:28 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	bernd@bsbernd.com,
	ali@ddn.com,
	horst@birthelmer.de
Subject: [PATCH v3 2/3] fuse: check connection abort during ring creation
Date: Mon,  8 Jun 2026 12:21:48 -0700
Message-ID: <20260608192149.23294-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260608192149.23294-1-joannelkoong@gmail.com>
References: <20260608192149.23294-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check fch->connected under fch->lock in fuse_uring_create() before
attaching a new ring. Without this, a race between fuse_uring_create()
and fuse_chan_abort() can result in the ring, queue, and fpq.processing
table being created after fuse_uring_abort() has already run, leading
to unnecessary allocation and teardown. These are eventually cleaned up
by fuse_uring_destruct() but will linger until the process exits, even
with the connection aborted.

Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 99ebb7c9cc61..d9108b5b5db8 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -244,6 +244,10 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
 	max_payload_size = max(max_payload_size, fch->max_pages * PAGE_SIZE);
 
 	spin_lock(&fch->lock);
+	if (!fch->connected) {
+		spin_unlock(&fch->lock);
+		goto out_err;
+	}
 	if (fch->ring) {
 		/* race, another thread created the ring in the meantime */
 		spin_unlock(&fch->lock);
-- 
2.52.0

