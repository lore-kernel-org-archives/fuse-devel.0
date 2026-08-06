Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F77214BF92
	for <fuse-devel@lists.linux.dev>; Thu,  6 Aug 2026 18:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041400; cv=none; b=Txcld4FnlvOTi5M3b5rkwBpeOx6RrpwqD3eFPSmyQaSKjMN/LLbx00ZYBXLWm3hHFad4z9nOQcp/UMBw3XfXruVPr5/90RdS7HeoTpSav/HLWTsMgswqLpsqda1FCKMhaEjrCv6a42cMFQSoVox4W4QIh2z589MjmC9NF0IEsW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041400; c=relaxed/simple;
	bh=JWSPYmpX1ab92iPEuUPkGkqkGxgXLcq5xA17eGGELDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPpcx7jaE+sMFQbANooyg/M07boF8EVfri+KdSpzMZvlY7Ryj38wGQEV/5bRFsm0vRwiHABWUr+6h5mii1qghDg8z0i/R6+ACA4qOOTSXBPJ521uoXEhGZK+tg42zkaMODFdC5UlWVRpm7aHVKI0MEA+rJWqW+9TWKyf5ReJNbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=nFxYvUrq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b50OAmiw; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="nFxYvUrq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b50OAmiw"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 2135EEC036F;
	Thu,  6 Aug 2026 14:36:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 06 Aug 2026 14:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786041396;
	 x=1786127796; bh=ch+s+shXF+kux3pTWuPQu0+y/ZJl95Posvo/tQB2GtU=; b=
	nFxYvUrqdP2M3clerk78j4ASLhghk91Djnny//ycgbWDsQbEn4Fy0KDYLpa6fCFi
	ztK/j+ZrhTwJLVlCqX+5L/wZFRBarHVyzCcGh1WXwHQMfzVikCZA6iSw82bPpgoW
	6a1QrsLmZncIpz2IAH+PGbVwEdQsQq0fRlzU7ak3MtgSQRiucaoxto6Jj83AxVem
	iSmHC4bwpzO+cSZQ6r84hzyYyI1hgnzL2S5ydlPedcIF+AYdxaSmW1/3c8I9ZGD7
	iN6sbWNOAidiQ7u311PoKHJT0XGyAlozA/S+uMfOSnzTR+HjA9GSWHO9UeDK44Ts
	hR0mIAAGjKX9JIKlUHkskA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786041396; x=
	1786127796; bh=ch+s+shXF+kux3pTWuPQu0+y/ZJl95Posvo/tQB2GtU=; b=b
	50OAmiwXpSn5OWrlMqaaiUQKw+JDIAK+6n65YVeBiUOeHlxaQ5pQJLWmiKU2k8Pk
	piSRwmghfmr0O6IUyVNFiQRrDlX32aMedSL49ajvLYjtKwuvfAibMuIDJnRE1mk/
	kZpwsjC4VAkIN1RZ399RMS5YeY5Csjyd+tqI8i1zvTnnmX2jlnuGrg+dxqSyIVDE
	3hbwNnBb22LivxQs5pNX6E1b0JUcQ6K+TwQ22gScH3FR2pSkNxrJaGnCaEpjANQg
	oFEmcoQOT9sYV8i0ZAssW3Nc2755Pz2/rtBC973EZ5fpXhgQRq8Pm6VbO1QYapIl
	fPxhVKN//wraWWKYd+sfg==
X-ME-Sender: <xms:MtR0auWWYZojg0IlFhWFDmaDD0CJk18ne4JKfh61jitEqsuOpZfnSg>
    <xme:MtR0arRr6qghdgeRA5gJJnpD7_DyUQaC3kOVlcsPeiTcXgA7g9RwZPaslNfTMcs5r
    BHwmkqqqogZ6dHqVIY6TZTeM7PYrfGFSpwGoHzyirNK8v8MucmY>
