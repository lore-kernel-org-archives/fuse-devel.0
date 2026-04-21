Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7D23B0ACC
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 10:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768537; cv=pass; b=e2D4BumG0kNrCSWDhoJdww1cWHxNnFwN4kKcB2TmgMafivQIoUYgCRcvubPORIb3zF8OeTazvnafzAIawIM7c6elvSWqbIGJ9dvQOM2oi5HZwusnzZMQ6f/tYCXSRNoeAgmTExehz6dcyYEByxZJ03gsDUipNlVxtWY1+3Pj3Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768537; c=relaxed/simple;
	bh=Ol4rKwFEzJu77b6lJ7+wWlpKYUhmQc0Hq5ZdveGg1XI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7N3MTMXPEj7Qnft8vZJRXzsxvcdlu+Bvi5sEA+Ga2pprsgYCdCmdby7utv12zl3qSv1JkHc0f+rtG7Z5u3iDQ3Wp/vYEXjZLzNXSUCPVmPtXglMb/ce5jORDGcNAlYUnUOrqhIH4vzK6SjlWe6jX96iUSx9sTRS2ADmstmJQM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX4wC7da; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX4wC7da"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-672c12e95e9so5745820a12.2
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 03:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776768534; cv=none;
        d=google.com; s=arc-20240605;
        b=TQUKy58O+vodXrBQ11Fv57WJqPJrdDBoPwOI5Z3WqZvQNXOPrxfQ9cpMeRSoe1F6Cj
         k+GBNfPlrS1X3uc61LNWem3DzrdwfP1mGsJ0kt1FHqhtEHsvk7edS2Y6ikQUn4VYBGor
         Mlu6R2QacxF0gcU8MOarshD7mahjbJd+t35A96STBRm7EGCAtj4vXkgpRFumWLgoLM7M
         qPHao2Pz5PE5cuJ8/24jNWQu76QOogJ/M5szngTV4iNNZXUw9dt8zZDQ4gehnEK68ZXx
         gUBQsEBoljGw5MqeMlxgvMjFK7i9J+6zY9lZTILcTea7X9MNIE+Atx6e3Y6mZEM5tSf6
         +q4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8zfMfY1VtyrQV6XGAsu/qbdQXK78eRfkGbsz57Tor9o=;
        fh=uoF9t8B508E3FHerMjcvgzisvy19DF774VwLb7k1J90=;
        b=e0woPFl6/mzJuMQvor8I4REpomGs/MqxnWOmQbQDBnMJjV4iaNTO0CmxqHdzPKA1T9
         cmZpp+AQnhOothw1xtlCow2mg+LoEhA1WDGrGQnSWyGNy5nE4oTGIW0GyFnz603FE1Uf
         R6MYSnc8y+i4gtBYCkTzA5sadYglWYTytoU10WkOLY84h/CoiZOPebNH3bfh3uyOD3eg
         oPJXY1ruCtwx5sEmlcnDvzXUCDJu5oS21xdqsWAgZT649TfRqxUJ2V6KVmYsuAecu+qZ
         bb7UR591MNrV/qxLUaTLZDJrPthIxaxbPyvZxwD4FIITraPnZTvCKed7P768qe/rwwRg
         4k7A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776768534; x=1777373334; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zfMfY1VtyrQV6XGAsu/qbdQXK78eRfkGbsz57Tor9o=;
        b=EX4wC7dahRTJObxh/htTRC25uU8S9nnrrQCLL2f1khRcUpifZOLXnHyogMDz7WUSY/
         rtCNfb9WNYAQCGWURzqRnV91aYWbrGvgDS2zI8eva6UFPngFtBr9Ngdfx67xzH3Ag11+
         E+5jdehcEMZB4qUxfaC2w8suhf5BTHYPdXfgAkRujBEvHb8cdwcuPB89NOfddChjZGWS
         80eYsKXaJGOSnB7kOeW+cg7WazFhykJMhKZML2x6Lmc0QgJuQ/i/+M++6+xl705lew5W
         CEiFIn7yDhFDKIpjYBlHWV0L9UCQse0FfaCMieMojjz/cVmeOn1yhiib1QIx6xRwDlAB
         WmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768534; x=1777373334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8zfMfY1VtyrQV6XGAsu/qbdQXK78eRfkGbsz57Tor9o=;
        b=ivnpmK9wYnzu5yKKrdKrYrX4MSZVJVim/6RFaSSDpj1RFBN7LY35Fb+bjLAng/P4/M
         XSa7x5C+/FcJ9WVmUbQvrcTrDXSnZGxXWYVrKBwTVH35BVSiAmrnjMv7iatwEzzGAwuK
         gCLzjyO+knQBI8oBDYg5KBZCC4bEQMRCgoImovgtpCzrXV1xZed+7X6kVLV2Zq5YYNSH
         J8Vyf22lpuCh50v0E2qqgoFk5SK/ngfIWTcEkKMW9eFh0pEeO2WAKS92Dw0Mmkx/ASdk
         C+ozyGoNL8BW343Kdcv4TmpZ24/CKqko4efloQogHQbgpj4nt14Iwuz7fMXI8k/lASko
         qXdA==
