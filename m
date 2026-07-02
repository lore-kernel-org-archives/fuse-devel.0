Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED55C33BBB9
	for <fuse-devel@lists.linux.dev>; Thu,  2 Jul 2026 18:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783018436; cv=pass; b=SmxIkuO+EVRzXmkDRi0jwmyjkVb3WVQh1U3426BEetvee6NVYgPP+5TnT/pmNeIgB9liJb7dFJ9yPy7Rrmd2Fe4su2SxNHb2boV6ZNFAb3kReOuL9FHM4M53E41MOqCsK90PdH0pJoVqTO/BemWAk+qP33Z8MPWj5kb1zy5O73c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783018436; c=relaxed/simple;
	bh=/47yL/UGGsbi3/49CcNvLhnA9ohHS3XhuMPwK21JFIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qA47tCPer61lXDbUKD6HpzInh8+JkQ9Y3OxTNrElS1MiHdoNMWB1+hBG2q05/PQk5kRXCdIzx6+LPuywC11LcYpRU6IdrNZVDg0Tl6QzV5Rg8yXi8JCwZNsH3pbFLC+GiagIJhPcQF+/aDL0JZHl2/7FhuKtzn01g2Y93u1HP0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4FWiCYJ; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4FWiCYJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47231f1f8f3so2447000f8f.1
        for <fuse-devel@lists.linux.dev>; Thu, 02 Jul 2026 11:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783018433; cv=none;
        d=google.com; s=arc-20260327;
        b=jad6XU84/+YbSYPRT+jxOT3LWppsUpmtShi8R8x4jSSmQIWPbgRVCM6bTx8vVEY2vc
         WxM9WLjFJVyY2+Rom7z34uALU83TXNHHrneFYY/rOGQ0eNT3KfsPRmT8QUrAod8/wLjp
         dBSmuw1HpElrXOTeG28o7ismes84iUm5sSkK+CnRk/11wsHEfr09meNcwpMQpHMAxgNn
         RnNKkOuhvEhh79iMGKGiUqZYjx0pY5fE7lFYJuo3etAOq1xZJcyV0w5glt3QSbDhg/eK
         hR4siFCUoJ8lSSdMFOGV+VydDtT3nw35Lx8keiRjsNaz3Y7fUBG8TSo9Why3++HJC88K
         5Eag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VYo6bvPJvxerm8ARZPZHE18m7u0SWdxJw7pcei9PtJs=;
        fh=YRDZBS9pPGwA2IiuxW+dg0199NlTlIpqcAbupZiIfmk=;
        b=Kbxk1EWPH/VryTIp+pOIun7BtZzlnWrqEr4gZjumJNP4AfQ2fWHiWqJFsWtv815t8d
         enZkgfh/LKnvgJBQQKE3Lb0GxVd6jCvI56VZ1QVVSyRIyW4nGH/yAnCYb4R2cUL51JxO
         bEk+4Atl6d0IbnscnXmdFneiiSrrB4NCD22bjKOjofoV/eICYmBCapcMjESn0q+dze3n
         Mbtyq+p880SMNmNaFcWZMnVq9aniZ2vlCNcpVwti1+aAOZoTnL8nKVWPPhUEbUBj9HGi
         8oovx59pWjNa+xuIEqXJZ/Lrc3kAF7mcFKty1qZtv6ohGaG7+JuxkLOtHD258gAx3joU
         Rsbw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783018433; x=1783623233; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VYo6bvPJvxerm8ARZPZHE18m7u0SWdxJw7pcei9PtJs=;
        b=I4FWiCYJVq1hHjlzZ6cG48A+vMxEMuYETe9fOWjNgaWeQG5TJb5RzSQNflSYrKrNi9
         BEWMaEHFOBiNK8VCiPLw3RKh6g5hUZEuuNkpucBAfSsu6TYAk/A+bUCBceXmgGKy6z9z
         XmMBWT8Wqx5BI0Q5MOVB/rmlEE09lTMD1Wj1cnaTPMGAkMMFQIg6XutwGkOEqB42WTiz
         /beKozEsmodKNPlMefDCVbp/i1rkE9QyUxFnaZkDrU9LiP5+RivHW9xCQ6Aaef9fXhU0
         OHytUe4YUjalHt64rX339D7ey6ywlXoP8K47dUdDkL9K6MyccYHTjNHfTwrgI7AD3Imm
         AmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783018433; x=1783623233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYo6bvPJvxerm8ARZPZHE18m7u0SWdxJw7pcei9PtJs=;
        b=OUTq+/omgmFLLsEyplFoVz/SkypT7I/PQRJ+iSUZ1SMVgzIBJCpK6YEDrP0p59MATx
         9LOQRUf7ILR0HR2OEk8WBaYkmI8IBMUd3M/ehCktUh+Sc4vSZrI5YYIV5k9LRWVdtOeN
         Eobbylux/4uD9ubfIVNh6UHjGn6DSVeMZopyS1qOpYAPAFyaBS5p3SscECdBz/Uclubc
         dVg3P17MrAdpO2R/7SRTBcaWIs+yl8zXSk6Arl7X5TgnCdS9FxYTLREHSv7qTaP3N0KA
         UHZmWBfJyOucaVKcY2quj7p3+n+3o5x85EYVDlay2gbE1TNxqxciK/g9sQ+Idp+8lUOb
         987A==
