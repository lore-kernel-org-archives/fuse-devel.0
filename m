Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EAC3546F2
	for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 07:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692224; cv=none; b=mqzwXfFZEzOcqhqSP++9Tc9x7hyV6M3T7M/zNKvxmCDSmGc+z+sh+aZU72PidpaUCN8q2K144jKJokGlYzg/mb005MzpwwiCIBDgcPuWhnikvB+w10DZU/gFb4FegAEEaMpoMKhYCeuTC+RoD4EFQCXhS83zEJSB8EERs++BNT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692224; c=relaxed/simple;
	bh=eqsKtyKp7QSyLOw68sMVbhvONY489JyIbKn33/jbj44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u14kaluqd2k8kW+6vxCjIgItHIu7LGwpJ7Ogv3dWlrxeSdGaq5D+orYFG/aTSZ5P4sxokkvBKdrxCF+xdBv91Nr68TlRMnu2zutRL8rRIUeeLo8csXwvJGdw4s2o1D2Cv41G93fZ9peUUEcUUX5OG5W4imPETuL7Qwy9gaDt0lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxCr0ByA; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxCr0ByA"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ceab75934dso9117085ad.2
        for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 00:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786692222; x=1787297022; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUCkmH0oXKN4ykZwwQ3W80SsRpWmXMPCCh2SWN7p2kE=;
        b=NxCr0ByAhYAGoVRTqYNmPt0jJjF5yZ56sppjko4covzc+jmz601x1dWZLxTlCuxz3T
         jaiFZoMxUkod+nqVOpdvv3z6x2dHQ7RNGb5n3+nzUUQg77JhSPxRTeHvxLZnl4+eEnK2
         jj2Ki2rBE1Q7Pk82pwhruZFVZk+vy7tYBy7PZGaiA2U+UcTfOOyVUcnFEw2oQfsxzTYq
         YDv5UKd31I/sM+UQDVIgUgPLhfIXk7Q1T7vJ/Rg4EXJAO8ybXDQP79Buu4POwBMy+8xE
         FABOVPC5ktBq0LywP0ZOSFFl5SfmAdeLhRRonkfm+I0DxcLb+APFW32pXMjKKpxiidKj
         Zfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692222; x=1787297022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EUCkmH0oXKN4ykZwwQ3W80SsRpWmXMPCCh2SWN7p2kE=;
        b=Lhp2OjOylZp36nhpbTaSBIop6wlj9gV1Ng6RpsNVYdyXTC/cc1hPGOEZyEl6KweMXf
         RwBSpcNrMaZtCLj7cKFnu2SOlYDUAzSOR6H5PqSEPsjeXrujLO1LXTAhmTj6GnI3+lwE
         VKXiBQs12h64jmTR1i5RMp+tSTNhwCmpOqll0/dyGs7HxRVTAcm22jNly01H1HgbHd5n
         WGQ03af6aMeSgMRkJ/fjlyf7Vm12XQ7xfAxzFebltqj4sNGwCeD4IvDaqYHaDt26PDv2
         AN717wqdRG23r865Fqg3Utjq3v6Ff1vKx4HBdJ3XKR51z1lXMd1jIYMrCQBOclV3TTSg
         VqPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRbNrK/l6v0ppBw4+tQiWhzDwLBVKF/v6WGHefzFPO1S5Hq7B2+NCfR2Qzn8yv4soB9QaVUF+sfDuM@lists.linux.dev
X-Gm-Message-State: AOJu0YyeCDtnU+IMgEwwx0BlxHo2ORpRsRluiXBNUy3cp+axwCRxcO85
	EEdBjFtXWqTLpDure2/4gLAnZ5WwDAY53gTnkhbsRL0h8l01PJgo+RWo
X-Gm-Gg: AR+sD10QUgys1gbQoXPAnPJzD8KKVk5H//Xrsg5lttZscrikc4K28W2btG4sMbstH9D
	FpS+FZU7+WP8RJKZrxKRaKvWvvQRp0CbbT9pspbXKbOSXcteiDhtWhaIKhKN8uMGacD+6QZSBEO
	7qLrh43Gr4NjMPGxJMRgXiuBM+zKPw9XuYHF5SwWlUAnqj5hXHAoz6ykZm2SqUWC8qcVYL5oB3U
	eVM1rS9V7JjUoktESmgUC8HwY/gNuhtIRBpZL1H6SqZikN/yJNcz4j67MysqJxaEirX4XQkAVZ2
	mPdl9idKA9XXR0gAT+BZvplDzdZWf+cNf+VV7/kVgWClhN6X0Vuu63rPuf+qd27uhuvkv9wJS0X
	aW20ftyHNn/KO5oJ6io5ZFrbnZ8QKAQStR/A4xK6uWLVQgyPu7RCEsnk9pjbkV8kbdjL96T2dES
	Tsz2lZJwJPG4u6F1IEF5ELTRfWuzZHNdmXi7wmr2q2M/FnxXtVgSqCk0PmAV66RF46xRQhQGjw2
	6qZpxWZaA==
