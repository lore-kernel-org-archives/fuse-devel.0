Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3756648380D
	for <fuse-devel@lists.linux.dev>; Mon,  7 Sep 2026 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781127; cv=pass; b=KNrPQORfpwfxmQuEeoEYAcwz6X4wRRsTKSncM7CfLf1zF0Wr+4NQlJn9UChKxF2MHiwn800mXpcvmnIJR/RfioVkNzuXHqN5ceGD2rFIWvISsTzrbZcAwiWDJGyzeKWR78ehZxXh5TGJfn+XLhmW5yN3++pNtfww0yHC+DUVhXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781127; c=relaxed/simple;
	bh=VVL02GMYWb/u6hDJI/5bikv4BicjcyQC43KoC26CTf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mA9McbVfv4J6fMCG6AdgGabfWlbytEpg63SfsqaPMK9qFKO4/dntrxW6K2HegZDtn9QuBVjC+dI+hsuHHyl6M+iWupJPz9QvcUHHH2/vZng5gwavRULRftUMmNxDB0U2Iebmvr7ReZts51JNvUz265QC0O9Qz58dUQ8yHoN5ibY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekNM8sgp; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekNM8sgp"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1677c91969so332717466b.1
        for <fuse-devel@lists.linux.dev>; Mon, 07 Sep 2026 04:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788781124; cv=none;
        d=google.com; s=arc-20260327;
        b=VcQ8zkzdXPkfpmr3GCK1P3zET5BLuGJ7QYJtyL7NO46qjgnxe7J9kynGou+8E5+jul
         uRnvDgeKbSp9kYLUwNgbXvEYBCMcXvppogFTkRCqcGTH1/pcgK2rI5qxIc3PYX6dEt/z
         9FLEyL1LUU9kmTKtRQ4SfImVRZv/rraYv2jmJLNoxW+VA4qLyF3HczRFqlZXzz+iQjgO
         73LBaE+eQ4D2C9sK5uqq6Bpv1D0wFT5ZyBXDKdqQ5KMm0evUdNlhEygbdCKHKyDA+Dzc
         6l+MeEw8t68Ld14xF9ZUQDVxplECtDcj5FYgfJJuNSdFZX4JZpceD14ugqIOd1Adfsoq
         T84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zsumuHn7FPHHPCQh2IOcR/Revkm68pLy+fSdVwAPQkQ=;
        fh=0HaOzPFBTVTsGcVDGAOShlS0peVu1LdI63f6HZoY+BA=;
        b=RaVE4Or7V4xyjqNvZl4YmbJFR0Fvk4XzJEJR2sDIeGYRFdpVUbfGeD9kpYxCB4rwb2
         ux2cqeAXYcFXrvNFnYS0hrnev0MNeTui7pLSDB+6ge7pZfqydVhypEU9YFeR3k8O2Zyh
         DoJ2CH4gi8ZJ66JeniQaktgYXnFkTQ6UkIm4YQ5a7iTx1kICZSpM1niXEbdkBpBzreiJ
         Ugd4BRuShDZ/jXapMyUmjW7MFfyOZnsb9QxBgubdCrHWdJO4747sf07quyyHxiEhrFQj
         lzT8b3mPMbdhx9mv953TY8bmtH4QfJBrNegDXBxRq+rOSHOActnWtI/Sfovv8VELvqtR
         Y8/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781124; x=1789385924; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zsumuHn7FPHHPCQh2IOcR/Revkm68pLy+fSdVwAPQkQ=;
        b=ekNM8sgpeJas8r1aOebeqY7dT9c0KvJ7zdCfm8r2dHNVaezz0p0pcAMquaTmzL3FAp
         tWlIVcO17sKsgbqFHABV6qG+eHxEAZssD2Z/iTfjxzd+2RodoYbkAw+B3SqnRS6Y8QBq
         adcEU11oJm17/9KVyXjDbWjqZIAv1BgpnRWGEvSRgxuWX6UsnUvEpE539SdCvXiZjBPL
         yZhl8w0pBPWtTWrjLmIhp+ddr0vTPAk3Gpc3uwKn7ECbXhvRVFyutX8/F0ucObJi+KNU
         FbS4XTXSYNbaT78S1QgEJ50phZYAU2nSU2UmC9el65sWddILGOMVhTQRtnAx0J0GJA/V
         4GWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781124; x=1789385924;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zsumuHn7FPHHPCQh2IOcR/Revkm68pLy+fSdVwAPQkQ=;
        b=iULF86mPm+FkSjnxoQverL1AkFucDcvaBVZ//cM+v5Q2O7VyNHzP3Lx60OxvJlgyVN
         JVWxhl/4PT1hRrGqvbln0vW1boNtsUV5J7kWrl2z6doCJhaKdX9PyfGT/IYUzGMsl1Nf
         aaBFkpWo2esh9gANx4LIrr1QZKzKVP2TAw88xcKNrTs0HAqajIOOuuNIHrWgxQ0w5DS5
         6ILxZJHcEiVh1ko3Z4rJphfFIzoXg2YysS2A8rgB5GhffT7qg6QInBPBfFEy8jKCXga0
         YXIJVjljGyYGzmMjwbAgg40wpA8X3rjnlrpRBB/CJPLV7l48He8qJJ09uHg8YHoqpXkt
         YgZw==
