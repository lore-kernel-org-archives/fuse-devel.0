Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DFC3ABDA4
	for <fuse-devel@lists.linux.dev>; Wed,  1 Jul 2026 22:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782945833; cv=pass; b=AuwBi2ai7cX4Asvsa0T0rhnVnG9xI3aRCX01o8FHI37iBi0pSvUr7tOMHRl9WCDeBsFWPzWBxBW49EyyZlreG2FnOdfR4OrzyfsOGS8CGKnR5JShR3zX8PIAFWzSyPIjcYr3PkcjrZlZ6cD9AzxN6ufok/DGIyF+iDwuNqFhRT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782945833; c=relaxed/simple;
	bh=LpVwPG9I+MEMBxL9PBfgj32ExPKI7u9Px4MNrpnfjo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osX0qgVcNF3bw9G1Tf9GUk/804xj04M07eVXl2D+l/5Fnagg9EiCVCLqJoieWMp0gtMYgfL9PKuimQq62TNL6199j5AhmfEo0N2yUnHcxDd+v8ExeMOxLzK4agfVfNjf/kcFAYWJ4IubmtWNSap6ArFw/4gYeaQp1wK2Zkgpduc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ssQwy7eL; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ssQwy7eL"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-697e96dd8d2so3509211a12.1
        for <fuse-devel@lists.linux.dev>; Wed, 01 Jul 2026 15:43:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782945830; cv=none;
        d=google.com; s=arc-20260327;
        b=IKnRMArf8OnpfKoz4cIlQsGMzYPUwXyIlNIFJyUN8EE+04/luh/Q8GMPsWSHnJYELx
         6UqErAivry0XzLnldHUVQHKTMICXRe+FGAgfoJ3f/Nd6/gj9x+0SWI8NUmoTiVJA0sNS
         h9jq+eNDrZ9g69CAnsYu/caFrc/EiXqgEFtmA2MiIswVmaIHllUJobqPU8eUartz7FP+
         DEkTB5Pw6E/OAyIJdj0lCJ33h5mrjYwWdlQlY9q7QcFiA24UpVj5jSCmPMi8SmNhr8PJ
         1Dg9F1JVsgTsDOp1cWdUem9MD2hArFo9EkHBZBy5yGtFBwT2kL3prYmDZGSQY8FTRbm/
         fTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=//nar+WWcgH1QxQNIpbuE8obkrSYZQkiok9LpXSsCtk=;
        fh=kMyUwbGIiiBH/lx3/D2skSK/f+xhGRyO6VB19LRJYC8=;
        b=hzaZNh/90w4NTlBxJAnz8G+0tkgClTVe5w7VRdoKQl3HXcFxA7+4pKzOrGA221dE4O
         voVxT6ZJ7tZbascPrmyzPmjtAECFoiBVpYsl+gFidxABdCw/T5WILY5boFw1A5J3x5Pl
         H9zmXhKr6BAT8Mn7CjFTCoauSqAPH8mAtEF5yjE8MEday7ZHiH5ekPIhdqtEDwCeketU
         CenwIfhfdbYa45tWS63zgB65bT7Z/bn6McbQmf1NtkGjMwYISrQQjiffBNx03kpNBnhh
         wweUOOm1VLoppzwccOLBeC8C+xurmgaleXP9MKNKASg4tYqVozcbj+zRmxszVoqfK/dO
         VL/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782945830; x=1783550630; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//nar+WWcgH1QxQNIpbuE8obkrSYZQkiok9LpXSsCtk=;
        b=ssQwy7eL2pkuSxTXXLpPUCpxGtrLiBf4MeejFU/+OyLtd/BnagazlN9pe/hiWgwWh9
         5bTucMZP4FJkijxSziwzwj6ilGbEbfb/9TTgeu4pOtWZIXY7YekWG+LJlndi54y+zA5b
         3+eQv89P7t/Aq1yMBZFzNOSTtkuF02F3h+twbtYI3BzYDXo73NOb7uFN8FuKE57v7BFY
         J/+ZHw9SXVDZf6ChdacEGKAozQYlZTh5vFG0aY9d52wTVmSuhrvzdcnbL5PWfLa60k+i
         UO57QtPj1irKKW3SxwuQy4NW4B6kCRLdFx/6uZA60b+7whaVR+TnzRSqbDL6eIHaJObg
         xMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782945830; x=1783550630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//nar+WWcgH1QxQNIpbuE8obkrSYZQkiok9LpXSsCtk=;
        b=b6DbBB8R/IPS4Tgzxesl1yYF6GTUXIHaNqD/yoVUIZXOkHPgBUGwtKV8aPts9EwtTv
         ZnahzkqAhyGJgNtlmgldG3PkVRHQ/XwyvzUiKabn+ARJcLBtDPgyGEQ2piuNIf1l8ZTF
         j41L3z7JPCJSXtpkK5r29wFHlUPkreufNHKi6I6O0cWC5JuzUjohRAVLiAc6bklO95rs
         SOLgwFJBlb8FEup3fHYNobvpBxfSiewjM2C+uiseBlWnyoSNWaYeluha2+IArjyDKpVx
         RfV0Vo77aNmwjhFQI+CMDcH1NxRI0mpjWqG3XIZU43T2NiZbiKY1wBgAsbqRYufgQMT1
         1QyA==
