Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404686;
	b=FzaoiJKfEPvoS2ZJ0DVlJ7Lm+/IPQUJ6LyHm4UvcP6XqQBX3d8m8zIxKCChPWMbuo7Lf
	 wAtmAGGIPHDcsj/L0dZSwinxR7CJM72iskNVU47vnezT0IB8ED8p03EaukOmFS7ei+S6x
	 HysvlPELzh9gsh6nKFtAeISJlCuDGuzHyKyTe6fE+JyQD1klsP43I54J/bNDAG/gu8sy+
	 8WviziVj+UP7bOQ1YmvtYkYln/QQtwBfqj7F9A8vFYwQY7iuXCmgm6b/VeKW17+FwEU7R
	 9Va9bqSrS32IKrVOM0ln0vFOHVjf6A22Rfr0/KnNsA2AvIFnZDrPOaeWUdhSFRztlhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ar/2HKjK+NYDL4XIdqT0HePA7oYDrfs2vyoMNJhSjA0=;
	b=XImiQm6uBCRszpcinMgZqoXl8/ZGNcUy4mCcUkSowoeO3tiGvOMqy8VT2JFLlp6QTOT0
	 MNU3n8eyFkN6hChMtFiFNzqu4fA3o8GLoJODbYg7XFFKMbdqjb61A6rWozgzcrlS9bZ5a
	 w8A7FDXW+80A+6OYgeOi6h3rdZCvbUptuZR2ypD2w0jRv6ShugMkTJHoNwnauXe/vJrwu
	 rGxCxtk6ahMpVEECLNFGD8H57DvDkm8sdsHscJVu6l6TSutj4WBQOxqPHDMDE0/mxxL9z
	 N++PDmHvWShKzR/KUf1JeKdQb5ey7zGZecifca68W4XIsz3KWrj+JlLtBQ0rn9XkIew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Xl6sgsFP;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8D8606A691
	for <fuse-devel@lists.linux.dev>; Mon, 23 Nov 2026 03:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D8D8606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Xl6sgsFP
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd6b9a2735fso142589a12.1
        for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 19:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795404685; x=1796009485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ar/2HKjK+NYDL4XIdqT0HePA7oYDrfs2vyoMNJhSjA0=;
        b=Xl6sgsFPZRjvLIXsp2GvfpKQrEptx2X8Aj8AQ24RRAaEob9c2FF7KFtGjm168z7sNJ
         KnQ8QA5KYPa47xZyhxUlzZSjmJvQN4Mf97msS8qY3JtYTHVnEh1bYz6n9F+xXNoMcZt2
         m/iJd1IxTIVGdlRjvKbT21N4s1wvfa8QghPmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795404685; x=1796009485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ar/2HKjK+NYDL4XIdqT0HePA7oYDrfs2vyoMNJhSjA0=;
        b=mC9a4yNVTYSxc1iV0HM2dViAU/wUtFLY/rT0mCacT2T6Cq29Z3nCzYI7fw3bFixWQz
         nX7KmfvYA60Fo+Pjsxu80VfkouLM+m8FqhjJ24FrbwypZLrY9p3S2w4TvIVwal8JoTZt
         F7Gr7xZ3ecc6C2kVpi1S6hRSiSRGDQ377F/2UhT5K2hLRlzx24FBq6wyMtDhriuPe8la
         gQ+x3Sa5noFgrc9BGthRROUAbYI3runjZPKhGELLpf5vkEG41DqyocpE+sb2Y3wGOVhZ
         HQdky3vAhxuC+6vD1i7jM/IAg3Om5FNm2/uABR6I2psi6icl0A/IDdCJ4/SXb9Hd8caE
         Zh7w==
X-Forwarded-Encrypted: i=1; AL+hErFVG0jvKsgruGmJ2pC8kpN3gRIJHVv8SScRXXOSCCbFHdaIARy1gVp9EbzJXr0HcGV+n9vgLUjB5yEP@lists.linux.dev
X-Gm-Message-State: APuU4Z8CUEyAW7RZAgby3jhFD2plGXiVfchV0P1sPptDYOrsJgnDQM+L
	0gsPqBKa6jkldb8g+YYC0pE54gxUdXXZC5K4KB09gU3xN0kJYgjJ+EretHIt9EUISA==
X-Gm-Gg: AZFdTZe0RJazgzEfjB7/w2jXDItGGvVSmj6foOiWEGq4PjDc8YIL5hPzywpJ44tLfIi
	FNL5X+O4xQtd+R0IzPv4lV+01pS+2ox0nlmFVPaWoTAZYclq3aGj5saf3xcgmt0EEkCmSU465nc
	kMkxP15RYZzzW+cwkU1IWnoEyLoeMn5JpRDeeHifZPBfo6fZHXv31EBdRkVCgOvqpCCVimlaXBE
	vLg/fJ9ykDoxs2duRiwHTdrWMIV1q+XvoEbQv63lZOLZFaxGBOevjYaLIFCmIXB/n0Dj6iAROnm
	gL4F77x080dhQO966Vy1eQG0iOEZA2f7R9pabnAUaJB03o4ww3dMN2nFfgMkQCQuP2AhUFrvzAL
	fQHQ/2tuQl3vikaNUegLIFd74qHHQSF7GPfGlEXJsxArltmALwDtM1hMDeRG4itdaIaFBgNG9f2
	bpPWKDZxoMKLI5ed5t1KBtMg9oV9aPVLCjvtGqepRw+eTPzPy6NiMCe1k/hBeG8k1fMlsl/IBS5
	AMh3ZfxNBX0dJzp04y9dw84C6GjRY6SNUbdnBkFL1/gSU1fY7yA9yCufEr3Rw7hvsL3xG1QIu38
	v8+b9g6im/I47vcdRZ2LdLhxX6hwWqqgA/EgVLtKbDQaJraMu/0tofiI7xAW0lw/cy6O7A==
