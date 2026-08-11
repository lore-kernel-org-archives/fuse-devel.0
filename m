Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2EC3FBB44
	for <fuse-devel@lists.linux.dev>; Tue, 11 Aug 2026 21:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786483717; cv=none; b=MdFgNLOI03vjWbik1qqQag6zI4j/w9HN1vOowFIgFTx7GW3/ie8wtsoBnKyQf68f2a5M1mc3hGIiWmPU9eMseDZ51zWJh1MpCSTcnl7UvCXf/u1NM9IOghcP/fHlW0khr9eh6Gnd673QidrWvxmO+WoOpn7AiYRsXqUcXgzbh38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786483717; c=relaxed/simple;
	bh=ILuKuytlkTHtBJJSXdRoeYsw50Eqs9lbMWONBVqBL2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=crezffVtIT/exEoHHrUs5TFp0+S4FGuwndOiRAduqZw9PfzM/FzwFkO3a4EoI7WmFqw6C2wWArgU0obc0PHyb5gra+sGRPrXEyp/H81w08A/X1Q01Ola4YzgyncsWwN5kA08vL3EP1c30hUgNmOMSUuQ6yXX1HQXj0PV6gRJYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=ds5J0oDr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BDtvJTwK; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="ds5J0oDr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BDtvJTwK"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 23E121D000A7;
	Tue, 11 Aug 2026 17:28:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 11 Aug 2026 17:28:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786483713;
	 x=1786570113; bh=S/IhdI+BXnHJJso7cQAMeNOpfqcP/sVaeMCGXvaRQHE=; b=
	ds5J0oDrIUr9TMeSEzn0vM+wSIpfIFbxdzI0xO2fXB+BpqFZOkjN2hA7KrDr6cOa
	9rFrTHT+AaBuz0CkaIXFH6X3DY8rBVzv2uG0JXn/cJS2A5cERNVuwrR1rH+n46mQ
	eH28O5hT3fmL8O+2sCBIzybojNbPMVjFO4sG8ESpzigiopUbgxWU/eLKRzBN6hCQ
	HgU7t/I5anYLXWs17ho6OSi2RgB4ej3dlxonqJfDqiEgyLRxZTd228UQRBZEL2Zf
	IPGwqSslQCC/owpumbVi6t/VtkZ9X0NjQ1iJIZnB7xcnAAP0Tr3yHNU0W9WQX7jd
	b1RU9AO51y0jduyMmQyy+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786483713; x=
	1786570113; bh=S/IhdI+BXnHJJso7cQAMeNOpfqcP/sVaeMCGXvaRQHE=; b=B
	DtvJTwKHnnLwa3hrOgWeqv01qWrlq4i/lJM4felZoOrL6TijhjdzFOsSrPB31/Fi
	WzG2ijTij04gImDXFSRwwu4H8FMYdDaUTiJ5waFttBXq87nbJVqbCwOCAZcEKplO
	teTt7aUBSzfLqWhoUo6OWHNUKVrcEgFVCESQnKydAKz1KrQB/4tis/g6cDEae3Fy
	h1Dqy4h2+De66IQIms7/czLdoOHCmFA4/mF5uPLdQHW0gXSq1M5SlR7y10INPvMG
	nfG0humWecVGrMMmHMr6lCaatqi4yqxvvvrfWMiu3AwEyZEFwairYLm0waLwvA1F
	96y4U9bqpR5syGUszw6Lw==
X-ME-Sender: <xms:AZR7agVfmUfPwsVVjUC0_lCi88toC9MGIvlotr0fWldtlUB0GDcMrg>
    <xme:AZR7alRh98QKiAbis_xpCm-Jscg69MQHleUZg343R3TywI4LmsEKDL3KGk6lfLXzW
    kbAIYCjiB3Z2gHkYS6n2WZ0_TeXkyb0ePrVR5V7zU2lS-DyIeu2KA>
