Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870419;
	b=K4ErLojrWtmLuqC6Oet6/6S7bYWTaB6OBFpT/6PsSvzDH3IrcDqhDmfjfa/plcDr9psh
	 nS926uf/qSXm8lYEWYtkMIBJ0l0K6qE+QWNrrw0xWMFBkcD1xsTG19UQBYg/GeyaiOQm5
	 yyIZkMjm1gZqFCKMIRzFV9DbFnpxRMeggj0jB63WAGS5Rx2VB0PtG7UfNVO3Kwqafy0fo
	 gtINshfl+9u25JjyKslLq8sXBKkfmeTpzXTpVk6YbFcu7JN5HBqQqN1fLjm9B1kE+aR1d
	 alcKBJ8Y811E8+impXYfw2GPEjVNS3WstmYKunV8ATYRJJIk15TFqulTEIhGBAegXRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GHp/rfBUvBjHE1yqZXzAoWkqkfTsJ4axSlVmhZm3xoI=;
	b=IAx+1kwNDKDquONAxNDZ8LO3dsSrTzhNVP9rBm9p13QXXv2MxAKi+/9nNF555YipsRfo
	 5BWu0QlHG6Jzm9a452zwmu/pKy1Q5kihL8rus9exdNlXcwp5xivQoPuRy6+StRL2C9i3Y
	 9uPuGMGd77jiq87Qa4KFPGsnsGVi8Ay05Pri7L9OSQbPUi8y6AXEGzM1JD/cDcqEsJ9iC
	 zZh+ed3cliDVtdZrawbel7btTUDSZZMI1hv0zL2br4aa5yLmPQt8Fk0mcQJm7mQR5fuFp
	 QqJD2AsLD39LrSY4eH9Ew2Uz3qI3NLGJi/yRXyM8qqfSWJFkdqHriIjFWcdT9GlxwHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YMTtrBDz;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2BC606A8B4
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 23:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C2BC606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YMTtrBDz
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd6b9a2735fso250720a12.1
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 15:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870418; x=1795475218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHp/rfBUvBjHE1yqZXzAoWkqkfTsJ4axSlVmhZm3xoI=;
        b=YMTtrBDzD43jeYBDUtBqtwrnCf8vVMpA0dpnXjrjcU+HsCDGN+k1CSGIl5yl9LBohI
         LFgFOn8k88QDpDDtTwBiterqQ9Nuhzag9d5upvcfiCnmV/a/pdqVyf/iMBB+NhZIVQ5B
         /4RYO1kliFQdhAPKCcGixmYHec5nwdIf4e2eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870418; x=1795475218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GHp/rfBUvBjHE1yqZXzAoWkqkfTsJ4axSlVmhZm3xoI=;
        b=JgyQ2S0glipRCtEQGeaWWvLMp76Ar5gCssjYtEZm6ei2xeVkSCQuDbRaGqrya1Py+4
         Grw3Kyji8vbiT+A4mojO/YqXES6UI4rSBncUoQH1YXSciMxsaywT6gl6lQDXUzIXr+0l
         gkl6Fa7gsF6Li0r1yBGdNs9YQX6wFgVZv7AxFYUBXEUTZTqQrzzwVWgt/3n0Qe4n63xw
         vClIisaSNJaZqpjXFQlLRzAQsvi0pepeiLE5zO1Mvv0ImdWpSShQCc3aMZarpOSZXJvM
         1B+x1Gr+xjIMXIgPLxIvzaovUteY8D5L1+OnSj1C6u/qGt6czY5ct6XtPnZ7kQLQwy6M
         NEhA==
X-Forwarded-Encrypted: i=1; AL+hErFC2IsCVXallLjAqMHhYl4qaefV+4OxcYRsw59sFk5R1BOJ3ygwJSbSiDwUcUoWdvNTvx5kpWqgEZzu@lists.linux.dev
X-Gm-Message-State: APuU4Z+/dLmSh7JSpgI9lzXVKnD7DDRQVV/4YFBvEPqhn1mRkcbf+e4F
	N6tIfwFm6ir5J08DbKuVMKTJzN/aIQcQhTItas/UWreNU0kqxRQ49NtN/7kKuk792Q==
