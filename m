Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A652C331222
	for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 20:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782418724; cv=pass; b=V+3ZxHQ4M7p0bzOAbuTEjN8VYPgOJ/ufmISLUyuJtZao67GoKZeY+i06hdRIPpsnQ8R8LwqBJlnyAb+4koGSNAsUudBDtmCPMoLrUQ1XCnR6YA3hMM56z17/Bi6NP+vxqjoHhnte1zuZJ8QHFeooUaz08R+j68DOhRjNFL57tt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782418724; c=relaxed/simple;
	bh=x9avTffLrI21oy95GVV8JcBoBHMgEN/n5TWzHWPpDXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZpeF3JDSt9SvGFZKxv+F0UhBzSLg47lqjRZ1K5+pf7E66jzss2gEmg2fK9SczQ+D+w18/ebLfrhx3APDsPWMHxnJZoOU0Rh2RgcqrDYP1CRdDo9NOw+E+QGJIaK6W0lafznBW3pOx+I+DyJFwCXkaS5qY1yp4gb0vDz2HuahAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXdsGmlX; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXdsGmlX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49241a577d8so1950905e9.3
        for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 13:18:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782418721; cv=none;
        d=google.com; s=arc-20260327;
        b=jQgGrijLzxt5VvKBVbKVofPXNRARIv3Y07NIdj5u5hgVCI7FC0h/5/fsp1/RSWXh/l
         tfgZghwXNCVt4qzeg0fa9esKH74TmyjQ03+fmNG5Cs1iz6ohgg15FW5GLeBAJmxpANnE
         IULvkpPLKIor1Nzr3ci4vR2aL45TNqdFGB1pMcmvYRdCAgFZGtaafbezrxrj0QfZOVaT
         ylEhEMZwWx0KT9RwIWFPZbBQ3dXYg1lo22+Q1M4EIdazEs3u9bp1Z/npCtiqaO4wznOn
         o+VpAKYnxHvjI2Yhe5DODIF/RY3gipwkK/Ag6HNBqx8NBr92qeIxznl6QzoI2tdQdYYG
         tZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Bx8wJvcJMZq7a5fPBGwa2mbCCVF5r27xvpr0NzpD3c=;
        fh=RuFyG15vxBE4J4hq3b+J1BiMVf48IRUFWZNfI36t9so=;
        b=ZLuhFAooLAohTOyUgCZVxqooN0447LIippt5xkNMQzEzyQz4xFttKKsiqyl7dwK1n/
         oHcL3Fah/c/l/njMixWAMTq9ARSKnil3iwKIiJFYgoCsyWhcXSaGCf0eiUdyNnNIAnkb
         2g0fStJpBbYZsjsfGxdzkTKoy1kr7qsqgTQE1rNBSdpQQvEhMiPC5QbymILj2bnUxqYL
         Hs6LDPna7L5S/eqCS8FKhaphkx2UuRp7vjB23liFMfTzoD873q3w1l8cxnAZMutmAFkP
         4g+OthIlp/CaAOMEw2QleP6KbAYepyjn4Pnl5hE9jVnMUmxxNpACpbleV4Ltrsr2SCdk
         GlPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782418721; x=1783023521; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Bx8wJvcJMZq7a5fPBGwa2mbCCVF5r27xvpr0NzpD3c=;
        b=JXdsGmlXMZN0D4sT4tIvGR6Nz5SYafRVtOXs7m0968SozDnfGIDIc1/CDcWc3arv5T
         1yBifAWbOKBBIjMN4q//x2kkJijcVwGyq/n0GdVa9zFzEBT+8n4crpgkmbOXz+4OhYaE
         7sEk9YgG7cyQwf6RhVxgxn3YOJ8kkMkAyuWIn2Mo8N+5YPRPo0CzmtRemcfYfb/10lSQ
         3TAESQx9mwAmTmZl2CgTDLd2bYP4xBQhOdalXsq59xZ1mNFk7GRWzFZVtRgWBSI4XmQh
         0MgD+k8Rjsh8BCckBgAMF9dNSfsbEDWnfqKCGEnUhdheruqOlgr36AhA8Gj+lTUayyNC
         qlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782418721; x=1783023521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Bx8wJvcJMZq7a5fPBGwa2mbCCVF5r27xvpr0NzpD3c=;
        b=rhdYJVtssNc609uIOCSt6FQEL0rKYO9FfdwlX9z6SCSAyXeeBfqvfISOiH3pxVVn3T
         Wak0ZVe96/0HBvhNW9+FfFQxzKmQOQ9TZCUJsZsGO/RXNRjSrkPk3VWDhqzBBdt6eu39
         Ut509BJav8tDzuTxIZJtXvOBtqKwccPLcmg90clHnjjh6Dd922Y97vFZJ7+PIQLlJfKd
         mORktP9+aGMRWuqLehAV1cavT9lJlgdIRHqI2HpLzQNv7rCFJMVz1PuiOo1c3ALzfrQH
         MXLiUAoGw8mK4hsYAPCTN3WMwO8vz3toKIlg6D/u+On+D7QDoopkdXzeD7QYM/1ZBkZN
         vIUg==
