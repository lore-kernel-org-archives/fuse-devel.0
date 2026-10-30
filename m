Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793372654;
	b=rj8DJuQnh73zANxX0PaRcnJWoy0WW3Ok9GtLzEhNHhMPK6We3J4xMz84L9j1yW0KnbNV
	 9kCrlb4BzgUYg6xXcLVOB/TQCgOvOObzDu9teuJJ1CaB83tmSfOKtkFMLLq9F8EoVHuH2
	 TksziuKFpOpTr3O78YHMSTWPKhkeP/qIbzS5cui1B6ytOm44WobnetZDcrmbJAlFmN+6r
	 7yARXSWjGzq3njfbqZKts5NSXHqq8QEXwe7DytoJM6sI0BrLPld/DqeFXuuBXSQQ9N7uV
	 kO/rmFmd7d1xq9PglqMHC2zAsk9FzQjvcCMJJSv+8qElUug79trjQenNgKM2NjwB/rA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I9NMB8N1J0onZAcfPN60V09FP0FPSVmH42zxst9UC/0=;
	b=Vgl4djGjMvBvZqijQWgno1MqfzQpACNPf+miQaDbinJa4dRNGHRBIJuj+aEXZI7Pj9AX
	 YP/Ej+ERGxDu4crmrfzQXTZ1VSpFe/qUQgKAblpX/i3gMpncdYgrWPlzXbl937a1kNuPe
	 jt8suLiz6ojdVOiuVG3Wdq4viGR9skl2im6jSNGAHD5zRcGjzB6HKpt7CHkTbL6mYaHnU
	 a3CML3NRDXDqTQEnPTK+tuHXjKz2/IUG5hP/1m5I96uDoE8FrFtykHz9OaLDihMxAtVPc
	 /Ihru1Zc23NN/dEIvZOFBC6b2pCwxKWOo7GAYDvGz2CNfNJ0zOR/++g55R8GJPo7UVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZO10KomD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C348606A31C
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 15:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C348606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZO10KomD
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so1054973a12.1
        for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 08:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793372652; cv=none;
        d=google.com; s=arc-20260327;
        b=HwyS2ic/5LtmmtJV8ek6lq58HfRKA+YhFDus1FnhmtYYBS9frVA8KTB9+x3WuiPKXO
         9RLr6yVHNZHer09bhUEfD8JwFR1Hj7PROtw4MYAgY73rmCzPzN5n5Pu1NXPDO8zWLFPN
         R2r3DUZXBpaPumg0GaIBMnUwfkMLidsmTDyHkhdzdbM5dB8KR+FJEXdhzzuGYgkca3sq
         iZEngs/neht3SrYBQdtYaJrPw/p5csht2Mkxbmb0Uxx0J/bsZ0dtKMWPHh3sKFddB8gl
         7ocTiT/YNmRNwDkmumluvzhJmXVQ2mLLuNuMYtIDhBhEWvQrYoiXbi+YNI0kYv7VsbuQ
         c5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I9NMB8N1J0onZAcfPN60V09FP0FPSVmH42zxst9UC/0=;
        fh=WMJ11D7uBlgxyDcs1PurjbVvs5LhixO37KXO76yPL/E=;
        b=lCFKan0HfzU4ICjDfKvMNKcG77KhdWcqkn7PlN2b7PRCIVUsA6WWC+tiM11C7BdOnf
         cppLaUBooXzjnRr4n3GKBs3uoTLQDScCaSVt/Ddk1g0ayJgM33TzpHCLAv8FH+iPiu1f
         XkdET2p4yy0nOE/9BmFg0CphuFG6IALRQ6KrzQ0aF9oGX0u+EmVUzra3vDEN9apNLbNx
         sOHzomv66wO62Sx4DyvR2wyIo89hHymlStI9jgdm1IRaClVFK+hE2zsFfJsApcXbcNYa
         z9HyABMeUl/HxLQI21WtLX+JSDdG7wNuhcAO7JpNI7yjFRYhF3vfhNJTEFc20Mb515BC
         OiVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793372652; x=1793977452; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I9NMB8N1J0onZAcfPN60V09FP0FPSVmH42zxst9UC/0=;
        b=ZO10KomD7p/pEe1MJ60Q0VAixmf3+a1I9ilVkHeE4ICb1qvYDuY/dZeW729UPslBVU
         2nM/tQZLVQPE+DHRBBT6edUyuO2jdkoibVry8cWtnA8Zhn9uos/zp3tZ/gRc4VTaoJUN
         Dgsz1ky0ZnmC5lSdHaXUNu7qv/0x89NN+VG+Ym/luMMVpFIbBMuXy0GoKBbG6lq05Q14
         2F44Zme6PB5Fzhj2U1viTyz1/2a1GwGMrD5jgYXYAorPuOYk3tyWxQEm4F+UmG6fReCE
         iqjHd3a65icLybYwHz3whgMkByIkT3KmVWnp3QW2T70AyUZe3mdLwuj6qzKg5n8SD4oa
         h34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372652; x=1793977452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9NMB8N1J0onZAcfPN60V09FP0FPSVmH42zxst9UC/0=;
        b=mV8yTmQysq9DHJkpW3qDZtdnFq0WqX/PYqY5ygcGBKa/gOzEdvAWoCCvAqUMY9VYHA
         vKMJi7NsYMB4g6XseokyUW4neRznlT4knBZPaHMiO39BhkVvOYL6jX5j4AwAzkYieFBi
         /zR6FtMY2xJlJz4jD4R2zHK5y19YbHX4tOzPwWBeA09p0yZ03PqrHz1NW5ny+qJVDpU1
         tNrjBmpaR7dxp71xYcvtU0mHyUz/odidgw3Ms8mP6Iaq0X6jfxIj+2xA4ZPiVZYCBFCO
         6qJ+tABDb5C0Lia95BAgdsrU1LHsBU/CWEKADCLpAbP81W0XvzS/olprPBxdOCbFLEOR
         FjVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP/gWucUU9DBbS+z0IrSiD+qAD8KzjyFv69Rs2rj/XcJy3OJtdD9npC9h5Vco7C97LySM0MZ1vZm5l@lists.linux.dev
