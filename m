Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D9E3382F9
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 12:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781266092; cv=none; b=T3aHrfv11VcCPdpi0uMWetGrP/oXMQyftbjoknrS2FEL+73EhKGKgbVOOxoNLOT6uvx5YyM6gx9HgFAOCEwuGiKBTLR5OW1mh+ElYdQl5uAy2o392Jn1tWUiJsLizsloF66vPYRvMOPBeo3Bu4Xc/2mMvsa8TH9E+kTRRIzNCPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781266092; c=relaxed/simple;
	bh=sR4Ai+2Z1bC8Vn8Yatxg7ZOFEhq3JakG8QY7VESS6xg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Bbvirr6YPG9h0Xg0SJgjT+3ucf7DIP0UINqtPZXFNkKqw11K4RBaYHQ/XofY6IyYYdZRWLzUVrQZmf8VBoiqm+tsAr82BS+3Cstb5SHk3lsexcR1RiVsAzYpG+c4ZdoelJ/qhIJzgYOcjuDJLy3DycC7z0CcBXPqyqmbP07JchU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=lrxBxmJ4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XkDAmO+V; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="lrxBxmJ4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XkDAmO+V"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 060DB1D00115;
	Fri, 12 Jun 2026 08:08:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 12 Jun 2026 08:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781266088;
	 x=1781352488; bh=jLedmP68/aEnxCViSN5F9uUs6keyLfpsnnfSlQxEfSE=; b=
	lrxBxmJ4PNWo0PkFYeeBu4Ue2yL3hpfWm3ZhHBFpKFvZPvcEdW0En+Y1PGKFJs8Q
	ikbfVQenrMq+ZJIJLaXQywqQ7DIExQHpuCCjcfmnt7ftt5Vk8nb5OKlu0xqMCWLw
	x0dOGsp/MvJLRTtzWBy06yZswficmlPiuzjWPcBRkKifdwXbvm3RgamF2PJ6wY4Y
	Ye9IDb4LZoVnQ0hC+Tlur1mK8v+hAyrNzjkHHwtFN1T9Readzvatq+ppnDDS9JXs
	XTcrxDhxpLegBhKClljcU91GbShRkvWh3JJMPx8faq9J71WU11YvUgA/Szbv5E11
	aVLpAqQIchmnEsEdNA8K+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781266088; x=
	1781352488; bh=jLedmP68/aEnxCViSN5F9uUs6keyLfpsnnfSlQxEfSE=; b=X
	kDAmO+VGBVvVnOTQYKx8OA7ur42UvvtdvUAle8QPjd2Q28V0308gxpTelB3zPBvJ
	6Ww8uOe7UtCnjeQt4M3R4OTq0X9P6MpGy+/9BoFVj0arXEdMpJtbLlM5orDtlZKJ
	gVizNh0gzg+V9/uHin8rOw2vq7fUUVmwG6Y7S3/1c4TebpftiwJDsz/ukexIRE0e
	3FNzXF11XYdZ8o6TjjOPDxmrZqhLibgmrNOXN+VNlmcQYVjjT2jTwBRNVSX9ciQR
	h89wpyOdf5ZyY1G60XXkQIoj4XpLe5sWVKdeSc7tLbQU0T0mlBPxDyyEintNS3gJ
	zuDb/DldNjyaKTxuVUP7A==
X-ME-Sender: <xms:qPYramiFft5MFT0r9kxsAaefmR4d137JqgQ_-vKe7hj5h6As8x570g>
    <xme:qPYrat4jx647Eb2vxOHMlf8ww9oRzPYRRbOV0oG8jNwNJc6ZWExiv13DGP_UJguKL
    IcoHt0nlZlcGvEmmNvXyyDMoFduy73AnSszvt4FhEawJWHz1s4K>
