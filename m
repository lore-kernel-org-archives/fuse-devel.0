Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438903126D6
	for <fuse-devel@lists.linux.dev>; Sat,  5 Sep 2026 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616884; cv=pass; b=dlM/Db0vw7ENnDEFVuutapVJXWJ3eONTie3Ojd6dPNSLiK4/+MO6ZRtp/sLgBHXuc79COZiEOmRBphW7+LG3bslj+dqsMe11GRwgOid6pGWTT/24gJJK4blPEQjpmtQtqCXYH/7fmZ6XmmPMbh+rqFU14peKd2a1ioT1X33AYvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616884; c=relaxed/simple;
	bh=M7fAdXtBDfEORDW145jXu6v4iUab4x+K54eSd0w9thQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESqWGQjmxaThJieZCY0UkQmpV0HoId136pDz4cYOw7sIXLGS4x2g62UL9uPmR4UVFC2I3XrTChLHdIcjIm2gw8+Jz8ZwArU7FMT9nF5BBfxis1OtTqqqIaxVtb0BR21jurOlHgoP6UJ3vJhVQfl1gQs9YF02Ocq/m2l5dtZKcZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EktEAPBi; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EktEAPBi"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a68ca482e2so2679330a12.0
        for <fuse-devel@lists.linux.dev>; Sat, 05 Sep 2026 07:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788616870; cv=none;
        d=google.com; s=arc-20260327;
        b=SY869HKMCNBtxe/ntXAUl+29qvBaGwQrgiuxpv+7aEiczUlIdAJ/09lGoIvc3oJWUa
         NuFXQvghH7baDzHqww1gHJdF+PHp+OMmvtKWtYUmFhW8p6JxVII0GcQ4L+aAPPrPDqWI
         767nVVTP47o7DRjIkal5HdLn5LGSX/+U/v+m7QrNMsnjOhYlwo/wnih9RdpVh+UovB0t
         Qo5aq3HwhZ0FXVfDzbJaK3rnJpXth5wXXvCv9QqDejFNTxFA9jcaZEnxgoJBTrrtEgyg
         OrLNl6uBtx0Tvr2RsygJQ/MEKwa9ppdJV4S8Ab/xfVssqmM8ekyHc76olVYpD0IPcSTA
         bZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I+I8QUj3WVciHxoRXxP9OcDrC3AowirtGwOcl3KlFtc=;
        fh=q2fBeBKHxSN0JkAxs1LxvIv3sqAdpe9T2VIK2r+30qc=;
        b=V7tKwtahFAslE3mL/GBbE2Qz4uZFk0m+5uXKv++JVMuLXyiNApsUZ+vuDoX52buzTu
         OsahmsJnBETSW8yI40eCZ18BMr1SXiBs497x1xmYDKUW/9fdQERUlDzQNkylP+Z6K+G5
         LLvaN506avGZ3WX9mJYYFA3S/EL05KoWLGqO/lpWRhDIFDLx9ydPFQ6krvfHkhDeFHql
         AVCoE9nfjUF73SMtv6wPrJ0RPgL/Fm9lRfEl9RvwvQmZ5VXksr3ZqOWRrFzQmkMQHyH9
         yCyZvOKjkhH2+oQqto0BLGSsGoZf8wmJCdgI8STPofXmFW/x/bzICZc5ExQm3qP/XUTS
         V/rA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616870; x=1789221670; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I+I8QUj3WVciHxoRXxP9OcDrC3AowirtGwOcl3KlFtc=;
        b=EktEAPBiuDBcyMbeFPw9odFnpDHF12jRhOfm0PCIru5u66s2JMeLdELtp/FNKjx4Wk
         pDyoNUg1s/ht1ryNYn1EWyXMw16qwhWaIc4vUNr4ifQ6SscZoir5xIuTiijTZhPKMHuZ
         3yhOA1QWACmboJBE8Qz87+zia+1+ZCnlQddwXWFN/KOslGFWVLT49fJWo85k1fq+oGKj
         VdxM+7KP2HKclYw1iXy8fvIrw67vU8b1MV6Y8FfZRmTUG4qnvUDA9uxlPBwrdFBmWMcI
         oP7RVX/mEdpmw4dz+/sE/XjfqPuBUD2yEDHI8sjuo7YhPPflI61f1/lWizFPZ9mS/YZ6
         Jt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616870; x=1789221670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I+I8QUj3WVciHxoRXxP9OcDrC3AowirtGwOcl3KlFtc=;
        b=CLml+kbJLrIHHVi4Dq7th1owCEPbn/q+PuZxDT2vVs0/d0J8aNpOT8D49Y/crEmY19
         0Bsv2WcdlrtSIy6AHl/q1GOACeVbbR7Rhk3MNAIoDnMG3YsUaPsp/ifKeUP7USb7WDn5
         Wd+wu0ZqD7kdYonN1JxFLkXs/vu6AOANI08esle4+5LiKdzQVMaM4B9+XJUZU0xlbhlv
         c9yQX4bMra0CKRfpaDwFB1dfeQaQ+wuMeZZnnydCgdYR3kLgZfwzRuOEIVetj3p29sK0
         ZZLdnpqqQpAzEu6H2cHfNGMzIRV6h1H47Vl+gXjshhTt8kcJiQkxZWrSGfsaD+NsFO/9
         WDYQ==
