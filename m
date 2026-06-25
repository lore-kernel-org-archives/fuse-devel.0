Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5220B31F99D
	for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 18:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412657; cv=pass; b=Kto1bXzl+3IhPsrYhGI/YqcAtWPRvN1zAdNYJfhK+QMWxgiZ8ljvsQOfgyqOgxGiIJHK9zqVsVAVqEmkUNm7nOX2sxFwgtn+37I4xUJj73Kp1twyGpBU6SIDp/Q5xbn/bFpObp1o5GWH5c+NdJAnB20ywU8lDEKYT7MZloYbgBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412657; c=relaxed/simple;
	bh=0AhDpHLq6oDLgrjSkBrfMMyn2SyIieRadYMS+e9uHYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHtUIWG9Cl3D/K5No8GMNlQlJjINfh82laoRE5IluJty7hCL8ueCCNJ3/o3FQStuf90hxwpgynce5uokjY+X3pkUUmaiB98a1TZR4QtIp4AWBzCUoBspwWrNUQOZUmZLJtiA7Xwofg2Dsye42hCqyUDhbHAE8azR/B+XmqFUrmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAfH/o2l; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAfH/o2l"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so9455505e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 11:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782412655; cv=none;
        d=google.com; s=arc-20260327;
        b=a4BmJEM2PZhNvHQloVqNjcFtpwXcduM0gB9wldL/veRatgiLNpmAMrrEFLa/pjxfaA
         xUlfdDSwU5wiOwl9+a9AONd19vJarZBpyjnc/GOq/v/DEknZfRxPPbg16T3Az5W6VPSc
         2BQdZp3RBMPc2HNyvdYWFc0tISdpfO1dJhbgdIunYf+Yoy6Hgvm3KT6AoAz3T7vJ64SQ
         Gavy0ulJAuwUSbAvxz0b1EPaTCFY/UnA3YTdIYhgZXOvtAxzOgvQ+35ou73CpdXuXK7W
         IHHJx+3Lue14c6dB4ka7oKSMSQOLuxGapNPqbNi8xLK/qowcj7QiwYBfEKsN8hMO2aHR
         KvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KL2nOE50w2YzPDimnuB/pUNuuQkFKncdawY+2fu6bMg=;
        fh=uXgtM0QsAXUW3OweS61IhhJ1/nkyF0uVRaxy0QQd7QM=;
        b=XfzHJ3TgkWwBP4uNN5I26gIpFgjSitk5QDLa8zgLRJV+bZMk30W6i4OzA+k7SIfh0g
         qUjpKwu+16OEcDLdJD3+FA4o1V3NnDPzRtX/8LbAOO9D8DmsLfvV9+KQEq/PvNC2jKJT
         yTGqwVpc4vPE6RYQZ6ELt5eckrIfZ8L8aCpsFpHnUfvBQdkbXTS1zKVJgNaIC8W37yrZ
         IZ7ZPZyCS57WGdxqixnL+ujEu7YHxcsWthyt+bC6YJ5Nv/IHPTFQw+iz5uLr3+C8Aaq9
         Y/rFRg28DxatAA58aFmhYmaSp8XRp/xUjCx3Bjbll9gaayRfdkQqTFY3UfIxWHMsxkH7
         9kqQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782412655; x=1783017455; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KL2nOE50w2YzPDimnuB/pUNuuQkFKncdawY+2fu6bMg=;
        b=lAfH/o2l3fuCbVfQ0YbtHTZPzuNTj1896/Xc3oxH2UzpHi8icKkZMnNicgsAdISnoz
         pll4YfepGIhIhRRw133xwCbhfEFpuuL1hgjnlPOU1VVvCU7dqmYWxXZh7/gN1Mm7hIy/
         MGwDzSodBR1GkEZY7mgZ2iitgtsAM+Lm/WaLwINzAoysnMoXKC4xT2H+vKGoI2Zt9QAv
         ugpRIVH8fwgP+Zq7iI8sifcoLeauIZxulZDRrisCtr77vfmqkEE2ehWIuHxaELyz4mfy
         MiSzb428ANd14mpW+LtMxQxZfHspK/7BhIBW0O7MfkbaJtWbOE1fPv77yIA8EMg7f0aZ
         ajKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782412655; x=1783017455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KL2nOE50w2YzPDimnuB/pUNuuQkFKncdawY+2fu6bMg=;
        b=d7FskMl5hY/gW3PU50VLNCjZdZyZfloOf9+/8A3oaipdDvhXhYnTussFMZFAliWYa6
         t4XABj0Tc7IAbnwQoZtNIZXmsHINtj8nLt/sQqC+HliDLu6AW4h+puLPR651NVhZ4V9z
         HGZYKBtFF9KCl7zEu9h/XzgaoavmAk68G7y91iAH2569aZnDbbTjSH6rJQWiQzaAAFd2
         VFzcf2DD1qJ5qbJhhHLt5F4bYFDG5qX96XQ9NKvek8hmGnlNcD6a+DTo8EgiKHwUhXVp
         K5pCyXcmdNpeT6Vz+T7C6CmxWZ/Dl2CZsbKbEiwoyGe7rphnjhaeNl3Bv8oPhe0oHbIQ
         7Wmw==
