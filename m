Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EA5946A
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 01:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820375; cv=pass; b=gA2f1DgZ3kfc4lK8ljCow8OKOkV8l3/wKFBsP93QyiCQ5E/cC0DTdmXxj7lI3VE+WTHSTcpa6AdBM02DQJkhT8SdKmZYRzEnJd9FT7diXvZoZnERjtdG25IS9jIAt2/xtT0zHWpwmOfJHlcOpv7UXAYYxxUe/4V8tiYq6bxWUgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820375; c=relaxed/simple;
	bh=5Kpzf1z/QXKri3451zC4pCm8GpjWWMaSJQPAtRRk+wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=quZMfF7BM2O79CeJl/Xt6/4PCkcJCTFm2u/hAlDUXp+ESD4HevUB9+l938kUGMDrwZTeILx/9uRR3x5kCaB3tkZ5lA2TnoAsjkOzq6GqkztVVnUR0Od1xMQOxjUSwRN/pZGJXaBu1ZMM92CKEizYkDvb0n+oecWNQpMN1W3/lqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzC/GNzn; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzC/GNzn"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488d2079582so56652135e9.2
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 18:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776820373; cv=none;
        d=google.com; s=arc-20240605;
        b=MVe0TpLm0/JLRWCrNAmxkVdewtpSIRjfxk7GCYqwFVErqpWzuOw0+flTk7YU7aSNtM
         eJfQ7L/shqblqc0JiPSpz8nqNAE8Gydp2mHB93gMiBVFhHfSzsmQv85pTvyXi0BQPe9S
         9Or4dmpw5Mkt9AmqqME1OIyO3V9mW82ZVa0a+3MDvJWFdH064LV8KrCLebpkCiulWDEr
         /txHSDRa8LJkGCck1eAbmTZXIF8Vcc1P57kRweBo/VLEiXexVK1y2UP+PQY/ItPeCHLz
         hAwXW8N8+w0KWC4eDlqI/IYa+cf8jR1XlekIze0vt5U0yzpPxNrrIJznNtAxGgYQtDgO
         QpLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PmzP215krYFl2YDqXJAWJZnkyXPolY3vOORJ80u6E9w=;
        fh=RbjPxWWzErxKjh2E1KsXZgovrNokUrTX/HRYB8fzPG4=;
        b=UgTUnK9/LV/SIfbbpPwqdtj6wIN2y0Cs1hzmDTPP0xrfeVpWj1FilOt6aMtpjDIsEJ
         GT+ECmaBtW6Ns4e+miMPXtOVbj+8pNPHL2Cl5Sw2e2y84/KcgDCHTxIFH5j9LVCU+JJO
         dXUxKoFSsR7FPoETFPK0uCLBbeR5eymMP2X79lmSvh69xjR3xXf20y8DkwmuCYkZqkeH
         l3tKHtMtuhOs/F8lGcpTiM8HbVWF/IWcQLXXVVNXjIQS5+bFZY4/xrDnQHvroqH54rDz
         KJm0w8aSvdSam++edvCPOswsA6IA/j2pOgt8N7NdpvBSMai4TXSLKT5KqXwg8aDg5KQu
         i5IA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776820373; x=1777425173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmzP215krYFl2YDqXJAWJZnkyXPolY3vOORJ80u6E9w=;
        b=WzC/GNzneuS6j0EyeJ4dUovp8czTxywFsfBZ5BxHS5BDC6aApGsqQJio3YqTI/Hg/X
         cSXMPYnkegiCtJOPWUjxTirBoG5e953FImshPzSbfpls2qkO2K4nxcMFnbFgbLqszyM6
         YzrT4bFtHbjEScWjoWlrZ3Sl4KcxQEk7LOXFkpXFOwwZ1/FaaCxy9DuJ9xYFIac45mj2
         8DnhLlPwun4aKOs7DqQc+JGDQFmJAMkAJEG+MpFO0dGwy1NvzgaPRDErv3C3DLC1nPZG
         4gavyBWa8dmrlDdQMpUBsGa5+HYUzQZ9IX/fFGuPIgjS1MHQOgLZHl1lsbRN4rGLyx0f
         AREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776820373; x=1777425173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmzP215krYFl2YDqXJAWJZnkyXPolY3vOORJ80u6E9w=;
        b=m48dWL3U9ArP7ODB8alPlLWGLDmOi3ZNKkR5qaJklaeaDiBqZNzjV6X97gSucz0Yxg
         uXT+FSY1/WkfNgJ0j1qdrnA9TVe+mj1b3K+fvRDon7NWRx/aizm74pjmaTDVn3Z0YRms
         YvHLGTnLAm2tVhevzFji2ctUfSXpPJMhA7IaaVocqhB1VBegjtkIj91qPaAoPu1BDnmn
         QmlsCp7xj71mETJbwom1qEyXfNPWmTi2S5ORJU+WVJsoe3Sc79MwqBkeZKwoLRNkIvW/
         5XeYbhDsV7Kq79h7ZayXUE9Ebig7M5HQRdVOYZdpv3Up0mHd+rm1hn+g1p2SIUlYcSdb
         NUlg==
