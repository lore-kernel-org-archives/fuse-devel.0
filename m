Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E4B335555
	for <fuse-devel@lists.linux.dev>; Tue, 21 Jul 2026 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630233; cv=pass; b=bl6ScGYlCv8vIATPTcydfjWudaTaK3qgQn7dqLUFHVfhL86Acr4KFwdC7oQxMdK3iJIa53uwDFVmErL3YQtUctOZ6/4LKKdUBW1q47MB02Y9LM9qL1qOXrXMhIk1X6uvCAeLhfn82njETbBN59WnjTgown6ZOL9wfh6CIyEdEwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630233; c=relaxed/simple;
	bh=oyXeb7Pl/hzEZu/+TWbwy7LD9xPS1dj+pHjiaZVYzs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEkmGVFSOe4XJY3PXDhCY4RvVaRWwiAfplk5HYhRDy6VtOJ5xHNECVu2VK7WvXjux+EzGpsuRRsH/cAtDVN5FcZyKTl5Mxd7K/vZChVp23AWqPgk/Y4+Tu6pcO4xqRgjDPwCxLMTWSbpPccRmDGh54PXQbwktaKh9pxxLKdm93Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPD7+RmU; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPD7+RmU"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1677c91969so732484766b.1
        for <fuse-devel@lists.linux.dev>; Tue, 21 Jul 2026 03:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784630226; cv=none;
        d=google.com; s=arc-20260327;
        b=MZ76y9yDJ4ffyDLKoIMBi3isZNbWUqYiFVyNbT6FHKi4OVG6WRT/93Kkg3/uejLhK1
         9+q6CTI7M2xW3pZuNr7dCnVC8TGucxVJN7WUEmMyBz8s0JWejcnU7JsQzbB9SYj9OSje
         beHloUJL5d6ljAee1nd2VvW+BvZWlYQnQ46ODQpfhu66Jsdp11Dx9Wj0bVTadkbI0ntU
         Vt9iD/Hs+M0evAZrEU5iCOr8/TOzJNbxmQ5sTs2z/qHh/96X5bvrHnFAUO462WYzId0q
         vqiKXnq914vM44T97UdwmNuq/7lf6W+rj293Hem2NhloUp6obPpAqGuHLQVgrb8zYXrA
         /vxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z/e3cVrC8aYr3ehhgb7J6RmkXpl7ImRf/nGNK62se0M=;
        fh=5tz8CnBNkrXiN8F1BGeZsXc09TgRvhh6ThRUslBNbO4=;
        b=LVfmfqMAQckA4Vo12Sq6mWVvYfjv1fE8i3K2xFMvAIMQIbJeYM4S62CrB8v/pcAWXH
         TEC6DZq+C+4irNczhGhe12UtFLR1H6l1kqkC40kmCnyn5gWKQ96xvTlz0t2TK4luE6dG
         cmiqrkly7gxLoAeNySy8E3KwJeUOsBAP1SUHk1iuZbRnxD/WIOWw0dU2qOkl0KlOqYDh
         1qj2d2UTQbv5nsKAMHEA1DeRBEO9NVrd7ObiPy+HuXMiwznL+dzMcNi0mQjBqIRHC1K4
         2wAZhRz+hQ5qynrXceijTvJaJ2p3318xJxIan/YfQR5H2PriTNujqmfm8spizoY8IQmv
         uVag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784630226; x=1785235026; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z/e3cVrC8aYr3ehhgb7J6RmkXpl7ImRf/nGNK62se0M=;
        b=cPD7+RmU5SI+kUNzBDr/BmmDnTdof3t4xYKBZofMllC8IZweLnxg322Yn/BZFyFY3A
         82IvHmpAO0+cHunw2uH5IoFYtLsvu3VRdoUYq5m5amR8JKSf/cBgXqxFsqQ6QuBuOLDR
         RopOypljVuSStX76V3D2ZuGtBldW92Jh8KjEyo5R7P3C6UBsfJ9OU8JN7N7kRbxXBxBY
         jrRw7WKP3CbEvkjG4NzDuawwoXG2XlszznuYUIE3G3O6Pw8kg1eLlvGdOlsdvNcl1b3I
         AP20oQfMoKQ4M7A7yMJk/K3x3wNpDzfRhv8qvHhUcP98WGHIdtowHMYmezeaKlp/dyaC
         TVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630226; x=1785235026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/e3cVrC8aYr3ehhgb7J6RmkXpl7ImRf/nGNK62se0M=;
        b=q28NatftDrv8ygbzE3ZTctC7pT7W9JQtIOLrXgic+0XO08zrBW30yLnTtgwcDus3ty
         PLtk8aisH73/rO3ZpyNZiG09iDun8rsn9o34lUSmG1umrFYunUgIC2+40B+DvmQx7DFe
         IM5ZmMM5fVfs3R3Gs+ZUK9u1UyT6GMMPzorGzRuxWTYME/d5YS8i/Zgk8yTVEoE9+hA8
         /74Bf9HG3dJifYIqP9rEgpqsCOZORXFuyRpb3V1VI3HBaIZaM+LtaqRYRkkSpCDumSwM
         JovWcYjITn04fzsjZVqhF3ehGNO8P46zUhppi4b6V3PpKb4pG8CteiH+KISvchu1l04T
         pW1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrG3lGUX3366IUOlJyLotBZ+TXZ4WkBZV+hTao/G/GpfOSrz7RaU8iwTGkzXEfXcYk8DeOBtM7tVFrJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyFCHamEQRoSMOjhqVZ/m/+n0NmUDtxG9V6VWXFwcBikaD34mEV
	vLDN4PFbLNO2mOIqIPxIg3XbHPWPJU3QxVydr8GtCEhTNPqplq1DYL8LWVN7o+tnQeNqVlm0fLS
	CeSlc9cU2eLgoHvJ7GqCcBAC3l8Y2wKo=
