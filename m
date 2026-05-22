Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177EE382385
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 20:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779483560; cv=none; b=gpVXBrz2abogulWPtIOFu2rvpxUtM43AB8phnbzM4KtovILVXnVYQphv0rSicwu5CciuG+MKEv6FcAeKKIzuCXK+4e1Z9nD1GslKb48hdrkGFl7RkZQNVWDYKJ2Dw/dsR9iurV2sNUYUlQc9LcvUxEVzUrcV1tCf/fmHSIkkBp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779483560; c=relaxed/simple;
	bh=J2n8+/jgcXSZqVH+HcpjTkWmlwHpQ+LFAjUnPlZQurI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0hIo8jwbsvcxwgcKsxW/vNMH1DQ+iY2mEKU8GNuB/4QPEDsTHfELaSVNwL8kyegd19aoTwvdyWTiqSnd/ZnQP7WxgKBNlryHD+bUT9IC2JO+L6o7VwBtYWL+Z5cV/kH0IuM5KYsvC/4FL/pFGVV1lNv4Km9PtgyZhnU8JC0dT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFOJmuA5; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFOJmuA5"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7cb345cb5bfso63484187b3.0
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 13:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779483558; x=1780088358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvcW78tZ4uZ5xU7kUJWhMyXX1Nx+XtoQIyveeErrMrg=;
        b=KFOJmuA587x81OEJ64uYW/1CFDtcsEgBwCBftyI4kRJwv8EO25al5bQJO+xiwJgrH9
         kZD4Zx6xNgq0EKAKgw64PbcMFxKyuiHpQWm020wmBHhBujmRrn08RbsP67Ayo+vI3ZMR
         +WZeJjeZdBzUB8455OpXVl/7/bgMrxBfq0gWX50Ppth7wRHRJceJ6jCqLBt6/0xz0S6M
         9LpeHaA2mtQbWepqSRddsAO53aSJZy5u1H3XUpDUTgq2I5b8XxjxN4K60WbafM/nbzwo
         fULrK/ubWxwSTBFofy0YFHLCrMz8bLs8blDTQcR3/Ir0npR/FLl6Rz7uvlDlOaj/w/J7
         lSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779483558; x=1780088358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KvcW78tZ4uZ5xU7kUJWhMyXX1Nx+XtoQIyveeErrMrg=;
        b=fzbY9SXA4EaqzN61GzM1bcQhk2HrEabA4f7wFMP51eY9NgkhLAcVzL+M19d4tdiStS
         rRznnBMcheoE22r0AGBbJXmDdraJjkJ3ic/KRbTm780SvyqPqlEKVTr+XuV6b4NJICne
         hfZaTX6JjW1n4wr9Js5fDVy49XqFmuHQzD9FZ9Kly+kcBViSijUz1NN0Qd40/0NiCPvv
         GO80PbSHpeqYlGM5K8wnZF+p2IZC1zpMDLLCYFdVAZiQ1J32wRypEXzZ/pcTDjty81yo
         EV/XKwmcy8mn0rP+v3a4gPNTo4wMeP7vFNOCg9lWaxT95DPWFY/jDhBDbeuT0w/rIcSv
         feow==
X-Forwarded-Encrypted: i=1; AFNElJ+t53mHBBN1n918vMqdnTTKWGEb+l8qIDFQ4+TUUB5Wc1Wsa4VYgRlIgP0+A7VU9H2/YfLXz1L3xhjI@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+TMrZWVraqns9t0ApaNSH9LkqEo5YkvzVJuxBsg+h21HGQZFR
	GvUe98TkDtxXkTf38mj3mZjypRmv6PqYh5vi3WZ+xEvwZi/jOoJ77idc
