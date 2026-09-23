Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63021439F7E
	for <fuse-devel@lists.linux.dev>; Wed, 23 Sep 2026 05:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142077; cv=pass; b=FdsglRhViz7mNNA+BEh7gP7yodThqRucYukPEar+TGH5AFDr4sjGrxAERBpL1fA38MhCCSKHEdSbtKSrwQ11XFTOVDfrJcEXxqUnRFufJaxv9HXZm7XXxgXxa5jvVe6rscXZVQv2Ytf7ySkWlMZrnJovCcTBZEISkYhj8llHZbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142077; c=relaxed/simple;
	bh=6NayoGht7N7oi+9XCgntqp3ykFEWf36bhXF3FqokMH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RGmqdxiyD2FLC/LbNSOU/IFpCeKZQNCM8P4bhf2wcZNgLublxaI/NhW2DUqzvLrA5c4jU++i/Uzp7VybJpJm2BsDCV6qFhfkO7VFyuWhvPF5O+Y5DNrL5bMZ7GCgvu6LUhmWAJPCNmxWz+NZHJqJvw8aUemRo4UfbOxU+rR2mkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsEPT15q; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsEPT15q"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso1045477a12.2
        for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 22:41:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790142073; cv=none;
        d=google.com; s=arc-20260327;
        b=paHcrRQiZBLiunu2D9OcTBTR8xddLJS+a19U2abz7ckVBar6pgawDBuNsWcbWwzy8Y
         sPBWlaBHzIlJF5v9mRr9O1Yio3vEtWDKMbi/8e4x5FhpMPS55a11PGbGIccBDYvdum9A
         Lc2Yb3X127fEQ3/PYzFWjjkZgYoIa6nK/8jN1XoWEtZ5eBGiLKdWAGxf5HypEH9p7XIw
         g/ZsUKSaDWe5fN5CcJmCZ81vtLQjBhQusN06QE3fDmeCugbn2OUIodEiOO+SEs4m+52E
         kK2ybNOzX7Btxv/macQ4S76n+Q8MGZblARSrw6VgfiYH5JYcFUU6GCCI7viIVLvVYQHX
         UPqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bcSIVAHCndhjWZKH9mIm00dcM1whQDZA38Fiu4ms+Xk=;
        fh=LSGkIxL+7O1MPXHhjOsZelXZcZzf1zyb+22wAIOwAjQ=;
        b=p6/qcI0+gn786iwXGENqtJqKpMN1Vy5aYLLoibxVinpyBENyOFDhyJZesha6WttmpI
         v/FlrpHEjD6phrDvJmbMCeyyYbd09nj18YLVOejPSziewYRUbvpUbcoOg3bNcFbx1uKv
         goqKMknFiNWnyvJEEoZexUq4I7U2X8GkVF5zl2Fqv2JfHEWHzGJHkSQWBJWRvvMwEHTO
         t1/pOj/Uh/Saj/aBrvXiu9KkihV9QhyIOOdAVRqNWXw1EUAuTaEv3UOmBtqGOPyHnoU9
         imdittR0huseKphg5xclYIxbu6+LzJdzQIzucpPGB+TT6pLczUF1hccFLYMtaGc7NT12
         s+LQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790142073; x=1790746873; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bcSIVAHCndhjWZKH9mIm00dcM1whQDZA38Fiu4ms+Xk=;
        b=EsEPT15qsiDMNQcG5b7oFgJGPXzASQwNrr6GX1/Cl47so0wwA03JmIBaeWuLIx/NjW
         GcGS8kNONFG4iyewbMrFHRaZmFqIkpOk9pPr9EdPwDhPWhjqp0IwMh6xgApO9kS41NXx
         CliB1y10k0BD87L8mSZ3bDZpEmHjT7AV3pcGc59ETMU9K2vR3RK1pitfrutwOYvn8vdl
         chBphSYVEyPOf/ZzzFjQ7LDExf7HxSURm1lVlLfbdPMStkxoP8CeLCfeOciMIAC0CN5n
         NssS5mH9vQa0HTHit8Bisu+SIurEy7q+U52PIcVERpOnktD2bFWUbEnV83wtfn69oK1C
         WEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142073; x=1790746873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcSIVAHCndhjWZKH9mIm00dcM1whQDZA38Fiu4ms+Xk=;
        b=AO0GhXEr3BIA8rf+vosnUxvyOMc/0m6LhLC+1LIETCLkoFeM0JHPhutyNgT1ukxbFa
         l/+55ksUF8mHSEA4yh9GdAtWwJP7QgLTIQMOJ9PWC4tN9BHi7slptibs7s1VcA+PtG2I
         8o43xHOsNRkL4AmuLrCvu+L595YwgAOgLajNNsC+yaDEsvextSTFSylTgjo+TcmTN0X0
         vR4Ietx9lTeQ959jpnBXxC/b5stY62gt/IUZZUC0yjIxjsg4MXkmIObzzvNGFIF3crwN
         RMdiBcsRKRsQZ38FtN0i6ViHl9kBmfgIh4gQuEH1knqTc4xuKDMhIbTLiuerAcExp/my
         zj4w==
