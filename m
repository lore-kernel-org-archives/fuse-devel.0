Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793080715;
	b=0henLhRylaImHUgDKjjknu/kM/IXwWjCYYvAqaYFijlX1m5rjmCI8hYgYV41FiDU140D
	 Ig6/kgbdItdePrkLFo/NLQZtfha0yW2yN/gJvcwfwsfjlZwT3oklYaj76fx5MTBrKgzU3
	 DB/hFmCpeFdG01LSWv8W5Isbp2L13KIo8MmzVObmcnWjHNkblYntHIZkYtv3xxvoBrqL7
	 IjfW+GyBfpqzXslgKPG0KElgYOwukHJZOY75gMs0mFQJj56CBm2LbAhYC/smpAYmaG/4D
	 rbe1S317j+RfrxkPOc0kbhuUPriTQhAptF71i03TynwP9dYh5hzRZUPGwsA0avXbmaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6f0mCYiqX8iRBOIQNo4U4TuBgZLY838Yk9HYS6PZ5Mk=;
	b=vKGLY8EuOfiWHqRqeqf5qmUNcVien91k9e5t/302Bkx6TPSQPFxLUzUJkNM7qHFty5nk
	 UbZc875/uwmekMkZaSDhUQ0Fs98ggBPbOCz5dbLglJK94pHZ3qJTN+wiL+CrGK1+qtCJs
	 /W8+MmcuXsFGrvuMMTLqvuHAwzhskEIwVIxAd+IFT3YPSk3ZjGtLYFvYwsrOmQR+xbcJa
	 FdpA5Z9zyNb91ftMqLrqcLzChQJierqcrvdwc62TdVUgpyTEERgkpjZjyHnfSlJJbn97A
	 cAM/jIAb27/pnEMsE8Pefoi6jejfPd0r360JhxE6DI/FErtyzXiIvmust1Lv3lZeuDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q0ODWE0k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FE9606A31A
	for <fuse-devel@lists.linux.dev>; Tue, 27 Oct 2026 05:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4FE9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q0ODWE0k
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b001cd92bso2075498f8f.2
        for <fuse-devel@lists.linux.dev>; Mon, 26 Oct 2026 22:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793080713; cv=none;
        d=google.com; s=arc-20260327;
        b=gBFeN+Nt9NFcYeNBSsZpN7aNXDVO21fw0m1oBVcmuruPSsYt7LfSzID/opG/8AX7+x
         jjuFplJtUgmtFvfI9/hU7L/c8Pf0EabsWzV2Mqz31Q6NVc8ss7ezAIUmpHLxbhSOC+F2
         kQswWlNqOIfEMI+0RJLb1/JzRP5aWqoa4idPuoknkJorC5kpmVa94FEu3i1PDOkwmwEe
         GXuOtvIp5LEeU1VGjuRbesCHtZ8z9A/jRR1iWxSRF3jhH7EtOOVAn17YXnQ11TVzZH4q
         mSNhNrSKLOI1ne4OdvLS3oTuiGj/XouUmaibTe7h2P6fzrAQBGfQDIF2vpCc8idI5EJe
         jtWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6f0mCYiqX8iRBOIQNo4U4TuBgZLY838Yk9HYS6PZ5Mk=;
        fh=aVt6oKoVB8hL3Dsief4MHSllKceuq5cOTL9+y6krpDQ=;
        b=e2k68OfAz2Pb75dscp4yXud3PBmu2TjPFNDX1boJ20JoUBc4O4vt8rKAQ0TupyZsGU
         V6xJuGn2XvlcoZqdV3gODKqoj1EEO0S4a8GunnI4fVXRwAP5uD0Arl1AzqqWDYSe4t5O
         R3fRChIcYkub4F9A3Y4zsBq7+oXVkBRXGPT4bbjvqmZIRc/jWF5g/XAwz5Tl4I1+YhlT
         22AUIuK6csulg4cum8P0EoXxkVVei6l0RwAHWFuf5x4rE6RXdC+ETtE9/ZEzDdJlx8Uo
         nXl2Upw6aNmbZOiYADKo9L/KdhMimTFhycNwlVgp/0IZjU9ecAD0PfMQgN+BKc/winIJ
         GxIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080713; x=1793685513; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6f0mCYiqX8iRBOIQNo4U4TuBgZLY838Yk9HYS6PZ5Mk=;
        b=Q0ODWE0k5y5PPoOsaXBzMvr3bEQCTb+h+XuzNdpdB2aOWo8tBRlxpM0CqLQ7+P5Kkm
         CS3cMzibT8HAKmMOdtbpxO+zj2xaFlwI1xtJ7QNYQloLRJR2GBdKQ1cogpcTiO7uVItN
         vgMzE030ulvvTLxxBhmyDCifgPEMvNPBwzb6P/tOIiCcW9w9boj85tumj6EneoVpyYKR
         tFXmZkX8HbHOto7OJ+NJXxUJxKM1kG8bUy+dCrZzVB+atlE9ELB09vdkEwwgeYj00IOy
         KhcyXzYgMBv+nwABVQedi6sd7d/jsiJauC7feoCDamMpkqTn3a7VZkjL11VsZ900s9r6
         ll2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080713; x=1793685513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6f0mCYiqX8iRBOIQNo4U4TuBgZLY838Yk9HYS6PZ5Mk=;
        b=ZTMQtcGaklQK8sZWdoDY4O2O8r36/ZRfpLCXNasbVNHDN/TFdYrkV7/7cKLtY41hL6
         JbqU2WPC4uKUxJ9b2JXLbaVAeoYYPK8xlpbAzu59YRh40PxlX2g3seRNSJBkP11y6wqa
         VtBJPlLIJLsG/NQi2WfuRnspz6EZWqifHbSXxdnu6rRWIo/F6leSH/LxpMUrErL/S3wa
         OT3UsZL5mRp8Ikiy1KCNNGxkHd3lHP63eOl6+PO0gYEVw2asxk0kcO+VBM9rAraP0LHD
         1DDMJ8+coXg7uTEdO2uYkw2ozTU7q9PJ48EVPlrIyEGBw2tFKnsMsy1EQo/USIG/Gai0
         xsdw==
