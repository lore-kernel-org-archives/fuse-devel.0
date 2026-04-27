Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038831AA1D2
	for <fuse-devel@lists.linux.dev>; Mon, 27 Apr 2026 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289500; cv=pass; b=HUrTLEiwIezhpdH/NJRaCmxPEscATiRFaTWyXy5vOGSeumO4IvXXGbsLM+KG2rXkW68i+8c3jQH1Gu1x/Jji8sqQSaJxLUDX34+Ma14cU2xK2XS/URreNRzaYnmC/XOGoxbfLxpnjg8cq/aZxQ/82kUFtmJr0eCf2xxsaXWMBsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289500; c=relaxed/simple;
	bh=pqZSTIBtVaiqlDTi8evY4BHveXRMVmcBtBJmpRyhw1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLv5gNA5dwUmf6LS2QZi4uC33Ra520FeavwN+IwXF1IB/5fxxPmrFtJN0m+cIdGbV/XRKhFL+6NOFK1dSQrp6STqiwgNqbaFF4NpvHZvO9n3vWtuolS8GJ/KBe1p1enx+h/vWBlq1kBOpk4UsyK6AAzuW+p42pDrqxgtfnQU43Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlW5DfNf; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlW5DfNf"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so6568318f8f.0
        for <fuse-devel@lists.linux.dev>; Mon, 27 Apr 2026 04:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777289497; cv=none;
        d=google.com; s=arc-20240605;
        b=aKvQ8otOCmQt2lm57gfRiIC/3VAohq+StR0GLiS+9u24ZwOhO+od+XXijqomtpMbm/
         ufQUe62pwr1fKZb3Hm3oRXwX9/yl2ewcd2MJhq6gdf0rnO9o6/Xiopmknng07YZp7ygM
         rN/UD3rvWFj+gkEPHw1193Ifu0oz9fodzw5BcktRpuomAhwNQfpz2kA3S6RPXUhJPZmB
         SXjLHumwWVZSUF8WpNm9qCtPcdd8OCl3V+o2NRNN3SzsbvDNGWPMST5t4cPenFo1TQj4
         VIdf+VxPDPZ+qnzz2+wch5xkpzz6uXPpqHLS4jzHfJT1fGrwfH4wq/iG1LLzprgxgIqB
         zpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pqZSTIBtVaiqlDTi8evY4BHveXRMVmcBtBJmpRyhw1Q=;
        fh=nYCiFWHdDnDP+dvbYQ5wiv3ERox/B5Hu6b5duWukxyQ=;
        b=kc8jLPwLcbC+4SFSTBfOgnFLSQtZQBcFnTQDPg0Hq/NNFVxRaHOuj74iUl8nrKF4Ps
         WRsNJbmO6jFbSOu31vkQHu83q9fRvQ0QOOBEiRie6MHPA+3f5+atOJ0aou/h5bRLGpt0
         6SUvuYhFWBR6SQ2SL7aZToOqeh4VGCO3vIwh7jjeF49Akm4vMIrckHIeMU+3wQUgirZW
         XjU219E79MFdMJiqnTd6JOzrkdtFljWJcmgAmVyf6yNkI7hpfZjcNFsI+vMCw56u8XLR
         RZ5AXCVCLNZEVrBS7MAtGtv4M3vN9CBrg7SvgaH6HlCUZppUL1LtFrZAVu91xfF2GQxk
         jiOw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777289497; x=1777894297; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqZSTIBtVaiqlDTi8evY4BHveXRMVmcBtBJmpRyhw1Q=;
        b=WlW5DfNfOV9asKZu9M4ANDXzKeyKEf60aq99lv2zVOM0LGf6vMQ1Z8r9ehIMagEMtj
         V6V2DkZkZAGRTkue8PC3hxW4YpeDBBAS9skkAgEX5ZDAazKp1snDBc491H6ZDbWXGeb9
         xQZthbRu0kZOkabEaDcEd+G8Kpwmvmw320Syz+gD0I90jY8SJbr1rKy53Ry7s+T3AXBV
         JcMxrmcrUCRBeqjczGStdH93WQ+HyMCtmo515YxoHonTOwX1AktdSgdNnkMqylq/2F4T
         vq8vSzX0DO3EBoVHxaaRnw3eJWJqdAa6wozhyPKCJp0UOlz45tqvx+xuydz09Je15E+D
         d4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777289497; x=1777894297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pqZSTIBtVaiqlDTi8evY4BHveXRMVmcBtBJmpRyhw1Q=;
        b=gQRkNjjXH7x5vWp1txl+0Bdj4eXJ0bpyB+RBckpAhlw5weBe5kdvyZT6CrDumeBMC2
         3n+t5gIdkqCRF6Kq1FUqVzWoHZLHL0HyD9Ko5FqVjomWkqmIpeYLT3DMrrFDh7JyO31v
         p5UL4tELmrCSwlUJRmucUKMiPWpRhy1Zt17Efhj/1jHKTQU7axJUqnmtUYuL+MM3OhXN
         h0XMJmvRUEQbTD/lokh5eFw0Yzu1NzQVOhqTODy+ofMqhBUmyO/N+81eYcu+vcHrLsEm
         3Bjlp3bmxPn3bbqMtMn3tfBfGyI23f+x6BAosc3j+JGvWL7ejCLlAu4yXkrm7DkDqJRw
         fRFw==
