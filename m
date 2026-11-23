Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404681;
	b=3G+28I7TnLt2MoMO2L62fK4eK1RUgBZNZIuORDZ8OW02SNWDS9YpLorsqVWvDqKyufi4
	 qX107WC3XNiYSJ1z3hPgsiQVi1WW1P3zkqD1/XbjguyqaSHpKFrHc7WE015iVjbbed2eS
	 EQ3ZY4hS0se6P/0PezZ1x7oFP8ea/QRZXw3Mw7KLAJO/tot2k0854UBDuy5BgfjXNUSK7
	 izFNfFYBIOemPnk8Q+c2orphMjdUx5tY0jfgJzcElTBJT/waNH+Ga01uBB0GLbq/f6Q8k
	 bo50Lv+XSivqvIhq5POp/p3SLZJ5pUwMfBKWUTImTZIxeCm1YvZvrBoMOFFguJ125bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n3/QgCFjzvK6G73Tiampz5hPbLES3QQEgOsn43qeBn8=;
	b=Er65X9QwK8apy2KNtJ1NiU625CCf2xwnKdna1NmJ9lN/YmBoxwOcFhCJentv1H5kuj7n
	 rAepYWDBkE2dHvgRMUqh+b4XmUEry6BKn0yNlOlHjaY5Cozdlh/0o7Xtfbr2VW0D7ZqW6
	 XpZp+ic7kjrMpT+6ALs3LD1W5x0J5XiaJcYXxqH/bDK4oqBxREKvf9GACtZns2Kxu5j5y
	 yGW2/8RT8UgDgP9H1QmmDjfdsXcVGeCmKZ/vt1eez9saBotvOz8vF0UAs2ZddI76i8LA9
	 Ynq2TzuRQ1dsMFpvQfYNRgNne/gTsOHa9m0+5mBYTXx6YHH8HvvNlL+XGx/pqSgqYfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MlIvHHbx;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FBB606A32A
	for <fuse-devel@lists.linux.dev>; Mon, 23 Nov 2026 03:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0FBB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MlIvHHbx
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a052288e41so39094b3a.1
        for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 19:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795404680; x=1796009480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n3/QgCFjzvK6G73Tiampz5hPbLES3QQEgOsn43qeBn8=;
        b=MlIvHHbx/C6qY6dETmONn7f2tTSI2eRHPQzMtA6c6GFcIM0rKU2om6wxFG6TYrToEB
         jeq0KVliRBVF9yQ4A5gCgwF4hH+1aJBMSJnz44U9aAthSPPY8s+u9GWjRat/B3tTAEo4
         a/NElFUlTnbRSurckFzEUI5sYBbF6NeIuecGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795404680; x=1796009480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3/QgCFjzvK6G73Tiampz5hPbLES3QQEgOsn43qeBn8=;
        b=sHMjOpNoU5XOLeOsH9lbFCoHMeIUaS9dMJSN7zoPAySgeUGRrOT1tDERHBdtwpPi/k
         iT6l67tGbMxxFAHvrUIvgPTOnChbwLE9Na1FXj94i+Bruxxid4DeeGxneB5Z9fY3AEnR
         SRUyc9ctKfV4WpbPj4GoxzdROD/ss59ozIOJv0FYVz+nOoeum13FaWAZaQphTQmPfcKg
         ROpNkymgZ8V5R91yoABes85XK9z7aIMYR5e+kdZSBb8EjGYzuCwh8bWFm9VBkBpzOgcl
         LHXLUl9qOFPGqfb6Eg7Axm2V5hWksWh+/sLLQzYcTZei2bfCJ942vJP4VKXYGhoduPXm
         ZwXA==
X-Forwarded-Encrypted: i=1; AL+hErH8Tdm+94tv0sM1zDuBnf87fQkerYVK857RJEseZxxgcEATVykRmG/YkPzbUls1IV69IuVTXDnLfzHZ@lists.linux.dev
X-Gm-Message-State: APuU4Z+h55+7DZDfo79R7hC+tNS5pkpeOwWTWLX8Cx2itQmuRrSF6hQG
	sK1N/5uyA3wMyrwQ1/El6p+4YFvIWAycJXP6yUg+3olU/JfobBCmcmTh+KPa6dddHA==
