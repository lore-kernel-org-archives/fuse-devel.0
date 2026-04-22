Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A6F14AD0D
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 03:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776829722; cv=pass; b=QZ6qmVa7rgj7r5PUm8zejFw2tzMMpcW9t7dDhvn9zDmocWnFWaluwOYA9rg7ox8RbAIqmZdUMg8Mgi0ryDrUXrGoeU6GOZYMX6BC8XbyFIJBipg4qJIrlSfYcjxuBSKeokV90dsoAJjG8aEJf2sjXQ79YfYcbV+agi/KR0niTCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776829722; c=relaxed/simple;
	bh=kkc01Nq8JT9pBqXZc1sIOQ686XcH4rf5LRKmI5eAHyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMu3bC4dJeb0fSET4X5AtLf2jjyGrIo1dEVqDCyXvvrcJzJMZBZB6e6Mc1obqoQ5DLQwI+XcJQ00UZMy4QiTSQI3zBf41PVaUnZvOd8MTn9CsWT6aZJN4XirOtyFDihNEHc2My/LhYKghvzGn9/N751Tr5uSilJXGpLJUlLoGd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0W6clxQ; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0W6clxQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so62130185e9.2
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 20:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776829719; cv=none;
        d=google.com; s=arc-20240605;
        b=dTyTj2P7OomwrL60ZuT9/7PCB93Kur4mG0lMY+FRPQ7+CLFVg32H/+ZJhOhF9Wz1JI
         1kX55ju1iS7xX1i/BTB4mU0leGurV7g1Xul9uX9bVKuUMIK48AzRKlEeGdaLekD+aSdD
         v+1/gW7tXuQNwRakylUXtkEkMjnYeznGqkgrjjURzKAtXUtyrTZ1nQ50iHILmqIPYCCy
         lJK4l0kpJXmBItiiNiLAyO3JlKB95ZaHyzqmtsSQGi/6x+6ChBx+OOVpprUQUumw/5wb
         j5E6q6HmAtD0MkDqIDvVrx/NCI9nl59I943PPSxH1CYaYEKsH5FXa/PuiWM1fnt3URWB
         yh0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0LOP/KRw5I9Ym6Br94woIi7s5ba8lheRuWB5cM0JxGA=;
        fh=HvxxPp0LpJMggzSu82gS9Ou3MG8nWzqH5X1iRy6fb9c=;
        b=BFC13M2MnnDPc2bIsoq4ZLtewMU7BpqLQEHJJYYVHDa39V4x8mtCAt+RMyK1n5SPEi
         COla7hKk7eGypD8DSmoVbiccNKcdQlgZrJhuuhGzxFJ+MnGYVEBEtYAeLQnkfdDXmkVD
         GAK+shWslUQQOsFnlHtiKZaDPUgAkBoN0KrA/xG1ynEUU1FQ+bvk7D3Cpjw5EkTNV7Yy
         gkID/1dtj4i6PdqLVixbBriPRforNaVFAVUuLIum4ofjhcNqcbmUcOHOVyfmai/AYCKx
         63xve4M6GGZD1tJD8a2AOBKd/R9DbdcFgY/rmWSNCLs1B5velkeKSathp+91ub21eAdL
         xyzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776829719; x=1777434519; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LOP/KRw5I9Ym6Br94woIi7s5ba8lheRuWB5cM0JxGA=;
        b=b0W6clxQNaiguwFry8zgdsZsnbtZhEtTLh5b2vYnm8cwpXkmldphpvX1aI/XX7JAom
         921IaXauZhCuYZUAOIHBqC7tZri8K5qB9LZsrfCXp8VmHUGoV3ofpx2eJdhzW/UPejQz
         GKmZsZ0GtVuAJsk8Caiph7ghSbNy+hCr65Sdtwnuj/yKyctCGYhQflz39sDeKxBVxUj0
         f4Aq6xlnfg+eDvE76cNi7zu2ZzMaCIAv6gLw2R4FhxU9VyIK5gIUosDxTNsWhex+O6hy
         c/XNUPMpZNBNpwFI24cWAQdqclyf3bju1iqslfFif5cE2dzIVug+mPQAFfKDe6g2/pQl
         1GmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776829719; x=1777434519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0LOP/KRw5I9Ym6Br94woIi7s5ba8lheRuWB5cM0JxGA=;
        b=mMD971GSAYBcaxopCBTJV2UY2O7xaX31GlOYolqUXRRzSXMhIEuqm+I/MlKKjOPgQm
         AyGqQvWuqe2VlEp/koLY4cuiNiPh+xwr26s2ITNljF1pQS6JQ9cYO5w/FOkdgdKHzYeE
         VWj9AdyMB4FaPODL7Enq9b/8+v6S5dyPcvZAXS1tGfg7ImOm1GUINnmnPsft2/D8bZzh
         1XwkXhwY6ERFcCghHr3zjmicXn1F14gm3nkBV45FWyW2gUJfUacDQshM2xsW/oJwMOXe
         0SHS+jHCWuazcgxrBV3xNh2zCeVfl7pQV9clUb9uDWgWimQWL8zIDlLzpetQXYMdWfi8
         XzyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LQAHDhI7CI4pLKspw0M47OzrAkiHlmYDjqI6wOZYKKzQ6r64ILNJl25N3Er5xEPSH+hhhkCIjHbmR@lists.linux.dev
