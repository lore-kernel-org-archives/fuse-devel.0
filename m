Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B2F39DBF0
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 03:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776826931; cv=pass; b=AAN4jlQjOdnm7AWk2St6bXES5+7l+DPmBYVze1d7xxIaCuPHKwCyiAwqNwawuKrLylIQfjB83mrmSNNqFeuH0KRrdodr+3rMgEJYHK7WLy7jcErhizaunkxNrBGETyGCfxf+v2KJ9Z8usmEz+RxYkf6x4rvnl4TQu0p+ylWDHPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776826931; c=relaxed/simple;
	bh=RjPcShsZwFbptIYmHtkRVpFOE3wHsOzrDA2tEtY1KYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lh2cLj/jRWVGYWu5Ad0MEOu4YGLKFlYfkmB6RbrXUFBeIvI1Gfgi0lk25PTGLCPRwLDZOF22hyhj8kR6ZJCZzJts/MFXprmZlyvxS9ZY9dDNlINp0IOef/Uq+xTscKqZdEr55f5nhAs/IxXWtNUIvSOlt6fF9RW65mHuiSJM0IM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBGH3AXo; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBGH3AXo"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so3268845f8f.0
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 20:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776826922; cv=none;
        d=google.com; s=arc-20240605;
        b=Qznef8Ns/aIGgoFFE2nvoQr4e9lSNPu5w/IhV/s7HXkxx/dDmy3kux+16L/z45Qe2f
         iYS8V/oNb1ZsZBWpxFOAraol8eaah3/rx0MJuejwToA8YsEujGNza1y6i0AoMDyP7nzH
         C43/WZtVv0rc1Nt2bl0pkO/yIucfYDWOMPrI9fRKx12Lun3HD4PbP0lCwEuhN6eSPDDR
         Cjsr1HusdAs3mZYLl3DrotjkEHF9ld10ulemKCZ2d/QuVa6jl4/fuv1JygBMdyQQ9aTA
         9kQnDhkG4ZgyS4CAkPifmeJLc8LyE+9K7fLpGZi9z4/6rAqymv8v9YIzyMl9BCkcnsUx
         EqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5npBkX5QslKPfFPgbPz9kC8k1K6M1pa86M9i1VFUD/c=;
        fh=zV1vbLhL7HK2vV7ZwcIHnAbR8ey6w4dn0V+kqvwKYrU=;
        b=e8Y3WGznoLw3HKnDlkZnxMNSOfa/gYJ9eOVFzwD3mPGhMudY0F8xuPKFOYUtNtt/bj
         oK3Rtmd+kH66L3zD4H6gQqRgQuJtNOnzLWZJQsvgxo2vvE2wv14lWY7GIBu/0oe+iKDu
         EYt/JuVlIJREvxMROfkYVjKb6yqS99pCyiXezbOyspyiE7s7qC2PB8wUwDsB2BF+6lxg
         IzwryFO6nAywZiFk1HudhEQyHjNztMetEK4KzsFAW3wj+EcI2yw9k0vYO5fj+I4Gujsd
         8LiYsUhfXYIJBaXHX7tzZVCGPdOA82hFn2bNc+Cy0rMFftE9MaVy66XBRsHSJEOS6EQ8
         y5IA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776826922; x=1777431722; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5npBkX5QslKPfFPgbPz9kC8k1K6M1pa86M9i1VFUD/c=;
        b=jBGH3AXooB8qrXh2v9aOxOSxSTprzzV2fT+hv7MoG2JuUikiF7tdeC9q5yew9suH1v
         n2ziItpel7T1CFaIR1vrWlCnG8cgcPFko1VwuFoZsrsoYWiFphrCvob0Im/ii3hD+Txd
         3GpXy7JZ5oMmDM23k7jTGiC809tMgFp09yUjC3MWcawU0M/qHBn5LMoLMVU9gYA9SaGk
         gQRlxkbWXwX8CIjtptZYUC7FGdobPAIsvtNil8NMSZSzVqUC1W6RtmKjfykcPq/ZCrsM
         dVotzFv58UnS4L2GeQpHOXsmz65RYElfUxNRWGkR6Pr4D+v9HYHLiytgxMjq34m5p/cj
         UpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776826922; x=1777431722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5npBkX5QslKPfFPgbPz9kC8k1K6M1pa86M9i1VFUD/c=;
        b=qyWsfe//h3vatODEugW2N4JRu0mdVvuUhVc8RQdYgpD+0tWAt6c9rCMOLTKssj5gf0
         p4RzSfaJBR/AAf5bDbk17ccElpI8anvTVoSQnxUmSa5fdrtSt99HTXHZqVdusxuhs6+K
         D0tk8TpkWl+FN6V5A+NkdCejG+3SX9TkIjkm346HG+u8sHh7WEw+RFz+6K4+3JbWxiFn
         2WjwP9vduYWFCYCIqt4XWuKJEslpDN53MsJCIQvzkRseinLVGCaokfN5tcIDAaU1oouY
         dUsQV3jfsabAj9sradUifJF2FGB9m47pi+qM1VvEwVwtCKuXIfBhEa0gm0zAb5mohGkj
         jgVA==