X-Received: by 2002:a05:6a20:9f08:b0:3ef:2f72:c7e5 with SMTP id adf61e73a8af0-4014ae6fe31mr16689502637.2.1795404685515;
        Sun, 22 Nov 2026 19:31:25 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8c873f16b41sm4720304b3a.56.2026.11.22.19.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:31:24 -0800 (PST)
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
Subject: [PATCH v2 2/2] mm/kasan/kunit: add page_alloc_skip_kasan test
Date: Sun, 22 Nov 2026 19:31:11 -0800
Message-ID: <20261123033111.2349160-3-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123033111.2349160-1-jeffxu@chromium.org>
References: <20261123033111.2349160-1-jeffxu@chromium.org>
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

Add a KUnit test (page_alloc_skip_kasan) to verify that page allocations
using __GFP_SKIP_KASAN (GFP_KERNEL | __GFP_SKIP_KASAN, GFP_HIGHUSER, and
GFP_HIGHUSER_MOVABLE) under CONFIG_KASAN_HW_TAGS:

1. Reset page_kasan_tag() to KASAN_TAG_KERNEL (0xff) across all sub-pages
   of a high-order allocation, and
2. Return a match-all (0xff) linear-map pointer from page_address() that
   does not trigger a KASAN fault even when the underlying physical
   granules carry a mismatched tag (such as KASAN_TAG_INVALID or
   restored userspace PROT_MTE tags).

Tested on arm64 with CONFIG_KASAN_HW_TAGS under QEMU (virt,mte=on) with
kasan.mode=sync, async and asymm.

Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 mm/kasan/kasan_test_c.c | 44 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index f34163e19bd6..72342137bb18 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -380,6 +380,49 @@ static void page_alloc_uaf(struct kunit *test)
 	KUNIT_EXPECT_KASAN_FAIL_READ(test, ((volatile char *)ptr)[0]);
 }
 
+static void page_alloc_skip_kasan_helper(struct kunit *test, gfp_t gfp)
+{
+	struct page *pages;
+	size_t order = 2;
+	char *ptr;
+	size_t i;
+
+	pages = alloc_pages(gfp, order);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pages);
+
+	for (i = 0; i < (1UL << order); i++) {
+		/*
+		 * __GFP_SKIP_KASAN allocations must carry the match-all tag
+		 * in page->flags, and so in page_address(), not a random tag.
+		 */
+		KUNIT_EXPECT_EQ(test, page_kasan_tag(pages + i),
+				(u8)KASAN_TAG_KERNEL);
+
+		ptr = page_address(pages + i);
+		KUNIT_EXPECT_EQ(test, (u8)get_tag(ptr), (u8)KASAN_TAG_KERNEL);
+
+		/*
+		 * The memory tags of such pages are arbitrary: stale poison,
+		 * or tags set by userspace through PROT_MTE. Accesses via
+		 * page_address() must not fault regardless.
+		 */
+		kasan_poison(ptr, PAGE_SIZE, KASAN_TAG_INVALID, false);
+		KUNIT_EXPECT_KASAN_RESULT(test, WRITE_ONCE(*ptr, 0),
+					  "WRITE_ONCE(*ptr, 0)", false);
+	}
+
+	__free_pages(pages, order);
+}
+
+static void page_alloc_skip_kasan(struct kunit *test)
+{
+	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_HW_TAGS);
+
+	page_alloc_skip_kasan_helper(test, GFP_KERNEL | __GFP_SKIP_KASAN);
+	page_alloc_skip_kasan_helper(test, GFP_HIGHUSER);
+	page_alloc_skip_kasan_helper(test, GFP_HIGHUSER_MOVABLE);
+}
+
 static void krealloc_more_oob_helper(struct kunit *test,
 					size_t size1, size_t size2)
 {
@@ -2369,6 +2412,7 @@ static struct kunit_case kasan_kunit_test_cases[] = {
 	KUNIT_CASE(kmalloc_large_invalid_free),
 	KUNIT_CASE(page_alloc_oob_right),
 	KUNIT_CASE(page_alloc_uaf),
+	KUNIT_CASE(page_alloc_skip_kasan),
 	KUNIT_CASE(krealloc_more_oob),
 	KUNIT_CASE(krealloc_less_oob),
 	KUNIT_CASE(krealloc_large_more_oob),
-- 
2.56.1.750.gf70dc682cf-goog

