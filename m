Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A17B3FD15E
	for <fuse-devel@lists.linux.dev>; Tue, 26 May 2026 16:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814623; cv=none; b=CpDqO6/M0VNJXqjQHrCwaRj+olCF2QdGK3HvW7qsUegZK1fajDCcL8YBeEve2fQ45K8lXHQ2/RNTebtVZgcMBZCle+Vdc5CtET142XOcb29xb1h4lbiKPTI1LboOkmI6sXOFQbJkxJqK/ZdyORbv/LdOO059gSS9DAWzTg9MDmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814623; c=relaxed/simple;
	bh=12r4rCSVqzMsYGH2nPcQRIXyOIp2rtcVncCVgk9+a/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cy0N2H9h/4+yWYaYGy/hm0WJsp/Mts6bPXeWPatcrGFsuMat8mN0EUXue2VQbytzkpISnDKC8xMxf/g2gtcWlz/55oSckdEgac5CMfIAjT1sCDoVcF18xARpRRVosBC8WWEZcpAug1PV31v53i2dh+QX3XDC8himccsEVAASOBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=lGDSs6lf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TDWQlCwh; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="lGDSs6lf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TDWQlCwh"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 2C2961D000F1;
	Tue, 26 May 2026 12:57:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 26 May 2026 12:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779814619;
	 x=1779901019; bh=7eQ5gRCc/Gy8EWHx1uT8zk+rm4/oRkYpABoeZ4C+OnY=; b=
	lGDSs6lfl3hu66zlvy6ci8CJo37ke8fWVf5cXFc92PQndUQDnJgTH+4StIFCOmhl
	yaLZjE/q3llKxuSevcOcqoYmwpdiJuOnHYVZMOgY2VKLX9MbRoeKU7SqBOmhYVRd
	yCCL5QneWPCyqVYMaa0K+BWzoaYKLfqljsk6SqbaDUabv0+zyw9wbBFFV+JNxalt
	Rg9yVwdPOp+Df+xnCN7aRzUChtm2wlxoKGoVIfk3ZzoPzWHAfnXr+0+6x5vB8ykN
	v+ZRdGPHRH2d8166CjZKc3QGpZF88TZyBs/4CgsZe6XAI7/Hmd+vp49pN8TA3bTK
	MIXNXDhiTVlEsZ3I/6rFBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779814619; x=
	1779901019; bh=7eQ5gRCc/Gy8EWHx1uT8zk+rm4/oRkYpABoeZ4C+OnY=; b=T
	DWQlCwh/vKMJ8PjWSW4q8tLbuZD/LCgtpQii49EgMRLBk2GFoq/4sc6plF2vP7Ev
	wSGz43wlbz9KqMhHOTQSHaS1qsbgHUM4jYHxNw/iItXehMmkXEO1T9BU1FpJ9SXY
	ktlyjY9KDdAFfhrsrW33XtHwtiOP+rrl/LYf0WuKbddvxhv1+DE77aGA9sBVTbvu
	qQemOXyNN8Wcdb/ji7T2guPQ4UNAX9rM7vx3IJG0sLZXkL5zaXRG//oM0ECO2BFM
	9xRWjtOSLH/xTxe+vJBKOPa689K5wYOiBvSvXHtUIpN2Zflx5m76wdjQAT/18OW+
	th+dpgyI6XOXf98rUMFpQ==
X-ME-Sender: <xms:29AVarJS3DH66nNO26JlfpHOI-6dbF_XoiNauXa5KZirnziEJTlXZg>
    <xme:29AVamAIYOBTtwwjdbHW1XDxfiIZIVXNQL-0LPV2YOLCVdgXn2mUT-72hqJN9NtmI
    iIeIwQEGWeSSD5Q1pN7poM7JNlWReb6NVygLUshYOuG7gaC4tJg>
