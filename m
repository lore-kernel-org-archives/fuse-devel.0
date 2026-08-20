Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C56447F2FF
	for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 17:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246418; cv=none; b=cb7pvGZJgTihlM86dNZ74o08MB8bTBvEslgJ0qeE9oJ5fUvsZ9l2TAOsV+0sx4L+X1IekneWrUDQATxfYLdbSLAZ6VNSgNuFqnVeFNLfqoy315z87a6GXmMCxpnYuYwqmyAlQOaFKEPGWRIE+pADh+aKgtImfEHkZkhC8tYkIvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246418; c=relaxed/simple;
	bh=nqeNI4CE20ZY1JIUxe1+nSAIYlpmu5LM7PbuTODBAjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=haYCW8XlSCuUdRgaNVDPAjGJrkMDh6kSj27nnn1b+N+0YPpifJ3ALy8RwfKt7CXMN/SJLF4znkLbC20sferlkwrT6ep3QTWkhZQYaYJiIXv2wHkbM5QDhbHFZYnKVZlODscH9yeU2fp/vGK9Mf5K17/xDiBtrDFeAblEGaDQ9PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=RUv7wn09; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YmOcnuuP; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="RUv7wn09";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YmOcnuuP"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id CA74DEC01EC;
	Thu, 20 Aug 2026 13:20:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 20 Aug 2026 13:20:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787246413;
	 x=1787332813; bh=h74+OeFPaIt6Y1yTMie03LrxKEWB0+g0emYu33t3cyk=; b=
	RUv7wn09IEPw9ph2/ht3bHyDk6C3ihnv0lT1blQy6yYeBkVjBQLyrGwBWRRWo2Cr
	wt9xJg/W2w7In8uFeZm02p5kcLX9um+WPoGV3lCBRPw7UsHQc1KyvlRfK9vnBVbG
	K0Qhlma17YevSWlpSZauJ9BWmwe/PBJ7wuucStCb8CqFr1KUEj1/QsOWEZrYOs2L
	SqCaq4C2zdrpkqJ9EEFIv4IKv1FQ1zFhZ4MbRcQOEdmJ5XD4VGoaYYdliU0svU2S
	dkIGUErMQBMrvcj7xY+UFcqXJQRuGkSVNWAMrf8rWEv9/3XoichD7OZjlV0ltg/y
	h+hOHRUT9i8tZSqGRS09SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787246413; x=
	1787332813; bh=h74+OeFPaIt6Y1yTMie03LrxKEWB0+g0emYu33t3cyk=; b=Y
	mOcnuuPmRLhV4lfDUrZKuqp+ls7IWw01eko2FR2O9BNeiDX8QDq91txEKCP4vx2q
	SYAK+iVP49AoUULGFZDuBLQiMxtB4iUTj8GSKVJ74GZRyPZjJY1BqlTDqmyorEfM
	3YmPb4fndYwdvbSZkTlfCL+P+WaCJAUiOgXiz/WcSuaedDQd2DUcRuiNcyLsBaWW
	tlsR68rAfLSHjls+XjTjOk3Go2NQ/FwRaPoP1fJMdC4MWGnr3UU/qjk2lDeCV++e
	ffJ/d5zi0Im9q3l3C5Di7/8LFuO4g8Jt6lqKD0cdlO1nzciisMnUNkf9OG2oLY/a
	vPs6kObuzFx/Pg52vZLMg==
X-ME-Sender: <xms:TTeHaq_gZ_xP3_lVpL5ptMb64yHYXGJa2ooBxvX_Fdo7J77WhhfPHg>
    <xme:TTeHarZSGz5-YKPICXLRds83oeyHeTiQLC785X3c209DY_5v_XqUQR0XkDqtRFnnu
    xrB8NFL3NTJbYJZgUPPFsA-c2fx_5eybjPpYu8GqkHctsCtRDlg0g>
