Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F97518143
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071110; cv=pass; b=fKaFPzdgk2H2kT0icL57eolHUi1LXxjZsdHTvdK0BTxzRKa/Z9bQptVYFz6Dtdjdjf7KUh5aaYr+orirYaKdlTB1nAA3eB43zQT8U7AjPgIamq4GSW8TpriW5EDG8zcsvUfZtfqVTpuuds1vTlJbxBzkAgx43o7f4ADStSHJLj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071110; c=relaxed/simple;
	bh=fpFfavhY4Ld6zsimUs6FxleR3zHFTiOZmtgZHZp6DGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSapnlSoDyVampfRx57eJDNEZ/u2RH8Aw5ASjaihUvm0FZsEDfjrof1+Ees93Au0lZtWnPU91/NPJDLZQCXr4j/lOcM1ILOCZ/dC3QwI1nQ0smo67r2/aMMuP4t8L05bGgRT1XciXXF1r7k0LazpbhhyBMWjXRPpbeirubEUztQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DT4J+/dT; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DT4J+/dT"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f5603a0so526041866b.0
        for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 02:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790071107; cv=none;
        d=google.com; s=arc-20260327;
        b=qgksZK+W5ChrAaeh1iRJZCcAsP/ZTGXwwcxvSzFV0lTrDopdLyJOSkR3i//N+vAxzc
         o6nTFcEm23tTZwjtyB8YkWhtXtSY23wd+t5YvMrZTE6zDMSW/4KHXcIuOb00u+sch7St
         EE7r8OhCWxc3qQhfcVZVoURxKCju4nIjVGsSCoR4Lta6bf1eytZpBsjeI2Os+UldGghd
         kxkutpI6MrjWsKPXywZogGnxc9MWccMwugn6U9qtdmhPlVbx9yPIwRVtvw/lUmJFProC
         ajKTNbW8tvHD7seCIBO1Ebf1CAXEEGBuIQqoj+o7osD4NeI+0RfqY9FNMGSbNaZB4uRp
         zRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bsjZLyDSmBG5WDZx7klXSm7ilvo9ofWKt2PkPe0hARg=;
        fh=LSGkIxL+7O1MPXHhjOsZelXZcZzf1zyb+22wAIOwAjQ=;
        b=I8jAApq0HRtff9CAfJ01CZ8CZqqGPJwPs6muN5tJaNmAi+/mMXaomI0y8WeNAOZcwu
         d+RBzwv6JBJDmqLZNAw9oL8kZa5its+ZRd15eCwhkor3I5gqvmczptm1hQko4V4yaYUb
         rtiXC2/B8GTZBPUGTrsjMJCwEwI8CTR38hIH0DW9pB98m1xvnfKrOZdi1yVYYT6L6Ep5
         6rvjOUB+ULgUx32cFw92MbhpgHBxdVo8Y4ppat3qT/JEbFgVattQCBd8RxuwA5XCM+Q5
         JtPS+2KLN5MpB00wotGGTnYpyuF1PYbP+GB8oD7ew6eg9qbk49oXH3juG9RyeYLQwolz
         7WLQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790071107; x=1790675907; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsjZLyDSmBG5WDZx7klXSm7ilvo9ofWKt2PkPe0hARg=;
        b=DT4J+/dT69KPSRddKrZC3O34xHfGw2BAi+I/xDaEwcmi0mhd2a++1VsBVMxfaKwS+z
         Ra+GTSyZ31GU5XI4EBydFp+op88KtUj60Ule1m1EHLhsVf4M9fz2yi6qBGrAk8t0N4HD
         O1Ohdtg17PeZuTuYBCUsIQHp+yu9FwDYy6IGGxwGC94XbFGc/WWo1rCmvtLsQxCnmLyh
         qcEzmdRg7YfYbozfS8ZxcYdzw9nKH+mqs3CtnstFnHF2Y4XSfdmVPL5/gEtjE2ypjkwU
         lJNrit1Suic9qet76t4eKMEre3vDlhi1BKyb7lM2qG72T7UTMk8U4jzOpkKGJ9p9GprT
         V61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071107; x=1790675907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsjZLyDSmBG5WDZx7klXSm7ilvo9ofWKt2PkPe0hARg=;
        b=rLWspAvhTIqcq7heluZwRILK4nfXlDw5pU0TbjzRAPOG3B+TLriVTQB+Q/n7pYU1D7
         KGWhi9om7PS3WFYQjtU4boLzoqYAF23MI8PhrsoKsK7golDHkCSB6r8W/fwqfXzoUPZ9
         HU3oYLW4LMdCnGmh336pZQUJUaqA3ZW3oSvSPXXm5CjqdRZCxRUs4sviOXB7ASe/6MLD
         4Y41qZTxV5Qa1MjednHlpWCu5fByQbyo+vuhbqTAHt41fwwZUtLuHd/j6xlq3xWCaEkK
         5WZ+6R1586I0JbyBWdLaXQ7NSR7d06aUrnq2cLVVnusj9K7PRwKi6ZQaMe3awTTyNdus
         Vn1w==
