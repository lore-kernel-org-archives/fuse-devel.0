Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368C23CE4B5
	for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787692433; cv=none; b=HtN/tElaBaOB/BOHF/b3bMFN8TJtVqoeSGtlKJP5dDAxUBNKP4FMJQuiD3fY+BiGDMjwAQ4w1kGQrbU+TAqDoqEmcBOMpOLJRtWCrXv1Jp+LA165IvmhlA3zE6Xql8VLDUZ6Oaj6zzMIybCzHg3MOvC3moBoGRmyQ15Wibn4Stg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787692433; c=relaxed/simple;
	bh=NJvPOFm+S1FnVfVlIhh5jr3FN4cDQ9zflT1PIMVXqnQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XnB4SyBt6NA3AqWIJmsFOeLfRIMyT+wHg+TFOEMnYZPa4pjdevxqTrtUKKx2hr6e1tZa3KEdgaVRgcS748dllLnKNiB6P7AZ2f5vWXv/kp1md/X8ygd82YYXr0YpwOJ3Zf1gGLrE14f9iei6KYIiOY8flQVHW4UuguBQSKUls5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b=oyWLhDXF; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b="oyWLhDXF"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8525efa7274so293365b3a.2
        for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 14:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20251104.gappssmtp.com; s=20251104; t=1787692431; x=1788297231; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ddAeZrHvMNk2F9xZwSOeWSN27MXbjBM9ycj3Kiv7Pbw=;
        b=oyWLhDXFG0Db9so/ZOiS9JpuCfyvSAhWEcq3NLmBIs9xxbts6yuS96Hwww4EaPv6Xx
         /buJf95Fp6YzeSoeyPIYji0CDVdW3ZsSd1dmDcQE8IdgZViv43m640pIvBRBCfGIZyBy
         dvg1xFxJd2wZQfaDxIrhuD3thcArmN2vX0rV7eWX/9Qw8lJzW5KxkCIy/N9wlaB0a3Uf
         CW2STSvq/9XiaWR8zNhvY/XRgDznygpZTiftCO34D/de9DZDPS5abFzKcvyGPoRuHiY3
         TXVPQCWvUqs6mXz8ghL9gO5b1DaaBuFgcc3n+6CljE3TW5opQCzs7apOrNhmna997/6K
         rv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787692431; x=1788297231;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddAeZrHvMNk2F9xZwSOeWSN27MXbjBM9ycj3Kiv7Pbw=;
        b=hLPBuuYaFoHaYKPnAjglzntfuGWfTvQ1erj5boRFhmRPonQMR+jR+Pf0b+GHt5Eg2H
         8ZQNBGE2HCpITFoz9RxSQSKZqlVrluEyr3LRfQzt8oCOzEugs3QH3UJkWtpf+NGqBZNl
         /JzbT1xhSytFBPt2zdprIg/6dBGKiYxg+d2tpHES37AiRSpX89ooa+t1/+ni5Dy/6MsF
         uaWl4sVJhdlLQNsHmQWP0uECdavhplb44co693H+4tUmdJgg6FuGZM8hJ3PBfU2T0tla
         uWBh93b9lwvRCIgbzkijK6AmHMJDFMAV+vjwgRDH3VdSaZvsjvo8Dka6g67qsA79Rvsv
         10Mw==
X-Forwarded-Encrypted: i=1; AHgh+RrVdh8sXWdSpSBTEZ1uT7rvq+6g6SGleIae4/uroayZDs8qGhAlO43SxuuwagwOrI1db7qmWLIGnt0g@lists.linux.dev
X-Gm-Message-State: AFuF++mztqctDF+T434JfYy/HBDLiuxC+fXF3mi7l0ZPTNhQefaqVo15
	nQrmvucZSh84jIw0quxY3PEX4Q1Qhfvktq0iTiRJKwCQskrw77S49ozOq8SntfJx0AE=
