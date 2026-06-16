Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2DD3ED3B8
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 06:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591901; cv=pass; b=k1B/ojOF7ZlZSxzp8geLaMrqcfP9NearbOUxpm2/NN6BGaqMUYBN2+4kca50zj0ZT/ip8PE/3fFdpFzX2lXPTb0abR7I7+ZnXVfQHZR2s2SubwrnUaNU8k0i2duLOHP30f0mYE5VdlfXBAtOghW/838bW/WVcXyER7vBVNfWh9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591901; c=relaxed/simple;
	bh=VAHE27Z0i1OSVl2fxjSynlkhr+r+LPgK1uJ+hP7Zbj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPpB+hQLe2n+Y/JMVnnrWnSUySj+jKkrTdDfo1Ys8AJMBDD4iRZRhazmySX8KFbs3uFHvfMBW5yq6PJHDCjs1NZkh7KGdtxRJGGleaJV302cpyb6YAwMuMJ7XDGsxbpfnLZTM26S6V7qzwuRNryI/gf7VJMu6vnr9RgxEGkmK7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDmKGw2u; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDmKGw2u"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef1198766so2185092f8f.0
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 23:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781591898; cv=none;
        d=google.com; s=arc-20240605;
        b=gZK/NsHP95EaKSuekMGTOEGloHzji6QEAVlTdGNENa2MNfaLqTRkf/ggavdQ69ovE8
         4fpQ+TzFrqwQFaHhdpkgXuBnBq8ClHwInWYrCHz7AZ88Fdu45ZH05PiBBKSimaNjFSfF
         TIbLNQ5wxs6/sTycRuPxv32NLbK6CObGzyuJK0YOYNUubMes9U2Y51ehu8DH3F8u92YE
         1yJrIxnmaS/2FB/DW/EiAgEOuPTR8i9ZYA5wbHJXYfadx9vDHUq233a3saqQy1oBb27t
         1zokun9MelsYrh6Vu8NANnSWeWNo3i+0EQPWk+lC7+tew2bToAa1tSr2rRWW1nFje0cW
         aa7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VAHE27Z0i1OSVl2fxjSynlkhr+r+LPgK1uJ+hP7Zbj8=;
        fh=yJ8A2mytFtYF5Jp51jZw6aG8Ah4fOv4dFwPouekP0+M=;
        b=B2uPXK5TPkgE+ysgThparBpY+4w64h8/foNWbjlG7+IUELuKKW3RYZbdz5gA0wk7Sq
         s6BslJRVBpH7YPj39izkVgTOItHZ3aeVgRebPjkIi9BwzSVsxLfz76R3exHbHfGZG+wj
         rFW8nNMZCJJRrZ5v8k1ggWIRmCHj7wxdrK3ehJ2jVDmqZRlsBO4sVa910z1f2WgHXP6d
         fGSPoPMoFjJH7jK2YkSLP/LjbHWIMZR4ncLxojRlyWcY5oAaWcWEeG6Yu+D/QRYsGEFl
         fSgIZ2+rOSkVo2C7Sv9EmdiYSBnRYhxAMSyAWxrs8joEFpH/k9EP8OFsTzkWhYxbCopS
         QvPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781591898; x=1782196698; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAHE27Z0i1OSVl2fxjSynlkhr+r+LPgK1uJ+hP7Zbj8=;
        b=YDmKGw2uk2eFSFsBrilMdBC6ZazV1LxjbrjCGZtazWy7hbLjk1cYC3V1HhWPWgoZcC
         S0tsMpqZW8nrnSK+Ez2X6uf3X4OIdr3ijAyDGSBlyuL+eXg7pp21VxuL/ginln0aycrK
         /hMU7aBd4nEbVVQTHMNgN6I24TBsJXtewhxAbleBJcNwkt2J+VaeWCG+qHZarToEYgKA
         M9FhAAcmqqqNHnm9Or9hsmCfzYgEtxS5QG3OlkTn2X33UMHoyOcOQwEcQuv68Dux2IA1
         DKqWJLqAzt4W+TJR0doRnVWbR0AfZxTbP9lKIFy8O1uIQ+oRUu/yqcZiP/CtRr64EnYU
         cXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591898; x=1782196698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VAHE27Z0i1OSVl2fxjSynlkhr+r+LPgK1uJ+hP7Zbj8=;
        b=fFgknnvxWhPF7WpmJ4nRFdDlkstMjiClE4zczbQCB1UDbzY/Jzd+qGBpuFH2s/LpdZ
         gX49vmscEE+GJ2StsG69WtdKoSsjDagamzTWvGu5wzNrFB++PC1+jHn6uHJV1WGJ9KX6
         BRa8fL+EVbZoYivnkFKOB9/pKAEpfF1tjxhXCFr4qKg0F97gqpOjbOt32ETmLeJMIkjd
         Fosq2EldzNzossCbBblI7Msg/v4ZDRHCHYukKrEXyBKoJ2zCZzdWy9LCbl1ZB3jplfRh
         b6KDnIhzRKK5WL70qcNnTWl72lajwmBOw9UgNKGSp3IKPBGsse5XUMWY0HuF9nYl6Feu
         bzAg==
X-Forwarded-Encrypted: i=1; AFNElJ8P7FBvjUtHgCvsTpxowlsF5Bse3+4w9KnBbGXU92ORIwVUkHp3VzFomTK/Acmk9G3auO70V7Y1720s@lists.linux.dev
X-Gm-Message-State: AOJu0Yy47s0WzCVwQvt0ojZaXDnlfY7EBR0YviUjzwiGoyoPT0JoW7LZ
	WtNE7FbXkgXpjAis4+DtJz5lYjf2lzquXyz0X7Rf6ogL5OCuf0+UQ/m3XUDZS00Og84jkcREsZM
	Clp15lqqfqz7AOvjYZDj0Vi4dR6ypZPw=
