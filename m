Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339CA261B9C
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956489; cv=pass; b=CTpWG3rZDQ+lXy9Ge235ms/w5YUOZ5RlhDpJDidnvVI2cOYDqf1vk2iL6vUgcQ1j13HkBGBCBhXObb+UY2G3PlqS2dn4QO3HsyOgZJYhCqrDI7xgLj5lCcyvoQYCFBgCJMRU3Qvsc2aZaujeIqeJ2V1yl+TGHk736rP7X7JlQoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956489; c=relaxed/simple;
	bh=LclkXbULnV74eXU6/1IVNHt1FQ4l7ePqSXWsDF3P2S4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLRsNhf+UUrzhco+t889gSm38Uav6pfm/eW4IkVSMBIaGwaL0PbJqq524XlOyoys9aM07kV87HIOlsAxNVIRRSxn+QZzkh5otso/8gvU0/LvZWKrHJGgQzrzhAMJ50OnslOxOSVTOLTMDCRRiG3xGg33ewrClauxY6HRQDbK94k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdtvl3s6; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdtvl3s6"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bce386d5b85so147606266b.1
        for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 11:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778956485; cv=none;
        d=google.com; s=arc-20240605;
        b=DlpUnAsnci1H6I+1ufe7QgKvGko4E1dOgrHq38snsFvuEGL4axKBKJjeaNFSzcq/Kk
         arBoMUHHom2GvsGQdD9a/9V4pwNB7iV2G6aXXurrS+GDWDchZnyQswEm2adwbU2T0Xww
         YwVKHYy8P9wemwJTPi7WbXH0h1wOEPbdX/7tV631hOcxQhPHcKlOo8JUZ+fcE/qq0nJf
         l3GmQZ/obA2OSDSdajVc6FJNrGJGbbdq5R0A7/FyoPyhtgjbKBmGjcMpWXFNPXV2oQ3l
         lvRIcIAl1F9iEdgHcOqg3DgU/D11ANUS2KAmfhqwKKNrgxPEZwwGtJxld3WONoeslJdO
         M3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jst4J0K6rFdPUswjR8DsK/X1gYtqk0feBIACyM4lJJM=;
        fh=LBjzW2qgrX+WNu/9+V29mAfy5BDdngZkyGCGX9qIBMM=;
        b=BdZpDEDhogTUc71ENenv2z2Dj/xl9Z7W78UvqdceStuwr7kGXSpDkySsGr3DN3MGa1
         oWfaKIftrpgAjpU9du4mYiJnDwHAOABgPgstgDGyBKqbS1zH/JnaH/MdZ/au1NAcfCNB
         QGDeP8+uM7Evw6r3lA4kpxBS56JsSTP1anFeHL2//QOYT04E/m2tZExkR9rdAWRrVFpF
         71uS/23Y1QgK3n8sou1XWSbgC9gESlsSknCF73wpUyyqSWcVKM/MOdZ242wR6CBb/fIH
         1vH8vYXnWtiW8qgEFk4DSmWhTuc/gY6KdvnTK1tLm0EtlBaQkPdEE4+CUjh4emzlTVio
         N3xA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778956485; x=1779561285; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jst4J0K6rFdPUswjR8DsK/X1gYtqk0feBIACyM4lJJM=;
        b=hdtvl3s6Kkq+PTxRMDUEMYauk/FamxBRcSyVRd4sVg/W5K0HDmr7efpRM8D9Sqkey4
         TkgYsVhCWsFLOKfg1/+daXplp6n11WRhTCMQ5raxikIGitnE7l3ZnvMh+Rbl67IAdAOF
         vo+A/3BRvlujjvFJx+VZmf6gfFp9CLVfEQjxuGDGcVz+w221fbX0UpFbN9LGJAmuL77x
         /rKRFy11GTqSW4cj2kIeKfnT04thi75g1CGPK+N9faXbRfuLvOIYBmWFiAgjqRhuSk4m
         DESu0YWIZL2U6sc3u+pSnZ4au4WNJzrnxwrLerDAPxxKvB0wya+FGQXdc1dfVNVFlQLV
         0A4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778956485; x=1779561285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jst4J0K6rFdPUswjR8DsK/X1gYtqk0feBIACyM4lJJM=;
        b=N/4q4+pmbq5cNHN9ceH9xigzeiusouwgTqkz69dALB8LiROWW+Uk21F5Vt+siknvpF
         QM/7jq3gusMYvPOPXtjW0y6oRXTkZEagIhot7Vw3RFTc7UfZFcsiek+DvuAIp4Ys4urW
         dUwgVnrC3v9ufNMChnnBFGMzinVSwaUQX9fM2H8OTVbX8Pcloanq4QSU03+3oZ3JGKfa
         KE3GuendxrS5ciKznaHSAlEQY95DCyeGwAvEdQJj4WnscyaAKk4HhehZyPDzOfr3DDzg
         antsk0XEIzueVUxTucDiud9iwKhDqyXvdR1aWGAulZrbAsP0IyxAH9nAkP7li9tZP1GC
         EAnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xt8s9UjUuSXQ7Eknka587NhDyY9hOEwD9p5RiLg6O1n2Acm0CFIzFW5n7iufqALW1qdvW1gvDnx48@lists.linux.dev
