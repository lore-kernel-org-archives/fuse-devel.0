Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795089430;
	b=im5YMmoazascaBGmnlhxLus34o+j7k26yR+czaMoX4wX9rHR/SMFzU1fp4x82fcpt97w
	 JUvGXZZYUywUe5lGdXvBZ2k6IV6jdhS8QU5w75hosCKoUwa1CzgeM55vpVga6u5Y9HLCf
	 EqvZDqTVHt6fIdFcsbMV03PEjqm1Lwq2/6bgBFwTn9kUUVjXhJtXJxVlBYdPQ6eOU0s0c
	 0dXC27foIM5m0mbNpx8K30TpP9dDH8oat8uFfjB3Ddh8v5mSyk3Bikm6V4aS4E1Dsqr57
	 wPbbjovh8LC6/GxxLahgQJoKC22/ixwrCeTGBUSu4HLd03KD4JC3z+Qql4ZFHFQfn7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zlJH4+t0mXQ/RY9w29YgUuQUml1Z0NJ3e214jG9j+bE=;
	b=yCfF4kzhmE7ClpeNmFpeSDxzNx0Hd49eQunYs3TAoOXkSNtP3bSrZjlRnIyInZU4zMpy
	 7TT28ps9ovxsu51MlG5pvBZDkAYRxwwUG3MImHdtSo7XxgB5ZYflXO1+VLmaD0sOvh1U/
	 vn5H/xWCnlIl5uENhSOp+CUhSj9AgR39ZesN0T8tbOPZu+eKYO//k52F6OJ47Othoyk5B
	 09cungZFelhYc9ekjz9YWz8eZvhD7bUjfqWmR6BCLfV4Pt5TOnIhnIeTOGQx1OW2bpMp5
	 fkyX9+AyLGkk5ST1djaEpEZOBZ4MFIZiRm05mmEFeS8wrA2MGuTJvMUZHwAhLzwcz/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHPbICvL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F10606A326
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 11:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50F10606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHPbICvL
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so2926777a12.0
        for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 03:57:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795089429; cv=none;
        d=google.com; s=arc-20260327;
        b=hJ8TuHF3Emd27i4cT/smXLg+budiR5VgNjisz+/1rKPZH3U2uMel3nezyZ1Gspw/vi
         FkZzE7BJ87lqJKgLEkC5/Ww0aPpzhwMR4YuxVZJ0OYr6kLaktghwkA+a4n1QkZuvCThx
         JdjGscZFKfXkdSi77UvmTPFmpq0iMwcNU24itlQF+zbkei2nv3nJ1UoiiurPk3KfaLPN
         WSYrQjpgtwYcKf6P45DbXIAJ/9KH305jbiLg7/CUqk49H4mAHkQomi5jzMoJm2mdGE+D
         m4YdjxD+wGmvpGDxCBrX9TezoT7oTIsmBcJywxC7opYB/PkfcsHBWZCTMaQXrIFxBtgz
         lwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zlJH4+t0mXQ/RY9w29YgUuQUml1Z0NJ3e214jG9j+bE=;
        fh=5GRbnWxhIzHOw3053cSJtKe4+BAZlZbaC3TEoIHGuzo=;
        b=S8PfCwFzAIeGTf2OyEd5oPGvu35R1wzMa2mNnnb3NXwzO9Q8XLR2cfMV4boY9YoW+E
         MZUz0EJ27hyTfsl46Tof5Gzs2JHOVaPtLjBH7nkTIpCRvZVkxDclw7dRyIxt0nNb7GAX
         yYdY7CFV3m8OrfiPYzDcha+UmlPKqjoFRYEXKQVMvrY/3BydgEXrv5SVyHRHyol5fgva
         pO4vG3xmPU6Iwg2uX1umaF8H72kEV38tgu6LyR4iwQhLX6NUX2pSBzTkDLu2QR/81pNY
         OI+Muur9WH5MxmvHnF9U3qv6n49oo7pnDnyxuLKKiYAo1Ksc4H8FiwMd/bNRsP8hYqLN
         AjsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089429; x=1795694229; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zlJH4+t0mXQ/RY9w29YgUuQUml1Z0NJ3e214jG9j+bE=;
        b=pHPbICvL6qsWoWddl+nobi9Srr5gSMzkBVVGnOHutYCryvDTyD5pRGbyCoB9wZAlFC
         M9XauKWp5hDCmFKbukalQ184HXu1pJsJ7pUfCa/sC2jGiQQ9euepn1+T/fuSsni6EohY
         jCDHlx1ckP0CHdYKpjbgdjYhwGwmjzDPAgCujCpUgEHr0VBRlVId/X4gmsMQCtk3QUGs
         RD0PSMczP4CRJ+HldBhAWkISvfm2QSuOCB9HcIfHhrqFuu5BIwFXoigDrx4hO9OpbP2e
         kU2+0GWk3vwDmROWnwu666NPuNouAcbzSsvFYz0TIzBJpC7eu+/ZR/OrKjcP6c7qhKrJ
         i1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089429; x=1795694229;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zlJH4+t0mXQ/RY9w29YgUuQUml1Z0NJ3e214jG9j+bE=;
        b=21vD+P2e0NFpEBHtnhBNb9Pv3g7wyaUogQgfOJikpwbLXVLVeqAPcQLeZ/GtwZdyQf
         nqz6Ze3zuwDs0/gNP5FrCW7f5/oG/bSZv4VZVvaCAPdyZis8/8c/pmoCCRbvCultk94C
         cMGyf96FJJYpiCaqfyasUOVbT23rY3/J4bVEgZm1kY6Lfc1mOzOm8cJNVGD3+mpw5bZg
         hX128uLHLlGsBoEXlkkHJwsvEMHyKzyuxsw7I7PWZwrNzyQhx04B5Tb1aDLs3ZhDtddE
         7vx5+6zKEYdb8r+R87ds+zxg7Lnfc4yTbROxz/kME2WA5Pn8C+LL0hRakEnvfMQmBAvs
         6UwQ==
