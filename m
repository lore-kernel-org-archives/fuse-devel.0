Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9806945628F
	for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618868; cv=none; b=LD4hE5U0T1x9Mi74TXUroo4YnzpVobHr2dohGB8AVkUTqgtBMH+4NYs7qPVLN1sZJ+oxKHs8kq7ezvxPGwL8GiQ7gaU6XBTBRnnHuNnio0u6pYFAEzwVpoY/Rk/O9q7z3zp8aLwYBg+cmtHH8SO8SiHBwLWDzCCm05YmrWZa69g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618868; c=relaxed/simple;
	bh=buCUQAMZ41VaxQnz4Oj8/raDLXthokPzKuZ9jT91xn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DfoP94Utb0uuE1GPs7077WuULM17prqaj+hqb2Exs4aifKRlE6D3U+pwTL9ioWljxk92ZkFx65fSlImecDUKHIv1aF7ZwteIOE+FM4O5vN6UXM2kp7nn22eaJdIz1cR7tdUrfVKXf3VVFrehdL5W1r/UeB/iadWm2JjSo05L0lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=g/06DoPx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FiZ5inWN; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="g/06DoPx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FiZ5inWN"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9E11B7A0114;
	Thu, 13 Aug 2026 07:00:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 13 Aug 2026 07:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786618855;
	 x=1786705255; bh=AFTgmgsNwb8k8YdFVtxgmyQxLgKjikyvfk3vsWdHSQo=; b=
	g/06DoPxM6PhgvGdTXpHVYxew/Qb63ZXROAE1GQ4IXPqx7s1JviZq1L5PNNtm9ga
	eeP8VWgWRMzZbwLSJVP+e6FKMmEwagxntyJa9jxhnPyyxq6c6tGc2h1qvwIp+EO0
	d9hqYaweMU+0XZoI/JDuWlCVYCnFeAUP3fq3I+TxEU28xeSkIdbe9GSBvMhku/cd
	L18acY+KlDtJX7Evly48HnJHEizC8h/0hy1r4q2Q+zNji4EYqgISmTOVkhTKI2AW
	fSQPrF9eNKjFLkTL2PzmFwEMFGRfRhbOY0MKZq8wQom1srK7ltX4HwpbTSSt7uac
	DoOac3jR4gZQt/Ydyi8BZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786618855; x=
	1786705255; bh=AFTgmgsNwb8k8YdFVtxgmyQxLgKjikyvfk3vsWdHSQo=; b=F
	iZ5inWNVEkJd+mtYO1MQeS288iKYMjrIqBWHkPJCrjkjxbOnz1Rt1Va3G9QgdVtO
	CkD6IkaFINqdg8SVTqWU2tcIdSHPHd4J0esKYbpIDcdtQgFS4I3IkorgdAoVO6Lu
	cQH3o3DPO9W+CrKAoEmjg5fyN1MIMqdkSwnKdM212gTbOIze4Zf+3ziZXKvtEki2
	V653T6c0Ym7n8THLJ/jckICEdv3Hc3U0ujk7EH6TAGq1aNFSMCi4PZZSHJNZUZTZ
	Duw4vh/q/a4qslYkERMh1KYmcUwkuTUPGNHwnVKgaN8KDpvLD0bVV/jdxDfsudHp
	x0h1IiAKfcIEx6Er5o3+w==
X-ME-Sender: <xms:5aN9amAKa8FNWXQFzwflRv-z3X4Oqb9VSqj-FEa3vSl-komyaTFFhA>
    <xme:5aN9ahMZFeVDsRsArkVjO91TLDKPQIUIiaz0265rSSPJnFb9EYUzHSCE1smEzRJjx
    syl1n9-Zv0oS9Wo1ZxBFUB8D4H9I8Y64nQSWkSXz2huHl64Nrj9CA>
