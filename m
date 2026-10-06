Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E011720B80B
	for <fuse-devel@lists.linux.dev>; Tue,  6 Oct 2026 22:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791324542; cv=pass; b=ReosANMDIy+cTl/X9psrVnKVB3ZehovGubiFh9gtrpkzcKiJzUUBHPDwo0NOKslX3VB5/FoS1sKD2Vb7+u2iV78hoI4JviCnGu71GIK7cQjhsjtvv7gouC8nol03B12fghIFXVhHqsFj7INMF26N1K9v9K+IIpf8yY/t87ZN1a4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791324542; c=relaxed/simple;
	bh=FVulpAnYmlaz6ZGBqEF0kXcLNEDT1/mgk/OAXn/LvVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ec0wdi2LqkOttH8eGHrMk/o30XLF/t8ALrOE13lpL/rufiNbev12+Ulwk10Ty8mjiVpHwbFVPR1JJJlB3IVZI1p7VbbBx2aIqHsTYUqQ11VzBBDp6nGyJL2zasIeLWTpYx/zElEqndSLIfwXJdHz62lmsIvu+hRvz+otcXJVb2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCAKsNoE; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCAKsNoE"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ab006eb282so4979583a12.0
        for <fuse-devel@lists.linux.dev>; Tue, 06 Oct 2026 15:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791324539; cv=none;
        d=google.com; s=arc-20260327;
        b=McOqU05hNxAyZiSR/kdxB0nboaKJ6NL5K4Ti3yst6YXoxztI/sX5E07aRHa6zUqi4u
         4CM5WihZsSjx6c1gPdonST+5XQzt70NUJeEODsrEIsMP4RUjHGRVSD0K/ZA7E0uHYgJQ
         7a4tz7d4iEgYLKjG8JXaqKp9gvdZ9oAbltqKDn0I5n8EcMk8Jja/jMiRnqZ+9+55Cw6e
         2n9SBny8hd4U5zfBd3BZuquOF6e9Bp7pSEh6xhwIl1ag6fJlHAM/XDne5sWk3imr/bdG
         HSCxL9AaaaLmcKUIaVzsZgKrTgfdRq2q2rGqHHr/ZfXhCJ3IRe3eH8tAaGvW54Z+U8U6
         GekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Vo8bv/Mw9ldCtrjaA+pK24JIKyIXZlS7hf38pMZ204=;
        fh=yraj4v+bqSXmxjjMpn1/atBIsHsRegvA+ny3Ua/6dVc=;
        b=A7TqxhqS6B4+LKS/cO2qcB1gAHrexRaUXPnb87PU1he6owhOPA07kIe8ayFmEa+KAm
         yyX1TOlaWSKepWKsstI14xrsbSaQcbMKVBWSvuLDPt5ACaAvsro5kiVFcsB9XRC5Vxvo
         KuHnhNWo/9w66z2Af25+zHuuefQlmZtQq2matoL9OafQoRmoIdinL6so80gp08m3VRIq
         aeeFmBpqS8KiB9P4FonIdeC3JOS9HCF0BvMMDaWVmXly9oJWp60y4B29tpERpvRioCpt
         sSOtUVPfpY8s1B+y/Ibr/DcfVgTjQPLYbXeU5SkT0ApFBZZF3a2TKZ9PTw9Rtmj2/xZz
         PjFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791324539; x=1791929339; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Vo8bv/Mw9ldCtrjaA+pK24JIKyIXZlS7hf38pMZ204=;
        b=aCAKsNoEkJ3jN4oRHf14V6igtFlUpMczxJRXeUBBwi4rg+77HVvQEjxMr0EYA9fG0z
         oy3+UQnQS4U4MP2/D/tWgtRHMVzncNSgZXFD+/Q2DHMGErR1Q5cguLBkosRP2K1MRG7l
         vOgjCtGeDfuYU7DgWZ5K+KaexkWj1MLFHYCddy46dEQ0UXoThL7DJM2KkhoLq+PctxbV
         V/lnoJsHvP/lJyDCwONuCm9u1cqtTPixp++gc1wbNJOwOQHGyPK9ypbgBt9B3yzEOrSW
         zJ8igvoxreGkgPU0pUBoaxVaU2C/WbUFl5KkG7Xe2rVZ5VAI7VgUEDOhDQkXSM9nFyRj
         ZQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791324539; x=1791929339;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Vo8bv/Mw9ldCtrjaA+pK24JIKyIXZlS7hf38pMZ204=;
        b=K8RYUCWKHZkR4fUsbTCHxxCprCUc12LyDIlUiU/cM/zd9VeADjGM8ahGv/B8eIvtO6
         H3z+RCYDOhFzkF3qGFAyq1V3JOiNyUHmkWINL3OgjkJ8mcicIYpWORH2KjuoPTJ4qvr/
         53Mliapp8frorpfQpB2jTC0LjwoJJtrfDPMaVCKS7DYQrH9N1jUl53g6/AKSg3rwUxTl
         hakTbcZS+EtSjl3zX8OCMJFpXpxbMhvugr/MCjFtkYzcgrqsR8xsc2MQi1R5ImbR1R0S
         b6R5tDNNounMlaLpX3BurT8bFML5dV7eIUlAu0AsU3Ez8RbG5ZdLLlUK1+RZOpdnJENE
         9k/w==
