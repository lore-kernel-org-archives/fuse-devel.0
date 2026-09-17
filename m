Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CC8582BA6
	for <fuse-devel@lists.linux.dev>; Thu, 17 Sep 2026 15:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658506; cv=pass; b=gWrm5YJU/8PaKfFnMCaliShGYKFzVgs6g32o/3KQIWOr8xQ6tzN0hr1aTpvCkn+6OxJ2GqGHzIK7kou94rJvyMvxOwg8jqnwUT74YP2+HbaQVw9Vl6Xhlk55eSk4B/jEgMEd9djiWM9Qbh02bFxwAOHPXlTXAzqjurLaXE8B+z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658506; c=relaxed/simple;
	bh=9FMDsPvWFuaAQkxmti4fhgAl1YH9QRCR8rYM6KPLS7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kY9W20E87hKkXy0hpC2XK9HwOZf5k6BBxqLtusDOZLIT6tasvoTkVgy5NnR36fs34OQwKZI+n+lkSsuBAxi+ZqLJznKYwLe9j8QKMURIrkr/d4EUPBJFYqzwNXK9N6MF0SoM0zO5h2mkLl9DVHnP/KT2a0co0urha1KFL5SNWRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjsV//YJ; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjsV//YJ"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so1561016a12.3
        for <fuse-devel@lists.linux.dev>; Thu, 17 Sep 2026 08:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789658491; cv=none;
        d=google.com; s=arc-20260327;
        b=mTK2XJ8PJ+cVuVRQ+yur9nC37kSVHz5hM7AMtgBbcrrupdJtqUs5KD4cGSBTS7e8uz
         oLrXd+i7/tIubo9hMm1akRi55/yrMHhUffkzjzUWpwN0OKpOI0lJKM004FEi+0r64lpY
         Af8pLlT1aSa1Ufl33jOuqaJAdLu/VWCzV2IjilETIBLhuh9cCl2xomY+QytQnHwQxXcn
         h2xta1US0Lufl0ZX1/ZQy5vDofDrd7aSA7HC/E5FhZVGBP1qz0JtawwTVHQNpioUhJh2
         cxr6E16yGs2OZQpx0v59Mrck1GUtli8vQ3zBffca7/wWefvU7d8r+8WB5aAJxQ8Rudwd
         QsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NAwClXXmqNprsBD+FWNB/mej+9Qh0o9RwyNuH9u1Nto=;
        fh=GqDv2nypt53x9U5pqymPHO80x6tnHxU+5o1G1xHsTXM=;
        b=IICp9rMHWEIhYnSMuv0kVmSf2JHnQGDqUDxwn2GlpfwLldOS4sYr6XO+V41Q2UWneJ
         dq6v+JHgex5xw7fZlkitu9AZ50LMKDOwp6Q/onxDiwar0wuEsdwWTgXFuHziW9ebdry6
         KQskSCxsNxffbx9H6PjlZndaAF4ERbPI0l4hnHierKNnI7Q8GbQB2LmmajOcLR/Ox0kv
         cnkGXopbiWcPhHE49EtF/KRATSM3Tr4Diq7/LA9XU2IVKNh9UmlrgRp9QpodVviThGcJ
         WdsyFxRtDSYLl2znD4ZH9NmXYfFA5FXqdpQ3D3fcIl2yogL7ve9rhWpso2gpAFvDvCqW
         Y7RQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789658491; x=1790263291; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NAwClXXmqNprsBD+FWNB/mej+9Qh0o9RwyNuH9u1Nto=;
        b=AjsV//YJU7akYs8x2bN3bGPjHyucta9f38Yr31XCyZGZ610WkFmlsy5jzJ+l0wPaG5
         MRi0n8FBpRwHldhdW9Cr8Dw97OGvnvmRSalclZjepMT6eN6rluxHIFCD000eBdbUT7UL
         ozg5a22kNWxqEqQjoWbLhM6MyGuxqKMLdWtRG5328kvH7o/QMbIQ58oVYHx6OEsQqwho
         5f3MgLQC0lO6nllNUGKVJ/RzVHSX76Ix/CpH2calf6pqEyFlnbU1P7NEAz33Mk08Zq66
         Xl2NG81An6qVm1+Zxxr/KJ5qPHMd9Fh1+HvBMdS4e1YG8Hvpvzx2uqI+ZYsuriyiW6VH
         3cYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658491; x=1790263291;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAwClXXmqNprsBD+FWNB/mej+9Qh0o9RwyNuH9u1Nto=;
        b=YWP5bEnvEI0HJp831Z2mAQOZ1vlN81FKc4A1dk4NJ4ldv5F/QCAHZtjdVc30mP5cSx
         CVyE1p6f0+IpFIrm0RBbiqGVNS141Eey4eiE6Ed/Okd/pN2kUHNEFNxo6PRc9opfqbWm
         cLBxfPUS4dAhkwuG5kG1IhShf8cVVUGKQqTzL8TYrlAtxmkGokaGhRXKQssPIzn9OM6K
         mDd6hp+x069hpuNWEy5K1XMwhexJRdCjUCmgsYijTxLCA0QkDojrTANqTFJ1fJ2GVYRV
         2BId1OlGPaBy3GMlMD6XwAb6dlc5+6VTSZkq5wZH8/47oZA17DzDgD2Du8VJ3922ltyy
         HYJw==