X-Gm-Message-State: AOJu0YwzKidIJSvofgM67JUJp+zhVvg9t0xkXU4hseaiV9zraqFl9Q8V
	mStgqlliQFxR8NQOElQ85NdfF6MhUfIrRqD5ZNiDNHp6hntFAtpbxmXn2W5YNhjyfAOfEq/egNh
	zt0NURaBjDcUuSitK1dNSzGTxc0GOv4YkjBGDyLU=
X-Gm-Gg: Acq92OE6cqpMeS8KN3vVhVN0+PdZbgulsWUl+pBPb9H1qHSFHIA86c47JDmW2ArNj0+
	R4iEdTYvIJyUpcoFpjtk20hSVE1cbRWBv48/p0e4Cd0mqaKTGtkvIsUP9ZjPwqvBvaRsHWPQIMO
	US06LTliFzMwywRKffQ0Xp5/6zWVBkQMx3HfDkdWJKi/3sl/TSU4yKta3oZ1TaxlGu+auIWSP8E
	+zK16rSlhXcu9J1b5QboF0H1nu7FynpUOEIkkJdFDIdje+EusZxG+vLhmPqtqMtNOre1XSm6JDJ
	AmzNsivrRwhHzjnw5B87ftgmuynwNbV+U0Ovr52nSg==
X-Received: by 2002:a17:906:5189:20b0:bba:3cf3:2ba6 with SMTP id
 a640c23a62f3a-bd51792d9a8mr345197866b.29.1778956485351; Sat, 16 May 2026
 11:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-10-joannelkoong@gmail.com> <CAOQ4uxiWhWcNbKDo49vWR7HrN4p84JdvjgYyhptDqKxJ7dwoFQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxiWhWcNbKDo49vWR7HrN4p84JdvjgYyhptDqKxJ7dwoFQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 16 May 2026 20:34:34 +0200
