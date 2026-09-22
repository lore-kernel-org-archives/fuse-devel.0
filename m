Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF994F93B0
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 08:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066713; cv=pass; b=MJtmaCCJe17oUEomUmqhWiY5z2KUzx6HbQj4sGjOLndIyQOQc/3oF2XB0Yfo396anycHhuIg+1dqDqhOQGWGjXfa0TO+VhQEWHHDyCDjbwZpP9g+OKw3Qr/nP9CnPXsNq3L4x3CZbwDdzgndTW1vFRko85LZRSNfw/t1StelmSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066713; c=relaxed/simple;
	bh=R7mhD32DzaKsWyRiKjLKIM4yO6OKsNd29IldRRKFmsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFcPPpHx3yB8mTHA6x69eduIyYvHB5o4AChcCaf0v0iqm+WL+IwTfN8fP70K0YPymAd0EER1ee9Y/iKv2033NtqhQweDVplPTMXr2qth8QBmYYQquoT5DzN0N0sLStLZtB0yadeDlb85N6MdfnEIYR6YDvRe77H3AXGyf2ihJSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBJM6gfQ; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBJM6gfQ"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso6335033a12.3
        for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 01:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790066710; cv=none;
        d=google.com; s=arc-20260327;
        b=SQZvcvLPPo6lD/b3/zM59mI4Iv9zmrNB4RT0G5iD5f6s13k0orAddX//zLRgl9WJQk
         q5v/2+k/FEBLzd1VZYziKxlkbRz/3Z6iAlVcWEmg2Lm/lQkRip4ROYyoJusMcXWRWXFc
         T1R1E1tEmcMpgJtdso0Kv5IHon4AeB23YaoZpfW64ULEyBm9t40dtlyJhB91KI08UEF0
         mONiuc8vKA2F6gP5YbsGW2VXdCEX3NUmArx1ewXSR+3gEFMGNiVSp/1GciePZslKFNd0
         6nYpFtHN7grMDFtlnItp6yDxasXJwhHLv9NtwoprWjyjRZmjLuPMYFKW/JPXNdiDegT8
         CVdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BDOEReqI/YgnTrkXhgumDJrk7oP2MDLUGdoRmVkCWPw=;
        fh=LSGkIxL+7O1MPXHhjOsZelXZcZzf1zyb+22wAIOwAjQ=;
        b=XK9mzNzCyrfvrqYQpY1emfyMPVI6NOe2BFxhGPw7JDD3juJhMO2yX0YgqdEHMJAWKL
         lPQkp0iNO/Bzl3ON9/GZLyYAXEHavHMPl6wMLHCB/OiJgE0xjNlPyM0fLFBRNiBDm/Th
         xG7sVygY6Y6sIHC5crK/MxTIXrx6YoeOHFJQhTOGisvfAFWPsDZvMVQox8+dVw0cMigQ
         IJ7i7ccPEE08WT+ORTGudeeqJXelXTZQdks19zatEEq4xz3ofI/5zl1B+VoHpD9fZmeZ
         s0bpW63Q9e8KYEzsJzYcWyuBufUMEAvO8UHHN8isr3+qgh0/NJwPmWiOOpfB/j0YJe7J
         8qKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066710; x=1790671510; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BDOEReqI/YgnTrkXhgumDJrk7oP2MDLUGdoRmVkCWPw=;
        b=UBJM6gfQj3hvu5hf1meC1lp9tlsr77c1gxVe7mmzXl16JN7l0YORNnYW72+KdWprwa
         Kgh8bLvdnkuR6PoPQUIWFv4jagk8CXCdNuusqmZJuvcpOrfHts8Lo8Vmh1FDaJiO3K//
         O0n48mlaSIfjDjAR9e0Vk2AI/vkCgbcwaua29H6cVpGZbZp8t+2cl+T7u+4lQ+5xASYA
         gKe8qwh4eAOn9L8rvU/dJrvJvOLNACqKvznPi4l9jt6QzeSTBk6mAh2TcgcxtVRFXVi5
         2u31Im42arpby85WTf8KVbRGYpOfgZFcDSg1t3mAS/tgnj8nORY6dK66uvBn/gJDi9M+
         V+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066710; x=1790671510;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BDOEReqI/YgnTrkXhgumDJrk7oP2MDLUGdoRmVkCWPw=;
        b=xCnaeyKs8UKyuH/1f16TwYFuW5ByPS+kXWciVniPJ9KB0VderNN29ZOTFSn0kUvDtq
         K0pl6m44HLrhd4wmjHwNVAaKoRBH0UARjHzPxYWJYNa2lNZuvjsf9LnFkMPKMy2ZZX/V
         h8h1B9fiBi9tovc4BNSRBK8DBBhk+UxePHJ2gBF5ao5NrKs/UZl22Ynq5sgUcu3kH3NR
         WXUEblq4MT+6MoNvp+VpUWOWG19ID5FzxK+5uV0gQtBpP0nYaz41/rnyXyCrIwgImT7u
         foloxltlyKNQgBzYKrOMUWVKTqV2m6fFhJ/5p+m8O08DXeFuqnojR0OpGYsDKyCY9YP1
         c9hA==
