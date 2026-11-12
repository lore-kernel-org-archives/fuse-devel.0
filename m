Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503553;
	b=Uq/pZbYINxLHCu6RxFuHwjgumAtNTQBsehrrLZsYixQePPIXzfon7gK5/gfRg7paJVbj
	 ogtT14+FjIVdq+r2WzgWQYooiBMzCItICjmF5sLK51D29pIkmNUiF54yjT9JBzDEryw20
	 /nARpXg5bZpyveMBCQbYiJPzmFol7MGH6uTFeteGGzAQ/OYcGn61/pOIPgB31u1MBanhD
	 pzGr4RQ7I6x6FvPRUxto1CliRrbJRM2AZvsDniyvjQhNOoRYemonbWOG6VhNumsyY8RIq
	 vk+u2XnFFZi9AZybIG+wX89ZZcs2yhKbdAO9JJuzng9XPCWBFAtODUHAmpL5NYs6gwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=F6YTYLTty4ZhMoj9B/ri1dVEfYoUCO5Spihz/O49FOQ=;
	b=S+5/inoIIuuc44TcLEqxfepIoIO3bXntjIY9J13mvi0u9uTHVx1ISktQmBEqK08iYEgi
	 AbT4SkMpAFthroe61cq4G6Xa996nksAl4i6883/VP8hKs02MPiYQyfj1vKWXB1trPou1i
	 K39hk7w+0gOht0WUxOdXUS02zaIzJAAR1rvUTiBt4XoA/urjOKaPUz8lbnM9+nvDvLQDi
	 2e1qKJgjiJuYd5WpWAbg0e0d/mCiUF7u6Oou1XT+ElMuO/WNc1UHFNxRBB54SOloL39VX
	 l8hHi4ipPRjdxUlDfJFxeUcK1HJMg+/AqsIAyNwYGiyL5afNinn9haAtsnkfF52iWcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hmBx7hKr;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB22606A327
	for <fuse-devel@lists.linux.dev>; Thu, 12 Nov 2026 17:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB22606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hmBx7hKr
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4395d31228so622400666b.1
        for <fuse-devel@lists.linux.dev>; Thu, 12 Nov 2026 09:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794503551; x=1795108351; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6YTYLTty4ZhMoj9B/ri1dVEfYoUCO5Spihz/O49FOQ=;
        b=hmBx7hKrH9Kne4Tlk0ZpqlAx3bTsGrCHjEGrybBNsNymVRScBK2QAWMjJNztYbr+OJ
         QaCjuoa8ptJgT79d6yHohbgKEDz6xZMC0ZY+45siEd3s43rZazh2NCVt1zeyQ02ElQ1k
         8U1Uye9+tJE5P6wR28crlPOoxNp5nNqQ2emUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503551; x=1795108351;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F6YTYLTty4ZhMoj9B/ri1dVEfYoUCO5Spihz/O49FOQ=;
        b=EYNYYVOg/i89NF3SBHQ04fIyBDYNEtf+Skx21VqXlYux8YSkxblXYqlG2fW10Ze721
         +HBXzLsgHumHjCWEmBGAkckRWA00sgyHXgQRNn3dBvBSKaWtD2JxwBirqltqL/x/Rgru
         lg+eUc/5+ZNL53hZLFarQr8qKQMUJLLO3aD4fdfamuo0t5HbYVw6sifYZowqw2Rep293
         HsjhjKCh4eI1uk7XA/ESJuNF/vj3m1RDdgsH0mECiUJEMAHJ4czmNw3CCrLFb41VmTbk
         6fs1mSCW4DUKsXZiMyrjH0ALiK5xV0kA+9VE+hOftC0oo5NH2sLPLDDJxZ8nq+xf4sir
         w86g==
X-Forwarded-Encrypted: i=1; AL+hErEg4CIJylhXwaPiaXZhAEOgKG1BaIc5XVKxsNHDdS6mt11AyA/CTFje6qRG8PG8gHP/2JbC/bh7v56l@lists.linux.dev
X-Gm-Message-State: APuU4Z/iTsoZ6XSzAlbwYvUTOy0GXdsV/rJa3b0vu6Df6WllbwBDhE3m
	hEgkjIKGrV4FQjOKfWU4V3iODr8/Ud2WRs7y98NCcSMeU0g4QJUK6sxHEY+LaI5F7aWbJbEl14d
	/+PGEB1Dr6A==
