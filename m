Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793221596;
	b=P+iC8rSbd8NRMHNx5c9gaqYsEp0FF++PYTo5V+z84DUIEeLvG4Vd4QaOdmGt2PtMWy3k
	 AA/tA9687H9lHKnE+83YKRJpj69XQmpV8sb/uX1n3DITgbIt6FNvOU00sLKSgWWFicVZz
	 E7r49r/XNmtlH1FahMlqmGW4niveXWMttajVL43pfKOslLCln/6L/F3NGp+1V6t+l/ehj
	 BQ+2pae4+MU/dBDXIBTEjMiZrJJ4dKP1pp1sC62OxXbJEZIHCUt1NOSAg1Oln6iJqy53e
	 RH01JbPodYrbTdgmBeB1rDN9UpVh7Ce0xLOXW8ZXkn2RvI5ZGTp+MoPCf5rRIhfO90Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793221596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wg43NPqhIOGl1HUqSSHjEGFsRdQifvL37J1wG08/55k=;
	b=0aqslmB7EtcBshPXcPBOEiXhsx3PoxTvTqOHdwdXvjtyyXcjZYtjS/tybG4R/iZfRX5/
	 G2FhcKeAZZ2x8kUP93tqkekp3czWDLalqdybNlT30eE+BCUG8YahIpzvcX+epf6OUixxk
	 ie6mnzXTfqo8Uia2MhlYzr3p4qdeU8WCG6ELUmDB+SQUyf2V43bTvKzHgA50FMve5VE4l
	 zAbtt6D7VCxBotyO4hjC4FDnHMtOJjqc29zM4Yya2LsT7ljExWfJ87xMQU4F3jmTS792Y
	 HwRE+GmSlqE7/LRQXJB9Al952rxVg3LS8tw1k47nw/rw3VI4YknPLG7bsp4wrHxFQNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kbywPF+k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7919C606A327
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 21:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7919C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kbywPF+k
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso12038225e9.1
        for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 14:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793221594; cv=none;
        d=google.com; s=arc-20260327;
        b=jADrKElH8E5jT0HlOLspel9GPLpw3puctO3JlUEkTW53MXPA8Wwdk8NvBDyVN3BbbA
         vfRPbTH/+7Br5ng0MWRis40TjjzK4HU+pCj8bKRE+8mzQZiI5IGHmwJi5KZnSJC8zSX0
         7JvYEM36n3RElDxcso3u+vVw7Kb3j4aFh6f3UwdHbEqO8hC2ivDNLNU/x5HMtsPZtQ22
         LnKzsUmFUZpS7Mig1p9jgz40dqbrXQwbnSsJJKlIzKpKlnDr/q/IY8HoHU8/bhiyfqkA
         SMqaEARyw5pbrYXQdFiCmVYztUC/cooY4NtGOfxTkNXkmVAEkFu3jHTWehKHL407F3Id
         CkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wg43NPqhIOGl1HUqSSHjEGFsRdQifvL37J1wG08/55k=;
        fh=apVXBiSv4E+6mZV/w+2HvcaH3RLnt5UPLQjQ76lil0c=;
        b=R+jAC1lEzryzkmOVBbmnjg4bzjWyAFbgRWt0Hk9WL+bpahkElzDIabCOAGf3CIYeLZ
         Qq8uyOBO8Pm3sOUjgf5OFrKWCamzXvOvXE5NUqSqZxGfMisbzk0TCqdnhtzQcCfY2j/A
         2au1btdawVTsRVMV4DNMZQwnhPonSGENUjy44nbMgDU/BrDRYiEe9Oal6jjGT9Z0wUsX
         BQxY+BPjZD0qUiyd4GpolUtlwzTtwqWozZUCCY1ePbqXQif2luSLQGdIUmpFdbZ+4M6j
         yyUuLxT/nXzqJnqP0Ib2rYKzZ6KWA5xBSxdFWyPbdg9vl57u97Xlqu1acUKd5SaIOJkR
         Ysfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793221594; x=1793826394; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wg43NPqhIOGl1HUqSSHjEGFsRdQifvL37J1wG08/55k=;
        b=kbywPF+k5iSfh9oGyUih1tp09V/6DKEdyqHTLvn8h6Jj9zP41HM7C0u+iLCvWEk9tn
         EXZNx1QjAQFI/g1msYCOo8Yx3Pbyl4+v27/G/oRpN3O+e23Hx+YrTNG0eQ5Lj5rQm0J5
         VAB2tKeFIa+ofX6/dHHadtLhFTMt8clS6JPs7vWwi4Idtl+UeFJGmA5+Yde3W+jFaRVk
         iW/Fnoqje1CIWbc/LFxM3G5MyAO0WAuWXmjCVcMusspFf+pbkauBZPrMtjZzm/fs/z0p
         A0/cNcgN/iyu3jgvJyE5E3TC01CLvV5rzy+RB4w6rGNiamhq8LvcTLkFUp2DkeBEZwp/
         AdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793221594; x=1793826394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wg43NPqhIOGl1HUqSSHjEGFsRdQifvL37J1wG08/55k=;
        b=J8REPSkPzmK9dwB9CMFAPtV0CHjueXtH2ooB5QQZ1PaGVWhHP+wy2jwG+K5LoD1FzB
         /vRx2R3TvUQNWJOO4UT8IJqHn2aH17ezSdeWTG7cipIG/XfzmSB5J41BvqvJ8Zz8nFQl
         V3pydvm8tt+2h+tM/UW0EhEOPV3iNkQhQL2JvVbTw5ewQHKfwxfOl+Rul/ISeHGp/fmY
         q6Z0ZoewPlJLblk+TBI+jzsm2a48DB5tdEqLJGgPBnXG4ZA51oyjvCn40t0RC63EdYkV
         8uLowyjXRz5gQ4O6n++2o6twF4JTBZ1tYXCCz7v+B9hQsZEPitwLmIRscEDIzDdSeXly
         CAsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWqQ947yDqz3feccoTRJGS1JGm/L1MtkcZuxpyE7sJTCB9LxrWbGrzamd3mOzRtF1esuKj19gBLGVn@lists.linux.dev
