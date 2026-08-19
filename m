Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAF62E736E
	for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787133828; cv=pass; b=MSUBy8jt+mep4gBRbt4NO7dos14cPADArkgZx5c6c9tfH1EgJ09YoeU6qxlbBKUB4qerKCi4N+Tn+O0uaYQ0DfCUS0mj1NVxhrLJg/uBft0KXCn+TWIcUfUqvyAn+cZ7pdp/ay0/HsidpRGwUnL8Jm4IjUOjXjyBj0zcb9J3iGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787133828; c=relaxed/simple;
	bh=cmJLDyS/SK90TDLRktAH1/ZrTfQnZNGxg9EDC6cUuMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UlUYwvE6fzx3FxcUoD5khNZYk9bB5/2miRUNredenhnN2HQ6mXtWMleB6w2DvzoJDMwblSKBxzFb1NmY5vqZdXEZJYgequWXPKXS+0YgoG7PqYQhyOyR0V87jQDzlfUB5bbcjdo/WQ7cQXow6H2tDSDhssmYrmJCo3usW31HJmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=DxRHtSlp; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="DxRHtSlp"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c2a76536bso8249841cf.1
        for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 03:03:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787133824; cv=none;
        d=google.com; s=arc-20260327;
        b=fCzMHrJq6ol+Z73teBs2v9P0Sjj0NAJuGtKTRyaNu0H10SxBf82tn6iTbRxmypgTZ8
         lN4UA97BZGEvzdqU39cLErslEInW0Dh2D7MLK/9+YanFOzvIHVGLcsfuskdzVO7NULai
         aW8rQ3cEASwkresk30f3h0I7km9oiIDyjGQlq8Hi2duPQ9wb1X3RUvXyMk1X+R/z+9Ol
         8XbLHt40CW6NJiwhFKb8V5cg9EIGHl+7XXPskE4gn+jMA1369nbD7XO/Ip+Fq8Pu3MIy
         zgPMjjwEuXNLYKXVRSGMxC+LfUY9wCrxCRURWSZjd27Hf4mKG25DIt+T0+L/j5+e9t/C
         2bVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VpL0J+1FV2Yhgw5JBJ00bespL89ifkpTpt7Ktp55GTY=;
        fh=13KkkvHyWz2ZtPO3hchYK3jUDCCxpS9BZE3ncWDfiQI=;
        b=K4H351LdW5EFr+afQXuBlqKsRr6+RTuvo6WU7UQ4GDZxo0mGvXwsS0b5zl7Fl/DCX1
         6xpz0gDb1KwTatN+IrqFoWwL1bdHApIyMcnaiCodWJXvHK+nYe4pB0Z14t88onIn+hvx
         HAxy8yBuLcf75ufIF7In+Q18MbBSyJhXSygYQ9bh3rK2nOhhQqcKS2N4aJLloVcbUXL0
         lc/2Ye0+oI1vxg0K9hX2wIFld8iDb9rGZtYIOt18Un98fOPzEoHEL3sKI2lXIL8zGM2e
         RZ4LB4jj+xZ9nljMGZM4UhBUrc4AIM7B6DGdg/9mslCuL9hb94yPCHF43wGnHLFO8Rk3
         N8Gg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787133824; x=1787738624; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpL0J+1FV2Yhgw5JBJ00bespL89ifkpTpt7Ktp55GTY=;
        b=DxRHtSlpkhWh2ZsY26Wj/a4HoS2POi9y+LqJAfaEhU3zlYmdha6sb66ZbcQLXtm5db
         GpZr3V68lseFBHLtQEWHSH0wbzmQKwvZ9BI8jhckUg7MHvUieZtutx8NFHBxtfsE5KCZ
         dy47UD6ZIAENCSfl8k5PuawPfXM8l8cUvay5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787133824; x=1787738624;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VpL0J+1FV2Yhgw5JBJ00bespL89ifkpTpt7Ktp55GTY=;
        b=CpcqQzA3uPMFwE42EhaNiDffTr7oqJqzOlI9wewFoEkc8hrfjZkbk3V72p8EhnIwC9
         8hIpMRJLrb07MeexInuOKG7dNLtbvMcbN8zx9+Xo9xyBFDKd3c+EQ9RFga70w0JW1SRj
         0R6IeiIoR5StBHc7ajL4nUKXQ80KtKRV7iy/gxCUoRYE85jwNkJXL9P721IJpb2SasjO
         MsSeREZQJjuQU3CfMdV8cpEw3ZKG8vz6d5OTrFGPyyvj3APUob0sCLTxW8nPB4/fA7q1
         tTgviBXpy1FfelXfVU6DrfyaJyoE+YyfUJA8UVJVo219VJ/BckWsWt6HIiZXyqJw3PaN
         eDjg==
X-Gm-Message-State: AOJu0Yz8cmv4MloUjDTPKiDDdEGnc6u4Dik26oFu8YM+VGQIb6duW6rz
	jvUn5iDX6jdbIVRsDA45GYG44xlalaSfVxxPR3WcXVbwmbG/GKVTwcjFr9TtOx+9VvZIG2yLRRz
	F+8fzHb6xIQAmRNhFDi9cqpMlSSkCZFKyBRun+q3xwdhCIycNH/vMzYU=
