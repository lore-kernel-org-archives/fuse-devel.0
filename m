Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4C85304DA
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 08:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066684; cv=pass; b=JUGgr2t198ZiTa/FhoB1s/jwQU495yepQ10OIM4yWDoWpgr1427HogzB7UFUYulVua/M8EXmGYSyfG61cojwqkRE3zbgnJKeMopHnvdHMH/TTcgQ8Il23PzKtodFl0gJlT6sw9wFajGkZCxc0seigOkUBeaMKFbXvSCuwKuMldo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066684; c=relaxed/simple;
	bh=Cxp4UExwft7Xni54ZZarbUinK7xAJcgN3yrLBAwzq7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BzpjXbm5Rlo0sffco81cEwFEJQS+tSGJGdcAmq6z2CZSwYUrsqloagmBwgcnvNK35OTqD84rEHmFWWmEdbDLqVt57xC7RcI7+/QBml9J+UT5nBqxHd6Cpuzrx6yT03Dweb13tQkHAMCcBuxL1FxeDsyTVudJ+0ClyBjLpXWe6AM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sRqKElPZ; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRqKElPZ"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c254fa663bfso587753266b.1
        for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 01:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790066681; cv=none;
        d=google.com; s=arc-20260327;
        b=jFXp7WdbfKrR3dIW5rsJzYtBOisw7ZQQI7WboVQ9y1FlPeK1NZCvhMqR/eEncmpOoe
         zuQh2tULlP5FtyTlwogTidtZ3bPDuaUZCifrGICEisrCcEH0sH8if3+IizAThFeV3F7d
         NQpf+F+lnqLo4dhLGz9Vbcwxs0DETcnDK4dWRmfWfP+PMabSbDsTUPB1kiX3tHpyUDN8
         WR44PyUIbKYDPq1TJEj4yKjY4RmdNyCSwUHV042boM+VfYhy7t4f95sfbv7mFuLWCaYz
         +IiDKLlooMuArF3+9v4OIXo2T2ikYGMV9NJGT57xSS+11MmSGo0lfJdPlfUkQpx4uobw
         cUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=51qHbqEyysYO3Eax4DpRhVQzFGDkiba+QLnbfwmVLr8=;
        fh=LSGkIxL+7O1MPXHhjOsZelXZcZzf1zyb+22wAIOwAjQ=;
        b=BW3rGmYsaieuoI0+j3saQv6a/toF5cwVFQlSLeOo35RyDWTepFO+JzsTBYKSMCqMeh
         gyR/sRAmgsGSBfPr8/UjDkUgIFfXvhyfE+UHbpFxlqY8okMVlXlMpOQE63y5sVLk+C28
         II/5VufFEUoTK2XvxsgW3X3cefYTH6Frzz+fvQmM9BWHCHBLLv41vZ7p7mlvF7YU8VyA
         iKqzcr+Hg18C5TqsO+GLzo7RzuhOzERa9UxG3J0AEPG0qNzY2PGDEVA9G3r+i3GrRy9n
         6VsAmLDiynPFu4pjzeUG6C0Ps2PqruX0fRCYoYeBB68hVrd16xugSpAjhK1VifC4ZBI5
         UwDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066681; x=1790671481; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=51qHbqEyysYO3Eax4DpRhVQzFGDkiba+QLnbfwmVLr8=;
        b=sRqKElPZARgLSEMJ804+MNYyCWwET7BvDvVq4NgjAuAULJG6JXqM6h0ESfy7GGpGiT
         L5aFWl8y5VIgXgn79jmclZ4QnBnEYfT3jm6sc8nkGm+kEAN9emAd/GfSeWIAWSAofiGz
         BYsVVpwrkrW5EIBK+9ZyzycNVBGNUuq4R18qqVWWvsZxtwNgonYGYQVNGWAhGRi8Puz6
         qTMohSC4BODKhPzL9nLBSwKK/jcJnfJLNjNryZFRZapNDPDpMnhkIE9yvSkshKnxOtWJ
         VGX4PiSF8+ScQ5NVku0+aQTS8rowwf/TO8JiHGSEP7ycF/CxycjwlmNBhYF9Mn4UUAY6
         k/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066681; x=1790671481;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51qHbqEyysYO3Eax4DpRhVQzFGDkiba+QLnbfwmVLr8=;
        b=zY+9xowIPP1Mt5NXpVAYS7cR9FQjmWM0EEmIL3ZfNSQdXiLkLpzSsIPj+sVkKeBJ5n
         LlyXTWEg7x3eDLSA1OiE16BrQE251T42XaQVwpAUcI9TyLy5h1ONQYaYdPxm941OU+ut
         7wgPGk2p+yKVO49iR0iyPFTzeKL2pvzCZymfIw0hfKF/9ATeyV1b24lLQ3Hu6M+l5V43
         /mtBq7ntjeJar0Q/mekXRKKnz7RDy5UURzqcebgRbEXFJp4AlAsmHEuj6CCZTaAQ0Cx/
         CbEKX5/Q7IEHXgQTQr9CncK0P4nuTk70c4ezudW5DWP4pSZcF5aAz+F5/A9LTaMds4gg
         TkSA==
