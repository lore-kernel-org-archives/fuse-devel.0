Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33E329CB24
	for <fuse-devel@lists.linux.dev>; Mon, 22 Jun 2026 23:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782172339; cv=none; b=VOFuBpgdiUNIXYsij+J5i4D1Qg96Q8DnGnC4IdewSDpKEjXVIvsMlugj25shUkyQq6imdSVC8aXHbrU+2UIszeCoL5eXARUMdANgb/oCTONVNgRZIbt7NzCgsANeEDtLnaJMn8HeSZI60nrOCMnTAn6oOpPHZ0wPTbmg60X/eE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782172339; c=relaxed/simple;
	bh=8N7GIDud2Es5QYPXDU9U6QqkD+Ti2tRadWjf7L1SU2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uyhic5RbtqiL9hFoKizfstlOczdti3SKzIsoTFArgG5KQt3SIS/qfzy6y7qHlsv/DvDRrcFUTWOISYEiIZVK28OgPYnlEBwj3IdlrDaG+f4Lp9fAh/5x1enypNRu0Ql+nPVjhgh7tbJ9Iau0CwLssxVD0yHr5A3PUxulga6gAmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=KHzB5EVI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KGscF0b3; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="KHzB5EVI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KGscF0b3"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B6F937A0090;
	Mon, 22 Jun 2026 19:52:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 22 Jun 2026 19:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1782172336;
	 x=1782258736; bh=UyKa23hOhjJTO3dNwtr71uRTTw68/U772yfhkVhnvYs=; b=
	KHzB5EVIx0C5i8UdI4TYhipubVZv/+SKfOFzpkpsLUxRVRZVYKyhU2hittTk/qwW
	PD31ZhELSy2sBDH9d3e8bbvBtTJqK7/Yf6SlkGe6kcDlpAW/Bi30dKIflcaRDJRq
	/gcskV2i3iM3q2t6ChTstToCcgpIllHRYsz8hby9ba51Y9UDd5vgvEFY29k+13wp
	LhsePw/ZgDZcA19cODx2fe5jFcJhjTr+pxSWB0xBfnHByzICHb6wdXOwxNqnFcjI
	iMNGE8VErLL3USAi4eSsjHglCk9jIC8vvePpw5BMRCGOQCtq65MC2B32XQ6ItIPU
	hmmAyzi25OM+N8i8/60QrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782172336; x=
	1782258736; bh=UyKa23hOhjJTO3dNwtr71uRTTw68/U772yfhkVhnvYs=; b=K
	GscF0b3WfIG3ZCdzOu7otSHvNf6R/stpGNPFObsYEX5syZ9ZtS0uAvCJzMYEUclb
	HXT0AltahbpMD4q3Osis285iOd6d/q19g5VSqVPlw+IDal5Mb2EMD8CPIhMFHieq
	er4R0LCW9QdNh2OYZXc1C8n13k0IOYdmzj+MHBspDBz4OwM0PcVRaBJxdd52kHUK
	amhQY8WxAdP6OiUQr/pi34VOaB6/wSBikuU4+dFRsLfuDsPx9QYS6g484NRkG4WV
	44bHu6Dgpdp/PYqAxSk+kN7R7w03vsxfLdnSAg22tu4vwFJ8qbS1Y/AjhqAGkNSV
	YuN3e+ddiKW940ChG5hBA==
X-ME-Sender: <xms:sMo5ah8am1_3C8Z8m6P6lpQen7YLOYJo3RfoCTeOhNpRhZC2Cz6lPQ>
    <xme:sMo5apY6h_zj2hkKog0BPbxy3SgR0ebx_4C7C5nkvTL4d_uND6wA62JhG6EEzl-Np
    RIcQMj_cub8qjgU7pzLZXWr21b5yAasE_cTe3rPQ3ndw5L8Sj_K9g>
