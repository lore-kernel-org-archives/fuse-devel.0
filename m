Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58CBDF59
	for <fuse-devel@lists.linux.dev>; Sat,  9 May 2026 00:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778287130; cv=none; b=RocBKjyKoBKm7aQk1b4HDfoBe+iNE0g6rnW+QfikFvH9FuctKZ402pPNYZVGtLFPbdbFVGVToiSGE+XyEToqzEHr63P838m8QYy4KzwOpwWqDCBytLk3Pv6RqqWoWuWvazfBlA6NxzkWRpSZFcVJ6MCWKH4V5kDGvgR96Wlf1Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778287130; c=relaxed/simple;
	bh=14kYJ1nolxaQA6wJ1BNpTNyd7Ts2trrdGsuzVvBre9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekDR5kbancuj0yQh6o7UIWcaALPZ8BzaOxdgpt2JnAkVvNov7Kttk3c3/Nl+CyCXOCKd8h96G+b5NNWIlEGB8PQ19INKXuTq+wyj4HrfZpfJFVBUuKi/Ln3jSx5gmyN8fh6VRk82y1a6t4k6e1KQGoOXamqD/DVIzCi6uqFrwjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yw29Y4RG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yw29Y4RG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC84C2BCB0;
	Sat,  9 May 2026 00:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778287130;
	bh=14kYJ1nolxaQA6wJ1BNpTNyd7Ts2trrdGsuzVvBre9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yw29Y4RGAoJcxjU9TA0falwAgqvS6cgA/CFeuBqLJHouuMx86vJj5bs3hmvCygFB3
	 m708NIxb9XO/66+aC+BNSQdxjK0pPDk+O1j1YiEpjad9RWN5AXlsrt2ngz/En9TJRS
	 xihYCEg/Gv3BAL6LDfNLm2je+qbLiWF1EfhLtdtMrNcS9c/ck15py+tYOi0mDB2w6f
	 PxbMjr4X3aYOxIaUsTxHo/072IHshHTUY4fIPWr2zQN4qvY8jhCZ+x3n2ThXrWKR/I
	 jKGINvscYZExMPi6Q1Pz92/r5ZFNOsKJIyj9n2pR9EN3CEhn4aFkVOLVSHh+fQ2i0+
	 ClzCkh3OpIdIQ==
Date: Fri, 8 May 2026 17:38:49 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev, Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH 10/10] highlevel: Switch fuse_main_real_versioned() to
 fuse_daemonize_early()
Message-ID: <20260509003849.GO2241589@frogsfrogsfrogs>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
 <20260508-new-mount-fixes-and-tests-v1-10-c67a0893ddbc@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-10-c67a0893ddbc@bsbernd.com>

On Fri, May 08, 2026 at 06:39:13PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> For high level we can switch directly in that function to the new daemonize
> API. Additionally we need to check if the daemon has already acticated
> daemonization to avoid warning messages.
> 
> Suggested-by: Miklos Szeredi <miklos@szeredi.hu>
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  lib/helper.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/helper.c b/lib/helper.c
> index 4d7c2b7f..15de3fbf 100644
> --- a/lib/helper.c
> +++ b/lib/helper.c
> @@ -260,6 +260,7 @@ int fuse_main_real_versioned(int argc, char *argv[],
>  	struct fuse_cmdline_opts opts;
>  	int res;
>  	struct fuse_loop_config *loop_config = NULL;
> +	bool self_daemonize = false;
>  
>  	if (fuse_parse_cmdline(&args, &opts) != 0)
>  		return 1;
> @@ -289,6 +290,21 @@ int fuse_main_real_versioned(int argc, char *argv[],
>  		goto out1;
>  	}
>  
> +	/* The application might have already started daemonization itself */
> +	if (!fuse_daemonize_early_is_active()) {
> +		int daemonize_early_flags = 0;
> +
> +		if (opts.foreground)
> +			daemonize_early_flags |= FUSE_DAEMONIZE_NO_BACKGROUND;
> +
> +		self_daemonize = true;

Technically speaking you don't have to set self_daemonize until after
the _early_start succeeds, right?

That doesn't bother me all that much, so
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> +		res = fuse_daemonize_early_start(daemonize_early_flags);
> +		if (res != 0) {
> +			fuse_log(FUSE_LOG_ERR, "fuse: daemonize_early_start failed\n");
> +			goto out1;
> +		}
> +	}
> +
>  	struct fuse *_fuse_new_31(struct fuse_args *args,
>  			       const struct fuse_operations *op, size_t op_size,
>  			       struct libfuse_version *version,
> @@ -305,22 +321,14 @@ int fuse_main_real_versioned(int argc, char *argv[],
>  		goto out2;
>  	}
>  
> -	/*
> -	 * fuse_daemonize() already checks and fails then, but we need to
> -	 * handle it gracefully here, as this is done libfuse internal
> -	 * and caller didn't ask to daemonize with old API.
> -	 */
> -	if (!fuse_daemonize_early_is_active()) {
> -		if (fuse_daemonize(opts.foreground) != 0) {
> -			res = 5;
> -			goto out3;
> -		}
> -	}
>  	if (fuse_set_signal_handlers(se) != 0) {
>  		res = 6;
>  		goto out3;
>  	}
>  
> +	if (self_daemonize)
> +		fuse_daemonize_early_success();
> +
>  	if (opts.singlethread)
>  		res = fuse_loop(fuse);
>  	else {
> 
> -- 
> 2.53.0
> 
> 
