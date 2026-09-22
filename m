Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FC952122E
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074857; cv=pass; b=owb2a2B+Ey8wfA5x+UFnXgY4pU0qRqP9EzP5Z/TS7V3DmfHmU65SDpERA0Lfj/KD4cYDqGWtHiTWf0XkGXp26stgHrisVT5J7IdzoIyGTuNJ6Yi99SY/EQh0S7/EzJlJuNhdkti/LdhyO70Rlu69A+mFFnFsh8RxSIM9QcD67s4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074857; c=relaxed/simple;
	bh=U7F8CnsRfE3LLzry5LNZNn9DEj81lpZz2B7fs3SWIeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7KP0SqEhqCSKh6ptGdCb3edVQDYVdhefmBpv9bSYqDKkL+IVr61ux5amCrEwtrrDCKqtBnyzYYgI7wFu7Jyf59ur+FMQG+aLwv18uCpNsQ/04DpVk/a5rJ06eQW+CBib/+y64uyTyB41w3wWhFrhfzS4x7DtIfza9eMTr7PXsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsEzP3QF; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsEzP3QF"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso611805666b.1
        for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 04:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790074854; cv=none;
        d=google.com; s=arc-20260327;
        b=QCRK+LtyPJzw2hIkS3xlQs6+K2dky8dlyuP0NF0L4X19j4vvUa4pbY+9yfH5m+EAsH
         Apneoapw0+Lvo6Td2zZ5DUn2oN8lxnBxUKu0P4rHcmbxLRZrFwxqvIFfwuAtJPLVWSRa
         iRprQDQYtZCiDeOvMKek+EPYMKqNYxdZkutR1n4+8JnFiQwMJ02YwoSspmf1eY8sl21x
         hVX6yGzcmvX6FC14DpgfL878pa31dOF60hxQWqa1zAwM5YqgNPgrSkYVVD9MmhGd972R
         tfS6FLBjLbMcoRzLHv0wJH+kTuUX3DUvBrzmUaGaqREfItp59KSTjZUTiNnKhucr5Pbu
         Z4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uLUynWFhLtbo9xoarJPOqSh6t7k4iQJGNErPsg+KReo=;
        fh=LSGkIxL+7O1MPXHhjOsZelXZcZzf1zyb+22wAIOwAjQ=;
        b=Uw/HBIV/2PvRv1bLCoSQ7Ui8BB0kDUylFCmyU23iVBmjRf/iMcoZbo7jGoWMYWzWTh
         F2D91Pgm9uMy2YAgUeL6186idJNoHErSmsn71ukCbN2FIu5fz6FMLA90jWPRgdSg4eBR
         Fgh2URdBAHVr7RIgpIGZOTgcE8AHtJ8bHFiq6Y9gbLgHCD57paom09IVF6mOXJgQ24Qx
         T5EuvtM411xK3j3nEpr5d863ZUv8sObIXnMc1r/eKkgIBZ00YnUODflgkC4fpKX8gHgh
         nEidAXkZHP7iGHFxg23U9g7gfnUBypknqvYo9D4qdYp3GwEgC4MiCfG1af/8E2Atva4F
         OuQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790074854; x=1790679654; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uLUynWFhLtbo9xoarJPOqSh6t7k4iQJGNErPsg+KReo=;
        b=TsEzP3QFGfvnzvJ5D9BuvdTUISKJPFz2OmfkMkTBT7gQeuNLbkkE35M8AiSIeItlhI
         p1xZPBauQaWWzYWGwzP/SqM9y9osPFR/3Zc5PKXXZqq20j/1M13VKmPZ2rYPEETAFL/R
         GS87xzGFKx1GoWAMulv4XhDe6Mj6cy9lC9vHZj4ve0OfRNv5L6oiPHYaY/2tkfOQYps4
         z5W4/hC0dw3w7NUDyOnVn7r8Foz1KqTVwpOnq2xzzlc5N/z74iKKtihmOvwV6W6Qy6an
         iYdLAWNY7r9naV+CIE8+sixQMAtrJ89ugDEhSEYL0hkde2UKLdmeWwwB8tEpDf16smou
         S/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074854; x=1790679654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLUynWFhLtbo9xoarJPOqSh6t7k4iQJGNErPsg+KReo=;
        b=Ow4bAGdqYRcY8xrIWEBDyikpzAwtldAZ4KOxsMXH/kgEzeJpP+vEufynn0p1oNyJU9
         uxZVVlgXdywWfsxTWHwuTw4WpjAX2ajv690rv4hQ2t4m0LC1Ypf7nxBC4+EYq22Kl/x3
         DufIleZHjdnc30EOZNhOpP+KDbKnIpMf1uyAI2N0UtAlSKygfGCGeEa0ws4USefHfZhw
         42YJb/397pCjW1Ud+Kx8vjWSAsOSsXGXwuwXTwJG6SapDy8FbYyN9KGKPqhXaKfMlIdq
         0f2f53GLTy9MR1IG0xW9SSz5lTls3QMz8LhN9OInR3HpqSXqgTtywdMNwJGDDTq6Iv7i
         lpkA==
