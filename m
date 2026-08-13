Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6163E16B2
	for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 21:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786655395; cv=none; b=Ua98vUm+scyOtM9ZMddydVDXmrBMrmED7xPd2W7UGJ+dkCobpKP1cKOO4vT0pS5AOKRm4csncEFg7UcNBxC+xfdZzuiWbyptbELN8Y+YjMDH6VAuaPmkABl7bAZHRHHbGJNFww38UYFGbZ9I/WkNHS3JiLd6mgPnkU+hE3jKIXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786655395; c=relaxed/simple;
	bh=DQn0z6EqE7kp4hZpv0luyVt5HoTMQ3nY2uWQ52nrPrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NhuAgfdv3x3aUekwxrcU5n4OrFVhraLmyjqhHkPUZNMEScFms4yO7OEXfNUCRmSFoLH1gN26yqsI85VEXJgwYZvTYS0aSHRbCBGqzFuzaAHCZt20Wt7kdOeBgpfGR/6lBsljDyml/x76H6/UYkKVmo7ZjyHijBZGwGlndvUYmoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=OLmO0QUR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fTMr1Y7v; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="OLmO0QUR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fTMr1Y7v"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id ADC591D002F8;
	Thu, 13 Aug 2026 17:09:52 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 13 Aug 2026 17:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786655392;
	 x=1786741792; bh=+eIM66VZFUww05c1u7atkMQeUB5LHUMmgcoNytl4j/Q=; b=
	OLmO0QURECbUEZ8rlp6+c/wjy2maTfzl2PthwWmyHGfZZ/CneqiSNkEtEr537VQx
	pkRQIxsIh8GogWzf0h8AHhI9qREjdUI7mgbApd8S4hhaDDC9wtNYO0AwZxFzRUhf
	muFqETiq5f2N+aea53WgZopcAKCcqOc3+kvlDtwhY5Ox/hjGlkx6OMFmkvfO5Y3K
	RdXGn2tKKiAKUPiP2xVghWlj6aILVFNKAsANfuQvur8eNwct2v26nHxw1ISDfDLs
	2JwMxfra3X+EphLsmcMFGyvPtoLzfN+pv68OHVDPRwXk/cS3fnJ5hLMaaIHm9leS
	hC2WbRPxCt2KCPrT/ddSaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786655392; x=
	1786741792; bh=+eIM66VZFUww05c1u7atkMQeUB5LHUMmgcoNytl4j/Q=; b=f
	TMr1Y7vvtvJJqibTDHS8OmP8Clngk3qiFpbXuhqG5iY3DNQyIP7LKmHfEjQb5e7i
	qYz6jylQHNXrxvU8mSZoYVtR7zwxNVFuk9wDn294ipOd61MsMec94bPnziKNeW4B
	3UlzaShQfkmeWgLcgNk1I6w+ZyIoRJZDd9tAv6e3br2heEnUS3WSUtH81o+/ALaY
	Wf8wi0EMSxcB/iu6q8kagMvRjVVwiYpqouJHVYnbkXmkJujL2mk2UlxQMui37beZ
	OB+d0bS9l/TUg4/NxwNfGruTjw2fhREKeiHBe6LHbFwVnGRLW0zXJdwKGNbc0aFx
	FZlENjoDNFZY5jbkHecQA==
X-ME-Sender: <xms:oDJ-agNpSqXQJ9Dac6T9NrOVRRcJz-2B3ehhC-RJ7PYxpkTzYYZyQg>
    <xme:oDJ-anrWejJmeW9l09ZZnuhBBkAkdo57dWZomBSZbvLng557hw0vqnGTvcZsg2s_Q
    eA9OwC9zVctJIDlUF_apH0CDCyaCeeqXzCI9sTMrqHlU3v_dzwDhg>
