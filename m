Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925079;
	b=i4ZMU9yqb+4HdXotHIZPgn3Xa09v3liKMLnFlKbvjPwADLONfL5I7RzK2vMu+IZ3Q6cr
	 2z/I2EjO9EbH4BKlpHbjcn3ZVOUEXcQQW451ntI+WGFWU9goK9q7ocxmV/mRzD4eYQvvn
	 8yIWCon5GlJtynAoLAoiAb+WQ+79fVbhKIAyZXq1kuNZQaXfGj/AoOJODuuoNtTLkkCSk
	 F8SmocImENruvw95JIJ56fXDamRK7LCZHe8CobOrJyxaYDMbBiUGGJGGGdj6hKuxCyIBy
	 WPL8Vh9jP24PeiWIfGmKuTD8ZCyXGWEmSs9dLval8Ouhs4Z3h0Hn/teQwl4HgFGKfRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4FXZ9QjPMWSPXHYn/FS5PKL+JaPOXiDC39K9maTGAmk=;
	b=R8G/e5e/ao2TCCZ7Puok9DO7eKvAyzAf5Xy3MtyVK8DBwNdztgcWdjhyu7jr80Q+C1Zk
	 aMs8m3+uNSnMqzm+JSm83h8YXMkvhTlXhYnGEOmpv0DrjcLZkZfVteU5jguxphzPu2OQz
	 0xPltMgver9cSXOryP0/UbXEXnRfGu6P1pgNLEjGY6kOR0uhx6N6yDRwe2JEIveuPGOba
	 ZdgkIIdp1mAU0o4j5yLje2mGTiZ3RTU9neTkwnj8Bo422DJxYgkKk0CialbSTkS0cRTMt
	 UaJLzWrjpQwoFkxegt8gI9W/+gE6XU1ubA71fovw07VYzxtMPdZApBmcvWPik9A3YDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K0L9MZIE;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6441606A329
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 14:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6441606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K0L9MZIE
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso40525121fa.2
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 06:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794925077; x=1795529877; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4FXZ9QjPMWSPXHYn/FS5PKL+JaPOXiDC39K9maTGAmk=;
        b=K0L9MZIELOLYIVVQG2wTYlMjiQwX5PQTUtVSgJblzK5lfy1uIk0eFapf02RDVJVJ3g
         zA+bGf0GbGUz5pEvByNrXMQzPfxufNV9u/DkFtNGyfxS2fTLYHsxg6Po7HDdLj/eaSDw
         Dibw7ZTK7CMXSBYEXkLu5B9+6pPI/RxBavZCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925077; x=1795529877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FXZ9QjPMWSPXHYn/FS5PKL+JaPOXiDC39K9maTGAmk=;
        b=PyZ4Pf7iCfUDxEcZAU1fCaxQ6d4IhH1sNVhm2FqJ+rhIEFqDYTw/ACU0fXez8P5a3j
         P4X6EyFoRzBB1MtptbUoxd2CKifU/33lMenYsyR0x8ONUnwYmAluzK6aNQc4YwtNFD79
         PZodYMMo5KBoM59Nezl60F5EgXu3lw3CuTmykIN+n5JCR65OHIxd3g0F8ChCxwnzDngz
         hFDnliiv89y1S7xQp/OyV6bPNa6QRok2vZ7sY2de3CaQZngS2IBGRd8q4KApYjJJ3UTX
         06OKru/oG1HhAZ26s4JPXJlOptIgELVM4IeQcVln8r9pzQduhVnzXqSVwMXh0JcDaQEh
         EwIg==
X-Forwarded-Encrypted: i=1; AL+hErERVFyiRw/DPl6dKaay5cpMErdyebdcKnnUYgRCODP2KdHOWmYNN5KI5YL/AJ4NrQRGHs5FjybUXiQk@lists.linux.dev
X-Gm-Message-State: APuU4Z89zjY0PDhx+xZ2zFoHVMkY2SAMtj6YcOG2zVHWwVmFSnP4xffl
	8xKEVn5LKMGhK/MzNSkI1FvrH8uVKedu5vTDgEu50HgmxfyOYpeioNihs++ShFT0bwyHEA68dvD
	skHQzsmzUnHo=
