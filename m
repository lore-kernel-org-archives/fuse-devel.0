Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D5227F75C
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777052634; cv=pass; b=LfivJk8dLXUHVId2nYBzd+8XPf5EsJ8PH/3+W88W3ccYQBu3bfXNXs2QRmd70oCpeOtBJZlRSvIFTTVF00GPJSRb7F8aDOYTYOQgk+QJ/lhen8cTTk+5gNvFFxrO7dzB7R1BxAJz3UrYlijWOQysIh8AkCnjxtVw3VA//fbrj6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777052634; c=relaxed/simple;
	bh=An1ZZFg/WBzydFx0+JosCvIWh5c7d6/ue092ZjQ8Z7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gS6xkJ77HejSwWZvFbdsN/0uru9T2iM/j6rIh97Jh5EAklnQgjSCneY5nHiUMMlir6hGs+VMM9aB//gl989X5RnY+vNXyO62ko75dZnS1anZ6fuWpP0DjU6DvySrwJ3mKfFNx/XUZ2SUg5bHB9j19hGXh8MABQAa6+LoVp8cVHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUg2YbIo; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUg2YbIo"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ad135063so73136755e9.0
        for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 10:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777052631; cv=none;
        d=google.com; s=arc-20240605;
        b=RuPYCa8Bn7zLvhIfHnwdSBMC8FG/tOs5X+24Iq4T9pbNGPURl3imfqPYXI2HCkDDtW
         96turly+nZjYUJ/zMeP2jALSIpPTQqG6tZI04bDS1FjX8uaTT1RUwk2T0FxL8l2SkWB4
         sYGsiwg3aplnBhrRyT+7rmkJrp09k9ftp4Dqti3exrc0MVHlgqX7VKh2g9TV/17B66TE
         Yb7b2kzSM9ZEBMzuIG4BPtoc2PH/8tDJ6DSJohVJ0wScWlenvrIEjCKiWH4PPhpnHYwd
         tZ9WMhuCvWW+JBGvCXtN19DF5zqEFY58bpbNzkvaMzszIf6O4ZbAbONL9bTK41wAmTaf
         lfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Lbg4Bnrzg7vrML3vUGq88JyT2Aj5GB32L6Pgj3+kok=;
        fh=rJHLp3PslOa/7/5x6lhE22G+c9Vm3BG5o7kPbRuWuj0=;
        b=emIDRm6tVzIFNl+mRS6iLXeIx13toitCCfNMtJrOVn2MmG+bBZs7uPR1tCCzlkptmp
         G1TPRKgwFmGg8dP2VmBXsWwcKmFnskvYGYFT7BSYWbxvrWRxQVmiHmfkoAgKq8k+pQzN
         0fMBiDf5q72Eq1UEmq0/hBL+4YeYMPLTHAl/DsgXes3ww3RqsV414YkCVgdkdRMaiUln
         01d9cc4StQZS7vx9scQO6XxtaSc+kSoBWAUv//v+cCKRDKZ3zTfvDLAr2IgomCejRqZh
         ZQjQKsjyi/nNlpY/60ME/V/CPaeUB5uFf8fvpRWXVxjzabsYGzpaTaG0AtTbxqKwqshq
         wRAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777052631; x=1777657431; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Lbg4Bnrzg7vrML3vUGq88JyT2Aj5GB32L6Pgj3+kok=;
        b=lUg2YbIoW6a20ZyBBo2q1CUdG4ZQifQ6/l0Kt4PXMUFYfW9avfczok+6KjuKnPyGFr
         uDtsS3noGl7nboq7cNeIBwR9ewPT5D1DHbQItLbivpWaqOcj4mLJcK/RqN8g+SXcWFUw
         JDvddRyzFDJwGe8xb/31uoXCDtIafMXxeDZ49GimuMgwL0uFDN6nFFa6DBKJmwjA02E2
         DA31cbGSLhPaz1eJo38saQAgl7AH2P44WdWOCyt9UFXxhrIjkpVPNR4Mw27otuvw38Be
         pTyJdBTQOXnf33o+3dlQpUBzU86nKEtRl21ueNBDuEJqwMMjOcv6BFTon1ItZnn9Xhd3
         c0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777052631; x=1777657431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Lbg4Bnrzg7vrML3vUGq88JyT2Aj5GB32L6Pgj3+kok=;
        b=gyxrbnWp7DKkGfaJahL5nhHxWscWdtQ2YievKx0fy1zuWPtkyCBioN6UzS97zEWniP
         V8dEeQxFwmBKf6NNc3sV0Bcw+ZhpliUV8GO3p92HuC4qGHSJgtu8TRqVZDr18S2c9QnE
         m9ZL87UQAwGclW67fhL5kYMdkI4e8pSFMJ8w6u5bDsEaAwiBRkZuh6jedXOoeA0v3qi+
         fGvckMLWX0qb1GpyOXwq+rxcg7NmaLhhHdyGMLjuNfUnHMjUcQSlQIXcqZpMPntSFBoq
         UFLqsyLNE95e3mkqZvGI0DddJMo6msZMbRc9ukIf285iAuKo0ca7Zvz/9HsBaAJV4/d9
         Kisw==
