Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E123D2DB7B8
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 11:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843409; cv=none; b=XAiuH665OPu/9LZOf8Kb3bwBQi0iHmQw01CNlLtw2LhcYSF4d/ZlsUaz9XJEiiEVqo4o2VYqEAnMWhZCrmS2ZCEdhB/6v2IxgrK7SQxfAsNFSRh0t9AruHyQDNuNaNxr3IS5wjRrann4QAds8XbW2vVgBShNcTnbrZZIZ6J19dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843409; c=relaxed/simple;
	bh=BriSj4VgexAhSi/5HjSDb6eC5q7DvPArDFrMjh+7Wzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RyVLuBxYcq9iPBVMCH71RcucdQRQXwFb9nOoOE5Vi6mcgzR1LOrq9Ln2VkNFvoHoZUQYFsc2oPk9PU9nTQLthQsHXb2StaIV4vf4S0zbHOrE6MckYojd/x80lz265pTjxLwm4vq2MvUtArZgpJFVZOnVfB/P2qVwYu1rDqvhdQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=RpCGOBN8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gOoBDWyD; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="RpCGOBN8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gOoBDWyD"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1710B1400130;
	Fri, 15 May 2026 07:10:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 15 May 2026 07:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778843407;
	 x=1778929807; bh=68KZOoQdNrAEbxcuySuhm/3i6xsXq0Eg9oOMtXe6TxI=; b=
	RpCGOBN8c9+2dm9ECCKorh5npwZa57Fb0vjJ4pCUJn8Ae3uuZ2Hy2HPbxON4RRYz
	blsqCi0+i7WhPdUtxT5WehxYgiSeNuTPmAVRgVf8e/d1v5AsySU0PK9SrwjNGJMY
	lda/3wcySsrrjsc67PZLEGFx852laQ6gVx0yPVnuurf6L9vstKyY2K9Z48USTDUm
	eTdg2/C/7R3UDN4wa6DYg2EDbRf1Bqf7q/UnJKhvQivHxgQKo8F2UF/uLFNMPvtm
	ZwPNWaTgfQ1vKVxWCa4n+NNZDSAbQ+THXMoZZa5gnyfatawlqpfsA6/WnqLCvhkT
	5XCQ+rogOioEwcl8Gf6i6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778843407; x=
	1778929807; bh=68KZOoQdNrAEbxcuySuhm/3i6xsXq0Eg9oOMtXe6TxI=; b=g
	OoBDWyD+M5yeksTF1BmxPLow6pKcMnC+Dm4S3l7Iq09nPphpzhV3BUlafrbTDAAk
	Jn4D2x31+0RuNZl5PRJvjDBL/cTt9Z14qwKSpTSqCybOrFCc5zUDAXaEO74hKZ6k
	AVLzCBpBM6IVpU6LBh4q4LQAmxoc9Y8XBMZH7OChQGplMneVfB1Kcu+QkI2n9J8s
	Ok8H3+H/4g43ZRmMc3JcVsHzSVwgvJh5QTBxjN63bOOpyMBYVe81C5+o2zb9QJaA
	e+yNaaHPwRYJDNKsOnbVndk3xDS84fIAO1aE/4EjkxeGAXoyQxlK5IORE1xT69hM
	nCTR3zRqdGLSD6iRa1Flw==
X-ME-Sender: <xms:Dv8GagdZk5hbaJNPqzUhkvVSv2hw556YGb7vL12uLzlj7VFJXpJ-bA>
    <xme:Dv8Gai6g3AvedyzmPj8RcJeX2TNoUIvN8tp0KdlM5CLJblEAov9GvzaShTWVbo2hq
    s-1pm_-IBMAo0Su_1Azp-aAHuTzLN4Ra9SV8ML_hfZ8AHrUV5c>
X-ME-Received: <xmr:Dv8Gavtb9hpgLnwOFOLu6UjaPWcLWJQa7R7zBqdzcSrnM7DNuy2BcR-vqb0uWHZq_ysW9p9qI9n8da5QwfwjxDbtMAYdIwXfytw-Xwwzvayln69E7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufedtvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeeuvghrnhgu
    ucfutghhuhgsvghrthcuoegsvghrnhgusegsshgsvghrnhgurdgtohhmqeenucggtffrrg
    htthgvrhhnpeehhfejueejleehtdehteefvdfgtdelffeuudejhfehgedufedvhfehueev
    udeugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsvghrnhgusegsshgsvghrnhgurdgtohhmpdhnsggprhgtphhtthhopeejpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehjohgrnhhnvghlkhhoohhnghesghhmrghilhdrtg
    homhdprhgtphhtthhopehmihhklhhoshesshiivghrvgguihdrhhhupdhrtghpthhtohep
    fhhushgvqdguvghvvghlsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprg
    hlihesuggunhdrtghomhdprhgtphhtthhopehhohhrshhtsegsihhrthhhvghlmhgvrhdr
    uggvpdhrtghpthhtohepghhgrghnjhhiuddusehnrghvvghrrdgtohhmpdhrtghpthhtoh
    epshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Dv8GaqgLOpl8gh_3HIYfAa7rLBd6fnHEoYbmqdQPTAARAXB70lLGKg>
    <xmx:Dv8GaipC6kaARNy3w8l00QPIZVCZEXnhxH-oClTYK04Uvw7HKQlW_A>
    <xmx:Dv8GavviUKIC-Q8csu-FsUWj-v4Wx5u-wcIlh45aNxoLzQIgQHTg4w>
    <xmx:Dv8GatbkTkVBXY5JEahHaVUjzpnlve-1KXItve-maRJ3-1s8UPcgHA>
    <xmx:D_8GaqGE9LozfkPQvkeeRPSA0LbFon46Zp0u9xreKwpr-KD2wKJuiaku>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 May 2026 07:10:04 -0400 (EDT)
