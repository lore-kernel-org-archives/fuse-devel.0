Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713961DED5C
	for <fuse-devel@lists.linux.dev>; Tue, 29 Sep 2026 02:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647829; cv=none; b=Nv1ByR0z4LzTMj/2Gdgu4GOlgX3kqP81ojP4qWnI/2uJAsFsH2NqcQZbyC/z/0/vGvHi34BQ1rJrBLOLSp7yIWz19jJ4M4Z5nP0LAYsl6v3aNtO+4wJFNNqe3ETwSWOEc44UxxETYWHO+d601JYGvuDKT/uY4/UkjCsjVzdFqlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647829; c=relaxed/simple;
	bh=h7Ih35Ph/4/XP76T76jze2YIgofmjZvmqTtgzBmQXF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjR25Vp8mR/OoeJp7fNM661V/TB8YbJP/R2XvOUm0uVNrqLikXR6T/os2RtNp3Qf6Isf5L03o44XN/VTlhx/2zWp8auw1QFeiKD3Fh0ntKgfLPhbktXOp9+ow8qHFCTi+KuVruy2YTMKMsvhPZOh48q8o3OtZucePQ2jluvvm94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbaNF1Uq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbaNF1Uq"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id F320E1F000FF;
	Tue, 29 Sep 2026 02:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790647828;
	bh=k78nVqsQUlU2dNY/Qh/cFFvjkcqyJbeQcsLyxNGCatY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nbaNF1UqJwAyy/ITk2Nx2BRLIeOeP+5mK7alMYeT6oNH4TL0e2CMCgzxyn/YfMvdt
	 VaV+kSKsl+5KWCtKSMyq26NIrxJ6pNjq3WIuvQkraEbQhuLOAwOm/3vQ0Q3oO6l/oN
	 pYnmV1VHXW6Ymm282JVue3Mw1AwAigtYWqdmGsy5MD6dzsq2PqwWZx35elJVyStaH3
	 hj9E3J7nZgdnbgajA1Nr9VHQkZi2NHu1We+OFsq/jkCUyOQEogJO7KhP0J2HpaW2Hr
	 J8sc/p/8oUEWKvvGoFOuZrchzYSt9SGjnIB+YW2Kt8FNPnm5l84WPgssUTIafFBYDC
	 o2IWwxNWKaJVA==
Date: Mon, 28 Sep 2026 19:10:27 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev, neal@gompa.dev
Subject: Re: [PATCH v2 02/14] mount_service: warn about paths not named on
 the command line
Message-ID: <20260929021027.GB6253@frogsfrogsfrogs>
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
 <20260928-mount-service-bound-open-v2-2-0f9f501d05ce@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-mount-service-bound-open-v2-2-0f9f501d05ce@bsbernd.com>

On Mon, Sep 28, 2026 at 01:02:04PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> In a service mount, the fuse server runs as a systemd service in a
> sandbox that has no access to the user's files. The user runs mount,
> which starts fuservicemount3, a setuid-root helper. The fuse server
> sends requests to the helper over a socket. With an OPEN request, the
> server asks the helper to open its backing file, for example the disk
> image named on the mount command line. The helper opens the file with
> the user's credentials and passes the file descriptor to the server.
> fusermount3 opens nothing for the fuse server except /dev/fuse; the
> server runs as the user and opens its own files.
> 
> The helper opens any path the server sends. An attacker who controlled
> the server could use this to read every file the user can read, for
> example ~/.ssh/id_ed25519, and the sandbox does not prevent it. The
> helper now prints a warning if the user did not name the path when
> mounting: as a whole argument, as the value of a name=value option, or
> glued to a short option as in "-J/dev/sdb1". The helper splits the
> options with fuse_opt_parse(), as the fuse server does, so both see the
> same option values. The helper still opens the path, because a server
> can take a path in a form that none of these checks recognizes.
> 
> Enforced permissions follow up in the next commit.
> 
> Assisted-by: LLM
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

I wonder if there are any fuse servers out there that take parameters
like:

-o bdevs=/dev/sda:/dev/sdb,otheroption=whatever

but ... let's let them come out of the woodwork?

