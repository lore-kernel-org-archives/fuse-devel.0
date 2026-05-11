Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D535D35A387
	for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 18:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778523353; cv=pass; b=El0C45HGBbenI5UiBGkjpsYuFRGpGW48JZSHW7CteC9iAXUkFzWRhBC2tx97KuX9Xd3eQiKQXQfZpd3a8BXWaJ3QcwnE6OEqXjLgBnnCYWvay//yifSYd3qWYzQhBbmRIBmjFZwRZi+OSZtcDiHft8XXn9X+p/UQ5H9WJ4IfZZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778523353; c=relaxed/simple;
	bh=DhGn5UF9pl5+f5nfk13r4Hirx7XMJcXKtnxczO8XAXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H960z+hNgXt0raXrUL/0dzpllyRx4Hrpr/bA0RjDttMinKMrbAjLtcFwdAlKdoSg5ppbViECkl6zbVjNQtmAayoK/L0DdS+pcbMTvudvTXdfYRQa83fz2VNUzkAmLAuR4pv/Mu6uWQdJwmXlo8rutjFPLFcgM73la4AvD/uFXGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U95fr43t; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U95fr43t"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so79058185e9.2
        for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 11:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778523350; cv=none;
        d=google.com; s=arc-20240605;
        b=hYfx6mUQ/8jPsacrJXsbQoQiRbIbquhtWd393/Tc+uwkg+QzA1/N0QzDzeWquv3kcc
         VAF5WCXyKU4ZtiRnbru+QU0gvIIkG/1a6yk9jqJNpnldKtIUwWhyZuDCBTutyrjsT0wd
         hHQnEvHRf8WxD1M6fyXH0xpqCEYOT/OJ6yITjvkA81tPt3vt1hxmW9c2b23G5iq9BGGB
         Ypss5RWJfugb+OptSgEbOmKddP8tDJud276WOVHENY3v4GJtVjYbH2SpJVX//qF5+blW
         zT1y65WmmlGKIR3CzZBkQMvc4XfY9qrxVDNfHxXmTmmMXvJGRyh8KpavIQJNIWlw2HOR
         pmwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ECOdkSGXrQpaZut2QWbR3KMpwcmKnbZDmUpZglT/RTQ=;
        fh=zKrCFhsJAbP7hj1o4E8dUF4phE/kfxsClPKSpQtsbMk=;
        b=DTHkms8zjO/dbrYtE93PSY+oeJrYyjwfvXX51ItJzWlPQ+2ms9IhniBQeBxzZZm/G7
         /3DAjE8+J3dQjndyUHLTXuGnsUmTk0N7m/lbTyQX9inH3Oc8RPBeEbqS7EIOl2hMJywl
         UIZxwkWh5qeLY2J6s/snNCxgfqP3t2an6P0RSdxLuAg3rJjPT5NrIvLP8PPX16IzXXVO
         d21TcyyxzVmgBj8DMNjG6BgM5x1EpJg7i55o+nAFOZDAbvSiD9d00Oe9sa9PW7kp34Ao
         Ub7UHI2uLPVDhUsFhITuFYz8T6da1WFN305rQnNZ4sCjJ6qb8/6LEQvBjuPqWG9TwgvA
         p3Zw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778523350; x=1779128150; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECOdkSGXrQpaZut2QWbR3KMpwcmKnbZDmUpZglT/RTQ=;
        b=U95fr43ta/TfSGqser1MjL8L6RHdRFnOF1nEh3e+VC6i2AxuVfh74iXMr78jVEbcSW
         e0BpI8zZL1oRY2BFPvfNo56UBF8fHJ5IaM2MkEeG70sLTIoARyGfC/viLt7c2fZbnJWp
         BWGo3R4jW+Qh6M8PuSLQATfXK69FYUweHTKJq5kNmKsCFSlc3sCVvcCzJUJLHEyJ3Qlw
         otk3XY2smZuVvuBeKJJsNiCF8YinMZqu77PFfCG/wXndOCuuLBnOWVW2dGIo58kDP2ep
         qEiko3+xjX4aMtn8a8ZrROH7LHEMPdPDiR2ae5WhPKeedn5m9p35u2UxYTbtbJQFNF8j
         JvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778523350; x=1779128150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ECOdkSGXrQpaZut2QWbR3KMpwcmKnbZDmUpZglT/RTQ=;
        b=L0opeC99hWmbKR7zAmsUA0YDQnBHRMj8SzBjae/e1vd1EjzMU6B4jukopEpZ4/5u1A
         T7xiQHlNd9yDNJvvCbws8BBp1ROcDPkRvPhKOWjtgryMp2zvyH6RQCbyt1tz/LaN+VK6
         Y5f9iwZUjb1URfeFAwiLhnQH4PS5YjZU8dQFuOwt5OsGYZUeWs6lQVrPldJAkIQ02Z75
         xPVDCSdj9ZzQr2UwuLcfn+d+0Z3IDDn5kCABwEH2ShJL5qnZv7VEOsqZfZJZM2KfXDfF
         G/+PnNvq5pb/Xw8wsOqhFLHtvohKfCaZp9L4bZX+RcvcGNI1uiDIti9XgIScIqdbdT+D
         ncaQ==
