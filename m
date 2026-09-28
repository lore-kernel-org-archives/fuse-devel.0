Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661D348B38F
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587811; cv=none; b=SOYltHbcNNMxbNUqSNeBiNapvT7tBc10OG7TgqOMWnTUaleJR9De59YXQyfPWDTgh07CbRoyZx7Db8JVkxd1ui/DopEv9tf7gX81ZjAoa+etDcMNQMbwEIBfv6ZJdEBOxMMiQ2HLZVBNc1wb5aVQ1Ft2STlQjyYGfDOMcopqdO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587811; c=relaxed/simple;
	bh=hnJDGXqAC/pBtSLldr7adbuKdg65taduXjP6jwn4lUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4FiCt72+2R1bBwwmCxo8Gme7KEPnw8yFr4dN+Riu/rhW6dawGlRS5K7qMdNo7q6pugu5J9EFATBsvglcE6AziPyJWSxM6ZlpsymDDjjrvO0bHRVCJYll6FRLXdE6nqpjvdwpquw1EffTKe8pfgljkzQVGnbeHarxEFqiszXeUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=PvL7dj5I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ky5/v5oj; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="PvL7dj5I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ky5/v5oj"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 58151EC017A;
	Mon, 28 Sep 2026 05:30:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 28 Sep 2026 05:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790587808;
	 x=1790674208; bh=QZ1863rlRTp8CofyapsYIgRRQTAFyj93r9rsSs3amcI=; b=
	PvL7dj5It7hDfhTVDoLk+PRdDR3A+gp8wJ+L2ViUgFFQFgZ1lwwOIWTIXVaXxUuO
	RpwM6w8nWsD0tguiSo9bjhJYrhFzQoReYxN8RsAupNzca2RY4gFRgm52Spu+mZS7
	oaPrdJ3/r0/rooTv8GM/X9h/xy8lBJg5Q70SJY7QTL7vPKPvcQ52Yj9QW3/JwEuo
	0EOn/hz3VniCW8rRQ279ZkZPO71YPj4Vv3hxAO1H5uzGFFM7zkin1mnu6HQsqwuv
	pAqzdy6IiphrlRWwvpzuVpcQrxc8gVAvcybSObg9wNFgeUNcy7R8Bu2j6LKKHJSw
	QqDAx/fy4i1vmsN6hpDd2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790587808; x=
	1790674208; bh=QZ1863rlRTp8CofyapsYIgRRQTAFyj93r9rsSs3amcI=; b=K
	y5/v5ojH9mEdY23YusgCxKFKqupvI0cyXphSV6TJFb4I7SPLogU/tUp0vZr4SEf4
	rfg7m1UhJQlqLjt9C/YrUjflxJDsxpRJP3/+YsvDN/6Q0jkC/cLP2mD/scuUt6Na
	INreTJ8RemQY3zBxOb3iYh0gmNW18/1N2xhrJjdsm8oIsxIdRE20Ui9NhSA0RI5q
	CijV6tySVarrCbatZpc2rgJXIRHTfqvBlWwYMucgnNTWsuz9S58prSyIKOp/11Rx
	5EMXeLw/ejfj/LefI6nTU42LJY7MN8l3E83M7VPV8l4gPOB19IRZwUDjV5PzwVCp
	Knvu3pxivOKyLv81HINUA==
X-ME-Sender: <xms:oDO6aiBKw5AAFHKC7Qb0pfqyk3WoVGD2dw5pWrccUKiNsrL_XR0Vfw>
    <xme:oDO6aijv0gUIgKYAIKZLUqA0wJzQ_LjPv4QOQU823yUxweMU5hdyl-JPmIlp6VJQw
    JZTywwlovVpCnyR213zPBWh4os34iRg9QV18u8UkhLXewJIDe4>
