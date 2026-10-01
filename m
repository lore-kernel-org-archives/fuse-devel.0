Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B9651AFEF
	for <fuse-devel@lists.linux.dev>; Thu,  1 Oct 2026 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867232; cv=pass; b=aZoyZpbiUUL5d9st0i1pnKrFmz8M676ij6OFfJTuW0AjeIRck2PXuE0CYKZZWBcoVcQWcL6wOYCNND+BCejqzewwamaTvlR1O7F5/BBn/F9XFY3Io0MbisspZM2iB9vSBpzBePxOBhUo17LvOleHY0/9SNyl2M0NaPTZKrZqL9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867232; c=relaxed/simple;
	bh=2XJvp9X+m4CiGXhNX+5zaF0kRGaL62FZuuhf5RCAPmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFDHT0EKgTCFgJzvjJbijxelfQbN2MawN6zs4wf/wTUbqHleRx9NpQVFeUbFnsDotYCC9Xhbnjx+z0GvjKQkYMVMsMLaCv+uQ+47HHxKMgEnD9C/zx2hsJ+r7pvVwi3bYGN5EbI6HCeZVwEeSgP9KfJxsGKE3FAAYy6PRc17BAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahziU2ll; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahziU2ll"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6aeba456592so887361a12.0
        for <fuse-devel@lists.linux.dev>; Thu, 01 Oct 2026 08:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790867229; cv=none;
        d=google.com; s=arc-20260327;
        b=K77WNLT0fi+hK1Fzbwa3i8o0BCrimIyzuZDit6wMTh+6lUXADv7FjCu/Bs5cKVE3HN
         NMuhw5rIz5DgnqGPFUEJ1JU7qt7D+V7xxB+4hXzUaxdy2p2Hz/dkApUjOsMLlMjQiPK/
         KXk5ev4vZvru31AssstcopK6ksu2AZVLB+ruKUUgaPAbovcED8uPa5VMtik3bOewXg5p
         MJJhHMkqlHpb5YcIwJzK5gx6+vA+0Cm4HJ2xg7fa532qBVWyk1nESnSnydJWOptep9BI
         kFWlY9uVuDQFHK+nIHu1EJTtAQQoP89yeEpJu9T5iyvUy4UZ4C+Bd5GMwGQAn0i1G+4j
         rigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W9LnT/LgLRgRZdpDuS6mnLvWG55h36jtUAaXmFR+4Ok=;
        fh=LSGkIxL+7O1MPXHhjOsZelXZcZzf1zyb+22wAIOwAjQ=;
        b=KgyDhJas1xG0cQ2kIQQA/c7xJNxgcJkkSGhKj1EJnQRGAxr1hnYqGMO6/MujJ/V54k
         dE5n0+nlxp98rCoR9Wd+gq8UwX+Jgmzc2VH+kqwvrlY4jyTwryDTZEP422pr81YdeLEz
         TvQjbQb9UwvYPBYqA03rsp2/+w2Y56HWRMyBap8WcW4XQ3jX7FIWxR2DwLXsWX0pcQJ2
         +HJBlxz+SVjsLbMlpFNg7g6+fRGPswCh9yuD0QNyDjyLc59AUhhSN2ZOrxLSkBByWQtw
         nWHPmLokAWUBynzgDlq/REwaARmLJvxR9uWKKF658uL/jQJq//yetWRRDii9IQuD0vq+
         OZ4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790867229; x=1791472029; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W9LnT/LgLRgRZdpDuS6mnLvWG55h36jtUAaXmFR+4Ok=;
        b=ahziU2llQ8SAqR9AnTTEIK3W4t0sfmIl0MzBovq6ghxuKxTAaJ/sv1HiAV0pMkO4DU
         fg2TVecrpfwZ1nzYtrQyORVFMLBFtSxofQVsALoI/Zp+seXlD4hvS//hZBrMnf+pKqv3
         NpFQnglYICc2Ix2POrp3QAmvrRIcWpGk/J23njT0NmSPviiK6FupouyJXp9dINw8WUpJ
         Q6GuE/BSz/bBmSWd/BcqvrWSAU9rbmKpOoCDF3CTk3Sf5/tLygLSkZYY6Md8Zxj/YtX/
         Sq58RA5mxS2a+7RfB+LFVxITu0f2zrZRapuJUaPdWP3AQmP9723/2VNRJS64uOhdjPaL
         dcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867229; x=1791472029;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9LnT/LgLRgRZdpDuS6mnLvWG55h36jtUAaXmFR+4Ok=;
        b=RuErO1ZpdDquXa1Z6gEb83s54YSQ+F10yzv3x7syTyJaonbHnqabJGwqWuH5H0RSfN
         nAr9wxbyriOA+BlXLSD3P8dJUZXSDW1qxXSeIBstsss+68TQ18VUVXfuEHSulqJ8/nWL
         ASpHyFJ68jl5YuI9k0TaMrbhgMK/Tg48j5PM+ElsfXNXRCn4PoIfTLE1OOj/y0OMjIDw
         NzEfd+195J7O69T+yo/Wm24hdzbKn5PMSkFayJZUkzzajjFmes2joQyyqyq2RJZgIX5A
         y5/kk3Q2++UmVfauoD11q8Ga3w5gIJBo8o12kRjrVDRo7Ieh3EkuL9HeWUAl+BoVT07m
         xRWw==
