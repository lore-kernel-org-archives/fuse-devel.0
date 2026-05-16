Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7848A3D6CB2
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 12:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778935349; cv=pass; b=H8JTzP4T1N56RZXgw7jRHr4YsehcPqV/siSn4oVrT4kciAnLAj9B7+v3iaZtdPjUJ4Su3vmYW9ZoHCeLs/NH69YSRrEzjcyYJFmW9RXTnskVrhDuqcf8wWmRE2IH+YXVs1IRiDJzsxhm/I4qwrHSmKZZbBfwDaDN/ZlhY29xD6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778935349; c=relaxed/simple;
	bh=DoVqmSnzig+mF4Iu7v8RTe1euF8b36mCNmXU+UwE6IA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXgWlPAuzshwvj6UTxL0BEEAxqMOz95C3d0DuQ/8HMuP6JP+39I4jVkycHDjVICGd8nzzrWWty4GW9V25FcgPiqO/IC0Da+QTtM4b11bGeVzmJS8COKGjjrL/8UATwdPkaKUkScY3NJx0mcpCV6cnmBA/dk3PQHlNiCqmCWJjUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkaCaFfl; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkaCaFfl"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67f7caa33easo1728899a12.1
        for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 05:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778935346; cv=none;
        d=google.com; s=arc-20240605;
        b=AtvL9RjF+Dn6UylIVuqVbjD0rSHNn+trh1ojpdC2rL/AmGDo8JrAVnolDGDaSC5Sqi
         S+WKJTvQoCn0cT0PE33WXEqr70CIVb5ojSeih7iITxmnjRRfqD63AL2ZHaHzIALPTmPe
         tt4hje2Bd4Xqw3XKl6FH6VNalFNUlo4/xJUTEKmPxgUFvahE92PQW6wdwMLtoXzXJPsN
         A9sSNxg2eRT5b2Lc3uU5EJCMLsDwuA7awuD9WH9nmlZD7cfE/AW4s5d/GB4gVwIdRzAw
         PST+TMPXT9jWmIinEhrk2+sZAHoyp9Q12rd4cfpOGBRWiQWgMufCIopjBZVNmnyc/goz
         7beQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ijm9DzQecVgUq00g7bJNtsZv7QhfwsyD/t4jMAZ1IlE=;
        fh=q2ZyyvM4Fiw/IcYjY421P38D0S1iz8RMnS41yrfdV6o=;
        b=bWgmwiNTChggxu2BMoPZUXgXo0Rcy6Xeogp8X7avPrppbss/9+n1/c2YBuaC0LGKTf
         sK1RKx7NIgNn40nKAYcN0DCj3vv+PC1k9HODPV79zb9yklo4iJtI5VwnLxDsBZAq3kvA
         s2YAMnf7TRraeokkgpUInSPUwWdakuAYZSnIKFVSLySro7zVDnLN+UPsOl7jmJ7tQBz6
         Y7cK3koa13zfiuGMOMblZyTg7tC1tMnA4tuyOJYbx8eyxO4v4oz0N/H+TB7D65Wyys9C
         sn4iFZXQydIG+Q6V+RBGZsGiGHr+3kH5WpbhtqUfezBNQPMIzShmiFlH+sQpvfxCT23J
         /ldg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778935346; x=1779540146; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijm9DzQecVgUq00g7bJNtsZv7QhfwsyD/t4jMAZ1IlE=;
        b=bkaCaFfljFwvoADhGEKW1Mu17CJH3xcbj9TdFvUTFbYIC6EGXRjxuOdRe3uP6kgWzs
         Z10QhcIXuwQaK324iOBDUWNNGoS2Yhl2GqJm+GDcw7y3SN8zWpNOkvF6Y8Db5NzhvfKA
         QRxOH0rI6JEU5y79g6RnZl5vLbBe0WXdSN9TCmMGIfsL0HG2z7xFAiDvT+0WjGbk9oDa
         NYA/oBy0zCM1XQ8cOiQrZMCKTpkidgCg6tWGbovxMmoIDtfPUXbjNcuBcuj4w3668Uqq
         Ao73OM5qJD0QrgvQrFj+DslLlqLf+30GOIck/Rr9qcJDceA0uzkogciJ6VnLYIVcsIma
         fl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778935346; x=1779540146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ijm9DzQecVgUq00g7bJNtsZv7QhfwsyD/t4jMAZ1IlE=;
        b=Zcsth88pp3p0tCjr6BGcn2Bbx/B/ltK5C1qscZ/jJ7ihcoDWW9wkiKXhZHX+XLqrOM
         UUQaBxoTMq4HmD6W3Cb5mTdk7UINxR9HNRqsYw8sYqAOVi+l3WveuqL8MgkU+AK/Ad89
         PLz6FQGpTT6I09zXbHqrWG38haJ3Nq61LtSqdL1f6iQALChgbOuYm/pI8tKjkzZFKZBn
         BfNhjOTj12C+DmAu5J6Z6wXnDw4+CtERsM1JiFNzk1r44qfM3ZuFgqwLk4gs6NhKltaH
         iwPL0PhBgIoiKbX65sODYpryi29fJy5DzIhg+ePL0i6e2bBT6K0tB/DEhqdLieWEDF4C
         vqNg==
