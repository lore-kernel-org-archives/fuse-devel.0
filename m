Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3EC3FF8AA
	for <fuse-devel@lists.linux.dev>; Thu, 30 Apr 2026 11:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777549676; cv=none; b=kDC6aHqc6ZB5SZ4Xuk+htMtxOf1hBBZUU7KvexBIG78gntL71iHgF22mL0OjXqS595g37KbBg8VYBfn34cgkmVnQkRlwnnYpxSY4fZkeVXj2awqUFhhzzP3oGcGRYgp4BL3E48L7+h4Fuh/Xe9SwaMM35YS6BI9X4lm2Kv5HMG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777549676; c=relaxed/simple;
	bh=FGvWyZgINiwj8fQyAtR/uqGPDJVcdLFKxghkgpd9v7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jPmEMvPGyos7TKdm6uG6pZuV3MwzmfnEsXD8FgmQYWwakQ/WvxLezps1uA4EL9Vhf6Fn3BJsbCr+IbJ3xDX2ILHEEcmGz9Lqw2Hg/5QUnDl26aBx3HnM6nWJiw+CBTzlm/5mJguTOLvSXUCPX0b+CmK3/DNyLLxEk4KJjj14UVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYvDmSzb; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYvDmSzb"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a48deebe95so7230466d6.0
        for <fuse-devel@lists.linux.dev>; Thu, 30 Apr 2026 04:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549672; x=1778154472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UKMl2l5C3LLLhXhMcjKoP/X+1+ZWimM9bltpivl8qhE=;
        b=JYvDmSzb1l6cEIO8RZw/0LHxqNtBBIc+rr9Nf8l2dpBZly0VTooyRs3YaENW0dBetI
         lMj8yyiWii9NqlDfLn93dzy64TKJexsGxgjxvA8z0DBn5pfF+r592AZM8jIVFG2KsDFR
         zqTCx1YpQqyjG9aD0Q1z9XrXbbYBxJ5+jH6cXWltnRr2MaUviK3JrJ4U9aAOTjkFP+ll
         e09fjeVtWwp9ee5DyoWNtuBLeEmVIUpoumXGlWl+Oh9Du2yLX34cIdm4297r+FN1HUtQ
         Zw1Um9dvNKUnJlgVQzT39Eo/u7ArSZ6p3m1RNVU5vdL4RZ40NPBg97+NI5KQaEnV9ImL
         G7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549672; x=1778154472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKMl2l5C3LLLhXhMcjKoP/X+1+ZWimM9bltpivl8qhE=;
        b=QWfpp0P2LsjbvbTz4kdcf+ft9T1EXJbVB9e/VI2WG3zf+a+Wu0MNqYuVPQA7J1DUB9
         UCbTlolBZFaol5vhxthpvbbKh3r89KZU+YOCqhCpAtajaFou3ZiTYBSBaZnzICuPb5Wx
         kawJFAlBCcg+FT9AVi+IGGrjCGh9cUDZjg9t8aVz6/TnDuqRVmod/get8aWfvYYFxoe/
         yeUQxa6GaRYoUjgviRhpqDS0nsleQcR3UFh57437/CrInc0IcUTgDc/TE/Se5DLgo9wp
         foi2bco0ReRcLUW2n3eh0gRmPe6RVJ7MweMjfIt5f4pdQR3Av/n123H4CDO/TtXUh+ie
         q4yQ==
X-Gm-Message-State: AOJu0YyUz/nHxvYMdOuFux8n4hG81lkLVk16eqj2mzK7jYbuSoAeDJXG
	ufvJ/ZtNTNRJWxXbQ2x88XqxzGyvVG3AH734oJ/mpobiDa2y1QgKDCnT6kCU4Q==
X-Gm-Gg: AeBDietvyJ0k9xP7IEIgVPsvuff82xeIoakufxYLnmIROb8YGq32xm+YdOTXANyS3H2
	vQS/EI6djCmSH61XV039svjKUkQlYm1NWEJsgl0EI5xUyLwzV4y1wJ7NdwA2qNl2j/iAROjHXdN
	2115/siAxmlyGNeUQ6aFJl8ykgq4/hMTjG5+eS2EMG4iLO8rgL1vXzvuzNNqth6xyHiz3NN1zrG
	rUnqQUO9uB/LmtPwS78hoXzA492ffrZBdGIfNZDft3LAcNcZ/oU3EMqxLZn7JV2LbQfIm4AYy0Q
	DE+ric/BDFH6ijeYDtVub4AluAQNGw93NzSJ3PCQVr7yysm1Kl+Lc5rI5CaQkJjHhBVc9UVe5FA
	FW2VunaGKq1rbOi/q5WBzOStum7GPHpmSD5r5Y31qfcQP1Y1REwNpR92KfJhTGZ84ql6ICK4nzB
	8XnvVTjyoI/VC1Kj6X2Hr9bpR8B9YG6w==
