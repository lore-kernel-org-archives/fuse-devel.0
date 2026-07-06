Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A533939C2
	for <fuse-devel@lists.linux.dev>; Mon,  6 Jul 2026 19:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783365195; cv=none; b=LpAbEX18KH9/V3Xgw0eVrMRn/LvKaQNlHf4cR16Zy/gbGmxZHI5Y9TUlRKiTnDEwXa3lGr1ZJ7mvbeKCeJt7hVuRPL2jhizqQxLBgq9u2W2MKGe9HXp9rJ530gKy8pgyj7OMn1Qa9CN513bOGbHwxMoD/fHshcNLayH9viS6KrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783365195; c=relaxed/simple;
	bh=37dZLS8+XjPV2moknXidk/o2Y6Ob8gEEnVuNJQmf/JQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R9TDxzSvQXkJoKps92LGbjLXkIR2yWw1dMH+rFxFXRPDTA+2H71tipHOHTgbLm38wRP7t/HawlT5VKfeef2eQcaCv3CGYHep5vTgzOfA28NGmkkacatGAUHXrHwyEjFmpn+0NBDr3nRmia2pv2wJC5IS5/tjQHJe+feujWDzPYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=LW35/w5k; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="LW35/w5k"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-847e6f03df8so4176651b3a.0
        for <fuse-devel@lists.linux.dev>; Mon, 06 Jul 2026 12:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1783365193; x=1783969993; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vmex5FC2Ozic0gXU74AlvczPwbP5fXpdO30VDNiM1kg=;
        b=LW35/w5kAb8bI/e2GIzNvJvREkomnBeoEBJIbRi/iuGCZkqiLPNQwyFUe7RhDODojZ
         xM9+KGr6LwfBeejtJW6kWKyfX1uDlgb1iu9GNgV8nBp6uOHTn72c6jiK1y8xPfNF9+b5
         H8joEvit/7P+HhjuKynlPddZzFtJ+OGr/ZjL1a6NCrEhwgHpDkzoGbNwl6A5cBkHwUHV
         CMkIeLAzG6CZM4CiHROSO3ranaeXpRgexRCG4o+df2F644Di+CYoJsBey3FN9lOtLXsm
         20nQiVI0FK9HzmfeCVpciZKLGRK9ZMSs0FIyFquApWrtmqg0pSB5RIm54ZItrg0v7r5W
         ykpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783365193; x=1783969993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vmex5FC2Ozic0gXU74AlvczPwbP5fXpdO30VDNiM1kg=;
        b=ZIi/jTmkfqfelISDt+N2iEwrsqi3RCD9NXXRsWSk7+i2LO3ot0UBpisIf9wv29PKHH
         GJcKUHJYTE+XV3uoYwF8HAxTHv6VUQ8hOR73N2cSD8u5LU8MB1Y608Cd3n6z958o7oCh
         AgNqHC+C5GlBva9vSCPvIrQ8r9svPw/NsoT28AuL7oDLw/O9qF1ZVN8NFNMmv8HPBoEC
         IxgsNHerpVlo6GTWljTNue4qJcc3ldKRhdfiCyJbpv8SdIFPJrfQit6+ntGWblrAPs1L
         DSfK/ZRqwzs/sDoZ5rGkSvPNwD4ut0Jdq2EJk9t5ed/sqjNSh3fW8VNRF8tY1vAlFTV2
         E1hA==
X-Gm-Message-State: AOJu0YxXpbmeBaZR3aysjMpjxVC1ujyfdGhm1aH+ap8hvKoUeTTXP0c1
	I6d1EOug/sb9j7uIQgF6xk3zhvs6SH4gqc/UkmpV9YraLywRnRtYlaw0+q7nrLP24A==
