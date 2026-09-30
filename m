Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163AE4CDA2E
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781668; cv=none; b=hN7kPbBWVW+DJF8rIYFWoRRVS+zBDXrNiO/NF5WfyJpdlcd+Szpt7ud2wnUyYczOdx0cMWajUBE2+TXUa0bt5vhcwJqRVhOsBHi5ws1p70VQNFAk+BeQAYgQKOU6zyLhlXVLCB21eRi7+6+SnGmHTQbmnggZCGgLdUEzmzJ5Xt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781668; c=relaxed/simple;
	bh=n0zp3JFij1czuzkiRSZaWySBHtl9PvUCR6imm9Wj57o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuLj8prU80Omf5QZ7eQKVuNhz0eGFlUF6KwwfJnnN+UkfKzdEckYdMuxZn5gYU8VPptNtzIb25F2BVHPlZ1BdXffOU0ssL265B8G2eBziN7vr+UcuCLbFUAhKZd9w3qXgj+bDrgx+9DSa/ExJ024WHHST0aY8yhUvx5i7RP2iW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7s79InB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7s79InB"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 75AD21F000FF;
	Wed, 30 Sep 2026 15:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790781658;
	bh=iC+EwfiQVoltpBneYk1EkIoGrOCVsbpBmHXw+BMjqyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c7s79InB6nrRSH1+ULeD/RVtHSLhRmPl+Hm7x8Cqtbz+G26JVck5UiUxHsCvt2Ngr
	 5cG1Aww2xJ+5OgM+v1mLdliriSpRXgxArSKbrGQjZ59wFSA9cAT3GohMkPwp0wTM1k
	 lu1my3SBv4ifBysBQQTEewTY0URuMx5mDcbZdvsZuAo0wP0z4bsoc22puRj2rlkaHd
	 oYiam2V/iF6ky288AJtFIfMMMMM5PvHhUshkNY5fPGTmSwmB6Hw7MAMJB1oyyznhu6
	 xFbb+TIRw0DHuOvsZveQiJ4BMt2rVOxXtrG5TEPUA12TP/0IjDJJ+fWpzGchVUm71B
	 n+f+f+gCSjKrg==
Date: Wed, 30 Sep 2026 08:20:58 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: neal@gompa.dev, fuse-devel@lists.linux.dev
Subject: Re: [PATCH 3/4] mount_util: share the mtab flag-option builder
Message-ID: <20260930152058.GP6253@frogsfrogsfrogs>
References: <20260930-mount-service-use-mount-fsmount-v1-0-d585598896ee@bsbernd.com>
 <20260930-mount-service-use-mount-fsmount-v1-3-d585598896ee@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-mount-service-use-mount-fsmount-v1-3-d585598896ee@bsbernd.com>

On Wed, Sep 30, 2026 at 03:44:35PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> The loop over mount_flags[] that builds the rw/nosuid/nodev mirrors of
> an mtab record existed twice, in lib/mount.c and util/fusermount.c;
> both feed the same record, so a change to one silently diverges.
> fusermount3 does not link libfuse and cannot call fuse_opt_add_opt(),
> so fuse_mnt_add_opt() moves to lib/mount_util.c next to mount_flags[].
> 
> fuse_mnt_add_opt() now has one realloc and one snprintf, because
> realloc(NULL) is the malloc. The empty-list path reserves expand as
> well, which strdup could not do. No caller pairs an empty list with a
> non-zero expand, so nothing changes today.
> 
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

