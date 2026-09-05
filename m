Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9813CB571
	for <fuse-devel@lists.linux.dev>; Sat,  5 Sep 2026 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611581; cv=pass; b=YiA02GgCEfHjmTyCTVS/kYB1XCZCUlr/38tQ/wm+s1P9MYL/ZZcOPLXRJbQl9fPpWdQyCd8Xv4nlv4V4EyRRPV3Q+dEO4Lqo38kwcVjsyfDyF4+IeMMkoTx45K1zmFaKyWZFq+HlELMrBQvnJem0wrBr7b3NfUzeryK/dlP5wN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611581; c=relaxed/simple;
	bh=x6U/123YgrqcVQf2CeHxg1MTANfKyOHf3TPTf0tKoqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYlZ9T080rREq9Gu1wH2iEItsaZJYFFBXx3BeKBxuQSCBdYn1waNWT/xIckmjW5WaYJFyxkoFHGa0OAiKks1jsB9kQ1yl/lkw8nyv1FvkQEplUF94uH6dOxCD01QOnd39TY4964ct5uAs5J5O3XhqK6egDDr32bSqXZQUtDHn1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBn+ZbFp; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBn+ZbFp"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a68aaf4840so4270671a12.0
        for <fuse-devel@lists.linux.dev>; Sat, 05 Sep 2026 05:33:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788611578; cv=none;
        d=google.com; s=arc-20260327;
        b=i/XEltUkx2v8h8aszWESZ3ujNsshNE5kfPnmKS2bKSix0Vzv6uHjD5Q7hihw5UVQ5k
         vs4BilrppZCQ+46760z03BeH79XBFeulHAatjaEW1o1rtrbkoOosMoKaK3s8bpSy18je
         uT32qdFqlSaX3TSlXPbXYt+3kGDl/QWwK//9hWzrvO/Tt44cMNgJqciL1Aj6TrvKx+7q
         dWLxWGfXGO+3h37BB/v/x3LTAYF98PWe11hdzOtg77BhfGEkAeG3+oV9BFgEysAiOjqm
         kqpgxUcekmV1esyMi1QQvVNLLjKp3/d4h/A2e7PwTtkU4T7m2f/EO5N/wACXuB5GLi1v
         na2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+cwHsO0hV8YW9Z1e5+hyZhT9RVZSyOWleixXLzS40DI=;
        fh=xf9Ace0SJCQdgr/imMnc/cYdO+l4UpC+YJLS4PdOHt0=;
        b=k2VkCMO7XUcyJwpweLiSpmyDiQos528gfL9EcLoGppJwjtJmacZbkmrRzLI0Tq60y7
         FlQl5POjeAX+81plNL8DOnG9knHGJYEnPQ58YguyiLn9BQnDPiFuLw4usLlDC6EXXx56
         4rgdVLKe49v8mEL4fj1TG7cy2aYnxHoNEtmhzpkUWjXLPy5HsUKjZqr0j/7sI6rhQ5Mx
         3Y0zq8HSQLfC7HpB8UVZYy1kU1r4AwVHWB9c4Kr2+B5EQa15k6v2Ly8NVp+V9U+fV2uP
         Ja8EgXwg1TQbo5l2A0HiDxrG6eHoU1XTS6UJsqigKVyof6vPR4JMgv8/yX01M37iAi5p
         VQgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611578; x=1789216378; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+cwHsO0hV8YW9Z1e5+hyZhT9RVZSyOWleixXLzS40DI=;
        b=OBn+ZbFp6qCIEkOA83Ysx3Bcbe5b2HlZVILmoiMr0Cu3wLTMOAMOne8M15U19hLnbI
         meEw8MoVW05sL+aM3oWwdRMtoK1vVpj22RhM9txTzvM1Iy3q1nUAmpCPX91+Jn8K/WI+
         /0C6fHEZaLEI2VQoiiMVm4A300Ahd/CkyZiFH2AdVt5tV9l/Z5Mxwkk7wRzquD5En5UU
         oe795Tj0yTqiGiHM/VRO83B+ieZJKh4M3q46z5vAIt0FaurA5IDHURqp5TPW66S1HSKL
         wRXmuRoDs8B583vInojnvhrLXgpBC8YgQurC8YnERi/49nVY/vKsDSx3MnPdnOFHeeXW
         9iUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611578; x=1789216378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cwHsO0hV8YW9Z1e5+hyZhT9RVZSyOWleixXLzS40DI=;
        b=c36azfVTnl9DEv0a39JtHLtByDswHpuiTnZ3BXRHX5WnVP+W9u4XHXQuMHTO44IUbc
         +c8BppHrb61StjGsvaie57ojC+Jnl+L2UsOaGDNXLLLlbg95oe58mlLaoiy6JEzjLaFc
         HIVpxyf2txqwt/rcBURBc1TsmTpjEHAw1oOtV2JbNCZMuFI0VEQmiJHbI2onWFxbAz7b
         O/lF3fHHpZbW6zgGHsg07qTRUgHKOr4jytQNTRYKH0g+ljmruUvKuPNWhQOUtfZPQUmj
         WB0g8w22z/BrVI8Po1PAX+ftM7yNqX4DPa3XFDP7sGu1ia8Br76o5Pwyojh4Oztbg7HN
         VMSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGMnjJldGf5rQPcCtHC1AAstllb6GUTjePoNb51XV9L2aeSMKwwqxXpaa/cwpJUTkhQ8BRJReY4kId@lists.linux.dev
