Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504930;
	b=aij1TZm1g1eYnnKi0xm6TxT/lQ6rBWRNneK09OWpElle+kG7qLODCABkHW9qR73kqYTV
	 0RvkumeL6JTMeDrNu64pTg4VklPNOn51x+jl2HPCLRschpLMfL3jP49PkF2LfjT+cfRdH
	 /KLfM4se83Tx9NNkRsMw3Xy0rqd9tiWwRIa8rtNQWJ5zmTNFB8+aulsvalNSuTsVVbWWJ
	 RE+jJoNy1DVBHca+NDbteAGLEXRgLqe+8zZfcVu1kpv+8Kpvba4Zpy32XQkVq7s604WG0
	 00ZB5esRHCOXjMTkmhJ4SPMwUy5oX+xz3GaqJo9wVJERTgr5yDWOvM+nEg4VOHQ4MMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AVq19U8dsLUULl5Arm+uFElP0L4F8s4K16OEcmVJkjM=;
	b=cuZr5+uSh1GY1e8hfbi3fx+XfsO9XFXZAh0vtdBSJ+NNnVn3U375GnkD+klvgw0ISbYY
	 iIkAdHCpuKGt06xsU0gqxCuknA6qDkjbfRikPFWshfRutAICuZzyqqKfiCNAr4B+9pzMf
	 xYsfrDFDGj6/RcMBQ0YMvbwTxktdyvBBwIFIUL2O9jPyT121b3dI3RzGJxb8p4J4wuoek
	 UCigUl7aNdVUFLYYTclhL1MaZbVHzR8OFxBhngFJJz7fkoxtmyP2xr06pHvOWzACL+O2D
	 wQ1XnNSwdUXrAOQCLNHq0o8mjjE79Bw06CNJTKGuQYeDai89GvrPpYol4TzzEr/GLrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KjuYbpsf;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C1D606C341
	for <fuse-devel@lists.linux.dev>; Thu, 12 Nov 2026 17:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72C1D606C341
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KjuYbpsf
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bccecba199so77726e87.1
        for <fuse-devel@lists.linux.dev>; Thu, 12 Nov 2026 09:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794504928; x=1795109728; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVq19U8dsLUULl5Arm+uFElP0L4F8s4K16OEcmVJkjM=;
        b=KjuYbpsfVohnX4xw0Fy51+FZjnIhRzo7b7YxQH5LBhDPsL4w2hYb4A6uxydHxIuPnZ
         TzsfiddZjoSmC2loh/bc1fxwEO3OPaXNB39T2I6y8mSj2LEgZvEtsYLe7afn7+3wdjSs
         wKIzmiJTNSZl0gqTmGNUAXRuWuNxjhWaiVXnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504928; x=1795109728;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AVq19U8dsLUULl5Arm+uFElP0L4F8s4K16OEcmVJkjM=;
        b=LOVWnj21H3mkayHwLZfnb4Hl0cpBHZTfotifwgV31IBMY+xb5/TBrCSJUCUJuu335v
         eyYdJA0/PFnyTW8F+twOc913KEAqYz0CgEM4vJIkB/23lMnNLRty9AirMCNdvZBdWUhz
         0uGPzb4gOE6sEKBWiKuiONW1MboaOR2qCKbDlGInCp6FvoY2bMLI4n4MOFCEUTESk/7N
         KWTi6XtFGMhlkUDK8AevoT3PaMjwLmyOgURZlO7pDq4MUE35GiwX1D882lfPwalQqLrj
         8kIaXEWrQDxLPilXjRNM8ezFothbWOEPv5yJu2MneY3Q3flmDAtJ6zJ56EDp+58Zkzcp
         fmgA==
X-Forwarded-Encrypted: i=1; AL+hErFVSezYdJXISmIF/Nfk6etkCFN6fPAUrwPbfUsZ76YZNoxdDLTegIhDljqmTbNu5RR6vNpn0jKN1KNQ@lists.linux.dev
X-Gm-Message-State: APuU4Z8N3GvxJYoYK4Eka0a1Edqx3StVp/aJhnQWZ2VhxBhkCP7dlGg/
	wO34Ak3VGQTLxRCFjVOT0a5iHxF0z0tLmB+PIpx0B8t1Gad2XU84qBs6HwDasmToydxGNUKaeG6
	wck//icvM4w==
