Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C2F3FBEB8
	for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787242602; cv=pass; b=Q8ZTkx6y3InaMIIGoYs1qfhQT259YYG0esTp9aJVwKQWcpvNfxctZvJQooXIiJBtjvzhV7BYVUwxLtztiR0wiC/YIHfdEOb+MZQSBL2skMp8q4hDoSssWZILf+ghOULDVgDf2LfkXg+dx/a70kAoYK6VlOBCdyK46AGwXpo7Rd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787242602; c=relaxed/simple;
	bh=gvbj1Flm+o6QN8vyK+ktCKnSyI977S0HugcbkLWWXWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtRd008TUsRLo2Yoy5JZttjCEuMGqVlmnk580Z9GEZS+8cbDqE46WHjWqeBfT9Yw6RuA166lD8L89QBCaPAOQEQSE13sjm7aERLa4Cm/oQEF3qVQ/u1QDuS/ylZe0jVl7KfsGGwkBbgwTGcyR7ARoyJZdmLlp6RTCrx8j5IJLIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRJtfJ/+; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRJtfJ/+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so20679325e9.3
        for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 09:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787242599; cv=none;
        d=google.com; s=arc-20260327;
        b=P/Xo8KIQnQ2aELs+iGGp0HApK/CzeerFLzbzTOVl1tBumU1zJmcsGzBFog94xbOaFR
         0LiawWOODObF3PDqDoQuvSwJFtCh/HDMgeYY8Vwj6GOiunbJaTJlrXrxmYzOSJfrESRy
         pRA2ajAbYf/1b+fOMX17aNZFj8ar2kD6hr2xmzuGslXbxHUFBsllCLN46xCr21lANPPr
         A9oEEvOSjqjQu+8jU/j6L9xZMI9L+hMdpBuncO5kT2AQrSfzpHjLV4wKFbdZMDWl74ad
         oDOOWGOpNNoO3K7X4Bxtumbqbw63iZq9NOCGZ6td9fjsmHpAm8OfeHhhCVkmQhxDNvjT
         hHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aFoTj6/0l+rb4Ye3htHwoOMHysPF41NubEuQBpEG2pI=;
        fh=/w6ig0Jwns8pH9KsT7GeDmitdGi+dRc7S1IUqx1PjN8=;
        b=D84lbvwpAC/nG7Ppi91RPo3WtfqB7HPoJ+9L24Jl8B+rVd1HABdurXM2Qx5Vq+q7td
         OQREqsvmN8ZA2A/8/PAXfXyLHpQ6HgLrwF9w044ADdFUXlD32rXzvq981GCcd1Ydz+j5
         tIzPFipaWMfsV85MbSbiAluc0Q1xWyzPxcBJ9qsIGOGCgVpy17xIuV4wl3EEtvgc0ceP
         jxgL4vS3LVz0hVAghi/fZAhGwmNh5+qLyzsdrN3GnWLJqp34teSTt3Tf42SpNTj1UwN+
         mUCiBslf3etF1PsM5ttZWDBsFphrONPM2ybdrIg6Y0Ayd/zzxPIkucSpAOGXmUT07mwZ
         EoCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787242599; x=1787847399; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aFoTj6/0l+rb4Ye3htHwoOMHysPF41NubEuQBpEG2pI=;
        b=QRJtfJ/+zdl4XwfAaFwc517Y9qv4mDidlsXoYmp+GmH1giM3FCmIjOChn2iBj8vpL7
         4VpldpVtU678fP6vf/PdIbc/PFOqnc03KXJ8ECf7S0pMK55sond5JFd99GV22O5TT9zO
         KR8Cd3KluT+aYOMwqkGC63B9GNrZMbMBOKDzJWej1HrhzNh+WxVgmJVkoJqZ0xYF2fK8
         oVvdPsHmaKC1L1TUpOj0O4Q6GIBOYDlvc9bJ4U8SseUysn7yHb5/AG2B7k8YnmUjLzAV
         OkOI64Fri2rrM+mHsen5SWpvA08EaT93/L/pEhns5ztaC2S2a4wZ8cLBAkv6J+qv5bsA
         MlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787242599; x=1787847399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFoTj6/0l+rb4Ye3htHwoOMHysPF41NubEuQBpEG2pI=;
        b=WVKVoLuVsxwpebWueGQHzcunUhHIBon6zOI+98kz5iu4vRDFFmlzKvMKGtul67FI59
         XMVV+eyYBSgDuD6MrD8FRDk1SfoJohJqZfbxBDK/eQ3vlBJv/GaPP5KCIEJT1fxoEZrq
         AN7/Ga9HpoHPIbqL1dZYZg5fbkiAAwbz5KF34pjk7DmxDvSgl05Vyt+ckE7mjpCIM4yp
         2wa1/fszBAcRsGLuHCVZnD9zzDMGMV63n1EJ8spLqY7EAmv2P24JayRP3rZl4CoXPyyO
         7GRIsMGFgKZ3dhkZ71tg8tbEPGfIOCVMB5UpjMadsmD6bwV3Irq8WAd9PQ4dCA7fNxFc
         Wcfg==