This looks like a pretty simple refactoring to hoist common code so
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  lib/mount.c         | 21 +--------------------
>  lib/mount_fsmount.c | 12 ++----------
>  lib/mount_util.c    | 33 +++++++++++++++++++++++++++++++++
>  lib/mount_util.h    | 20 ++++++++++++++++++++
>  util/fusermount.c   | 33 +++------------------------------
>  5 files changed, 59 insertions(+), 60 deletions(-)
> 
> diff --git a/lib/mount.c b/lib/mount.c
> index a6dd5013ea80..4d03ef4b848f 100644
> --- a/lib/mount.c
> +++ b/lib/mount.c
> @@ -995,25 +995,6 @@ static int fuse_mount_sys(const char *mnt, struct mount_opts *mo,
>  	return fd;
>  }
>  
> -/*
> - * Append the flag-mirror prefix (rw/nosuid/nodev/...) of the mtab record
> - * to @mtab_optsp, derived from the MS_* bitmask in @flags.
> - */
> -static int get_mtab_flag_opts(char **mtab_optsp, int flags)
> -{
> -	int i;
> -
> -	if (!(flags & MS_RDONLY) && fuse_opt_add_opt(mtab_optsp, "rw") == -1)
> -		return -1;
> -
> -	for (i = 0; mount_flags[i].opt != NULL; i++) {
> -		if (mount_flags[i].on && (flags & mount_flags[i].flag) &&
> -		    fuse_opt_add_opt(mtab_optsp, mount_flags[i].opt) == -1)
> -			return -1;
> -	}
> -	return 0;
> -}
> -
>  struct mount_opts *parse_mount_opts(struct fuse_args *args)
>  {
>  	struct mount_opts *mo;
> @@ -1057,7 +1038,7 @@ void destroy_mount_opts(struct mount_opts *mo)
>  int fuse_kern_mount_get_base_mtab_opts(const struct mount_opts *mo,
>  				       char **mtab_optsp)
>  {
> -	if (get_mtab_flag_opts(mtab_optsp, mo->flags) == -1)
> +	if (fuse_mnt_get_mtab_flag_opts(mtab_optsp, mo->flags) == -1)
>  		return -1;
>  	if (mo->kernel_opts && fuse_opt_add_opt(mtab_optsp, mo->kernel_opts) == -1)
>  		return -1;
> diff --git a/lib/mount_fsmount.c b/lib/mount_fsmount.c
> index 0b1fd4300d2d..730071206fc7 100644
> --- a/lib/mount_fsmount.c
> +++ b/lib/mount_fsmount.c
> @@ -446,16 +446,8 @@ int apply_fsconfig_mount_opts(int fsfd, const char *opts)
>  			continue;
>  		/*
>  		 * Skip mount attributes, they're handled by fsmount()
> -		 * not fsconfig().
> -		 *
> -		 * These string options (nosuid, nodev, etc.) are reconstructed
> -		 * from MS_* flags by get_mtab_flag_opts() in lib/mount.c and
> -		 * get_mtab_opts() in util/fusermount.c. Both the library path
> -		 * (via fuse_kern_mount_get_base_mtab_opts) and fusermount3 path
> -		 * rebuild these strings from the flags bitmask and pass them in
> -		 * mtab_opts. They must be filtered here because they are mount
> -		 * attributes (passed to fsmount via MOUNT_ATTR_*), not
> -		 * filesystem parameters (which would be passed to fsconfig).
> +		 * not fsconfig(). Callers rebuild them as strings from the
> +		 * MS_* bitmask for the mtab record, so they do show up here.
>  		 *
>  		 * Also skip mtab-only options - they're for /run/mount/utab, not kernel
>  		 */
> diff --git a/lib/mount_util.c b/lib/mount_util.c
> index 2f763fe1218e..72ed17c93f47 100644
> --- a/lib/mount_util.c
> +++ b/lib/mount_util.c
> @@ -140,6 +140,39 @@ const struct mount_flags mount_flags[] = {
>  {NULL,           0,                0,  0,    0,        0}
>  };
>  
> +int fuse_mnt_add_opt(char **optsp, const char *opt, unsigned int expand)
> +{
> +	/* an empty list gets no separator, and realloc(NULL) is the malloc */
> +	const char *sep = *optsp ? "," : "";
> +	size_t oldsize = *optsp ? strlen(*optsp) : 0;
> +	size_t newsize = oldsize + strlen(sep) + strlen(opt) + expand + 1;
> +	char *newopts = (char *) realloc(*optsp, newsize);
> +
> +	if (newopts == NULL) {
> +		fuse_log(FUSE_LOG_ERR, "fuse: failed to allocate memory\n");
> +		return -1;
> +	}
> +
> +	snprintf(newopts + oldsize, newsize - oldsize, "%s%s", sep, opt);
> +	*optsp = newopts;
> +	return 0;
> +}
> +
> +int fuse_mnt_get_mtab_flag_opts(char **mtab_optsp, int flags)
> +{
> +	int i;
> +
> +	if (!(flags & MS_RDONLY) && fuse_mnt_add_opt(mtab_optsp, "rw", 0) == -1)
> +		return -1;
> +
> +	for (i = 0; mount_flags[i].opt != NULL; i++) {
> +		if (mount_flags[i].on && (flags & mount_flags[i].flag) &&
> +		    fuse_mnt_add_opt(mtab_optsp, mount_flags[i].opt, 0) == -1)
> +			return -1;
> +	}
> +	return 0;
> +}
> +
>  #ifdef IGNORE_MTAB
>  #define mtab_needs_update(mnt) 0
>  #else
> diff --git a/lib/mount_util.h b/lib/mount_util.h
> index b20a428d99c7..4485d8a29f93 100644
> --- a/lib/mount_util.h
> +++ b/lib/mount_util.h
> @@ -24,6 +24,26 @@ struct mount_flags {
>  };
>  extern const struct mount_flags mount_flags[];
>  
> +/**
> + * @brief Append @opt to the comma-separated option list @optsp.
> + *
> + * @param[in,out] optsp   list to extend, NULL for an empty list.
> + * @param[in]     opt     option to append.
> + * @param[in]     expand  extra bytes to reserve for a value the caller
> + *                        appends itself.
> + * @return 0 on success, -1 on failure.
> + */
> +int fuse_mnt_add_opt(char **optsp, const char *opt, unsigned int expand);
> +
> +/**
> + * @brief Append the flag-mirror part of an mtab record (rw/nosuid/nodev/...).
> + *
> + * @param[in,out] mtab_optsp  option list to extend.
> + * @param[in]     flags       MS_* bitmask the mirrors are derived from.
> + * @return 0 on success, -1 on failure.
> + */
> +int fuse_mnt_get_mtab_flag_opts(char **mtab_optsp, int flags);
> +
>  int fuse_mnt_add_mount(const char *progname, const char *fsname,
>  		       const char *mnt, const char *type, const char *opts);
>  int fuse_mnt_remove_mount(const char *progname, const char *mnt);
> diff --git a/util/fusermount.c b/util/fusermount.c
> index 3031b282a7a6..c7de86f4b12e 100644
> --- a/util/fusermount.c
> +++ b/util/fusermount.c
> @@ -556,26 +556,6 @@ static int find_mount_flag(const char *s, unsigned len, int *on, int *flag)
>  	return 0;
>  }
>  
> -static int add_option(char **optsp, const char *opt, unsigned expand)
> -{
> -	char *newopts;
> -	if (*optsp == NULL)
> -		newopts = strdup(opt);
> -	else {
> -		unsigned oldsize = strlen(*optsp);
> -		unsigned newsize = oldsize + 1 + strlen(opt) + expand + 1;
> -		newopts = (char *) realloc(*optsp, newsize);
> -		if (newopts)
> -			sprintf(newopts + oldsize, ",%s", opt);
> -	}
> -	if (newopts == NULL) {
> -		fprintf(stderr, "%s: failed to allocate memory\n", progname);
> -		return -1;
> -	}
> -	*optsp = newopts;
> -	return 0;
> -}
> -
>  /*
>   * Build the mtab/utab record string for this mount: flag-mirrors of MS_*
>   * (rw/nosuid/nodev/...) + the kernel-bound -o options + "user=<n>" when
> @@ -585,19 +565,12 @@ static int add_option(char **optsp, const char *opt, unsigned expand)
>   */
>  static int get_mtab_opts(int flags, const char *opts, char **mtab_optsp)
>  {
> -	int i;
>  	int l;
>  
> -	if (!(flags & MS_RDONLY) && add_option(mtab_optsp, "rw", 0) == -1)
> +	if (fuse_mnt_get_mtab_flag_opts(mtab_optsp, flags) == -1)
>  		return -1;
>  
> -	for (i = 0; mount_flags[i].opt != NULL; i++) {
> -		if (mount_flags[i].on && (flags & mount_flags[i].flag) &&
> -		    add_option(mtab_optsp, mount_flags[i].opt, 0) == -1)
> -			return -1;
> -	}
> -
> -	if (add_option(mtab_optsp, opts, 0) == -1)
> +	if (fuse_mnt_add_opt(mtab_optsp, opts, 0) == -1)
>  		return -1;
>  	/* remove comma from end of opts*/
>  	l = strlen(*mtab_optsp);
> @@ -608,7 +581,7 @@ static int get_mtab_opts(int flags, const char *opts, char **mtab_optsp)
>  		if (user == NULL)
>  			return -1;
>  
> -		if (add_option(mtab_optsp, "user=", strlen(user)) == -1)
> +		if (fuse_mnt_add_opt(mtab_optsp, "user=", strlen(user)) == -1)
>  			return -1;
>  		strcat(*mtab_optsp, user);
>  	}
> 
> -- 
> 2.53.0
> 
> 
> 
