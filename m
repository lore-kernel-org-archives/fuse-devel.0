Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AB547DF9B
	for <fuse-devel@lists.linux.dev>; Tue, 21 Jul 2026 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630377; cv=pass; b=HY2iEDZLW0oq+UB1wwsXUsMCf7sYAEDHHU8xGzFph4HfzeapprbYAugOBlZDSvK9/0S/L/xJyKfWzCVZLKx7GPGa7ilu8dFXxBkaWMVBLcxuMvHkdEtHwrcWjqoKbjucbGz6MLi3cwx0mkc0l44P+iaOtssSCdlDP3ZkdWRA728=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630377; c=relaxed/simple;
	bh=XZGHCmg6TBJYjgMIect/KToxzi5RrtqxOX1ZKL7mmsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/s+EhBAKC8nTwGR5R2TSHFlQo1Ak9yhA88wOyf88JeCY+tuCO/5hwgN4ZisxHlauCtbcJyXjwqxF+X6joYlet4mVuMVMJGKu+5WLXiq5rTUJDc+ZCL6Ig4Gx0nCW+mzMiEpwsgijDHa13VbK9yFiCz0r7FA0Smk1sb9ioGxH5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtoaKXww; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtoaKXww"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69e5f8a193bso5988495a12.2
        for <fuse-devel@lists.linux.dev>; Tue, 21 Jul 2026 03:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784630374; cv=none;
        d=google.com; s=arc-20260327;
        b=ZG4QmQQUeIHG3vbExUkzPcvgar4HMXaehFs4ASWTTYTtg+M0SQiIkWS322f+dyED8V
         jg+57vaJusFLkFr/xOyqED4fvG2z9a+KLSN9/w4KBaiOPdIe6actBo0Kz8XficfPdgpb
         Kf6E/AfCJDefYBGLPOdUHBfXS501+umrb98mmSLw9yfwjCZUKiQcUbotFUhqsm7yFxzn
         xalZCGRYOC+TCu3afJSqsrGQgSN6j50tCp+3UlxCVZO/odI1oGYhx5IgWgAVsI3BiLfG
         HgMvxRzacBZ4EKGNnmS59Vp8pAGAYSlclQmRK2vmdksqmuEn33rlF74rFHXtlmtUveDQ
         5KlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+juJHzVoFamh7S+C2xEheDkvInVCn4UAMogNf2TTBRY=;
        fh=ytPK1343J1L5th+QH6Io1oW0uvpcTNkuQ7uIL3FtdVQ=;
        b=TBMsld750PoC4LN54+f+wehuRcZa6Q1xxNqd/Imkqk84z/2cbZ99wrc8otRIPhDZJW
         7YccN47yySTkTFKZixCSZU317mebrExRFlJpxMdtYb/6r3zna3nJsyGBrpLbKRJndfBn
         r7jn1PRTtafAQzxDH0cDsGFKw4rdvr7EYUK72ljQdYaj/FZR18H+/OZC9cmw+ebHW9l5
         vZneloMmn+prPBOGyEOx/c3Oxn8zPHT8A4XW9J23NiCqw08MbDRSBmHBO+/cjkhWU6t5
         F3631fA9FBQcc2hDPLj9mmBPj702I5Tf40LBIhExGbKNtFAHpYF9tkh7WOdaW2x97d+Y
         maKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784630374; x=1785235174; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+juJHzVoFamh7S+C2xEheDkvInVCn4UAMogNf2TTBRY=;
        b=jtoaKXww2tDVQocL+XqEtKcJri9j6wgEr7PEgYhSte/oqDBuSa1u4JXWSYxwejXvHe
         nTYEYhKRp7SioOW82YERRFFAB9OrEzYqnG+YPFdPq6IMSbRJ4LUfgL4WIql7iRBke2xF
         2tSTU13Bg4H6Ms4I8BN+wKAxfrvaO3xSJxp3kVjPFL4jc1EA5BAMZF6fY+76hmsshq65
         9aud0vZ1zjT2mAzasDGyxBUd3hW77JqvsEVhUo3oclK3eRVQBxQuMQWTnX1MCAa/xXeu
         A2PWIVvrr6kSXawJF7MrS5lxWpN/KrLQZtqD0EHcERzMbVZQsBVpU3L4zinXRWFTnwL2
         aDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630374; x=1785235174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+juJHzVoFamh7S+C2xEheDkvInVCn4UAMogNf2TTBRY=;
        b=W9Hh2jVp6eizVSxPGKvGTlwoqO4/HIFdq+8TFhjECtEbxmQWVVqHoNO9eAY+EiqFZI
         wrgAtGK8MLlQkVYBt7Z9/jdKUuRq3xmL5+pTOYqqJEVYZGRTpQLsHqjo9AJYvxZCCTtn
         zu8YDycuVMOa4uKW89B+zbrreg+cFLs1I7F11hMHBSV3lVpwkVI9xgi/6McAtAnU3MLa
         14ME4j3QkypvZxIjZJ2WiLFo8yOSohDI9iYNHbl9MGq0f2OX5iXveiiX73i57swIQCPx
         Dy2zGxUrKWhYld4ZjLZNUPXctv0EB5tutKBkcKHpXKwWCtjJLn/q6wf/lCBYzPy1+rPJ
         DdjA==