X-Gm-Message-State: AFuF++lDzDvPmAp9p6AM7fOySqVUdO+unqtHwmYf2pt0X5MPod3e+qZr
	M7tu10ogM4YfEu51xGsdRJqYNZuHZkiPsQ4yEq82CEjXjDUFdsi4PugFputhH/vkVQ2Zt5rV6zg
	UOsERFQWmPYDIlWmTDbSe9vB6ZCao1uw=
X-Gm-Gg: AYBFou20hep2WfVuYkb9G2Y1HSQtPRByNEFDjgog4EGMN+CMTh5xAIuiWPMF8mktfDN
	CDGsJVmAGfZ5CH8DHuNwCi/c/MglGdCxxW0y4JoUDPryIOGeQ/85FG669cDN6ifXVzceDLd/XAk
	36DIzBmoCHxdZsoe479d2c5eNviRsnrdTGJi6txXE54u7oVNkGpx+9aZTREwzRpJUmNTtxlYCo2
	FKqfvPkt/rZ+bWBhrm25r3/sdunsLFcLKd35ba4AvYTz9kVktQ41O9TdlL+XsNiKeS7qu7RwX4d
	OwkHNhPF4PkK7Xum3LvVqwW7ChM5UyJqOqzFFCwZp6puJ6updCuWFkMR
X-Received: by 2002:a17:907:a310:b0:c29:c213:1ec9 with SMTP id
 a640c23a62f3a-c2a156a52b5mr1171892166b.9.1790074853568; Tue, 22 Sep 2026
 04:00:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-9-mszeredi@redhat.com>
