Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242509;
	b=moBobjwOB0TRTP1HWcekdO3gPFNv55sA3L+9PGSjONgw+HEFnkOj6m8qV3C9pIw6alwP
	 mSPzB3oqg3eY4MSmh+SgGxGgBvC1149izelNA7gOkWF8mH0aTqsqrN1GcFzgfd9vl+tQW
	 4o2RQ6zdalaUG3k+uNUVf8fKIzWGXPWYKdramfJ6z9p/0Qu0x3ZAk/TolWXvOGqMgbjSg
	 NE+1snjIPHMKCHX/5kM7LMpN/XXcX2qfsGBlUJeOYMb0DjOm9jUwe6WTh+4vfchhUZ07M
	 XcstpbHM1hMCF8Bp2EK7opxNROnaPd1s8MNsy/6aCDaFZ2Md6aZohvJqU+9H4MeCVsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hck20NyvBqj3Ac8MLVTjPeq6/3Z/Gw267omoUWkMKcU=;
	b=VOzu7iDYt0rJc4rxWgUi9BTTMTqEQYJ6z4E9lXrOa8mwmVQUJVzwKLel76su2t3hiN9Z
	 ZOa1E+yHD6cJ7JumK/8ij2LDpgT5iRPUt7gsak79NOoUSP+9FwRMbb05YUYKQLzicgToT
	 fK1nnPQ+YBCEMhLIKNnFPvM4bk+GmGV1rx0ZQgD9yWcQ+1PsFhrwIxb5p+vDMLDeZQkWW
	 x9B6TjP+DNF4DW1oJGjjtnfxRihpLUoEUCPCNt1EegNaSwhUFn4KZx7i2HFGD07p2iYAM
	 S5L3UODuXOWgzJibXElcKms1Xa2Wp+tu1yyFXY+t8xNZDVik2jQvMSCMC1mT+4Y1Y4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=UzyEUvty;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC728606A31C
	for <fuse-devel@lists.linux.dev>; Mon,  9 Nov 2026 16:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC728606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=UzyEUvty
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab53a99771so9102501fa.3
        for <fuse-devel@lists.linux.dev>; Mon, 09 Nov 2026 08:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794242507; x=1794847307; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hck20NyvBqj3Ac8MLVTjPeq6/3Z/Gw267omoUWkMKcU=;
        b=UzyEUvtyYBQ5YIegDQ2CvrI8U7yq1qenrz5fqkkDLt7qfKq/NtUgwwowyQXh6ea0PN
         NXELL0t+Xsj4M3nJQCRzfNm7tvDbzd4ALQTJnQGOk3YfnVxzlSF7PYeeAngtVDExTU7y
         RXuvPNyS9ICdRlTgWlQaCR3k8GAI+4PlyZJv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242507; x=1794847307;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hck20NyvBqj3Ac8MLVTjPeq6/3Z/Gw267omoUWkMKcU=;
        b=sZCMMwF+GPAM46Oaia0p5991ICt+wg3JMobDcNWOZqOL5IkVOVxysJy4FYH3RJ0StW
         THENuBjFSa4dj/+Lne6mDOIpOjnWkjSH8h7prFp5iQQFqFCFjpz2FjUdb08QQSRaT9aB
         JUJE73+iLmp3YWlG+SI4D3Wc7YazUUGlrbZVgKmQoPdXmGxUh+ddZXA78kmLrkKhAEEm
         y2+K9DnWcnYOgLuf3xhQupFGkmCx0hj4ohLhwohPLWrzSy9jqRmM2hEFPDETf5CRwcxR
         BmoqDLLtHrL6MTs675r0lSWEC6c+ZyqhbMluc1ZFmNqKkReiXm9pf029IQYiW/sJsmrl
         n9ng==
X-Forwarded-Encrypted: i=1; AL+hErE+aw8lI9ivQCi6DNCBPe49pTwLLVBhUjnKENbVbi2EX80BPYJwnVhzYnrnipioGDwyvdM75EhbquWc@lists.linux.dev
X-Gm-Message-State: APuU4Z9OjFwLJLazsRVg9QFZlibvcQRLML6CBjdGzNIiVi/OrXx8RqKs
	2roEtIu94PKEM4IwBwNKoudWGS0HgSl+M6WkRNwB5gTkalbPczX4PDUNb2ecZftLi+GuBtrgqYx
	xZm8XB7M9hg==
