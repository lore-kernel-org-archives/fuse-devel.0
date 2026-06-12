Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBE830C606
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 18:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781288941; cv=pass; b=PiTRqGOBDK0lO2hPchpfgfooy+TGJkpfarqFTvctOp9D4GkBhRdOFV0YH5/CRgiKaNuVcf4YypkCmMC6yebtLdyLnC15hw56YxjxFiQaqnKa3RKnv0i+aLUAq9Xxi+jmvHgf4CqQC9f4Jq44gcj9cZxO9Npff08AGym122jz14w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781288941; c=relaxed/simple;
	bh=nQuVB89AR5KWy1UwPUlB6yHdZrcTkhDJcxCxFvRQKPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2eIrusOb+4W3j7m4J5Re5BUBZaurgGynuLo5e21akPpsxqqPLaFVB8pE0GUaPYHX5yKr+b1qhPq0E/MR7Q086oNTbbW+QCFXpUNM0mm27GC9+QsXxT2KySQl9dnQBSDizo0Mz+SwerBn5hj/ouIgAdvowMrtxItaQrQPk9iq90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s1SFnCkn; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s1SFnCkn"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490a76757e5so10076775e9.2
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 11:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781288938; cv=none;
        d=google.com; s=arc-20240605;
        b=LBG8MKTmFF+XPPj1ivbQbZLwxliJC+GPivVKAx0TTpWHeXpBjhY8yAF6fkT3Gg3uIY
         S2TmuopHd1aIEuvDauiwq/R1t5nIAxE0xPHoLfFGBYY8GKdnWHuPaXKLScXAVTPJE2ui
         spDn0FgwCrg3YaYkfaPT1v+EveGsRe4IqFCCZdiOlF/qJSiotoWkHqA6PmQYrCV0W5+V
         g+Hb9EXlGp835StWabeXt/T3E503ECpERJ5uAi3OBsN2gYYp0fhrrp6Z8nyQEBgr7ihW
         /X/8ys0dIOOOoMfBFRmnz4ykrP8DXZnio9BLDYJv/JxRw3Dvi+1VaTcGZkrSq+4PJlLD
         lRUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nQuVB89AR5KWy1UwPUlB6yHdZrcTkhDJcxCxFvRQKPg=;
        fh=LEVhVnDkAXeJL9/svop0fpVUk+9PZ6Q992T9wfZEHhQ=;
        b=KuZUMstLFmHV/XhYcLHCmc+zH7v/3CKOT/wkrkRyKirF44EUISEUB8LkpQvWMaCFmI
         PFltDXjD7TPKrD560uUSPb9BrNMFw/VQYCe6+6khxk8XlQDFhn90PvoDsNMDjvgK4gk4
         cdNYUwZLuyS4C9GTCek1GgXhSyZDTkPpiCYVPEP3OrzL6kVOmnzt2nqm+suMlOy6QBE0
         TfYqht46uYenf1QgdtUL6i3Dk4SL0T6TnMwWE2ddYs3SUTbE1mREnVni8+Onw19C75Gy
         n3VSG4c1kcSvIgf8u2xTBiqCcf0ISSFlfV7dBBL0VHx6ZN4tBRVotyx0W7yxVVG+F/TL
         bswQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781288938; x=1781893738; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQuVB89AR5KWy1UwPUlB6yHdZrcTkhDJcxCxFvRQKPg=;
        b=s1SFnCkntXHVqp3PJ8ey1JC1fezjCMVTS10rrdadMGJxZ9Shyj+uc8WsHoEqed+0D/
         5ExGKBv67ce/xbaY1SAR+sQBH3Cq7bXL4Yx7O6DO7Ju2ld20YSRPHM0PWWzOGeGSNxv/
         J+tN4uRt2Qsb047LVPy0kncCF87iI8yTG6lpIXQUvGBPDlH3zIHk9WYc4s5C3skZ7z+o
         8147HIEJumPuotCnBftQ2MOWayFOFK2e1qO4kXUPywCbujqA34IXELFTdlzZsu2ZGk20
         FKiS5TMQlko+vxCfTpC7iZ9x0yMny86Zyw0kYdg/gx8h5t25CDKqAOmi19O8EnDXK+A3
         /H2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781288938; x=1781893738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQuVB89AR5KWy1UwPUlB6yHdZrcTkhDJcxCxFvRQKPg=;
        b=asm5ke1Uf0pGQqtZCtOsTUw1gQ5tZYYhqINoh/dZnLDdbCgS1DsJ7apZocLFzhf8aU
         FnYcrdBWEW7H0dg9uMVNhAMrjYicf58Le0X6NHpeji7b9Ycq3SL/tjfXVmvv33Weri7I
         uPJbPt2/rIBawLYDPFc8DuPaoQAqPwJvlcFwwXhqQFrinKxyCq7U5OVWmsztG7/KFZP0
         F8W58Q97fgQUg1pDUvg28eoxT1ymODS2owbPLaVLZLPeLyhWDag6AJaItxU7C1rc02gk
         EZhogxIaxORxkkoehbx99L8Euf+D0uy6DT9GFc80D1NHCHBM1Ab/jvk7M5lZraO1A6U4
         hZ+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8oW9dBd/9DikzBCDD3FhEfvCXlDVdljYe/MQ7Fae8VPgnVltXr7a0mq9seKcjP5zSsDCAakLTQOHI4@lists.linux.dev
