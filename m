Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75F52AEE4
	for <fuse-devel@lists.linux.dev>; Sat,  9 May 2026 00:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778285862; cv=none; b=IlkAcS0ephuNLEJWaLbu+1wbMXJeP0K4MG/3QiuowRKVLy+QsnbXAgk1rvoX/XaL1MhppdPUaxb2Vx/HItLYRvXRGQjdglyvK9dfO3jEM535pjqhjdz2aJYOl6X+ddvByVaL5ECi0IhNfY2wHjA5NXbzJdeMOc4x2Wv01MRbS/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778285862; c=relaxed/simple;
	bh=JmAlLGP8uhr103fvgh8fSX4AeWIAjrF/3JAiH1AEjK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1LfvFiS6sTQC3HXvpgO+8J/muIVO1WD18pvG4Z5b7XWoKbpOQJN+9BLn9RpuY9QgYxdP8keVnN0UzoHCzNpqEK66cZAvrZxgbodwYF4oXaywS4syA/xwniX3MRtmiCXH/H9QPMHqUZiWRCJboKGKndXKh5xlKYVCEizwm/F708=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlszGYTN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlszGYTN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812B6C2BCB0;
	Sat,  9 May 2026 00:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778285861;
	bh=JmAlLGP8uhr103fvgh8fSX4AeWIAjrF/3JAiH1AEjK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YlszGYTN4mb8LqdzET+/VJCWuBMaacqmEqsvrAzzTdfjliNtts9jEH+29Ob5WLXRF
	 53Seyggkq96xUdv5WePoPBQU7dji/lFw7nMjEBKoEN+od/hxcjjUNxD0pNMeuPpTeW
	 5WEy5kQM4q+0l596kR13OWaDZmVERAst/2Os5SYU6X4E9hZUoUe0DkeIM39g/xsXxb
	 T2X2xyil5AIp/P7OV8SORlQFdt+9T1sTCyMKvajwN0KItqtS2zrKGiR+6kfcfpfq7T
	 B8vM3K9L2GfkGZE6XpLHmnq+BZ8rtEGSpDtdJBzLEXk+S8hx6Vzm+VbEb5uknpdCKa
	 8tbCI77Gf7tXw==
Date: Fri, 8 May 2026 17:17:40 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 04/10] New mount API: read-only option is for fsmount()
 and fsconfig()
Message-ID: <20260509001740.GJ2241589@frogsfrogsfrogs>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
 <20260508-new-mount-fixes-and-tests-v1-4-c67a0893ddbc@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-4-c67a0893ddbc@bsbernd.com>

On Fri, May 08, 2026 at 06:39:07PM +0200, Bernd Schubert via B4 Relay wrote:
> From: "Darrick J. Wong" <djwong@kernel.org>
> 
> The "ro" mount option needs to be handled by
> 
> fsmount(..., MOUNT_ATTR_RDONLY), for the superblock
> and fsconfig(SET_FLAG, "ro") for the vfsmount.

Yikes.  Now there's a subtlety!

