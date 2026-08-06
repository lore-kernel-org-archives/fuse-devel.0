Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D00C485CD1
	for <fuse-devel@lists.linux.dev>; Thu,  6 Aug 2026 17:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036931; cv=none; b=odzGOQbrnh31AK6O67gjNjhNdTEoGy6rY8zb9C+yPi2x5+0ZCUtF3pg138N7SoFgR6tgVz8nLu/b688scYcTlZinHQedmfV8skLg3JNXPSYujqHCUsGiwRp4Axf4MENjix0p3fYzlckDIPhPWEUCrWBezg5OqgteM6eoP+t7w7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036931; c=relaxed/simple;
	bh=yAshXHgwe0P77HCy/ESAV/lQZqHwbPF9HmkdK/u5Px4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A6Yc9fpXyEaJwgaku4ETPDTNgSjjAvu1i2fiZn3sGV1I1pHOBt8Do/vhM82PRX5tCRiHVAE8k/OXnCZnbSr9rTmYVwOSnOo+n5F6U8vGpoMkyWuC9OtkXSdOX9vkzQF3WtXxlIiRSCG5Ztg3+oGsjF/cU9UxLGlAntvbqnTZgcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=OTpbM2G2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ou8rog4H; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="OTpbM2G2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ou8rog4H"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 0ADF7EC01DA;
	Thu,  6 Aug 2026 13:22:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 06 Aug 2026 13:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786036927;
	 x=1786123327; bh=jrkbh39YcLDz4vepDJnwMwg68BomYxrb55Fj9QMMeBY=; b=
	OTpbM2G22XFUr9riaX+iTFuQzmCm/zAo2d4itzbBnMdtRKbzY1vf2uGaDLQtux5g
	lraA4vDZXqd2w+u+Ttbm8pxwCbte1DehvmBvEKgWw26XBHWqNaRe01m2lAwI1B7p
	KdzBmNZVis2iMDzZd0arn1FY60sv00d8AqN1c20dswL7DRFYgNn3VP7N8k48SZnq
	BVYrALhzY9Abx6IWVia0jgCUAnXlbVBcjCHe+rQezxyK1h8m//yEw20WJr1xnHgG
	f+rlCT60cJX4rQ9KY5zkxPwcKSKMxGeMmoa3jPCbdylTBF27Y4UzKsb27/epzk4D
	PX69eGsB/iabg6cjkorcOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786036927; x=
	1786123327; bh=jrkbh39YcLDz4vepDJnwMwg68BomYxrb55Fj9QMMeBY=; b=O
	u8rog4HbutZwxIdJCeiDMMSOF1UhH0NrZyirMO4FCYHwaCmrhTJTtojqUhRMryOh
	ok4vDYUMi4BUOb57qTulnf4oWXzbNvY7YH9ApunTIrwh78bAHeTf+Lwg7SGp18V2
	QF8peqTkm4pLnXnkKEQmc9YsIk1QjnLO8XXZprWguHiZu1JtDwJVghXG58nUVEuA
	71ispo7IArkgWbsqD7sDGz+nsmuhi3iCd1m0Lvu1dr82vx4U58ZHWELA1BDN4gUN
	oX4c9gcl6OtE9sA1E2Nl6rCSgDtx2m2Q9Xf+ZKiLNK9MWnDIpz9Ca67c+L/N5N/9
	y+yYHgR25d5yovTuKXtyQ==
X-ME-Sender: <xms:vcJ0ane4JNxsRBc0SglY-_6jEzqXFeOeiDpDp6_MvB4PBfru8ewP4g>
    <xme:vcJ0at7iwIeHow4wBWgWojiDLpIAUgXcQ5NDP8fRcX6qO8sl0gGdEMSk9ZWZ_aXPP
    0uLCd77fB6l5UK1uX8ZUyWDFh5rCTa_Z2zMC3Gka0B51tCJg9k>
