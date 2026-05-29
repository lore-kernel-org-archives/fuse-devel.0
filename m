Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6563B47D7
	for <fuse-devel@lists.linux.dev>; Fri, 29 May 2026 21:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780090045; cv=none; b=tIJS5o7PIibJofu1Qi7j+kE4bWGIPVomeHXfgvruPkMfH6cT+t5dNZxgY1ADrCdAMkKbPNGWa7V8Y7WPfV+xirvfXroyjtnV2C9qQq0AVeiOMLAiugMMrUtJEmbDDaL+gb2ek4ekIz1ceSoTC1rXMePauMPk88eX9xDa/o8p5aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780090045; c=relaxed/simple;
	bh=9kk3uVR/GQBqacm6S8fkSphuYJDnUWJUpWx4tGzyq20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAMOKU0AyEvmC5BgRQiU3NfZeTTxC7YpnLW30wySPtzL91Kj3weLhfIJGC4dCKabZL/0Yl5zJH7qqJS2jGqH1efO9tj0HdzIUQ3YRLOjZyVF7t1FamgQo6aZa0eW4wgs2aV1GkNCpHwc4g0nxtBctOdareD1BXOiZtHJYcL0bDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=oe8eAQKg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H5I48BAC; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="oe8eAQKg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H5I48BAC"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2E1587A00A5;
	Fri, 29 May 2026 17:27:22 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 29 May 2026 17:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780090041;
	 x=1780176441; bh=MX85uwgTNLSJSmaM2cxfGDuMsup7/rA54C4zOzqPtZ4=; b=
	oe8eAQKgagYWr8Kx2uZSJAUlcXBbGyTW0gF+YYD1xxtOUlba5nH3AqU9MBC9JP8w
	DZrmtVjLlhMmTYo8zRVtL1o6E5s6CGbLyMjD8hyLeyi8QgPJMTdht3uCSY3zUpCo
	DsZ1/VIisQs3UnCfjuzu9t5/SACqDYc4H2UdWGNIfDVC8u9VzTB8B+69QiENegAu
	vrdWo+3HLyjA/q0xyOT89idNsVRlMfsR2bWbAZCX2dNFzBXM/2yJ8o81TL1bJIMX
	88TTDTQwSsx7xEexvIlIiGP7kDHf7ieI+34lGr+EUbOhPAvGnoC3RElXioy9JOBV
	JTr9nYE70Un2s3EbIJatlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780090041; x=
	1780176441; bh=MX85uwgTNLSJSmaM2cxfGDuMsup7/rA54C4zOzqPtZ4=; b=H
	5I48BACG6qqB3M32K9Xcd40n00Vjz5HNUkS6yXld9R9TBPdsCBdaQrZmY1CrD2lT
	q3JPWUsXMZl/463r2sXSKV1FeCn4t9h+mhxv1BjPINbyp9OuJj11Kz1qdSr5qkpT
	7dG33q8wUlrvr4GWJDGn+hjLq/fg8L8Q4lJJPigAsi3kpL/Di/4RbOau/DZ3ThqX
	p3RQXH2c3/2XaLrt0ibi/9y930eqFhJnObIKH2rYi6VyEzMJsOQnprqpUcVTw0DL
	y1Aq3pJq+eZ7poVzfG/Qho5YsSJueFoO+qpX18vvG+BFUxPQRdRPDcC+Ko+SY05b
	OQOjpG2fiMaITlXuj/npw==
X-ME-Sender: <xms:uQQaaq5GhaO0ZNxxwTEcLve47s-SB3i9wu2Wm_vozyfM5JTksuMvyA>
    <xme:uQQaaqxS1IR0lvKguEir7F4XlNtT4-9ZwmTuRhfTVPAwQA_zZ4fGDasxjAph3Faqk
    aQ2B_tP4IO9-AtW_EqlWAHheOx5C-jL0ALElQoHepdoUPKmmHOjhQ>
