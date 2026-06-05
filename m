Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF214963A6
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780647194; cv=pass; b=TcFyi4rK97AeXnNjK0ihtJpSa0cB3k4wtotfsdkNB2izgUh33VS3K/RErEHOFphqsq8RCnQU09rqzwYrgeU9JobmMMQFNOwySn6lICY4ck8UhUpYNdlzV5/Hmpo+tn5WaGdWSSKiBJM4aRy61hOl/yzINyOoe7BSfgDxHpRjUSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780647194; c=relaxed/simple;
	bh=TZ16yiH2kENvufWpcn97eniHkqNxtxx0QfhwAf2xdks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQgw5iRaKrBaVNokt0TCXoxd+WuEPX3UJNfACw0q8+vteIc1PXyFn9uHrkswDHlVIc9/Us8Q24Ojz164gGCaP2M85+CaekX3ZT1y8oZUnUs112aiJS+69FVg/YSUZM+87v1PpkNtux3YQKgNwhDauF1sCsXkIi0hw9cNPyGUVew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kjv8wlx7; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kjv8wlx7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so1248420f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 01:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780647191; cv=none;
        d=google.com; s=arc-20240605;
        b=dIoDq84fWDpVyexYeX4EOKx48uL/BGl8KRP08d0omDoBUQqAE7gzkj+CSv1L5npzCr
         MRoYVQgvnSBtSSx9//ZOGIybAMnRvP0pmI3OyrqROB18tfMHcuuuIYFrpoDtLXxyV0k8
         xL+rO0Pf5X/QIlAM5TZ/JjEsUpQ5k6ZWwlrV3u8UTuWLxTjGcO6CQU7k68nSLKvUl4CD
         3Us9SebiKqRsHzNHr1W/UwQvGd1Jy2LZtruPet1haQp7yGMk7rSfRJXAosPEwELNZEbt
         ApMwVMdZ2OevHTLQkwcvpWMHcOa9UbyuZk2Rq2BfnVxXFh/L1nmmK15SLm+WvR/02V5B
         2tOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AQYem79f3QIdQWuLMP9pY3yEqnsDaRCj9n0j9Nn2Tsw=;
        fh=wogXPD/a1PpNh59AqmG0BFwbR9KqtVP39ydErIQ+BXY=;
        b=C+dWyy/N5To0imWqcFE73hPAEC4nWTa1aVcU58M4rc0o+cNWuUzFbKI2ci2hrymj+M
         6a2L6zxcqu+QB5r94Aax100znweKLWo8+FXUGo88RWZ+vLrV2FYzEfjBFUn0RK6FIzlh
         GDXDXvHtZrTpSDdfJm/Img1OCOLBvnxcKH8Fg+XcayG4oQGOfYqAZPffoG3Ia1v/kNmB
         fkK/TASW+d1Yo1fBh1cw7AgRkdNAU0X//f57rDkVOZk8mq6mJLvvBFS9p8TSvyP0NU60
         ihTOok+K1/7G/AxETTHbP37ZKP+/87Ls2IBtcmnqSczP/sYg6YR8LQP/WnJVwCku+Um3
         QYqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780647191; x=1781251991; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQYem79f3QIdQWuLMP9pY3yEqnsDaRCj9n0j9Nn2Tsw=;
        b=Kjv8wlx76F3qArg96dhafZPEakurgpFPhclArdzjYkEqokI6jaf3xjKbAp9HndytwB
         yvutpOSj06vA7FNIzkeFs9F8fU0pnq11w3RcDk2rJ2yZPSmq80GRS+29Uf8vrECl/k/E
         2K8pCpemZSCxgMbwZutFL61IF7Y7hk8UD5nOnkMx5e7BEjCaULttcJ0LSgMh8CyaFesa
         /RHScgXthfWHHVr84/I9+22ci5R1NK/BPO2dseWqxMHZWUQYgcn4JOeubiDFEVd1x6GP
         gu8cisk7/ItWtLECbQ3IEG/br56yvZpGRfr4a5GElBP/+cZ2eANDUmNLxVe/4wJZGKTO
         V7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780647191; x=1781251991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AQYem79f3QIdQWuLMP9pY3yEqnsDaRCj9n0j9Nn2Tsw=;
        b=bRrW9TMYNYXJOro6qtD4op6RM+/pBHta32UGWk44akM6G4Omom5VOaY5tRDdGh0zdb
         h7lSUpajpPv2U9s+kXmRGrItGk+6fR1B9zVS1UpPo1awQuAa5KD1twO1qWovMqV8CoG7
         uv3Ji2bhOTujMdn1QsVbhzP3iCXsbwH8/GrNU3iJWfZ0kJSHQJoiw67yDa51WFB2nNN6
         /nW1Az/MpW89B9AA4lARjgaQ+O+JeamJzfzf26riniqD6KUq7uKx/NCZ2K7ig8VwJWMA
         JwyUs/IdjYr9CLkuDN8UdbW8oo7BhR3xiAGxJf0SwZLaQr1h2DwY3+2aBWJPkbLePj1t
         gv6g==
