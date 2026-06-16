Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5709F3B71DA
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605725; cv=none; b=hpn5e3+ud+SxNMiuqVjqypDVODGTZFEIzOs8go4NLwkL+ArZZtE1/BDbIsW035Y9aB8bV2WfYFO6pQiAoai5WxcJRpjz8fIMkDldIL5WCcY5TSgu9VkCpmqSd4McRtfZ+qHZH/3JGcA155AsJyCti20ekg8q3AFQS8ni92W+aQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605725; c=relaxed/simple;
	bh=HlwrjuJ0XzaK3b+wZePzEKMXzJiFWoM1eRzPDIQ0G8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWwUMylampmz7OUkmY5tpqdDNUYn4v3bl6k48Bl6ZlfBRci7pZ2Be6/v/TojUeT0fkjzA50LCn9KWsBeO/qngcmW8qyyCZvopVOhL7N4vYw/ASEGjco9A8HfvzdyikrAzAOpYvLPBbSTEIxZUlJzSUZ45rIYfL6EDGhUAaucF3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=kC//2ze5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ktxQW65z; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="kC//2ze5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ktxQW65z"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id EC6071D00168;
	Tue, 16 Jun 2026 06:28:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 16 Jun 2026 06:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781605722;
	 x=1781692122; bh=GU55rLXAFqqhp0KOxVjgPhp+rZYLC0kixFmD4C+9icc=; b=
	kC//2ze5WfYY1XtuP5jBCIgoD/Foc1t38vF4hpMS2fu6hiSF2p6FsTVyt9S2Qj1K
	Nwpc2GH+nyCD+aloKumPooZxOYZLbmU6tolh54ZifAaNh0mu82lYezQrGL/u5NKz
	bADI3MdzUzIdcR7Q6YLRXnU80GrVjz70KPQy8Iq2TqCqwk5bizFQ1dyBd+ksxkxZ
	t7a3+aS2+56MlO4OwzyEikrZqv0Nbvj+W3LG20nyEc3PpyTTU+sJtlo7KJmS+Ryd
	FAVhcfo963Pv1t2Ao0GB+PuYs1ABHTgucHMCOaISL+F4lEoUYz7tthSQghTwDWrH
	jk17nu1w8yNS7fQ0PYbPfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781605722; x=
	1781692122; bh=GU55rLXAFqqhp0KOxVjgPhp+rZYLC0kixFmD4C+9icc=; b=k
	txQW65zd6HrT+JHVebxg6W2SlG3I5Aqrri/4foMorHe+KDFvQW9wiyUAIA4VKifa
	zTqsMi9U7S4dbj3Ue9W0VSzSIHmnx/nO9rXmnyNQPir5PA6WpwKBsWc7CPmDbkLt
	R/INSKBdv63QFL8XaBlKiOk/xmae9giCQhL27N1yk0PEi9H8pgVJEjH5fYiicGOF
	qnE+n/RS6vURqa2xTqyCR2P4zRqwvBs2sIvkD84zFcwY2ITgWA2rDHowrDyN/blf
	2z8GXZqDjNhunkJxerSKyU0fYsUCyREEhqks1IvAzHjjruPEqh5BCnP9d6vZFPWt
	PY06qekHyX5iuO7GN96tg==
X-ME-Sender: <xms:WiUxah8D4QIYeaSPbIN5c7Cz4fWIlPjRWJQ555Hm6fLmO7eW_0-fGQ>
    <xme:WiUxavCdHQkT1JYU0DSX9B6XvhLz_RInMJ-KSU8mRUpXUH2mI1o_sMLEAZfpjzKxx
    5iLdHLwUz7ZAFTaTqRCM92_zAxcRF8YICT2k9bHLPlNHJ7lvTw>