X-Gm-Features: AVHnY4KM_UYWGkCV7hpeo2SVsVDZihlJ0eWCpAhlykTywHL2JEoqXL8puvwMmuM
Message-ID: <CAOQ4uxgOi=2Pk=-cJukZhoz4Jz9y9tvnoauTs-6teEfXU6i9Rw@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] fuse: handle partial io passthrough for
 read/write, splice, and mmap
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 6:57=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Sat, May 16, 2026 at 2:52=E2=80=AFAM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > Servers can now pass through only reads or writes instead of being
> > required to pass through both. When the read or write operation is not
> > passed through, fall back to direct io for handling it. This avoids
> > cache coherency issues from mixing the backing file's page cache with
> > the fuse inode's page cache.
> >
> > Reject mmap when passthrough is partial or not set for read/writes sinc=
e
> > mmap requires both read and write access to the backing page cache.
> >
> > The FOPEN_DIRECT_IO check in the read/write fallback is not strictly
> > needed as the caller already handles it, but including it here makes
> > the fallback logic self-contained.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/file.c        |  7 ++++---
> >  fs/fuse/fuse_i.h      |  3 +++
> >  fs/fuse/passthrough.c | 18 ++++++++++++++++++
> >  3 files changed, 25 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> > index 1173811b2ea7..5b70d8272700 100644
> > --- a/fs/fuse/file.c
> > +++ b/fs/fuse/file.c
> > @@ -1781,7 +1781,7 @@ static ssize_t __fuse_direct_read(struct fuse_io_=
priv *io,
> >
> >  static ssize_t fuse_direct_IO(struct kiocb *iocb, struct iov_iter *ite=
r);
> >
> > -static ssize_t fuse_direct_read_iter(struct kiocb *iocb, struct iov_it=
er *to)
> > +ssize_t fuse_direct_read_iter(struct kiocb *iocb, struct iov_iter *to)
> >  {
> >         ssize_t res;
> >
> > @@ -1796,7 +1796,7 @@ static ssize_t fuse_direct_read_iter(struct kiocb=
 *iocb, struct iov_iter *to)
> >         return res;
> >  }
> >
> > -static ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_i=
ter *from)
> > +ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *fr=
om)
> >  {
> >         struct inode *inode =3D file_inode(iocb->ki_filp);
> >         ssize_t res;
> > @@ -1884,7 +1884,8 @@ static ssize_t fuse_splice_write(struct pipe_inod=
e_info *pipe, struct file *out,
> >         struct fuse_file *ff =3D out->private_data;
> >
> >         /* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
> > -       if (fuse_file_passthrough(ff) && !(ff->open_flags & FOPEN_DIREC=
T_IO))
> > +       if (fuse_passthrough_op(file_inode(out), FUSE_WRITE) &&
>
> Removing fuse_file_passthrough(ff) makes me uncomfortable.
> It's true that if server sets PASSTHROUGH_OP_WRITE on lookup
> the file has to be opened with FOPEN_PASSTHROUGH, but this
> not easily understood by passing by reviewers.
>
> It's be nicer if we keep this logic contained in a helper where it can be
> properly documented, something like this (following the changes to
> FUSE_PASSTHROUGH_OP() discussed earlier):
>
> static inline u64 fuse_passthrough_op(struct inode *inode, u64 op_mask)
> {
>         struct fuse_inode *fi =3D get_fuse_inode(inode);
>         struct fuse_backing *fb =3D fuse_inode_passthrough(fi);

This needs to be:
         struct fuse_backing *fb =3D fuse_inode_backing(fi);

so the helper will work correctly whether the backing inode was set on
lookup (long lived) or on open.

>
>         return !fb ? 0 : fb->ops_mask & op_mask;
> }
>
> static inline struct file *fuse_file_passthrough_op(struct file *file,
>                                                     u64 op_mask)
> {
>         struct fuse_file *ff =3D file->private_data;
>
>         /*
>          * FOPEN_DIRECT_IO can be used to opt-out of passthrough per file=
 and
>          * ops_mask can be used to opt-out of passthrough per operation t=
ype.
>          */
>         return fuse_file_passthrough(ff) &&
>                 !(ff->open_flags & FOPEN_DIRECT_IO) &&
>                 fuse_passthrough_op(file_inode(file), op_mask) =3D=3D op_=
mask;
> }
>
> ...
>
> static ssize_t fuse_splice_write(struct pipe_inode_info *pipe, struct fil=
e *out,
>                                  loff_t *ppos, size_t len, unsigned int f=
lags)
> {
>         if (fuse_file_passthrough_op(out, FUSE_PASSTHROUGH_OP_WRITE))
>                 return fuse_passthrough_splice_write(pipe, out, ppos,
> len, flags);
>         else
>                 return iter_file_splice_write(pipe, out, ppos, len, flags=
);
> }
>
>
> > +           !(ff->open_flags & FOPEN_DIRECT_IO))
> >                 return fuse_passthrough_splice_write(pipe, out, ppos, l=
en, flags);
> >         else
> >                 return iter_file_splice_write(pipe, out, ppos, len, fla=
gs);
> > diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> > index 9e5142a94a09..a1034533ce60 100644
> > --- a/fs/fuse/fuse_i.h
> > +++ b/fs/fuse/fuse_i.h
> > @@ -1261,6 +1261,9 @@ struct fuse_file *fuse_file_open(struct fuse_moun=
t *fm, u64 nodeid,
> >  void fuse_file_release(struct inode *inode, struct fuse_file *ff,
> >                        unsigned int open_flags, fl_owner_t id, bool isd=
ir);
> >
> > +ssize_t fuse_direct_read_iter(struct kiocb *iocb, struct iov_iter *to)=
;
> > +ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *fr=
om);
> > +
> >  /* passthrough.c */
> >
> >  /* READ/WRITE are implied by FOPEN_PASSTHROUGH, but defined for comple=
teness */
> > diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> > index f2025772c9c1..d62a1c751157 100644
> > --- a/fs/fuse/passthrough.c
> > +++ b/fs/fuse/passthrough.c
> > @@ -44,6 +44,10 @@ ssize_t fuse_passthrough_read_iter(struct kiocb *ioc=
b, struct iov_iter *iter)
> >         if (!count)
> >                 return 0;
> >
> > +       if ((ff->open_flags & FOPEN_DIRECT_IO) ||
> > +           !fuse_passthrough_op(file_inode(file), FUSE_READ))
> > +               return fuse_direct_read_iter(iocb, iter);
> > +
> >         ret =3D backing_file_read_iter(backing_file, iter, iocb, iocb->=
ki_flags,
> >                                      &ctx);
> >
> > @@ -70,6 +74,10 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *io=
cb,
> >         if (!count)
> >                 return 0;
> >
> > +       if ((ff->open_flags & FOPEN_DIRECT_IO) ||
> > +           !fuse_passthrough_op(inode, FUSE_WRITE))
> > +               return fuse_direct_write_iter(iocb, iter);
> > +
> >         inode_lock(inode);
> >         ret =3D backing_file_write_iter(backing_file, iter, iocb, iocb-=
>ki_flags,
> >                                       &ctx);
> > @@ -91,6 +99,9 @@ ssize_t fuse_passthrough_splice_read(struct file *in,=
 loff_t *ppos,
> >         struct kiocb iocb;
> >         ssize_t ret;
> >
> > +       if (!fuse_passthrough_op(file_inode(in), FUSE_READ))
> > +               return copy_splice_read(in, ppos, pipe, len, flags);
> > +
> >         pr_debug("%s: backing_file=3D0x%p, pos=3D%lld, len=3D%zu, flags=
=3D0x%x\n", __func__,
> >                  backing_file, *ppos, len, flags);
> >
>
> I understand why you brought this "jump back to direct" into the passthro=
ugh
> helpers to reduce complexity in the call sites, but I think that if you u=
se
> the fuse_file_passthrough_op() helper in the call sites code will look
> better and will not need to "jump back to direct io" in passthrough.c.
>
> > @@ -133,6 +144,9 @@ ssize_t fuse_passthrough_mmap(struct file *file, st=
ruct vm_area_struct *vma)
> >  {
> >         struct fuse_file *ff =3D file->private_data;
> >         struct file *backing_file =3D fuse_file_passthrough(ff);
> > +       struct inode *inode =3D file_inode(file);
> > +       struct fuse_inode *fi =3D get_fuse_inode(inode);
> > +       struct fuse_backing *fb =3D fuse_inode_backing(fi);
> >         struct backing_file_ctx ctx =3D {
> >                 .cred =3D ff->cred,
> >                 .accessed =3D fuse_file_accessed,
> > @@ -141,6 +155,10 @@ ssize_t fuse_passthrough_mmap(struct file *file, s=
truct vm_area_struct *vma)
> >         pr_debug("%s: backing_file=3D0x%p, start=3D%lu, end=3D%lu\n", _=
_func__,
> >                  backing_file, vma->vm_start, vma->vm_end);
> >
> > +       /* mmap requires both read and write passthrough */
> > +       if ((fb->ops_mask & FUSE_PASSTHROUGH_RW_OPS) !=3D FUSE_PASSTHRO=
UGH_RW_OPS)
> > +               return -ENODEV;
> > +
>
> Changing the helper in call site in nicer and already hits the
> existing ENODEV case:
>
>         if (fuse_file_passthrough_op(file, FUSE_PASSTHROUGH_RW_OPS))
>                 return fuse_passthrough_mmap(file, vma);
>         else if (fuse_inode_backing(get_fuse_inode(inode)))
>                 return -ENODEV;

This could technically be relaxed to:
          else if (fuse_passthrough_op(inode, FUSE_PASSTHROUGH_RW_OPS))
                 return -ENODEV;

However, I should note about this sketch patch that the condition for
fuse_passthrough_mmap()
is that both read/write are passthrough and the condition for ENODEV
is that either read/write are passthrough but looking at this code it is
not at all clear to the reader.

Because if there is no read/write passthrough, (only GETATTR passthrough)
there is not really a reason to prevent fuse page cache mmap.

See similar comment I made regarding fuse_file_cached_io_open() on the
documentation patch.

Thanks,
Amir.
