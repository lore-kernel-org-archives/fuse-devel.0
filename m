Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADED4F3ED3
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781244; cv=none; b=P3uW/RAvthvDVk9t9gWlOuNRY179C4ASy8hQu71oWE0xHHevQqqTI8+J0GSPg3hUzmkt/mBDZxz/F9xxOLT63Bu51eCdVRFg/mMz5C5BUexYmMTsVS8aVswBAhAyEznHvwQeLlSW5WABJZpWswQ9NYn4uP0RSl6XxgfATUi5IEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781244; c=relaxed/simple;
	bh=NlTfihp+rpnZf+3AeHyNHCRrw5QXq6sWIUjQRe6A8jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVxKN7DDxaeSb4W4eD1HfNu01LJp04oQErIxi4Chkex1zv6iWVRsK4eGnbt3f1lVZnJvcgJHXiudtinYmIUMdWWw3ELENV37LBysEzHa3CTepULUme+NwUgoARq8+lIV0wpZMsOxHYMbne9kh+qOlLFz2cBbN3AtqGLL2Sz1SMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYDMoCXA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYDMoCXA"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A0B541F008A0;
	Wed, 30 Sep 2026 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790781230;
	bh=DPKgePTRpgSjolbVV1USWzPjhYyenmGiBz3PdOtN4hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cYDMoCXAp88Etkj1IG4Ygh2mTlbEU8sd83PvpIe0SeVE44mdlEtuL9/h3v28+ka7L
	 AOm63TR5rrQEws3+hc0yLZ2ULqlsPVKyPRaaweupOiFLyzXzZCBT7b2Z8MKtaxy7Nh
	 Mn2luqHn/WrkvQpqu1OgO67ZeTzepQToUvBaTci8p2mfSECnp3Kl/SsCjAUPLC17sq
	 LAMYj1+dWvyUYTi6yGr2LCqAdVCx49edggQEGatteDU5Gex+SRaKBJDJV22bvbhxtA
	 J7wyLezptONAztpnAfb3MoKR2fgwx38GfCdtkgpRQjJl9gq8ezybIspq5KDZfwHppE
	 dh3QCOKpLRzKw==
Date: Wed, 30 Sep 2026 08:13:50 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: neal@gompa.dev, fuse-devel@lists.linux.dev
Subject: Re: [PATCH 1/4] mount_fsmount: split superblock creation and
 move_mount into a helper
Message-ID: <20260930151350.GN6253@frogsfrogsfrogs>
References: <20260930-mount-service-use-mount-fsmount-v1-0-d585598896ee@bsbernd.com>
 <20260930-mount-service-use-mount-fsmount-v1-1-d585598896ee@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-mount-service-use-mount-fsmount-v1-1-d585598896ee@bsbernd.com>

On Wed, Sep 30, 2026 at 03:44:33PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> This is a preparation patch. fuse_kern_fsmount() ran fsconfig
> CREATE, fsmount() and move_mount() inline. A later commit will make
> mount_service.c call the same three calls after it has run FSOPEN,
> SOURCE and MNTOPTS itself, so this moves them into
> fuse_fsmount_create_and_move(). The fsopen fd stays owned by the
> caller, because mount_service.c will close mo->fsopenfd itself
> later.
> 
> fuse_kern_fsmount() now converts MS_* flags before calling the
> helper, so unsupported flags are caught before the superblock is
> created, not after.
> 
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

