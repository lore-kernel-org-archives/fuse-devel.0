Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26171480DC9
	for <fuse-devel@lists.linux.dev>; Tue, 21 Jul 2026 10:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630605; cv=pass; b=bVuQvpAdkxSGaQ540QWUTf7NBy42/eeOUA33RQuRVwpAS+wBsSynatxf1+5OLTIAHc6j/Ny5YLiVujAW/byi+Lsq0qbJgn4scqtq7aE0RbT2qydB7xC9Rixi0ogBLhfO0+9aAtYEC0FAN28jlS3wxHSe/qLfSdGk2uhN/1mN+hQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630605; c=relaxed/simple;
	bh=A25viQ7EAG6emyGkQ7HiOnM6vg0tcED8YtAzWy0+LTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktJEOWyKLrbbDPRtFILKtMSsRPmE218QqbFc8VVneAsVZp75ZAtwNUMBu5ZxM0JroRqHq/WCw0LMUxMD1b7f9BFknx9GYrXFye+eYOwN19jj+3SE6flNAFSgvCgX2OirrQskmm1mHWmEaOvTGq9YslAqe6OrOJfk5+20G5TXSkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knZw2ztS; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knZw2ztS"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69e28b554ceso10190132a12.0
        for <fuse-devel@lists.linux.dev>; Tue, 21 Jul 2026 03:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784630601; cv=none;
        d=google.com; s=arc-20260327;
        b=UpIQ4kiVqR5kfCxbIFF8+gdoNT65GfjkjmmVIhrsy3h2R1FVx3ekwinL9nd4uAENMU
         A9ILSKeTlvmczzV1tMkomVzAs39VHq36TBTLGrMJcbLsCHZ0QEJZtvezPSapLyn1K/Rh
         KGKr59cJWUR+5kmO09y7Sb0aCjzvULZxCCQJVDR/ZJhdsb9p5OhK7lcAwrSvBkaPc3eh
         Mzbczdbca239W25kIxUw850Z8JOfvmV6aKDAwz5BT51MOu2LucMmVA+Os+n/4gfmzSNy
         fuO3+avJOaldfI/UrOVmsqBweLMmfv4A209f4HpL8FGlPwYt0eS2/pSOt5BgZHAhBP7W
         CGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jFR4MxJKt991gKtgkD97i/FsFQMAvicdyhpcnCFtKs4=;
        fh=nKE8UBgVqkusZ5kk16hJnHK+tRz2bciolDzALBQWfgQ=;
        b=X6IFgfPpAnEMJyn9bLtVVePeLlyCC/p6WZmOxqTvZVu8ZNGl4Wgd9BhieFsxNE8XFY
         uA0EZBfl1QkqTm033mjcZV/Kk7YvqZijllYxwBnPCAQRq8y5lTZZPfBgX1kmdsSiFtw4
         9tTUuckxrkS5ycb1g5v8Cj+96cMj1nD7IxMxdn45w1QFBlSKMiQx/820qmJLt5X7OCHN
         JH5Lb1NooExq3+yws7S/gSPv2hmRnurD24QwHZS176cisumhQg3wgoa57ilCptsd2t8E
         LIhOR1VXFT3pHuqIe2ZhUWw/+fR1Y2f4/wbjWz3im28b9gb7jVFG6L2FzmCNZtAKnkAe
         gcrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784630601; x=1785235401; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jFR4MxJKt991gKtgkD97i/FsFQMAvicdyhpcnCFtKs4=;
        b=knZw2ztSxfCWWxJpUbuMoG2ZnTnZu0dhiV7MGmp2SJrQIJFfraJ54LTWnyUKR6ckzH
         Puw3KiHIhqg1SJIcS9uD1eYVVRYLWs79zAjBnA1Lv08NagELP1y9y8MlZTNkJEtsCIj1
         cOc6J/HEqY1lhuWWSzOoFY0KwWHDmOX/nSwsReynRR15TBUNOz/c49ufdSnBbP4psqcx
         2dzkZPsq9VNGmXOGQAwyuvA8CaKwAvz83MDGwrukKHvponlVymQrODrTDJo2GsrWj5FE
         85nWrIm2bGl5IfQsTihTcOF+pJf0xHBChPZUnRhE8OGrDntkFO2MYm8pHhLHTWnzDmR+
         Q73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630601; x=1785235401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFR4MxJKt991gKtgkD97i/FsFQMAvicdyhpcnCFtKs4=;
        b=JdUEhOhVy/qUgfDNmbRZ0AXlVcDgbcwQYL0cjj3YocnasSNlEJK9df5sPeKfeVoIBI
         +SP5N9PdmipVgMrq5lBKiItS7cVbHkwYH+X+dG8ZgjyuHOlq3qHmNIRYCT0KEqKCPjxk
         3dIANjiDQtuwIKhBmi2PJkRg6IHu5o6Lf3q6nZocJMGFTdsLtJAsph0kdroInfwWO/BT
         V4FITcHGyI4LesGgTEV4qat0/UYozNFih6TrHwX3aPJy7qIBnS+jQFjtJL3KZL9kfqqZ
         aOfrwP6K3Axto/4iqlXSUlV7klJzyrlU1S5+o0iGejjQOfqI0w3y9A73vqAsFdICZ8pA
         /YbA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6lalmCJ505MiSKLcvXnfZxmjR6sMmzD8MZWClBL6jPzNKXMBcaNG/mJuv8glDLSC8HtriY2sba9Ds@lists.linux.dev
