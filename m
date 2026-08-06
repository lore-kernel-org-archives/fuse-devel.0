Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE4E432BD4
	for <fuse-devel@lists.linux.dev>; Thu,  6 Aug 2026 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008087; cv=pass; b=HqHEDI+A2xzq3XwNZbDdS+JXy1gyMAXBEsQjn6bMzuvs7b8G15cDjN5+b/wJx2k50rEn7nP9JrxFaQXPWJlheMznaWJMoapFg0YX96NBAIXwLNBAWiljPbdKrGTPgXg2bMXVYqMvTY2mFh2Qxztop858FRdsIyZcyiJ5awd/tvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008087; c=relaxed/simple;
	bh=cviwh+e20306QiHXUmXVuupkN4WLpqqTDQe5VAey7fM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKqreGheFonYqPSWij5+9Upp26/KC9UQD7ECn/W6xv2p9+c+Bp8nMcxxQAXGkyjflf/uBE5iH6u/km7k5UuwNeRkSlBZ65lRAq18hQzAhKecc5gsu1/oEBvBvbOoDqAfdtRzr7hhQHx5Xa9fRSeXTqGvmb6N9FZlYBJIk1csFhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=WSLuzqeE; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="WSLuzqeE"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8486672f03cso2398228b3a.0
        for <fuse-devel@lists.linux.dev>; Thu, 06 Aug 2026 02:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786008083; cv=none;
        d=google.com; s=arc-20260327;
        b=Tvw0Tb3YtwhNFqgGNzAyDCJQpuJ4ZL6ug5CKuyNNd68oLWnuCYG3k4jIAzRWL7xO3Z
         kxy+OEOSG7g4qfZf4iS/xSqdn1KZTUidxa+vh2DSYUSIXFial/B3jjIRH9NYzNxvKMfu
         LL2uQ0dehLMPyHW+CDoCegKeCDBMQ9Ck5VN68AYcu1WP0wPmOXCfhj9phSNwNE6aYT7T
         6TLagp3s9kxjaSB5HMxfepwZ7c0XSWVguMR/Nyq0woovx8g/mMJecaaJTu0V1ufwvYoe
         ONRX0ssoBAYO9KYXVHq/itWZzDYTpXukE76XZ9A57FXDA0ZjMSjB0/QQd3cFcK8q6sYr
         1OYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=faN4shZy0Ja2BD4Q/ks9x5g9Jc7AQAuKetFzWsPR9Qg=;
        fh=M135VW8we6SlkJk/T+FtsSTZFLqfAAJrO1OQJMEED9w=;
        b=d8Wv0TVS98FKMWdlzGFVSCzfkdNKqdb62zmmGOQpq+mZEOujpgmxBge1kK803j3KUZ
         prXLk6aQx/mFDVlrCLzZtNE7mnhPM2AxIUiF6FQBgxcIz42M7nFI32I5i38glWcmZgz3
         MpIBGZ5QVCqcoGtyuvOlTKWgIZTrIP1eucz2uXS7hdy31e6Jmiu7nOOIUBIkhOf/RBiE
         /O1doKsoeTMr+vZUqRiKHNGukS6ZJ8wtjehSigt3MDa4omm3mrp1LcJM7no19pZUoOUi
         aoXtQuZqPNq0pO3R1mBIAe6EAesHrzLPb7RkaZXxdgJQ3FPFNbONaG98lzea+nCDIOaD
         46SA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1786008083; x=1786612883; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=faN4shZy0Ja2BD4Q/ks9x5g9Jc7AQAuKetFzWsPR9Qg=;
        b=WSLuzqeEKFvOCv+ke7wOGULQ2fRN944WaUAFG5+xJjIDuUd+F6JXvvoNx14byPrriP
         EM3oFj67WK1reh26GCTvqUtzkW3ImAbgxvx9d0I1Ouucn3RVvGhK5rl6LeoJprknhbuj
         60NstPKgRwWHuCfBGvGTImtOvi594jJ2uMLfwbKec1g3U4H2mSTAWSvkd1biKbOx60M1
         s0qx1mFwV1NXA2p2TyBWv3SVs6MXEeDFd5z5M03M1e30P1/b+/D2Da/QIbQT7WZlMqN+
         dFuLTxBmVdT5aZeKBXpfEcZfS6DUrKryCS4gbBgi+D9xhDrwWMXbHxIhqAL9nz/pXfTu
         VY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008083; x=1786612883;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faN4shZy0Ja2BD4Q/ks9x5g9Jc7AQAuKetFzWsPR9Qg=;
        b=UjY2kq6o37PnB8Yg2LZIBu4N/l2HqNdr6WaxpPJ3H3tLMjx7rx3ccanauMKRJ7bZfF
         cVVLelG5oBAkH4El70OnNVgggzDX78IARNJ+MZDNSzlR6BDgvk9CDYAvJpc15PjhYfMQ
         gLYdbJUXLaLl75eliK3UFRPFoH5LPA7MvahpURYnTrDDIrh5BzNpf+KtaiK2jIXbOOrP
         olzCoGdx6uKhabPunf/J55+F/ic0Dtr6Lf60XL5ONaSNZsUm3ugYBCHKH6KaYdIRTDuL
         5N18zWsL32MhvxV0Vv5bYUfYxxzDf9vJcvPnx8O2sVoSVDwJKlsRZ6qo0ymhHdbIVMH5
         KLww==
