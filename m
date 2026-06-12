Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB57C2264A7
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 21:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298416; cv=none; b=iJ9VlBBKXwJ8wRyMmNYAEplIEfgdKt1eYSZI2c6k7KLt3ppP+Gi3ET2OeYvim7aF+8xM0CHbG0rB69/9suI2xNaw7axeih8CkgFMLFL94FUmEIKOGA2ANwAuS5Ewnkkm5ImbVgvB4itNJeu3cgnqd3DRDjknOfF90c9I9GlE4z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298416; c=relaxed/simple;
	bh=nEjf5sAtvNqf0kIEXEKj/ZaFEpKbhv31ImgL4FfjldQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MqCKgP6WhpxvALqx/tL7+xtcBQeG7xDuyWNdlLZj17J3vg1JeaYJppRCrtsPhnp5J5G7y+ch+3Vuso4evem8jS+aCTW5O4VSBelFx2UshKvsEdRvbpAT3CPRUUg4pjQS1NoYNX3iyJ4Sa/N9wgcI/Qp3BqUvTHpHeC2/SME8v+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JH+ZjgqD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JH+ZjgqD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-372b4330deeso1019022a91.0
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 14:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781298415; x=1781903215; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqPIBQE86IJ+FXxZHlph0wMakXhMiyGciI6lfVtEV0M=;
        b=JH+ZjgqD7YZN4wc1SfOy//l/Y3uwUJsllT5UVMugMwaSrZwc6WhjJtdjQ9Xyy5/xvE
         3AX7wfWrI7EK1h/tdIDg86CN82e4Qks2Q4MzSVwTolLXm/GnhXvdLGu+LbQgfOBlbRtX
         JGCQ/IKxMX4FZv/OErFAAOmjmdpb8ZKUeVktpHOA2Lioz0cT82YbKpuAS1B+J8JPmNuI
         KeK9sIdH1gZYZ39zmOzx/XwANpGPNH/V/58ZWhYUDEGZNpl3q53OKGuLsLyf/+/iPLbW
         6W0lutEuZsI+XxJ/RUQekjdMvG1PoZc6AGve+/WBh0chqiZHGTERmyevS94WZCd3qvBT
         gVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781298415; x=1781903215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qqPIBQE86IJ+FXxZHlph0wMakXhMiyGciI6lfVtEV0M=;
        b=ohFna3FXjovDD+XeI7oJa8orwiyeO4+3HURQylaZS9O/nLyZA7WaZGsKoS+fyjsAF/
         1esmXK/DSTx0f+1WCrp2cfG7np6tGvmAbxsy+KnXSelj8YSG4i3jAilR5V7WYOA1r47F
         YgfkTh3BRklc/0NFqmyNQlS3a02AEVEubuQYsW2s02YEj+WNKSeFt/WKgEv4mZ9GmtXw
         kvABZqb9RluzzKIp6XDLBgn7EYRYsa/1G8aWGlCjyGQFwKd2ZisQyoHZJIl6jcelIiOv
         Gzpm8WNUT9UYPM/ojGiW7B/OwK7JCTYUv7fRYzyKoZYleyqGsE4Qsc10SmDz6LJ2f5nu
         3EzQ==
X-Gm-Message-State: AOJu0YzkpVIT5gGlrjxgAIEt27OMlXbuga34llnje097m+wZ3QRCCJw7
	E85Z9JdLPQAB1nirOqwL9M32r/agX+npSsemFmYm/gaPSXN1liiGNwyLVTV34A==
X-Gm-Gg: Acq92OFciSF3ZixqIV2bleepMADjd6Uq/vV/GHsRBglKN3AYLCuhs+pz+jQAQ1y7Kfa
	JeHNSqxfrIuMHdljCDD7xZTxZj/NapMR1btOnieeWkjmXS5w0nCEVA7BpprnrhOAJiCFMRykYN5
	Cu9m6niMcBTT0cqpaI5vHvRxZPHu6TzmrC7xyRMu28sFYFJaazVGoR1DZKG82vkGTkxNFuZpFJa
	CiEB6ErwlS3H35Pr/2yyCtSESEpkPPtGfkPXAmwtP9rcZofKifjqh8Yq8GXdh8toVunKo18iQuT
	IrRDq05jiacfFxOB8Dg+0teq29zsOqrFpO8uIQzqUo45lb28UZ9Z8dVijkJ/0wAlRPBxyrPccXO
	EWffTrZZbxEzI3EPAHVKCQZUVYu4x/bx9gT0jwrzN020bGFt8+py409qCWRyV8MC0jf56Qn3Lhx
	TXm6mFa8ivpn+JlDd69tN9MPDt9m9nWVIbED/0RnIvbUYZ0yAcsmh/k4KcLlDHYbIL9b4FbBIvP
	s8eBeddGctGhg==
X-Received: by 2002:a17:90b:2246:b0:36d:70c8:3a1 with SMTP id 98e67ed59e1d1-37c2bcef7eamr962884a91.13.1781298415060;
        Fri, 12 Jun 2026 14:06:55 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4c::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a233f451bsm2993766a91.1.2026.06.12.14.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 14:06:54 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	axboe@kernel.dk,
	jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	bernd@bsbernd.com,
	Bernd Schubert <bschubert@ddn.com>
