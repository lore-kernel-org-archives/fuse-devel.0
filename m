Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9E13BAD88
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 12:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781265750; cv=none; b=hHVfqXEd3zWtn1gPmYLfrr7DSjvGYOMTNBGK87taPUuHV+MFT7SeICBbSLPxkoVpbJF8eUlaEH6ShrqWcXD7LfwlL0HyjBy1jhlfvg2DcgEkkVdXqiPhCVCfSpjOt0+Hm7oUhM0X7n4ie37l/LifcK/rBj7U4Llkzw5gNnq+djE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781265750; c=relaxed/simple;
	bh=iq6Hqay7jkhDlPW8LxaPbAOV4gNS7I+W5c0OGO/OzwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a2J/xhtCY12Sng4259yYP1lwG4kBjynjUgls0D2ms7458MJ/y5ST744jwdIn/gTLpwuPMN8QDp6qLCswN0P+E2Z+/P5XQK7TK7RstmqilzCxHISmRlJS5vN9h38AdhMx5ufTdDAQ3w2LNVpw0paHwCdDY8bf+flZmiH4WZb/oxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=pMrTmQ4E; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q6yTDt6T; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="pMrTmQ4E";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q6yTDt6T"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id D3AA01D000A8;
	Fri, 12 Jun 2026 08:02:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 12 Jun 2026 08:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781265738;
	 x=1781352138; bh=GswqmnRfYoLT7+kB11OoHpko9f6tK/SqDbxlrrFajuE=; b=
	pMrTmQ4EnphElJWkRdbAnQmtcr6R/YYLHXO85jBJFhug/Lvx6YnD2aF0erqX0AKA
	q7wX/0k7TRe5WeF6ihNdoKAk9bQhxTTj5Ydo51ctGTBPuzPWXPtBMtC0vEiiCLlo
	1mgHRDnBe0wnyIonY95Su5qAzc/7XZ2OdjgXiCLKy1frWY5WAzOErh9JRxOMMy5F
	w3ZeUXOZIw6JufNtAqEhf5dr0a7OrpQVju36EJN/eBGXLulRVf1RBFtxCTwos+xX
	g0yblnZPIakLvr51kXqlAk9ckExbbCiUvcfLGTkUAJGqB5JnxCIiUOOb6DT4bhQ+
	Wpx1jPNQ8xwodvwoA4rKkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781265738; x=
	1781352138; bh=GswqmnRfYoLT7+kB11OoHpko9f6tK/SqDbxlrrFajuE=; b=Q
	6yTDt6TF543T0iMYQACKduVA64JQST4m1dFy/zalmbTe03c4Rf/jfFewsq4UrfFd
	J2GcvQilt7ZebaWz8mhg31AdcQyJbHK43wFUmK/PDOyfJcBWAbe5Whx2D//4p2RC
	yH1i4GTBd/8N1RMvxFg09fxpRy3CzBqKXgnTWMIEbm3p+Pt6/2b0HFVqfwOjmMxj
	fcznwdCvycj44hWismy4z66GmU5pN1L1VrxXPGL+d2sHOCIdkepjnA+sTREvHYSx
	eEi98mCSI02C//0QulPmPebLd6Fg+HVGkIPyOzA6I6mu8D0rFzCnkLcCDwotT+6p
	s4W3E/D8jQPm0m8j1otwg==
X-ME-Sender: <xms:SvUrashvZFXQdPymonvM8pQCX_dUl7Ejlw9YVHmxqKWH3W9uic8wvg>
    <xme:SvUrar4uvi9f04WDMX_cLa9n4Q0yKdnTJV9xNCzbYYJWhDhciscAZ3vEL08WGU2eC
    pgR1KYt4RWyrFCNobvBCSxZXjXTHl3xYXuZlAvxU7OArIaTluUr>
