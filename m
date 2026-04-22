Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70658243387
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 01:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820167; cv=pass; b=RiWJU2mnNKCRCzi6DiONpt+ckloZLYK0qID7otnVIq/oSUaRV77KoWUPNGugl8L5mHfIKW52x/pPQm686zkEhV3U6qN6fGj7Jd1Bop0JJ8k1mfFLDDTgEHAg1ex3xkr5SmNZdfQTlhK1Pkh+eehoocIDBGfMh1fzn3nkU+6gKGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820167; c=relaxed/simple;
	bh=Fnii3NYAJaLvvIdaKcoO7JTQ9O/FYtaHIOYaDTNjPIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FrZC24XVpRRInW22t+0qgMpzWYmWrnTkA4OIYqS4YVdxMVMe3LEvPGOTpI9NwMozPARQswkD9mJQSVnx8V3P2CMGHDL3FxHhXs6g1foRF72C6zgNo/MouHNRU64G+XSicjFdq6IU4pRe+tyOoUtjYrNFoer9i2k8ZFSTObMg5z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KywrQYLQ; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KywrQYLQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488d2079582so56632035e9.2
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 18:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776820165; cv=none;
        d=google.com; s=arc-20240605;
        b=S3GHEn+tiqNqBuwXvbQ6/q+G3kUsGMM4obNMLg22H3HJrnKnXZfrLFW4VcPxKrlEHs
         R0MlVOqBM/Wud/ygRDElLdSckA6w7Yuwagt6SrlUhzmv2eOuGLefY0/V/oxXT0ii5GAL
         9sb9qyOWkWH/Ri4YTH4c8olW5n5uf3DhsvfIvWxan2oRbfmFWlg6K6/fpjhqicQXi8FH
         gYVLJ3EhHizO5L6NKZDG2dXavV3mfjSYpFIuFl6mr1w1anYnlkLpUx2dnKLW4Pq6bluD
         6SCztAK1T3ZkttWvyEFydvsxPMlbR1IispFpIgAuiJWMUBVEzbPgDTWU3Pp4VOPymSld
         dwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iSKimt7kboTqf9PUjcctwLDm2DzQ8kFx1ojT5/KY/iE=;
        fh=B6y+LnjGXk5+MkGJhXt/eVtjYD4PIzt8fjFpiiE46Ts=;
        b=NleS7A5gED6kQGE8xG8DFqDpj0/sDbsSBEaVkHuhEl7j2jgqFPlA5YOVsB91CmSCzg
         vndQzsuD1ZqiMDZBrCiucD9zavJnPjjq+m8YWoImCSMIwHanKjHSRWRdzxUCrOl96iOC
         Gs1Qq0ASjrihc/79K4g4400IX2DnpzeCe/k47+8JdMZrFgS3yZ4MMW0sgM8vkl9WParh
         mjpEA0i77oc7Ui9iWBCojWU/w8LyyfXGEPK3sUDnEDzwq3KmAc5HS5XoS6ufuLuAH/x/
         uXdfGI4ScNYz+LCPj0/W3qHA2J8Q7eUlTQcc02L3yBanb5P9a9GEbaXbLdCYM1SC7Seu
         T3GA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776820165; x=1777424965; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSKimt7kboTqf9PUjcctwLDm2DzQ8kFx1ojT5/KY/iE=;
        b=KywrQYLQk+TJ03AkZauZRXbnein08gccaDkRqAOoZh0oH3+rhg84/AhilDhrYdTf5x
         XKOrWvycl95slPey7Tj8OAfVavC6NI9Dy0L1KESlcO81mbrhSLzB+R1vuEFdeU1qmxpu
         JxWM71bneK648Ce0/t/E+yr+pPeIqdoOy6cn/4JZQfDVRH9k/kWFon8C//BaXgrBdAKL
         s6P6oyDTchzopvA/nIu7xW55gbEki9Q9swaM5Ba3N4UVs7L+QdAKCarPct45NsjTIYxI
         wzOdxM8c60W5Eww0J6H/UxNWMFvytr6EID0TAlej+A+zvp0nxkyzelQ/DJmFue2eiGmO
         QGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776820165; x=1777424965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSKimt7kboTqf9PUjcctwLDm2DzQ8kFx1ojT5/KY/iE=;
        b=mlT8dySBMXjjaz+Q+5xn2BWrQvRL3EqX3Gh5buc8RaBUzt+yjfxD5bQXQQd3auDfMx
         kMaEljZyJvZqUsuLV89F/SXEHHurKRLH5FU2IyBBomAZAgvbZlrsUZaJwcyHxholTGoC
         UVlG0XmMEHK9vJVIS0eoAlDlbBzCqimSG6vlASM3k2Y1f7kIL/A8ZJHOFlPa+TtGjo3/
         HoeRolsGVGYLCZ++XFJxL6AuU5LpDq7NEoZr83B3cZPoqMoIMqZyy2SAYfoKZ5EUyCn+
         3Vvz4Vqna6Pft3GFPGd5wmE5dYesT1kxhJj4BXo6p9aMdZ5o/4dNbRsBAHm/w9CuL/LF
         BYmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DFou0lIt/gD8hagUcfphycYHj3IpYP7qUuyA1yF5GgnPfpITG9RG22xs4tGPKCf91AWN7k8TIfzQv@lists.linux.dev
