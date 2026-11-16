Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870425;
	b=T0m5Aqx5Pt7EDL0iXp/zzDIm68+iMR+A50pHqjd2mEKATkGM9Ee9QSF5t27KggZQYvAv
	 CXMHzuKEgmH6TZfhL64ImE4M3kQJ8IItXgABKvVkJA3ExFQFvthehs8bYvknpakLvLOiY
	 dHDNBvc4r9hQuBUVR3LTB59mz/q8NvCHaDgsz6N+d5mCZu3UV8Ck1Gx+teI/64zjm8Tia
	 gFzLgUTjzTLqaHujs0ApjlMtJjYWkMWB3tztjtsOAYIcVidepB/d1pCvT6R2iMIJ0CGq5
	 DFjJHyZ/YKH5lEgd/azqRjTS2gDZtzHhNNroBZXEYUKA+HdyStpQDUvz3cz9d9g5Fmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ov7f0jCh2x7/B/l+YrluktAKi2O0zfS/6BcSjEJkDWQ=;
	b=cm+0XGppQMKUsjWhHhq0DMjgumkA2RUobhAGuvjD2Q5beyihZopT5wkxRTVLJ1/I2zfp
	 9KJw2+x5q3bbSGb24BwrO/cNTjhVBZCge+GKrKVp8KiTC1BCOUUNeeI1aCFhvDlzXCwUR
	 WnvO497igK0iA+riOkYI4g9PhRn7eiTxELIWq26ryUoGD/2P+CPdlelNt84dXZO5EV/c0
	 LqiJ102PxQAys8KegHLZr16TpDaaR0wVZZDN7qTATsqJAbAAvj1DtE4smnv12LmeY4oSa
	 LwrsZQjuYeRGSjIzS0B6ksTN5RqYE7UD5mirATpslSW4iYVRuq1r83vCI6ocew9kyDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cGJu+kXv;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A2A606A8BB
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 23:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A2A606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cGJu+kXv
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so428629a91.0
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 15:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870424; x=1795475224; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ov7f0jCh2x7/B/l+YrluktAKi2O0zfS/6BcSjEJkDWQ=;
        b=cGJu+kXvySjrzRiAE1hyA5y6h0oqxcy1DDOfqSGWlrU2kG+4qhyocUIeMdoBoCFEu4
         QFvixVglxvsqTCVMwlfyUx7CracBMF4TB7/Bmng50bf6fCthWRk9CQczgjdTJCZ+P61N
         GWhfeawjGr6E3++w4ZCZffgY+NTuTWL4KO438=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870424; x=1795475224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ov7f0jCh2x7/B/l+YrluktAKi2O0zfS/6BcSjEJkDWQ=;
        b=NSGyLCi2SI6Pdqiq6SmV1CoeeaG7QetDUTY58+94xPpGsiUWmorM2zIUOjKMj0zOPa
         f/TiZFBH6Zj1GskUrh+3q3gznqwxBoLudAKTHdJbO3lOqeIiDD7HqourBHoJyVJ9VKup
         0EG8cpUUdrCAmm42HyzQFapJmkcWr5rSWWWb1mhyjWxtqg/vTXeNnRQHB7nYhEZcNL/Q
         +K/wQzKkGvvon3I/87rMV166G3igHGEHcMZKupQihYjZdoB1L1crFGJQZPJ0Tp49jJAh
         KlVsZMlEcFl2WYGm/6vh3YXBKVyjLEV/WW10WVMHWjSq2wgzONXhB1muW5/y0l7s8RII
         Ce9Q==
X-Forwarded-Encrypted: i=1; AL+hErG+hlvnVGc9f903b2uPL1tBgIJ/SSWgPRof6oXFwOX5Z/xYbxApzyazR55CCT1Iyk2lOAeJke1+ScM5@lists.linux.dev
X-Gm-Message-State: APuU4Z/YIpgd4VLAnk4PzOrw0vGxxDplyoxjrWB2bJUAkm0wDCCv8aVo
	2V+GsmYq8Eo9RQ1gDysVzJfn3b5tHuzVcYT9NNRXIpIZgAAcyU5HWXfMDltsK5AATQ==
