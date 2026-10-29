Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793310260;
	b=N3MRQluieu34/Y4AWPz1XXELmbYlROsHCsNtWqsvU3WCw1YorbR6Qk9DQC7vLANmcgQy
	 Hay9ERZ8UQX4QU9VL6DbVBM51I68m0LeEwLtlI0g74/r8zIsJBGITFxJhDqemZLPTiIUR
	 nTTbsfzXn7BLVz6Rygn7lELi/CeG97N3Cx6tsGW4ybOLLg6BYvGc+OZ9Q1tF0hAVmTX1u
	 YfDjGAQtJUDWHGgBHbUCKCuHXP0hmUrop/k7jrHYzCChjLRaNyWnberslswe7oHa9ogdx
	 iWoPk61myOBujkVP0hFldKftS0bcoc7gFNDEdW+KaD3LT9TuUzNYMZwvl16DUbAC6Mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793310260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Uss5qjPUHshFF1/aliCs7dyFsC7OnCaWV21o5/Wt4sw=;
	b=LBTZmYv00V+8/6Qcnw/2GGwdj0ftBB1s1eA0WprJ3rrg0SHTPlhBs7YMOpheRWBzMpek
	 +Ye1gW0lBuzi5s+xJHMJcdKQf+M2txzgZES1bzIcSjbzpiyswS5EoPwHMU4U6ZIiuE60p
	 ocH4HraYJ24JHMilyUp72EdA3GIe3EeI9YWYRANozoRIm9APi3UIPY73lngoYEqWgSbl4
	 UglEMoS+HkVGlygnxdMZ45f9QVTur0i8/O7S+8r8NmvTuDSkHiXEIjyIR+SKGveVRHK2k
	 WQask0VFSQ2HpkOKM0wk5fyxAvoDn41zczG+CvtWxK2d/+sUwfVYC2RXd7rUEMQ37Lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cAsSiz8R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC86606A31A
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 21:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC86606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cAsSiz8R
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d1da913so57818f8f.1
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 14:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793310259; cv=none;
        d=google.com; s=arc-20260327;
        b=JSDjmcgmDU3E3eyWFkrIfQQKnDAyxMkhphKM4D6KzKRfKITK8A073eIHT+GAVcHdw/
         aZ7wwIS/XqijVpzDCOtOuAeYvtZmQYs4LgpVqEsCX3AM7z9uG/fDb7JZnViD3/nwr/ZR
         UFbRWNSlENN7p+eUpo9LimeL49WrMh1YD2caE7cptqEGIMH1scIh9KRAikkhd20GSn0O
         mNAnFMRcLx8JgpB6cAeodKal1mU5FhjcuvDKkexZTueV7llku80gB8bb6gJYN11SVHD3
         exJyuZqGqMOqfK6ijpeHOT9Vjxj2rARUa7hyl9i5Yndb8CAe6UpJpMD7pE6zXHgKCi0p
         ZBqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uss5qjPUHshFF1/aliCs7dyFsC7OnCaWV21o5/Wt4sw=;
        fh=7vxIoYwjXio+2SYkA4tGxnP10rRr8KoH4nuK+A45S8w=;
        b=Szxr9o9aUbP6f48lLXEdZLtxIDEh8lYq158wsV6zyPRz8mqlu338lLO9sNxz+SwNRG
         GFCj+kXrGKq33cSNieQZGmchYy7l83nmxax8u4uYJlrBtHmLnfRNUk4N7PcLsNY5jMKv
         pyKrKx2JOCBQv4k2SagcbVGwBcsspiExTD8GLadTtHBao+HqOUreB93k1tGPpMrqysI1
         rZ1zY9ggW2on69uTSDCDbUsZUclvWKFtnVxYMqPi/qRhWtyAyrrC+p8vgtZflLuiC82W
         /d5kS/ARGS4vlUWq+rjN5RgHdm1MEeGXPWOtKm57ywzPPcaphqfJ+WQIdPlGqbrCY1wD
         e3Wg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793310258; x=1793915058; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uss5qjPUHshFF1/aliCs7dyFsC7OnCaWV21o5/Wt4sw=;
        b=cAsSiz8REY1AfreAB9zrzhQ6d7of86w8rPBHMFsc7jzaC6yxUYdEGF2jsXIguheAQn
         dyK3K0j2+w7kd/QNQui7GG7Jh/mvfhlxt/DU+icAT2qZjzDwaf1TwWZxWeUMkmdOf0if
         84qc6fVuQRjMaSSvwGock7njEhzqAIsWkt+Mw9whk37rVcCin2d3qll1JmWobevcCP3Q
         1Y6o9dtdRuxzAKtLV6jUmdiwfmpXRISA/Z5GH/PTwCg8wLv5rYoqWbeggs6/cnIiUvIc
         u+iiymw8PptsZIhOEb5WxG6FjvVe0ti3q82as9aryAOftYfyEBMLxB1Q7FwVr8VLloqF
         I9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793310258; x=1793915058;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uss5qjPUHshFF1/aliCs7dyFsC7OnCaWV21o5/Wt4sw=;
        b=KP/YfwwS2U3yV1GkXDWwkB2mRJYcqDzvVi0q3KlJ+tfOHwMuh5u7ieb/wRaTpB4MEv
         ttN7sbG8pXf9WU1hQC4DmCGQwF1m+jSv/Svw/gMoG0aQeK+Q3IeXHhVVerYcwGF6fDHI
         b4xwD6Qm6GOmjM3vR6a3EsaRppsKvOthcEYQTbWpx7zczEe/kC9Sj0ui5UxOJv9e2C6A
         CflirOCDlgJhoxiBwBVIbN8gwZ4qv8fNONG5fakWxDB+zuysBGNIsuRlKq24ZyUBvg7j
         v486+blyYXBuedJS3K3Q1ic1xsq04Z/Cyl+uMc2BhivqtwtGObylL2yE5lmTrdpSqRhY
         mQyg==