X-ME-Received: <xmr:vcJ0auvgUAnrcRCMshdVzcxh4FfZqzCV_OmEufne2fudNiTreuUTMO_D9GoAx0_tQqEThb6yMF9RKfTTMmktKNtkXsNCYloc_xN2e1Sd6dENG9v3PA>
X-ME-Proxy-Cause: dmFkZTGzU6kS04D8Dp079GgmhSU0AXermQsnexqHgEv3Jdf1Va4hNhQ3RxJsGatgVxcNQ6
    pfJ7ukm5SK9VTGcJd2oMVJIMn8MdjOW28q+xRqFEpZBGBoCW6KMC4YmdwkFHyo1y0Vdszk
    WakDcs016BEmyxHMa8ryIiwky32fFZ2p+QcmNqVXCTKgmZL6dtiQ87qtzYFm6acCj6FqrW
    1aRXH6aesHozpKOfZNjMTfNFW4MfNOmw1Aw1ryWnk5bG7L0Qh3hfvwNBTk8zmj1boD9JC0
    NRWYz2FfaxQL5jdpPdxzohILhsKoNPi4u81CPmZueJcdXBoQUbULqDrxJ1pGzft3DJu4Vt
    +eSuk2gccV6dB0jQtiGYFAK+FhxsPAiFRhlWQZIkuU+eaYmf+sZPM15wS5FoUCN71zLueh
    JAQf/BNws3aU2PE2Ys9Hvrqkc41DOdwBcXujBxIQHeH7RyvaGaY+akRDtZ+FRhoMXzttum
    /tJ0k20ln69vf3Omc4jAaPF8fcIgjXEwnUn9sbTsrxME7Se88QrLjvruHzTSTd+uLrRn2t
    0kTHDs76Ij2TIqCkZwvWFS2FzyFFSbBhucjk/1duh/fenq91Gj9hMJ0gFBQWrNncw4y1Rt
    hJvUgqZDeWuWam3iphnlngnxYvGz9TrQM9peJPeh8YJ56W18sE1NEFWm1/NQ
X-ME-Proxy: <xmx:vcJ0athFdBYduJdQ0KlP8zS-PSixYbapiBhsElbG9VkfnLXGjEd0Rg>
    <xmx:vcJ0apooPC1DMtFl4W917F1Bg3_6fWACDq0I1nAydMgOZNU9C9lvdw>
    <xmx:vcJ0aqugeNfFPzXEs6Dd8jHI998sdSzUk2-x3gk3xeXS6OA52vh44w>
    <xmx:vcJ0asbI5hlwkd2Cxe7y5JvK2QuhMlP2TQZhhEWHs_LRxjb9r8O3wg>
    <xmx:v8J0avKXYvCNCkVBvCiHCbypT9ThygrX691JEKgsp2pdntPlTzTpAVDn>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 13:22:04 -0400 (EDT)
