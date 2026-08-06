Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9656A4248C5
	for <fuse-devel@lists.linux.dev>; Thu,  6 Aug 2026 22:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054750; cv=pass; b=j8CH44SViIOVSohwvUERmwWEddy7zR+yasbhrRfVNjntc/tgPxhLgIhTefyUACIhZwxKGGV0dJMzVZcY3a2qSfph6v3JSAMYMaY/K4kBoxhBmJATu2g4RSFUywZ27WRswLZURF52zE7BuZxCf04VSQjASLE61Sax04+HiNepmpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054750; c=relaxed/simple;
	bh=furuEMtrfOaQTsiNxKrQWpuWz4pjwbUTXMI8PUSc/Lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlZ8/5h/dpROmTxK2Q1rfzcSvEUNg53Z3O7EGbWqyiTB51n7429c77mSvxRrCWZ83mmyZLglOz3COnCY3apgrJ1+dLr27Ddzn0On62YsxScy36FCQhQY4J+Ofa43iGAP4QZ8ro1NYQAWAW2uVHVJYvGb5Fip3XeARsqkE6SYfJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0s0Lzzy; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0s0Lzzy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1906203f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 06 Aug 2026 15:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786054747; cv=none;
        d=google.com; s=arc-20260327;
        b=NaI2NulKQAuWU+q5UbfnDtdJA53MtW4l9sW3c4y3ljvgOD6cj4GdqM+hHobZ8aLzaB
         n252TYCZoQ9P71nGzV5IiBgln6fvVRrz0tDK+T9CIziCS6b+Rr5fSy/FSsH0j5QgKyX7
         EzALnmuk8zE9G+QOCh5F5HMzg1GdevkgRFa/W0WuZiUcWKItU17GeYL+k7QfKRNI/DHs
         1rjuxuCguPZc4sO9jkvx3k5B8tpMsSWks0Qh/A6fHlvL94sIvLSjeC//LtKpRMrgELf0
         hXNKKEmwzz3SkISXp+lvr9OXgvHF++FF5Vwatv22YAuOkAvduaRAjiItWdYTArjIJp/T
         mIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LY5mD6y+jHwiQHKRXtdt+aR6mgCxws3lvW47vALHQvE=;
        fh=QleTfS7LP3+W7MToTtH61rX9iPq54uzy9hyx6bjZcgw=;
        b=KPlBmc2jBV/GZS8NNpQMwepbpZ5EU55/lKFogEeKAGpN7f2pOCN/kFnbkg7QtKbrDo
         pxdc+fIgAOnjz0L+scBOff9YyUuTfp0wwktXVofpHpoFm5XisusZisoFLN+9g+1wP70A
         ET34R9NKIz2E5zBLPcEVJW6/pIM/JnfA1Bkky5+cx/tDLW11km42/t/COIWPF4hdOtbc
         OF3V89ViVKKpfTO19WUIzpI6HUfEUU1USH/n5CRcjl1UBG9PHujmo0VdaM3hnBO+lNBp
         yGttdhqhSFaVsBYvpaDa4H5hwB29Nhxvn7eJ/+h//38Qmk8Blv0F5Q2tkNoMwZ8MS9SD
         EJBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786054747; x=1786659547; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LY5mD6y+jHwiQHKRXtdt+aR6mgCxws3lvW47vALHQvE=;
        b=F0s0LzzyQYOJ7uv6fLvdPmgCYxJUlYmXtw9u3Bzo2Pg3oJAN7mBPcJuL7N/vx0CZ/F
         KnMyacbCVuyPul8GrnVILyDP6BTMZm04p+J/m0xg+1KC4iJLs5IAq7KbmgsFo4W/rFoa
         YcJYYXTMJu8sxkNw1+/7gz62sSeWuhLOJ8X8/GG3tQix29dErDoEURI8IqkdhbYiRWgH
         zNivNKZ+r9+exP0UAdhYufZZ1QSf3PebzCONezNdYdHbavkf7ARCQV6r7rVZ81LcCQmy
         UWL9G86KjSzLpg7tb+1dboIa+3wrnbNpERrz5krPA1Mr15ZFp/ztscLq6jyEpkQ3gjb+
         1AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786054747; x=1786659547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LY5mD6y+jHwiQHKRXtdt+aR6mgCxws3lvW47vALHQvE=;
        b=Royqju0C2asoSEK2wyb3Pr1LZkBWZepJcZ4QzET/J4tjCq8fGANjHD1v68TYMKsK5t
         OLvfNWBnCgthtUAYE/6GSodv8c5HyLiWdRtKcKfGF8yEA38Vy0uCjsB2DV6zuVlCImvF
         ES2EfeAlbtwcrN5MNLawZTyK7LU3LSUczPI/TOvIG01/eDwvdFheZ9bPEuXlEN3rj8t4
         aCZ+j4Vl4VX6qpqs2IGim0S6QqoteJLKhBN4p4EvanmcQY6LiIK5U9czkkrfumlTkVH1
         UyB54L0Pb5oLJvPUm7gV00fRSLvHQdML7Vj2BtTMOQ5XkwnyPv8afOiS//ZHhc5jCYhe
         tfsA==
