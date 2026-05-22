Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4781E3655F5
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 22:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779490154; cv=none; b=gyEo3DYHNB2+sRCzcxP6Lpg0tYzWMSpOsMQzfW/3HRh20DOeEQ5GGn9+tJZ/kKchsLjQFaaNmvSrbMlfGP9zOhVACATfsG73O77Tjg5yF6Yw254FEjdFMXZ8JlxutEhaLmFU2E3iTYAXt4jSjij5ak4o6Sxbziy7jY3bHV34XXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779490154; c=relaxed/simple;
	bh=fy19EOyasTFHTWYrKzoUxcHDrqldx7fUZXunUOFzEjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AeCvo/Q2uIdP7gO++qgr30q/rcPJBbTbVqZYjNzhq+LhbWUqDcXh6MzV5sWCRB0JM9I8VJCGL9lQ69TVGbYx/V8LG96LL78M66VhSW5iuSMx0kkyjUw1VZWjL6J7KiWX/TUKI8jPnqvRtlYG9wzy90e112ZUBv5jMbmPC8UkOt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=hgJdGLRp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uBjO4K8L; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="hgJdGLRp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uBjO4K8L"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C6B877A008F;
	Fri, 22 May 2026 18:49:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 22 May 2026 18:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779490149;
	 x=1779576549; bh=aSK+cvtIJ7HpcAHcQGme7OHM2re9PSn4B9+qAhh3mgY=; b=
	hgJdGLRpbzQQz0kgF/Siq3Vzg0VhESJKN2FbcTQmtMwZKt/SRdAHmRLyzB6r87t9
	CTDLba5aIftdCk/rFqEMmbCQ6nWzw2maQ7k7E48Ub4VXAfg9LyjHiTPdBsF2OXxD
	P1cayk9XdZetcRCeCa2wZSKEWgX8IdoMe2KXLZbogfVOXOgfjEFT6KAnP3CrrMk5
	wrrCRsPDxwz4yLwTvoEl1v81qSdSprdfo+cB6E6fSZ0imKKjbVDpVLMCvHfCbVIg
	Tu+Y7IgX2B5fmG9V1ZwN6pSyphRa3nxmIlWKR2TrnoaiZF9jyWrpAAIMdOZHyPQd
	AsbWFowpq0yeCHbIueaP4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779490149; x=
	1779576549; bh=aSK+cvtIJ7HpcAHcQGme7OHM2re9PSn4B9+qAhh3mgY=; b=u
	BjO4K8LMJX4eAS/r+DZeGQn05plmd9POWl9F6VyKrH7LKb4aJfMnYH0dNcJSRdgU
	gGRJBRlx44en5E8MOu+zA0/x82j1uU19oZ+qd31YaQ0Fpb3s6HzgVHAjQETFmWkV
	PWoo2/v4RZjpS+aBUQGKNMEa1HoagOsCOCKF2evCCRIZWGZlNseMtbT5uySZAyy9
	1XIRxUb4d82YPBt6wedP9jrY9Dkn6ycZXoJyB+lqfpJNJLibQ6566kzHRi00bXwM
	/ykeV5E0mYH7KC6typawt7hn1c81OiimRGKlvD2gEjdGfaTe94voN4kRBVxrTNzY
	rwJB49/a2ppqGnwiiqZwg==
X-ME-Sender: <xms:Zd0QapLbksdVxWkMFQbMNRDcrPq3Ix3sTSMMHEq4zQCNYK5BtqT3Mw>
    <xme:Zd0QasCPkQynzA5IYHQPlPbV3vWUCGVG5q-fU09B78e8D-xjPFQcjOcO-D4R2mFgR
    LmGUpWrwKcDCrgZqUEvbRgKMmMvXrgG5gRnktM1IbhLHQZMlkPW>
X-ME-Received: <xmr:Zd0QaqBHM8kIUa2XxMT1MKV3hD5W6OJkRYh65LhwA3_BEWbCZS3HfS34PXAJxYF0M2wVCGtEcXpb-uPlEHPHTHrYX2oVF1ft5pXZEQPNtqpSMg7q3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduhedugeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeeuvghrnhgu
    ucfutghhuhgsvghrthcuoegsvghrnhgusegsshgsvghrnhgurdgtohhmqeenucggtffrrg
    htthgvrhhnpedtuedvueduledtudekhfeuleduudeijedvveevveetuddvfeeuvdekffej
    leeuueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepsggvrhhnugessghssggvrhhnugdrtgho
    mhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjh
    horghnnhgvlhhkohhonhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhikhhlohhs
    sehsiigvrhgvughirdhhuhdprhgtphhtthhopehjlhgrhihtohhnsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegrgigsohgvsehkvghrnhgvlhdrughkpdhrtghpthhtohepfhhu
    shgvqdguvghvvghlsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:Zd0QamBpUAreRpDmzR18-BxNUAq5aRCjldS-LcLq0RfsZAQRJgRIvg>
    <xmx:Zd0Qatrafjwgox6B1GGepHbNR-Gi8438Kzsg6Q_vFu_VP2_6mi4pcA>
    <xmx:Zd0Qaolkl4ujxtMzex4UhvzEFmXGXEHStoyBcGHxpywnEVS_zgwmEw>
    <xmx:Zd0QalwsTkbYuThB8Xa3we8EE0Txbv8Uk3KmgnWwbQTVMU9j5S_NzA>
    <xmx:Zd0QajiFU4TNo8E2a8hDrl5OMr0bpnwMozj41MZSfNR4xDkPxMpcjLDC>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 May 2026 18:49:08 -0400 (EDT)
