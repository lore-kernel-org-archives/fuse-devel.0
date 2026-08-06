Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D2546A60A
	for <fuse-devel@lists.linux.dev>; Thu,  6 Aug 2026 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036573; cv=none; b=m92xN6abc2lttof8hpctmvTEVJAT3E1tm3Uls82AZGImw3iaDG2YjBM4sNbiZUgkv4veiiYhGlOerf2Pq4HAM2IW9e5Ihmsm4sdRS+Apf/3C/MPAkGKdzphKahRwfmz2iBx6+poIYNKM+nUqVJeZz1Q8sMY9z++jOvfQh4FyA14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036573; c=relaxed/simple;
	bh=G5a3bxBFh4kdO6SVvsJSgDtiVQtkx06O5WoBfnXowOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FMWnr85BjrDV6klF9rilXtu+ok8YeDWp1PjHTP6WIksNg7Rq1br4gRoRQcotLAkLezysTdjrSJqNIJ+fyINp/uILgHpVh7ECMr8PESZPuOukBnpeoPTt0ru25Rg7ipkc7TuJ+cxJ/yXJ72OlK59h9JZcMRvaDZhrOjLehJ0Kdr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=e74RlkRw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PkCwj1tz; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="e74RlkRw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PkCwj1tz"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 10C90EC011A;
	Thu,  6 Aug 2026 13:16:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 06 Aug 2026 13:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786036570;
	 x=1786122970; bh=uZMTA7XwD6A0AJFjzrMiTiyyMXR0vaRbc5NiaKiclbE=; b=
	e74RlkRwhA5VcykUYJzCVhGHjeo8Oi3T+tvtRblZpuQloS6Zzmn+0wkfw54VIG8M
	lez34ovDGfbIH4cvx1B12iDLBNcTJ/2eBBZlQsZl/7rCjKbzZIgfHCm7PiqRbXYY
	SamsX8S+BS4QXkI+ABVTfgRLY0OgTnOfJ/NG8G1+owm4ejjg0B5eLHl5dxQYzsfJ
	LTO1j+2YYsssaKBm1cpAP2KNR6IhsrS7NxapBrQsCM4mA7JLhEeFUkioy5JrrlKP
	h+s6xndTJO9AfMNigeH7Ew1DSb9/k1lBLb+0/fdRPziRchEH0ZXbXmuJH/yKtGWw
	fiX/Z3E1aX5FiYQE/ElJ0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786036570; x=
	1786122970; bh=uZMTA7XwD6A0AJFjzrMiTiyyMXR0vaRbc5NiaKiclbE=; b=P
	kCwj1tze9MFE5OcLLNd4y/JM3M4UiCdD129ZAmmfEMGY1NWv6i5mvXFTR0puIlkf
	N68/25MkHwboWzyQ1ugwIPd441yWNh7xIN/UgFWRQCmC8adchvwtRS6V2S/EGsat
	8PnMbRs4QDZTkAhnV5sKVXye2EslXGb2XrjdPRLRVaOqBbipupeXz7prwvsV/WyU
	8z4ooAV+ux9EkbokzshrAC+Lnh4DY1vugCckHnaKVHP+jlhMdmL1nrsAXMKRO/GE
	okQne5AVt3cZIqRfFhAtIb06lSpeAYhzkis+71/0ac8Lk8cpFjtPKF0Rj2wZ2oNL
	hyGLpeDFq5QA90VpL1RPA==
X-ME-Sender: <xms:WMF0apKsMHKDn2Zo7PUDFUJ6Es-FANGi6nKJewN7x8zQt2DC4m9TVw>
    <xme:WMF0al0UDJt6_oEgumz_MAu3STr0K23yZeXwi4NmVFW9p6dMOhGVN67HtruC3mFUL
    ntFdbEZtqriTM1j8OcTEL0SR_FQTPcloHtd9WIEUmrIXbj7_F1y>
