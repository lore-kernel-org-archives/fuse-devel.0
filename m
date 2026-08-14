Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3203EA962
	for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786697363; cv=none; b=Jc8C0CLOiTGMEn/WSUXT5+k1I/Cnq9qUlnJGbqYpLVlOTpw7cEdd6+JgqEdIsXmcccrJcmQXYGKftRqPBSU4gLqLJJG2HWE5N3T3CYVEkGmAu8rrCmsCUwQ6Ykj8FgFXzF9C3OQkfnB74pbD18t3NipvdPWughmWNjUr3Xff4x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786697363; c=relaxed/simple;
	bh=HAA+mt4ekKMS/6F2UkZ4KJyTnTXXBtPr9zHD+OA8950=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUhELgBpij12FKFym0RRtHjHBSrUYoNlItpD8RNAg4xpcoqQGtAAW+4QtN2ZU15S/IwOSLYeVCbRnDso+Mec3Iq9ggWGxMhDfO59NF5rNJaNKo7V50fB7ALDcGqB8p3FMc5bDDS0MWK0CVvFd3BfubOPvd93APrmQOxChlGFTwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sCaQB9d6; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCaQB9d6"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e507b079dso425189b3a.0
        for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786697361; x=1787302161; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GG12SPtU6isFgXGa5wHO//MDFN9B9TIMaXwE7epMdro=;
        b=sCaQB9d6qeHLMxo5Ke62oU87FALIVJRaWpBjZslma1TjF9JYUVS/GBYyQyh2r55YdT
         7CyzY8K3dSYwHinaMIa+KeNwC7ERS0+CS/HspV9FLVBj1avSvtrTaasgupQMI51rlha9
         AhxVWyH4+VuMakKeuoMDnSKkd4eCR96+5BY7GHfVTHtlwTdui/HmSr/Mdomsw4XXTSNX
         CUjyTSjasGis0m0/Xci+SvmGwVrPOxmyn19zojdR+D9rK3hPIJN1xRXB6Pa+OIyKoWCP
         8+Prv8If2w1q/fKRraBHeXZ1mbipR5oMcQGKV/1vH+vaSviaAbJ/V3C9ssgzcNZpVMyL
         nQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786697361; x=1787302161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GG12SPtU6isFgXGa5wHO//MDFN9B9TIMaXwE7epMdro=;
        b=JaYjwbWlHSK3YLpUbDWH8U2BfWqvs12euOMtiickd5+yiZo2xmh7bHzR1dpCisUvUk
         GmUC3Uf3NLy44jIPI23ulfvitEVgcYlCUadHLfsvnG0HqE5AsQnBJFma2Pp72+UVAX0F
         yDGdR03EBC4d/qUOnDwnPDHahjVTs7TeVgcX8pqVsGS9gZbs1WAQgIp0C36feH+bvnK8
         u4w74L2N2fAGG9knhUAYmNN8DFlAsUI5EHw0Ge1n3+K/H+Rxe+gciQvsvM4V2IBl24tb
         8oS0CY4E54M/D2cq72bsocDfLgLj0nYodsHJ83+CEmoxPNCVneyGM28R0FLReDfw2xf3
         Omxg==
X-Forwarded-Encrypted: i=1; AHgh+RoJt9DTzZuKGsLnPAc/giZyMV52X+kgHHHqiPN5BVJzZwb98ofz6cp6yCFopBM5obAjBqIRnH8zf3og@lists.linux.dev
X-Gm-Message-State: AOJu0Yz12z5lIpomOQ1a5Ji3Z1qZrNFkdFQeC5h7gERbnYqktCtZUJ9q
	VofMwsnciWpXaQPaQm6Jt3uF6CylHcdBqHmVmVdaYt7f+t50OyfWUvdp
X-Gm-Gg: AR+sD117IoLQItamCNPsE6H4AaXwN/0uVhXqvIHACi9YJHDf4f8Vgbj33p/kqZIxFDm
	88wnNGYedvzcMwuti/NrfsdCwBDGN+qDv83qbnBvNmKtNe+FGvKjGhsj+z8fNMYflE9J5DK54o5
	QuI7PXaMRwnGutxMM34uZSYdQyn4x0PvcecVgixrr+DQxoq5goy7s/2bijurDNBMezymHI68FMp
	xajO3BKv7SpvTdgK/IOjCGmZRoonWGeORlrWCjjiRnVQLFDqIZUwrdlW6aJrJSl6uqpX/S0874T
	1fpUBZ615KuicHXAbzHK5MecTLU8xp/Xyer4cJIgeVZ3llRCyxaRY/U9t66TrdR3mPSeatMLsYx
	Otj0K5pbvjxhOe1zyur5gfBn3HmwihPVUrP70ymIsOnwSRE5FXVrqacyimdcZYSqXYonlYRc84T
	8863ioLzVsg8eUS+1IP0wjpC/7rlbeutMOtY/No6uB6LLPgjaWHWsNHaeC1dzuoGCBA7FV9p5fn
	wrq8qie+h2QhbbGsCIF
