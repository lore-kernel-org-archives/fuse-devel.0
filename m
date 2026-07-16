Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F5C30EF63
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 18:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226093; cv=pass; b=rdaNaK5mjfwDhHtZygbUul3406DUfwCpiFuu11PkDm4zVBhEwGbnCGGXs7ezeRmFZJzic2I1OQ6qzIbocmdehr79ey8JyHn374zdKpuaoaI+8UX4F7VmUkdX72eIPPVOiTnDeS1U4J3g0eWzEp93204+suusRSpFYV1LlFXlH2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226093; c=relaxed/simple;
	bh=EED7I6Cgzn4Siqa2KZnQb+9Uj22ntNVGfKi9KJsb2QI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iv/qbcp4kVgfIPmsd1OEzCIxerRAN5SLqKTw0IbgYIlVT8y4J5r24CdHZ5IhLks2ykGinOPimrm+HAT7Ry0FZ0BYyvf4xX9ulOF3x2ZUXUduHoZ7uhnW5xQEg+EwVhifOOrLCr17Y5mgxeaFAgMYglNWBcY7kohpINwWI1BXK/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rd28YJO/; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rd28YJO/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495437bb891so5386295e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 11:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784226083; cv=none;
        d=google.com; s=arc-20260327;
        b=s085q/q115zWN2ESiyjw68YwCbzQ6s8/gyuixTqC1hySgxWTmRks1ZN9waajbZQo7T
         KfbeE+iBhOLP9hjv4w9dSKSRlKuRLsNPoWw1V+V3BWs/hzg44v1pOidMha+d337aEHfY
         EGfeFYkgqfHxj7H7FU2kOVrvf6RQ05Aq+s2zVJAYsdgJJmycha2gTTsiUKk+q6WU5tzM
         8EkuIgemRT5qKGaWmKSNXhuVCrtKWOV6JhF9cb5Y+zrqWDIicKq9HArmTLMSZxTbRsBC
         sVodJB+Bdu+epWwNp15Nf2kvPbp1qQBclMFOH4sswtHmywjIf7TQrV/JV7XwUTtbGXxz
         qs6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CCALGBJmvNhpJ4X8shKHWQmC/dAzM5grVkNM/sgcff0=;
        fh=iNSqQFe9Gr6+T+CzR6iLVCmWB5S7eY1gNZ8X8vMyslM=;
        b=om7m0gZBhtAUhCRJNrmlab6e/FXx5iO2y3fydkJ2W8V7Ci5FQLluhTZ6z3tt4b+RO6
         HRm3RrZRvP8zrFCs4mFUfls5qm+2U7PrkUz7kV28CAUtZBKXV4FZko28D6/j8yL5TyCE
         aJNBdbNiZfvPxesHoTUTCfJuFQ80OaIjdLsw7zPT0B7HIeCrsLAaK1sH25ct3ZbDZm1N
         yVJlz/lTzg2skxViKVV2wcIYhKtM8NJdbsDM3uqw3v0p6C1pZTjH5eHz9oliOvVHWFAT
         6+GmtK9wFOeWspG3/JHKHFy2nHkGdBTH+HXWAC52lBOqSXwLbTKXYZCyoWWPcnOH6Fsy
         K3ZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784226083; x=1784830883; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CCALGBJmvNhpJ4X8shKHWQmC/dAzM5grVkNM/sgcff0=;
        b=Rd28YJO//ErvM/njoG4rw4d6HaoizXsSnJgjXHde6MRGZ08me9WQ+jY+4KWQxwAaUu
         SqhM4F8nSGYsWRlQz4I6dkl0EeR/NTmR/Kcoe5U1mj99YVeXJvUEsiHBh/0lJw6/68wb
         JuvV9BgsdJl/cbBgYfVSy+C3h+bOJaAvHWcUdQe26xKY539sFIvvb1PCanYHvu6Wrhe7
         DTBgxmHaNEqSv1pLo7UntzCMlCwbdUbg8cWV4my4hna+J2sl4PEzZizMGXOf/X8ZQi05
         XL0lUhH0w/istSLsre7qbhcCkVPnGHANZL/UwUtKczOa4YcQtzcgu8eEJEyIYvqr9XsW
         OrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226083; x=1784830883;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCALGBJmvNhpJ4X8shKHWQmC/dAzM5grVkNM/sgcff0=;
        b=U7rACa8LNuWX+Jr4qrFwIOB/ljaNo0hynEyIXmnfgjPIR+IcmISmhKhc7lc1u+VZYI
         xQGw4p/kbMkbyU86Njcr2nEzC21pe+WlBvY6LmUdrbkBiSch2m/MMpigU0jik2zGCica
         PgFDq8MPa+3QNEnyxxWHuIYkdsldpwtuhOVzTBXAnNIHxfcUb04+00HBJRQVWRNI9a/d
         JFTwA5PVY9guWEgWpVLLnVfztb5h1X6iDLxupFnRvEkOuBBtup8Z+jRpJvOJbT/YlnSs
         hFS8rwr9JdZm/6/ge/PYVIgk+i7+D2G9fxF3y0eWnO1uBiBYDITYj3ylRHyKCTw/WzvW
         KvEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWTDse8G9znuPcuNh0NpMek7mGYc+IAbChzYE5+IDNJxZMnSUNUdIXoT873XOJm1gdeNmI5AAr9Nup@lists.linux.dev
X-Gm-Message-State: AOJu0YwB92EzRrjztY2ZJUGFvZyE1vIcqaHUejZYilmMaHBPZX7i033A
	ho695/6Gxw7tYa3gG8Kw8xVm+wwcapbuBdVn461f9Y4whqiBtjDJTAweGCxr/9REuyqm7n5Jq7h
	aesFzOClLA3YrGqQhhHxb1aBvAiEFPVE=
