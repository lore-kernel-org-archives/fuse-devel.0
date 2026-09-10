Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EE448664A
	for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044065; cv=pass; b=Ot5J2tr+HeI0IukkVvyk8CRfMPHm09bNYc0W8In4GFcgHxfKvQ8/dKAPNDUjE+pzr7ONOyLY0Heu7xS+fZx92PM94q7aiu6qYFIroFlqe9Jv+rT3it8LBqUzFNu/Zp1tjFDyFT7ddYWmVY3k9TQHkMcxT8KLBYryJa5y90N1Dnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044065; c=relaxed/simple;
	bh=Z5kbWcBxRDjL5FcNtbwKUn7p6N3dVPM0eUf/Gam/hLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ngZwye9LStPpNnFLaDr94t2Jt/hlyacFTXJw79zLzXxxSnA5f4TD6Rv062sE4irn1d5nNkr9Sj8SZ9hcrDKMqc2n0ls8QvtSkpwDU3tk6NcushLTrBjEStADoNlNa7vsr/O5gqHckB461cAGc0F76gDTIkbcczG5NsQo4esGa34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odeRJVfG; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odeRJVfG"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c294183384fso251249666b.1
        for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 05:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789044060; cv=none;
        d=google.com; s=arc-20260327;
        b=RzqpHX227XFmD+4/mLr3uaZScghTzB2vsDlAEUTyRcCIkr+vwWY+Jufbb2/sOdEnZm
         aVVshqW4BFl7TRizpe8aNtn5ud8mCZ4CLRngB7WSB7aYX7xxEy8e5ApNlPXl8VVCX8Wf
         gNQEPYrkVWSny0Wo8QbD68ae8DwIdpSMPF6wgw7f09J9OwzDWMhtHbLHxLM8Na+vU9er
         T6f7L4P+9SggqmrwuQMH3xPin+6grlYu0SrI8aAFFIS0d1uwvKRZ+9vR+gX8lPA5+Pc+
         4l28lozxa782nocnQeuoFvierlAwPzdkVrcYDavdXe14jQxAoWKaeCnpFfgv6q77L11e
         2Gzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7m3skM76LOwF2e+lSxBfD0S53mqoJYV0AyMNyGWWNXs=;
        fh=Wui8lP+kjgZkEgBwk/JgautQ8o+/OhSIG5PpJN3ZNxA=;
        b=itvmHfL+i20CfOzfoTHlf800fArMheBM/rAdLbIMX3C1aj3La3Vrz0T1yUseEVmHJv
         7qkJJCWa9rLeMIHzZ3NUNQ30nw3FXjr0pMLVvA8HbFup8OodVTM72fHorFe/A20Qi1im
         XE8gjmE78hbRFvFZBFNdipVuTSnowCLftaUDp8bmGZl23xgaWKbtcfgXMsbjjGpYR06p
         Qcq8cI3b6lc+vb+TohXsdhA2d9xgE/yOFG4AAQ6uAn/lXkEmhzEsOkGlKAfd4HlKLunl
         1/JvQHDVbhaZwTm+3zhPtjo6z0cMiBhHDZaNVEaqx8Exi6r9Q8Z3DLuniJNlyAwJCTvT
         X9Kg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789044060; x=1789648860; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7m3skM76LOwF2e+lSxBfD0S53mqoJYV0AyMNyGWWNXs=;
        b=odeRJVfGlvr9OCYgIpYzwplResst2kTcwe9SCHg6HhYW4V2lDNxj5YzTWEnPSJ9QJ4
         Alxy3tUcsN3kVLQaTmBwIvcs2wo2rt0SX14lTj/AQAUw8T9fnkovpubslfACrELnYDPG
         d+LkZ+iw2QtU3H5T78fESyFd1s206N+dwbWd+9ceCaIYhtgVFD4LiKJysi6RjkJutNbj
         P8OnCq5o0XS/jUyVWoklmdgJ5c8ZS7DLziKnxWbLFQG8a3FKHUWdmhPpNCVAPET7UG5H
         P7lSTJKkrhUUlOaMlj8BmTYkUkHiJoX6rn3qcmmueJkjrJHEymbgI0MueCSD7051gsXr
         8T2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044060; x=1789648860;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7m3skM76LOwF2e+lSxBfD0S53mqoJYV0AyMNyGWWNXs=;
        b=sDO1MJsh9gjP+B1mTTyvwYPppKF1Eesn1H3CqDkJHcYKxcKsLMKVACla2X7QUlAbkD
         RWGNSE+ECZMWc1Vc7ncqhClBM5EoRaekzV4bcZCY5vem+oZkA/4dGa6G7cJGnguvNleC
         RMkNL+rkgS1pfnp+CdM5aJINBgCCMZbysHK35/7GvwhoCU9Fpec9eDnaz9ahJ5GfpSHD
         pnDYu+Nn1JXidbAhfSmOFrSxHjMgJ75Dr4JUbxQslwgovfQ/1Vb0j+VCOQUyzs9RmU0P
         LpekyXMNf0AP1LhLcTfRWtqfiHei5WuqiNelAwTZIvkJrnvLZGnV5NjxhN1ZHcEQ1ajn
         7TlA==