X-Forwarded-Encrypted: i=1; AFNElJ/u2Gyc9+oYTpaJz21eOGyTj3239IQzi/LL00/W+Q8u53yRl2t49jFgdCnhgGMlTXfAAWW4ICvECP3E@lists.linux.dev
X-Gm-Message-State: AOJu0YyxshwSiW4Zf7MlBERtcTvWmPQPhAqiuc+SwjkZuqy3yOrIlD0H
	ht5ggiFcZnox0V2GPCB8QoE/N6vVVECbCIH4BTpl52DCBDJRwzxCkTFxGSv68aqXe7H7mWun4Q+
	mXH8hwifY2vinDhuVLS6cPiJyoiU4dMo=
X-Gm-Gg: AfdE7cnmRSSBoRpHAYZXPV+G5fZlOT3Ivf3Zk0kmdEDYTJZZKfcjjVV4dGjbZ3r8o4h
	NfVocg7fA0RO2SrlVCY0Sumuf9IuikpzI1zUfBNA3yaYLKwzBgmYD5ocIlHrIdadhW1URuMX6PX
	1fgadNc7IYutgRKz504qzQ4NMEKNPT2dI/xjHPDhT98g3f0v+VJ1mlkxpwjEQHSTn6GCtl+/8no
	yyI2rLj3h443pVehEZXulKfiaMFCtGQwdYDhpMXiwWiEaLgJu3PCmEpfvwQm3jrGDtLAvm9gPgn
	mAl75Gl8SJb1LfWkh4WMYsF+SltkmyQCjDlWeTpJHIi2y5H4BJ03
X-Received: by 2002:a05:600c:a12:b0:490:6237:5200 with SMTP id
 5b1f17b1804b1-49266847fdemr58175685e9.10.1782418720783; Thu, 25 Jun 2026
 13:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624012132.1719941-1-joannelkoong@gmail.com>
 <ajt1g56cUmOMFJ7z@fedora.fritz.box> <CAJnrk1aSaD3Ur3oHdsfdGw1-OSoNZjrVVXz9eB0ZFDrHBR0ssA@mail.gmail.com>
 <ajzTpMB0BZ4TY0Np@fedora.fritz.box> <CAJnrk1Z934KuBg22KpERD++g1Tk_Z_LL_kouuoi9uA=1Yj7vkQ@mail.gmail.com>
 <aj2MU2xKMg4Nlp2L@fedora.fritz.box>
