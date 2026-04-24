Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9E819D89E
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993492; cv=none; b=JKxS83G8uYU+agGm7OfsHeqKgSLYAsbAPG1nolWcxFZ7PCnIxlWcZp+XaeRHfT9hBzKRm3HZ1zviFT7LOx6RTcFW4wzjDBCv3g77tYZjFaKgvjtCVTFXRQRjVH9NLSH0PCb/yxJCJAlANwsANovgBr5y29tvwYvXKH2nuN61Gp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993492; c=relaxed/simple;
	bh=MpBmq9wY+zd4d87Rj7kx/YMH/jig3t+8Nx0hIKRZo7Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZfOrvR5iLbCe+C4dor+s5xdVREOvvqcQW9tShNtw04pqTDi7n5tGdUYS+BCLTgmsDA+4SMxc36TbKalOFUaX76b/NuGPYIEPIgDCMsGvm+uvDPvdsfXyVTZmOHcCdVYe+eLYuuKL/Q9CctopoU/V7UVkH4Xg/QV20Is9fD7cXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPEmWGDR; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPEmWGDR"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82418b0178cso4572835b3a.1
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 18:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776993490; x=1777598290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5AlEyapwBbTU3syMeW9Lhzu+hugK13zdmSQ7raAxh4=;
        b=FPEmWGDRTXAUdnWW/gbb6tBCXN2e2NrHVphcI4ieH28ZcRaINcJlMxtv/Xu7nR8+iE
         ExBtootznMzJSxKZN4I4YbfBt/DeYlREx2OV5gz7Tq9FfnZnFVUEeR308QexZ6KFiB5A
         EXheuBNAL56QNkuejnO7fX0PQS2DLQ7IvaxxVGXUhwS/jJpqihd+XPDwqr14SMrqC71i
         toz/4BydM7MNUhNVDyv7JwvVw+KI2rVBNC8t3G0ckRozU/jUbAF1PERgZnOs/P2HkV/5
         +2K49sTg+TT1H7Y+q3oouzpFlTfwLzktYXDdQ8yWGMB3EwR0nlAlEj0x/+q1U2ywYfPZ
         GNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776993490; x=1777598290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r5AlEyapwBbTU3syMeW9Lhzu+hugK13zdmSQ7raAxh4=;
        b=BPDME8t3HUh7bnOJj8GN2COvQfn61fN27fg787mKK6JWIA1PG7MgkcuO1IQiQQh1p2
         mk9c3AZWzCN8xmgJQ5XJtn3YWBCNE/SY3ZV4OcdXGT/hGO2rDA/c094RferrZB61Zjqu
         qEIzApdQBV53LRoD8mKhkAcIzrXwTxjfdPkeZD86pRIna3qC2jtzSCxRzyxr4cIm8Ocp
         fF83FFPSTxuSuW0mo/pcK/KCmlW9TaOGJz3axh4u43z6IVMPYPq1NxvTKeLAvUsMG46r
         E9WX0sruQTTKN5S6aFbvEcQzULGEOUcUIjDPmtfcC5IUWeQdXn26yQo33WgMvdb4sT9d
         gQTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+m3W10OF8mSMQo9dcf6umpIhuR11M57Kd4/cafGg440ZcRGmOmIsx5ry/pOkQMO78BEZJ00FbPBOlq@lists.linux.dev
X-Gm-Message-State: AOJu0YztXAwlnlb/xrk8WmSJtOy9qjmal6JGjCuQr+79n4ysUmJQIgrD
	9zbC6yX4AxdPwVI06MsyxAKB1CMw/ulES5DDgroPM43Pdv+Y5yX9hP4uNgCEyQ==
X-Gm-Gg: AeBDieu3SzThrjE35BfVCSCh0R1741NkEJEYQvbIe2MrU/9foSS46wdZtfoCPmuQOg1
	Z2RaVGPFKZ0jRn6thU+xbK+ekkNupSdY9+MXYWwlfX5YlpE10j8TMFoAc5efofSjrKO4Gh0YAJP
	c6fUrnH5dRkFgkoPZJA8yWWQQpsPIH23CNduLc/Y/Y3l84TEDxHu4nATj6FrEJ6XPz0cwBcKnl+
	rqQPo4G1S6ZYPOubiVxyFMK1xllcyttGZcRSkIqS7aX5A00mLXiIx9NqUYC6HQn/KTvyA5clrS3
	QBRUePZKWKbXHgogewcQtLlaoB8yGOUSPscI9CgQgFJJGc9ZURzTzwjbKellLqa8bH04oatfTGB
	bsNSNG6Tii5vhyPZokm1bOwKAEKPATJvls3U/mqIsiUIaLf/TGkRiYyEtlP1IYShisYuWoLCuhK
	OHp6Sr0pMrUzqVou49NhWY83a8lCHY
X-Received: by 2002:a05:6a00:a90d:b0:823:9e5:855e with SMTP id d2e1a72fcca58-82f8c2c6390mr29746323b3a.0.1776993490297;
        Thu, 23 Apr 2026 18:18:10 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:51::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb38f2sm20659829b3a.30.2026.04.23.18.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:18:09 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 09/13] fuse: clean up fuse_do_getattr()
Date: Thu, 23 Apr 2026 18:16:42 -0700
Message-ID: <20260424011646.457682-10-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260424011646.457682-1-joannelkoong@gmail.com>
References: <20260424011646.457682-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Restructure logic to reduce if-else nesting. No functional changes.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index e4d80069c3d8..cb34138d083b 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1495,20 +1495,20 @@ static int fuse_do_getattr(struct mnt_idmap *idmap, struct inode *inode,
 	args.out_args[0].size = sizeof(outarg);
 	args.out_args[0].value = &outarg;
 	err = fuse_simple_request(fm, &args);
-	if (!err) {
-		if (fuse_invalid_attr(&outarg.attr) ||
-		    inode_wrong_type(inode, outarg.attr.mode)) {
-			fuse_make_bad(inode);
-			err = -EIO;
-		} else {
-			fuse_change_attributes(inode, &outarg.attr, NULL,
-					       ATTR_TIMEOUT(&outarg),
-					       attr_version);
-			if (stat)
-				fuse_fillattr(idmap, inode, &outarg.attr, stat);
-		}
+	if (err)
+		return err;
+
+	if (fuse_invalid_attr(&outarg.attr) ||
+	    inode_wrong_type(inode, outarg.attr.mode)) {
+		fuse_make_bad(inode);
+		return -EIO;
 	}
-	return err;
+	fuse_change_attributes(inode, &outarg.attr, NULL, ATTR_TIMEOUT(&outarg),
+			       attr_version);
+	if (stat)
+		fuse_fillattr(idmap, inode, &outarg.attr, stat);
+
+	return 0;
 }
 
 static int fuse_update_get_attr(struct mnt_idmap *idmap, struct inode *inode,
-- 
2.52.0

