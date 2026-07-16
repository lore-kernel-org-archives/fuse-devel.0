Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A1C31716D
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 10:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196654; cv=pass; b=MHlzHxqhFs/ocuVJ4hbi8Buh+SPWu4x8ZyBNuw0jk/0NrgsDqwU7mInC0NmZXIq8FcaQQmqVSL20zPLzVGlOvQrBVBIu0MHS3KpuM7QnGwOCXXMcbGoiKJ7dQe2cbxpTbALV02l9gRN+bRaZofDzscwx+gsPqC/kUMKYgY4vQ9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196654; c=relaxed/simple;
	bh=wdoH4vVSgCV8Vy8zKUQ/D2sUf3K607DiBbUC9mekiSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d0dpcJ+GPMcCRLa6ssbQir6IqUkoZhGU0GSZ0fAeElC6sHtsLg484WCyIXWKbWbtLE2nSUFz+I5bUlJhlFW0dOQ7LyqzbrOvU63xw1RaLCANyyqwVyRLpSS2+/lJzKgOC/zPn2akkmlsWQlYb136gq0mrAICqbWEr0h73V6RgwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXHghpSY; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXHghpSY"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f365afc5aso2637499f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 03:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784196649; cv=none;
        d=google.com; s=arc-20260327;
        b=ZJIN8SFXffdQrQIgBM5iJu1ukulub5N9LyknWdN6ITs3doAp7ld3rZ4TsRU5RnIOIz
         a5PYnucjJoAlFihi62oVe0WzqO5LOqQ67BvzeDOjnM5mP/Wlvsn2QHva8H3vmX2KTYYf
         9W6JtYpzkx0wItw98jyfXiE23eMEXVV5ko3KpBGxPvxr1cRVW3FnPBVL4XpSvUndyASD
         EyhL897GheKqLoN54Spk3TS61bSHOOCqXxT/HA28L+l8pqk0xhoua1nBoUWm5fth8iTK
         WuCuSNbEyLSBwS2TKvazibQx9qHDm5/axk0W1EEBx+BND/K3ewP10xRmEdYkH5F0duYb
         RTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J3IobLSNa8tEbszCZcos0VyuBwrX1hmu/oe4PhdIdHQ=;
        fh=WQdM+tYf+UDjA92D7q6hVsuC9vEDH3GZqZqmzP9GyfE=;
        b=Iy85chaV6hfo8yzCAX1aHBw9x1tpxJ85MGB65b3rGFnLr1j87PxJXbtbahzf1q74vb
         thyV0sPcoPtChWMp4Fx5a+IlQk2YIP2hQGBlmjiW9g2lQUJ94BEG/6NnPEE3ysETzfH5
         bfVWo6PNVVxbjUEKf0Tp0ibzwQdH6MHLRsZHaegKLSSsvHJsmXaoiW01Tr6khtF8sz/t
         K1L8Isfn+vnvSRm3Fi727HXwOutB/OwfmOzjVwpFe3zZNXgp8GYzrH1zeG/KSDs+69T0
         yDdlQtdcZC1hFts9T+FCfp+SeaeJj525pJ9l6/ywkSADM2EUjT7n36+RHfSyhsPBjOc0
         LoZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784196649; x=1784801449; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J3IobLSNa8tEbszCZcos0VyuBwrX1hmu/oe4PhdIdHQ=;
        b=PXHghpSYGuqyxDldGlVDhDikih6VMBlhJPhf73BbxxjALXxe1jnmADFiwI5HYuH/V1
         foUkoFD55flrTxrFdbIl3Zn82E1vLCF1gn79WoUG+N740j24lT92ZHhaq/yqUyyR42Yc
         nVbih6mVPgE9UEr+6E3NCLNgDshIiV/NfUqunmHXaCu5PZ1fIsb6ggXoJH0v69Y1+ZRq
         bAYrUyH3DNkdZVk4gGXv0ZnpL8QoUzsnbEBohmE+M2s9155a2iIxUdV1+FBu2MFy7UJX
         j+2btZs7H/9NSLwlMDARsqoz7DCFlBfH2WlpyhXw7E1ZxYbe+zzItgKJkSQEOnbTQkk3
         C26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784196649; x=1784801449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3IobLSNa8tEbszCZcos0VyuBwrX1hmu/oe4PhdIdHQ=;
        b=PZi0Vc65EwRmlDfXZpaTndzOEPeHsuZyggD33VuzKYuPWrjcdmrNybl83EVsXVFljV
         8TkijzS0LdnUQ++Xem1MOthVs/9Ok1Kk9TI6/jv13aF+SQ5hbbN/9DN+ZX1Maa4St5uq
         NQ3Ts9HTmuW/hWqCa16a8+UAJk2s8OGh2yGyfYEIXj1XIhLFUgVC61eCJnbrD9r+bq/o
         0SJR+YETzlOLq56FzPKrFbJRA62p7SrdqEwD8TpoxU79Z3krEHvybjDhvfa+0pEBMWpU
         zd5hx6xJa/p+jzoAWmoaBD8QY3FxzAkcyg4prPzFZnetwHumBnEV1tfJTAxO/Q6aD155
         ZTHw==