X-ME-Received: <xmr:29AVasBj_Gu-bajpGHTBjqQZZWonuf03R83FzXxezwWQeDIdXG1RClBcABdueR7UFuoXc5amd7C5izHG5jYIMMYVkpNe5TDNTnor_ooBNyBmCajYug>
X-ME-Proxy-Cause: dmFkZTErObtaS32b1ui/t5UM5G7pGGSs6aD/hkiiJ5U2PsZDUsUGf2gPVYUnDtF4zlumei
    35BsTuN+orNF9wyLIg6ChVlb6f1MwQP4DIMAWXmChqzXZ2FKgkJ6zTI6dyR+Kn2LgCd8hK
    P+pVLt75D9qdh1KvpDdnM6289DxIMAfbkU10LoGags4WD0WB5+O2Ntd4aPL0fSsnyAYGCS
    powXIKmN904IK2P/bg1JUaEMseh9d82a96v7XkHkHB6Z6JgJr61IjSYiOM8xIhVblAVV5C
    JxY0IE+WJGfNzwQhPwBFXppprzo1nCIE0kVdhVlWYBP8E9HcCH2gik5nPkfXlA4YOogBW8
    0tbO2KDAki9ulCm8eyne1lxDn8hW7krLBVsk15J99v2LWAyJ0xsoMm29SYtMjLZQIW/whc
    5qqt5R4y1taI+k70GVbkiXAYZbyB0Nbe9EfZvYzsJCfp8KbwGoWCbJJdiBWSEjlUYuqq3D
    7xxZnYlMpFkhl46Y1kf/OkeQ2Bb0r9Bb6fEVULkEVEtCkeVy3P4MmBojvI0fXphRgsv2D8
    jGqigymsKC/a5qp5V47T2GfBRRFDcCT6MEsKwww36hDSiRvWoKtmKWne+kPNT1MHC50EWa
    3lv/Aa22P+5s91yf47upvFRqlw6lCfDW8MrFfVcjINRabwOW8FjBheF9J+9Q
X-ME-Proxy: <xmx:29AVagAjtrbnNu89UinS0GQIkt_MxLTonWTbB7I7NO2y08XNHvLcCw>
    <xmx:29AVavqjFOgDXxt0wbsZMKofaTLAYUoiS47WaBVquJtQ-zBLpqsl9w>
    <xmx:29AVainHkFZpYsH9ynBdIpt_E3aiqGEfAUvbJialiifyKFdgBmVvFg>
    <xmx:29AVanzqmGxZip5irGD317oHlDgbVCOQz5XMSsaBtDcKw4xvQxsJnA>
    <xmx:29AVatjbiSqMC_f43e55rQo4faYiABv1SgeGa66Gd0a7oUg3LLmh0Lk_>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 May 2026 12:56:58 -0400 (EDT)
Message-ID: <eac49567-cb04-47a9-be90-5126aa6a4820@bsbernd.com>
Date: Tue, 26 May 2026 18:56:57 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, axboe@kernel.dk,
 fuse-devel@lists.linux.dev
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1aV1Z0wBQ=ViTKEsojrVkqaNnpRHiBOqFLRL+QtS2gMPA@mail.gmail.com>
 <1c3ef92a-d3b4-47fc-9d34-9c996b8eb0c7@bsbernd.com>
 <CAJnrk1bOyoUD74byw3ZXWzQ3dAiZObE0V46+=rtkPG8-3vqUEg@mail.gmail.com>
 <55b80c43-2e84-4a42-b383-108f06254b6a@bsbernd.com>
 <CAJnrk1Zby7T4WMShk+d8QdVoqtAFLSotc9_d0RbGKSnP4fXq9A@mail.gmail.com>
 <1e952be4-6fe1-42c3-a691-114613f2120a@bsbernd.com>
 <CAJnrk1YKUET6gQoM-S=NdwmyefNbbso+Z+DsokDiGp-8=PPgKA@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1YKUET6gQoM-S=NdwmyefNbbso+Z+DsokDiGp-8=PPgKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/26/26 18:01, Joanne Koong wrote:
> On Sat, May 23, 2026 at 10:08 AM Bernd Schubert <bernd@bsbernd.com> wrote:
>>
>>
>> On 5/23/26 01:08, Joanne Koong wrote:
>>> On Fri, May 22, 2026 at 3:49 PM Bernd Schubert <bernd@bsbernd.com> wrote:
>>>>
>>>> On 5/23/26 00:38, Joanne Koong wrote:
>>>>> On Fri, May 22, 2026 at 2:51 PM Bernd Schubert <bernd@bsbernd.com> wrote:
>>>>>>
>>>>>> One piece I had been pondering a bit about, though did not dive into the
>>>>>> code yet.
>>>>>> What is if payload would be registered per ring entry (as without your
>>>>>> changes) and just the header would become a buffer ring (so that could
>>>>>
>>>>> I think payload buffers must be decoupled from ring entries if we want
>>>>> to reduce memory usage in the non-zero-copy path.
>>>>>
>>>>>> be pinned that way without loosing one page per entry)?  For zero-copy
>>>>>
>>>>> For the header pinning changes in my branch, the headers are one
>>>>> contiguous region (not per-entry), which circumvents having to
>>>>> allocate one page per entry.
>>>>>
>>>>>> we could register entries without a payload? Advantage here would be
>>>>>> that that header buffer would determine max number of entries, only
>>>>>> little memory would be needed for over-subscribed entries, but entries
>>>>>> themselves could be registered dynamically on demand.
>>>>>
>>>>> For zero-copy, entries still may have payloads (though the buffers
>>>>> will definitely not need to be as big as the max payload size!),
>>>>> either for the non-zero-copyable args or if the request's args aren't
>>>>> page-backed. Unfortunately I think many servers may not be able to use
>>>>> zero-copy due to the CAP_SYS_ADMIN requirements, so I think it'd be
>>>>> ideal to minimize the memory consumption needed for the non-zero-copy
>>>>> path, through the buffer pool for the payload buffers.
>>>>
>>>> Well, my problem is still why would we need to register ring entries if
>>>> they don't have buffers - why not just register less ring entries then.
>>>
>>> Entries may be used for servicing requests even if there are less
>>> buffers than the number of entries. Most requests don't use the full
>>> payload buffer size, so for example with incremental buffer
>>
>> I think that is an argument for multi-size bufs per ring.
> 
> Which is what the buffer pool provides (decoupling buffers from
> entries) if we choose to later add that in the future. With 1:1
> entry:buffer mapping, each entry requires a buffer that supports the
> max payload size at registration time.

Let's discuss further below, I would really like to see a design
discussion how we make that generic for different IO sizes.

> 
>>
>>> consumption, this would allow multiple entries to use non-overlapping
>>> regions of the same buffer concurrently. As well, if we want to
>>> support multiple buffer sizes per ring, there shouldn't be a 1:1
>>> mapping between ents and buffers. There's also some requests that
>>
>> I can counter argue that fuse-server can just send ring entries with a
>> different payload sizes - fuse-server could dynamically create as many
>> ring entries of the right size as needed.
> 
> I don't think this is a good idea. The server would have to
> guesstimate this as it doesn't know the request size until it sees the
> request. The server could speculatively pre-register ring ents ahead

How expensive (in terms of memory) usage it is to set up a few small
buffers? Compared to one large buffer?

> of time but there's no guarantee that would be the right size for the
> ring entry either. And once added, if the workload pattern changes,
> then the ent and allocated buffer may not be useful anymore. This also
> adds (imo needless) complexity to the kernel side. Additionally, the
> dynamic ring ents would in the ideal case have payload buffers pinned,
> which there is not an non-messy way to do (for buffer pools, the pool
> buffer pinning goes through io-uring registered buffers infrastructure
> prior to being passed to fuse at registration time). Imo the better
> way if you wanted to dynamically add ents would be to add a new buffer
> pool to the ring.

I think the whole point here is that a few small payload sizes are
negligible to one single max payload.

> 
>>
>>> don't need to use payload buffers at all (eg flush, fsync, rmdir,
>>
>> Could be handled by multi buf sizes as well.
> 
> These requests don't require payload buffers.
> 
> This series already handles this case (eg not assigning a buffer from
> the pool to the request).

It handles exactly one additional case - zero payload size.

