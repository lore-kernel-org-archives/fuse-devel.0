Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E335C368D55
	for <fuse-devel@lists.linux.dev>; Sat,  5 Sep 2026 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616775; cv=pass; b=J11RKXktZHN84naxBJd/6ndtAIPpKBvOHJR2Vf+y6l+ufl45V2B62VsXlJw0JE9PO/cMPqNCv18DthFy2l/6AJNWzzFERoe24ChYe+8xbUkuuaEPzlLHnPhe1xVZ/10/Tn3bIWuQCn1rgMRBYxNFIJ2ToQLxxgCQqinUcXQJc+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616775; c=relaxed/simple;
	bh=0NZgvcjxD//y9TcBVnzxsrfCCQmI3Ud37a8Ni4R+RGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIkJ3UR5mJgB9dL/jZj0Y0DSfZdMzAx0DCXRZkA444kB0r+HzZy8ioSo3FTZNcf8EREoKoFBmJ8rlb7sA3sSIFLfL9s66ZRlrSih6DCIeRzb+0I/KGM8x1Hbu0jsgecDPNQkUEuB2f8CLT3KTo6mObx7mMJBE0yar4BOXhmKw+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmsVgBt/; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmsVgBt/"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3004676a12.2
        for <fuse-devel@lists.linux.dev>; Sat, 05 Sep 2026 06:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788616772; cv=none;
        d=google.com; s=arc-20260327;
        b=SZm3chNsmnC4F8z+/9QXAPXJBDNMpyBZTZHRroR58NU54SAr590m+oTYF3BLbsSYkL
         eQxoHjgfUUjJ1abwbFZh1So/CUOaN+BTnO2xsxSY2wb/aAifCJDFWzeeuCVtBCqs+PbR
         oOgmgC+IMfF8wk+rVWLNjlC4IDELTK+944tid0Mqa1g6fVISXTdOMG4uTjk6ITGmVl0+
         OXfwU+lYad8feFksOSJ5YGF7tWvkjSHGCQE9CsJUr4QfZ7vlYsJ2SyTj2QUJlIsNh0gR
         WKsH/AmO1O5ipXYFRgCfiyO6gbBhcBR+Kb/2onrFAqx2cYMsMwr28ruRd0sFCRuzlEDn
         lHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iWHfzIxXlwPck3mW+IxFV0BJz5vdTVjdjrFzdDbobSI=;
        fh=X6wwTQlsEGFvmyeJDj0iMBlixA38Gsx9v2n+o6p56Hc=;
        b=kJ+pVoadoMp40BWoz9opv4fxmoADHPsd6Arc+7kygpzW0dyEBvtdZ5v4F/K8XPYYEe
         1K7PBOBp/ROFWS7njmnz8W/TdbCuIZIlLLU35bPm2Gu1rUVVqLEVQC7yCkY/SC3qJ22d
         gEQdDA7YybL6wx2RZgHqbgtDSffhgSsJAf24KyJr1Xou0PPZWcpqFxpWuBDY4hEvv5Pt
         mt2B75jC1XVDy9YWe06iCNy3zSh0bOf+BrVMF2rQZNRK0oALfNdJsSKysAgeBABsf9oM
         eols6hieOqBQ5c0IDzZ6uDwKrKBspPAV19BIwrSLNMo06bD1So16z4dz2DSSodtBCZ/H
         NePw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616772; x=1789221572; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iWHfzIxXlwPck3mW+IxFV0BJz5vdTVjdjrFzdDbobSI=;
        b=BmsVgBt/oOWl0KTjSgqygp1LPzACD4ut4Ip2LGn1RsJvLA4oyyHBDNR/0pQBYtRLVc
         ETslKke1/dEKCdfZE/i6gcXkB313fOVqxn6g1ladABSan/gC7OS3UOcLxc1JwkIl3K7e
         ORqvgxUhA1ujZuZox5C9rSjncd5zyJWh+mWekSuM0ObSctbdPQPi7hkVYx9QKYzCgaTN
         vv8pENJXwxOI65By/JnN3eECFiwUSc2Ie3HryMhSSv56UoByDf0N+7fBFqFWjNqfQdId
         86JGQeR0fbpkjTbUAuvq4q6e774y0DrSzop4IOIyhzuDYUMupA59/uMDB8jd42HpHyht
         tuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616772; x=1789221572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWHfzIxXlwPck3mW+IxFV0BJz5vdTVjdjrFzdDbobSI=;
        b=NUgF4pwgQpXecbsNAlwFb229A9l2lSJFPTPNx0iLrDNjEdCzDEpx96qTdo4Om32Vnc
         KhLijUBIAaRT/fK3zz0VV48kztLYCqfktlZEubq8yrdzTYnKehn1RehiwRqTWnwriSPQ
         06yDkg9eVv3vdTjSt0aV9EO6TvLzhZceu6YMtvK0/16Dnvq+F9iC4A1CLTA2JB0eL/R+
         0/MXtCvJpeb7v+sGUW00BuWLOm541pcnIDDNQJZlZAIrKKB8qnVHywD98pyA8aGnb8J8
         FvoVXHYWN+Kq44JcT81D63KD5PxCPARsPFE1v5YSvg1kisKOD/AihDmyr3vCL+noVhxj
         Oz9w==