X-Gm-Gg: AR+sD10QqTw0FXqMUQYfdPOC3TtqP8fvhe7nhccUdDA0XaPz3IgPkLm+xH1Mz8CNUCg
	gzhN5AbJ/BuZjDi1DEsxrIBbchQ6SUcDeYP4nzJ6z2TdRssfSUeiDlt55g7Ke36HsMBcLL0WXqW
	NUn/hfgMWzhv3Nd8lsNRufafqJM2L4IjJqF8UE43fK6rEPaHr+9Y1iCmxwB9cYzQIPqVMpZgTVy
	QUOjhD5pPs7Uy428FVCe0elFbEG/Sc9LxiuuMHJnSDhAN2/fvjZ0vv3zVsbtcQmuMZS/yrNVcZQ
	MmMU5ik+/7Sr33xTHTgUTLMPKmnUnee/fZJGGs5c7F6Ij4QpMRMmHM0fiz8tKfYsftgMZspHif4
	o2sbTuW7TQUY/li/sH4QeY1ZwQCmi/4DRs/N4kxWNCuUHwSBpXuNg2j4x+9T61LYoMcq8gC25si
	WUpecubEG/PyQ+Vdp7AKk3457Wdi6KrIGx5tALJM4TEu90CQ7bahHZPDUcqATg+PEXNYxaT4/PH
	LNzCuzhZ7TaqopjC6te6mNEuSyLJdFKqW6+x2Aih8FW67QFqpSbHBsT60Y5
