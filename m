Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C623E374178
	for <fuse-devel@lists.linux.dev>; Sun,  7 Jun 2026 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780822322; cv=pass; b=gZbxvCMBpvQOBy8zl/oo7qzlU1UigcGlX2IAm7uRRMEdG0cEKD9HJi8Jl/iPFsfGL4R/sJvpTKcGdHuHTQkYA2J606qUmDi4Iws31AHcFGpnlpLRFKFWmivync1ZiC8JOKGhjs9ffjgquWAsyaDKP16/vgQ2M4Klyk3FP0k8Lzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780822322; c=relaxed/simple;
	bh=HQ7eL9H0vx1RkQQYjPnLRgCiNO5wDU8NIfENntL+T0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MrWnSRl/VllifWYDOryyWWOs/9mTE9ilXKNW5W3rv0RuOOg6WvihwnHTF0eqS8AoqwTW/hsdZO5UXBPZeJFFMHHxiz3hpuEpJXPZh00HrPGgflrqrXbT8B39MXKeiU6xDA4OCzPJLS7s4w96R1JZkGgrwAfYNSUKSr15C8Lekek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQU5mbR/; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQU5mbR/"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-beeba001887so419736066b.3
        for <fuse-devel@lists.linux.dev>; Sun, 07 Jun 2026 01:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780822318; cv=none;
        d=google.com; s=arc-20240605;
        b=ZmUgD414A0hiZ+Zx/juoJlgG0FeWYQNsNGosQElFBhuq5MVnQDQl5jTTzOulg93pUW
         x62ShITN0TErd6yNJSZ+voQASbWVp/Ink4GplkD0hweHqvFtuASnuMNK6dBIEe2crjo1
         9xyBkfdosDYnVW5GJwF9g3oRUSbkiNeHYrxYz/iSYbNROwl/wxhlzEi7YOPkS+wzHpps
         rYUPhbm/79jd8p2aYwyI1H390UhdBcApNMh/2wcr8rTyM1DaF6vosMbc45wDUF0P12az
         KZWINrZH0zZgwWUlwgc3ZrNw5c4zxOLju2YdZOe9Fzx3YTgIcfD8xKlA/Oz7fDeMgt0u
         QdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oJViM4BQ64chJ+VWkODF1kN38NNZkSsZpn+5VIMmcf0=;
        fh=eTadWz+RpIAQhpBYHUh1tZZvsUtdKUaBYmOByH8wqy4=;
        b=PIeyfjZjNcGciMIDb2Bq8lmK3IGBlniGMsB9ceo60KzCX2x0NcIcSIJX1l293en9mP
         BFPMbgUOi6qdyFHW7RxYRPRkfcUTd81hkmZYUO8kAbjMKLM+GZuL9SPg9WnaHgoAd6Cg
         Lu90Ti/+H6ALQHo62Ww/VfCBJw17Z9y9tv0U5nTs/NTC0NrUBzuGYT0Vmb7dRjACafBQ
         BjZ2dbcckckOSx6a0YeVqJ9rWC/WAdEFeAKLpfMPatfj0V8ZOYUUpcV8H1Iv3SSA43pg
         w+D/ow0CQXbgmdzQjmKjQW9brCqfEXlwg4zPyucVFIfahjSehJcnhkMHteIYOTz78DJY
         WnZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780822318; x=1781427118; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJViM4BQ64chJ+VWkODF1kN38NNZkSsZpn+5VIMmcf0=;
        b=pQU5mbR/2jB6h7gowJtbn8ZrBrjk2gpWFeKdGFlL/QI5BypBzJA951gfqsWPMs9e8Q
         XmG71KAl0g618m3uW8i+E2SdjFU5SDKuEaZ/MrsWWDUSjl8/AN3FwhcwzHu30y0JahQp
         bN/ZoEmMycTihQthaYhRY1IjbRX9wTu+5/dsqgjc+xrbJAZ0X5sXZJfZy5R+XvL09K2o
         sngYA6R7NJrLtIay1KBTmK/WuNG/qwFi7MxfCJQcSHqXUMzv82DqeEUkHhdnh5buxhoy
         M8ZWlBVCGM9dDI2MGyuDzOy65b43W5wAjMd+qyskFmd+3+rEK2SkuPn/ca9ERURZz+pH
         B85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780822318; x=1781427118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oJViM4BQ64chJ+VWkODF1kN38NNZkSsZpn+5VIMmcf0=;
        b=gO1wlmEM3oLpyg25TLQjVjoJGHtHZ8EjLhOd9PVTif0pnOnJIZ3LBrUmE4XjQg4vi8
         JWNlIA8YedFkDFdaQPJSEk6nA2xqvovkSwal7GkfJTS3eMlulCj8ymDgBDGbFYQXboCB
         hv0OU0HemaCYeaWJ+ut5v16QVNDO+NBHpTh5/krL8FSGhaI3HXlHzJw3v+hClWKwIrEe
         lBTEufm7JgUZYGM7t/ORFGxEjdEe27Zv9X/D3Sci+wHItCaPfuPij9MYLJWkok9Ge+Ou
         TVe/8Ar/CR0wNiUis0t0XRt2LnbhrA84yUBCLO3A7YGHBXHk9f9NeVrNXcElrkkYw/wf
         Pvyg==