X-ME-Received: <xmr:SvUrasYtM7Bq_nltuRvtUk5MQ_ztoAJ9nxvzI4TedIzFDu5rkDmaxyRtKLs8Lelpgd_425YJWnkEFfegx9NYZ_xQe3lYHi__KYDcldJayx7TKAOflQ>
X-ME-Proxy-Cause: dmFkZTGA1THGRLNYeVWgEwNChUghJV1HW5icbupib9aTcPkV7LsB+Wzz1nasQWFl8iJmLa
    q/Ntpwvp77LWGOO8NwHgdeFT2SPoicALh23FV5i5O2z1Iykf8QSrBcCCFCc60XrLle6xSG
    uwm4+ZMcHLN2m11hZ0cV9zIgjfMW0hrzbwmTh/AAaTDjnUw7iUKuAMNy1ZqC5edkto3pfP
    00N9IgR9Pcdcsano68BJ/qhzOmjUQksUHiTVjEt+OcvHafDYIeRB+JiuyB6r2NYEfjIOqJ
    xgWNJLjbHAvFZK9zsDgqY9XSwV0TlHR0zicA62Zop5oM2TLFIc+AMxS+5Ie/sUILQ/NKEe
    MSAlCik6kjgWW6/jrRVVklk/b1Cxw9frRO1/QoKoKHZOHmNjYdJxtcuLftLw1JsjKd9gwt
    9zqckB8XfCP48mjDkYX2W0KW/oo9jcs/yjfp38VgIuIU3QU9KGC7J1PocdFjctkC0ax9f/
    3DXkpFF3LG8SZxgtwUO++zwKYxdgXjGFaLcEre5Fp1mZBEnyJbujXNH618DCTsO4r6ChWi
    PH1UA4DFCdB1CCf/CNBC2M7FGBcM/jHAgPvTtJ4Hxct8bi+jAZ0yumf9CDbOZdZE/WODbq
    V1hypNBOAdfXYWiIVRhHfBLJ0KXVgaxbO8+fMZz3ZxgN09BPrGDWjmbQwtAw
X-ME-Proxy: <xmx:SvUrao6LE23JvTT_UvxOtNCRQp8iANwXxgdK0bqGnoj1XeuxJtTh1g>
    <xmx:SvUranC8sQDXc2ii9oV74Bs2uyvz4j9CylQkiRiypEKhU7EouIghDA>
    <xmx:SvUramc1NtaT8IAiKxTLOBtfCFWwVi55foIt5vnze6hX4TsEWuYFxw>
    <xmx:SvUrauKOPMxXskJac26NuwqcSwkdg3KoTKYGqc4MR6TSzBjaJ1yhfg>
    <xmx:SvUratbvH9AnBvb5Ymoowc6C6Qg8O72W-L2WSBG6qFD4aJm_wK1ughA2>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Jun 2026 08:02:17 -0400 (EDT)
Message-ID: <80f49e88-c342-44e7-abef-f65e84beb9b0@bsbernd.com>
Date: Fri, 12 Jun 2026 14:02:16 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu
Cc: jlayton@kernel.org, axboe@kernel.dk, fuse-devel@lists.linux.dev
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <20260522205823.1597313-8-joannelkoong@gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260522205823.1597313-8-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joanne,

I one generic question, could you also add in for which kernel branch the series is? I think I need to do the same for larger patches series as well (recent reduced-queue was based on 'miklos/for-next'). Basically 'b4 shazam' fails to apply on linux master and also fails to on 'miklos/for-next' and I don't even know what the base for the series here is

