Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F441DF26E
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 00:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776818437; cv=pass; b=WRDFi3UP7lwNeaP5L7uPJt9A6jt5bRXQV+1YGLKE0Md6poWrC4PeJXjvjNpru6dvTNM0/aL2JFqn8DjJhUh8bA8fRTDl3kjG2kRZEqHd1buyXxmTg/e5DrzWptsOu9WlGZjGRnwcWL7vYQygWm8yasfM4YpOs4aQY8UXzKkzhKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776818437; c=relaxed/simple;
	bh=jVhKHZrp63Bvnjiw5kQGH7auNXGHEIllPiMWVZocVxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVsLXfe3hPkfOQ3L8TzNJ1LfeQXxWNQfWmrRhsmsfEOijywL2HP6rlsl8niZS0t/eXEGK6UrD05MPqDSvzwXEtfpwUi41vwsbV0IkdiFj00xv6qzzO7BNKdKsUYyrpBCUxZqcdkbqSD5ntMDNOcSWDWw2VALmwcD6K0lKphFA3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GS2J9lCN; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GS2J9lCN"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43eb05b1875so2840455f8f.3
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 17:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776818433; cv=none;
        d=google.com; s=arc-20240605;
        b=ZQ9O6VfbPQiWoL13ne14Iuf/pSEDEP3Ss2WlCB9TMAkohWEg+ZOVQ+DGp9HTX8LZMT
         6b0lgSO4Em2QPp2WfjRBqHzimDM2NaXGmyPDkigzJbZZ3vCMtK0M2aSdUahbBQ1VvjpS
         L24LALAeBSeN4hazMBL8147btbw1kIJPAi3yaMbKobIX6hxE6Upa6DvM2/cfdrEeAET6
         2YmlVPbesrc/dHAfpJ3cr3/ojRzSfHHfj24BGtZpJ00ZP+Dhn4vn5cY4GsNtANvapedg
         dCIEj4EFT3hEK+njzdVfSg15LBV+dcowUo0OTf3zTd2bQ/Q6AXaPLnEQ/kjaePeKGNAy
         +b6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8wEOrSrxuCHZraNo7FDqNa7Tj0YY+DrttjKdfL9/isQ=;
        fh=yyRRRN15uRJfiDRZsoq8rvS4mi15jQRpwlxF89V0MtE=;
        b=CpFRW1isLR2/F0pjfbmL4IgEdqDacfZ1GTfMuTBj+Thtq8n621R6n0jmxyvajanr2W
         75yPYo1QgO9Z+i8kwF6Q8uGWQze/D0gRG0Nknjem3eda/dvHHPR0YVneAlPqpD/dGQmM
         mw4N0GnfOcDSd80umf1f9tOQ3r2zfvytLegFuGAv5efJEtfSPqKV+c08KuGnX1v++omc
         bxk9n+N1GKKiiHRhjLW5O6dcLGZvvnzukIZMHFiINqcDOjICy1oXpXFq1xGOosNBFg8q
         19lkFD1VsSXA9fU/HjSRXdC2KjCTDBhEACfqXVPLbmtjZWLR1WZ63THUOgYoKTeQoxbj
         EeMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776818433; x=1777423233; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wEOrSrxuCHZraNo7FDqNa7Tj0YY+DrttjKdfL9/isQ=;
        b=GS2J9lCN9vWO1HOPGpX0t17mbaJ0iD9EQ2qqJMrUlhqGlzZVOQJU5XIW+/rWyXTHFd
         zKS5RaNLaL58hlgp60DGHZOpZMFf1X/49zRXnoonVXbl3rMXiE8D7pGvY/OJJyoyepih
         ac63A6jNwHC2dsMxg65FxhvoovIVUfbZ+fyz2YAT15P7QXE2vw62PimcFC3Ff5Op9m4m
         82TVBZ8cCtTCig46lzZ01KBTqpwq3rW4J371OR6Nv++Ji/akA8x56DnpXeIQjN1dApRA
         uOBvWZh4eIgo1arLPQ9RB4kx1aT43s+jy/bKRVllnUeGJ+6MYxUzVl2UcYsH0wQQA6ze
         6/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776818433; x=1777423233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8wEOrSrxuCHZraNo7FDqNa7Tj0YY+DrttjKdfL9/isQ=;
        b=cRodaMG/DMS65eeQO3ranr6C0pZbCkNU/v3eTbiS7p0C15q9T7Eg7xjXYSp6Rs6B2d
         BTwY9RENB2AW5XdK4KkApdHfZMdgKIiO4+8R+oAyPFlIwjyGwzyXWrY3T2stSOnsMss3
         iJPZG9UuMmZf99GJVOR9FVYX1u9MB1i82qGxvPrgyqxWwYX3EF/SNybhRxYLRAhfibqv
         Unie+WddeKyYS5OxGf0z+pctczmD+nt/yoIkTiLJgxW/EgUXg36fUbW5VQxrAuaRgFT/
         bEml3qVhyhMOnbuqZ5m2AcnDQPH8zu42NZBWYUcIj7guuP7mkwufeKPjtt/gamRHTiBz
         s8tQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Kpxf9mVzHQc1CUzxcKAWl7VmVd0TXLSeYW4OlwOc3i8SyEpu+ZwLr4xOVG83w9F/9CKvwbPfSaqlw@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0yDDXKTFDXXYhO51SV4mKC+HvkRDcLquNILluBDCvZNWrCXF4
	QLsA9qb2G8p91OpsWm9uz6+AMKN3soT4CcKt7KGz2SaJYC34dudQvglPvrRLKjoj5fkyxUaDouS
	T5zVRplLUejjpIsSCCVlUy4oOq/q0c2Q=