X-Forwarded-Encrypted: i=1; AKwUvByJi8Re2w9VPfOjCivbAWWUu0mJyROrsyX3wiwgAwHOAwf3JF5gMt4rHg5ir5aOB52XPBkeK5BI9itV@lists.linux.dev
X-Gm-Message-State: AFuF++nDh0EkSCdn+b+ZhuUEaga/QYR3NZ0cPNZoFWGI6PnN2ZYpQk8G
	OHMGXMuyHep3/0XQLmXfsavVWIoYKs4zAydHUevIqmhYN5neAMqWrKl/vOfWC6/bTXorgVZ1awd
	6j+n4QhmEbXPbNrF1Tehhtnsv7nlt3Hs=
X-Gm-Gg: AYBFou2VdCiC8CJba6YKk4HQbrCFtf3Y+W1uibMMOq4GpuBYJ6quHZDvtPwvRUxmKCY
	JSNBPPuuxmgYNRS13JTGL3YO1x6bsuUntImymwhDY+X6ITSx7bYUPeN0hL38RcKohFg/CdbQvi2
	0+I4RWNez7MBvnAYvvVaV5OFXmICK8JVdn9BIJuMP9JeeqQtEVaTlQeg0K8k8PKNZ9CBThbzhMl
	d7l61BHXlQ7u+RWqfNoFY0UysMKXdlquKXK/Q+2CWHVagE/biUPCXBcR7EuxNBdDgC62Dcmdg5z
	zCmUuDfBrS5MtAKNCiHkgsXhF9Q5iupDpk2lQDib0Ugcx5mGZUwSjALooW0tPX4BTjA=
X-Received: by 2002:a17:906:ef0a:b0:c20:21be:ea75 with SMTP id
 a640c23a62f3a-c260c7b6576mr1728189066b.8.1789044059669; Thu, 10 Sep 2026
 05:40:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909232351.1533034-1-shayba@google.com>
In-Reply-To: <20260909232351.1533034-1-shayba@google.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 10 Sep 2026 14:40:47 +0200
X-Gm-Features: AcwNN1UPmN16B7TZMWvy5EWYc28BaZE6GbQQ41HWEcsZyRy4y67tvLVqGD6zkYE
Message-ID: <CAOQ4uxjwOHV0bMh21_WuSzMP_BBQrx59-jP8Ef0cnmW2kh54aA@mail.gmail.com>
Subject: Re: [PATCH] fuse: Forward vfs_fadvise to backing_file in passthrough mode
To: Shai Barack <shayba@google.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
	Sandeep Dhavale <dhavale@google.com>, Akilesh Kailash <akailash@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, fuse-devel <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 1:23=E2=80=AFAM Shai Barack <shayba@google.com> wro=
te:
>
> When an application invokes posix_fadvise(..., POSIX_FADV_DONTNEED) or
> other fadvise advice on a FUSE passthrough file descriptor, the VFS
> currently only executes generic_fadvise() on the upper FUSE inode
> mapping.
>
> Because FUSE passthrough does not forward fadvise operations to the
> underlying backing file, pages residing in the lower filesystem's
> pagecache remain resident in memory.
>
> During media-heavy workloads (such as image thumbnail generation or
> streaming), single-access file data accumulates in the inactive pagecache
> of the lower filesystem. Under memory pressure, the kernel retains these
> stale media pages and instead evicts active executable pages from
> running processes, leading to severe direct reclaim latency spikes.
>
> Architecturally, Linux VFS supports filesystem-specific fadvise
> delegation via the .fadvise hook in struct file_operations. Implement
> fuse_file_fadvise() in fs/fuse/file.c and register it in
> fuse_file_operations. When passthrough is active on a fuse_file,
> fuse_file_fadvise() forwards the vfs_fadvise() call to the lower
> backing_file under the opened credentials, allowing POSIX_FADV_DONTNEED
> to cleanly invalidate the physical backing filesystem pagecache.
>
> Signed-off-by: Shai Barack <shayba@google.com>
> Cc: Miklos Szeredi <miklos@szeredi.hu>
> Cc: Amir Goldstein <amir73il@gmail.com>
> Cc: Bernd Schubert <bschubert@ddn.com>
> Cc: Sandeep Dhavale <dhavale@google.com>
> Cc: Akilesh Kailash <akailash@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---

