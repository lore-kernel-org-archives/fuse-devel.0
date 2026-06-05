Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BC64BC014
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780650406; cv=pass; b=Fo6+yU3+lOpgHCWxp9xO53JH9RZcInYLg/l5JzKmsS2CF1BMzsiPRcZlyK5z6VJvAimxnoKbMIDy65iWmLs/LyYqiLyUIFCI/3spKhn0L19dmcGGjBnzCILFlQu0XP4hdGTCXNIXISbvuwxzdzSUKy5j77vDJnHUbHjc8Th/N6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780650406; c=relaxed/simple;
	bh=N8qtdxMc9FvLeauKjzXElFTLChhKrM4qeRXr0Gv5hMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGtZ3/ngsLKKPr1RkmfMHp1kmptg6J04ZL3XHHkAuOFMJPPCyQJ1lj+Kfr6ujlsCJ2czpXb/PVNpqw3yB8dnpNRDLvyVEw0rlIeQI/nKq4IQKEnSu8E7YcAGAS3CNDbCiV7KYToKAMsb2C5wQCkTl7gPtkfG04lvbs2tFWr15XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciOUPWGd; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciOUPWGd"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68bac6e24fdso2369497a12.1
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 02:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780650401; cv=none;
        d=google.com; s=arc-20240605;
        b=bOaDMBvfhOeDBeF7Ss2ZDPuI8LMPKmdJ9nBaos0/mgfUaSl1+SP7oT89UpoNumUFie
         7v2N1wZEg/Y6nJpkZQGSkuj1KkS50kg+ZqdkVlke4p+lhsZRd0DwBdcOJM3LYz9urhF9
         s6ZWnL8Vlj8JKhpAIqc9IIAPdIR3Tn6akjGErKh0UiMrQblXWIxH7mQfxLxJbdiGgPM7
         W3/8fpY8Cj2YZPL8IuGgxwkokLOL2QlInZ65wSaH5+RthfB6m78NUIM2YqEVw35fX+Wm
         1+DH82BPvy6DGeP5aPUtbISizKCLp4teA2Cox838cxAvVEsBPgDLlybDeYhKeUg7tzH4
         KSPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zFzbZMpTUnNwaEuH74pi471fj/IDldYJaiG/NWnnyFw=;
        fh=pPQZoElwb2SC7ge++6m4C9/sGZNQBiwwAfItb/JHz4g=;
        b=hl2xIH7XMuiZi3WE1w+nboltLk3XqMAssyUwmPkjXSITnlMHdrZnhBUmgCC0WH+do7
         5Vz/h0bT6a8OjoDiKgDOFxWSmtgzwpiNEz5JU4rurBU7XPj4FJmt7Yk/snmtvixH93eG
         7y8Hqxmj5X6F9YE+c/FysyRWEADsgd0UsLIU5FCT+aR0GSgHjhjsorEBe5fdCfFbMqOY
         PW8/1Jz+q33W67PVsYYHht9dSX3aDdonm2kIcWobGHebRGq8CEZq5FuW4ynD5pX0qu4B
         8dKTGIZrS9D9yBpW1SH+fHNIyK9QLqPzrEEn2pNSGsZbt+WOi4CitGEFn2q8jQSz6ot+
         7IoA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780650401; x=1781255201; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFzbZMpTUnNwaEuH74pi471fj/IDldYJaiG/NWnnyFw=;
        b=ciOUPWGdZZtsrTdAWCF42WbQReBYsjcBqJd2dpaHbjkpblk/1TElyedXjXpRm0ldDN
         guRCQASltniIJB2EHCs/NgdB1WoFKHY0LtLy1NOjh8IQK8GzPbj9lk6aLGkGChdlbErt
         8Y4lM22eae+JHWd74AotFfX0MMkJLHIqKlaErcG/02NW/k3/iI/+QMzBYWhUCd1wAgN9
         gvXiWuTmtDxuA9tjBBIRROw5A35LBwO+83APRaUi07fJrzJ+smNWPjzqVrOu8VXh7U8R
         1rEcu24tU83CI2vsSUYQnsWO+bGQs0Uai4Vq3oNKa8eC5PU3CNAU73B8XeYBymKit/+T
         nejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780650401; x=1781255201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFzbZMpTUnNwaEuH74pi471fj/IDldYJaiG/NWnnyFw=;
        b=JZ82k+J3s3XBRSNE3RrA3xTUNCfZXnqdwDtz40wtziMTFBnNQC3rbfhfOJ8HlQzpjA
         6BHd3w7oX7VOOaBei4hKG4BFNlfmGpfYobOQlwNSvHqp8/7suT1Pszu/LdbzrzEVu/Tn
         YerjBXa3RCa7eNM7rzE2IUPgFT1Ld+sehehYRWW88m4QO/+TRHeMdcUtV/eNYy8TMweQ
         0rmvefBEEEAuemJPe7P6Sm4uBEbHO0s7/UohbdhCu4OvfzVHQs+i38hab9s26/OYQpry
         qiZUfWOcEI7aGWl7MKaeMWOrAtNaHktBwusvTwlKobxlYLq11XJ5HadDmZrEksFIb1G1
         ceKA==
