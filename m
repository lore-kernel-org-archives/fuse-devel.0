Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550101;
	b=DlH1EwPc+ApqAMxvEJMO6Eo7haN2elnFZnKr1WHkKh6Q7JbRIYxNUTUOBeb4QBP2USL0
	 Okd/QOyaxffziwFDAnovOcRNLQpgZ4/0ja1B0rkEzPuaJmZ9yz9sjC9C4p2iRbI48zHLG
	 hieY+btGdV+lr+Z+TIzxrsBKnaplskxBwpK7yS0JB1VF/Cx4WBAn6gigYcG083gMJXjjN
	 PpVxGr1sz781fhz04OKcUQBmMeFcm/v0X8jlp+kv6UNOJp53lSElj8jFO8Ncyoco11fAA
	 7Tj/Pn7pTfx8hD34/xf+45X7pR6Z2pKjp7Hd8lxUdVwN9BPwGEsPojeJzRZq3C/q+Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IV7aCStFZdnFeaXhFPoQdGrpPnMKMt+5GDtnao0aM7M=;
	b=wGC3aK8zgTDtrQ5cDXC5rDGRzSyj93wCNkJukiZJx9MGxOrdF+gkRMyyPWiEmn7x/0Jk
	 KIUZoYMAmgvNxAdA5qREvRpOacYcCWT99dSyhhIxSTAw3BKpyvMZdQJMDaomCDcAZ/xB4
	 IJ7l22mUE82XrBqYm7SLetV1LdIZhfs6p2bzUG8Qnoq+Zn57xC7SQuT6JKcUzw1DSbLZ0
	 1Vc89jhjPSfB36Grg9VY+m0usMJ8/zdpVX5PDmXDyCf5Yvn2xjuJCbQXngbIdDHdgLaii
	 46eVwJF5dPwTrX+SA2ng8VG66dWJBl9VrG+V+a2ozdM5i1zyDcDJXl0BDmgk0npo2wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aRSP5VWg;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C7E606A31E
	for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 19:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C7E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aRSP5VWg
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cde60d879e4so107869a12.0
        for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 11:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795550100; x=1796154900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IV7aCStFZdnFeaXhFPoQdGrpPnMKMt+5GDtnao0aM7M=;
        b=aRSP5VWg6FNAvNYL7Z9UaOyuHXR5gNu+SHr2A+jIxCIGkyY5A1rO85ZV3E2Tj1ec8X
         jwga1c328RrEpuWZIs5/KpwhDZRCoFHzk06nL5mvUNd7dhoGhnRlHTIenX2f0mR73+n8
         M/ATFI6jUAewbugYu0Qnw+4q6HROOLOJO26XE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550100; x=1796154900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IV7aCStFZdnFeaXhFPoQdGrpPnMKMt+5GDtnao0aM7M=;
        b=ll0eTzOgCXJJQitfNxnut0j4K+jiAMP6GXwxmIv1/btXf5wm+BqDwS/4gZx4vP97wm
         XVu81qES0M8pYsG8sdCAGPMCdpQ7Sg3D5gOCR1ivq3hQmZzYqLjmUUotengzwe2k/heC
         zb9F+qnIbascCIGACh+SOwzGVVYJJAhwDZkAbfkSINk8A/2rHaBVM0nNyNcIjAbMR+yL
         8U+98PDKbTe1fYYKJ03a1bYQNGTZRfeM/4th3nbpf/8TsvultbrbbLzSF36vSnneWmSy
         hDn7PfwiTynMRFNjUCFe2edgdyVmWbiPLI7aBHLi0mzWTp1PY2xi/s+xDPXi2fUqwqPQ
         h8Ag==
X-Forwarded-Encrypted: i=1; AL+hErGRUF/0Tfpw8FN6HYa+pK55DzCkuXDUS9tut4WYheNsOazudn+DrTRTHgFYm/q+UUes5Vyl1oWp8fKp@lists.linux.dev
X-Gm-Message-State: APuU4Z9cy0mwDReW60FaF89MW15HlwB25X1gl6z42BJau/1pof4mFrLv
	b4jw3tR+UzdhLGR3PYduKZB/vM3jDq3TVxCdq8ZZNvF9wOzN0xPux016uO24fyqe9g==
