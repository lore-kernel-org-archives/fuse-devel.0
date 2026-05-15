Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A691F3E9C04
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835218; cv=none; b=QeYtNktFafZeEaqtl7cmNN9N2IOTATqkamTBShfSC+QSlazZ1GJ+0Xs9cE9gBf9N5FVCqKLVl8UOHJg3pwE2Wwt1YppbZ+52pG2g/2PmJbDOUF8CU77WqQexpjoJU8B/nsrTHlxux8e1we82pUydn4WVgOIQ3vI4bWZVKPrI8dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835218; c=relaxed/simple;
	bh=E6N+1BTrvxpkrBusiE3MlS/R7AhKHq/otsglDqe0dvY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pSMoM3+qNj9gPSD2DKufoZirzJwrjzMmPYqAmt5IWemQLk6dvLAfZ/DtU5YkkSH3khdVdFiG6vmCjuyKOx87bIbh8q8tYE4Zi0zYbmVFrURxTQPM0T57w6glmdXJKKq+8Ndt8S12cMBScCydyxj78622d0Zg1cC063uDkZYnnyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=KIxTLRyT; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="KIxTLRyT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HpPv+ZpMXFtdY/G4htYy2Ht8LCKMKn+E53rnG37SiuY=; b=KIxTLRyTxxDS7gASjMU/2OC4PY
	QLyvXDHLCjH55T5RzG+AnICda013faFwkPoGIri8UP+yqw+rzAdpgf436MlcGgOblBQy7hinL9WTh
	lcAhKX8bhKRLwiLPIUB9YyNbI6N5/dajQAQ6c4jx/SZxEUk4wA72n+SP3XqX0w0fMjHFOJg8Kgu/E
	m1rgNONYOX/o9XeFBDbXDvZo4A6CCgbsIKMGSaXy/lw5fPUlhNJQUFBGw4GWytA/ezEAw5Y6XSIM8
	YurKbnv98ytmDE1I+Fdf18ozAywNtwmP8+Ej6carqpFAQUEyfw1148Fc4mgiGCJ5Ry59K3R5Tpjin
	8G8aaIug==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wNoIO-000R7c-FH; Fri, 15 May 2026 10:53:24 +0200
From: Luis Henriques <luis@igalia.com>
To: Jun Wu <quark@lihdd.net>
Cc: fuse-devel@lists.linux.dev,  miklos@szeredi.hu,  Jun Wu <quark@meta.com>
Subject: Re: [PATCH v2] fuse: invalidate readdir cache on epoch bump
In-Reply-To: <20260515001412.1270472-1-quark@lihdd.net> (Jun Wu's message of
	"Thu, 14 May 2026 17:14:12 -0700")
References: <20260331223927.763741-1-quark@lihdd.net>
	<20260515001412.1270472-1-quark@lihdd.net>
Date: Fri, 15 May 2026 09:53:27 +0100
Message-ID: <8733ztt5o8.fsf@igalia.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 14 2026, Jun Wu wrote:

> From: Jun Wu <quark@meta.com>
>
> FUSE_NOTIFY_INC_EPOCH invalidates dentries, but does not invalidate cached
> readdir results. A process with cwd inside a FUSE mount can therefore
> observe stale readdir(".") output after an epoch bump.
>
> Fix this by recording epoch in the readdir cache and checking it on reuse.
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
> Fixes: 2396356a945b ("fuse: add more control over cache invalidation beha=
viour")
> Signed-off-by: Jun Wu <quark@meta.com>

Nice catch!  The fix looks good to me, so feel free to add my

Reviewed-by: Luis Henriques <luis@igalia.com>

Cheers,
--=20
Lu=C3=ADs

> ---
> Changes in v2:
> - Addresses Joanne Koong's suggestions:
>   - Drop the FUSE_EPOCH_READDIR init flag.
>   - Add Fixes tag.
> - Rebase onto current mainline.
> ---
>  fs/fuse/dev.c     | 6 +++---
>  fs/fuse/fuse_i.h  | 3 +++
>  fs/fuse/readdir.c | 5 ++++-
>  3 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 5dda7080f4a9..35e04b064f37 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -2038,9 +2038,9 @@ static int fuse_notify_resend(struct fuse_conn *fc)
>  }
>=20=20
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
> index 17423d4e3cfa..aa8d6dfbbcc7 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -191,6 +191,9 @@ struct fuse_inode {
>  			/* iversion of directory when cache was started */
>  			u64 iversion;
>=20=20
> +			/* epoch of fc when cache was started */
> +			int epoch;
> +
>  			/* protects above fields */
>  			spinlock_t lock;
>  		} rdc;
> diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
> index db5ae8ec1030..b18d971e2bb4 100644
> --- a/fs/fuse/readdir.c
> +++ b/fs/fuse/readdir.c
> @@ -442,6 +442,7 @@ static void fuse_rdc_reset(struct inode *inode)
>  	fi->rdc.version++;
>  	fi->rdc.size =3D 0;
>  	fi->rdc.pos =3D 0;
> +	fi->rdc.epoch =3D 0;
>  }
>=20=20
>  #define UNCACHED 1
> @@ -483,6 +484,7 @@ static int fuse_readdir_cached(struct file *file, str=
uct dir_context *ctx)
>  		if (!ctx->pos && !fi->rdc.size) {
>  			fi->rdc.mtime =3D inode_get_mtime(inode);
>  			fi->rdc.iversion =3D inode_query_iversion(inode);
> +			fi->rdc.epoch =3D atomic_read(&fc->epoch);
>  		}
>  		spin_unlock(&fi->rdc.lock);
>  		return UNCACHED;
> @@ -496,7 +498,8 @@ static int fuse_readdir_cached(struct file *file, str=
uct dir_context *ctx)
>  		struct timespec64 mtime =3D inode_get_mtime(inode);
>=20=20
>  		if (inode_peek_iversion(inode) !=3D fi->rdc.iversion ||
> -		    !timespec64_equal(&fi->rdc.mtime, &mtime)) {
> +		    !timespec64_equal(&fi->rdc.mtime, &mtime) ||
> +		    fi->rdc.epoch !=3D atomic_read(&fc->epoch)) {
>  			fuse_rdc_reset(inode);
>  			goto retry_locked;
>  		}
> --=20
> 2.54.0
>
