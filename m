Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870409;
	b=fIWxRh0xjdHdR4ZVRn2+fGgbtkZQb9kP2S6iuDNsabjA9e8u/QuNAwk4afhBcHHdDUSI
	 WuGF43owtf1K6RVZ9teeCo5AMZ00mtKKcC2vOtBP3YXGUUSvgur91Xu3Z9GtgQWCDxlc3
	 BZg9rI4atD2lUNIa47bgDv9xDiRWAVtdRS9UzCHbodh/PhWE5v/4qGtQ4RAIq+OBsiu0X
	 cx0ZZh14SmIPnEuNP5dVR69VcNxgB3Vo/zOXJiNXs1OkkXIKmHS7ciNLD+ApWoUka4GMd
	 xZ/wkweZ6IXnI2eCS4mp5+ezYxv8uRRbwFnYfuF+khaPVf6q7WiUZISwWH2b3JOgknw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jGcgw87oL+/aayCG1LZRiyRs5ahRDiLzP62eRx4RAEM=;
	b=dqcKqh9QvkdOqo4FoPaU5Lo3sH9A/cdIwz568gVeC/fIDeV+DKj5OUu0ixW/lPtcf01G
	 Qv7yaUKzFUs0zVIr+3l6Q4J5qHyWbhURDWKUcDkhAP6SyzrIZ9BhpCEkD3sKE3DpFKZo4
	 pYxNyq7QlcrKulOdaVxHVe422noBIxM/TbJsRxDW2SJNQBJGob7geRhZrzB6SPtzQoXKg
	 dQwRqP2gc3sH77DvOQxYmcPiqx7ibgdWgkW17oe7gW+c6grPVDkwcxGm30nJMtlbJyTqf
	 SbndZx+Hbe0aNPbNmLhn62a9QMx1+K3TtVW1gNprLrZrlp9zX076V34hYhEWLjNwvuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eJDEBCvO;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8828606A887
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 23:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8828606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eJDEBCvO
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd5e295c8a6so251236a12.3
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 15:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870408; x=1795475208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGcgw87oL+/aayCG1LZRiyRs5ahRDiLzP62eRx4RAEM=;
        b=eJDEBCvORehjnPMxolpMQRkRh/3xL0nmj3XF1DfYkrcNtc6BfhOOgJSLHYU379YSE+
         m3U7LPExty2lkg+3Kw85wMKNQiD5EHLiJsIkuwykGk1pkDg9O9LNLpPbZbv7GTVL6hDc
         RA+RAyhorS7lOnimD6qsaTchJHkwf4bqDdsgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870408; x=1795475208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jGcgw87oL+/aayCG1LZRiyRs5ahRDiLzP62eRx4RAEM=;
        b=gg4H6hPBIO0J6K49w6wX11SM31b5MrtTteexWzl017b3On0A2cVe99O8mMbx8v+jvR
         SSZ+fR17u+XMN+vhkG5T9M69RPuUkjMP9N+lY9HNImvERT1k5bAKit5yIwl4mth30aOg
         qZnw7WeIgMEAtvxcRBJVTWbG6B3+npzYdDHIhrS5oFcDQBjF7+NZLvhDJsrkAhDUJHfq
         RvYTeWPLTgqluOufZbIQT6M/qJr4c+aKtcL9wdd4+AtBqION5NMG4ua+yZqDwDbbmhgL
         CFZNSYUEM/wVuK9Hl1KywQyQiQ4kw0sF4X+oJUqA/EIav4ZOcBMAIexqki7qwK3v8f31
         w3/Q==
X-Forwarded-Encrypted: i=1; AL+hErFPrPlH+uTW971XVqvSOq9O1M0giCCdPmMOm6/EzLxaji+RI+Y6QpxaZiT+S9pF100mRjoDqyYoA6z5@lists.linux.dev
X-Gm-Message-State: APuU4Z8X5I8+YVbk0ahkJpRYtlW0c4yuu79upxtQ7IJjoszLAOdl9zaC
	6dHv6dV0obUVEpUbEHpSzRE0oYhImq4LD9yEm13mpKtcBYLfwe2He+baN/VOiewfmQ==
