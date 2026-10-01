Received: from mail-ed2-f22.google.com (mail-ed2-f22.google.com [74.125.228.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEFA4A8438
	for <fuse-devel@lists.linux.dev>; Thu,  1 Oct 2026 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860719; cv=pass; b=r7Bd+Uoxj8otnKwbC4vTAJCShEEo/Yf/spF/5tNrzhpZQA43LdgAp4QbiwVQV8ekIin+tu+jTESA8KfXitA/7OpvZjTa6FND5NMGm+1xpXSRHgtjbRhCqef1LFRZ0Fprq8x+vGY3DbGVbERV2dLbTM2C/vgeH12Kx1Zj6XXcbQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860719; c=relaxed/simple;
	bh=Uw1uWeqMHarO4Xj7t9eCDMHbGz2jo2Udkzg4EDz90cM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2TDk1v/NUF5YpyrghyZrU/SKvtz2bMaO5lTmsBopID3sBBZfBOk9wrOUdAgfm4s741HtX7wzZffNwaW1Rkxz5je2k4BOBacXMwwFINV7Y4wZB7Jvb2pJq8QgSmxhojC3thrrGdVHvcbE5qKV/f+Ec/NZGZxH9R2K0N3/Zc07Mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eS1IQgwz; arc=pass smtp.client-ip=74.125.228.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eS1IQgwz"
Received: by mail-ed2-f22.google.com with SMTP id 4fb4d7f45d1cf-6af7d702c76so985926a12.1
        for <fuse-devel@lists.linux.dev>; Thu, 01 Oct 2026 06:18:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790860714; cv=none;
        d=google.com; s=arc-20260327;
        b=VNU0nd0+c0qFSUVFHf7s5IBq6AE6N9G4+gEupe7uPsh1rVzqqOW/8FeGj2u0ZXP54R
         wq1IwVIUGh5zRVQEcWLFdxUYnI3vTG+1Q2bdiwbYSC5d59uJVEHWu7IP8tHkDQSb2EPb
         iFq4JQNuV+GzFOo7bHV1Uh3n7qwadLfk3ePPsyT+cufBKXypCJcbsql1+mkbx7IpkJ7C
         yxjEa1lCj2nQSQpJtXimflGoLJswyhz8vg1uTSQwArMPgcj/FYPJospdcpwdrQQ98VC9
         knmOsPQoMb8gE5Jw5Ao3X8dpIfDr+lgxipMtmtjFvZyDq217cQPFI9xtVJd20wFHHL2p
         jaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SiNBphf5YHU7Nuf/MPPVETdhHRDDrC1sqyyTUXzM7q0=;
        fh=2sNa+NvHECDxh80dIYOrl2sTeezdpdabNDnwSvRQ130=;
        b=GLdrycJtW+fKR6PZk1Fs50Kg0m5q4+IEjiBIl6O9T9T/F8+Ug+PCRcEb2XypXsdPXe
         TJv5kBpuah1WBA+ySYqgLVI4Kqc//EmwypmjIQ8a46Q1OqZ1nA1J9vqMU1OshKFUZCqc
         rq2OAm99Y0LCbhnOf+2osDPXaL7cbnN68cVKIgas6pc6xyOo6LVF46b/aDZyZeOsUwR9
         kCYI9tjXK2kwCm/iGK90ggrq5l1IVE1oK5pKoJfSiIUa8/2vZeJfSdkDaI7ov1d/kM2T
         NjU5848uIK0X8HMPjD7t6nEh1VFXjA3+6rh84kxByYvlX7+8hTNmSSnt/habCBw4Sx3J
         tpYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790860714; x=1791465514; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SiNBphf5YHU7Nuf/MPPVETdhHRDDrC1sqyyTUXzM7q0=;
        b=eS1IQgwzZ0alX2/uSzrC5ra1U8dW1NJkBIXigCov88pLQzLmHQMu6gJyDj8Qsbk+/F
         0j2ZC5peL9WwkjJ4FX76JI2ozRopbwujNifrSORjyzgSplWUsspvhVEDuF9OmREVL+vw
         V3aUfsKecBOByFFoJ1gYuyKp/zPH0BOWVNJOkB1VhDwqDGekF5Gcwrfw9CAC7Csx0ZBh
         ayzGCB6u9jNuDxpCtin+42GFWBZRqpdVKMR7e4Vi2XXH8D2TmaXg/lc+4E9+tHx/qXos
         ni3jb3azrqm8gHY+AdTBtVuOkbMrPbh8EaVc0GN/QUpIrwPLXsx88niaBXf68g86gORT
         H0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860714; x=1791465514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SiNBphf5YHU7Nuf/MPPVETdhHRDDrC1sqyyTUXzM7q0=;
        b=U14dbMNGZx852tdrcbzajgBz46hZEc37tcClm1IxAZV36yVCKKz88IDannjtxwk7Er
         iQdGqPaDa0z2Yb68GSEi8rvEsVOQaQY8tJF/6YNaTGq5o/G8V2CP8/aDAjAYwjc6sWS0
         cIcrxhG0iofmJrWNnP5+S7aLxjDxPii9AYPVOHpXI683jQsfduJXGpLDYMYzHnwGzzvf
         TJIcQhGGGfxtc3ver/cgUEmFd6oa3P0wx1ww8/tyl7jNPU9CxcQQbN0J0MWnlDqZb1qT
         cUy+BQ04izknLvw5wHXuWyWAfOiBwAVx8Kie7mT8Jb1n8aRJHa8rmEtK4iTevvvAAEe9
         oSPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbDA2QXz4MC0424go+svE0DbgK7XsZbxW85w1N8+chY2df+x68PVE1dFBkKei3l5etHVikseyqd/XO@lists.linux.dev
X-Gm-Message-State: AFq9FYIxQt3a8OVPdGFBSz29iWzeBdrqzRzJ+1Trd1XEJSI0ImmP8XMS
	jrb5TfmM1BTTXw0UYa1QyjFGTaxGy4ysYLcptpU++qpVm3nhDuuKHFacpwee8iUGw0uxVlJSNA4
	E8htNhAor8CWb2taclBxJNI87MXF6pcM=
X-Gm-Gg: AYBFou3KUqQ1DLBEDYJCNivtk+3XrawEP9FxeOEwVSM2SV1CgH8z4l6RYoOSvTlYcs3
	5SAaM+RKL6kAccBJGeBiNPEpuhVdQJZA4bZyYDIRIZS9ejyiNa+47Ggtdw+ZyRijygp/PZ0/2SA
	R1pBAXj/pdRWpNzsccoMa/XZHBsrxZStpgLnIJ67RgZGkVguwOEgU5qRjx0bhXAgK44BHz7FDX+
	mi8PyNkQjeJBDMe/c1a65Cjqca69ZRCqwgKIAZQAQTBpcbLvcTfkaH/ObTQ3AALjMedo1QzDSwa
	NBJrSl1cs1/Zb+dWZ/STIanb3Td73Ro2zSRfxKNOd4loLQra5WsnISAGP9J7FQR5Ddc=
X-Received: by 2002:a05:6402:1e94:b0:6af:8a4b:7aad with SMTP id
 4fb4d7f45d1cf-6af8a4b7ef7mr391988a12.28.1790860713706; Thu, 01 Oct 2026
 06:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-3-mszeredi@redhat.com>
 <CAOQ4uxhKweRcDVK9da5KDCHjrdmpAh5bgKGbL=o0YPoedCx8nw@mail.gmail.com> <CAJfpegs6yKUnFuiN29hRWCBRnnZ5C4YyD7_JoUrhYmLJMR8rxg@mail.gmail.com>
In-Reply-To: <CAJfpegs6yKUnFuiN29hRWCBRnnZ5C4YyD7_JoUrhYmLJMR8rxg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 1 Oct 2026 15:18:22 +0200
X-Gm-Features: AclHuK-XP1T5WOO5FxbY96rLZ7YrmRwxarxGXgxh_DJaZ-Gr_yCKW5qyBByjy8c
Message-ID: <CAOQ4uxhAvKCrDxWLEnJY+m2pmxanayLGqoTMwYMMFnBr1Xes-w@mail.gmail.com>
Subject: Re: [PATCH 02/11] fuse: use "vdax" naming for virtiofs DAX
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	John Groves <john@groves.net>, "Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 12:39=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
>
> On Tue, 22 Sept 2026 at 10:47, Amir Goldstein <amir73il@gmail.com> wrote:
> >
> > On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat=
.com> wrote:
> > >
> > > We are introducing DAX functionality largely unrelated to the virtiof=
s
> > > code.  Rename dax -> vdax for the virtiofs case for clarity.
> > >
> > > Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> >
> > I am sure it has crossed your mind that leaving CONFIG_FUSE_DAX
> > all over the place is ugly and just as confusing.
> >
> > You may want to create an alias in Kconfig and rename the checks
> > in the code to FUSE_VDAX:
> >
> > config FUSE_VDAX
> >         def_bool FUSE_DAX
>
> But then the .config file will contain redundant info and be confusing.
>
> There's a fix for that:
>
> config FUSE_DAX
>     bool
>     transitional
>
> with the only drawback that now FUSE_VDAX will have "no" as the
> default value if old .config had neither FUSE_VDAX nor FUSE_DAX.
> AFAICS that's not fixable with current config engine.
>
> Anyway, that's a very minor issue, so I'm going this route.
>

Nice trick.

Minor nit. I see that commit 77613eff2d02e on for-next has
spaces instead of tab indentation for the FUSE_DAX config entry.

Thanks,
Amir.
