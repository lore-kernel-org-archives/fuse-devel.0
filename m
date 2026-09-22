Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98194E36CE
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082305; cv=pass; b=RuNXQVJmvi6i9NsozAa9Rr1S8bPze6g2c9vM3iEIfC31/AA7p6P6sLUqLfwlYrXgpr8mWK/J9lbA6dNHNmVnx3FRUiU80lDveIbxlWwaTJ9D8APBY1Rx0ggkGi65bOl2AK246RcROaiLV/b7jxftKXIM3RFZqMTjrkH3KyMy/kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082305; c=relaxed/simple;
	bh=OMqdAERbMmo9BQVmpjvruPmd5dBsiow9UjSnD1DlCzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GdW/855NZKyHMRYYwZLkZ6sahAi7tGh8LYD2S3jlWv1I+AEkFjcGVNs6wbpLwkeVAUgHzE5qdBeX779vRlb3nI/xqlbhzR3nvE24tXRKRywsmivJzSkBmsMcutgF1ZFaokrc7LA6ss1NqwS9hgJRd0csCl04ftqWbybiXo3pLhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=II0DJYTW; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="II0DJYTW"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so759010166b.1
        for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 06:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790082302; cv=none;
        d=google.com; s=arc-20260327;
        b=fdHTgprBy+dfUaVR1fGN/9EBU6z2AEkNM9VsI+Y8+P4Mj/hbqU1Q8C9R9+Ftfnqp4I
         XRInxW3yuLfjfOAwD9LfQXZBr4IbJazZBYXakP4G4Dc82y6n+BmehL/UYlmoVw+B6l5b
         tksRtD5Ikm0ySLYcKM4RxVxFjzfQv6h7pf3TFwFpcjUkl12W9jolJ9H45UPaYeIkda/x
         IwzsKw1WP6zgLnV0QsNnUEBWlkcnKqpmGXxab41Ow8QOzKfQtLSSvAdS0LbRJB812BV3
         Pfj3ffldl71eUEPIGIdFEUJMDXOKV1NhETh8AOk6odokfpxmnNUCtY+Chcz44S4b/5Xk
         e4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J5U+7evrype5Izw6WkHLxf1IZvCcahAxOqy1e+PFl+o=;
        fh=LSGkIxL+7O1MPXHhjOsZelXZcZzf1zyb+22wAIOwAjQ=;
        b=ESris+xX378g0cpqheXdEX/vIdS22c6RbvupRG+MauUvx76jxpo6X4S1ECM0QQfgmm
         rgVpVRyGu+57lBorCBi8kQG9YlpLWr4GhL9B6oLoHV2gcT+HmBHygA7hWIHLMRsBnHuc
         0ZNhljW2oncAoRbQkEe0C6N8gsy+OK84tac++20PzMBLChmFBMI7H+bnypKbByhtmHKQ
         /6TTHUSy7OGPn1mFuvWZKP0vEEDRyQNHGVOIkcwkOo+xd9ga+TiLEdIjQdJ1Lbagd35F
         06rlJ94WDOlnRz23pY3MdO8PDUYCb1PclglMEHgJsTmBbIFeeWCtGZtsjBflapoU+j3d
         Przw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790082302; x=1790687102; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J5U+7evrype5Izw6WkHLxf1IZvCcahAxOqy1e+PFl+o=;
        b=II0DJYTWJJSk0sLXylH7wPVk/f4BLk87B7vbxd7/VhW7c9J9QGxPzZbfVORZm1YOM5
         sDOT9Fg0lfX/zlOH2xXFf0/SQXIYbEgKHXG7seL7KfEA8bd1bMpRkn7SATjpyyAKSsLk
         fEfkpphSA4NSPCd9baMKCdAsMUGXB5re4ecz3GWDNPgt4zoAXNaZe8VOrJOFucNlMW6B
         MHikuJSxRzgNKo9vIPJJ6z5kgncgOcKqob6V5WdmsQ0jPbNg+K48daBhp3y1ZOWjrNo6
         G4JhyvBIFJde+JAOWIgyXr1ipach+ckk2+IsMIXc9T4yHrSiP4g56htOadKu3cxXnCWA
         /gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082302; x=1790687102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J5U+7evrype5Izw6WkHLxf1IZvCcahAxOqy1e+PFl+o=;
        b=g1UIPPG376S30HbD13AMB9h6nazjPMV3s/cnLSinvp0/3OjMQ+PF6ixr50DurQEJ3b
         b7wad3mJ2FzysMyp/MBTH0FXqyUdbPBB8XG+R71g/6ami4Q5gp1FRLV7lbkeIv3V7gOv
         6z7Gq5bbX4wNdk5Z57hbjjWjbTdMeps20XK8ihFr3PF9aUT3XIlzHB7ROSTHIMFUgg2i
         UQfP0WidKixXLnCrma9UU7lb9jUHE/C6c1hTg781bHjwOlh8/u7KB8z2RIFL1j5SanAg
         mQVa2AcLGsEjA0tWS5NNM9/ngPsibcOslfrWz7HD2pAbTs7csGeeKWdwLfIfG7RH7Lcz
         dTdw==
