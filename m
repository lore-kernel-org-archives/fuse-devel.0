Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550114;
	b=fT0dIPff9em6oCRWIEQtKH/8NhFVdxxDnGvwiMUYaQVYKL0HwDxKPwW3f8r9Roq5qc2V
	 aG4E95mtA7jn/DcwAL4GP5LigXEuRmSHidQmY4IosWIWlHqDLuKczD1809fXOH2X7yAIt
	 pKcjUHW4VHJ3QReYOOT6llWOwvd9UtHrS8ZKFTaNhVjBP3vJj8nGnFtGSpreDw3hXV4u8
	 L12TBjffwny2c2AVjg2SBnBw6QRsYS/CPysPyOeSZsYqohEPXX6n780XJGbZcVS1OVQgC
	 ezQztLDFZ3WmvK2PFpMNtWWwGKu+MJ7eQifo7EgW38aoJrN0VhjP6176vroZrnoVbZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UfXL7pTzXBkITvsNUdQnzu2e0Gb3CsC6gpsm26wxQeI=;
	b=JjXqTnYWqgPoZPvwUfk5MKy1O5KvxVnjh8n0D6eDp6jn1PLwOozozU8H3ppKrzkEy7PM
	 xEsUbk/Y443Mv7o6COZ2b+w+ZuRciR4+v/2YnKInRRqEKcmqVX2N+D8y3tBw/k8tFRn4d
	 NUxSIP6KUmnmYpZfpS6OOO06I4oPbyv3m/OY81ikNhYNVKbKS33QN6hfenDZLGX2Oarqz
	 VzT3qphDxRrKAzX8dbfcE224XbSO4sgFRub8Fk7W/W3m5TRxS03ulFMj4gheBVeWttj8x
	 J/GuP2GPbSEakmiN3jouP6YKLTfoMVXglMtgYpwkM6yIeufnEPXBfn5KcyHmAO9ylYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="T0ME/W84";
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99A9606A33C
	for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 19:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C99A9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=T0ME/W84
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b5e147f101so417580b3a.3
        for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 11:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795550113; x=1796154913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfXL7pTzXBkITvsNUdQnzu2e0Gb3CsC6gpsm26wxQeI=;
        b=T0ME/W84DBIpswcdNBix0zFrMH+gYyd/YQ0QTy81qAdAOvV7tstGy937Is/DhrqlRW
         ns2jsmmlvLmERb9LpH2NKiGup1vhq3OJwNKi5iXb73M+yoDvyfNBFJjP1S7J6gKgojdj
         khfkVcHvkejxF/mTQRo6NOZauFt70WyF0zHDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550113; x=1796154913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UfXL7pTzXBkITvsNUdQnzu2e0Gb3CsC6gpsm26wxQeI=;
        b=pR3R+ge6a1UrC8XzzR7kJYXrkAkEfbeKMH+ju6p6iDyEXcm7FVauImku7hTipOAo5r
         XAFwt+PyenIrIt5cfxQBFd7scVV9b2rEpoffRm8ULtaZ58cxlvjEzC7da7Ytfus8g3Qt
         ftp3e2B+Yc9MwL23CqUhzi4BkCBe5OmtbgzcqV2tmsPbznCZkLiFqaEcBBo0E1SI9spT
         ax/YZK8fAGddEQfhT0RO5kjR+L1L5vPyXbJOCTxFQ100Tvt+b6gwI/hKCR7FhduufJLc
         R/pqqI8MLiySeiCXFdGA6zOljBFqzwqvn7LRLHqdjPM0zMh7qdq7fx7ROW2qJG4gOfzn
         xoLg==
X-Forwarded-Encrypted: i=1; AL+hErGXglKJ67V42bB9RPrVUE6cqj82sFr9+RvhpHv4N5+HJ8X5fxduOxeDqUeeipJo6RwhTumAkNEasPuH@lists.linux.dev
X-Gm-Message-State: APuU4Z/5huJBmfFNnPtWVZhu8ledZDrzvlJCZtOlVSVvj0NrMCOM45hL
	7WE/LjJFwQv6MrKkT+3C6cPf7eOP1MhnvNPtYv06pdM8Z6m//itstTx75iAevNYe8A==
X-Gm-Gg: AZFdTZc/5CrTrZtGeFVSWsO+mYvF8foA4tQk90xxNALZT2o06h70vkb1COAra1H8zHs
	TOFlW9E36PPVfgrVcyEaRG5reu5eLuAjnFuhPaHAfhJ69hqo8kEbtPlevJWf5/ZvB6gjmuceqV+
	ROyA8N/0Bmir59CC6MKL9yUAbNxNsKMbeZH4J/rEyzNinauJSc/hH30TfkKK6Ww7eAOWffes4cA
	4kUGBXqlROrwOgE2idFTB9DhslWfc36wBkSTmj3z/0QZmUbwy7/2DEDhYlCv3EO593nef9XdHgJ
	IQcyZTtG3wXhsOa1wa9DD5fswmysd8eayazoH2da6hmhEQEUq8vahAbCv+XKEUaF5wtsE0lv/bn
	QliwcFp/QdlyfKmyyTMFRHRrUE+qTfw/sqFNFy+YyMhfiqW7XmEXbEIOqA+FYgFggqicZdlhlqI
	qStoXeuNHyzCbRdH8xpqi9fTKoGbWG4ycZvRoNbiKp+EbpssYbLYNAn0IJUyq9vzwLnnmT5anA6
	xztqmkFVvm4KyiGf5cxD8r605UF4Ww+2YjRLL4vXi95kKOqQbLfezPD0JKGnga8pS7fgio9X1oL
	hpK5ad2dChfTfAW3sAPm/MciWjz5NvxO8U5r896z5B90eL0L2p0QEAmb+aM3cmWZ7s5LJnM+RDX
	5XrKSBxfa9MDtCg8=