X-ME-Received: <xmr:oDJ-alfCK6fzUzPYtr5M8-ZMh-uEr6YeUvGa4sUw6zDfLCFnjDGqEW0Zwk-d8qYJCQ29Qu17ZO87tz0pJ2VNH2in7xoJI3L3eJe56E9hn8D25u95oLbOvI4z>
X-ME-Proxy-Cause: dmFkZTEv6riF7NXX26VuCi4UP+6CXsaW8LC+xWS39axoOTryCn39i63mlhq/wrESuAKQSg
    1j1yr2tg4dOSt8iahCBNOm7v6J/ocwu8PVSY+hCgj5YE9blZHyS3E61nKRRe4z9/QNPfpi
    GE8ffHwH9E03WqjZEkJ6TbX+hk12+K5x55WIpbrGZH4WjviU/JG9R6obRM7LJkILkt+MnU
    5d7mufAgj5Z+COOr7ooaKnjWHm2rGB69XvRvyHFW+m12W06LugXaboq4m0y2YdaOphYjuQ
    Y6niQ12bwNlk1FJ04gQAyu53+Rm4QwRMPQOEJbt3IwMr5vGR/JM6acm8LzhGDJXdfevORu
    eUZlyWiaWZIv5iihVdUNsjJ6zHK3Z4F0ZERmaaYPDUNjf0DdpBRhrCgd21uxQxkAioabi7
    di6D3pu7Iyqjsg4cti2600swKKlSqfo1afbkZzxuMq3n4mTJ6AMtv8/aAW2EpiX2Wawg7e
    bNsNn9vSSW7oBAL+jXvk2bMJW0QVMsMv8GB6qtAXnaYpqHFFpu2h7bWrYSiPvIFuxKxHkh
    Avz297ZAQgds8k5dYSbzQ2wAwDBQsT2apdjOo63xJBCBa6C5Zci0h6uocH6TT/qjc6DRQZ
    kvfTR8IZb2YC4hnygxABLcEH9V6IdAhl3wM0vLmEe/ZhBH4mGXDvThYPe/Cw
X-ME-Proxy: <xmx:oDJ-atRIvWpfjUMBFmKoWNq68oKRTmf-lF0nkZENFukgyrxyvN82LA>
    <xmx:oDJ-aubVUPG7z8cKasdmUnz2kH3exXYzWQcAiSyC0oDEDbd_gQJN-g>
    <xmx:oDJ-ageyCJLvkqqo3tJ2YDj6hlvgcruAWKrnMxbM0cZY3KUzQc_EVw>
    <xmx:oDJ-avLUpsFcWD2kKWuV3n1jIfF1EUZUxI6fntKD91-_A-Iqe-dO9Q>
    <xmx:oDJ-aqMrD4xYlkHsvKP30mXGHIOCH-mIPkcc-mdrcvLWSy7rYVdWm5UM>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 17:09:50 -0400 (EDT)
