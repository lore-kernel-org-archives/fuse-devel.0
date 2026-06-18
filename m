Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12A33612EC
	for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769132; cv=none; b=EFzncvRb6B/b8N0RyLieY7upsqdP3OTo9No2jrLreOw7iICZ/Cq3lZEXoWHRrsbCj55r628bDMfEF6AQPumn2z53d+QNI2UUZkG3FCGbeAdBIRZCJsUrtvJt2XOpIpv8GxUbpMMLPumy7kvuhtaEq47LO19O71OtkmSk/gx7zYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769132; c=relaxed/simple;
	bh=M7PkXJq+z7n97S0HTdsYBQaGP1txw0zNR3/utiuHRMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7iDx3e8o2OFbzWQc2apAhHVSDU4If+/BCXXzS74ZyAgs7yN0PRV1UcD8YHKRKZj1mNzvHQryTqEU0SRadaWAqzyM4GY73PSTyUyOq1wocQZQ5gg9LnZmKEJN9EBlGBCBM96nkGxUgE2fCwUw6JOpWwIknIItbkSjl//5LSXy/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=MMBZewwj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DZoyJRWH; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="MMBZewwj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DZoyJRWH"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id A0C33EC02D3;
	Thu, 18 Jun 2026 03:52:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 18 Jun 2026 03:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781769129;
	 x=1781855529; bh=mZ04y6mP2975WK8AkDomQ88+tS6Bucm8Een2W/mKSmk=; b=
	MMBZewwjrijjrKsGFqgyaGqVN5PjrzT6e+Jm5xaJdcoXXYa80rD6QXttshbZ6cAK
	s05QTKSauFyj2/8vlWeiMm6+/gxC5pb7NV/pKQpxJYmpYLIJHsVjcwgGrAFmD6wJ
	GRWzYYona0D+5AzQbV6/ntTqod1TylgAOZledyJwBo089SCI9Nw5TG6QhNIPBBXx
	0mWLw5Lvla1dsYfU4+UizuMqkJIz8D5qkLEkT1cdGJ1E5kbLaGO5k7BUmiIpeqaA
	UsqCrGkJf/mFsA+fOxF3b0CYCYFLRFf0AzFkE7vIyDuLVuz2vDuGiE6S5trNg6Cp
	PWCoiaJpldtxACzZEkuUlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781769129; x=
	1781855529; bh=mZ04y6mP2975WK8AkDomQ88+tS6Bucm8Een2W/mKSmk=; b=D
	ZoyJRWHjk6rDJ8PnnU/fWBJ6fSi1JMKeub/59aKYkk7JikCg+27e9ZZ0WMMSRtvM
	7fmpTuh9hb+tc7uTMoOZl1tfb+JsgVUbg1fs4AO9i8NfBTEnJX+J9uTioEDp8ZrY
	ogMqGHV2kDa5APwZNK3IhJOcVZ7hrxPbMVW6qYjSX/rYKXWiy+uWpI5Ip6h51xm9
	YeonAE1g7An53ZMBLmh4tqrd+cAN+BWb78N36SG7poDgrH07yJfe0oxZxBuFgk34
	1rdisJD5Y1GsSWS7wDdRs4vFFTOnD5gjiZO45WTVZKy/IDJ6JwpfILpP2Zho5ntK
	5SZeJ83e7pMUWykL30ebQ==
X-ME-Sender: <xms:qKMzanC-JNLM1LmxozZf4yjI9mETQ69LexWPA_eS_g-ICzsjs_nUsA>
    <xme:qKMzam0l6w9kRYXkVLD65wXcQGzrlSIWcs_jQr1hurQkYcyFXc5-MrCdbEsnFs2xI
    fc_-_iWkZ10QrXM33B8FR3KqZOn8HnBdSNQuqP1we-W4Z8QebeA>
