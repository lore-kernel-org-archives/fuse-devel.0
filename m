Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F1343A809
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073207; cv=pass; b=h0YMUlf9tIhPHNoUfapMtmnWS7ulLYbdV2Wu/0a0PRYTz5NGe2pLyG7oPaJvuwoDZ6DI5wj0y5chIhcuCAfVlN8+NNRMKulMiQg/paRFv0lPEAhASq/Y5Mg/gd0MjJOPwy6xT8w8WlJrQ7ERxQQ/FwA4zkIvqK3ChD0VDOurshk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073207; c=relaxed/simple;
	bh=lrVPj15oCoF6mMOjVI0Pfkdfk1GrxjN5CniPnVCdtCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=st2jK0BC6qjQE3/pmMd9Af6Z3kG4uL0U18Bi8KpZrqULm0gCjn9g0BhpfbevhnHN1r2+ISfItJmxllqxeWEW+25VT7ab/+xWOnfi3OTbeBOay7YVfLGcoTiUOJWQgPLwat1spysgnzP5OkK5wec1fuOafILBZl3qlZW0E1v1opc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ndqd11v4; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ndqd11v4"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a56so469540666b.1
        for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 03:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790073204; cv=none;
        d=google.com; s=arc-20260327;
        b=F7E+k7VZw7iPG9+NXA2T0MNcwpRhWh+zcMPZaCia0UCAxh0VLLdarlvwDY2IymJIAC
         AHiaPo9vV5nDUsM3nKka9m69DQU6V/0+67W7LdAM0MSqdRItPQy/z3+BxkEN/xdHgxNo
         /vdkxv27cEtnhyZIq0vNSrqGEEkMXcxYqaGLCekmvCPEqHlGkPBUR8dfaAEERh8dZAHF
         QJo69iRkO0YUKl4zmOQo5hbTMaMRBDJ6/KL8+V/yMKVfksGkQWM/ygXj4rG/hONrsATs
         XSlX1ENlOzbjR1JbwQCy9IZ62iAcxOvxQI3qsjVDmRJ5sXpnCCssjw3ZNMrINNFGpU0u
         93jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u8EtloJm7gTWGodLgCcKEsZxwilYuiNUzs+DobqVmXA=;
        fh=LSGkIxL+7O1MPXHhjOsZelXZcZzf1zyb+22wAIOwAjQ=;
        b=QkEj6kie1PTk/gYSfo1qosyNDUQfqPdCkw18v9KhtuWULpWB2NfZBxCA/iWdmZI7jJ
         aXytHAHrxLjpWLAviJbkFBquLCmK9U5WL4mOiBUcikOSDj08J+nNaSLrvJjICXWcYUWe
         ILeUWu818vsNwm2wufOxJ2ChnlOR4lG5912ebh3j7aDe41bJtoIkQOqC7oPTSolbaJur
         7IbgMKQn/K4s18GzVnqDwT67RzQfXNCMbhAE/l8Ucy9vJtDbRmyHrMqliDkT/oqDK/zr
         ATgswAAAwNq92fGkopkT0FWamfGxXk3VWwMtMCnLI4MDCZgi48dKFQlrtkSeOEUKPgDY
         jccA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790073204; x=1790678004; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u8EtloJm7gTWGodLgCcKEsZxwilYuiNUzs+DobqVmXA=;
        b=Ndqd11v4C/LWE+5CkQpji4vHYhAcLG7Lqnneb3OVRh32X5gcVzU+/RKxyjZ4eouAxr
         +u91W7dDRNq+UqWc5aeqKVSumIlfkh3ZLyW8KK9Ymegx3tW89KHfssipbDPtHIZL7T5z
         DzI6fuvW+uSEVB/4EerETJyEJG/3g9+7+nXW8h1NbmwPYxR7M5hyTwLaIlWj9ta8VKRi
         iZZnmX9dpwaz5+CkouLaeRPdgKNt6+KvcE/ShAJs55289849whiVLwyvdpNPQSkGAKC/
         UiA9yL+gQeGCjA7GNJ/yx2mhQSz/g+ZsL9bJMsYHdHrmmHecdT+mCjqI8f0Hm7bZI+wU
         iGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073204; x=1790678004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8EtloJm7gTWGodLgCcKEsZxwilYuiNUzs+DobqVmXA=;
        b=aneWfUQLcbZ9ZBvhs6nZjLZpBR3nlGGRFxIOzZUEHYSVb9Tom+sjZZWuLW9Hv882m2
         m4njDHUp7MoWSwOhpbaYI7uq8jubrHt9DwCCEcw1HQx2L8nZY0J9XB5eNRFA128RShFj
         BOemFGwtlh2c9DeQq7lYl5STQk9rlEi/uRuk37JUQsHH/X61HkOY/ICjhoAYIJulqt/o
         Hal8FSqbKHfKhYQpEb+gLZeXMK9wz74G2EPQ4ie96R5o2/BIouTYaqp5nVDYtIGFb0ZC
         T1WvIhuD2pkRjXPn/6IqSCW7TaQER9ETjexeO/Vh/OTJmLMhcmCjq3sfGHQsJGZO55xe
         RqZg==
