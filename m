Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6F82F9D82
	for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 07:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604840; cv=none; b=G2Y8xMgIQVt6XB07LBfnLBSJnUAGLruORXDBVSFIch1BwRRBOeZGd7xHbdtysadajhl+gbv4hK1DnkTSMTbKeBHtn47QW76B2gY+Z8IA/XLpswtV+mAj3CaKjfwdNrbdBsdyLdn8AnsTjFc/p8s6Tf5TPTth8iwN/vc9FYOjHr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604840; c=relaxed/simple;
	bh=dvtVXTBpPANpd/CP6OTRiErgstDc7nass+eIVRqpM2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IHWuhHKEo+KeRU9eUQiKfHr45jiCqyGzzFJBgTBUuEf0e8f9eNg9Aj2eIUaYeqxMHwG7bL0pD1qYV+7RRwDMi1raDuLb/Ll0GyT13J3vwYUQl9/0jtLt22TUuiH/m05lXFARHR9PABthyAgvzToksdmwxXaNX+2HsXZHIlohcFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRvo79uD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRvo79uD"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de0093c42so1626075f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 00:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786604837; x=1787209637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZBJlGaBVvkoWha3BD37z+KADfrwniJqY/MnyXvUctT4=;
        b=DRvo79uDg65qOBvjm6O8LLQiJHO7BXLfreLB+X2ReTaeV0tQ3O2hix4Jm8lu9k3erG
         ZXeImlT1mMnX0xvJIpQnRfpwsNLC9+TgZiz3BVqe+HDiOU6X4SH7gG+48g7jS+Q71M4G
         zge/os34AunrCWV7W3+oUPYjptMC/xDf9AfTDpnxI09udMfR/adQpXYpISWkXrU46GL1
         xHiuNe4ipYsed9xY/hT4Bjvat+zwd+YpvfMkdCKYRcCyWn7ivk8VpUlQFxVOcEOLdw9A
         L3lOvhdmViNks/v1x0A+yNRU0mOP0k6KO2oAnVZsGdkEO20ax0cQFw9c+VgMRnyv6nNV
         dUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604837; x=1787209637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZBJlGaBVvkoWha3BD37z+KADfrwniJqY/MnyXvUctT4=;
        b=fXVxYXM6Jzx7AocRB3AaDiYyF0d0nw3o5JYz1i3Nf5IPq3RogrgV+1yEUx6cjRzc0S
         2RJxlxM9eOT45RZE3XvMueHk9AUOG5iFpraPpMyILpctKzawR1hxCPoiE4vWIlEyF8Mr
         WUhwJXXsfHHuIBVEm58jtB6nXU+zyAoasFrOk6p4Ar+U/6fyN04njnR9gzzl7P/uQN5e
         O/8XpcgPAL/a3aFa5Wv/KilNF9VWFnm78eLndEY9EFkTTBDOuGlGcN0ufeHpCDEnax4V
         GZpTprPVpCJ7+68N57hEoNXe2rpvR3zS6ukenSG4OTiFb8ezpFbEO234phISLM0dFIky
         EPrw==
X-Gm-Message-State: AOJu0YxWk6BjDLBn1zxxNFRZAvBIGyQpvPnA4e/pPeqbL6k3FCbthkJI
	F56oC2KINIgH3tSZiNZqXtRFlhoubFpUpV4MZRKTBhTSYmXub+OIhbV2v9TW1bJuB+Y=
X-Gm-Gg: AR+sD13YU6Fe8abzV0oDvIw3HLBS68q8IhvdkS3sRDhHfB2ll6NxdIBOMYIP9QCm4eE
	lX3MT3PQTzCCNfnQjcw0vTUMezZSq2fh+1y0W6RBi3EuRZRJnMB/8RuN5RdwLsBPcy95dNGRgO9
	hZgeWQHK03GD8hieXmr3YQb//4GN74+xnkaGj48SRhB73sT3EOurVmzANTPR3ugMxb6yZ4G8TP7
	JOC7oq+zAhDir3J3IefKst0rz1posL049o3bZEq/CIgtL/NtNObdrms7yWzy3+By7OjE59OtyXo
	5QPcYX0L/Ehjtg/x4SHSL1Czugb9pY/6ZMVBP8jT3SoQNpb2kMgJaRT0j33P3YFOy7ERKHEtSwb
	gie8+urZpRLeYRBktGKaBwpyKI2lQT99PZ0FabILBQlAo4z4C/GZutH4S0SmQ+0wczzw4piPQl6
	1buUhYNE+eoOeeAYa46YNmeqdgksGI1doWnwRPowFR5d+eB2GsbRtc8/igBoPP1Y099A/xpuvQP
	zblgGdStLYIw+o4xQ==
X-Received: by 2002:a5d:5e0f:0:b0:47f:f002:3652 with SMTP id ffacd0b85a97d-48159ec134bmr3193548f8f.12.1786604837294;
        Thu, 13 Aug 2026 00:07:17 -0700 (PDT)
Received: from zephyr ([77.237.185.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4815a569c1fsm3725870f8f.15.2026.08.13.00.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:07:16 -0700 (PDT)
From: Ali Nasrollahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
To: fuse-devel@lists.linux.dev
Cc: miklos@szeredi.hu,
	linux-kernel@vger.kernel.org,
	Ali Nasrollahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH] fuse: ioctl: fix comparison in fuse_setup_measure_verity()
Date: Thu, 13 Aug 2026 07:06:29 +0000
Message-ID: <20260813070629.248821-1-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang reports a warning in fuse_setup_measure_verity() in
fs/fuse/ioctl.c when comparing the `__u16 digest_size` with SIZE_MAX
minus the size of `struct fsverity_digest`:

	warning: result of comparison of constant 18446744073709551611
	with expression of type '__u16' (aka 'unsigned short') is always
	false [-Wtautological-constant-out-of-range-compare]

This was first observed while building an x86_64 kernel with Clang and
W=1. Since -Werror was enabled in my build, the warning caused the build
to fail.

However, the same warning can also be reproduced with the same build
options using tinyconfig with FUSE enabled, so this is not specific to
the kernel configuration used in the original build.

The comparison is between the 16-bit digest_size and a size_t-sized
constant. Cast digest_size to size_t so that the comparison is performed
using the same type as the size calculation.

Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
---
 fs/fuse/ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fuse/ioctl.c b/fs/fuse/ioctl.c
index 3614ea603913..3487e30d997c 100644
--- a/fs/fuse/ioctl.c
+++ b/fs/fuse/ioctl.c
@@ -130,7 +130,7 @@ static int fuse_setup_measure_verity(unsigned long arg, struct iovec *iov)
 	if (copy_from_user(&digest_size, &uarg->digest_size, sizeof(digest_size)))
 		return -EFAULT;
 
-	if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
+	if ((size_t)digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
 		return -EINVAL;
 
 	iov->iov_len = sizeof(struct fsverity_digest) + digest_size;
-- 
2.55.0