X-Received: by 2002:a05:6a00:399a:b0:847:9267:2104 with SMTP id d2e1a72fcca58-84fde1cea2bmr4152125b3a.12.1786697361028;
        Fri, 14 Aug 2026 01:49:21 -0700 (PDT)
Received: from [10.22.68.200] ([111.223.92.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517cfeb417sm176997b3a.2.2026.08.14.01.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 01:49:20 -0700 (PDT)
Message-ID: <4bbdae79-84b3-498a-b9cb-4767b336dcf7@gmail.com>
Date: Fri, 14 Aug 2026 16:49:17 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fuse: don't queue an interrupt for a request that is
 back on fiq->pending
To: Jun Yang <littleddfu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 fuse-devel@lists.linux.dev
Cc: Zhao Chen <winters.zc@antgroup.com>, linux-kernel@vger.kernel.org,
 Jun Yang <junvyyang@tencent.com>, stable@kernel.org,
 TencentOS Corvus AI <corvus@tencent.com>
References: <20260804091757.503476-1-junvyyang@tencent.com>
 <20260804091757.503476-3-junvyyang@tencent.com>
Content-Language: en-US
From: Tang Yizhou <tangyeechou@gmail.com>
In-Reply-To: <20260804091757.503476-3-junvyyang@tencent.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/8/26 5:17 pm, Jun Yang wrote:
> fuse_dev_queue_interrupt() links a request onto fiq->interrupts based on
> an FR_SENT observation its callers make without fiq->lock: in
> request_wait_answer(), in fuse_dev_do_read() after setting FR_SENT, and in
> fuse_dev_do_write() on an interrupt reply with -EAGAIN.
> 
> fuse_chan_resend() invalidates that observation: under fiq->lock it clears
> FR_SENT, sets FR_PENDING and splices the request back onto fiq->pending. A

Right. So why did you say 'They (patch 1 and 2) are independent' in the coverletter?

-- 
Best Regards,
Yi

> caller that sampled FR_SENT just before that happens links the request onto
> fiq->interrupts just after, so the request ends up queued on fiq->pending
> *and* on fiq->interrupts.
> 
> That combination is a problem, because a request on fiq->pending can be
> released without ever going through fuse_request_end(). A waiter whose wait
> is interrupted calls fuse_remove_pending_req(), which sees FR_PENDING,
> unlinks the request from fiq->pending and drops the queue's reference;
> fuse_chan_send() then drops the last one. Unlike fuse_request_end(), that
> path has no FR_INTERRUPTED cleanup, so the request can be released while
> still linked on fiq->interrupts, and the next fuse_dev_do_read() walks it
> in fuse_read_interrupt().
> 
> Re-check FR_SENT in fuse_dev_queue_interrupt() under fiq->lock, which is
> the lock fuse_chan_resend() holds when it clears it. This restores the
> invariant "FR_PENDING set => intr_entry not linked", both sides of it now
> being taken under fiq->lock. No interrupt is lost: the request is going
> back to the daemon, and fuse_dev_do_read() re-queues the interrupt once it
> has set FR_SENT again.
> 
> Confirmed on v7.2-rc6 (075b74841bd0).
> 
> Fixes: 760eac73f9f6 ("fuse: Introduce a new notification type for resend pending requests")
> Cc: stable@kernel.org
> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
> Assisted-by: tencentos-corvus-ai:kimi-k3
> Signed-off-by: Jun Yang <junvyyang@tencent.com>
> ---
> A KASAN reproducer for this issue is available if requested.
> 
>  fs/fuse/dev.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index e62c7ed8bcf4..c4df1d4abd33 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -240,6 +240,11 @@ void fuse_dev_queue_forget(struct fuse_iqueue *fiq,
>  void fuse_dev_queue_interrupt(struct fuse_iqueue *fiq, struct fuse_req *req)
>  {
>  	spin_lock(&fiq->lock);
> +	/* fuse_chan_resend() may have put the request back on fiq->pending */
> +	if (!test_bit(FR_SENT, &req->flags)) {
> +		spin_unlock(&fiq->lock);
> +		return;
> +	}
>  	if (list_empty(&req->intr_entry)) {
>  		list_add_tail(&req->intr_entry, &fiq->interrupts);
>  		/*

