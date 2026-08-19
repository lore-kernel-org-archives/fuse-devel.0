Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF009332EC8
	for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 20:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787171371; cv=pass; b=umzNTqfkptPGtURtWjk810NQlN4vIhQuHa015JZaKKZd3YloQCuJDhVIQ0iIyyLSKsNghM9fS1LQQvj7v+uGPxuzW0pzdrNIZ0SJA9lV/mum2v6sYecd0SdKQmrsgJcihIhnj3jPN6x3E1983HVPDgDLyd4ISEfXQaDmw1O31eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787171371; c=relaxed/simple;
	bh=S+uEMPLIdw4gekR256M0mQH2sfrCptbhj3NVcfJAvzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=op8KNKWjkWKYLYSeN9wd1JzBd+NbKWmZXcT0Agmi3RISA8tO7t9Lb7v8vgBgya9OYx4pftQDFHv3XcBZISgkAOZsiHEuNN1Ob9JfDKpYRTblfK2w/CCfN7jnFXRTaA5JQVwgfBg2NbqEckJansxu8S0Xb/UC0aja+3A7T0EDevU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIA52JGL; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIA52JGL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so13877395e9.0
        for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 13:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787171368; cv=none;
        d=google.com; s=arc-20260327;
        b=A6UQFrtNNJfdOhR2U26EE3tERTxKSfSytWql7iI2uA3IzFGHnTowrCLj1CeX7owR/x
         lFzc3sS8Pna5w9a5lgCpH6H3Ue/Pi0axj77u46SAXZqMYqFIZqA/zKHwT7MHy3Yt4PW8
         BOqQNWqJL5Hw+MJfhc9tejgIKSs6Mw4fNO4YGrFYqFkIBdfCJMvEUHDd+y0om89srCS6
         NQCFZR50ZieIqk56/BzHR4n+mXGwdpBzzyd2WR2O7XqqAArmphVZw7Aq93McGAKaLpMN
         Jvf6+PAhfMbu8ALYgJ4zcYQbVRWmk04mDJUgad0zGSVhOoYRfbdxbvBaHo5I7IBsP2L6
         1uDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5nq++j5K0fDs9kXVrW4zNwcVAk5jAIahTBDHD1Sr7I=;
        fh=6HhfAbn1TyV3jJTE+143Z2SJskSgd6Ei5jcBV9uHIFE=;
        b=jJWU3IVdx1J7mw3+Bjs0rgJ0eYoOSrVrSdCeZHPnGtcn5nRpfZM8eaeY3vgjAu3VQn
         PcKf4mmfdUaBJmSnhloKzpxhnVqUSibPw8QCM92ZzawdlHmL3YabeQtkC6N22Iya72aJ
         e9YxL1ZNp3moQdhRVKgIobFjQEYA/I25AT6NJTQjUbFEZgWiwygSVhRJdtZMZltljAlT
         zydorjEC7oKhmNMlhh0iJOmeD+WsKFVucjc80Svg5wUb5PsWVM3POlA7dJ+8GV93KdRC
         bMWezz9dLOLz+zYPuwISYThlDxZQfWRUjhEwSETrQGXQbtJY5c+5BDWlf3V7pXi7EXQk
         mrwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787171368; x=1787776168; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s5nq++j5K0fDs9kXVrW4zNwcVAk5jAIahTBDHD1Sr7I=;
        b=qIA52JGLrsOX5VooWeItUfgETP+z4IxVjDOqvLi3pp+ASnPHQk/9PKkvHGcKQ4rOcu
         AP2zoDvyyCwORnDfLs9ZxiVCXDftR8jd65LfmDI6s+U/htUAcjnjARgVrRQ75ofDuXQi
         jTavQlPbGjxTfUF47cVhJXKVkv3ThlIUwVMx5uQS6L0kBTobJqcBlUuAy+V8kZgs83aB
         OmlXKzdnMMkBsCUpHSbp9J2os4OHjTScysMoB0vwgUR0tVOuI97XKgpzrY3trrcHvnhg
         9POOwETGs4cpkQnOIrKakfpYmssPbSaPEbQ61qFpfWnGTo+TNf7eVu3zuGDKV7zWg7oj
         tGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787171368; x=1787776168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5nq++j5K0fDs9kXVrW4zNwcVAk5jAIahTBDHD1Sr7I=;
        b=HdyLqktFqgCP/uLihbivT7Uqu4osrKmO+JedN3ALIT4igdnX2ylewF/BkQCEl0hoWQ
         7EvxtA92eWxJP7PrvcAMe8JsoiXrV7uV7K+Tt5O9CyiD5a4dAT1LEuenPlLKhgNC/96E
         UNolw3d5EOl4AybcvYbDBb2zyyNoT9NlCGlva0kbnd/3qj9TSAp1sk3a9gv3t0i7nfEE
         M341H/tOS3TjEioBW0n+1zhKvPSfmPEoz4L/ryH4L4okEGLjRz6eZMTUmByeZdwJ9JpX
         7+8w97/5dZRcVJht3gfkUpyI8uJSfzYDfXjlR+z5cwVblakCeeXiGCnI5/9XWqdEO5Tp
         2xNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaVi9PHK0296mrjzl5CLIfry6tUY8inNqWJV1J6ebWKXMuZBSKVXVUEnYGLh8qR87du6d1t/JtD7Fo@lists.linux.dev
