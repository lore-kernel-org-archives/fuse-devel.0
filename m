Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CAE1E2834
	for <fuse-devel@lists.linux.dev>; Sun, 10 May 2026 16:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778432042; cv=none; b=linuckIvKbDVajAE7LdLAK93Iz8UHlwyGrdyTu/5bdqp67bJVtRSO0ymGTt5S9i1vfBTO94zacoCwnS2+fWQzE1FieybrGiJb3pOXk2X/5PHN9s1pd+/V5wBXnqdoWqe2M+5w6tjurp1KRHUdYHw0hOg8aq9XBVymyA2VnzNA34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778432042; c=relaxed/simple;
	bh=RDn6GcdbDOOtWBBfxXSGAnTSbA9JyX2UuQS7eVs9cCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pa0en3ls/DUbJyR7x1uw8F0g3JF3yWFmJF1U+3Wum5eI+6XkPDjPuC3CayWjufaId+2jweqVm0fbHnFl34sgmO0PcEZX9lOwiVMetCynDcCTStMmCE86hc6QvsOz9WLvvMw7JWjyGI/fuYK9BKB5ntzINhcXLQe9bbR4JMATFJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=B1YgqrQF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S7XW2JqH; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="B1YgqrQF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S7XW2JqH"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C7D541400144;
	Sun, 10 May 2026 12:53:59 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 10 May 2026 12:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778432039;
	 x=1778518439; bh=D1a+Hc1tBIHbu1ermN79IeVo+H2daxfa+ATCWsWEui0=; b=
	B1YgqrQFoAJwTVpc8O1Cl3kFPtvojn42MRdnmVRb0B6/+iSN3rAQdbP3b1t1l3YC
	6ZmJ9X2poLO8jLYxVoqufmqMsXpmn1wfn+P8oyfkffiQfeOrsf6+S3COUN9kkLy0
	ar2dbTDU549uaHaJWzo2b7ZS1/1XX0RkrGjS1/aMpr4J/4zNSjvBZ0Zieb34he+3
	PFM4LjBCjXh1HFw8rrc2PVK5nAcLrlwchZK6ipHHhCkF8y1GaVrZNABT29otxc6t
	6BSej98GWo4QBYPGDRMrI+VneHiU4fUKG9LhSVKLytiB4XDjxMmNe5K3L+ee8zo7
	O5fs3vZ67O5jtc9TYCyV2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778432039; x=
	1778518439; bh=D1a+Hc1tBIHbu1ermN79IeVo+H2daxfa+ATCWsWEui0=; b=S
	7XW2JqHXfZ+R8WqXI30hDGl6jmDCOturmYbiAlub23HH0yMfC3yajV24SCmDHria
	/bA2A1KTsj/Vc9AI0Yx28nq6jk1L7+bVRaf5YMOZS/RyyiVWY+QrQlENJaBQbFhg
	CNtLWXyGzd8AbQKwbYADLotU3DLasQI3XGYf7zbZopAfiOg3ty5NYDwFGHjJ1EnE
	ataqWNmHYPcy+LvFO5SQKleMfbmdLO30hkYLuaykZo8jZ4gjTgfCedFkC2kjgiLK
	lrih/e3j7F+LOGV/HhWX8hwXVJF7bi4wsw8mamHcFQNpby4fem95jz7TJb+RNkyG
	fGRAmSNxzUanFBQmkdMEw==
X-ME-Sender: <xms:J7gAavoXZR1JlnNL1NL02vKrmVMI5PxZIeuRkdnJYVh3TZeTEOtVpg>
    <xme:J7gAavpwoRYVaf--IkNe9Ka49FOrXonedsqWM6uRRfmV7KJveaVKW-eHH_DL_d5A3
    iBXiECHdjttedIntOJPNbJDuhcb5MFYOpUgZmF-chc53q15lcstiA>