X-Forwarded-Encrypted: i=1; AFNElJ8FjipD5797m3e9ZZ0nOvNaQLLZuZqg7ZN6VpIDWvgepR6IL6DT0fJVPMNInrsU4LW63xDtwwMg+YGh@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0RPyUqV5KAAkyWNin2ewf3lm6rGZAyF7xOIdfk+QrH20KDgB/
	JsKq4Jcdct4o7thlKOXQMkbvMr8QEzFZ9agOtBZczWrDviSTlNqDo5VulUbY/JZX63CNO1oAXQ6
	uLG5xCH0bY2MbuoAnlIhtVu41f1HdbDc=
X-Gm-Gg: Acq92OHSpP1XflSLPjYNdH6qpujqi5cXleIFymwPX4z3V8PObuKOB6PnjqN9ZOMqASo
	PP6yV9Hii6FQU1Qnxvp8YnRnGEK7aZSKDcKLF3s2IlenoL60Thwi5K3r0x8iiM7HidV25gMsmjx
	uzdZofJrI0WWiUIXcrmIYZ1vzDYYyAuO+Dw7rnOQndEAt5kvwJr7xJqApuxCXbuwlYoZCxSabgy
	NqHOsL0K4HS8aezHQ9ks4Sz/s0HxJN3PEZ2FxHAqGrqrrOmSY6SjD4L45xKa4L/ethv0ANoe0d3
	CsiRiGqcAO4fRcS6HTLzahzbYjMLTomMKrHO+dZ/wnapxWarB44IFXKJdtlRj/U=
X-Received: by 2002:a05:600c:4f90:b0:490:3890:605b with SMTP id
 5b1f17b1804b1-490c260f448mr35679105e9.31.1780647191021; Fri, 05 Jun 2026
 01:13:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
In-Reply-To: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 5 Jun 2026 10:12:59 +0200
X-Gm-Features: AVVi8Ce2pT4v587d5pt4IzDsZ3R0b78esRZTg8zIQ-99RukY6zokTjMfjGQQ0fg
Message-ID: <CAOQ4uxjCKFdxryKeLQw3M4C7Jn8tOQzUELqBSu8s5nOU37m4_A@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] fuse: compound commands
To: Horst Birthelmer <horst@birthelmer.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>, linux-kernel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, Horst Birthelmer <hbirthelmer@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 11:51=E2=80=AFAM Horst Birthelmer <horst@birthelmer.=
com> wrote:
>
> This series adds a single new opcode, FUSE_COMPOUND, that bundles a
> sequence of subrequests into one round trip.  The wire format is
>
>     fuse_in_header (opcode FUSE_COMPOUND)
>     fuse_compound_in
>       fuse_compound_req_in
>       fuse_in_header
>       payload
>       ... (repeated per subop)
>
> Compound is opt-in per connection and discovered by trial: the kernel
> assumes support and clears its flag on the first -ENOSYS reply.
> -EOPNOTSUPP declines a specific combination without disabling the
> feature.  In both cases the kernel replays the subops individually
> via fuse_simple_request(), so callers never need a separate
> non-compound code path.
>
> The series ships two consumers:
>
>   - open + getattr, used when fuse_file_open() needs both ff->fh and
>     fresh attrs (O_APPEND, or cached attrs already stale).  This
>     closes the open-then-stat race described in [1].
>   - dentry revalidate, fusing LOOKUP + GETATTR when both the entry
>     and the attribute caches are stale.

I am not sure if the intention for fusex is to carry over or phase out GETA=
TTR
in favor of STATX, but apart of the strategic question whether FUSE_COMPOUN=
D
should or should not be added to current FUSE protocol, we need to answer t=
he
more concrete question:

Is FUSE_COMPOUND intended to improve existing unmodified servers
which link with newer libfuse and run on a newer kernel?

If not, then maybe we should start with OPEN/LOOKUP + STATX
from the start.

Thanks,
Amir.