In-Reply-To: <aj2MU2xKMg4Nlp2L@fedora.fritz.box>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 25 Jun 2026 13:18:28 -0700
X-Gm-Features: AVVi8Cefi_FFOXUsjZivd5jPHKKMvsJ-UZYRgB02B0GgF4qRlRHPw3Q0lNpBbHk
Message-ID: <CAJnrk1ZMZvuL8+a856G1s7925tNiBV8GaOc6c0r5-QskCKn4bQ@mail.gmail.com>
Subject: Re: Re: Re: [PATCH v1] fuse: enable large folios
To: Horst Birthelmer <horst@birthelmer.de>
Cc: miklos@szeredi.hu, jefflexu@linux.alibaba.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 1:16=E2=80=AFPM Horst Birthelmer <horst@birthelmer.=
de> wrote:
>
> On Thu, Jun 25, 2026 at 11:37:23AM -0700, Joanne Koong wrote:
> > On Thu, Jun 25, 2026 at 12:17=E2=80=AFAM Horst Birthelmer <horst@birthe=
lmer.de> wrote:
> > >
> > > On Wed, Jun 24, 2026 at 10:52:11AM -0700, Joanne Koong wrote:
> > > > On Tue, Jun 23, 2026 at 11:16=E2=80=AFPM Horst Birthelmer <horst@bi=
rthelmer.de> wrote:
> > > > >
> > > > > On Tue, Jun 23, 2026 at 06:21:32PM -0700, Joanne Koong wrote:
> > > > > > Enable large folios, capping the max order at the largest reque=
st fuse
> > > > > > can issue, so a folio always fits within a single request. The =
order
> > > > > > range minimum is 0, so under memory pressure the allocator fall=
s back to
> > > > > > smaller folios.
> > > > > >
> > > > > > Benchmarks (libfuse passthrough_hp, buffered fio, single job, 4=
 GiB
> > > > > > file, medians, NUMA-pinned, performance governor, strictlimitin=
g on by
> > > > > > default):
> > > > > >
> > > > > > tmpfs backing (page-cache bound):
> > > > > >   workload          bs      large folios off   on        delta
> > > > > >   seq read,  cold,  128k    3110 MiB/s    4514 MiB/s     +45%
> > > > > >   seq read,  cold,  1M      3079 MiB/s    5181 MiB/s     +68%
> > > > > >   seq read,  warm,  128k    2438 MiB/s    4486 MiB/s     +84%
> > > > > >   seq read,  warm,  1M      2403 MiB/s    5123 MiB/s    +113%
> > > > > >   writeback write, seq,128k 1211 MiB/s    1699 MiB/s     +40%
> > > > > >   writeback write, seq, 1M  1462 MiB/s    2208 MiB/s     +51%
> > > > > >   writeback write, rand,128k 1101 MiB/s   1757 MiB/s     +60% +
> > > > > >   writeback write, rand, 1M 1284 MiB/s    2228 MiB/s     +74% +
> > > > > >
> > > > > > xfs on NVMe backing (device bound for cold I/O):
> > > > > >   workload          bs      large folios off   on        delta
> > > > > >   seq read,  cold,  128k    2030 MiB/s    2172 MiB/s      +7% *
> > > > > >   seq read,  cold,  1M      1999 MiB/s    2181 MiB/s      +9% *
> > > > > >   seq read,  warm,  128k    2451 MiB/s    4939 MiB/s    +101%
> > > > > >   seq read,  warm,  1M      2340 MiB/s    5639 MiB/s    +141%
> > > > > >   writeback write, seq,128k  637 MiB/s     747 MiB/s     +17% *
> > > > > >   writeback write, seq, 1M   694 MiB/s     833 MiB/s     +20% *
> > > > > >   writeback write, rand,128k 1004 MiB/s   1648 MiB/s     +64% +
> > > > > >   writeback write, rand, 1M 1171 MiB/s    2055 MiB/s     +75% +
> > > > > >
> > > > >
> > > > > Hi Joanne,
> > > > >
> > > > > just out of curiosity, did you disable bdi strict limiting for th=
is?
> > > >
> > > > Hi Horst,
> > > >
> > > > Those results are with strictlimiting on. After commit 494d2f508883
> > > > ('fuse: use default writeback accounting') [1], I didn't see any
> > > > performance regressions anymore with large folios + strictlimiting =
on.
> > > > More information on why that commit fixed the issue is in [2].
> > > >
> > > > When I ran the benchmarks last week with strictlimiting off, I saw =
roughly:
> > > >     tmpfs:
> > > >       seq,  128k    1174 -> 1648 MiB/s    +40%
> > > >       seq,  1M      1261 -> 1845 MiB/s    +46%
> > > >       rand, 128k    1148 -> 1638 MiB/s    +43%
> > > >       rand, 1M      1273 -> 2065 MiB/s    +62%
> > > >
> > > >     xfs on NVMe:
> > > >       seq,  128k     621 ->  740 MiB/s    +19%
> > > >       seq,  1M       649 ->  776 MiB/s    +20%
> > > >       rand, 128k    1020 -> 1515 MiB/s    +49%
> > > >       rand, 1M      1125 -> 1895 MiB/s    +68%
> > > >
> > > > Strict limiting on actually had better performance here, which I th=
ink
> > > > is because with the small dirty limit, the dirtying and the writeba=
ck
> > > > happen in parallel instead of more dirty pages accumulating and the=
n
> > > > writeback getting kicked off. Because the backing device is so fast=
,
> > > > it didn't cost throughput for the dirtying and the writeback to hap=
pen
> > > > concurrently. The benchmarks were run with fsync, so everything had=
 to
> > > > be flushed before the fio run returned. If the backing device was s=
low
> > > > and writes were bursty and fsync wasn't enforced, I think there'd
> > > > probably be better performance with strictlimiting off than on, sin=
ce
> > > > the writer would be throttled to the speed of the backing device wi=
th
> > > > strictlimtiing on.
> > > >
> > > > > In my tests esapcially the large writes run into throttling prett=
y
> > > > > fast, so that it effectively writes pagewise, which was not the t=
arget
> > > > > of the test.
> > > >
> > > > Are you seeing this on your system with strictlimiting on or off? I=
s
> > > > that with commit 494d2f508883 in your tree? What test and server we=
re
> > > > you running? Do you know what the speed of the backing device is?
> > >
> > > Without your patch I see that when I enable strict limiting most
> >
> > Which patch are you referring to? The patch that turns on large folios
> > or the patch that fixes the writeback accounting? Are you seeing this
> > with large folios off or on?
>
> Large folios enabled and fuse own accounting, so your patch that removes
> the own accounting not applied.
>

With the accounting fix applied, do you still see the issue?

Thanks,
Joanne