X-Received: by 2002:a17:903:384c:b0:2ce:7563:70a5 with SMTP id d9443c01a7336-2d3b0d1254emr43666795ad.6.1786692221895;
        Fri, 14 Aug 2026 00:23:41 -0700 (PDT)
Received: from [10.22.68.200] ([111.223.92.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb27e40sm5720085ad.41.2026.08.14.00.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:23:41 -0700 (PDT)
Message-ID: <a9fbbe88-3d24-4ff5-9e47-89e3b8916450@gmail.com>
Date: Fri, 14 Aug 2026 15:23:38 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fuse: set FR_PENDING under fiq->lock in
 fuse_chan_resend()
To: Jun Yang <littleddfu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 fuse-devel@lists.linux.dev
Cc: Zhao Chen <winters.zc@antgroup.com>, linux-kernel@vger.kernel.org,
 Jun Yang <junvyyang@tencent.com>, stable@kernel.org,
 TencentOS Corvus AI <corvus@tencent.com>
References: <20260804091757.503476-1-junvyyang@tencent.com>
 <20260804091757.503476-2-junvyyang@tencent.com>
Content-Language: en-US
From: Tang Yizhou <tangyeechou@gmail.com>
In-Reply-To: <20260804091757.503476-2-junvyyang@tencent.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/8/26 5:17 pm, Jun Yang wrote:
> FR_PENDING means "queued on fiq->pending, protected by fiq->lock". It is
> the sole predicate fuse_remove_pending_req() uses to unlink a request and
> drop the queue's reference.
> 
> fuse_chan_resend() breaks that invariant. It splices every fpq->processing
> list onto a stack-local to_queue and drops fch->lock, then sets FR_PENDING
> on each request while holding no lock at all. From that moment the request
> advertises "I am on fiq->pending" while it is in fact reachable only
> through the caller's stack. A waiter whose wait is interrupted takes
> fiq->lock, sees FR_PENDING, unlinks the request from to_queue and drops its
> reference, and fuse_chan_send() then drops the last one -- so the request
> can be released while fuse_chan_resend() is still iterating over it.
> fiq->lock serialises nothing here, because the request is not on an
> fiq-protected list.
> 
> fuse_chan_resend() then walks that same list, and on the !fiq->connected
> path it drops fiq->lock and walks it with a non-safe list_for_each_entry().
> 
> Publish FR_PENDING under fiq->lock, immediately before the splice that
> actually puts the requests on fiq->pending, and fold the intr_entry cleanup
> into the same locked walk. A waiter that arrives while the requests are
> still on the stack now sees FR_PENDING clear, so fuse_remove_pending_req()
> returns false and it falls through to wait_event(FR_FINISHED) -- the same
> handling a request already handed to userspace gets. The !fiq->connected
> path no longer needs to clear the bit, because it was never set.

Hi,

I understand what you mean, because I found a similar issue during stability
testing.

I’m not sure whether others can understand such a lengthy textual description.
People usually prefer to see a sequence diagram to illustrate the issue.

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
>  fs/fuse/dev.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 5763a7cd3b37..e62c7ed8bcf4 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1781,26 +1781,22 @@ void fuse_chan_resend(struct fuse_chan *fch)
>  	}
>  	spin_unlock(&fch->lock);
>  
> -	list_for_each_entry_safe(req, next, &to_queue, list) {
> -		set_bit(FR_PENDING, &req->flags);
> -		clear_bit(FR_SENT, &req->flags);
> -		/* mark the request as resend request */
> -		req->in.h.unique |= FUSE_UNIQUE_RESEND;
> -	}
> -
>  	spin_lock(&fiq->lock);
>  	if (!fiq->connected) {
>  		spin_unlock(&fiq->lock);
> -		list_for_each_entry(req, &to_queue, list)
> -			clear_bit(FR_PENDING, &req->flags);
>  		fuse_dev_end_requests(&to_queue);
>  		return;
>  	}
> -	/*
> -	 * Remove interrupt entries for resent requests to prevent stale
> -	 * intr_entry on fiq->interrupts after the request is re-queued.
> -	 */
> -	list_for_each_entry(req, &to_queue, list) {
> +	list_for_each_entry_safe(req, next, &to_queue, list) {
> +		/* must be set under fiq->lock, see fuse_remove_pending_req() */
> +		set_bit(FR_PENDING, &req->flags);
> +		clear_bit(FR_SENT, &req->flags);
> +		/* mark the request as resend request */
> +		req->in.h.unique |= FUSE_UNIQUE_RESEND;
> +		/*
> +		 * Remove interrupt entries for resent requests to prevent stale
> +		 * intr_entry on fiq->interrupts after the request is re-queued.
> +		 */
>  		if (test_bit(FR_INTERRUPTED, &req->flags))
>  			list_del_init(&req->intr_entry);
>  	}

The solution looks good to me.

However, I hope you can truly understand the root cause of the issue and
describe it concisely, rather than simply pasting the AI's output, which would
actually make it harder for everyone to understand.

-- 
Best Regards,
Yi
