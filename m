Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061F9362156
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 21:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776806164; cv=none; b=Fd4cdI5xdjQ2gn3s21s5kqjV+lqEHADQRXcuTK3e/mgUmeX+lOsvt4gIR0i6DFNzqPuOJi8bVmoh9wZfpWODovBz0nsqDhMpzsmldJ6Q5vT9GAMjCP0m4CLn2s7qVHK7vSn6QDZvfIzmjRAHR+wtfQLs17+izS6fVKf7SftzTDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776806164; c=relaxed/simple;
	bh=Bkk6JdNGGl6mZ6KeEwQe9D1xqVq3OV6ggCIzd66rjoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfnprQgRFosvxhmAI2lrssfKwETZK1tSjswyun33FPJtLC0wgIG4ajy5J7sIYIUOXimVs/v7ki/LvIiyme9z+sND/lKEXIGQy8Ce3/wv3fg6Z45eOmC1dcsiVPs/dfi2ZBz1tn9ioA8AvzsMUX+gVoJJXmX6Jcn3UcmQmc0KsQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdUJ8v/I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdUJ8v/I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC77C2BCB0;
	Tue, 21 Apr 2026 21:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776806163;
	bh=Bkk6JdNGGl6mZ6KeEwQe9D1xqVq3OV6ggCIzd66rjoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bdUJ8v/IV9ztz2ijeR520ul10fN6A2C/jaNr8zZlVymnowCEjMW5pp6eF0b8Jlmcf
	 ki9bv7yBB+CQ/+V+HDAqdzhULr0sY5IuFvOIFUsQpEQR+yspH+uwOm4tpNM79xOK/Z
	 nL2woH4KZxORymDS+Je6cKVGJWzsPtQov666YSki3eJ/IOyisq5/OkewZPbcZXCvdE
	 T3yFQ8B+Wc0w4wFWUyqmRxkZut7MPp9/HgkFCkObaakk4oT6Vuwz49aoNcWp8yA8Me
	 ryUg+wZkmi1BCTNlNvhy8GOhLp6bvt/uKtykIxbP3FaS6yxpqIb2G7Y6axNZMc5t9F
	 SF1arOjsYDJAw==
Date: Tue, 21 Apr 2026 14:16:03 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, amir73il@gmail.com, fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: Re: [PATCH v1 02/17] fuse: prepare for passthrough of inode
 operations
Message-ID: <20260421211603.GB7739@frogsfrogsfrogs>
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-3-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420221637.2631478-3-joannelkoong@gmail.com>

