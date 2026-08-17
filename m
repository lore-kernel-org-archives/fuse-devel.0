Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26A73F5BDE
	for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961722; cv=none; b=MGkTRRKim1+pmfGIUiYw6LBm6poflBuKBuq+3GdX+y5HTpSpG15myTATwZCcka0HRCtx6PZHy7Fna75E7iATNnXtxM7CV5BDexU/zzDuP7fLsuPyIw7N9319Zki2/IQ+h0J4t9jHSCZtIYgRO8FLT6TrwMQuWLkTb46MKrqAwO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961722; c=relaxed/simple;
	bh=1MyHIhB5pOeOu2WJnFHCR7mxMT/28HP0vd64sZp7fiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N51FTfRCCAgVAvyldTZh9OXJ5gkANbEUhX2+MOHpjKDhY7CLr6qEtfm/ur2CyBF/VpPKO0llGgXbbCgsU8st3/Ycioefgpi7/R1CwDBP1nZx0V/lKirAlJUTWFmvz/uioOJWOPYWLFXdnrQlnhOK3gEuq3KknrI3bEvKI6jmpQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=joN0T7kV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=F0Kx1Esi; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="joN0T7kV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F0Kx1Esi"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AF7547A0141;
	Mon, 17 Aug 2026 06:15:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 17 Aug 2026 06:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786961719;
	 x=1787048119; bh=be0QkxzwNVfalS7nipZxBhlVcJtluIoTvpM72CMY/Zo=; b=
	joN0T7kVaDWwqpM7hovZgfknJrHxSpNlFMLrdkNNMAsYfK7qEv/iTVFwAj6jo3EN
	SwftKXSkLqSxUql+NtXwsayp710x6F7cmXYl2XpZhccR9+8vXVqnKK5DO+5GY/7o
	4/9HurRJm3CVh8YUp1DLcMaCH70Tl794WiDLJdjjMmAskhuEEc2yucArtZMll9NW
	GSqhpIZuJMBKG43U/sQbg6zMnlx1ZamfAPheAMYD3170jCgjne0h52u4bREB/rM6
	Ijo/td2hlauXfVCcXYXb1/Czjz8jhSQeVcwcaLhLlME4QcQ4+aHL5nXE/8qGIcvC
	pf8DMBHsE/0a0GQXD4AX8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786961719; x=
	1787048119; bh=be0QkxzwNVfalS7nipZxBhlVcJtluIoTvpM72CMY/Zo=; b=F
	0Kx1EsiE48pSVlUyMDGyg31qd/EY4WCMOApukPEwhsfOfZHv44VKQu0b5Ok4FXb8
	m3OkRcVKAZjnuQmvTOhqhVcBMmWWI1PNbvu5mP9zgPTI2IWyMwuYH/ZADzLFbKng
	FmOpHWBrWKdp3pwCuXKMUSjZtcEIt8AeFsg/+5uUie58XajMYiLWLK1MnyieX3kn
	Jgp6hcLozvwbU8KzdPSi29h8fJ5Gx8Xo4dT5Sb1/FTZfCM9fWU2tq3d+zDJ9cioU
	x9zFMcqXc/txkrzrfH02MpmzHBpa3Tfbl12jvFg6GFW2nGR4wiDLNUPnXwsD/9AW
	nxLXWdPICeUbarAc/EUkQ==
X-ME-Sender: <xms:Nt-CasPqA_xFioY5Ow7jUr6fGNmucvFlAwqv22T6_CS4CLiO6C9nIQ>
    <xme:Nt-CajqVCeeL26tZwTAbBbsKCEhg0ZV1I1tPEl87AeGwTeouvGFzOoLX2gjel_-iu
    aVOZh1SnXsWhjKvwpqUZmv5VdQYWiAJNfYdo7K4lPfYxnBwfuP73A>
