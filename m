Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BD534D397
	for <fuse-devel@lists.linux.dev>; Wed, 12 Aug 2026 22:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786574329; cv=pass; b=QpCXbzUpNPnz0F5XTbrLmhDqIw4gNNP2heEW55l5X3p6zggkB+jeRLeNQ2BQaND56Of+FClxx6ow3oshE+lY//Ylo5Y1T0BxAekH1EO73zdw2tcAtGEpSU7Vfx241BA4fqoJi0L+n1saB1LYepTLWQ41o9L5tQ7csS1QM2chXLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786574329; c=relaxed/simple;
	bh=vYOKdsR4p6eq2Z3hK6QjiRjUuyZ4US/o8G6ZwUSFKik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MWcXpuC3fPkCbBKMwxi1zDYk/Z9T+/ZXEkTr9kHARX6GFSeRDiuQUf8Xb3MSJl9BSykQKTPUpC8b1S+so5X39dDDrwAK817Lkiu860bDSrobeGwjGitzPwmT5ft23HE+YEPK0TYFB68tBAKWT6phrC6HK/XiHoQdjvTk3fXAWM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+3h82+h; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+3h82+h"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956869750eso469385e9.2
        for <fuse-devel@lists.linux.dev>; Wed, 12 Aug 2026 15:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786574326; cv=none;
        d=google.com; s=arc-20260327;
        b=hZr/OG9CYo5dQHfp9aemYs+BF6ojNmY1tYrmhw/KYgcbqv8d/fX6aJ227u+QlVGzFk
         rz0mZ3xIh/Ksq0VXdPFFQjEJlskm/rNaP325jMbPEVRGGWbj27DByS1wlC6rvUZu3tbw
         pyMgC0KiDyhUJNZnnNlo9l5pVQGzRe/7Fdz7X37dMOdq7lzguUXF4MQBMV2gha4c1WEP
         Agjik12fX4cV3KsHLTeGyR4gB6jJNYThCw1u9iYH158fJUi/O1REaJmv8Wi952j8QtRD
         IzqJdiWbVgyxEcsNoQfYVqbLprySkApGnQ2xAtu6Vt4KdMzQ65Co+MsWdJQP3noQjlMY
         Z3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hs/apTGjcdN82jYMn/E8vHjf2sRxY/w4/mEah8ZBysw=;
        fh=xYT1SNptvN26k20piyFU1IbIuRyq/z3D6T9tXcBkFzc=;
        b=hiWjmeEM/Ava2GCvTrv3ZsnerypW4TKSaoDI7t6lX9N1X4CJq0o+dfMewN3+SFGcPV
         8M4ZnPvT7G3C12PayuSjm+ZU81sNzC1GkFzwko6hNC+lL11SD4t0oo5Pvsme3J3a2Gxz
         NO7L0yCKeLOueksarFHpPiitgTGrZaD7So5dEGoHE7nU57gTO+Ub/1o0LhEKueiX3c0O
         5xpTH2FYZ8rHoKhC5UmraSMYVEi+99N1ijLA96J6SVl0UesOADz121XFvkc5lJ7B4idg
         +B2RaNIG4ASmPC0BB3fTN9YUQNS1igvoTxg4JVsaIqqLqGixPLSPGL+2Gh71TL0bbZ37
         8Bug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786574326; x=1787179126; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hs/apTGjcdN82jYMn/E8vHjf2sRxY/w4/mEah8ZBysw=;
        b=O+3h82+hlEAJx08m+yUxE+ELgp0mFuGNFy578HnPCpyYs5VPZEbrYP2s2vOKU5106/
         Qo4UsrEkG6hjegAIsoh1/jW2c8TD40bmYMDI6D+rlUhqwpko3cItkiEgfral3FlP83e1
         ZrnbaF9zU9pFcl09MKkTxFXkMI0LONBwyLO5eORWfljvdk5ZNrpHWEPdNjcUp+rimZtL
         TDbPJahYBGpHAWg2GrnwUgmtRTI5TmTbrJ/TRmX+WcwBdxzp6iLLXmCDD9t5iMSy6nKe
         RdEzVYB5uamEOhOUwFADqvCbuZTVNlnHBE6dQTkAa0GAVHI0VbYKZDjN243WjM1K+L5d
         E93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786574326; x=1787179126;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hs/apTGjcdN82jYMn/E8vHjf2sRxY/w4/mEah8ZBysw=;
        b=fbomjGtVch6yjRnkOzxqco0IjWn77gM1nuh1gcZBoPyuT8rCw5aegbDFLrhZZgdDxP
         iJ06/ePfPiPFeWtwrPTV9Kb0SO0KD2DrDjRLKKHhqiy2ySdvPXJicrauPMPmJT5xnf1p
         toyM1hlQyGUfTFfJRW8bYsQzRcc9m4mM1dZ0mL/KAGEnd0z7TMI2ZBU1rRPoU8nqKeka
         HUTS6GcSE2NySiifK9cb/RRAsHlfajMeGVues6oWn9ucI6DI+TI2Y4D8sje1nl6HHh/6
         Oy90ElYS6Ma3RlEoXufKUceK8bNOMdCgJTvB4vwwYY8LYiupi9UxJVEjvLl7eaSpDVX/
         N1oA==
