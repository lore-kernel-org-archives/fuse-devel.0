Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3A83B8D6C
	for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 01:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776908884; cv=pass; b=k0jX3qruzHhUHHSDZZdj8zHM2hMQ2ZV3OYZvW6HFwjsdg+ldy5ouFUSkmcROphfFz42FdFb/5IX47mLAfBSq4YjBRQWwiC60ADSU64FiNuFcdqyB6mGlCKC0L65y7pQIYXt8LNcCUVKGNWCf4DOSCT9iZTiyoik4pELaXaSQLwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776908884; c=relaxed/simple;
	bh=2IcsEgmwv1tHo9NlWhYIhJT+gMNWASELy9M4/IYp7BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J2Vh0I+DprvqHfhsK6oujyo/OZ0KpdYZcyJnofycInR6ZLhyYqNqMWceEzA3kKm0LGMAyGBhzapAVCKPhQek0BolyPlP6sC5VQ20VyQsL3+zZVYeTj5nYpxNUThlVlKs8I0D6R9WLZUmjj8PFciIhsDBXQ14wXgcTtqDrr5iDOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mE9vi1qS; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mE9vi1qS"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d77f6092eso4187292f8f.2
        for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 18:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776908872; cv=none;
        d=google.com; s=arc-20240605;
        b=A4VtaQ4hbi0TeNi/8AD/kf4NG55MSvOTCJ5HWpXNtnsD+noHDIkLQheBDurqaarQBA
         jw0XCuTyv04erysp5mNPsGX6hFrregI85DP6mpLaNXM6B4veJwnDw0cBL6B9sDYANBA3
         RvoAX/QJUsFWCKOp3f1OXtRordTNArER9uzBZtqJPkqmiMyd6cX704ivvHvJ/tGdD900
         OSvImkBsejqEPg8tR8kF82gUd+IkCDZn4VguP1N+JNLoKBMIv93RkTG8FlxwVFNo6C7o
         sz8hIwH5MiRVg70tZQI9+GxVpQd3LoMyvpDJTeawBajLtj/9REHf9/2PlUlmkSD6lA2k
         kh8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b7w7kab49LzxI3lojQRNK57QNTxhWyp4IN9z1O9f+vQ=;
        fh=4CbqyR+mNYd7sFIXbx+XYnuQwEuPLqKbonEGDWRN4oo=;
        b=fT8XgkCIsKX6Ua0T21zZvwUnmHLO7WrVGGexf+UNM5TcnWcCHTuT1YiWrv2+pVFoCs
         Zk24aJAasJIdv5cP+lO5810SaQyxujnHm8hcbO0vRnLaiJQHsJ4nvwBd7A2zFuPnkX5J
         Bw2EQCnxK0PRpqv+fOY1Omd54hWJDkKMZrWS+/h9C/QyNhJfzYeP57VqrzILGKbAXno7
         8GDT0oxd2rf+mHL5IzUA7o1yhtWQAXYLw6G6gce468GiOFofZ7jccvAZNYfQLsA1cLy/
         KQ9JOVZPxQAW6KzmukL1f8y+a6Y0Wj3YeOuCdJ6rEQCA2cPWfkr7yGM3e7P3QQK3wHjE
         QWvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776908872; x=1777513672; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7w7kab49LzxI3lojQRNK57QNTxhWyp4IN9z1O9f+vQ=;
        b=mE9vi1qS7v4HG/45Plq3mpDw46H8UORFBDLuOBvG35Xa2hz7h8sE+Qs5+2qwa1GWGf
         4YS/n2LClze5KFwrWrewZyClbM1zqIcaPsnVnVwxC/XI05X2JjOae7Qta6ot5Nd6Azns
         oOHvEna8RWPj6NTM2Z1a/q5RuPpIAGCcD74zWADyjohzeqoybavsEoWygJLbwUsjfwWU
         9MFOlwx/IlD2JizQdUH8JXUEJgvYlPE9kQut/N8LLtFBqGqqEpMGTBZn1+qzCl8+ggbX
         udMcOkEB/OzQS4O0i0NVolVSnrI1hMTamFdnAsYU9EHRi2ZnRnydBuwr4Cd8Njt7B7En
         jK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776908872; x=1777513672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b7w7kab49LzxI3lojQRNK57QNTxhWyp4IN9z1O9f+vQ=;
        b=SAJ48K16xvkJUiNIzR7np3gQaUeYDMr44NY6rVbIleJHH/jSyirP0J+B7QR9ALdpDH
         uO41vB5rtzrStsKN9ypoNbrC0J8HWNAyWGCPQMnNSONQjvyeowFp0WrPRxrIo7jgEHJx
         sD0fCvBKqdwTJ4NRW4R/bBVqJeSgEaheRwRQVBAYOO/9d4VYSPbbhuh6UAcexvvm0cc3
         ACXKfAGfYjC3RwmBqnbfy66VZ1FRX9XznRkW1VKLPfxEQ4byfIkuBiO8fXoQITLEuVnd
         7pvWKBr7NU2QPC93a2pcTQlkSQQkJFtT7A2I6vx34xnDvwPjyOaXdHO/j7hA5yLY7xhn
         ZHAw==