X-Gm-Gg: AZFdTZfFKdv+j6qytaCazUVqSdsQ2I227Y4Exh4t/HCYjEzC9gNALcHvhmpRicooJD8
	cX21iV2WHqEuY2A12p3hT/r/VYnkJyizz/dZLfGRF+x2j4lP1RFSEOflq3OUEvlalqnb80kVW/9
	wgOvlA9okbLFGwkF1rNsc8NeMi3Za1xXYipYa8kIulWEQctrMMCuJj9WPZ5FHM3M+BemyciyTbr
	kAEp6mJR08zBrCz21+lScfe0IzaCsELV9qXqZ8spX0zNQuWMSvjsXiCJ488m+e5mE481bWc0hch
	HMbKInRghW+mkgodbk2r+c6jEJGo+ZIovCoSpLfctqhRHPapOcTl9sge+tMWg+wOqYJkldH/j4+
	U7qxsALirP2SRgTvOTZgqUs6nqzSCGg5D+w8aKI3jbrfs0jwIJccBHIui4cbLQONDAl93SVdINq
	jDcily+jWbIUF43aVQ1nJIfP5OZyxBKnsQL/XNvUpj2DUBBPhB1aQlMQ5FUnjbfMv8sNhMt1xyN
	ghJP3SXry8chFqHs/xpldT59tGRa/C/wGYl7Wu/RO1xjl7vRi/p1O73W6wXnTubnK/Dcy4mCOIQ
	jOFZ4OehVbwJTwct16zDETEJFk6OoW/jK1qEJYY47uITaYDsakS0rimD+6oOVCtabCmJX/M=
X-Received: by 2002:a17:90a:9f98:b0:3b3:b15f:eb89 with SMTP id 98e67ed59e1d1-3b3b15feeb1mr321766a91.1.1794870408006;
        Mon, 16 Nov 2026 15:06:48 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b3ab9f3c5dsm1108222a91.0.2026.11.16.15.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:47 -0800 (PST)
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
Subject: [PATCH v1 1/7] mm: add GFP_HIGHUSER_KASAN
Date: Mon, 16 Nov 2026 15:06:21 -0800
Message-ID: <20261116230627.3537051-2-jeffxu@chromium.org>
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

A later patch in this series adds __GFP_SKIP_KASAN to GFP_HIGHUSER, so
that with CONFIG_KASAN_HW_TAGS its pages are neither tagged on
allocation nor poisoned on free. That suits pages whose contents belong
to userspace and are mapped there.

Some GFP_HIGHUSER users allocate buffers that the kernel itself fills
and drains through kmap_local_page(), such as pipe buffers. While such
pages are tagged, KASAN can report a linear overflow out of the page
and an access to it while it is free.

Add GFP_HIGHUSER_KASAN for these users, so that they can be converted
before GFP_HIGHUSER changes. It has the value GFP_HIGHUSER has today
and will not gain __GFP_SKIP_KASAN. The two stay identical without
CONFIG_KASAN_HW_TAGS, where __GFP_SKIP_KASAN is 0.

GFP_HIGHUSER_KASAN must not be used for memory that userspace can map
with PROT_MTE (anonymous, shmem and hugetlb pages). Userspace sets the
memory tags of such a page, while the kernel keeps accessing it through
page_address() with the KASAN tag from page->flags. The two do not
match, and kernel accesses are reported as KASAN faults. arm64 does not
reset the tag in page->flags when the page is mapped; it relies on the
page having been allocated with __GFP_SKIP_KASAN. Nothing checks for
misuse at allocation or mapping time.

No functional change. The kernel-doc describes GFP_HIGHUSER as it will
be once it skips KASAN tagging.

Assisted-by: LLM
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 include/linux/gfp_types.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index c1331bf0b239..567c93fc1cfb 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -356,6 +356,16 @@ enum {
  * move once in use. An example may be a hardware allocation that maps
  * data directly into userspace but has no addressing limitations.
  *
+ * %GFP_HIGHUSER_KASAN is %GFP_HIGHUSER for pages that the kernel itself reads
+ * and writes, such as pipe buffers. Unlike %GFP_HIGHUSER it does not skip
+ * KASAN tagging: with CONFIG_KASAN_HW_TAGS the pages get a KASAN tag, which
+ * page_address() and kmap_local_page() return in the pointer. It must not be
+ * used for memory that userspace can map with PROT_MTE (anonymous, shmem and
+ * hugetlb pages). Userspace sets the memory tags of such a page, so the
+ * kernel's tagged pointer no longer matches them and kernel accesses to the
+ * page are reported as KASAN faults. Nothing checks for this at allocation
+ * or mapping time; those reports are the only sign of misuse.
+ *
  * %GFP_HIGHUSER_MOVABLE is for userspace allocations that the kernel does not
  * need direct access to but can use kmap() when access is required. They
  * are expected to be movable via page reclaim or page migration. Typically,
@@ -377,6 +387,7 @@ enum {
 #define GFP_DMA		__GFP_DMA
 #define GFP_DMA32	__GFP_DMA32
 #define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM)
+#define GFP_HIGHUSER_KASAN	(GFP_USER | __GFP_HIGHMEM)
 #define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE | __GFP_SKIP_KASAN)
 #define GFP_TRANSHUGE_LIGHT	((GFP_HIGHUSER_MOVABLE | __GFP_COMP | \
 			 __GFP_NOMEMALLOC | __GFP_NOWARN) & ~__GFP_RECLAIM)

base-commit: 4b028d0cedf95f66b8c5294fde2d7d698bf830da
-- 
2.56.0.611.g1030f0b940-goog

