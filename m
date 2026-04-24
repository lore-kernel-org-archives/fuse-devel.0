Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038B2495E5
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993475; cv=none; b=KHGnBDH3pV0OEqYlbrmURNoS1OprLH/XLVRZSp3Zl64miyWeet9pzwReHSr+mkb/0fsotMs4GCifJ6Ma2G5ZOgZsIp9lITSkWjQIggtulCEDcbTss+mzJpHRpqw4y3Gx/GhYdq9RA5k0vSxjGH6ZtgKtdeuQipREVEfE5uP6hqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993475; c=relaxed/simple;
	bh=UzMZ/UBYF1beKARZ37cx8VomwGAIOpbqsW4fmQTtayg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=etFSnlJ38Pay5TZq9U+0I/LbdeJ1rbWtqJQV2u6M2rffm3k0goJPXgftJslj/BsfpYAwl3DZ0dqHTpyyXueqMflIZ6+OW4sGSukImGNDY5yEzfyftt5oJCoATUBz1nJpEHTrX9a6RTKKstb0LJTN7JhKBiHddQl/CbK7R5kb0gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+3Ig0l2; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+3Ig0l2"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso5837064a91.1
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 18:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776993473; x=1777598273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TE1ajSH115QEzh92HXIXzCAZubXgI+zk64N3debhxGE=;
        b=R+3Ig0l2YPwskOdDMas2h1d3Jq17/Aw2q62fha5sErvmpZZf1fwb1s3IIn6jKOzh1w
         5u1Gtzo1gkEP/ffv76uaH+eipcOiqC6XAaClfd5GeetQbCq05MCy8F6lLxcwZIbcyGgV
         3z6MOfoTNQ7X6Kzqj3Dv5QPVB0Pdnn49EaVCO1bAa7aggISjJ+LXfqo+TaPlcz9B2Zyf
         PQHOg2J+bDezu6uRBchkRSmRec53337Ds2dZWBrDB4sEL5rppQc+4vO7lH/AITq7YOhP
         Ba+kBzIQZ4us6zbHspDSzdJXojOoczeEUyDTsRwCu/Tx8/cHnKk7JlmSe01Zrd0h2IGW
         CWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776993473; x=1777598273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TE1ajSH115QEzh92HXIXzCAZubXgI+zk64N3debhxGE=;
        b=KMyKStyTpJc1pnJJzUI31DeK3tfLqaH0fmivp53ZSmfmMMsDXl/2YzHE/yz90jxeZL
         P9blMdXO7/ECZ07CjeygnZP1IGoLLMHI03+Q6Me1YBt1UUPXsLjSPuvAZ6/AHjJ3dfQA
         InLLSidDGWZZQSp7Xngx/hl+jr/qq2d1cSOU2ieRyjvusd88xXtjcGuM40/7TZHJuFEv
         YPsRCorKFwLGnt0DB4SvKG+nd3SIiQ7QAthmLVLP3OSirkDkmET+C70S0NIJgZlZj6hT
         jpLDm5ewZyYT+ozJDzXhJPbF0WrTqZLAsLwZY0JHxE/nfehHuvGY4ihnHWokPftnEgsp
         iWlA==
X-Forwarded-Encrypted: i=1; AFNElJ+VG1+a9uCRDf0uBG1V1k7JVGuR1+x139FuiyCx6WycTDOoyYiPou9wZi1I8g1EwIipXQX67KPBoKSk@lists.linux.dev
X-Gm-Message-State: AOJu0YzS9jaGR3OgLYZ5rhVjQSOiu9UwvgPQ666bXeVoWRP3VWnJfr77
	zim3yVnLqNMKHhTdyCaD5oN+9HEef/RvvTwcLg3aj9Y4dM63oj8vWKnZEn2wDQ==
X-Gm-Gg: AeBDies4FOfYW15mWvSn9lQ8goX/ZHDHcBXn/GNIPWsC9BS0AkJ16VdF5BZSRNOtpgE
	jrYAwxS5egsufw8RNiir+c4rGV2QWQiqrE0vt9tPtm5AiYVoH79nIRcUuZES3oG1rmng9UHLOHS
	vu8gTOxr60ot9hIKEGcDcFaZvcu7I41Urrkz7Jme9A7t1YbmQxPIGppxetQnwYDbSmS4bbvn80g
	TTE642y9qF++d0wR6UkfjTjd4Rb6g3IRrMXPh+/YIsMSktFDH9H8yrJHPYEBmcBAQIofKvk+Ccb
	IFtWU2YZEuI3cjCMOMUIuYNFp74no/DEieKFqTOGcWs0+GKmmEvnQVgDpJhxM1q6p+t5wCAeDVL
	sPyQABhBWQzaUZpzU4UdW2PxPRHB6hNJsW78TBXG489hvy9j3M0xIkuLjHnN5yWtcItta63TSdS
	uok8helVbO4IHsH4MAqfIyKTQOgafk
X-Received: by 2002:a17:90b:5185:b0:35c:29ba:bf92 with SMTP id 98e67ed59e1d1-361403d5988mr32173590a91.5.1776993473261;
        Thu, 23 Apr 2026 18:17:53 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:57::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362bbf963c9sm13627694a91.16.2026.04.23.18.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:17:52 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 00/13] fuse: dir.c cleanups
Date: Thu, 23 Apr 2026 18:16:33 -0700
Message-ID: <20260424011646.457682-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Amir expressed his unhappiness [1] with some of the code structure in dir.c,
particularly fuse_dentry_revalidate().

This patchset is a series of cleanups in dir.c. There are no functional
changes intended (except for the first patch).

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/CAOQ4uxgCezMh3jdp519Lp9OZeqAyZHmc4Mp3FthJpfXhVoHEfw@mail.gmail.com/

Joanne Koong (13):
  fuse: fix missing forget requests in error paths
  fuse: clean up fuse_lookup_name()
  fuse: clean up fuse_lookup()
  fuse: clean up fuse_dentry_revalidate()
  fuse: clean up fuse_create_open()
  fuse: clean up fuse_rename2()
  fuse: clean up fuse_time_to_jiffies()
  fuse: clean up fuse_link()
  fuse: clean up fuse_do_getattr()
  fuse: clean up fuse_update_get_attr()
  fuse: clean up fuse_get_link()
  fuse: clean up fuse_dir_open()
  fuse: clean up setattr()

 fs/fuse/dir.c | 324 ++++++++++++++++++++++++--------------------------
 1 file changed, 154 insertions(+), 170 deletions(-)

-- 
2.52.0

