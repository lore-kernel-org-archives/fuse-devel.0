Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1226438B146
	for <fuse-devel@lists.linux.dev>; Mon,  1 Jun 2026 20:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347191; cv=none; b=mF7b9ZEO+pfnLoSAC9lGS8peDkkcxPdmDjUOJi3OfDIkWaGozIy7KGIeHSGfgp+1WhKTOzpECLdLITSgK7hCG4pw3+d+aip8yylP/l+QKfI6osncJy/7ZEm1kqcfc2txLmkz8MBNym8TKLU60/CK7itdc4BpIB2xr70in4AMgsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347191; c=relaxed/simple;
	bh=9dazxZCVirbacEZ+pfOE0nj9mMjhEZjUgJJFQZ2TfpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwbDN42tlAfaxuWbnNFi5j+D9A/KIGhviL3eDFA0PCRbHBq8PO0tB6liRj1MgcaTd3xP0hDM/ZpRoj9VNPVpWDguADvIVGe0BV85g/j7YobJHiiWRl3aZuQ7CXiXl0xtv7yd8hqwgWKIRoeX9iyUqg9yPYn6r/yZO7YMHzM3lxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=14amoMXo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y4XqhgaW; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="14amoMXo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y4XqhgaW"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0E8731400179;
	Mon,  1 Jun 2026 16:53:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 01 Jun 2026 16:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780347188;
	 x=1780433588; bh=c5wDIwsAGuOtikd8fc0LKPhJTaoCjueNIl0wlp9e2HY=; b=
	14amoMXo50ZZk6C2X3djyBz9z8+3kbcZAGsNwxOEbdVjWebwJim+8Cm/Z+ZP0lo2
	tSBW4bNL3vYgiMlM59AZuIVdotXs2xxfdJmVyJ+1eikEcv9m/ZXKSQ1aaHfHOkvX
	5pEqhjEJybMKcqtz0+FQBfGHGyy1R1g1z19yRJF3EpDqbkbIovgrhSBgF3WePq+2
	xuX1cq6AlCvF4mbMO8VicZVpR81Mpp9StUFahNVYb5HGQMqkObFK3/m/KPPYJOYp
	lIgpwi+TfRrI2JfPREjUf4uLTq3b0vAIxjxIwY+vmBfF8l8whKZ+wNwpp0tgOqeA
	IWfiODt+DQpwSvLrr3nGlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780347188; x=
	1780433588; bh=c5wDIwsAGuOtikd8fc0LKPhJTaoCjueNIl0wlp9e2HY=; b=Y
	4XqhgaWuegJjQMa1V3CjgA1oxxYVEOekDIgA+AXn+6tRBLv6fXpYr6e5xOC2LUyC
	eoJi+OZAyghOI6MTFiZOz4yV8V1reGNvSmFyaPJ3wKhJIAwR4bq7ZDIO2MLlxHUa
	sQV1vi3sLxs2QaJyjh41JhtioKc6/Rat1cu/62MNTl9nXsOz9iSv9VKy63ThgBCZ
	e4YNjbw6n+6pYu7E3YumSdCsDj5ag8H4b+QTiO10u0BkMD+EnOpDWl9Vd7+krktJ
	MPiBve71fGLNUydMLi8HnbhbSumZonqMwBSjVx1AY3ZYiZu6L14QZQMQ/GQmBawW
	DwgDBT4+kXIQG+iANlULQ==
X-ME-Sender: <xms:M_EdauDv5h9r66wsplLBBl9A5kIiSYIGrljdIf6vo50cgIn7lpZOfw>
    <xme:M_EdavZIhI6JQ0HiMRkyYj4opU6k6mDp6NTM5A3UFNSvcJViJAOlrCF4VTpLMZhFS
    OE0cYx899xV_psy8duNLOyvrGfATtv6SkDbhai8TRWI0zNocHTU>
