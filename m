Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57432459DC
	for <fuse-devel@lists.linux.dev>; Sat, 13 Jun 2026 02:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781317488; cv=pass; b=qf55d4lZazxX8r4Jrtvo6a0Fjn4TqtSnGh772Ls2Yp3D05BgfnwTvuV17j/r9JtfdjjSuiCQCbIF+gc05lqJsaviVjwj39auNW+ERRD8ymAnRZB9oXxwu5jtVwfjZQ7xod9gs7pElj83VdfA5FTVaXQQCV+4LcHiLoDz/KuFpxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781317488; c=relaxed/simple;
	bh=khmu5INGpQudx64hMjgVFJmwJbHp0jdO3ZAwsBi4Ccw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Av76FqD4Z0g1N7RiJxD7qy80EEDZRY0e2pjYL1/Oa0zAtuMKZ6koH1LR8U8xj3mqp2AyOOyXMOhJroOmKKWxRhuf55BxQim9+DYp/Z+MZBR37RFMd6A5UWsgJT7o4QChp9AZZ47NIDYBf6A4T48fLeZ1yzfG4RE72aBOKTHo538=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ForCDFou; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ForCDFou"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b9318997so11572895e9.2
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 19:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781317485; cv=none;
        d=google.com; s=arc-20240605;
        b=FQzDySvmbsFyt66RLcgol3NIZpAKU4Eag5gVwczDMMCTgAIkysnidqAVOQA6Cz0UiS
         fxWXWfXPyvaCQDQWDxhw2aPokGFhX1MfAJHiYT5K3wad7t2dEBF1c2BbPAvAAdWcTiwb
         1onkKtuSjE5kLGEb0F18/A7p5BZj4cJ57ZgAxH1pO08Fn6CcrNVzsfTHLnV3/f2/uX84
         5vZHoIDzshqvwpUlV+TJVYBS1F5t2Bh8X84VXcIni9cK1gEv2PeqGAbFPhivjlwDNXhm
         t8zvOxjdYLfDmYq+k+SaPB0TnB6WMq3daNoo60k1Wzzxva3E9HM9vrsPnlIzlCLNypNP
         MrhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CHiskf5RUsTnob8MsVvGjnmGF/XQd6apMkMB/vu+WyA=;
        fh=oXG5ARwLqnS4ghlOmGX3TeNRNflMS3+IDRR90/bURm8=;
        b=XPPY6Ap6sSTCD7qYFFCDWIm1Lhq+7JkeCKl7aojB/Etx6FWO84uHbP6DIrbAtwjscF
         P9tRXBE/VMtQhNK9ZEb6Als3vFqFwIbbn+p/NNliy21BoFnmLk6whlAUbWD4wgMr9e3b
         QcITyg/FH/+yXKQwyiqE23+qkyay1NP3glSp0Oenmcams3iaRWeF0VoZxZhaUZqyuvWD
         IDJswMr5WXltyJ+c2yGLzCDHQsS0OkQyDgGT9OFgbO/qyJOQs/lAbnOhs7vuvpHMeitC
         wr/dJmjGyRih02zrWpWhNExXP4+DO0Dx2eXgGW5RK8H/JffZ6ynSQmvEu8x9BrhR6xY9
         JDoA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781317485; x=1781922285; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHiskf5RUsTnob8MsVvGjnmGF/XQd6apMkMB/vu+WyA=;
        b=ForCDFou2BoljMDdz/4Up3/bXBY9Hsa95N/51h8zzMI/t7rE3+gxw3cJoEYq/CsXqS
         mLFS6d2snJhuERUX0tXSyvdLKvK+i+Zp9nJSXTsjzjlcB4Yl8uANVpaG3PgpwzTqxw6J
         BibmvAvl08PT67Cw67HA3g6/6DcL1mESby1qkSBnsoWRdv849D855DCGn78shHEBW1gl
         CtTKOeJffzjgEf2o8nYaehITdL6CPSBeX8LATOo6bN7z7IKqzxc0C1pLYgkCYabxw2//
         np+MxtxVn6sGIsEPToYAaem9oXjJ3ASoKqRKVQt6BURzoA2FGYV83KwwsS82bmSgdAXt
         Dipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781317485; x=1781922285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CHiskf5RUsTnob8MsVvGjnmGF/XQd6apMkMB/vu+WyA=;
        b=UdZu/EdxlArYvMB47xbc8Wpee+ccFsaQkTBov88pRA6zq6V1+ldJMZOWCW1foSW4BB
         hnf0CkGYvK7nuKNxAAR5gCM4f/5bSb5aIyuPRZyu+PRaXA6kvzvWZkBWPl4JI22bj9RK
         xrwasfdo26/j/ko/LrcO1hJreRJZHK9hJ/xOGi2kjRVXqQzyEBL0Wka4lekVigYOs+PF
         mqY4Ez6fhDb/GlVdkw9AE9ZOupXWtVKJTVycLYPjyVwjpxiRLsf7nSK0m/z2pXeyH7l9
         TTja93xO6YYf883zGmsSYCb0isazka4PvMGl0E8DyaVoR6QBIEJfG7WsWo1Q6J0LVpxq
         BPEg==
