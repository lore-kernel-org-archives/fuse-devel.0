Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74557625
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 21:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778967185; cv=pass; b=bDUtz0wOkRcItwamVjne85uimILz1gEy9zcsDhePDyyF8Ao10Yvb65d9xO6h7ZJ95QX1Mblac3PugR/FCRgjsvIs3wlChsmxcJ8Grz6KHiTYhRDZ275ZAIiv7euDvqrELyDXLa357c2PjmSV+keEsGfo5ZpF1qg37GC3nUgaTAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778967185; c=relaxed/simple;
	bh=BXsZV79c366UnjUfakh8gqRbmjrjBqz6w7KMJevok3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1/mYDmu3efEgTbWnBMH2okliTNaiVBuT4mEZuRBgDeCbB2n9GtVBMDow4Qspv0I5uOsKphlmKQ5k88k4wWiA9cEOjx1F+qK34ujasvSCfjDBSv+BQ1+dZovOFOOjvnRpP4ULJjEk0/7aVACrfaoUdTxny9WOnQoLHmYA00bl0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvILq59F; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvILq59F"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67bc8609a9bso2492745a12.0
        for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 14:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778967182; cv=none;
        d=google.com; s=arc-20240605;
        b=iLqsRlKPraW1OLzychtTBj3XD/eVTdpf2Q8/uvBW6fgRIysiQgzEJp9iZSaXll8qba
         PeObsdn3IpRnzePdgnNP9xpKXJAhpagFv8+0wy1oAiZr+AOasTEutUZEqBxCC41qRBq5
         mnXjYYlezA5ct1u+C29jffaHHA0eNyJuKv8klzCNe4KFPH1Eu1QpBq1PPHxyWZnXFJ/w
         VWZoK+viz3Osrh7amuaPP05kOL/VvQR0Gp/0Ujpgei2FMbwVaFdfbDuKxFcJXTZKM8Uz
         dlExr/ncCS/KuymaJGlo/NqrPpzuUBtbGuWW4ZMYqwQOBDBgo3iHR+Qfi5jdyKZJRaCf
         3fyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BWaazyZYsXIJpOKmeh9IchbhFNxJQGeaPQHbFURAAAI=;
        fh=tFSVTk9/xQDcV1AnV09NcmuDZXzhbaR25MNg2DH3F+k=;
        b=F/ayMBNxRhWwbxN0ao49hYvGh+bfM25zPln8BRuXBMuXBLqL1ebJ9ivmDAlCLA/u9z
         HE+Xuh7qKfsCFTo/FhunftJQfKw4t6uCgUIrSp+R+inShMtjvEiPWm8ty3n/RYBDxYkn
         UD2Ex/mz51gmUe1pjOUh+0HnPuXhM45fPXXQO6Z0jLPC96z1i3S+7BXDPgmaSYPuKEfe
         QmrcaEDnap5/JRlcLnztedLoylTAQo28scj/iWMUJewsxStFT/RpKQ3N8vP/Qz9jcUX3
         di9ZqYWS8OJExRMl8gnVISZ3iniNJgRaTUkyhRUiqPWAfgN/y55azdePAShtT9zi+UEf
         tfcg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778967182; x=1779571982; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWaazyZYsXIJpOKmeh9IchbhFNxJQGeaPQHbFURAAAI=;
        b=MvILq59FYqY9CeQQKvjzin9mdWtOdlAxc0H9nHqfzRp/E1t4+A23v7UWxiJ5E/Zakj
         dMyeyAVpWk5mLS6fPgs8oJjDe9l2A3SjQs0oT+4vTvV97yQGvlJNy6/a+yDLHiUnGSK0
         ZU0UQIYnefhoOstDfeIUsPqP5uLccJlpqdMmej0Lit5lMyextsbccywOS9MHvJJibcTm
         Y3QLVdiSi1sWVWHedkdjBi2KnftCO5/Tyfpzdp0AFSvfocbVPfpB6YjyhzZ9GgAWlJXZ
         4ziESHBSUqLOQOxgKsHOiJN/MHh6nxc6YVJQVNTW1mHfYVej8Ph1e2E5GPu7KbkAx48C
         mTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778967182; x=1779571982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BWaazyZYsXIJpOKmeh9IchbhFNxJQGeaPQHbFURAAAI=;
        b=czvX89+G6HceO3xvX+4c/mXmbZH8qaiHSTmDPpe6C3YAHbHovIYtmgqUjZ9CxL7zFW
         hsGrhdaJsw8E0f3eQgq2lcWYqVPX5jhyBm1xTVOYKYS+ejxha/iAWPMeX8k4+OvMjyl4
         ZsuW84T3Yf5s/WdH8i061L3SEP0mb1QhGqCHrqqyZtLwZRe3LTzk+juat8py3R/rQf10
         qqHQftUsLuqPyJQBvuwm9qOFrzMFtl/HEIaEs72uu2rDRkBx1ewRa5+P6nxCxiZEs3Hl
         QFi6wVI97aHb9PdVfhXY0WcyFYOJL5/pP0UAyhOZIFUfh2d056+cGpGdQgF3My8OSm3J
         xsuw==