On 5/22/26 22:58, Joanne Koong wrote:
> Right now, ents and buffers are tightly coupled in fuse io-uring where
> each entry has its own dedicated payload buffer, requiring N buffers for
> N entries where each buffer must be large enough to accomodate the
> maximum payload size. This is suboptimal as most request types (lookup,
> open, release, getattr, etc) require vastly less bytes than the maximum
> payload size and some requests (unlink, rmdir, fsync, flush, etc) do not
> require payload buffers at all.
> 
> Instead of requiring a 1:1 coupling between ents and payload buffers,
> allow the server to pass in a buffer pool (a contiguous allocation of
> buffers) that the kernel will use as it wishes for servicing
> ents/requests. Buffers are now pooled and selected on demand. Entries
> only "reserve" a buffer while actively processing a request that
> requires a payload buffer. This decoupling reduces the memory usage
> requirements needed to use fuse-io-uring. It allows for future
> optimizations such as incremental buffer consumption which will allow
> non-overlapping regions of a single buffer to be used simultaneously
> across multiple ents/requests, and the possibility of multiple buffer
> sizes to be supported per ring in the future.
> 
> To use this, the server must set the FUSE_URING_BUFPOOL flag during
> registration and provide the payload buffer pool through the iovec
> payload in the first sqe. The server must set init.buf_size and
> init.nr_bufs in the struct fuse_uring_cmd_req it passes to the kernel to
> describe the buffer pool configuration. Buffer pool usage is set on a
> per-ring basis. All subsequent registration SQEs for the same ring must
> pass in consistent flags.
> 
> Internally, a buffer ring data structure is used for managing the buffer
> pool. The kernel manages buffer selection and recycling through this
> ring structure. A payload buffer is selected from the ring on demand if
> the request requires a payload buffer and recycled after the request
> completes if used.
> 
> The contiguous buffer pool passed in is partitioned into individual
> buffers according to the buf_size passed in at registration time.
> 
>   PAYLOAD BUFFER POOL (contiguous, provided via iov[1] in first sqe):
>     |<-------------- payload_size ------------>|
>     +--------- --+-----------+-----------+-----+
>     |  buf [0]   |  buf [1]  |  buf [2]  | ... |
>     |  buf_size  |  buf_size |  buf_size | ... |
>     +--------- --+-----------+-----------+-----+
> 
> The buffer ring logic is as follows:
> select:  buf = bufs[head % nbufs]; head++
> recycle: bufs[tail % nbufs] = buf; tail++
> empty:   tail == head (no buffers available)
> full:    tail - head >= nbufs
> 
> Buffer ring request flow
> ------------------------
> |  Kernel                                  |  FUSE daemon
> |                                          |
> |  [client request arrives]                |
> |  >fuse_uring_send()                      |
> |    [select payload buf from pool]        |
> |    >fuse_uring_select_buffer()           |
> |    [copy headers to ent]                 |
> |    >copy_header_to_ring()                |
> |    [copy payload to selected buf]        |
> |    >fuse_uring_copy_to_ring()            |
> |    [set buf_id in ent_in_out header]     |
> |    >io_uring_cmd_done()                  |
> |                                          |  [CQE received]
> |                                          |  [read headers]
> |                                          |  [read payload from buf_id]
> |                                          |  [process request]
> |                                          |  [write reply to header]
> |                                          |  [write reply payload to
> |                                          |    buf]
> |                                          |  >io_uring_submit()
> |                                          |   COMMIT_AND_FETCH
> |  >fuse_uring_commit_fetch()              |
> |    >fuse_uring_commit()                  |
> |     [copy reply from ring]               |
> |     >fuse_uring_recycle_buffer()         |
> |    >fuse_uring_get_next_fuse_req()       |
> 
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dev_uring.c       | 356 +++++++++++++++++++++++++++++++-------
>  fs/fuse/dev_uring_i.h     |  35 +++-
>  include/uapi/linux/fuse.h |  29 +++-
>  3 files changed, 353 insertions(+), 67 deletions(-)
> 
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index 5f407a79c280..5947b834121e 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -41,6 +41,11 @@ enum fuse_uring_header_type {
>  	FUSE_URING_HEADER_RING_ENT,
>  };
>  
> +static inline bool bufpool_enabled(struct fuse_ring_queue *queue)
> +{
> +	return queue->bufpool != NULL;
> +}
> +
>  static void uring_cmd_set_ring_ent(struct io_uring_cmd *cmd,
>  				   struct fuse_ring_ent *ring_ent)
>  {
> @@ -222,6 +227,7 @@ void fuse_uring_destruct(struct fuse_chan *fch)
>  		}
>  
>  		kfree(queue->fpq.processing);
> +		kfree(queue->bufpool);
>  		kfree(queue);
>  		ring->queues[qid] = NULL;
>  	}
> @@ -277,20 +283,113 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
>  	return res;
>  }
>  
> -static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
> -						       int qid)
> +/*
> + * sqe->addr is a ptr to an iovec array, iov[FUSE_URING_IOV_HEADERS] has the
> + * headers, iov[FUSE_URING_IOV_PAYLOAD] the payload
> + */
> +static int fuse_uring_get_iovec_from_sqe(const struct io_uring_sqe *sqe,
> +					 struct iovec iov[FUSE_URING_IOV_SEGS])
> +{
> +	struct iovec __user *uiov = u64_to_user_ptr(READ_ONCE(sqe->addr));
> +	struct iov_iter iter;
> +	ssize_t ret;
> +
> +	if (sqe->len != FUSE_URING_IOV_SEGS)
> +		return -EINVAL;
> +
> +	/*
> +	 * Direction for buffer access will actually be READ and WRITE,
> +	 * using write for the import should include READ access as well.
> +	 */
> +	ret = import_iovec(WRITE, uiov, FUSE_URING_IOV_SEGS,
> +			   FUSE_URING_IOV_SEGS, &iov, &iter);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int fuse_uring_bufpool_setup(struct io_uring_cmd *cmd,
> +				    struct fuse_ring_queue *queue)
> +{
> +	const struct fuse_uring_cmd_req *cmd_req =
> +		io_uring_sqe128_cmd(cmd->sqe, struct fuse_uring_cmd_req);
> +	unsigned int buf_size = READ_ONCE(cmd_req->init.buf_size);
> +	unsigned int nr_bufs = READ_ONCE(cmd_req->init.nr_bufs);
> +	struct iovec iov[FUSE_URING_IOV_SEGS];
> +	uintptr_t payload_addr;
> +	size_t payload_size, ring_size;
> +	struct fuse_bufpool *pool;
> +	unsigned int i;
> +	int err;
> +
> +	if (!buf_size || !nr_bufs)
> +		return -EINVAL;
> +
> +	err = fuse_uring_get_iovec_from_sqe(cmd->sqe, iov);
> +	if (err)
> +		return err;
> +
> +	payload_addr = (uintptr_t)iov[FUSE_URING_IOV_PAYLOAD].iov_base;
> +	payload_size = iov[FUSE_URING_IOV_PAYLOAD].iov_len;
> +
> +	if (payload_size < (uint64_t)buf_size * nr_bufs)
> +		return -EINVAL;
> +
> +	/* create the pool, which is managed as a ring buffer */
> +	ring_size = struct_size(pool, bufs, nr_bufs);
> +	pool = kzalloc(ring_size, GFP_KERNEL_ACCOUNT);
> +	if (!pool)
> +		return -ENOMEM;
> +
> +	/* populate the ring buffer */
> +	for (i = 0; i < nr_bufs; i++, payload_addr += buf_size) {
> +		struct fuse_bufpool_buf *buf = &pool->bufs[i];
> +
> +		buf->addr = payload_addr;
> +		buf->len = buf_size;
> +		buf->id = i;
> +	}
> +
> +	pool->nbufs = nr_bufs;
> +	pool->tail = nr_bufs;
> +
> +	queue->bufpool = pool;
> +
> +	return 0;
> +}
> +
> +/*
> + * If the queue is already registered, check that the queue was initialized with
> + * the same init flags set for this FUSE_IO_URING_CMD_REGISTER cmd. all
> + * FUSE_IO_URING_CMD_REGISTER cmds should have the same init fields set on a
> + * per-queue basis.
> + */
> +static bool queue_init_flags_consistent(struct fuse_ring_queue *queue,
> +					u64 init_flags)
> +{
> +	bool bufpool = init_flags & FUSE_URING_BUFPOOL;
> +
> +	return bufpool_enabled(queue) == bufpool;
> +}
> +
> +static struct fuse_ring_queue *
> +fuse_uring_create_queue(struct io_uring_cmd *cmd, struct fuse_ring *ring,
> +			int qid, u64 init_flags)
>  {
> +	bool use_bufpool = init_flags & FUSE_URING_BUFPOOL;
>  	struct fuse_chan *fch = ring->chan;
>  	struct fuse_ring_queue *queue;
>  	struct list_head *pq;
> +	int err;
>  
>  	queue = kzalloc_obj(*queue, GFP_KERNEL_ACCOUNT);
>  	if (!queue)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  	pq = fuse_pqueue_alloc();
>  	if (!pq) {
>  		kfree(queue);
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  	}
>  
>  	queue->qid = qid;
> @@ -308,12 +407,27 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
>  	fuse_pqueue_init(&queue->fpq);
>  	queue->fpq.processing = pq;
>  
> +	if (use_bufpool) {
> +		err = fuse_uring_bufpool_setup(cmd, queue);
> +		if (err) {
> +			kfree(pq);
> +			kfree(queue);
> +			return ERR_PTR(err);
> +		}
> +	}
> +
>  	spin_lock(&fch->lock);
> +	/* check if the queue creation raced with another thread */
>  	if (ring->queues[qid]) {
>  		spin_unlock(&fch->lock);
>  		kfree(queue->fpq.processing);
> +		kfree(queue->bufpool);
>  		kfree(queue);
> -		return ring->queues[qid];
> +
> +		queue = ring->queues[qid];
> +		if (!queue_init_flags_consistent(queue, init_flags))
> +			return ERR_PTR(-EINVAL);
> +		return queue;
>  	}
>  
>  	/*
> @@ -640,12 +754,26 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
>  				 struct fuse_ring_ent *ent, int dir,
>  				 struct iov_iter *iter)
>  {
> +	void __user *payload;
> +	size_t len;
>  	int err;
>  
> -	err = import_ubuf(dir, ent->payload, ring->max_payload_sz, iter);
> -	if (err) {
> -		pr_info_ratelimited("fuse: Import of user buffer failed\n");
> -		return err;
> +	memset(iter, 0, sizeof(*iter));
> +
> +	if (bufpool_enabled(ent->queue)) {
> +		payload = (void __user *)ent->payload_buf.addr;
> +		len = ent->payload_buf.len;
> +	} else {
> +		payload = ent->payload;
> +		len = ring->max_payload_sz;
> +	}
> +
> +	if (payload) {
> +		err = import_ubuf(dir, payload, len, iter);
> +		if (err) {
> +			pr_info_ratelimited("fuse: Import of user buffer failed\n");
> +			return err;
> +		}
>  	}
>  
>  	fuse_copy_init(cs, dir == ITER_DEST, iter);
> @@ -697,6 +825,9 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
>  		.commit_id = req->in.h.unique,
>  	};
>  
> +	if (bufpool_enabled(ent->queue))
> +		ent_in_out.buf_id = ent->payload_buf.id;
> +
>  	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_DEST, &iter);
>  	if (err)
>  		return err;
> @@ -761,6 +892,92 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
>  				   sizeof(req->in.h));
>  }
>  
> +static bool fuse_uring_req_has_payload(struct fuse_req *req)
> +{
> +	struct fuse_args *args = req->args;
> +
> +	return args->in_numargs > 1 || args->out_numargs;
> +}
> +
> +static int fuse_uring_select_buffer(struct fuse_ring_ent *ent)
> +{
> +	struct fuse_ring_queue *queue = ent->queue;
> +	struct fuse_bufpool *pool = queue->bufpool;
> +	struct fuse_bufpool_buf *buf;
> +	unsigned int tail = pool->tail, head = pool->head;
> +
> +	lockdep_assert_held(&queue->lock);
> +
> +	if (tail == head)
> +		return -ENOBUFS;
> +
> +	buf = &pool->bufs[head % pool->nbufs];
> +	pool->head++;
> +
> +	ent->payload_buf = *buf;
> +
> +	return 0;
> +}
> +
> +static void fuse_uring_recycle_buffer(struct fuse_ring_ent *ent)
> +{
> +	struct fuse_bufpool_buf *ent_payload = &ent->payload_buf;
> +	struct fuse_ring_queue *queue = ent->queue;
> +	struct fuse_bufpool_buf *buf;
> +	struct fuse_bufpool *pool;
> +
> +	lockdep_assert_held(&queue->lock);
> +
> +	if (!bufpool_enabled(queue) || !ent_payload->addr)
> +		return;
> +
> +	pool = queue->bufpool;
> +
> +	/* pool should never be full */
> +	WARN_ON_ONCE(pool->tail - pool->head >= pool->nbufs);
> +
> +	buf = &pool->bufs[(pool->tail) % pool->nbufs];
> +	*buf = *ent_payload;
> +
> +	pool->tail++;
> +
> +	memset(ent_payload, 0, sizeof(*ent_payload));
> +}
> +
> +static int fuse_uring_next_req_update_buffer(struct fuse_ring_ent *ent,
> +					     struct fuse_req *req)
> +{
> +	bool buffer_selected;
> +	bool has_payload;
> +
> +	if (!bufpool_enabled(ent->queue))
> +		return 0;
> +
> +	buffer_selected = !!ent->payload_buf.addr;
> +	has_payload = fuse_uring_req_has_payload(req);
> +
> +	if (has_payload && !buffer_selected)
> +		return fuse_uring_select_buffer(ent);
> +
> +	if (!has_payload && buffer_selected)
> +		fuse_uring_recycle_buffer(ent);
> +
> +	return 0;
> +}
> +
> +static int fuse_uring_prep_buffer(struct fuse_ring_ent *ent,
> +				  struct fuse_req *req)
> +{
> +	if (!bufpool_enabled(ent->queue))
> +		return 0;
> +
> +	/* no payload to copy, can skip selecting a buffer */
> +	if (!fuse_uring_req_has_payload(req))
> +		return 0;
> +
> +	return fuse_uring_select_buffer(ent);
> +}
> +
>  static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
>  				   struct fuse_req *req)
>  {
> @@ -829,15 +1046,26 @@ static struct fuse_req *fuse_uring_ent_assign_req(struct fuse_ring_ent *ent)
>  	struct fuse_req *req;
>  	struct fuse_ring_queue *queue = ent->queue;
>  	struct list_head *req_queue = &queue->fuse_req_queue;
> +	int err;
>  
>  	lockdep_assert_held(&queue->lock);
>  
>  	/* get and assign the next entry while it is still holding the lock */
>  	req = list_first_entry_or_null(req_queue, struct fuse_req, list);
> -	if (req)
> -		fuse_uring_add_req_to_ring_ent(ent, req);
> +	if (req) {
> +		/*
> +		 * Buffer selection may fail if all the buffers are currently saturated.
> +		 * The request will be serviced when a buffer is freed up.
> +		 */
> +		err = fuse_uring_next_req_update_buffer(ent, req);
> +		if (!err) {
> +			fuse_uring_add_req_to_ring_ent(ent, req);
> +			return req;
> +		}
> +	}
>  
> -	return req;
> +	fuse_uring_recycle_buffer(ent);
> +	return NULL;
>  }
>  
>  /*
> @@ -996,6 +1224,12 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
>  	 * fuse requests would otherwise not get processed - committing
>  	 * and fetching is done in one step vs legacy fuse, which has separated
>  	 * read (fetch request) and write (commit result).
> +	 *
> +	 * If the server is using bufpools and has populated the pool with less
> +	 * payload buffers than ents, it is possible that there may not be an
> +	 * available buffer for the next request. If so, then the fetch is a
> +	 * no-op and the next request will be serviced when a buffer becomes
> +	 * available.
>  	 */
>  	if (fuse_uring_get_next_fuse_req(ent, queue))
>  		fuse_uring_send(ent, cmd, 0, issue_flags);
> @@ -1057,32 +1291,6 @@ static void fuse_uring_do_register(struct fuse_ring_ent *ent,
>  	}
>  }
>  
> -/*
> - * sqe->addr is a ptr to an iovec array, iov[FUSE_URING_IOV_HEADERS] has the
> - * headers, iov[FUSE_URING_IOV_PAYLOAD] the payload
> - */
> -static int fuse_uring_get_iovec_from_sqe(const struct io_uring_sqe *sqe,
> -					 struct iovec iov[FUSE_URING_IOV_SEGS])
> -{
> -	struct iovec __user *uiov = u64_to_user_ptr(READ_ONCE(sqe->addr));
> -	struct iov_iter iter;
> -	ssize_t ret;
> -
> -	if (sqe->len != FUSE_URING_IOV_SEGS)
> -		return -EINVAL;
> -
> -	/*
> -	 * Direction for buffer access will actually be READ and WRITE,
> -	 * using write for the import should include READ access as well.
> -	 */
> -	ret = import_iovec(WRITE, uiov, FUSE_URING_IOV_SEGS,
> -			   FUSE_URING_IOV_SEGS, &iov, &iter);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> -}
> -
>  static struct fuse_ring_ent *
>  fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
>  			   struct fuse_ring_queue *queue)
> @@ -1107,13 +1315,6 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
>  		return ERR_PTR(err);
>  	}
>  
> -	payload = &iov[FUSE_URING_IOV_PAYLOAD];
> -	if (payload->iov_len < ring->max_payload_sz) {
> -		pr_info_ratelimited("Invalid req payload len %zu\n",
> -				    payload->iov_len);
> -		return ERR_PTR(err);
> -	}
> -
>  	err = -ENOMEM;
>  	ent = kzalloc_obj(*ent, GFP_KERNEL_ACCOUNT);
>  	if (!ent)
> @@ -1123,12 +1324,30 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
>  
>  	ent->queue = queue;
>  	ent->headers = headers->iov_base;
> -	ent->payload = payload->iov_base;
> +
> +	err = -EINVAL;
> +	if (!bufpool_enabled(queue)) {
> +		payload = &iov[FUSE_URING_IOV_PAYLOAD];
> +		if (payload->iov_len < ring->max_payload_sz) {
> +			pr_info_ratelimited("Invalid req payload len %zu\n",
> +					    payload->iov_len);
> +			kfree(ent);
> +			return ERR_PTR(err);
> +		}
> +		ent->payload = payload->iov_base;
> +	}

