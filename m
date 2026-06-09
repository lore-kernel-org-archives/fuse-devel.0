Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4656526CE32
	for <fuse-devel@lists.linux.dev>; Tue,  9 Jun 2026 02:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780971984; cv=pass; b=Yg6LOBbWW8z0XJXoaFI9Ucq5drEkcpToSeofCtqRvk6mDeKGqGl9XOuwh2An49BBcRLYjZpzZBcYKbAkln7uBriLsjqS4Dp4hVmCni6RCht/ANOlN8DRsnOtldgSB9BYdgTxSFn1dyv5brkuPpROgSn/5Fzuexo+HSYkCCSkU2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780971984; c=relaxed/simple;
	bh=mfNxbP5MtccBoIsZCWbBcEooY93NBeGXvySxC47/47o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6yQX3LhtunmAd0KnvrubDCBYyOv4+oA/6tebbrZPo32w7rE9gQuSccXNW0+ZNvXrH3IW8voAdi5PIhivHGVqz1s6fLRfS7dkMiyv+ReGUM6GMiaQ1aiQlUKY8hql6X9R+LuUQV6F8UkFw03WBHuxdJ+BCAlQmUOJTooD7Zu/6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avKKm2gq; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avKKm2gq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso34496595e9.2
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 19:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780971982; cv=none;
        d=google.com; s=arc-20240605;
        b=R+U4RwcZmnwMGhF20piaIuqhXZLrP+6vyNzH5IJConCas/GCKHVpJ56HUibx/XDMV+
         DDl0RBMS1g0/KsMz6q89EheNJQ3FpyvnA/jv44quTJOW+LZRnM9nD6QSS6uQbfYmejeJ
         ScQKiKL6KnZOoT9vxPRYN1cfJnKIPBRIhTQKDxRhX5MbDXoIYqy5xEo1/Pal5X96vDVt
         GnV1Jk+dejfz48Cn6t9x0YwIwhfpbRjiNlHmQbrXEc9/PNB2RD7kvyhKnxsGUtidshvS
         LJ6/NtunA80rHjpMLs4Gupa1GUv1fpTST0bmCOuEpI+R4rqNhQZmiPbxlhxvQ4E/PHb4
         EzDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9SSo+gwBeyST4SOOBo0QV0u+tgO8mC7I0gbPqpD1WO0=;
        fh=fTg3OwAHFYWpA5tuD2aihpdR76kr4kfkMjLl4gWE5XM=;
        b=SCPmwm3YByCEEv7GFpujm0Fdo/ff+FOCuK98il9/zNyivte99ihhnsACwIYmhrsWyr
         P1QneUNBqPOS1n2YDsbc/GYo3tRyksagYFWEZlPyk8Inkf9490dWz29EIxzlW3kN29zs
         MAShB0WVYi2H3nqh8T2d0qr1OXUeCxM++EMmRFS2Ht/2cZAEnD7XDJu51kFKiHdo/hEZ
         9ro8iF93BkyBtfGcrhmxj+GANGz+gYQKXL5ubgx3we8Inj7X493SHrHvpJ+u00YqckF+
         sXAQaPJFAcVGW7s24DsYqh3uSiN+QjrA0AepFiEKA73X9X3grHCVmQdEURQabCmIeBG6
         aFxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780971982; x=1781576782; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SSo+gwBeyST4SOOBo0QV0u+tgO8mC7I0gbPqpD1WO0=;
        b=avKKm2gqSqEvPnbvgK5oqGV7+zecHU59I2mJKHK4qamkkIH5JH9Lg93hQGhSW2yeSl
         JaigHL7rViqwK9HkB/HQA5F0VzbqRNHkPMeBu2qCXs816GRDiSNtYfxhHcLMAC+NMFMu
         T/hue3giNQDNO2+ZWxGmy5bROh/O/NBAVqcVRe/DR+PfZcIMQeiT2rigiSG5vfa+E/qn
         U/jNo3+tS23qCVvzTHe3fqZ9qrrnEDIG2ZWbWXNpA3f0JlYFYVe76s25pMg/VZW+3cKN
         4q2Zz9bjkZWQA2uzk4RyHuGPMRTry62YA22jI+wXNjSBAHDz0oYtg4zfV5FXNAmDbXqF
         Ap6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780971982; x=1781576782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SSo+gwBeyST4SOOBo0QV0u+tgO8mC7I0gbPqpD1WO0=;
        b=DYfbQRqBqbZgmVr3HEsuw+opSNYa8vKY1Z7CADlno+1emZ9Vz1hbKxCankkFyWfELK
         xiN6RhO0PuCzNAIr0deIxgW5fzR06xlT3CHisauOOaydFgNtAgxpo1zQU6BXdPyjBojR
         ht1p5rP2sdmw25dgWm6INTa4RGgqDQJHhZW99wZ0AthplzquzvDgOxZCH19w6z2h79hc
         +AH7cs+1Jazcfmn2Z9BO45YXq1pABwdS2x0BPmjafvA5Ju5BSeREqzVHhwNL6qYUzIkY
         IG4cq4MZyr/ALBXCRz0VZyBMBvkhaA0ZVrJYEvKZHpjuOCGtu1jvX5nqpWv7I4fcnRhe
         QAjg==