X-Forwarded-Encrypted: i=1; AFNElJ9IhPQ+ErmLl9UnZMPjL6JGszHJjWVHEzagwHOwccediCAcCeDMhUneC5gpFm17YTXoWQ+E8Q5SIB+j@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+WEnULGTmRxUeEawwteC+dQsiKvti5PUxMrl/8r4MXn/J43Hy
	1t2u2H4YqqGoZJivtcFtlKsFttN3Q1ee0CJW8bt7a3UdDd6/K35U70sB7vBK2ZjZoV/4xngnLVF
	/kvvC4SgYk56HX45mUwhfsJRywTYnWg0=
X-Gm-Gg: AeBDievZ7Kv8+PlqrubMgKTXCfrZMbdu22vH1GE133vdRdRxx3HVSDAkDDtRkVCIfUQ
	g775/W17B+gdk2hmcbtBygQC4gojPHLDB3BL+7P2iciiK8CLKsEYmToBTAtRWqyHu4OnipCsvF0
	UfF94Seayj6nhH98bOr4qkHgDLHmfQymRTV53VxzhPYreqRKjO8mJiOIvqdOW6IY1EuhBf9/h7I
	5+/vDEqDcfAE3oHWSIe0zL9mciGMFnmwWcfciE88mexaO+E5r4uv4Ns6wSRtbMkEGhdacAaokt0
	06dixtRIVfamjPcf
X-Received: by 2002:a5d:64e4:0:b0:43d:7828:1f81 with SMTP id
 ffacd0b85a97d-43fe3e1170fmr39204258f8f.41.1776908871830; Wed, 22 Apr 2026
 18:47:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-9-joannelkoong@gmail.com> <CAOQ4uxh0E6BtxRVsJdvebybnvU5+n-bur-+SPySNAbKzdY59vw@mail.gmail.com>
 <CAJnrk1YWpAZR5bck27s2P-Zm1s9O0VMMHNztEOMYutVgQ=CwGQ@mail.gmail.com> <CAOQ4uxhVPCp2r9MehO1o6L1J0J3WwGt_iK23-0hWpw+8osmKhw@mail.gmail.com>
