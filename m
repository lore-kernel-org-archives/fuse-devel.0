Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3A2346FAD
	for <fuse-devel@lists.linux.dev>; Fri, 17 Apr 2026 21:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776462778; cv=pass; b=eCPgL2jQbggtswA3WflQFFDuNRve96TMr20RmEDpPQBnJW4PmpRUO6MJpeGDZjpTdnd0k3+FECgXGg0iCQj9ia0M5wUADbqP2lTnm3VgmQ3ox/57rE8F1NUCaiZjVewLxGXU3xEadDyWzef2IwVPpTFDbvIsxfD9pSsa6hABdbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776462778; c=relaxed/simple;
	bh=gDhAomle2l+OSFQeZ748+yzZnfkAx6M3az/HVqXqp4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/ij6K0Uvm88gVSrml0G3emyAuXB6WNme4mRnm8W0/YTLs5SjwxUVwvgYAZGWmC04Hvd3mxBiafKHO9NqThec46fQdwKw/nZ6V90MJDFPTjgB3+1Xe6WvEPxi57vFkMOsSno3qPp0nWShlLfXA3KXs0VzdRsXYngPEfU41V1Dy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bm9SSSZA; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bm9SSSZA"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d70b3e159so550554f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 17 Apr 2026 14:52:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776462776; cv=none;
        d=google.com; s=arc-20240605;
        b=VdiasjT8QbCQk5EX2kEh3PQqY8owZIeRfrobF6Kf63TSKiT1xVWg6uDjT1+rJ/VRE8
         Kzjrxaf/Vcn1S6d2X2Tb1AXFOzv3ymsChhhebeTw0qtGEBhRL3WhLCNiWAtcfjZZF5rs
         kkxGq4zv7JF3oxtLRjgZZ/Xwku0cnSsRcL2kmwA76nHMA8vohivPvJH2Y3wsLCL6g993
         3lc8qEM27jEPG+otC0ftsK5tlnt+GXUSInfnU01yOAEAAo2U4UVnb3UA5SrS1teDhoma
         UIMB/iWrmRlmLvx1wKWB5RkMEgyZDbqxXTN+uHGIeMMYlNUSo3K5zlLhdxVJzgDpDRD7
         1TMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sLU/BKCA6tDfkOm9P3zBUOXG/ey2CPFE0fCKgZ58HUc=;
        fh=oSLQBSy3sy+srs416Fb9Ll8GcR+naHymI7Ry1FvZYFA=;
        b=etRanBO17Bd0cmZ/mu/HTnb9Da4fG5H2sdjoVy87EHDxjXZ2NRXV7xBZLi2AN3JnJ/
         Rnqp97d1yFINCddnw/ohDGm8WeuLC8jMjOwUtz6DPuRhg37yUBA+N/F6zWxxcAlmbcKn
         sSMRkONHplntgM97nWbEWYUNANldEI2OxKh4JE0ZuQiJqoD4u8TAHmFoNRP8+PGHpZIM
         tlrY1kf4vCewhaM/1GB/QckgiCMax/eNfV8xSYmc6em1119pLceiae6uKWjGfELX3RYy
         VdHPuKX/zy1CV4QqWf6/QNBwAzITIom05k5KXnelwMvK/1cGUi34kMVX2eiZ3US+/OaB
         hPsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776462776; x=1777067576; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLU/BKCA6tDfkOm9P3zBUOXG/ey2CPFE0fCKgZ58HUc=;
        b=Bm9SSSZAsKnePcVylsts+dzzANpQl6wlJjzReyI8Ep4S5Tav6uhyPxQBxj3tMSB1B9
         JjQ7PzGzjjCYne9tefT03NCkJkzhsanuTASwujv39zEakV/QPOSNBTFek5LbbMlRG4o/
         pOOjxNtvFzdsKg9ULTDuBDlSujqq1kbE9XppgwqCZqz3X+nYeeL3iGKgANQW61DIoaEK
         ySxPUPovV0gpUyQpSeGfDHlY8I60YK39zJJCgVHCkGGMyD+D5YFnLa67aSNQh6q00cqV
         +a9AfYY/Tg9DJ21Tv0fkbiATtsUeWWaN2NWqssUeylElEOaeeoUlztQGj9nYz0GJmomj
         moMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776462776; x=1777067576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sLU/BKCA6tDfkOm9P3zBUOXG/ey2CPFE0fCKgZ58HUc=;
        b=TvOtIOfl0EqsCg9c2Cgah1kKa6SnBtMpeesvZt8kFcYd3HTPXf8w7Ym2c1wZTFstwP
         IxnqLu/ekvf6o6imtob5R1oR3VIcgk+KwLgJF/uO6bg4crXkPYMrEXfnYo/flzaMHf9O
         SXVcaUoJc8VMKSDOGUmhu/sUqeHNe5hS/8PVRevhC0pHY3E9YW9W1Zd4sXSQf+hXYAnW
         iEivtmRTyi2eZJ8EK3PZ75CS9P9UqliObNC6DfpdT22IiZeomCjAGLFvr/ZyA/DOCKRN
         7VEvoA9ryFPsaNkSlSNb/Cwxm/g3EcwqY0M7hSDJ3YludRQkE8L+qpcbPLXWaLW8VTiz
         WDvA==