X-Received: by 2002:a05:6214:600e:b0:8ac:a48a:a586 with SMTP id 6a1803df08f44-8b3fe765fe8mr33597186d6.14.1777549672274;
        Thu, 30 Apr 2026 04:47:52 -0700 (PDT)
Received: from localhost ([2a03:2880:f800:3::])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ff4698ecsm15396686d6.38.2026.04.30.04.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:51 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev
Subject: [PATCH RESEND v1] fuse: remove redundant buffer size checks for interrupt and forget requests
Date: Thu, 30 Apr 2026 04:47:46 -0700
Message-ID: <20260430114746.2196348-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fuse_dev_do_read(), there is already logic that ensures the buffer is
a minimum of at least FUSE_MIN_READ_BUFFER (8k) bytes.

This makes the buffer size checks for interrupt and forget requests
redundant as sizeof(struct fuse_in_header) + sizeof(struct
fuse_interrupt_in) and sizeof(struct fuse_in_header) + sizeof(struct
fuse_forget_in) are both less than FUSE_MIN_READ_BUFFER.

We can get rid of these checks.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 6fe0d8c263df..be4e66ed633c 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1377,7 +1377,7 @@ static int request_pending(struct fuse_iqueue *fiq)
  */
 static int fuse_read_interrupt(struct fuse_iqueue *fiq,
 			       struct fuse_copy_state *cs,
-			       size_t nbytes, struct fuse_req *req)
+			       struct fuse_req *req)
 __releases(fiq->lock)
 {
 	struct fuse_in_header ih;
@@ -1394,8 +1394,6 @@ __releases(fiq->lock)
 	arg.unique = req->in.h.unique;
 
 	spin_unlock(&fiq->lock);
-	if (nbytes < reqsize)
-		return -EINVAL;
 
 	err = fuse_copy_one(cs, &ih, sizeof(ih));
 	if (!err)
@@ -1428,8 +1426,7 @@ static struct fuse_forget_link *fuse_dequeue_forget(struct fuse_iqueue *fiq,
 }
 
 static int fuse_read_single_forget(struct fuse_iqueue *fiq,
-				   struct fuse_copy_state *cs,
-				   size_t nbytes)
+				   struct fuse_copy_state *cs)
 __releases(fiq->lock)
 {
 	int err;
@@ -1446,8 +1443,6 @@ __releases(fiq->lock)
 
 	spin_unlock(&fiq->lock);
 	kfree(forget);
-	if (nbytes < ih.len)
-		return -EINVAL;
 
 	err = fuse_copy_one(cs, &ih, sizeof(ih));
 	if (!err)
@@ -1475,11 +1470,6 @@ __releases(fiq->lock)
 		.len = sizeof(ih) + sizeof(arg),
 	};
 
-	if (nbytes < ih.len) {
-		spin_unlock(&fiq->lock);
-		return -EINVAL;
-	}
-
 	max_forgets = (nbytes - ih.len) / sizeof(struct fuse_forget_one);
 	head = fuse_dequeue_forget(fiq, max_forgets, &count);
 	spin_unlock(&fiq->lock);
@@ -1515,7 +1505,7 @@ static int fuse_read_forget(struct fuse_chan *fch, struct fuse_iqueue *fiq,
 __releases(fiq->lock)
 {
 	if (fch->minor < 16 || fiq->forget_list_head.next->next == NULL)
-		return fuse_read_single_forget(fiq, cs, nbytes);
+		return fuse_read_single_forget(fiq, cs);
 	else
 		return fuse_read_batch_forget(fiq, cs, nbytes);
 }
@@ -1582,7 +1572,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
 	if (!list_empty(&fiq->interrupts)) {
 		req = list_entry(fiq->interrupts.next, struct fuse_req,
 				 intr_entry);
-		return fuse_read_interrupt(fiq, cs, nbytes, req);
+		return fuse_read_interrupt(fiq, cs, req);
 	}
 
 	if (forget_pending(fiq)) {
-- 
2.52.0

