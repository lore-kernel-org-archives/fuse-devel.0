Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718083A3E8B
	for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 13:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505237; cv=none; b=XCLIdjFkzeNWkSCbPbgpqax0bLHFn1HwHnZ5XhhoV+nNgoo0+K/qZ0g/Vm58OlF0lPrDI2mpoyRgPmxhBMm8jNvBN9o6tAMm7wqd4HGlC7/UIzqw7NqKu8i8Y78kEUj9rIlwSah1EY1qCpW3CsKii+3pCxgCdqLS1OmNWxIfJCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505237; c=relaxed/simple;
	bh=YWy1NtUWDLxg3IuqJvPRaK1Vykyq9sRXPdzGhuDokVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkCyMa/zltSYCCek7H5LCWzvmzUQ6zLcoya0w60bR86p724FIPmmzg89+4jlxo6i1RXRFzTHK57MSSbaZ5/wMCSW9UQckt+dUf7+53RDGWNURqMXpxZ2h/TNcAqEwXRAkmQootTFI6luKpb5r0Qg6VZbS5IulR7ghj0tET/GjCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=f7jyVnwY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g2XCDCg+; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="f7jyVnwY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g2XCDCg+"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 8A5F0EC03BF;
	Mon, 11 May 2026 09:13:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 11 May 2026 09:13:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778505234;
	 x=1778591634; bh=tHkzDtIWJKBT+NS1yijCeOXz/foETklUXKLlzLGZ2ic=; b=
	f7jyVnwYPx1juCIm9r8Ssj2r1rZ0/zFefqXf5jKTpASJep+HrJ//3Ll5zE56VBtZ
	pN1rWsovSpNH4vXN0bnSb54OQBOJyhjVqLYW97dWSJ3hGF694LRoxgTljAjZhhAK
	9pqLoFZ7By1bcBl+vqE4wvqjdzkUZiwrSSsxoQH7+OJTk9p+djkBdBbz67QyLo6z
	qZdbWxWOHwo6CVLv2kJlIwbU/LDIQgH2KN4rIp23oNcuF0HLddJWJyIWlZC9QXOe
	ztJ4wggOZR2iix5MXvHgVdOjh62HdqY2zrhkbUCBTukU0+73LWZKv1N1DuQMPZe3
	iZT8psQ0A3qDsVlWdH5R2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778505234; x=
	1778591634; bh=tHkzDtIWJKBT+NS1yijCeOXz/foETklUXKLlzLGZ2ic=; b=g
	2XCDCg+LyZj8N2Vy/Nblh+swxQ0yrOHCVRnE3Rs6dSZ4LhGl9O6EVvuQ+ySrA/D2
	+MdByxju5iDlFmPxNCdZOipVDrNr8dheskxuNsdwDA4sYP3Q/uXOokJM4KVErFyl
	e565PTkSPAU8hnrgDJLgRqqAgrTfB9riFo7ZDUYxDI8+Y0xdN5yZ5PqxDJKiWi0C
	009vZgoTQmsew7Vsl788+9O62m5Pt39p5AlIDu8uctEdvSliqXUudXrJhvkr4m/w
	WSdZWgYjBPytTVWR9sTLRyHI4ZdaXZuja7RS0xFopWanA2fst5LCdMNruBNBnsdy
	ZwGqnhGoKeBHrNYWREXJA==
X-ME-Sender: <xms:EtYBaq1aCVlGxeyXEQXGgBgqlDmZ40K4racR4kYdy5VjpQSiyjKBfQ>
    <xme:EtYBaj_wGwkd5Om3XMmt8v7Egsm9XVSdcMFr2qkbinoShdV_Snua-kGfq-hUfEhuQ
    oXsF2w7G6rYKyizMfNNlOWHE_1MkoCCCyVWCkW_IVYTEe-aAfN0xQ>