X-Gm-Message-State: AOJu0YzSc5qcZsP/zeZWtCAUoDv4qUSes8w8gt72of3qeDvsaUQbS3zv
	aSzAzb4GrTylC0d4deRtMYKSiOD4nUsqT74H9dqBPyLK6XjW7/QOoJgIWg20WNUul0YAFq+UMVD
	KNLNlDuwQSjkMvebXAfcv/HR0iGkoC1w=
X-Gm-Gg: AR+sD10ZIfe5dwD56tONtzX4nmIhFyeS1f09YmMW9zjtr36N9kYDf4d3jZ3koyE/rbT
	puEyIHEOlkFwpyZaa0PuJnTkLY34xZsqSrBmMbNqy9DjtIBK8QM362+wSPRgAP/lj69sZopEVGT
	zWxiVrK2TPGBsN3/5Yjuf7Krvc+FNb7wKFbuwydFSt3SszoUzbM/jRjNO0Kvllm4ppOZN24iVy6
	69qYUIUyOmDu3e4Sy7bdTjplIYEZFo7/XhzKsiwaBkjW/eAWAxvjOQPvYrjM2g=
X-Received: by 2002:a05:6402:5186:b0:697:cd86:7626 with SMTP id
 4fb4d7f45d1cf-69e6525c6a4mr6666445a12.8.1784630601191; Tue, 21 Jul 2026
 03:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708131122.2917-1-luis@igalia.com> <20260708131122.2917-6-luis@igalia.com>