X-ME-Received: <xmr:Nt-Cahd6UyCxE8TuavvrCGZIKwyJ9dBZi0trOsonD0_k9EnmydsBA416gCzMC-M0l_6YeCwXHfk6JA6gqW6ZJ4ps6RUFO2NdCxBoQ40vrwTQAv-2gypIkDjz>
X-ME-Proxy-Cause: dmFkZTFAMIC4ERBEe9L1FT1DSxg3/SDjNsKTg5QseoezC29PqMxPgiE2dsl26NptN07FSq
    If3/dEw5yTLn2P9ao1mdLGbU57Q1NdVWr72I6ItReUjwP6x9a7oUrMMFEWMCNMkhKPGHU3
    XeA6mfZ829p1wERNqoWWmdFpWF552UF5uF3ZF7AJkn4JgvusCF+dJ4KYjd1HvTGZaUi63W
    INoxM1hG38PEnuXHSkwYcpcwZW4jCVD8Q0VXYJKy5laX4KzTrsMCCczjqb9rynDy8Yb88b
    jiUvoXLlf7HwjktrqC7qMu9aUghzahhTWt49po60fFMAn60akP6ZJIff+Ty7hheruy2lhs
    WAHxNfoYclem3yK/GG0yQpmLIxlmoaNOW5cMc3uQ6O7IqwnzNRA43ytdDvjCFMXAE8MU68
    MbyZbqAvKd5cvhJ3Zo18unAkDBuKHLfbqOUHkzrXY112sq++5Rb9AS1xO82VQucT1/45Lg
    IFkxTKUqbaU/ubjuNnx6ahedB/xw35hSeG35oPiEdDGBD6De7iGYkKevnUC7JAoP7+om+q
    FuspBMy020V9QXJ1bRp6PqPff8tdFimdqqC1mIiMcySCjiRJWJgvaEpC6U9xbgxD/v5duP
    gn+2MAg68mgRzIbKQ9EijHBP2a8K/2SHtUO4mv9kT0EptFoM06OtfL0VbxlA
X-ME-Proxy: <xmx:Nt-CapQFvZSgRGHIwJJ_Af9SdDrCHTI9Ld3uDczl_nX5LulhMSWkKw>
    <xmx:Nt-CaqazyBe5IGdmevtCtr3Z3mn0VNjn1WxfgFEhCtYJJh51Ux0CkQ>
    <xmx:Nt-CasecTJFhamSh_-7eh7a0U15h3kQsL8zllD0G_VxVJYjEO-o-Wg>
    <xmx:Nt-CarJIel-1HexanjULsMq3KfUWAXuWwRNJyCHi07qOlvra3hvn8Q>
    <xmx:N9-CamMkJ60tmfPd4CkicOHczxlbkGWVMoj5ix4tbfezRlNiY-ABg8Ct>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Aug 2026 06:15:16 -0400 (EDT)