X-Gm-Message-State: AOJu0YwRzsiDQNNJFrodu1d86niY/J6qTuHGSDPgfBcMh/Pa3EvIOJV3
	hvBM9S0e8okNgsbr7tsu+FCuQ7Dyz3OLv1E4dBqXV31YZnNOJO5d1q1LuinvhVQbSEtcLnXTwIf
	9N3HwVup8Wpsrz8D2ViohYWX3lGeG9L8=
X-Gm-Gg: AeBDies81Guqa8bvw1pvoxuJBQHj9GBvKxTJU9Psgfuia0VQM/YWICfupOQIoLy2CKw
	QUWHaChe+eh9549Yem1XaDV181N2L7/RPh17vJpBWjmB/7LTrlf6H6h+pkhypgkasim37RHtovR
	J8/SrcdhKzYEfe5D6oz7R5SYkqvbWoe9ecuacV0Lhcp4wNcfPM2wN8QOxX4BNZgVALJzu6x2b24
	DEPgmMPPcJlOHuWhBE1jAfUTLJrmWqP2SuG+lXrRS9YNY3qquGbzxkT10x536U8eRoBk2WF2EYs
	aduBuBVATI4FkFBq
X-Received: by 2002:a05:600c:a408:b0:48a:592c:e632 with SMTP id
 5b1f17b1804b1-48a592ce943mr23897125e9.16.1776829719376; Tue, 21 Apr 2026
 20:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-15-joannelkoong@gmail.com> <CAOQ4uxg7jaA0FdLW6uzZBRX=m1Xw4v-k7zeQx7kYcpFwFDpf7A@mail.gmail.com>
In-Reply-To: <CAOQ4uxg7jaA0FdLW6uzZBRX=m1Xw4v-k7zeQx7kYcpFwFDpf7A@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Apr 2026 20:48:27 -0700
X-Gm-Features: AQROBzBHia27krxC4OK3PwYIqZ0JMUwMMdG1_kiJQqR_I1ecE8EUNMtLM4BhJbw
Message-ID: <CAJnrk1b79N3r8-ZkuA5tZKN+Prz96KKdHtS=bNzO8No7thbqJg@mail.gmail.com>
Subject: Re: [PATCH v1 14/17] fuse: use passthrough getattr in setattr
 suid/sgid handling
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 7:25=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail=
.com> wrote:
> >
> > When refreshing i_mode for suid/sgid kill during setattr, use
> > passthrough getattr if the inode has that enabled.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/dir.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index 637761de2c5b..ff9a92d8a496 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
>
>                 /*
>                  * The only sane way to reliably kill suid/sgid is to do =
it in
>                  * the userspace filesystem
>                  *
>                  * This should be done on write(), truncate() and chown()=
.
>                  */
>                 if (!fc->handle_killpriv && !fc->handle_killpriv_v2) {
>
> We should probably enforce a dependency between those two and
> passthrough of SETATTR and maybe GETATTR - not sure what
> the rules should be though.

Not sure if this is what you had in mind, but skip the manual
stripping entirely if setattr is passed through since the backing
filesystem will handle it? eg

  if (!fc->handle_killpriv && !fc->handle_killpriv_v2 &&
      !fuse_inode_passthrough_op(inode, FUSE_SETATTR)) {

>
>
> > @@ -2524,7 +2524,11 @@ static int fuse_setattr(struct mnt_idmap *idmap,=
 struct dentry *entry,
> >                          * ia_mode calculation may have used stale i_mo=
de.
> >                          * Refresh and recalculate.
> >                          */
> > -                       ret =3D fuse_do_getattr(idmap, inode, NULL, fil=
e);
> > +                       if (fuse_inode_passthrough_op(inode, FUSE_GETAT=
TR))
> > +                               ret =3D fuse_passthrough_getattr(inode,=
 NULL,
> > +                                                              STATX_MO=
DE, 0);
> > +                       else
> > +                               ret =3D fuse_do_getattr(idmap, inode, N=
ULL, file);
>
> It does not feel right to passthrough GETATTR if not passthrough SETATTR
> in this case - I could be wrong.

My mental model was that if a server wishes to pass through getattr
but not setattr or vice versa, they are responsible for keeping the
state in sync with the backing file. I'm happy to add the check in
though if you think it's better to add this.

Thanks,
Joanne

>
> Thanks,
> Amir.
