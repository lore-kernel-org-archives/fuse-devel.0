Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE891224F3
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 19:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776366826; cv=none; b=HBM5IvnezJogTvgIlX5SFCpz1lOyqz8E+5qN18j6V7MZyY3WzuwSDbP9i8vqv4ArbLff36Dgrt8tb0Ba44cNg9mQs8M9A1ZJEtMYCH8BIdGwhkSP/NsqIe3xCs6gpOPUyXTzs4gdJeQW6r/i3kW/8zoONf3MY5u+S6ayXiqh8oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776366826; c=relaxed/simple;
	bh=7Ryr0EbJzLMUU5S88vGtGENgrAciFzpXy5Rh+SxezsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EU1b94KaV/wTcv3AiVYZWcx7D5oLJBBSbC6WsVvNXFbRekHrF4+9RHo9MAT4AE90R0l9nZVP+mrE/4nBqi1ytd4lWpg2fFz1+YCCp7ZOQPvyNtZcT8owcUeWxX0hNOG5FS7py8Httox6k8uOcndaQ1a3m+MBQyIuQhD2A2I2WFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=niova.io; spf=none smtp.mailfrom=niova.io; dkim=pass (2048-bit key) header.d=niova.io header.i=@niova.io header.b=OSzJL3+k; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=niova.io
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=niova.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=niova.io header.i=@niova.io header.b="OSzJL3+k"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so129461105e9.2
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 12:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=niova.io; s=google; t=1776366823; x=1776971623; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i6TN1leRKVUDgjr8ZiyEfgP4Hfk4jw9C0F8qVnEJca8=;
        b=OSzJL3+kWYJbK5LTPl8kRktNl9dTDt3XvuHz2cqIN1pVFvBElNmkkswtRLmbikRt7E
         qhdOTjUfTE++7chGyGCoMXwtOLsbORwfH/phDlrE4B/H+Mo8Fcph9vSY6la9a7YPX697
         9Y/NxdjalbwUx4RzmJA6pRUeo/rr8NA5THns8f2GfBuhhLUTidohBhJQKBUCpMz72hWc
         L/GtZbwCEcHWQEqJ7RAin0Fjk2lV7Qa6LZiDhkcc/D/ld7iimLPILsToA5ybBVKDSBni
         A2NCUvGc0BZSfrMEbcX9b9M3b9zIyjsGebV5INSMVuGs9AkxRrxAJ71aM+Lhtx9McdXH
         rqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776366823; x=1776971623;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6TN1leRKVUDgjr8ZiyEfgP4Hfk4jw9C0F8qVnEJca8=;
        b=PnsWITYYqLcPCyscWjg6oTl8DHBl7o4xpD/9ywXI7aB26SVjYXODiqosYtIrw4yP9D
         3xEbcjvB2m4YeYYShIzT00deO4ODQ9hR3N8Y3YFJfo4P4hIpCBHGkBSmWw0Atg8tzfQm
         UOKEnp2h9XKhwZIz12bQeaR2g+s/4jKphox9lOtoJ8btcIyelfOppxXmoVMRn9wPSFyw
         nQeD5NJyVNFC+c57v42TOewhGke/YcUlsmCUxdSmIToxp38rm/2XF5LnZUv5LB++goWH
         yzDD8X4i6pOtK2z57BmHjAd1V2eUd+DftbKDvQMzo4+GMNenYeP9ujd8yigWoDgzP6KC
         6YFA==
X-Forwarded-Encrypted: i=1; AFNElJ+JXZE2G3k+nc4BuUAg3vUUlWYPqNWbQ7p9S2gy0UntLNN2pnXQqVK0FREil5hUVeXjfJQh24J5Uuwv@lists.linux.dev
X-Gm-Message-State: AOJu0YxfCLbZCegkJKfS69R7aGV2mK63TCI9yhKH/Q0YNJS8EtwIfW7F
	4bnpCut0+U7dqpIt8XZQzpK1UqSx01riououhaGtlxLMBFvXbgR/038KFCQW0OCFdOg=