X-Forwarded-Encrypted: i=1; AHgh+RoQW9+Gwnc8H+9H/KJLAF40IUFNY6jC/uXscrWJwOqSEIUeYxZAlJCatilOlNyTi1UqqSV2IE+Ft6ue@lists.linux.dev
X-Gm-Message-State: AOJu0YxFKlAo6tbkejkfoMLwTRX7M3BwyxQRxxc6r5XyS+CcwpWq5ye8
	Q9Ry+2gM8AXMlfUdEt3Pd+F1vbmuVUU8/l2WuBczksZpaO9PUhYz3iuXVsNbEHXZQ2xqlBzxkrf
	JINGabOMfC0UtHSDHLlxENmTydcEm/b5jyGZf
X-Gm-Gg: AfdE7clnq6oW2W+qBKcUi1ATQJbCkAjJVoLC6iE630VxS+QN7CQLovI9CJHAu/VL+ZH
	n4pPBCUk8GzxJLsjiWJVcr/Fg6ReWMHhV/13hD8FCwdUy1OgGpgwFdkoCi2ziGRrWhvl1mT5Oj9
	eoyOvRLAzVKOTIw9AAxgkJJWbzJyo6rRrKqsLDRdnYAlopEqcsWbfjSkWSWEgfL9Ht8f5+xtn/y
	tOQ16AE0jCg6Y2XlX5W0kpSzIau3297YxLAIL1dzpl9qiijOhc2KpdeqmJe3xOdUFs4ekeldtxM
	KvtajmMl+zDqMSRD++ZEEMIwRccSOF3+cEtfgM9H+QyqYWDnHjPt
X-Received: by 2002:a05:6000:2c0b:b0:45d:4c30:81a6 with SMTP id
 ffacd0b85a97d-46da753faa0mr6279125f8f.5.1782412654673; Thu, 25 Jun 2026
 11:37:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624012132.1719941-1-joannelkoong@gmail.com>
 <ajt1g56cUmOMFJ7z@fedora.fritz.box> <CAJnrk1aSaD3Ur3oHdsfdGw1-OSoNZjrVVXz9eB0ZFDrHBR0ssA@mail.gmail.com>
 <ajzTpMB0BZ4TY0Np@fedora.fritz.box>
