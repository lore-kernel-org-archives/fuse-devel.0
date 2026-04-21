Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364F9259CB9
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 23:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776813138; cv=pass; b=kjg+YYzpc0dg08XkPsXGAVif/KK+aHfLoA9/PW8KE32D83VlRWQ5mtpvbazlCLrR1PPKQd5qhHNPl77MoD4ZDpcr7KRYOZpqJbLV/4OSS+rmCc9LeWXmodbKR2NgEtqAc1Z5EQa4dFkfCR+DPn7kEU+7BbtuDrBx8YDw8uScNOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776813138; c=relaxed/simple;
	bh=iFS9U7zkaNzyv3Z36cqvMjg5aJ5lY65QIIrR0njpCUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JnID2OKWv7Z+1Ic1oo8dYf418VSwnEN6E4O25poUxy1Y3TcgIjk5KNw0wz27DjAsAveK0CdX8msO6sl9di+CKSzQ567zDyhxBZfSmF+HQ+DhHzCnadSVyCPPQhoiXgRJF68iYRTXJJY+tqapN5ulFTAi6ekaeBg+GFZK2VisDDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiANVV71; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiANVV71"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48896199cbaso48828195e9.1
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 16:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776813136; cv=none;
        d=google.com; s=arc-20240605;
        b=K30usp1VzKwOsvefY3ZRAIbaRLlw7z1JCjAKkrw2gwFT6Nr4ZGkcT51OD12rZD3R3m
         a834v/d/aLrtI1nu9eze4W5umYetCdVueO3MFOquoxcgB7PuqlRdeoPKWmqD9aLzJ5ZS
         QpCju/2mN0t2RHWFXPjnID55qSPrwvAgUpuOkG6iU2I/iWeTB1AcW2fnoGEt/qPkGkCI
         Ddgm1BA412+/54wCMxfmSkYex8OgNDqOD/6vaLqkL1TVeFFyNUWAgtKAbtQNkdyZpw9f
         ffcsUzyP5TmNT2oKrntKI6bSmVA+xebfUqr5crfpFVoFQ+zNrwM7ArZns5lp63YzOiGG
         lrGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dEzX+mw1aoNB58yt+OZJ5NJypeaMNNSmMK0/f4KCnVI=;
        fh=fH+oLDSmGcefzqL+a8xqPPwA7nEc+KNu4ok9G+UeY+Q=;
        b=PaE8xJ/qdW3/rp7fRgEZnk4cyzSRXXCuyBfpehXDPNagUnejYF7yPVkIgv+Esmojl4
         TOIGfc5OIt7zsrdYuL+T+5PGoiwzPB4fMXsBNoNltGIpXcN5u28h229HYqDH3rMVgyGb
         YeoCwToBXmZhq8cHggj6VhNDXFio/S5HIDJ3kcX/9zn4aAjgWZShn/CYx2asvRULRXGX
         FaLe3ILcxXrE+FqCjU8MmKd6wic71NVHUQ+Ys0sXm55hFoP+pTlWoErtcy0FxE0wFKg8
         yKoM+Zr5N9D7xxQ7ea0RT2b5a2RsUOTaDWzjL34sySkMWunWnuWyPZYGQQgJqEQGdklt
         4KYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776813136; x=1777417936; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEzX+mw1aoNB58yt+OZJ5NJypeaMNNSmMK0/f4KCnVI=;
        b=fiANVV71P7SJcbD4Y69GpJOoU3mBmBdEJERsYVkLoRXLRo1ZB1/IeuNSHRJeirP0L2
         MVUuRzrETB5/QVZfo4S74GNIm+RckfYZclkV2yD5P01gSYYtQpu97cCoHxD0MDx9IOO3
         DdI4deEylbihSLnp+0d+fonw3aBPAJMMrlRSzGbcDczt8m0KRq+skpHNdm+xaMGSP4pj
         allo0YD+4UKxBW0nhV8Qbqqu/ZJfH11/+0J/gVyB1cPFKTr8mi0eWml9LUJeaXwn8g++
         AowWYxClwBfJrmj++po1M23IfwVFvsb7lhN9K0YmmYxjT5sbSQkqQlVuh9I+gcN6LWjT
         hsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776813136; x=1777417936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dEzX+mw1aoNB58yt+OZJ5NJypeaMNNSmMK0/f4KCnVI=;
        b=OmzIYCj/u9IG0QfwHiC7WC9xc7QqRAU+/5iMG8vGxbnz/HPhMpQCGf8N/6kiOupoVx
         qxryalsQFsv9yt9X9ezX/MeYhSnp31tzY3Ux/WnzbiN7DhOxbv7zTSe6kpyfbLRaQhJJ
         we1clraNnDyiHJa0J0P8cLcYVH50nGhlmcFCNzx+xVyv619XDKq2XVHiDxT8t9gOqqVq
         SP0LE0YafEstXOJ169mMH63RLdWmWt8IFVJRnJLONMr3DR295ZC4oylPi/K4Zi4xL0/N
         jdeECdtjTBIYGcNGIXA2/VVkiA0chbGSi9a6J8//2Z/Zmr5QVgsYcIzCR5IZCWEl6jAd
         Jojw==
