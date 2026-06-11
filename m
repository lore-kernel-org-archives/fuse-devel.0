Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDB6219303
	for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 01:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142685; cv=pass; b=duVlSXgR4/IdInDRy3jWoUcH2QXkYl27BWp2UZwRXyzdCB5OjAaO9fuOUUF5iumwJnSIN2C//ty1z8TUSiQmgnltM6Au8jcGc4dNbCbAqrDoT+R/WInw6b3tN546HctIa6gQ3TOqAjeW7qUotw7t/K5AlwE1b4oHKlLDG+K7bEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142685; c=relaxed/simple;
	bh=Fh1m+thei8UO0S5rMZ3hy/QoBxF2RD02KopLt5D8hYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XhdeIVcEnypS4SlPFgJ5Y0vUr0kFn2jnyWqAR22jCcoFVz5NQi2iShvtj23HaNeq36wKPtwUgD3yNTcOJZ47vuYTVViuDgkOe4y7BSFMpXdBAM9kzjdTC+tWUbu80PZbwES54UfWGT0SifhUQASR65UM1wP7x7BGbf1xJX9Usoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0ZXpdAB; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0ZXpdAB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b3637b90so63521405e9.3
        for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 18:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781142682; cv=none;
        d=google.com; s=arc-20240605;
        b=Q74bavMqoWO+naVmWumHNT/ZQ6XQXr4cHFVEZmLhDvPBnCpCrXjVeuWfWuFhO5HVFd
         kkVXUK9JuFtPnTyIBESgSpuJSZTI8lbZXIVqetipDzcvoAQEJ26wyWYR+R1XJbNir76/
         DQ2BvtppcKyC9ruEO9y+AkIq4dcEE8M/8tTimQehcTPKytvnIwMCBjtr+BCCZmQ3bTCb
         IsJ6H6qkfiPZx3v5woqJ+1iBZ28ePRpM79mz7a2cX3v/MhUZ/uT7Fw2BgdXjG7DMVKeB
         pxaXs82OvWdN2HTuPGamWP0c1T2SYfGGzsourr+0Qr7DXlvys8lF1+N75eE8Y7Tf4Fgt
         Clzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fh1m+thei8UO0S5rMZ3hy/QoBxF2RD02KopLt5D8hYI=;
        fh=C7a8JA8F3/0wwWfDvNwIbYraksxiGm2MmYu7+gkhoyw=;
        b=M1XnLs/Hjpf90ZTQ5TzuKmMrgWXZbCIuPZtvinChprlDKnUQJrTEdZzB9YdoBBoab8
         zsfww8BUUdom5RaM6nbGU2M1pZ61hBI78BevKqatL6WEkgn/kyu9jWTPBJ7Volf7xAQP
         HEEht4+Mx89vYEZnmk6IuY66lft8gu2Az4DxBxAZH2sq1K3jCcIWrRvlbiVnYhQgz1ig
         6jDZA4tQSQde87qbC1mG70emya7X9+kTPgWw6oEZlVLcL479T1Tiflx1YwdOqnvedAc4
         nQPBZzBNFON59KsNKtmDW07ZEMMPUzEIW1QEpZAwiaRW3v2PEfRdf6vtJk9EqoPrI+a5
         8zkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781142682; x=1781747482; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fh1m+thei8UO0S5rMZ3hy/QoBxF2RD02KopLt5D8hYI=;
        b=h0ZXpdABD3w8Z/o06+I6687T5EyAbsNksu30rbgMyo25NiWZ2Ba1ETVWZ3UZnPSLak
         8EfonPnCIKx+JtR1eZ9mqFc5fNaU1zwJ7ejCh5d6y/41c4Tvx7h+BisPYvEUWihWVZnU
         IFOhjxn69JDky8s60/tdDO6jAt9Q6PZ2O5HCcYl/YJcMlZVLSBU5f2Ja95AXTnCKwWkj
         e477qTGKBt6oSAaWRv5YvVsQk2NPL2jCqDnNe2o6NRe/IzhIOLNbhzvBEREBcf6bAUXT
         qnJ8E3URixkx+Lj3Xj2+rsPl0/0s5caVBS8UW5nPzb5w9/kV+5rRTra2IcmnlYg8ncS8
         t5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781142682; x=1781747482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fh1m+thei8UO0S5rMZ3hy/QoBxF2RD02KopLt5D8hYI=;
        b=iowYcr5IEIHLX9OdFDetEm5L9FZMGjHbMOvLGqErFzOTSmAKJOcuraRNv+yldebEl9
         a1agRuQUyvFS7i9lopKpu2UJd/Gi1IfCrsAq+HEnjZsOYGMSnMDPyL8C8u/pdOSxxlP6
         YEN47Q32X1fNuVpuyo9Ho44EhL1+1e1l1yGrV8qTl6ehLn+/Ul3j4OOZKG+pnrWOVCO0
         19+wop1FALq4L/gAmtEVfQ+HfLUv9nErn9NO6aKgzhsNFxJWLVpl18v8BfjBQ0x+9xOM
         IR6vkwGIsVFRiFQsbGVL542GR5xVXnhVfkwEn6ZwVfVybYJFLiUovJ6uXFtBWCZCq4p+
         vyNg==