X-Gm-Gg: AZFdTZd8c5+Gam1mPnZOQ9tVl0BnPMegWSK9otHRb3D/ZCJuTsLcwrtKqY7TpjtCrat
	Xjhj3Xrodirnnc6Nhrq/bfR7caeieldv5AEuj1d1hDvsVVFqTGf3/XhyvLiNb9K5TLhrO/re1WF
	i899DLJxUOqD0Z+FglheFl/GGYRixLtXhSdEdBl14PI0zNHLLVHFMwOYYBWnGwVcMvG5DmIbNJz
	SE4JsacTfTRlu2qQxVvcVo2ERu87jQGx7Qugw29fw2Yn5avMca+9LMvBez7JpaDffw+yhKShVjD
	okpQ1x2Swg3Zb9v5C8c7M/KheYDxE3HENZX8dRTW/3JvPONa5LiUMSbrE407ivrNgAEuQIiTWSz
	9FTta3wVDygg1XNl2lpfCfEupXBerW6p8HEJYVMPbS6mIkjGbxPYc2i/Mdyti65uH/Yh68Rw5mx
	eFhyLRk7UTeuDnvSel3N2WnZoJkycMAMEPkTXZ3WwFfA5ZFZ37E/qoCPNoLQoXRlmbrXTdXR1gr
	WzaSD+2/7HyCWDrCxF1KVbK/OiABnAH/Fg0Sc7S2OxnB1Nuh6XLfUF3B9mGUXV7RllPcCxhHkgK
	8+4rKhFFEexiYuQ6430NkZrQCHEECFwPjoxqkZZ3iic72xG9r1KO2BtTfPoPbnscGZuy1w==
X-Received: by 2002:a05:6a00:c1ca:20b0:8b0:4ee8:10b7 with SMTP id d2e1a72fcca58-8c8792b617bmr11211724b3a.1.1795404680238;
        Sun, 22 Nov 2026 19:31:20 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8c87285c14fsm4712022b3a.15.2026.11.22.19.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:31:19 -0800 (PST)
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
Subject: [PATCH v2 0/2] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Sun, 22 Nov 2026 19:31:09 -0800
Message-ID: <20261123033111.2349160-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
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

Hi all,

This series moves __GFP_SKIP_KASAN from GFP_HIGHUSER_MOVABLE to
GFP_HIGHUSER (patch 1) and adds a KUnit test for __GFP_SKIP_KASAN
(patch 2).

GFP_HIGHUSER_MOVABLE already skips KASAN tagging under
CONFIG_KASAN_HW_TAGS, whereas GFP_HIGHUSER does not despite sharing the
same userspace-allocation contract. On an Armv9.2-A device (6.12 kernel,
kasan.mode=sync), skipping KASAN on GFP_HIGHUSER cuts 32 MB
/dev/dma_heap/system alloc+free latency by ~80% and improves an
app-loading OpenGL benchmark by 15-23%. As a side effect, GFP_HIGHUSER
shmem mappings (such as drm_gem_shmem_helper / panthor [1, 2]) stop
hitting the swap-in readahead PROT_MTE tag mismatch, though the general
readahead issue for other gfp masks remains separate.

Changes since v1 [3]:
- Dropped GFP_HIGHUSER_KASAN, the pipe/FUSE/kexec/RDS conversions, and
  page_alloc_highuser_kasan (v1 patches 1-4 and 7) following David
  Hildenbrand's and Tomasz Figa's feedback; kept those callers on
  GFP_HIGHUSER (2 patches instead of 7).
- Rewrote patch 1's commit message concisely (Lorenzo Stoakes).
- Dropped Assisted-by: trailers from the patches, keeping tool
  disclosure here (Lorenzo Stoakes).
- Rebased onto mm-unstable (d12eccbcb79a).
- Kept the fs/kexec/RDS maintainers from v1 on Cc for visibility since
  those patches were dropped.

Testing: built and booted both commits on arm64 with
CONFIG_KASAN_HW_TAGS under QEMU (virt,mte=on) across kasan.mode=sync,
async, and asymm (9/9 runs passed for page_alloc_skip_kasan; 3/3 failed
as expected when patch 1 was reverted, with the next test still
passing). Verified W=1 builds with 0 warnings across arm64 (HW_TAGS,
generic, SW_TAGS, no KASAN) and x86_64 (generic, no KASAN). KUnit tests
were not run on real hardware.

Tooling: an AI coding assistant was used under the author's direction to
audit GFP_HIGHUSER callers, draft the KUnit test helper and changelog
revisions, and run the QEMU/KUnit build and test matrix.

Link: https://lore.kernel.org/r/20260519-panthor-kasan-v2-1-b7384458f076@gmail.com/ [1]
Link: https://lore.kernel.org/r/20260521105148.5497c281@fedora/ [2]
Link: https://lore.kernel.org/all/20261116230627.3537051-1-jeffxu@chromium.org/ [3]

Jeff Xu (2):
  mm: kasan: skip KASAN for GFP_HIGHUSER
  mm/kasan/kunit: add page_alloc_skip_kasan test

 include/linux/gfp_types.h |  4 ++--
 mm/kasan/kasan_test_c.c   | 44 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 2 deletions(-)

base-commit: d12eccbcb79a4fa35c3aa588eb79056af62eb859
-- 
2.56.1.750.gf70dc682cf-goog
