Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FB6494800
	for <fuse-devel@lists.linux.dev>; Wed, 12 Aug 2026 22:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786573822; cv=none; b=TJClhbu3QJcg/ZZ8jJBSr5iAzLuoWhcypuYZNcRLDOmKnqVXPoA4NaVMjECnp83nOuhC+2rFTZmq8pB7U7VJVQSpygNvnCk9TQR3pXBAEpazwcr6cnqpPaCD/VBuvua+GB17HDF6x1Tade8HW72t+lDGVsGO+IMoUzdDN7eWEkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786573822; c=relaxed/simple;
	bh=/9p9y6QgQ7ieuuOE4DytVu90z9qJ0rmZ5Fk3tK8Di30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rrZvxybV99iQ9M5thoT3ALekpI9/097fzhjEwA4vFXlBi6wejzhDT+LbxNbcetQspMewekl8Hre0fIYkcotfjIbMgpxpFJj+6GrFDZSUTfdnmjNwqcfEMIJJ6Mwsw0G2FFhB+UNbzwRa4/XkmFn3+7Si8+nhvjAF7Vvf6lzDpJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=XKrtcAYa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lKEKEveK; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="XKrtcAYa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lKEKEveK"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E5B301400107;
	Wed, 12 Aug 2026 18:30:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 12 Aug 2026 18:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786573815;
	 x=1786660215; bh=MzMjuzWzfj80wTplkUR3wjFLHiCyjw8ijs0yxZj7GBA=; b=
	XKrtcAYaiR6kSRlUNP3Eaba5vFpkyltI/HcMeLzxns1OTKlQrtj11lLdgLgEk6dt
	E+FHrjoR77C6TkNobE9i/kESAp4UXRPuSBkJr3Jsc+YQflPSTiMr61ml+zQ1vzBB
	XteN3YhO5nOqOnm2PnRiYm68g0dznLZb3QAorvu4hyYhxRPUJq+QhfNjsNGHBwvG
	hI4Tsrpm8+stnKFSOKYPlVkiL6KCHT0Q4TKKefqYjckL/aQWnqACrktc829dbp9R
	1AT6cV17rLhKdp35KJmywm86dS16zUHBoC3QeS/ZbWYd6jE8wJ0LacY6tMDmFiiq
	EqUXM4c5F/Fx5wO78CCpxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786573815; x=
	1786660215; bh=MzMjuzWzfj80wTplkUR3wjFLHiCyjw8ijs0yxZj7GBA=; b=l
	KEKEveKlztQognEPSU/q0ccwSuiZWwae8A15a8XEsCElB3jfXuQ9qNlNFURIQBXb
	WOTCMTLhNdKp4oExaZJ1RTUxbF3aSWykT460I+HPnRBSzGCIa2iYZ0PRcH1EVA1k
	l9bvh0AYarjy5G2u6daB8Jy9LF9qlMlwdNyFehy1riOrbCuJ/3X3lndPSkh0Umel
	4DDFvSeAgFzVDmaMHYDJctwN2eKrO+I4HaeUTa5KFuGSvj+E2+XopzS3yl0Q8Rlv
	opXTXYDVIGep/WGKfnhxGmQhsQpSYeH+oJMPqSoru1uWBNXiGGeH4z2oen+QK9zn
	Rorl5YVnQdQxrpEoi6iHg==
X-ME-Sender: <xms:9vN8as7H4AdJrxCuorysOPgzJtX83LRMFqCpqUbfJfeg2kwP4LZX4w>
    <xme:9vN8aumUz7ItLwxRHR6d2ibOIpUEDO72rcklvS3pgSkRdmhPpWzYIjmHuceYjBjeo
    sOcKhKlzVTpP4jV4mbV6RwD6CRETfPi-TkxHVjPUwslEXt6tthT>
