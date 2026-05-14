Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FE81624C0
	for <fuse-devel@lists.linux.dev>; Thu, 14 May 2026 23:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778801061; cv=pass; b=lgAsUjt5+Vi2lYdaul5XAtkHruYqaOKLKWL+Ch6GOjT1oo+cB3TCWtgPZij2V00WYRvLE5iK6FL5T5Atqx95RLfasEhjpSCdcxdSRCb/atxtE4vdQ24IVkXgi5XEt8yUt1FOS8IgECf0vKFLKw4ZWwpojkXb2CTud9+ctBCN2W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778801061; c=relaxed/simple;
	bh=n2kI/vzB3YqxM63/gcxPKMamba/3wBKX7ld8X/RpSkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X3CiqTmgk7fePyMfnxjc7XPitVtFWOTK9VolBn+0LEZ6c2YK42FmMSO8B5QRCA1e2b0YHviWlLK4u5Sj/twFb68+IflaAja6WDwx/6WAAMg6HMXUBy9AcSbukC+UCblyNVFE61FKNt6K4ddWIrCKKYT9JY/ce7cXIOzbSsJduxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6qaGOlN; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6qaGOlN"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4526a8170ceso4785647f8f.2
        for <fuse-devel@lists.linux.dev>; Thu, 14 May 2026 16:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778801059; cv=none;
        d=google.com; s=arc-20240605;
        b=Dpu+dLbt6ZBAzqLhFQ/gB0dHoGglHmoyhVe+UQhH2rpmEUVYND6kp2JSTep8kCXlXF
         EbW49YGAlPLBOxQ47kRgD4Wul6CtSUXeTpzsG4D+EpwbukCt5skQdYqgmqidbY05p0Ir
         fnqE47jOn7Agn18d3IXPfoH0TX82FBflfE9CUw4gOIKg6M2hbwoPwRzujatV+soJIMF+
         da738+9OpsObr6oTt1cADB8NkT1K76HYWsH5TyBys6qFeoKVNEdfQ0+GOrBcc1tmuIpg
         p2XN+UUjJf4kwD6RScwjH1GJW3YjIijrxZC2Sl7ROmjgvP/3aKfPbdrK9IcibYM347o7
         yx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bcaWx7Y47zh9+hIVWvCfvsIDsSTkboyGUiKVaWiAEaQ=;
        fh=PVEqr3eLXmxJrJl2qsmsvKPgavqPk4TnjDC851Q9aJI=;
        b=fBKNZk+vm7XpHKkoEw1mgvm4SOz9LJIAjNusAp4ecYabUCcAN5SE7GGlEn0WjD8/V8
         nqhhkNfLX+xEZthb6Tc7wK/GSAO7CuxHrd8HyKv833SkhQ1rxTWQrq8QzyzY/dLnfIVs
         WOCNc/Z37IjMWA6mR2S8TpWa+BTpXvOPc1zPqBMqqg5y9aORICf4L1FbJDN/5Ph5NrRh
         YKSelXqzDNta9B3D4Kananiut/gZRmYwJaG7b6WWuJfkQvOPUdmm/NAxdjCgSph6vZ0I
         4B+8ZJg1tkVnQxyPf3nmoraHaVjWTi/dVxY4usFyDusCdC+wyUk15KxTDkEJu7+TdLUi
         VrMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778801059; x=1779405859; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcaWx7Y47zh9+hIVWvCfvsIDsSTkboyGUiKVaWiAEaQ=;
        b=E6qaGOlNgBBpWd4WclcigUZP0JD+9HpS3t4VmElmrN0OrdpdaXOr9zLMc4d5u/7wcj
         z2MTUH3sbl3ryqPggWIDf5h9M3uPRKrcPI8X0a12fdO6OvGQ2xIFnNC4xFhtGEg0mmAi
         UDP6p/i+BfjE8VTlNQQEsX3y0MsQCnRmPNopbmh1uVfoAEtQOnAU4lkDpngVqyw0QsCZ
         En91C3hwx4819+J0yYGsO8tI5sUzLdcHEjvr26Q7g6vTKWmS9txLSlz27Rs8HmmucQur
         LwOTd2371/mZtOzqqwSgoOuCON+K93XMZ9Bg1WFpnNgFpsNZXrZElILjpZqsKfMtW5rD
         3WyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778801059; x=1779405859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bcaWx7Y47zh9+hIVWvCfvsIDsSTkboyGUiKVaWiAEaQ=;
        b=Cjsx6C2QDfiuUtXMoqWsWQXqTAjWlWav2EvF5p/uYc7iTlgihJFSxLnqA3mwju4TOv
         9JuWaqG5XO5j184fyMCKocuSGFhftwRWXNXK2i6EtcD/I+l6Bjyvnu5RNlNjp7IbncB+
         Y3EDCv7j0NYFN6s0b3Dvgkcw56yB42cldF+SVe2gAwpZwj6D2KKobIehDrqTJXL4SYb1
         MpAM2kV9+ImWeWOzL2aRZewL62PXV/xKsQc81QTStuhScwW7g8J+5friqE++WrIKK6ah
         ZJhi9xMMICOe7X6y98IM3gMgBXqsGhUVASKHx5NB0G15DkFhPGEOwwyk4uCGIiNVXa3X
         O6+w==
