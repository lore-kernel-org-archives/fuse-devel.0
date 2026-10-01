Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A2638655D
	for <fuse-devel@lists.linux.dev>; Thu,  1 Oct 2026 17:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790874597; cv=pass; b=rHOaso+QHOrYjCv+859Y8tUYSQftIGze11VlY0uz3kNUY2BU5pCmejPXCYyZQRql6Obcxo6JwR8HVFZHQ7ZKgzF/uqev4kZWxIsFdSSD4URHrz6uFDGO6eGeUtX5xVkOAypA5d/ZpXD4xajE3kJPT+vGLNNEnt6PvX5B1kaasv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790874597; c=relaxed/simple;
	bh=8GH8/SsNfmtkhdpX79c0aQcCb3/XRb8OtTW5xDOS0oE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0jA5V+rpZxlIUOyLcCSqZwzZot6Fv1UJ5lm+RTCrSS1pt5/O5z77GOz+Y0Gz3E3fgp0RHt/hGkLRiE1+F+uY73RKx4Vy4laTbRve9rGsEMjoYIgt4XpEje/zrKrcr4QN6mwXXSUnLsRImlDi7sSvKS0C82ZwwZkg9qzNnZ3Vsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSW2CM2W; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSW2CM2W"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6af7d408b51so646573a12.1
        for <fuse-devel@lists.linux.dev>; Thu, 01 Oct 2026 10:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790874585; cv=none;
        d=google.com; s=arc-20260327;
        b=bXhQq74P3HZY5jAuJ3vT5DGiJ1fsJLGJ9+OpYFmOzMlfbewDMOwymTEuF3TSk7/VGU
         fb3kGfwx0iJdCeH6bAWf26OHGD0IpdA/QPZTYCJeB2xagDbd8d5MiiABgQPAr5YALOV3
         /9SUpIB8S5F1tiFC++89ieXZhG9fjZHunxJ2w3uM08gRxgx1PbvGjs+ZyIFR0sJWM0Wf
         97NSlRlAlcu1PrYUsPlLXixQ86VrwnX+JwVllc8f98BBSwFIF/guEWZ0fZ2b+mXuaSRd
         Zp+UW97ccCzZGxj4u5tDxvt8Wxu1ySlvMjzEL0JUb9ENV/oD6kZOWGXrFVwfPfOvkUth
         sdfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aLFtAFtsh0QtLKb/lJ9Aky55k7s033R21zc2oLJYS2s=;
        fh=yraj4v+bqSXmxjjMpn1/atBIsHsRegvA+ny3Ua/6dVc=;
        b=AbBYE47CVB8LP4FucynhRLvicI+xFBDG0ierOeQneicGoFqNZBfweBMOtbZDI1ZBsr
         aIaXu/Rwcg2VlSdx3100ZL87xfW1ehyz7i3ScnQel0zpDB8Mylb/IkIYYW0NGE2rqtcD
         TdcWi2Lcm++duvLoOz07rqNqyzUDnmaGtE54n2HLbP8AgJT3xNoqtJmTlbB9J3xkeFv9
         jkyc9l1VASZjUSBBr0DTSPmC+xReUFTyRlnVL+0AkLTF1HZPKbZS1KCguhu6GBgLKJXc
         GRt2yVPLaZsNxaVPHW+nD2bap5+Fv2ejzXTRXRk2c582LOcnvXK+K0WD3J0uoZaI7qxj
         N70A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790874585; x=1791479385; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aLFtAFtsh0QtLKb/lJ9Aky55k7s033R21zc2oLJYS2s=;
        b=fSW2CM2WsAyEkr5gB+NwhFerrKh3qCnC8ez6qatvyBc7psXDePo5k9SaCzjHxN0Er6
         3fb0sq56LImGr+R6Zx1Re4O9O2wE0fjctTEYGf67tzxdTXT5mnUbpVz7B9Yk8WvmNjr8
         8bKPPBZQlJEVUkfIgkKD68ZOArup3ICLU+ba3/NsLIPGHogL0+5I1U/nm2gtolYbxldj
         Hv7nDSi8HW3oxVg5eSaNco2BB7A1vV/4zUnx6agJ2tIiQuIyGpyf5mJeb13pus3I2Ozq
         aqBe3JuMYUXV8wnSMzbzt9eO6sPlSVZoS5I2rL6DEouzdfEOk+mVSrzXJvo6DVkkjZ/8
         k9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790874585; x=1791479385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLFtAFtsh0QtLKb/lJ9Aky55k7s033R21zc2oLJYS2s=;
        b=DOS7kjaEiRYDRXxUKv5QAfwWipiebSKXE+ASZh5buZqyXn43eQRYoN9rUAArct5+jm
         exE6NUjN6i05ULKOJ4PXcgLqoQ/XUkLCofbf2RdTuNOYc3aBx0apF4FWpJrpcqAvK984
         PCGVq7oZROIfA4eItwReteHuRd2wcVbJk7PBUP1miitQhmHResMyZ9GzEzoz6nqFJcVf
         fc0g6zplfoqyqM4CGzxTccZkx7pgHuSgjpeJB4jiK35z8q0oSJoWbSmxiVG0RFbQRpyM
         s+w/KzkOko6QWd8v5ADGkHY990dVWypojGBzHrRO5qb9DdkrIzs5uw/hXxzEhrub2gjw
         7gIA==
