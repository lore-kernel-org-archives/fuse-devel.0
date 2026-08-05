Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01503DAACA
	for <fuse-devel@lists.linux.dev>; Wed,  5 Aug 2026 07:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913838; cv=none; b=ITEW/xS/mz8wO+OjfiM/QwQ16oABSACkNOYLH8MutgTL2ScrIJwvpYI1tG0SHN42E8Hv7vPtV0yhu0XXNrvD70/f7+X9M1Vsdv2ahg38H18AG1YcEuRfahau3+GqauqQsRHcPEx/g0k4yXwviVAcs+cDdYAGa/+t0uWGEMxSQjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913838; c=relaxed/simple;
	bh=N3mO1b011qA+KBHCe7QtNtviBAochPCzqgohVFrsKZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aNj3ztbWAvXTO1ayYs6c6GsnK2BGIdJ0y3Xi8gmuHByWyDIOjJG8hyPbPC2sRRGfxwAwFDKmDISZyhOK2bueaXat4s3LXO/q6tQGqi5blgVNI14dGucb4PW747vfrerR9D7+7LsTX7l6CoCzyM2QibzJR6W8++3WYfecP/OcfVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=RIvw4VOa; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="RIvw4VOa"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84a2c90e383so1427004b3a.0
        for <fuse-devel@lists.linux.dev>; Wed, 05 Aug 2026 00:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1785913836; x=1786518636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I4p7A4a8uzdqY/w2zVL3zSZnd/Avw/OZHzP9cuvYZiE=;
        b=RIvw4VOabRhvTA4dB7IPAXrob3a7XaMgfYNTzOQHaaSbyxC4J4NXa99MX4/63Bidpk
         c5dfGZPDCYTH6zjsJMG2UqAer63MZl/c693t4z8VBVhElBVTsQzwQgia0eivCyEx3kiF
         Hv5Yjz7fRqkzzURQrQbwhaQMRo8Cte/U4w/HDSRQAt+u+ROS/Tfx1zoeKuEJwSwi96rJ
         5VGsVdQJxSmQyKXmFM2321ZLZRwJnD6daQbLue9UWqd37LQUXIka5MJH+Os3StVhx7I4
         shLrHui25BMM9jv3YmvmGN9LMlkxVqXjN4XSsQ/xve1VL6OHBiMi/HecEeVZP52KfsHF
         zUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913836; x=1786518636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4p7A4a8uzdqY/w2zVL3zSZnd/Avw/OZHzP9cuvYZiE=;
        b=o38fhXN7ANDCtnMYOZrUp0RC5PX0yBLDr4yYmqkBSefIDKb7Crkmsm9D7bFQXPevRC
         B43CPmyuozfeeW5M7B2b/OZLBLGnoJb8lzXYv1ary9AoTmTnl/U5hG1ejUtq7TUIeHLk
         iB6+0pzzhnwzixUE6hEkqLZ5p8UMtw/M28r/sksc3NT2iZMpqOrB6O9qxEKyP/4DECol
         t7poy9XIshpQb9MzleU3JTp1GyZyqQtk5eT3nY2tQjH6bKMiaHa98Wwabe0BnXBMqzlN
         eWcP3EiyYtGntunvC+Kh5NJ5XXHE9SIbZETrUxBzyVjvosi511QRfivYCgJPIyR7wMnj
         Gxpw==
X-Gm-Message-State: AOJu0YyjQSB5P7kNkMNcxVEg7GsgoaF+4NZAyWoBpPpc+qy/PXUvrD1w
	87CT5HnO3Po6mjGQ/NFD0A9n9imNSbbUxkK7nV7S6qZOD2QSvt3QDbuUTBAdBMUSO0CBaO/PqgT
	cDevMlzKQJWqT2CmxyEtjNBrosCGj8lr8qyIOy1u8BSYuBkHntsEWU6bIdhg0pOENZfAOQ/cokM
	eOtujnyOam3Jo+CART7kDs0DwI7LTG6U/vbrJLURLIiUjcU45dBQ==
