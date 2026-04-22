Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47133C532
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 06:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776840679; cv=pass; b=BKeEG67dlnUPZkLAgvpS6hvBT4wnD1qJIpF0w2B3HOAgIRHxqj7yqbKgp5Li1HX21npvfdeD8ABDdckdc9Z3yOj5qQu6z/Hwl9HNJ/RG05fP3OVBj9mxZNU2s0M6BVDcRkvprV6pH5Y+1X37W7dOAjhH2TrZlAyQThlwVjcOtjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776840679; c=relaxed/simple;
	bh=Nz/oSo2ajFIOktC8V9wKGUIAk3N9ONmEtvrztKCl7pM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRtovGMkrwc5P7+SnbK616Dz+NqLAUQeEp9mB4Xo/1HhzpCBzKwqKT5TBX22mC2yEtDoPwaN1xMjTMNA/PtxFCfZ8BMUIu8qqo66MYXq6AIXXTKyeFcm/LOnaQ7jZ/oKX5324vNFo0X9rrWkAbIeJCxm4a9NjAt9KG18Zt8/Lfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCtnjQXC; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCtnjQXC"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ba36357195bso596209666b.0
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 23:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776840674; cv=none;
        d=google.com; s=arc-20240605;
        b=IOx0z+3FjEqHKPgXW5x8qyqy8wauVDkuJQKQyBTOToU+iuukqNFA1iZGS0qfVt76P5
         iGrAirWYXRylLWstI/9Xg78yqBRolrgNHcdMF1tbqrh/IXMjWn7LWuYXT7d96+nj1BWa
         LYbjcigMfmo0QgX7qsZCyRXG67WAMMx9D2w8MIBSk8iurw2mvFOF21jtYDZ+EmabBgjU
         LdAX068BUtOGfe0pFKsELGA4ovYkY0LnDSvfJ9VMxwIRwhtnQ26Byq2Cb5hSjZcw0des
         NwoCi0vq+dYlGrNyed9P0NCdXYsye5WaTz3JkjrGII0v1UyOzAIlUs/FHyK9NZlhul9D
         o3Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QcVesQ6he+xg6TR7EABshRSIacBslFU1ixiu9pljIf0=;
        fh=kq3zML8qLXgaxxcT34IVLhn6VFi4j7Zf4i37q5PxtQU=;
        b=bcK22jsdX9GRINlkvoeS4or3r975Cmc/FmFt/ziBGAGftlAhkcJoL4sd2Bgj7Ha1d7
         29FQ1A9JBSGPyxYJiaXsnzEUdybxR2bfIQxhUTptkSfN6T8kPiMW5mFCb+6KkZ0uxZ2/
         CvixFFLx1x5Rt3zW0DwWO7eePvGbW5nt8DTHw+kKjFdjkfKFN8CV2QUCFISD+UEXI38K
         0AxESVccHtm5FtUfCJO7+1q4pHjZjP6H8dh7G90R838vQqNC7twISQlL2yFys1pNjg1X
         Xdze+9HCOIdkMLu6hMntLGk8RgwTdz1K05NdGBMP4ItDOJiT3q35AtPKkrP9j2oaJRV7
         4Ehg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776840674; x=1777445474; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcVesQ6he+xg6TR7EABshRSIacBslFU1ixiu9pljIf0=;
        b=qCtnjQXCXEDzs0Xygm+U4zdMModjZpmVKQ/QdQ/WJGZf+Nud5UwM1lBeBzVDDCp4+L
         RlJ/V/zr+yEy3gtzCoCTahY5GZNykgGNGAqMUSUCHO+g8lrl6JpXxMYsOqE6f4EwtOU4
         W5RBUUQHKdLoFiFkNQEqtpGSDE+lSGJ/Q1EF/WRNLgrEgWCDGCBT0I4W/fUMBrf/OMSo
         h00Y7vTCv6jBbXaGh4+cBt8LbrbBvjVmjSt6uG4EB6KhXVMWv+pOUC2MsgL/3jS/Rvbs
         YIb24cxz4kBNPbmsuTHQSjTvPJvbSEugXyvbztjpgjPRmfjonWswa6nPOyK6RWdmsrQZ
         t5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776840674; x=1777445474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QcVesQ6he+xg6TR7EABshRSIacBslFU1ixiu9pljIf0=;
        b=eHeVa/x+RVcsCBwIFgWKeGcZeTcUKl4SACR4xx0ogCqaSmDJPCSHApdTlzliAYnaPd
         NoyYNqX2Cyu7RR1Xm2ItnzyTG9sOYO9L0cvOrg1R50thOJnfBCbpJLtz8ZfgLI2lqf+t
         7dLSkKsIan0b75sUJPVRpuHvmgxfYCEMJnbzotj6yzSxaVtdjjUYo5LgjSkEkBw5wwNa
         omx4v+sJGmly2Rh+gJuA/ncNtmWbpw4CLv+Y4lgPB6KkXrtSuCAOn9XMOQFnzNm+bQ+H
         rHXkp2fQ4APBDS4WvFG2vbpe57I4nj01Ynt9Es4ItSmRQlAUqG+e9x9iU6svOF+36GAk
         /Fww==
