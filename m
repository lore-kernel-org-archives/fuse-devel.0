Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B74540587A
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 07:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645869; cv=pass; b=td5JbUUoPEvzK9KrDbzMM6qpKvgubNzpNjcHpAVXdu29ds9TAsciChWvABQZR/1oX2neIn96BP3Su1+s/tlrgj4mLSOvx8xMdq7VG4qzB1MdH9dvBdjq7FKsq7Oip2epLSa+F5V6EjHC0NNYjQR7xuHGFqDYwMD9EDLEZqYv/Pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645869; c=relaxed/simple;
	bh=wh3etbzEKWnNRIqZFCiEMbDknYZR1guDhH5Mkrn93rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kcrer6NP4/LhOfZwv8+9abckMbKSAwLrm6HsrJmw0+lJU6xW/nnujMIaac6t78u5ieSNlGPWjlRVCXeldRPQPBrE/OwW/tjajoMyCUf3yRH0XDN8XHQkUARA/IVOGTYj0T5AE7nOgcofNpSE4Wn1l89V8mAvNh/Ry/Ik/O4UXsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NW+eK3l8; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NW+eK3l8"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68c32f3c6d6so1662732a12.3
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 00:51:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780645866; cv=none;
        d=google.com; s=arc-20240605;
        b=eGDCznTPmO1vTxbTBbHqS0ftw6En/gv6wm9DeKkHviIqM4PjkO9Gh4IOviK0o8OYPR
         b4gwr/bt6Lz/tWL2+rWcI95aJCjbAOgq1GZemgbGJs+A9emG71iXayQ1SWefDvL5SKns
         Q+yCyKI7wrlWUftSy7AGpAK9EKluDHulAvIvlO3T7hd4dh8b8/H1PT52kGez+kDoRW2Z
         J94j/HF/fY1323gI9F8nNr6d/ywhrqVaeQB/jCnHsa5acr9xgg3Z2r5H+vzbwN5UYIoW
         FyCHePrVGaJhA5cHm1oqDvBCGcw/Tov2KeEFo+RNHhN97INqXuKEwoFk+9+84o6Eu/t7
         lxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/HqmzrLpDq5MXeYqBZSZwjcHv9LExIkvkWg0sz/fjHw=;
        fh=USky9An0sqJRrDfolCok4GB4Nj5K7MfRlGgxiLB4zCE=;
        b=Za5+468LRz35bRBoLnMgPKmpNdUh3yAqILySVTM7AekQAVgqggHDOWv/kecxFw2+k3
         V8chLMZf20UKP+ljB0GF0GB7AO+xb3uz440oEE6FZtgp3JYFnG+Ab6wWckfjo1RonTh1
         PBxFkb/RkMMGCWKqbQFn5953yPfDTdo8KoFmoOJY0VGUBiXpptMozYh7YfcbQ0zW3Nh9
         ljSSjWrVD0bxnoc7K6LO9Cm2BI34GlctFQTeHJt394a7+cufH442nBE8/PeB5+ix9jxs
         ZXDeJsLcICsIu7xoBsmX2GCH8tBLsjXWjUHer/ZKV165MoPJP6m3js+77VqWqRwMg3Ol
         JjIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780645866; x=1781250666; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HqmzrLpDq5MXeYqBZSZwjcHv9LExIkvkWg0sz/fjHw=;
        b=NW+eK3l86l0HzucQnjF66fXUZnGEThFgoIHmxyH9IBNopwsvDJkj/b2jqKCm7Q71nU
         f+OrRBVJk/wtQrEXbZ92ELxrCitwTQOCPjlWBObH7C6O+UeIiOvmMzUyx1XIQq+OxND1
         RTHhQ4c/6SYoy9dR01I6zLg20YnR+6xnIjOiFc4adx2h9r4QUGXhUm8LB1Sxh4bO8ryD
         0nn3HshMw7ofcIQqfpN+WSAbr34wE2J2Cv6VaZ22qDTXSfZU74gK7wo+/n0K6HnYpa31
         e5GCTshX13Qov+5rCRH7b6zypwAAz5QTewNox8rwwxc7h41sMJIUNXeQHtN91auh85ZX
         DaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780645866; x=1781250666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/HqmzrLpDq5MXeYqBZSZwjcHv9LExIkvkWg0sz/fjHw=;
        b=dApekcsosvZ8GWM+gGvaPqM+xJcWqLPWC3GOaeLTDwfHG0a6/3btYpT1BjkhnlP3MR
         mg6Zu8lKZ6UiUTQH2IPTvqIAtoztbp9QdV3ZxSNQHppUmYwQvGxaauVBalKmfhvEwr/Z
         CRc4ebDEiANyFBzAYrWF7ldRmLcN1PipSUMFWUdZ2s1BdK8ChMyxFnPAoEtRYoGAS/Ov
         jCgbmKZBSXHimTo54M/okc4pumTRBOxBUuA+b0FTOC5qi1DVRO1ASIshq7wIlwY1klSI
         FJfdGnBWFn6PmAy0Y+uIla3D6G/zAF2Awg0pvclJDW+vQxuajmi3r56bjeoDhQoteVhH
         AIsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AAGH8lKX8VUY06rhbr5W3tZIN8wEHMO7zSKeYmerukCcDWcrNYuF3Rn0wjK8GxwPm0JfQv3FTg0EX@lists.linux.dev
