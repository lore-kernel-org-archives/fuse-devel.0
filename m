Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793227974;
	b=buKmbuC5Nf0vsQ/wDLkW7p7WRYHtEfO3PlaSHqmz9XdNNu/wZ+iZJu2B3VSwSxSwvocV
	 UpUFeNrIAniFcOn+/yArH8FMmEDQaZYocHuB/vCgqUwMgGLq/hZcbOFY/4szNmLt/ozTj
	 DB/vBX3PwyYnjrF0mSPW6wpNbqyjycmrni4697D+ncW/Mo3eSFl9Astn1+Blh9MbEQQuZ
	 IRTqJQpvUtXni+gkOrQJbu39HaFdR6lh0ZPE4jf7iyBUguuBgSPc2o/H3fiL7yDi7DbMO
	 nchole8D6uHy7rnr64bLvGE8N2ucW57DuWZkp81du2JUBtaJWO+BNKhVB9IaOOc+B1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uFCeqxNpE0NTPJiv/TZU+OjzBcwND2MGSgKaTCt1k14=;
	b=13oWI7a6Jb6swa5LqOBwCq7uav35DoMKlIuQX4SvY0PnHWpczYB7l2SAfWSDgcUWMz4K
	 LJ14D42jUeanq+ub9Wv7P7KOyXnC6swImWBD8ARWd6VQ7tlAHezM1VUUdPeUUi2W/llNc
	 /DmV83YXxBRnpeHFZciIhVYAJqWjZiX1miIa//UwIkPrb6hFFdaYNpcf3ec4FqHLtwTY0
	 Lb7WP+fSBhTdVf8V61QgdQPASVyX9d+yi5T4O4mswEAo0EAlZ9CFls0x0PJM4G15cs5xh
	 iTy50dbXsr6KWd20o8Z2n3mBMaSIfCqeQQNP/1DHUwdAVwUAKqOddz92yZiZlX0h64A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlpVec8m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C2A606A31A
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 22:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48C2A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlpVec8m
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1136121f8f.0
        for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 15:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793227972; cv=none;
        d=google.com; s=arc-20260327;
        b=II2yLg0xI6HrgNXE16bfmYLbQfS4d53NnpUu/RBVPYpEa7Pb8efDE2RPxBgmXoevT3
         qLLd8OkyMh/86iMi8Bcu9Kfww1UNx+gjEHLcb7qu/L+Rjv1pyCf0MkrrNGtj/am+9APZ
         s0qsqyAw2h8MGafi7QCVtppV+1bo8v4fcg0YH6F1VSptrZBMTVhSIK5q7g9iuHF4yXY5
         B4WOOpNffvojUH0sbGRw/A+23lSYV0vK7hoI9BaznGgvK0xs9N2SHuBub+n9grfWaKau
         oSXRNGlrT+lIRFYy0FbHq89h9z/y/UzBdTyt/nobjMIrEvDKk6NYZHWSZlZ8WRGWy5vU
         YKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uFCeqxNpE0NTPJiv/TZU+OjzBcwND2MGSgKaTCt1k14=;
        fh=Hx5MduouKYQkpt8kNzM3w3DcOqPvgF+8oAOjVEWag7A=;
        b=I4L9vS77yCTA8QP2F73GfKz6XnEIFLryOlI+mYcIjzHPsH6KrZ+ET7vizydHcu3A3R
         ZcNku/a8pZ98Fh07wh6zCGXHK+TSk6m3ALi2r+OOf9i/9WiFg/f0ckrLmeonYARpfzQQ
         /8kklZgKQdk/OQ/mCbzj2Y86ZBz9n19gluDenVNu3kIasmdwIcs1fH5YXIoPW2R2iJ8o
         fui+mprzs/QkfxpogBkfrry0ZbeVwcm+khhAqhKbK5dQd2HA3qolMhgw6kiMegy8aHNe
         CBMv94W7NY2h5pSADtSMbn79nVX01rvwFaPFaTi2YDxkDh0g7NmcaMY3X/BZlZaifUZa
         lOHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793227972; x=1793832772; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uFCeqxNpE0NTPJiv/TZU+OjzBcwND2MGSgKaTCt1k14=;
        b=TlpVec8mYJz0WfieeaRxk3LHsSpFccsEMhIOe7voMMtc63SrCQBcnqzN5oj/beVlPe
         PSi8Gm9hYcKMOjfIe7iU3vAOh9Vy2cc9WYyPynVduhno75McC15LIs5ge5cv5F2AWEuD
         GZFiO8kl6j7AZlu3WQk6RquDO8xq9LGcS6gpcXT7jC0fmIEFk213618T3N//qFRVw1+T
         Hq4x7/nXvs3XgcUMr8SIZEuzpR88bsM5Xk47/3KBYs87IRHfIfpuipjGAiRdmCpB9ty1
         GZualQz5RJnkcIde0MluO6CXeQKuaNRVKBq4i6cdEREzkpRreSYCR8Y7yOD+ymvruGHJ
         k9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793227972; x=1793832772;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFCeqxNpE0NTPJiv/TZU+OjzBcwND2MGSgKaTCt1k14=;
        b=nTUHo4cjmvkL6z4Je5UqpQvf9kU6k7UThASyMRbCGwDQfD3+aEAbNH8VfUhLqOrQiZ
         kzJDPfFkdrqOYj6BNuWPiDSda3zfijd2EFeiGk2HEPj6w0O0KSpSJ/uHAuQfdik5/JaM
         Aas3356yyOR9EEY+xXg7xpIrzZS/MkPrlhG18x535XiDaHmh99GJZhUtnYPk/0aEnUpQ
         b5iS8zSCgYV+qvji0JRlvw12PpE+krOyj1gftmOq6u3KSRDReaijetqMfpAKZuHoxFv0
         MZ/2mpJ1+09Eb/MFfIuuPg7b9pLMHoCNArsZ/jdewPlUJpFpW9/DZ7jbpg4WHW5/N6qN
         6/iw==
