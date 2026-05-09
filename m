Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9558230C354
	for <fuse-devel@lists.linux.dev>; Sat,  9 May 2026 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778337995; cv=pass; b=TGIQNmLtScB+/IaGFf3o4+6Di7zrATcFXSQrKLvnw8E8q2NcePqJpcqsckInksWQ5Xh/3E3sJrusV8/9EqVpvhv5s4JjWNVaRyyAnpWTcjeEfY0jeW7FDb+h7ClkzolRwrAjhT4QN/0dm/GjdPLDBRcd6vgVi4i8Na2f84++R5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778337995; c=relaxed/simple;
	bh=sawKN+qRD/vAY7MWOXqkqKaG0HyQdKakE6fstvcoU3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XA0XjqsdDPQmwG3rv/fwXOwHqBjYrcPA2DsH3KSMMh9wquThZ29McOJvGY1sGm5LZBl+iSPDuwKA0a6fb/MXt3Id8Z2UKln50pt69v3Gj7HbCEplgXJ/sZPlaIHyvXoR5eicJko23eg0IOuNi5AkgGX6W9Pgd/pxaY1VQFvZwK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GutMRMrk; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GutMRMrk"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67f7caa33easo480575a12.1
        for <fuse-devel@lists.linux.dev>; Sat, 09 May 2026 07:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778337992; cv=none;
        d=google.com; s=arc-20240605;
        b=BOmkZvJ/TfVBERPy4uyX6W4jLiZkS3JaJaCdUZeIUG/TQ5FnCEhqM1RzctjgDKgZww
         DYo43KnH/Ogv1jd5g8D4RekEfcpmhL++ku8CJ1h3IJ1SBY686dORo0aNIG2LGO2NA24x
         CCoSgQPs13DmrQpskwY0WQPq/GOlx8mNhsgTCrno6xAWY4ITdE/hmbvXuNaRCb5fFfkA
         GU6NXX8I0H519aZUTCJI1WGG1QYX1N3SIZCB3gY40v4CirNtUae/vrz+s0LmNQK+kGxi
         6QX8yustrMYmo9M870xfSZBTOOH1XrNM38G5KmdOCXeFXCRmnC3vPQU338ROyTKGbMQH
         wyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hxvAH6B3ovI1KriPqXOwwGFTFPthi96p6jV9SADdE0c=;
        fh=Yds00APiICbi0gH31pAMW/Va2707yISFPp3uV7877zE=;
        b=hlRlyQdpik9+H4s8A3QQ9pb4gLoNIgXQbzWAuQk8Q8W00lsvL+4zkIB3x+iF0UG9VF
         I2U6a+pEVl+s6liyJO5JXGQW/pyuaQYqLc29jqlB+YvZ4tzFOahivGd28n0sDAk14frH
         Y8lxhrFDgnLzf9iXb5phWTuDUHBvq8szQWGKXY8zntdKPRnOe6xOzoKoQkaZ18//J/gt
         /GbFCDqP1JxkCF//Wk1CagBtRhZ5zJMXJHHBXLtuiPVe8QBC2RnuWbvheKOsElstU+QZ
         l/54y9P0hu/8ln/NNCSXaF/ktydL/zUnYNmmaXgeM9xt/+4YwD5EKu4tUeESi4tIviRn
         xBIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778337992; x=1778942792; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxvAH6B3ovI1KriPqXOwwGFTFPthi96p6jV9SADdE0c=;
        b=GutMRMrkvtW4vWAwD4Y9OnaYhSxoyPnA2x/YCDaW/LVeGt/fvTCgn5+nMwsib+b7oW
         GaYgmQyUkYNrH0s8q37vguaOf2/3CYfyvC/C5/VkbFdbYlIA/yavqRmBsslHmOZpqPRD
         YDOpdbF9P+lKUNOM/RCc+FsHgQ3uw6TAQFgQc0geU3jKoL8ARb1OhuUj0CkMMH5Ii7ql
         qP2g5tA9KBAdSyKKhARFUP9jNjmrneqhSW6YGU9XnjFXDKlYOnKd92/WDQSA1DxSzUAJ
         EuI6hcV/tJGI8aAQIJOpkLophnOTeOx55+6ebmzw/zUbpJ+d86rEzpPhivzho8UgcZ22
         9tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778337992; x=1778942792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hxvAH6B3ovI1KriPqXOwwGFTFPthi96p6jV9SADdE0c=;
        b=N9QJrvF6sYuIYMEEUwi+RmeUw+qZhh6aPU7Pkgr1aoCsst+ghOgkROHor08S26w6Rf
         8IRx4BMs+SKMgji/2Y2pjNSAJr1t05jjUF0W7Ym0WmlGFlcp1WJbpKQ+HmWXiN1+KM+h
         yStccQykXlrHW98H1++M8rtcVxlFkMeYrxIiL+Hyo7ASwGD8fqVZh3ROH9w1qaBpRwMM
         Sy5wwyYx7hWV85Z+w7GOs/iVx8sZ/0dJmpXvhcTlOzxgQZTcO3Qbj1vdCClGsZ1mmoEG
         Ds7GOUl3WIeLVkXZsUP+U1/BwNiK8MoLtO2xlle9l1iBBADMjAvyf6nYyo4g3sSrq16+
         j0cw==