X-Forwarded-Encrypted: i=1; AFNElJ8oNab8IolbazpqQNXojaXiHncF2bwPkw1L6DAAxahUXA/9KZa/8jTLbdz1Zr2oPsJsJtLH+lYsdF4E@lists.linux.dev
X-Gm-Message-State: AOJu0YxgDMyHRzbP7bptb77v5VJvTYLFV9UBsurN9d5n8DTOfk2D2VmV
	bXde6MwKNRoI2V8ppdXJGYgFB9IqBm83M5ng3mM93WSHQIQPpi08HQeya7tPsjNCH9obw51AhZr
	w+f+xD0/ogY1tKRH69agGG+72r0tpbwg=
X-Gm-Gg: AeBDieuab8iN31KLX3K7y98FAqfG2hTXvpWXbKwHlzv0Z5xYzsMWJRHF6HDfpJPEtD1
	zMFq3UrccCW0/2QimK2EOcq0QMJyz0xIH/VtPfJyU9/Isnffahofy2O/qlyV+TOFn/Cw2NnSrUr
	I5cDLy31P4L8pzJnzWJomB5/k5lGjdAZg8Fp2TPYVP4fDUYnycgkKxoaPLPs+9aaGs4xrsWfLI0
	NpbJIOZ5BA4xQVH+hezM4VwTXWMGvFMpGvQx6kdMg/5DUJgrgr+0x9ljuk8M3iHG8vHvtiON2oj
	8clv6RRKy0ZpTAJKogVvFQpEQ9ROJFQFhA14bHrN/a7m4LGz4QM7
X-Received: by 2002:a17:907:a603:b0:ba3:e9be:f77e with SMTP id
 a640c23a62f3a-ba41ac04100mr834841766b.38.1776768533891; Tue, 21 Apr 2026
 03:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com> <20260420221637.2631478-9-joannelkoong@gmail.com>
