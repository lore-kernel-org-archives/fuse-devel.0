Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DAF352C52
	for <fuse-devel@lists.linux.dev>; Thu,  6 Aug 2026 07:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002056; cv=pass; b=YcvPiKXsmj2UH+J/vZRTJFiK42WdQHquBdkhN3ajC1qSohApjcWkg+u2m0haB5aegnqgDXmGfNR62HTeBaGaz5EW6/nl5jcGlbR4oqn1F8elR9qUYCr/qaR6C006RASE9YlxnUrEJ2H4Ms3SsG5kDXuSj0d9iuaWsU7ZPl6vHJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002056; c=relaxed/simple;
	bh=vyDsItitL/VUg0TCImiFTzvwWgG4k1gO0r0ApnhsMBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HwZP8DLxEp/Jwj2UxiFcXHb9tSuIxUmQfJzw1lQ++7VOH5ETXl8EQrLtxVdj2BffEEACGH9FOwwcDaExXLd4MrbVX2gPPyJSXV4KKpiN9xrxf8HudC2U2Y7XPMO2/dOVLBmp+re3IqgXrXUoq5hZKeheqOeLhuG+l1S0CIPCL0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzKrX0IR; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzKrX0IR"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e99ef0902so103269585a.2
        for <fuse-devel@lists.linux.dev>; Thu, 06 Aug 2026 00:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786002053; cv=none;
        d=google.com; s=arc-20260327;
        b=WJrWFBAfgnMGlf1b/L1YuGGphCLPIZ+bf7GeKX2SXlOrsv+ZKHVv067aPbqp3a7SL+
         oc/5/jTtyZ7oPDc2cQ8+w30nVYKq81lMoeDUm1IcHcBs6UgsRi56b2MyW4nFOvq58P/l
         94IMQHcPsnMk5Cf8+BiZavFD/xHW8YV3i+EpJZnDn3G+M0T3s47rXkERj+mRxV8BHbKV
         BTg14HJdXQFArUIEP3YsQEzc2pt9l/PaBGkBFJhDSXnZq2zQZ/NK5g3Og9edLR2JPluK
         mM+YkuhAdrczMO/DLJr8cDJchExyEYihn0FA7//6W/FrKPj2JwoGihcSudMpWURd4x7e
         D56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=37DNYH584RQR0c1a1t67teM9/6ensH+lBvw1aVuJotk=;
        fh=/54nqxHLW9K0E6vjrILDTtjss3Iw7N6C3N2n/N/GvtM=;
        b=ssgb8pAXxbzRCsx58OacB/Qgk+ApbywB5DN6xgveSvSmM8LL14UzrDhJnWfxkD3jCv
         t1Wz5gW52t7D09Nyk7stpFFRFrH1zIAVvBP69YdnrWwtYhno2DwuKOTf2a0OMFXNT5X1
         y0AsUNb+4ZniiUb4rUcfJiQ9dO9pG/8FfIzpBYpdebiVkrLyyIiDYR10/p3coz88Erl4
         ZE7cN8vXL4+/gH84BRIlk2GCJB0WnApX3478H64iBL8U1vqzhMYagNlOaN6M2L/uXDdO
         IhpC2Rqe2T9v9RCWgLx8xN43xDDHyKc7jGNdM0lVi44awlf7R/uvsu0XwrOJe20m5H7U
         Xn1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786002053; x=1786606853; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=37DNYH584RQR0c1a1t67teM9/6ensH+lBvw1aVuJotk=;
        b=nzKrX0IRZgVm9DmRhRrqBwl9wMpxT1m6euroomMCIMKsaxOKwIeR/S52IZyYaw/0bs
         LlyeUNcb027lkITfY3peCOsiL3CkfGmG9dAXc8nERJC5lx/anxGHpyN7ssHK/k7Hmyhn
         cwYanAGPSnsqBe7izvsxWZ17Dlglc0zYdJzFNjDGeKQMDshVG1UkGcbuj4iJQf/N39pd
         0jbvvxrdyXMrnou7xTHXMZ/NXMUhYhQ7bNh7VM8Szm3kOe81rWGuiLwk0Rag/hNWccrq
         CYT0HcwcX0PxHBIQEvoUzudwAMusqndtt+NbkarQeNZQhPsr2H78DkPQ+1vN5eM8YUEc
         r+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786002053; x=1786606853;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37DNYH584RQR0c1a1t67teM9/6ensH+lBvw1aVuJotk=;
        b=LO9qwKNc/aAyWZB8+Ty3K5YruHsxzuUgBqIwfzUZr8VZc9fElOcnGnB1yVtNEjZoGB
         D7oId+e1Q3kgpZBX+QZl2AB6fn28OjTycg4gmwTLZPByMbau34tE9vFw56SmyGzbCtEg
         uueDbKMCFEWrYr1+koGs8TURGWzNVEo8vlnyTQntwcPZqhKTLKoOoFpPZiaJIPlgWGPB
         GPLaB/RqxOUjm4BMbJeh2P8Y9QfPHlepUQSSwv34R6upr8OjUIOMXR4azANRtgunRELk
         hQNX2iI+U5pqUOIZsUr+VXcKB6YChBgVzCYIFOQYVOFVGUmGF8ESdwYAGeMqhLkMdCV7
         gj+w==
