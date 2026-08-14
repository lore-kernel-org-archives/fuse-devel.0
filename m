Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA41411F88
	for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701451; cv=none; b=O8tLom7lSlRFdo/apB96N/Xf6e09n+VHqo5YPOhIVw71qy89C9oln/jw7TeWGk76K1Dm0SPIFujGhoALBTzL0CfaPiQ6/hHwY5m856OWgZYOMr3WFKhr+LBxMMZh2ySQqWc8BuUiW5Eq5UCMF+0Ji0iQfHwE2GaUgphQE4SgCfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701451; c=relaxed/simple;
	bh=534CagOdQ35DzD17xlcuafXbatIB2JIffyCe7kh9eOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VY0Fx3DCpiapVhoDwnq+vP7rtoOT6615OqDu1b2UBZwbt4KlPLcKlnI2CFp7Csa77H3ffEqaTgKs+OGhGwEiyRmNzCCbbMIea6FMJ1pplDhgTXfFyxYzoHa1qVC85E/3KMXbNhpF7LoF0u6W1ea3YbOv0eDBTAMkiXe8X29/cTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lngkivQB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lngkivQB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1144078a91.1
        for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786701443; x=1787306243; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqq/eesd6KpkKbZO5cDYLRl1ZtXvrm9zL+ZkU4ZzFdE=;
        b=lngkivQBgThFNx9zLYm3kO41xzi6Ya0suuJwvlSYrIIkiGmNwr7E3icfAxhUmF+jS5
         XTUr1l5tPM3d2KA+LWs0Jrhbxo+YxcKhyT+P/cSvCZ4uK7vWa0mGco0nMtJqcrtWodMX
         zKVZjviU9napmCZ9LLGPIt/SgJwPr4KOA1qjN3srPJsOGPb0c/APveWpJL47MM4VLwLl
         gaxsF3kiBUGQ9+CxV5HtWjHJm2oixZjD6r8FNawVTmRR72N6N+2ZTO1n34uZvq5NkxGM
         4E+75AsY1PHqxnTCVmUV1NA0Ny3k2ST/Aj1PJeblvmeQ3LhfJg06S1Ps4+rVZq9AbYJU
         UtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786701443; x=1787306243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqq/eesd6KpkKbZO5cDYLRl1ZtXvrm9zL+ZkU4ZzFdE=;
        b=hOYeHujpCNBjcARPUbgDTVAOhCY6GlhPzFGvspyBPMNWqiDtVBC0ywA2zeN4VMYI+8
         z1YcyMJVvCKCR4Bw6wVW1HQej3H0DZoMqeAPONGGGd4aHKrViDwQozr2veHrcdLLgDs2
         bsKY1uRrTqB/zW+D9WH6VZ1D4GxiKHrpKNZfDccrI/rhhVeVukCx1pEmVA+Y7mAFMPZB
         a9FtkldGJbYW7otMyghPXHW1vQb2XEo97TUhfdKqeHYgy8RcAt66pqpUfrRUMueiddXO
         PFEqOFA5vGIg72J7S1YEXdqO5jSuOWs6TqRnwNDa/X0Hgs1a3g+a5GY4txUUdJY7rn4V
         kUbA==
X-Forwarded-Encrypted: i=1; AHgh+RrCMieF8KyFHgZM9xhoxvgWXhsnfrWhKsDGPMFHK8yEqbDZvN8iHPJa5mZXGHMZkUeZJKvJmRvH0YfR@lists.linux.dev
X-Gm-Message-State: AOJu0YzMKDYhyBug76nYUf1NPTsZVn+RylYnIGovRXokKhsXYFWEQKSQ
	jXIzFQM7Xc45p7mo+e+afMjIHl+tavCRJU6OeBJx9bC/gEaAFfd2REFM
X-Gm-Gg: AR+sD12S7AGjm8Aw5Sdc+Qfhh2lm7XonMSTJ936eoxwYWABEjfztB7L/6Bk4rOCPlEk
	xsNN0A4MqwBfHmyBMuDT0GWcoi2VSP46gYasYByPpccBx/eX/f49Ap2xCxQ45sJ/46abvPJW4GO
	EFF5unhYQB1dPnSpf5X4EVuMSC0QNv+4VM36PwYb3ek5Pi5JyXPqJHKABKjqJxhGQJ8i4y5ZQsV
	+SFVreiubYVa6XIUvILBW5bZfuv1fFerBO/JmHjSuBLAhYvndBH8c1nOYlTQ1SuEfCSVodu4G+2
	+QKAqQKmesTLnBz+03XdkrIviinF2cHVn14+c731KwHs4Wb5KmVqLq+2eRlwOitASlc7HZyGVQu
	UGTASxybEoqb/4jbkQGUHk02/OB0vPzTsOjEHv0O6NVHh2R6BV1fvlaJDfFzQBLBV8ws0cpeyip
	CVZGrxoDYP0lKq1qZCdf6vpBGSVNZSPv5+e7YrxlpKbWsXOdyI6Z+iNQestXJSPXSLL5fRlRwow
	LC7BeDhibD5hDCuy51Hcw==
X-Received: by 2002:a17:90b:1c83:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-3933b77c3f9mr4752626a91.2.1786701443357;
        Fri, 14 Aug 2026 02:57:23 -0700 (PDT)
Received: from [10.22.68.200] ([118.201.124.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39339b1d20dsm1115327a91.0.2026.08.14.02.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 02:57:22 -0700 (PDT)
Message-ID: <7489ab68-9da6-4c47-8dcd-3bfa1690fbd5@gmail.com>
Date: Fri, 14 Aug 2026 17:57:18 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fuse: clear stale intr_entry in fuse_remove_pending_req()
To: Baokun Li <libaokun@linux.alibaba.com>, fuse-devel@lists.linux.dev,
 Jun Yang <littleddfu@gmail.com>, Jun Yang <junvyyang@tencent.com>
Cc: miklos@szeredi.hu, jefflexu@linux.alibaba.com, winters.zc@antgroup.com,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 TencentOS Corvus AI <corvus@tencent.com>
References: <20260728031641.2497811-1-libaokun@linux.alibaba.com>
Content-Language: en-US
From: Tang Yizhou <tangyeechou@gmail.com>
In-Reply-To: <20260728031641.2497811-1-libaokun@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

Hi Baokun,

I just read Jun’s solution, and it seems his fix is more comprehensive. If you
don’t mind, I hope you can take some time to read it.

https://lore.kernel.org/all/20260804091757.503476-3-junvyyang@tencent.com/T/#mf9bb60e63dbd4ef0ab5cf826e97ad67037ccd3ff

To be frank, Jun doesn’t seem to have a deep understanding of the issue. His
patchset appears to have been written by AI, and the problem description is a
complete mess. However, his approach to solving the problem seems viable.

I’m not sure whether Jun is able to rewrite his patchset that Miklos would
accept. If not, I’d be happy to help, since we encountered the same issue in our
stability testing.

-- 
Best Regards,
Yi