X-Forwarded-Encrypted: i=1; AFNElJ8zC7Z71Fm6wttq0qsU8YXGR9j6TCWz2xhC+7HAMc+PU8hr6B1TNEpDaSnuJoj5ThN8xNtg/SvEoXOy@lists.linux.dev
X-Gm-Message-State: AOJu0Yza0qA+LTjYzZY9XDOvsDP3P2eu2a+9qwltEc2IQsRRBX8jrUd2
	IE/V9lgm6C/U35JxOLEjuTqPKj6wkzBgdsrjyiylyqmcmV7ljNv7EIvOlyZFEwyXWfNZ0okq14W
	/cD4JVhlabFSxk+ywNWl6ZidV2hFZ3Iw=
X-Gm-Gg: Acq92OEMfV62lSsjHSJwQ++KsowlNOndNu2amqf+4hUHu3aXrk/edrLMwleIG2MvauH
	3KWUnvf/jGTyIY7mRV3O2QyUrEBiB1lYTuv7ijWeo60kGFKcWelj+RL3/1ZpPq8e3w3JfNlprjS
	PGnPyorA+gkGYfz8N21ytV4NrDObQzZdmdi7tbPy/vmGuYV7IhR6Xb1zaVaOchECweV7sIR00UG
	Taxu2RzAjzIlXQETFPwZIy4EDb6oIEf+UtnufMvzPEqXNBztiuHtpJMdmh5GrNK3uScNE0e3ZAS
	PS4wWEAZfWwLr52Fu8GKlLYrki+2OGsLuXLVjZ57mAUBr/KJDgD/
X-Received: by 2002:a05:6402:40c3:b0:66a:19bd:5cb8 with SMTP id
 4fb4d7f45d1cf-683bd18c6cfmr4142776a12.18.1778935345613; Sat, 16 May 2026
 05:42:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com> <20260516004004.1455526-7-joannelkoong@gmail.com>
In-Reply-To: <20260516004004.1455526-7-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 16 May 2026 14:42:13 +0200
X-Gm-Features: AVHnY4K8MkJE8S7FU4exjd8c6uDm4uV3VpsAJm9LPD3MgDp2jIPzDcgjpbp_yi0
Message-ID: <CAOQ4uxjCAJSYLnqo67zNeAyj-+YK3A1Odix98nuu2QX+-v-FbA@mail.gmail.com>
Subject: Re: [PATCH v2 06/21] fuse: implement passthrough for getattr/statx
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 2:52=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> From: Amir Goldstein <amir73il@gmail.com>
>
> Call vfs_getattr() on backing inode to respond to a user statx(2)
> request and update the fuse inode attributes with the response.
>
> For now, we assume that calling vfs_getattr() on backing inode is cheap,
> so we never use cached attributed and always update fuse inode
> attributes from backing attributes in fuse_permission() and
> fuse_update_attributes().
>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>

