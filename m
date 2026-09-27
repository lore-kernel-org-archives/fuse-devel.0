Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A252472AE
	for <fuse-devel@lists.linux.dev>; Sun, 27 Sep 2026 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790543344; cv=none; b=MnrUDxu/rB1VlPVYYyxAV4P5fW7pI98I1y6fV2kk6nKKbbJACwdaJK7oXNBKmG/7dLjqUrx+TGXkxWEaRc1nim6tUzfisKWT92DwsD35xmEJBnsY8SbPCsc8wkqln3AgwSjdpkF/AqMoVHF4KIwfEOD/mAJUhHsOx+W7GIw/PeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790543344; c=relaxed/simple;
	bh=jtRzGTW9TAwoYGy1VZVECx1h+kkGxj3nmOcKO1JFd10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G9OtoZyrMpFoxUc1pGKoyuc4PbpP+XtB5EXO52R7UZLJ3g5smLaznft5AxVd1YA9t3lXrGfGLiCu+jR50mPH62i2Vm+P3/y10Y8SfGCirSg2+p8ASJ+TWw0JbouKTwjoJAxlOyCRxSQh+WwR7aAsPIxDW7ObFdQ3wsxSf0Vx4eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=XvzcLIIN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EBC/3tta; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="XvzcLIIN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EBC/3tta"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 2FDF1EC0031;
	Sun, 27 Sep 2026 17:09:01 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 27 Sep 2026 17:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790543341;
	 x=1790629741; bh=a5ozHe1TN5AeCQMs+T6dotldth9GCJaSoKBn+OmGqIY=; b=
	XvzcLIINSKWqh6fitfzS+3sQA0wsmxy7RWVwX+GEz3IGpfaJsnbnCuoOnNrZD5CG
	kyJSdDfSOcYCrV2kPPzIME51LScpGMJwhR+3hXnqhscnqbOU5OHkc9e09Ypax0bH
	Bud4HLK5HI7l0DfXcwZkwMqoDSJbpOZ7Cltu8cJhDkD39L1PWdtCcibwOQ4StKRi
	9dQj21V4xehC972hyZmBTDWSnXGcFaxHBqbEivuV/gJQbw8NmXFwUTc1oYkaRVzS
	7kX0krD2+Wgbqi9+3saUd+9hAm4aKG+5K91gs4PPL7hV3f8iMFH2v1MYiChwwdAj
	tg6WneS06ekPqHzZ+8NKhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790543341; x=
	1790629741; bh=a5ozHe1TN5AeCQMs+T6dotldth9GCJaSoKBn+OmGqIY=; b=E
	BC/3ttafrXMYrbklFJ07p56346oyi9m8TiXOBiLZv/jhikvrnl2fj2ZmEKMnJKR8
	ZPSgtwEbjvzEB35euMRRRHvuDy2QINqHHc0GjU9cD0ZcbsskfDXkdxUGYeyjoIw8
	UAZNeAN2kdTt3AcuUmpftmLCLYY8gFlJkyd1nrE+8lJ0RZhgb0UZY997W0wEHKKr
	SNJHbaVrUGmifbJFqEjTZ+Sdzsl4FBP5h93uVScWT99Fr/by/NiIEj7CcKs1t3rt
	PMQYUFnCr3X8m5xDwDG0MuPfSXw8xERC0pNKPCkeFMDjpxtWyrN8maD6VyfImjJs
	dJHZ75nbFb3kkDn8ym8JA==
X-ME-Sender: <xms:7IW5aqGjIzqN3uftJch3oRHhiZ8TnB07rVbKMv1o4SUzDj7BubPubw>
    <xme:7IW5aixJbe6ncOQ90_THisvac5IKSR0MUHjpaI6WJiL8Qb9mWuWk4qnki6Us-ZcjQ
    uC9vcUfdiEfeDxqfiNogrvzaC1Y-f1Ni7BWQ6BU2cZnHH_9jLQP>
