Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB0A3783AE
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 21:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298414; cv=none; b=YgNV3gH57y7MEeVYwkJyi6TREkeUgEaYmlsPINmG4EJmz5pMmVFxeQNjXZIaehChe3D/Pwy8qK1UEkV49Mv9zT1qpNm6dBNgqz0H1nlK+BmtSZrMUr139KUf+hsM+1uJ43eCjnbb+RINTfGSoyJrGoaoN532buxT50AY+Jtcr2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298414; c=relaxed/simple;
	bh=TQO2gkGRZXq7+VI1bK/jhPC5fUHNuSgP4RQEzuqqs/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ur9jrKbiRkfxulRCTTy/H3eCjw8Nv5lTRPTqX4BhOUP3XcF2XXfLz/+IQ6/bkdLoY8PSfa26QCcR/c9HkrR+4nhTUnUx2JN9syp1WhwJViC1N3pHS7i3rbHz7k7EwTBdAP3n5MbxDEHUxLSFo71Pmh3cOlFJTa5Q1QitAbYeiMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfho1D39; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfho1D39"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso13254435ad.1
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 14:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781298413; x=1781903213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J60d55nzSEpS9mjCd1Eew4uUUkBqTT/clB5V0NYI2gk=;
        b=nfho1D39JLYicy4UGWXqvp0TJ2lI5FsDN7EXDLXIjiaBAE6x1HGbagn9Pyw3kG615o
         qIfMoD0MB7Hx+SwpJfEr/IZq1GCL6PP7gTWBLdGkiciyBUBd4ebgPjh+Vc+LJrlZvM9X
         zOo8pUz+HUTleJY/k/Uk9BP/nUAWtqEB8265KxIl0qNPrNcfm1skvt7P+SrA+3GCBe5L
         LTAG8WPSkgyamGTSyRzPBQMAfDa/VEsT71K7B1sVsrN9dAWUXaE4iI4CSDp0R1ugo6Wd
         oZ4eWYT+nb8SkSVAg/qAIry1qD325OMC5QGKRsW4xJ0QF15PcydeqvuMln5Bk3vGhzCS
         A1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781298413; x=1781903213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J60d55nzSEpS9mjCd1Eew4uUUkBqTT/clB5V0NYI2gk=;
        b=SSHuFwkV9hsweRfjwD/z9VZKGz0TWXHUEljVextQXt2YEKZDEo+0q6AIaDAq87XNG9
         xcTlU1e2AR0Rdowy4Ml2P/QuOyvpYTKpx1sqieisFidR/JFvbTRkz6ASVdo4O96XQg3k
         6IoG9c65wchPSl/bCjKI0h8OrSR+LfgFgzoGyRJtbHVGv9aJEFlDB7zQf8Xji6ty1N2h
         oGf9+gBIxp4969q11B9R5Pnd15rPKy9Zkopx4egEkDLlNOyeAKkTwQ8eWOtmaRdbJ7dE
         Jwl7fvRfzlGA3dKNwRYAonLVw+nDfewTU4fOlVzBj+oBWR7DHT067oYvb0B5m7+ZMnNB
         6HUw==
X-Gm-Message-State: AOJu0YxTFvUPSbW0/YOnqUKDov+n6Y4FR88i3hgIbxWqXjtRq9WquLP1
	X85B6iloi2Sag0cib8nXD4mSR9SOkrwOWFR0bazMR2JFuJ6nSMFd0lk7
X-Gm-Gg: Acq92OFj5UAGQQu0EG6ylTLj50AAcLlrNkpqtEYbgCB4KvLgZHodSspCayyu8Xk+2wK
	LhIv48en0KQPSs3pC8k4fcDsZHIAcGx4IFrH+G2U78yq6PKSMKBkIzpLFVmXU+e4u5Re3r1/mMD
	w2l0ZT/uBsO4JeSwpcSJENO/ox/IPDG9dfgE9HmFtaCwVlkRXu0ysB/pLZHkDuPf31iOooENPUO
	1BM6S2rZzgMWNpDlOBvh5bP/1OJjM8icSLZ2rgzg6DuSjZRuaUTTGhV6vux5M9nQGEE2PFU8xs3
	6Y1SocktINhc6Bj73MWLs/sWePvkTPpQwtxTElaUh/gIuKDVP1OfXBrJMmWlgowG9pGBtC3CesT
	wcYqnmTb/KnzAJNXklqlcluTeufCzgwNlpEtqWNXC1B8KRW8vPO1fi+JH/5WBdGSKAXiPd+ywT0
	VIYpbE25NigYFkqC0EfDrkYYaanOVy0ZAveZcpwgpXaDOl43yuWk4P31J1o18UexhqsTzlzxbEN
	A==
X-Received: by 2002:a17:902:c941:b0:2bf:222e:455 with SMTP id d9443c01a7336-2c4109ecfbamr53358285ad.7.1781298412709;
        Fri, 12 Jun 2026 14:06:52 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c52sm30101035ad.22.2026.06.12.14.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 14:06:51 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	axboe@kernel.dk,
	jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	bernd@bsbernd.com,
	Bernd Schubert <bschubert@ddn.com>
Subject: [PATCH v4 03/10] fuse: refactor io-uring header copying from ring
Date: Fri, 12 Jun 2026 14:05:06 -0700
Message-ID: <20260612210513.1516038-4-joannelkoong@gmail.com>
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

Move header copying from ring logic into a new copy_header_from_ring()
function. This makes the copy_from_user() logic more clear and
centralizes error handling / rate-limited logging.

Reviewed-by: Bernd Schubert <bschubert@ddn.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 1d37a2ee5532..42627838cfa6 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -590,6 +590,18 @@ static __always_inline int copy_header_to_ring(void __user *ring,
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
@@ -600,10 +612,10 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
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
@@ -810,8 +822,8 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 	struct fuse_ring *ring = ent->queue->ring;
 	ssize_t err = -EFAULT;
 
-	if (copy_from_user(&req->out.h, &ent->headers->in_out,
-			   sizeof(req->out.h)))
+	if (copy_header_from_ring(&req->out.h, &ent->headers->in_out,
+				  sizeof(req->out.h)))
 		goto out;
 
 	err = fuse_uring_out_header_has_err(&req->out.h, req);
-- 
2.52.0

