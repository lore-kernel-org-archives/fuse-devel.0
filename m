Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793378381;
	b=CU4lAu0AOnLsZjOuB8sVvx7wXQgW2H+WsTiJtWA8VjvScyJhsB/XKpBrdLUj076F9Hll
	 AU6ZBmPzsHlNqQi/EAYzXJ0RAxLaFs/5gtvyQF0P8XNuFgq+PVFgLDOAunTlHATIOTd5O
	 1xFGS49BQYU03bcb/GynH4KIOHLypRpodeWkvemA7WUlkBZW175ayeKWPJqaTOkP/HOSi
	 +AitX1FpxQ60sjbBudrnAfQlsXfDdxb2mQjiCN2T1+deico5Je22rvW8TAXPNcGcBi4UW
	 YX6uXRg+P9RzBweLP/82OTehZSRWa4OQn1SFns8yzK3+u9/9tGhrgUFP7zB8duHqtnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TWpmoglNNYuDlCOTuSHbBzWYueHAKmvGBxsoKFgY+LI=;
	b=fQq3tWP4ThqdBGg+pus5c9IEAIiLDpiAfaIQXmnf0F7WPkwOG6TaiEdiiAZFbI4R5Hb9
	 Npc/YRtnIRmJwqrsMKCDQd6ygYYUICE0dijr041EeQ31yf4GHttYa/ne9lP51xnR1wAIC
	 UE4TTWW51cWNv8PTI3e9NK1lROzAAiLpcsML5VVFvtirm2xF7qeWnN9MJ1D5GZ9r/B4eT
	 9OgWUlp32ltJFipNdnmaey3fwnhX3CV7ayys79umgj2qKRMvqZ3YwkXHX4GC4LtT4mOO1
	 8lDN9P/dnccSF77gdM25jkoqfg41enq6lV3+vBy9TDx4BMOdOmqLCIq2/CtdJ4QaAmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="N8p79/v+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6FA606A31A
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 16:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB6FA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N8p79/v+
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9ae391a05so7181455ad.1
        for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 09:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793378380; cv=none;
        d=google.com; s=arc-20260327;
        b=CeqgCBKpUKwDSgLOnI+4WxyVHwfYppf+CEu1LujDJcgPX+ZwBxd3YKAtWPGsn+V/Z3
         DHeBzsuKEOuGjFImEwz7/jUEYH7JfvBcLCouEqmjo8plke3XBkxi7+zWjNJWmvBatQNm
         OA8voCAt90nLStfR5UtuutaZ+agejsHsOs/kIxLSFurjYPMYvWfEss+jaiEH3ZyETRZI
         jzl4ULaY34HF/+1jnPKuaFBL9Xl3cXMtxvuLB/SfQdelOCB1WBHrLIumWP0+DkBYgcdt
         W91djAMnEC8ZStkosyKXpHzsCG4rYfX8ubLavhrEf3y++FwZrGM3/1GC2m4ptumqEWvG
         NIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TWpmoglNNYuDlCOTuSHbBzWYueHAKmvGBxsoKFgY+LI=;
        fh=lzOcASzbgkfMGvujavUCGNlIkydNxlYiy+7utsW2/QI=;
        b=S+kp6V6UhIt2WRqOqNYRX7TCFteWdEmH8nRXfm30SXZJvTodIS4SIfQbegXwv/CnoA
         /UvEo8PPREQHeV1J1fCuliUuWIRjBinCnnmQXMYPaf7QbX5vX9QUxjgbMIHBrUz6TZj/
         B/9v2mBi40s+uKSVF/UUrtQoYmubH9PWwy78SlmespQ01e0LlTMJ2I9SVMMlJk8wcPet
         LmzCttsYfJL2YGgpxLv7Kiu9Hn6h1sDRreD6BD0Ry1QR9NphWG2f55r8yjtzFxccNwwG
         DsQgHlzps5JNUzIvZfHCTDB7zPlYCUexHK0piu4clpZaOUTo/Ox6WZOUH6QUfedhgxhe
         B+HA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793378380; x=1793983180; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TWpmoglNNYuDlCOTuSHbBzWYueHAKmvGBxsoKFgY+LI=;
        b=N8p79/v+Z46yLFca3h7ShvgwHxCPC5T0RgckEMfYSmFb9DAVMSg6178jj7DX0c16v+
         ki/mwadAdiAnJvp1yBFtPC8YWgVnInQwNb2AhSrWIf6R/Yd3+h62rHd2VpYMtBOGmhir
         8EtOwXxWN/qcQDtYTck34ZdN0yEzm91+v4lwfqY5K1q2r8zfAKm58SV7gs/pA3rzAUr6
         kQzLWg99cA7lX6exZjgxbV+zeofaxnRCy4WomjD2AmttXx4Fv4gPiiwYC0eG1/TvOh7q
         iDNF3CY/dJvSPxmmvplAYT8gasQgEWQOwGI2HP+7s0gjW+OyvzpCMUbhgwx7lOHS1WEU
         2vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378380; x=1793983180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWpmoglNNYuDlCOTuSHbBzWYueHAKmvGBxsoKFgY+LI=;
        b=co45qhPTDNbgaLYOhqfnQWnfp1ZSBhtn7hCvSX2csIogZQADEU5gHLuTP5mBPJCIge
         oqgkU9G9/Qzbpz3+op7KBcDZFS6FRemfVCoaaBnMdwQS/P9jz5x1r0+Rck3LuuHO0q8J
         sAZvnmYquh+i1eHOi1k6l5FpPytyXou6SyZ/FzDoNBujjnz093XHHGpVGyccFEVwiqND
         KASxnmCRPmgcY3spc6lmx7NI3AyBU2YRt/199x0B1zPLsUCulrDQw3FV7cXBWT61IAxN
         qKgUQSO4yEe+Op9mWe4ruZ831QIY+VmujUZ89p2fnRbpFHpksX8cD3myqyhWLkB19kYu
         NLng==