Message-ID: <494599e4-f32b-409c-903c-d1fc4fdf0d24@bsbernd.com>
Date: Mon, 17 Aug 2026 12:15:14 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] fuse: support registered buffer pools in io-uring
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
 <20260814185946.3679478-5-joannelkoong@gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260814185946.3679478-5-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/14/26 20:59, Joanne Koong wrote:
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
>  fs/fuse/dev_uring.c   | 112 ++++++++++++++++++++++++++++++++++--------
>  fs/fuse/dev_uring_i.h |   8 +++
>  2 files changed, 99 insertions(+), 21 deletions(-)
> 
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index d300c7f441c4..17806da93039 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -47,6 +47,27 @@ static inline bool bufpool_enabled(struct fuse_ring_queue *queue)
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
> @@ -653,19 +674,42 @@ static int copy_header_from_ring(struct fuse_ring_ent *ent,
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
> @@ -676,7 +720,8 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
>  }
>  
>  static int fuse_uring_copy_from_ring(struct fuse_req *req,
> -				     struct fuse_ring_ent *ent)
> +				     struct fuse_ring_ent *ent,
> +				     unsigned int issue_flags)
>  {
>  	struct fuse_copy_state cs;
>  	struct fuse_args *args = req->args;
> @@ -689,7 +734,8 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
>  	if (err)
>  		return err;
>  
> -	err = setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter);
> +	err = setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter,
> +				    issue_flags);
>  	if (err)
>  		return err;
>  
> @@ -702,7 +748,8 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
>   * Copy data from the req to the ring buffer
>   */
>  static int fuse_uring_args_to_ring(struct fuse_req *req,
> -				   struct fuse_ring_ent *ent)
> +				   struct fuse_ring_ent *ent,
> +				   unsigned int issue_flags)
>  {
>  	struct fuse_copy_state cs;
>  	struct fuse_args *args = req->args;
> @@ -715,7 +762,8 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
>  		.commit_id = req->in.h.unique,
>  	};
>  
> -	err = setup_fuse_copy_state(&cs, req, ent, ITER_DEST, &iter);
> +	err = setup_fuse_copy_state(&cs, req, ent, ITER_DEST, &iter,
> +				    issue_flags);
>  	if (err)
>  		return err;
>  
> @@ -754,7 +802,8 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
>  }
>  
>  static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
> -				   struct fuse_req *req)
> +				   struct fuse_req *req,
> +				   unsigned int issue_flags)
>  {
>  	struct fuse_ring_queue *queue = ent->queue;
>  	int err;
> @@ -771,7 +820,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
>  		return err;
>  
>  	/* copy the request */
> -	err = fuse_uring_args_to_ring(req, ent);
> +	err = fuse_uring_args_to_ring(req, ent, issue_flags);
>  	if (unlikely(err)) {
>  		pr_info_ratelimited("Copy to ring failed: %d\n", err);
>  		return err;
> @@ -868,11 +917,12 @@ static int fuse_uring_prep_buffer(struct fuse_ring_ent *ent,
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
> @@ -983,7 +1033,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
>  		goto out;
>  	}
>  
> -	err = fuse_uring_copy_from_ring(req, ent);
> +	err = fuse_uring_copy_from_ring(req, ent, issue_flags);
>  out:
>  	fuse_uring_req_end(ent, req, err);
>  }
> @@ -995,7 +1045,8 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
>   * Else, there is no next fuse request and this returns false.
>   */
>  static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
> -					 struct fuse_ring_queue *queue)
> +					 struct fuse_ring_queue *queue,
> +					 unsigned int issue_flags)
>  {
>  	int err;
>  	struct fuse_req *req;
> @@ -1007,7 +1058,7 @@ static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
>  	spin_unlock(&queue->lock);
>  
>  	if (req) {
> -		err = fuse_uring_prepare_send(ent, req);
> +		err = fuse_uring_prepare_send(ent, req, issue_flags);
>  		if (err)
>  			goto retry;
>  	}
> @@ -1081,6 +1132,11 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
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
> @@ -1126,7 +1182,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
>  	 * available and the cmd only returns to userspace when there's a
>  	 * next request and an available buffer.
>  	 */
> -	if (fuse_uring_get_next_fuse_req(ent, queue))
> +	if (fuse_uring_get_next_fuse_req(ent, queue, issue_flags))
>  		fuse_uring_send(ent, cmd, 0, issue_flags);
>  	return 0;
>  }
> @@ -1252,7 +1308,8 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
>  
>  	spin_lock(&queue->lock);
>  	if (bufpool_enabled(queue)) {
> -		if (payload->iov_base || payload->iov_len) {
> +		if (payload->iov_base || payload->iov_len ||
> +		    !fuse_uring_cmd_index_ok(cmd, queue)) {
>  			spin_unlock(&queue->lock);
>  			return ERR_PTR(err);
>  		}
> @@ -1362,6 +1419,7 @@ static int fuse_uring_add_bufpool(struct io_uring_cmd *cmd,
>  	uintptr_t pool_uaddr;
>  	unsigned int pool_len, nr_bufs;
>  	size_t pool_size, buf_size;
> +	bool registered = cmd->flags & IORING_URING_CMD_FIXED;
>  
>  	if (!ring || qid >= ring->nr_queues || flags)
>  		return -EINVAL;
> @@ -1396,6 +1454,17 @@ static int fuse_uring_add_bufpool(struct io_uring_cmd *cmd,
>  	/* all buffers are free */
>  	bitmap_set(pool->free_map, 0, nr_bufs);
>  
> +	/*
> +	 * A registered bufpool is reached through an io_uring fixed buffer, so
> +	 * the pool is registered iff this command was submitted with
> +	 * IORING_URING_CMD_FIXED. The registered buffer index is taken from
> +	 * sqe->buf_index.
> +	 */
> +	if (registered) {
> +		pool->registered = true;
> +		pool->registered_index = READ_ONCE(cmd->sqe->buf_index);
> +	}
> +
>  	spin_lock(&queue->lock);
>  	if (queue->payload_mode != FUSE_PAYLOAD_UNSET) {
>  		spin_unlock(&queue->lock);
> @@ -1508,9 +1577,10 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
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

Thanks for the update!

Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
