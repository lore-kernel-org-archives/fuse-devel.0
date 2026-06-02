Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C6F2F7EE8
	for <fuse-devel@lists.linux.dev>; Tue,  2 Jun 2026 17:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780422567; cv=pass; b=fl620ZyUJ796OyzJZET6hUwHbQTSu5yM7e9Y1W01YdIP0aXAKJ3kKQnafyDKw6mGDBhFE57XWW2ZaG9D97eZVW/0SR5KoB/krdYr0rHvB0uN2uY7OXv8q0df9ZwIH1zBSYygEGQuTlYQOLVvxJcbeqaS5xBAGNNQDVObriL9APU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780422567; c=relaxed/simple;
	bh=LadHw0WzIR4vuudfEkGh8MoaNVJeATBorI86UtDDqT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqZR971zskORNkCU28Pqw0DQoVvHuvXWAd86pKu6+WkAh8u7L4HR+NahqMiak79Kg0XlicY8B/u9SfyUw0pNumTff0hPzcjePmbFJ1c836pUuojHDHnilUAL293slLHObAayeGu8GXusiToZUEtqWavTgXoddJ4ffijdD7+79yU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXnLuhWH; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXnLuhWH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso18675045e9.1
        for <fuse-devel@lists.linux.dev>; Tue, 02 Jun 2026 10:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780422565; cv=none;
        d=google.com; s=arc-20240605;
        b=ClA1c7SPXfFfBghD3TataS5P7NWa1bTNlCxzWf6qjEqaqBkF7MrzVB7im02txAuBZg
         6wVfjoOrKk+krW4igjVD3EnBM40XfTbS3M22w2T4MY+FF6/j/ngBwI8xGpaYVAFvAE9q
         RtgIJMph2a7SUhxpvYpg+nJQ8BvrjW1yvt1/A9yh4JgNBEV4kCqwvChllLYamoVfB1cw
         /8vAwfHOYcDTPogV/31XH3JMSuFbeZZPRgdMi6tBHWBnkdGPUfIihqYdJ6H5ZNStbFLD
         im8W0qsi8LedqHEsZ1jB522/iJfgP8s1igrzzK/ZdeQ0IPNxG5FZSJDZIHNLeEJGB46r
         ZSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tueJPMHLma5FekNfjZQKvwOlR5QM+mKNztyvzEhfzKg=;
        fh=rYDIABXNODOYg0auP2ZgHV6Ax8H/ikIkxgz2DrGgCio=;
        b=Drpsz7xc7tR0lp7Ro9lxilR/PBaUoQv6iOlVTIwKaieVQDzGrCTybk4yBV9GG8eoTb
         ImU/ur+0tmzdq+nH4+qVY9ZUSNQbfyHqnnzcPKAewQixa8CQsM0sKaa2u85UnmKTWTFZ
         WGiiIqdtv1Gb+KYp7xs6mV0YEiA23RxBPk/nsmP8cuD3TPmuJd6/KjE30/wiQxZrYZvb
         2REMrd8+PXkWxf77/pyGb6Yf0DKy4ft3OFQrMj5ycUro6mPbTIaXosxJ2knqDNfudgPM
         gff5NMH+UhianGyCS2jfxMsOJfDtF9TvFuwte0Zm1U7Y1Eujpgb0Q4D5kxldk+LqOcaO
         Nx7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780422565; x=1781027365; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tueJPMHLma5FekNfjZQKvwOlR5QM+mKNztyvzEhfzKg=;
        b=aXnLuhWH4jzWDZZ/GQ0JqEyPugU63JRcqjQY8c2hfS1e2IIODsfWN0eHYQebhBGEr+
         tcWI8vJ8wQjh0lIptH1E7tO/PZLoXFyPF4JLzXVp8+vyDaoEdprD/HGHVcyq8IqesWvt
         OmpXxDZq2pSILh0lWKEDl/MSTX/XBe8RFz4If5jK+hphOaUV+kDCjgZab4MaHAJ4aQ9s
         1uwD2OSnRRvTgZSASwIKzQ/2yDrxAHbA4rWUcaPOSCV6KV1V4giY+TJEyVVqMwW7U/Z1
         BAO4RWtCHaXPWS7n5JpKPbuN+E1MbDlU6f3reWHCAyL1z2KvgRtuUEX/3OA6BfmPcJ04
         GZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780422565; x=1781027365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tueJPMHLma5FekNfjZQKvwOlR5QM+mKNztyvzEhfzKg=;
        b=UTdhU3N13yDc1QN3Z42mKulXcN4dxVE6Md14f0+NT6pXSdEWDv9xmqYN+zhB/IHRc1
         yZmsxn3T9zTNI1suzE2GmE1O1wA2I9WmbDjVHdHWDeaHage9kmOa5f1PnV10i6vwHBNk
         dlYm2OlW1cC1tpQo8nc6oPyr9ix3EtSQOq+DNbz3ZqA8PRfy+FumQqhX8Dzw3LMf/dlc
         0f7bbwwsRdAoY7MzaI22V812oPuxjvL5SWFIQVMYkH4QTStFLBHdaLGkV7qGp8JdkKuk
         Nr5He3slczq98yEczKEpHEbzgd1c3aF0Z1QZZC36laoXuMayc17NFGTRcrLbuKZn2tqv
         wz5g==
