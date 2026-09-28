Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEC748E0DC
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587275; cv=none; b=S0/1l8g64JU3dgTM3JWd5Lc3/MHhYjXV6VVwpZHNeF7j2an7ORiFPvhGj8Ng8dce+Jc2arvPrv4Hc7GcsocO94ueA9yqP8NcZjlUoy4Cae9W/5NRbMJGTz8xFuAFfPEF2QJhoBOfq8fAviWkyXkz8DhGckWG0PaB7ywEcb7LzwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587275; c=relaxed/simple;
	bh=lrpKJmyYO7FaGdkLOIK9mPLobSUY9kuJIOgEfc1iSPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VgoEOLoECarhCht3QmhqFCEYqrvHLCctzgbqJn4PLC8s/lGF3qMwTD1ytu5RUptjuigPB2PLizQZ+Adw5SrTLz8CmGppY2m5n9U7/tBGmLDi424VFn7OGtaoOeW3pVTw1yHG0Up+tpyqiBceBzde16NGT7WOGALD8s1KkKjW5qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=d1I5KkbY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ohTsY7Nw; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="d1I5KkbY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ohTsY7Nw"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DDCE3140008E;
	Mon, 28 Sep 2026 05:21:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 28 Sep 2026 05:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790587272;
	 x=1790673672; bh=hRNnTKcHGzYe4uOR2bjRls7+MPkO9HBfP28GZfIEfKg=; b=
	d1I5KkbYdIG1WoAWdff868ZdVcxbenGgo+7lOOYfNLMKXz36A+cW48Gzbyz6PwK8
	aNtDbvtYLx7U3nsNBLp2iV1BG4e9JEA1YhzOO17Ks3BrZCofGSIqkl3gO7tQpfZ7
	9Cm1Im30iik0JHdJjq6zsUqiYrfOj4f7ySBixPJkoxs5KL+1W6X7nFURdCR/xdLK
	DgUvwUV7pQNBUu3CXmCIoTNdmWKkOqU63qt5Lvq1NSk73NAl2cOzpbsjWDa/EowS
	OJ2S/HM+uD3IKxqB46ixqIiu4j8I78K+KhZYvqrp7Mfh/6i3nJb19kapOA19gKbD
	l0/WfAS1PcFHpB2H2sQjNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790587272; x=
	1790673672; bh=hRNnTKcHGzYe4uOR2bjRls7+MPkO9HBfP28GZfIEfKg=; b=o
	hTsY7NwrJxRF8QKhcbLxjAzWEEB05Uo0gqbSjVRVtXPQ6bZnomhj8sSW0Kpjr2ao
	hcaBL3XYzA2pJ+ugsy3lml2KB6/q/mcBuoA8wzQQASvpUQg/PhI4uAzzXqdiE6ud
	EGvLdfE9sCIe593+B3i6DZKEmTG18iZfND7ivF2XTq/iYTKf8cdhWb2u57jDYnv7
	kCeuJ3E5ZgbZFOe3ZNNfLtLcms+6+MXc9MBmp5AzvTFT/J/oNGZ4Xg1or3NRkUbA
	wwBcje6EtVMlvfhfAfeGb0CGbfbM0jbNADhHY/q9CndJIxGI0CHrUf0quqbVIZ/0
	vuFvONVRHmFgfYnZOjLgQ==
X-ME-Sender: <xms:iDG6aqAnrN7wDes2Sp0Gl5MjQI8weeL7LERjxzJspz3tOhD2r1Hdzg>
    <xme:iDG6aqg--pqDOaVmlflv07PXcAcbNx-6DE_ZUMkhOSK8T7_Jsm_10oTvLANNZ2J6k
    _44L7kx-xOAZBA6ngLpS7bss_XtwEQ_Xlt9WC7OwGS-cgeiwoHeDQ>