X-Gm-Message-State: AFuF++ltYT0DKzO9I2xdXhp8dgfLwYghQ745jIR+YGh8jsUQ4dQ3ymre
	3FbAMpHIkTkADQ5YRdudvnRxsuQHDcOC89ATDExIDfObPI1r56JMzsgrlAi9fJzBGiIRzSTUoIa
	3jxG9hOdM7uIetjqymOlTN0Q3kVkOqGk=
X-Gm-Gg: AYBFou0A/mQTYb5UJNuoskeZYz/78poPs0jvNN4G9xJfm6sCTJwOHioxxRlNTh7/QcF
	rkhT7ZCLV0hDpofY653zzRiECfdxVMTYQRUXeATvRPYVHO22sSAJ5v48wSy0CibB6kNGOXXzL0a
	txQv/QCQwnSr8PbMktzbw+sgRQsqvLiMMHXQTcHDTb8u2NL9udQ9gaL1+c7m2B/8B7ysO5GIIoP
	iYjkrPbNB+2DXWNvqBS+yUuO17yol3upXjXdHDcRyzRIx4vrcYs0pvzVEmv6kUprHM7Bcv20tXW
	aCWQbnJNn6D7pV8wzNjVcXx1U366z4gjTcY3KCsDFvhENX1uVLbWV3jS
X-Received: by 2002:a17:907:9813:b0:c29:9691:ec9d with SMTP id
 a640c23a62f3a-c2a1580e502mr1112847966b.22.1790073203933; Tue, 22 Sep 2026
 03:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-8-mszeredi@redhat.com>
