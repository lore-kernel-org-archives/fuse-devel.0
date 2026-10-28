Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223537;
	b=Nmxeb372S3+3YcHBvbiPIDR23W5whZSFofTcnZkY2aX6XOdm8rYBNdko57JDH5/VrLU1
	 FZwDwYTsavaKoI61TqOKjVHlp0Z7HLgk9T83AMVFuQSFuLqbDY1hxeD3yDTpFcRke6k22
	 9TWbKuvwdgPar8jfLDbsD4IT+K0NLQHVc8WgPeZfB229UCXKnoFPkNw3JKz94OGyH2v8e
	 B0rhrhw6H3KWQp/vX0Zd7vMNgacKZqPxY/GhT4WvW0LTwVxc4dMMS74eswiaXufozugnd
	 7yWNV5hnp4Llpb2f/aX30m3DhNMC/3404QKvlU2VTwYfiMHBrVxl1r9LMV5XRdoY1+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223537;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZgETMoN5JShBuuv/Rswau5jZZMlfUeR18oUW83V35eI=;
	b=umVkY9PR5nNH5FDOckCEMG8Ghslc42j7UlZ2lWaKv+oKe6UfPNCMr2rtZdREPFfHJcBQ
	 B84g8iott1Z5X7jGQBvYDbb+5Barl8OsK/VBcvdEmHebL0ErDBT7Do4KG1KrL/F4vkn25
	 YPNlrgn61YIteVVKK63NVn3iSaqeUInhnQhOjoE2CEizHQVUB93otIFlQoMqbe6qFnKkq
	 73nV9z73IV3ilkcqLWCphIPcMTXn2GsDTlqDra+i0+QobFwHFyEhdu6YGd6pwnbNQaWhb
	 Ngz2dHGQHP81QlQckSPESzMe4yimBLYFn2c0zc1y18YTNRhHGOd4NNGfgLxChGqKxpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm1 header.b=eJWNChm7;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=e4I+yPUR;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87083606A31D
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 21:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87083606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm1 header.b=eJWNChm7;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=e4I+yPUR
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A800A1400169
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 17:38:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 28 Oct 2026 17:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793223535;
	 x=1793309935; bh=ZgETMoN5JShBuuv/Rswau5jZZMlfUeR18oUW83V35eI=; b=
	eJWNChm7WGCdYZ9aftqtOoWLTylFfqFawKqOsUYOHtCH/OHDaRgdVJgbUYdkEAs8
	CiJEpbr4/drPnKWIvxEsnjYPtCy9TVgDAx2k5QbpYgJsAWVSvsA91JufAkJAXJ4P
	8YYUay1tTPErpjLpA/wK72eku9seah+3b3MBbH4KmRtvw3ISDRO6+NlVQoka8j4B
	1K2rsknC/QqNXrP53Gn9sADGtzjB2hQXQe3ZEkwl6z+qA6E6PJZq8H1IWyzfUvzp
	mUN0YvcK/h/nyrKhawJ7/E+Bc4L+GjPAmupcUnIv4JLEM02fs34zwUlY4GaM6ejx
	1KK8m4qofhYYk08a6L7BsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793223535; x=
	1793309935; bh=ZgETMoN5JShBuuv/Rswau5jZZMlfUeR18oUW83V35eI=; b=e
	4I+yPURRK7IDr6BfDUNOVidkUWMHeHR6fAzMgcIQuKmuihlv3g3PnHu/RnkyF4HR
	XhbDuGjsell9jv4Hloc4+1+37I+Od8wDteCRwyrBCNqEGh7Lfl/srpl4cObSPB+E
	1f2QvVg7OUk2tgT6GDzt9FJhzlMNP4Jt9669dxdvgmr4EFEPN9OhO67DbtotwjTd
	VzgEAIMEgQt7mo9XOhRluTqgwqNankunaU4vEF7QwvbMuQJm2fQO4pVYBCD2hctu
	+LlgcCFmaiw32pg6h56sCDCgeJEuXfOE7h7ecVdW9pJY0K3COUeoXDI7gUJQCY68
	piCgnXgClKvTrLkA1sOLQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793223535; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm1:rsa-sha256:U+ilfUQ6wkyGltwqpbMskl4MiH/lx0VvHTAaTifahrKCPyt
	cBLH9cfwXHVM/2G6JKcQHmp+9OYJkK3exiGk4TcPuB23J72L6bynHi3myex6hRFn
	P7gqjyZ/MgH/pwF9Q6aackz5xKyIT6/BHsE7Hh63jnf/Hnhz+mFpc2DYqplp5FPT
	aySp+fGYUopTQruFvSznFHChmerQK7b67CSr4kezQHBjriWuNi3BeelG+wIyF6yA
	pMeHbM48Es0Q9Wl49hLsppjGSGHBIcv85nbcfDO7QfszsLbVxOn+drUfuoRDFZYm
	bUzl5ke4fzR0uM0JfW/t2lfztZKyHCMWelf3s3w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:lSJ+7+LS+ue0eekT2VGBfAbi9CMJkWdX2u9zc/MuDPo=:bnPxSkLg3hEvz3DuO94T+ryWM4BTf10xzcJRhcrGUXs=;
