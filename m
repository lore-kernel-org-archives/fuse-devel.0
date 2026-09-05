Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6739749EC5E
	for <fuse-devel@lists.linux.dev>; Sat,  5 Sep 2026 12:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611919; cv=pass; b=cg25UKU13RuiDgikNCVRDj14Hpd3ics6lVV6Km+tBDCZDeHH7gYBrTS9+Ma+QBsj57aFpAgzu9biap+df8ELNAhuPD+3/2pgoU0g6iezxvxjg2oj6Uu7zchnoFxXbpr1RkpsjC5JZGBevAR/8mHkyA1DkpXHpqyJm8tmow6u+uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611919; c=relaxed/simple;
	bh=/VB8kPsUuiESUyZLNaK7eoeQNFH/O0TKNtSOgdqA5sU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTVOuJPGd4kqMSqQgMrnm8KaMg88qhFMYadnl8jxUjpCPzowgyfbgA8XjlUm7URPjqJREBFhYvRxo54h9P3UsSW+Q7JBLmDrVviEvZBm2pu7iFngHY6QJfpDYtIIAiBxcylq2ZIEoQ+s2bPHo/AQzNfUAGLrlwmYozzNVPN+naI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfmAZe2D; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfmAZe2D"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2544ff970dso259729066b.2
        for <fuse-devel@lists.linux.dev>; Sat, 05 Sep 2026 05:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788611915; cv=none;
        d=google.com; s=arc-20260327;
        b=jTYvk7t8VSiw+7rc4hu9RweuOdMcuf651ZHtTG3V6b0qNANSEsAmgLAi7OIP3BXG6E
         UvsHZqiezUD6hZ3o6k5rKqzFRZ+XEX9c5gj/SdzauYkMuG9JW2JZN+PcdDkTI9R+6Aur
         5B7hHVxLhzPRB12akw7DrmsN+zraJTLxlFyx0HMkPLsPao8xmD2hPWoAC74e6tBsyf4P
         /PqEp6fuR+d0Y1NXOwqusMoz/QDKo9lU7JB53q5RIBMQMyNZA8bFJbxTFLwgBJT7rn0x
         tvvAzEQ9gC2mRFKBwK6QAjuH80DRVlZ+gw+aA5sy28/e9KwJ8JhPPaswJkKMRIz4XfBG
         tvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qLG7RD9iU+aimxs8BsGNQGssNd0C+fRBfMsrZlcG8GU=;
        fh=qRgPaMsF0Dehyc+chE7aYqMnuR5xaVRViWazHmHlifo=;
        b=MhfQ70uMw0JILBQVjqAuTYm+IC602Ntm7yc+F1t7psN/i9X9h5wkV+JLA68a+S5bhY
         XK0407xAqudBuIPeRQsHyOt/T+B/78L+NV7XiDTclfyBoElNBqUt/oXWlN9OHMJwZ291
         FTqME7RYv25rccYKnLntSmP5zDcXeNZtN5R9jYTgH4Kitjt8vLeH/RcHjrTuHReXwaAr
         OmnJhpB300a2VARTx10VfYONob95kvyCaRpaedf7KUuVGewCi+aFzeODZiJOmfH0Kjcz
         xwPVo/6437Knwm9OvrOckTE0A6TkK/TEpZjK/ml6/Rvo6TqhEuqB0PsLejioHaIXyWqg
         DAvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611915; x=1789216715; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qLG7RD9iU+aimxs8BsGNQGssNd0C+fRBfMsrZlcG8GU=;
        b=dfmAZe2DD4/GgEKL0UV6BqOCz5nN4xpKjSN5pTDO3RKyhjooTyV5x0+hmFeekdmjL3
         N7ujf2+4QEvdhN7vHVpaDZJyLcEMHk+JZLsC4J+vh9j5Wnsy3M4mv4Hd2WdDtySHm9Nl
         MZE967OJvtW92v1rD6yO61HViG9d73VKpcc2mA5za0pSzsa/+Qj1m+nIZsrofPkA4v0/
         qODpMOuxFUt98EgD5Eif7SmbO32SALlipWW8o/YWLSc0h1rNifC+6VUc4rBEsVrtRiyR
         xqW4yYflTs36WHW4MhEATDDrdRN6XvKH+FegzAnBd3aiiS0gH7zpCRHeFyBXhQJCcaM1
         WTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611915; x=1789216715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qLG7RD9iU+aimxs8BsGNQGssNd0C+fRBfMsrZlcG8GU=;
        b=eoqoxItJdxHuWsF1N5DnbdZj9nAsb3m0vvG2Er9rNh6E0cnw5hHyoQ0WCmCAgWJ8Dz
         4HjZsfBjVS9w/7OkOKr0rCVA8af7PaqsDiu/o5BOgcLW/sjge609xmPaJ2bU/VkX5I58
         jVyzPIJGO0cKXD7nGcU5dDNTMsO1Y7T0TM+kcvDTv8LaErcRlG2xsJpHK11B5izAdgxZ
         9j8RW0CGLe0igBHgJY/ngxJLNUFkAVfaoHAXVk0i4T8REhaWPe8lT7JSCwCgizd+dBaq
         mcluYVprGUCy4ZFgfhxBToQqtHtZ/uGyLRToY6xfDMsxGENzVhmL/bnHFvFbxu87/5cb
         rqWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzITgAccubsqI5VdXQedUW19tIrSZoU15MX+n3bC5kUpOJpJ/I3+yDf50B6I1PB8a/NdZ0DnDEMGgIr@lists.linux.dev
