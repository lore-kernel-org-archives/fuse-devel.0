Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CB235837C
	for <fuse-devel@lists.linux.dev>; Thu, 17 Sep 2026 15:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657906; cv=pass; b=euvW2ZJsq61ViIqRdnEHKlerurLpGC2FXLQxHrTVSVrJe3JoUVc8evP7hLC9G1KTouhv8NbvetQOnkzj54WawOgwCtTprLr6i0ABZDdHrwmJ6SaPFtzyWKg9mt6LmaeLA2sBzpd/XAKblZYaHqyLnC09ptkx5amCnRf3UF4R9Lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657906; c=relaxed/simple;
	bh=AR7lUIbIagYR/hUzFP3++XDGApQ9fghjxEE2Taz8yXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/8W+gXSiL0r7fGmseP49Hv5cJjN7w9roYa1p0cAxdLAggURPwOer+0Q9RlGyqiwhnea2NO6eh6FjkcTVTth68VEMOP4v3LBePzLBbA/f6BTrcjr/+AlSKABu3pBhP0p/E0HpvHEmIvUn6LUYlzfoiJjCW93YUlcM3VMEZ5+EEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqwlhUZz; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqwlhUZz"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so139701466b.3
        for <fuse-devel@lists.linux.dev>; Thu, 17 Sep 2026 08:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789657892; cv=none;
        d=google.com; s=arc-20260327;
        b=F/NrZRiS9LsXPQEncGhiTvFlRefYVU0zLlVjvpMWEduoPubGWgfX9/9msAet8ZFBiN
         qM7kWgFvpAh0mj7iyLLfzRLGjOL0ZYJM+XjcZUA4mQb+Xe1jB/N4qG/Cychxgwy+tUcv
         q3b+rH3acCH58pzdZgMop6aAYjfuAwF/IXGs/WO98ldvNHAqHuhVLUgiCdHs4TMxzgY8
         dpl0wnBFLSf7Z19zR6guuq90Zf7fYQvBPftpWPN8qRNQ/tD4mPf8zDg7FNnLaElCSujo
         G8xqx52FZWkLvaTAuRHxZy3tvwTZvkb57+q1EwLfn2FQp67LCdWa80xTtnPe1dg4YAZD
         /GZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZwyOajXrE6mGxZpP+GCuPZuqPhHQrM42A9CDq3FiUZ8=;
        fh=VnI+Y/yGHvfGbc8y2EEWzfagGPFPg5geYSMRcIGlbbg=;
        b=ZY8YkbtY2G1tDrU0kTEaQVVB6vkkpKFD/yPwkrOkaJpiJhSrjLpaCQFF/ZOwolyqOl
         qPYDO35ajkD8a9tdw0ZmJVLYNVmneHuFmkPaYtHJe5p+2zjXxelp8hTW5+IqP4jMTlrq
         VggYNpEtKs0omccopMaNuaoOOpbWluFWfED1y2WxL8B9AREdAeFu0f6kJ4ltiqIrFI+M
         MTp0LU1PKfsmr29TKKEuQs5E7daPC0m5+S2RxNPTczxV/6R30dQLpEEQHKr4xMOtmZQ2
         SMszJiACaOxh0IBqsvKgH4RXN2ow9z6bejudbAArVQeSyi6QWEpTz+TslTlDpX4gYvcT
         SJPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657892; x=1790262692; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZwyOajXrE6mGxZpP+GCuPZuqPhHQrM42A9CDq3FiUZ8=;
        b=EqwlhUZzr0rWwXttqUVszmNdH3W00G+wKnccTjV8Rhw70NTJtxHAd93wDlBr/u7Rsf
         L0EARW34erAxtANI/zr/7cJZBafqeRBfNH9rJPxgCRT1nbe4ucepOZLyl4O7bFc1EKHE
         crVl7to19bY1sJd3KC9Gruuo6CgfLeDzfAoX+pvQ1hgV781vZcPsxpJFoaHVHsA2Qc4+
         xsyfSY7SrpKWRkqE321Gpmrqf51OyAXi3LfAialHBpGnJPWCLKiJmC4R6NeaVE0Xx33u
         5J5dC6ZWlpYRVjiLCIcF9vyj3rFybR0kBVtQED80ABc6gPYXalVKThIUatok61kom1uj
         xNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657892; x=1790262692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZwyOajXrE6mGxZpP+GCuPZuqPhHQrM42A9CDq3FiUZ8=;
        b=wR750pLx4wi3Qs1WsHg4nOet48c9NIwIssaoqThPVV1ek9v8LoX3K5GFEqrmbQtMgo
         9Ch3Zb7cfTo0NWGFI6Nr0i6z97paXwCpX/+Iw/5j3v2gBk5arxe4kOLxt6i5PC14/+G3
         G71D7iQ9EEOcKNlBvb3JfmBycm+kumvy1gsj5U11WrxM7Rp0xVwZ54bHSFLuX2CsAYy/
         1SjsKPEfuJLsUCGIi6/Ua1un95E4XODxPyTdUwuZeDo7Wjv+7qwRFIqwdvBObV2+tUwX
         qrD3j4JU0o+mx8N84EAw7pdZS2VM0cAOcmPsz9jo9NFol6tMyNBfXWjSAOPvKTCM1XLp
         2mpw==
