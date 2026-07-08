Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093CF44DB69
	for <fuse-devel@lists.linux.dev>; Wed,  8 Jul 2026 18:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535398; cv=pass; b=n7i+/FE9dX6J2c2T49NqwkQFYq7iYn+ttqnxYeHrqNTcoHa2njrsBOmluOfclgW0mXKeT6mVj3ZqRwB2MXD5XcDZa4xQuWmMRQL9hNQV2nvjHPkC3Z5SlrJa6Dx2PJYNPvDPsxYKhxJeDRBVX02GS472s0II7+HGl+rlkSbw3VE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535398; c=relaxed/simple;
	bh=pQeqcIXmxeqjoaVrCDS04nFvHctcdWxWhJguSVtNa6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qqK+5ohVSqBHWdkn06rF3yEv1cpta9pUpgorBp8kAe7qMnlFf9/b8aHSJeYP3VFYLaqSZ0VskE2qghXcHJVAMID/PlJBWi2xnxsA9tzeIzk5Qw/3hGxwtKtnIqScgwuIVdA3BozdtCrzJx529qA33lO1ocyKFZvl4iuCGcrG47c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyJUuVoc; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyJUuVoc"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-476a130c138so1136580f8f.0
        for <fuse-devel@lists.linux.dev>; Wed, 08 Jul 2026 11:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783535395; cv=none;
        d=google.com; s=arc-20260327;
        b=IZvBOp4QlJhlRbHvFnPH9bKUxckOJcEZZCOOxZIR2r+Hp9SzltN13vpphhs+a7cdK1
         6bnDnn/7BaewoAg9kwpD4SNdzBDFB2wcLa+EcAj2zx0OSQReljMYpOQOHy+jn9JWROlc
         my/3Ic7DWYdnpl3KXP4QUFAnYYNBV9uJYxSwt5b9TbDcltOtqFh0FCJmv1KTL3D0UepG
         YuJ0QsHLavfAeWB1OeXvehM463AdH0igIsmrEZLGdhBeoo6l/kZSpOAPgUyUoJasllLG
         /SUWM9arUI+4iAXjFpeRIUi7Y5g33W8fOApuCFuHPVTmTMMS6p6E9zMLbjd+pSxGBYLC
         r9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pQeqcIXmxeqjoaVrCDS04nFvHctcdWxWhJguSVtNa6o=;
        fh=hmx2Eiky5yZQoKRJ5ZHe0DZE2v2moctuIF5e7vZHDqs=;
        b=aiW1s9hXRV8G9nBgFMU2u6MDtt81i+HKlzNXg0hQh4+8F5Oh1JHsdFUxtuKeFMYx02
         0dFUbWvxqiGNH4B7D6JKHtfuYlprLwD0ybWTOWVgh3nsVudIbDbPcI2hy1lp0pa78JPz
         hU8cc1N0YLla4/18QYO3LLMK4q0gFP3lcc00JPBHPNsF/9cqIl7nJR+y/r+o9ZfmXcW/
         +THIlD5ZOnm+74ODxhJacQtsg6LaEPk5spzXVe6uov9pNomgUVJZxYnn03jTEsR8lCw1
         hdu2wBcCnwJRWdXzpv2sy2qGLCSyBJkG5oeRB+Q9qxXtTT3lSYNsSUrU6Sbw0NwgIsFS
         d+4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783535395; x=1784140195; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQeqcIXmxeqjoaVrCDS04nFvHctcdWxWhJguSVtNa6o=;
        b=YyJUuVocQL0yS20AXzBADdoMRJFU8zbBdbjP4BXOZgK53BHUYrXMXJFWRWJUaiWvVR
         KGR2L/TYJyuIC49UGJy2OcJM18uowCL4SoL84nq8csWF7FmJlAX9kAtiFzxbuaw4j+y5
         8agyxnhNCHLXb2DJBcLpi/oGaww3485kUzdYmonoUsE57kHobd0yKAmwVqeKNz+k7jup
         FqW8jJSOMUipITznqlQdONiDFfK+LcbcwZ+iV3oJHVSgCuGnPMqmgDgiiURAX2uaWefe
         0QSXT1+M5cLqTapDPaj2ZZiPTgk0tePVWhzZ99I8qFplRa+2GaIUBkFrIS634iRB+Moz
         KcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535395; x=1784140195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQeqcIXmxeqjoaVrCDS04nFvHctcdWxWhJguSVtNa6o=;
        b=LQaeSqM6aY+KRznbMduxEU9YIYyoVaT5T7HNN9Jm8DECRvwbXm6b5j0ZWNEUEKheg5
         oc72+DNohEgSXK/S9uNp51zhDQokCOBPs8IVqsWCbN7KUbuwH3ocQ3rxAQ9X7oiQTW8M
         ptaZg5yyk1adq03DNGnSpjP7RdCMPAxNiokyGciGil4fYrdObRuB5gHYB4onHLqeTHgx
         WPVgM0U0XGNa/Huocz+ycjGs0ToQio83SV/TaLnbdUbbopJwILahpVab6pBiU3YE4AtL
         aI18HrWVmd86pUa2ZCcV7NAGHD07TOmTURG7YhVt/PTnR727p+LVIbJCh2JLTTyFAtSt
         b83w==
