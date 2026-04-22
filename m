Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2625261B71
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 04:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776831837; cv=pass; b=IZcT44AR03RdvfpyDY+u/k2P1T7UTLn3RbYT1k6CW/TxSDSVrqGpAV9YQzHgojpkm5i8Eylkuv+Ndu2G92215AdUnzR/rrrXH0b2P/ecuPeDDBnleUziGInU0sSjsolBRarL3vWAbzPfs4EI4x7AtKwpgAzgBUU4QgbVnRsBcxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776831837; c=relaxed/simple;
	bh=TsHspdEf8WIwE/flgaXDUGwZEA5piYVc4Zf6XZM8Nfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMztTfcUaGWSBu+7F3vJNC0iRKq8sj8Dx1M1ri+gnX0tZQusg29JKWxg+idHHpToOcu4tsAo6SGKUHqSzQbIHm7NUcLJYl1lm9ykoPcR7MVTrXfNHUlIsE3PFFoinnpIB+nrEhHHXTqY1MiB94urPoMCvMDRYnky0JUrrQOSdTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYGWmsqg; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYGWmsqg"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cf7683a28so3355310f8f.2
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 21:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776831834; cv=none;
        d=google.com; s=arc-20240605;
        b=AWlcbNGkSV7KydfRNot9E3xQruElOwK2tuioMr7UcxDe/foJpaMqIlav/kc8yyKNxK
         QXC2mwFhK+ORhkQPuN2Kd/92In+c53b1kxd6GsKOatd35MeR1A6noMWgc0JGJU0uBeSo
         4YfNw6C0cN7sQ/Q3GEnxvTk7T0bHHsgz+VYFz+EMUL72rA7uiktEy3RRBhJ2QBD1gN1p
         eGa7fn20eAieSqVlY19K4qfF1SiqsbngOdlnrpR/pGsThT+a2k9qxrZOmsCscFNDXCL+
         8TIH1cKQiN37PqMhcDr89w1woiBvFBJmkMPnbnP0wAZxaDkXAKMUpZv1H/sAqMT27jnY
         SlVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ahFUj0y1LBa2hRJJa26/cACNR7raP+v+Hj22+pgZ9k=;
        fh=TMr5Df1sazoO+iUJFtIAd1WyyxJdy/lxlOSOLw7yJE4=;
        b=PS9H/baGDb5d8dlaYi44RivJN8BfuaYYkZaOiGjA0dfSVFvU2ehn5dQzkNNha3Ha79
         +gNv5duMuVIVWBoRfsmILFtLcMUgGqHhyA+dVK+GWNbatuZoCiaSG57+pW9Ssb8q/K56
         2GYPh52qfpoV++jRIRZM3h2m4lfQUti0r/EkYkGVa493hekVGTtju1qxddQQ8oV5Lrel
         iOPqgwM4/Q4YkWqfBVAA7jKXhHZDlhofKkjQGaF+VuHa8QdHDWBCqForMgRXlalOeJIq
         V4x4IKidiNeXR06+yj7LlYUfe/UZca9WMY5gjRQ37F21sIOSBwBgqSUvJmHCeU95TWTw
         IPNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776831834; x=1777436634; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ahFUj0y1LBa2hRJJa26/cACNR7raP+v+Hj22+pgZ9k=;
        b=rYGWmsqgVD51z+G1VmDhk8SyLSsG671GCUKHcedejfE88XFFdhONEc2CUyN9ELNZeM
         mP0BIMI3pFd15MLRMtUhfGiq0WrclgYgXbhVt0ofH40IRtmL1avJZ6C2y5iHKM9iPvRu
         6cHOqNRx1rJOY8b+gaPgougkNajfsNp94XdKLoOTfweyJSpluw7yqUT5zkq5fz8JzgIM
         x6Mzx4FlZ5DtxdCCuHvCO01Tp4ZqYA9MplJi/Yf6T5t72IMf3n6KO4ghDeCnTKLMv5Ad
         Oc9C0n7kIcGT5EqQzx7pDadsyCOrkUkE7jbYgYngfgegMyFgiw73lklRz7T+j6qVn4CL
         4V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776831834; x=1777436634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ahFUj0y1LBa2hRJJa26/cACNR7raP+v+Hj22+pgZ9k=;
        b=in6FwWHEoR12k8U/tfvm2ltSHjOcgVqWfgZfGGrzZ+UIONJRDtP/ANje4N5tZzpOZy
         wQob9oxHXoZmsNl8cnbTnngG4vrddoRAuAiSOEeNITNVVul3I6wFTCJaXMjiFCOIeOv+
         dIaj4ssrAQXIfXy7YLvSQjyfpw+GonQPlwNNv7lHWF8YNNwiIG6owVCC9EMeFG5G7/1T
         uRHPo2o9HUKU6UgwtyrMukhd4DoBR3OP4zmOHywObqnucSnIEX19UrpmgwGc+TdXnLRl
         wfKkz3+ARMXFUSsYsz6VnQjthivflykYTMpyO3ZYvJ4MoDMfgCv0jUiMgWoX6zrR5PWj
         EKkA==