X-ME-Received: <xmr:M_Edap6nusF1Yc6m4c8czgzn92JseiuziBd-ikJ-KgNWMPPX6W1oTyvAvxiD0jVq6avdCxfvPeOb4t3JnYPBlpcGO2taaDsUQmjkZR6eKIz5fBuY6w>
X-ME-Proxy-Cause: dmFkZTE/LCy5Hj4dGLzGYDZatmJl8qPh9+rF/DIrtcDwvIGX87p+Us8FJlTT9Hln8VBCrL
    sOfxXenOOh1bbdvNQ1wRRsse7J2/T46pINRjB/fOAN59ROVazR4KNKeKcWNXDRbUhe2+Ge
    x7DqNj18OE8xsWXjJLGlsG7aacGj6xdPS3KR+EDyM3dax10V25lPIvenn5i8ncvb1lL5Pr
    qBbOs7Cqv1tPWoU06zoZPdNrCJTs+3qVhKYOcJggmOjrvvteIFarXbL22tUDczmWWF0MCZ
    9Gs+vfZJf2h3MDgtpaF/gdj86Ke9reAisWPRLHwOreskzmLtcDXh45qR15bC8jtXKzaqgi
    Xh7MNtFPRezYUfUrDMjvQIKxZarpVQ8IkINVm9M+1fE9zU87p5PLGWGCvpj04xBibWtjEn
    Wipo2AUrt+6+DqTKYNnwrAwf0ONNN2h6jBASkGbSzlXTFS4KzzanqtsmuunzEUog4YbVzR
    o6/lcIVIUUQpPKMVWlBgWow9xMWGN3s5QtPmQab+E+Fwy0zY7cGE/IjtcwPeGUkMgxBLFV
    zK2LEF94z9bp439RXHNx17LIxKwxvOOUIL560UIhSk2FspOYWjsI1Q+2xle5F4ShJCAhxd
    QOm7mV489RLpWH/gzd1b8dzvuZHnyNUAfd/nrZIe3CZeKq5191NiRu369AOg
X-ME-Proxy: <xmx:M_EdaoZ8Wj7m4ov9SUIKQMg81jw5n2w48A68UdRA30R26yNPgmP9iw>
    <xmx:M_EdaggmBQ2AI0PrrbI6Uh9xCFNxT04h1vUb0v1D_k-D41rx8v8xAw>
    <xmx:M_Edah-7uC43BGyt4l7ZoEuEB-jYDXC8eLhbBV735_QmFxTD1wvKSA>
    <xmx:M_EdajrOkpWRoD-4Ysd2Sw0ma0nXO6Mlpd4F5O-rApx00MvgDZsqPg>
    <xmx:NPEdao5kz39oFUvpS5WqhCdSzKPTC8NzaXXacpyM4ZM1R8bbp85WoM3C>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Jun 2026 16:53:06 -0400 (EDT)
Message-ID: <6ecc45f5-4bce-4af2-bfe4-36c69e624b01@bsbernd.com>
Date: Mon, 1 Jun 2026 22:53:05 +0200
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
 <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com>
 <aeb9c03a-0330-4e41-ad33-b884f00691a0@bsbernd.com>
 <CAJnrk1YPeeCSsQFjaFNROYcOdBO-kTovOTDkCigNKRt57JREJQ@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1YPeeCSsQFjaFNROYcOdBO-kTovOTDkCigNKRt57JREJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/1/26 22:19, Joanne Koong wrote:
> On Fri, May 29, 2026 at 2:27 PM Bernd Schubert <bernd@bsbernd.com> wrote:
>>
>>
>>
>> On 5/29/26 18:32, Joanne Koong wrote:
>>> On Fri, May 22, 2026 at 1:59 PM Joanne Koong <joannelkoong@gmail.com> wrote:
>>>>
>>>> This series adds buffer pools (implemented internally as a buffer ring) and
>>>> zero-copy to fuse io-uring.
>>>>
>>>> Prior to this series, ents and buffers are tightly coupled where each entry
>>>> has its own dedicated payload buffer, requiring N buffers for N entries where
>>>> each buffer must be large enough to accomodate the maximum payload size. This
>>>> is suboptimal as most request types require vastly less bytes than the maximum
>>>> payload size and some requests do not require payload buffers at all.
>>>>
>>>> This series allows servers to pass in a buffer pool (internally managed as a
>>>> buffer ring) that the kernel will use for servicing ents/requests. This
>>>> decoupling reduces the memory usage requirements needed to use fuse-io-uring.
>>>> It allows for future optimizations such as incremental buffer consumption and
>>>> supporting multiple buffer sizes per ring.
>>>>
>>>> This series also allows servers to use io-uring registered buffers as the
>>>> buffer pool which eliminates the overhead of pinning/unpinning user pages and
>>>> translating virtual addreses per i/o request.
>>>>
>>>> This series additionally adds zero copy to fuse io-uring. The server can
>>>> directly access client pages or page cache folios without copying data through
>>>> an intermediary buffer. This requires CAP_SYS_ADMIN privileges and using
>>>> registered buffers.
>>>>
>>>> This series has a dependency on io-uring registered bvec buffers changes
>>>> in [1].
>>>>
>>>> The throughput improvements from registered buffers and zero-copy depends on
>>>> how much of the server's per-request latency is spent on data copying vs
>>>> backing I/O. When backing I/O dominates, the saved memcpy is a negligible
>>>> fraction of overall latency. Please also note that for the server to
>>>> read/write into the zero-copied pages, the read/write must go through io-uring
>>>> as an IORING_OP_READ_FIXED / IORING_OP_WRITE_FIXED operation. If the
>>>> server's backing I/O is instantaneous (eg served from cache), the
>>>> overhead of the additional io_uring operation may negate the savings
>>>> from eliminating the memcpy.
>>>>
>>>> In benchmarks using passthrough_hp on a high-performance NVMe-backed
>>>> system, using registered buffers showed around a 10% throughput improvement
>>>> for direct randreads (~2150 MiB/s to ~2400 MiB/s), a 4% improvement for direct
>>>> sequential reads (~2510 MiB/s to ~2620 MiB/s), a 8% improvement for buffered
>>>> randreads (~2100 MiB/s to ~2280 MiB/s), and a 6% improvement for buffered
>>>> sequential reads (~2500 MiB/s to ~2670 MiB/s).
>>>>
>>>> Zero-copy showed around a 35% throughput improvement for direct
>>>> randreads (~2150 MiB/s to ~2900 MiB/s), a 15% improvement for direct
>>>> sequential reads (~2510 MiB/s to ~2900 MiB/s), a 15% improvement for
>>>> buffered randreads (~2100 MiB/s to ~2470 MiB/s), and a 10% improvement
>>>> for buffered sequential reads (~2500 MiB/s to ~2750 MiB/s). I didn't see
>>>> enough of a clear improvement for writes due to write latency being I/O
>>>> dominated.
>>>>
>>>> The benchmarks were run using:
>>>>   fio --name=test_run --ioengine=sync --rw=rand{read,write} --bs=1M
>>>>   --size=1G --numjobs=2 --ramp_time=30 --group_reporting=1
>>>>
>>>> The libfuse changes can be found in [2]. To test the server, run:
>>>> sudo ~/libfuse/build/example/passthrough_hp ~/src ~/mounts/tmp
>>>> --nopassthrough -o io_uring_zero_copy -o io_uring_q_depth=8
>>>> Once this series is merged, the libfuse changes will be tidied up and
>>>> submitted upstream.
>>>>
>>>> Thanks,
>>>> Joanne
>>>>
>>>> [1] https://lore.kernel.org/io-uring/20260402160929.2749744-1-joannelkoong@gmail.com/T/#t
>>>> [2] https://github.com/joannekoong/libfuse/commits/zero_copy_v3/
>>>>
>>>
>>> Miklos,
>>>
>>> This series has stalled on an architectural question and I'd
>>> appreciate your input on the direction.
>>>
>>> Background:
>>> In fuse io-uring, entries are reusable communication slots between the
>>> kernel and the daemon. When a request needs to be sent from the kernel
>>> to the daemon, it is assigned to an available entry. The entry carries
>>> the request to userspace, and the response comes back through the same
>>> entry. The number of entries determines how many requests can be
>>> serviced concurrently. Currently, when the daemon registers an entry
>>> during fuse io-uring setup, it passes in a payload buffer (sized to
>>> the maximum payload, typically 1 MiB) alongside it. The buffer is tied
>>> to the entry for the lifetime of the connection.
>>>
>>> Problem that needs to be solved:
>>> Most request types (lookup, getattr, open, etc) require far less than
>>> the maximum payload size, and some (flush, fsync, etc) require no
>>> payload buffer at all. Every entry reserves a full 1 MiB buffer
>>> regardless of actual need. On systems with many entries, this memory
>>> cost scales linearly - for example, 64 entries across 8 queues
>>> requires 512 MiB of payload buffers alone.
>>>
>>> Approach A:
>>> Decouple entries from payload buffers. Entries become generic - any
>>> entry can use any buffer from the pool. At setup time, the daemon
>>> passes in a contiguous pool of memory, and the kernel dynamically
>>> selects and recycles buffers from this pool as entries are assigned
>>> requests. Entries servicing requests with no payloads consume no
>>> buffer, and the pool can have fewer buffers than entries. This
>>> supports adding multi-size buffers and incremental buffer consumption
>>> (multiple entries using non-overlapping regions of the same buffer
>>> concurrently) as optimizations in the future.
>>>
>>> Approach B:
>>> Keep the 1:1 entry-buffer coupling, but allow entries to be registered
>>> with different payload buffer sizes at setup time. The daemon would
>>> register entries with smaller buffers for metadata-heavy workloads and
>>> larger buffers for data-heavy ones. This keeps the existing model of
>>> passing in a payload buffer during entry registration at setup time
>>> and requires no uapi additions. Each entry registration adds buffer
>>> capacity whereas with buffer pools, buffer capacity would have to be
>>> added as a separate pool.
>>>
>>> I want to make sure I'm representing both approaches fairly - Bernd,
>>> please correct anything I've gotten wrong.
>>
>> I think for B "at setup time" is not entirely correct - buffers in the
>> current model buffers and entries can be registered at run time.
>>
>>
>> I have been thinking about approach C, which I think is in between A and B.
>> I my mind approach C does the registration per entry, but payload
>> buffers get added to a buf array, if a payload is set.
>> Max array size would be negotiated as in your approach or maybe better
>> with a config SQE. Different IO size could achieved by multiple buf arrays.
> 
> Ok, so it looks like we agree that entries should be decoupled from
> buffers. Now it looks like the remaining disagreement is how the
> buffers get passed in.