X-Gm-Message-State: AFuF++kRqPlfQbjLsYsuT008K1oxDJ3IARBaEuX3PWogvG2FaiygM7yr
	Zy45vGoRyU8IySq93fh/wV66I8ITGSuXfJyXfhskznFtOYH7ebzs/b4ilPTIPapEU2ntBQg6QMb
	gfSK0Or7wQHb0JnIjpktedsfiwn9MCko=
X-Gm-Gg: AYBFou170LeW8odx9eF7d/VvAmuLq5P7Z2k6vAnjNlnbmeCFnVkG0EKt0gOpVgchjaF
	+ASjCnF/fUn0nF2DUR5BenxjzV2onzsJbb3FyjMKr3hMiwfXoJYLoeI2DDDL3oBO5pJy1ULVAra
	CtX4Z1JHPJnd4heQLCKf9/dD5shE0fxASrUVcY/CkfExKmkN3wzDb4dZesyStaLS47DID6CEiPw
	AT39JbaeH0ZzypQ5Nv4FfssARGE32y6s5W0BZBSq7iP59ms/rVJ0gxOyv3qWp+DJBHKXxnd1/nS
	J97s5K+ddWvkelUNPqNBFEFCvDAKh4KWx8agVvaI6mLE12cobY32nSFF
X-Received: by 2002:a17:907:3da6:b0:c2e:3342:40a5 with SMTP id
 a640c23a62f3a-c2e33ef17e6mr292780966b.9.1790867228561; Thu, 01 Oct 2026
 08:07:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-9-mszeredi@redhat.com>
 <CAOQ4uxj8hVvShust-TkAQUgTJCVvNsWjDiqayeUjVifUBotH7g@mail.gmail.com>
