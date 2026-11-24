Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795521212;
	b=0eO3nRVaN+P7oh4lXPerWebo0hjYqyFt+PL4gBFMn+yqDEXzSDLUhk8kviNVfRUAwnBS
	 0SNu2NnCRj9QFacMJUCQjADxoJ4ZaOBz6Oortpl+wKx4pBtbOKgGiKVC0uzI+cvSj1gS7
	 gUVEMmY5HleB2fzFolQ3AaUEhxybxyIJQ19QOGpvUE4oAkMYnhRJ14fbAdU7xe7dOIGJr
	 npZvmlF89OOaoCOT89DnNyfN1JXYrbbskhlhfgaERP4WTKMhj/k++45bVYQIsAoTndh8y
	 ykZGQxn9uibgMqnvdAPBlBkH4FuA3kynVN045WJN7pf/xkxhSsa6rYrcp4kjNe+8xhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fXDSwCteyZ/xoOThhEVEgHgDKXealTWvNjRPjKwF/z8=;
	b=OKmeW84U7UJBTJMzqSvRxZYfzN2ldhSXGwkSdj80nrijUXQhJPqLccuetwunpSQuN/Ag
	 xmJWWBqH3eXQ8BEjEzwsc0jFNNI1g2lXK6M5vj3obdt7L6XmXxhsdRbq3Xq+mqBLJ/RMG
	 inxKIGjVPHO1+z3B2JEfwW616LZFFg7dP196S7GK6+I4hwVbxmqknx2KmiejCpAmlpUr0
	 R99CX8gHkK7M6Jh56I9KeKRNKT1AyzDd3BonDxiYyMfnSuliMitTTN/B998hpyr5vC+Tq
	 0cK/ubzVY7HQz4RKQj0br9KGMGFauRRXyh5EgoH5lxQynrks46JkCr6Q9vNvTEiPZYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=RDkTejwO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A14606A31E
	for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 11:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A14606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=RDkTejwO
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55c35262674so34409371cf.0
        for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 03:53:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795521211; cv=none;
        d=google.com; s=arc-20260327;
        b=W3/7sSGiZ5xTWas1XhZpoC9ceN54m3DZ4kabQXWjr8MHOIXi8DTB4IfgvQEyEPl6Kg
         Tvjwwq6FOb1MKDGq1bi+Q25PCKi+Pp/zJ2ABRvpeODkq/mMcUSpPKY0YrDGGUs1f3Q8x
         IPykWvFjqVH88ZhmEAeVp14cSzLIrzs9RZu8eCJKHdorBFjbA76kgftl3G8IvpJH5CGB
         tHeiTLDCgERTSTdtdwKPbv+RV/lJ570fmh792X613d57gUCLzHtY5AdtZWxLRj6YaE55
         q5CxKTxIH4zv8SzzAkprg/OTEEEfE3LBWlefjvBvCfShjcPdDRX9GpGT0VPLDfIz1JLt
         +MzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fXDSwCteyZ/xoOThhEVEgHgDKXealTWvNjRPjKwF/z8=;
        fh=V5e+tzhdXiY9yl0PDwbU8ux3Gn02H+Ju1rgQ/Ts6JWQ=;
        b=Kr4eZtRn3dN+BxNvT+tIY913eTBJmui3EtmiIXzsfwUolIFWPZKtkZ1DDg0gNcdE4c
         fxPCwRuhTw8wWcS666IQY1wWc51P29IqZ4u0rbRaajVaRI2qelsgU45omrSDrF0oy0tk
         pjh6aGcvRh+gkbq8ehf7DZ5gjc/0dVVxhFqiYZq+TbrD3Bpa+d74Q7HdsMEieteXFjuw
         buohqfTea2u6UiXpgzd5i/gVv6MJDPMAOHebBypiPivzypl1YqoVxFwZvpyPeZl4NNi8
         cZNduMU1X/yriJW3phWWR3vVge7PymwaWUtHx1uo7dHBob6iRHDFMh7V8VwHN6SA+hbz
         F1Hg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1795521211; x=1796126011; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fXDSwCteyZ/xoOThhEVEgHgDKXealTWvNjRPjKwF/z8=;
        b=RDkTejwOFRotSEOL4XUGTMWhBwglqklg+1t/vIoDkhZmJssdhBwuiG4UAYp7TBOpcP
         XVb8x/LbWoATO5az9UsBpgUTqeuzVEo38Gh8HqFSDB8/7QSQ9mFnYMGrZBC66YgM7qt/
         sCFK1Y2JK70Etr3AD/hNstLLJL3edJje3HawQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521211; x=1796126011;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fXDSwCteyZ/xoOThhEVEgHgDKXealTWvNjRPjKwF/z8=;
        b=tH/6TtQpbqWNn/j/9TBbBKTts9J8XEJsiiCbrr8zTkUkpF8oJoTN/2ZX3yJoprSaWD
         unybeWCThHAvWcVuD5q7xpUccjVo4gyR+OQYRP4kiaXutBqlsuonAY2hfs9FYIhAYdXk
         ycWe9OzUhz3aX5Z/Qda3eFJgscaSeEhzYhRZlC+xYxByiQq8QlyKvEAb3ImIFQaGz7A/
         if/kMFoJxE/vgoNYQx3WPBi7BG6Ayzp6LqK6UayT+jNeyxtXLnTsDEEPeSKHHkGX635B
         tN/xCtFVOxvDpYNDP98mTQWct8Q4FUQVdfdutGwBz7L0IBUjWpz+eFdnvtSL4qJDsWKK
         heJw==
