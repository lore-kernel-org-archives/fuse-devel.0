Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403843793A2
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 21:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298421; cv=none; b=lrYSLD8ialydp5l/ORpKQg3ZbjUPJ48O0x5JEFfUdiHq1Dj/PjlB6jo6orfFXGxYGeh8BHI2oc3AFRCNR1v2xdNKOK5IhKJfZfwrHcqK9Oe99rO3qaLJOLYflg5SNLO2O8JNf9jGOGVsfv1nUQaEJaFLsz/zmdHPjBFiIkxJQ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298421; c=relaxed/simple;
	bh=E8AqxG/UVHlfVw28xzJk4huMLNnIimgiszlBUzdX3vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dc4/NIQ95Okf3IVAnoNcjnnqs8vBVIQN9UYBB2C08mjBpS/mRPA3q3eUYtHjFGGT24JswWoDzwVQ/eNnBF1PAxXQldEdHSCjo7+PoIO8bB5OwrC2/bvWFZGZLmoXiEd0iSSSnRtAFJtwhvH5dMbfFy0eydlKD2vWJB68Psmj3CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxITSWVe; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxITSWVe"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso1250928a91.3
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 14:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781298419; x=1781903219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDM+tof4+PpoXvhZBNKDBlj3VgbR39+avs4x9Z0DSHk=;
        b=hxITSWVeTHpa6aorfGBe/MM6EB1uuI6LTjzbGGfiZnjxHSSOjgAn+rTpqMRim5NQqv
         bIRTnMciWeIiD030GQcAAIu7dmUxyGMxAeiAjh3Y/VyRoC4PjN3uEU3V2NDQ9dcUMa44
         zikv/6r/1nTEo+aiHS8aUJ+mf78UgsnKLXFRsya+xOHFSRCSI0aaR6ifWpBWNLboJKPd
         yk/QC8TNEfdHcEund6kknW1IHQD2KwBe3NLuKOt3eBUbdzdxMogEZgjEWI1V6RbFUX2u
         i2GoSP88J5IEv6eWTiSv3+s3F6vEZyejfkb1slLy+dyTH2R+HZ96pPjqN1Glc5dZZVIs
         DsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781298419; x=1781903219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oDM+tof4+PpoXvhZBNKDBlj3VgbR39+avs4x9Z0DSHk=;
        b=XUuVL7GLSc9JxpYOQRMwVwe8P79+u34PaLqEmhbCGD4STClogVxBENW9rGr5Ve0NwQ
         cL13QPnsFhmlitK+C7CNDNBwolyhtPz4mTCcAMWRk4o1kh9eHun38iWQ5ZW8jyP8m5uP
         symcMvnAXSzba9RlpsXrLYtMhJcmnJe72gqa5ARhBYYPIhc9EPQpEoCf39lv3fd5wLpx
         V4NA9Bu4i0f4nhl/FGKu/UUbmr0oTIZyhdL3AdHdr3G4egsJwz4xiL0xg++szyMdPeoh
         kiaRpog6OLfi0yy6RFMBxinYVgiTcCsYQzDD9cel74102xNc0LdaM7cefLtklrKR+zOC
         7UVA==
X-Gm-Message-State: AOJu0YyuFmChja46+dvh5Iflm2A+UXyt8RJcFXgwXaSDZzS1WfZcsA1s
	OBYywnDthOHWv23kXky7UTrQQ0RCglvztSOgkcXsAIgtv5qsIrL9EmG9
X-Gm-Gg: Acq92OHd5NhvUMy9l9Mg8Eskn541S6A2W5/IlQnDcKPHMGKYWGMoVE6BG4A1gOtMEpL
	IozhQswfxzH2yGTv3n0wy9wS48qzv6opey6ICo32IIjAptcnAr20fqY6XdKkVMflV7FMeMIbZai
	2wbspu0zWkSIY2eeJcl0ICue5jygpaor92hwd2h41RfbBBLVa7qFP1nO/JiLBNadQfXkEePiXF4
	q1gsBVaPHfCX2fTe3JAqQcq6BqwJkl7vWWueRwnTzgkBVJnYUdHim6Z0kRh4GvB8Mmc5bi8UBvr
	rNQ69U85zBe4xHEW4KO25eMOfgq+QKQamBni2f1oydq865hcAyDtYLXtLg0LPje5h9Q5SZgikio
	+jfv0eLsV7V8evzbTsopmNdKBfqELBHxPS28UJq0yaEhNcI/333NKBUqaA/Ft3CjoRCP/2Xhd20
	ttWaZXl+Ue0IW1cXiSVkfiFVGvumXFG451EdOCL2pQHx0GNqO71RfFSU451Mp81QBcavGdBp0=
