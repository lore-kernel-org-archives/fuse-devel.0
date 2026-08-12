Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA25408018
	for <fuse-devel@lists.linux.dev>; Wed, 12 Aug 2026 23:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786576787; cv=pass; b=nRYhjDiaQoygWG213xlwpdx7ebjbInrD7FL+3XfGAtfvQIvINGAfzuBKcRe9IYqOqcSGK8q8GOmefxBgFC1FkSMYn+iy2z0jEjIFgTMm8j+tRbv4H5L16bwzECrv+QBeWMQ2UiKbaEn7Gjx60ZPw+J7VWy7Zg9tms/aeGm9WXcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786576787; c=relaxed/simple;
	bh=RqrZVEpheupVi78GeJ35unxlMzydL3x8q+CUxSsurek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AskRhVEsXv2QSyaImPhORa86ynbtNr1lX3PrFdxgzG4KnzgFl4bMkpkp0JTy7bBNW9r372nXcGy/aUfh0QE+diCwcEajTQxWBYTHZc0hwNL8yqpCneyR8u8GJroJajH0k5iTFaYc/gByBm6VXas7NmsbtRFEU5CJoHemw1yoaiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRnMl9I/; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRnMl9I/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so1242105e9.1
        for <fuse-devel@lists.linux.dev>; Wed, 12 Aug 2026 16:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786576784; cv=none;
        d=google.com; s=arc-20260327;
        b=nd6Ie82NGooJJlJxUaCT+T2XyigdBWRp22JFKixe4xTiIi7IInx+Az8NPNvZpvy0/U
         2F22A8YTkR7yh+EBQ3QenLQl+vnbiL21M0751LemYFdNiuLh17dgKB/GxtuHiT05epjm
         4Ip3WYgmochKGZY4JT19GyOXR9NVgU15G2cCsd+IREUPH9DmqwUDxPu6WNopl7i9LRa/
         AyGzsRM+0PVX1mA8XTVjz5y/PeVRnQ13mIDSvJiIJDB2kRuXTEvKFj5QPVKzbnAtnIKJ
         y4sDm0N6XNfHIW6+EIOUHyjrJn2Ypi+d8WH+/1mPu6E5uhbfD/YfI38kYqyutEXSbHeB
         vlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HwLwR1AjzKC8ffpEFWQYMBIsJUFppGZ8czvUezjoncg=;
        fh=rhnxtrfwzubs7sd/z5cjUBTMnyT1ewyQ9MXrPXnpZOE=;
        b=qPPbh2al17eyrq1snBHmLMKklxnn3IjpE7n6R1KKjSmr7aKznze+mARZby0wIC3UUz
         3KYo4JbawG7XatmrtivSH1a1ZlwKZDNymQ8S+bCwWWy3+CEe3I9rwts6BOExdOGnzw0U
         7UwC0dLMkK9S3zw/x7SiDO3XSaiB/5tdp+Z5Vc7M8yOQj/YHuVDh3NZsjanIF6wsPaeX
         7QIm4YwmvrKI5sMYy/OsKLczxux+hQMYHvuAluDkBSpjUe36JFf42atmlzfb6+yR1tcc
         CaSAR53qnjjH0mFK1c7gP+khOD3bHrPrvzgYJkmGmG8qylmu/vOPoXUYAtBJ7u4qtGid
         EJKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786576784; x=1787181584; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HwLwR1AjzKC8ffpEFWQYMBIsJUFppGZ8czvUezjoncg=;
        b=BRnMl9I/KQRyGVvOof7cC/1IBrbxJ8yKHaO4Fs3dKkZsi7Q9+7l/LS/3FYKKfdE63U
         bDoE8P2IynL/wiIJjOUF66EDm3BzXtJwcspDx8WTZnGriKWUjybtZD2n0xmSYp+CHd7T
         02oxPDw26ckyJla5LX8kkFrKtffZsx2uPT1e1DY7BLXtWOIWLkd5sZG9VJ9fATA8QNsy
         accQup7uOG/2OIZxBIQsGPPwBfKvk+UT0oFQPGbM67nbNfapwKnvD/W7reOTe2eU5mOo
         glhmeCOzO4dAhed66cYdqeN0eXUYCuhugofcPBUzTlOs2tMsoGnRQzTl89MS/XIYXWvh
         q8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786576784; x=1787181584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HwLwR1AjzKC8ffpEFWQYMBIsJUFppGZ8czvUezjoncg=;
        b=nllbmYO0nclaYtGLvx229pvmFVhsMIL+N9eG6Gl0DYy8RntQifjC130QF0krTdyFhK
         sGL9er6x+ezLGhqVdUiz5XpHjT4ZSauPpEHdEx40xUiLu3XFAPmq3wLF4ojZJZG1geaW
         FXyhayvx4BNqUfpwffYPyYBZtowKDw4Rfekxvi3CI41c+QZOLwluC0gsOX22HkmHNF/a
         f4we2UeIqqFDrDxaPuJds3UOlk3o8dKK9lWMIbd3w8T65FKWlj2VO7MxMvBIcT8dsArN
         JQEh76bifmdIsyM3KZRxMTAfqOGaUademmdU7DzmqoOxt/y4imhxK8+WO0uDfJS/Q75z
         v9LQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbumMYTx7Pk29eGoaRTYGYN8xLlPemmjRZgQ140c5lditfEU53AADoSjYGIzhu56TqejjLtlneBHt/@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4oLPozjl8KrA09BH/ZZ8kMuaSzWy9vqIeTMSuyO4wnDWjoKEb
	6d6UWj8e5YS+y0kGvo0p4RovAMXJUZSJ4udjPedjITbu6XdAWbQrZ9H0+r2sMkQ4YJEax2dAfHE
	4+0tEwo9YJT/ihXTxzMXY9vvHjkM90sVOXl7j
