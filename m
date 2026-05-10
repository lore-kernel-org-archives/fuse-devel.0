Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8039F3B27F6
	for <fuse-devel@lists.linux.dev>; Sun, 10 May 2026 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778433669; cv=none; b=QJAz4EwAZw788tQUtIVsMRH4N0lzZ5jzahY/tZbjahDbTTpDQaPGwJ68tKxx9fwGNRSaNAHMJ8l/t4ZaJ1yHbVqWILCo8rBCHpT+olM1UO9wHcc8vpwypBV4Cd56XggOyOvnpQLyBMs8ydRHrPFtvodTi7DT/Ioe2x1HOFPLYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778433669; c=relaxed/simple;
	bh=Nvw54o97RXT/+TuPHxGAb06+7p8eDtNVcWT6skHrbAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n6hpNCcG3ksndCMaPsPOOh+6N4h7/BA6m0P0AlWGTOX3lFl1BHqQcF9gzJ3PG2nNZyH836l6WVNotCBSRirowmNUnYB5fFcLwjTyY78X5bDOzk1hbJQG2Dk4hyW6go6cUvDUQZrB5mluN4P9pWFfPC1OjMf/jwqxL06qbTp8XU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=Hx+Hp2lG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NuTi7Yah; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="Hx+Hp2lG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NuTi7Yah"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id BC301EC0093;
	Sun, 10 May 2026 13:21:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 10 May 2026 13:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778433667;
	 x=1778520067; bh=vpn9G06xzLPcrv+cqaOsotnPvsrU7y101HSGP3v06R8=; b=
	Hx+Hp2lGsZ2zfoLkB/xU4mOmLpMaN9THvRLaV88AeIENzKol2ylIo9DhdSpx6DFp
	tBkJ7zmoT22hm08wqvtxudAJTr/QAo4odrJBNnAv1ToFTXRTBD566U6+uV8O4jap
	1MQaJ1Q6TspIRyczsPwyhCUNxKOlMrZIBOsQ+bsYy99ru8KMepEVDQuLf1I/cjqP
	V22w4hHsOE9JIFBKSsYU4WQTrK3VDsB08hMQox4HudLJr8nqAFOf5PzCMHpoyjXe
	4ZYL6GaLApFna6xHzFz4CvrhbHWxNpUW//5yhFmWOoteuld80qoaKiIUZRaSVobI
	xRMyamgKKYX1Kmhu/cee7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778433667; x=
	1778520067; bh=vpn9G06xzLPcrv+cqaOsotnPvsrU7y101HSGP3v06R8=; b=N
	uTi7YahGpAqSCtLW9+chx6UgFhg7H+v8jd6HRlokTp6naak1EpOwOg9epYjrX8ky
	kURxUc/Yx/mGTo9+lBEHghURTtjO4uZK2fpW0yIqiMDw2p2+wWQxfpdIqPQLdOV0
	VcEMy/QcqNOQfMMFPWUvGT5VAVy7jpHQtZIJRmj/FDBr+h2q3hXhVeCBSCwrHO/b
	Ibc8VnsMIxA9089hQRMZfdfaXkftFI6hEGXzl0Ork1TIW3a5HYxehs3NzjJfgsEp
	Jq8V8L79sRlLri00LSCPEi0N44HzXN0H2iz0PKhY5FMCs6lMpYbYVuD7fhqN19Bo
	VV0mvxRKnhXNbEfB6wGxg==
X-ME-Sender: <xms:g74AaoShGyeFao3DtPczzWIf7klp7YMYRa9z20RiTbJSJITZNgiEig>
    <xme:g74Aarz8I7B3e_eaPZ9aTaXhZbWlFiFr3CwHrJNKyFvab-noNLQpmCpNG__UelhKT
    OPja4GHU23pZEbAC1taI2onSvsI7-0jj1kqknFI9LwOoAbHxImY>
