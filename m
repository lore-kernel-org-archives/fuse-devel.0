Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D7F361667
	for <fuse-devel@lists.linux.dev>; Fri, 25 Sep 2026 21:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790372438; cv=none; b=j0RMvRgr2k6PeMS9s6NyIEqjRnOQkIpmxFETZnO1GYT3IDANPrQ/ApgTqBRfppXtSjTztoiLu4i8Ui6E0jOmbIvGDgTu0Y9AR6/glsE9M7S8mKJrA6yLTTiwI8uNgA94nBOZNzvd2FlFdY7/MuYoWPUgfADGUE461rFML74oCGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790372438; c=relaxed/simple;
	bh=BI13qUYsK1ivIOHMVJy7AxZfbD2EWJXXLLayZkqzh/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCKAEVgGmFgb46ABv1NP8C1BMUkHuN+cJm81TxlVZNl4UOAPDTorkNXv5Q9V/NzvhEFqxcTbeqjv4uakKcXlVqSIwc0xLi3CiZM2pbZHwhyzxjKDmNL0+JwvapDYLPKgT+nkUeEv3t+NO2Ng3FruoJtmx5kR8sD0ZmvFJ2kqGRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOYEAoeA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOYEAoeA"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E29E71F000FF;
	Fri, 25 Sep 2026 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790372437;
	bh=AOG+7gJXiCD3+bQBg2O/DWoK9SZiVUe9oyF24aFlDyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hOYEAoeAGM88E7hiJMxp+9NuIfkXXIQuWjFPXjBMJmiY/TWlttwG+0squwOs6Pek1
	 Eq4nNL+AnOiO+Kje7rrl2RykvYYqwLmHH1OU5Zakm8rZzYZDE1kMtlTz3cle+3SlGT
	 Wol+LgGiDJEmql3bCm6b3v6T4k4Sh2/s6x/5m79/lGWFzgaYRKkrdko/9Zsuo4N4dX
	 4gV+s6DYsPIs4+/UCh6J6k2JmO+ipnXjwcRJiPm/rDcaefg96prgrE8W+4+H3PK1zR
	 rXV+blwBZ75llSIKJfydcZL0Y2lwvgkKbg1Eq2e37p88YAxg68ust3s8D+dkFzS3RF
	 E0Gd0zr3XNtHA==
Date: Fri, 25 Sep 2026 14:40:36 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 01/10] mount_service: move the command line check into
 arg_in_cmdline()
Message-ID: <20260925214036.GQ6253@frogsfrogsfrogs>
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
 <20260925-mount-service-bound-open-v1-1-bbf1a84c7995@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mount-service-bound-open-v1-1-bbf1a84c7995@bsbernd.com>

On Fri, Sep 25, 2026 at 12:23:29AM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> mount_service_handle_mountpoint_cmd() compared the mount point with
> each argument of fuservicemount3 in its own loop. The next patch makes
> the same check for OPEN requests, so the loop moves into
> arg_in_cmdline(). There is no change in behaviour.
> 
> Assisted-by: LLM
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

This is a reasonable hoist so
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  util/mount_service.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/util/mount_service.c b/util/mount_service.c
> index 0b3266309a8a..7549e0b5024f 100644
> --- a/util/mount_service.c
> +++ b/util/mount_service.c
> @@ -758,6 +758,18 @@ static int prepare_bdev(const struct mount_service *mo,
>  	return 0;
>  }
>  
> +static bool arg_in_cmdline(int argc, const char * const argv[],
> +			   const char *value)
> +{
> +	int i;
> +
> +	for (i = 0; i < argc; i++)
> +		if (!strcmp(argv[i], value))
> +			return true;
> +
> +	return false;
> +}
> +
>  static int mount_service_open_path(const struct mount_service *mo,
>  				   mode_t expected_fmt,
>  				   struct fuse_service_packet *p, size_t psz)
> @@ -1248,8 +1260,6 @@ static int mount_service_handle_mountpoint_cmd(struct mount_service *mo,
>  			container_of(p, struct fuse_service_mountpoint_command, p);
>  	char *mntpt;
>  	mode_t expected_fmt;
> -	bool foundit = false;
> -	int i;
>  
>  	if (psz < sizeof_fuse_service_mountpoint_command(1)) {
>  		fprintf(stderr, "%s: mount point command too small\n",
> @@ -1289,13 +1299,7 @@ static int mount_service_handle_mountpoint_cmd(struct mount_service *mo,
>  	}
>  
>  	/* Mountpoint must be mentioned in the caller's argument list */
> -	for (i = 0; i < argc; i++) {
> -		if (!strcmp(argv[i], oc->value)) {
> -			foundit = true;
> -			break;
> -		}
> -	}
> -	if (!foundit) {
> +	if (!arg_in_cmdline(argc, argv, oc->value)) {
>  		fprintf(stderr, "%s: mount point must be in command line arguments\n",
>  			mo->msgtag);
>  		return mount_service_send_reply(mo, EINVAL);
> 
> -- 
> 2.53.0
> 
> 
> 