X-Forwarded-Encrypted: i=1; AFNElJ+0wJmirKNn/Fai/LaAMqluN7XP/206jjpsbsmUPsTy52ZJlQyk8FMF3rA/MY8vFkNcmDy4ab3BHtvn@lists.linux.dev
X-Gm-Message-State: AOJu0YwMba5L1urZvbQXXgX34TRdbgomk1JaUVlIQTsFCqM4MSRHMWsp
	m9kN6YH+E/ahfXiTblmE/p4r3BecdO6q1o7VzjePD8Qt2+13ceKz6B+++tAzT8/EOce5Vhf+ab0
	VAkvzYfnpG8yLcg6hWW1LcRteJLDDDL0=
X-Gm-Gg: Acq92OHNM+bBMJyNH5QYdZ4GJPYOnhqaDjuMHJb/OHWCVkn220NTvzZoH282jxIaxET
	bvA5Pm4eR7ZtFqfCfjZpb+GxsTtoEIIB3JzPQfIAZCaiAI5NwCf4DbbnasiW8ZrnaA6iK0r0vha
	gDtrN512I+CpDrNkP7HaEWRmTj7T7EN1OiUyMHbQAqRFYjQ3odDZPg4lgLnwwZnWkEPTzYPt/Hs
	UN6PuDcu6eubmGjHHqA6Q8fbUC2GZ3Hya326NIwfBv/Z0OCvk+FxJ3Sv0rihgwHkBIPVG++mbUq
	llsSpl9dXDXP2r07q9FMfF5BOvPNrr3gut2YmKvAjwdundFcDrFD
X-Received: by 2002:a17:907:948e:b0:bec:5ebd:e169 with SMTP id
 a640c23a62f3a-bf37263c586mr540431666b.22.1780822317605; Sun, 07 Jun 2026
 01:51:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177922944800.2436629.7011047808676668088.stgit@frogsfrogsfrogs>
 <177922944844.2436629.11205124993260163523.stgit@frogsfrogsfrogs>
 <CAOQ4uxjJ0eF0vE0hgsNoWqqD+UQ4r-1-b7493cYNPUGSUR+tcA@mail.gmail.com> <20260606045414.GK6095@frogsfrogsfrogs>
In-Reply-To: <20260606045414.GK6095@frogsfrogsfrogs>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 7 Jun 2026 10:51:46 +0200
X-Gm-Features: AVVi8CeX-CYWtozPdEggLEr7SF-dFvqQRU9-1yBy6T9oPM-xGLFMx0PzO09WKqo
Message-ID: <CAOQ4uxgWmXFxg1LG-J7hEW-Xs3jeEP2WP-zL23aZG-XGhRZ9KA@mail.gmail.com>
Subject: Re: [PATCH 1/4] fuse: move the passthrough-specific code back to passthrough.c
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, neal@gompa.dev, 
	bernd@bsbernd.com, joannelkoong@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 6:54=E2=80=AFAM Darrick J. Wong <djwong@kernel.org> =
wrote:
>
> On Fri, May 22, 2026 at 12:03:38PM +0200, Amir Goldstein wrote:
> > On Wed, May 20, 2026 at 12:29=E2=80=AFAM Darrick J. Wong <djwong@kernel=
.org> wrote:
> > >
> > > From: Darrick J. Wong <djwong@kernel.org>
> > >
> > > In preparation for iomap, move the passthrough-specific validation co=
de
> > > back to passthrough.c and create a new Kconfig item for conditional
> > > compilation of backing.c.  In the next patch, iomap will share the
> > > backing structures.
> > >
> > > Signed-off-by: "Darrick J. Wong" <djwong@kernel.org>
> >
> > Please add
> >
> > Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> >
> > and please keep in it future postings even with minor changes.
> > I realize that fuse_backing_id_remove() was changed in this version,
> > so that's fine, but I only know that because recent revision still fits=
 in
> > my ever shrinking context window..
> >
> > We discussed the fact that no one has lots of spare time for review
> > and re-review is a big production killer (in general).
> >
> > You must know that very well as a review and also that having
> > a "what has changed since last patch rev" is very useful for reviewers
> > and also very expensive for authors to maintain...
> > ...unless AI agents can help to generate per patch Changes
> > for the post --- notes?
> >
> > I assume that Agent can do that on a patch set after it was created
> > just by giving it two sets of patches?
> > For the very least, producing a "No changes since v.." should be easy
> > and useful.
> > Letting Agent go over mailbox and verifying that all RVBs have been
> > applied is also trivial.
> > I realize that patchworks and b4 review can help with these tasks
> > but they are more tuned for maintainers and less for authors
> > (I think).
> >
> > Obviously, I could do that with an agent on my side, but that is not
> > a good use of resources and not a good model to put this burden
> > on all the reviewers.
> >
> > Worth a try IMO.
>
> How about a range diff? e.g.
>
> https://lore.kernel.org/linux-fsdevel/177758364789.1315233.15610945404741=
826500.stg-ugh@frogsfrogsfrogs/
>
> I think I'd rather spit those out than either (a) try to remember all
> the changes (esp. minor ones) that I slipped in between two patchbombs,
> or (b) go all agenthappy.

Maybe I don't know.
At the very least, range diff would provide the annotation
"no change since last version", which I find useful.

My point was that the load of reviews is very high
so if something can be done to reduce the load of re-review
it is going to be a win.

Anyway, as long as my RVB is preserved across revisions
I am good.

Thanks,
Amir.
