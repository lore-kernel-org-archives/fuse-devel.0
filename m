Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3AD354AEB
	for <fuse-devel@lists.linux.dev>; Wed, 12 Aug 2026 22:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786575398; cv=pass; b=ADA6IBysoUIjh8Mm31Duqb+wk5nWOInhxGKGM2C8l2hkc8eezqexi/1V6fJx+QcPU3ZwIF8v50+lvmo6IYDws5EgDwmX0iZVs8tx/qno3afb856ZyvgcGlJk8y42ZmqM4kvtfq1UyKcZUjIcnkXc8GzYIyS40WqOvwqdNtLWT50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786575398; c=relaxed/simple;
	bh=UwyX12eswgl4hn1G7pIj87+RxHQ/cegwqefni268PEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dOH3Lu/IxUHYOQSfYuLY96bb8E1tq8j0WaoXttdt59sKYT1Dxme9NqQPTnwkfatskUFLDvHLS6QeOlUUJ5gJdpLEoBnRoK05OEcH75w5UVTtVMT8My/t9hjakkWc256Cr+qOtoA/nRc3gvWbJwUu7bQbwD5pbY4NzcfFfr8sliI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C20FORON; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C20FORON"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-481412f1828so17995f8f.1
        for <fuse-devel@lists.linux.dev>; Wed, 12 Aug 2026 15:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786575395; cv=none;
        d=google.com; s=arc-20260327;
        b=QM1rpRlYuvyOva/Eo/xcjgXOJ5pjNpXiKUyjvQsAqltef/Ft0lx+qlCGPbi6xkeJAW
         2AE/TFCijCjgAhu+x2kHN0+8O0nwmcO954DaXTNYoPISsQFRHEjArP05UkDFcwMpikOo
         TJzj7PEWStWElOA8d5v+0Zj+ebcF8Px8uAg0wdPas/ZN/aiaR2FN7AIWgu1CZzxrMg87
         XEjizQ/EhWLT3HONMNHznsPOihX8bFznaD7TuBld7LDBDqssJuzgW4td+nRTkUuJjq4y
         lVPW4moLxqbuQ7Rpqu3C8TBg7LkBbzhxhhvC4ar+N8VNQdZEurkszaRQmrk4PvfOWLQI
         OpkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tYZpTcG5GY79KMqhBVdEHaae8De11zVxOOo+5uwDqsM=;
        fh=M85V0zdSlyNXQLkzto3wap1I9rlwIMhoJ0pTIchrKpU=;
        b=sHE5A1Dre+e9MbcxCw+EE2zF+MWMrADIdcEQKe5WNxE1aOXYUjuJLHCrlP/rbMu66g
         m89d3ufonpj1TGi/M21jNH1kyBydUOKXIjcyKP9F16FAT1/fbsMSKTd3onNTBw1/Zp4z
         oFgFmxy+xUFxqIMp8+M6TDqG6Z+WNtXQ4Kh5eDAkYcahkiWOP4+P/ubCBUExCj7eWl43
         HVo1gthUFBqheu0uVFfVRELviOhlx1Z0/XJ9oo1wViuCysRbhhvvZPmqTnoFkWOEPAua
         AwAK7BFyVF2CPDytBjdiDumtP5Cu8ttHjd02iOs1K2BYZLXzj/tR4DX1PmUpWUuvHyQN
         KB6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786575395; x=1787180195; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tYZpTcG5GY79KMqhBVdEHaae8De11zVxOOo+5uwDqsM=;
        b=C20FORONamcZwP7e3AvS5TTfrjCjhNSGyV3kgw7SxKhWxRtwFglnir8KSpPwq28PJK
         jJuScGYelHWaRKw+Ax6B/RDJWcHXu1u/+h8R6THycx2MPGNhgKZk0L1Cvh15awrD1vnW
         N296Kw0xbudY0guR9JJMeRLOj03M0LRwPmdfb/iukQkBlWhURpSVTA6XzqBJM0EsLbkg
         /5XwAyiLHhtmK9uRdqH7bSOujYslSL7JTWBGJakhYi6Ha315dbpD3IfbIGfIneM8NAev
         mSJY9NtTxBxo26a1sY4azNtZKWiOjiixcpNYP8B8NJ8aFtYS2XYBFjt4RbWe25wGwREv
         EXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786575395; x=1787180195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYZpTcG5GY79KMqhBVdEHaae8De11zVxOOo+5uwDqsM=;
        b=N/VO0W5ZInt3N5fkVs3h2iqBJ1LeQ9vrfiw0O5f+rMFJaZ8qRk9bOsNKYjAYk/cKIK
         L4NRt4pb3JuVVXaYi1Ghsrn/K4IFdnbDIvBj7nO9k54mZ12lDoaJzS9DwvqEaDF0mPFr
         CKopDvxR/zWSMoqwnKIo9ePRoqTDD2quj3NFbcmo75GJT2d5yBo9wnr2I4u2HNPWnWkq
         LaLgmbl3tn0VJes07ubtFjW/+ZQcEeW09MD4yDODSCDZwTJkmbhzXCvGo0PvAZS8OHG8
         J8FBEzf3UAnB4IXvwdhK+EiM07SBEFgDM5HhHGJ5nesdD5RjtixyyDn4zRkGp1UboWGU
         W0gQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6hlGyyglZ28/tAQJi7g8IpHxP4iLkyFxCmXwoelCTwshpNOJ8HaqnWiQ4JY3eDLfvtnr7ZwZfC8/u@lists.linux.dev