X-ME-Received: <xmr:J7gAap2s_tTJdSUld8eHrTXqg1uCFgjt32rmKgFHD9TlMuSy0P5qVOM0_Hug1KKHD6HKZ_Skv-gw2NSrb-aUZOv3m9G3-CXR3sU0VbH9vNq4bjCRuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudeiieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeeuvghrnhgu
    ucfutghhuhgsvghrthcuoegsvghrnhgusegsshgsvghrnhgurdgtohhmqeenucggtffrrg
    htthgvrhhnpeehhfejueejleehtdehteefvdfgtdelffeuudejhfehgedufedvhfehueev
    udeugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsvghrnhgusegsshgsvghrnhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopegujhifohhngheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepfhhushgvqdguvghvvghlsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:J7gAauDVGu5TLfI-iZHiA9yY1hE6FZpX6PJWgz87WG3wCrh8ttpfVQ>
    <xmx:J7gAahfO2tELy0eO1R--UL6yNqaZDRO3DVyXHxrF2w6mm_q1pXfMdA>
    <xmx:J7gAajhVHnzIFV_lX1TFAPMbfoM28GRzLYr2l6AHJm2bcypNb_tmTg>
    <xmx:J7gAappLrxSE7RMeD9VEX8MrHh-ubyffPPetdDkFIREFWW7sqsH5cQ>
    <xmx:J7gAareNzMFBjFSlwi84crx8qOmSF0GGMdZgYFUjI6OiLr7B-El1hfax>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 May 2026 12:53:59 -0400 (EDT)
Message-ID: <72662f25-3691-4c9c-b817-0d4049202055@bsbernd.com>
Date: Sun, 10 May 2026 18:53:57 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] fuse_daemonize_early_start: Disallow daemonization
 when already active.
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fuse-devel@lists.linux.dev
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
 <20260508-new-mount-fixes-and-tests-v1-8-c67a0893ddbc@bsbernd.com>
 <20260509003008.GM2241589@frogsfrogsfrogs>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260509003008.GM2241589@frogsfrogsfrogs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/9/26 02:30, Darrick J. Wong wrote:
> On Fri, May 08, 2026 at 06:39:11PM +0200, Bernd Schubert via B4 Relay wrote:
>> From: Bernd Schubert <bernd@bsbernd.com>
>>
>> A coding error could run fuse_daemonize_early_start() two times
>> and so far the code was not handling/failing that.
>>
>> Also do not set "active" when it actually does not do daemonization.
>>
>> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
>> ---
>>  lib/fuse_daemonize.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/fuse_daemonize.c b/lib/fuse_daemonize.c
>> index c9a91748..8afe4b0d 100644
>> --- a/lib/fuse_daemonize.c
>> +++ b/lib/fuse_daemonize.c
>> @@ -211,18 +211,22 @@ int fuse_daemonize_early_start(unsigned int flags)
>>  	struct fuse_daemonize *dm = &daemonize;
>>  	int err = 0;
>>  
>> +	if (dm->active)
>> +		return -EALREADY;
>> +
>>  	dm->flags = flags;
>>  	dm->signal_pipe_wr = -1;
>>  	dm->death_pipe_rd = -1;
>>  	dm->stop_pipe_rd = -1;
>>  	dm->stop_pipe_wr = -1;
>> -	dm->active = true;
>>  
>>  	if (!(flags & FUSE_DAEMONIZE_NO_CHDIR))
>>  		(void)chdir("/");
>>  
>> -	if (!(flags & FUSE_DAEMONIZE_NO_BACKGROUND))
>> +	if (!(flags & FUSE_DAEMONIZE_NO_BACKGROUND)) {
>> +		dm->active = true;
> 
> I suppose there's no harm in letting multiple
> fuse_daemonize_early_start(FUSE_DAEMONIZE_NO_BACKGROUND) calls occur,
> but wouldn't it be simpler to say that fuse_daemonize_early_start should
> only be called once by fuse servers that want sync_init and don't use
> fuse_main(); or at most once by fuse servers that want sync_init and do
> use fuse_main()?

fuse_daemonize_early_ is needed for sync_init, right, but for sure not
exclusively. It is equally needed for daemons that want to start threads
before doing anything related to fuse. These daemons probably already
have their own daemonization code, but any new daemon can re-use the new
fuse_daemonize_early_ code, instead of creating yet another instance of
the same work.

> 
> vs. having a weird library call where with *some* parameters you can
> call it more than once.

"dm->active = true" means "deamonization is currently in progress - it
is cleared by fuse_daemonize_early_signal() (_early_fail() /
_early_success). I.e. it shall not be set when there is no ongoing
daemonization. I updated the comments in struct fuse_daemonize.


Thanks,
Bernd
