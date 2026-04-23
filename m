Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F93864
	for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 00:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776902626; cv=pass; b=gIr31bBk4MQ4ncYrxRFYQM7CzbsgF/DEbIelR2CTyN8YIzBF3FtRdMqdvQvki+d3psSweSlsZArtZ7uyl1IYznV1P6rTUC6qrk3G5a+mQVQ9ARe3Ij42ZBjcWlt3nqXx8JqUbU+uQEzYrqDWDGvcCkOWm3sE3skAhA7uB2z9ObA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776902626; c=relaxed/simple;
	bh=ZkIvi88WlnzzHouK46BhdZQo02oKHrLZ7ihR5vMiRSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wwo0ICTYKAd67i4DaAl+VRU1bXZBUk9it5QXPtqDMaM8P1lholon425Wy5FQ8bUBT64MwQLgb2QfmXothtl75UE9UuxVwQcP/X6tCMUEC00Yimqj+dUnIhNuiDuPs1sCVE1UgKYRyxLQwOVihwxjbOT7FaTCXwliyXFLmGLU11c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlQtG9FS; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlQtG9FS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d572f7437so4011566f8f.1
        for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 17:03:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776902624; cv=none;
        d=google.com; s=arc-20240605;
        b=ZonkcARxJWitzYILXQrWabeotT1jzOPMk4A9BnY7XaBEN+FETUCLfbuInLMaAIGD71
         jnlEef+CJvI+lVL9gMkz5p8Mlu84cKoFbC8IZoV+e+9DFlf4Ryd9vyQWEkzgQzCFfzlm
         PvKijggrTapoy7oxYfHYOLY2CG5mjVtU+Qq/WplKvn0lv73YzSYxYpPS49dZeOWvrdDF
         l7qI0TvDlpV3wgY6oHPXlrRAazkh1KGV8ZjjmRnEmoETHYc/y/MfQn7PVJqsWaeLG88G
         i70Nd6+hEIq1wkoYqE96ZSwK8tIS5SpuPAMiGirucM9mrGJ3+RtkRBSpdaQXQlmVyWoZ
         Amcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=scEyHM4/LQTHF7Pnoidv9KoG3GAuu4zhkrBKDvfNtbs=;
        fh=tazLfGMkmK1G0gY76pU6iGu+pxq1egRfEtpDrvLNhkc=;
        b=MzK7Iqzwi3pRn73xb0X1O7MryjqeXUHpPiRPJ0Kvp/8jRglzxRHmysm8s49SLWvEnk
         KTIzbU2cg8etfFQGJuYl5wMnraQor9g5m7sEraLaFpvdK85lahoT/5IDL38tziApZQPt
         q1PTZvn84dPHIylfiizT4QMbIHwJRyXkJ5+38xRcaulvD+VD4rxo9/niRe0WrpLh25ey
         pZGUKswXFQULh4pZRMRMOiuvcHYCaO+tJFY5K329G0U2Ld/bVYIi5C+mrMv5ZqHWst3b
         RG37pi75XBELlHwcptnsyA5aSNqF/l4o9uPyahsl/G70Vhscmio7QnAzebU3X73wLsag
         Iqhg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776902624; x=1777507424; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scEyHM4/LQTHF7Pnoidv9KoG3GAuu4zhkrBKDvfNtbs=;
        b=SlQtG9FSvGgTGWb92Qs0TrjpzUj/U4FAZEU1zGZLjD/HolNojbXRDmoFUVEdjRGV0U
         2I0855YJK1uMutcIZBrUDm1AkGlNOkoCgb6yEW3mTjN7+BZoaO/nWEmm99H+lh5iyi75
         elomFhT3pGqRnNgJnPWPyxVB4eT7tz6BaEFeUg5nZb1BcE9Gbfb+TigS/VhJglrb5RZU
         TlVudYTETMG17N9u0WvrMaqn/lKIGmZnwG+KJEECZ5jAtu7Bm+Q7FM1CA7gJn3o0wn7i
         ThoIExcgA+BSn1kO9UILtDfN1Rpqt6tdZkMdGC9kaV16E8gpLCIn3T1m4wgFK2awwyZy
         6aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776902624; x=1777507424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=scEyHM4/LQTHF7Pnoidv9KoG3GAuu4zhkrBKDvfNtbs=;
        b=CT5gwTUGc3IhZHu6kTQj+yNkRgJ7Qvrv2DmbCQM26Hd0Q/6KRQtC/uU4OliJljxbcZ
         BRqHuNIkwWvI7n1lbJXfEllDc0mL1wtu6wF2eR0leMU2Iezx1D11071JbPuAj8aQpkaV
         IgYP4CyzYdi8E3KSmVIIZMoof6vg9r5huxvGxCvu/+eIBTqI7U2aVxfvqKgdaOwLDImE
         SFCzEHIzxbji0yj7aS2z7zf78bdtG+pwUt5ue3DhysKfvxJn0f3NNKgq8ikMj6OZ4a4r
         VhfCB8Zo24m7YM9ZydMGQOL54fuzn038LlhU2KWWlWjSxglvc81lS1zc1HUZeomgunKV
         luvg==
X-Forwarded-Encrypted: i=1; AFNElJ8XCx+QSVhUe9Fp9vchYpk/poRsJMdidI7gplzKBk3lroY0OJKO4a0i0KY2W8OfSwu1GCGQfboG6hHd@lists.linux.dev
X-Gm-Message-State: AOJu0YwLPQ5LO6MwvTnva99mHId60Q6v64a0xNKmHHF1ckZagzWv+qJS
	wY9uJ3g55DZo/GCdht538Tv0Jf9yhrY48mGqa41BSdlgyBIOXB/o/K1Ho1AwfquDyvtBPDCKKy1
	eGwGCKnH2Zx+f8GMmLXIQvVQWeztfbho=
