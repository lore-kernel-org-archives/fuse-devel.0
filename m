Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4239336308C
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 03:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827851; cv=pass; b=J9SIU0bOwSowMZ+YjI19xHlu+Bm0+c1BtHlVqCNuJ9qzHAaZIBhzz8MOvzfeRDkiCBBKAncx8l8fgJQwU4mR36cS1iOJDHykXcVj5izeL1TYeY+/9AVddc0dgMatmodUEZbIp2gSHKNSg1zmDksTUQ80kQV5wRNmNCJgj7LvMGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827851; c=relaxed/simple;
	bh=89b5aEuEUMPiPWtgaCnPCov1mmXF0OrN1xeAiquRKQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXRI2R9PQCRyey2IrTCo+oe+YJILTQukSvKsfLXzElbxuU15Nkm1SqAt17ji5cupJ+H/ATwHS4yqiFhsd4prwT4UiGoUPV+AwFxIi6EXt07U1pm2zOB7KbxWthjbFt0j0U7MorhrYV9PULogF1K6wOH3aX/MY5Is6aGz2B2eySI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vjsce3c6; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vjsce3c6"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48909558b3aso40269655e9.0
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 20:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776827846; cv=none;
        d=google.com; s=arc-20240605;
        b=PbZwXIqCJQSajuivCn5hshNJuFNl0PI5+c8rbSvM6qOV+mF/+TSAxo3Gm8Q42KZmvm
         del4CrJby55j1s/lYmkHHK7EluNR0c7bA5Y+y0CTiiiKjKMqMNTvwyI4t5hwqpohFSj6
         HkZpCUe7JCiY/P7jj/CzygpGb6NdMOlSzhIJ97yzGNfasYUuyZYqEJQtAKl9PLrmdu4y
         Fpc9A2b/lCn5k/GUmYTISze5HD6RkcrwytjYwGZ1rxPlqmBxVtFrIcr6hqvoKl+V9YpO
         iOKv0Yk5MWHpfJdTcVVxxMSclno/yDFAX0XNhxV/0BIDpGkxCrQirVRtAmvMvqLl2RUJ
         9oKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lJx3sriugEDfN3SPyZw9jVIlZdp/m7BXH/2upTPSS2A=;
        fh=DkeD7Hne6RYXfYpDxMBAICduK9/iQW5RhEeAU6KMwQA=;
        b=Ir/lXxWDmaRti4aSVRIC/fgQ8kK6t6vsiZVM88hO76LiMb5p5jmyNpDxh2DRQjwfxZ
         p6WTuAQLJrmtmnH7ZKNppTxETIHWFtkCAHVhzpRThIVopBaTDPs3zcxXz9HjtB+GhT0M
         KmubMME5Z12fUoprdvdxaXGUmA4f7fb7FPBdX3ueicizkvi14KEwe2h/n0UW7oZa83qN
         +/82JXc/tHKONlyuCsec3kRHeTpPB4GYkUAUgaMnXNm3Y9VjgTKBUg3YWNIc67Bl36LU
         0GjmbgqtRGl4KCIh6ZWqc2u8MvsjVUKIr3pbYZr9Y2IYyAdsj8pIRtpwY8CbZCHL82ne
         93DA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776827846; x=1777432646; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJx3sriugEDfN3SPyZw9jVIlZdp/m7BXH/2upTPSS2A=;
        b=Vjsce3c6WdEqG2ivD7KWhAFi9caBu360RoNp5AvNAybULcGbSr7Raw9EvWEkIBL4ax
         iOXBfm0yvfZ8uHR/rHc2L5opiJiIyGYuPwixQLxPoi8osNxHXmMBEJ1pOmS/qpCQXWLF
         G3a6alYi6O0TZRYYETfeScQYqxzO6iZgKBJnskTC+kdiourw6CN1hyh/v/c/YZAj2mTd
         mi6ff4T2cZ722fNjBoHIX/qEPO0gkGaxK7NmigRSyO7r9QUfEbPZfJ9ZN8S4D5ReAOCv
         A843WGwxKVhEUk0lZj4KO7VJi6VZfSXKpMh35Ku66w9uYoLACXMamIfc/VagWyk9yufw
         VLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776827846; x=1777432646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lJx3sriugEDfN3SPyZw9jVIlZdp/m7BXH/2upTPSS2A=;
        b=OzQQzx1FC3kW6/en8cfYLnrPm/x5Ez5kO0MaAKqHwrDzBYkAoerxMJjAKStBoB+U+f
         vHQQS0WJpCrxakgfsT9Ivp3XYRaAJ+UASI2a/HThdnUI/Qh8DcRmDbr+mJwlzA8dwFw7
         OUR9qJ9P52iKsbj6F874CIRqmmYEoAp2WaaDvZWS2ie/GcgSZ1dF59NvPMBM4MpzYl1v
         YXK0OSJQd8ndc1Qs27uigc0Qk9fpseKaMG8MOyPR7ClHVw9+cyGvzKWualMQlT+YoXZX
         dFHozYC12QqG5R2O843/i81Po0YBS+B1eVgr9K0WG4PQaR8OW7oX+URkU8w4a3Vu5cxr
         HLzA==