X-Forwarded-Encrypted: i=1; AHgh+RqWG/L5RQlSxuMMwzNtC9yRSvuzv2TpaG9k98MqQAYytKYIcfa1Hqby1CuJZcEZ1TyTB8daexTWPZwt@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk4PfKGaypDIjnW39EjJ7OBWQAbRpw4ZQJCP7fGKIaObKoRV99
	8Bi1C9pCz6akn01mT6NsyUrJMdr/kiykiKBxH0HUY/JlRAW7xnZcEOu+KJoK6USsMYdQ+Mej785
	QB0B5MGqZM23Sdca+d5lTwFpnSuQ1NQU=
X-Gm-Gg: AfdE7cnR0xNPt6GJOGX+6ABIQjfFmr2pPqk/H+rFz+yEnAOZWJSdJis1swkuLZft1pA
	WyMZxjRxJzPdZCDnEuBnc9HyCW12sJvgolx+BG7DGUuOs51Invzbw3KikkV8pwpqzx9EKMz0j2d
	Gbdm0CMDP89oPOX2brKyxN+EFyL2S3XzP0cRWjQineGdQ9vkXFltUDHf3jtZsdN9HbkGklZhNuW
	J+CWRK8OEmPO3amTjdA2pJjaAvqMIM6vX2FhszMvZ9I5rCtP6UkdVsUeQOkOu86ZWqjoeHG/Q==
X-Received: by 2002:a05:6000:238a:b0:47d:e9a1:1f61 with SMTP id
 ffacd0b85a97d-47f4887d282mr13261993f8f.13.1784196648611; Thu, 16 Jul 2026
 03:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713220932.413004-1-amir73il@gmail.com> <20260713220932.413004-3-amir73il@gmail.com>
 <87wluw2qeh.fsf@wotan.olymp> <CAOQ4uxjzAXgBaggRNJxcEn39LY4+D6ZVHLqODJ3C6cHnDdkG_g@mail.gmail.com>
 <87se5k2des.fsf@wotan.olymp>
