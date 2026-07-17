Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41193AA50A
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 16:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306512; cv=pass; b=oscURwz8RQN/EoMrv9tNGwQYk+duJmeDryX68e70858L8CkSN1kEddTEkvXGPxG7VU3tHQ5WP+opEjm0VFVIApdQCBsYVyfdGJBLrfIGR49stxN6uZTQm6m14C4yrPgV5/xkD7vJ/GuJG5s0SKI0o0d0wPiMEGZO4RTdaKeH6Ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306512; c=relaxed/simple;
	bh=RO6jLbPqYd9myHOWMIDJYRMqFrA5/e4yQCeAPqHJEpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/5g15/vHcIMxv+INyrxce82hfb+ykgrg3VF4jljfekuGijcX9JJ2c2cKxS3Nylg/sL1hIMkcXT1D5eCiV+Mj/5Y6B//9A+UZrqFWDox55y7g3dx4jyK2GLWVFOo4TjbQNFTRlg6JyRr6MsajpNytbyl0p8vdRk2zxtQSTIpoYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=F16u0ctx; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="F16u0ctx"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c15bf5000so53264981cf.3
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 09:41:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784306510; cv=none;
        d=google.com; s=arc-20260327;
        b=iayshbV4P1BTOTnEBT/akbaJCpnr/TAWdpXw0mpeT8tBGM79Pbxld4c1iszxGeedN+
         q5kEUq+x2sD/1EutpOvNqSXLkzUUxFjG9KcL4xEmpmSl9xeOO33oRObyjrqSKaEuhrFn
         C2C47J90FFn6uwpmqCx76PyXfaoJ9rFFoww6gfIb+7oYppC1IuzYcdtHo7TIpwrvPYz2
         Xmh/v5JeGBQyBLLVTQ5ygXf1Y2vqXYqRbzP0Wh+qQpsGJP3fN8HYN1R/ahXOomAHTQDh
         BCYdJuGA8hqob0r2cL/WipOsvGwUw0PcdOy257Tb3axQ5gCAyT+cuZIkcTo6CLvetiMB
         ywhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bbn1gOZ8j/qpxFTJkQYiq9MRH2fak3LLSLgE5QakhlY=;
        fh=IiyjzQ+z4FTdAgVAWLm4iCyBp5AzkAJCLl0FTB5VHwo=;
        b=d4jHx/SEv/Yp7EvEhW7tD8UUrVJHqcYZDr9ktABTDApnPqKpDB9un2Inav3jfGDBkD
         eO00m5wWE+99n73fN1GBUMJ4/lKhz9jMNSbHxa1lMdRuPFKv+BjE4f2Pc6i3I3vgKnZI
         TccC4l2C1hIHp7AvT0fTOZarfcwWxIWWLVz8RFqGbI9vqZIW8PFYCogOXRwaHtlSv349
         lRLprYxLpyxnywW6+aWn1pQNSsG81HXhiUj8D5KEN8qwVu1kB+nJHkZK+353ESCUB6Vx
         co6XNaCC80dNm123hmgKVPDuP1OTA2vxk9QwwOHaLouw/kRrNn1jlsbcURhmLiqnwlR6
         h3kw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784306510; x=1784911310; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bbn1gOZ8j/qpxFTJkQYiq9MRH2fak3LLSLgE5QakhlY=;
        b=F16u0ctxC9oi0jC56s+nHRlH2lMtGgD9YobrNFCgg+aJ+En+pRDL3fAdM6o/90BgrB
         mrzS0EPnk+4MYD86j+eRSfSY1pXYx3UVvwYSdSNNnuLRwXvn34Wi/P8T7cQrWDxhQh8Q
         LJmcHGvJ8ULDy42Qi/spOqdojAphOU8zKm0i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306510; x=1784911310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bbn1gOZ8j/qpxFTJkQYiq9MRH2fak3LLSLgE5QakhlY=;
        b=ONo1hD9Qkr+Y3TaFGNluCzGUMOX5NkXWOxdkljowx4IIfnkRgH0V66EaGRhUsl5Iym
         g/Yz7wOWcSQMstjx5GywG0rX/fBLyiw6/fSvefv+5zeq519SS1EGqTDqeyh4JTr5zkxY
         6KCU0hTRVJ+WpCbIGZ2a535c9EQiYFG16IyQcunouAj/C82Xn4nMB13jUF1yqj3W6RuZ
         7cugqUCQ/dMCALjSV4BywAQk6c8yTQZ8eWNlWkuec8/ATVdrEyA9gA/G+Dfh4k5lXvL/
         F+kNBWL+DIvLdyWCPIwQ2ijcoazvj89luPZBE/7oxUI0t8NGxtTCqTwrDb6hMHO4h+cr
         WOcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3m1484+4JdURzWcTIna1+CF56DpNN5gQJl2rGpc4l/T/0BKB1fP2GSmomQ+wU28cW/hYhaiYLB5Uq@lists.linux.dev