X-Gm-Gg: AYBFou3B5rFbzumoBejaKOnLPI5aHaAYuXoqYQCyxBCoFYjeWeaQaWBIET70MQddfke
	sxMCewDdSS2U61Ss/xiOIumVgRA5CJ9SbFoqHsovtZg8Eo8KbbEbCtdkulwNqYc8OOwjxhN/O/t
	fAStY5oQw7ZlYOiky5pPfSY9DcNypLi8a0Sy+Vf0g58U7mnBzOQNZk5i2g6vqtIXbwF1UvHORA6
	BgXHP/yMj7UFp2Ca6PLuRdGJT5bbQMKyzMl4uj6nmMmx8KghOSa1Y11a55oe9Ss4xP2kTQ/tCRj
	hVBYP0tvZXHKHEhfPvZAABa967kOr4xia9tgfmjFcy3R0RTpmc9uWrkLGzC/eFyiu6nto8dJu6S
	yoTkPg+XFb/Fz5Y9Kyxhds//KqatQWzFm49PEepIdlToXPR9vRrAJehxIIYhO7GpfMWSw5xhrZO
	Hg6gkqQSwCtsTz+ojujb7JMdVHMgDkqqpAehZSl9Qe7RVwVETn/psKht+dYwUKPFCTybhwwzWBg
	2g6esRaEX8sBAAmPTJMtPaODY/VBFptDHeMwcdeRPsmaJ0ybs/pb1ToQB6eMkBdemZob0z2gqdx
	hLckqgOexR9U9ohRWlA6sLKHAdOXsAWTvbzDGxBS4IYU4KacqErE9Y8Gej+a7S/qES/hZtdQt8G
	KLieXLBqW1fEPMnvKCxxWXKNrYnls
X-Received: by 2002:a05:6512:2343:b0:5c1:57ba:b477 with SMTP id 2adb3069b0e04-5c170a0b1dfmr23600e87.57.1794504927588;
        Thu, 12 Nov 2026 09:35:27 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb75f7sm1783306e87.73.2026.11.12.09.35.27
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:35:27 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adfe77d336so37755181fa.1
        for <fuse-devel@lists.linux.dev>; Thu, 12 Nov 2026 09:35:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFrfOj4pfn8zpg1G9ejmMy1nTmf58dNQxOCN1UO1k7LS6TdjMxcoVqL+8m6MTQinhvqeyR238rPYLj7@lists.linux.dev
X-Received: by 2002:a17:907:3ea7:b0:c4c:e344:ece7 with SMTP id
 a640c23a62f3a-c5066afe5dbmr615605366b.10.1794504534261; Thu, 12 Nov 2026
 09:28:54 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-refcount_overflow_stable-v3-0-318625d63a98@kernel.org>
 <20261110-refcount_overflow_stable-v3-2-318625d63a98@kernel.org>
 <avW3v-oLxcHXXNQD@pedro-suse.tail5790ac.ts.net> <4ae22b7a-c160-4003-a029-8a20381d196f@kernel.org>
 <avXFlI_5fhUvFyct@pedro-suse.tail5790ac.ts.net> <42373222-8e37-4658-bebd-dd27230a1dfa@kernel.org>
In-Reply-To: <42373222-8e37-4658-bebd-dd27230a1dfa@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Nov 2026 09:28:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh995y1B461rPAcgLagg26vsyXPoe=7JKgHowB+uHJJXA@mail.gmail.com>
X-Gm-Features: AclHuK90rViBZMbITCUjh4KTAKhE7_4EYJcdTbdgYzXWPc1JsLWFSAsYMdn-r7I
Message-ID: <CAHk-=wh995y1B461rPAcgLagg26vsyXPoe=7JKgHowB+uHJJXA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] mm: limit pagecache folio refcount when splicing
 into pipes
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Pedro Falcato <pfalcato@suse.de>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Song Liu <songliubraving@fb.com>, 
	Rik van Riel <riel@surriel.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Steve Sistare <steven.sistare@oracle.com>, 
	John Hubbard <jhubbard@nvidia.com>, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	linux-arch@vger.kernel.org, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 06:31, David Hildenbrand (Arm) <david@kernel.org> wrote:
>
> On 11/12/26 15:00, Pedro Falcato wrote:
> >
> > ETOOMANYREFS I think is good, also EBUSY, EMLINK (though this would be weird)
> > or even a generic -EIO.
>
> So I used EFAULT because that's also what we currently return when
> generic_pipe_buf_get() fails through pipe_buf_get() in splice_pipe_to_pipe() and
> link_pipe().

Yes. It's not a very intuitive error code, I admit, but:

 (a) it *is* the error code we already use

 (b) it is a fairly unique error code that isn't normal (ie EINVAL etc
that can happen for multiple reasons)

 (c) this is  something that nobody should EVER EVER test for anyway

IOW, the actual error code doesn't matter. Nobody sane will ever care.
Some of them may be entirely unreachable due to resource allocation
issues. And we already use EFAULT for random historical reasons.

                Linus
