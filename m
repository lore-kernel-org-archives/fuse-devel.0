Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3C33655E0
	for <fuse-devel@lists.linux.dev>; Fri, 25 Sep 2026 22:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373911; cv=none; b=V/brRljn7O/qoqOL4RRfBfoabq0uqbksYYbIerNHlIsisTIqjLCR8AUXJ/NQIIj8tia6cidEWBQ3vOpE6Rr2dYoa1PNuYatz1crzsvh+X0FohZT2A8UfwHTrczDLpDDuS1iIRZl0su8kJR59dQT0+/6dyRIdF94MPk0irqvznmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373911; c=relaxed/simple;
	bh=/57GVAASS67LyetMM+yDKSq0CGh9hSYDOI5z2f2wc2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGUc/moX9+aC1IycQvWSOGn9dmkTFLN66Ym1B/FpDgeE+yIeoLAhEu2LhX1xgWIPBX2G8dxn/PqziR3jwoITgUtaaoJBTyTAyaSd5sA4lYQDCINIw6PVXOn1jidYwnM/gi4CGNNSGor/Iri5WNEDlHBQdAe18SFgvc/wUex47kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FU+aknBS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FU+aknBS"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 344611F000FF;
	Fri, 25 Sep 2026 22:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790373909;
	bh=jcVGcqlUrbKpXzF+2a00m8rDAA4MEhykt9nKvMIzv2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FU+aknBS/v06uAJIj7JWS7/WKG1mFM6HxaSO9DlZdCvzRYCHiGK8lwqhpvin9cc9t
	 FogMcWbblu/fi/0a8DAr2qI/XXMF/iskL12GTTqRTo+eWi8v09ECZPQfXoDGuwAqY4
	 NNMjfJDTD0HQ40yzI0vAdWenMzj1XN2M+58NBQgTLpoF4oxYPiOsuaDJMTkaj78VcI
	 orwBg4xfEIXURKb8ttv1jL/8U3sknpjjfvOQnRSNee4pGEZNa3AaZz9i7ErK3AdurL
	 +vCwjlkFEQ3P0XLsnodfnITKq1sHRHevJraMpNbbXfylv1YLDz1ZSeZG/4SeFiICQO
	 rUhV4aRbY+BNw==
Date: Fri, 25 Sep 2026 15:05:08 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 02/10] mount_service: open only paths named on the
 command line
Message-ID: <20260925220508.GR6253@frogsfrogsfrogs>
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
 <20260925-mount-service-bound-open-v1-2-bbf1a84c7995@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mount-service-bound-open-v1-2-bbf1a84c7995@bsbernd.com>

On Fri, Sep 25, 2026 at 12:23:30AM +0200, Bernd Schubert via B4 Relay wrote:
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
> The helper opened any path the server sent. An attacker who controlled
> the server could use this to read every file the user can read, for
> example ~/.ssh/id_ed25519, and the sandbox did not prevent it. The
> helper now compares the requested path with the arguments it was
> started with. For "mount -t fuse.service_ll /srv/disk.img /mnt", these
> include "/srv/disk.img" and "/mnt". The helper opens the path only if
> the string is equal to one of these arguments, so the server can open
> only a file that the user named when mounting. The helper already made
> the same check for the mount point.

Hmm.  In general I think it's a good idea not to let the fuse server
open anything in the mount helper's filesystem namespace that wasn't
explicitly mentioned in the CLI arguments.  However, the simple strcmp
check will exclude too much for fuse servers that receive paths via
mount options.  For instance,

$ mount -t fuse.ext4 /dev/sda1 /mnt -o journal_dev=/dev/sdb1,ro

Here the user mentions /dev/sdb1, but arg_in_cmdline() will never find
it because it's a substring of the last argv[].

--D

> Assisted-by: LLM
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  doc/fuservicemount3.8  |  4 ++++
>  include/fuse_service.h |  5 ++++-
>  util/mount_service.c   | 29 ++++++++++++++++++++++-------
>  3 files changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/doc/fuservicemount3.8 b/doc/fuservicemount3.8
> index aa2167cb4872..06755d7c3c4e 100644
> --- a/doc/fuservicemount3.8
> +++ b/doc/fuservicemount3.8
> @@ -19,6 +19,10 @@ Mount a filesystem using a FUSE server that runs as a socket service.
>  These servers can be contained using the platform's service management
>  framework.
>  
> +The FUSE server may ask fuservicemount3 to open files on its behalf.
> +fuservicemount3 opens only paths that appear verbatim on its command line
> +and refuses any other request with EPERM.
> +
>  The second form checks if there is a FUSE service available for the given
>  filesystem type.
>  .SH "AUTHORS"
> diff --git a/include/fuse_service.h b/include/fuse_service.h
> index d6aedea8f0f8..3954f62aa2b8 100644
> --- a/include/fuse_service.h
> +++ b/include/fuse_service.h
> @@ -139,6 +139,8 @@ int fuse_service_parse_cmdline_opts(struct fuse_args *args,
>  
>  /**
>   * Ask the mount.service helper to open a file on behalf of the fuse server.
> + * The helper refuses a path that is not verbatim on the mount command line;
> + * fuse_service_receive_file() then reports -EPERM.
>   *
>   * @param sf service context
>   * @param path the path to file
> @@ -153,7 +155,8 @@ int fuse_service_request_file(const struct fuse_service *sf, const char *path,
>  
>  /**
>   * Ask the mount.service helper to open a block device on behalf of the fuse
> - * server.
> + * server.  The path must be verbatim on the mount command line, as for a
> + * file request.
>   *
>   * @param sf service context
>   * @param path the path to file
> diff --git a/util/mount_service.c b/util/mount_service.c
> index 7549e0b5024f..835d3d94aa4a 100644
> --- a/util/mount_service.c
> +++ b/util/mount_service.c
> @@ -772,7 +772,8 @@ static bool arg_in_cmdline(int argc, const char * const argv[],
>  
>  static int mount_service_open_path(const struct mount_service *mo,
>  				   mode_t expected_fmt,
> -				   struct fuse_service_packet *p, size_t psz)
> +				   struct fuse_service_packet *p, size_t psz,
> +				   int argc, const char * const argv[])
>  {
>  	const struct fuse_service_open_command *oc =
>  			container_of(p, struct fuse_service_open_command, p);
> @@ -800,6 +801,16 @@ static int mount_service_open_path(const struct mount_service *mo,
>  		return mount_service_send_file_error(mo, EINVAL, oc->path);
>  	}
>  
> +	/*
> +	 * The file is opened outside the service sandbox, so only hand out
> +	 * what the user named.
> +	 */
> +	if (!arg_in_cmdline(argc, argv, oc->path)) {
> +		fprintf(stderr, "%s: %s: file must be in command line arguments\n",
> +			mo->msgtag, oc->path);
> +		return mount_service_send_file_error(mo, EPERM, oc->path);
> +	}
> +
>  	open_flags = ntohl(oc->open_flags) | O_CLOEXEC;
>  	drop_privs();
>  	fd = open(oc->path, open_flags, ntohl(oc->create_mode));
> @@ -834,16 +845,18 @@ static int mount_service_open_path(const struct mount_service *mo,
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
> @@ -1838,10 +1851,12 @@ int mount_service_main(int argc, char *argv[])
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
