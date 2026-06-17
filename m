Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3996E3FB075
	for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781706161; cv=none; b=OVjlWKeCSjXiC+UgnSRPMWMx5RYneJuVU0QvR8yDhUnBH6bk/0ahY9WFJe+NX7cXropONF+9juDZS+N6RaTP5gd02247qkIXGDExU14Li6H9Su6+PLEp9ul8On5F1fme5ZWtbN8RFD2VimtsI9jZmSJDn7Pjk+nF1RS9qHPgwoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781706161; c=relaxed/simple;
	bh=x7naKrMU4DHdabhlEYv+2Rp4mnUdf4RbVYoQu9D3Zxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNiLGkSyBborYSIi8dtcxpGuYtMRBfYzxtlPi6g7HTTYBBldtMob3swIQaS0hPJamSawcXESnZWhTo3hfHn2bFcM0w7d7QeASoodxBZWg7WS+rh534sERXAdgkR8OIdb+ql3WfhLCXej4+Fuoz7BFBZ6SlPX4hwoS1Z2SEsSGFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=BEzP2unG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UA86iBG3; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="BEzP2unG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UA86iBG3"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 3030FEC0200;
	Wed, 17 Jun 2026 10:22:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 17 Jun 2026 10:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781706159;
	 x=1781792559; bh=uW/Nq9eIDHzJ1oEgqwunI6zQ9FZ+0xJIYejCEv3OiY0=; b=
	BEzP2unGzorv0dRPwBpkHxfzRy7rPYWh1etTE2O0BWEWTNcVAJT/nMAI7gFZdmZ7
	VJVbqPoYcV13apismxz2/sQt6MRKYihoSiPwc2J6dL9UwJbvCn+nDdPjdZOyNL4w
	laBr1XlxtQJvWoZiN7BleQQcIlKbdTvO3HZPhVZlZEchqMbw9gBQyJg2c+k4+qIH
	q7IW+e9t/0XPO/5juyfKpC/gT0CsLT+f0F5/6qm518RA6dOx7suFt9scGbXSFngH
	xtL40ZA7rLubfGA6+Z5qn1TEk8gdTt5H/LMZIsXs2V2DHRmyXMeFBITHVbPzlz4a
	3ciGuKVdzMjVxlmScWwJUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781706159; x=
	1781792559; bh=uW/Nq9eIDHzJ1oEgqwunI6zQ9FZ+0xJIYejCEv3OiY0=; b=U
	A86iBG37sQaE5ASu7cNm2JP1xNVStkoZhTQP/ghodaH7sk7OcjhnZO2YNE/cByHn
	TZqxymSCao0yZE6rZhu8Zs2uMv5cHR2H9ULTnAw5Ow2Z7hjIPJAV6FR/1eMx+htT
	+fjr004ql/RNDuNDLrfcxhUhHCB4UWKikJgZ2FjHdlsEEj79VMJETVcH4mNLNZf2
	k8GTWC+q3fcpHWMPv+uC/LGnCnm45+ImM6XjuGx7cBRY5PVcpTb6/GB5GtFod72l
	cje/mfLBsZi7Q42J554g4r5OBwx4LoTdbsGZAKCeT3C7TZajbRPiu0jIbNjdk1UA
	9YlxQLMDi7ts7j5R7FfGQ==
X-ME-Sender: <xms:rq0yaoihp17UuE8eOzJWtZtS4ZVALMyWaIdDREPA-eYY6sDNj3Wyyg>
    <xme:rq0yaqVmzaUY6tvW6I3ylo9sWIeqtVg4goK6dsPifq5jnDwoLS-WKt3MKmGqbshcu
    QHTjiUdlB5FKeW_S4vOT83urnHtAVAIxu9LVFtoiR4VTAbg5-KW>
