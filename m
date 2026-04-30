Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0F040FDA1
	for <fuse-devel@lists.linux.dev>; Thu, 30 Apr 2026 13:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777556927; cv=pass; b=M4BGVUtwDfgNzh8GH9G+IVoydEFBzTGbqlIS9hzrcB+uAFdMY2+IiIQxbmx4HHZeGOvFlhpHrOxoDLCIVFsDwBEzJLR78LvRNtk46CvuGmYcGf43gqr/jm/s4NT28grMuKae5zM8LCRsaBGpAZy2aeiHcZ+7GLQnIZkOa5CbEQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777556927; c=relaxed/simple;
	bh=awoGZxf2q3nDKXFPFxE9tpePPmL8Dty+XBwhKFFJwI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7zknpJTzrkTAN2nnq1lxiw59msHJQX1VZ+LUSJlUpMbui3RbayayuWvVBTsve7/cH1SDdQOdOnAzL2NGScseUi9ihir/ggzun04tMdJcOOHtonlEAUk+HCMtHF6J9qAI1sytcm5G2+zXHbtdPVLyfwPAmrPn1qZdo57r4105LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beUC8V1W; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beUC8V1W"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cf7683a28so655482f8f.2
        for <fuse-devel@lists.linux.dev>; Thu, 30 Apr 2026 06:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777556924; cv=none;
        d=google.com; s=arc-20240605;
        b=laFl1WYcCyKCU6LO0CkXjHAMzvEH/8QabytKtXqK33/asfk/l08K4DMMbIaDWY6m9M
         KzJKyo1wC8GTGxBbLQKN3dVNIuJanemZ4NC7fC3ngm1HjPwhHMa7WtwFcs1U/POU6sMa
         BWAn4HhQLIV7vMD205NgBQtJcpwWlpFfs83zpgh7UpyglNrOWU2CyDpbtaO+qP5DZ1dz
         0jdxmvqbIrLv2FmuE5DdSRSHllrcVtUw2HOIL0PtDhx+TADhahRalZ4wfzHqC3B4DJKt
         kwOOSgBy7otSyPpRmDAZd5Ey3t2hkU4EmQYrIA0ueiIASOWJ7bIgwO4f0tMlaki0D+U9
         C1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vDQMX39ARER7sr8oPR+B6TmAFYNGVE2TnJKAY5kjymE=;
        fh=GBbpv8JybqJLqhC5WxftSFGILmlWpkWdZmoj4HLU3PY=;
        b=WL8NOq5qhmZlsO2eJZ6JnOq/wJUmNrFiEVsqT51De3rLzDpL7wmtbm2LHj9RJyMrzZ
         GWuGSshN6gdX11sDNmPivmD2xahZENgBHSu0hkIChQA9Gj9H/tkBpI8NnKSYQmCz/L+Z
         2F2S6upvU7SA98RzmPSdAiTk0ofSPfTLKZvmUY59b0tdA5RON8CkSuRj3mSfyewKjyyV
         LLSCREFqnud82sO9GEjSOeEu6PPOGXEHgFKPhwVK6do3c+D4XmLznxrGRcXb6GnEJTR+
         tcQqKZj/TcPkcEwLIfI4Nk2n6QukPFZ7Ad6Xq2LC20LrZlv7pgvV7fuKiXLUNNBrRc3M
         6oNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777556924; x=1778161724; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDQMX39ARER7sr8oPR+B6TmAFYNGVE2TnJKAY5kjymE=;
        b=beUC8V1WAdhkeCinGae7KZDkT3Lc9oetKHeljq3N+oNgt5MdMEG/Hy+YXnQOoaNC8I
         ua4RcQmzmN62E8VRTUng91ZrDgcGxYjak9MJpWmJlmoaY27PW+pUfF1Dfbw1f0snLoIq
         bj6rgl2/wLg0AR8GdQTQViwJRJR1AcDnRt14TcB9WdG0GXleo/7yyb7P9jlSXJikkTI6
         4lSaUNW9owX6FMbrnmQeDIVxtz9ngrpQo7W1LtSaQHSBy92Ec27rifj54ok+uOoausLW
         QLnPv4sRODqY3sjjz+bNbCLZ+vgtgm/9gRFcwj8b2X3HidtXKyUK1eur8un2oMf9wB+l
         cMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777556924; x=1778161724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vDQMX39ARER7sr8oPR+B6TmAFYNGVE2TnJKAY5kjymE=;
        b=aVeqrbnhr4ueUZczeOmyC0gRncGOYEufikonolbUMMCvq6XT3hn1FMWtCq8oFEubU4
         4BsmR3J/SebrglK5fcGZyiXgdxundnV8zhOnYoSqnPhCE6H6GG1RfHOSTYaYsEVcCB6q
         z2Zm0pzvgK56KeX7eKUzEnRZ6SnfQ4zG+IeBBoL0bcmJAKf6giXdmneeJvpvgcZSwpMS
         rfSytmMDjEfR0fvKJa20jZNoAjppamvV9VeCVXu3PkGcSgGfUSnHHfoEetq1yEX2vJuG
         T3CSpiPF6Ud3O+ZbQoEL7Yll1FHmzyqr/0j3Flu3/gdvLC5DIskqBjIeolzBYyNHB2yV
         MGeA==
