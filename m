Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872503F4106
	for <fuse-devel@lists.linux.dev>; Wed, 27 May 2026 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779879595; cv=pass; b=bHzeXgJXTkg8R2APu+lX+5Vmg0Ps/IDadJQ7mWLwXZYmE1I14+f045bD2bXRMtCMhzCQU6TqVjKLEe6XgY9QyBEzoAe6J5bwksFKoJvl35lzylf4cGkDjEPA6lOOma8JHzqGmvVqCQ22k7Lc8pUU1deyjyGEiZHEQDJgy6f5qoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779879595; c=relaxed/simple;
	bh=AjKAz/tcvPVSA4YUyYJ8TFzjjK2KA+A8HrMPayeB3LI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+z4yPdomGPYNoSs5MdJUrMWlDmZa49sGGqlQL9itt7SBsglDGiJWnj4xrnHIpPoufcXejEvuBWWbGrjgnhkZi6mxvWyFyRHQvMy2fpBE0haqWJZoaeC0aCX+mMI9f8CmD9t19ZERKddXJXl4N/OKT7GJe+DDC7K/8awlrHqngw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4Kyf6yU; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4Kyf6yU"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6804e24803bso7044727a12.1
        for <fuse-devel@lists.linux.dev>; Wed, 27 May 2026 03:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779879589; cv=none;
        d=google.com; s=arc-20240605;
        b=LnODuYAK44pcY6eQ3KA/caqfD2wGCyDSU1fnzgiMSw/WGfDvcp2ubyGLfNUEjA2iDt
         keNb7KidLbJELDJHkTQHtEeioyrWjL18xB8iEXpgn0vgziTfm+9m91vqlOOMJ9JrDOJp
         mW9xR2+rX5pp8s/0D6LKFcOqEEqA0rFaG9dIyBu9XT4GM8ORN9yIoBWPXpkAD/AfKug9
         ie/lAUQmYZqMAwrDktWnY9bFM8JaDnB+8KaYpNu78UiePimP8ms6hIJRJ8UkoLbhbq4k
         /QXY0S1DkUL1cA4Jy7dxefFF9lf0pnTpOXAcNTlJM8TCljuYUqNflQ/sEV504S7wosE0
         O25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z47qFv20mPuG3rVgLK1f9RjthA1JMqjHGXcq2IgRpUM=;
        fh=MHbs87JarwQqsf2rYHfICql/Nyk/2/EBQDxQNz7FEPk=;
        b=SbcSnkjCdDwJ+e7QRD0pxALO3lWirfL6QCOVEoT2YO12OuA8+ATU075UZfrLX0czWC
         lblQYnXwRdLEf2/HyjpnwP1B2cRS6h3AWjOVmicNitln04Uk7+J/DN0FG1XYL1NW9WGW
         x6vPkj9Hgs1Gr9/IAbjPEdHuDMUyWS5rMxzo/QWRpoBuqmY1YW54KHkDW5oiO2EpDxyU
         Bhc5H0VrSPCoXEAd6gTpGrtUAWBHzQ3rLzAlmVaZK44uy9mJOYkSM5JsGfd9m1lE7GnN
         5MhOuQJ+1u/bsH2h9WDoDuQXGxstWiReaRGzoFGmpKThptTyDoJmGNg9F4pF6VDeRifn
         dA/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779879589; x=1780484389; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z47qFv20mPuG3rVgLK1f9RjthA1JMqjHGXcq2IgRpUM=;
        b=H4Kyf6yUIvGGjpFy0w59PPjXMKnRJWfpK/RwxJD1ZR7g2e7Rn86mMwU6GSj6j0a0L+
         aUNJlsq0kyY0iekWTBaVogWh97c281Ky6my7+UCdQ1mOJIFkZpIv32tJx+G2MqxNe3ke
         tRyPTD6APO5nvcGmD0VGmRAdGm8qAhN0FN7YEsPjP5mRdzvHX2K6ToYgauKF4WFV+JiT
         khv1A3lP2V0YmJUZqrxMTZq0mItYZvb4U8NepWQ+eiS6vCpTTbWXeQzCg8QAzhGxBGpJ
         N2rToMZucfKGCTsfEfJ94ZVMgnN0kb50/wv4v0K1SrjWpxQJPMWUCibHOcqvVlp7l9Hz
         g+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779879589; x=1780484389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z47qFv20mPuG3rVgLK1f9RjthA1JMqjHGXcq2IgRpUM=;
        b=nqNPJSL2+jRa7pVr9TY4G5P3UoJFvEb5YDQUj4hRQOxUJL3gAmLPjVIhHhowpYbHqx
         5j8czCnixn0n20cflVK872RJ7tljJna2Va3+GlfySZSTdNEOLU8JnahhyP4vmFEF1UCR
         Y/dn0kqARZcarAyBOMMShmLODhV0W3KtmK8PCbyGR4/s5I6VWy6u4ioRZnmSaSHi3zES
         vJflI1sKq+yU3CXtcK+jviCubIb7l0I18sbVfvliQIfgLO9wNOCaAlDNF42eL4HbrT9x
         WJgIhMAD/Z8f5bS+cOHfzDL++sl5lJFUmrGFCW0BI8h2WDJh7ztJFaNY//NP42Iqsj+6
         9K8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9QzvVJMqM++QsD7JLfycwgA33+ajOw0TJ5r43qfwv3hfP2GAq2rFCFjIThYaXzPqaN5Pss6siGsUzW@lists.linux.dev