X-Gm-Gg: AR+sD100f9N17eCo3P3zmiX9qDqaxSf++4+hGD1rBs3CpycWQUojWYlN8yYTfnv0n9b
	i0xmJCvoW4/YlbUcegZlZeX1FV8kTC4ij6A9e50Vgp9H8nJx120qGeA/vF/DaHHoFDBTE/+e7KJ
	lmVcPahEPdhH/B0S/Azm8vuIbBLeNyqyiakORdqAkZ74Nm56tb+bqwpCybqA7zsMiq+olLrSBAR
	ie0lYYZwP2PwB1kVUR+sBx14zq4YRnbC5VWuxYGvR+iThfTc23/9LT00RXnInkFgGf/Y+Kotd1h
	UaZjhJL2fJ+QynV6TqETgPoPhHIr6FjRXkSg9W5ueeyQc8X57uenECzK9WRRNClglr9czkF297Q
	b03O1j1N/5VfgZfZE5KmdsIe4zf/mfZ84hVfmFfoxZjucD27jOpEZdS9eDnJoOJarHr4vUosNos
	CKJ3BJYnig7pPWsZqjz/bPx3Us0skaPuMa+NxGQIDjRs1HKIKkpTQ+TewjFceXvr6wj2WKKhPvp
	uX3dgWxPlFteFvzOvjgGzgbFhZDdQ==
X-Received: by 2002:a05:6a21:329d:b0:3bf:9bd9:cf60 with SMTP id adf61e73a8af0-3cb6c752f11mr9559682637.6.1785913836153;
        Wed, 05 Aug 2026 00:10:36 -0700 (PDT)
Received: from LPMV6FJ9FM.cn.corp.seagroup.com ([143.92.118.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586402e53sm18460076eec.11.2026.08.05.00.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:10:35 -0700 (PDT)
From: Runli <mingyu.he@shopee.com>
To: fuse-devel@lists.linux.dev
Cc: miklos@szeredi.hu,
	libaokun@linux.alibaba.com,
	winters.zc@antgroup.com,
	littleswimmingwhale@gmail.com,
	Runli <mingyu.he@shopee.com>
Subject: [PATCH] fuse: serialize resend state transitions with fiq->lock
Date: Wed,  5 Aug 2026 15:10:06 +0800
Message-ID: <20260805071006.26275-1-mingyu.he@shopee.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_chan_resend() moves processing requests to a private to_queue, then
sets FR_PENDING before taking fiq->lock. A fatal signal can consequently
remove and free a request while it is still being prepared for resend:

  CPU 0 (request holder)          CPU 1 (resend)
  ----------------------          ----------------
  request_wait_answer()
                                  req moved to private to_queue
                                  set_bit(FR_PENDING)
  fatal signal
  fuse_remove_pending_req()
    list_del(&req->list)
    __fuse_put_request(req)
  fuse_put_request(req)
    free req
                                  clear_bit(FR_SENT)
                                  update req->in.h.unique

Hold fiq->lock while updating the requests and moving them to
fiq->pending, serializing the transition with fuse_remove_pending_req().

Connected requests retain the same flags, unique IDs, and queue order. On
disconnection, fuse_dev_end_requests() still ends every request, while
requests that were never requeued are no longer marked pending or resent.

This also combines the two linear list walks into one, reducing the total
iteration count from 2n to n. The fiq->lock critical section remains O(n).

Fixes: 760eac73f9f6 ("fuse: Introduce a new notification type for resend pending requests")
Signed-off-by: Runli <mingyu.he@shopee.com>
---
 fs/fuse/dev.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5763a7cd3b37..fc1f5b9f100c 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1781,26 +1781,22 @@ void fuse_chan_resend(struct fuse_chan *fch)
 	}
 	spin_unlock(&fch->lock);
 
-	list_for_each_entry_safe(req, next, &to_queue, list) {
-		set_bit(FR_PENDING, &req->flags);
-		clear_bit(FR_SENT, &req->flags);
-		/* mark the request as resend request */
-		req->in.h.unique |= FUSE_UNIQUE_RESEND;
-	}
-
 	spin_lock(&fiq->lock);
 	if (!fiq->connected) {
 		spin_unlock(&fiq->lock);
-		list_for_each_entry(req, &to_queue, list)
-			clear_bit(FR_PENDING, &req->flags);
 		fuse_dev_end_requests(&to_queue);
 		return;
 	}
-	/*
-	 * Remove interrupt entries for resent requests to prevent stale
-	 * intr_entry on fiq->interrupts after the request is re-queued.
-	 */
-	list_for_each_entry(req, &to_queue, list) {
+
+	list_for_each_entry_safe(req, next, &to_queue, list) {
+		set_bit(FR_PENDING, &req->flags);
+		clear_bit(FR_SENT, &req->flags);
+		/* mark the request as resend request */
+		req->in.h.unique |= FUSE_UNIQUE_RESEND;
+		/*
+		 * Remove interrupt entries for resent requests to prevent stale
+		 * intr_entry on fiq->interrupts after the request is re-queued.
+		 */
 		if (test_bit(FR_INTERRUPTED, &req->flags))
 			list_del_init(&req->intr_entry);
 	}
-- 
2.47.0