X-Gm-Message-State: AFuF++mCaPT/XDOues7NdTtbmje5TKP98oNazGAogY39DfM1Y878QWS5
	4xBti4o97ymbMJccS1I0+nOm/ykRK+D8QVNfJxA4r6lZBCU5Z3gh9hHaswoF5ItZd6/xJP6YkTe
	c1sPoxDCQc9jSJiPOf3FBK5JI0veLQavWZJoJgqc=
X-Gm-Gg: AYBFou2OvwdYl/fFD9SFZgWf/7weOMh7fJWfL+hgewtwaQWH6F+64gFrvNLkCdYhPC/
	7QAJo8CHNWuhu0zLsfruqaCoqoW/PsptFRU35nlXV1NtmeC1Fuogqb21xI0gv28TkM4Su9lq1tG
	Yd0unyF3WXRofifKIfiqYkcr5bNHfgQqG2A9YEDKeniSow4JvMs4h8g/Gu4FS4/NgqXVB48ox3N
	+vSlC3reLWURTAX2n/CcvS/j6T4UueHFRjB7H28bCUHe3fe/6z2vn0EeNB0sUBla7YOSnQXtTap
	M23njtio6MjRcFkH6viKxMVFqMTxWOBrtKZhzt4pgNsLQlSPZB+QLzEB
X-Received: by 2002:a17:907:c28:b0:c28:e01d:1d08 with SMTP id
 a640c23a62f3a-c2a15e1d305mr1306403666b.49.1790071106518; Tue, 22 Sep 2026
 02:58:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-6-mszeredi@redhat.com>
In-Reply-To: <20260922061019.3320196-6-mszeredi@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 22 Sep 2026 11:58:14 +0200
X-Gm-Features: AcwNN1WBzCro4Mw62rC6xS4zHQ6LCUnolaJfMmmFc-tqWPe8KFLX_GIvIPVz3mY
Message-ID: <CAOQ4uxjv1rm+_5rbj0vv3nNSXZxN8TVY8=90qNY4-_25OfDYGg@mail.gmail.com>
Subject: Re: [PATCH 05/11] fuse: add helpers for EIO return value with kernel message
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> Conditions are triggered by a buggy fuse server will result in -EIO which
> is hard to interpret without any context.
>
> Add helpers that print a short message to the kernel log as well as
> returning the error value.  This serves a dual purpuse:
>
>  - documents the error condition inside the code
>
>  - allows the implementor of the fuse server to get the context for the
>    error
>
> Some debug messages are removed in favor of this.
>
> Currently these use the pr_notice_once() variant.  Possibly should be
> changed to a ratelimit of e.g. once per minute.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/fuse_i.h      |  6 ++++++
>  fs/fuse/iomode.c      | 26 ++++++++------------------
>  fs/fuse/passthrough.c | 16 ++++------------
>  3 files changed, 18 insertions(+), 30 deletions(-)
>
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 6cd556a0aa59..b698857dfe13 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -11,6 +11,12 @@
>  # define pr_fmt(fmt) "fuse: " fmt
>  #endif
>
> +#define fuse_EIO(msg) (pr_notice_once("%s: %s\n", __func__, msg), -EIO)
> +#define fuse_err_EIO(msg, err) (pr_notice_once("%s: %s (%d)\n", __func__=
, msg, (int) (err)), -EIO)
> +
> +#define fuse_ptr_EIO(msg) ERR_PTR(fuse_EIO(msg))
> +#define fuse_err_ptr_EIO(msg, err) ERR_PTR(fuse_err_EIO(msg, err))
> +
>  #include "args.h"
>  #include <linux/fuse.h>
>  #include <linux/fs.h>
> diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
> index 79637c09e883..c25ac580c811 100644
> --- a/fs/fuse/iomode.c
> +++ b/fs/fuse/iomode.c
> @@ -122,7 +122,7 @@ static int fuse_file_uncached_io_open(struct inode *i=
node,
>
>         err =3D fuse_inode_uncached_io_start(fi, fb);
>         if (err)
> -               return err;
> +               return fuse_err_EIO("failed to start uncached I/O", err);
>
>         WARN_ON(ff->iomode !=3D IOM_NONE);
>         ff->iomode =3D IOM_UNCACHED;
> @@ -173,9 +173,11 @@ static int fuse_file_passthrough_open(struct inode *=
inode, struct file *file)
>         int err;
>
>         /* Check allowed conditions for file open in passthrough mode */
> -       if (!IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) || !fc->passthrough ||
> -           (ff->open_flags & ~FOPEN_PASSTHROUGH_MASK))
> -               return -EINVAL;
> +       if (!IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) || !fc->passthrough)
> +               return fuse_EIO("passthrough not enabled");
> +
> +       if (ff->open_flags & ~FOPEN_PASSTHROUGH_MASK)
> +               return fuse_EIO("conflicting open flags");
>
>         fb =3D fuse_passthrough_open(file, ff->args->open_outarg.backing_=
id);
>         if (IS_ERR(fb))
> @@ -212,7 +214,7 @@ int fuse_file_io_open(struct file *file, struct inode=
 *inode)
