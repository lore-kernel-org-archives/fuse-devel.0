Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404684;
	b=ujHJpWG2TlpW5N+9x+Ihq/8DeksFsp/mCgPQ8iy05iL5I+FnaiTg4cj/EZ4GfFYWfKci
	 bvO3QnjAitZwLbiuu6poX7Gi+Sdk63aUvYTAjnmyiNx4w1qQSKkZdex9TzFcC0hJRFEzt
	 dzH0HkQIrUJ7WoPSpRifwtxtfp7Kmej86K0RA1ux29rlnJJ92TfPkvsyX1LkyCZ48mH2e
	 Kd26p8ZSSjcM35aBndKnY73P5p+VZ/icAAjE0H5Zyf0sLanVptnc/pZrcs3hESQjHejZr
	 nI/qavhmf89e6Kjstuva/iFxv9YqIuI9QUG9ej+4DhKSfEuy4deJMFw0pUgq9TPgxKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u+VJkDmgbhhT238e3Khqv+7tnUuWga3+yY83FP/NeKA=;
	b=sJzPtAu9Mxdmg6oihNEHGAJUgw9310SfOGOVzEx9XZIn79gsJkt+D19wqcFmn5+O9oi9
	 Dr3nQ8nt06M9L6SjCSGcClLlR1pd554N9Xq7Ah0B0vwgDiCBxwapRcuRENepl/7ox0biR
	 UdXeTjVFxayhwy98auUsMqPxTmk8ySJcTMrXHvmcx8KH99LDjuXE17uKYStAZE7Zb9I1g
	 r1nKT7qTqhtRuWLbpyVIaibfkoDUxSWEPY4LkDSva/knFmUD52rgF/raQxu3zics+I4hU
	 eJSM0oUrf3rjwIjGuqSYyAJ9t7dmnANDNZoOxWwjysvVSkDG9bPHQEwZSzrB6/m6KGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E072S6DW;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F16606A32E
	for <fuse-devel@lists.linux.dev>; Mon, 23 Nov 2026 03:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58F16606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E072S6DW
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b43d6c3485so278251a91.1
        for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 19:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795404683; x=1796009483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+VJkDmgbhhT238e3Khqv+7tnUuWga3+yY83FP/NeKA=;
        b=E072S6DWNCLCdfpyatztlCT3isGPaf0KtjUSP/NGuuIi1PsL7el5mjY1mcezct34XC
         zryGKdT+ttB6R8CKEspiFZUehTQlvjsOUakhAMhxINvtpptU9fMD07xiwUda20vVVKUu
         YykXu3OrycGDqTc3heKJCWwyWR9JvoAMwPnzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795404683; x=1796009483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+VJkDmgbhhT238e3Khqv+7tnUuWga3+yY83FP/NeKA=;
        b=LNdNZ44Nxy89mdn3+ly8H/tg7m2oaWqfl6Sk/JFGl7qJVEvwBN68E05vM6sHKmB8fT
         hBz5gO3QbzmgWcTdWsMh6n9nwuBbnb7r3EGCjb29ts/N70TTf5a29lkdKepFOlS042EO
         g7D/TfQbRTOzEFSVrEZhwSO9IMh2Lx3yxxc2fRg1wh5F8A13xwyLtd1UcBxTZ32P1orE
         PF0rzyIKDx3NDFLPyaCVei7M5FmpnUf3g4MWRcylJfry90N/kMjofoLdhPMvJ1PxXODs
         2vvnqH0AkRtn5JeoYGx7WLBGzQoTRbfDsl8FFk4MDx3b/IqL+Bs6ZVi135yYvj5AkXbD
         Pexw==
X-Forwarded-Encrypted: i=1; AL+hErH7gSlA8vMAEbjvabSm2LD5Umq+aaTSTGc50i3KOqqM85uLCblUB4DcvBeprjdq4TuJmfq2tqLJMY7x@lists.linux.dev
X-Gm-Message-State: APuU4Z/wItAcMich5cMj7dkggqx6/C/4rVOHxfsJpyExiYEJHbcYD0dM
	WjebSJ3CJ/tjwXph+qjMYDuSvjX3A6xxSfuOVL/zPi4J12n8PSJv6HADIlqxSh7AqA==