X-Forwarded-Encrypted: i=1; AKwUvBxKSFeEnlsmBJwHVfhUhIl0vdGebkDuDtqDIAVqAeOovFQGAVjDE6iiLPNNJ1rRu8jpLwetMF0unYHw@lists.linux.dev
X-Gm-Message-State: AFq9FYLlUloTnKSk3Nxn9bHJttduHukdLBZkzevxO8tz4402T/nZV9Qh
	kzeyQpAoaejglzvvzKD9KBsLeyeR8Hmwi0gdMnUp/lhW3+1qK+lQxEoEYMAAXrAqqyFptBVtV6J
	n7nTGsTWsp1z3u2jNA3oM+T3iqoZ0dBv8X1QlC40=
X-Gm-Gg: AYBFou17x8iFBpOld2Kql1lEeqJ0Ov3E2wqbLJNczSFQMFSTl3+wBvcbGuliGNXGZDa
	Trf7klfhyoBuEeIiMCAZAgU1cARIF2kqjaAYtbEGCqLcgJpodLrDdf2RC5ia4SUzodNXnhcC4YZ
	rfXRs0Xr1yevX8xAC5GVrWMPRlwxgywCZ1qAJ/jJJDBosGPLYGyg/Uw0J0Ix7aF2bfE3Sb/TMpV
	/qPpstQugO6nhdS92wBejLAYd9eFaiuoK/sZaCZYWAa8S9ZGKVErtIBtXruCN/qTKup3gOOptun
	iYov5FNIEzJZAYREqsMH1x3T1uzAx9B/gNlaAkZqg8p1NNN4gXlY48/+RBMESe9j4XK8/Jy+fHu
	5hTgNea03xBD0PpEJr4Bkr5VwxyYtgPYnO1aUFfjlw5cy49I0GJ03y8i3IBNVSF03hXFkEs+T5L
	W/e3sWBYVkpkqIh9l0fw==