X-Forwarded-Encrypted: i=1; AKwUvBxp+p7J2cCSnfiuQccA0wLCq200h0MUUg2srv1QBDHglq3+Zl59Q2iHA6zcuoMmNMLkag3keDhSZfDP@lists.linux.dev
X-Gm-Message-State: AFq9FYJUCxV7HXOTQXl3CgGLU0XcZFXvJRcGVIK+enHSUoGjHr9zXzJ2
	54vUHxkonWLj46Kw6wCTzrWKV3ec6GdFKfyt1hCNc2JA+FGF5zr6JBLJ1LkP2v+tu+YeWgl7OWP
	myJdCCQXD0wVkLhjYxlW5QnbumKJHN+6I87+oXlQ=
X-Gm-Gg: AYBFou3ay59vcP/0L4cZeuUXq+zlsKHWmWXTC0a+8DyH0p7v0ntXKuyiB5klBnwq9nU
	sNQEOWvxinKkZVtfn4wZgN9bzYLFqo6tgWfjdsX1L2P6oVlLU1ot2DHK8L5rsUiXp3dUgdfBjoc
	yv3ciV+qFPUzPDOyggWMYLs9h7sq6kKalBV0dwvHMvKhYNvCtcxJKws3CNWPa8+Vab5SVlqQwOj
	mRLmGwk/vbl8t49ogRMN6s3/rXxXIVq9/MSv5d5Yx4cDvvz/ZvlofIJT8/6DewzaN9moMlXXQte
	FmRhjJl7qLonp5bXnsbhCJFbpx6eJYLJvK0KUOQQo+qekPwiSo9b+34JXv60LX412XuTFbgpuGx
	4g3/iqtjHDTSavq1YxDURlUevVW6/BE/0cgI6arONFpZwT235L1Zeo8kL96QFkaKDyejF1hSybd
	3TPFwsLuGQ/n42jTKCxpKE/MM0Zg==
X-Received: by 2002:a17:903:1a4e:b0:2df:9e44:32f1 with SMTP id
 d9443c01a7336-2eb364e1741mr21564155ad.29.1793378380191; Fri, 30 Oct 2026
 09:39:40 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028091215.914885-1-hanwenn@gmail.com> <20261028091215.914885-4-hanwenn@gmail.com>
 <CAOQ4uxifRX0mnMXXCwVEy57_ecqjEHF6w7pE9sqvMr341ixCxg@mail.gmail.com>
In-Reply-To: <CAOQ4uxifRX0mnMXXCwVEy57_ecqjEHF6w7pE9sqvMr341ixCxg@mail.gmail.com>
From: Han-Wen Nienhuys <hanwenn@gmail.com>
Date: Fri, 30 Oct 2026 17:39:28 +0100
X-Gm-Features: AclHuK-tGCP7OgSteu5k8qpOS6sQadGzOj7G4apzWH3Bul5JVqhoUvT74oybD3M
Message-ID: <CAOw_e7b5T=9hyEYLQAY=2ybkZx1UA85_FGzfK7R03GYhZgYbyg@mail.gmail.com>
Subject: Re: [PATCH 3/7] fuse: fill the negative lookup cache from complete
 READDIRPLUS passes
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thanks for your review!

On Fri, Oct 30, 2026 at 4:04=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
> > Names are collected per struct fuse_file, as hashes in a temporary
> > array, since their number is only known at EOF. The collection is
>
> Since the server is communicating TTL in "." entry, how about letting it
> communicate the expected collection size in st_size or st_blocks of direc=
tory?
>
> This is generally what directory size means and many filesystems
> can have this number ready to publish without a full readdir.
> Not sure if the contract of FOPEN_COMPLETE_DIR should include this or not=
.

We could add this, but I think we'd have to do something sensible if
the size isn't set, so it doesn't save complexity. The memory savings
are transient (while the dir is open) and not that large (54 bits per
entry). Also, what happens if the server sets the size incorrectly
(ie. too small)? Do we just accept filling a bloom filter that is
useless? How would the server know they made a mistake?

altogether, I think we'd better size the filter automatically.

--=20
Han-Wen Nienhuys - hanwenn@gmail.com - http://www.xs4all.nl/~hanwen