X-Forwarded-Encrypted: i=1; AHgh+RoO4SbEh44dsEWy2YMTNUT34xefzjEHg7/PyLhrl1fPQYtL8vYjbr05+Nrc0Z9+QPa9RL+9qEbQrb6+@lists.linux.dev
X-Gm-Message-State: AOJu0YzLNI2NlJyvtFdV0juTJlz/Tgc2vFLnP77m+Vr2kxEHf4e00nus
	NM0QQNlJZYAwhIk9C7KDqi277N4Vf307faq+jwoX4MHdsStBj5ws3qyW2JOVW3PGJw5ghTjwpyf
	6HxSNc12xy0+15WlLwYve3gG4TjnopOQ=
X-Gm-Gg: AR+sD133wj27MWjy+AruOnF1GvlD/kNIjkM/cMfG9YOdYzMJvSkPmA2GEgf4Ah1fREA
	vkGMya9uF1XMn0nLE7Qyf28uRoajT0HMBHVOIOT0HZT4X1aOuPwyceuIPsqiLQxoXNuQaFYAjVF
	7fKwR/+8xwZBZEINOV+whIPbVuj3OWs9OU6ixna3q18P91Bd1bAK0fOidkBW+eS1vn3q/5qaSqy
	rUG6hhlSdO0K2TRGmnhuyfhuiNFcp7XRxT52YXPJU1QiMdxZ05ImQ6EKUluNUgKjqcUTuBZvmbh
	3qyhajt5NYvqb0mJcKbw7LzO16jF1tqzBHNNoMAWZain1cPuRvIeoJ2MfZ0CwAJ29rxGeOHZx03
	MFlMFejaYL5u9Sgi1SNY+Zm++
X-Received: by 2002:a05:6000:1ac5:b0:47f:fd05:25a2 with SMTP id
 ffacd0b85a97d-47ffd0525ccmr7054857f8f.8.1786054746517; Thu, 06 Aug 2026
 15:19:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-4-joannelkoong@gmail.com> <865afb18-533b-4542-86f8-c77215175c41@bsbernd.com>
In-Reply-To: <865afb18-533b-4542-86f8-c77215175c41@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 6 Aug 2026 15:18:53 -0700
X-Gm-Features: AUfX_mxSCayb12i1MZh19PaSaCt316jvhGETlkFMSpf9sYTvNy_WkRHIK2cbLHY
Message-ID: <CAJnrk1beAMwnaUANB6MyPv6Rqj8gZ5FaQZ80zrBA=JNA1vdyOA@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] fuse: add io-uring buffer pools
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, libaokun@linux.alibaba.com, 
	axboe@kernel.dk, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 11:36=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
> > On 7/16/26 19:59, Joanne Koong wrote:
> >
> > @@ -1397,14 +1578,17 @@ void fuse_uring_queue_fuse_req(struct fuse_ique=
ue *fiq, struct fuse_req *req)
> >       req->ring_queue =3D queue;
> >       ent =3D list_first_entry_or_null(&queue->ent_avail_queue,
> >                                      struct fuse_ring_ent, list);
> > -     if (ent)
> > -             fuse_uring_add_req_to_ring_ent(ent, req);
> > -     else
> > -             list_add_tail(&req->list, &queue->fuse_req_queue);
> > -     spin_unlock(&queue->lock);
> > +     if (ent) {
> > +             if (!fuse_uring_prep_buffer(ent, req)) {
> > +                     fuse_uring_add_req_to_ring_ent(ent, req);
> > +                     spin_unlock(&queue->lock);
> > +                     fuse_uring_dispatch_ent(ent);
> > +                     return;
> > +             }
> > +     }
>
> Pure style, somehow "if (!fuse_uring_prep_buffer(ent, req))" reads like a=
n
> error case, *maybe*
>
>         ent =3D list_first_entry_or_null(&queue->ent_avail_queue,
>                                        struct fuse_ring_ent, list);
>         /* no idle entry, or no free pool buffer for this req */
>         if (!ent || fuse_uring_prep_buffer(ent, req)) {
>                 list_add_tail(&req->list, &queue->fuse_req_queue);
>                 spin_unlock(&queue->lock);
>                 return;
>         }
>
>         fuse_uring_add_req_to_ring_ent(ent, req);
>         spin_unlock(&queue->lock);
>         fuse_uring_dispatch_ent(ent);
>         return;
>
> err_unlock:
> ...
>
> and similar in fuse_uring_ent_assign_req()
>
>         req =3D list_first_entry_or_null(req_queue, struct fuse_req, list=
);
>         if (!req || fuse_uring_next_req_update_buffer(ent, req)) {
>                 fuse_uring_recycle_buffer(ent);
>                 return NULL;
>         }
>
>         fuse_uring_add_req_to_ring_ent(ent, req);
>         return req;
>
>
> Just a pure style suggestion, though.
>

