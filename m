Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4696B19F12D
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 01:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778894460; cv=pass; b=jcSjcrv6lkd+ErVv5cwhGWekoS+gRJzvLFxBDs7LbUmmTgvetCTeCllB3ifUlE2CzgkuCon6LjXaBj1ARrQgyd3xHxVsEcs7oFFTA+7fPNbkvWJuj8tf1y5BW/5M5YS7l7ll2VNtdsge+6ZX4EdVQ2qmSPN+GokEN0ms3uDXrK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778894460; c=relaxed/simple;
	bh=NlomV3EsWHm3GUuyYGQf0E0j2lWRAoNT9eDqu5MZyBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYO/5QLHw9lDxfKGqBuX/SzshZjFJXvEhBMCMTJ+KmEv4aHTvqjQVazZYyC/CFJ/zTrbQB7mvCX0uJGpC/68pgimm7R7VIFxx5fYvRSN1aSND3nxCktuq2R2fGPO4AdJW1BAqw8LY1c4ZwXllmfQB6GSKdMe+jRPqF3rzqiXMR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qW2vrwjI; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qW2vrwjI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d75312379so936010f8f.1
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 18:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778894458; cv=none;
        d=google.com; s=arc-20240605;
        b=fgpKuXA7wKX8AAWmWBcDJE+c6TieXUU72JYhK5xzH+gejMdLN8iJsk3VFFc/o7P5kl
         ewOnUJD7o24i3wkrBUGpHv3WwRWRZ+FghJTO2J2rNyZh0DrmryJyJy9AX7rasBRbdYOr
         pW8Lyld19ixQNUpDjYPS+B4MLtUnaedvW+ktVXyniV+eejLpgZzy9pmbOTiFMISxOJCa
         XydCCkHSj3vP2j0+YSKgxiVG5HlWvCKoZ/3HUQQa4HeJbpwCeCw5DvlkGl46mF+DE1dZ
         qPEyJ7ByT9yjnUUrrFDcEoHafhVkDZ7YrPyOmggQGbrtXaw5Xs5ieDX/WQYvAgyiAIbz
         JFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V3oSdJYWZZVYWFwmC2nNp8mo5siJflGnwwUjlIft/aU=;
        fh=m/f6YJvJ+t5+4aY2YI3TD839gW/9+K7lKLC2GNVR6Rw=;
        b=ZubKj/DO5V57i/xUGvXJ1wHIIKFL0a8tmk0NmTi77fXygDR6c9AeTADJL5de4mxVEP
         k5+bo6sVTjpHvtX0b/3XjZguDrwx1JK6fUP7zIMAuqIXzmBbQAJrMrMnReqH2S81bZut
         wcLKCTSyYFkQ+cVBtveI/UAl/kDsL9IaDCCLOIKpRlbrNpFj3PaXVouOKwB+iFibCl6L
         DJA4erSgB8IhN4li2aGmjbhEHRmMGPCYqfAhX6MRJ96t8QgLhAGlMXZwU0fx69z9TcCj
         4aNLBJkSXs97+B24RTAjF1UJ1fkOKH2HjzdHioncaKZZ06q0jEAK3V2zb4K+9KgoP+9V
         rGNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778894458; x=1779499258; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3oSdJYWZZVYWFwmC2nNp8mo5siJflGnwwUjlIft/aU=;
        b=qW2vrwjIyOlTRUkprdNYuMyNR+Wqv9GOgfI/uD2akvRVn02lWvKO4LvRBYnYdyqePw
         zJdQmJyISvL9h9yglGN69+vbyRSVpJiqBFhNEoYgbuX/ieW+XwOhqf+Y2nqrmNavAeaI
         PouR8aA3XJs+V6fT3WS+cDNZvVgxJaA8+qJgCNKgNfq4hl3HhXDJMzvqYQqFydOXbmE+
         Krx7hlVuQMGAu84lo4COV0r8ZLgkQUj+aNEMOp1vwG6zc16CeWFoKhR3PZ97fY2t+ahk
         MVC9OeLNrYxYrR6zN0zm6QkMxRPzwYzOTF3WyQ1abLHarqxvIIIFNfI7a2PxXdUQEhQX
         oq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778894458; x=1779499258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V3oSdJYWZZVYWFwmC2nNp8mo5siJflGnwwUjlIft/aU=;
        b=N5pFRb8AESlWdhs2HA2XwdYlI9myQ3QPhjXT6bAm/SDWIwxTr3CplDB1w9yqqcR9no
         BEjhHU6fbDcAomQ1++lI6Gbmfu3a6VdUCXVw1hFQIv1UZZt3LU8nKZuTIf5x30z0K475
         TgX90aG0wiYImdH5I55V7FVlKu6qFB6VaaT/0cKTDWvpVpfxPa3WYtxN9dVx+vOv9J/0
         xNQCOLT7gvbQlqw2RCaIVkaAw1ysKR3Nvhul+/zBL5pLxYHTbq3wIJCpxaIgSTa0OgTf
         u79x1OFMyioTXfe/yQPDXX58ryx4cqH4IG4a/8eTrRoAwO7h0OhsyOOVVrN30gykCX69
         XxNw==
