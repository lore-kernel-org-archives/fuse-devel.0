Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3CC25A642
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 14:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776350767; cv=none; b=FtKA8BNcdvXVhA7qjf25xx6YYDRyxrBpXds2B7XDHyKrs/QntCcnmKjmwpDTdoKkPEu+N7oRwf4YWv9XDO685fsZXN/iY8qxNPnlcDFRMU4MKUZQWmDRJSWfILy4fGKe/TFw6L3ZxzcG8yCAMox/CGE2vBARbuY4dldFUwykOBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776350767; c=relaxed/simple;
	bh=Iu7rAszW8gcKPt7u1RgikFfxCkU1PRfHvp/MYxC7Lsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OiSKOL0XEWo9dQH/zASq2h6kTRAmleBoKsbria1a7zyt1j2p30QjeQjJMqrSgHOKjXstqoC3LVYEIo/tQpcpsLtHSXPzu7h6i1GCAYLyyg74UF1D7Yv4+OFm0o8IE6rF6fOnqcozyzkXAfu1ybilNhL5OgiKQ+3npL1e9QqB0zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=niova.io; spf=none smtp.mailfrom=niova.io; dkim=pass (2048-bit key) header.d=niova.io header.i=@niova.io header.b=T9CqKHN5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=niova.io
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=niova.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=niova.io header.i=@niova.io header.b="T9CqKHN5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ad135063so78274425e9.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 07:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=niova.io; s=google; t=1776350763; x=1776955563; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9G3FogfRLO8BFZzW+KCpfW+F3MEqtQk/jwa+aFkW/I=;
        b=T9CqKHN58b7b/87xABBYKQVNsZg2FtuOtvTj1SF4EV/OLoDY927xDGsUG92uyahfiT
         ODz/zBvImxUgVybUWjixtTzTec7xfYvbUeFm3JjG9NqeEXGVpGeWtGG3ozqkZO4xPJta
         v608Ay98R9AstOevI/gh2ETAQmm7WFnAt4S23wAbQ3L3QnlU4bS5g9xsMw14sU+eBEBw
         rM5VcHtvErH7Q4csJdXbeFgy9ryJTxWdHLSpueeEsU8ohBxn5xmcvkXc1IJvDpH9V2dq
         u/WVvYU0s1LKwXhnuQ+NtAJ06l6eq5XqYhJN0qqNP72W7tU2FfOD+/oSXV/PuMCG7vK8
         tjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776350763; x=1776955563;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9G3FogfRLO8BFZzW+KCpfW+F3MEqtQk/jwa+aFkW/I=;
        b=kMOq6WagF2FvmbL2Sq7nEex0ouwb2WE4uu0kgBWVND2fpxNtiZdl7q7knSz+Zv09rf
         8HLOVGjNTzxaDu7SKdGknyuzPY2FBAsKGqxyVqpITVySBvczRRL3GsWaFY2g5lcQjnRW
         ZjPyGcW0HY8To/EVgCYej5JmL2xvBrieibhNarebiixwNyU8PLD6k0V9CzDqLnUt0BAj
         MeUPJVUsbNVCMmzrOSZk7/ONsMnZjIiAwE2ez7p/586w5rqe6WjOWkma6qRHUH7sjqI+
         Ld6DhIN3yw027mCymtOX7gltf1u1hH0tYxJs9FkeruD4MingX1k6nkVsH51Lo/nKYd8K
         mRzw==
X-Gm-Message-State: AOJu0Yw98mTK59c/f48zLBgF7zp6fQ8DaxkB4TQR4ZlGawmMkY67639V
	gNCrMpojfKWTb0b31dxdqnXZAAOHfQnjtSoJGHpWpQ6bonf+Ck/lFwjRldYvd36uxww=
