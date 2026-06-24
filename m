Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDE13DD849
	for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 17:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782323547; cv=pass; b=fLTy+7SJm911A+6C4YUQFKwgN/RhJK6gVYQs+wQDQ/Sc56+bstctWTj19VOBs671nMbxwMajcaUzsv84BvmFMS5qYp4CboGFNpXCJcbbQR25r8LrUfPv5v8IWCQ8pQKY5LK6tjdd9Z+FI5ftca/fuj8Zlg3WdJon0tV0Z5yEOrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782323547; c=relaxed/simple;
	bh=3ulWo3bIJEIjDPaTM8S/5oS0bXOA8xvQT7uqWYvuOdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blHC3crVH4OItrlx+H59xq9ggkKnMmkCOfVZjF392EhCnk1U4/0A5Slh02LAidE8oGi7Fp6/0yi01vAPCR/dFQXuzq1axBYS9zj43iAHCYOwdZyy9HVCPj96+hEOJ0pbIWJTH9wH7qO+H3Bypeix7i8bwuFQH0OlcYdxlhIhjrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgRQQ05P; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgRQQ05P"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b7866869so11611175e9.2
        for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 10:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782323543; cv=none;
        d=google.com; s=arc-20240605;
        b=iIUKkcQCGJlsFUbxT+PVoz/sRoJQ9jqaBkL0DxRfWSQADMFJpGIaAGxiiXxqQCbcyR
         EAtRmX4CPVSOUiv4Jr2zAIXTjHbNYLW/dHSiMFCduCoBLRdKDmgb1tYqaVst/8MCMJJ3
         bPY2nUulYEsQ7zWDpfXl2WdsqshIszcxrsQkupnwceL84hmWd5iDg/QH2dnVzctBWqNn
         S4XGfR1Nao+dtVhNENu9gcnjxJYw9ODDNBLYoS5aUFJnQs7jgMJKWubhroR6NMawj3BD
         mEhr8iUMgSLEB838kv5ulN9JpIZ7TyJ2SaqXS2B00r6eOo2j+8uOpjDCf9E0/nlEFNmg
         trnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cOI/TzyXoF7redq6rSBj8azMjcxOuob8adafgOJmzPM=;
        fh=8R3npsNXDbZhZamyzZgjdC8tW/MXT/nhOuGReKlCa30=;
        b=EjpWf86od4MJTWZVt/xkrBAI73iauU/HCclHtPPqK7yoNfB0xwoMSJR25UkXNlXJn3
         moX/c8fbfW0XmmxTI/vJ7JPzYjEBIwzPykYLHGEj5DC+3Nvz02QTNvqQNnt4VTHrze1A
         n4wud+bw3KQCggvPRmnqY/khlrQIKhDh6dmnCM+XXcrt5XH+Amg3jqjraRAgrdYaubkO
         sRM9KHCx8NlHDBIEcUIoWLczLmG80+VTtua/xDN81sLKywJmG9h5mjS+qmytd9eTfZSt
         7MhNRtWla0fKCTlrDLlCkKaDvR5DsjGAdubuUq+JiZ3GUbGbWVbCNz2rcpUp4ATfBpl6
         3tuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782323543; x=1782928343; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOI/TzyXoF7redq6rSBj8azMjcxOuob8adafgOJmzPM=;
        b=UgRQQ05PVIba02BpNe5gOUpYgDRvqg486T+rffJmvd5Ji/srQ7A2vnWMDHIeYPH1Fy
         pq0R6t++ypuXqLFgKIDrfiDyBG1dQhKspaKRAjV7LZ9YH9HcSStky8vJM5j1w0LsGMm8
         gaSZYyHAKE5CvMxb50Zpa8WKEjO52D8m1kp2qZPfash8WwHC9K18/WTX65B08U8z26vG
         yteu8x3V8oRQ8IK19tonBp6AQiAsailXnSbuEnsD5Z9zzZVxktdPMC3Jg3DwO+k5u3NZ
         1vZBXgLd9sqnVBiwPzURqqI3GJvyTnQqSWM/DS9hvlR8U9Pimk2bgviH5nF886gYNY9I
         7Gsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782323543; x=1782928343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cOI/TzyXoF7redq6rSBj8azMjcxOuob8adafgOJmzPM=;
        b=BKRxE8s2fn4uhpGo94DlgIWEbPQVgPXvBEtutSVz9uULx6yjuXrjRwn5+uOU1xjeIl
         0MC3FBfnYChcDcndoxm2mgXjphmHTB3vKRGkqlGuOsiFwyZrYsZIwYYaLhQCK7HjbrTr
         Z0WFJOA36VtedRRwgNaF0gZ43HFfPPtyqToti8f0G3CKaS2k9gCyBSvM4jZ9Q0MpT0Z+
         s54ZIgOAzR1XodtlHqY2rTSz+I9zkmt5ZWHoxkn1EGExGBn26UuiqDdXZHWhunrN89Ns
         DT/wzUoh7qV8cet89C3Sq7iFhRhHr74DOOH+WUoCpf6F4G7eaH/QvO+o5HKMcHdVdJpy
         yJBg==
