Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965347;
	b=r4D73ASEOvlNfItqn3Ctu1a874+QBQrZl4dymsNGNPpZ+mpBCIuUs7uYgni5ft2b7rT1
	 cjkhzRXb5uMypkGeasL9TYQwLzoNA6KQzmy6Vp9o6razQP1F3zVyafuSpr9o4LIrZjqYl
	 OuIg6K32qZ+xFJ1Th1GYt8TKK0dGqCHQ0c2CYiXqsNWN8p/EdOB1lb+KEirnjyBW1/PEB
	 WCZvnA9CAbXnJIwZuhE0pneNg2Px80bYsPIDvfW/+hJwwuBbwT33KzUxcBqskVnkDgSLi
	 3sj8KlIWAk4aQSMmM66BoLiUQGlzONJV4r6IgUb2Bral/H1IA+3Ae/n/ZdSKT99LmGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9QrBc0w3KV6ChVNAVMzB1hWL9AMrXve7Stq4IEHc3B0=;
	b=Hk4/vqg2M5c1SOryzFJUMaUBUq3UofPbWWTo1C84VURv9SbMJ5ihuejr3U0fZ1hASnvP
	 zken0HyGtJ459JZT4wVG/nTNb7fGahuYXjJjlBAbedC5PwGvNKmRoQW4wkyvlzwXAzLK7
	 GGUKeDF4tK61faxsK6ya3DHdCXjmVOnlEIS947DOv/Q9Lklv10oDTTJ3fNvqNeB0e8lJY
	 3rUqblo/RAxV3yq94VJ5w2QAVDTv+zCkEJMBeD/1XC5r3hE1WcaW4OCdwwZSmicgq/lrC
	 Qh0pTGexiXad4gYb5/kwvvrniGI7yYHDwSYFe0O3PdPPgDn1YF0KrropxfevbskjVnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=g9QzBbbp;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23B5606A338
	for <fuse-devel@lists.linux.dev>; Wed, 18 Nov 2026 01:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B23B5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=g9QzBbbp
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0ac1900efso39616a91.0
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 17:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794965345; x=1795570145; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9QrBc0w3KV6ChVNAVMzB1hWL9AMrXve7Stq4IEHc3B0=;
        b=g9QzBbbpgWMB0vsBj2IgV8riNA7jj4whY+p2jbBhLc0VJyaVf1s/vyI6/vw1kizufi
         /c0171UFPDB20WpB3rYngfUoAZwEEC1nTsO5gYIfTmm1yOCJ3vGonNMoguQYuM5c8uOH
         XjUZpG5Je16gb+GSELBp9FiOCdmWP2WEcOruY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965345; x=1795570145;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9QrBc0w3KV6ChVNAVMzB1hWL9AMrXve7Stq4IEHc3B0=;
        b=CaYGhqnQwTNe1Alry2MUloM4KpPInOEBTCgoVxK23v7BuYYSdUW9equyXHDKB0en6Z
         0yo9QUafwOKBaUGQRJEOYelmz6efsAgRfm7C/PRuXkQ7HnKue5gapTW5u+tOomulFrwL
         8FUNXv8JctIh6MTWYJxpzEL73zdk4A+tTTeQdsmIhdKmHJi8A+OhGWNuvj0vTdPcPW7w
         ST/dxmqNe/6riPX4BqZHS+2TuT36MkG7cXTYsAnVwQnro0bJMULqOShOeHOfiws7Hiwv
         QOrNGG597FcizpkmqOhudSeabSr6PMVADibqa0pOFHSrLpmpchsBtP1anQ0/s9babur9
         VfuQ==
X-Forwarded-Encrypted: i=1; AL+hErHMG1XCiCCKQ+ozyr01V404CyjXbTfI9AyRAdLzDSzx3Qx1EbSJqzOFTWoCwTH2RVosPOa0LC+h79kN@lists.linux.dev
X-Gm-Message-State: APuU4Z/7Z5pBC5SWqJi68LncSF/8e3Y6lxPZyQftm4t9Sp4PhluDV8aC
	JUvgmHztV/ClLwjNpaplmYJTqzyNuh8Ro6rl4Oa/Qjcn1MUpif+BV+4q5BJ4UkwnhQ==