In-Reply-To: <87se5k2des.fsf@wotan.olymp>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 16 Jul 2026 12:10:35 +0200
X-Gm-Features: AUfX_mwH652Dgfq4CIg0G7JVB8jawP5XYBqjsRjs2qSa3IlmfAD8sU514NtBw2I
Message-ID: <CAOQ4uxjakizfBuTYUG-=K+L1MUfaCkwtKUyNh2g_9K2c4u3-Ng@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests/fuse: add ACL_DONT_CACHE regression test
To: Luis Henriques <luis@igalia.com>
Cc: Christian Brauner <brauner@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, Chen Linxuan <chenlinxuan@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 10:41=E2=80=AFPM Luis Henriques <luis@igalia.com> w=
rote:
>
> Hi!
>
> On Wed, Jul 15 2026, Amir Goldstein wrote:
>
> [...]
> >> A question: in my own tests I have been following a different approach=
,
> >> where the filesystem is mounted from a shell script that does the actu=
al
> >> testing.  I wonder if you think your approach (i.e. writing the actual
> >> test in C, using the kselftest macros) is the preferred one.
> >
> > I always prefer a standalone C program for a selftest.
> > For fstests naturally the tests are done by the shell scripts,
> > so it really depends.
>
> Cool, thanks.  I'll consider adapting my own tests to have a similar
> format as this one.
>
> >> Anyway, the test looks good to me, and I just have a few minor comment=
s
> >> below.
> >>
> >> > fuse_acl_cache_test is only built when libfuse3 is detected via
> >> > pkg-config.
> >>
> >> Yeah, I've sent a patch recently converting the only existing test to =
also
> >> user fuse3 instead.  Not sure that's acceptable though, since there's =
a
> >> chance of breaking some CI.
> >
> > I mean if the test is not built it wont run, so I don't know why CI wou=
ld fail.
> > Obviously some systems do not have libfuse. That's fine by me
> > not everyone needs to run all the tests.
>
> Oh! as usual my comment wasn't clear :-)
>
> In fact, my comment wasn't really very relevant in the context of this
> patch as, in my opinion, I think it's OK for new tests to depend on fuse3=
.
>
> I was talking about my own patch[1] which was converting the existing
> test, which depends on fuse2, to use fuse3.  That's what I was referring
> to when talking about breaking CI: we could have a scenario where a test
> was being built and executed and, because it's now using fuse3, it can't
> be built any more.
>
> [1] https://lore.kernel.org/all/20260708131122.2917-3-luis@igalia.com/
>

CC test author
I think your concern is exaggerated
This test is 1 year old. Who runs this test and doesn't have fuse3?

Also, when speaking of regressions, test suites are usually the last of
concerns - they always regularly break after kernel changes, because
of "over expectations".

Test suit runners usually keep the test suite uptodate.

They are almost never deployed binary rpm packages where kernel
regressions cause a problem.

And also, it's not critical, so you can always try and see if someone shout=
s
(and then you can also shout back).

> >
> > Thanks for the review!
>
> I had two extra comments below, not sure you saw them ;-)

I did not :)

