Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179313BF67A
	for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 17:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787162185; cv=pass; b=dab0KBwPwtKt+pofZyaDfevmUM8fl5FVWq3JNN21nw476/AMqpmz7IT508ScT44ZsQUVFF4G1ls5YF856sfbhKREnvKHlxHY/KljkBBu8DqNk1/dneoKIOHTZCEsn0KaHU370HgBkYxllohNsk9Fy9SOYIVs3pFy4ft0zotmpe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787162185; c=relaxed/simple;
	bh=Ge0fTCperD0VmQW37wpD3EYUkS5p6P0y5lidLMyRx+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBV8gNv6qZ04CAIF2WZem6fhT5HPDYdhMvY3pjppuwGP7daPUj4CmDTQUo9NVxJ+d8625oBfqSNDG5YX7Nt+5g2uPKy9P4fMAw7k60UqlC+uCVbCSTMRbhBnNjmZG7z40JEzvl/hDjlEBLHlFB+jnEfPlo4Z7r8lO1rOt5d1KLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1wtdm5Z; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1wtdm5Z"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495437bb891so1119675e9.1
        for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 10:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787162181; cv=none;
        d=google.com; s=arc-20260327;
        b=MeR42aZQ/oEu6DMjuVYsWrXqaResDlDjAc4IZYo4W6z6P4Gt0G0xwPcv6FlCmim+it
         jTQPmDT5YNH8KCx98fXxOtXsPV7Y2GmHvdTb0uRQgqq7XrsRWrmdNdongL4ond3xwOE8
         MCcDddazDqqKK/Yvxb3POWBXJrxISWdm/aBGkfhJfKpiQwwIyLzsETs31HbJyeOtlQXy
         H+pEAhDfXMztSGrmqChts0uIE7qcyAazzVcB2cX+jzX6I6K2F2vXfO/PCxDBb15Wq40L
         uapriyvOiQsAPVRO8vj8pn1LYUSdwT6lRaQLb3+uZhEO9v33OZb/2k0w1XQ09hV9TVDH
         eLtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lL3RD45r9AvsvR1KMjnS+PGFCfZfRV3Sl9G+rpxFW1w=;
        fh=WT2oWA+2t9Y1VTSJASH0NI97uiNi59Lf1R4+6ApKzzg=;
        b=I9VrxNuGHw39tj4mLUUthoRDPwvXz3iyylYVFDVFz/VJjx4xc/yMQmjqca9ge+wVGb
         xNQ+VP91skcDHqQeGdF4oLvxM1ZLc6SAuGWdT74Hrkvi3czvKdjZGwupa1IGspN4Tspq
         If1P/MpGA5sIxuudiiI/kGLVjuQZ3Y1UlsupSltWhhuco+4upwoyDY6u69Jy7wupnSQl
         HBiJmWg3CWYA9qy+xoo98FBODvBWVSHec23hKLaE4p8r/0RRW1SY9GSxtzmlKz8KV4Ko
         xjOjdsXHgK9EG+fGV9NG7Uuom+K91UtDfU6jgud274JUc958kBqpjLMSdso+BJe3DO1c
         2Xkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787162181; x=1787766981; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lL3RD45r9AvsvR1KMjnS+PGFCfZfRV3Sl9G+rpxFW1w=;
        b=T1wtdm5Z8rcgIlSeJ/htY+HI65aMni2q4hXmGvncuODtmnGeGP1XR1py0oWI+nNPUy
         eCoZfWCuvMMc29M7R3NhW8rAmaXngFGDnv+X4tbeRKetqrxcMfkZfQ9CQ9HwYquQy5y2
         xkyVId0LOXMhgekoXFb1KPVIYqxYEk6JtwqV2OpNQ64s/D0E30xodZgYvhJzXOvGh+P3
         /5Lh/MX5L83ki/QCVtTf23a/pBgVgoGONeyxXTgyVqU/WILgKfOjSEGC7AAex6tvcNcD
         XBid2SMk80mCEBWaLFG7aPYXRTvinHlNNm+6h6FPofXjOmfoLUZ9R7n5W1Tgy77SAHhD
         ddAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787162181; x=1787766981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lL3RD45r9AvsvR1KMjnS+PGFCfZfRV3Sl9G+rpxFW1w=;
        b=EblUx/h03BSqs34syKhrftQ9wZAi5VSPpsAVxcvIDqL2MIN7lnwhXRL4zVnhjEjeGd
         47+QZ3oupFivAxqc2rEfi1PWDjdHwUChn6Yhqy5OCzkz5C8m12FdD7cK7NjaEU1WhSSg
         CiBVe3N7G6Rviv1tPtcuQ2j5Uqfp0qFsJXr8Ffsy4l877TEhqQsuVF8Tq1hCJsPEUIUd
         MEbtwde4CD48vmgxuZol4zj7blRDwfAsMEl3Cm3huTlXau803scBfGDJqMBkLZxvEG4n
         ZtzKobu8KCutrcn1vtl6FVS2M9Akcvg6ZtZFh7BAIgbiYygXAl2MrN+qa80K9cAPIZcp
         R9gw==
