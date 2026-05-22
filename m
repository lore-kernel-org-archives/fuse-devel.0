Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7FC33A6F2
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 21:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779486684; cv=none; b=DBd08IB7lKCgVCOlnlsKhNd7rklbJAixn2GBkjloEKYW1/gmJRHnTlB7fO7AQndM7YUS6cyF7Kf195aJUB7Q0hrO+oDAvXa/bZUou027+vj1wsEvklGgJyzjsB7EoaQeyLCQZqIN9UNaxEOAsgzwSE1D6oszQaIBBVyxgR0Alug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779486684; c=relaxed/simple;
	bh=xb97CuRBNov81tsHUvDWZvGGZPVzFsvFQLxkj8ZzYiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuOtkdlwjFjsETPbwBwScR8h5vbm7FHSiV4VeXQhG6toQt8Hk6fCV+hY2v7k7sv6IutLkYL+vrFUBFWZmRZWlhLIVP8pDjJV0tFg/aM1KxP1XdX/XtavD8pg+OyWXWWq1WXMKbBNniC1DO4doP4cAI/4eXksOLQYYrCmRJ/F1Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=GLCjQI41; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Qg84flTi; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="GLCjQI41";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Qg84flTi"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id CC0FF1D00067;
	Fri, 22 May 2026 17:51:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 22 May 2026 17:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779486681;
	 x=1779573081; bh=Nn9kWuKB7xB2oZS7e2TF5FQr3t0BhBJGxGAHXqYg6f0=; b=
	GLCjQI41SuIUssEO/iOkhBY0dyr8cIlUgHNoyv8CY0jNJ/HXo88lD6CkHDIvoaaS
	rS7+Y+x1mXnmmPfWb71X8apaTZOB0fKcNcXzEmJGAoQd/DZWBVIOn9oge5zdI45u
	dxDILf65neDJomUZv0XGroOIEGUJz8y8eC9NwkK2t3g4z3Ccwo9lC6dUvJkf9xnO
	+3anGw3yuv8eAHeOP2Y8H8EDkMOVH9U6a8UoMJ7mh1zM8pOMxl0ieQdCD9yG9tCu
	XSWC0dIRT4PscNzQL0hakThrZySL4/lOaUitns5FOnTx0hjyLCBgHPOnJnUh/2iF
	oNsNWmZX8U9fLVg75NbHJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779486681; x=
	1779573081; bh=Nn9kWuKB7xB2oZS7e2TF5FQr3t0BhBJGxGAHXqYg6f0=; b=Q
	g84flTiEWcSpgZNRMQwwG+SyBjGxuNYB+7wI6jH4AYxwIGCX5nSm9oBErgw8BI6G
	jV6N0kVVix6r0M6IYYEIhdkJow3kKJZvxhI8kKylcYQLN5lz9AJngGXs3jjLfsPs
	iMpTPPltZIBEvpdlS79MLJJzX5UeJ10MN+6gXCDabf+ry7yOx+BzNIVWaxn1B7It
	raa+7NNV6Mfreluh7yOP5iUC5BmdmRlbyLW52NEXYsjcV6PkU0uImDWquQmIHxrU
	pF4uSnziISw2CUENUmngKP18rTscggpsgH5SKFcSQFpHYAj8z26vZs5JhHpOSRkW
	jadx34cu7/fsMzkAO/9+A==
X-ME-Sender: <xms:2M8QajELRRNBLHFWcubRjkK9WgAxrosNjiawIHMafUoljVt9WNIALw>
    <xme:2M8Qar1csq7ZDc_d69Mq1_yMkZvh1FeON8gp9SZAmKcYJ3fZMbMHYvgtZTodp5ttw
    -bhJAboevrdH8kiV8sPkYegl78y-PFklwCBJNgxfnVzO5WPZVA>
X-ME-Received: <xmr:2M8Qarl0IIt8L5aUxjRU0xATU2Do4TBLj9VZoineqWyMSPCRQ3TW_lutZ6y342nvirS_D6JzUtwlAKr0B5tUCp6tyyJJqrZKWnK2OEBsLeEDjM4eLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduheduvdelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:2M8Qar-lUaOd3jzIKRL6GFgorTq90cYDf8YZipmmBzzJuxLqJ79HgA>
    <xmx:2M8QagqGvVZ7Ky2ryamAzkuOq2W79LxohBpKY5Yu8Pn3SCavsHQqOw>
    <xmx:2M8QaklWkMiBmK-fkZD9c9nGOkXvZskkNJMbdDKpjWb4H1PtqzQVdQ>
    <xmx:2M8QaniUt-Mxz3Pk2Ect-EBxWdcij2Hy2i8PZDN5qnPICyBnIcC-9A>
    <xmx:2c8QaqW2dOstAVPpg_Bj63uBSd9Gy6FnZ2boh0JiTFfdS1lfIpTf12Os>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 May 2026 17:51:19 -0400 (EDT)
Message-ID: <1c3ef92a-d3b4-47fc-9d34-9c996b8eb0c7@bsbernd.com>
Date: Fri, 22 May 2026 23:51:18 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu
Cc: jlayton@kernel.org, axboe@kernel.dk, fuse-devel@lists.linux.dev
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1aV1Z0wBQ=ViTKEsojrVkqaNnpRHiBOqFLRL+QtS2gMPA@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1aV1Z0wBQ=ViTKEsojrVkqaNnpRHiBOqFLRL+QtS2gMPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Joanne,

On 5/22/26 23:14, Joanne Koong wrote:
> On Fri, May 22, 2026 at 1:59 PM Joanne Koong <joannelkoong@gmail.com> wrote:
>>
>> Changelog
>> ---------
>> v2: https://lore.kernel.org/linux-fsdevel/20260402162840.2989717-1-joannelkoong@gmail.com/
>> v2 -> v3:
>> * Rework the uapis to be more ergonomic. Use io-uring registered buffers
>>   infrastructure instead of doing pinning logic in fuse. Get rid of header
>>   pinning as that makes no real perf difference
>> * Rename from "buffer ring" to buffer pool. Logic is the same, just different
>>   naming

short question, I didn't check the code is header pinning still
*possible*? The problem if we do not pin headers is that
io_uring_cmd_complete_in_task() cannot be avoided, as the application
cannot write into fuse-server buffers and headers without pre-pinned
pages. And io_uring_cmd_complete_in_task() basically means a context
switch for all sync requests.

> 
> Just to reiterate, the logic is the same between this version and the
> previous versions. I just renamed it to "buffer pool" to decouple the
> implementation detail from the concept since it's uapi facing. The
> buffer pool is managed as a buffer ring internally.
> 
> Bernd, it would be much appreciated if you could take a look at this
> series when you have the time. I'm targeting the June merge window and
> the io-uring dependent changes have already been queued up in Jens's
> tree since the last merge window.

I will try and right is probably a good time, almost through with
libfuse sync-init (remaining are bugs), Darricks series is also almost
ready. Although I don't promise this weekend - reserved for Darrick and
other libfuse changes.

One piece I had been pondering a bit about, though did not dive into the
code yet.
What is if payload would be registered per ring entry (as without your
changes) and just the header would become a buffer ring (so that could
be pinned that way without loosing one page per entry)?  For zero-copy
we could register entries without a payload? Advantage here would be
that that header buffer would determine max number of entries, only
little memory would be needed for over-subscribed entries, but entries
themselves could be registered dynamically on demand.


Thanks,
Bernd

Thanks,
Bernd
