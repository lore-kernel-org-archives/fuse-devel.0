Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E2927587D
	for <fuse-devel@lists.linux.dev>; Tue, 14 Jul 2026 23:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073410; cv=pass; b=irom0K7f2chSMbWhZR3P1qSk9ntHDqsyogFNhX3oTm/J6EU9RmnTT7h12YAruEaXtjE0Zf9Ja4uwwrJPWERrp81wQW+Mq9ucOKwxWDxsB3H0aKrnMXhvz6EIq0LQEkpUjYbqwbCpLPSGHU2zegbGfy0J7bIRYmXm/LryMPK51vE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073410; c=relaxed/simple;
	bh=6Fpv/SB25gudhh3flfFdWSjRk6FL3uKgMmFq0SGfsa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJGdDaoPGxrOruWf3glBmS1deObp3ox5hQ67no3iRFKpeZ2SfPqRtQlUv131OOwOjKE6lklfa4Tc+lHm1LuDzCF+V7zv9dzMszFqMzKu4xktZmyzuYpziA1/RPENkhlL8Eye60lz/5dkOnA5Hf+7OCkjt3TidW4DyeU8hgs4+PU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=XCJEpJ1C; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="XCJEpJ1C"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84847482584so1196838b3a.0
        for <fuse-devel@lists.linux.dev>; Tue, 14 Jul 2026 16:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784073408; cv=none;
        d=google.com; s=arc-20260327;
        b=UMbKksDLyMrr2Dwdy1yseaquv04StnogVI5CZG+xeScELXTcciH4W2uems4Dr9JNHl
         gTrWmvZTJ1n2nqf2G7CpB7ue3nrlbbD9kNKpPjDgqBuVLq2VbyUvgNeg+AaB4HJh8fum
         S2GVc4/08eDxwQSStAxoDoknKSZ+jDUc/nMc6PZxK9nbcZLL+HXEmvYkXNSjXXacIBfX
         Gi0p8kuR/P2jKjVG94wd7krTxCh9yl5BzCO7MbA2pwTrWw0pRW9bzK2H3Kaac25Zvs3V
         RYE3MZqOyPN8tPB80vg1R4vkbuXEZGA7Fd1RjtN+Y0F3jU9w4YfSKrtzUNx4E35FIOl3
         Bexw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wbAPfP4ZbZmDgX9Nwlzq5TjRPzqN58/bDtfUIlP4wNM=;
        fh=lblv571AwPgir4ZaAT5pIf8m5aDjqjJTMvQcuBIfbAA=;
        b=WTIdDO3CCw91aJGociRlCdM7m4751S10ux+Qe61wEjMKmbutY6oNf3m71+/rSHMILr
         4+wfGN+GKqrEkXaaQLpmKm4hrQMf4Eu8SupEpirBJkJLmSCCuGm0p2vzbVFHJ1x04t8h
         P4O7m3cI0PbJ9wL3jS3QYZpErmBusTi1Scfll/DEcxRSiFb/Z1kZ3UsUz4bJ00DomzsC
         KSdUjgP4yBILARLKdBTRJ7NTgu1W2eoUc/lLHpR3BIngCSWtAVEpNmFMrlNVlkmOzy5n
         rw6Q2Uw+hwEcOSRPWKtgWjei1giHTa30wgexKv2b2nYqERPcGLf1IvNdhs79idmLwiUk
         /aWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1784073408; x=1784678208; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wbAPfP4ZbZmDgX9Nwlzq5TjRPzqN58/bDtfUIlP4wNM=;
        b=XCJEpJ1C8xyPiUkuFlFHShNQfXbMzdevApX0hQXtfUEagEUKe1ZZAnL614KBBg/R1z
         Q/qTqLPFH+glFGnAln4YdX9I95KhWj/HXUbBQ0ntkrZ3GS6XfzjmiqXrbwvxO0B5v5Sw
         gRfzIR9v7/0qXJzPwuhC+2GCbrfmRTdcbxoLzmJeBTaqs8bD2ruSqVQMzTuzSkl78R0l
         3NWWf9s3eiLUdi++gzeevBL5LpqlnRo9mD62KCZRwEnn9P200NSGdkWX/NZlJafdrGlw
         RR2fSi6CSe7FUsIhbbUgJsQOIjwqW9ChIDwStnt62bBUueFkESQQWJYm5hduRSfUsgJL
         yhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784073408; x=1784678208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbAPfP4ZbZmDgX9Nwlzq5TjRPzqN58/bDtfUIlP4wNM=;
        b=ZhLIExx2fHBa8bYMO+MC3GvdPdJ/P2xtTqIHDQ8Z0Nj9BiS/CMG6nu0baZRvMEhiPV
         guqIecbvZNtZPf0uE9xpUtkLGSh01dUAWTJClLWp2NTZAX2x8AbZoEEvHAr5ahTgD0Qp
         9lZgOtRB/8jjRokdp52waYmr8oKe3D1iiYY5u6R4T97CWH+Jbq25D58pkHDjzuGXrCCX
         2e7M0h7hFKmV1rXKTApPY99VbQxy15gncrlwukkXOZkK0WC1nXtYPyIksiU8RJm/zfA2
         NPQVW/l3G0cgvwNax7y+HTrhNy5JVps/2Ys94rgK6L6O6GJ4p+K+uLMF5yND5u6aXPRA
         ZkZg==