X-Gm-Message-State: AOJu0YzKEDHycfmVW8qnEMjd1xcB/m8ZETKcFJ16ISiI1I96xjx7H/Hc
	ukbX+SN2dbDY9qZ3GW71TuGGw98iJAqpymRx1k3us+K9nVarfLirCYsK2PDPSKEfeePiY0ksmpr
	Oviv9yesYTDUkjh7KOJtBmrOGs0IivKE=
X-Gm-Gg: Acq92OGoMrx3S7HyGyVYYTWnWcI1lb3KBzQJQH4owwbiWeKTsDeOZQzmy0DSDd64Mqb
	Z6czppLor5BmRCJp4h6SH7+GroQ9WbSiYIiEYkW23I6auKurf8eT9pL9iY+nu2kZkKaytF/dk//
	ACUCA46v5jxra5UeFPY1RrzU/2dG/p8RxxE3NhNYNzxPkISa8/R/8W1Ne6uagTiIuzF5ekhY+FD
	sdAgJh3FcA3fjrsnkcurhmDe9tjAP2wFbZ4gt6FeO/ECGbNtVCXRGSQrlvkDfuZ6k739cNmZZaJ
	ykBo/KDe+IcG44SDtVTxz8tTLA9OlbXW8Bj/25Z5AyGP6sswNPSX
X-Received: by 2002:a05:6402:5306:b0:67b:4e46:f13c with SMTP id
 4fb4d7f45d1cf-6889cc4c7cbmr13188206a12.23.1779879588740; Wed, 27 May 2026
 03:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251008204133.2781356-1-joannelkoong@gmail.com>
 <CAJfpegsyHmSAYP04ot8neu_QtsCkTA2-qc2vvvLrsNLQt1aJCg@mail.gmail.com>
 <CAJnrk1anOVeNyzEe37p5H-z5UoKeccVMGBCUL_4pqzc=e2J7Ug@mail.gmail.com>
 <CAJnrk1bx+32Tq5DOk6=C+_smV2HgP3+RT6gpYLSNMEirFs_EkQ@mail.gmail.com>
 <CAJfpegsy2XRR6g1J4Mg0MXPckx3NVprW56XvYhEko0=7PcHiQQ@mail.gmail.com>
 <CAJnrk1bZX44HaXmNMxEeEwhuFHgEjxXLnjKy8a-6T6LFuf+K2A@mail.gmail.com>
 <CAJnrk1aJwdY+fphnhHjAXFwjGqWQgVB+sn2Ce0gReein3H8EWQ@mail.gmail.com> <ahaF7UaeQlgajYDi@fedora.fritz.box>
