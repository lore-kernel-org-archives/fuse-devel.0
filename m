Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D864D2BDC13
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 14:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784297655; cv=none; b=O8vl0pnQ80Qv3gXypSFkKAc4fedQkuX4w23ax+ShlQzOmCxpRAptv5UynSFPB50gI/6aX0dTt3Xerl6cp2sVrl73ZA+yP6DU3cJ0E3tX3Cej77T6oZr9kL9+Yq2YHOg98NK375nhI0mrxUfn+pUF0ta/FnbhzoRVOm0wE20usFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784297655; c=relaxed/simple;
	bh=t2FQLnaWMNJc9R/KcghHsB/QBRVmHzghXRoeftW30AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RE5x5xXWzMRv3krXxMsCmIAleIFY86aNI1jRPVLtaUhE2sJ/GpgvVCWxkV0XgPxTyf4zZllYKQfvtsqLAETRSk/N0D2FeEtK9dfKpSl2aDivo2LhK4SxUlpOtDU4NzdQGai4+h1ohk/mx5LVD4hmRIVcElYlmJDWxQIpHnheGAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=LH2McQu2; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="LH2McQu2"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784297642; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=f4l5MDz9ihaJZNN0KLM2AOE1D3UUaWDaG4FFY3kz6T8=;
	b=LH2McQu2bUyQwDKwC0tmLZxijUOKM1MWq31TAQffTLr0iSVJ9CAngsZ5SUYffiPA9NTkb23jRQkiDt1Khoqn0eC8T3SwdHoH8YIVibQFV43N1jvAFUuLayoCucS84IWIeDZaYULJ73JotqM9bvmYL4qyNaLTyZNwUFQeuELMgew=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R741e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=jefflexu@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0X7HToDZ_1784297640;
Received: from 30.42.141.94(mailfrom:jefflexu@linux.alibaba.com fp:SMTPD_---0X7HToDZ_1784297640 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 17 Jul 2026 22:14:01 +0800
Message-ID: <efd2adbd-b642-428c-aa7d-29c70af99e51@linux.alibaba.com>
Date: Fri, 17 Jul 2026 22:14:00 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fuse: don't bump attr_version for async direct read
 completion
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260706082931.99288-1-jefflexu@linux.alibaba.com>
 <CAJfpegvqdRQDDd6io2an5mBU=3Lkp23aHDa-ETN3EWVotu29WQ@mail.gmail.com>
Content-Language: en-US
From: Jingbo Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <CAJfpegvqdRQDDd6io2an5mBU=3Lkp23aHDa-ETN3EWVotu29WQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/17/26 9:58 PM, Miklos Szeredi wrote:
> On Mon, 6 Jul 2026 at 10:29, Jingbo Xu <jefflexu@linux.alibaba.com> wrote:
>>
>> The attr_version counter should only be incremented when cached
>> attributes are actually modified (as documented in commit 1fb69e781729
>> ("fuse: fix race between getattr and write")).  Async direct reads do not
>> modify any cached inode attributes (size, mtime, ctime), so bumping
>> attr_version in fuse_aio_complete() for reads is incorrect.
>>
>> This unconditional bump causes a livelock when auto_inval_data is
>> enabled together with writeback_cache: fuse_cache_read_iter() issues a
>> FUSE_GETATTR before every read, but by the time the response arrives,
>> an async DIO read completion has already incremented fi->attr_version
>> past the snapshot taken before the request.  The GETATTR result is then
>> discarded (attr_version race), fi->i_time is never refreshed, and every
>> subsequent read triggers yet another GETATTR -- creating an infinite
>> loop of useless round-trips.
>>
>> Fix this by only bumping attr_version for write completions, consistent
>> with the synchronous DIO write path (fuse_write_update_attr) and the
>> cached write path.
>>
>> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
> 
> Can you please add a Fixes: tag and possibly Cc: stable@... if appropriate?


Sure. Will send v2 soon.

-- 
Thanks,
Jingbo