X-Gm-Message-State: AFq9FYJYp2Z9EiQ+oR0UCWaEFr6UEmO9P6KUr2kjf+Qn4WENuoFQTysm
	giOBfU578JZHW7eA7si0xHtOBopHy+IP0IGnHDXnS/TXVQdQ1PxPtKAX5pUyP7o9YI9kRlJKlM1
	2+2FD4z2E3Jz8Td/cp/OrEASiYIfAFWg=
X-Gm-Gg: AYBFou2MYutmIUPVtWE9JQTdl1W5c5T8FSvLegh4EpMAymtvyYC05GIHzRW3ShnrWic
	dvrpydFrgHAv0O4MLWIb5YJYXShkqs8Nv8ou4YBQelwLZTvftsUdQdBT5HDtglYjct1kbk/U19k
	9tKilzZSai0Ksv11xupPpk/SY002mCK5SjRyatMSNbpcphL896DV5cwgsGmhICu/wjThhktWahY
	Xv6gbU4pyXY4m6+gAIFxku/j8anm/SDSGxa8DcD1/H0NXEcocp2jiyvCSpnASx7OxYHHvFWC3+3
	B6HJWGk8fYWAMP7L6KdeET0O4VO3KQyiHT/fjUefISgxosF6Iv/UC1FYZ7PbpO9rr5qS+m0zWSl
	uii90zly63vE=
X-Received: by 2002:a05:6402:51ce:b0:6af:bd48:4b2c with SMTP id
 4fb4d7f45d1cf-6aff2daf769mr405047a12.5.1791324538890; Tue, 06 Oct 2026
 15:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261006180115.1425232-1-mszeredi@redhat.com> <20261006180115.1425232-5-mszeredi@redhat.com>
In-Reply-To: <20261006180115.1425232-5-mszeredi@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 7 Oct 2026 00:08:46 +0200
X-Gm-Features: AclHuK-kNEGr89TsaMC-r6qkBAXhNslF5fmkkNhAIDRFq3AWhso05mVTqiKMWVw
Message-ID: <CAOQ4uxjRAgNKEKOj3yrh0fp_uBdQ-G=5C55G6M8vyjWgp2zvoA@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] fuse: support 64 bit, server allocated backing ID
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 8:01=E2=80=AFPM Miklos Szeredi <mszeredi@redhat.com>=
 wrote:
>
> Add support for server allocated 64-bit backing IDs alongside the
> existing kernel allocated 32-bit IDs.
>
> Opened with FUSE_DEV_IOC_BACKING_CREATE, the backing ID sent via
> fuse_backing_create_in.backing_id.
>
> Closed with FUSE_NOTIFY_BACKING_REMOVE.  Since close only provides the
> backing ID, not the file descriptor, it doesn't have to be done with an
> ioctl.
>
> Backing ID can take any 64 bit value other than zero.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/backing.c         | 179 ++++++++++++++++++++++++++++----------
>  fs/fuse/dev.c             |  24 +++++
>  fs/fuse/dev.h             |   3 +
>  fs/fuse/fuse_i.h          |  24 ++++-
>  fs/fuse/inode.c           |  15 +++-
>  fs/fuse/notify.c          |  28 ++++++
>  fs/fuse/passthrough.c     |   3 +
>  include/uapi/linux/fuse.h |  22 ++++-
[...]
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index cbb10e19e7e8..b5b51865d59f 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1408,13 +1408,24 @@ static void process_init_reply(struct fuse_args *=
args, int error)
>                          * them together.
>                          */
>                         if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) &&
> -                           (flags & FUSE_PASSTHROUGH) &&
> +                           (flags & (FUSE_PASSTHROUGH | FUSE_PASSTHROUGH=
_V2)) &&
>                             arg->max_stack_depth > 0 &&
>                             arg->max_stack_depth <=3D FILESYSTEM_MAX_STAC=
K_DEPTH &&
>                             !(flags & FUSE_WRITEBACK_CACHE))  {
>                                 fc->passthrough =3D 1;
>                                 fc->max_stack_depth =3D arg->max_stack_de=
pth;
>                                 fm->sb->s_stack_depth =3D arg->max_stack_=
depth;
> +                               if (flags & FUSE_PASSTHROUGH_V2) {

Since I was contemplating myself on whether I should also add an init flag
FUSE_PASSTHROUGH_INO, it occured to me that arg->max_stack_depth
has plenty of spare bits to host FUSE_PASSTHROUGH_* feature flags.

So if we rebrand it as arg->passthrough_params

#define FUSE_PASSTROUGH_PARAMS(max_backing_stack_depth, flags) \
             ((max_backing_stack_depth & 0xff) + 1) | ((flags & 0xff) << 8)

We could use a feature flag  FUSE_PASSTROUGH_SERVER_ID_64
instead of wasting another init flag
It also avoid the unneeded questions/documentation/awkwardness
regarding FUSE_PASSTHROUGH_V2 with/out FUSE_PASSTHROUGH

But mostly, it leaves room for more extensions.

> +                                       /* Prevent race with fuse_backing=
_open() */
> +                                       scoped_guard(spinlock, &fc->lock)=
 {
> +                                               if (fc->backing_id_32)
> +                                                       ok =3D false;
> +                                               else
> +                                                       fc->backing_id_64=
 =3D true;
> +                                       }
> +                                       if (ok)
> +                                               fuse_backing_files_init_6=
4(fc);
> +                               }

See my comments on backing_id_32 gating on the v2 patch.

Thanks,
Amir.
