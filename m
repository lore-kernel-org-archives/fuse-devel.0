Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870422;
	b=M/hOieG8SCkad9QhRHCbsH5vuZxuShAVvwn2VVlWka6/JmHYWScUW8WeIjvzHFCglrB9
	 yNOGsCMNSO7Ql+UrHZ4NFVZgcgIfnEIeS13RIVbJyWfXTWBpGkliaG88mDTkwP1LW8+EZ
	 lFnym/3gdSKYmJCeHDJnAPPuXvxwk58Xwo9qPCq+ty8Hp1W+m4A7jfvBsiPfNrkwLJD6f
	 vGM+gr6MM+pH4ufTJwp9mDjPdbVTNNRHiJEh0/liXlNheEQ2V6Uwoogu1TV5LY3SbDnaL
	 CucMcAnBiyIKrJlrUmOMzShugNonivtX1aJ5g/4wtX3DLprBLuUi7kMfwom/Qxjuzaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7noARN/sft+NtmJTHmUDUAvU1Dihrn7FLenu365oKlA=;
	b=oK/z06VnmjKzph1wfgO+4fkZ6M7O0/eowBCkE6JnKzkWn1Wcx+MNFY2XqIyKeDrs34lI
	 b6Nr4tkgoOpeAQX5Pf3G+lY40v8uU0isC0y7uz1AWS6G24B/EyB2KrecybVTFhVoVfnwF
	 7eERSZYvLDTlJc1enf3jY9waWGuvSnSAU+pM1d3uq1rS+y7pAX9bMUlMXYQuSf/vTEXDs
	 QGjBBWf5hGRGoUEn5drbB+LbnF1WO9kiZSHht1Tg+aMRZqIrKNuosEX1QrGzHPpisJgc1
	 w+cpleJhyUlx0bysmo/h+GStZaghcutD49eawuQZlpKj9QwLPfOnPr83195UIkw3JmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=g46+We9L;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A870C60A3837
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 23:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A870C60A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=g46+We9L
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0d0f38abdso725658a91.3
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 15:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870421; x=1795475221; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7noARN/sft+NtmJTHmUDUAvU1Dihrn7FLenu365oKlA=;
        b=g46+We9LklLpgze0L898wuDqVoTUIWOrk9A74pxNjdqSXeTvy7Ntx8/KsHRI+1DrO2
         96i8LFZ9NCWB8+ZYW+Uom8gcEiq3f9UTBQw/i8Vu3rO4Jw9JFAbp6cROyRe7FKyaX71a
         thbBMmNkWmvIhTAjxZ7USCqW6DNZembEIu9zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870421; x=1795475221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7noARN/sft+NtmJTHmUDUAvU1Dihrn7FLenu365oKlA=;
        b=BbfVK72PuGEY3z8AfsxYK4IapXUjBmUkGC2K2E1Z2nFysK1l5YgGY62fzQrrKBRJQn
         CdHsyjYrYb182ZjvjMvfXdy2ixflGDH4ysSKpdCMujr2KNKPcQcE95MkDF6GxgpEuCLn
         WVaGJJJBHxy/hP3WlIf9CqdeE/syQOKUGh81q4b5aDVvFooC84PUuR03d5ZdrgS/Vde3
         fSS0HsOJ8vKZ7sHxVhMAlumLQhihYecQm9oYm/DOYNOFYZ2l3nB+MgQSOMC4UR3PY7MF
         0TOan7NQTnzzjxVbO5yh4Wvl7cRMdQVEE586ZMJMg4lftOKLp3lo/bInAv8hbQfw/+NH
         Z9zg==
X-Forwarded-Encrypted: i=1; AL+hErH/xCj1NYwgPJIj9tDSZkIEScZlAYLEdnLei3w9SiUTJVimvB1UEYIKsqKdkRb6bJD7m4gDxfIvgG5p@lists.linux.dev
X-Gm-Message-State: APuU4Z8U3eOuti7vxHQCHTDwYxFReX4yXVy+obcT9IQLMoypPPN+0BIA
	p+9IxRNIVorhgqWDIgANvbohjG96F5NSIZv6SkWoEl9g2ebt1ghxBTJ0It6erE3f3Q==
X-Gm-Gg: AZFdTZcit4LsCPbNaxDvSI0VK47FvA7EOwPghnJg18zjF6FhNb6LjIUdNj+Ad6Jifcu
	p5gERzgHSSJuUA3b8Vo9dCef6qrplOiia5TIfF2zGHPcCtvi1ARYWbhsusDtWEdEtevwvVkfCeJ
	t0IRFXMYU//sxU+PsOZ2UfxDN0p3+uhp/RXQzIaqaaEWtNERfY9mBpGOj92hx1lSa/l3q/75G2S
	o0mDmAp5Kr7Ksu+vQ9i/eufNi0bQeWnsH6iZWDw9HcWXTzvtPc2atzeRWnn2nEoPcdmU9soJNkt
	lT6zWym8JXWMnOfNyqhbySYNvGuqrl6fnE4udaOOHMa+a8YYGtvRlQxD6OgmKL4ZDB5pjNbSbBe
	IuNrzTVXwkS9U4iXXqeRksek5dJlVTjDwXtYc+5NQcC6jcnrE+Lsc0chT0+j7u+WJw2wgTDgKYV
	junF51oPWKb5d6YQ3kueebLBxxhC6ZKUA+CqndKxvZa+gWOJWdCIiUqmsXhtv5uxfceTgzJR8Lt
	wqaFRpRniylieLFYj0XdezEVlOJ/GZ+oDiV0f+47ChUgVM06/oB3Myh9YqhIhVe8wErFs/T4TuJ
	O8Ch6IJnPOcSlsvSgXUZ5qJh/5Kxw6haoFPAAFscvseAAnzFXeXKUoRWJR36eTleL4Gdo7U=
X-Received: by 2002:a17:90a:c88f:b0:3b0:9a3e:bf8b with SMTP id 98e67ed59e1d1-3b1b0b5d63amr16850510a91.6.1794870420893;
        Mon, 16 Nov 2026 15:07:00 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cddc1873531sm4674755a12.10.2026.11.16.15.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:07:00 -0800 (PST)
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
Subject: [PATCH v1 6/7] mm/kasan/kunit: add page_alloc_skip_kasan test
Date: Mon, 16 Nov 2026 15:06:26 -0800
Message-ID: <20261116230627.3537051-7-jeffxu@chromium.org>
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

Add a KUnit test (page_alloc_skip_kasan) to verify that page allocations
using __GFP_SKIP_KASAN (GFP_KERNEL | __GFP_SKIP_KASAN, GFP_HIGHUSER, and
GFP_HIGHUSER_MOVABLE) under CONFIG_KASAN_HW_TAGS:
1. Reset page_kasan_tag() to KASAN_TAG_KERNEL (0xff) across all sub-pages
   of a high-order allocation, and
2. Return a match-all (0xff) linear-map pointer from page_address() that
   does not trigger a KASAN fault even when the underlying physical
   granules carry a mismatched tag (such as KASAN_TAG_INVALID or
   restored userspace PROT_MTE tags).

Assisted-by: LLM
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
2.56.0.611.g1030f0b940-goog

