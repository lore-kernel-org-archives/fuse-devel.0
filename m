Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E69390990
	for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 20:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210377; cv=pass; b=HKyAp/M3uIk55e0mLtS6QjO/dtFxM0PFJe3hZpQNcJj1k3vqGjYKS1CLjoXBcrV1Qp9MuiJ4m5iJ3aDkiJ194oSHJduKd1ooxjPZPcCTgNl1Kdz3HX99RpES6xWLdO4omflWLSka50J9vGEHbCd1Q/Gkn0lzgICENUQ67F3GKJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210377; c=relaxed/simple;
	bh=R8HuhVAMo8f3qAcLXo87GLT7WZLlHhUDUQ5FxZjkYTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2v5y05CGRdWKbjPG+XqDQ546gxGodxuELgiNqAyfw+VKCIqK+ZG22dLQPJSh0v5j+UleGqtvNsqU5nyItzRY5WDYsn0yNpovd9oWGH3oc0OeWQruNg3/Sj9BpxjPwRABQywfNU2QGMGikS746jxAlzylbv5eicZfpMNoahatm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2t1hn2f; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2t1hn2f"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b9318997so1810865e9.2
        for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 13:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781210373; cv=none;
        d=google.com; s=arc-20240605;
        b=L932Kh0M1N+yI8tAX34u1bgV5tlrGw7J+9AwxJovbLIVOD/BPsP3gEzpmHAS095KqY
         qEkOWNYF04tbWK6fo8wJTMiFzWM29Pa+OTRQMpzm+kW6lLIKshTwTXvOm6Yi4B2J/8Wv
         RJpfsOCJMHO2QD4d3SabtPR7iUua2ADhakVgzjZPCRMU7vnYA9svzVvlb6lmtVqB4prH
         R4y2VHHhIRCPjjnvibM01dL1tOGwrQDEHtsJs9Krr3VP+AVcvOwk0p/v5L4nyrKbeBrS
         fFqQPUJZKyDOVNG/id44Co6H8gTIMGel1b6jjQuWN6WL9wX/3CDfm/rwCq2LtEgZIiqf
         lvdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KJ/2GLeENvhoO48tP3GPrupjjs3AK7krk7QIR001BJE=;
        fh=EvPU9eCY6AVyvApFsKReO5i6blJ2Vf8Cl+luc5VVqJk=;
        b=cHji9WTBOIs9xhTAb3PLnYcyuLur51UUMQpKLLrjYikxFHvFKKejjAdyBal0ivi8/C
         8JRV32vYvuCtev7DnxQ4z12OqV31crCkCe5ASY0B+bMRNLCpy49X2LCxZD0AA3SxtiYX
         pg/WtCRYCr2vooa5JGmdgPgstvLLl1XNZKzNOOLleZ5ULd58pgFFg+94BBFQ+4qnZ/Zm
         ARQh8tm0o7Sh/PCPBUrN6svFyCFvm4TewkpCLIMzSSz7mCeHqc9VeV8Mb5zQGvDMgfZA
         Wr7jwXT72J0iTiTwp5pWm0Ja6Gm+ZodR8qRUuoD7CFDwKd/9oLh1vZaPBlQT2JiyXEQN
         l8pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781210373; x=1781815173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJ/2GLeENvhoO48tP3GPrupjjs3AK7krk7QIR001BJE=;
        b=I2t1hn2fcDkH6G+/9qMGB1GVgtJ/9qACzCfhAHoA6/fl48qbdje2zvnt57CFjw5J1p
         8fisPiyPjGV7gkCi9KGCT8EnIz49YPF+YjW3630faAAtS8E2JBpQML0IeLo/3MxyTae/
         kRyfO3XnHj1oFQXSTLUeN+agGhv3w8RpRuTd/3b8xOhk0OPjYRvz7mpzMKIjJZnrSiCA
         i0uKudVghylss3kRkTSd5Lez0aOnyz88J3cRs8WdFx7PGZaxe1O0xYp5t/Zp/gEcWSfR
         CHY3fTQDoT4/9FR63aXeJdVCnH5BypBBYRYNl/mcBenPuB91xpszyEDq4rDro6igsb1/
         CR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781210373; x=1781815173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KJ/2GLeENvhoO48tP3GPrupjjs3AK7krk7QIR001BJE=;
        b=Nc/R8HwwjjMa8nPxeQn7czO9/DeMx3QHHoABaUbE0Po4RNoVXn/1K86BBuiDig19Za
         ym+0xj9bEpd5W6JJggndloDDphFuFyqbQZmnzQCm4DP2UK/PRJOnG8Ix0tOK6yPFc4Ys
         IARjSbwM9TvstM3bWGn/rOc9s1CsN/1CmScxepyGKB9YuIO7LQNzHJV8rF5pXtURExAQ
         Qu9+hZ23yCI2JrqdNoJsQ9gjs6TPjOxT5QVnKc9L2FwUFTDOkgWzHP5kguIpVl9Hrna2
         t3tyKatVknUUEtQ/VH33tIlkcTy2a9+utY6xEoBdmm+IfSwKZmAak1WJAPe/ib5RVobw
         JCMg==
X-Forwarded-Encrypted: i=1; AFNElJ/yqTGjrOxSqHO5dvLhULpf3LjA2xU18Ca9+Gdv4qztsBso8Xi2gO33Otd7YSCcJKJD2O1yYdon2JbI@lists.linux.dev
X-Gm-Message-State: AOJu0YwWplANzBWva0oibYJ9sQaCDv9hrRrChOXHlzGz44U7r4hY6hF7
	OwCHnrM/htYsYbXqfH9yTt2zxB5Aj13iOcCw1o2cMR6uDk8+P6NIVW6o3kdjWIJ6860Zv7luIvH
	8hveMazGOjc7QS06DryC+ynNsLCHrjNY=