> Update by Bernd: Instead of moving it to MOUNT_ATTR_RDONLY,
> handle it by both.
> 
> Fixes: 0d7e72541564 ("Unify mount flag structures and remove redundant is_mount_attr field")
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  lib/mount_fsmount.c | 21 ++++++++++++++++-----
>  lib/mount_util.c    | 44 +++++++++++++++++++++++++-------------------
>  lib/mount_util.h    |  3 ++-
>  3 files changed, 43 insertions(+), 25 deletions(-)
> 
> diff --git a/lib/mount_fsmount.c b/lib/mount_fsmount.c
> index 5e13b34c..edb9e043 100644
> --- a/lib/mount_fsmount.c
> +++ b/lib/mount_fsmount.c
> @@ -39,6 +39,7 @@
>   * Convert MS_* mount flags to MOUNT_ATTR_* mount attributes.
>   * These flags are passed to fsmount(), not fsconfig().
>   * Mount attributes control mount-point level behavior.
> + * To called after set_ms_flags() which consumes the fsconfig flags.
>   *
>   * @attrs MOUNT_ATTR flags, built from MS_ flags
>   * @return remaining flags
> @@ -108,8 +109,12 @@ static void log_fsconfig_kmsg(int fd)
>  
>  /*
>   * Apply VFS superblock (fsconfig) flags to the filesystem context.
> - * Only handles flags that are filesystem parameters (ro, sync, dirsync).
> - * Mount attributes (nosuid, nodev, etc.) are handled separately via fsmount().
> + * Handles the fsconfig leg of every entry whose is_fsconfig is set
> + * (ro, rw, sync, async, dirsync). Mount attributes (nosuid, nodev, etc.)
> + * are handled separately via fsmount().
> + *
> + * Entries that have *both* legs (ro/rw) leave the MS_ bit in *ms_flags
> + * so that ms_flags_to_mount_attrs() can also pick them up.
>   *
>   * @ms_flags flags to set, outvalue are the remaining flags
>   * @return 0 on success, negative error code on failure
> @@ -120,8 +125,7 @@ static int set_ms_flags(int fsfd, unsigned long *ms_flags)
>  	int i;
>  
>  	for (i = 0; mount_flags[i].opt != NULL && flags != 0; i++) {
> -		/* Only process fsconfig flags (mount_attr == 0) with on==1 */
> -		if (mount_flags[i].mount_attr || !mount_flags[i].on)
> +		if (!mount_flags[i].is_fsconfig || !mount_flags[i].on)
>  			continue;
>  
>  		if (!(flags & mount_flags[i].flag))
> @@ -137,7 +141,14 @@ static int set_ms_flags(int fsfd, unsigned long *ms_flags)
>  
>  			return -save_errno;
>  		}
> -		flags &= ~mount_flags[i].flag;
> +
> +		/*
> +		 * Only consume the bit if no fsmount mount-attr leg is
> +		 * also pending for this option. Otherwise leave it for
> +		 * ms_flags_to_mount_attrs() to apply via fsmount().
> +		 */
> +		if (!mount_flags[i].mount_attr)
> +			flags &= ~mount_flags[i].flag;
>  	}
>  
>  	*ms_flags = flags;
> diff --git a/lib/mount_util.c b/lib/mount_util.c
> index 1a0aec9b..f1e58d98 100644
> --- a/lib/mount_util.c
> +++ b/lib/mount_util.c
> @@ -108,26 +108,32 @@
>  #define MOUNT_ATTR_NOSYMFOLLOW	0
>  #endif
>  
> +/*
> + * is_fsconfig and mount_attr are independent: ro/rw need both legs
> + * (SB_RDONLY on the superblock via fsconfig SET_FLAG, plus
> + * MOUNT_ATTR_RDONLY on the vfsmount via fsmount). Everything else is
> + * exclusively one or the other.
> + */
>  const struct mount_flags mount_flags[] = {
> -/* opt            flag             on  safe  mount_attr */
> -{"rw",           MS_RDONLY,        0,  1,    0},                      /* fsconfig */
> -{"ro",           MS_RDONLY,        1,  1,    0},                      /* fsconfig */
> -{"suid",         MS_NOSUID,        0,  0,    MOUNT_ATTR_NOSUID},     /* fsmount  */
> -{"nosuid",       MS_NOSUID,        1,  1,    MOUNT_ATTR_NOSUID},     /* fsmount  */
> -{"dev",          MS_NODEV,         0,  1,    MOUNT_ATTR_NODEV},      /* fsmount  */
> -{"nodev",        MS_NODEV,         1,  1,    MOUNT_ATTR_NODEV},      /* fsmount  */
> -{"exec",         MS_NOEXEC,        0,  1,    MOUNT_ATTR_NOEXEC},     /* fsmount  */
> -{"noexec",       MS_NOEXEC,        1,  1,    MOUNT_ATTR_NOEXEC},     /* fsmount  */
> -{"async",        MS_SYNCHRONOUS,   0,  1,    0},                      /* fsconfig */
> -{"sync",         MS_SYNCHRONOUS,   1,  1,    0},                      /* fsconfig */
> -{"noatime",      MS_NOATIME,       1,  1,    MOUNT_ATTR_NOATIME},    /* fsmount  */
> -{"nodiratime",   MS_NODIRATIME,    1,  1,    MOUNT_ATTR_NODIRATIME}, /* fsmount  */
> -{"norelatime",   MS_RELATIME,      0,  1,    MOUNT_ATTR_RELATIME},   /* fsmount  */
> -{"nostrictatime", MS_STRICTATIME,  0,  1,    MOUNT_ATTR_STRICTATIME},/* fsmount  */
> -{"symfollow",    MS_NOSYMFOLLOW,   0,  1,    MOUNT_ATTR_NOSYMFOLLOW},/* fsmount  */
> -{"nosymfollow",  MS_NOSYMFOLLOW,   1,  1,    MOUNT_ATTR_NOSYMFOLLOW},/* fsmount  */
> -{"dirsync",      MS_DIRSYNC,       1,  1,    0},                      /* fsconfig */
> -{NULL,           0,                0,  0,    0}
> +/* opt            flag             on  safe  fsconfig  mount_attr */
> +{"rw",           MS_RDONLY,        0,  1,    1,        MOUNT_ATTR_RDONLY},

I almost wonder if this should get reflowed as:

const struct mount_flags mount_flags[] = {
	{
		.opt		= "rw",
		.flag		= MS_RDONLY,
		.on		= 0,
		.safe		= 1,
		.fsconfig	= 1,
		.mount_attr	= MOUNT_ATTR_RDONLY,
	},
	...
};

But that can be left for a future patch.  This patch, as presented,
looks correct to me.

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

Also: Apparently util-linux trims "ro=vfs" and "ro=fs" down to just "ro"
when it invokes a mount helper:

# strace -s99 -f -e execve mount -o ro=vfs -t fuse.doesnotexist whatever /mnt
execve("/usr/bin/mount", ["mount", "-o", "ro=vfs", "-t", "fuse.doesnotexist", "whatever", "/mnt"], 0x7ffdfd517200 /* 28 vars */) = 0
strace: Process 20601 attached
[pid 20601] execve("/sbin/mount.fuse", ["/sbin/mount.fuse", "whatever", "/mnt", "-o", "ro", "-t", "fuse.doesnotexist"], 0x7ffdb1764278 /* 24 vars */) = 0
[pid 20601] execve("/bin/sh", ["/bin/sh", "-c", "'doesnotexist' 'whatever' '/mnt' '-o' 'ro,dev,suid'"], 0x55becc2a22e0 /* 25 vars */) = 0

So I guess we're off the hook for handling that weirdness.

--D


> +{"ro",           MS_RDONLY,        1,  1,    1,        MOUNT_ATTR_RDONLY},
> +{"suid",         MS_NOSUID,        0,  0,    0,        MOUNT_ATTR_NOSUID},
> +{"nosuid",       MS_NOSUID,        1,  1,    0,        MOUNT_ATTR_NOSUID},
> +{"dev",          MS_NODEV,         0,  1,    0,        MOUNT_ATTR_NODEV},
> +{"nodev",        MS_NODEV,         1,  1,    0,        MOUNT_ATTR_NODEV},
> +{"exec",         MS_NOEXEC,        0,  1,    0,        MOUNT_ATTR_NOEXEC},
> +{"noexec",       MS_NOEXEC,        1,  1,    0,        MOUNT_ATTR_NOEXEC},
> +{"async",        MS_SYNCHRONOUS,   0,  1,    1,        0},
> +{"sync",         MS_SYNCHRONOUS,   1,  1,    1,        0},
> +{"noatime",      MS_NOATIME,       1,  1,    0,        MOUNT_ATTR_NOATIME},
> +{"nodiratime",   MS_NODIRATIME,    1,  1,    0,        MOUNT_ATTR_NODIRATIME},
> +{"norelatime",   MS_RELATIME,      0,  1,    0,        MOUNT_ATTR_RELATIME},
> +{"nostrictatime", MS_STRICTATIME,  0,  1,    0,        MOUNT_ATTR_STRICTATIME},
> +{"symfollow",    MS_NOSYMFOLLOW,   0,  1,    0,        MOUNT_ATTR_NOSYMFOLLOW},
> +{"nosymfollow",  MS_NOSYMFOLLOW,   1,  1,    0,        MOUNT_ATTR_NOSYMFOLLOW},
> +{"dirsync",      MS_DIRSYNC,       1,  1,    1,        0},
> +{NULL,           0,                0,  0,    0,        0}
>  };
>  
>  #ifdef IGNORE_MTAB
> diff --git a/lib/mount_util.h b/lib/mount_util.h
> index 7ddd6b01..bf088996 100644
> --- a/lib/mount_util.h
> +++ b/lib/mount_util.h
> @@ -18,7 +18,8 @@ struct mount_flags {
>  	unsigned long flag;
>  	int on;
>  	int safe; /* used by fusermount */
> -	unsigned long mount_attr; /* MOUNT_ATTR_* value for fsmount (0 = fsconfig flag) */
> +	int is_fsconfig; /* apply via fsconfig SET_FLAG (superblock-level) */
> +	unsigned long mount_attr; /* MOUNT_ATTR_* for fsmount (0 = none) */
>  };
>  extern const struct mount_flags mount_flags[];
>  
> 
> -- 
> 2.53.0
> 
> 