X-Forwarded-Encrypted: i=1; AFNElJ9zsHaCbXpJRH0l81Q+8c82bBduakJlKTE9uIl4w+2H9OaJPN0jL4yphIANedLqWwfo8dqb2Yg9eNLs@lists.linux.dev
X-Gm-Message-State: AOJu0YyLxfbJykMGxk6A1tvVCO/fO4cvZ/1q9hjhGzFuXUB0eo9zWmiK
	UMUf9Dln8kE2zEPaKpQRckvGRGERzAGtJbjFm0ZiaN/IdBwc8Dlcd+0xNh9AcaggOdK8UIkr1zE
	CMV79pIiQJv03CCmbsjWvI7rNSnOU+UQ=
X-Gm-Gg: AeBDietft5s3xVRN25rCh7K3amVDgejDbfTk5y93cPUvmUCk+8/osy+68389VO4+UPL
	QklibT+hNnZodqdnlBuexRw1qS8PpAQfSNQG60hG5ii32f2gwIUMn+vM/sfVFwNPr5LAvT4iBv2
	cYHSL5UxCL4CNMlLhfOiTlimQi6sGe5XJ4Z/mi88m/iWQ/ajKtZrJSKtR/S9DrhZhtV+nzQ+8wu
	LOWNtxjv64yeEZdcncfQbZjTlock8tfzd+yM3x9NPzmhsJHo+L9blK+uqwo+1I+W87Dft3MtRqp
	XiC8vW4snjt2MY9xQY/OYVFEKU1ZXgUjqA==
X-Received: by 2002:a05:600c:821a:b0:48a:56de:d620 with SMTP id
 5b1f17b1804b1-48a5aeb78camr177618695e9.14.1777052631216; Fri, 24 Apr 2026
 10:43:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424011646.457682-1-joannelkoong@gmail.com>
 <20260424011646.457682-2-joannelkoong@gmail.com> <aesnPUrYPZD1SrZv@amir-ThinkPad-T480>
