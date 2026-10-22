Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680370;
	b=xSTg+ZwPn+uuqPOZsbhHrzwNcKVH80GO6QHWsBZ6jgKoUylo66IIar8epmP198wBgsKZ
	 3KMIZk2iV4V5CEK+KOjRom12uoVx/PKYmYesN4Th80zx2Pn4/KPg4zoc9iTNN7WV3uxS8
	 Pf0uI9KAeFnaUCErONVzkBXsVmbs/usDRtPO6b4aXw7cUPJZ5a7e5Tg1ODmh4WYqJBO89
	 mdSNryrbFqE9Uu0wNMTU20mSsGOdxetWgSTFyHCIIiz9ApLLQAa6vEre7kt3PP8ziN5Qy
	 Sb1faHiZmXkxYVa8PYEuk2Y6KuHjK6h8Orh5Qvs1F1XKWsa0W9gVI8w6yQ9rm/y4Qwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PrklBKkcVwO3V8O9sw0CVF0qG6S9AFzj2KttEqdFQnA=;
	b=JqNele467pM1XUwAZYDvH5Y05VNl9Nq74cAnWyVCHEsyUSaUJZ6LOkfqhCzEBB8aR7ii
	 be8GGyKFzfx381lIVM3YkfACJXZz31Wca2N38gqfY8wSsCYP8ZWtYSRfqUJjSdh75DEa6
	 53ooZF/Wd0FnZ9IS81xQ3LIJZXRefOijYD2dT0gx+zJe/hHCfNAEx1QGo4SR4mWLM8MRc
	 W/z+/C+mrGMB14cWYVTZoF38yPY+CYQt1Zz7AqunGQzs2algr1Ahqoxm/tsyw2J2e9dBS
	 PpelQ6H8h8pu5IsfTUv0khebCYtgqIs9xRPPPGgFj7KduLVa9UpS+uyM3/qgGXzGTwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EsG7aTZG;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780AC606A31E
	for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 14:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 780AC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EsG7aTZG
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-157fe9d771bso2499332c88.0
        for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 07:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680369; x=1793285169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrklBKkcVwO3V8O9sw0CVF0qG6S9AFzj2KttEqdFQnA=;
        b=EsG7aTZGacyAoiCgRAgEIuY0erQLN5atmuj9gV1OlLMmukNC4vii8FGLEDsss8V584
         F8Bx8JSc/Msr0a23kxa1MZqgkZUqtXJaWc4heUvDyodjoknT85OcDZHHCRPZ28msSR8S
         86fqFMb4VotMUgo7R+kc0URnsDK1MQTFsOWvqZMRXJd8GpKNdEpqMjwjk8G4+sUgu0pS
         7OpD/M1gXraG3c1BYPBh64GjaSh5UMeT+noGCarvBcDhy5paow566CbHdhT3RbU5US/F
         qv6fDtwPAchiYlIb15m0o9sFp0bUbhLL3oZuSyKzSXZaCUbZoHC65q3cWIaBI9a49WxW
         W+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680369; x=1793285169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrklBKkcVwO3V8O9sw0CVF0qG6S9AFzj2KttEqdFQnA=;
        b=JzZ3sXnMyjWBWShDid2Ca+9EzFgdEGuyYNGft/OdaBR94LXbmnt3leYKhQSu3lITre
         pWiijA7Lm/Bk6DUvbL65d5VBgIN8KGZ0sN+MKP9dKMPNVA/OwdsHhwdJkWYlIGR4Sq8O
         tpH55JRqZdERH580MpnwAZ/bOm7Fc9sLsmauZzETDCpVQx9hRVYEuKy8WAdabBBShVGP
         2sfT/5wWBhQdTySd5/KhsXka+lOlLokpWxzynlcodDNffRxPueiq1BIkz00LsPUxWXeu
         /FqM/Bqdk/4Id1hxfhbgqf0uUqMZGKqtEaXWfnwc3dMU7ZINwm6XOKtWnhDLWB/kAtPh
         gMWA==
X-Forwarded-Encrypted: i=1; AKwUvBxhnZfoWmMlWTTJtOmjrSHrOCsImJ5zaNWJbYJ+y4LoS2mVqToHHB4h9NrbvqE0oEwtCxl9KVW2K1xb@lists.linux.dev
X-Gm-Message-State: AFq9FYJxRlOHTon/C5mUi6VtsJXRu+O/EZJTmAMa+/7sNGT/yj/WFtCd
	cx4SJDqC465+EiUSfsj52QwGBFDs3GjsWBEajwuv4jWEWx248kSJGFs=
X-Gm-Gg: AYBFou0GjYl4vtHWrKjn7kEgk+LLG6Q7mUApU5yRVacD1b+GkHHpJDQYygN556pB6JW
	glTYsv0VtCkcflpt8Ufh4hLjKwM2XGvaJ3pDaMBZJpkWZDerWaHUu1Pf90/scMhxSAME769CDaW
	SZWl1WVBKkqfGrRSgzYb13aWaCMqRYw5S0Y5abzvD6e0NgOpHbTAwDIQYeWGNOU6/eFviazR0PJ
	s1n/U+9au6SFZ6rmU32XDK4hkM8Qr/o6bm516q0kuRj71M9hQ6bOimfpFaL5RqrPvBX4hmRgSw2
	G0k2WruQSBmAOZL3S76SEiuJgRB9K4NLBvq8G5zKbKyI8TBoEDJVEcXzrtd6irwI7rmH6i4xe6z
	pgoWD41gVbStdwoDR8X0GgBjsAJI9jVD8JV5k/ZlZuY+o/w76hxjyeL/Q8NeKUCdiFUURaqXNLN
	Cg7JXdlvE5L8vu7VUsGy3ggaclzidPKoF8o0NFL3k3Z1K1T/B0tgXUsn6U12ZGLaQHk6TunOq+B
	34vO5vQuts3mIn8jpk3Gq8JuDNiA+mfNU0BJJbBd3X6SXaaWGyzHfBzPU9meGF7Z8ZS+QD+TNuD
	0PztQyv3FVchk3863M8a2JjBTgabDzH2u7OL1CbujQg=
X-Received: by 2002:a05:701b:270c:b0:190:d9bb:281f with SMTP id a92af1059eb24-190d9bb28b2mr6570477c88.18.1792680368388;
        Thu, 22 Oct 2026 07:46:08 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:e55a:5016:92c7:7a35:f3ff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm23625880c88.5.2026.10.22.07.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:07 -0700 (PDT)
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
Subject: [PATCH v2 4/5] block: map dma-buf iterators in blk_rq_map_user_iov()
Date: Thu, 22 Oct 2026 20:14:55 +0530
Message-ID: <20261022144501.2478417-5-anuj1072538@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022144501.2478417-1-anuj1072538@gmail.com>
References: <20261022144501.2478417-1-anuj1072538@gmail.com>
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
---
 block/blk-map.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/block/blk-map.c b/block/blk-map.c
index 9cb9605d1f62..d1e096fdb03d 100644
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

