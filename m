Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41233AEB2D
	for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 17:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137144; cv=pass; b=PgGskporCg5fT1rKpDkmeOyluPPK3vrvYdLNN4vdvK4M9szM8MTMMMJOoIs5gEMlk6zUusHxMBDYeKl+Z67GRavrtIva+QkngguWChMvDUoBQR+4hbDcQvbhsc+1l7tl2rjOoyUNtdFebuFY8NB5HusUryD+3bKtmtwhqojmuFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137144; c=relaxed/simple;
	bh=l98eAIZJajIyavehqUU8rIoR8bS/bPWYA7lUvllH3oM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lH26Tzqt9txSWLATl+t9T50XXmmzqiRlr46xu8IMDNJWkO5wVHEchD9MXKMo8aYWL+sZXi3GYsBKv38ps35UX5uUoeczEkFaOGwmMiqrPsnYgHkcelhisL665fURpezzCrnPZPkE3jDsOsL18cEjbjcL2zIBc8QXkEG/hcvFFM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZ6upLB9; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZ6upLB9"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69ccd6483acso3218984a12.3
        for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 10:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784137140; cv=none;
        d=google.com; s=arc-20260327;
        b=kI1R5KMrzQkBRaHvHPRpr8cz04eOhN5qd4mWYQwYVDl1avS9Q6DEa7bfqfAo+dGtNf
         IQyNsKIcwvM/8YagIHoTIqz/I2qSLu6l7uj2pixTRUqFfYGyY3cUmjvvauwpgWgud3Rq
         GGA53b7PNiOEAwbo5wrVXrqXVeZCEujeAT6w/stv2VU4VvCnCk1ZUKJkigthFNxpTZla
         vJJm5Vg5HHipnxTJsJnaAZ8ohE6S21mLF0FMt470mkoGpYbfWqr7mKjkwz7y3dq0Bijf
         st5sW6SsmOs9IQJFDBOrqwChnT8EiqRUB6EC0MxA/32F5VEAgCd+EasNeDk+cevxYKBj
         sKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/syWsMeCRmCuls9K/HKnqZbwk5R1VA6vkTtLV9LLnMo=;
        fh=gYDEqAk4SGA6NhomiX9gG7iDAlElX5xC3TwXxpy7NzM=;
        b=Cgfqa+fckgB/PCy/6Q+74Ta0Z1khvjtCvjocwfYJZjB7SZE27Y7lEUteW5T6uG3Khs
         KEg722eBPc7zjqS4TA4wF9VtRZAj0D4V7991eOhrxfDyJmTHGBMzwQeDiCblMr8+JJGE
         jvPljLF8b067ZZQzwhv8XueLRNpiPn4z0f4D36mlzmg7+gjwfQBtP+tCESCGO5OSd2NK
         XcynuUCo43eK+7y1Pp5c4xt8XDVno10gAteyXrWcb3qHnHeXQZzUW0CErTpaL1qQWUb9
         rixpb28UL2SqMnH5GNxy7492jM+/UlqXXAonF01iBn/7sbkohExdvFmYAygcyCXYB+or
         GkCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784137140; x=1784741940; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/syWsMeCRmCuls9K/HKnqZbwk5R1VA6vkTtLV9LLnMo=;
        b=dZ6upLB9i2ChmsWdVlZarvLw1VnobcjZimcigAIbFaO+z6sH2B2mWwF2mNX4RclLCR
         0wRqhrtLm3palxjQqAqNCO6PTL+A0n5I5CM8x8AcQuKMjg0ZY/OJqF8fPsqPjsecKOL1
         pzcRqjXMH7ICEhfNVKQbOfY2kDAVkfX/LpiKjDOGguTOEhYGP658rP1RtfPVxInIIe4c
         ieUXbWPNEE51BNkSpM22A0pfLcekfDFTw2u1WevEK7WkRsQsImfy3rkHt53WcQ9Zr9wC
         K66JM8Ya6a47eVSOTgJNvWtI1g2sfvl5MlhUH0GzZwjjFVQ0SJOFeHpnWngHVIdxurP/
         txvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784137140; x=1784741940;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/syWsMeCRmCuls9K/HKnqZbwk5R1VA6vkTtLV9LLnMo=;
        b=KcY7FA2jQmuhQbz7gO3vTHfMYTFyETCXcjHSJnVN7LMAsboVy79iadfNGrrKCP0EEv
         9Viy2Oe0li4SSw2ARwRyCn1qD1WKJA6m782BC7R0CQaB7KyQRs8zesw06udhvWDI7c4n
         k6BKBSAYhaG7HOcthAFE2ZbPBPRpqPo5ZbdWmN7muceKWN5jBQC2cxDmDJnegZU89TWY
         zJkarf1e85tvotttnUhfCdjU+9GURHg9c8U6xGLEpiwsIuGU1U49jXdgZPHpNIKJiAtm
         ScDIZQ9FlNAewRJbUUskc5wVJPkwS6BkoOz+v2l7Ps9zOjlcI0Ph0Bij0JNCTC+TAVFR
         QbMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3/eKBgSwtH8u0j5oTwHsJlM7qlK+itJd48Qr/zl0k3ayKD98FkMEvwGf4K1M1FtBfivbua1GXklmv@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5dKh4uqBAyhoDO3h99YR7zAJR3//j8dxghz/GtXZn+9HFST6z
	F0AGcmypUECUFn1zF5gHXeKL5GeRTlLejYPI4admwvs+aDKT22eHFnFOc/+H6heWOUlJoQXQpKX
	RGxOL1tduJpQP4HfdkEk2h1wV5OeT1ik=