X-Gm-Message-State: AOJu0YxGsSM8TGmRJHK4umijwTM/kMH5cipOcGKKXxLgM6SkAEovrvNt
	/XaYb1Abf11wpP5sVv+Q09S5A5LSxqyXa5VvY+uAnh33BUbkd5EVpipwRvaBSmIgvtehLq3a1Ju
	LXSF0bcS59NC9+miGkRsKNSOGbat9PvV4Mm1X8QOy
X-Gm-Gg: AfdE7cmZzMBtAYyBIzBbHEDxU2zruc0a8yL9bjMjQm76Da+LjbCRQQ5a+JUj8Hp+H/9
	QUzfY2RU77sSXpEsuf3punOgqro4nr86gP1mVYXt7MkcT6gncWJ77b8tSuBE5Xj2qR72n5TAPoZ
	lYtbrvYMBH2eqKMJhK6Zj4WXh6WUoGtO56qNAHz0xKh4ZCWNumVJpzflJIS8BnIyrP05997IUy4
	o20MSzMV0VXzf0lDzccOZaJH57JVR5S25MBrmseUowpBYWGEkI7hBDlQuJ6of2MHhBD0CAo
X-Received: by 2002:a05:6a00:1d09:b0:848:2f58:e1ec with SMTP id
 d2e1a72fcca58-84870798902mr15715102b3a.39.1784073408405; Tue, 14 Jul 2026
 16:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709211130.543773-1-xmei5@asu.edu> <26a9a225-617c-4492-af1d-152d71414f4d@linux.alibaba.com>
In-Reply-To: <26a9a225-617c-4492-af1d-152d71414f4d@linux.alibaba.com>
From: Xiang Mei <xmei5@asu.edu>
Date: Tue, 14 Jul 2026 16:56:36 -0700
X-Gm-Features: AUfX_mw5OdcJsljs_oJJ0LuEjIoWcseG9aZEf-wHZwZ0vy0tq-WnqPuMiDAI62k
Message-ID: <CAPpSM+QrQk8k8NH5Qz5XHf-O=U0Et_OJFpP4iBtX4dkJ8gamEg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] fuse: copy request headers via a stack buffer for io-uring
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: fuse-devel@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Luis Henriques <luis@igalia.com>, Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Joanne Koong <joannelkoong@gmail.com>, 
	Kees Cook <kees@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 1:20=E2=80=AFAM Baokun Li <libaokun@linux.alibaba.c=