X-Gm-Message-State: AOJu0YwokbYpO7z1CLFq+xsi3PjQp/sRwmMrCV1Rmt+jFJTRVUS2mlmI
	uuz1trvV7xlqeT6yXucAx38mhdqpPizjq6mnI1RPApz9z9BglKSC6CdPQJer0umsBnJQYmlwg5f
	AeS2mXp0itE9BY1XNvJezahUnW21GMHg=
X-Gm-Gg: Acq92OHjLtwEg+Xo7HYetIs8yUxoZgQVza8xPUcRaTH8RnFIHcNQi8Dz5XrK2RHMHH1
	Pq185Lx3JNqJblkE75284Xak2sZfRn9wpf7oIU/EbEgJonAVFgbJu/HpGk4Wi3NjwanhIyPw2lf
	9jY++Xj3V7OKohPM1EafoDFJ0x15wwM0p4z9anXUdkew3QxxNHaLnZr9qbCyaxCgfojQ8bhbBbh
	WZWsEeEZojCtsZl3yweDuAaOzqtH8KxAhocrmEN1WcXXT/kt6jF+8VWnn3N07YucDXEsXS4yMDC
	PXNYw94WKrnnfNE6g9Lj5AfPZLOjBJ7IFJnfEazzUlEXtnJwLLUEKMvW1UX14u8=
X-Received: by 2002:a05:600c:2d88:b0:48e:7854:1608 with SMTP id
 5b1f17b1804b1-492200e24cfmr4549235e9.25.1781288938110; Fri, 12 Jun 2026
 11:28:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <20260522205823.1597313-8-joannelkoong@gmail.com> <80f49e88-c342-44e7-abef-f65e84beb9b0@bsbernd.com>
 <7e7a6a26-dbb0-4fe1-878b-01e81b939cb6@bsbernd.com>
In-Reply-To: <7e7a6a26-dbb0-4fe1-878b-01e81b939cb6@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 12 Jun 2026 11:28:45 -0700
X-Gm-Features: AVVi8Cc5iQpg3XY_reb7KJy_uGXn3u4WbRPY8-8eY0K31Ymy-TYhPeX9RPyJZ0E
Message-ID: <CAJnrk1YX_Tn3uqzRi0iBP03enzj6pv3OT8HoZf=R4xzNMBhmeA@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 5:08=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
> On 6/12/26 14:02, Bernd Schubert wrote:
> > Hi Joanne,
> >
> > I one generic question, could you also add in for which kernel branch t=
he series is? I think I need to do the same for larger patches series as we=
ll (recent reduced-queue was based on 'miklos/for-next'). Basically 'b4 sha=
zam' fails to apply on linux master and also fails to on 'miklos/for-next' =
and I don't even know what the base for the series here is
> >
> > On 5/22/26 22:58, Joanne Koong wrote:
> >> Right now, ents and buffers are tightly coupled in fuse io-uring where
> >> each entry has its own dedicated payload buffer, requiring N buffers f=
or
> >> N entries where each buffer must be large enough to accomodate the
> >> maximum payload size. This is suboptimal as most request types (lookup=
,
> >> open, release, getattr, etc) require vastly less bytes than the maximu=
m
> >> payload size and some requests (unlink, rmdir, fsync, flush, etc) do n=
ot
> >> require payload buffers at all.
> >>
> >> Instead of requiring a 1:1 coupling between ents and payload buffers,
> >> allow the server to pass in a buffer pool (a contiguous allocation of
> >> buffers) that the kernel will use as it wishes for servicing
> >> ents/requests. Buffers are now pooled and selected on demand. Entries
> >> only "reserve" a buffer while actively processing a request that
> >> requires a payload buffer. This decoupling reduces the memory usage
> >> requirements needed to use fuse-io-uring. It allows for future
> >> optimizations such as incremental buffer consumption which will allow
> >> non-overlapping regions of a single buffer to be used simultaneously
> >> across multiple ents/requests, and the possibility of multiple buffer
> >> sizes to be supported per ring in the future.
> >>
> >> To use this, the server must set the FUSE_URING_BUFPOOL flag during
>
> Sorry, had missed that in the earlier mail. How about renaming this to
> FUSE_URING_BUFPOOL_PAYLOAD (or so), so that it would clearly
> differentiated from a possible header buf pool in the future?

I don't see a use case where buf pools for headers will be needed
because every ent needs a header and the header is always the same
fixed-size (288 bytes).

Thanks,
Joanne
>
>
> Thanks,
> Bernd
