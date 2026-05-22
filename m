Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5333E38836A
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 20:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779483554; cv=none; b=KTSOZOeSLyTBtp9SoDnnLUsHhzFRjDHHFOv5PFNrz1GHhKRsouwM8cpHTw6pj86MQFj5VVN42IvukssrWw2GTvGmLfCQf41J5Np59JIrxzVolJ0KBEOiOjIiU6uQfuIflsXoyZANyrfSxU8usKkkDalYIElpX8NJb5beY2o5VOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779483554; c=relaxed/simple;
	bh=kHSHlfEMBK4O3iEA8wm0qlROg3T26z2SyMlfGtrzSdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XYRInPIFmb8/1cCjZnrBeZ9OSIhql9jtlie1LPm7Xfb+8CXFIg89dlD9fAyUZEaFgG2/MyPIg1Py2zUo1T6aNOax5NHlzNTXWRm957/IkpkLgsQY4xDwUBf6+ByVs8q/a7p2pmZ8PCxpdEe0dnZMeSaIbHJ1HNIVuuDRQDMHYvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwtHQNbs; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwtHQNbs"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7bdec52f48dso71569037b3.0
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 13:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779483552; x=1780088352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dzldk0UDJXfaSpqxCOwuPxtECHrVAjBmoLSYfqqdH4k=;
        b=TwtHQNbsEDCgbgYWoCQccQ4uVaUd0lv4fd4Hf4fqby38cUeDNLTzsOBdI30oqWcWrU
         TNJNnU1+iRY1OUGMsVOfy/fi1Nsnv/KEfD+4c6CDDi5raPFqMK55RSJkazqGIw94t42V
         SVHrfjJm3sSmMULUbUJtwqLbCuTMXWQpjwMX/rP+BBdoUiDtosV+K7XJzNbCdwuWDC7j
         T0Mf1ub78mQzC4H4tUlckb8o4O1zdz6GKdZIcrM8eu006Gaa/B7Ml5z/aLpRfUbKgKz5
         wfB/VSUZJd7VcjbgJmUWE+H2Uxc81uoaFTRW0qtoyrjSV1WrdZ+Lba9XBbWmSEyU9tmq
         iDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779483552; x=1780088352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dzldk0UDJXfaSpqxCOwuPxtECHrVAjBmoLSYfqqdH4k=;
        b=fkcX1bnxMau8ob08/rxATEmRePk3aK05yBR3TdPmLCg/ezgq3tfMDvPJ5yxCueKBzz
         SH0l3knk0e3uu58R9bEtGGkY4yQZx4mr+2kh3xQ+pSaaKmknAzOC12tCPALfxrJQa6rx
         Z1jwSj6ldhVJ8HH/+gxqsbhaBwEXLXYlF5hrixU4t0BW7TTqFu64KFnTBEyoIwPEd9Xd
         UNbxk1oQP5EZMYh/W7zjzAzr9MjpIjxC67lNuaxYK2hXWvg3/0hypWZGvC4tmD2qhpc4
         vYxUF6Pd17dEcIxK7xGwxq3RmBV6U5vSOTeoFFngTefTG5jFc/TekbsKjliXTUrSg4Fc
         rcsg==
X-Forwarded-Encrypted: i=1; AFNElJ/X2tCmzUb9m7swXRkMubSnt7CVaUz+Wi+PyBxven3YWBYmXzXtbYM2yVIkyN4L9q5INwCn/4DLonpq@lists.linux.dev
X-Gm-Message-State: AOJu0YxpixRwLuWhXZ9ZQ+sur4GMOpe02FG1m0V9fkb1yI/7lg2roNLn
	JKyqECxNgzcSpIZBtVA42waF2nafDWkFW+LPd2CV0V3QKpcJKrDYMBNV
