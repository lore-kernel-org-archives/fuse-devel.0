Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB19359A70
	for <fuse-devel@lists.linux.dev>; Mon,  1 Jun 2026 18:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339985; cv=none; b=NxixqwLSinttSkvHqDJFQE2Xs9DvMSrJiVfConqbUQkmovEBjfln5EAUrK6c59uMNdkn2GfgMru8x3mJNeNr9feuAtB70Vks6vhOqRoFPFhlL5D0/keHEWwYNfk2+5gqtq9t5ZP7K0JUG+E3/5aLQFiSxorFG75pw1Og6eUmpOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339985; c=relaxed/simple;
	bh=sEBit1Spz6g7VcyImiR8P7cP43Zoj2ADbZZ1dH/ximo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCLcUYB0m3TjeBGsgqUi/GWE+TqWNi4lm61H3kTylPLH0+8wJsIFhklFJJZbKYCVS1wY161fALFDq67remWfHoIXie0kX1NVs8iO7qnkD8d7edtTiz+8yYlZaShY9QALexLJcbZlrRsd9N4jRPJWXVVgVxPqcHO4OaQD4YX+pkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcpG+SNm; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcpG+SNm"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bd8d0e4e341so2418848566b.0
        for <fuse-devel@lists.linux.dev>; Mon, 01 Jun 2026 11:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780339981; x=1780944781; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EIdVYJu9K4fQfdWSIt/qX+Ktap9LoTUnGmSlIdH+1JQ=;
        b=fcpG+SNmesv65aldnde0M+G8nrtHHotYuOoi8D82Obx1yNcL7UWUfcHCD+uyUllY0F
         h3fNyp8QPXt8OvbUNoWarAJ1ODjwW5RpvKqN8BuuUG82lotT6WW1NwsTYS1dB6fvp++k
         GJuahMzacfTAG+x9h8wcSbbCQ8WJYFipZL6+j0ut+RyjdoOdn3ZYPbm3XJEdu3BDGhAX
         nl/rtWYlWLSieDmdq+GNTYgxdEYeWvVHQLIwJ6sHCM5ZmYgs2anc5bCJfqCu4kBBfgVz
         +bAlmxHTDjiGPmaK7QZpXlagYH3IAn1/WH+GqXxc8nFH5jmEIapl/9A7mkIz5F9WQvqn
         us+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780339981; x=1780944781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIdVYJu9K4fQfdWSIt/qX+Ktap9LoTUnGmSlIdH+1JQ=;
        b=TxJXVZ37cUTJjvQyhrOqLc5XBFVKzgdtuLrV7Tvm38rMyarR3hsBGRol/WI1/niiEm
         XlAVsDcuAkLHrJ5iAGlNpOwI/ySauHgqaF9JiI47TjVzKWDpqO/Kw4dwD6FED7PK78gH
         Q/OQh6wTtv8ZN10jm5SdrHLvQlaGfgT9xjLQOtCCKwPxXxyrjH9DNh7cr0dkeCFaV7kn
         rb4vBP2YwwkMYk3r22OjxihYRQwDkM1eQWFSts4SQpqprNVxPUiPzDeIaoXjRvNV4bQ4
         tahgNRXsNsfLpnWff3V0CnKdo0wfFyEAB/4vGfPzmdQclWquvMgEoAeZxsMVOa817w0q
         e30A==
X-Forwarded-Encrypted: i=1; AFNElJ+h5RZhFYvnQ6AXaBervKVAosV9uqLm0AklWnNQtDOat9lEgdrJm8v+uDuzs+85S6Bd3Zc467VHV3+z@lists.linux.dev
X-Gm-Message-State: AOJu0YyWdwvb0N+hm3YSEWG+GBGMzTsZb7Zp4fjdFEQQHAscURnn1CZR
	5acx0SAmch+QWTBii3+XuSUL/04DEOrpfQR+vQb5qInHZzGkKZ/C3LJp
X-Gm-Gg: Acq92OEoWqwmj1nwWrzd9ZGWBaQ6K3IfP8wXOzz+7hYefeI5K1o+0jwNyzapA/zODnX
	JBNeVdIxNIWJF073kiYt7bYRT1tqdD/51gDfPyyTEhnApIY20r7o5PG1YVth7lHEgLU5cWITKTC
	+Qp+Yti1sHUjLh3pzGSA9APpXWNFdKi8xqf0Iu2+3J35w4wC4nqlpIKpvqLzU2u5dmYq37P0mHE
	rJO3h1Hm/HsHhQa9x+3VViEvQh92kcbnfrIfxCHx4XmOpBrLDKBaQXbn/NT7Rjj1PIXisdjhf1x
	sF4tN1rAddGj2FiRlL4RY0EwYcyqr4ErzZgeOXkQHat7jI1pvsfXiiCN5ZA63JPmiXhjyTk4yyO
	0EhDnQTnnhqGENtwBmbTctULlqAqonzC242ifkd0N8KthEY/5CPtk6ZA/na4DsAupWdpZ98bUs0
	u/f9LaonO5v/OD9DrKQbS2O9IgiooIE/OsvguFLEEKiTkVyIeoxGHUCRXss8d0M+eW7JdNZ+dny
	IjFuBRQLiC3pljcVWA6NO19I4eojx/2rYkUdfS157HTni3XWA==