X-Gm-Gg: AZFdTZc6FtmJqjVXcitc+GnMWity2ZWZczrNlqpE5rZJW9CL7v67PNSDkNiBz8mU2Hc
	U/EK3fZPsUv5R45NV9T3y+BloY1ClqejrD03904RT4onQnSUvvAAbgboil/KXkG8X/2GEB8BZ1o
	eipY2KFkqxBdMwBdla6UF04VihZHWEOTZTmYP/fqsc2Iz8WNSkhueoYQgxHn1MC2YHjOd3kOK4H
	+yjpm2FY2hl0BX/zQ3DzZQ2fNyVPk1QD3WyBzCR6YDBI2XkDChzQ+tb6Sp91aecaAsEmDlBCrio
	aJzznKg6yB16Gxhw9be96cFTMZvYjbXT+iMq3fK+T+MZJbMP2Cj7a7R5qp/CZTp9M1KFnVpeuxG
	j6ECwIlJS0szH1x5I8XwxA7PLk6BiKkM2sRNcMK9aFFYrkmWWWbCG4GiK4emCjkVvRWJWe8E+C+
	eh705wvmXgqm94RueyzzdIJyDnOeuZ4cGVj6yabhklXrUoY7xTHPYkIYjjgLDT1zeCwR6tS+LWR
	OzRCJ3I38AHpL9ivY0iFE5uvCNxwrCPbltqan0Ew2SqoUX0oiIEBqtQQy1mxvPKS8ilna0XQnxJ
	mcgKt5m/rgtgAstQDfOxn5BIyAj0ZWuIA5UJHmqajS1CLppKo8sVCeaqCg6Ick79zG3yFWHahZe
	LqnYAq5WPlYkGq24b
X-Received: by 2002:a17:90b:5906:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b1b0b4ffffmr17720470a91.6.1794870423621;
        Mon, 16 Nov 2026 15:07:03 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cddc13275cfsm5035019a12.0.2026.11.16.15.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:07:03 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Will Deacon <will@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kexec@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/7] mm/kasan/kunit: add page_alloc_highuser_kasan test
Date: Mon, 16 Nov 2026 15:06:27 -0800
Message-ID: <20261116230627.3537051-8-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116230627.3537051-1-jeffxu@chromium.org>
References: <20261116230627.3537051-1-jeffxu@chromium.org>
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

Add a KUnit test (page_alloc_highuser_kasan) to verify that, unlike
GFP_HIGHUSER, page allocations using GFP_HIGHUSER_KASAN under
CONFIG_KASAN_HW_TAGS:
1. Get a KASAN tag in page_kasan_tag() across all sub-pages of a
   high-order allocation, and the same tag in the pointer returned by
   page_address(), and
2. Are poisoned on free, so that a use-after-free through the stale
   pointer is reported.

The test fails if __GFP_SKIP_KASAN is added to GFP_HIGHUSER_KASAN.

Tested on arm64 with CONFIG_KASAN_HW_TAGS under QEMU (virt,mte=on) with
kasan.mode=sync, async and asymm.

Assisted-by: LLM
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 mm/kasan/kasan_test_c.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index 72342137bb18..285b82793bdd 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -423,6 +423,33 @@ static void page_alloc_skip_kasan(struct kunit *test)
 	page_alloc_skip_kasan_helper(test, GFP_HIGHUSER_MOVABLE);
 }
 
+static void page_alloc_highuser_kasan(struct kunit *test)
+{
+	struct page *pages;
+	size_t order = 2;
+	char *ptr;
+	size_t i;
+
+	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_HW_TAGS);
+
+	pages = alloc_pages(GFP_HIGHUSER_KASAN, order);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pages);
+	ptr = page_address(pages);
+
+	/* Unlike GFP_HIGHUSER, these pages must get a KASAN tag. */
+	for (i = 0; i < (1UL << order); i++) {
+		KUNIT_EXPECT_GE(test, page_kasan_tag(pages + i),
+				(u8)KASAN_TAG_MIN);
+		KUNIT_EXPECT_LT(test, page_kasan_tag(pages + i),
+				(u8)KASAN_TAG_KERNEL);
+	}
+	KUNIT_EXPECT_EQ(test, (u8)get_tag(ptr), page_kasan_tag(pages));
+
+	/* They are poisoned on free, so a use-after-free is reported. */
+	__free_pages(pages, order);
+	KUNIT_EXPECT_KASAN_FAIL_READ(test, READ_ONCE(*ptr));
+}
+
 static void krealloc_more_oob_helper(struct kunit *test,
 					size_t size1, size_t size2)
 {
@@ -2413,6 +2440,7 @@ static struct kunit_case kasan_kunit_test_cases[] = {
 	KUNIT_CASE(page_alloc_oob_right),
 	KUNIT_CASE(page_alloc_uaf),
 	KUNIT_CASE(page_alloc_skip_kasan),
+	KUNIT_CASE(page_alloc_highuser_kasan),
 	KUNIT_CASE(krealloc_more_oob),
 	KUNIT_CASE(krealloc_less_oob),
 	KUNIT_CASE(krealloc_large_more_oob),
-- 
2.56.0.611.g1030f0b940-goog