X-ME-Received: <xmr:9vN8apqRrD54KE036XHzMoDAZ4oknq8zruJMPIdsZfo9QXleZ_PcOltPVmirMacOKKe6ogi9BW8BWCR4EAeR81IloCOyM9Cq_tGFtvdWmJ0udgZggAVbv_cbNg>
X-ME-Proxy-Cause: dmFkZTEBeYY4dx1QWP6YCO3/gIZt88woZ00o6Q1ZBpAlXWudmSombSKFs9d8cGAaw44bZy
    b5IsOSZhantmhMRX4rZhmjSB38iSkoGTD+qIhAYp9g/ncyRoeCyEspZJUQNcPAaWJijhaG
    0pfkRKpaxsLas0hdEDYDct4cnReY1gLLXhkTyeSvmMyKEzXTOO+FdRBf9OF7lrRgoJo1m3
    f/zfifb3EBELeWt1bnnCpmrYeROBh5p+/5PST9EjdnP15p4CaGuGAM5P1okU7vhhrVpOif
    Da7a6CeKkYS0nrFwMvKq6INRdvcnQRIGAJcZ9HMC+vKYsRGuTosXX8s0lG/DsD8TpU76nc
    5LGQAy+J3VmC1Ttlbg1hpeyeBHgJETZ6gHTz2YHhomXfH+QNUleEvjReRXCODD5oR1tHAO
    t5ljQuXplqpGgmtGXfSOH49Ha8JBazPGSrDNSQlL8ppv83BVSCUrwq/tV2lYcVADY9smNY
    O6qNkrBcYbIovbki3N27WXX6sYJPMvfA5OLJwoE0MUh7fLDgsSw1dZbaMWLOxiWmrCRD7x
    sKDRBn+yDM4PYc9B1x5VlU/mvDQ9qBbVabp+ExTBYrdY9QQR7DxlBqxN4JsVfpWg6HSXKV
    LA3N2tK60YNf7pdCK0INrEPqxH4tJbgAuG/jRrkAdA2D5ufZNuE91lRTV7HQ
X-ME-Proxy: <xmx:9vN8alu6j9JRksuHfywgnIENeqsmoToXZAuH3XcL10MRH98p-NIyKA>
    <xmx:9vN8amF2XvLfTGXwBPsc2YzSGkAEJ9gH8yqokQCwh22ZxxXpcKvbTQ>
    <xmx:9vN8amaIaN4hZr_VJb4jVyrAiBYk7m7Eh6r2NxccLH0azgiMJvibXQ>
    <xmx:9vN8amV1omJNen-BjnX_9qD6pVyxQcaihHqgZv9fM8TuJovlIGb4JA>
    <xmx:9_N8alqYFXgArL9DhhonP_rB8qv33KK7q8HehIOfN8puDpG5W4TIOWT0>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 18:30:12 -0400 (EDT)