In-Reply-To: <CAOQ4uxhVPCp2r9MehO1o6L1J0J3WwGt_iK23-0hWpw+8osmKhw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 22 Apr 2026 18:47:40 -0700
X-Gm-Features: AQROBzD6FjHHhcj-2EjoP9BFRmwWrtHS21FpkqLu7FJhsIgreIgslVzip2ceU3I
Message-ID: <CAJnrk1bx7qnPMNGGYP1UFgaf2xb0n0z8TaWqRMEJ3z2_rCgpqQ@mail.gmail.com>
Subject: Re: [PATCH v1 08/17] fuse: add passthrough ops gating
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 12:27=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Wed, Apr 22, 2026 at 4:57=E2=80=AFAM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > On Tue, Apr 21, 2026 at 3:48=E2=80=AFAM Amir Goldstein <amir73il@gmail.=
com> wrote:
> > >
> > > On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@g=
mail.com> wrote:
> > > >
> > > > Route existing callers through a passthrough ops mask check to veri=
fy
> > > > whether passthrough can be called for the operation or not. The che=
ck is
> > > > only done when FUSE_PASSTHROUGH_INO mode is enabled, which preserve=
s
> > > > backwards compatibility with prior passthrough behavior.
> > > >
> > > > It is safe to get the backing file by accessing ff->passthrough dir=
ectly
> > > > in passthrough.c because passthrough.c is only compiled with
> > > > CONFIG_FUSE_PASSTHROUGH=3Dy and the caller has already done the ops=
 check.
> > > >
> > > > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > > > ---
> > > >  fs/fuse/file.c        | 14 ++++++++------
> > > >  fs/fuse/fuse_i.h      | 14 +++++++++++++-
> > > >  fs/fuse/passthrough.c | 12 ++++++------
> > > >  fs/fuse/readdir.c     |  2 +-
> > > >  4 files changed, 28 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> > > > index a15fb508fd28..45d9184d0f7a 100644
> > > > --- a/fs/fuse/fuse_i.h
> > > > +++ b/fs/fuse/fuse_i.h
> > > Please document the relationship between  FOPEN_PASSTHROUGH
> > > and FUSE_PASSTHROUGH_RW_OPS.
> >
> > I will add a part about this to the documentation patch. In this
> > current series, FOPEN_PASSTHROUGH under FUSE_PASSTHROUGH_INO does not
> > imply FUSE_PASSTHROUGH_RW_OPS. FOPEN_PASSTHROUGH can be set with just
> > FUSE_PASSTHROUGH_OP_READ or FUSE_PASSTHROUGH_OP_WRITE and does not
> > require both (eg server wants to intercept writes for logging or
> > encryption but reads can be passed through). For mmap, it would only
> > be passed through if both passthrough read and passthrough write are
> > set. In the non-FUSE_PASSTHROUGH_INO model, FOPEN_PASSTHROUGH implies
> > both passthrough read and passthrough write.
> >
> > Do you think this makes sense or am I overcomplicating things?
> >
>
> I think it makes sense.
> My internal customers have this use case (passthrough only read).
>
> I have a library (libfuse_passthough) that implements fuse passthrough
> template fs in userspace and this library currently uses kernel passthrou=
gh
> only if both passthrough_read and passthrough_write have been requested:
>
> https://github.com/amir73il/libfuse/blob/fuse_passthrough/passthrough/fus=
e_passthrough.cpp#L997
>
> Note that the library provides this granularity at open time, not lookup
> but we can also think about extending the FOPEN_PASSTHROUGH
> api later to allow this.
>
> > >
> > > Does a server need to opt-in both for the read/write operations passt=
hrough
> > > and the specific file (I guess so)?
> >
> > Yes, in this current series, to use passthrough read/write, the server
> > is expected to set read/write ops in ops_mask when registering the
> > backing file (inode level) and set FOPEN_PASSTHROUGH when opening the
> > specific file (file level).
> >
> > I left a comment [1] on your other comment about dropping the
> > expectation that the server needs to set FOPEN_PASSTHROUGH in the
> > FUSE_PASSTHROUGH_INO case if it provided a backing id in the lookup
> > and set passthrough read / write in the ops mask - I'm not sure if
> > that was what you were hinting at or not.
>
> I actually did not mean that, but now that I think about it,
> FOPEN_PASSTHROUGH + backing_id could mean as today
> "request passthrough for lifetime of file"
> FOPEN_PASSTHROUGH + 0 could mean
> "request passthrough to existing backing inode"
>
> IIRC, the value of 0 as backing_id was intentionally reserved
> for this purpose.
>
> > [1] https://lore.kernel.org/fuse-devel/CAJnrk1b=3D5vRgm1otKAiaeFJr9_J-a=
LnoVTp4MHAz2mBKtcE2dw@mail.gmail.com/
> >
> > >
> > > The concept behind the inode iomodes is that it is not allowed to mix=
 cached