X-Forwarded-Encrypted: i=1; AFNElJ+rxQbdlVVZtxnZdcryDHNMVuvPkXGphKtpsd0PC2Hn8+II6OVqJfiYU0a/SMOm9ZXCenBB8XeIfPVo@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7O2JTRHqS1zT4nbj0l3GpOVjZYkYuwoHfW+KYqE1rOq3PZJCh
	0CpqLaGwWFvWLca/54VlTd0+P4Aoj0Qj7okixSq0QP+zqZ997MEzKSGDQxH3Jc8g2NyAgljhCzx
	ffA6+utPA+aKkwY5tz8VuoUVemV8jAWU=
X-Gm-Gg: AeBDiev1+I467cmop8unfBSRAX3BPhKV/JT0rcuXptd55wJPqNWVIn7/xzYLddPtVTH
	1q7Dhfb6d5IKE1jAikIYwILvh7eAmeYMPXTxjRGV5L7lLkixa4+28eZ1JkAf6s4MoazYAFZgojA
	JylDQWTAdEdZq3esbOj6x4G+BYE4AeZ2CcBDIwtOjRgzKMWXVnKNqLjNWcSrDddvXNHTnsN/H9C
	rbLVfAp4GNF5M/QqwB4khiibmgEXfjSpmylf1EDFNmP4SYzWHXkAuXUaL40+12EFGFsaOohDO0R
	AQJT1bDyEhZDlsYSRNHHCKWNvqI=
X-Received: by 2002:a05:600c:c0cf:b0:489:1f3e:5f6f with SMTP id
 5b1f17b1804b1-4891f3e62a7mr100826295e9.12.1776813135488; Tue, 21 Apr 2026
 16:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-4-joannelkoong@gmail.com> <20260421211732.GC7739@frogsfrogsfrogs>
In-Reply-To: <20260421211732.GC7739@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Apr 2026 16:12:03 -0700
X-Gm-Features: AQROBzBvs71dvJm7SZs-9PLCQW4pnlk1mfaLFoi2NKklyAK2YGtYXl9xPeB7_rA
Message-ID: <CAJnrk1Z1pM6dYwqdS+GCbUY7CJv=EJ05vMMzpEvjUpRUaWGGbA@mail.gmail.com>
Subject: Re: [PATCH v1 03/17] fuse: prepare for readdir passthrough on directories
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, amir73il@gmail.com, fuse-devel@lists.linux.dev, 
	luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 2:17=E2=80=AFPM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> On Mon, Apr 20, 2026 at 03:16:23PM -0700, Joanne Koong wrote:
> > From: Amir Goldstein <amir73il@gmail.com>
> >
> > In preparation for readdir passthrough, allow the inode iomode state
> > to be applicable to directory inodes and prepare the helper
> > fuse_sync_release() for directories.
> >
> > Directory inodes will support cached mode, "direct" uncached readdir
> > mode and readdir passthrough mode, but will not need to wait for
> > parallel dio like regular files.
> >
> > Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> > Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> > ---
> >  fs/fuse/cuse.c   |  2 +-
> >  fs/fuse/dir.c    |  4 ++--
> >  fs/fuse/file.c   | 11 ++++++-----
> >  fs/fuse/fuse_i.h | 12 ++++++------
> >  fs/fuse/inode.c  |  2 +-
> >  fs/fuse/iomode.c | 31 ++++++++++++++++++-------------
> >  6 files changed, 34 insertions(+), 28 deletions(-)
> >
> > diff --git a/fs/fuse/cuse.c b/fs/fuse/cuse.c
> > index dfcb98a654d8..e168740351a0 100644
> > --- a/fs/fuse/cuse.c
> > +++ b/fs/fuse/cuse.c
> > @@ -147,7 +147,7 @@ static int cuse_release(struct inode *inode, struct=
 file *file)
> >       struct fuse_file *ff =3D file->private_data;
> >       struct fuse_mount *fm =3D ff->fm;
> >
> > -     fuse_sync_release(NULL, ff, file->f_flags);
> > +     fuse_sync_release(NULL, ff, file->f_flags, false);
> >       fuse_conn_put(fm->fc);
> >
> >       return 0;
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index b658b6baf72f..015f0c103d06 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -893,7 +893,7 @@ static int fuse_create_open(struct mnt_idmap *idmap=
, struct inode *dir,
> >                         &outentry.attr, ATTR_TIMEOUT(&outentry), 0, 0);
> >       if (!inode) {
> >               flags &=3D ~(O_CREAT | O_EXCL | O_TRUNC);
> > -             fuse_sync_release(NULL, ff, flags);
> > +             fuse_sync_release(NULL, ff, flags, false);
> >               fuse_queue_forget(fm->fc, forget, outentry.nodeid, 1);
> >               err =3D -ENOMEM;
> >               goto out_err;
> > @@ -910,7 +910,7 @@ static int fuse_create_open(struct mnt_idmap *idmap=
, struct inode *dir,
> >       }
> >       if (err) {
> >               fi =3D get_fuse_inode(inode);
> > -             fuse_sync_release(fi, ff, flags);
> > +             fuse_sync_release(fi, ff, flags, false);
> >       } else {
> >               if (fm->fc->atomic_o_trunc && trunc)
> >                       truncate_pagecache(inode, 0);
> > diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> > index f239c8a888cb..3da4ce73e11b 100644
> > --- a/fs/fuse/file.c
> > +++ b/fs/fuse/file.c
> > @@ -285,7 +285,7 @@ static int fuse_open(struct inode *inode, struct fi=
le *file)
> >               ff =3D file->private_data;
> >               err =3D fuse_finish_open(inode, file);
> >               if (err)
> > -                     fuse_sync_release(fi, ff, file->f_flags);
> > +                     fuse_sync_release(fi, ff, file->f_flags, false);
> >               else if (is_truncate)
> >                       fuse_truncate_update_attr(inode, file);
> >       }
> > @@ -408,10 +408,12 @@ static int fuse_release(struct inode *inode, stru=
ct file *file)
> >  }
> >
> >  void fuse_sync_release(struct fuse_inode *fi, struct fuse_file *ff,
> > -                    unsigned int flags)
> > +                    unsigned int flags, bool isdir)
> >  {
> > +     int opcode =3D isdir ? FUSE_RELEASEDIR : FUSE_RELEASE;
>
> Can't you figure this out from S_ISDIR(fi->inode.i_mode), and thereby
> obviate the need for the extra parameter?
>
> --D
>

Thanks for taking a look at this series. I don't think we can do that
here unfortunately because some callers pass in a null fuse_inode
pointer (eg fuse_create_open() if the fuse_iget() call fails).

Thanks,
Joanne
