Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EE817A2EA
	for <fuse-devel@lists.linux.dev>; Tue, 14 Apr 2026 17:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776188101; cv=none; b=PIMetm6GhZXnrxsokF3hiCFs96VEf8Y294AWr2acomjvm+wx66hBHx/hRlxt3C/tIl/AMb4hKBXnUJL/izErpT+EzC5lM0FOtug+YerBoPi/8H41kj6OhbLpb0flUiPmFRwxkrrCM7jR0RliFx4drIQfB0rdlsWfKOTmZsVhd2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776188101; c=relaxed/simple;
	bh=k/fx/XpDg9ef1SoW9Lke+j1dWtKF7jcBX0rGpjKTVsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFW37dUvWn7LGwpVULOdRmryMca3ZzLM5ZBbKOg1g6jLQPahGIDlT/QSMyvJMoSHo6puqkgnUCc6BAC5tS5A3QiWmQvRpFcIhFzbVB7kFcGg7fZPXOIVR0LLFGSLCK0KxZbaYiNLxbLxMRSKjKQX/Px1ZWCqGHdzo2pchsLCT1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=niova.io; spf=none smtp.mailfrom=niova.io; dkim=pass (2048-bit key) header.d=niova.io header.i=@niova.io header.b=mrz948pn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=niova.io
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=niova.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=niova.io header.i=@niova.io header.b="mrz948pn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so41021395e9.1
        for <fuse-devel@lists.linux.dev>; Tue, 14 Apr 2026 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=niova.io; s=google; t=1776188098; x=1776792898; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1Z99hOsOR96yTjcxyCVUL0gm5Uf7E1lqAaY79IeWks=;
        b=mrz948pnk2Rut5V2ofiN3JrnILmwf86ErgT05VOd8eA5hxjAtLEsy1JEd2RqJJnw7B
         VR43Ov13AtI5PMm8xHidrzurW9tBLLFmFYtkjMsegVdNN9FGFItK9n/XQYpJiOYEoW6q
         ztLsAl7hTbCSEXmLLYFgG22ATvEAv1FV7LHgsDtoHGdLmBQOwxVoxMqUxLJqt5YLg+zA
         YmHXNqCTAOyXDr/wt4DD2hYoK/9xT2+ClBRYNZHqTyZDfAJ8LAqfbOl/WKC/k/nnhq0M
         ahEKTk4WMHs53tCZnvY80eOXW61HfHguoQ1g1Y+WnIHN+4l12jTogUnOqBuDdCsLCMGo
         C4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776188098; x=1776792898;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1Z99hOsOR96yTjcxyCVUL0gm5Uf7E1lqAaY79IeWks=;
        b=nQ9AyawLIOoKom2AII1/rrO/Xf7orEToh9fop8NNBKB5/lscBWduIqzGfv4+7Mq8zo
         hev2eXxbjDS/j7+0gAVbjOU3XtOqWYkp2HmQjEGA4yL4cJ99wEwM/ailnbSudHx8fT7X
         kt+c6hksRfP3NoCoWoz4nxl/87eCP3rQhHUoXV/5bidJyoTgyi/syqtB9YTFk3E2cjdj
         791odc1mEXlCs7zrhSR/ga0p0SeoW00zoqua4g6PJU//K5sRCX+lO6KevnZW774IMjsT
         MvxrAXFZfntODuxtoecsz7nuAR15jzH8eAlsVWA1Y9wkg1wVZKA7x7AUS70R08FeD4k3
         sf+w==
X-Gm-Message-State: AOJu0Yy77fwUBDUYsIQ1yd7tV042YjWcsd9HKIjpz4Wkx8NTrZ7VzZFA
	hEVRyXWRi3U0tuok6L1x2W2cHmi/SM1n8lWNzTwMI67gIOE77Agt4IRkpk5ASoywk7s=
X-Gm-Gg: AeBDiev0atVatDBQc+8Kin1jjX8FsV4jiItn+D5kq7q+MzK8tJMhM/Ev472/0Hl7PLM
	A4Tglc7lubJE9JvGgag+SLdSPseLaFC60VobQ78hgD5i8qp/5LtC3+ppyqKAxKvQRinxhLovnHZ
	VoU3FyyheTmWllZi+LAYFDo7zvp7drjKvJnslpWsHgf7fgrqN9TI2GGvqTBckrzhbrrmWbAPqtN
	XL708Hkae7TMrVy4Uoxr9nTv5D7awPuttGmI6Jmqhih6/Lj0BnHYx0xFijQUHd3yyLys6uIgL0Z
	/r8mW+YdIdb2M5q4WZ8pkj65wdvTf25+r4gH6VLpGpS7vDsbKStXZiv0wwsOFNGVsfG7QSXz5ok
	tyOmIfK/D1qQMIiahsm3L4U1BNab3hGg39f26TjllqTpGSR9AM/b8bzE7Elxm3rnMHlku18Z7v6
	Ba6tB0vpKcgBJtWy+VZu3Ntss+zu8Cq4sX00VAebNG846aYmdJxjHJQHkxFf3WQUxm4Jq7HZzVo
	L7+vz7UgYcG67djyIjkuvft+wEEV/ptM4QjKUJt1AduQJCbPS2KC+sh
