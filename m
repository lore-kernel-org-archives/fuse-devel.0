Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD4A37C939
	for <fuse-devel@lists.linux.dev>; Tue,  2 Jun 2026 07:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780386587; cv=none; b=bojezAKj7PXoNAaUV6tHXfewJiKwY057dUnKS2aG05mmS4gZKgbbvqJgMPjBsD3kKtzEHatQVqmGBPg8D+l7QwZbf4mPmecAmIgW9grReauXdEQzeazdjEibruM0ELJpZjHXpas7A51oL6iYhwR3uPofxOpHRqhUWFmDCMe1bHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780386587; c=relaxed/simple;
	bh=mEa2fXIp2IpptsWzF29LmsTQJckZijAsQ7DOv00wsA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MjYC7N0FjfdDPtNhCouuGKqc37H1+Susob1h6k3zmH0WkqWccVqTEiGXkyeK5BtkwNqNnxOiQ8f0JhnRF6ulVZNkhb63UPvpVhjbbw9zeyLne6OKGfVMmXEp2oB04/npMkjcnHNCrye0c1Y1dfEGBzVjmYgbzOMIbQY0njeOYQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZTBiGWFE; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZTBiGWFE"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780386581; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=EvXjMDC6zPZyG1wvfFXLYDe3YvMyTEPbG6lmHUzt+eI=;
	b=ZTBiGWFErnbLyJXEb9wWkzUpbSRet67Uj64NhvtN1wPvYHWRgb39Jobi87pDt9LEstSA1HGzfq3N1T4tUyL/2Xv8hR51ZV2XmKxkZJns1+wv3dHFMqkuK2L8zLao9Y474nCXJKWtz8bxsuEfI8iKDJnCVg2jOXO9d8NXumR3CoI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0X43Ybwl_1780386580;
Received: from 30.221.147.232(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X43Ybwl_1780386580 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 15:49:41 +0800
Message-ID: <a2a4a2fd-7372-4088-996b-7fc656b469a7@linux.alibaba.com>
Date: Tue, 2 Jun 2026 15:49:40 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] fuse: support registered buffers as buffer pools
 in io-uring
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, bernd@bsbernd.com, jlayton@kernel.org,
 axboe@kernel.dk, fuse-devel@lists.linux.dev
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <20260522205823.1597313-9-joannelkoong@gmail.com>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <20260522205823.1597313-9-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/5/23 04:58, Joanne Koong wrote:
> Allow servers to use an io-uring registered buffer as the buffer pool.
> When the server registers buffers with io-uring, the pages backing the
> buffers are pinned upfront. This eliminates the overhead of
> pinning/unpinning user pages and translating virtual addresses per i/o
> request. This also allows servers to use the same registered buffers for
> subsequent backing store I/O (eg read_fixed/write_fixed), keeping data
> in the same pinned pages without additional pinning or mapping overhead
> required.
>
> Registered buffers require the buffer pool (FUSE_URING_BUFPOOL) to be
> enabled. To use registered buffers, the server needs to register the
> payload buffers through io-uring and during registration, set the
> FUSE_URING_REGISTERED_BUFFERS init flag (alongside the
> FUSE_URING_BUFPOOL flag) in the registration sqe. For all sqes the
> server passes in (including the registration ones), it needs to follow
> standard protocol for using registered buffers (eg set
> sqe->uring_cmd_flags to include IORING_URING_CMD_FIXED, and pass in the
> index where the registered buffers reside to sqe->buf_index).
>
> In benchmarks using passthrough_hp on a high-performance NVMe-backed
> system, using registered buffers showed around a 10% throughput
> improvement for direct randreads (~2150 MiB/s to ~2400 MiB/s), a 4%
> improvement for direct sequential reads (~2510 MiB/s to ~2620 MiB/s),
> a 8% improvement for buffered randreads (~2100 MiB/s to ~2280 MiB/s),
> and a 6% improvement for buffered sequential reads (~2500 MiB/s to
> ~2670 MiB/s).
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Looks good to me.

Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>

