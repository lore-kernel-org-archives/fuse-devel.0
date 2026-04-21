Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7811F2D9ECD
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764242; cv=pass; b=mNTKGDe93HyGThAt9rg0CappmXpr9kTS8PODyU8+EsU48nQuHKzYZn4HmIqNTPw80DhKwY32ybI028qdFuapWw8rUMCyZPEvZ5EUrri1M3mIXzIJZh96DkHgQ1tAiRjQq4E5nanQCErPV2UleO4zhhht9wrmcpil3uENDUbQpoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764242; c=relaxed/simple;
	bh=Dt48rPJl6+ax/xqfhFhOS2EYh2msKwUDvpDGsWa1u4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dvnRJzWBGD3LuXFOu4a7gDp7lm/81TevI040f781RZXZv0P2hNw2gydq1jXwUxz+LyOkSUY8MGnI2oQQvhzGKtw3sKF7OsquF42QJS8MvmbYFbnLP31jBwVPQqiTb2gHNetXWchGcSt8m08Zdu0318orbrQlhJbzyp8o2Dn0Csw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLu2OeVI; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLu2OeVI"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8f9568e074so689018666b.0
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 02:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776764240; cv=none;
        d=google.com; s=arc-20240605;
        b=NC7dtdVIDAxC/clzBuJTvFn17gRuYqcROMGNhVJezJl4j2YWIVYr2Jod4G269jnXST
         OKAb0MrbBJMKD+b36gOUVtebpIgLc2zsznApI5kwmjMa1JRljx4xaInIXAjKkWNttMye
         Lzy11hDhm7FSrHvhvBgeEbJEnY6okvMgpdyQALNt7WyR/7CQHBjEWB4BJ0ZvOCcc3slS
         5HZMUmrTwrp4jbAjMGeHqqCNd1Jgp4iQfFd4XkXDoCptJnKlrsRWz916C2aMX+5kvRZV
         uvCzjYLkrX6Pqw7DshnMjAeU2po8ljlZ6d0zeulBQ2vNOT5vPMdnNT7npGmFMoY8k1c3
         VZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uvlzapfWIsOIGZjSldUpiRDTEDAiLpD5RD5OPH/VMFw=;
        fh=SHI3x5EVMka9UFHiEZIXKJT3FJ/rsmCMaelDUrZsfTU=;
        b=B0ZhqUtbkyZ3gbZ+6mxdYUtobzamcXds7e9KqKbHe/a3PvQrxSo9j2l8ncuK8UYpS7
         8cu24M0EWyuTa+azUyeLBv/WXtrLZNDL19WmyppuzxoX7dSH0S2oLGJ5v2niU2jeS5Hb
         IL7vtFtmt568vsZiorLwPHxJLRN0Wk0owxPASTRqQBZvw+nOXaUK5WGXiKhNl5FlIame
         V0WeWG7HAujLSOiq8NP0goT13Lbs/Wn1ucAMwrlhkd8IIORq51x+bpQnkCiYyV6Q08Ib
         BwBN4Mf0mwwtO5qKBUFb28GpYNoY5oKkkjPrqCOyV2VcX1Y47wYyJndlg/bzBfTZUFLN
         DwMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776764240; x=1777369040; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvlzapfWIsOIGZjSldUpiRDTEDAiLpD5RD5OPH/VMFw=;
        b=jLu2OeVIJqJsKLfOFQom/KC5Ru9InzHjCfNBbMNVA6np2QXW8hJDrywetPTI0dUVvT
         EkvdzKp/2h8+Y1htotZLh3Di8DTWks4H44GcyzJOhxaiI7o9Rp5PiJgxGA8SOZit8eEv
         okDNs52Ob66b3/HXrsdeZeZJhXx3PRMI4ffH4T/G2LNik+Y0QntkrWelDr1Tpqmbt+Kb
         yTU+osnMbCZpJSy5S72Z0gJGDcoSLHOPSYUu4qiz97ZlVfsnVcFK/t74EQ8f7GsfPWho
         4yd+MvgrjsogEJWRdZ8f3UzoCT7iiTHXCOrSCQwOlj0UDxkP028328YptmV4BDvfftAH
         XOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764240; x=1777369040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uvlzapfWIsOIGZjSldUpiRDTEDAiLpD5RD5OPH/VMFw=;
        b=msh6bECpA5qTCU4ghGQLgABcYUHW+7qjorirpQoq5r8LxiRnpMqaov7oPzF86vpesu
         +Hw/dwUgZLPMms1bhjAfSU65UpF5AfCMCIuj3XyJ1Tv7xrDwodjof3VvsT7mC+xGlzAU
         51cniximgazXEau/nqvvlSa3qVuIdbl6FCLCap3vbMbqyQzsvqa8D3pGz2lVzHardtkt
         TbV/bbZdNu98+80yd7Wv3ghHhK6vyqYKCEUtu/3vdCOTjB6dYuOz4HSmE4DDNBmA0b0j
         px2rX2BkdRYFqQKUjAODr4nDIKEmxlNGBiGDvXJhFFSuiy/LcCOfIN6m+bfpmg3+dqSX
         PtTg==
X-Forwarded-Encrypted: i=1; AFNElJ/k/VX7+oWp/ZiCQEa6I8CMIxAc2F5AeAVtGwx3Alx/gPRUf9pqEd3Hn/r1NvCu0DAt7eGsrfEkRIgw@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2z6OdkE4kfLMSQwmrR8m6C1adw9zIAVYR6cQ3xCmlCVhvDyXi
	0JLmbCDYqHfhLsBDY7Y9m9C9NNJl8u22IZCe98JwNvaYH4NAT0UEl8yxFAjpUi+JXp/1T3I5wU4
	hyi9dNLgtBlH/IvWnvoP5YUUbqCaswTnJ3tTyZgU=