X-Gm-Message-State: AFuF++lWF5xNyw8RbEs+478CUGDhKjZ446VOQrQCOuxICKd1k/06/iRC
	Rgz1LzbJdi5HAsigsqtHJ/KAnoQ9DZkKxcR77IQeXTcG92HJwodtr8Ecqo31RFadv87Gzh3qDAQ
	BqcFHS/5pWdCaIhGc632DUSGqzMuHR5g=
X-Gm-Gg: AYBFou1ud3ZzgoeJeAQHr+rJo1iJ2gTkqm3FSsnUAaRyA+2GED/0hgh+ZK/r0qQZi/7
	VFRfO5R+uGLjx0HwlH9hwImF5tKHmnWpgCxCnZsOcsn1VgceQPAVaR2osmBveef+E1mQA53rfaZ
	LcK4TlyukUEE23mZi2bIYKK2tL7u6x/pWW74sgl5n2T+b0W5lXujSU39YATMB9h+Zi9ECZIVV2Y
	WtQNF2IuN73y9xyTjOxQoyGHeUd04JEHLpyKCG/jiqMfk8q/nuVYpoxKNQ+saj3kAV6sc3g8FUI
	Vg9IVSN9A9b5pAMDSdbWutDnCU7D5sz2jbw/VrUCllQFqQ==
X-Received: by 2002:a05:6402:2023:b0:6a7:ef6b:6c7 with SMTP id
 4fb4d7f45d1cf-6a7ef6b0b9emr2296122a12.1.1788611578044; Sat, 05 Sep 2026
 05:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-8-luis@igalia.com>
In-Reply-To: <20260904103920.4471-8-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 14:32:46 +0200
X-Gm-Features: AcwNN1X-4hUbgOK-AYX9YtX0eCMKTuoBNYsFddSvoCKtiEjWVnCUplIuLJuxzAE
Message-ID: <CAOQ4uxhFCKOLexyiP6DQ=a9t+8dhGn=tJLGyHg0NHPz=mPDkhw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 7/8] selftests/fuse: add fuse symlink caching test
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
>  .../fuse/fuse_symlink_cache_test.c            | 167 ++++++++++++++++++
>  3 files changed, 170 insertions(+)
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
> index 000000000000..ca3c5cdaf578
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
> @@ -0,0 +1,167 @@
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
> +#include <limits.h>
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
> +       bool cache;
> +       int readlink_counter;
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
> +           (!strcmp(name, FILENAME) && !(strcmp(name, LINKNAME))))

You probably meant strcmp() !=3D 0 ...
Did you miss this Sashiko comment?

Thanks,
Amir.
