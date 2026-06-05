Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556AC4071DD
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 23:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780703693; cv=pass; b=JgOt/efMsnZJaAmyHKIIhzF0n9VL3diRSM/GNbwcm7eZlDu7sZfdOjDztKOStP/ywlRhS7H1zrJVTVVRjLRGGxubhb9CRr3GV5zRzEtYCEKg80FBbJIROOIh0AUwKZTr9xowz025bGWcwntkNGv0OTl/0JKy8dM168bgm44LsG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780703693; c=relaxed/simple;
	bh=8eyNbT/xjIi783GCA4LqpiZnMosEaANaWRcuohB7fA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UeTiGSY9awl6Ri8BVi8uyIE5IPmTa0K/xY2xgbYWbksIadpKJ3XYwi16xc8llicYnsfrh9JX6B5vY0jQ8RFTUUg1YEqfIwqQcwmqq0DYApRGh1/koltz4VlH8Njox1fTU3KAaUuGIeX3fBaQFQse1xlQvtZFmSLfN/z8hiwGEI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ay5d4awR; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ay5d4awR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b613a17bso23735315e9.3
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 16:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780703691; cv=none;
        d=google.com; s=arc-20240605;
        b=YTqmLdpDTrka1Xx0mxBGAUfNKrjA7Z+mi8GTNdAMbIOunscaumluUQLKRgrx8oJMub
         2Qp5F1oARmi1qJcsjp48CJpVFTiSYZUf83Ox6mXerEVhyV+2cdP/CarxuZkdZWIGze7t
         ffh4SaPABQsh3XgMGIGQV/MMpkKNrkByI0qTcQ/4EcfXpuZ6hyQ1Wi0JB4SCbMiCZaNw
         JqXbME1oWT720JmuzEKpi4UJ8f1BT+xCnGdUU5vtU/uQRRUDw3dXuIRww9IdYNeK6i9B
         Bkfv4I9Q0NDaR/r40xYRgYBBTFq9XjNNv85zSRtnyBGZoDOoeVXzP/QF9K5Ycx3C1Fm2
         06gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QCKTB9eiQHhf3+5KhIRHF9+wrSCeXtJWVtvMG4iRxsU=;
        fh=jww5WMZYYrasZ5KBW1MLvN3fDqUjBJX6h1JP5/LJln0=;
        b=kwfdmDrVzen97zz32f4Yqkz7cCxepmsy+FE4JRZzSvOmleR+G/iZWu/kj1wh0wXK/y
         ejl4t3/LA/4fQ1jQWIrte/uApRdaod9WHY8eiFuIiRorjpZtGGokY+eixMSscqgsxS+u
         l249Z5l/7mtrMNXEGQBjkeNztcWvvhGH94AYB6glY12xI0rHZmeJGHelrJ/QpLGj8Mo+
         p+9k+hJiLgM68LqSwD4uahXyWTIy3ju12fEiNzKSOUpoF79MahTFfXgINy9XwEARcGFj
         iJdfk5C16TaRSF6ffD+TJYHUt1hCHdIbeeNExs2xs55WsxCinmVAqoFsviPpuAFT+nhR
         vL8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780703691; x=1781308491; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCKTB9eiQHhf3+5KhIRHF9+wrSCeXtJWVtvMG4iRxsU=;
        b=Ay5d4awRqkFBS/MVQGLhZ94CiOcY5NaNMne4BYV9cOU/nV+S7Dx2Lp0oWx/l69R1ZJ
         1r+ABW1ncNNFAbwOShfMF3XduOJnVofebF0QCEZznZVAjt7Gg855PlIDlGXdhxOP0fOR
         UFV+QvmwCBVkosdChIljskxbV2UNzmgZGi7djXjX+WcRtht2OwuoSAppARYcoy8Is5Te
         w4T6hS6QXTXJvOuYCcGmordbKriDq/twLGuUzKlpVWiW4oGrVOQevQdMXJfZYftIM2eT
         RK/E7ckX9ZmHhp/N8sZ3mzYqpLGxVX3vlx5b0wnN1xEdCTOGR2j453dChH2/m9Ywy3mu
         PojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780703691; x=1781308491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QCKTB9eiQHhf3+5KhIRHF9+wrSCeXtJWVtvMG4iRxsU=;
        b=iTm56h+6XddZzTyriTEV92pYIRMpj+3S+P/l+gN3NOGsHoYPoMm2UnNK+EpoakM5uS
         DKKnwXwZi+cAf5C5OoEYMLc8Kc7+b9wFOu2S9Zj33WFyyGlkXEBCwBidJMQe36o0IuGR
         gooYlIKu2Q+d9V0BaHxT077Yu9ToDLam3lrTrtOTX8AAcBizBOxzdzBmJyWtfkc3W/RY
         OpUvhI4t6HO8Fyb3K/LGkCmN1jGzFqTimrivDhNJXcwUug0rzqOSsA939xX7rmrE+JE5
         w6ePK1xUWM0+qk9NDLNSULuA3wLFBIzdA2K7GOBHb33MsN3iSc6CVPiusWHiB7I79M6Z
         XKVA==
