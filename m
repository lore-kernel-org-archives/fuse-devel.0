Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EB5379EF0
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 17:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784310813; cv=pass; b=EP3ZCYGzF/FQ1HER8xOpaIB3oyiZLbfme8LN8n0PvcFKHg5IPNKy8uskzha/Lt1W27OHVjau7B6ZDKAFh5NKzJpDtQFyEHxQf6PKvc/yvY7i/zmgezZA44qXdjH63XFfE3xko1pI2CwG3MysBOrR14xRgGZN2Y2p8ECFgklWy4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784310813; c=relaxed/simple;
	bh=EIGvLsLsmERKxXR4hkBmzmvSqZzqxs1fhS60qFXzNC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5csg98nV3VJGhPmZFBL1a3pIOHztgPQ/gGBPygiK9EzbhPihwnfrPSlFTWmJxDWqCInrkb0umsTsmvx/m5anRbYMO32KxVY7g2YAbN4DUQbvBC6rji3tRDGmnzH7mqDeK70gY8cYw3tHM4lOGhb+lVDvh3C8dck5hVyqd8t4YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qeL0snUz; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qeL0snUz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so24373355e9.1
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 10:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784310810; cv=none;
        d=google.com; s=arc-20260327;
        b=Dgxpe7BN/YqAxRIWKCXqxti6mtzPLvHBvaxZxKiQX8o3xVy8M7b5YIFTI7QXA62ye8
         sTBJ0Cy2LhLnfQstBZnki140j8dG9ZO0Gz2Sx53ReNODdvrVGgyO1yrYLx6H/VQPx9VP
         k1nl1uM7+PZECCc+8mTaNBPfopqGh4wyYqMLiirVYR6+qp180vQjTbbGRLBhS9UPVidA
         z8G4dJaTVBQ0RYuKU5Zlbjq/5Odb7lTPyWqzsaPZR/ShjLA5SZyVdWF57gdnlQw6wP1s
         9rjcPHsJyPcpOXXHak4Hmf/oWLkSybJzQpNMjQTP1UzICTANKmS4FyLHiMc81gEtVjS+
         dHow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7nUqdk/JcbRuPlwXOidChPklwcI6DCIhGtunfLJjLgQ=;
        fh=G3tSoz0kRNIjHKXIOjzMTcpQMdwT9lKNw6yjEbBNGeo=;
        b=K50YcKzIRR2sKnXj3e6/6JfkO7TkwmZFp2Xj82c//6lCnYtvE5fLAcpnjGvRI6sS9P
         iWsxlOYhYwLKGE5wwN1BOKlqoL+W/Io3HJFJ5/B0dP3ikPtOGVhAVo1cVopIjBRXnW8w
         f5nM6q55/rk5cft2VTGAFZ/WIQVWl1lE6TJwN6zrD1D0kpRRpKAQbwqu3GUXqHhadcSi
         /BuSo91RZYRFoof7oI8tHsv8i/FzeExWoIzkTCNO85wV00Ey9zA56ZDlfyHdPcrIuXKB
         4/8CDEMWq8yNevJJnsTaIzAGnA/YoVr+ShuLhC0MxDxbczpqUmSB8qreqEJGNd+OCB19
         SM5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784310810; x=1784915610; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7nUqdk/JcbRuPlwXOidChPklwcI6DCIhGtunfLJjLgQ=;
        b=qeL0snUzxrPPSe/K66KwoE2TIp8KkKJQFi6Q9VXAEGUGcpySWHyq75MeHWFXmkm1QA
         aysEcAcjkqjQmG0c4esg1jYJWR8n36x1IJwNrPxtYHYCagbHGybSuHEefW6baj3spYhl
         RjMFOIZ2fN8gq3Asvatjyz/YrzMfi9JDDDV0GDbGz8rt5sIGAKXh5lafSfaLpWdWxmn9
         48eFzxYOq/DCIz6pH7qM60VS+ltZCfmBOmCumzySjqK+idvzEYKv+wkMGBkf6v04RPO7
         3JUYWEp+eGTC7i7yXRAs5PpAx703TAq56v2R+8RGvrwIi950I74Y1U/xi3M3rKeNwxhb
         l0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784310810; x=1784915610;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nUqdk/JcbRuPlwXOidChPklwcI6DCIhGtunfLJjLgQ=;
        b=LHyy2/0uuWCT06Mx5x+yW2uz8A57e7iOcN+oQ8oJnSPMcXNr1+4dLhf9mXX9G4Gpvj
         ISxaU1mqQ0kE7PGWZTalLKBel1xrEYVN7W4VcQA8mybvXN3+DagTgG4wmU+SU2lYPAgs
         VV2LHOqRnbSUWa/GVsxa1m9jW5gOuJ8cE093DeHJl5+Br8bztXnT0O8GLS9QgBfphRTF
         7YU/0IJOVJ3+43qz1xGeVop8cztjsVbbeal3CGNulWqD0Svhltp9onwRPqVs8M/cVHaV
         1ePstQ4hCYiIj8ikrCT+VeBW6spgxrG20iYatIWvjr3Wa6ykfoIvUfNFqgkDpGJPA4Rm
         hJBg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+qp64ESTopk541w1hZ3N1lndabD4Wzt+ggbJQRhkoSITS1g8hBz2/DsLlTX71hyZlItTjifvh3IvK@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrd7DmO2bE5hWOIgrqFMQ6VhMLLq77yaR5q1Kpxw3sffCSiXzV
	LOKSNPpknHnmEkrs1bxmutxzic1hTzde9blgWNdprV0rNRdQHj2U8oIK8AsZ68fBbIxdb7Ys0A1
	11tknRfMk/7CFu5njVKe9QOzCKJTQ9SI=