X-ME-Sender: <xms:b2viaqonorbS64vgCTwuu3rtjZ_rUajYIxSwrS_ySvQKJ4zNM7mshw>
    <xme:b2viagGXNyFMA5KGjYaBbqyeVVmXUCoqAjro_JeS_E5zvLLc9bTowoIDLIxmMre0D
    R0AVbe1PwZ8Xgs84kfEEAgSY9tQ0nTjDVJDiM8nnNI26Z2_tfuwqw>
X-ME-Received: <xmr:b2viask5wF25ZMaTQBC5Pw52heZpbacuN6CzT8LWwED7IQYNjOfHEbQxC7LXGTsRUEs9roJWKB04mFKE4jYnXfLm67vuZohDS6iaY1OsrR4Oj1-RMg>
X-ME-Proxy-Cause: dmFkZTGsYQ3Fy6gXI0a0NgFuYIBzY1VRz83MBsBDdYF5vnnu1+x5kU/6smra+MvPYn2h2L
    ORjLZlyjQyCcbRdltIdd+sDojotINfkii2Nu55vEqjUNTpawiDzNRavKx8LTmijPzxuEV0
    w1lFznww8AFCBD+BZAf8Ty8afjfRIAxacZIJRHf2NNgEv494GyDmGVqNu8qP2BCkPWL63M
    b77IFD8a4U9D/GhJ4uP0DVF2SObd1S3u68fMoJaVtLDDt4FrN+EmwAQsLYCgw7RAd8rCii
    NUYOh4cvif7jVMEkwJoIsmlTlnnP72f7Yb43wYEPxBY/xDicr6AJppPc5aDjmeUpNRQ1Wz
    0ciRTUFPKR301zO/933a/VOW/Cpk2ST7ITN2AiSW3frfR+0WBt7w8JMQcWebUtO56IkhwP
    X3cwlrXrpzQaT4lXoAo2J+rcG8pqgJGwRDgIATLE/AFmggLCyFdWAV77Z2jwrcXRaxqcFb
    u2syNp7wDOtuENVO0L1sSzPDz30vNN4yv5TX4FsdEQ8LL/oK93vBoorR9wtXk9FA+dWBY0
    uooBxcHq3unbFJd5F+YQAPA+On9pQRmTzTXbKq1zue1n38TMpP2/9nZZZBlsWaAPsqoV8E
    hQ1Uhh3xb/Xs8SKzW9YWbTDESbcl+EVBiN5Bd1/o5DhcXWIRE+DRCVyU5QAw
X-ME-Proxy: <xmx:b2viajm02Rq0TxtqM2_kFNbgIX-NpSkmsZRha8uoLFmEiBQ2cSDdSg>
    <xmx:b2viatttigNWSK7-rN1Os3xHrnG5Oy8BvFzZO3erwJKZEQp09pWFVQ>
    <xmx:b2viamkJGRsl9lFjAWWA_3pgMLGkhIeM_A12K0Fh151vSox539T1FA>
    <xmx:b2viaothvDABpKo8FPvQmn496NIeIJqAYOUKlhMm8R1YFEEPNweXTQ>
    <xmx:b2viarXyjFBEXpN6OEz4xFDk3CAdYqZIhKaSoRqBx0yyNrArA7i-_c5w>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Oct 2026 17:38:54 -0400 (EDT)