In-Reply-To: <20260708131122.2917-6-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Jul 2026 12:43:09 +0200
X-Gm-Features: AUfX_mzJE1zhKJjoqFDdPmAYFJP_IT0AkKnoZ5roRGFl4ifYtgBZ-2w1TlYJLYo
Message-ID: <CAOQ4uxg6WHG1S4--ZN7dsEnYOKY+q8y6qCNYL7=UE+=9G4-+GQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/5] selftests/filesystems: add fuse ACLs caching test
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 3:11=E2=80=AFPM Luis Henriques <luis@igalia.com> wro=
te:
>
> This patch adds a simple test that allows to verify that ACLs caching is
> working as expected.  I.e. it verifies that, if FUSE_POSIX_ACL flag is se=
t,
> user-space is only called once when accessing an inode ACL and that
> subsequent accesses are cached in the kernel.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/.gitignore     |   2 +
>  .../selftests/filesystems/fuse/Makefile       |  13 +-
>  .../selftests/filesystems/fuse/acl_fs.c       | 216 ++++++++++++++++++
>  .../selftests/filesystems/fuse/acl_test.sh    |  66 ++++++
>  .../selftests/filesystems/fuse/setgetacl.c    |  62 +++++
>  5 files changed, 357 insertions(+), 2 deletions(-)
>  create mode 100644 tools/testing/selftests/filesystems/fuse/acl_fs.c
>  create mode 100755 tools/testing/selftests/filesystems/fuse/acl_test.sh
>  create mode 100644 tools/testing/selftests/filesystems/fuse/setgetacl.c
>
> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/=
testing/selftests/filesystems/fuse/.gitignore
> index cfdc5ca3ded4..1733ebb9d7fd 100644
> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
> @@ -2,3 +2,5 @@
>  fuse_mnt
>  fusectl_test
>  symlink_fs
> +acl_fs
> +setgetacl
> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/te=
sting/selftests/filesystems/fuse/Makefile
> index 342da0878006..3bbf9d837e9a 100644
> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> @@ -3,8 +3,8 @@
>  CFLAGS +=3D -Wall -O2 -g $(KHDR_INCLUDES)
>
>  TEST_GEN_PROGS :=3D fusectl_test
> -TEST_PROGS :=3D symlink_test.sh
> -TEST_GEN_FILES :=3D fuse_mnt symlink_fs
> +TEST_PROGS :=3D symlink_test.sh acl_test.sh
> +TEST_GEN_FILES :=3D fuse_mnt symlink_fs acl_fs setgetacl
>
>  include ../../lib.mk
>
> @@ -18,8 +18,17 @@ ifeq ($(VAR_LDLIBS),)
>  VAR_LDLIBS :=3D -lfuse3 -pthread
>  endif
>
> +ACL_CFLAGS :=3D $(shell pkg-config libacl --cflags 2>/dev/null)
> +ACL_LDLIBS :=3D $(shell pkg-config libacl --libs 2>/dev/null)
> +
>  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
>
>  $(OUTPUT)/symlink_fs: CFLAGS +=3D $(VAR_CFLAGS)
>  $(OUTPUT)/symlink_fs: LDLIBS +=3D $(VAR_LDLIBS)
> +
> +$(OUTPUT)/acl_fs: CFLAGS +=3D $(VAR_CFLAGS)
> +$(OUTPUT)/acl_fs: LDLIBS +=3D $(VAR_LDLIBS)
> +
> +$(OUTPUT)/setgetacl: CFLAGS +=3D $(ACL_CFLAGS)
> +$(OUTPUT)/setgetacl: LDLIBS +=3D $(ACL_LDLIBS)
> diff --git a/tools/testing/selftests/filesystems/fuse/acl_fs.c b/tools/te=
sting/selftests/filesystems/fuse/acl_fs.c
> new file mode 100644
> index 000000000000..4b5e0073ab4f
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/acl_fs.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Simple filesystem to test FUSE ACLs cache
> + *
> + * This is a simple FUSE filesystem that contains a single object (a fil=
e named
> + * 'file') and which allows to set the 'system.posix_acl_access' ACL on =
that
> + * object.  Whenever this ACL is read from the FUSE filesystem, a counte=
r is
> + * incremented.  And value for this counter can be obtained from reading=
 from
> + * this file.
> + *
> + * When ACLs are being cached (the '--cache' argument was used to mount =
this
> + * filesystem), this counter will only be incremented the first time the=
 ACL is
> + * read, as the kernel won't be calling into user-space again until that=
 cache