In-Reply-To: <20260420221637.2631478-9-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Apr 2026 12:48:41 +0200
X-Gm-Features: AQROBzAixL3c7RGnDO_jxKJx6nM0aoZBb9Nf_EfaTEkxK2xPi8x3tMNIGS4KHFg
Message-ID: <CAOQ4uxh0E6BtxRVsJdvebybnvU5+n-bur-+SPySNAbKzdY59vw@mail.gmail.com>
Subject: Re: [PATCH v1 08/17] fuse: add passthrough ops gating
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> Route existing callers through a passthrough ops mask check to verify
> whether passthrough can be called for the operation or not. The check is
> only done when FUSE_PASSTHROUGH_INO mode is enabled, which preserves
> backwards compatibility with prior passthrough behavior.
>
> It is safe to get the backing file by accessing ff->passthrough directly
> in passthrough.c because passthrough.c is only compiled with
> CONFIG_FUSE_PASSTHROUGH=3Dy and the caller has already done the ops check=
.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/file.c        | 14 ++++++++------
>  fs/fuse/fuse_i.h      | 14 +++++++++++++-
>  fs/fuse/passthrough.c | 12 ++++++------
>  fs/fuse/readdir.c     |  2 +-
>  4 files changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index e719c54c12d2..a1de70bc589d 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -324,7 +324,7 @@ static void fuse_prepare_release(struct fuse_inode *f=
i, struct fuse_file *ff,
>         struct fuse_conn *fc =3D ff->fm->fc;
>         struct fuse_release_args *ra =3D &ff->args->release_args;
>
> -       if (fuse_file_passthrough(ff))
> +       if (fuse_file_passthrough(&fi->inode, ff, 0))
>                 fuse_passthrough_release(ff, fuse_inode_backing(fi));
>
>         /* Inode is NULL on error path of fuse_create_open() */
> @@ -1838,7 +1838,7 @@ static ssize_t fuse_file_read_iter(struct kiocb *io=
cb, struct iov_iter *to)
>         /* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
>         if (ff->open_flags & FOPEN_DIRECT_IO)
>                 return fuse_direct_read_iter(iocb, to);
> -       else if (fuse_file_passthrough(ff))
> +       else if (fuse_file_passthrough(inode, ff, FUSE_PASSTHROUGH_OP_REA=
D))
>                 return fuse_passthrough_read_iter(iocb, to);
>         else
>                 return fuse_cache_read_iter(iocb, to);
> @@ -1859,7 +1859,7 @@ static ssize_t fuse_file_write_iter(struct kiocb *i=
ocb, struct iov_iter *from)
>         /* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
>         if (ff->open_flags & FOPEN_DIRECT_IO)
>                 return fuse_direct_write_iter(iocb, from);
> -       else if (fuse_file_passthrough(ff))
> +       else if (fuse_file_passthrough(inode, ff, FUSE_PASSTHROUGH_OP_WRI=
TE))
>                 return fuse_passthrough_write_iter(iocb, from);
>         else
>                 return fuse_cache_write_iter(iocb, from);
> @@ -1872,7 +1872,8 @@ static ssize_t fuse_splice_read(struct file *in, lo=
ff_t *ppos,
>         struct fuse_file *ff =3D in->private_data;
>
>         /* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
> -       if (fuse_file_passthrough(ff) && !(ff->open_flags & FOPEN_DIRECT_=
IO))
> +       if (fuse_file_passthrough(file_inode(in), ff, FUSE_PASSTHROUGH_OP=
_READ) &&
> +           !(ff->open_flags & FOPEN_DIRECT_IO))
>                 return fuse_passthrough_splice_read(in, ppos, pipe, len, =
flags);
>         else
>                 return filemap_splice_read(in, ppos, pipe, len, flags);
> @@ -1884,7 +1885,8 @@ static ssize_t fuse_splice_write(struct pipe_inode_=
info *pipe, struct file *out,
>         struct fuse_file *ff =3D out->private_data;
>
>         /* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
> -       if (fuse_file_passthrough(ff) && !(ff->open_flags & FOPEN_DIRECT_=
IO))
> +       if (fuse_file_passthrough(file_inode(out), ff, FUSE_PASSTHROUGH_O=
P_WRITE) &&
> +           !(ff->open_flags & FOPEN_DIRECT_IO))
>                 return fuse_passthrough_splice_write(pipe, out, ppos, len=
, flags);
>         else
>                 return iter_file_splice_write(pipe, out, ppos, len, flags=
);
> @@ -2397,7 +2399,7 @@ static int fuse_file_mmap(struct file *file, struct=
 vm_area_struct *vma)
>          * in passthrough mode, either mmap to backing file or fail mmap,
>          * because mixing cached mmap and passthrough io mode is not allo=
wed.
>          */
> -       if (fuse_file_passthrough(ff))
> +       if (fuse_file_passthrough(inode, ff, FUSE_PASSTHROUGH_RW_OPS))
>                 return fuse_passthrough_mmap(file, vma);
>         else if (fuse_inode_backing(get_fuse_inode(inode)))
>                 return -ENODEV;
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index a15fb508fd28..45d9184d0f7a 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1630,9 +1630,21 @@ static inline struct fuse_backing *fuse_inode_back=
ing_set(struct fuse_inode *fi,
>  struct fuse_backing *fuse_passthrough_open(struct file *file, int backin=
g_id);
>  void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing =
*fb);
>
> -static inline struct file *fuse_file_passthrough(struct fuse_file *ff)
> +static inline struct file *fuse_file_passthrough(struct inode *inode,
> +                                                struct fuse_file *ff,
> +                                                u64 passthrough_ops)
>  {
>  #ifdef CONFIG_FUSE_PASSTHROUGH
> +       if (!ff->passthrough)
> +               return NULL;
> +
> +       if (ff->fm->fc->passthrough_ino && passthrough_ops) {
> +               struct fuse_backing *fb =3D fuse_inode_backing(get_fuse_i=
node(inode));
> +
> +               if (!fb || (fb->ops_mask & passthrough_ops) !=3D passthro=
ugh_ops)
> +                       return NULL;
> +       }
> +
>         return ff->passthrough;
>  #else
>         return NULL;


Please document the relationship between  FOPEN_PASSTHROUGH
and FUSE_PASSTHROUGH_RW_OPS.

Does a server need to opt-in both for the read/write operations passthrough
and the specific file (I guess so)?

The concept behind the inode iomodes is that it is not allowed to mix cache=
d
with passthrough ops on the same inode, because there be dragons.

If the server wants to opt-out of passthrough for a specific opened file,
which already has a backing inode, it must explicitly request the combinati=
on
FOPEN_DIRECT_IO | FOPEN_PASSTHROUGH
and then direct io will be performed, despite the inode having a backing in=
ode.

What you have done here is a private case of passthrough opt-out
not per file, but per operation.

The bottom line is if the fuse inode has a backing inode, then you must not
fallback to the fuse_cache_ operations in case the op is not in the mask,
but you may fallback to the fuse_direct_ operations.

I hope this does not complicate things for you too much,
but I also don't know (yet) what you intend this gating for.

Otherwise, this looks ok.

Thanks,
Amir.

> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index 514e4af46d79..8ecce2a97ee8 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -29,7 +29,7 @@ ssize_t fuse_passthrough_read_iter(struct kiocb *iocb, =
struct iov_iter *iter)
>  {
>         struct file *file =3D iocb->ki_filp;
>         struct fuse_file *ff =3D file->private_data;
> -       struct file *backing_file =3D fuse_file_passthrough(ff);
> +       struct file *backing_file =3D ff->passthrough;
>         size_t count =3D iov_iter_count(iter);
>         ssize_t ret;
>         struct backing_file_ctx ctx =3D {
> @@ -56,7 +56,7 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
>         struct file *file =3D iocb->ki_filp;
>         struct inode *inode =3D file_inode(file);
>         struct fuse_file *ff =3D file->private_data;
> -       struct file *backing_file =3D fuse_file_passthrough(ff);
> +       struct file *backing_file =3D ff->passthrough;
>         size_t count =3D iov_iter_count(iter);
>         ssize_t ret;
>         struct backing_file_ctx ctx =3D {
> @@ -83,7 +83,7 @@ ssize_t fuse_passthrough_splice_read(struct file *in, l=
off_t *ppos,
>                                      size_t len, unsigned int flags)
>  {
>         struct fuse_file *ff =3D in->private_data;
> -       struct file *backing_file =3D fuse_file_passthrough(ff);
> +       struct file *backing_file =3D ff->passthrough;
>         struct backing_file_ctx ctx =3D {
>                 .cred =3D ff->cred,
>                 .accessed =3D fuse_file_accessed,
> @@ -107,8 +107,8 @@ ssize_t fuse_passthrough_splice_write(struct pipe_ino=
de_info *pipe,
>                                       size_t len, unsigned int flags)
>  {
>         struct fuse_file *ff =3D out->private_data;
> -       struct file *backing_file =3D fuse_file_passthrough(ff);
>         struct inode *inode =3D file_inode(out);
> +       struct file *backing_file =3D ff->passthrough;
>         ssize_t ret;
>         struct backing_file_ctx ctx =3D {
>                 .cred =3D ff->cred,
> @@ -132,7 +132,7 @@ ssize_t fuse_passthrough_splice_write(struct pipe_ino=
de_info *pipe,
>  ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *=
vma)
>  {
>         struct fuse_file *ff =3D file->private_data;
> -       struct file *backing_file =3D fuse_file_passthrough(ff);
> +       struct file *backing_file =3D ff->passthrough;
>         struct backing_file_ctx ctx =3D {
>                 .cred =3D ff->cred,
>                 .accessed =3D fuse_file_accessed,
> @@ -150,7 +150,7 @@ int fuse_passthrough_readdir(struct file *file, struc=
t dir_context *ctx)
>         const struct cred *old_cred;
>         struct inode *inode =3D file_inode(file);
>         struct fuse_file *ff =3D file->private_data;
> -       struct file *backing_file =3D fuse_file_passthrough(ff);
> +       struct file *backing_file =3D ff->passthrough;
>         bool locked;
>
>         pr_debug("%s: backing_file=3D0x%p, pos=3D%lld\n", __func__,
> diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
> index 49226f022339..1f2ff63cd317 100644
> --- a/fs/fuse/readdir.c
> +++ b/fs/fuse/readdir.c
> @@ -593,7 +593,7 @@ int fuse_readdir(struct file *file, struct dir_contex=
t *ctx)
>         if (fuse_is_bad(inode))
>                 return -EIO;
>
> -       if (fuse_file_passthrough(ff))
> +       if (fuse_file_passthrough(inode, ff, FUSE_PASSTHROUGH_OP_READDIR)=
)
>                 return fuse_passthrough_readdir(file, ctx);
>
>         err =3D UNCACHED;
> --
> 2.52.0
>
