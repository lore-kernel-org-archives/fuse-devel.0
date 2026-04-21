Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4651234DCFF
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 20:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802869; cv=pass; b=D1MnuimHV3cfaDPELTLfNixyoWjIu1Q7RM8Qx76ChHziljYwjiKXNF93qIj9GM4f7Zzx32EEAdUxICvUhQhnQK/hkeeN70FUfrnii53FSXecMw+9HVdR5WBF9RSkBXXuupBpRXh/oEmf+CfBoIr5yUMObaiGPUiDkldt5XEvviI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802869; c=relaxed/simple;
	bh=ST+dS5KQa1JaNBGIa+1ISSJNKIxnbJPzlV10ihCHsv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWWRqlOO+FBzjI/3mBstWSLNGl+DAgFbTsBgnrhx81Ncnj6NQmQBgE4MBwpesN/njZ0qUiKm+/gr3qbEgaYMaQn6q2el4A4+aYH/sTXH/HjqMUupXNsdxKLsA5C5GYZ00K82KEE+/nc1uv5OCZAQdG90O/HDKdka13P8KuFJe6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nu5pq3jZ; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nu5pq3jZ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so1909651a12.1
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 13:21:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776802865; cv=none;
        d=google.com; s=arc-20240605;
        b=UCRaAfjF9ml6Jm10f8GrpjC11vNoXYPBphYz049cryMYCGzSZckniEU5nUZqpk5jgv
         aVI7KPt7cdz/WxImsApqPRaAgvQaJlXPG11zQnU6iSetJ9gAJuvj/DuQzf48MaTxL/iG
         nWHW8qcZqERikdYB5trV3r+smlZCylHy0S3SA5Q9niEnRpQhB08nLJNXEQtcYys6s82+
         top3ktGWGZo6ZWlwiLGe4bcWJ/lExpLo4xLnNSPxeldjx+Uxrugmwy1c0slJfKLgnHo0
         g4nSCx/eOYXW+KXX6eM1abvgWRsvndvqMS3N+/UOoahqn2bFlxW2OIgYwwgfgoLhWJ4y
         nCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fa5HaP/Y7acFzIIeaIzsfBrvcBMpWHiTG50r3Oyi91w=;
        fh=+GSBNdkpYyYQdsfsSXuBKI8tBYj7DFnv5X+lKS5Fk2E=;
        b=iGQHMhvFFc/3CkuXf1DGrSwla7KStWKBkSf68di8Ie/DpReNh3L1Ux8DcKlONvaIC+
         0l+GEvXUMeIpsMIV1BqB05BiY8Z57Y1g4URH2qkkL+LNkc0LpnWJwN+wadhBaUSnmosX
         qfFw+lkusjJpq6v/29lCAZjos2+D8dEK8kQUwBLcL0g9MaO9PA/wrhu637cTQksk7RMg
         hUmI/yXzQZOWkBcbf2zXEGL1C6tGTy1QpDMdLoEgcSdAJzbe32klMeStA4ir5A7a7sQV
         U6YjtRUq6Lw4xCJGwf3RUEEenY7ZHXSQO8R8L0BCNrWu/gxR0TH3xY+a7pArKHq0OMTX
         bC4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776802865; x=1777407665; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fa5HaP/Y7acFzIIeaIzsfBrvcBMpWHiTG50r3Oyi91w=;
        b=Nu5pq3jZf8rzC5P+8q9ABniA7radM1vrsXnupbm6cyLguPEofVvjhcuK/iQpiGOShv
         SjA8jZTHMSp3EgHy4kIKiSD0HVh/V1C3JahtScJVKO6ooWgYPJzJ9KWtdEraBR22poZg
         ETofRu/tfHdxsinLwgPhaKngplyM3d9U26uHvKvRRqeQlUEGWvjgnoGiy6Yndh3o4bBo
         QDjxiZJNjMcc8s/BwxfqwTV7c5XhAhnFJWMsZLZJCghOpxzxciK+mA2qs4V18WKuwWP2
         BnCTpYirbvqbFCbiLkTjfr/ZLcUZCQ+t/W7YR/0a167SGdmQUHYaWvZNtMGFl3rHZohY
         TP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776802865; x=1777407665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fa5HaP/Y7acFzIIeaIzsfBrvcBMpWHiTG50r3Oyi91w=;
        b=CfoPhf82rzCwY3h44alEk5amsoxiNFWbgZ2WqaCE9AIkq5y63SoQ/BLyADWEoVgvYL
         3HF1CP64qCvAm7/xJkhBaokfBHS1CPw2yQ2hItJ5mEB77AOWq7+vHTvMbGm4D/p2fVmk
         99XcE5bzWBNahemWCoveCmq8orfwDcO0W24Loev2FwCvP4k2tHtrXXthATJRKtbZFTfT
         Nq2JnwBoMgsqw9y+DE8jaarqe0u4vZsRCuWrxKX+0TEPH3ovRhDpUFkNMU/i7EVLrS9k
         hefi68GcabGQ9bACz2M/TLvFNscR0+tj2DmE4qacGvN/swRf5TW4oXvCLApGTesaWjKa
         QiNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DMBE0OariRMKJ9038q8PhqQ19F2JoSaSYcsmlgA2rfdEU9GwHG+lRtJvbdXrntqFrSgtpvEMa8aDW@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh20Vpb8HIGf1HCGBBmGd4pqrO/DZDdcD5tnVraF1JgbKxSyBq
	VZm+gNOSpkEFCYBbKKHcIDntP/4MwXNMVGm0O26UUZDMtFNPA9T/UbN8wxG3YD7AenIIAF5lphu
	Y+EyDbAclbSNaS/U5txmX3Earnq1DFaxrLEvUf0g=