In-Reply-To: <20260922061019.3320196-9-mszeredi@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 22 Sep 2026 13:00:42 +0200
X-Gm-Features: AcwNN1VWgnPEn2MSVDmImDW1HHwXUE37pSeySwAQeO109HASaJfEfOkmTRRjCQE
Message-ID: <CAOQ4uxj8hVvShust-TkAQUgTJCVvNsWjDiqayeUjVifUBotH7g@mail.gmail.com>
Subject: Re: [PATCH 08/11] fuse: add support for opening dax device as backing
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> Add FUSE_BACKING_IS_DEV flag that allows opening a character device
> (dax device) as a backing, in addition to regular files.
>
> Mark the inode with S_DAX if FUSE_LOOKUP returns with FUSE_ATTR_DAX set.
>
> This patch does not yet provide a way actually use the dax dev backing:
> when such a backing ID is provided in reply to FUSE_OPEN with
> FOPEN_PASSTHROUGH flag set, an error will be returned.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/backing.c         | 131 ++++++++++++++++++++++++++------------
>  fs/fuse/file.c            |   2 +-
>  fs/fuse/fuse_i.h          |  28 +++++++-
>  fs/fuse/inode.c           |  11 +++-
>  fs/fuse/passthrough.c     |   8 ++-
>  include/uapi/linux/fuse.h |   3 +
>  6 files changed, 136 insertions(+), 47 deletions(-)
>
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index 58dbdd17c1ef..aa558a0c2e64 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -9,6 +9,7 @@
>  #include "fuse_i.h"
>
>  #include <linux/file.h>
> +#include <linux/dax.h>
>  #include <linux/rhashtable.h>
>
>  static struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
> @@ -22,9 +23,16 @@ static void fuse_backing_free(struct fuse_backing *fb)
>  {
>         pr_debug("%s: fb=3D0x%p\n", __func__, fb);
>
> -       if (fb->file)
> -               fput(fb->file);
> -       put_cred(fb->cred);
> +       switch (fb->type) {
> +       case FUSE_BACKING_PATH:
> +               path_put(&fb->path);
> +               put_cred(fb->cred);
> +               break;
> +
> +       case FUSE_BACKING_DAXDEV:
> +               fs_put_dax(fb->dax_dev, fb);
> +               break;
> +       }
>         kfree_rcu(fb, rcu);
>  }
>
> @@ -79,23 +87,88 @@ static struct fuse_backing *fuse_backing_id_remove(st=
ruct fuse_conn *fc, u64 id,
>         return fb;
>  }
>
> +static int fuse_dax_notify_failure(struct dax_device *daxdev, u64 offset=
, u64 len, int mf_flags)
> +{
> +       struct fuse_backing *fb =3D dax_holder(daxdev);
> +
> +       fb->dax_error =3D true;
> +
> +       return 0;
> +}
> +
> +static const struct dax_holder_operations fuse_dax_holder_ops =3D {
> +       .notify_failure         =3D fuse_dax_notify_failure,
> +};
> +
> +static int fuse_backing_open_file(struct fuse_conn *fc, struct fuse_back=
ing *fb, struct file *file,
> +                                 bool is_dev)
> +{
> +       struct inode *inode =3D file_inode(file);
> +       struct dax_device *daxdev;
> +       int err;
> +
> +       switch (inode->i_mode & S_IFMT) {
> +       case S_IFREG:
> +               if (is_dev)
> +                       return -EINVAL;
> +               /* TODO: relax CAP_SYS_ADMIN once backing files are visib=
le to lsof */
> +               if (!fc->passthrough || !capable(CAP_SYS_ADMIN))
> +                       return -EPERM;
> +
> +               if (inode->i_sb->s_stack_depth >=3D fc->max_stack_depth)
> +                       return -ELOOP;
> +
> +               fb->type =3D FUSE_BACKING_PATH;
> +               fb->path =3D file->f_path;
> +               path_get(&fb->path);
> +               fb->cred =3D get_current_cred();
> +               return 0;
> +
> +       case S_IFCHR:
> +               if (!is_dev)
> +                       return -EINVAL;
> +               daxdev =3D dax_dev_find(inode->i_rdev);
> +               if (!daxdev)
> +                       return -EINVAL;
> +
> +               err =3D -EPERM;
> +               if (capable(CAP_SYS_RAWIO)) {
> +                       err =3D fs_dax_get(daxdev, fb, &fuse_dax_holder_o=
ps);
> +                       if (!err) {
> +                               fb->type =3D FUSE_BACKING_DAXDEV;
> +                               fb->dax_dev =3D daxdev;
> +                       }
> +               }
> +               put_dax(daxdev);
> +               return err;
> +
> +       case S_IFDIR:
> +               if (is_dev)
> +                       return -EINVAL;
> +               return -EISDIR;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
>  int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map=
)
>  {
>         struct file *file;
> -       struct super_block *backing_sb;
> -       struct fuse_backing *fb;
> +       struct fuse_backing *fb =3D kzalloc_obj(struct fuse_backing);
>         bool is_64bit =3D map->flags & FUSE_BACKING_ID_64;
>         int res;
>
> -       pr_debug("%s: fd=3D%d flags=3D0x%x\n", __func__, map->fd, map->fl=
ags);
> +       if (!fb)
> +               return -ENOMEM;
>
> -       /* TODO: relax CAP_SYS_ADMIN once backing files are visible to ls=
of */
> -       res =3D -EPERM;
> -       if (!fc->passthrough || !capable(CAP_SYS_ADMIN))
> -               goto out;
> +       fb->backing_id =3D map->backing_id;
> +       refcount_set(&fb->count, 1);
> +
> +       pr_debug("%s: fd=3D%d flags=3D0x%x\n", __func__, map->fd, map->fl=
ags);
>
>         res =3D -EINVAL;
> -       if (map->flags & ~FUSE_BACKING_ID_64)
> +       if (map->flags & ~(FUSE_BACKING_IS_DEV | FUSE_BACKING_ID_64))
>                 goto out;
>
>         if (!is_64bit && map->backing_id !=3D 0)
> @@ -106,43 +179,21 @@ int fuse_backing_open(struct fuse_conn *fc, struct =
fuse_backing_map *map)
>         if (!file)
>                 goto out;
>
> -       /* read/write/splice/mmap passthrough only relevant for regular f=
iles */
> -       res =3D d_is_dir(file->f_path.dentry) ? -EISDIR : -EINVAL;
> -       if (!d_is_reg(file->f_path.dentry))
> -               goto out_fput;
> -
> -       backing_sb =3D file_inode(file)->i_sb;
> -       res =3D -ELOOP;
> -       if (backing_sb->s_stack_depth >=3D fc->max_stack_depth)
> -               goto out_fput;
> -
> -       fb =3D kmalloc_obj(struct fuse_backing);
> -       res =3D -ENOMEM;
> -       if (!fb)
> -               goto out_fput;
> -
> -       fb->file =3D file;
> -       fb->cred =3D get_current_cred();
> -       fb->backing_id =3D map->backing_id;
> -       refcount_set(&fb->count, 1);
> +       res =3D fuse_backing_open_file(fc, fb, file, map->flags & FUSE_BA=
CKING_IS_DEV);
> +       fput(file);
> +       if (res)
> +               goto out;
>
>         if (is_64bit)
>                 res =3D fuse_backing_add_64(fc, fb);
>         else
>                 res =3D fuse_backing_id_alloc(fc, fb);
> -       if (res < 0) {
> -               fuse_backing_free(fb);
> -               fb =3D NULL;
> -       }
> -
>  out:
> -       pr_debug("%s: fb=3D0x%p, ret=3D%i\n", __func__, fb, res);
> +       pr_debug("%s: ret=3D%i\n", __func__, res);

why remove fb? it is useful to track fb lifetimes.

> +       if (res < 0)
> +               fuse_backing_free(fb);
>
>         return res;
> -
> -out_fput:
> -       fput(file);
> -       goto out;
>  }
>
>  int fuse_backing_close(struct fuse_conn *fc, u64 backing_id, bool is_64b=
it)
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 8643d9a290ac..ea33b8d60473 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -297,7 +297,7 @@ static int fuse_open(struct inode *inode, struct file=
 *file)
>         if (!err) {
>                 if (is_truncate)
>                         truncate_pagecache(inode, 0);
> -               else if (!(ff->open_flags & FOPEN_KEEP_CACHE))
> +               else if (!(ff->open_flags & FOPEN_KEEP_CACHE) && !IS_DAX(=
inode))
>                         invalidate_inode_pages2(inode->i_mapping);
>         }
>  out_unlock:
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index d36459487bee..00c124bcb88d 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -93,10 +93,25 @@ struct fuse_submount_lookup {
>         struct fuse_forget_link *forget;
>  };
>
> +enum fuse_backing_type {
> +       FUSE_BACKING_PATH,
> +       FUSE_BACKING_DAXDEV,
> +};
> +
>  /* Container for data related to mapping to backing file */
>  struct fuse_backing {
> -       struct file *file;
> -       const struct cred *cred;
> +       enum fuse_backing_type type;
> +
> +       union {
> +               struct {
> +                       struct path path;
> +                       const struct cred *cred;
> +               };
> +               struct {
> +                       struct dax_device *dax_dev;
> +                       bool dax_error;
> +               };
> +       };
>         u64 backing_id;
>         struct rhash_head hash_node;
>         /* refcount */
> @@ -1237,7 +1252,14 @@ void fuse_free_conn(struct fuse_conn *fc);
>
>  /* dax.c */
>
> -#define FUSE_IS_VDAX(inode) (IS_ENABLED(CONFIG_FUSE_DAX) && IS_DAX(inode=
))
> +static inline bool FUSE_IS_VDAX(struct inode *inode)
> +{
> +#ifdef CONFIG_FUSE_DAX
> +       return get_fuse_inode(inode)->vdax && IS_DAX(inode);
> +#else
> +       return false;
> +#endif
> +}
>
>  ssize_t fuse_vdax_read_iter(struct kiocb *iocb, struct iov_iter *to);
>  ssize_t fuse_vdax_write_iter(struct kiocb *iocb, struct iov_iter *from);
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index e88daf88f913..e6634a660083 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -148,7 +148,7 @@ static void fuse_evict_inode(struct inode *inode)
>         /* Will write inode on close/munmap and in all other dirtiers */
>         WARN_ON(inode_state_read_once(inode) & I_DIRTY_INODE);
>
> -       if (FUSE_IS_VDAX(inode))
> +       if (IS_DAX(inode))
>                 dax_break_layout_final(inode);
>
>         truncate_inode_pages_final(&inode->i_data);
> @@ -403,6 +403,10 @@ static void fuse_init_submount_lookup(struct fuse_su=
bmount_lookup *sl,
>         refcount_set(&sl->count, 1);
>  }
>
> +static const struct address_space_operations fuse_dax_aops =3D {
> +       .dirty_folio    =3D noop_dirty_folio,
> +};
> +
>  static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
>                             struct fuse_conn *fc)
>  {
> @@ -430,6 +434,11 @@ static void fuse_init_inode(struct inode *inode, str=
uct fuse_attr *attr,
>          */
>         if (!fc->posix_acl)
>                 inode->i_acl =3D inode->i_default_acl =3D ACL_DONT_CACHE;
> +
> +       if ((attr->flags & FUSE_ATTR_DAX) && !fc->vdax) {
> +               inode->i_flags |=3D S_DAX;
> +               inode->i_data.a_ops =3D &fuse_dax_aops;
> +       }
>  }

Do we need some handling in fuse_change_attributes_i?
like vdax gets to make sure FUSE_ATTR_DAX is consistent with
inode init?

Thanks,
Amir.