X-Gm-Gg: AeBDiesLmxoIa4GOEbK5eutiHSXjwlCKUGrpJgB+ChovZHY1zaNanrJvadCQsyagXz9
	irIKmnlBVmGkfgU/9QAxDPRSjDNCaWr2UKWnN0fCRqCSUbX44+mb6WyNd9TPSK36EAu0RRewgo4
	XDB3heU2HbmLtH3Geq3wadORMYc4m8WULHEIji4JTbbjRlzxQViw80Ss8rpc/VlVcjbG8Q0OwnV
	NzjfZuN5XB7LOxBRZVuV/bpRCBrLAYjDwmiZtW6T+OHnppfwcIC+r2ZyF70fzfJCgbsA9TE0Vj+
	yQRCnjA6Ugn1+4M4
X-Received: by 2002:a5d:64c4:0:b0:43d:7633:2665 with SMTP id
 ffacd0b85a97d-43fe3e1f739mr37156242f8f.44.1776902623587; Wed, 22 Apr 2026
 17:03:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-15-joannelkoong@gmail.com> <CAOQ4uxg7jaA0FdLW6uzZBRX=m1Xw4v-k7zeQx7kYcpFwFDpf7A@mail.gmail.com>
 <CAJnrk1b79N3r8-ZkuA5tZKN+Prz96KKdHtS=bNzO8No7thbqJg@mail.gmail.com> <CAOQ4uxipQJt5zskb_THxueGi_MXpFdywFiGpd_nmWeY_sMHwzQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxipQJt5zskb_THxueGi_MXpFdywFiGpd_nmWeY_sMHwzQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 22 Apr 2026 17:03:32 -0700
X-Gm-Features: AQROBzDKVIs7rQaA_dF4NlmYSbQ2C3iW9jKBgRoN7DknxnvHCaeSUYcmPw5fa0I
Message-ID: <CAJnrk1at1M_YbO3POTZTFLSR+rGEdyhiWQmEu0+rgtYAFEWdEg@mail.gmail.com>
Subject: Re: [PATCH v1 14/17] fuse: use passthrough getattr in setattr
 suid/sgid handling
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 10:23=E2=80=AFPM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Wed, Apr 22, 2026 at 5:48=E2=80=AFAM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > On Tue, Apr 21, 2026 at 7:25=E2=80=AFAM Amir Goldstein <amir73il@gmail.=
com> wrote:
> > >
> > > On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@g=
mail.com> wrote:
> > > >
> > > > When refreshing i_mode for suid/sgid kill during setattr, use
> > > > passthrough getattr if the inode has that enabled.
> > > >
> > > > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > > > ---
> > > >  fs/fuse/dir.c | 6 +++++-
> > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > > > index 637761de2c5b..ff9a92d8a496 100644
> > > > --- a/fs/fuse/dir.c
> > > > +++ b/fs/fuse/dir.c
> > >
> > >                 /*
> > >                  * The only sane way to reliably kill suid/sgid is to=
 do it in
> > >                  * the userspace filesystem
> > >                  *
> > >                  * This should be done on write(), truncate() and cho=
wn().
> > >                  */
> > >                 if (!fc->handle_killpriv && !fc->handle_killpriv_v2) =
{
> > >
> > > We should probably enforce a dependency between those two and
> > > passthrough of SETATTR and maybe GETATTR - not sure what
> > > the rules should be though.
> >
> > Not sure if this is what you had in mind, but skip the manual
> > stripping entirely if setattr is passed through since the backing
> > filesystem will handle it? eg
> >
> >   if (!fc->handle_killpriv && !fc->handle_killpriv_v2 &&
> >       !fuse_inode_passthrough_op(inode, FUSE_SETATTR)) {
> >
>
> I was hoping that this will not be needed because
> PASSTHROUGH_INO feature will require HANDLE_KILLPRIV_V2
> and then either server handles killpriv or killpriv happens natively
> on passthrough write/trunc ops, but never need this explicit non
> atomic code to run.

That's a good idea and I think that makes things simplest. It seems
like supporting stripping logic on the server side would not be too
hard. I'll drop this patch and make it explicit that
handle_killpriv_v2 support would need to be enabled to use
PASSTHROUGH_INO.

Thanks,
Joanne

>
> > >
> > >
> > > > @@ -2524,7 +2524,11 @@ static int fuse_setattr(struct mnt_idmap *id=
map, struct dentry *entry,
> > > >                          * ia_mode calculation may have used stale =
i_mode.
> > > >                          * Refresh and recalculate.
> > > >                          */
> > > > -                       ret =3D fuse_do_getattr(idmap, inode, NULL,=
 file);
> > > > +                       if (fuse_inode_passthrough_op(inode, FUSE_G=
ETATTR))
> > > > +                               ret =3D fuse_passthrough_getattr(in=
ode, NULL,
> > > > +                                                              STAT=
X_MODE, 0);
> > > > +                       else
> > > > +                               ret =3D fuse_do_getattr(idmap, inod=
e, NULL, file);
> > >
> > > It does not feel right to passthrough GETATTR if not passthrough SETA=
TTR
> > > in this case - I could be wrong.
> >
> > My mental model was that if a server wishes to pass through getattr
> > but not setattr or vice versa, they are responsible for keeping the
> > state in sync with the backing file. I'm happy to add the check in
> > though if you think it's better to add this.
>
> Though question - I am hoping that we can avert it by never reaching
> this code with PASSTHROUGH_INO enabled.
>
> Thanks,
> Amir.