X-Forwarded-Encrypted: i=1; AHgh+RpK/vMbSIRudaKVf8Sj5oE/DJFlUXrnqIu1Pxv+k5zMtQvp8F0r6Gph2UwmevpSURAgBn7B9ogj6Jvu@lists.linux.dev
X-Gm-Message-State: AOJu0YwuSYflq4zgFGhWwzKjdwmA1bSC9taquTr9OiiWPQ7rjoHecQg/
	DnVxAxe1uWSCBg0QpyvM2MKx50qidTahAHwGEpvaIsagCNFMs9LVchGk5o5joJjsxpXcY3+TJ2Y
	pwU6w1gOR35z/uoTLguQJ8Im52IuBmFE=
X-Gm-Gg: AfdE7ckHfnJ7tKGOeEErse+p3AcDE9x/0yfLXz4J5FA6apF0CS99ZhY58rV0OLcHHRf
	texVQin/O4njo8UIREYZEvQGEGWFB9bWQcYbYJUtxnHPhgILhVCkWiwqvGETQxP4jP65dbm1qCv
	CK/jI6PdjNjRVw+ZZSQlkNEc3/EnQQRSkMPG+JXz8RxTJqtMBiqIu36yCoIrenH8VCHqkVBsxy5
	t+rojLz9D8XKOvsACxSsYHXNu4nzhRRwJLrcy4IBecwqkuDoP2QIlsYMyWrze+kjqtL9W+nkNdh
	RUN6EKacNpe9ouH861ewcr6T0uy48vsLAbmv3ATWUaoO/WJGZJPZ
X-Received: by 2002:a05:6000:4387:b0:477:80fa:f44d with SMTP id
 ffacd0b85a97d-47df0767064mr4043753f8f.40.1783535395354; Wed, 08 Jul 2026
 11:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707220450.1200943-1-joannelkoong@gmail.com>
 <20260707220450.1200943-3-joannelkoong@gmail.com> <CAJfpegv4t3GBU9efQXTWgPSEsGRRaL0OAeZeph5-84eoyRyFqA@mail.gmail.com>
In-Reply-To: <CAJfpegv4t3GBU9efQXTWgPSEsGRRaL0OAeZeph5-84eoyRyFqA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 8 Jul 2026 11:29:43 -0700
X-Gm-Features: AUfX_mx27aKltMWTZ9oFz9G-tRcUlVFiaV8_kmOpuUyW1ZdshqDZiXadYtlPtPg
Message-ID: <CAJnrk1bP8K_LVWOHwiQ_PGw_27HnO9O=XVm4L7UR4+0zvZW0Bw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] iomap: add helper to mark folio uptodate
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: brauner@kernel.org, djwong@kernel.org, hch@lst.de, willy@infradead.org, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	Zhang Yi <yi.zhang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 2:17=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> w=
rote:
>
> On Wed, 8 Jul 2026 at 00:05, Joanne Koong <joannelkoong@gmail.com> wrote:
> >
> > Add an exported helper iomap_folio_mark_uptodate() to mark a folio as
> > uptodate and update its uptodate bitmap if the folio has iomap state
> > data attached.
>
> Sashiko has a non-regression comment about this:
>
> https://sashiko.dev/#/patchset/20260707220450.1200943-1-joannelkoong%40gm=
ail.com
>
> Can you have a look, please?

I think this underflow issue was fixed by Zhang's patch in [1] that he
sent out in May but I don't think that has been merged yet. I'll
follow up on his series about the status of it.

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/20260514062955.1183976-5-yi.zhang=
@huaweicloud.com/
