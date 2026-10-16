Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32504BD37C
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156524; cv=none; b=syEf2cCZGFowhoGVQEkGs/D13ADI0s19wn0eyX7YJZW/ORhPJmQt4i9DeCP5NuWDvr8fl+i5l2WpYQxR81L0S37CPo+kF5H9/anp0MLKXmkgHcx8ApXs+0cOJTeEHNgATykjrY7Up0d8NVZwSVkexxPKYH33gtGKCUTxCo3Esh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156524; c=relaxed/simple;
	bh=Hw5nQV6Q4UYlAlqPfOnI97faI3jJpbsMYn14A7teF7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ibKCZf4hoFVkG+5Pu89NfSA8ZrHjSrH+BhhaRaHA6mH2zeKWhYsIErpjkm/Y2ZVpifHS95iG7fS6gES2Ad17C0MU5TZFMq512bwENyqDTUjVohQnE0VmYzjw2eIn0j6myp60z3SNS4HY/AW5QNhyGSWCz2VYwP4o0DF0zkU3U3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=Wiv15Vsz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hdjxrs/l; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="Wiv15Vsz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hdjxrs/l"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3980F7A012A
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 09:15:22 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 16 Oct 2026 09:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792156521;
	 x=1792242921; bh=MhTDU96b+YiEL9LjxtQD/BgMUBUrJjRuoQ5GQDKicbc=; b=
	Wiv15Vsz0ObShirb7HW0sOdD5yyYH58MW31Mpu5aq2iaIqbfqNAFggRgt87tD9eV
	GQZCqjwcQ7XIbv/5IQvemcxjwNRD7xXbRcJvd670Fe+BwBzL2enZkaK1mic4yCIm
	IWeQSj5e3YS6z9A4pd8+ZD9/9xG6x8d+YbXbOz925aaPJRCbYT4u73L1PtqiLkx0
	oF2bXx6UlWgaq3hlieyPYDOXgBPH16LtYqN2U2KuEBR7v+LG8mD1VtUqH16zmENX
	egcmbEsXG/s5EtHZhev//v7zU1UzoB2dnz3RYBzCT32tbq6P3yvzoTQrdMG16vjt
	a1dh+vZmEZbKTmXWaxqe2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792156521; x=1792242921; bh=M
	hTDU96b+YiEL9LjxtQD/BgMUBUrJjRuoQ5GQDKicbc=; b=hdjxrs/liMfoKUXQI
	w3zhlAA59ZJVmfodoF19teO1abO+uyATdtHq8qW8puuQdFYAtqIbSQeuW6HkrdiT
	CQha+lKcNd6uqeTH6Rqkd5/1vqYgCGs5hNz/DvaqnWBHJdHbqg58KgWbx1WHZFb7
	58QYItXsU5ETaJUX+o93ESjIc8s0BJqlMzewnXMDn1ok6EjCfCS6/9ERUX6QAOyg
	lrABqeCi7qyCp7ODXxwwtAXgXNONlaCKIrfrC0voLirr/uuiaM83U4bpRbvI2ubd
	NH0HODpGmxVexl+7I8UOZQkVeYguW1L4SmlxeYna/V0dWvgGy8rhqrZWiOmMKMEM
	I/baA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792156521; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm1:rsa-sha256:QQCyzV8/OziL2BYakicxR+F38e438D1M69a4irrV/4Bd2rj
	UCtWfBXB72qxLJn49+vwE8PgCvFEoQoQ1HRTbuprJZ2+gyZ/eVPsl/q1xNEHqXzH
	bNJxPK5a1+lPYyvinRaod1zcwiIojI6m+ax7Cir3yUTEistXpwlkkiIw0qFgmziY
	lpicaAyhFIqwKgy5brt7Aer6cOskE2pV0AgwPAy5zDwiQc1AJu2q6BUBy9v2qE5r
	1f9u9gNI06Rc58/+DFkqeKjIF3Fca9r3iwhSOItvA8LJ+jNEtHnKcePTVHAJZqY8
	Y5Ty1Q1x149ABxwBczCpTCnkITV0FQ1iECu5HPg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=content-language,content-transfer-encoding,content-type,date,
	feedback-id,from,in-reply-to,message-id,mime-version,references,
	subject,to,user-agent;
Message-Instance: m=1; h=sha256:GH27R14/7FlAZ3JEo81uCVxj5C3jT7v3efOdqs1x6d8=:Hw5nQV6Q4UYlAlqPfOnI97faI3jJpbsMYn14A7teF7Q=;
X-ME-Sender: <xms:aSPSaueCNTwH4oyxv6w62Z6sXJsa8bOQtAakQIwTkI9CA7YGFQ8vTw>
    <xme:aSPSav_JIp4tJu3qNEBdha0P-w8DJhWZfG9hjmVikZzTo3-Hz5Qag2bZlhfx_v3G9
    Ms5s4d2Xrhpe5AutDioHue2F5Xo5QVIXqmVfRFH8TXzI2ur1N3s>
