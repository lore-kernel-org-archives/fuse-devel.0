Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A303CF200
	for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 07:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781767969; cv=pass; b=l+xUTFH4jd9FCTdbKn4J6DXAIsxdTVeya91Q8CICH36q8ZAZBgGJum5LDavrJkdKS5LEHS7lb+x0w3UjgWflIU0KkfD1/0P4Nsj690zBrjB2HYZG1srvCiroXWYaurHbCbnKCeD0/G9V/RwS8nxtTPKPv6QsYL69qduI+sP0QYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781767969; c=relaxed/simple;
	bh=q2BzJ7AmFQdMHhwFfWZnkreUQZbJHuqiSNmUIllwxCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TomgpWrpKi9E+D5YWRIz3rj7TFiInzlUcCNgHDpk1EgXWd0oPvmLLguxGoOp/Lc8msl0LjzwoCXC08OBBPwrbOkoAAsLDwyaEkUN1X/DK1c5jqwP2VxXnF3f3YSxnXBjggRpFuxl4UngBFFwJeVW80wRAWRTxk+YU4X+p2VRI5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdMg3TOx; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdMg3TOx"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so511297f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 00:32:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781767966; cv=none;
        d=google.com; s=arc-20240605;
        b=YJI2FTvXNXNt8ih1OZ5InQlHn29w0ZJP5FZhmtFVKrigHVU7rbuqQe4uyPXfdN5t8k
         bhkfp0mVK1RwagYYmFadsLb99SA+8iYyXkO7fcwmTNT8l6DubcjNl8selDHhS5LIeDFm
         3JreVgM5ejeCx1kVMeWlEpFaq6Pdmz9URM5CQzY8mk/Q/LeGeRsuZUW4chPQExh2Uy8L
         1XMi/9bBL6M5sos1aDRTlxNUe9uX/mxwn2TcM+dVdTZu29lga2Sv46k1L8scSq9qOa/w
         llBNhIGT1KKbQ9RWPQpf+DF++ISVPm6Zjp1W2XurZStm3zsEOtR1n2T3lsNWBhgiM/dP
         kssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f+fIVDwCeYmuENyBFD6aWNrj41451PNfI8MADogvoNw=;
        fh=8jHLIOV7MOPVFQ77GuCw2JYVBUzgSjX/zVrdjGCYOBQ=;
        b=dd+6s/6kkFhKaLcXgqkbyQrsUcVOnFy24W+3U5ggqIVYQgUPXMXx6HexOBta+Rfh/i
         Lik0TTgAkmgsuqfRtmEo5HF+hwQf/Mit/VZIocEXToTrD9HifVmngoEdgLL8YZem4hhY
         xOpc/H87xY3IsBv/mZ2KCuC4m33MqD5u/IB4EzAB7LgcjoVnWn12BagNR0Cno9r80FpV
         xqUjWXCUcXeLFkWo4CBFtY62YKnrkHN6MqZHKO6S2MJxa7Tf808MrshlssqP+h+JrIPz
         p8Uweu2Ph/BDVwCC56mLfT99fFHBx2Yd/922OZogZyRAvRMYqNGmuIRWSxb4BX+JmglQ
         GZpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781767966; x=1782372766; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+fIVDwCeYmuENyBFD6aWNrj41451PNfI8MADogvoNw=;
        b=GdMg3TOxEFHunfH5CFaKJcBEw1rp6p4uv+c8p0hJqT7VF22zA9YZkTiBMIuyT04XEx
         owv2RIX/dE+kJEvvKiwWvzHaCwPkERuP++Q8AIRlffIymXAYzNTr10+x38LQH1YLOSKD
         UMQ8AfahJEDcOsLNRqsHTAqTncpgk8YaURU/LlbLzgtizzDyjjNgLdskG4ZlljHACmzd
         +6giRXwYpxKbZZGzWacoDdhIXB4D9xs1Zvhj9ENjQ75q528F2c9mXR1oZ7jH1rdi6hju
         Raj/tGFlGbM/iZR1Kh0d8PINhYYQig4IfPk++U1xC2EyEWuEAxN+PisiMx5deRg6Pso5
         /Hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781767966; x=1782372766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f+fIVDwCeYmuENyBFD6aWNrj41451PNfI8MADogvoNw=;
        b=ifNo+/mRWb2qckIPxw5D0eI8XyM017QNpfYWZ6fIKjhFHiOMU+a9fQyL9hLzJGumXY
         z7sRraoCM2Iqk0Un8xyLXMeh1h79EOfWvYyzO8dR2btYOn1vSOglpF3Y+gQmZkfw4w6u
         FAsnb6quRo8luH2GSBSESOs+Zs5bMyfchDqW4M8wCvHWogZFtX+m3HmYI9Bu3OkNiH/f
         aralZbTywR06KvR90zc9jWYTkalH8zs9MyIvi9CzzLwngETSBqbeTsHZGu04PZQZNEdn
         qZ44BnCx493fONDxXVj/h1LXCEBpEDTB3rEYH0pp45RbHSJ0fsJQmzVAJWBfqU1QMqmI
         LdaA==