X-Forwarded-Encrypted: i=1; AKwUvBx6Yi0dPl8nL/kRuZb+zuUXYeJacR5g8k4WPXbD+YrcWSYRF1BrHjRvVUymwhPzbq2GdKTj3zhASqJf@lists.linux.dev
X-Gm-Message-State: AFuF++l8QuuKl01QRP9Mx9KdmJi9tG4EpvYByp5AXwwTxNTm8ZtakMBS
	/Ki6u6JEgACzPGDBB44ZYb3+LL5FLqjRl6kmWiHUQPK1dxC2JOPYhI9l6ofNIwrAWnzBshdDsL8
	yozXEOEiYJ5sxwEjh9FCAmg5AsvUArZQ=
X-Gm-Gg: AYBFou0021YxmQFEjyoicvO0U8LODp5RAec1wEzxFMpa2zJ3EgcP/HLH11SLLjPLO8Q
	SDlg9b7a/0rK3FEWMihb4D5LtgGqreTdglX133TLxZZZotLJWlPb6h/rEj2SaPZ8pfMyIPaStxw
	Gcq8P2sm9xXS0H3CgHcbRAIwTJGCIwFz1P4EWaMC79QClSQhWW+FDI8H+8Q8sT1WxIqjgpbf2o2
	GY6La8OfyBUBbNsYlYDF0m36oM8544XVCEQN4Q54UPZXqS6l2ECDICf0g5BbEjImquOk+T20/NG
	h2uJgGv75mxahTqCf9dKxwhhDG3rwbwpWldTxXhUBga0LLGuRB3/u9fH
X-Received: by 2002:a17:907:6092:b0:c26:3478:fbb0 with SMTP id
 a640c23a62f3a-c263478fce6mr388269066b.11.1788781123926; Mon, 07 Sep 2026
 04:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-5-luis@igalia.com>
 <CAOQ4uxgR8v6H=8fHMmLjChsuXUn8560nzda55t8pCNA1ocvg_A@mail.gmail.com> <87pkypfihg.fsf@wotan.olymp>