X-ME-Received: <xmr:WiUxamSuN524y9nTQpiqIA2wCu9ODTWrsx6B3JlXEqJr9ui5BeFU1tkTFNL5JrovKHRZX0xreBHU4fJHaDgIGBVA_01V1kO5sSJjDipG7W50lAelQQ>
X-ME-Proxy-Cause: dmFkZTGEGqT7TeMM1dspnYhBAq6EEFiKhlVMZIcwD6mL/592Mys7Pb/uDbTym55uptICJN
    dAhxonmBKBCHeMMz42qt5lfuBiDujzXNyv1H6PvedochV1dimWT8xtSRlGtHQohsOi4vtN
    peselIk8hhp3+oUhB2BsrFf19tpKdZdYDCU1SD5FVOao5okPCIb6hRMlC8yw3yoj8TNP2m
    gCyuyk1mEbmkFt2K5TkX/lf96Hq0xQmQqyOLX2m0UnC/RIgRcpdzYwjKlqs9cbG3ttXNto
    90saxG8uCeTsWOOwEMJf9yTuWDS/Ds7QDXbO0IemiF/PV5XIAXEUuxLCSV5M8EDPr1//YB
    M2kNre60bGLOtWz6GRlUm91wVCHuHi1ZS90zx+IfeQD4rSLJUz6CSYf23OlZGV5nuTBxL6
    87G0vy62aVDkvSb6N5Ve00zvQV5KpS96hItQXIMVOcLAflNrdurcdd0Zw0ditmFbLe7lCp
    sv/lp6tGKvPBV7yJyzxxH6wFnmJlbJ952sxm4AcAL0EM8NwHqHSjpya6CM05B7qi3Y4rf2
    cVkE2GlWwA34MLhNBhLkIruXQ24vL9SHLq9irSmvRvk/CAza+WQ+DS9fFWpNYAsfHUUcP9
    cU/VqEXVSqQRfET1VlUTVwlPXLToOErZ/S7qbjS3KSxONj+8FQGi6iJIIT1Q
X-ME-Proxy: <xmx:WiUxams3wwJqn2PHqPAumLOuG1SwbG_7X-NsxIQydZ1PFehDcH9X5A>
    <xmx:WiUxai0xlX99PBnpk5Afh061JrdbKSYHxl9LnRdJ1L7eN5xhgfaUfw>
    <xmx:WiUxanVi_raHs9AZIr7cyDxJ49blFrP9Pk9cuRm2AnlV_q15l-tUmw>
    <xmx:WiUxatLl5Js5HaNLPSYbtlQfV6OLv39XH-fHlF5epjhYqOqSrDYBFw>
    <xmx:WiUxanrGqH77TxyUWLJevqwEftIEzSl-BUQWf9PtmvXvUxoXFPIR5am9>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 06:28:41 -0400 (EDT)
Message-ID: <7efc8efa-186c-4d74-a319-e4544acf1ef8@bsbernd.com>
Date: Tue, 16 Jun 2026 12:28:40 +0200
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
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1b1nVFZ8dQYA=iGn-p182HNhhRfZEVe-e_ks_daZAU3Rw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/16/26 07:28, Joanne Koong wrote:
> On Mon, Jun 15, 2026 at 4:41 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>
>> On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> wrote:
>>
>>> To use this, the server must set the FUSE_URING_BUFPOOL flag during
>>> registration and provide the payload buffer pool through the iovec
>>> payload in the first sqe.
>>
>> I find this interface inconsistent.   Decoupling the buffer(s) from
>> the seq's means that the registration should be decoupled as well, no?
> 
> Looking at Bernd's reduced queue series [1], I think we'd most likely
> want to also pass in the number of reduced queues separate from sqe
> registration. I think along the lines of the config sqe Bernd brought
> up, it seems cleanest to add a new cmd op
> (FUSE_IO_URING_CMD_QUEUE_SETUP) where queue-level settings (eg flags,
> number of queues, bufpool, etc) gets passed in. This would have the
> nice side effect of doing the queue creation in this op instead of
> right now creating the queue lazily when the first sqe gets
> registered. On the userspace side, this adds a bit more friction (eg a
> two-phase setup where userspace submits the queue setup cmd, reaps its
> completion, and reuses that sqe to register an entry), but that seems
> like a reasonable tradeoff.
> 
> Does this sound ok to you and Bernd?

Can we please discuss this on Thursday? I'm by no means opposed to a
config SQE, but I don't see how it will really help. My issue is that
any fixed number of queues and queue entries is almost never the right one.
The config setting (via SQE, ioctl or FUSE_INIT) could be used to
prepare the kernel, but final routing update needs to be dynamic.


Thanks,
Bernd
