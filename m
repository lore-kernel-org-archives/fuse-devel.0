Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF5830D41D
	for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 20:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787172779; cv=none; b=LSyZNmM3tRxSYA061nKS6G109Imp2u64AzsuReeg8TqvjWnAvzIEkNyn+zsy8KhkEaYR02wYaEbmQLLVayt01vQHqUpdOxvvfqNYBV4497V1fGenjiOrC+S5GlY6SbSwevjuyEh6gQFkiEhjBIFZWnxT99dfqowadPHm2fzW1w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787172779; c=relaxed/simple;
	bh=EaKmd+tLqoRh7cIpnA9GRDFc6ApaW6ORZbtjlRCKEo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kHiOg4RWaNpZmB6sxo0BLVK12yvRa+hRWYCpQ+UfaSUecasGSnfs0IbaRS/W6H/vfEvxsHOWiQVHZM63mwa66e1DoWJynpcbfa/lPQ7EK9ZGN8UphJ6JhrB44Y1qfcUy1H+ip5ZtWeCWVTdTZsVXaJm4n/O1r42h9KU+O9EnURg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=Fdvri/vs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g8Lnpay4; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="Fdvri/vs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g8Lnpay4"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 85A711D00065;
	Wed, 19 Aug 2026 16:52:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 19 Aug 2026 16:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787172777;
	 x=1787259177; bh=xa4vQGfFkbQeRBE7clkfTVkUBejUyVonzj9zwbo9hJY=; b=
	Fdvri/vsV6BIFtdIPzUOVVFQ1G7hwUCP42M6rzDOiANVLReLlI7SaPDSuvc9d5+t
	RUmntFGvXnZV5KOWE32i8RRSmb1crFZuTVdWDACwZEonCo9X4OVD/KaR1eioYY/7
	REZGGjR0w1voirjae7M2z/PwdAnQAK8UZOUnw+vxCqaNqvUsok9N50ThQ44CD5jK
	e1w0GKFkMKXsD/3zKFU68AmQVnJf+haB33PHNi6rfms9QgTjKCJnUAlYgYILkoCJ
	x9zFBOUemdyNCyxhnXTRH1pTtI3UHRQl6vzcVF3BkLPCoBLZU9KYoem/Z9ezyLhh
	zNaOfpNAKjJR9yJHvKB1rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787172777; x=
	1787259177; bh=xa4vQGfFkbQeRBE7clkfTVkUBejUyVonzj9zwbo9hJY=; b=g
	8Lnpay4OY7Tr/UV74s0ZgzWphEqSNCHpb2XpnHReVLzFg/tS8Uk/7BuminQ6ABWc
	b/cOl6kGq9jiaupMtoEvRatsVnYxKXz6mZM/sayr33G6d5iT4RMCvHVuEQsj9oy2
	Rtva3ZHtGTIgreFjcl8kI3dkrBNwAMrw2jbf346zORU3fEzjisSrY3PyVaLQqX9C
	MZf8zuPMuAyf7kS5zFtDxgLTmGwoRQUG5hi+egJnNrPBgzyvuauZ++LfVXPW5m8x
	9WYDQXi9/dx+J/7E4vPMGAYOc5orCNB6wuPIuj5Fax0DcK1C91mHNkoaoL/xgZKy
	fasJpRz3Ql5P4oBRzcDuw==
X-ME-Sender: <xms:qBeGavnAmjuKUZprTHtJaFJfNg1Gh8cepiWXOGr2JTuPI4jPjHlzDw>
    <xme:qBeGajhOf8xB8qH0ouL2of9gGr4FXM69CGZqa27BFFrrSedGd9YeSG3yKLQ7Sa6UB
    Cm29-XIp-2ES0LeO0V06Mkf5kbKSRkpFXO2kFyPceOYAtsl0sU>