X-Gm-Gg: AfdE7cllcJSGqchOlMz6kd5DZIYHrjbQ0VeceHuX69xuSTSiuJJkjbQR2IGNKjytPdl
	tSOnhQxP5f11L7AMY5CKSAYRHr18dCD0AHvkzUEZKVbG0rE9JKoYCLQTZs+T7jVVkvpRctLzkaS
	nWjes+vUsvJcOTii5BU/YWMKWqvZ0PpP/BqgNH7vMiR/l+tUO/w/YV0iu3zY0+IolUOIBy2lzwf
	k6fYF1V4HiXPzqumCjSHptXibmnZ3uVAIaiADCnLKr5CuiYvqzlMoAw7tMP6w7DOOC0bE77a6Fb
	6Fk5Jmp9
X-Received: by 2002:a05:6402:a515:10b0:69e:2585:7e6 with SMTP id
 4fb4d7f45d1cf-69e258509c3mr1081427a12.30.1784137139761; Wed, 15 Jul 2026
 10:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713220932.413004-1-amir73il@gmail.com> <20260713220932.413004-3-amir73il@gmail.com>
 <87wluw2qeh.fsf@wotan.olymp>
In-Reply-To: <87wluw2qeh.fsf@wotan.olymp>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 15 Jul 2026 19:38:47 +0200
X-Gm-Features: AUfX_mwT5l6TgDp1jG6EPPCXg1XNmSFu-XYbyBVG_YWIduC-MldJ6mRLfVzhDAQ
Message-ID: <CAOQ4uxjzAXgBaggRNJxcEn39LY4+D6ZVHLqODJ3C6cHnDdkG_g@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests/fuse: add ACL_DONT_CACHE regression test
To: Luis Henriques <luis@igalia.com>
Cc: Christian Brauner <brauner@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 6:01=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> Hi Amir,
>
> On Tue, Jul 14 2026, Amir Goldstein wrote:
>
> > Add a test that reproduces the stale ACL bug fixed by:
> >   "fs: preserve ACL_DONT_CACHE state in forget_cached_acl()"
> >
> > A FUSE mount that does not negotiate FUSE_POSIX_ACL initialises inodes
> > with i_acl =3D ACL_DONT_CACHE.  Before the fix, calling
> > forget_all_cached_acls() (e.g. from fuse_update_get_attr() on a
> > statx(AT_STATX_FORCE_SYNC)) would silently replace ACL_DONT_CACHE with
> > ACL_NOT_CACHED, enabling the kernel ACL cache.  A subsequent getxattr
> > would populate the cache, and because fuse_set_acl() skips
> > forget_all_cached_acls() for !fc->posix_acl, later ACL changes were
> > not visible to callers =E2=80=94 getxattr returned stale data.
> >
> > The test mounts a minimal libfuse3 lowlevel filesystem (no
> > FUSE_POSIX_ACL negotiated) and:
> >   1. Issues two getxattrs =E2=80=94 both must reach the daemon, proving
> >      ACL_DONT_CACHE suppresses caching before any trigger.
> >   2. Calls statx(AT_STATX_FORCE_SYNC) to trigger forget_all_cached_acls=
().
> >   3. Issues another getxattr (populates the cache on a buggy kernel).
> >   4. Switches the daemon to a different-sized ACL (ACL_B).
> >   5. Issues a final getxattr =E2=80=94 expects ACL_B (44 bytes) and dae=
mon
> >      call count 4; a buggy kernel returns stale ACL_A (28 bytes).
>
> A question: in my own tests I have been following a different approach,
> where the filesystem is mounted from a shell script that does the actual
> testing.  I wonder if you think your approach (i.e. writing the actual
> test in C, using the kselftest macros) is the preferred one.