X-Gm-Gg: AYBFou21uu8hAuHHoHNeBRA7ggGUY2vsqph6otG2XJz0Wc8/VN6cph/02IJWsNGy70F
	6fm+4o0iMrlO5z0YPskvKnx3uUUcE4Beb8hpQ7C1lVTwKKQfmpqYSqGgXO5LIr3z+d1GCpOV0eM
	EVfYNjhPeskCrtazkp1zTl7ZkS4xGbdpN9Xug8w6RY3h9DGuFR2TRPagQy21OEJ2/GDMcyj0qoA
	olAkP5TCT43Ji2BOmC1WzZa9rNbyP4KbVdIS1dBYi0HTvi7Knr/vkcMZNLn80IMDUyc8P1Xjnmd
	yVYjA/gfQK39/ShrOnnqrmKpWQ60jVeXOjHQrnygnd31/PSuJmtrn3oYgag40kV9tx0d/BpF1Wm
	CMFBV94DodBnmTaHwZOzKX8Xu9Az1ljr1LF+M1daC6MzjxBDxsH36RNvd2+hM0iqtiMHOdO1Zsp
	QpeMqnAGVRce/mfQbW3ZX5VwdIV0Cd4u9ki8Tq7Lrfc5INdK9lyAuGv/qm9sj2/tGgA0KERqAcv
	ENfSZW5E20bS6zs0hp5QIQ9raYSp48frDQ6QQDstH6KTgDJsnpCd/hBcnoyddiF73dVgpy5fGx8
	KjSsOPPDMSEtPPwK+Bwwww3NcsLCzuW7F0yELF6nXwf7NmG6sUEPOiGWL9ZOCaz8
X-Received: by 2002:a05:651c:a326:b0:3ab:3d02:d03d with SMTP id 38308e7fff4ca-3ae2b4b83c5mr48455751fa.13.1794925076724;
        Tue, 17 Nov 2026 06:17:56 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7808cbsm40942051fa.14.2026.11.17.06.17.56
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:17:56 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so6227e87.1
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 06:17:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE98vHTJ5Z/q4iQj1RAIqPmNoPlcv2Gve/8PZMiPzJTG4pjpn5nkmzRVkRPl3xJnT4zYqLGtxOwEKPR@lists.linux.dev
X-Received: by 2002:a05:6402:a511:10b0:6b5:5d24:5d90 with SMTP id
 4fb4d7f45d1cf-6b85b4c22d8mr72630a12.3.1794924698252; Tue, 17 Nov 2026
 06:11:38 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116230627.3537051-1-jeffxu@chromium.org> <2066d131-f999-4747-beb8-520d5e0ce1db@kernel.org>
In-Reply-To: <2066d131-f999-4747-beb8-520d5e0ce1db@kernel.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 17 Nov 2026 23:11:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DzTmyeVQxNdhdy8pPi+ts1cCgbztVJiMoNBeJWBzjdQQ@mail.gmail.com>
X-Gm-Features: AclHuK8ZMC6yRFY7VxkKfsQMYV8BNfasB49bEPdk_bBjeXaAi9-9aO4mXcafXvg
Message-ID: <CAAFQd5DzTmyeVQxNdhdy8pPi+ts1cCgbztVJiMoNBeJWBzjdQQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] mm: kasan: skip KASAN for GFP_HIGHUSER
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Marco Elver <elver@google.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Chia-I Wu <olvaffe@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Evgenii Stepanov <eugenis@google.com>, Ian Rickards <ian.rickards@arm.com>, Jann Horn <jannh@google.com>, 
	Jeff Vander Stoep <jeffv@google.com>, Jeff Xu <jeffxu@google.com>, Kees Cook <kees@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Collingbourne <peter@pcc.me.uk>, 
	=?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Miklos Szeredi <miklos@szeredi.hu>, Baoquan He <baoquan.he@linux.dev>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Allison Henderson <achender@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-mm@kvack.org, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, kexec@lists.infradead.org, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 7:10=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 11/17/26 00:06, Jeff Xu wrote:
> > Hi all,
> >
> > Currently, GFP_HIGHUSER_MOVABLE includes __GFP_SKIP_KASAN (commits
> > c275c5c6d50a, 70c248aca9e7, and 0a54864f8dfb), allowing movable
> > userspace page allocations to skip KASAN page unpoisoning on allocation
> > and poisoning on free under CONFIG_KASAN_HW_TAGS (ARM64 MTE). However,
> > GFP_HIGHUSER does not include __GFP_SKIP_KASAN, even though it shares
> > the same kernel-accessibility contract in include/linux/gfp_types.h
> > ("for userspace allocations that may be mapped to userspace, do not nee=
d
> > to be directly accessible by the kernel but that cannot move once in
> > use") and differs only by !__GFP_MOVABLE.
> >
> > Moving __GFP_SKIP_KASAN to GFP_HIGHUSER addresses the performance issue
> > below (following up on the earlier drm/panthor discussion [1, 2]). The
> > swap issue from that discussion is not addressed by this series:
> >
> > 1. Performance: For every 4 KB page without __GFP_SKIP_KASAN,
> >    mte_set_mem_tag_range() tags all 256 16-byte MTE granules (via
> >    STG/STZG and DC GVA/GZVA) on allocation and again on free. In
> >    graphics and UI workloads, DMA-BUF (system_heap) and DRM/GPU
> >    (shmem/TTM) buffers use GFP_HIGHUSER; while steady-state rendering
> >    reuses buffers, window resizes, surface transitions, and app launche=
s
> >    synchronously allocate and free tens to hundreds of megabytes (~32 M=
B
> >    per 4K RGBA frame) on UI/compositor/render threads. That takes a
> >    significant share of the 8.3 ms (120 Hz) / 16.7 ms (60 Hz) frame
> >    budget and thrashes CPU data/MTE tag caches (especially on
> >    cold-cache free). On Armv9.2-A, skipping KASAN cuts ~32 MB DMA-BUF
> >    alloc+free latency by ~80% (~98% faster close()) and improves the
> >    OpenGL score of an app-loading benchmark by 15-23%.
> >
> > 2. False-positive KASAN report after shmem swap-in readahead [1] (not
> >    addressed here): when a shmem page is swapped in,
> >    swap_cluster_readahead() also reads the neighboring swap slots and
> >    allocates their swap-cache folios with the gfp mask of that shmem
> >    mapping. A neighboring slot can hold an unrelated page that
> >    userspace maps with PROT_MTE. If the mask lacks __GFP_SKIP_KASAN,
> >    that page's folio gets a KASAN tag in page->flags. When its owner
> >    faults it in, arch_swap_restore() writes the saved userspace tags to
> >    the memory, but page->flags keeps the KASAN tag. Later kernel
> >    accesses through page_address() then use a tag that does not match
> >    the memory and are reported by KASAN.
> >
> >    This series does not fix the readahead path. It only removes one
> >    way to hit it: shmem mappings that use GFP_HIGHUSER (e.g.
> >    drm_gem_shmem_helper / panthor) now pass __GFP_SKIP_KASAN to
> >    readahead, so the neighboring folios no longer get a KASAN tag.
> >    Shmem mappings with other gfp masks that lack __GFP_SKIP_KASAN
> >    (e.g. GFP_KERNEL) can still trigger the report. That issue should
> >    be followed up separately, for example in [1].
> >
> > What changes for users of GFP_HIGHUSER pages under CONFIG_KASAN_HW_TAGS
> > (other KASAN modes are not affected):
> >
> > - Access through vmap(): nothing changes. Those pointers already carry
> >   the match-all tag and are not checked today.
> > - Access through kmap_local_page() or page_address() (for example
> >   ramfs): accesses are no longer checked by KASAN, as is already the
> >   case for GFP_HIGHUSER_MOVABLE pages.
> > - Buffers that the kernel itself fills (pipe, FUSE, kexec, RDS) keep
> >   KASAN checking by using the new GFP_HIGHUSER_KASAN (patches 1-4).
> >
> > GFP_KERNEL, GFP_USER, slab and vmalloc() allocations are not affected.
> >
> > Patch 1 adds GFP_HIGHUSER_KASAN
>
> I really don't want us to spread KASAN-related GFP flags in the kernel.
>
> There must be a proper way to abstract this.
>
> Why is GFP_HIGHUSER not sufficient? We were already told that this is mem=
ory to
> be mapped into user space. Placing data structure on it and handing out p=
ointers
> to that would already be a bit questionable.
>
> So what are the ways to avoid GFP_HIGHUSER_KASAN?

I think the idea behind GFP_HIGHUSER_KASAN is to make it possible to
skip KASAN for GFP_HIGHUSER by default (for most of its users), but
keep it for some of the users which today use GFP_HIGHUSER for their
memory allocations, but could benefit from the added security. As per
the other patches in the series:

  pipe, fuse: use GFP_HIGHUSER_KASAN for pipe buffer pages
  kexec: use GFP_HIGHUSER_KASAN for segment pages
  net/rds: use GFP_HIGHUSER_KASAN for message pages

That said, I'm not familiar with any of the code mentioned by those
patches, so I can't really tell how much they would benefit from KASAN
or if their choice of GFP_HIGHUSER to begin with is correct.

Best,
Tomasz