X-Received: by 2002:a17:90b:3912:b0:366:1172:597e with SMTP id 98e67ed59e1d1-37a01f335d2mr4517013a91.9.1781298419479;
        Fri, 12 Jun 2026 14:06:59 -0700 (PDT)
Received: from localhost ([2a03:2880:ff::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a25ecd5e9sm2810128a91.10.2026.06.12.14.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 14:06:58 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	axboe@kernel.dk,
	jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	bernd@bsbernd.com
Subject: [PATCH v4 06/10] fuse: use named constants for io-uring iovec indices
Date: Fri, 12 Jun 2026 14:05:09 -0700
Message-ID: <20260612210513.1516038-7-joannelkoong@gmail.com>
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

Replace magic indices 0 and 1 for the iovec array with named constants
FUSE_URING_IOV_HEADERS and FUSE_URING_IOV_PAYLOAD. This makes the usages
self-documenting and prepares for buffer ring support which will also
reference these iovec slots by index.

Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 0867799e1a3f..ba5edf5d01b3 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -18,7 +18,8 @@ MODULE_PARM_DESC(enable_uring,
 		 "Enable userspace communication through io-uring");
 
 #define FUSE_URING_IOV_SEGS 2 /* header and payload */
-
+#define FUSE_URING_IOV_HEADERS 0
+#define FUSE_URING_IOV_PAYLOAD 1
 
 bool fuse_uring_enabled(void)
 {
@@ -1094,8 +1095,8 @@ static int fuse_uring_do_register(struct fuse_ring_ent *ent,
 }
 
 /*
- * sqe->addr is a ptr to an iovec array, iov[0] has the headers, iov[1]
- * the payload
+ * sqe->addr is a ptr to an iovec array, iov[FUSE_URING_IOV_HEADERS] has the
+ * headers, iov[FUSE_URING_IOV_PAYLOAD] the payload
  */
 static int fuse_uring_get_iovec_from_sqe(const struct io_uring_sqe *sqe,
 					 struct iovec iov[FUSE_URING_IOV_SEGS])
@@ -1125,8 +1126,8 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 {
 	struct fuse_ring *ring = queue->ring;
 	struct fuse_ring_ent *ent;
-	size_t payload_size;
 	struct iovec iov[FUSE_URING_IOV_SEGS];
+	struct iovec *headers, *payload;
 	int err;
 
 	err = fuse_uring_get_iovec_from_sqe(cmd->sqe, iov);
@@ -1137,15 +1138,16 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 	}
 
 	err = -EINVAL;
-	if (iov[0].iov_len < sizeof(struct fuse_uring_req_header)) {
-		pr_info_ratelimited("Invalid header len %zu\n", iov[0].iov_len);
+	headers = &iov[FUSE_URING_IOV_HEADERS];
+	if (headers->iov_len < sizeof(struct fuse_uring_req_header)) {
+		pr_info_ratelimited("Invalid header len %zu\n", headers->iov_len);
 		return ERR_PTR(err);
 	}
 
-	payload_size = iov[1].iov_len;
-	if (payload_size < ring->max_payload_sz) {
+	payload = &iov[FUSE_URING_IOV_PAYLOAD];
+	if (payload->iov_len < ring->max_payload_sz) {
 		pr_info_ratelimited("Invalid req payload len %zu\n",
-				    payload_size);
+				    payload->iov_len);
 		return ERR_PTR(err);
 	}
 
@@ -1157,8 +1159,8 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 	INIT_LIST_HEAD(&ent->list);
 
 	ent->queue = queue;
-	ent->headers = iov[0].iov_base;
-	ent->payload = iov[1].iov_base;
+	ent->headers = headers->iov_base;
+	ent->payload = payload->iov_base;
 
 	atomic_inc(&ring->queue_refs);
 	return ent;
-- 
2.52.0