X-ME-Received: <xmr:TTeHauOPblmjldNuClu9LgLHZWGAgPX12G-ahYGpSRQVNh-LtPRWAaTAjdNw7dlWrhcMid8JZmx-VJWgu8JDbAMnAh40-wj2LNpyID4PhykEWTMpZMRP7MVvjQ>
X-ME-Proxy-Cause: dmFkZTEUjNV2/W7L/KdZQGnw2uZPKO2BXzpuqFVGwEPzqeYJTujNlcFYNdbntxKcqiherC
    DSsXXW+GXovmvKb5JEFjdxhfLdru3UgqNcAB+zLxenj0UYE2y2pAxP8JbAsr8UTfkOSrqm
    mfYuwyPM/DFq8oBXqdCVjFt5YQul4Fgr2JlmQ6XJN74j67Le2eJ1QDTPyncmGbfShbCNt5
    AXsRevdIWcOtkK9iah7Tdio7MwpM3LecaioyX2oUvFpbWSgntFPL7K6GuASWu05k0Fm24c
    ljikdWbz6YHfEl+48297j+HLo/gokyxi3rwmCJkMbQpKtr9cc346sN2Vb+hEkz6BUmB/gX
    0y4UWe3L92PsMhOhW7TdAR+vU5fNw6rIZR1eeFXPUiEm42gfKCVcKdgcNasrgmu9rGIX7n
    MVnyF7Hrgmpv+5W3GGHkVrFJstMQDwtsEFy66POf46JCcBTJNdlQ+ghLppV8XgTPmoSsln
    i8lWiBQPxY7REc292nbYMAQDNtABEQlbFGR4aeHaCkc3XKJVUAXeBzRlgqzuE5Q98UGivx
    TtUhMjaAO63Z5u47Wl2OKCDzMqg8GZV40TULeDY6esNHweT1z1//z2Az1/AOKi5Awmx0lf
    THWdT8ke0KdrP4m1iYUS2S3nb2dKUOY7h99nrE7DnTvzFwdKLWUNTu2DW94A
X-ME-Proxy: <xmx:TTeHanCV6jqVe3vPhMAjq8a4VqEoXF7nPU8apj0e0v9nDwkIQfYYIQ>
    <xmx:TTeHalKcPi9OtGIE7aO2WwZGzD5AHGWStxF-17MEvaxcXiOyWtFC7A>
    <xmx:TTeHagM2GyTWsUSTpoqa4ZG9SZLFNcjiz0EMGuBNUfxGNvx8ko-x0Q>
    <xmx:TTeHaj5vbcp1_p16Wn0lRz7dgIKx36GbDrDqZrm9QSrUKHLHTcp1fw>
    <xmx:TTeHav_sy0od_M_dx_0SS_b1HF7wI2WoddR28a-6BD3nddGyYG9byR2o>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Aug 2026 13:20:10 -0400 (EDT)
Message-ID: <fa10e184-8390-4e79-abfa-e0dcb6888da8@bsbernd.com>
Date: Thu, 20 Aug 2026 19:20:07 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] fuse: decouple fuse_ring creation from ent
 registration
To: Joanne Koong <joannelkoong@gmail.com>,
 Baokun Li <libaokun@linux.alibaba.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, jlayton@kernel.org, axboe@kernel.dk,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
 <20260814185946.3679478-2-joannelkoong@gmail.com>
 <CAJfpegt2NTn27A_QoMnfb8gDLZpRc9WHzWW6wGBjWc+nvJxg=A@mail.gmail.com>
 <CAJnrk1bocn3zSUe23E4F6oTNyosmF8kdVdFB-2hX2qbSqx-LDA@mail.gmail.com>
 <f0cc2fd8-bf0a-4722-b81c-d54fbafd00a7@bsbernd.com>
 <69545a14-e3ca-487c-a98d-b9f16b745c39@linux.alibaba.com>
 <CAJnrk1a0ztS6iSZvCFgFf6tH5W4rJM_BdgkJHLjjftJF8qeyNQ@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1a0ztS6iSZvCFgFf6tH5W4rJM_BdgkJHLjjftJF8qeyNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/20/26 18:16, Joanne Koong wrote:
> On Thu, Aug 20, 2026 at 1:02 AM Baokun Li <libaokun@linux.alibaba.com> wrote:
>>
>> Hi all,
>>
>> On 2026/8/20 04:05, Bernd Schubert wrote:
>>>
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
>>
>> I share Bernd's concern here. Allowing io-uring without
>> FUSE_OVER_IO_URING means enabling a capability beyond what was
>> negotiated. We should honor the negotiated feature set, and print
>> the negotiated flags to dmesg at INIT time so issues like this are
>> easy to spot.
> 
> Not sure if you missed this reply [1], but will copy and paste it here:
> 
> This is pre-existing behavior that's been there since the beginning
> (kernel version 6.14). I don't think we can change this now, or
> it'll break backwards compatibility, like Miklos's loraw program.
> 

I think we need to discuss this. I had replied that the current
accidental scheme we

- deadlock (lock order), with bg_lock being one issue, but I bet there
is more
- module option bypass
- bypass of what fuse-client/kernel announces

I.e. if a fuse-server did implement the accidental scheme, it was broken
anyway.

If wanted to be paranoid, we would switch to FUSE_OVER_IO_URING2 flag
and ignore FUSE_OVER_IO_URING. I hope you don't insist on allowing
fuse-server to set flags that fuse-server doesn't even announce...

Thanks,
Bernd