In-Reply-To: <ahaF7UaeQlgajYDi@fedora.fritz.box>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 27 May 2026 12:59:37 +0200
X-Gm-Features: AVHnY4LVTX1VhNohK-e2HAuRXidNAZf8Fi3saZs1BKokj2qKfvf108GvfcyMpx8
Message-ID: <CAOQ4uxiqP=f+5py=2Ma1uEchogYttQ5sKZte6XKRVHAO=pY1DA@mail.gmail.com>
Subject: Re: Re: [PATCH] fuse: disable default bdi strictlimiting
To: Horst Birthelmer <horst@birthelmer.de>
Cc: Joanne Koong <joannelkoong@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	fuse-devel <fuse-devel@lists.linux.dev>, Jan Kara <jack@suse.cz>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 8:06=E2=80=AFAM Horst Birthelmer <horst@birthelmer.=
de> wrote:
>
> On Tue, May 26, 2026 at 06:42:35PM -0700, Joanne Koong wrote:
> > On Tue, May 12, 2026 at 1:56=E2=80=AFPM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> > >
> > > On Fri, May 8, 2026 at 2:42=E2=80=AFAM Miklos Szeredi <miklos@szeredi=
.hu> wrote:
> > > >
> > > > On Mon, 27 Oct 2025 at 23:39, Joanne Koong <joannelkoong@gmail.com>=
 wrote:
> > > > > Miklos, could you share your thoughts on this? Are you in favor o=
f
> > > > > disabling default strictlimiting? Or do you prefer to have it kep=
t
> > > > > enabled by default, with some mount option or sysctl added for
> > > > > privileged servers to be able to disable strictlimiting + enable =
large
> > > > > folios if they use the writeback cache?
> > > >
> > > > So what I think we should do is implement some sort of slow writer
> > > > test, and see what happens with and without strictlimit.
> > > >
> > > > Tried to ask claude to do this for me, but not getting very far.
> > > >
> > > > So if I take this maintainership role seriously and not let myself
> > > > drown in the details, then the logical thing to do is to delegate ;=
)
> > > > Which is hard (for me at least) but I'll give it a try...
> > > >
> > > > Could you please check how things change if there's limited writeba=
ck
> > > > rate and we disable strictlimit?  And what happens if there are
> > > > several such instances running in parallel?
> > >
> > > I think for unprivileged fuse servers, strictlimting will always need
> > > to be enabled or else a malicious user can launch tons of unprivilege=
d
> > > servers and eat up the global dirty page budget / starve writeback fo=
r
> > > the rest of the system. Similarly for privileged servers, it could be
> > > unintentionally slow or buggy and eat up the dirty page budget. I'll
> > > read through the writeback throttling code to verify this and run som=
e
> > > local tests.
> >
> > I read through the writeback throttling code and re-read Jan's very
> > helpful comments from this thread last year [1]. So for unprivileged
> > servers, I think we definitely cannot remove strictlimiting. If the
> > fuse server is slow or unresponsive with writing back the pages, it
> > will take up too much of the global dirty budget which will degrade
> > write throughput for other filesystems (their throttling will be
> > computed against the global dirty page count, eg the freerunning check
> > in balance_dirty_pages() and the pos_ratio calculation "pos_ratio =3D
> > pos_ratio_polynom(setpoint, dtc->dirty, limit)" (dtc->dirty is the
> > global dirty page count)) and any fuse stuck dirty pages are
> > essentially unreclaimable. Without strictlimiting, there will be no
> > hard cap on how many dirty pages a misbehaving server can accumulate.
> >
> > With strictlimiting on and large folios enabled, the problem is that
> > the large folio size can potentially dwarf the server's dirty budget,
> > which can lead to excessive throttling. When I ran my benchmarks last
> > year, I and independently Jingbo saw severe performance regressions
> > for buffered writes with large folios (eg 2 GB/s BW w/o, and 200 MB/s
> > BW w/) [2] but I think that might have been because the machines had
> > limited RAM, resulting in a very small dirty budget. Fuse sets the max
> > ratio of the bdi to 1% of the global dirty threshold, so running
> > through some napkin math:
> >
> > On a 64 GB machine:
> >   - DirtyThresh =3D 20% of 64 GB =3D 12.8 GB
> >   - BdiDirtyThresh =3D 12.8 GB / 100 =3D 128 MB
> >   - 128 MB / 2 MB folio =3D 64 dirty folios
> >
> > On a 32 GB machine:
> >   - BdiDirtyThresh =3D 64 MB
> >   - 32 dirty folios
> >
> > On an 8 GB machine:
> >   - BdiDirtyThresh =3D 16 MB
> >   - 8 dirty folios
> >
> > On a 8GB machine (with assuming vm.dirty_ratio=3D20% and
> > vm.dirty_background_ratio=3D10%), we get 12 MB of freerun, 4 MB of
> > proportional throttling, and then full throtttling starts at 16 MB.
> > With 2MB folios, the 4MB zone between freerun and f ull throttling
> > doesn't leave that much room for the balance_dirty_pages() logic to
> > adjust the dirtier's speed, which I think causes the writes to
> > oscillate between freerunning and then being fully (overly) throttled.
> >
> > I think this is also going to be a problem for cgroups with large
> > folios since they also, as I understand it, are constrained with a
> > limited / tight dirty budget. I ran some initial benchmarks with
> > cgroup memory constraints on NVMe and saw similar instability (a
> > single writer in a 8 GB cgroup had max write latencies of 6 seconds vs
> > 15 ms without the cgroup, with the balance_dirty_pages() throttling
> > oscillating rather than settling near the set point).
> >
> > I think this problem gets untenable for random writes with large
> > folios, since dirtying just a few bytes will charge the whole folio
> > size to the dirty budget. I have a patchset from last year for adding
> > more granular dirty/writeback tracking [3], I'm going to pick this
> > series back up. I think it will be useful generically, not just for
> > fuse.
> >
> > For getting this to work on fuse servers with strictlimiting, I think
> > the next steps are to
> > a) as Jan had suggested in [1], come up with some heuristic to
> > constrain the max order supported for large folios for these fuse
> > servers if they're running with the writeback cache enabled
> > b) benchmark ^ and if there are still regressions, then we should
> > probably just turn large folios off for these servers
> > c) add the granular writeback/dirty accounting for large folios
> > d) look into improving the balance_dirty_pages() throttling logic to
> > handle narrow gaps between the freerun and full throttling zones
> > better and reduce over-throttling
> >
> > Does this sound like a reasonable way forward?
>
> Sounds good to me, since we have seen pretty much the same when we enable=
d
> large folios for testing.
>
> >
> > For privileged servers, I still think it makes sense to remove the
> > strictlimiting requirement or at the least, let admins opt out of that
> > if they are confident their server is well-behaved.
> >
>
> Here I'm not really sure what the most logical and sane way would be.
> I really don't like limits for no reason but I understand the necessity
> to have limits enabled for unpriviledged servers.
>
> Do you think a module parameter is the right way to go here?
> The connection parameter might be a problem since an admin would have
> to set it for a large number of mounts.
>

Not saying no to a module option, but I am curious.
This admin opt-in per mount could easily be implemented in userspace
in either libfuse and/or mount helper.

For such a niche ("I know what I am doing") feature, why does it matter
to do this in the kernel module params?

Thanks,
Amir.