X-Gm-Gg: AZFdTZe/juqg0CYpvXDjdlzSNpXajGEPn89IIxBhBKVJ43QMJhSs+VGSlYOrnwb8pT1
	GLv3est+OgOcWv2Pn47JpEMTobv1Dw/x2Z+ZFExMiPqYSInDvEsHzA+3lfCxLtq7ctWz1ffuSBy
	lJGRcmMpm/MTdL6F7zdTrZbd2B0R6eY1TwTuPBJ1cn9VPI3g2uFRF+BzLjusGo5lTcXo0GT0Pnw
	IZzfY9uTSsYdzBq5sGzoYT/GQgCjcb5KFuxp/Od6Wky8vJkUr5cyP08ho/57vCS1dHfQBxR/mOE
	SKZct+V5uP8vpJPEZAqGDvGKVGl4fYuehcGGyfzqP6eDkAlYl+YBfjj0Hj33zG/KdxAqsGfrhq/
	j0WJVVIJwbx92YPyTPBVea87WToPPbCCpLScAxFi0l1E/gw69b3jpb2whnNwUCR6yQK4ENoLTca
	AnvuQA1Xt/ImydmHwFyqcq5XUwmYt1gTYgmzfhngJNebwpZw5XuoxU7acG7cTXRBy6oYkDn7Nke
	OQcByw/7zAldrRItFSIENK6E6+7Ug44SS+Ao0wqRPQkUbocQPXkE2eGcV6fRcoosubCGbum0PLe
	VTMM1TfGJlcyAZ094sHiTTNOaO8zPoPEQksvFE7xc9A1Bjfb8qBuZmIxbZVQKilvsQ39og==
X-Received: by 2002:a17:90a:e70c:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b41c58aebdmr15663729a91.0.1795404682704;
        Sun, 22 Nov 2026 19:31:22 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b41ad48786sm15745736a91.9.2026.11.22.19.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:31:22 -0800 (PST)
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
Subject: [PATCH v2 1/2] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Sun, 22 Nov 2026 19:31:10 -0800
Message-ID: <20261123033111.2349160-2-jeffxu@chromium.org>
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

Move __GFP_SKIP_KASAN from GFP_HIGHUSER_MOVABLE to GFP_HIGHUSER so
non-movable userspace page allocations also skip KASAN tagging on
allocation and poisoning on free under CONFIG_KASAN_HW_TAGS.

GFP_HIGHUSER_MOVABLE already skips KASAN because user pages do not hold
kernel data structures and tagging every 16-byte MTE granule on
allocation and free is expensive. GFP_HIGHUSER has the same contract and
differs only in being non-movable, used mainly by DMA-BUF, DRM/GPU
buffers, and non-movable HugeTLB.

On an Armv9.2-A device (6.12 kernel, kasan.mode=sync), this reduces
32 MB /dev/dma_heap/system alloc+free latency by ~80% (~59% alloc, ~98%
close) and improves an app-loading OpenGL benchmark by 15-23%.

Callers that access GFP_HIGHUSER pages through kmap_local_page() or
page_address() (such as ramfs, pipe/FUSE buffers, kexec, and RDS) lose
HW_TAGS checking on those pages. None of them store kernel structs
there; this matches the trade-off already made for GFP_HIGHUSER_MOVABLE.
Generic and SW_TAGS KASAN are unaffected.

Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 include/linux/gfp_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index c1331bf0b239..bb54c7abfb02 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -376,8 +376,8 @@ enum {
 #define GFP_USER	(__GFP_RECLAIM | __GFP_IO | __GFP_FS | __GFP_HARDWALL)
 #define GFP_DMA		__GFP_DMA
 #define GFP_DMA32	__GFP_DMA32
-#define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM)
-#define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE | __GFP_SKIP_KASAN)
+#define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM | __GFP_SKIP_KASAN)
+#define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE)
 #define GFP_TRANSHUGE_LIGHT	((GFP_HIGHUSER_MOVABLE | __GFP_COMP | \
 			 __GFP_NOMEMALLOC | __GFP_NOWARN) & ~__GFP_RECLAIM)
 #define GFP_TRANSHUGE	(GFP_TRANSHUGE_LIGHT | __GFP_DIRECT_RECLAIM)

base-commit: d12eccbcb79a4fa35c3aa588eb79056af62eb859
-- 
2.56.1.750.gf70dc682cf-goog