X-Gm-Message-State: AOJu0YwUjrZyX01htb8hiXxxyYXrOppE3wyN9EDJHr08zSEH242s8VLA
	uWCt679SktROf3CmtDGLJZPHfn+CjM2thzZwbgE43NgqTm7gORAat9WkQneQdsot8hxAS/74nPH
	roqfNRJXbMId8pcaZoTKni0WNWZRSoN0=
X-Gm-Gg: AR+sD138DXud1R5hwED5oYcTmrNepQIaBqqDAf/zVi5sjbLnoaaOkli7xdqU+2JFrMU
	nJYfoPSUFC23i87WlDahWJW6Yd0Y3bmPP7WEyTO5Y80a6c6U/90vD4AqoGsTz1t6C39myaanEaa
	vOpx4R6t6tHiCBKEKYZq0yJwty5V2l4OhJyqhxrrmbLiMZo2ydhuvDdVkWalvjc6tNnmIlBAHmH
	9CSqYXLVji+rkM+78Rub+GKpN4SC0n/F3LxIuTehZUDNxZFb29X7ZitUnpCipopYJTCxzbo5K+T
	oFYKgt1vFbhWpHT9MnUAvwzVtbiD8stIq8s9ycHkTzZZywebFJ+qLgqfsbTMbTlMeZNqengR1Tn
	Pw2Zy8y7dMk+sGIXdnYykn+2p
X-Received: by 2002:a05:600c:3f12:b0:499:7a4f:d13d with SMTP id
 5b1f17b1804b1-499aa199777mr143208185e9.4.1787171367981; Wed, 19 Aug 2026
 13:29:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
 <20260814185946.3679478-2-joannelkoong@gmail.com> <CAJfpegt2NTn27A_QoMnfb8gDLZpRc9WHzWW6wGBjWc+nvJxg=A@mail.gmail.com>
 <CAJnrk1bocn3zSUe23E4F6oTNyosmF8kdVdFB-2hX2qbSqx-LDA@mail.gmail.com> <f0cc2fd8-bf0a-4722-b81c-d54fbafd00a7@bsbernd.com>
In-Reply-To: <f0cc2fd8-bf0a-4722-b81c-d54fbafd00a7@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 19 Aug 2026 13:29:15 -0700
X-Gm-Features: AcwNN1WdBxCrZ_xRuvATcv2w-KXsAA94Y_WjVBkRd-DAZvRKcmGuIqJnaZXL1jI
Message-ID: <CAJnrk1Z_ioW02xbrUekpzSJNerHL=XH-VYqHmUXFzyUD4HDNdQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] fuse: decouple fuse_ring creation from ent registration
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, jlayton@kernel.org, libaokun@linux.alibaba.com, 
	axboe@kernel.dk, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 1:05=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
