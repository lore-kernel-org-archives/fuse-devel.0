Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2451A7E792
	for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 04:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786681541; cv=none; b=AIkmIuXJqPZADPih9ibzyw6UQ6EEh44QblpG9i9whp4zgf/A2Ye8GHDWcfT16TH5vT8l+fLvZeBN5aAFue/RR+hQ6WEVmP8CWPnQz/cG8Aqe+vU51hMwy4TbbiLi7a7KobuUK6ypz/c1jVhzsGuVJyjopq04xqeatIWtO6fNy+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786681541; c=relaxed/simple;
	bh=Bj+GFIAM9t+QnayRLXvIYZmBxLjkp3TTy/+Mx2LFMYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=syYe0hwAIFyPvlCXUJnUyTYRcKJB91zInc3DZfbaC8vyNzL4NFOtH2jhgfRNorH37cPGr29nQ0TI/TNAJTmrvwFYzkHso2O5qdQxbwIXQiIZjD7o6L/DppY6H5GaodwWMR8WQhZ5cvbG+7UNz5VK4fKCj3GyzexBr/nmaOjxGS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiHwa0fG; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiHwa0fG"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so590646a91.0
        for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 21:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786681539; x=1787286339; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPnXUKqHB09+gprPc9dr6m7TW7NThR7K77XWxdq9JR4=;
        b=FiHwa0fGqYfFpekYr4pp7fQvMX5HRvdj7IauP5MvBg/qv3t4QuboHwp+roWzyJ5Vn4
         M/fJ59rxYmYBx4KC2htgh1c8KfaHj8++it25QTRx0M+kLfpwNhvcdvubt7FDnBL18h4v
         OtizWi46JUKFgnwkUAkwpjNXx1HhmfwhWJ7khy5rKQZ7O2L+P9ak7WRk/I4iaTfGptSj
         QYlK2/vbdfsUVU04Bi68zeKn/0YndcmVfaLrX03mZJHKVAtA7ipwOQTL4zgo3imLgF0P
         6Y8zccBTLMVdruWx4mdQx5ykwwswCCJyJoCin8LEtl3HfXU2dMolLf8bAKzVX00HMD/E
         MzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786681539; x=1787286339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TPnXUKqHB09+gprPc9dr6m7TW7NThR7K77XWxdq9JR4=;
        b=Uk1zSsUYBv2h7AhooCayXQNRt/GndqbY7XO/b9yFTfxySMCW1n6TeOxFWFpZk3bJEL
         CaDCuTG5HBHGk///TatkuMVValVzjerwgAgQGEuRhWIqSWd/1tdeGPDwhiUdd6XOWSYn
         na3o+Coc8hDSE/EOowSQdwBcOhRSafpVcUSXbwsB/JaZe7eolnTMRwNXX0kh/bKu8Tlu
         XBKhaI8xSoxlLvChA1qImcEbedULWLW5Vc7UHTjvWjuNawL7ADfu8Pxr7BaXu2lzfhN5
         6+PjlGIjfW1kXSoQ0fdw4V9zt2Vyv6xLWt+RCHZRQkrGjnp4+ZdewtsbXALgC9LXUbp9
         dnqw==
X-Forwarded-Encrypted: i=1; AHgh+RoehHLXzfPCJYLo7NK/zPUx+6w56zzZmXgETV/PHt4vbpM9zp7cvIT97wcGgpXE+xju8YW6lesGtTZu@lists.linux.dev
X-Gm-Message-State: AOJu0Yya3tGoqV/Dzy86Ju3GqxjO2yjlKShskVE6F1+r7PA2lEvHT0zE
	4FEXrRszE2zV9usa6ZOW33b0dkXxvygJBEnIDTvdpr0IPoTqbvj577IxnMYnJSjt3R0=
X-Gm-Gg: AR+sD13E8okRyx717482oH4QU2/Klki/uXTpPSvQh6yIIMOMI+QAn0AYsS3kIZHxgWY
	fclVTFcQ1SXC/PKlbpiSw9sEvGJpJiN7fMUe1Xwf8pI2WnhRXEuWRNEqseTb178nzV89kSARkC4
	vBuK4j3hYRrJbuhDFRK7UkKH3WapJ09AgXfpL9E9rw1wymTWua9fEy8+ntyl0SdhCJsuDzKb4qb
	6oVZVUV2DvQSFyOy9Da3/k2WRQE1tFmP/uQKRdvYyJ4Cnx//kINKnJ85DYi8e6VImASsExtpTDg
	Tyg0lcI6tlkc0amMHhDA0CKsWNtElNZk8o25wBZIQ7T+Rf9s/dyxt16W54UTTnBfrjRJ2x4MSEP
	7wDq9yXtk6KQOPDzUo6/kzPvwPnCUHSaDARVcmbAULSwlkk9iBmYwWjNvJdanJiiAzdZaHv0X70
	mVyqZ44/trp+ObbxYCKF6Yk0jw4t5AL0WqZXT7wFeZ9W0A9ni55q2TnRLEHHMvp9rztAvAGHnfJ
	ESz4UoI6Q==
X-Received: by 2002:a17:90b:1c87:b0:380:540:d499 with SMTP id 98e67ed59e1d1-3933cae4b3amr2936349a91.6.1786681539297;
        Thu, 13 Aug 2026 21:25:39 -0700 (PDT)