X-Gm-Gg: AfdE7cmBR/63NawGv4TChHfoxDXmCpgrDIlm+wsR0CTEffTnCYjJTftg8f/kBG/3lv3
	e7keZ56/ndG39J+qyarx2rUkhXztRpWj81feImRNke0wfREoQt2oHiP/Ob8acMifJu48uITndIT
	BAhoHbsTNfrNNAhWuS1XNOs67nQLXKuqPybY2sbVpPASu6B9dRvWTNZQ5hcb1sTLQ1SHUTpXHi5
	G2nNKqUVRa4Lqp2LS1YZSa1Z55nX7bmkvAh6rNdq4dLcnprSxoyuWWGru7f+6Fi3W16I/kP9B4d
	l14MiufXXbboXXsfmSmqAoyKQXHIrmKRVkAny+KmiA==
X-Received: by 2002:a05:600d:104:b0:493:e49f:1541 with SMTP id
 5b1f17b1804b1-4954288e0d9mr33683575e9.6.1784226083225; Thu, 16 Jul 2026
 11:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715174305.336261-1-joannelkoong@gmail.com>
 <20260715174305.336261-4-joannelkoong@gmail.com> <668fa6c6-ffe0-48d1-aed6-f86a7353187b@bsbernd.com>
In-Reply-To: <668fa6c6-ffe0-48d1-aed6-f86a7353187b@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 16 Jul 2026 11:21:10 -0700
X-Gm-Features: AUfX_mzTmBWvWvRDl--8ldti_PXiikTVNGTCFrDr1F8x_VSuZf0_na-Eu9y__mA
Message-ID: <CAJnrk1YCSmK=7UwCsm8KF5kvndk+zM655whcHt85oKbpse8XYw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fuse: publish io-uring queues with release semantics
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 3:54=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
>
> On 7/15/26 19:43, Joanne Koong wrote:
> > fuse_uring_create_queue() initializes a fuse_ring_queue and then
> > publishes the pointer into ring->queues[qid] with WRITE_ONCE() under th=
e
> > fch->lock. There are several readers that may concurrently be fetching
> > that pointer locklessly and then deferencing it.
> >
> > WRITE_ONCE() doesn't ensure ordering of the queue's field
> > initialization before the ring->queues[qid] pointer assignment. The
> > queue must be published with smp_store_release() so the field
> > initialization is guaranteed to happen before.
> >
> > Readers in paths where the read may happen concurrently with the store
> > need to use READ_ONCE() because any race involving a plain access is
> > undefined.
> >
> > Fixes: 24fe962c86f5 ("fuse: {io-uring} Handle SQEs - register commands"=
)
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/dev_uring.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index 51f985154aa1..bf9d51f2a508 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -321,9 +321,11 @@ static struct fuse_ring_queue *fuse_uring_create_q=
ueue(struct fuse_ring *ring,
> >       }
> >
> >       /*
> > -      * write_once and lock as the caller mostly doesn't take the lock=
 at all
> > +      * fch->lock serializes concurrent creators for this qid.
> > +      * smp_store_release() are for the lockless readers who must see =
a
> > +      * fully initialized queue after &ring->queues[qid] is set
> >        */
> > -     WRITE_ONCE(ring->queues[qid], queue);
> > +     smp_store_release(&ring->queues[qid], queue);
> >       spin_unlock(&fch->lock);
> >
> >       return queue;
> > @@ -434,7 +436,7 @@ static void fuse_uring_log_ent_state(struct fuse_ri=
ng *ring)
> >       struct fuse_ring_ent *ent;
> >
> >       for (qid =3D 0; qid < ring->nr_queues; qid++) {
> > -             struct fuse_ring_queue *queue =3D ring->queues[qid];
> > +             struct fuse_ring_queue *queue =3D READ_ONCE(ring->queues[=
qid]);
> >
> >               if (!queue)
> >                       continue;
> > @@ -967,7 +969,7 @@ static int fuse_uring_commit_fetch(struct io_uring_=
cmd *cmd, int issue_flags,
> >       if (qid >=3D ring->nr_queues)
> >               return -EINVAL;
> >
> > -     queue =3D ring->queues[qid];
> > +     queue =3D READ_ONCE(ring->queues[qid]);
> >       if (!queue)
> >               return err;
> >       fpq =3D &queue->fpq;
> > @@ -1035,7 +1037,7 @@ static bool is_ring_ready(struct fuse_ring *ring,=
 int current_qid)
> >               if (current_qid =3D=3D qid)
> >                       continue;
> >
> > -             queue =3D ring->queues[qid];
> > +             queue =3D READ_ONCE(ring->queues[qid]);
> >               if (!queue) {
> >                       ready =3D false;
> >                       break;
> > @@ -1191,7 +1193,7 @@ static int fuse_uring_register(struct io_uring_cm=
d *cmd,
> >               return -EINVAL;
> >       }
> >
> > -     queue =3D ring->queues[qid];
> > +     queue =3D READ_ONCE(ring->queues[qid]);
> >       if (!queue) {
> >               queue =3D fuse_uring_create_queue(ring, qid);
> >               if (!queue)
>
>
> For consistency, maybe READ_ONCE/WRITE_ONCE in fuse_uring_destruct?

I didn't add it because I don't think it's necessary (because
fuse_uring_destruct can only run after the queue has been created),
but I can add it to make things more uniform, if you have a preference
for one way or the other. I'll send out v3 with this change.

Thanks,
Joanne
