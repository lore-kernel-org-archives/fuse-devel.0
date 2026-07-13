Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5192F360A
	for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 17:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965264; cv=none; b=YuJozVU3Cive/1cIek/bM/jFuQJgloWGW54wMabynL9Msu8yVR06d5XsQqBAUwB1N6lsuJt4tPMHjZ7U9yKMVBZbvjCwQnHWBJBl54LnHdzs5Y3iUVDQWZkTZ8jYdkPJLx4EUOXKNlSBuuDJou8erv40q6W6ZRoa/eMitvLcnIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965264; c=relaxed/simple;
	bh=jF3lkhKiWakpsBVktimaJzqA+Qy4eUHt2cp8o/pJc9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwWE4cmiiT1OFPtCLcN3srNUnJj2nNGI21L6NKslULtoPuMZ1IHn/nYWYPRbFiqWaEAywEuajhsF3zkwA2EghGfONd3tdvU5gXVTCWqoJIHsfnnZW8eKaUJY8zjX/SG6PXtz0H4QQrkSUo0+cw7TKrKFdyqPUaLm9vK449nxfcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOd1vZtw; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOd1vZtw"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7eb64085c45so2107647a34.2
        for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 10:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783965262; x=1784570062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTazow5AK7oQsOPc1YIhM/ohcZWShlTcPJrS3UikzxY=;
        b=AOd1vZtwnvw8nK1Ev7VCKQaK3x4011EmZYcfA+mYquL+i0IN1PIq1i5xChkbmRR36b
         qGXfJ5mbMxSZQhWnIElrfHABnN/J03HHtbbqCsKSRZe4YyFwy+t0ENRSr7Qxf8Nc+mvn
         e3KUXOBmeKkBt/5Pe9Okl77jEt65xrqHcUFuyQl0r/UxsDsenucoWEdiyzSkvSeIt7G+
         Z8i+rEn59SjXIL5K9N2PstSoA57v7NtuY0xo3Mo8/OKhTlmcodlFotzCvFFBKQyTrBCf
         o2ZgIqpgFRTqGxMM9WQnhHwRkk5zWhHexaDpqVk55e93LnlvTHRuSmTjvoUDsr444OGj
         3LBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965262; x=1784570062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wTazow5AK7oQsOPc1YIhM/ohcZWShlTcPJrS3UikzxY=;
        b=GWUj8e7i5fbmJLln8eQubNW6PD+zFxCm6PM6hDmj449DHmrnmea2MAiFfB6O+o3IQt
         4GWNUHnvNjzP/phfEtDcXN9FCTdsGb2g1gqgIapy61NvdqUlIXNDMNpTPn5Jw4g1BHIV
         xDW/xXtxb1nvPYrU3AvUx6PgMNpvzAT7gbpDq7dU16X1SXEbE5wv1Y907+GTtl5Yz4Te
         koV68Ux6Vej6iWRmBlthKAEFfcrL/9SHUuyMvTD8yO/AzvZs39DdAifD/smSfudsm5c4
         PjSl4HlwLfZwGNtlPv2i0dXTGef/1zwcK/MaXFduEzSnkTmkV5exZmVsirUulsDAGXyh
         k+Mw==
X-Gm-Message-State: AOJu0YxgwoXmNgl4bIdZEDhwYQztdKAgx3TvV5Ai64DnftZXo97/ndHF
	b6n9AJJ9dH7dPMaUK9rkk7HIFn8v7vHk20arksim3OaDNfL3MpLa4ghyrLlI0A==
X-Gm-Gg: AfdE7ckFsetdO28aPP2pBMMkYmJb+eQijqu3ECjREFcD3kWBwhCNMaTMGigjrR1hsHX
	h2igqDKZm9GPQWvktfmvY88AO+NmVEm9vsKxrIei0QJg4LpbsCG/kV/TZl9eGHfOTq6C/LhQY0j
	KN7lRfrSUl00qWGOpyW4opTli07/uJxFh52ZIIuhLJD/ZRkS422+qPca5uhptES4AvFnWrXUoOu
	Rcmm35hAF4PAl0nTQKE6GUrjqmK2IY3xCGUe8HqRUW35jtrbUwm4bXq/uK9IQzOiM/I7KHRfVe3
	WbC0qCbOS4GVHftSBkiLUmg6Ifv1FSo8Y66u0tvbGQ7kqHJw9YNWNG+lIFQ5sEVq7eHt/hHbSkA
	EeSI6McxqsB0UVudoor5XG8EQaNT4P6bLPS3kivJNhnFIzOV/8+1523is+JcFjqC8M5ahxTbBF3
	vRR4mYOFAoqKEj2Z8rEFVjaVtWzgIuvVHkM3FPDEYJrbI4BvqQPpNqWakhLoHbE8zkJEFQkxIfQ
	YM=
X-Received: by 2002:a05:6830:6995:b0:7e6:d54e:8fe3 with SMTP id 46e09a7af769-7ec09678204mr6662957a34.9.1783965262313;
        Mon, 13 Jul 2026 10:54:22 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:48::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf742e1sm13630238a34.8.2026.07.13.10.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:54:21 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v1 2/2] fuse: publish io-uring queues with release semantics
Date: Mon, 13 Jul 2026 10:53:45 -0700
Message-ID: <20260713175345.2542331-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260713175345.2542331-1-joannelkoong@gmail.com>
References: <20260713175345.2542331-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_uring_create_queue() initializes a fuse_ring_queue and then
publishes the pointer into ring->queues[qid] with WRITE_ONCE() under the
fch->lock. On the reader side, fuse_uring_register() reads that pointer
on a fast path locklessly with

	queue = ring->queues[qid];

There's no barrier that orders the initialization/setup of the queue's
fields and the WRITE_ONCE() that publishes the queue. As a result, the
lockless concurrent reader can see a non-null queue but uninitialized
queue fields (eg spinlock and list heads) and then operate on
uninitialized memory.

Publish the queue with smp_store_release() and read it on the lockless
fast path with smp_load_acquire().

Fixes: 24fe962c86f5 ("fuse: {io-uring} Handle SQEs - register commands")
Cc: stable@vger.kernel.org
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 77c8cec43d9c..0ea142d6670b 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -321,9 +321,12 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 	}
 
 	/*
-	 * write_once and lock as the caller mostly doesn't take the lock at all
+	 * fch->lock serializes concurrent creators for this qid.
+	 * smp_store_release() is for the lockless reader in
+	 * fuse_uring_register(), which pairs it with smp_load_acquire() and
+	 * must see the fully initialized queue if it sees a non-null queue
 	 */
-	WRITE_ONCE(ring->queues[qid], queue);
+	smp_store_release(&ring->queues[qid], queue);
 	spin_unlock(&fch->lock);
 
 	return queue;
@@ -1191,7 +1194,8 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 		return -EINVAL;
 	}
 
-	queue = ring->queues[qid];
+	/* Pairs with smp_store_release() in fuse_uring_create_queue() */
+	queue = smp_load_acquire(&ring->queues[qid]);
 	if (!queue) {
 		queue = fuse_uring_create_queue(ring, qid);
 		if (!queue)
-- 
2.52.0