X-Forwarded-Encrypted: i=1; AHgh+RoUGM9mRDIBvMyFdMd0F8OX1sGIEzRrHWglViUukWG7a0CkUMQkPDlasN19HeczbwUvInPzQiLpL+06@lists.linux.dev
X-Gm-Message-State: AOJu0YyqTlIZPLBuKdhHrG0BoKiMyWlFbZFN5BdHGE1bh15qSQrZXQvN
	UlgKP5LcmS9zCUcYwTo+LPillCnl36QmFJZMfz5vulG+u+0LuFipHz4iKDD531nBPLmFOoHXBRs
	eSdqTQGRB+E4U+X3xK3ql2atulNLID0Y=
X-Gm-Gg: AR+sD11CXAl7gbhkLEmPzzWO4aLQDi4wkYZFxZRmQZPVMCvqF/eInqGxtbJlL4V/rVH
	ONFldpu5szu+TJin5PDagKl9HwC3RcQJVv0qUeB9EDV0XPiUh++od9MMVLKL64vmmwhOk7n/XGe
	LjaEMESBvPtMRMkRQd9k86uy6lQpMGWtdh/+sJBYh4Sli6t8zCEmdG4Qgn7LHIF59wcPy3ck04z
	68lSMTa1wDvHKj3QM/4XQI8iYeTbrUjLmjXzo9T2TLsjqcCqkJp56hIgwOtStvdtJt4Y9ymvsKK
	7LE3sYXrGIV9J2Nlx9sRlxB67T4L2RHYA2FDJWai5egYzNRf8BtdWu0UH2s5BxC5f4PrkTnEJdJ
	wcPJXJx8BZDrlEFPqwdnLPeef
X-Received: by 2002:a05:600d:19:b0:499:b4aa:3d70 with SMTP id
 5b1f17b1804b1-499b4aa3dd7mr55417565e9.14.1787242598941; Thu, 20 Aug 2026
 09:16:38 -0700 (PDT)
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
In-Reply-To: <69545a14-e3ca-487c-a98d-b9f16b745c39@linux.alibaba.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 20 Aug 2026 09:16:26 -0700
X-Gm-Features: AcwNN1UrR_EoRyqvxR48afEW0T9peAEu4yos0UL6zL_t1OAcEh18dR-YmmWQyus
Message-ID: <CAJnrk1a0ztS6iSZvCFgFf6tH5W4rJM_BdgkJHLjjftJF8qeyNQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] fuse: decouple fuse_ring creation from ent registration
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, jlayton@kernel.org, 
	axboe@kernel.dk, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 1:02=E2=80=AFAM Baokun Li <libaokun@linux.alibaba.c=
om> wrote:
>
> Hi all,
>
> On 2026/8/20 04:05, Bernd Schubert wrote:
> >
> > On 8/19/26 19:56, Joanne Koong wrote:
> >> On Wed, Aug 19, 2026 at 4:35=E2=80=AFAM Miklos Szeredi <miklos@szeredi=
.hu> wrote:
> >>> On Fri, 14 Aug 2026 at 21:00, Joanne Koong <joannelkoong@gmail.com> w=
rote:
> >>>> Currently, the connection's fuse_ring is created lazily on the first
> >>>> FUSE_IO_URING_CMD_REGISTER command. A server registers entries from =
one
> >>>> thread per queue (one per CPU) and those threads issue their first
> >>>> REGISTER command concurrently. They then race to create the single
> >>>> per-connection fuse_ring, which required open-coded handling in
> >>>> fuse_uring_create() to detect and protect against concurrent creatio=
ns.
> >>>>
> >>>> Decouple fuse_ring creation from ent registration and move it to
> >>>> FUSE_INIT reply processing after a server has negotiated and set
> >>>> FUSE_OVER_IO_URING. The ring is published before the connection is
> >>>> marked initialized. fuse_uring_register() no longer creates the ring=
 and