X-ME-Received: <xmr:oDO6ajO61loUyScbOV1Ia2uj6zbXhX3r_c-dlR58DBylja-w4ItBc47v4IGH-a2Tjsuc-MaePUh_fJOybeN9T7_9czW6AydK0zKECfzjHcg106Jtuw>
X-ME-Proxy-Cause: dmFkZTGJn1ewzSBScWPXa1Uh1zW7/iBvyiJ1SbKOwdXkyiA2TPTV7OEMBLUNHSHcMWkL2n
    wjCnY2e7xrGPb3rJ6pkvQodPDtTL+pMh2jHNn1iLsWKeTLZV+s4dh1wrSloXPXtRJqYgHp
    5ucCYzfYYjw3PoApmsFGHVFo1qlzig4npgwb20j0sUdD9BgME3X3YAep4kGqorp4SQs7Gh
    P/4Xzsa2L4Es+QYgTp8lrD5mVv6f6ER3flWDGZitI0eyobJ4q1Fl1s9xEANYFcGn9qzskU
    HCMFtGscTwnPdaFDj1sB+w/sItrSuffrGg1T5QkpbVYoHm5jUgh79jmc8/A69Vi45SpQeq
    pT8qqG/hFiBoYzG6j6NbKgXrLNP6+ffcSXfyHIDobr+HPAaUbyUmSx/EvmX+MDfbgmtkXf
    pbIObEfdemmTtHBsqR03f/BSgBuYJFlQWOBVFEU0RI1/HLE8t78ME05Bb6htWaBNU29yNo
    DpT4SpIuYm4qSMYGQgJqVoXJVXTzzntljGf5z7A44CduCI5MHJiJqRsGrfqHDwdDPGu1LE
    N374AwVeClixGhYrZ9CVxYHqj2bTx76Ub/LV94xQmhv+Bgl0oOsfvGb/TY70jm6QtCypGT
    gjajMUA4wCJ9nYkJAZs7PEF4nKzLLliNz0pKBj7aR5kDzd01ZbSyCcLNgj4A
X-ME-Proxy: <xmx:oDO6ar5ilaERuHCf02_ZAaQzoARXtd04nERKb2zsTKxx9OrQr681nA>
    <xmx:oDO6ap08QLjOV8T-8FVeCjxkt9yDVhug9xmCcTYkZDcWD3yMcEjyaw>
    <xmx:oDO6akbIIs6tFlNo9aSaU0uvPfYrpenaL-EstBWMAEXh4pZ0wQp9Hg>
    <xmx:oDO6apDc2jSYHp6itbxXNPzloQgoWgAwtv1RxdE22ADLwKJoPCjy5w>
    <xmx:oDO6aq3R0a6nEUfnJUr6srbG_qVZWIIlc9aU2dTmNun9wzhpUkGnqJTe>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 05:30:07 -0400 (EDT)
Message-ID: <5de684e3-c83d-4a36-aba4-2e69810e48fe@bsbernd.com>
Date: Mon, 28 Sep 2026 11:30:06 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] test: run mkfs.ext4 through the service examples
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fuse-devel@lists.linux.dev
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
 <20260925-mount-service-bound-open-v1-10-bbf1a84c7995@bsbernd.com>
 <20260925222750.GX6253@frogsfrogsfrogs>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260925222750.GX6253@frogsfrogsfrogs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/26/26 00:27, Darrick J. Wong wrote:
> On Fri, Sep 25, 2026 at 12:23:38AM +0200, Bernd Schubert via B4 Relay wrote:
>> From: Bernd Schubert <bernd@bsbernd.com>
>>
>> The byte comparison in the service example tests does not show that a
>> real filesystem tool works on the file service_ll and service_hl serve.
>> mkfs.ext4 writes a filesystem through the mount, and e2fsck checks the
>> image after umount.
> 
> Ooh, a file IO path test too!
> 
>> Assisted-by: LLM
>> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
>> ---
>>  example/service_ll.c                |  5 ++++
>>  test/cases/lib/service-example.sh   | 54 ++++++++++++++++++++++++++++++-------
>>  test/cases/mount/service-hl-mkfs.sh |  8 ++++++
>>  test/cases/mount/service-ll-mkfs.sh |  8 ++++++
>>  4 files changed, 66 insertions(+), 9 deletions(-)
>>
>> diff --git a/example/service_ll.c b/example/service_ll.c
>> index fd43c40fc15b..7baf47905a33 100644
>> --- a/example/service_ll.c
>> +++ b/example/service_ll.c
>> @@ -43,6 +43,11 @@
>>   *
>>   *     mount -t fuse.service_ll /dev/sda /mnt
>>   *
>> + * /mnt/single_file then holds the bytes of /dev/sda, so a filesystem can be
>> + * created on it:
>> + *
>> + *     mkfs.ext4 /mnt/single_file
>> + *
>>   * ## Source code ##
>>   * \include service_ll.c
>>   * \include service_ll.socket
>> diff --git a/test/cases/lib/service-example.sh b/test/cases/lib/service-example.sh
>> index 878b379b8b16..4d7e0b27f3b9 100644
>> --- a/test/cases/lib/service-example.sh
>> +++ b/test/cases/lib/service-example.sh
>> @@ -1,15 +1,19 @@
>>  # lib/service-example.sh - body for the service_ll / service_hl cases.
>>  #
>> -# Caller sets FS_NAME and LAUNCH before sourcing:
>> +# Caller sets FS_NAME and LAUNCH, and optionally CHECK, before sourcing:
>>  #   FS_NAME   service_ll | service_hl
>>  #   LAUNCH    fuservicemount3 | mount_fuse
>> +#   CHECK     bytes (default) | mkfs
>>  #
>> -# The file the example serves has to read back as the image, and what is
>> -# written through the mount has to reach the image.
>> +# bytes: the file the example serves has to read back as the image, and what
>> +# is written through the mount has to reach the image.
>> +# mkfs: mkfs.ext4 on that file has to leave an image e2fsck accepts.
>>  
>>  _fuse_no_mount_needed=1
>>  . "$TEST_LIB/common.sh"
>>  
>> +CHECK=${CHECK:-bytes}
>> +
>>  # Before the gates: a misspelled FS_NAME would otherwise skip as "not built"
>>  case ${FS_NAME:-} in
>>  service_ll | service_hl) ;;
>> @@ -19,6 +23,10 @@ case ${LAUNCH:-} in
>>  fuservicemount3 | mount_fuse) ;;
>>  *) _fail "unknown LAUNCH '${LAUNCH:-}'" ;;
>>  esac
>> +case $CHECK in
>> +bytes | mkfs) ;;
>> +*) _fail "unknown CHECK '$CHECK'" ;;
>> +esac
>>  
>>  _require_linux "fuservicemount3"
>>  _require_root
>> @@ -26,6 +34,10 @@ _require_fuse_device
>>  _require_binary util/fuservicemount3
>>  _require_binary "example/$FS_NAME"
>>  [ "$LAUNCH" != mount_fuse ] || _require_binary util/mount.fuse3
>> +if [ "$CHECK" = mkfs ]; then
>> +	_require_prog mkfs.ext4
>> +	_require_prog e2fsck
>> +fi
>>  
>>  . "$TEST_LIB/service.sh"
>>  
>> @@ -35,9 +47,16 @@ old=$TEST_TMP/old
>>  new=$TEST_TMP/new
>>  
>>  # The size has to be a multiple of the page size
>> -head -c 1048576 /dev/urandom >"$old"
>> -head -c 1048576 /dev/urandom >"$new"
>> -cp "$old" "$img"
>> +case $CHECK in
>> +bytes)
>> +	head -c 1048576 /dev/urandom >"$old"
>> +	head -c 1048576 /dev/urandom >"$new"
>> +	cp "$old" "$img"
>> +	;;
>> +mkfs)
>> +	truncate -s 64M "$img"
>> +	;;
>> +esac
>>  
>>  service_start "$TEST_LOGDIR/fs-$FS_NAME.out" "$FUSE_EXAMPLE_DIR/$FS_NAME"
>>  case $LAUNCH in
>> @@ -53,10 +72,27 @@ mount_fuse)
>>  esac
>>  
>>  _assert_fstype "$TEST_MNT" "fuse.$service_subtype" fuse
>> -_assert_file_eq "$TEST_MNT/single_file" "$old"
>> -dd if="$new" of="$TEST_MNT/single_file" bs=64k conv=notrunc,fsync status=none
>> +case $CHECK in
>> +bytes)
>> +	_assert_file_eq "$TEST_MNT/single_file" "$old"
>> +	dd if="$new" of="$TEST_MNT/single_file" bs=64k conv=notrunc,fsync \
>> +		status=none
>> +	;;
>> +mkfs)
>> +	# -F: single_file is a regular file, not a block device
>> +	mkfs.ext4 -F -q "$TEST_MNT/single_file" ||
>> +		_fail "mkfs.ext4 through $FS_NAME failed"
> 
> You might consider adding a -D <path> argument to mkfs.ext4 so that it
> will copy a directory tree into the filesystem image.  That way you're
> testing block overwrites.
> 
> That said, if you're satisified with writing just the superblock and
> log, that's fine with me too.

Nice suggestion, added in.

Thanks,
Bernd
