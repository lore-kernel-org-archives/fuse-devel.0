Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FDB47DF95
	for <fuse-devel@lists.linux.dev>; Wed,  5 Aug 2026 15:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785944134; cv=none; b=dSua7y2F0Uwr0TffnY9f5x5hcIBDEopv9Kq4SznSxbSFftieg0XUUEYynRuhrE26QOsLc3Sb5di1uCYIBVTLQMuxrFHrh14/5UP2A93yWIj2uiN6JbM7rsr7JXXo/6/eEZYnV1dydh/vYtEm404IKjDlzXc2AToISAcZJG5z33A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785944134; c=relaxed/simple;
	bh=Ffov6x7aMRWcNdjw3BW2cf688BpyZunYkKTHRb+Y8pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUaQG5G/KrxNnDqeikb/nBUCqFweM+RvAnfsdp0YBf0tbhIJrBZdY8res4+fFV9pwKX1kSz4C13lpxc8d2K2MFnx3R73gwuxG5231CYxT+jhEho+t/VHippiCluSdrqHMoqhNqnjOgIOHGg64zRl+zeqW/r8Q28J632x6gx0oX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=lWmI4mQ1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eJjswOs+; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="lWmI4mQ1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eJjswOs+"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DB1597A0135;
	Wed,  5 Aug 2026 11:35:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 05 Aug 2026 11:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785944124;
	 x=1786030524; bh=HGeUghNr42wAliyy3ZMpQtbhlpd/K1eYU5gGYzBK/Is=; b=
	lWmI4mQ1s2mRdN1O5PbqiiwXahGlFUYu6lEPh/V89/eH7OjO5lxlS4Cma0dNwmm9
	Y3q/P4qQd4PsLZCHkeInlDOAfeZVoc7CThXafxZ3yvyeBvbNJPhz/fEHEVpHpZeI
	2qjtgpADmhDbT/WcaaJVdHABzzx///kkT4/3E+fo2WC3xsoUT2MS7DL1l9RoIgew
	MEF+RaYUZkfi56EVzX2TjQHm6EE0aHw1T6dePBY1K8Nr/uX29B0qKONF6w5C1V+g
	hXlxwZvFqjr4X1jmygGtJuDVK4de5pPsKDsoflzTVsUB1v8+iCgYUwbfFVreEaHx
	moGzqsCqh/zztJsG7qWkqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785944124; x=
	1786030524; bh=HGeUghNr42wAliyy3ZMpQtbhlpd/K1eYU5gGYzBK/Is=; b=e
	JjswOs+akd4vt/EY7tosijVONw7un850jLHD6jLdEyRoZHenuaYAZJ6XK3cYPNBy
	0bOC7BzOo5MzB73rPbfUeK1nFHprKnkZ7Z8GNBycBgRhI6TlZg2LbzWE/dDto8vT
	XKFF+ByqVihvm6Oq7fbglFVXs2Z0hK7a/lKrhXtTSLyPN1Snlvev71v6m+wtK6W6
	qpxQqwuThhmuRU3+GMsQ1HQfcQy7rh0S50+VT52qN+0/oEn/X8RJxpVft41gOJb/
	RbW6kTF68rwjaLK8fdEOaLBYYyiEa/QQ3+XMpopVsDC12JiMDdXYVcTEDy8ye3xA
	Kx5h3Ot35XvheC7EMBG9w==
X-ME-Sender: <xms:O1hzaoiiENERIsEbt84GH-w2AV51NKDymSevbEDSuxk15Gq-sMUDRQ>
    <xme:O1hzahvSKkrwaKHU2nOy0bPP-YsCmobP3ursHVdrm4sRei91_2KiMjbeRm2DR1X5s
    XYTkXZJto4wGUzfpXnsUgwxpHQmdXirLXRHkiNyc2JLmGr--l41_w>