X-Forwarded-Encrypted: i=1; AFNElJ+WfCnV3m+f7JKfg27V3Z6C+kDEyG+lymOoRUsH5hg8HTXttE4X10bmvdSiD4FFI8avT2mNrIvcXyGc@lists.linux.dev
X-Gm-Message-State: AOJu0YxfYhVNDUoKGEzoxdNEgSvTzrBy8mBU4d6yK8hOvugToecDmW2j
	lz9i69UPsLNree9UnVtMHDq9weOdi3Dsim4DeHKtoz5BG4euokvec6kgG3TdCtaPV6uduRLRFG0
	iuAKC5qe63IFbT69obfu3hTIdSnhiuXE=
X-Gm-Gg: Acq92OHOxtcRFRqHf3fI2RU5UzUiyTljVL3yvH1KVSviiR5OErU7xy6rV3vYV/6xhPH
	1VHw1XloOuxQI1Qewf7ANUTYtQJAMGlxC2zu5vjZSxWM0rMVlDl+P2BFt6oPRYMIwGojBtFqrje
	EMX1S/qj6qfFAhSFounrK32+Bm272cTm8YkjFl2jBEsmBwVN4OTNcBQfw3FGFwrmztD6NSpLXQf
	whOe/P2woX1CnaIzionNnfwe5m92pH3sdpBJDqLKojEBbbhUx7MQDlj9sTSjr/vtX7eiJ3bTZzf
	aJUEWILCqb1ueXPncz5B1qCb9dzWgjdkno3F+4WPuJryXs4NqIrLTRu+LgQ8/GehUdjrDCzW9pl
	zU3iBFqcK
X-Received: by 2002:a05:6000:1842:b0:45e:f3b1:52d1 with SMTP id
 ffacd0b85a97d-46067576bfemr814034f8f.9.1781142682163; Wed, 10 Jun 2026
 18:51:22 -0700 (PDT)
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
 <CAJnrk1aacCbOWWWvW2xnQZ0a954-4shXdyO9LBn_Fv_dyUAWnw@mail.gmail.com> <CAJfpegtorFv9u2NCPA8v5OHiBUNT-XzUiw_y=7c3U3WEaXRUZA@mail.gmail.com>
In-Reply-To: <CAJfpegtorFv9u2NCPA8v5OHiBUNT-XzUiw_y=7c3U3WEaXRUZA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 10 Jun 2026 18:51:10 -0700
X-Gm-Features: AVVi8Ce29ttxyLYaBPUgUFqFM68FW1W6O1m6CCOYC8Do2Riwaa9LHAiLK3oRi_Q
Message-ID: <CAJnrk1arYPY1u8_aiMfYUbmb9Oy4epRWJp_W7-hjAxQ_ggJn9w@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 8:14=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Fri, 5 Jun 2026 at 00:07, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> > In my opinion, passing in the buffers contiguously as a pool leads to
> > simpler and cleaner logic at the fuse, io-uring, and userspace layers.
> > If a daemon wants to dynamically add/remove buffer capacity in the
> > future, they can add/remove another buffer pool or another ring,
> > depending on their workload.
> >
> > From Bernd's perspective, passing in each buffer individually allows
> > daemons who want to dynamically add/remove buffer capacity in the
> > future to add/remove capacity one buffer at a time based on load
> > instead of needing to commit upfront to adding/removing a pool.
>
> Isn't registering a single buffer a special case of registering a buffer =
pool?

Yes.

>
> If so, the question becomes how much complexity does the buffer pool
> add compared to the single buffer case.

Internally fuse would manage the buffers as a pool regardless of
whether they're passed in at registration time individually as single
buffers or as a contiguous pool. This is so that entries (reusable
communication slots between kernel and server) can be dynamically
assigned a buffer depending on the payload size of a request, instead
of being permanently tied to a fixed-size buffer (more details about
this are in this thread [1]).

A contiguous pool makes things less complex but individual buffers
can't be removed from it. With the single buffer approach, the buffers
don't have to be contiguous, which means they can be unregistered and
freed individually.

I think a contiguous pool makes more sense for a few reasons:

a) I don't see a compelling use case for needing to dynamically
add/remove individual buffers from an existing pool. If the server
needs more or less capacity, adding/removing a whole pool or queue
seems more practical. If we do eventually need single-buffer additions
to an existing pool, that can still be layered on to contiguous pools
(but removing buffers can't).

b) it makes things simpler at the native io-uring layer. With io-uring
fixed buffers (which bypass per-i/o pinning overhead - benchmarks
showed up to ~10% throughput improvement for fuse reads), userspace
can register the contiguous pool into one slot. With single buffers,
each buffer would need its own slot. With a single contiguous pool,
fuse can reuse the existing fixed-buffer import mechanism with no new
io-uring apis.

c) the userspace api is more ergonomic. Instead of registering X
buffers individually where each buffer has to be passed in alongside
an sqe, you can just use one sqe to register all X buffers at once.

This is my perspective on it and I'm trying to be unbiased but
obviously there's probably some bias seeping in. If there's anything
you want to add to this Bernd, please do.

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/CAJnrk1YPeeCSsQFjaFNROYcOdBO-kTovOTD=
kCigNKRt57JREJQ@mail.gmail.com/
