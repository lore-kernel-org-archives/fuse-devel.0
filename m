Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F752D9EDC
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 21:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776805889; cv=none; b=rVnHFI6CZ7zcOMFEJEhR3R9qKMMW/n3hCWWVbi+9OZ5jhmUltpIRyzw8Mys9OeDgs2ZQrWJBSTqeVZkpdFEF7g5fcyYzRw9J7Vba1HZmSPNHBD3SnAYopuSMcn3pmRxIM4+eYpiAUG3HxYbfAlN7QBeXbGcqo1L2tS/L+6b123Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776805889; c=relaxed/simple;
	bh=ADQH6qyz9UKqLt0IO346WKYKl1MKPpRHYJpGNkwDfOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEyNQft9NDqbzG81N6fugm6TdZMsa/WxzwkqjKfzdZHTIiNJHpcAhhkqeFvbr4IxF4yG/7vCjILCqdV7oXE/CHeoglvzdT/rq478l/TXx4xXtkUomZwT5XsKy1T8LXEqx89QFcIxhY7G/zAdc0ep6db3ZBgQdqnmL8up6UJzZY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYHFTevh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYHFTevh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28480C2BCB0;
	Tue, 21 Apr 2026 21:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776805889;
	bh=ADQH6qyz9UKqLt0IO346WKYKl1MKPpRHYJpGNkwDfOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYHFTevhwRz2IeqASgyMjee/GpyNjElg3G/YLtCjCbihZ78G0HWuYAQEte+Qt619b
	 tGUF7vJgo5R85scuWLafJfXfXpcsMC3TY1OxxeHb2iicwuhjfCAmi71w5n2nwEwb81
	 JDtjdPa3tqokk5F+qiGjo4dt1XAs9UOVCPPDcLgy+TihmRGvMS7olAlz69s34cnbn5
	 B4zcgfSLtbyIddFNWFHOHGNNUYIOYn7ng87t6XYXca8wuIgOw0czpajdasM35DRvfG
	 /m1eS1Ks2Y7y34PjM0Rsdc1vDt6cB8X9VLhzJ/pyDu2Vrz8FtHlUweXw1JPfdGBPmK
	 j1+R5cQ8tMD7w==
Date: Tue, 21 Apr 2026 14:11:27 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, amir73il@gmail.com, fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: Re: [PATCH v1 01/17] fuse: introduce FUSE_PASSTHROUGH_INO mode
Message-ID: <20260421211127.GA7739@frogsfrogsfrogs>
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-2-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420221637.2631478-2-joannelkoong@gmail.com>

