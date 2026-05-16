Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F9F8460
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 01:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778895300; cv=pass; b=h/iGurpOOxkzke5UzNwi8S4Hbi1m2neQ3ImAK5GF17VetAeH6GFQyq25adrcJdUyuASGgZ99JXryK8Z3PfvgP3g3LnOVRXQWU//e8L7MVsaaGkA3WAZ9blsfVJwLYJrQedPlaKrYXI5ApF+K1r8dMDepgXKk50DWt1RQav6PePw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778895300; c=relaxed/simple;
	bh=F7km6eChtSyp2Y5Xq3EsA33guP/82gQchf6F9hXMOsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tcm2XVoEtrG+WMiErWP3GDrWPuMlJ/HerUosAaX/TE29KxHCqqaXYGnrA8tgpqi7CxRZs+vfzlcUX7LVlq5C9OEWxST9whpfmtXlehQug/h3zfzuvT7lKDncC6BomvpxBRPYXfpuEFK9cx84V4JCqtPafBBCIS/PD/nh4fU9dio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bkjy2DkF; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bkjy2DkF"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-453903ee4adso267072f8f.3
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 18:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778895298; cv=none;
        d=google.com; s=arc-20240605;
        b=Pz9isoStKEVzfgdqgKXw0a+03sFanRvOhdhAAwkFBQL+i1DBtzartr4QKDeygZQKS9
         B5fvaYLVYLf2+t7v1t5Iti79xd239UHsVZAW0f0WBsAbrj0PLhIapAajtMVw4v629l4X
         58RSCB1JxOxFVlPvZcKPiIMILhPmaf4jdMrruwL5wJshDA4CAsNeP4zVJnaZHRA857rl
         DKWnKA/iwDR3LUhgV9cTgqgN13tAm6pzOLACEW+HOUpzmrr0gVDHH9/K+81zvFytaMGS
         0lUBWVPCAVBkQ4x8ZGzsqxIYJYX/lHBulIyY+CyohQU4JlyaYRq65SIuxgHlvxWVxYM7
         cu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JstUOIj0O2wXj8D7NvhCFhebmhsNBhGSCHfWtO/MKF0=;
        fh=m/f6YJvJ+t5+4aY2YI3TD839gW/9+K7lKLC2GNVR6Rw=;
        b=KpQqrqR8SbnI9v2WMQ2T/7xx28yNRkc7yNm+d3WDu45VzTzOWII0ol1Ud5tMo7qlrC
         Chj6Q2hygA7YejVlb20Y8qo0qm68qN7YbhzHYfdcW+TghYIhKymJdOdJGx1PXG0caAkQ
         KuSqGBXjjbVO6hXBaawuG4EZfb/vyvp3+VyiflKCabQBKXw07szbAExy3NYiF6+dEG26
         TyZyRkA6G+xTyiHaaV80/YwAHrsOjgzVtVjJEaYVMZZ/bujG+wxmHb6KZD3o8GN3s3XU
         b+hj7mWCE64WWJ3KXvsrqx5EKRYBlJKU6aX91DtgQVsdYKRk3fd8ColezdCX80h68V1N
         nchw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778895298; x=1779500098; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JstUOIj0O2wXj8D7NvhCFhebmhsNBhGSCHfWtO/MKF0=;
        b=Bkjy2DkF62YpNZ5YT5MESQU5xk84wCL0GPvf4Wj8H64B05uQgWSlQnxQZrswFpkDAK
         vCxVioXIRyAAJvw3v8rxIx2/nZiVnl9ggcza2r9WrPyfvAHR9SenIzTjoJQlRuex+pG0
         j9jmZPPKKo1UelyBKk9cI3qw/DDykqg/R/FdZx20iSoG+t/dADmxovrVq90cs4Mci08H
         Eg3XQAflyQ8xPYMlHFuvHaBZDASm0RiUwm3AM2AKEzHIWZVFsoie23hikxrQ/eEZFMJ5
         wzTbiAd3CJg1lCia1sAcnCFy4IDzroWSTQC6tbU++IzZZsn3VfnznDBO2bTCtu9o97VE
         u2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778895298; x=1779500098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JstUOIj0O2wXj8D7NvhCFhebmhsNBhGSCHfWtO/MKF0=;
        b=pjDrQJKu+d2b/5GUyrSzGs/B6FmoUbzlfqXlJr5zFYBa2rk4f3B6J56yKhffmMeLg2
         K6rE44uyOTXlunJpLPJfpmYT0VgDsdeVESMbtSX0GZhps7M8t/8fUGUWuHOM+fTvhRFh
         6vCKKaCyWnQpgS5GMH3drVZUr+TVKo+I8N8YvOP36VmdXRuvpsCOxU1A+LC4EA6lMSBc
         Ls8O4fC069rxnrRzBclinD532gd4vEThJKXyq9vQKymbnp6lHHthpYtbNHkijO4/2AVc
         0oqcm3qNhJFh7Tc2r35LHSjNkWCjyF6sYUPn8cUwmZ4HNP2J22g6T65b5PH8t3siCQtz
         MNmg==