Let's say a confused user library would not know how to set up things and
would in one SQE register a buf pool and in another register payload and
header - should this fail with an error here? We could add that sanity
check later, though.

>  
>  	atomic_inc(&ring->queue_refs);
>  	return ent;
>  }
>  
> +static bool init_flags_valid(u64 init_flags)
> +{
> +	u64 valid_flags = FUSE_URING_BUFPOOL;
> +
> +	return !(init_flags & ~valid_flags);
> +}
> +
>  /*
>   * Register header and payload buffer with the kernel and puts the
>   * entry as "ready to get fuse requests" on the queue
> @@ -1138,6 +1357,7 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
>  {
>  	const struct fuse_uring_cmd_req *cmd_req = io_uring_sqe128_cmd(cmd->sqe,
>  								       struct fuse_uring_cmd_req);
> +	u64 init_flags = READ_ONCE(cmd_req->flags);
>  	struct fuse_ring *ring = smp_load_acquire(&fch->ring);
>  	struct fuse_ring_queue *queue;
>  	struct fuse_ring_ent *ent;
> @@ -1156,11 +1376,16 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
>  		return -EINVAL;
>  	}
>  
> +	if (!init_flags_valid(init_flags))
> +		return -EINVAL;
> +
>  	queue = ring->queues[qid];
>  	if (!queue) {
> -		queue = fuse_uring_create_queue(ring, qid);
> -		if (!queue)
> -			return err;
> +		queue = fuse_uring_create_queue(cmd, ring, qid, init_flags);
> +		if (IS_ERR(queue))
> +			return PTR_ERR(queue);
> +	} else if (!queue_init_flags_consistent(queue, init_flags)) {
> +		return -EINVAL;
>  	}
>  
>  	/*
> @@ -1325,14 +1550,18 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
>  	req->ring_queue = queue;
>  	ent = list_first_entry_or_null(&queue->ent_avail_queue,
>  				       struct fuse_ring_ent, list);
> -	if (ent)
> -		fuse_uring_add_req_to_ring_ent(ent, req);
> -	else
> -		list_add_tail(&req->list, &queue->fuse_req_queue);
> -	spin_unlock(&queue->lock);
> +	if (ent) {
> +		err = fuse_uring_prep_buffer(ent, req);
> +		if (!err) {
> +			fuse_uring_add_req_to_ring_ent(ent, req);
> +			spin_unlock(&queue->lock);
> +			fuse_uring_dispatch_ent(ent);
> +			return;
> +		}
> +	}
>  
> -	if (ent)
> -		fuse_uring_dispatch_ent(ent);
> +	list_add_tail(&req->list, &queue->fuse_req_queue);
> +	spin_unlock(&queue->lock);
>  
>  	return;
>  
> @@ -1350,6 +1579,7 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
>  	struct fuse_ring *ring = fch->ring;
>  	struct fuse_ring_queue *queue;
>  	struct fuse_ring_ent *ent = NULL;
> +	int err;
>  
>  	queue = fuse_uring_task_to_queue(ring);
>  	if (!queue)
> @@ -1382,14 +1612,16 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
>  	req = list_first_entry_or_null(&queue->fuse_req_queue, struct fuse_req,
>  				       list);
>  	if (ent && req) {
> -		fuse_uring_add_req_to_ring_ent(ent, req);
> -		spin_unlock(&queue->lock);
> -
> -		fuse_uring_dispatch_ent(ent);
> -	} else {
> -		spin_unlock(&queue->lock);
> +		err = fuse_uring_prep_buffer(ent, req);
> +		if (!err) {
> +			fuse_uring_add_req_to_ring_ent(ent, req);
> +			spin_unlock(&queue->lock);
> +			fuse_uring_dispatch_ent(ent);
> +			return true;
> +		}
>  	}
>  
> +	spin_unlock(&queue->lock);
>  	return true;
>  }
>  
> diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
> index 368f4d0790eb..46ef3b5403fd 100644
> --- a/fs/fuse/dev_uring_i.h
> +++ b/fs/fuse/dev_uring_i.h
> @@ -36,11 +36,36 @@ enum fuse_ring_req_state {
>  	FRRS_RELEASED,
>  };
>  
> +struct fuse_bufpool_buf {
> +	uintptr_t addr;
> +	unsigned int len;
> +	unsigned int id;
> +};
> +
> +/* implemented as a buffer ring */
> +struct fuse_bufpool {
> +	/* metadata tracking state of the bufpool */
> +	unsigned int nbufs;
> +	unsigned int head;
> +	unsigned int tail;
> +
> +	/* the buffers backing the pool */
> +	__DECLARE_FLEX_ARRAY(struct fuse_bufpool_buf, bufs);
> +};
> +
>  /** A fuse ring entry, part of the ring queue */
>  struct fuse_ring_ent {
> -	/* userspace buffer */
>  	struct fuse_uring_req_header __user *headers;
> -	void __user *payload;
> +	union {
> +		/* if bufpools are not used */
> +		struct {
> +			void __user *payload;
> +		};
> +		/* if bufpools are used */
> +		struct {
> +			struct fuse_bufpool_buf payload_buf;
> +		};
> +	};
>  
>  	/* the ring queue that owns the request */
>  	struct fuse_ring_queue *queue;
> @@ -99,6 +124,12 @@ struct fuse_ring_queue {
>  	unsigned int active_background;
>  
>  	bool stopped;
> +
> +	/*
> +	 * only allocated if the server registers the ring with
> +	 * FUSE_URING_BUFPOOL.
> +	 */
> +	struct fuse_bufpool *bufpool;
>  };
>  
>  /*
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index c13e1f9a2f12..5fb4a7a3772c 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -240,6 +240,11 @@
>   *  - add FUSE_COPY_FILE_RANGE_64
>   *  - add struct fuse_copy_file_range_out
>   *  - add FUSE_NOTIFY_PRUNE
> + *
> + *  7.46
> + *  - add FUSE_URING_BUFPOOL flag
> + *  - add fuse_uring_cmd_req init struct
> + *  - add buf_id field to fuse_uring_ent_in_out struct
>   */
>  
>  #ifndef _LINUX_FUSE_H
> @@ -275,7 +280,7 @@
>  #define FUSE_KERNEL_VERSION 7
>  
>  /** Minor version number of this interface */
> -#define FUSE_KERNEL_MINOR_VERSION 45
> +#define FUSE_KERNEL_MINOR_VERSION 46
>  
>  /** The node ID of the root inode */
>  #define FUSE_ROOT_ID 1
> @@ -1263,7 +1268,13 @@ struct fuse_uring_ent_in_out {
>  
>  	/* size of user payload buffer */
>  	uint32_t payload_sz;
> -	uint32_t padding;
> +
> +	/*
> +	 * if using bufpools, this is the id of the selected buffer.
> +	 * the selected buffer holds the request payload
> +	 */
> +	uint16_t buf_id;
> +	uint16_t padding;
>  
>  	uint64_t reserved;
>  };
> @@ -1294,6 +1305,9 @@ enum fuse_uring_cmd {
>  	FUSE_IO_URING_CMD_COMMIT_AND_FETCH = 2,
>  };
>  
> +/* fuse_uring_cmd_req flags */
> +#define FUSE_URING_BUFPOOL		(1 << 0)
> +
>  /**
>   * In the 80B command area of the SQE.
>   */
> @@ -1305,7 +1319,16 @@ struct fuse_uring_cmd_req {
>  
>  	/* queue the command is for (queue index) */
>  	uint16_t qid;
> -	uint8_t padding[6];
> +	uint16_t padding;
> +	uint32_t reserved;

Dunno, it was a padding up to 64 bit? Non-needed change?

> +
> +	union {
> +		struct {
> +			/* FUSE_URING_BUFPOOL: buffer pool configuration */
> +			uint32_t buf_size;
> +			uint16_t nr_bufs;
> +		} init;

If we want to support multiple buffer pools, this struct should add in a 
buffer index or at a minimum reserve a field for it. Adding in

uint16_t buf_idx; /* currently unused */ would also fill up the hole at the end.
libfuse could even already set buf_idx to 0 and then kernel could check if zero
and fail something else is set. Would save us another flag later on.


Thanks,
Bernd