I always prefer a standalone C program for a selftest.
For fstests naturally the tests are done by the shell scripts,
so it really depends.

>
> Anyway, the test looks good to me, and I just have a few minor comments
> below.
>
> > fuse_acl_cache_test is only built when libfuse3 is detected via
> > pkg-config.
>
> Yeah, I've sent a patch recently converting the only existing test to als=
o
> user fuse3 instead.  Not sure that's acceptable though, since there's a
> chance of breaking some CI.

I mean if the test is not built it wont run, so I don't know why CI would f=
ail.
Obviously some systems do not have libfuse. That's fine by me
not everyone needs to run all the tests.

Thanks for the review!
Amir.

>
> > Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> > ---
> >  .../selftests/filesystems/fuse/Makefile       |  10 +
> >  .../filesystems/fuse/fuse_acl_cache_test.c    | 348 ++++++++++++++++++
> >  2 files changed, 358 insertions(+)
> >  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_acl_c=
ache_test.c
> >
> > diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/=
testing/selftests/filesystems/fuse/Makefile
> > index 612aad69a93aa..f471414842750 100644
> > --- a/tools/testing/selftests/filesystems/fuse/Makefile
> > +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> > @@ -5,6 +5,13 @@ CFLAGS +=3D -Wall -O2 -g $(KHDR_INCLUDES)
> >  TEST_GEN_PROGS :=3D fusectl_test
> >  TEST_GEN_FILES :=3D fuse_mnt
> >
> > +# fuse_acl_cache_test requires libfuse3; add it only when the library =
is present.
> > +ACL_CFLAGS :=3D $(shell pkg-config fuse3 --cflags 2>/dev/null)
> > +ACL_LDLIBS :=3D $(shell pkg-config fuse3 --libs 2>/dev/null)
> > +ifneq ($(ACL_CFLAGS),)
> > +TEST_GEN_PROGS +=3D fuse_acl_cache_test
> > +endif
> > +
> >  include ../../lib.mk
> >
> >  VAR_CFLAGS :=3D $(shell pkg-config fuse --cflags 2>/dev/null)
> > @@ -19,3 +26,6 @@ endif
> >
> >  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
> >  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
> > +
> > +$(OUTPUT)/fuse_acl_cache_test: CFLAGS +=3D $(ACL_CFLAGS)
> > +$(OUTPUT)/fuse_acl_cache_test: LDLIBS +=3D $(ACL_LDLIBS)
> > diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_te=
st.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> > new file mode 100644
> > index 0000000000000..b2e5db8555040
> > --- /dev/null
> > +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> > @@ -0,0 +1,348 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Test: FUSE ACL caching bug triggered by AT_STATX_FORCE_SYNC
> > + *
> > + * A FUSE mount that does not negotiate FUSE_POSIX_ACL initialises eve=
ry inode
> > + * with i_acl =3D i_default_acl =3D ACL_DONT_CACHE.  When a fresh stat=
 is needed
