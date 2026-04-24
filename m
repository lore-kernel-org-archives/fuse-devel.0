Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDCA17557E
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993494; cv=none; b=Y3QfqnLVV39UovvFxIlk2GR0S8omsk24laz7QwKJwUt3vpBZQbo5vsd/Vtu/iEoHMHl83vdHz9RTOy5EnJd3fTceOIp5qUQ1WahrSiYvRy8oY0JHPHWpjAR3iqh32ONI8mm5X6mN7fyQh+9ovktd4+gOJCU6038yI0oQzxrRkOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993494; c=relaxed/simple;
	bh=DMSV0aMzmKnSENYifAHNLei4EM+WKG2Otv5Z+JSOFqY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pH43fv1FjcTePf2u9TkmikBsvDfjZTxMZksh7ZfAl9GGrnAZmrNdFIuztMksDMTW5XKAxPLiU40/F0etpTL1p8+XLaLqHnor/brsydDD18cO935k7+JrPZKINZGOTpyqLtWjCMAF3whbBHrwYZmL5+5yoeKXYEHP6m+7uy4ODwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3/es8R/; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3/es8R/"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso4872610b3a.2
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 18:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776993492; x=1777598292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLUZ7OYP2Ngn/mL0mrrDcxMsN47456z/zNCM+qJLVX8=;
        b=m3/es8R/mji20+y+Nwej9krgUm0n8NmvVqPdh/Ld3eGmh/kfP0YpRN7dX+lBU8QSmI
         fH/4ulTpxjCWH7flZK4HL4CHkaYAwBH9d4ZyNpqHu8zYzHHaT+ktt/ULak2l6DHo2tOF
         B32bUEfftOwNaO9Yxd8EtaSQ3ggDzjKJs25nl/va5j7OAvdZRv+mxLNNeTqKRBfGOFtL
         e/LqIwUinX8YTLMZpGP7Sot4KeEojwaWcr5FNzMrmj/q0DuKdB2b1uk/HsYNaEyOa7GO
         Ar887ZtNaaD4J84LPToFIdtj4IPoItUhSNMJt/S16zSQWvehgHmjCBtp7KfQ7HmX3d3h
         k9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776993492; x=1777598292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mLUZ7OYP2Ngn/mL0mrrDcxMsN47456z/zNCM+qJLVX8=;
        b=elBtPQx9oQdK9yXFr1ViiWAQGyZcBzMhyf7W20ILn9ix48Q8eHfzFKz5xh21fidgkY
         M3RGKlkhlOIyKP7ZPQM4EfMAmYXIUbEQnnnbZrKDJv4pAXWX9OD0cjjGD725+8Dd9Ort
         TwAPH7zijtJsL6TvqVP/x95j/DD8IxzkNEdJWf9IFWPoZkE/ZMXPMO/YeTH5M+hSPebY
         b0sDC0m8hzeA9OGwuP2oM9S9IMS7Iu7ms/0mOxveOwEqBtZAq9SprurNGZHxNl8VloZN
         9lMxR2J7XRwII2T2cS30gdsALh0uFg9XVh3u5jmz5W98HVyVZ35+9QsNr8M3vZ+mJyC/
         e19g==
X-Forwarded-Encrypted: i=1; AFNElJ+lkMFgvmtu/hC9xwTj0Wr28T+Gd1TGrQRi1gjCFZ5ETR5TQpce3ytsMgqGrMi/Ej+IliMRHsfUhvc0@lists.linux.dev
X-Gm-Message-State: AOJu0YxpWndKJNz7bCZ+62MSomgY+GsKbh8wYAHCq4Kho5sjYk5YvPr6
	DdV1DIRN8NHNc2Lqti+4ilptyggQYBFrZ18gD+c8s04yPsflJ74QGkvVEIv+QQ==
X-Gm-Gg: AeBDiesJi03qbDxNrPOpNRnUwWczF6WfRxlpIc7XyEzx7mlRzxBkUQr+mPbvOtHFBPo
	ZC4tDYPRvqFsCsaE4O73qL8ngW9gQyndtL66t3VD7QEQXG4ze2wqAAyDZMzZmK4SvO+hI58LRgT
	MpZiJoOg7SA4nsSan/OTcBS0TA5MxtRGZirLCZMCUH/49KkgGeUQcwhEcMWa7hzcefsehGy6aKu
	DXmitmwvxHe/7OeFlrClqOgONOXDzCNoqHrHfRGmwGToKEGVJrnfe+6Cn/Ce7rTUqO0B5/CyCer
	FX36Ep8tA/OEaYi4zjPyNX+4gwMlBvfUqvfzpctkSoOMsRFKYgm5Fx2NvJL3816YrNKjzB60rEZ
	jS+tMn6eP1HJyZHsuqbEJboCxNTTf2t1DPyieABZWgsTcmRWfYpV46AZuPPKdPhr2YKTEk3bo83
	v8Cok9eK+VHOachjtEZvT4HwYUxGo=
X-Received: by 2002:a05:6a00:420d:b0:81e:e09d:2687 with SMTP id d2e1a72fcca58-82f8c82d83fmr29256490b3a.1.1776993492332;
        Thu, 23 Apr 2026 18:18:12 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:6::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e984f20sm23485959b3a.8.2026.04.23.18.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:18:11 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 10/13] fuse: clean up fuse_update_get_attr()
Date: Thu, 23 Apr 2026 18:16:43 -0700
Message-ID: <20260424011646.457682-11-joannelkoong@gmail.com>
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

Consolidate logic for determining sync and return early from the sync
path to reduce if-else nesting. No functional changes.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index cb34138d083b..4f58adb0fdae 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1529,13 +1529,10 @@ static int fuse_update_get_attr(struct mnt_idmap *idmap, struct inode *inode,
 	if (fc->no_statx)
 		request_mask &= STATX_BASIC_STATS;
 
-	if (!request_mask)
+	if (!request_mask || flags & AT_STATX_DONT_SYNC)
 		sync = false;
-	else if (flags & AT_STATX_FORCE_SYNC)
-		sync = true;
-	else if (flags & AT_STATX_DONT_SYNC)
-		sync = false;
-	else if (request_mask & inval_mask & ~cache_mask)
+	else if ((flags & AT_STATX_FORCE_SYNC) ||
+		 (request_mask & inval_mask & ~cache_mask))
 		sync = true;
 	else
 		sync = time_before64(fi->i_time, get_jiffies_64());
@@ -1550,10 +1547,12 @@ static int fuse_update_get_attr(struct mnt_idmap *idmap, struct inode *inode,
 				err = 0;
 				goto retry;
 			}
-		} else {
-			err = fuse_do_getattr(idmap, inode, stat, file);
+			return err;
 		}
-	} else if (stat) {
+		return fuse_do_getattr(idmap, inode, stat, file);
+	}
+
+	if (stat) {
 		generic_fillattr(idmap, request_mask, inode, stat);
 		stat->mode = fi->orig_i_mode;
 		stat->ino = fi->orig_ino;
-- 
2.52.0