X-Forwarded-Encrypted: i=1; AFNElJ+Acr0sRdJU/dHKLERiGmvgQsaU4bVNn1faA1LHG7wKfh8wpyuu79+XVjtKIqtHk7zr9wrGfnk57eF3@lists.linux.dev
X-Gm-Message-State: AOJu0YyHrjB9/XfC8UUzE5lttu6QsyukVOvHf+EKCb75II3/P+CnkqRW
	fLVGw6/47ddowhiHOFCGCQzNSnIkySnPDDJU7ATJuUGgORxYIFD+qZdBFfoyDyRM7N0AmXgRnQd
	HomRpj1x44K/p9vM7jo1ZNhszZzK6wXs=
X-Gm-Gg: AfdE7cnXg0CpeoHiVI1C/+T+5GIKpg8m96/brNLv9Ce1MAn/2utScAVb3iDPM1jYXRl
	lFnykOXVljTF2D4WGiw6EKTPuKuqdPYkEHX8bPiamcy5M6yqLPQEZZXaFZvGDvkFgArSpeQ3XKY
	qfwjeXmX7VSHyE30Qx+ulwjIAtdNcz3bwqegH9CTomL0p0Z2keTmXBVwd9sFspQKNge4CO/kv+o
	ogUwQ7YGIYtMOnuKsKHVBBuHhgtk42usFR/fuuLTXdLOvxBolRItbiLZGjc00t7GkcnsdG1atar
	EWkt3OmgCQvDElZECo/Fyo2wANdHnjpnwJwBW10fGhJ46rnvC9NZ
X-Received: by 2002:a05:600c:6091:b0:492:418b:b5e1 with SMTP id
 5b1f17b1804b1-4925b392676mr120293395e9.37.1782323543090; Wed, 24 Jun 2026
 10:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624012132.1719941-1-joannelkoong@gmail.com> <ajt1g56cUmOMFJ7z@fedora.fritz.box>
