Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44664C6EF4
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780650918; cv=pass; b=q7KMjd+P9BoaNPAfAvg57trQkiZl0Wfgehi3c6fGgPYlGdcmKAzgueFolHLhxpCN0rksc84B6G3YWK2pDLSgGVXCrj/aMaK2acyaAR1TnWDw+d+WP28QkPQ2s/pYlPU9+KEbNLGrutSAKqCkNx/6WRF/i7udmgfVfYh9u4OSUms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780650918; c=relaxed/simple;
	bh=qFH47gBvjitroCnTL3mOyEu1giksZsexcUqzcotk670=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uaf6H9iCtCMfP9/bwFxMAzq26ZDDaYy4ATmENajiA4azqVZmiuGu6PO21tnvxlGlRgVKDyhdkrqs15ATLdDnlx81qKBSod8RwfPJ+Xe+HPqyTFW9s5B1XAxgAtk9mixUBQ+ccm2t3fDXQD8adqfyA3AJl3vp+pkzZM8qSGXTKvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YP1FW9kM; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YP1FW9kM"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68acf0a15b3so2763614a12.1
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 02:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780650915; cv=none;
        d=google.com; s=arc-20240605;
        b=CH3i9Y6N1Rp5EGBbF3PY/E0WNk/E3d4HOBrU4JJC21Gko73jne4kuBVq5uOjkXBLy8
         agSTr9czBRKUaWDGVo4dLp3eAv8trWsji7F14EyA6mcV0s2PnAkbLN9/hWV/7ifH58A9
         /BUJfwC3a3kR4B04S666CdPX8ZAbmdd7KPmqiwH6SvJhqXuSSXPsLNRvQROvsA0n5mz9
         XXdNWdv8aIpUT+A/xrf2MXlBov1EZVcWCuIHHlxOwCJakvjkrsAjcp+nLFNfB5SLvJKq
         FNXR8QnmeZq733asdk9nbrhzDN4jmRB3uZPqfvgf/X7EN3O/2l2jhOnDY9TTVnOrLzNL
         MR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jr479kzHkVSmP26nVlF8fIgrOFb6CLTrJUzA70hRwdM=;
        fh=H2BOXJTg/Vf6yD4drnpP6Ug4Py4duKW3QGhH+7ZhpFM=;
        b=h/+BP71BHO15siKsK0ZLmd+NSrnDkQkIu9KkMpNdOe92WkV0aZp7laRINBgjqagfPs
         axKQHK63Lk5LCc1OunmsRCyAOgr2EtRlrBwd/0u9Y1cbaMwZERB0mTjxpbfshhX3uWVI
         hiQDjOW7LtYDS+zLLBQXUaIjOE4n2nhPwyOsY+waM47PzspaAHcEv+9xFR6qa5/ACpCd
         jdrxlKFWoQA8PdaPkcHQlyOwQiCK/q1K6UMkUZCa/d+CybnL94wkTbDdKEBhWue6eL0w
         IYXbUlXhfroXGyuCx9P4jmJbCLnaBKoIK4bcHnWPU2CFTYvyn7S0wVnrQc759YZh7M/d
         Um8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780650915; x=1781255715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jr479kzHkVSmP26nVlF8fIgrOFb6CLTrJUzA70hRwdM=;
        b=YP1FW9kMr4soNZs3B5VEL3uUfi1DwnDcwyHIQa0EqPs5GhdmOHZvME+IYNbpYSjEB3
         o53lHxW+EO9hoSzI8EyBJslyP0cjEbJQg4Sj8SEOgLrfgX9UJfkIQgfWXwyHThc6DwyW
         /t3RTZuUV+/wAg4lKiSgYa66lsCj6QR9ZdUmCaBvyOhnQN458mxKR+RBKpHKpgt35Axn
         49riH7sbC0WAx6PZtrKiK/9ibYgvwp1Tfe+J97OQnj9HDibSO4H9Hyr5IRnO4fjnDnrr
         70Je/+lZUUnOYxmobF2XT8e03FLf5ssyG8Uc9WBoEsIHMLQgSANArpKV+KsD02gCzez0
         RIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780650915; x=1781255715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jr479kzHkVSmP26nVlF8fIgrOFb6CLTrJUzA70hRwdM=;
        b=dKBUjPKjtzP5FNP3pNBiZVVpOJ70mS0RRWCxucyrtBJ1mgzf4OJkAs85FatH8pOd2U
         e6aMdw1pwQLg+MLt4R4nEVnYvc/K1sZjR6qxUke9Wstsvcll8DtfQ+njaiAnSePm2IZl
         9dBG2nrxK9HjEastu9bWA8oLlG3GZAUdbwSVnon3k83jT099NxVa/FatMenl0VwYTydA
         ykbj2uZfswmpvGvLr/Bw795J+b+htR1mrChJavRjnKfd7gGXe/99A0p8tyPPrf13JzdO
         EsLTEBm0NGzP2SrFzS3jkSogIGuOMK+KbvJF/KY1537HWYvoaCxlNGbdRGqGNLuaHb/B
         6TYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iPg8YaSbVy2WnfOuVyx0KXpkQ3R+abqZfDhBL4kWRctuaDINSVZqD3ApjIW2EOWzM+NLe/KGOylG9@lists.linux.dev