X-Forwarded-Encrypted: i=1; AFNElJ+4Yx/VfH3U4xHTK4mhdlM+Iv2MxboV9SHkvmTNxcfNfeZEqbgx8z0gEAOQxL2eM2WxPcAMyo5X7xCG@lists.linux.dev
X-Gm-Message-State: AOJu0YwakIcE9cZDWmWFJ35kIz2p+5DLsJIEN2I5YAW6EWFb4f2/L3Qk
	8Z6RrTWm0hb++xBGO9+9WIf94bvpH5nKlHEp19tkrIhEuBY/kXCFPgS9PV4I+PRHNLEwbyf1wUe
	MYSD7yJvQl1d/Vm3MtGNMKiCi3GC8JeM3RwSH
X-Gm-Gg: AeBDietzPl9kdXQyH2HBIzHus3oqcQ/sDHUHp1qgxdP6bEJ6X5yW3xIGj7+8il5JBBa
	ByGz8FhjRMn1uwLaqVVxPTgqd9Eb+Z8mJXqISNl7pdCS4AGMWw9niOvLmbKwwI1gBg/7iE83AJ+
	yZ9LtcSMwBF+RP1+BhrV058bQcry4phHZAODmWpj97qxXfq3qPfONYWhw6G3vGTrrBgVijaroZy
	/QuBHE0sENoxVC8hDSKOz/pOqoDSU5CzOH8uK8NvyHAp29WNjgd/AKSsz+75LDJRKhPgTpezlcy
	9NQl7IEPAtRZVsqO
X-Received: by 2002:a05:6000:1a8e:b0:43f:de5a:eb63 with SMTP id
 ffacd0b85a97d-43fe3dc0dc4mr30305925f8f.11.1776827845706; Tue, 21 Apr 2026
 20:17:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-12-joannelkoong@gmail.com> <CAOQ4uxgCezMh3jdp519Lp9OZeqAyZHmc4Mp3FthJpfXhVoHEfw@mail.gmail.com>
