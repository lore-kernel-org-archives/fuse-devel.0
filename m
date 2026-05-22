Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF28438330E
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 20:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779483563; cv=none; b=D8ooU5Qod2W5a7Ck7jSv0nWNF2qCPo1/2yoUSfRiUnXJXOt/wT+Ya7JIiu6+h5s6E18HgTmAD3XFRu1xkW3cuphv26OUyXki0D+cYgiQ+ibhDNQTF8KawMIzK4e1qAqX+idSBrQnyxSJ6khLcKK5r134iRmAYgMJ3Zt9VbPBQ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779483563; c=relaxed/simple;
	bh=Z81UfUo3plHBv2kOPFRm7wNCNPd81eff0VN2DCDeJRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QEc2TXPBbsD6/9dolQfl1/92SA3kfKlkXXE89gIT46hE2o/u7oLKEH7luDFtCVZgumg1V45Gv2Xnnxg+ACH7iFhDil/K0TXlOFv4w3+9Jcp9YUXMjHUt4bESsaDETCVJfhFErbUqRADrN1FlqcpV8bXhzy3k1kghzl0HPbFWK0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FITh+jCM; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FITh+jCM"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bf0b47d2f1so70061237b3.3
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 13:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779483561; x=1780088361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwsmsE7QG2oyay9iQgcEpaj2KIxE/VtTrft+ReOGjM0=;
        b=FITh+jCMvuMYOYJIXMqqRluIrxrtMhQYGNeEC8UkY23g7LFb9Kgg6PaPoiMtYHa0KE
         tR2gjA2mAbhgu63AwPN4NkDSXOVcIRLBsbANtI7UqxL5s4tmskbSH15kU7x2DmIlNL5i
         x6nYWm67rU6bwBtbnDObZIL8GEkRXBNil2HJpIi02DFp7Rmr7bjSnsfRpiWULzLcHB+j
         dwntmCJSlkNRl+gWIW2h5OnsdxM7DRjEPrzMb+ON2WeUcnQrXYM5E3+ZC213xgJvLEjj
         WBE8FojRE+E+SJJvJC3GWAIEEJazMS8Isg7ycTrgDOAPHLSfbQoBx1h1LbJR5+v6mUxN
         4YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779483561; x=1780088361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dwsmsE7QG2oyay9iQgcEpaj2KIxE/VtTrft+ReOGjM0=;
        b=ObheLBmrVYrTxwe9gdKe065139X/Q2lSXFob6mJ8d9u53CbgUXzW49DtHc/ZiLcI2A
         PQuNwJtQOKy0zsYh2ssBoMpgomRGkJSahroE2KvReR3GUNIFTJFdIaH8kf/6O2Gv5ECb
         tl2YU56sB7fu+WvaEWC9SSMw9wkGOqcHhjc1HOgYMA4XgSCtByWs6Gt/5NtNXxIuIb28
         KbgtnKjw09334NeGnqaRap0IDoobtgyRqLCrlR/soLzwmIs2woR5AFtETdEcgsrU0Abf
         bbnsak/19PLFDagDWw2fg0a4Dp0zbSRHSKezmv4fkSBYGT3JwshcgFRlTRxD8pggcOKm
         fprw==
X-Forwarded-Encrypted: i=1; AFNElJ94VzInkAAcTfyFsgDa9h1dVf7J6nADLKdLpJe77g7wMsvrRMFb6G/A3s48tAmQ2mg3/5Vhd/Xb39ZI@lists.linux.dev
X-Gm-Message-State: AOJu0YwX6xw3Nx66XW2OkzgitJEHuLJOsMmmuc6k149/vxhit7v4wcgp
	APpHOQXkeXd+qkIGV6zfXyYMxf3asHUkGbhSPJJz2WhoIjTeK4YNIwnOMsOU9A==
X-Gm-Gg: Acq92OEzMPTV41saTuHzpby7qFypT94z7rBdnZVBMSMRxpCZYptFhxQTlW0BwO/6hYL
	XlLEgItLAvTgcXQdxQ2CDDI0L3Ied0osjjyGQabcWruY1y5QtbdubQ+FPwhPnt4Zr55qtlDktkp
	jP6MgZcEb5kDa2U1C/Od6TtBrLWL0VLbIP1Mvt5oH/0iY05wHoThGogOWIu6ynRnsNaflbW4ijv
	CSFh7ucBmtk6yn6gVTdSCY0A8aOxpjCSfoaImFh174ydFEVh3SdFfMTfkFB33KR1PEOyFQZlmMC
	zEOo04mhCJtTFuLsujP9eWafl9NIME1nc7ASlTWPbkUsq8H0jVg99FtG/lCEvf7X/V+KTMl0wno
	LZkOqcpE+AF46zi+l3YF/NzNga3IogXmxuXhAhHPeeBMvb4smCvVrHwymfoHm66pzgViWZw7b+D
	7HZlZ1+tf+o+33jvWfvg==
X-Received: by 2002:a05:690c:4c13:b0:7cf:d9bc:8079 with SMTP id 00721157ae682-7d33a062ae8mr65217977b3.32.1779483561032;
        Fri, 22 May 2026 13:59:21 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5a::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38c33c935sm13088327b3.36.2026.05.22.13.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:59:20 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	jlayton@kernel.org,
	axboe@kernel.dk,
	fuse-devel@lists.linux.dev,
	Bernd Schubert <bschubert@ddn.com>
Subject: [PATCH v3 05/10] fuse: refactor setting up copy state for payload copying
Date: Fri, 22 May 2026 13:58:18 -0700
Message-ID: <20260522205823.1597313-6-joannelkoong@gmail.com>
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

Add a new helper function setup_fuse_copy_state() to contain the logic
for setting up the copy state for payload copying.

Reviewed-by: Bernd Schubert <bschubert@ddn.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index a8e8899f79b0..3aa6268bd28b 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -634,6 +634,27 @@ static int copy_header_from_ring(struct fuse_ring_ent *ent,
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
@@ -649,15 +670,10 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
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
@@ -680,15 +696,9 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
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

