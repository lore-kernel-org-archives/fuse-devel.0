Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50F547254E
	for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 21:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787002765; cv=none; b=iYgsBPJpryokPISEwMwoNJPaRndIbcuvy71/20aYCmByFQBGdBRKllaIT2RAtIpD5JpjBCli4QuaNM+PSe26TbG4E9GbguWyTKMH/lAxQOaTifqBoP3BSPulu2P9hW7dEloNwTzwbfHbuvJ/hc80UwlLYnyEj+GEcX6X3KDZlKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787002765; c=relaxed/simple;
	bh=SHtUPBt1UBGsUhoLakafkT+ZTum8EvYaJQtIsI9YZ5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eawBUOh0I+ylBmx8meztFORE4jqF3JbLto2/bGO0T/f7MaDO0A7ph7N4Unbvl1++k0tBbhL3kEQQmPHx4AlbUKHVv7DUxpsAWlclA6bV15dpU0jwsjTVyPxi9i96p6QRYk0sQAgKMU80ys8ZaBLwn7syj+YB5Fv/ULblSxyNaLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=e9MGzpZc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WQUDZAy/; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="e9MGzpZc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WQUDZAy/"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0D0697A018A;
	Mon, 17 Aug 2026 17:39:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 17 Aug 2026 17:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787002759;
	 x=1787089159; bh=4gkEYXbNa8CiMQiGIUZIL6MZfKRVjBxPn5An92ur9GQ=; b=
	e9MGzpZcN4z9OPNfl/hL7B917bOig4Ewhs2W1Hzms7kQiKNv5wgaQ7xNkSuMLXLj
	y+VQhBkThlrgGLe6TuRTxkWcTkcw3/pSZ74cKM5iYJNaGry97hV6qy4fEC9diKwS
	APpFP83yNW9AXNx4Ct4ETpuSqKLBdVOyEE/LruGOfQ5BuwN2b+Fh8JqKxFRYgg4f
	OagWTFlTTeU30I7ZbxO1gIDJx2sRg7USM5mlyF6ady6YxysoIhel0IcHaUsM3J1j
	Bk/o9b0w1WoE9aDo8JsQwoNDnhT7d7gSi00qsesAZITBDomeV9i5LINL1wlpGBB3
	P+TDoTlKqXdi9oVW6XdSSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787002759; x=
	1787089159; bh=4gkEYXbNa8CiMQiGIUZIL6MZfKRVjBxPn5An92ur9GQ=; b=W
	QUDZAy/Wz37jvs32NkEqVv+bNcsOdWW3bafFVvuLgnQPvc6pxut57pAMs76sFteI
	hG4r3yTMtgtDBEMOCY/tBbwy/jierdrc5ef3fJSLByTtGYfLcoqs00qqlTcciClC
	I25zUxw5ncOpuI6AHCfRQnFOCdTxOiqH9FNqqa5b7MJxhuMUqsq8YHQIvBG50mbo
	DCPWtlmohkHlZA48jUghat1IIda1AX806Flc016Njzx+rnZmZ5N3daTZqq0ODN/N
	RBkQer9qIKD6/bAL3LCN/hn4R2j8Gmnj6lerjWpZCmt1kYrvsDGMUs0YfcquFHXu
	7ZPxdNMYoBp33MhKZsQnA==
X-ME-Sender: <xms:h3-DajAMvLfwxEpePO8yq9xYM7GjS7tLfnvhp6UZnrJP7AJPTfsCmA>
    <xme:h3-DarxUEgn6UIHM8w9EDTqi9UtmtdvIh61mWIUOXP-veTHJ-evGcP-pjzlGC9DAP
    i_augVonVTYo_GA15fBjxCG_yREuzfXP59puDvYj5Whgf4wqCE0>
X-ME-Received: <xmr:h3-Dag3YgmXjeNptof92ith7fU1WZD3g2AOYoCGrH6gZKap7GDJDPS8ooJguudrit8V7hGf8PQ5rbRmvDMzLiKsznPSDF71jDH293Zn-ZrnAfX_Sc-5qI_kuTg>
X-ME-Proxy-Cause: dmFkZTF/nWVUi9w3k5u8zxe0CNqD8XS7RVIZoqDR1ANvNXlDVBZOPNNwIXP66v6VazQoHO
    1Napwa5O+CEMMc1onaM1rgPmye/1u7IV603Tr4PIVnDxy+m3thlXGVk5l/V+eq6PWrz5Ov
    JZQjNBS+zRIrn+Z1MIpOF+cebyXLkkTk3X2oNYfocHT5M5t3idHBXBsr8sibKD5afnOG7Y
    P7eLu9NWGehK95YixtEjU4TVkUA6Ywkdz0UW+I2XROQdZHMD3Jfd56jblcKk+zB/zcD6+E
    AYGvxmpjHO/QgA/tD0irqRRDEbfuztQ81dvbqAvI/bPsshVzHt01wsGj3z8AEx3ABCCQq2
    e6moUP0C72f5w45Bk4BMY+uY/dhcpUkU5BQyx9QYW99ZrcfUxMxRXbs5xmvS3+96qsMtOa
    Omnrk+ip7eX1j0IsBhynU7xhb7JeEmuJI5v0UhuX5MfldaGY9G3LfMk7IyEprIBHUSWEMP
    wIXmZLa0OoprLw2GV42zHHNbh+9wI9/4lTlx5udL/IqrKj1N8HidDzGL3YlUMBUbCMPbfg
    4zkGcm96hGTnsyZOoFIkBw5+B8qy+0pmD44T++IaKfUAzrPJOSp9nKTZ3FSmNsncKXlfn2
    nFBFRcMo3ULsPJdIkLXnOjyHuzeUW34U7XZ2sh+Q4qCS1G7X2wzKT3+rDYWw
