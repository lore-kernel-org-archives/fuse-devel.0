Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9944A0EEB
	for <fuse-devel@lists.linux.dev>; Sat,  5 Sep 2026 12:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612324; cv=pass; b=DWHJP23COeuE5m4SmqACJIYyn2v+eFV8n/jBuSiH8K9FTwahk+NbGr0c5ngBalQaviUArhtF6pd4hb0pWaiivdkqZZyyWJi4vs2Yv3nsvv53NZZ/SMnpOorm4mcVbJ7WhVel9keGSL6At8j2VvKjaHSQPPbLE9gECpGRufcjQLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612324; c=relaxed/simple;
	bh=fBWEGcX5+6BMMIJlFafz91zXoPt1lhGtk3Zdv3Oy89w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WiB4Fottlw0tJjkP7XI1Gnk2Ak6rWndO2VAvz26o7VZ3AFVcw9F8Wms3ujUUlQpHX5xpn5XQ5UMogk/a44USCI1DOi4YeAwmTNcaxcLyJv3jostyi8nSXhuy+n+hF6fA5V47Wroe7MnR+glFshTGsv/5t/Gxwi2EKwY5s4EK4Z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r3ot8MSP; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r3ot8MSP"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a7ea0046deso2425522a12.3
        for <fuse-devel@lists.linux.dev>; Sat, 05 Sep 2026 05:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788612321; cv=none;
        d=google.com; s=arc-20260327;
        b=V5lZnAERxHeVaw2Xj8dBgzsut9ezz4TFH+grWcti2erDIjmiSZ537ewKZbfTxCu7VD
         ALuVMoeH4MH3C8iEU5cA0Zcx0/Dv4dX5IsdCid+gUMSlG0aueSj5ybj/Gp5tqvKG4AU5
         NKnSDgCGsm2TlQ/tTT06X/ycT1Y0vC+MHNRhfX71TzpF9bYkCNE/aaYgyQV3KToS9B0r
         ykPSlrISpjvnnXLHiLYip/GtC2YtZZj3AG0xDRr/9oyrO7l2ERIH4qtvVu67A8popO3O
         1xgOmQ/wIrCgFg0bdsoDIZ+RqtugNTt3tRhOm2sjYWvKFCL/Og+QnrCSfx3Ui1lKIj6h
         M5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tGM/0WGqNNlVNkDUUKOgVaHbElh413E3DzLNpPh8458=;
        fh=FWWE+9GdyJQOelVkfKlnTwlpZQiNdR0h0wnOmSe7iog=;
        b=CYqo2bM8NCF6Nemj6Sz6BkWV8L+FcjCCeU+o6vKHgadN5DX602ED317tJ8C4vIpPPC
         txDzIg4Du2iP9iveYNPRzNgePQ77Fr4ub6bsW71BFfG5V1GleYZaEK9hAmReFz1C5dje
         HrUIieuP5c4eP6LRTD1mTcwBfRfEEM1GNQP0QiN39NxI8JYus91rmb8JPGNOQDjfhupZ
         wpDMEFKkBLVOmDj9Epu2XPYkAPgCEn4tSkBhIsL0UR7OGOa2yB8bmordPjFM956emtG9
         TrqyDbr8R9fAmPJwZCAPdy67BCqPec1nCtP4ZJyLX3IHt+/LYIH95+8Or0SLjiUkMEAn
         Mnrg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612321; x=1789217121; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tGM/0WGqNNlVNkDUUKOgVaHbElh413E3DzLNpPh8458=;
        b=r3ot8MSP4969lFc/PpGg177a9iY2r8BawAqgo+SeAKo0nxRMOgX/bxGatp9hcvQVhL
         QmoQGLKjkwcKrqVY0FjvKYs9BNABFBlAMta/2WB1BqprYW9xLscSA0Qv4RcmFTROQp0c
         RjmJDUglgJehu+xcESdflSKhQb4cy2cyLdg4ufGlLOPDRNyRn9BEflphNv9GhygF15gh
         i58MOXCRITZHCBo+3Wfa6DOCqdP69qTTonUuz3W2SCs9+XPE7iinc/TrZd8IyNJTWQEK
         26uLgvW2qOqdBvfDNZoqEPewMLj40F9yoHtU/ojJtKY8Ew0w+QYtx57xgrKQCR45Xf/u
         d/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612321; x=1789217121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGM/0WGqNNlVNkDUUKOgVaHbElh413E3DzLNpPh8458=;
        b=bKQ2onuIGBb8Y9XExSOlA1OeeZIjjFs0aIkg5BRkDD0+70ukIvpdpt6TNv45OAQIXY
         4SNBc6tlPaGKDDijKrplREMq+q3aT2VxOCoWufteg351EtjUJ12n2jwJ8QOjBY6WTKPb
         /7PJw8nU+H4Iq5jCoarRZ1mz0dAH7LwUDbaitR1h1fzIVvKKNGt+7vgVXUTysk9pRMaI
         AIsItiRAR5bT2NrNdc2UNtVkm++I3z6bubFHSwOlZN1+8Gobi1Thjf/JcmxvT5MoZX5T
         txlC7mMDq8+jEDBKgEhb+9IwjFPsuDXq63OYWmGAQo5Jc6uPqNpp8QPS/GmH70Z/945F
         yUVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxA/nTA0osRt/5eBhP5TH3HxpiihnT5I+gz9RNb+KbiYGSlkG32yG4EH38zaaHpYbnnbJmXBb0UdNIb@lists.linux.dev