X-Forwarded-Encrypted: i=1; AHgh+RqLa4v85e5bI1qDZIxNsFpY4ePogxeQ5GskYFLvQSfo08X8qTX4dU8/1m0ffojimG+8JXfsLxNZ1FUb@lists.linux.dev
X-Gm-Message-State: AOJu0Yxtjb2Wgegk27O/JVdEYfPTfk7AnhFGG15BUz8pFq9gw+nBZ2Md
	svTRTnhMEpQte5suGvYbO/F3mSP6+El+/Yu55Srtplya2DOVgbcJlLZYI++FMOHWgNbB6dyPG/a
	CE3dZyGSnGIrjvW7qKaV0zncsBdxW4m4=
X-Gm-Gg: AR+sD11bU3TjkuR3hjA258CEDmL64GTIneURZjnqhsV9HTRx4bRfKDpGLVLl8xbi5yD
	eRo/uW/36CmixrpJGKUyiojHVsAa0k3dxt8LBPSDJayLDDypX9clDCPD+RNBXq4wwMuXZmMnbg3
	1pxPHWTqey3ElCD/1LWUYqZjPO75caxeVJdv4JQZeaN/4ucFeZQnDPvoxWcJBuYSRwk3zYMSi1W
	kHPrgdNKq/qq9HnqJwwDntnkJaLjqo+8WZ5kAOVwsM2WObeOHg+kt34ZGVM+wo=
X-Received: by 2002:a05:6402:2547:b0:698:ad4b:abe1 with SMTP id
 4fb4d7f45d1cf-69e652b057emr6842578a12.27.1784630373641; Tue, 21 Jul 2026
 03:39:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708131122.2917-1-luis@igalia.com> <20260708131122.2917-5-luis@igalia.com>
In-Reply-To: <20260708131122.2917-5-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Jul 2026 12:39:22 +0200
X-Gm-Features: AUfX_mw-as6l6Zy89-e3FLAF03oa9ZdPjmY0IaC2DMkG4PcsftqTr3WAv-bdzMM
Message-ID: <CAOQ4uxiOqkXfySiFcYhWUR_c1_UeAA62vK2Py-ML=TpQyrUbCw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/5] selftests/filesystems: add fuse symlink
 caching test
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
> This patch adds a simple test that allows to verify that, when resolving =
a
> symlink, user-space is called only the first time when caching is enabled
> or, if caching is disabled, every time the symlink resolution is requeste=
d.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>  .../selftests/filesystems/fuse/Makefile       |   6 +-
>  .../selftests/filesystems/fuse/symlink_fs.c   | 115 ++++++++++++++++++
>  .../filesystems/fuse/symlink_test.sh          |  52 ++++++++
>  4 files changed, 173 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/filesystems/fuse/symlink_fs.c
>  create mode 100755 tools/testing/selftests/filesystems/fuse/symlink_test=
.sh
>
> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/=
testing/selftests/filesystems/fuse/.gitignore
> index 3e72e742d08e..cfdc5ca3ded4 100644
> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  fuse_mnt
>  fusectl_test
> +symlink_fs
> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/te=
sting/selftests/filesystems/fuse/Makefile
> index 422cd1b1688d..342da0878006 100644
> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> @@ -3,7 +3,8 @@
>  CFLAGS +=3D -Wall -O2 -g $(KHDR_INCLUDES)
>
>  TEST_GEN_PROGS :=3D fusectl_test
> -TEST_GEN_FILES :=3D fuse_mnt
> +TEST_PROGS :=3D symlink_test.sh
> +TEST_GEN_FILES :=3D fuse_mnt symlink_fs
>
>  include ../../lib.mk
>
> @@ -19,3 +20,6 @@ endif
>
>  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
> +
> +$(OUTPUT)/symlink_fs: CFLAGS +=3D $(VAR_CFLAGS)
> +$(OUTPUT)/symlink_fs: LDLIBS +=3D $(VAR_LDLIBS)
> diff --git a/tools/testing/selftests/filesystems/fuse/symlink_fs.c b/tool=
s/testing/selftests/filesystems/fuse/symlink_fs.c
> new file mode 100644
> index 000000000000..1aee26c91b3f
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/symlink_fs.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Simple filesystem to test FUSE symlink cache
> + *
> + * This is a simple FUSE filesystem that contains two objects: a file na=
med
> + * 'file' and a symlink to that file named 'link'.  Whenever the ->readl=
ink() is
> + * executed to resolve 'link' a counter will be incremented.  A ->read()=
 to any