> + * is invalidated.
> + */
> +#define FUSE_USE_VERSION FUSE_MAKE_VERSION(3, 12)
> +
> +#include <fuse_lowlevel.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <time.h>
> +#include <sys/stat.h>
> +#include <sys/param.h>
> +#include <sys/xattr.h>
> +
> +#define FILE   "file"
> +#define TIMEOUT        86400.0f
> +
> +static struct options {
> +       int cache_acls;
> +} options;
> +
> +static const struct fuse_opt option_spec[] =3D {
> +       { "--cache", offsetof(struct options, cache_acls), 1 },
> +       FUSE_OPT_END
> +};
> +
> +static int getxattr_counter =3D 0;
> +
> +static void acl_init(void *userdata, struct fuse_conn_info *conn)
> +{
> +       if (options.cache_acls)
> +               fuse_set_feature_flag(conn, FUSE_CAP_POSIX_ACL);
> +       else
> +               fuse_unset_feature_flag(conn, FUSE_CAP_POSIX_ACL);
> +}
> +
> +static int acl_stat(fuse_ino_t ino, struct stat *stbuf)
> +{
> +       char data[64];
> +
> +       stbuf->st_ino =3D ino;
> +       switch (ino) {
> +       case 1:
> +               stbuf->st_mode =3D S_IFDIR | 0755;
> +               stbuf->st_nlink =3D 2;
> +               break;
> +       case 42:
> +               stbuf->st_mode =3D S_IFREG | 0444;
> +               stbuf->st_nlink =3D 1;
> +               stbuf->st_size =3D sprintf(data, "%d\n", getxattr_counter=
);
> +               break;
> +       default:
> +               return -1;
> +       }
> +
> +       stbuf->st_uid =3D getuid();
> +       stbuf->st_gid =3D getgid();
> +       stbuf->st_atime =3D stbuf->st_mtime =3D stbuf->st_ctime =3D time(=
NULL);
> +
> +       return 0;
> +}
> +
> +static void acl_lookup(fuse_req_t req, fuse_ino_t parent, const char *na=
me)
> +{
> +       struct fuse_entry_param e;
> +
> +       memset(&e, 0, sizeof(e));
> +
> +       if (parent !=3D 1 || strcmp(name, FILE) !=3D 0)
> +               fuse_reply_err(req, ENOENT);
> +       else {
> +               e.ino =3D 42;
> +               e.attr_timeout =3D TIMEOUT;
> +               e.entry_timeout =3D TIMEOUT;
> +               acl_stat(e.ino, &e.attr);
> +               fuse_reply_entry(req, &e);
> +       }
> +}
> +
> +static void acl_getattr(fuse_req_t req, fuse_ino_t ino,
> +                       struct fuse_file_info *fi)
> +{
> +       struct stat attr;
> +
> +       memset(&attr, 0, sizeof(struct stat));
> +       if (acl_stat(ino, &attr) =3D=3D -1)
> +               fuse_reply_err(req, ENOENT);
> +       else
> +               fuse_reply_attr(req, &attr, TIMEOUT);
> +}
> +
> +static void acl_read(fuse_req_t req, fuse_ino_t ino, size_t size,
> +                    off_t off, struct fuse_file_info *fi)
> +{
> +       char data[64];
> +       int len;
> +
> +       len =3D sprintf(data, "%d\n", getxattr_counter);
> +       if (off < len)
> +               fuse_reply_buf(req, data + off, MIN(len - off, size));
> +       else
> +               fuse_reply_buf(req, NULL, 0);
> +}
> +
> +char *xattr_value =3D NULL;
> +size_t xattr_value_sz =3D 0;
> +
> +static void acl_setxattr(fuse_req_t req, fuse_ino_t ino, const char *nam=
e,
> +                        const char *value, size_t size, int flags)
> +{
> +       int ret =3D 0;
> +
> +       if (ino !=3D 42)
> +               ret =3D ENOENT;
> +       else if (!strcmp(name, "system.posix_acl_access")) {
> +               if (xattr_value)
> +                       free(xattr_value);
> +               xattr_value =3D malloc(size);
> +               memcpy(xattr_value, value, size);
> +               xattr_value_sz =3D size;
> +       } else
> +               ret =3D ENOTSUP;
> +
> +       fuse_reply_err(req, ret);
> +}
> +
> +static void acl_getxattr(fuse_req_t req, fuse_ino_t ino, const char *nam=
e,
> +                        size_t size)
> +{
> +       if (ino !=3D 42)
> +               fuse_reply_err(req, ENOENT);
> +       else if (!xattr_value || strcmp(name, "system.posix_acl_access"))
> +               fuse_reply_err(req, ENODATA);
> +       else if (size) {
> +               fuse_reply_buf(req, xattr_value, xattr_value_sz);
> +               getxattr_counter++;
> +       } else
> +               fuse_reply_xattr(req, xattr_value_sz);
> +}
> +
> +static const struct fuse_lowlevel_ops acl_op =3D {
> +       .init           =3D acl_init,
> +       .lookup         =3D acl_lookup,
> +       .getattr        =3D acl_getattr,
> +       .getxattr       =3D acl_getxattr,
> +       .setxattr       =3D acl_setxattr,
> +       .read           =3D acl_read,
> +};
> +
> +int main(int argc, char *argv[])
> +{
> +       struct fuse_session *se;
> +       struct fuse_loop_config *config;
> +       struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
> +       struct fuse_cmdline_opts opts;
> +       int ret =3D -1;
> +
> +       options.cache_acls =3D 0;
> +
> +       if (fuse_parse_cmdline(&args, &opts) !=3D 0)
> +               return ret;
> +
> +       if (opts.mountpoint =3D=3D NULL) {
> +               printf("usage: %s [options] <mountpoint>\n", argv[0]);
> +               goto out_args;
> +       }
> +
> +       if (fuse_opt_parse(&args, &options, option_spec, NULL) =3D=3D -1)
> +               goto out_args;
> +
> +       se =3D fuse_session_new(&args, &acl_op, sizeof(acl_op), NULL);
> +       if (!se)
> +               goto out_args;
> +       if (fuse_set_signal_handlers(se))
> +               goto out_session;
> +       if (fuse_session_mount(se, opts.mountpoint))
> +               goto out_signal;
> +
> +       fuse_daemonize(opts.foreground);
> +       if (opts.singlethread) {
> +               ret =3D fuse_session_loop(se);
> +       } else {
> +               config =3D fuse_loop_cfg_create();
> +               fuse_loop_cfg_set_clone_fd(config, opts.clone_fd);
> +               fuse_loop_cfg_set_max_threads(config, opts.max_threads);
> +               ret =3D fuse_session_loop_mt(se, config);
> +               fuse_loop_cfg_destroy(config);
> +               config =3D NULL;
> +       }
> +       fuse_session_unmount(se);
> +
> +out_signal:
> +       fuse_remove_signal_handlers(se);
> +out_session:
> +       fuse_session_destroy(se);
> +out_args:
> +       free(opts.mountpoint);
> +       fuse_opt_free_args(&args);
> +
> +       return ret;
> +}
> diff --git a/tools/testing/selftests/filesystems/fuse/acl_test.sh b/tools=
/testing/selftests/filesystems/fuse/acl_test.sh
> new file mode 100755
> index 000000000000..9070c51c6784
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/acl_test.sh
> @@ -0,0 +1,66 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +exit_cleanup()
> +{
> +       fusermount -u ./mnt
> +       rmdir ./mnt
> +}
> +
> +assert_value ()
> +{
> +       if [ $1 -ne $2 ]; then
> +               echo "FAILED"
> +               echo $3
> +               exit 1
> +       fi
> +}
> +
> +set -e
> +
> +trap exit_cleanup EXIT
> +
> +mkdir -p mnt
> +
> +#sudo su -
> +#cd /home/miguel/kernel/linux/tools/testing/selftests/filesystems/fuse
> +#dmesg -c > /dev/null
> +#tmux -S ./bla -f a
> +#./acl_fs -d --cache ./mnt
> +#setfacl -m u:daemon:r mnt/file
> +#getfacl mnt/file
> +
> +./acl_fs ./mnt
> +
> +echo -n "Testing ACLs without cache: "
> +
> +# set ACL
> +./setgetacl ACCESS u::rw-,g::rw-,o::rw-,u:nobody:r--,m::rw- mnt/file
> +
> +# When symlink caching is disabled every access to a symlink is expected=
 to