X-Forwarded-Encrypted: i=1; AHgh+RpvJz+58SrfI2dd3wagBnHyz+kBcCYCfhHiOpPnct0U5ocSaYZsMjA8+MaZOyMNh71mV6z+b2tO7OZa@lists.linux.dev
X-Gm-Message-State: AOJu0YwD4pR6qDYp3U8ceyEuPXzd4Gy+hkyPbJTH0Nz0YcHYQS3vckM4
	ZGh5QN1Rl0LcmQGxbQqmYn9ZramfbNkl2ildZjPmgJQ5WBzzc02pKkiJMZYOPYFp/onVYi0kWyQ
	53WeNN3WoIi1k0SnR5v70yEj9BHgvKTY=
X-Gm-Gg: AR+sD10zH0a2LZhxbSistBNEWfJKzUrsu2ZyQQxX9DdI2cKWGsdANhVP5mWOxyl/rSx
	c7n8le5X8eJjuEf6nfWgt6Qra2IIGh1suoktuorMNowbVOSdNLimCYox6JfzhJVpyMIvxbM7MMB
	BM3EORUBjh8/LuQxL/x5iFwT7zFJHwlQwQyBHDGQtSrX8VeYd/gmG3R8XKGINLK8k+5pYqKwgFg
	RW5RsLnUzYGFtA8uW1yf4tiKUv9+aFbgLi5ymT1Dqtga7lvXyOFP1aaam+Zgpt7/r/kc5DW4BCr
	uZhrYZLoxNeoRkoZyBF9JK9qh1JwBcl60nkP/3YIrF8jj4Bh+eVoplxx
X-Received: by 2002:a05:620a:aa12:b0:930:f1ea:8cf4 with SMTP id
 af79cd13be357-936491c0258mr1191115485a.47.1786002053388; Thu, 06 Aug 2026
 00:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731070102.5850-1-xuewen.yan@unisoc.com>
In-Reply-To: <20260731070102.5850-1-xuewen.yan@unisoc.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Thu, 6 Aug 2026 15:40:30 +0800
X-Gm-Features: AUfX_mwZOCv89LmJaP0g_KVXJ8AtAYS6qoMeSScusqiPP7dLxvG6y4IlwoY80FY
Message-ID: <CAB8ipk8CyuPRQv2mSwnc-ssj2Aes=eFdpDDk9nuxEwxMOCS9Dg@mail.gmail.com>
Subject: Re: [RFC PATCH] fuse: give wakeup hints to the scheduler for
 synchronous requests
To: Xuewen Yan <xuewen.yan@unisoc.com>
Cc: miklos@szeredi.hu, cmllamas@google.com, tkjos@google.com, 
	jstultz@google.com, quic_pkondeti@quicinc.com, quic_pragalla@quicinc.com, 
	qxy65535@gmail.com, ke.wang@unisoc.com, pin.xia@unisoc.com, 
	fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miklos,

Any comments?

Thanks!