X-ME-Received: <xmr:rq0yanXBPj99YjrA2EegKSu4ucqJJSfF3fLmuOXEKoj4EQptY2R4ahzgCmKGyCKyjxJycFis5_yqBiDVFFTTdAOvmNKz3vQOQuxDdZO1PS0QCNnOxQ>
X-ME-Proxy-Cause: dmFkZTEWlLB0txU9cXQ7GB/PPTuwvH89a7fuegLmS3N7RkX90L9cmj7HrL/NERK8XQ9R3/
    ADfdRZDXEXleZ5q6jUhl/qVCKOzKfP2LUlszk7r23psCu+kGRTqH7b8l2WOSxGr9seqpBi
    gnh+XjJphIa9gkhNVIBtyRrXa7t3NkVNHGS+R7pe/GJoSCpu1N/XMVENEP7oD+LdFXhLfd
    fbSO3Wc6LnkIaU/NfNAQqx6vM5R3uru4c1N+3cDCpVBranhaQvzpXs/QoPIRcEHK1ioonM
    w9j4f9JGmR80YqiZegSDUk/rp8DFWf0uleTzLgNowQcowgzdgcv4Mlqb5uKixUbWxUrAbG
    p3k/OPUOEnTqXauCj/yUH18uw4x3DBKDxQB2JG2OcwkLYfyJtWkFurLdXjHWx+vJmvwFqs
    xMYImVVFH51nRqTQ0htuUj0jNd7z3+fDV/m/arGsboSJj75CWWzqSDUgA5vKjEETPHTUnX
    y15+UjPgPWDKgGP0AOJWiN2II9XtheFscSo7o8ElfUhDN3oxdcLX0+sW9RVSJVYZw2dryN
    zpEyxwCcKxC811y/InyyzcXuBy3M33D4msMQuRwCDcW+dj47I09RdttVqH/YFOKKgQ0k4S
    fWNeeslCY6Sa/M69fXphkmZtF27XFE2PW0FM7AwsDyvP7kRtUTU24sgvETAg
X-ME-Proxy: <xmx:rq0yaqibk6xJWCSSazSvKV3rEKxN49A2L6Yjjz4IFWRifdqNzZUf2Q>
    <xmx:rq0yaiatmlVchsaT9TLqMxvkU0FYXkyrachCdQelG0w_duHeNWSMEQ>
    <xmx:rq0yanrhQfz3pMW4XR0AMfvCsMTDpPqwWyjvA0qD9CMvaArz7duP2A>
    <xmx:rq0yavN4XCz3_AENxFwQrPAP53wGo7CTqwi7u8jFeMNEF-1hJIzbNA>
    <xmx:r60yavC1sYOsubxs_l5SsUS3K6l6Z9jyH9HccMJxaNB3cE1ut1b3gcNn>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Jun 2026 10:22:37 -0400 (EDT)
Message-ID: <6d80e19c-00d0-49de-bd8b-7571a81b942d@bsbernd.com>
Date: Wed, 17 Jun 2026 16:22:35 +0200
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
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1bK-3tpZoeJQKPLjgpQW2F0YQKVhLeGwkN_5tpBVpZ-VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/17/26 14:49, Joanne Koong wrote:
> On Tue, Jun 16, 2026 at 6:26 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>
>> On Tue, 16 Jun 2026 at 07:28, Joanne Koong <joannelkoong@gmail.com> wrote:
>>>
>>> On Mon, Jun 15, 2026 at 4:41 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>>>
>>>> On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> wrote:
>>>>
>>>>> To use this, the server must set the FUSE_URING_BUFPOOL flag during
>>>>> registration and provide the payload buffer pool through the iovec
>>>>> payload in the first sqe.
>>>>
>>>> I find this interface inconsistent.   Decoupling the buffer(s) from
>>>> the seq's means that the registration should be decoupled as well, no?
>>>
>>> Looking at Bernd's reduced queue series [1], I think we'd most likely
>>> want to also pass in the number of reduced queues separate from sqe
>>> registration. I think along the lines of the config sqe Bernd brought
>>> up, it seems cleanest to add a new cmd op
>>> (FUSE_IO_URING_CMD_QUEUE_SETUP) where queue-level settings (eg flags,
>>> number of queues, bufpool, etc) gets passed in.
>>
>> Why not a separate op for bufpool registration, so it can be done
>> independently of the setup, possibly at some later time?
> 
> I'm not really convinced there's a compelling use case for needing
> multiple bufpools in one queue. This was the discussion with Bernd in
> [1] about this. In my opinion, incremental buffer consumption and
> allowing different queues to support different payload sizes would
> address the use cases of multiple bufpools within one queue, but would
> be simpler.

To be honest, I have no idea how to implement queues with different IO
sizes. What would be the logic to select a queue? And what is if we
start with an single max-IO buf and a single queue (per numa) and then
scale up based on need? Let's say we have:

Start 1 queue (per numa maybe), one max payload buf in that queue and
allow to scale up to max nr CPUs for the cpu to queue-id mapping. But
now additionally we get for the same CPU

- multiple queues of the same buf size
- multiple queues of different buf sizes


Also, every queue has its own ring, syscall aggregation is not given
anymore.

For me this does not make any sense and to say it with your words "I do
not see a compelling use case for single bufpool in one queue".


Thanks,
Bernd