>          */
>         err =3D -EINVAL;

@@ -245,8 +245,9 @@ int fuse_file_io_open(struct file *file, struct
inode *inode)
        /*
         * Server is expected to use FOPEN_PASSTHROUGH for all opens of an =
inode
         * which is already open for passthrough.
+        * Using incorrect open mode is a server mistake, which results in
+        * user visible failure of open() with EIO error.
         */
-       err =3D -EINVAL;
        if (fuse_inode_backing(fi) && !(ff->open_flags & FOPEN_PASSTHROUGH)=
)

>         if (fuse_inode_backing(fi) && !(ff->open_flags & FOPEN_PASSTHROUG=
H))
> -               goto fail;
> +               return fuse_EIO("FOPEN_PASSTHROUGH expected");
>
>         /*
>          * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO.
> @@ -236,20 +238,8 @@ int fuse_file_io_open(struct file *file, struct inod=
e *inode)
>                 err =3D fuse_file_passthrough_open(inode, file);
>         else
>                 err =3D fuse_file_cached_io_open(inode, ff);
> -       if (err)
> -               goto fail;
> -
> -       return 0;
>
> -fail:
> -       pr_debug("failed to open file in requested io mode (open_flags=3D=
0x%x, err=3D%i).\n",
> -                ff->open_flags, err);
> -       /*
> -        * The file open mode determines the inode io mode.
> -        * Using incorrect open mode is a server mistake, which results i=
n
> -        * user visible failure of open() with EIO error.
> -        */
> -       return -EIO;

The reason for EIO is not immediately apparent so suggest to move this
comment up and remove moot err =3D -EINVAL;

> +       return err;
>  }
>
>  /* No more pending io and no new io possible to inode via open/mmapped f=
ile */
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index b43d3e0f7081..0e2e1066b984 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -159,34 +159,26 @@ struct fuse_backing *fuse_passthrough_open(struct f=
ile *file, int backing_id)
>         struct fuse_conn *fc =3D ff->fm->fc;
>         struct fuse_backing *fb =3D NULL;
>         struct file *backing_file;
> -       int err;
>
> -       err =3D -EINVAL;
>         if (backing_id <=3D 0)
> -               goto out;
> +               return fuse_ptr_EIO("invalid backing_id");
>
> -       err =3D -ENOENT;
>         fb =3D fuse_backing_lookup(fc, backing_id);
>         if (!fb)
> -               goto out;
> +               return fuse_ptr_EIO("backing not found");
>
>         /* Allocate backing file per fuse file to store fuse path */
>         backing_file =3D backing_file_open(file, file->f_flags,
>                                          &fb->file->f_path, fb->cred);
> -       err =3D PTR_ERR(backing_file);
>         if (IS_ERR(backing_file)) {
>                 fuse_backing_put(fb);
> -               goto out;
> +               return fuse_err_ptr_EIO("failed to open backing file", PT=
R_ERR(backing_file));
>         }
>
> -       err =3D 0;
>         ff->passthrough =3D backing_file;
>         ff->cred =3D get_cred(fb->cred);
> -out:
> -       pr_debug("%s: backing_id=3D%d, fb=3D0x%p, backing_file=3D0x%p, er=
r=3D%i\n", __func__,
> -                backing_id, fb, ff->passthrough, err);

Why remove this pr_debug of the success branch?
it is used as a debugging trace for the lifetime and usage of backing files=
.

Thanks,
Amir.