X-Gm-Message-State: AFuF++ljhV6bdZ9c2pu6oMj7hlJTf7gEiv4TmqIefWhXv33x1Ca+qSfC
	hKm4VsWE2mCiMg1YHgoAXXbyLm7E+yi60oEsI2Ib+MzgVKMeryhOFCLb6/YNhFHGB+ROdjGcKYT
	FUNLDwSwbojhc7UTYM17h1EW9elfKRRAwRM+2NeE=
X-Gm-Gg: AYBFou0CyZGiWS30dKdfWOw+MXjkFG4JUKT8LkpfvskEis62AO5HZvkTHQfe4thgdwd
	SrM/j+DrOgjWovWm0dJNx1/quU0oupm2I0TvZpXiW5pMXCygwoRwfNBCmJXkyS0VW5yDsuhtVUj
	MpHqVmpFJEXnI2+6BE6GdqUijD9wcvZNsn2cX1y0IEpJJ1WT1Ts6mAqp9L2CB7FPuN0eJ3Yi4js
	so2859T/unGrBWrJzub+TC5OJpkoNAE33nKOT2ViqVapBRcV7coF9Q4Nr5j9mCb8jMBpBIN5TcK
	gom8EhZkGBJAivzAuvkgUZdEBw6aCWX32igQS0clP1S1Th2e5O0ebRgF
X-Received: by 2002:a17:907:9725:b0:c29:f5d5:5a92 with SMTP id
 a640c23a62f3a-c2a158125cfmr1128075966b.28.1790066680454; Tue, 22 Sep 2026
 01:44:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-4-mszeredi@redhat.com>