In-Reply-To: <aesnPUrYPZD1SrZv@amir-ThinkPad-T480>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 24 Apr 2026 10:43:37 -0700
X-Gm-Features: AQROBzA3KuiZTX4APdzWqz_IRX90mfe5vjqhto5LpxjQRVFmjruPkzGtipg898k
Message-ID: <CAJnrk1ab_9F2=nmmciXdCLVBVTfV27tPKGbUq-PX8MFteO9_8A@mail.gmail.com>
Subject: Re: [PATCH v1 01/13] fuse: fix missing forget requests in error paths
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 1:18=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Thu, Apr 23, 2026 at 06:16:34PM -0700, Joanne Koong wrote:
> > If the server returned a valid nodeid but invalid attributes, the kerne=
l
> > needs to send a forget request to tell the server to release its
> > reference, else this leads to server-side leaks. These paths only
> > trigger with a misbehaving server returning invalid attributes, so the
> > real-world impact is minimal, but forgets should be sent.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/dir.c | 52 ++++++++++++++++++++++++++++++---------------------
> >  1 file changed, 31 insertions(+), 21 deletions(-)
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index be41c14ef329..6ab05d7d297d 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -583,7 +583,7 @@ int fuse_lookup_name(struct super_block *sb, u64 no=
deid, const struct qstr *name
> >
> >       err =3D -EIO;
> >       if (fuse_invalid_attr(&outarg->attr))
> > -             goto out_put_forget;
> > +             goto out_queue_forget;
> >       if (outarg->nodeid =3D=3D FUSE_ROOT_ID && outarg->generation !=3D=
 0) {
> >               pr_warn_once("root generation should be zero\n");
> >               outarg->generation =3D 0;
> > @@ -593,16 +593,18 @@ int fuse_lookup_name(struct super_block *sb, u64 =
nodeid, const struct qstr *name
> >                          &outarg->attr, ATTR_TIMEOUT(outarg),
> >                          attr_version, evict_ctr);
> >       err =3D -ENOMEM;
> > -     if (!*inode) {
> > -             fuse_chan_queue_forget(fm->fc->chan, forget, outarg->node=
id, 1);
> > -             goto out;
> > -     }
> > +     if (!*inode)
> > +             goto out_queue_forget;
> >       err =3D 0;
> >
> >   out_put_forget:
> >       kfree(forget);
> >   out:
> >       return err;
> > +
> > +out_queue_forget:
> > +     fuse_chan_queue_forget(fm->fc->chan, forget, outarg->nodeid, 1);
> > +     return err;
> >  }
> >
> >  static struct dentry *fuse_lookup(struct inode *dir, struct dentry *en=
try,
> > @@ -882,22 +884,21 @@ static int fuse_create_open(struct mnt_idmap *idm=
ap, struct inode *dir,
> >               goto out_free_ff;
> >
> >       err =3D -EIO;
> > -     if (!S_ISREG(outentry.attr.mode) || invalid_nodeid(outentry.nodei=
d) ||
> > -         fuse_invalid_attr(&outentry.attr))
> > +     if (invalid_nodeid(outentry.nodeid))
> >               goto out_free_ff;
> >
> >       ff->fh =3D outopenp->fh;
> >       ff->nodeid =3D outentry.nodeid;
> >       ff->open_flags =3D outopenp->open_flags;
> > +
> > +     if (!S_ISREG(outentry.attr.mode) || fuse_invalid_attr(&outentry.a=
ttr))
> > +             goto out_forget;
> > +
> >       inode =3D fuse_iget(dir->i_sb, outentry.nodeid, outentry.generati=
on,
> >                         &outentry.attr, ATTR_TIMEOUT(&outentry), 0, 0);
> > -     if (!inode) {
> > -             flags &=3D ~(O_CREAT | O_EXCL | O_TRUNC);
> > -             fuse_sync_release(NULL, ff, flags);
> > -             fuse_chan_queue_forget(fm->fc->chan, forget, outentry.nod=
eid, 1);
> > -             err =3D -ENOMEM;
> > -             goto out_err;
> > -     }
> > +     err =3D -ENOMEM;
> > +     if (!inode)
> > +             goto out_forget;
> >       kfree(forget);
> >       d_instantiate(entry, inode);
> >       entry->d_time =3D epoch;
> > @@ -925,6 +926,11 @@ static int fuse_create_open(struct mnt_idmap *idma=
p, struct inode *dir,
> >       kfree(forget);
> >  out_err:
> >       return err;
> > +out_forget:
> > +     flags &=3D ~(O_CREAT | O_EXCL | O_TRUNC);
> > +     fuse_sync_release(NULL, ff, flags);
> > +     fuse_chan_queue_forget(fm->fc->chan, forget, outentry.nodeid, 1);
> > +     return err;
> >  }
> >
> >  static int fuse_mknod(struct mnt_idmap *, struct inode *, struct dentr=
y *,
> > @@ -1010,18 +1016,18 @@ static struct dentry *create_new_entry(struct m=
nt_idmap *idmap, struct fuse_moun
> >               goto out_put_forget_req;
> >
> >       err =3D -EIO;
> > -     if (invalid_nodeid(outarg.nodeid) || fuse_invalid_attr(&outarg.at=
tr))
> > +     if (invalid_nodeid(outarg.nodeid))
> >               goto out_put_forget_req;
> >
> > -     if ((outarg.attr.mode ^ mode) & S_IFMT)
> > -             goto out_put_forget_req;
> > +     if (fuse_invalid_attr(&outarg.attr) || (outarg.attr.mode ^ mode) =
& S_IFMT)
>
> This seems like a repeating pattern.
> Would you consider hiding this behind a helper that validates we got
> an expected set of attr:
>
>         if (fuse_invalid_attr_ftype(&outarg.attr, mode & S_IFMT))

I will add this helper.

Thanks,
Joanne
>
> Thanks,
> Amir.
>
