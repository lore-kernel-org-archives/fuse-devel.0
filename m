Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9023D903B
	for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 21:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787175351; cv=none; b=ZgKZOUUT8gRgR56627BD+iMVwrMmlZKVklJSpI65YvpzRw1lz0qexL68C4pE+jxFgpcU/zV/0JSrHm+GrofbZ63RUSu0gLfqptvtcI5P6Ci+DIhkH6lgWt7ujs43o/zoXLTFXp0N7NMgLk9CixvTCuwUJt2j6GYErUGjEoaOK5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787175351; c=relaxed/simple;
	bh=7UXcmAh3DXJvKGZcAiF2PwXbU374ONL/D9MNDnJ4TSA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WHGdBuNA97rsonYOXVjI9h2YFksiLaUejD7WykFDSiIJmmTC657HHUg1GlcyM7yLN8082WgUWF+s33rI8Tp1FMCE+EsWG3qBOpHEfGBpr6GMid3iw/cphFc/YDD/HWoA4R8MS7uD+DmMmPDlDDhkZPYljPQLtW7+7Di1KQ4g4DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=MG+SlfRa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RYIrQzZ1; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="MG+SlfRa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RYIrQzZ1"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A65147A003D;
	Wed, 19 Aug 2026 17:35:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 19 Aug 2026 17:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787175344;
	 x=1787261744; bh=sRIRF+geQnAFjzI2w/llc+++zNV2YUEMQErNZkFuRbM=; b=
	MG+SlfRaByaWcHi3ysxxiNynYNa9zXE+eKWGqC5FZabhKtE/Fq/9F5wcSmGhcQCg
	XLdcC0I2Im8XNpZSGdtLbZIg6l6LYxGCCvieZE98rjHL+7dctGgbVyqu0u+NBdBS
	c5a5ITyigYgIZhxOwD2Yw8Am0EkiZiWGEbsHTYV1aT9oPO02yKHqkVVQ5P8jVu3N
	WjzKN5NJN9HXuZoU/HJQ7nS/y2Z9QgxXJMHrsx1y4nh4dCm77vTyYV45hwwVfpQ3
	0GZhdz5ZvSdQHIqCiWPTPGTcYwe+ILjmfyt1sfyqjVJWMlcTtkewdBhQAXR1qCRB
	Y7e6iomsO05GP79hKGBnfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787175344; x=
	1787261744; bh=sRIRF+geQnAFjzI2w/llc+++zNV2YUEMQErNZkFuRbM=; b=R
	YIrQzZ1EaKdSFa9JrfZXldJ7B32Bh4d3lxAuTiR3Vn2ZXbUIXfZHpZVqwCB0JjbS
	uM6OV3vjtsEVVm7ZsDjd+zTi+DsEVQ/hngj7FDUHFFDJfbCBjWmzAvr/aMq1fbsa
	3nK8pJoIU3ZcPBX2orJ08vSZYVMaHCRu1JboJWqzHRtmxlelzjPaikJRfcgeuE3e
	5pqiYSzzrSJvFR5yFZk1gjdvSYDZZ2CqkghWZIX7JBbwLKdFD5rqYO1tsGSYGE4S
	3FpxrouNYLM4T2dAjPfXgCl0C54EYo1yg9VQxMMkP3k35LOt+5LuUvKaFA/htFIq
	MwciU5fOK5zcA73vLAoZw==
X-ME-Sender: <xms:ryGGalRvZoEMD6Ewu-ykycB69qF4q-Wi8_Px42nb76w-IN0dYKlL9w>
    <xme:ryGGavdMwiiD-psgAuv2kRgwsAqaRBSnzFiRrk5VBPGJfk9rj7FVZaK9t0zsHQmsY
    5pA-NY1x-Vv3SDWODDMUn3AIDiQAHXRXaY3hBogkN0YwxaNWbKQCQ>
X-ME-Received: <xmr:ryGGapCDSVlqPCrUS0S_1-qt7XVH3It73EOjCeEDwlnPla-htiy4A24jMt044D3EKJ7awHb2EfDPdpQw1QfQq0IvduS_0-8MmNft6yuGRhxK55xRLn7Enghw7A>
X-ME-Proxy-Cause: dmFkZTEItcpLKqtSOz/qDKBh+gc7Fd0Qpa3s8HUVWgmlVc67Sqq7d7Ka8Mg86bAh4YI7ay
    Sm92mgcv7sznmbtLBjUr7GkZeEfppLzZ9Ofjl3jzEMjYfLWdYX3G01MtjL7/0qW0pBSUUS
    8wbLGPPyckcDrTxXWwbPzQRH3/iVTnQrUXB4dZY0HvC6VaE4JSEWOc5/5qTeXxQxcNSGat
    SPtn40Ge86F5WFkv3oMpW2RN8Jrbbr+ep/sXTHvRnAwOPLrI+ZI2i5wI2OvbyJpVg+ZC8X
    eg+z42nU3b1/fXZp1NlE5+wzoTM29wRlVeZrikKdVUq2/7Mfw2bWwLXjKvidKJqhL/CzMh
    ucQwWdrtajxed9n/PxxNfePQ1UYA9yK/e3NWPUfhgtPeSaFHdwOec31WKAWuDRLaB1s/V3
    gf1ehOSIDTwPD+qnkaxVIQsm5kV6dCNkZS0w2b/YJ0VJTjjbLW0AiQH5v8PbQxwUTMtt4d
    4EuIE5wKiZOyyf337XuKGjxLIrtHRWVmXDYNbw51rfK7M69R+4G31LOTD3EvGGF/9Fx0yF
    /vRcr8mQyOsLTVAtEICINcUysttkBDFO1hHRgLlwu2MjCQXyw7IFDU6LSak4MWZuMSLGdu
    WfI6pFj/fXbG0aTQ9U3NKZ+kWUiMx8dmB5EhmzAfL71rmYdBxBrk2MoHcNKw