X-Gm-Gg: AfdE7cnEkNO0lxQGuABH/mLaQz3a7hqVyO1zAS7KqlVl61XF6zx/MMsWYTsCN7ysIUK
	j5Klk7J6FGv5jNnFGd7Yc7qmGxzhVN9xNs46TiR5UkdgQ4zfqrNOywnkXIJSvJ55GOrz7+ireRR
	mPH/7tDPnJwim6iyGWxsdVt7MOOI8FbKTwaw1iNOZzLMmjrWMndWgzoNULR6azORJ2oXOdaGXE8
	4i+l/FumD+WujosRiZnATeIssw0zF1REOHLSt4CRpzPsegHRJKK/TybyWRitsA=
X-Received: by 2002:a17:907:e8e:b0:c12:6632:e7f0 with SMTP id
 a640c23a62f3a-c16b46e7a56mr798763666b.24.1784630225874; Tue, 21 Jul 2026
 03:37:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708131122.2917-1-luis@igalia.com> <20260708131122.2917-4-luis@igalia.com>
In-Reply-To: <20260708131122.2917-4-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Jul 2026 12:36:54 +0200
X-Gm-Features: AUfX_mycIVQeVufkTTWG7ndAZWjUPZ8q3Hx_6jdYuD_j9Bu2y9II3KGMFsILqJM
Message-ID: <CAOQ4uxg6Z3rKYXvjKZ8=rCTM9vXQXiw5M8b3G2zXZ1r7hB7qNA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/5] selftests/filesystems: check that fusectlfs is mounted
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
> The control filesystem for FUSE needs to be mounted for the fusectl_test =
to
> be successfully run.  Skip the test is that is not the case.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  tools/testing/selftests/filesystems/fuse/fusectl_test.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/fusectl_test.c b/to=
ols/testing/selftests/filesystems/fuse/fusectl_test.c
> index 0d1d012c35ed..2dcfd3ebe0d5 100644
> --- a/tools/testing/selftests/filesystems/fuse/fusectl_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fusectl_test.c
> @@ -48,6 +48,7 @@ FIXTURE_SETUP(fusectl)
>         uid_t uid =3D getuid();
>         gid_t gid =3D getgid();
>         char buf[32];
> +       char path_buf[PATH_MAX];
>
>         /* Setup userns */
>         ASSERT_EQ(unshare(CLONE_NEWNS|CLONE_NEWUSER), 0);
> @@ -93,6 +94,12 @@ FIXTURE_SETUP(fusectl)
>                      strerror(errno));
>
>         self->connection =3D statbuf.st_dev;
> +
> +       sprintf(path_buf, "/sys/fs/fuse/connections/%d", self->connection=
);
> +       if (access(path_buf, F_OK) !=3D 0)
> +               SKIP(return,
> +                    "fusectl doesn't seem to be mounted: %s\n",
> +                    strerror(errno));
>  }
>
>  FIXTURE_TEARDOWN(fusectl)
>
