Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AF848C8CF
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 07:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645276; cv=pass; b=XQ/v0D3O596vB3IYmfLHLQArbkNulDVA0YOkrlj5f/8AmK8jgptUqIZMIPFBRsKS5zE81D9/X0wpCi6fckpOC394jXq6sdG+CCuFKDRUsTop24wv1d8j5G6icGJMGLFwPYisnbFYdYetC4Yk7hxSMqQGEwhMc+/xxD/MDOuPk+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645276; c=relaxed/simple;
	bh=wrzIRcWx1TbNsViV/iPlaN9B6sz4NzU0bRln0yCs0k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JoP+UM9bKeQZsUKnpKGGlB/+vpo0inCIFdtdbWOHZyODWXa41Re8pkm8WjYo9Q2AUZ2hhFfba5V28gRTnWpb/cm6F0U98HAb0TZ5wPsrQYHd0TEt2bJ/volBDW6KgsuuDqMeelCO2R/iPQwiZNLPFumX9fJqarcAD7kf7Q7ywbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8QpTKFa; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8QpTKFa"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68ca6f01079so1846288a12.0
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 00:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780645272; cv=none;
        d=google.com; s=arc-20240605;
        b=fUqW1seFDvY2xVnH10TNprXDpG9DZ2kRWbnh+Xssz9w69O6qOu0fMoilkdVEPupaOQ
         8AYzu//lxiISGfOJl9RI9GRMw6aYf/XkX4tOvV5HvqrlNx8ZI7H9nrpD4LoNeEwvZFDm
         ALq1GwKR+sxNLfKZOmH7F7jbW/O5ZC+7YKNjvkYyIg384FVucJNLhkvDfSZsHUNRvN5n
         6zZ9WtT+OHVJbommRNWqmVgCzthXhu3s0jaacADpBkZSBNd4ydR3U5YkpgrLfq7Qstkm
         pt9YkZSkB97GIXAvf/ifAMbhA9EGVQTfnA1F67DQfUIbWvuyTGv7jcXZ+lbueeeIDbC3
         S2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q9RzgO62segsdaq1DPZ5qYcpakLP2QgBU9gwj6BoaeQ=;
        fh=vmmAcNblVEqmrxBNocNDuam/U7Nv2Sl+J3/REjclpoE=;
        b=IwUaz5gQ+XekH4ZhdbXvbLpD3sF1b8F9S1tJsVRgrvkZ38YjOwfwjLXuQ7zRvOd7Yg
         DK2mQRywp91G/ALubLHCLlo6iIrQwpmOy7pPJ/rZ52esnIXwRr3EfdKCXvkNXpNNnnjv
         TkIujr7IlDEsu0W0tl22f/V4jbbwB2nXKJ3bqHEgY/r0SbYz1k/56nX8Ofs+vato2q25
         VYcblr2mMsBORUwupI6Fb7xoLJKHv/D0s706ReY3fBRw89QcWHE4MJbGEDo50iSOOSlE
         RPGt10+TsBWKWEUkC1wQMLRSAm4HnrN5HAvHf6EG7Ll5a7HtHBUp3dRDHQbhM/XJcGth
         O6Eg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780645272; x=1781250072; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9RzgO62segsdaq1DPZ5qYcpakLP2QgBU9gwj6BoaeQ=;
        b=A8QpTKFaK/KxJvBwmCfM7PjiV7ELB6/SCHAtYVt4+JBurd1L+prYdUQ/DGb/5l4piX
         /ddADSRMCFbojXtiCm8v0pGMVAlsPsd+/SNGj4Ptwa5D63rT5INxRf2adt5d9SeZYk+c
         rRfwug2aTFZTviyY/troEl93HspAT6gWhmoS2MZCJ5eAlXC25wrvZxc9OqNHfFhODvzy
         1cXdyl+kC9AslmuVdu0lJfuvg9M37sqmeJ1oPZNyPULK9UtVfo/E+eS6b4DTNEv0Oxbm
         DRC1orhaGhyxXkisprR3EMnaYsXnhiY0PaqPuNKdflaU4wsVFTA6mCr8Yc/0JZ0fLlOf
         v3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780645272; x=1781250072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q9RzgO62segsdaq1DPZ5qYcpakLP2QgBU9gwj6BoaeQ=;
        b=lHqUgL3WZ+T3SU3eWEqVK9n6jqmnVI9PgjWpyaGrD4nXqyU7Tl9OU9enl9oNfrZ5pX
         i4Dq4+3ECU7l82LNMYw0rptm6otjLmPKW3MCCuQ9d/1MhqphbtEJsfI96Zg/CNmhbO02
         Gjeb3AhS0coBKozXZDZxaneB6p/IMNjXomF/GzEUVOjVdzc0YJP3rEjzFMw+mY/vHlQa
         PNv7F2xsce9waq8wH4IS+UqF+UT/VoYyruKbteTBZntWCe9BqCzSAFkD36aHXJTpZszU
         TP4ydSdnbAD+Uhu21S2m8Iza7oblH9t6OxmVCD6bk48YGbz1lWgsZXGWCDohuhDARPFn
         bkHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XZ1hrT7xAiCY+r7AY5WGK3kHPfWW3LwiPGN5l+7dxwtoPFZBpAVot4wdeAKpH6ByEQDNfSC1b0nDp@lists.linux.dev