X-Forwarded-Encrypted: i=1; AFNElJ9kbZ56EzWnpKtdrdmPl0afHKeo8oaug598B56AHCNILrF5HV/JMDuYybSBr9rcsD3C+KHeyGedhgPi@lists.linux.dev
X-Gm-Message-State: AOJu0YwjRqff3Wid67k75RdzZti16zmWbbczuk0IPldyBvZzP3p2+sTC
	VR3ORiBSuvDNTjMaJRnUpgxo307DPY8oWGRVOrZqgU+dOXkAz7F5b0cSDQ/1QkHwhhXNDpA9l3q
	h2juXbE1SOqjRFV6aNJsMhpsK64+UYc+aWdnD
X-Gm-Gg: AeBDiesEyeH1qrv7XHjgrFe3tWTSxvqj4t4NFawninhM8p5E6FPattD17G6Ocqpmnsu
	cfaavLGLRaq7ovZANEPGZxWBmpR9CyD4oo54kVmJrxnGWaCfYnx+sxrO/3jRnvFlgL0GiU8kJAv
	lFlF6Oa5XRVGU4o8/PW3OHl7Yn5Hbjd+o5D1P3QJaPqjVMmz/uz7nQqDi9MssfUczkXNwqrOE4O
	wO6FSjxQW1TpqN5ANnavU+nWpIbeSzwfnwkra1V5mOBASicCw/9vPSDww0j0EHgaePn/IJHv7KV
	IH0FfsnNLHRc5Z3w
X-Received: by 2002:a05:6000:288b:b0:441:1cf8:ca00 with SMTP id
 ffacd0b85a97d-4411cf8ca01mr10181828f8f.26.1776826922315; Tue, 21 Apr 2026
 20:02:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-13-joannelkoong@gmail.com> <CAOQ4uxjaY4-POtWCmgCiMF1rupuKxV5JU4PKAipXFw7-CN=Pgg@mail.gmail.com>
In-Reply-To: <CAOQ4uxjaY4-POtWCmgCiMF1rupuKxV5JU4PKAipXFw7-CN=Pgg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Apr 2026 20:01:50 -0700
X-Gm-Features: AQROBzDHCzhkTGevvqjPCDN4-IxNfLvqKe-vKak0MezTgkGht00ZvNUZu-BLMmI
Message-ID: <CAJnrk1YW98mmQ5VrxY8jB60cpBqFNWtVf-h848tR2=vjT8xS-Q@mail.gmail.com>
Subject: Re: [PATCH v1 12/17] fuse: add passthrough support for entry creation
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 7:08=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail=
.com> wrote:
> >
> > Use the new extended fuse_entry2_out reply for entry creation operation=
s
> > (mknod, mkdir, symlink, link) when FUSE_PASSTHROUGH_INO is enabled.
> >
> > If the server returns a backing id, the newly created inode will be
> > automatically associated with the backing file for passthrough
> > operations. If no backing id is returned (no passthrough), the statx
> > attributes are cached.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/dir.c | 33 +++++++++++++++++++++++++++++----
> >  1 file changed, 29 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index 9e9b77942dcd..e5a7640fcd30 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -1088,10 +1088,14 @@ static struct dentry *create_new_entry(struct m=
nt_idmap *idmap, struct fuse_moun
> >
> >         if ((outarg.attr.mode ^ mode) & S_IFMT)
> >                 goto out_put_forget_req;
> >
> >         inode =3D fuse_iget(dir->i_sb, outarg.nodeid, outarg.generation=
,
> > -                         &outarg.attr, NULL, ATTR_TIMEOUT(&outarg), 0,=
 0);
> > +                         &outarg.attr, sx, ATTR_TIMEOUT(&outarg), 0, 0=
);
> >         if (!inode) {
> >                 fuse_queue_forget(fm->fc, forget, outarg.nodeid, 1);
> >                 return ERR_PTR(-ENOMEM);
> >         }
> >         kfree(forget);
> >
> > +       if (backing_id) {
> > +               err =3D fuse_inode_set_passthrough(inode, backing_id);
> > +               if (err) {
> > +                       iput(inode);
> > +                       return ERR_PTR(err);
> > +               }
> > +       }
> > +
>
>
> I think we need to verify that the backing file is of the same type as
> requested entry.
>
> This was also true for lookup which instantiates the inode according to t=
he
> mode in fuse_attr.

Great point, I'll add these checks in for v2.

Thanks,
Joanne
>
> Thanks,
> Amir.