X-Gm-Gg: AeBDietLT5rEfvTXWwqXgELNA5NAuNabo8jzO+2VR1wKxjjh1Hh150fM6OZ/9u8ep8P
	xkpCDQN1dfEojG7HIaa/HUCHFUdX7jzu+A49vFHeUXX3OB/3uprtawhwNtkdRO/E7DoyXNXsdVO
	vuOH0nplJ+vG1UWIYymH6OUp/TvnFjcmhqxN9KBxj4q4jabmGQX1owI3t6Javp3sX4+/iSCUSAB
	2vEhkrHpkpEalQJitnQNmVMXZPchTaBHNL6P53wFaWa765yUb3pN18CN01dQY7Zv0lx8JTr4Q7s
	z8V7fgqsr3zrXziLYKSVTdc+Jp0Jwe5gNqlgOUlDrl2kqMY2K8ny
X-Received: by 2002:a17:906:ba8c:b0:b98:2462:959d with SMTP id
 a640c23a62f3a-ba41a91d88cmr931428966b.31.1776764239381; Tue, 21 Apr 2026
 02:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
In-Reply-To: <20260420221637.2631478-1-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Apr 2026 11:37:08 +0200
X-Gm-Features: AQROBzCnl7wdTfMDe3Nb78k7C94G_CyrEzZylxzLmqTsdM_Vmo4ACZe4OrC211Q
Message-ID: <CAOQ4uxhbR8AoBCUMYQntAHzo_1wjh=Qcpb1z0CE4ynfDE-ZAFQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/17] fuse: extend passthrough to inode operations
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> This series extends fuse passthrough to support inode operations (getattr=
,
> setattr), directory readdir, and kernel-initiated open on backing files.
>
> The existing FUSE_PASSTHROUGH mode attaches a backing file to a fuse inod=
e
> only when a passthrough file is open. This series introduces
> FUSE_PASSTHROUGH_INO, a stricter mode requiring one-to-one inode number
> mapping, which allows attaching a backing file for the lifetime of the fu=
se
> inode.
>
> Future work includes passthrough for additional operations (rename, unlin=
k,
> readdirplus) and full subtree passthrough, which will be part of a separa=
te
> series.
>
> Patches 1-7 are from Amir from his git tree in [1]. There were a few
> modifications made (removed separate FUSE_PASSTHROUGH_OP_STATX op,
> modified fuse_kstat_to_attr() - the full diff of changes is in [2]); if t=
here
> are any mistakes, those are mine and not Amir's.

FWIW these changes look good to me.
I don't know what I was thinking.
The statx code that you removed looks very silly :)

>
> For testing/debugging, this was done using the passthrough_hp server with=
 the
> changes from [3]. readdirplus passthrough is not yet implemented, so afte=
r an
> ls, subsequent operations on listed files will go through the server unti=
l
> their dentries expire and a fresh lookup sets up passthrough. During
> testing/debugging, I avoided ls and accessed files directly.

Maybe better to disable readdirplus for the time being when
FUSE_PASSTHROUGH_OP_READDIR is set on directory inode
to have deterministic test results.

Thanks,
Amir.

>
> [1] https://github.com/amir73il/linux/commits/fuse-backing-inode-wip/
> [2] https://gist.github.com/joannekoong/1e55f90c355a928eb5fa0ac9972c1d0e
> [3] https://github.com/joannekoong/libfuse/commits/extended_passthrough
>
> Amir Goldstein (7):
>   fuse: introduce FUSE_PASSTHROUGH_INO mode
>   fuse: prepare for passthrough of inode operations
>   fuse: prepare for readdir passthrough on directories
>   fuse: implement passthrough for readdir
>   fuse: prepare for long lived reference on backing file
>   fuse: implement passthrough for getattr/statx
>   fuse: prepare to setup backing inode passthrough on lookup
>
> Joanne Koong (10):
>   fuse: add passthrough ops gating
>   fuse: prepare to cache statx attributes from entry replies
>   fuse: add struct fuse_entry2_out and helpers for extended entry
>     replies
>   fuse: add passthrough lookup
>   fuse: add passthrough support for entry creation
>   fuse: add passthrough support for atomic file creation
>   fuse: use passthrough getattr in setattr suid/sgid handling
>   fuse: add passthrough setattr
>   fuse: add passthrough open
>   docs: fuse: document extended passthrough (FUSE_PASSTHROUGH_INO)
>
>  .../filesystems/fuse/fuse-passthrough.rst     | 131 ++++++++
>  fs/fuse/backing.c                             |  58 +++-
>  fs/fuse/cuse.c                                |   2 +-
>  fs/fuse/dir.c                                 | 293 +++++++++++++++---
>  fs/fuse/file.c                                |  61 +++-
>  fs/fuse/fuse_i.h                              | 112 ++++++-
>  fs/fuse/inode.c                               |  27 +-
>  fs/fuse/iomode.c                              | 114 +++++--
>  fs/fuse/passthrough.c                         | 170 +++++++++-
>  fs/fuse/readdir.c                             |   5 +-
>  include/uapi/linux/fuse.h                     |  33 +-
>  11 files changed, 871 insertions(+), 135 deletions(-)
>
> --
> 2.52.0
>