X-Forwarded-Encrypted: i=1; AFNElJ+QyIgLshetPogJt6eWsUKG+Hxqrd8VMO6fhqpk6qPWL0wgcwg5db1Z9qufpFSrINV5FmYcWJ7gLDJO@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8N0JhvXGr6kpZjfs/wXTlBJCWUBBshUcOmDa016h6Q0nnEgvx
	HpxggOi0pO3A59ug2aKumIsDF4Vd7RvZaWUQTiqNLHZIUjC3fXv0YUSJzK3/EIQaTBXg4r7RME8
	xbgFJG9Xhn/Y+lmZXsJS2CjOTeZhFJqA=
X-Gm-Gg: AeBDievbyhb3gjAv2eBuUvrUXbiEuy/xoddlB7LiR7JqXfTksl4wuz+PbJSoO20sBTM
	V1zJAMlGo/HgpMTjCWw/+BttbSPA1h4ltoWDvncPzXhDInleXqlVJ5ZJaVVwDCuKE7c3MWzgur5
	O38euX6ZJBVrw01dH5459ft/KargbE9pjX5xahqq4anv9aapuaf7J1CLz0vVcg23c2lw1TQFMuG
	ttNtiHvH9tK37HArJy9xBaBI+wSmuTKKpoGzofxkxuEscPdLbTH6HUv7zBolgiK9JZCaeBWbKKm
	jMZiYhEzngNYFI3MDHsJHJ20iaFE4pF+Gw==
X-Received: by 2002:a05:6000:40dc:b0:43d:7b7b:ab77 with SMTP id
 ffacd0b85a97d-43fe3dcbbeamr62105257f8f.11.1777289497130; Mon, 27 Apr 2026
 04:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403035752.20206-1-liwang@kylinos.cn> <20260423110954.2676-1-liwang@kylinos.cn>
 <CAJnrk1Zb=+syR_aOLVs4aXMTOUO7BRBi=MU-20xQOcDpf2iQ5g@mail.gmail.com>
 <1a25fd7d-f122-42b0-91e2-487235263af5@bsbernd.com> <25e00efd-c0ef-446e-a246-6eebd7a68c9d@kylinos.cn>
In-Reply-To: <25e00efd-c0ef-446e-a246-6eebd7a68c9d@kylinos.cn>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 27 Apr 2026 12:31:23 +0100
X-Gm-Features: AVHnY4IK9HKRRHKJtVDrDvM515G186X8IuI74vIgHFkXWMOsK9Hjm-mK_8n-8Xo
Message-ID: <CAJnrk1ZyucU4LMn6UFDAJpmpUJzhzroLTvJnA-hL5SHR5zedMw@mail.gmail.com>
Subject: Re: [PATCH v3] fuse: optional FORGET delivery over io_uring
To: Li Wang <liwang@kylinos.cn>
Cc: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 10:56=E2=80=AFAM Li Wang <liwang@kylinos.cn> wrote:
>
> Hi Bernd and Joanne,
>
> On 26/04/2026 23:48, Bernd Schubert wrote:
> >
> Furthermore, in the current implementation, forget and I/O requests are
> dispatched through different paths and handled by different sets of threa=
ds.
> This means we cannot guarantee their original priority order upon recepti=
on,

I don't think ordering matters. forgets are inherently asynchronous
and there's no correctness dependency on a forget arriving before or
after a read/write request. In the /dev/fuse path ordering isn't
preserved either (eg the order they're queued by the kernel is not the
order they're delivered to userspace).

Thanks,
Joanne