X-Gm-Gg: Acq92OEgStjjdkymRvVkq+CWDTfPV7ZEIKaijAvMeBkxcy3XvGEq/N+sDLPCB2W2NYK
	mn39Rh9i4SvzQJnY9raUysCLbgcRRSspZVf/TC0dsWFR4RZl5Qsd5xXHjffBtiVQXpVFMZrNMXC
	ER4qzxsfrsw0a7CWB7IV34ZQmGRKr+K+ZWuMA+t/cFHp8xYEbNmKG0mKdM7DxtAf+/Yib4l2IdW
	MJWcyHI/g+vJu64oh0zwAV/dQe+51OA/4tHM5Ftx2Pii0oT7z/J4WevhZL2EXaUzOtCqZbUhBTk
	Zildn7ooglKXEUhiyUrectUktjp83swE4g26yZDDnK+YWGw7b/+vYlY+Gh4jAYIc8NEysev1cmv
	Esg==
X-Received: by 2002:a5d:5d11:0:b0:461:a19d:3547 with SMTP id
 ffacd0b85a97d-461a19d361emr1794950f8f.19.1781591897693; Mon, 15 Jun 2026
 23:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJnrk1Y9egYizkx1H9K0cqxSYuB+7vLvQbV7Tf4C5eHFqnnC-A@mail.gmail.com>
 <20260616011516.4039110-1-safinaskar@gmail.com>
In-Reply-To: <20260616011516.4039110-1-safinaskar@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 16 Jun 2026 02:38:05 -0400
X-Gm-Features: AVVi8Cc6TBHBfR45WJ_2epcrLUaiFCORhANibC721wRIalY3QlqXFyIm-p-MJJQ
Message-ID: <CAJnrk1Z_V8TShvWV6zwTMQqXra3J4J5CL5ofFMm9DGoLj9whEw@mail.gmail.com>
Subject: Re: [PATCH 0/3] vmsplice: make vmsplice a trivial wrapper for preadv2/pwritev2
To: Askar Safin <safinaskar@gmail.com>
Cc: akpm@linux-foundation.org, axboe@kernel.dk, bernd@bsbernd.com, 
	brauner@kernel.org, david@kernel.org, dhowells@redhat.com, 
	fuse-devel@lists.linux.dev, hch@infradead.org, jack@suse.cz, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, miklos@szeredi.hu, 
	netdev@vger.kernel.org, patches@lists.linux.dev, pfalcato@suse.de, 
	rostedt@goodmis.org, torvalds@linux-foundation.org, val@packett.cool, 
	viro@zeniv.linux.org.uk, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 9:15=E2=80=AFPM Askar Safin <safinaskar@gmail.com> =
wrote:
>
> Joanne Koong <joannelkoong@gmail.com>:
> > > speaking of fuse_dev_splice=E2=80=A6=E2=80=A6_write actually, this se=
ries has broken
> > > xdg-document-portal!
> > >
> > > https://github.com/flatpak/xdg-desktop-portal/issues/2026
> > >
> > > Specifically what happens is that the EINVAL is returned due to oh.le=
n
> > > !=3D nbytes:
> > >
> > > fuse_dev_do_write: oh.len 16400 !=3D nbytes 15526
> > >
> > > (where 16400 =3D=3D 16384 (read len) + 16, 15526 =3D=3D 15510 (file l=
en) + 16)
> > >
> > > After reverting the series, there is no error because oh.len
> > > becomes 15526 too.
> >
> > I think this is because of how libfuse handles eof / short reads. When
> > it detects a short read, it fixes up the header length after the
> > header was already vmspliced to the pipe because it assumes vmsplice
> > mapped the header's page into the pipe by reference. It assumes that
> > modifying the header length in place gets then reflected in what the
> > pipe later splices out.
> >
> > The logic for this happens in fuse_send_data_iov() [1]:
> > a) sets out->len =3D headerlen (16) + len (16384) =3D 16400 in the
> > stack-allocated fuse_out_header
> > b) vmsplices the header to the pipe
> > c) splices the backing file to the pipe. if this hits EOF, it'll get
> > back 15510 instead of 16384
> > d) detects the short read [2], fixes up the stack out->len =3D 16 + 155=
10 =3D 15526
> > e) splices the pipe to /dev/fuse
> >
> > After this patch, step b) is a straight copy which means step d)'s
> > fixup doesn't modify what's in the pipe. This could be fixed up in
> > libfuse to not depend on modify-after-vmsplice, but I don't think this
> > helps for applications using already-released libfuse versions. I
> > think this patch needs to be reverted.
> >
> > Thanks,
> > Joanne
> >
> > [1] https://github.com/libfuse/libfuse/blob/master/lib/fuse_lowlevel.c#=
L846
> > [2] https://github.com/libfuse/libfuse/blob/master/lib/fuse_lowlevel.c#=
L956
>
> Uh, this is very unfortunate. But I still want to remove vmsplice.
> Maybe we can somehow save my patchsets? For example, let's return EINVAL
> for this particular combination (writable pipe + SPLICE_F_NONBLOCK).

writable pipe + SPLICE_F_NONBLOCK is a valid vmsplice call today, so I
think returning -EINVAL would still cause regressions. It happens to
be a workaround for libfuse only because libfuse falls back to
writev() when vmsplice fails, but I don't think we can assume other
callers have the same fallback.

Thanks,
Joanne

>
> --
> Askar Safin
