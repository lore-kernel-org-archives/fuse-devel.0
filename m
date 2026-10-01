Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACF34A483C
	for <fuse-devel@lists.linux.dev>; Thu,  1 Oct 2026 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.231
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868875; cv=pass; b=fseUjKksSeUDlOvbxWitup2PKPEXYaguKso4zKU5G7+Hy3NmXJfp6w1/EebbMKtJFgrFP1WMEImEptW7jdmyN3aLy7GTPsgj7eg29OOgLl2dBU27LQwVW+Oiz/XFeOPRPDS7DH75ejIUZPMLEfNpHpdSfjHVCHXo2mQcamUbM18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868875; c=relaxed/simple;
	bh=pUsKevWfsAeP+2aGTL0R+CMfkpJR+/AZUNMBSnZ91wY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbA79lTcOnK1bjSkUmG8/T6CSWLoCLhtiWE8xOzV3MpCVGgoSO1Ol+EbdZON4ENzITmAiRttWcpq/GdZvxgqQn5+aOmjUlAxETVmp+f6INfYF10uDOTqWHCYl6Z3a+8kj9wDWkXQ0gChp0n/KrCelcB+L5VoeHkcFdIeII+N2HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=pYoLptpa; arc=pass smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="pYoLptpa"
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-5338c775eb6so7697451cf.1
        for <fuse-devel@lists.linux.dev>; Thu, 01 Oct 2026 08:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790868871; cv=none;
        d=google.com; s=arc-20260327;
        b=g2siFpDwHs+pGJ7U9guk8cQNeBAKdVIZs9eIJNGkYCYz2bZwgTDeHJrr/xc17a/Wsc
         D/M54v8f0v66xlJijuQuffKF7ovNXS05HdRah7rDdWdAvJiqADE4w7AD0teL2wHIbit9
         j01HQh9IklF46y4m0cfHWFtFRyuJtIoaaCSTIw7IubIUMviIdNBppGRP/GooUe7CjiPc
         H5JiyR6x0wDiBEE43P/9KorV+dyJwXApUCQMhO0nEKBAcmkJiItsh6jxJ9Md1/Un4IL6
         Tb2A99YEV/UUUwfC++4isxDvfT3VpVUzQmVmSOBoB2z2Xp6qxeDZoVSLd2RNHOn56G9K
         uzmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=djKkT+Gh+Iu1tWqX0MywiiRG1xduC+wpcZCT26Gpw9Q=;
        fh=ROTbUJVuUNV6kk5Hm7sXJsMA/rZY9zjySQ4xJ2oKd7k=;
        b=efvjRHFFg5HUypuB6VZ/z/rKPE9a4GH7EglcUMQRFb5yk61ZwICtCaOFuU9Abg7vql
         XJsJLrHzXPiaBxLebusBincWlSzbSYcWB31XvvL+iEWxTGFOLWf4BEqd6jnIYTdZAkaj
         CECOzniPxj8paJVGFubI/c6f+wAkEHBTTJmvWh5UdH9YFXaADWcCUgodoeBj4dovOTjW
         mjHS1jR+EFQhiDymdFRNkrYnCPSGoDrmQvU8spp22KcnS0SalsCiY/R4SaEXkvVhPQzk
         VzPJzIObn6o/kDX5hbnaR7N4qrOsAJzKjv3fKYYIdp25miWx3Cr3nwyfM/kZlielyG39
         HsCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1790868871; x=1791473671; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=djKkT+Gh+Iu1tWqX0MywiiRG1xduC+wpcZCT26Gpw9Q=;
        b=pYoLptpamzA1NcrosbZ1F1f5iZc2k9jrTjpylZoPHOUibYHUThg736Yv07HBBeYeXg
         saIU7PW4wcqvSyzli3UQMkZ6fJhIE7m8qTG9jdjOQmmhti2Rg9NeUK+QuozaMoFRE7SK
         MLf2PQJwtcBncgZRn/oabHwdljU3TzLCwGnvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790868871; x=1791473671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djKkT+Gh+Iu1tWqX0MywiiRG1xduC+wpcZCT26Gpw9Q=;
        b=uzqglOpCuLzcW/hRxNLQ9XKfuPH1YXT05LIGMKtX4mP32v5D/dJS6p5pyjE18drO6U
         ZQOSyoCiquR6SsXh9sFxS+0uy5764HG41972im0TEcEN6CcCJl5Hbta4CC1Qul0Yj/u7
         I638u7aEnQEHDgqAaz73anSDLB2csI6VosjoJ8Pk1YWVlsdYAGa7Sm/yjNudy7uj5ZFm
         VAoHeUWjEycTHAPlxDcZzAzEJjByColnFGCsudo4AL7HzU/nXr7XNxKpGDK1jP9z7kPl
         VqfRmi6OrAaKQPNDpIOBXrOwWw+PRmsjEak4VMzBmg/G6hMw30yuMyiu1TGoI2LZIRds
         bNig==