X-ME-Received: <xmr:MtR0agloODJU-6NXEGptcxHGwT45tlB_RQSVaV7UVh1LcNcoKAZxCnHsbLCUg7rcehc3QUWQqOSE8xiLzBroc56VOnafrXPsk4UUidumozORYrRUsw>
X-ME-Proxy-Cause: dmFkZTE9yk/vfTotqEccxgM9hYxF0A2UpWZYRwS6kfAi7/6joewEP/5+wMycA6qF05EHos
    h5VkMca4DJ9CZhGjd6k97ZLwmnc/KapL5qPA+GZY+01AIPGutjXMMBL92VRAYPKL1B87ZK
    gqhDcOaVCGRbJMJmEdSH3bTDaTF301N/Q5npnTOMH6/jbZVKHbHkLCGonXjxjlLKkTiLJf
    8huq96NIgY21wfg+52SzevYIEvfcdvE6w9ou/qV/8ojvMfqzM0rBm03wOR6MOsC/pRd9H6
    KlVw3S52axLa4gts6pyesIW+dScXiH9qhRoCeI5wLaHNkZbqREgz+SG1+YtCHZdjYcf5X/
    LCnEJVuIVtF2HnMi2JQfQ9cha1PS/Lnm3WKL9XE3Y0Re1mjMGrbu06H1c9jUldDUUiJ6Y7
    RvCQ2eLWs33kvJF8EaH2tZBmFXxK0K2JC62vfEJkmHPC8kBKpM4Aaei3CMj5Cocvr+xYKP
    0vhQuauskvgAEMMOH5cWX4f+UMpG0LpWk7JZHRZcqE2RLMNhmmR1gMMK9zwVD4mvMdL9kN
    Ek+0nJ0xWLL1eKLMAO4/tlp+CMalsLfYPo731Fsyr4lj+8ySRW1IJwYrsbkqZuYaZvOjnf
    7EikZKumM8sfluNs4rzv3ZeJkwNXxwffyfCZoUqiDzI7WqTfuk3F+lvaZAGQ
X-ME-Proxy: <xmx:MtR0ap7BFRhORbour3m7n8d5JvzLfuy9MKiIM47D1SoOJzJ5ydPTkA>
    <xmx:MtR0aui_ucJnSeObDCdNahqtLs8TEBKTX5d1iwmkI4xE7OO5XokD-A>
    <xmx:MtR0auEgynPVqe98IW6SzHYt_S_jAcV9kuCtojSrY_YPODhARJ6sng>
    <xmx:MtR0asTjkueWSw_ZZle9kUFAynYTDvwRrjpAsbXaY7bKRvGCONYcNg>
    <xmx:NNR0ap1-Y9VCEGkC2VKpU7TgUL-SktRpzj8NT3QB-OD11LsizU9dbJ2a>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 14:36:33 -0400 (EDT)