On Mon, Apr 20, 2026 at 03:16:21PM -0700, Joanne Koong wrote:
> From: Amir Goldstein <amir73il@gmail.com>
> 
> This is a more strict variant of FUSE_PASSTHROUGH mode, in which the
> backing file inode number must match the fuse inode number.
> 
> This mode will allow the kernel to instantiate fuse inodes by
> passthrough lookup and passthrough readdirplus and notify about those
> inodes to the server, using the backing file inode number as a unique
> identifier for fuse inodes across kernel and server.
> 
> This mode limits the possibility to map multiple fuse inodes to the same
> backing file, unless they are all hardlinks.
> 
> This mode is only supported on 64bit arch, where ino_t is u64.
> 
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  fs/fuse/file.c            |  3 +--
>  fs/fuse/fuse_i.h          |  6 ++++--
>  fs/fuse/inode.c           |  8 +++++++-
>  fs/fuse/iomode.c          | 13 ++++++++++---
>  include/uapi/linux/fuse.h |  6 +++++-
>  5 files changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 7294bd347412..f239c8a888cb 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -1431,7 +1431,6 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
>  			  bool *exclusive)
>  {
>  	struct inode *inode = file_inode(iocb->ki_filp);
> -	struct fuse_inode *fi = get_fuse_inode(inode);
>  
>  	*exclusive = fuse_dio_wr_exclusive_lock(iocb, from);
>  	if (*exclusive) {
> @@ -1446,7 +1445,7 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
>  		 * have raced, so check it again.
>  		 */
>  		if (fuse_io_past_eof(iocb, from) ||
> -		    fuse_inode_uncached_io_start(fi, NULL) != 0) {
> +		    fuse_inode_uncached_io_start(inode, NULL) != 0) {
>  			inode_unlock_shared(inode);
>  			inode_lock(inode);
>  			*exclusive = true;
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 23a241f18623..86fdf873d639 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -913,6 +913,9 @@ struct fuse_conn {
>  	/** Passthrough support for read/write IO */
>  	unsigned int passthrough:1;
>  
> +	/** One-to-one mapping between fuse ino to backing ino */
> +	unsigned int passthrough_ino:1;
> +
>  	/* Use pages instead of pointer for kernel I/O */
>  	unsigned int use_pages_for_kvec_io:1;
>  
> @@ -1535,8 +1538,7 @@ int fuse_fileattr_set(struct mnt_idmap *idmap,
>  
>  /* iomode.c */
>  int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff);
> -int fuse_inode_uncached_io_start(struct fuse_inode *fi,
> -				 struct fuse_backing *fb);
> +int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb);
>  void fuse_inode_uncached_io_end(struct fuse_inode *fi);
>  
>  int fuse_file_io_open(struct file *file, struct inode *inode);
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index 8b64034ab0bb..014b9af42909 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1445,6 +1445,8 @@ static void process_init_reply(struct fuse_mount *fm, struct fuse_args *args,
>  				fc->passthrough = 1;
>  				fc->max_stack_depth = arg->max_stack_depth;
>  				fm->sb->s_stack_depth = arg->max_stack_depth;
> +				if (flags & FUSE_PASSTHROUGH_INO)
> +					fc->passthrough_ino = 1;
>  			}
>  			if (flags & FUSE_NO_EXPORT_SUPPORT)
>  				fm->sb->s_export_op = &fuse_export_fid_operations;
> @@ -1518,8 +1520,12 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
>  #endif
>  	if (fm->fc->auto_submounts)
>  		flags |= FUSE_SUBMOUNTS;
> -	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
> +	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH)) {
>  		flags |= FUSE_PASSTHROUGH;
> +		/* one-to-one ino mapping requires 64bit ino */
> +		if (sizeof(ino_t) == sizeof(u64))

Now that struct inode::i_ino is u64 and not ino_t, does this check need
adjusting?  I think it's the case that the inode hash will work fine
with a 64-bit inumber.a  The fuse uapi defines ino and nodeid fields to
be uint64_t, so I think it should work even on a 32-bit kernel.

That said, ino_t remains kernel_ulong_t in 7.1, so this still won't be
enabled for 32-bit.  OTOH maybe none of us care. ;)

--D

> +			flags |= FUSE_PASSTHROUGH_INO;
> +	}
>  
>  	/*
>  	 * This is just an information flag for fuse server. No need to check
> diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
> index 3728933188f3..ca3b28597722 100644
> --- a/fs/fuse/iomode.c
> +++ b/fs/fuse/iomode.c
> @@ -82,8 +82,10 @@ static void fuse_file_cached_io_release(struct fuse_file *ff,
>  }
>  
>  /* Start strictly uncached io mode where cache access is not allowed */
> -int fuse_inode_uncached_io_start(struct fuse_inode *fi, struct fuse_backing *fb)
> +int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb)
>  {
> +	struct fuse_inode *fi = get_fuse_inode(inode);
> +	struct fuse_conn *fc = get_fuse_conn(inode);
>  	struct fuse_backing *oldfb;
>  	int err = 0;
>  
> @@ -94,6 +96,12 @@ int fuse_inode_uncached_io_start(struct fuse_inode *fi, struct fuse_backing *fb)
>  		err = -EBUSY;
>  		goto unlock;
>  	}
> +	/* With FUSE_PASSTHROUGH_INO, fuse and backing ino must match */
> +	if (fb && fc->passthrough_ino &&
> +	    fb->file->f_inode->i_ino != inode->i_ino) {
> +		err = -EIO;
> +		goto unlock;
> +	}
>  	if (fi->iocachectr > 0) {
>  		err = -ETXTBSY;
>  		goto unlock;
> @@ -117,10 +125,9 @@ static int fuse_file_uncached_io_open(struct inode *inode,
>  				      struct fuse_file *ff,
>  				      struct fuse_backing *fb)
>  {
> -	struct fuse_inode *fi = get_fuse_inode(inode);
>  	int err;
>  
> -	err = fuse_inode_uncached_io_start(fi, fb);
> +	err = fuse_inode_uncached_io_start(inode, fb);
>  	if (err)
>  		return err;
>  
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index c13e1f9a2f12..4be9ccc5b3ff 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -240,6 +240,9 @@
>   *  - add FUSE_COPY_FILE_RANGE_64
>   *  - add struct fuse_copy_file_range_out
>   *  - add FUSE_NOTIFY_PRUNE
> + *
> + *  7.46
> + *  - add FUSE_PASSTHROUGH_INO
>   */
>  
>  #ifndef _LINUX_FUSE_H
> @@ -275,7 +278,7 @@
>  #define FUSE_KERNEL_VERSION 7
>  
>  /** Minor version number of this interface */
> -#define FUSE_KERNEL_MINOR_VERSION 45
> +#define FUSE_KERNEL_MINOR_VERSION 46
>  
>  /** The node ID of the root inode */
>  #define FUSE_ROOT_ID 1
> @@ -495,6 +498,7 @@ struct fuse_file_lock {
>  #define FUSE_ALLOW_IDMAP	(1ULL << 40)
>  #define FUSE_OVER_IO_URING	(1ULL << 41)
>  #define FUSE_REQUEST_TIMEOUT	(1ULL << 42)
> +#define FUSE_PASSTHROUGH_INO	(1ULL << 43)
>  
>  /**
>   * CUSE INIT request/reply flags
> -- 
> 2.52.0
> 
> 