X-Gm-Message-State: AOJu0YxK6rIwygy3A8JiNpd9J1YGLTdkGBWUUT6APlfT3hoLrkE/GhpV
	V1WYzgjx9E0kZ2SjCQ4jioFKzQ5tMNLABokoM4DlOhWmm9XuRUpt97DLoYk587a7N+Soj3f818d
	/fMWCi9Z+SO/zliLnjXIJyqrMKxNPVBgPVdfII7YLCQ==
X-Gm-Gg: AfdE7cnfebbVVMXofux45dvYH/isB8GjWBYDcErLZmAuGVYJXb0CShEvtGBcMTSEFTK
	xBTqhPx7+vtJ1Jv0E9p4QADCLQ+zFm/tC3Vp3gtQUoHrJhPcLBMd9Am06IcppL6mwH38nFToLp6
	ipAnjwmP1L0GcJIYKxNrUGq1x+cCaAn2BwUQyskIEeN4LL6ev5/dE8u0OujKrvmKlBIKGULwInt
	eZX+WgEjiHOQEESWscBCr36gUpDZtunszaav4X7e93urul8jKk43ThFiE0g457pmDzMUGnqfEzc
	s36ioclatDK9rxI=
X-Received: by 2002:ac8:7dd2:0:b0:51b:ec34:292 with SMTP id
 d75a77b69052e-5213daa1d26mr33659761cf.53.1784306509647; Fri, 17 Jul 2026
 09:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-2-joannelkoong@gmail.com> <CAJfpegsNb=1P7Vh+DVfg3Ve9T8ggHxi1Y-ZhqiQ6R1bbnCTHGA@mail.gmail.com>
 <CAJnrk1Y8mwyeqqL=CaW-=Qn+kRghZNbJqSMqCSW_8DDCVyKKgg@mail.gmail.com>
In-Reply-To: <CAJnrk1Y8mwyeqqL=CaW-=Qn+kRghZNbJqSMqCSW_8DDCVyKKgg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 17 Jul 2026 18:41:38 +0200
X-Gm-Features: AUfX_mw3sMVuPxXQ6S4wpWwaQy8ZA_5zzjqqbLr6ycAOQF4_-ZBLEYPuP78fJgE
Message-ID: <CAJfpegucmqTZan0rLL8YoKy6h8UCzKuZQAsvasFpHgy64Nh4JA@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] fuse: decouple fuse_ring creation from ent registration
To: Joanne Koong <joannelkoong@gmail.com>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk, 
	bernd@bsbernd.com, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Jul 2026 at 18:28, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> On Fri, Jul 17, 2026 at 2:32=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu=
> wrote:
> >
> > On Thu, 16 Jul 2026 at 19:59, Joanne Koong <joannelkoong@gmail.com> wro=
te:
> > >
> > > Currently, the connection's fuse_ring is created lazily on the first
> > > FUSE_IO_URING_CMD_REGISTER command. A server registers entries from o=
ne
> > > thread per queue (one per CPU) and those threads issue their first
> > > REGISTER command concurrently. They then race to create the single
> > > per-connection fuse_ring, which required open-coded handling in
> > > fuse_uring_create() to detect and protect against concurrent creation=
s.
> > >
> > > Decouple fuse_ring creation from ent registration and move it to
> > > FUSE_INIT reply processing after a server has negotiated and set
> > > FUSE_OVER_IO_URING. The ring is published before the connection is
> > > marked initialized. fuse_uring_register() no longer creates the ring =
and
> > > it instead uses the ring set up at init time.
> >
> > What about if the fuse ring is not yet set up?  Should
> > fuse_uring_register() wait in that case?
>
> The fuse ring is set up when the kernel processes the FUSE_INIT reply.
> If userspace races ahead and issues a REGISTER before the FUSE_INIT
> reply is processed, they get back -EAGAIN and will need to retry,
> which is the same as the pre-existing behavior. The ring gets
> published before fch->initialized gets set.
>
> Not sure if this answers your question or if I'm misreading what you're a=
sking.

That was my question, yes.

Retrying in a loop doesn't sound like good behavior.

I was thinking that with sync INIT the completing the write() with the
INIT reply does not mean that the connection gets initialized.

Shouldn't the REGISTER op block until initialization is complete?

Thanks,
Miklos