X-Forwarded-Encrypted: i=1; AFNElJ+tbL3cXkXLmIaeQ57ZrORvceonDkpDcsoe124ZhpeadPqaW0V+Kfu6uRewTIW5P8RwXXJ+6Hf39pil@lists.linux.dev
X-Gm-Message-State: AOJu0YyjWPXbWGFYAQTyAAAVDwTEJz+1U2enISSvdN40A5Lvv7g2sUNI
	dymARM66I+P7tscFgZ8Cmo/dqXl6LKy874d5IYFp6lCsQ42ER/zzmnJkTLj3vQxzGzKJ81mCm3i
	tnSVB0QNQ6GpEBw0rjFm6i7xAdrorVto=
X-Gm-Gg: AfdE7cknwSuVKHd8u+kMZuUUHGZ8FnFs7vg1Rg2ktJWoapQmVnwIYhHeFbu8sp0Vp9Y
	7eLnrgSfCpceNmLqKoyUC3IJkGQyLvjXMZQcUS1HcRyNYG89zXC3e7kJZEWJQIuDBi2FgnEnAvn
	teOnfuBmmsb0vw2CfzeC5XBOwdcwRW+7YDwvAn6MoPXRf0mDdKMe/3Vo/eAJDqx+9UMbw5A9tJO
	U79uR4/6w7aFTvQD/S0gdCK/bfmflROUMrhtxwA8+PECbWhrRLcO9uZD/zMNQBbhERa6/pb5JiY
	RzxuC/djsqOV5XrZKi7ZSWQmnHDbZiN+E7QCZ2HkwV80iPOM4Ff9
X-Received: by 2002:a05:6000:1789:b0:446:db72:e8ec with SMTP id
 ffacd0b85a97d-46240cf95d5mr11942356f8f.23.1781767965829; Thu, 18 Jun 2026
 00:32:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com> <CAJfpegsWpKE4kUUQo+NK_cu6oy6h6+A1M=xokvSQbFtZzu9UKQ@mail.gmail.com>
 <CAJnrk1b1nVFZ8dQYA=iGn-p182HNhhRfZEVe-e_ks_daZAU3Rw@mail.gmail.com>
 <CAJfpegvNyqSS2h28-0sB2j2HUoMnKd7StMsPbvNPz67PiS9w9A@mail.gmail.com>
 <CAJnrk1bK-3tpZoeJQKPLjgpQW2F0YQKVhLeGwkN_5tpBVpZ-VQ@mail.gmail.com> <6d80e19c-00d0-49de-bd8b-7571a81b942d@bsbernd.com>