X-Gm-Message-State: AFuF++keT66kuP30tVEAuKAimR2xLu/KMkyRhL7oNGGZ4/1mTWtSxMQ6
	6gVbp7HIfJOOXncnkaujGXAdsNFouLReiR6sMzN83ynTHUqn3jedKlelg2Z/gvcQUcb3B1W0O0A
	+07oBKd4x510wSOa35prEBK+D9VeRqIc=
X-Gm-Gg: AYBFou0THSDLfYXjGCZt/Kdfb4P0o3S9peqfL//8D78iJmvqFWqfTWtOWUl9PAQzZZp
	AJuz7afXqJznXYYCXfW17RwwD7vpEu2yKMo9dOkchQkG4J8sbKu/D2M6stv0w5yMAPyr2bdQFY5
	AGU1odYRNyMBorDBiu3Lwx7qGb/nakQmgNyCI/kQhHH7ivA36MZdnOhBB6/Fj1nZEA9Z6++j+/F
	+zZbhakyL1xn0J7zluxx9OepHElJZi69PGMmTp8c8vSC09N4dDchhhS14eYNBY3vUVc4NkXZD5S
	8IAIbQbhWpQznAACqhIDp0mpYBd89s9QUkzLwUzgOm9V648sv1D1YN2/
X-Received: by 2002:a05:6402:4510:b0:6a1:4458:7f2d with SMTP id
 4fb4d7f45d1cf-6aab3b0073bmr1196309a12.5.1790142073002; Tue, 22 Sep 2026
 22:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-12-mszeredi@redhat.com>
In-Reply-To: <20260922061019.3320196-12-mszeredi@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 23 Sep 2026 07:41:01 +0200
X-Gm-Features: AclHuK-t6T8Em-oFketu00OCApd1FACMondLpe47NyGIr8bLxL5heC6XV34GjS8
Message-ID: <CAOQ4uxiP74OjL2tG15YrYQK8xnvRoshVdC9iJ+xs=xGcM-Ux_A@mail.gmail.com>
Subject: Re: [PATCH 11/11] fuse: add support for striped backing
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> Add the FUSE_MAP_CYCLIC flag for FUSE_NOTIFY_MAP notifications to enable
> creating striped maps.
>
> This is just a set of regular extents that repeats after the end of the
> last extent using a striping pattern (i.e. on the target backings the
> stripes have a contiguous footprint).
>
> Two additional limits apply compared to non-cyclic extent map population:
>
>  - the size of the extents (chunk size) must be equal
>
>  - the extents must start from zero offset and follow the previous withou=
t
>    one with a gap.

