Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45911234964
	for <fuse-devel@lists.linux.dev>; Sat, 23 May 2026 17:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779556087; cv=none; b=EHGpcg8xRvrrrjz2CZ5+Yx3KNqVu32ihudKFZT+yOEju/tyeJvXa2TqsLyC2qjs2X3xb7eJg7ZQnurYPg7YQ4w4XdZijuKJyQfMSWabqTGSwUpl+tTV6AYJCrcOpCRdkK2VUJjT/l1/tic5dEFH+b+B9l2Hu6tRIeLEoZ5/m2GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779556087; c=relaxed/simple;
	bh=ZiqZNVQuwx0YzG0B8M27VYNjIWMhUM7kgARG4jwRhS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/X2dPWevgXXVxj3XNy9o9qRIGimborLAl24RQQZeSb8IzVX2ESfSuSn3sAW9dJDUIE5qyu8V38kFZwHijFkFN190OzvMXiEaMQYA+RdDhhVOyr3vWNfb4bqIYbURid8LSkT/SwA86mpSbRv4w9d8vvsUq6znrNzFlb9G8J0i88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=ojp2NsE+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hsctJmNl; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="ojp2NsE+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hsctJmNl"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 4597EEC0071;
	Sat, 23 May 2026 13:08:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sat, 23 May 2026 13:08:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779556084;
	 x=1779642484; bh=+U5AbKzwXKSk/MfCoUn3Mlt6gs27lzjX4snx+BB42Vc=; b=
	ojp2NsE+sJuTp3qe6DnLSNs8QJMjGay1aHFk4k1OxhdOvINFKdrFkkPrW9ekOaAS
	stPqeVCIf9+iHbmYn10L//ve4RTS8ch7FWeNgEBdRp8nimhzbUIa+w1II6Yt75R1
	mx+0Dz0QJ45ET6fY6tsORQThcwbDFWZZH80GDt51schW2oNKLwc5o2B4EKr4I8/e
	kmMnlWu43b5ILnnog0ved2Unb42c+C2UlZtqUq29S7AEu8sd5Hbk9a0Uz/IuBJTf
	5Hr7GQ+dpf4gaExxGgJfnfJ+n5dJE5sXdCymTyAojidvjY/QFsT2IyMyLPwo7SUu
	cRrkyZHlHPwgz/HB2SpxVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779556084; x=
	1779642484; bh=+U5AbKzwXKSk/MfCoUn3Mlt6gs27lzjX4snx+BB42Vc=; b=h
	sctJmNlJRYF2Ca5IRV8KZH/DMIzBAHXxuAx7NFRDSYtaG3M0dIdQLPYRJM+RLNyU
	ZZReurgyx87yWHiyQVXdNfRrw4pzVGCJXb+fRlOfBvxIe7wtDvD2UHpdE9fdCC/8
	PfDTDIG3XlXIQ116QN1APdYu+fdMsZl4XvrbuBI9xMxqrab29kqfJcJb028MCiKs
	RYCpZxBcjC90rpUJRHatsRYl4SXog5Zra5y9dzx9QiXSX8ltORWaqPzysNB/m7pw
	0l7X34CaDEwMQ5lHz/Zp23UOB51NgKUh69jDf8hOagmnSoSZwoc+g+DyIBjI9x9J
	d8hjoxdfEPQaj1eYv1sVw==
X-ME-Sender: <xms:894RaiDneFAEKUpBqTFJb5o2tHUHencYPJCnpgUakXGmIqeLH72siQ>
    <xme:894RajYPzs_2Vx5MFV_ks49u9rG3D06ztSvBnaWsd9treMJFKeK1y5BlvcZ5NJ2m_
    OA8fN2wGoaB-s3zWbR8CQwR09UcRCdMC9Un2Kle4RYh621_kHG6>
X-ME-Received: <xmr:894Rat6QQRl0W2H6iMFW39RzJSlTveGuBla16oIG08qawx5kDJx_QX8BQpRC7Kz4JhdMzyAl2ME5-OEvD8gP7mVBn-CfJ_CDxNahDOWkpLfO-djB7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduheefiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeeuvghrnhgu
    ucfutghhuhgsvghrthcuoegsvghrnhgusegsshgsvghrnhgurdgtohhmqeenucggtffrrg
    htthgvrhhnpeefgeegfeffkeduudelfeehleelhefgffehudejvdfgteevvddtfeeiheef
    lefgvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsvghrnhgusegsshgsvghrnhgurdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehjohgrnhhnvghlkhhoohhnghesghhmrghilhdrtg
    homhdprhgtphhtthhopehmihhklhhoshesshiivghrvgguihdrhhhupdhrtghpthhtohep
    jhhlrgihthhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgigsghovgeskhgvrh
    hnvghlrdgukhdprhgtphhtthhopehfuhhsvgdquggvvhgvlheslhhishhtshdrlhhinhhu
    gidruggvvh
