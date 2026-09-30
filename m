Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C58F463B73
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766425; cv=none; b=Lrj2FxeyypyZS/Jhimatn2aShNzmLEy3aLh7jQyGfNdrX0W+S0cBVPHnWr90eU5lAwzLDxiOMEJd2UbY33zL2PaeVP6VMLZSrv8ddlhVKwSt5ytqpjy/4vg73oWd91Yz5UDN6KQYNdM4P8IAIaxMZMhxwF7oCZx0ARfx0nrprlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766425; c=relaxed/simple;
	bh=luN+P2BZ7K93xS5In+CEQjy3ole/FvL1iZ4ane8hJqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3pGuowJ6ktLHagvHvAsUvnI7WJpgk1KcNOSyOKWiSdTy7KqRObPg+BVXgnyYdn/mkY7mEEFz00pnu8xRFUFOq4bfrRPTkclaKzV9dJNVCGU5DD0iYCigTHZf1W/GB+FwMBXNXEDc4l9HH/wVWOyxDTYLBLUugzEefiOWq33bJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=mnstPiNq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kcPc4Xrj; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="mnstPiNq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kcPc4Xrj"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 642161D00697;
	Wed, 30 Sep 2026 07:06:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 30 Sep 2026 07:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790766419;
	 x=1790852819; bh=ktpIqoHH+++dSqgdzXknCcTCuL1r9edxE95TlR/aXo8=; b=
	mnstPiNqWjGDRc24IYRBS7mucKDE6CDCECXIeFTTeKS+DmIr17HO6w+SEUqvwe55
	0j76yQQ9v8hXBCOIfC/UHSPyPpf93cvNp8aiAy3sFHUAUyC5nNRVEE0XRjLOFT/e
	1VS17641wje7M0Fd7vic0RI/rFqf3llGzU7/pw/sZhGt3dyUACIFNepm0THBL7u6
	swnqNYEiJ1ilzhavgEdzvAA2jOkbzWNl003V+Zq8yMJxRzoAIrJ26TlqIhyvq/WY
	Nyx52DCMiSvptZQXLu5CWqO8yds2HC01uYrRwMo16O+R5ps/cltN4FPoxRjB9Sh7
	75d8f5372MXwafNNh4B5eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790766419; x=
	1790852819; bh=ktpIqoHH+++dSqgdzXknCcTCuL1r9edxE95TlR/aXo8=; b=k
	cPc4XrjY9Q0mKZx7rGiXSOLlP123QgB2JYog2F4ryV8BY4Xm2XVu0uA2yQweOAQV
	e9IUkectfm61OfL6cRBAO+8GhBqJlcB8I46OZ70WBJTjaWYj5c4nn5Hxa/2PQKBu
	mWi20u12MnQZKeoTcpK9fqSuV2Z3aj4t7f4/AFJbmdjsuMw81y6U3H50uM01caj1
	lnCWb7h7B2lIZLYIkTrdZKFVThMoPSNPqGJ/1xce8guenp5G5CXu5F7Kxf1lk9lA
	9uF8W6knh1yuwamctqBQgRMK06wPT/CzEjBRYYSK3yjBbs8Bo9pRUyUGpyUPlI5S
	+thdAOkVJAP7Z1higjoAA==
X-ME-Sender: <xms:Uu28ak7Jfy5EJwsT3pPR7wvJx1RkVHHu8519xAsHprUWVyomvvEA7w>
    <xme:Uu28atXB_oS2BScV-zhkfYwHnKo-ZoBeMKJqGIfEuDiL8ebZFXKfSzcPKGPpKZYJ0
    vDd30f7eRGg15VmKa-hdNFMwHlFXv5rJCbjq223LL8GpwnCoA8>