Subject: [PATCH v4 04/10] fuse: use enum types for header copying
Date: Fri, 12 Jun 2026 14:05:07 -0700
Message-ID: <20260612210513.1516038-5-joannelkoong@gmail.com>
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

Use enum types to identify which part of the header needs to be copied.
This improves the interface and will simplify both kernel-space and
user-space header addresses copying when buffer rings are added.

Reviewed-by: Bernd Schubert <bschubert@ddn.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 66 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 13 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 42627838cfa6..58e19e8f537c 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -31,6 +31,15 @@ struct fuse_uring_pdu {
 
 static const struct fuse_iqueue_ops fuse_io_uring_ops;
 
+enum fuse_uring_header_type {
+	/* struct fuse_in_header / struct fuse_out_header */
+	FUSE_URING_HEADER_IN_OUT,
+	/* per op code header */
+	FUSE_URING_HEADER_OP,
+	/* struct fuse_uring_ent_in_out header */
+	FUSE_URING_HEADER_RING_ENT,
+};
+
 static void uring_cmd_set_ring_ent(struct io_uring_cmd *cmd,
 				   struct fuse_ring_ent *ring_ent)
 {
@@ -578,10 +587,33 @@ static int fuse_uring_out_header_has_err(struct fuse_out_header *oh,
 	return err;
 }
 
-static __always_inline int copy_header_to_ring(void __user *ring,
-					       const void *header,
-					       size_t header_size)
+static int ring_header_type_offset(enum fuse_uring_header_type type)
 {
+	switch (type) {
+	case FUSE_URING_HEADER_IN_OUT:
+		return 0;
+	case FUSE_URING_HEADER_OP:
+		return offsetof(struct fuse_uring_req_header, op_in);
+	case FUSE_URING_HEADER_RING_ENT:
+		return offsetof(struct fuse_uring_req_header, ring_ent_in_out);
+	default:
+		WARN_ONCE(1, "Invalid header type: %d\n", type);
+		return -EINVAL;
+	}
+}
+
+static int copy_header_to_ring(struct fuse_ring_ent *ent,
+			       enum fuse_uring_header_type type,
+			       const void *header, size_t header_size)
+{
+	int offset = ring_header_type_offset(type);
+	void __user *ring;
+
+	if (offset < 0)
+		return offset;
+
+	ring = (void __user *)ent->headers + offset;
+
 	if (copy_to_user(ring, header, header_size)) {
 		pr_info_ratelimited("Copying header to ring failed.\n");
 		return -EFAULT;
@@ -590,10 +622,18 @@ static __always_inline int copy_header_to_ring(void __user *ring,
 	return 0;
 }
 
-static __always_inline int copy_header_from_ring(void *header,
-						 const void __user *ring,
-						 size_t header_size)
+static int copy_header_from_ring(struct fuse_ring_ent *ent,
+				 enum fuse_uring_header_type type, void *header,
+				 size_t header_size)
 {
+	int offset = ring_header_type_offset(type);
+	const void __user *ring;
+
+	if (offset < 0)
+		return offset;
+
+	ring = (void __user *)ent->headers + offset;
+
 	if (copy_from_user(header, ring, header_size)) {
 		pr_info_ratelimited("Copying header from ring failed.\n");
 		return -EFAULT;
@@ -612,8 +652,8 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 	int err;
 	struct fuse_uring_ent_in_out ring_in_out;
 
-	err = copy_header_from_ring(&ring_in_out, &ent->headers->ring_ent_in_out,
-				    sizeof(ring_in_out));
+	err = copy_header_from_ring(ent, FUSE_URING_HEADER_RING_ENT,
+				    &ring_in_out, sizeof(ring_in_out));
 	if (err)
 		return err;
 
@@ -664,7 +704,7 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 		 * Some op code have that as zero size.
 		 */
 		if (args->in_args[0].size > 0) {
-			err = copy_header_to_ring(&ent->headers->op_in,
+			err = copy_header_to_ring(ent, FUSE_URING_HEADER_OP,
 						  in_args->value,
 						  in_args->size);
 			if (err)
@@ -684,8 +724,8 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 	}
 
 	ent_in_out.payload_sz = cs.ring.copied_sz;
-	return copy_header_to_ring(&ent->headers->ring_ent_in_out, &ent_in_out,
-				   sizeof(ent_in_out));
+	return copy_header_to_ring(ent, FUSE_URING_HEADER_RING_ENT,
+				   &ent_in_out, sizeof(ent_in_out));
 }
 
 static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
@@ -714,7 +754,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 	}
 
 	/* copy fuse_in_header */
-	return copy_header_to_ring(&ent->headers->in_out, &req->in.h,
+	return copy_header_to_ring(ent, FUSE_URING_HEADER_IN_OUT, &req->in.h,
 				   sizeof(req->in.h));
 }
 
@@ -822,7 +862,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 	struct fuse_ring *ring = ent->queue->ring;
 	ssize_t err = -EFAULT;
 
-	if (copy_header_from_ring(&req->out.h, &ent->headers->in_out,
+	if (copy_header_from_ring(ent, FUSE_URING_HEADER_IN_OUT, &req->out.h,
 				  sizeof(req->out.h)))
 		goto out;
 
-- 
2.52.0