X-Received: by 2002:a05:6a21:3086:b0:3c0:eeb7:28b with SMTP id adf61e73a8af0-3cf762865f1mr2284086637.8.1787692431478;
        Tue, 25 Aug 2026 14:13:51 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:a:73:30bd:a4b6:294c? ([2620:10d:c090:500::6:3a4f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a9036c85sm1754277c88.9.2026.08.25.14.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 14:13:50 -0700 (PDT)
Message-ID: <4ab0f3d3-e626-4017-b0d8-fbfd7956ac87@davidwei.uk>
Date: Tue, 25 Aug 2026 14:13:47 -0700
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] fuse: {io-uring} Allow to reduce the number of
 queues and request distribution
From: David Wei <dw@davidwei.uk>
To: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>,
 Gang He <dchg2000@gmail.com>, fuse-devel@lists.linux.dev,
 Bernd Schubert <bschubert@ddn.com>
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
 <65b910bc-67cf-49b6-b471-25280e7ba997@davidwei.uk>
 <bece8a86-83aa-43e5-bf8f-551537a2506d@bsbernd.com>
 <9bbda36f-740a-400f-92c0-3f6f3bdd0662@davidwei.uk>
Content-Language: en-US
In-Reply-To: <9bbda36f-740a-400f-92c0-3f6f3bdd0662@davidwei.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-08-19 09:12, David Wei wrote:
> On 2026-08-17 14:39, Bernd Schubert wrote:
>>
>>
>> On 8/14/26 22:55, David Wei wrote:
>>> On 2026-05-28 15:55, Bernd Schubert via B4 Relay wrote:
>>>> This adds bitmaps that track which queues are registered and which queues
>>>> do not have queued requests.
>>>> These bitmaps are then used to map from request core to queue
>>>> and also allow load distribution. NUMA affinity is handled and
>>>> fuse client/server protocol does not need changes, all is handled
>>>> in fuse client internally.
>>>>
>>>> Signed-off-by: Bernd Schubert <bschubert@ddn.com>
>>>> ---
>>>> Changes in v5
>>>> - Rebased to miklos-for-next (Linux 7.2 base).
>>>> - Folded "Fetch a queued fuse request on command registration" into
>>>>     "Allow reduced number of ring queues", inlining fuse_uring_do_register()
>>>>     into fuse_uring_register().
>>>>     - Fixed retry logic in "Add retry attempts for numa local queues":
>>>>       replaced cpu++ with cpumask_next_wrap(qid, mask) so each retry
>>>>       advances to a genuinely different registered queue (Joanne)-
>>>>     - Simplified "Prefer the current core over mapping" (Joanne).
>>>>     - Folded READ_ONCE() annotation for ring->ready into "Allow reduced
>>>>       number of ring queues" to match WRITE_ONCE() on the writer side and
>>>>       suppress a KCSAN data-race warning.
>>>>
>>>> Changes in v4:
>>>> - Fix leak of ring->numa_q_map
>>>> - Fix q-imbalance due to an issue in static cpu->qid mapping
>>>> - Performance tunings, like preferring the current cpu
>>>> - Removal of distribution among queues, Joanne had concerns about it.
>>>>     As it is an optimization, it can be added later again. At least
>>>>     most of it was removed, some light distribution is still left in.
>>>> - At the end of the series, add fuse debugfs entries. This could
>>>>     be factored out.
>>>> - Link to v3: https://lore.kernel.org/r/20251013-reduced-nr-ring-queues_3-v3-0-6d87c8aa31ae@ddn.com
>>>>
>>>> ---
>>>> Bernd Schubert (7):
>>>>         fuse: {io-uring} Add queue length counters
>>>>         fuse: {io-uring} Rename ring->nr_queues to max_nr_queues
>>>>         fuse: {io-uring} Use bitmaps to track registered queues
>>>>         fuse: {io-uring} Allow reduced number of ring queues
>>>>         fuse: {io-uring} Queue background requests on a different core
>>>>         fuse: {io-uring} Add retry attempts for numa local queues for load distribution
>>>>         fuse: {io-uring} Prefer the current core over mapping
>>>>
>>>>    fs/fuse/dev_uring.c       | 313 ++++++++++++++++++++++++++++++++++------------
>>>>    fs/fuse/dev_uring_i.h     |  25 +++-
>>>>    fs/fuse/inode.c           |   2 +-
>>>>    include/uapi/linux/fuse.h |  10 +-
>>>>    4 files changed, 269 insertions(+), 81 deletions(-)
>>>> ---
>>>> base-commit: 2dcf16d41cc04472a4f9bc6e99d0ab26cfb1afb1
>>>> change-id: 20250722-reduced-nr-ring-queues_3-6acb79dad978
>>>>
>>>> Best regards,
>>
>> Hi David,
>>
>>>
>>> Hi Bernd,
>>>
>>> What is the current status of this patchset? Do you intend to keep it as
>>> is, or as Joanne mentioned combine it with queue add/remove?
>>
>> I think we should combine it with queue registration from Joannes series
>> and that got merged today. And with that should aim for the next merge
>> window. I also want to add in the RCU lock for mapping updates.
>>
>> Next step is that I need a merge request from Joanne for libfuse, so
>> that I can test with FUSE_IO_URING_CMD_ADD_QUEUE. Or at least I need the
>> branch. Well, I could add this in myself, but that would a) lead to
>> merge conflicts and b) cause even more work.
>>
>>>
>>> We're running FUSE io_uring on fairly large hosts with >150 physical
>>> cores. FUSE io_uring ends up creating 300+ io_uring instances, which
>>> wastes memory and bumps against rlimit memlock.
>>
>> I fully understand, however, I also cannot focus on one task only.
>> Besides having a totally different day job (right now fixing ublk_drv
>> tear-down issues), there is also libfuse (just check recent commit
>> history... I hadn't planned to rewrite tests, but I didn't get pytest to
>> hand out information what is failing. That all takes quite a bit of my
>> previous time). I'm fully open for co-maintainers...
> 
> Of course, I understand you have other things you're working on. I
> didn't want to step on your toes and work on something you've already
> made progress on. At the same time, it sounds like you're spread thin,
> so while I'm not certain on co-maintainership, perhaps we can talk about
> how to shard this work better?

Hi Bernd, following up on this. Can we work on queue add/remove which we
need to fix our problems with FUSE io_uring in parallel? You seem to be
spread very thin across different areas. We don't have the bandwidth to
co-maintain FUSE/libfuse, but we can work on the patches. What do you
think?

> 
>>
>>
>> Thanks,
>> Bernd