X-Gm-Gg: AeBDies6TOUwks+82m2Ie+zdCTwzwutOE8Q2uqgKnXpzlOl3jwqwa5q2isCs9UBeZGF
	AZ75RAKwV1WPAE51a/4DpkzDuNVqebuq/7vwUEYkSNa4pCCJP883XTtzlQlA6JUYuJGZ5AWnlu7
	bfKBd55njTnBc3wHscWzy/Ren1KHTSMYI0YEOgZS5Sj1ETProfUSIDbucOqHeem5rqDVUwtGpTK
	TuH6zIgPp09W5/0eRvUyQHJxNIApTRuyg7fMaU9GcIbjOpPvn98RnOVEEf7c9h/NDM5J6VwV5IB
	sFNY5XzBzgIdFbqOFvp07IhBWAloFYwzy9nn0JBwFDlIy/KYRGrx
X-Received: by 2002:a17:907:3fa2:b0:ba7:5c47:7b1c with SMTP id
 a640c23a62f3a-ba75c478746mr583116766b.8.1776802865279; Tue, 21 Apr 2026
 13:21:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com> <20260420221637.2631478-17-joannelkoong@gmail.com>
In-Reply-To: <20260420221637.2631478-17-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Apr 2026 22:20:52 +0200
X-Gm-Features: AQROBzBbp7nNMBsptlMOVTUC-VwlNT8jiPJDs_qLrOmRZ3yBiRzAGT4lBUBDj0k
Message-ID: <CAOQ4uxhK4dy-=c_5oZKZW08+a=P0vN75q8A7RAWNnuhdeSVwAg@mail.gmail.com>
Subject: Re: [PATCH v1 16/17] fuse: add passthrough open
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 12:19=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> Add FUSE_PASSTHROUGH_OP_OPEN which the server may set in the backing
> map's ops mask to indicate that the kernel should skip sending
> FUSE_OPEN/FUSE_OPENDIR to the server and open the backing file directly.
> FUSE_RELEASE/FUSE_RELEASEDIR is also skipped when the file is released.
> FUSE_FLUSH is skipped as well.
>
> If the file is a directory, this automatically implies passthrough
> readdir. If the file is a regular file, this automatically implies
> passthrough read/write.
>
> For FUSE_ATOMIC_O_TRUNC, the server typically handles the truncating
> logic when it handles FUSE_OPEN. With passthrough open, the vfs layer
> will call handle_truncate() which will trigger fuse_setattr(). If
> setattr is passed through, then the backing file will be truncated
> directly or if not, then a FUSE_SETATTR will be sent to the server for
> the truncation.

I think we need to reduce complexity.
If we do open passthrough, then the server should not handle truncate.
same for write, if we passthrough write, server should not handle killpriv.
If this means that PASSTHROUGH_INO conflicts with some other
fuse configs, then I think we should make those configs mutually exclusive,
at least for the start.

