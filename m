Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A262503BF6
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777006; cv=none; b=JStG+kdwAIon37JOBbWl23IhZ5/xvtWzPm193UbfZN6zRSgghOLq/qmmoJEwO73Tcx2/DUSQeGXKw8WUz3WREiZtH901ZqwQmFgMwvGLQKbWcsLLctwKb6aUwXSM5jQWXpEFUSyO+KZajEbYTINJ6zrYeFH89q7LqmXaeve538I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777006; c=relaxed/simple;
	bh=i6lAG3ta24i4rxFSGv1SwDkeRoRESWFJvFy0UELHBG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+J6yURpWJiWTJso9ooYBxc8UnvUYPCgZEividL1FxIjwCgs+uP6Ahdntf4w3PRg+pl3hqkG87ln/SceHeWRj8VvOZS9C0++X5LAaKnFdXOEE2ovW3k8k9smfVmasyp446ZPGCM27M/mF8V+MOgWfjY2YsjR2VKqR1zvlLZVJD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=XmdSz4J6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LzdDkGGG; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="XmdSz4J6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LzdDkGGG"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id C3C2CEC01C6;
	Wed, 30 Sep 2026 10:03:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 30 Sep 2026 10:03:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790776991;
	 x=1790863391; bh=fcM0+AvmpPXfdDIhSpedH7a3zqtz46RqiYs2gKCV53Q=; b=
	XmdSz4J6iZFwav9yeHtNh1GNfnobsSyU193w9A8eilkdZ07GXWzqX1TDv3b0vwvR
	D/eC5iBFrlxeYY74ZmgFukdPNS3SCfLkjBJMAqA4aUs62JtO/9XCPbgibBWezx0e
	R4ZCV4zyp5QU9mPOpMeCBQyJ7/51YEpIv7ID8zsmxrDeyRi/I7Fmlzvh70hRY6Vo
	vXq/EgbGHSh9XWAT8Pvty8nedL8tgD7O1VwzPMUMNiZozW9a+sWTsNbYNi4Z+FOy
	bQcno1m+DKgRX3jD/Lyy6YMIBOp7c08w74+/wJA591+i8S5FCSkZirct+6zYA8Fo
	IABFSTHO3dKx6gdGit6S3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790776991; x=
	1790863391; bh=fcM0+AvmpPXfdDIhSpedH7a3zqtz46RqiYs2gKCV53Q=; b=L
	zdDkGGGDdbbaJI2+rT0LsvQ/cExaKqcw7u0FhYSiDZEdsiSoVZFcB8AYr4gOIX3k
	KZ2m7OqNEV2LFRzooLV/d1/CeyvcuAFi1WurAnnDf8ad+/jGD5snAz/bMW01aqnc
	N9SGNwABE+RMc6968qcYvmxBJgX55ALt4eBWKm9aVmyxuinFBAMxILVnGHR2R+b9
	7Lm7M/x3Kf4n5PFJJx+VmXalBFxdGrm2ZZfwrwPmo7vW4QC9nVHwM0sKOV74jzvN
	k5F3d1BrQHp4yFL6Hqh4ewk2YUuHStehSaqUvuJAjhA+sv/DeMIgtWdjzqntAuLQ
	dA2I6nFjlXCy3LHZv19dA==
X-ME-Sender: <xms:nxa9aqnDfFwR8MeVxkaEPruau_xXXS6IFn0fUk_AiB6HvjXwbVLM0A>
    <xme:nxa9avoy1T_L0KleQGeGyojmX_beS6rFF66mLGwb0l5Wm1C1GAc0msMUDiDvxsJBU
    Bj_BCwin2TZuGNKPRBWn_9WsxmC0zthf6ISEQmttpUqUCiecpXj>
X-ME-Received: <xmr:nxa9ajGGTDE235QCZlY0VelKRCLUAD0w6-M6f6llFXfL0QOqOvgowp5mqpFVWSxY>
X-ME-Proxy-Cause: dmFkZTEwjm65bUu5IsmGm4HH78+xo7khodHJRt7SvcQnxGDMFTcLvlYXRnnPbcT9r3Fc3v
    bCaBg9i3HDqHBu3l/dYzG7oTUbYpUyUfORR1Aci4Nt/rjyph6xj9a+nKmKSXf8HNy89qzR
    +DWhAyiudWVuhtPgqgoJFntGgqPSba1b0dpB1bMm0lbLpx3VFjQ7ZPIHHenmf2IW1tmgkK
    +RutwhdglDFwR/VPZW9xzwDC32Bi/OUuXzl8UTfJYrZ+3risvIgH2USoWrDZMGVRQ0qInB
    gKuXFMITctKD3sXN7oDm8KBnXTq22oW/m7hxvdxiKK2JPRTjg9WYsIR+oj+sYlRB1ahtkj
    azMMPzTXDX55Pb9seSAR18YOmjuwMJoVwrIfVs1Y8IgB4HctQwJqJkQ4+jRVE1HGL5zt0l
    2PDRnRNmDv7V5+fcNakjY21DbhcR3z28MmaAVWGV36+0tpHxDIlarvk0m8BXJ2HieplGjC
    +StsGo/YM8ohbU9eCziaDyV6ymiT6dWIgjILk2qmTNXBHdqwVUKhn2pt9KFkAlgxP9LG6B
    MEPq07vRE8ULc4GZPuVumBKRhm7jWIf+uHdzXiY5kLohBPlvnfufDUmnhvz5ZPM3hA4AJ4
    deUic3MXvipW3tfRt9sTy61BQhVUtHTY1Tu7jy78qsoITASISXETZK5cIoQg
