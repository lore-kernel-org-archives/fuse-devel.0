Received: from smtp05-ext.udag.de (smtp05-ext.udag.de [62.146.106.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922AD171CD
	for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371844; cv=none; b=NAatOvUtQ9LusQMCRb6baR5dX4PaY6bEvnw1TnmRbeWKlz3KYYdT9EVvGj/Ru177EK3LniPhTstQDDtP3eUIfc3qwA+jGMD8FK9nzz50PJZ9Kam1fTeO4LUiGIudXVtvzdJVpIGRtMauihY+8iBKY/UA3ORp+3pT8MNtBcREofY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371844; c=relaxed/simple;
	bh=TjT2GMwUKgRarQ1yKO8qygyEQgWm5UTiNL4r9v/T/mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S359i4ZLy+wSRXoXqRMMN2Js4oC/UBM9V/AzLlfX3F3IH7B+iZz1jEP4sqAIjK9XmURXfX+tfZ6kFk8GaMy5PJEwoYZSALhD8nCJbJ4SgnaxHiroIb7Ssdm9dsF+hxHoPe2pzlE5ZbkZ0NnWU4l6ujmT0B57VW3aWRhTl9tFPe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (024-062-210-188.ip-addr.inexio.net [188.210.62.24])
	by smtp05-ext.udag.de (Postfix) with ESMTPA id 5D986E01A6;
	Thu, 25 Jun 2026 09:17:14 +0200 (CEST)
Authentication-Results: smtp05-ext.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Thu, 25 Jun 2026 09:17:12 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, jefflexu@linux.alibaba.com, 
	fuse-devel@lists.linux.dev
Subject: Re: Re: [PATCH v1] fuse: enable large folios
Message-ID: <ajzTpMB0BZ4TY0Np@fedora.fritz.box>
References: <20260624012132.1719941-1-joannelkoong@gmail.com>
 <ajt1g56cUmOMFJ7z@fedora.fritz.box>
 <CAJnrk1aSaD3Ur3oHdsfdGw1-OSoNZjrVVXz9eB0ZFDrHBR0ssA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJnrk1aSaD3Ur3oHdsfdGw1-OSoNZjrVVXz9eB0ZFDrHBR0ssA@mail.gmail.com>

On Wed, Jun 24, 2026 at 10:52:11AM -0700, Joanne Koong wrote:
> On Tue, Jun 23, 2026 at 11:16 PM Horst Birthelmer <horst@birthelmer.de> wrote:
> >
> > On Tue, Jun 23, 2026 at 06:21:32PM -0700, Joanne Koong wrote:
> > > Enable large folios, capping the max order at the largest request fuse
> > > can issue, so a folio always fits within a single request. The order
> > > range minimum is 0, so under memory pressure the allocator falls back to
> > > smaller folios.
> > >
> > > Benchmarks (libfuse passthrough_hp, buffered fio, single job, 4 GiB
> > > file, medians, NUMA-pinned, performance governor, strictlimiting on by
> > > default):
> > >
> > > tmpfs backing (page-cache bound):
> > >   workload          bs      large folios off   on        delta
> > >   seq read,  cold,  128k    3110 MiB/s    4514 MiB/s     +45%
> > >   seq read,  cold,  1M      3079 MiB/s    5181 MiB/s     +68%
> > >   seq read,  warm,  128k    2438 MiB/s    4486 MiB/s     +84%
> > >   seq read,  warm,  1M      2403 MiB/s    5123 MiB/s    +113%
> > >   writeback write, seq,128k 1211 MiB/s    1699 MiB/s     +40%
> > >   writeback write, seq, 1M  1462 MiB/s    2208 MiB/s     +51%
> > >   writeback write, rand,128k 1101 MiB/s   1757 MiB/s     +60% +
> > >   writeback write, rand, 1M 1284 MiB/s    2228 MiB/s     +74% +
> > >
> > > xfs on NVMe backing (device bound for cold I/O):
> > >   workload          bs      large folios off   on        delta
> > >   seq read,  cold,  128k    2030 MiB/s    2172 MiB/s      +7% *
> > >   seq read,  cold,  1M      1999 MiB/s    2181 MiB/s      +9% *
> > >   seq read,  warm,  128k    2451 MiB/s    4939 MiB/s    +101%
> > >   seq read,  warm,  1M      2340 MiB/s    5639 MiB/s    +141%
> > >   writeback write, seq,128k  637 MiB/s     747 MiB/s     +17% *
> > >   writeback write, seq, 1M   694 MiB/s     833 MiB/s     +20% *
> > >   writeback write, rand,128k 1004 MiB/s   1648 MiB/s     +64% +
> > >   writeback write, rand, 1M 1171 MiB/s    2055 MiB/s     +75% +
> > >
> >
> > Hi Joanne,
> >
> > just out of curiosity, did you disable bdi strict limiting for this?
> 
> Hi Horst,
> 
> Those results are with strictlimiting on. After commit 494d2f508883
> ('fuse: use default writeback accounting') [1], I didn't see any
> performance regressions anymore with large folios + strictlimiting on.
> More information on why that commit fixed the issue is in [2].
> 
> When I ran the benchmarks last week with strictlimiting off, I saw roughly:
>     tmpfs:
>       seq,  128k    1174 -> 1648 MiB/s    +40%
>       seq,  1M      1261 -> 1845 MiB/s    +46%
>       rand, 128k    1148 -> 1638 MiB/s    +43%
>       rand, 1M      1273 -> 2065 MiB/s    +62%
> 
>     xfs on NVMe:
>       seq,  128k     621 ->  740 MiB/s    +19%
>       seq,  1M       649 ->  776 MiB/s    +20%
>       rand, 128k    1020 -> 1515 MiB/s    +49%
>       rand, 1M      1125 -> 1895 MiB/s    +68%
> 
> Strict limiting on actually had better performance here, which I think
> is because with the small dirty limit, the dirtying and the writeback
> happen in parallel instead of more dirty pages accumulating and then
> writeback getting kicked off. Because the backing device is so fast,
> it didn't cost throughput for the dirtying and the writeback to happen
> concurrently. The benchmarks were run with fsync, so everything had to
> be flushed before the fio run returned. If the backing device was slow
> and writes were bursty and fsync wasn't enforced, I think there'd
> probably be better performance with strictlimiting off than on, since
> the writer would be throttled to the speed of the backing device with
> strictlimtiing on.
> 
> > In my tests esapcially the large writes run into throttling pretty
> > fast, so that it effectively writes pagewise, which was not the target
> > of the test.
> 
> Are you seeing this on your system with strictlimiting on or off? Is
> that with commit 494d2f508883 in your tree? What test and server were
> you running? Do you know what the speed of the backing device is?

Without your patch I see that when I enable strict limiting most 
FUSE_WRITE requests in the fuse server are 4k. With it disabled the 
writes are triggered with larger sizes.
Since bdi min_ratio is 0 by default I just assumed that as soon as the
cache gets over the limit a write with that page is triggered.

I am not that familiar with the page cache code, so I can't point to
the exact culprit where writing of the dirty page is triggered.

> 
> Thanks,
> Joanne
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/fs/fuse/file.c?id=494d2f508883a6e5c4530e5c6b3c8b2bbfb7318d
> [2] https://lore.kernel.org/linux-fsdevel/CAJnrk1ZSaNRr-HWw-hbo2=LmbZiNGZveb0MwxZbPtBDFgg2icQ@mail.gmail.com/
> 

Thanks,
Horst