X-Forwarded-Encrypted: i=1; AFNElJ/nhwJ5sE3Vrv604MmW2Q/Zsg3CzhRJfTASF1GmLyGhAtSc09xTUSl984FVDmFnLlJAQllz7gJtTJ8B@lists.linux.dev
X-Gm-Message-State: AOJu0YyVI3FQ3YJeZHsR6j1bgTKHV4WLzLY+v3v7jM0nRCB3GDPcKja+
	SukbtJWEZ63G56NtsH/6HJF6oUlNJknZq5rSiZXxkQbEO+StwtGL+iB/hkwfLFIJgC9H1oEY28r
	HPqnVkZXnwpeJC8Nx5P+h0HVQPjNOG+k=
X-Gm-Gg: Acq92OFnCotv2PP+JoEktCmK5mlTPeJdCB2STivSwDr4EAp522Gw7V3xnPPgqAz0VVE
	zqU+rERp3txVDUyAiqOiq3BBP0h1wooWmuKEFE8YbTF7/paz9GmfCRGJ7j5nOgeBW39Y992IbbP
	a2IVP4OHWMoKnU1M9tHv5KeRV9kt6jggXYwC6BaNXX1FpkLnRWGYUmIZq55zX/fhwQ/1KRPsQmC
	XVNy6E1xtz4/sJonTem5wkNB0ExhtlG4pj9TP5Ij3/j98e7jHsZU8PJPmDX+EcRtbu+M4oT2I+H
	ScVw8kdOkHUploY2
X-Received: by 2002:a05:6000:1863:b0:43c:ffb1:2214 with SMTP id
 ffacd0b85a97d-45e5c5cbe3amr1481467f8f.16.1778801058585; Thu, 14 May 2026
 16:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <CAJnrk1Z_JWtuA3UjucF9=YH63AH_-J_0hzr9jbY99Hx3O8YrAw@mail.gmail.com>
 <CAJfpegspraqMp1Z3mi_csiw6haawZPa4zWheSUN7MhBy47aYKQ@mail.gmail.com>
 <CAOQ4uxgV4_Pet0w3f+Sq4kLkvgKM6FyJwZ4AQsnvctC3w=dP6g@mail.gmail.com>
 <CAJnrk1ZvB-R3Szn-VxOZvPRgX_dXwMLouBphnT9_URCE8SxTvQ@mail.gmail.com> <CAOQ4uxidwSn69A08Urue7S7n8wrGQcyGuvRL387pD+rpSFP-Ew@mail.gmail.com>