X-Gm-Gg: AYBFou3vWaTMmlaZ07tH26g+pzTB0kDZofWnnjNkqdPCkDxFx7IDLisMNjK+QJJhhNz
	ndQuZ6lQqP9Lf+0I4QM+U4FD8SiwsMir5/UyCqxOUe1npSudck6ZMDHt1haIvyRKCIgOC1XhtmD
	Wg1mUiv0Bf5JVNUEHL1kHgtgiNhH6tFd4us5HJtHzAyEQUy0cUiYbt1a6FfnBtdYqj8ykQz1cdt
	08So86NGTKGAvIiq7gZ1N9/8JggcfJnyC1EygwelCgI/y858IDJj9swwzxADyHsPNpMqCinWusC
	pr39nLhnT0tTtGC+79tvumuoe1xk3UL7GqqG8Jfxdxa3oG5i/zi0Om0yQ7ioiboCnoPvn8u2zpn
	0TtdC5aflYtGNc1Tc4u085hdLUEAeRnv6rKXKccUCrQpU+rubq7UImr9nBwIzB6d/ZCXrf1tLay
	lJ+j1gX8tm92AJMsVT+qLS+CCqQhK/oyjTkGCUbIbgOYnul+YzHYNpeYVhnhPqlnQDeIBo3HYXY
	CgHA4EfvQIYlse5XBm0r7OSapVvVDA4dOop73zHvlFC35ZgzSLgSfnM9s3kLHO0zSqbcRofcRrt
	tAXz00iwsfLQdUznbzrVg5E8dwhFIjQ6Fq0wrDfdJmcXUzUkVurUrCDI87ScU7TLUy6iD0eGeEL
	7R183/CAYKACy0rVvGg==
X-Received: by 2002:a05:6300:40d:b0:3f9:aef5:48 with SMTP id adf61e73a8af0-3f9aef5038fmr8109961637.1.1794870418391;
        Mon, 16 Nov 2026 15:06:58 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8bed1a6dbd9sm4131985b3a.27.2026.11.16.15.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:58 -0800 (PST)
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
Subject: [PATCH v1 5/7] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Mon, 16 Nov 2026 15:06:25 -0800
Message-ID: <20261116230627.3537051-6-jeffxu@chromium.org>
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

Move __GFP_SKIP_KASAN from GFP_HIGHUSER_MOVABLE to GFP_HIGHUSER so that
both GFP_HIGHUSER and GFP_HIGHUSER_MOVABLE allocations skip KASAN
unpoisoning on allocation and poisoning on free in HW_TAGS mode.

