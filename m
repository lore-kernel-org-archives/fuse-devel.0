Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB5837267A
	for <fuse-devel@lists.linux.dev>; Sun, 10 May 2026 17:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778432688; cv=none; b=XMOVvQspyu7hql5ueqVdSUdxXiPQetrZfZwKeBkEz00BkQy++JQHGih8Ep4BAUN4+BasE79OXAwNM6vGJnYJBztyKv1UgKSxT8g4AAtxIYfi2hopD6n3y854lUR6cUtkWBBiBUTLmYjr4P0SxHPc7gUb1+ZBKotOcrHwp7wp1OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778432688; c=relaxed/simple;
	bh=/aPJ5ynEf8+OqWZlHast71U343a21BTjs17dOROe98E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwchqZvrV+THlPMplFOX4brzmjfZKT6x4Tu47eY7YHd0VbKkY3DIeWx8Cig7BTzyt5bUW9Id+zb1MFhrWCJhXgYrKkIKNAiUVEW2HzkTQ582MAFE6LJ30TCxJnwtWRso2UyO18Z9L+BvYmW27JS71nfPE7Hg94mYm3AIAEF1hVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=EghZMgst; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UWJuExFS; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="EghZMgst";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UWJuExFS"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 74BEEEC0014;
	Sun, 10 May 2026 13:04:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 10 May 2026 13:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778432686;
	 x=1778519086; bh=D/+KFrQhvE0Ajx+wwYoKi7kaWIIj7dJODothitlLFL8=; b=
	EghZMgstGYrvXDZ2O0IRCqtP/c6Dz1K5yVEZreH1eH04vB36eR/wDDjwJudv2O7P
	xrJh8FJW/qtIMUhSeKni41LG7v3meIOO7zbK8WWsGoSv2XOb62kN8wKt9OvMOfuS
	Ap/y4TBfnizcDhO/Y2Tj9SsaghL+kbUkYNrIAjNWt9QThrPmOGExiQWDV6aBBJgn
	0E/baiz7q12zvGdrSRuqSSNQ0zHX0YkGuLq+6eIwqrwYn09i5RODNOC9RZdN3Y/K
	5xeBv83QDLTqG6yZ4RoVHdmumUpiqqceM6tLund1bJyrXzIeOgvqOBXHohAtoAny
	idemgLI5QafKv3+uJH/8iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778432686; x=
	1778519086; bh=D/+KFrQhvE0Ajx+wwYoKi7kaWIIj7dJODothitlLFL8=; b=U
	WJuExFSAqzMjIOv6omxhEw1PgsGEKJKDP2eMDCs0F9R3+k2bzke5vaB6yZ5WQx9a
	+kp7K+N/RVzNb1JpXJygTNZdpGFK/AmBvJbujX5NkjbVy8sQllxqCcpuuhe7ZP8b
	XDi17p0lYByOsx+3C7fEz0nx76ke0zr+Qp/6oEY235pS+4kHxitPDqA2mBybGXRK
	5MBjMxicHOH1Q05lHlrcUSKfQme4paatZUxw9ElqMpakzlp833Z5RpDhRUANiImJ
	yZxxb8LwWxFejWEEO/azXmACqy+Brnnb/Ojb1eL/i52uLaW2gET8YuFctyyuhX/G
	CpdnwVeiiPnvdm97iQCLg==
X-ME-Sender: <xms:rroAaqajKnJAF8_1xXRtaVg9BckvhnmM3iMu41qRpAQ7-d97kfphfA>
    <xme:rroAajZxypSkVZUnCungKWKQJXveRNdBoq1EqW3jFC6cfFwp56e1bY2N7T9pbNMlR
    6eMJncd9ButHo9rkKFONBrxSuOPEtT330LdE0NFOgRqdFXIutcl>