Message-ID: <55b80c43-2e84-4a42-b383-108f06254b6a@bsbernd.com>
Date: Sat, 23 May 2026 00:49:07 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, axboe@kernel.dk,
 fuse-devel@lists.linux.dev
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1aV1Z0wBQ=ViTKEsojrVkqaNnpRHiBOqFLRL+QtS2gMPA@mail.gmail.com>
 <1c3ef92a-d3b4-47fc-9d34-9c996b8eb0c7@bsbernd.com>
 <CAJnrk1bOyoUD74byw3ZXWzQ3dAiZObE0V46+=rtkPG8-3vqUEg@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1bOyoUD74byw3ZXWzQ3dAiZObE0V46+=rtkPG8-3vqUEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/23/26 00:38, Joanne Koong wrote:
> On Fri, May 22, 2026 at 2:51 PM Bernd Schubert <bernd@bsbernd.com> wrote:
>>
>> Hi Joanne,
>>
>> On 5/22/26 23:14, Joanne Koong wrote:
>>> On Fri, May 22, 2026 at 1:59 PM Joanne Koong <joannelkoong@gmail.com> wrote:
>>>>
>>>> Changelog
>>>> ---------
>>>> v2: https://lore.kernel.org/linux-fsdevel/20260402162840.2989717-1-joannelkoong@gmail.com/
>>>> v2 -> v3:
>>>> * Rework the uapis to be more ergonomic. Use io-uring registered buffers
>>>>   infrastructure instead of doing pinning logic in fuse. Get rid of header
>>>>   pinning as that makes no real perf difference
>>>> * Rename from "buffer ring" to buffer pool. Logic is the same, just different
>>>>   naming
>>
>> short question, I didn't check the code is header pinning still
>> *possible*? The problem if we do not pin headers is that
>> io_uring_cmd_complete_in_task() cannot be avoided, as the application
>> cannot write into fuse-server buffers and headers without pre-pinned
>> pages. And io_uring_cmd_complete_in_task() basically means a context
>> switch for all sync requests.
> 
> Hi Bernd,
> 
> Header pinning was dropped from this patchset. I have a separate
> branch that has header pinning alongside the changes for avoiding the
> fuse io_uring_cmd_complete_in_task() deferral. I moved the header
> pinning changes out of this patchset as it doesn't tie in with getting
> perf improvements from using registered buffers, unlike payload buffer
> pinning.
> 
>>
>>>
>>> Just to reiterate, the logic is the same between this version and the
>>> previous versions. I just renamed it to "buffer pool" to decouple the
>>> implementation detail from the concept since it's uapi facing. The
>>> buffer pool is managed as a buffer ring internally.
>>>
>>> Bernd, it would be much appreciated if you could take a look at this
>>> series when you have the time. I'm targeting the June merge window and
>>> the io-uring dependent changes have already been queued up in Jens's
>>> tree since the last merge window.
>>
>> I will try and right is probably a good time, almost through with
> 
> Thanks!
> 
>> libfuse sync-init (remaining are bugs), Darricks series is also almost
>> ready. Although I don't promise this weekend - reserved for Darrick and
>> other libfuse changes.
>>
>> One piece I had been pondering a bit about, though did not dive into the
>> code yet.
>> What is if payload would be registered per ring entry (as without your
>> changes) and just the header would become a buffer ring (so that could
> 
> I think payload buffers must be decoupled from ring entries if we want
> to reduce memory usage in the non-zero-copy path.
> 
>> be pinned that way without loosing one page per entry)?  For zero-copy
> 
> For the header pinning changes in my branch, the headers are one
> contiguous region (not per-entry), which circumvents having to
> allocate one page per entry.
> 
>> we could register entries without a payload? Advantage here would be
>> that that header buffer would determine max number of entries, only
>> little memory would be needed for over-subscribed entries, but entries
>> themselves could be registered dynamically on demand.
> 
> For zero-copy, entries still may have payloads (though the buffers
> will definitely not need to be as big as the max payload size!),
> either for the non-zero-copyable args or if the request's args aren't
> page-backed. Unfortunately I think many servers may not be able to use
> zero-copy due to the CAP_SYS_ADMIN requirements, so I think it'd be
> ideal to minimize the memory consumption needed for the non-zero-copy
> path, through the buffer pool for the payload buffers.

Well, my problem is still why would we need to register ring entries if
they don't have buffers - why not just register less ring entries then.

At least I do not see the use case for ring entries without buffers.
And that is exactly where my question about keeping the possibility for
dynamic ring entry registration comes from. If ring entries register the
buffers themselves, every ring could be set up with a single ring entry
first and only once ring entries start to get used, libfuse could
register more based on demand.

Thanks,
Bernd