X-ME-Received: <xmr:qKMzap2ssHdJO1f3Jehi9GFqdcXb48ErVEnxTycJd3Nd14p5zMz9K269tFa1CjJP8AJr9rsXC2mUQPlQguBErMZsaZaBj-ICPODuFIb20Kgzi06pxw>
X-ME-Proxy-Cause: dmFkZTG1SYZHYD6sckEKAIzKM75vAg8EWwhTIDUrDu5Z9N/p0akmZKDdaOJJKMNhJKIDRy
    htK8areh64hgbabF7c6gb2q+sA1R3f4AJLKNBXhTP630/L87p4ewR958iT2Ay2hO0bOz6o
    rckYn8jGmnsgy33Ewup0A+yFkf5HYUX4pEyTKZXCCqo9SvzvdJQAPy8pNLdTKEqXEiFS5x
    xjzpmyeYD/265SeJa2zq5pK85LeCjTiTNCOKZfia6Z8qKog24VMEnB+uskpzxXZ1hx8BkX
    pARjqEPrBXhWbxY+T6u38CIQqpFamBYW3+A+EZHq+JUq+WZ4W7umcU1Yy25eOZT5XdC9V9
    84pSSjjvlmmPyBByOv7nl79E4iXJmxE7JhESuoe/TdXA7NGkApcDFUoUdvAwyzJLHRfw9E
    nZKZW0IprSz9+js7eiayhczvZxN4EL9gLagG6AkKWuPZENmO4fRQ9e5Ddf7UjgFYH3nLv1
    8CU4/ZRYPM9iIXummBAgIOCEt/hesvVmmrFaoXs2f13Nd6ik3NloaPBf3pbU8yLlwZldul
    B33/HAy90X/oHflNWEZuqqmMw4+AAT9Gej10E1ib+ki1pMS7ntu6bvRVgZuBtDF3yzzAnQ
    umrBEPiTYt+wBthVeiLOtvoPLngGsMJv496M+yJFMllvvNEuUqv4MVzbWM7A
X-ME-Proxy: <xmx:qKMzarCrOoeG2fctDpiINEnD3nS180uB3_myZsDZhbn202LARRm0Lw>
    <xmx:qKMzao6wgz5QHY9MNnPv1YvDVIC47EEH4mQHEfnVurOUPG5Y54MQ7Q>
    <xmx:qKMzasLEZ9RYRB14BblexufHxg0mGwozqYFcvi4Ks5WD5pKIZ536CQ>
    <xmx:qKMzapvuEDUlbjNyeJCZIZySydr0mTePOKRa9KaxXS9CVARBk8MEOA>
    <xmx:qaMzapi1Lk9BeiMz497OJbAQS3glWpMH2JiiYx5UpiAIGibqiryK_k3t>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Jun 2026 03:52:07 -0400 (EDT)
Message-ID: <9f0d2b87-ce5d-4c27-b041-dacc5f449efe@bsbernd.com>
Date: Thu, 18 Jun 2026 09:52:05 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev,
 axboe@kernel.dk, jlayton@kernel.org, libaokun@linux.alibaba.com
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com>
 <CAJfpegsWpKE4kUUQo+NK_cu6oy6h6+A1M=xokvSQbFtZzu9UKQ@mail.gmail.com>
 <CAJnrk1b1nVFZ8dQYA=iGn-p182HNhhRfZEVe-e_ks_daZAU3Rw@mail.gmail.com>
 <CAJfpegvNyqSS2h28-0sB2j2HUoMnKd7StMsPbvNPz67PiS9w9A@mail.gmail.com>
 <CAJnrk1bK-3tpZoeJQKPLjgpQW2F0YQKVhLeGwkN_5tpBVpZ-VQ@mail.gmail.com>
 <6d80e19c-00d0-49de-bd8b-7571a81b942d@bsbernd.com>
 <CAJnrk1bRL+Nk6mDrZyKsymLLGopzL39OQ7on1oDkxcA9zeUYCA@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1bRL+Nk6mDrZyKsymLLGopzL39OQ7on1oDkxcA9zeUYCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/18/26 09:32, Joanne Koong wrote:
> On Wed, Jun 17, 2026 at 7:22 AM Bernd Schubert <bernd@bsbernd.com> wrote:
>>
>> On 6/17/26 14:49, Joanne Koong wrote:
>>> On Tue, Jun 16, 2026 at 6:26 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>>>
>>>> On Tue, 16 Jun 2026 at 07:28, Joanne Koong <joannelkoong@gmail.com> wrote:
>>>>>
>>>>> On Mon, Jun 15, 2026 at 4:41 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>>>>>
>>>>>> On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> wrote:
>>>>>>
>>>>>>> To use this, the server must set the FUSE_URING_BUFPOOL flag during
>>>>>>> registration and provide the payload buffer pool through the iovec
>>>>>>> payload in the first sqe.
>>>>>>
>>>>>> I find this interface inconsistent.   Decoupling the buffer(s) from
>>>>>> the seq's means that the registration should be decoupled as well, no?
>>>>>
>>>>> Looking at Bernd's reduced queue series [1], I think we'd most likely
>>>>> want to also pass in the number of reduced queues separate from sqe
>>>>> registration. I think along the lines of the config sqe Bernd brought
>>>>> up, it seems cleanest to add a new cmd op
>>>>> (FUSE_IO_URING_CMD_QUEUE_SETUP) where queue-level settings (eg flags,
>>>>> number of queues, bufpool, etc) gets passed in.
>>>>
>>>> Why not a separate op for bufpool registration, so it can be done
>>>> independently of the setup, possibly at some later time?
>>>
>>> I'm not really convinced there's a compelling use case for needing
>>> multiple bufpools in one queue. This was the discussion with Bernd in
>>> [1] about this. In my opinion, incremental buffer consumption and
>>> allowing different queues to support different payload sizes would
>>> address the use cases of multiple bufpools within one queue, but would
>>> be simpler.
>>
>> To be honest, I have no idea how to implement queues with different IO
>> sizes. What would be the logic to select a queue? And what is if we
> 
> With the separation between non-IO queues and IO-queues, I think we
> could just look at the request type, and dispatch accordingly so that
> the metadata ops go to the non-io queues and the read/write ops go to
> the io queues. I think the dispatch logic would be otherwise the same
> for choosing which particular queue within the non-io or io queues.
> 
>> start with an single max-IO buf and a single queue (per numa) and then
>> scale up based on need? Let's say we have:
>>
>> Start 1 queue (per numa maybe), one max payload buf in that queue and
>> allow to scale up to max nr CPUs for the cpu to queue-id mapping. But
>> now additionally we get for the same CPU
>>
>> - multiple queues of the same buf size
>> - multiple queues of different buf sizes
>>
> 
> I'm not seeing why this would be an issue. For multiple queues of the
> same buffer size, it would just be normal queue selection and for
> different buffer sizes, we'd jjust have two pools of queues (non-io
> and io) and select based on request type first which pool then apply
> normal queue selection within that pool. I think if a server has needs
> for multiple categories of buffer sizes beyond just non-io vs io,
> having multiple bufpools per queue makes more sense than dedicated
> queues to the specific categories of the different buffer sizes, but I
> doubt this level of granularity would be needed.

I'm pretty much lost. It is a 3 dimensional matrix, made of cpus,
buffer-size and buffers. I really want to see a logic how you figured
which queue has free buffers.

> 
>>
>> Also, every queue has its own ring, syscall aggregation is not given
>> anymore.
> 
> Syscall aggregation still applies within each ring, but I don't think
> sysclal aggregation is really a big factor given that libfuse and the
> server handles requests as they arrive and respond as soon as the
> request is handled, instead of batching multiple responses before
> submitting; on the dispatch side, requests are sent one by one as they
> come in rather than batched, so there's no aggregation to lose.

Depends, if fuse server starts with 1 buffer per queue and slowly scales
up, you basically get exactly one buffer per queue. That is the end of
aggregation.


Thanks,
Bernd