X-Forwarded-Encrypted: i=1; AFNElJ+pBrEefko4va4nkYSywx4mMQud4w/62dSCOOlk0vqmNKUvPVksxRrkoWtw7iWyiIDNocURamdfhP7K@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+Dswl5xU40kYMWMr/G2GDIyUYKsX3RfAY6y7FCPI0fDDayLGW
	zWWZTO7NTKppUvC1qXQCg66SDmCRXzIP33ULx4EAnN/UsCrbn3lGO7rppy9hKlO1ycdqasfX4OH
	q1t7l79jOkHpmeyj47oyuTVcXiRMQG24=
X-Gm-Gg: AeBDiet3DF7omoGQhZ1g1tTeDvafd9G61rLJ7s2vaOIbP9iemGWGZQVKDNBXLgfur1z
	v5L5xQL4K0QxHj+RMLrfMbmEnmpdhozUVWk2rSVt3mdvlcJ28KqJITY96mVxkA8tE46pnEfX53/
	6j0vQkZwpLryW6Vdwugmg2p5YH5oAVqGvGUCyKzouNCY31OoVMUnb8qQwDfnhwBNV2PCX7U2vCs
	QTY6iLYQTDi7tG7XN5qSO7zoW747VGx5ggpZxFzrPAVWgyNosvRmlHNfyTmvwrl1uvt6HvNWM0R
	UUnOxm8z9eg2QRyP1uEMqtv9qkTQ/1OZwQ==
X-Received: by 2002:a5d:5f56:0:b0:43e:a69b:d810 with SMTP id
 ffacd0b85a97d-4493f42d8acmr4932087f8f.38.1777556924354; Thu, 30 Apr 2026
 06:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177747203969.4101397.1905820467457875817.stgit@frogsfrogsfrogs> <177747204051.4101397.16466232272715875212.stgit@frogsfrogsfrogs>
In-Reply-To: <177747204051.4101397.16466232272715875212.stgit@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 30 Apr 2026 14:48:29 +0100
X-Gm-Features: AVHnY4LuvqdirL71TOiHeNzEGws525X31LZFSgOdKMvBLmbLHgxA4PpQ0acvD3I
Message-ID: <CAJnrk1bYYBf2qYBvhv=MFKvG-2VekKwHCuRS6tjva=tExw6Gdw@mail.gmail.com>
Subject: Re: [PATCH 3/4] fuse: update file mode when updating acls
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, neal@gompa.dev, linux-fsdevel@vger.kernel.org, 
	bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 3:22=E2=80=AFPM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> From: Darrick J. Wong <djwong@kernel.org>
