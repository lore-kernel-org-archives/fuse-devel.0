Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BE7245012
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 16:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784305699; cv=pass; b=sFVR+G9bTBzaDtwsX632VqXZA5Y8xK3ZAL0+HtfF+SQgRvhokiO/EFiVcHbapdugsrIminh/H0hyHhTsdzknATih20saGYHRBoap/A4+lAnQf1u+Co4hhmeAGZHN47sHEdJtzT2LF7Kg7Ml2pqAYec5LjXFk3fDRbKtbm0fd4Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784305699; c=relaxed/simple;
	bh=oExBvYTeH9NQYQrfTu/3eRtgqU6avsTurh+u1Oljn6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+RregZGYPKbQCdNUf+hgj6YGYei2dt5fZwy8WLlZ8dnLeYwNU77b/Q1iBNfTzelCW+6To+LfwD/AH4EJHBnrwjAhrAMBeLOPIlF/siUDKj1hGm1Jk6mYovG+j8mELqd0Z2yd7nzQeLoGD2p2SrLOzj24YZXPjZlMz6h/scvHbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGhG+VTP; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGhG+VTP"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47df6a5202bso5517777f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 09:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784305696; cv=none;
        d=google.com; s=arc-20260327;
        b=frLTTM7gfQ3RwNvp64Jdi5s466i4wf70wzbL4hh02uk9/oqogMLWhXZIHAItCVR1uv
         3u2vPPNPFjOKuSPqQlpenaLAuMOteVLDieeAfDjrDbKRJzbKv6evHo4lDqMLlm3JDlK1
         OeK5aaHm42HQ0RKARNTiM4NHI7wH8QxtpiSu8byu1fItH6qQpco7bzk+TiRFqfmBOJRT
         2gKuyoMTixsBrUsICr3PajzRlE5w6NBtzSg19My3QeiDMWaTkahUPCqmzjYztZknRmHi
         g6kIErQ/2AsR4q7rh+DFUb3zfZQSec/YyimgXWKXKqjItw3ThskBKN7mNtr5wLUvy9iM
         5SBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EAsWeMAM8lEeJpcqDROQciHuCu/7w7e+8GgeBkhTGjw=;
        fh=zVwK+xDZEph4czoLSagddWwC4e8EiKRiFdUArHX5ejU=;
        b=o6NJorNJm8yznxzuLcKCA+vXXOf0bTM6KqeKfSy+x7hq6khG4ftZS0HTkHN4v4Hx7I
         LtM5KyqTLMo2/LIbVIrvsKm/YFRdK/DVNS8IippCNA3KbCMVj/NSfFM+eaUyMJipHb4q
         QgLiFtktrlGn8dxPM2ZwN7ssKdv0WaEiWey5/OqBdPNs3LUdq48SoDnRq1bMNT5cCZPY
         LQNCE66zc3/D9P5MTAoveghf8VPPjyB/U+lth75oVSbXxHmm5FNQ+9agV+gcTF3gfdrT
         k37DaBSZpUbQEY7Rujc8A7a+L0pJLCr3UlGHu7Fme2BhcT1y/72PF/MyeHH9mmYFFb6p
         0YYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784305696; x=1784910496; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EAsWeMAM8lEeJpcqDROQciHuCu/7w7e+8GgeBkhTGjw=;
        b=YGhG+VTPKGDG/wCajp/mGvhTZF1cYoEEvk2T8dNRtTBfUAXNFpAQskHutLLIy/EyyN
         lzqCjGQx3qZSfLCeBDbsjOJaoUNG2WLzbsDABp8EJfRzJtXVKqOdCK91+AWkw2bmlV7b
         YRasLK6pXsHVP/e5bvrEB8JMIeWqfkEuPPmANuclh6HeceUToP5t4J1jDTOtZVFLjwI2
         M3Qo3LusPDmSyo5zx3qRKQRE6pD7iUvIbpJHH38Ae9+v96yp5QXSanBayZkZ24NE+Pk6
         Nsw5uTCMKAL3bPCvrhEZFsgKdUaMHqn6EBX6bD6mjyliA9iy8IlP4fuUHPpq76QNftJJ
         PsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784305696; x=1784910496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAsWeMAM8lEeJpcqDROQciHuCu/7w7e+8GgeBkhTGjw=;
        b=SKiEJpdauQzpaXOW/oms2C4rV+9qYLPFqlNDtYa3dEj4JxMamDwq2K+KjZTlQunvOw
         4uxWhzIDu6e9K4bbr25RSoszsKDeDs4assyZxjypU/ZjuI5LTP2lyLnbYM+xvr69mp1B
         mNTFqnWvI3wyML9nXVSWvWJpxfXMjRSARw1C3T9sKOi5F9QQo0JQEUvbV7gI8+Q77/XQ
         AzGUJkXlA5KnDNNGc2fVxBkFiY6fxnRFeIs+XFV2QgkGfHMK12ZFWsti9nljYGtn2CId
         lAA2EhlSAzgKsaaxzcuXD8NwhkYKRLPB8a0WZBn/flZxdoul5r8+0S1qkIeg6c7432fb
         RDjw==