Message-ID: <5c010e24-b4f7-481a-97e8-00da0aec6f3c@bsbernd.com>
Date: Fri, 15 May 2026 13:10:01 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] fuse: fix moving cancelled entry to
 ent_in_userspace list
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev, ali@ddn.com, horst@birthelmer.de,
 Heechan Kang <gganji11@naver.com>, stable@vger.kernel.org
References: <20260515045541.1171335-1-joannelkoong@gmail.com>
 <20260515045541.1171335-4-joannelkoong@gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260515045541.1171335-4-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/15/26 06:55, Joanne Koong wrote:
> fuse_uring_cancel() moves entries that are available (these have no reqs
> attached) to the ent_in_userspace list. ent_list_request_expired()
> checks the first entry on ent_in_userspace and dereferences
> ent->fuse_req unconditionally, which will crash on a cancelled entry
> that was moved to this list.
> 
> Fix this by freeing the entry and dropping queue_refs directly in
> fuse_uring_cancel(). This is safe because cancel is the cancel handler
> itself - after io_uring_cmd_done(), no more cancels will be dispatched
> for this command, and teardown serializes with cancel via queue->lock.
> 
> Since cancel now decrements queue_refs, fuse_uring_abort() must no
> longer gate fuse_uring_abort_end_requests() on queue_refs > 0, as
> cancelled entries may have already dropped queue_refs while requests are
> still queued. Remove the gate so abort always flushes requests and stops
> queues.
> 
> Reported-by: Heechan Kang <gganji11@naver.com>
> Fixes: 4fea593e625c ("fuse: optimize over-io-uring request expiration check")
> Cc: stable@vger.kernel.org
> Co-developed-by: Jian Huang Li <ali@ddn.com>
> Co-developed-by: Horst Birthelmer <horst@birthelmer.de>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dev_uring.c   | 6 ++++--
>  fs/fuse/dev_uring_i.h | 6 +++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index d9108b5b5db8..f4ba64a1796a 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -511,8 +511,7 @@ static void fuse_uring_cancel(struct io_uring_cmd *cmd,
>  	queue = ent->queue;
>  	spin_lock(&queue->lock);
>  	if (ent->state == FRRS_AVAILABLE) {
> -		ent->state = FRRS_USERSPACE;
> -		list_move_tail(&ent->list, &queue->ent_in_userspace);
> +		list_del_init(&ent->list);
>  		need_cmd_done = true;
>  		ent->cmd = NULL;
>  	}
> @@ -521,6 +520,9 @@ static void fuse_uring_cancel(struct io_uring_cmd *cmd,
>  	if (need_cmd_done) {
>  		/* no queue lock to avoid lock order issues */
>  		io_uring_cmd_done(cmd, -ENOTCONN, issue_flags);
> +		kfree(ent);
> +		if (atomic_dec_and_test(&queue->ring->queue_refs))
> +			wake_up_all(&queue->ring->stop_waitq);
>  	}
>  }

Hmm, ok, I had done that via fuse_uring_entry_teardown(), but this way
is also fine.

While thinking about it over night, I wonder if we should abort the
connection here. Calls for fuse_uring_cancel() / IO_URING_F_CANCEL
happen when

a) The daemon dies - that is what I had written the function for
b) When one calls

With reduced rings queues we would actually need to have per queue refs
and if a single queue reaches 0, it would need to re-calculate the
queue. In general this gets complex and from my point of view, if
fuse-server wants to re-initialize queues, fuse-server should:

a) wake up the ring thread with an eventfd (libfuse already has that)
b) we need a reconfig SQE (like FUSE_IO_URING_CMD_RECONFIG) that
requests to re-configure things

Right now that is all not supported, from my point of view we should
call fuse_abort_conn() when we call into fuse_uring_cancel()


Thanks,
Bernd

>  
> diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
> index 368f4d0790eb..22ec67e39ee0 100644
> --- a/fs/fuse/dev_uring_i.h
> +++ b/fs/fuse/dev_uring_i.h
> @@ -150,10 +150,10 @@ static inline void fuse_uring_abort(struct fuse_chan *fch)
>  	if (ring == NULL)
>  		return;
>  
> -	if (atomic_read(&ring->queue_refs) > 0) {
> -		fuse_uring_abort_end_requests(ring);
> +	fuse_uring_abort_end_requests(ring);
> +
> +	if (atomic_read(&ring->queue_refs) > 0)
>  		fuse_uring_stop_queues(ring);
> -	}
>  }
>  
>  static inline void fuse_uring_wait_stopped_queues(struct fuse_chan *fch)