X-Gm-Gg: AeBDievB23Uy9kS85aE+Nd5wnWEjc3bxIbLrQcRS7q/31VD4IcFhfO/kVvz1Q5VY271
	DTJhittvFEOEZsJgIAtchin0g0WJ/y+g8Tfol9wp5Wypf4/p0P9QPCrjpwzt3JGnYIyoxdJMNZ5
	039r0IRVLhaXtbfpF6c6wfHRC/k5+NSGtPukccVIO0B1GTe8I9Qa7LAHdm2lRKv8iswx4mX+YYQ
	rRCP2mKp1vi8Vm6taGTtzw1JqtJ85KfDs/6KBld3iAawQVZGuaM3sGXnbGVPSoLG5dbIWGeVeN7
	f5MeoNO6f11bNEo2/ZFjRgDCW586BlLZ5006sslPvd7B1336+3IEKdyuqxiHozFGMZRvTEMlt2z
	qH8mFJMGCAsXRJ/Fcb0R94GoHZl9D/JE4KgF2nhaeRlEIpWVzVFoHmwaUUwH1qMeF+pVSfS6LGP
	VEcAmBUsxodYhhp7ho1XkhAJrsHdT5gCmyf5whmiLu06ijtL05g6EY6Tek3wT/xLhP06Sjnba0U
	/KnWo6sImgCJoOsyvK9BM0pskFmdNGGqtRey0ig+QgRqdDT8x7I+dBl2vfzeQ9WhgM=
X-Received: by 2002:a5d:5d83:0:b0:43d:77e1:6a66 with SMTP id ffacd0b85a97d-43fe0eab61amr866986f8f.8.1776366822921;
        Thu, 16 Apr 2026 12:13:42 -0700 (PDT)