X-Gm-Message-State: AFq9FYLIC0shhdefvZFqX3iMfEW+v1cfjWhnlctCKPP/pEG+oW0I8ohG
	Byb5jCpN4MgEMjWr5XG2DVIrE7g3gQIoSgqbk0aAMuDTRVoUVjHM36K4TGCAuxq68Zp/qAWGcgU
	iScV81UVz/jNzIeNoLYLmSsdyEUUxcxU=
X-Gm-Gg: AYBFou2nvTFhltESGSttr1FVBVSUSElz8qSikKnJm12MJb1XHS59u6Y4TrldNIdRCmW
	SeApFYXPpAERsZH7m+9abg81bkgVGJsuHUkShevk58KfmNTmQ1MrT+6Tx9sDAdRxqbhF2IKA+8a
	dqCp4sAaXgTs/H16+/r1Ll+ZYJAnZGA67TzHjaPH5Uty6/9XFYjM1AmEuI85fYkOUbWovADgmha
	SRBR5hmLJ9ahlkjAp6sLpL73yZq1ee6j2HXktuhdgjRy+BXF3ohVsq8ohX0gRM2RoVXYCbh2up9
	tUF3TlO+HCFlYuusqhpmuFS1vYncMgm2YerkXjDRJjm73fQ9Qy0/mI/cYdWHLQks6O3SdOnIT3a
	ICt99DloeIiRgdsSzB/udE2rEcIOzq5/wnFjHaQm7m8TdRh/kWcgQSCPzAMKE0LwYhUPAJeB5Lb
	FTWFT3Q0kwZPS+oRjRAg==
X-Received: by 2002:a05:600c:8589:b0:4a1:e57b:667c with SMTP id
 5b1f17b1804b1-4a966e2b8e3mr56688695e9.26.1793221593650; Wed, 28 Oct 2026
 14:06:33 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com> <20261025-reduced-nr-ring-queues_3-v8-5-8a2570e8d2a4@bsbernd.com>