X-ME-Proxy: <xmx:h3-DarwZfcfw8cUfsXuhM0nIbzIdRwLPpBp0IN79INAG1BWBkTppEw>
    <xmx:h3-DanGxZ16jhe5NKaJ46KebNlzvNsqUBdsaP8C8x2tM6HW5vND3bA>
    <xmx:h3-DauZyC0AUsYb_eilm86AzPLqNER_2MAHkX93EGvCrSycRIsWmDg>
    <xmx:h3-DapDr_GHm7GkWD6hYDBECMvRAkA3Ipth_d2SkrofRTHq-WOvkoA>
    <xmx:h3-DakCEbvThzTGcSSDigiUC7pjlyM68SwBI7ZjqKhJz652I6XKZLeHE>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Aug 2026 17:39:17 -0400 (EDT)
Message-ID: <bece8a86-83aa-43e5-bf8f-551537a2506d@bsbernd.com>
Date: Mon, 17 Aug 2026 23:39:15 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] fuse: {io-uring} Allow to reduce the number of
 queues and request distribution
To: David Wei <dw@davidwei.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>,
 Gang He <dchg2000@gmail.com>, fuse-devel@lists.linux.dev,
 Bernd Schubert <bschubert@ddn.com>
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
 <65b910bc-67cf-49b6-b471-25280e7ba997@davidwei.uk>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <65b910bc-67cf-49b6-b471-25280e7ba997@davidwei.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/14/26 22:55, David Wei wrote:
> On 2026-05-28 15:55, Bernd Schubert via B4 Relay wrote:
>> This adds bitmaps that track which queues are registered and which queues
>> do not have queued requests.
>> These bitmaps are then used to map from request core to queue
>> and also allow load distribution. NUMA affinity is handled and
>> fuse client/server protocol does not need changes, all is handled
>> in fuse client internally.
>>
>> Signed-off-by: Bernd Schubert <bschubert@ddn.com>
>> ---
>> Changes in v5
>> - Rebased to miklos-for-next (Linux 7.2 base).
>> - Folded "Fetch a queued fuse request on command registration" into
>>    "Allow reduced number of ring queues", inlining fuse_uring_do_register()
>>    into fuse_uring_register().
>>    - Fixed retry logic in "Add retry attempts for numa local queues":
>>      replaced cpu++ with cpumask_next_wrap(qid, mask) so each retry
>>      advances to a genuinely different registered queue (Joanne)-
>>    - Simplified "Prefer the current core over mapping" (Joanne).
>>    - Folded READ_ONCE() annotation for ring->ready into "Allow reduced
>>      number of ring queues" to match WRITE_ONCE() on the writer side and
>>      suppress a KCSAN data-race warning.
>>
>> Changes in v4:
>> - Fix leak of ring->numa_q_map
>> - Fix q-imbalance due to an issue in static cpu->qid mapping
>> - Performance tunings, like preferring the current cpu
>> - Removal of distribution among queues, Joanne had concerns about it.
>>    As it is an optimization, it can be added later again. At least
>>    most of it was removed, some light distribution is still left in.
>> - At the end of the series, add fuse debugfs entries. This could
>>    be factored out.
>> - Link to v3: https://lore.kernel.org/r/20251013-reduced-nr-ring-queues_3-v3-0-6d87c8aa31ae@ddn.com
>>
>> ---
>> Bernd Schubert (7):
>>        fuse: {io-uring} Add queue length counters
>>        fuse: {io-uring} Rename ring->nr_queues to max_nr_queues
>>        fuse: {io-uring} Use bitmaps to track registered queues
>>        fuse: {io-uring} Allow reduced number of ring queues
>>        fuse: {io-uring} Queue background requests on a different core
>>        fuse: {io-uring} Add retry attempts for numa local queues for load distribution
>>        fuse: {io-uring} Prefer the current core over mapping
>>
>>   fs/fuse/dev_uring.c       | 313 ++++++++++++++++++++++++++++++++++------------
>>   fs/fuse/dev_uring_i.h     |  25 +++-
>>   fs/fuse/inode.c           |   2 +-
>>   include/uapi/linux/fuse.h |  10 +-
>>   4 files changed, 269 insertions(+), 81 deletions(-)
>> ---
>> base-commit: 2dcf16d41cc04472a4f9bc6e99d0ab26cfb1afb1
>> change-id: 20250722-reduced-nr-ring-queues_3-6acb79dad978
>>
>> Best regards,

Hi David,

> 
> Hi Bernd,
> 
> What is the current status of this patchset? Do you intend to keep it as
> is, or as Joanne mentioned combine it with queue add/remove?

I think we should combine it with queue registration from Joannes series
and that got merged today. And with that should aim for the next merge
window. I also want to add in the RCU lock for mapping updates.

Next step is that I need a merge request from Joanne for libfuse, so
that I can test with FUSE_IO_URING_CMD_ADD_QUEUE. Or at least I need the
branch. Well, I could add this in myself, but that would a) lead to
merge conflicts and b) cause even more work.

> 
> We're running FUSE io_uring on fairly large hosts with >150 physical
> cores. FUSE io_uring ends up creating 300+ io_uring instances, which
> wastes memory and bumps against rlimit memlock.

I fully understand, however, I also cannot focus on one task only.
Besides having a totally different day job (right now fixing ublk_drv
tear-down issues), there is also libfuse (just check recent commit
history... I hadn't planned to rewrite tests, but I didn't get pytest to
hand out information what is failing. That all takes quite a bit of my
previous time). I'm fully open for co-maintainers...


Thanks,
Bernd