X-Received: by 2002:aa7:804c:0:b0:8a0:646e:7e16 with SMTP id d2e1a72fcca58-8c87b4f38cbmr15568834b3a.2.1795550112810;
        Tue, 24 Nov 2026 11:55:12 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8c872e4c43bsm7550418b3a.26.2026.11.24.11.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:55:12 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: David Hildenbrand <david@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
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
Subject: Re: [PATCH v2 2/2] mm/kasan/kunit: add page_alloc_skip_kasan test
Date: Tue, 24 Nov 2026 11:55:08 -0800
Message-ID: <20261124195508.164641-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <74dd67a2-eaff-4bbb-8105-4481fbbdd016@kernel.org>
References: <20261123033111.2349160-1-jeffxu@chromium.org> <20261123033111.2349160-3-jeffxu@chromium.org> <74dd67a2-eaff-4bbb-8105-4481fbbdd016@kernel.org>
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

On Tue, Nov 24, 2026 at 09:17:45AM +0100, David Hildenbrand (Arm) wrote:
> On 11/23/26 04:31, Jeff Xu wrote:
> > +static void page_alloc_skip_kasan_helper(struct kunit *test, gfp_t gfp)
> > +{
> > +	struct page *pages;
> > +	size_t order = 2;
>
> Why magic value two?
>
> Should be const.

Just a small non-zero order so the loop checks tag resets on sub-pages
as well as the head page. I'll change it to "const unsigned int order = 2;"
and add a brief comment explaining that in v3.

> > +	char *ptr;
> > +	size_t i;
> > +
> > +	pages = alloc_pages(gfp, order);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pages);
> > +
> > +	for (i = 0; i < (1UL << order); i++) {
>
> "1 << order" is sufficient.

Will change to "1 << order" in v3.

> > +		/*
> > +		 * __GFP_SKIP_KASAN allocations must carry the match-all tag
> > +		 * in page->flags, and so in page_address(), not a random tag.
> > +		 */
> > +		KUNIT_EXPECT_EQ(test, page_kasan_tag(pages + i),
> > +				(u8)KASAN_TAG_KERNEL);
>
> Squeeze this into a single line.

Will do in v3.

> > +
> > +		ptr = page_address(pages + i);
> > +		KUNIT_EXPECT_EQ(test, (u8)get_tag(ptr), (u8)KASAN_TAG_KERNEL);
> > +
> > +		/*
> > +		 * The memory tags of such pages are arbitrary: stale poison,
> > +		 * or tags set by userspace through PROT_MTE. Accesses via
> > +		 * page_address() must not fault regardless.
> > +		 */
> > +		kasan_poison(ptr, PAGE_SIZE, KASAN_TAG_INVALID, false);
> > +		KUNIT_EXPECT_KASAN_RESULT(test, WRITE_ONCE(*ptr, 0),
> > +					  "WRITE_ONCE(*ptr, 0)", false);
>
> Why do we care about checking HW behavior? (match-all working)

Good point, match_all_ptr_tag() already tests match-all behavior in
hardware. I'll drop the kasan_poison() and KUNIT_EXPECT_KASAN_RESULT()
checks in v3. That also lets me drop the local ptr variable.

> > @@ -2369,6 +2412,7 @@ static struct kunit_case kasan_kunit_test_cases[] = {
> >  	KUNIT_CASE(kmalloc_large_invalid_free),
> >  	KUNIT_CASE(page_alloc_oob_right),
> >  	KUNIT_CASE(page_alloc_uaf),
> > +	KUNIT_CASE(page_alloc_skip_kasan),
>
> Don't we have to limit this case to having actual MTE-capable HW etc?

No extra gating is needed here: on non-MTE hardware (or with kasan=off),
kasan_init_hw_tags() returns early without calling kasan_enable(), so
kasan_suite_init() sees !kasan_enabled() and aborts the suite before any
test case runs. For Generic and SW_TAGS builds,
KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_HW_TAGS) skips the test,
matching the rest of kasan_kunit_test_cases[].

I confirmed this by booting the HW_TAGS kernel under QEMU with mte=off
and with kasan=off: in both cases the suite fails to initialize and no
test case runs.

I'll add a short comment in page_alloc_skip_kasan() noting that in v3.

Thanks,
Jeff