Previously, commit c275c5c6d50a ("kasan: disable freed user page
poisoning with HW tags"), commit 70c248aca9e7 ("mm: kasan: Skip
unpoisoning of user pages"), and commit 0a54864f8dfb ("kasan: remove
PG_skip_kasan_poison flag") added __GFP_SKIP_KASAN to
GFP_HIGHUSER_MOVABLE because user pages are not intended to be used as
directly addressable kernel data structures, and the lower likelihood of
catching a kernel linear-map bug on user payload pages does not justify
tagging all 256 16-byte MTE granules per 4 KB page on every allocation
and free.

GFP_HIGHUSER shares the same kernel-accessibility contract in
include/linux/gfp_types.h ("for userspace allocations that may be mapped
to userspace, do not need to be directly accessible by the kernel but
that cannot move once in use"). The only semantic difference between
GFP_HIGHUSER and GFP_HIGHUSER_MOVABLE is __GFP_MOVABLE.

For every 4 KB page without __GFP_SKIP_KASAN under CONFIG_KASAN_HW_TAGS,
mte_set_mem_tag_range() tags all 256 16-byte MTE granules (via STG/STZG
and DC GVA/GZVA) on allocation (__kasan_unpoison_pages) and again on
free (__kasan_poison_pages). For users of GFP_HIGHUSER, this can
significantly impact performance when allocating and freeing large
buffers. For example, in graphics and interactive UI workloads, large
DMA-BUF and DRM/GPU buffers are allocated with GFP_HIGHUSER: while
steady-state rendering reuses swapchain buffers, UI window resizes,
surface creation/teardown, and app or scene launches synchronously
allocate and release tens to hundreds of megabytes of DMA-BUF
framebuffers (~32 MB per 4K RGBA frame, or ~96 MB for a triple-buffered
surface) and GPU shmem pools directly on UI, compositor, and render
threads. Touching millions of 16-byte granules stalls these critical
threads for milliseconds per buffer, a significant share of the 8.3 ms
(120 Hz) / 16.7 ms (60 Hz) frame budget, while polluting CPU L1/L2 data
and MTE tag caches, evicting hot working-set cachelines, and saturating
DRAM bandwidth (especially on free when DMA pages are cold in the CPU
cache).

GFP_HIGHUSER is used by subsystems such as the DMA-BUF system heap, DRM
GEM shmem/TTM and non-movable HugeTLB. They use it instead of
GFP_HIGHUSER_MOVABLE only because their pages are pinned for DMA or
cannot migrate.

What skipping KASAN means for the kernel's own accesses to these pages:

- Through vmap(): nothing changes. With CONFIG_KASAN_HW_TAGS those
  pointers already carry the match-all tag, so the page tags never
  protected these accesses.
- Through kmap_local_page() or page_address() (for example ramfs):
  post_alloc_hook() now gives the pages the match-all tag, so these
  accesses are no longer checked. GFP_HIGHUSER_MOVABLE pages already
  behave this way. Callers that want to keep the checks use
  GFP_HIGHUSER_KASAN: the previous patches in this series converted
  pipe, FUSE, kexec and RDS, and backports of this patch should
  include them.

Slab allocations cannot use GFP_HIGHUSER, because they do not accept
__GFP_HIGHMEM. GFP_KERNEL, GFP_USER and vmalloc() allocations are not
affected.

This patch does not address the false-positive KASAN report after shmem
swap-in readahead with MTE that was reported on drm/panthor [1, 2].
There, swap_cluster_readahead() allocates swap-cache folios for
neighboring swap slots with the gfp mask of the shmem mapping being
swapped in. If such a slot holds a page that userspace maps with
PROT_MTE, the folio keeps a KASAN tag in page->flags that does not
match the userspace tags restored by arch_swap_restore().

This patch only removes one way to hit it: shmem mappings that use
GFP_HIGHUSER (such as drm_gem_shmem_helper or panthor) now pass
__GFP_SKIP_KASAN to readahead, so the neighboring folios no longer get
a KASAN tag. The readahead path itself is unchanged, and shmem mappings
with other gfp masks that lack __GFP_SKIP_KASAN can still trigger the
report. That issue should be followed up separately, for example in
[1].

On an Armv9.2-A device running a 6.12-based kernel with kasan.mode=sync,
this reduces the allocation + release time of a ~32 MB buffer from
/dev/dma_heap/system by ~80%: allocation is ~59% faster and release ~98%
faster. Poisoning on free accounted for ~55% of the total before. In an
application loading benchmark, the OpenGL score improves by 15-23%,
recovering 60-80% of the regression that enabling MTE causes.

Link: https://lore.kernel.org/r/20260519-panthor-kasan-v2-1-b7384458f076@gmail.com/ [1]
Link: https://lore.kernel.org/r/20260521105148.5497c281@fedora/ [2]
Assisted-by: LLM
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 include/linux/gfp_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index 567c93fc1cfb..bcc4827deb4c 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -386,9 +386,9 @@ enum {
 #define GFP_USER	(__GFP_RECLAIM | __GFP_IO | __GFP_FS | __GFP_HARDWALL)
 #define GFP_DMA		__GFP_DMA
 #define GFP_DMA32	__GFP_DMA32
-#define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM)
+#define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM | __GFP_SKIP_KASAN)
 #define GFP_HIGHUSER_KASAN	(GFP_USER | __GFP_HIGHMEM)
-#define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE | __GFP_SKIP_KASAN)
+#define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE)
 #define GFP_TRANSHUGE_LIGHT	((GFP_HIGHUSER_MOVABLE | __GFP_COMP | \
 			 __GFP_NOMEMALLOC | __GFP_NOWARN) & ~__GFP_RECLAIM)
 #define GFP_TRANSHUGE	(GFP_TRANSHUGE_LIGHT | __GFP_DIRECT_RECLAIM)
-- 
2.56.0.611.g1030f0b940-goog