Hi Shai,

This makes sense.

Please CC fuse-devel with future posting.

See some nits below...

>  fs/fuse/file.c        | 11 +++++++++++
>  fs/fuse/fuse_i.h      |  7 +++++++
>  fs/fuse/passthrough.c | 16 ++++++++++++++++
>  3 files changed, 34 insertions(+)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index a4d736945..81709ab82 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -3537,6 +3537,16 @@ static ssize_t fuse_copy_file_range(struct file *s=
rc_file, loff_t src_off,
>         return ret;
>  }
>
> +static int fuse_file_fadvise(struct file *file, loff_t offset, loff_t le=
n, int advice)
> +{
> +       struct fuse_file *ff =3D file->private_data;
> +
> +       if (fuse_file_passthrough(ff))
> +               return fuse_passthrough_fadvise(ff, offset, len, advice);
> +
> +       return generic_fadvise(file, offset, len, advice);
> +}
> +
>  static const struct file_operations fuse_file_operations =3D {
>         .llseek         =3D fuse_file_llseek,
>         .read_iter      =3D fuse_file_read_iter,
> @@ -3557,6 +3567,7 @@ static const struct file_operations fuse_file_opera=
tions =3D {
>         .fallocate      =3D fuse_file_fallocate,
>         .copy_file_range =3D fuse_copy_file_range,
>         .fop_flags      =3D FOP_DONTCACHE,
> +       .fadvise        =3D fuse_file_fadvise,
>  };
>
>  static const struct address_space_operations fuse_file_aops  =3D {
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 939553b34..50073e070 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1545,6 +1545,12 @@ static inline struct fuse_backing *fuse_backing_ge=
t(struct fuse_backing *fb)
>  static inline void fuse_backing_put(struct fuse_backing *fb)
>  {
>  }
> +
> +static inline int fuse_passthrough_fadvise(struct fuse_file *ff, loff_t =
offset,
> +                                          loff_t len, int advice)
> +{
> +       return -EOPNOTSUPP;
> +}

Not needed, the same as fuse_passthrough_mmap stub is not needed because
if (fuse_file_passthrough()) branch is optimized out.

>  #endif
>
>  void fuse_backing_files_init(struct fuse_conn *fc);
> @@ -1575,6 +1581,7 @@ ssize_t fuse_passthrough_splice_write(struct pipe_i=
node_info *pipe,
>                                       struct file *out, loff_t *ppos,
>                                       size_t len, unsigned int flags);
>  ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *=
vma);
> +int fuse_passthrough_fadvise(struct fuse_file *ff, loff_t offset, loff_t=
 len, int advice);
>
>  /* backing.c */
>
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index 059e57969..8062110dd 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -382,3 +382,19 @@ void fuse_passthrough_release(struct fuse_file *ff, =
struct fuse_backing *fb)
>         put_cred(ff->cred);
>         ff->cred =3D NULL;
>  }
> +
> +int fuse_passthrough_fadvise(struct fuse_file *ff, loff_t offset, loff_t=
 len, int advice)
> +{
> +       struct file *backing_file =3D fuse_file_passthrough(ff);
> +       const struct cred *old_cred;
> +       int ret;
> +
> +       if (!backing_file)
> +               return -EINVAL;

Not needed. already checked.

> +
> +       old_cred =3D override_creds(ff->cred);
> +       ret =3D vfs_fadvise(backing_file, offset, len, advice);
> +       revert_creds(old_cred);
> +
> +       return ret;
> +}

Please reorder this above fuse_passthrough_open() along with the
other passthrough ops. open and release are special.

</nits>

This got me thinking - do we have any other purely page cache operations
that should be executed on the passthrough file?

There is one pattern that stands out: fuse_fsync()/fuse_flush() in case
server does not implement those ops.

Currently, they are mostly a noop for fuse passthrough files, but it
could make sense to passthrough these two ops on the backing file
same as overlayfs does.

This has implications on the use case that you described.
If an application wants to synchronically evict page cache of large file
that was recently written, POSIX_FADV_DONTNEED alone is not enough.

Some would claim that passthtough of fallocate() to backing file in case
server does not implement FUSE_FALLCOATE also makes sense,
but that will be a visible change of behavior from current -EOPNOTSUPP,
so I think this is better to do with an opt-in "passthrough ops mask".

Thanks,
Amir.