X-Forwarded-Encrypted: i=1; AFNElJ9bLdU3xMuJYpnJlvhcxgp8U8cnUYM4RufyeFviMbqbRPwpwa6n17bUD0ikydWkXyItmntHobCnjft6@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxaj1hfGeW57ThjYEdVwlziPlmKnluP+37LW+PjDJamIB+qE0e
	/tegWlGEn3ERsNftW4jjWQzbN1hVp/a/IP+nTQb5tFk2VL+aORIfZrZBcip+B2UB1e+0tMsJUlf
	V25o+N1jePfmEyjqXD2rD8hsvDHUo4fU=
X-Gm-Gg: Acq92OESB9Jtddrxbdet4fo7zCKyqFppXE0+U8OxV/+0NNPOJ13mwtGLRGR2pGNFIP0
	CPJ30BDtGe6fTFyyDDKV+/RZqa8EcPCF9/Xshw3xqRgKz5fuzoZ2Yno/8erUkg5DH9eE8MtxFJE
	6fpjnGj9aE6Z1svA5Hle0fbRyeQBHQ4XoymHGzdToIK+9dWaKBsg3IsUTcKU1Suv1/0c5U6LAxJ
	OJkQC5PFRwe/++gacRgkDi6K49zg8KUdYc7s9Wm8gKV7sySKN57xPkSzq2RzN0G5X8OpQDJ1tm6
	7smsdpR6JQDYt9OT7w6WB/pE5e52TQXXmIKGK58gaXcdrgw7JJaobQkbroTtEfk=
X-Received: by 2002:a05:6000:2384:b0:43f:e990:2f5d with SMTP id
 ffacd0b85a97d-46077f2db06mr1972369f8f.35.1781317485138; Fri, 12 Jun 2026
 19:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com> <20260529-reduced-nr-ring-queues_3-v5-4-1dc08c2fccf6@bsbernd.com>
In-Reply-To: <20260529-reduced-nr-ring-queues_3-v5-4-1dc08c2fccf6@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 12 Jun 2026 19:24:33 -0700
X-Gm-Features: AVVi8Cd5rJOezMuz4LVPqkc7EEbJtTrQic3SpfqzStlsgMENbpWn1PNUHwDpX_U
Message-ID: <CAJnrk1aGcWGJrkAVVEGfjP6mBVraJuQN0_S9oprV6Yo29srBWA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] fuse: {io-uring} Allow reduced number of ring queues
To: bernd@bsbernd.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, Luis Henriques <luis@igalia.com>, Gang He <dchg2000@gmail.com>, 
	fuse-devel@lists.linux.dev, Bernd Schubert <bschubert@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 3:55=E2=80=AFPM Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> From: Bernd Schubert <bschubert@ddn.com>