X-Gm-Message-State: AOJu0YyLZhzenNL3x3pyK54NMj9U7nlZtbTcYHwmAmJqgGfGTFcsiLAu
	t+rQn6C7ejtfON9TXflfuw3y5pnLtzNwaZ6O87mWlFkBZwHeIUJxDqs7i83t2BZZ49EgrkHzXiO
	AXbB9eGW4bwZxCz4EAHa26UUYuoL5VpI=
X-Gm-Gg: Acq92OFJEUceUtYmjhVxW9U9oOXFgdHePOJH4vSDXuUciH0z11HhGK/6yzKY2oZM5Mf
	2tqm6m1AWLlluBLdS8f7BJ2ZPE56UjFKKa4Pt3XxTg86eTaIsiSyRlLf3sauNTRujly/uMIRgMR
	OqKO3cKL/oV4XqhTExjrxdktKNaroECGJ50dpdbK8QU5buYJOBe4YL5SNIBMDd4GzxYuUhvfVUo
	/vkxu9MrBhKp+WppwA8wpSJ90LWwC3D7eVJ5utfpXYJIAHERX1yMIrKYX3XikGgITz1mV78WC1b
	HoSTtPqi9cl5BGITsqNWloUaw2iZvDYFikaD80KW3oK/09yMAvpR
X-Received: by 2002:a05:6402:4506:b0:68a:88cd:eb22 with SMTP id
 4fb4d7f45d1cf-68fa535d734mr1067090a12.26.1780645865627; Fri, 05 Jun 2026
 00:51:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com> <20260604-fuse-compounds-upstream-v7-3-27331d085c2a@ddn.com>
In-Reply-To: <20260604-fuse-compounds-upstream-v7-3-27331d085c2a@ddn.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 5 Jun 2026 09:50:54 +0200
X-Gm-Features: AVVi8CckNTLuewd_ijjVtUpRkJ0WCSNTKPPw1nCOepvqC88mAuGPpny4ZRDVILY
Message-ID: <CAOQ4uxiAJmt=eLiMHbbKWB-A+=cdboxSDMTFwOyUotopsWw2bQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] fuse: add an implementation of open+getattr
To: Horst Birthelmer <horst@birthelmer.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>, linux-kernel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, Horst Birthelmer <hbirthelmer@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 11:51=E2=80=AFAM Horst Birthelmer <horst@birthelmer.=
com> wrote:
>
> From: Horst Birthelmer <hbirthelmer@ddn.com>
>
> Fix the issue described here:
> https://lore.kernel.org/all/20240813212149.1909627-1-joannelkoong@gmail.c=
om/
>
> When appending to a file or having stale attributes
> we can use a compound to open the file and retrieve
> the attributes.
>
> Signed-off-by: Horst Birthelmer <hbirthelmer@ddn.com>
> ---
>  fs/fuse/file.c   | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++=
+++---
>  fs/fuse/fuse_i.h |  1 +
>  fs/fuse/ioctl.c  |  2 +-
>  3 files changed, 70 insertions(+), 4 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index a7d602225f45..0a47d50c293b 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -144,8 +144,56 @@ static void fuse_file_put(struct fuse_file *ff, bool=
 sync)