>
> If someone sets ACLs on a file that can be expressed fully as Unix DAC
> mode bits, most local filesystems will then update the mode bits and
> drop the ACL xattr to reduce inefficiency in the file access paths.
> Let's do that too.  Note that means that we can setacl and end up with
> no ACL xattrs, so we also need to tolerate ENODATA returns from
> fuse_removexattr.
>
> Note that here we define a "local" fuse filesystem as one that uses
> fuseblk mode; we'll shortly add fuse servers that use iomap for the file
> IO path to that list.
>
> Signed-off-by: "Darrick J. Wong" <djwong@kernel.org>
> ---
>  fs/fuse/fuse_i.h |    2 +-
>  fs/fuse/acl.c    |   56 +++++++++++++++++++++++++++++++++++++++++++++++-=
------
>  2 files changed, 50 insertions(+), 8 deletions(-)
>
>
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 4c135a7edf54ac..0bcfb42592895c 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1050,7 +1050,7 @@ static inline struct fuse_mount *get_fuse_mount(str=
uct inode *inode)
>         return get_fuse_mount_super(inode->i_sb);
>  }
>
> -static inline struct fuse_conn *get_fuse_conn(struct inode *inode)
> +static inline struct fuse_conn *get_fuse_conn(const struct inode *inode)
>  {
>         return get_fuse_mount_super(inode->i_sb)->fc;
>  }
> diff --git a/fs/fuse/acl.c b/fs/fuse/acl.c
> index cbde6ac1add35a..bee8a9a734f50a 100644
> --- a/fs/fuse/acl.c
> +++ b/fs/fuse/acl.c
> @@ -11,6 +11,18 @@
>  #include <linux/posix_acl.h>
>  #include <linux/posix_acl_xattr.h>
>
> +/*
> + * If this fuse server behaves like a local filesystem, we can implement=
 the
> + * kernel's optimizations for ACLs for local filesystems instead of pass=
ing
> + * the ACL requests straight through to another server.

nit: "to the server" instead of "to another server"? another server
sounds like there's 2 servers

> + */
> +static inline bool fuse_inode_has_local_acls(const struct inode *inode)
> +{
> +       const struct fuse_conn *fc =3D get_fuse_conn(inode);
> +
> +       return fc->posix_acl && fuse_inode_is_exclusive(inode);
> +}
> +
>  static struct posix_acl *__fuse_get_acl(struct fuse_conn *fc,
>                                         struct inode *inode, int type, bo=
ol rcu)
>  {
> @@ -98,6 +110,8 @@ int fuse_set_acl(struct mnt_idmap *idmap, struct dentr=
y *dentry,
>         struct inode *inode =3D d_inode(dentry);
>         struct fuse_conn *fc =3D get_fuse_conn(inode);
>         const char *name;
> +       umode_t mode =3D inode->i_mode;
> +       const bool local_acls =3D fuse_inode_has_local_acls(inode);
>         int ret;
>
>         if (fuse_is_bad(inode))
> @@ -113,14 +127,25 @@ int fuse_set_acl(struct mnt_idmap *idmap, struct de=
ntry *dentry,
>         else
>                 return -EINVAL;
>
> +       /*
> +        * If the ACL can be represented entirely with changes to the mod=
e
> +        * bits, then most filesystems will update the mode bits and dele=
te
> +        * the ACL xattr.
> +        */
> +       if (acl && type =3D=3D ACL_TYPE_ACCESS && local_acls) {
> +               ret =3D posix_acl_update_mode(idmap, inode, &mode, &acl);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         if (acl) {
>                 unsigned int extra_flags =3D 0;
>                 /*
> -                * Fuse userspace is responsible for updating access
> -                * permissions in the inode, if needed. fuse_setxattr
> -                * invalidates the inode attributes, which will force
> -                * them to be refreshed the next time they are used,
> -                * and it also updates i_ctime.
> +                * For non-local filesystems, fuse userspace is responsib=
le for
> +                * updating access permissions in the inode, if needed.
> +                * fuse_setxattr invalidates the inode attributes, which =
will
> +                * force them to be refreshed the next time they are used=
, and
> +                * it also updates i_ctime.
>                  */
>                 size_t size;
>                 void *value;
> @@ -137,9 +162,10 @@ int fuse_set_acl(struct mnt_idmap *idmap, struct den=
try *dentry,
>                 /*
>                  * Fuse daemons without FUSE_POSIX_ACL never changed the =
passed
>                  * through POSIX ACLs. Such daemons don't expect setgid b=
its to
> -                * be stripped.
> +                * be stripped, unless they've explicitly told the kernel=
 to
> +                * take care of that.

nit: imo this would be clearer as its own sentence, eg "For local
filesystems, the kernel already handled sgid stripping in
posix_acl_update_mode() above".

>                  */
> -               if (fc->posix_acl &&
> +               if (fc->posix_acl && !local_acls &&
>                     !in_group_or_capable(idmap, inode,
>                                          i_gid_into_vfsgid(idmap, inode))=
)
>                         extra_flags |=3D FUSE_SETXATTR_ACL_KILL_SGID;
> @@ -148,6 +174,22 @@ int fuse_set_acl(struct mnt_idmap *idmap, struct den=
try *dentry,
>                 kfree(value);
>         } else {
>                 ret =3D fuse_removexattr(inode, name);
> +               /* If the acl didn't exist to start with that's fine. */
> +               if (ret =3D=3D -ENODATA)
> +                       ret =3D 0;
> +       }
> +
> +       /* If we scheduled a mode update above, push that to userspace no=
w. */
> +       if (!ret) {
> +               struct iattr attr =3D { };
> +
> +               if (mode !=3D inode->i_mode) {
> +                       attr.ia_valid |=3D ATTR_MODE;
> +                       attr.ia_mode =3D mode;
> +               }
> +
> +               if (attr.ia_valid)
> +                       ret =3D fuse_do_setattr(idmap, dentry, &attr, NUL=
L);

maybe something like this is clearer?

    if (!ret && mode !=3D inode->i_mode) {
         struct iattr attr =3D {
                .ia_valid |=3D ATTR_MODE,
                .ia_mode =3D mode,
          };
         ret =3D fuse_do_setattr(idmap, dentry, &attr, NULL);
    }

Overall, this lgtm though.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

Thanks,
Joanne

>         }
>
>         if (fc->posix_acl) {
>
