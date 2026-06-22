Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E247D1C5F13
	for <fuse-devel@lists.linux.dev>; Mon, 22 Jun 2026 23:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782171181; cv=pass; b=H+XHF5BIOxo+C8iPSo7lmhQAMvKnoYYtiIsJizEb5TqWhaaqMcfrpAwOifOCtNA5xtif6nIruOwSZnXZLsZHURGTRBC8zL7oO0il1/ONXb0QH0PJq/ZBem3wK0YSR1DnIu+w0cApgA1PxSMlp5AyMjqz7leK/3YwcZ5flEHG7Sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782171181; c=relaxed/simple;
	bh=0HE/V57fZXdDNGzI9/73/AsY0VDcLncYlZriHYo9VFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egT454hDhDEHqTtYsBvBU41R838JxrjnsHQoHYRSasuCPCx1lsYciloJxanqAO9JSavPt+cAjXhM5TAtXxYeOx9uEPPLe7snRpOPpIxhDPqp8QTjhRaEZqWF+wplOna/g2UeboCqzPgNvMH/Jofv6KU9c5hl3DOZijuRXjgO44Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iw9t2BoG; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iw9t2BoG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490a76757e5so31369715e9.2
        for <fuse-devel@lists.linux.dev>; Mon, 22 Jun 2026 16:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782171178; cv=none;
        d=google.com; s=arc-20240605;
        b=FDqcKYQhWTgz7yCyoz4elIKzfTJ2AE5c2ztyytyVHLpEe2mFVe7F8Vrg6iC0awErc+
         3VZ9AiNeemmyUmR9QD62oA5IXFIhvGhw2npdzOSoBfm9cn0POTPFS0x9BR8CqdkjxnGx
         ttmVtqif+o/KqmurIx9eLRxIUw5pn06WPMn38VUt4owtoD/nUC4qnmSvHBGogOcwxtxi
         3v0OazcyvUHQLEyrD2V+TnbcSVosamwLDv/juyu7vI4a7s71b7sTrxXRy3V5WdFVwEmj
         GK9BHicQAgWXXSI5TGiC0W8x18zNYmaBrWyygr5Mph9U71BxpNCwPIvBIJ9nbTzghm9J
         HyAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h9aloi7LbE5ijzDmalxzEpp8+DjK+5KcFtYBHciW3Mo=;
        fh=rae85d/lZWwZM+FzKroOTvkTS76TTEZPb3ETVL/DRJ8=;
        b=exie53gkeN4kxz/jO+q56dWhZ7LLeUb0ki4cbR0BPGDKv5V6xY/Q48EyohW9aQK9SU
         j6Opc0OHccdVLsSKTA26U1uNnfXhVbyPXRA0E601y/OPGTfgFtaDJnYgTtbLWJjOLyBC
         thRUtFBBv4nUlbG1NF72MUWqspciNu0mi1br0KMDkbpSlWj/fgjw0MBYluUkv1QqCKKC
         di4HxAos3LaBM9JNpx+bLCNDpXD9WxYOYJ7Bs+CptFBPSJY28codMA8A+fAe81Gv+mYZ
         Yrb48lfq9gnBC8tmgkxvLc423MJNUp2oHe2OkmEQDKeSlAsSt9rp89rr/NOYRaTSwZAf
         +ggA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782171178; x=1782775978; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9aloi7LbE5ijzDmalxzEpp8+DjK+5KcFtYBHciW3Mo=;
        b=iw9t2BoGE+980bIgqhzNtYJYTaViJhItRtLMZgqUebJ8FXma6tKD5os+0/3ptRFcEq
         B/z+X2wBZEml1YZnr9jaxhLeQ9POoifrnkE/CGCjI+sxFnakpPtgabARVQ5tGLnslcA6
         I4ra2ADyGZWLBS5eMvI//O04jnkKDXTsqQJuJdw/e/3EPvGI9uJ5nw5X5MK6WZH/0s3N
         VxRqD0Az/7Kbj0ncMlMisw6TS+RFnO7fSTddU15G5MARy1WjrZs2bicYvF/U6R52TiED
         JHM+hUGA8yJ3dhNMxeowU3onkWvGXzXYW7KGyRbz+2UDG38sPOszpbatySvP1917mrgi
         Uu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782171178; x=1782775978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h9aloi7LbE5ijzDmalxzEpp8+DjK+5KcFtYBHciW3Mo=;
        b=djooVPv9jFeypeCQLPC45qZbtsTBi1tg/W0nrv7T5KbQFXj5efAqLZtUPGswkP2Trs
         L0Wa2r4MpzT4htJzNRR4EOhOrU0kpfmFeu8VqWiH65g2hwsnYgMNVKgKQlGB3GLOs1/s
         9+x3DVODFQb5X1qqbT3LzYyvYqhqfcHB7UZ4zz53pq1s4hb9hb+kRMSxdNk3FTKGmrZz
         164vRybmclHhm+iPR60/tgdzRPVYuBLWynoW+wnOI9oXzHtrKcGkF+Z7xKdn+oR0Y8N6
         UKTrmBTDI0kZj+7eUiPMYea2uyBpS1N0hgIFyJ/nlga5FbWvPfj8g20GIzeKnLMP3wPp
         /cGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/u6NhfyGVlFIsxqLwjRt4uPto7vJjFO4ArpAupcAwjqxVZcV9+xuhio+jrqoeui5dizNOr6MSPgPGF@lists.linux.dev
