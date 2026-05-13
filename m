Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D53938F250
	for <fuse-devel@lists.linux.dev>; Wed, 13 May 2026 22:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778712461; cv=pass; b=bLaD5IiVX1efI03xxGLpI6ieOH7P1h4vKzuwSFVcSJLibwVD8LEQ9g8O1G4OXf3/P0FmQPd4sN7Ia4TTngeevTw4uV5wQhOoB8j05fMghEZrB2mEe934bpSGb3k0aZzzmJFtzA+jE7An2pM46JYBba3dLWmrsQh9C+yxajj7UoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778712461; c=relaxed/simple;
	bh=dXe6VfIuGFH67gxrK9sy/rNh6PopvHLZ1zdITLllg90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZZsGLyyWRR0sl9lYutBi6gZUoR2I1wPX5kkKkaz+bnATfk42+zMFgIRSvgYg8jd3yfb5XvPREXqkbPDxXR27wAdOC5CG1xqSjuRiPXs9eyCIrQzAq5zCGdw3QBdwYwEAL+U0K35E1qFW2/HIOFHd9nJuCWzc1z0lS+pCeR1w2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U62QxrM0; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U62QxrM0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48909558b3aso71754685e9.0
        for <fuse-devel@lists.linux.dev>; Wed, 13 May 2026 15:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778712458; cv=none;
        d=google.com; s=arc-20240605;
        b=NOEyxNcBAojeOO+UFBULvptvMHlqDC6TeRHDviv66izZL/QZxfxyrNvj24tN0DoLHD
         ZF5+qcPACIrRsMS1Qi/8QolGF+UqcjirJB/p17UFLzL33sDC5/RobJJ8xlYIfVDcamIu
         VZx8V9MJJ1QZV3aa/38AEuAa6qkAupVDONlojxBVwH3N9uNGpLUWUpMlDpxqNxzc531F
         s8tWEDJDknZIeg+VUqIeu1HEi9cPTQds+4bfvksyc1moEgOzJChR7OKogwEq1NPq0XzD
         FEtYJH0tFz9hMUiyg7Bbqzr6NkfkoCQcYu5gCZ6tGvr3idV7uPg9UEanuDuc33csJUKN
         guRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dXe6VfIuGFH67gxrK9sy/rNh6PopvHLZ1zdITLllg90=;
        fh=RiKKDCSBkaKBID7P3NfsQ3IRwc6LOrugebgzz3ft+J4=;
        b=KzsOnd8hR8sGsmr693GAZro8WWvuO/kz9reTWUnyVnWIQnO4bpywtdfC8SUJr2FST4
         OrvMZXyuJB3XdJ+dwHxo6nn0pL7qDykH+QHGR50R0d4DFuHDV+gHLcfpKY5AIqpqunqU
         nHCrrojQOkhjDpXK6BWL4sRRCDu15micbmX1fYyLAMF+Cic5if0VPBGhWnZaqOD2GpUt
         8SHbllGjmrNxMVLRRmgcpB6fmMnRWIVFZnFSqUYFeQlBZPKGBPhsmtIuRpxrCgvBM5Yr
         hWWheaHq5HlCeEZ6dqjZlDLEcJgyqrI8jPgG7KO+MoOVWNJnJmGtPEhzz6YPCfwhL6wv
         vbfw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778712458; x=1779317258; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXe6VfIuGFH67gxrK9sy/rNh6PopvHLZ1zdITLllg90=;
        b=U62QxrM0ZsGsKkbj2PbW1W6PThrRhTd60BlAIOjLDcmgXtSsMOSZazmZy6OyFTTT+G
         YhP3bQy5vtAs3Ilek0cNIhwohF3FhlrsbrAFlhmAHGmg5jIydGL4/57i05jUwxSe6jfL
         1jnWtkUcX/qNT7673Oq7YE6jWd7RkwcLtsq/zqyhSdpJaebFkgwueY3hwkocoPiQvwzw
         UZHeN1EEyt5hIdu6A4X3fY3xtB2Gq2CsL7qT5L5PZUBm0/g/NoAvez8t7Z0rki+hlx4b
         gRcDDinxN6r6ws+Gqmijkjm62nZsW6v4gkYmNdPnPZSuWtOP9k84jvyfEHIUWtQ8e347
         CPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778712458; x=1779317258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dXe6VfIuGFH67gxrK9sy/rNh6PopvHLZ1zdITLllg90=;
        b=AQaXh8MmTE+yaThQu0B1PsXykEM3ewIHYYNCEm290pEiCUDcqgHGb5MDs4S5tJMai/
         HYQp71YY4dnwZl5o+85DrTwRZu1mLtzI8FODRzVdAWq2oSreYEI013rjeZ3LEcQcFarc
         H05q2FOQnFo7rG3P5ZcpRMPr0L8QtxufMUA+1igUqsbzAsNXhDvcUuHeFg2c+7PliVx3
         9okybktizQ+6vbskN4bP6dBGwIxGuR/ZCKRBK/0c3O6OFsjvu6i0Z4ChIjkAjZGBa9QP
         MkoRvQ86L5zWckXq4NWOm0oPYgtGkghDwNCe7Lew9VICkPlwoJYhSSS0aZIudMsJUYBo
         WVrg==