This is a simple hoist, so
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  lib/mount_fsmount.c | 86 +++++++++++++++++++++++++++++++----------------------
>  lib/mount_i_linux.h | 18 +++++++++++
>  2 files changed, 69 insertions(+), 35 deletions(-)
> 
> diff --git a/lib/mount_fsmount.c b/lib/mount_fsmount.c
> index b2d0453e5c93..0b1fd4300d2d 100644
> --- a/lib/mount_fsmount.c
> +++ b/lib/mount_fsmount.c
> @@ -489,6 +489,53 @@ void fuse_kern_umount_mountfd(int mountfd)
>  	}
>  }
>  
> +int fuse_fsmount_create_and_move(int fsfd, unsigned int mount_attrs,
> +				 int dest_mnt_fd, const char *dest_path,
> +				 int *mountfd_out)
> +{
> +	int mountfd;
> +	int res;
> +
> +	res = fuse_fsconfig(fsfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0);
> +	if (res == -1) {
> +		int save_errno = errno;
> +
> +		log_fsconfig_kmsg(fsfd);
> +		fuse_log(FUSE_LOG_ERR, "fuse: fsconfig CREATE failed: %s\n",
> +			 strerror(save_errno));
> +		return -save_errno;
> +	}
> +
> +	mountfd = fuse_fsmount(fsfd, FSMOUNT_CLOEXEC, mount_attrs);
> +	if (mountfd == -1) {
> +		int save_errno = errno;
> +
> +		log_fsconfig_kmsg(fsfd);
> +		fuse_log(FUSE_LOG_ERR, "fuse: fsmount failed: %s\n",
> +			 strerror(save_errno));
> +		return -save_errno;
> +	}
> +
> +	if (dest_mnt_fd >= 0)
> +		res = fuse_move_mount(mountfd, "", dest_mnt_fd, "",
> +				      MOVE_MOUNT_F_EMPTY_PATH |
> +					      MOVE_MOUNT_T_EMPTY_PATH);
> +	else
> +		res = fuse_move_mount(mountfd, "", AT_FDCWD, dest_path,
> +				      MOVE_MOUNT_F_EMPTY_PATH);
> +	if (res == -1) {
> +		int save_errno = errno;
> +
> +		fuse_log(FUSE_LOG_ERR, "fuse: move_mount failed: %s\n",
> +			 strerror(save_errno));
> +		close(mountfd);
> +		return -save_errno;
> +	}
> +
> +	*mountfd_out = mountfd;
> +	return 0;
> +}
> +
>  int fuse_kern_fsmount(const char *mnt, int dest_mnt_fd, unsigned long flags,
>  		      int blkdev, const char *fsname, const char *subtype,
>  		      const char *source_dev, const char *kernel_opts,
> @@ -584,16 +631,6 @@ int fuse_kern_fsmount(const char *mnt, int dest_mnt_fd, unsigned long flags,
>  		goto out_free;
>  	}
>  
> -	/* Create the filesystem instance */
> -	res = fuse_fsconfig(fsfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0);
> -	if (res == -1) {
> -		err = -errno;
> -		log_fsconfig_kmsg(fsfd);
> -		fuse_log(FUSE_LOG_ERR, "fuse: fsconfig CREATE failed: %s\n",
> -			 strerror(errno));
> -		goto out_free;
> -	}
> -
>  	/* Convert MS_* flags to MOUNT_ATTR_* for fsmount() */
>  	flags = ms_flags_to_mount_attrs(flags, &mount_attrs);
>  	if (flags != 0) {
> @@ -602,33 +639,14 @@ int fuse_kern_fsmount(const char *mnt, int dest_mnt_fd, unsigned long flags,
>  		goto out_free;
>  	}
>  
> -	/* Create mount object with mount attributes */
> -	mountfd = fuse_fsmount(fsfd, FSMOUNT_CLOEXEC, mount_attrs);
> -	if (mountfd == -1) {
> -		err = -errno;
> -		log_fsconfig_kmsg(fsfd);
> -		fuse_log(FUSE_LOG_ERR, "fuse: fsmount failed: %s\n",
> -			 strerror(errno));
> +	err = fuse_fsmount_create_and_move(fsfd, mount_attrs, dest_mnt_fd, mnt,
> +					   &mountfd);
> +	if (err)
>  		goto out_free;
> -	}
>  
>  	close(fsfd);
>  	fsfd = -1;
>  
> -	if (dest_mnt_fd >= 0)
> -		res = fuse_move_mount(mountfd, "", dest_mnt_fd, "",
> -				 MOVE_MOUNT_F_EMPTY_PATH |
> -					 MOVE_MOUNT_T_EMPTY_PATH);
> -	else
> -		res = fuse_move_mount(mountfd, "", AT_FDCWD, mnt,
> -				 MOVE_MOUNT_F_EMPTY_PATH);
> -	if (res == -1) {
> -		err = -errno;
> -		fuse_log(FUSE_LOG_ERR, "fuse: move_mount failed: %s\n",
> -			 strerror(errno));
> -		goto out_close_mntfd;
> -	}
> -
>  	res = fuse_mnt_add_mount_helper(mnt, source, type, mtab_opts);
>  	if (res == -1) {
>  		err = -EIO;
> @@ -645,9 +663,7 @@ int fuse_kern_fsmount(const char *mnt, int dest_mnt_fd, unsigned long flags,
>  
>  out_umount:
>  	fuse_kern_umount_mountfd(mountfd);
> -out_close_mntfd:
> -	if (mountfd != -1)
> -		close(mountfd);
> +	close(mountfd);
>  out_free:
>  	free(source);
>  	free(type);
> diff --git a/lib/mount_i_linux.h b/lib/mount_i_linux.h
> index 8cf7ff4532c6..35bb54c82236 100644
> --- a/lib/mount_i_linux.h
> +++ b/lib/mount_i_linux.h
> @@ -86,6 +86,24 @@ int fuse_kern_fsmount(const char *mnt, int mnt_fd, unsigned long flags,
>  int fuse_kern_fsmount_mo(const char *mnt, const struct mount_opts *mo,
>  			 const char *mtab_opts, int *mountfd_out);
>  
> +/**
> + * Create the superblock and attach the resulting mount to a destination.
> + *
> + * The fsopen fd stays owned by the caller - a caller that keeps it in
> + * long-lived state must not be left with a descriptor closed behind its back.
> + *
> + * @fsfd fsopen fd, fully configured
> + * @mount_attrs MOUNT_ATTR_* flags, from ms_flags_to_mount_attrs()
> + * @dest_mnt_fd pre-resolved destination fd, or -1 to use @dest_path
> + * @dest_path destination path, used only when @dest_mnt_fd is -1
> + * @mountfd_out on success receives the fsmount() fd, to be closed by the
> + *              caller and usable for fuse_kern_umount_mountfd()
> + * @return 0 on success, negative error code on failure
> + */
> +int fuse_fsmount_create_and_move(int fsfd, unsigned int mount_attrs,
> +				 int dest_mnt_fd, const char *dest_path,
> +				 int *mountfd_out);
> +
>  /**
>   * Unmount (lazily) the mount @mountfd was created for, without a path lookup.
>   *
> 
> -- 
> 2.53.0
> 
> 
> 