X-Forwarded-Encrypted: i=1; AKwUvByI9gpd9vyURzZyw5POpN9+zDWXWwbcVXIyKAZt3VR5S7jcAcrGfcu4SGzbw8rA0pI/Zep46+011lTB@lists.linux.dev
X-Gm-Message-State: AFq9FYK36dtBUFGH8BRzp2QvzzUyJCO9OsWwI+FaILdsas9qPdIzub3h
	A47X9gMTVSdMV8HEM9Gd1iIF9KcLQhk39AuoXqyRLzMmGhEY5juZU+P0eNEI+r0DXRLHkyxa0at
	ugOsRoFwvqRi5VI6cmbpIICSy+SbrLsk0eUH0gpg=
X-Gm-Gg: AYBFou3JgkqcLZYGNQHqKSVzBTjv1kt9UtP21UbGFcIxnsp1emmGyeTgh06jIGjWsAv
	3Y+AevRUE2uJ2pdR+T1tZmsAGNIlv9I1u2qT8CZa/LKB7mK06+E4dVhQJnmFx8MfeLTT0btcpx6
	qGEAy29AZFZTx0doSLXzJUbjUIpYsKjPUmTfSV3xwWFfZSpiJl35RPs9x6vZKnco5/qCgnnYBPK
	ieid3Kxdu1wN3CFamjJfvVIIEBJXOtiXsKJe6zF9I3IzvmmdL2cpp6Ib0dD3auQ1oK8cXpIRXmQ
	MSoj1ncCqhclengTdjpQlejgWZfnjJfemkHheOF1CdWp1m3CDtMSrHDaYoThTjNb3JrNzs+jvEc
	a6Bds/YT9i7KB0cKn3+vfZMTtP/5c9BLcS7zdb5SQhjq2GDmIweEpg8QYAgT8AEPUkgJn8mLv+y
	SiyVWq1DFWcXdBQ1esq0335QRSPYp3FqGvUEpB5i0=
X-Received: by 2002:a05:6000:71a:b0:48c:6756:dab3 with SMTP id
 ffacd0b85a97d-48e6e27ec0amr1584593f8f.3.1793310258453; Thu, 29 Oct 2026
 14:44:18 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com> <20261025-reduced-nr-ring-queues_3-v8-7-8a2570e8d2a4@bsbernd.com>
In-Reply-To: <20261025-reduced-nr-ring-queues_3-v8-7-8a2570e8d2a4@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 29 Oct 2026 14:44:06 -0700
X-Gm-Features: AclHuK_WfHaGbEB64SD_DFag_WzH6l2qQZqBZE1srhHIw0Ppk_qM2H_ox65EjZo
Message-ID: <CAJnrk1ZLgRKNRyctcbRG0J3tdwf_P3HG_1Z+cB7w=2k4O_ENpw@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] fuse: Add retry attempts for numa local queues for
 load distribution
