Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934E32609EE
	for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 04:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782275664; cv=none; b=u9Skbr8dij1YHdSiVFha3ueDL6xK0mQdZVJ4u4clKLtekGyWfq4jS5VEcA9xpOiDhzmK4F9xoVEirY3wMh6ZSB7m7ORifTQ6TFtgEPzyFV6eDD2AGc98iwhIFLEoMxDOt+eZ1OD6nN6mwKIPlZNh5TIQ7ktBUpoc4MgxMiycLc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782275664; c=relaxed/simple;
	bh=YFFLjroEP5txOMdNfY16OYotn9+o8MkV8Vu7960APsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fxiy4LaI7LHAf1CXfEmESFrjeI7nwWbVYdjgXf/mkAYH2k7Bq4atrOCmBHqh6B2t/q0uu7jJ+i62b30ltUxtkj3roQ4OkGWZRnCGg+yXMTuC8m39h+VBYVz/OyGEPBWMotCPttd5hxgL4iutAuJff0J9SXwY5BPVwPswINvBiLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZbEkzJsQ; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZbEkzJsQ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1782275658; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Yzm/Dz7fPFu/hZeJesVex0oCNJgXvodlhQOo2h7VpuA=;
	b=ZbEkzJsQJI/WqAdEbu/yv5QCKi3X3ncazfRZXP/5QvcUVwcDtmONdQ1PYvlpuFJcb6Xqa4VAutAHalRtEzLdTR+UIylre03cHllSQoe4mrEAgPcWgz/lQ4BrsO/xFxh5wBHuror+42CN5uMY7GEbK4cJYXz4T12dwD2HT0tL/+I=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R391e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=jefflexu@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0X5WOYGY_1782275657;
Received: from 30.120.78.16(mailfrom:jefflexu@linux.alibaba.com fp:SMTPD_---0X5WOYGY_1782275657 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 24 Jun 2026 12:34:17 +0800
Message-ID: <d60d03ff-a1dd-4dff-abe7-d1a35583fcba@linux.alibaba.com>
Date: Wed, 24 Jun 2026 12:34:16 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] fuse: enable large folios
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu
Cc: horst@birthelmer.de, fuse-devel@lists.linux.dev
References: <20260624012132.1719941-1-joannelkoong@gmail.com>
Content-Language: en-US
From: Jingbo Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <20260624012132.1719941-1-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/26 9:21 AM, Joanne Koong wrote:
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
> (*) device-bandwidth bound. Not much throughput gain but system cpu
> utilization was roughly halved
> (+) random write was tested as an overwrite of a hot region (under
> writeback, this is page-cache bound, so the gain comes from lower
> per-folio cpu overhead rather than higher backing-device throughput)
> 
> Random reads (4k and 128k) and writethrough writes were neutral with
> no regression (no read-modify-write or read-amplification penalty from
> large folios)
> 
> More information about the benchmark setup and results are in
> https://github.com/joannekoong/linux/commits/fuse_large_folios_benchmarks/
> 
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
> This has a dependency on the iomap uptodate helpers that were submitted to
> Christian's vfs tree [1]. If it's easier to route this patch through
> Christian's tree, I can resubmit this.
> 
> [1] https://lore.kernel.org/linux-fsdevel/20260623202843.2064992-1-joannelkoong@gmail.com/
> 
>  fs/fuse/file.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index cb8da4c06d17..3c9be6d8ede1 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -3136,4 +3136,14 @@ void fuse_init_file_inode(struct inode *inode, unsigned int flags)
>  
>  	if (IS_ENABLED(CONFIG_FUSE_DAX))
>  		fuse_dax_inode_init(inode, flags);
> +
> +	if (!FUSE_IS_DAX(inode)) {
> +		unsigned int max_pages = min(min(fc->max_write,
> +						 fc->max_read) >> PAGE_SHIFT,
> +					     fc->max_pages);
> +
> +		if (max_pages)
> +			mapping_set_folio_order_range(inode->i_mapping, 0,
> +						      ilog2(max_pages));
> +	}
>  }

mapping_set_folio_order_range(..., 0, 0) seems harmless even when
max_pages is 0.

Anyway

Reviewed-by: Jingbo Xu \<jefflexu@linux.alibaba.com\>



-- 
Thanks,
Jingbo