X-Forwarded-Encrypted: i=1; AFNElJ9osZNTvMEbaW7/B7a1LpZKpAshgPRfq5lfbdpsZJU8Ch3U1JuuFEWQ964JUbF5abALP71RbS4kyXI/@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/qTrZwcC4o5D0hSmB5mj+LcNy3Pdj20p8RCLBR1PzW/UZJFV/
	mhLWjqOAtuNCwLA4ERqMhpCzT7NbDFxvpADc5fQaJvAOiWwZGIt6kNJCuF8APz/v2Mkbvoejnoe
	yVJWgZxzhk7HnJlLtiMEYLnPIH/OH9ONqlvyD
X-Gm-Gg: AeBDievL/reN2wGPdQoWxn7b+deGvZ6IaPYnMiKTd7Uwp9FOUTMKsu0flWHBuTiCjMU
	eRbHiaKy4lbxNdSfPB0HRR7/WmA3GB1LUzsn3BXjD55c99q3yDRsp0xy5T1N+zd4yr8oGRHM1Ne
	NB2eUrqzR0ZuxxAEHwg3DdrOWn18Lmy2xjESxjhPGvdW0XWTp84JeNZgz1+37HpYf+N7HsA+8qo
	VBSJA/3PqvZm/uNhUbYJfGHSdhBGGHH+m3eBBqOL1kmfdI25cSkJ77DOxwQz0StiTysRk0xwVdI
	KMalCmareUsy/yTY
X-Received: by 2002:a05:6000:2287:b0:43e:b0aa:7311 with SMTP id
 ffacd0b85a97d-43fe3e1e29emr32874064f8f.47.1776831834230; Tue, 21 Apr 2026
 21:23:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-17-joannelkoong@gmail.com> <CAOQ4uxhK4dy-=c_5oZKZW08+a=P0vN75q8A7RAWNnuhdeSVwAg@mail.gmail.com>
 <CAJnrk1ZySOkK31eQzUjGKj6pZhiHHEFGcBOk2Y0ybNqtc88a=Q@mail.gmail.com>
In-Reply-To: <CAJnrk1ZySOkK31eQzUjGKj6pZhiHHEFGcBOk2Y0ybNqtc88a=Q@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Apr 2026 21:23:41 -0700
X-Gm-Features: AQROBzD7YqIBYAnVEyQSMXfUH3RRbjiIANIMRWQsq-GizP6ZEipB8akSBrmkiug
Message-ID: <CAJnrk1bZVcnZUDQ05nS1RZUBetTQc-JbBrgh93XTkX9fwEqQmQ@mail.gmail.com>
Subject: Re: [PATCH v1 16/17] fuse: add passthrough open
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 9:19=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Tue, Apr 21, 2026 at 1:21=E2=80=AFPM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > > diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> > > index c70478f07d6a..eb55c4b42a4e 100644
> > > --- a/fs/fuse/passthrough.c
> > > +++ b/fs/fuse/passthrough.c
> > > @@ -282,3 +282,62 @@ int fuse_passthrough_setattr(struct inode *inode=
, struct iattr *attr)
> > >          */
> > >         return fuse_passthrough_getattr(inode, NULL, STATX_BASIC_STAT=
S, 0);
> > >  }
> > > +
> > > +/*
> > > + * Open a file in passthrough mode using the inode's backing referen=
ce.
> > > + * Called when FUSE_PASSTHROUGH_OP_OPEN is set on the backing map's =
ops.
> > > + * This skips sending a FUSE_OPEN/FUSE_OPENDIR request to the server=
.
> > > + * FUSE_RELEASE/FUSE_RELEASEDIR will be skipped as well when the fil=
e is
> > > + * released.
> > > + */
> > > +int fuse_passthrough_open_inode(struct inode *inode, struct file *fi=
le)
> > > +{
> > > +       struct fuse_mount *fm =3D get_fuse_mount(inode);
> > > +       struct fuse_inode *fi =3D get_fuse_inode(inode);
> > > +       struct file *backing_file;
> > > +       struct fuse_backing *fb;
> > > +       struct fuse_file *ff;
> > > +       int err;
> > > +
> > > +       /*
> > > +        * This should always pass true for the release arg because w=
hen the
> > > +        * last refcount on the file is dropped (see fuse_file_put())=
,
> > > +        * fuse_io_release() needs to be called on the inode stashed =
in
> > > +        * ff->args->release_args.
> > > +        */
> > > +       ff =3D fuse_file_alloc(fm, true);
> > > +       if (!ff)
> > > +               return -ENOMEM;
> > > +
> > > +       ff->nodeid =3D get_node_id(inode);
> > > +       ff->open_flags =3D FOPEN_PASSTHROUGH;
> > > +       ff->passthrough_open =3D true;
> >
> >
> > I think if the server did not see the open and did not provide ff->fh
> > then all the file ops that carry fh cannot be sent to the server. Right=
?
>
> I need to research more into this but my understanding was that the
> logic in the patch avoids sending any ops that require ff->fh. Though
> maybe I'm missing something here...
>
Ahh okay I see, I'm missing FUSE_IOCTL, FUSE_LSEEK, FUSE_FLOCK and
some others. Sorry for missing that, I'll fix that up in v2.

Thanks,
Joanne