X-Gm-Message-State: AFuF++l3YOhfpIZfehuOONc7nRxbvOn2/vUf42sJktB4u05G8EQeAXGu
	wHMSL6wv+x2e7kKbNm3IftxX5yL5TqAxvR3GdGI4a6yrkIx9wSb2kzvrsiK5VlUURY0CnmpSEVG
	qxuib5X8RXmBg1pH9aEuaI72829+ZyJ3R8JNq
X-Gm-Gg: AYBFou084pYYfy7mDSBhaWVDEI1Gi8tCqRaIa0jaqlIP5SMUlKKnmUvOxUsRnwJc4h4
	eLwVZt6JnbJJ+AzNnTLMUizs6nJDcM8ycvh1rjvXdbjvg8C0sD8PICWnN5NO6Xg8hSoS4R+yaf8
	HJfMLQIlA51PT7a3KP6Sp/DY0Mdc5OYdSOq/YaSvB8vrN2wwSAotR2/E//GqeqL+Nq/TKd/5qTr
	ObFGu1h11FZ7d9mZlYkOMsfN4Wf63VyBWN6QEKH2kc9Rf1qG4amn/GTWxJm352x8LlMss812QyN
	LgbMF6VDwTpuP1vonknhJdfsPs/OX92+Ui76Q6QGHH0Y7g==
X-Received: by 2002:a05:6402:a547:10b0:6a7:f25e:6db1 with SMTP id
 4fb4d7f45d1cf-6a7f25e6e51mr2032344a12.37.1788612320869; Sat, 05 Sep 2026
 05:45:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-5-luis@igalia.com>
In-Reply-To: <20260904103920.4471-5-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 14:45:08 +0200
X-Gm-Features: AcwNN1XW76aTEzUfZkegLGWoMyxaeMkdHeOExTNGv0PjSuMsOiLdN22V8KyQ1vU
Message-ID: <CAOQ4uxgR8v6H=8fHMmLjChsuXUn8560nzda55t8pCNA1ocvg_A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/8] selftests/fuse: factor-out test fixture setup/teardown
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
> In order to reduce new tests setup/teardown code duplication, factor-out
> these functions from the existing acl_cache test into a new fuse_common.c
> file that can be reused in other tests.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/Makefile       |  8 ++-
>  .../filesystems/fuse/fuse_acl_cache_test.c    | 62 +++----------------
>  .../selftests/filesystems/fuse/fuse_common.c  | 60 ++++++++++++++++++
>  .../selftests/filesystems/fuse/fuse_common.h  | 25 ++++++++
>  4 files changed, 100 insertions(+), 55 deletions(-)
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
> index 2411a6e285f1..12cbf9753d03 100644
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
> @@ -176,69 +168,33 @@ static const struct fuse_lowlevel_ops fs_ops =3D {
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
>         struct fuse_session *se;
> -       char                 mountpoint[PATH_MAX];
> +       char                 mountpoint[MOUNTPOINT_SZ];
>         char                 file_path[PATH_MAX];
>         pthread_t            thread;
>  };