X-Forwarded-Encrypted: i=1; AHgh+RoMiR2wVrlALhVhu7Ga/UkCTPOu4jEPIydJhM04GqA+UsRsG8w4tlEDZhVI9bVYRORDUOL/N9Mtjr2I@lists.linux.dev
X-Gm-Message-State: AOJu0YxalVtn0TDJ8Fnxy7qofNueutbnPmAvAvpgmsWcKcOXXJ/3+3FT
	C5JDWkeIunBQjpIunkDDm/OOmFhHs+klHwaN8FD/BTW8jE/q/STQ+d3xIiN3dBD8n5W9rbUeEsF
	6Dzby/RpilGKnYpQGz3OZbYIb25eC1yY=
X-Gm-Gg: AfdE7cnwKL6BDf2sqoTk2taptXYe2lnbssnT1SCfuRnIn6MoznNCOyUU5LiLwf3KFGu
	2qM1OQKZ4Yt2Ocohyh27Klmd2hhrSH1KXj9hyRg0l7w9BueqtCARwlnRZORhXM9cEDytqoo1fr/
	oEJob6R3hrJAhVN5vUvECrUt0WUeuNEsRWnJRY5xmLMy1Lek4gTrKr0fk0JtmJHK2iICaENI8Y4
	u/0jMTFnn8OWLm15dYfYEfR8DHyb6cufkP1QmM4RzJdJFBfA2/zwmFFpYY+npXXbcCPp0Ug4EPs
	mNTwf3MGCSvGylFGIC6eThLIp0gB3ubQS6hxfbiJyQ==
X-Received: by 2002:a05:600c:6b0a:b0:493:bed6:85e6 with SMTP id
 5b1f17b1804b1-4954a3dcc38mr30237615e9.15.1784305696368; Fri, 17 Jul 2026
 09:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-2-joannelkoong@gmail.com> <CAJfpegsNb=1P7Vh+DVfg3Ve9T8ggHxi1Y-ZhqiQ6R1bbnCTHGA@mail.gmail.com>
In-Reply-To: <CAJfpegsNb=1P7Vh+DVfg3Ve9T8ggHxi1Y-ZhqiQ6R1bbnCTHGA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 17 Jul 2026 09:28:03 -0700
X-Gm-Features: AUfX_my0rJXTZbOS4lLlDeZQSWA4jiylqHfzqJVjFapQSGZLQSvWBexlxNqrmT8
Message-ID: <CAJnrk1Y8mwyeqqL=CaW-=Qn+kRghZNbJqSMqCSW_8DDCVyKKgg@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] fuse: decouple fuse_ring creation from ent registration
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk, 
	bernd@bsbernd.com, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 2:32=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Thu, 16 Jul 2026 at 19:59, Joanne Koong <joannelkoong@gmail.com> wrote=
:
> >
> > Currently, the connection's fuse_ring is created lazily on the first
> > FUSE_IO_URING_CMD_REGISTER command. A server registers entries from one
> > thread per queue (one per CPU) and those threads issue their first
> > REGISTER command concurrently. They then race to create the single
> > per-connection fuse_ring, which required open-coded handling in
> > fuse_uring_create() to detect and protect against concurrent creations.
> >
> > Decouple fuse_ring creation from ent registration and move it to
> > FUSE_INIT reply processing after a server has negotiated and set
> > FUSE_OVER_IO_URING. The ring is published before the connection is
> > marked initialized. fuse_uring_register() no longer creates the ring an=
d
> > it instead uses the ring set up at init time.
>
> What about if the fuse ring is not yet set up?  Should
> fuse_uring_register() wait in that case?

The fuse ring is set up when the kernel processes the FUSE_INIT reply.
If userspace races ahead and issues a REGISTER before the FUSE_INIT
reply is processed, they get back -EAGAIN and will need to retry,
which is the same as the pre-existing behavior. The ring gets
published before fch->initialized gets set.

Not sure if this answers your question or if I'm misreading what you're ask=
ing.

Thanks,
Joanne

>
> Thanks,
> Miklos