X-Gm-Gg: AZFdTZe3a6v3rsCUcRul30M6s+Yk8Fb1JRSkb/5KMbBGYDktgHQRFqOtmh0aS0gfeB6
	nau/c/7oScf5N4aSG4tvDrK72JIJqyqJbsLZkNudQaQj4k/JE/lNYfFJmimsMbw0G56f9NkZU/i
	pJswIvRFGvXjShOB43e53NMmGYv1uKHD3woFWL/KxJHPgmJyh/I7+lpybysqBVkZgq6Po4NQD8S
	Ers7TV9bzWRZpSH0xLHklNQE6DJfjm3EOVJQZZUKseql+B+YZxvTg+M7CzCZRqdRjKtuEJd/E2O
	/VQo0Kn4hHldXEBi8rbm7jP10pMAT0AwPgIddKxl3U04cEP1/eJc82YjgE7du7UPGdV9gCWfKEG
	3tMfZzRkM095ZCOkyHTIaSwpc6FwH+EdpsePDlfyU2QLojJkEm3AZZwWOg3hN18CnQHA9Z9sO6p
	rCBj1gZmZijZgZWh6ATr7vVFRmfwLpZ5K2vdb2xHGfbL5ie0mJkwLvZY0+hsgylEbjq87zN5JiL
	eWiB5F9mRV7N8frAJcF5fdixNJr4+1PhYrDDwwhDJZdS+H76hpeEp5NO4rcumWdLDDjjKposaaF
	yROSZHaBHS/V/jtlbzxrN5/4lWHliOsKOPjGjGD0iURyh/vTr+5nS673EDqupypGHflgiEE=
X-Received: by 2002:a17:90b:5390:b0:3ac:a11a:7c88 with SMTP id 98e67ed59e1d1-3b3d07af9f8mr1892178a91.3.1794965345247;
        Tue, 17 Nov 2026 17:29:05 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cde3b98c75bsm243073a12.10.2026.11.17.17.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 17:29:04 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: David Hildenbrand <david@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>
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
Subject: Re: [PATCH v1 0/7] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Tue, 17 Nov 2026 17:28:58 -0800
Message-ID: <20261118012858.289236-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
In-Reply-To: <CAAFQd5DzTmyeVQxNdhdy8pPi+ts1cCgbztVJiMoNBeJWBzjdQQ@mail.gmail.com>
References: <20261116230627.3537051-1-jeffxu@chromium.org> <2066d131-f999-4747-beb8-520d5e0ce1db@kernel.org> <CAAFQd5DzTmyeVQxNdhdy8pPi+ts1cCgbztVJiMoNBeJWBzjdQQ@mail.gmail.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 11:11 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Tue, Nov 17, 2026 at 7:10 PM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > I really don't want us to spread KASAN-related GFP flags in the kernel.
> >
> > There must be a proper way to abstract this.
> >
> > Why is GFP_HIGHUSER not sufficient? We were already told that this is memory to
> > be mapped into user space. Placing data structure on it and handing out pointers
> > to that would already be a bit questionable.
> >
> > So what are the ways to avoid GFP_HIGHUSER_KASAN?
>
> I think the idea behind GFP_HIGHUSER_KASAN is to make it possible to
> skip KASAN for GFP_HIGHUSER by default (for most of its users), but
> keep it for some of the users which today use GFP_HIGHUSER for their
> memory allocations, but could benefit from the added security. As per
> the other patches in the series:
>
>   pipe, fuse: use GFP_HIGHUSER_KASAN for pipe buffer pages
>   kexec: use GFP_HIGHUSER_KASAN for segment pages
>   net/rds: use GFP_HIGHUSER_KASAN for message pages
>
> That said, I'm not familiar with any of the code mentioned by those
> patches, so I can't really tell how much they would benefit from KASAN
> or if their choice of GFP_HIGHUSER to begin with is correct.

Thanks David and Tomasz for the feedback.

Tomasz is right about why I added GFP_HIGHUSER_KASAN in v1: out of
caution, I audited existing GFP_HIGHUSER callers to find any that never
map the pages to userspace and instead fill/drain them in the kernel via
kmap_local_page() (pipe, FUSE, kexec, rds). Since this series intends to
improve KASAN performance while preserving its security aspects, and the
performance impact on pipe/FUSE/kexec/rds was negligible in my testing,
v1 was optimized for minimum behavioral change.

Looking closer at both of your questions, I agree that the security
benefit of keeping those 4 under KASAN is minimal -- e.g., only linear
overflows out of the pipe/FUSE/kexec/rds page, since none of them store
kernel structures or pointers. That is the exact same trade-off we
already make for GFP_HIGHUSER_MOVABLE.

To avoid introducing GFP_HIGHUSER_KASAN, I see two options:

1) Simply keep those 4 cases under GFP_HIGHUSER (drop patches 1-4 and
   7), reducing the series to just the GFP_HIGHUSER change and its KUnit
   test.

2) Switch those 4 callers to GFP_USER. Since CONFIG_KASAN_HW_TAGS is
   64-bit arm64 only (!CONFIG_HIGHMEM), GFP_USER is identical to today's
   GFP_HIGHUSER on arm64 and all other 64-bit builds (and if 32-bit
   CONFIG_HIGHMEM=y builds still need ZONE_HIGHMEM, that could be gated
   on CONFIG_HIGHMEM, though that feels ugly at call sites).

(1) seems much cleaner to me. David, would (1) work for you?

Thanks,
Jeff