I think this is a good addition :)
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  util/mount_service.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 66 insertions(+), 7 deletions(-)
> 
> diff --git a/util/mount_service.c b/util/mount_service.c
> index 7549e0b5024f..446f37f61916 100644
> --- a/util/mount_service.c
> +++ b/util/mount_service.c
> @@ -770,9 +770,55 @@ static bool arg_in_cmdline(int argc, const char * const argv[],
>  	return false;
>  }
>  
> +struct option_value_match {
> +	const char *path;
> +	bool found;
> +};
> +
> +/* fuse_opt_parse() callback: set match->found if the path is this option's value */
> +static int match_option_value(void *data, const char *arg, int key,
> +			      struct fuse_args *outargs)
> +{
> +	struct option_value_match *match = data;
> +	const char *value = strchr(arg, '=');
> +
> +	(void) outargs;
> +
> +	if (key != FUSE_OPT_KEY_OPT)
> +		return 0;
> +
> +	if (value && !strcmp(value + 1, match->path))
> +		match->found = true;
> +
> +	/* Short option with its value glued on, as in "-J/dev/sdb1" */
> +	if (arg[0] == '-' && arg[1] && arg[1] != '-' &&
> +	    !strcmp(arg + 2, match->path))
> +		match->found = true;
> +
> +	return 0;
> +}
> +
> +/* @return true for the path in "-o name=path", "--name=path" or "-Xpath" */
> +static bool option_value_in_cmdline(int argc, const char * const argv[],
> +				    const char *path)
> +{
> +	struct option_value_match match = {
> +		.path = path,
> +	};
> +	struct fuse_args args = FUSE_ARGS_INIT(argc, (char **)argv);
> +	int ret;
> +
> +	/* Parse like the fuse server does, so both see the same values */
> +	ret = fuse_opt_parse(&args, &match, NULL, match_option_value);
> +	fuse_opt_free_args(&args);
> +
> +	return !ret && match.found;
> +}
> +
>  static int mount_service_open_path(const struct mount_service *mo,
>  				   mode_t expected_fmt,
> -				   struct fuse_service_packet *p, size_t psz)
> +				   struct fuse_service_packet *p, size_t psz,
> +				   int argc, const char * const argv[])
>  {
>  	const struct fuse_service_open_command *oc =
>  			container_of(p, struct fuse_service_open_command, p);
> @@ -800,6 +846,15 @@ static int mount_service_open_path(const struct mount_service *mo,
>  		return mount_service_send_file_error(mo, EINVAL, oc->path);
>  	}
>  
> +	/*
> +	 * The file is opened outside the service sandbox, so report a path
> +	 * the user did not name.
> +	 */
> +	if (!arg_in_cmdline(argc, argv, oc->path) &&
> +	    !option_value_in_cmdline(argc, argv, oc->path))
> +		fprintf(stderr, "%s: %s: warning: file not in command line arguments\n",
> +			mo->msgtag, oc->path);
> +
>  	open_flags = ntohl(oc->open_flags) | O_CLOEXEC;
>  	drop_privs();
>  	fd = open(oc->path, open_flags, ntohl(oc->create_mode));
> @@ -834,16 +889,18 @@ static int mount_service_open_path(const struct mount_service *mo,
>  
>  static int mount_service_handle_open_cmd(const struct mount_service *mo,
>  					 struct fuse_service_packet *p,
> -					 size_t psz)
> +					 size_t psz, int argc,
> +					 const char * const argv[])
>  {
> -	return mount_service_open_path(mo, 0, p, psz);
> +	return mount_service_open_path(mo, 0, p, psz, argc, argv);
>  }
>  
>  static int mount_service_handle_open_bdev_cmd(const struct mount_service *mo,
>  					      struct fuse_service_packet *p,
> -					      size_t psz)
> +					      size_t psz, int argc,
> +					      const char * const argv[])
>  {
> -	return mount_service_open_path(mo, S_IFBLK, p, psz);
> +	return mount_service_open_path(mo, S_IFBLK, p, psz, argc, argv);
>  }
>  
>  #ifdef HAVE_NEW_MOUNT_API
> @@ -1838,10 +1895,12 @@ int mount_service_main(int argc, char *argv[])
>  
>  		switch (ntohl(p->magic)) {
>  		case FUSE_SERVICE_OPEN_CMD:
> -			ret = mount_service_handle_open_cmd(&mo, p, sz);
> +			ret = mount_service_handle_open_cmd(&mo, p, sz,
> +					argc, (const char * const *)argv);
>  			break;
>  		case FUSE_SERVICE_OPEN_BDEV_CMD:
> -			ret = mount_service_handle_open_bdev_cmd(&mo, p, sz);
> +			ret = mount_service_handle_open_bdev_cmd(&mo, p, sz,
> +					argc, (const char * const *)argv);
>  			break;
>  		case FUSE_SERVICE_FSOPEN_CMD:
>  			ret = mount_service_handle_fsopen_cmd(&mo, p, sz);
> 
> -- 
> 2.53.0
> 
> 
> 
