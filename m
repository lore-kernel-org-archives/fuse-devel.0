Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792531224;
	b=w3p6BpfTWfcG25e3wWk/Gi3RpE09BuWDtCna2crWjFKMBPEu64WT2PnRIdIcNuBPVF2a
	 8JHB7JSwkedd6fWjJTuRNjmn93U3fGt5WSJ1jEJXUq2VKJC+e7U+gv3O8P+HcNBzXoH4A
	 CHWHTKeO+GDVxYRwfYFGz05HpKZnEiLgy/JbBfF5IUwkiuyc2dt2wY52ZErJnfdhFqM/3
	 XKD+CpdieOhLZefCjVIUx31jf/SKtqp6zkx3oDFBEDtCDqdL1Hwxr97a1R+jZmRK0CxdD
	 WI+cW+I3+ku6K9rVFG91JOgwpMDgIVyE/XiWeObg8yueUCv8wYC6eQikHIu5NUfZ84A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792531224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=chw8LHvkOCiuA9Bl9ETjtRb0/vjR44eNojF89t5j3yU=;
	b=BMs8QvYjD3tgrqyHFufo8ByoADHgQe1rQF1SvNKusI1BszfWmLWy4UPsOLsOJQo3KQfV
	 ddEu1fl2ucjzp3Ej25c0cE8t8H4hjvxiaihnhrZtXnTPH+hRJt4gUY1vE/DaIc82Nctcp
	 E3/xv5evFiHdzX9HIakSZ1cLmcvnRGBrP8Ze44PZYKwRfgTrSyskkzx7AviGnw0A8YDrJ
	 Lt/mbTzdtSAHKRMmiOUzF7z7r7YPe3UNAxSBdmtnhVYOkrgk+k6szbEXF1Sb5MgCxj4g6
	 03lUDPHCvlOPqE9bYbq0mxBwsR9BIEMtQ7iNsluzZetJxlA0Op/65FWLD8xkihmHbng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=cZRioPXF;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F0F606A33E
	for <fuse-devel@lists.linux.dev>; Tue, 20 Oct 2026 21:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F0F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=cZRioPXF
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso509353766b.2
        for <fuse-devel@lists.linux.dev>; Tue, 20 Oct 2026 14:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792531217; x=1793136017; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=chw8LHvkOCiuA9Bl9ETjtRb0/vjR44eNojF89t5j3yU=;
        b=cZRioPXFXGKtqq1WI+RO+KirJ2iDGS0UfxLmce9uYqeAe5UOJKWm74JC70m19/qdhu
         +jgM2+eZ5PdnUQSikURvFFnge59ZMRZjhdI6IHjOSFW2rvJAVYUH4FBwN6FU1/Y3fL6w
         DPf43lZfvITpADXQOwS6byN0MLnykaSuNxNgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792531217; x=1793136017;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=chw8LHvkOCiuA9Bl9ETjtRb0/vjR44eNojF89t5j3yU=;
        b=K7WeDYF8b0/ehxskqaOTCtr3W0kFgOYKjIl1ZZvf++YV8u9dvHJARzLNPLswt+Ug+/
         2MExygmHqLgF/EJU4hVpheUPk4FlzsE1uiAvArbYhFOZT5UE90vlNAgbGjT+V6D7wXqZ
         f98s3buZJNntzMlhf4vQLszyPdCXUIIyuz7ZuZ7nl2ZJayK/BT54shR+66N3Re8hpge3
         qkscEVkr/kDUIZOKyBYFDtth7yQRibOUqZeJdZe/fLUAVnf4/OhhiKYhxjUmlfJcmEwV
         fbc+ICPMe3jfSqh6ZmbSlZm73v2u1BdpmGjL8I0MCzqCpo2DQFOwoGBLBqH+zQ4lj+L7
         JJMQ==
