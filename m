Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CDA255F28
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058613; cv=pass; b=WcYregQeYyPjYPJLHBKwTYKPZ6pKC0YnFZdthAn+QAMMGCuCiMyV1H3pMUJiNjDBGoSuXlrDPmTGAb+4pW0Zh+fne3HrXQO3ZMs4yWLAk+RSwMXz49BoTrXPtIkPG61xlW8+EXHCrLhV+MmlLznlQNIC0a/6qS+jA7GdkIzG6os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058613; c=relaxed/simple;
	bh=73gAlgpoJyy1D7VzXCf22FlOlZS5/jAqPmtYq5Tn1kk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nOjKKz4fdFtWd0d6jmaOozGBtkWFTUEgGzt4gk4Ggvjp8BKfwOoBiUDhcPSbOniGwdqsjf/+3TSfDgTuqkxGirKtYVxr/np+HOQHcY3gikIIg1H+3FxmTKZY4lJOjrkyhWgd0SOjCPmqX2S3nhL9sc6hdpUMC+Tr6NSzz5iKZAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jhboaiy5; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jhboaiy5"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a36982a875so6116802a12.0
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 06:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787058610; cv=none;
        d=google.com; s=arc-20260327;
        b=ep8fAWoMMFDOG2OHSub8nYu8Uic8fHMZPUy5X1hxXtvyaL3AotGKCCoAAQHBrxvuLl
         f0ysswQnkoe5cnOAFkK8Mx92b0DZ4jysPeTFFSvw6xi3hvVqwMCbQu225r+AvS7oniPt
         MIzE/LCu0l7WPAXNKAxiZO5OQSP6K92xlf1TW4Mkh8PSOLwquO49PplDxyCoL8PY1LJW
         J2X7C7UEZkiNQDXEoofQ6BuQhZPtVNqb05UA8c4ODhiZK6QExw82C0bLuOxzuWlvfxcb
         3kk7rXxodOSALZxbQrQgrkagDSicDj8R0t2AF2KqgI9hTfchA7RFnS2yrPMBViNTCWG2
         BUhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dGG09TZgpGEihO9jRJv0GpS2z8N8d+8AwbLPkXQ4xj8=;
        fh=f/oqMgAa1XdHcjPSsvZdl8PyKE3v/S3rtKz2UAK5SJ0=;
        b=Qxd6OHPL6jyNWI/8xO9B9h2tCdcJEvx2R8sdcPo6qaF45Q6R1MYiZo88vdhl4fbz1H
         9CnMO03iivCC4wV3KjPyrQizIq9wG8Vm8J/dKXZKaUvjqmdTSc3eKHRvjGVcZ56r4kri
         Zszr7wLPTwywvwGTiiogARE5onUYkq9L2N/EJzXPSi5vnd/zz4cUNrreBAEvfCMyuMk1
         dAavQg6cq7B6Jo4pDpMxlLR7GsOkUVFJjCbCu2zulVZnTRsuK0hnP8UbF2rv4V0Y4kBJ
         NHksY9NaObwX/qsWnztTTaeHLK0k7ZLKCUNxUYMjAmEotLyhY4+Uv8LFC5/cUVFk5473
         izLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787058610; x=1787663410; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGG09TZgpGEihO9jRJv0GpS2z8N8d+8AwbLPkXQ4xj8=;
        b=Jhboaiy5AqewJKRcyBTOEn9nwSMlKBqQVyDWt4CIXQH1EADErn25iPK6n4w1vEp/Zy
         hZg2pZSZi8mm4g5TmGCcvWSuhGEqFsGlr8UelVEP/TJ1r+0FUBpzuObvBxXFxkDJ0dRA
         xR0Qv2OTrvemPoIZN8bLE406D20j7JEsNhg+lVwFHEAzDJefss3VRZL+qpTZW+yVQWlX
         O2izURggvCyhNzXPoP7RzXYx6E/gD6v+d578yKilVp9F7X3nzOJ+GA62sPs2ed/J5vav
         97avsXJI9NyF8u6ZfFmlRSFxfFM5i7gO2wTYKeqyqZZ8dZs6OWv89KVlbKQKDwB2ux/6
         FWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058610; x=1787663410;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGG09TZgpGEihO9jRJv0GpS2z8N8d+8AwbLPkXQ4xj8=;
        b=aFFsMmx32A3VZ+oTFEoqWdzjIMwXdhtHsU9qXp5anvJchXbl/Gaau68HsUj1bhoyjp
         CtQeSxl+lnnFxFJf145DHQTPak+62rxfny0ujoG7Kk8AabY1mKugZkwrizt6JPcUaWGQ
         7RmZGiR2Wvo2e1umBjkwdC1keqeH47dCn800WkRxaonb4Krxgc5V0/F4dl4Y3DaOS+qA
         nQ9hn6y4I2s0LfqWPGueEQXFekfLlVf+hjyEUeCyNTZmAS0R1Uih1h/gP02wv7AVteMc
         mNAAv9b8KnHZiVajvCslLIAySYtomcfNmkmGBdkwv94fAL5lCrWSmtJ10lLfFHeI/gcH
         M+xA==