X-Gm-Message-State: AFuF++lSZFp/rSfQXb31UlTViNjxt4SdF9Ly43+EsXjEFtQJ9O+1sG6y
	UnHg8toEq1IpTaF5MYFMs+uk9+bO13R8XupydLFIifaKv7yYZqpJEXL1PBPs0PbBrmHm5bkCW+0
	ZiLqP3bhHp33sT+X7PseJIEEvltCdu0PGXvlkZXk=
X-Gm-Gg: AYBFou3QYFR/hdH2yc0NA73ZK6D+ixxSWwrXaa2ErqR7qrrMwyzj1s5ZKhlV6RjboKy
	LK42QkMN2eb5DXMekqdoIoRspyEyZ5MP7XEJsq+NDy58EecxyhZhn14mCwo3GWPpPyQYa57laOa
	2XOHAoMSaq0Vlvu10gaS4XxKAVkH7HOKvdqDlO19lPF1M0AoUebog3uzLOygiLSiiZsxhYJ9SQE
	E2xMfN3jyb8/ocLjhKyMT1oODSYC0tfTcRJJBkOgQ06WuBX+koYtSrqwWKpmdKy3eZfD6cN5lbL
	hZDVfYBmiWgXlL80SHkSVzO4gf8xjYnkfpSJy3rxZJv7Yzycteslcw5W
X-Received: by 2002:a17:907:7ba2:b0:c16:5cf0:3aff with SMTP id
 a640c23a62f3a-c2a159ae1e3mr1214207266b.18.1790082301775; Tue, 22 Sep 2026
 06:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-11-mszeredi@redhat.com>
