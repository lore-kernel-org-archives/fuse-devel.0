Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CBC394793
	for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 18:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787250475; cv=none; b=Ura2voOQ6Cre59oxAXP2+sX5um3ecKhOKm9p7NJ2jBDuldnV5mkGPWQTW/kYim2oEQOKL2WzhbvjsQClTgeUnJNRJSS4y45SWHic3UFj1BOVO+4z00Kw5Mu/za5ZDOfHEUAZn2nbcdHHxuuxM866W2F035DGzcb4X9FyleA3vE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787250475; c=relaxed/simple;
	bh=LM4hDNcxQvlQ7hNFy4B8F+GxbMiFf/Zwm87C4iJQYME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aeGyLUNQ46yuCKKoWE05OxGM9VzpPwiK6h5ewj4meYJsBbv266Q+rQlP0/0Mw2AXkvoCVK/nsosaFZH0ZjmrM0tYeIzUlOtKrRlhpkuefgmmsl4334kNwlri6wIbFbOcCVIHGaS/93v9YxxOWShCGh2OeoWOPf06dXHq0uDKGho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=CuLmKdZH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Sbg6ziL5; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="CuLmKdZH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Sbg6ziL5"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id B69A9EC017E;
	Thu, 20 Aug 2026 14:27:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 20 Aug 2026 14:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787250471;
	 x=1787336871; bh=jqSlI0ffAKwk9vpStiKIrvjwDibIt/Lz6+wOcLFidvo=; b=
	CuLmKdZHMYokpLrFgEDgc4x5labqIoGjH2twGvsew2irrKs1KWGXk+S7sWUssFOL
	2K9K33jzOyY4TPqSdPckLk7zhJzjWTv5Y4VO6jeV8H6y7Je9w+83b1pi2gUqQnGJ
	i0nTL0d0X/upMTJ52D2Zp36Roh8TgrXRr+rvtPWmnPjx2MdLfvPMfYxZvNNl4X9V
	7ItL2ENMl+sSiy9syqcLufpId3lpL4nqCYUSxIHiHvtw3aStCOBgBnPhOXd1XeHE
	vXwCM9IHAf30INU2XVxrifbeSFBYgzXOond0PuRxeWvVRpmug9kNlO94kfen04qv
	67v7rrJWk+vAJggdW3FESg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787250471; x=
	1787336871; bh=jqSlI0ffAKwk9vpStiKIrvjwDibIt/Lz6+wOcLFidvo=; b=S
	bg6ziL5ZDY292h29B7+POx8QLshdH/dofwOae/iYU3QkX4i6BQPLu9PEVvUYOdQJ
	odOH2fXkRFKILkHKt8+HysmuE1mK/X23mD6/qMOv/301Bs5IMG8GqJPCnQFW1pmC
	0BmmY4ptEbSyDcIDWx7q1N8SFWiCv1vy0SVJGNSAPZP2zgrv3xRHMZq58KttJzbM
	KtONyjN+TVV2OlXYkbHo/ScRPxxpyuDiovTFgIXy39z0smJSlmOYUaC9S7bLcp1D
	wD4m5Zdbdp1g44y8AfEYyCmdk7WR/75+Q1SzoBv0OUGIi2ZHKnUEW+wMd1lOGbzx
	MyrT4m9xGNkou1mui9A8w==
X-ME-Sender: <xms:JkeHal2BrN7KX2lXGoXEwb57v5CySy_akpmVUwFDILdLbQSprgzHnQ>
    <xme:JkeHaswQGEK2zp4WYJ5kcd8DNP8Q6MQxOqvqLwmqbLuaDU3rxKiaj3km_xym3yVjZ
    SXiEkp84zjLyTBvUV5hFMOdspbgYTAVk0n6IZJDqVl4-46jeJcCiw>
X-ME-Received: <xmr:JkeHakFDG2-3J61oMk_b797RMpgVwzrA9US2JwQ3pmcYF63jlZkYY7UFvNlfbroiJUOUhubYXk59hPhFBSvyQt17Nw18tRjxd2HZNrR9jEfo9Ry1qNcShrUctQ>
X-ME-Proxy-Cause: dmFkZTFx3pbWblrY+AfBIl4o+TnlY1Pi26JQZ6EGPRcks5J1AxZBk1eC2OBIH7yIRfpUVc
    Q9JKOCmDjnPsmXUUA17CywpxH0VdQL6gwK7cnGzArPtPUOp4VG9eYx14kfXnWJ9goozlxX
    9+v3eNUbFjroiIiZipAbLQ0O9/a/JlocvU2+Ux16OK5qFneBJxIpkfz7A5FCSSVMgxxeIz
    pgg066jPjjmj7OyXSHuD4eofcCMe9G81GCiWnZ65QrerCcYnBW3S4zAyLuSgvjw+Cu3a/F
    FGaTnNfbjZ1+fa6yJsucyp9/+mvNPzzpv56D+LdmUOHR0nVNP/StQ2Nsie2V3zNl1cI1EZ
    7u+lkBWqUiuTKNw2Pb9/asgkwklpYBXdbK/nSDTYhjYzZs174DILn0HG/cIisCGiYn+MC8
    yNozkMGFwCCkBqm7b1zNzxdDdowjWEBGPNBFYuo7fTVXdzUZ2tH29QyDlZTsxAJznnXoh7
    7bEQswmoMVFy8rL8fqROIa24829uF9BLSSr3n3kx2LlYQBLIPzYF+b/g/oifSSCwbDpXA8
    lT8fMHql4GIrdKuNZK4msRpabaEyZBnkWdbKkqCwaY6CnFQGttA0pkrJrGeVXiIAze4m7R
    fIDXjoefVEENZo2TpHMFZhJiqFOBThTEEmGDduBOJL4SOSLmhfBxLs7dYe0w