X-Gm-Message-State: AOJu0YwBx/0j8Bzuf+xmc8ZNi1YDuL6rC6KJzv1vcJoLvXztfgkTPPUS
	pPZA7vZDs3xe1bNGiQsKLkv8jG9Ua/gTGatLHCgDnAwd2LcNzGgKZgDx1ri3WEvCsFXZ/OgoZeu
	uX4b3QGuRPqsfAWW3WNlneyVsUFmBKqg=
X-Gm-Gg: AeBDieuiDCqP8trI4xtkowHD89Sa4wRcwIdD2FxjY6L4xTvM/fqaDGn8d+Pb7Dez0JU
	CkCSx1cfG+eDZ5kzTIfG3TGS+7GZset45nqsjT8nvdbxqY0AU8tUsf3pGoOnoyZiAvVhK0q6mSW
	r7wcMLDVfuakUml0WHrGCmX1x/gMghkqMvhDjFsafU538npPs6A6MvGtqqeRdwiXbC5V5WXkavI
	PseZOL6iEpp4tsoUodHEJbqNuwHOXX8G81erPz+wCPcX9ADKWZmRRf2QQz2xuAuUTkWKCVY3MfA
	MH0SEkrOu3dPqKqX8BHh9ja2T5w=
X-Received: by 2002:a05:600c:64c7:b0:488:a2ac:a334 with SMTP id
 5b1f17b1804b1-488fb73aa3bmr307877995e9.3.1776820164772; Tue, 21 Apr 2026
 18:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-16-joannelkoong@gmail.com> <CAOQ4uxi3VML0ZcbnCWuzsi2U-N88xU3dJ6S7030oA_7G+A0GGg@mail.gmail.com>
 <CAOQ4uxjRsO3N_eboyY0R4jMva1jNKsKBVvbO=19Sy5r84D7RLg@mail.gmail.com>
In-Reply-To: <CAOQ4uxjRsO3N_eboyY0R4jMva1jNKsKBVvbO=19Sy5r84D7RLg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Apr 2026 18:09:13 -0700
X-Gm-Features: AQROBzA1XtBGN-dOZBCJTRTTBcZLTzYJU8-JKJmG3wVNI6IK2k7JDejxbHT0Z28
Message-ID: <CAJnrk1a3sWgcrGCpuc6bREh-NxTzdGokZ9yvS+gq36oD7NDkiw@mail.gmail.com>
Subject: Re: [PATCH v1 15/17] fuse: add passthrough setattr
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 7:32=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> > > +int fuse_passthrough_setattr(struct inode *inode, struct iattr *attr=
)
> > > +{
> > > +       struct fuse_conn *fc =3D get_fuse_conn(inode);
> > > +       struct fuse_inode *fi =3D get_fuse_inode(inode);
> > > +       struct fuse_backing *fb =3D fuse_inode_passthrough(fi);
> > > +       const struct cred *old_cred;
> > > +       struct dentry *backing_entry =3D fb->file->f_path.dentry;
> > > +       struct mnt_idmap *backing_idmap =3D mnt_idmap(fb->file->f_pat=
h.mnt);
> > > +       int err;
> > > +
> > > +       old_cred =3D override_creds(fb->cred);
> > > +       inode_lock(d_inode(backing_entry));
> > > +       err =3D notify_change(backing_idmap, backing_entry, attr, NUL=
L);
> > > +       inode_unlock(d_inode(backing_entry));
> > > +       revert_creds(old_cred);
> >
> > Looking at ovl_setattr() (overlayfs should be the reference to all
> > passthrough ops)
> > it looks like mnt_want_write() is missing and possibly many other tweak=
s

Awesome, I will take a look at the overlayfs code and see how it's done the=
re.

> >
> > It is generally advisable to keep heavy logic as this in
> > fs/backing_file.c helpers,
> > which overlayfs and fuse can share, but I did not look to see how much =
of
> > ovl_setattr() is relevant for fuse passthrough.
> >
>
> Also setattr is not a file op, so if we move to common code it
> should probably be fs/backing_inode.c or something (*).
>
> Thanks,
> Amir.
>
> (*) there are a few common helpers in fs/stack.c, but there are out dated
> and only used by ecryptfs, so better start a new lib.

Great, I will take a look at fs/backing_file.c and fs/stack.c as well.

Thanks,
Joanne
