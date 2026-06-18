Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF6B3B71D4
	for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 18:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781807348; cv=none; b=FpXT8ogq6hLwN8JFtLZFturhpk8ZEkYetFUe1ymAYFtnv4yWJepD7xVq9QOTdGx/bDn3wiLgVmEJM1bf6THF8ccEbTovk5g2t7KeJZeULRAkPtsJOde406Nj7IUIGQBnhUUBGKwy2rXV0nUkQqUPFJG8f8rUfisFUPPXBmoeRYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781807348; c=relaxed/simple;
	bh=8jpJ4PzdO1uWG5XRUaQV42BOMOOw1ciJX91w5Ff9MS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hq05uPtvZdyn9d+aCaQMRbpmMqSEr8iwdGF3Czr951erDdG8Gil15g85D3hv9DQjhQIvwjxQNiirja5+uNcd/8EQ6OTIhsFakP2+SP4hpwGpUFGu+ZW32h0AQfamVUDGFQTKz0d+wxBf/UW2BsQNM5we4Bi2pIZ0Bp2mKfxF8Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=T5ULme7v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dVHOLzke; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="T5ULme7v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dVHOLzke"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E1DC37A0135;
	Thu, 18 Jun 2026 14:29:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 18 Jun 2026 14:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781807344;
	 x=1781893744; bh=14jd45pqPEI5TcLnjz4bNQr5UXXjvZeRBPuWi6ehnDI=; b=
	T5ULme7vwd2hc7+KrLDxkDPnogQdQPzl0pJn4qhnAzpY9+L2EQpy7luzIiq7u8H6
	gxMXt3RMa8imzFJgZrfXqUfCRyVQvK97F/OaE0Cx16LQuW+606n/LiY1x6dLyltQ
	sHXTkvnwphCXCIkfy1UyCoq7RLMnUaLtgugdOxmZpQ3Wbh63UIMxBf71jW1MUOxj
	pR/zpdVp6Slrx5138yZKw/1i5CQmWCfoft2H72moah85ldtb4c90C5YHtdF9A9PA
	PQ06jn+UhzUYz8jzu7s0renRz1KSaWSqSZtFf3HPxxLSHD6QW3SjaOCGNbAACL4o
	YphSdfF7XhbCHEeNWJw1ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781807344; x=
	1781893744; bh=14jd45pqPEI5TcLnjz4bNQr5UXXjvZeRBPuWi6ehnDI=; b=d
	VHOLzkep7ZgMLEGF3qmXdbwt3050yWL+/zePZPwIhXFqOgRzUn41OxLiEyz0q7Ih
	r0C+37rCZclDO9Inl6SWdbT/mTMHKhDcPLi3ADAf92SWcKVA/bVisaPCZu8xbI5L
	F8+DXMAzuSoZISyg4GQqOZ261Sx6VRBN0JOrxTMvi3VJY8IFC5GPVzPHboHR4f6Z
	ZucUMubfFFm7XU+H6e2HwEXrzlU0/j09Dcwh0d7WevJENKl5KC09DKt4lJsP5Vra
	NuZS+9ufgRzI/Ugwgw2fI2PtnsUs7geVNWwR6HUw+Zoe6WFum068fxLmSxuSfjiN
	Vi7l7wBH3K2waK/bHvchg==
X-ME-Sender: <xms:7zg0asp73FiYK_szJN9Kp1eiv-J3mhNtSidr5pzovQkO_qPw9kP2Rw>
    <xme:7zg0ar-gPRtWfSNFlel1SSPFmA1sxC1H8XV7_pt8z38tkSCOZvQE9HRXyjMrcG0iO
    8Z4EIQ_rPheTlBW_z0SrkPo7bEHf2eZFNRLTBVSqD1r6SjMk0xRJQ>
