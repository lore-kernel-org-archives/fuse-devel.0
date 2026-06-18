Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC9424293C
	for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 22:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781822246; cv=none; b=IPHFd9OqyMxnP2PrKSJkXlQPt04ibczyIPxfCtRnbSFBP8TmqzynGcVuvSaep16WQBlh4g2wa36WwIpphYn/oNvpsGvvfaa/ZLM+hSq2LezKB1bunnFZp/9kvLbgBpbgx7VSvJ4g/xk+YzuVO25gJByaFmmYLPjOMrsD2KJXS3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781822246; c=relaxed/simple;
	bh=CmpHBylSGgRh4CTpoveVH+IaTMZArtm9TzuV0R8TFg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cn/Xv98I+0dvZg59aN2lOh5bb/3EH1+p5CuMwxVPoe8zeCLjLAE6RUr0lPbF6Unw+JyQU/2pKw9rcXjh8CTSaA/U7m/alWKEu00R7j+eSJ0hvfmV1JHKIf3ZE5I3NBesmhzjFrh0jKHMsNSIn3Wqo46IMwSObHk/qc9WYPyavE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=vxdzrATt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KNaWT6LT; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="vxdzrATt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KNaWT6LT"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CB6F37A0060;
	Thu, 18 Jun 2026 18:37:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 18 Jun 2026 18:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781822243;
	 x=1781908643; bh=WFQdoC+cSKI6TEMahDCbPMzbe4CwBe2pw24cy48raBc=; b=
	vxdzrATtMDEHfXRqlKJsh/HNY2vrc8ypl9KIjqGcPdJpUCal3tbudv3A8Odsn4WJ
	06vkNPsgiUtwhprS17O/8ogpdXL6XgYELelrDrEgA4HOyW71+RvZuMrhnm4NHVX9
	LlXdrxBcjGHiQp9PPYFutboAvKLXKPdITRPhEdiDdq3BqxKZ4IfRDlNfK3DuzoyD
	UiM7LhSCXt+aKHv2ty0p3hPWaAb4QG/3RFVvA1b/if8PXTnyWfNhFdKWxMA/GX6g
	Q9HHO/1d+I7U7DyyVpDrX/A73JhQYaPJOYLvF6CSNbTPzMlhPOUBl97YDAy2Wj3U
	jmHqQmwyYEkccmbKB2+5Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781822243; x=
	1781908643; bh=WFQdoC+cSKI6TEMahDCbPMzbe4CwBe2pw24cy48raBc=; b=K
	NaWT6LTgN9i4f9xHkzkLWhHB6jLYD0DRvOARh5j9R/CDBr8MQ4L9KNEEr9hhZKpq
	9w6J8Sg/SGxZp803WApAfil/MthHv59Car+b5v3KZk5dCFQX1EtwSEFMrv3vmBzo
	CUbq8C3fQbaRqZhFrA523TATWaC/t2zYv6kmqCtah9zoXo5b9S4KB/7q2wkr3jA+
	MgrzsHA6R0CrFAOvr7l7ygCP+GYnSBSRhZtBu/UdPkaKAxAvBNHzpwgXzzu9Yg/L
	PulXRPaZ1hUgvZL5Bh3h930SNZSHjUfdkM3oYqLZ+1FGztmB2wvUqSUpsQnr2g8K
	fLY+BksSroT0MgwYXsgUg==
X-ME-Sender: <xms:InM0an3_WmNToVBU5MI57PalvDh1sZU_912JbU8HgCy71OayGRfnkg>
    <xme:InM0avaFcuAYesYjWtDQSDNY-M2F3tqLQni2EoeeCc4SYIFBttS8SleuYnJFN00_a
    6bGzp6BreIOeR5mEAxjKVIZRnmEsja_RDAxnyL01MPJK3jQ3mIVJg>