> >>>> it instead uses the ring set up at init time.
> >>> I tested this with loraw (a "raw" loopback tester that doesn't use
> >>> libfuse) and it fails with
> >>>
> >>> root@kvm:~# ./loraw -u  /mnt/fuse
> >>> loraw: loraw.c:1010: lo_start_uring: Assertion `!cqe->res' failed.
> >>>
> >>> cqe->res is -22 (EINVAL).
> >>>
> >>> Attaching the reproducer.  To compile:
> >>>
> >>> cp $(KERNEL_TREE)/include/uapi/linux/fuse.h fuse_kernel.h
> >>> gcc loraw.c -oloraw -luring
> >>>
> >> Thanks for attaching the repro.
> >>
> >> This is happening because this patch uses the FUSE_OVER_IO_URING init
> >> reply as a signal that the ring should be created, but I missed that
> >> the FUSE_OVER_IO_URING reply is *optional*.
> >>
> >> Prior to this patch, there's two scenarios:
> >> a) server sets FUSE_OVER_IO_URING reply at init time - requests will
> >> automatically block until fuse-io-uring is completely set up
> >> b) server does not set FUSE_OVER_IO_URING but later sends uring
> >> register request - requests will continue along /dev/fuse path until
> >> fuse-io-uring is completely set up
> >>
> >> Libfuse sets FUSE_OVER_IO_URING in the reply, but the loraw.c server d=
oes not.
> >>
> >> I think the best way to fix this is to have the ring creation happen
> >> when the kernel receives the first io-uring command instead of at
> >> FUSE_INIT or at FUSE_IO_URING_CMD_REGISTER ent creation time, given
> >> that FUSE_IO_URING_ADD_QUEUE needs the ring to exist:
> > I don't think we should allow io-uring without FUSE_OVER_IO_URING and
> > I really thought that was disabled.
>
> I share Bernd's concern here. Allowing io-uring without
> FUSE_OVER_IO_URING means enabling a capability beyond what was
> negotiated. We should honor the negotiated feature set, and print
> the negotiated flags to dmesg at INIT time so issues like this are
> easy to spot.

Not sure if you missed this reply [1], but will copy and paste it here:

This is pre-existing behavior that's been there since the beginning
(kernel version 6.14). I don't think we can change this now, or
it'll break backwards compatibility, like Miklos's loraw program.

>
> >
> > <... checking the code ...>
> >
> > I'm on a ublk branch without your commits a applied, i.e. plain upstrea=
m 7.2 fuse
> >
> > fuse_uring_cmd()
> >       /* Once a connection has io-uring enabled on it, it can't be disa=
bled */
> >       if (!enable_uring && !fch->io_uring) {
> >               pr_info_ratelimited("fuse-io-uring is disabled\n");
> >               return -EOPNOTSUPP;
> >       }
>
> BTW, the current code clears fch->io_uring on REGISTER failure:
>
>                 if (err) {
>                         fch->io_uring =3D 0;
>                         wake_up_all(&fch->blocked_waitq);
>                         return err;
>                 }
>
> But by then other entries may have already registered successfully,
> fiq->ops is switched to fuse_io_uring_ops, and requests are flowing
> through the uring path. Clearing fch->io_uring here may reject all
> subsequent io_uring commands with -EOPNOTSUPP while the data path
> is still running on uring ops.
>

This is also pre-existing behavior. The check in fuse_uring_cmd() is a
&& not an ||. It'll only return -EOPNOTSUPP if admin disables
enable_uring.

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/CAJnrk1Z_ioW02xbrUekpzSJNerHL=3DXH-V=
YqHmUXFzyUD4HDNdQ@mail.gmail.com/
