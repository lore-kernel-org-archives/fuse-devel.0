Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A0554145D
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 12:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081849; cv=pass; b=CXD+xVlvJpgsArNB/mPNwThk3Lljy4+ElRQGEyO6rebMXDso4DML0IxOZsvVQEQhOC0B8Q9bP0fOTePiq+KTpgexStey1CKH+B/HLbAzH2OxAtP2tdAOAlFzNH+DP4rf6obfc1bSO3Mmi1IxuPUrupAtEWSozyX9cvrD/JQLZZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081849; c=relaxed/simple;
	bh=sBcO8hbdRGKaKsQ4opUvksgm4AOFNpPq7fNfpyY5zQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1Ox8o5vijEincEFJfs60cXi/TdfZOcU4oQ0XhIoVXXP9+TFDWy8jQI/gSBp9iFLig7EaZRaCi2WKczm/y+etij3bftYsHrVCFJa8EoQoMA1Kbn9KQix8OGHVSJnUOLnacmtpa7YD4RBV1/TCx4fJI5ipdeACZUep1psgpYk9MM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e02Y3uXn; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e02Y3uXn"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a4aso501875766b.0
        for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 05:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790081846; cv=none;
        d=google.com; s=arc-20260327;
        b=r6eImSwrZhTntEjgF0Th9fYD4k6NOOPKn8M35UNgpcDflib75RhxH9YLA6aOagERgc
         8P47xdUvIkyF0i21eOLlpdJJVG0SwvpJvt+3o66uGF4zXQds8TVZRb9Kr5KO233tKq6m
         e0ZcFu1+dOykgh57OHUO3xU7tNcfUJd43MIf98anbyx0o9a24oqU5VNUNI+q4ObmuPaI
         9JwTlnxa+ntqoilNyFfd50iVWWertEWUCMx7hd3D9Z/quVHkq09QXsoZOUTsGg37y4Zr
         gVuisuON4oL5P3SeCa2Bd3gtZEsRXEA8k/IYbujRKTBObvq+z8ZSNrBxoWfyetfObyCg
         PZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FVhFZXcpEKKHbrkTRm7LNUgkl+5hcPxgPPTbdt7OGYA=;
        fh=LSGkIxL+7O1MPXHhjOsZelXZcZzf1zyb+22wAIOwAjQ=;
        b=ouP5RtdAP2jnVSzOxfSMBMz07xT+YbbXro6JDS0iObCteDtME0VnNye8Yti8U6cfwk
         Zd+1bt1O7GD6lj7kYAmW6NdCWUoJK9Aha22fj/EY/gCGCFCCsSefEKOhTy+2TGVQSvIk
         NPzxcv+a021DiEmQFHZm0pXltuN26xyTxNUE2/aPoIg5E+X0zCWxPYX0voeL+PSvyq8V
         qsNiiz6bUOtn0mT9VCmCZC7NT3nN/bkJR5jWbO5sSIG1HpGXmgz36HSrjKYrisnRzlj+
         ycTP5C+5UQCVjSrL/4D4Emkd3qXe9iPOge57kyIQL3taX3+wTgsNLcU94ZKDi0xyzHbZ
         Ctzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790081846; x=1790686646; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FVhFZXcpEKKHbrkTRm7LNUgkl+5hcPxgPPTbdt7OGYA=;
        b=e02Y3uXnp1Mt5Zaf+anbUUeNsct14pHnSUvCnysOjAcP/9QHhspO/QObuk3RaUkHkU
         RRooiVmG9UnXP91z0FuoU2umlsgkuDIK3WV9eHKIaUVJvJstAd5+rZcmHntFNwztjrzQ
         ifMhQnWnwilrpCWya0vkZc6z3wY0J2bckPrjIzJT5t2w9MqVid0969BOjFBwcADwpu8K
         cNsoLTm0PaOwskNTX7dsqndKWG+wv9Ou9m8t5oMOh/HJ0jVAb1jANjJuSWSfe52y2z8t
         J5HptFjkBOo3vVr5blYtIr/9ROeuy7WVHLgQnsNozbSVA5wyo/X0bEMrRd9jU8y+vHKm
         fw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081846; x=1790686646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FVhFZXcpEKKHbrkTRm7LNUgkl+5hcPxgPPTbdt7OGYA=;
        b=dJn/axpBY3UkGuqWyFPNj/tYLxty1cMSN0g3e+mlF9u43cszstcbyBINJd+E62Th6C
         mebI3A3GcAWDzhtpQIL495dcLZ/8IHLY54KKTWtASmhsc80bmykGfCW3T4ygfes2Y5IT
         sIixQq1b5Yvv5KW3wzRLGKvPm9NMGYCC4hCvby1R7g8vKHhI9Nx6vnI4+M/sOn767PQG
         pZJSffwtxz99arcedQWZ0bGmGs2nH6p1ZOvf8tWVVhwu0savk0nvat55tlMkx1EcE8/b
         +8t9KtxBpqDTc8GtwbAGwX/g6DJTDCrZPaH5ZVuz8nOfauCtowIpgSUvI1Kh5PDmej3F
         ltGQ==