X-Forwarded-Encrypted: i=1; AFNElJ8J+dXoZO86mPylDa4LFiOvSK2k06lAgKjnRawVX0o2hYY4Au4GZt3UH8TIJe64ZN+dH8oKGPB2oRfZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7Nsi9Igicfxt02vHZJ1/lMfnWWgoVmUs0CLk7o4kDWhOViRKl
	AsWH1Kg0Alqgk832fo83y2cIfo0CChkn/yh8BT3xJeMPISGiRPvXTA7SYrBZ1qSIsgQt47t0rRy
	RZffb8IIBuD6tKcVnrYYZ9s4LB0AQyQs=
X-Gm-Gg: Acq92OEGJVbSJjx0Nsmb3kRlGI/oHFuZo1sxOs9eWWXb+Odx7IaDds7d2pCAEoFUnsr
	iOg6tsK/zeY0GFWhiV0HQ3e3wGXxTUrdFH47iTDjnmQ8eQ3Rx9/QcE64e706Bwe97LKA4M1C06T
	Yc7OS05qL/F89cgFYGhbQZzCKhGcwW6QrqZ49NoDcp4mOvbr3qis+4fnZWb1Tp8aW87TvG8aDRU
	CgHgYZZ9wkiC6pAk/W3YeCyzkSEG5Bsda9VN4lnD8YcN9ypym+FwFVY4VsZDrWrGcFXQOU0J2SF
	xn0DIgXWYeqgvsmJkQ+g4nvLTGA3cj+IyP38LUkudls+n1mWG75rN8+U6Er585fqJh2DgnVkImj
	XHRWUBqAi
X-Received: by 2002:a05:600c:5290:b0:490:bd1d:472a with SMTP id
 5b1f17b1804b1-490c25b129amr274011195e9.15.1780971981565; Mon, 08 Jun 2026
 19:26:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260606-fuse-io-uring-race-fixes-v3-0-6fdf5e5b3437@bsbernd.com> <20260606-fuse-io-uring-race-fixes-v3-4-6fdf5e5b3437@bsbernd.com>
In-Reply-To: <20260606-fuse-io-uring-race-fixes-v3-4-6fdf5e5b3437@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 8 Jun 2026 19:26:09 -0700
X-Gm-Features: AVVi8Cc-vptBc45OsvAWTbUrdynFIoh7j8zSqNAMoL05MypbphMWqIB_MyP8la4
Message-ID: <CAJnrk1b17ECWkwfcUUpyC2_h38zkWrshUiFbXvdLWB9cctDWFg@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 4/4] fuse: clear ent->fuse_req in commit_fetch
 error path to prevent UAF
To: bernd@bsbernd.com
Cc: Pavel Begunkov <asml.silence@gmail.com>, Luis Henriques <luis@igalia.com>, fuse-devel@lists.linux.dev, 
	Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, Zhenghang Xiao <kipreyyy@gmail.com>, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 3:13=E2=80=AFPM Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> From: Zhenghang Xiao <kipreyyy@gmail.com>