Message-ID: <f1342ec5-014f-4125-a35c-15df91da04d5@bsbernd.com>
Date: Wed, 28 Oct 2026 22:38:52 +0100
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] fuse: {io-uring} Allow reduced queues through INIT
 negotiation
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
 <20261025-reduced-nr-ring-queues_3-v8-5-8a2570e8d2a4@bsbernd.com>
 <CAJnrk1b7B+FLrazs5eEAr3dEU4a+EueeQog6eGAVraEx-OhYgA@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1b7B+FLrazs5eEAr3dEU4a+EueeQog6eGAVraEx-OhYgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/28/26 22:06, Joanne Koong wrote:
> On Sun, Oct 25, 2026 at 3:29 PM Bernd Schubert via B4 Relay
> <devnull+bernd.bsbernd.com@kernel.org> wrote:
>>
>> From: Bernd Schubert <bernd@bsbernd.com>
>>
>> Main reson to reduce queues is that a system with many cores
>> might run out of memory if queue-per-cpu is used.
>>
>> A new INIT reply flag FUSE_URING_REDUCED_Q is introduced, that
>> activates this feature and also expects that each queue is created
>> with FUSE_IO_URING_CMD_ADD_QUEUE. Without the flag, nothing changes.
>>
>> ADD_QUEUE adds the queue to the CPU to queue maps. A request mapped to
>> the new queue is delayed until the server registers the first entry
>> of that queue, usually shortly after ADD_QUEUE.
>>
>> Race free protection with spin-lock and rcu:
>>
>> - fch->lock protects against multiple ADD_QUEUE calls at the same time,
>> so that new q-maps per q-create are serialized in publishing. It also
>> ensures ring->ready is not set before a q-map is published.
>> - queue is stored before map publishing, so that a sender always finds
>> ring->queues[qid] set for a qid in the maps.
>> - rcu_assign_pointer() ensures a sender sees the new pointer after
>>   cpu_to_qid[] is filled.
>> - rcu_read_lock() ensures that old maps (in the sense of new queues)
>>   are not freed while the map is still used
>>
>> It also includes slight refactoring in fuse_uring_create_queue to
>> avoid freeing in the middle. Also dropped is "kfree(queue->bufpool)"
>> in that function, it is always NULL.
>>
>> Assisted-by: Claude Opus 5.5
>> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
>> ---
>>  fs/fuse/dev.c             |   2 +-
>>  fs/fuse/dev.h             |   1 +
>>  fs/fuse/dev_uring.c       | 127 ++++++++++++++++++++++++++++++++++++----------
>>  fs/fuse/dev_uring_i.h     |  13 +++--
>>  fs/fuse/inode.c           |   9 +++-
>>  include/uapi/linux/fuse.h |   4 ++
>>  6 files changed, 122 insertions(+), 34 deletions(-)
>>
>> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
>> index d243e124cb4c..cff8a06e6d68 100644
>> --- a/fs/fuse/dev_uring.c
>> +++ b/fs/fuse/dev_uring.c
>>
>> +/* Returns the replaced maps, to be freed after an RCU grace period */
>> +static struct fuse_queue_maps *
>> +fuse_uring_replace_q_maps(struct fuse_ring *ring, struct fuse_queue_maps *maps,
>> +                         int qid)
>> +{
>> +       struct fuse_queue_maps *old;
>> +
>> +       old = rcu_dereference_protected(ring->q_maps,
>> +                                       lockdep_is_held(&ring->chan->lock));
>> +       if (old)
>> +               cpumask_copy(maps->global.registered_q_mask,
>> +                            old->global.registered_q_mask);
>> +       cpumask_set_cpu(qid, maps->global.registered_q_mask);
>> +       fuse_uring_build_q_maps(maps);
>> +       rcu_assign_pointer(ring->q_maps, maps);
>> +
>> +       return old;
>> +}
>> +
>>  /*
>>   * Basic ring setup for this connection based on the provided configuration
>>   */
>> -static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
>> +static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch, bool reduced_q)
>>  {
>>         struct fuse_ring *ring;
>> +       struct fuse_queue_maps *maps = NULL;
>>         size_t nr_queues = nr_cpu_ids;
>>         size_t max_payload_size;
>>
>> @@ -426,12 +454,15 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
>>                 goto out_err;
>>         ring->max_nr_queues = nr_queues;
>>
>> -       /* Legacy behavior by default, one queue per cpu */
>> -       ring->q_maps = fuse_uring_alloc_q_maps();
>> -       if (!ring->q_maps)
>> -               goto out_err;
>> -       cpumask_copy(ring->q_maps->global.registered_q_mask, cpu_possible_mask);
>> -       fuse_uring_build_q_maps(ring->q_maps);
>> +       /* With reduced_q, FUSE_IO_URING_CMD_ADD_QUEUE builds the maps */
>> +       if (!reduced_q) {
>> +               /* Legacy behavior, one queue per cpu */
>> +               maps = fuse_uring_alloc_q_maps();
>> +               if (!maps)
>> +                       goto out_err;
>> +               cpumask_copy(maps->global.registered_q_mask, cpu_possible_mask);
>> +               fuse_uring_build_q_maps(maps);
>> +       }
>>
>>         max_payload_size = max(FUSE_MIN_READ_BUFFER, fch->max_write);
>>         max_payload_size = max(max_payload_size, fch->max_pages * PAGE_SIZE);
>> @@ -446,21 +477,23 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
>>
>>         ring->chan = fch;
>>         ring->max_payload_sz = max_payload_size;
>> +       ring->reduced_q = reduced_q;
>> +       RCU_INIT_POINTER(ring->q_maps, maps);
>>         smp_store_release(&fch->ring, ring);
>>
>>         spin_unlock(&fch->lock);
>>         return ring;
>>
>>  out_err:
>> -       fuse_uring_free_q_maps(ring->q_maps);
>> +       fuse_uring_free_q_maps(maps);
>>         kfree(ring->queues);
>>         kfree(ring);
>>         return NULL;
>>  }
>>
>>
>> @@ -469,16 +502,24 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
>>                                                        bool fail_if_exists)
>>  {
>>         struct fuse_chan *fch = ring->chan;
>> -       struct fuse_ring_queue *queue;
>> +       struct fuse_queue_maps *new_maps = NULL, *old_maps = NULL;
>> +       struct fuse_ring_queue *queue, *result = ERR_PTR(-ENOMEM);
>>         struct list_head *pq;
>>
>>         queue = kzalloc_obj(*queue, GFP_KERNEL_ACCOUNT);
>>         if (!queue)
>>                 return ERR_PTR(-ENOMEM);
>>         pq = fuse_pqueue_alloc();
>> -       if (!pq) {
>> -               kfree(queue);
>> -               return ERR_PTR(-ENOMEM);
>> +       if (!pq)
>> +               goto out_free;
>> +       if (ring->reduced_q) {
>> +               /*
>> +                * Every queue addition creates a new map to make reading the
>> +                * old map race free
>> +                */
>> +               new_maps = fuse_uring_alloc_q_maps();
>> +               if (!new_maps)
>> +                       goto out_free;
>>         }
>>
>>         queue->qid = qid;
>> @@ -499,11 +540,16 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
>>
>>         spin_lock(&fch->lock);
>>         if (ring->queues[qid]) {
>> -               spin_unlock(&fch->lock);
>> -               kfree(queue->fpq.processing);
>> -               kfree(queue->bufpool);
>> -               kfree(queue);
>> -               return fail_if_exists ? ERR_PTR(-EEXIST) : ring->queues[qid];
>> +               result = fail_if_exists ? ERR_PTR(-EEXIST) : ring->queues[qid];
>> +               goto out_unlock;
>> +       }
>> +       /*
>> +        * Reduced queues can be added after ring->ready. Connection abort
>> +        * stops only queues it finds, so a queue is added only while connected.
>> +        */
>> +       if (ring->reduced_q && !fch->connected) {
>> +               result = ERR_PTR(-ENOTCONN);
>> +               goto out_unlock;
>>         }
>>
>>         /*
>> @@ -512,9 +558,24 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
>>          * fully initialized queue after &ring->queues[qid] is set
>>          */
>>         smp_store_release(&ring->queues[qid], queue);
>> +
>> +       /* Update maps so that requests can be scheduled via the new queue */
>> +       if (new_maps)
>> +               old_maps = fuse_uring_replace_q_maps(ring, new_maps, qid);
>>         spin_unlock(&fch->lock);
>>
>> +       if (old_maps)
>> +               call_rcu(&old_maps->rcu, fuse_uring_free_q_maps_rcu);
>> +
>>         return queue;
> 
> Could we consolidate the mapping logic for the legacy vs dynamic paths
> into one general flow? I'm finding it a bit confusing to follow
> otherwise with too many pieces. Right now, from what I see, the flow
> between the two is this:
> 
> Legacy:
> - Map gets created in fuse_uring_create() at FUSE_INIT time
> - Map is built from cpu_possible_mask
> - Map is set before the ring is published (smp_store_release() of fch->ring)
> 
> Dynamic queue:
> - Map gets created in fuse_uring_create_queue() at ADD_QUEUE time
> - Map is built from global.registered_q_mask (qids added so far, but
> none of them may have had an entry registeredd yet)
> - Map is published through RCU swap
> 
> 
> What about this one consolidated flow?:
> - Map gets updated on the first REGISTER for a queue (allocated in
> fuse_uring_register() before the entry is created,then built and
> published in fuse_uring_do_register())
> - Map is built from global.registered_q_mask (qids registered so far)
> - Map is published through RCU swap
> 
> A queue can only start actually servicing requests once >= 1 entry has
> been registered, so imo it makes sense for the queue to be set in the
> mapping only once an entry in it has been registered. This also fixes
> the issue where if there ends up being some failure between when a
> queue has finished being added but before any entry for it has been
> registered, no requests mapped to that queue get lost (otherwise they
> will sit forever in fuse_req_queue). For the legacy path, the map
> could just be published once in this consolidated flow when the last
> queue gets its first entry, since nothing routes through the maps
> until the ring is ready.
> 
> WDYT?

Why do we need ADD_QUEUE for this feature then? Didn't you especially
ask to use ADD_QUEUE for dynamic queues? I was basically holding back
any updates on this series until ADD_QUEUE was implemented in kernel and
libfuse and now we go the other way around. Without the request to do it
through ADD_QUEUE this series would have been ready a few months back...

Personally I see that the current way makes registering new queues
rather expensive from fuse-server, because we first add a queue and then
need to wait for the entry, which

a) either adds delays in request handling
b) or make libfuse complex, because it needs to link SQEs