I think you've corrected enough of my flop in this patch to justify
Signed-of-by, but as you wish :)

Thanks,
Amir.

> ---
>  fs/fuse/dir.c             | 32 ++++++++++++++++++++++++++++++++
>  fs/fuse/fuse_i.h          |  8 +++++++-
>  fs/fuse/passthrough.c     | 36 ++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/fuse.h |  1 +
>  4 files changed, 76 insertions(+), 1 deletion(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 05f69b8fa4c4..9a8e525f4d2b 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -1414,6 +1414,28 @@ static void fuse_statx_to_attr(struct fuse_statx *=
sx, struct fuse_attr *attr)
>         attr->blksize =3D sx->blksize;
>  }
>
> +void fuse_kstat_to_attr(struct fuse_conn *fc, const struct kstat *stat,
> +                       struct fuse_attr *attr)
> +{
> +       memset(attr, 0, sizeof(*attr));
> +
> +       attr->ino =3D stat->ino;
> +       attr->size =3D stat->size;
> +       attr->blocks =3D stat->blocks;
> +       attr->atime =3D stat->atime.tv_sec;
> +       attr->mtime =3D stat->mtime.tv_sec;
> +       attr->ctime =3D stat->ctime.tv_sec;
> +       attr->atimensec =3D stat->atime.tv_nsec;
> +       attr->mtimensec =3D stat->mtime.tv_nsec;
> +       attr->ctimensec =3D stat->ctime.tv_nsec;
> +       attr->mode =3D stat->mode;
> +       attr->nlink =3D stat->nlink;
> +       attr->uid =3D from_kuid(fc->user_ns, stat->uid);
> +       attr->gid =3D from_kgid(fc->user_ns, stat->gid);
> +       attr->rdev =3D new_encode_dev(MKDEV(MAJOR(stat->rdev), MINOR(stat=
->rdev)));
> +       attr->blksize =3D stat->blksize;
> +}
> +
>  static int fuse_do_statx(struct mnt_idmap *idmap, struct inode *inode,
>                          struct file *file, struct kstat *stat)
>  {
> @@ -1539,6 +1561,12 @@ static int fuse_update_get_attr(struct mnt_idmap *=
idmap, struct inode *inode,
>         if (fc->no_statx)
>                 request_mask &=3D STATX_BASIC_STATS;
>
> +       if (fuse_passthrough_op(inode, FUSE_GETATTR)) {
> +               forget_all_cached_acls(inode);
> +               return fuse_passthrough_getattr(inode, stat, request_mask=
,
> +                                               flags);
> +       }
> +
>         if (!request_mask)
>                 sync =3D false;
>         else if (flags & AT_STATX_FORCE_SYNC)
> @@ -1737,6 +1765,10 @@ static int fuse_perm_getattr(struct inode *inode, =
int mask)
>                 return -ECHILD;
>
>         forget_all_cached_acls(inode);
> +       if (fuse_passthrough_op(inode, FUSE_GETATTR))
> +               return fuse_passthrough_getattr(inode, NULL,
> +                                               STATX_BASIC_STATS, 0);
> +
>         return fuse_do_getattr(&nop_mnt_idmap, inode, NULL, NULL);
>  }
>
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 502b3b3f7e89..389e28497dc7 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -991,6 +991,8 @@ void fuse_init_symlink(struct inode *inode);
>  /*
>   * Change attributes of an inode
>   */
> +void fuse_kstat_to_attr(struct fuse_conn *fc, const struct kstat *stat,
> +                       struct fuse_attr *attr);
>  void fuse_change_attributes(struct inode *inode, struct fuse_attr *attr,
>                             struct fuse_statx *sx,
>                             u64 attr_valid, u64 attr_version);
> @@ -1274,7 +1276,8 @@ void fuse_file_release(struct inode *inode, struct =
fuse_file *ff,
>         (FUSE_PASSTHROUGH_RW_OPS | FUSE_PASSTHROUGH_OP_READDIR)
>
>  /* Inode passthrough operations for backing file attached to inode */
> -#define FUSE_PASSTHROUGH_INODE_OPS (0)
> +#define FUSE_PASSTHROUGH_INODE_OPS \
> +       (FUSE_PASSTHROUGH_OP_GETATTR)
>
>  #define FUSE_BACKING_MAP_OP(map, op) \
>         ((map)->ops_mask & FUSE_PASSTHROUGH_OP(op))
> @@ -1358,6 +1361,9 @@ static inline bool fuse_passthrough_op(struct inode=
 *inode, enum fuse_opcode op)
>         return fb && fb->ops_mask & FUSE_PASSTHROUGH_OP(op);
>  }
>
> +int fuse_passthrough_getattr(struct inode *inode, struct kstat *stat,
> +                            u32 request_mask, unsigned int flags);
> +
>  #ifdef CONFIG_SYSCTL
>  extern int fuse_sysctl_register(void);
>  extern void fuse_sysctl_unregister(void);
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index a1d87ed51a94..7de038960b2f 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -219,3 +219,39 @@ void fuse_passthrough_release(struct fuse_file *ff, =
struct fuse_backing *fb)
>         put_cred(ff->cred);
>         ff->cred =3D NULL;
>  }
> +
> +/*
> + * Inode passthrough operations for backing file attached on lookup.
> + */
> +int fuse_passthrough_getattr(struct inode *inode, struct kstat *stat,
> +                            u32 request_mask, unsigned int flags)
> +{
> +       struct fuse_conn *fc =3D get_fuse_conn(inode);
> +       struct fuse_inode *fi =3D get_fuse_inode(inode);
> +       struct fuse_backing *fb =3D fuse_inode_backing(fi);
> +       u64 attr_version =3D fuse_get_attr_version(fc);
> +       const struct path *fb_path =3D &fb->file->f_path;
> +       const struct cred *old_cred;
> +       struct kstat backing_stat;
> +       struct fuse_attr attr;
> +       int err;
> +
> +       if (!stat)
> +               stat =3D &backing_stat;
> +
> +       old_cred =3D override_creds(fb->cred);
> +       err =3D vfs_getattr(fb_path, stat, request_mask, flags);
> +       revert_creds(old_cred);
> +       if (err)
> +               return err;
> +
> +       /* Always override st_dev and st_ino with FUSE dev and ino */
> +       stat->dev =3D inode->i_sb->s_dev;
> +       stat->ino =3D inode->i_ino;
> +
> +       /* Fill fuse inode attrs from backing inode stat */
> +       fuse_kstat_to_attr(fc, stat, &attr);
> +       fuse_change_attributes(inode, &attr, NULL, 0, attr_version);
> +
> +       return 0;
> +}
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index df366e390f0c..6404ed95c758 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -1143,6 +1143,7 @@ struct fuse_backing_map {
>  #define FUSE_PASSTHROUGH_OP_READ       FUSE_PASSTHROUGH_OP(FUSE_READ)
>  #define FUSE_PASSTHROUGH_OP_WRITE      FUSE_PASSTHROUGH_OP(FUSE_WRITE)
>  #define FUSE_PASSTHROUGH_OP_READDIR    FUSE_PASSTHROUGH_OP(FUSE_READDIR)
> +#define FUSE_PASSTHROUGH_OP_GETATTR    FUSE_PASSTHROUGH_OP(FUSE_GETATTR)
>
>  /* Device ioctls: */
>  #define FUSE_DEV_IOC_MAGIC             229
> --
> 2.52.0
>
