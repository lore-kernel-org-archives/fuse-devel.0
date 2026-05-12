Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BD639526B
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 19:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778615906; cv=pass; b=LD69CaRsOEHhxuyXbwJ1Xl4otG3S/8Wzh11U2fsjFmrVbOf5fevkykpaS6Y35nicB4kPjZT6iJIJlIuThnYii8mzBilHPIq/wIA8ZsEtCDqcNi6KBvOilbt0RfbVO16LZNgT7P84HeqyL0lXcf9tfYOe+O0RFUtHiMrVfq3QDEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778615906; c=relaxed/simple;
	bh=eZsRUpE9uaSHV1uum4040r8ySWYWpKIbXVa7LjQd64U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ID70F7AYhXKKy764pfwrQ554vLE1c6NR/+EzgR+uKcoFy13WsN82po++Jqk1OmDcmFi6jB7TcAYTbiyotQLKbx1B2brKGQWYdKO11GFrX4eWqZM6hbvQ8Zi4iM+B03mKroxiPSTVkxWe8kIq9l+MYs/WlRYM3//UdYOkpEG7+x8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etOOVbu1; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etOOVbu1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so63115985e9.0
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 12:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778615903; cv=none;
        d=google.com; s=arc-20240605;
        b=l3tO8o8Gm6Qp/NkALiZ24HrogyIPx+kNMwJhlml9SJtYaQIBcj4PI/dY5O/icUTV7H
         8oXluK/74giI8HcJ8hYPYcp3Du8ZhRuz963rIsT5GcH0mIBJKVJ9VEEudZhP12Y2SHEG
         Sqz+3KKQuJJR07vaSM1oUxKmZbEunrHjM7hmO9fC3ltWHad3ipxT9+CMBBTTp6G4x5ez
         g+0SH8imafLxtbSxffRaoIocMmluzj64FAFCeP/J/V/NJ6sx88vh8DGuTu6xr2JXphNA
         GBxDeJUkMtG2yhu6UjalPA7LFog7SiurdtZ9Ppy/YfovZRW72y0RMzJoDf8N+26GzFJN
         4Clw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4dM7/PWHGvTbERh3DskzLzhIjjwPZXY9C2s5LLQFNG4=;
        fh=bBzEraOiW0jzT2TRgJnAfZY2SDwmgOSzsBO4KzoYY+M=;
        b=lSj0xFdPhKPtWnzx5AIuwaF1AajMw02yuu115KFjvhL4q82IIPHu9se59BJfzIRR6j
         NeTqQCOjDMCzMHgtvTY7HchDlu2p7uun7E1g44RqaO9DIpiWzCMjzRfaTjH+bvNMshvN
         fUNV5XyYm9WqiTsOxyve+SZKxYdLeIv3+3Nt7J+nM5QQ1b3ukqKFHa2txTHYMse0Dkok
         CO4ynLc/ljvo/pEjJWjQjGfdYHcm1YfAxWAbZxM/7zSSsUwGI2fblmDDVDtklFb1ad42
         Mst/gyoN4NWPGkNY4Ww98u1qalUVKqvzsgPKpBXtI+suhN25oVHYRa31vUBW13LtubeT
         JQFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778615903; x=1779220703; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dM7/PWHGvTbERh3DskzLzhIjjwPZXY9C2s5LLQFNG4=;
        b=etOOVbu1iyZbRn+WbvF45dNdZXrRbgFgn191Sk1nx5bTYypjoGad6OkwG/acfdnP/w
         kW4sCy+N6tw/DNOKld4bwCanfFaLwl5BjIqTUVm3w6EdaJ5cmofz8QWtKdNiRoVZaGOA
         g90X1uEtmWvdr/G6fbXQU/7gwvkcWty5hyhJeDi5Q2Allo2FddHEugypZb8ydRCJ4CMt
         e72o1hA0iAkYJlQer0f8XkXF3Pot7GIfWg3tD8UfJByCwtNwMkBQx4OYzq/CxJ9YqJ+Z
         lZsnihEJ9Uj50TCRHfA15Dn6597KVdUl4dA9YIZtXOf3nz1V4ey4NamgN6iglMoQqMFC
         drXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778615903; x=1779220703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4dM7/PWHGvTbERh3DskzLzhIjjwPZXY9C2s5LLQFNG4=;
        b=jOYFVdcg9zml3fdlFWHWPixcB6yIQw3d2Evk+nWaB8HMCmjdwzqGQ+H8l0GlhK4460
         wQQX/bbCfkmOVsuwRgob0LqU/eFadeAz5zkErpwQQTPgBr6uFZ+c/Y2BLvtTGItaUACI
         y+Xy2GX1yh/uOFYrJSX/AlGtfllUi2Y8gYQhKQml4vA5jgT85347rmkgq9RLvnHEa2q+
         J+2s5/074rZutUnoILn1r/DaXolD/ZTbUC2ZW9NZBapAkPkn/SzBDErjz1TtHeXSOGms
         313j7c0Cyn6xhFF5v9lSEHpvHaenIPUZM5WfrA/JMj+NsKMw+POjNcLBGamp7kuoiu81
         K2WA==
