Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC1F26CE2C
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 22:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778971657; cv=pass; b=DcC1JIHKIIcyi4z95ojCGUfGTA53SLs1bfCmazedvYl+HsslN6/5+qRTkLIhDpGa5W8sZIvLJpZG/mtBYFp7Djt4o9rf2rtLkJMFfPQC5jVJUAh7qUEIvz016IbJXdmFlihQXkryQDjB9OmrKos4ojdUCJYH0HiLcggUXj0NlJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778971657; c=relaxed/simple;
	bh=h8x3DiuiZ/bmr2OA5sky9W9rComCiihL3hpgIK0F9Ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnKWzyHPV8t6GzdHmjlOdTgkjIVP2aI15yNfMXBkmoZrU32w3DaPRENTpg+8jWM8pGsBlraIHAr0oRAZRJ4S+cXLCSEcik84BI5qyEpZTf6BlQg2u480xYxWGWUpGxqYoAwe3UndsFsnP15970ca3QGAcz3G6Yk6fajFvPNSABQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaQmkkBg; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaQmkkBg"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bcb5370bb0dso277071866b.1
        for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 15:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778971654; cv=none;
        d=google.com; s=arc-20240605;
        b=SYde3UQ46nrSJWNRryalumH+AwkY28m9dIitXuKNgDq1MwdxsWAZr0ihhCwiC8690O
         iYhGTmGSQPvgm8EWyDDXyX0YMfRoICcLu0zgs0lmqcXbsEkHiL9DdbdjtuX93I39+J2c
         F0NIDdsPRS9qDmOuh1NU+tE/ijElw/gBsou9w4DVNCUFX55rfDvNMJKokkr0AgEdh1nn
         lxekDoGrbFl7meWOJXYW5sw1n0df59Q5sH7C2S/XcIrj4WD5VRgZw24Yk1Nk1F5wACgI
         YPT6YA5Beow3AIr7CGEwbIoi6cssx8rXL0BbNrvY4SeTbqW+1Z//YSMMZYGDrEcGq2BL
         lk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0voABfhB90nxgqUrLvSddU9akrS4n7YFxWZiophb6Bg=;
        fh=oHljJBJ+R3hQCTkVmv8fKngvpPqjUQlQ0iMbW1gVTA0=;
        b=gIc2xQOo7+dLvOLb5S/3ZlmC4TlIBqxJKHQGb2xTthBIGWoRuKgPpBQrG8wfUccIuJ
         qlT/BeklHa/5zANdKW9QKl3KMytkq+ipxuhNwCO+7mM0ELHwnQARQitr2u3xquggl2go
         Cktia3nZ6HW3/lK3JMK13UlfuB9vEbp5nbAIvpOJ8I/cq5JOcZUfeXnjPyLwPijxMw5A
         VQQ8hjFhgKQUwMBAzkC7wwlTL9f+bB90TWwdniV9XCNHlhDtvtyyFW8wny2zqQybKIWp
         TNONBAxzoyNu92f66yLxaydKhPUcxGKgIAdztzekiwwZTzrVtDtX783p/KeO/hxXQuid
         /DAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778971654; x=1779576454; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0voABfhB90nxgqUrLvSddU9akrS4n7YFxWZiophb6Bg=;
        b=JaQmkkBgO4tdYDQYX0Hf9lhnrH9XCp4STOPsRwmNGbLQjoiemsiTi8uAEi94HZa3mC
         1y5LmBNJo2kd19cJp/M2SIfBo+NmaaASfBvM+109XvdNGEuUbj2+hkZWGNMv7YtX4HOY
         XJycB9GvEQp3D+Rph1M0kS7qFnKzJ+dHHJf1bZdtsBeDZrtsM+4xqZoJfLnltqTN1I+S
         UBxFWE/lqVKDJZN1oPbaGYQxPgUV2Uy0emJRVc3orG0JPO4sRKSspga+l/0+BkMXm1Kn
         9mLBQcxOqa00HFnMuwBOoAGIDM8xmUVSZYNYw2kni4qn1ZtbjJzt/JotOII8NsI/bRm5
         LtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778971654; x=1779576454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0voABfhB90nxgqUrLvSddU9akrS4n7YFxWZiophb6Bg=;
        b=WeCPPnF3IlOy8menauphIfxXuj1AC1YsBoooR+FzRDBBp6heNGx9eyg3VuwPwJMrOA
         pqPOZ9e/JHtCihLWi6MCiUqydpnAVCWkyws0xc3fMHWFb3xgEzoqjrQCorE+xyuW+lvW
         C/jjlAqVMot6drGt8MutHHFrh7KiKrjOBq1CSaVnPIRvg+5AovWK4wt8FLyma088iZhl
         6hMxYbBoMMd8Gi8UQIdZUeu+mKF6tLbcuKYti/jwD0DgcVsILUPm0mFAapxhYS4L466L
         wX9IM2Q4olZzPgcNAZkB7EQjNs8iiMjjYV6SWfmI/lV36qoYGdHniWh9KWtcmi109ocC
         qHIw==