X-Received: by 2002:a5d:5e8d:0:b0:48d:ee35:b3fe with SMTP id
 ffacd0b85a97d-48e3eb3cbfamr14238944f8f.8.1793080713031; Mon, 26 Oct 2026
 22:58:33 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com> <20261025-reduced-nr-ring-queues_3-v8-3-8a2570e8d2a4@bsbernd.com>
In-Reply-To: <20261025-reduced-nr-ring-queues_3-v8-3-8a2570e8d2a4@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 26 Oct 2026 22:58:21 -0700
X-Gm-Features: AclHuK9gVr1brZ8Q6rAqg9gWrgsv3N8ocU_Av-D3yOg-jKV4aQdcW5JJV4UtQcY
Message-ID: <CAJnrk1bndy_31eJvGDg_84HxV4XDqcypbkVbkFGLL3=EJ-_6zw@mail.gmail.com>
Subject: Re: [PATCH v8 3/8] fuse: {io-uring} Add CPU to queue maps
To: bernd@bsbernd.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 3:29=E2=80=AFPM Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> From: Bernd Schubert <bernd@bsbernd.com>
>
> This is a preparation for a follow up commit that lets a server register
> fewer queues than CPUs. A request issued on a CPU without its own queue
> then needs another queue, preferably on the same NUMA node.
>
> fuse_uring_create() builds a global and a per NUMA node CPU to queue
> map. Every CPU maps to its own queue, and the maps do not change after
> fuse_uring_create(). The next commit selects queues through the maps.
>
> The possible CPUs can have gaps in their numbering. num_possible_cpus()
> sized the queue array, so a request from a CPU at or above that count
> went to queue 0 with a warning. The queue array and the maps now cover
> every CPU number below nr_cpu_ids.
>
> Userspace might not know that a CPU is not possible, or might not care,
> and register a qid for it. The maps put such a queue on node 0.

Where does this happen? The qid / queue can be registered but it
doesn't end up in the maps, no? AFAICT from this patch the map is
built from cpu_possible_mask before any queue gets registered. I'm not
seeing the logic that would place such a qid/queue in the maps. Maybe
just remove this paragraph? Or am I missing something in this patch?