X-Gm-Message-State: AOJu0YyA+MiLmMgOh+9Xo16frvp7Wn4iecNGi4z1u/fRyhheAiUvOT4q
	ku8l7FScr+J8NxCuuCsqiwXy1kH+zv5cPuExK1cEuqyMUWcYY18prAZoKSgBnvoSV9RmjLvYzCB
	JhjKEgqBIwz1TWKGfwGXGA797BOZKUQE=
X-Gm-Gg: AeBDiesuWcFZIUKyMtKJM8aoyuF06c5QVVbmm9F1HQq+ihmLxWWqgZoUoQ1ZoBj6GQU
	8ReTynONb+pimbAl92OsG88wElHRKGOgd+ijH6FDGP02a4GGhrCmgJsPSUfFgZJb2enqbeAKd3H
	L+njatidn3tknSHS9vltPc9Dh9cSJ3KvPMlaQMzRm0XlIJ6It7VNSOHztALN4/gLULLesn1sXAc
	F2pZFzpIMq11Ww/xuwgfeb7AnXIKPBJD5FSUq39Ns+1YeXuFFK/MA1N9oRAuzny5fykZwERfOfP
	s8sTHs5DHYQ1fxby
X-Received: by 2002:a5d:5f47:0:b0:43f:e262:f4b2 with SMTP id
 ffacd0b85a97d-43fe3db3773mr7161929f8f.3.1776462775377; Fri, 17 Apr 2026
 14:52:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416091658.462783-1-mszeredi@redhat.com> <20260416091658.462783-21-mszeredi@redhat.com>
