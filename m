Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC80723D7F4
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 04:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776831560; cv=pass; b=O0kXmQakYaFW/AohUDI/eIbKdSqXRY/3VjmHh3uty+p3ClL+LSTGeC1g9K+0bPp4xUPBLtK9+yyij+8xdrlf7FAC0AHiP76d1wY7Eo2Yzn7rAnL7qID4KIWAJcWSNqncPb1PtY2euIBHMBu7qD4rzLPbn8mG+yn8hKIByZfeUCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776831560; c=relaxed/simple;
	bh=dG2b6bFOXSqS1HnpmkbWxxpYpvEsMcDP+gOkgOMuyKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqeLJ0sZdDEmfDph8ZUhMmLiKtv57OFJy+enX9dAbNeZnjAjtP7RgpucUAGZLNdbZ7BZhIklfnCBgnuPBBZF03qdWhbbhJf8KVFqnrBmzAYZmNAvCW/cQT7GuIf5xIp0ZZfBWHLbsfHnCG4zxGzBrnYj9L4MoifFahzy/LTv7sQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P83lr8gr; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P83lr8gr"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d43e09de5so2726993f8f.1
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 21:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776831557; cv=none;
        d=google.com; s=arc-20240605;
        b=l0cqRxIz4uBpc1FS+thq74MLlilx4zuvqzuiJptLbJP17lT26MvnAwg89v7ZsI7DPU
         rbjH18bOMWipmCutItm57edafuHq4pm6K+rPl7NlfYCQC1iCNl5ULduNmp+cXnkr3PQz
         Wk7EJw+LRdnk3o3SNXLTBp5Imm0q60szYizKPdiWcmVAQspDEmSTBrhcJYPbiPCuPMVI
         /6kAEbKzD7R/B9zNrd5Lb8fXdYguGt8Q72ewL9H4zggsOHesCvITfuTihRwxucpwl51C
         YX4uzOhTkENtySaKvEN6R/o77033hbZB1DM/B6OSjS5eEjx/1lP/WeECIp/rWdze6dNl
         uzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lu6H7BXIH2SjRVNrvLdTs62Ps0v2PyfPFMShMHCItiw=;
        fh=BFOB87TX/+JoWylJNm7+7d8h/NiL0mMq0EJZyyRXPbs=;
        b=Mrjz07HXg0mYo38+eluUuzYjK1/exD9CrPx2O4YmnHRzt2klv2FWBF3WDDaQ3HYxzB
         bzy9zx626iYCmnSYa+UUvutsYpag/cBQ8ETrN5OfYg9/4VfIM5jnCyt1V9WjstDbHUXr
         yzWbiYJkjpFwClZHiWNhYog0LOGze32SOrjd26BvPYvjJOQ8o/5tQh3XuUu+8xNpfKDZ
         Mqq9KCR5KiqVTe5BeZ5k3Fm3DBmzahZAYIII9Q+VvLRhCW4zOMeUitUTnOivqxWPM3Yl
         HlM6Kg0uwQ1OpraNNCVyCN87/eswmS4HCXfnahPyFAQvMaNiI2RfgfwX0fLe3nFj6LlY
         KYXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776831557; x=1777436357; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu6H7BXIH2SjRVNrvLdTs62Ps0v2PyfPFMShMHCItiw=;
        b=P83lr8grIPVDqG2e7qxK0UrA/JTh/t6c4XlBEul2K67BUbcjHnZhd/8MHl2j/JmxD2
         ov3MkHJxdrhOdUk6IXA40qKVjS/Brv/iC3He7m3oSZGFpjBE99J2HDCv4Pv6EXCrYgKc
         Ip0nBnhspOc+9RSjV2milUqv/rzT62oJQ6ZenjCt3GcpXddTP2Y59+AGsdbkoIqqlNkp
         Xwe/ir2H/gujxnHzSq6/0OxHWsVvTrYCmMnHB6SrO5aWx2sKch9GteDIWLx4jqN2pEGV
         Dh0eK6m27P8KqvwEvNGaQvA/hX+PTS/bs/oF5eNC/vbQ9BLBiBF1tryZhlI+LUuAm00N
         GuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776831557; x=1777436357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu6H7BXIH2SjRVNrvLdTs62Ps0v2PyfPFMShMHCItiw=;
        b=qTnkGbp4VFiSMKCmcIpbzQrkuGl3EnRTxFcCznAF/04zAq5t4H2nxhMBkR/kcy1BuS
         oBzbjJLLqazN8pNSMXNfJgZzGYPNRaKdS5pL150al3e8rB0i68H7NDhJkD+f5F8ZcSQn
         Q5svXAQ7UASFjpZm0IgYmIbUh1PPCNqHDlUALMBiCg64RfZAEpahJ/3sFEILFITkvcvk
         dnytx+OSlRCSJiFcEpHflqW/1cejHNnOwSoKHj97YJ2IpB6vA/Ig6HGdt/jafh4BDBiG
         OVXPPfPnopnSpfyBSKRxusktyaXVVRgNMvEfZT9wLw7+QiBXuWJdCI04ps/8IbpaE/uM
         Hkgw==