In-Reply-To: <6d80e19c-00d0-49de-bd8b-7571a81b942d@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 18 Jun 2026 00:32:34 -0700
X-Gm-Features: AVVi8CfkcO0eW6I7H-9WeKUpHMSz6w3lN3g2Pz1rF5k1WavEBDqh4JwybOkTs-U
Message-ID: <CAJnrk1bRL+Nk6mDrZyKsymLLGopzL39OQ7on1oDkxcA9zeUYCA@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, axboe@kernel.dk, 
	jlayton@kernel.org, libaokun@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 7:22=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
> On 6/17/26 14:49, Joanne Koong wrote:
> > On Tue, Jun 16, 2026 at 6:26=E2=80=AFAM Miklos Szeredi <miklos@szeredi.=
hu> wrote:
> >>
> >> On Tue, 16 Jun 2026 at 07:28, Joanne Koong <joannelkoong@gmail.com> wr=
ote:
> >>>
> >>> On Mon, Jun 15, 2026 at 4:41=E2=80=AFAM Miklos Szeredi <miklos@szered=
i.hu> wrote:
> >>>>
> >>>> On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> =
wrote:
> >>>>
> >>>>> To use this, the server must set the FUSE_URING_BUFPOOL flag during
> >>>>> registration and provide the payload buffer pool through the iovec
> >>>>> payload in the first sqe.
> >>>>
> >>>> I find this interface inconsistent.   Decoupling the buffer(s) from
> >>>> the seq's means that the registration should be decoupled as well, n=
o?
> >>>
> >>> Looking at Bernd's reduced queue series [1], I think we'd most likely
> >>> want to also pass in the number of reduced queues separate from sqe
> >>> registration. I think along the lines of the config sqe Bernd brought
> >>> up, it seems cleanest to add a new cmd op
> >>> (FUSE_IO_URING_CMD_QUEUE_SETUP) where queue-level settings (eg flags,
> >>> number of queues, bufpool, etc) gets passed in.
> >>
> >> Why not a separate op for bufpool registration, so it can be done
> >> independently of the setup, possibly at some later time?
> >
> > I'm not really convinced there's a compelling use case for needing
> > multiple bufpools in one queue. This was the discussion with Bernd in
> > [1] about this. In my opinion, incremental buffer consumption and
> > allowing different queues to support different payload sizes would
> > address the use cases of multiple bufpools within one queue, but would
> > be simpler.
>
> To be honest, I have no idea how to implement queues with different IO
> sizes. What would be the logic to select a queue? And what is if we

With the separation between non-IO queues and IO-queues, I think we
could just look at the request type, and dispatch accordingly so that
the metadata ops go to the non-io queues and the read/write ops go to
the io queues. I think the dispatch logic would be otherwise the same
for choosing which particular queue within the non-io or io queues.

> start with an single max-IO buf and a single queue (per numa) and then
> scale up based on need? Let's say we have:
>
> Start 1 queue (per numa maybe), one max payload buf in that queue and
> allow to scale up to max nr CPUs for the cpu to queue-id mapping. But
> now additionally we get for the same CPU
>
> - multiple queues of the same buf size
> - multiple queues of different buf sizes
>

I'm not seeing why this would be an issue. For multiple queues of the
same buffer size, it would just be normal queue selection and for
different buffer sizes, we'd jjust have two pools of queues (non-io
and io) and select based on request type first which pool then apply
normal queue selection within that pool. I think if a server has needs
for multiple categories of buffer sizes beyond just non-io vs io,
having multiple bufpools per queue makes more sense than dedicated
queues to the specific categories of the different buffer sizes, but I
doubt this level of granularity would be needed.

>
> Also, every queue has its own ring, syscall aggregation is not given
> anymore.

Syscall aggregation still applies within each ring, but I don't think
sysclal aggregation is really a big factor given that libfuse and the
server handles requests as they arrive and respond as soon as the
request is handled, instead of batching multiple responses before
submitting; on the dispatch side, requests are sent one by one as they
come in rather than batched, so there's no aggregation to lose.

Thanks,
Joanne
