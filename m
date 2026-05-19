Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2033DEEA8
	for <fuse-devel@lists.linux.dev>; Tue, 19 May 2026 00:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779148916; cv=pass; b=L1zA+zffeb1bjOQskNCGIsQSEnOdKkNTk9fiBPl1GelG4QXHa02ioFH7yw/yBQDief4MQ7IxBEoQiQhxGmPZJ8pylDJ/bPdaISF25Eaqihf27WeYe8gUzL5pTW9T7Q6j3jpI9scbVofCFOgBSwx5jrKJvYK6ExWYT5RHwO1YbgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779148916; c=relaxed/simple;
	bh=cY7l1Ij5zQ3U1zGP4fqtEQwVnmsu108odect3fiSVlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzg4iHs2pUMdgMTo1tfbN3IaaxsDOP3+x7yKd6pwwGhj3fQ6ni7q6D3Wl1eY1ZZKZ+97PRku+juJ+xPOKK1GzAeRsEQf3P2Q6lOeSJYYi7uGMFZypK0zAiYhsAVHu01nMKmUToRPZMvW5Jq8WYbON2pt/FZPnQJxSjA+ea6/3Dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntSbCEwp; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntSbCEwp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso30616765e9.1
        for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 17:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779148913; cv=none;
        d=google.com; s=arc-20240605;
        b=hkO0AViTuywGxrOus5Z9rD3rTKSWMBSXc5C/bzImpQxM4lYmZY/LwsaQ68TwPbtc0Z
         YspuNXQav7/i6JdBfFHgJVI+Uus2may8u5YSRGLju1PcWfIkP0+I1CBJIyA3/1ybI46s
         8rmX37edTaDv6l8AzWDouAq7PZUTZv4otVtFkK8SIVGy3u9QE02+ki5Sbw6Daq35LFet
         Ge2rva78uNs9aQ3kiQwI6U4HBcyCXLswE59DtliQmStDaA+8cCM52rjTLw2b2N3ArVUe
         58Uu13Au4SJsahCiHNukBqa5+5OULtrePi8yh1ksoO+aXuteFEWROsYCra8MnmKGiNhq
         2rsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sCNABeao7jNEZWws74B/pC8MJAjwnqZTvtKCDOtjNlg=;
        fh=O+Ql49KpzkTbz2pai4rqZgC5y6zDZKXyDlgnh7iipiw=;
        b=Qha6D5Wwn4afy4KY/J6ht9BXfNKl/afEq0wMN4n05tw4CnDN1c9epBpYT5LjEChWrD
         13fWyhpROR8ZMIkAnebXrf5+6aSonQE9yAoge8veCfY5DKWttSQDqEv21CmVxOLc59vT
         HmK7NsDYRH/BoXo4jM7lo+nA0EDEXYxM5dlvuFdS90Ducu02Wx4+4ZoXaljqYxjLRhbz
         rmpJK+CKQ3PuQ8mCN04UBX54w+Fszo9lVEEMtWPLgi0zdj/vDrbiDfBRV2yOcuv4MbO/
         ze6b2eK3xbVIKdwr6jbcXM8J67nM4tRTKI8NZpMjM9dcjojd4g81fbm6y4lHAHuKudDv
         tIRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779148913; x=1779753713; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCNABeao7jNEZWws74B/pC8MJAjwnqZTvtKCDOtjNlg=;
        b=ntSbCEwpcHkSOI08mbCgyCvxFOjiKvXdbTuvSb//UXqbxCSztK8awbIllmiYoK5a3T
         Z0XMjVJ8e8yjGBCKuYsatEFpQCdLE2JngbL6sUBy58lv/4QvDFszglE1fpEXdKKJWE9c
         yE9sDAK0mwdQMV2HKgFDBhLXIdkSD52i87KW7MUH5JGpJNTp4blmg5IdRFqGWPovMxQJ
         /QkD1NxXMyeyKRiGvVZWl5zwGK+oblp8vQ6FVPomoqQZbRdcS9Nzaeo1LoFVPcK/fAeh
         Lvhv1y6uqhrZVmenme/Kmw9PpmyN0hYLqF8RB1Pvx0uA4vA6KXp8nRc2piXnRpXbcuG9
         3cZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779148913; x=1779753713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sCNABeao7jNEZWws74B/pC8MJAjwnqZTvtKCDOtjNlg=;
        b=DZKKfqPoFrPkSun2tsw6MsbLfcPVf8dor1YKWm5AsCsIb0rm+or+PQ1hMvcVwz5o7A
         lZQoi+7aKSnltIL104fUdcB6QE5+rne6I+GBbkZlUSrCMKbrOoZwZgoLY8zStauBzzHi
         QMJFgZdKC7ugEaFe1kJ3whO/cznhYlotw2UW00BCBbNdOMk2cGesXC+B7zit38gnwZyU
         S6laOP0KGDTPdx+Vm7VIyre27wiOuhJQIoaaN/GUS4eK/fDPhsQzpIqmAPnFNwHMU0ce
         l0bTgDtNa6Qp40JLyN7ZrRPpVj4aLbqfggRvsrHg74Z93rZTDgeSI/FGTaF2q6Cahc5u
         eQfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8C/SJXqH+95gcUggHBOQCJWRBdjT69q/4nRJrP8GtAMvsMyK5AjVdET22c55S3DCTaLR87+MhAudmA@lists.linux.dev