>
> Queues selection (fuse_uring_get_queue) can handle reduced number
> queues - using io-uring is possible now even with a single
> queue and entry.
>
> The FUSE_URING_REDUCED_Q flag is introduced tell fuse server that
> reduced queues are possible, i.e. if the flag is set, fuse server
> is free to reduce number queues.
>
> Notheworth is also that a fuse-io-uring is now marked as ready
> after the fist queue was created.
>
> Signed-off-by: Bernd Schubert <bschubert@ddn.com>
> ---
>  fs/fuse/dev_uring.c       | 171 +++++++++++++++++++++++++++-------------=
------
>  fs/fuse/dev_uring_i.h     |   3 +
>  fs/fuse/inode.c           |   2 +-
>  include/uapi/linux/fuse.h |  10 ++-
>  4 files changed, 112 insertions(+), 74 deletions(-)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index 497093384c31e729053d2f5046c9ec59461ac035..d02266b483c89d105bd630113=
3820697f7caba9c 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -373,6 +397,30 @@ static struct fuse_ring_queue *fuse_uring_create_que=
ue(struct fuse_ring *ring,
>          * write_once and lock as the caller mostly doesn't take the lock=
 at all
>          */
>         WRITE_ONCE(ring->queues[qid], queue);
> +
> +       /* Static mapping from cpu to per numa queues */
> +       node =3D cpu_to_node(qid);
> +       fuse_uring_cpu_qid_mapping(ring, qid, &ring->numa_q_map[node], no=
de);

Hi Bernd,

I don't think we can assume node is within the bounds of numa_q_map.
numa_q_map gets allocated with num_online_nodes() # of entries but I
think the node returned in cpu_to_node() can exceed that if some nodes
were offline when we computed num_online_nodes() (eg num_online_nodes
=3D 2, thhe 2 online nodes are 0 and 3, while 1 and 2 are offline).

> +
> +       /* global mapping */
> +       fuse_uring_cpu_qid_mapping(ring, qid, &ring->q_map, -1);
> +
> +       /*
> +        * Pairs with smp_load_acquire() in fuse_uring_select_queue().
> +        * Released before the per-numa bump below so that observing
> +        * numa_q_map[node].nr_queues > 0 implies q_map.nr_queues > 0.
> +        */
> +       smp_store_release(&ring->q_map.nr_queues,
> +                         ring->q_map.nr_queues + 1);
> +
> +       /*
> +        * smp_store_release, as the variable is read without fc->lock an=
d
> +        * we need to avoid compiler re-ordering of updating the nr_queue=
s
> +        * and setting ring->numa_queues[node].cpu_to_qid above
> +        */
> +       smp_store_release(&ring->numa_q_map[node].nr_queues,
> +                         ring->numa_q_map[node].nr_queues + 1);
> +
>         spin_unlock(&fch->lock);
>
>         return queue;
>
> @@ -1186,7 +1180,19 @@ static int fuse_uring_register(struct io_uring_cmd=
 *cmd,
>         if (IS_ERR(ent))
>                 return PTR_ERR(ent);
>
> -       fuse_uring_do_register(ent, cmd, issue_flags);
> +       fuse_uring_prepare_cancel(cmd, issue_flags, ent);
> +       if (!READ_ONCE(ring->ready)) {
> +               WRITE_ONCE(fiq->ops, &fuse_io_uring_ops);
> +               WRITE_ONCE(ring->ready, true);
> +               wake_up_all(&fch->blocked_waitq);
> +       }

I thought we had agreed at LSF that userspace would declare the number
of queues upfront and dispatch would be gated until all of them have
finished setup/registration rather than going ready when the first
entry in a queue gets registered? Did the plan change or am I
misremembering?

I still have the same thoughts as previously [1] about it. I really
don't think we should allow requests to go through io-uring while
io-uring setup is still happening. If we want to add dynamic queue
addition in the future, we could always do that later through a new
uring cmd. We've already seen tricky races happening between
registration vs. io-uring cancel vs. abort / teardown, and I think
adding in-flight requests now on top of that introduces more races and
headaches.

For example, looking at some of the logic in this series, request
dispatch locklessly reads the numa_q_map while another thread
concurrently registering the queue can be updating it in place. The
fch->lock serializes concurrent registration but not against
concurrent in-flight dispatch, and the mappping can be read
mid-update. Whereas with allowing requests to go through io-uring only
once io-uring setup is complete, we're guaranteed that the mapping has
been built (and also guaranteed that the mapping only needs to be
built once instead of being recomputed every time a new queue is
registered) and is never mutated afterwards, and imo is just a lot
less of a headache.

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/CAJnrk1by9O1JBH5W9jvkgYcBZK_t7nxz=
eSsmxm65jb4=3Dwv-ikQ@mail.gmail.com/