X-Forwarded-Encrypted: i=1; AHgh+RpoEY2FYjOjYIZJASWAJ5tmEF9Ya6eTmHZ6eBcT6ImA2vLNCWh78XeRF7Dv6ETLk+0SDJ8MRn7Swj7C@lists.linux.dev
X-Gm-Message-State: AOJu0YwtGCtnk1lovN/5WzmtJ8moTxLQbBWQI/2fIlsOSxlwgRf2+sOn
	7cDG+rIWq5Z3DHrjAzy+KENt2AU1uifc+n1MY9hPyDMvR5WNeW1GBHJ6T5lwzSse4xkvREc1zUF
	yiFmdk1FWI9I5D6PtXwaNQdUjr1b94uQ=
X-Gm-Gg: AR+sD116E/+dHilA9AjjsesBgrWxJFUfFgXSw/ngYVVaaUMkYsllq4lXUgJUlVAhi8l
	hFjrkoMqG8pkAUketBX6mOZ9E3V2SvXNCTFRHVgmuJW2pV8wp3EZhjw2MM/FfKlBX2nhlHbBcsS
	7UQCehKKvXl3FLwpaimI4idioUf7pjecDP4AHQt/yCA4Lvj8KhxfdnCnnHR0n5cQpgghaHJBfJ0
	MfGW9Sgl7vGROUAX21ErtiTLctw3AY180pa17W3RnNdqwAF839uccObzlHS+mxzfP7uKRci7x1K
	gHiUJiIWoSsaEvngULEOw3tjP42eiftDVvgYWhy9iXUxqwsCvBc/FekmTXIKudiVCCP50Utmja3
	2YyV7hDhkSJOhQEppUP9zVLHT
X-Received: by 2002:a05:600c:1c24:b0:496:bbcb:b0bb with SMTP id
 5b1f17b1804b1-49982206f28mr10193625e9.18.1786574325945; Wed, 12 Aug 2026
 15:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-4-joannelkoong@gmail.com> <865afb18-533b-4542-86f8-c77215175c41@bsbernd.com>
 <CAJnrk1beAMwnaUANB6MyPv6Rqj8gZ5FaQZ80zrBA=JNA1vdyOA@mail.gmail.com> <87e52592-854f-4650-8a14-36e64a629d37@bsbernd.com>
In-Reply-To: <87e52592-854f-4650-8a14-36e64a629d37@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 12 Aug 2026 15:38:33 -0700
X-Gm-Features: AUfX_mxjfxxZarD9OR7m9YfQkHgNuSXxS_lbHedgVoWKys-7y65-HbIa5_Pc9E4
Message-ID: <CAJnrk1bsqY=SAovPYBxPM9fSSQT7eU9seEez2fQqSGRVqpUpXA@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] fuse: add io-uring buffer pools
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, libaokun@linux.alibaba.com, 
	axboe@kernel.dk, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 2:28=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