Message-ID: <fd18502f-7c9d-4cd0-af48-408eef3d5b5d@bsbernd.com>
Date: Thu, 6 Aug 2026 19:22:04 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] fuse: add FUSE_IO_URING_CMD_ADD_QUEUE
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-3-joannelkoong@gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260716175908.2339738-3-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/16/26 19:59, Joanne Koong wrote:
> fuse-over-io-uring queues are currently created lazily, as a side effect
> of the first FUSE_IO_URING_CMD_REGISTER command for a given qid. This
> ties queue creation to entry registration.
> 
> Add a FUSE_IO_URING_CMD_ADD_QUEUE command so a server can create a queue
> explicitly, decoupling queue setup from entry registration. This is
> additionally a prerequisite for FUSE_IO_URING_CMD_ADD_BUFPOOL, which
> attaches a buffer pool to an existing queue and therefore needs the
> queue to have been created first.
> 
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dev_uring.c       | 45 +++++++++++++++++++++++++++++++++------
>  include/uapi/linux/fuse.h |  8 ++++++-
>  2 files changed, 45 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index b7c6100c4176..fdf1058e582c 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -281,7 +281,8 @@ void fuse_uring_conn_init(struct fuse_chan *fch)
>  }
>  
>  static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
> -						       int qid)
> +						       int qid,
> +						       bool fail_if_exists)
>  {
>  	struct fuse_chan *fch = ring->chan;
>  	struct fuse_ring_queue *queue;
> @@ -289,11 +290,11 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
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
> @@ -316,7 +317,7 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
>  		spin_unlock(&fch->lock);
>  		kfree(queue->fpq.processing);
>  		kfree(queue);
> -		return ring->queues[qid];
> +		return fail_if_exists ? ERR_PTR(-EEXIST) : ring->queues[qid];
>  	}
>  
>  	/*
> @@ -1189,9 +1190,9 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
>  
>  	queue = READ_ONCE(ring->queues[qid]);
>  	if (!queue) {
> -		queue = fuse_uring_create_queue(ring, qid);
> -		if (!queue)
> -			return -ENOMEM;
> +		queue = fuse_uring_create_queue(ring, qid, false);
> +		if (IS_ERR(queue))
> +			return PTR_ERR(queue);
>  	}
>  
>  	/*
> @@ -1206,6 +1207,30 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
>  	return fuse_uring_do_register(ent, cmd, issue_flags);
>  }
>  
> +static int fuse_uring_add_queue(struct io_uring_cmd *cmd, struct fuse_chan *fch)
> +{
> +	const struct fuse_uring_cmd_req *cmd_req =
> +		io_uring_sqe128_cmd(cmd->sqe, struct fuse_uring_cmd_req);
> +	struct fuse_ring *ring = smp_load_acquire(&fch->ring);
> +	unsigned int qid = READ_ONCE(cmd_req->qid);
> +	uint64_t flags = READ_ONCE(cmd_req->flags);
> +	struct fuse_ring_queue *queue;
> +
> +	if (!ring || flags)
> +		return -EINVAL;
> +
> +	if (qid >= ring->nr_queues) {
> +		pr_info_ratelimited("fuse: Invalid ring qid %u\n", qid);
> +		return -EINVAL;
> +	}
> +
> +	queue = fuse_uring_create_queue(ring, qid, true);
> +	if (IS_ERR(queue))
> +		return PTR_ERR(queue);
> +
> +	return 0;
> +}
> +
>  /*
>   * Entry function from io_uring to handle the given passthrough command
>   * (op code IORING_OP_URING_CMD)
> @@ -1272,6 +1297,12 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
>  			return err;
>  		}
>  		break;
> +	case FUSE_IO_URING_CMD_ADD_QUEUE:
> +		err = fuse_uring_add_queue(cmd, fch);
> +		if (err)
> +			pr_info_once("FUSE_IO_URING_CMD_ADD_QUEUE failed err=%d\n",
> +				     err);
> +		return err;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index c13e1f9a2f12..cfb055c0c764 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -240,6 +240,9 @@
>   *  - add FUSE_COPY_FILE_RANGE_64
>   *  - add struct fuse_copy_file_range_out
>   *  - add FUSE_NOTIFY_PRUNE
> + *
> + *  7.46
> + *  - add FUSE_IO_URING_CMD_ADD_QUEUE
>   */
>  
>  #ifndef _LINUX_FUSE_H
> @@ -275,7 +278,7 @@
>  #define FUSE_KERNEL_VERSION 7
>  
>  /** Minor version number of this interface */
> -#define FUSE_KERNEL_MINOR_VERSION 45
> +#define FUSE_KERNEL_MINOR_VERSION 46
>  
>  /** The node ID of the root inode */
>  #define FUSE_ROOT_ID 1
> @@ -1292,6 +1295,9 @@ enum fuse_uring_cmd {
>  
>  	/* commit fuse request result and fetch next request */
>  	FUSE_IO_URING_CMD_COMMIT_AND_FETCH = 2,
> +
> +	/* add a queue */
> +	FUSE_IO_URING_CMD_ADD_QUEUE = 3,
>  };
>  
>  /**


Reviewed-by: Bernd Schubert <bernd@bsbernd.com>