Received: from ?IPV6:2a01:cb00:1870:d900:94b2:a916:840e:ca2f? (2a01cb001870d90094b2a916840eca2f.ipv6.abo.wanadoo.fr. [2a01:cb00:1870:d900:94b2:a916:840e:ca2f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3553d7sm15793819f8f.9.2026.04.16.12.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 12:13:42 -0700 (PDT)
Message-ID: <55db9a65-4408-42d2-8958-3bf3aa79d554@niova.io>
Date: Thu, 16 Apr 2026 21:13:41 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: fuse/io-uring: Proposal to support pBuf in additon to kBuf
To: Ming Lei <tom.leiming@gmail.com>
Cc: Ming Lei <ming.lei@redhat.com>, fuse-devel@lists.linux.dev,
 Joanne Koong <joannelkoong@gmail.com>, io-uring <io-uring@vger.kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>
References: <18936160-308a-4817-a295-54eef43707a3@niova.io>
 <CAFj5m9LeM4S82QEsRQ0uQiXj1eWCFAW3v2fLTxUj1YM7UO-V9g@mail.gmail.com>
 <fcad39e2-37b5-46a9-a280-2315e0397985@niova.io> <aeEE4FVGdi5RqKs_@fedora>
From: Bernd Schubert <bernd@niova.io>
Content-Language: en-US
In-Reply-To: <aeEE4FVGdi5RqKs_@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/16/26 17:48, Ming Lei wrote:
> On Thu, Apr 16, 2026 at 04:46:01PM +0200, Bernd Schubert wrote:
>> Hi Ming,
>>
>> On 4/16/26 15:49, Ming Lei wrote:
>>> Hi Bernd,
>>>
>>> On Tue, Apr 14, 2026 at 5:33 AM Bernd Schubert <bernd@niova.io> wrote:
>>>>
>>>> Hi Joanne, et al,
>>>>
>>>> this is a bit of duplication of the discussion we had before, but I was
>>>> badly distracted with other work and also switching employer - didn't
>>>> manage to reply [1].
>>>>
>>>>
>>>> I'm still not too happy about kBuf and its restriction of locked-only
>>>> memory. Right now I'm reviewing your patches from the view of what needs
>>>> to be done for ublk (for my current employer) and also for fuse to
>>>> support different buffer sizes. Let's say fuse only support kBuf and its
>>>> restriction of pinned memory, I think we would be forced to add support
>>>> for different buffer sizes to the current ring-entry-provides-the-buffer
>>>> and the new kBuf interface - from my point of view code dup.
>>>> If we would allow pBuf for fuse, we could put the current
>>>> 'ring-entry-provides-the-buffer' interface into maintenance mode and
>>>> support new features with the new interface only. I know you disagree on
>>>> using pBuf [1] with the argument that userspace could free the buffer.
>>>> Well, if it does, it does something totally wrong and the same could
>>>> happen today over /dev/fuse and also the existing fuse-over-io-uring.
>>>> Just the window is smaller, as the pages are extracted from the buffer
>>>> during the copy.
>>>>
>>>> I was looking into what would be needed to support pBuf and I think
>>>> io-uring could extract pages from pBuf when the buffer is obtained - it
>>>> would limit the window when userspace can do something wrong in a
>>>> similar way current fuse and ublk works.
>>>>
>>>> Suggested changes:
>>>>
>>>> io_uring:
>>>>
>>>>   - io_pin_pages() gets a 'bool longterm' parameter.
>>>> The new pBuf path would pass false, every other exsting caller true.
>>>>
>>>>   - io_ring_buf_pin_user() / io_ring_buf_unpin_user()
>>>>   - io_ring_buf_get_pages()/io_ring_buf_put_pages() -> fills the
>>>> provided bvec
>>>>   - New struct io_ring_buf (in cmd.h)
>>>>
>>>> struct io_ring_buf {
>>>>        size_t                  len;
>>>>        unsigned int            buf_id;
>>>>        unsigned int            nr_bvecs;
>>>>
>>>>        /* private */
>>>>        u64                     addr;
>>>>        u8                      is_pinned;
>>>> };
>>>>
>>>>
>>>> Fuse changes:
>>>>
>>>>   - fuse_ring_ent (bufring union side): payload_kvec and ringbuf_buf_id
>>>>     replaced by io_ring_buf + pre-allocated bvec array.
>>>>   - Buffer selection under queue->lock removed.  The lock only protects
>>>>     request dequeue and entry state transitions.  Page access happens
>>>>     after the lock is dropped, in the context where the copy runs.
>>>>   - setup_fuse_copy_state bufring branch: is_kaddr/kaddr replaced by
>>>>     iov_iter_bvec() and would continue to use iov_iter_get_pages2()
>>>>
>>>> What do you think?
>>>>
>>>> And my current primary goal is to let ublk to support multiple buffer
>>>> sizes - ublk would also need to get support for kBuf/pBuf and I'm
>>>
>>> Ublk server is just one liburing application, and it supports all generic
>>> io_uring buffer types, so kbuf/pbuf should be fine for your ublk server
>>> in theory.
>>>
>>> It really depends on how your ublk server is implemented.
>>>
>>> Maybe you can share your motivation first before discussing kbuf/pbuf support.
>>> If it is for DMA,  there are other candidates too, such as hugepage,
>>> recent added
>>> UBLK_U_CMD_REG_BUF, ...
>> Joanne had actually removed kBuf and switched to pBuf alone and that
>> simiplifies things a bit.
>>
>> Motivation is to reduce memory usage. Let's say you need 4 IOs of 1MB to
>> saturate streaming bandwidth, but still want to get smaller IOs through,
>> for these smaller IOs you don't want to assign the 1MB buffer for each
>> queue entry / tag.
> 
> Thanks for sharing the motivation.
> 
> Maybe you can pass UBLK_F_USER_COPY, and each IO buffer can be allocated
> dynamically completely from userspace, then pre-allocation can be avoided.

I had looked into, but that is still another syscall / roundtrip, will
have the same performance issue as UBLK_F_NEED_GET_DATA and probably
worse because compared to ring IO that is a syscall per IO.

> 
>> Zero copy is currently still out of question for us, although I will
>> look into your recent work for integration of eBPF and if erasure
>> coding, compression and checksums could be done with that (I guess
>> checksums is the easy part).
> 
> Got it, compression could be the hardest one, however, the recent added bpf
> iterator based buffer interface may simplify everything. I'd suggest you to look
> at it, and provide some feedback if possible.
> 
> Also if your client application uses direct IO, recent added UBLK_F_SHMEM_ZC
> could simplify implementation a lot, meantime with zero copy & user-mapped
> address.

Oh I see, that was just merged. Nice, thank you! I don't our users will
be DIO only, but nice to have that ZC option!


Thanks,
Bernd