X-ME-Received: <xmr:O1hzauSLmG9JP6g3WcsgKD8Jd4xNjNHm5rYhgbX_Jeu8ZtLkwwGw0CGlRDrCk7B5mB7KYZVU4nclcBKEBZTrLnWdEXh7l1FhrXJbopBH2VTojfoIFQ>
X-ME-Proxy-Cause: dmFkZTFPGwIbPtQuDb9A9pElP9sM0ztlxGqki7tIyMlzkufW2L2kVpPhyUZTfluhxdVdpH
    KKQv0KkFN0OInihQ2njLuaGVs0Mai6FhiDCjouLaFG6EVLRsl4LotU4KEjJgUQFUAZ33B2
    gk1JvbhFaHFGZIBlv7pB852BxEZSzA+9USy6kSx8ZRCnvGIe6Z5L76uNFyN8aMMyFfw2QI
    M8GOZAm82lk4ZhzHWcFnuMWcoqdcwFkiHiL6U5mzckwIfUCCG2GmPjigJpZhLz129QhOTl
    TDrXtX5Fwn7p4efdwCRN+G83Qb3o451mnpQ0r8nVplNwcsm3tYnNDfZ63b62PMcd44A5n+
    94TtYhhj2vEQinNBIhr0BzCGdfAd02mD12i95g2ZMLcZYQQ9e5VBCCmWAgR6XQPURlz2x3
    9BeXkP+quMzsPxwuQljhn+mThPmQcEX4BcpFOyxulvvyYaT+KlJK6573toW1jKHSoVsY5R
    j5EYhtOhWfzQ+ARIiTDRSkWoPv4BlvMBr8py9QCldl1uPfct/oD4bqln8Nf6uPPpqMwl4Q
    zbo+xEIc1LNOoTMq15gO+Ki+AYwNGoTfvCM5xG7ZGVEAQtD3+9Ko3xoneYJmW5TGxZDMST
    HWzk2rsuN78A/QISOnZOyE9arjUm1XguktPgwH4T5VNqrXq8NPF+boI3o/QQ
X-ME-Proxy: <xmx:O1hzat3HH5LGXSY2cvByFCUAFlOyinKdoDpZE2r1Bz1-LwHX0rQBTw>
    <xmx:O1hzarsCrx5gfn23mrmNUKnd9CAVNxBb4SM1tafvd67DD_21fYpZmA>
    <xmx:O1hzargmxYnzEiuQtJRzV3e4b8lSdpBP1IN16kSxwEKiVc9npzkLMQ>
    <xmx:O1hzak-K555VAAX7Ne22PRvo01y7DOLBxFVZc1fgGLMLYY3ixHzEpg>
    <xmx:PFhzanzML7rGy9QFlnRz1Y80S1yNJc1IlDrvN89-3yjGsrLyYAOmQGwP>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 11:35:22 -0400 (EDT)
Message-ID: <24e71071-1571-48ef-972e-08cb6564eaa6@bsbernd.com>
Date: Wed, 5 Aug 2026 17:35:21 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] fuse: decouple fuse_ring creation from ent
 registration
To: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-2-joannelkoong@gmail.com>
 <CAJfpegsNb=1P7Vh+DVfg3Ve9T8ggHxi1Y-ZhqiQ6R1bbnCTHGA@mail.gmail.com>
 <CAJnrk1Y8mwyeqqL=CaW-=Qn+kRghZNbJqSMqCSW_8DDCVyKKgg@mail.gmail.com>
 <CAJfpegucmqTZan0rLL8YoKy6h8UCzKuZQAsvasFpHgy64Nh4JA@mail.gmail.com>
 <CAJnrk1YMO2FgReO0Uc8Axx+D2C3WWGgU2YF6R0XSk72AvULXEw@mail.gmail.com>
 <CAJnrk1ZUUk=Emu1AfGtZ+GBHd7pH_9h1u-0kUstPVJ2cT38N2w@mail.gmail.com>
 <CAJfpegsAQfAp85ZBCX-picMnqAvBQCNWTVVO-Vaz94nj6HkWFg@mail.gmail.com>
Content-Language: fr, en-US, de-DE, ru-RU
From: Bernd Schubert <bernd@bsbernd.com>
In-Reply-To: <CAJfpegsAQfAp85ZBCX-picMnqAvBQCNWTVVO-Vaz94nj6HkWFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/22/26 14:00, Miklos Szeredi wrote:
> On Wed, 22 Jul 2026 at 01:10, Joanne Koong <joannelkoong@gmail.com> wrote:
> 
>> We can fix up libfuse [1] to no longer send REGISTER before the
>> connection is initialized, so I don't think a kernel fix is strictly
>> needed here, but if you still prefer kernel code to coordinate this, I
>> can send that out.
> 
> With async INIT this is possible by waiting until the write(2) syscall
> for the INIT reply returns.  This is because the initialization is
> performed within the context of the write call.
> 
> For sync INIT the initialization is performed in the context of the
> mount/FSCONFIG_CMD_CREATE, libfuse can wait until the respective
> syscall returns.
> 
> So yes, it's possible to ensure this from userspace, no kernel change is need.


The patch here from Joanne needs a slight update:
https://github.com/libfuse/libfuse/pull/1561

I can amend myself next week (once I'm through with review here).

As I wrote there, I had run last into -EAGAIN last year and had added an
-EAGAIN handler. Pity that I didn't record in the commit message the
exact reason :/


Thanks,
Bernd