In-Reply-To: <CAOQ4uxidwSn69A08Urue7S7n8wrGQcyGuvRL387pD+rpSFP-Ew@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 14 May 2026 16:24:06 -0700
X-Gm-Features: AVHnY4KRTbyDYmFmjBDo8tWwUWvp3R6Xim4acRrdZRen_T-7cWVXIPm5HeZyFa0
Message-ID: <CAJnrk1ZJ1pVWn21HZATRes55RJD0F0+6SHbq-8FojPutQTiW6Q@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 2:28=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, May 12, 2026 at 9:22=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > On Tue, May 12, 2026 at 6:22=E2=80=AFAM Amir Goldstein <amir73il@gmail.=
com> wrote:
> > >
> > > On Tue, May 12, 2026 at 11:31=E2=80=AFAM Miklos Szeredi <miklos@szere=
di.hu> wrote:
> > > >
> > > > > * in passthrough: backing_fd passed at lookup/creation time only =
(not
> > > > > at open time), expanded struct fuse_backing_map
> > > >
> > > > Yes, this needs discussion.  Amir may have additional info on this.
> > > >
> > >
> > > Having the two different lifecycles (open-to-close, lookup-to-forget)
> > > is by design.
> > >
> > > This allows the server to potentially move files from passthrough mod=
e
> > > to caching mode and vice versa, as long as all fds are closed.
> >
> > I'm unsure how useful mode switching is between caching and
> > passthrough because the server has no control over when the client
> > application closes all its fds (eg it can only react but not trigger
> > it).
>
> This is debatable.
> My passthrough fs server coordinates state changes with HSM
> using flock on open files.
>
> Previous implementations used to allow using cached mode
> until the file content is fully downloaded, which could be beneficial
> when streaming large media files.
>
> Current implementation uses the DIO or PASSTHROUGH modes.
> I have not yet collected enough real world stats to know if this is
> a problem for large media files streaming, so would prefer to keep
> the options open for now and I see no reason to deprecate the
> open-to-close lifecycle. I don't think is adds that much complexity
> to the code (?).
>
> > For my internal use case of switching on passthrough, I was
> > envisioning the server handling everything through direct io until
> > passthrough is possible (eg the remote file has been fully downloaded
> > over the network) so that passthrough can be switched on even with the
> > application having open fds.
> >
>
> Indeed, being able to switch to passthrough for new fds is a big win,
> which is why I also changed to this method in the current implementation.
>
> > >
> > > Adding inode passthrough ops does not play well with this mode
> > > this is why it requires the lookup-to-forget lifecycle, but I see no =
reason
> > > kill the open-to-close lifecycle as it seems useful for servers that
> > > mostly care about I/O passthrough.
> > >
> > > w.r.t expanded struct fuse_backing_map, at the moment it does not
> > > sound right to me to map a backing id X with more than a single backi=
ng
> > > file or device.
> >
> > My thinking with the struct fuse_backing_map expansion was that future
> > ioctls for managing backing files (eg attaching a backing file to a
> > live inode or swapping one backing file for another) might benefit
> > from a shared struct instead of needing to add new structs for each
> > type.
> >
> > >
> > > I think that the maps of fuse_file to multiple fuse_backing is better
> > > handled by another layer of mapping (sort of a backing_mapper)
> > > which is what famfs and iomap need, but it is just my initial thought=
s.
> >
> > I like this idea a lot, it makes sense to me.
> >
> > >
> > >  Joanne, if you are a concrete use case for that, let's try to see
> > > how a design to this use case may look like.
> >
> > The internal team I'm working with is planning to start working on
> > their server in H2. They will run some benchmarks to see if current
> > passthrough and/or io-uring+zero-copy might get them the performance
> > gains they need, or whether they will still need the set of advanced
> > passthrough features they requested. I'll keep you posted once there's
> > performance data and if there is still a need for the more advanced
> > passthrough features (file mapping to multiple backing files, backing
> > files dynamically changing, enabling passthrough on a live inode),
> > I'll draft up a design doc to get your thoughts on.
>
> Sounds good.
> FYI, some of those issues we try to solve at application layer.
> Our HSM application always tries to keep the inode itself across
> state changes.
> For example, by using clone_file_range() to fill in content.
> With xfs, we could also try to use atomic swap extents, if file content
> can change, instead of changing inode, but we did not try this yet.

Thanks for the info. This is useful, I'll look into seeing if some of
these requests can be solved at the application layer.
>
> > In the meantime,
> > I'm planning to send out v2 of the inode metadata passthrough patchset
> > sometime this week or next with your feedback from v1.
> >
>
> Cool. Let's get this rolling.
> I need to get my test setup back in shape.

What is the test setup you are using? fstests with passthrough_hp or
are there other tests in addition to that? If there's other tests
you'd like me to run besides fstests, please let me know and I'd be
happy to do that.

When I ran fstests yesterday with passthrough_hp, I saw generic 683,
684, and 685 (dropping suid/sgid on fallocate, fpunch, and fzero)
start passing, but beyond that I didn't see any improvements (or
regressions).

Thanks,
Joanne

> There were a bunch of fstest failing last time I tested passthrough,
> mostly related to metadata cache coherency.
> I was hoping that GETATTR passthrough could solve some of them.
> If you have seen any improvements (or regressions) in fstests please
> share this info with the patch set.
>
> Thanks,
> Amir.