X-Forwarded-Encrypted: i=1; AFNElJ+PYcFDEWjQdBq/z3RN7aCObwppwc15UKrCo0duLhVvfC0VZkp/Dztp0t0tmTJa60Mcc9BM1mh4vnYA@lists.linux.dev
X-Gm-Message-State: AOJu0YxuFPJ9PIL/7/Fw/hD67NlvYgnEDquJ//yyG+en7ZeXUzSBArWi
	ph7jdnpBkQCO4qHDCweX8zhFvtuqnhEK6rSOLDdYEUObO/fG9EOwmd4/IIBg6tM8Gnzn9FSRbui
	bz+mM9VohboBPcFJmyIplcqAlB6W0uJ8=
X-Gm-Gg: AeBDies7eDA6RcPyqWO+5rNEQA7boT0i3cMFPR5ueOa5Pp9xWuV8t8oCQP8DWNY5pjU
	ZoFYb3kQBlbHT4UcCAGXwtnLgmfHxWWUDmxnx5lD0dvvh9YiSWE5Rd2EiFBDuRwfdSSHYP4bOBl
	LVBHFBfPlC/EEomtPSzRPWDAjSfeSOvuol/xjBkx8k0hJCxhn+cvnP6pDoCzFVbl8p6kzvDWJWB
	35gaBBKcQufv/Z9207XOG5QKdX6ye88MW38W6jplHgKtImhrMWJM7isd/fofzIA+Lg/e2svv5by
	BF1/mxq/yYo5ktldYLIQw5ugxRU=
X-Received: by 2002:a05:6000:184d:b0:43d:e31:68d1 with SMTP id
 ffacd0b85a97d-43fe3dd958amr32451542f8f.21.1776831556899; Tue, 21 Apr 2026
 21:19:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-17-joannelkoong@gmail.com> <CAOQ4uxhK4dy-=c_5oZKZW08+a=P0vN75q8A7RAWNnuhdeSVwAg@mail.gmail.com>
In-Reply-To: <CAOQ4uxhK4dy-=c_5oZKZW08+a=P0vN75q8A7RAWNnuhdeSVwAg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Apr 2026 21:19:03 -0700
X-Gm-Features: AQROBzAacxo_v9cvNNmOh-IOsa_TKoc0rjs5Pqput5eBPdvUMsmSeqQR3EanrHo
Message-ID: <CAJnrk1ZySOkK31eQzUjGKj6pZhiHHEFGcBOk2Y0ybNqtc88a=Q@mail.gmail.com>
Subject: Re: [PATCH v1 16/17] fuse: add passthrough open
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 1:21=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, Apr 21, 2026 at 12:19=E2=80=AFAM Joanne Koong <joannelkoong@gmail=
.com> wrote:
> >
> > Add FUSE_PASSTHROUGH_OP_OPEN which the server may set in the backing
> > map's ops mask to indicate that the kernel should skip sending
> > FUSE_OPEN/FUSE_OPENDIR to the server and open the backing file directly=
.
> > FUSE_RELEASE/FUSE_RELEASEDIR is also skipped when the file is released.
> > FUSE_FLUSH is skipped as well.
> >
> > If the file is a directory, this automatically implies passthrough
> > readdir. If the file is a regular file, this automatically implies
> > passthrough read/write.
> >
> > For FUSE_ATOMIC_O_TRUNC, the server typically handles the truncating
> > logic when it handles FUSE_OPEN. With passthrough open, the vfs layer
> > will call handle_truncate() which will trigger fuse_setattr(). If
> > setattr is passed through, then the backing file will be truncated
> > directly or if not, then a FUSE_SETATTR will be sent to the server for
> > the truncation.
>
> I think we need to reduce complexity.
> If we do open passthrough, then the server should not handle truncate.
> same for write, if we passthrough write, server should not handle killpri=
v.
> If this means that PASSTHROUGH_INO conflicts with some other
> fuse configs, then I think we should make those configs mutually exclusiv=
e,
> at least for the start.

That makes a lot of sense and will make things simpler. I think that's
a great idea.