X-Gm-Message-State: AOJu0YwBB+AiYbhQRX/yXAX9H7H+jfH78ZL7mC7M3Bn6GWhYIuGoc+vk
	7oPG3n89rDZnogR4bnevyD0nJL8G/8mSIDCZg5yknPzPewnc2KyKJ48fvFb41M54Nz/Msh8MaKf
	jgd/CtcQKjHPQJAhf4RPx4e5MQk+D+mM=
X-Gm-Gg: AfdE7cm1G5IMzJkVbxBo73W7venoX+Ep2DecwQvkKJTDbK+Q5Rk5ucYlNeg28sg6a6x
	XneRNqpFaPNUuBRVE8xwc2uqfQ7k/CHmJ/g1J8+nqa0pLgDXpu1ZkbvEHcM7F8uzJ/Rmpd8oOZ8
	413FhxipvtEaYUPFI0h9rLJJUtsk13Be0Pz/EkFQX2ijnNGZWK1JsRbwX686+k0xbt1Twq7+66M
	YDvdgsnZmbsSVKE45CXD/abuKebdmaEd6oPEuw/2GU2m0qTPrGHxty4WUt2XTgSSuJssx1QvIY3
	0z1iTBN8+nImiwmpqfgRuwNzsITGMrNcIbfpBdKj8912IF+JzGLT
X-Received: by 2002:a05:600c:4e86:b0:492:2f3c:d0ed with SMTP id
 5b1f17b1804b1-4925b3b6a6dmr3479765e9.30.1782171178002; Mon, 22 Jun 2026
 16:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
 <20260529-reduced-nr-ring-queues_3-v5-4-1dc08c2fccf6@bsbernd.com> <CAJnrk1aGcWGJrkAVVEGfjP6mBVraJuQN0_S9oprV6Yo29srBWA@mail.gmail.com>
In-Reply-To: <CAJnrk1aGcWGJrkAVVEGfjP6mBVraJuQN0_S9oprV6Yo29srBWA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 22 Jun 2026 16:32:46 -0700
X-Gm-Features: AVVi8CdSr3QOw4L94Ns34A6TvAA2vxQxFXxPw9TlHbogPqN-UFVPavYg27lRHvk
Message-ID: <CAJnrk1Z7ECu5vLqnO7ubdkBLZqLB42njaBinqg2LMWpqx=s4Ew@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] fuse: {io-uring} Allow reduced number of ring queues
To: bernd@bsbernd.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, Luis Henriques <luis@igalia.com>, Gang He <dchg2000@gmail.com>, 
	fuse-devel@lists.linux.dev, Bernd Schubert <bschubert@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