X-Forwarded-Encrypted: i=1; AKwUvBywE46ilZzKP+DB2l/2ajmqcgM8i+oYiJx2beLC4k9wMQvA3sPu31MLVntJgMY7WnhYo4ynAIvQwcQU@lists.linux.dev
X-Gm-Message-State: AFq9FYJn8IX+tSp8dmI3LIQPlISi9FPJtaI6bsjuitpyyXVNjj5HctUj
	vhM7rT5mAWGtoimNAKL0eeLuFTiosULj8yIMtrrJcPZcMvxk1SGnzURi6n9WnsV+DXvwRoAqQYx
	OQqXWyM4sJymZ0St+Oscr6/xihJhQYVtvjC1pQ6g=
X-Gm-Gg: AYBFou1LFTtUbkD1TjCHvVMr/HsnIqX2pQpzuJLQCrUSalMZPQW0p6FAsjRgS9QzCne
	EUIHCRolty8gEjCogYzhfndkxaHeAmeYKLUiJGGTqO4oLTP3mNm/7axc04P/zNmR3aPyAJAbRY7
	FAQCUXFyGgJSYJ9NL8upz2xfzqEpi8FGgFwZgN2H6CBCBUjHSo/B5ZDor55iEGycA1xmZc+m8O3
	DkUO0wju8+xDJtOiSiQzBbmsXB6iAJqrRgeYMN3OFPs6JJve1XePoLK9fJF7SV7eMQthl8W1Lp8
	P3ifU9W+2ci3K6SwdneZS9IiEekFk1Ph4vAz0iHZemLvWkFGDFx8UmklI6EtmnX1ezn7qY/vj7+
	bnMEpCozGh+rwOYDd6AG2R7zj2gJ0ZA0lppwEMPg/FKbSSv1h0K8x/OuuDoHfrRq0C14ocyDCbm
	5TBou3y0d0GTWBUj1lXw==
X-Received: by 2002:a05:6000:2388:b0:48d:ee59:3a30 with SMTP id
 ffacd0b85a97d-48e5d5c6fd9mr7615421f8f.22.1793227972434; Wed, 28 Oct 2026
 15:52:52 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
 <20261025-reduced-nr-ring-queues_3-v8-5-8a2570e8d2a4@bsbernd.com>
 <CAJnrk1b7B+FLrazs5eEAr3dEU4a+EueeQog6eGAVraEx-OhYgA@mail.gmail.com> <f1342ec5-014f-4125-a35c-15df91da04d5@bsbernd.com>