On Fri, Jul 31, 2026 at 3:03=E2=80=AFPM Xuewen Yan <xuewen.yan@unisoc.com> =
wrote:
>
> When a synchronous FUSE request is sent, the in-kernel client queues it
> on fiq->pending and wakes the userspace daemon sleeping in
> fuse_dev_do_read()->wait_event_interruptible_exclusive(fiq->waitq, ...).
> The client then blocks in request_wait_answer() waiting for the reply,
> so the waker is about to go to sleep: this is exactly the pattern that
> WF_SYNC is meant to optimise.
> As Peter Zijlstra explained in the earlier discussion [1],
> WF_SYNC is a hint that the waker is about to sleep and the waker and
> wakee share data, so stacking the woken thread on the current CPU
> is beneficial for cache locality instead of searching for an idle one.
>
> Add a wake_up_sync() wrapper for task on the synchronous request path.
>
> Performance:
>
>   On an Android big.LITTLE device where the FUSE daemon (MediaProvider)
>   runs as a background service on the little cores while foreground
>   applications run on the big cores, the synchronous wakeup hint lets
>   the scheduler pull the daemon thread onto the big core that is
>   issuing the request, where the request data is cache-hot.  Measured
>   by qixiaoyu [2] on a 2000-picture zip decompression to /sdcard:
>
>     ------------------------------------------
>     | Default   | patched     | Improvement |
>     ------------------------------------------
>     | 13.0 s    | 7.0 s       | 46%         |
>     ------------------------------------------
>
>     Server thread wall duration: 3583 ms -> 1276 ms
>     Server runs on big core:       5% -> 79%
>
>   The original 4K-file copy/compress/decompress workload [1] on the
>   same kind of device showed a ~28% improvement (13.8s -> 9.9s).
>
>   Note: Miklos reported [2] that on his test box he could not observe
>   an actual migration from wake_up_interruptible_sync(); the benefit
>   appears to be most visible on asymmetric topologies (big.LITTLE,
>   where the daemon normally lives on a little core) and on workloads
>   dominated by small synchronous requests.  No regression was
>   reported on the symmetric- SMP test setups tried.
>
> The earlier version of this change [1] added a `bool sync` argument
> to all three hooks of `struct fuse_iqueue_ops` and threaded it
> through virtio_fs as well.  Miklos questioned the interface churn,
> and the patch has been stalled since.
>
> Re-work it so the exported interface is left alone.  The hint is
> carried in a new FR_SYNC_WAKEUP bit of the existing `fuse_req->flags`
> bitfield (an `unsigned long`, so no layout change):
>
>   - __fuse_request_send() sets the flag before fuse_send_one().
>   - fuse_dev_queue_req() consumes it with test_and_clear_bit() and
>     forwards the result to fuse_dev_wake_and_unlock(), which then
>     picks wake_up_sync() or wake_up().
>   - The forget, interrupt and resend paths pass `false` explicitly,
>     preserving their original wake_up() behaviour.
>
> Only /dev/fuse ever wakes fiq->waitq; virtio_fs and fuse_uring
> dispatch through their own transport and never call wake_up(), so
> threading `sync` through their ops would just add an unused argument.
> test_and_clear_bit() makes the flag a one-shot hint that cannot leak
> into a future requeue, and no extra cleanup is needed in
> fuse_request_end()/fuse_put_request().
>
> [1] https://lore.kernel.org/lkml/1638780405-38026-1-git-send-email-quic_p=
ragalla@quicinc.com/
> [2] https://lore.kernel.org/lkml/20221222093407.GA1141@mi-HP-ProDesk-680-=
G4-MT/
>
> This work is based on "Pradeep P V K <quic_pragalla@quicinc.com>"  and
> "Pavankumar Kondeti <quic_pkondeti@quicinc.com>"
>
> Assisted-by: TRAE:GLM-5.2
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> ---
>  fs/fuse/dev.c        | 22 ++++++++++++++++------
>  fs/fuse/fuse_dev_i.h |  3 +++
>  2 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 5763a7cd3b37..689470a548a2 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -210,10 +210,13 @@ EXPORT_SYMBOL_GPL(fuse_req_hash);
>  /*
>   * A new request is available, wake fiq->waitq
>   */
> -static void fuse_dev_wake_and_unlock(struct fuse_iqueue *fiq)
> +static void fuse_dev_wake_and_unlock(struct fuse_iqueue *fiq, bool sync)
>  __releases(fiq->lock)
>  {
> -       wake_up(&fiq->waitq);
> +       if (sync)
> +               wake_up_sync(&fiq->waitq);
> +       else
> +               wake_up(&fiq->waitq);
>         kill_fasync(&fiq->fasync, SIGIO, POLL_IN);
>         spin_unlock(&fiq->lock);
>  }
> @@ -230,7 +233,7 @@ void fuse_dev_queue_forget(struct fuse_iqueue *fiq,
>         if (fiq->connected) {
>                 fiq->forget_list_tail->next =3D forget;
>                 fiq->forget_list_tail =3D forget;
> -               fuse_dev_wake_and_unlock(fiq);
> +               fuse_dev_wake_and_unlock(fiq, false);
>         } else {
>                 kfree(forget);
>                 spin_unlock(&fiq->lock);
> @@ -251,7 +254,7 @@ void fuse_dev_queue_interrupt(struct fuse_iqueue *fiq=
, struct fuse_req *req)
>                         list_del_init(&req->intr_entry);
>                         spin_unlock(&fiq->lock);
>                 } else  {
> -                       fuse_dev_wake_and_unlock(fiq);
> +                       fuse_dev_wake_and_unlock(fiq, false);
>                 }
>         } else {
>                 spin_unlock(&fiq->lock);
> @@ -281,11 +284,13 @@ EXPORT_SYMBOL_GPL(fuse_request_assign_unique);
>
>  static void fuse_dev_queue_req(struct fuse_iqueue *fiq, struct fuse_req =
*req)
>  {
> +       bool sync =3D test_and_clear_bit(FR_SYNC_WAKEUP, &req->flags);
> +
>         spin_lock(&fiq->lock);
>         if (fiq->connected) {
>                 fuse_request_assign_unique_locked(fiq, req);
>                 list_add_tail(&req->list, &fiq->pending);
> -               fuse_dev_wake_and_unlock(fiq);
> +               fuse_dev_wake_and_unlock(fiq, sync);
>         } else {
>                 spin_unlock(&fiq->lock);
>                 req->out.h.error =3D -ENOTCONN;
> @@ -752,6 +757,11 @@ static void __fuse_request_send(struct fuse_req *req=
)
>         /* acquire extra reference, since request is still needed after
>            fuse_request_end() */
>         __fuse_get_request(req);
> +       /*
> +        * This is a synchronous request: the caller will block waiting f=
or
> +        * the answer. Hint the scheduler via wake_up_sync().
> +        */
> +       set_bit(FR_SYNC_WAKEUP, &req->flags);
>         fuse_send_one(fiq, req);
>
>         request_wait_answer(req);
> @@ -1806,7 +1816,7 @@ void fuse_chan_resend(struct fuse_chan *fch)
>         }
>         /* iq and pq requests are both oldest to newest */
>         list_splice(&to_queue, &fiq->pending);
> -       fuse_dev_wake_and_unlock(fiq);
> +       fuse_dev_wake_and_unlock(fiq, false);
>  }
>
>  /* Look up request on processing list by unique ID */
> diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
> index 668c8391d61c..40a791094813 100644
> --- a/fs/fuse/fuse_dev_i.h
> +++ b/fs/fuse/fuse_dev_i.h
> @@ -38,6 +38,8 @@ struct fuse_iqueue;
>   * @FR_PRIVATE:                request is on private list
>   * @FR_ASYNC:          request is asynchronous
>   * @FR_URING:          request is handled through fuse-io-uring
> + * @FR_SYNC_WAKEUP:    use synchronous wakeup when queueing this request=
 to
> + *                     give the scheduler a hint about the waker task
>   */
>  enum fuse_req_flag {
>         FR_ISREPLY,
> @@ -53,6 +55,7 @@ enum fuse_req_flag {
>         FR_PRIVATE,
>         FR_ASYNC,
>         FR_URING,
> +       FR_SYNC_WAKEUP,
>  };
>
>  /**
> --
> 2.25.1
>
>