X-ME-Received: <xmr:Uu28ag3udx3RvuWp_xdSgbQN8lltG2KI_fUwfF0yOrmKB_svnjyJXc2SFO0L5k3x>
X-ME-Proxy-Cause: dmFkZTFAzArztNkmQKb4zzJa0x69VV4GpMxYR06dytMuBOYOHC8dr7oitGwolAEbqSzkCL
    QcbFOSZfGCZ4qjWOLHz6AcKFbtZgiBcuGNiaPOWxwq+zQLYRDg1oE3yCMTmW9JtaPK81bb
    CV/THgq88VyuuPaLsXqnhP9GhzARgQf+6ph/uXv7j7+FiG5mwqUvmDOMo6rdP0u+prN3W0
    fuWMvyF/tfGZvTOXG3FLxtHfhxanNfuaxqgCLW1/V6vNrA/3ydyLmpG0HueZeb460xKvVu
    rl4RQFg4nx6bUOgYwxu2oFCOmtscASk98MK2f6Ppa5omHU8pJCH6GszSQx2t/mjLS5MDkF
    AbUrmgknblvo8O8Vr+EuvPV7EaxMYKb+8/ce34o16W6KL7iTsWZsMTfH621TtgZoAWaJld
    w9CCKMfZWbXRQgOWXi/zVdnDLQwbkVNdQHuJe68t/buUGOM8jarMcF+ZY+tmp6P+tRDqm9
    wi9t2NS4zOaLzbkgXnE1geHUYNeubCvUpxnHsQUV1wFQ/92V+pmsuenmA+MD2uUB5Nq/ha
    SOW2PIPp0mtA75b/AN+vY1ChT/yZa7m5nuZHD9BqsHKkSfuJOtC9dpWXMj0nQUmxNqwu0u
    cnL+62SLdUqD5R8HAW9rEyXQEanGvfG2Srufyf6Mm44GewZ+KTJEFDptLTWg
X-ME-Proxy: <xmx:Uu28ai2Ntu5HMU_5I7KTS3iaQG_8r9_U1yZmKwHcHX41L0hvz-pZfg>
    <xmx:Uu28ar8FbjxnCBgS1lfxebesz73kdpAKSs0ckA3H33yyxz1n4imSGA>
    <xmx:Uu28an2Np4watgwrWHyCn0Uir0urX-143ifNawUDO4p-4hfU51sRKA>
    <xmx:Uu28ag-WhK_L9GtSRhQSazdzgwiqcXyR-S5anJvZ8T1Dt6Arv5jQXg>
    <xmx:U-28amzvw4eFT7S83zxiRxBvsvBQAuDqGLhiRrVoKYxa_pOtjBJH6ZZT>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Sep 2026 07:06:57 -0400 (EDT)
Message-ID: <d0538147-d06c-4a28-9805-06417d9e2451@bsbernd.com>
Date: Wed, 30 Sep 2026 13:06:55 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] mount_service: warn about paths not named on the
 command line
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fuse-devel@lists.linux.dev, neal@gompa.dev
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
 <20260928-mount-service-bound-open-v2-2-0f9f501d05ce@bsbernd.com>
 <20260929021027.GB6253@frogsfrogsfrogs>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260929021027.GB6253@frogsfrogsfrogs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/29/26 04:10, Darrick J. Wong wrote:
> On Mon, Sep 28, 2026 at 01:02:04PM +0200, Bernd Schubert via B4 Relay wrote:
>> From: Bernd Schubert <bernd@bsbernd.com>
>>
>> In a service mount, the fuse server runs as a systemd service in a
>> sandbox that has no access to the user's files. The user runs mount,
>> which starts fuservicemount3, a setuid-root helper. The fuse server
>> sends requests to the helper over a socket. With an OPEN request, the
>> server asks the helper to open its backing file, for example the disk
>> image named on the mount command line. The helper opens the file with
>> the user's credentials and passes the file descriptor to the server.
>> fusermount3 opens nothing for the fuse server except /dev/fuse; the
>> server runs as the user and opens its own files.
>>
>> The helper opens any path the server sends. An attacker who controlled
>> the server could use this to read every file the user can read, for
>> example ~/.ssh/id_ed25519, and the sandbox does not prevent it. The
>> helper now prints a warning if the user did not name the path when
>> mounting: as a whole argument, as the value of a name=value option, or
>> glued to a short option as in "-J/dev/sdb1". The helper splits the
>> options with fuse_opt_parse(), as the fuse server does, so both see the
>> same option values. The helper still opens the path, because a server
>> can take a path in a form that none of these checks recognizes.
>>
>> Enforced permissions follow up in the next commit.
>>
>> Assisted-by: LLM
>> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> 
> I wonder if there are any fuse servers out there that take parameters
> like:
> 
> -o bdevs=/dev/sda:/dev/sdb,otheroption=whatever
> 
> but ... let's let them come out of the woodwork?

Yeah, I think we can handle that later on based on needs.

> 
> I think this is a good addition :)
> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

Thanks a lot for your reviews!


Thanks,
Bernd