X-Gm-Gg: AR+sD114JKtd8Ep2p90srsUzQPdtsexfrD5AVnkeLTkQdPtZLIdz+ZwwqJubIIvihVy
	tyeNHbRG1FeZhc2P4BbOgaaPQAPmRLM9MmEtRTyYcblCEGIEF1lH1dUHLiXCQXtyQBWt+3UM3Ro
	IYCziglxVWCcMbJnTKP7Pbl/do4B9mIJl0JI49lKy59ULeKuQLIYr6CTwTNPlI56qMxKp169toE
	TE+q2U9Zv0U6oGMSsiUqJtnKWqrgfCGhimXTWRK8ED/jI4OdcSgh9sT4JgYM/d1cO84mkzDqBio
	XVKCVz47REAQGVmtUuXDf8HzcVHdvbpkR/RPaixakpZGdyRyNRKZxWSePGrdOCm6B4d4R7pmNSs
	a6qwauHryN6fNK0CANSi9ajHq
X-Received: by 2002:a05:600c:3143:b0:499:795a:c5fc with SMTP id
 5b1f17b1804b1-499821c5aeemr11676695e9.7.1786576783373; Wed, 12 Aug 2026
 16:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-6-joannelkoong@gmail.com> <777e9671-aff7-41e7-911c-dc3aacc877f3@bsbernd.com>
In-Reply-To: <777e9671-aff7-41e7-911c-dc3aacc877f3@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 12 Aug 2026 16:19:30 -0700
X-Gm-Features: AUfX_mzb2IzrFqWEfq2aRUblyEkuivSejhuAjnaSiNhZuciU6fSecF3ODv1ICiE
Message-ID: <CAJnrk1bmxOXn=4W8fgn1ckGsoJasQ0AzuZpBP46uA3bhQvyjLA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] fuse: add zero-copy over io-uring
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, libaokun@linux.alibaba.com, 
	axboe@kernel.dk, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 3:30=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
> > diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> > index d50792162d8b..3d1910a9db52 100644
> > --- a/fs/fuse/dev.c
> > +++ b/fs/fuse/dev.c
> > @@ -1247,11 +1247,20 @@ int fuse_copy_folio(struct fuse_copy_state *cs,=
 struct folio **foliop,
> >
> >       if (folio) {
> >               size =3D folio_size(folio);
> > -             if (zeroing && count < size)
> > -                     folio_zero_range(folio, 0, size);
> > +             if (zeroing && count < size) {
>
> This function is quite complex and long, maybe a comment here
>
> /* io-uring zery-copy */
>
> > +                     if (cs->skip_folio_copy) {
> > +                             if (offset)
> > +                                     folio_zero_range(folio, 0, offset=
);
> > +                             if (offset + count < size)
> > +                                     folio_zero_range(folio, offset + =
count,
> > +                                                      size - offset - =
count);
>
> Maybe
> folio_zero_segments(folio, 0, offset, offset + count, size);

Nice, didn't realize folio_zero_segments existed. I'll use this API.

>
> > +                     } else {
> > +                             folio_zero_range(folio, 0, size);
> > +                     }
> > +             }
> >       }
> >
> > -     while (count) {
> > +     while (!cs->skip_folio_copy && count) {
>
> For readibility and also to let the compiler know that
> cs->skip_folio_copy never changes, maybe at the top of the function
>
> const bool uring_zero_copy =3D cs->skip_folio_copy;
>
> and then
>
> while (!uring_zero_copy && count) {
>
>
> Also would avoid the comment I asked for above.

Sounds good, will do.

>
> >               if (cs->write && cs->pipebufs && folio) {
> >                       /*
> >                        * Can't control lifetime of pipe buffers, so alw=
ays
> > @@ -1344,6 +1353,10 @@ int fuse_copy_args(struct fuse_copy_state *cs, u=
nsigned numargs,
> >       for (i =3D 0; !err && i < numargs; i++)  {
> >               struct fuse_arg *arg =3D &args[i];
> >               if (i =3D=3D numargs - 1 && argpages)
> > +                     /*
> > +                      * if cs->skip_folio_copy is set, this just does =
any
> > +                      * needed zeroing. No copying is involved.
> > +                      */
> >                       err =3D fuse_copy_folios(cs, arg->size, zeroing);
> >               else
> >                       err =3D fuse_copy_one(cs, arg->value, arg->size);
> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index ed7e783bd68d..d7d517497a1e 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -23,6 +23,7 @@ MODULE_PARM_DESC(enable_uring,
> >  #define FUSE_URING_IOV_PAYLOAD 1
> >
> >  #define FUSE_URING_ADD_BUFPOOL_FLAGS (FUSE_URING_REGISTERED_BUFPOOL)
> > +#define FUSE_URING_ADD_QUEUE_FLAGS   (FUSE_URING_ZERO_COPY)
> >
> >  bool fuse_uring_enabled(void)
> >  {
> > @@ -33,6 +34,11 @@ struct fuse_uring_pdu {
> >       struct fuse_ring_ent *ent;
> >  };
> >
> > +struct fuse_zero_copy_bvs {
> > +     unsigned int nr_bvs;
> > +     struct bio_vec bvs[];
> > +};
> > +
> >  static const struct fuse_iqueue_ops fuse_io_uring_ops;
> >
> >  enum fuse_uring_header_type {
> > @@ -115,8 +121,36 @@ static void fuse_uring_flush_bg(struct fuse_ring_q=
ueue *queue)
> >       }
> >  }
> >
> > +static bool can_zero_copy_req(struct fuse_ring_ent *ent, struct fuse_r=
eq *req)
> > +{
> > +     struct fuse_args *args =3D req->args;
> > +
> > +     if (!ent->queue->zero_copy || !args->zero_copy)
> > +             return false;
> > +
> > +     if (args->opcode !=3D FUSE_READ && args->opcode !=3D FUSE_WRITE)
> > +             return false;
> > +
> > +     return args->in_pages || args->out_pages;
> > +}
> > +
> > +static void zero_copy_unregister(struct io_uring_cmd *cmd,
> > +                              struct fuse_ring_ent *ent,
> > +                              unsigned int issue_flags)
> > +{
> > +     if (ent->zero_copied) {
> > +             int err =3D io_buffer_unregister(cmd, ent->zero_copy_inde=
x,
> > +                                            issue_flags);
> > +
> > +             if (err)
> > +                     pr_warn_ratelimited("qid=3D%d zero-copy unregiste=
r failed: %d\n",
> > +                                         ent->queue->qid, err);
> > +             ent->zero_copied =3D false;
> > +     }
> > +}
> > +
> >  static void fuse_uring_req_end(struct fuse_ring_ent *ent, struct fuse_=
req *req,
> > -                            int error)
> > +                            int error, unsigned int issue_flags)
> >  {
> >       struct fuse_ring_queue *queue =3D ent->queue;
> >       struct fuse_ring *ring =3D queue->ring;
> > @@ -136,6 +170,8 @@ static void fuse_uring_req_end(struct fuse_ring_ent=
 *ent, struct fuse_req *req,
> >
> >       spin_unlock(&queue->lock);
> >
> > +     zero_copy_unregister(ent->cmd, ent, issue_flags);
> > +
> >       if (error)
> >               req->out.h.error =3D error;
> >
> > @@ -311,7 +347,7 @@ void fuse_uring_conn_init(struct fuse_chan *fch)
> >  }
> >
> >  static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_rin=
g *ring,
> > -                                                    int qid,
> > +                                                    int qid, bool zero=
_copy,
> >                                                      bool fail_if_exist=
s)
> >  {
> >       struct fuse_chan *fch =3D ring->chan;
> > @@ -330,6 +366,7 @@ static struct fuse_ring_queue *fuse_uring_create_qu=
eue(struct fuse_ring *ring,
> >       queue->qid =3D qid;
> >       queue->ring =3D ring;
> >       spin_lock_init(&queue->lock);
> > +     queue->zero_copy =3D zero_copy;
> >
> >       INIT_LIST_HEAD(&queue->ent_avail_queue);
> >       INIT_LIST_HEAD(&queue->ent_commit_queue);
> > @@ -715,6 +752,9 @@ static int setup_fuse_copy_state(struct fuse_copy_s=
tate *cs,
> >
> >       fuse_copy_init(cs, dir =3D=3D ITER_DEST, iter);
> >
> > +     if (ent->zero_copied)
> > +             cs->skip_folio_copy =3D true;
> > +
> >       cs->is_uring =3D true;
> >       cs->req =3D req;
> >
> > @@ -746,6 +786,62 @@ static int fuse_uring_copy_from_ring(struct fuse_r=
eq *req,
> >       return err;
> >  }
> >
> > +static void fuse_zero_copy_release(void *priv)
> > +{
> > +     struct fuse_zero_copy_bvs *zc_bvs =3D priv;
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < zc_bvs->nr_bvs; i++)
> > +             folio_put(page_folio(zc_bvs->bvs[i].bv_page));
> > +
> > +     kfree(zc_bvs);
>
> kvfree (see below)?
>
> > +}
> > +
> > +static int fuse_uring_set_up_zero_copy(struct fuse_ring_ent *ent,
> > +                                    struct fuse_req *req,
> > +                                    unsigned int issue_flags)
> > +{
> > +     struct fuse_args_pages *ap;
> > +     int err, i, ddir =3D 0;
> > +     struct fuse_zero_copy_bvs *zc_bvs;
> > +     struct bio_vec *bvs;
> > +
> > +     /* out_pages indicates a read, in_pages indicates a write */
> > +     if (req->args->out_pages)
> > +             ddir |=3D IO_BUF_DEST;
> > +     if (req->args->in_pages)
> > +             ddir |=3D IO_BUF_SOURCE;
> > +
> > +     ap =3D container_of(req->args, typeof(*ap), args);
> > +
> > +     zc_bvs =3D kmalloc(struct_size(zc_bvs, bvs, ap->num_folios),
> > +                      GFP_KERNEL_ACCOUNT);
>
> Assuming one folio per page and 1MB max_nr_pages:
>
> struct_size(zc_bvs, bvs, n) =3D=3D 8 + 16 * 256 =3D 4104
>
> Shouldn't this be kvmalloc()?

I'm not sure what the upper limit is for a kmalloc, but I'll change
this to kvmalloc().

>
>
> (otherwise looks good, will do another review in the morning, though).

Thanks for reviewing the patches!

Thanks,
Joanne