X-Gm-Message-State: AFq9FYJ2T997A5wNZQ/r8ZscmUUyXBhX4U2MLX7P4sVyihv/HrFuFuZe
	xFF/nUZd3H5Y0KYxV4q8V3beleEtMg/fNvzyhDbIfdxW/qrtaJJoQsM5zBfGonZIP6qBlD/Hn00
	f/E4x9K4VdCTgx4iC8rn1r7RmEK3Lfg7vUXnp
X-Gm-Gg: AYBFou1eZ4nxwrO+PS3meH73lc/4m1WuwmP/gaNHtmOt6mjVDRA8sy6+9C5n/nBiatS
	YhbRKKCD7WYLEpUtMz5hoVifeQkfRn0r27ki4ZcL7x7wCgg02SNxe1Rq+Fv4RgzyQ10yJzuEN0C
	aA90dtpXQQ1nGh21PlgUn+mosfgbAB70Qh0A3ojK42sBu/IJOTgpJl8354tNbU7MqnB05QR+Xqx
	S9muUweesNKlc+MYBIqi85W7yuwhwXwtVW6nzyIM1B7heow9TAXMpQf8yFguur9CRbU8foqzr6s
	Q2OU87GXMhS7ATg2L2p5h72Ra1TnMROzD9x3ajEp3bbyDb17l/NsJe2x26s/d5LIR5alL4ABXFB
	uhkrmeIDH8jS32WUhNlzHDTmeigbgx7GBvKKYzdyMmrYaJqDFKSXg5beB6OmSAhKtjpwz98+hch
	HR2Nte3PtQHP7xQbU=
X-Received: by 2002:aa7:d3cc:0:b0:6b4:5f93:33cd with SMTP id
 4fb4d7f45d1cf-6b4d438456emr1602645a12.8.1793372651388; Fri, 30 Oct 2026
 08:04:11 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028091215.914885-1-hanwenn@gmail.com> <20261028091215.914885-4-hanwenn@gmail.com>