X-Forwarded-Encrypted: i=1; AFNElJ/qjGTxuCP+kP4wkby1p77JjkZFrB4XLdMr2rWDxLc3W41XZ/IhuswD3r1tPl8Xj6vLhSOMneNHHp/W@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0dECsKL7JqfH2PyW3FTYWf32VXvjgdwUzRS08zFE47U0IxeN1
	utpxqDEjsBZWJ5nMASM3aNPUtDpq8cVQHrXhxgAO2ru7vWdFfACe1mV72nmH0lW3glbqg5nTrhO
	j/uGHN1jKUUu+y6dlNbiB+EuU3J6dHmVg9bR3hbQ=
X-Gm-Gg: Acq92OH36hehD5PQVswUGYVJubFfQoF3gezPapt7QHtiV5M4F9a9CfhpT4gXWRYzShT
	fpa6XhIOonrDY2bZhqAjKwZwlVyiBhNvDNFHzjU6hJOYhh7jnQgIAkuHQBf5GIvqPxPdRt3enzH
	tQYBUEfimpcfttGQzF+j45iCam3tReNw6ta8vDkeuA7ygCi8pNSqLtavo9/Vc9X6fvL/bbW+Zxn
	X3dwQ/BWMurecfWwf5o+pkWxOojELHWnCMKt0BKNkTkphGV1PtZ2CtNBR6n748BKuDKq/7SUQlR
	qQdlrmBofQrQZSoof9wjGG4BlK8uRH6i/ARLvCjxUw==
X-Received: by 2002:a17:907:86a2:b0:ba0:d58b:6045 with SMTP id
 a640c23a62f3a-bd51797a648mr576232166b.27.1778971653962; Sat, 16 May 2026
 15:47:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com> <20260516004004.1455526-19-joannelkoong@gmail.com>
