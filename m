Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793147033;
	b=zbfgbdMX2I4emywqFMHqeXNWe1AJXpIFMt+NgjAUT540Mzu0CTlDMHHW8e6SJyIpqSYh
	 P9tS8naKQWA3uxbCNWRu+J1jMi0dERJMtMwMgXA5VSVvYxqKFtPgXRH5FjGXG18HR8jyb
	 WDNHC9njq5mulFad/0IMQpIuRLGa7+gbaj9ka7dnfFSlE/sVzIRitWpIDTztfHpqIyOfH
	 6v3hHYt4VqGDZF28ZzHgYGsqxjZYg9spZj1WzoRcgwXa12Ol1ViWfVyZc0ydwIqjvTD2a
	 vFb4DBH2OLTcoYg2o3OFfQ5kAGpiKwDcNYoFC2JWtLENZT3oKyWSeNdXQ+uS8um53jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793147033;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DIl8SmJv//wOK5AiPhoMDO1eUErgFDLyP1rfgdQqcWI=;
	b=DT+Ap99xZk2MM760pBngeUG2/Tv3doe/wcWvuobDKad5+iHpp4SS/HNFcDHjys4MrsKO
	 UGazgBaVXZ3cWYHd5fx7VMFayN2S/8otzt1bmtwfXkjIqXxFXn0RGfupegxTeELPOs4ol
	 0WEmOeoBLLeLnOsMwG54+QrTuQQGnmbHD5GFjSVDsrIxMiGDNS3d7YRf6QHOpQ6fgfUkW
	 OTOWWJ9568rq5HahJ/oMXi9cI0hzQq2YSeLEkgnnvyQrKWJ+Gb418/ufeyH1VKtLM4plS
	 jAcobzTePWkiXrgu+wUB8PuuUTDjVDvJhUq2/SbwknBibcTnHHB0ILJlZzE20M4iwbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm1 header.b=NasvZ5OR;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=TTEtPpTE;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6EF606A31A
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 00:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF6EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm1 header.b=NasvZ5OR;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=TTEtPpTE
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F28601400107
	for <fuse-devel@lists.linux.dev>; Tue, 27 Oct 2026 20:23:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 27 Oct 2026 20:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793147031;
	 x=1793233431; bh=DIl8SmJv//wOK5AiPhoMDO1eUErgFDLyP1rfgdQqcWI=; b=
	NasvZ5ORFUUzn8oLq44PwkCHv5TdefrqEU9gf1g+enMFLuY44x/ayX4ba1MXIMB3
	x8zG7Rl09MVvUfU7xMaLjvIHut9hkN5F2txkf0V92HE7N2vID99Liw3L1H7XxyoA
	5znhmbOn7O+wbuo0AyLW+QyUuI8P35FllBc3R+cbQjQZJc2Ar1rwkD47GHPH1HnT
	RU1QHpvTh4rzmwr8cPliRTRtdUqSGJ9UiIWbic2jbEu1R3pNytz98SIfOGdxr+dh
	9IZ3QZK32mhvOUVyhH+Jz2mCS3dU19A1D+TpLZneTw/2O73K+zUtRX0b5N3c1oXE
	TWUkwKZFPbIszeW3ax9+Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793147031; x=
	1793233431; bh=DIl8SmJv//wOK5AiPhoMDO1eUErgFDLyP1rfgdQqcWI=; b=T
	TEtPpTEofogUIGLMrVCgUMRSmL+GaosIhUm1dV1ACGXk2cHlxRe0PoRKQt0Kysjz
	qBMkFGvrvEemsISVsC7TtCx63jFUFmBAoFdWwfSaZ8ngw7LflblAvnbg/CInKGAA
	l02+DP/piB9G8Voz4JhcVhTL7rCuP886Pg9BH2GMJOccC/zPvczbM3+w1LATu2ry
	rZIJQ47l8Z3lWR91kIVy1FWs7Unqobx1vXRpcWamRhgoQiIPSak/BoS21W+J4iUu
	0aesmS74nIZKCqdURGUCeP0EdpQnTh3umIwZbLwZKrQaIBp1X/8dPHTwas1UW7uQ
	bRHNeaJV8LC3+WYkTXE1A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793147031; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm1:rsa-sha256:ngi1EkZa+XIE5Tqm8+SaIpKtbPqBFevj0PgEvkGjh+TGxOO
	T71gG8zx0YyAiz83VBrm/GaLRwQoNgFid/+fe7Sa0y+NyMDUO+l1OHs6CRd8/SIb
	vDjj8Yu4kyeddL/ZL6sh5ikiEbT2+yCvseisZeOFm2p0pk/KmLpETo9VnCRptuaA
	D+wZlRUMdJW2aE+B8dOHS2IwXeDBClbQLCecnQjNFuthVNqJsETxUGtZRYNHC/HL
	ceaJcklgpx9b7dat7LnpT+6FIXkm19TAIPqtg2aKz7CDpzkKBVDjp+PMqedEpQNS
	B64KehMMtu1u2gKUGsYK8Ctbgs03ksUKe3ZwdSA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:veXLoSzj85TXYPUkySTEnF2GMf0wnm1vRL4N5ML35pU=:eRl8FdmkC3wAOyM4cLXObOt2IT9t1180aYm9nrstEQE=;