X-Forwarded-Encrypted: i=1; AFNElJ/89iRHxAv1FQnfQNj1OB6XZzdXRT3cyqITlH1w3oXzzj3M9l9zvA3I7lNAYILwSZ5nyFgdAud0D0g9@lists.linux.dev
X-Gm-Message-State: AOJu0Ywtjf5XkfFvhA3ct/zXXa1YflWID37f6F78PL2r/+1iZ8kDlhQ7
	gp5kQWFWuiH0SGzWXSifPdYy40UW1sFkRfOpktOrwsg6S6rYsksSsUKvG+4t/NoQIjS7zIupfoS
	guInQQA4EiHOmjH0ohIF3xn6ilmhumbh2qJlHmDg=
X-Gm-Gg: Acq92OHs5aoArJ+ML3WwuMGWQ/xQYWUyRKjcZtB+xbe9UsQk70JZew3HFLUaRCqBlAf
	JjEOF3z9dMbH1BhBnx7b/YN0YmypRWjMulXVhZC/gnXyfbdsiMvKJCW2nPwYGauW80l9RbrXH+A
	zv8G6yvmUCRlD8Ng+w4R2WXwrQbWc50Y1kw0jwNbUriI6fhsdvY9Re1R3v+zu7ywkU8h0pQmq4A
	CNuboCh3uiGGreaWr1gTvCIoqrWSx09jsbZtfIDp64VHYobyacEjxAfaKnjHHmNCAWUjnNFHllj
	QST1F2rae57ps7DZV7bfFVToU24NzRXkfB73i1tg0A==
X-Received: by 2002:a05:6402:2742:b0:67f:e9d0:d819 with SMTP id
 4fb4d7f45d1cf-683bd1955e1mr4542144a12.22.1778967181731; Sat, 16 May 2026
 14:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com> <20260516004004.1455526-18-joannelkoong@gmail.com>
In-Reply-To: <20260516004004.1455526-18-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 16 May 2026 23:32:50 +0200
X-Gm-Features: AVHnY4KyU_ETmuYR2EQLjVCx9XjHFDk7vSclSGbQvJrWsgZeZqCv4aF_-JCdWyI
Message-ID: <CAOQ4uxg9WT7WmJqQezgiCB1jOX_heW+=UJbbFntbfDUdm0H=tQ@mail.gmail.com>
Subject: Re: [PATCH v2 17/21] backing-inode: add backing_inode_copyattr()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 2:53=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> Move logic in ovl_copyattr() to a generic backing_inode_copyattr()
> function in a new fs/backing-inode.c, which other filesystems that use
> backing inodes (eg fuse passthrough) will use.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/Makefile                   |  2 +-
>  fs/backing-inode.c            | 43 +++++++++++++++++++++++++++++++++++
>  fs/overlayfs/util.c           | 33 +++------------------------
>  include/linux/backing-inode.h | 14 ++++++++++++


Nice!

Please add these files to
FILESYSTEMS [STACKABLE]
section in MAINTAINERS.

Otherwise, feel free to add:
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

There is one more cleanup patch required, now or later, to get rid of
some awkwardness in kernel fs code.
If you don't want to deal with it, I can take this cleanup later.

d_backing_inode() is a noop from the day it was added and has 177
call sites. Those call sites should be converted to d_inode() and
d_backing_inode() should go away.

backing_inode_security{,_novalidate}() are likewise unneeded
dups of inode_security{,_novalidate}() and should be removed.

Thanks,
Amir.