X-Forwarded-Encrypted: i=1; AKwUvBwhIVH3KY9BvW1Zae2GBeVcb4JaXGNs6ucEE9XBwqc5WO0QgUMJrZdeQQ/SQvfRtc3rP3YPymUT382A@lists.linux.dev
X-Gm-Message-State: AFuF++nfgAKQ79Zb5Ne/lAUH8BTMu1y//5yyC3+Fm++qNPrcJdrF5pjf
	CkTfDhcM9hXISNVYNFuwjLYgk3avAEiQL5p9hJwQg3uc3x4m6fMLFZ3PVi1bwOwVpH/2Tfzz29O
	T1QP8l6tKQz/1/pIiAs43NQ/tuV+LChY=
X-Gm-Gg: AYBFou2luSKklAT8BpzCYSYqZkJvuk4ZgLdXN+/2Dk7TQnvxSmAH51kTGcFiu7jW9fx
	lk052iI3/2j5On255lwnDTnI45wIipDwmGoSK6LQmQD2ywm50hfP0tNOrMV1naYIN9oZz+nvLIK
	5FuhDnTLinlvMByYnPBYy5Zz1nYNXE7m7QfTjDS8ogcqRYZ6pxe0LxNod60hzc+SsR1ljbRCbvd
	MYgsVaOOqBJhRhM4/n0bp36pvJbgBeWYYacoTFJ2k11HqLi8ZjvnkZ4JSDDbBtD8zbh2oTYYXTn
	pxs1Oh9no5BqkPtakdXzF/tqoPCWaDm5aBqdr4StxW3Bdu+eQ89Vr6SV
X-Received: by 2002:a05:6402:42c4:b0:6a9:c0ec:417a with SMTP id
 4fb4d7f45d1cf-6aa2241bf59mr10245245a12.18.1789658490477; Thu, 17 Sep 2026
 08:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916155629.32421-1-luis@igalia.com> <20260916155629.32421-9-luis@igalia.com>