X-ME-Received: <xmr:EtYBarN35Lk-LJrKJCE2QmS_reuYfktNeMb6e_LTWmzPgDmVMQooESynAlHQlUl-Bvw_r_jWRS4rHzTFMC8ErGZKAv4Y5G2oIIpvA0Hdf0401l2iLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudeltddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeeuvghrnhgu
    ucfutghhuhgsvghrthcuoegsvghrnhgusegsshgsvghrnhgurdgtohhmqeenucggtffrrg
    htthgvrhhnpeejueefhfeikeejheelgfdvjedvieejheduieefueekleeufedulefgueeh
    feejudenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsvghrnhgu
    segsshgsvghrnhgurdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehmshiivghrvgguihesrhgvughhrghtrdgtohhmpdhrtghpthht
    ohepfhhushgvqdguvghvvghlsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    eprghmihhrjeefihhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhorghnnhgvlhhk
    ohhonhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughjfihonhhgsehkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:EtYBanfzdoIDlUsjFHbWonxdNzRUdkQhxPco17AF8GhLe8X4OhYBrw>
    <xmx:EtYBaqVQLERvr3NylMIAo00jp3tprjibu5yI2ReSE__u2EjJ-3fqgg>
    <xmx:EtYBavjtaklVMrQFTqMk0RgjkAPkwO0jVM9Xa-byjmZpUWLtrg8YMQ>
    <xmx:EtYBap9qLRtDfXgsCkA-qwDhky3pivfC0SIDXShPpOMrHrc8OLNpFg>
    <xmx:EtYBarDwEx7V17T4D1adtHpr7-P5M9THZs00FdT140WXwM9z3bz4CG-O>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 May 2026 09:13:53 -0400 (EDT)
Message-ID: <6e0d96e9-803a-4c86-bc64-2487d862629a@bsbernd.com>
Date: Mon, 11 May 2026 15:13:52 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fuse: expand MAINTAINERS with subsystem info, update
 mailing list
To: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev
Cc: Amir Goldstein <amir73il@gmail.com>, Joanne Koong
 <joannelkoong@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>
References: <20260511123837.64930-1-mszeredi@redhat.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260511123837.64930-1-mszeredi@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/11/26 14:38, Miklos Szeredi wrote:
> - Bernd and Joanne are maintainers for fuse-uring

I hope that Joanne agrees!

Reviewed-by: Bernd Schubert <bernd@bsbernd.com>

> - Amir is maintainer for passthrough
> - mailing list is now officially <fuse-devel@lists.linux.dev>
> - change status of fuse-core to be "Supported"
> 
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
> [this time to mailing list as well]
> 
>  MAINTAINERS | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd16..6e3da76e4cb1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10574,10 +10574,10 @@ L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	drivers/net/ethernet/fungible/
>  
> -FUSE: FILESYSTEM IN USERSPACE
> +FUSE FILESYSTEM [CORE]
>  M:	Miklos Szeredi <miklos@szeredi.hu>
> -L:	linux-fsdevel@vger.kernel.org
> -S:	Maintained
> +L:	fuse-devel@lists.linux.dev
> +S:	Supported
>  W:	https://github.com/libfuse/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
>  F:	Documentation/filesystems/fuse/*
> @@ -10585,6 +10585,26 @@ F:	fs/fuse/
>  F:	include/uapi/linux/fuse.h
>  F:	tools/testing/selftests/filesystems/fuse/
>  
> +FUSE FILESYSTEM [IO-URING]
> +M:	Bernd Schubert <bernd@bsbernd.com>
> +M:	Joanne Koong <joannelkoong@gmail.com>
> +L:	fuse-devel@lists.linux.dev
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
> +F:	Documentation/filesystems/fuse/fuse-io-uring.rst
> +F:	fs/fuse/dev_uring.c
> +F:	fs/fuse/dev_uring_i.h
> +
> +FUSE FILESYSTEM [PASSTHROUGH]
> +M:	Amir Goldstein <amir73il@gmail.com>
> +L:	fuse-devel@lists.linux.dev
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
> +F:	Documentation/filesystems/fuse/fuse-passthrough.rst
> +F:	fs/fuse/backing.c
> +F:	fs/fuse/iomode.c
> +F:	fs/fuse/passthrough.c
> +
>  FUTEX SUBSYSTEM
>  M:	Thomas Gleixner <tglx@kernel.org>
>  M:	Ingo Molnar <mingo@redhat.com>