>  4 files changed, 61 insertions(+), 31 deletions(-)
>  create mode 100644 fs/backing-inode.c
>  create mode 100644 include/linux/backing-inode.h
>
> diff --git a/fs/Makefile b/fs/Makefile
> index cf4a745e9679..3f8a227d4938 100644
> --- a/fs/Makefile
> +++ b/fs/Makefile
> @@ -40,7 +40,7 @@ obj-$(CONFIG_COMPAT_BINFMT_ELF)       +=3D compat_binfm=
t_elf.o
>  obj-$(CONFIG_BINFMT_ELF_FDPIC) +=3D binfmt_elf_fdpic.o
>  obj-$(CONFIG_BINFMT_FLAT)      +=3D binfmt_flat.o
>
> -obj-$(CONFIG_FS_STACK)         +=3D backing-file.o
> +obj-$(CONFIG_FS_STACK)         +=3D backing-file.o backing-inode.o
>  obj-$(CONFIG_FS_MBCACHE)       +=3D mbcache.o
>  obj-$(CONFIG_FS_POSIX_ACL)     +=3D posix_acl.o
>  obj-$(CONFIG_NFS_COMMON)       +=3D nfs_common/
> diff --git a/fs/backing-inode.c b/fs/backing-inode.c
> new file mode 100644
> index 000000000000..474770a1fa9d
> --- /dev/null
> +++ b/fs/backing-inode.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Common helpers for stackable filesystems and backing inodes.
> + */
> +
> +#include <linux/backing-inode.h>
> +
> +/*
> + * backing_inode_copyattr - copy inode attributes from a backing inode
> + *
> + * When a filesystem copies inode information from a backing layer to it=
s own
> + * inode, it applies the idmapping of the backing mount, ensuring that
> + * the inode ownership will correctly reflect the ownership of the idmap=
ped
> + * backing mount. For example, an idmapped backing mount mapping id 1001=
 to id
> + * 1000 will take care to map any backing inode owned by id 1001 to id 1=
000.
> + * These mapping helpers are nops when the backing mount isn't idmapped.
> + */
> +void backing_inode_copyattr(struct inode *inode,
> +                           const struct path *backing_path)
> +{
> +       struct inode *realinode;
> +       struct mnt_idmap *real_idmap;
> +       vfsuid_t vfsuid;
> +       vfsgid_t vfsgid;
> +
> +       realinode =3D d_inode_rcu(backing_path->dentry);
> +       real_idmap =3D mnt_idmap(backing_path->mnt);
> +
> +       spin_lock(&inode->i_lock);
> +       vfsuid =3D i_uid_into_vfsuid(real_idmap, realinode);
> +       vfsgid =3D i_gid_into_vfsgid(real_idmap, realinode);
> +
> +       inode->i_uid =3D vfsuid_into_kuid(vfsuid);
> +       inode->i_gid =3D vfsgid_into_kgid(vfsgid);
> +       inode->i_mode =3D realinode->i_mode;
> +       inode_set_atime_to_ts(inode, inode_get_atime(realinode));
> +       inode_set_mtime_to_ts(inode, inode_get_mtime(realinode));
> +       inode_set_ctime_to_ts(inode, inode_get_ctime(realinode));
> +       i_size_write(inode, i_size_read(realinode));
> +       spin_unlock(&inode->i_lock);
> +}
> +EXPORT_SYMBOL_GPL(backing_inode_copyattr);
> +
> diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
> index 3f1b763a8bb4..3e7d66c26c10 100644
> --- a/fs/overlayfs/util.c
> +++ b/fs/overlayfs/util.c
> @@ -16,6 +16,7 @@
>  #include <linux/namei.h>
>  #include <linux/ratelimit.h>
>  #include <linux/overflow.h>
> +#include <linux/backing-inode.h>
>  #include "overlayfs.h"
>
>  /* Get write access to upper mnt - may fail if upper sb was remounted ro=
 */
> @@ -1503,38 +1504,10 @@ int ovl_sync_status(struct ovl_fs *ofs)
>         return errseq_check(&mnt->mnt_sb->s_wb_err, ofs->errseq);
>  }
>
> -/*
> - * ovl_copyattr() - copy inode attributes from layer to ovl inode
> - *
> - * When overlay copies inode information from an upper or lower layer to=
 the
> - * relevant overlay inode it will apply the idmapping of the upper or lo=
wer
> - * layer when doing so ensuring that the ovl inode ownership will correc=
tly
> - * reflect the ownership of the idmapped upper or lower layer. For examp=
le, an
> - * idmapped upper or lower layer mapping id 1001 to id 1000 will take ca=
re to
> - * map any lower or upper inode owned by id 1001 to id 1000. These mappi=
ng
> - * helpers are nops when the relevant layer isn't idmapped.
> - */
>  void ovl_copyattr(struct inode *inode)
>  {
>         struct path realpath;
> -       struct inode *realinode;
> -       struct mnt_idmap *real_idmap;
> -       vfsuid_t vfsuid;
> -       vfsgid_t vfsgid;
>
> -       realinode =3D ovl_i_path_real(inode, &realpath);
> -       real_idmap =3D mnt_idmap(realpath.mnt);
> -
> -       spin_lock(&inode->i_lock);
> -       vfsuid =3D i_uid_into_vfsuid(real_idmap, realinode);
> -       vfsgid =3D i_gid_into_vfsgid(real_idmap, realinode);
> -
> -       inode->i_uid =3D vfsuid_into_kuid(vfsuid);
> -       inode->i_gid =3D vfsgid_into_kgid(vfsgid);
> -       inode->i_mode =3D realinode->i_mode;
> -       inode_set_atime_to_ts(inode, inode_get_atime(realinode));
> -       inode_set_mtime_to_ts(inode, inode_get_mtime(realinode));
> -       inode_set_ctime_to_ts(inode, inode_get_ctime(realinode));
> -       i_size_write(inode, i_size_read(realinode));
> -       spin_unlock(&inode->i_lock);
> +       ovl_i_path_real(inode, &realpath);
> +       backing_inode_copyattr(inode, &realpath);
>  }
> diff --git a/include/linux/backing-inode.h b/include/linux/backing-inode.=
h
> new file mode 100644
> index 000000000000..6b43cba9fabd
> --- /dev/null
> +++ b/include/linux/backing-inode.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Common helpers for stackable filesystems and backing inodes.
> + */
> +
> +#ifndef _LINUX_BACKING_INODE_H
> +#define _LINUX_BACKING_INODE_H
> +
> +#include <linux/fs.h>
> +
> +void backing_inode_copyattr(struct inode *inode,
> +                           const struct path *backing_path);
> +
> +#endif /* _LINUX_BACKING_INODE_H */
> --
> 2.52.0
>