X-ME-Received: <xmr:qBeGaj1yz2XmDtHahP7Ib7ad9NnmVKbwZofukAQoaboFXxlxRbjTKFP_ounoncqkKSI9KEjrnZjtceN2sSh9GHS3iU5g0YlDcbhKZRcePRdDaER5tgfNodm0dA>
X-ME-Proxy-Cause: dmFkZTEotFPSGv5uCBnOrWEG8KCdBitFeNOniS26pKB4zQQ6qcy3UVxx2DmUOfDqQTJ/H2
    oEmN0olnhyAZpdp9Bj0dNIswN1xev+4EbRKLnGIXvk0w3Nu0xm7eb5A4oCiCse1p6q191i
    eGNWpqY5Vt5+cXRhunpuXSW9Af/amvWKJasX1UWEcUg4NyZls1l2ljKUFI7ZP87RN/cWkB
    5yPn4FdwUI5tqcsR9PaTda4pHKiDiA717g4XO+axdx1VatHyPmpOXRs2WxLc+FPhJpqGTk
    vjGepfWLgXXQTi1L+zG1S1YpQ4wRrMAVrPnY0GdER7DhlJhw1aEUQacOmZ+VnvnTmk44TL
    FN+ob4lRg4RSJBDsxHT3nXxvuaiH4QZISQds41AmwNZh3jl9LbPu/m1/vo5/joiqHLunLo
    AYCInuuSj5j14WLMNud92GgJO3B7Dzouh3P2Zi1pY6wIwqXlnPHJA38DsdBRj2DB0HwqRq
    IPeZRw7kQDsE6YiqzpRMukvfrEhmTLlrnkqh0jqko3UKi9MjKeWeUAtozv7kSSKPcPDQHc
    ABP3jotIc80gXxDEDB9l6oM2VAOh/M2ZzJ3rnybuoqpEqlGKV+8mPdhi4M3rkMgSd53rSr
    5i/U7nVEYEkOFv/JAYi+lRHIgb7zeXkx7LyIPhZdr6IECLPfQgF9zHkeBdiw
X-ME-Proxy: <xmx:qBeGasLRf0IvBKfWHm_suXweLAz9gVxwPiruHKFcuQR4nO6-vrFeGw>
    <xmx:qBeGajz3kjXVeL2W_QfU6HjVQl4e1eQMqQcqiTRmq1eqqJfLbO9Eww>
    <xmx:qBeGaqUnbFtGuNhUBEHHfALp_dxBx5rnEZ1q3PJbhffDM3e7oYtNvA>
    <xmx:qBeGajjdU07AdT7l_wT9sTkWh1TakLNxfcq1u29tBsToD9bcFalnQA>
    <xmx:qReGavGgMIuvKDAXYi7hxZJiAPx-TDE7AojfOnIGTg12bsDdZx17gcRE>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Aug 2026 16:52:55 -0400 (EDT)
Message-ID: <ce65de6a-2c80-492e-b256-7e6e1ead9aa8@bsbernd.com>
Date: Wed, 19 Aug 2026 22:52:53 +0200
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
Cc: Miklos Szeredi <miklos@szeredi.hu>, jlayton@kernel.org,
 libaokun@linux.alibaba.com, axboe@kernel.dk, amir73il@gmail.com,
 fuse-devel@lists.linux.dev
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
 <20260814185946.3679478-2-joannelkoong@gmail.com>
 <CAJfpegt2NTn27A_QoMnfb8gDLZpRc9WHzWW6wGBjWc+nvJxg=A@mail.gmail.com>
 <CAJnrk1bocn3zSUe23E4F6oTNyosmF8kdVdFB-2hX2qbSqx-LDA@mail.gmail.com>
 <f0cc2fd8-bf0a-4722-b81c-d54fbafd00a7@bsbernd.com>
 <CAJnrk1Z_ioW02xbrUekpzSJNerHL=XH-VYqHmUXFzyUD4HDNdQ@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1Z_ioW02xbrUekpzSJNerHL=XH-VYqHmUXFzyUD4HDNdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/19/26 22:29, Joanne Koong wrote:
> On Wed, Aug 19, 2026 at 1:05 PM Bernd Schubert <bernd@bsbernd.com> wrote:
>>
>>
>>
>> On 8/19/26 19:56, Joanne Koong wrote:
>>> On Wed, Aug 19, 2026 at 4:35 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>>>
>>>> On Fri, 14 Aug 2026 at 21:00, Joanne Koong <joannelkoong@gmail.com> wrote:
>>>>>
>>>>> Currently, the connection's fuse_ring is created lazily on the first
>>>>> FUSE_IO_URING_CMD_REGISTER command. A server registers entries from one
>>>>> thread per queue (one per CPU) and those threads issue their first
>>>>> REGISTER command concurrently. They then race to create the single
>>>>> per-connection fuse_ring, which required open-coded handling in
>>>>> fuse_uring_create() to detect and protect against concurrent creations.
>>>>>
>>>>> Decouple fuse_ring creation from ent registration and move it to
>>>>> FUSE_INIT reply processing after a server has negotiated and set
>>>>> FUSE_OVER_IO_URING. The ring is published before the connection is
>>>>> marked initialized. fuse_uring_register() no longer creates the ring and
>>>>> it instead uses the ring set up at init time.
>>>>
>>>> I tested this with loraw (a "raw" loopback tester that doesn't use
>>>> libfuse) and it fails with
>>>>
>>>> root@kvm:~# ./loraw -u  /mnt/fuse
>>>> loraw: loraw.c:1010: lo_start_uring: Assertion `!cqe->res' failed.
>>>>
>>>> cqe->res is -22 (EINVAL).
>>>>
>>>> Attaching the reproducer.  To compile:
>>>>
>>>> cp $(KERNEL_TREE)/include/uapi/linux/fuse.h fuse_kernel.h
>>>> gcc loraw.c -oloraw -luring
>>>>
>>>
>>> Thanks for attaching the repro.
>>>
>>> This is happening because this patch uses the FUSE_OVER_IO_URING init
>>> reply as a signal that the ring should be created, but I missed that
>>> the FUSE_OVER_IO_URING reply is *optional*.
>>>
>>> Prior to this patch, there's two scenarios:
>>> a) server sets FUSE_OVER_IO_URING reply at init time - requests will
>>> automatically block until fuse-io-uring is completely set up
>>> b) server does not set FUSE_OVER_IO_URING but later sends uring
>>> register request - requests will continue along /dev/fuse path until
>>> fuse-io-uring is completely set up
>>>
>>> Libfuse sets FUSE_OVER_IO_URING in the reply, but the loraw.c server does not.
>>>
>>> I think the best way to fix this is to have the ring creation happen
>>> when the kernel receives the first io-uring command instead of at
>>> FUSE_INIT or at FUSE_IO_URING_CMD_REGISTER ent creation time, given
>>> that FUSE_IO_URING_ADD_QUEUE needs the ring to exist:
>>
>> I don't think we should allow io-uring without FUSE_OVER_IO_URING and
>> I really thought that was disabled.
> 
> This is pre-existing behavior that's been there since the beginning
> (kernel version 6.14) [1]. I don't think we can change this now, or
> it'll break backwards compatibility, like Miklos's loraw program.
> 
>>
>> <... checking the code ...>
>>
>> I'm on a ublk branch without your commits a applied, i.e. plain upstream 7.2 fuse
>>
>> fuse_uring_cmd()
>>         /* Once a connection has io-uring enabled on it, it can't be disabled */
>>         if (!enable_uring && !fch->io_uring) {
>>                 pr_info_ratelimited("fuse-io-uring is disabled\n");
>>                 return -EOPNOTSUPP;
>>         }
>>
>>
>>
>> In process_init_reply()
>>
>> if (flags & FUSE_OVER_IO_URING && fuse_uring_enabled())
>>     fuse_chan_io_uring_enable(fc->chan);
>>
> 
> The condition check in fuse_uring_cmd() is an && and not an ||. It

Aaaarg. That makes the entire condition useless :(

> doesn't enforce that the server must have sent over FUSE_OVER_IO_URING
> in the init reply to use fuse io-uring. With enable_uring=1 (which is
> needed for the kernel to advertise FUSE_OVER_IO_URING in the init
> request in the first place), the fuse io-uring logic proceeds
> regardless of whether the server replied with the FUSE_OVER_IO_URING
> flag or not.
> 
> Thanks,
> Joanne
> 
> [1] https://elixir.bootlin.com/linux/v6.14-rc1/source/fs/fuse/inode.c#L1455

The comment there is definitely outdated, at least it was *supposed* to.

Well, then we have a problem because we have a lock order inversion
issue. After adding in the reduce-queue series I had planned to work on
distributing fch->num_background among queues, so that each queue gets
its own num_background, so that holding two locks like in
fuse_uring_queue_bq_req() wouldn't be needed anymore.

Also again, without FUSE_OVER_IO_URING reply the condition in
fuse_block_alloc() doesn't make any sense.


Thanks,
Bernd