X-Forwarded-Encrypted: i=1; AFNElJ9uSunKMr8H1zbsgFXs/aInEnXr2GQJkD47KV6UymaYuXk+zWGt6bpWo0OOVa+6iw43kYvWiUEYdql2@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7dit+6wmNXx85eQ4jhsuXlrWvXcIhgyukXtQTWeT7CQ2Bppjt
	ybLScJJ5Ybm1u4NRWy/4B9UGnP9YXrEL11sOWFRS908nCe21t4sP6E2b8w82PepjeK4/rQ4ewLK
	xwIUO1NbJH8siD2e+HsRaOjJib3giYx4=
X-Gm-Gg: AeBDieum5fK5PDVR17gUrEHc6fyFHrmsQnnMbaD/DF28tzz/HCLeGkTiikjWYPmyPth
	zG35PXELoj2oxPczouRcEkgYhrJx3g0goVzW8QAIdLbAkzAoBns2N3DaH9tSOFrDUQa/whPEePc
	f9cyb3xVjEnJkvhqRBSAOLzpPMWjJoUz2eOlAX6OrksmEMCM+CPogCLJWVKlKrfh37IdqSHxe40
	10UHGk8HySBXQJbwg/IIdm4YZQX24IrsFR6u8MhxwjatOLQhqcfmjL7CX7PXTp6LxjBkNWtLyVA
	OnTow+9EJSEcEqSZ
X-Received: by 2002:a05:600c:444a:b0:487:1520:d107 with SMTP id
 5b1f17b1804b1-488fb793580mr266418165e9.31.1776820372782; Tue, 21 Apr 2026
 18:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-3-joannelkoong@gmail.com> <20260421211603.GB7739@frogsfrogsfrogs>
In-Reply-To: <20260421211603.GB7739@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Apr 2026 18:12:41 -0700
X-Gm-Features: AQROBzChD_oUA9UChNtiMxlpnXw517RP1df7kRY5N3ggXNjUQRFL2s-zPsGUBGw
Message-ID: <CAJnrk1ZACyeKQ6yww1xex5dedt=dyPY9X7j6kitGWnkbdqEVqg@mail.gmail.com>
Subject: Re: [PATCH v1 02/17] fuse: prepare for passthrough of inode operations
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, amir73il@gmail.com, fuse-devel@lists.linux.dev, 
	luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 2:16=E2=80=AFPM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> On Mon, Apr 20, 2026 at 03:16:22PM -0700, Joanne Koong wrote:
> > From: Amir Goldstein <amir73il@gmail.com>
> >
> > So far, fuse passthrough was implemented for read/write/splice/mmap
> > operations for regular files opened with FOPEN_PASSTHROUGH.
> >
> > A backing file is attached to a fuse inode, but only for as long as
> > there are FOPEN_PASSTHROUGH files opened on this inode.
> >
> > We would like to attach a backing file to fuse inode also without an
> > open file to allow passthrough of some inode operations.
> >
> > Add field ops_mask to the input argument of FUSE_DEV_IOC_BACKING_OPEN
> > ioctl to declare the operations that would passthrough to the backing
> > file once it has been attached to the fuse inode on lookup.
> >
> > Setting the FUSE_READ/FUSE_WRITE operations in the ops_mask is not
> > required because those operations are implied by FOPEN_PASSTHROUGH.
> >
> > When setting operations other than FUSE_READ/FUSE_WRITE in ops_mask,
> > non-regular backing files are allowed, so we need to verify when
> > attaching a backing file to a fuse inode, that their file types match.
> >
> > For simplification of inode attribute caching, for now, require a
> > filesystem with FUSE_PASSTHROUGH_INO (one-to-one mapping from fuse inod=
e
> > to backing inode) for setting up passthrough of any inode operations.
> > We may consider relaxing this requirement for some inode operations
> > in the future.
> >
> > Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> > Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> > ---
> >  fs/fuse/backing.c         | 13 ++++++++++---
> >  fs/fuse/fuse_i.h          | 40 +++++++++++++++++++++++++++++++++++++++
> >  fs/fuse/iomode.c          |  5 +++++
> >  include/uapi/linux/fuse.h |  9 ++++++++-
> >  4 files changed, 63 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> > index 4be9ccc5b3ff..0f1e1c1ec367 100644
> > --- a/include/uapi/linux/fuse.h
> > +++ b/include/uapi/linux/fuse.h
> > @@ -243,6 +243,7 @@
> >   *
> >   *  7.46
> >   *  - add FUSE_PASSTHROUGH_INO
> > + *  - add ops_mask field to struct fuse_backing_map
> >   */
> >
> >  #ifndef _LINUX_FUSE_H
> > @@ -1133,9 +1134,15 @@ struct fuse_notify_prune_out {
> >  struct fuse_backing_map {
> >       int32_t         fd;
> >       uint32_t        flags;
> > -     uint64_t        padding;
> > +     uint64_t        ops_mask;
> >  };
> >
> > +#define FUSE_PASSTHROUGH_OP(op)      (1ULL << ((op) - 1))
> > +
> > +/* op bits for fuse_backing_map ops_mask */
> > +#define FUSE_PASSTHROUGH_OP_READ     FUSE_PASSTHROUGH_OP(FUSE_READ)
> > +#define FUSE_PASSTHROUGH_OP_WRITE    FUSE_PASSTHROUGH_OP(FUSE_WRITE)
>
> FUSE_READ=3D=3D15 and FUSE_WRITE=3D=3D16; this is a bit wasteful of ops_m=
ask
> bits, of which there are only 64.
>
> --D

That's a good point but I think we're unlikely to need more than 64
passthrough ops, so I think this should be okay.

Thanks,
Joanne
