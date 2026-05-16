Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1D138B7BC
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 22:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778970216; cv=pass; b=qZ1UWn09k3AdM++GKS2A2AHvDYWyNxR4nULM14l1TQ3d9twBORx/p2YqYDzkT0PFe8rYrLsV0r3KhFZiKuay4bXfO8EIYGiTKgFMjeUq6bOkyPvg7D9RZuOhB29+4LE+a8RTUekJMTrqIeq3X081QS4jV9uyhhDOAr8gtrkMwrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778970216; c=relaxed/simple;
	bh=jnomCoubi0Kg5hraE0uJr+hIdRRLn/6AvriitA7UOCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fNLGAWgCugAICpKv2eJro5w6yzQIQHf/DqHbSRJ4wHEDYnfbe//XACGzynUDINF6E0Exw78rq1xl+IgMt+kJFbgj2QdpR+Qm4KNDuIxGWBtFJw9pcnPMz6rOm0E4MO9PMZFo9PJUd52YofwNSZxnnsmQMjYFqBEgQFEI0fQkxVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgB+QAQo; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgB+QAQo"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso4900966a12.0
        for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 15:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778970213; cv=none;
        d=google.com; s=arc-20240605;
        b=YFjj/noB51OKf4Y/JHgJQBx776vB88SFIb7nyfM5b35KeEeKZ+m5lJips682hm+TgN
         m+9H/AHFimMB2GyDOpsrVN24YrU6vnIBAAl/stpOS6XViKXH1UuxSvsVyuWeiRbJV1gG
         b1AZAX9NIekSFw9RZ15VP1o6vmUT6kihbPblNAwpxnBAB3TDBbUD9KgmhNseaRqdP0Qv
         NHTJOHcbBOBdP3NhGmEQlugxKpjJrjfS/hgV0cO9ulGCwokjTqXLNoPkKIRnwhNjHfPF
         KLp8+WDciYaJza5BX04BAtmI5kfvzyZ/Bcs6TS8b1BTnFN56Pxe1KSFtYp25OoKJd6Y1
         tz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yLM8Z0Tidc2198vLO+2avncDjSechT8gAlsN2JpVXKg=;
        fh=g4JOWHJ713y+2jNlfZQR3LLVrMo+oCMfmkBCZnvanh8=;
        b=LGEhQfprncENrbC6+qzVKJ7a6HpJkz8QteOqvuKXORuswCy3iR3s0lffA50oTFOzvl
         zBLXAm4WGwqVag4NPwVV0v3onuqDSn7LoXzdMYtyDERs8WpZ7kGzlwISTsWQTt4bv8Wy
         fJ4XAp+iTsH/oKkjXFE8LK4SKgmDajxEuzEHNcLCAiIjiMkbXgVJU7iiz3SqJNsMSYbv
         SwZHU8hvlsfqVDYG1MfI9ZCZ/2T86gdxVksh5+UlFkjhaRsr5a0EDQdsrHWEU+ImtXIe
         npgh3du2390KzfsOP/v+/yreDPDJxE6WyvVu3TtFkUBz9tgkwUQpCOY9e6gzrSH55umD
         0wWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778970213; x=1779575013; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLM8Z0Tidc2198vLO+2avncDjSechT8gAlsN2JpVXKg=;
        b=QgB+QAQotvNevoSfImqSPmYiSEnCOvFU8q55mQYqwwh/33uDTcdbdvikeTEsaGjf9L
         ggy36PpBF48vrMw31kGwrs/eHQLPaMxIrh8ZjmOoSI02tkZFvnDH6wdHpC9ZbCnD8tKx
         nk4gOtquWcyFpUJk0mb12XplTtGsO6qj1N8+HF+c+E2+Z754LYvcd+k0IGKHp0W8N88+
         Jsr39EWCoZenzwVuiefA/4gAUs/zvTPVKOQyBSWpjl8qe66CKuT0cGWmR0QM+A1HrsBx
         6dsgMq767LR2gJL5RcxZeaCxok6Sb7KEdNWMk96ZraNO/CVpwR6z2jkidJMXkIZh5fnn
         2Nmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778970213; x=1779575013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yLM8Z0Tidc2198vLO+2avncDjSechT8gAlsN2JpVXKg=;
        b=pIPmXFpp+5q7MDtVgwiKzq6P0KCvQSzc1vz7bNqFH57zyNwEGy4PpgFH1FsxViEIiv
         ClFsfb/i7BjGNTAYyYRJwoJsSQ0YI2HH0H3w/6sObggpiWyIHlh7TjyoXRKaJyzpS+zi
         pDlzuowdCe1vSzJ5uz1t+4ReZktCTLceWdYh9gWFOkc05ITup1O6T7My4/KwsQ8XXXFc
         L8hrUucvidRP5dK9ptFZ0TEa2NaDqHoWIN37JJw7GmTp1m5Aya219qgZR2nbvJdDx36M
         YMTLkmJ3ssk4zSLeqahQxu+Ie6/hQPE8ySsJkDQJZP0CZVSojXb56unNOW0LnDfWSScp
         Nkmg==