> > > with passthrough ops on the same inode, because there be dragons.
> > >
> > > If the server wants to opt-out of passthrough for a specific opened f=
ile,
> > > which already has a backing inode, it must explicitly request the com=
bination
> > > FOPEN_DIRECT_IO | FOPEN_PASSTHROUGH
> > > and then direct io will be performed, despite the inode having a back=
ing inode.
> > >
> > > What you have done here is a private case of passthrough opt-out
> > > not per file, but per operation.
> > >
> > > The bottom line is if the fuse inode has a backing inode, then you mu=
st not
> > > fallback to the fuse_cache_ operations in case the op is not in the m=
ask,
> > > but you may fallback to the fuse_direct_ operations.
> >
> > Thanks for pointing this out. I will add this enforcement at the
> > kernel level for calling back to direct operations.
> >
> > This is what I have in my head for how it'll work:
> > - server opts into passthrough for both reads and writes
> > * server sets FOPEN_DIRECT_IO: reads/writes will be forwarded to the
> > server, but mmap will be passed through to the backing file
> > * server does not set FOPEN_DIRECT_IO: reads/writes/mmap are passed
> > through to backing file
> > This is the same behavior as the non-FUSE_PASSTHROUGH_INO case
>
> yes.
>
> >
> > - server opts into passthrough for reads but not writes (or vice versa)
> > * mmap is never passed through, mmap will always go to the server
> > * no data caching will be done whatsoever
>
> mmap cannot go to the server without page cache
> and this is what we were trying to avoid.
>
> > * server does not set FOPEN_DIRECT_IO: reads are passed through,
> > writes are forwarded to the server
> > * server sets FOPEN_DIRECT_IO: no-op (same behavior as if server did
> > not set FOPEN_DIRECT_IO)
> >
> > Do you think this makes sense?
> >
>
> Unfortunately not.
> Splitting reads from write logic does not work for mmap at all.
> User always read/write to the same memory, either mapped
> to backing inode or to fuse page cache.
> The logic of iomode.c is that if a backing inode exists mmap
> always maps the backing file.
>
> Server could request to get normal READ or normal WRITE or
> both by not setting FUSE_PASSTHROUGH_OP_READ/WRITE in
> ops mask, but it cannot opt-out of passthrough mmap.

Agh that's right, mmap directly operates on the page cache. The
corrected model for passthrough read + non-passthrough write is then:
* reads and mmaps are always passed through, writes are always
forwarded directly to the server

Thanks,
Joanne
>
> > >
> > > I hope this does not complicate things for you too much,
> > > but I also don't know (yet) what you intend this gating for.
> >
> > Thank you for your feedback, it was all very helpful!
> >
> > The intention of this patch was to support cases where the server sets
> > only read passthrough or write passthrough but not both. In this
> > scenario we cannot rely on "ff->passthrough !=3D NULL" to know whether
> > to pass through the read or the write, so we need to check the
> > ops_mask. My intended use case doesn't really need this, but imo I
> > think it's overall a useful feature that other servers will want, but
> > if you disagree with this, please let me know.
>
> I think it is a useful and common use case and the implementation
> should be quite trivial following the lead of the FOPEN_DIRECT_IO
> per-file opt-out.
>
> Thanks,
> Amir.
