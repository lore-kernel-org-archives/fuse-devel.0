Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BE235B650
	for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 02:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789007118; cv=none; b=XFeWDO3GA63R3WX8p9SYed/0nwS0Hxj5OPM7fswKGwbe1KutBPPLfoqey6TpUlqTGWhiUEUWWQssTFcblGq25jy0vz31Cu6gY27zfE6qTDkbFBhF8+VoQhRNU53w/rRgdXKKZH3dyA9MMP8FjwZbbvv+7D0xSqp83DObg000Sc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789007118; c=relaxed/simple;
	bh=h7jlRf2IsDI9qQdqGv2bSdvzHPNhhTR1Nonfg/W40cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EM102W7S6yKGwkZuR9FP4bUo/uo6t3YddztsK2xq5JKDBLEVxHgryjHemgCWLMhHtK6XSqV2RoEx28cce0TmCFvnbekpnuZL4/CCXOCgwIkdl3ZDNBJoSuNB616EoozkQDm0aLyswzTRUK6ieDnRfv/W3Uw66OkVa+8evsBm628=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=qqjrQLog; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="qqjrQLog"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc891373e0so69084905ad.2
        for <fuse-devel@lists.linux.dev>; Wed, 09 Sep 2026 19:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789007115; x=1789611915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mClRprXurGsMr2UxPPq1/QlRUj/VLPAMpoAcj6a2AM=;
        b=qqjrQLogPRDW+Q9wku13sAM6czVmhn4fIEqWGvE4eaROhC0q5X/CyuaMLor5vnLVbE
         5kNK87o04IaYg+pL/twpnGPCWs3oJxS1mgLEXqHaI/2Uq0D8B9dCIZpIe8NZ/5QOk0WK
         7DhOyU/VZKjrrGD8Znf0u+rPFx5+vraFkGLXZh1k4hBiNEfKVrUEnGF8Kf4lfonMaCFU
         HS2Fp6cNZdgD5pibGUrfc/3BIewecDf6nST50D3y9BGNwdgpelNobVjFyu/gYT/xCITb
         dYRNiYQiehvT0uZvJn8mnwO1viWUFDqkshVLjZk6I9ee4ZyujPI4UvbcmOx+gGxlRwOO
         wKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789007115; x=1789611915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+mClRprXurGsMr2UxPPq1/QlRUj/VLPAMpoAcj6a2AM=;
        b=nCP1shqc3lee+5hy6BZnwH6hPncQlPKi9AdULPoCDt1NLKgJWShQ88/ATMGKK4vCXd
         Zwd09F3VufXT9B/L6RBuh02zEal9UNzI2kku/KJD8KxFvKQ+RAd9BviXv6zHmW2k8C9D
         W6DXPaRevUhRxt7whaOo0h92b4PyOP3BZRE8/7/LEzJTXbGMHmjowvmS2k6hc4H0tYK7
         eXsl59Q/l/uCjkp7UIQfe1bGfWUxepJXHqcQIs2loepYxBevtKwr+DwyV/+IhyivPzhc
         phJucyd5UL1yIGmaw2cbxdtxxapbh5ulwHmsN3VTZg+SsLYhsBnSxJQVBGQCyfoUpIjn
         7d+w==
X-Gm-Message-State: AFuF++mV88Iiw/sAAe8zFvXsjPK0ZLMqd/30w3We0PizgJHWfg0YQK8s
	abYW2IkhC6ZuYcCBiXmom+8MkuXgmdi5rBK2QkdvamABNzQv4UlaFmO+tWiyRN0zCIH34aJ21Ow
	xgJ8p6A==
X-Gm-Gg: AYBFou18WpUrx0LMkWoYUHO6IkXSMPZIIdTRTlLIBw2q4Kk1jekO1VhjbbR0afEmAAI
	u0oFpnxcWOyHxAT14k+/MRajmK1mEa+B+fH/pyCiIv5MpxyGBvcGvySwZHvPFf4rUeIXBzzZigp
	M+SXSfgODWZuJ2De5MITrNziA7MPvcmNSZphU8usHR9yJzBfT1ZjB3Z1qrgNpsjcTBUFLEeXDOE
	p1KLTpeNkxF//H5s8Mfd4ntpTXoPqgvX2HzZFPDGer+cCWUInJO8jMo/zQQteG2dV/lplfeTEN2
	3CaS7YVQ6tBWThCuB7LC6KbVa7bDc9kmwZWZ2Jw1coulyyghsLU3hLQNDI2e/sL43TgQavyHjSn
	TTbH8TnGOt0vWPVBk67moS4IzA5FytwT2xIDPTO3dMyN81botxam7MZWkM9Ddo9ia+KL/naswWv
	ZinuQZ1BkAhemKeOXrFQqW1y2fFk/MtHxUOSSqADyLmV6t0c7418/tsoiEQMtT9cg90CK2iWjnn
	GX3I5gh1Kl3PX7+vtmQJrAVy6N2JLNR0Xy84kTclnr8eQ==
X-Received: by 2002:a17:90b:498c:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-39b260d3351mr53425599a91.5.1789007115401;
        Wed, 09 Sep 2026 19:25:15 -0700 (PDT)
Received: from p1.. (129-219-8-31.nat.asu.edu. [129.219.8.31])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1435c2ae6b5sm2688847c88.1.2026.09.09.19.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 19:25:15 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: fuse-devel@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	bestswngs@gmail.com,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH v7 2/2] fuse: return -E2BIG for an oversized SETXATTR over io-uring
Date: Wed,  9 Sep 2026 19:24:42 -0700
Message-ID: <20260910022442.3594649-2-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910022442.3594649-1-xmei5@asu.edu>
References: <20260910022442.3594649-1-xmei5@asu.edu>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_dev_do_read() answers a request that does not fit the server's
buffer with -EIO, except for FUSE_SETXATTR, which gets -E2BIG since the
value may legitimately be larger than the buffer and setxattr(2) reports
that to userspace.

Over io-uring the copy fails with -EIO for every opcode, so the two
transports report different errnos for the same condition.  Map that
-EIO to -E2BIG for SETXATTR.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 fs/fuse/dev_uring.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index c6dd420c4034..6351f2470e09 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -893,6 +893,8 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 	fuse_copy_finish(&cs);
 	if (err) {
 		pr_info_ratelimited("%s fuse_copy_args failed\n", __func__);
+		if (err == -EIO && args->opcode == FUSE_SETXATTR)
+			err = -E2BIG;
 		return err;
 	}
 
-- 
2.43.0