In-Reply-To: <20260922061019.3320196-8-mszeredi@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 22 Sep 2026 12:33:12 +0200
X-Gm-Features: AcwNN1V1iGpfKcSmKB8cggKQagbiZanJ9NWxbqzylm22X_zbVoWMAyHer2_7vEw
Message-ID: <CAOQ4uxhr+1vYaVNtPA824TLqXD0D0m9mQDxwVoUghs0R2JCYnQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] fuse: support opening 64 bit backing ID
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> Add backing_id_64 field to fuse_open_out to allow opening files with
> 64-bit server-allocated backing IDs.
>
> When the server sets FUSE_BACKING_ID_64 in open_out.open_flags, the
> kernel reads the backing ID from open_out.backing_id_64 instead of
> open_out.backing_id.
>
> The open reply is now variable-length for backward compatibility with
> servers that don't send the new backing_id_64 field.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/dir.c             |  3 ++-
>  fs/fuse/file.c            |  6 +++++-
>  fs/fuse/fuse_i.h          |  4 ++--
>  fs/fuse/iomode.c          | 11 ++++++++++-
>  fs/fuse/passthrough.c     |  6 +++---
>  include/uapi/linux/fuse.h |  4 ++++
>  6 files changed, 26 insertions(+), 8 deletions(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index f48fafccce4b..874ec7cfffb1 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -876,6 +876,7 @@ static int fuse_create_open(struct mnt_idmap *idmap, =
struct inode *dir,
>         args.out_args[0].value =3D &outentry;
>         /* Store outarg for fuse_finish_open() */
>         outopenp =3D &ff->args->open_outarg;
> +       args.out_argvar =3D true; /* compat */
>         args.out_args[1].size =3D sizeof(*outopenp);
>         args.out_args[1].value =3D outopenp;
>
> @@ -885,7 +886,7 @@ static int fuse_create_open(struct mnt_idmap *idmap, =
struct inode *dir,
>
>         err =3D fuse_simple_idmap_request(idmap, fm, &args);
>         free_ext_value(&args);
> -       if (err)
> +       if (err < 0)
>                 goto out_free_ff;
>
>         err =3D -EIO;
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index af26de78a199..8643d9a290ac 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -28,6 +28,7 @@ static int fuse_send_open(struct fuse_mount *fm, u64 no=
deid,
>  {
>         struct fuse_open_in inarg;
>         FUSE_ARGS(args);
> +       int res;
>
>         memset(&inarg, 0, sizeof(inarg));
>         inarg.flags =3D open_flags & ~(O_CREAT | O_EXCL | O_NOCTTY);
> @@ -45,10 +46,13 @@ static int fuse_send_open(struct fuse_mount *fm, u64 =
nodeid,
>         args.in_args[0].size =3D sizeof(inarg);
>         args.in_args[0].value =3D &inarg;
>         args.out_numargs =3D 1;
> +       args.out_argvar =3D true; /* compat */
>         args.out_args[0].size =3D sizeof(*outargp);
>         args.out_args[0].value =3D outargp;
>
> -       return fuse_simple_request(fm, &args);
> +       res =3D fuse_simple_request(fm, &args);
> +
> +       return res < 0 ? res : 0;
>  }
>
>  struct fuse_file *fuse_file_alloc(struct fuse_mount *fm, bool release)
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 75c7997098c1..d36459487bee 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -28,7 +28,7 @@
>  #include <linux/backing-dev.h>
>  #include <linux/mutex.h>
>  #include <linux/rwsem.h>
> -#include <linux/rbtree_types.h>
> +#include <linux/rbtree.h>
>  #include <linux/poll.h>
>  #include <linux/workqueue.h>
>  #include <linux/kref.h>
> @@ -1312,7 +1312,7 @@ static inline struct fuse_backing *fuse_inode_backi=
ng_set(struct fuse_inode *fi,
>  #endif
>  }
>
> -struct fuse_backing *fuse_passthrough_open(struct file *file, int backin=
g_id);
> +struct fuse_backing *fuse_passthrough_open(struct file *file, u64 backin=
g_id, bool is_64bit);
>  void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing =
*fb);
>
>  static inline bool fuse_is_passthrough(struct fuse_file *ff)
> diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
> index c25ac580c811..53b0c2a32ed9 100644
> --- a/fs/fuse/iomode.c
> +++ b/fs/fuse/iomode.c
> @@ -170,8 +170,12 @@ static int fuse_file_passthrough_open(struct inode *=
inode, struct file *file)
>         struct fuse_file *ff =3D file->private_data;
>         struct fuse_conn *fc =3D get_fuse_conn(inode);
>         struct fuse_backing *fb;
> +       u64 backing_id;
> +       bool is_64bit =3D ff->open_flags & FUSE_BACKING_ID_64;
>         int err;
>
> +       ff->open_flags &=3D ~FUSE_BACKING_ID_64;
> +
>         /* Check allowed conditions for file open in passthrough mode */
>         if (!IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) || !fc->passthrough)
>                 return fuse_EIO("passthrough not enabled");
> @@ -179,7 +183,12 @@ static int fuse_file_passthrough_open(struct inode *=
inode, struct file *file)
>         if (ff->open_flags & ~FOPEN_PASSTHROUGH_MASK)
>                 return fuse_EIO("conflicting open flags");
>
> -       fb =3D fuse_passthrough_open(file, ff->args->open_outarg.backing_=
id);
> +       if (!is_64bit)
> +               backing_id =3D ff->args->open_outarg.backing_id;
> +       else
> +               backing_id =3D ff->args->open_outarg.backing_id_64;
> +
> +       fb =3D fuse_passthrough_open(file, backing_id, is_64bit);
>         if (IS_ERR(fb))
>                 return PTR_ERR(fb);
>
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index 56314dea0b5f..49cae366180d 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -153,17 +153,17 @@ ssize_t fuse_passthrough_mmap(struct file *file, st=
ruct vm_area_struct *vma)
>   *
>   * Returns an fb object with elevated refcount to be stored in fuse inod=
e.
>   */
> -struct fuse_backing *fuse_passthrough_open(struct file *file, int backin=
g_id)
> +struct fuse_backing *fuse_passthrough_open(struct file *file, u64 backin=
g_id, bool is_64bit)
>  {
>         struct fuse_file *ff =3D file->private_data;
>         struct fuse_conn *fc =3D ff->fm->fc;
>         struct fuse_backing *fb =3D NULL;
>         struct file *backing_file;
>
> -       if (backing_id <=3D 0)
> +       if (!is_64bit && (backing_id =3D=3D 0 || backing_id > INT_MAX))
>                 return fuse_ptr_EIO("invalid backing_id");
>
> -       fb =3D fuse_backing_lookup(fc, backing_id, false);
> +       fb =3D fuse_backing_lookup(fc, backing_id, is_64bit);
>         if (!fb)
>                 return fuse_ptr_EIO("backing not found");
>
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index f271faa60424..30ec8c124c74 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -253,6 +253,7 @@
>   *  - add FUSE_HAS_SYNCFS opt-in flag for privileged userspace servers
>   *  - add FUSE_NOTIFY_BACKING_CLOSE
>   *  - add struct fuse_notify_backing_close_out
> + *  - add backing_id_64 to fuse_open_out
>   *  - add backing_id to fuse_backing_map
>   *  - add FUSE_BACKING_ID_64 (multiple structs)
>   */
> @@ -404,6 +405,7 @@ struct fuse_file_lock {
>   *                           (FUSE_URING_ZERO_COPY) and the request carr=
ies page
>   *                           payload. Otherwise reads/writes fall back t=
o
>   *                           copying.
> + * FUSE_BACKING_ID_64: backing ID is server allocated, stored in open_ou=
t.backing_id_64
>   */
>  #define FOPEN_DIRECT_IO                (1 << 0)
>  #define FOPEN_KEEP_CACHE       (1 << 1)
> @@ -414,6 +416,7 @@ struct fuse_file_lock {
>  #define FOPEN_PARALLEL_DIRECT_WRITES   (1 << 6)
>  #define FOPEN_PASSTHROUGH      (1 << 7)
>  #define FOPEN_IO_URING_ZERO_COPY (1 << 8)
> +#define FUSE_BACKING_ID_64     (1 << 30) /* used in multiple structs */

This is weird. Why not FOPEN_BACKING_ID_64?

But I would much rather choose a mode at init time for backing ids and then
this flag will not be needed at all.

Thanks,
Amir.