X-ME-Received: <xmr:7zg0aofaMjBDMmmLF788DXEc-xF-s9xS469SyIXkengLUgKfEY_b3BTH8KXUMxJ4DWeUzVZi0H1PFqQrUw0Vprjv9hlRJrJ7JkRvjsyBOmGrEeMxkg>
X-ME-Proxy-Cause: dmFkZTEix/WoeT+anRG5xTiJkLZAt7IpefCcLr3D+B/JX5D4wz4uO6KLLSGcw978YuVAn+
    dvhkiyDbtcmhAUvnuWCrHL0zJUYXjyx/nGs/7hbKXkSlCAzBGVxGc+4PJVo1SG42H2pRiX
    uPNjdjmzxfRLO2LX2vGNnROZcc+sENKUN47pbAZtvUEv9Jwk49m8bg5ZwIESU2GjCTgsbu
    LPIPBcp7Oie+aqyirouCsUEfArBLWb1+vPvSV6eZ3cBptjUPa46YL68f+kZPmqevv1ZyXd
    uRdzpmOvv+uQzOkTfs1A+49HroFBhbNdF8+uXciPOopj6GLXHTfLwiOnhvEvCgn0IX/Wlk
    8sq2vbIsxV2tw6q7QIYCMRd/kwfwnONCQ9tLvVBbpF9t9Ai9QVoJmkfJNn/mBt7dMwhbI4
    7xoot2K18u/Dc5wX1VFqwtKqICdCalL99WlZdjkU29q93NrUn8QctAf4Kqre8WuuCxU4Jb
    hMuiNGLFhCioT1IEOF0/RSRx2RPAoSxyU72OeSLuJRCANze6bcrg3sC3IibXhNUbMcMIVX
    EzhZ/SOfrPgpeQs1CDRetuCm5pjJnur2Wxm6s92eJxVprY8Ew4xlH3l76J4bsw1dqF/Aqt
    NRvXC2Sup3zCmkKmnQw0z0/GSyGLp/1E02g4U3zs/0EYNmnSAf34kW8VhtaQ
X-ME-Proxy: <xmx:7zg0alJ0oEtdRbMDSsdvhYG2lT53NvcmYg_fHPHGJFdnHEYZm4ISsg>
    <xmx:7zg0aoipc8Gdjm6LLOq0rqitAMy1RjsEjBJsviNfIQz-G8HlU3Dh7g>
    <xmx:7zg0ajRjvYAi0lKEQDJLKGcuk-GLH7jqoNyLEbNRojWkPxKV-5UznA>
    <xmx:7zg0aiXR9275sx3kJ4SLdI1KNwksELfQMfnT9t3QFvhhJQ8UA_w70g>
    <xmx:8Dg0aqKCJ1LOUs8_02L_g5W3mt69yJqr_BYskyMVA7nkZVtaVskxnq-M>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Jun 2026 14:29:02 -0400 (EDT)
Message-ID: <f5049033-4d0e-4788-86b9-9ea791bdc0d9@bsbernd.com>
Date: Thu, 18 Jun 2026 20:29:00 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Joanne Koong <joannelkoong@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org,
 libaokun@linux.alibaba.com
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com>
 <CAJfpegsWpKE4kUUQo+NK_cu6oy6h6+A1M=xokvSQbFtZzu9UKQ@mail.gmail.com>
 <CAJnrk1b1nVFZ8dQYA=iGn-p182HNhhRfZEVe-e_ks_daZAU3Rw@mail.gmail.com>
 <CAJfpegvNyqSS2h28-0sB2j2HUoMnKd7StMsPbvNPz67PiS9w9A@mail.gmail.com>
 <CAJnrk1bK-3tpZoeJQKPLjgpQW2F0YQKVhLeGwkN_5tpBVpZ-VQ@mail.gmail.com>
 <CAJfpeguq+LVHoyC7ZzkF_VSAQdqmQFw4DBztiQA1Jfy=U+D9wA@mail.gmail.com>
 <CAJnrk1Yqa0nvXCBo6GzHc2bP_V5+2dHaJn+2pWkumV0QLr0nSw@mail.gmail.com>
 <CAJfpegv=u=jfOqtHXpEC60unrzO7XFeP9o9HM18AVqWfN=O0Ww@mail.gmail.com>
 <CAJnrk1b4r0vbrm_HNe5bV11FVmdKDNAcZzkoLtoW_hEmmBjpdg@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1b4r0vbrm_HNe5bV11FVmdKDNAcZzkoLtoW_hEmmBjpdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/18/26 19:20, Joanne Koong wrote:
> On Thu, Jun 18, 2026 at 1:37 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>
>> On Thu, 18 Jun 2026 at 09:03, Joanne Koong <joannelkoong@gmail.com> wrote:
>>
>>> imo the main benefit is for incremental buffer consumption (allowing
>>> non-overlapping parts of a buffer to be used by multiple entries
>>> concurrently). To recycle back a buffer that is used by multiple
>>> entries, it would require all requests to have been completed but I
>>> don't think in practice this is a bottleneck with reasonably sized
>>> buffer pools across queues. imo incremental buffer consumption scales
>>> more dynamically with runtime workloads than preallocating fixed
>>> buffers of different sizes across different queues trying to
>>> anticipate / guess workload needs. Overprovisioning small buffers
>>> wastes memory if those requests never appear, while splitting the
>>> memory budget towards smaller pools reduces capacity for concurrent
>>> large requests, and workload patterns might need either at different
>>> times.
>>
>> Hmm, so why partition this memory into buffers up front?
>>
>> We could just as well say that managing that chunk of  memory is up to
>> the kernel.  This would simplify the interface: the buffer size is
>> redundant, since it's the same as the max I/O size, no?
> 
> That's a good point, especially since we can just return back offset
> into the bufpools instead of buffer id. That's a much cleaner
> interface. Though I guess if we want to be forwards-compatible with
> having the option of multiple bufpools per queue in the future, we'd
> have to add bufsize to the uapi here now. Do you think we should just
> keep it as is then?
> 
>>
>>> I think we should still make the design for bufpools
>>> forward-compatible with supporting multiple bufpools if a use case
>>> comes up in the future,
>>
>> Yeah, and separating buffer registration into a separate op would be
>> one step in that direction.   It doesn't have to support multiple
>> bufpools from the start, but splitting out separate functions during
>> initialization is a good idea regardless.
> 
> I'm not sure I agree that splitting it out would be a good idea if we
> don't ever end up supporting multiple bufpools (imo, having this in
> QUEUE_SETUP would logically make sense and be more ergonomic) but I'm
> happy to make this change.
> 
>>
>>> From my perspective, the use case I see for queues supporting
>>> different payload sizes is for separating IO requests from non-IO
>>> requests (eg lookups, getattrs) onto different queues so that non-IO
>>> requests don't get stuck waiting behind larger IO requests.
>>
>> Note, "queue" could mean two things here:
>>
>>  - fuse's waiting list
>>  - cqe's on the ring
>>
>> Currently there's 1:1 relation between those, but that's not mandatory
>> going forward.  So we could have multiple waiting queues for different
>> types of requests, but a single uring for sending them to the server.
> 
> Even with separate waiting queues and the kernel prioritizing sending
> metadata requests before io, isn't there the issue that if the
> requests/entries on the ring are all IO requests and then a storm of
> metadata ops come in, they're still backed up waiting for the IO
> requests to be finished? Or am I missing something?
> 
> On the userspace side, I think they'd need a threadpool which would
> add extra context-switching overhead and would have to reserve a few
> threads in that pool just for non-IO requests, and then have a way to
> inspect requests in the ring to prioritize the non-IO ones, which
> seems nontrivial. But maybe there's some simpler way to do this that
> I'm not seeing.

I personally do not see the big issue to resort CQEs on the server side
for priority. This is a just a list of CQEs and that can be scanned
which op codes are in them and if there is an optional priority flag.
For example to aggregate to larger buffers creating IOVs or to get
better alignment for EC this might be very useful even without prio (and
we have a modified patch from Jingbo applied, but there are still issues).

Thanks,
Bernd


Thanks,
Bernd