In-Reply-To: <20260416091658.462783-21-mszeredi@redhat.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 17 Apr 2026 14:52:44 -0700
X-Gm-Features: AQROBzAaj2_K_sXDaygl_Ux8yPW6mhh9rfQ61UrzPVuRbd4fTGrotUVf0hs8LI8
Message-ID: <CAJnrk1Z7cgKGM6s5CaOg9t+qQ206otDop6YdzGmV1dFw9M3KSA@mail.gmail.com>
Subject: Re: [PATCH 20/32] fuse: split off fuse_args and related definitions
 into a separate header
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 2:19=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> This is going to be used by both layers (transport and filesystem)
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/args.h   | 65 ++++++++++++++++++++++++++++++++++++++++++++++++
>  fs/fuse/fuse_i.h | 53 +--------------------------------------
>  2 files changed, 66 insertions(+), 52 deletions(-)
>  create mode 100644 fs/fuse/args.h
>
> diff --git a/fs/fuse/args.h b/fs/fuse/args.h
> new file mode 100644
> index 000000000000..ecfe51a192af
> --- /dev/null
> +++ b/fs/fuse/args.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _FS_FUSE_ARGS_H
> +#define _FS_FUSE_ARGS_H
> +
> +#include <linux/types.h>
> +
> +struct fuse_mount;
> +
> +/** One input argument of a request */
> +struct fuse_in_arg {
> +       unsigned size;
> +       const void *value;
> +};
> +
> +/** One output argument of a request */
> +struct fuse_arg {
> +       unsigned size;
> +       void *value;
> +};
> +
> +struct fuse_args {
> +       u64 nodeid;
> +       u32 opcode;
> +       u32 uid;
> +       u32 gid;
> +       u32 pid;
> +       u8 in_numargs;
> +       u8 out_numargs;
> +       u8 ext_idx;
> +       bool force:1;
> +       bool noreply:1;
> +       bool nocreds:1;
> +       bool in_pages:1;
> +       bool out_pages:1;
> +       bool user_pages:1;
> +       bool out_argvar:1;
> +       bool page_zeroing:1;
> +       bool page_replace:1;
> +       bool may_block:1;
> +       bool is_ext:1;
> +       bool is_pinned:1;
> +       bool invalidate_vmap:1;
> +       bool abort_on_kill:1;
> +       struct fuse_in_arg in_args[4];
> +       struct fuse_arg out_args[2];
> +       void (*end)(struct fuse_args *args, int error);

I think you accidentally dropped the first arg (struct fuse_mount *fm)
when moving this over?

Thanks,
Joanne

> +       /* Used for kvec iter backed by vmalloc address */
> +       void *vmap_base;
> +};
> +
> +/** FUSE folio descriptor */
> +struct fuse_folio_desc {
> +       unsigned int length;
> +       unsigned int offset;
> +};
> +
> +struct fuse_args_pages {
> +       struct fuse_args args;
> +       struct folio **folios;
> +       struct fuse_folio_desc *descs;
> +       unsigned int num_folios;
> +};
> +
> +#endif /* _FS_FUSE_ARGS_H */
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index b8655c3b48e2..22a6d58678ad 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -13,6 +13,7 @@
>  # define pr_fmt(fmt) "fuse: " fmt
>  #endif
>
> +#include "args.h"
>  #include <linux/fuse.h>
>  #include <linux/fs.h>
>  #include <linux/mount.h>
> @@ -288,58 +289,6 @@ struct fuse_file {
>         bool flock:1;
>  };
>
> -/** One input argument of a request */
> -struct fuse_in_arg {
> -       unsigned size;
> -       const void *value;
> -};
> -
> -/** One output argument of a request */
> -struct fuse_arg {
> -       unsigned size;
> -       void *value;
> -};
> -
> -/** FUSE folio descriptor */
> -struct fuse_folio_desc {
> -       unsigned int length;
> -       unsigned int offset;
> -};
> -
> -struct fuse_args {
> -       uint64_t nodeid;
> -       uint32_t opcode;
> -       uint8_t in_numargs;
> -       uint8_t out_numargs;
> -       uint8_t ext_idx;
> -       bool force:1;
> -       bool noreply:1;
> -       bool nocreds:1;
> -       bool in_pages:1;
> -       bool out_pages:1;
> -       bool user_pages:1;
> -       bool out_argvar:1;
> -       bool page_zeroing:1;
> -       bool page_replace:1;
> -       bool may_block:1;
> -       bool is_ext:1;
> -       bool is_pinned:1;
> -       bool invalidate_vmap:1;
> -       bool abort_on_kill:1;
> -       struct fuse_in_arg in_args[4];
> -       struct fuse_arg out_args[2];
> -       void (*end)(struct fuse_mount *fm, struct fuse_args *args, int er=
ror);
> -       /* Used for kvec iter backed by vmalloc address */
> -       void *vmap_base;
> -};
> -
> -struct fuse_args_pages {
> -       struct fuse_args args;
> -       struct folio **folios;
> -       struct fuse_folio_desc *descs;
> -       unsigned int num_folios;
> -};
> -
>  struct fuse_release_args {
>         struct fuse_args args;
>         struct fuse_release_in inarg;
> --
> 2.53.0
>
>