Message-ID: <777e9671-aff7-41e7-911c-dc3aacc877f3@bsbernd.com>
Date: Thu, 13 Aug 2026 00:30:11 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] fuse: add zero-copy over io-uring
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-6-joannelkoong@gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260716175908.2339738-6-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/16/26 19:59, Joanne Koong wrote:
> Implement zero-copy in fuse io-uring to eliminate memory copies between
> the application, kernel, and server for read/write operations. The
> server can directly access client pages or page cache folios without
> copying data through an intermediary buffer. When a fuse request arrives,
> the kernel registers the relevant pages into a sparse slot in the
> server's io_uring registered buffer table. The server can then operate
> on these pages directly using io-uring fixed buffer operations (eg
> read_fixed/write_fixed) and the kernel unregisters these pages when the
> request completes. Non-page-backed args (eg op out headers) will go
> through the payload buffer as normal. The server can specify which open
> files should have their reads/writes go through zero-copy, by setting
> the FOPEN_IO_URING_ZERO_COPY flag when servicing opens.
> 
> This requires CAP_SYS_ADMIN and bufpools. This is gated behind
> CAP_SYS_ADMIN because zero-copy allows the server direct access to the
> client's underlying pages, rather than operating on an intermediary
> buffer that the contents of the client's pages were copied into or on
> page cache folios.
> 
> The request flow for the zero-copy direct-io write path (client writes
> data, server reads it) is as follows:
> =======================================================================
> |  Kernel                                   |  FUSE server
> |                                           |
> |  "write(fd, buf, 1MB)"                    |
> |                                           |
> |  >sys_write()                             |
> |    >fuse_file_write_iter()                |
> |      >fuse_send_one()                     |
> |        [req->args->in_pages = true]       |
> |        [folios hold client write data]    |
> |                                           |
> |  >fuse_uring_copy_to_ring()               |
> |    >copy_header_to_ring(IN_OUT)           |
> |      [memcpy fuse_in_header]              |
> |    >copy_header_to_ring(OP)               |
> |      [memcpy write_in header]             |
> |                                           |
> |    >fuse_uring_args_to_ring()             |
> |      >setup_fuse_copy_state()             |
> |        [skip_folio_copy = true]           |
> |                                           |
> |      >fuse_uring_set_up_zero_copy()       |
> |        [folio_get for each client folio]  |
> |        [build bio_vec array from folios]  |
> |        >io_buffer_register_bvec()         |
> |          [register pages at
>                  ent->zero_copy_index]      |
> |        [ent->zero_copied = true]          |
> |                                           |
> |      >fuse_copy_args()                    |
> |        [skip_folio_copy => return 0       |
> |         for page arg, skip data copy]     |
> |                                           |
> |    >copy_header_to_ring(RING_ENT)         |
> |      [memcpy ent_in_out]                  |
> |    >io_uring_cmd_done()                   |
> |                                           |
> |                                           | [CQE received]
> |                                           |
> |                                           | [issue io_uring READ at
> |                                           |  ent->zero_copy_index]
> |                                           | [reads directly from
> |                                           |client's pages (ZERO_COPY)]
> |                                           |
> |                                           | [write data to backing
> |                                           | store]
> |                                           |  [submit COMMIT AND FETCH]
> |                                           |
> |  >fuse_uring_commit_fetch()               |
> |    >fuse_uring_commit()                   |
> |      >fuse_uring_copy_from_ring()         |
> |    >fuse_uring_req_end()                  |
> |      >io_buffer_unregister(ent->zero_copy_index) |
> |        [unregister pages from index]      |
> |      >fuse_zero_copy_release()            |
> |        [folio_put for each folio]         |
> |      [ent->zero_copied = false]           |
> |      >fuse_request_end()                  |
> |        [wake up client]                   |
> 
> The zero-copy read path is analogous.
> 
> Some requests may have both page-backed args and non-page-backed args.
> For these requests, the page-backed args are zero-copied while the
> non-page-backed args are copied to the buffer selected from the buffer
> pool:
>     zero-copy: pages registered via io_buffer_register_bvec()
>     non-page-backed: copied to payload buffer via fuse_copy_args()
> 
> For a request whose payload is zero-copied, the
> registration/unregistration path looks like:
> 
>     register:  fuse_uring_set_up_zero_copy()
>                  folio_get() for each folio
>                  io_buffer_register_bvec(ent->zero_copy_index)
> 
>     unregister: fuse_uring_req_end()
>                   io_buffer_unregister(ent->zero_copy_index)
>                   -> fuse_zero_copy_release() callback
>                      folio_put() for each folio
> 
> Please note that on abort for in-flight zero-copied requests that have
> been sent to userspace, the registered bvec slot remains occupied and
> its folios remain pinned until the io-uring ring is destroyed, at which
> point io-uring unregisters all buffers and the fuse_zero_copy_release()
> callback drops the folio references. Unregistering at teardown would
> require operating on the ring context directly, whose validity is hard
> to ascertain; this is deemed not worth the complexity for the abort
> race, since everything is freed when the ring is torn down.
> 
> The throughput improvement from zero-copy depends on how much of the
> per-request latency is spent on data copying vs backing I/O. The gain
> comes from eliminating the payload-buffer memcpy,  but accessing the
> zero-copied pages requires the server to issue the read/write as an
> IORING_OP_READ/WRITE_FIXED operation. The benefit is largest when the
> mempcy is a meaningful fraction of per-request latency while backing i/o
> is still noticable enough that the extra io-uring op's overhead doesn't
> dominate.
> 
> Benchmarked with passthrough_hp (--nopassthrough, q_depth=8) on a
> 2-socket Intel Xeon Gold 6138 (40 cores / 80 threads), using fio (sync
> engine, bs=1M, O_DIRECT, numjobs=2, 30s run + 10s ramp, 3 runs) where
> direct-I/O throughput is against a RAM-backed (tmpfs) source (backing
> I/O is not the bottleneck):
> 
> 		baseline   registered-buf   zero-copy   (zc vs base)
> direct read     ~5.1 GB/s  ~5.4 GB/s        ~8.9 GB/s   (+75%)
> direct write    ~3.4 GB/s  ~4.8 GB/s        ~5.1 GB/s   (+50%)
> 
> Reads end up higher than writes because the backing store reads faster
> than it writes (the baseline shows the same read>write gap, and the raw
> device does too). On a device-bound NVMe (~2 GB/s reads) the read gain
> shrinks to ~10-16% (and no measurable gains for writes), as backing I/O
> rather than the eliminated copy dominates latency.
> 
> The benefit overall scales with how much of the
> per-request latency is the data copy versus backing I/O.
> 
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/args.h            |   2 +
>  fs/fuse/dev.c             |  19 +++-
>  fs/fuse/dev_uring.c       | 181 +++++++++++++++++++++++++++++++++++---
>  fs/fuse/dev_uring_i.h     |   6 ++
>  fs/fuse/file.c            |   2 +
>  fs/fuse/fuse_dev_i.h      |   1 +
>  include/uapi/linux/fuse.h |  34 +++++++
>  7 files changed, 229 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/fuse/args.h b/fs/fuse/args.h
> index ecfe51a192af..5173264a1261 100644
> --- a/fs/fuse/args.h
> +++ b/fs/fuse/args.h
> @@ -42,6 +42,8 @@ struct fuse_args {
>  	bool is_pinned:1;
>  	bool invalidate_vmap:1;
>  	bool abort_on_kill:1;
> +	/* server requested io-uring zero-copy for this op */
> +	bool zero_copy:1;
>  	struct fuse_in_arg in_args[4];
>  	struct fuse_arg out_args[2];
>  	void (*end)(struct fuse_args *args, int error);
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index d50792162d8b..3d1910a9db52 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1247,11 +1247,20 @@ int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
>  
>  	if (folio) {
>  		size = folio_size(folio);
> -		if (zeroing && count < size)
> -			folio_zero_range(folio, 0, size);
> +		if (zeroing && count < size) {

This function is quite complex and long, maybe a comment here

/* io-uring zery-copy */

> +			if (cs->skip_folio_copy) {
> +				if (offset)
> +					folio_zero_range(folio, 0, offset);
> +				if (offset + count < size)
> +					folio_zero_range(folio, offset + count,
> +							 size - offset - count);

Maybe
folio_zero_segments(folio, 0, offset, offset + count, size);

> +			} else {
> +				folio_zero_range(folio, 0, size);
> +			}
> +		}
>  	}
>  
> -	while (count) {
> +	while (!cs->skip_folio_copy && count) {

For readibility and also to let the compiler know that
cs->skip_folio_copy never changes, maybe at the top of the function

const bool uring_zero_copy = cs->skip_folio_copy;

and then

while (!uring_zero_copy && count) {


Also would avoid the comment I asked for above.

>  		if (cs->write && cs->pipebufs && folio) {
>  			/*
>  			 * Can't control lifetime of pipe buffers, so always
> @@ -1344,6 +1353,10 @@ int fuse_copy_args(struct fuse_copy_state *cs, unsigned numargs,
>  	for (i = 0; !err && i < numargs; i++)  {
>  		struct fuse_arg *arg = &args[i];
>  		if (i == numargs - 1 && argpages)
> +			/*
> +			 * if cs->skip_folio_copy is set, this just does any
> +			 * needed zeroing. No copying is involved.
> +			 */
>  			err = fuse_copy_folios(cs, arg->size, zeroing);
>  		else
>  			err = fuse_copy_one(cs, arg->value, arg->size);
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index ed7e783bd68d..d7d517497a1e 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -23,6 +23,7 @@ MODULE_PARM_DESC(enable_uring,
>  #define FUSE_URING_IOV_PAYLOAD 1
>  
>  #define FUSE_URING_ADD_BUFPOOL_FLAGS	(FUSE_URING_REGISTERED_BUFPOOL)
> +#define FUSE_URING_ADD_QUEUE_FLAGS	(FUSE_URING_ZERO_COPY)
>  
>  bool fuse_uring_enabled(void)
>  {
> @@ -33,6 +34,11 @@ struct fuse_uring_pdu {
>  	struct fuse_ring_ent *ent;
>  };
>  
> +struct fuse_zero_copy_bvs {
> +	unsigned int nr_bvs;
> +	struct bio_vec bvs[];
> +};
> +
>  static const struct fuse_iqueue_ops fuse_io_uring_ops;
>  
>  enum fuse_uring_header_type {
> @@ -115,8 +121,36 @@ static void fuse_uring_flush_bg(struct fuse_ring_queue *queue)
>  	}
>  }
>  
> +static bool can_zero_copy_req(struct fuse_ring_ent *ent, struct fuse_req *req)
> +{
> +	struct fuse_args *args = req->args;
> +
> +	if (!ent->queue->zero_copy || !args->zero_copy)
> +		return false;
> +
> +	if (args->opcode != FUSE_READ && args->opcode != FUSE_WRITE)
> +		return false;
> +
> +	return args->in_pages || args->out_pages;
> +}
> +
> +static void zero_copy_unregister(struct io_uring_cmd *cmd,
> +				 struct fuse_ring_ent *ent,
> +				 unsigned int issue_flags)
> +{
> +	if (ent->zero_copied) {
> +		int err = io_buffer_unregister(cmd, ent->zero_copy_index,
> +					       issue_flags);
> +
> +		if (err)
> +			pr_warn_ratelimited("qid=%d zero-copy unregister failed: %d\n",
> +					    ent->queue->qid, err);
> +		ent->zero_copied = false;
> +	}
> +}
> +
>  static void fuse_uring_req_end(struct fuse_ring_ent *ent, struct fuse_req *req,
> -			       int error)
> +			       int error, unsigned int issue_flags)
>  {
>  	struct fuse_ring_queue *queue = ent->queue;
>  	struct fuse_ring *ring = queue->ring;
> @@ -136,6 +170,8 @@ static void fuse_uring_req_end(struct fuse_ring_ent *ent, struct fuse_req *req,
>  
>  	spin_unlock(&queue->lock);
>  
> +	zero_copy_unregister(ent->cmd, ent, issue_flags);
> +
>  	if (error)
>  		req->out.h.error = error;
>  
> @@ -311,7 +347,7 @@ void fuse_uring_conn_init(struct fuse_chan *fch)
>  }
>  
>  static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
> -						       int qid,
> +						       int qid, bool zero_copy,
>  						       bool fail_if_exists)
>  {
>  	struct fuse_chan *fch = ring->chan;
> @@ -330,6 +366,7 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
>  	queue->qid = qid;
>  	queue->ring = ring;
>  	spin_lock_init(&queue->lock);
> +	queue->zero_copy = zero_copy;
>  
>  	INIT_LIST_HEAD(&queue->ent_avail_queue);
>  	INIT_LIST_HEAD(&queue->ent_commit_queue);
> @@ -715,6 +752,9 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
>  
>  	fuse_copy_init(cs, dir == ITER_DEST, iter);
>  
> +	if (ent->zero_copied)
> +		cs->skip_folio_copy = true;
> +
>  	cs->is_uring = true;
>  	cs->req = req;
>  
> @@ -746,6 +786,62 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
>  	return err;
>  }
>  
> +static void fuse_zero_copy_release(void *priv)
> +{
> +	struct fuse_zero_copy_bvs *zc_bvs = priv;
> +	unsigned int i;
> +
> +	for (i = 0; i < zc_bvs->nr_bvs; i++)
> +		folio_put(page_folio(zc_bvs->bvs[i].bv_page));
> +
> +	kfree(zc_bvs);

kvfree (see below)?

> +}
> +
> +static int fuse_uring_set_up_zero_copy(struct fuse_ring_ent *ent,
> +				       struct fuse_req *req,
> +				       unsigned int issue_flags)
> +{
> +	struct fuse_args_pages *ap;
> +	int err, i, ddir = 0;
> +	struct fuse_zero_copy_bvs *zc_bvs;
> +	struct bio_vec *bvs;
> +
> +	/* out_pages indicates a read, in_pages indicates a write */
> +	if (req->args->out_pages)
> +		ddir |= IO_BUF_DEST;
> +	if (req->args->in_pages)
> +		ddir |= IO_BUF_SOURCE;
> +
> +	ap = container_of(req->args, typeof(*ap), args);
> +
> +	zc_bvs = kmalloc(struct_size(zc_bvs, bvs, ap->num_folios),
> +			 GFP_KERNEL_ACCOUNT);

Assuming one folio per page and 1MB max_nr_pages:

struct_size(zc_bvs, bvs, n) == 8 + 16 * 256 = 4104

Shouldn't this be kvmalloc()?


(otherwise looks good, will do another review in the morning, though).


Thanks,
Bernd