In-Reply-To: <20260516004004.1455526-19-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 17 May 2026 00:47:22 +0200
X-Gm-Features: AVHnY4IeY4HZlkYS_Ymc2MPhTLDhL3LQN-9CGXPwza26pRWEv2NOhis8BuWLtzg
Message-ID: <CAOQ4uxjzPRQTNqasMrNELKOpvSBmuFGxmfygQbx5osuCwWVjdA@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] backing-inode: add backing_inode_setattr()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 2:53=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> Move logic in ovl_setattr() to a generic backing_inode_setattr() function
> in fs/backing-inode.c, which other filesystems that use backing inodes
> (eg fuse passthrough) will use.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Wow this code brings back memories that I tried hard to forget :)
I hope that fuse passthrough can reap the benefits of all the bugs
and fixes in ovl_setattr()...

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/backing-inode.c            | 54 ++++++++++++++++++++++++++++
>  fs/overlayfs/inode.c          | 66 ++++++++++-------------------------
>  include/linux/backing-inode.h |  4 +++
>  3 files changed, 76 insertions(+), 48 deletions(-)
>
> diff --git a/fs/backing-inode.c b/fs/backing-inode.c
> index 474770a1fa9d..e72f278789d8 100644
> --- a/fs/backing-inode.c
> +++ b/fs/backing-inode.c
> @@ -41,3 +41,57 @@ void backing_inode_copyattr(struct inode *inode,
>  }
>  EXPORT_SYMBOL_GPL(backing_inode_copyattr);
>
> +int backing_inode_setattr(struct dentry *dentry,
> +                         const struct path *backing_path,
> +                         struct iattr *attr, const struct cred *cred)
> +{
> +       struct dentry *backing_dentry =3D backing_path->dentry;
> +       struct inode *winode =3D NULL;
> +       int err;
> +
> +       if (attr->ia_valid & ATTR_SIZE) {
> +               winode =3D d_inode(backing_dentry);
> +               err =3D get_write_access(winode);
> +               if (err)
> +                       return err;
> +       }
> +
> +       /*
> +        * Clear ATTR_MODE to avoid BUG_ON in notify_change(), which does=
 not
> +        * allow ATTR_MODE together with ATTR_KILL_SUID/SGID (the first
> +        * notify_change() converted ATTR_KILL_SUID/SGID into ATTR_MODE u=
sing
> +        * @dentry's inode mode).
> +        *
> +        * This also ensures notify_change() recomputes the mode from the
> +        * backing inode's current mode, instead of a potentially stale v=
alue
> +        * from @dentry's inode.
> +        */
> +       if (attr->ia_valid & (ATTR_KILL_SUID|ATTR_KILL_SGID))
> +               attr->ia_valid &=3D ~ATTR_MODE;
> +
> +       /*
> +        * The filesystem's file is not meaningful to the backing filesys=
tem.
> +        * Clear ATTR_FILE so the backing filesystem does not try to use =
it.
> +        */
> +       attr->ia_valid &=3D ~ATTR_FILE;
> +
> +       err =3D mnt_want_write(backing_path->mnt);
> +       if (err)
> +               goto out_put_write;
> +
> +       inode_lock(backing_dentry->d_inode);
> +       scoped_with_creds(cred)
> +               err =3D notify_change(mnt_idmap(backing_path->mnt),
> +                                   backing_dentry, attr, NULL);
> +       if (!err)
> +               backing_inode_copyattr(dentry->d_inode, backing_path);
> +       inode_unlock(backing_dentry->d_inode);
> +       mnt_drop_write(backing_path->mnt);
> +
> +out_put_write:
> +       if (winode)
> +               put_write_access(winode);
> +
> +       return err;
> +}
> +EXPORT_SYMBOL_GPL(backing_inode_setattr);
> diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
> index 00c69707bda9..f1cd67e6e9c8 100644
> --- a/fs/overlayfs/inode.c
> +++ b/fs/overlayfs/inode.c
> @@ -15,16 +15,17 @@
>  #include <linux/namei.h>
>  #include <linux/posix_acl.h>
>  #include <linux/posix_acl_xattr.h>
> +#include <linux/backing-inode.h>
>  #include "overlayfs.h"
>
>
>  int ovl_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>                 struct iattr *attr)
>  {
> +       struct path backing_path;
>         int err;
>         struct ovl_fs *ofs =3D OVL_FS(dentry->d_sb);
>         bool full_copy_up =3D false;
> -       struct dentry *upperdentry;
>
>         err =3D setattr_prepare(&nop_mnt_idmap, dentry, attr);
>         if (err)
> @@ -39,57 +40,26 @@ int ovl_setattr(struct mnt_idmap *idmap, struct dentr=
y *dentry,
>                 err =3D ovl_copy_up(dentry);
>         else
>                 err =3D ovl_copy_up_with_data(dentry);
> -       if (!err) {
> -               struct inode *winode =3D NULL;
> -
> -               upperdentry =3D ovl_dentry_upper(dentry);
> -
> -               if (attr->ia_valid & ATTR_SIZE) {
> -                       winode =3D d_inode(upperdentry);
> -                       err =3D get_write_access(winode);
> -                       if (err)
> -                               goto out;
> -               }
> -
> -               if (attr->ia_valid & (ATTR_KILL_SUID|ATTR_KILL_SGID))
> -                       attr->ia_valid &=3D ~ATTR_MODE;
>
> -               /*
> -                * We might have to translate ovl file into real file obj=
ect
> -                * once use cases emerge.  For now, simply don't let unde=
rlying
> -                * filesystem rely on attr->ia_file
> -                */
> -               attr->ia_valid &=3D ~ATTR_FILE;
> -
> -               /*
> -                * If open(O_TRUNC) is done, VFS calls ->setattr with ATT=
R_OPEN
> -                * set.  Overlayfs does not pass O_TRUNC flag to underlyi=
ng
> -                * filesystem during open -> do not pass ATTR_OPEN.  This
> -                * disables optimization in fuse which assumes open(O_TRU=
NC)
> -                * already set file size to 0.  But we never passed O_TRU=
NC to
> -                * fuse.  So by clearing ATTR_OPEN, fuse will be forced t=
o send
> -                * setattr request to server.
> -                */
> -               attr->ia_valid &=3D ~ATTR_OPEN;
> +       if (err)
> +               return err;
>
> -               err =3D ovl_want_write(dentry);
> -               if (err)
> -                       goto out_put_write;
> +       /*
> +        * If open(O_TRUNC) is done, VFS calls ->setattr with ATTR_OPEN
> +        * set.  Overlayfs does not pass O_TRUNC flag to underlying
> +        * filesystem during open -> do not pass ATTR_OPEN.  This
> +        * disables optimization in fuse which assumes open(O_TRUNC)
> +        * already set file size to 0.  But we never passed O_TRUNC to
> +        * fuse.  So by clearing ATTR_OPEN, fuse will be forced to send
> +        * setattr request to server.
> +        */
> +       attr->ia_valid &=3D ~ATTR_OPEN;
>
> -               inode_lock(upperdentry->d_inode);
> -               with_ovl_creds(dentry->d_sb)
> -                       err =3D ovl_do_notify_change(ofs, upperdentry, at=
tr);
> -               if (!err)
> -                       ovl_copyattr(dentry->d_inode);
> -               inode_unlock(upperdentry->d_inode);
> -               ovl_drop_write(dentry);
> +       backing_path.dentry =3D ovl_dentry_upper(dentry);
> +       backing_path.mnt =3D ovl_upper_mnt(ofs);
>
> -out_put_write:
> -               if (winode)
> -                       put_write_access(winode);
> -       }
> -out:
> -       return err;
> +       return backing_inode_setattr(dentry, &backing_path, attr,
> +                                    ovl_creds(dentry->d_sb));
>  }
>
>  static void ovl_map_dev_ino(struct dentry *dentry, struct kstat *stat, i=
nt fsid)
> diff --git a/include/linux/backing-inode.h b/include/linux/backing-inode.=
h
> index 6b43cba9fabd..fd02c87e0f99 100644
> --- a/include/linux/backing-inode.h
> +++ b/include/linux/backing-inode.h
> @@ -11,4 +11,8 @@
>  void backing_inode_copyattr(struct inode *inode,
>                             const struct path *backing_path);
>
> +int backing_inode_setattr(struct dentry *dentry,
> +                         const struct path *backing_path,
> +                         struct iattr *attr, const struct cred *cred);
> +
>  #endif /* _LINUX_BACKING_INODE_H */
> --
> 2.52.0
>