X-Forwarded-Encrypted: i=1; AFNElJ/Lbc9+kYX9YW9PHFTyU4ktw4ZcXc10CfsVmi8JI6kurslp/tkbb2tzjVXtucc43mS5CRNX1XVzuQ2C@lists.linux.dev
X-Gm-Message-State: AOJu0YxETM6Ux8wrGOCT4yKo2QdfiClYf/o8ozbHSEy8emQfJRhQRJKJ
	W//jgL0aIN4aDnUcrjcF+CemCoxjVvNNKZoOFLIONx3+HVPJyqYRkzwsgOiP9jXuHXsXKhGZjtg
	n6slB/bX1Zpakpj0fhcI64uVS+KhLqOQ=
X-Gm-Gg: Acq92OExKjjlMjqmyPnSqxH8anm5RP44TD/2WrvbcM4q2iPnOQGWeGUYt+yuJfyBzj0
	GvNVGBbC8JIR7I7adoNsbTXDcrzrodpBNTaez4VnJek0DPe4feX14nLC6g4ptt4tAKT3Cxlbg0g
	fwvOCFGnNJk+0zrHxWRx40N4arnr9769Ds9+eaTrzW/R5VP0EkG3wBkQ1kqMQOOWtv7ATCvjakF
	36o8YKug1+sIphbNUm5lE5et7/Yfs+eAubjP4AWKtmoKmaNSj8+b98CYuZ/AZslqNgLlR1I6azn
	T9JPHnXmJZg+vAsd
X-Received: by 2002:a05:600c:4e43:b0:490:b9c3:6c69 with SMTP id
 5b1f17b1804b1-490c2622cf7mr95620165e9.30.1780703690614; Fri, 05 Jun 2026
 16:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260606-fuse-io-uring-race-fixes-v3-0-6fdf5e5b3437@bsbernd.com> <20260606-fuse-io-uring-race-fixes-v3-1-6fdf5e5b3437@bsbernd.com>
In-Reply-To: <20260606-fuse-io-uring-race-fixes-v3-1-6fdf5e5b3437@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 5 Jun 2026 16:54:38 -0700
X-Gm-Features: AVVi8CdcPpFq7P9Lks5_Z4D-xaUM2uZo80ytNxW6s8yPy0MdxGsHNnlJgZpIJYY
Message-ID: <CAJnrk1ZutjtD4bZOnLBfSWjNgirhMwikh0hpAhwGzv-Qz_1nbA@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 1/4] fuse: Avoid use-after-free in fuse_uring_async_stop_queues
To: bernd@bsbernd.com
Cc: Pavel Begunkov <asml.silence@gmail.com>, Luis Henriques <luis@igalia.com>, fuse-devel@lists.linux.dev, 
	Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, Zhenghang Xiao <kipreyyy@gmail.com>, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 3:13=E2=80=AFPM Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> From: Bernd Schubert <bernd@bsbernd.com>
>
> fuse_uring_async_stop_queues() might run when the last reference
> on ring->queue_refs was already dropped.
>
> In order to avoid an early destruction a reference on struct fuse_conn
> is now taken before starting fuse_uring_async_stop_queues() and that
> reference is only released when that delayed work queue terminates.
>
> Fixes: 4a9bfb9b6850 ("fuse: {io-uring} Handle teardown of ring entries")
> Cc: stable@kernel.org # 6.14
> Reported-by: Berkant Koc <me@berkoc.com>
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  fs/fuse/dev_uring.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index e467b23e6895..c96d72250830 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -465,7 +465,10 @@ static void fuse_uring_async_stop_queues(struct work=
_struct *work)
>                 schedule_delayed_work(&ring->async_teardown_work,
>                                       FUSE_URING_TEARDOWN_INTERVAL);
>         } else {
> +               struct fuse_chan *chan =3D ring->chan;
> +
>                 wake_up_all(&ring->stop_waitq);
> +               fuse_conn_put(chan->conn);

nit: I think this would be cleaner to just have this be
ring->chan->conn instead of defining fuse_chan separately.

>         }
>  }
>
> @@ -477,6 +480,9 @@ void fuse_uring_stop_queues(struct fuse_ring *ring)
>         fuse_uring_teardown_all_queues(ring);
>
>         if (atomic_read(&ring->queue_refs) > 0) {
> +               struct fuse_chan *chan =3D ring->chan;
> +
> +               fuse_conn_get(chan->conn);

same here.

>                 ring->teardown_time =3D jiffies;
>                 INIT_DELAYED_WORK(&ring->async_teardown_work,
>                                   fuse_uring_async_stop_queues);
>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> --
> 2.53.0
>
>