X-Gm-Gg: AYBFou3YBJHfXMrSyWDjTi9jOCOCHx2cPjivOLXF1Qlj40yD/eYyB5LL2D6dO7L1jk4
	JOslf3LUvVZu72C5DxQ7E3t2Q2jlOhGbodewCccK7gbZBPx73XLc6nEgmrPWXzp1Kxm0RkeDk5X
	1oJYE8qdGmoE89ggJ0aVCWNFs+v3azFynN6xAfr5k89soqYGvysFxN4rtccYTY2H8t3wvKjtNpN
	yugmFQf7rGQjZXoOMikttCiK9hKy2xzX74dHhNZsokM9iuuwKXn2IgGKrLPYIgB8d+Bl3nLAS37
	uUT2FuZjaDKSuErAMis9sRIpuPx+63eskOSFjFtF9gOATChNF3JyHY6X/mZcAESDGxCzBAXeOJt
	MBwFbi12nB6erX34AETF+6cwheMZp0IDxSwT8fN/DwPH/0A/yi81vvCzVF4T0rlXnRi6LFcjn4E
	Q/Rl7dawnGh/Uzymc7OSEVLZHom6K01J0ECb+CnPR9VLuGrfqbMyLsPZj5TZe1U7cLlv54vxFZZ
	s82wEC+pZDM3gVkWGffcf0yTZbtHv9sYDTtVcq6inPHuJFivytS8iQACW92tTQ2/QCKv/lBfTel
	Cx8q38kRracGR48RMEUVRA8gHr2J7AYwLbrICg3ZeDcDpZIsj6/3i0R6IWSSJUBjr1VP3V3pOPQ
	Abgc=
X-Received: by 2002:a17:906:c103:b0:c43:6d40:4f84 with SMTP id a640c23a62f3a-c5066949dcfmr661922666b.4.1794503551329;
        Thu, 12 Nov 2026 09:12:31 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a63fb3fsm373731366b.61.2026.11.12.09.12.30
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:12:30 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so721298666b.3
        for <fuse-devel@lists.linux.dev>; Thu, 12 Nov 2026 09:12:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHuWMzL0GEzyA4Itqo0XtJx/I1eDFgEv4K/ktx/P3nzvVjPdz/eFiCSX4XDuR5IxELh3BSNhQGoOLqa@lists.linux.dev
X-Received: by 2002:a17:907:dab:b0:c35:babe:ab44 with SMTP id
 a640c23a62f3a-c50665538e0mr626078766b.0.1794503550222; Thu, 12 Nov 2026
 09:12:30 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110145241.536019-1-kas@kernel.org> <20261110145241.536019-2-kas@kernel.org>
 <avNuQqLf9CG9dSsE@casper.infradead.org> <20261111-heimreisen-ungeziefer-empfunden-a892571f2c07@brauner>
 <20261111-thunfisch-wirbt-waldrand-822275b2d3b1@brauner> <CAHk-=wjPY=kfgnmtx4COEQjD5UzKx9m2-=KLGAZP4d=RKEH+pg@mail.gmail.com>
 <20261111-stumpf-montag-miterleben-c4e2feac8090@brauner> <CAHk-=wjGXBnme-N+HvbzHH40ftb7Suc=kZVT5cuintQWyMHJ7Q@mail.gmail.com>
 <e94bdf7c-eae6-4f64-bf93-0aeedca1a22e@app.fastmail.com> <32ad880e-5946-4703-9c6f-43ff59da39af@kernel.org>
 <3eb60948-8fc9-4682-87c2-c113e54e7d4e@app.fastmail.com> <4d6a3d68-3fc7-446e-9f59-f61d7475e22e@kernel.org>
 <bf186643-780c-40e0-bde6-f2af90404a18@app.fastmail.com> <b90d4bcb-b865-4a41-8496-78d751c03dfb@app.fastmail.com>
In-Reply-To: <b90d4bcb-b865-4a41-8496-78d751c03dfb@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Nov 2026 09:12:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=whTG_hWYC=a2+uu_+SeN4E1ra0n=ytGqyk83Yr7tDuEJA@mail.gmail.com>
X-Gm-Features: AclHuK8_5teM8idFuSWqym8O4N3OQPYF_Y6jfMJ_yh9uCx25qjwD1XBnjE0OwRA
Message-ID: <CAHk-=whTG_hWYC=a2+uu_+SeN4E1ra0n=ytGqyk83Yr7tDuEJA@mail.gmail.com>
Subject: Re: [PATCH 1/4] virtio_console: copy pipe buffers in splice_write()
To: Arnd Bergmann <arnd@arndb.de>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>, Amit Shah <amit@kernel.org>, 
	Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, Bernd Schubert <bschubert@ddn.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	virtualization@lists.linux.dev, Netdev <netdev@vger.kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Malin Jonsson <malin.jonsson@est.tech>, Richard Weinberger <richard@nod.at>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Nishanth Menon <nm@ti.com>, Frank Li <frank.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 03:35, Arnd Bergmann <arnd@arndb.de> wrote:
>
> Posted with a somewhat shorter Cc list at
> https://lore.kernel.org/linux-arm-kernel/20261112112528.1116405-1-arnd@kernel.org/T/#t

Lovely.

I'd love to expand on this kind of early removal: anybody want to get
brownie points by just removing the remaining users of the legacy
'kmap()' interface entirely?

I don't think we actually have that many of them. Almost all users
have already been converted to 'kmap_local_page()' and friends.

If we got rid of the legacy kmap() case, I think that would get rid of
the whole "pkmap_page_table[]" mess and the PKMAP_BASE / PKMAP_END /
PKMAP_ADDR games and only use the FIXMAP area.

                   Linus
