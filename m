Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FFD46D579
	for <fuse-devel@lists.linux.dev>; Mon,  5 Oct 2026 09:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193631; cv=pass; b=r2ecbN76Mr7kFkBQFZR1nbJS3P2Mi5zH6PzCC0+CuBBNbJ1dMkiGKjW1lt35cp4LxEKJZ89z14IWb/Jv2ihvL/FjbFkRBnuso67/P4VVYfBQI0YSbVDHbMX/ai8dUPy71vRBxL9zLqmDH4eEOwTyoFHXUC/dMaPoYLGdgg1/BxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193631; c=relaxed/simple;
	bh=t398vXnJkLdtQG+smof72e6y5/ZQ0xhfNFlipmHb3tY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nB1aGCWDqW3BhJr8hPy1U7q9xDOAPSd7AgvPxD50X2V4VZRq1ERHHOPVKSxDAsPatXrYBoXGGs4WGbC8Jlc2MaT+tliwl6r1TLZQSLAP5bwz3IYtR+CvP5VnaejO0eSQnmmOLaDNqtMs9EkHIZ8dRbKVxJLAduyzhqDjUgFLnEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=jU0Y23rc; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="jU0Y23rc"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb766bfd3so12094781cf.0
        for <fuse-devel@lists.linux.dev>; Mon, 05 Oct 2026 02:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791193619; cv=none;
        d=google.com; s=arc-20260327;
        b=TAlQMiCj2vILckc4k6chztmuAERt+DLJEVfLwsGXZXZPukJCvvLaXDHD/gLDK6UVkd
         0qRoMSZRb44aj8fZIRMoaGH+XQ1hZ9cyC5mLcmLVCiamoIeVZJbszy0CgJYdFbwVI9eI
         PFz91xH2TAzWjWlgTaOQaERaXna2bhexNDLeJAw0+2CUBFL4TO3syez/LXQlWs2NKd6c
         eoDOQnBKM6h1pbwW59y/THPnKNVtlRCGQpmRKKgU6H6BM/5YNAOtvmKv2OdzquW5NxVZ
         tJqpYreEAMBThqOnNfTYFXX+x569UwxxOtH7kZpVv78NuKS0slFUcSt5kl9XCW2ycX2u
         yV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2x+PPGLVG+ZTg2V6l16xtjRBE7YmaOwtXNyp9L8s3Uo=;
        fh=3cyaOujmr/+o2YOl6bC5KJV6ZpiWPMWi0+t88HoPCek=;
        b=iMPUhnvXhvTsZ3hPNageZ2QB6cS6skHMJGMtH78k9N8BREDZWAHGYU2EGx4E2yBS7T
         IXjaEN+RLcdCDfI9gN6gmKXFS5zEfZoiZ9hfFTDWJJLLDI2HTCy2cG9HTRQxuuVVxG35
         Ah2gCSK0qm/aHReDRzZf1V4htgF0Y6RPfN2BDjIaNDamYGPkfvQry9xUIOegN0W4InrB
         9WddiD5i44bgPOpF6xf3n0ZeLgF56dm1FEWooufNkjbEMAiXmNc3gAnFjjqfOxL2pfB3
         uygTjK6PLkh5tYHkN5R50ELBwMmZjUjRJB2vxQOSjL5CXlsvV59EwtweEaJFLCDkjQRi
         k6OA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1791193619; x=1791798419; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2x+PPGLVG+ZTg2V6l16xtjRBE7YmaOwtXNyp9L8s3Uo=;
        b=jU0Y23rcn6aNhX22+ziMUXTIaLljgzWzP58TX0W3i/V7gohneBQPgXHC8TUK1uaJup
         5bS0fBPDxzJCWFcuD9w6o8N5uWZ5wYp3FnmGEABTFRhDsSJSiwDLozipXnKcJRwxozbY
         jvag+glGgsp78bt5j89laaNWfu1IvMhmmh784=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193619; x=1791798419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2x+PPGLVG+ZTg2V6l16xtjRBE7YmaOwtXNyp9L8s3Uo=;
        b=1R+NIfbxJyzcR6nZcNx/B85gVJsZ+SFX5FFD55NSPzvgqG50KLDQLIr/MKyp4TWOhA
         KoKBIID/wtY+0Am8IkgD5orupqwHuUkXQZcjQ/IwRlr9ymPQJ8tV4WnAuIkQPND5+m4R
         hsUClh1CsRO5s2h75KmZWgGuxKnobeXIMUxCP5eyqiLsYDQ4Tf+37iFCvafkXQ0hfl3o
         495qwO0v6YEXejr/Qm1AzELt3aXMcYwzugyVLy48sYMNJOXFbh7IQNgNFba+Vw6ep89l
         EsoWxenLwEOvVdvk4WDDJz2eG4zgTI1z0aYtHVO3+53U+N/eH3MA5YHa9AyZEOEU11Gi
         zPQA==
