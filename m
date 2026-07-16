Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686B33F870C
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784225897; cv=pass; b=QDgpXONrBf0vfnvLp0L+X4d9vflKvxYNX3CDRJ3wphKao2PmF60ic1QJsU+FItDc6dgUByBY/QtUf7IcSo0lVOTQc3FofwVGwHE2UxnvwI9WK7nzkYccRm+hshef3zM3vtPHZcSPU78Ic/m1/tBJsk4y2UZfGvDoNglR+16gL1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784225897; c=relaxed/simple;
	bh=upO5nduqEjh1O333xP1lf7qLObT1k2t9G8uyP7OYULo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3K9XyvX2QGVP4vcFyJ3I/mc01vyqipYAF2OXmE3nKVDHlpVG+emBONyXjGTkZr0qc5AmPMyGywDxqZlaTuiGTg9nLkUyKaSG8UifUVly2G5XNAKDDk16XXiGIrNlyeeyihxjOydys92UFEfkzS8p+3RxHj3PQoB9o1zvDw4nSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnvascMd; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnvascMd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493f25d47dcso21761585e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 11:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784225893; cv=none;
        d=google.com; s=arc-20260327;
        b=Ymi1AGYrx8mIalmw84XEm029OlqW/F+6LosLFz0BVx2c+/TAp0hM7kEVaTPPxB9kFg
         I5ns6Ze+uDpQy8t/2MJwWfscbCOchxtBWs2pmyC1SRsWrW/VI8orKI5Xr/f9O8wPZtO5
         ceCni2QGeVQGOdgiSoEVCzYmRv7LEyUWhK7OTtx0H48VhZ7wbxgVZuP2Or7aWEULgq8i
         PnoFrZOfXeyBfvj0bLM2AHSoSZr9NWg2YEr/PQ2nNw2Nz2jK1+yWUFRjpWxg7hRbZPQo
         KFSjspErMgxU3k+Uyr2OoE/fVj3de/NDzquOIAAiD86cncFzn7ujIfXvO/YmzHfbjdFX
         0Opg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FxN2/D2tlTtH/J7f3tJFTTV+44thI+Z+5mi2902UYhc=;
        fh=Pqamkikzro3T4GVdrJzOCVPoFYxnU/HCBf6R3wIJ8J0=;
        b=bd+prqw9HKBfs6RndL0PN8EPYRQei/F8zI8oNPaY1/uN4yFV+sYRpxYSuHj9M8PFUR
         tyr0wR45D86Abe2C1JHgyw2CQgFkSSHNdiy7c8GaycffGEjDzlq8GqPJTiruHAnJSyBO
         LXsBmElYOVlYaqoNmKY6hhkR1RKUsB1wmjzGAXI6rNoOOA5It4LG+hMixTSEm7FxjaIJ
         lPgoZErkCgIlhs9nXdLxjMESOBZ8JL2UN7tXkiMaNP9kdgtBpTzvHQdiHGiiBK0RoLN9
         QcXDsPovB8KoIEW3xgD+QdEzIunokw9vHvy9CEYWCHE/yMWLONdATY2H0OaSWKxh+dJD
         kB/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784225893; x=1784830693; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FxN2/D2tlTtH/J7f3tJFTTV+44thI+Z+5mi2902UYhc=;
        b=cnvascMdYUjOkZ0dd9rHZ0ub9lPto/VpReN9PT/tzb4kFdCeKh6ZQ4vOZSFbUmvfKw
         uwzPU0vNQd3q9sdvCkQZRX07AgdBQ6/TdSObSAhJ6Ogp9UknE3fiYHXiYLK7CbGFTUYF
         WOmwr6OsHZTKCJWde+xATzVuXdY+OyVpE6mpsTxuoYmP9oTbZ535O/9IdD49QufKU+oG
         Pt/JnMJz1D5uUj363m2gMZVsIthRHQNtgtx3ufrNIAVQabYUiyOvt8724mjhZW2Ujhle
         wyQuD4MlJl3POynBHNb4zfYaTw/hAvA0NWcsXAZA2d29zmfArzqWjp5xaz96XlRqobxc
         oOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784225893; x=1784830693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxN2/D2tlTtH/J7f3tJFTTV+44thI+Z+5mi2902UYhc=;
        b=BA6BQTkz5jaQiFxFzAKwR6aOjzsQDN1ctbH0Zac/NIrq3ax7E+FNIIEaI0H8d9nOPa
         w0JahmM89Y1DY4CAGARTepGgX42QebkO7JcNZx5QvWdBqhDPUM5nTfkV+rUKWsZBWCYn
         GYr+lF8O+WbpxyPDBFBht3walJ7Pc/NmlTcUjbUZ4T57VWEBIiG8hE83J+Bo9/+VK9AJ
         if4o3D1kKNhRVFDoXK8G5mOsHtW8tN4KPdEaVQUIY60aAb94siDg1K3R5AW9e/xgZ8hx
         CqmHX8r5ZKFmNmmjARKSxi9YJn8CjQF5u+FytQ961ZEB3yBG7jgtRa6TdAbTrcqwnfjr
         GOqQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHWQiobth835lRwVo2GI5LtovMPzzrFT7LKB60TUqpWPt0hL8LrvhkRt5f0+U5/u4C6QLkX1v1iSDb@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1wjI4u03ZSzuU2il8BlFiS9zQfkLNhAWh7TM4zDo0fw0udXKA
	qn5vDG2XIB+t8tsv6nrJK4hFz8vFzfN0/jZ6A93SQeh/PCUra53dcdevkRdV1Q1pLqbsXKNEbRf
	IWgYEn5S9CCSZSSjdNl7GICJOe70Cq4o=
