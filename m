Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029D7484253
	for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787248011; cv=pass; b=liC0n6SODXz7M6NXyvHLY8CTB11luHmqWTWkcoKgpDcFH6ilETk+046rox8DOXwfhdzpst3qy9VquWHIw7iBr75+tdTnEV7YDAUs7Ad2IUjWWa50FER7MiPBTPGUq6jXs0voGc858qXWZngEDywdgkCHVr/OWVReiWnvXUM8VHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787248011; c=relaxed/simple;
	bh=IebzAFqNzDxhOI4Zd2ed+R0XicuQsjsk9e/qQxm/2Q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eVGfbqS2T5xXsVEG6BZiQtxoA1V8WiQu7GnVlHEZNVfmAJXtf/KBQ6T70o1evlIPkS7h7DVj+eLw1eQkkLuNwO9/QafkO27Ons9OSxxvcSuxQ35pvT/BIXnVWuzqnvszsRjKEyoRpA04Jq+sXfRoZP9UKSZhdGNoGXUPfHJDPGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kl/2u5Py; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kl/2u5Py"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso897145e9.3
        for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 10:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787248008; cv=none;
        d=google.com; s=arc-20260327;
        b=o0W9J5LUGbeeZm6POCZM9FX1POJ6xoAerESW96jR7z7lciObK+xXWJRxQqLcfprgFO
         xwpGUS4FyQ/jqKnM7U8/x8muFrEXm1LC6z29zNHIh6nRwW3vKlvaELq10KsbhqGvxoyG
         60BRxJ07H6jHhydOkhEDslYOCuEovNR9Em80/dj7bPnMEu243PEBVQo3mvPnXU5r2hzh
         DI/LRdxZLRAJPiFQcwCEVYblgLgl9gS65F0P6MKEJTgHEwucxOjUvaQTCcGkcHP1gsu/
         yKR4NEsl/sUC+L9RhQFoq+13IXOWk+VfQxQQwPY9d+kis1zLcO2awZFjZfqwnsZ2xfoK
         UoxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8db9CMLfTK31q4od2PBvJFnR8nh/29s3qNpM98EbJfg=;
        fh=mMrfP9vNhGBpK6/EmAR2KbGJU3ZEhSz16bjN7tu7DgI=;
        b=N8ut8Kg1IFwlXXOWXVvES2EiOLb8a1Q2cIKQSxLvLHIYNS3Sk7vNvbMbxf4iHHEUdx
         NnsYhm344Qun2h4MaCyCMyH7znzFduiBWkcCBut0ZuKCa3CV6MrzO/8QMvoTKG1pLX3n
         GCYxJQD9gwy/y+7k1ofxzjTtfoj/ArLxZgYECEdqhvh//eXu1lKwGrxCHMWRN4c9ilWG
         dJbnOHSQ3kwRBM87tVt8OxcwBdxURFBTINAv0OWPYWt2kMXGk113Qc+MXhB2C9UnKTWm
         nhFo4NXfFkH4EQzB9/xcALDXu1c0Q9QjiLE1hyfbVFndu54fsolZjawLPkFpPC1+Pyuj
         Z4EQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787248008; x=1787852808; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8db9CMLfTK31q4od2PBvJFnR8nh/29s3qNpM98EbJfg=;
        b=Kl/2u5Py7giVrNXS8a2zQ+0RkcseYnZErDvgwNP+D6LrBGRBRQaaWYhm/htn8zvtDl
         lwHxLZOrxId76T8l5DMgsM8tYOrQejA/7nc21ydA76i1MRK2+lfD3ej25lp+I/6Vut6v
         LPINqyIUR24xRnfU7gOP2ICBj1MbBTrfkoJAcOL3/yvJEf3F8Y7DMxF+vFVosLhBJapX
         Cc4vNZEpJdsjKcRqI7rrNaf/GdWnx2Li25Bjre5VzjDZeiS/w96qg0gVYtocxF2VlIi2
         L5xDCl6jdYwIFh8iom0TZCECoDBNbB6ScE3vmlOfspUmn2FYBJeXoBItlyxzVHjo/JQl
         qm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787248008; x=1787852808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8db9CMLfTK31q4od2PBvJFnR8nh/29s3qNpM98EbJfg=;
        b=putVPAXnzuaceoNL8WxBriavkg7zB/0u4TUph+Zvxk5/Li+K5hD2pcKh+ed+oVIh3G
         V844jvtNY7FiWhBPz5iEVt0kxilchNeG38f60juLvmWQR/0VUthopGrQIwQAKNuNB/L0
         QVUAdCNNbRlrhrmnJFB8cAJiJrM+ExXiWlRgeneKRuBYGS1hfQ9oRHwi/vzWDOmdYuAv
         /CzpEw/nelfoTCiANa7oUfN8J3/COEjRqGDC20Rg+faQCdO+odtbLGDmh5Cq0YoS8Yva
         5tB6eEfcrFRnQWev2cEx04K3HR73TkoCUTeQx299BxxNV8tJgNDX18ca1DcouLj6JZTW
         nSzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr00lQNaZ89HJa9gxgYqCY7nz58xAWn5yRiMeUy2J47C8fMpHhT0HI6bfyhoPkaTeqoNGgSktSSRlq9@lists.linux.dev