X-Gm-Gg: AeBDiev1uAoh4mdIdUpFtZpN+u6laRQcZPsrvF3kS9sisSiw9HQ2pBWMGBlLlq36jEM
	SZ2j0S4P+UIqpoufaeiclFEo0uyd14m1fBgXAwcg5d8Ld6F52Ble0/T5ItB5XoUpl2Dw+8AO6sl
	PpqXN777WpvHlkAi1xdNB1VXsnrNsGdSwh4iB+ZMB80LhlAAwEiRU9DLCUo0uJLpvkf7fPn6PIc
	OpEzhSsmEZgVuPa4lYD59M0PMm9As6s9x9UlGpx4dz2/+CMri/+4R4S8T1lAe2MUldSdggcRneb
	o3vY74/UwZkHTfM5
X-Received: by 2002:a05:6000:2082:b0:441:1c18:f779 with SMTP id
 ffacd0b85a97d-4411c18f7c5mr12064061f8f.37.1776818432768; Tue, 21 Apr 2026
 17:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-14-joannelkoong@gmail.com> <CAOQ4uxi-cRwxjadAcxgs9X3SBRJWyPLik4hqkA6h=YDfSEK7pQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxi-cRwxjadAcxgs9X3SBRJWyPLik4hqkA6h=YDfSEK7pQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Apr 2026 17:40:21 -0700
X-Gm-Features: AQROBzD2qVwI4lks8PUVJUkSKtTDTXBFIOqUo2S99aQ1VEjqTM_EUKIGh9GI7l8
Message-ID: <CAJnrk1b=5vRgm1otKAiaeFJr9_J-aLnoVTp4MHAz2mBKtcE2dw@mail.gmail.com>
Subject: Re: [PATCH v1 13/17] fuse: add passthrough support for atomic file creation
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 12:51=E2=80=AFPM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail=
.com> wrote:
> >
> > Route FUSE_CREATE (atomic create + open) through fuse_entry2_out when
> > FUSE_PASSTHROUGH_INO is enabled. If the server returns a backing id,
> > the newly created inode will be associated with the backing file for
> > passthrough operations before the dentry is instantiated.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/dir.c | 44 ++++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 36 insertions(+), 8 deletions(-)
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index e5a7640fcd30..637761de2c5b 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -976,8 +979,15 @@ static int fuse_create_open(struct mnt_idmap *idma=
p, struct inode *dir,
> >         args.in_args[1].size =3D entry->d_name.len + 1;
> >         args.in_args[1].value =3D entry->d_name.name;
> >         args.out_numargs =3D 2;
> > -       args.out_args[0].size =3D sizeof(outentry);
> > -       args.out_args[0].value =3D &outentry;
> > +       if (use_entry2) {
> > +               memset(&outentry2, 0, sizeof(outentry2));
> > +               args.out_args[0].size =3D sizeof(outentry2);
> > +               args.out_args[0].value =3D &outentry2;
> > +       } else {
> > +               memset(&outentry, 0, sizeof(outentry));
> > +               args.out_args[0].size =3D sizeof(outentry);
> > +               args.out_args[0].value =3D &outentry;
> > +       }
> >         /* Store outarg for fuse_finish_open() */
> >         outopenp =3D &ff->args->open_outarg;
> >         args.out_args[1].size =3D sizeof(*outopenp);
> > @@ -992,6 +1002,8 @@ static int fuse_create_open(struct mnt_idmap *idma=
p, struct inode *dir,
> >         if (err)
> >                 goto out_free_ff;
> >
> > +       backing_id =3D fuse_process_entry2(fm->fc, &outentry2, &outentr=
y, &sx);
> > +
> >         err =3D -EIO;
> >         if (!S_ISREG(outentry.attr.mode) || invalid_nodeid(outentry.nod=
eid) ||
> >             fuse_invalid_attr(&outentry.attr))
> > @@ -1000,16 +1012,26 @@ static int fuse_create_open(struct mnt_idmap *i=
dmap, struct inode *dir,
> >         ff->fh =3D outopenp->fh;
> >         ff->nodeid =3D outentry.nodeid;
> >         ff->open_flags =3D outopenp->open_flags;
>
> Unless I am missing something, you need to set FOPEN_PASSTHROUGH
> in ff->open_flags otherwise finish_open will not open the ff->passthrough
> file (with the correct RW mode).

Currently in this series, the kernel enforces that if there is a
backing file registered for the inode, the server is still expected to
set FOPEN_PASSTHROUGH and provide the backing id in the FUSE_OPEN /
FUSE_CREATE reply. My original motivation was for keeping the api
contract consistent between FUSE_PASSTHROUGH_INO and the regular
passthrough mode, but I think you're right that this is just overkill.
I'll remove this restriction in v2.

Thanks,
Joanne

>
> Thanks,
> Amir.