X-ME-Proxy: <xmx:nxa9arx25z9b4e9G7hhMyA8ixw3Xi5uCNIMsRVfuEJWzG2cGf7iRuw>
    <xmx:nxa9aoqJdS_ph0SL4cif8SHtfaIqsV3mGsgmLsmFmuoPdRcerWSX-w>
    <xmx:nxa9alhyAmE3w8joZaCSom58AGh7Ne_nNrMTLQp34D1Tm5Y3ajKvuQ>
    <xmx:nxa9alhS-NwfTmOM9L6-QgZ5y5mfo-YpocxxZMn0OVIqbpnQPaiFcA>
    <xmx:nxa9aqq8izdZSH9vGueFG9l8UwBhVUwucYdE4PU43DAMrCHlMIWQ77Cy>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Sep 2026 10:03:09 -0400 (EDT)
Message-ID: <85987fec-8bec-4d4d-8c24-e71a638d9b71@bsbernd.com>
Date: Wed, 30 Sep 2026 16:03:08 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/15] fuse_service: bound argc and arg len read from
 the args memfd
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev,
 Keerthana KT <keerthana@labs.digiscrypt.com>
References: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
 <20260930-mount-service-bound-open-v3-12-e26c5e4eca4c@bsbernd.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260930-mount-service-bound-open-v3-12-e26c5e4eca4c@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/30/26 15:11, Bernd Schubert via B4 Relay wrote:
> From: Keerthana KT <keerthana@labs.digiscrypt.com>
> 
> fuse_service_append_args() takes the argument count and each argument
> length straight from the args memfd, which this file already treats as
> untrusted (see the SO_PASSRIGHTS guard against a malicious mount
> helper). Both fields are uint32_t and feed allocation math with no
> bound: calloc(memfd_args.argc + existing_args->argc, ...) wraps in
> unsigned arithmetic and undersizes the argv array, while
> calloc(1, memfd_arg.len + 1) wraps to a zero-size buffer when len is
> UINT32_MAX, which the following pread() then overflows.
> 
> Nothing bounded the memfd itself, so cap it on both sides with a new
> FUSE_SERVICE_MAX_ARGV_SIZE. The mount helper refuses to write a string
> that would push the file past the cap, and the server fstat()s the file
> and refuses to parse one larger than it. The file size then bounds the
> rest: argc cannot exceed the number of iovecs that fit between the
> header and the strings, and no string can be longer than the file
> holding it. An argc of zero is rejected as well, because only the first
> loop iteration assigns argv[0].
> 
> Signed-off-by: Keerthana KT <keerthana@labs.digiscrypt.com>
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  include/fuse_service_priv.h | 10 ++++++++++
>  lib/fuse_service.c          | 40 ++++++++++++++++++++++++++++++++++++++++
>  util/mount_service.c        | 10 ++++++++++
>  3 files changed, 60 insertions(+)
> 
> diff --git a/include/fuse_service_priv.h b/include/fuse_service_priv.h
> index 988f7c9251c8..84e6948d771c 100644
> --- a/include/fuse_service_priv.h
> +++ b/include/fuse_service_priv.h
> @@ -23,6 +23,16 @@ struct fuse_service_memfd_argv {
>  
>  #define FUSE_SERVICE_MAX_CMD_SIZE	(65536)
>  
> +/*
> + * Upper bound on the whole argv memfd, as opposed to FUSE_SERVICE_MAX_CMD_SIZE
> + * which bounds one socket command.  Both sides check it: the mount helper
> + * refuses to write past it, and the fuse server refuses to parse a file larger
> + * than it.  Generous next to any real mount(8) invocation, but small enough
> + * that the counts and lengths the server reads out of the file cannot overflow
> + * the allocation math they feed.
> + */
> +#define FUSE_SERVICE_MAX_ARGV_SIZE	(sysconf(_SC_ARG_MAX))
> +
>  #define FUSE_SERVICE_ARGS_MAGIC		0x41524753	/* ARGS */
>  
>  /* mount.service sends a hello to the server and it replies */
> diff --git a/lib/fuse_service.c b/lib/fuse_service.c
> index 0a05b3fbc1f2..af08e919eebb 100644
> --- a/lib/fuse_service.c
> +++ b/lib/fuse_service.c
> @@ -629,8 +629,10 @@ int fuse_service_append_args(struct fuse_service *sf,
>  	struct fuse_args new_args = {
>  		.allocated = 1,
>  	};
> +	struct stat statbuf;
>  	char *str = NULL;
>  	off_t memfd_pos = 0;
> +	off_t max_argc;
>  	ssize_t received;
>  	unsigned int i;
>  	int ret;
> @@ -656,6 +658,34 @@ int fuse_service_append_args(struct fuse_service *sf,
>  	memfd_args.argc = htonl(memfd_args.argc);
>  	memfd_pos += sizeof(memfd_args);
>  
> +	ret = fstat(sf->argvfd, &statbuf);
> +	if (ret) {
> +		int error = errno;
> +
> +		fuse_log(FUSE_LOG_ERR, "fuse: service args file stat: %s\n",
> +			 strerror(error));
> +		return -error;
> +	}
> +	if (statbuf.st_size > FUSE_SERVICE_MAX_ARGV_SIZE) {
> +		fuse_log(FUSE_LOG_ERR, "fuse: service args file too large\n");
> +		return -EBADMSG;
> +	}
> +
> +	/*
> +	 * The array of argv iovecs sits between the header and the strings, so
> +	 * the file size bounds argc.  Reject a count the file cannot hold: the
> +	 * sum below is computed in unsigned arithmetic and would otherwise wrap
> +	 * and undersize the array.  argc 0 is rejected as well, because only
> +	 * the first loop iteration fills argv[0].
> +	 */
> +	max_argc = (statbuf.st_size - (off_t)sizeof(memfd_args)) /
> +		   (off_t)sizeof(struct fuse_service_memfd_arg);
> +	if (memfd_args.argc == 0 || memfd_args.argc > max_argc) {
> +		fuse_log(FUSE_LOG_ERR, "fuse: service args file argc %u invalid\n",
> +			 memfd_args.argc);
> +		return -EBADMSG;
> +	}
> +
>  	/* Allocate a new array of argv string pointers */
>  	new_args.argv = calloc(memfd_args.argc + existing_args->argc,
>  			       sizeof(char *));
> @@ -722,6 +752,16 @@ int fuse_service_append_args(struct fuse_service *sf,
>  		memfd_arg.len = htonl(memfd_arg.len);
>  		memfd_pos += sizeof(memfd_arg);
>  
> +		/* memfd_arg sanity check */
> +		if (memfd_arg.pos > (uint64_t)statbuf.st_size ||
> +		    memfd_arg.len >= (uint64_t)statbuf.st_size - memfd_arg.pos) {
> +			fuse_log(FUSE_LOG_ERR,
> +				 "fuse: service args file argv[%u] pos %u len %u out of range\n",
> +				 i, memfd_arg.pos, memfd_arg.len);
> +			ret = -EBADMSG;
> +			goto out_new_args;
> +		}
> +

I should first let tests complete and then post it, tests found an off-by-one issue, due to ">=" instead
of ">". Corrected in the libfuse PR with 

diff --git a/lib/fuse_service.c b/lib/fuse_service.c
index af08e919eebb..05aeb46d17fa 100644
--- a/lib/fuse_service.c
+++ b/lib/fuse_service.c
@@ -754,10 +754,10 @@ int fuse_service_append_args(struct fuse_service *sf,
 
                /* memfd_arg sanity check */
                if (memfd_arg.pos > (uint64_t)statbuf.st_size ||
-                   memfd_arg.len >= (uint64_t)statbuf.st_size - memfd_arg.pos) {
+                   memfd_arg.len > (uint64_t)statbuf.st_size - memfd_arg.pos) {
                        fuse_log(FUSE_LOG_ERR,
-                                "fuse: service args file argv[%u] pos %u len %u out of range\n",
-                                i, memfd_arg.pos, memfd_arg.len);
+                                "fuse: service args file argv[%u] pos %u len %u file size %jd out of range\n",
+                                i, memfd_arg.pos, memfd_arg.len, (intmax_t)statbuf.st_size);
                        ret = -EBADMSG;
                        goto out_new_args;




>  		/* read arg string from file */
>  		str = calloc(1, memfd_arg.len + 1);
>  		if (!str) {
> diff --git a/util/mount_service.c b/util/mount_service.c
> index 84e9d831ce03..18e0481a07d2 100644
> --- a/util/mount_service.c
> +++ b/util/mount_service.c
> @@ -442,6 +442,16 @@ static int mount_service_capture_arg(const struct mount_service *mo,
>  	};
>  	ssize_t written;
>  
> +	/*
> +	 * string_pos already covers the header and the whole array, so this
> +	 * bounds the entire memfd.  The server rejects anything larger.
> +	 */
> +	if (*string_pos + (off_t)string_len > FUSE_SERVICE_MAX_ARGV_SIZE) {
> +		fprintf(stderr, "%s: memfd argv[%u] exceeds %ld byte limit\n",
> +			mo->msgtag, args->argc, (long)FUSE_SERVICE_MAX_ARGV_SIZE);
> +		return -1;
> +	}
> +
>  	written = pwrite(mo->argvfd, string, string_len, *string_pos);
>  	if (written < 0) {
>  		fprintf(stderr, "%s: memfd argv write: %s\n",
> 