X-Forwarded-Encrypted: i=1; AFNElJ/AAIBomM0SEjjmaA/OQiiCFvk4IbVRRUkdTS+P0mVMeEwAzsBEndpSa99qdrWa71JqQ+nKlwKN0AV+@lists.linux.dev
X-Gm-Message-State: AOJu0YwDEDGtRtrT36MGYv/Lz6pnjRqgZw2U73pDe0jL4cexmDtOxV8+
	aCynYJxGjegU6mGDwSKPXPaLlViONyH7aPzbHJLlzeBbtdaf3vieIKuG9WoDKJODJtgUdnFtg9O
	TSpeXOhlp7YA/E+3Qgz3PIxNcQSYk1zo=
X-Gm-Gg: Acq92OE02Je0ihGNSdrL0PBUGxM3/k9KnHFCIeOZCwAFcW0PXDx4WYx8tTcUGlcM4gL
	D4h732gGSkIgmkUPARYXu8EYq32BAoKOqMwMaVmg/2AftUUJGUC1wSFwbu25xY1J3Ca+UsKxLnw
	leCVeRslQV90DhzUrOO2bubYPIV38F7fLZN97Szv0fAa+PXZJ9JhuZTcehSYBDPfMvyVmXhCyYS
	iwI6ZsTgy6lE5ZUEP+dsIVp3HOE+ygwSKKrwXAqHdLIDH8HTkKchtMZEAYw7MM5UHoMea4GIr4R
	ySzJJrmQNFDX4wt1nXUFRBlzpDEeoF4BNH3+D2Xj0yENoBTPUB9l
X-Received: by 2002:a17:907:9627:b0:bd3:7514:14f3 with SMTP id
 a640c23a62f3a-bd4f333f84bmr729822766b.11.1778970213014; Sat, 16 May 2026
 15:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-21-joannelkoong@gmail.com> <CAJnrk1a9_MLyMebfsDe_=Rcd2+TaiD87pW4fd4ve8ZBQPCfGcQ@mail.gmail.com>
In-Reply-To: <CAJnrk1a9_MLyMebfsDe_=Rcd2+TaiD87pW4fd4ve8ZBQPCfGcQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 17 May 2026 00:23:20 +0200
X-Gm-Features: AVHnY4L4P_lpJBwi_JU31I3Z_tvNOTSVMYHRFfiIYHCC91B98n4JVW7_as_g4zg
Message-ID: <CAOQ4uxiJaLtcuGNrYej6WCzTfu=fFfy4VLj7pUmfM+hHT0Z3Pw@mail.gmail.com>
Subject: Re: [PATCH v2 20/21] fuse: use passthrough getattr in setattr
 suid/sgid handling
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 3:20=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Fri, May 15, 2026 at 5:53=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
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
> > index b67b3b334e69..fd1b3fd86968 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -2524,7 +2524,11 @@ static int fuse_setattr(struct mnt_idmap *idmap,=
 struct dentry *entry,
> >                          * ia_mode calculation may have used stale i_mo=
de.
> >                          * Refresh and recalculate.
> >                          */
> > -                       ret =3D fuse_do_getattr(idmap, inode, NULL, fil=
e);
> > +                       if (fuse_passthrough_op(inode, FUSE_GETATTR))
> > +                               ret =3D fuse_passthrough_getattr(inode,=
 NULL,
> > +                                                              STATX_MO=
DE, 0);
> > +                       else
> > +                               ret =3D fuse_do_getattr(idmap, inode, N=
ULL, file);
>
> I left this part untouched from v1 but there was a discussion [1]
> about whether to enforce that setattr must be passed through if
> getattr is passed through [1]. I think there might be some use cases
> though where having only getattr passed through and not setattr is
> useful (eg server wants fast stat() but needs to intercept attribute
> changes for access control or policy enforcement).

Of course there is. I think I was misunderstood.

What I meant was that *specifically* for the getattr for this purpose
of killpriv, it may make sense to ask the server's mode for
calculating the setattr mode for the server.

But this is just a hunch.
I could be wrong and I have no strong feelings either way.

> I'm not sure if you
> still feel it's better to keep it simple with enforcing that
> getattr+setattr rmust always be passed through together, Amir, but if
> so I'm happy to add that in.

No need.

Thanks,
Amir.