X-Gm-Message-State: AOJu0YwbZcvd4f3yv1BG9vp7UsI7KsLR8k01nEnsNj67bBzbWxLJE8W+
	Xy59Z5VWJ6ZOd58//EIe60adk+WI/B0ZXWwm3LaqWuqZ02GuLGiitiDlWr5CClVt8No/TpgJYUt
	zf4h1bLpmqQNTaY88dLp1Qbm7S1Qb8yo=
X-Gm-Gg: AR+sD12IEVvtA8365xfVqVqFS6keqgQwHppDeWzc46SMF4i1v+FIDIiAY6R+NWOLWj1
	0hehTF6igJplY5b5yjhdcRsce2w/BTbkGhDy1zq5mQRriLVm4KLTdLZUo2GgY0uBq+CFpnvow9u
	LD9DsTnAoeWjtYMOWunbpnJev1Ir2RqJTcb7reesO5yVVbRSpz+irjSOsNvDiHy7e2I6RYY0IkP
	Z7yAodCd0XOy9V/R4F3ANHtL6iC2nugc/GimbU4Frs2SiVCbxAJ/bUEF4FekFwvSqZ4AF9DGztJ
	30zEkXBDCe1qO7RoML42IxKNinvzx9bscrDyYLEOzSDfmY/PDnXNsz1xWc/3pU6oCwmWDUkdn4a
	Ilst5y/DfbLN6EGCE+uG48y3J
X-Received: by 2002:a5d:64cb:0:b0:481:51b5:7503 with SMTP id
 ffacd0b85a97d-48159cbfa53mr1910909f8f.7.1786575394650; Wed, 12 Aug 2026
 15:56:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-5-joannelkoong@gmail.com> <fa4e1520-b36e-4619-a1b2-5974f27a5cc4@bsbernd.com>
In-Reply-To: <fa4e1520-b36e-4619-a1b2-5974f27a5cc4@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 12 Aug 2026 15:56:23 -0700
X-Gm-Features: AUfX_myvP33zIwa1xw28U30FGa1YoCSGEZvUWyJt-Gqqiinb59OqnZnxZZZC9go
Message-ID: <CAJnrk1ah0+F+VvpGnLJwqmKFRfb1Bo8Vc_V6ucy5=9JQT=G9Wg@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] fuse: support registered buffer pools in io-uring
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, libaokun@linux.alibaba.com, 
	axboe@kernel.dk, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 3:45=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