X-Gm-Gg: AeBDiesqcwDI9IpSEAFcTB9lQ7oz0eTAKd+XVmAXMAjyrN01B4GmnGjNRGnZVUlZX1S
	VQNnaDpvcwhrkMWLhsaKJGDIM1xeUbyRma8L3mz0okmwzsnpei2+8UEeDwUwVkTv7EqFzafJ/eA
	HkAHIO0oYqCInCg7kzY9ROJVQml/YQR8jmsGNNQp5bKvvfNXV6q3Nz1hJHj+09TKxhTOKu1dG5z
	ERWZ//O0eso7HfJnYOHULAuGB3+Vwiyj6TUen8gpWgQVUNfcpoOEmB4svmTCizlLaydKQQnrOWc
	v4zqH7BuSurxfSBzMgz+vTi0OvcWanJj571hXsfRtnulEcpKvonMHT1GVZHrOp04u4HnGr/dbl8
	hk6D2bfOB8qS+quq4RS1DGgLsm5Vv/mGh511pRNykSvLvd6JAcBbRmplXCgYlNqBklplkOpzZu3
	AtmIipvMSZ2ojzXgfaxdkgnJwm2+aWtfmCy6Pn8m+PxKKdkOv+5ViNLoYwB8nH1+nUtM5Bf1TuT
	xUCIwk8V3kYraBAi1A68YCHxN3OnVvpPR9Noqq/Te0ykvi1XRLgqegX
X-Received: by 2002:a05:600d:4:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-488d68ab2bfmr302390335e9.24.1776350763159;
        Thu, 16 Apr 2026 07:46:03 -0700 (PDT)