zOn Fri, Jun 12, 2026 at 7:24=E2=80=AFPM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> On Thu, May 28, 2026 at 3:55=E2=80=AFPM Bernd Schubert via B4 Relay
> <devnull+bernd.bsbernd.com@kernel.org> wrote:
> >
> > From: Bernd Schubert <bschubert@ddn.com>
> >
> > Queues selection (fuse_uring_get_queue) can handle reduced number
> > queues - using io-uring is possible now even with a single
> > queue and entry.
> >
> > The FUSE_URING_REDUCED_Q flag is introduced tell fuse server that
> > reduced queues are possible, i.e. if the flag is set, fuse server
> > is free to reduce number queues.
> >
> > Notheworth is also that a fuse-io-uring is now marked as ready
> > after the fist queue was created.
> >
> > Signed-off-by: Bernd Schubert <bschubert@ddn.com>
> > ---
> >  fs/fuse/dev_uring.c       | 171 +++++++++++++++++++++++++++-----------=
--------
> >  fs/fuse/dev_uring_i.h     |   3 +
> >  fs/fuse/inode.c           |   2 +-
> >  include/uapi/linux/fuse.h |  10 ++-
> >  4 files changed, 112 insertions(+), 74 deletions(-)
> >
> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index 497093384c31e729053d2f5046c9ec59461ac035..d02266b483c89d105bd6301=
133820697f7caba9c 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -373,6 +397,30 @@ static struct fuse_ring_queue *fuse_uring_create_q=
ueue(struct fuse_ring *ring,
> >          * write_once and lock as the caller mostly doesn't take the lo=
ck at all
> >          */
> >         WRITE_ONCE(ring->queues[qid], queue);
> > +
> > +       /* Static mapping from cpu to per numa queues */
> > +       node =3D cpu_to_node(qid);
> > +       fuse_uring_cpu_qid_mapping(ring, qid, &ring->numa_q_map[node], =
node);
>
> Hi Bernd,
>
> I don't think we can assume node is within the bounds of numa_q_map.
> numa_q_map gets allocated with num_online_nodes() # of entries but I
> think the node returned in cpu_to_node() can exceed that if some nodes
> were offline when we computed num_online_nodes() (eg num_online_nodes
> =3D 2, thhe 2 online nodes are 0 and 3, while 1 and 2 are offline).
>
> > +
> > +       /* global mapping */
> > +       fuse_uring_cpu_qid_mapping(ring, qid, &ring->q_map, -1);
> > +
> > +       /*
> > +        * Pairs with smp_load_acquire() in fuse_uring_select_queue().
> > +        * Released before the per-numa bump below so that observing
> > +        * numa_q_map[node].nr_queues > 0 implies q_map.nr_queues > 0.
> > +        */
> > +       smp_store_release(&ring->q_map.nr_queues,
> > +                         ring->q_map.nr_queues + 1);
> > +
> > +       /*
> > +        * smp_store_release, as the variable is read without fc->lock =
and
> > +        * we need to avoid compiler re-ordering of updating the nr_que=
ues
> > +        * and setting ring->numa_queues[node].cpu_to_qid above
> > +        */
> > +       smp_store_release(&ring->numa_q_map[node].nr_queues,
> > +                         ring->numa_q_map[node].nr_queues + 1);
> > +
> >         spin_unlock(&fch->lock);
> >
> >         return queue;
> >
> > @@ -1186,7 +1180,19 @@ static int fuse_uring_register(struct io_uring_c=
md *cmd,
> >         if (IS_ERR(ent))
> >                 return PTR_ERR(ent);
> >
> > -       fuse_uring_do_register(ent, cmd, issue_flags);
> > +       fuse_uring_prepare_cancel(cmd, issue_flags, ent);
> > +       if (!READ_ONCE(ring->ready)) {
> > +               WRITE_ONCE(fiq->ops, &fuse_io_uring_ops);
> > +               WRITE_ONCE(ring->ready, true);
> > +               wake_up_all(&fch->blocked_waitq);
> > +       }
>
> I thought we had agreed at LSF that userspace would declare the number
> of queues upfront and dispatch would be gated until all of them have
> finished setup/registration rather than going ready when the first
> entry in a queue gets registered? Did the plan change or am I
> misremembering?
>
> I still have the same thoughts as previously [1] about it. I really
> don't think we should allow requests to go through io-uring while
> io-uring setup is still happening. If we want to add dynamic queue
> addition in the future, we could always do that later through a new

Hi Bernd,

What do you think about dropping FUSE_URING_REDUCED_Q and reframing
this series around dynamic queue addition instead? I don't mean to add
more work to your plate, but my main reason is the uapi. REDUCED_Q is
a narrow flag that's a subset of dynamic addition. Exposing general
queue addition would line up with the decoupled queue-creation uapi
the bufpool work will use, and it'd be more cohesive with the future
feature to dynamically remove queues.

I think this series already has the bulk of the logic for dynamic
addition anyways. The main missing piece looks like adding
infrastructure to publish the mapping as an immutable RCU snapshot
rather than mutating it in place, so a reader never sees a
partially-built mapping.

What are your thoughts?

Thanks,
Joanne