> > + * (e.g. AT_STATX_FORCE_SYNC), fuse_update_get_attr() calls
> > + * forget_all_cached_acls() before issuing FUSE_GETATTR.  On an unfixe=
d kernel,
> > + * __forget_cached_acl() replaces ACL_DONT_CACHE with ACL_NOT_CACHED,
> > + * inadvertently enabling the kernel ACL cache for that inode.  The ne=
xt
> > + * getxattr populates the cache.  Because fuse_set_acl() skips
> > + * forget_all_cached_acls() for !fc->posix_acl mounts, any subsequent =
change to
> > + * the ACL leaves the stale kernel entry in place, and the next getxat=
tr returns
> > + * wrong data without ever reaching the FUSE daemon.
> > + *
> > + * Fix (fs/posix_acl.c): __forget_cached_acl() returns early when *p i=
s
> > + * ACL_DONT_CACHE, preserving the "never cache" invariant for the inod=
e's
> > + * lifetime.
> > + *
> > + * Test outline:
> > + *  1. Mount a minimal FUSE fs (no FUSE_POSIX_ACL negotiated).
> > + *  2. lgetxattr -> daemon called, ACL_A returned, NOT cached (ACL_DON=
T_CACHE).
> > + *  3. statx(AT_STATX_FORCE_SYNC) -> forget_all_cached_acls() called.
> > + *     Buggy:  ACL_DONT_CACHE -> ACL_NOT_CACHED (cache enabled).
> > + *     Fixed:  ACL_DONT_CACHE preserved.
> > + *  4. lgetxattr -> daemon called, ACL_A returned.
> > + *     Buggy:  result now cached (ACL_NOT_CACHED -> cached).
> > + *     Fixed:  result still not cached.
> > + *  5. Daemon switches to ACL_B internally (different size).
> > + *  6. lgetxattr -> should return ACL_B (44 bytes).
> > + *     Buggy:  cache hit, returns stale ACL_A (28 bytes). FAIL.
> > + *     Fixed:  no cache, daemon called, returns ACL_B (44 bytes). PASS=
.
> > + */
> > +
> > +#define _GNU_SOURCE
> > +#include <errno.h>
> > +#include <fcntl.h>
> > +#include <linux/limits.h>
> > +#include <pthread.h>
> > +#include <stdint.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <sys/stat.h>
> > +#include <sys/syscall.h>
> > +#include <sys/xattr.h>
> > +#include <unistd.h>
> > +
> > +#define FUSE_USE_VERSION 31
> > +#include <fuse_lowlevel.h>
> > +
> > +#include "kselftest_harness.h"
> > +
> > +/* ---- ACL binary encoding ------------------------------------------=
------ */
> > +/*
> > + * POSIX ACL v2 xattr format (little-endian):
> > + *   header: u32 version (=3D 0x00000002)
> > + *   entry:  u16 tag | u16 perm | u32 id
> > + *
> > + * Entries must appear in tag-ascending order; named USER/GROUP entrie=
s
> > + * require a MASK entry.  Both ACLs pass posix_acl_from_xattr() valida=
tion.
> > + */
> > +
> > +/* ACL_A: 3 entries (USER_OBJ:rwx, GROUP_OBJ:r-x, OTHER:r-x) =3D 28 by=
tes */
> > +static const uint8_t acl_a[] =3D {
> > +     0x02, 0x00, 0x00, 0x00,                         /* v2 header     =
 */
> > +     0x01, 0x00, 0x07, 0x00, 0xff, 0xff, 0xff, 0xff, /* USER_OBJ  rwx =
 */
> > +     0x04, 0x00, 0x05, 0x00, 0xff, 0xff, 0xff, 0xff, /* GROUP_OBJ r-x =
 */
> > +     0x20, 0x00, 0x05, 0x00, 0xff, 0xff, 0xff, 0xff, /* OTHER     r-x =
 */
> > +};
>
> Wouldn't it be OK to add a dependency on libacl to make this more
> readable?
>
> >
> > +
> > +/*
> > + * ACL_B: 5 entries =E2=80=94 adds USER uid=3D1 and MASK =3D 44 bytes.
> > + * A named USER entry requires a MASK; all tags in ascending order.
> > + */
> > +static const uint8_t acl_b[] =3D {
> > +     0x02, 0x00, 0x00, 0x00,                         /* v2 header     =
  */
> > +     0x01, 0x00, 0x07, 0x00, 0xff, 0xff, 0xff, 0xff, /* USER_OBJ   rwx=
  */
> > +     0x02, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x00, /* USER uid=3D1 r=
wx  */
> > +     0x04, 0x00, 0x05, 0x00, 0xff, 0xff, 0xff, 0xff, /* GROUP_OBJ  r-x=
  */
> > +     0x10, 0x00, 0x07, 0x00, 0xff, 0xff, 0xff, 0xff, /* MASK       rwx=
  */
> > +     0x20, 0x00, 0x05, 0x00, 0xff, 0xff, 0xff, 0xff, /* OTHER      r-x=
  */
> > +};
> > +
> > +/* ---- Shared state (daemon thread <-> test thread) -----------------=
------ */
> > +
> > +#define FILE_INO  2
> > +#define FILE_NAME "testfile"
> > +
> > +struct daemon_state {
> > +     pthread_mutex_t lock;
> > +     const uint8_t  *acl;
> > +     size_t          acl_size;
> > +     int             getxattr_count;
> > +};
> > +
> > +/*
> > + * Global: callbacks are stateless fns so we use a single global.
> > + * Safe because only one test instance runs at a time.
> > + */
> > +static struct daemon_state g_ds =3D {
> > +     .lock =3D PTHREAD_MUTEX_INITIALIZER,
> > +};
> > +
> > +/* ---- FUSE lowlevel callbacks --------------------------------------=
------ */
> > +
> > +static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *n=
ame)
> > +{
> > +     if (parent !=3D FUSE_ROOT_ID || strcmp(name, FILE_NAME)) {
> > +             fuse_reply_err(req, ENOENT);
> > +             return;
> > +     }
> > +     struct fuse_entry_param e =3D {};
> > +
> > +     /*
> > +      * Long attr/entry timeouts so that normal stat() calls do not
> > +      * expire and trigger forget_all_cached_acls() on their own;
> > +      * only the explicit AT_STATX_FORCE_SYNC should trigger it.
> > +      */
> > +     e.ino             =3D FILE_INO;
> > +     e.generation      =3D 1;
> > +     e.attr_timeout    =3D 10.0;
> > +     e.entry_timeout   =3D 10.0;
> > +     e.attr.st_ino     =3D FILE_INO;
> > +     e.attr.st_mode    =3D S_IFREG | 0644;
> > +     e.attr.st_nlink   =3D 1;
> > +     fuse_reply_entry(req, &e);
> > +}
> > +
> > +static void fs_getattr(fuse_req_t req, fuse_ino_t ino,
> > +                    struct fuse_file_info *fi)
> > +{
> > +     struct stat st =3D {};
> > +
> > +     (void)fi;
> > +     if (ino =3D=3D FUSE_ROOT_ID) {
> > +             st.st_ino   =3D FUSE_ROOT_ID;
> > +             st.st_mode  =3D S_IFDIR | 0755;
> > +             st.st_nlink =3D 2;
> > +     } else if (ino =3D=3D FILE_INO) {
> > +             st.st_ino   =3D FILE_INO;
> > +             st.st_mode  =3D S_IFREG | 0644;
> > +             st.st_nlink =3D 1;
> > +     } else {
> > +             fuse_reply_err(req, ENOENT);
> > +             return;
> > +     }
> > +     fuse_reply_attr(req, &st, 10);
> > +}
> > +
> > +static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char *na=
me,
> > +                     size_t size)
> > +{
> > +     if (ino !=3D FILE_INO ||
> > +         strcmp(name, "system.posix_acl_access") !=3D 0) {
> > +             fuse_reply_err(req, ENODATA);
> > +             return;
> > +     }
> > +
> > +     pthread_mutex_lock(&g_ds.lock);
> > +     const uint8_t *acl      =3D g_ds.acl;
> > +     size_t         acl_size =3D g_ds.acl_size;
> > +     g_ds.getxattr_count++;
> > +     pthread_mutex_unlock(&g_ds.lock);
> > +
> > +     if (size =3D=3D 0)
> > +             fuse_reply_xattr(req, acl_size);
> > +     else if (size < acl_size)
> > +             fuse_reply_err(req, ERANGE);
> > +     else
> > +             fuse_reply_buf(req, (const char *)acl, acl_size);
> > +}
> > +
> > +static const struct fuse_lowlevel_ops fs_ops =3D {
> > +     .lookup   =3D fs_lookup,
> > +     .getattr  =3D fs_getattr,
> > +     .getxattr =3D fs_getxattr,
> > +};
> > +
> > +/* ---- Daemon thread ------------------------------------------------=
------- */
> > +
> > +static void *run_daemon(void *arg)
> > +{
> > +     fuse_session_loop((struct fuse_session *)arg);
> > +     return NULL;
> > +}
> > +
> > +/* ---- kselftest harness --------------------------------------------=
------- */
> > +
> > +FIXTURE(acl_cache) {
> > +     struct fuse_session *se;
> > +     char                 mountpoint[PATH_MAX];
> > +     char                 file_path[PATH_MAX];
> > +     pthread_t            thread;
> > +};
> > +
> > +FIXTURE_SETUP(acl_cache)
> > +{
> > +     char *fuse_argv[] =3D { "fuse_acl_cache_test", NULL };
> > +     struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
> > +
> > +     g_ds.acl            =3D acl_a;
> > +     g_ds.acl_size       =3D sizeof(acl_a);
> > +     g_ds.getxattr_count =3D 0;
> > +
> > +     strcpy(self->mountpoint, "/tmp/acl_cache_test_XXXXXX");
> > +     if (!mkdtemp(self->mountpoint))
> > +             SKIP(return, "mkdtemp: %s", strerror(errno));
> > +
> > +     snprintf(self->file_path, sizeof(self->file_path),
> > +              "%s/" FILE_NAME, self->mountpoint);
> > +
> > +     self->se =3D fuse_session_new(&args, &fs_ops, sizeof(fs_ops), NUL=
L);
> > +     if (!self->se) {
> > +             rmdir(self->mountpoint);
> > +             SKIP(return, "fuse_session_new failed");
> > +     }
> > +
> > +     if (fuse_session_mount(self->se, self->mountpoint)) {
> > +             fuse_session_destroy(self->se);
> > +             rmdir(self->mountpoint);
> > +             SKIP(return, "fuse_session_mount failed "
> > +                          "(missing fusermount3 or insufficient privil=
eges)");
> > +     }
> > +
> > +     if (pthread_create(&self->thread, NULL, run_daemon, self->se)) {
> > +             fuse_session_unmount(self->se);
> > +             fuse_session_destroy(self->se);
> > +             rmdir(self->mountpoint);
> > +             SKIP(return, "pthread_create: %s", strerror(errno));
> > +     }
> > +
> > +     fuse_opt_free_args(&args);
> > +}
> > +
> > +FIXTURE_TEARDOWN(acl_cache)
> > +{
> > +     fuse_session_exit(self->se);
> > +     fuse_session_unmount(self->se);
> > +     pthread_join(self->thread, NULL);
> > +     fuse_session_destroy(self->se);
> > +     rmdir(self->mountpoint);
> > +}
> > +
> > +static int do_force_statx(const char *path)
> > +{
> > +     struct statx stx;
> > +
> > +     return syscall(SYS_statx, AT_FDCWD, path,
> > +                    AT_STATX_FORCE_SYNC, STATX_BASIC_STATS, &stx);
> > +}
> > +
> > +TEST_F(acl_cache, stale_after_force_sync)
> > +{
> > +     char    buf[512];
> > +     ssize_t sz;
> > +     int     count;
> > +
> > +     /*
> > +      * Step 1: two getxattr calls before any statx(FORCE_SYNC).
> > +      * i_acl =3D=3D ACL_DONT_CACHE.  __get_acl's cmpxchg(p, ACL_NOT_C=
ACHED,
> > +      * sentinel) finds *p !=3D ACL_NOT_CACHED on every call, so the s=
entinel
> > +      * is never placed and the result is never cached.  Both calls mu=
st
> > +      * reach the daemon, proving ACL_DONT_CACHE suppresses caching.
> > +      */
> > +     sz =3D lgetxattr(self->file_path, "system.posix_acl_access",
> > +                    buf, sizeof(buf));
> > +     ASSERT_EQ(sz, (ssize_t)sizeof(acl_a));
> > +
> > +     sz =3D lgetxattr(self->file_path, "system.posix_acl_access",
> > +                    buf, sizeof(buf));
> > +     ASSERT_EQ(sz, (ssize_t)sizeof(acl_a));
> > +
> > +     pthread_mutex_lock(&g_ds.lock);
> > +     count =3D g_ds.getxattr_count;
> > +     pthread_mutex_unlock(&g_ds.lock);
> > +
> > +     ASSERT_EQ(count, 2);
> > +     TH_LOG("step 1 OK: both pre-trigger getxattrs reached daemon (cou=
nt=3D%d), "
> > +            "ACL_DONT_CACHE is working", count);
> > +
> > +     /*
> > +      * Step 2: statx(AT_STATX_FORCE_SYNC).
> > +      * fuse_update_get_attr() calls forget_all_cached_acls() before s=
ending
> > +      * FUSE_GETATTR.
> > +      *   Buggy kernel:  ACL_DONT_CACHE -> ACL_NOT_CACHED  (cache enab=
led)
> > +      *   Fixed kernel:  ACL_DONT_CACHE preserved           (no effect=
)
> > +      */
> > +     ASSERT_EQ(do_force_statx(self->file_path), 0);
>
> Why not calling statx(2) instead?  Are you using a libc that doesn't
> include a wrapper?
>
> (Also, I wonder if having the global state protected with a mutex is
> really needed in the scope of this test... but yeah, that's the correct
> thing to do, of course.)
>
> Cheers,
> --
> Lu=C3=ADs
>
> >
> > +     TH_LOG("step 2 OK: statx(AT_STATX_FORCE_SYNC) succeeded");
> > +
> > +     /*
> > +      * Step 3: getxattr =E2=80=94 cache population attempt after the =
trigger.
> > +      *   Buggy:  *p =3D=3D ACL_NOT_CACHED -> sentinel placed -> fuse_=
get_inode_acl
> > +      *           called -> ACL_A parsed and stored in the kernel cach=
e.
> > +      *   Fixed:  *p =3D=3D ACL_DONT_CACHE -> sentinel placement skipp=
ed ->
> > +      *           fuse_get_inode_acl called but result not cached.
> > +      * Either way the correct ACL_A is returned here.
> > +      */
> > +     sz =3D lgetxattr(self->file_path, "system.posix_acl_access",
> > +                    buf, sizeof(buf));
> > +     ASSERT_EQ(sz, (ssize_t)sizeof(acl_a));
> > +
> > +     pthread_mutex_lock(&g_ds.lock);
> > +     count =3D g_ds.getxattr_count;
> > +     pthread_mutex_unlock(&g_ds.lock);
> > +
> > +     ASSERT_EQ(count, 3);
> > +     TH_LOG("step 3 OK: post-trigger getxattr reached daemon (count=3D=
%d), "
> > +            "returned correct ACL_A (%zd bytes)", count, sz);
> > +
> > +     /*
> > +      * Step 4: switch daemon to ACL_B (different size: 44 vs 28 bytes=
).
> > +      * Simulates an ACL change that fuse_set_acl() would NOT invalida=
te for
> > +      * !fc->posix_acl mounts (it skips forget_all_cached_acls in that=
 case).
> > +      * On a fixed kernel the ACL was never cached, so this is moot.
> > +      */
> > +     pthread_mutex_lock(&g_ds.lock);
> > +     g_ds.acl      =3D acl_b;
> > +     g_ds.acl_size =3D sizeof(acl_b);
> > +     pthread_mutex_unlock(&g_ds.lock);
> > +     TH_LOG("step 4: daemon switched to ACL_B (%zu bytes)", sizeof(acl=
_b));
> > +
> > +     /*
> > +      * Step 5: getxattr =E2=80=94 the decisive check.
> > +      *   Buggy kernel:  cache hit -> stale ACL_A (28 bytes), count st=
ays 3.
> > +      *   Fixed kernel:  no cache -> daemon called -> ACL_B (44 bytes)=
, count 4.
> > +      */
> > +     sz =3D lgetxattr(self->file_path, "system.posix_acl_access",
> > +                    buf, sizeof(buf));
> > +
> > +     pthread_mutex_lock(&g_ds.lock);
> > +     count =3D g_ds.getxattr_count;
> > +     pthread_mutex_unlock(&g_ds.lock);
> > +
> > +     if (sz =3D=3D (ssize_t)sizeof(acl_a))
> > +             TH_LOG("step 5 BUG: stale ACL_A (%zd bytes) from kernel c=
ache "
> > +                    "(count=3D%d); ACL_DONT_CACHE corrupted by "
> > +                    "forget_all_cached_acls()", sz, count);
> > +     else
> > +             TH_LOG("step 5 OK: daemon reached (count=3D%d), "
> > +                    "fresh ACL_B (%zd bytes)", count, sz);
> > +
> > +     EXPECT_EQ(sz, (ssize_t)sizeof(acl_b));
> > +     EXPECT_EQ(count, 4);
> > +}
> > +
> > +TEST_HARNESS_MAIN
> > --
> > 2.54.0
> >
>