Happy to make this change. Thanks for reviewing the patches. I'll wait
until you have finished reviewing the other patches in this series
before sending this.

> >
> > -     if (ent)
> > -             fuse_uring_dispatch_ent(ent);
> > +     list_add_tail(&req->list, &queue->fuse_req_queue);
> > +     spin_unlock(&queue->lock);
> >
> >       return;
> >
> > +struct fuse_bufpool {
> > +     /* starting uaddr of the bufpool */
> > +     uintptr_t base_uaddr;
> > +
> > +     /* size of each buffer in the pool */
> > +     size_t buf_size;
> > +
> > +     /* total number of buffers in the pool */
> > +     unsigned int nr_bufs;
> > +
> > +     /* bitmap tracking which buffers are free */
> > +     unsigned long free_map[];
> > +};
> > +
> >  /** A fuse ring entry, part of the ring queue */
> >  struct fuse_ring_ent {
> >       /* userspace buffer */
> >       struct fuse_uring_req_header __user *headers;
> > -     void __user *payload;
> > +     struct iovec payload;
>
> Here I have a real concern. What is if fuse server sets up
> really really large buffers, to thrash the CPUs?
>
> setup_fuse_copy_state() is now changed to
>
> -       err =3D import_ubuf(dir, ent->payload, ring->max_payload_sz, iter=
);
> +       err =3D import_ubuf(dir, ent->payload.iov_base, ent->payload.iov_=
len,
> +                         iter);
>
> And the iov is taken as it from the SQE. Is there actually a really good
> reason to have the payload as iov, at least in this series? I could imagi=
ne
> it might make sense to have it as iov once we make the buf pools more
> dynamically usable.
>
> Could we restrict setup_fuse_copy_state() to ring->max_payload_sz?

The payload.iov fields are not taken directly from the bufpool sqe. It
is assigned in fuse_uring_select_buffer() to reflect one buffer within
the pool. ent->payload.iov_len is set to pool->buf_size, which in
fuse_uring_add_bufpool(), we set pool->buf_size to be
ring->max_payload_sz. Looking at import_ubuf() though, even if we did
pass in the entire buffer pool size here, it is harmless, as the bytes
copied are already limited/determined by the request (eg on the
send-side, copies are bound by in-arg sizes and on the reply side,
fuse_copy_out_args() rejects any payload_sz exceeding sum of the out
args before doing any copying). Right now pools hand out buffers of
the same size so iov_len tracking isn't needed, but pools will be
handing out differently-sized buffers.

>
> > +
> > +     /* buffer id in the pool, if bufpools are used. ignored otherwise=
 */
> > +     unsigned int buf_id;
> >
> > diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> > index cfb055c0c764..f7173b5d4321 100644
> > --- a/include/uapi/linux/fuse.h
> > +++ b/include/uapi/linux/fuse.h
> >  /**
> > @@ -1312,6 +1322,14 @@ struct fuse_uring_cmd_req {
> >       /* queue the command is for (queue index) */
> >       uint16_t qid;
> >       uint8_t padding[6];
> > +
> > +     union {
> > +             struct {
> > +                     /* base address of bufpool */
> > +                     uint64_t uaddr;
> > +                     uint32_t len;
> > +             } bufpool;
>
>
> Ok, if we ever want to add a new bufpool, I guess we could
> invent "struct { } bufpool2;". Personally I would have
> preferred to have an index in here, currently always set
> to 0, but not a strict requirement.
>

If we ever want to add a new bufpool, I think it'd be cleaner for the
kernel to assign the bufpool id and pass it back in the cqe to the
FUSE_IO_URING_CMD_ADD_BUFPOOL cmd rather than the server assigning it.
With server-supplied indexes, we would have to also track / prevent
collisions, gaps, out-of-range values, etc.

Thanks,
Joanne
