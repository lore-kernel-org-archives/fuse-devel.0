Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99743374756
	for <fuse-devel@lists.linux.dev>; Fri, 21 Aug 2026 03:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787282664; cv=none; b=roBK/m8uf3Q9nhXvL+XMwk9cC1qUiHQTmFxCiul2gKHrBDwicpzjcvsCFXgYZkPJSJBynNJB6igubeARm4w7rDBgcOxsE2LCPnKV0BwtD8UkXvl4Baick69cSHnD0jQkKKoP1JwUe/gNAHdZ3xXTGNvJFt8y7OPUNgrIx7wPubo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787282664; c=relaxed/simple;
	bh=RhwI/3hZLJqwCEvUMFEDYV+sSCZ38Ibd5zqDP+XjfGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bynL1WPRu8ZKoE0tm2NWt141tQrc7y10MR8JwM+t3T/iDvPa3pV3SX1s55Ta3ywh8jtW1Levqjr80Zsezu2SIEaObWvO9Hc6+VZruylO1zDahkol7zSCQMo/GhQUdnryK/HN8wLffC2tP+sspjSTHmC02jnfydq/Ik/ZMgpVgew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=xJL24I+h; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="xJL24I+h"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787282649; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=PaY7/7rIICP75IjsORsz/mSmYbrTClZXLMRDaunpFfk=;
	b=xJL24I+h5kBnvoQ7vvkjt56uGjSJtjnq8mi9HE3p1N24VtZ9V/Y/jdJhoreZDurfVhRu6wBPytHug5ZPcwVAQ/eQtN+Fu9kLCfX7kzBLVlEnZXT2qxmhCz7ptiJUzxPQBKgQBOBIUvkNbJjx2V5anlIXomQbL7vcshBjhlZKmmo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X9KxZK0_1787282648;
Received: from 30.221.131.126(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X9KxZK0_1787282648 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 21 Aug 2026 11:24:09 +0800
Message-ID: <00b36c50-5ab6-40a2-bd64-3c8d93fa83cb@linux.alibaba.com>
Date: Fri, 21 Aug 2026 11:24:08 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] fuse: decouple fuse_ring creation from ent
 registration
To: Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, jlayton@kernel.org, axboe@kernel.dk,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
 <20260814185946.3679478-2-joannelkoong@gmail.com>
 <CAJfpegt2NTn27A_QoMnfb8gDLZpRc9WHzWW6wGBjWc+nvJxg=A@mail.gmail.com>
 <CAJnrk1bocn3zSUe23E4F6oTNyosmF8kdVdFB-2hX2qbSqx-LDA@mail.gmail.com>
 <f0cc2fd8-bf0a-4722-b81c-d54fbafd00a7@bsbernd.com>
 <69545a14-e3ca-487c-a98d-b9f16b745c39@linux.alibaba.com>
 <CAJnrk1a0ztS6iSZvCFgFf6tH5W4rJM_BdgkJHLjjftJF8qeyNQ@mail.gmail.com>
 <fa10e184-8390-4e79-abfa-e0dcb6888da8@bsbernd.com>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <fa10e184-8390-4e79-abfa-e0dcb6888da8@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2026/8/21 01:20, Bernd Schubert wrote:
>
> On 8/20/26 18:16, Joanne Koong wrote:
>> On Thu, Aug 20, 2026 at 1:02 AM Baokun Li <libaokun@linux.alibaba.com> wrote:
>>> Hi all,
>>>
>>> On 2026/8/20 04:05, Bernd Schubert wrote:
>>>> On 8/19/26 19:56, Joanne Koong wrote:
>>>>> On Wed, Aug 19, 2026 at 4:35 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>>>>> On Fri, 14 Aug 2026 at 21:00, Joanne Koong <joannelkoong@gmail.com> wrote:
>>>>>>> Currently, the connection's fuse_ring is created lazily on the first
>>>>>>> FUSE_IO_URING_CMD_REGISTER command. A server registers entries from one
>>>>>>> thread per queue (one per CPU) and those threads issue their first
>>>>>>> REGISTER command concurrently. They then race to create the single
>>>>>>> per-connection fuse_ring, which required open-coded handling in
>>>>>>> fuse_uring_create() to detect and protect against concurrent creations.
>>>>>>>
>>>>>>> Decouple fuse_ring creation from ent registration and move it to
>>>>>>> FUSE_INIT reply processing after a server has negotiated and set
>>>>>>> FUSE_OVER_IO_URING. The ring is published before the connection is
>>>>>>> marked initialized. fuse_uring_register() no longer creates the ring and
>>>>>>> it instead uses the ring set up at init time.
>>>>>> I tested this with loraw (a "raw" loopback tester that doesn't use
>>>>>> libfuse) and it fails with
>>>>>>
>>>>>> root@kvm:~# ./loraw -u  /mnt/fuse
>>>>>> loraw: loraw.c:1010: lo_start_uring: Assertion `!cqe->res' failed.
>>>>>>
>>>>>> cqe->res is -22 (EINVAL).
>>>>>>
>>>>>> Attaching the reproducer.  To compile:
>>>>>>
>>>>>> cp $(KERNEL_TREE)/include/uapi/linux/fuse.h fuse_kernel.h
>>>>>> gcc loraw.c -oloraw -luring
>>>>>>
>>>>> Thanks for attaching the repro.
>>>>>
>>>>> This is happening because this patch uses the FUSE_OVER_IO_URING init
>>>>> reply as a signal that the ring should be created, but I missed that
>>>>> the FUSE_OVER_IO_URING reply is *optional*.
>>>>>
>>>>> Prior to this patch, there's two scenarios:
>>>>> a) server sets FUSE_OVER_IO_URING reply at init time - requests will
>>>>> automatically block until fuse-io-uring is completely set up
>>>>> b) server does not set FUSE_OVER_IO_URING but later sends uring
>>>>> register request - requests will continue along /dev/fuse path until
>>>>> fuse-io-uring is completely set up
>>>>>
>>>>> Libfuse sets FUSE_OVER_IO_URING in the reply, but the loraw.c server does not.
>>>>>
>>>>> I think the best way to fix this is to have the ring creation happen
>>>>> when the kernel receives the first io-uring command instead of at
>>>>> FUSE_INIT or at FUSE_IO_URING_CMD_REGISTER ent creation time, given
>>>>> that FUSE_IO_URING_ADD_QUEUE needs the ring to exist:
>>>> I don't think we should allow io-uring without FUSE_OVER_IO_URING and
>>>> I really thought that was disabled.
>>> I share Bernd's concern here. Allowing io-uring without
>>> FUSE_OVER_IO_URING means enabling a capability beyond what was
>>> negotiated. We should honor the negotiated feature set, and print
>>> the negotiated flags to dmesg at INIT time so issues like this are
>>> easy to spot.
>> Not sure if you missed this reply [1], but will copy and paste it here:
>>
>> This is pre-existing behavior that's been there since the beginning
>> (kernel version 6.14). I don't think we can change this now, or
>> it'll break backwards compatibility, like Miklos's loraw program.
>>
> I think we need to discuss this. I had replied that the current
> accidental scheme we
>
> - deadlock (lock order), with bg_lock being one issue, but I bet there
> is more
> - module option bypass
> - bypass of what fuse-client/kernel announces
>
> I.e. if a fuse-server did implement the accidental scheme, it was broken
> anyway.

Agreed. A server that skips FUSE_OVER_IO_URING was never in a
well-defined state — no blocking guarantee, no lock ordering
protection, nothing. There is nothing to preserve compatibility
with.


Thanks,
Baokun