X-Gm-Message-State: AOJu0YwYwXxPQRf7epPNdRTCQ0m3By8BdXXYrRHXwRtXPbSSiUbHa4+R
	DKN9Ry+wjeWNQBOLPHLKpdGGUWaVRQholMXg9nefi9LS0NvRc8kf9aCcd+PD2+PiIZxNx831FI1
	CGFfsBSyvppcQ231XyvBpt+ey9gxKSvU=
X-Gm-Gg: Acq92OE/90TqPshRO2SpdhVDcOTBPk+gk5qBHIh1i5+q02DT/8DaLGvw+Cw9rHPO9Bn
	P3TVxZ1c4ex4XXlMOzrXRaPtFX0dCoJoO3ZFJQKqqzGcMjwQhf/NtxCJy9jsTaPB1TEXKPmle3X
	LwNxikv1RRAzO3zcVnQtYappGacEe6hiQEqT09z06koPIs8TOI7+ehILUNB1e+rFjSI8Op+m3Jz
	4iexgMyQCEgDfxVll2Cm2FhhAQ7w0HoelKIkHhazMfcgK3X8JaJPjw/lclrgy+xcYnaPKvUyFTs
	PSCmOLmpbrQdfMfsxZjc/XYoC/z20JxWS2ourVmQq0ddbOSyJZ2T
X-Received: by 2002:a05:6402:1f4a:b0:68b:48c3:3f6 with SMTP id
 4fb4d7f45d1cf-68fa5042d53mr1057297a12.18.1780645272007; Fri, 05 Jun 2026
 00:41:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com> <20260604-fuse-compounds-upstream-v7-1-27331d085c2a@ddn.com>
