Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA7630E0E5
	for <fuse-devel@lists.linux.dev>; Mon, 22 Jun 2026 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139909; cv=pass; b=BA4zO7GOOiPDfCLMe11T6waFxpZMkLZ86KCUuf2jOU7Zrgi+/IfPfKH/LN9Q/XMLmG2BV206/ZGe8fU2MJM01/yrUTWcZMe/iXwgXG6TM//v0ZRkPVIwHsH4U4Za3b+1ha/+VGQVrwI0wcjytMz42UDTQkaUY7+f0wSVr7MkP6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139909; c=relaxed/simple;
	bh=gVbkal9XxM7heT9tHAnvOJu3bikEkIeqFY5378Ceans=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuDo0R4HOglwsMoQCmNwOihepl8PA1OPOisgAp3ouAtClsib2HfvwukHZrCQzNIST3vfvqcnSIikYedAoUBh0w1nwEFVsSIWVav7lJfHJNUvvLAAo/d0oJuIEpTO4+O0QuluWKKRBYb/7QIZQzq8FI7vUlqhvVcxCjJMfOc0So4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=hEUwzYey; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="hEUwzYey"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-519ddebce3dso37280611cf.0
        for <fuse-devel@lists.linux.dev>; Mon, 22 Jun 2026 07:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782139907; cv=none;
        d=google.com; s=arc-20240605;
        b=hxKUdkfG07At0BR1AGZNQVfEscAVIh560ZuJMhHYE5bV+7mDRsDAzKeJmAH48MJFJT
         3mg4aNHF6L8KJR3w/Fqq+e6PHfC+cwHrm4DeF/PZJXuxscozdzw+d7cswnMC7jQCix0U
         r/A4WEMv1fEc7vUiYlXaVuWaz+rJ3rPB8mqVffVam/GBhtpWdO6jpat0vjJ32vKgCeMb
         Y0AbFs+tXFnPjyVWhodYhgdTMVBLjrrhjsu+Xef6+vkgJUotnwqLhNMgBQmt56dvsyit
         l9KwoMRUGhWb4mMjtJshROMwWyZxoonJyzubhWAD6No2P94n5YTpdQu7/QAQMZYuBiB2
         xZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FIRcBeKUzgIFS2r0s3+CnH5+LXYqWTzOkLNGyJcAnus=;
        fh=cPhArQ82iwxjhfxZIuSQAkhGFT6H0FDmYMeKt+E8Cww=;
        b=FcYQpi3JjnHW9GuVpCPzRViH2BaqPQ4vxiWVLHQgssAYJb+7B2kELPaTID3tBTDXyD
         H6FfWIVLfJLFJ2ed5cyOLpeStR6s8JFIx3ExfcRhhMriXhd1ZzSEUG731h5iLUVlAzHu
         AVhmtWJTxiqF03R3bjxbkt2thnFHQtmcFUjHy1kawEQWmmyTHzkIxDERrmBPJfIpApmC
         kj1gqiqnxLA8ka/0fJy6rxysKDdJ7k/q6+GJg/kkm1AXyscUDB+z8Fm4UxF17r7TtLtu
         c8+HOEoy263j3nUphZxvN1YLRm8lp1NEW72BVp8GY2ZwDqiwDxyQFnIH/IMa0Ih+QSL3
         TEpA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1782139907; x=1782744707; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FIRcBeKUzgIFS2r0s3+CnH5+LXYqWTzOkLNGyJcAnus=;
        b=hEUwzYeyAj+vRVSpr18lMmHdiwXCbdKRQLsswVDwWslZpANXiRLKeN0fzY1J8xn579
         zIHMq5uM552sxWA+QnGPwaUTnLsXUoIKGxwMKQDhF2KMCDc+pWqOembNWYCOkAh0qfam
         JX887YOuGULtB694m0dh3+Ec8JbL7NjZT03/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139907; x=1782744707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIRcBeKUzgIFS2r0s3+CnH5+LXYqWTzOkLNGyJcAnus=;
        b=BJ2uvaWV1wvD4Xewg/21NI+TJpAn5j84N63HGgwP3Wzq4QNLGK3X3MYah2TXSZlvWy
         DJTGI3P3wCeD4VWpfd/5EvumsSb/Qw6S9wBVd9fDzSLPJ3LL8tGKZNjMa1EFppO2QvE7
         oQuQRTaBOilljOovnVeBPzATOghikKgJNF5097r2Qk5DTrddrC864iKcDnQ9axWnTn1q
         g3ohHeAz6CFWTbBwq6W5376ElDJslONrZWqI85LfgZ568czKbs514wHe2t/agCaDwlDb
         8ewQwPuKrXpXmE9pwqfs3V48CAEm5G+QASc17XzSI1vweh0t5zmItm7fxYy4PXforNo8
         Z+eQ==