X-Forwarded-Encrypted: i=1; AL+hErFltgqku2uX2YIXwQwp/qgUk6UBspfgCGQbiWlaIvUhlnseH/0P72f/e3MPQpGvtX7Vy2vODmpTMm9o@lists.linux.dev
X-Gm-Message-State: APuU4Z91XM9klyD5ArUuZ0B1/nIeiWzF1EdtXUEO9+GibuakvwnsIvJu
	U43bOSOXuOYG94NiV3nV/1yeRtBczNKt3Morx+5/XX4bXQN9C87Ek/yAMi3xCxvrStP75zlZUbU
	YsFXyBzpVhOM+7PmjyLvFk0IwazHlokxnG4GhAX9EYNNtwH3BlUly
X-Gm-Gg: AZFdTZcWU6Cqcj3uY2bFx4l4m0VVfEgOh5++IxgQ2iKoD8qxAOADdrymdNonWfia4fp
	EQwD/bvwSR2lQS88jPZifsiCLqlQE84pXzfn50P03JTlVUbD3wGJ0Zwj3F1YWBsTdyF0m3UgEuQ
	xFDMltP9wXSzRiXGZcFqRHL+IZiBriXmWgILF05mfhaWowsi8T+cDgSR6MGq84Rg+LkQL5IOwmA
	ku9CZtxlNu5sStrSCiGV4qQWB7X2+RJzMV2xrNkVDSTmENYricnr49pwjG7mQHNDzdf/OQyBZn2
	11OYcMki07iMn2HhMZdkCkB4jD7bdNTPVOybKIeGUvg+lPYQPlYpkscFvt8cAJeh9j0K/ZVtZlV
	LqLPtU0T6AHRVtTBLtp6/tQS+cDang074QU9M7/17hkxmCnNimlPsDxPQHYU+SzsduyxTZg==
X-Received: by 2002:ac8:5a08:0:b0:55d:4be8:937e with SMTP id
 d75a77b69052e-55d76a2d266mr263720841cf.50.1795521210875; Tue, 24 Nov 2026
 03:53:30 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105150943.86650-1-mszeredi@redhat.com> <20261105150943.86650-2-mszeredi@redhat.com>
 <656d0e00-01a6-4e90-a924-4ad2329c3d74@kylinos.cn>
