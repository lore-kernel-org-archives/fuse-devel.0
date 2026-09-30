Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B3C4E5348
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773777; cv=none; b=Z+wHSACghJYKJnv97wdbw7wYIv82fXFTUQx0WMxEMOaPbMOv3/3Oz1RyOaQe3Yd8oAi+eLRGP5l4j9bnSTqcLRUUL/fIkUDiH0NnIcNory044fC2qvwEuBjIA2aVjyk7rhm+5aS8fe5Z8MFHe9l35jxjGj4wlnn2nUI2tpliTgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773777; c=relaxed/simple;
	bh=JrIZ+TgStjFlSu4lCM2Ckt6wHFXaNecf4xaX7JdNQIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7924o81lPw9jzxtejAT2HE4+6A4GuqP8JrE3tVeiEomAJcNvBDV+XPQq/4jzovPktVxCaKw4W1wszDWzALdN1Sh8hbfoIF7Uev58i+RsQ62MPerj2k2fpbRBdclrX0ZoT2ScpGPkSmrgfZVFzmFWJpvdutvfhtKd7vvl+Y1HkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=SoPm1rJQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jVP1Xall; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="SoPm1rJQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jVP1Xall"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 2D003EC0313;
	Wed, 30 Sep 2026 09:09:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 30 Sep 2026 09:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790773764;
	 x=1790860164; bh=m75JHLH2GYdRlat5FNcwA1/voEefSae/nYmXvkii2Yc=; b=
	SoPm1rJQ1LsCqeAVoh2h8yZkpVjUch9B5I5ZMIHNfgo2DYJFyVdeegMPiU1u4cbC
	mv9yFkmW5Izc3iym3x0hl1S/W7sC7LnkFQ722QxOPF17/i+ek1Dvnxyr4kQg41lU
	X7KWkP1WTXV3UV8Xq2O4sBITSmufDR4Cz0M+v6HB2SsufslKFS1aLR/APRHFEvla
	mDc1M94KvDf9zrXWN3vzv2rwoPw9jLpCDtW/rb+b5+PhhG/x1zZHpr3bdj2yCAG2
	S2gybZMEWKvConQ03scI5bG7aa1GuyOx2bNbN71YWTkGlYm8Fo+d4NgeBZaL6etq
	/iUEkWZwIPHABTIyrdK+EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790773764; x=
	1790860164; bh=m75JHLH2GYdRlat5FNcwA1/voEefSae/nYmXvkii2Yc=; b=j
	VP1XallvjJZa1sDVzfrrcu+0B4Gzky3SgY5AtIHsVtnOck2StOFgSyGXHikgz3Ga
	2STL/IARpWHQbJPElQNWa5qhC4YNiTO6whQbJC1FY50YbhQMK38zvVTGz7HyBnvU
	pvQ0QNDJp3GEj4WMUzJ5blngw/5+PmB45zFK8oDOLWfdT2OsoWYbVPn0hL2vykfn
	Z5i+2z7CRb04fDDR2PIHc0hJ/dt4oFI1Tkscs7DYfvc6ZId7DOyECz711e9HP4CQ
	CKTl+DRD5LEBJFXvOvJP4ONPw8b1UT+q6Hgrk2YjJaADp+6Jj7aJDgyaaZhidX9G
	oZmuwb3JHcnGpwoFbAalg==
X-ME-Sender: <xms:Awq9avNeglneUi9keK86f2O-mr7qU_DrCM5b_a7RiswF0fyDxQ-0Mg>
    <xme:Awq9aha3pjEPQaUiE6xG4zQsF1wMVLjks7VQoF_UO9lNMR9UoTMO7MgBYPdqVUQy8
    N1A2MJn07pzUbb_-5dRKwn4aL7vcgr3BOClnhn1pgRWF6L00hc0>