X-Gm-Gg: AYBFou1lQZRW8DkB1fjoxH+4/Ye889xtKFzuy0rS3Ygbq2NP4x/Do3jzNA34ls/quk3
	CjzMDsf2KnAH9hnuEKlaXE7L3RI3aN8FcO4lR71qm5ODor65zYhsNDmRSKbxtSI0r6gbRSOC0zy
	mZgo0+/Ls5TWlLR4KalclaR0Lh0iozAp4bMGpir4hASsKniYXImBWehhwJJaKXmqWANzx97sOkd
	cjghUlxauZ3znw/qm5geXI8ZMfBCcJBSli8J7WP6C3vBwHzZwUmIp+VmOAn6CTjFPV0YVW3N8Rj
	aC+b0Rvai2SUKk3GHf9uS8n/GaL3iAd2RxPZVTYUmQHdf1Ll6HAoR7WTc9ydcg2zpWJi2Eo172A
	3D33UdzUUZNZF7fRImeKkyhB/IWwchrt7DnvlG8papULTeYZXf1OE9I0y9FaRQzkk2M6pTdxIo6
	T3z3kaJOwNQp2M5wtesbvpXWRYelddMOnmiiefUasGkAOKasc4F1QA43+YJalHwR92EwlOm2/h/
	h/WJfeMIJJBO47uuWDyCwKIOR/U0WsdjStQdIfbFkUKIbrBYkOcs4phvlWxgXFvm3jXHq7rygoZ
	ALIfxEWa5RjsZrBNqJIBjdKfi5bNy/0k316SWxTZ1IzuNC/GK+Z0QvsYi8J+8suFRaIjTaYWfOV
	inw==
X-Received: by 2002:a05:651c:3250:b0:3ac:de90:bf4d with SMTP id 38308e7fff4ca-3adfa454290mr8027731fa.15.1794242506752;
        Mon, 09 Nov 2026 08:41:46 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3adf9e3e490sm8958111fa.33.2026.11.09.08.41.46
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:41:46 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c146cf35ceso1030927e87.3
        for <fuse-devel@lists.linux.dev>; Mon, 09 Nov 2026 08:41:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE5GS7XWJOP10Qut7rxJarD3wBG7L5ijj/TQWW0sNlJmwPY21nb+jOs3Qj9UqYBc38WDqcQMDTf00yV@lists.linux.dev
X-Received: by 2002:a17:907:9303:b0:c41:a5da:1511 with SMTP id
 a640c23a62f3a-c4d6d58b94dmr324648266b.25.1794242121304; Mon, 09 Nov 2026
 08:35:21 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104130118.2507513-1-kas@kernel.org> <20261104130118.2507513-4-kas@kernel.org>
 <f21433af-afc6-4a8f-8d2d-3a377cd3bd6e@kernel.org> <CAHk-=whn=xc9J3qApHWRGTaBpwVRtGbvJ0LURGF=dqC9B3swUw@mail.gmail.com>
In-Reply-To: <CAHk-=whn=xc9J3qApHWRGTaBpwVRtGbvJ0LURGF=dqC9B3swUw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 08:35:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=whhp=Q8qR+wPoM9+mxYPQ_OXMOEoKmT7J0JZikFZusuqw@mail.gmail.com>
X-Gm-Features: AclHuK9Zg1YgOX8tZrGKznWYWBoZxGMj9dsb1Z1k4ney-3EhDZHB_lO5ezPS7Ak
Message-ID: <CAHk-=whhp=Q8qR+wPoM9+mxYPQ_OXMOEoKmT7J0JZikFZusuqw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/18] fuse: don't move a folio with PG_rcu_free
 into a fuse file
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jan Kara <jack@suse.cz>, Hugh Dickins <hughd@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Harry Yoo <harry@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 08:28, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 9 Nov 2026 at 06:46, David Hildenbrand (Arm) <david@kernel.org> wrote:
> >
> > Could we get rid of fuse_try_move_folio() entirely?
>
> Please. That would be great.

.. and in a similar vein, we should get rid of splice doing the same entirely.

Kirly's patch to just remove page_cache_pipe_buf_try_steal() entirely
(ok, it was originally mine, but Kiryl took ownership of that series:
"Tag, you're it") is worth doing, but I think worth doubling down on.
I think we sh ould just get rid of 'try_steal' entirely. I don't think
anybody really uses it. I think it exists in fuse and in the virtio
console, and neither is worth it.

Removing pipe_buf_try_steal() would basically remove all of
fuse_try_move_folio().

Conversely, removing fuse_try_move_folio() would make
pipe_buf_try_steal() even less useful than it is now.

Just remove them both. Good riddance.

                 Linus
