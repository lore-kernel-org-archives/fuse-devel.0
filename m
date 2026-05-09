Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9851CAA68
	for <fuse-devel@lists.linux.dev>; Sat,  9 May 2026 00:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286609; cv=none; b=eeyyuARqHtM/teDX8zzSNIwkgo68/ye1CXg3TIPLiBrAecYSM3/f+68UpbEfAwogEjx++T0yJQi8y/JXkwQTN+u7hYUERqkhd684vV2WDr/S4rW+tsXX2dfETQaLfaFBrDbLvOGe1czfiDVnhDNFSAaVApALj3FQbZ0HW05In3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286609; c=relaxed/simple;
	bh=dvgPzNfARkNdCEv5yoqa5VB4i1GwlH5P4aIBM0GgQG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLOHUm7vy0Q4H3ItmiOZ++Hm/8O2jA7ozQQXRrw6j2Jps2xh5cbQp1F/ltHtmt829jb8gxexkjGSTiMtc83HJa9iDVjWxNf6VI9YmDX8ah05yMmeu0wDGQZukyRFYrxG70UPhz9nZZLyyFvzQ8ujfSPALS75pxYgOLfDVUYWOw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzCCgxjF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzCCgxjF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573ABC2BCB0;
	Sat,  9 May 2026 00:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778286609;
	bh=dvgPzNfARkNdCEv5yoqa5VB4i1GwlH5P4aIBM0GgQG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hzCCgxjFvf3H81MDOe25v7LuqNu3fk10T9qdoImkdxmhjdkcN2KDMCI9ioxY4ReF+
	 sw8pDyuQA2og7HyZW6DU8YqCZRub4pAHeGtvJlY4oKCbhxJ8hOtG0m7xACatTiEqzJ
	 S9yAaKULkRnOFj7rcwwN/8OF6vniArMzI6/kVlRXf711xAbf+FHVkm0CL+lfpCNHYj
	 X6iiCBJr1VyhC4HVbPmPNIEu99zey8By8MKywZQufXsZBqhK8a1afr5K81fPZMZbC2
	 6Hjdbs6s27QkFsRzN8n/LHkHlwuKGyAjZm/wQHlFBYr20SjgjJyNdlITh7sBeZAvG0
	 dQY9h1xu5dJYQ==
Date: Fri, 8 May 2026 17:30:08 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 08/10] fuse_daemonize_early_start: Disallow daemonization
 when already active.
Message-ID: <20260509003008.GM2241589@frogsfrogsfrogs>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
 <20260508-new-mount-fixes-and-tests-v1-8-c67a0893ddbc@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-8-c67a0893ddbc@bsbernd.com>

On Fri, May 08, 2026 at 06:39:11PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> A coding error could run fuse_daemonize_early_start() two times
> and so far the code was not handling/failing that.
> 
> Also do not set "active" when it actually does not do daemonization.
> 
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  lib/fuse_daemonize.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/fuse_daemonize.c b/lib/fuse_daemonize.c
> index c9a91748..8afe4b0d 100644
> --- a/lib/fuse_daemonize.c
> +++ b/lib/fuse_daemonize.c
> @@ -211,18 +211,22 @@ int fuse_daemonize_early_start(unsigned int flags)
>  	struct fuse_daemonize *dm = &daemonize;
>  	int err = 0;
>  
> +	if (dm->active)
> +		return -EALREADY;
> +
>  	dm->flags = flags;
>  	dm->signal_pipe_wr = -1;
>  	dm->death_pipe_rd = -1;
>  	dm->stop_pipe_rd = -1;
>  	dm->stop_pipe_wr = -1;
> -	dm->active = true;
>  
>  	if (!(flags & FUSE_DAEMONIZE_NO_CHDIR))
>  		(void)chdir("/");
>  
> -	if (!(flags & FUSE_DAEMONIZE_NO_BACKGROUND))
> +	if (!(flags & FUSE_DAEMONIZE_NO_BACKGROUND)) {
> +		dm->active = true;

I suppose there's no harm in letting multiple
fuse_daemonize_early_start(FUSE_DAEMONIZE_NO_BACKGROUND) calls occur,
but wouldn't it be simpler to say that fuse_daemonize_early_start should
only be called once by fuse servers that want sync_init and don't use
fuse_main(); or at most once by fuse servers that want sync_init and do
use fuse_main()?

vs. having a weird library call where with *some* parameters you can
call it more than once.

--D

>  		err = do_daemonize(dm);
> +	}
>  
>  	return err;
>  }
> 
> -- 
> 2.53.0
> 
> 
