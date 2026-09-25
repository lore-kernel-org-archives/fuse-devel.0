Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDFF23EA8B
	for <fuse-devel@lists.linux.dev>; Fri, 25 Sep 2026 22:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374216; cv=none; b=cjz9vs7cWTWYzthhcaGkiVmRM9VyAQvmuuJDhJqUcCBrU4Z6oehTa0ZJ6MbGEioQpqgK2FOoSzJVZPXnmp+wk48lhTRyGYDX3bWlkU0h6izZ7UGdIy4fhPFJ+vz3Gd0pLWFDbZI84wR3GVqPAB+1yhJltsxLRjHHbpzmOhjhEm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374216; c=relaxed/simple;
	bh=FBfWA5e4mFigXGrZH61hzTtIv2O9W6iS3PAdg8pT+9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZclsNcNdcjo3sUtlHhy75+CAENRCWUIuFqVwYglF+dYaiqApE37T/KPq5sBy83y0V0GLbCYUcPriSVrvTqo/0b2CCtLH63+psggTNfGTya+aX6rgTASiXmo19w2yVDLTFsVSCnO0TzU9iLzKC46nDMjE8H2u++B9VScBh4EbnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHfOzJiA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHfOzJiA"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 660A91F000FF;
	Fri, 25 Sep 2026 22:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790374214;
	bh=9Va0L+IY3qXMBqIB9ERDXEE7qcQBf/SF7ozaCc4sAXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GHfOzJiAm2GnwC+TmC344v880IPjqe8fs/fUQYptM6GZDLL6dWKFQrVR5Mw7ZNIak
	 bpr2qUkGYaB6EFqIS6etmpelGRhM/4OYBZ7dp4hTohNNyQzc5zdcr0MCIWj/XcZtxE
	 aG99EMDcMGwvwdL0YPpAr8aENPqAbfMDuMxFqdTmHUb5Z/wNfQ6sowLshQO6BYJyMK
	 m/KjdS2LRXSZFDo2ewmoyKc4BppxbcVDE3e5RVlFXA52y5UyOwWPWQCpRfU6RI3n0N
	 iNXzJ90uDyqBOQ9hMo95ArJTSjQ/r1C+2CLvz9GTtEBEjKRvQ4/TJLBwhgol24+6Ul
	 NpKcCRCxwG2KQ==
Date: Fri, 25 Sep 2026 15:10:13 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 05/10] mount.fuse: free the options on the service mount
 return path
Message-ID: <20260925221013.GU6253@frogsfrogsfrogs>
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
 <20260925-mount-service-bound-open-v1-5-bbf1a84c7995@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mount-service-bound-open-v1-5-bbf1a84c7995@bsbernd.com>

On Fri, Sep 25, 2026 at 12:23:33AM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> These leaks were detected by the new tests.
> 
> Assisted-by: LLM
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

Looks fine, though those leaks won't live for long...
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  util/mount.fuse.c | 42 ++++++++++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 16 deletions(-)
> 
> diff --git a/util/mount.fuse.c b/util/mount.fuse.c
> index c67a0c2b7f2f..1414265fd274 100644
> --- a/util/mount.fuse.c
> +++ b/util/mount.fuse.c
> @@ -56,9 +56,7 @@
>  #endif
>  
>  #include "fuse.h"
> -#ifdef HAVE_SERVICEMOUNT
> -# include "mount_service.h"
> -#endif
> +#include "mount_service.h"
>  
>  static char *progname;
>  
> @@ -396,6 +394,18 @@ out:
>  	fuse_opt_free_args(&args);
>  	return ret;
>  }
> +#else
> +static int try_service_main(const char *argv0, const char *fstype,
> +			    const char *source, const char *mountpoint,
> +			    const char *options)
> +{
> +	(void)argv0;
> +	(void)fstype;
> +	(void)source;
> +	(void)mountpoint;
> +	(void)options;
> +	return MOUNT_SERVICE_FALLBACK_NEEDED;
> +}
>  #endif
>  
>  int main(int argc, char *argv[])
> @@ -415,6 +425,7 @@ int main(int argc, char *argv[])
>  	int fuse_fd = 0;
>  	int drop_privileges = 0;
>  	char *dev_fd_mountpoint = NULL;
> +	int ret;
>  
>  	progname = argv[0];
>  	basename = strrchr(argv[0], '/');
> @@ -608,19 +619,17 @@ int main(int argc, char *argv[])
>  	}
>  #endif
>  
> -#ifdef HAVE_SERVICEMOUNT
>  	/*
>  	 * Now that we know the desired filesystem type, see if we can find
>  	 * a socket service implementing that, if we haven't selected any weird
>  	 * options that would prevent that.
>  	 */
>  	if (!pass_fuse_fd && !(setuid_name && setuid_name[0])) {
> -		int ret = try_service_main(argv[0], type, source, mountpoint,
> -					   options);
> +		ret = try_service_main(argv[0], type, source, mountpoint,
> +				       options);
>  		if (ret != MOUNT_SERVICE_FALLBACK_NEEDED)
> -			return ret;
> +			goto out;
>  	}
> -#endif
>  
>  	add_arg(&command, type);
>  	if (source)
> @@ -631,17 +640,18 @@ int main(int argc, char *argv[])
>  		add_arg(&command, options);
>  	}
>  
> +	execl("/bin/sh", "/bin/sh", "-c", command, NULL);
> +	fprintf(stderr, "%s: failed to execute /bin/sh: %s\n", progname,
> +		strerror(errno));
> +	ret = 1;
> +
> +out:
> +	if (pass_fuse_fd)
> +		close(fuse_fd);
>  	free(options);
>  	free(dev_fd_mountpoint);
>  	free(dup_source);
>  	free(setuid_name);
> -
> -	execl("/bin/sh", "/bin/sh", "-c", command, NULL);
> -	fprintf(stderr, "%s: failed to execute /bin/sh: %s\n", progname,
> -		strerror(errno));
> -	
> -	if (pass_fuse_fd)
> -		close(fuse_fd);
>  	free(command);
> -	return 1;
> +	return ret;
>  }
> 
> -- 
> 2.53.0
> 
> 
> 
