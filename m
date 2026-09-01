Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC057411F95
	for <fuse-devel@lists.linux.dev>; Tue,  1 Sep 2026 07:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246537; cv=none; b=ENM8psehioE3CI0BsgLTTn2LnNAamGOWEiEboWwVfQyKBYbzl1aJYcKCLqAPp2lMMKQMsRh4WStrjMkP7KzlrLSs2XTfZdp8XSFRd0rQs5hbTkIhLbzoinI+gOklG2JIH5qsKxyNKMlE+0/6JCPDCKkAvHkIh4zubvccxwUaKUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246537; c=relaxed/simple;
	bh=s+rA/oJfvAQqoRdIJy0+Zoc+dBC+QVhLAl4NY61D5yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1IVGWNon6WwGW7VSQqu8Q4JE1dTET4IPtpiY9fKKMhqxn4qYHCjm6Mbh6RxK5aM1fiAGk4vE56NYtsJZnXp63qRzDG/ehjtd3J5Y4BLLk0muRymbaoe1YvjDvdr4mmekzDCoQDaYpGnFHixLIDkBPIBrxVcZ7XI5Sfr0EpzArM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=il4NvB8+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HwpXgIwK; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="il4NvB8+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HwpXgIwK"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8B51D7A00C5;
	Tue,  1 Sep 2026 03:08:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 01 Sep 2026 03:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788246531;
	 x=1788332931; bh=0HUitffnCzV7MqUhZcIiSOwrfeH0xmK+tvPQOd3zPXE=; b=
	il4NvB8+BVDKG7VXXSCHvxgjqn2plGS2HeZBCtMlg+s8nR2srHWth0HATK0ca2J3
	NEg1o8OW6EJ0llHSZuWwUP7Ky3hHEhnLPjwzWsOi17Z6ArUJpjRjaK0VxQ2Z+Dfg
	2tajvAbvExgPXjEbG7M4U9lDhRVDgB3e2F98WU26m2vzXvC29+BzV6IA2qxvK9mU
	lXQisIv5vddCbVEqQUKLI38g1vJ/53NnYOsC1KeG9zy9HQVQMOfxBFA3luIBL+5M
	iAK6Pq0TvJUUKN2T6vnz5mCko5mjyZn5FL5nmb+GwKRfa/63Fl11gNdzM7uMAIEs
	9q/ibxjD8ZPDvf8xZbmJAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1788246531; x=
	1788332931; bh=0HUitffnCzV7MqUhZcIiSOwrfeH0xmK+tvPQOd3zPXE=; b=H
	wpXgIwKpZ9w6GP+hB4/IYbMsumvpaEGeiv8FBedf0oUGYzS9j7j+l2ennF44xsxi
	n1eVgCdSth0brUhrQygv5ya4s+8erKc9AnmyAE+n1n81iJqpg+EChDMLAbxUGSMH
	wwsa+5gQJUy17t8d1bRzc/NP3Fpx6BNIpFq+eMG3O/1vnqxrWwqHRQyQPNbPBwwy
	4W5+Po2jlkSCtR21azA/S53CyakhBacg1W7LShWgoNFuPFm2i5DoHEaej1M+y3Lw
	vnD/i/dVMPfvTmNVvUU2Yu8mWXj0Sx0ELfdGk/6x0mYv5up+0sLjkLXBrCeh0RpO
	5ihwFNgk7WLzC7MbRQNKg==
X-ME-Sender: <xms:A3qWapAcEvoFh4w3GsUB6V6F94yUvGfAK7D-upXbqjFvtRsI5T7ACw>
    <xme:A3qWauhJTldALYAbxcwNUv5Nw6iy09SZ68byVtQ0eXtZzuBXg41ZkriT2MYrmN7Cd
    QBUACVvYhH_8ElCr9ZHg4mJhTdNb5k2KRH6GztuSVlqqHwQTJQi>
