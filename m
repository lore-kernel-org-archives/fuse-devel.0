Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3131A6807
	for <fuse-devel@lists.linux.dev>; Sat,  9 May 2026 00:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286934; cv=none; b=tBfXg4srGCuAoR6eURBYrjjgeB16JDVoXDwuAJYF68p+i11NDGfJiV66Oz8droVtQkzogJlhKeIp+i/QIS2cgiTqmOYohQsUi5excxODofdbi5Z1QVOPfGkxVMt9V06im6bwIwS4Xxj1yGQNlyqV+n2pO4kTS1yaWS3GFCfSk/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286934; c=relaxed/simple;
	bh=6G6Be7cYLoYCZo/72135ruE0t2RG0tyFHS75ANaous4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAtIY9PtvKUqPRYDN4oA5M50QxhYL+4tuUqhJsDtalIvePLCx+VD8dOVfhUloEA2DhsEcQKLaSW313eKHVPW51A34aJHkmpqSuaHCulPkky2ScQfXyIpn7/opMqYlSTr/G30PQ4phe8YhC4oc5ZC+8OOFW/17ZkbCMTn1zwAqF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRqXSRZ0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRqXSRZ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DF2C2BCB0;
	Sat,  9 May 2026 00:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778286934;
	bh=6G6Be7cYLoYCZo/72135ruE0t2RG0tyFHS75ANaous4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRqXSRZ0WpGLHRTlLBK/Sg9TzXDcIjW4beSaiuV+jegtjP/Q9bcbCqtW+OGB174Kd
	 aeSirJZzWIMRjpptZmQwGxiHH8fgRXRFd1w8rKcK1CTDhj6PJhv9iPPjfNdTPq2YIR
	 icTczQKGEzpPe1D1ilp6ocrdCtjOLtPeVB3/qfSoRni7gsLidOfVO4rETcqsJ5sSy/
	 mUBTA1qb6oOVlYJXE9toCIrHRDHlcR7kTGpdk+9kK4DmGb2pvt6DN9KemjjB3U/yXL
	 qdJtQAIGrsrUc0xo0+PcVsxYh3tqKK7xxt1QFGus9gv77k/6qHiDDiOJ1V6nQi676o
	 2088LY4VovpGg==
Date: Fri, 8 May 2026 17:35:34 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 09/10] fuse mount: Do not set sync_init when sync_init
 was not used
Message-ID: <20260509003534.GN2241589@frogsfrogsfrogs>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
 <20260508-new-mount-fixes-and-tests-v1-9-c67a0893ddbc@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-9-c67a0893ddbc@bsbernd.com>

On Fri, May 08, 2026 at 06:39:12PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> synchronous init is just a hint and we cannot fail on it, but for
> daemonization we need to do know when it was actually used.
> Bug was that se->sync_init() was set unconditionally on mount success.
> 
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  lib/fuse_lowlevel.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/fuse_lowlevel.c b/lib/fuse_lowlevel.c
> index 6e078e82..60b936c3 100644
> --- a/lib/fuse_lowlevel.c
> +++ b/lib/fuse_lowlevel.c
> @@ -4471,10 +4471,13 @@ static void *session_sync_init_worker(void *data)
>  }
>  
>  /* Enable synchronous FUSE_INIT and start worker thread */
> -static int session_start_sync_init(struct fuse_session *se, int fd)
> +static int session_start_sync_init(struct fuse_session *se, int fd,
> +				   bool *is_sync_init)
>  {
>  	int err, res;
>  
> +	*is_sync_init = false;
> +
>  	/*
>  	 * Older fuse servers do not set want_sync_init or start the new
>  	 * daemonize code, so they get async init.
> @@ -4536,6 +4539,8 @@ static int session_start_sync_init(struct fuse_session *se, int fd)
>  		return -EIO;
>  	}
>  
> +	*is_sync_init = true;

Hrm.  So we only end up with return value == 0 and *is_sync_init==true
if SYNC_INIT was enabled via ioctl and all the pthread stuff is ready to
go.  The other two outcomes are:

1. return == 0 && *is_sync_init==false if the kernel didn't let us use
   synchronous init

2. return != 0 if something broke and we just want to abort

If that's all correct then I've understood this patch well enough to say
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> +
>  	return 0;
>  }
>  
> @@ -4594,7 +4599,8 @@ static int session_wait_sync_init_completion(struct fuse_session *se)
>  static int new_api_fusermount(struct fuse_session *se,
>  			      const char *mountpoint,
>  			      const char *mnt_opts,
> -			      int *sock_fd, pid_t *fusermount_pid)
> +			      int *sock_fd, pid_t *fusermount_pid,
> +			      bool *is_sync_init)
>  {
>  	int fd, err;
>  
> @@ -4617,7 +4623,7 @@ static int new_api_fusermount(struct fuse_session *se,
>  
>  	/* Start worker thread with correct fd from fusermount3 */
>  	se->fd = fd;
> -	err = session_start_sync_init(se, fd);
> +	err = session_start_sync_init(se, fd, is_sync_init);
>  	if (err) {
>  		fuse_log(FUSE_LOG_ERR,
>  			 "fuse: failed to start sync init worker\n");
> @@ -4649,6 +4655,7 @@ static int fuse_session_mount_new_api(struct fuse_session *se,
>  	char *mnt_opts = NULL;
>  	char *mnt_opts_with_fd = NULL;
>  	char fd_opt[32];
> +	bool is_sync_init = false;
>  
>  	res = fuse_kern_mount_get_base_mnt_opts(se->mo, &mnt_opts);
>  	err = -EIO;
> @@ -4665,7 +4672,7 @@ static int fuse_session_mount_new_api(struct fuse_session *se,
>  	}
>  
>  	se->fd = fd;
> -	err = session_start_sync_init(se, fd);
> +	err = session_start_sync_init(se, fd, &is_sync_init);
>  	if (err)
>  		goto err;
>  
> @@ -4684,7 +4691,8 @@ static int fuse_session_mount_new_api(struct fuse_session *se,
>  		close(fd);
>  		se->fd = -1;
>  		fd = new_api_fusermount(se, mountpoint, mnt_opts,
> -					&sock_fd, &fusermount_pid);
> +					&sock_fd, &fusermount_pid,
> +					&is_sync_init);
>  		if (fd < 0) {
>  			err = fd;
>  			goto err_with_sock;
> @@ -4711,11 +4719,12 @@ err:
>  		se->fd = -1;
>  		se->error = err;
>  	}
> +	se->is_sync_init = is_sync_init;
> +
>  	/* Wait for synchronous FUSE_INIT to complete */
>  	if (session_wait_sync_init_completion(se) < 0)
>  		fuse_log(FUSE_LOG_ERR, "fuse: sync init completion failed\n");
>  
> -	se->is_sync_init = true;
>  	free(mnt_opts);
>  	free(mnt_opts_with_fd);
>  	return fd;
> @@ -4791,7 +4800,6 @@ int fuse_session_mount(struct fuse_session *se, const char *_mountpoint)
>  out:
>  	se->fd = fd;
>  	se->mountpoint = mountpoint;
> -
>  	fuse_daemonize_early_set_mounted();
>  
>  	return 0;
> 
> -- 
> 2.53.0
> 
> 
