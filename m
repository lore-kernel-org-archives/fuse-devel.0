Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197543624D4
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 21:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298412; cv=none; b=R4S+EHDykUNWxYFLcjPG4dm1oX9QC6ONC/GTPXKUm/NKF/TD0Xn5AoMlaS2K7UFWtW2eHO0MPElk/CwY3eNepsBRYlvedddfzh0wd3T5l+Kb7jrxyxTuKXNgDqJOTxVVVnCbxVlONt+6s3zTz6H40AT6WNj3zdquWLwJKE6AQS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298412; c=relaxed/simple;
	bh=olZ+ZIN1MAaAuqIUkVl4qUMhrWjs0dj8Yx1pHFF9T10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JJZuV8UfmSl1v3I3JWy0bMUpL4HcnoXfz5ytgGHqomsfTKkDiz1z5EDSwmgLAYmFP/E6/xMJdpEfT8B6+Fy8cvrz0yDrEK47Ax0Xtlp4BV6eIP2tvhdw49q0bxvuQCUbdSk+GaN34/7CVZ0qD340QI2WIJOGmls6J4FO/NcNSxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2uLzK1J; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2uLzK1J"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36baeec21dcso1042732a91.3
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 14:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781298410; x=1781903210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tonPSuw4U+VByvovsOubEPPvrNqezV6cw0eB8YEnUok=;
        b=a2uLzK1JYtm/XbrY1f5SXwB92ggUYUGD7CXAVArlLlfNnDO5hcjFIVRRyhf7uiScsP
         rZBxN2iDPIbK6LBI6Kv/l1stATIZb8bU3R7JsIOPIWr5lHInmjPPNVx5P7SJJcnAxCOC
         +22T5tEAUTIohzXHErRzDDUktlcGmIpdXM7gLxqOs4r5L7iYrOryT+AYBqrzdUL34sCS
         FGetBTYGrLxsU/zOMCMHgHi2Zo+479h1oFveFj14U3Af55yvcVnCIIpxAiDT8c48owQE
         2YY/B/57dJBWoGbp0dVwTbJgw1zz2TVVGrY5MTup/FZfqWUdGOXVd4gK2iih3WteGY6e
         UwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781298410; x=1781903210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tonPSuw4U+VByvovsOubEPPvrNqezV6cw0eB8YEnUok=;
        b=HH5hBz59oFpgNrPo8KPv4kptv67WH1n5urPSTgt4R0M/aM+qxh+v0l8Sqw1+rzBQv/
         vMQNmAISsjYjPrm7sO4TVZ7xAnhfkx39QtWo6K+tFBfvG4a+38kFVQDYsWi9vzay+UHm
         Ot4AtHiezHU7Kl6uEYdfpMIRWWLJerPOmFrJNUFJ5LjasxowGWbRFapmqxeqBK9G0SSY
         2Q3ZrBP6eXvi2GJUmP1ufcHSsrwC7uwtEEu87xt76WfAa4Uu6tCutNVeROmS8pB05ja/
         WGaXQoVvqRZpJSbzGaRhoJ7BLTXgCKnN1a6nd5g+Uaoj7dqumTyXU4rMgUF+qCoWDdD3
         bHdw==
X-Gm-Message-State: AOJu0YzcGr6Ge6AaCrI0TRnzHtt6FVeysiKEqRoKwndPlDAr36Ecn8hs
	Qz2HJ4aHGU5DPQp/RJ0lJzOaatysw5tfN3S3UQKRfU1YPUCRydvUozf4
X-Gm-Gg: Acq92OGyM9EuOoyEtxGGAmZoeEQlYm5jMRzN8Wn5wlYwOy6aX5ShVZQcUM3sZ6m8AzV
	tMQdlSPIjMHIdRW20ZjTrChpAdl/hyRyzEhEOZTj3lzPfa2muzbaVfk/ilru6v2QpmrYwbKL2Bt
	am7AnIWZk3GFtABabncmHQHGMASebWsySc1pS+/kZQqpbOD8rn4+BkLGmu4YSg6d89Iu2IcOsua
	TFb3jHwrhefWoZW+6p1mqPgTIGKzCL4co3wE37JUnWSAoHuYPSp7VbcHRhfCMr7gyGowGpX/XQR
	FVdoM0H1Ty6ONVzyhsC3IerqU4GY9XQ5zjmN1gL0z7bPUGwsPte7iE+TCSS24r/bjJv2Ka2YEft
	nGGO+o90j0zKVy5loQfHaefPMnOHF9aH3expGhwKBWwBJS3l1Hago7vU4aY2E+X0PdSRYcYzYPp
	DqbSsAMvww9WhvLh5Od/dtXAjAp0yxIrzF2ZH2stRHI2s5iYB9l4Ru2Pbv5gbQBqzQdquJ6QN2B
	Bg=
X-Received: by 2002:a17:90b:270b:b0:36b:7c2a:263e with SMTP id 98e67ed59e1d1-37a04494182mr4113044a91.20.1781298410229;
        Fri, 12 Jun 2026 14:06:50 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4d::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a212aafb9sm2956711a91.14.2026.06.12.14.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 14:06:49 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	axboe@kernel.dk,
	jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	bernd@bsbernd.com,
	Bernd Schubert <bschubert@ddn.com>
Subject: [PATCH v4 02/10] fuse: refactor io-uring header copying to ring
Date: Fri, 12 Jun 2026 14:05:05 -0700
Message-ID: <20260612210513.1516038-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260612210513.1516038-1-joannelkoong@gmail.com>
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
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
Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 0b66fe3a5da0..1d37a2ee5532 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -578,6 +578,18 @@ static int fuse_uring_out_header_has_err(struct fuse_out_header *oh,
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
@@ -640,13 +652,11 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
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
@@ -662,9 +672,8 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 	}
 
 	ent_in_out.payload_sz = cs.ring.copied_sz;
-	err = copy_to_user(&ent->headers->ring_ent_in_out, &ent_in_out,
-			   sizeof(ent_in_out));
-	return err ? -EFAULT : 0;
+	return copy_header_to_ring(&ent->headers->ring_ent_in_out, &ent_in_out,
+				   sizeof(ent_in_out));
 }
 
 static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
@@ -693,14 +702,8 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
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