X-ME-Received: <xmr:A3qWapn1hUIiPdUgjOP1unRN92Pc02fHuKPlpwZq7SdWP04lANi-jM3VpFdp-4pu2kbET-T0pYTWxn4x9ePhCZYwdnrGU073WWuuG0lTX3AavT2Odw>
X-ME-Proxy-Cause: dmFkZTE3Kdpcwhfn6CjrqnRdOc13xYmUZIhHqabG8bQnKpMG1zXn/B7zY70PXGjP7WJkWu
    glfZ3byeHRmO72Vdb6XF2bicHkl7tU2tDPeJmg8U89WCSED28wf7pCT9Sz1Jk038vljHwm
    +8D4t98pB7vPmRGTdpQvBEJWHtYoF9fT9fqOcqaVMP5mTY8W6fi8+GmA4F3Afvs08dWfXM
    AMToujyFLGGefR7Tt4FCfhtmnIvXN5QLKASn5tcFKxVsW1FYZcypmAyxf9q+8jXciKqvaP
    P2b6SvIkGdwL+lsex/t9xqyOD667TIHhJvihEUrXIZSsTeqm+VWuzg53g1mEhysq9Ccimg
    c6lFGSCVEpZORnNzg3nD5HnteCJkDTuAqbXuIaX3eGKFi6h9A6hBonwDgmLxYA1G2Q4V3k
    5elP9PoGnfKOTU53sD+B80QIUwcYt+nUSzK3IIRAGcxWBrOE+nqbUIDgeu325HW0w/rML5
    wHCCLWdQCPoD9+o5eVx64EsOHCqwAg+qbywpc0Yp2XauZ0l1qfTYoGe6ksjP455paaN2qM
    +og29ynQzXoFNlK+hAEEkjzBPt6CU8VElf1cs0XtparxGp1D8NXTZHhLPQmKEXTMOknJln
    7vunD5oVUstjYmbECMvf9ZnIpiKxzxYIPZuVtSN1g3W+EetrdRL7z5fkRH0w
X-ME-Proxy: <xmx:A3qWaioW3Z0LwlGHCCu7UsP1o-pcczvfEWPrWYi7QFSjfkpICGOIFg>
    <xmx:A3qWaqFhBWH138H-bELMbWcwzZGY27lOLNOBziAX-Zc7VaWdTG88VA>
    <xmx:A3qWamyFAxJHa2nPHHcAL3FWtsB6dUlWi165sX24fOGPY7V0IE1fRw>
    <xmx:A3qWanrq2QR3GAiwvwbNeokNsXwPFSSN5ZvjK0haltk4OgbwCLg87Q>
    <xmx:A3qWalK3GJNovIbkynaqP8kdIZvSbAy2hv1bjipUddRGtoC5kYG63S2b>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 03:08:50 -0400 (EDT)
Message-ID: <a164f719-58f6-4fe8-a26d-96682a654af8@bsbernd.com>
Date: Tue, 1 Sep 2026 09:08:48 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: disabling uds interface by default in libfuse builds
To: "Sonono, Tofik" <tofik.sonono@intel.com>
Cc: "david@adalogics.com" <david@adalogics.com>,
 fuse-devel <fuse-devel@lists.linux.dev>,
 "Andersson, Magnus" <magnus.andersson@intel.com>
References: <7592d7af-ba3f-4506-a69c-ae9efa542566@bsbernd.com>
 <CY5PR11MB618643B25E49C18F0B6C3B1082A82@CY5PR11MB6186.namprd11.prod.outlook.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CY5PR11MB618643B25E49C18F0B6C3B1082A82@CY5PR11MB6186.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Tofik,

[please find my reply inline as custom on kernel lists]

On 9/1/26 08:29, Sonono, Tofik wrote:
> Hi Bernd,
> 
> I see, thanks for letting me know, and good to have this spotted.
> 
> Perhaps adding the build option makes the most sense, but why do we need to
> guard the addition of the custom I/O API if we have added the
> documentation that
> describes the requirements for its proper utilization and
> implementation? Is it
> to highlight this issue for existing users of this API so they get a
> compilation
> error when they upgrade libfuse? Would it be an option for us to add the
> desired
> validation in the `stream_read()` implementation example to make it more
> correct?


isn't the problem that <uds-client> provides the socket and an
<application/fuse-server (libfuse)> reads the socket. So if <uds-client>
does something wrong, <fuse-server> does out of bound reads, i.e. the
part that is not guilty. For <default-client/kernel> we just expect that
it works perfectly, but with a userspace client that guarantee is not
given. To get it perfectly safe fuse-server needs to add a lot of sanity
checks and I'm not even sure if that will work, because <uds-client> can
spoof all kind of data in the headers.

I'm fully open for discussion how to handle it. At the moment I don't
have a good idea how to get it perfectly safe, so my reaction is
<disable it by default>.


Thanks,
Bernd