X-ME-Proxy: <xmx:894RasZMWz8uIMRn99gNugf4xrrMMWmLDqnU_ouMIYtyLJhDidPqMA>
    <xmx:894RakhRd7AmmhhtCEbIq8jeoDc0c1F-NWjYe_9Fl02vOEuqrFCE0g>
    <xmx:894Ral-lMLhevDeVTfnrZrEgbOEzGWMa8ZTu_oT1Aulmhg3ieKiRug>
    <xmx:894RanoLF01XMRkh2vQ_kupFdsCtIPwY4DOcBVnKlnFXvqabBnG2WQ>
    <xmx:9N4Ras7W-mV20TbZ8msJaSdum-ndDNuze-Uuhndd5WGl2rKsuVpn8P-V>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 May 2026 13:08:01 -0400 (EDT)
Message-ID: <1e952be4-6fe1-42c3-a691-114613f2120a@bsbernd.com>
Date: Sat, 23 May 2026 19:07:59 +0200
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
 <55b80c43-2e84-4a42-b383-108f06254b6a@bsbernd.com>
 <CAJnrk1Zby7T4WMShk+d8QdVoqtAFLSotc9_d0RbGKSnP4fXq9A@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1Zby7T4WMShk+d8QdVoqtAFLSotc9_d0RbGKSnP4fXq9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/23/26 01:08, Joanne Koong wrote:
> On Fri, May 22, 2026 at 3:49 PM Bernd Schubert <bernd@bsbernd.com> wrote:
>>
>> On 5/23/26 00:38, Joanne Koong wrote:
>>> On Fri, May 22, 2026 at 2:51 PM Bernd Schubert <bernd@bsbernd.com> wrote:
>>>>
>>>> One piece I had been pondering a bit about, though did not dive into the
>>>> code yet.
>>>> What is if payload would be registered per ring entry (as without your
>>>> changes) and just the header would become a buffer ring (so that could
>>>
>>> I think payload buffers must be decoupled from ring entries if we want
>>> to reduce memory usage in the non-zero-copy path.
>>>
>>>> be pinned that way without loosing one page per entry)?  For zero-copy
>>>
>>> For the header pinning changes in my branch, the headers are one
>>> contiguous region (not per-entry), which circumvents having to
>>> allocate one page per entry.
>>>
>>>> we could register entries without a payload? Advantage here would be
>>>> that that header buffer would determine max number of entries, only
>>>> little memory would be needed for over-subscribed entries, but entries
>>>> themselves could be registered dynamically on demand.
>>>
>>> For zero-copy, entries still may have payloads (though the buffers
>>> will definitely not need to be as big as the max payload size!),
>>> either for the non-zero-copyable args or if the request's args aren't
>>> page-backed. Unfortunately I think many servers may not be able to use
>>> zero-copy due to the CAP_SYS_ADMIN requirements, so I think it'd be
>>> ideal to minimize the memory consumption needed for the non-zero-copy
>>> path, through the buffer pool for the payload buffers.
>>
>> Well, my problem is still why would we need to register ring entries if
>> they don't have buffers - why not just register less ring entries then.
> 
> Entries may be used for servicing requests even if there are less
> buffers than the number of entries. Most requests don't use the full
> payload buffer size, so for example with incremental buffer

I think that is an argument for multi-size bufs per ring.

> consumption, this would allow multiple entries to use non-overlapping
> regions of the same buffer concurrently. As well, if we want to
> support multiple buffer sizes per ring, there shouldn't be a 1:1
> mapping between ents and buffers. There's also some requests that

I can counter argue that fuse-server can just send ring entries with a
different payload sizes - fuse-server could dynamically create as many
ring entries of the right size as needed.

> don't need to use payload buffers at all (eg flush, fsync, rmdir,

Could be handled by multi buf sizes as well.

> etc).  As well for registered buffers / buffer pinning, it is more
> optimal for the buffer pool to be allocated contiguously and pinned
> contiguously rather than passed in one by one as a 1:1 entry:buffer
> mapping.

I don't think how the buffer is passed to fuse-client/kernel matters for
(userspace) allocation. I had written before that libfuse's buffer
allocation is not ideal, I had it continuous in initial development,
then run into bug and for simplicity changed to per entry allocation.
Switching back to larger allocations is simple.
Regarding page mapping/pinning, why does it matter if the buffer in
kernel is known as per entry or per allocation (assuming payload buffers
are page aligned)?

I think the more important part for buf rings are pinned headers. For 4K
pages the loss is maybe still acceptable and the remaining size could be
used for small requests and I guess would have a perf benefit. For 64K
pages the loss is quite a lot.


Maybe let's summarize

Bufrings
- Fixed size, allocated at startup, cannot be easily increased or decreased
- Allows 0 size payloads (FUSE requests that only need the header)

Entries with payload
- Allows more flexible setup - fuse server _could_ (not implemented as
of now) create entries based on incoming IO.

Neither provides real multi-size buffers per ring.



Thanks,
Bernd