X-Forwarded-Encrypted: i=1; AKwUvBzfFp2ZEEwxBmCxX4aqd691UE/N3T8WpQ+MlPf57ymEtO9/vdS50sXc1fGxAcvApf1HJ3QemDG9PwIV@lists.linux.dev
X-Gm-Message-State: AFuF++m1SiPIvjy0/LtGkJwvQoEFMsRVG5NQycB62fJo8H6STB2Hmk8v
	GqUinbMNy7d354nkpKTeQhoGhWC7KC+/UdfG2vMx3vI+ceAJs2ngr5Yxnawa76tOv1jcAzJEl6V
	p6Q2gg77Zo+Ky1eWsT+CIzXVMSfZdiMM=
X-Gm-Gg: AYBFou3/UfpoKhjqEzhLnQT02C+OkUdctW10YYVN0v/FnfABe7lNFGXvI4zcP0r1Lzr
	jnSkcxByYHzbrUHQW4FMlqXhjky9q866GLH1XmvupsEgRzlAcwwOAz5sSlsHn03SCJ5cuiKovqB
	QE5aIZZP6YBZVLHUWi/SSISCNa/cDHxhPOrH2Sa9oZ3lW4NjdO2ckAxttKJDyJaVMZ4wHsCZmN5
	XqRzUkUcEzbt9y1INc/5fuWNLaUFh/RJ2Wq/dWcexiauQcwVRFKtQjA7VKIvrWFXxSpnomOxE0H
	sQUzzH2V1dWkqZ1E1CZMJCeZqII1Tgut+djHuCZQkysYoQ==
X-Received: by 2002:a05:6402:4343:b0:6a7:ea53:f624 with SMTP id
 4fb4d7f45d1cf-6a7ea540b3dmr3578271a12.35.1788616771728; Sat, 05 Sep 2026
 06:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-4-luis@igalia.com>
In-Reply-To: <20260904103920.4471-4-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 15:59:20 +0200
X-Gm-Features: AcwNN1W2vMf-WzY4zwsWBAU_vcsCDCHvVaEThEDUXBh2gwCNW5IHuyRc5r8QctI
Message-ID: <CAOQ4uxjCFCS=V5SLH7QT0q1VmJUKKVkWMSgd9DAtdM9U=a_EWw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/8] selftests/fuse: check that fusectlfs is mounted
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
> The control filesystem for FUSE needs to be mounted for the fusectl_test =
to
> be successfully run.  Skip the test is that is not the case.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  tools/testing/selftests/filesystems/fuse/fusectl_test.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/fusectl_test.c b/to=
ols/testing/selftests/filesystems/fuse/fusectl_test.c
> index 0d1d012c35ed..b828173c01bd 100644
> --- a/tools/testing/selftests/filesystems/fuse/fusectl_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fusectl_test.c
> @@ -106,8 +106,15 @@ TEST_F(fusectl, abort)
>         char path_buf[PATH_MAX];
>         int abort_fd, test_fd, ret;
>
> -       sprintf(path_buf, "/sys/fs/fuse/connections/%d/abort", self->conn=
ection);
> +       snprintf(path_buf, PATH_MAX, "%s/%d", FUSECTL_MOUNTPOINT,
> +                self->connection);
> +       if (access(path_buf, F_OK) !=3D 0)
> +               SKIP(return,
> +                    "fusectl doesn't seem to be mounted: %s",
> +                    strerror(errno));
>
> +       snprintf(path_buf, PATH_MAX, "%s/%d/abort", FUSECTL_MOUNTPOINT,
> +                self->connection);
>         ASSERT_EQ(0, access(path_buf, F_OK));
>
>         abort_fd =3D open(path_buf, O_WRONLY);