>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/backing.c         | 12 ++++++--
>  fs/fuse/dir.c             | 15 +++++++++-
>  fs/fuse/file.c            | 17 ++++++++++-
>  fs/fuse/fuse_i.h          | 13 ++++++++-
>  fs/fuse/iomode.c          |  5 ++--
>  fs/fuse/passthrough.c     | 59 +++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/fuse.h |  1 +
>  7 files changed, 114 insertions(+), 8 deletions(-)
>
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index 85ac6f917779..5bc5581dd27f 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -118,8 +118,9 @@ int fuse_backing_open(struct fuse_conn *fc, struct fu=
se_backing_map *map)
>         if (map->flags || map->ops_mask & ~FUSE_BACKING_MAP_VALID_OPS)
>                 goto out;
>
> -       /* For now passthrough inode operations requires FUSE_PASSTHROUGH=
_INO */
> -       if (!fc->passthrough_ino && map->ops_mask & FUSE_PASSTHROUGH_INOD=
E_OPS)
> +       /* For now passthrough operations on backing inodes require FUSE_=
PASSTHROUGH_INO */
> +       if (!fc->passthrough_ino &&
> +           (map->ops_mask & (FUSE_PASSTHROUGH_INODE_OPS | FUSE_PASSTHROU=
GH_OP_OPEN)))
>                 goto out;

I would argue that in this context, passthrough open *is* an inode operatio=
n,
just like CREATE, because it operates on the backing inode, not ff->passthr=
ough.
But this POV is confusing when considering file_operations and inode_operat=
ions
so let it stay as you did.