> ---
>  fs/fuse/dev_uring.c       | 97 ++++++++++++++++++++++++++-------------
>  fs/fuse/dev_uring_i.h     |  2 +
>  include/uapi/linux/fuse.h |  2 +
>  3 files changed, 70 insertions(+), 31 deletions(-)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index 5947b834121e..2443abf21a7b 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -46,6 +46,11 @@ static inline bool bufpool_enabled(struct fuse_ring_queue *queue)
>  	return queue->bufpool != NULL;
>  }
>  
> +static inline bool bufpool_registered_buffers(struct fuse_ring_queue *queue)
> +{
> +	return queue->bufpool && queue->bufpool->registered_buffers;
> +}
> +
>  static void uring_cmd_set_ring_ent(struct io_uring_cmd *cmd,
>  				   struct fuse_ring_ent *ring_ent)
>  {
> @@ -310,7 +315,8 @@ static int fuse_uring_get_iovec_from_sqe(const struct io_uring_sqe *sqe,
>  }
>  
>  static int fuse_uring_bufpool_setup(struct io_uring_cmd *cmd,
> -				    struct fuse_ring_queue *queue)
> +				    struct fuse_ring_queue *queue,
> +				    u64 init_flags)
>  {
>  	const struct fuse_uring_cmd_req *cmd_req =
>  		io_uring_sqe128_cmd(cmd->sqe, struct fuse_uring_cmd_req);
> @@ -353,6 +359,7 @@ static int fuse_uring_bufpool_setup(struct io_uring_cmd *cmd,
>  
>  	pool->nbufs = nr_bufs;
>  	pool->tail = nr_bufs;
> +	pool->registered_buffers = init_flags & FUSE_URING_REGISTERED_BUFFERS;
>  
>  	queue->bufpool = pool;
>  
> @@ -369,8 +376,10 @@ static bool queue_init_flags_consistent(struct fuse_ring_queue *queue,
>  					u64 init_flags)
>  {
>  	bool bufpool = init_flags & FUSE_URING_BUFPOOL;
> +	bool registered_buffers = init_flags & FUSE_URING_REGISTERED_BUFFERS;
>  
> -	return bufpool_enabled(queue) == bufpool;
> +	return bufpool_enabled(queue) == bufpool &&
> +		bufpool_registered_buffers(queue) == registered_buffers;
>  }
>  
>  static struct fuse_ring_queue *
> @@ -408,7 +417,7 @@ fuse_uring_create_queue(struct io_uring_cmd *cmd, struct fuse_ring *ring,
>  	queue->fpq.processing = pq;
>  
>  	if (use_bufpool) {
> -		err = fuse_uring_bufpool_setup(cmd, queue);
> +		err = fuse_uring_bufpool_setup(cmd, queue, init_flags);
>  		if (err) {
>  			kfree(pq);
>  			kfree(queue);
> @@ -752,28 +761,41 @@ static int copy_header_from_ring(struct fuse_ring_ent *ent,
>  static int setup_fuse_copy_state(struct fuse_copy_state *cs,
>  				 struct fuse_ring *ring, struct fuse_req *req,
>  				 struct fuse_ring_ent *ent, int dir,
> -				 struct iov_iter *iter)
> +				 struct iov_iter *iter,
> +				 unsigned int issue_flags)
>  {
> +	bool bufpool = bufpool_enabled(ent->queue);
> +	bool registered_buffers = bufpool_registered_buffers(ent->queue);
>  	void __user *payload;
>  	size_t len;
> -	int err;
> +	int err = 0;
>  
>  	memset(iter, 0, sizeof(*iter));
>  
> -	if (bufpool_enabled(ent->queue)) {
> -		payload = (void __user *)ent->payload_buf.addr;
> -		len = ent->payload_buf.len;
> +	if (registered_buffers) {
> +		if (ent->payload_buf.addr)
> +			err = io_uring_cmd_import_fixed(ent->payload_buf.addr,
> +							ent->payload_buf.len,
> +							dir, iter, ent->cmd,
> +							issue_flags);
>  	} else {
> -		payload = ent->payload;
> -		len = ring->max_payload_sz;
> +		if (bufpool) {
> +			payload = (void __user *)ent->payload_buf.addr;
> +			len = ent->payload_buf.len;
> +		} else {
> +			payload = ent->payload;
> +			len = ring->max_payload_sz;
> +		}
> +
> +		if (payload)
> +			err = import_ubuf(dir, payload, len, iter);
>  	}
>  
> -	if (payload) {
> -		err = import_ubuf(dir, payload, len, iter);
> -		if (err) {
> -			pr_info_ratelimited("fuse: Import of user buffer failed\n");
> -			return err;
> -		}
> +	if (err) {
> +		pr_info_ratelimited("fuse: Importing iter failed, bufpool=%d, "
> +				    "registered_buffers=%d\n", bufpool,
> +				    registered_buffers);
> +		return err;
>  	}
>  
>  	fuse_copy_init(cs, dir == ITER_DEST, iter);
> @@ -786,7 +808,8 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
>  
>  static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
>  				     struct fuse_req *req,
> -				     struct fuse_ring_ent *ent)
> +				     struct fuse_ring_ent *ent,
> +				     unsigned int issue_flags)
>  {
>  	struct fuse_copy_state cs;
>  	struct fuse_args *args = req->args;
> @@ -799,7 +822,8 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
>  	if (err)
>  		return err;
>  
> -	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE, &iter);
> +	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE, &iter,
> +				    issue_flags);
>  	if (err)
>  		return err;
>  
> @@ -812,7 +836,8 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
>   * Copy data from the req to the ring buffer
>   */
>  static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
> -				   struct fuse_ring_ent *ent)
> +				   struct fuse_ring_ent *ent,
> +				   unsigned int issue_flags)
>  {
>  	struct fuse_copy_state cs;
>  	struct fuse_args *args = req->args;
> @@ -828,7 +853,8 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
>  	if (bufpool_enabled(ent->queue))
>  		ent_in_out.buf_id = ent->payload_buf.id;
>  
> -	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_DEST, &iter);
> +	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_DEST, &iter,
> +				    issue_flags);
>  	if (err)
>  		return err;
>  
> @@ -863,7 +889,8 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
>  }
>  
>  static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
> -				   struct fuse_req *req)
> +				   struct fuse_req *req,
> +				   unsigned int issue_flags)
>  {
>  	struct fuse_ring_queue *queue = ent->queue;
>  	struct fuse_ring *ring = queue->ring;
> @@ -881,7 +908,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
>  		return err;
>  
>  	/* copy the request */
> -	err = fuse_uring_args_to_ring(ring, req, ent);
> +	err = fuse_uring_args_to_ring(ring, req, ent, issue_flags);
>  	if (unlikely(err)) {
>  		pr_info_ratelimited("Copy to ring failed: %d\n", err);
>  		return err;
> @@ -979,11 +1006,12 @@ static int fuse_uring_prep_buffer(struct fuse_ring_ent *ent,
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
>  	if (!err)
>  		set_bit(FR_SENT, &req->flags);
>  	else
> @@ -1092,7 +1120,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
>  		goto out;
>  	}
>  
> -	err = fuse_uring_copy_from_ring(ring, req, ent);
> +	err = fuse_uring_copy_from_ring(ring, req, ent, issue_flags);
>  out:
>  	fuse_uring_req_end(ent, req, err);
>  }
> @@ -1104,7 +1132,8 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
>   * Else, there is no next fuse request and this returns false.
>   */
>  static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
> -					 struct fuse_ring_queue *queue)
> +					 struct fuse_ring_queue *queue,
> +					 unsigned int issue_flags)
>  {
>  	int err;
>  	struct fuse_req *req;
> @@ -1116,7 +1145,7 @@ static bool fuse_uring_get_next_fuse_req(struct fuse_ring_ent *ent,
>  	spin_unlock(&queue->lock);
>  
>  	if (req) {
> -		err = fuse_uring_prepare_send(ent, req);
> +		err = fuse_uring_prepare_send(ent, req, issue_flags);
>  		if (err)
>  			goto retry;
>  	}
> @@ -1231,7 +1260,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
>  	 * no-op and the next request will be serviced when a buffer becomes
>  	 * available.
>  	 */
> -	if (fuse_uring_get_next_fuse_req(ent, queue))
> +	if (fuse_uring_get_next_fuse_req(ent, queue, issue_flags))
>  		fuse_uring_send(ent, cmd, 0, issue_flags);
>  	return 0;
>  }
> @@ -1343,7 +1372,12 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
>  
>  static bool init_flags_valid(u64 init_flags)
>  {
> -	u64 valid_flags = FUSE_URING_BUFPOOL;
> +	u64 valid_flags = FUSE_URING_BUFPOOL | FUSE_URING_REGISTERED_BUFFERS;
> +	bool bufpool = init_flags & FUSE_URING_BUFPOOL;
> +	bool registered_buffers = init_flags & FUSE_URING_REGISTERED_BUFFERS;
> +
> +	if (registered_buffers && !bufpool)
> +		return false;
>  
>  	return !(init_flags & ~valid_flags);
>  }
> @@ -1487,9 +1521,10 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
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
> index 46ef3b5403fd..f4c48ff64840 100644
> --- a/fs/fuse/dev_uring_i.h
> +++ b/fs/fuse/dev_uring_i.h
> @@ -44,6 +44,8 @@ struct fuse_bufpool_buf {
>  
>  /* implemented as a buffer ring */
>  struct fuse_bufpool {
> +	bool registered_buffers;
> +
>  	/* metadata tracking state of the bufpool */
>  	unsigned int nbufs;
>  	unsigned int head;
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 5fb4a7a3772c..4347586a02b4 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -245,6 +245,7 @@
>   *  - add FUSE_URING_BUFPOOL flag
>   *  - add fuse_uring_cmd_req init struct
>   *  - add buf_id field to fuse_uring_ent_in_out struct
> + *  - add FUSE_URING_REGISTERED_BUFFERS flag
>   */
>  
>  #ifndef _LINUX_FUSE_H
> @@ -1307,6 +1308,7 @@ enum fuse_uring_cmd {
>  
>  /* fuse_uring_cmd_req flags */
>  #define FUSE_URING_BUFPOOL		(1 << 0)
> +#define FUSE_URING_REGISTERED_BUFFERS	(1 << 1)
>  
>  /**
>   * In the 80B command area of the SQE.