some mixup here -
follow the previous one without a gap
I presume

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/ext_map.c         | 27 ++++++++++++++++++++++++---
>  fs/fuse/fuse_i.h          |  1 +
>  fs/fuse/notify.c          |  2 +-
>  include/uapi/linux/fuse.h |  4 +++-
>  4 files changed, 29 insertions(+), 5 deletions(-)
>
> diff --git a/fs/fuse/ext_map.c b/fs/fuse/ext_map.c
> index c752b6ef0686..52f3fb0bb571 100644
> --- a/fs/fuse/ext_map.c
> +++ b/fs/fuse/ext_map.c
> @@ -101,12 +101,18 @@ static int fuse_ext_map_iomap_begin(struct inode *i=
node, loff_t offset, loff_t l
>  {
>         struct fuse_backing *fb =3D fuse_inode_backing(get_fuse_inode(ino=
de));
>         struct fuse_iext *fie;
> +       u64 ncycle =3D 0, seq_off =3D 0, addr, tmp;
>         loff_t ext_len;
>
>         if (!fb || fb->type !=3D FUSE_BACKING_EXTMAP)
>                 return fuse_EIO("missing or wrong type backing");
>
> -       fie =3D fuse_find_extent(&fb->extents, offset);
> +       if (fb->cycle_length) {
> +               ncycle =3D offset / fb->cycle_length;
> +               seq_off =3D ncycle * fb->cycle_length;
> +       }
> +
> +       fie =3D fuse_find_extent(&fb->extents, offset - seq_off);
>         if (!fie)
>                 return fuse_EIO("missing mapping");
>
> @@ -119,9 +125,12 @@ static int fuse_ext_map_iomap_begin(struct inode *in=
ode, loff_t offset, loff_t l
>         }
>
>         ext_len =3D fie->end - fie->start;
> +       addr =3D fie->backing_offset;
> +       if (check_mul_overflow(ncycle, ext_len, &tmp) || check_add_overfl=
ow(addr, tmp, &addr))
> +               return fuse_EIO("extent address overflow");
>
> -       iomap->offset =3D fie->start;
> -       iomap->addr =3D fie->backing_offset;
> +       iomap->offset =3D fie->start + seq_off;
> +       iomap->addr =3D addr;
>         iomap->length =3D ext_len;
>         iomap->dax_dev =3D fie->backing->dax_dev;
>         iomap->type =3D IOMAP_MAPPED;
> @@ -231,6 +240,7 @@ int fuse_ext_map_populate(struct fuse_conn *fc, struc=
t fuse_notify_map_out *arg,
>         struct fuse_backing *fb;
>         unsigned int i;
>         int err;
> +       u64 chunk_size =3D 0;
>
>         if (!arg->num_extents)
>                 return fuse_EIO("no extents");
> @@ -248,7 +258,18 @@ int fuse_ext_map_populate(struct fuse_conn *fc, stru=
ct fuse_notify_map_out *arg,
>                 return -EINVAL;
>         }
>
> +       if (arg->flags & FUSE_MAP_CYCLIC) {
> +               chunk_size =3D ext[0].length;
> +               err =3D -EINVAL;
> +               if (check_mul_overflow(chunk_size, arg->num_extents, &fb-=
>cycle_length))
> +                       goto err_put;
> +       }
> +
>         for (i =3D 0; i < arg->num_extents; i++) {
> +               err =3D -EINVAL;
> +               if (chunk_size && (ext[i].offset !=3D chunk_size * i || e=
xt[i].length !=3D chunk_size))
> +                       goto err_put;
> +
>                 err =3D fuse_add_extent(fc, &fb->extents, &ext[i]);
>                 if (err)
>                         goto err_put;
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 50b61e16a15f..a34db4ad4bc4 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -114,6 +114,7 @@ struct fuse_backing {
>                 };
>                 struct {
>                         struct rb_root extents;
> +                       u64 cycle_length;
>                 };
>         };
>         u64 backing_id;
> diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
> index ce6d85834ea5..cbaa953e9db5 100644
> --- a/fs/fuse/notify.c
> +++ b/fs/fuse/notify.c
> @@ -453,7 +453,7 @@ static int fuse_notify_map(struct fuse_conn *fc, unsi=
gned int size,
>         if (outarg.reserved[0] !=3D 0 || outarg.reserved[1] !=3D 0)
>                 return -EINVAL;
>
> -       if (outarg.flags & ~FUSE_MAP_BACKING_CREATE)
> +       if (outarg.flags & ~(FUSE_MAP_BACKING_CREATE | FUSE_MAP_CYCLIC))
>                 return -EINVAL;
>
>         ext =3D kvmalloc_objs(*ext, outarg.num_extents);
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 5368889710c7..c100e6d78f7e 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -259,7 +259,7 @@
>   *  - add backing_id to fuse_backing_map
>   *  - add FUSE_BACKING_IS_DEV (fuse_backing_map.flags)
>   *  - add FUSE_BACKING_ID_64 (multiple structs)
> - *  - add FUSE_MAP_BACKING_CREATE (fuse_notify_map_out.flags)
> + *  - add FUSE_MAP_CYCLIC, FUSE_MAP_BACKING_CREATE (fuse_map_out.flags)
>   */
>
>  #ifndef _LINUX_FUSE_H
> @@ -1225,8 +1225,10 @@ struct fuse_notify_backing_close_out {
>   * notify_map flags
>   *
>   * FUSE_MAP_BACKING_CREATE:    create backing with the supplied ID
> + * FUSE_MAP_CYCLIC:            map repeats after last extent
>   */
>  #define FUSE_MAP_BACKING_CREATE        (1 << 0)
> +#define FUSE_MAP_CYCLIC                (1 << 1)
>
>  struct fuse_notify_map_out {
>         uint64_t        backing_id;
> --
> 2.54.0
>
