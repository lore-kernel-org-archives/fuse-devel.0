Received: from smtp05-ext.udag.de (smtp05-ext.udag.de [62.146.106.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1241D204C3B
	for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 06:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782281819; cv=none; b=EJlQZvK7hWps5D5R8f5P+2mmxDNh0n/LOyR505wCsrpM9fZCHivXO9QnBo4hWYcTeyKiihTGmMnIxzz37HXSm84EGHcG/0/lZ8am1gOepUCzmx3GA1vUz/9ZsfNDgB97VboquT09FkIbEG/W9cA6/hWwv0J/0+qFZBmO203ltYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782281819; c=relaxed/simple;
	bh=fU/oCKgi2vYnfo2aamvqL8P1unlHO1aJwpHOCBrVm5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EydqDEg6KTOnbP03ZY1lZTdEBldGh2xk1QFQKs/45ufnVPe27Wl/+RMiH6p0g96p0BoRJY2WrL52KVTz/EQR0e8CmSAohEAXmkw8zHr2C2mDw0oDvJjXfbrhEtFKG3CFXL/k3WguqM8lr0wQYBpr158yOY94FYM/IzLhMwzjrxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (024-062-210-188.ip-addr.inexio.net [188.210.62.24])
	by smtp05-ext.udag.de (Postfix) with ESMTPA id F2D88E0428;
	Wed, 24 Jun 2026 08:10:54 +0200 (CEST)
Authentication-Results: smtp05-ext.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Wed, 24 Jun 2026 08:10:54 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Jingbo Xu <jefflexu@linux.alibaba.com>
Cc: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu, 
	fuse-devel@lists.linux.dev
Subject: Re: Re: [PATCH v1] fuse: enable large folios
Message-ID: <ajtzjpxWvc3FFRpj@fedora.fritz.box>
References: <20260624012132.1719941-1-joannelkoong@gmail.com>
 <d60d03ff-a1dd-4dff-abe7-d1a35583fcba@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d60d03ff-a1dd-4dff-abe7-d1a35583fcba@linux.alibaba.com>

On Wed, Jun 24, 2026 at 12:34:16PM +0800, Jingbo Xu wrote:
> 
> 
> On 6/24/26 9:21 AM, Joanne Koong wrote:
> > Enable large folios, capping the max order at the largest request fuse
> > can issue, so a folio always fits within a single request. The order
> > range minimum is 0, so under memory pressure the allocator falls back to
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
> > (*) device-bandwidth bound. Not much throughput gain but system cpu
> > utilization was roughly halved
> > (+) random write was tested as an overwrite of a hot region (under
> > writeback, this is page-cache bound, so the gain comes from lower
> > per-folio cpu overhead rather than higher backing-device throughput)
> > 
> > Random reads (4k and 128k) and writethrough writes were neutral with
> > no regression (no read-modify-write or read-amplification penalty from
> > large folios)
> > 
> > More information about the benchmark setup and results are in
> > https://github.com/joannekoong/linux/commits/fuse_large_folios_benchmarks/
> > 
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> > This has a dependency on the iomap uptodate helpers that were submitted to
> > Christian's vfs tree [1]. If it's easier to route this patch through
> > Christian's tree, I can resubmit this.
> > 
> > [1] https://lore.kernel.org/linux-fsdevel/20260623202843.2064992-1-joannelkoong@gmail.com/
> > 
> >  fs/fuse/file.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> > index cb8da4c06d17..3c9be6d8ede1 100644
> > --- a/fs/fuse/file.c
> > +++ b/fs/fuse/file.c
> > @@ -3136,4 +3136,14 @@ void fuse_init_file_inode(struct inode *inode, unsigned int flags)
> >  
> >  	if (IS_ENABLED(CONFIG_FUSE_DAX))
> >  		fuse_dax_inode_init(inode, flags);
> > +
> > +	if (!FUSE_IS_DAX(inode)) {
> > +		unsigned int max_pages = min(min(fc->max_write,
> > +						 fc->max_read) >> PAGE_SHIFT,
> > +					     fc->max_pages);
> > +
> > +		if (max_pages)
> > +			mapping_set_folio_order_range(inode->i_mapping, 0,
> > +						      ilog2(max_pages));
> > +	}
> >  }
> 
> mapping_set_folio_order_range(..., 0, 0) seems harmless even when
> max_pages is 0.
> 
> Anyway
> 
> Reviewed-by: Jingbo Xu \<jefflexu@linux.alibaba.com\>
> 

I was just about to suggest something like

mapping_set_folio_order_range(inode->i_mapping, 0,
			      ilog2(max_pages ?: 1));

but you are right, it's not a problem.
> 
> -- 
> Thanks,
> Jingbo
> 

This was actually one of the problems I ran into when I enabled large folios in linux 6.17.
Since it would create problems for readahead.

Reviewed-By: Horst Birthelmer <hbirthelmer@ddn.com>

---
Thanks,
Horst