X-Gm-Message-State: AFuF++kgxaH5Naaoi1PV7xHfl3jmSrTLlXCjkh2P1TX6UW/LGC3cpCth
	xn5iKkOFyRVb4ph7AzScW7Vp3CQ9m4f2suaVarNb2PEbRBmT48XyfRwIf2yxyKoqjzAM8mJiS8E
	i7ylZHnL6Myk1yGfge7ZnqN2dcrhNrfY=
X-Gm-Gg: AYBFou3IvRpREvKKF0uJc1pcf8E4MPN/U1GdOtDGQRLeJ/PTUYKcth/j/CxCo+MKqC6
	v4JASfED2BSsW6bT3OL1TAijlB9GSkpOAuAgq8rZHKete3wLLHUOoLfdRJxYGwCqRvGO1KTX/xw
	oBPCDLOYXsUBbSB6fXhDWxSb46MRFxvF3zwDGvgL/trkpJmkwy/DsykzvKsPsE/GuancxvlgVya
	VWJHKpuKPpbshW2ap4BNLdn7YlR5GSLeFpYo7rpBvyD/jgb186wDGw55v0tCgBE/5AUqd/bpYfV
	jJwOW5n8v0Y+s8Hk/orlJpneP8x5dO+KmlK8kUPhvCZg+xdWbavqHVyv
X-Received: by 2002:a17:907:da4:b0:c26:1649:47af with SMTP id
 a640c23a62f3a-c26164955fcmr405970966b.37.1788611915386; Sat, 05 Sep 2026
 05:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-7-luis@igalia.com>
In-Reply-To: <20260904103920.4471-7-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 14:38:24 +0200
X-Gm-Features: AcwNN1WjNoiriBKtkS17brUNdc8C7v-N5CE5oPlkC6f9qSJ0JKBzPQ3mpwZvTEM
Message-ID: <CAOQ4uxhF6qaAxLFt0UP8nBbZTWVVYf_Y7zgL8Lu9xEnJzg=GiA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/8] selftests/fuse: add some extra ACL caching tests
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 12:38=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> This adds some extra tests to ACL caching:
> - Verify that reading ACLs results in the expected number of requests
>   being sent user-space, depending on whether cache is enabled or disable=
d
> - Verify caching behaviour on some caching invalidation scenarios
>
> While there, add test binary to .gitignore.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>  .../filesystems/fuse/fuse_acl_cache_test.c    | 179 ++++++++++++++++++
>  2 files changed, 180 insertions(+)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/=
testing/selftests/filesystems/fuse/.gitignore
> index fb51603fe419..f7f3dd345a50 100644
> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
> @@ -2,3 +2,4 @@
>  fuse_mnt
>  fusectl_test
>  write_extend_eof_test
> +fuse_acl_cache_test
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test=
.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> index c2d6658ff7de..9608a0adb967 100644
> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> @@ -83,6 +83,7 @@ struct daemon_state {
>         uint8_t        *acl;
>         size_t          acl_size;
>         int             getxattr_count;
> +       bool            cache;
>  };
>
>  /*
> @@ -91,9 +92,17 @@ struct daemon_state {
>   */
>  static struct daemon_state g_ds =3D {
>         .lock =3D PTHREAD_MUTEX_INITIALIZER,
> +       .cache =3D false,
>  };
>
>  /* ---- FUSE lowlevel callbacks ----------------------------------------=
---- */
> +static void fs_init(void *userdata, struct fuse_conn_info *conn)
> +{
> +       pthread_mutex_lock(&g_ds.lock);
> +       if (g_ds.cache)
> +               fuse_set_feature_flag(conn, FUSE_CAP_POSIX_ACL);
> +       pthread_mutex_unlock(&g_ds.lock);
> +}
>
>  static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *nam=
e)
>  {
> @@ -115,6 +124,8 @@ static void fs_lookup(fuse_req_t req, fuse_ino_t pare=
nt, const char *name)
>         e.attr.st_ino     =3D FILE_INO;
>         e.attr.st_mode    =3D S_IFREG | 0644;
>         e.attr.st_nlink   =3D 1;
> +       e.attr.st_uid =3D getuid();
> +       e.attr.st_gid =3D getgid();
>         fuse_reply_entry(req, &e);
>  }
>
> @@ -175,10 +186,38 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t =
ino, const char *name,
>         free(acl);
>  }
>
> +static void fs_setxattr(fuse_req_t req, fuse_ino_t ino, const char *name=
,
> +                           const char *value, size_t size, int flags)
> +{
> +       int ret =3D 0;
> +       uint8_t *acl;
> +
> +       if (ino !=3D FILE_INO)
> +               ret =3D ENOENT;
> +       else if (!strcmp(name, "system.posix_acl_access")) {
> +               acl =3D malloc(size);
> +               if (acl) {
> +                       memcpy(acl, value, size);
> +                       pthread_mutex_lock(&g_ds.lock);
> +                       if (g_ds.acl)
> +                               free(g_ds.acl);
> +                       g_ds.acl =3D acl;
> +                       g_ds.acl_size =3D size;
> +                       pthread_mutex_unlock(&g_ds.lock);
> +               } else
> +                       ret =3D ENOMEM;
> +       } else
> +               ret =3D ENOTSUP;
> +

I am allergic to mismatching {} in if/else statements.
I personally think that code will be cleaner with a goto error
without all these multi nesting levels.

Thanks,
Amir.