In-Reply-To: <20260916155629.32421-9-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 17 Sep 2026 17:21:17 +0200
X-Gm-Features: AcwNN1URwt29tlBxEkB9KVLT9efpa4yicFwd1VKtlhlpwfUBFhqmHoQc4ZfkvOU
Message-ID: <CAOQ4uxiEm5njmBUX6XEv9049RLgdEoj53vbhtmtxrpRBYS+R-Q@mail.gmail.com>
Subject: Re: [RFC PATCH v4 8/8] selftests/fuse: add fuse readdir caching test
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
> This new test will check the caching behaviour using combinations of two
> opendir flags: FOPEN_KEEP_CACHE and FOPEN_CACHE_DIR.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>  .../selftests/filesystems/fuse/Makefile       |   2 +
>  .../fuse/fuse_readdir_cache_test.c            | 274 ++++++++++++++++++
>  3 files changed, 277 insertions(+)
>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_readdir=
_cache_test.c
>
> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/=
testing/selftests/filesystems/fuse/.gitignore
> index ebfe7133d811..ffa356f23e8c 100644
> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
> @@ -4,3 +4,4 @@ fusectl_test
>  write_extend_eof_test
>  fuse_acl_cache_test
>  fuse_symlink_cache_test
> +fuse_readdir_cache_test
> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/te=
sting/selftests/filesystems/fuse/Makefile
> index 3a5a557dde7a..570ced181168 100644
> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> @@ -6,6 +6,7 @@ TEST_GEN_PROGS :=3D fusectl_test
>  TEST_GEN_PROGS +=3D write_extend_eof_test
>  TEST_GEN_PROGS +=3D fuse_acl_cache_test
>  TEST_GEN_PROGS +=3D fuse_symlink_cache_test
> +TEST_GEN_PROGS +=3D fuse_readdir_cache_test
>  TEST_GEN_FILES :=3D fuse_mnt
>
>  include ../../lib.mk
> @@ -30,5 +31,6 @@ $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
>
>  $(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
>  $(OUTPUT)/fuse_symlink_cache_test: fuse_common.c fuse_symlink_cache_test=
.c
> +$(OUTPUT)/fuse_readdir_cache_test: fuse_common.c fuse_readdir_cache_test=
.c
>
>  EXTRA_CLEAN :=3D fuse_common.o
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_=
test.c b/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
> new file mode 100644
> index 000000000000..1fdf422cf75b
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
> @@ -0,0 +1,274 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Simple filesystem to test FUSE readdir cache
> + *
> + * It will simply perform readdir operations on a directory checking how=
 many
> + * times a request is sent to user-space using all the possible caching
> + * combination setting (FOPEN_KEEP_CACHE and FOPEN_CACHE_DIR flags).
> + */
> +
> +#include <stdio.h>
> +#include <dirent.h>
> +
> +#include "kselftest_harness.h"
> +
> +#include "fuse_common.h"
> +
> +#define DIRNAME "mydir"
> +#define FILENAME "myfile"
> +
> +#define DIR_INO 42
> +#define FILE_INO 43
> +#define DOT_INO 40
> +#define DOTDOT_INO 41
> +
> +#define TIMEOUT        86400.0f
> +
> +struct test_state {
> +       pthread_mutex_t lock;
> +       struct fuse_common_ctx ctx;
> +       time_t mtime;
> +       int readdir_counter;
> +       bool cache_readdir;
> +       bool keep_cache;
> +} test_state =3D {
> +       .lock =3D PTHREAD_MUTEX_INITIALIZER,
> +};
> +
> +static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *nam=
e)
> +{
> +       struct fuse_entry_param e =3D {};
> +
> +       if (parent !=3D FUSE_ROOT_ID || strcmp(name, DIRNAME) !=3D 0) {
> +               fuse_reply_err(req, ENOENT);
> +               return;
> +       }
> +
> +       e.ino =3D DIR_INO;
> +       e.attr.st_mode =3D S_IFDIR | 0755;
> +       e.attr.st_nlink =3D 1;
> +       pthread_mutex_lock(&test_state.lock);
> +       e.attr.st_mtime =3D test_state.mtime;
> +       pthread_mutex_unlock(&test_state.lock);
> +       e.attr_timeout =3D TIMEOUT;
> +       e.entry_timeout =3D TIMEOUT;
> +
> +       fuse_reply_entry(req, &e);
> +}
> +
> +static int fill_stat(fuse_ino_t ino, struct stat *st)
> +{
> +       int ret =3D 0;
> +
> +       st->st_ino =3D ino;
> +       pthread_mutex_lock(&test_state.lock);
> +       st->st_mtime =3D test_state.mtime;
> +       pthread_mutex_unlock(&test_state.lock);
> +
> +       switch (ino) {
> +       case FUSE_ROOT_ID:
> +               st->st_mode =3D S_IFDIR | 0755;
> +               st->st_nlink =3D 2;
> +               break;
> +       case DOT_INO:
> +       case DOTDOT_INO:
> +       case DIR_INO:
> +               st->st_mode =3D S_IFDIR | 0755;
> +               st->st_nlink =3D 1;
> +               break;
> +       case FILE_INO:
> +               st->st_mode =3D S_IFREG | 0444;
> +               st->st_nlink =3D 1;
> +               break;
> +       default:
> +               ret =3D -1;
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +static void fs_getattr(fuse_req_t req, fuse_ino_t ino,
> +                      struct fuse_file_info *fi)
> +{
> +       struct stat st =3D {};
> +
> +       if (fill_stat(ino, &st) < 0)
> +               fuse_reply_err(req, ENOENT);
> +       else
> +               fuse_reply_attr(req, &st, TIMEOUT);
> +}
> +
> +static void fs_opendir(fuse_req_t req, fuse_ino_t ino,
> +                      struct fuse_file_info *fi)
> +{
> +       pthread_mutex_lock(&test_state.lock);
> +       fi->keep_cache =3D test_state.keep_cache;
> +       fi->cache_readdir =3D test_state.cache_readdir;
> +       pthread_mutex_unlock(&test_state.lock);
> +       fuse_reply_open(req, fi);
> +}
> +
> +static void fs_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
> +                      off_t offset, struct fuse_file_info *fi)
> +{
> +       struct stat st =3D {};
> +       char buf[1024];
> +       char *pbuf;
> +       size_t rem =3D size;
> +       size_t sz;
> +       int nextoff =3D 0;
> +
> +       if (ino !=3D DIR_INO) {
> +               fuse_reply_err(req, ENOTDIR);
> +               return;
> +       }
> +       if (offset) {
> +               fuse_reply_buf(req, NULL, 0);
> +               return;
> +       }
> +       pbuf =3D buf;
> +       fill_stat(DOT_INO, &st);
> +       sz =3D fuse_add_direntry(req, pbuf, rem, ".", &st, nextoff++);
> +       rem -=3D sz;
> +       pbuf +=3D sz;
> +       fill_stat(DOTDOT_INO, &st);
> +       sz =3D fuse_add_direntry(req, pbuf, rem, "..", &st, nextoff++);
> +       rem -=3D sz;
> +       pbuf +=3D sz;
> +       fill_stat(FILE_INO, &st);
> +       sz =3D fuse_add_direntry(req, pbuf, rem, FILENAME, &st, nextoff++=
);
> +       rem -=3D sz;
> +
> +       fuse_reply_buf(req, buf, size - rem);
> +
> +       pthread_mutex_lock(&test_state.lock);
> +       test_state.readdir_counter++;
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +
> +static const struct fuse_lowlevel_ops fs_ops =3D {
> +       .lookup         =3D fs_lookup,
> +       .getattr        =3D fs_getattr,
> +       .opendir        =3D fs_opendir,
> +       .readdir        =3D fs_readdir,
> +};
> +
> +FIXTURE(readdir_cache) {};
> +
> +FIXTURE_VARIANT(readdir_cache)
> +{
> +       bool cache_readdir;
> +       bool keep_cache;
> +};
> +FIXTURE_VARIANT_ADD(readdir_cache, nocache)
> +{
> +       .cache_readdir =3D false,
> +       .keep_cache =3D false,
> +};
> +FIXTURE_VARIANT_ADD(readdir_cache, cache_readdir)
> +{
> +       .cache_readdir =3D true,
> +       .keep_cache =3D false,
> +};
> +FIXTURE_VARIANT_ADD(readdir_cache, keep_cache)
> +{
> +       .cache_readdir =3D false,
> +       .keep_cache =3D true,
> +};
> +FIXTURE_VARIANT_ADD(readdir_cache, cache)
> +{
> +       .cache_readdir =3D true,
> +       .keep_cache =3D true,
> +};
> +
> +FIXTURE_SETUP(readdir_cache)
> +{
> +       char err[MAX_ERR_MSG];
> +
> +       pthread_mutex_lock(&test_state.lock);
> +       test_state.mtime =3D time(NULL);
> +       test_state.readdir_counter =3D 0;
> +       test_state.cache_readdir =3D variant->cache_readdir;
> +       test_state.keep_cache =3D variant->keep_cache;
> +
> +       if (fs_setup(&fs_ops, &test_state.ctx, err))
> +               SKIP(goto out, err);
> +out:
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +
> +FIXTURE_TEARDOWN(readdir_cache)
> +{
> +       pthread_mutex_lock(&test_state.lock);
> +       fs_teardown(&test_state.ctx);
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +


With ctx moved to fixture, feel free to add

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.

> +TEST_F(readdir_cache, test_readdir_cache)
> +{
> +       struct dirent *dentry;
> +       DIR *dir;
> +       char pathname[PATH_MAX];
> +       int total_counter, rewind_counter;
> +       int dentrycount;
> +
> +       sprintf(pathname, "%s/%s", test_state.ctx.mountpoint, DIRNAME);
> +
> +       dir =3D opendir(pathname);
> +       if (dir =3D=3D NULL)
> +               TH_LOG("opendir(): %s", strerror(errno));
> +       ASSERT_NE(dir, NULL);
> +
> +       errno =3D 0;
> +       dentrycount =3D 0;
> +       while ((dentry =3D readdir(dir)))
> +               dentrycount++;
> +       ASSERT_EQ(errno, 0);
> +       ASSERT_EQ(dentrycount, 3);
> +
> +       rewinddir(dir);
> +       errno =3D 0;
> +       dentrycount =3D 0;
> +       while ((dentry =3D readdir(dir)))
> +               dentrycount++;
> +       ASSERT_EQ(errno, 0);
> +       ASSERT_EQ(dentrycount, 3);
> +
> +       ASSERT_EQ(closedir(dir), 0);
> +
> +       pthread_mutex_lock(&test_state.lock);
> +       rewind_counter =3D test_state.readdir_counter;
> +       pthread_mutex_unlock(&test_state.lock);
> +
> +       dir =3D opendir(pathname);
> +       if (dir =3D=3D NULL)
> +               TH_LOG("opendir(): %s", strerror(errno));
> +       ASSERT_NE(dir, NULL);
> +
> +       errno =3D 0;
> +       dentrycount =3D 0;
> +       while ((dentry =3D readdir(dir)))
> +               dentrycount++;
> +       ASSERT_EQ(errno, 0);
> +       ASSERT_EQ(dentrycount, 3);
> +
> +       ASSERT_EQ(closedir(dir), 0);
> +
> +       pthread_mutex_lock(&test_state.lock);
> +       total_counter =3D test_state.readdir_counter;
> +       pthread_mutex_unlock(&test_state.lock);
> +
> +       if (!variant->cache_readdir) {
> +               ASSERT_EQ(rewind_counter, 2);
> +               ASSERT_EQ(total_counter, 3);
> +       } else if (!variant->keep_cache) {
> +               ASSERT_EQ(rewind_counter, 1);
> +               ASSERT_EQ(total_counter, 2);
> +       } else {
> +               ASSERT_EQ(rewind_counter, 1);
> +               ASSERT_EQ(total_counter, 1);
> +       }
> +}
> +
> +TEST_HARNESS_MAIN
