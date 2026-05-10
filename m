Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0C818859B
	for <fuse-devel@lists.linux.dev>; Sun, 10 May 2026 17:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778433556; cv=none; b=Vo7Xv0ZhruYyoluQfXl0nG5lO+E1sDCSdicv8vxOsPrENVAz0mSdRgo+MRQiplxEUCve60Stn902aenLQr4jR+zBP4eqJo8g0+faO9U9LSFON0FbAo44ZZB21GS3LPL5l+00pJCnuDQOV2vrQzIeywx7gr6jzNKbphn+OyBdWGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778433556; c=relaxed/simple;
	bh=3a7eJILA8qjfNJO8XR/slqdCyXls7jF2OH7HF7BEtxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kp92uRB0mc5Uz7nXpY9xRKYIXq3PanGJsEnPZ9/I/Sgr6rhSg1Cqae7bUAT3WfSmdP6Sq0rOpa7t94v3bSFZ5H0Y1UDouRL+q2V9+SvdReLA2Cb0OCjRCEKsk0pG0oyfUL+fZmPBzShPSRKzyBeicdxMq/sjLbbigjOkR646MjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=URt3QNLi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=B+RxRhpO; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="URt3QNLi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B+RxRhpO"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C320D14000F1;
	Sun, 10 May 2026 13:19:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 10 May 2026 13:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778433554;
	 x=1778519954; bh=k2bcTzPLkXOzn4Ws2zXx/KK9MbrMPsjstBYcAS2u0lA=; b=
	URt3QNLi3pbGOu+VGlhjcmSPNyFQcSk2NnpM8y73jKSBdB2tgWv5Tt6flZbRodtD
	kfzz3+RskGH5wJqyzdm0hu8YJ9Uha6jr7b4b7e7GtmDLkrfdM3jNRgvP8XXHCxqP
	a6hHYw9QrczLbJq2YeoEs7BdJvof47D3Ckjgt+bm8fF14A4KkaCMJNHz+Z6dAETT
	QnqhLT4ttQvzYcg2PU3KuC9xyRKuAIk83KAA99l5UlnYR5UnCKwk2uO0ieCCAqYa
	tVRRYELHaTeeP+DfioaXgIzBZNlN7bS3BX7sQ0kY1UHX9UFCCaXVHDqmbR2mGX7+
	Ms6SffSlF5EGcsH8YDL+Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778433554; x=
	1778519954; bh=k2bcTzPLkXOzn4Ws2zXx/KK9MbrMPsjstBYcAS2u0lA=; b=B
	+RxRhpOT40U3HTyMaNaJB1/qZci99Dp6pZLpoMyYkoxE6lxUoFeOpX5SnvyB/bFz
	l/I+ZGLLk043fkTO6BV5luNv3/j32X1mOWQF1Br8EDNOACw8e5HlbW22hdEUY2Qh
	w+xv0/s0wX2JwN3bB2+qDpzxxHieFcibKBkUgStd6MRFFAgxGCyqr1dqFTbG/tyo
	SFheNK8SFE386rF6XPwKZsyEvtkMXv2fuRGy5dVhJU6cPEzx/+FyZUc1DlRqld+l
	VtgDz1ptrNZhxlxW4QoEomobTyLS7OR9ir9+5wSbdqrbnBs3FU/Cv55BOH+MNGDl
	+TPWRMZiSlhZBFcQBSvDw==
X-ME-Sender: <xms:Er4AajdePYKPoZMYbcibs48c7DPVV7yH_GXh1OxzEYJzl-S3xk38Ng>
    <xme:Er4Aagp_TNVMCxX1bc6KtJ7bp9IcZcHM3GbQ46RtfFkEJMqjs4CdfWYbEZQOzhYuG
    7ej01HuPlV3RH4_60CznPMyq_7K_CaYkNnlQ4nDey8Op8G6oUdE>