X-Forwarded-Encrypted: i=1; AKwUvByNzrtbyeQ03ev7DMgKBLZoBBzFX2PSTZwxWwmF2xPOev/cfPmgkXZFPeroQmZTPtLpy2SwcocTdH2j@lists.linux.dev
X-Gm-Message-State: AFq9FYIgo7JO/q2mqN6TGJLj9z+ECg7EUXgsp8PnpSuiseznWchJ5y38
	2Zl/wawpkzLfmFzlovUagl825n9QAo37FzzIKWLC6lNyArZT+xH3nJenUfxPWFbAf9/rhWoVWwZ
	U/gBqF8c5pg==
X-Gm-Gg: AYBFou0ROVJNo8Hm1GuY8b974n1DuMIBJYrW9vaRrIWnJtMB8QZf/3Vf/H1rS4ilSxW
	RcJ+dlDJ/B8TmgKSLg+ET1wYnDY5Ackwxm8NhmLxOLafqLgSlBKqxiJkRnV5MVP5LL3sHnWbt3P
	7mTKoiJ6vlLeHg5tV4qYTyY2YK2sLO5sU6xkCOCTXcrW3kE5tzmRzF5dkMXnAvf+nqEOjEuUhPk
	6O2wZAJlbTVfRbNlAnbtThI9RhiKp4s594VpwrSyAsHVgWpYUXpCRpW+aTY/M+0NP/70888tUU5
	QWkBAD5YMXMS5gHkJtIFdVIxTqtVFf9b5cyAQeX9b8Qe0mnYXvxMuo7/iP/thoSIpLTG8JMHNhL
	WlNTg3R8fGdBXs/MRQpnLZpTpG8WLQn13baE8SRJ+9V5I1d/mAI8ytMP96PTA6e4twLOCg/Arpz
	AG7P9rG9J+k2EgF82WGrDRuLQZyxlzFCl7xlHVQW/O/IeJFcpDrJcQQEluPZbUiPtnQLx9wZmRI
	ZYo7I/12CVUnrh1mpxCJIK50BMNyy17GAYDAGEroKiaMGDh
X-Received: by 2002:a17:906:9fcc:b0:c42:2d07:4c38 with SMTP id a640c23a62f3a-c467960d895mr31343966b.26.1792531217004;
        Tue, 20 Oct 2026 14:20:17 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403130703sm109898a12.24.2026.10.20.14.20.16
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 14:20:16 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so463946766b.3
        for <fuse-devel@lists.linux.dev>; Tue, 20 Oct 2026 14:20:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzHF3YuB6j9IFl4tOQTajZ3x7HT2Ksq4Rrp7b34Suwj3mYGnhie+aoJDph3Y6NhwYdnI88OruDYPHmI@lists.linux.dev
X-Received: by 2002:a17:906:99ca:b0:c3e:cb50:b7c8 with SMTP id
 a640c23a62f3a-c467959382dmr29830166b.12.1792531216713; Tue, 20 Oct 2026
 14:20:16 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019154913.1765974-1-kas@kernel.org> <20261019154913.1765974-14-kas@kernel.org>
In-Reply-To: <20261019154913.1765974-14-kas@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 20 Oct 2026 11:20:00 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjJpuLXt5BHieXV1qBE-uoWDXKugcfGgR+DiVGVZQ8RvA@mail.gmail.com>
X-Gm-Features: AclHuK9tJ1qytK1OXr-yTM9eIoQeaSqd6mgYmdK2yrKkOU8FofcfrEV39uaS5Ds
Message-ID: <CAHk-=wjJpuLXt5BHieXV1qBE-uoWDXKugcfGgR+DiVGVZQ8RvA@mail.gmail.com>
Subject: Re: [RFC PATCH 13/18] mm/filemap: store the end of a read in f_ra
 only when it changes
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jan Kara <jack@suse.cz>, Hugh Dickins <hughd@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Miklos Szeredi <miklos@szeredi.hu>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	"Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Harry Yoo <harry@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 05:50, Kiryl Shutsemau (Meta) <kas@kernel.org> wrote:
>
> filemap_read() writes the end of every read to file->f_ra.prev_pos.
> Threads that read through one open file all write that cache line, on
> every read.  The value often stays the same, as for reads that start at
> the same offset each time.

This seems silly. That "often stays the same" is only true for the
pointless benchmark, no?

I don't think it's ever true in any real load.

            Linus
