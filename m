Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324778;
	b=c//QZO2DaaPatVrJ96KxAI6WIFAiu2dYG7Zp3yl7VhzMvnYgyuP4n1/q9bcjlNFpEOuf
	 5QDJDaPB5GkwL15Nben0Jl+qeaRoBQOXDxYvy9di7OGIFtACb0KOYB7Q1d2udxpjVx+Jf
	 wPJ0dG5RM26z6i8GVuNycJiNj/+01ZUFAWWqI1ZAZlCZUEO6irebfBrPeREMu4KDYZH+Z
	 VqN8+NIGsyHtUaljBQ2vmeD/3ib5MjRNZqdYCEMTL629nnGJ9fEewcTCno8Q7O2aX02ze
	 IEd/4cbYShyiwHu2dP4QUHQxoQtuDej+HY9xrIrAtYtmFrfTmRSNM4Kfg0QoWeqhirA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KBjoHjefEpt6gXeu0uBAO7mx6fOzElk1Inu+2ky7I1c=;
	b=BFvwCN12vufC4My6Du8tkFoso0o6NfiGmr6iMwjeNIoikvaqYk5GmOZ6sD+arMkjgpjv
	 21evJPhjEVkow+2X5Ubiq5AaQQxL/Tt3wnMe+QMVX1qk9iIOdEQ7Q5mu4pgNyTAV6u0Wv
	 xX8ILcBwATqSH83FG9zPMY1yW0nToo/mqTUjcUblBXUzA4VyEb5MCA2tVnSNdguRCeQFN
	 e2UhB4rG9MdXSOWTA9bnBWkv1lPkKdKu9au2VE0wzDY96Brzg/zgDmxir5EbVU4LD+JZA
	 uEQjDSe2JZEupSc877gawjIIgCAo5IG5byMvG0sa3AEqIRzCHUqIjKSNVHypACbvhHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=csTwu18x;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE65606A31A
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 01:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE65606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=csTwu18x
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a17a332ecso455683eec.1
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 18:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793324777; x=1793929577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBjoHjefEpt6gXeu0uBAO7mx6fOzElk1Inu+2ky7I1c=;
        b=csTwu18xgbJ2xIe0LZxRa3BGp1Beay+3hr4IRB9o5+2Q8TH5fHPFzwSJkelLTlalo3
         STq6G/n9929xrL28XceFH4xEPfTVQcFvoYlBL/R/ffX/k2GDw9GkGQQq8O4HUIm96GWs
         /vo2FbSJ9a5tKcWatdwScXDVBNeFaU5nxp44IIk5YET/EkAUyHHxIosZf0RuoyIFoE+K
         HjLVh6GW1SbUOPCw1g7C+ZWIdKZZaCqEOKU3oZHOyGtyJlSJ6EM+YdFGXYjUF6mNTnaP
         LsRnwRlgiWLWt7LedwCkJUQdDkj2UQbqSNRaFi/zyQShdl9O1B83MGY4zOJLJqaQy4a0
         KQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324777; x=1793929577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBjoHjefEpt6gXeu0uBAO7mx6fOzElk1Inu+2ky7I1c=;
        b=yXDlH6jS4bjrqj2My8f/LqnKmDLGrLGPIW8wLMQvWAB5kNvxA0Qay/1q3notpTAMFr
         r38/EKxWYxauoZQo25mO46QLZ2iAmGEdVevbEuZZkWVyeyyj8tjJIfO+uv+oyLclKjWE
         kTcJhy70Ko6cBtM0MMN+XCjvERrn15gvU0RawirowY0LA1RM5i9mO7hFdBY0/d8aiXsy
         5VHfHbqFKPQS4E30vpNlbYoayiBLz0JKih7lusTmmnPf30hAuz/hGaElVMCTCEfrOYMR
         aHula7R7aYOgcwepuIBAoLx9BH/Aqe3Pl5TyYeGw2O/k+GEcKhAwE/vHmEYYjtLsZou5
         VynQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV9kOu0ndZkF+g9HmuUqsXc1lEXjC5Q5/TXkDcsyD04+WL/+RM9fHYiju1xfHpKzJVr0C5mEjnZg/5@lists.linux.dev
X-Gm-Message-State: AFq9FYI0UbGwLBvTZEBlpXYymvysM7r1YCMC5KQhyf4vmIdk4qy2s8LO
	XZ8lSNkAL63hFLCv7M6LpSRvLjES6jNHzw3B13/rV3i2lg47VAyKal0=