>
>         file =3D fget_raw(map->fd);
> @@ -127,6 +128,13 @@ int fuse_backing_open(struct fuse_conn *fc, struct f=
use_backing_map *map)
>         if (!file)
>                 goto out;
>
> +       if (map->ops_mask & FUSE_PASSTHROUGH_OP_OPEN) {
> +               if (d_is_reg(file->f_path.dentry))
> +                       map->ops_mask |=3D FUSE_PASSTHROUGH_RW_OPS;
> +               else
> +                       map->ops_mask |=3D FUSE_PASSTHROUGH_DIR_OPS;
> +       }
> +
>         /* read/write/splice/mmap passthrough only relevant for regular f=
iles */
>         res =3D d_is_dir(file->f_path.dentry) ? -EISDIR : -EINVAL;
>         if (!(map->ops_mask & ~FUSE_PASSTHROUGH_RW_OPS) &&
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 6dea0f8e384f..816cb7d7aeb1 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -2077,6 +2077,9 @@ static int fuse_dir_open(struct inode *inode, struc=
t file *file)
>         if (err)
>                 return err;
>
> +       if (fuse_inode_passthrough_op(inode, FUSE_OPEN))
> +               return fuse_passthrough_open_inode(inode, file);
> +
>         err =3D fuse_do_open(fm, get_node_id(inode), file, true);
>         if (!err) {
>                 struct fuse_file *ff =3D file->private_data;
> @@ -2113,11 +2116,15 @@ static int fuse_dir_fsync(struct file *file, loff=
_t start, loff_t end,
>  {
>         struct inode *inode =3D file->f_mapping->host;
>         struct fuse_conn *fc =3D get_fuse_conn(inode);
> +       struct fuse_file *ff =3D file->private_data;
>         int err;
>
>         if (fuse_is_bad(inode))
>                 return -EIO;
>
> +       if (ff->passthrough_open)
> +               return vfs_fsync_range(ff->passthrough, start, end, datas=
ync);
> +

ovl_fsync has override_cred maybe needed here?

>         if (fc->no_fsyncdir)
>                 return 0;
>
> @@ -2362,7 +2369,13 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struc=
t dentry *dentry,
>                 /* This is coming from open(..., ... | O_TRUNC); */
>                 WARN_ON(!(attr->ia_valid & ATTR_SIZE));
>                 WARN_ON(attr->ia_size !=3D 0);
> -               if (fc->atomic_o_trunc) {
> +               /*
> +                * With open passthrough, FUSE_OPEN was never sent to the
> +                * server, which means the server didn't get a chance to =
handle
> +                * the truncation, so we need to send a FUSE_SETATTR
> +                */

Do we need to do that?
Is the backing inode being opened with O_TRUNC? maybe not?
If it does it will be truncated and fuse will read the size attribute. no?

> +               if (fc->atomic_o_trunc &&
> +                   !fuse_inode_passthrough_op(inode, FUSE_OPEN)) {
>                         /*
>                          * No need to send request to userspace, since ac=
tual
>                          * truncation has already been done by OPEN.  But=
 still
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index a1de70bc589d..5cbf240064f9 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -111,7 +111,12 @@ static void fuse_file_put(struct fuse_file *ff, bool=
 sync)
>
>                 if (!args) {
>                         /* Do nothing when server does not implement 'ope=
ndir' */
> -               } else if (args->opcode =3D=3D FUSE_RELEASE && ff->fm->fc=
->no_open) {
> +               } else if ((args->opcode =3D=3D FUSE_RELEASE && ff->fm->f=
c->no_open) ||
> +                          ff->passthrough_open) {
> +                       /*
> +                        * With open passthrough, no FUSE_OPEN was sent. =
Skip
> +                        * sending a FUSE_RELEASE
> +                        */
>                         fuse_release_end(ff->fm, args, 0);
>                 } else if (sync) {
>                         fuse_simple_request(ff->fm, args);
> @@ -278,6 +283,9 @@ static int fuse_open(struct inode *inode, struct file=
 *file)
>         if (err)
>                 return err;
>
> +       if (fuse_inode_passthrough_op(inode, FUSE_OPEN))
> +               return fuse_passthrough_open_inode(inode, file);
> +
>         if (is_wb_truncate || dax_truncate)
>                 inode_lock(inode);
>
> @@ -485,6 +493,9 @@ static int fuse_flush(struct file *file, fl_owner_t i=
d)
>         if (fuse_is_bad(inode))
>                 return -EIO;
>
> +       if (ff->passthrough_open)
> +               return 0;
> +
>         if (ff->open_flags & FOPEN_NOFLUSH && !fm->fc->writeback_cache)
>                 return 0;
>
> @@ -551,11 +562,15 @@ static int fuse_fsync(struct file *file, loff_t sta=
rt, loff_t end,
>  {
>         struct inode *inode =3D file->f_mapping->host;
>         struct fuse_conn *fc =3D get_fuse_conn(inode);
> +       struct fuse_file *ff =3D file->private_data;
>         int err;
>
>         if (fuse_is_bad(inode))
>                 return -EIO;
>
> +       if (ff->passthrough_open)
> +               return vfs_fsync_range(ff->passthrough, start, end, datas=
ync);
> +

ovl_fsync() has override_cred - not sure if it is a must here...

>         inode_lock(inode);
>
>         /*
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index d722382676e2..726b0004fce7 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -307,6 +307,12 @@ struct fuse_file {
>         const struct cred *cred;
>  #endif
>
> +       /*
> +        * Was file opened via passthrough (no FUSE_OPEN/FUSE_OPENDIR
> +        * sent)?
> +        */
> +       bool passthrough_open:1;
> +
>         /** Has flock been performed on this file? */
>         bool flock:1;
>  };
> @@ -1548,6 +1554,8 @@ void fuse_inode_uncached_io_end(struct inode *inode=
);
>
>  int fuse_file_io_open(struct file *file, struct inode *inode);
>  void fuse_file_io_release(struct fuse_file *ff, struct inode *inode);
> +int fuse_file_uncached_io_open(struct inode *inode, struct fuse_file *ff=
,
> +                              struct fuse_backing *fb);
>
>  /* file.c */
>  struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
> @@ -1577,7 +1585,8 @@ void fuse_file_release(struct inode *inode, struct =
fuse_file *ff,
>         ((map)->ops_mask & FUSE_PASSTHROUGH_OP(op))
>
>  #define FUSE_BACKING_MAP_VALID_OPS \
> -       (FUSE_PASSTHROUGH_FILE_OPS | FUSE_PASSTHROUGH_INODE_OPS)
> +       (FUSE_PASSTHROUGH_FILE_OPS | FUSE_PASSTHROUGH_INODE_OPS | \
> +        FUSE_PASSTHROUGH_OP_OPEN)
>
>  /* backing.c */
>  #ifdef CONFIG_FUSE_PASSTHROUGH
> @@ -1685,6 +1694,8 @@ int fuse_passthrough_getattr(struct inode *inode, s=
truct kstat *stat,
>                              u32 request_mask, unsigned int flags);
>  int fuse_passthrough_setattr(struct inode *inode, struct iattr *attr);
>
> +int fuse_passthrough_open_inode(struct inode *inode, struct file *file);
> +
>  static inline bool fuse_use_entry2(struct fuse_conn *fc)
>  {
>         return fc->passthrough_ino;
> diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
> index 7c4053160b8a..5a4091e7e275 100644
> --- a/fs/fuse/iomode.c
> +++ b/fs/fuse/iomode.c
> @@ -139,9 +139,8 @@ int fuse_inode_uncached_io_start(struct inode *inode,=
 struct fuse_file *ff,
>  }
>
>  /* Takes uncached_io inode mode reference to be dropped on file release =
*/
> -static int fuse_file_uncached_io_open(struct inode *inode,
> -                                     struct fuse_file *ff,
> -                                     struct fuse_backing *fb)
> +int fuse_file_uncached_io_open(struct inode *inode, struct fuse_file *ff=
,
> +                              struct fuse_backing *fb)
>  {
>         int err;
>
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index c70478f07d6a..eb55c4b42a4e 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -282,3 +282,62 @@ int fuse_passthrough_setattr(struct inode *inode, st=
ruct iattr *attr)
>          */
>         return fuse_passthrough_getattr(inode, NULL, STATX_BASIC_STATS, 0=
);
>  }
> +
> +/*
> + * Open a file in passthrough mode using the inode's backing reference.
> + * Called when FUSE_PASSTHROUGH_OP_OPEN is set on the backing map's ops.
> + * This skips sending a FUSE_OPEN/FUSE_OPENDIR request to the server.
> + * FUSE_RELEASE/FUSE_RELEASEDIR will be skipped as well when the file is
> + * released.
> + */
> +int fuse_passthrough_open_inode(struct inode *inode, struct file *file)
> +{
> +       struct fuse_mount *fm =3D get_fuse_mount(inode);
> +       struct fuse_inode *fi =3D get_fuse_inode(inode);
> +       struct file *backing_file;
> +       struct fuse_backing *fb;
> +       struct fuse_file *ff;
> +       int err;
> +
> +       /*
> +        * This should always pass true for the release arg because when =
the
> +        * last refcount on the file is dropped (see fuse_file_put()),
> +        * fuse_io_release() needs to be called on the inode stashed in
> +        * ff->args->release_args.
> +        */
> +       ff =3D fuse_file_alloc(fm, true);
> +       if (!ff)
> +               return -ENOMEM;
> +
> +       ff->nodeid =3D get_node_id(inode);
> +       ff->open_flags =3D FOPEN_PASSTHROUGH;
> +       ff->passthrough_open =3D true;


I think if the server did not see the open and did not provide ff->fh
then all the file ops that carry fh cannot be sent to the server. Right?
So implementing passthrough open may need a bit more work.

> +
> +       err =3D -EINVAL;
> +       fb =3D fuse_backing_get(fuse_inode_passthrough(fi));
> +       if (!fb)
> +               goto error_free;
> +
> +       backing_file =3D backing_file_open(&file->f_path, file->f_flags,
> +                                         &fb->file->f_path, fb->cred);
> +       if (IS_ERR(backing_file)) {
> +               err =3D PTR_ERR(backing_file);
> +               goto error_put;
> +       }
> +
> +       ff->passthrough =3D backing_file;
> +       ff->cred =3D get_cred(fb->cred);
> +
> +       err =3D fuse_file_uncached_io_open(inode, ff, fb);
> +       if (!err) {
> +               file->private_data =3D ff;
> +               return 0;
> +       }
> +
> +       fuse_passthrough_release(ff, fb);
> +error_put:
> +       fuse_backing_put(fb);
> +error_free:
> +       fuse_file_free(ff);
> +       return err;
> +}

Joanne,

I am done with this round of review.
Nice work!
Thanks for getting this out the door.
Let's see if we find a way to tackle the issues found so far
without over complicating the code.

Thanks,
Amir.