X-Gm-Message-State: AOJu0YxtlUXLiofYTsHLivLe9ts/JB8R7QJtT5U3vKRW5uCCdFWkPhnX
	BdNQwliIQ+ixnnKxa4Jtnzcd+TjOjjKWx/Axc4fNsiGXLiDk2UWv4GYak2geiX5zQ+MSCsFwxt2
	4bOpd7Yu39YaPibpTa/QVXBLFyRPGTAy3FnN7e3kEvpvGIwJiBcWmcZ/lSw==
X-Gm-Gg: AR+sD10hnZmMIe+JR9dQoMqt0+nrRAla9OODUbd5LWt+Fl2/JDDKdva/yzirxOrOWqh
	9xLPEBlOZhcHSwjRPGRdTkXKyx4dgb+6JMvTRvlu7ceE2QzEWRO8NHucWuEM7Z6EdKGQXE3uCl8
	FLFiK/HYpxM4d1UP4uST3/62pbtgl9l2ZYd8kLEyu3cMaHlDo2fPrKlpzoWz4RQ0dkaueYFDpuO
	UqMlpVEfD2Z1RgQwpjn43f677AECsH4TeFN9UpMBgSGt/E6ScYxl/fkugzmA8YsKrc1QgyDAIoL
	CVGw15aNfLxybhl+9EysOGc7KdfSG5F8DwX0QFsimF/b
X-Received: by 2002:a05:6a20:918e:b0:3c4:1c9f:d81 with SMTP id
 adf61e73a8af0-3cb85e2b5ffmr12956984637.7.1786008083303; Thu, 06 Aug 2026
 02:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805071006.26275-1-mingyu.he@shopee.com>
In-Reply-To: <20260805071006.26275-1-mingyu.he@shopee.com>
From: Mingyu He <mingyu.he@shopee.com>
Date: Thu, 6 Aug 2026 17:21:11 +0800
X-Gm-Features: AUfX_mwSFofX474rlJYvE3w7VISJj5m_LVc04TYapp2THPb30xq5kXHmUhx5AlM
Message-ID: <CAAoBcuSRsSnPo3jK11N0dxq6zXZtivfXeE-4SPL7NUKhmQsc=w@mail.gmail.com>
Subject: Re: [PATCH] fuse: serialize resend state transitions with fiq->lock
To: fuse-devel@lists.linux.dev
Cc: miklos@szeredi.hu, libaokun@linux.alibaba.com, winters.zc@antgroup.com, 
	littleswimmingwhale@gmail.com, Jun Yang <littleddfu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