In-Reply-To: <87pkypfihg.fsf@wotan.olymp>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 7 Sep 2026 13:38:31 +0200
X-Gm-Features: AcwNN1VBg_-Nh0xqgh5QGpERcqSlw7P_XDXd6wO9zSOlVqLVhQ7X3lt_FZWaIoE
Message-ID: <CAOQ4uxjtuwyXrckor8pu+ShvOJWO8rG1=o-DfbWhwQ+vbHTnTg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/8] selftests/fuse: factor-out test fixture setup/teardown
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 12:44=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> On Sat, Sep 05 2026, Amir Goldstein wrote:
>
> > On Fri, Sep 4, 2026 at 12:38=E2=80=AFPM Luis Henriques <luis@igalia.com=
> wrote:
> >>
> >> In order to reduce new tests setup/teardown code duplication, factor-o=
ut
> >> these functions from the existing acl_cache test into a new fuse_commo=
n.c
> >> file that can be reused in other tests.
> >>
> >> Signed-off-by: Luis Henriques <luis@igalia.com>
> >> ---
> >>  .../selftests/filesystems/fuse/Makefile       |  8 ++-
> >>  .../filesystems/fuse/fuse_acl_cache_test.c    | 62 +++---------------=
-
> >>  .../selftests/filesystems/fuse/fuse_common.c  | 60 ++++++++++++++++++
> >>  .../selftests/filesystems/fuse/fuse_common.h  | 25 ++++++++
> >>  4 files changed, 100 insertions(+), 55 deletions(-)
> >>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_comm=
on.c
> >>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_comm=
on.h
> >>
> >> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools=
/testing/selftests/filesystems/fuse/Makefile
> >> index a3ee9b3a2f5d..7744f796eb06 100644
> >> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> >> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> >> @@ -21,8 +21,12 @@ ifeq ($(VAR_LDLIBS),)
> >>  VAR_LDLIBS :=3D -lfuse3 -pthread
> >>  endif
> >>
> >> +CFLAGS +=3D $(VAR_CFLAGS)
> >> +LDLIBS +=3D $(VAR_LDLIBS)
> >> +
> >>  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
> >>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
> >>
> >> -$(OUTPUT)/fuse_acl_cache_test: CFLAGS +=3D $(VAR_CFLAGS)
> >> -$(OUTPUT)/fuse_acl_cache_test: LDLIBS +=3D $(VAR_LDLIBS)
> >> +$(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
> >> +
> >> +EXTRA_CLEAN :=3D fuse_common.o
> >> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_t=
est.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> >> index 2411a6e285f1..12cbf9753d03 100644
> >> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> >> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> >> @@ -33,23 +33,15 @@
> >>   */
> >>
> >>  #define _GNU_SOURCE
> >> -#include <errno.h>
> >>  #include <fcntl.h>
> >>  #include <linux/limits.h>
> >> -#include <pthread.h>
> >>  #include <stdint.h>
> >> -#include <stdio.h>
> >> -#include <stdlib.h>
> >> -#include <string.h>
> >> -#include <sys/stat.h>
> >>  #include <sys/xattr.h>
> >> -#include <unistd.h>
> >> -
> >> -#define FUSE_USE_VERSION 31
> >> -#include <fuse_lowlevel.h>
> >>
> >>  #include "kselftest_harness.h"
> >>
> >> +#include "fuse_common.h"
> >> +
> >>  /* ---- ACL binary encoding -----------------------------------------=
------- */
> >>  /*
> >>   * POSIX ACL v2 xattr format (little-endian):
> >> @@ -176,69 +168,33 @@ static const struct fuse_lowlevel_ops fs_ops =3D=
 {
> >>         .getxattr =3D fs_getxattr,
> >>  };
> >>
> >> -/* ---- Daemon thread -----------------------------------------------=
-------- */
> >> -
> >> -static void *run_daemon(void *arg)
> >> -{
> >> -       fuse_session_loop((struct fuse_session *)arg);
> >> -       return NULL;
> >> -}
> >> -
> >>  /* ---- kselftest harness -------------------------------------------=
-------- */
> >>
> >>  FIXTURE(acl_cache) {
> >>         struct fuse_session *se;
> >> -       char                 mountpoint[PATH_MAX];
> >> +       char                 mountpoint[MOUNTPOINT_SZ];
> >>         char                 file_path[PATH_MAX];
> >>         pthread_t            thread;
> >>  };
> >
> > Nice!
> > I think it would be even nicer to have struct fuse_common_ctx
> > with the common members embedded in the per test state,
> > but I'll let you decide if you want to do that or not.
>
> Thanks for the suggestion.  It may make sense indeed to have that common
> struct, although it would probably only include the spinlock and a bool
> for enabling/disabling the cache.  I'll have a closer look and see if it
> makes sense.

I meant that it should include:
         struct fuse_session *se;
         char                 mountpoint[PATH_MAX];
         pthread_t            thread;

instead of passing them by reference individually to fs_setup/teardown()
not a big deal, just a bit nicer IMO.

Thanks,
Amir.