X-Received: by 2002:a05:600c:4709:b0:488:caed:5ccf with SMTP id 5b1f17b1804b1-488d68af17bmr212020085e9.16.1776188098021;
        Tue, 14 Apr 2026 10:34:58 -0700 (PDT)
Received: from ?IPV6:2a01:cb00:1870:d900:3a0e:fdbe:4a0f:1455? (2a01cb001870d9003a0efdbe4a0f1455.ipv6.abo.wanadoo.fr. [2a01:cb00:1870:d900:3a0e:fdbe:4a0f:1455])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f093d7fdsm1574135e9.2.2026.04.14.10.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 10:34:57 -0700 (PDT)
Message-ID: <e5553fcf-04bc-49e2-9eb7-17f9007e7fad@niova.io>
Date: Tue, 14 Apr 2026 19:34:56 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: fuse/io-uring: Proposal to support pBuf in additon to kBuf
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, io-uring <io-uring@vger.kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>,
 Ming Lei <ming.lei@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>
References: <18936160-308a-4817-a295-54eef43707a3@niova.io>
 <CAJnrk1ZknZJQDdJwE5WBK-yZzocMCN_eiCUzxqfHss5ZKBZQ4Q@mail.gmail.com>
From: Bernd Schubert <bernd@niova.io>
Content-Language: en-US
In-Reply-To: <CAJnrk1ZknZJQDdJwE5WBK-yZzocMCN_eiCUzxqfHss5ZKBZQ4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/14/26 02:56, Joanne Koong wrote:
> On Mon, Apr 13, 2026 at 2:33 PM Bernd Schubert <bernd@niova.io> wrote:
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
>> current assuming that fuse and ublk rings should just get multiple
>> kBufs/pBufs and a config options that mapps bufs to io-size. I'm still
>> looking into details for that.
> 
> Hi Bernd,
> 
> Thanks for your email. There were some changes made from v1 -> v2, so
> please see the v2 "fuse: add io-uring buffer rings and zero-copy"
> patchset [1], as I think this will hopefully address your concerns
> about mlock. In short, what changed from v1 -> v2 is that I dropped
> the approach where kernel-managed buffers is an io-uring native
> infrastructure. I realized when trying to implement integration
> between the io-uring networking layer and kmbuf rings that kmbufs
> didn't tie in as nicely as I'd thought with io-uring native requests,
> and fuse has too many constraints for the kmbuf ring (locking
> semantics, request lifecycle, etc.) that it made the io-uring side
> less clean; this made me realize this logic would be better off not
> part of io-uring infrastructure and instead self-contained in fuse, as
> Pavel had suggested.
> 
> In v2, the fuse headers and payload buffers are passed as user
> allocations during registration time through the sqe iovs and
> server-side has control over whether to pin the headers or payload
> buffers or both (or pin neither), eg bufrings can be used without
> pinning (no mlock requirement) and pinning is an opt-in optimization.
> Zero-copy requires pinning both headers and payload buffers, as zero
> copy requires CAP_SYS_ADMIN privileges anyways. In this design, the
> buffers are only recyclable by the kernel (unlike pbufs). Unlike pbufs
> where the api contract is that any buffers not explicitly put into the
> ring by userspace are under the full control of userspace and not
> touched by the kernel, this design continues the existing-fuse-uring
> contract that any buffers passed in through sqe iovs during
> registration will be copied to/from the kernel as long as the fuse
> connection is alive. In the future, if the buffers need to be
> kernel-allocated for dma contiguity or other reasons, that could be
> added separately if/when it becomes necessary.
> 
> Does this address your concerns?

yes absolutely it does. I had actually thought that Jens had already
accepted the kBuf changes. I had seen the discussion with Pavel, but
then seen (at least I think) that Jens had accepted it. And with the
different versions, I didn't notice that v2 (in my counting that is v5,
I think), doesn't use kBuf anymore.

If I understand it right, the io-uring bvec changes are only needed for
zero-copy?

Thanks,
Bernd