X-ME-Received: <xmr:sMo5ao0QQmNRnjLRWCQV6KY1oHEch5yvGkxthxbFsAK9Ntsn1a_pJD9AWbeGlHRueGL24or48kRrONUoWU50M99jAwF9HuASlJu0EZEOA-VBXfcmyg>
X-ME-Proxy-Cause: dmFkZTGZIlbYHD+Xzqs16jUMOHLVJNZb7XZzxfh0VK1+bUPiOoAkH+2AEAKPPkgEsC87wx
    7oBxiGSVwWsJxbdODojRoNJO8l4VzBM3oCygFZBtCt2zhzVNXFICXxBawjI0UNA4NWeVbl
    ZTgN18hSH1O67bcbfkQ0PQW8M4TQVBIVevk5eXcfXTDOUA40IuyNxuodatkTBvZHhGtG7T
    77ft2mR+Xbv10yplk3WG/V2t2KiM8tNHx0ucMGhvre/m8M9sHnDmdVC3iMSusol1ReifVf
    UlLtcwPfWfZwRrVfySt3MuJ1odhtBA/7dFNOiVt2RBFC3tmekzoCfRrxMWoBIHGM8mF0jq
    XhNxjqRuYHfHzbEeKnqY1eZrz17Qk+75VfxQtTeLjcqSYJC0Ro8JbMzfG/T9JCs218InXv
    oyRaeOU6JOnQhG+SiiV2D6TUOSczeGearFEXmWNB+Ar+EkD6K8TLgwFVdHzus80Gr8VlAc
    PrmDnHFe7Xz2G+h8If8mFuKhYkZNMbfi6i5g5tDQgPb/eai50D0pT5QKDpitlCUVN/mArZ
    JJDRFiaYmxXuM3jUoAr096q+mFkoRgvogShdoFsJZBLfSEVmtDKaEEuUAApFp82u2YhkCn
    pvmfevN9wLGQmovXgPExY22DaaL0aGNbmcbmqcxAAMSqSZH0rutQI4dhOe9g
X-ME-Proxy: <xmx:sMo5asYp6Ql2zWn742D1-Z5uHHwVuSTHYG9HFopUEG_2p8DMNIRNnQ>
    <xmx:sMo5aoJ8zFC-DvlzQzJ1SkkiOMeNACgLHefFnz24gb6b6fo3IusO_g>
    <xmx:sMo5ajHu9TFcA6xUEKxUz6uX1TkzeOZgTzrnVJzec9DnmtH5OPoGWQ>
    <xmx:sMo5anvn6loAqL6hIFVgHBn01AJewMtRx0pvtP7_mayHN2USjQ7mfg>
    <xmx:sMo5ag0wI5ih0flflDYy1vbWwfiIYvoZBHtd76GUZLvofe44bnj3v8R4>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jun 2026 19:52:15 -0400 (EDT)
Message-ID: <8568d20e-b00c-4902-a200-024f8cc1feba@bsbernd.com>
Date: Tue, 23 Jun 2026 01:52:13 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] fuse: {io-uring} Allow reduced number of ring
 queues
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Luis Henriques <luis@igalia.com>,
 Gang He <dchg2000@gmail.com>, fuse-devel@lists.linux.dev,
 Bernd Schubert <bschubert@ddn.com>
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
 <20260529-reduced-nr-ring-queues_3-v5-4-1dc08c2fccf6@bsbernd.com>
 <CAJnrk1aGcWGJrkAVVEGfjP6mBVraJuQN0_S9oprV6Yo29srBWA@mail.gmail.com>
 <CAJnrk1Z7ECu5vLqnO7ubdkBLZqLB42njaBinqg2LMWpqx=s4Ew@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1Z7ECu5vLqnO7ubdkBLZqLB42njaBinqg2LMWpqx=s4Ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/23/26 01:32, Joanne Koong wrote:
> zOn Fri, Jun 12, 2026 at 7:24 PM Joanne Koong <joannelkoong@gmail.com> wrote:
>>
>> On Thu, May 28, 2026 at 3:55 PM Bernd Schubert via B4 Relay
>> <devnull+bernd.bsbernd.com@kernel.org> wrote:
>>>
>>> From: Bernd Schubert <bschubert@ddn.com>
>>>
>>> Queues selection (fuse_uring_get_queue) can handle reduced number
>>> queues - using io-uring is possible now even with a single
>>> queue and entry.
>>>
>>> The FUSE_URING_REDUCED_Q flag is introduced tell fuse server that
>>> reduced queues are possible, i.e. if the flag is set, fuse server
>>> is free to reduce number queues.
>>>
>>> Notheworth is also that a fuse-io-uring is now marked as ready
>>> after the fist queue was created.
>>>
>>> Signed-off-by: Bernd Schubert <bschubert@ddn.com>
>>> ---
>>>  fs/fuse/dev_uring.c       | 171 +++++++++++++++++++++++++++-------------------
>>>  fs/fuse/dev_uring_i.h     |   3 +
>>>  fs/fuse/inode.c           |   2 +-
>>>  include/uapi/linux/fuse.h |  10 ++-
>>>  4 files changed, 112 insertions(+), 74 deletions(-)
>>>
>>> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
>>> index 497093384c31e729053d2f5046c9ec59461ac035..d02266b483c89d105bd6301133820697f7caba9c 100644
>>> --- a/fs/fuse/dev_uring.c
>>> +++ b/fs/fuse/dev_uring.c
>>> @@ -373,6 +397,30 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
>>>          * write_once and lock as the caller mostly doesn't take the lock at all
>>>          */
>>>         WRITE_ONCE(ring->queues[qid], queue);
>>> +
>>> +       /* Static mapping from cpu to per numa queues */
>>> +       node = cpu_to_node(qid);
>>> +       fuse_uring_cpu_qid_mapping(ring, qid, &ring->numa_q_map[node], node);
>>
>> Hi Bernd,
>>
>> I don't think we can assume node is within the bounds of numa_q_map.
>> numa_q_map gets allocated with num_online_nodes() # of entries but I
>> think the node returned in cpu_to_node() can exceed that if some nodes
>> were offline when we computed num_online_nodes() (eg num_online_nodes
>> = 2, thhe 2 online nodes are 0 and 3, while 1 and 2 are offline).
>>
>>> +
>>> +       /* global mapping */
>>> +       fuse_uring_cpu_qid_mapping(ring, qid, &ring->q_map, -1);
>>> +
>>> +       /*
>>> +        * Pairs with smp_load_acquire() in fuse_uring_select_queue().
>>> +        * Released before the per-numa bump below so that observing
>>> +        * numa_q_map[node].nr_queues > 0 implies q_map.nr_queues > 0.
>>> +        */
>>> +       smp_store_release(&ring->q_map.nr_queues,
>>> +                         ring->q_map.nr_queues + 1);
>>> +
>>> +       /*
>>> +        * smp_store_release, as the variable is read without fc->lock and
>>> +        * we need to avoid compiler re-ordering of updating the nr_queues
>>> +        * and setting ring->numa_queues[node].cpu_to_qid above
>>> +        */
>>> +       smp_store_release(&ring->numa_q_map[node].nr_queues,
>>> +                         ring->numa_q_map[node].nr_queues + 1);
>>> +
>>>         spin_unlock(&fch->lock);
>>>
>>>         return queue;
>>>
>>> @@ -1186,7 +1180,19 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
>>>         if (IS_ERR(ent))
>>>                 return PTR_ERR(ent);
>>>
>>> -       fuse_uring_do_register(ent, cmd, issue_flags);
>>> +       fuse_uring_prepare_cancel(cmd, issue_flags, ent);
>>> +       if (!READ_ONCE(ring->ready)) {
>>> +               WRITE_ONCE(fiq->ops, &fuse_io_uring_ops);
>>> +               WRITE_ONCE(ring->ready, true);
>>> +               wake_up_all(&fch->blocked_waitq);
>>> +       }
>>
>> I thought we had agreed at LSF that userspace would declare the number
>> of queues upfront and dispatch would be gated until all of them have
>> finished setup/registration rather than going ready when the first
>> entry in a queue gets registered? Did the plan change or am I
>> misremembering?
>>
>> I still have the same thoughts as previously [1] about it. I really
>> don't think we should allow requests to go through io-uring while
>> io-uring setup is still happening. If we want to add dynamic queue
>> addition in the future, we could always do that later through a new
> 
> Hi Bernd,
> 
> What do you think about dropping FUSE_URING_REDUCED_Q and reframing
> this series around dynamic queue addition instead? I don't mean to add
> more work to your plate, but my main reason is the uapi. REDUCED_Q is
> a narrow flag that's a subset of dynamic addition. Exposing general
> queue addition would line up with the decoupled queue-creation uapi
> the bufpool work will use, and it'd be more cohesive with the future
> feature to dynamically remove queues.
> 
> I think this series already has the bulk of the logic for dynamic
> addition anyways. The main missing piece looks like adding
> infrastructure to publish the mapping as an immutable RCU snapshot
> rather than mutating it in place, so a reader never sees a
> partially-built mapping.
> 
> What are your thoughts?

Except of libfuse not being ready to create queues on demand, the series
basically supports that in kernel. And I was also thinking to use CU to
update the mapping.

However, I'm lost about the relation of buf pools. I very much disagree
that adding buf pools has a relation to queues. Unless you want to make
it 2D, which gets complex to find the right queue. Reasons:

1) If I start a queue in libfuse with a 1MB buffer and later see that it
gets used, libfuse should add more buffers. However, I would not want it
to add queues, unless I see that that ring threads occupy all of the core.

2) Lowest latency is still achieved with one queue per cpu - especially
here it makes sense to have a very low buffer usage and to increase it
if needed.

3) At least one customer at DDN sets a very specific cpu configuration,
using more cores is strictly forbidden.


Thanks,
Bernd