X-Forwarded-Encrypted: i=1; AHgh+Rqnw1fKbVWSYdV64MjRDEXr+/hTmW25aYXgzJ4cwg9iWAO1QpVBV5lvCML9WvTVYS3fIeusptwTrpQu@lists.linux.dev
X-Gm-Message-State: AOJu0YxNl0jOBJJrCqjn8qQRiGNdeGh48sQ0sxBKQSlubLgGUcyTl/CN
	apyNWkkvFWGWPPHGuL3CO39M49SvULkdOGC418ZnPF0VIAtwtXcFp30jT98O4C5pGFAGKH9n5ik
	KYiuqQVyWA9a9ysDlIQ2cg83dDg3mYY4=
X-Gm-Gg: AR+sD10oHJeKN1+83MBgE9uw8Z4EQrYZLlCTit0hF2SqWl+pKg83JAu1OO/zS6G16Zn
	+bCkhIsP3SkAoYZ9HTyXyQ3XJxPF2H6ltgyY1NWF4Lld+bVml+8kEHBtzeZNB4FsCJAGhTbksNn
	Y56+/HPu8YLPBrTWCp6XLvtNCahVBd8hng8Zpps+kMQE/+2gBkxrwJE91jfbT6jr1EFtf5I7b0/
	uVFb09tgO6Wn/WJZFPdcB3KI6wpJ+KrSVBnDGT9nyyMwtIbkS0ijE58mzgSJJXaD/WGFFD2/iC+
	8MdyrJ7kEvMyXKUkRvCU+0hviRKga4Dv8GaVVqvArLW3sik+VTN/pVs5
X-Received: by 2002:a05:6402:2411:b0:6a3:ebe1:c2c2 with SMTP id
 4fb4d7f45d1cf-6a3ebe1c47emr3481370a12.2.1787058609896; Tue, 18 Aug 2026
 06:10:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817141156.6079-1-luis@igalia.com> <20260817141156.6079-6-luis@igalia.com>
In-Reply-To: <20260817141156.6079-6-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 18 Aug 2026 15:09:58 +0200
X-Gm-Features: AcwNN1XX_qer3UzmnYeF7-g6rjmiD1hdkvaAJ3jQKsiCCk6pIgwlzs0nFMRCWP8
Message-ID: <CAOQ4uxgUECPPchwipkH6qg=q1L_Fqg9=_cPOC6wm9TJ27EQqEw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/8] selftests/fuse: factor-out test fixture setup/teardown
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 4:11=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> In order to reduce new tests setup/teardown code duplication, factor-out
> these functions from the existing acl_cache test.

When I read this I thought you were going to share these helpers with the
new symlink and readdir cache tests, but you did not.

Maybe a fuse_common.c would make sense to reduce boiler plate
in new fuse tests.

These helpers and fixture look pretty similar in all three tests.

Thanks,
Amir.