X-Gm-Gg: AfdE7clJfszs1n45s4DwxBJQrjF/iPdXzSjowgzNLc8ObuGbCSqkAsQDXaty3nGVy6t
	31VqxABXF3cVEwm8fJ+Mu1QTMFi/E9DmbNBONG3u/y7yBQ4/yLIONQfh8Op9hKFV6gslr6kLmzO
	tNntRKRJy5nFOh8YXrkAMkEzPAdebuM8HgYW3LKTFhC8/leJUkXM15HEBMzqQqY6kAu1LLPy7H1
	mi9qKB/5HV3dBsTYG6DKsZ53tm6KDXNlsTGi/hf3OqOmU3FPawILp9VDplDhuR+7r6v1AYoeoHV
	gKxn86MbXe4FdHPmkLHLbc3upWt9efe1KCBVwJ1YnA==
X-Received: by 2002:a05:600c:19c8:b0:495:43ab:4f78 with SMTP id
 5b1f17b1804b1-4954a3d0ad9mr42864395e9.7.1784310810362; Fri, 17 Jul 2026
 10:53:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-2-joannelkoong@gmail.com> <CAJfpegsNb=1P7Vh+DVfg3Ve9T8ggHxi1Y-ZhqiQ6R1bbnCTHGA@mail.gmail.com>
 <CAJnrk1Y8mwyeqqL=CaW-=Qn+kRghZNbJqSMqCSW_8DDCVyKKgg@mail.gmail.com> <CAJfpegucmqTZan0rLL8YoKy6h8UCzKuZQAsvasFpHgy64Nh4JA@mail.gmail.com>
In-Reply-To: <CAJfpegucmqTZan0rLL8YoKy6h8UCzKuZQAsvasFpHgy64Nh4JA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 17 Jul 2026 10:53:17 -0700
X-Gm-Features: AUfX_mzGHGjArKF7zDbhSdgP679DpV7_w71FaqosSi7FOFmrfxp0-aZRiLtt85M
Message-ID: <CAJnrk1YMO2FgReO0Uc8Axx+D2C3WWGgU2YF6R0XSk72AvULXEw@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] fuse: decouple fuse_ring creation from ent registration
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk, 
	bernd@bsbernd.com, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 9:41=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Fri, 17 Jul 2026 at 18:28, Joanne Koong <joannelkoong@gmail.com> wrote=
:
> >
> > On Fri, Jul 17, 2026 at 2:32=E2=80=AFAM Miklos Szeredi <miklos@szeredi.=
hu> wrote:
> > >
> > > On Thu, 16 Jul 2026 at 19:59, Joanne Koong <joannelkoong@gmail.com> w=
rote:
> > > >
> > > > Currently, the connection's fuse_ring is created lazily on the firs=
t
> > > > FUSE_IO_URING_CMD_REGISTER command. A server registers entries from=
 one
> > > > thread per queue (one per CPU) and those threads issue their first
> > > > REGISTER command concurrently. They then race to create the single
> > > > per-connection fuse_ring, which required open-coded handling in
> > > > fuse_uring_create() to detect and protect against concurrent creati=
ons.
> > > >
> > > > Decouple fuse_ring creation from ent registration and move it to
> > > > FUSE_INIT reply processing after a server has negotiated and set
> > > > FUSE_OVER_IO_URING. The ring is published before the connection is
> > > > marked initialized. fuse_uring_register() no longer creates the rin=
g and
> > > > it instead uses the ring set up at init time.
> > >
> > > What about if the fuse ring is not yet set up?  Should
> > > fuse_uring_register() wait in that case?
> >
> > The fuse ring is set up when the kernel processes the FUSE_INIT reply.
> > If userspace races ahead and issues a REGISTER before the FUSE_INIT
> > reply is processed, they get back -EAGAIN and will need to retry,
> > which is the same as the pre-existing behavior. The ring gets
> > published before fch->initialized gets set.
> >
> > Not sure if this answers your question or if I'm misreading what you're=
 asking.
>
> That was my question, yes.
>
> Retrying in a loop doesn't sound like good behavior.
>
> I was thinking that with sync INIT the completing the write() with the
> INIT reply does not mean that the connection gets initialized.
>
> Shouldn't the REGISTER op block until initialization is complete?

Yes, this would be more ideal for the sync case. libfuse currently
works around this with the retry loop.

This is a pre-existing issue that's not introduced by this series
though, so I'll send a patch out for this separately.

Thanks,
Joanne
