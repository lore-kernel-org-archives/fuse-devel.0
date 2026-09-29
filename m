Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4342D1913
	for <fuse-devel@lists.linux.dev>; Tue, 29 Sep 2026 02:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648840; cv=none; b=BGt/LDSu13QY1pdLA1oWR8dtgoILZ61XLq6BPKW32iUcoBOMc6a3oSlFurzYg22iyMJYpuq0NHGvqcWDiI/CVLF9YP6Cnkk8zxDdSjW1W9pIoiKKdlcXFrcJ1wzzbHWfLxfoujU7Hn+X92KoPk74z7qLKL933KYPF9/jk8E5CRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648840; c=relaxed/simple;
	bh=bjDmz3G9OcPU3yqRc98CmewMJVTz0vfot5HP/teGHz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRahEl0Bf9Gud/VKGgEUVi1JS+FhbHgf/wR9hduQvl2YhNpHq8K/PolHKRagF5VFnmGBF2hl/ToTBTqVTmvm5DEk7kQzQSOsUTIMzow7zeiakbBVivaY7Eh6+4NQzeik06nkzmfLilCean41EvkVg4MbnYvYVIaVe3Pij2uIjzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgT9gqd7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgT9gqd7"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 457AD1F00893;
	Tue, 29 Sep 2026 02:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790648839;
	bh=I1BVMV7GPPfhvYCmSd8y6GgtniXhBldRgqegoZijzHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AgT9gqd7zWgZs7BAztxzZrcVuDhzbjoFEr3H1RyRIPPnj6dxo+ix+geZNBfDZMhsU
	 cYDF/i3wxZPaA+XkKqZHw8MCupusHYCCvjgOlBHQ9y6hOCrJ48SODzvr9ys38KSGCz
	 onUKrSPe741aaQZP2pDtp1zSeGLJFURTLj+5NNtZFlPOyJMdttrQNDtnE9rTmdZuK5
	 HqcCF3e7aHFHEcEPomm71/2rviVQKVRpHXDrVUymNqzd0JwVr7f+4isaoxECBeYZdT
	 HbQnqko1Vtu+eS7QC2gIDa/fikmrKr2w2rhHeoQuyAFpIEarrA0mOzCZSn7WLIhKnn
	 eGYpNmNrsD/kw==
Date: Mon, 28 Sep 2026 19:27:18 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev, neal@gompa.dev
Subject: Re: [PATCH v2 04/14] mount_service: use openat to OPEN paths
Message-ID: <20260929022718.GD6253@frogsfrogsfrogs>
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
 <20260928-mount-service-bound-open-v2-4-0f9f501d05ce@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-mount-service-bound-open-v2-4-0f9f501d05ce@bsbernd.com>

On Mon, Sep 28, 2026 at 01:02:06PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> The fuse server sends fuservicemount3 a series of requests: OPEN for
> its backing file, MNTPT to name the mount point, then MOUNT. The server
> chooses the order. For a directory mount point, attach_to_mountpoint()
> changes the working directory of the helper to the mount point. The
> helper then mounts on ".", so a rename of the path cannot redirect the
> mount.
> 
> A relative path in an OPEN request after MNTPT resolved inside the
> mount point. For "fuservicemount3 disk.img /mnt -t fuse.service_ll",
> an OPEN of "disk.img" matched the command line argument, but the helper
> opened /mnt/disk.img, not disk.img in the user's working directory. The
> helper now opens OPEN paths with openat() on the working directory it
> started in.
> 
> Assisted-by: LLM
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

Looks good!
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  util/mount_service.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/util/mount_service.c b/util/mount_service.c
> index b4081d53273e..84e9d831ce03 100644
> --- a/util/mount_service.c
> +++ b/util/mount_service.c
> @@ -84,6 +84,9 @@ struct mount_service {
>  	/* fd for fsopen */
>  	int fsopenfd;
>  
> +	/* fd for the initial working directory */
> +	int cwdfd;
> +
>  	/* did we actually mount successfully? */
>  	bool mounted;
>  
> @@ -247,6 +250,18 @@ static int mount_service_init(struct mount_service *mo, int argc, char *argv[])
>  		return -1;
>  	}
>  
> +	drop_privs();
> +	mo->cwdfd = open(".", O_PATH | O_CLOEXEC);
> +	if (mo->cwdfd < 0) {
> +		int error = errno;
> +
> +		restore_privs();
> +		fprintf(stderr, "%s: cannot open working directory: %s\n",
> +			mo->msgtag, strerror(error));
> +		return -1;
> +	}
> +	restore_privs();
> +
>  	return 0;
>  }
>  
> @@ -859,8 +874,9 @@ static int mount_service_open_path(const struct mount_service *mo,
>  	}
>  
>  	open_flags = ntohl(oc->open_flags) | O_CLOEXEC;
> +	/* After fchdir to the mountpoint, a relative path would resolve there */
>  	drop_privs();
> -	fd = open(oc->path, open_flags, ntohl(oc->create_mode));
> +	fd = openat(mo->cwdfd, oc->path, open_flags, ntohl(oc->create_mode));
>  	if (fd < 0) {
>  		int error = errno;
>  
> @@ -1807,6 +1823,7 @@ static void mount_service_destroy(struct mount_service *mo)
>  	close(mo->fusedevfd);
>  	close(mo->argvfd);
>  	close(mo->fsopenfd);
> +	close(mo->cwdfd);
>  	shutdown(mo->sockfd, SHUT_RDWR);
>  	close(mo->sockfd);
>  
> @@ -1824,6 +1841,7 @@ static void mount_service_destroy(struct mount_service *mo)
>  	mo->fusedevfd = -1;
>  	mo->mountfd = -1;
>  	mo->fsopenfd = -1;
> +	mo->cwdfd = -1;
>  }
>  
>  int mount_service_main(int argc, char *argv[])
> 
> -- 
> 2.53.0
> 
> 
> 