X-Gm-Gg: AZFdTZd+rygXP+KjMqLOFnywqpgtV0LekAkbW2Jmc2i7vBL8EEzFtebhVw2bagvYEvw
	i5+AW0kM4cqi4Wkv1ENP1QRcTihGtV9HcmwFlpcdDcEnacjPnwhkKhCO441SXwOtygPAPvg6Y8M
	hUxZZMGQafrnh13wRJSfMzmKb/l/cOCj+LSBhlY2QJNfHfqTyWOqxFuFyRquL0VS3mDkEj6IT4R
	FAitsJGOEjkJrn7sjXYhoVBWvLLnRmvOpka/y5tmAcMAJsAnjU78UIRkREZDaRMFz3WjNgT28pX
	FNuVZPSPUR1qioTbGue+uqHjMNjPukL4f5OIdDCkqpr0VuQ4Y0lRzpz//TjF1hNjHGFXdF67N4H
	O1tbdkQF2/ZCltdiYmEYniXmp28OGn+WtWWt3Ot0BoLcIp0E1mOQ+/7yFivEehT2f93o9VaQjga
	sBgL6GFYOv37N31ZBw5Mz6SkVV3nul2cKrn1TTmv74OkLvCheOH8LUzDe4P23CdGbUxOV8HuN24
	p83io2HQRPt07tS3oeZYVFCwJwTUjJzZdGFdH+mn4LS/M+cTmMq9FWQNv9F6slfEWB210Zr708V
	eHWSh8TDniGqzpJmqcTbChGvEpdo4PjKayhNWaWgL0r0Fz+MMSxjarMIvdUNpr1x/p37kA==
X-Received: by 2002:a17:903:4688:b0:2f0:7d6d:4a09 with SMTP id d9443c01a7336-2f07d6d4bc1mr137239435ad.1.1795550100419;
        Tue, 24 Nov 2026 11:55:00 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03f142b8bsm72335435ad.70.2026.11.24.11.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:55:00 -0800 (PST)
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
Subject: Re: [PATCH v2 1/2] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Tue, 24 Nov 2026 11:54:55 -0800
Message-ID: <20261124195455.164425-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <7ed1f755-5759-4b5b-ae00-a814f16b7903@kernel.org>
References: <20261123033111.2349160-1-jeffxu@chromium.org> <20261123033111.2349160-2-jeffxu@chromium.org> <7ed1f755-5759-4b5b-ae00-a814f16b7903@kernel.org>
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

On Tue, Nov 24, 2026 at 09:10:53AM +0100, David Hildenbrand (Arm) wrote:
> On 11/23/26 04:31, Jeff Xu wrote:
> > -#define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM)
> > -#define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE | __GFP_SKIP_KASAN)
> > +#define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM | __GFP_SKIP_KASAN)
> > +#define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE)
>
> Can we please add a big fat comment above GFP_HIGHUSER, explaining why we use
> __GFP_SKIP_KASAN and which security impact this has?

Sure, I'll add a comment above GFP_HIGHUSER in v3:

/*
 * GFP_HIGHUSER (and GFP_HIGHUSER_MOVABLE derived from it) sets
 * __GFP_SKIP_KASAN to skip HW_TAGS tagging on allocation and poisoning on
 * free. These pages are meant for userspace data (e.g. anonymous and page
 * cache pages, DMA-BUF, GPU/DRM buffers) rather than kernel data structures,
 * and tagging every granule on allocation and free is expensive.
 *
 * Security impact: under CONFIG_KASAN_HW_TAGS, these pages carry the
 * match-all tag (0xff), so kernel accesses via page_address() or
 * kmap_local_page() lose HW_TAGS out-of-bounds and use-after-free
 * detection. Callers that store kernel data structures in these pages
 * should not use GFP_HIGHUSER. Generic and SW_TAGS KASAN are unaffected.
 */

Thanks,
Jeff