X-ME-Received: <xmr:rroAaimu-aFxIS9FPrGFLgArSYH1RTOpjvJTSYSBGvRq2scksqMTrwQXL4KGSaEPu-SeH7ze0BLHAMyIuiI3Ud4xhdEDaZQUssC79nPaDhy-v6iqAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudeiieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeeuvghrnhgu
    ucfutghhuhgsvghrthcuoegsvghrnhgusegsshgsvghrnhgurdgtohhmqeenucggtffrrg
    htthgvrhhnpeehhfejueejleehtdehteefvdfgtdelffeuudejhfehgedufedvhfehueev
    udeugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsvghrnhgusegsshgsvghrnhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopegujhifohhngheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepfhhushgvqdguvghvvghlsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:rroAanxGbo0BiKMLh02Kov1otDBA3x-2CY-HTY9cDGdeampuyJSkNQ>
    <xmx:rroAaoPoXbctS0STVzefGcMIXrEEGqIAOFpIRtDnH5Bq8YUh_qXBWA>
    <xmx:rroAajSdPQJmKqIvEePecBY5cV7m1dYXbRsGuvaKLTh6wV-eenUYCQ>
    <xmx:rroAauZZ_S533msQMCSvH-ukbN7KF_qyFp2a8UnAEmhBa9ca-FMB4Q>
    <xmx:rroAagOym1CzBci34Z9hfPhTDJMMQRAKJwUuD6OoI9CFwcEf1CcxquTv>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 May 2026 13:04:45 -0400 (EDT)
Message-ID: <e4bfd319-d12f-4581-b8fb-da47459bb529@bsbernd.com>
Date: Sun, 10 May 2026 19:04:45 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] fuse mount: Do not set sync_init when sync_init was
 not used
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fuse-devel@lists.linux.dev
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
 <20260508-new-mount-fixes-and-tests-v1-9-c67a0893ddbc@bsbernd.com>
 <20260509003534.GN2241589@frogsfrogsfrogs>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260509003534.GN2241589@frogsfrogsfrogs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/9/26 02:35, Darrick J. Wong wrote:
> On Fri, May 08, 2026 at 06:39:12PM +0200, Bernd Schubert via B4 Relay wrote:
>> From: Bernd Schubert <bernd@bsbernd.com>
>>
>> synchronous init is just a hint and we cannot fail on it, but for
>> daemonization we need to do know when it was actually used.
>> Bug was that se->sync_init() was set unconditionally on mount success.
>>
>> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
>> ---
>>  lib/fuse_lowlevel.c | 22 +++++++++++++++-------
>>  1 file changed, 15 insertions(+), 7 deletions(-)
>>
>> diff --git a/lib/fuse_lowlevel.c b/lib/fuse_lowlevel.c
>> index 6e078e82..60b936c3 100644
>> --- a/lib/fuse_lowlevel.c
>> +++ b/lib/fuse_lowlevel.c
>> @@ -4471,10 +4471,13 @@ static void *session_sync_init_worker(void *data)
>>  }
>>  
>>  /* Enable synchronous FUSE_INIT and start worker thread */
>> -static int session_start_sync_init(struct fuse_session *se, int fd)
>> +static int session_start_sync_init(struct fuse_session *se, int fd,
>> +				   bool *is_sync_init)
>>  {
>>  	int err, res;
>>  
>> +	*is_sync_init = false;
>> +
>>  	/*
>>  	 * Older fuse servers do not set want_sync_init or start the new
>>  	 * daemonize code, so they get async init.
>> @@ -4536,6 +4539,8 @@ static int session_start_sync_init(struct fuse_session *se, int fd)
>>  		return -EIO;
>>  	}
>>  
>> +	*is_sync_init = true;
> 
> Hrm.  So we only end up with return value == 0 and *is_sync_init==true
> if SYNC_INIT was enabled via ioctl and all the pthread stuff is ready to
> go.  The other two outcomes are:
> 
> 1. return == 0 && *is_sync_init==false if the kernel didn't let us use
>    synchronous init
> 
> 2. return != 0 if something broke and we just want to abort
> 
> If that's all correct then I've understood this patch well enough to say

Exactly! I'm going to amend the commit message.

> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
> 
> --D
> 


Thanks,
Bernd