>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../filesystems/fuse/fuse_acl_cache_test.c    | 82 ++++++++++++-------
>  1 file changed, 53 insertions(+), 29 deletions(-)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test=
.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> index 2411a6e285f1..8bdc90572be2 100644
> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> @@ -50,6 +50,8 @@
>
>  #include "kselftest_harness.h"
>
> +#define MAX_ERR_MSG 256
> +
>  /* ---- ACL binary encoding --------------------------------------------=
---- */
>  /*
>   * POSIX ACL v2 xattr format (little-endian):
> @@ -193,52 +195,74 @@ FIXTURE(acl_cache) {
>         pthread_t            thread;
>  };
>
> -FIXTURE_SETUP(acl_cache)
> +int fs_setup(struct fuse_session **se, char *mountpoint, char *file_path=
,
> +            pthread_t *thread, char *err)
>  {
>         char *fuse_argv[] =3D { "fuse_acl_cache_test", NULL };
>         struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
>
> -       g_ds.acl            =3D acl_a;
> -       g_ds.acl_size       =3D sizeof(acl_a);
> -       g_ds.getxattr_count =3D 0;
> -
> -       strcpy(self->mountpoint, "/tmp/acl_cache_test_XXXXXX");
> -       if (!mkdtemp(self->mountpoint))
> -               SKIP(return, "mkdtemp: %s", strerror(errno));
> +       strcpy(mountpoint, "/tmp/acl_cache_test_XXXXXX");
> +       if (!mkdtemp(mountpoint)) {
> +               snprintf(err, MAX_ERR_MSG, "mkdtemp: %s", strerror(errno)=
);
> +               return -1;
> +       }
>
> -       snprintf(self->file_path, sizeof(self->file_path),
> -                "%s/" FILE_NAME, self->mountpoint);
> +       snprintf(file_path, PATH_MAX, "%s/" FILE_NAME, mountpoint);
>
> -       self->se =3D fuse_session_new(&args, &fs_ops, sizeof(fs_ops), NUL=
L);
> -       if (!self->se) {
> -               rmdir(self->mountpoint);
> -               SKIP(return, "fuse_session_new failed");
> +       *se =3D fuse_session_new(&args, &fs_ops, sizeof(fs_ops), NULL);
> +       if (!*se) {
> +               rmdir(mountpoint);
> +               snprintf(err, MAX_ERR_MSG, "fuse_session_new failed");
> +               return -1;
>         }
>
> -       if (fuse_session_mount(self->se, self->mountpoint)) {
> -               fuse_session_destroy(self->se);
> -               rmdir(self->mountpoint);
> -               SKIP(return, "fuse_session_mount failed "
> -                            "(missing fusermount3 or insufficient privil=
eges)");
> +       if (fuse_session_mount(*se, mountpoint)) {
> +               fuse_session_destroy(*se);
> +               rmdir(mountpoint);
> +               snprintf(err, MAX_ERR_MSG, "fuse_session_mount failed "
> +                       "(missing fusermount3 or insufficient privileges)=
");
> +               return -1;
>         }
>
> -       if (pthread_create(&self->thread, NULL, run_daemon, self->se)) {
> -               fuse_session_unmount(self->se);
> -               fuse_session_destroy(self->se);
> -               rmdir(self->mountpoint);
> -               SKIP(return, "pthread_create: %s", strerror(errno));
> +       if (pthread_create(thread, NULL, run_daemon, *se)) {
> +               fuse_session_unmount(*se);
> +               fuse_session_destroy(*se);
> +               rmdir(mountpoint);
> +               snprintf(err, MAX_ERR_MSG, "pthread_create: %s", strerror=
(errno));
> +               return -1;
>         }
>
>         fuse_opt_free_args(&args);
> +
> +       return 0;
> +}
> +
> +static void fs_teardown(struct fuse_session *se, pthread_t thread,
> +                       char *mountpoint)
> +{
> +       fuse_session_exit(se);
> +       fuse_session_unmount(se);
> +       pthread_join(thread, NULL);
> +       fuse_session_destroy(se);
> +       rmdir(mountpoint);
> +}
> +
> +FIXTURE_SETUP(acl_cache)
> +{
> +       char err[MAX_ERR_MSG];
> +
> +       g_ds.acl            =3D acl_a;
> +       g_ds.acl_size       =3D sizeof(acl_a);
> +       g_ds.getxattr_count =3D 0;
> +
> +       if (fs_setup(&self->se, self->mountpoint, self->file_path,
> +                    &self->thread, err))
> +               SKIP(return, err);
>  }
>
>  FIXTURE_TEARDOWN(acl_cache)
>  {
> -       fuse_session_exit(self->se);
> -       fuse_session_unmount(self->se);
> -       pthread_join(self->thread, NULL);
> -       fuse_session_destroy(self->se);
> -       rmdir(self->mountpoint);
> +       fs_teardown(self->se, self->thread, self->mountpoint);
>  }
>
>  static int do_force_statx(const char *path)
