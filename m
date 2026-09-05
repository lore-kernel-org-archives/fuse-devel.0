Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6216384CED
	for <fuse-devel@lists.linux.dev>; Sat,  5 Sep 2026 14:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788617519; cv=pass; b=oZLHhkThtrNUB9F1ov/VFbm/dpqV+ft2Os198Engr+NPWDbLJfgwkpTklLhRrl1ONlGkB9yeqfdLKS4NlIR7s7/OiUBpobCSfPtMP0y/aV2doMkm9Zw9fcu8zqFd+3VdFAhfQTHUyAOZJgiINVSWzeLlqQW3hS6ILtGpIoRFu50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788617519; c=relaxed/simple;
	bh=lvUK/fKlC/5odo3hYQRDDPopCyKykRxFDlQPs6Wbxvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EFS+vizaX4HBDz2QB8AP4bmix0JvHtpzif4UTLB6qcrT8vwyslGbom1vea2dlEbQUeJr/qoqC9cx1MJ4l/0eTlG6KNFUinOjhu2LeG9ENHAetSZeNKIz9XkT2nCq3wCpbplohbscKiMaG5+mPnYwaRo8+8uGDXjHAGGn9muFiGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+XzO/+C; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+XzO/+C"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so17814795e9.3
        for <fuse-devel@lists.linux.dev>; Sat, 05 Sep 2026 07:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788617515; cv=none;
        d=google.com; s=arc-20260327;
        b=HyR5dvydn2zvg1/ehtg8XyVDMWnvyL9kDFn3pzxxbFsxg6iW4HOrcpBsw32rS7yrJl
         NVEVQs07YAmjKLZkkQye9FjJwTqGFuLCDknf1aTFeRRgr0uT2+Eq+9iI8Syua4YSX3xR
         SLW1K6muWiTC9GRPIOn3f2NYhDRiSh7cS1P3isMAmanISbEd3WfO23A2XugvXS7UglXA
         nMriv4G0M8+A7HlrGFLtNxlBkDow00fZalMDhhgrBcptQqJFw2QpJP2AF8sEiyC7KcBs
         cbxeJ89y6mMfm9FIvN4BFqyA+3koJEruSv07+qUl6mx7DT2pepkR3pBrU2uzsSUjpr1M
         c8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8dOwFXHyy7nBbryAA1ywk4yLaVEXFLRRnv/TLBt1Mfg=;
        fh=TwoZ4XCOJ+/2xuLybG1mOBn5qxsJ8vaT+xQba5uYinE=;
        b=i/M4gINxUTGjFo8oe3/xj5qMS/rHbge81MFvzRTDzAQcpTvX5ddEU/lN/pnSpKEzQI
         ZGk8y34fFTUQ6MbO46tRJYr4wbqC+78PoE45ABVKpMxYN+gFTEvKvsJ/j7Kr1BbTAC7j
         2eHP6CxSTfUmJll9i4vsg+uyecV6pxxf/SAn2F/QVyDgyz20XnNivdCXAWSHwW60blVm
         WyfRr9O/18CUASQ0p0q2zofG7Fu01dws9xBIqxyMzPkP5kPwl5b6PwCy7f8tbSsC0KCe
         p+ocMvOObFQQknQDhf1v5nDaSUivGcKHbIWNDCz5OJrnHdfmaJSM303AnaaEXpHe4XjP
         Jjng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788617515; x=1789222315; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8dOwFXHyy7nBbryAA1ywk4yLaVEXFLRRnv/TLBt1Mfg=;
        b=A+XzO/+CJG2DmZHKvcWGIdkT0gvDgAwxmIO92Bu4xiakRWuN68TPMr793K+Ub8wu5v
         4kxHGafvDnhvMxvQHzmxwcJFoUIfTBlREYZRQPcn53D81Od2DHw1nB+ncPAXBNMeUoK1
         VFEIoG4a7GlctrQiUGF+ByUiYPGnvKlq8hLIgsfuvL1SfMQ7WSZ8c0llh/65R1pc0JiE
         p9acpjivsi1rr6qj0c3sRS1nn9onExmxdhuLGABJV8owe+/998CPIqR3jrwGy883B8eB
         drVavgN6swx/p7WWiPDeC0Dgvt8E42q0MTzEjlBFkTTpDwbRGg2laAoHVuKMCbVySL6m
         8nSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788617515; x=1789222315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dOwFXHyy7nBbryAA1ywk4yLaVEXFLRRnv/TLBt1Mfg=;
        b=D7BHQmWVcO11x3HoE3ezCEFT1BR+Hn1WJOjHlUWOUz+elY9Ysyx0IR0GwkODpialEi
         ZxDNK4lby89/T+z02EId5V3I1bDBnG70yNb60XWuAd3Oz7KYg/gQwHSjveFEfaWYgRau
         uYo0rkcCET/c4A8ltYnarv6McAUv39H0qjq2QBP1ycliji8SaelEDfGRGQnFlLUFXPAY
         v2QNd06z3G/cBTU5aK7nqK5DN8zIpQbsNZgCkq4xlm02SQwv6yMlTRGI0FwOqZXknRZ4
         4ylFmcYW6+0Jy/CukrO+8DDt8Btg34tWB9/2GvA54aDTb29+YlGV90I/CiY8vaq4J7LN
         jW+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzlu3t7i2uj9WrfXTsVNmKDDBQl6917oaxpwRHQ5R2hkBvQF/wSEgUHtbwabk9LKkaFDyVHnEmu+zXR@lists.linux.dev