X-ME-Received: <xmr:WMF0av4N4ZHxUwKMy8NsWmLc8CFWUaP_bPx_7xrYZBWpNbMLR3ctCeGKasohPA2vh_NdXfWj3-gNJUVp78QztP4hEQzOgTZ5t9hsSf0jnJ26qBfzWA>
X-ME-Proxy-Cause: dmFkZTFrn9LLjkB4JDoJBS8X6mVvx0bdQTRS3mqNgTW4jR6S+8EgIc3bgC7FaVjAHFknVI
    dMHqzymUdHyri7E62KZeGWeXkp98TBduvuc229bucub6yA/Xystltm52JcwV48tvb50Vig
    QVUY4NjCHSJ6uo7fXqnDK/XkNSLhcmzzNpWJCuHgdcwXJOYmJInfC356/HDvd4p6UOl5HD
    ozk0YpKvGGfJ4RR8FH1v1MEZqkgbA/y8Uf2HXdLB08VhkClX8SfZikdAsBhmBasJDV/DyW
    JsdXRrOdW6HagUgoOJ9oYWFCI6qjoaYJQDmszFWTiTI8gljpbGAL2NgXLjfAJvM28l46df
    Wx8sFwihvsk8MxJKKjP25qHeugktGYIlbcyCkE3DloD4zwq2qc9JA4m3M5z6YLUcVGRzuS
    RsPxRJ6OCVIylFQyTCBXBpXe7KH/YoZWOqOfSFZlkn6mAr++SF3QUvESEiavGlsPmV4FR6
    7bGhFJRpvB7N3g6hb2Sz8k7shdxS+TMLIF8LgR8w5pY3K9RNvVQhmtby4oxcOJEqkHsMZt
    TLGVggiu9NJGRPc+dHhXO0Pu5CSAz/iZeEQdZ7VeU9fvTRCFPdYgLLMkgvKOsbUCKJHKei
    bvPapenkSS4nH6HhwgrWOxxShtYbeC+WCDBusr73TYP/JoctcJGHtW8mTLzw
X-ME-Proxy: <xmx:WMF0au-I2svbdq_OJckd7Dupprduk9gtN6_7JPJ6JM6xdCOnemI_yg>
    <xmx:WMF0amVjQRUy1Wt58V8QAmrSB9_XyU1fN0Sy_Acysr3sI1Cw4KNm-A>
    <xmx:WMF0ahoLqZHCyCdbKmjtHXU-V7PWdw9UgfNhgrsHV3-0z8gY8Tyu1A>
    <xmx:WMF0agnUd0AaO-zdmffZPX0SFut9FCEaJz85qVzTcA5A9_JdV7Hihw>
    <xmx:WsF0ai7BmGliiKIuC4wJcm9BoQauaThM8Fkm1lQKCFK9GUgRV-fKhnGG>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 13:16:07 -0400 (EDT)