In-Reply-To: <ajzTpMB0BZ4TY0Np@fedora.fritz.box>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 25 Jun 2026 11:37:23 -0700
X-Gm-Features: AVVi8CcdMmA0LWZrFfxomuRjVT_WlvYEhV_H2ZMyiQcvgbpEmoOD-Sd1Kb82LrY
Message-ID: <CAJnrk1Z934KuBg22KpERD++g1Tk_Z_LL_kouuoi9uA=1Yj7vkQ@mail.gmail.com>
Subject: Re: Re: [PATCH v1] fuse: enable large folios
To: Horst Birthelmer <horst@birthelmer.de>
Cc: miklos@szeredi.hu, jefflexu@linux.alibaba.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 12:17=E2=80=AFAM Horst Birthelmer <horst@birthelmer=
.de> wrote:
>
> On Wed, Jun 24, 2026 at 10:52:11AM -0700, Joanne Koong wrote:
> > On Tue, Jun 23, 2026 at 11:16=E2=80=AFPM Horst Birthelmer <horst@birthe=
lmer.de> wrote:
> > >
> > > On Tue, Jun 23, 2026 at 06:21:32PM -0700, Joanne Koong wrote:
> > > > Enable large folios, capping the max order at the largest request f=
use
> > > > can issue, so a folio always fits within a single request. The orde=
r
> > > > range minimum is 0, so under memory pressure the allocator falls ba=
ck to
> > > > smaller folios.
> > > >
> > > > Benchmarks (libfuse passthrough_hp, buffered fio, single job, 4 GiB
> > > > file, medians, NUMA-pinned, performance governor, strictlimiting on=
 by
> > > > default):
> > > >
> > > > tmpfs backing (page-cache bound):
> > > >   workload          bs      large folios off   on        delta
> > > >   seq read,  cold,  128k    3110 MiB/s    4514 MiB/s     +45%
> > > >   seq read,  cold,  1M      3079 MiB/s    5181 MiB/s     +68%
> > > >   seq read,  warm,  128k    2438 MiB/s    4486 MiB/s     +84%
> > > >   seq read,  warm,  1M      2403 MiB/s    5123 MiB/s    +113%
> > > >   writeback write, seq,128k 1211 MiB/s    1699 MiB/s     +40%
> > > >   writeback write, seq, 1M  1462 MiB/s    2208 MiB/s     +51%
> > > >   writeback write, rand,128k 1101 MiB/s   1757 MiB/s     +60% +
> > > >   writeback write, rand, 1M 1284 MiB/s    2228 MiB/s     +74% +
> > > >
> > > > xfs on NVMe backing (device bound for cold I/O):
> > > >   workload          bs      large folios off   on        delta
> > > >   seq read,  cold,  128k    2030 MiB/s    2172 MiB/s      +7% *
> > > >   seq read,  cold,  1M      1999 MiB/s    2181 MiB/s      +9% *
> > > >   seq read,  warm,  128k    2451 MiB/s    4939 MiB/s    +101%
> > > >   seq read,  warm,  1M      2340 MiB/s    5639 MiB/s    +141%
> > > >   writeback write, seq,128k  637 MiB/s     747 MiB/s     +17% *
> > > >   writeback write, seq, 1M   694 MiB/s     833 MiB/s     +20% *
> > > >   writeback write, rand,128k 1004 MiB/s   1648 MiB/s     +64% +
> > > >   writeback write, rand, 1M 1171 MiB/s    2055 MiB/s     +75% +
> > > >
> > >
> > > Hi Joanne,
> > >
> > > just out of curiosity, did you disable bdi strict limiting for this?
> >
> > Hi Horst,
> >
> > Those results are with strictlimiting on. After commit 494d2f508883
> > ('fuse: use default writeback accounting') [1], I didn't see any
> > performance regressions anymore with large folios + strictlimiting on.
> > More information on why that commit fixed the issue is in [2].
> >
> > When I ran the benchmarks last week with strictlimiting off, I saw roug=
hly:
> >     tmpfs:
> >       seq,  128k    1174 -> 1648 MiB/s    +40%
> >       seq,  1M      1261 -> 1845 MiB/s    +46%
> >       rand, 128k    1148 -> 1638 MiB/s    +43%
> >       rand, 1M      1273 -> 2065 MiB/s    +62%
> >
> >     xfs on NVMe:
> >       seq,  128k     621 ->  740 MiB/s    +19%
> >       seq,  1M       649 ->  776 MiB/s    +20%
> >       rand, 128k    1020 -> 1515 MiB/s    +49%
> >       rand, 1M      1125 -> 1895 MiB/s    +68%
> >
> > Strict limiting on actually had better performance here, which I think
> > is because with the small dirty limit, the dirtying and the writeback
> > happen in parallel instead of more dirty pages accumulating and then
> > writeback getting kicked off. Because the backing device is so fast,
> > it didn't cost throughput for the dirtying and the writeback to happen
> > concurrently. The benchmarks were run with fsync, so everything had to
> > be flushed before the fio run returned. If the backing device was slow
> > and writes were bursty and fsync wasn't enforced, I think there'd
> > probably be better performance with strictlimiting off than on, since
> > the writer would be throttled to the speed of the backing device with
> > strictlimtiing on.
> >
> > > In my tests esapcially the large writes run into throttling pretty
> > > fast, so that it effectively writes pagewise, which was not the targe=
t
> > > of the test.
> >
> > Are you seeing this on your system with strictlimiting on or off? Is
> > that with commit 494d2f508883 in your tree? What test and server were
> > you running? Do you know what the speed of the backing device is?
>
> Without your patch I see that when I enable strict limiting most

Which patch are you referring to? The patch that turns on large folios
or the patch that fixes the writeback accounting? Are you seeing this
with large folios off or on?

Thanks,
Joanne

> FUSE_WRITE requests in the fuse server are 4k. With it disabled the
> writes are triggered with larger sizes.
> Since bdi min_ratio is 0 by default I just assumed that as soon as the
> cache gets over the limit a write with that page is triggered.