In-Reply-To: <20261028091215.914885-4-hanwenn@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 30 Oct 2026 16:04:00 +0100
X-Gm-Features: AclHuK-IBEPehMVNY1QUHPJ3wFZtW_RFTfS0jY0jVwZP3YE-Bf_3UJctkry6yVo
Message-ID: <CAOQ4uxifRX0mnMXXCwVEy57_ecqjEHF6w7pE9sqvMr341ixCxg@mail.gmail.com>
Subject: Re: [PATCH 3/7] fuse: fill the negative lookup cache from complete
 READDIRPLUS passes
To: Han-Wen Nienhuys <hanwenn@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:15=E2=80=AFAM Han-Wen Nienhuys <hanwenn@gmail.co=
m> wrote:
>
> Add FOPEN_COMPLETE_DIR, with which the server marks a directory at
> OPENDIR, promising to announce remote additions with
> FUSE_NOTIFY_INVAL_ENTRY. When such a directory is read with READDIRPLUS
> from offset 0 to EOF, build its name filter from the returned names.
> This needs no extra transfer. Readdir holds the directory lock only per
> request, so local modifications in between are caught by the names
> generation, sampled at offset 0. The flag is per OPENDIR, as READDIRPLUS
> replies have no header to carry it.
>
> The filter expires with the entry timeout of ".", which is otherwise
> unused, so the server can choose it, also for an empty directory. If "."
> has no nodeid, the smallest timeout of the other entries with a nodeid
> is used, so that no negative answer outlives a positive one the server
> handed out. Without any timeout, no filter is built.
>
> Names are collected per struct fuse_file, as hashes in a temporary
> array, since their number is only known at EOF. The collection is

Since the server is communicating TTL in "." entry, how about letting it
communicate the expected collection size in st_size or st_blocks of directo=
ry?

This is generally what directory size means and many filesystems
can have this number ready to publish without a full readdir.
Not sure if the contract of FOPEN_COMPLETE_DIR should include this or not.