Received: from ?IPV6:2a01:cb00:1870:d900:94b2:a916:840e:ca2f? (2a01cb001870d90094b2a916840eca2f.ipv6.abo.wanadoo.fr. [2a01:cb00:1870:d900:94b2:a916:840e:ca2f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead33d6d3sm14507663f8f.8.2026.04.16.07.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 07:46:02 -0700 (PDT)
Message-ID: <fcad39e2-37b5-46a9-a280-2315e0397985@niova.io>
Date: Thu, 16 Apr 2026 16:46:01 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: fuse/io-uring: Proposal to support pBuf in additon to kBuf
To: Ming Lei <ming.lei@redhat.com>
Cc: fuse-devel@lists.linux.dev, Joanne Koong <joannelkoong@gmail.com>,
 io-uring <io-uring@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Pavel Begunkov <asml.silence@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 "Lei, Ming" <tom.leiming@gmail.com>
References: <18936160-308a-4817-a295-54eef43707a3@niova.io>
 <CAFj5m9LeM4S82QEsRQ0uQiXj1eWCFAW3v2fLTxUj1YM7UO-V9g@mail.gmail.com>
From: Bernd Schubert <bernd@niova.io>
Content-Language: fr
In-Reply-To: <CAFj5m9LeM4S82QEsRQ0uQiXj1eWCFAW3v2fLTxUj1YM7UO-V9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ming,

On 4/16/26 15:49, Ming Lei wrote:
> Hi Bernd,
> 
> On Tue, Apr 14, 2026 at 5:33 AM Bernd Schubert <bernd@niova.io> wrote:
>>
>> Hi Joanne, et al,
>>
>> this is a bit of duplication of the discussion we had before, but I was
>> badly distracted with other work and also switching employer - didn't
>> manage to reply [1].
>>
>>
>> I'm still not too happy about kBuf and its restriction of locked-only
>> memory. Right now I'm reviewing your patches from the view of what needs
>> to be done for ublk (for my current employer) and also for fuse to
>> support different buffer sizes. Let's say fuse only support kBuf and its
>> restriction of pinned memory, I think we would be forced to add support
>> for different buffer sizes to the current ring-entry-provides-the-buffer
>> and the new kBuf interface - from my point of view code dup.
>> If we would allow pBuf for fuse, we could put the current
>> 'ring-entry-provides-the-buffer' interface into maintenance mode and
>> support new features with the new interface only. I know you disagree on
>> using pBuf [1] with the argument that userspace could free the buffer.
>> Well, if it does, it does something totally wrong and the same could
>> happen today over /dev/fuse and also the existing fuse-over-io-uring.
>> Just the window is smaller, as the pages are extracted from the buffer
>> during the copy.
>>
>> I was looking into what would be needed to support pBuf and I think
>> io-uring could extract pages from pBuf when the buffer is obtained - it
>> would limit the window when userspace can do something wrong in a
>> similar way current fuse and ublk works.
>>
>> Suggested changes:
>>
>> io_uring:
>>
>>   - io_pin_pages() gets a 'bool longterm' parameter.
>> The new pBuf path would pass false, every other exsting caller true.
>>
>>   - io_ring_buf_pin_user() / io_ring_buf_unpin_user()
>>   - io_ring_buf_get_pages()/io_ring_buf_put_pages() -> fills the
>> provided bvec
>>   - New struct io_ring_buf (in cmd.h)
>>
>> struct io_ring_buf {
>>        size_t                  len;
>>        unsigned int            buf_id;
>>        unsigned int            nr_bvecs;
>>
>>        /* private */
>>        u64                     addr;
>>        u8                      is_pinned;
>> };
>>
>>
>> Fuse changes:
>>
>>   - fuse_ring_ent (bufring union side): payload_kvec and ringbuf_buf_id
>>     replaced by io_ring_buf + pre-allocated bvec array.
>>   - Buffer selection under queue->lock removed.  The lock only protects
>>     request dequeue and entry state transitions.  Page access happens
>>     after the lock is dropped, in the context where the copy runs.
>>   - setup_fuse_copy_state bufring branch: is_kaddr/kaddr replaced by
>>     iov_iter_bvec() and would continue to use iov_iter_get_pages2()
>>
>> What do you think?
>>
>> And my current primary goal is to let ublk to support multiple buffer
>> sizes - ublk would also need to get support for kBuf/pBuf and I'm
> 
> Ublk server is just one liburing application, and it supports all generic
> io_uring buffer types, so kbuf/pbuf should be fine for your ublk server
> in theory.
> 
> It really depends on how your ublk server is implemented.
> 
> Maybe you can share your motivation first before discussing kbuf/pbuf support.
> If it is for DMA,  there are other candidates too, such as hugepage,
> recent added
> UBLK_U_CMD_REG_BUF, ...
Joanne had actually removed kBuf and switched to pBuf alone and that
simiplifies things a bit.

Motivation is to reduce memory usage. Let's say you need 4 IOs of 1MB to
saturate streaming bandwidth, but still want to get smaller IOs through,
for these smaller IOs you don't want to assign the 1MB buffer for each
queue entry / tag.
Zero copy is currently still out of question for us, although I will
look into your recent work for integration of eBPF and if erasure
coding, compression and checksums could be done with that (I guess
checksums is the easy part).

Ublk already has UBLK_F_NEED_GET_DATA, but that has two issues
- needs another round trip (testing on my laptop shows a perf loss of 10
to 15% per queue)
- It does not release the application buffer on read. I have an idea how
to fix that, but here at Niova we would like to go the dynamic memory
appraoch with pBufs to avoid additional round trip overhead.

Idea with pBufs: Several pBufs registered per queue at registration
time. Every pBuf represents a different IO size. Optionally as with
Joannes patches [1] the buffers can get pinned to avoid mapping to pages
for every access.
I'm currently working on a patch series with some luck will sent an RFC
tomorrow. The harder part compared to fuse is that ublk_drv does not
have its own queues/lists so far. This is my first work on block layer -
I'm not sure if internal struct request queuing is allowed at all.
Testing will show in a bit :)


Thanks,
Bernd


[1]
https://lore.kernel.org/linux-fsdevel/20260402162840.2989717-1-joannelkoong@gmail.com/T/#mb8f96895aa2773424005ee06bb62ae980e95e604