X-Gm-Message-State: AOJu0Yzf3QlZtu7hQsKonWQB2CChWb39JfHwXNHMKOmbrvOvo0kSMHF9
	M8k5Ui8NSBanub45sLy62odYlgo7IRPwDOqI6dAFZ8D2iQBFjWvroz49W62ts6oyzHyIKqVFC9o
	Ta2uNDR0BuMtoiOLLpqhx6ih6wIeS7GM=
X-Gm-Gg: Acq92OF0CPkAYpJjczXsvxH67qza8Vh+Lapv3+JeBA+Qzyah9z4OOcBEFZQYlfPP4l7
	NyYeajs5QrWPyI7Vbn75GXqA++EN9pNdz+rn4G9h+AH4+KNjZF/jAWYbjEhC0ztUjDGyfXE9NWf
	6G3f5iEU3iQk6ez0qoPaA95gCXzpe8Gkq8w53EUQxmH4epUlJnw2oQlQ1p2OJaV75ZP8O9M/Tjd
	PKeZOhMRefTfyejzqw71rZyqr5FXAirCM+O4aX4PNgTsz6UejZTlTIeL6idqpt6zajmsKbH2fh+
	6sHir3T/L4oBjb5r
X-Received: by 2002:a05:6000:2a0e:b0:43e:a8d8:f3dc with SMTP id
 ffacd0b85a97d-45d916264b9mr10449323f8f.13.1778894457541; Fri, 15 May 2026
 18:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com> <20260516004004.1455526-21-joannelkoong@gmail.com>
In-Reply-To: <20260516004004.1455526-21-joannelkoong@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 15 May 2026 18:20:45 -0700
X-Gm-Features: AVHnY4It9t9mdeAK6RdHpuabloeao3VLH1hUAq1eRnc6MZF8e4a5Ory79r1K4uc
Message-ID: <CAJnrk1a9_MLyMebfsDe_=Rcd2+TaiD87pW4fd4ve8ZBQPCfGcQ@mail.gmail.com>
Subject: Re: [PATCH v2 20/21] fuse: use passthrough getattr in setattr
 suid/sgid handling
To: amir73il@gmail.com, miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev, linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 5:53=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> When refreshing i_mode for suid/sgid kill during setattr, use
> passthrough getattr if the inode has that enabled.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dir.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index b67b3b334e69..fd1b3fd86968 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -2524,7 +2524,11 @@ static int fuse_setattr(struct mnt_idmap *idmap, s=
truct dentry *entry,
>                          * ia_mode calculation may have used stale i_mode=
.
>                          * Refresh and recalculate.
>                          */
> -                       ret =3D fuse_do_getattr(idmap, inode, NULL, file)=
;
> +                       if (fuse_passthrough_op(inode, FUSE_GETATTR))
> +                               ret =3D fuse_passthrough_getattr(inode, N=
ULL,
> +                                                              STATX_MODE=
, 0);
> +                       else
> +                               ret =3D fuse_do_getattr(idmap, inode, NUL=
L, file);

I left this part untouched from v1 but there was a discussion [1]
about whether to enforce that setattr must be passed through if
getattr is passed through [1]. I think there might be some use cases
though where having only getattr passed through and not setattr is
useful (eg server wants fast stat() but needs to intercept attribute
changes for access control or policy enforcement). I'm not sure if you
still feel it's better to keep it simple with enforcing that
getattr+setattr rmust always be passed through together, Amir, but if
so I'm happy to add that in.

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/CAOQ4uxg7jaA0FdLW6uzZBRX=3Dm1Xw4v-k7=
zeQx7kYcpFwFDpf7A@mail.gmail.com/

>                         if (ret)
>                                 return ret;
>
> --
> 2.52.0
>
