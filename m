Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF725145A1F
	for <fuse-devel@lists.linux.dev>; Tue, 29 Sep 2026 02:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790649213; cv=none; b=NgVqHpLni4FZJnxn2SKtd0frn4s/wyAPv5piu2J5ovbLM9umslp60Ntjx9L5oRajp+oPYJTWCNBnR6X+xHwqAkhqqdi7hgUVonEgP2xldu0rS1+3cnouUJxU1r2svXpWeyoKyH2RQPeCBuAlq5i94OlJEm6mLcfA6bE7tah+uiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790649213; c=relaxed/simple;
	bh=mjcuom79Y7f7xgbkQAyw6kaoxRBKtM4b0EHRkDacwvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cd1Fe8eEOdmRTc4OqJxq/yVz+gwMke2W67BFiKJIjoRPU5QyiYk931K3sVNgSN04NYGfugCjE7MfqwS2xzCfDaBrEqYSA8vlBnhnM2k0cqj8yysK9PjmXOFTuBgl0BJA9icRV8InuA+6dI4Gw3U8U2Dwmyc7/2yvWopAI7NxEsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCxMics0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCxMics0"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3D76E1F000FF;
	Tue, 29 Sep 2026 02:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790649212;
	bh=ucJlOxVt9eN3ZhCKJLAdY5FNEOqBIrR4MVn8nmXqa/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZCxMics0Z4ZQMWUlsiYd+t95F4lA1HsQ/lfibMowa0KQL3ae6Ijr5pz3SYde9aYHH
	 y57eZ4J3uCLw0yEZpWC7iGcXk5H6um1VaCEzUjmTYmPDVJER/ON+4nXjofSv56hxds
	 hL2fAeCmTTiYJVK1Ua8r/rIIyEv+uSx2orvoMXjf4CjF5NgS/xPoEaZWwpQJNrs2eF
	 VKp+cJ9M87hhY66ZpP/8XJ9Vju+TmFm4C0iu7BeNrmdCwaiW4JlfI7K1TQkBtJcsxK
	 llAPoj9QRd2BxjYG/wtkSB8ylzgfyx1hicn5UnEr+uIfIuE/UwEW4GEgw9HyGIrmu/
	 4AX42wu+3ls8A==
Date: Mon, 28 Sep 2026 19:33:31 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev, neal@gompa.dev,
	Keerthana KT <keerthana@labs.digiscrypt.com>
Subject: Re: [PATCH v2 12/14] fuse_service: bound argc and arg len read from
 the args memfd
Message-ID: <20260929023331.GE6253@frogsfrogsfrogs>
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
 <20260928-mount-service-bound-open-v2-12-0f9f501d05ce@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-mount-service-bound-open-v2-12-0f9f501d05ce@bsbernd.com>

On Mon, Sep 28, 2026 at 01:02:14PM +0200, Bernd Schubert via B4 Relay wrote:
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
>  lib/fuse_service.c          | 43 +++++++++++++++++++++++++++++++++++++++++++
>  util/mount_service.c        | 10 ++++++++++
>  3 files changed, 63 insertions(+)
> 
> diff --git a/include/fuse_service_priv.h b/include/fuse_service_priv.h
> index 988f7c9251c8..5b1edce4b7a8 100644
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
> +#define FUSE_SERVICE_MAX_ARGV_SIZE	(1048576)

sysconf(_SC_ARG_MAX) ?

> +
>  #define FUSE_SERVICE_ARGS_MAGIC		0x41524753	/* ARGS */
>  
>  /* mount.service sends a hello to the server and it replies */
> diff --git a/lib/fuse_service.c b/lib/fuse_service.c
> index 0a05b3fbc1f2..3991f92f09cb 100644
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
> @@ -722,6 +752,19 @@ int fuse_service_append_args(struct fuse_service *sf,
>  		memfd_arg.len = htonl(memfd_arg.len);
>  		memfd_pos += sizeof(memfd_arg);
>  
> +		/*
> +		 * A string cannot be longer than the file holding it.  len
> +		 * UINT32_MAX would make len + 1 wrap to zero below, handing
> +		 * calloc() a zero-size buffer for the pread() to overflow.
> +		 */
> +		if (memfd_arg.len >= statbuf.st_size) {

You ought to check that (memfd_arg.pos + memfd_arg.len) doesn't exceed
the file size, since this won't catch a correctly sized file with a
garbage memfd_arg array.

--D

> +			fuse_log(FUSE_LOG_ERR,
> +				 "fuse: service args file argv[%u] len %u too large\n",
> +				 i, memfd_arg.len);
> +			ret = -EBADMSG;
> +			goto out_new_args;
> +		}
> +
>  		/* read arg string from file */
>  		str = calloc(1, memfd_arg.len + 1);
>  		if (!str) {
> diff --git a/util/mount_service.c b/util/mount_service.c
> index 84e9d831ce03..c715729b2162 100644
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
> +		fprintf(stderr, "%s: memfd argv[%u] exceeds %d byte limit\n",
> +			mo->msgtag, args->argc, FUSE_SERVICE_MAX_ARGV_SIZE);
> +		return -1;
> +	}
> +
>  	written = pwrite(mo->argvfd, string, string_len, *string_pos);
>  	if (written < 0) {
>  		fprintf(stderr, "%s: memfd argv write: %s\n",
> 
> -- 
> 2.53.0
> 
> 
> 