X-Gm-Message-State: AFuF++nwaSmcHZmEwtvMm4ugX0WV7WdWwNzB+4w8d59NUF7P+BESjnzY
	Y7Sm9cfZBlDMOTBIzpjCbOLjKbfkvQPPstqLyKVQKtDI4iJ5IvasiD4s2zCMlyGNrEZOeyYZpee
	NIbyZCaaiiL4DHVkkHmI/ft1ZOr8VODg=
X-Gm-Gg: AYBFou0Y4QBArzQyQPTi+LqXmEKwX2Rf4IzwjRj3tnMnHj33tMVQ40tRtBDIW5j6yjF
	1JU10AbKkoqO70QUAmcALgzCYAJDo7aB8RchaSLmq4D9AHyYTmHKvdINJoef/BzAzsBpuYbjS4p
	6QO3I4VJLTDqAlpmlLf21bAe/LQcoBbHpEKCOa2Qcby9DolDqxiEbUW0S7N5YtVoWju98jU+c8q
	77pBadrG9VfxRpCygZYdZKniMfTimoYeHOR64xEjMLf0NveifYriq6dzqic0ZWEb0MPr+JQZhPd
	j/82nPGLYowwVXWDcRq7VQPBlqJoWxw2LeAzDvS7Bd/bAoU0bXUAszLX
X-Received: by 2002:a17:906:f585:b0:c29:183c:a5f with SMTP id
 a640c23a62f3a-c2a15788ee3mr1095355566b.5.1790081845657; Tue, 22 Sep 2026
 05:57:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-10-mszeredi@redhat.com>