In-Reply-To: <CAOQ4uxgCezMh3jdp519Lp9OZeqAyZHmc4Mp3FthJpfXhVoHEfw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Apr 2026 20:17:14 -0700
X-Gm-Features: AQROBzAcVuPOMBYukB7kPP1BE-uIn5JJ0KKgzP1OtX_Kgi4bThskg0V3UKMO0ww
Message-ID: <CAJnrk1aiEJxAqmeQNHBEwO1CPf+cC3-CAXvuzG8MiOJp1QyPfQ@mail.gmail.com>
Subject: Re: [PATCH v1 11/17] fuse: add passthrough lookup
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 6:23=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail=
.com> wrote:
> >
> > Use the new/extended struct fuse_entry2_out for lookups. If a backing i=
d
> > is set, associate the fuse inode with the backing inode that should be
> > used for passthrough operations.
> >
> > If no backing id was set, cache the statx attributes from the reply.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/dir.c | 92 +++++++++++++++++++++++++++++++--------------------
> >  1 file changed, 57 insertions(+), 35 deletions(-)
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index 0eacfef52164..9e9b77942dcd 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -489,9 +470,12 @@ static int fuse_dentry_revalidate(struct inode *di=
r, const struct qstr *name,
> >         else if (time_before64(fuse_dentry_time(entry), get_jiffies_64(=
)) ||
> >                  (flags & (LOOKUP_EXCL | LOOKUP_REVAL | LOOKUP_RENAME_T=
ARGET))) {
>
>
> Not changed by your patch but relevant to my other comments.
> The flow of this function is terrible.
> My eyes cannot stand non-matching {} they are review traps
> and there is no need for the else after goto anyway:

I will clean this up and submit this separately.

>
>         if (inode && fuse_is_bad(inode))
>                 goto invalid;
>         else if (time_before64(fuse_dentry_time(entry), get_jiffies_64())=
 ||
>                  (flags & (LOOKUP_EXCL | LOOKUP_REVAL |
> LOOKUP_RENAME_TARGET))) {
>                 /* For negative dentries, always do a fresh lookup */
>                 if (!inode)
>                         goto invalid;
>
>                 /* This code is deeply nested - and even more so after
> this patch */
>
>         } else if (inode) {
>                 ...
>         }
>         ret =3D 1;
> out:
>         return ret;
> invalid:
>         ret =3D 0;
>         goto out;
>
> These goto labels are useless.
>
> Perhaps:
>
>         bool need_reval =3D time_before64(fuse_dentry_time(entry),
> get_jiffies_64()) ||
>                  (flags & (LOOKUP_EXCL | LOOKUP_REVAL | LOOKUP_RENAME_TAR=
GET));
>
>         if (inode && fuse_is_bad(inode))
>                 return 0;
>
>         if (!inode && need_reval)
>                 return 0;
>
>         if (inode && !need_reval) {
>                 ...
>                 return 1;
>         }
>
> The rest here inline or call helper fuse_do_dentry_revalidate()
> because its a pretty
> big and proper coding style is that functions fit in a single terminal sc=
reen.
>
> >                 struct fuse_entry_out outarg;
> > +               struct fuse_entry2_out outarg2;
> > +               struct fuse_statx *sx =3D NULL;
> >                 FUSE_ARGS(args);
> >                 struct fuse_forget_link *forget;
> >                 u64 attr_version;
> > +               int backing_id =3D 0;
> >
> >                 /* For negative dentries, always do a fresh lookup */
> >                 if (!inode)
> > @@ -510,11 +494,21 @@ static int fuse_dentry_revalidate(struct inode *d=
ir, const struct qstr *name,
> >
> >                 attr_version =3D fuse_get_attr_version(fm->fc);
> >
> > -               fuse_lookup_init_simple(&args, get_node_id(dir), name, =
&outarg);
> > +               fuse_lookup_init(fc, &args, get_node_id(dir), name, &ou=
targ,
> > +                                &outarg2);
> >                 ret =3D fuse_simple_request(fm, &args);
> > -               /* Zero nodeid is same as -ENOENT */
> > -               if (!ret && !outarg.nodeid)
> > -                       ret =3D -ENOENT;
> > +               if (!ret) {
> > +                       backing_id =3D fuse_process_entry2(fm->fc, &out=
arg2, &outarg, &sx);
> > +
> > +                       /* Zero nodeid is same as -ENOENT */
> > +                       if (!outarg.nodeid)
> > +                               ret =3D -ENOENT;
> > +                       else if (backing_id < 0) {
>
> Again, the unforgivable sin of {} mismatch
>
> > +                               fuse_queue_forget(fm->fc, forget,
> > +                                                 outarg.nodeid, 1);
>
> This line just goes to show that the nesting is too deep.
>
> > +                               return backing_id;
> > +                       }
> > +               }
> >                 if (!ret) {
> >                         fi =3D get_fuse_inode(inode);
> >                         if (outarg.nodeid !=3D get_node_id(inode) ||
> > @@ -523,6 +517,14 @@ static int fuse_dentry_revalidate(struct inode *di=
r, const struct qstr *name,
> >                                                   outarg.nodeid, 1);
> >                                 goto invalid;
> >                         }
> > +                       if (backing_id) {
> > +                               ret =3D fuse_inode_set_passthrough(inod=
e, backing_id);
> > +                               if (ret) {
> > +                                       fuse_queue_forget(fm->fc, forge=
t,
> > +                                                         outarg.nodeid=
, 1);
> > +                                       return ret;
> > +                               }
> > +                       }
>
> This is revalidate so the inode already exists and likely already has a b=
acking
> inode so this is almost certainly bound to fail.
>
> And the same thing can happen in fuse_lookup_name() when fuse_iget()
> finds an existing inode - for example on lookup of a hardlink alias.
>
> I see a few options:
> 1. Move fuse_inode_set_passthrough into fuse_iget() and otherwise
>     ignore the backing_id for non inode instantiating lookups
> 2. Teach fuse_inode_set_passthrough() to be happy if existing backing ino=
de
>     exist and the new backing_id refers to the same fuse_backing object
>
> I am leaning towards #2 as this is exactly what fuse_inode_uncached_io_st=
art()
> does when many FOPEN_PASSTHROUGH are called for the same inode.

That's a really good point I should have considered. I'll go with #2
and fix this up for v2.

Thanks,
Joanne
>
> Thanks,
> Amir.
