Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B01E4E3245
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781424; cv=none; b=VTjyPhGKJEbvFotY6+YTjBjxpURN/1unoYsoYBqUzyH2QNTVrOXPd8vfNz58wJu0eSfwArSiDiKLcEIR7v+A2ROnIEd2FJfUTzn9ALP4IL+o6PE618id/X+P5nBb+/nAzT9ya4KYWdrlAx/L9ZHMVteISkz8+eSctke+Zj/9yro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781424; c=relaxed/simple;
	bh=5Zh63nRQsYuVa8nmALPkKoQLmfqo2zhPsXstuvG33Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UT5PlX+8liFccRFxq/rIHvkid9G5B4k9JdNsrgVStkOtqYQKXQNdBTSkpCHJ9ZL4z4cPFFvQdgC/t5NQUgQx0itJyPpNDcO+GQREi5/YFaYowmldvLnH2pphYYDZmiTwv13BJ27sl4gFZ5QKtsvDXYfkv9OHldyO4mrX2IS9WdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6tMtOMd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6tMtOMd"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 100DB1F00893;
	Wed, 30 Sep 2026 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790781415;
	bh=WBdxlJqLRetcvZDTBbGyTtxPDzHf//xPxmjPpHLltcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E6tMtOMdC7WptKI4A0z2AyH+gPdlUzRuEIu4pPuCgBb6J9Zeqb6NdpyNn4GE7FmoI
	 kRfexS4eREnau+e7/a74VRxBt7WlKwvpCm/ZgMseDHPOCclFo2gfxZ6kr3XfQiVNvK
	 5RnI1AtAqvkZZ5d8MDfs5xN1+pJIujteSpY869MQQvey3ZQeBUFzaryZPEk/mYss3S
	 8NQcjy4yx8TBiCaKHHDkXL2fZhm3ksJPTRR//CL+luSFuX6hcobz9MBefBn+CO4aQN
	 nYEakPII92txTcA819nljmsa8t/5xxnsPDExkMrKdztD+K1fGcLdzZ2+DD88YVbQGX
	 jd+W0DaIB0sAw==
Date: Wed, 30 Sep 2026 08:16:54 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: neal@gompa.dev, fuse-devel@lists.linux.dev
Subject: Re: [PATCH 2/4] mount_service: mount via the shared fsmount helper
Message-ID: <20260930151654.GO6253@frogsfrogsfrogs>
References: <20260930-mount-service-use-mount-fsmount-v1-0-d585598896ee@bsbernd.com>
 <20260930-mount-service-use-mount-fsmount-v1-2-d585598896ee@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-mount-service-use-mount-fsmount-v1-2-d585598896ee@bsbernd.com>