>
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  fs/fuse/dev_uring.c   | 124 ++++++++++++++++++++++++++++++++++++++++++++=
++++--
>  fs/fuse/dev_uring_i.h |  17 +++++++
>  2 files changed, 138 insertions(+), 3 deletions(-)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index c9a78c2bee99..32c8e2db26b7 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -260,6 +260,25 @@ bool fuse_uring_request_expired(struct fuse_chan *fc=
h)
>         return false;
>  }
>
> +static void fuse_uring_free_q_map(struct fuse_queue_map *q_map)
> +{
> +       free_cpumask_var(q_map->registered_q_mask);
> +       kfree(q_map->cpu_to_qid);
> +}
> +
> +static void fuse_uring_free_q_maps(struct fuse_queue_maps *maps)
> +{
> +       int node;
> +
> +       if (!maps)
> +               return;
> +
> +       fuse_uring_free_q_map(&maps->global);
> +       for (node =3D 0; node < nr_node_ids; node++)
> +               fuse_uring_free_q_map(&maps->numa[node]);
> +       kfree(maps);
> +}
> +
>  void fuse_uring_destruct(struct fuse_chan *fch)
>  {
>         struct fuse_ring *ring =3D fch->ring;
> @@ -292,18 +311,109 @@ void fuse_uring_destruct(struct fuse_chan *fch)
>                 WRITE_ONCE(ring->queues[qid], NULL);
>         }
>
> +       fuse_uring_free_q_maps(ring->q_maps);
>         kfree(ring->queues);
>         kfree(ring);
>         fch->ring =3D NULL;
>  }
>
> +static int fuse_uring_alloc_q_map(struct fuse_queue_map *q_map)
> +{
> +       if (!zalloc_cpumask_var(&q_map->registered_q_mask, GFP_KERNEL_ACC=
OUNT))
> +               return -ENOMEM;
> +
> +       q_map->cpu_to_qid =3D kzalloc_objs(*q_map->cpu_to_qid, nr_cpu_ids=
,
> +                                        GFP_KERNEL_ACCOUNT);
> +       if (!q_map->cpu_to_qid)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +
> +static struct fuse_queue_maps *fuse_uring_alloc_q_maps(void)
> +{
> +       struct fuse_queue_maps *maps, *result =3D NULL;
> +       int node;
> +
> +       maps =3D kzalloc(struct_size(maps, numa, nr_node_ids),
> +                      GFP_KERNEL_ACCOUNT);

nit: maybe kzalloc_flex() here instead?

> +       if (!maps)
> +               goto out;
> +
> +       if (fuse_uring_alloc_q_map(&maps->global))
> +               goto out;
> +
> +       for (node =3D 0; node < nr_node_ids; node++) {
> +               if (fuse_uring_alloc_q_map(&maps->numa[node]))
> +                       goto out;

This is more of a deferrable follow-up optimization, but since every
CPU is only ever on one node, I don't think we need a
cpu_to_qid[nr_cpu_ids] for every node. The nodes could instead just
share one array indexed by CPU #, where each slot holds the qid picked
from that CPU's node.

> +       }
> +       result =3D maps;

What about just "return maps;" here instead?

> +       maps =3D NULL;
> +out:
> +       fuse_uring_free_q_maps(maps);
> +       return result;
> +}
> +
> +static int fuse_uring_cpu_to_node(int cpu)
> +{
> +       int node =3D 0;
> +
> +       /*
> +        * Userspace might not know that a CPU is not possible, or might =
not
> +        * care, and register a qid for it. cpu_to_node() is only defined=
 for
> +        * possible CPUs, so such a queue goes to node 0.
> +        */
> +       if (cpu_possible(cpu))
> +               node =3D cpu_to_node(cpu);
> +
> +       /* a possible CPU that is not present can have no node */
> +       if (node =3D=3D NUMA_NO_NODE)
> +               node =3D 0;
> +
> +       return node;
> +}
> +
> +static void fuse_uring_cpu_qid_mapping(struct fuse_queue_map *q_map, int=
 node)
> +{
> +       int cpu, qid_idx, mapping_count =3D 0;
> +
> +       q_map->nr_queues =3D cpumask_weight(q_map->registered_q_mask);
> +       if (!q_map->nr_queues)
> +               return;
> +
> +       for_each_possible_cpu(cpu) {
> +               if (node !=3D -1 && fuse_uring_cpu_to_node(cpu) !=3D node=
)

nit: NUMA_NO_NODE instead of -1?

> +                       continue;
> +
> +               qid_idx =3D mapping_count % q_map->nr_queues;
> +               q_map->cpu_to_qid[cpu] =3D cpumask_nth(qid_idx,
> +                                                    q_map->registered_q_=
mask);
> +               mapping_count++;
> +       }
> +}
> +
> +static void fuse_uring_build_q_maps(struct fuse_queue_maps *maps)
> +{
> +       int node, registered_qid;
> +
> +       for_each_cpu(registered_qid, maps->global.registered_q_mask) {
> +               node =3D fuse_uring_cpu_to_node(registered_qid);
> +               cpumask_set_cpu(registered_qid,
> +                               maps->numa[node].registered_q_mask);
> +       }
> +
> +       fuse_uring_cpu_qid_mapping(&maps->global, -1);

nit: NUMA_NO_NODE instead of -1?

> +       for (node =3D 0; node < nr_node_ids; node++)
> +               fuse_uring_cpu_qid_mapping(&maps->numa[node], node);
> +}
> +
>  /*
>   * Basic ring setup for this connection based on the provided configurat=
ion
>   */
>  static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
>  {
>         struct fuse_ring *ring;
> -       size_t nr_queues =3D num_possible_cpus();
> +       size_t nr_queues =3D nr_cpu_ids;

I think this will break backwards compatibility. is_ring_ready() logic
waits for every possible qid below ring->max_nr_queues, so if this is
now nr_cpu_ids, a server that registers qids 0..num_possible_cpus() -
1 (which works today) will never become ready if the cpu ids are
non-contiguous. Maybe best addressed by having the ready check just
count the number of queues with entries and checking that against
num_possible_cpus()? I think ideally we would reject any queue
registration that passes a qid that doesn't map to a possible cpu, but
I think it's too late to change/enforce this now.

Thanks,
Joanne