X-Gm-Gg: Acq92OHTFX+cMPN1wMCcyOCEMvlJQ9/38WRDgjVb/oSbjCvgQ8reiPwpe/WIP2KrsYG
	X4bYCl//QVVlXNN+stZdkwPTY/58iQeAB8AGg+B6oDlSRgdoXz7Xi7d9+VpOB21j6KP9OsSSrhO
	W7b0yy6+/0JCzJ2hQo7m1JxIOXDYN9mGy6dkMNmHEgY9vn79Z6Rb2VfYU+YhqJsLlEWhsKtaajW
	NIteZ9MuYKctPyJ2VM8WF3P6ZhpucKUOiPVwRlKVVvlvwOjMCxkXJFLNzLiYDjVIQIkXX2B1cVF
	vaCKYDe9bRkgFBp2l0SpXh7uTgTf8SPNQqBaqMEi3tk7GJAaWrVgWpdKNb9d+5En6q9MPN4STjG
	JD7bGQ7d9f2cC/81UzyAcmdr6P1B0x2sYZ8x2oa4vS5ZxpXosHNfJZ8jK42ka8kYDPzFMMOHb+8
	job+WLGLx4GBCyFQ9nvA==
X-Received: by 2002:a05:690c:397:b0:7bd:7e01:8d58 with SMTP id 00721157ae682-7d20dff26demr73441067b3.29.1779483552377;
        Fri, 22 May 2026 13:59:12 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5e::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38a21fc52sm13133537b3.21.2026.05.22.13.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:59:11 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	jlayton@kernel.org,
	axboe@kernel.dk,
	fuse-devel@lists.linux.dev,
	Bernd Schubert <bschubert@ddn.com>
Subject: [PATCH v3 02/10] fuse: refactor io-uring header copying to ring
Date: Fri, 22 May 2026 13:58:15 -0700
Message-ID: <20260522205823.1597313-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260522205823.1597313-1-joannelkoong@gmail.com>
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move header copying to ring logic into a new copy_header_to_ring()
function. This makes the copy_to_user() logic more clear and centralizes
error handling / rate-limited logging.

Reviewed-by: Bernd Schubert <bschubert@ddn.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index eb166e4da796..e990abb752da 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -570,6 +570,18 @@ static int fuse_uring_out_header_has_err(struct fuse_out_header *oh,
 	return err;
 }
 
+static __always_inline int copy_header_to_ring(void __user *ring,
+					       const void *header,
+					       size_t header_size)
+{
+	if (copy_to_user(ring, header, header_size)) {
+		pr_info_ratelimited("Copying header to ring failed.\n");
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
 static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 				     struct fuse_req *req,
 				     struct fuse_ring_ent *ent)
@@ -632,13 +644,11 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 		 * Some op code have that as zero size.
 		 */
 		if (args->in_args[0].size > 0) {
-			err = copy_to_user(&ent->headers->op_in, in_args->value,
-					   in_args->size);
-			if (err) {
-				pr_info_ratelimited(
-					"Copying the header failed.\n");
-				return -EFAULT;
-			}
+			err = copy_header_to_ring(&ent->headers->op_in,
+						  in_args->value,
+						  in_args->size);
+			if (err)
+				return err;
 		}
 		in_args++;
 		num_args--;
@@ -654,9 +664,8 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 	}
 
 	ent_in_out.payload_sz = cs.ring.copied_sz;
-	err = copy_to_user(&ent->headers->ring_ent_in_out, &ent_in_out,
-			   sizeof(ent_in_out));
-	return err ? -EFAULT : 0;
+	return copy_header_to_ring(&ent->headers->ring_ent_in_out, &ent_in_out,
+				   sizeof(ent_in_out));
 }
 
 static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
@@ -685,14 +694,8 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 	}
 
 	/* copy fuse_in_header */
-	err = copy_to_user(&ent->headers->in_out, &req->in.h,
-			   sizeof(req->in.h));
-	if (err) {
-		err = -EFAULT;
-		return err;
-	}
-
-	return 0;
+	return copy_header_to_ring(&ent->headers->in_out, &req->in.h,
+				   sizeof(req->in.h));
 }
 
 static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
-- 
2.52.0