X-Forwarded-Encrypted: i=1; AKwUvBypJcXdnw5zFPUwmzyy2TLAjfG1lTM3vQrOEkT2IrwhRNI6Pg4ZAOZ7f9Zn7+Z5lXoEXUGblCgJyVKp@lists.linux.dev
X-Gm-Message-State: AFuF++m7Ey9RIL1xGV665jePd6PQYWwGcGpUAYuPy5DPWWVnnQZ9rl7Q
	mWDWFo4+gS1n6Yzewhe6aR/T17Nyt8oelOAhFYZrkcIfA57CTVrs+6SDH7UFeiCOOI1r0F7couT
	HUWk2mHRgT70gHg9Qz87qXAu8Aw6NI6Y=
X-Gm-Gg: AYBFou2tZ3YRKWF2zR7vm5Ih+XMMctDHMDVdpLWTFfXUjlsb3V25yzZ0kSdmpWR6ru8
	OZoAfQ+Vpfm9RxwWRkXyqBXurZAb/h5xzLJr7sjKJadfgrQfQqxx949etW94quwWc3AmcjsaeeR
	2fiUnf0Ml6tVhcfTiU49blVWGJXNxvrI9JXRY0H3bsiIwlszoz+N83fCuRHUuTRG0LHwNMZ0A/a
	GTfhLH12zjYqIGUVYqtGT/7cToGwHYFIep/soqXV7bZoOcHh/Mzu9hVWjj2Y7kh2onACF/XUkkA
	GIJEu8oYPXuzlzuTpRRSrFYx0Bj5K5ZS71t2jCy/+/ilYw==
X-Received: by 2002:a05:6402:3220:b0:6a6:3ee3:655a with SMTP id
 4fb4d7f45d1cf-6a7e8d368f2mr9247527a12.3.1788616869820; Sat, 05 Sep 2026
 07:01:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-6-luis@igalia.com>
