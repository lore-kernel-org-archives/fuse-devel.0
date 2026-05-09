Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3326512CD8B
	for <fuse-devel@lists.linux.dev>; Sat,  9 May 2026 00:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286463; cv=none; b=fGBDsJFrvsALtMFgbqIFQhFLDT5wzq9CWU5Mpu/IF08OBrhVuMkqgfLN4ksWSc0AkXouV5PpLnG03/iewFIigVTzzl3C1WJvpnMsseK1Wp9d+2i+ow0Uy60cqf20ezoJdiTISgZUsP5t6HB/hb3J2UQcktfBAifaRfcs27czNxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286463; c=relaxed/simple;
	bh=eBBtv5Lrq3peQdSkkx9kX582FHX0RjbVA4lz768z67Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlVcOCi3D/K/sO9Jq6hiMHcrcoZIRSHE1KxB+/T7UVFUXVcfIYJvzwra42GA84VPFupOGFRYo7Aw3G/tL1A5HhzXHu3Ln+WWsqFIzl3Z2NBsME4NXzpEqnCexBsz1olbuNvC4Dqpfns9HWnpkggmd9yol3NL7KiSKrn/flCwhs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4lo1oZk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4lo1oZk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA546C2BCB0;
	Sat,  9 May 2026 00:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778286462;
	bh=eBBtv5Lrq3peQdSkkx9kX582FHX0RjbVA4lz768z67Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4lo1oZkdT54g+VUuU/RaBUMV5Gs3BYXbSOUayaUPq+bqWJT/0VCV5Cx4nt2WlzZv
	 T8mnSO6YFAkBBTmcFaqvM1GgpwSVhhS8ESy1v+oJKBrUYyMVkB2VLIXevOX8cVqgyI
	 X+pKAAtyfCG5OJ/png/V65LF/DhDWMfOHiyUM+tUP3dsyAbRhoc2CXnFqTyIECUHEu
	 m+Jg8pWuZb97Ke7SUIXN22MniWpPeBSB7KgQmn1EMj89JoPpV+yoV33Z+cc5d0ykBd
	 SJrLFgaBSvKkLOXmf/Qua/KswebDH+BDE7iiOPUGU7b5hDhdj4RwTMArsbyTiUgs1o
	 4/AgToLke0LYw==
Date: Fri, 8 May 2026 17:27:42 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 07/10] mount: clarify kernel_opts vs mnt_opts vs flags in
 fuse_kern_fsmount
Message-ID: <20260509002742.GL2241589@frogsfrogsfrogs>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
 <20260508-new-mount-fixes-and-tests-v1-7-c67a0893ddbc@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-7-c67a0893ddbc@bsbernd.com>

On Fri, May 08, 2026 at 06:39:10PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> Just code/API updates, as these mount options can be rather confusing.
> 
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  lib/mount_i_linux.h | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/mount_i_linux.h b/lib/mount_i_linux.h
> index ab83e30b..112c365e 100644
> --- a/lib/mount_i_linux.h
> +++ b/lib/mount_i_linux.h
> @@ -36,13 +36,20 @@ int fuse_kern_mount_get_base_mnt_opts(const struct mount_opts *mo, char **mnt_op
>  /**
>   * Mount using the new Linux mount API (fsopen/fsconfig/fsmount/move_mount)
>   * @mnt: mountpoint
> - * @flags: mount flags (MS_NOSUID, MS_NODEV, etc.)
> + * @flags: MS_* bits (ro/rw, nosuid, nodev, sync, dirsync, ...) -
> + *         translated by set_ms_flags() into fsconfig(SET_FLAG) and/or
> + *         fsmount(MOUNT_ATTR_*); never carried via the strings below.

I wonder if this parameter ought to be renamed ms_flags?

>   * @blkdev: 1 for fuseblk, 0 for fuse
>   * @fsname: filesystem name (or NULL)
>   * @subtype: filesystem subtype (or NULL)
>   * @source_dev: device name for building source string
> - * @kernel_opts: kernel mount options string
> - * @mnt_opts: additional mount options to pass to the kernel
> + * @kernel_opts: FUSE-kernel options parsed from -o args
> + *               (e.g. "allow_other,max_read=65536,default_permissions")
> + * @mnt_opts:    extras the caller layers on
> + *               (e.g. "fd=7,rootmode=40000,user_id=1000,group_id=1000")

Oh, the "caller" here is libfuse.  Could that be clarified a bit?

      @mnt_opts:    internal mount options added by libfuse
                    (e.g. "fd=7,rootmode=40000,user_id=1000,group_id=1000")

--D

> + *
> + * @kernel_opts and @mnt_opts are both applied via fsconfig() in order;
> + * overlap is tolerated.
>   *
>   * Returns: 0 on success, -1 on failure with errno set
>   */
> 
> -- 
> 2.53.0
> 
> 