X-Forwarded-Encrypted: i=1; AKwUvBy+Mq5S2CLSaZPPG8I7SXJA6rw3Tig+/zqbZRc/kUkWiX8sBQ2lrcSeDMnbD8GH5072RjoCkYWBDWL+@lists.linux.dev
X-Gm-Message-State: AFuF++kV9iRZiHX37g5ofAa8viL8yBMj1HG7gN1RXVxkjP20aiYadd8X
	JrVW8C0B4w5uSP5exhQ37DubdB16E5tktzSsT2J0c7ymPLLqOLV/fuKR8EEnuiV6UQ45QrWRdpE
	LfibcSyVuVOOx1wWry26HsxA35hyztew=
X-Gm-Gg: AYBFou1RcDsy3w1B89nXvO95KqOU8wNz3xkli5DW1yAUgZ9Mxm2RmyFVLJAGG3Pes6j
	zVqA8CZMA9tLZ3NscR1HA+d/JGGt9TsZyI0FmI8RrnEvTORG+bdUL5tyg1IwNcJSH4z86xS8bCS
	5FuLBPoMdaBBw39qvNNoNJgFvniXGJDW5pwIEMEd9dAKqqMFyvKHvnZfWgU7TsCCL/VOXU+1t7a
	K1FZfrK6/G8eS17TwRz3aM5HsCB62I2LkBNU5yY4TQ6XR1+a/J1kmt6obqDga+DWekKAfHSe+fz
	yuI57DW0lj5yLL9sEpZv1FjHt7JtmRG6Ybe9jftf1/l4m23Y27k8eKqo
X-Received: by 2002:a17:907:720b:b0:c21:450d:cd7e with SMTP id
 a640c23a62f3a-c29e51dbef4mr536797366b.9.1789657891615; Thu, 17 Sep 2026
 08:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916155629.32421-1-luis@igalia.com> <20260916155629.32421-5-luis@igalia.com>
