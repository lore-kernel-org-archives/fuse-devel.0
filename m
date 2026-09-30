Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF954F85DB
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780952; cv=none; b=Wm3pWWWbnn5URGgFOOBqqGZgf5pQNZvR+de7+8dOHiM27yz4mXHD6OMrkpf2T2x6a1N+q15b/fAuV7Gypx5kRrwUUb0D0FhpcFQji/KT0bM1vG1RWuDb2+HGCFyp/ABhqRkDpAiE4AYhSjCBkR0c3IynTHP2SMguP6Gdz7Kp6sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780952; c=relaxed/simple;
	bh=Sw+0ekvHmcOkoI4nVkSouMcxiImSkzzUsoDo5BwTfSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lk7SV04l11ipBvBI7INVM6Y/iy+y5tdMOMyy3EMEl803kkPGe/i48W21p0k2oFkMYbhdGmXYtzu48BuXSVcyMR8XL1p7fqgVBiAqZuYxxtwNhhqGvq/cz9TqRNb5Uq2vx1YVLYn3njnf3ke4Itj3OMIXzI5C5jCWZ2Wzbn4GI48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5zhdF6N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5zhdF6N"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 551731F000FF;
	Wed, 30 Sep 2026 15:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790780945;
	bh=vxsMrPX27zCrbrk/f35g/YI+cuDl6JD2qrgHjTBwnxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V5zhdF6NdNA+EhNrdZocJ10LPyehYJADGkRJuCFO5qRW8xFs1AInaPO/dMUsUdlAc
	 iZwEIw9UOOdcQ26w/l0PHm9ci1SkazHfRcq/RdmGDnQRRXAX119SaswKe3XhOW6F25
	 um/pSpMEhmDcJYwnG4dc+nORgD0AMi7BZUAzzHadTpguD8TGr47JpN1OpBE3nuEkpb
	 VcNbz8+p5mfvCkXTpVf6msS8edycNrCx+R8IAo6m3oX3jmfZ0vL5C+/e2h6pJuKoOs
	 MaWg90APNx7G/5MVkWKzqFw6zq4Fcz7L7sus8oJruijztJmFPe2KQzST63N2RLQRJV
	 HqX2oOJLkKxZQ==
Date: Wed, 30 Sep 2026 08:09:04 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev, neal@gompa.dev,
	Keerthana KT <keerthana@labs.digiscrypt.com>
Subject: Re: [PATCH v3 12/15] fuse_service: bound argc and arg len read from
 the args memfd
Message-ID: <20260930150904.GK6253@frogsfrogsfrogs>
References: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
 <20260930-mount-service-bound-open-v3-12-e26c5e4eca4c@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-mount-service-bound-open-v3-12-e26c5e4eca4c@bsbernd.com>

On Wed, Sep 30, 2026 at 03:11:06PM +0200, Bernd Schubert via B4 Relay wrote:
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

With >= changed to > this looks good to me, so
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> +			fuse_log(FUSE_LOG_ERR,
> +				 "fuse: service args file argv[%u] pos %u len %u out of range\n",
> +				 i, memfd_arg.pos, memfd_arg.len);
> +			ret = -EBADMSG;
> +			goto out_new_args;
> +		}
> +
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
> -- 
> 2.53.0
> 
> 
> 