To: bernd@bsbernd.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 3:29=E2=80=AFPM Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> From: Bernd Schubert <bernd@bsbernd.com>
>
> This is to further improve performance.
>
> fio --directory=3D/tmp/dest --name=3Diops.\$jobnum --rw=3Drandread \
> --bs=3D4k --size=3D1G --numjobs=3D1 --iodepth=3D4 --time_based\
> --runtime=3D30s --group_reporting --ioengine=3Dio_uring\
> --direct=3D1
>
> unpatched
>    READ: bw=3D650MiB/s (682MB/s)
> patched:
>    READ: bw=3D995MiB/s (1043MB/s)
>
> with --iodepth=3D8
>
> unpatched
>    READ: bw=3D641MiB/s (672MB/s)
> patched
>    READ: bw=3D966MiB/s (1012MB/s)
>
> Reason is that with --iodepth=3Dx (x > 1) fio submits multiple async
> requests and a single queue might become CPU limited. I.e. spreading
> the load helps.

Thinking about this some more, I wonder if queue balancing (this patch
and the one before) should only be done for reduced queues or be on an
opt-in basis. For servers that pin each queue's thread to its cpu and
keep per-queue state, requests will no longer reliably arrive on the
submitting CPU's queue. I could also see a situation where a server
pins queues to give certain applications dedicated server threads, eg
CPUs 0-3 for app A, 4-7 for app B, so that each app's FUSE work runs
on its own cores and app's A I/O doesn't affect app B's latency. With
the balancing, a retry from CPU 3 would move A's work onto queue 4.
WDYT?

>
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  fs/fuse/dev_uring.c | 41 +++++++++++++++++++++++++++++++++++------
>  1 file changed, 35 insertions(+), 6 deletions(-)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index f22a1b5fc7fb..ca82965fdee1 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -24,6 +24,11 @@ MODULE_PARM_DESC(enable_uring,
>
>  #define FUSE_URING_ADD_QUEUE_FLAGS     (FUSE_URING_ZERO_COPY)
>
> +/* Number of requests in the queue until another queue is checked */
> +#define FUSE_URING_Q_THRESHOLD 2

I'm not sure what the best heuristic here is. For servers that handle
entries concurrently (eg several threads per queue or async i/o within
a thread), a queue at the threshold can still activelyservice requests
(eg if it has 8 ents registered to it and only 2 ents currently being
serviced in userspace on separate threads), so 2 might be too low for
those. I think your benchmark was on a server where one thread
processes entries one at a time? It seems good to me for now.

> +
> +#define FUSE_URING_Q_RETRIES 2 /* number of retries for a better queue *=
/

> +
>  bool fuse_uring_enabled(void)
>  {
>         return enable_uring;
> @@ -1964,10 +1969,11 @@ static struct fuse_ring_queue *fuse_uring_select_=
queue(struct fuse_ring *ring,
>  {
>         struct fuse_queue_maps *maps;
>         struct fuse_queue_map *q_map;
> -       struct fuse_ring_queue *queue =3D NULL;
> +       struct fuse_ring_queue *queue =3D NULL, *primary_queue =3D NULL;
>         unsigned int cpu =3D task_cpu(current);
>         unsigned int qid;
>         int node =3D fuse_uring_cpu_to_node(cpu);
> +       int retries =3D 0;
>
>         rcu_read_lock();
>         maps =3D rcu_dereference(ring->q_maps);
> @@ -1975,11 +1981,34 @@ static struct fuse_ring_queue *fuse_uring_select_=
queue(struct fuse_ring *ring,
>                 goto out;
>
>         q_map =3D &maps->numa[node];
> -       if (!q_map->nr_queues)
> -               q_map =3D &maps->global;
> -       qid =3D q_map->cpu_to_qid[cpu];
> -       if (qid =3D=3D cpu && background)
> -               qid =3D cpumask_next_wrap(qid, q_map->registered_q_mask);
> +       if (q_map->nr_queues) {

Feel free to defer this to a separate future patchset, but I think
this would ideally be done for the global map as well since CPUs on a
node without queues will take the global path and with reduced queues,
they're the ones sharing remote queues and would probably benefit the
most from spreading the load. I think pretty much all the code you
already have here could just be reused for the global maps.

Thanks,
Joanne