X-Forwarded-Encrypted: i=1; AL+hErG0+kJeHX4zo6iwj+95NcQg5aVQMGrP0yZ2Anf9vEfxAkMwA9mpNma172OZUw+rI3CMyHhGgDA9PD42@lists.linux.dev
X-Gm-Message-State: APuU4Z+LAfh/k8LMCJWVV4AH3+UC2QqEVIHVoW+z0xKsy7sljBfvFxu8
	xPXFxt4IlcQtw0PnBojnxrgfg9afeAa6Lk7c7Oau3oJ3XOCBKnrCOE7A8PZ0HkmbMs9bsFquidQ
	kfoi/GTbPhKqWqz1WYI8FWmXsciyvLg==
X-Gm-Gg: AYBFou3lB/MN1YGd2D0ZYBjPO4JJlrFpsfYN3fiqJ4aiNbaDH9jWjkti2f3TOkfrMTl
	G7BMctqK5sNnyVkfpo5kFw2QrHuuiVghor/fEqjYmrWfcdcL2yAwUipCZaCPkRooJzsnnaccmnW
	or+yJtR1mwFxINYq0gk3J8HMiujeVnjDC0QqdQen5EeRA7R8+N2SUrrZfbc93tKNnTW4uSLCHDn
	Ex4Kchnz17eLaBKAWccZ5NR7v5uoslfahc48lVxAglO9qoJguM4mQa0xl17MrU/TkFdRKgrbmLA
	ibR889C7rVJENyNtbRT6ZyZNuZbDjw0haUiSYRfAQHd8EgQf4USnVNeYwooPeKBs6C43lIiXZnz
	Hr3ar2XntSMoZ3xuVM5u94Pp3XlQtLoKA+3Gh07YoxmkIneHy9QTB3l8FXh0u+wXx9VyC2gxwrz
	V3pUhKpdlkHnsopzmnbR1PgFhEo+iEBlFC34pJq/jGPv05ewhW32diIXPu0I3gobpKWLM=
X-Received: by 2002:a05:6402:2341:b0:6b8:50e:3bb0 with SMTP id
 4fb4d7f45d1cf-6b887f051b5mr5100854a12.43.1795089428496; Thu, 19 Nov 2026
 03:57:08 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261030014540.3065403-1-anuj1072538@gmail.com>
In-Reply-To: <20261030014540.3065403-1-anuj1072538@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Thu, 19 Nov 2026 17:26:31 +0530
X-Gm-Features: AclHuK_SZqZJTPjuQjOc7cIWYhN7F4D2sFh9VtkHTF5WSy6wsq_qeWgrWRBsOwc
Message-ID: <CACzX3At2GfpQB7eE1S2njJONChr8DmDC5poBw4pX+pAg21cscg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] dma-buf backed NVMe passthrough I/O
To: axboe@kernel.dk, asml.silence@gmail.com, kbusch@kernel.org, hch@lst.de, 
	sagi@grimberg.me, James.Bottomley@hansenpartnership.com, mkp@kernel.org, 
	bernd@bsbernd.com, joannelkoong@gmail.com, miklos@szeredi.hu
Cc: io-uring@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
	fuse-devel@lists.linux.dev, joshi.k@samsung.com, anuj20.g@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Jens,
All patches in this series carry Reviewed-by tags from Pavel or
Christoph. The series no longer cleanly applies to current for-next, so
I have rebased it and posted a v4:
https://lore.kernel.org/linux-block/20261119095615.1840522-1-anuj20.g@samsung.com/
Please LMK if you have any other comments?