X-ME-Sender: <xms:l0Dhapj2tahey8i6clCqRYdCQtK1FMK1bJSoBO3hUYoCN4KDW2JWDw>
    <xme:l0DhaleG-CZJYFx89xt914WRdWFFIzpTDpq2dUAR8bJ-BbP3ueHx9l0PcJNSzWOql
    vmfOoKlFmJlpHNvByPAJiuYxjL_g_6e4UxZg9RcfYFgNa1gGCI>
X-ME-Received: <xmr:l0DhamdlNV8rTUiaQ_bQuEt6n6MHFHZV1pXqK-CzJ_80WE3PGT7Sz7F0Fxxc5QDsYK8Wv9fNCin0Ik-ERjuci1jFRaT2qL1DwIXOxNlYDzX_Nwehtg>
X-ME-Proxy-Cause: dmFkZTFYFCdmNch7opP3t2JlMGgMnQ86EDRz1DX5kHwCUofaJiX1K0J+rbVe6YAOEc/qL7
    shJckLvHfOB27+nFmIph0GDTumuOi0/KRILz2miTi6cGFUd8oaAS8ndO6xJkI2rb/awXM0
    l4U3sIBCSnveTUIVDq0e/V/eiMKCY0F1vtdleZb+5SmCccx0xn4GixCArsGXqQ9E8yyH0N
    jF7lXtrRKswWBSBmex7Qfw+fSUVcyr0fQpq8YaRi5WIY4os7D0S7qohgBwGH4YKYgyilQ/
    1F+YHHwdy53BcRurzHRT0mYx74yZsbpuvUIOv++YpeqCMEHnUl6wa0EBt9X9xUVEuip8II
    zXrl3MdUFLjAPlBg9AGE4Z4Qaks9oa8Uh3i+015QsJzpQynqxQH6H0c9nYnBDlSzLE7wYo
    s6zk93F0/S/b3lKAy03FahJBNG/JlyBZaL9xUDNuS9EhAcU6s7k8c6AaH45PpZyhWxyPU0
    YPX5CxfLQwpGQu3ad/2YwEPhXZOA6sPLd3zbjVx1bRbzS3MW9j0+YRcVSpFVZfxub4RaQv
    ME+u9iNsBNDNfaKDx2q7Nyfc0BkYNE3M4kzsUHUxEWCfy2vXmJt4WHx5fpl+23OVb+A8jx
    v0Wfak2Xymn+CWpTfIoh/IYQJ++j5I27Ttqs6e2r1LrD9Z3fcuFdB3B6OQQg
X-ME-Proxy: <xmx:l0Dhan86lTiDo9X8HDjImzIgftgjeQz6s2uRNIdbY6BRqNxjeALNyg>
    <xmx:l0Dhaql9jaOLB7OCtJbY0Qi5XuRTLcFaGXJEkZk5AHQvS1WTC88nig>
    <xmx:l0Dhah_YgTJn7gZw3XHMiTldZSw79oxvfjxNmUA1wu3a6QEst8HCNA>
    <xmx:l0Dhagnp27WCHRNFGKBRNB2krq-Jg-7RCr2zPj8OIwaT9J5VcWvN7A>
    <xmx:l0Dhaktx40iji2o31DN3QxbcHHpF-2GFcQ5D5L6dD4DK1bgB6m7cV8uh>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Oct 2026 20:23:50 -0400 (EDT)
Message-ID: <29b936b3-759f-48f4-9605-974a7cde9b37@bsbernd.com>
Date: Wed, 28 Oct 2026 01:23:48 +0100
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
Subject: Re: [PATCH v8 3/8] fuse: {io-uring} Add CPU to queue maps
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
 <20261025-reduced-nr-ring-queues_3-v8-3-8a2570e8d2a4@bsbernd.com>
 <CAJnrk1bndy_31eJvGDg_84HxV4XDqcypbkVbkFGLL3=EJ-_6zw@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1bndy_31eJvGDg_84HxV4XDqcypbkVbkFGLL3=EJ-_6zw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/27/26 06:58, Joanne Koong wrote:
> On Sun, Oct 25, 2026 at 3:29 PM Bernd Schubert via B4 Relay
> <devnull+bernd.bsbernd.com@kernel.org> wrote:
>>
>> From: Bernd Schubert <bernd@bsbernd.com>
>>
>> This is a preparation for a follow up commit that lets a server register
>> fewer queues than CPUs. A request issued on a CPU without its own queue
>> then needs another queue, preferably on the same NUMA node.
>>
>> fuse_uring_create() builds a global and a per NUMA node CPU to queue
>> map. Every CPU maps to its own queue, and the maps do not change after
>> fuse_uring_create(). The next commit selects queues through the maps.
>>
>> The possible CPUs can have gaps in their numbering. num_possible_cpus()
>> sized the queue array, so a request from a CPU at or above that count
>> went to queue 0 with a warning. The queue array and the maps now cover
>> every CPU number below nr_cpu_ids.
>>
>> Userspace might not know that a CPU is not possible, or might not care,
>> and register a qid for it. The maps put such a queue on node 0.
> 
> Where does this happen? The qid / queue can be registered but it
> doesn't end up in the maps, no? AFAICT from this patch the map is
> built from cpu_possible_mask before any queue gets registered. I'm not
> seeing the logic that would place such a qid/queue in the maps. Maybe
> just remove this paragraph? Or am I missing something in this patch?

This tries to address a Sashiko report in v6, Sashiko pointed out that
there is no guarantee that CPUs are consecutively set in the global cpu
map.

Thanks for review, I have a new branch that should address your comments
(reduced-nr-ring-queues_v9-linux-7.4), it will go out tomorrow.