X-ME-Received: <xmr:Awq9arrAP_3FpY7uwW1wDvAuWGqA3sVmS2dTsfJed8bVdvmr31mdl8cNneEGAuVS>
X-ME-Proxy-Cause: dmFkZTEQ9CuNyS/GSgvSPtrzVG4mYniy9tFqEBZKixu7Qw3z7fxEqubswKmFocOf75P/RY
    6w4qkcEXNCAIHoJBmuGn4uSYcdPhS4NCoUmRiLo2i7OTb6X5k4w4C83dADQGiPDi+WKTvl
    OFxdFAxyoMBuG463oiIk5PgD+nYQ6mlpMHQy1xAFPkU02Okf02KjWwunA7NMDRpqbP+gEQ
    gOBqHUXwevm5Q4ufpWN+lKvXVFPyvRatcNhQQxegJezkg35CHxidC6oOwdv/UVOCPaeS6C
    ZfZypwuDP7W2dXtb65l5sdizAknqUc3sNYLDWwxhXqRwlvvWlE2mZG9k9rv73u+XsnECnX
    gjC1xtVOKRWkceSEiuGk2P3W/A8M6FfEzRlb6eFuSaJqEo6hDFgmsNZsOOkrMXdx3lUHz3
    WqSvlCrrr5tSZCPUuoZemzdp0NoXx0lW2iT5xM0SL9I7HRwap7l7Gnm5lVVqGlrTlyQIjE
    HvrHfWIG9Mwy/99tihVPCyyvFAQ0jcOXNnmik1ySPoFrTece/VfbPpUwCE83I76psKMZrA
    OX5YfvkFL7AhromDSmHOttcU/ZTeRebfYNE7kXKLbUdVzQ4ug0pV9dCgP7InR10yOP4BbS
    1QlCq+OKkTbKqO0R47N0c0v3NddBQSulUWPEWMa2ZNeYGGfzLiBgnKyvAvPQ
X-ME-Proxy: <xmx:Awq9ataujvt8ppZy9ltrGeg30I9XQchHwn7etZCEf9yLUkimpts-2w>
    <xmx:Awq9arQwfnib-zOLi-CFvcvwPV7-IgXSTwJD5gU3XqpcuDJghU42Zw>
    <xmx:Awq9as71_bUrfg1Rp81ggdfp9pj9P3RTFhRpNQm5mb5HrcmgdSZ2Vg>
    <xmx:Awq9aozGs1NwrInacMAwQVUNS64ALP1mHw2FygYB_1g6WJtRVcb0aw>
    <xmx:BAq9ar2QwcUCVm2CX7UPOBPqx9P1TIzrD3lr1vW1sJhCwhWTbJPvxcEI>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Sep 2026 09:09:22 -0400 (EDT)
Message-ID: <723b3f96-58bd-4620-9dfa-5e7779cafa87@bsbernd.com>
Date: Wed, 30 Sep 2026 15:09:20 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] Improve documentation for fuse service mount
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fuse-devel@lists.linux.dev, neal@gompa.dev
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
 <20260928-mount-service-bound-open-v2-14-0f9f501d05ce@bsbernd.com>
 <20260929024303.GG6253@frogsfrogsfrogs>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260929024303.GG6253@frogsfrogsfrogs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/29/26 04:43, Darrick J. Wong wrote:
> On Mon, Sep 28, 2026 at 01:02:16PM +0200, Bernd Schubert via B4 Relay wrote:
>> From: Bernd Schubert <bernd@bsbernd.com>
>>
>> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
>> ---
>>  doc/README.service-mount      | 312 +++++++++++++++++++++++++++++
>>  doc/README.service-mount-dev  | 456 ++++++++++++++++++++++++++++++++++++++++++
>>  doc/README.service-mount-flow | 201 +++++++++++++++++++
>>  doc/fuservicemount3.8         | 150 +++++++++++++-
>>  doc/mainpage.dox              |  13 ++
>>  doc/mount.fuse3.8             |  18 ++
>>  6 files changed, 1144 insertions(+), 6 deletions(-)
>>
>> diff --git a/doc/README.service-mount b/doc/README.service-mount
>> new file mode 100644
>> index 000000000000..859db863f3da
>> --- /dev/null
>> +++ b/doc/README.service-mount
>> @@ -0,0 +1,312 @@
>> +Mounting FUSE filesystems that run as a socket service
>> +======================================================
>> +
>> +This document is for administrators and end users who want to mount a FUSE
>> +filesystem whose server runs as a sandboxed systemd socket service, rather
>> +than as a process in the mount caller's own context.
>> +
>> +Developers who want to make their FUSE server runnable this way should read
>> +README.service-mount-dev instead.
>> +
>> +
>> +What a service mount is
>> +-----------------------
>> +
>> +A traditional FUSE filesystem runs as a child of whoever mounts it: it
>> +inherits that environment, needs mount permission, and can see the caller's
>> +files. A *service mount* instead keeps the FUSE server running as an
>> +independent systemd service. When someone mounts the filesystem, a small
>> +privileged helper (fuservicemount3) connects to the service over a UNIX
>> +socket, hands it the /dev/fuse device and any backing files it needs, and
>> +performs the mount on its behalf.
>> +
>> +The benefit is isolation. The server can run:
>> +
>> +  - as a separate, unprivileged uid/gid (systemd DynamicUser),
>> +  - with no capabilities at all,
>> +  - in private mount, network, and pid namespaces,
>> +  - with a restricted system-call filter,
>> +
>> +while still being mountable by an ordinary user. The server never gains mount
>> +permission and never runs in the caller's environment; the privileged work is
>> +confined to the fuservicemount3 helper. See example/service_ll@.service for a
>> +fully locked-down unit.
>> +
>> +
>> +Do I need this?
>> +---------------
>> +
>> +This feature exists for one specific goal: running a FUSE server with strong
>> +privilege separation, where the server itself is fully unprivileged and
>> +sandboxed while a separate setuid helper performs the mount. Getting that
>> +requires the server to be written to the fuse_service_* API (see
>> +README.service-mount-dev). An existing FUSE program that simply calls
>> +fuse_main() cannot be mounted this way unmodified: it opens /dev/fuse and
>> +performs the mount itself, which the sandbox does not allow.
>> +
>> +If all you want is to manage an ordinary FUSE filesystem with systemd --
>> +start/stop, journald logging, cgroup resource limits --
>> +you do NOT need this feature. Run the filesystem under a plain systemd service
>> +unit instead, launching it in the foreground so systemd can track it:
>> +
>> +    # myfs.service
>> +    [Service]
>> +    ExecStart=/usr/bin/myfs ... -f <mountpoint>
>> +
>> +systemd-run(1) starts the same thing as a transient unit, without a unit
>> +file. It passes the command line on as typed, so the filesystem can get any
>> +number of arguments. A unit file fixes them in its ExecStart= line, and a
>> +template unit (myfs@.service) takes only one parameter, the instance name.
>> +Set unit directives with -p:
>> +
>> +    sudo systemd-run -p MemoryMax=1G myfs <args> -f <mountpoint>
>> +
>> +This also works in the user's own service manager, as long as fusermount3 is
>> +installed setuid root:
>> +
>> +    systemd-run --user -p MemoryMax=1G myfs <args> -f <mountpoint>
>> +
>> +That filesystem still mounts the traditional way (through fusermount3) and
>> +runs in the service's own context; it is not isolated from the mount the way a
>> +service mount is.
>> +
>> +Use a service mount when you specifically want:
>> +
>> +  - the filesystem server to run as a separate, unprivileged uid with no
>> +    mount permission of its own,
>> +  - it confined to private mount/network/pid namespaces with no capabilities,
>> +  - the privileged mount work isolated in the fuservicemount3 helper,
>> +  - on-demand, socket-activated startup.
>> +
>> +In short: a plain systemd unit gives you lifecycle management; a service mount
>> +gives you lifecycle management AND isolation, at the cost of the fuse server
>> +author adapting the server to the service API.
> 
> "...the fuse server author needing to adapt..."
> 
> Everything below here looked ok to me, though I admit that there's a lot
> of documentation so I may have missed some fine details.


Sorry about about the verbose documentation, just painful to remember
all the details a few years later without it. And I also wanted to
explain to users why it is helpful.
Thanks again for looking it!


Cheers,
Bernd