Well let's say, I don't see what speaks against decoupling it. The
memory saving effect is due to the special form of different request
sizes (0 and max payload).

> 
> I still think it's simpler and cleaner to pass in the buffers as a
> contiguous pool upfront instead of passing in each buffer
> individually.

My issue with this approach is still the same, incrementally registering
memory when one needs it is hard. Example, I have a few external SSDs
that are connected most of the time, but I only need them every few
days. Why would I need to spend memory for the fuse transport all the
time? The ideal situation would be: libfuse detects heavy usage and
registers more entries and buffers.
Current fuse kernel supports it. I just didn't get to it to implement
dynamic registration in libfuse yet - a matter of time.
Missing is some form of kernel unregister, although easy to add, if
unregister is treated as request OP.

With a contiguous buffer pool I wouldn't know how to register on demand
and unregistering is even harder.

Also, if we still have races during register phase, doing it on demand
wouldn't change anything in the current scheme - either the race is
there or it is not, because current scheme is dynamic registration from
kernel point of view.


No we need to keep that old scheme one way or the other, but we could
deprecate one form and avoid adding new features (like different buffer
sizes). However, if buffer pools have a limited usability, once needs to
do those features for both approaches.

> 
> Miklos, what are your thoughts?

Just a short reminder that it was actually Miklos to request the dynamic
registration way. Initially it was all static, taken from the ublk tag
model. Making it dynamic added some headache, but in the end I also
noticed that it can be useful.


Thanks,
Bernd