X-ME-Received: <xmr:AZR7aim96vcISvAb0LdCEQ-9KNFZUW2YyYrNRgybCq1aZLI3PB5E-G3Qeca9OHaSZrVvkpkt20flPImCJLLJwxVNVkZl3YC3JWIURYBviAabFCSlrjEqJZ7Z>
X-ME-Proxy-Cause: dmFkZTEHc2AI5vcxyGVItXlNRz+z3tKv5jWIdfdyfowQQ2HcDCrrdIUsgnW7IYoGSHxxuT
    62/kgpjV3uMh1Yz2LKQjvDfO8rDHKXL0tiSvVGjWekQKsW8uNQ2BSMojlwR684WpPqihXf
    sIG8MEOXlHBfZ6XBU2qFyyy+8CNPaq83YUtCgOP2NJvsh7ehMMC3OSZ9d++KvUVq0hvNjO
    NC529dFGCUXIN3D3exv1+7UUVHK2TDBAYmbaEh6o3lmT9cxyMlwY+9OSD+slEnrl7lyHFx
    WrcxiEXRhE6q7ehtJJjvROZ/afj6zAPlBb4jj/gkjiFIe49WxGYG6Cx9GGE1yXTLkelhju
    WHdrBJbYW+bq8wC6k5YX9r4Mxu7VkvlSQhFlHh3BMKYh+CN/IN662bkIAHs5o3SSZ/K2iS
    A8IdYg7RSNgzQ+QDt5UBChN7LBzPx9zhwZFIyJgTrM4DGVsu181f/cv84zQnnu1SiOjt64
    Lqr92CvCrINMLFEULEspqfXM1g+1JLY2atLxqenIRwWdf5qC21esdFPmozmsWagzMiGXjW
    KzWckXKIdg2wp5/TxpG64hxHQ78epWvdbiDW0uB3WieMhR2i4hVQdgYHm9P1v/ho7FllJ/
    fQMzBJTIVjoV2Jg6I96MLZ0e/WntuCCHF5xAdtPFgt2akESF/TutjJ9C3TAQ
X-ME-Proxy: <xmx:AZR7aj7A_rbkDP1QDUu2YTfw2jv_3MWm3sbkyH9cj3VzthrojlIsMA>
    <xmx:AZR7agjqMTx37ZWpfySxXl47Sm6EhqJQGu0NLNilQqJe-eIMtiTMEg>
    <xmx:AZR7aoHQTLfB5lH2aE2W8kQXq_OZWro0Bhiew_Hb6T3Zx0AroZn0cQ>
    <xmx:AZR7auRqgbfc0yYIRnzvED6WwCR5a5njdyRNsSMVQ45lmYluOVqqag>
    <xmx:AZR7ai26mEru0SYVg2Hsg-OJhmva-tyxYYW3Xv7sT6IDah6n_Iz11Nkh>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 17:28:30 -0400 (EDT)
Message-ID: <87e52592-854f-4650-8a14-36e64a629d37@bsbernd.com>
Date: Tue, 11 Aug 2026 23:28:28 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] fuse: add io-uring buffer pools
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, libaokun@linux.alibaba.com,
 axboe@kernel.dk, amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-4-joannelkoong@gmail.com>
 <865afb18-533b-4542-86f8-c77215175c41@bsbernd.com>
 <CAJnrk1beAMwnaUANB6MyPv6Rqj8gZ5FaQZ80zrBA=JNA1vdyOA@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1beAMwnaUANB6MyPv6Rqj8gZ5FaQZ80zrBA=JNA1vdyOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/7/26 00:18, Joanne Koong wrote:
> On Thu, Aug 6, 2026 at 11:36 AM Bernd Schubert <bernd@bsbernd.com> wrote:
>>
>>> On 7/16/26 19:59, Joanne Koong wrote:
>>>
>>> @@ -1397,14 +1578,17 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
>>>       req->ring_queue = queue;
>>>       ent = list_first_entry_or_null(&queue->ent_avail_queue,
>>>                                      struct fuse_ring_ent, list);
>>> -     if (ent)
>>> -             fuse_uring_add_req_to_ring_ent(ent, req);
>>> -     else
>>> -             list_add_tail(&req->list, &queue->fuse_req_queue);
>>> -     spin_unlock(&queue->lock);
>>> +     if (ent) {
>>> +             if (!fuse_uring_prep_buffer(ent, req)) {
>>> +                     fuse_uring_add_req_to_ring_ent(ent, req);
>>> +                     spin_unlock(&queue->lock);
>>> +                     fuse_uring_dispatch_ent(ent);
>>> +                     return;
>>> +             }
>>> +     }
>>
>> Pure style, somehow "if (!fuse_uring_prep_buffer(ent, req))" reads like an
>> error case, *maybe*
>>
>>         ent = list_first_entry_or_null(&queue->ent_avail_queue,
>>                                        struct fuse_ring_ent, list);
>>         /* no idle entry, or no free pool buffer for this req */
>>         if (!ent || fuse_uring_prep_buffer(ent, req)) {
>>                 list_add_tail(&req->list, &queue->fuse_req_queue);
>>                 spin_unlock(&queue->lock);
>>                 return;
>>         }
>>
>>         fuse_uring_add_req_to_ring_ent(ent, req);
>>         spin_unlock(&queue->lock);
>>         fuse_uring_dispatch_ent(ent);
>>         return;
>>
>> err_unlock:
>> ...
>>
>> and similar in fuse_uring_ent_assign_req()
>>
>>         req = list_first_entry_or_null(req_queue, struct fuse_req, list);
>>         if (!req || fuse_uring_next_req_update_buffer(ent, req)) {
>>                 fuse_uring_recycle_buffer(ent);
>>                 return NULL;
>>         }
>>
>>         fuse_uring_add_req_to_ring_ent(ent, req);
>>         return req;
>>
>>
>> Just a pure style suggestion, though.
>>
> 
> Happy to make this change. Thanks for reviewing the patches. I'll wait
> until you have finished reviewing the other patches in this series
> before sending this.
> 
>>>
>>> -     if (ent)
>>> -             fuse_uring_dispatch_ent(ent);
>>> +     list_add_tail(&req->list, &queue->fuse_req_queue);
>>> +     spin_unlock(&queue->lock);
>>>
>>>       return;
>>>
>>> +struct fuse_bufpool {
>>> +     /* starting uaddr of the bufpool */
>>> +     uintptr_t base_uaddr;
>>> +
>>> +     /* size of each buffer in the pool */
>>> +     size_t buf_size;
>>> +
>>> +     /* total number of buffers in the pool */
>>> +     unsigned int nr_bufs;
>>> +
>>> +     /* bitmap tracking which buffers are free */
>>> +     unsigned long free_map[];
>>> +};
>>> +
>>>  /** A fuse ring entry, part of the ring queue */
>>>  struct fuse_ring_ent {
>>>       /* userspace buffer */
>>>       struct fuse_uring_req_header __user *headers;
>>> -     void __user *payload;
>>> +     struct iovec payload;
>>
>> Here I have a real concern. What is if fuse server sets up
>> really really large buffers, to thrash the CPUs?
>>
>> setup_fuse_copy_state() is now changed to
>>
>> -       err = import_ubuf(dir, ent->payload, ring->max_payload_sz, iter);
>> +       err = import_ubuf(dir, ent->payload.iov_base, ent->payload.iov_len,
>> +                         iter);
>>
>> And the iov is taken as it from the SQE. Is there actually a really good
>> reason to have the payload as iov, at least in this series? I could imagine
>> it might make sense to have it as iov once we make the buf pools more
>> dynamically usable.
>>
>> Could we restrict setup_fuse_copy_state() to ring->max_payload_sz?
> 
> The payload.iov fields are not taken directly from the bufpool sqe. It
> is assigned in fuse_uring_select_buffer() to reflect one buffer within
> the pool. ent->payload.iov_len is set to pool->buf_size, which in
> fuse_uring_add_bufpool(), we set pool->buf_size to be
> ring->max_payload_sz. Looking at import_ubuf() though, even if we did
> pass in the entire buffer pool size here, it is harmless, as the bytes
> copied are already limited/determined by the request (eg on the
> send-side, copies are bound by in-arg sizes and on the reply side,
> fuse_copy_out_args() rejects any payload_sz exceeding sum of the out
> args before doing any copying). Right now pools hand out buffers of
> the same size so iov_len tracking isn't needed, but pools will be
> handing out differently-sized buffers.

Yeah, I noticed later that it is actually not an issue, but had already
disassembled my equipment and didn't manage to reply before now.

> 
>>
>>> +
>>> +     /* buffer id in the pool, if bufpools are used. ignored otherwise */
>>> +     unsigned int buf_id;
>>>
>>> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
>>> index cfb055c0c764..f7173b5d4321 100644
>>> --- a/include/uapi/linux/fuse.h
>>> +++ b/include/uapi/linux/fuse.h
>>>  /**
>>> @@ -1312,6 +1322,14 @@ struct fuse_uring_cmd_req {
>>>       /* queue the command is for (queue index) */
>>>       uint16_t qid;
>>>       uint8_t padding[6];
>>> +
>>> +     union {
>>> +             struct {
>>> +                     /* base address of bufpool */
>>> +                     uint64_t uaddr;
>>> +                     uint32_t len;
>>> +             } bufpool;
>>
>>
>> Ok, if we ever want to add a new bufpool, I guess we could
>> invent "struct { } bufpool2;". Personally I would have
>> preferred to have an index in here, currently always set
>> to 0, but not a strict requirement.
>>
> 
> If we ever want to add a new bufpool, I think it'd be cleaner for the
> kernel to assign the bufpool id and pass it back in the cqe to the
> FUSE_IO_URING_CMD_ADD_BUFPOOL cmd rather than the server assigning it.
> With server-supplied indexes, we would have to also track / prevent
> collisions, gaps, out-of-range values, etc.

Dunno what your plans with that are, but I would take that number as
opaque user-space identifier and not something to be used by fuse
kernel. In my mind without coding, I would put the bufpools into a list
without an index that fuse kernel would use. IMHO it only needs to check
if any pool in the list has free bufs.
Anyway, while I would prefer to have the userspace identifier in the
struct, that is not a blocker and we can add it in bufpool2 when we have
actual usage. Or userspace needs to use the identfier from io-uring and
we use that, as you suggest.

Thanks,
Bernd