X-ME-Received: <xmr:uQQaahxOUFK9QYTajjoh0QbYRddZcqEiQJXuQ-f1jwW2rofj-JYqM-qWZOxDVaik8iFSscT282RRq3tPSyDE6MjbLV3oprso-41Hy8DoKkdtT4nkBw>
X-ME-Proxy-Cause: dmFkZTE+u6ePgzePz3Q/v2WgZgKpeuZE70fJd+liHM+xSACb8UE1BxV0gjhpmyC3xyNBi7
    HoKQ0qBBUGmjgt38AAaPJAC0PG7kMWekZ+N39do0aTm4A6vJEfKTvKToY1G5oGuNr85sDc
    bz/iRnRdpzM70jZ52oUGuDyhPM1XRQ5gOoT7cbbFT5fXFufGlhlfvYYe00EcTuE381yWX2
    bvL0oiPfufYS7E+hoDqVe8Vjm1eCQ6YFWjQlLxdOjn4fa/Z7RRiRuQvHp5kJCGrfkKjLim
    kvTtB1MO/ZVjSk3tVFh5aqKN2I+Jz5Epp6ZgHgpN4mzLC7ys1uQwKGz1hsUDuvtEU1ZkMk
    RhFbIFY6E1h+DZ18JDP6jez1udIq8vA5BpmShEAiaMdlLATqYrbdO0qTPakRc57/G8EzDE
    crrJ8HBxcZXRtJcGjPMhfVW3hTOS3DoSZOtfuAyzSYOBXRnjhG5eBP70VbQakCvMS9hTOl
    qvvCNvETSCj5pMmjAzvD+jyl/G6s73g3nhL4sVd1tn6MyBr2RdRpQA4iiLwUdS2SPiDrbg
    mF6JPkk5heGsb9UK5WoGZT1rnoGjzLa3GQupiJkEssJaa419FIz2jUHpSAFVNmtchJ6QYs
    FtexmYJmtTBDKk7qD3tL2b/C4+N+snonh1hbr4qSPiSvGN4chn6vFUbi1iVw
X-ME-Proxy: <xmx:uQQaaiyUzwH5N3uKYjL6obvZsyOGltRQKKjbqEGU3yAq__6lJMDo9Q>
    <xmx:uQQaarZbJzrOJRmlJhyygrDJc1rTedYdlvk97VsmlxVhwN0xKIMYzA>
    <xmx:uQQaajXq64KkaKFMQNQkNj9xqUE3t-2iCrjfJDRwltxLKpj1LX7S3A>
    <xmx:uQQaapie8-dtasIWcfGpcSIFkuAe7KwOWX2IyuILBRgI3_hv9HcOtA>
    <xmx:uQQaamSsyJoQjdWxEjeKTfMWaNtZF2Ybq6hKfWSGNOVQF_CuFjzXpJsb>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 May 2026 17:27:20 -0400 (EDT)