In-Reply-To: <20260922061019.3320196-10-mszeredi@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 22 Sep 2026 14:57:14 +0200
X-Gm-Features: AcwNN1X0w6iHPdPQNMU974D-YNeGQWNfrmOILEcRGi0urkhlQCK6p-1lFlTNSjc
Message-ID: <CAOQ4uxjUjuSJvvw+3SFHhZP1vTpB7XKmrkFwSopJ+ZotPB0cWw@mail.gmail.com>
Subject: Re: [PATCH 09/11] fuse: add extent map data structure
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> Add support for creating and managing extent maps that map file regions t=
o
> dax device regions.
>
> Introduce FUSE_NOTIFY_MAP for populating extent maps from userspace.
>
> Extent maps are handled as a new type of backing and are assigned a 64 bi=
t
> backing ID by the server.
>
> One extent consists of
>
>  - offset within the containing backing
>  - length of extent
>  - target backing ID
>  - offset into target backing
>
> Extents must be non-overlapping, and can only refer to dax device backing=
s
> for now.
>
> At this point only support creating and populating the extent map in one
> operation, though the interface is not limited by this and later may be
> changed, so that partial population of an extent map would be possible.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/Makefile          |   2 +-
>  fs/fuse/backing.c         |  23 +++++++
>  fs/fuse/ext_map.c         | 129 ++++++++++++++++++++++++++++++++++++++
>  fs/fuse/fuse_i.h          |  12 +++-
>  fs/fuse/notify.c          |  41 ++++++++++++
>  include/uapi/linux/fuse.h |  30 ++++++++-
>  6 files changed, 234 insertions(+), 3 deletions(-)
>  create mode 100644 fs/fuse/ext_map.c
>
> diff --git a/fs/fuse/Makefile b/fs/fuse/Makefile
> index 245e67852b03..139f37071a78 100644
> --- a/fs/fuse/Makefile
> +++ b/fs/fuse/Makefile
> @@ -15,7 +15,7 @@ fuse-y +=3D dev.o dir.o file.o inode.o control.o xattr.=
o acl.o readdir.o ioctl.o r
>  fuse-y +=3D poll.o notify.o
>  fuse-y +=3D iomode.o
>  fuse-$(CONFIG_FUSE_DAX) +=3D dax.o
> -fuse-$(CONFIG_FUSE_PASSTHROUGH) +=3D passthrough.o backing.o
> +fuse-$(CONFIG_FUSE_PASSTHROUGH) +=3D passthrough.o backing.o ext_map.o
>  fuse-$(CONFIG_SYSCTL) +=3D sysctl.o
>  fuse-$(CONFIG_FUSE_IO_URING) +=3D dev_uring.o
>
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index aa558a0c2e64..484ca29e8aed 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -32,6 +32,10 @@ static void fuse_backing_free(struct fuse_backing *fb)
>         case FUSE_BACKING_DAXDEV:
>                 fs_put_dax(fb->dax_dev, fb);
>                 break;
> +
> +       case FUSE_BACKING_EXTMAP:
> +               fuse_ext_map_destroy(&fb->extents);
> +               break;
>         }
>         kfree_rcu(fb, rcu);
>  }
> @@ -252,9 +256,28 @@ static void fuse_backing_rht_free(void *p, void *dat=
a)
>
>  void fuse_backing_files_free(struct fuse_conn *fc)
>  {
> +       struct rhashtable_iter iter;
> +       struct fuse_backing *fb;
> +
>         idr_for_each(&fc->backing_files_map, fuse_backing_idr_free, NULL)=
;
>         idr_destroy(&fc->backing_files_map);
>
> +       /*
> +        * extents are referencing other backings, put these refs before
> +        * destroying the backings themselves
> +        */
> +       rhashtable_walk_enter(&fc->backing_64_ht, &iter);
> +       rhashtable_walk_start(&iter);
> +       while ((fb =3D rhashtable_walk_next(&iter))) {
> +               /* Nothing changing the hash table, -EAGAIN not possible =
*/
> +               if (fb->type =3D=3D FUSE_BACKING_EXTMAP) {
> +                       fuse_ext_map_destroy(&fb->extents);
> +                       fb->extents.rb_node =3D NULL;
> +               }
> +       }
> +       rhashtable_walk_stop(&iter);
> +       rhashtable_walk_exit(&iter);
> +
>         rhashtable_free_and_destroy(&fc->backing_64_ht, fuse_backing_rht_=
free, NULL);
>  }
>
> diff --git a/fs/fuse/ext_map.c b/fs/fuse/ext_map.c
> new file mode 100644
> index 000000000000..e5d257fec88c
> --- /dev/null
> +++ b/fs/fuse/ext_map.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include "fuse_i.h"
> +#include <linux/rbtree.h>
> +#include <linux/pagemap.h>
> +
> +struct fuse_iext {
> +       struct rb_node rb;
> +       u64 start;
> +       u64 end; /* exclusive */
> +       struct fuse_backing *backing;
> +       u64 backing_offset;
> +};
> +
> +void fuse_ext_map_destroy(struct rb_root *extents)
> +{
> +       struct fuse_iext *fie, *tmp;
> +
> +       rbtree_postorder_for_each_entry_safe(fie, tmp, extents, rb) {
> +               fuse_backing_put(fie->backing);
> +               kfree(fie);
> +       }
> +}
> +
> +static int fuse_add_extent(struct fuse_conn *fc, struct rb_root *extents=
,
> +                          struct fuse_extent *ext)
> +{
> +       struct fuse_iext *new_fie __free(kfree) =3D kzalloc_obj(*new_fie)=
;
> +       struct rb_node *parent =3D NULL, **link =3D &extents->rb_node;
> +       loff_t end;
> +
> +       if (!new_fie)
> +               return -ENOMEM;
> +
> +       if (ext->reserved[0] || ext->reserved[1])
> +               return fuse_EIO("reserved fields set");
> +
> +       if (!PAGE_ALIGNED(ext->offset) || !PAGE_ALIGNED(ext->length) || !=
PAGE_ALIGNED(ext->addr))
> +               return fuse_EIO("not page aligned");
> +
> +       if (!ext->length)
> +               return fuse_EIO("zero sized extent");
> +
> +       if (overflows_type(ext->offset, loff_t) ||
> +           check_add_overflow(ext->offset, ext->length, &end))
> +               return fuse_EIO("offset overflow");
> +
> +       new_fie->start =3D ext->offset;
> +       new_fie->end =3D end;
> +       new_fie->backing_offset =3D ext->addr;
> +
> +       while (*link) {
> +               struct fuse_iext *fie =3D rb_entry(*link, typeof(*fie), r=
b);
> +
> +               parent =3D *link;
> +               if (new_fie->end <=3D fie->start)
> +                       link =3D &parent->rb_left;
> +               else if (new_fie->start >=3D fie->end)
> +                       link =3D &parent->rb_right;
> +               else
> +                       return fuse_EIO("overlap");
> +       }
> +
> +       new_fie->backing =3D fuse_backing_lookup(fc, ext->backing_id, tru=
e);
> +       if (!new_fie->backing)
> +               return fuse_EIO("backing not found");
> +
> +       if (new_fie->backing->type !=3D FUSE_BACKING_DAXDEV) {
> +               fuse_backing_put(new_fie->backing);
> +               return fuse_EIO("backing is not dax device");
> +       }
> +
> +       rb_link_node(&new_fie->rb, parent, link);
> +       rb_insert_color(&no_free_ptr(new_fie)->rb, extents);
> +
> +       return 0;
> +}
> +
> +bool fuse_ext_map_is_dax(struct fuse_backing *fb)
> +{
> +       struct fuse_iext *fie;
> +
> +       if (WARN_ON(RB_EMPTY_ROOT(&fb->extents)))
> +               return false;
> +
> +       fie =3D rb_entry(fb->extents.rb_node, typeof(*fie), rb);
> +       return fie->backing->type =3D=3D FUSE_BACKING_DAXDEV;
> +}
> +
> +int fuse_ext_map_populate(struct fuse_conn *fc, struct fuse_notify_map_o=
ut *arg,
> +                         struct fuse_extent *ext)
> +{
> +       struct fuse_backing *fb;
> +       unsigned int i;
> +       int err;
> +
> +       if (!arg->num_extents)
> +               return fuse_EIO("no extents");
> +
> +       if (arg->flags & FUSE_MAP_BACKING_CREATE) {
> +               fb =3D kzalloc_obj(*fb);
> +               if (!fb)
> +                       return -ENOMEM;
> +
> +               refcount_set(&fb->count, 1);
> +               fb->type =3D FUSE_BACKING_EXTMAP;
> +               fb->backing_id =3D arg->backing_id;
> +       } else {
> +               /* Adding extents to an existing extmap backing is not ye=
t supported */
> +               return -EINVAL;
> +       }
> +
> +       for (i =3D 0; i < arg->num_extents; i++) {
> +               err =3D fuse_add_extent(fc, &fb->extents, &ext[i]);
> +               if (err)
> +                       goto err_put;
> +       }
> +
> +       err =3D 0;
> +       if (arg->flags & FUSE_MAP_BACKING_CREATE) {
> +               err =3D fuse_backing_add_64(fc, fb);
> +               if (!err)
> +                       return 0;
> +       }
> +
> +err_put:
> +       fuse_backing_put(fb);
> +       return err;
> +}
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 00c124bcb88d..928e5c43e43c 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -28,7 +28,7 @@
>  #include <linux/backing-dev.h>
>  #include <linux/mutex.h>
>  #include <linux/rwsem.h>
> -#include <linux/rbtree.h>
> +#include <linux/rbtree_types.h>
>  #include <linux/poll.h>
>  #include <linux/workqueue.h>
>  #include <linux/kref.h>
> @@ -96,6 +96,7 @@ struct fuse_submount_lookup {
>  enum fuse_backing_type {
>         FUSE_BACKING_PATH,
>         FUSE_BACKING_DAXDEV,
> +       FUSE_BACKING_EXTMAP,
>  };
>
>  /* Container for data related to mapping to backing file */
> @@ -111,6 +112,9 @@ struct fuse_backing {
>                         struct dax_device *dax_dev;
>                         bool dax_error;
>                 };
> +               struct {
> +                       struct rb_root extents;
> +               };
>         };
>         u64 backing_id;
>         struct rhash_head hash_node;
> @@ -1360,4 +1364,10 @@ extern void fuse_sysctl_unregister(void);
>  #define fuse_sysctl_unregister()       do { } while (0)
>  #endif /* CONFIG_SYSCTL */
>
> +/* ext_map.c */
> +
> +void fuse_ext_map_destroy(struct rb_root *extents);
> +bool fuse_ext_map_is_dax(struct fuse_backing *fb);
> +int fuse_ext_map_populate(struct fuse_conn *fc, struct fuse_notify_map_o=
ut *arg,
> +                         struct fuse_extent *ext);
>  #endif /* _FS_FUSE_I_H */
> diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
> index 7361b56bb973..ce6d85834ea5 100644
> --- a/fs/fuse/notify.c
> +++ b/fs/fuse/notify.c
> @@ -429,6 +429,44 @@ static int fuse_notify_backing_close(struct fuse_con=
n *fc, unsigned int size,
>
>  }
>
> +static int fuse_notify_map(struct fuse_conn *fc, unsigned int size,
> +                          struct fuse_copy_state *cs)
> +{
> +       struct fuse_notify_map_out outarg;
> +       struct fuse_extent *ext __free(kvfree) =3D NULL;
> +       int err;
> +
> +       if (size < sizeof(outarg))
> +               return -EINVAL;
> +
> +       err =3D fuse_copy_one(cs, &outarg, sizeof(outarg));
> +       if (err)
> +               return err;
> +
> +       if (outarg.num_extents > FUSE_MAX_EXTENTS)
> +               return -EINVAL;
> +
> +       size -=3D sizeof(outarg);
> +       if (size !=3D outarg.num_extents * sizeof(*ext))
> +               return -EINVAL;
> +
> +       if (outarg.reserved[0] !=3D 0 || outarg.reserved[1] !=3D 0)
> +               return -EINVAL;
> +
> +       if (outarg.flags & ~FUSE_MAP_BACKING_CREATE)
> +               return -EINVAL;
> +
> +       ext =3D kvmalloc_objs(*ext, outarg.num_extents);
> +       if (!ext)
> +               return -ENOMEM;
> +
> +       err =3D fuse_copy_one(cs, ext, size);
> +       if (err)
> +               return err;
> +
> +       return fuse_ext_map_populate(fc, &outarg, ext);
> +}
> +
>  int fuse_notify(struct fuse_conn *fc, enum fuse_notify_code code,
>                 unsigned int size, struct fuse_copy_state *cs)
>  {
> @@ -463,6 +501,9 @@ int fuse_notify(struct fuse_conn *fc, enum fuse_notif=
y_code code,
>         case FUSE_NOTIFY_BACKING_CLOSE:
>                 return fuse_notify_backing_close(fc, size, cs);
>
> +       case FUSE_NOTIFY_MAP:
> +               return fuse_notify_map(fc, size, cs);
> +
>         default:
>                 return -EINVAL;
>         }
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 1ba28a2885ad..5368889710c7 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -251,12 +251,15 @@
>   *
>   *  7.47
>   *  - add FUSE_HAS_SYNCFS opt-in flag for privileged userspace servers
> - *  - add FUSE_NOTIFY_BACKING_CLOSE
> + *  - add FUSE_NOTIFY_BACKING_CLOSE, FUSE_NOTIFY_MAP
>   *  - add struct fuse_notify_backing_close_out
> + *  - add struct fuse_notify_map_out
> + *  - add struct fuse_extent
>   *  - add backing_id_64 to fuse_open_out
>   *  - add backing_id to fuse_backing_map
>   *  - add FUSE_BACKING_IS_DEV (fuse_backing_map.flags)
>   *  - add FUSE_BACKING_ID_64 (multiple structs)
> + *  - add FUSE_MAP_BACKING_CREATE (fuse_notify_map_out.flags)
>   */
>
>  #ifndef _LINUX_FUSE_H
> @@ -718,6 +721,7 @@ enum fuse_notify_code {
>         FUSE_NOTIFY_INC_EPOCH =3D 8,
>         FUSE_NOTIFY_PRUNE =3D 9,
>         FUSE_NOTIFY_BACKING_CLOSE =3D 10,
> +       FUSE_NOTIFY_MAP =3D 11,
>  };
>
>  /* The read buffer is required to be at least 8k, but may be much larger=
 */
> @@ -1217,6 +1221,30 @@ struct fuse_notify_backing_close_out {
>         uint64_t        reserved;
>  };
>
> +/**
> + * notify_map flags
> + *
> + * FUSE_MAP_BACKING_CREATE:    create backing with the supplied ID
> + */
> +#define FUSE_MAP_BACKING_CREATE        (1 << 0)
> +
> +struct fuse_notify_map_out {
> +       uint64_t        backing_id;
> +       uint32_t        num_extents;
> +       uint32_t        flags;
> +       uint64_t        reserved[2];
> +};
> +
> +#define FUSE_MAX_EXTENTS 1638
> +

I'm curious what's the math behind this :)

> +struct fuse_extent {
> +       uint64_t        offset;         /* offset of extent into file */
> +       uint64_t        length;         /* extent length */
> +       uint64_t        backing_id;     /* target backing */
> +       uint64_t        addr;           /* target offset within backing f=
ile/device */
> +       uint64_t        reserved[2];
> +};
> +
>  #define FUSE_SETUPMAPPING_FLAG_WRITE (1ull << 0)
>  #define FUSE_SETUPMAPPING_FLAG_READ (1ull << 1)
>  struct fuse_setupmapping_in {
> --
> 2.54.0

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