> + * filesystem object will return the value in this counter.
> + *
> + * A '--cache' argument will allow to enable symlink caching (disabled b=
y
> + * default).  This means that, if caching is enabled, resolving a symlin=
k will
> + * only call into user-space the first time.
> + */
> +
> +#define FUSE_USE_VERSION 31
> +
> +#include <fuse.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stddef.h>
> +#include <assert.h>
> +
> +#define FILE   "file"
> +#define LINK   "link"
> +
> +static struct options {
> +       int cache_symlinks;
> +} options;
> +
> +static const struct fuse_opt option_spec[] =3D {
> +       { "--cache", offsetof(struct options, cache_symlinks), 1 },
> +       FUSE_OPT_END
> +};
> +
> +static int readlink_counter =3D 0;
> +
> +static void *symlink_init(struct fuse_conn_info *conn, struct fuse_confi=
g *cfg)
> +{
> +       if (options.cache_symlinks)
> +               fuse_set_feature_flag(conn, FUSE_CAP_CACHE_SYMLINKS);
> +
> +       return NULL;
> +}
> +
> +static int symlink_getattr(const char *path, struct stat *stbuf,
> +                          struct fuse_file_info *fi)
> +{
> +       int res =3D 0;
> +
> +       memset(stbuf, 0, sizeof(struct stat));
> +       if (strcmp(path, "/") =3D=3D 0) {
> +               stbuf->st_mode =3D S_IFDIR | 0755;
> +               stbuf->st_nlink =3D 2;
> +       } else if (strcmp(path + 1, FILE) =3D=3D 0) {
> +               char data[64];
> +
> +               stbuf->st_mode =3D S_IFREG | 0444;
> +               stbuf->st_nlink =3D 1;
> +               stbuf->st_size =3D sprintf(data, "%d\n", readlink_counter=
);
> +       } else if (strcmp(path + 1, LINK) =3D=3D 0) {
> +               stbuf->st_mode =3D S_IFLNK | 0444;
> +               stbuf->st_nlink =3D 1;
> +               stbuf->st_size =3D strlen(FILE);
> +       } else
> +               res =3D -ENOENT;
> +
> +       return res;
> +}
> +
> +static int symlink_readlink(const char *path, char *buf, size_t size)
> +{
> +       if (strcmp(path + 1, LINK) !=3D 0)
> +               return -ENOENT;
> +
> +       memcpy(buf, FILE, strlen(FILE));
> +       readlink_counter++;
> +
> +       return 0;
> +}
> +
> +static int symlink_read(const char *path, char *buf, size_t sz, off_t of=
f,
> +                       struct fuse_file_info *fi)
> +{
> +       char data[64];
> +       int len;
> +
> +       len =3D sprintf(data, "%d\n", readlink_counter);
> +       memcpy(buf, data, len);
> +
> +       return len;
> +}
> +
> +static const struct fuse_operations symlink_oper =3D {
> +       .init           =3D symlink_init,
> +       .getattr        =3D symlink_getattr,
> +       .readlink       =3D symlink_readlink,
> +       .read           =3D symlink_read,
> +};
> +
> +int main(int argc, char *argv[])
> +{
> +       int ret;
> +       struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
> +
> +       options.cache_symlinks =3D 0;
> +       if (fuse_opt_parse(&args, &options, option_spec, NULL) =3D=3D -1)
> +               return 1;
> +
> +       ret =3D fuse_main(args.argc, args.argv, &symlink_oper, NULL);
> +       fuse_opt_free_args(&args);
> +
> +       return ret;
> +}
> diff --git a/tools/testing/selftests/filesystems/fuse/symlink_test.sh b/t=
ools/testing/selftests/filesystems/fuse/symlink_test.sh
> new file mode 100755
> index 000000000000..546541c1920e
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/symlink_test.sh
> @@ -0,0 +1,52 @@
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
> +./symlink_fs ./mnt
> +
> +echo -n "Testing symlink without cached: "
> +
> +# When symlink caching is disabled every access to a symlink is expected=
 to
> +# result in a call to user-space
> +for i in $(seq 1 10); do
> +       readlink ./mnt/link > /dev/null
> +done
> +
> +res=3D$(cat ./mnt/file)
> +assert_value $res $i "Got $res, expected $i"
> +echo "PASSED"
> +
> +fusermount -u ./mnt
> +
> +./symlink_fs --cache ./mnt
> +
> +echo -n "Testing symlink with cache: "
> +
> +# With caching enabled, there will only be a single call into user-space
> +for i in $(seq 0 10); do
> +       readlink ./mnt/link > /dev/null
> +done
> +
> +res=3D$(cat ./mnt/file)
> +assert_value 1 $res "Got $ res, expected 1"
> +echo "PASSED"
>

As we discussed, consider doing this as a single c test program,
but not a must as you wish.

Thanks,
Amir.