X-Forwarded-Encrypted: i=1; AHgh+RqLnQ1IdkjI4/ZNVeH71b9NQONginF6IvpygmztkRHEriKcT6aaJaTO1VAx7ff+lW+kJLLt4JiyXD1X@lists.linux.dev
X-Gm-Message-State: AOJu0YxFxVgMhrN61gctLbO6kx8Qmq8fjinFWuuowpoMaKxwDGWh13Ho
	sJxskNSVA9bUHuYiJHg9pnHLVJf9YL+8b2lfp/1FHUpIUrExiAs5EguX8xQwyNCRahDzJkxugnx
	/eGJTzr8flduI6+yljky1Qkfq8YNTv6A=
X-Gm-Gg: AfdE7ck1zRhOroySCcuhayuGRzirGEVUXlJkVNkAzTZNnZiVXGmHUcgUCdMPlVtjwD0
	Xn0NK+yX2+a148GYWABfpwkOA/jnKmV4m9MugJmmwyjyXIcerdHZH0UqChp9pf494gCgnaQl8QW
	zw2MTTJyAPcTjNe3gd17aC2jKAp2d1Hv+2uT+2v3Fx5J44G5SUrDR/eiycmC9lkiIiXTMWiT2FI
	CGa9XfhydIqRgOw5dVoJ1m1khf66GAaIEE/vmkvFP2+FeNUJ2+Bi0w36nskOfsD1Ea26WLVNHn2
	frH0B/WJi3VXtwkLMoio0Hu/WjmnSjk=
X-Received: by 2002:a05:6402:2786:b0:698:5d0:2a61 with SMTP id
 4fb4d7f45d1cf-6989ef671b7mr1610157a12.0.1782945829965; Wed, 01 Jul 2026
 15:43:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630211436.2062816-1-joannelkoong@gmail.com>
 <20260630211436.2062816-7-joannelkoong@gmail.com> <CAOQ4uxj8RU8X0V3+74rw9wjBc2w2TH8qaGXgLq6DdjPuQ8tivg@mail.gmail.com>
 <CAJnrk1YT+a-NJ3H8rGziAPb9QL5-Qa4A-ojLmz8jSmWKPoJEnw@mail.gmail.com>
In-Reply-To: <CAJnrk1YT+a-NJ3H8rGziAPb9QL5-Qa4A-ojLmz8jSmWKPoJEnw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 2 Jul 2026 00:43:37 +0200
X-Gm-Features: AVVi8Cds_rqXqmg5z91n1cZbxlRDc_LKAhzm50uW_bvVtOp1TOKKbAKiGIr4Q7I
Message-ID: <CAOQ4uxh2GswbggcjoqabZgsWmJjniwMJ3QbniG8tPkX9C2iZpw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] docs: fuse: document io-uring buffer pool and
 zero-copy uapi
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, libaokun@linux.alibaba.com, 
	axboe@kernel.dk, bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 6:35=E2=80=AFPM Joanne Koong <joannelkoong@gmail.com=
> wrote:
>
> On Wed, Jul 1, 2026 at 4:56=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
> >
> > On Tue, Jun 30, 2026 at 11:17=E2=80=AFPM Joanne Koong <joannelkoong@gma=
il.com> wrote:
> > >
> > > Add documentation for fuse over io-uring usage of buffer pools and
> > > zero-copy.
> > >
> > > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > > ---
> > >  .../filesystems/fuse/fuse-io-uring.rst        |   5 +-
> > >  Documentation/filesystems/fuse/index.rst      |   1 +
> > >  .../filesystems/fuse/uapi/io-uring.rst        | 143 ++++++++++++++++=
++
> > >  3 files changed, 148 insertions(+), 1 deletion(-)
> > >  create mode 100644 Documentation/filesystems/fuse/uapi/io-uring.rst
> > >
> > > diff --git a/Documentation/filesystems/fuse/fuse-io-uring.rst b/Docum=
entation/filesystems/fuse/fuse-io-uring.rst
> > > index d73dd0dbd238..a92dee057d78 100644
> > > --- a/Documentation/filesystems/fuse/fuse-io-uring.rst
> > > +++ b/Documentation/filesystems/fuse/fuse-io-uring.rst
> > > @@ -95,5 +95,8 @@ Sending requests with CQEs
> > >   |    <fuse_unlink()                         |
> > >   |  <sys_unlink()                            |
> > >
> > > -
> > > +Buffer pools and zero-copy
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > +For the userspace protocol used to set up buffer pools and zero-copy=
, see
> > > +Documentation/filesystems/fuse/uapi/io-uring.rst.
> >
> > This dereference is not clear to me.
> >
> > The name of the suggested doc is even more puzzling for me
> > io-uring.rst is really not an adequest standalone name for this doc
> > and fuse/uapi path is unconventional in Documentation.
> > The doc is not even pure uapi, it explains about buffer pools and zero =
copy.
> >
> > Why not include the details inline in fuse-io-uring.rst?
> > It's not going to be a huge doc and all details seem to be intertwined.
>
> The details were originally in fuse-io-uring.rst but I think Miklos
> preferred having a separate fuse/uapi directory [1] for how userspace
> interacts with it.

My reading of this comment is that we ALSO need a uAPI document
not move the buffer pool overview into the uAPI document.

>
> I'm happy to change the name of the suggested doc - is there an
> alternative name you'd prefer more? How do you suggest making the
> dereference clearer?

Either document commands and structs in fuse-uapi.rst
(as a placeholder for more commands documentation) or in
fuse-uapi-io-uring.rst.
can be under fuse/uapi/ if this feels more organized.
My point is that doc names can be self describing and I find it better this=
 way.

But I don't think that the overview of buffer pools and zero copy belongs t=
here.
I think they are still very much useful in the fuse-io-uring.rst design doc
as in v4 and I do not think that Miklos objected to this point.

Thanks,
Amir.