X-Forwarded-Encrypted: i=1; AFNElJ9x4RB1eilMlu1Xxkxc6nNC+E2WHAY1U00ZvVporFxbVNy/e3cThqh+irwWWqTa7JQ/SPuDxaguXVLJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd8I5m1O95Y9ccQKOXZAsY56WqsTVj16sJizkV1fWVS1ZKmhLn
	6WBLNvPNYykwbYv18UCo148syeTydn9Ny1UXyIvBdI9q8Vrxo4N+Pv3NRr3WORwrCeKU2EMzPCI
	aGANab0Mw6o0OfT6q55GS80cmvSsgbsM=
X-Gm-Gg: Acq92OHvDoC09JBCJUhbL0qlRJRk6Ej4TsgfuGWxxEVNObTND5amAt5BgMBkSmi1WJf
	YOZQZPv/0imq0QrokUVn0YP8qrGqMJIgzUvRpe+UHC+m/g2SGKiIx2B7YTWTf26/SlHr6tma4YZ
	Yx6dUESnT+CIH3Thd11YN4PsNoHYAYVI10NHCrACoLa+LIyRUT27zVdOxSNjeH6OQpb8Li6xGlM
	HLAR9XRv3mvOF8fMkEgz3SeoU0VMB7n38NufwLixRWE7l7n8yp3JypbECUDSu9c9GOya8ACLllk
	/l5aqyBMffb8r4tRDGYnAM2Z6R4DHw/CdCdTzcfF
X-Received: by 2002:aa7:da02:0:b0:66e:e024:1a08 with SMTP id
 4fb4d7f45d1cf-67d646b082bmr6638931a12.24.1778337991544; Sat, 09 May 2026
 07:46:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509102337.272593-1-liwang@kylinos.cn>
In-Reply-To: <20260509102337.272593-1-liwang@kylinos.cn>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 9 May 2026 16:46:19 +0200
X-Gm-Features: AVHnY4JRiI1W0a00aZBMx9Zu9ZwGd-b_kHgAXX5Dt--Xvfq-HwbodxzXIgAENc8
Message-ID: <CAOQ4uxjRtUkWB6oCttv-VnznCB3T+HNXgoYgEcU3RwU6BokaYQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: propagate async RELEASE queue errno in fuse_file_put()
To: Li Wang <liwang@kylinos.cn>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>, 
	Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 9, 2026 at 12:24=E2=80=AFPM Li Wang <liwang@kylinos.cn> wrote:
>
> fuse_file_put() queues asynchronous FUSE_RELEASE via fuse_simple_backgrou=
nd().
> When queueing fails, the failure branch always passed -ENOTCONN into
> fuse_release_end(). fuse_simple_background() can however fail for multipl=
e reasons
> with different return values, such as -ENOMEM or -EINTR. Pass the actual =
negative
> errno into fuse_release_end(). Currently, the callback does not interpret=
 it,
> but passing the real value avoids misleading future development or debug =
printf
> that assumes -ENOTCONN meant disconnect.
>

Hi Li,

If fuse_release_end() does not do anything with the error, just drop this
argument.

I see no point in this patch as is, serving some unknown future development=
.
If future development needs the error, future developers can pass the error=
.

Thanks,
Amir.

> Add an explicit (void)error in fuse_release_end() so builds that enable
> -Wunused-parameter (for example make W=3D3) stay clean.
>
> Signed-off-by: Li Wang <liwang@kylinos.cn>
> ---
>  fs/fuse/file.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 3bdab8d03373..8b7badb7721a 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -96,6 +96,8 @@ static void fuse_release_end(struct fuse_args *args, in=
t error)
>  {
>         struct fuse_release_args *ra =3D container_of(args, typeof(*ra), =
args);
>
> +       (void)error;
> +
>         iput(ra->inode);
>         kfree(ra);
>  }
> @@ -117,6 +119,8 @@ static void fuse_file_put(struct fuse_file *ff, bool =
sync)
>                         fuse_simple_request(ff->fm, args);
>                         fuse_release_end(args, 0);
>                 } else {
> +                       int err;
> +
>                         /*
>                          * DAX inodes may need to issue a number of synch=
ronous
>                          * request for clearing the mappings.
> @@ -124,9 +128,10 @@ static void fuse_file_put(struct fuse_file *ff, bool=
 sync)
>                         if (ra && ra->inode && FUSE_IS_DAX(ra->inode))
>                                 args->may_block =3D true;
>                         args->end =3D fuse_release_end;
> -                       if (fuse_simple_background(ff->fm, args,
> -                                                  GFP_KERNEL | __GFP_NOF=
AIL))
> -                               fuse_release_end(args, -ENOTCONN);
> +                       err =3D fuse_simple_background(ff->fm, args,
> +                                                    GFP_KERNEL | __GFP_N=
OFAIL);
> +                       if (err)
> +                               fuse_release_end(args, err);
>                 }
>                 kfree(ff);
>         }
> --
> 2.34.1
>
>