X-Forwarded-Encrypted: i=1; AHgh+RqfUmUVDq/+kO+i23oHhtWjRy7TTNo09kWU/fQBnTeG7VzN9tmj8/hpUPmTJ9uKlaWzQON1DsAQqw8Y@lists.linux.dev
X-Gm-Message-State: AOJu0Ywhqf+KLpB16RSSN4FDAzWrprqYMebVmh8RW0nkuu7nlm8de62R
	hMJHuXv/QcaBgHk6ngdaDHi6QvBAxhNBdNzWmJCouCMO/ZKZUHeKkmkiMrN70RM7qz9Ikjs4COA
	SUKU2RU07Rjk0Be5qUAWkcuxotJENR80=
X-Gm-Gg: AfdE7clrRcK3BSauUY8mAtnbOTjpS4CTdUyoBmE5CK9OoB0yo1v1GR9k0O0/JfZKjro
	y6hCC+VS7VWEq+qM8yxll5x00Xq52fp8yWBkVcfaTAoe+1XKU73No6yukmFCjvCvvm7WUYwtQ5K
	T+5ogDUGRSWFBf+CO0GjilWA/YxkdCCpRVWyWs41IQjzTY2/14rINGYYWuxYLo++hCdJeOIR4q9
	VGg5GQCyhLflJYGs8k3fSDHDK5c/8jzS5Kr0ETITY7F5x75SE74ZRtprGrIqV9ibit2BBwHopje
	7ViRwKJwSFvOrTzWks4BkJydFbFHzU7PBMwh1iq0PhuUucwvuoUxEyIi0A/Fmw4=
X-Received: by 2002:adf:e00e:0:20b0:474:64bf:8fb6 with SMTP id
 ffacd0b85a97d-477b5296529mr6847738f8f.39.1783018433170; Thu, 02 Jul 2026
 11:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630211436.2062816-1-joannelkoong@gmail.com>
 <20260630211436.2062816-7-joannelkoong@gmail.com> <CAOQ4uxj8RU8X0V3+74rw9wjBc2w2TH8qaGXgLq6DdjPuQ8tivg@mail.gmail.com>
 <CAJnrk1YT+a-NJ3H8rGziAPb9QL5-Qa4A-ojLmz8jSmWKPoJEnw@mail.gmail.com> <CAOQ4uxh2GswbggcjoqabZgsWmJjniwMJ3QbniG8tPkX9C2iZpw@mail.gmail.com>