X-Forwarded-Encrypted: i=1; AFNElJ/zlsU7WpJwpVk4c2PWMyHsGhV5dPS3vmdfwZf3tL6vSnZj+/DJe2G8DbHrX6mORWRlgvd7qdimRUdk@lists.linux.dev
X-Gm-Message-State: AOJu0YzO8/yIHb6dNsxVCMtlDslTbIvm5jjBwbS3j9aqxL8G+2s0hXMC
	nAa7vF+ByfQZM6UU4NE8O1usoKPaY7uAIImxKT+EuhFDBNeU34WG0Flo3h6cwvQwpon/3nrjnLR
	rKRW8hBz1mnY6pNrHxSs0pnXvyFxkalE=
X-Gm-Gg: AeBDievK+PacdMKrYYKfAgtMJ8bbjXmFHyGWpZljgKxYDyghK9P6HxthbXI6rG0C5wX
	0D5yrK2WvC0GTXOFbUCOs7tBqNQPC/2uJUGYLeEo+qE6Am6Vqj15XXluoCUpu4OPjb8+Ouium5A
	TEV+2FZOOa6JwMkIfwVaY0v9imiXA4cX4YAr4OZj0g5zIJuVM7F43ONAbkYWAG08G2nRM2IEh3+
	15Ym5EPH3Gq9/2pQlvCD8R0e5KxvOYdC9UjfTLLuDSEFlrydpJuRE03s6TGlp7UmVb9xQkfsNgq
	WHKUBX49z/gi2IWhY8iS/nPRV+YfocxABd4gO/empm59lvv9ZaA1
X-Received: by 2002:a17:907:9725:b0:ba5:7cce:979b with SMTP id
 a640c23a62f3a-ba57cce9982mr788824666b.39.1776840674204; Tue, 21 Apr 2026
 23:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-17-joannelkoong@gmail.com> <CAOQ4uxhK4dy-=c_5oZKZW08+a=P0vN75q8A7RAWNnuhdeSVwAg@mail.gmail.com>
 <CAJnrk1ZySOkK31eQzUjGKj6pZhiHHEFGcBOk2Y0ybNqtc88a=Q@mail.gmail.com> <CAJnrk1bZVcnZUDQ05nS1RZUBetTQc-JbBrgh93XTkX9fwEqQmQ@mail.gmail.com>