On Mon, Apr 20, 2026 at 03:16:22PM -0700, Joanne Koong wrote:
> From: Amir Goldstein <amir73il@gmail.com>
> 
> So far, fuse passthrough was implemented for read/write/splice/mmap
> operations for regular files opened with FOPEN_PASSTHROUGH.
> 
> A backing file is attached to a fuse inode, but only for as long as
> there are FOPEN_PASSTHROUGH files opened on this inode.
> 
> We would like to attach a backing file to fuse inode also without an
> open file to allow passthrough of some inode operations.
> 
> Add field ops_mask to the input argument of FUSE_DEV_IOC_BACKING_OPEN
> ioctl to declare the operations that would passthrough to the backing
> file once it has been attached to the fuse inode on lookup.
> 
> Setting the FUSE_READ/FUSE_WRITE operations in the ops_mask is not
> required because those operations are implied by FOPEN_PASSTHROUGH.
> 
> When setting operations other than FUSE_READ/FUSE_WRITE in ops_mask,
> non-regular backing files are allowed, so we need to verify when
> attaching a backing file to a fuse inode, that their file types match.
> 
> For simplification of inode attribute caching, for now, require a
> filesystem with FUSE_PASSTHROUGH_INO (one-to-one mapping from fuse inode
> to backing inode) for setting up passthrough of any inode operations.
> We may consider relaxing this requirement for some inode operations
> in the future.
> 
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  fs/fuse/backing.c         | 13 ++++++++++---
>  fs/fuse/fuse_i.h          | 40 +++++++++++++++++++++++++++++++++++++++
>  fs/fuse/iomode.c          |  5 +++++
>  include/uapi/linux/fuse.h |  9 ++++++++-
>  4 files changed, 63 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index d95dfa48483f..830cbe2a4200 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -86,7 +86,8 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
>  	struct fuse_backing *fb = NULL;
>  	int res;
>  
> -	pr_debug("%s: fd=%d flags=0x%x\n", __func__, map->fd, map->flags);
> +	pr_debug("%s: fd=%d flags=0x%x ops_mask=0x%llx\n", __func__,
> +		 map->fd, map->flags, map->ops_mask);
>  
>  	/* TODO: relax CAP_SYS_ADMIN once backing files are visible to lsof */
>  	res = -EPERM;
> @@ -94,7 +95,11 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
>  		goto out;
>  
>  	res = -EINVAL;
> -	if (map->flags || map->padding)
> +	if (map->flags || map->ops_mask & ~FUSE_BACKING_MAP_VALID_OPS)
> +		goto out;
> +
> +	/* For now passthrough inode operations requires FUSE_PASSTHROUGH_INO */
> +	if (!fc->passthrough_ino && map->ops_mask & FUSE_PASSTHROUGH_INODE_OPS)
>  		goto out;
>  
>  	file = fget_raw(map->fd);
> @@ -104,7 +109,8 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
>  
>  	/* read/write/splice/mmap passthrough only relevant for regular files */
>  	res = d_is_dir(file->f_path.dentry) ? -EISDIR : -EINVAL;
> -	if (!d_is_reg(file->f_path.dentry))
> +	if (!(map->ops_mask & ~FUSE_PASSTHROUGH_RW_OPS) &&
> +	    !d_is_reg(file->f_path.dentry))
>  		goto out_fput;
>  
>  	backing_sb = file_inode(file)->i_sb;
> @@ -119,6 +125,7 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
>  
>  	fb->file = file;
>  	fb->cred = prepare_creds();
> +	fb->ops_mask = map->ops_mask;
>  	refcount_set(&fb->count, 1);
>  
>  	res = fuse_backing_id_alloc(fc, fb);
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 86fdf873d639..eb974739dd5e 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -107,6 +107,7 @@ struct fuse_submount_lookup {
>  struct fuse_backing {
>  	struct file *file;
>  	struct cred *cred;
> +	u64 ops_mask;
>  
>  	/** refcount */
>  	refcount_t count;
> @@ -244,6 +245,8 @@ enum {
>  	 * or the fuse server has an exclusive "lease" on distributed fs
>  	 */
>  	FUSE_I_EXCLUSIVE,
> +	/* Has backing file for inode ops passthrough */
> +	FUSE_I_PASSTHROUGH,
>  };
>  
>  struct fuse_conn;
> @@ -1550,6 +1553,25 @@ struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
>  void fuse_file_release(struct inode *inode, struct fuse_file *ff,
>  		       unsigned int open_flags, fl_owner_t id, bool isdir);
>  
> +/* passthrough.c */
> +
> +/* READ/WRITE are implied by FOPEN_PASSTHROUGH, but defined for completeness */
> +#define FUSE_PASSTHROUGH_RW_OPS \
> +	(FUSE_PASSTHROUGH_OP_READ | FUSE_PASSTHROUGH_OP_WRITE)
> +
> +/* File passthrough operations require a file opened with FOPEN_PASSTHROUGH */
> +#define FUSE_PASSTHROUGH_FILE_OPS \
> +	(FUSE_PASSTHROUGH_RW_OPS)
> +
> +/* Inode passthrough operations for backing file attached to inode */
> +#define FUSE_PASSTHROUGH_INODE_OPS (0)
> +
> +#define FUSE_BACKING_MAP_OP(map, op) \
> +	((map)->ops_mask & FUSE_PASSTHROUGH_OP(op))
> +
> +#define FUSE_BACKING_MAP_VALID_OPS \
> +	(FUSE_PASSTHROUGH_FILE_OPS | FUSE_PASSTHROUGH_INODE_OPS)
> +
>  /* backing.c */
>  #ifdef CONFIG_FUSE_PASSTHROUGH
>  struct fuse_backing *fuse_backing_get(struct fuse_backing *fb);
> @@ -1619,6 +1641,24 @@ ssize_t fuse_passthrough_splice_write(struct pipe_inode_info *pipe,
>  				      size_t len, unsigned int flags);
>  ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma);
>  
> +static inline struct fuse_backing *fuse_inode_passthrough(struct fuse_inode *fi)
> +{
> +#ifdef CONFIG_FUSE_PASSTHROUGH
> +	if (test_bit(FUSE_I_PASSTHROUGH, &fi->state))
> +		return fuse_inode_backing(fi);
> +#endif
> +	return NULL;
> +}
> +
> +static inline bool fuse_inode_passthrough_op(struct inode *inode,
> +					     enum fuse_opcode op)
> +{
> +	struct fuse_inode *fi = get_fuse_inode(inode);
> +	struct fuse_backing *fb = fuse_inode_passthrough(fi);
> +
> +	return fb && fb->ops_mask & FUSE_PASSTHROUGH_OP(op);
> +}
> +
>  #ifdef CONFIG_SYSCTL
>  extern int fuse_sysctl_register(void);
>  extern void fuse_sysctl_unregister(void);
> diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
> index ca3b28597722..6815b4506007 100644
> --- a/fs/fuse/iomode.c
> +++ b/fs/fuse/iomode.c
> @@ -96,6 +96,11 @@ int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb)
>  		err = -EBUSY;
>  		goto unlock;
>  	}
> +	/* fuse and backing file types must match */
> +	if (fb && ((fb->file->f_inode->i_mode ^ inode->i_mode) & S_IFMT)) {
> +		err = -EIO;
> +		goto unlock;
> +	}
>  	/* With FUSE_PASSTHROUGH_INO, fuse and backing ino must match */
>  	if (fb && fc->passthrough_ino &&
>  	    fb->file->f_inode->i_ino != inode->i_ino) {
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 4be9ccc5b3ff..0f1e1c1ec367 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -243,6 +243,7 @@
>   *
>   *  7.46
>   *  - add FUSE_PASSTHROUGH_INO
> + *  - add ops_mask field to struct fuse_backing_map
>   */
>  
>  #ifndef _LINUX_FUSE_H
> @@ -1133,9 +1134,15 @@ struct fuse_notify_prune_out {
>  struct fuse_backing_map {
>  	int32_t		fd;
>  	uint32_t	flags;
> -	uint64_t	padding;
> +	uint64_t	ops_mask;
>  };
>  
> +#define FUSE_PASSTHROUGH_OP(op)	(1ULL << ((op) - 1))
> +
> +/* op bits for fuse_backing_map ops_mask */
> +#define FUSE_PASSTHROUGH_OP_READ	FUSE_PASSTHROUGH_OP(FUSE_READ)
> +#define FUSE_PASSTHROUGH_OP_WRITE	FUSE_PASSTHROUGH_OP(FUSE_WRITE)

FUSE_READ==15 and FUSE_WRITE==16; this is a bit wasteful of ops_mask
bits, of which there are only 64.

--D

> +
>  /* Device ioctls: */
>  #define FUSE_DEV_IOC_MAGIC		229
>  #define FUSE_DEV_IOC_CLONE		_IOR(FUSE_DEV_IOC_MAGIC, 0, uint32_t)
> -- 
> 2.52.0
> 
> 
