Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1262337F8A1
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 21:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776806253; cv=none; b=Kc5AZE9MxHuDoOSrTKB2gd2BjlA6Q+B8bXPTeLpZMRJGl8HMm8NeAxQY2DG3gHbTLm9sQxf53KIq1F7D/F0RnNw/flVFHlolAY+zEHcXNFw/GJxNKLS2gR3t3HMBhWkiZGisj3uJCcY6eBw1ETUlxv1C5rqKBJt33Qhx4jugNCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776806253; c=relaxed/simple;
	bh=f3WrJfU2caCbExl7M30cz5UJKhU3Mcv4bzr7jlDg37E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6dxrQoXr5wRXXQSW/BvixS0NS5gjkfJlWCuoSabF8wz/pTWAUoXIDx5bjAUfVVx2cvjlKWugVbyDL5ehjMuukQpmD00GyMzLSqan6hnDbzfwaLPUpmTnd90PpyvjcvHdIAJYre1sYVRKtIfFtPX7MsIl861Y9V+hdYh4lS24cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rujFiRXN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rujFiRXN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99188C2BCB0;
	Tue, 21 Apr 2026 21:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776806252;
	bh=f3WrJfU2caCbExl7M30cz5UJKhU3Mcv4bzr7jlDg37E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rujFiRXN8DW0ELYAxg0pdx449v774XA28YhPZkZIzMb19dL8bZQT1epiGFcWsr6Fl
	 dKTXm9Pd/G16M7fUTK+dMsIIhwDqCf71FKs+3MuF+oWUoBBqqch7w1SMC2zLCYt5gP
	 ZZqHnStVtckdt9Bu/V/bA5F2mtpPDXY10JquKqYAmV837UddDkBFaXK2ShKho7UnZ+
	 kb4SWdVopU00YyK8QOIXle0gVyOp6vV36jiEUcNlB3vyAxZfZ2kYbV3sdvUxsqbLmi
	 Dxsl8BEqNnDu19hVTNUYZsIaexFY4RDLn+jH2Vgn/0HWWitFUl6SB8OnuWcz/T9u7v
	 8MlC0k8i3nt1Q==
Date: Tue, 21 Apr 2026 14:17:32 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, amir73il@gmail.com, fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: Re: [PATCH v1 03/17] fuse: prepare for readdir passthrough on
 directories
Message-ID: <20260421211732.GC7739@frogsfrogsfrogs>
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-4-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420221637.2631478-4-joannelkoong@gmail.com>