X-Gm-Message-State: AFuF++lwYJJ3DrBTIW4anrUB6t1Nw6rixiDl3XXH6NAePVUi9iZO3dg1
	QkEL9Nyl79J8SqRX2vmBRSQkHZARV36Z44iVv7J55p0o20UvrcI1+iyYQLH+u65dcPUBqQeT7xJ
	ulq1Ee1wTFkp7JPlIRuKNLjwPC3GI11c=
X-Gm-Gg: AYBFou0aonlOhQUnSdYnGpB43svPYREyea/lcE2S0JsKZSrIrNDFuf34eys5tCuScaZ
	Eg16eV6jtrmHbEysb2tszGkx7vyoOE+jDvufVcVHuSd4rOSrQgBLFIB0um400iTVz7/w4VuKsGl
	XLoA4RiaV0ZZ2SsHDis3ATUMUMWAvmhKlwHiiki9oRyA0jN62XJAsuodwVdWgrKnK2FW69iNYY5
	rSv9sCNVbZYnI8M4alQwUhe51MlWY+K8Ue3ZdFabkDnVwNGRiuZCNtHSw/wpOII9vAgPlGxUDRx
	buwJws6d/y627LJ8GMkvljkdHUutoaE9yz66Ro4+fRYON8tsPxx7y/gQ
X-Received: by 2002:a17:906:c10f:b0:c29:659e:2fd2 with SMTP id
 a640c23a62f3a-c2a157c1e2amr1149509266b.27.1790066709548; Tue, 22 Sep 2026
 01:45:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-5-mszeredi@redhat.com>
In-Reply-To: <20260922061019.3320196-5-mszeredi@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 22 Sep 2026 10:44:58 +0200
X-Gm-Features: AcwNN1VfxpTpHSwiXw7G7QaS1qW6QMDmbJcUIIq6TnBybOViI6y3xEWLQRNAzQ4
Message-ID: <CAOQ4uxiob=w5C0OUAaBYmUYxScVg7ayfLLkLDJPV-xj7djDPQQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] fuse: make fuse_backing_get() static
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> Since it's not used outside of backing.c.
>
> Also remove the fuse_backing_lookup() stub from fuse_i.h, since it's call=
ed
> only from passthrough.c.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/fuse/backing.c |  2 +-
>  fs/fuse/fuse_i.h  | 11 -----------
>  2 files changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index 472b6afa7dff..433fa3098d71 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -10,7 +10,7 @@
>
>  #include <linux/file.h>
>
> -struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
> +static struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
>  {
>         if (fb && refcount_inc_not_zero(&fb->count))
>                 return fb;
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index b7d8751ba2e0..6cd556a0aa59 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1267,24 +1267,13 @@ void fuse_file_release(struct inode *inode, struc=
t fuse_file *ff,
>
>  /* backing.c */
>  #ifdef CONFIG_FUSE_PASSTHROUGH
> -struct fuse_backing *fuse_backing_get(struct fuse_backing *fb);
>  void fuse_backing_put(struct fuse_backing *fb);
>  struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, int backi=
ng_id);
>  #else
>
> -static inline struct fuse_backing *fuse_backing_get(struct fuse_backing =
*fb)
> -{
> -       return NULL;
> -}
> -
>  static inline void fuse_backing_put(struct fuse_backing *fb)
>  {
>  }
> -static inline struct fuse_backing *fuse_backing_lookup(struct fuse_conn =
*fc,
> -                                                      int backing_id)
> -{
> -       return NULL;
> -}
>  #endif
>
>  void fuse_backing_files_init(struct fuse_conn *fc);
> --
> 2.54.0
>
