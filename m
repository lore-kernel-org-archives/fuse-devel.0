Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACE117A300
	for <fuse-devel@lists.linux.dev>; Fri, 21 Aug 2026 03:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283489; cv=none; b=RgP3UqjjnuhARJTeRqEaoCayjSD19sBx7QKaFwrJhppF5hhkIaGrzUfUq1huihcllslkJBmuKfSbyl7JdOPzpsaojuGBf2OkyP54bDZIM9N1aeuclw83g7cuEc4aeWvkGTOOD4Gyu/MAVfbG2F0AYZZM5P1VxEqmWtKIvvfzkco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283489; c=relaxed/simple;
	bh=XEgYbUNB9kuPVtGB3vZNHrRWfekGWTYCINujxDrNPAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jvlTMUom0RGtUsMVxwMeIFHejuZx1jul7H3YrQPgU/OioSxu/H4vvRM+YBKzbJk/1igFilFCiYWZGDHKx3OCof22fZUEjhIBycpMnUwVbvudIeHSyowKuFs4a5h5HsLNkBhSTQ5HN0JYT5vyiWTLSzOHiXIInJ2StNO1rhxv6u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=u82eCogE; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="u82eCogE"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787283482; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=z6MjVqUQKZ9bvzn6AHVPCESoZgIGzx9GU/J1VOzfHdk=;
	b=u82eCogE3NXlu1Kc68pr635EO2doaMmd5ZMbu2HaDz7PvXURpBaM1Tb8VuXVEffcSNzYsqtjaZXUH89AHevQPVKPqS1w8CdJvx6i5XQKytTUj3BZ2X6WrdhLkDykUgw5XP+CD+pZpQe/Ev+6MBMQr+b8FYV6v9TxJLN0/f6gSYw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R271e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X9L.k7n_1787283481;
Received: from 30.221.131.126(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X9L.k7n_1787283481 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 21 Aug 2026 11:38:02 +0800
Message-ID: <f41796b8-161c-4380-9073-615ed45c995c@linux.alibaba.com>
Date: Fri, 21 Aug 2026 11:38:01 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] fuse: decouple fuse_ring creation from ent
 registration
To: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>
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
 <CAJnrk1YfHOqcoNhCS=ukMiOH436_NzSVtNiPLpSw6fqWDhKGjA@mail.gmail.com>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <CAJnrk1YfHOqcoNhCS=ukMiOH436_NzSVtNiPLpSw6fqWDhKGjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2026/8/21 01:46, Joanne Koong wrote:
> On Thu, Aug 20, 2026 at 10:20 AM Bernd Schubert <bernd@bsbernd.com> wrote:
>>
>>
>> On 8/20/26 18:16, Joanne Koong wrote:
>>> On Thu, Aug 20, 2026 at 1:02 AM Baokun Li <libaokun@linux.alibaba.com> wrote:
>>>> Hi all,
>>>>
>>>> On 2026/8/20 04:05, Bernd Schubert wrote:
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
>>>> I share Bernd's concern here. Allowing io-uring without
>>>> FUSE_OVER_IO_URING means enabling a capability beyond what was
>>>> negotiated. We should honor the negotiated feature set, and print
>>>> the negotiated flags to dmesg at INIT time so issues like this are
>>>> easy to spot.
>>> Not sure if you missed this reply [1], but will copy and paste it here:
>>>
>>> This is pre-existing behavior that's been there since the beginning
>>> (kernel version 6.14). I don't think we can change this now, or
>>> it'll break backwards compatibility, like Miklos's loraw program.
>>>
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
> I don't think a new FUSE_OVER_IO_URING2 flag helps. If the kernel
> ignores FUSE_OVER_IO_URING as you describe, servers using older
> versions of libfuse will break. If it accepts both flags, it's
> behaviorally identical to just enforcing FUSE_OVER_IO_URING.
>
>> fuse-server to set flags that fuse-server doesn't even announce...
>>
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

Makes sense — separating dequeue from send eliminates the nesting
structurally.


Cheers,
Baokun