X-Forwarded-Encrypted: i=1; AKwUvBxqeMl7Gt2dk/WzBSt1LvnWMmEjyyCp06PkqYMmQ5anjd80DCDIHtQyD0AeTGCOLRI6phHctb1W29Pl@lists.linux.dev
X-Gm-Message-State: AFuF++m7BQUmMFPOnXJ6CszAL6PcATvOZkPq/ZHmdhsam1wp1Joki3R2
	TL5QSddrG04lriHM6CgRZE8YOPF9ohAJhONQnTsdomF6kSh8it0zhhebz4jMOD2phnt4K78QrYZ
	zrYKwPen5M6shYLpYfL//mRC8TCybajkQZQIl88DOQg==
X-Gm-Gg: AYBFou31xL5S2HChW6tVtzdj20U/opYjtY84Oi1V43+/+klL+MFGKXwOoJRcu5bRG1d
	6Zr1IjAdyNCSXy9vyZtzhOdwO+ad0k7WUsxbRealMwLBNAgsU+7WJBA6zC0eWVtucZsM2xEVR18
	HklAtv5lCim9cdnh5drprukjFbgMFNwzViZpaUGbbgxN/QY/6UwsM+AysLU7/fJtbmJW9R3uN+Z
	yST9lQw8bmW5o/YNrursw7KAhiizx7PqrgX2fmWG/UGmsV5UNHXXv3Gi2Q2RPOm7QAy9CQXw8f8
	+702E/MYbM0XIwPE7K/0SKGsWS+qp7OjQWhB1vfe+LBrZ/ZJ9pYw2zoIakTXepzXM/8vGhhOlKh
	oOKTC2Yao5vYulA==
X-Received: by 2002:a05:622a:90a:b0:530:42d4:4c9a with SMTP id
 d75a77b69052e-53374dcfb64mr92226621cf.44.1790868871029; Thu, 01 Oct 2026
 08:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-9-mszeredi@redhat.com>
 <CAOQ4uxj8hVvShust-TkAQUgTJCVvNsWjDiqayeUjVifUBotH7g@mail.gmail.com> <CAOQ4uxgo7ZR=AK=7nc8Yxb1WpFn+bjEF-9HKYvyfvNDAV0Er0Q@mail.gmail.com>