X-Gm-Message-State: AOJu0YwShWwHM/dwI1zp26k6U9LlqqSv1eMg0r4g/7IXYQLtwUzixc2/
	T6e9peCD6ctzYshWHq9ZbMaX2CWuu5TRA15XmuafzmVy189O6+pvGjgDzPvhvcwLQvWlu7V8XNi
	X/kuG+yxek4TIEOClD3IICj6OoOcgkAtbxH5/
X-Gm-Gg: Acq92OEa+1r9rcvN0cPHWq+DQikaSak/GwuUFNmXezpQZUWfL4Fb8zJti3o58vTItP+
	PRk2D2N+b+5SKOjELqsZif467T5R1UVWarMompX1xX8QxhIEnyT7iZb4DRQ8jj3od1/o8ip8Ho7
	YWrhdgr1AVkYj9fQHnp8OigHFI2BvK3m5xPO16MLaar4TlG7QO3Krck24uFJHSg3HWVp06X6PJk
	6r8qcL4eNfrESVNSu6oUFzfGJ5mxKD42D+ZRdO7Ky6GJf0TX/jurobII0K80zpFICUH64qZ+6uL
	Xq7CcE4YzqdXOPdN9PcDtXo=
X-Received: by 2002:a05:600c:3b0f:b0:48a:7965:b943 with SMTP id
 5b1f17b1804b1-48e51f4e9admr411048935e9.29.1778523349785; Mon, 11 May 2026
 11:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511123837.64930-1-mszeredi@redhat.com>
In-Reply-To: <20260511123837.64930-1-mszeredi@redhat.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 11 May 2026 11:15:37 -0700
X-Gm-Features: AVHnY4LQJni0KNj71w4WX9Mfqix7ZedsOIB5KSbsggQX9mBXmFLaloJtdYqgt2o
Message-ID: <CAJnrk1bmhY5+9H=WETv+gWDvpTEy2wccu1uZMVjb2rY50bFwPA@mail.gmail.com>
Subject: Re: [PATCH] fuse: expand MAINTAINERS with subsystem info, update
 mailing list
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>, 
	"Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 5:38=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> - Bernd and Joanne are maintainers for fuse-uring
> - Amir is maintainer for passthrough
> - mailing list is now officially <fuse-devel@lists.linux.dev>
> - change status of fuse-core to be "Supported"
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
> [this time to mailing list as well]
>
>  MAINTAINERS | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd16..6e3da76e4cb1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10574,10 +10574,10 @@ L:    netdev@vger.kernel.org
>  S:     Maintained
>  F:     drivers/net/ethernet/fungible/
>
> -FUSE: FILESYSTEM IN USERSPACE
> +FUSE FILESYSTEM [CORE]
>  M:     Miklos Szeredi <miklos@szeredi.hu>
> -L:     linux-fsdevel@vger.kernel.org
> -S:     Maintained
> +L:     fuse-devel@lists.linux.dev
> +S:     Supported
>  W:     https://github.com/libfuse/
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.g=
it
>  F:     Documentation/filesystems/fuse/*
> @@ -10585,6 +10585,26 @@ F:     fs/fuse/
>  F:     include/uapi/linux/fuse.h
>  F:     tools/testing/selftests/filesystems/fuse/
>
> +FUSE FILESYSTEM [IO-URING]
> +M:     Bernd Schubert <bernd@bsbernd.com>
> +M:     Joanne Koong <joannelkoong@gmail.com>
> +L:     fuse-devel@lists.linux.dev
> +S:     Maintained
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.g=
it
> +F:     Documentation/filesystems/fuse/fuse-io-uring.rst
> +F:     fs/fuse/dev_uring.c
> +F:     fs/fuse/dev_uring_i.h
> +
> +FUSE FILESYSTEM [PASSTHROUGH]
> +M:     Amir Goldstein <amir73il@gmail.com>
> +L:     fuse-devel@lists.linux.dev
> +S:     Maintained
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.g=
it
> +F:     Documentation/filesystems/fuse/fuse-passthrough.rst
> +F:     fs/fuse/backing.c
> +F:     fs/fuse/iomode.c
> +F:     fs/fuse/passthrough.c
> +
>  FUTEX SUBSYSTEM
>  M:     Thomas Gleixner <tglx@kernel.org>
>  M:     Ingo Molnar <mingo@redhat.com>
> --
> 2.54.0
>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
