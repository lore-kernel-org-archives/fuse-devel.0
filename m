Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45892309EFA
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 19:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780687670; cv=none; b=VusheNUyOSK9g7eG4v62CuWvCQCK+Qz99Oxjvvt4TPn2xC/G78VkNzxFFVh+Y1ZMr+JT7/9BRU3bokdc7snSqLcgrZbXkUcHXF/F5nUg96tHkY8Tj2u4zQqEyMpAtmQy/QS3rnSjXUExu6y4O7DrPCmfafqLiFGneenyMrFB8eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780687670; c=relaxed/simple;
	bh=kGtmf+DQbLxuZxoGIbaZE1zm1Le49Qxyb2TWLttt/zQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mlB0Kme3vTraL9NXAI2ZznjcPaQIulVRIQsYXrRflh6fE674BfY/f1ZIaHRPAdptqn1Ic0wm9d88VcH1WPJDyd0fYUEQToOkM3IqcsbGXsQIcEvxLklx4KuYI/mWWWy2uyIDkVFUrdngvkY31zm8qnMBFDwLH0e8mbChxRwtQwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdj+3PSr; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdj+3PSr"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so1462003a91.1
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 12:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780687668; x=1781292468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s69w/wAMhvOouHJNx+Y+1TfGBgPjyib5fEx7f+Rcpog=;
        b=mdj+3PSrnf/nvUznXhzVn5a0maArq5GuwyAlQTHwyOv/EUFoO7qPT6qhpxP9OuLk7j
         lOUZeG8RV3rF657M1LpDg+zi6cU/ZzYPlA6OUMdgZjBd17/20PQmZtWBdWewlzmr+z5R
         Bxz3PLtqrQzhH+hwa66ABNPgcw0qK/CIywei1scujoTL4P7jMah3fXQsWkLYx3TgJyCi
         Tzos+XSEqBqBGyS8dJA0u/fy19LY/N8NjHmbL9OagiIOGxvH4k3oGBev7BDpZki0g3LU
         rX6bn5W2BZh/mjjfxv0royt1bNTiSBK5529BjfYTJuhwThXrkO0ilgQ+pOFUFCr/8Hzy
         vGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780687668; x=1781292468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s69w/wAMhvOouHJNx+Y+1TfGBgPjyib5fEx7f+Rcpog=;
        b=Qsg0l/N0UTHhTVa8hC1zx3DsFPe98/f0qyQoZY+BGeKaE9b3Ov7yI+4jSdf580NYYC
         J1JUwpNtat1ukCrnR//toz0ahOsBCKOJpQnpH0wvtj7nRb7wuJY1nPe9FN42ebGg9w+1
         GRWLVix/6fdSLKRCVVv0Wjg4qUP/xmY15ldCX7ZNkXEsNROvk285j6qlTvlV9uBpFrJM
         N8a8ZVLbjfBFT6rC2GE1+/OpkBeLqSVxrq394CvVvfJrvlbIhhLFdZMCdV+djHgTVU18
         1NF+l82lixRk0h6f6UDvtREyz+j2+4uW8j3K3J2Svl5AvjNX0oi0eSPK8nrYE20yJbm0
         pdNA==
X-Forwarded-Encrypted: i=1; AFNElJ+phh+UMZd1XT+Ie7WuCtQykjz9t/fkTTmKQIe/OuQwNyfoExw+9BBAua2nSaLLlf9Ib4wd1dk9p4ja@lists.linux.dev
X-Gm-Message-State: AOJu0YwkedblBQTeC8zoh/f2LKMsyv2lwYCj9CWJO8ISJfOJFVgTT1+D
	ngDut9QsKVkcVPOK819w9B4nmJEyUoSMrgCdTk7+kba7jrwPEYiZU5bDFzW1Gg==
X-Gm-Gg: Acq92OHS1Kn1OlhSMU0s/MernoJG4N7aH3uoeMkOiC+QL+Vqhznd/jxIZVlqzEJmnLu
	jK8J07MX2sI9wMZ+pcv6de53ONP+lNW5A1t35+fkIlJC2CzaHQFa0qW17mt2GlgnuLqWQRRlcEu
	sztC2PBVfPreypXXNrf+bAix9jU4S35IblmxmdrrviXPHxbzYPdoGCBmrULLzoSpktD4nPJGRa8
	eVMx8K841EvqAwQTBvD4lwbAcqOVZ8PLPKGHaZmF5mpKMbS74DEXAXhm6hqpxIPANUhYIJug8uk
	ZxRnR9j9HJ9ghZPAKNpkK8TyzSr0hGG5zLvNDI35XX6wujF+Z2sJtzi9GOj4uchAroVoRvf2SEu
	SbcRnZDGO86J+GVDaevBrrpvAQa6Usq4oUs7sRjCYvkw3fOz1tD6z8UQsim8FKUDGxVqGu5uHb1
	k73bn6Ug0nFye7u+PNRCdXaWzDUrboDjRKrXxeBjY=
X-Received: by 2002:a17:90b:4b0f:b0:366:1172:597e with SMTP id 98e67ed59e1d1-370ef2efae9mr5456702a91.9.1780687668400;
        Fri, 05 Jun 2026 12:27:48 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:55::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-371341170c7sm1831006a91.1.2026.06.05.12.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 12:27:47 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH 0/3] fuse: io-uring request completion and ordering fixes
Date: Fri,  5 Jun 2026 12:27:05 -0700
Message-ID: <20260605192708.141921-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Forwarding three fuse io-uring bugs that Chris's AI program found and fixed.
These are all marked for stable.

Chris Mason (3):
  fuse: fix EFAULT clobber in fuse_uring_commit
  fuse: fix data races on ring->ready
  fuse: end fuse_req on io-uring cancel task work

 fs/fuse/dev_uring.c   | 14 ++++++--------
 fs/fuse/dev_uring_i.h |  4 +++-
 2 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.52.0