Message-ID: <865afb18-533b-4542-86f8-c77215175c41@bsbernd.com>
Date: Thu, 6 Aug 2026 20:36:32 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] fuse: add io-uring buffer pools
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-4-joannelkoong@gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260716175908.2339738-4-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/16/26 19:59, Joanne Koong wrote:
> Right now, ents and buffers are tightly coupled in fuse io-uring where
> each entry has its own dedicated payload buffer, requiring N buffers for
> N entries where each buffer must be large enough to accomodate the
> maximum payload size. This is suboptimal as most request types (lookup,
> open, release, getattr, etc) require vastly less bytes than the maximum
> payload size and some requests (unlink, rmdir, fsync, flush, etc) do not
> require payload buffers at all.
> 
> Instead of requiring a 1:1 coupling between ents and payload buffers,
> allow the server to pass in a buffer pool (a contiguous chunk of memory)
> that the kernel will use as it wishes for servicing ents/requests.
> Entries only reserve a "buffer" from the pool while actively processing
> a request that requires a payload buffer. This decoupling and letting
> the kernel delegate memory from the pool for requests allows the kernel to
> optimize memory usage and reduces the memory usage requirements needed
> to use fuse-over-io-uring.
> 
> A pool is registered per queue with the new
> FUSE_IO_URING_CMD_ADD_BUFPOOL command. The server passes the pool's base
> address and length in fuse_uring_cmd_req.bufpool.{uaddr,len}.
> 
> Internally, the kernel splits the region into buffers of
> ring->max_payload_sz bytes each (nr_bufs = pool len / max_payload_sz). A
> queue commits to a payload mode on first use: registering an entry that
> carries its own payload selects the legacy per-entry mode, while
> ADD_BUFPOOL selects pool mode. The two are mutually exclusive, so
> ADD_BUFPOOL must be issued before any payload-carrying entries are
> registered on that queue. The queue must have been created before the
> bufpool is added, through the FUSE_IO_URING_CMD_ADD_QUEUE command.
> 
> The kernel tracks free buffers with a bitmap (a set bit marks a free
> buffer). On dispatch, a request that needs a payload claims a free
> buffer (find_first_bit + clear). A request that needs none claims
> nothing. The buffer's byte offset within the pool is reported to the
> server in the new fuse_uring_ent_in_out.offset field so that the server
> can locate the payload. On completion the buffer is returned to the pool
> or reused directly if the next request on that entry also has a payload.
> 
> The FUSE_HAS_IO_URING_BUFPOOL flag advertises kernel support to the
> server for bufpools.
> 
> Buffer pool request flow
> ~~~~~~~~~~~~~~~~~~~~~~~~
> |  Kernel                                  |  FUSE daemon
> |                                          |
> |  [request arrives]                       |
> |    [claim a free pool buffer]            |
> |    >fuse_uring_select_buffer()           |
> |    [copy headers to ring]                |
> |    [copy payload to buffer]              |
> |    [report buffer offset in ent_in_out]  |
> |    >io_uring_cmd_done()                  |
> |                                          |  [read headers]
> |                                          |  [read/write payload at offset]
> |                                          |  [process request]
> |                                          |  >io_uring_submit()
> |                                          |   COMMIT_AND_FETCH
> |  >fuse_uring_commit_fetch()              |
> |    [copy reply from ring]                |
> |    [return buffer to the pool]           |
> |    >fuse_uring_recycle_buffer()          |
> 
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dev_uring.c       | 237 +++++++++++++++++++++++++++++++++-----
>  fs/fuse/dev_uring_i.h     |  37 +++++-
>  fs/fuse/inode.c           |   2 +-
>  include/uapi/linux/fuse.h |  20 +++-
>  4 files changed, 266 insertions(+), 30 deletions(-)
> 
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index fdf1058e582c..e9da92b46090 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -9,6 +9,7 @@
>  #include "dev_uring_i.h"
>  #include "fuse_trace.h"
>  
> +#include <linux/bitmap.h>
>  #include <linux/fs.h>
>  #include <linux/io_uring/cmd.h>
>  
> @@ -41,6 +42,11 @@ enum fuse_uring_header_type {
>  	FUSE_URING_HEADER_RING_ENT,
>  };
>  
> +static inline bool bufpool_enabled(struct fuse_ring_queue *queue)
> +{
> +	return queue->payload_mode == FUSE_PAYLOAD_BUFPOOL;
> +}
> +
>  static void uring_cmd_set_ring_ent(struct io_uring_cmd *cmd,
>  				   struct fuse_ring_ent *ring_ent)
>  {
> @@ -222,6 +228,7 @@ void fuse_uring_destruct(struct fuse_chan *fch)
>  		}
>  
>  		kfree(queue->fpq.processing);
> +		kfree(queue->bufpool);
>  		kfree(queue);
>  		ring->queues[qid] = NULL;
>  	}
> @@ -316,6 +323,7 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
>  	if (ring->queues[qid]) {
>  		spin_unlock(&fch->lock);
>  		kfree(queue->fpq.processing);
> +		kfree(queue->bufpool);
>  		kfree(queue);
>  		return fail_if_exists ? ERR_PTR(-EEXIST) : ring->queues[qid];
>  	}
> @@ -646,13 +654,14 @@ static int copy_header_from_ring(struct fuse_ring_ent *ent,
>  }
>  
>  static int setup_fuse_copy_state(struct fuse_copy_state *cs,
> -				 struct fuse_ring *ring, struct fuse_req *req,
> +				 struct fuse_req *req,
>  				 struct fuse_ring_ent *ent, int dir,
>  				 struct iov_iter *iter)
>  {
>  	int err;
>  
> -	err = import_ubuf(dir, ent->payload, ring->max_payload_sz, iter);
> +	err = import_ubuf(dir, ent->payload.iov_base, ent->payload.iov_len,
> +			  iter);
>  	if (err) {
>  		pr_info_ratelimited("fuse: Import of user buffer failed\n");
>  		return err;
> @@ -666,8 +675,7 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
>  	return 0;
>  }
>  
> -static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
> -				     struct fuse_req *req,
> +static int fuse_uring_copy_from_ring(struct fuse_req *req,
>  				     struct fuse_ring_ent *ent)
>  {
>  	struct fuse_copy_state cs;
> @@ -681,7 +689,7 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
>  	if (err)
>  		return err;
>  
> -	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE, &iter);
> +	err = setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter);
>  	if (err)
>  		return err;
>  
> @@ -693,7 +701,7 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
>  /*
>   * Copy data from the req to the ring buffer
>   */
> -static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
> +static int fuse_uring_args_to_ring(struct fuse_req *req,
>  				   struct fuse_ring_ent *ent)
>  {
>  	struct fuse_copy_state cs;
> @@ -707,7 +715,7 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
>  		.commit_id = req->in.h.unique,
>  	};
>  
> -	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_DEST, &iter);
> +	err = setup_fuse_copy_state(&cs, req, ent, ITER_DEST, &iter);
>  	if (err)
>  		return err;
>  
> @@ -737,6 +745,10 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
>  	}
>  
>  	ent_in_out.payload_sz = cs.ring.copied_sz;
> +	if (bufpool_enabled(ent->queue) && ent->payload.iov_base)
> +		ent_in_out.offset =
> +			(uintptr_t)ent->payload.iov_base - ent->queue->bufpool->base_uaddr;
> +
>  	return copy_header_to_ring(ent, FUSE_URING_HEADER_RING_ENT,
>  				   &ent_in_out, sizeof(ent_in_out));
>  }
> @@ -745,7 +757,6 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
>  				   struct fuse_req *req)
>  {
>  	struct fuse_ring_queue *queue = ent->queue;
> -	struct fuse_ring *ring = queue->ring;
>  	int err;
>  
>  	err = -EIO;
> @@ -760,7 +771,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
>  		return err;
>  
>  	/* copy the request */
> -	err = fuse_uring_args_to_ring(ring, req, ent);
> +	err = fuse_uring_args_to_ring(req, ent);
>  	if (unlikely(err)) {
>  		pr_info_ratelimited("Copy to ring failed: %d\n", err);
>  		return err;
> @@ -771,6 +782,91 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
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
> +	unsigned int id;
> +
> +	lockdep_assert_held(&queue->lock);
> +
> +	id = find_first_bit(pool->free_map, pool->nr_bufs);
> +	if (id >= pool->nr_bufs)
> +		return -ENOBUFS;
> +
> +	WARN_ON_ONCE(ent->payload.iov_base);
> +	__clear_bit(id, pool->free_map);
> +
> +	ent->buf_id = id;
> +	ent->payload.iov_base =
> +		(void __user *)(pool->base_uaddr + id * pool->buf_size);
> +	ent->payload.iov_len = pool->buf_size;
> +
> +	return 0;
> +}
> +
> +static void fuse_uring_recycle_buffer(struct fuse_ring_ent *ent)
> +{
> +	struct iovec *ent_payload = &ent->payload;
> +	struct fuse_ring_queue *queue = ent->queue;
> +	struct fuse_bufpool *pool;
> +
> +	lockdep_assert_held(&queue->lock);
> +
> +	if (!bufpool_enabled(queue) || !ent_payload->iov_base)
> +		return;
> +
> +	pool = queue->bufpool;
> +
> +	/* a buffer should never be recycled twice */
> +	WARN_ON_ONCE(test_bit(ent->buf_id, pool->free_map));
> +	__set_bit(ent->buf_id, pool->free_map);
> +
> +	memset(ent_payload, 0, sizeof(*ent_payload));
> +	ent->buf_id = 0;
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
> +	buffer_selected = !!ent->payload.iov_base;
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
> @@ -858,10 +954,13 @@ static struct fuse_req *fuse_uring_ent_assign_req(struct fuse_ring_ent *ent)
>  
>  	/* get and assign the next entry while it is still holding the lock */
>  	req = list_first_entry_or_null(req_queue, struct fuse_req, list);
> -	if (req)
> +	if (req && !fuse_uring_next_req_update_buffer(ent, req)) {
>  		fuse_uring_add_req_to_ring_ent(ent, req);
> +		return req;
> +	}
>  
> -	return req;
> +	fuse_uring_recycle_buffer(ent);
> +	return NULL;
>  }
>  
>  /*
> @@ -872,7 +971,6 @@ static struct fuse_req *fuse_uring_ent_assign_req(struct fuse_ring_ent *ent)
>  static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
>  			      unsigned int issue_flags)
>  {
> -	struct fuse_ring *ring = ent->queue->ring;
>  	ssize_t err = -EFAULT;
>  
>  	if (copy_header_from_ring(ent, FUSE_URING_HEADER_IN_OUT, &req->out.h,
> @@ -885,7 +983,7 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
>  		goto out;
>  	}
>  
> -	err = fuse_uring_copy_from_ring(ring, req, ent);
> +	err = fuse_uring_copy_from_ring(req, ent);
>  out:
>  	fuse_uring_req_end(ent, req, err);
>  }
> @@ -1004,6 +1102,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
>  	if (err != 0) {
>  		pr_info_ratelimited("qid=%d commit_id %llu state %d",
>  				    queue->qid, commit_id, ent->state);
> +		fuse_uring_recycle_buffer(ent);
>  		spin_unlock(&queue->lock);
>  		fuse_uring_req_end(ent, req, err);
>  		return err;
> @@ -1021,6 +1120,11 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
>  	 * fuse requests would otherwise not get processed - committing
>  	 * and fetching is done in one step vs legacy fuse, which has separated
>  	 * read (fetch request) and write (commit result).
> +	 *
> +	 * If there is no next request or if all buffers are busy (if using a
> +	 * bufpool), the cmd is not returned to userspace. The entry is left
> +	 * available and the cmd only returns to userspace when there's a
> +	 * next request and an available buffer.
>  	 */
>  	if (fuse_uring_get_next_fuse_req(ent, queue))
>  		fuse_uring_send(ent, cmd, 0, issue_flags);
> @@ -1145,11 +1249,23 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
>  	}
>  
>  	payload = &iov[FUSE_URING_IOV_PAYLOAD];
> -	if (payload->iov_len < ring->max_payload_sz) {
> -		pr_info_ratelimited("Invalid req payload len %zu\n",
> -				    payload->iov_len);
> -		return ERR_PTR(err);
> +
> +	spin_lock(&queue->lock);
> +	if (bufpool_enabled(queue)) {
> +		if (payload->iov_base || payload->iov_len) {
> +			spin_unlock(&queue->lock);
> +			return ERR_PTR(err);
> +		}
> +	} else {
> +		if (payload->iov_len < ring->max_payload_sz) {
> +			pr_info_ratelimited("Invalid req payload len %zu\n",
> +					    payload->iov_len);
> +			spin_unlock(&queue->lock);
> +			return ERR_PTR(err);
> +		}
> +		queue->payload_mode = FUSE_PAYLOAD_PER_ENT;
>  	}
> +	spin_unlock(&queue->lock);
>  
>  	err = -ENOMEM;
>  	ent = kzalloc_obj(*ent, GFP_KERNEL_ACCOUNT);
> @@ -1160,7 +1276,8 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
>  
>  	ent->queue = queue;
>  	ent->headers = headers->iov_base;
> -	ent->payload = payload->iov_base;
> +	if (queue->payload_mode == FUSE_PAYLOAD_PER_ENT)
> +		ent->payload = *payload;
>  
>  	atomic_inc(&ring->queue_refs);
>  	return ent;
> @@ -1231,6 +1348,63 @@ static int fuse_uring_add_queue(struct io_uring_cmd *cmd, struct fuse_chan *fch)
>  	return 0;
>  }
>  
> +static int fuse_uring_add_bufpool(struct io_uring_cmd *cmd,
> +				  struct fuse_chan *fch)
> +{
> +	const struct fuse_uring_cmd_req *cmd_req =
> +		io_uring_sqe128_cmd(cmd->sqe, struct fuse_uring_cmd_req);
> +	unsigned int qid = READ_ONCE(cmd_req->qid);
> +	uint64_t flags = READ_ONCE(cmd_req->flags);
> +	/* paired with the smp_store_release() in fuse_uring_create */
> +	struct fuse_ring *ring = smp_load_acquire(&fch->ring);
> +	struct fuse_ring_queue *queue;
> +	struct fuse_bufpool *pool;
> +	uintptr_t pool_uaddr;
> +	unsigned int pool_len, nr_bufs;
> +	size_t pool_size, buf_size;
> +
> +	if (!ring || qid >= ring->nr_queues || flags)
> +		return -EINVAL;
> +
> +	/* Pairs with smp_store_release() in fuse_uring_create_queue() */
> +	queue = smp_load_acquire(&ring->queues[qid]);
> +	if (!queue)
> +		return -EINVAL;
> +
> +	pool_uaddr = READ_ONCE(cmd_req->bufpool.uaddr);
> +	pool_len = READ_ONCE(cmd_req->bufpool.len);
> +
> +	/* each buffer holds the max payload size */
> +	buf_size = queue->ring->max_payload_sz;
> +
> +	nr_bufs = pool_len / buf_size;
> +	if (!nr_bufs)
> +		return -EINVAL;
> +
> +	pool_size = struct_size(pool, free_map, BITS_TO_LONGS(nr_bufs));
> +	pool = kzalloc(pool_size, GFP_KERNEL_ACCOUNT);
> +	if (!pool)
> +		return -ENOMEM;
> +
> +	pool->base_uaddr = pool_uaddr;
> +	pool->buf_size = buf_size;
> +	pool->nr_bufs = nr_bufs;
> +	/* all buffers are free */
> +	bitmap_set(pool->free_map, 0, nr_bufs);
> +
> +	spin_lock(&queue->lock);
> +	if (queue->payload_mode != FUSE_PAYLOAD_UNSET) {
> +		spin_unlock(&queue->lock);
> +		kfree(pool);
> +		return -EINVAL;
> +	}
> +	queue->bufpool = pool;
> +	queue->payload_mode = FUSE_PAYLOAD_BUFPOOL;
> +	spin_unlock(&queue->lock);
> +
> +	return 0;
> +}
> +
>  /*
>   * Entry function from io_uring to handle the given passthrough command
>   * (op code IORING_OP_URING_CMD)
> @@ -1303,6 +1477,12 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
>  			pr_info_once("FUSE_IO_URING_CMD_ADD_QUEUE failed err=%d\n",
>  				     err);
>  		return err;
> +	case FUSE_IO_URING_CMD_ADD_BUFPOOL:
> +		err = fuse_uring_add_bufpool(cmd, fch);
> +		if (err)
> +			pr_info_once("FUSE_IO_URING_ADD_BUFPOOL failed err=%d\n",
> +				     err);
> +		return err;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1336,6 +1516,7 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
>  
>  		spin_lock(&queue->lock);
>  		list_del_init(&ent->list);
> +		fuse_uring_recycle_buffer(ent);
>  		spin_unlock(&queue->lock);
>  
>  		io_uring_cmd_done(cmd, err, issue_flags);
> @@ -1397,14 +1578,17 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
>  	req->ring_queue = queue;
>  	ent = list_first_entry_or_null(&queue->ent_avail_queue,
>  				       struct fuse_ring_ent, list);
> -	if (ent)
> -		fuse_uring_add_req_to_ring_ent(ent, req);
> -	else
> -		list_add_tail(&req->list, &queue->fuse_req_queue);
> -	spin_unlock(&queue->lock);
> +	if (ent) {
> +		if (!fuse_uring_prep_buffer(ent, req)) {
> +			fuse_uring_add_req_to_ring_ent(ent, req);
> +			spin_unlock(&queue->lock);
> +			fuse_uring_dispatch_ent(ent);
> +			return;
> +		}
> +	}

Pure style, somehow "if (!fuse_uring_prep_buffer(ent, req))" reads like an
error case, *maybe*

        ent = list_first_entry_or_null(&queue->ent_avail_queue,
                                       struct fuse_ring_ent, list);
        /* no idle entry, or no free pool buffer for this req */
        if (!ent || fuse_uring_prep_buffer(ent, req)) {
                list_add_tail(&req->list, &queue->fuse_req_queue);
                spin_unlock(&queue->lock);
                return;                
        }
        
        fuse_uring_add_req_to_ring_ent(ent, req);
        spin_unlock(&queue->lock);
        fuse_uring_dispatch_ent(ent);
        return; 