X-Gm-Gg: AfdE7clPcG91dl9B8nM2/rdbsvLNvnSawcDHQ67KfCAsUj7dlMldirdWsr4+CBJ1H9r
	82Dwm/weQaLkz886op4OOJ9DVfppdOJ8c+ognsJp8QxrPM6qA9kd19tCvBQUveAmYJjUTKN6saX
	QOHID4iH2AgzTnFJr3117BD/jqDceXe7xHWZuelJ6FeEY2H8LNZgGXouvg8f+3+6NGZyln0pQiJ
	5LYPfWKUb7Okc4ptouGb1CewkdVFyHDR8H3WCz7UBW7GNjKriVMWQAVWwWwsGF7A4hX0NwMfKmC
	/hQhNyQtVyOChbj2j27Zat8YpdghIwGI6jt0PmkMag==
X-Received: by 2002:a05:600c:548c:b0:493:ee2b:c876 with SMTP id
 5b1f17b1804b1-495483c839fmr5254685e9.35.1784225893091; Thu, 16 Jul 2026
 11:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715174305.336261-1-joannelkoong@gmail.com>
 <20260715174305.336261-2-joannelkoong@gmail.com> <17c5a1f5-0743-4c06-b771-2562ed6d45e2@bsbernd.com>
In-Reply-To: <17c5a1f5-0743-4c06-b771-2562ed6d45e2@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 16 Jul 2026 11:17:59 -0700
X-Gm-Features: AUfX_mzO9FaoEpefIv6-tKxJZWDlmYbleseNkoAvr5BSXGeSJoeEmHYa0W81Dtk
Message-ID: <CAJnrk1Yqb3tpkt4-LT=7Q5rVUMmwNDvV_OM7bcF6P4u=1P4F8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] fuse: fix missing barrier when checking io-uring readiness
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 3:26=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
> On 7/15/26 19:43, Joanne Koong wrote:
> > fuse_block_alloc() reads fch->initialized and then fch->io_uring.
> > fch->io_uring is set before fch->initialized, ordered by the smp_wmb()
> > in fuse_chan_set_intialized(), but fuse_block_alloc() has no matching
> > read barrier between the two loads.
> >
> > This may lead a CPU to observe fch->initialized=3D1 but fch->io_uring=
=3D0,
> > and skip the check that blocks request allocation until the io-uring
> > queues are ready. This can reintroduce the lock-order inversion deadloc=
k
> > that commit 3393ff964e0f prevents.
> >
> > Add an smp_rmb() barrier to pair with the smp_wmb() in
> > fuse_chan_set_initialized() to prevent this.
> >
> > Fixes: 3393ff964e0f ("fuse: block request allocation until io-uring ini=
t is complete")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/dev.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> > index 5763a7cd3b37..b70c536d7e25 100644
> > --- a/fs/fuse/dev.c
> > +++ b/fs/fuse/dev.c
> > @@ -85,7 +85,13 @@ void fuse_chan_set_initialized(struct fuse_chan *fch=
, struct fuse_chan_param *pa
> >
> >  static bool fuse_block_alloc(struct fuse_chan *fch, bool for_backgroun=
d)
> >  {
> > -     return !fch->initialized || (for_background && fch->blocked) ||
> > +     if (!fch->initialized)
> > +             return true;
> > +
> > +     /* Pairs with smp_wmb() in fuse_chan_set_initialized() */
> > +     smp_rmb();
> > +
> > +     return (for_background && fch->blocked) ||
> >              (fch->io_uring && fch->connected && !fuse_uring_ready(fch)=
);
> >  }
> >
>
> I wonder if we could remove smp_rmb() in fuse_get_req(), it follows
> fuse_block_alloc().

Nicely spotted. This is removed in the 2nd patch ("fuse: use
release/acquire for fch->initialized") but I can move deleting that
line into this patch.

Thanks,
Joanne