X-Gm-Message-State: AFq9FYKxnrs+C/h1tJ+S0GX/iU8aqaHEHtoUlJnNif3JjTfkrS+H/Uu/
	BCHVdksOnNu2H4cWFvw2ennWq7pch+n4oiS/A0Sy86gkgGvgjSXxQAeLpfwiUI8RNXdJpy5dSDD
	I+n5CGdEZlga+IYh8LiLluFtCPYysLO8=
X-Gm-Gg: AYBFou3H27jIHQO31n4/E2qiyEG02bul51jnp5jWHOP3jNM+Ymjvnc8b2pLNxkwi1PN
	bRyNMIvTy+SWmQ8dkXgRV8mbRrjvba0FuUs4CowLA5hj5woIZOQJGU2PVoTN7X8JUDNVV4jqSX5
	ZiRfL1rfg+pf7WxrpbCUdo5eIustsfwCoQi9SY+DD+jCay56Arxckp71nHtt0E1R027Rp8FvdMM
	HEz2JfidjrcDnqnLCk8y/rZMGV+8+IA+l0aoN8/by8jpVFdkVpaa3jFrArFHf08S5UAr7GU64qp
	d61nX1VvlGZ4JGRXNuLYSFQtIGWZtRsloLpHW4ZmkMoUdJ2uLS6FWO2c
X-Received: by 2002:a05:6402:4342:b0:6ac:7d58:dbed with SMTP id
 4fb4d7f45d1cf-6ae3078464amr3051715a12.3.1790874585408; Thu, 01 Oct 2026
 10:09:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001150935.655979-1-mszeredi@redhat.com> <20261001150935.655979-5-mszeredi@redhat.com>
In-Reply-To: <20261001150935.655979-5-mszeredi@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 1 Oct 2026 19:09:32 +0200
X-Gm-Features: AclHuK9nuV0RaVWmbG-anRzzaRQN-OQPaWaI6T2wMRNbUW7396KBL-OwgCATbk4
Message-ID: <CAOQ4uxgyCo0-YAgwqu-3CAo+6hVOtSc9W1qJX5gZAz4YgpLM1Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] fuse: support opening 64 bit backing ID
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 5:09=E2=80=AFPM Miklos Szeredi <mszeredi@redhat.com>=
 wrote:
>
> Add backing_id_64 field to fuse_open_out to allow opening files with
> 64-bit server-allocated backing IDs.
>
> When the server sets FUSE_BACKING_ID_64 in open_out.open_flags, the
> kernel reads the backing ID from open_out.backing_id_64 instead of
> open_out.backing_id.
>
> The open reply is now variable-length for backward compatibility with
> servers that don't send the new backing_id_64 field.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/fuse/dir.c             |  3 ++-
>  fs/fuse/file.c            |  6 +++++-
>  fs/fuse/fuse_i.h          |  2 +-
>  fs/fuse/iomode.c          | 34 ++++++++++++++++++++++++++++------
>  fs/fuse/passthrough.c     | 28 ++++++----------------------
>  include/uapi/linux/fuse.h |  2 ++
>  6 files changed, 44 insertions(+), 31 deletions(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index f48fafccce4b..874ec7cfffb1 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -876,6 +876,7 @@ static int fuse_create_open(struct mnt_idmap *idmap, =
struct inode *dir,
>         args.out_args[0].value =3D &outentry;
>         /* Store outarg for fuse_finish_open() */
>         outopenp =3D &ff->args->open_outarg;
> +       args.out_argvar =3D true; /* compat */
>         args.out_args[1].size =3D sizeof(*outopenp);
>         args.out_args[1].value =3D outopenp;
>
> @@ -885,7 +886,7 @@ static int fuse_create_open(struct mnt_idmap *idmap, =
struct inode *dir,
>
>         err =3D fuse_simple_idmap_request(idmap, fm, &args);
>         free_ext_value(&args);
> -       if (err)
> +       if (err < 0)
>                 goto out_free_ff;
>
>         err =3D -EIO;
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 92976906ab05..1036c06fe35a 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -28,6 +28,7 @@ static int fuse_send_open(struct fuse_mount *fm, u64 no=
deid,
>  {
>         struct fuse_open_in inarg;
>         FUSE_ARGS(args);
> +       int res;
>
>         memset(&inarg, 0, sizeof(inarg));
>         inarg.flags =3D open_flags & ~(O_CREAT | O_EXCL | O_NOCTTY);
> @@ -45,10 +46,13 @@ static int fuse_send_open(struct fuse_mount *fm, u64 =
nodeid,
>         args.in_args[0].size =3D sizeof(inarg);
>         args.in_args[0].value =3D &inarg;
>         args.out_numargs =3D 1;
> +       args.out_argvar =3D true; /* compat */
>         args.out_args[0].size =3D sizeof(*outargp);
>         args.out_args[0].value =3D outargp;
>
> -       return fuse_simple_request(fm, &args);
> +       res =3D fuse_simple_request(fm, &args);
> +
> +       return res < 0 ? res : 0;
>  }
>
>  struct fuse_file *fuse_file_alloc(struct fuse_mount *fm, bool release)
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 003ef3c35d7a..59afebc3dd2b 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1314,7 +1314,7 @@ static inline struct fuse_backing *fuse_inode_backi=
ng_set(struct fuse_inode *fi,
>  #endif
>  }
>
> -struct fuse_backing *fuse_passthrough_open(struct file *file, int backin=
g_id);
> +int fuse_passthrough_open(struct file *file, struct fuse_backing *fb);
>  void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing =
*fb);
>
>  static inline bool fuse_is_passthrough(struct fuse_file *ff)
> diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
> index 1a10bc65fb31..811ea603b776 100644
> --- a/fs/fuse/iomode.c
> +++ b/fs/fuse/iomode.c
> @@ -160,7 +160,9 @@ static int fuse_file_passthrough_open(struct inode *i=
node, struct file *file)
>  {
>         struct fuse_file *ff =3D file->private_data;
>         struct fuse_conn *fc =3D get_fuse_conn(inode);
> +       struct fuse_open_out *outarg =3D &ff->args->open_outarg;
>         struct fuse_backing *fb;
> +       u64 backing_id;
>         int err;
>
>         /* Check allowed conditions for file open in passthrough mode */
> @@ -170,18 +172,38 @@ static int fuse_file_passthrough_open(struct inode =
*inode, struct file *file)
>         if (ff->open_flags & ~FOPEN_PASSTHROUGH_MASK)
>                 return fuse_EIO("conflicting open flags");
>
> -       fb =3D fuse_passthrough_open(file, ff->args->open_outarg.backing_=
id);
> -       if (IS_ERR(fb))
> -               return PTR_ERR(fb);
> +       if (!fc->backing_id_64) {
> +               if (outarg->backing_id_64 !=3D 0)
> +                       return fuse_EIO("64 bit backing ID set");
> +
> +               backing_id =3D outarg->backing_id;
> +               if (backing_id <=3D 0)
> +                       return fuse_EIO("invalid backing ID");
> +       } else {
> +               if (outarg->backing_id !=3D 0)
> +                       return fuse_EIO("32 bit backing ID set");
> +
> +               backing_id =3D outarg->backing_id_64;
> +       }
> +       fb =3D fuse_backing_lookup(fc, backing_id);
> +       if (!fb)
> +               return fuse_EIO("backing not found");
> +
> +       err =3D fuse_passthrough_open(file, fb);
> +       if (err)
> +               goto backing_put;
>
>         /* First passthrough file open denies caching inode io mode */
>         err =3D fuse_file_uncached_io_open(inode, ff, fb);
> -       if (!err)
> -               return 0;
> +       if (err)
> +               goto passthrough_release;
> +
> +       return 0;
>
> +passthrough_release:
>         fuse_passthrough_release(ff, fb);
> +backing_put:
>         fuse_backing_put(fb);
> -
>         return err;
>  }
>
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index 313c8d7ffc09..4894842ad6d0 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -150,41 +150,25 @@ ssize_t fuse_passthrough_mmap(struct file *file, st=
ruct vm_area_struct *vma)
>
>  /*
>   * Setup passthrough to a backing file.
> - *
> - * Returns an fb object with elevated refcount to be stored in fuse inod=
e.
>   */
> -struct fuse_backing *fuse_passthrough_open(struct file *file, int backin=
g_id)
> +int fuse_passthrough_open(struct file *file, struct fuse_backing *fb)
>  {
>         struct fuse_file *ff =3D file->private_data;
> -       struct fuse_conn *fc =3D ff->fm->fc;
> -       struct fuse_backing *fb =3D NULL;
>         struct file *backing_file;
>
> -       if (fc->backing_id_64)
> -               return ERR_PTR(fuse_EIO("incompatible backing version"));
> -
> -       if (backing_id <=3D 0)
> -               return ERR_PTR(fuse_EIO("invalid backing_id"));
> -
> -       fb =3D fuse_backing_lookup(fc, backing_id);
> -       if (!fb)
> -               return ERR_PTR(fuse_EIO("backing not found"));
> -
>         /* Allocate backing file per fuse file to store fuse path */
>         backing_file =3D backing_file_open(file, file->f_flags,
>                                          &fb->file->f_path, fb->cred);
> -       if (IS_ERR(backing_file)) {
> -               fuse_backing_put(fb);
> -               return ERR_PTR(fuse_EIO("failed to open backing file (%ld=
)", PTR_ERR(backing_file)));
> -       }
> +       if (IS_ERR(backing_file))
> +               return fuse_EIO("failed to open backing file (%ld)", PTR_=
ERR(backing_file));
>
>         ff->passthrough =3D backing_file;
>         ff->cred =3D get_cred(fb->cred);
>
> -       pr_debug("%s: backing_id=3D%d, fb=3D0x%p, backing_file=3D0x%p\n",=
 __func__,
> -                backing_id, fb, ff->passthrough);
> +       pr_debug("%s: backing_id=3D%llu, fb=3D0x%p, backing_file=3D0x%p\n=
", __func__,
> +                fb->backing_id, fb, ff->passthrough);
>
> -       return fb;
> +       return 0;
>  }
>
>  void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing =
*fb)
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index c88d7094af44..60fb2add5e12 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -254,6 +254,7 @@
>   *  - add FUSE_PASSTHROUGH_V2
>   *  - add FUSE_DEV_IOC_BACKING_CREATE, struct fuse_backing_create_in
>   *  - add FUSE_NOTIFY_BACKING_REMOVE, struct fuse_notify_backing_remove_=
out
> + *  - add backing_id_64 to fuse_open_out
>   */
>
>  #ifndef _LINUX_FUSE_H
> @@ -841,6 +842,7 @@ struct fuse_open_out {
>         uint64_t        fh;
>         uint32_t        open_flags;
>         int32_t         backing_id;
> +       uint64_t        backing_id_64;
>  };
>
>  struct fuse_release_in {
> --
> 2.54.0
>