X-ME-Received: <xmr:7IW5ahi4U4Vsi4AIjsGscZqnTRTiDldz6lElLzWMBGZrelAhNR68i0IDAW2LrYT1lThSYz4FUi5bxKIastZGqJdL_StVH0sv0uoHKxb3k6OgeFwjMw>
X-ME-Proxy-Cause: dmFkZTFzrWgjOJzhcoM18KXd0PRafCByII4HkGTlIHUV5T3VeJZm5WVxdzDKb1LWxE7gEy
    M/bZj3dCvwb3be0a6z3tnocBkAZ+hER04On6ctIlCq2ZwxFnZbkRFrhKV9dKJo9tULxki0
    gRduhp6eWjnPG9zDs+MLkHZWMG7d4lNSbg8e8SjO/kU20PgLTpGo0yTUQbNo2UfPMh2R0i
    ndHMMLSln7p3pjKAFa/fWmPKCUO9G3vPo0FVJYUP/B0HunYqavjxaA/7lSbXn1rnQ7rroo
    jdpp5SRCqmdmdo6XJpsUJqbAIk3Jg7A3bPM3F66PVB4+y9GDbldPjWAB9one5D9HGobLa6
    N56aneDMVUirf+CH8nRjOl0sTVXfhwXXQptIMim8hhq6IR5oRynmhaZeUApw5Fu3EwhqjW
    3U7W1qh0ls2sNDgtf5CFa5gjMmQdD2Th+JGd94umblCj9xduShICBJwm5FkLn/3ybUWVuL
    Jt5ZnGAcEzWz18q12yBk9GSXD8DIdRrVK/k7gDggX7GRgOg4cAhDzmILwfRNLJTf+y5K1f
    Hfjtt6sK01Yjb/tQd+ZBugMZLCZqplKgZED8dHUcQhg79vdt+3UNQRoQo7tzOZneCu0d+3
    Q2I2EH+nDgYP9Nw2m6vcS4PBtwcvkN5BK1hQbin6N9HjRh+DuOh1KR9SQ+AA
X-ME-Proxy: <xmx:7IW5atx19WpYVKzhirZSwuNa-VIJSB60SaESRG8m-XMH1lUE1GEGxA>
    <xmx:7IW5akJSmOsYEYKCBfOhgNz3QVWCF67cBdwGRfXHgwroVBWKfebbtQ>
    <xmx:7IW5akTTK0Xi0cykHZcvF0cQuGZ64w_PM_vMU3Pillj-JTaoQiqeug>
    <xmx:7IW5asoV-_t48njnTGcZVKEJP27yhThud_5UFsFgk57inHNBmj5SnA>
    <xmx:7YW5asezZl_7S7Thib01LfwkO1wUhnQMlsA3_HKcuCqKp_axlbZoXRqf>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Sep 2026 17:09:00 -0400 (EDT)
Message-ID: <049c8929-d861-4bdd-9c5b-07872814712f@bsbernd.com>
Date: Sun, 27 Sep 2026 23:08:58 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REVIEW] libfuse: Improve documentation for fuse service mount
To: "Darrick J. Wong" <djwong@kernel.org>, Neal Gompa <neal@gompa.dev>
Cc: fuse-devel@lists.linux.dev
References: <20260625221722.GV6070@frogsfrogsfrogs>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260625221722.GV6070@frogsfrogsfrogs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/26/26 00:17, Darrick J. Wong wrote:
> Hey everyone,
> 
> Bernd asked me to review a documentation pull request from:
> https://github.com/bsbernd/libfuse/tree/fuse-service-doc
> 
> So I'll go through it line by line. :)

Thanks a lot Darrick! And sorry for late reply, had bben busy all the
time with different things :/

I'm going to send the update as part of the v2 "libfuse: Add mount
service safety checks and tests" series.

Cheers,
Bernd