In-Reply-To: <20261025-reduced-nr-ring-queues_3-v8-5-8a2570e8d2a4@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 28 Oct 2026 14:06:21 -0700
X-Gm-Features: AclHuK9jkaMIKD_Vt-JcWHqSosemhGzZ2FM0KzN-Cl4WZ-QEjFKjXCOJhhUb14s
Message-ID: <CAJnrk1b7B+FLrazs5eEAr3dEU4a+EueeQog6eGAVraEx-OhYgA@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] fuse: {io-uring} Allow reduced queues through INIT negotiation
To: bernd@bsbernd.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 3:29=E2=80=AFPM Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> From: Bernd Schubert <bernd@bsbernd.com>
>
> Main reson to reduce queues is that a system with many cores
> might run out of memory if queue-per-cpu is used.
>
> A new INIT reply flag FUSE_URING_REDUCED_Q is introduced, that
> activates this feature and also expects that each queue is created
> with FUSE_IO_URING_CMD_ADD_QUEUE. Without the flag, nothing changes.
>
> ADD_QUEUE adds the queue to the CPU to queue maps. A request mapped to
> the new queue is delayed until the server registers the first entry
> of that queue, usually shortly after ADD_QUEUE.
>
> Race free protection with spin-lock and rcu:
>
> - fch->lock protects against multiple ADD_QUEUE calls at the same time,
> so that new q-maps per q-create are serialized in publishing. It also
> ensures ring->ready is not set before a q-map is published.
> - queue is stored before map publishing, so that a sender always finds
> ring->queues[qid] set for a qid in the maps.
> - rcu_assign_pointer() ensures a sender sees the new pointer after
>   cpu_to_qid[] is filled.
> - rcu_read_lock() ensures that old maps (in the sense of new queues)
>   are not freed while the map is still used
>
> It also includes slight refactoring in fuse_uring_create_queue to
> avoid freeing in the middle. Also dropped is "kfree(queue->bufpool)"
> in that function, it is always NULL.
>
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  fs/fuse/dev.c             |   2 +-
>  fs/fuse/dev.h             |   1 +
>  fs/fuse/dev_uring.c       | 127 ++++++++++++++++++++++++++++++++++++----=
------
>  fs/fuse/dev_uring_i.h     |  13 +++--
>  fs/fuse/inode.c           |   9 +++-
>  include/uapi/linux/fuse.h |   4 ++
>  6 files changed, 122 insertions(+), 34 deletions(-)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index d243e124cb4c..cff8a06e6d68 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
>
> +/* Returns the replaced maps, to be freed after an RCU grace period */
> +static struct fuse_queue_maps *
> +fuse_uring_replace_q_maps(struct fuse_ring *ring, struct fuse_queue_maps=
 *maps,
> +                         int qid)
> +{
> +       struct fuse_queue_maps *old;
> +
> +       old =3D rcu_dereference_protected(ring->q_maps,
> +                                       lockdep_is_held(&ring->chan->lock=
));
> +       if (old)
> +               cpumask_copy(maps->global.registered_q_mask,
> +                            old->global.registered_q_mask);
> +       cpumask_set_cpu(qid, maps->global.registered_q_mask);
> +       fuse_uring_build_q_maps(maps);
> +       rcu_assign_pointer(ring->q_maps, maps);
> +
> +       return old;
> +}
> +
>  /*
>   * Basic ring setup for this connection based on the provided configurat=
ion
>   */
> -static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
> +static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch, bool r=
educed_q)
>  {
>         struct fuse_ring *ring;
> +       struct fuse_queue_maps *maps =3D NULL;
>         size_t nr_queues =3D nr_cpu_ids;
>         size_t max_payload_size;
>
> @@ -426,12 +454,15 @@ static struct fuse_ring *fuse_uring_create(struct f=
use_chan *fch)
>                 goto out_err;
>         ring->max_nr_queues =3D nr_queues;
>
> -       /* Legacy behavior by default, one queue per cpu */
> -       ring->q_maps =3D fuse_uring_alloc_q_maps();
> -       if (!ring->q_maps)
> -               goto out_err;
> -       cpumask_copy(ring->q_maps->global.registered_q_mask, cpu_possible=
_mask);
> -       fuse_uring_build_q_maps(ring->q_maps);
> +       /* With reduced_q, FUSE_IO_URING_CMD_ADD_QUEUE builds the maps */
> +       if (!reduced_q) {
> +               /* Legacy behavior, one queue per cpu */
> +               maps =3D fuse_uring_alloc_q_maps();
> +               if (!maps)
> +                       goto out_err;
> +               cpumask_copy(maps->global.registered_q_mask, cpu_possible=
_mask);
> +               fuse_uring_build_q_maps(maps);
> +       }
>
>         max_payload_size =3D max(FUSE_MIN_READ_BUFFER, fch->max_write);
>         max_payload_size =3D max(max_payload_size, fch->max_pages * PAGE_=
SIZE);
> @@ -446,21 +477,23 @@ static struct fuse_ring *fuse_uring_create(struct f=
use_chan *fch)
>
>         ring->chan =3D fch;
>         ring->max_payload_sz =3D max_payload_size;
> +       ring->reduced_q =3D reduced_q;
> +       RCU_INIT_POINTER(ring->q_maps, maps);
>         smp_store_release(&fch->ring, ring);
>
>         spin_unlock(&fch->lock);
>         return ring;
>
>  out_err:
> -       fuse_uring_free_q_maps(ring->q_maps);
> +       fuse_uring_free_q_maps(maps);
>         kfree(ring->queues);
>         kfree(ring);
>         return NULL;
>  }
>
>
> @@ -469,16 +502,24 @@ static struct fuse_ring_queue *fuse_uring_create_qu=
eue(struct fuse_ring *ring,
>                                                        bool fail_if_exist=
s)
>  {
>         struct fuse_chan *fch =3D ring->chan;
> -       struct fuse_ring_queue *queue;
> +       struct fuse_queue_maps *new_maps =3D NULL, *old_maps =3D NULL;
> +       struct fuse_ring_queue *queue, *result =3D ERR_PTR(-ENOMEM);
>         struct list_head *pq;
>
>         queue =3D kzalloc_obj(*queue, GFP_KERNEL_ACCOUNT);
>         if (!queue)
>                 return ERR_PTR(-ENOMEM);
>         pq =3D fuse_pqueue_alloc();
> -       if (!pq) {
> -               kfree(queue);
> -               return ERR_PTR(-ENOMEM);
> +       if (!pq)
> +               goto out_free;
> +       if (ring->reduced_q) {
> +               /*
> +                * Every queue addition creates a new map to make reading=
 the
> +                * old map race free
> +                */
> +               new_maps =3D fuse_uring_alloc_q_maps();
> +               if (!new_maps)
> +                       goto out_free;
>         }
>
>         queue->qid =3D qid;
> @@ -499,11 +540,16 @@ static struct fuse_ring_queue *fuse_uring_create_qu=
eue(struct fuse_ring *ring,
>
>         spin_lock(&fch->lock);
>         if (ring->queues[qid]) {
> -               spin_unlock(&fch->lock);
> -               kfree(queue->fpq.processing);
> -               kfree(queue->bufpool);
> -               kfree(queue);
> -               return fail_if_exists ? ERR_PTR(-EEXIST) : ring->queues[q=
id];
> +               result =3D fail_if_exists ? ERR_PTR(-EEXIST) : ring->queu=
es[qid];
> +               goto out_unlock;
> +       }
> +       /*
> +        * Reduced queues can be added after ring->ready. Connection abor=
t
> +        * stops only queues it finds, so a queue is added only while con=
nected.
> +        */
> +       if (ring->reduced_q && !fch->connected) {
> +               result =3D ERR_PTR(-ENOTCONN);
> +               goto out_unlock;
>         }
>
>         /*
> @@ -512,9 +558,24 @@ static struct fuse_ring_queue *fuse_uring_create_que=
ue(struct fuse_ring *ring,
>          * fully initialized queue after &ring->queues[qid] is set
>          */
>         smp_store_release(&ring->queues[qid], queue);
> +
> +       /* Update maps so that requests can be scheduled via the new queu=
e */
> +       if (new_maps)
> +               old_maps =3D fuse_uring_replace_q_maps(ring, new_maps, qi=
d);
>         spin_unlock(&fch->lock);
>
> +       if (old_maps)
> +               call_rcu(&old_maps->rcu, fuse_uring_free_q_maps_rcu);
> +
>         return queue;

Could we consolidate the mapping logic for the legacy vs dynamic paths
into one general flow? I'm finding it a bit confusing to follow
otherwise with too many pieces. Right now, from what I see, the flow
between the two is this:

Legacy:
- Map gets created in fuse_uring_create() at FUSE_INIT time
- Map is built from cpu_possible_mask
- Map is set before the ring is published (smp_store_release() of fch->ring=
)

Dynamic queue:
- Map gets created in fuse_uring_create_queue() at ADD_QUEUE time
- Map is built from global.registered_q_mask (qids added so far, but
none of them may have had an entry registeredd yet)
- Map is published through RCU swap


What about this one consolidated flow?:
- Map gets updated on the first REGISTER for a queue (allocated in
fuse_uring_register() before the entry is created,then built and
published in fuse_uring_do_register())
- Map is built from global.registered_q_mask (qids registered so far)
- Map is published through RCU swap

A queue can only start actually servicing requests once >=3D 1 entry has
been registered, so imo it makes sense for the queue to be set in the
mapping only once an entry in it has been registered. This also fixes
the issue where if there ends up being some failure between when a
queue has finished being added but before any entry for it has been
registered, no requests mapped to that queue get lost (otherwise they
will sit forever in fuse_req_queue). For the legacy path, the map
could just be published once in this consolidated flow when the last
queue gets its first entry, since nothing routes through the maps
until the ring is ready.

WDYT?

> +
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 616430a2973c..d8cb1764e2ca 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -257,6 +257,7 @@
>   *  - add backing_id_64 to fuse_open_out
>   *  - add FUSE_NOTIFY_BACKING_MAP, fuse_notify_backing_map_out, fuse_ext=
ent
>   *  - add FUSE_BACKING_MAP_CREATE, FUSE_BACKING_MAP_CYCLIC
> + *  - add FUSE_URING_REDUCED_Q

Does this need to be a new minor version bump?

>   */
>
>  #ifndef _LINUX_FUSE_H
> @@ -480,6 +481,8 @@ struct fuse_file_lock {
>   *             privilege that mounting virtiofs or fuseblk requires).
>   *             Insufficiently privileged servers ignore it.
>   * FUSE_PASSTHROUGH_V2: use 64 bit server allocated backing ID
> + * FUSE_URING_REDUCED_Q: INIT reply opt-in to 1..nr-cpus queues, each cr=
eated
> + *             with FUSE_IO_URING_CMD_ADD_QUEUE; serving starts at the f=
irst entry.
>   */
>  #define FUSE_ASYNC_READ                (1 << 0)
>  #define FUSE_POSIX_LOCKS       (1 << 1)
> @@ -530,6 +533,7 @@ struct fuse_file_lock {
>  #define FUSE_HAS_IO_URING_BUFPOOL (1ULL << 43)
>  #define FUSE_HAS_SYNCFS                (1ULL << 44)
>  #define FUSE_PASSTHROUGH_V2    (1ULL << 45)
> +#define FUSE_URING_REDUCED_Q   (1ULL << 46)
>

For this new path (I think this should advertise dynamic queues, as
per my other comment), I think now we can have ADD_QUEUE reject any
qids that don't map to possible CPU ids, since nothing depends on that
yet and it'll let us drop the special casing for impossible CPUs :)

Thanks,
Joanne