X-Gm-Message-State: AOJu0YwkMPdAAoTf4OjBsKyahEbNa/2wYU44tewjz0fFRhGZhriwvxFn
	OD31cGYXVg085ioOmP6GtTbead12LspGvVMg8ny02TbEqfZ2H+CmrKjjTEPQqFJoZy7Q3UPBSON
	QrrJqIA2/GhJ1/z6u11jj14b3XKf/1FSSYOqk
X-Gm-Gg: Acq92OEurupc2/bTnDxZ6mmhzc/y8doJdjgTmvRpdt7dgqzTat5ynOVXoVIN+yrsTjO
	qbM/wvpiDHyXr3/Zhpyagq/+QhYY+N+qzRdoWup3MKs9osIxPj6xvVn5sLW/cnFa/BpfSzPJUaM
	r4C0WrCQLKPz/3C4gc+UYeU1J55C1W6w7zao9K4/+sgtdhZXpH6jwmJLuU0LRJ5wzNMtnj0cC2c
	VNZYDyNPzQnXmORfr76LflZsR4eGkfTYc9zdJxsJbDlJ3mAtmkq4CqvOUV6WWw2bBWB/e9f1y/2
	357e9Xwl5sFs1iLF0GlaWhaHmHitJxfSDtuy8YaVquUpUAm+/uX+
X-Received: by 2002:a05:6402:321c:b0:68e:2afc:59af with SMTP id
 4fb4d7f45d1cf-68fa4d2425amr1234883a12.10.1780650914879; Fri, 05 Jun 2026
 02:15:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
 <CAOQ4uxjCKFdxryKeLQw3M4C7Jn8tOQzUELqBSu8s5nOU37m4_A@mail.gmail.com> <aiKGgCRxCPOavEnu@fedora.fritz.box>