X-Forwarded-Encrypted: i=1; AHgh+RoyQWBe2s+93r78btQ8vN8cKLqOQDJXtA3eziDf/cp6RWnI5lSSCiT3D1ODuOE8Tzets2z7cuqpluD5@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh+KE3Gwo39FYRDZ9diJzv90yt7AkSX/w/m9Y0UJiHlmcZn8+2
	IEP1qGsIYYyepY/bs86TsGGi0LDj+AW9e0vcHCR5WW4vRw/CPfzmBU6cuV8bXbzdc2lJ0XgUW/n
	ZvNj061aJmustKP28eHuRYW+7yGU9YlU=
X-Gm-Gg: AR+sD13xhrUCGgjO4nnh6xSh8nh0NjF66ObRjcipj8Z5HxURulX0CgmsoAfyBNbBuxg
	rBrQBenqCJXn85RtPLIHwR4TMtmrZJxRN9pVXTj3TILitDcw4sj1mGAxLlAddMACDTA0t8z6g3b
	n1QNRm7aMp8Z0nTFF+oR2s/Eez5lvzTXRVVKiy1F1tUuKfnlGdZnkh3dDUXbTcCWl5p9P8Txuqb
	Mi5+ZolLTnN9aFkNR2XdJWH06E4yJ4IbQxt1jRr5W9Q2ywgATGne2vtSij2ZHuRAcSRBm1uBu1B
	2BWM9/Ul0WVSIDi+LntZKdVzGrvwR8yqwu3Si6GbFMjQ8ajKyKOpv522hTrjd7edrvi/5nuDIJz
	ktgYL0k9ZqhvLNaQs5Aa7kWDa
X-Received: by 2002:a05:600c:c114:b0:499:71d6:359a with SMTP id
 5b1f17b1804b1-499b070c272mr15469805e9.8.1787162181274; Wed, 19 Aug 2026
 10:56:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
 <20260814185946.3679478-2-joannelkoong@gmail.com> <CAJfpegt2NTn27A_QoMnfb8gDLZpRc9WHzWW6wGBjWc+nvJxg=A@mail.gmail.com>
In-Reply-To: <CAJfpegt2NTn27A_QoMnfb8gDLZpRc9WHzWW6wGBjWc+nvJxg=A@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 19 Aug 2026 10:56:09 -0700
X-Gm-Features: AcwNN1UWexYVNdBzgqK24KpSy8KxnvhKNikrPYPswF8zWn4VmuBn9Am0yZs9Ap8
Message-ID: <CAJnrk1bocn3zSUe23E4F6oTNyosmF8kdVdFB-2hX2qbSqx-LDA@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] fuse: decouple fuse_ring creation from ent registration
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk, 
	bernd@bsbernd.com, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 4:35=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Fri, 14 Aug 2026 at 21:00, Joanne Koong <joannelkoong@gmail.com> wrote=