om> wrote:
>
> Hi Xiang,
>
> On 2026/7/10 05:11, Xiang Mei wrote:
> > The fuse-io-uring transport copies req->in.h out to the ring in
> > fuse_uring_copy_to_ring() and req->out.h back in fuse_uring_commit().
> > Both headers live inside the fuse_request slab object, whose cache
> > (fuse_req_cachep) is created without a usercopy whitelist,
>
>
> Then why not allocate "fuse_request" with kmem_cache_create_usercopy()
> to add a usercopy whitelist instead?
>
> That would avoid the extra stack usage for the bounce headers and
> the 56 bytes of copying they incur.
>
>
> Thanks,
> Baokun
You are right. I have dropped previous reviewers' tags and sent a v4
since it's a hot path:
https://lore.kernel.org/fuse-devel/20260714235408.1666063-1-xmei5@asu.edu/T=
/#t

Xiang
>
> >  so copying
> > them directly to/from userspace trips CONFIG_HARDENED_USERCOPY and
> > panics:
> >
> >   usercopy: Kernel memory exposure attempt detected from SLUB object
> >   'fuse_request' (offset 56, size 40)!
> >   kernel BUG at mm/usercopy.c:102!
> >   RIP: 0010:usercopy_abort+0x6c/0x80
> >   Call Trace:
> >    __check_heap_object
> >    __check_object_size
> >    copy_header_to_ring          fs/fuse/dev_uring.c:618
> >    fuse_uring_prepare_send
> >    fuse_uring_send_in_task
> >    ...
> >    __do_sys_io_uring_enter
> >    entry_SYSCALL_64_after_hwframe
> >
> > Bounce both headers through an on-stack copy so the usercopy touches
> > stack memory, not the slab object.
> >
> > Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> > Cc: stable@vger.kernel.org
> > Reported-by: Weiming Shi <bestswngs@gmail.com>
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Xiang Mei <xmei5@asu.edu>
> > Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
> > Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> > v3: no context change; add Bernd's Reviewed-by
> >
> >  fs/fuse/dev_uring.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index 77c8cec43d9c..0814681eb04b 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -744,6 +744,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring=
_ent *ent,
> >  {
> >       struct fuse_ring_queue *queue =3D ent->queue;
> >       struct fuse_ring *ring =3D queue->ring;
> > +     struct fuse_in_header in_header;
> >       int err;
> >
> >       err =3D -EIO;
> > @@ -765,8 +766,9 @@ static int fuse_uring_copy_to_ring(struct fuse_ring=
_ent *ent,
> >       }
> >
> >       /* copy fuse_in_header */
> > -     return copy_header_to_ring(ent, FUSE_URING_HEADER_IN_OUT, &req->i=
n.h,
> > -                                sizeof(req->in.h));
> > +     in_header =3D req->in.h;
> > +     return copy_header_to_ring(ent, FUSE_URING_HEADER_IN_OUT, &in_hea=
der,
> > +                                sizeof(in_header));
> >  }
> >
> >  static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
> > @@ -871,11 +873,13 @@ static void fuse_uring_commit(struct fuse_ring_en=
t *ent, struct fuse_req *req,
> >                             unsigned int issue_flags)
> >  {
> >       struct fuse_ring *ring =3D ent->queue->ring;
> > +     struct fuse_out_header out_header;
> >       ssize_t err =3D -EFAULT;
> >
> > -     if (copy_header_from_ring(ent, FUSE_URING_HEADER_IN_OUT, &req->ou=
t.h,
> > -                               sizeof(req->out.h)))
> > +     if (copy_header_from_ring(ent, FUSE_URING_HEADER_IN_OUT, &out_hea=
der,
> > +                               sizeof(out_header)))
> >               goto out;
> > +     req->out.h =3D out_header;
> >
> >       err =3D fuse_uring_out_header_has_err(&req->out.h, req);
> >       if (err) {
>
>