Nice!
I think it would be even nicer to have struct fuse_common_ctx
with the common members embedded in the per test state,
but I'll let you decide if you want to do that or not.

Thanks,
Amir.

>
>  FIXTURE_SETUP(acl_cache)
>  {
> -       char *fuse_argv[] =3D { "fuse_acl_cache_test", NULL };
> -       struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
> +       char err[MAX_ERR_MSG];
>
> -       g_ds.acl            =3D acl_a;
> -       g_ds.acl_size       =3D sizeof(acl_a);
> +       g_ds.acl =3D acl_a;
> +       g_ds.acl_size =3D sizeof(acl_a);
>         g_ds.getxattr_count =3D 0;
>
> -       strcpy(self->mountpoint, "/tmp/acl_cache_test_XXXXXX");
> -       if (!mkdtemp(self->mountpoint))
> -               SKIP(return, "mkdtemp: %s", strerror(errno));
> +       if (fs_setup(&self->se, self->mountpoint, &fs_ops, &self->thread,=
 err))
> +               SKIP(return, err);
>
>         snprintf(self->file_path, sizeof(self->file_path),
>                  "%s/" FILE_NAME, self->mountpoint);
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
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_common.c b/too=
ls/testing/selftests/filesystems/fuse/fuse_common.c
> new file mode 100644
> index 000000000000..3a91cac25b81
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_common.c
> @@ -0,0 +1,60 @@
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
> +int fs_setup(struct fuse_session **se, char *mountpoint,
> +            const struct fuse_lowlevel_ops *fs_ops,
> +            pthread_t *thread, char *err)
> +{
> +       char *fuse_argv[] =3D { "fuse_test", NULL };
> +       struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
> +
> +       strcpy(mountpoint, MOUNTPOINT_TEMPLATE);
> +       if (!mkdtemp(mountpoint)) {
> +               snprintf(err, MAX_ERR_MSG, "mkdtemp: %s", strerror(errno)=
);
> +               return -1;
> +       }
> +
> +       *se =3D fuse_session_new(&args, fs_ops, sizeof(*fs_ops), NULL);
> +       if (!*se) {
> +               rmdir(mountpoint);
> +               snprintf(err, MAX_ERR_MSG, "fuse_session_new failed");
> +               return -1;
> +       }
> +
> +       if (fuse_session_mount(*se, mountpoint)) {
> +               fuse_session_destroy(*se);
> +               rmdir(mountpoint);
> +               snprintf(err, MAX_ERR_MSG, "fuse_session_mount failed "
> +                       "(missing fusermount3 or insufficient privileges)=
");
> +               return -1;
> +       }
> +
> +       if (pthread_create(thread, NULL, run_daemon, *se)) {
> +               fuse_session_unmount(*se);
> +               fuse_session_destroy(*se);
> +               rmdir(mountpoint);
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
> +void fs_teardown(struct fuse_session *se, pthread_t thread, char *mountp=
oint)
> +{
> +       fuse_session_exit(se);
> +       fuse_session_unmount(se);
> +       pthread_join(thread, NULL);
> +       fuse_session_destroy(se);
> +       rmdir(mountpoint);
> +}
> +
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_common.h b/too=
ls/testing/selftests/filesystems/fuse/fuse_common.h
> new file mode 100644
> index 000000000000..77d5eb58550d
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_common.h
> @@ -0,0 +1,25 @@
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
> +
> +#define FUSE_USE_VERSION 31
> +#include <fuse_lowlevel.h>
> +
> +#define MAX_ERR_MSG 256
> +
> +#define MOUNTPOINT_TEMPLATE "/tmp/fuse_test_XXXXXX"
> +#define MOUNTPOINT_SZ 64
> +
> +int fs_setup(struct fuse_session **se, char *mountpoint,
> +            const struct fuse_lowlevel_ops *fs_ops,
> +            pthread_t *thread, char *err);
> +void fs_teardown(struct fuse_session *se, pthread_t thread, char *mountp=
oint);
> +
> +#endif /* __SELFTEST_FUSE_COMMON_H__ */