X-ME-Received: <xmr:iDG6arOTAHio_YkGux1olRgnkaj85lKI2uPtSSNLUx035ap9yXqAUkPsNBL66jkaCypQMZ-9saf-wEzDd7vWUvQDRNRrz_dyNEsj2qpCgviqTaQvFQ>
X-ME-Proxy-Cause: dmFkZTE9CYFLyHR6UCphSxQ+Rj/CC3u3hyvQWy7H8LYyAkjG+IUCZuRpI4B28H/qbBTWmy
    kmDuI8M/srD+l2ADEf3FVjNqAyYblHJVL4XNmv27wkHtny7jq2Uo/8NCFxIF9gtzFK+e7M
    KwbXlR/8U4gXCpPuZOneV1zVMhA/B0YfCzZpRH/+dqsjEHQzypG+5wzLQtEZCE5WSO0hkP
    SsFCsd3g9cWmr0VsELgu/smBcgd4HUNhNrzOdWAysbz/4sZ5N8+sxptd1RKDY+klYDt5lm
    UduC0W/6XT+ku6yuYBYf/FAh3ITVce5vb8QQh0JZf6EUqFc6OP5bM+UIcW0mppvl9d5uA4
    Jf9a1CEHrdAzXDvunPyGW62myE+64zpBVdaATmUE8iP3YpUOOucO5J66ccBVZ9W6NcJjQM
    m0h2X4U6+TRFAKXDJMioPDUp07AfKemHVUVMRzy8TdwCTlhYrV54nSFUSJMC05/1h379H0
    scub0sAIoRhTY14RuGQTMn5cj38nrkOzAQE1WR6Kc4zhwIbFU4r1bHy7x400oySp7GqI81
    VqmNxjOivdp5dhJTlmEnFs5XP6Fs2lNI54xsEvQhgglfCDg0yGP7HZBOBHlsYeCWNk50Rb
    p9I0H16a44RGPn7zIzY2Ntu3OO90YCoXPwbCvgYtUlSNF7yfrxxHFPaRajLA
X-ME-Proxy: <xmx:iDG6aj7-zyfhXEVpln2FvxpJ5myS3PDuc8ilSo8BedyONSBghTDNmQ>
    <xmx:iDG6ah1y6eD38tJh4cUerWD2-cTChNYBcbxuwLzZzlgl5o7BxQEvug>
    <xmx:iDG6asaPP3aF5fYd0JlMtojBeX3y0fk4Q0GF3nTNS_DBUP9-uIq6vA>
    <xmx:iDG6ahDOWI6Z0bwFDgliqhyyT5Sxfbgb0BEEi0GNs_B99HoSCidQ4g>
    <xmx:iDG6ai2DpjFcVrxf-76ZyFcZjc6sm3aUUc43K7tXe8d2XEr70_uXXz1d>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 05:21:12 -0400 (EDT)
Message-ID: <479220fa-ad50-4ab8-af10-fe3cb947a07e@bsbernd.com>
Date: Mon, 28 Sep 2026 11:21:11 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] mount_service: refuse OPEN after the MNTPT request
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fuse-devel@lists.linux.dev
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
 <20260925-mount-service-bound-open-v1-3-bbf1a84c7995@bsbernd.com>
 <20260925220714.GS6253@frogsfrogsfrogs>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260925220714.GS6253@frogsfrogsfrogs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/26/26 00:07, Darrick J. Wong wrote:
> On Fri, Sep 25, 2026 at 12:23:31AM +0200, Bernd Schubert via B4 Relay wrote:
>> From: Bernd Schubert <bernd@bsbernd.com>
>>
>> The fuse server sends fuservicemount3 a series of requests: OPEN for
>> its backing file, MNTPT to name the mount point, then MOUNT. The server
>> chooses the order. For a directory mount point, attach_to_mountpoint()
>> changes the working directory of the helper to the mount point. The
>> helper then mounts on ".", so a rename of the path cannot redirect the
>> mount.
>>
>> A relative path in an OPEN request after MNTPT resolved inside the
>> mount point. For "fuservicemount3 disk.img /mnt -t fuse.service_ll",
>> an OPEN of "disk.img" matched the command line argument, but the helper
>> opened /mnt/disk.img, not disk.img in the user's working directory. The
>> helper now refuses OPEN once the mount point is set. No in-tree server
>> sends OPEN after MNTPT.
> 
> How about absolute paths?  The resolution of those remain the same after
> the cwd changes.

Next version switches to openat and should handle all of that.


Thanks,
Bernd