In-Reply-To: <f1342ec5-014f-4125-a35c-15df91da04d5@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 28 Oct 2026 15:52:39 -0700
X-Gm-Features: AclHuK8YtVQsNdPpmtd9H4rlWNeoLs0sHwdXEmhxFBtA7LZq3tYsTpP434s5UBY
Message-ID: <CAJnrk1a-UTRtzgq5L9uyyM=0KhW9pBBjJ0UT6nkZWNJyYVp5kg@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] fuse: {io-uring} Allow reduced queues through INIT negotiation
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:38=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
>
> On 10/28/26 22:06, Joanne Koong wrote:
> > On Sun, Oct 25, 2026 at 3:29=E2=80=AFPM Bernd Schubert via B4 Relay
> > <devnull+bernd.bsbernd.com@kernel.org> wrote:
> >>
> >> From: Bernd Schubert <bernd@bsbernd.com>
> >>
> >> Main reson to reduce queues is that a system with many cores
> >> might run out of memory if queue-per-cpu is used.
> >>
> >> A new INIT reply flag FUSE_URING_REDUCED_Q is introduced, that
> >> activates this feature and also expects that each queue is created
> >> with FUSE_IO_URING_CMD_ADD_QUEUE. Without the flag, nothing changes.
> >>
> >> ADD_QUEUE adds the queue to the CPU to queue maps. A request mapped to
> >> the new queue is delayed until the server registers the first entry
> >> of that queue, usually shortly after ADD_QUEUE.
> >>
> >> Race free protection with spin-lock and rcu:
> >>
> >> - fch->lock protects against multiple ADD_QUEUE calls at the same time=
,
> >> so that new q-maps per q-create are serialized in publishing. It also
> >> ensures ring->ready is not set before a q-map is published.
> >> - queue is stored before map publishing, so that a sender always finds
> >> ring->queues[qid] set for a qid in the maps.
> >> - rcu_assign_pointer() ensures a sender sees the new pointer after
> >>   cpu_to_qid[] is filled.
> >> - rcu_read_lock() ensures that old maps (in the sense of new queues)
> >>   are not freed while the map is still used
> >>
> >> It also includes slight refactoring in fuse_uring_create_queue to
> >> avoid freeing in the middle. Also dropped is "kfree(queue->bufpool)"
> >> in that function, it is always NULL.
> >>
> >> Assisted-by: Claude Opus 5.5
> >> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> >> ---
> >>  fs/fuse/dev.c             |   2 +-
> >>  fs/fuse/dev.h             |   1 +
> >>  fs/fuse/dev_uring.c       | 127 ++++++++++++++++++++++++++++++++++++-=
---------
> >>  fs/fuse/dev_uring_i.h     |  13 +++--
> >>  fs/fuse/inode.c           |   9 +++-
> >>  include/uapi/linux/fuse.h |   4 ++
> >>  6 files changed, 122 insertions(+), 34 deletions(-)
> >>
> >> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> >> index d243e124cb4c..cff8a06e6d68 100644
> >> --- a/fs/fuse/dev_uring.c
> >> +++ b/fs/fuse/dev_uring.c
> >>
> >> @@ -512,9 +558,24 @@ static struct fuse_ring_queue *fuse_uring_create_=
queue(struct fuse_ring *ring,
> >>          * fully initialized queue after &ring->queues[qid] is set
> >>          */
> >>         smp_store_release(&ring->queues[qid], queue);
> >> +
> >> +       /* Update maps so that requests can be scheduled via the new q=
ueue */
> >> +       if (new_maps)
> >> +               old_maps =3D fuse_uring_replace_q_maps(ring, new_maps,=
 qid);
> >>         spin_unlock(&fch->lock);
> >>
> >> +       if (old_maps)
> >> +               call_rcu(&old_maps->rcu, fuse_uring_free_q_maps_rcu);
> >> +
> >>         return queue;
> >
> > Could we consolidate the mapping logic for the legacy vs dynamic paths
> > into one general flow? I'm finding it a bit confusing to follow
> > otherwise with too many pieces. Right now, from what I see, the flow
> > between the two is this:
> >
> > Legacy:
> > - Map gets created in fuse_uring_create() at FUSE_INIT time
> > - Map is built from cpu_possible_mask
> > - Map is set before the ring is published (smp_store_release() of fch->=
ring)
> >
> > Dynamic queue:
> > - Map gets created in fuse_uring_create_queue() at ADD_QUEUE time
> > - Map is built from global.registered_q_mask (qids added so far, but
> > none of them may have had an entry registeredd yet)
> > - Map is published through RCU swap
> >
> >
> > What about this one consolidated flow?:
> > - Map gets updated on the first REGISTER for a queue (allocated in
> > fuse_uring_register() before the entry is created,then built and
> > published in fuse_uring_do_register())
> > - Map is built from global.registered_q_mask (qids registered so far)
> > - Map is published through RCU swap
> >
> > A queue can only start actually servicing requests once >=3D 1 entry ha=
s
> > been registered, so imo it makes sense for the queue to be set in the
> > mapping only once an entry in it has been registered. This also fixes
> > the issue where if there ends up being some failure between when a
> > queue has finished being added but before any entry for it has been
> > registered, no requests mapped to that queue get lost (otherwise they
> > will sit forever in fuse_req_queue). For the legacy path, the map
> > could just be published once in this consolidated flow when the last
> > queue gets its first entry, since nothing routes through the maps
> > until the ring is ready.
> >
> > WDYT?
>
> Why do we need ADD_QUEUE for this feature then? Didn't you especially
> ask to use ADD_QUEUE for dynamic queues? I was basically holding back
> any updates on this series until ADD_QUEUE was implemented in kernel and
> libfuse and now we go the other way around. Without the request to do it
> through ADD_QUEUE this series would have been ready a few months back...

The consolidated path wouldn't drop ADD_QUEUE, that part would stay
exactly as it is (eg it creates the queue with its config (zero copy,
bufpool needs the queue to exist, etc.) and REGISTER still requires it
in reduced mode. The only part that gets changed / consolidated is how
the mappings get set.

Feel free to defer this. I can send out a patch for this after your
series lands, if that makes things easier.

>
> Personally I see that the current way makes registering new queues
> rather expensive from fuse-server, because we first add a queue and then
> need to wait for the entry, which
>

Any servers that want advanced io-uring features (zero copy, bufpools)
will already need to go through ADD_QUEUE. imo it doesn't make sense
to also add compatibility for reduced queues to the legacy interface.

Thanks,
Joanne