>         }
>  }
>
> +static int fuse_compound_open_getattr(struct fuse_mount *fm, u64 nodeid,
> +                                     struct inode *inode,
> +                                     unsigned int open_flags, int opcode=
,
> +                                     struct fuse_open_out *outopenp)
> +{
> +       struct fuse_attr_out attr_outarg =3D {};
> +       struct fuse_args open_args =3D {};
> +       struct fuse_args getattr_args =3D {};
> +       struct fuse_open_in open_in =3D {};
> +       struct fuse_getattr_in getattr_in =3D {};
> +       int open_error =3D 0, getattr_error =3D 0;
> +       struct fuse_compound_op ops[2] =3D {
> +               { .arg =3D &open_args,    .error =3D &open_error,
> +                 .dep_index =3D FUSE_COMPOUND_NO_DEP },
> +               { .arg =3D &getattr_args, .error =3D &getattr_error,
> +                 .dep_index =3D FUSE_COMPOUND_NO_DEP },
> +       };
> +       int err;
> +
> +       fuse_open_args_fill(fm, &open_args, nodeid, opcode, open_flags,
> +                           &open_in, outopenp);
> +       fuse_getattr_args_fill(&getattr_args, nodeid, &getattr_in, &attr_=
outarg);
> +
> +       err =3D fuse_compound_send(fm, ops, 2);
> +       if (err)
> +               return err;
> +
> +       /*
> +        * Open succeeded if open_error =3D=3D 0; the getattr part is bes=
t
> +        * effort.  If the server returned invalid or wrong-type attrs as
> +        * part of the compound, mark the inode bad (matching fuse_do_get=
attr)
> +        * but do not fail the open -- otherwise we would leak the just-
> +        * acquired file handle on the server side.
> +        */
> +       if (!getattr_error) {
> +               if (fuse_invalid_attr(&attr_outarg.attr) ||
> +                   inode_wrong_type(inode, attr_outarg.attr.mode))
> +                       fuse_make_bad(inode);
> +               else
> +                       fuse_change_attributes(inode, &attr_outarg.attr, =
NULL,
> +                                              ATTR_TIMEOUT(&attr_outarg)=
,
> +                                              fuse_get_attr_version(fm->=
fc));
> +       }
> +
> +       return open_error;
> +}
> +
>  struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
> -                                unsigned int open_flags, bool isdir)
> +                               struct inode *inode,
> +                               unsigned int open_flags, bool isdir)
>  {
>         struct fuse_conn *fc =3D fm->fc;
>         struct fuse_file *ff;
> @@ -171,9 +219,25 @@ struct fuse_file *fuse_file_open(struct fuse_mount *=
fm, u64 nodeid,
>         if (open) {
>                 /* Store outarg for fuse_finish_open() */
>                 struct fuse_open_out *outargp =3D &ff->args->open_outarg;
> +               bool try_compound =3D false;
>                 int err;
>
> -               err =3D fuse_send_open(fm, nodeid, open_flags, opcode, ou=
targp);
> +               if (inode) {
> +                       struct fuse_inode *fi =3D get_fuse_inode(inode);
> +
> +                       try_compound =3D (open_flags & O_APPEND) ||
> +                               time_before64(fi->i_time, get_jiffies_64(=
)) ||
> +                               (fi->inval_mask & STATX_BASIC_STATS);
> +               }
> +
> +               if (try_compound)
> +                       err =3D fuse_compound_open_getattr(fm, nodeid, in=
ode,
> +                                                        open_flags, opco=
de,
> +                                                        outargp);
> +               else
> +                       err =3D fuse_send_open(fm, nodeid, open_flags, op=
code,
> +                                            outargp);
> +

Pure semantic complaint -
The name "try_compound" confuses me because it sounds like the caller
would need to do the fallback.

In fact when the try_compound condition happens, code is going to call
fuse_compound_send(), which takes responsibility of the compound
request one way or the other.

Thanks,
Amir.