>
> Cheers,
> --
> Lu=C3=ADs
>
> > Amir.
> >
> >>
> >> > Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> >> > ---
> >> >  .../selftests/filesystems/fuse/Makefile       |  10 +
> >> >  .../filesystems/fuse/fuse_acl_cache_test.c    | 348 +++++++++++++++=
+++
> >> >  2 files changed, 358 insertions(+)
> >> >  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_ac=
l_cache_test.c
> >> >
> >> > diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/too=
ls/testing/selftests/filesystems/fuse/Makefile
> >> > index 612aad69a93aa..f471414842750 100644
> >> > --- a/tools/testing/selftests/filesystems/fuse/Makefile
> >> > +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> >> > @@ -5,6 +5,13 @@ CFLAGS +=3D -Wall -O2 -g $(KHDR_INCLUDES)
> >> >  TEST_GEN_PROGS :=3D fusectl_test
> >> >  TEST_GEN_FILES :=3D fuse_mnt
> >> >
> >> > +# fuse_acl_cache_test requires libfuse3; add it only when the libra=
ry is present.
> >> > +ACL_CFLAGS :=3D $(shell pkg-config fuse3 --cflags 2>/dev/null)
> >> > +ACL_LDLIBS :=3D $(shell pkg-config fuse3 --libs 2>/dev/null)
> >> > +ifneq ($(ACL_CFLAGS),)
> >> > +TEST_GEN_PROGS +=3D fuse_acl_cache_test
> >> > +endif
> >> > +
> >> >  include ../../lib.mk
> >> >
> >> >  VAR_CFLAGS :=3D $(shell pkg-config fuse --cflags 2>/dev/null)
> >> > @@ -19,3 +26,6 @@ endif
> >> >
> >> >  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
> >> >  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
> >> > +
> >> > +$(OUTPUT)/fuse_acl_cache_test: CFLAGS +=3D $(ACL_CFLAGS)
> >> > +$(OUTPUT)/fuse_acl_cache_test: LDLIBS +=3D $(ACL_LDLIBS)
> >> > diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache=
_test.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> >> > new file mode 100644
> >> > index 0000000000000..b2e5db8555040
> >> > --- /dev/null
> >> > +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> >> > @@ -0,0 +1,348 @@
> >> > +// SPDX-License-Identifier: GPL-2.0
> >> > +/*
> >> > + * Test: FUSE ACL caching bug triggered by AT_STATX_FORCE_SYNC
> >> > + *
> >> > + * A FUSE mount that does not negotiate FUSE_POSIX_ACL initialises =
every inode
> >> > + * with i_acl =3D i_default_acl =3D ACL_DONT_CACHE.  When a fresh s=
tat is needed
> >> > + * (e.g. AT_STATX_FORCE_SYNC), fuse_update_get_attr() calls
> >> > + * forget_all_cached_acls() before issuing FUSE_GETATTR.  On an unf=
ixed kernel,
> >> > + * __forget_cached_acl() replaces ACL_DONT_CACHE with ACL_NOT_CACHE=
D,
> >> > + * inadvertently enabling the kernel ACL cache for that inode.  The=
 next
> >> > + * getxattr populates the cache.  Because fuse_set_acl() skips
> >> > + * forget_all_cached_acls() for !fc->posix_acl mounts, any subseque=
nt change to
> >> > + * the ACL leaves the stale kernel entry in place, and the next get=
xattr returns
> >> > + * wrong data without ever reaching the FUSE daemon.
> >> > + *
> >> > + * Fix (fs/posix_acl.c): __forget_cached_acl() returns early when *=
p is
> >> > + * ACL_DONT_CACHE, preserving the "never cache" invariant for the i=
node's
> >> > + * lifetime.
> >> > + *
> >> > + * Test outline:
> >> > + *  1. Mount a minimal FUSE fs (no FUSE_POSIX_ACL negotiated).
> >> > + *  2. lgetxattr -> daemon called, ACL_A returned, NOT cached (ACL_=
DONT_CACHE).
> >> > + *  3. statx(AT_STATX_FORCE_SYNC) -> forget_all_cached_acls() calle=
d.
> >> > + *     Buggy:  ACL_DONT_CACHE -> ACL_NOT_CACHED (cache enabled).
> >> > + *     Fixed:  ACL_DONT_CACHE preserved.
> >> > + *  4. lgetxattr -> daemon called, ACL_A returned.
> >> > + *     Buggy:  result now cached (ACL_NOT_CACHED -> cached).
> >> > + *     Fixed:  result still not cached.
> >> > + *  5. Daemon switches to ACL_B internally (different size).
> >> > + *  6. lgetxattr -> should return ACL_B (44 bytes).
> >> > + *     Buggy:  cache hit, returns stale ACL_A (28 bytes). FAIL.
> >> > + *     Fixed:  no cache, daemon called, returns ACL_B (44 bytes). P=
ASS.
> >> > + */
> >> > +
> >> > +#define _GNU_SOURCE
> >> > +#include <errno.h>
> >> > +#include <fcntl.h>
> >> > +#include <linux/limits.h>
> >> > +#include <pthread.h>
> >> > +#include <stdint.h>
> >> > +#include <stdio.h>
> >> > +#include <stdlib.h>
> >> > +#include <string.h>
> >> > +#include <sys/stat.h>
> >> > +#include <sys/syscall.h>
> >> > +#include <sys/xattr.h>
> >> > +#include <unistd.h>
> >> > +
> >> > +#define FUSE_USE_VERSION 31
> >> > +#include <fuse_lowlevel.h>
> >> > +
> >> > +#include "kselftest_harness.h"
> >> > +
> >> > +/* ---- ACL binary encoding ---------------------------------------=
--------- */
> >> > +/*
> >> > + * POSIX ACL v2 xattr format (little-endian):
> >> > + *   header: u32 version (=3D 0x00000002)
> >> > + *   entry:  u16 tag | u16 perm | u32 id
> >> > + *
> >> > + * Entries must appear in tag-ascending order; named USER/GROUP ent=
ries
> >> > + * require a MASK entry.  Both ACLs pass posix_acl_from_xattr() val=
idation.
> >> > + */
> >> > +
> >> > +/* ACL_A: 3 entries (USER_OBJ:rwx, GROUP_OBJ:r-x, OTHER:r-x) =3D 28=
 bytes */
