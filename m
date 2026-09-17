Received: from mail-ed2-f40.google.com (mail-ed2-f40.google.com [74.125.228.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E1A4E322C
	for <fuse-devel@lists.linux.dev>; Thu, 17 Sep 2026 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658084; cv=pass; b=VXoHa7AODCmg8lD/3DQAYGvANBwkiFkuodC7/jdHWz5yVdy5kWLL0InfiD9lfKEDIOOp2qZlmuE1Kf9GeiDGBDhbAePTecrunCGcnEYawYU0WJTXHeSv1y9yuWEP6oMSXlSr56TfNu/V121hJBL3mfhKxiLA83QuJFMhQ3ziBAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658084; c=relaxed/simple;
	bh=UFML2e457ZW3pIU5/pg+b/DC8XOfx2EOR7iCXso0RAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0mNo/AJ3JOK18c4JIEGkrF9sJiPSXY/bVeaDYpcgGUPqHtjFJqbcwSSVuBRKZQRLlnr5kfbpugTrOa2MpxLDBWDXdbSlq3f0xDRjuCs8UG3b18zNJCWtRDBQdTNSGQrr2NVM59tihzTZa81yi5IcrTr+a609MYU37sP3wjlh/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1tCT87C; arc=pass smtp.client-ip=74.125.228.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1tCT87C"
Received: by mail-ed2-f40.google.com with SMTP id 4fb4d7f45d1cf-6a60590a85cso2009682a12.0
        for <fuse-devel@lists.linux.dev>; Thu, 17 Sep 2026 08:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789658074; cv=none;
        d=google.com; s=arc-20260327;
        b=Dr1NCQeyeV/V1dV2n+9QHglByNba6Pqa5/Bqs0hnQG79mpYehYllmWQWaBK2U7dG+R
         EeaZygi+2V1scENbrvD6mfbMhQpi3kWHBqUx2fmI2SyJ0bnAK4pUfanlXv5rc1mum5z6
         jV02gMuUbG7q/d3jy75InvjfAv9HulOXsQxln5f/Bl59Iyo53dcbsBA8sM/lUNkQl3Ez
         dWjvzCXHYg/hqFuFZCi5jW3SdwGSJriSGy+9ewo9W4Nw56uS26KCV5nA0x1F5sem7sN1
         tQoLx0MQahPGa67YNBchhFMwxgQUHk8Rp64lYHSQ2ehl8cBPxNQdDJFd5erd6m2HNY+2
         FX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TCGGfYUyiWy8h8GhXDRfHIV8Kfgm9E+ThBdTgsBhNN0=;
        fh=JNZ2XCXGrlJrGM9O3nQKjhYxtkG8/+mfpQOVBIgXZiE=;
        b=s4+sDmJaVclVNa4v9z36NIydUiV3xWeunEz5mOqud+Vl/1+cDXaIufFsIuCocbprgR
         TlzOJE9LOnGfAhoqJuuDYGSCbXvUiZvUxBiTSDTfwG58+VT+pIWB0kFl3y39XNwb0yqV
         AYu561Uy9sc7ZizS1R8ZuxrEq3NoztIAU3zMw4eoob4tkt4ott9qAhwUQbUWVY1jfdo0
         XehgZudkpjnewMX0PV1f2w1X7xRjzE6zUsCrRoXN57zssKu829aVingS70ttzH0QiiIo
         wdfXz6Vxa3Nza8uh2FwViGz4OXY9j3s1I8VNnZXQFqSiINUvwzgi73+e/1iZVFPWHIFK
         MkAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789658074; x=1790262874; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TCGGfYUyiWy8h8GhXDRfHIV8Kfgm9E+ThBdTgsBhNN0=;
        b=R1tCT87C0k/RFggJlFQcScfogvcfZv/kqxNqkzb7zvn44Kx1Y5H6etRnjtQ97apWK7
         pVZcI7edhiykUgBNTx5W6m1++ChHPNeJ9rmtE9m2Si+dlMcZ1jvT7JMq9frqLcdP4PIM
         1UtjbPIgr8dTT20jBy4FUxwDuRoHBYIQNailuwJdSzddasSPKxys5uT3yZh6+WVuAyUz
         8nDZ49ZKnehC6JS7s8HlUvJ8pMjdx/sKh2EKrT6k+VJlwP1waHoGUPR1+6bME5G78hC3
         L9+goeBQrOUAbf7CwAZ1FFW4DyzCrihvwKlnqf5WyioMQUTRxdWpkgRMbS+sZp5JQSCr
         xJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658074; x=1790262874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCGGfYUyiWy8h8GhXDRfHIV8Kfgm9E+ThBdTgsBhNN0=;
        b=lcEyHfnvXtKG6yxHGp7944BoznPk3uqYXcwsiUoVnxDKCIrMUd2mg6ETvKIRm3E/66
         eEepGy/7lS0MdNCOLTsM6rVE/Fm5uu2aRYJPT8jFUdchkHZkPoJeM0yaYZVGqGsPWXja
         Blo5GXpbZ3OkmfQVlNC43EGbddrwML9ngkqYR8Ye6gHqcwHTkptLFGH1ero8t+uOWM6r
         370snwNgXw/Re7E3QMQ+nq42zt7vtDTbkfiuTjhvKb4X6jUp1WBCHIVtz/xMFp/A3Eue
         ujlQR6LDapvl+MIgYpmd6Ap4o9U+UituzivyKb3LZrPxWcZ/R/s5n06isDNiLhyXbcqa
         njXw==
X-Forwarded-Encrypted: i=1; AKwUvBwPulXM8nOgqtAzE/6EyRJDq/PlBYe8gbFD0RCoEXEsJXho/23OdBgryoAXP5NjL0U1N0HR3YAP3scA@lists.linux.dev
X-Gm-Message-State: AFuF++krj46dq+CqBhZuuO0xZMvKiZK2VQDl+FmSRutZO/QVvhUFIhgF
	YPESmM9QezwRUhVBXpWbYIvT0EnM/bOk9ArV+vY5cNNThVwoHiqeANMjb1pjUTdMNLNqikHR5kU
	uMeCmHzDhpaZHfB3rv6eUlXQ8H4W6LZQ=
X-Gm-Gg: AYBFou0Y+twjnIHPaMevshg57UWa9V1185OHfYN4YYu3QNtErx0bqlvD1hv4BObNC+m
	uc6qnCocSY7bdsyY8qE0GzI3+01ExmbOExEMU55B/BrC/43hWLKsy+OQHAXnHvDLmKrPOvN5mpf
	WIhhz/JAzKgPr9aS0YW8DS1t7D3K0XGuB8fpWv7Djco0ow+cZz6IeS4MrL4IUz3uHj4RvFCCWfE
	7CiQTWjDS66X/bU0Q2FgwcjAZ5wJB2y80CuKXUZiaYh8MQiWFO24pN0g2D+hZq6TvwNpGJX+dsl
	0tDkit5fc1k4f+E0aI2wAdsYdQKkDrP+QRvdOUEiuLRXAI0wNY1Zkpkj
X-Received: by 2002:a17:907:9606:b0:c21:1b58:fa96 with SMTP id
 a640c23a62f3a-c29e520cb4fmr486611366b.3.1789658074237; Thu, 17 Sep 2026
 08:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916155629.32421-1-luis@igalia.com> <20260916155629.32421-7-luis@igalia.com>
In-Reply-To: <20260916155629.32421-7-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 17 Sep 2026 17:14:22 +0200
X-Gm-Features: AcwNN1XrTA3dUrmLafi4P5dEpMrugxsYg13C0OFBhbE2Rz9-I-DuXWy9pmfwykk
Message-ID: <CAOQ4uxhTBOH27USdM5KQ7fypp2-9ihGEmr6TJF21RVpZdsZz7w@mail.gmail.com>
Subject: Re: [RFC PATCH v4 6/8] selftests/fuse: add some extra ACL caching tests
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 5:55=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
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
>  .../filesystems/fuse/fuse_acl_cache_test.c    | 203 +++++++++++++++++-
>  2 files changed, 202 insertions(+), 2 deletions(-)
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
> index fb4e3554e3c9..173063efeee8 100644
> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> @@ -84,6 +84,9 @@ struct daemon_state {
>         uint8_t         *acl;
>         size_t          acl_size;
>         int             getxattr_count;
> +       uid_t           uid;
> +       uid_t           gid;
> +       bool            cache;
>  };
>
>  /*
> @@ -92,9 +95,17 @@ struct daemon_state {
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
> @@ -116,6 +127,10 @@ static void fs_lookup(fuse_req_t req, fuse_ino_t par=
ent, const char *name)
>         e.attr.st_ino     =3D FILE_INO;
>         e.attr.st_mode    =3D S_IFREG | 0644;
>         e.attr.st_nlink   =3D 1;
> +       pthread_mutex_lock(&g_ds.lock);
> +       e.attr.st_uid =3D g_ds.uid;
> +       e.attr.st_gid =3D g_ds.gid;
> +       pthread_mutex_unlock(&g_ds.lock);
>         fuse_reply_entry(req, &e);
>  }
>
> @@ -133,6 +148,10 @@ static void fs_getattr(fuse_req_t req, fuse_ino_t in=
o,
>                 st.st_ino   =3D FILE_INO;
>                 st.st_mode  =3D S_IFREG | 0644;
>                 st.st_nlink =3D 1;
> +               pthread_mutex_lock(&g_ds.lock);
> +               st.st_uid =3D g_ds.uid;
> +               st.st_gid =3D g_ds.gid;
> +               pthread_mutex_unlock(&g_ds.lock);
>         } else {
>                 fuse_reply_err(req, ENOENT);
>                 return;
> @@ -161,12 +180,14 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t =
ino, const char *name,
>         }
>         pthread_mutex_lock(&g_ds.lock);
>         acl_size =3D g_ds.acl_size;
> -       if (acl && (size >=3D acl_size))
> +       if (acl && acl_size && (size >=3D acl_size))
>                 memcpy(acl, g_ds.acl, acl_size);
>         g_ds.getxattr_count++;
>         pthread_mutex_unlock(&g_ds.lock);
>
> -       if (size =3D=3D 0)
> +       if (acl_size =3D=3D 0)
> +               fuse_reply_err(req, ENODATA);
> +       else if (size =3D=3D 0)
>                 fuse_reply_xattr(req, acl_size);
>         else if (size < acl_size)
>                 fuse_reply_err(req, ERANGE);
> @@ -176,10 +197,42 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t =
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
> +       if (ino !=3D FILE_INO) {
> +               ret =3D ENOENT;
> +               goto out;
> +       } else if (strcmp(name, "system.posix_acl_access") !=3D 0) {
> +               ret =3D ENOTSUP;
> +               goto out;
> +       }
> +       acl =3D malloc(size);
> +       if (!acl) {
> +               ret =3D ENOMEM;
> +               goto out;
> +       }
> +       memcpy(acl, value, size);
> +       pthread_mutex_lock(&g_ds.lock);
> +       if (g_ds.acl)
> +               free(g_ds.acl);
> +       g_ds.acl =3D acl;
> +       g_ds.acl_size =3D size;
> +       pthread_mutex_unlock(&g_ds.lock);
> +
> +out:
> +       fuse_reply_err(req, ret);
> +}
> +
>  static const struct fuse_lowlevel_ops fs_ops =3D {
> +       .init     =3D fs_init,
>         .lookup   =3D fs_lookup,
>         .getattr  =3D fs_getattr,
>         .getxattr =3D fs_getxattr,
> +       .setxattr =3D fs_setxattr,
>  };
>
>  /* ---- kselftest harness ----------------------------------------------=
----- */
> @@ -198,6 +251,9 @@ FIXTURE_SETUP(acl_cache)
>         ASSERT_NE(g_ds.acl, NULL);
>         memcpy(g_ds.acl, acl_a, g_ds.acl_size);
>         g_ds.getxattr_count =3D 0;
> +       g_ds.uid =3D getuid();
> +       g_ds.gid =3D getgid();
> +       g_ds.cache =3D false;
>
>         if (fs_setup(&fs_ops, &g_ds.ctx, err))
>                 SKIP(goto out, err);
> @@ -325,4 +381,147 @@ TEST_F(acl_cache, stale_after_force_sync)
>         EXPECT_EQ(count, 4);
>  }
>
> +FIXTURE(acl_cache_onoff)
> +{
> +       char pathname[PATH_MAX];
> +};
> +
> +FIXTURE_VARIANT(acl_cache_onoff) { bool cache; };
> +FIXTURE_VARIANT_ADD(acl_cache_onoff, nocache) { .cache =3D false, };
> +FIXTURE_VARIANT_ADD(acl_cache_onoff, docache) { .cache =3D true, };
> +
> +FIXTURE_SETUP(acl_cache_onoff)
> +{
> +       char err[MAX_ERR_MSG];
> +
> +       pthread_mutex_lock(&g_ds.lock);
> +       g_ds.acl =3D NULL;
> +       g_ds.acl_size =3D 0;
> +       g_ds.getxattr_count =3D 0;
> +       g_ds.cache =3D variant->cache;
> +       g_ds.uid =3D getuid();
> +       g_ds.gid =3D getgid();
> +
> +       if (fs_setup(&fs_ops, &g_ds.ctx, err))
> +               SKIP(goto out, err);
> +
> +       snprintf(self->pathname, sizeof(self->pathname),
> +                "%s/" FILE_NAME, g_ds.ctx.mountpoint);
> +out:
> +       pthread_mutex_unlock(&g_ds.lock);
> +}
> +
> +FIXTURE_TEARDOWN(acl_cache_onoff)
> +{
> +       pthread_mutex_lock(&g_ds.lock);
> +       fs_teardown(&g_ds.ctx);
> +       pthread_mutex_unlock(&g_ds.lock);
> +       free(g_ds.acl);
> +}
> +
> +/*
> + * This is the most basic ACL caching test: verify that, when reading AC=
Ls for
> + * an inode, user-space is called:
> + * - Only once if ACLs cache is enabled, or
> + * - Once per access if cache i disabled.

Typo "is disabled"

> + */
> +TEST_F(acl_cache_onoff, test_acl_cache_enable_disable)
> +{
> +       char buf[512];
> +       ssize_t sz;
> +       bool cache;
> +       int counter;
> +       int i;
> +
> +       ASSERT_EQ(lsetxattr(self->pathname, "system.posix_acl_access",
> +                           acl_a, sizeof(acl_a), 0), 0);
> +
> +       for (i =3D 0; i < 100; i++) {
> +               sz =3D lgetxattr(self->pathname, "system.posix_acl_access=
",
> +                              buf, sizeof(buf));
> +               ASSERT_EQ(sz, sizeof(acl_a));
> +               ASSERT_EQ(memcmp(buf, acl_a, sz), 0);
> +       }
> +
> +       pthread_mutex_lock(&g_ds.lock);
> +       counter =3D g_ds.getxattr_count;
> +       cache =3D g_ds.cache;
> +       pthread_mutex_unlock(&g_ds.lock);
> +
> +       if (cache) {
> +               ASSERT_EQ(counter, 1);
> +       } else {
> +               ASSERT_EQ(counter, 100);
> +       }
> +
> +       TH_LOG("User-space called %d time(s) with ACL caching %s",
> +              counter, cache ? "enabled" : "disabled");
> +}
> +
> +/*
> + * Test caching invalidation for several scenarios:
> + * 1. When a new ACL is set
> + * 2. When invalidating an inode (NOTIFY_INODE_INVAL)

Typo NOTIFY_INVAL_INODE


With that fix, feel free to add

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.

> + */
> +TEST_F(acl_cache_onoff, test_acl_cache_invalidation)
> +{
> +       char buf[512];
> +       ssize_t sz;
> +       int counter;
> +       bool cache;
> +       int i;
> +
> +       /* Set an ACL */
> +       ASSERT_EQ(lsetxattr(self->pathname, "system.posix_acl_access",
> +                           acl_a, sizeof(acl_a), 0), 0);
> +
> +       for (i =3D 0; i < 100; i++) {
> +               sz =3D lgetxattr(self->pathname, "system.posix_acl_access=
",
> +                              buf, sizeof(buf));
> +               ASSERT_EQ(sz, sizeof(acl_a));
> +               ASSERT_EQ(memcmp(buf, acl_a, sz), 0);
> +       }
> +
> +       /* 1. force cache invalidation by setting a new ACL */
> +       ASSERT_EQ(lsetxattr(self->pathname, "system.posix_acl_access",
> +                           acl_b, sizeof(acl_b), 0), 0);
> +
> +       sz =3D lgetxattr(self->pathname, "system.posix_acl_access",
> +                      buf, sizeof(buf));
> +       ASSERT_EQ(sz, sizeof(acl_b));
> +       ASSERT_EQ(memcmp(buf, acl_b, sz), 0);
> +
> +       pthread_mutex_lock(&g_ds.lock);
> +       counter =3D g_ds.getxattr_count;
> +       cache =3D g_ds.cache;
> +       pthread_mutex_unlock(&g_ds.lock);
> +
> +       if (cache) {
> +               ASSERT_EQ(counter, 2);
> +       } else {
> +               ASSERT_EQ(counter, 101);
> +       }
> +       TH_LOG("Invalidation by setting new ACL: OK");
> +
> +       /* 2. send FUSE_NOTIFY_INVAL_INODE */
> +       fuse_lowlevel_notify_inval_inode(g_ds.ctx.se, FILE_INO, 0, 0);
> +
> +       sz =3D lgetxattr(self->pathname, "system.posix_acl_access",
> +                      buf, sizeof(buf));
> +       ASSERT_EQ(sz, sizeof(acl_b));
> +       ASSERT_EQ(memcmp(buf, acl_b, sz), 0);
> +
> +       pthread_mutex_lock(&g_ds.lock);
> +       counter =3D g_ds.getxattr_count;
> +       cache =3D g_ds.cache;
> +       pthread_mutex_unlock(&g_ds.lock);
> +
> +       if (cache) {
> +               ASSERT_EQ(counter, 3);
> +       } else {
> +               ASSERT_EQ(counter, 102);
> +       }
> +       TH_LOG("Invalidation through FUSE_NOTIFY_INVAL_INODE: OK");
> +}
> +
>  TEST_HARNESS_MAIN