In-Reply-To: <ajt1g56cUmOMFJ7z@fedora.fritz.box>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 24 Jun 2026 10:52:11 -0700
X-Gm-Features: AVVi8CdyFYa3jgdM4gH0h6YBI05GnvENCI7zmcZmpo8f0QmStexLme_ZXyRiEcg
Message-ID: <CAJnrk1aSaD3Ur3oHdsfdGw1-OSoNZjrVVXz9eB0ZFDrHBR0ssA@mail.gmail.com>
Subject: Re: [PATCH v1] fuse: enable large folios
To: Horst Birthelmer <horst@birthelmer.de>
Cc: miklos@szeredi.hu, jefflexu@linux.alibaba.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 11:16=E2=80=AFPM Horst Birthelmer <horst@birthelmer=
.de> wrote:
>
> On Tue, Jun 23, 2026 at 06:21:32PM -0700, Joanne Koong wrote:
> > Enable large folios, capping the max order at the largest request fuse
> > can issue, so a folio always fits within a single request. The order
> > range minimum is 0, so under memory pressure the allocator falls back t=
o
> > smaller folios.
> >
> > Benchmarks (libfuse passthrough_hp, buffered fio, single job, 4 GiB
> > file, medians, NUMA-pinned, performance governor, strictlimiting on by
> > default):
> >
> > tmpfs backing (page-cache bound):
> >   workload          bs      large folios off   on        delta
> >   seq read,  cold,  128k    3110 MiB/s    4514 MiB/s     +45%
> >   seq read,  cold,  1M      3079 MiB/s    5181 MiB/s     +68%
> >   seq read,  warm,  128k    2438 MiB/s    4486 MiB/s     +84%
> >   seq read,  warm,  1M      2403 MiB/s    5123 MiB/s    +113%
> >   writeback write, seq,128k 1211 MiB/s    1699 MiB/s     +40%
> >   writeback write, seq, 1M  1462 MiB/s    2208 MiB/s     +51%
> >   writeback write, rand,128k 1101 MiB/s   1757 MiB/s     +60% +
> >   writeback write, rand, 1M 1284 MiB/s    2228 MiB/s     +74% +
> >
> > xfs on NVMe backing (device bound for cold I/O):
> >   workload          bs      large folios off   on        delta
> >   seq read,  cold,  128k    2030 MiB/s    2172 MiB/s      +7% *
> >   seq read,  cold,  1M      1999 MiB/s    2181 MiB/s      +9% *
> >   seq read,  warm,  128k    2451 MiB/s    4939 MiB/s    +101%
> >   seq read,  warm,  1M      2340 MiB/s    5639 MiB/s    +141%
> >   writeback write, seq,128k  637 MiB/s     747 MiB/s     +17% *
> >   writeback write, seq, 1M   694 MiB/s     833 MiB/s     +20% *
> >   writeback write, rand,128k 1004 MiB/s   1648 MiB/s     +64% +
> >   writeback write, rand, 1M 1171 MiB/s    2055 MiB/s     +75% +
> >
>
> Hi Joanne,
>
> just out of curiosity, did you disable bdi strict limiting for this?

Hi Horst,

Those results are with strictlimiting on. After commit 494d2f508883
('fuse: use default writeback accounting') [1], I didn't see any
performance regressions anymore with large folios + strictlimiting on.
More information on why that commit fixed the issue is in [2].

When I ran the benchmarks last week with strictlimiting off, I saw roughly:
    tmpfs:
      seq,  128k    1174 -> 1648 MiB/s    +40%
      seq,  1M      1261 -> 1845 MiB/s    +46%
      rand, 128k    1148 -> 1638 MiB/s    +43%
      rand, 1M      1273 -> 2065 MiB/s    +62%

    xfs on NVMe:
      seq,  128k     621 ->  740 MiB/s    +19%
      seq,  1M       649 ->  776 MiB/s    +20%
      rand, 128k    1020 -> 1515 MiB/s    +49%
      rand, 1M      1125 -> 1895 MiB/s    +68%

Strict limiting on actually had better performance here, which I think
is because with the small dirty limit, the dirtying and the writeback
happen in parallel instead of more dirty pages accumulating and then
writeback getting kicked off. Because the backing device is so fast,
it didn't cost throughput for the dirtying and the writeback to happen
concurrently. The benchmarks were run with fsync, so everything had to
be flushed before the fio run returned. If the backing device was slow
and writes were bursty and fsync wasn't enforced, I think there'd
probably be better performance with strictlimiting off than on, since
the writer would be throttled to the speed of the backing device with
strictlimtiing on.

> In my tests esapcially the large writes run into throttling pretty
> fast, so that it effectively writes pagewise, which was not the target
> of the test.

Are you seeing this on your system with strictlimiting on or off? Is
that with commit 494d2f508883 in your tree? What test and server were
you running? Do you know what the speed of the backing device is?

Thanks,
Joanne

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/fs/fuse/file.c?id=3D494d2f508883a6e5c4530e5c6b3c8b2bbfb7318d
[2] https://lore.kernel.org/linux-fsdevel/CAJnrk1ZSaNRr-HWw-hbo2=3DLmbZiNGZ=
veb0MwxZbPtBDFgg2icQ@mail.gmail.com/