In-Reply-To: <20260916155629.32421-5-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 17 Sep 2026 17:11:20 +0200
X-Gm-Features: AcwNN1U8yZs3U1Zoa0mP83cmAalqy6vaTTMPxFAvfdysEdTyiS0EBigFPBwd6sk
Message-ID: <CAOQ4uxgOGm3Eo97M32CK84HWEsXNgnYU5uunTV0g_Si9NRj5tw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 4/8] selftests/fuse: factor-out test fixture setup/teardown
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
> In order to reduce new tests setup/teardown code duplication, factor-out
> these functions from the existing acl_cache test into a new fuse_common.c
> file that can be reused in other tests.
>
> While there, also move some of the FIXTURE members into a fuse_common_ctx
> structure that can be passed into setup/teardown instead of passing them =
by
> reference.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/Makefile       |  8 +-
>  .../filesystems/fuse/fuse_acl_cache_test.c    | 73 ++++---------------
>  .../selftests/filesystems/fuse/fuse_common.c  | 58 +++++++++++++++
>  .../selftests/filesystems/fuse/fuse_common.h  | 31 ++++++++
>  4 files changed, 111 insertions(+), 59 deletions(-)
>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common.=
c
>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common.=
h
>
> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/te=
sting/selftests/filesystems/fuse/Makefile
> index a3ee9b3a2f5d..7744f796eb06 100644
> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> @@ -21,8 +21,12 @@ ifeq ($(VAR_LDLIBS),)
>  VAR_LDLIBS :=3D -lfuse3 -pthread
>  endif
>
> +CFLAGS +=3D $(VAR_CFLAGS)
> +LDLIBS +=3D $(VAR_LDLIBS)
> +
>  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
>
> -$(OUTPUT)/fuse_acl_cache_test: CFLAGS +=3D $(VAR_CFLAGS)
> -$(OUTPUT)/fuse_acl_cache_test: LDLIBS +=3D $(VAR_LDLIBS)
> +$(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
> +
> +EXTRA_CLEAN :=3D fuse_common.o
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test=
.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> index 2411a6e285f1..d5a966e7fc15 100644
> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> @@ -33,23 +33,15 @@
>   */
>
>  #define _GNU_SOURCE
> -#include <errno.h>
>  #include <fcntl.h>
>  #include <linux/limits.h>
> -#include <pthread.h>
>  #include <stdint.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <string.h>
> -#include <sys/stat.h>
>  #include <sys/xattr.h>
> -#include <unistd.h>
> -
> -#define FUSE_USE_VERSION 31
> -#include <fuse_lowlevel.h>
>
>  #include "kselftest_harness.h"
>
> +#include "fuse_common.h"
> +
>  /* ---- ACL binary encoding --------------------------------------------=
---- */
>  /*
>   * POSIX ACL v2 xattr format (little-endian):
> @@ -88,6 +80,7 @@ static const uint8_t acl_b[] =3D {
>
>  struct daemon_state {
>         pthread_mutex_t lock;
> +       struct fuse_common_ctx ctx;
>         const uint8_t  *acl;
>         size_t          acl_size;
>         int             getxattr_count;
> @@ -176,69 +169,35 @@ static const struct fuse_lowlevel_ops fs_ops =3D {
>         .getxattr =3D fs_getxattr,
>  };
>
> -/* ---- Daemon thread --------------------------------------------------=
----- */
> -
> -static void *run_daemon(void *arg)
> -{
> -       fuse_session_loop((struct fuse_session *)arg);
> -       return NULL;
> -}
> -
>  /* ---- kselftest harness ----------------------------------------------=
----- */
>
>  FIXTURE(acl_cache) {
> -       struct fuse_session *se;
> -       char                 mountpoint[PATH_MAX];
> -       char                 file_path[PATH_MAX];
> -       pthread_t            thread;
> +       char file_path[PATH_MAX];
>  };
>

Hi Luis,

Thanks for the followup cleanup.
Question: why did you move struct fuse_common_ctx out of the test
fixture and into the global state?
It not terribly wrong but seems unnecessary and inconsistent -
fs_setup/teardown are in FIXTURE_SETUP/TEARDOWN
so it is more consistent that fuse_common_ctx stays embedded in the
fixure object, unless you have a reason to counter.

With that fix, feel free to add

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.

>  FIXTURE_SETUP(acl_cache)
>  {
> -       char *fuse_argv[] =3D { "fuse_acl_cache_test", NULL };
> -       struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
> +       char err[MAX_ERR_MSG];
>
> -       g_ds.acl            =3D acl_a;
> -       g_ds.acl_size       =3D sizeof(acl_a);
> +       pthread_mutex_lock(&g_ds.lock);
> +       g_ds.acl =3D acl_a;
> +       g_ds.acl_size =3D sizeof(acl_a);
>         g_ds.getxattr_count =3D 0;
>
> -       strcpy(self->mountpoint, "/tmp/acl_cache_test_XXXXXX");
> -       if (!mkdtemp(self->mountpoint))
> -               SKIP(return, "mkdtemp: %s", strerror(errno));
> +       if (fs_setup(&fs_ops, &g_ds.ctx, err))
> +               SKIP(goto out, err);
>
>         snprintf(self->file_path, sizeof(self->file_path),
> -                "%s/" FILE_NAME, self->mountpoint);
> -
> -       self->se =3D fuse_session_new(&args, &fs_ops, sizeof(fs_ops), NUL=
L);
> -       if (!self->se) {
> -               rmdir(self->mountpoint);
> -               SKIP(return, "fuse_session_new failed");
> -       }
> -
> -       if (fuse_session_mount(self->se, self->mountpoint)) {
> -               fuse_session_destroy(self->se);
> -               rmdir(self->mountpoint);
> -               SKIP(return, "fuse_session_mount failed "
> -                            "(missing fusermount3 or insufficient privil=
eges)");
> -       }
> -
> -       if (pthread_create(&self->thread, NULL, run_daemon, self->se)) {
> -               fuse_session_unmount(self->se);
> -               fuse_session_destroy(self->se);
> -               rmdir(self->mountpoint);
> -               SKIP(return, "pthread_create: %s", strerror(errno));
> -       }
> -
> -       fuse_opt_free_args(&args);
> +                "%s/" FILE_NAME, g_ds.ctx.mountpoint);
> +out:
> +       pthread_mutex_unlock(&g_ds.lock);
>  }
>
>  FIXTURE_TEARDOWN(acl_cache)
>  {
> -       fuse_session_exit(self->se);
> -       fuse_session_unmount(self->se);
> -       pthread_join(self->thread, NULL);
> -       fuse_session_destroy(self->se);
> -       rmdir(self->mountpoint);
> +       pthread_mutex_lock(&g_ds.lock);
> +       fs_teardown(&g_ds.ctx);
> +       pthread_mutex_unlock(&g_ds.lock);
>  }
>
>  static int do_force_statx(const char *path)
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_common.c b/too=
ls/testing/selftests/filesystems/fuse/fuse_common.c
> new file mode 100644
> index 000000000000..d1d3dfd2ea67
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_common.c
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include "fuse_common.h"
> +
> +static void *run_daemon(void *arg)
> +{
> +       fuse_session_loop((struct fuse_session *)arg);
> +       return NULL;
> +}
> +
> +int fs_setup(const struct fuse_lowlevel_ops *fs_ops,
> +            struct fuse_common_ctx *ctx, char *err)
> +{
> +       char *fuse_argv[] =3D { "fuse_test", NULL };
> +       struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
> +
> +       strcpy(ctx->mountpoint, MOUNTPOINT_TEMPLATE);
> +       if (!mkdtemp(ctx->mountpoint)) {
> +               snprintf(err, MAX_ERR_MSG, "mkdtemp: %s", strerror(errno)=
);
> +               return -1;
> +       }
> +
> +       ctx->se =3D fuse_session_new(&args, fs_ops, sizeof(*fs_ops), NULL=
);
> +       if (!ctx->se) {
> +               rmdir(ctx->mountpoint);
> +               snprintf(err, MAX_ERR_MSG, "fuse_session_new failed");
> +               return -1;
> +       }
> +
> +       if (fuse_session_mount(ctx->se, ctx->mountpoint)) {
> +               fuse_session_destroy(ctx->se);
> +               rmdir(ctx->mountpoint);
> +               snprintf(err, MAX_ERR_MSG, "fuse_session_mount failed "
> +                       "(missing fusermount3 or insufficient privileges)=
");
> +               return -1;
> +       }
> +
> +       if (pthread_create(&ctx->thread, NULL, run_daemon, ctx->se)) {
> +               fuse_session_unmount(ctx->se);
> +               fuse_session_destroy(ctx->se);
> +               rmdir(ctx->mountpoint);
> +               snprintf(err, MAX_ERR_MSG, "pthread_create: %s", strerror=
(errno));
> +               return -1;
> +       }
> +
> +       fuse_opt_free_args(&args);
> +
> +       return 0;
> +}
> +
> +void fs_teardown(struct fuse_common_ctx *ctx)
> +{
> +       fuse_session_exit(ctx->se);
> +       fuse_session_unmount(ctx->se);
> +       pthread_join(ctx->thread, NULL);
> +       fuse_session_destroy(ctx->se);
> +       rmdir(ctx->mountpoint);
> +}
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_common.h b/too=
ls/testing/selftests/filesystems/fuse/fuse_common.h
> new file mode 100644
> index 000000000000..e3dd85daa4b0
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_common.h
> @@ -0,0 +1,31 @@
> +#ifndef __SELFTEST_FUSE_COMMON_H__
> +#define __SELFTEST_FUSE_COMMON_H__
> +
> +#define _GNU_SOURCE
> +#include <errno.h>
> +#include <pthread.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <limits.h>
> +
> +#define FUSE_USE_VERSION 31
> +#include <fuse_lowlevel.h>
> +
> +#define MAX_ERR_MSG 256
> +
> +#define MOUNTPOINT_TEMPLATE "/tmp/fuse_test_XXXXXX"
> +#define MOUNTPOINT_SZ 64
> +
> +struct fuse_common_ctx {
> +       struct fuse_session *se;
> +       char mountpoint[MOUNTPOINT_SZ];
> +       pthread_t thread;
> +};
> +
> +int fs_setup(const struct fuse_lowlevel_ops *fs_ops,
> +            struct fuse_common_ctx *ctx, char *err);
> +void fs_teardown(struct fuse_common_ctx *ctx);
> +
> +#endif /* __SELFTEST_FUSE_COMMON_H__ */