:
> >
> > Currently, the connection's fuse_ring is created lazily on the first
> > FUSE_IO_URING_CMD_REGISTER command. A server registers entries from one
> > thread per queue (one per CPU) and those threads issue their first
> > REGISTER command concurrently. They then race to create the single
> > per-connection fuse_ring, which required open-coded handling in
> > fuse_uring_create() to detect and protect against concurrent creations.
> >
> > Decouple fuse_ring creation from ent registration and move it to
> > FUSE_INIT reply processing after a server has negotiated and set
> > FUSE_OVER_IO_URING. The ring is published before the connection is
> > marked initialized. fuse_uring_register() no longer creates the ring an=
d
> > it instead uses the ring set up at init time.
>
> I tested this with loraw (a "raw" loopback tester that doesn't use
> libfuse) and it fails with
>
> root@kvm:~# ./loraw -u  /mnt/fuse
> loraw: loraw.c:1010: lo_start_uring: Assertion `!cqe->res' failed.
>
> cqe->res is -22 (EINVAL).
>
> Attaching the reproducer.  To compile:
>
> cp $(KERNEL_TREE)/include/uapi/linux/fuse.h fuse_kernel.h
> gcc loraw.c -oloraw -luring
>

Thanks for attaching the repro.

This is happening because this patch uses the FUSE_OVER_IO_URING init
reply as a signal that the ring should be created, but I missed that
the FUSE_OVER_IO_URING reply is *optional*.

Prior to this patch, there's two scenarios:
a) server sets FUSE_OVER_IO_URING reply at init time - requests will
automatically block until fuse-io-uring is completely set up
b) server does not set FUSE_OVER_IO_URING but later sends uring
register request - requests will continue along /dev/fuse path until
fuse-io-uring is completely set up

Libfuse sets FUSE_OVER_IO_URING in the reply, but the loraw.c server does n=
ot.

I think the best way to fix this is to have the ring creation happen
when the kernel receives the first io-uring command instead of at
FUSE_INIT or at FUSE_IO_URING_CMD_REGISTER ent creation time, given
that FUSE_IO_URING_ADD_QUEUE needs the ring to exist:

Subject: [PATCH] fuse: create fuse_ring on the first io-uring command

Commit 6330b1f61ed1 ("fuse: decouple fuse_ring creation from ent
registration") moved fuse_ring creation to FUSE_INIT reply processing,
gated on the server setting FUSE_OVER_IO_URING in its reply flags.

However, that flag is optional. Libfuse sets it but servers not going
through libfuse may not.

Create the ring on the first io-uring command instead, independent of
what the server negotiated. Ring creation stays decoupled from ent
registration, which FUSE_IO_URING_CMD_ADD_QUEUE depends on since it
needs the ring to exist before any entry is registered.

Fixes: 6330b1f61ed1 ("fuse: decouple fuse_ring creation from ent registrati=
on")
Reported-by: Miklos Szeredi <mszeredi@redhat.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev.c         |  2 +-
 fs/fuse/dev_uring.c   | 18 +++++++++++-------
 fs/fuse/dev_uring_i.h |  5 -----
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 4fec31fc0b84..a665d76292c9 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -77,7 +77,7 @@ void fuse_chan_set_initialized(struct fuse_chan
*fch, struct fuse_chan_param *pa
                fch->max_pages =3D param->max_pages;

                if (param->io_uring_enabled)
-                       fuse_uring_conn_init(fch);
+                       fch->io_uring =3D 1;
        }

        /* Pairs with smp_load_acquire() readers of fch->initialized */
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e22a48c9a678..23c26099d159 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -303,6 +303,7 @@ static struct fuse_ring *fuse_uring_create(struct
fuse_chan *fch)
 {
        struct fuse_ring *ring;
        size_t nr_queues =3D num_possible_cpus();
+       struct fuse_ring *res =3D NULL;
        size_t max_payload_size;

        ring =3D kzalloc_obj(*ring, GFP_KERNEL_ACCOUNT);
@@ -322,6 +323,12 @@ static struct fuse_ring *fuse_uring_create(struct
fuse_chan *fch)
                spin_unlock(&fch->lock);
                goto out_err;
        }
+       if (fch->ring) {
+               /* race, another thread created the ring in the meantime */
+               spin_unlock(&fch->lock);
+               res =3D fch->ring;
+               goto out_err;
+       }

        init_waitqueue_head(&ring->stop_waitq);

@@ -336,13 +343,7 @@ static struct fuse_ring *fuse_uring_create(struct
fuse_chan *fch)
 out_err:
        kfree(ring->queues);
        kfree(ring);
-       return NULL;
-}
-
-void fuse_uring_conn_init(struct fuse_chan *fch)
-{
-       if (fuse_uring_create(fch))
-               fch->io_uring =3D 1;
+       return res;
 }

 static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *r=
ing,
@@ -1685,6 +1686,9 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd,
unsigned int issue_flags)
        if (!smp_load_acquire(&fch->initialized))
                return -EAGAIN;

+       if (!smp_load_acquire(&fch->ring) && !fuse_uring_create(fch))
+               return -ENOMEM;
+
        switch (cmd_op) {
        case FUSE_IO_URING_CMD_REGISTER:
                err =3D fuse_uring_register(cmd, issue_flags, fch);
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index 263d0f8b9714..3233b07430d2 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -184,7 +184,6 @@ struct fuse_ring {
        bool ready;
 };

-void fuse_uring_conn_init(struct fuse_chan *fch);
 void fuse_uring_stop_queues(struct fuse_ring *ring);
 void fuse_uring_abort_end_requests(struct fuse_ring *ring);
 int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags);
@@ -224,10 +223,6 @@ static inline bool fuse_uring_ready(struct fuse_chan *=
fch)

 #else /* CONFIG_FUSE_IO_URING */

-static inline void fuse_uring_conn_init(struct fuse_chan *fch)
-{
-}
-
 static inline void fuse_uring_abort(struct fuse_chan *fch)
 {
 }
--
2.52.0


If you'd prefer an inline replacement for the original commit instead
of a fixup patch on top of the tree, please let me know and I'd be
happy to send that over. Whatever would be easiest for you.

Thanks,
Joanne