> On 8/7/26 00:18, Joanne Koong wrote:
> > On Thu, Aug 6, 2026 at 11:36=E2=80=AFAM Bernd Schubert <bernd@bsbernd.c=
om> wrote:
> >>
> >>> On 7/16/26 19:59, Joanne Koong wrote:
> >>>
> >>> @@ -1397,14 +1578,17 @@ void fuse_uring_queue_fuse_req(struct fuse_iq=
ueue *fiq, struct fuse_req *req)
> >>>       req->ring_queue =3D queue;
> >>>       ent =3D list_first_entry_or_null(&queue->ent_avail_queue,
> >>>                                      struct fuse_ring_ent, list);
> >>> -     if (ent)
> >>> -             fuse_uring_add_req_to_ring_ent(ent, req);
> >>> -     else
> >>> -             list_add_tail(&req->list, &queue->fuse_req_queue);
> >>> -     spin_unlock(&queue->lock);
> >>> +     if (ent) {
> >>> +             if (!fuse_uring_prep_buffer(ent, req)) {
> >>> +                     fuse_uring_add_req_to_ring_ent(ent, req);
> >>> +                     spin_unlock(&queue->lock);
> >>> +                     fuse_uring_dispatch_ent(ent);
> >>> +                     return;
> >>> +             }
> >>> +     }
> >>
> >> Pure style, somehow "if (!fuse_uring_prep_buffer(ent, req))" reads lik=
e an
> >> error case, *maybe*
> >>
> >>         ent =3D list_first_entry_or_null(&queue->ent_avail_queue,
> >>                                        struct fuse_ring_ent, list);
> >>         /* no idle entry, or no free pool buffer for this req */
> >>         if (!ent || fuse_uring_prep_buffer(ent, req)) {
> >>                 list_add_tail(&req->list, &queue->fuse_req_queue);
> >>                 spin_unlock(&queue->lock);
> >>                 return;
> >>         }
> >>
> >>         fuse_uring_add_req_to_ring_ent(ent, req);
> >>         spin_unlock(&queue->lock);
> >>         fuse_uring_dispatch_ent(ent);
> >>         return;
> >>
> >> err_unlock:
> >> ...
> >>
> >> and similar in fuse_uring_ent_assign_req()
> >>
> >>         req =3D list_first_entry_or_null(req_queue, struct fuse_req, l=
ist);
> >>         if (!req || fuse_uring_next_req_update_buffer(ent, req)) {
> >>                 fuse_uring_recycle_buffer(ent);
> >>                 return NULL;
> >>         }
> >>
> >>         fuse_uring_add_req_to_ring_ent(ent, req);
> >>         return req;
> >>
> >>
> >> Just a pure style suggestion, though.
> >>
> >
> > Happy to make this change. Thanks for reviewing the patches. I'll wait
> > until you have finished reviewing the other patches in this series
> > before sending this.
> >
> >>>
> >>> -     if (ent)
> >>> -             fuse_uring_dispatch_ent(ent);
> >>> +     list_add_tail(&req->list, &queue->fuse_req_queue);
> >>> +     spin_unlock(&queue->lock);
> >>>
> >>>       return;
> >>>
> >>> +struct fuse_bufpool {
> >>> +     /* starting uaddr of the bufpool */
> >>> +     uintptr_t base_uaddr;
> >>> +
> >>> +     /* size of each buffer in the pool */
> >>> +     size_t buf_size;
> >>> +
> >>> +     /* total number of buffers in the pool */
> >>> +     unsigned int nr_bufs;
> >>> +
> >>> +     /* bitmap tracking which buffers are free */
> >>> +     unsigned long free_map[];
> >>> +};
> >>> +
> >>>  /** A fuse ring entry, part of the ring queue */
> >>>  struct fuse_ring_ent {
> >>>       /* userspace buffer */
> >>>       struct fuse_uring_req_header __user *headers;
> >>> -     void __user *payload;
> >>> +     struct iovec payload;
> >>
> >> Here I have a real concern. What is if fuse server sets up
> >> really really large buffers, to thrash the CPUs?
> >>
> >> setup_fuse_copy_state() is now changed to
> >>
> >> -       err =3D import_ubuf(dir, ent->payload, ring->max_payload_sz, i=
ter);
> >> +       err =3D import_ubuf(dir, ent->payload.iov_base, ent->payload.i=
ov_len,
> >> +                         iter);
> >>
> >> And the iov is taken as it from the SQE. Is there actually a really go=
od
> >> reason to have the payload as iov, at least in this series? I could im=
agine
> >> it might make sense to have it as iov once we make the buf pools more
> >> dynamically usable.
> >>
> >> Could we restrict setup_fuse_copy_state() to ring->max_payload_sz?
> >
> > The payload.iov fields are not taken directly from the bufpool sqe. It
> > is assigned in fuse_uring_select_buffer() to reflect one buffer within
> > the pool. ent->payload.iov_len is set to pool->buf_size, which in
> > fuse_uring_add_bufpool(), we set pool->buf_size to be
> > ring->max_payload_sz. Looking at import_ubuf() though, even if we did
> > pass in the entire buffer pool size here, it is harmless, as the bytes
> > copied are already limited/determined by the request (eg on the
> > send-side, copies are bound by in-arg sizes and on the reply side,
> > fuse_copy_out_args() rejects any payload_sz exceeding sum of the out
> > args before doing any copying). Right now pools hand out buffers of
> > the same size so iov_len tracking isn't needed, but pools will be
> > handing out differently-sized buffers.
>
> Yeah, I noticed later that it is actually not an issue, but had already
> disassembled my equipment and didn't manage to reply before now.
>
> >
> >>
> >>> +
> >>> +     /* buffer id in the pool, if bufpools are used. ignored otherwi=
se */
> >>> +     unsigned int buf_id;
> >>>
> >>> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> >>> index cfb055c0c764..f7173b5d4321 100644
> >>> --- a/include/uapi/linux/fuse.h
> >>> +++ b/include/uapi/linux/fuse.h
> >>>  /**
> >>> @@ -1312,6 +1322,14 @@ struct fuse_uring_cmd_req {
> >>>       /* queue the command is for (queue index) */
> >>>       uint16_t qid;
> >>>       uint8_t padding[6];
> >>> +
> >>> +     union {
> >>> +             struct {
> >>> +                     /* base address of bufpool */
> >>> +                     uint64_t uaddr;
> >>> +                     uint32_t len;
> >>> +             } bufpool;
> >>
> >>
> >> Ok, if we ever want to add a new bufpool, I guess we could
> >> invent "struct { } bufpool2;". Personally I would have
> >> preferred to have an index in here, currently always set
> >> to 0, but not a strict requirement.
> >>
> >
> > If we ever want to add a new bufpool, I think it'd be cleaner for the
> > kernel to assign the bufpool id and pass it back in the cqe to the
> > FUSE_IO_URING_CMD_ADD_BUFPOOL cmd rather than the server assigning it.
> > With server-supplied indexes, we would have to also track / prevent
> > collisions, gaps, out-of-range values, etc.
>
> Dunno what your plans with that are, but I would take that number as
> opaque user-space identifier and not something to be used by fuse
> kernel. In my mind without coding, I would put the bufpools into a list
> without an index that fuse kernel would use. IMHO it only needs to check
> if any pool in the list has free bufs.
> Anyway, while I would prefer to have the userspace identifier in the
> struct, that is not a blocker and we can add it in bufpool2 when we have
> actual usage. Or userspace needs to use the identfier from io-uring and
> we use that, as you suggest.

I don't really have a preference here. I can add a zero-enforced
"uint32_t reserved" field in to keep this choice open-ended for now,
that could be repurposed to hold an id in the future, if that becomes
necessary. Even without this though, I don't think we would need a
separate bufpool2 - I think we could just use "flags" to indicate
multi-bufpool, and have an "id" field added to the struct.

Thanks,
Joanne