X-ME-Received: <xmr:g74Aajd6_I3JVDCTqDFHF3xOFHj-6VDgjG0SgZEWtEiyP0ZpfDnR05605NtyG7fgSm-lcRCl6adfJWvQL1hCtuhb6W3B2Ytkqe7HEs_QUCvws5D1iw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudeiieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeeuvghrnhgu
    ucfutghhuhgsvghrthcuoegsvghrnhgusegsshgsvghrnhgurdgtohhmqeenucggtffrrg
    htthgvrhhnpeehhfejueejleehtdehteefvdfgtdelffeuudejhfehgedufedvhfehueev
    udeugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsvghrnhgusegsshgsvghrnhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopegujhifohhngheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepfhhushgvqdguvghvvghlsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:g74AanK8287LjHLLAheecHuWrLcWE9AWnRO86EZz07zk1nGW3FyqEg>
    <xmx:g74AakEmvP1-9K_BdjR6vBumR71ereG6d2ANVY23x6lFL6hQ2LDqZQ>
    <xmx:g74Aahqb_lJDjzlN-HVrCBH_LS0zi0NMcUhjz9nxickk1TeElsrCwA>
    <xmx:g74AatQYTnmZirNOTVqE-yBpyAWObl425ptInVsbYEAQf5EmX1bV-g>
    <xmx:g74AavF_jKCQoqNt9fwCUDVRa9JdCFQqRVcF4mtb6-iXUA_SSRHrjvue>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 May 2026 13:21:07 -0400 (EDT)
Message-ID: <a8367cfa-9936-4db2-8126-7a4b0b0ef08e@bsbernd.com>
Date: Sun, 10 May 2026 19:21:06 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] mount: clarify kernel_opts vs mnt_opts vs flags in
 fuse_kern_fsmount
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fuse-devel@lists.linux.dev
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
 <20260508-new-mount-fixes-and-tests-v1-7-c67a0893ddbc@bsbernd.com>
 <20260509002742.GL2241589@frogsfrogsfrogs>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260509002742.GL2241589@frogsfrogsfrogs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/9/26 02:27, Darrick J. Wong wrote:
> On Fri, May 08, 2026 at 06:39:10PM +0200, Bernd Schubert via B4 Relay wrote:
>> From: Bernd Schubert <bernd@bsbernd.com>
>>
>> Just code/API updates, as these mount options can be rather confusing.
>>
>> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
>> ---
>>  lib/mount_i_linux.h | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/mount_i_linux.h b/lib/mount_i_linux.h
>> index ab83e30b..112c365e 100644
>> --- a/lib/mount_i_linux.h
>> +++ b/lib/mount_i_linux.h
>> @@ -36,13 +36,20 @@ int fuse_kern_mount_get_base_mnt_opts(const struct mount_opts *mo, char **mnt_op
>>  /**
>>   * Mount using the new Linux mount API (fsopen/fsconfig/fsmount/move_mount)
>>   * @mnt: mountpoint
>> - * @flags: mount flags (MS_NOSUID, MS_NODEV, etc.)
>> + * @flags: MS_* bits (ro/rw, nosuid, nodev, sync, dirsync, ...) -
>> + *         translated by set_ms_flags() into fsconfig(SET_FLAG) and/or
>> + *         fsmount(MOUNT_ATTR_*); never carried via the strings below.
> 
> I wonder if this parameter ought to be renamed ms_flags?
> 
>>   * @blkdev: 1 for fuseblk, 0 for fuse
>>   * @fsname: filesystem name (or NULL)
>>   * @subtype: filesystem subtype (or NULL)
>>   * @source_dev: device name for building source string
>> - * @kernel_opts: kernel mount options string
>> - * @mnt_opts: additional mount options to pass to the kernel
>> + * @kernel_opts: FUSE-kernel options parsed from -o args
>> + *               (e.g. "allow_other,max_read=65536,default_permissions")
>> + * @mnt_opts:    extras the caller layers on
>> + *               (e.g. "fd=7,rootmode=40000,user_id=1000,group_id=1000")
> 
> Oh, the "caller" here is libfuse.  Could that be clarified a bit?
> 
>       @mnt_opts:    internal mount options added by libfuse
>                     (e.g. "fd=7,rootmode=40000,user_id=1000,group_id=1000")
> 

I dropped this patch for now, the comment is actually not right. I'm
going to add some refactoring, maybe mnt_opts can be entirely dropped,
not sure yet.


Thanks,
Bernd