> +# result in a call to user-space
> +for i in $(seq 1 10); do
> +       ./setgetacl ACCESS mnt/file > /dev/null
> +done
> +
> +res=3D$(cat ./mnt/file)
> +assert_value $res $i "Got $res, expected $i"
> +echo "PASSED"
> +
> +fusermount -u ./mnt
> +
> +./acl_fs --cache ./mnt
> +
> +echo -n "Testing ACLs with cache: "
> +
> +# set ACL
> +./setgetacl ACCESS u::rw-,g::rw-,o::rw-,u:nobody:r--,m::rw- mnt/file
> +
> +# With caching enabled, there will be a single call into user-space
> +for i in $(seq 1 10); do
> +       ./setgetacl ACCESS mnt/file > /dev/null
> +done
> +res=3D$(cat ./mnt/file)
> +assert_value $res 1 "Got $res, expected 1"
> +
> +echo "PASSED"
> diff --git a/tools/testing/selftests/filesystems/fuse/setgetacl.c b/tools=
/testing/selftests/filesystems/fuse/setgetacl.c
> new file mode 100644
> index 000000000000..035e7daa1c5d
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/setgetacl.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/* Simple ACL set/get wrapper */
> +
> +#include <stdio.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/types.h>
> +#include <sys/acl.h>
> +
> +int main(int argc, char *argv[])
> +{
> +       acl_t acl;
> +       acl_type_t type;
> +       char *buf;
> +
> +       if ((argc !=3D 3) && (argc !=3D 4)) {
> +               fprintf(stderr, "Usage: %s <acl type> [<value>] <file>\n"=
,
> +                       argv[0]);
> +               fprintf(stderr, "where <acl type> is ACCESS or DEFAULT\n"=
);
> +               return 1;
> +       }
> +
> +       if (!strcmp(argv[1], "ACCESS"))
> +               type =3D ACL_TYPE_ACCESS;
> +       else if (!strcmp(argv[1], "DEFAULT"))
> +               type =3D ACL_TYPE_DEFAULT;
> +       else {
> +               fprintf(stderr, "Invalid ACL type\n");
> +               return 1;
> +       }
> +
> +       if (argc =3D=3D 3) {
> +               /* Get ACL */
> +               acl =3D acl_get_file(argv[2], type);
> +               if (acl =3D=3D NULL) {
> +                       perror("acl_get_file");
> +                       return 1;
> +               }
> +               buf =3D acl_to_text(acl, NULL);
> +               if (buf =3D=3D NULL)
> +                       perror("acl_from_text");
> +               else {
> +                       fprintf(stdout, "%s\n", buf);
> +                       acl_free(buf);
> +               }
> +       } else {
> +               /* Set ACL */
> +               acl =3D acl_from_text(argv[2]);
> +               if (acl =3D=3D NULL) {
> +                       perror("acl_from_text");
> +                       return 1;
> +               }
> +               if (acl_set_file(argv[3], type, acl) !=3D 0)
> +                       perror("acl_set_file");
> +       }
> +
> +       acl_free(acl);
> +
> +       return 0;
> +}
>

I think this test is already covered by
https://lore.kernel.org/linux-fsdevel/20260713220932.413004-3-amir73il@gmai=
l.com/

If there is any missing coverage, it could be added to my test,
assuming that my test (which tests a regression) will be merged first.

Thanks,
Amir.
