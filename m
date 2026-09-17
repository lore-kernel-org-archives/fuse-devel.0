Received: from mail-ej2-f31.google.com (mail-ej2-f31.google.com [74.125.228.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ACA5A0AA4
	for <fuse-devel@lists.linux.dev>; Thu, 17 Sep 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.159
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658366; cv=pass; b=Oedouv23ycs1Pu/Y1NCAkNwCAwRla8QrlOvxHTgT/mi99VShJqjMU57NiX3dtVJAfiP2Yqx5VXlvpHDNjFBsr8wux+oErkqzwh0EgwyWKzZwW88UMPAnpF+bIMCgD1wluBvuo8aVNzsSvoiHTEcBA62K9YiKP9/GkdkE68oJqvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658366; c=relaxed/simple;
	bh=wKBBpqxICSTSJH9KovkCmpB4Wf9jAq3IpKkz8RphBEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYK4pT6xk0WA+qLgV5sonvP09RS2NLSszvY62cDA1Xx2jBZMjSADo8qSUX7YJsCpS8tN1oPd1s3SuTlqcBGJ6CK6w8w5y2BAm/+Z3CGsFH6xBVQrSCADjifqmelaCmcid61XB/aqbDSzw9RZaoqSdeIqvioZaByt1Hl7r+N8sd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjLk5U4u; arc=pass smtp.client-ip=74.125.228.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjLk5U4u"
Received: by mail-ej2-f31.google.com with SMTP id a640c23a62f3a-c29703cb796so153232666b.2
        for <fuse-devel@lists.linux.dev>; Thu, 17 Sep 2026 08:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789658336; cv=none;
        d=google.com; s=arc-20260327;
        b=mPHMcgkAdvYO3aEPhGrXfLb8aDkZVjDq2eGLqTDtBxyb47BpSoO1cmiTEKlfQnczR4
         zjcfqwz56xeOGYtukO+Bug/M2jf/MO8V8ccD7aEBuuK5DUDgI06/zlQ5NLjKDoohuE6q
         GVyFZzCZadvL517kUDijeYHoY4XmeObvH0/PhwnZRPtnVaJX9SRVcb53/edU5y4DZsZ/
         yXHw+22hGvGcC1KieP7WhwUV/e7DuHTe9JvBU1skJmfcXrFQH9qkZzmLBWlm2myJ0Hj0
         3PcVLmFSGfQBmaplAfdmVNYBgkXZ5EYlIhqSZnXJy314yTj1KXZ+nByG57JlZGsuuUuG
         LvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TvBiRaBEozWOEdoyBMPd97Z2Iz6BQFRDi2IwFNwZ66g=;
        fh=RgzJwyumSDjww7lS9Z1MZl/qko0nfQlwI3wMw2uwiiw=;
        b=q+f8uAfElrSA2jDOJm95LXsMuS9RoytLMsYNNN+fkSjciNH1qbxTfTapp0f9ntPQQc
         bYivySB1YMTiZJLJvkrcsniJd6Lc8ybjrFtkMglJNEhx5QfcdKdEG4UPyDePQISpOUfo
         asqVQOMrP65bAAuDKDK2y55HbITboPBZJFZPzaNUn78X21ljuXHP2jlhswGnkZfnSP7Z
         MkOzA2V+vsBvRPNJuMrmGtl3PEV/5i2Va0LkUlKXOnkH80jqEMh84UfFvkgRD/NPLdYt
         FBBUGwa0swdt0S/Baldv478MCaXtqvTGlkJ4JmYxeXobgo1aPvLztJ9IPtKtCoO+BUvj
         vLww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789658336; x=1790263136; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TvBiRaBEozWOEdoyBMPd97Z2Iz6BQFRDi2IwFNwZ66g=;
        b=KjLk5U4ubioIyygGFyfG4C9iqqmU1RkBIIShrz4HdMs7zA2bWhzS+t8yuskGsJ+8+u
         Wym+M84fY8D6gpMtiQfv9r4bQxHO6uDF7DQm+O9HHAtau36w7nIR492Q/mLzOxorhjpw
         DaFqbPtwWkOhGFyyZ6LpQh2TsEewi3tyGExLw1BzSyrT/E132LOnsd53IvNfXT82N44g
         xhIgtuE4qfqa1WZvPw59+hlP+49W4LZS6qUqafVnA9wDJkV5ml6dbi9nijv8iA+sTkyi
         G5xSWQ5xfX0vGTI2hi8u1uzXv+yIPgPb65kWdLHA/KvQ2ttt9lu0i0uTeK/qu2r+hpDT
         5SDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658336; x=1790263136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TvBiRaBEozWOEdoyBMPd97Z2Iz6BQFRDi2IwFNwZ66g=;
        b=mL9tfTycjfHtghgJUp0Ogt/VZtT3FJYcrj2I/ehawCGej9P+IPOqcCiam+Rz857kCD
         EADfWtHDRatmLZrauqWmHsA7+q2r4jo1BxWz7HA+o8SuTaBFB4wVTGr709uVWTeBeOpO
         bK3ybC/vOgFCQ0kCobiO1OFdmdpVSQfPvUAksx07fQ+ptthclqW4zqV+zBDk6JJUoqVn
         aRWvuAxqlP0DZHNZiMrTjgFmaEIX57TmJQVLSeE+iaKyX89JTOjKQE6SB9wlvstNS1Gi
         5fabO2lSDpLnZ5LFEtWgroJSPpCokuU8EyWDTalpOtvZI8hEPRcGjD+ur6rLo7KfJ66B
         gJ9A==
X-Forwarded-Encrypted: i=1; AKwUvBys8bK0gznraMgAVQsWaDXHvQfZnKIetocCYJOTa5DcATnhEtqSIWyuF5us4V63kee3+1Uo9Xgebwnc@lists.linux.dev
X-Gm-Message-State: AFuF++lMi2wPq5UR7ARERK7ucD7rfdLj6UPcO4CL3ZXZ5iTry6LSO7p/
	JlKOh+9MJv+qjQ3886zZW3/jQbb6vjLXFXb1UQpKOgmFB/rkd9V/8SiwXusZFSDs1HPr2AegC0K
	81kAdaFBkurU5dlo+yY52Zo7cZMrmLxA=
X-Gm-Gg: AYBFou1YIA8yCsG2ilk5KLFzHz4MNe52mQ0jaLEVanzgPT9FX4MYY0irtqU2e9M1r5H
	MrZWTmUcIvJOx/rkhgXN2COUrbnUvDZlfQYVeLZLZND2jyGC841MDZGYjqF4BoIwK7hE7ijAlf3
	Roi0ykjIC5QmewuUlJUfqfUMIBvptz0ksFXBLlkIgEEZH6VLZkKbOOvC8eh08riC60PjRITM3+H
	g67WdbgE0f7dOXwtsjPFmYuCgUuVbShWpfe5kH9SAh98ag1dT+RpEW+bwpSmO7QnH4E12wWcuzH
	6z4d8cNsGC8/F87u27EFmSjhGVzQ+eSyzsxeUVwVzzHeKS1qmZ6nyLAgeK77oFbr8tg=
X-Received: by 2002:a17:907:3f17:b0:c29:dd71:7521 with SMTP id
 a640c23a62f3a-c29e52094e2mr503882066b.13.1789658336185; Thu, 17 Sep 2026
 08:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916155629.32421-1-luis@igalia.com> <20260916155629.32421-8-luis@igalia.com>
In-Reply-To: <20260916155629.32421-8-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 17 Sep 2026 17:18:44 +0200
X-Gm-Features: AcwNN1Va1Hx-ENLvFA82HWE6oaHaqZG_YKBqIXvUfSNMOWmG1KlMF0bX0RUSInc
Message-ID: <CAOQ4uxiSpFXtsfV8J+taEyCvsxcyp5dmMoOtSybK-3m4CUSu6A@mail.gmail.com>
Subject: Re: [RFC PATCH v4 7/8] selftests/fuse: add fuse symlink caching test
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
> This patch adds a simple test that allows to verify that, when resolving =
a
> symlink, user-space is called only the first time when caching is enabled
> or, if caching is disabled, every time the symlink resolution is requeste=
d.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>  .../selftests/filesystems/fuse/Makefile       |   2 +
>  .../fuse/fuse_symlink_cache_test.c            | 163 ++++++++++++++++++
>  3 files changed, 166 insertions(+)
>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_symlink=
_cache_test.c
>
> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/=
testing/selftests/filesystems/fuse/.gitignore
> index f7f3dd345a50..ebfe7133d811 100644
> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
> @@ -3,3 +3,4 @@ fuse_mnt
>  fusectl_test
>  write_extend_eof_test
>  fuse_acl_cache_test
> +fuse_symlink_cache_test
> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/te=
sting/selftests/filesystems/fuse/Makefile
> index 7744f796eb06..3a5a557dde7a 100644
> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> @@ -5,6 +5,7 @@ CFLAGS +=3D -Wall -O2 -g $(KHDR_INCLUDES)
>  TEST_GEN_PROGS :=3D fusectl_test
>  TEST_GEN_PROGS +=3D write_extend_eof_test
>  TEST_GEN_PROGS +=3D fuse_acl_cache_test
> +TEST_GEN_PROGS +=3D fuse_symlink_cache_test
>  TEST_GEN_FILES :=3D fuse_mnt
>
>  include ../../lib.mk
> @@ -28,5 +29,6 @@ $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
>
>  $(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
> +$(OUTPUT)/fuse_symlink_cache_test: fuse_common.c fuse_symlink_cache_test=
.c
>
>  EXTRA_CLEAN :=3D fuse_common.o
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_=
test.c b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
> new file mode 100644
> index 000000000000..dd001736ebca
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
> @@ -0,0 +1,163 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Simple filesystem to test FUSE symlink cache
> + *
> + * This is a simple FUSE filesystem that contains two objects: a file na=
med
> + * 'file' and a symlink to that file named 'link'.  If symlink caching i=
s
> + * disabled (i.e. FUSE_CAP_CACHE_SYMLINKS is reset during FUSE_INIT), wh=
enever
> + * the ->readlink() is executed to resolve 'link' a counter will be incr=
emented.
> + *
> + * If symlink caching is enabled (i.e. FUSE_CAP_CACHE_SYMLINKS is set du=
ring
> + * FUSE_INIT), resolving a symlink will only call into user-space the fi=
rst
> + * time.
> + */
> +
> +#define FUSE_USE_VERSION 31
> +
> +#include <stdio.h>
> +#include <fuse_lowlevel.h>
> +
> +#include "kselftest_harness.h"
> +
> +#include "fuse_common.h"
> +
> +#define FILENAME "file"
> +#define FILE_INO 42
> +
> +#define LINKNAME "link"
> +#define LINK_INO 43
> +
> +#define TIMEOUT        86400.0f
> +
> +struct test_state {
> +       pthread_mutex_t lock;
> +       struct fuse_common_ctx ctx;
> +       int readlink_counter;
> +       bool cache;
> +} test_state =3D {
> +       .lock =3D PTHREAD_MUTEX_INITIALIZER,
> +};
> +
> +static void fs_init(void *userdata, struct fuse_conn_info *conn)
> +{
> +       pthread_mutex_lock(&test_state.lock);
> +       if (test_state.cache)
> +               fuse_set_feature_flag(conn, FUSE_CAP_CACHE_SYMLINKS);
> +       else
> +               fuse_unset_feature_flag(conn, FUSE_CAP_CACHE_SYMLINKS);
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +
> +static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *nam=
e)
> +{
> +       struct fuse_entry_param e =3D {};
> +
> +       if (parent !=3D FUSE_ROOT_ID ||
> +           (strcmp(name, FILENAME) !=3D 0 && strcmp(name, LINKNAME) !=3D=
 0)) {
> +               fuse_reply_err(req, ENOENT);
> +               return;
> +       }
> +
> +       if (!strcmp(name, FILENAME)) {
> +               e.ino =3D FILE_INO;
> +               e.attr.st_mode =3D S_IFREG | 0444;
> +               e.attr.st_nlink =3D 2;
> +       } else if (!strcmp(name, LINKNAME)) {
> +               e.ino =3D LINK_INO;
> +               e.attr.st_mode =3D S_IFLNK | 0444;
> +               e.attr.st_nlink =3D 1;
> +               e.attr.st_size =3D strlen(FILENAME);
> +       }
> +       e.attr_timeout =3D TIMEOUT;
> +       e.entry_timeout =3D TIMEOUT;
> +
> +       fuse_reply_entry(req, &e);
> +}
> +
> +static void fs_readlink(fuse_req_t req, fuse_ino_t ino)
> +{
> +       char buf[PATH_MAX];
> +       size_t sz =3D strlen(FILENAME);
> +
> +       if (ino !=3D LINK_INO) {
> +               fuse_reply_err(req, ENOENT);
> +               return;
> +       }
> +
> +       memcpy(buf, FILENAME, sz);
> +       buf[sz] =3D '\0';
> +       pthread_mutex_lock(&test_state.lock);
> +       test_state.readlink_counter++;
> +       pthread_mutex_unlock(&test_state.lock);
> +
> +       fuse_reply_readlink(req, buf);
> +}
> +
> +static const struct fuse_lowlevel_ops fs_ops =3D {
> +       .init           =3D fs_init,
> +       .lookup         =3D fs_lookup,
> +       .readlink       =3D fs_readlink,
> +};
> +
> +FIXTURE(symlink_cache) {};
> +FIXTURE_VARIANT(symlink_cache)
> +{
> +       const bool cache;
> +};
> +FIXTURE_VARIANT_ADD(symlink_cache, symlinks_nocache)
> +{
> +       /* Variant with symlink cache disabled */
> +       .cache =3D false,
> +};
> +FIXTURE_VARIANT_ADD(symlink_cache, symlinks_cache)
> +{
> +       /* Variant with symlink cache enabled */
> +       .cache =3D true,
> +};
> +
> +FIXTURE_SETUP(symlink_cache)
> +{
> +       char err[MAX_ERR_MSG];
> +
> +       pthread_mutex_lock(&test_state.lock);
> +       test_state.readlink_counter =3D 0;
> +       test_state.cache =3D variant->cache;
> +
> +       if (fs_setup(&fs_ops, &test_state.ctx, err))
> +               SKIP(goto out, err);
> +out:
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +
> +FIXTURE_TEARDOWN(symlink_cache)
> +{
> +       pthread_mutex_lock(&test_state.lock);
> +       fs_teardown(&test_state.ctx);
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +

Here too, unless you have a good reason not to,
please put fuse_common_ctx in the test fixture object.

With that fix, feel free to add

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.

> +TEST_F(symlink_cache, test_symlink_cache)
> +{
> +       char pathname[PATH_MAX];
> +       char buf[PATH_MAX];
> +       ssize_t sz;
> +       int counter;
> +       int i;
> +
> +       sprintf(pathname, "%s/%s", test_state.ctx.mountpoint, LINKNAME);
> +       for (i =3D 0; i < 100; i++) {
> +               sz =3D readlink(pathname, buf, PATH_MAX);
> +               ASSERT_NE(sz, -1);
> +       }
> +       pthread_mutex_lock(&test_state.lock);
> +       counter =3D test_state.readlink_counter;
> +       pthread_mutex_unlock(&test_state.lock);
> +
> +       if (variant->cache) {
> +               ASSERT_EQ(counter, 1);
> +       } else {
> +               ASSERT_EQ(counter, 100);
> +       }
> +}
> +
> +TEST_HARNESS_MAIN