X-Gm-Gg: AfdE7clVgpO49DixN8IrCSd7uXhFuLA0bgPqvbTLeaJNJNf7BgUUJ+AsV9Djpg2xiQl
	UPyHn4Jpeiw59KxAotQ+M09EFn8Ojk7jCZ4XZn++qWZF/hFNwwE/Dk+YIBtRuM5KrkjLA+YZuUl
	FDsWFegunbc9EHoZAzzLKoPsTBZHlWoNBMa8C+xpRVdxOXLgLLLnQdOma0mtedFEy4KCELfxJUi
	mxE0+gyOGtwExKDO/H3OFGYDv55we2/zasistNam/ZSY8Ay8Apk7GGYyy+3D2cP1nnErpp/oQeJ
	OiOx1SGiCnLV/F5/VNYlEBlPwatUxoNtFyLw1eHTcF/rNpVFv4K0lbVPUfbtQeYgp02NtnBD2a0
	TJWPvfnbORJfuVSEWorKeCVKdmo95iTUWTqHpzxVLV4Lo3AikaS+1bIyKYerQmaVzJWOIsmpxVw
	==
X-Received: by 2002:a05:6a00:4652:b0:847:9656:4f6b with SMTP id d2e1a72fcca58-84826c1dfaemr1935180b3a.4.1783365192857;
        Mon, 06 Jul 2026 12:13:12 -0700 (PDT)
Received: from p1.. ([2607:fb91:1505:a069:3376:a42b:82ac:8903])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9b389sm4343231b3a.13.2026.07.06.12.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:13:12 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Bernd Schubert <bernd@bsbernd.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Luis Henriques <luis@igalia.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH 1/2] fuse: copy request headers via a stack buffer for io-uring
Date: Mon,  6 Jul 2026 12:13:08 -0700
Message-ID: <20260706191309.2887515-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fuse-io-uring transport copies req->in.h out to the ring in
fuse_uring_copy_to_ring() and req->out.h back in fuse_uring_commit().
Both headers live inside the fuse_request slab object, whose cache
(fuse_req_cachep) is created without a usercopy whitelist, so copying
them directly to/from userspace trips CONFIG_HARDENED_USERCOPY and
panics:

  usercopy: Kernel memory exposure attempt detected from SLUB object
  'fuse_request' (offset 56, size 40)!
  kernel BUG at mm/usercopy.c:102!
  RIP: 0010:usercopy_abort+0x6c/0x80
  Call Trace:
   __check_heap_object
   __check_object_size
   copy_header_to_ring          fs/fuse/dev_uring.c:618
   fuse_uring_prepare_send
   fuse_uring_send_in_task
   ...
   __do_sys_io_uring_enter
   entry_SYSCALL_64_after_hwframe

Bounce both headers through an on-stack copy so the usercopy touches
stack memory, not the slab object.

Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
Reported-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 fs/fuse/dev_uring.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 77c8cec43d9c..0814681eb04b 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -744,6 +744,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 {
 	struct fuse_ring_queue *queue = ent->queue;
 	struct fuse_ring *ring = queue->ring;
+	struct fuse_in_header in_header;
 	int err;
 
 	err = -EIO;
@@ -765,8 +766,9 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 	}
 
 	/* copy fuse_in_header */
-	return copy_header_to_ring(ent, FUSE_URING_HEADER_IN_OUT, &req->in.h,
-				   sizeof(req->in.h));
+	in_header = req->in.h;
+	return copy_header_to_ring(ent, FUSE_URING_HEADER_IN_OUT, &in_header,
+				   sizeof(in_header));
 }
 
 static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
@@ -871,11 +873,13 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 			      unsigned int issue_flags)
 {
 	struct fuse_ring *ring = ent->queue->ring;
+	struct fuse_out_header out_header;
 	ssize_t err = -EFAULT;
 
-	if (copy_header_from_ring(ent, FUSE_URING_HEADER_IN_OUT, &req->out.h,
-				  sizeof(req->out.h)))
+	if (copy_header_from_ring(ent, FUSE_URING_HEADER_IN_OUT, &out_header,
+				  sizeof(out_header)))
 		goto out;
+	req->out.h = out_header;
 
 	err = fuse_uring_out_header_has_err(&req->out.h, req);
 	if (err) {
-- 
2.43.0

