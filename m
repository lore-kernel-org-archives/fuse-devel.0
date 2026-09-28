Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401764915B2
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587671; cv=none; b=Ni1b0hWBnbOPQkiW2CzuabdHpj2xyjeFE6e9LG0CrN61dctdQtLBHcacD7okIdffEZyPGEsgLunuGn5dPaoDUoYkYTEUsjYvPwRS5zEI+nWqoM6BlwOHCAODHXbgN9VESVnfienpQ6Wn3vT2uEW3bm9WSLmV5Vw3wdr7FnCpxl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587671; c=relaxed/simple;
	bh=r5e3PZCHnmpCIRbOzof6AEwOH3Wf3SxLf2SpevNtVY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m84VzHUcK/PNwHkweu6gxLFRngVNhReWHiGgBkCPx231FOZXSbI5exLk23/dbhMbH3Kk+WQ6m8gwDZE1gKIExtG0UldcyZeOWUKWR9xym0uDKTVc+3xmBoamXG8G8C7+rzEz67XK1teIAhpcsDVQKAf3I9J8tKmQfpjDEzEvIcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=aLTVbh70; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AYzGMa0K; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="aLTVbh70";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AYzGMa0K"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B8B0F140008A;
	Mon, 28 Sep 2026 05:27:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 28 Sep 2026 05:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790587666;
	 x=1790674066; bh=zY0YNtpmK3gHI1aNrtBej6fIVqn58hK9wWzeyuPKO7I=; b=
	aLTVbh70zWsG+Bf7uUf5BV0/bIq99trDNyStCY7bxe/yT8jbLflvt1Vd6uPiLv6y
	jeG1B0f0WgeDmYR/riUaBzYQvZaIrZuVn1h5495CYhGG73WJjZ1efQqDev8zPiVX
	xgOzzm8Q5ZCcBHHvY9I6fmdqXh1Vjt/QfvO28dDrojbeFmxwYBjFaTI6wVkfCt9N
	iaI+yHmXWv+v7bDTZmXnWi+Sw7mVBzhvkdWV68CRqImzLJcGVHTEuaRJMGgH7ayn
	uaNNS8yINa7gDHuLVVgFO+zefKLbItxRX4PfpBvaydorBB5vQRuQXA5JT1trLFug
	wWozJLi+DbwN2P+P1WAHGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790587666; x=
	1790674066; bh=zY0YNtpmK3gHI1aNrtBej6fIVqn58hK9wWzeyuPKO7I=; b=A
	YzGMa0KYrs4ZKU1A9jo1/Dzq8wH8fnYHArNt2cxeG7v8Kj1J3Ko7e/ZJAVdXF7cF
	Kmhmz2ARH78c9uoAfqc1Wh48/gwRGSjSBFnUjMjLTsf7/GAy6RSaL72FezlL9Pui
	uD1plg3tpLWH64twosidkffAzCxzABcAGfguk6aErWP59VgbMtXpFfukSh+y0xr2
	xBrJsX3zLoW72YWEm1HDX5RnZ4uTKGAfWffwzmiETO6cFd+7Rf5nEb6Ei5URi3ll
	eUJ/pJ5IiSJFU5VuePHvbyUtYGxD8oCL3XCUzcBUx27z7ZYqWKlMxY6g8HcJLpwi
	oxBOj6ksC9ZiLOojmLkaw==
X-ME-Sender: <xms:EjO6at09MvE8-XSPdjgGVk54RQh2Qwh29FzmohPJd-pEhpEpeyaTHw>
    <xme:EjO6aqGESFyw9O8mA8WdQsI803S4dwLzUfts6vHF0F6LJCZd_qaxr8rP4VFdspSYF
    mg4hpllZiN7P26w-Drvd-6ey60r1sbkSRJ3Mw0uhmSTAw4hX6zH>