X-Gm-Gg: AR+sD13KdDrBSVdvFjNvYsej3Y8X8Ib0yieW5N2DJQOpLTJWaf3qcH9S1Sau1dDXeOq
	joCmA1jsOnytD+w3FX/6QzZZhp6cqJSg592vH4egTk9BtBDuYyiix7yNCVYzi0XS/dNPDkYt4KV
	mKYa1O8vHnjnP5HK795i8r5KwHPM7+vfDp49gsiL/dhzd1B/7N2g0RxezWYuVByFsX+q5O9T57N
	9crNX4ub/q0iP25mxxVGzENVp0iyjObqSfhb6zU63BLXtyTo+2/Gi08xbMo9Fpyc4IeitARXD2z
	tVXRm4L3ZIXNKrEn7wwOXJH9SRnvCSnRccJtSHvEHLB+faM3cei02bcET0x/JCusWDQ64OfI4L4
	f
X-Received: by 2002:a05:622a:cc:b0:52d:78c9:9377 with SMTP id
 d75a77b69052e-52dd5cd88a0mr20375901cf.36.1787133824268; Wed, 19 Aug 2026
 03:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819023542.561653-1-senozhatsky@chromium.org>
In-Reply-To: <20260819023542.561653-1-senozhatsky@chromium.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 19 Aug 2026 12:03:32 +0200
X-Gm-Features: AcwNN1VSkBZXpXiJZbM7YAi7AdJBmXmHJpLQ_iikKMzrlDoXgsNzziLuV_-j2Rw
Message-ID: <CAJfpegu2wOG85R6KSvCwHOuxe2fWczA1KbrFcCZz=ofUch4K=w@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: permit freezing while waiting for request answer
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

[Cc: fsdevel, Peter Z., Rafael]

On Wed, 19 Aug 2026 at 04:35, Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Suspend freezes tasks in random order and doesn't take into
> consideration producer-consumer dependency that may exist
> between tasks.  One example where this can cause issues is:
> fuse server getting frozen ahead of clients, which then get
> stuck waiting for req answers that never come (the server
> is already frozen).
>
> Make all wait-event calls in request_wait_answer() freezer-friendly.
>
> This, however, doesn't address all cases.  E.g. in-place
> PM-freeze of a request_wait_answer() task holding a contended
> VFS lock still will block suspend.
>
> Note: this uses TASK_FREEZABLE, not TASK_FREEZABLE_UNSAFE,
> which may trigger debug_locks warning during suspend (if
> request_wait_answer() task holds some locks at the time
> of freeze.)

This is not okay.  I see the "no new users" warning on
TASK_FREEZABLE_UNSAFE, but this needs further discussion.

Existing users of the _UNSAFE variant are NFS and samba.   I haven't
checked the context where these are called.

Apparently __sb_start_write() uses the safe variant, yet I'm quite
sure it will be called in various locking contexts.

Why is this unsafe exactly?  Does that unsafeness apply to
filesystems?  If so why do we allow freezing while blocked on
sb_start_write()?

Thanks,
Miklos

>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>
>  fs/fuse/dev.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 34106f6e66a0..42098ddc2587 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -701,8 +701,9 @@ static void request_wait_answer(struct fuse_req *req)
>
>         if (!fch->no_interrupt) {
>                 /* Any signal may interrupt this */
> -               err = wait_event_interruptible(req->waitq,
> -                                       test_bit(FR_FINISHED, &req->flags));
> +               err = wait_event_state(req->waitq,
> +                                      test_bit(FR_FINISHED, &req->flags),
> +                                      (TASK_INTERRUPTIBLE | TASK_FREEZABLE));
>                 if (!err)
>                         return;
>
> @@ -717,8 +718,9 @@ static void request_wait_answer(struct fuse_req *req)
>                 bool removed;
>
>                 /* Only fatal signals may interrupt this */
> -               err = wait_event_killable(req->waitq,
> -                                       test_bit(FR_FINISHED, &req->flags));
> +               err = wait_event_state(req->waitq,
> +                                      test_bit(FR_FINISHED, &req->flags),
> +                                      (TASK_KILLABLE | TASK_FREEZABLE));
>                 if (!err)
>                         return;
>
> @@ -740,7 +742,8 @@ static void request_wait_answer(struct fuse_req *req)
>          * Either request is already in userspace, or it was forced.
>          * Wait it out.
>          */
> -       wait_event(req->waitq, test_bit(FR_FINISHED, &req->flags));
> +       wait_event_state(req->waitq, test_bit(FR_FINISHED, &req->flags),
> +                        (TASK_UNINTERRUPTIBLE | TASK_FREEZABLE));
>  }
>
>  static void __fuse_request_send(struct fuse_req *req)
> --
> 2.55.0.737.g08866a6d13-goog
>
