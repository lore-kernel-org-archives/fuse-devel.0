Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0940D3E3175
	for <fuse-devel@lists.linux.dev>; Tue,  7 Jul 2026 18:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783449867; cv=none; b=IN+ketds7AF2vgZ2xjUUNcfhQiWJPyS7hDjjAZftEkkPwYw/zlOqNRX697ugfy+gMRfb3f6+MFokL0Op+6A3Mh0Yxf2ud/UnFt/Di1qPk/46ZeeTDxWGT97q2PWwfUrERAsOtdBZuX/cZlicYS3y0MHCiMJJ5dSpCwxKp2I0q3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783449867; c=relaxed/simple;
	bh=Tdkfl83QkxAFZ3k45EW/obferf9lLSc5mOVAXeh6Nwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttOdnIGJZAjCcekKdesFesSK7vgeAHIbJ8YslSQgN+fkHiOmntHb5G/gqUAo9dG1eKJMdjJv3fKeA3QS0sqeft0meG4NoGPrng4UVo3JRO7UH/ak3RD+on8Dqpgl+rxUwsKsqpTA6WXT4B1sWut8P7AFHCmV7YpezEhrLzn0SmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=XhdgBKuW; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="XhdgBKuW"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso6118751a91.1
        for <fuse-devel@lists.linux.dev>; Tue, 07 Jul 2026 11:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1783449864; x=1784054664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdEjxfWmkxjD3D5Jzsct8hZCWkuvv+0nMtcSUeOFAzo=;
        b=XhdgBKuW6GswSFAkZP3qJHGjEv5zmmMwmmhIEZZT1HfVBKyNx3lY7Cg+fXB6jAI2lW
         Tx5JQEM76IkJ7TeQFfXRiibHouqhF8jesmxY+FKEQJk0LXoNNwuf9iGHRCu9tOYWUb67
         UhkXz2S/r8P6iBq40FlIfl6CnRizgXZy7VR5+YE+640ed8Mvl0y3XdjQ16lL780acGBd
         5ICuhbE+5GU4KAm+sX43F4FXkn74UFXA4GEY+TopYh9rr32BFAdjmLTVkXObrt7TVE8z
         31kbbdiYXf/xeR10IIgYKCM4NCKqB880NFdqESoWtFVAU8fyTCO9p4IPw4M6v1LAuPHv
         TtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783449864; x=1784054664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DdEjxfWmkxjD3D5Jzsct8hZCWkuvv+0nMtcSUeOFAzo=;
        b=LJnJAA4uq5SVPu2sLXlnggCfVJ0cymHsLCHl1A+7SHqedvduFDw0BPccl/zeqftEQn
         pA3GAZrVtDyBKQCFP69NbjHZiJUh8ggB0LQx18oLXHIOQSMqH/h2aUVY77JECGRgQZL0
         J9cH1NDmNq3FbTQIQkpe5NPf839YXx1VRL7QXpDXBIR4QM9KFa4m9Q4es5R1dsYiojYu
         BV3gim35lHGsej6pvfiu1YhbJSzl7d5ZDy+JgLqLJOHQ+YW2HFXFF0SvQLgRijl+EYQU
         QrlxuKUVABbRWrTpO/WJORUf6B1IuLGCBMlL3GKNBFJivQKCWy+8x9ocdZPA0BRWkiWa
         6KEA==
X-Forwarded-Encrypted: i=1; AHgh+RpMNBHICLoKCNBRcxh9N0ozm9B9sHW4JEXoVTjN8EJHFLqwcgwdIb+85ocynpGt5hLO+Y+AdAiqYiwc@lists.linux.dev
X-Gm-Message-State: AOJu0YzNGBe0y6dxbaZ1LBdvWhQxuPQWJ20RXENOSk4SD9krwOBi/QjA
	0a6MFb1yBFQ2MgfIUAOYyeTM6+LqUjztvmKraL3rPnKwecZY8moc/+q6ubdynMyahw==
X-Gm-Gg: AfdE7ckkQ6AClewqiMkqjAvAAUPgQgZkTHAZech5LBMNO2bP9o3MCIuM8Lu3QIn7QzB
	BIYe0DZIkYzgI5rTOGoyLYFAGeiDcCQDux49DnFwmr0mO48FZktgYJj/g6d09TRNXPiGVv0MdIW
	t7KJdFeRkMcbWalysBC+UUou9oOV5dL4rxeTlr4vtidRspIuPle6bhK8BEy786o8bfXCItNlQRx
	+fUT+WDr3GLHMbx9oEicVyNQVL33qwVR1D1u4U0XtTuJkVAc8SyG7HIgW7W7BLk4AVjdYG3m+NA
	GHpHFgCJ6E5SaDT2jiMyfSzU7TtSvFgpEvloBF+1OKZqGkluLA5ohwKDQSjMYagH4vI/qBuV34W
	x6I3OSMNk00RDg/LgTbpRvl+sS7wegnQR9Hbz6kfY9wthFE6Mr1EPV20D6NIQ5rUZ1Mdjf5xmqU
	E=
X-Received: by 2002:a17:90b:1c0d:b0:380:7763:3b16 with SMTP id 98e67ed59e1d1-387581641c4mr7188884a91.19.1783449864159;
        Tue, 07 Jul 2026 11:44:24 -0700 (PDT)
Received: from p1.. ([172.56.105.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d12fcecesm1575432a91.1.2026.07.07.11.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:44:23 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Joanne Koong <joannelkoong@gmail.com>,
	djwong@kernel.org,
	Bernd Schubert <bernd@bsbernd.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: stable@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Luis Henriques <luis@igalia.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH v2 2/2] fuse: reject oversized payload_sz in fuse_uring_copy_from_ring()
Date: Tue,  7 Jul 2026 11:44:17 -0700
Message-ID: <20260707184417.3682270-2-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707184417.3682270-1-xmei5@asu.edu>
References: <20260707184417.3682270-1-xmei5@asu.edu>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_uring_copy_from_ring() imports the payload buffer with length
ring->max_payload_sz but passes the server-controlled payload_sz to
fuse_copy_out_args() unchecked.  A larger payload_sz drains the iterator
to exhaustion and fuse_copy_fill() hits BUG_ON(!err), panicking the
kernel.  Reject replies whose payload_sz exceeds the imported buffer.

  kernel BUG at fs/fuse/dev.c:1053!
  RIP: 0010:fuse_copy_fill+0x6c6/0x7e0
  Call Trace:
   fuse_copy_args
   fuse_uring_copy_from_ring     fs/fuse/dev_uring.c:686
   fuse_uring_cmd
   io_uring_cmd
   __io_issue_sqe
   io_submit_sqes
   __do_sys_io_uring_enter
   entry_SYSCALL_64_after_hwframe

Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
Cc: stable@vger.kernel.org
Reported-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
---
v2: add: Cc stable and Reviewed-by tags

 fs/fuse/dev_uring.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 0814681eb04b..f6127c230dd9 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -679,6 +679,9 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 	if (err)
 		return err;
 
+	if (ring_in_out.payload_sz > ring->max_payload_sz)
+		return -EINVAL;
+
 	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE, &iter);
 	if (err)
 		return err;
-- 
2.43.0