> abandoned on a seek, an error, or more than 2^18 names. While
> collecting, READDIRPLUS is forced, as READDIR carries no timeouts. A
> pass served from the readdir cache (FOPEN_CACHE_DIR) collects nothing,
> so an expired filter is not rebuilt until the cache is.
>
> Signed-off-by: Han-Wen Nienhuys <hanwenn@gmail.com>
> Assisted-by: Claude:claude-opus-5-5
> ---
>  fs/fuse/dir.c             |   1 +
>  fs/fuse/fuse_i.h          |   3 +
>  fs/fuse/inode.c           |   2 +-
>  fs/fuse/readdir.c         | 146 ++++++++++++++++++++++++++++++++++++--
>  include/uapi/linux/fuse.h |  16 ++++-
>  5 files changed, 162 insertions(+), 6 deletions(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 10efd6d32c0c..07a3aab51704 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -1951,6 +1951,7 @@ static int fuse_dir_open(struct inode *inode, struc=
t file *file)
>
>  static int fuse_dir_release(struct inode *inode, struct file *file)
>  {
> +       fuse_readdir_names_release(file->private_data);
>         fuse_release_common(file, true);
>
>         return 0;
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 2a75c9597811..7306493f8a2a 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -343,6 +343,8 @@ struct fuse_file {
>                 /** @version: Version of cache we are reading */
>                 u64 version;
>
> +               /** @names: listing being collected for FOPEN_COMPLETE_DI=
R */
> +               struct fuse_dir_names_builder *names;
>         } readdir;
>
>         /** @polled_node: RB node to be linked on fuse_conn->polled_files=
 */
> @@ -1274,6 +1276,7 @@ int fuse_set_acl(struct mnt_idmap *, struct dentry =
*dentry,
>
>  /* readdir.c */
>  int fuse_readdir(struct file *file, struct dir_context *ctx);
> +void fuse_readdir_names_release(struct fuse_file *ff);
>
>  /* dir_names.c */
>
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index c5229eed363d..5647089eaa5a 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1508,7 +1508,7 @@ static struct fuse_init_args *fuse_new_init(struct =
fuse_mount *fm)
>                 FUSE_SECURITY_CTX | FUSE_CREATE_SUPP_GROUP |
>                 FUSE_HAS_EXPIRE_ONLY | FUSE_DIRECT_IO_ALLOW_MMAP |
>                 FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_ALLOW_IDM=
AP |
> -               FUSE_REQUEST_TIMEOUT;
> +               FUSE_REQUEST_TIMEOUT | FUSE_HAS_COMPLETE_DIR;
>  #ifdef CONFIG_FUSE_VDAX
>         if (fm->fc->vdax)
>                 flags |=3D FUSE_MAP_ALIGNMENT;
> diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
> index f719545d5f59..77fcfd1c7343 100644
> --- a/fs/fuse/readdir.c
> +++ b/fs/fuse/readdir.c
> @@ -13,6 +13,125 @@
>  #include <linux/vmalloc.h>
>  #include <linux/namei.h>
>
> +/*
> + * Names of a listing that is being read with FOPEN_COMPLETE_DIR.  The n=
umber of
> + * names is only known at EOF, so the filter is built from these hashes =
then.
> + */
> +struct fuse_dir_names_builder {
> +       u64 *hash;
> +       unsigned int count;
> +       unsigned int size;
> +       /* entry timeouts of ".", and the smallest of the others; or U64_=
MAX */
> +       u64 dot_expires;
> +       u64 expires;
> +       int epoch;
> +       /* names generation when the listing was started */
> +       u64 gen;
> +       /* ctx->pos expected by the next getdents call */
> +       loff_t pos;
> +};
> +
> +void fuse_readdir_names_release(struct fuse_file *ff)
> +{
> +       struct fuse_dir_names_builder *nb =3D ff->readdir.names;
> +
> +       if (!nb)
> +               return;
> +       kvfree(nb->hash);
> +       kfree(nb);
> +       ff->readdir.names =3D NULL;
> +}
> +
> +static void fuse_readdir_names_start(struct file *file)
> +{
> +       struct fuse_file *ff =3D file->private_data;
> +       struct inode *inode =3D file_inode(file);
> +       struct fuse_dir_names_builder *nb;
> +
> +       fuse_readdir_names_release(ff);
> +
> +       nb =3D kzalloc_obj(*nb, GFP_KERNEL_ACCOUNT);
> +       if (!nb)
> +               return;
> +       nb->dot_expires =3D U64_MAX;
> +       nb->expires =3D U64_MAX;
> +       nb->epoch =3D atomic_read(&get_fuse_conn(inode)->epoch);
> +       nb->gen =3D fuse_dir_names_gen(inode);
> +       ff->readdir.names =3D nb;
> +}
> +
> +static void fuse_readdir_names_collect(struct file *file,
> +                                      struct fuse_direntplus *direntplus=
)
> +{
> +       struct fuse_file *ff =3D file->private_data;
> +       struct fuse_dir_names_builder *nb =3D ff->readdir.names;
> +       struct fuse_conn *fc =3D get_fuse_conn(file_inode(file));
> +       struct fuse_dirent *dirent =3D &direntplus->dirent;
> +       struct fuse_entry_out *o =3D &direntplus->entry_out;
> +
> +       if (!nb)
> +               return;
> +
> +       if (o->nodeid) {
> +               u64 expires =3D fuse_time_to_jiffies(o->entry_valid,
> +                                                  o->entry_valid_nsec);
> +
> +               if (dirent->namelen =3D=3D 1 && dirent->name[0] =3D=3D '.=
')
> +                       nb->dot_expires =3D expires;
> +               else
> +                       nb->expires =3D min(nb->expires, expires);
> +       }
> +
> +       if (name_is_dot_dotdot(dirent->name, dirent->namelen))
> +               return;
> +
> +       if (nb->count =3D=3D nb->size) {
> +               unsigned int size =3D max(nb->size * 2, 64U);
> +               u64 *hash;
> +
> +               if (size > FUSE_DIR_NAMES_MAX)
> +                       goto abort;
> +               hash =3D kvrealloc(nb->hash, size * sizeof(*hash),
> +                                GFP_KERNEL_ACCOUNT);
> +               if (!hash)
> +                       goto abort;
> +               nb->hash =3D hash;
> +               nb->size =3D size;
> +       }
> +       nb->hash[nb->count++] =3D fuse_dir_name_hash(fc, dirent->name,
> +                                                  dirent->namelen);
> +       return;
> +
> +abort:
> +       fuse_readdir_names_release(ff);
> +}
> +
> +static void fuse_readdir_names_publish(struct file *file)
> +{
> +       struct fuse_file *ff =3D file->private_data;
> +       struct fuse_dir_names_builder *nb =3D ff->readdir.names;
> +       struct fuse_dir_names *names;
> +       unsigned int i;
> +       u64 expires;
> +
> +       if (!nb)
> +               return;
> +
> +       /* "." is never looked up, so its timeout is for the listing */
> +       expires =3D nb->dot_expires !=3D U64_MAX ? nb->dot_expires : nb->=
expires;
> +       if (expires =3D=3D U64_MAX)
> +               goto out;
> +
> +       names =3D fuse_dir_names_alloc(nb->count, expires, nb->epoch);
> +       if (!names)
> +               goto out;
> +       for (i =3D 0; i < nb->count; i++)
> +               fuse_dir_names_insert(names, nb->hash[i]);
> +       fuse_dir_names_publish(file_inode(file), names, nb->gen);
> +out:
> +       fuse_readdir_names_release(ff);
> +}
> +
>  static bool fuse_use_readdirplus(struct inode *dir, struct dir_context *=
ctx)
>  {
>         struct fuse_conn *fc =3D get_fuse_conn(dir);
> @@ -365,8 +484,14 @@ static int parse_dirplusfile(char *buf, size_t nbyte=
s, struct file *file,
>                            which we did not link.
>                         */
>                         over =3D !fuse_emit(file, ctx, dirent);
> -                       if (!over)
> +                       if (!over) {
>                                 ctx->pos =3D dirent->off;
> +                               /*
> +                                * Only names the caller takes: the rest =
of the
> +                                * reply is sent again by the next reques=
t.
> +                                */
> +                               fuse_readdir_names_collect(file, direntpl=
us);
> +                       }
>                 }
>
>                 buf +=3D reclen;
> @@ -426,9 +551,12 @@ static int fuse_readdir_uncached(struct file *file, =
struct dir_context *ctx)
>  {
>         int plus;
>         ssize_t res;
> +       struct fuse_file *ff =3D file->private_data;
>         struct inode *inode =3D file_inode(file);
>         struct fuse_mount *fm =3D get_fuse_mount(inode);
>         struct fuse_conn *fc =3D fm->fc;
> +       bool complete =3D fc->do_readdirplus &&
> +                       (ff->open_flags & FOPEN_COMPLETE_DIR);
>         struct fuse_io_args ia =3D {};
>         struct fuse_args_pages *ap =3D &ia.ap;
>         void *buf;
> @@ -441,7 +569,14 @@ static int fuse_readdir_uncached(struct file *file, =
struct dir_context *ctx)
>         if (!pages)
>                 return -ENOMEM;
>
> -       plus =3D fuse_use_readdirplus(inode, ctx);
> +       if (complete && !ctx->pos)
> +               fuse_readdir_names_start(file);
> +       else if (ff->readdir.names && ff->readdir.names->pos !=3D ctx->po=
s)
> +               fuse_readdir_names_release(ff);
> +
> +       /* Collecting needs entry timeouts */
> +       plus =3D (complete && ff->readdir.names) ||
> +              fuse_use_readdirplus(inode, ctx);
>         if (plus) {
>                 attr_version =3D fuse_get_attr_version(fm->fc);
>                 evict_ctr =3D fuse_get_evict_ctr(fm->fc);
> @@ -456,10 +591,9 @@ static int fuse_readdir_uncached(struct file *file, =
struct dir_context *ctx)
>                 goto out;
>
>         if (!res) {
> -               struct fuse_file *ff =3D file->private_data;
> -
>                 if (ff->open_flags & FOPEN_CACHE_DIR)
>                         fuse_readdir_cache_end(file, ctx->pos);
> +               fuse_readdir_names_publish(file);
>                 goto out;
>         }
>
> @@ -479,7 +613,11 @@ static int fuse_readdir_uncached(struct file *file, =
struct dir_context *ctx)
>         /* The server took lookup references also for entries not linked =
*/
>         if (plus && res < 0)
>                 fuse_direntplus_forget(inode, pages, parsed, nbytes);
> +       if (!res && ff->readdir.names)
> +               ff->readdir.names->pos =3D ctx->pos;
>  out:
> +       if (res < 0)
> +               fuse_readdir_names_release(ff);
>         kfree(ap->folios);
>         release_pages(pages, ap->num_folios);
>         kfree(pages);
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 616430a2973c..32331c9b49b3 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -257,6 +257,9 @@
>   *  - add backing_id_64 to fuse_open_out
>   *  - add FUSE_NOTIFY_BACKING_MAP, fuse_notify_backing_map_out, fuse_ext=
ent
>   *  - add FUSE_BACKING_MAP_CREATE, FUSE_BACKING_MAP_CYCLIC
> + *
> + *  7.48
> + *  - add FOPEN_COMPLETE_DIR and FUSE_HAS_COMPLETE_DIR
>   */
>
>  #ifndef _LINUX_FUSE_H
> @@ -292,7 +295,7 @@
>  #define FUSE_KERNEL_VERSION 7
>
>  /** Minor version number of this interface */
> -#define FUSE_KERNEL_MINOR_VERSION 47
> +#define FUSE_KERNEL_MINOR_VERSION 48
>
>  /** The node ID of the root inode */
>  #define FUSE_ROOT_ID 1
> @@ -406,6 +409,14 @@ struct fuse_file_lock {
>   *                           (FUSE_URING_ZERO_COPY) and the request carr=
ies page
>   *                           payload. Otherwise reads/writes fall back t=
o
>   *                           copying.
> + * FOPEN_COMPLETE_DIR: a complete READDIRPLUS listing of this directory =
is
> + *                     authoritative: names not in it are looked up as
> + *                     negative without sending FUSE_LOOKUP.  This holds
> + *                     until the entry timeout of "." expires, or if "."=
 has
> + *                     nodeid 0, the smallest entry timeout of the entri=
es
> + *                     with a nonzero nodeid.  "." does not count as a
> + *                     lookup.  LOOKUP must only resolve names in the
> + *                     listing, byte for byte (eg. no case folding).
>   */
>  #define FOPEN_DIRECT_IO                (1 << 0)
>  #define FOPEN_KEEP_CACHE       (1 << 1)
> @@ -416,6 +427,7 @@ struct fuse_file_lock {
>  #define FOPEN_PARALLEL_DIRECT_WRITES   (1 << 6)
>  #define FOPEN_PASSTHROUGH      (1 << 7)
>  #define FOPEN_IO_URING_ZERO_COPY (1 << 8)
> +#define FOPEN_COMPLETE_DIR     (1 << 9)
>
>  /*
>   * INIT request/reply flags
> @@ -480,6 +492,7 @@ struct fuse_file_lock {
>   *             privilege that mounting virtiofs or fuseblk requires).
>   *             Insufficiently privileged servers ignore it.
>   * FUSE_PASSTHROUGH_V2: use 64 bit server allocated backing ID
> + * FUSE_HAS_COMPLETE_DIR: kernel supports FOPEN_COMPLETE_DIR
>   */
>  #define FUSE_ASYNC_READ                (1 << 0)
>  #define FUSE_POSIX_LOCKS       (1 << 1)
> @@ -530,6 +543,7 @@ struct fuse_file_lock {
>  #define FUSE_HAS_IO_URING_BUFPOOL (1ULL << 43)
>  #define FUSE_HAS_SYNCFS                (1ULL << 44)
>  #define FUSE_PASSTHROUGH_V2    (1ULL << 45)
> +#define FUSE_HAS_COMPLETE_DIR  (1ULL << 46)
>
>  /*
>   * CUSE INIT request/reply flags
> --
> 2.56.0
>
>