X-ME-Proxy: <xmx:ryGGahnEjYuybMBUgXq3vhyJf16vxXnEGF-nYWwv3wI4ZWPOUjGCSQ>
    <xmx:ryGGakdQcbIUCchS3y3uCkH7Az99txQ8Rr-5gtCQMR-lWErnukmH0w>
    <xmx:ryGGalTzO-rbXkoadGUK821teUzkr0Y2Pb8Nun2ZBCqUhPnoipMxiA>
    <xmx:ryGGarvQIFX2w-l-TZ-FUYuc1fr0ocIlQ12T-9RWaWfT2UNFgWzoyg>
    <xmx:sCGGanh_T9JjgpclZpAFVz22gPzn8WqlcqcLNBsn1xHG0PxJ_tgyjvPt>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Aug 2026 17:35:41 -0400 (EDT)
Message-ID: <bcfe659d-f638-4d53-a733-3f815495813e@bsbernd.com>
Date: Wed, 19 Aug 2026 23:35:39 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] fuse: decouple fuse_ring creation from ent
 registration
From: Bernd Schubert <bernd@bsbernd.com>
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
 <ce65de6a-2c80-492e-b256-7e6e1ead9aa8@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <ce65de6a-2c80-492e-b256-7e6e1ead9aa8@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/19/26 22:52, Bernd Schubert wrote:
> 
> 
> On 8/19/26 22:29, Joanne Koong wrote:
>> On Wed, Aug 19, 2026 at 1:05 PM Bernd Schubert <bernd@bsbernd.com> wrote:
>>>
>>>
>>>
>>> On 8/19/26 19:56, Joanne Koong wrote:
>>>> On Wed, Aug 19, 2026 at 4:35 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>>>>
>>>>> On Fri, 14 Aug 2026 at 21:00, Joanne Koong <joannelkoong@gmail.com> wrote:
>>>>>>
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
>>>>>
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
>>>>
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
>>>
>>> I don't think we should allow io-uring without FUSE_OVER_IO_URING and
>>> I really thought that was disabled.
>>
>> This is pre-existing behavior that's been there since the beginning
>> (kernel version 6.14) [1]. I don't think we can change this now, or
>> it'll break backwards compatibility, like Miklos's loraw program.
>>
>>>
>>> <... checking the code ...>
>>>
>>> I'm on a ublk branch without your commits a applied, i.e. plain upstream 7.2 fuse
>>>
>>> fuse_uring_cmd()
>>>         /* Once a connection has io-uring enabled on it, it can't be disabled */
>>>         if (!enable_uring && !fch->io_uring) {
>>>                 pr_info_ratelimited("fuse-io-uring is disabled\n");
>>>                 return -EOPNOTSUPP;
>>>         }
>>>
>>>
>>>
>>> In process_init_reply()
>>>
>>> if (flags & FUSE_OVER_IO_URING && fuse_uring_enabled())
>>>     fuse_chan_io_uring_enable(fc->chan);
>>>
>>
>> The condition check in fuse_uring_cmd() is an && and not an ||. It
> 
> Aaaarg. That makes the entire condition useless :(
> 
>> doesn't enforce that the server must have sent over FUSE_OVER_IO_URING
>> in the init reply to use fuse io-uring. With enable_uring=1 (which is
>> needed for the kernel to advertise FUSE_OVER_IO_URING in the init
>> request in the first place), the fuse io-uring logic proceeds
>> regardless of whether the server replied with the FUSE_OVER_IO_URING
>> flag or not.
>>
>> Thanks,
>> Joanne
>>
>> [1] https://elixir.bootlin.com/linux/v6.14-rc1/source/fs/fuse/inode.c#L1455
> 
> The comment there is definitely outdated, at least it was *supposed* to.
> 
> Well, then we have a problem because we have a lock order inversion
> issue. After adding in the reduce-queue series I had planned to work on
> distributing fch->num_background among queues, so that each queue gets
> its own num_background, so that holding two locks like in
> fuse_uring_queue_bq_req() wouldn't be needed anymore.
> 
> Also again, without FUSE_OVER_IO_URING reply the condition in
> fuse_block_alloc() doesn't make any sense.

Lock order inversion is this

 CPU 0 - io-uring completion              | CPU 1 - legacy background completion
                                           | fuse_request_end()
                                           |   takes fch->bg_lock
                                           |   fuse_request_bg_finish()
  fuse_uring_cmd()                         |
    fuse_uring_commit_fetch()              |
      fuse_uring_commit()                  |   
        fuse_uring_req_end()               |
          takes queue->lock                |
          wants fch->bg_lock               |
                                           |   flush_bg_queue()
                                           |     fuse_send_one()
                                           |       fiq->ops->send_req()
                                           |         fuse_uring_queue_fuse_req()
                                           |           wants queue->lock


(I queried AI about it to quickly generate that graph, but that is
exactly what I had seen back in development and which is why fuse
requests are supposed to be blocked until queue initialization is
complete, i.e. to avoid switching from /dev/fuse to io-uring at
run time.

The wrong "&&" in fuse_uring_cmd() also makes it possible that people
bypass the module option to enable io-uring, by just setting the flag
in their userspace implementation. Yikes :/