> 
>>
>> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
>> ---
>>  fs/fuse/dev_uring.c   | 124 ++++++++++++++++++++++++++++++++++++++++++++++++--
>>  fs/fuse/dev_uring_i.h |  17 +++++++
>>  2 files changed, 138 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
>> index c9a78c2bee99..32c8e2db26b7 100644
>> --- a/fs/fuse/dev_uring.c
>> +++ b/fs/fuse/dev_uring.c
>> @@ -260,6 +260,25 @@ bool fuse_uring_request_expired(struct fuse_chan *fch)
>>         return false;
>>  }
>>
>> +static void fuse_uring_free_q_map(struct fuse_queue_map *q_map)
>> +{
>> +       free_cpumask_var(q_map->registered_q_mask);
>> +       kfree(q_map->cpu_to_qid);
>> +}
>> +
>> +static void fuse_uring_free_q_maps(struct fuse_queue_maps *maps)
>> +{
>> +       int node;
>> +
>> +       if (!maps)
>> +               return;
>> +
>> +       fuse_uring_free_q_map(&maps->global);
>> +       for (node = 0; node < nr_node_ids; node++)
>> +               fuse_uring_free_q_map(&maps->numa[node]);
>> +       kfree(maps);
>> +}
>> +
>>  void fuse_uring_destruct(struct fuse_chan *fch)
>>  {
>>         struct fuse_ring *ring = fch->ring;
>> @@ -292,18 +311,109 @@ void fuse_uring_destruct(struct fuse_chan *fch)
>>                 WRITE_ONCE(ring->queues[qid], NULL);
>>         }
>>
>> +       fuse_uring_free_q_maps(ring->q_maps);
>>         kfree(ring->queues);
>>         kfree(ring);
>>         fch->ring = NULL;
>>  }
>>
>> +static int fuse_uring_alloc_q_map(struct fuse_queue_map *q_map)
>> +{
>> +       if (!zalloc_cpumask_var(&q_map->registered_q_mask, GFP_KERNEL_ACCOUNT))
>> +               return -ENOMEM;
>> +
>> +       q_map->cpu_to_qid = kzalloc_objs(*q_map->cpu_to_qid, nr_cpu_ids,
>> +                                        GFP_KERNEL_ACCOUNT);
>> +       if (!q_map->cpu_to_qid)
>> +               return -ENOMEM;
>> +
>> +       return 0;
>> +}
>> +
>> +static struct fuse_queue_maps *fuse_uring_alloc_q_maps(void)
>> +{
>> +       struct fuse_queue_maps *maps, *result = NULL;
>> +       int node;
>> +
>> +       maps = kzalloc(struct_size(maps, numa, nr_node_ids),
>> +                      GFP_KERNEL_ACCOUNT);
> 
> nit: maybe kzalloc_flex() here instead?
> 
>> +       if (!maps)
>> +               goto out;
>> +
>> +       if (fuse_uring_alloc_q_map(&maps->global))
>> +               goto out;
>> +
>> +       for (node = 0; node < nr_node_ids; node++) {
>> +               if (fuse_uring_alloc_q_map(&maps->numa[node]))
>> +                       goto out;
> 
> This is more of a deferrable follow-up optimization, but since every
> CPU is only ever on one node, I don't think we need a
> cpu_to_qid[nr_cpu_ids] for every node. The nodes could instead just
> share one array indexed by CPU #, where each slot holds the qid picked
> from that CPU's node.

Good idea, that might better fit into CPU caches. I added it as another
commit at the end of the series. It is rather small, actually.

> 
>> +       }
>> +       result = maps;
> 
> What about just "return maps;" here instead?
> 
>> +       maps = NULL;
>> +out:
>> +       fuse_uring_free_q_maps(maps);
>> +       return result;
>> +}
>> +
>> +static int fuse_uring_cpu_to_node(int cpu)
>> +{
>> +       int node = 0;
>> +
>> +       /*
>> +        * Userspace might not know that a CPU is not possible, or might not
>> +        * care, and register a qid for it. cpu_to_node() is only defined for
>> +        * possible CPUs, so such a queue goes to node 0.
>> +        */
>> +       if (cpu_possible(cpu))
>> +               node = cpu_to_node(cpu);
>> +
>> +       /* a possible CPU that is not present can have no node */
>> +       if (node == NUMA_NO_NODE)
>> +               node = 0;
>> +
>> +       return node;
>> +}
>> +
>> +static void fuse_uring_cpu_qid_mapping(struct fuse_queue_map *q_map, int node)
>> +{
>> +       int cpu, qid_idx, mapping_count = 0;
>> +
>> +       q_map->nr_queues = cpumask_weight(q_map->registered_q_mask);
>> +       if (!q_map->nr_queues)
>> +               return;
>> +
>> +       for_each_possible_cpu(cpu) {
>> +               if (node != -1 && fuse_uring_cpu_to_node(cpu) != node)
> 
> nit: NUMA_NO_NODE instead of -1?
> 
>> +                       continue;
>> +
>> +               qid_idx = mapping_count % q_map->nr_queues;
>> +               q_map->cpu_to_qid[cpu] = cpumask_nth(qid_idx,
>> +                                                    q_map->registered_q_mask);
>> +               mapping_count++;
>> +       }
>> +}
>> +
>> +static void fuse_uring_build_q_maps(struct fuse_queue_maps *maps)
>> +{
>> +       int node, registered_qid;
>> +
>> +       for_each_cpu(registered_qid, maps->global.registered_q_mask) {
>> +               node = fuse_uring_cpu_to_node(registered_qid);
>> +               cpumask_set_cpu(registered_qid,
>> +                               maps->numa[node].registered_q_mask);
>> +       }
>> +
>> +       fuse_uring_cpu_qid_mapping(&maps->global, -1);
> 
> nit: NUMA_NO_NODE instead of -1?
> 
>> +       for (node = 0; node < nr_node_ids; node++)
>> +               fuse_uring_cpu_qid_mapping(&maps->numa[node], node);
>> +}
>> +
>>  /*
>>   * Basic ring setup for this connection based on the provided configuration
>>   */
>>  static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
>>  {
>>         struct fuse_ring *ring;
>> -       size_t nr_queues = num_possible_cpus();
>> +       size_t nr_queues = nr_cpu_ids;
> 
> I think this will break backwards compatibility. is_ring_ready() logic
> waits for every possible qid below ring->max_nr_queues, so if this is
> now nr_cpu_ids, a server that registers qids 0..num_possible_cpus() -
> 1 (which works today) will never become ready if the cpu ids are
> non-contiguous. Maybe best addressed by having the ready check just
> count the number of queues with entries and checking that against
> num_possible_cpus()? I think ideally we would reject any queue
> registration that passes a qid that doesn't map to a possible cpu, but
> I think it's too late to change/enforce this now.

Yeah, in my hurry to fix the Sashiko report I had missed on Saturday
night that it might break fuse-server. Maps still have to be allocated
with the size of nr_cpu_ids. The new branch should handle it.

Thanks,
Bernd