In-Reply-To: <20260904103920.4471-6-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 16:00:58 +0200
X-Gm-Features: AcwNN1XVifAlKbq_jupyMk4YvbgYjZtTaM8XtGl9N8tec_dpEk5CYKJCab76ZDY
Message-ID: <CAOQ4uxjMvHdaZfwjkHK3tV6ChsapobpHE9mq8NJSvduOGruvMg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/8] selftests/fuse: use dynamically allocated
 memory to store ACLs
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
> Instead of directly using static arrays for the ACL value, allocate memor=
y
> for storing it.  This will make it easier to implement ACL tests that als=
o
> set the xattr dynamically.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  .../filesystems/fuse/fuse_acl_cache_test.c    | 32 ++++++++++++++++---
>  1 file changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test=
.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> index 12cbf9753d03..c2d6658ff7de 100644
> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> @@ -80,7 +80,7 @@ static const uint8_t acl_b[] =3D {
>
>  struct daemon_state {
>         pthread_mutex_t lock;
> -       const uint8_t  *acl;
> +       uint8_t        *acl;
>         size_t          acl_size;
>         int             getxattr_count;
>  };
> @@ -142,15 +142,26 @@ static void fs_getattr(fuse_req_t req, fuse_ino_t i=
no,
>  static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name=
,
>                         size_t size)
>  {
> +       uint8_t *acl =3D NULL;
> +       size_t acl_size;
> +
>         if (ino !=3D FILE_INO ||
>             strcmp(name, "system.posix_acl_access") !=3D 0) {
>                 fuse_reply_err(req, ENODATA);
>                 return;
>         }
>
> +       if (size) {
> +               acl =3D malloc(size);
> +               if (!acl) {
> +                       fuse_reply_err(req, ENOMEM);
> +                       return;
> +               }
> +       }
>         pthread_mutex_lock(&g_ds.lock);
> -       const uint8_t *acl      =3D g_ds.acl;
> -       size_t         acl_size =3D g_ds.acl_size;
> +       acl_size =3D g_ds.acl_size;
> +       if (acl && (size >=3D acl_size))
> +               memcpy(acl, g_ds.acl, acl_size);
>         g_ds.getxattr_count++;
>         pthread_mutex_unlock(&g_ds.lock);
>
> @@ -160,6 +171,8 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t in=
o, const char *name,
>                 fuse_reply_err(req, ERANGE);
>         else
>                 fuse_reply_buf(req, (const char *)acl, acl_size);
> +
> +       free(acl);
>  }
>
>  static const struct fuse_lowlevel_ops fs_ops =3D {
> @@ -181,8 +194,10 @@ FIXTURE_SETUP(acl_cache)
>  {
>         char err[MAX_ERR_MSG];
>
> -       g_ds.acl =3D acl_a;
>         g_ds.acl_size =3D sizeof(acl_a);
> +       g_ds.acl =3D malloc(g_ds.acl_size);
> +       ASSERT_NE(g_ds.acl, NULL);
> +       memcpy(g_ds.acl, acl_a, g_ds.acl_size);
>         g_ds.getxattr_count =3D 0;
>
>         if (fs_setup(&self->se, self->mountpoint, &fs_ops, &self->thread,=
 err))
> @@ -195,6 +210,7 @@ FIXTURE_SETUP(acl_cache)
>  FIXTURE_TEARDOWN(acl_cache)
>  {
>         fs_teardown(self->se, self->thread, self->mountpoint);
> +       free(g_ds.acl);
>  }
>
>  static int do_force_statx(const char *path)
> @@ -210,6 +226,7 @@ TEST_F(acl_cache, stale_after_force_sync)
>         char    buf[512];
>         ssize_t sz;
>         int     count;
> +       uint8_t *acl;
>
>         /*
>          * Step 1: two getxattr calls before any statx(FORCE_SYNC).
> @@ -270,8 +287,13 @@ TEST_F(acl_cache, stale_after_force_sync)
>          * !fc->posix_acl mounts (it skips forget_all_cached_acls in that=
 case).
>          * On a fixed kernel the ACL was never cached, so this is moot.
>          */
> +       acl =3D malloc(sizeof(acl_b));
> +       ASSERT_NE(acl, NULL);
> +       memcpy(acl, acl_b, sizeof(acl_b));
> +
>         pthread_mutex_lock(&g_ds.lock);
> -       g_ds.acl      =3D acl_b;
> +       free(g_ds.acl);
> +       g_ds.acl      =3D acl;
>         g_ds.acl_size =3D sizeof(acl_b);
>         pthread_mutex_unlock(&g_ds.lock);
>         TH_LOG("step 4: daemon switched to ACL_B (%zu bytes)", sizeof(acl=
_b));