X-Forwarded-Encrypted: i=1; AFNElJ9cs3z0AoTRw5qLn94/yx2Z49hHBKX21mMITr0uenCSHkYYSBj5Fu/3QvtI25bzgF7TYl5Z7QwuKSDm@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/PgBNegxSIdi6dx2n1I9UFDb6iL3j+GKOEPCw0xlyQfJX8jJN
	YhHOznnwUtFSSgbvdS3ymEBswMvITzSyITIsVBrY7axwTlFfO7gzTK5e/y/Fs0GcVf+xQnbUuin
	/h1YyA/XeWqQrr3Tu1UH6oYrVzS5e+HQ=
X-Gm-Gg: Acq92OHV5caM44Lv12/TIBtKWWf6/p79a/GVlwmOcSPY4nxXneXQiwusxBuRVYpUBzx
	xcyWUmqCZtmCf+I0+tSvV00fzUpWSwZuu4KNpQbSn8VOgZpkeyYVItGdDmGoMzwbFReGzkJGPk7
	km298UvFwRwSYeSb+2xspHzt4hlyG2RMBWqJ3LeH/etE6eSHmTN1UiVJfrdOQ/C6ga78vRChRd7
	a0yFGAYw5BVrNI2EBUBCH1sKOR0sF7ts3X5+s64qsVoYdT9iOVYXdH8+R/DI5Hm10U40Ap1GE9F
	g+cu/A==
X-Received: by 2002:a05:600c:6303:b0:48a:592c:e632 with SMTP id
 5b1f17b1804b1-48fc9a2b921mr4023765e9.16.1778615903001; Tue, 12 May 2026
 12:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331223927.763741-1-quark@lihdd.net>
In-Reply-To: <20260331223927.763741-1-quark@lihdd.net>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 12 May 2026 12:58:10 -0700
X-Gm-Features: AVHnY4Lf4J2P_HObmqP54f52npnAl1v41NlBsMeQRJU1pBGsrfA8cJB17r6iYX8
Message-ID: <CAJnrk1YOzwNRS+qA74rLMFmx=JgE3VVueu9o7-pghsa4bPzYBw@mail.gmail.com>
Subject: Re: [PATCH] fuse: invalidate readdir cache on epoch bump
To: Jun Wu <quark@lihdd.net>
Cc: miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, Jun Wu <quark@meta.com>, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 3:40=E2=80=AFPM Jun Wu <quark@lihdd.net> wrote:
>
> From: Jun Wu <quark@meta.com>
>
> FUSE_NOTIFY_INC_EPOCH invalidates dentries, but does not invalidate cache=
d
> readdir results. A process with cwd inside a FUSE mount can therefore
> observe stale readdir(".") output after an epoch bump.
>
> Fix this by recording epoch in the readdir cache and checking it on reuse=
.
>
> Add FUSE_EPOCH_READDIR init flag so userspace can detect this change.

