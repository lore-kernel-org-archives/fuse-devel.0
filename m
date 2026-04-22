Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD061175A92
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 05:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776835383; cv=pass; b=gYIwAxTQOlQxz/gs1yyKb5LQwj6wHLSPARnd58Ecn7GSq5vZt5dA+FUNu41dnumf4F8heuJcqLRdYOX34skGlhxfb8O4YGRX2DfshL/bFGuudj42KwJfwWw35755d279KmPM8EB08rugiSI28QYsfBfuvQGCeTRLIZyq78WTHC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776835383; c=relaxed/simple;
	bh=u+rckCGV6AFbymaos8tXc9DWkTsd5MJKeWWxL4smqEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCniLqMpBN/DHS7FBrFMSvUdUveqp2WmJharlYbWPYY8i9ZA1gR3CJS6nQIl6L5LPK+ns2RofXtGc5B0lDHAFT0DunPMRpXoYy95H5kg7W1rjZAOCifHspwdbGFGbMBbqU1KOrilIcytfzkcHshGqJ68bagEw0/6LiqN9RzH070=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvPd4NUm; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvPd4NUm"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9d9971d059so738385166b.2
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 22:23:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776835380; cv=none;
        d=google.com; s=arc-20240605;
        b=Co4eO27FJg7ty7KctPRZlCoJ/H9BPYaFMLJc8CTzP9PGNF+QMIttaSq1URqQSWNaPO
         9ZnGLKL753KP6piKleoz/0+5Nqnnv0n1GXl8C5CYpmRWCj9Z/VUa3xyC4xvhpJ70HuJA
         PVkFIRZsRSKgnCTcYPkTCwgaLgoBqdl6rlWrVGsUDixuLMYBedSebNltNwPexJX1tUIm
         Buba04HWAjQdHAEzVWn5j4SnKJqaVBag8Ut3VU/I9m7CubdZJduEseZFj+qvE05/dII6
         FTTIMZduXWClN5j7DmD7SNXQTfWLAKqZpPxrKLUW3j/dmWF77Ql4/o/Hss2/IoeWbdIb
         1K3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fu7S4rrPNP7MCTcLdmyoGNNTyvQDvszdO3xVGYmxMzo=;
        fh=J9xDSotYWRSXuA5i3kQBcoBgmOKWsRe/fT23+i6jPQE=;
        b=RVd6ECVKIsxZlU9+EE/EX3lEhhQ2T85XqZNRzYUzdCKzhKQGgaG7wJuT6xz6/4fcu0
         CmSq2cAMr/79LaiZpnSZvJKFe9p9BH4Gv0uNSuj/cOPR4VHTp6XQeshORROPFz/xmRoH
         3WNF+dzNL0o6wGiL6aifdHtQGuPHIW57D9qE8fzmVC5WOWPvDxEaciCqogIkkQ3Qd6RE
         r4jK50mQkFvrHARx+LESzIKb4rGtFst7o48h3so0eypTVajCSgKHXd/rKu9BnDEuJuQ7
         PcGtFMx9EffeRksUiBVjBu0ZfR9bPj2MM91k7qmor5nh22qNZLgA9k43ZonCulPTEuJ/
         CJBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776835380; x=1777440180; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fu7S4rrPNP7MCTcLdmyoGNNTyvQDvszdO3xVGYmxMzo=;
        b=IvPd4NUmumcjZu9YdVgBeqxwFmaLJy7VDXoLf+nJw6/zCKb8Toin2eyWaOHPXsCE6D
         ddmvu3tyjGBrx3fM5etO2815KYUIhGzg+YmrI3SmTtKFhUvVarxAeiHwr5rIIyGHYvjq
         LQ/ZE2E78m30910KIvit3CuYt0HQaISMma/J5j/QPYxoQ4CccWs01RXfk0RNc4iktwWx
         ubwPMFZL1E5qzElwRa+SrArokteTWPoOoMPDh7xysvZjj9l0ax2m1icqb+l6ccOET1Fx
         koBvWLww2Q++UisFPUT/1QN0XgBOzhD5zDfhG7nX+0pOfBbvJbNE9Y9omsBckM6mzau9
         wdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776835380; x=1777440180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fu7S4rrPNP7MCTcLdmyoGNNTyvQDvszdO3xVGYmxMzo=;
        b=DhD/9JVsM3/iPcvFE3+qGKNAsxhnPqX6UfTEbPqiwKIqAMlJAgzFCqep9V/jzQKY+x
         8s1NJA0sYmcCSkawkUZYCr1P7luY5H+QucLuD2Ql6n129No/qexScWgRJb2JWyNR1YXX
         d+NXTaT1vgUPf8p3twsRlcYba6nUd2ZRUAe5QT+rrA5HZqhgogFH5bJmgj0hBAor0UGi
         +T4yoX7Jv6Fh8nDDOszn+HivGKSlDtJV/U+L7nBUEniilD8strf6ysqzfREszs4V0xl8
         YUa2LVPFNT9yoafBSSoGNePFoF9IWS/mF7Eab4CBJKvBWKa0/gv8SbVNuxVqSPmK3akh
         19dA==