>
> On 7/16/26 19:59, Joanne Koong wrote:
> > Allow servers to use a buffer pool that is also registered through
> > io-uring. When the server registers a buffer pool with io-uring, the
> > pages backing the pool are pinned upfront. This eliminates the overhead
> > of pinning/unpinning user pages and translating virtual addresses per
> > i/o request. This also allows servers to use the same registered memory
> > for subsequent backing store I/O (eg read_fixed/write_fixed), keeping
> > data in the same pinned pages without additional pinning or mapping
> > overhead required.
> >
> > To use this, the server needs to set the FUSE_URING_REGISTERED_BUFPOOL
> > flag when adding a bufpool through the FUSE_IO_URING_CMD_ADD_BUFPOOL
> > cmd. For every sqe submitted (including the one for adding the bufpool)=
,
> > it should set sqe->uring_cmd_flags to include IORING_URING_CMD_FIXED,
> > and pass in the index where the registered bufpool resides to
> > sqe->buf_index.
> >
> > Benchmarked with passthrough_hp (--nopassthrough, q_depth=3D8) on a
> > 2-socket Intel Xeon Gold 6138 (40 cores / 80 threads), using fio (sync
> > engine, bs=3D1M, O_DIRECT, numjobs=3D2, 30s run + 10s ramp, 3 runs) whe=
re
> > direct-I/O throughput is against a RAM-backed (tmpfs) source (backing
> > I/O is not the bottleneck):
> >
> >                   baseline      registered buffers
> >   direct read       ~5.1 GB/s     ~5.4 GB/s   (+~5%)
> >   direct write      ~3.4 GB/s     ~4.8 GB/s   (+~45%)
> >
> > Registered buffers bring up the write path speed up closer to speed of
> > reads. There isn't much improvement for reads because it is already fas=
t
> > enough where it's at the copy-bound ceiling (surpassing that requires
> > doing zero-copy). On a device-bound NVMe though, the differences are
> > within noise, as backing I/O dominates per-request latency.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/dev_uring.c       | 122 +++++++++++++++++++++++++++++++-------
> >  fs/fuse/dev_uring_i.h     |   8 +++
> >  include/uapi/linux/fuse.h |   4 ++
> >  3 files changed, 112 insertions(+), 22 deletions(-)
> >
> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index e9da92b46090..ed7e783bd68d 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -22,6 +22,8 @@ MODULE_PARM_DESC(enable_uring,
> >  #define FUSE_URING_IOV_HEADERS 0
> >  #define FUSE_URING_IOV_PAYLOAD 1
> >
> > +#define FUSE_URING_ADD_BUFPOOL_FLAGS (FUSE_URING_REGISTERED_BUFPOOL)
> > +
> >  bool fuse_uring_enabled(void)
> >  {
> >       return enable_uring;
> > @@ -47,6 +49,27 @@ static inline bool bufpool_enabled(struct fuse_ring_=
queue *queue)
> >       return queue->payload_mode =3D=3D FUSE_PAYLOAD_BUFPOOL;
> >  }
> >
> > +static inline bool bufpool_registered(struct fuse_ring_queue *queue)
> > +{
> > +     return queue->bufpool && queue->bufpool->registered;
> > +}
> > +
> > +/*
> > + * For a registered bufpool, every sqe that drives a payload import (R=
EGISTER,
> > + * COMMIT_AND_FETCH) must carry the registered buffer index of the poo=
l.
> > + * This also must be called from the command's issue handler, where cm=
d->sqe is
> > + * still valid
> > + */
> > +static inline bool fuse_uring_cmd_index_ok(struct io_uring_cmd *cmd,
> > +                                        struct fuse_ring_queue *queue)
> > +{
> > +     if (!bufpool_registered(queue))
> > +             return true;
> > +
> > +     return (cmd->flags & IORING_URING_CMD_FIXED) &&
> > +            READ_ONCE(cmd->sqe->buf_index) =3D=3D queue->bufpool->regi=
stered_index;
> > +}
> > +
> >  static void uring_cmd_set_ring_ent(struct io_uring_cmd *cmd,
> >                                  struct fuse_ring_ent *ring_ent)
> >  {
> > @@ -653,19 +676,42 @@ static int copy_header_from_ring(struct fuse_ring=
_ent *ent,
> >       return 0;
> >  }
> >
> > +static int fuse_uring_import_payload(struct fuse_ring_ent *ent, int di=
r,
> > +                                  struct iov_iter *iter,
> > +                                  unsigned int issue_flags)
> > +{
> > +     void __user *base =3D ent->payload.iov_base;
> > +     size_t len =3D ent->payload.iov_len;
> > +     int err =3D 0;
> > +
> > +     if (!base) {
> > +             memset(iter, 0, sizeof(*iter));
> > +             return 0;
> > +     }
> > +
> > +     if (bufpool_registered(ent->queue))
> > +             err =3D io_uring_cmd_import_fixed((u64)(uintptr_t)base, l=
en, dir,
> > +                                             iter, ent->cmd, issue_fla=
gs);
> > +     else
> > +             err =3D import_ubuf(dir, base, len, iter);
>
> Hmm ok, just an annotation, I have to admit that I don't like
> issue_flags too much. Especially for the optimization that DDN has by
> avoiding io_uring_cmd_complete_in_task(), IO_URING_F_UNLOCKED is rather
> painful. Additionaly with that optimization the lock might get
> contended. The new addition here doesn't introduce it, but also doesn't
> make it any better.

For what it's worth, the locks aren't taken on these paths (eg sends
go through fuse_uring_dispatch_ent() ->
io_uring_cmd_complete_in_task() and task work runs with
ctx->uring_lock held, and commits run in the command's issue handler,
where the lock is likewise held).

Threading the issue_flags through gets a bit annoying, but I
personally don't see a better way for core io-uring infrastructure to
determine whether a given call path already holds the lock or not.

>
> > +
> > +     if (err)
> > +             pr_info_ratelimited("fuse: Import of user buffer failed\n=
");
> > +
> > +     return err;
> > +}
> > +
> > @@ -1362,8 +1421,21 @@ static int fuse_uring_add_bufpool(struct io_urin=
g_cmd *cmd,
> >       uintptr_t pool_uaddr;
> >       unsigned int pool_len, nr_bufs;
> >       size_t pool_size, buf_size;
> > +     bool registered =3D flags & FUSE_URING_REGISTERED_BUFPOOL;
> > +
> > +     if (!ring || qid >=3D ring->nr_queues)
> > +             return -EINVAL;
> >
> > -     if (!ring || qid >=3D ring->nr_queues || flags)
> > +     if (flags & ~FUSE_URING_ADD_BUFPOOL_FLAGS)
> > +             return -EINVAL;
> > +
> > +     /*
> > +      * A registered bufpool is reached through an io_uring fixed buff=
er, so
> > +      * this command must be submitted with IORING_URING_CMD_FIXED and=
 the
> > +      * registered buffer index in sqe->buf_index. That index is recor=
ded
> > +      * below and enforced on every REGISTER / COMMIT_AND_FETCH sqe.
> > +      */
> > +     if (registered && !(cmd->flags & IORING_URING_CMD_FIXED))
> >               return -EINVAL;
>
> Hmm, why do we actually need FUSE_URING_REGISTERED_BUFPOOL if the
> decision can be made by IORING_URING_CMD_FIXED?

It's not strictly needed, but imo it makes uapi more explicit and the
contract more clear. I don't feel strongly about this though, I'm fine
with either approach.

>
> >
> > diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
> > index cdf56f8b38b5..e142cae43022 100644
> > --- a/fs/fuse/dev_uring_i.h
> > +++ b/fs/fuse/dev_uring_i.h
> > @@ -49,6 +49,14 @@ enum fuse_queue_payload_mode {
> >  };
> >
> >  struct fuse_bufpool {
> > +     bool registered;
> > +
> > +     /*
> > +      * io_uring registered buffer table index for this pool, bound at
> > +      * ADD_BUFPOOL time. Only valid if the bufpool is registered
> > +      */
> > +     u16 registered_index;
>
> Dunno, could this go into the previous commit or be reserved in the
> previous commit? This addition make bisect hard due to ABI change?

This is an addition to a kernel-internal struct, not an uapi-defined
one, so I don't think this affects ABI. The previous commit doesn't
have any notion of registered buffers, so I think moving these
definitions to the previous commit would be confusing.

Thanks,
Joanne
