Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63D7357D0B
	for <fuse-devel@lists.linux.dev>; Fri, 21 Aug 2026 03:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787281505; cv=none; b=TXEYYw5FzcKwQV57p8WPpSRbpaicOBvFkxuZy13VCjPTscROVJj6vnhfz7AG/bJvtWyaL29AKPI1jQcePTKFvgpxh3EtKKf8e/1v4roWfCjxG53SJw8SjHJsqd0Xxll0hk3nKQWy3AM7g8JvbCQAZOfouw0SA02hx5517umGll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787281505; c=relaxed/simple;
	bh=BmNwHn2AJsw4rNvqyA0ZEVnsa/+8ld46ibF30TWN3gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bLEdXWSQyBV/wMyXi5F4yDpdULya6YSgDCAqMf4ZYd4ERanYpGPBgvUBK0+ILxU8nB5a4AaFsZ/rIuSH7x+OIPLKEQX1QwnS8NwOGffso2LiwLrzQ7uERWcllBvUJ3qD3s/AviNbEEwk/AAoMZRRD94DzYlWFuPE0ko9RIjF3pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=bGQtbl3a; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="bGQtbl3a"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787281492; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Br3QkJHlleAOtH+rDxnPCzx7tnyje53p1y5X/KgJzX0=;
	b=bGQtbl3ald/o+p0HKHVJJG6As+ZTif1wisE2cBTtIa6thwxHCw/Ga6DtYbjsrlz/qG+QkuQbq9g/tZZdtis19TFkwqt9afbcmOJ6t1U8QIUSFJTi9adnwMNGYYVI1gKM3UZcNT71c8/t0WghKHLhwEOLd6TvkulZTYaUxvdHK9I=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X9L.ZjD_1787281490;