In-Reply-To: <CAOQ4uxj8hVvShust-TkAQUgTJCVvNsWjDiqayeUjVifUBotH7g@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 1 Oct 2026 17:06:56 +0200
X-Gm-Features: AclHuK_4jDSnDAEGTwQujuUm612JOuLiCrswr2OZyJJHD_GZ0KOQ6v4s6oHpou0
Message-ID: <CAOQ4uxgo7ZR=AK=7nc8Yxb1WpFn+bjEF-9HKYvyfvNDAV0Er0Q@mail.gmail.com>
Subject: Re: [PATCH 08/11] fuse: add support for opening dax device as backing
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 1:00=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.c=
om> wrote:
> >
> > Add FUSE_BACKING_IS_DEV flag that allows opening a character device
> > (dax device) as a backing, in addition to regular files.
> >
> > Mark the inode with S_DAX if FUSE_LOOKUP returns with FUSE_ATTR_DAX set=
.
> >
> > This patch does not yet provide a way actually use the dax dev backing:
> > when such a backing ID is provided in reply to FUSE_OPEN with
> > FOPEN_PASSTHROUGH flag set, an error will be returned.
> >
> > Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> > ---
> >  fs/fuse/backing.c         | 131 ++++++++++++++++++++++++++------------
> >  fs/fuse/file.c            |   2 +-
> >  fs/fuse/fuse_i.h          |  28 +++++++-
> >  fs/fuse/inode.c           |  11 +++-
> >  fs/fuse/passthrough.c     |   8 ++-
> >  include/uapi/linux/fuse.h |   3 +
> >  6 files changed, 136 insertions(+), 47 deletions(-)
> >
> > diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> > index 58dbdd17c1ef..aa558a0c2e64 100644
> > --- a/fs/fuse/backing.c
> > +++ b/fs/fuse/backing.c
> > @@ -9,6 +9,7 @@
> >  #include "fuse_i.h"
> >
> >  #include <linux/file.h>
> > +#include <linux/dax.h>
> >  #include <linux/rhashtable.h>
> >
> >  static struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
> > @@ -22,9 +23,16 @@ static void fuse_backing_free(struct fuse_backing *f=
b)
> >  {
> >         pr_debug("%s: fb=3D0x%p\n", __func__, fb);
> >
> > -       if (fb->file)
> > -               fput(fb->file);
> > -       put_cred(fb->cred);
> > +       switch (fb->type) {
> > +       case FUSE_BACKING_PATH:
> > +               path_put(&fb->path);
> > +               put_cred(fb->cred);
> > +               break;
> > +
> > +       case FUSE_BACKING_DAXDEV:
> > +               fs_put_dax(fb->dax_dev, fb);
> > +               break;
> > +       }
> >         kfree_rcu(fb, rcu);
> >  }
> >
> > @@ -79,23 +87,88 @@ static struct fuse_backing *fuse_backing_id_remove(=
struct fuse_conn *fc, u64 id,
> >         return fb;
> >  }
> >
> > +static int fuse_dax_notify_failure(struct dax_device *daxdev, u64 offs=
et, u64 len, int mf_flags)
> > +{
> > +       struct fuse_backing *fb =3D dax_holder(daxdev);
> > +
> > +       fb->dax_error =3D true;
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct dax_holder_operations fuse_dax_holder_ops =3D {
> > +       .notify_failure         =3D fuse_dax_notify_failure,
> > +};
> > +
> > +static int fuse_backing_open_file(struct fuse_conn *fc, struct fuse_ba=
cking *fb, struct file *file,
> > +                                 bool is_dev)
> > +{
> > +       struct inode *inode =3D file_inode(file);
> > +       struct dax_device *daxdev;
> > +       int err;
> > +
> > +       switch (inode->i_mode & S_IFMT) {
> > +       case S_IFREG:
> > +               if (is_dev)
> > +                       return -EINVAL;
> > +               /* TODO: relax CAP_SYS_ADMIN once backing files are vis=
ible to lsof */
> > +               if (!fc->passthrough || !capable(CAP_SYS_ADMIN))
> > +                       return -EPERM;
> > +
> > +               if (inode->i_sb->s_stack_depth >=3D fc->max_stack_depth=
)
> > +                       return -ELOOP;
> > +
> > +               fb->type =3D FUSE_BACKING_PATH;
> > +               fb->path =3D file->f_path;
> > +               path_get(&fb->path);
> > +               fb->cred =3D get_current_cred();
> > +               return 0;
> > +
> > +       case S_IFCHR:
> > +               if (!is_dev)
> > +                       return -EINVAL;
> > +               daxdev =3D dax_dev_find(inode->i_rdev);
> > +               if (!daxdev)
> > +                       return -EINVAL;
> > +
> > +               err =3D -EPERM;
> > +               if (capable(CAP_SYS_RAWIO)) {
> > +                       err =3D fs_dax_get(daxdev, fb, &fuse_dax_holder=
_ops);
> > +                       if (!err) {
> > +                               fb->type =3D FUSE_BACKING_DAXDEV;
> > +                               fb->dax_dev =3D daxdev;
> > +                       }
> > +               }
> > +               put_dax(daxdev);
> > +               return err;
> > +

I am looking ahead at passthrough inode ops which need work on all file typ=
es
so this is_dev is confusing.

Therefore I prefer to call the flag
FUSE_BACKING_IS_DEV/FUSE_BACKING_IS_DAXDEV
and variable is_daxdev

Because this is what it actually means.

This flag would not be allowed in the PASSTHROUG_INO mode.

Thanks,
Amir.