X-ME-Received: <xmr:aSPSaimXwFlcX2sMmUeu9Fk_7B_YLm35kieQoMH33zq8MLOciqDC1l2O5ULQtRrXG-ktTmobrqIPWpJvNBQPxCnKm5LxLTPHAJNihliyAXa2e7RcHA>
X-ME-Proxy-Cause: dmFkZTFHwD02cN12GNR78nRR6AfalXm1GrrGO6kIDibUgVdxBFr917PbDjPr1p0sEbqt+D
    e7/2367Xeky910JV9dErQhlcPGw1LM+EkHDbl5kBR+FSZXWj1cO7uJWPb8L6ekV++sn7qk
    L71g2pmWVCsH41HyrG3xqHaw84yye4M8w2PIjw80lO7VHfagB8nrZA7gPcqgKMzaE8cDZj
    Ux6TtQ/vmi/FDToel+0Gycm6KMwl/gBI79sh7OEs8KG1d5pqfrLYftZHXNAJUsGpvUTxRz
    9tilgA1mLtqH1JGdCps5FQek3QBdtO2tIjyE/ojzAzs3Yq4m+bypcdfZdBUpXpAXZrhhU8
    6GMMnedCUQJu3Z8cVvsv9u1okHcCEhIZLGzsgONrKJroSVaY7ZpQaY/Z1Uw4gCq985lOP8
    rQmAzcMd/j66ih5ONOuLOe2bsUXmtD/S1anqMuksjCdgDy/8Q3HKnhcCuFxB9sxhaFqRLQ
    2FjCAxicN287tDEk+42LLiJnxoRALFKJIyEQ+TxCQSqf9mXIkQ3/YtcVSsp6y3sHOsOpbF
    lpE3ISkRBu82xDrFRVi9bFtkqKayH4LYdzFqT79hNKbGhtw2mR1bVHUKcvAjBy9b6Nl+X7
    XmZPpdZIewrZaD7G0wfoSngp8+bbIGpglj1TZM7TACyJGLMvzLYMioVAlUUQ
X-ME-Proxy: <xmx:aSPSap-zLDFdxLNGWVSpALFlKOECM8XhW-OqMCBvzcn1Re-2bM6LGQ>
    <xmx:aSPSaole0P8exGM718pEdvxTg-XZ0aCuvbnsZCGGJTv8UEdj0r8tug>
    <xmx:aSPSau0WInjxmdnzuSCFpN1rljk-gjLUaBLW7DD0klMf9HiJFhCqXA>
    <xmx:aSPSarq-gt2LL-ejZLZznoi1vKIfaJKmSlegiRwQ9XkUKD27pe19vA>
    <xmx:aSPSautYSWiuLZDdpIlSwluK10aaMgqraLUYGTu9JNqaQSgshFNS5zP->
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Oct 2026 09:15:20 -0400 (EDT)
Message-ID: <c9771db2-5619-4979-b734-bb204ff07b2c@bsbernd.com>
Date: Fri, 16 Oct 2026 15:15:19 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] fuse: per-queue background request accounting for
 io-uring
To: Aleksander Trofimowicz <trof@n90.eu>, fuse-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261016124820.316741-1-trof@n90.eu>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20261016124820.316741-1-trof@n90.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alexsander,

On 10/16/26 14:48, Aleksander Trofimowicz wrote:
> fuse: per-queue background request accounting for io-uring
> 
> This RFC proposes an opt-in path to replace the connection-wide
> background request accounting in fuse io-uring with per-queue
> budgeting.
> 
> AFAIR the concept has already floated on the list, but nothing has
> come to fruition. Nonetheless the problem is obvious: the existing
> implementation relies on a single connection-wide spinlock
> (fch->bg_lock) that is taken twice while servicing background
> requests. That severely hampers the scalability of fuse io-uring for
> certain types of workload (e.g. direct async I/O). Suffice it to say,
> with this patch applied I can easily cross the 1M 4k random read IOPS
> barrier, while the baseline gives a mere 600k IOPS (caeteris paribus).
> 
> I envision this enhancement being negotiated with a daemon, but for
> your convenience the feature can currently be activated
> unconditionally via the uring_max_bg_per_queue_force parameter. Mind
> that the value of uring_max_bg_per_queue must also be increased to
> obtain any meaningful results.
> 
> I am looking forward to your feedback. Thanks in advance.

I wasn't doing this yet, because I see it dependent on the reduced
queue feature, which also allows to distribute requests to another
queue, when a queue already got too many requests. I.e. if a queue
is over its own bg-limit, it should check if other queues are
available.

I plan to send out next version of reduced queues over the weekend.


Thanks,
Bernd