X-ME-Received: <xmr:qPYramZMvoxR8hrwkhsIQNjc7Zi0feJ9YLY_1C64-43f8T7PA1seVk3qffKtqmOEQroVL3BdFZbw02U2qvG5YILTZd9kclLMzsWrZfLLIeBARoROVA>
X-ME-Proxy-Cause: dmFkZTFJy5+eoIL2IIEKSUBFf14ODfi73GweoUeE/iUwN2EpXveFdhrMtgh07TwpW7J1YM
    SAGoTbRrrH0eNyPKc5/eq8eyba5bvE9gXIwuSu4f2QTABQImS/zEG2E/LQIkxoL9wSz3sa
    xWmhkODFxqK3Z/DDlTl46XgO0K1vqMYCRhogC+XYAlhOTQ0KPk2LCM9RZaY90RY0+OmYOq
    sFwZfz7pBl+kSSA0WJ3+WQSWzN2KRMaCfIEnCmT9MC2isQ3JR/KD503MZVDhLTq97COost
    E2HHSA++fZnuK+o7CskGfjpt3AA/LzCLXAqw26UGcMQiBx8aWo0MDWS1zNuyaiWVDNiRpn
    2EKaQFPHBCHURIfEwM8i4rq449oGMUsaEBtBPrBVu7mKfRCbNjIFUHjaxPdUvVBFbMjtXQ
    hgDxjL7pbs87QRoQcsLTzIs/HCIZfiwXAL1owfuMI2anGtFnRS00kNdI2/FJydbs9qf8tj
    hd4ryr4RHI0Cgc9KLLBqIQhWJ4WbcxzMwTgdi7VmvQNEy9Qz+WE9kB6iVRXOmP+Vj8NNE/
    YxYiRQqIx7pnSQpveU9QrIErdSEmdQwvDQ0QBt9gwxM0Jp7Ebpnc7jOQhCSGzDuiXfWilZ
    xc5vfnzRuFkjDh3zWzdMwslU1geBrPf3pmr8ikEFJrEvfkOcqHqvEDZeJf7Q
X-ME-Proxy: <xmx:qPYraq5VU02rGe039rhUucF3QrfCeQZpzB0_qiGxX3mea2hqdTIq8Q>
    <xmx:qPYrahCM8-Cc8MViqV0caa2IsRXd1vc0tgkpRabkb2ky77ZzMGf7tg>
    <xmx:qPYraodcRZrb7qqvG5qrySOiOZhEDOS-XHB7KaTj92W4_UqOdgnfeQ>
    <xmx:qPYraoL3VrXx5bQA5tl6imoZNxZ7wRFEbW48O6ErPaneN9skw6fMBQ>
    <xmx:qPYravYagXhXJ_5LutmjyOeIzUluJFjSaAe8XjOlQf3_ZdGitFAz0LLb>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Jun 2026 08:08:07 -0400 (EDT)
Message-ID: <7e7a6a26-dbb0-4fe1-878b-01e81b939cb6@bsbernd.com>
Date: Fri, 12 Jun 2026 14:08:07 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
From: Bernd Schubert <bernd@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu
Cc: jlayton@kernel.org, axboe@kernel.dk, fuse-devel@lists.linux.dev
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <20260522205823.1597313-8-joannelkoong@gmail.com>
 <80f49e88-c342-44e7-abef-f65e84beb9b0@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <80f49e88-c342-44e7-abef-f65e84beb9b0@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/12/26 14:02, Bernd Schubert wrote:
> Hi Joanne,
> 
> I one generic question, could you also add in for which kernel branch the series is? I think I need to do the same for larger patches series as well (recent reduced-queue was based on 'miklos/for-next'). Basically 'b4 shazam' fails to apply on linux master and also fails to on 'miklos/for-next' and I don't even know what the base for the series here is
> 
> On 5/22/26 22:58, Joanne Koong wrote:
>> Right now, ents and buffers are tightly coupled in fuse io-uring where
>> each entry has its own dedicated payload buffer, requiring N buffers for
>> N entries where each buffer must be large enough to accomodate the
>> maximum payload size. This is suboptimal as most request types (lookup,
>> open, release, getattr, etc) require vastly less bytes than the maximum
>> payload size and some requests (unlink, rmdir, fsync, flush, etc) do not
>> require payload buffers at all.
>>
>> Instead of requiring a 1:1 coupling between ents and payload buffers,
>> allow the server to pass in a buffer pool (a contiguous allocation of
>> buffers) that the kernel will use as it wishes for servicing
>> ents/requests. Buffers are now pooled and selected on demand. Entries
>> only "reserve" a buffer while actively processing a request that
>> requires a payload buffer. This decoupling reduces the memory usage
>> requirements needed to use fuse-io-uring. It allows for future
>> optimizations such as incremental buffer consumption which will allow
>> non-overlapping regions of a single buffer to be used simultaneously
>> across multiple ents/requests, and the possibility of multiple buffer
>> sizes to be supported per ring in the future.
>>
>> To use this, the server must set the FUSE_URING_BUFPOOL flag during

Sorry, had missed that in the earlier mail. How about renaming this to
FUSE_URING_BUFPOOL_PAYLOAD (or so), so that it would clearly
differentiated from a possible header buf pool in the future?


Thanks,
Bernd
