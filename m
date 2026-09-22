Received: from mail-ej2-f20.google.com (mail-ej2-f20.google.com [74.125.228.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4977F5349A5
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.148
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072981; cv=pass; b=JbN3V8LJtR3RDMR6Hf6O8hNkRZdw5yihjVb1Uspf74OydCcE/uPAAh5eDuXmTMBB3DyZZ1XjsdeujSEoXLn9dAlvBKTfoqrJ/Diw06LIR8gblnOLPdgx/gnfPCYWBLrsb17noHccy8OKQpb8pomJew5biMp+12vPlCgxh9eMPBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072981; c=relaxed/simple;
	bh=UD18uYhH60fJU6GHgS+UlvpIDz8DNzsg3ljrmQlsV7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOTaXyPTCfTu9abCL6FBN5iM+NhvAOzHaQK/CVdot031uqD/PNhRu0zLASce3iocToKv7V/6vSFg1sSvI2gfHXLHNRGzQIFps6+Ao00+gCb/4BvqApR25iJQOeBMLIjGiXP2WkZ+wOuzg+sU1plzuo/aZLQfWUeoB0/lWkzJWVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ih3yVxTc; arc=pass smtp.client-ip=74.125.228.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ih3yVxTc"
Received: by mail-ej2-f20.google.com with SMTP id a640c23a62f3a-c293c683202so581085366b.3
        for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 03:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790072977; cv=none;
        d=google.com; s=arc-20260327;
        b=O/I6MMotiAaz5dmddzDZNkVqjG0Wu3HMcn7YZnALWWLr/aiv3NM2bpr1GXop7ONFsk
         F37Q/JQoLw1fnfs6ESAYkzx87zJogd7a5755fIQAr/n6maYKVVyu3nqlbscEyj033IU4
         fThMujSFsouTl6Rldj1/OJOwq8gnEjGC+sjZz2BQG70RygO3R10shvLAnHZS63rFZ7ah
         6gj2oaAICoRjRx4xOpkxoNZmpN6JGs/4umTa28tKaYIAUnjvmM11dlwGDg3CgCrOvPHC
         gac/OXm94O2FFkBsi7QWtVkyQlIlPAsch20ZhYFlc9hh75LCuVlZOl7JAgvQxqPyIg0v
         0dAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AS3ZtXtMk7I3MENDezQyEze7xKWpyxyRkOUSop08srI=;
        fh=LSGkIxL+7O1MPXHhjOsZelXZcZzf1zyb+22wAIOwAjQ=;
        b=Jp7TNdEHctGCwrztyjmQVO7+O2SZT8ivZPn3gph1Z/BHTG1VLHxHFAeRjgWoXBXr6r
         Xx5WqtDQ4P5Dsik6iglr2dCUlr5aNnTeBbCap2Ayl9e7JvuYmVcKwJJWs6+5ENkggkBd
         IPJEI+mB6OEI9yfLAvB2dgaM6ojeYxCGJ7TxlMAH07gek/BerAG0yoj9xDgbi+3d0+8b
         MiIQYtJsfLthBzQ1lq8vqqEwhHCYSki+zGBo5WmLLWS8jNHfXBmMRQYL5HN4MUhBksK7
         MgRCF5d6u/creUg8Lwh83E6zs1Q8BE7EfriDa+UIms3Py8hc9XICotmfEAwYtmfaWOpl
         aimQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790072977; x=1790677777; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AS3ZtXtMk7I3MENDezQyEze7xKWpyxyRkOUSop08srI=;
        b=Ih3yVxTcKa2UUxhm6LFjpkhXoEh22iLvuRFCLvq50i+/r+hixkwcGC/lhOm7ilW7hn
         1g6V2XUKg3WY+SUh28K8cj4mqqyJXBcXNyy9E97s21qs4VjV9px80mWSN7Poan6irDZ7
         BH3f2a6Zf/noHQE2LhGTNPrL4+lIjeaLxNBO9JWQK+cFI8rjT4plsQfr+vL/2JfgUuOH
         ArEUqz41iQ8YcZub1kwwH8gx+BDh9Vm1Jncr0G/dmSoyfKW1PjFKqOm/daa+gw1YqriQ
         PnUVtjnVzd5lNkjF6K5bE/7JDj6luRwIzKN6D4dCcHhqliQ4SOui6MC9Cs72Ahlyq8F2
         oZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072977; x=1790677777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AS3ZtXtMk7I3MENDezQyEze7xKWpyxyRkOUSop08srI=;
        b=FByanJSzfs9wxOoQCBWNn6iiHZh7V88BrdU8VY8kVKra+NDD0J1gxHzp8Xzn5dVY1g
         2ix4pz7r7fLUE3yEBgcQKA81dBgIzXJCuhbtu4AIearDnd2mHBSySdC3jxY8jker+9Gf
         Ca4sb3+sJrKSrsPiP2P+wt51juYsZeSBTqimcbRFEfxd+fSmZNrDq/2J3LTvrUXnYVJ/
         fieuzbuC9h574RveE9izIxXioE/VOs5VRhfG0dVRSUxrEepUu5ZTFXtDiyHwDHSHxGLA
         0OvMCgRQ9r4lZNDThdu29CqX5HbDpr+uUX9yRiKYmGxcasm0CZsvantnksQzVpTui9WU
         kmTQ==
X-Gm-Message-State: AFuF++lE6H/ABo9lBEmrX9+rfDMRilnLYvz61UP8JiOzlpQeSwf6hFoZ
	x2y2bndWckOFYCYw+1kNZmocudyhXXfJDK5v1v4XQ8O+YfyAHXMHPdtoPHFYe8yZ84welAemaSA
	H2f2Y2Z1fgMKyprULru7eLRLxJBB/BRk0DOr3jwk=
X-Gm-Gg: AYBFou1LQ0BdUVH5L6whYOnMifQw8S4Crror8hrk+8bYDZn2EF8zQumtlFnxrrFtLF+
	oIxzi/MU5n0DOHp8RJRvyyfkzFSawYyYw2VJsc/Pcqmjf6Relu7Bi2Pte/UaEUPBD1WObT0GLPJ
	FQ1e4+R5HYs72c9WjMQxIHCOE3bLQDLMgnL7Ks7uRYUsiISMLgwhlIZpfDx63WKdcAvGM+OWyIt
	39uL8qySP6YHlKCU319HKmjPHnJx86nCOshH5LPEt5fjHQp/e7aTh5KNGIZkQGXZsk9//DISRhL
	vTEv6ZvDK+skg3qh10Olf2WWZBDUwcdEp+BWly79ufohL4zJSu6DqqDZvw==
X-Received: by 2002:a17:907:9481:b0:c29:3c21:ee69 with SMTP id
 a640c23a62f3a-c2a15cdbee1mr1152600466b.23.1790072976990; Tue, 22 Sep 2026
 03:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-7-mszeredi@redhat.com>
In-Reply-To: <20260922061019.3320196-7-mszeredi@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 22 Sep 2026 12:29:25 +0200
X-Gm-Features: AcwNN1X5x-VbPUzN3XuBOpjc6l0CLw-zoH5WXzQ134I5Qh6gopIuLOkE3c3PNVk
Message-ID: <CAOQ4uxjhfjmohwKV+spfy6+WmvpGSduB+1wE+htP-hgwtSJSNA@mail.gmail.com>
Subject: Re: [PATCH 06/11] fuse: support 64 bit, server allocated backing ID
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> Add support for server allocated 64-bit backing IDs alongside the
> existing kernel allocated 32-bit IDs.
>
> Opened with FUSE_DEV_IOC_BACKING_OPEN, but the backing ID is sent via
> fuse_backing_map.backing_id, with FUSE_BACKING_ID_64 being set in .flags.
>

As I wrote you off-list, I prefer that the new implementation is gated at i=
nit
time with FUSE_PASSTHOUGH_V2 and then we assert that all API is using
either 32 or 64 bit.

> Closed with FUSE_NOTIFY_BACKING_CLOSE.  Since close only provides the
> backing ID, not the file descriptor, it doesn't have to be done with an
> ioctl.
>
> All 64 bit values are valid.

I prefer that we reserve 0 backing_id for future use as we did with
the 32bit id.
Its intended purpose was for OPEN reply to mean "passthrough to the pre
attached backing inode".

Also, my plan is for a mode PASSTHROUGH_INO which has an
identity backing_id =3D=3D nodeid (and probably also =3D=3D ino) so 0 value
does not fit into this plan.

>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/backing.c         | 121 +++++++++++++++++++++++++-------------
>  fs/fuse/dev.c             |   2 +-
>  fs/fuse/dev.h             |   2 +-
>  fs/fuse/fuse_i.h          |  13 +++-
>  fs/fuse/notify.c          |  23 ++++++++
>  fs/fuse/passthrough.c     |   2 +-
>  include/uapi/linux/fuse.h |  19 +++++-
>  7 files changed, 133 insertions(+), 49 deletions(-)
>
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index 433fa3098d71..58dbdd17c1ef 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -9,6 +9,7 @@
>  #include "fuse_i.h"
>
>  #include <linux/file.h>
> +#include <linux/rhashtable.h>
>
>  static struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
>  {
> @@ -33,11 +34,6 @@ void fuse_backing_put(struct fuse_backing *fb)
>                 fuse_backing_free(fb);
>  }
>
> -void fuse_backing_files_init(struct fuse_conn *fc)
> -{
> -       idr_init(&fc->backing_files_map);
> -}
> -
>  static int fuse_backing_id_alloc(struct fuse_conn *fc, struct fuse_backi=
ng *fb)
>  {
>         int id;
> @@ -53,38 +49,42 @@ static int fuse_backing_id_alloc(struct fuse_conn *fc=
, struct fuse_backing *fb)
>         return id;
>  }
>
> -static struct fuse_backing *fuse_backing_id_remove(struct fuse_conn *fc,
> -                                                  int id)
> -{
> -       struct fuse_backing *fb;
> +static const struct rhashtable_params fuse_backing_params =3D {
> +       .head_offset =3D offsetof(struct fuse_backing, hash_node),
> +       .key_offset =3D offsetof(struct fuse_backing, backing_id),
> +       .key_len =3D sizeof_field(struct fuse_backing, backing_id),
> +};
>
> -       spin_lock(&fc->lock);
> -       fb =3D idr_remove(&fc->backing_files_map, id);
> -       spin_unlock(&fc->lock);
> -
> -       return fb;
> +int fuse_backing_add_64(struct fuse_conn *fc, struct fuse_backing *fb)
> +{
> +       return rhashtable_insert_fast(&fc->backing_64_ht, &fb->hash_node,=
 fuse_backing_params);
>  }
>
> -static int fuse_backing_id_free(int id, void *p, void *data)
> +static struct fuse_backing *fuse_backing_id_remove(struct fuse_conn *fc,=
 u64 id, bool is_64bit)
>  {
> -       struct fuse_backing *fb =3D p;
> +       struct fuse_backing *fb;
> +       int err;
>
> -       WARN_ON_ONCE(refcount_read(&fb->count) !=3D 1);
> -       fuse_backing_free(fb);
> -       return 0;
> -}
> +       guard(spinlock)(&fc->lock);
> +       if (!is_64bit)
> +               return idr_remove(&fc->backing_files_map, id);
>
> -void fuse_backing_files_free(struct fuse_conn *fc)
> -{
> -       idr_for_each(&fc->backing_files_map, fuse_backing_id_free, NULL);
> -       idr_destroy(&fc->backing_files_map);
> +       fb =3D rhashtable_lookup_fast(&fc->backing_64_ht, &id, fuse_backi=
ng_params);
> +       if (!fb)
> +               return NULL;
> +
> +       err =3D rhashtable_remove_fast(&fc->backing_64_ht, &fb->hash_node=
, fuse_backing_params);
> +       WARN_ON(err);
> +
> +       return fb;
>  }
>
>  int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map=
)
>  {
>         struct file *file;
>         struct super_block *backing_sb;
> -       struct fuse_backing *fb =3D NULL;
> +       struct fuse_backing *fb;
> +       bool is_64bit =3D map->flags & FUSE_BACKING_ID_64;
>         int res;
>
>         pr_debug("%s: fd=3D%d flags=3D0x%x\n", __func__, map->fd, map->fl=
ags);
> @@ -95,7 +95,10 @@ int fuse_backing_open(struct fuse_conn *fc, struct fus=
e_backing_map *map)
>                 goto out;
>
>         res =3D -EINVAL;
> -       if (map->flags || map->padding)
> +       if (map->flags & ~FUSE_BACKING_ID_64)
> +               goto out;
> +
> +       if (!is_64bit && map->backing_id !=3D 0)
>                 goto out;
>
>         file =3D fget_raw(map->fd);
> @@ -120,9 +123,13 @@ int fuse_backing_open(struct fuse_conn *fc, struct f=
use_backing_map *map)
>
>         fb->file =3D file;
>         fb->cred =3D get_current_cred();
> +       fb->backing_id =3D map->backing_id;
>         refcount_set(&fb->count, 1);
>
> -       res =3D fuse_backing_id_alloc(fc, fb);
> +       if (is_64bit)
> +               res =3D fuse_backing_add_64(fc, fb);
> +       else
> +               res =3D fuse_backing_id_alloc(fc, fb);
>         if (res < 0) {
>                 fuse_backing_free(fb);
>                 fb =3D NULL;
> @@ -138,24 +145,19 @@ int fuse_backing_open(struct fuse_conn *fc, struct =
fuse_backing_map *map)
>         goto out;
>  }
>
> -int fuse_backing_close(struct fuse_conn *fc, int backing_id)
> +int fuse_backing_close(struct fuse_conn *fc, u64 backing_id, bool is_64b=
it)
>  {
>         struct fuse_backing *fb =3D NULL;
>         int err;
>
> -       pr_debug("%s: backing_id=3D%d\n", __func__, backing_id);
> -
> -       /* TODO: relax CAP_SYS_ADMIN once backing files are visible to ls=
of */
> -       err =3D -EPERM;
> -       if (!fc->passthrough || !capable(CAP_SYS_ADMIN))
> -               goto out;
> +       pr_debug("%s: backing_id=3D%lld\n", __func__, backing_id);

%llu

>
>         err =3D -EINVAL;
> -       if (backing_id <=3D 0)
> +       if (!is_64bit && (backing_id =3D=3D 0 || backing_id > INT_MAX))
>                 goto out;
>
>         err =3D -ENOENT;
> -       fb =3D fuse_backing_id_remove(fc, backing_id);
> +       fb =3D fuse_backing_id_remove(fc, backing_id, is_64bit);
>         if (!fb)
>                 goto out;
>

       fb->backing_id =3D 0; // mark orphan fb

Because ff->passthrough may still refer to this fb and tracing/debug
may be printing this backing_id which can now be reassigned.

Thanks,
Amir.