X-Gm-Gg: Acq92OG/NOPqCT2YGVXh8p6PS72nUk9oy3rDmh6rlnC8X5ESMgKHlJEabjLp4yBSD/4
	dtZtl/yHid2hZKGWvhkXZ+A8Po2meG5deJv1uRLJy0uKHcR2mDEeexYEZkd0qQ7EHXktc8K4UCx
	b5xs2AHCCKVA4GZzKvpi/oibaJTVzlbaa9qzTF2ST3dE6P38XRiNHz3oI6tPSljOyQgqkDShM1S
	3xfVx2pKCLmhRSqGbwoM5yTmxmNbIatGixXeJTTas65WsBIBDEKMtSTL4Zg4LIBP6tromBjPKNi
	frbdNhtxkD6IMvfWoQFGROvnVBEVZDZKjlQsZ11M1/0xjyuTJoA/+xxdtfyFbC4Me0Csl9BqXIP
	Zs4LAkfP53ErFSvCbizbBZcHm2DZ3Dar6uLSd1FTJqCm2fJ2X5M46q870SBFSPMzLrdpwyyJgoa
	PgRLFyqAnwZ2HER4nyWw==
X-Received: by 2002:a05:690c:6a02:b0:7b6:f4f:f05e with SMTP id 00721157ae682-7d3376b8f72mr65290947b3.40.1779483558149;
        Fri, 22 May 2026 13:59:18 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38be2dc79sm13583797b3.25.2026.05.22.13.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:59:17 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	jlayton@kernel.org,
	axboe@kernel.dk,
	fuse-devel@lists.linux.dev,
	Bernd Schubert <bschubert@ddn.com>
Subject: [PATCH v3 04/10] fuse: use enum types for header copying
Date: Fri, 22 May 2026 13:58:17 -0700
Message-ID: <20260522205823.1597313-5-joannelkoong@gmail.com>
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

Use enum types to identify which part of the header needs to be copied.
This improves the interface and will simplify both kernel-space and
user-space header addresses copying when buffer rings are added.

Reviewed-by: Bernd Schubert <bschubert@ddn.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 66 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 13 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index d5667738fc2d..a8e8899f79b0 100644
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
@@ -570,10 +579,33 @@ static int fuse_uring_out_header_has_err(struct fuse_out_header *oh,
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
@@ -582,10 +614,18 @@ static __always_inline int copy_header_to_ring(void __user *ring,
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
@@ -604,8 +644,8 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 	int err;
 	struct fuse_uring_ent_in_out ring_in_out;
 
-	err = copy_header_from_ring(&ring_in_out, &ent->headers->ring_ent_in_out,
-				    sizeof(ring_in_out));
+	err = copy_header_from_ring(ent, FUSE_URING_HEADER_RING_ENT,
+				    &ring_in_out, sizeof(ring_in_out));
 	if (err)
 		return err;
 
@@ -656,7 +696,7 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 		 * Some op code have that as zero size.
 		 */
 		if (args->in_args[0].size > 0) {
-			err = copy_header_to_ring(&ent->headers->op_in,
+			err = copy_header_to_ring(ent, FUSE_URING_HEADER_OP,
 						  in_args->value,
 						  in_args->size);
 			if (err)
@@ -676,8 +716,8 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 	}
 
 	ent_in_out.payload_sz = cs.ring.copied_sz;
-	return copy_header_to_ring(&ent->headers->ring_ent_in_out, &ent_in_out,
-				   sizeof(ent_in_out));
+	return copy_header_to_ring(ent, FUSE_URING_HEADER_RING_ENT,
+				   &ent_in_out, sizeof(ent_in_out));
 }
 
 static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
@@ -706,7 +746,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 	}
 
 	/* copy fuse_in_header */
-	return copy_header_to_ring(&ent->headers->in_out, &req->in.h,
+	return copy_header_to_ring(ent, FUSE_URING_HEADER_IN_OUT, &req->in.h,
 				   sizeof(req->in.h));
 }
 
@@ -800,7 +840,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 	struct fuse_ring *ring = ent->queue->ring;
 	ssize_t err = 0;
 
-	err = copy_header_from_ring(&req->out.h, &ent->headers->in_out,
+	err = copy_header_from_ring(ent, FUSE_URING_HEADER_IN_OUT, &req->out.h,
 				    sizeof(req->out.h));
 	if (err) {
 		req->out.h.error = err;
-- 
2.52.0