>
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/backing.c         | 12 ++++++--
> >  fs/fuse/dir.c             | 15 +++++++++-
> >  fs/fuse/file.c            | 17 ++++++++++-
> >  fs/fuse/fuse_i.h          | 13 ++++++++-
> >  fs/fuse/iomode.c          |  5 ++--
> >  fs/fuse/passthrough.c     | 59 +++++++++++++++++++++++++++++++++++++++
> >  include/uapi/linux/fuse.h |  1 +
> >  7 files changed, 114 insertions(+), 8 deletions(-)
> >
> > diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> > index 85ac6f917779..5bc5581dd27f 100644
> > --- a/fs/fuse/backing.c
> > +++ b/fs/fuse/backing.c
> > @@ -118,8 +118,9 @@ int fuse_backing_open(struct fuse_conn *fc, struct =
fuse_backing_map *map)
> >         if (map->flags || map->ops_mask & ~FUSE_BACKING_MAP_VALID_OPS)
> >                 goto out;
> >
> > -       /* For now passthrough inode operations requires FUSE_PASSTHROU=
GH_INO */
> > -       if (!fc->passthrough_ino && map->ops_mask & FUSE_PASSTHROUGH_IN=
ODE_OPS)
> > +       /* For now passthrough operations on backing inodes require FUS=
E_PASSTHROUGH_INO */
> > +       if (!fc->passthrough_ino &&
> > +           (map->ops_mask & (FUSE_PASSTHROUGH_INODE_OPS | FUSE_PASSTHR=
OUGH_OP_OPEN)))
> >                 goto out;
>
> I would argue that in this context, passthrough open *is* an inode operat=
ion,
> just like CREATE, because it operates on the backing inode, not ff->passt=
hrough.
> But this POV is confusing when considering file_operations and inode_oper=
ations
> so let it stay as you did.
>
> >
> >         file =3D fget_raw(map->fd);
> > @@ -127,6 +128,13 @@ int fuse_backing_open(struct fuse_conn *fc, struct=
 fuse_backing_map *map)
> >         if (!file)
> >                 goto out;
> >
> > +       if (map->ops_mask & FUSE_PASSTHROUGH_OP_OPEN) {
> > +               if (d_is_reg(file->f_path.dentry))
> > +                       map->ops_mask |=3D FUSE_PASSTHROUGH_RW_OPS;
> > +               else
> > +                       map->ops_mask |=3D FUSE_PASSTHROUGH_DIR_OPS;
> > +       }
> > +
> >         /* read/write/splice/mmap passthrough only relevant for regular=
 files */