In-Reply-To: <656d0e00-01a6-4e90-a924-4ad2329c3d74@kylinos.cn>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 24 Nov 2026 12:53:19 +0100
X-Gm-Features: Aa3M54pdQT8drGLIpCz-lb5dYncahFoRCAsGVIFwkCZg_LrUi6uOLzpn0GsGbkg
Message-ID: <CAJfpegsOCq4oGfxzYh=DdL5x2BxaWc=c-SnSi1SOOk4eDOooqA@mail.gmail.com>
Subject: Re: [PATCH 1/3] virtiofs: fix use-after-free of fs->tag on device removal
To: Li Wang <liwang@kylinos.cn>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	German Maglione <gmaglione@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	virtualization@lists.linux.dev, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 09:50, Li Wang <liwang@kylinos.cn> wrote:
>
> Hi Miklos,
>
> On 05/11/2026 23:09, Miklos Szeredi wrote:
> > The virtio_fs object is refcounted via its kobject, so a mount can keep it
> > alive well beyond the lifetime of the virtio device binding.  The tag
> > string, however, was allocated with devm_kmalloc() and is therefore freed
> > by devres_release_all() as soon as the device is unbound, i.e. right after
> > virtio_fs_remove() returns (see device_unbind_cleanup() in
> > drivers/base/dd.c).
> >
> > virtio_fs_get_tree() looks up the instance, takes a kobject reference and
> > then drops virtio_fs_mutex before doing the sleepable part of the mount
> > (allocations, fuse_conn_init(), sget_fc()).  A concurrent device removal
> > can complete in that window:
> >
> >   CPU 0 (mount)                         CPU 1 (remove)
> >   -------------                         --------------
> >   virtio_fs_get_tree()
> >     virtio_fs_find_instance()
> >     // reference taken, mutex dropped
> >                                         virtio_fs_remove()
> >                                           list_del_init(&fs->list);
> >                                         // driver core unbinds device
> >                                         // devres frees fs->tag
> >   virtio_fs_fill_super()
> >     mutex_lock(&virtio_fs_mutex);
> >     if (list_empty(&fs->list))
> >             pr_info(... fs->tag);   <-- use-after-free
> >
> > The virtio_fs object itself is still valid here, only its tag has been
> > freed behind its back.
> >
> > Fix the lifetime mismatch at the source: allocate the tag with kmalloc()
> > and free it from virtio_fs_ktype_release(), so that it lives exactly as
> > long as the object embedding it.  All probe error paths already drop the
> > final kobject reference, so they are covered.  Merely dropping the tag
> > from the error message would paper over this instance while leaving a
> > devres pointer embedded in an object that routinely outlives its device.
> >
> > The other readers of fs->tag are unaffected: tag_show() is fenced off by
> > the kobject_del() in virtio_fs_remove(), the automatic KOBJ_REMOVE uevent
> > is emitted from __kobject_del() while the device is still bound, and both
> > virtio_fs_add_instance() and virtio_fs_find_instance() only walk instances
> > still on virtio_fs_instances.
> >
> > Fixes: a62a8ef9d97d ("virtio-fs: add virtiofs filesystem")
> > Cc: <stable@vger.kernel.org>
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://sashiko.dev/#/bug/linux-0328b3a1-043b-468e-8425-6a613d91b5ef
> > Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> > ---
> >  fs/fuse/virtio_fs.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> > index ba8d79c4bcac..ef58bedc3941 100644
> > --- a/fs/fuse/virtio_fs.c
> > +++ b/fs/fuse/virtio_fs.c
> > ...
> > -/* Read filesystem name from virtio config into fs->tag (must kfree()). */
> > +/*
> > + * Read filesystem name from virtio config into fs->tag.  Freed by
> > + * virtio_fs_ktype_release() so that it stays valid for as long as the
> > + * virtio_fs object itself, which may outlive the virtio device.
> > + */
> >  static int virtio_fs_read_tag(struct virtio_device *vdev, struct virtio_fs *fs)
> >  {
> >       char tag_buf[sizeof_field(struct virtio_fs_config, tag)];
> > @@ -505,7 +510,7 @@ static int virtio_fs_read_tag(struct virtio_device *vdev, struct virtio_fs *fs)
> >               end = &tag_buf[sizeof(tag_buf)];
> >
> >       len = end - tag_buf;
> > -     fs->tag = devm_kmalloc(&vdev->dev, len + 1, GFP_KERNEL);
> > +     fs->tag = kmalloc(len + 1, GFP_KERNEL);
>
> The fix for the UAF issue regarding fs->tag looks good to me.
>
> However, while looking at this, I happened to notice another similar potential issue: when the DAX mode
> is enabled for file read/write, the DAX window is mapped via devm_memremap_pages and unmapped when the device
> is unbound. Although as far as I know, the corresponding QEMU changes for DAX mode don't seem to have landed
> in QEMU upstream, fs->window_kaddr and other established page table mappings still point to this memory region.
> Perhaps we should also look into cleaning them up?

Please do.  Can I assign virtio_fs bugs found by sashiko to you?

Thanks,
Miklos