X-ME-Proxy: <xmx:JkeHanZoQX0Xm4W63f5enYiMK7LOSOVQSS4tgTdnxw4YZEbX8dfTTw>
    <xmx:JkeHauDZVS0Wm7Oc7Sz4ddT3or3U87Zum1QA1Z_jeqWdFM68Zbienw>
    <xmx:JkeHann_NRiJayYO7WpxTE7GyWoEuCMNb9neXXiSlAHLvtyyeWC8dQ>
    <xmx:JkeHanw6ndcK1HHGM5tlMfGTA5KkiO2N5W05G_4zdSgoiNVVzO16yg>
    <xmx:J0eHauX7N-rB3iLxgUibdl2jVyvKKpsQX7bPI3gt54ajaxSD4vJA3SEU>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Aug 2026 14:27:48 -0400 (EDT)
Message-ID: <85651260-19d4-4f15-9d87-4f47cd996cfa@bsbernd.com>
Date: Thu, 20 Aug 2026 20:27:46 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] fuse: decouple fuse_ring creation from ent
 registration
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Baokun Li <libaokun@linux.alibaba.com>, Miklos Szeredi
 <miklos@szeredi.hu>, jlayton@kernel.org, axboe@kernel.dk,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
 <20260814185946.3679478-2-joannelkoong@gmail.com>
 <CAJfpegt2NTn27A_QoMnfb8gDLZpRc9WHzWW6wGBjWc+nvJxg=A@mail.gmail.com>
 <CAJnrk1bocn3zSUe23E4F6oTNyosmF8kdVdFB-2hX2qbSqx-LDA@mail.gmail.com>
 <f0cc2fd8-bf0a-4722-b81c-d54fbafd00a7@bsbernd.com>
 <69545a14-e3ca-487c-a98d-b9f16b745c39@linux.alibaba.com>
 <CAJnrk1a0ztS6iSZvCFgFf6tH5W4rJM_BdgkJHLjjftJF8qeyNQ@mail.gmail.com>
 <fa10e184-8390-4e79-abfa-e0dcb6888da8@bsbernd.com>
 <CAJnrk1YfHOqcoNhCS=ukMiOH436_NzSVtNiPLpSw6fqWDhKGjA@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1YfHOqcoNhCS=ukMiOH436_NzSVtNiPLpSw6fqWDhKGjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/20/26 19:46, Joanne Koong wrote:
> On Thu, Aug 20, 2026 at 10:20 AM Bernd Schubert <bernd@bsbernd.com> wrote:
>>
>>
>>
>> On 8/20/26 18:16, Joanne Koong wrote:
>>> On Thu, Aug 20, 2026 at 1:02 AM Baokun Li <libaokun@linux.alibaba.com> wrote:
>>>>
>>>> Hi all,
>>>>
>>>> On 2026/8/20 04:05, Bernd Schubert wrote:
>>>>>
>>>>> On 8/19/26 19:56, Joanne Koong wrote:
>>>>>> On Wed, Aug 19, 2026 at 4:35 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>>>>>> On Fri, 14 Aug 2026 at 21:00, Joanne Koong <joannelkoong@gmail.com> wrote:
>>>>>>>> Currently, the connection's fuse_ring is created lazily on the first
>>>>>>>> FUSE_IO_URING_CMD_REGISTER command. A server registers entries from one
>>>>>>>> thread per queue (one per CPU) and those threads issue their first
>>>>>>>> REGISTER command concurrently. They then race to create the single
>>>>>>>> per-connection fuse_ring, which required open-coded handling in
>>>>>>>> fuse_uring_create() to detect and protect against concurrent creations.
>>>>>>>>
>>>>>>>> Decouple fuse_ring creation from ent registration and move it to
>>>>>>>> FUSE_INIT reply processing after a server has negotiated and set
>>>>>>>> FUSE_OVER_IO_URING. The ring is published before the connection is
>>>>>>>> marked initialized. fuse_uring_register() no longer creates the ring and
>>>>>>>> it instead uses the ring set up at init time.
>>>>>>> I tested this with loraw (a "raw" loopback tester that doesn't use
>>>>>>> libfuse) and it fails with
>>>>>>>
>>>>>>> root@kvm:~# ./loraw -u  /mnt/fuse
>>>>>>> loraw: loraw.c:1010: lo_start_uring: Assertion `!cqe->res' failed.
>>>>>>>
>>>>>>> cqe->res is -22 (EINVAL).
>>>>>>>
>>>>>>> Attaching the reproducer.  To compile:
>>>>>>>
>>>>>>> cp $(KERNEL_TREE)/include/uapi/linux/fuse.h fuse_kernel.h
>>>>>>> gcc loraw.c -oloraw -luring
>>>>>>>
>>>>>> Thanks for attaching the repro.
>>>>>>
>>>>>> This is happening because this patch uses the FUSE_OVER_IO_URING init
>>>>>> reply as a signal that the ring should be created, but I missed that
>>>>>> the FUSE_OVER_IO_URING reply is *optional*.
>>>>>>
>>>>>> Prior to this patch, there's two scenarios:
>>>>>> a) server sets FUSE_OVER_IO_URING reply at init time - requests will
>>>>>> automatically block until fuse-io-uring is completely set up
>>>>>> b) server does not set FUSE_OVER_IO_URING but later sends uring
>>>>>> register request - requests will continue along /dev/fuse path until
>>>>>> fuse-io-uring is completely set up
>>>>>>
>>>>>> Libfuse sets FUSE_OVER_IO_URING in the reply, but the loraw.c server does not.
>>>>>>
>>>>>> I think the best way to fix this is to have the ring creation happen
>>>>>> when the kernel receives the first io-uring command instead of at
>>>>>> FUSE_INIT or at FUSE_IO_URING_CMD_REGISTER ent creation time, given
>>>>>> that FUSE_IO_URING_ADD_QUEUE needs the ring to exist:
>>>>> I don't think we should allow io-uring without FUSE_OVER_IO_URING and
>>>>> I really thought that was disabled.
>>>>
>>>> I share Bernd's concern here. Allowing io-uring without
>>>> FUSE_OVER_IO_URING means enabling a capability beyond what was
>>>> negotiated. We should honor the negotiated feature set, and print
>>>> the negotiated flags to dmesg at INIT time so issues like this are
>>>> easy to spot.
>>>
>>> Not sure if you missed this reply [1], but will copy and paste it here:
>>>
>>> This is pre-existing behavior that's been there since the beginning
>>> (kernel version 6.14). I don't think we can change this now, or
>>> it'll break backwards compatibility, like Miklos's loraw program.
>>>
>>
>> I think we need to discuss this. I had replied that the current
>> accidental scheme we
>>
>> - deadlock (lock order), with bg_lock being one issue, but I bet there
>> is more
>> - module option bypass
>> - bypass of what fuse-client/kernel announces
>>
>> I.e. if a fuse-server did implement the accidental scheme, it was broken
>> anyway.
>>
>> If wanted to be paranoid, we would switch to FUSE_OVER_IO_URING2 flag
>> and ignore FUSE_OVER_IO_URING. I hope you don't insist on allowing
> 
> I don't think a new FUSE_OVER_IO_URING2 flag helps. If the kernel
> ignores FUSE_OVER_IO_URING as you describe, servers using older
> versions of libfuse will break. If it accepts both flags, it's
> behaviorally identical to just enforcing FUSE_OVER_IO_URING.

Well, setting a flag that is not announced by kernel is not ok
either. Yes, it is change in behavior, but it is debatable.

> 
>> fuse-server to set flags that fuse-server doesn't even announce...
>>
> 
> I think this is a call better left up to Miklos. I don't know how
> rigorously it is enforced in linux that nothing should break backwards
> compatibility. The code was released in March 2025 as part of kernel
> version 6.14, so it's been roughly a year and a half, which I guess
> isn't that long in the grand scheme of things, but if Miklos has his
> loraw server program that relies on this, it's probably likely there's
> other users out there who have servers that would similarly just break
> if we switch the policy now.
> 
> I haven't had time to look deeply at the lockdep thing you wrote
> about, but from a first glance, couldn't we fix it at the source?
> flush_bg_queue() calls ->send_req() while holding the fch->bg_lock
> which is what creates the bg_lock -> queue->lock deadlock. If it
> instead only does the background accounting under the lock and moves
> the requests to a caller-provided list where the caller only sends
> *after* dropping the bg_lock, doesn't that solve the deadlock? This
> would fix it for every server regardless of whether it sent
> FUSE_OVER_IO_URING or not. I'll try to get some time to look at this
> next week.

I have a basic patch for that, but I fear testing will bring up ore
issues when we switch at run time.

Let's discuss in a few min.


Thanks,
Bernd