On Wed, Sep 30, 2026 at 03:44:34PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> util/mount_service.c issued FSCONFIG_CMD_CREATE, fsmount() and
> move_mount() itself, with the same FSMOUNT_CLOEXEC and
> MOVE_MOUNT_*_EMPTY_PATH flags as lib/mount_fsmount.c. Both mount the
> same filesystem, so a flag changed in one copy silently diverges.
> 
> mount_service.c also called the libc names fsconfig(), fsmount() and
> move_mount() directly. HAVE_NEW_MOUNT_API only checks that the headers
> declare these functions, not that libc exports them. On a system where
> NEED_NEW_MOUNT_API_SYSCALL_WRAPPERS is also set (glibc older than
> 2.36), lib/mount_fsmount.c works around the missing symbols through
> its fuse_-prefixed static inline wrappers, which mount_service.c had
> no access to; calling the bare libc names left it with a declaration
> to compile against but no symbol to link against.
> 
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  util/mount_service.c | 49 ++++++++++++-------------------------------------
>  1 file changed, 12 insertions(+), 37 deletions(-)
> 
> diff --git a/util/mount_service.c b/util/mount_service.c
> index 0b3266309a8a..dcdc26df1db4 100644
> --- a/util/mount_service.c
> +++ b/util/mount_service.c
> @@ -28,11 +28,6 @@
>  #include <sys/ioctl.h>
>  #include <linux/fs.h>
>  
> -#ifdef HAVE_NEW_MOUNT_API
> -#include <sys/mount.h>
> -#include <linux/mount.h>
> -#endif
> -
>  #include "mount_util.h"
>  #include "util.h"
>  #include "fuse_i.h"
> @@ -1439,63 +1434,45 @@ static int mount_service_fsopen_mount(struct mount_service *mo,
>  			return FUSE_MOUNT_FALLBACK_NEEDED;
>  
>  		error = -ret;
> -		goto fail_fsconfig;
> +		goto fail_mount;
>  	}
>  
>  	snprintf(tmp, sizeof(tmp), "%i", mo->fusedevfd);
>  	ret = apply_fsconfig_opt_fd(mo->fsopenfd, tmp);
>  	if (ret < 0) {
>  		error = -ret;
> -		goto fail_fsconfig;
> +		goto fail_mount;
>  	}
>  
>  	snprintf(tmp, sizeof(tmp), "%o", stbuf->st_mode & S_IFMT);
>  	ret = apply_fsconfig_opt_string(mo->fsopenfd, "rootmode", tmp);
>  	if (ret < 0) {
>  		error = -ret;
> -		goto fail_fsconfig;
> +		goto fail_mount;
>  	}
>  
>  	snprintf(tmp, sizeof(tmp), "%u", getuid());
>  	ret = apply_fsconfig_opt_string(mo->fsopenfd, "user_id", tmp);
>  	if (ret < 0) {
>  		error = -ret;
> -		goto fail_fsconfig;
> +		goto fail_mount;
>  	}
>  
>  	snprintf(tmp, sizeof(tmp), "%u", getgid());
>  	ret = apply_fsconfig_opt_string(mo->fsopenfd, "group_id", tmp);
>  	if (ret < 0) {
>  		error = -ret;
> -		goto fail_fsconfig;
> -	}
> -
> -	ret = fsconfig(mo->fsopenfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0);
> -	if (ret) {
> -		error = errno;
> -		fprintf(stderr, "%s: creating filesystem: %s\n",
> -			mo->msgtag, strerror(error));
> -		goto fail_fsconfig;
> -	}
> -
> -	mfd = fsmount(mo->fsopenfd, FSMOUNT_CLOEXEC, attr_flags);
> -	if (mfd < 0) {
> -		error = errno;
> -		fprintf(stderr, "%s: fsmount: %s\n",
> -			mo->msgtag, strerror(error));
> -		goto fail_fsconfig;
> -	}
> -
> -	ret = move_mount(mfd, "", mo->mountfd, "",
> -			 MOVE_MOUNT_F_EMPTY_PATH | MOVE_MOUNT_T_EMPTY_PATH);
> -	close(mfd);
> -	if (ret) {
> -		error = errno;
> -		fprintf(stderr, "%s: move_mount: %s\n",
> -			mo->msgtag, strerror(error));
>  		goto fail_mount;
>  	}
>  
> +	ret = fuse_fsmount_create_and_move(mo->fsopenfd, attr_flags,
> +					   mo->mountfd, NULL, &mfd);
> +	if (ret < 0) {
> +		error = -ret;
> +		goto fail_mount;
> +	}
> +	close(mfd);

Slick :)
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> +
>  	/*
>  	 * The mount succeeded, so we send a positive reply even if the mtab
>  	 * update fails.
> @@ -1515,8 +1492,6 @@ static int mount_service_fsopen_mount(struct mount_service *mo,
>  	mo->mounted = true;
>  	return mount_service_send_reply(mo, 0);
>  
> -fail_fsconfig:
> -	log_fsconfig_kmsg(mo->fsopenfd);
>  fail_mount:
>  	return mount_service_send_reply(mo, error);
>  }
> 
> -- 
> 2.53.0
> 
> 
> 
