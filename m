Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AAF372073
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 20:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779483557; cv=none; b=LRI9qQXymcHF2rEUzEjyrW5f73Y8F7x7DG9J92xASROd8ak5799nxgnDukXDxOp91TtVf61vqZpIHVnR40cF+ou01zbs12AHV/pMltoET5KntFr4JVKc5a/7qHp+g5XGBlf8HpsjeH1eExilpYiPIinK8isF5Up14sMN/U3a5sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779483557; c=relaxed/simple;
	bh=qNJKvO7ZS/45SaQC1V3lrsOA1xUXuuClKhA+xA3ehkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GeJZn184RwKPTmsmgtlTDOZTcMRdLwxmVX9z4+UD+m/44fdlqEdQF6oGxM95ajfUYM6+IqoIwN2YVzFXnMhvzdYi7dNz1J37dW/XLPgxkujt4yhwJ5w9+ShFCiSiqE1i+q+NAUM3kx5CKqhW+8F0GZbuOjvV6cOvIbPraERSpMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bW/ox6Ka; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bW/ox6Ka"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7bd4c61765dso76508977b3.3
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 13:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779483555; x=1780088355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHaUjx5MUhmz9+Jq4HVDevqKzUjnCKn4UGDRZVQUWcg=;
        b=bW/ox6KazXYWDn0Hvy5vfJN+L/jBQl/f2DwY6A+MnixBgLI/C1Xeg4t9YNf1gMsvlc
         ygqSRtFmzBl3xrV8kXwqHF71JfCQE3BpJgZHRsAN/fBJR5Gs2kzVoFlv/oeftFV2076h
         DKTPHhlGzJFeysHR+z492bLyTFQj6e1nfL7AWuBv0swBb8E1OrGSDl4RNlbTqf2tmDbm
         31OaNpWgAQMZ67NlNbkrb4n/uNYhW0i60WzLMFbJfKOoG2NDvmaARtEUZvrGmsDOmqA6
         4TLItkb58U9pZPhBWhHAN+Xxm+VWa+qJLkgAuk70450dnAKC//7VQknZM6LKmKbazg1g
         IlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779483555; x=1780088355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AHaUjx5MUhmz9+Jq4HVDevqKzUjnCKn4UGDRZVQUWcg=;
        b=Owk86eQliTyBI/tnKj2d4bJRtKqIgYVhjxdJHjAOdp5x4LUR9N8SFFZYq+Gd8qt7d/
         EWMhWpXMWu4UzKocLV4mGbnt8Z+X9H4jR1EvWgleEPeTOWi5NLqpT9XTRxmlgyutXRtZ
         JY8Wph6T6oymAS6h413MZ0MaQ/wx69qcLyZZzTlfeoykGymgXtPi25/h9Up9uIL/R9gx
         8VzqYP0acX7KA0bVJeFdmT1MgrFxuy0OFrd4rlBaM8WoqKQ05HqFE9fg/mhCcDabS5hk
         NucySo0x9bD6oSo75ZbABWMWwDiHYPktJv52X8qX3uoyBTo/+wV/bc98qEENtRacVZmA
         2YiA==
X-Forwarded-Encrypted: i=1; AFNElJ9M4eXIJ6aCnhNteV1bR4MjfP4+oWloSvOvO2vtG1o/y5YEsgfP2BJzNsg++E9jDMYiIvLlY28BVPsr@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg0k5r8qlh4l+wKek5F2dR9BIfLEGnLRpG3lG4UJ990KgzVhzI
	SzZ+TWFP/cuAtT5NFX5f7Sf7uVYjX51GLLp0HoqBhrYFSJVs2LySZavY++yXbA==
X-Gm-Gg: Acq92OFvvubudBoUXHAZ4CLqjanEFNOm1cCR2luUHYJj/Qkb/LosCh7qEuMx4+hdnd/
	gRNkJbUHpIKlAeJcip4ZHqp/8pqx7CPNH5CxOdYt6l5V5daE222x3L4A8eygSaenKwNY3HEoTYK
	5OVvfMufZ7mnk47CBmfUW1MhY5jX9VHEsF/P0thpCKVTaMenFzX1f7yImSi/SKRMhN2T/sfTs7+
	IBKrAOmGCE3VO6fVRYXQ6aDtgvlBGIgGbnabe0vF8SEh0xhxk2FNR7u5X25Sm05HHpyZDDBkB1G
	Dh4yzejE50lx6DCf5g7gI4+3DxuH1zO7wzsMwBeuOyqJpN5BSRZHEJJV6V0bW8rZ5BaV+ERYhAa
	6h/WbSS9jxUa0DFcr6xQuoTbVu0JqK0VxwaO7ZaBVVfe48s/HF080f057Ozrl+koQ2LFvvYZgaJ
	8zhm88IdIJ27sMlQUO2djY1B+4kyqL
X-Received: by 2002:a05:690c:c458:b0:7bb:712:a768 with SMTP id 00721157ae682-7d333bd8ba5mr60155507b3.7.1779483555171;
        Fri, 22 May 2026 13:59:15 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38c33c8basm13429777b3.37.2026.05.22.13.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:59:14 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	jlayton@kernel.org,
	axboe@kernel.dk,
	fuse-devel@lists.linux.dev,
	Bernd Schubert <bschubert@ddn.com>
Subject: [PATCH v3 03/10] fuse: refactor io-uring header copying from ring
Date: Fri, 22 May 2026 13:58:16 -0700
Message-ID: <20260522205823.1597313-4-joannelkoong@gmail.com>
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

Move header copying from ring logic into a new copy_header_from_ring()
function. This makes the copy_from_user() logic more clear and
centralizes error handling / rate-limited logging.

Reviewed-by: Bernd Schubert <bschubert@ddn.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e990abb752da..d5667738fc2d 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -582,6 +582,18 @@ static __always_inline int copy_header_to_ring(void __user *ring,
 	return 0;
 }
 
+static __always_inline int copy_header_from_ring(void *header,
+						 const void __user *ring,
+						 size_t header_size)
+{
+	if (copy_from_user(header, ring, header_size)) {
+		pr_info_ratelimited("Copying header from ring failed.\n");
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
 static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 				     struct fuse_req *req,
 				     struct fuse_ring_ent *ent)
@@ -592,10 +604,10 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 	int err;
 	struct fuse_uring_ent_in_out ring_in_out;
 
-	err = copy_from_user(&ring_in_out, &ent->headers->ring_ent_in_out,
-			     sizeof(ring_in_out));
+	err = copy_header_from_ring(&ring_in_out, &ent->headers->ring_ent_in_out,
+				    sizeof(ring_in_out));
 	if (err)
-		return -EFAULT;
+		return err;
 
 	err = import_ubuf(ITER_SOURCE, ent->payload, ring->max_payload_sz,
 			  &iter);
@@ -788,10 +800,10 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 	struct fuse_ring *ring = ent->queue->ring;
 	ssize_t err = 0;
 
-	err = copy_from_user(&req->out.h, &ent->headers->in_out,
-			     sizeof(req->out.h));
+	err = copy_header_from_ring(&req->out.h, &ent->headers->in_out,
+				    sizeof(req->out.h));
 	if (err) {
-		req->out.h.error = -EFAULT;
+		req->out.h.error = err;
 		goto out;
 	}
 
-- 
2.52.0