X-Forwarded-Encrypted: i=1; AFNElJ+gdWCLU6ZyDcK7WjZm182M0Bxu7b+aWoah6s38Tw3u1PuuDFb371Eg2uo7uASgqr1sNnjXgjNkvmL3@lists.linux.dev
X-Gm-Message-State: AOJu0YwpMowy6VGLEgrarFNVxCELWfJimPEqSO8uPwqynmo5y7kabZbI
	DMXKHdWkfAeNiBeQjKKIsCZ/VLQxuIBpw3a0EfpSJb76NU9P13HT1nztBztXjpC0mbgcrKgUdI/
	GEmuNNHkIAGaMumEB9hy4obFNPn7pnifMx4nZjbM=
X-Gm-Gg: Acq92OEVguMFjA6sxnUlXDQL5O5RJfEv6ORqjT4iP7/Bp/U1kFziJR548PNvh52Dqp9
	K0I3djnEl+NbmjiH9ScLSsU3+oJR65u0MecK/D8Pu/4Uerwb09qjUiHr0j3lyXkQdtiEm06GtJS
	fd53IPBjm9tpvhlw8uBX7+DQmDbA6XFLniazu44xVKEBrVxQz3E5OW3eLZhX0BKnBCcqUryrgFy
	GkDpEHCqXsnfalSiihXmK3EMyqO/kv4smx1fkDc6PoVKmhkFaDjg/tYkL8+0EHOzdGIj1nr4NqW
	o7ed6VM8Qfpyq2euL3ncpfgEQeZe237UAhbhpZ16a0UFX3/hoj3T
X-Received: by 2002:a05:6402:3553:b0:66d:d2f9:520c with SMTP id
 4fb4d7f45d1cf-68fa514446emr1215917a12.19.1780650400982; Fri, 05 Jun 2026
 02:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601152327.2069787-1-mszeredi@redhat.com> <CAOQ4uxjFg4rjwGjU2LvZT6AhC+gBk_6Ej5S4p4DKuk8=a71cRw@mail.gmail.com>
 <CAJfpegt5Q0nmK0JKAfa4Bp_SydR1qiqu7pB0JKkXSCFOYSVDDA@mail.gmail.com>
 <CAOQ4uxgc_pW57_xeHjm6xauB3Cfx3ZY3Y-NaXO_xvL==vKcFOQ@mail.gmail.com> <CAJfpegsiA9A8tc0w4JdQ52k2qMr9UrYFF3PRsxRTd1PAfhf4Wg@mail.gmail.com>
In-Reply-To: <CAJfpegsiA9A8tc0w4JdQ52k2qMr9UrYFF3PRsxRTd1PAfhf4Wg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 5 Jun 2026 11:06:29 +0200
X-Gm-Features: AVVi8CcdRAlIiPloYzw5RSnvG9yZHwiE-X4GIMxl7DFYongGg09g6ymP-gt1ahg
Message-ID: <CAOQ4uxgQUvpp816ZNX5YZXm9pAzn5DyAwxX4npTfis=0FZOLKA@mail.gmail.com>
Subject: Re: [PATCH] famfs: FUSE_FAMFS_EXT_INTERLEAVE -> FUSE_DEV_IOC_STRIPE_OPEN
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Miklos Szeredi <mszeredi@redhat.com>, John Groves <jgroves@micron.com>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 4:09=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu> w=
rote:
>
> On Thu, 4 Jun 2026 at 09:39, Amir Goldstein <amir73il@gmail.com> wrote:
>
> > struct fuse_backing_map {
> >         int32_t         fd;
> >         uint32_t        flags;
> >         int32_t          id;
> >         uint32_t        ops_mask;
> > };
>
> Or make backing ID 64 bit (same as node ID, can cast from/to pointer)
> and ops_mask be part of flags?

Feels wrong to mix them. I would rather extend fuse_backing_map for
ops_mask in that case.

But note that if we support 64bit ids, we could not use the idr map
and fuse_open_out and FUSE_DEV_IOC_BACKING_CLOSE
would be incompatible with this id, so do we really need this widening?

I agree that it would have been useful to map a backing file directly to
an inode on lookup, without having to go through a backing_id mapping,
sort of a compound LOOKUP+STATX+GET_BACKING
but there is this security risk of writing an fd using write() syscall.

This risk is not relevant in io_uring AFAIK, so with io_uring we could
map backing files without a temp id unless the same backing file needs
to be shared among different inodes or referenced from backing stripes.

Anyway, if you think we should reserve the place for 64bit id just for
extendability I have no problems with that.

Thanks,
Amir.