X-ME-Received: <xmr:InM0avLcW67ATv2NEeQHwGxUcrlOMm8YUT8sbmeLg2T0ozlY0a9jqhtutqFa024n2Oo5QNY0ijkw5k5RUSy2P5dWjVThnaNR9iwBeiMzR326q44QZA>
X-ME-Proxy-Cause: dmFkZTG1GuXplH7CNAcHLnRUe87Dl0fhMUOrfSI4rooi7qDL8qVyDlQ3DoekUJUgnRARYC
    jZbroEinwE4UIaS6FloFcxSgFufOvfHbPVpLmGf7UczBvT2wAocqLKUpSucFf4D6tlONWF
    tmv+kmMus5y+jVCsHmTAavDjiScYkVC92L2GHQJZoG/XLx+HfnbtfW7+a+1rUPlPN1xeaR
    fKce93mSTMSy7rN4n5iJRP+bEW06jv3ST4URVoKmSQiK5pngCl3la1yZmT/Pdtjv9cbTsA
    dQ/bWmoyorTHAHiq7tX5SXYvwojGzW4AuJpLHnKc4z9x+ceQjItPaRAG9l0SAonMsTwvrE
    MPMViHdFxg2dg8p9T7ngpyS3y3311LkHSCzssXEbac9Vih2NNBC23eECvfJqfH5ncLgBgl
    JU7/6O/sF6T1q5D7xa4xH8ogpGlcBEIg2ro3us8FgvsRdqfmR1p5Ag48XQICARLMvnoOkW
    0PkEYHPq6pZhjrBhJt4wBLL1gdR5aEx+gjS2GJMdpfnW6tX6zAS+nXbUig9yWUjnUXwHZF
    vHqBtTb6lY/QByqZ92iK3g2cF2vuqFzop1fosX5GkVemiOE+H/OL/A4YV6jgY+NbRa8Dam
    GQ6NpzO9jHn9kjMjAXy3BhSSw+rh9CqsZiEjVVDTMiBFJm9YT0VvaH4FoV2w
X-ME-Proxy: <xmx:InM0auGd5t_Odhm7Ef7kir9h5_M86wiVsR7FCY5fE50cS0Scrr923g>
    <xmx:InM0amvVfT4m_TBp0l5SatjFg7BSkfuXnSgWBPWa2dd_uDb_Tdinwg>
    <xmx:InM0atsExDBgLg1x7QFfCSya_B-0-ZPGrmYaySDIR-rAhbgUIzx67Q>
    <xmx:InM0akCv-i5M-QUIFH8fKWRpCRsXd5NGNoMNPCEAX8Kh4lr-PA04aA>
    <xmx:I3M0an3DAB07NtWuVzu1_6kqBLXyy7kLEVRdfYBeQuxUIsu3lte1fH0H>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Jun 2026 18:37:21 -0400 (EDT)
Message-ID: <9ce8460a-6fb7-4592-bbbf-e131b46401ce@bsbernd.com>
Date: Fri, 19 Jun 2026 00:37:18 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Joanne Koong <joannelkoong@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org,
 libaokun@linux.alibaba.com
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com>
 <CAJfpegsWpKE4kUUQo+NK_cu6oy6h6+A1M=xokvSQbFtZzu9UKQ@mail.gmail.com>
 <CAJnrk1b1nVFZ8dQYA=iGn-p182HNhhRfZEVe-e_ks_daZAU3Rw@mail.gmail.com>
 <CAJfpegvNyqSS2h28-0sB2j2HUoMnKd7StMsPbvNPz67PiS9w9A@mail.gmail.com>
 <CAJnrk1bK-3tpZoeJQKPLjgpQW2F0YQKVhLeGwkN_5tpBVpZ-VQ@mail.gmail.com>
 <CAJfpeguq+LVHoyC7ZzkF_VSAQdqmQFw4DBztiQA1Jfy=U+D9wA@mail.gmail.com>
 <CAJnrk1Yqa0nvXCBo6GzHc2bP_V5+2dHaJn+2pWkumV0QLr0nSw@mail.gmail.com>
 <CAJfpegv=u=jfOqtHXpEC60unrzO7XFeP9o9HM18AVqWfN=O0Ww@mail.gmail.com>
 <CAJnrk1b4r0vbrm_HNe5bV11FVmdKDNAcZzkoLtoW_hEmmBjpdg@mail.gmail.com>
 <CAJnrk1ZVs2hOc7CRAVb_fQPJiUvqK837MzOWQqv4VB9YU8q6mQ@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1ZVs2hOc7CRAVb_fQPJiUvqK837MzOWQqv4VB9YU8q6mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/19/26 00:23, Joanne Koong wrote:
> On Thu, Jun 18, 2026 at 10:20 AM Joanne Koong <joannelkoong@gmail.com> wrote:
>>
>> On Thu, Jun 18, 2026 at 1:37 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>>
>>> On Thu, 18 Jun 2026 at 09:03, Joanne Koong <joannelkoong@gmail.com> wrote:
>>>
>>>> imo the main benefit is for incremental buffer consumption (allowing
>>>> non-overlapping parts of a buffer to be used by multiple entries
>>>> concurrently). To recycle back a buffer that is used by multiple
>>>> entries, it would require all requests to have been completed but I
>>>> don't think in practice this is a bottleneck with reasonably sized
>>>> buffer pools across queues. imo incremental buffer consumption scales
>>>> more dynamically with runtime workloads than preallocating fixed
>>>> buffers of different sizes across different queues trying to
>>>> anticipate / guess workload needs. Overprovisioning small buffers
>>>> wastes memory if those requests never appear, while splitting the
>>>> memory budget towards smaller pools reduces capacity for concurrent
>>>> large requests, and workload patterns might need either at different
>>>> times.
>>>
>>> Hmm, so why partition this memory into buffers up front?
>>>
>>> We could just as well say that managing that chunk of  memory is up to
>>> the kernel.  This would simplify the interface: the buffer size is
>>> redundant, since it's the same as the max I/O size, no?
>>
>> That's a good point, especially since we can just return back offset
>> into the bufpools instead of buffer id. That's a much cleaner
>> interface. Though I guess if we want to be forwards-compatible with
>> having the option of multiple bufpools per queue in the future, we'd
>> have to add bufsize to the uapi here now. Do you think we should just
>> keep it as is then?
> 
> Ignore the last two sentences please, I didn't think through your
> original message.
> 
> I like your idea a lot about just passing a chunk of memory to the
> kernel and offloading the management logic entirely to the kernel.
> Maybe I'm missing something obvious, but why would multiple pools per
> queue still be needed? If the server needs more capacity, why not just
> have the server spin up a new queue? That would have the included
> benefit of adding more concurrency, and dynamically adding more queues
> is a feature that would be added to fuse uring regardless. For
> multipools in one queue, the pools would be discontiguous anyways,
> which wouldn't help with fragmentation. I don't think adding a queue
> incurs that much memory or cpu overhead, and imo the scenarios where a
> server would want to just add more capacity but not parallelism are
> uncommon.

How do you select the queue - is the queue now per CPU or is the queue
2D per CPU and per buffers? If per CPU, what is if you already have
queues on all CPUs and still want to add buffers?
If per CPU and buf, gets a 2D matrix - gets difficult to find a suitable
queue.
And even if queues are per CPU and enough free CPUs available - might
cause some non-optimal routing.

Maybe I miss some simple logic.


> 
>>
>>>
>>>> I think we should still make the design for bufpools
>>>> forward-compatible with supporting multiple bufpools if a use case
>>>> comes up in the future,
>>>
>>> Yeah, and separating buffer registration into a separate op would be
>>> one step in that direction.   It doesn't have to support multiple
>>> bufpools from the start, but splitting out separate functions during
>>> initialization is a good idea regardless.
>>
>> I'm not sure I agree that splitting it out would be a good idea if we
>> don't ever end up supporting multiple bufpools (imo, having this in
>> QUEUE_SETUP would logically make sense and be more ergonomic) but I'm
>> happy to make this change.
>>
>>>
>>>> From my perspective, the use case I see for queues supporting
>>>> different payload sizes is for separating IO requests from non-IO
>>>> requests (eg lookups, getattrs) onto different queues so that non-IO
>>>> requests don't get stuck waiting behind larger IO requests.
>>>
>>> Note, "queue" could mean two things here:
>>>
>>>  - fuse's waiting list
>>>  - cqe's on the ring
>>>
>>> Currently there's 1:1 relation between those, but that's not mandatory
>>> going forward.  So we could have multiple waiting queues for different
>>> types of requests, but a single uring for sending them to the server.
>>
>> Even with separate waiting queues and the kernel prioritizing sending
>> metadata requests before io, isn't there the issue that if the
>> requests/entries on the ring are all IO requests and then a storm of
>> metadata ops come in, they're still backed up waiting for the IO
>> requests to be finished? Or am I missing something?
> 
> Thinking about this some more, I think the kernel could just
> pre-reserve some ring entries specifically for metadata ops / non-IO
> requests. That solves it on the kernel side but the userspace side
> would still need a threadpool of some sort if its backend IO blocks
> its queue thread.

Isn't that the same as fuse server saying "here are ring entries with
small buffers for meta ops or other small IO"?


Thanks,
Bernd
