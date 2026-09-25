Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BBB4570E1
	for <fuse-devel@lists.linux.dev>; Fri, 25 Sep 2026 22:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374036; cv=none; b=X5cOIWXGthGhhP9E/Au7X6OlRrdtLjrwF3+9Kf2eNNkfMCwVaMPIKpxsCl8GoIv4pOnWZ552/Sl9iy22em6JTUZMwYwzIYk901wGMcKNPMiTHHwihMLK5VuWExvwqeKvF/ZKcd0rCIRH+ArdJWcaHgRzfNAOyrE27lgrwSWD0eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374036; c=relaxed/simple;
	bh=/k4dvZ2L/YpazqInvVmqa9rD8hIOyGzgozdu7tqpPOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLPgsdkeBc5keKFk6whuzLJbK7PGLs2AHpjPlolKSM8kC60TnvAI3kkaPP5dlY/tmuUOYPjtMI7hXCeN/wgvMqKCGKSLK+fnz9aeSdYZ7xlJzbrzVfuXijHuYqC+ZsEe9BvaEseUoviBtbyf1hWTXCqp3LJaGN3X35X3c/Q6FvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWyImb0C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWyImb0C"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3A6B61F000FF;
	Fri, 25 Sep 2026 22:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790374035;
	bh=FFsd5UrdZkfSUC6qMPx8Ewn8F/xbPmW0cPPnDYtdYnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oWyImb0CchvuD3TVpcHWtPFHAl9W2C+VvRoUpAAD4XLT30tSQ8i938jsD12Cq+/YR
	 F5kufS6+wJtL/ntS7PT9QZyIdtiPh4dNm2i3BbO9rMUyOirZv9fvdR5FY2IwjAKr8g
	 Liy7nqtfKPZjJ/qYqXo5zzAzK2mBkuWBI7sg94GRr0E4lTcCbjWfuZiUFBiQ75eDqb
	 xq7WTU53Rr2CkuSdardjiU0CqGux1oov/sxaMAmZFKU8sOupO2UptgYgyH6XiqZN+C
	 /ctj75/TDU+IsKg+Oo1J1BsSLG03R/vOs40VZt5u72kp02dgzbpvvWP7ZT+kvV9/Lq
	 ErgVFC5XwFF8A==
Date: Fri, 25 Sep 2026 15:07:14 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 03/10] mount_service: refuse OPEN after the MNTPT request
Message-ID: <20260925220714.GS6253@frogsfrogsfrogs>
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
 <20260925-mount-service-bound-open-v1-3-bbf1a84c7995@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mount-service-bound-open-v1-3-bbf1a84c7995@bsbernd.com>

On Fri, Sep 25, 2026 at 12:23:31AM +0200, Bernd Schubert via B4 Relay wrote:
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
> helper now refuses OPEN once the mount point is set. No in-tree server
> sends OPEN after MNTPT.

How about absolute paths?  The resolution of those remain the same after
the cwd changes.

--D

> 
> Assisted-by: LLM
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  doc/fuservicemount3.8  | 1 +
>  include/fuse_service.h | 3 ++-
>  util/mount_service.c   | 7 +++++++
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/doc/fuservicemount3.8 b/doc/fuservicemount3.8
> index 06755d7c3c4e..9b8c752b3bb9 100644
> --- a/doc/fuservicemount3.8
> +++ b/doc/fuservicemount3.8
> @@ -22,6 +22,7 @@ framework.
>  The FUSE server may ask fuservicemount3 to open files on its behalf.
>  fuservicemount3 opens only paths that appear verbatim on its command line
>  and refuses any other request with EPERM.
> +Requests after the server has sent the mount point are refused as well.
>  
>  The second form checks if there is a FUSE service available for the given
>  filesystem type.
> diff --git a/include/fuse_service.h b/include/fuse_service.h
> index 3954f62aa2b8..56f40a44b670 100644
> --- a/include/fuse_service.h
> +++ b/include/fuse_service.h
> @@ -139,7 +139,8 @@ int fuse_service_parse_cmdline_opts(struct fuse_args *args,
>  
>  /**
>   * Ask the mount.service helper to open a file on behalf of the fuse server.
> - * The helper refuses a path that is not verbatim on the mount command line;
> + * The helper refuses a path that is not verbatim on the mount command line,
> + * and any request made after the mount point was sent;
>   * fuse_service_receive_file() then reports -EPERM.
>   *
>   * @param sf service context
> diff --git a/util/mount_service.c b/util/mount_service.c
> index 835d3d94aa4a..1f25dcde0349 100644
> --- a/util/mount_service.c
> +++ b/util/mount_service.c
> @@ -801,6 +801,13 @@ static int mount_service_open_path(const struct mount_service *mo,
>  		return mount_service_send_file_error(mo, EINVAL, oc->path);
>  	}
>  
> +	/* After fchdir to the mountpoint, a relative path resolves there */
> +	if (mo->mountpoint) {
> +		fprintf(stderr, "%s: %s: files must be requested before the mount point\n",
> +			mo->msgtag, oc->path);
> +		return mount_service_send_file_error(mo, EPERM, oc->path);
> +	}
> +
>  	/*
>  	 * The file is opened outside the service sandbox, so only hand out
>  	 * what the user named.
> 
> -- 
> 2.53.0
> 
> 
> 