Message-ID: <aeb9c03a-0330-4e41-ad33-b884f00691a0@bsbernd.com>
Date: Fri, 29 May 2026 23:27:18 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu
Cc: jlayton@kernel.org, axboe@kernel.dk, fuse-devel@lists.linux.dev
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/29/26 18:32, Joanne Koong wrote:
> On Fri, May 22, 2026 at 1:59 PM Joanne Koong <joannelkoong@gmail.com> wrote:
>>
>> This series adds buffer pools (implemented internally as a buffer ring) and
>> zero-copy to fuse io-uring.
>>
>> Prior to this series, ents and buffers are tightly coupled where each entry
>> has its own dedicated payload buffer, requiring N buffers for N entries where
>> each buffer must be large enough to accomodate the maximum payload size. This
>> is suboptimal as most request types require vastly less bytes than the maximum
>> payload size and some requests do not require payload buffers at all.
>>
>> This series allows servers to pass in a buffer pool (internally managed as a
>> buffer ring) that the kernel will use for servicing ents/requests. This
>> decoupling reduces the memory usage requirements needed to use fuse-io-uring.
>> It allows for future optimizations such as incremental buffer consumption and
>> supporting multiple buffer sizes per ring.
>>
>> This series also allows servers to use io-uring registered buffers as the
>> buffer pool which eliminates the overhead of pinning/unpinning user pages and
>> translating virtual addreses per i/o request.
>>
>> This series additionally adds zero copy to fuse io-uring. The server can
>> directly access client pages or page cache folios without copying data through
>> an intermediary buffer. This requires CAP_SYS_ADMIN privileges and using
>> registered buffers.
>>
>> This series has a dependency on io-uring registered bvec buffers changes
>> in [1].
>>
>> The throughput improvements from registered buffers and zero-copy depends on
>> how much of the server's per-request latency is spent on data copying vs
>> backing I/O. When backing I/O dominates, the saved memcpy is a negligible
>> fraction of overall latency. Please also note that for the server to
>> read/write into the zero-copied pages, the read/write must go through io-uring
>> as an IORING_OP_READ_FIXED / IORING_OP_WRITE_FIXED operation. If the
>> server's backing I/O is instantaneous (eg served from cache), the
>> overhead of the additional io_uring operation may negate the savings
>> from eliminating the memcpy.
>>
>> In benchmarks using passthrough_hp on a high-performance NVMe-backed
>> system, using registered buffers showed around a 10% throughput improvement
>> for direct randreads (~2150 MiB/s to ~2400 MiB/s), a 4% improvement for direct
>> sequential reads (~2510 MiB/s to ~2620 MiB/s), a 8% improvement for buffered
>> randreads (~2100 MiB/s to ~2280 MiB/s), and a 6% improvement for buffered
>> sequential reads (~2500 MiB/s to ~2670 MiB/s).
>>
>> Zero-copy showed around a 35% throughput improvement for direct
>> randreads (~2150 MiB/s to ~2900 MiB/s), a 15% improvement for direct
>> sequential reads (~2510 MiB/s to ~2900 MiB/s), a 15% improvement for
>> buffered randreads (~2100 MiB/s to ~2470 MiB/s), and a 10% improvement
>> for buffered sequential reads (~2500 MiB/s to ~2750 MiB/s). I didn't see
>> enough of a clear improvement for writes due to write latency being I/O
>> dominated.
>>
>> The benchmarks were run using:
>>   fio --name=test_run --ioengine=sync --rw=rand{read,write} --bs=1M
>>   --size=1G --numjobs=2 --ramp_time=30 --group_reporting=1
>>
>> The libfuse changes can be found in [2]. To test the server, run:
>> sudo ~/libfuse/build/example/passthrough_hp ~/src ~/mounts/tmp
>> --nopassthrough -o io_uring_zero_copy -o io_uring_q_depth=8
>> Once this series is merged, the libfuse changes will be tidied up and
>> submitted upstream.
>>
>> Thanks,
>> Joanne
>>
>> [1] https://lore.kernel.org/io-uring/20260402160929.2749744-1-joannelkoong@gmail.com/T/#t
>> [2] https://github.com/joannekoong/libfuse/commits/zero_copy_v3/
>>
> 
> Miklos,
> 
> This series has stalled on an architectural question and I'd
> appreciate your input on the direction.
> 
> Background:
> In fuse io-uring, entries are reusable communication slots between the
> kernel and the daemon. When a request needs to be sent from the kernel
> to the daemon, it is assigned to an available entry. The entry carries
> the request to userspace, and the response comes back through the same
> entry. The number of entries determines how many requests can be
> serviced concurrently. Currently, when the daemon registers an entry
> during fuse io-uring setup, it passes in a payload buffer (sized to
> the maximum payload, typically 1 MiB) alongside it. The buffer is tied
> to the entry for the lifetime of the connection.
> 
> Problem that needs to be solved:
> Most request types (lookup, getattr, open, etc) require far less than
> the maximum payload size, and some (flush, fsync, etc) require no
> payload buffer at all. Every entry reserves a full 1 MiB buffer
> regardless of actual need. On systems with many entries, this memory
> cost scales linearly - for example, 64 entries across 8 queues
> requires 512 MiB of payload buffers alone.
> 
> Approach A:
> Decouple entries from payload buffers. Entries become generic - any
> entry can use any buffer from the pool. At setup time, the daemon
> passes in a contiguous pool of memory, and the kernel dynamically
> selects and recycles buffers from this pool as entries are assigned
> requests. Entries servicing requests with no payloads consume no
> buffer, and the pool can have fewer buffers than entries. This
> supports adding multi-size buffers and incremental buffer consumption
> (multiple entries using non-overlapping regions of the same buffer
> concurrently) as optimizations in the future.
> 
> Approach B:
> Keep the 1:1 entry-buffer coupling, but allow entries to be registered
> with different payload buffer sizes at setup time. The daemon would
> register entries with smaller buffers for metadata-heavy workloads and
> larger buffers for data-heavy ones. This keeps the existing model of
> passing in a payload buffer during entry registration at setup time
> and requires no uapi additions. Each entry registration adds buffer
> capacity whereas with buffer pools, buffer capacity would have to be
> added as a separate pool.
> 
> I want to make sure I'm representing both approaches fairly - Bernd,
> please correct anything I've gotten wrong.

I think for B "at setup time" is not entirely correct - buffers in the
current model buffers and entries can be registered at run time.


I have been thinking about approach C, which I think is in between A and B.
I my mind approach C does the registration per entry, but payload
buffers get added to a buf array, if a payload is set.
Max array size would be negotiated as in your approach or maybe better
with a config SQE. Different IO size could achieved by multiple buf arrays.


Thanks,
Bernd