In-Reply-To: <CAOQ4uxgo7ZR=AK=7nc8Yxb1WpFn+bjEF-9HKYvyfvNDAV0Er0Q@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 1 Oct 2026 17:34:19 +0200
X-Gm-Features: AclHuK8tL_M8pSku9GrUGRUVD-WfhJ1mi1bSUlAYRsbhIunLI92GZ24glkrNNjs
Message-ID: <CAJfpegvq6z8r5tELpOv90SwVy5063gjhJTKRcD1QJgSWitYa7w@mail.gmail.com>
Subject: Re: [PATCH 08/11] fuse: add support for opening dax device as backing
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	John Groves <john@groves.net>, "Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Oct 2026 at 17:21, Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Tue, Sep 22, 2026 at 1:00=E2=80=AFPM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat=
.com> wrote:
> > >
> > > Add FUSE_BACKING_IS_DEV flag that allows opening a character device
> > > (dax device) as a backing, in addition to regular files.
> > >
> > > Mark the inode with S_DAX if FUSE_LOOKUP returns with FUSE_ATTR_DAX s=
et.
> > >
> > > This patch does not yet provide a way actually use the dax dev backin=
g:
> > > when such a backing ID is provided in reply to FUSE_OPEN with
> > > FOPEN_PASSTHROUGH flag set, an error will be returned.
> > >
> > > Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> > > ---
> > >  fs/fuse/backing.c         | 131 ++++++++++++++++++++++++++----------=
--
> > >  fs/fuse/file.c            |   2 +-
> > >  fs/fuse/fuse_i.h          |  28 +++++++-
> > >  fs/fuse/inode.c           |  11 +++-
> > >  fs/fuse/passthrough.c     |   8 ++-
> > >  include/uapi/linux/fuse.h |   3 +
> > >  6 files changed, 136 insertions(+), 47 deletions(-)
> > >
> > > diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> > > index 58dbdd17c1ef..aa558a0c2e64 100644
> > > --- a/fs/fuse/backing.c
> > > +++ b/fs/fuse/backing.c
> > > @@ -9,6 +9,7 @@
> > >  #include "fuse_i.h"
> > >
> > >  #include <linux/file.h>
> > > +#include <linux/dax.h>
> > >  #include <linux/rhashtable.h>
> > >
> > >  static struct fuse_backing *fuse_backing_get(struct fuse_backing *fb=
)
> > > @@ -22,9 +23,16 @@ static void fuse_backing_free(struct fuse_backing =
*fb)
> > >  {
> > >         pr_debug("%s: fb=3D0x%p\n", __func__, fb);
> > >
> > > -       if (fb->file)
> > > -               fput(fb->file);
> > > -       put_cred(fb->cred);
> > > +       switch (fb->type) {
> > > +       case FUSE_BACKING_PATH:
> > > +               path_put(&fb->path);
> > > +               put_cred(fb->cred);
> > > +               break;
> > > +
> > > +       case FUSE_BACKING_DAXDEV:
> > > +               fs_put_dax(fb->dax_dev, fb);
> > > +               break;
> > > +       }
> > >         kfree_rcu(fb, rcu);
> > >  }
> > >
> > > @@ -79,23 +87,88 @@ static struct fuse_backing *fuse_backing_id_remov=
e(struct fuse_conn *fc, u64 id,
> > >         return fb;
> > >  }
> > >
> > > +static int fuse_dax_notify_failure(struct dax_device *daxdev, u64 of=
fset, u64 len, int mf_flags)
> > > +{
> > > +       struct fuse_backing *fb =3D dax_holder(daxdev);
> > > +
> > > +       fb->dax_error =3D true;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static const struct dax_holder_operations fuse_dax_holder_ops =3D {
> > > +       .notify_failure         =3D fuse_dax_notify_failure,
> > > +};
> > > +
> > > +static int fuse_backing_open_file(struct fuse_conn *fc, struct fuse_=
backing *fb, struct file *file,
> > > +                                 bool is_dev)
> > > +{
> > > +       struct inode *inode =3D file_inode(file);
> > > +       struct dax_device *daxdev;
> > > +       int err;
> > > +
> > > +       switch (inode->i_mode & S_IFMT) {
> > > +       case S_IFREG:
> > > +               if (is_dev)
> > > +                       return -EINVAL;
> > > +               /* TODO: relax CAP_SYS_ADMIN once backing files are v=
isible to lsof */
> > > +               if (!fc->passthrough || !capable(CAP_SYS_ADMIN))
> > > +                       return -EPERM;
> > > +
> > > +               if (inode->i_sb->s_stack_depth >=3D fc->max_stack_dep=
th)
> > > +                       return -ELOOP;
> > > +
> > > +               fb->type =3D FUSE_BACKING_PATH;
> > > +               fb->path =3D file->f_path;
> > > +               path_get(&fb->path);
> > > +               fb->cred =3D get_current_cred();
> > > +               return 0;
> > > +
> > > +       case S_IFCHR:
> > > +               if (!is_dev)
> > > +                       return -EINVAL;
> > > +               daxdev =3D dax_dev_find(inode->i_rdev);
> > > +               if (!daxdev)
> > > +                       return -EINVAL;
> > > +
> > > +               err =3D -EPERM;
> > > +               if (capable(CAP_SYS_RAWIO)) {
> > > +                       err =3D fs_dax_get(daxdev, fb, &fuse_dax_hold=
er_ops);
> > > +                       if (!err) {
> > > +                               fb->type =3D FUSE_BACKING_DAXDEV;
> > > +                               fb->dax_dev =3D daxdev;
> > > +                       }
> > > +               }
> > > +               put_dax(daxdev);
> > > +               return err;
> > > +
>
> I am looking ahead at passthrough inode ops which need work on all file t=
ypes
> so this is_dev is confusing.
>
> Therefore I prefer to call the flag
> FUSE_BACKING_IS_DEV/FUSE_BACKING_IS_DAXDEV
> and variable is_daxdev

Dropped this entirely in v2.  My thinking was that for backward compat
IOC_BACKING_OPEN must return an error for device fd.  That no longer
matters with the new IOC_BACKING_CREATE.

Thanks,
Miklos
