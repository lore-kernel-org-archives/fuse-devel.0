Received: from smtp01-ext2.udag.de (smtp01-ext2.udag.de [62.146.106.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E2431F991
	for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 06:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282114; cv=none; b=Apz0JV/h9sc+Pio4X0B79FSawfCpRFq5dpWSSSudxjr/Keri4FegWNoAHs1h6s9Kr2/MQ5jAhX7PasxS5uO9Pr99L2TewEg7IGLIAKKS4JcFtEA5kz67snekzwB3Dp4yUzZgabzFXeQMgz5DTHSv+ogxjw+QpbVMTqStuVnDkVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282114; c=relaxed/simple;
	bh=bfOSewc5WUFSFvaa84vQXlFjEO1sLlsWR+BTlmBrRTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+sOQlMYvpFmadSbSahlq4Wj7kqLQIdgZ3QLn4mNKrIYbHulhyxebOFkvYFJNGB4tGOypRrSPZxex7TEoxK98gjaPw3UGQFIYcIJLrhATYilpfJ4WRsiUVBB25gIn1upwHi8cQFp68OACJDSvLGtZMVMyaraOiDrXpl+c8MvUt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (024-062-210-188.ip-addr.inexio.net [188.210.62.24])
	by smtp01-ext2.udag.de (Postfix) with ESMTPA id AD3F9E0539;
	Wed, 24 Jun 2026 08:16:22 +0200 (CEST)
Authentication-Results: smtp01-ext2.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Wed, 24 Jun 2026 08:16:22 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, jefflexu@linux.alibaba.com, 
	fuse-devel@lists.linux.dev
Subject: Re: [PATCH v1] fuse: enable large folios
Message-ID: <ajt1g56cUmOMFJ7z@fedora.fritz.box>
References: <20260624012132.1719941-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624012132.1719941-1-joannelkoong@gmail.com>

On Tue, Jun 23, 2026 at 06:21:32PM -0700, Joanne Koong wrote:
> Enable large folios, capping the max order at the largest request fuse
> can issue, so a folio always fits within a single request. The order
> range minimum is 0, so under memory pressure the allocator falls back to
> smaller folios.
> 
> Benchmarks (libfuse passthrough_hp, buffered fio, single job, 4 GiB
> file, medians, NUMA-pinned, performance governor, strictlimiting on by
> default):
> 
> tmpfs backing (page-cache bound):
>   workload          bs      large folios off   on        delta
>   seq read,  cold,  128k    3110 MiB/s    4514 MiB/s     +45%
>   seq read,  cold,  1M      3079 MiB/s    5181 MiB/s     +68%
>   seq read,  warm,  128k    2438 MiB/s    4486 MiB/s     +84%
>   seq read,  warm,  1M      2403 MiB/s    5123 MiB/s    +113%
>   writeback write, seq,128k 1211 MiB/s    1699 MiB/s     +40%
>   writeback write, seq, 1M  1462 MiB/s    2208 MiB/s     +51%
>   writeback write, rand,128k 1101 MiB/s   1757 MiB/s     +60% +
>   writeback write, rand, 1M 1284 MiB/s    2228 MiB/s     +74% +
> 
> xfs on NVMe backing (device bound for cold I/O):
>   workload          bs      large folios off   on        delta
>   seq read,  cold,  128k    2030 MiB/s    2172 MiB/s      +7% *
>   seq read,  cold,  1M      1999 MiB/s    2181 MiB/s      +9% *
>   seq read,  warm,  128k    2451 MiB/s    4939 MiB/s    +101%
>   seq read,  warm,  1M      2340 MiB/s    5639 MiB/s    +141%
>   writeback write, seq,128k  637 MiB/s     747 MiB/s     +17% *
>   writeback write, seq, 1M   694 MiB/s     833 MiB/s     +20% *
>   writeback write, rand,128k 1004 MiB/s   1648 MiB/s     +64% +
>   writeback write, rand, 1M 1171 MiB/s    2055 MiB/s     +75% +
> 

Hi Joanne,

just out of curiosity, did you disable bdi strict limiting for this?
In my tests esapcially the large writes run into throttling pretty
fast, so that it effectively writes pagewise, which was not the target
of the test.

Thanks,
Horst