In-Reply-To: <20260922061019.3320196-4-mszeredi@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 22 Sep 2026 10:44:28 +0200
X-Gm-Features: AcwNN1V-SVz7NtD8E9g030zofjrskNaq293Kha5D07oTjwYqX79w_0t5aQKNMRc
Message-ID: <CAOQ4uxg7CnO9k23C2RvNt7Wshs-PY92pBUqHUADXmabkLT2yHQ@mail.gmail.com>
Subject: Re: [PATCH 03/11] fuse: don't assume ff->passthrough is set for FOPEN_PASSTHROUGH
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> Following patch will introduce extent map passthrough mode, where
> ff->passthrough is not set.
>
> Check if in passthrough mode via FOPEN_PASSTHROUGH instead.
>
> No functional change.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/fuse/file.c        | 12 ++++++------
>  fs/fuse/fuse_i.h      |  8 ++------
>  fs/fuse/passthrough.c | 13 +++++++++++--
>  3 files changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 1eadeca0c47d..af26de78a199 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -311,7 +311,7 @@ static void fuse_prepare_release(struct fuse_inode *f=
i, struct fuse_file *ff,
>         struct fuse_conn *fc =3D ff->fm->fc;
>         struct fuse_release_args *ra =3D &ff->args->release_args;
>
> -       if (fuse_file_passthrough(ff))
> +       if (fuse_is_passthrough(ff))
>                 fuse_passthrough_release(ff, fuse_inode_backing(fi));
>
>         /* Inode is NULL on error path of fuse_create_open() */
> @@ -1842,7 +1842,7 @@ static ssize_t fuse_file_read_iter(struct kiocb *io=
cb, struct iov_iter *to)
>         /* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
>         if (ff->open_flags & FOPEN_DIRECT_IO)
>                 return fuse_direct_read_iter(iocb, to);
> -       else if (fuse_file_passthrough(ff))
> +       else if (fuse_is_passthrough(ff))
>                 return fuse_passthrough_read_iter(iocb, to);
>         else
>                 return fuse_cache_read_iter(iocb, to);
> @@ -1863,7 +1863,7 @@ static ssize_t fuse_file_write_iter(struct kiocb *i=
ocb, struct iov_iter *from)
>         /* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
>         if (ff->open_flags & FOPEN_DIRECT_IO)
>                 return fuse_direct_write_iter(iocb, from);
> -       else if (fuse_file_passthrough(ff))
> +       else if (fuse_is_passthrough(ff))
>                 return fuse_passthrough_write_iter(iocb, from);
>         else
>                 return fuse_cache_write_iter(iocb, from);
> @@ -1879,7 +1879,7 @@ static ssize_t fuse_splice_read(struct file *in, lo=
ff_t *ppos,
>
>         if (ff->open_flags & FOPEN_DIRECT_IO)
>                 return copy_splice_read(in, ppos, pipe, len, flags);
> -       else if (fuse_file_passthrough(ff))
> +       else if (fuse_is_passthrough(ff))
>                 return fuse_passthrough_splice_read(in, ppos, pipe, len, =
flags);
>         else
>                 return filemap_splice_read(in, ppos, pipe, len, flags);
> @@ -1891,7 +1891,7 @@ static ssize_t fuse_splice_write(struct pipe_inode_=
info *pipe, struct file *out,
>         struct fuse_file *ff =3D out->private_data;
>
>         /* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
> -       if (fuse_file_passthrough(ff) && !(ff->open_flags & FOPEN_DIRECT_=
IO))
> +       if (fuse_is_passthrough(ff) && !(ff->open_flags & FOPEN_DIRECT_IO=
))
>                 return fuse_passthrough_splice_write(pipe, out, ppos, len=
, flags);
>         else
>                 return iter_file_splice_write(pipe, out, ppos, len, flags=
);
> @@ -2406,7 +2406,7 @@ static int fuse_file_mmap(struct file *file, struct=
 vm_area_struct *vma)
>          * in passthrough mode, either mmap to backing file or fail mmap,
>          * because mixing cached mmap and passthrough io mode is not allo=
wed.
>          */
> -       if (fuse_file_passthrough(ff))
> +       if (fuse_is_passthrough(ff))
>                 return fuse_passthrough_mmap(file, vma);
>         else if (fuse_inode_backing(get_fuse_inode(inode)))
>                 return -ENODEV;
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 77ccd5b2059b..b7d8751ba2e0 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1313,13 +1313,9 @@ static inline struct fuse_backing *fuse_inode_back=
ing_set(struct fuse_inode *fi,
>  struct fuse_backing *fuse_passthrough_open(struct file *file, int backin=
g_id);
>  void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing =
*fb);
>
> -static inline struct file *fuse_file_passthrough(struct fuse_file *ff)
> +static inline bool fuse_is_passthrough(struct fuse_file *ff)
>  {
> -#ifdef CONFIG_FUSE_PASSTHROUGH
> -       return ff->passthrough;
> -#else
> -       return NULL;
> -#endif
> +       return IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) && (ff->open_flags & F=
OPEN_PASSTHROUGH);
>  }
>
>  ssize_t fuse_passthrough_read_iter(struct kiocb *iocb, struct iov_iter *=
iter);
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index f2d08ac2459b..b43d3e0f7081 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -11,6 +11,10 @@
>  #include <linux/backing-file.h>
>  #include <linux/splice.h>
>
> +static inline struct file *fuse_file_passthrough(struct fuse_file *ff)
> +{
> +       return ff->passthrough;
> +}
>  static void fuse_file_accessed(struct file *file)
>  {
>         struct inode *inode =3D file_inode(file);
> @@ -187,10 +191,15 @@ struct fuse_backing *fuse_passthrough_open(struct f=
ile *file, int backing_id)
>
>  void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing =
*fb)
>  {
> +       struct file *backing_file =3D fuse_file_passthrough(ff);
> +
>         pr_debug("%s: fb=3D0x%p, backing_file=3D0x%p\n", __func__,
> -                fb, ff->passthrough);
> +                fb, backing_file);
> +
> +       if (!backing_file)
> +               return;
>
> -       fput(ff->passthrough);
> +       fput(backing_file);
>         ff->passthrough =3D NULL;
>         put_cred(ff->cred);
>         ff->cred =3D NULL;
> --
> 2.54.0
>