X-ME-Received: <xmr:EjO6argUvojGaZXQxox9toj1VjY_PGU4St65PrCWNeozXWBe_b1ujCN-CKHuyW_WfgJCWfTTapkgfJU5_RHTp1KsaMPm02e-qML_69YvWAmj2mOmKQ>
X-ME-Proxy-Cause: dmFkZTGJn1ewzSBScWPXa1Uh1zW7/iBvyiJ1SbKOwdXkyiA2TPTV7OEMBLUNHSHcMWkL2n
    wjCnY2e7xrGPb3rJ6pkvQodPDtTL+pMh2jHNn1iLsWKeTLZV+s4dh1wrSloXPXtRJqYgHp
    5ucCYzfYYjw3PoApmsFGHVFo1qlzig4npgwb20j0sUdD9BgME3X3YAep4kGqorp4SQs7Gh
    P/4Xzsa2L4Es+QYgTp8lrD5mVv6f6ER3flWDGZitI0eyobJ4q1Fl1s9xEANYFcGn9qzskU
    HCMFtGscTwnPdaFDj1sB+w/sItrSuffrGg1T5QkpbVYoHm5jUgh79jmc8/A69Vi45SpQmB
    T/8ZH2fR4BztfK22ryHp83vtt70QAlIHc2WErIy8MwGg1bjVD+fYLJPfPeWEAwc9SBiM0C
    wqhYfEsyjPFM5bCJoK9wOtzQyQIVb7YajDqT3kvhNaT/jR37gYpnQH/F/e3IeIQ0b2aB5I
    xjsh+vFyeEh5ldTZI0Sq0f2T0XlTs6mhFrrHrv+vY/XeCgwoEsm9Io1vy3qSnkSW1fubh7
    DpRBe2COYz/zcU4uKH76peAa6GfvvvjxoQpJLA0S8lqvm4yFfScOOrRGKbuVJ/jc/MfT93
    YRyA9GGpO5AhSJ7KzWtZgUyrNGivcOxH4TVozc+9hB19vJFZJm5UTxwa04SA
X-ME-Proxy: <xmx:EjO6al9rBtGQV46-JbtPTiICQUSGeNqP0y7rQ58UYafDDngCHuqsfQ>
    <xmx:EjO6aiqPjQuZObq2z2vmnCBAkzOUEApZJwgafsP_W7TVJmr6DnYlng>
    <xmx:EjO6ak-cNR6DHxh9wYse9GVc_I_ZvvmLs2-m4GaYpqWMGB3v9nMN6Q>
    <xmx:EjO6amU6q30-7KIQJWVIvHvPXqQR214MnYJ1DqD1M_siJ74uYxSQYg>
    <xmx:EjO6agK-Vpcw72CvJH0jb2-F2iuihqfUvK2jWRH4q1QdMDX2U2G1buGG>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 05:27:46 -0400 (EDT)
Message-ID: <39fa696b-738a-47fa-9cd8-d12c87811262@bsbernd.com>
Date: Mon, 28 Sep 2026 11:27:45 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] test: mount the service examples through
 fuservicemount3
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fuse-devel@lists.linux.dev
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
 <20260925-mount-service-bound-open-v1-9-bbf1a84c7995@bsbernd.com>
 <20260925222512.GW6253@frogsfrogsfrogs>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260925222512.GW6253@frogsfrogsfrogs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/26/26 00:25, Darrick J. Wong wrote:
> On Fri, Sep 25, 2026 at 12:23:37AM +0200, Bernd Schubert via B4 Relay wrote:
>> From: Bernd Schubert <bernd@bsbernd.com>
>>
>> No test ran service_ll, service_hl or null in service mode. No test
>> checked that mount.fuse3 mounts through a listening service socket, and
>> runs the filesystem program when the socket refuses the connection.
>>
>> Assisted-by: LLM
>> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> 
> These are a reasonable set of simple tests to make sure that service
> discovery and startup work correctly.  Thanks for writing these tests;
> I suppose I had become over-reliant on testing all this via fstests.

Back when wrote it tests were still based on python-tests, I think (and
hope) that the new way using shell scripts makes it easier to write tests.

Thanks for review!