Received: from 30.221.131.126(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X9L.ZjD_1787281490 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 21 Aug 2026 11:04:51 +0800
Message-ID: <bfdf3493-b208-4df0-89f0-0f14032814f0@linux.alibaba.com>
Date: Fri, 21 Aug 2026 11:04:50 +0800
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
Cc: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>,
 jlayton@kernel.org, axboe@kernel.dk, amir73il@gmail.com,
 fuse-devel@lists.linux.dev
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
 <20260814185946.3679478-2-joannelkoong@gmail.com>
 <CAJfpegt2NTn27A_QoMnfb8gDLZpRc9WHzWW6wGBjWc+nvJxg=A@mail.gmail.com>
 <CAJnrk1bocn3zSUe23E4F6oTNyosmF8kdVdFB-2hX2qbSqx-LDA@mail.gmail.com>
 <f0cc2fd8-bf0a-4722-b81c-d54fbafd00a7@bsbernd.com>
 <69545a14-e3ca-487c-a98d-b9f16b745c39@linux.alibaba.com>
 <CAJnrk1a0ztS6iSZvCFgFf6tH5W4rJM_BdgkJHLjjftJF8qeyNQ@mail.gmail.com>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <CAJnrk1a0ztS6iSZvCFgFf6tH5W4rJM_BdgkJHLjjftJF8qeyNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2026/8/21 00:16, Joanne Koong wrote:
> On Thu, Aug 20, 2026 at 1:02 AM Baokun Li <libaokun@linux.alibaba.com> wrote:
>> Hi all,
>>
>> On 2026/8/20 04:05, Bernd Schubert wrote:
>>> On 8/19/26 19:56, Joanne Koong wrote:
>>>> On Wed, Aug 19, 2026 at 4:35 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>>>> On Fri, 14 Aug 2026 at 21:00, Joanne Koong <joannelkoong@gmail.com> wrote:
>>>>>> Currently, the connection's fuse_ring is created lazily on the first
>>>>>> FUSE_IO_URING_CMD_REGISTER command. A server registers entries from one
>>>>>> thread per queue (one per CPU) and those threads issue their first
>>>>>> REGISTER command concurrently. They then race to create the single
>>>>>> per-connection fuse_ring, which required open-coded handling in
>>>>>> fuse_uring_create() to detect and protect against concurrent creations.
>>>>>>
>>>>>> Decouple fuse_ring creation from ent registration and move it to
>>>>>> FUSE_INIT reply processing after a server has negotiated and set
>>>>>> FUSE_OVER_IO_URING. The ring is published before the connection is
>>>>>> marked initialized. fuse_uring_register() no longer creates the ring and
>>>>>> it instead uses the ring set up at init time.
>>>>> I tested this with loraw (a "raw" loopback tester that doesn't use
>>>>> libfuse) and it fails with
>>>>>
>>>>> root@kvm:~# ./loraw -u  /mnt/fuse
>>>>> loraw: loraw.c:1010: lo_start_uring: Assertion `!cqe->res' failed.
>>>>>
>>>>> cqe->res is -22 (EINVAL).
>>>>>
>>>>> Attaching the reproducer.  To compile:
>>>>>
>>>>> cp $(KERNEL_TREE)/include/uapi/linux/fuse.h fuse_kernel.h
>>>>> gcc loraw.c -oloraw -luring
>>>>>
>>>> Thanks for attaching the repro.
>>>>
>>>> This is happening because this patch uses the FUSE_OVER_IO_URING init
>>>> reply as a signal that the ring should be created, but I missed that
>>>> the FUSE_OVER_IO_URING reply is *optional*.
>>>>
>>>> Prior to this patch, there's two scenarios:
>>>> a) server sets FUSE_OVER_IO_URING reply at init time - requests will
>>>> automatically block until fuse-io-uring is completely set up
>>>> b) server does not set FUSE_OVER_IO_URING but later sends uring
>>>> register request - requests will continue along /dev/fuse path until
>>>> fuse-io-uring is completely set up
>>>>
>>>> Libfuse sets FUSE_OVER_IO_URING in the reply, but the loraw.c server does not.
>>>>
>>>> I think the best way to fix this is to have the ring creation happen
>>>> when the kernel receives the first io-uring command instead of at
>>>> FUSE_INIT or at FUSE_IO_URING_CMD_REGISTER ent creation time, given
>>>> that FUSE_IO_URING_ADD_QUEUE needs the ring to exist:
>>> I don't think we should allow io-uring without FUSE_OVER_IO_URING and
>>> I really thought that was disabled.
>> I share Bernd's concern here. Allowing io-uring without
>> FUSE_OVER_IO_URING means enabling a capability beyond what was
>> negotiated. We should honor the negotiated feature set, and print
>> the negotiated flags to dmesg at INIT time so issues like this are
>> easy to spot.
> Not sure if you missed this reply [1], but will copy and paste it here:
>
> This is pre-existing behavior that's been there since the beginning
> (kernel version 6.14). I don't think we can change this now, or
> it'll break backwards compatibility, like Miklos's loraw program.

Yes, I saw it, but pre-existing doesn't necessarily mean correct.
Enabling capabilities beyond what was negotiated easily introduces
inconsistencies.

In our recent hardening work we found that the fch->io_uring switch
causes anomalies in several mechanisms (mostly in our downstream tree),
which is why I replied in Bernd's thread — he raised the
enable_uring / fch->io_uring bypass there.

>>> <... checking the code ...>
>>>
>>> I'm on a ublk branch without your commits a applied, i.e. plain upstream 7.2 fuse
>>>
>>> fuse_uring_cmd()
>>>       /* Once a connection has io-uring enabled on it, it can't be disabled */
>>>       if (!enable_uring && !fch->io_uring) {
>>>               pr_info_ratelimited("fuse-io-uring is disabled\n");
>>>               return -EOPNOTSUPP;
>>>       }
>> BTW, the current code clears fch->io_uring on REGISTER failure:
>>
>>                 if (err) {
>>                         fch->io_uring = 0;
>>                         wake_up_all(&fch->blocked_waitq);
>>                         return err;
>>                 }
>>
>> But by then other entries may have already registered successfully,
>> fiq->ops is switched to fuse_io_uring_ops, and requests are flowing
>> through the uring path. Clearing fch->io_uring here may reject all
>> subsequent io_uring commands with -EOPNOTSUPP while the data path
>> is still running on uring ops.
>>
> This is also pre-existing behavior. The check in fuse_uring_cmd() is a
> && not an ||. It'll only return -EOPNOTSUPP if admin disables
> enable_uring.

Yes, that's exactly the problem. Right now we have several flags
with unclear boundaries:

  enable_uring: user-controlled, can be toggled at any time
  fch->io_uring: set to 1 at INIT negotiation, but cleared to 0
      on any entry registration failure — even if other entries
      have already registered successfully and fiq->ops has been
      switched to uring ops. The two states are inconsistent.
  ring->ready: set when at least one entry has registered

I think the clean design would be: at INIT time, decide based on
enable_uring and the negotiated flags whether to initialize uring
and set fch->io_uring. After that, enable_uring is no longer
consulted — fch->io_uring is write-once. When ring->ready (at
least one entry registered), take the io_uring path; otherwise
fall back to the classic /dev/fuse path. This way each
variable has a single, clear semantic.


Thanks,
Baokun