X-Gm-Message-State: AOJu0YysgwPk7rpmQLuknrsdJwECru8IKTnJiW3NNvGmCLIT7CfFUrQA
	vXUA/TRgf1YN9YrgamlVmJOWO0HBDY5rk0Jd3h+G1FhlmTl76PQIn+xXmNNDHP9unmcETsomNLh
	F/AYmieNrWVFtogiqhQp6KO8Aq0GU5+M=
X-Gm-Gg: AR+sD10+p1Lltz0AvyeqPOxuuTMkycCujmL9PeSuF10BGbF8sFzT/1yZmcTQkRRG2is
	RO+p4MBdLUiCQtfW1SN7r8jW/3/GfKMBHJj0Ek4Un2TgaIlO/0oV+LgQhvwtfsajUZeWTv5IKDk
	liooXL1bbVvij1D9v4g8hkUBENHA+7+ZCq+RF02AIH8drTHxQrse8hMyc1xl1czWdA+EgxVlprl
	uTEvOU8LchL89mMY9sZ7c72wL9lf0axq67ftPUJ59ANOejYRQplX5TDPLw+Y1x4phMB3fRFnecn
	ogXi0UA/FJsQoEuHxXBhPPLpDV54zpZKpwrqd9QPC8T0qA1R6bjlyYATmPK6Rx38VutyV1feZUA
	IHOvpQ3b1JcpKSuXRsWIMA6qI
X-Received: by 2002:a05:600c:c493:b0:499:737c:8a8b with SMTP id
 5b1f17b1804b1-499b847746fmr8731335e9.12.1787248008075; Thu, 20 Aug 2026
 10:46:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
 <20260814185946.3679478-2-joannelkoong@gmail.com> <CAJfpegt2NTn27A_QoMnfb8gDLZpRc9WHzWW6wGBjWc+nvJxg=A@mail.gmail.com>
 <CAJnrk1bocn3zSUe23E4F6oTNyosmF8kdVdFB-2hX2qbSqx-LDA@mail.gmail.com>
 <f0cc2fd8-bf0a-4722-b81c-d54fbafd00a7@bsbernd.com> <69545a14-e3ca-487c-a98d-b9f16b745c39@linux.alibaba.com>
 <CAJnrk1a0ztS6iSZvCFgFf6tH5W4rJM_BdgkJHLjjftJF8qeyNQ@mail.gmail.com> <fa10e184-8390-4e79-abfa-e0dcb6888da8@bsbernd.com>
In-Reply-To: <fa10e184-8390-4e79-abfa-e0dcb6888da8@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 20 Aug 2026 10:46:35 -0700
X-Gm-Features: AcwNN1VWmy59zvJdNW7F8_6fPoFh5aICDDZSe2qgVgSe0mN5gnKjLbhJY7LTUt8
Message-ID: <CAJnrk1YfHOqcoNhCS=ukMiOH436_NzSVtNiPLpSw6fqWDhKGjA@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] fuse: decouple fuse_ring creation from ent registration
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Baokun Li <libaokun@linux.alibaba.com>, Miklos Szeredi <miklos@szeredi.hu>, jlayton@kernel.org, 
	axboe@kernel.dk, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 10:20=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com>=
 wrote:
>
>
>
> On 8/20/26 18:16, Joanne Koong wrote:
> > On Thu, Aug 20, 2026 at 1:02=E2=80=AFAM Baokun Li <libaokun@linux.aliba=
ba.com> wrote:
> >>
> >> Hi all,
> >>
> >> On 2026/8/20 04:05, Bernd Schubert wrote:
> >>>
> >>> On 8/19/26 19:56, Joanne Koong wrote:
> >>>> On Wed, Aug 19, 2026 at 4:35=E2=80=AFAM Miklos Szeredi <miklos@szere=
di.hu> wrote:
> >>>>> On Fri, 14 Aug 2026 at 21:00, Joanne Koong <joannelkoong@gmail.com>=
 wrote:
> >>>>>> Currently, the connection's fuse_ring is created lazily on the fir=
st
> >>>>>> FUSE_IO_URING_CMD_REGISTER command. A server registers entries fro=
m one
> >>>>>> thread per queue (one per CPU) and those threads issue their first
> >>>>>> REGISTER command concurrently. They then race to create the single
> >>>>>> per-connection fuse_ring, which required open-coded handling in
> >>>>>> fuse_uring_create() to detect and protect against concurrent creat=
ions.
> >>>>>>
> >>>>>> Decouple fuse_ring creation from ent registration and move it to
> >>>>>> FUSE_INIT reply processing after a server has negotiated and set
> >>>>>> FUSE_OVER_IO_URING. The ring is published before the connection is
> >>>>>> marked initialized. fuse_uring_register() no longer creates the ri=
ng and
> >>>>>> it instead uses the ring set up at init time.
> >>>>> I tested this with loraw (a "raw" loopback tester that doesn't use
> >>>>> libfuse) and it fails with
> >>>>>
> >>>>> root@kvm:~# ./loraw -u  /mnt/fuse
> >>>>> loraw: loraw.c:1010: lo_start_uring: Assertion `!cqe->res' failed.
> >>>>>
> >>>>> cqe->res is -22 (EINVAL).
> >>>>>
> >>>>> Attaching the reproducer.  To compile:
> >>>>>
> >>>>> cp $(KERNEL_TREE)/include/uapi/linux/fuse.h fuse_kernel.h
> >>>>> gcc loraw.c -oloraw -luring
> >>>>>
> >>>> Thanks for attaching the repro.
> >>>>
> >>>> This is happening because this patch uses the FUSE_OVER_IO_URING ini=
t
> >>>> reply as a signal that the ring should be created, but I missed that
> >>>> the FUSE_OVER_IO_URING reply is *optional*.
> >>>>
> >>>> Prior to this patch, there's two scenarios:
> >>>> a) server sets FUSE_OVER_IO_URING reply at init time - requests will
> >>>> automatically block until fuse-io-uring is completely set up
> >>>> b) server does not set FUSE_OVER_IO_URING but later sends uring
> >>>> register request - requests will continue along /dev/fuse path until
> >>>> fuse-io-uring is completely set up
> >>>>
> >>>> Libfuse sets FUSE_OVER_IO_URING in the reply, but the loraw.c server=
 does not.
> >>>>
> >>>> I think the best way to fix this is to have the ring creation happen
> >>>> when the kernel receives the first io-uring command instead of at
> >>>> FUSE_INIT or at FUSE_IO_URING_CMD_REGISTER ent creation time, given
> >>>> that FUSE_IO_URING_ADD_QUEUE needs the ring to exist:
> >>> I don't think we should allow io-uring without FUSE_OVER_IO_URING and
> >>> I really thought that was disabled.
> >>
> >> I share Bernd's concern here. Allowing io-uring without
> >> FUSE_OVER_IO_URING means enabling a capability beyond what was
> >> negotiated. We should honor the negotiated feature set, and print
> >> the negotiated flags to dmesg at INIT time so issues like this are
> >> easy to spot.
> >
> > Not sure if you missed this reply [1], but will copy and paste it here:
> >
> > This is pre-existing behavior that's been there since the beginning
> > (kernel version 6.14). I don't think we can change this now, or
> > it'll break backwards compatibility, like Miklos's loraw program.
> >
>
> I think we need to discuss this. I had replied that the current
> accidental scheme we
>
> - deadlock (lock order), with bg_lock being one issue, but I bet there
> is more
> - module option bypass
> - bypass of what fuse-client/kernel announces
>
> I.e. if a fuse-server did implement the accidental scheme, it was broken
> anyway.
>
> If wanted to be paranoid, we would switch to FUSE_OVER_IO_URING2 flag
> and ignore FUSE_OVER_IO_URING. I hope you don't insist on allowing

I don't think a new FUSE_OVER_IO_URING2 flag helps. If the kernel
ignores FUSE_OVER_IO_URING as you describe, servers using older
versions of libfuse will break. If it accepts both flags, it's
behaviorally identical to just enforcing FUSE_OVER_IO_URING.

> fuse-server to set flags that fuse-server doesn't even announce...
>

I think this is a call better left up to Miklos. I don't know how
rigorously it is enforced in linux that nothing should break backwards
compatibility. The code was released in March 2025 as part of kernel
version 6.14, so it's been roughly a year and a half, which I guess
isn't that long in the grand scheme of things, but if Miklos has his
loraw server program that relies on this, it's probably likely there's
other users out there who have servers that would similarly just break
if we switch the policy now.

I haven't had time to look deeply at the lockdep thing you wrote
about, but from a first glance, couldn't we fix it at the source?
flush_bg_queue() calls ->send_req() while holding the fch->bg_lock
which is what creates the bg_lock -> queue->lock deadlock. If it
instead only does the background accounting under the lock and moves
the requests to a caller-provided list where the caller only sends
*after* dropping the bg_lock, doesn't that solve the deadlock? This
would fix it for every server regardless of whether it sent
FUSE_OVER_IO_URING or not. I'll try to get some time to look at this
next week.

Thanks,
Joanne