Received: from [10.22.68.200] ([111.223.92.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea996575sm788095a91.8.2026.08.13.21.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 21:25:38 -0700 (PDT)
Message-ID: <33747609-53e7-4f17-9e97-2fdff67b4460@gmail.com>
Date: Fri, 14 Aug 2026 12:25:36 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fuse: clear stale intr_entry in fuse_remove_pending_req()
To: Baokun Li <libaokun@linux.alibaba.com>, fuse-devel@lists.linux.dev
Cc: miklos@szeredi.hu, jefflexu@linux.alibaba.com, winters.zc@antgroup.com,
 stable@vger.kernel.org
References: <20260728031641.2497811-1-libaokun@linux.alibaba.com>
Content-Language: en-US
From: Tang Yizhou <tangyeechou@gmail.com>
In-Reply-To: <20260728031641.2497811-1-libaokun@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/7/26 11:16 am, Baokun Li wrote:
> Commit f8fce75fedf7 ("fuse: clear intr_entry in fuse_resend and
> fuse_remove_pending_req") removes stale interrupt entries in
> fuse_chan_resend() when requests are moved back to fiq->pending.
> However, that cleanup only covers interrupt entries that are already
> linked at scan time.  It can race with a concurrent queue_interrupt()
> from the request holder:
> 
>   CPU 0 (holder thread)           CPU 1 (resend)
>   ---------------------           --------------
> 
>   req in processing (FR_SENT=1)
> 
>   signal arrives
>   set_bit(FR_INTERRUPTED)
>   test_bit(FR_SENT) -> true
>   queue_interrupt():
>     spins on fiq->lock ...
>                                   fuse_chan_resend():
>                                     set_bit(FR_PENDING)
>                                     clear_bit(FR_SENT)
>                                     spin_lock(&fiq->lock)
>                                     cleanup scan:
>                                       intr_entry not linked yet
>                                       -> list_del_init is a no-op
>                                     list_splice -> fiq->pending
>                                     spin_unlock(&fiq->lock)
>     ... acquires fiq->lock
>     list_empty(&req->intr_entry) -> true
>     FR_FINISHED not set
>     -> intr_entry added to fiq->interrupts
>        AFTER the cleanup already ran
> 
>   fatal signal arrives
>   fuse_remove_pending_req():
>     test_bit(FR_PENDING) -> true
>     list_del(&req->list)
>     __fuse_put_request
>   fuse_put_request (refcount -> 0)
>   -> req freed, intr_entry dangling
>      on fiq->interrupts
> 

Good catch. We discovered this issue in our recent stability testing. The
proposed fix looks reasonable, and we plan to validate it.

> fuse_dev_queue_interrupt() only checks list_empty() and FR_FINISHED
> before linking intr_entry -- it does not check FR_PENDING, so a
> request already spliced back to fiq->pending can still be added to
> fiq->interrupts.  The lock contention itself produces the bad
> ordering: while the resend holds fiq->lock to scan the queued
> requests, the holder spins in queue_interrupt() and links intr_entry
> right after the scan finishes.
> 
> The dangling entry then causes the same use-after-free that the
> above commit describes: fuse_read_interrupt() writes to the freed
> slab object via list_del_init() and leaks req->in.h.unique to
> userspace.  Once the freed memory is reused, INIT_LIST_HEAD() turns
> the entry into a self-loop and list_empty(&fiq->interrupts) returns
> false forever, so the daemon reads the same phantom FUSE_INTERRUPT
> in an infinite loop and never consumes fiq->pending.
> 
> Close the race in fuse_remove_pending_req(), which is the common
> bail-out path for both the legacy and the io_uring transport: after
> the request is removed from the pending queue, also unlink intr_entry
> under fiq->lock before the reference is dropped.  fiq->lock must be
> taken explicitly since the lock argument is the ring queue lock in
> the io_uring case, while fiq->interrupts is always protected by
> fiq->lock.  This runs on the holder thread after any
> queue_interrupt() it issued, and no other path can re-link the entry
> once the request is off the queues (re-queueing an interrupt from
> FUSE_INTERRUPT's -EAGAIN reply requires finding the request in the
> processing queue first).

The commit message is too verbose and looks AI-generated.

-- 
Best Regards,
Yi

> 
> Fixes: 760eac73f9f6 ("fuse: Introduce a new notification type for resend pending requests")
> Cc: stable@vger.kernel.org # 6.9
> Signed-off-by: Baokun Li <libaokun@linux.alibaba.com>
> ---
>  fs/fuse/dev.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 5763a7cd3b37..87891162985c 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -678,6 +678,8 @@ static int queue_interrupt(struct fuse_req *req)
>  
>  bool fuse_remove_pending_req(struct fuse_req *req, spinlock_t *lock)
>  {
> +	struct fuse_iqueue *fiq = &req->chan->iq;
> +
>  	spin_lock(lock);
>  	if (test_bit(FR_PENDING, &req->flags)) {
>  		/*
> @@ -686,6 +688,18 @@ bool fuse_remove_pending_req(struct fuse_req *req, spinlock_t *lock)
>  		 */
>  		list_del(&req->list);
>  		spin_unlock(lock);
> +
> +		/*
> +		 * Remove stale intr_entry queued by queue_interrupt() before
> +		 * the request was requeued, which would otherwise dangle on
> +		 * fiq->interrupts once the request is freed.
> +		 */
> +		if (test_bit(FR_INTERRUPTED, &req->flags)) {
> +			spin_lock(&fiq->lock);
> +			list_del_init(&req->intr_entry);
> +			spin_unlock(&fiq->lock);
> +		}
> +
>  		__fuse_put_request(req);
>  		req->out.h.error = -EINTR;
>  		return true;