>
> fuse_uring_commit_fetch() error path calls fuse_request_end(req) without
> clearing ent->fuse_req when fuse_ring_ent_set_commit() fails. The
> still-pending fuse_uring_send_in_task() task-work later dereferences the
> dangling pointer through fuse_uring_prepare_send(), causing a
> use-after-free.
>
> Clear ent->fuse_req under queue->lock in the error path, matching the
> pattern in fuse_uring_req_end(). Add a NULL check in
> fuse_uring_send_in_task() so the entry is gracefully recycled if the
> request was detached.
>
> Annotation/edition by Bernd: The UAF should be fixed by other means alrea=
dy
> and actually has to be avoided that way.
> Just checking for ent->fuse_req =3D=3D NULL in fuse_uring_send_in_task()
> would be prone to race conditions, because if malicious userspace
> would commit requests that have passed the NULL check, but are
> in doing args copy, it would still trigger a use-after-free.
> Setting ent->fuse_req =3D NULL in fuse_uring_commit_fetch() still
> makes sense, though. And an additional sanity check in
> fuse_uring_send_in_task() does not hurt either.
>
> Also reported by: Berkant Koc <me@berkoc.com>

Do you plan to add this as a formal tag?

Can you also add
Reported-by:  Shuvam Pandey <shuvampandey1@gmail.com>

given that they submitted the fix [1] when Zhenghang's patch was not public=
 yet?

[1] https://lore.kernel.org/fuse-devel/CAJnrk1YH_SC9doHp60Vuajc-mzQiopPExMP=
QVVDtFHzB8vTM6Q@mail.gmail.com/

>
> Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> Cc: stable@kernel.org # 6.14

stable isn't needed here, so I think this can be dropped

> Signed-off-by: Zhenghang Xiao <kipreyyy@gmail.com>
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  fs/fuse/dev_uring.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index 5dde86e8653b..df5103679c8e 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -935,6 +935,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cm=
d *cmd, int issue_flags,
>         if (err !=3D 0) {
>                 pr_info_ratelimited("qid=3D%d commit_id %llu state %d",
>                                     queue->qid, commit_id, ent->state);
> +               ent->fuse_req =3D NULL;
>                 spin_unlock(&queue->lock);
>                 req->out.h.error =3D err;
>                 clear_bit(FR_SENT, &req->flags);

Can we replace this with the approach Shuvam went with? eg

 +++ b/fs/fuse/dev_uring.c
 @@ -924,9 +924,7 @@ static int fuse_uring_commit_fetch(struct
io_uring_cmd *cmd, int issue_flags,
                 pr_info_ratelimited("qid=3D%d commit_id %llu state %d",
                                     queue->qid, commit_id, ent->state);
                spin_unlock(&queue->lock);
 -               req->out.h.error =3D err;
 -               clear_bit(FR_SENT, &req->flags);
 -               fuse_request_end(req);
 +               fuse_uring_req_end(ent, req, err);
                 return err;
         }

This properly decrements queue->active_background when terminating the
request and imo is cleaner aesthetically.

> @@ -1233,6 +1234,8 @@ static void fuse_uring_send_in_task(struct io_tw_re=
q tw_req, io_tw_token_t tw)
>         int err;
>
>         if (!tw.cancel) {
> +               if (WARN_ON_ONCE(!ent->fuse_req))
> +                       return;

Can you remove this part? If this path were able to be hit, it needs
more involved cleanup than return. The ent is in FRRS_FUSE_REQ on the
ent_w_req_queue queue, which means teardown will miss it since
teardown only scans ent_in_userspsace / ent_avail_queue, which means
the queue_ref will never get dropped, and there will be a permanent
teardown hang. Given that this path can't be hit, I think we should
just remove this altogether here.

Thanks,
Joanne

>                 err =3D fuse_uring_prepare_send(ent, ent->fuse_req);
>                 if (err) {
>                         fuse_uring_next_fuse_req(ent, queue, issue_flags)=
;
>
> --
> 2.53.0
>
>