In-Reply-To: <CAJnrk1bZVcnZUDQ05nS1RZUBetTQc-JbBrgh93XTkX9fwEqQmQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 22 Apr 2026 08:51:00 +0200
X-Gm-Features: AQROBzDSl-9ALno9EQPYaZCU-PfcpMzeM9mKBsd2keLkU7I-9AUZUt8rK09DZFE
Message-ID: <CAOQ4uxjEuBR5chyxeG30AaCabeqrErKbE5i8LeXZZAHXgoHAPQ@mail.gmail.com>
Subject: Re: [PATCH v1 16/17] fuse: add passthrough open
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 6:23=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Tue, Apr 21, 2026 at 9:19=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > On Tue, Apr 21, 2026 at 1:21=E2=80=AFPM Amir Goldstein <amir73il@gmail.=
com> wrote:
> > >
> > > > diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> > > > index c70478f07d6a..eb55c4b42a4e 100644
> > > > --- a/fs/fuse/passthrough.c
> > > > +++ b/fs/fuse/passthrough.c
> > > > @@ -282,3 +282,62 @@ int fuse_passthrough_setattr(struct inode *ino=
de, struct iattr *attr)
> > > >          */
> > > >         return fuse_passthrough_getattr(inode, NULL, STATX_BASIC_ST=
ATS, 0);
> > > >  }
> > > > +
> > > > +/*
> > > > + * Open a file in passthrough mode using the inode's backing refer=
ence.
> > > > + * Called when FUSE_PASSTHROUGH_OP_OPEN is set on the backing map'=
s ops.
> > > > + * This skips sending a FUSE_OPEN/FUSE_OPENDIR request to the serv=
er.
> > > > + * FUSE_RELEASE/FUSE_RELEASEDIR will be skipped as well when the f=
ile is
> > > > + * released.
> > > > + */
> > > > +int fuse_passthrough_open_inode(struct inode *inode, struct file *=
file)
> > > > +{
> > > > +       struct fuse_mount *fm =3D get_fuse_mount(inode);
> > > > +       struct fuse_inode *fi =3D get_fuse_inode(inode);
> > > > +       struct file *backing_file;
> > > > +       struct fuse_backing *fb;
> > > > +       struct fuse_file *ff;
> > > > +       int err;
> > > > +
> > > > +       /*
> > > > +        * This should always pass true for the release arg because=
 when the
> > > > +        * last refcount on the file is dropped (see fuse_file_put(=
)),
> > > > +        * fuse_io_release() needs to be called on the inode stashe=
d in
> > > > +        * ff->args->release_args.
> > > > +        */
> > > > +       ff =3D fuse_file_alloc(fm, true);
> > > > +       if (!ff)
> > > > +               return -ENOMEM;
> > > > +
> > > > +       ff->nodeid =3D get_node_id(inode);
> > > > +       ff->open_flags =3D FOPEN_PASSTHROUGH;
> > > > +       ff->passthrough_open =3D true;
> > >
> > >
> > > I think if the server did not see the open and did not provide ff->fh
> > > then all the file ops that carry fh cannot be sent to the server. Rig=
ht?
> >
> > I need to research more into this but my understanding was that the
> > logic in the patch avoids sending any ops that require ff->fh. Though
> > maybe I'm missing something here...
> >
> Ahh okay I see, I'm missing FUSE_IOCTL, FUSE_LSEEK, FUSE_FLOCK and
> some others. Sorry for missing that, I'll fix that up in v2.
>

FWIW, those are all optional operations that already have
a default kernel implementation, so I suggest that OPEN passthrough
implies that we just skip them, same as you did for FLUSH.

It is worth mentioning that the atomic open code path still goes
through the server, which means that server could return
FUSE_PASSTHROUGH_OP_OPEN entry and either opt-in
for FOPEN_PASSTHROUGH or not and also that the server does
provide ff->fh and does expect release in this case.

Semantically this seems fine, the only thing to watch out for is
that because FUSE_PASSTHROUGH_OP_OPEN is for the lifetime
of the inode, it is almost as if ff->passthrough_open is redundant,
only it is not, for this first atomic open.

Maybe the mental model would be simpler if atomic open
would send RELEASE to the server and use the
FUSE_PASSTHROUGH_OP_OPEN semantics
(force FOPEN_PASSTHROUGH and no lseek/ioctl/flock) for this
first open as well, to be more consistent.

Thanks,
Amir.