X-ME-Received: <xmr:5aN9anyTu10zvv-gF1JUyBqd2qQTgI33wzYTgWg9AkA34h63eRE7rywhhAuM85i2hyx7yjNaOSSoVmPLWjcHNsnnNITrPCAbLqyAXSbLSjyZ5lAbw5eg5GC2>
X-ME-Proxy-Cause: dmFkZTFChU0l17PwWkb7ND7+B8DfjODFef5797kApV426U5RjLmXxx0d5WekgQNCXro8Sx
    DUsiv0pjfW8/FnLi/uYn+s7arJ9w5O2YKs6vuw0PKCn7e5O2RI2EWlJ6esvjIRzLVVGNOC
    jLFZWzGl0QoUbgg8qB/Epb5cvPzYkd7Lv5XQG/dSD/2F50Is/HKjVGCWWs4sZY6lrPDcwb
    MaMqNthH3Y44qUUUyxcIoVQvk5PABv+BwP0XJ77sPR2twVcvwg69Cheroi3WtP7JfhUWGM
    CX9YF0ktg9a7jBmeTgOfHskObJY3GrThcMNhO2qsyiAmrAuvjOMvAwVp9Dkf7ileOX7AIs
    PLVyVUNryKQCkDKfmWYx53y7nhHSGoyu8IBXsPihAAMJLw/qz1X3iO9lWKzPB1SHE3Ccik
    CNZuq1eMIbdFIrJpFxnuAR+JroatsVCwvWyewnqBBMb5IRm9YOobZVs5eMEjlTUi2Lpqhi
    JL+4/cwMgIMmfHkU2DYUZ0mFo8uP87Th1JzyK0EGJucokC4dvL/W+nt30TwQSd7mYKrp2D
    YB3fOJHJos0yKM3NPIR8KdIpMmMTqRPl6yXp4e7g4maSultdYPRw8QmHSNClSefeBbVdr3
    I5dzwBOMnwXTX3SG+wvb0cdjZhatiRF0+GvPtRmlC9VXfZTPJ1OobQSrpbLQ
X-ME-Proxy: <xmx:5aN9apWT_D9-U7-VUWNBWnw0SGrN9xhBhFeY9Zp3Mb0w5e07Sgm5dg>
    <xmx:5aN9ahMQWeLUeuWeVLUz5dYvQZBRrg2rboH_BGUNFujl5BsrbMtQLA>
    <xmx:5aN9ajDlST6E2MnnsqA_hATHtxIevMtAOVQc8QVklc0baGL8LbMZ9w>
    <xmx:5aN9amdzLGWXgGnIEaXK4FbGXzI0NGpRJUAFiQVFHwUyCSkEIpZ4tA>
    <xmx:56N9arTJdBUuJJ_af2mrggoe5M4N8rKuLilaWsxUPhmuKFItSOh5bHef>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 07:00:52 -0400 (EDT)
Message-ID: <0c85a312-cc12-4f28-a675-0576540e3a00@bsbernd.com>
Date: Thu, 13 Aug 2026 13:00:50 +0200
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
 <87e52592-854f-4650-8a14-36e64a629d37@bsbernd.com>
 <CAJnrk1bsqY=SAovPYBxPM9fSSQT7eU9seEez2fQqSGRVqpUpXA@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1bsqY=SAovPYBxPM9fSSQT7eU9seEez2fQqSGRVqpUpXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/13/26 00:38, Joanne Koong wrote:
> On Tue, Aug 11, 2026 at 2:28 PM Bernd Schubert <bernd@bsbernd.com> wrote:
>>
>>
>> On 8/7/26 00:18, Joanne Koong wrote:
>>> On Thu, Aug 6, 2026 at 11:36 AM Bernd Schubert <bernd@bsbernd.com> wrote:
>>>>
>>>>> On 7/16/26 19:59, Joanne Koong wrote:
>>>>>
>>>>> @@ -1397,14 +1578,17 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
>>>>>       req->ring_queue = queue;
>>>>>       ent = list_first_entry_or_null(&queue->ent_avail_queue,
>>>>>                                      struct fuse_ring_ent, list);
>>>>> -     if (ent)
>>>>> -             fuse_uring_add_req_to_ring_ent(ent, req);
>>>>> -     else
>>>>> -             list_add_tail(&req->list, &queue->fuse_req_queue);
>>>>> -     spin_unlock(&queue->lock);
>>>>> +     if (ent) {
>>>>> +             if (!fuse_uring_prep_buffer(ent, req)) {
>>>>> +                     fuse_uring_add_req_to_ring_ent(ent, req);
>>>>> +                     spin_unlock(&queue->lock);
>>>>> +                     fuse_uring_dispatch_ent(ent);
>>>>> +                     return;
>>>>> +             }
>>>>> +     }
>>>>
>>>> Pure style, somehow "if (!fuse_uring_prep_buffer(ent, req))" reads like an
>>>> error case, *maybe*
>>>>
>>>>         ent = list_first_entry_or_null(&queue->ent_avail_queue,
>>>>                                        struct fuse_ring_ent, list);
>>>>         /* no idle entry, or no free pool buffer for this req */
>>>>         if (!ent || fuse_uring_prep_buffer(ent, req)) {
>>>>                 list_add_tail(&req->list, &queue->fuse_req_queue);
>>>>                 spin_unlock(&queue->lock);
>>>>                 return;
>>>>         }
>>>>
>>>>         fuse_uring_add_req_to_ring_ent(ent, req);
>>>>         spin_unlock(&queue->lock);
>>>>         fuse_uring_dispatch_ent(ent);
>>>>         return;
>>>>
>>>> err_unlock:
>>>> ...
>>>>
>>>> and similar in fuse_uring_ent_assign_req()
>>>>
>>>>         req = list_first_entry_or_null(req_queue, struct fuse_req, list);
>>>>         if (!req || fuse_uring_next_req_update_buffer(ent, req)) {
>>>>                 fuse_uring_recycle_buffer(ent);
>>>>                 return NULL;
>>>>         }
>>>>
>>>>         fuse_uring_add_req_to_ring_ent(ent, req);
>>>>         return req;
>>>>
>>>>
>>>> Just a pure style suggestion, though.
>>>>
>>>
>>> Happy to make this change. Thanks for reviewing the patches. I'll wait
>>> until you have finished reviewing the other patches in this series
>>> before sending this.
>>>
>>>>>
>>>>> -     if (ent)
>>>>> -             fuse_uring_dispatch_ent(ent);
>>>>> +     list_add_tail(&req->list, &queue->fuse_req_queue);
>>>>> +     spin_unlock(&queue->lock);
>>>>>
>>>>>       return;
>>>>>
>>>>> +struct fuse_bufpool {
>>>>> +     /* starting uaddr of the bufpool */
>>>>> +     uintptr_t base_uaddr;
>>>>> +
>>>>> +     /* size of each buffer in the pool */
>>>>> +     size_t buf_size;
>>>>> +
>>>>> +     /* total number of buffers in the pool */
>>>>> +     unsigned int nr_bufs;
>>>>> +
>>>>> +     /* bitmap tracking which buffers are free */
>>>>> +     unsigned long free_map[];
>>>>> +};
>>>>> +
>>>>>  /** A fuse ring entry, part of the ring queue */
>>>>>  struct fuse_ring_ent {
>>>>>       /* userspace buffer */
>>>>>       struct fuse_uring_req_header __user *headers;
>>>>> -     void __user *payload;
>>>>> +     struct iovec payload;
>>>>
>>>> Here I have a real concern. What is if fuse server sets up
>>>> really really large buffers, to thrash the CPUs?
>>>>
>>>> setup_fuse_copy_state() is now changed to
>>>>
>>>> -       err = import_ubuf(dir, ent->payload, ring->max_payload_sz, iter);
>>>> +       err = import_ubuf(dir, ent->payload.iov_base, ent->payload.iov_len,
>>>> +                         iter);
>>>>
>>>> And the iov is taken as it from the SQE. Is there actually a really good
>>>> reason to have the payload as iov, at least in this series? I could imagine
>>>> it might make sense to have it as iov once we make the buf pools more
>>>> dynamically usable.
>>>>
>>>> Could we restrict setup_fuse_copy_state() to ring->max_payload_sz?
>>>
>>> The payload.iov fields are not taken directly from the bufpool sqe. It
>>> is assigned in fuse_uring_select_buffer() to reflect one buffer within
>>> the pool. ent->payload.iov_len is set to pool->buf_size, which in
>>> fuse_uring_add_bufpool(), we set pool->buf_size to be
>>> ring->max_payload_sz. Looking at import_ubuf() though, even if we did
>>> pass in the entire buffer pool size here, it is harmless, as the bytes
>>> copied are already limited/determined by the request (eg on the
>>> send-side, copies are bound by in-arg sizes and on the reply side,
>>> fuse_copy_out_args() rejects any payload_sz exceeding sum of the out
>>> args before doing any copying). Right now pools hand out buffers of
>>> the same size so iov_len tracking isn't needed, but pools will be
>>> handing out differently-sized buffers.
>>
>> Yeah, I noticed later that it is actually not an issue, but had already
>> disassembled my equipment and didn't manage to reply before now.
>>
>>>
>>>>
>>>>> +
>>>>> +     /* buffer id in the pool, if bufpools are used. ignored otherwise */
>>>>> +     unsigned int buf_id;
>>>>>
>>>>> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
>>>>> index cfb055c0c764..f7173b5d4321 100644
>>>>> --- a/include/uapi/linux/fuse.h
>>>>> +++ b/include/uapi/linux/fuse.h
>>>>>  /**
>>>>> @@ -1312,6 +1322,14 @@ struct fuse_uring_cmd_req {
>>>>>       /* queue the command is for (queue index) */
>>>>>       uint16_t qid;
>>>>>       uint8_t padding[6];
>>>>> +
>>>>> +     union {
>>>>> +             struct {
>>>>> +                     /* base address of bufpool */
>>>>> +                     uint64_t uaddr;
>>>>> +                     uint32_t len;
>>>>> +             } bufpool;
>>>>
>>>>
>>>> Ok, if we ever want to add a new bufpool, I guess we could
>>>> invent "struct { } bufpool2;". Personally I would have
>>>> preferred to have an index in here, currently always set
>>>> to 0, but not a strict requirement.
>>>>
>>>
>>> If we ever want to add a new bufpool, I think it'd be cleaner for the
>>> kernel to assign the bufpool id and pass it back in the cqe to the
>>> FUSE_IO_URING_CMD_ADD_BUFPOOL cmd rather than the server assigning it.
>>> With server-supplied indexes, we would have to also track / prevent
>>> collisions, gaps, out-of-range values, etc.
>>
>> Dunno what your plans with that are, but I would take that number as
>> opaque user-space identifier and not something to be used by fuse
>> kernel. In my mind without coding, I would put the bufpools into a list
>> without an index that fuse kernel would use. IMHO it only needs to check
>> if any pool in the list has free bufs.
>> Anyway, while I would prefer to have the userspace identifier in the
>> struct, that is not a blocker and we can add it in bufpool2 when we have
>> actual usage. Or userspace needs to use the identfier from io-uring and
>> we use that, as you suggest.
> 
> I don't really have a preference here. I can add a zero-enforced
> "uint32_t reserved" field in to keep this choice open-ended for now,
> that could be repurposed to hold an id in the future, if that becomes
> necessary. Even without this though, I don't think we would need a
> separate bufpool2 - I think we could just use "flags" to indicate
> multi-bufpool, and have an "id" field added to the struct.

I'm also ok with just a flag, we both just need to be make sure that 
nothing else gets added below the union for ABI compat. On 64 bit 
systems there should be padding, but 32 bit arch is not excluded.
The alternative would be a something like 


		 * created with FUSE_URING_ZERO_COPY. On a non-zero-copy queue
		 * this must be 0
		 */
		uint16_t ent_zero_copy_buf_index;

		/* To enforce a specific size for the union on all CPU archs */
		uin64_t for_union_size[2];
	};




Thanks,
Bernd