X-Gm-Gg: Acq92OEBQPsWsSWzYKSaaUBCZ4Y0JaSrlIoJTVxCvXDKAb7YSGSiUoisFgbp2K7nFYM
	ZiSGvp9oDJNDVruKZ19bLxRCJCWf3r3MER8OyzLItLL0fe370XE6mAI8ulZn0tP1u1SAISxrn9g
	OApy3Z+PEz3iVg/h6hVCU+Wl3hP9eXlj0KiDs+LHd6/J211neq0xClg/SbD5BO/6WBZdYOY2WuQ
	21BJ/7N8nKnTujvixtC9w+UCVMnEjKLB0GHnaDwm7KtZn2HKXDlKEX/9KFeG7b4hJ4qASqPk4go
	5pLaZkSsPA5Gixhjs7bmTQooJCz5fshSzGcRWv8G/VQ0wOzbBjYm8w5Ccy4mEjQ=
X-Received: by 2002:a05:600c:6994:b0:490:b724:5085 with SMTP id
 5b1f17b1804b1-490e5619ae2mr60142125e9.33.1781210373043; Thu, 11 Jun 2026
 13:39:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com>
 <aeb9c03a-0330-4e41-ad33-b884f00691a0@bsbernd.com> <CAJnrk1YPeeCSsQFjaFNROYcOdBO-kTovOTDkCigNKRt57JREJQ@mail.gmail.com>
 <6ecc45f5-4bce-4af2-bfe4-36c69e624b01@bsbernd.com> <CAJnrk1aS=3KwZ3LpiqcK=gKsj7oru-k-1Xpe2j5puDdmn+hjUA@mail.gmail.com>
 <CAJnrk1aacCbOWWWvW2xnQZ0a954-4shXdyO9LBn_Fv_dyUAWnw@mail.gmail.com>
 <CAJfpegtorFv9u2NCPA8v5OHiBUNT-XzUiw_y=7c3U3WEaXRUZA@mail.gmail.com>
 <CAJnrk1arYPY1u8_aiMfYUbmb9Oy4epRWJp_W7-hjAxQ_ggJn9w@mail.gmail.com>
 <CAJfpegs7ttuzD14cnEeRBeDnw2E-5Dz=+xCEWVDRCKqMhDZ62A@mail.gmail.com>
 <CAJnrk1ZbThfvHBfVq_SntuRLFsvHC=DMBQnNcS7Zu4MV9YXTgQ@mail.gmail.com> <CAJfpegvfu2heS4GpvcKxFXaCHfWSrrdCqswkwY2my8zdX_M7Ow@mail.gmail.com>
In-Reply-To: <CAJfpegvfu2heS4GpvcKxFXaCHfWSrrdCqswkwY2my8zdX_M7Ow@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 11 Jun 2026 13:39:20 -0700
X-Gm-Features: AVVi8Cc1T01OWOxOnvz0R6GuvjulPlqDg-r3Wvy_cB_G0AMcHgT3dkueAoZRoGw
Message-ID: <CAJnrk1a-8FD8rqpQ0n7+WMMR2LDM040YC4rWA+1xSB48__O0Vw@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 11:18=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
>
> On Thu, 11 Jun 2026 at 17:25, Joanne Koong <joannelkoong@gmail.com> wrote=
:
> >
> > On Thu, Jun 11, 2026 at 6:29=E2=80=AFAM Miklos Szeredi <miklos@szeredi.=
hu> wrote:
> > >
> > > On Thu, 11 Jun 2026 at 03:51, Joanne Koong <joannelkoong@gmail.com> w=
rote:
> > >
> > > > a) I don't see a compelling use case for needing to dynamically
> > > > add/remove individual buffers from an existing pool. If the server
> > > > needs more or less capacity, adding/removing a whole pool or queue
> > > > seems more practical. If we do eventually need single-buffer additi=
ons
> > > > to an existing pool, that can still be layered on to contiguous poo=
ls
> > > > (but removing buffers can't).
> > >
> > > If server knows that it will want to remove individual buffers, it
> > > will just have to register them as separate pools (containing a singl=
e
> > > buffer), right?
> > >
> > > Buffer pools are a more generic concept, hence they come with some
> > > extra complexity and overhead.   But the interface should be a
> > > superset of what individual buffers provide.
> > >
> > > Am I missing something?
> >
> > The interface is a superset. Internally the difference would be X
> > bufpools with a single buffer vs 1 bufpool with X single buffers.
> > There would be more overhead for X bufpools (eg allocating X
> > fuse_bufpools structs, looking across more bufpools to find a free
> > buffer).
>
> I don't think this is an issue.  Allocation should be as simple as
> keeping per-ring freelist for each buffer size that would have all
> free buffers across an arbitrary number of buf pools.
>
>  I don't think it would add much additional complexity, given
> > that multi-bufpool support would also be needed if we wanted to
> > accommodate different buffer sizes in the same ring.
>
> To conclude: bufpools allow allocating/freeing multiple buffers
> together.  The API is a superset, since allocating/freeing a single
> buffer is still possible.   Additional complexity or performance for
> the bufpool layer should not be significant.
>
> Is that correct?

That's my understanding of it as well.

>
> If yes, I'd go with bufpools.

I'll send out a v4 that adds Baokun's Reviewed-bys, fixes the
documentation typo, and adds a note to the zero-copy commit message
about abort teardown.

Thanks,
Joanne