In-Reply-To: <CAOQ4uxh2GswbggcjoqabZgsWmJjniwMJ3QbniG8tPkX9C2iZpw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 2 Jul 2026 11:53:41 -0700
X-Gm-Features: AVVi8CfnAKPu8JG9OnKZxKcqhxqr3ggBE5y2ugFdG3LvEm-_xtLthJtgzioFZjo
Message-ID: <CAJnrk1a3ddqAkEw15OX1sgjvooBZPGS0bsk8HYergDhw0PjH0A@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] docs: fuse: document io-uring buffer pool and
 zero-copy uapi
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, libaokun@linux.alibaba.com, 
	axboe@kernel.dk, bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 3:43=E2=80=AFPM Amir Goldstein <amir73il@gmail.com> =
wrote:
>
> On Wed, Jul 1, 2026 at 6:35=E2=80=AFPM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
> >
> > On Wed, Jul 1, 2026 at 4:56=E2=80=AFAM Amir Goldstein <amir73il@gmail.c=
om> wrote:
> > >
> > > On Tue, Jun 30, 2026 at 11:17=E2=80=AFPM Joanne Koong <joannelkoong@g=
mail.com> wrote:
> > > >
> > > > Add documentation for fuse over io-uring usage of buffer pools and
> > > > zero-copy.
> > > >
> > > > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > > > ---
> > > >  .../filesystems/fuse/fuse-io-uring.rst        |   5 +-
> > > >  Documentation/filesystems/fuse/index.rst      |   1 +
> > > >  .../filesystems/fuse/uapi/io-uring.rst        | 143 ++++++++++++++=
++++
> > > >  3 files changed, 148 insertions(+), 1 deletion(-)
> > > >  create mode 100644 Documentation/filesystems/fuse/uapi/io-uring.rs=
t
> > > >
> > > > diff --git a/Documentation/filesystems/fuse/fuse-io-uring.rst b/Doc=
umentation/filesystems/fuse/fuse-io-uring.rst
> > > > index d73dd0dbd238..a92dee057d78 100644
> > > > --- a/Documentation/filesystems/fuse/fuse-io-uring.rst
> > > > +++ b/Documentation/filesystems/fuse/fuse-io-uring.rst
> > > > @@ -95,5 +95,8 @@ Sending requests with CQEs
> > > >   |    <fuse_unlink()                         |
> > > >   |  <sys_unlink()                            |
> > > >
> > > > -
> > > > +Buffer pools and zero-copy
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > > +For the userspace protocol used to set up buffer pools and zero-co=
py, see
> > > > +Documentation/filesystems/fuse/uapi/io-uring.rst.
> > >
> > > This dereference is not clear to me.
> > >
> > > The name of the suggested doc is even more puzzling for me
> > > io-uring.rst is really not an adequest standalone name for this doc
> > > and fuse/uapi path is unconventional in Documentation.
> > > The doc is not even pure uapi, it explains about buffer pools and zer=
o copy.
> > >
> > > Why not include the details inline in fuse-io-uring.rst?
> > > It's not going to be a huge doc and all details seem to be intertwine=
d.
> >
> > The details were originally in fuse-io-uring.rst but I think Miklos
> > preferred having a separate fuse/uapi directory [1] for how userspace
> > interacts with it.
>
> My reading of this comment is that we ALSO need a uAPI document
> not move the buffer pool overview into the uAPI document.
>

Ahhh I see. I reread his comment and yeah you're right, I think I
misinterpreted it.

> >
> > I'm happy to change the name of the suggested doc - is there an
> > alternative name you'd prefer more? How do you suggest making the
> > dereference clearer?
>
> Either document commands and structs in fuse-uapi.rst
> (as a placeholder for more commands documentation) or in
> fuse-uapi-io-uring.rst.
> can be under fuse/uapi/ if this feels more organized.
> My point is that doc names can be self describing and I find it better th=
is way.
>
> But I don't think that the overview of buffer pools and zero copy belongs=
 there.
> I think they are still very much useful in the fuse-io-uring.rst design d=
oc
> as in v4 and I do not think that Miklos objected to this point.

I'll resurrect some of the paragraphs from the previous version and
put it back into the design doc.

Thanks,
Joanne