On Mon, Apr 20, 2026 at 03:16:23PM -0700, Joanne Koong wrote:
> From: Amir Goldstein <amir73il@gmail.com>
> 
> In preparation for readdir passthrough, allow the inode iomode state
> to be applicable to directory inodes and prepare the helper
> fuse_sync_release() for directories.
> 
> Directory inodes will support cached mode, "direct" uncached readdir
> mode and readdir passthrough mode, but will not need to wait for
> parallel dio like regular files.
> 
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  fs/fuse/cuse.c   |  2 +-
>  fs/fuse/dir.c    |  4 ++--
>  fs/fuse/file.c   | 11 ++++++-----
>  fs/fuse/fuse_i.h | 12 ++++++------
>  fs/fuse/inode.c  |  2 +-
>  fs/fuse/iomode.c | 31 ++++++++++++++++++-------------
>  6 files changed, 34 insertions(+), 28 deletions(-)
> 
> diff --git a/fs/fuse/cuse.c b/fs/fuse/cuse.c
> index dfcb98a654d8..e168740351a0 100644
> --- a/fs/fuse/cuse.c
> +++ b/fs/fuse/cuse.c
> @@ -147,7 +147,7 @@ static int cuse_release(struct inode *inode, struct file *file)
>  	struct fuse_file *ff = file->private_data;
>  	struct fuse_mount *fm = ff->fm;
>  
> -	fuse_sync_release(NULL, ff, file->f_flags);
> +	fuse_sync_release(NULL, ff, file->f_flags, false);
>  	fuse_conn_put(fm->fc);
>  
>  	return 0;
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index b658b6baf72f..015f0c103d06 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -893,7 +893,7 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
>  			  &outentry.attr, ATTR_TIMEOUT(&outentry), 0, 0);
>  	if (!inode) {
>  		flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
> -		fuse_sync_release(NULL, ff, flags);
> +		fuse_sync_release(NULL, ff, flags, false);
>  		fuse_queue_forget(fm->fc, forget, outentry.nodeid, 1);
>  		err = -ENOMEM;
>  		goto out_err;
> @@ -910,7 +910,7 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
>  	}
>  	if (err) {
>  		fi = get_fuse_inode(inode);
> -		fuse_sync_release(fi, ff, flags);
> +		fuse_sync_release(fi, ff, flags, false);
>  	} else {
>  		if (fm->fc->atomic_o_trunc && trunc)
>  			truncate_pagecache(inode, 0);
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index f239c8a888cb..3da4ce73e11b 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -285,7 +285,7 @@ static int fuse_open(struct inode *inode, struct file *file)
>  		ff = file->private_data;
>  		err = fuse_finish_open(inode, file);
>  		if (err)
> -			fuse_sync_release(fi, ff, file->f_flags);
> +			fuse_sync_release(fi, ff, file->f_flags, false);
>  		else if (is_truncate)
>  			fuse_truncate_update_attr(inode, file);
>  	}
> @@ -408,10 +408,12 @@ static int fuse_release(struct inode *inode, struct file *file)
>  }
>  
>  void fuse_sync_release(struct fuse_inode *fi, struct fuse_file *ff,
> -		       unsigned int flags)
> +		       unsigned int flags, bool isdir)
>  {
> +	int opcode = isdir ? FUSE_RELEASEDIR : FUSE_RELEASE;

Can't you figure this out from S_ISDIR(fi->inode.i_mode), and thereby
obviate the need for the extra parameter?

--D

> +
>  	WARN_ON(refcount_read(&ff->count) > 1);
> -	fuse_prepare_release(fi, ff, flags, FUSE_RELEASE, true);
> +	fuse_prepare_release(fi, ff, flags, opcode, true);
>  	fuse_file_put(ff, true);
>  }
>  EXPORT_SYMBOL_GPL(fuse_sync_release);
> @@ -1456,13 +1458,12 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
>  static void fuse_dio_unlock(struct kiocb *iocb, bool exclusive)
>  {
>  	struct inode *inode = file_inode(iocb->ki_filp);
> -	struct fuse_inode *fi = get_fuse_inode(inode);
>  
>  	if (exclusive) {
>  		inode_unlock(inode);
>  	} else {
>  		/* Allow opens in caching mode after last parallel dio end */
> -		fuse_inode_uncached_io_end(fi);
> +		fuse_inode_uncached_io_end(inode);
>  		inode_unlock_shared(inode);
>  	}
>  }
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index eb974739dd5e..1c4646ad7c25 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -161,9 +161,6 @@ struct fuse_inode {
>  			 * (FUSE_NOWRITE) means more writes are blocked */
>  			int writectr;
>  
> -			/** Number of files/maps using page cache */
> -			int iocachectr;
> -
>  			/* Waitq for writepage completion */
>  			wait_queue_head_t page_waitq;
>  
> @@ -206,6 +203,9 @@ struct fuse_inode {
>  	/** Lock to protect write related fields */
>  	spinlock_t lock;
>  
> +	/** Number of files/maps using page cache (negative for passthrough) */
> +	int iocachectr;
> +
>  #ifdef CONFIG_FUSE_DAX
>  	/*
>  	 * Dax specific inode data
> @@ -238,7 +238,7 @@ enum {
>  	FUSE_I_BAD,
>  	/* Has btime */
>  	FUSE_I_BTIME,
> -	/* Wants or already has page cache IO */
> +	/* Regular file wants or already has page cache IO */
>  	FUSE_I_CACHE_IO_MODE,
>  	/*
>  	 * Client has exclusive access to the inode, either because fs is local
> @@ -1192,7 +1192,7 @@ void fuse_file_free(struct fuse_file *ff);
>  int fuse_finish_open(struct inode *inode, struct file *file);
>  
>  void fuse_sync_release(struct fuse_inode *fi, struct fuse_file *ff,
> -		       unsigned int flags);
> +		       unsigned int flags, bool isdir);
>  
>  /**
>   * Send RELEASE or RELEASEDIR request
> @@ -1542,7 +1542,7 @@ int fuse_fileattr_set(struct mnt_idmap *idmap,
>  /* iomode.c */
>  int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff);
>  int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb);
> -void fuse_inode_uncached_io_end(struct fuse_inode *fi);
> +void fuse_inode_uncached_io_end(struct inode *inode);
>  
>  int fuse_file_io_open(struct file *file, struct inode *inode);
>  void fuse_file_io_release(struct fuse_file *ff, struct inode *inode);
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index 014b9af42909..bdc135f9fe3e 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -192,10 +192,10 @@ static void fuse_evict_inode(struct inode *inode)
>  			atomic64_inc(&fc->evict_ctr);
>  	}
>  	if (S_ISREG(inode->i_mode) && !fuse_is_bad(inode)) {
> -		WARN_ON(fi->iocachectr != 0);
>  		WARN_ON(!list_empty(&fi->write_files));
>  		WARN_ON(!list_empty(&fi->queued_writes));
>  	}
> +	WARN_ON(fi->iocachectr != 0);
>  }
>  
>  static int fuse_reconfigure(struct fs_context *fsc)
> diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
> index 6815b4506007..2360b32793c2 100644
> --- a/fs/fuse/iomode.c
> +++ b/fs/fuse/iomode.c
> @@ -15,9 +15,12 @@
>  /*
>   * Return true if need to wait for new opens in caching mode.
>   */
> -static inline bool fuse_is_io_cache_wait(struct fuse_inode *fi)
> +static inline bool fuse_is_io_cache_wait(struct inode *inode)
>  {
> -	return READ_ONCE(fi->iocachectr) < 0 && !fuse_inode_backing(fi);
> +	struct fuse_inode *fi = get_fuse_inode(inode);
> +
> +	return S_ISREG(inode->i_mode) &&
> +		READ_ONCE(fi->iocachectr) < 0 && !fuse_inode_backing(fi);
>  }
>  
>  /*
> @@ -40,10 +43,10 @@ int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff)
>  	 * Setting the bit advises new direct-io writes to use an exclusive
>  	 * lock - without it the wait below might be forever.
>  	 */
> -	while (fuse_is_io_cache_wait(fi)) {
> +	while (fuse_is_io_cache_wait(inode)) {
>  		set_bit(FUSE_I_CACHE_IO_MODE, &fi->state);
>  		spin_unlock(&fi->lock);
> -		wait_event(fi->direct_io_waitq, !fuse_is_io_cache_wait(fi));
> +		wait_event(fi->direct_io_waitq, !fuse_is_io_cache_wait(inode));
>  		spin_lock(&fi->lock);
>  	}
>  
> @@ -69,8 +72,10 @@ int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff)
>  }
>  
>  static void fuse_file_cached_io_release(struct fuse_file *ff,
> -					struct fuse_inode *fi)
> +					struct inode *inode)
>  {
> +	struct fuse_inode *fi = get_fuse_inode(inode);
> +
>  	spin_lock(&fi->lock);
>  	WARN_ON(fi->iocachectr <= 0);
>  	WARN_ON(ff->iomode != IOM_CACHED);
> @@ -141,15 +146,17 @@ static int fuse_file_uncached_io_open(struct inode *inode,
>  	return 0;
>  }
>  
> -void fuse_inode_uncached_io_end(struct fuse_inode *fi)
> +void fuse_inode_uncached_io_end(struct inode *inode)
>  {
> +	struct fuse_inode *fi = get_fuse_inode(inode);
>  	struct fuse_backing *oldfb = NULL;
>  
>  	spin_lock(&fi->lock);
>  	WARN_ON(fi->iocachectr >= 0);
>  	fi->iocachectr++;
>  	if (!fi->iocachectr) {
> -		wake_up(&fi->direct_io_waitq);
> +		if (S_ISREG(inode->i_mode))
> +			wake_up(&fi->direct_io_waitq);
>  		oldfb = fuse_inode_backing_set(fi, NULL);
>  	}
>  	spin_unlock(&fi->lock);
> @@ -159,11 +166,11 @@ void fuse_inode_uncached_io_end(struct fuse_inode *fi)
>  
>  /* Drop uncached_io reference from passthrough open */
>  static void fuse_file_uncached_io_release(struct fuse_file *ff,
> -					  struct fuse_inode *fi)
> +					  struct inode *inode)
>  {
>  	WARN_ON(ff->iomode != IOM_UNCACHED);
>  	ff->iomode = IOM_NONE;
> -	fuse_inode_uncached_io_end(fi);
> +	fuse_inode_uncached_io_end(inode);
>  }
>  
>  /*
> @@ -267,8 +274,6 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
>  /* No more pending io and no new io possible to inode via open/mmapped file */
>  void fuse_file_io_release(struct fuse_file *ff, struct inode *inode)
>  {
> -	struct fuse_inode *fi = get_fuse_inode(inode);
> -
>  	/*
>  	 * Last passthrough file close allows caching inode io mode.
>  	 * Last caching file close exits caching inode io mode.
> @@ -278,10 +283,10 @@ void fuse_file_io_release(struct fuse_file *ff, struct inode *inode)
>  		/* Nothing to do */
>  		break;
>  	case IOM_UNCACHED:
> -		fuse_file_uncached_io_release(ff, fi);
> +		fuse_file_uncached_io_release(ff, inode);
>  		break;
>  	case IOM_CACHED:
> -		fuse_file_cached_io_release(ff, fi);
> +		fuse_file_cached_io_release(ff, inode);
>  		break;
>  	}
>  }
> -- 
> 2.52.0
> 
> 