> >> > +static const uint8_t acl_a[] =3D {
> >> > +     0x02, 0x00, 0x00, 0x00,                         /* v2 header  =
    */
> >> > +     0x01, 0x00, 0x07, 0x00, 0xff, 0xff, 0xff, 0xff, /* USER_OBJ  r=
wx  */
> >> > +     0x04, 0x00, 0x05, 0x00, 0xff, 0xff, 0xff, 0xff, /* GROUP_OBJ r=
-x  */
> >> > +     0x20, 0x00, 0x05, 0x00, 0xff, 0xff, 0xff, 0xff, /* OTHER     r=
-x  */
> >> > +};
> >>
> >> Wouldn't it be OK to add a dependency on libacl to make this more
> >> readable?
> >>

It would be ok, but TBH, the only fact relevant to this test is that
acl_a and acl_b
are different. That is pretty easy to understand even without libacl...

> >> >
> >> > +
> >> > +/*
> >> > + * ACL_B: 5 entries =E2=80=94 adds USER uid=3D1 and MASK =3D 44 byt=
es.
> >> > + * A named USER entry requires a MASK; all tags in ascending order.
> >> > + */
> >> > +static const uint8_t acl_b[] =3D {
> >> > +     0x02, 0x00, 0x00, 0x00,                         /* v2 header  =
     */
> >> > +     0x01, 0x00, 0x07, 0x00, 0xff, 0xff, 0xff, 0xff, /* USER_OBJ   =
rwx  */
> >> > +     0x02, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x00, /* USER uid=3D=
1 rwx  */
> >> > +     0x04, 0x00, 0x05, 0x00, 0xff, 0xff, 0xff, 0xff, /* GROUP_OBJ  =
r-x  */
> >> > +     0x10, 0x00, 0x07, 0x00, 0xff, 0xff, 0xff, 0xff, /* MASK       =
rwx  */
> >> > +     0x20, 0x00, 0x05, 0x00, 0xff, 0xff, 0xff, 0xff, /* OTHER      =
r-x  */
> >> > +};
> >> > +
> >> > +/* ---- Shared state (daemon thread <-> test thread) --------------=
--------- */
> >> > +
> >> > +#define FILE_INO  2
> >> > +#define FILE_NAME "testfile"
> >> > +
> >> > +struct daemon_state {
> >> > +     pthread_mutex_t lock;
> >> > +     const uint8_t  *acl;
> >> > +     size_t          acl_size;
> >> > +     int             getxattr_count;
> >> > +};
> >> > +
> >> > +/*
> >> > + * Global: callbacks are stateless fns so we use a single global.
> >> > + * Safe because only one test instance runs at a time.
> >> > + */
> >> > +static struct daemon_state g_ds =3D {
> >> > +     .lock =3D PTHREAD_MUTEX_INITIALIZER,
> >> > +};
> >> > +
> >> > +/* ---- FUSE lowlevel callbacks -----------------------------------=
--------- */
> >> > +
> >> > +static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char=
 *name)