> 
>> +
>> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
>> index 616430a2973c..d8cb1764e2ca 100644
>> --- a/include/uapi/linux/fuse.h
>> +++ b/include/uapi/linux/fuse.h
>> @@ -257,6 +257,7 @@
>>   *  - add backing_id_64 to fuse_open_out
>>   *  - add FUSE_NOTIFY_BACKING_MAP, fuse_notify_backing_map_out, fuse_extent
>>   *  - add FUSE_BACKING_MAP_CREATE, FUSE_BACKING_MAP_CYCLIC
>> + *  - add FUSE_URING_REDUCED_Q
> 
> Does this need to be a new minor version bump?
> 
>>   */
>>
>>  #ifndef _LINUX_FUSE_H
>> @@ -480,6 +481,8 @@ struct fuse_file_lock {
>>   *             privilege that mounting virtiofs or fuseblk requires).
>>   *             Insufficiently privileged servers ignore it.
>>   * FUSE_PASSTHROUGH_V2: use 64 bit server allocated backing ID
>> + * FUSE_URING_REDUCED_Q: INIT reply opt-in to 1..nr-cpus queues, each created
>> + *             with FUSE_IO_URING_CMD_ADD_QUEUE; serving starts at the first entry.
>>   */
>>  #define FUSE_ASYNC_READ                (1 << 0)
>>  #define FUSE_POSIX_LOCKS       (1 << 1)
>> @@ -530,6 +533,7 @@ struct fuse_file_lock {
>>  #define FUSE_HAS_IO_URING_BUFPOOL (1ULL << 43)
>>  #define FUSE_HAS_SYNCFS                (1ULL << 44)
>>  #define FUSE_PASSTHROUGH_V2    (1ULL << 45)
>> +#define FUSE_URING_REDUCED_Q   (1ULL << 46)
>>
> 
> For this new path (I think this should advertise dynamic queues, as
> per my other comment), I think now we can have ADD_QUEUE reject any
> qids that don't map to possible CPU ids, since nothing depends on that
> yet and it'll let us drop the special casing for impossible CPUs :)

Yeah, I was thinking about this as well. Though we need to handle both
cases for older libfuse - there will be special cases one way or the other.


Thanks,
Bernd