X-Gm-Message-State: AOJu0Yzjqu3pKxrbjOu0kQDDucmqlgQOzYkcpYzqH5My2J0M4Fo3Xia+
	IAaCfHgj73W5qAcw8ovi45McU2tg7LVSvKNo4mo6Wr9rjSaKvSJJI/8L6ea79SEn66Jp9ncxKXv
	jnk2pDR/GTNXcZTIWSeqS04KOt0luYF0=
X-Gm-Gg: Acq92OH0TYh0or8s+r3k0jLJc4zgPHzG1D1fPSbC/f4265kkKitPajrTgDJeWVD4Cb4
	YlP31uMX77y93SX7Wwz+0scUzj+LI6UqNODNttfiLXVmma5pNSJXXHnMH3Riiyh+CLDSivOWSLs
	pBSBUoB0HT5et6E67xcWH00Bqs5HXZFFWVzBWRllZepg2qS3khZHgailQb8oMG+xeE4x32J2c7v
	kV6ZjqHTkUTI6KmGzmMaotfQsvPtJYLSHjGa/TJMuWg76R075F6rG4hq8/7jfRVKSis+HCWdQ9h
	9KXiMiI5kFMuQ+dQmi3zT4q6hHk=
X-Received: by 2002:a05:6000:2f83:b0:43b:5097:6f62 with SMTP id
 ffacd0b85a97d-45e5c5952d5mr8537536f8f.36.1778895297654; Fri, 15 May 2026
 18:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com> <20260516004004.1455526-3-joannelkoong@gmail.com>
In-Reply-To: <20260516004004.1455526-3-joannelkoong@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 15 May 2026 18:34:44 -0700
X-Gm-Features: AVHnY4ILtCQ_AOG5DYsskxeKqoMXIE_zQsn_MfmhD8zGLD3sEbQFfZKyv7t9T4E
Message-ID: <CAJnrk1YUjqd+j1yLXuO0M07ueCUYNC0NqgwmQSm3OiY3hnhgZQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/21] fuse: prepare for passthrough of inode operations
To: amir73il@gmail.com, miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev, linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 5:52=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> From: Amir Goldstein <amir73il@gmail.com>
>
> So far, fuse passthrough was implemented for read/write/splice/mmap
> operations for regular files opened with FOPEN_PASSTHROUGH.
>
> A backing file is attached to a fuse inode, but only for as long as
> there are FOPEN_PASSTHROUGH files opened on this inode.
>
> We would like to attach a backing file to fuse inode also without an
> open file to allow passthrough of some inode operations.
>
> Add field ops_mask to the input argument of FUSE_DEV_IOC_BACKING_OPEN
> ioctl to declare the operations that would passthrough to the backing
> file once it has been attached to the fuse inode on lookup.
>
> Setting the FUSE_READ/FUSE_WRITE operations in the ops_mask is not
> required because those operations are implied by FOPEN_PASSTHROUGH.
>
> When setting operations other than FUSE_READ/FUSE_WRITE in ops_mask,
> non-regular backing files are allowed, so we need to verify when
> attaching a backing file to a fuse inode, that their file types match.
>
> For simplification of inode attribute caching, for now, require a
> filesystem with FUSE_PASSTHROUGH_INO (one-to-one mapping from fuse inode
> to backing inode) for setting up passthrough of any inode operations.
> We may consider relaxing this requirement for some inode operations
> in the future.
>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  fs/fuse/backing.c         | 13 ++++++++++---
>  fs/fuse/fuse_i.h          | 30 ++++++++++++++++++++++++++++++
>  fs/fuse/iomode.c          | 16 ++++++++++++++++
>  include/uapi/linux/fuse.h |  9 ++++++++-
>  4 files changed, 64 insertions(+), 4 deletions(-)
>
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 4be9ccc5b3ff..0f1e1c1ec367 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -243,6 +243,7 @@
>
> +#define FUSE_PASSTHROUGH_OP(op)        (1ULL << ((op) - 1))
> +
> +/* op bits for fuse_backing_map ops_mask */
> +#define FUSE_PASSTHROUGH_OP_READ       FUSE_PASSTHROUGH_OP(FUSE_READ)
> +#define FUSE_PASSTHROUGH_OP_WRITE      FUSE_PASSTHROUGH_OP(FUSE_WRITE)

Do you think we should couple the passthrough op code to the fuse
opcode so closely, instead of defining the passthrough ops separately,
eg doing something like this?:

#define FUSE_PASSTHROUGH_READ         (1 << 0)
#define FUSE_PASSTHROUGH_WRITE       (1 << 1)

In the (far) future when some more advanced passthrough features get
added (eg full subtree passthrough), it seems like we'd want to add a
passthrough op for that, but that wouldn't map to a fuse op. I think
there are also some fuse ops we might skip defining as passthrough ops
but are implicitly passed through (eg FUSE_STATX which is covered by
FUSE_GETATTR), so it seems more intuitive to define the passthrough
ops as describing capabilities rather than implying that it describes
what specific opcodes get passed through?

Thanks,
Joanne
