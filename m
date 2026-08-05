Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB6047CA6C
	for <fuse-devel@lists.linux.dev>; Wed,  5 Aug 2026 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785943697; cv=none; b=Kp0Dy5lIlZEuo9vYa6numTzG2W5Ed//l5lGc+ICdIgpwGIHUDNXGTE3LYuG2vYhGe5dVqevVIVZv20Xjc4ARdWiKpP6mE5kZpMOm54FEe1TiVrkNqbipo4L5wdXgftC7vUHOhZrglBjeNILEUIlE6e3IhDtb019WLE3ORwZ/Iqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785943697; c=relaxed/simple;
	bh=Qyd41A0e5XUizgcjYbHkN2HjN0qhiUqVbl+Qw8Bbf6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NeiHNi3fOGTk7PAv0TXa15WALrZkzL3qZ/bFx7Wok256yACcWO/7p7HL9hgBFvl3Bl/JxFuSdiDkj4DAaVP4oke6ubSOQzB3Dwui5nicgk8tz26KdyjtvjHL+kKxJAa75Y4A3sRGOeq/LvBf3LJFXYf/3IDo8XK4sRMfECVwxNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=VRxF2Jbt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Rd72da6E; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="VRxF2Jbt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Rd72da6E"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1B2607A011C;
	Wed,  5 Aug 2026 11:28:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 05 Aug 2026 11:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785943683;
	 x=1786030083; bh=C6XT21SzcmzKoqQfFczqkTLjYYhoo0k7LkH+5t7WEQ0=; b=
	VRxF2Jbtvl3VyyBlhZ0Jx5m7HB585o3hy800LJPDwI2684BWlWP4YOp+pkUTt5cP
	QBjZzZtEKA+BYuItOzU2yiNoTBY/io/JDp7LByhjgRnodd9zqP7W6qIcCusYWrBf
	i2+CzY2KaqRnNIqObMTcaPYcAMQDQA6jffjBQCGxnAg+Vq/dFqHdIqHCL8dmki3u
	Q9e3O1s/0pS0njL30JIxL0JUaYTMtgb4NIMXrRgpyAh9nAqnUVQGAiEiQeu+MtpD
	zCHnR4LbIY3iwA6pj9TLyZ4NC6nwfXSBBYeAY71FZ5Tm1tQOadBO6DZlLuncY85L
	DxMN6AAtolNBP5hE/bsK3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785943683; x=
	1786030083; bh=C6XT21SzcmzKoqQfFczqkTLjYYhoo0k7LkH+5t7WEQ0=; b=R
	d72da6EHOXBx7Qw2/YHiJqzWw8L3+OzrE51pPrnQ7N13Lw9aZEOkFQlrg3q5CBq1
	fSPBFlwM3VmsRgfUAyUo6/VHv3HG5XSRwX/nExJghuK0HoE2vXuay6NN3jCYPyRt
	N5jIhE1sqxZLucRYX+UHe8185TP0duXr2fBRPTAXywLQo9nLlHtRpEUT9ul/HG5o
	LtMwd2hyvudLJor69da3EVqBBCT+wK4/NFlf+V1MWFqoTZ9MU2w3mtpuQ7SSEAm+
	82++hh9qL7aSMd4eKw7XA9D0qVpcavl8NGkE71TRoiraKeaELLm5S+IlAuMRJQj/
	jDeP+1oMjfIPc987rZYnw==
X-ME-Sender: <xms:glZzantAKIMp3SePX-xCfV344227Jfv_3BXmvBcUaRfFefVHy1wCCw>
    <xme:glZzapJkJaxkOQn8BNKcS5hMrTJf4ytSf1J-9_g24ZOSJek4kSpVor-MXhh165AVI
    -cpR9WWXCt9TdcSBUeyrhCOwVXvfSsqdOYYEXViObsQyn4TA14rQw>