> 
>>
>>> etc).  As well for registered buffers / buffer pinning, it is more
>>> optimal for the buffer pool to be allocated contiguously and pinned
>>> contiguously rather than passed in one by one as a 1:1 entry:buffer
>>> mapping.
>>
>> I don't think how the buffer is passed to fuse-client/kernel matters for
>> (userspace) allocation. I had written before that libfuse's buffer
>> allocation is not ideal, I had it continuous in initial development,
>> then run into bug and for simplicity changed to per entry allocation.
>> Switching back to larger allocations is simple.
>> Regarding page mapping/pinning, why does it matter if the buffer in
>> kernel is known as per entry or per allocation (assuming payload buffers
>> are page aligned)?
> 
> It does matter how the buffers are passed to fuse for page pinning.
> Please take a look at patch 8 ([PATCH v3 08/10] fuse: support
> registered buffers as buffer pools in io-uring) [1]. The buffer pool
> is contiguously allocated and registered as an io-uring registered
> buffer, and then passed to fuse and by that point, the buffers have
> already been pinned by io-uring.
> 
> Even irrespective of page pinning, it would still be good to pass the
> buffers contiguously up front as a pool instead of per-ent, as the
> purpose of this series is to decouple the 1:1 entry:buffer mapping. Eg
> if the request an ent is servicing does not require buffers, a buffer
> should not be reserved for that ent, amongst other benefits of a
> decoupled mapping.
> 
> [1] https://lore.kernel.org/fuse-devel/20260522205823.1597313-9-joannelkoong@gmail.com/
> 
>>
>> I think the more important part for buf rings are pinned headers. For 4K
>> pages the loss is maybe still acceptable and the remaining size could be
>> used for small requests and I guess would have a perf benefit. For 64K
>> pages the loss is quite a lot.
> 
> That is orthogonal to this series. This series focuses on payload
> buffers, and header pinning is not part of this series as
> bufpools/bufrings do not need pinned headers, as it makes no
> difference for performance. As mentioned in the previous message, when
> I was working on a separate series for removing the dispatch overhead,
> I implemented header pinning as part of that, as that is when header
> pinning becomes actually useful.

Yes, header pinning is orthogonal, with the exception that ring entries
of different payload sizes provide the same feature as buffer pools and
with that buffer pools would not be a requirement anymore.

> 
>>
>>
>> Maybe let's summarize
>>
>> Bufrings
>> - Fixed size, allocated at startup, cannot be easily increased or decreased
>> - Allows 0 size payloads (FUSE requests that only need the header)
>>
>> Entries with payload
>> - Allows more flexible setup - fuse server _could_ (not implemented as
>> of now) create entries based on incoming IO.
>>
>> Neither provides real multi-size buffers per ring.
>>
> 
> I think perhaps there is a misunderstanding of the patches in this series.
> 
> This series implements buffer pools, which decouple the 1:1 mapping
> between ents and buffers that currently exists. Right now, ents and
> buffers are tightly coupled where each entry has its own dedicated
> payload buffer, requiring N buffers for N entries where each buffer
> must be large enough to accomodate the maximum payload size.
> 
> This series allows servers to pass in a buffer pool where the buffers
> are not statically mapped to an ent at registration time. This
> decoupling reduces the memory usage requirements needed to use
> fuse-io-uring. It is the necessary stepping stone for future
> optimizations such as incremental buffer consumption (allowing
> multiple entries to use non-overlapping regions of the same buffer
> concurrently) and supporting multi-size buffers per ring.

I just don't see "reduces the memory usage" - there are few op code that
do not need payload buffers. Do you see that exactly these op code
disturb your workflow and you do need additional entries/buffers for
those? I do see a lot of lookup/revalidate/getxattr, but not the op
codes without payload. Equally I see IO that does not max payload for a
lot of requests types - anything namespace related and reads/writes
below max payload size.

In the end, what I'm struggling with is that the "zero payload" is just
one special case of different IO sizes and the entire code and flow is
changed for this one special case, without a discussion forehand how to
handle the other cases. And that one special case comes up rarely in my
own testing and use cases.


Thanks,
Bernd