In-Reply-To: <aiKGgCRxCPOavEnu@fedora.fritz.box>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 5 Jun 2026 11:15:03 +0200
X-Gm-Features: AVVi8CeeG1SZ2Ns7DtYPUM6e7gOve2vABpqf03a2DD4sg_erWFtDS5npjd_LLhU
Message-ID: <CAOQ4uxgee3qqYveSP+iu9pWPqCekgzkkj-V7r0Z83CKvdtqLnA@mail.gmail.com>
Subject: Re: Re: [PATCH v7 0/4] fuse: compound commands
To: Horst Birthelmer <horst@birthelmer.de>
Cc: Horst Birthelmer <horst@birthelmer.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Bernd Schubert <bschubert@ddn.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Luis Henriques <luis@igalia.com>, linux-kernel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	Horst Birthelmer <hbirthelmer@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 10:49=E2=80=AFAM Horst Birthelmer <horst@birthelmer.=
de> wrote:
>
> On Fri, Jun 05, 2026 at 10:12:59AM +0200, Amir Goldstein wrote:
> > On Thu, Jun 4, 2026 at 11:51=E2=80=AFAM Horst Birthelmer <horst@birthel=
mer.com> wrote:
> > >
> > > This series adds a single new opcode, FUSE_COMPOUND, that bundles a
> > > sequence of subrequests into one round trip.  The wire format is
> > >
> > >     fuse_in_header (opcode FUSE_COMPOUND)
> > >     fuse_compound_in
> > >       fuse_compound_req_in
> > >       fuse_in_header
> > >       payload
> > >       ... (repeated per subop)
> > >
> > > Compound is opt-in per connection and discovered by trial: the kernel
> > > assumes support and clears its flag on the first -ENOSYS reply.
> > > -EOPNOTSUPP declines a specific combination without disabling the
> > > feature.  In both cases the kernel replays the subops individually
> > > via fuse_simple_request(), so callers never need a separate
> > > non-compound code path.
> > >
> > > The series ships two consumers:
> > >
> > >   - open + getattr, used when fuse_file_open() needs both ff->fh and
> > >     fresh attrs (O_APPEND, or cached attrs already stale).  This
> > >     closes the open-then-stat race described in [1].
> > >   - dentry revalidate, fusing LOOKUP + GETATTR when both the entry
> > >     and the attribute caches are stale.
> >
> > I am not sure if the intention for fusex is to carry over or phase out =
GETATTR
> > in favor of STATX, but apart of the strategic question whether FUSE_COM=
POUND
> > should or should not be added to current FUSE protocol, we need to answ=
er the
> > more concrete question:
> >
> > Is FUSE_COMPOUND intended to improve existing unmodified servers
> > which link with newer libfuse and run on a newer kernel?
> >
> > If not, then maybe we should start with OPEN/LOOKUP + STATX
> > from the start.
>
> To your first question about phase out of GETATTR, I don't think so,
> since fusex will use the same opcodes, so it will be there and we will
> have to fall back IMHO.
>
> I have told this to a couple of people I have talked to about fusex
> I would actually favor to negotiate supported opcodes and features in fus=
ex
> and adjust and overwrite the write operations accordingly. This of course=
 is
> miles away from the current state.
>
> I don't think compounds will do anything for fuse servers that do not sup=
port it
> and that don't have special cases that could be made faster when basicall=
y knowing
> on a semantical level what the kernel actually wants (this is like some s=
ort of
> lookahead in fuse requests. If you are in fuse_atomic_open() the LOOKUP y=
ou are
> sending is most likely followed by the CREATE right down below ... but th=
e fuse
> server cannot know that unless the kernel tells it)
>
> It could have been when the compound handling of not supported operations=
 would
> have been in libfuse (which theoretically it still is), then you will sav=
e
> user/kernel space switches, but when the kernel has to step in to do the =
'legacy'
> calls you actually will lose that intial try, where the fuse server tells=
 you
> ENOSYS or EOPNOTSUP.
>
> So when linked with a not yet existing new libfuse, we could get faster d=
ue to the
> lesser switches to user space. Do you think that answers your initial que=
stion?
>
> I actually have an implementation of the atomic open (this is counter pro=
ductive
> for upstream, but I'm using it here as a concrete example to calrify the =
more general
> point) and since our fuse server can do the atomic open  way more efficie=
ntly
> (everybody knows by now that distributed locks cost you performance)
> I get 15%-20% more performance on metadataa tests.
>
> The definitve answer here is probably somewhere around 'your milage may v=
ary'.
> I'm really interested in further discussion about this ... and your opini=
on here.
> Would you want to use compounds for some case?

No, I do not have any use cases for compounds that I am aware of.

Compounds of READDIR+STATX was discussed as an technical alternative
to READDIRPLUS2 which would need to return backing_ids, but I am still
if this direction is worth pursuing.

>
> BTW, OPEN+GETATTR is a special case of OPEN+STATX, isn't it?
>

Yes, I was asking whether FUSE_STATX is expected to supersede
FUSE_GETATTR in fusex. I don't know that answer.

Thanks,
Amir.
