Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45C3793CC
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 21:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298419; cv=none; b=YcvO7FIwBn/4+0hIfhLUBMcYrXMBJaKChRKxj/xQC1ctDcDTDOKqcFqDDnYduvqYrltH03POcGspVR2oek4UMNtGfBNquqIawtXpRYAOG7vd52SaqqzKg5a9JQ3WxmONCg3zkgM35CRcNDiDxcp/CBd+9PYetTpQ/j+9/ECDVkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298419; c=relaxed/simple;
	bh=B0L06aOImccW38x0xRAiCpU8aSxe0UXEOPa5q6F/PV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6URiScWu1cgQ5jUkwNd0y92UwvsStNt6VqrSDXhLmTKKOdY5Xi6qthQadKRXnmCAJURAEq5RWMU7BSrQ5p566+684Z42SLmnJ6YwCDezKDahN5kstVuZUmhstOjj3LLnbXiBHVpM3chTE5dyqJ1pjbuMFzkShaqSnUeeRi+mZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6gBthyJ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6gBthyJ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8585c51f1fso1065929a12.1
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 14:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781298417; x=1781903217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tc5dNvMuGtgrNFXYtcoMbLCa8m36noqQC/S29MamQWg=;
        b=K6gBthyJkzK4x4mQzDxA/dD9QOD8V/ThH3b1BAPyTgSv2W9NHe/+VECLkg6vDhg577
         YhwCHDvct3jHTnf/c6QqKSXnMRMWH9D1gnHiOAwxzTM6v9gYjCICo2/XdlU/S5O/RCy1
         tmfum9ozKa0fqwFE8grljkCmPbAoSLuYnOScjH+Xl+05BfMZUUBtGpq3m3M+EZaRbsx5
         VFbE0inuzNRj085cxP7IezBb9PcYfPwdWmW/lbpkFdh289ST7t+vAomlXWDzmkfdxIPG
         /eWyN/APYC+QhXJswCU3KH++QpPNxKGGMzvnEtU7uSjmjsApwMPTtJop5diFDrMHCDiN
         EuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781298417; x=1781903217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tc5dNvMuGtgrNFXYtcoMbLCa8m36noqQC/S29MamQWg=;
        b=eVzMmsxijmYgzy4368wgNTl/qA5PTb5QUzHRoKpvbs4yCDFXHb0unHfZN7N6FYL1kL
         ndb0/057u9pZlPx01iD0xvU6UUVJyxguLL8vuk5w1vv/CdWY4tCZgEAyA69TwfqfIL7S
         DIMpTiGdi4BQohvKyJhnuQu1Li+73Y/VqoMQW4EIp+y/MLeltyTv/3pXLWjtmVgpBYWh
         YRukBow9olhakdyzGSLjy1VIiyluMDYb1268rc2P+Qc2v0KbDmSM0O4UbwUYEcUgSe1W
         SMQ12JP97ZJvWL5Iyi9VB00wpKOEMS7SlgJ25Tl+EgJdM83kioP1ZnMt1JL9C/3CRjSD
         WrCg==
X-Gm-Message-State: AOJu0Yzng7Fz1ilEibUGzP5n+CL03j5t50EeUXfKxaZqOLeDgv38ib/e
	UFf45zYs1cU4iTav8UgGpY27TnuiA5VA9ocDHwF/11wKqCwSJ8aGGGEP
X-Gm-Gg: Acq92OF+HIcdVETRC+dXpJwcNzMN1LtO8AsVmu0xMXmjcP28jjLOf/BUXAcEdWtwsPn
	/XPAqCsZn3fNIQ+Yt49dFnCCVZintXHJmuwU8Kfl6VFs7y5Ni4GvHaKc3KlNA2mzOIGnTteTcHw
	J4m1+sv7DEuvh4Axonc0bDwXcJr+9ZtGsgktv7GOpA2vHXFKGdoZwc8ioFEbjaNfQ9M9QxC5T/B
	gxnG5KA5YL7WujnnKzYWXWqV9SgeFMaQh9VQ/oLNXbqnLof6k8jktUiQHipxxM4XQYNxSguODDF
	FsJbgX/Odq5f+sKZKb7jtH9SzESp9AeNklvpGozBGViZkqNwDA5Q3Gsk3a7zbuVkMnrDFF1sAb/
	5lzvDL3pqcTGHeuRsc0+t/0V1xNLeBHdoplMsu0i0yLyHVERvg0kU5oJYraexVYeoJ3TTpQdQZ/
	zRjLn9YDlsq++Yuj9/h5k5WbW+XJoksD34xYGDq5px0PQ0kSXBMNx8VZvRcm7+bhE64ITWr5wVu
	bI=
X-Received: by 2002:a17:90b:3fce:b0:36b:d40e:2cf9 with SMTP id 98e67ed59e1d1-37a1f74517fmr3069431a91.7.1781298417133;
        Fri, 12 Jun 2026 14:06:57 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:56::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a212aafb9sm2956880a91.14.2026.06.12.14.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 14:06:56 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	axboe@kernel.dk,
	jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	bernd@bsbernd.com,
	Bernd Schubert <bschubert@ddn.com>
Subject: [PATCH v4 05/10] fuse: refactor setting up copy state for payload copying
Date: Fri, 12 Jun 2026 14:05:08 -0700
Message-ID: <20260612210513.1516038-6-joannelkoong@gmail.com>
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

Add a new helper function setup_fuse_copy_state() to contain the logic
for setting up the copy state for payload copying.

Reviewed-by: Bernd Schubert <bschubert@ddn.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 58e19e8f537c..0867799e1a3f 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -642,6 +642,27 @@ static int copy_header_from_ring(struct fuse_ring_ent *ent,
 	return 0;
 }
 
+static int setup_fuse_copy_state(struct fuse_copy_state *cs,
+				 struct fuse_ring *ring, struct fuse_req *req,
+				 struct fuse_ring_ent *ent, int dir,
+				 struct iov_iter *iter)
+{
+	int err;
+
+	err = import_ubuf(dir, ent->payload, ring->max_payload_sz, iter);
+	if (err) {
+		pr_info_ratelimited("fuse: Import of user buffer failed\n");
+		return err;
+	}
+
+	fuse_copy_init(cs, dir == ITER_DEST, iter);
+
+	cs->is_uring = true;
+	cs->req = req;
+
+	return 0;
+}
+
 static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 				     struct fuse_req *req,
 				     struct fuse_ring_ent *ent)
@@ -657,15 +678,10 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 	if (err)
 		return err;
 
-	err = import_ubuf(ITER_SOURCE, ent->payload, ring->max_payload_sz,
-			  &iter);
+	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE, &iter);
 	if (err)
 		return err;
 
-	fuse_copy_init(&cs, false, &iter);
-	cs.is_uring = true;
-	cs.req = req;
-
 	err = fuse_copy_out_args(&cs, args, ring_in_out.payload_sz);
 	fuse_copy_finish(&cs);
 	return err;
@@ -688,15 +704,9 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 		.commit_id = req->in.h.unique,
 	};
 
-	err = import_ubuf(ITER_DEST, ent->payload, ring->max_payload_sz, &iter);
-	if (err) {
-		pr_info_ratelimited("fuse: Import of user buffer failed\n");
+	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_DEST, &iter);
+	if (err)
 		return err;
-	}
-
-	fuse_copy_init(&cs, true, &iter);
-	cs.is_uring = true;
-	cs.req = req;
 
 	if (num_args > 0) {
 		/*
-- 
2.52.0