oops,  I found that Jun Yang <littleddfu@gmail.com> also sent an email
that have fixed same problem.  Recently I am working for fuse recovery
mechanism for my company, and found that problem. I was working for
this problem on 4th Aug and sent this email the next day, so I didn't
noticed that someone else had already sent an email before me.

As Jun Yang has resolved this issue more completely and sent email
before mine, I suppose to ignore my email and consider his solution.

Thanks!

Link: https://lore.kernel.org/all/20260804091757.503476-1-junvyyang@tencent=
.com/
https://lore.kernel.org/all/20260805071006.26275-1-mingyu.he@shopee.com/

On Wed, Aug 5, 2026 at 3:10=E2=80=AFPM Runli <mingyu.he@shopee.com> wrote:
>
> fuse_chan_resend() moves processing requests to a private to_queue, then
> sets FR_PENDING before taking fiq->lock. A fatal signal can consequently
> remove and free a request while it is still being prepared for resend:
>
>   CPU 0 (request holder)          CPU 1 (resend)
>   ----------------------          ----------------
>   request_wait_answer()
>                                   req moved to private to_queue
>                                   set_bit(FR_PENDING)
>   fatal signal
>   fuse_remove_pending_req()
>     list_del(&req->list)
>     __fuse_put_request(req)
>   fuse_put_request(req)
>     free req
>                                   clear_bit(FR_SENT)
>                                   update req->in.h.unique
>
> Hold fiq->lock while updating the requests and moving them to
> fiq->pending, serializing the transition with fuse_remove_pending_req().
>
> Connected requests retain the same flags, unique IDs, and queue order. On
> disconnection, fuse_dev_end_requests() still ends every request, while
> requests that were never requeued are no longer marked pending or resent.
>
> This also combines the two linear list walks into one, reducing the total
> iteration count from 2n to n. The fiq->lock critical section remains O(n)=
.
>
> Fixes: 760eac73f9f6 ("fuse: Introduce a new notification type for resend =
pending requests")
> Signed-off-by: Runli <mingyu.he@shopee.com>
> ---
>  fs/fuse/dev.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 5763a7cd3b37..fc1f5b9f100c 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1781,26 +1781,22 @@ void fuse_chan_resend(struct fuse_chan *fch)
>         }
>         spin_unlock(&fch->lock);
>
> -       list_for_each_entry_safe(req, next, &to_queue, list) {
> -               set_bit(FR_PENDING, &req->flags);
> -               clear_bit(FR_SENT, &req->flags);
> -               /* mark the request as resend request */
> -               req->in.h.unique |=3D FUSE_UNIQUE_RESEND;
> -       }
> -
>         spin_lock(&fiq->lock);
>         if (!fiq->connected) {
>                 spin_unlock(&fiq->lock);
> -               list_for_each_entry(req, &to_queue, list)
> -                       clear_bit(FR_PENDING, &req->flags);
>                 fuse_dev_end_requests(&to_queue);
>                 return;
>         }
> -       /*
> -        * Remove interrupt entries for resent requests to prevent stale
> -        * intr_entry on fiq->interrupts after the request is re-queued.
> -        */
> -       list_for_each_entry(req, &to_queue, list) {
> +
> +       list_for_each_entry_safe(req, next, &to_queue, list) {
> +               set_bit(FR_PENDING, &req->flags);
> +               clear_bit(FR_SENT, &req->flags);
> +               /* mark the request as resend request */
> +               req->in.h.unique |=3D FUSE_UNIQUE_RESEND;
> +               /*
> +                * Remove interrupt entries for resent requests to preven=
t stale
> +                * intr_entry on fiq->interrupts after the request is re-=
queued.
> +                */
>                 if (test_bit(FR_INTERRUPTED, &req->flags))
>                         list_del_init(&req->intr_entry);
>         }
> --
> 2.47.0
>