X-Forwarded-Encrypted: i=1; AFNElJ+CNY/maNW+UIXT0vMvlQ0HU6nv8BzrsN3x6HGDvnpA3CTEVSKoFxIcx5QF+RlBpvZq82g9g7Lak3Bj@lists.linux.dev
X-Gm-Message-State: AOJu0YzweLYCW9rDaR9Uixan4TGCdRiGikgtj3oRgnEROAVvTDT9AXPI
	C32r26i3ACcwRaQ8T4KAIGdv/02YNgX6eHoATZCZmtq7WjZTJ8S0tWx2LUIuKF9dVC2Xw5sad9s
	sAJm19YiyobFv3rORgBgIEV7PS5KPEjIhy/njBa3chQ==
X-Gm-Gg: AfdE7cmzgy/SSJKr690E/0ZtsLunudWLVuU+1D8GRg4mdXoZcnV0SM0vFQeUn/2tF61
	bRzd9EawjY2FKDByazSE121kqAZqEdfFhuwd1KkAKWJYk6d1/i5rqF0ZoNXzXR+BkUlsEcWRkWF
	uj8HhyL4Uv+27MDNw2VKkyQ7d8Jf4Tz4BJsDin3a7qUY08xEDnkUP5PwGOVgJURtoVFjcnZmbxv
	OEnekqPUHDg/vCYvIXVOvPw3r3F4z/BAEJeyTZ1RIHMjFS1fkCbmlXJ0FC5OXtG8I6uoiy1keLi
	wZYrlTqhrF1+8p8PxU88u+BR
X-Received: by 2002:a05:622a:607:b0:517:6f47:599c with SMTP id
 d75a77b69052e-519e4a55947mr220299571cf.20.1782139906703; Mon, 22 Jun 2026
 07:51:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <a8aa3a49-7491-4085-80f2-19f89da00489@bsbernd.com>
In-Reply-To: <a8aa3a49-7491-4085-80f2-19f89da00489@bsbernd.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 22 Jun 2026 16:51:34 +0200
X-Gm-Features: AVVi8Cdxv7sCbT4BNSPA1KwJvWytoZqd0p-OJfO1crF6eHFEiBG_yqyB8O0gBng
Message-ID: <CAJfpegtQSr9jp-3Qzkpr2UP06SvvJ2OZmcqLWWck0cV=htYpOQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 May 2026 at 19:58, Bernd Schubert <bernd@bsbernd.com> wrote:

> > +#define ADD_IN_ARG_ZERO(args) \
> > +     ADD_IN_ARG(args, 0, NULL)

> could we avoid that? If we don't want to change existing op codes, could
> we avoid it at least for any new op code?

Good point.

What we really want is fixed size headers, and what better time to do
that with fusex.

Do you see any issue with just taking the 128 + 128 bytes that
fuse-uring is using and padding the headers with zeroes?

fuse_setstatx_in goes over the limit, but we can just move the statx
part to the payload.

Thanks,
Miklos