> >> > +{
> >> > +     if (parent !=3D FUSE_ROOT_ID || strcmp(name, FILE_NAME)) {
> >> > +             fuse_reply_err(req, ENOENT);
> >> > +             return;
> >> > +     }
> >> > +     struct fuse_entry_param e =3D {};
> >> > +
> >> > +     /*
> >> > +      * Long attr/entry timeouts so that normal stat() calls do not
> >> > +      * expire and trigger forget_all_cached_acls() on their own;
> >> > +      * only the explicit AT_STATX_FORCE_SYNC should trigger it.
> >> > +      */
> >> > +     e.ino             =3D FILE_INO;
> >> > +     e.generation      =3D 1;
> >> > +     e.attr_timeout    =3D 10.0;
> >> > +     e.entry_timeout   =3D 10.0;
> >> > +     e.attr.st_ino     =3D FILE_INO;
> >> > +     e.attr.st_mode    =3D S_IFREG | 0644;
> >> > +     e.attr.st_nlink   =3D 1;
> >> > +     fuse_reply_entry(req, &e);
> >> > +}
> >> > +
> >> > +static void fs_getattr(fuse_req_t req, fuse_ino_t ino,
> >> > +                    struct fuse_file_info *fi)
> >> > +{
> >> > +     struct stat st =3D {};
> >> > +
> >> > +     (void)fi;
> >> > +     if (ino =3D=3D FUSE_ROOT_ID) {
> >> > +             st.st_ino   =3D FUSE_ROOT_ID;
> >> > +             st.st_mode  =3D S_IFDIR | 0755;
> >> > +             st.st_nlink =3D 2;
> >> > +     } else if (ino =3D=3D FILE_INO) {
> >> > +             st.st_ino   =3D FILE_INO;
> >> > +             st.st_mode  =3D S_IFREG | 0644;
> >> > +             st.st_nlink =3D 1;
> >> > +     } else {
> >> > +             fuse_reply_err(req, ENOENT);
> >> > +             return;
> >> > +     }
> >> > +     fuse_reply_attr(req, &st, 10);
> >> > +}
> >> > +
> >> > +static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char =
*name,
> >> > +                     size_t size)
> >> > +{
> >> > +     if (ino !=3D FILE_INO ||
> >> > +         strcmp(name, "system.posix_acl_access") !=3D 0) {
> >> > +             fuse_reply_err(req, ENODATA);
> >> > +             return;
> >> > +     }
> >> > +
> >> > +     pthread_mutex_lock(&g_ds.lock);
> >> > +     const uint8_t *acl      =3D g_ds.acl;
> >> > +     size_t         acl_size =3D g_ds.acl_size;
> >> > +     g_ds.getxattr_count++;
> >> > +     pthread_mutex_unlock(&g_ds.lock);
> >> > +
> >> > +     if (size =3D=3D 0)
> >> > +             fuse_reply_xattr(req, acl_size);
> >> > +     else if (size < acl_size)
> >> > +             fuse_reply_err(req, ERANGE);
> >> > +     else
> >> > +             fuse_reply_buf(req, (const char *)acl, acl_size);
> >> > +}
> >> > +
> >> > +static const struct fuse_lowlevel_ops fs_ops =3D {
> >> > +     .lookup   =3D fs_lookup,
> >> > +     .getattr  =3D fs_getattr,
> >> > +     .getxattr =3D fs_getxattr,
> >> > +};
> >> > +
> >> > +/* ---- Daemon thread ---------------------------------------------=
---------- */
> >> > +
> >> > +static void *run_daemon(void *arg)
> >> > +{
> >> > +     fuse_session_loop((struct fuse_session *)arg);
> >> > +     return NULL;
> >> > +}
> >> > +
> >> > +/* ---- kselftest harness -----------------------------------------=
---------- */
> >> > +
> >> > +FIXTURE(acl_cache) {
> >> > +     struct fuse_session *se;
> >> > +     char                 mountpoint[PATH_MAX];
> >> > +     char                 file_path[PATH_MAX];
> >> > +     pthread_t            thread;
> >> > +};
> >> > +
> >> > +FIXTURE_SETUP(acl_cache)
> >> > +{
> >> > +     char *fuse_argv[] =3D { "fuse_acl_cache_test", NULL };
> >> > +     struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
> >> > +
> >> > +     g_ds.acl            =3D acl_a;
> >> > +     g_ds.acl_size       =3D sizeof(acl_a);
> >> > +     g_ds.getxattr_count =3D 0;
> >> > +
> >> > +     strcpy(self->mountpoint, "/tmp/acl_cache_test_XXXXXX");
> >> > +     if (!mkdtemp(self->mountpoint))
> >> > +             SKIP(return, "mkdtemp: %s", strerror(errno));
> >> > +
> >> > +     snprintf(self->file_path, sizeof(self->file_path),
> >> > +              "%s/" FILE_NAME, self->mountpoint);
> >> > +
> >> > +     self->se =3D fuse_session_new(&args, &fs_ops, sizeof(fs_ops), =
NULL);
> >> > +     if (!self->se) {
> >> > +             rmdir(self->mountpoint);
> >> > +             SKIP(return, "fuse_session_new failed");
> >> > +     }
> >> > +
> >> > +     if (fuse_session_mount(self->se, self->mountpoint)) {
> >> > +             fuse_session_destroy(self->se);
> >> > +             rmdir(self->mountpoint);
> >> > +             SKIP(return, "fuse_session_mount failed "
> >> > +                          "(missing fusermount3 or insufficient pri=
vileges)");
> >> > +     }
> >> > +
> >> > +     if (pthread_create(&self->thread, NULL, run_daemon, self->se))=
 {
> >> > +             fuse_session_unmount(self->se);
> >> > +             fuse_session_destroy(self->se);
> >> > +             rmdir(self->mountpoint);
> >> > +             SKIP(return, "pthread_create: %s", strerror(errno));
> >> > +     }
> >> > +
> >> > +     fuse_opt_free_args(&args);
> >> > +}
> >> > +
> >> > +FIXTURE_TEARDOWN(acl_cache)
> >> > +{
> >> > +     fuse_session_exit(self->se);
> >> > +     fuse_session_unmount(self->se);
> >> > +     pthread_join(self->thread, NULL);
> >> > +     fuse_session_destroy(self->se);
> >> > +     rmdir(self->mountpoint);
> >> > +}
> >> > +
> >> > +static int do_force_statx(const char *path)
> >> > +{
> >> > +     struct statx stx;
> >> > +
> >> > +     return syscall(SYS_statx, AT_FDCWD, path,
> >> > +                    AT_STATX_FORCE_SYNC, STATX_BASIC_STATS, &stx);
> >> > +}
> >> > +
> >> > +TEST_F(acl_cache, stale_after_force_sync)
> >> > +{
> >> > +     char    buf[512];
> >> > +     ssize_t sz;
> >> > +     int     count;
> >> > +
> >> > +     /*
> >> > +      * Step 1: two getxattr calls before any statx(FORCE_SYNC).
> >> > +      * i_acl =3D=3D ACL_DONT_CACHE.  __get_acl's cmpxchg(p, ACL_NO=
T_CACHED,
> >> > +      * sentinel) finds *p !=3D ACL_NOT_CACHED on every call, so th=
e sentinel
> >> > +      * is never placed and the result is never cached.  Both calls=
 must
> >> > +      * reach the daemon, proving ACL_DONT_CACHE suppresses caching=
.
> >> > +      */
> >> > +     sz =3D lgetxattr(self->file_path, "system.posix_acl_access",
> >> > +                    buf, sizeof(buf));
> >> > +     ASSERT_EQ(sz, (ssize_t)sizeof(acl_a));
> >> > +
> >> > +     sz =3D lgetxattr(self->file_path, "system.posix_acl_access",
> >> > +                    buf, sizeof(buf));
> >> > +     ASSERT_EQ(sz, (ssize_t)sizeof(acl_a));
> >> > +
> >> > +     pthread_mutex_lock(&g_ds.lock);
> >> > +     count =3D g_ds.getxattr_count;
> >> > +     pthread_mutex_unlock(&g_ds.lock);
> >> > +
> >> > +     ASSERT_EQ(count, 2);
> >> > +     TH_LOG("step 1 OK: both pre-trigger getxattrs reached daemon (=
count=3D%d), "
> >> > +            "ACL_DONT_CACHE is working", count);
> >> > +
> >> > +     /*
> >> > +      * Step 2: statx(AT_STATX_FORCE_SYNC).
> >> > +      * fuse_update_get_attr() calls forget_all_cached_acls() befor=
e sending
> >> > +      * FUSE_GETATTR.
> >> > +      *   Buggy kernel:  ACL_DONT_CACHE -> ACL_NOT_CACHED  (cache e=
nabled)
> >> > +      *   Fixed kernel:  ACL_DONT_CACHE preserved           (no eff=
ect)
> >> > +      */
> >> > +     ASSERT_EQ(do_force_statx(self->file_path), 0);
> >>
> >> Why not calling statx(2) instead?  Are you using a libc that doesn't
> >> include a wrapper?

No reason. Will change to statx()

> >>
> >> (Also, I wonder if having the global state protected with a mutex is
> >> really needed in the scope of this test... but yeah, that's the correc=
t
> >> thing to do, of course.)

When writing a test I try to optimize for code clarity and development spee=
d
nothing else.

Obviously I assist agents when writing tests - would be stupid not to,
so when I review I stick to validating correctness and readability.

That's the true reason for syscall(SYS_statx,
I was something correct, I didn't bother to fix it, but your
comment was in place.

Thanks for the review.
Amir.