In-Reply-To: <20260604-fuse-compounds-upstream-v7-1-27331d085c2a@ddn.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 5 Jun 2026 09:41:00 +0200
X-Gm-Features: AVHnY4LtmU_HY0xF6kse6sqJYbriWOSEFOqOMMbYhWn9dVAWXJoX2Drazs9fT7s
Message-ID: <CAOQ4uxhGGUroMpTdLUEdKZd-=uefVoQW6Fm5_WX2-6S9T1TUmA@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] fuse: add compound command to combine multiple requests
To: Horst Birthelmer <horst@birthelmer.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>, linux-kernel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, Horst Birthelmer <hbirthelmer@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 11:51=E2=80=AFAM Horst Birthelmer <horst@birthelmer.=
com> wrote:
>
> From: Horst Birthelmer <hbirthelmer@ddn.com>
>
> Introduce FUSE_COMPOUND, a meta-opcode that bundles several FUSE
> operations into a single request/response round trip.  The wire
> format is:
>
>   fuse_in_header (opcode FUSE_COMPOUND)
>   fuse_compound_in (reserved metadata)
>     fuse_compound_req_in (per-subop header)
>     fuse_in_header (per-subop opcode/nodeid/credentials)
>     payload
>     ... (repeated per subop)
>
> Each call site supplies an array of
>
>   struct fuse_compound_op {
>     struct fuse_args *arg;
>     int              *error;
>     u8                dep_index;
>   };
>
> where @dep_index is FUSE_COMPOUND_NO_DEP or the index of an earlier
> subop whose output should be threaded into this subop's input
> (currently only the producing op's nodeid is propagated). Per-subop
> status is reported via *error.
>
> The reply mirrors the request:
>
>   fuse_out_header (compound status)
>   fuse_compound_out (reserved metadata)
>     fuse_out_header (per-subop status)
>     payload
>     ... (repeated per subop)
>
> If the server returns -ENOSYS, FUSE_COMPOUND is disabled for the
> connection and each subop is dispatched individually via
> fuse_simple_request().  -EOPNOTSUPP signals that this specific
> combination is unsupported and triggers per-request legacy dispatch
> without disabling the feature.  The legacy path validates that
> dep_index refers to a strictly earlier subop and warns otherwise.
>
> Signed-off-by: Horst Birthelmer <hbirthelmer@ddn.com>
> ---
>  fs/fuse/Makefile          |   2 +-
>  fs/fuse/compound.c        | 126 ++++++++++++++++++++++++++++
>  fs/fuse/dev.c             | 206 ++++++++++++++++++++++++++++++++++++++++=
+++---
>  fs/fuse/dev_uring.c       |  31 ++++++-
>  fs/fuse/fuse_dev_i.h      |   5 ++
>  fs/fuse/fuse_i.h          |  32 +++++++
>  fs/fuse/inode.c           |   9 ++
>  include/uapi/linux/fuse.h |  56 +++++++++++++
>  8 files changed, 452 insertions(+), 15 deletions(-)
>
> diff --git a/fs/fuse/Makefile b/fs/fuse/Makefile
> index 22ad9538dfc4..4c09038ef995 100644
> --- a/fs/fuse/Makefile
> +++ b/fs/fuse/Makefile
> @@ -11,7 +11,7 @@ obj-$(CONFIG_CUSE) +=3D cuse.o
>  obj-$(CONFIG_VIRTIO_FS) +=3D virtiofs.o
>
>  fuse-y :=3D trace.o      # put trace.o first so we see ftrace errors soo=
ner
> -fuse-y +=3D dev.o dir.o file.o inode.o control.o xattr.o acl.o readdir.o=
 ioctl.o
> +fuse-y +=3D dev.o dir.o file.o inode.o control.o xattr.o acl.o readdir.o=
 ioctl.o compound.o
>  fuse-y +=3D iomode.o
>  fuse-$(CONFIG_FUSE_DAX) +=3D dax.o
>  fuse-$(CONFIG_FUSE_PASSTHROUGH) +=3D passthrough.o backing.o
> diff --git a/fs/fuse/compound.c b/fs/fuse/compound.c
> new file mode 100644
> index 000000000000..debf2a19846d
> --- /dev/null
> +++ b/fs/fuse/compound.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * FUSE: Filesystem in Userspace
> + * Copyright (C) 2025-2026

Copyright to /dev/null?

> + *
> + * Compound operations for FUSE - batch multiple operations into a singl=
e
> + * request to reduce round trips between kernel and userspace.
> + */
> +
> +#include "fuse_i.h"
> +
> +/*
> + * Copy the nodeid from a producing subop's output into a dependent
> + * subop's input.  Only entry-producing opcodes are recognised; dependin=
g
> + * on a non-entry op is a caller bug and triggers a warning so the bad
> + * dispatch is visible instead of silently sending nodeid 0.
> + */
> +static void fuse_compound_propagate_nodeid(struct fuse_args *dep,
> +                                          const struct fuse_args *src)
> +{
> +       const struct fuse_entry_out *entry_out;
> +
> +       if (src->out_numargs =3D=3D 0)
> +               return;
> +
> +       switch (src->opcode) {
> +       case FUSE_LOOKUP:
> +       case FUSE_MKNOD:
> +       case FUSE_MKDIR:
> +       case FUSE_SYMLINK:
> +       case FUSE_LINK:
> +       case FUSE_CREATE:
> +       case FUSE_TMPFILE:
> +               entry_out =3D src->out_args[0].value;
> +               if (entry_out)
> +                       dep->nodeid =3D entry_out->nodeid;
> +               break;
> +       default:
> +               WARN_ONCE(1, "fuse: compound dep on non-entry opcode %u\n=
",
> +                         src->opcode);
> +               break;
> +       }
> +}
> +
> +/* Fallback: dispatch each subop individually as a normal FUSE request. =
*/
> +static void fuse_compound_send_legacy(struct fuse_mount *fm,
> +                                     struct fuse_compound_op *ops,
> +                                     unsigned int count)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < count; i++) {
> +               struct fuse_compound_op *cur =3D &ops[i];
> +
> +               if (cur->dep_index !=3D FUSE_COMPOUND_NO_DEP) {
> +                       struct fuse_compound_op *dep;
> +
> +                       /*
> +                        * dep_index must refer to an earlier subop in th=
e
> +                        * same compound so its result is already availab=
le.
> +                        * A forward or self reference is a caller bug; f=
ail
> +                        * the subop loudly instead of reading uninitiali=
sed
> +                        * memory.
> +                        */
> +                       if (WARN_ON_ONCE(cur->dep_index >=3D i)) {
> +                               *cur->error =3D -EINVAL;
> +                               continue;
> +                       }
> +                       dep =3D &ops[cur->dep_index];
> +
> +                       if (*dep->error) {
> +                               *cur->error =3D *dep->error;
> +                               continue;
> +                       }
> +                       fuse_compound_propagate_nodeid(cur->arg, dep->arg=
);
> +               }
> +               *cur->error =3D fuse_simple_request(fm, cur->arg);
> +       }
> +}
> +
> +/*
> + * Send a compound request.  Per-subop status is reported via the @error
> + * pointer of each fuse_compound_op; the return value is 0 if the
> + * compound was dispatched (whether server-side or via the legacy
> + * fallback) and a negative errno only if dispatch itself failed.
> + *
> + * Server-side decline signaling:
> + *   -ENOSYS      Compound is not implemented at all.  Disable the
> + *                feature for this connection and fall back to legacy
> + *                dispatch for this and every subsequent request.
> + *   -EOPNOTSUPP  This specific compound combination is not supported,
> + *                but the feature remains usable.  Fall back to legacy
> + *                dispatch for this request only; leave fc->compound_ops
> + *                set so future requests may still go through compound.
> + *
> + * (ENOTSUPP is a Linux-internal errno > 511 and is rejected by
> + * fuse_dev_do_write(), so a userspace server cannot signal it.)
> + */
> +int fuse_compound_send(struct fuse_mount *fm,
> +                      struct fuse_compound_op *ops, unsigned int count)
> +{
> +       struct fuse_conn *fc =3D fm->fc;
> +       struct fuse_compound_args compound =3D {
> +               .args =3D { .opcode =3D FUSE_COMPOUND, },
> +               .ops =3D ops,
> +               .count =3D count,
> +       };
> +       int ret;
> +
> +       if (WARN_ON_ONCE(count =3D=3D 0))
> +               return -EINVAL;
> +
> +       if (!fc->compound_ops) {
> +               fuse_compound_send_legacy(fm, ops, count);
> +               return 0;
> +       }
> +
> +       ret =3D fuse_simple_request(fm, &compound.args);
> +       if (ret =3D=3D -ENOSYS)
> +               fc->compound_ops =3D 0;
> +       if (ret =3D=3D -ENOSYS || ret =3D=3D -EOPNOTSUPP) {
> +               fuse_compound_send_legacy(fm, ops, count);
> +               return 0;
> +       }
> +       return ret;
> +}
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 5dda7080f4a9..7b20e4e9971a 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -413,11 +413,47 @@ const struct fuse_iqueue_ops fuse_dev_fiq_ops =3D {
>  };
>  EXPORT_SYMBOL_GPL(fuse_dev_fiq_ops);
>
> +static inline struct fuse_compound_args *
> +fuse_get_compound_args(struct fuse_args *args)
> +{
> +       if (args->opcode =3D=3D FUSE_COMPOUND)
> +               return container_of(args, struct fuse_compound_args, args=
);
> +       return NULL;
> +}
> +
> +static size_t fuse_compound_req_size(struct fuse_compound_args *compound=
)
> +{
> +       size_t total =3D sizeof(struct fuse_in_header) +
> +                      sizeof(struct fuse_compound_in);
> +       unsigned int i, j;
> +
> +       for (i =3D 0; i < compound->count; i++) {
> +               struct fuse_args *op_args =3D compound->ops[i].arg;
> +
> +               total +=3D sizeof(struct fuse_compound_req_in) +
> +                        sizeof(struct fuse_in_header);
> +               for (j =3D 0; j < op_args->in_numargs; j++)
> +                       total +=3D op_args->in_args[j].size;
> +       }
> +
> +       return total;
> +}
> +
> +void fuse_set_req_len(struct fuse_req *req)
> +{
> +       struct fuse_compound_args *compound =3D fuse_get_compound_args(re=
q->args);
> +
> +       if (compound)
> +               req->in.h.len =3D fuse_compound_req_size(compound);
> +       else
> +               req->in.h.len =3D sizeof(struct fuse_in_header) +
> +                       fuse_len_args(req->args->in_numargs,
> +                                     (struct fuse_arg *)req->args->in_ar=
gs);
> +}
> +
>  static void fuse_send_one(struct fuse_iqueue *fiq, struct fuse_req *req)
>  {
> -       req->in.h.len =3D sizeof(struct fuse_in_header) +
> -               fuse_len_args(req->args->in_numargs,
> -                             (struct fuse_arg *) req->args->in_args);
> +       fuse_set_req_len(req);
>         fiq->ops->send_req(fiq, req);
>  }
>
> @@ -713,9 +749,7 @@ static bool fuse_request_queue_background_uring(struc=
t fuse_conn *fc,
>  {
>         struct fuse_iqueue *fiq =3D &fc->iq;
>
> -       req->in.h.len =3D sizeof(struct fuse_in_header) +
> -               fuse_len_args(req->args->in_numargs,
> -                             (struct fuse_arg *) req->args->in_args);
> +       fuse_set_req_len(req);
>         fuse_request_assign_unique(fiq, req);
>
>         return fuse_uring_queue_bq_req(req);
> @@ -1204,7 +1238,7 @@ static int fuse_copy_folios(struct fuse_copy_state =
*cs, unsigned nbytes,
>  }
>
>  /* Copy a single argument in the request to/from userspace buffer */
> -static int fuse_copy_one(struct fuse_copy_state *cs, void *val, unsigned=
 size)
> +static int fuse_copy_one(struct fuse_copy_state *cs, void *val, unsigned=
 int size)
>  {
>         while (size) {
>                 if (!cs->len) {
> @@ -1399,6 +1433,66 @@ __releases(fiq->lock)
>                 return fuse_read_batch_forget(fiq, cs, nbytes);
>  }
>
> +/*
> + * Stream the body of a compound request directly from the per-subop
> + * argument buffers, avoiding a pre-built linear copy.
> + *
> + * The fuse_compound_in header is inlined in the request stream for
> + * /dev/fuse but for io-uring it is carried in a separate fixed slot
> + * (ent->headers->op_in) written before this function runs.
> + */
> +int fuse_copy_compound_in_args(struct fuse_copy_state *cs,
> +                              struct fuse_compound_args *compound)
> +{
> +       unsigned int i, j;
> +       int err;
> +
> +       if (!cs->is_uring) {
> +               err =3D fuse_copy_one(cs, &compound->in_header,
> +                                   sizeof(compound->in_header));
> +               if (err)
> +                       return err;
> +       }
> +
> +       for (i =3D 0; i < compound->count; i++) {
> +               struct fuse_compound_op *op =3D &compound->ops[i];
> +               struct fuse_args *op_args =3D op->arg;
> +               struct fuse_compound_req_in sub =3D {
> +                       .dep_index =3D op->dep_index,
> +               };
> +               /*
> +                * Inherit the outer request's credentials so each subop'=
s
> +                * fuse_in_header carries valid uid/gid/pid instead of
> +                * zeros that would mislead the server.
> +                */
> +               struct fuse_in_header hdr =3D {
> +                       .unique =3D i,
> +                       .opcode =3D op_args->opcode,
> +                       .nodeid =3D op_args->nodeid,
> +                       .uid    =3D cs->req->in.h.uid,
> +                       .gid    =3D cs->req->in.h.gid,
> +                       .pid    =3D cs->req->in.h.pid,
> +                       .len    =3D sizeof(hdr),
> +               };
> +
> +               for (j =3D 0; j < op_args->in_numargs; j++)
> +                       hdr.len +=3D op_args->in_args[j].size;
> +
> +               err =3D fuse_copy_one(cs, &sub, sizeof(sub));
> +               if (!err)
> +                       err =3D fuse_copy_one(cs, &hdr, sizeof(hdr));
> +               if (!err)
> +                       err =3D fuse_copy_args(cs, op_args->in_numargs,
> +                                            op_args->in_pages,
> +                                            (struct fuse_arg *)op_args->=
in_args,
> +                                            0);
> +               if (err)
> +                       return err;
> +       }
> +
> +       return 0;
> +}
> +
>  /*
>   * Read a single request into the userspace filesystem's buffer.  This
>   * function waits until a request is available, then removes it from
> @@ -1503,9 +1597,15 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *f=
ud, struct file *file,
>         spin_unlock(&fpq->lock);
>         cs->req =3D req;
>         err =3D fuse_copy_one(cs, &req->in.h, sizeof(req->in.h));
> -       if (!err)
> -               err =3D fuse_copy_args(cs, args->in_numargs, args->in_pag=
es,
> -                                    (struct fuse_arg *) args->in_args, 0=
);
> +       if (!err) {
> +               struct fuse_compound_args *compound =3D fuse_get_compound=
_args(args);
> +
> +               if (compound)
> +                       err =3D fuse_copy_compound_in_args(cs, compound);
> +               else
> +                       err =3D fuse_copy_args(cs, args->in_numargs, args=
->in_pages,
> +                                            (struct fuse_arg *)args->in_=
args, 0);
> +       }
>         fuse_copy_finish(cs);
>         spin_lock(&fpq->lock);
>         clear_bit(FR_LOCKED, &req->flags);
> @@ -2146,6 +2246,80 @@ struct fuse_req *fuse_request_find(struct fuse_pqu=
eue *fpq, u64 unique)
>         return NULL;
>  }
>
> +int fuse_copy_compound_out_args(struct fuse_copy_state *cs,
> +                               struct fuse_compound_args *compound)
> +{
> +       unsigned int i;
> +       int err;
> +
> +       err =3D fuse_copy_one(cs, &compound->out_header,
> +                           sizeof(compound->out_header));
> +       if (err)
> +               return err;
> +
> +       for (i =3D 0; i < compound->count; i++) {
> +               struct fuse_compound_op *op =3D &compound->ops[i];
> +               struct fuse_out_header op_hdr;
> +               size_t expected;
> +
> +               err =3D fuse_copy_one(cs, &op_hdr, sizeof(op_hdr));
> +               if (err)
> +                       return err;
> +               if (op_hdr.len < sizeof(op_hdr))
> +                       return -EIO;
> +               /*
> +                * Subop replies must echo the request's per-subop unique
> +                * back to the kernel; we wrote unique =3D i in
> +                * fuse_copy_compound_in_args() so the server is expected
> +                * to mirror it here.  Reject otherwise: a mismatch means
> +                * the server reordered or duplicated subop replies.
> +                */
> +               if (op_hdr.unique !=3D i)
> +                       return -EIO;
> +
> +               *op->error =3D op_hdr.error;
> +               if (op_hdr.error) {
> +                       /* Errored replies carry only the fuse_out_header=
. */
> +                       if (op_hdr.len !=3D sizeof(op_hdr))
> +                               return -EIO;
> +                       continue;
> +               }
> +
> +               /*
> +                * Validate the wire length against what the kernel can
> +                * accept.  expected is the maximum: sum of all declared
> +                * out_args plus the per-subop header.  Fixed-size subops
> +                * must match exactly; out_argvar subops may report any
> +                * length in [expected - lastarg->size, expected] and the
> +                * last arg shrinks to fit.  Mirrors fuse_copy_out_args()=
.
> +                */
> +               expected =3D sizeof(op_hdr) +
> +                       fuse_len_args(op->arg->out_numargs,
> +                                     op->arg->out_args);
> +               if (op_hdr.len > expected ||
> +                   (op_hdr.len < expected && !op->arg->out_argvar))
> +                       return -EIO;
> +               if (op_hdr.len < expected) {
> +                       struct fuse_arg *lastarg =3D
> +                               &op->arg->out_args[op->arg->out_numargs -=
 1];
> +                       size_t diff =3D expected - op_hdr.len;
> +
> +                       if (diff > lastarg->size)
> +                               return -EIO;
> +                       lastarg->size -=3D diff;
> +               }
> +
> +               err =3D fuse_copy_args(cs, op->arg->out_numargs,
> +                                    op->arg->out_pages,
> +                                    (struct fuse_arg *)op->arg->out_args=
,
> +                                    op->arg->page_zeroing);
> +               if (err)
> +                       return err;
> +       }
> +
> +       return 0;
> +}
> +

Move more of those compound helpers to compound.c instead of bloating dev.c

>  int fuse_copy_out_args(struct fuse_copy_state *cs, struct fuse_args *arg=
s,
>                        unsigned nbytes)
>  {
> @@ -2253,10 +2427,16 @@ static ssize_t fuse_dev_do_write(struct fuse_dev =
*fud,
>         if (!req->args->page_replace)
>                 cs->move_folios =3D false;
>
> -       if (oh.error)
> +       if (oh.error) {
>                 err =3D nbytes !=3D sizeof(oh) ? -EINVAL : 0;
> -       else
> -               err =3D fuse_copy_out_args(cs, req->args, nbytes);
> +       } else {
> +               struct fuse_compound_args *compound =3D fuse_get_compound=
_args(req->args);
> +
> +               if (compound)
> +                       err =3D fuse_copy_compound_out_args(cs, compound)=
;
> +               else
> +                       err =3D fuse_copy_out_args(cs, req->args, nbytes)=
;
> +       }
>         fuse_copy_finish(cs);
>
>         spin_lock(&fpq->lock);
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index 7b9822e8837b..f6eee4cff136 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -595,7 +595,14 @@ static int fuse_uring_copy_from_ring(struct fuse_rin=
g *ring,
>         cs.is_uring =3D true;
>         cs.req =3D req;
>
> -       err =3D fuse_copy_out_args(&cs, args, ring_in_out.payload_sz);
> +       if (args->opcode =3D=3D FUSE_COMPOUND) {
> +               /* Stream compound response directly into operation buffe=
rs */
> +               struct fuse_compound_args *compound =3D
> +                       container_of(args, struct fuse_compound_args, arg=
s);
> +               err =3D fuse_copy_compound_out_args(&cs, compound);
> +       } else {
> +               err =3D fuse_copy_out_args(&cs, args, ring_in_out.payload=
_sz);
> +       }
>         fuse_copy_finish(&cs);
>         return err;
>  }
> @@ -627,6 +634,27 @@ static int fuse_uring_args_to_ring(struct fuse_ring =
*ring, struct fuse_req *req,
>         cs.is_uring =3D true;
>         cs.req =3D req;
>
> +       if (args->opcode =3D=3D FUSE_COMPOUND) {
> +               /*
> +                * Treat fuse_compound_in as the per-op header: it goes
> +                * into ent->headers->op_in (matching the placement of an=
y
> +                * other op-specific header on the io-uring transport),
> +                * while the per-subop stream flows through ent->payload.
> +                */
> +               struct fuse_compound_args *compound =3D
> +                       container_of(args, struct fuse_compound_args, arg=
s);
> +
> +               err =3D copy_to_user(&ent->headers->op_in, &compound->in_=
header,
> +                                  sizeof(compound->in_header));
> +               if (err) {
> +                       pr_info_ratelimited("Copying the compound header =
failed.\n");
> +                       return -EFAULT;
> +               }
> +
> +               err =3D fuse_copy_compound_in_args(&cs, compound);
> +               goto out_finish;
> +       }
> +
>         if (num_args > 0) {
>                 /*
>                  * Expectation is that the first argument is the per op h=
eader.
> @@ -648,6 +676,7 @@ static int fuse_uring_args_to_ring(struct fuse_ring *=
ring, struct fuse_req *req,
>         /* copy the payload */
>         err =3D fuse_copy_args(&cs, num_args, args->in_pages,
>                              (struct fuse_arg *)in_args, 0);
> +out_finish:
>         fuse_copy_finish(&cs);
>         if (err) {
>                 pr_info_ratelimited("%s fuse_copy_args failed\n", __func_=
_);
> diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
> index 910f883cd090..5114b376fd34 100644
> --- a/fs/fuse/fuse_dev_i.h
> +++ b/fs/fuse/fuse_dev_i.h
> @@ -86,6 +86,11 @@ int fuse_copy_args(struct fuse_copy_state *cs, unsigne=
d int numargs,
>                    int zeroing);
>  int fuse_copy_out_args(struct fuse_copy_state *cs, struct fuse_args *arg=
s,
>                        unsigned int nbytes);
> +int fuse_copy_compound_in_args(struct fuse_copy_state *cs,
> +                              struct fuse_compound_args *compound);
> +int fuse_copy_compound_out_args(struct fuse_copy_state *cs,
> +                               struct fuse_compound_args *compound);
> +void fuse_set_req_len(struct fuse_req *req);
>  void fuse_dev_queue_forget(struct fuse_iqueue *fiq,
>                            struct fuse_forget_link *forget);
>  void fuse_dev_queue_interrupt(struct fuse_iqueue *fiq, struct fuse_req *=
req);
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 17423d4e3cfa..af4ea2af19d1 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -911,6 +911,9 @@ struct fuse_conn {
>         /** Passthrough support for read/write IO */
>         unsigned int passthrough:1;
>
> +       /* does fuse server support compound operations? */
> +       unsigned int compound_ops:1;
> +
>         /* Use pages instead of pointer for kernel I/O */
>         unsigned int use_pages_for_kvec_io:1;
>
> @@ -1272,6 +1275,35 @@ static inline ssize_t fuse_simple_idmap_request(st=
ruct mnt_idmap *idmap,
>  int fuse_simple_background(struct fuse_mount *fm, struct fuse_args *args=
,
>                            gfp_t gfp_flags);
>
> +/*
> + * One subrequest in a compound.  @dep_index is FUSE_COMPOUND_NO_DEP, or
> + * the index of an earlier op in the array whose output should be used t=
o
> + * fill in this op's nodeid before dispatch.  @error receives the per-op
> + * status after fuse_compound_send() returns.
> + */
> +struct fuse_compound_op {
> +       struct fuse_args        *arg;
> +       int                     *error;
> +       u8                      dep_index;
> +};
> +
> +/*
> + * Compound wrapper.  Embeds fuse_args as the first member so the device
> + * layer can container_of() back to the operation array.  The in_header
> + * and out_header fields are reserved-only today but reach the wire so
> + * future extensions can attach compound-level metadata.
> + */
> +struct fuse_compound_args {
> +       struct fuse_args        args;
> +       struct fuse_compound_op *ops;
> +       unsigned int            count;
> +       struct fuse_compound_in  in_header;
> +       struct fuse_compound_out out_header;
> +};
> +
> +int fuse_compound_send(struct fuse_mount *fm,
> +                      struct fuse_compound_op *ops, unsigned int count);
> +
>  /**
>   * Assign a unique id to a fuse request
>   */
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index deddfffb037f..c275864710b6 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1030,6 +1030,15 @@ void fuse_conn_init(struct fuse_conn *fc, struct f=
use_mount *fm,
>         fc->name_max =3D FUSE_NAME_LOW_MAX;
>         fc->timeout.req_timeout =3D 0;
>
> +       /*
> +        * Compound support is discovered by trial: assume the server
> +        * implements it and clear the flag on the first -ENOSYS reply.
> +        * Unlike most connection features there is no FUSE_INIT flag, so
> +        * default-on is correct here even though other capability bits
> +        * default to zero.
> +        */
> +       fc->compound_ops =3D 1;
> +
>         if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
>                 fuse_backing_files_init(fc);
>
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index c13e1f9a2f12..58dd07a6c53a 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -664,6 +664,13 @@ enum fuse_opcode {
>         FUSE_STATX              =3D 52,
>         FUSE_COPY_FILE_RANGE_64 =3D 53,
>
> +       /* A compound request is handled like a single request,
> +        * but contains multiple requests as input.
> +        * This can be used to signal to the fuse server that
> +        * the requests can be combined atomically.
> +        */
> +       FUSE_COMPOUND           =3D 54,
> +
>         /* CUSE specific operations */
>         CUSE_INIT               =3D 4096,
>
> @@ -1245,6 +1252,55 @@ struct fuse_supp_groups {
>         uint32_t        groups[];
>  };
>
> +/*
> + * Sentinel value for fuse_compound_req_in.dep_index meaning the
> + * subrequest does not depend on any other subrequest.  The dep_index
> + * field is a uint8_t so the largest dispatchable compound is bounded
> + * by FUSE_COMPOUND_MAX_OPS subrequests.
> + */
> +#define FUSE_COMPOUND_NO_DEP   0xff
> +
> +/*
> + * Compound request layout:
> + *
> + *     fuse_in_header (opcode FUSE_COMPOUND)
> + *     fuse_compound_in
> + *       fuse_compound_req_in
> + *       fuse_in_header
> + *       payload
> + *       ... (repeated per subrequest)
> + *
> + * The compound reply layout mirrors it:
> + *
> + *     fuse_out_header
> + *     fuse_compound_out
> + *       fuse_out_header
> + *       payload
> + *       ... (repeated per subrequest)
> + *
> + * fuse_compound_in / fuse_compound_out currently only carry reserved
> + * fields; they exist so future extensions can attach compound-level
> + * metadata without another wire-format change.
> + */
> +struct fuse_compound_in {
> +       uint64_t        reserved[2];
> +};
> +
> +struct fuse_compound_out {
> +       uint64_t        reserved[2];
> +};
> +
> +/*
> + * Per-subrequest header.  dep_index identifies an earlier subrequest in
> + * the same compound whose output should be threaded into this one's
> + * input (currently only the producing op's nodeid is propagated), or
> + * FUSE_COMPOUND_NO_DEP if the subrequest is independent.
> + */
> +struct fuse_compound_req_in {
> +       uint8_t         dep_index;
> +       uint8_t         reserved[3];
> +};
> +


It's ok that currently only nodeid (outarg[0]) is propagated,
but I think that the UAPI should describe that this is the case.
Something like this?

       uint8_t        dep_index;
       uint8_t        dep_arg_idx;
       uint8_t        dep_arg_type;
};

We probably don't need to waste uint8_t on dep_arg_idx IDK

TBH, I did not look at NFS/SMB compound protocols, not io_uring
command chains, so I would appreciate it if you include a survey of the
state of the art in other protocols practices for compound commands.

Thanks,
Amir.