X-ME-Received: <xmr:glZzao_Sk35_Ww2bMkTI-YwfTQg8rgbrHXinLzg7huOnwKt4j7ObbCIuqdsI3paqmqibNgr4tcpSl4uHtLHkMacE7yYG_9T4C5rRE4a0MT-vWSpiJQ>
X-ME-Proxy-Cause: dmFkZTEj2wNWnhtKHkHMUp1Z6LqfA/Kd2cZ8/88TNyHDXD4WUW472vCSYYq4oNGa0Zv517
    MAiC0OZSi356FfDyGNN5Tsb/4x/3TgMmSxny9/HYamFmsz1dDZLKMlrOPG2xi5T1DkVoS9
    5xM/sgay4j6tuLuoczXwnnUjZAkESOJc8MegFe+7IjtY96N8okZ2aEQBDjWUn1h6DqPtjk
    iiKnyUndJJ3wxdH8bicbhL1ANE9ZiiWt81RVhI8Eby3wDjv89JEt4V/T325RZIREtG50e/
    3h+2QgaNnfdIRROv/BnQoPbzcFQcgdMYXJUT66YB4qLYQ0dqPhIy7K7E0CZby1e2raSlZM
    ncbJBiyotrIZwoSHten9IWH+TM65WhSq2W/wqCaGfiU5atcQnLENkqNHu+YN+YagwIcSJL
    1pnP5rzvW2dYi6IBZKknYmKTT3KQE/vUi/WR6CvwFUqmSHuoF2kmLppSGwaAapC9tOT6P7
    f+UO5R6/JKoRcWH4QTUk0Dp/tLnLU0ctoVmg7waF5o+JR/qos8Iwg0mdiXzs+5NSGq51ul
    1891Mxjd8lIb2aKHp3wOmkK14HeSae4srcCNsg3RDgeO8X/fMWAESw35yFCu2vfU2oEsUb
    dnw6vCvgPKi6rAtucKc4h9yhxKkwSk/kCo50fgA3esyvFPN7RUrKtENUwqpQ
X-ME-Proxy: <xmx:glZzaqyAPiTgKF8-sVIMSkPD0qGHqa64ZKyWdSErOKX2WwDxgKJBgA>
    <xmx:glZzat6sodBcVI62u1ItLbGP8tzUMkqrY2dhfmrJG4i4u_fB13jyHA>
    <xmx:glZzap8JN4VTo3Is1dxC86rDggxfPUGZu9dh-TwcyIbO0s6QBg65_w>
    <xmx:glZzaqqwNH-AmdipCwRkhiPEmTxzeyY4MSikTCNlQLbjFKvJGl_7Ug>
    <xmx:g1Zzavs-hQkD6DG-gr1fPd0nOr3_QNd2nZmxhh_WWSyF6GmDRGk2rJHL>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 11:28:01 -0400 (EDT)
Message-ID: <35c122f4-7d38-4493-8aba-83af1d776b87@bsbernd.com>
Date: Wed, 5 Aug 2026 17:27:59 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <CAJfpegv-Yiokb3YNkCNXf8f7YTSxsEVSD8YmrAt=y+1mg2oJ2Q@mail.gmail.com>
 <CAJnrk1Y1QaD2tc0LfPxS8yF4mv3K7x7q02pOqbWGBwYgztEkmQ@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1Y1QaD2tc0LfPxS8yF4mv3K7x7q02pOqbWGBwYgztEkmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/17/26 20:43, Joanne Koong wrote:
> On Fri, Jul 17, 2026 at 3:18 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>
>> I think if the synchronization between INIT is sorted out then this is
> 
> I'll submit a patch for the INIT synchronization separately to avoid
> respinning a v7, since it's a pre-existing issue not introduced by
> this series.
> 
>> good to go.  Sashiko can't apply the series, I guess because of the
>> non-standard base.   Not sure if we can help that.
>>
>> Also because Bernd and you are co-maintainers of fuse-uring, I'd hope
>> for an ack from Bernd (when he returns from vacation).
> 
> Bernd, this is targeting the 7.3 merge window, which opens August
> 16th. Because it involves cross-coordination with Jens's tree, I'd
> prefer to get this in at the start of the window. Can you please look
> at this series and make it a priority before then?

I will hopefully get it reviewed till next Sunday, didn't manage last
weekend (was kind of working all weekend on the new libfuse test suite,
because pytest does not hand out when something hangs). And from
tomorrow on traveling again. Exactly that hang and uncooperative pytest
caused extra work in the nights when I was on vacation and I then didn't
manage the review this series :(


Sorry about the delays,
Bernd