> >         res =3D d_is_dir(file->f_path.dentry) ? -EISDIR : -EINVAL;
> >         if (!(map->ops_mask & ~FUSE_PASSTHROUGH_RW_OPS) &&
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index 6dea0f8e384f..816cb7d7aeb1 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -2077,6 +2077,9 @@ static int fuse_dir_open(struct inode *inode, str=
uct file *file)
> >         if (err)
> >                 return err;
> >
> > +       if (fuse_inode_passthrough_op(inode, FUSE_OPEN))
> > +               return fuse_passthrough_open_inode(inode, file);
> > +
> >         err =3D fuse_do_open(fm, get_node_id(inode), file, true);
> >         if (!err) {
> >                 struct fuse_file *ff =3D file->private_data;
> > @@ -2113,11 +2116,15 @@ static int fuse_dir_fsync(struct file *file, lo=
ff_t start, loff_t end,
> >  {
> >         struct inode *inode =3D file->f_mapping->host;
> >         struct fuse_conn *fc =3D get_fuse_conn(inode);
> > +       struct fuse_file *ff =3D file->private_data;
> >         int err;
> >
> >         if (fuse_is_bad(inode))
> >                 return -EIO;
> >
> > +       if (ff->passthrough_open)
> > +               return vfs_fsync_range(ff->passthrough, start, end, dat=
async);
> > +
>
> ovl_fsync has override_cred maybe needed here?
>
> >         if (fc->no_fsyncdir)
> >                 return 0;
> >
> > @@ -2362,7 +2369,13 @@ int fuse_do_setattr(struct mnt_idmap *idmap, str=
uct dentry *dentry,
> >                 /* This is coming from open(..., ... | O_TRUNC); */
> >                 WARN_ON(!(attr->ia_valid & ATTR_SIZE));
> >                 WARN_ON(attr->ia_size !=3D 0);
> > -               if (fc->atomic_o_trunc) {
> > +               /*
> > +                * With open passthrough, FUSE_OPEN was never sent to t=
he
> > +                * server, which means the server didn't get a chance t=
o handle
> > +                * the truncation, so we need to send a FUSE_SETATTR
> > +                */
>
> Do we need to do that?
> Is the backing inode being opened with O_TRUNC? maybe not?
> If it does it will be truncated and fuse will read the size attribute. no=
?

You're right, the truncation will already be handled by the backing
filesystem. I'll fix this in v2.

>
> > +               if (fc->atomic_o_trunc &&
> > +                   !fuse_inode_passthrough_op(inode, FUSE_OPEN)) {
> >                         /*
> >                          * No need to send request to userspace, since =
actual
> >                          * truncation has already been done by OPEN.  B=
ut still
> > diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> > index a1de70bc589d..5cbf240064f9 100644
> > --- a/fs/fuse/file.c
> > +++ b/fs/fuse/file.c
> > @@ -111,7 +111,12 @@ static void fuse_file_put(struct fuse_file *ff, bo=
ol sync)
> >
> > @@ -551,11 +562,15 @@ static int fuse_fsync(struct file *file, loff_t s=
tart, loff_t end,
> >  {
> >         struct inode *inode =3D file->f_mapping->host;
> >         struct fuse_conn *fc =3D get_fuse_conn(inode);
> > +       struct fuse_file *ff =3D file->private_data;
> >         int err;
> >
> >         if (fuse_is_bad(inode))
> >                 return -EIO;
> >
> > +       if (ff->passthrough_open)
> > +               return vfs_fsync_range(ff->passthrough, start, end, dat=
async);
> > +
>
> ovl_fsync() has override_cred - not sure if it is a must here...

I'll look at the overlayfs layer and do some research on this. Thanks
for pointing this out

>
> >         inode_lock(inode);
> >
> >         /*
> > diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> > index c70478f07d6a..eb55c4b42a4e 100644
> > --- a/fs/fuse/passthrough.c
> > +++ b/fs/fuse/passthrough.c
> > @@ -282,3 +282,62 @@ int fuse_passthrough_setattr(struct inode *inode, =
struct iattr *attr)
> >          */
> >         return fuse_passthrough_getattr(inode, NULL, STATX_BASIC_STATS,=
 0);
> >  }
> > +
> > +/*
> > + * Open a file in passthrough mode using the inode's backing reference=
.
> > + * Called when FUSE_PASSTHROUGH_OP_OPEN is set on the backing map's op=
s.
> > + * This skips sending a FUSE_OPEN/FUSE_OPENDIR request to the server.
> > + * FUSE_RELEASE/FUSE_RELEASEDIR will be skipped as well when the file =
is
> > + * released.
> > + */
> > +int fuse_passthrough_open_inode(struct inode *inode, struct file *file=
)
> > +{
> > +       struct fuse_mount *fm =3D get_fuse_mount(inode);
> > +       struct fuse_inode *fi =3D get_fuse_inode(inode);
> > +       struct file *backing_file;
> > +       struct fuse_backing *fb;
> > +       struct fuse_file *ff;
> > +       int err;
> > +
> > +       /*
> > +        * This should always pass true for the release arg because whe=
n the
> > +        * last refcount on the file is dropped (see fuse_file_put()),
> > +        * fuse_io_release() needs to be called on the inode stashed in
> > +        * ff->args->release_args.
> > +        */
> > +       ff =3D fuse_file_alloc(fm, true);
> > +       if (!ff)
> > +               return -ENOMEM;
> > +
> > +       ff->nodeid =3D get_node_id(inode);
> > +       ff->open_flags =3D FOPEN_PASSTHROUGH;
> > +       ff->passthrough_open =3D true;
>
>
> I think if the server did not see the open and did not provide ff->fh
> then all the file ops that carry fh cannot be sent to the server. Right?

I need to research more into this but my understanding was that the
logic in the patch avoids sending any ops that require ff->fh. Though
maybe I'm missing something here...

> So implementing passthrough open may need a bit more work.
>
> > +
> > +       err =3D -EINVAL;
> > +       fb =3D fuse_backing_get(fuse_inode_passthrough(fi));
> > +       if (!fb)
> > +               goto error_free;
> > +
> > +       backing_file =3D backing_file_open(&file->f_path, file->f_flags=
,
> > +                                         &fb->file->f_path, fb->cred);
> > +       if (IS_ERR(backing_file)) {
> > +               err =3D PTR_ERR(backing_file);
> > +               goto error_put;
> > +       }
> > +
> > +       ff->passthrough =3D backing_file;
> > +       ff->cred =3D get_cred(fb->cred);
> > +
> > +       err =3D fuse_file_uncached_io_open(inode, ff, fb);
> > +       if (!err) {
> > +               file->private_data =3D ff;
> > +               return 0;
> > +       }
> > +
> > +       fuse_passthrough_release(ff, fb);
> > +error_put:
> > +       fuse_backing_put(fb);
> > +error_free:
> > +       fuse_file_free(ff);
> > +       return err;
> > +}
>
> Joanne,
>
> I am done with this round of review.
> Nice work!
> Thanks for getting this out the door.
> Let's see if we find a way to tackle the issues found so far
> without over complicating the code.

Thank you for reviewing this series, Amir. All your comments were
immensely helpful.

Thanks,
Joanne
>
> Thanks,
> Amir.