X-Received: by 2002:a17:907:2810:b0:bec:ab0c:243c with SMTP id a640c23a62f3a-becab0c2da1mr301923766b.21.1780339980769;
        Mon, 01 Jun 2026 11:53:00 -0700 (PDT)
Received: from localhost (2001-1c00-570d-ee00-fb4a-4b87-a6e0-eb91.cable.dynamic.v6.ziggo.nl. [2001:1c00:570d:ee00:fb4a:4b87:a6e0:eb91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9cfc8557csm374637466b.0.2026.06.01.11.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:53:00 -0700 (PDT)
Date: Mon, 1 Jun 2026 20:52:59 +0200
From: Amir Goldstein <amir73il@gmail.com>
To: Russ Fellows <russ.fellows@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, miklos@szeredi.hu,
	linux-kernel@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] fuse: fix FOPEN_PARALLEL_DIRECT_WRITES being ignored
 for passthrough writes
Message-ID: <ah3VCxciXhS0CFdP@amir-ThinkPad-T480>
References: <20260529031918.7361-1-russ.fellows@gmail.com>
 <20260529031918.7361-2-russ.fellows@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529031918.7361-2-russ.fellows@gmail.com>

Removing stable list - this is definetly NOT a bug fix
Please CC fuse-devel@lists.linux.dev for future fuse patches

On Fri, May 29, 2026 at 03:19:15AM +0000, Russ Fellows wrote:
> FOPEN_PARALLEL_DIRECT_WRITES has no effect on passthrough-backed FUSE
> files due to two independent bugs that each prevent it from working.
> Both must be fixed to restore parallel write concurrency.
> 
> Bug 1: fuse_passthrough_write_iter() acquires the exclusive inode lock
> directly:
> 
>     inode_lock(inode);
>     ret = backing_file_write_iter(...);
>     inode_unlock(inode);
> 
> This serializes all concurrent writers regardless of whether the server
> set FOPEN_PARALLEL_DIRECT_WRITES.  The flag is checked by
> fuse_dio_wr_exclusive_lock(), called from fuse_dio_lock(), called from
> fuse_direct_write_iter() -- the non-passthrough O_DIRECT path.
> fuse_file_write_iter() routes passthrough opens to
> fuse_passthrough_write_iter() instead, bypassing the flag check entirely.
> 
> Bug 2: fuse_file_io_open() in iomode.c strips FOPEN_PARALLEL_DIRECT_WRITES
> from any open that lacks FOPEN_DIRECT_IO:
> 
>     if (!(ff->open_flags & FOPEN_DIRECT_IO))
>         ff->open_flags &= ~FOPEN_PARALLEL_DIRECT_WRITES;
> 
> This is correct for regular direct-IO opens where FOPEN_DIRECT_IO ensures
> O_DIRECT is actually in effect.  It is wrong for passthrough opens: a
> passthrough file already bypasses the FUSE page cache by definition, so
> FOPEN_DIRECT_IO is redundant and should not be required to preserve the
> parallel-writes flag.
> 
> Note: adding FOPEN_DIRECT_IO to the daemon's open flags is not a valid
> workaround.  fuse_file_write_iter() checks FOPEN_DIRECT_IO before
> FOPEN_PASSTHROUGH, so setting both causes writes to be routed through
> fuse_direct_write_iter() (requiring a userspace round-trip) instead of
> fuse_passthrough_write_iter() (zero-copy kernel path).
> 
> Combined effect: a daemon that opens with FOPEN_PASSTHROUGH |
> FOPEN_PARALLEL_DIRECT_WRITES (without FOPEN_DIRECT_IO) has the parallel
> flag stripped by Bug 2 before Bug 1 is even reached.  Both bugs must be
> fixed together.
> 
> Fix Bug 1: make fuse_dio_lock() and fuse_dio_unlock() non-static and call
> them from fuse_passthrough_write_iter(), replacing the open-coded
> inode_lock/inode_unlock.  This reuses the existing logic that handles
> FOPEN_PARALLEL_DIRECT_WRITES, append writes, writes past EOF, and
> page-cache IO mode transitions.
> 
> Fix Bug 2: skip the FOPEN_PARALLEL_DIRECT_WRITES strip when
> FOPEN_PASSTHROUGH is set.  The flag remains stripped for non-passthrough
> opens without FOPEN_DIRECT_IO, preserving existing behaviour.
> 
> Safety: backing_file_write_iter() calls into the backing filesystem's
> write_iter (e.g. xfs_file_write_iter), which acquires the backing inode's
> own lock independently.  The FUSE inode lock and the backing inode lock are
> entirely separate; using inode_lock_shared on the FUSE inode does not
> affect the backing filesystem's concurrency control.
> 
> Fixes: 4d99ff8f6b85 ("fuse: implement open/create with FOPEN_PASSTHROUGH")

Not a fix, because this was very intentional.
It is a new feature that you are proposing to support parallel
passthrough dio.

Anyway, this patch has many problems

> Cc: stable@vger.kernel.org
> Signed-off-by: Russ Fellows <russ.fellows@gmail.com>
> ---
>  fs/fuse/file.c        |  6 +++---
>  fs/fuse/fuse_i.h      |  2 ++
>  fs/fuse/iomode.c      |  8 ++++++--
>  fs/fuse/passthrough.c |  6 +++---
>  4 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index f94f3dc082c6..602c3f18676e 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -1428,8 +1428,8 @@ static bool fuse_dio_wr_exclusive_lock(struct kiocb *iocb, struct iov_iter *from
>  	return false;
>  }
>  
> -static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
> -			  bool *exclusive)
> +void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
> +		   bool *exclusive)
>  {
>  	struct inode *inode = file_inode(iocb->ki_filp);
>  	struct fuse_inode *fi = get_fuse_inode(inode);
> @@ -1455,7 +1455,7 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
>  	}
>  }
>  
> -static void fuse_dio_unlock(struct kiocb *iocb, bool exclusive)
> +void fuse_dio_unlock(struct kiocb *iocb, bool exclusive)
>  {
>  	struct inode *inode = file_inode(iocb->ki_filp);
>  	struct fuse_inode *fi = get_fuse_inode(inode);
> @@ -1469,7 +1469,7 @@ static void fuse_dio_unlock(struct kiocb *iocb, bool exclusive)
>  	}
>  }
>  
> -static const struct iomap_write_ops fuse_iomap_write_ops = {
> +static const struct iomap_write_ops fuse_iomap_write_ops = {	/* unchanged */
>  	.read_folio_range = fuse_iomap_read_folio_range,
>  };
>  
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 17423d4e3cfa..120de517cea0 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1541,6 +1541,8 @@ int fuse_file_io_open(struct file *file, struct inode *inode);
>  void fuse_file_io_release(struct fuse_file *ff, struct inode *inode);
>  
>  /* file.c */
> +void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from, bool *exclusive);
> +void fuse_dio_unlock(struct kiocb *iocb, bool exclusive);
>  struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
>  				 unsigned int open_flags, bool isdir);
>  void fuse_file_release(struct inode *inode, struct fuse_file *ff,
> diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
> index c99e285f3..b3f51e3d1 100644
> --- a/fs/fuse/iomode.c
> +++ b/fs/fuse/iomode.c
> @@ -214,10 +214,14 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
>  	if (fuse_inode_backing(fi) && !(ff->open_flags & FOPEN_PASSTHROUGH))
>  		goto fail;
>  
> -	/*
> -	 * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO.
> -	 */
> -	if (!(ff->open_flags & FOPEN_DIRECT_IO))
> +	/*
> +	 * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO, except for
> +	 * passthrough opens which bypass the page cache regardless and do not
> +	 * need FOPEN_DIRECT_IO to guarantee direct I/O semantics.
> +	 */
> +	if (!(ff->open_flags & FOPEN_DIRECT_IO) &&
> +	    !(ff->open_flags & FOPEN_PASSTHROUGH))
>  		ff->open_flags &= ~FOPEN_PARALLEL_DIRECT_WRITES;
>  
>  	/*
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index f2d08ac2459b..f83d0a27cfb9 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -54,11 +54,11 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
>  				    struct iov_iter *iter)
>  {
>  	struct file *file = iocb->ki_filp;
> -	struct inode *inode = file_inode(file);
>  	struct fuse_file *ff = file->private_data;
>  	struct file *backing_file = fuse_file_passthrough(ff);
>  	size_t count = iov_iter_count(iter);
>  	ssize_t ret;
> +	bool exclusive;
>  	struct backing_file_ctx ctx = {
>  		.cred = ff->cred,
>  		.end_write = fuse_passthrough_end_write,
> @@ -70,10 +70,10 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
>  	if (!count)
>  		return 0;
>  
> -	inode_lock(inode);
> +	fuse_dio_lock(iocb, iter, &exclusive);

You can't just use fuse_dio_lock() like this
it plays nasty games with the iomode.
It does not even check for O_DIRECT mode, so this would do
parallel buffered write (at least until it meets the filesystem lock
but its not something we would want.
You should study this code better.

>  	ret = backing_file_write_iter(backing_file, iter, iocb, iocb->ki_flags,
>  				      &ctx);

The problem is that while backing_file_write_iter() does not seem to
directly require an exclusive lock (apart from maybe file_remove_privs)
the fuse_passthrough_end_write() callback does I think rely on this
exclusive lock.

So proving that this can work will require more research and more effort
and I am not really sure how that is going to work out.

Thanks,
Amir.