X-Forwarded-Encrypted: i=1; AFNElJ82pmUjEghC/3qo2JK2yp9tzEHMhwlQc+dcgXRenFFPVytfTmbAkGKKWIbcA7H5FaLqwYjT12NwNCZG@lists.linux.dev
X-Gm-Message-State: AOJu0Yy62s9yxWfXRuru4lI/5Utdqd/YiMCWDQwOpfytqOYkJyYXC386
	MmWwYVqZWZaVDNxP52pFB6ddqgEeJE6AbeJI05D2p1/Y3G45BaMXXT4/LtGBbc1BdoUVPLXyXKd
	KU9/lrwPr8T5QbmBYo+LFZuseGpFet48=
X-Gm-Gg: Acq92OE18uhnQ3hlR5zS26lYDs3de1Jkybn+u+2WnyeP55/q+zHMFVdNNwxdPXF6pcx
	Q6gzfRRHD4H6qhPryDts15r/EvgxVCMa2Dr1oa1dSe7PxW6StGw5ULZ6HINk1IovhY8gXBBeQUG
	2ZTJFoCALsWeCWrvc7r1RBHb4IVWhANzma0JdS1dVy1fgsjKOd9T9s6ACOHqMY+xHYxVj5AsWvn
	ADqhlDb0Ze3HUf6DNpSOE3MedL8VFCLHv8ShviJfYrItuJrKXyCHC9GdVfGOxMzhu6imoObMdFc
	xUAMDfEadG4hvZOk
X-Received: by 2002:a05:600c:19ca:b0:48d:46a:6e5b with SMTP id
 5b1f17b1804b1-48fce9b9fb4mr64471415e9.7.1778712457857; Wed, 13 May 2026
 15:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512200448.3818665-1-joannelkoong@gmail.com> <CAOQ4uxhAbS+pQiOygY9m+UzqnuuWL9+Y0hj40Nck7_8NX0Xh_Q@mail.gmail.com>
In-Reply-To: <CAOQ4uxhAbS+pQiOygY9m+UzqnuuWL9+Y0hj40Nck7_8NX0Xh_Q@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 13 May 2026 15:47:25 -0700
X-Gm-Features: AVHnY4K2G6L0igALgPi3k3y4keZWWbBkviejUU1uIjOG-CNWZJUCbMnRbxluwK0
Message-ID: <CAJnrk1aZDaPrr2D3xrccK6ixigwWX=J=kfXz5JBE90Y0eOcbeA@mail.gmail.com>
Subject: Re: [PATCH v1] fuse: use copy_splice_read() for FOPEN_DIRECT_IO
 splice read
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 3:20=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, May 12, 2026 at 10:05=E2=80=AFPM Joanne Koong <joannelkoong@gmail=
.com> wrote:
> >
> > When FOPEN_DIRECT_IO is set, fuse_splice_read() calls
> > filemap_splice_read(), which populates the pipe with pages from the fus=
e
> > inode's page cache.
> >
> > This contradicts FOPEN_DIRECT_IO, which is set by the server to indicat=
e
> > that the page cache should be bypassed entirely.
>
> Generally speaking, this statement is not 100% accurate if you consider
> mmap(), so "page cache should be bypassed entirely" is a bit strong,
> but I agree that this is a good goal to aspire to.

Thanks for taking a look at this. I'll update this with more accurate
wording and send out v2.

Thanks,
Joanne