X-Gm-Message-State: AOJu0Yzno6Yk24qyXGYeWrs8s0Fg1Gz9XT06r+atJl0eN5DMrz2Bk3rG
	4yDdgu9BKKD0DkOOjHrNWqyJTDWzlOcP2Mdw+6iwpbrIMz6dAkwhWWqMBMoz7I8zR+EFzL/h9vu
	FyEZkBx3nWZwwO+qdE3DLWFO9Yn050jw=
X-Gm-Gg: Acq92OFogxsXCXUcCZokdX6ehFqKmISjO2QCpXXslEGRTZyk0ZGMlALZiQ6876bQqst
	AdeYH+0kv3v54ZqDH/vd9UTo8bVVZ4rL8AQ+QYkiG1lrv9QUN7LvoyaRjublJSsdFr2QlQiuXOp
	+svOQSp4H1tUmWFnr73zKNP1JmP1ByDWPDHnnjAtGe1QKcKh+likZd1Gd1tpRf/LQKpTlSRDR/t
	8e7Y5M6LG6K5/QUqcwRw5bsnFDUSEwX9yCzeHrTbnlJSeeye/Bl/BlKWtFYAVT3jAwC0Txe8f0Y
	COL+ig==
X-Received: by 2002:a05:600c:1688:b0:488:c21a:4754 with SMTP id
 5b1f17b1804b1-48fd646b8a0mr219247475e9.18.1779148913485; Mon, 18 May 2026
 17:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-21-joannelkoong@gmail.com> <CAJnrk1a9_MLyMebfsDe_=Rcd2+TaiD87pW4fd4ve8ZBQPCfGcQ@mail.gmail.com>
 <CAOQ4uxiJaLtcuGNrYej6WCzTfu=fFfy4VLj7pUmfM+hHT0Z3Pw@mail.gmail.com>
In-Reply-To: <CAOQ4uxiJaLtcuGNrYej6WCzTfu=fFfy4VLj7pUmfM+hHT0Z3Pw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 18 May 2026 17:01:41 -0700
X-Gm-Features: AVHnY4K7aLJXgYL7Z4ZYreCRwJgT_2uDJMFU082Qq7wg0A9bzkAxvr5ElbNXQSs
Message-ID: <CAJnrk1Y+YO79e=yvzKaBT9XcCV_ht899nQjzhQnKzJMjt4UVFw@mail.gmail.com>
Subject: Re: [PATCH v2 20/21] fuse: use passthrough getattr in setattr
 suid/sgid handling
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 3:23=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Sat, May 16, 2026 at 3:20=E2=80=AFAM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > On Fri, May 15, 2026 at 5:53=E2=80=AFPM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
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
> > > index b67b3b334e69..fd1b3fd86968 100644
> > > --- a/fs/fuse/dir.c
> > > +++ b/fs/fuse/dir.c
> > > @@ -2524,7 +2524,11 @@ static int fuse_setattr(struct mnt_idmap *idma=
p, struct dentry *entry,
> > >                          * ia_mode calculation may have used stale i_=
mode.
> > >                          * Refresh and recalculate.
> > >                          */
> > > -                       ret =3D fuse_do_getattr(idmap, inode, NULL, f=
ile);
> > > +                       if (fuse_passthrough_op(inode, FUSE_GETATTR))
> > > +                               ret =3D fuse_passthrough_getattr(inod=
e, NULL,
> > > +                                                              STATX_=
MODE, 0);
> > > +                       else
> > > +                               ret =3D fuse_do_getattr(idmap, inode,=
 NULL, file);
> >
> > I left this part untouched from v1 but there was a discussion [1]
> > about whether to enforce that setattr must be passed through if
> > getattr is passed through [1]. I think there might be some use cases
> > though where having only getattr passed through and not setattr is
> > useful (eg server wants fast stat() but needs to intercept attribute
> > changes for access control or policy enforcement).
>
> Of course there is. I think I was misunderstood.
>
> What I meant was that *specifically* for the getattr for this purpose
> of killpriv, it may make sense to ask the server's mode for
> calculating the setattr mode for the server.

Ah gotcha, I misinterpreted your comment from v1. Thanks for clarifying.

Thanks again for reviewing this series.

>
> But this is just a hunch.
> I could be wrong and I have no strong feelings either way.
>
> > I'm not sure if you
> > still feel it's better to keep it simple with enforcing that
> > getattr+setattr rmust always be passed through together, Amir, but if
> > so I'm happy to add that in.
>
> No need.
>
> Thanks,
> Amir.
