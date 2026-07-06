Received: from smtp06-ext.udag.de (smtp06-ext.udag.de [62.146.106.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990053FFF85
	for <fuse-devel@lists.linux.dev>; Mon,  6 Jul 2026 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327624; cv=none; b=FGYIX8Qm47GdcWidGxyGFsCCOIhYCjqdS6i15gYvnP2lT9y/IcD4/sv+DiCMfu+v4ELDgavBoctrL9NOFiNahaxbUPYEBg7DlwUkjsmFyv0fxLYR/yKdg8kv8q0qsWTzJlH4ICpMne26p65wxb3giW0Mdupn7hWd0VUiYQbizFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327624; c=relaxed/simple;
	bh=N0ipES8qU50qXeGFg4WHel6oSqeHKOLaMvmBbItJzU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taDQxut6R+JJyRIApkhi1gPfQeTGmXoMgk3T1BYqKpNuKxar6JhbLHf0rThzKyukQdy4zaox/Q24G/+6SYvzalSN7YH+MAH4PF8LA2ehRGalOkacrmoomPAmnnCsh3MIznpROm67OKj+5ZGW8vpF33AjGmSu1UknGedbkrucd94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (084-133-067-156.ip-addr.inexio.net [156.67.133.84])
	by smtp06-ext.udag.de (Postfix) with ESMTPA id CA895E0139;
	Mon,  6 Jul 2026 10:38:54 +0200 (CEST)
Authentication-Results: smtp06-ext.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Mon, 6 Jul 2026 10:38:53 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Jingbo Xu <jefflexu@linux.alibaba.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fuse: don't bump attr_version for async direct read
 completion
Message-ID: <aktpOW1LWNkn-jlE@fedora.fritz.box>
References: <20260706082931.99288-1-jefflexu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706082931.99288-1-jefflexu@linux.alibaba.com>

On Mon, Jul 06, 2026 at 04:29:31PM +0800, Jingbo Xu wrote:
> The attr_version counter should only be incremented when cached
> attributes are actually modified (as documented in commit 1fb69e781729
> ("fuse: fix race between getattr and write")).  Async direct reads do not
> modify any cached inode attributes (size, mtime, ctime), so bumping
> attr_version in fuse_aio_complete() for reads is incorrect.
> 
> This unconditional bump causes a livelock when auto_inval_data is
> enabled together with writeback_cache: fuse_cache_read_iter() issues a
> FUSE_GETATTR before every read, but by the time the response arrives,
> an async DIO read completion has already incremented fi->attr_version
> past the snapshot taken before the request.  The GETATTR result is then
> discarded (attr_version race), fi->i_time is never refreshed, and every
> subsequent read triggers yet another GETATTR -- creating an infinite
> loop of useless round-trips.
> 
> Fix this by only bumping attr_version for write completions, consistent
> with the synchronous DIO write path (fuse_write_update_attr) and the
> cached write path.
> 
> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/fuse/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index ceada75310b8..c41287e8bc15 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -688,7 +688,7 @@ static void fuse_aio_complete(struct fuse_io_priv *io, int err, ssize_t pos)
>  		struct address_space *mapping = io->iocb->ki_filp->f_mapping;
>  		ssize_t res = fuse_get_res_by_io(io);
>  
> -		if (res >= 0) {
> +		if (res >= 0 && io->write) {
>  			struct fuse_conn *fc = get_fuse_conn(inode);
>  			struct fuse_inode *fi = get_fuse_inode(inode);
>  
> -- 
> 2.19.1.6.gb485710b
> 
> 
LGTM

Reviewed-by: Horst Birthelmer <hbirthelmer@ddn.com>