>
> On 8/19/26 19:56, Joanne Koong wrote:
> > On Wed, Aug 19, 2026 at 4:35=E2=80=AFAM Miklos Szeredi <miklos@szeredi.=
hu> wrote:
> >>
> >> On Fri, 14 Aug 2026 at 21:00, Joanne Koong <joannelkoong@gmail.com> wr=
ote:
> >>>
> >>> Currently, the connection's fuse_ring is created lazily on the first
> >>> FUSE_IO_URING_CMD_REGISTER command. A server registers entries from o=
ne
> >>> thread per queue (one per CPU) and those threads issue their first
> >>> REGISTER command concurrently. They then race to create the single
> >>> per-connection fuse_ring, which required open-coded handling in
> >>> fuse_uring_create() to detect and protect against concurrent creation=
s.
> >>>
> >>> Decouple fuse_ring creation from ent registration and move it to
> >>> FUSE_INIT reply processing after a server has negotiated and set
> >>> FUSE_OVER_IO_URING. The ring is published before the connection is
> >>> marked initialized. fuse_uring_register() no longer creates the ring =
and
> >>> it instead uses the ring set up at init time.
> >>
> >> I tested this with loraw (a "raw" loopback tester that doesn't use
> >> libfuse) and it fails with
> >>
> >> root@kvm:~# ./loraw -u  /mnt/fuse
> >> loraw: loraw.c:1010: lo_start_uring: Assertion `!cqe->res' failed.
> >>
> >> cqe->res is -22 (EINVAL).
> >>
> >> Attaching the reproducer.  To compile:
> >>
> >> cp $(KERNEL_TREE)/include/uapi/linux/fuse.h fuse_kernel.h
> >> gcc loraw.c -oloraw -luring
> >>
> >
> > Thanks for attaching the repro.
> >
> > This is happening because this patch uses the FUSE_OVER_IO_URING init
> > reply as a signal that the ring should be created, but I missed that
> > the FUSE_OVER_IO_URING reply is *optional*.
> >
> > Prior to this patch, there's two scenarios:
> > a) server sets FUSE_OVER_IO_URING reply at init time - requests will
> > automatically block until fuse-io-uring is completely set up
> > b) server does not set FUSE_OVER_IO_URING but later sends uring
> > register request - requests will continue along /dev/fuse path until
> > fuse-io-uring is completely set up
> >
> > Libfuse sets FUSE_OVER_IO_URING in the reply, but the loraw.c server do=
es not.
> >
> > I think the best way to fix this is to have the ring creation happen
> > when the kernel receives the first io-uring command instead of at
> > FUSE_INIT or at FUSE_IO_URING_CMD_REGISTER ent creation time, given
> > that FUSE_IO_URING_ADD_QUEUE needs the ring to exist:
>
> I don't think we should allow io-uring without FUSE_OVER_IO_URING and
> I really thought that was disabled.

This is pre-existing behavior that's been there since the beginning
(kernel version 6.14) [1]. I don't think we can change this now, or
it'll break backwards compatibility, like Miklos's loraw program.

>
> <... checking the code ...>
>
> I'm on a ublk branch without your commits a applied, i.e. plain upstream =
7.2 fuse
>
> fuse_uring_cmd()
>         /* Once a connection has io-uring enabled on it, it can't be disa=
bled */
>         if (!enable_uring && !fch->io_uring) {
>                 pr_info_ratelimited("fuse-io-uring is disabled\n");
>                 return -EOPNOTSUPP;
>         }
>
>
>
> In process_init_reply()
>
> if (flags & FUSE_OVER_IO_URING && fuse_uring_enabled())
>     fuse_chan_io_uring_enable(fc->chan);
>

The condition check in fuse_uring_cmd() is an && and not an ||. It
doesn't enforce that the server must have sent over FUSE_OVER_IO_URING
in the init reply to use fuse io-uring. With enable_uring=3D1 (which is
needed for the kernel to advertise FUSE_OVER_IO_URING in the init
request in the first place), the fuse io-uring logic proceeds
regardless of whether the server replied with the FUSE_OVER_IO_URING
flag or not.

Thanks,
Joanne

[1] https://elixir.bootlin.com/linux/v6.14-rc1/source/fs/fuse/inode.c#L1455

>
> And this is also absolutely needed to block requests in fuse_block_alloc(=
),
> which is a requirement to avoid lock order issues between queue->lock and
> fch->bg_lock (at least I believe that has not been solved yet).
>
>
> I'm going to try Miklos' reproducer in a bit, but one way or the other
> let's please not allow io-uring without FUSE_OVER_IO_URING reply.
>
>
> Thanks,
> Bernd