err_unlock:
...

and similar in fuse_uring_ent_assign_req()

        req = list_first_entry_or_null(req_queue, struct fuse_req, list);
        if (!req || fuse_uring_next_req_update_buffer(ent, req)) {
                fuse_uring_recycle_buffer(ent);
                return NULL;
        }
        
        fuse_uring_add_req_to_ring_ent(ent, req);
        return req;


Just a pure style suggestion, though.

>  
> -	if (ent)
> -		fuse_uring_dispatch_ent(ent);
> +	list_add_tail(&req->list, &queue->fuse_req_queue);
> +	spin_unlock(&queue->lock);
>  
>  	return;
>  
> @@ -1453,10 +1637,9 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
>  	 */
>  	req = list_first_entry_or_null(&queue->fuse_req_queue, struct fuse_req,
>  				       list);
> -	if (ent && req) {
> +	if (ent && req && !fuse_uring_prep_buffer(ent, req)) {
>  		fuse_uring_add_req_to_ring_ent(ent, req);
>  		spin_unlock(&queue->lock);
> -
>  		fuse_uring_dispatch_ent(ent);
>  	} else {
>  		spin_unlock(&queue->lock);
> diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
> index d721a4fc0215..cdf56f8b38b5 100644
> --- a/fs/fuse/dev_uring_i.h
> +++ b/fs/fuse/dev_uring_i.h
> @@ -7,6 +7,8 @@
>  #ifndef _FS_FUSE_DEV_URING_I_H
>  #define _FS_FUSE_DEV_URING_I_H
>  
> +#include <linux/uio.h>
> +
>  #include "fuse_dev_i.h"
>  
>  #ifdef CONFIG_FUSE_IO_URING
> @@ -36,11 +38,38 @@ enum fuse_ring_req_state {
>  	FRRS_RELEASED,
>  };
>  
> +/* how a queue's payload buffers are provided */
> +enum fuse_queue_payload_mode {
> +	/* not yet committed (a bufpool may still be added) */
> +	FUSE_PAYLOAD_UNSET = 0,
> +	/* each entry registers its own payload buffer */
> +	FUSE_PAYLOAD_PER_ENT,
> +	/* each entry's payload buffer is assigned from a bufpool */
> +	FUSE_PAYLOAD_BUFPOOL,
> +};
> +
> +struct fuse_bufpool {
> +	/* starting uaddr of the bufpool */
> +	uintptr_t base_uaddr;
> +
> +	/* size of each buffer in the pool */
> +	size_t buf_size;
> +
> +	/* total number of buffers in the pool */
> +	unsigned int nr_bufs;
> +
> +	/* bitmap tracking which buffers are free */
> +	unsigned long free_map[];
> +};
> +
>  /** A fuse ring entry, part of the ring queue */
>  struct fuse_ring_ent {
>  	/* userspace buffer */
>  	struct fuse_uring_req_header __user *headers;
> -	void __user *payload;
> +	struct iovec payload;

Here I have a real concern. What is if fuse server sets up
really really large buffers, to thrash the CPUs? 

setup_fuse_copy_state() is now changed to 

-       err = import_ubuf(dir, ent->payload, ring->max_payload_sz, iter);
+       err = import_ubuf(dir, ent->payload.iov_base, ent->payload.iov_len,
+                         iter);

And the iov is taken as it from the SQE. Is there actually a really good
reason to have the payload as iov, at least in this series? I could imagine
it might make sense to have it as iov once we make the buf pools more
dynamically usable.

Could we restrict setup_fuse_copy_state() to ring->max_payload_sz?

> +
> +	/* buffer id in the pool, if bufpools are used. ignored otherwise */
> +	unsigned int buf_id;
>  
>  	/* the ring queue that owns the request */
>  	struct fuse_ring_queue *queue;
> @@ -99,6 +128,12 @@ struct fuse_ring_queue {
>  	unsigned int active_background;
>  
>  	bool stopped;
> +
> +	/* how this queue's payload buffers are provided */
> +	enum fuse_queue_payload_mode payload_mode;
> +
> +	/* only allocated when payload_mode == FUSE_PAYLOAD_BUFPOOL */
> +	struct fuse_bufpool *bufpool;
>  };
>  
>  /*
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index ce4891a04a37..929ddbea0eb0 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1481,7 +1481,7 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
>  	 * the reply - server is either sending IORING_OP_URING_CMD or not.
>  	 */
>  	if (fuse_uring_enabled())
> -		flags |= FUSE_OVER_IO_URING;
> +		flags |= FUSE_OVER_IO_URING | FUSE_HAS_IO_URING_BUFPOOL;
>  
>  	ia->in.flags = flags;
>  	ia->in.flags2 = flags >> 32;
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index cfb055c0c764..f7173b5d4321 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -243,6 +243,9 @@
>   *
>   *  7.46
>   *  - add FUSE_IO_URING_CMD_ADD_QUEUE
> + *  - add FUSE_HAS_IO_URING_BUFPOOL
> + *  - add fuse_uring_cmd_req bufpool struct
> + *  - add bufpool offset field to fuse_uring_ent_in_out struct
>   */
>  
>  #ifndef _LINUX_FUSE_H
> @@ -451,6 +454,7 @@ struct fuse_file_lock {
>   * FUSE_OVER_IO_URING: Indicate that client supports io-uring
>   * FUSE_REQUEST_TIMEOUT: kernel supports timing out requests.
>   *			 init_out.request_timeout contains the timeout (in secs)
> + * FUSE_HAS_IO_URING_BUFPOOL: kernel supports io-uring buffer pools
>   */
>  #define FUSE_ASYNC_READ		(1 << 0)
>  #define FUSE_POSIX_LOCKS	(1 << 1)
> @@ -498,6 +502,7 @@ struct fuse_file_lock {
>  #define FUSE_ALLOW_IDMAP	(1ULL << 40)
>  #define FUSE_OVER_IO_URING	(1ULL << 41)
>  #define FUSE_REQUEST_TIMEOUT	(1ULL << 42)
> +#define FUSE_HAS_IO_URING_BUFPOOL (1ULL << 43)
>  
>  /**
>   * CUSE INIT request/reply flags
> @@ -1266,7 +1271,9 @@ struct fuse_uring_ent_in_out {
>  
>  	/* size of user payload buffer */
>  	uint32_t payload_sz;
> -	uint32_t padding;
> +
> +	/* Offset into the bufpool, if bufpools are used */
> +	uint32_t offset;
>  
>  	uint64_t reserved;
>  };
> @@ -1298,6 +1305,9 @@ enum fuse_uring_cmd {
>  
>  	/* add a queue */
>  	FUSE_IO_URING_CMD_ADD_QUEUE = 3,
> +
> +	/* add a bufpool to a queue */
> +	FUSE_IO_URING_CMD_ADD_BUFPOOL = 4,
>  };
>  
>  /**
> @@ -1312,6 +1322,14 @@ struct fuse_uring_cmd_req {
>  	/* queue the command is for (queue index) */
>  	uint16_t qid;
>  	uint8_t padding[6];
> +
> +	union {
> +		struct {
> +			/* base address of bufpool */
> +			uint64_t uaddr;
> +			uint32_t len;
> +		} bufpool;


Ok, if we ever want to add a new bufpool, I guess we could
invent "struct { } bufpool2;". Personally I would have
preferred to have an index in here, currently always set
to 0, but not a strict requirement.



(Sorry, have to stop reviewing for today and can earliest
continue on Satturday night).

Thanks,
Bernd