X-ME-Received: <xmr:Er4Aap4ba4m2HoQlES_LLOg0BxopFjH4K6l3au_0VLzr2pIOt_PsOnB3BtvI14Sb-uVzhJuP7osvyZWC7vvjcl6Bj4JZWGMZrFRWlXNahpOU4i6u3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudeiieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeeuvghrnhgu
    ucfutghhuhgsvghrthcuoegsvghrnhgusegsshgsvghrnhgurdgtohhmqeenucggtffrrg
    htthgvrhhnpeehhfejueejleehtdehteefvdfgtdelffeuudejhfehgedufedvhfehueev
    udeugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsvghrnhgusegsshgsvghrnhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopegujhifohhngheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepfhhushgvqdguvghvvghlsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghp
    thhtohepmhhikhhlohhssehsiigvrhgvughirdhhuh
X-ME-Proxy: <xmx:Er4Aauo53R8iElA_-WbQzTjvCxrfOCtu8IzkDZVJXl7DjkCzCP8B_g>
    <xmx:Er4AajhgUw1ejAbggiiJdqjbMMcjVvB9kdW6XgZuyZoak_CzKhoPSg>
    <xmx:Er4AagLJI-Nw2vZA3gtW8lBRm2oM6CiWcbDSqKMrgCoukR3fm7pRYQ>
    <xmx:Er4AarBrf1TStsafoi2WdJqtXuRarVlS34g8pnUGqnkiP1Elbz_PNw>
    <xmx:Er4AavgsygNANbXAulICl5c1UFv4dGk5R5SVhnDa6p4Pu1cEgHzLnIg8>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 May 2026 13:19:13 -0400 (EDT)
Message-ID: <8c219849-1f76-404e-ad03-c2d43fe7d544@bsbernd.com>
Date: Sun, 10 May 2026 19:19:13 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] highlevel: Switch fuse_main_real_versioned() to
 fuse_daemonize_early()
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fuse-devel@lists.linux.dev, Miklos Szeredi <miklos@szeredi.hu>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
 <20260508-new-mount-fixes-and-tests-v1-10-c67a0893ddbc@bsbernd.com>
 <20260509003849.GO2241589@frogsfrogsfrogs>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260509003849.GO2241589@frogsfrogsfrogs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/9/26 02:38, Darrick J. Wong wrote:
> On Fri, May 08, 2026 at 06:39:13PM +0200, Bernd Schubert via B4 Relay wrote:
>> From: Bernd Schubert <bernd@bsbernd.com>
>>
>> For high level we can switch directly in that function to the new daemonize
>> API. Additionally we need to check if the daemon has already acticated
>> daemonization to avoid warning messages.
>>
>> Suggested-by: Miklos Szeredi <miklos@szeredi.hu>
>> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
>> ---
>>  lib/helper.c | 30 +++++++++++++++++++-----------
>>  1 file changed, 19 insertions(+), 11 deletions(-)
>>
>> diff --git a/lib/helper.c b/lib/helper.c
>> index 4d7c2b7f..15de3fbf 100644
>> --- a/lib/helper.c
>> +++ b/lib/helper.c
>> @@ -260,6 +260,7 @@ int fuse_main_real_versioned(int argc, char *argv[],
>>  	struct fuse_cmdline_opts opts;
>>  	int res;
>>  	struct fuse_loop_config *loop_config = NULL;
>> +	bool self_daemonize = false;
>>  
>>  	if (fuse_parse_cmdline(&args, &opts) != 0)
>>  		return 1;
>> @@ -289,6 +290,21 @@ int fuse_main_real_versioned(int argc, char *argv[],
>>  		goto out1;
>>  	}
>>  
>> +	/* The application might have already started daemonization itself */
>> +	if (!fuse_daemonize_early_is_active()) {
>> +		int daemonize_early_flags = 0;
>> +
>> +		if (opts.foreground)
>> +			daemonize_early_flags |= FUSE_DAEMONIZE_NO_BACKGROUND;
>> +
>> +		self_daemonize = true;
> 
> Technically speaking you don't have to set self_daemonize until after
> the _early_start succeeds, right?

Yeah, I moved it below the "if (res != 0) {" condition now, probably
cleaner.


Thanks,
Bernd
