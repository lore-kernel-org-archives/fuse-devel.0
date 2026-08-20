Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773FE3101A5
	for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 08:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212954; cv=none; b=EzOjxWdZFMxqTH03Dxm8WLC5Wf4/zDC9ocJaDNeb5jbGDvUo85jfsT72yrCNiwZ8sX5YoGzRoZnzms/7j9kzBSRRwSS2+fsg6pGFFDvrFjfcG1p9hOQwX++SAnJzRMdf+K4RKs4bNjG4PuJhQczSTYg1DpGxRFlaFG0qpbpmhN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212954; c=relaxed/simple;
	bh=oDNtL9q6PA9lWND/Kj/icXSwDPZdkWeac2v+tsTXka4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFd5mKPkWXrF0Nm/GVKT1irqknQYLr8CX9dPNwWB4h2MGZRbhcsJYgK0occjMgqV5/OvP9cZPN1D+kjbOBujq+Vlsv8xrMpVoIfhINMSJh/ik84nqqX23ihYKem0xJp/Ey94sTKqQeM5/y+dJpQ8bv04Mc0optIGId0up0Trcxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Asg6sron; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Asg6sron"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787212942; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=sLJR9NjgHayWyT8bSiX/XNWBjS9Rx97OdUV5ydVYrrw=;
	b=Asg6sronZshtcxtdjsLnmK75H1fnfkIzdZrWJeYyz1Bk/SThsxbSqTXxplZr/EHG8XizLFB2uGuRaOMh+hDYTM8b17n7lQFx1qAdfgoDtZI5gksrwNR3i0foO3s5Bkjs/5NqH6WFZWM9ArNRLGmtc2KI1Nh6jVsLIiIbFMY4OYo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R691e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X9IqXA8_1787212941;
Received: from 30.221.131.226(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X9IqXA8_1787212941 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 20 Aug 2026 16:02:22 +0800
Message-ID: <69545a14-e3ca-487c-a98d-b9f16b745c39@linux.alibaba.com>
Date: Thu, 20 Aug 2026 16:02:21 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] fuse: decouple fuse_ring creation from ent
 registration
To: Bernd Schubert <bernd@bsbernd.com>, Joanne Koong
 <joannelkoong@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: jlayton@kernel.org, axboe@kernel.dk, amir73il@gmail.com,
 fuse-devel@lists.linux.dev
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
 <20260814185946.3679478-2-joannelkoong@gmail.com>
 <CAJfpegt2NTn27A_QoMnfb8gDLZpRc9WHzWW6wGBjWc+nvJxg=A@mail.gmail.com>
 <CAJnrk1bocn3zSUe23E4F6oTNyosmF8kdVdFB-2hX2qbSqx-LDA@mail.gmail.com>
 <f0cc2fd8-bf0a-4722-b81c-d54fbafd00a7@bsbernd.com>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <f0cc2fd8-bf0a-4722-b81c-d54fbafd00a7@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

On 2026/8/20 04:05, Bernd Schubert wrote:
>
> On 8/19/26 19:56, Joanne Koong wrote:
>> On Wed, Aug 19, 2026 at 4:35 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>> On Fri, 14 Aug 2026 at 21:00, Joanne Koong <joannelkoong@gmail.com> wrote:
>>>> Currently, the connection's fuse_ring is created lazily on the first
>>>> FUSE_IO_URING_CMD_REGISTER command. A server registers entries from one
>>>> thread per queue (one per CPU) and those threads issue their first
>>>> REGISTER command concurrently. They then race to create the single
>>>> per-connection fuse_ring, which required open-coded handling in
>>>> fuse_uring_create() to detect and protect against concurrent creations.
>>>>
>>>> Decouple fuse_ring creation from ent registration and move it to
>>>> FUSE_INIT reply processing after a server has negotiated and set
>>>> FUSE_OVER_IO_URING. The ring is published before the connection is
>>>> marked initialized. fuse_uring_register() no longer creates the ring and
>>>> it instead uses the ring set up at init time.
>>> I tested this with loraw (a "raw" loopback tester that doesn't use
>>> libfuse) and it fails with
>>>
>>> root@kvm:~# ./loraw -u  /mnt/fuse
>>> loraw: loraw.c:1010: lo_start_uring: Assertion `!cqe->res' failed.
>>>
>>> cqe->res is -22 (EINVAL).
>>>
>>> Attaching the reproducer.  To compile:
>>>
>>> cp $(KERNEL_TREE)/include/uapi/linux/fuse.h fuse_kernel.h
>>> gcc loraw.c -oloraw -luring
>>>
>> Thanks for attaching the repro.
>>
>> This is happening because this patch uses the FUSE_OVER_IO_URING init
>> reply as a signal that the ring should be created, but I missed that
>> the FUSE_OVER_IO_URING reply is *optional*.
>>
>> Prior to this patch, there's two scenarios:
>> a) server sets FUSE_OVER_IO_URING reply at init time - requests will
>> automatically block until fuse-io-uring is completely set up
>> b) server does not set FUSE_OVER_IO_URING but later sends uring
>> register request - requests will continue along /dev/fuse path until
>> fuse-io-uring is completely set up
>>
>> Libfuse sets FUSE_OVER_IO_URING in the reply, but the loraw.c server does not.
>>
>> I think the best way to fix this is to have the ring creation happen
>> when the kernel receives the first io-uring command instead of at
>> FUSE_INIT or at FUSE_IO_URING_CMD_REGISTER ent creation time, given
>> that FUSE_IO_URING_ADD_QUEUE needs the ring to exist:
> I don't think we should allow io-uring without FUSE_OVER_IO_URING and 
> I really thought that was disabled. 

I share Bernd's concern here. Allowing io-uring without
FUSE_OVER_IO_URING means enabling a capability beyond what was
negotiated. We should honor the negotiated feature set, and print
the negotiated flags to dmesg at INIT time so issues like this are
easy to spot.

>
> <... checking the code ...>
>
> I'm on a ublk branch without your commits a applied, i.e. plain upstream 7.2 fuse
>
> fuse_uring_cmd()
> 	/* Once a connection has io-uring enabled on it, it can't be disabled */
> 	if (!enable_uring && !fch->io_uring) {
> 		pr_info_ratelimited("fuse-io-uring is disabled\n");
> 		return -EOPNOTSUPP;
> 	}

BTW, the current code clears fch->io_uring on REGISTER failure:

                if (err) {
                        fch->io_uring = 0;
                        wake_up_all(&fch->blocked_waitq);
                        return err;
                }

But by then other entries may have already registered successfully,
fiq->ops is switched to fuse_io_uring_ops, and requests are flowing
through the uring path. Clearing fch->io_uring here may reject all
subsequent io_uring commands with -EOPNOTSUPP while the data path
is still running on uring ops.

fch->io_uring is a protocol fact — the daemon negotiated
FUSE_OVER_IO_URING at INIT time. A single REGISTER failure should
not regress it, at least not once the ring is ready. The daemon
can retry; the negotiated capability should be permanent.


Thanks,
Baokun