X-Gm-Gg: AYBFou2mEdRt3rLBzgYLL2JwiBJDEor6aaWbQKBz92bKV8aeXIajw4ISGS5D6wUFdUS
	No6W4jA+QDICnsuVnh+ALkuP9itRSJyH+6p6/EgeADACEF+UYOTBeV+pb5QbPgxdWsGXEbplnMc
	WMdFCrrz8nFR4ym8aqCmgJ4AMUcGP6BmN+QuSpfU0z793RYAqPf7X6ZNuuADmcIJH2XOIC9+Y0B
	t3jlUGqiC2WlLX2+yFYkvbMv8DD/zYKxqNVfwrMImNL8JrsqptejjNwPMgwpahAWXp0YlVIfkk5
	gmsJjvDE6aWIyHxAvak/H3cKA8TNfUmdv4kQmWCHzHJ0G9UnHuVZIZ37Z1Y6KzVNcua19W7WODH
	W0+8rIzWu6CoOLJXmpBCp3EVQRe5st1ZrYx0L6A9x3NDfOvCffdQNfCfyY0tmdPjS9MdhC/WwTl
	AJPKDL3aEKdsLyBovereFNyJnqmqJLnLFtAW8xKbF1PNYPV3zAGtShs7IO+7e5SnyoDBYerLsUw
	l0S2w4el9H6JTP/+cu5rvl3poEeJvIb9gYkapf1qv+QWXQWgh/YnoBwWiSz04/y1B8xyGM29jQ8
	ogsAW76MbKOniOx3WSjc8r+htZJkZgavehDe7WjhgAwweS/OBFrb5Qwo1rwcKNc/WTlwfx/HygH
	Y3jLgQRc73wneuDVy
X-Received: by 2002:a05:693c:20d3:10b0:369:fa21:ba0b with SMTP id 5a478bee46e88-36a42451227mr1548074eec.33.1793324776753;
        Thu, 29 Oct 2026 18:46:16 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:75fd:f9a4:4062:7980:1324])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm2209020eec.12.2026.10.29.18.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:46:16 -0700 (PDT)
From: Anuj Gupta <anuj1072538@gmail.com>
To: axboe@kernel.dk,
	asml.silence@gmail.com,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	bernd@bsbernd.com,
	joannelkoong@gmail.com,
	miklos@szeredi.hu
Cc: io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	joshi.k@samsung.com,
	anuj20.g@samsung.com
Subject: [PATCH v3 4/5] block: map dma-buf iterators in blk_rq_map_user_iov()
Date: Fri, 30 Oct 2026 07:15:39 +0530
Message-ID: <20261030014540.3065403-5-anuj1072538@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030014540.3065403-1-anuj1072538@gmail.com>
References: <20261030014540.3065403-1-anuj1072538@gmail.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anuj Gupta <anuj20.g@samsung.com>

A dma-buf iterator can't fall back to a bounce copy, so map it directly
with blk_rq_map_user_bvec(), which already handles it through
bio_iov_iter_set(). Fail with -EINVAL where a copy would otherwise be
needed, and update the blk_rq_map_user_bvec() comment to match.

Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-map.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/block/blk-map.c b/block/blk-map.c
index 7369aba74771..a65b255b229c 100644
--- a/block/blk-map.c
+++ b/block/blk-map.c
@@ -459,7 +459,7 @@ int blk_rq_append_bio(struct request *rq, struct bio *bio)
 }
 EXPORT_SYMBOL(blk_rq_append_bio);
 
-/* Prepare bio for passthrough IO given ITER_BVEC iter */
+/* Prepare a bio for passthrough I/O from a directly mapped iterator. */
 static int blk_rq_map_user_bvec(struct request *rq, const struct iov_iter *iter)
 {
 	unsigned int max_bytes = rq->q->limits.max_hw_sectors << SECTOR_SHIFT;
@@ -506,6 +506,19 @@ int blk_rq_map_user_iov(struct request_queue *q, struct request *rq,
 	struct iov_iter i;
 	int ret = -EINVAL;
 
+	if (iov_iter_is_dmabuf_map(iter)) {
+		if (map_data || (iov_iter_alignment(iter) & align))
+			return -EINVAL;
+		ret = blk_rq_map_user_bvec(rq, iter);
+		/*
+		 * -EREMOTEIO asks the caller to fall back to a bounce copy,
+		 * which a dma-buf can't do.
+		 */
+		if (ret == -EREMOTEIO)
+			ret = -EINVAL;
+		return ret;
+	}
+
 	if (map_data)
 		copy = true;
 	else if (iov_iter_alignment(iter) & align)
-- 
2.43.0