X-Gm-Message-State: AFuF++loahEwDgN9OH1P2KNUBxh2kO5QzI43UWWDY/Lk24cp/s1elAS7
	Qg0mzd8Y/HCnbV/NVeSNlihwThiaSGjWqjyTo1CzhMvgDdD7dGqAjrTKK39nf373GkWuqLK2NA+
	3KnvJtlSZyEcLJxOKrx9PghXOJ1cSUg8=
X-Gm-Gg: AYBFou1pjpQivloNHu0xs3q+4fXezktzYaksDvAAioAebmt8uoZWrNCptJ5AJ6vHPTG
	6v4T8AK/9yHvoCEt36LDF57Tgrb1ck48doFm6pbivCSNsXWJmGHOhC3q2AMbk2L8AkussOS6UZ0
	01BNL0kjKCCJ+Ye2U77M0hlzCKX7weituoHz5BAExfc1j3ILWwQva9P8tgoHQsdPA93+iLkVLdx
	kyWC8VAr8MxMsMnVRBOHpDR6iapN2qBNPah5XCwFuSRoCiui4D8YtL5c5Hnr44AO6dQuQILavYi
	g8ItuiyavtXQFfbv8KT4ilBCd7m1hGfELviu2LOkJ6VD7w==
X-Received: by 2002:a05:600c:1991:b0:49b:2796:be30 with SMTP id
 5b1f17b1804b1-49cf824f7damr117762365e9.11.1788617514483; Sat, 05 Sep 2026
 07:11:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-9-luis@igalia.com>
In-Reply-To: <20260904103920.4471-9-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 16:11:43 +0200
X-Gm-Features: AcwNN1UdXGZXZ6wH3FV9f5IAIXIptSPvwpDev9NoyEDWmtBTRnq0S2p7ZwVozxY
Message-ID: <CAOQ4uxh+rKuR39ruJO6PxoUCCdP_U0M=ecn-dayv+7-jKgrDNg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 8/8] selftests/fuse: add fuse readdir caching test
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
> index 000000000000..7c49cc6a23e3
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
> +#include <limits.h>
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
> +       bool cache_readdir;
> +       bool keep_cache;
> +       int readdir_counter;
> +} test_state =3D {
> +       .lock =3D PTHREAD_MUTEX_INITIALIZER,
> +};
> +
> +static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *nam=
e)
> +{
> +       struct fuse_entry_param e =3D {};
> +
> +       if (parent !=3D FUSE_ROOT_ID || strcmp(name, DIRNAME) !=3D 0)
> +               fuse_reply_err(req, ENOENT);

Again: allergic to non matching {} and can just return here no need
for all this nesting

> +       else {
> +               if (!strcmp(name, DIRNAME)) {

This condition is already guaranteed when we get here

> +                       e.ino =3D DIR_INO;
> +                       e.attr.st_mode =3D S_IFDIR | 0755;
> +                       e.attr.st_nlink =3D 1;
> +               } else {
> +                       e.ino =3D FUSE_ROOT_ID;
> +                       e.attr.st_mode =3D S_IFDIR | 0755;
> +                       e.attr.st_nlink =3D 2;
> +               }
> +               e.attr.st_mtime =3D time(NULL);
> +               e.attr_timeout =3D TIMEOUT;
> +               e.entry_timeout =3D TIMEOUT;
> +               fuse_reply_entry(req, &e);
> +       }
> +}
> +
> +static int fill_stat(fuse_ino_t ino, struct stat *st)
> +{
> +       int ret =3D 0;
> +
> +       st->st_ino =3D ino;
> +       st->st_mtime =3D time(NULL);

Doesn't this need to be a const value?
to make sure that it does not change from here to lookup time?

Thanks,
Amir.

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
> +FIXTURE(readdir_cache)
> +{
> +       struct fuse_session *se;
> +       char mountpoint[MOUNTPOINT_SZ];
> +       pthread_t thread;
> +};
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
> +       test_state.readdir_counter =3D 0;
> +       test_state.cache_readdir =3D variant->cache_readdir;
> +       test_state.keep_cache =3D variant->keep_cache;
> +       pthread_mutex_unlock(&test_state.lock);
> +
> +       if (fs_setup(&self->se, self->mountpoint, &fs_ops, &self->thread,=
 err))
> +               SKIP(return, err);
> +}
> +
> +FIXTURE_TEARDOWN(readdir_cache)
> +{
> +       fs_teardown(self->se, self->thread, self->mountpoint);
> +}
> +
> +TEST_F(readdir_cache, test_readdir_cache)
> +{
> +       struct dirent *dentry;
> +       DIR *dir;
> +       char pathname[PATH_MAX];
> +       int total_counter, rewind_counter;
> +       int dentrycount;
> +
> +       sprintf(pathname, "%s/%s", self->mountpoint, DIRNAME);
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