Message-ID: <aee67498-d242-4d9f-9b77-0548d61e30b2@bsbernd.com>
Date: Thu, 6 Aug 2026 19:16:06 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] fuse: decouple fuse_ring creation from ent
 registration
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-2-joannelkoong@gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260716175908.2339738-2-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/16/26 19:59, Joanne Koong wrote:
> Currently, the connection's fuse_ring is created lazily on the first
> FUSE_IO_URING_CMD_REGISTER command. A server registers entries from one
> thread per queue (one per CPU) and those threads issue their first
> REGISTER command concurrently. They then race to create the single
> per-connection fuse_ring, which required open-coded handling in
> fuse_uring_create() to detect and protect against concurrent creations.
> 
> Decouple fuse_ring creation from ent registration and move it to
> FUSE_INIT reply processing after a server has negotiated and set
> FUSE_OVER_IO_URING. The ring is published before the connection is
> marked initialized. fuse_uring_register() no longer creates the ring and
> it instead uses the ring set up at init time.
> 
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dev.c         |  8 +++-----
>  fs/fuse/dev.h         |  2 +-
>  fs/fuse/dev_uring.c   | 26 ++++++++++----------------
>  fs/fuse/dev_uring_i.h |  5 +++++
>  fs/fuse/inode.c       |  4 +++-
>  5 files changed, 22 insertions(+), 23 deletions(-)
> 
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 8b68b24af9d7..d50792162d8b 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -75,6 +75,9 @@ void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_param *pa
>  		fch->minor = param->minor;
>  		fch->max_write = param->max_write;
>  		fch->max_pages = param->max_pages;
> +
> +		if (param->io_uring_enabled)
> +			fuse_uring_conn_init(fch);
>  	}
>  
>  	/* Pairs with smp_load_acquire() readers of fch->initialized */
> @@ -411,11 +414,6 @@ void fuse_chan_set_fc(struct fuse_chan *fch, struct fuse_conn *fc)
>  	fch->conn = fc;
>  }
>  
> -void fuse_chan_io_uring_enable(struct fuse_chan *fch)
> -{
> -	fch->io_uring = 1;
> -}
> -
>  void fuse_pqueue_init(struct fuse_pqueue *fpq)
>  {
>  	spin_lock_init(&fpq->lock);
> diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
> index aed69fd14c41..8d25378c0918 100644
> --- a/fs/fuse/dev.h
> +++ b/fs/fuse/dev.h
> @@ -22,6 +22,7 @@ struct fuse_chan_param {
>  	unsigned int minor;
>  	unsigned int max_write;
>  	unsigned int max_pages;
> +	bool io_uring_enabled;
>  };
>  
>  struct fuse_chan *fuse_chan_new(void);
> @@ -34,7 +35,6 @@ void fuse_chan_max_background_set(struct fuse_chan *fch, unsigned int val);
>  unsigned int fuse_chan_num_waiting(struct fuse_chan *fch);
>  void fuse_chan_set_fc(struct fuse_chan *fch, struct fuse_conn *fc);
>  void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_param *param);
> -void fuse_chan_io_uring_enable(struct fuse_chan *fch);
>  ssize_t fuse_chan_send(struct fuse_chan *fch, struct fuse_args *args);
>  int fuse_chan_send_bg(struct fuse_chan *fch, struct fuse_args *args, gfp_t gfp_flags);
>  int fuse_chan_send_notify_reply(struct fuse_chan *fch, struct fuse_args *args, u64 unique);
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index bf9d51f2a508..b7c6100c4176 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -238,7 +238,6 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
>  {
>  	struct fuse_ring *ring;
>  	size_t nr_queues = num_possible_cpus();
> -	struct fuse_ring *res = NULL;
>  	size_t max_payload_size;
>  
>  	ring = kzalloc_obj(*ring, GFP_KERNEL_ACCOUNT);
> @@ -258,12 +257,6 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
>  		spin_unlock(&fch->lock);
>  		goto out_err;
>  	}
> -	if (fch->ring) {
> -		/* race, another thread created the ring in the meantime */
> -		spin_unlock(&fch->lock);
> -		res = fch->ring;
> -		goto out_err;
> -	}
>  
>  	init_waitqueue_head(&ring->stop_waitq);
>  
> @@ -278,7 +271,13 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
>  out_err:
>  	kfree(ring->queues);
>  	kfree(ring);
> -	return res;
> +	return NULL;
> +}
> +
> +void fuse_uring_conn_init(struct fuse_chan *fch)
> +{
> +	if (fuse_uring_create(fch))
> +		fch->io_uring = 1;
>  }
>  
>  static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
> @@ -1178,15 +1177,10 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
>  	struct fuse_ring *ring = smp_load_acquire(&fch->ring);
>  	struct fuse_ring_queue *queue;
>  	struct fuse_ring_ent *ent;
> -	int err;
>  	unsigned int qid = READ_ONCE(cmd_req->qid);
>  
> -	err = -ENOMEM;
> -	if (!ring) {
> -		ring = fuse_uring_create(fch);
> -		if (!ring)
> -			return err;
> -	}
> +	if (!ring)
> +		return -EINVAL;
>  
>  	if (qid >= ring->nr_queues) {
>  		pr_info_ratelimited("fuse: Invalid ring qid %u\n", qid);
> @@ -1197,7 +1191,7 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
>  	if (!queue) {
>  		queue = fuse_uring_create_queue(ring, qid);
>  		if (!queue)
> -			return err;
> +			return -ENOMEM;
>  	}
>  
>  	/*
> diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
> index 55f8d04e4b0b..d721a4fc0215 100644
> --- a/fs/fuse/dev_uring_i.h
> +++ b/fs/fuse/dev_uring_i.h
> @@ -135,6 +135,7 @@ struct fuse_ring {
>  	bool ready;
>  };
>  
> +void fuse_uring_conn_init(struct fuse_chan *fch);
>  void fuse_uring_stop_queues(struct fuse_ring *ring);
>  void fuse_uring_abort_end_requests(struct fuse_ring *ring);
>  int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags);
> @@ -174,6 +175,10 @@ static inline bool fuse_uring_ready(struct fuse_chan *fch)
>  
>  #else /* CONFIG_FUSE_IO_URING */
>  
> +static inline void fuse_uring_conn_init(struct fuse_chan *fch)
> +{
> +}
> +
>  static inline void fuse_uring_abort(struct fuse_chan *fch)
>  {
>  }
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index d975073c6029..ce4891a04a37 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1272,6 +1272,7 @@ static void process_init_reply(struct fuse_args *args, int error)
>  	struct fuse_mount *fm = ia->fm;
>  	struct fuse_conn *fc = fm->fc;
>  	struct fuse_init_out *arg = &ia->out;
> +	bool io_uring_enabled = false;
>  	bool ok = true;
>  
>  	if (error || arg->major != FUSE_KERNEL_VERSION)
> @@ -1402,7 +1403,7 @@ static void process_init_reply(struct fuse_args *args, int error)
>  					ok = false;
>  			}
>  			if (flags & FUSE_OVER_IO_URING && fuse_uring_enabled())
> -				fuse_chan_io_uring_enable(fc->chan);
> +				io_uring_enabled = true;
>  
>  			if (flags & FUSE_REQUEST_TIMEOUT)
>  				timeout = arg->request_timeout;
> @@ -1432,6 +1433,7 @@ static void process_init_reply(struct fuse_args *args, int error)
>  			.minor = fc->minor,
>  			.max_write = fc->max_write,
>  			.max_pages = fc->max_pages,
> +			.io_uring_enabled = io_uring_enabled,
>  		};
>  		fuse_chan_set_initialized(fc->chan, &cp);
>  	}

Thanks, I should have done that from the beginning!

Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