X-Forwarded-Encrypted: i=1; AFNElJ9ZEm22qC1Kw/txcTbZmXAdefe0FU7qDWX6G30BmipuXXROZ4uyk0jJFc6F1v3nLesiO7riULCkkbiG@lists.linux.dev
X-Gm-Message-State: AOJu0YxY8QZ7FsYG0YfOlRYqqple8LY7J/c1V7i8rJN7GylF+Mu4QRgf
	lnCtPXn0NuoKZuspXDHgKBOmKmsrWX4G+diNBsU6iVWo5i8NY3UOxlhV7kPI75AHsvWoLm3k+T4
	fP5i82W3dt0xGCNpXOS5zmuIgsNJs9Wo=
X-Gm-Gg: Acq92OF+PAUi/ErD5JbcxUCgL+1+2yPr6mkTG99xe13YSC7XVvuFlI7WR3WpZ3D7WOn
	OVLjXzgUGVsUM2pdZbGItXM4Sd227DEOjcr307HLeeCKmYWQpn843WnSXFhW6onbFvNZkkUMbdO
	RUeBNZGVEnHfjEhHitqrWkGXPaO51VbI6uVT3v7pzaQabolb+D0dOa+jI9AdwKxFR38EDJ4KtWI
	e5JWbXfO/cY1f7u93TD4Vpq1u6A4O3tXh6pgSVOSSTsOpIeARlBzbaxJKvQwTXEORkLoPupc4y3
	4pMLvQj2ecG/35ra
X-Received: by 2002:a05:600c:4685:b0:490:ad8e:11bc with SMTP id
 5b1f17b1804b1-490b50b64ecmr12869745e9.31.1780422564695; Tue, 02 Jun 2026
 10:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <20260522205823.1597313-11-joannelkoong@gmail.com> <5a38fc7f-ed3c-41a8-a100-bdff5ab962f5@linux.alibaba.com>
In-Reply-To: <5a38fc7f-ed3c-41a8-a100-bdff5ab962f5@linux.alibaba.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 2 Jun 2026 10:49:12 -0700
X-Gm-Features: AVHnY4KHPlF6zp-koMH7Ev6ZEvtB5Fky8htehTuXiUrvZgsuY0NGB0cb7WwxLzc
Message-ID: <CAJnrk1Y6TvEpF01qftt7L_thOQudyPP11d5vOKQWqzhbaJ0rwA@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] docs: fuse: add io-uring buffer pool and
 zero-copy documentation
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: miklos@szeredi.hu, bernd@bsbernd.com, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 2:37=E2=80=AFAM Baokun Li <libaokun@linux.alibaba.co=
m> wrote:
>
> On 2026/5/23 04:58, Joanne Koong wrote:
> > Add documentation for fuse over io-uring usage of buffer pools and
> > zero-copy.
> >
> > Reviewed-by: Jeff Layton <jlayton@kernel.org>
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
>
> Looks good to me, just one nit below:
>
> Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
>
> > ---
> >  .../filesystems/fuse/fuse-io-uring.rst        | 194 ++++++++++++++++++
> >  1 file changed, 194 insertions(+)
> >
> > diff --git a/Documentation/filesystems/fuse/fuse-io-uring.rst b/Documen=
tation/filesystems/fuse/fuse-io-uring.rst
> > index d73dd0dbd238..79003ddd44fe 100644
> > --- a/Documentation/filesystems/fuse/fuse-io-uring.rst
> > +++ b/Documentation/filesystems/fuse/fuse-io-uring.rst
> > @@ -95,5 +95,199 @@ Sending requests with CQEs
> >   |    <fuse_unlink()                         |
> >   |  <sys_unlink()                            |
> >
> > +Buffer pools
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > +Buffer pools decouple the 1:1 relationship between ents and payload bu=
ffers,
> > +which allow for more optimal usage of memory. Entries only 'reserve' a=
 buffer
> > +when actively processing a request that requires a payload buffer. Thi=
s
> > +decoupling also allows for optimizations such as incremental buffer
> > +consumption which will allow non-overlapping regions of a single buffe=
r to be
> > +used simultaneously across multiple ents/requests, and the possibility=
 of
> > +multiple buffer sizes to be supported per ring in the future.
> >
> > +To use this, the server must set the FUSE_URING_BUFPOOL flag during
> > +registration and provide the payload buffer pool through the iovec pay=
load in
> > +in the first sqe. The server needs to pass init.buf_size and init.nr_b=
ufs
>
> Nit: "the iovec payload in in the first sqe" has a duplicated "in".

I will fix this up for v4. Thanks for taking a look at this.