Message-ID: <a4d759e1-a447-4ae2-8b86-0c724a95541c@bsbernd.com>
Date: Thu, 13 Aug 2026 23:09:48 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] fuse: support registered buffer pools in io-uring
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-5-joannelkoong@gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260716175908.2339738-5-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/16/26 19:59, Joanne Koong wrote:
> Allow servers to use a buffer pool that is also registered through
> io-uring. When the server registers a buffer pool with io-uring, the
> pages backing the pool are pinned upfront. This eliminates the overhead
> of pinning/unpinning user pages and translating virtual addresses per
> i/o request. This also allows servers to use the same registered memory
> for subsequent backing store I/O (eg read_fixed/write_fixed), keeping
> data in the same pinned pages without additional pinning or mapping
> overhead required.
> 
> To use this, the server needs to set the FUSE_URING_REGISTERED_BUFPOOL
> flag when adding a bufpool through the FUSE_IO_URING_CMD_ADD_BUFPOOL
> cmd. For every sqe submitted (including the one for adding the bufpool),
> it should set sqe->uring_cmd_flags to include IORING_URING_CMD_FIXED,
> and pass in the index where the registered bufpool resides to
> sqe->buf_index.
> 
> Benchmarked with passthrough_hp (--nopassthrough, q_depth=8) on a
> 2-socket Intel Xeon Gold 6138 (40 cores / 80 threads), using fio (sync
> engine, bs=1M, O_DIRECT, numjobs=2, 30s run + 10s ramp, 3 runs) where
> direct-I/O throughput is against a RAM-backed (tmpfs) source (backing
> I/O is not the bottleneck):
> 
> 		    baseline      registered buffers
>   direct read       ~5.1 GB/s     ~5.4 GB/s   (+~5%)
>   direct write      ~3.4 GB/s     ~4.8 GB/s   (+~45%)
> 
> Registered buffers bring up the write path speed up closer to speed of
> reads. There isn't much improvement for reads because it is already fast
> enough where it's at the copy-bound ceiling (surpassing that requires
> doing zero-copy). On a device-bound NVMe though, the differences are
> within noise, as backing I/O dominates per-request latency.
> 
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dev_uring.c       | 122 +++++++++++++++++++++++++++++++-------
>  fs/fuse/dev_uring_i.h     |   8 +++
>  include/uapi/linux/fuse.h |   4 ++
>  3 files changed, 112 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index e9da92b46090..ed7e783bd68d 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -22,6 +22,8 @@ MODULE_PARM_DESC(enable_uring,
>  #define FUSE_URING_IOV_HEADERS 0
>  #define FUSE_URING_IOV_PAYLOAD 1
>  
> +#define FUSE_URING_ADD_BUFPOOL_FLAGS	(FUSE_URING_REGISTERED_BUFPOOL)
> +
>  bool fuse_uring_enabled(void)
>  {
>  	return enable_uring;
> @@ -47,6 +49,27 @@ static inline bool bufpool_enabled(struct fuse_ring_queue *queue)
>  	return queue->payload_mode == FUSE_PAYLOAD_BUFPOOL;
>  }
>  
> +static inline bool bufpool_registered(struct fuse_ring_queue *queue)
> +{
> +	return queue->bufpool && queue->bufpool->registered;
> +}
> +
> +/*
> + * For a registered bufpool, every sqe that drives a payload import (REGISTER,
> + * COMMIT_AND_FETCH) must carry the registered buffer index of the pool.
> + * This also must be called from the command's issue handler, where cmd->sqe is
> + * still valid
> + */
> +static inline bool fuse_uring_cmd_index_ok(struct io_uring_cmd *cmd,
> +					   struct fuse_ring_queue *queue)
> +{
> +	if (!bufpool_registered(queue))
> +		return true;
> +
> +	return (cmd->flags & IORING_URING_CMD_FIXED) &&
> +	       READ_ONCE(cmd->sqe->buf_index) == queue->bufpool->registered_index;
> +}
> +
>  static void uring_cmd_set_ring_ent(struct io_uring_cmd *cmd,
>  				   struct fuse_ring_ent *ring_ent)
>  {
> @@ -653,19 +676,42 @@ static int copy_header_from_ring(struct fuse_ring_ent *ent,
>  	return 0;
>  }
>  
> +static int fuse_uring_import_payload(struct fuse_ring_ent *ent, int dir,
> +				     struct iov_iter *iter,
> +				     unsigned int issue_flags)
> +{
> +	void __user *base = ent->payload.iov_base;
> +	size_t len = ent->payload.iov_len;
> +	int err = 0;
> +
> +	if (!base) {
> +		memset(iter, 0, sizeof(*iter));
> +		return 0;
> +	}
> +
> +	if (bufpool_registered(ent->queue))
> +		err = io_uring_cmd_import_fixed((u64)(uintptr_t)base, len, dir,
> +						iter, ent->cmd, issue_flags);
> +	else
> +		err = import_ubuf(dir, base, len, iter);
> +
> +	if (err)
> +		pr_info_ratelimited("fuse: Import of user buffer failed\n");
> +
> +	return err;
> +}
> +
>  static int setup_fuse_copy_state(struct fuse_copy_state *cs,
>  				 struct fuse_req *req,
>  				 struct fuse_ring_ent *ent, int dir,
> -				 struct iov_iter *iter)
> +				 struct iov_iter *iter,
> +				 unsigned int issue_flags)
>  {
>  	int err;
>  
> -	err = import_ubuf(dir, ent->payload.iov_base, ent->payload.iov_len,
> -			  iter);
> -	if (err) {
> -		pr_info_ratelimited("fuse: Import of user buffer failed\n");
> +	err = fuse_uring_import_payload(ent, dir, iter, issue_flags);
> +	if (err)
>  		return err;
> -	}
>  
>  	fuse_copy_init(cs, dir == ITER_DEST, iter);
>  
> @@ -676,7 +722,8 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
>  }
>  
>  static int fuse_uring_copy_from_ring(struct fuse_req *req,
> -				     struct fuse_ring_ent *ent)
> +				     struct fuse_ring_ent *ent,
> +				     unsigned int issue_flags)
>  {
>  	struct fuse_copy_state cs;
>  	struct fuse_args *args = req->args;
> @@ -689,7 +736,8 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
>  	if (err)
>  		return err;
>  
> -	err = setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter);
> +	err = setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter,
> +				    issue_flags);
>  	if (err)
>  		return err;
>  
> @@ -702,7 +750,8 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
>   * Copy data from the req to the ring buffer
>   */
>  static int fuse_uring_args_to_ring(struct fuse_req *req,
> -				   struct fuse_ring_ent *ent)
> +				   struct fuse_ring_ent *ent,
> +				   unsigned int issue_flags)
>  {
>  	struct fuse_copy_state cs;
>  	struct fuse_args *args = req->args;
> @@ -715,7 +764,8 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
>  		.commit_id = req->in.h.unique,
>  	};
>  
> -	err = setup_fuse_copy_state(&cs, req, ent, ITER_DEST, &iter);
> +	err = setup_fuse_copy_state(&cs, req, ent, ITER_DEST, &iter,
> +				    issue_flags);
>  	if (err)
>  		return err;
>  
> @@ -754,7 +804,8 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
>  }
>  
>  static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
> -				   struct fuse_req *req)
> +				   struct fuse_req *req,
> +				   unsigned int issue_flags)
>  {
>  	struct fuse_ring_queue *queue = ent->queue;
>  	int err;
> @@ -771,7 +822,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
>  		return err;
>  
>  	/* copy the request */
> -	err = fuse_uring_args_to_ring(req, ent);
> +	err = fuse_uring_args_to_ring(req, ent, issue_flags);
>  	if (unlikely(err)) {
>  		pr_info_ratelimited("Copy to ring failed: %d\n", err);
>  		return err;
> @@ -868,11 +919,12 @@ static int fuse_uring_prep_buffer(struct fuse_ring_ent *ent,
>  }
>  
>  static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
> -				   struct fuse_req *req)
> +				   struct fuse_req *req,
> +				   unsigned int issue_flags)
>  {
>  	int err;
>  
> -	err = fuse_uring_copy_to_ring(ent, req);
> +	err = fuse_uring_copy_to_ring(ent, req, issue_flags);
>  	if (!err) {
>  		set_bit(FR_SENT, &req->flags);
>  		trace_fuse_request_sent(req);
> @@ -983,7 +1035,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
>  		goto out;
>  	}
>  
> -	err = fuse_uring_copy_from_ring(req, ent);
> +	err = fuse_uring_copy_from_ring(req, ent, issue_flags);
>  out:
>  	fuse_uring_req_end(ent, req, err);
>  }
> @@ -995,7 +1047,8 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
>   * Else, there is no next fuse request and this returns false.
>   */
>  static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
> -					 struct fuse_ring_queue *queue)
> +					 struct fuse_ring_queue *queue,
> +					 unsigned int issue_flags)
>  {
>  	int err;
>  	struct fuse_req *req;
> @@ -1007,7 +1060,7 @@ static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
>  	spin_unlock(&queue->lock);
>  
>  	if (req) {
> -		err = fuse_uring_prepare_send(ent, req);
> +		err = fuse_uring_prepare_send(ent, req, issue_flags);
>  		if (err)
>  			goto retry;
>  	}
> @@ -1081,6 +1134,11 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
>  		return err;
>  	}
>  
> +	if (!fuse_uring_cmd_index_ok(cmd, queue)) {
> +		spin_unlock(&queue->lock);
> +		return -EINVAL;
> +	}
> +
>  	/* Find a request based on the unique ID of the fuse request
>  	 * This should get revised, as it needs a hash calculation and list
>  	 * search. And full struct fuse_pqueue is needed (memory overhead).
> @@ -1126,7 +1184,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
>  	 * available and the cmd only returns to userspace when there's a
>  	 * next request and an available buffer.
>  	 */
> -	if (fuse_uring_get_next_fuse_req(ent, queue))
> +	if (fuse_uring_get_next_fuse_req(ent, queue, issue_flags))
>  		fuse_uring_send(ent, cmd, 0, issue_flags);
>  	return 0;
>  }
> @@ -1252,7 +1310,8 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
>  
>  	spin_lock(&queue->lock);
>  	if (bufpool_enabled(queue)) {
> -		if (payload->iov_base || payload->iov_len) {
> +		if (payload->iov_base || payload->iov_len ||
> +		    !fuse_uring_cmd_index_ok(cmd, queue)) {
>  			spin_unlock(&queue->lock);
>  			return ERR_PTR(err);
>  		}
> @@ -1362,8 +1421,21 @@ static int fuse_uring_add_bufpool(struct io_uring_cmd *cmd,
>  	uintptr_t pool_uaddr;
>  	unsigned int pool_len, nr_bufs;
>  	size_t pool_size, buf_size;
> +	bool registered = flags & FUSE_URING_REGISTERED_BUFPOOL;
> +
> +	if (!ring || qid >= ring->nr_queues)
> +		return -EINVAL;
>  
> -	if (!ring || qid >= ring->nr_queues || flags)
> +	if (flags & ~FUSE_URING_ADD_BUFPOOL_FLAGS)
> +		return -EINVAL;
> +
> +	/*
> +	 * A registered bufpool is reached through an io_uring fixed buffer, so
> +	 * this command must be submitted with IORING_URING_CMD_FIXED and the
> +	 * registered buffer index in sqe->buf_index. That index is recorded
> +	 * below and enforced on every REGISTER / COMMIT_AND_FETCH sqe.
> +	 */
> +	if (registered && !(cmd->flags & IORING_URING_CMD_FIXED))
>  		return -EINVAL;
>  
>  	/* Pairs with smp_store_release() in fuse_uring_create_queue() */
> @@ -1392,6 +1464,11 @@ static int fuse_uring_add_bufpool(struct io_uring_cmd *cmd,
>  	/* all buffers are free */
>  	bitmap_set(pool->free_map, 0, nr_bufs);
>  
> +	if (registered) {
> +		pool->registered = true;
> +		pool->registered_index = READ_ONCE(cmd->sqe->buf_index);
> +	}
> +
>  	spin_lock(&queue->lock);
>  	if (queue->payload_mode != FUSE_PAYLOAD_UNSET) {
>  		spin_unlock(&queue->lock);
> @@ -1504,9 +1581,10 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
>  	int err;
>  
>  	if (!tw.cancel) {
> -		err = fuse_uring_prepare_send(ent, ent->fuse_req);
> +		err = fuse_uring_prepare_send(ent, ent->fuse_req, issue_flags);
>  		if (err) {
> -			if (!fuse_uring_get_next_fuse_req(ent, queue))
> +			if (!fuse_uring_get_next_fuse_req(ent, queue,
> +							  issue_flags))
>  				return;
>  			err = 0;
>  		}
> diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
> index cdf56f8b38b5..e142cae43022 100644
> --- a/fs/fuse/dev_uring_i.h
> +++ b/fs/fuse/dev_uring_i.h
> @@ -49,6 +49,14 @@ enum fuse_queue_payload_mode {
>  };
>  
>  struct fuse_bufpool {
> +	bool registered;
> +
> +	/*
> +	 * io_uring registered buffer table index for this pool, bound at
> +	 * ADD_BUFPOOL time. Only valid if the bufpool is registered
> +	 */
> +	u16 registered_index;
> +
>  	/* starting uaddr of the bufpool */
>  	uintptr_t base_uaddr;
>  
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index f7173b5d4321..07d12f1c55bb 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -246,6 +246,7 @@
>   *  - add FUSE_HAS_IO_URING_BUFPOOL
>   *  - add fuse_uring_cmd_req bufpool struct
>   *  - add bufpool offset field to fuse_uring_ent_in_out struct
> + *  - add FUSE_URING_REGISTERED_BUFPOOL flag
>   */
>  
>  #ifndef _LINUX_FUSE_H
> @@ -1310,6 +1311,9 @@ enum fuse_uring_cmd {
>  	FUSE_IO_URING_CMD_ADD_BUFPOOL = 4,
>  };
>  
> +/* fuse_uring_cmd_req flags for FUSE_IO_URING_CMD_ADD_BUFPOOL */
> +#define FUSE_URING_REGISTERED_BUFPOOL	(1 << 0)
> +
>  /**
>   * In the 80B command area of the SQE.
>   */


I would personally prefer to avoid FUSE_URING_ADD_BUFPOOL_FLAGS and to
use IORING_URING_CMD_FIXED, unless there is a really compelling reason
to have a 2nd flag, but I don't have a strong opinion about it.

Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