imo this is more of a fix than a new feature, so I don't think the
changes for adding the FUSE_EPOCH_READDIR init flag is necessary. I
think the Fixes: 2396356a945b ("fuse: add more control over cache
invalidation behaviour") tag fits here.

Other than that, this change makes sense to me.

Thanks,
Joanne

>
> Minimal reproducer:
>
> - mount a tiny FUSE fs with an empty root directory
> - on opendir, enable fi->cache_readdir and fi->keep_cache
> - chdir into the mount and call readdir(".") to populate readdir cache
> - make the FUSE server report one file in the root directory
> - send only FUSE_NOTIFY_INC_EPOCH
> - call readdir(".") again; before this change it stays stale, after this
>   change it sees the new file
>
> Signed-off-by: Jun Wu <quark@meta.com>
> ---
>  fs/fuse/dev.c             | 6 +++---
>  fs/fuse/fuse_i.h          | 3 +++
>  fs/fuse/inode.c           | 2 +-
>  fs/fuse/readdir.c         | 5 ++++-
>  include/uapi/linux/fuse.h | 3 +++
>  5 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 0b0241f47170..595f90f44772 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -2039,9 +2039,9 @@ static int fuse_notify_resend(struct fuse_conn *fc)
>  }
>
>  /*
> - * Increments the fuse connection epoch.  This will result of dentries f=
rom
> - * previous epochs to be invalidated.  Additionally, if inval_wq is set,=
 a work
> - * queue is scheduled to trigger the invalidation.
> + * Increments the fuse connection epoch.  This will cause dentries and
> + * readdir caches from previous epochs to be invalidated.  Additionally,
> + * if inval_wq is set, a work queue is scheduled to trigger the invalida=
tion.
>   */
>  static int fuse_notify_inc_epoch(struct fuse_conn *fc)
>  {
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 7f16049387d1..9b479f597938 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -191,6 +191,9 @@ struct fuse_inode {
>                         /* iversion of directory when cache was started *=
/
>                         u64 iversion;
>
> +                       /* epoch of fc when cache was started */
> +                       int epoch;
> +
>                         /* protects above fields */
>                         spinlock_t lock;
>                 } rdc;
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index c795abe47a4f..5685e696ee2f 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1506,7 +1506,7 @@ static struct fuse_init_args *fuse_new_init(struct =
fuse_mount *fm)
>                 FUSE_SECURITY_CTX | FUSE_CREATE_SUPP_GROUP |
>                 FUSE_HAS_EXPIRE_ONLY | FUSE_DIRECT_IO_ALLOW_MMAP |
>                 FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_ALLOW_IDM=
AP |
> -               FUSE_REQUEST_TIMEOUT;
> +               FUSE_REQUEST_TIMEOUT | FUSE_EPOCH_READDIR;
>  #ifdef CONFIG_FUSE_DAX
>         if (fm->fc->dax)
>                 flags |=3D FUSE_MAP_ALIGNMENT;
> diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
> index c2aae2eef086..240b0e993780 100644
> --- a/fs/fuse/readdir.c
> +++ b/fs/fuse/readdir.c
> @@ -438,6 +438,7 @@ static void fuse_rdc_reset(struct inode *inode)
>         fi->rdc.version++;
>         fi->rdc.size =3D 0;
>         fi->rdc.pos =3D 0;
> +       fi->rdc.epoch =3D 0;
>  }
>
>  #define UNCACHED 1
> @@ -479,6 +480,7 @@ static int fuse_readdir_cached(struct file *file, str=
uct dir_context *ctx)
>                 if (!ctx->pos && !fi->rdc.size) {
>                         fi->rdc.mtime =3D inode_get_mtime(inode);
>                         fi->rdc.iversion =3D inode_query_iversion(inode);
> +                       fi->rdc.epoch =3D atomic_read(&fc->epoch);
>                 }
>                 spin_unlock(&fi->rdc.lock);
>                 return UNCACHED;
> @@ -492,7 +494,8 @@ static int fuse_readdir_cached(struct file *file, str=
uct dir_context *ctx)
>                 struct timespec64 mtime =3D inode_get_mtime(inode);
>
>                 if (inode_peek_iversion(inode) !=3D fi->rdc.iversion ||
> -                   !timespec64_equal(&fi->rdc.mtime, &mtime)) {
> +                   !timespec64_equal(&fi->rdc.mtime, &mtime) ||
> +                   fi->rdc.epoch !=3D atomic_read(&fc->epoch)) {
>                         fuse_rdc_reset(inode);
>                         goto retry_locked;
>                 }
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index c13e1f9a2f12..b0bd96ac1e84 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -240,6 +240,7 @@
>   *  - add FUSE_COPY_FILE_RANGE_64
>   *  - add struct fuse_copy_file_range_out
>   *  - add FUSE_NOTIFY_PRUNE
> + *  - add FUSE_EPOCH_READDIR
>   */
>
>  #ifndef _LINUX_FUSE_H
> @@ -448,6 +449,7 @@ struct fuse_file_lock {
>   * FUSE_OVER_IO_URING: Indicate that client supports io-uring
>   * FUSE_REQUEST_TIMEOUT: kernel supports timing out requests.
>   *                      init_out.request_timeout contains the timeout (i=
n secs)
> + * FUSE_EPOCH_READDIR: epoch bump also invalidates readdir caches
>   */
>  #define FUSE_ASYNC_READ                (1 << 0)
>  #define FUSE_POSIX_LOCKS       (1 << 1)
> @@ -495,6 +497,7 @@ struct fuse_file_lock {
>  #define FUSE_ALLOW_IDMAP       (1ULL << 40)
>  #define FUSE_OVER_IO_URING     (1ULL << 41)
>  #define FUSE_REQUEST_TIMEOUT   (1ULL << 42)
> +#define FUSE_EPOCH_READDIR     (1ULL << 43)
>
>  /**
>   * CUSE INIT request/reply flags
> --
> 2.53.0
>
>