X-Forwarded-Encrypted: i=1; AFNElJ81KvwARxLpRJXQe0SYKsF+JqwxCVJDCf/7qfBkCx9rbfb2L1CsDP3CfyKr3l+wQODVGttoFzYF+u5p@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwihoj/1RYz8/rmZdK9mt4E9OvJbHblSkK6QKh5epQXBq2vJ9R
	qi1ChdZK+OK2GBqszyH1oToXGV/Rkko+jkuaUpk7VhFxroxM0B4w2/eVzHQ6KuuGWaaZtnt+0KV
	EmFOSa8LIHmIOXcOhWLAK6CBMGI7fS5iPIKsOYlA=
X-Gm-Gg: AeBDievP4JruNWCLBAs9gMrsF2djhVvDafHwBnWA7xTq2D2ha9jyG1XWkjVonfgER6p
	xjo0ebt4DN2Dc8QkMqaLZAKs5t8KSOHrM7I9QEpdu1kActlctlQ4yTIN2U6D2VRXF0hdSGYNwvY
	Ua1ZcMnfw7iKYyi3kBbIJgpxHxzmC9bR0af1latASngsxFaFAvJfdfUlR5JDih+1K+z+W7pobWe
	aJ3VejipghKeIq3R8r7LO3zDjq1wZtHhvgVeYaJQLATIkmHymHZFZYiDAku0/4uucP1gxOCSaGZ
	eZ/15cGVzAZhWW7pSUecjPJDcVDgjsSCTGuQHHbzGKRrZcNTxfP7
X-Received: by 2002:a17:907:78c:b0:baa:3b6a:629e with SMTP id
 a640c23a62f3a-baa3b6a6998mr207671466b.41.1776835379652; Tue, 21 Apr 2026
 22:22:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-15-joannelkoong@gmail.com> <CAOQ4uxg7jaA0FdLW6uzZBRX=m1Xw4v-k7zeQx7kYcpFwFDpf7A@mail.gmail.com>
 <CAJnrk1b79N3r8-ZkuA5tZKN+Prz96KKdHtS=bNzO8No7thbqJg@mail.gmail.com>
In-Reply-To: <CAJnrk1b79N3r8-ZkuA5tZKN+Prz96KKdHtS=bNzO8No7thbqJg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 22 Apr 2026 07:22:47 +0200
X-Gm-Features: AQROBzCIvDFCWXwS5dv08UU0TWQlFUOU6S6GUHX-RCuXXgn0vc-3iSsO42jXi8s
Message-ID: <CAOQ4uxipQJt5zskb_THxueGi_MXpFdywFiGpd_nmWeY_sMHwzQ@mail.gmail.com>
Subject: Re: [PATCH v1 14/17] fuse: use passthrough getattr in setattr
 suid/sgid handling
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 5:48=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Tue, Apr 21, 2026 at 7:25=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gma=
il.com> wrote:
> > >
> > > When refreshing i_mode for suid/sgid kill during setattr, use
> > > passthrough getattr if the inode has that enabled.
> > >
> > > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > > ---
> > >  fs/fuse/dir.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > > index 637761de2c5b..ff9a92d8a496 100644
> > > --- a/fs/fuse/dir.c
> > > +++ b/fs/fuse/dir.c
> >
> >                 /*
> >                  * The only sane way to reliably kill suid/sgid is to d=
o it in
> >                  * the userspace filesystem
> >                  *
> >                  * This should be done on write(), truncate() and chown=
().
> >                  */
> >                 if (!fc->handle_killpriv && !fc->handle_killpriv_v2) {
> >
> > We should probably enforce a dependency between those two and
> > passthrough of SETATTR and maybe GETATTR - not sure what
> > the rules should be though.
>
> Not sure if this is what you had in mind, but skip the manual
> stripping entirely if setattr is passed through since the backing
> filesystem will handle it? eg
>
>   if (!fc->handle_killpriv && !fc->handle_killpriv_v2 &&
>       !fuse_inode_passthrough_op(inode, FUSE_SETATTR)) {
>

I was hoping that this will not be needed because
PASSTHROUGH_INO feature will require HANDLE_KILLPRIV_V2
and then either server handles killpriv or killpriv happens natively
on passthrough write/trunc ops, but never need this explicit non
atomic code to run.

> >
> >
> > > @@ -2524,7 +2524,11 @@ static int fuse_setattr(struct mnt_idmap *idma=
p, struct dentry *entry,
> > >                          * ia_mode calculation may have used stale i_=
mode.
> > >                          * Refresh and recalculate.
> > >                          */
> > > -                       ret =3D fuse_do_getattr(idmap, inode, NULL, f=
ile);
> > > +                       if (fuse_inode_passthrough_op(inode, FUSE_GET=
ATTR))
> > > +                               ret =3D fuse_passthrough_getattr(inod=
e, NULL,
> > > +                                                              STATX_=
MODE, 0);
> > > +                       else
> > > +                               ret =3D fuse_do_getattr(idmap, inode,=
 NULL, file);
> >
> > It does not feel right to passthrough GETATTR if not passthrough SETATT=
R
> > in this case - I could be wrong.
>
> My mental model was that if a server wishes to pass through getattr
> but not setattr or vice versa, they are responsible for keeping the
> state in sync with the backing file. I'm happy to add the check in
> though if you think it's better to add this.

Though question - I am hoping that we can avert it by never reaching
this code with PASSTHROUGH_INO enabled.

Thanks,
Amir.