X-Forwarded-Encrypted: i=1; AKwUvBwY3JD2oSreUik++NV98bI4du2cxTsU3vxPBTDAcG3GajV8P3U8+jX2SgJqRUosw6rzm2RSFNKdrbmx@lists.linux.dev
X-Gm-Message-State: AFuF++mdrPvNmbZ503k2Codor4eAUWytkq3gKb6C6BD9zn++MxIBfYk/
	sHpuSlZ2USpcGwIhfnbKefXUB0d2ciVl9SgVzkAKd8LN7uafKM6jfEwogbkrJG/PQGbJdCGOLh1
	kuwwpMPnl/W7KmzHlZcj2nhPbaERWkooPoBJTP12rvQ==
X-Gm-Gg: AYBFou3hcyRirY6VpYBTmGuYA0mCIcUaL46Dx+W38pGwW8O/jySWtA0w+nwy4bAeBhU
	FKLwzJaN7iuswrrZa3w8twlGKkkGM1qq2H5KxhFJcX0htO7pKU05aRv1GvYd+EeQP0cttKrD4eY
	yQTBgOp0i1Jt0HY81fJyYsRzWNJLnx4jes7nQG3R7q777k5pIiGyUwXonL8sG70OjgdBo37Y4un
	g3tFAgSXGA4bYAeLtJPO/1rBFLDwcmhMGRkZYPxSdQ6dy5CG3gck0ossFWzREX4XXlwXS68jLCe
	/1DqaAkAThiWGF9UXX1FY5I2JiKFi9svWtuS9PsxB+Eiqk3oUwXqGdZ8dx7sTkuIJ+QspHH7ziK
	wfCH+glVtZ66J
X-Received: by 2002:a05:622a:4296:b0:533:3fc2:8b19 with SMTP id
 d75a77b69052e-533cba5b5b6mr179731811cf.20.1791193619134; Mon, 05 Oct 2026
 02:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001150935.655979-1-mszeredi@redhat.com> <20261001150935.655979-3-mszeredi@redhat.com>
 <CAOQ4uxjQYaFUG=VT1LoKbs3QUTbTeEy3tTY=_FMujMiWGRR_=A@mail.gmail.com>
In-Reply-To: <CAOQ4uxjQYaFUG=VT1LoKbs3QUTbTeEy3tTY=_FMujMiWGRR_=A@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 5 Oct 2026 11:46:47 +0200
X-Gm-Features: AclHuK_XtJM6zEUYob9rIZaAPpf4JoILbPUmLW2_NodFgyAwj0rWiXxNnekRhk8
Message-ID: <CAJfpegva+dThGSUf0jEhp_9FTyw6f+ZC-5D0F0R-gPPSxXypYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] fuse: add helpers for EIO return value with kernel message
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	John Groves <john@groves.net>, "Darrick J . Wong" <djwong@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Oct 2026 at 18:39, Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Thu, Oct 1, 2026 at 5:09=E2=80=AFPM Miklos Szeredi <mszeredi@redhat.co=
m> wrote:

> > @@ -118,11 +111,9 @@ static int fuse_file_uncached_io_open(struct inode=
 *inode,
> >                                       struct fuse_backing *fb)
> >  {
> >         struct fuse_inode *fi =3D get_fuse_inode(inode);
> > -       int err;
> >
> > -       err =3D fuse_inode_uncached_io_start(fi, fb);
> > -       if (err)
> > -               return err;
> > +       if (!fuse_inode_uncached_io_start(fi, fb))
> > +               return fuse_EIO("failed to start uncached I/O");
>
> Why lose the internal error code?
> If server implementation is wrong that is a good hint of what went wrong.
> ETXTBSY is trying to mix cache mode and passthrough mode.
> EBUSY is trying to passthrough to two different backing inodes.

I'll move the error codes back, and turn them into fuse_EIO with an
appropriate message in the caller.

> > @@ -234,22 +228,10 @@ int fuse_file_io_open(struct file *file, struct i=
node *inode)
> >
> >         if (ff->open_flags & FOPEN_PASSTHROUGH)
> >                 err =3D fuse_file_passthrough_open(inode, file);
> > -       else
> > -               err =3D fuse_file_cached_io_open(inode, ff);
> > -       if (err)
> > -               goto fail;
> > +       else if (!fuse_file_cached_io_open(inode, ff))
> > +               err =3D fuse_EIO("conflicting passthrough open");
>
> Same here.
> If we can keep this bit of information and print it - it is helpful IMO,
> even if we don't go all the way to annotate every error case with
> a pretty log.

There is just one way to fail fuse_file_cached_io_open() so I think
this is okay.

Thanks,
Miklos