In-Reply-To: <20260922061019.3320196-11-mszeredi@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 22 Sep 2026 15:04:49 +0200
X-Gm-Features: AcwNN1V3LVbQzhZVXRXNOgL2_4r0OYjliEBt1Bm8CJPEbZFqUU2pwgsNkCi8eR4
Message-ID: <CAOQ4uxhgvemZepMzLXYxF2aHJ8OJiG0Wp7qtyOXk0ExS1tRDPQ@mail.gmail.com>
Subject: Re: [PATCH 10/11] fuse: add extent map I/O support
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> Wire up read, write, splice and mmap operations for extent-mapped
> files through the iomap/DAX infrastructure.
>
> When a passthrough file is opened with an EXTMAP backing, I/O is
> dispatched to the dax devices referenced by the extent map.
>
> If an address is not mapped, EIO is returned on the I/O operation.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/backing.c     |  15 +++++
>  fs/fuse/ext_map.c     | 138 ++++++++++++++++++++++++++++++++++++++++++
>  fs/fuse/fuse_i.h      |   4 ++
>  fs/fuse/passthrough.c |  27 +++++++--
>  4 files changed, 180 insertions(+), 4 deletions(-)
>
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index 484ca29e8aed..14875d48476e 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -224,6 +224,21 @@ int fuse_backing_close(struct fuse_conn *fc, u64 bac=
king_id, bool is_64bit)
>         return err;
>  }
>
> +bool fuse_backing_is_dax(struct fuse_backing *fb)
> +{
> +       switch (fb->type) {
> +       case FUSE_BACKING_PATH:
> +               return false;
> +       case FUSE_BACKING_DAXDEV:
> +               return true;
> +       case FUSE_BACKING_EXTMAP:
> +               return fuse_ext_map_is_dax(fb);
> +       default:
> +               WARN_ON(1);
> +               return false;
> +       }
> +}
> +
>  struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, u64 backi=
ng_id, bool is_64bit)
>  {
>         struct fuse_backing *fb;
> diff --git a/fs/fuse/ext_map.c b/fs/fuse/ext_map.c
> index e5d257fec88c..c752b6ef0686 100644
> --- a/fs/fuse/ext_map.c
> +++ b/fs/fuse/ext_map.c
> @@ -3,6 +3,8 @@
>  #include "fuse_i.h"
>  #include <linux/rbtree.h>
>  #include <linux/pagemap.h>
> +#include <linux/iomap.h>
> +#include <linux/dax.h>
>
>  struct fuse_iext {
>         struct rb_node rb;
> @@ -22,6 +24,24 @@ void fuse_ext_map_destroy(struct rb_root *extents)
>         }
>  }
>
> +static struct fuse_iext *fuse_find_extent(struct rb_root *extents, u64 o=
ffset)
> +{
> +       struct rb_node *node =3D extents->rb_node;
> +
> +       while (node) {
> +               struct fuse_iext *fie =3D rb_entry(node, typeof(*fie), rb=
);
> +
> +               if (offset < fie->start)
> +                       node =3D node->rb_left;
> +               else if (offset >=3D fie->end)
> +                       node =3D node->rb_right;
> +               else
> +                       return fie;
> +       }
> +
> +       return NULL;
> +}
> +
>  static int fuse_add_extent(struct fuse_conn *fc, struct rb_root *extents=
,
>                            struct fuse_extent *ext)
>  {
> @@ -76,6 +96,124 @@ static int fuse_add_extent(struct fuse_conn *fc, stru=
ct rb_root *extents,
>         return 0;
>  }
>
> +static int fuse_ext_map_iomap_begin(struct inode *inode, loff_t offset, =
loff_t length,
> +                                   unsigned int flags, struct iomap *iom=
ap, struct iomap *srcmap)
> +{
> +       struct fuse_backing *fb =3D fuse_inode_backing(get_fuse_inode(ino=
de));
> +       struct fuse_iext *fie;
> +       loff_t ext_len;
> +
> +       if (!fb || fb->type !=3D FUSE_BACKING_EXTMAP)
> +               return fuse_EIO("missing or wrong type backing");
> +
> +       fie =3D fuse_find_extent(&fb->extents, offset);
> +       if (!fie)
> +               return fuse_EIO("missing mapping");
> +
> +       if (WARN_ON(fie->backing->type !=3D FUSE_BACKING_DAXDEV))
> +               return fuse_EIO("wrong type backing for extent");
> +
> +       if (fie->backing->dax_error) {
> +               fuse_make_bad(inode);
> +               return fuse_EIO("dax error");
> +       }
> +
> +       ext_len =3D fie->end - fie->start;
> +
> +       iomap->offset =3D fie->start;
> +       iomap->addr =3D fie->backing_offset;
> +       iomap->length =3D ext_len;
> +       iomap->dax_dev =3D fie->backing->dax_dev;
> +       iomap->type =3D IOMAP_MAPPED;
> +       iomap->flags =3D 0;
> +
> +       return 0;
> +}
> +
> +static const struct iomap_ops fuse_ext_map_iomap_ops =3D {
> +       .iomap_begin            =3D fuse_ext_map_iomap_begin,
> +};
> +
> +static vm_fault_t fuse_ext_map_huge_fault(struct vm_fault *vmf, unsigned=
 int order)
> +{
> +       struct inode *inode =3D file_inode(vmf->vma->vm_file);
> +       bool write_fault =3D (vmf->flags & FAULT_FLAG_WRITE) && (vmf->vma=
->vm_flags & VM_SHARED);
> +       vm_fault_t ret;
> +       unsigned long pfn;
> +
> +       if (WARN_ON_ONCE(!IS_DAX(inode)))
> +               return VM_FAULT_SIGBUS;
> +
> +       if (write_fault) {
> +               sb_start_pagefault(inode->i_sb);
> +               file_update_time(vmf->vma->vm_file);
> +       }
> +
> +       ret =3D dax_iomap_fault(vmf, order, &pfn, NULL, &fuse_ext_map_iom=
ap_ops);
> +       if (ret & VM_FAULT_NEEDDSYNC)
> +               ret =3D dax_finish_sync_fault(vmf, order, pfn);
> +
> +       if (write_fault)
> +               sb_end_pagefault(inode->i_sb);
> +
> +       return ret;
> +}
> +
> +static vm_fault_t fuse_ext_map_fault(struct vm_fault *vmf)
> +{
> +       return fuse_ext_map_huge_fault(vmf, 0);
> +}
> +
> +static const struct vm_operations_struct fuse_ext_map_vm_ops =3D {
> +       .fault          =3D fuse_ext_map_fault,
> +       .huge_fault     =3D fuse_ext_map_huge_fault,
> +       .page_mkwrite   =3D fuse_ext_map_fault,
> +       .pfn_mkwrite    =3D fuse_ext_map_fault,
> +};
> +
> +static void fuse_rw_clamp(struct kiocb *iocb, struct iov_iter *ubuf)
> +{
> +       struct inode *inode =3D iocb->ki_filp->f_mapping->host;
> +       loff_t i_size =3D i_size_read(inode);
> +       loff_t max_count =3D iocb->ki_pos >=3D i_size ? 0 : i_size - iocb=
->ki_pos;
> +
> +       if (iov_iter_count(ubuf) > max_count)
> +               iov_iter_truncate(ubuf, max_count);
> +}
> +
> +ssize_t fuse_ext_map_read_iter(struct kiocb *iocb, struct iov_iter *to)
> +{
> +       ssize_t res;
> +
> +       fuse_rw_clamp(iocb, to);
> +
> +       if (!iov_iter_count(to))
> +               return 0;
> +
> +       res =3D dax_iomap_rw(iocb, to, &fuse_ext_map_iomap_ops);
> +
> +       file_accessed(iocb->ki_filp);
> +       return res;
> +}
> +
> +ssize_t fuse_ext_map_write_iter(struct kiocb *iocb, struct iov_iter *fro=
m)
> +{
> +       fuse_rw_clamp(iocb, from);
> +
> +       if (!iov_iter_count(from))
> +               return 0;
> +
> +       return dax_iomap_rw(iocb, from, &fuse_ext_map_iomap_ops);
> +}
> +
> +int fuse_ext_map_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +       file_accessed(file);
> +       vma->vm_ops =3D &fuse_ext_map_vm_ops;
> +       vm_flags_set(vma, VM_HUGEPAGE);
> +       return 0;
> +}
> +
>  bool fuse_ext_map_is_dax(struct fuse_backing *fb)
>  {
>         struct fuse_iext *fie;
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 928e5c43e43c..50b61e16a15f 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1308,6 +1308,7 @@ void fuse_backing_put(struct fuse_backing *fb);
>
>  struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, u64 backi=
ng_id, bool is_64bit);
>  int fuse_backing_add_64(struct fuse_conn *fc, struct fuse_backing *fb);
> +bool fuse_backing_is_dax(struct fuse_backing *fb);
>  #else
>
>  static inline void fuse_backing_put(struct fuse_backing *fb)
> @@ -1367,6 +1368,9 @@ extern void fuse_sysctl_unregister(void);
>  /* ext_map.c */
>
>  void fuse_ext_map_destroy(struct rb_root *extents);
> +ssize_t fuse_ext_map_write_iter(struct kiocb *iocb, struct iov_iter *fro=
m);
> +ssize_t fuse_ext_map_read_iter(struct kiocb *iocb, struct iov_iter *to);
> +int fuse_ext_map_mmap(struct file *file, struct vm_area_struct *vma);
>  bool fuse_ext_map_is_dax(struct fuse_backing *fb);
>  int fuse_ext_map_populate(struct fuse_conn *fc, struct fuse_notify_map_o=
ut *arg,
>                           struct fuse_extent *ext);
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index adc9d2d8e203..5b0886562408 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -35,7 +35,6 @@ ssize_t fuse_passthrough_read_iter(struct kiocb *iocb, =
struct iov_iter *iter)
>         struct fuse_file *ff =3D file->private_data;
>         struct file *backing_file =3D fuse_file_passthrough(ff);
>         size_t count =3D iov_iter_count(iter);
> -       ssize_t ret;
>         struct backing_file_ctx ctx =3D {
>                 .cred =3D ff->cred,
>                 .accessed =3D fuse_file_accessed,
> @@ -48,10 +47,10 @@ ssize_t fuse_passthrough_read_iter(struct kiocb *iocb=
, struct iov_iter *iter)
>         if (!count)
>                 return 0;
>
> -       ret =3D backing_file_read_iter(backing_file, iter, iocb, iocb->ki=
_flags,
> -                                    &ctx);
> +       if (!backing_file)
> +               return fuse_ext_map_read_iter(iocb, iter);
>
> -       return ret;
> +       return backing_file_read_iter(backing_file, iter, iocb, iocb->ki_=
flags, &ctx);
>  }
>
>  ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
> @@ -74,6 +73,9 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
>         if (!count)
>                 return 0;
>
> +       if (!backing_file)
> +               return fuse_ext_map_write_iter(iocb, iter);
> +
>         inode_lock(inode);
>         ret =3D backing_file_write_iter(backing_file, iter, iocb, iocb->k=
i_flags,
>                                       &ctx);
> @@ -98,6 +100,9 @@ ssize_t fuse_passthrough_splice_read(struct file *in, =
loff_t *ppos,
>         pr_debug("%s: backing_file=3D0x%p, pos=3D%lld, len=3D%zu, flags=
=3D0x%x\n", __func__,
>                  backing_file, *ppos, len, flags);
>
> +       if (!backing_file)
> +               return copy_splice_read(in, ppos, pipe, len, flags);
> +
>         init_sync_kiocb(&iocb, in);
>         iocb.ki_pos =3D *ppos;
>         ret =3D backing_file_splice_read(backing_file, &iocb, pipe, len, =
flags, &ctx);
> @@ -123,6 +128,9 @@ ssize_t fuse_passthrough_splice_write(struct pipe_ino=
de_info *pipe,
>         pr_debug("%s: backing_file=3D0x%p, pos=3D%lld, len=3D%zu, flags=
=3D0x%x\n", __func__,
>                  backing_file, *ppos, len, flags);
>
> +       if (!backing_file)
> +               return iter_file_splice_write(pipe, out, ppos, len, flags=
);
> +
>         inode_lock(inode);
>         init_sync_kiocb(&iocb, out);
>         iocb.ki_pos =3D *ppos;
> @@ -145,6 +153,9 @@ ssize_t fuse_passthrough_mmap(struct file *file, stru=
ct vm_area_struct *vma)
>         pr_debug("%s: backing_file=3D0x%p, start=3D%lu, end=3D%lu\n", __f=
unc__,
>                  backing_file, vma->vm_start, vma->vm_end);
>
> +       if (!backing_file)
> +               return fuse_ext_map_mmap(file, vma);
> +
>         return backing_file_mmap(backing_file, vma, &ctx);
>  }
>
> @@ -167,6 +178,14 @@ struct fuse_backing *fuse_passthrough_open(struct fi=
le *file, u64 backing_id, bo
>         if (!fb)
>                 return fuse_ptr_EIO("backing not found");
>
> +       if (fb->type =3D=3D FUSE_BACKING_EXTMAP) {
> +               if (fuse_backing_is_dax(fb) !=3D !!IS_DAX(file_inode(file=
))) {
> +                       fuse_backing_put(fb);
> +                       return fuse_ptr_EIO("dax mode mismatch");
> +               }
> +               return fb;
> +       }
> +
>         if (fb->type !=3D FUSE_BACKING_PATH) {
>                 fuse_backing_put(fb);
>                 return fuse_ptr_EIO("invalid backing type");
> --
> 2.54.0
>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

More for the backing parts, less for the DAX parts.

Thanks,
Amir.
