Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441AD25B0B0
	for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 22:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781821420; cv=pass; b=QHu9q0+QbGea/PgT+N/8v+lwqIziKqdxAtVHvhoGhfKrjJlLBomSNvMwu7rrRooSDux9wEQx+DI0KrxMyd5tm1LfIKdvmVo7fED4WJ8N+fmEodZqL7kg6Lh39jFDUHORcY86So+xSUyWSVdyBC4j0mUYbNqZ/SX4BCmbqH+1Kbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781821420; c=relaxed/simple;
	bh=gIrodkK7cEbI6kli7uD0vR/HoSHT8R2SPLRja07xgSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxcS9zfJo4TvJ2MEd8kDhxBi2VaRIQNac6UN+knOH6wtnZO90BT5ozffYFk2RKx0Of9MGt/02fllXX5iRK7OfS5A0CS5pfW1N3dojZ78/MwnhCUoH/bhVsBq/BXed2RIwoCKvPfK59tWl/+iLWVWLsB89IPJZWeeItI9WZag8Rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwtCo/Tb; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwtCo/Tb"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1162366f8f.2
        for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 15:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781821418; cv=none;
        d=google.com; s=arc-20240605;
        b=Z9IOqvLJy0lA7cPf9vlbCtxjO8yGK9mcUviKsCxoGPEZ6jpaNs8gBxPpt4pDP4ooGP
         YJKAQO0qeyXRQEVaLZSwwe6Amhihjq8YqU37DS49CYcwK1T9pQd6DRKUkZ25/90RjhKj
         c7CzQp3aPDuRqV28b1791pI0wk7i6svHTk/ldCg7A9Htlg/OkhcDZfoobPTCE5uDNHJ0
         yqgdBBAVhW/LlOp0a+vol6tcC+xFTDMrxI3eWf0a2fAHzyqzLvRQdos9WwnhydcuGPpy
         +93YpQ7ipCmYxebz+Nl1ZGxrzhAnCJJEGUhMPRKKSYtOpmSrNbHm6pUrEPOeVEjsbcF9
         NJkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IAbPPtVEhTEjkmL7syuFA4mQ8OTbkDTyG0lSg6O4RUs=;
        fh=8bUFTemOwDoWiOdOkdFFPfADoT45yqq3f7053C+zN1s=;
        b=kU1D/oZX1viI//iyRoYyAwoozXnDEimGnFXLDplk1xUMjHc1hIbJv1uxz6HLnn1HQv
         LwwnNM8SKYJFJCkLFS3i2oULjr4eeIJzUFolOYytsGYfndrDXopHq2GIQyUfUPEdIvz9
         QTvA4o5BWc13M0Q3RxXdoTbUTbZZLa27iDhs999n2oVOQZCrbjH/Zpdn36Cc0NqM1MFE
         3tsJ3wgSw51AcZYuGA0inY00Z2XTBtnEGATgQAAi+PK1sQ0M0jPU+euW/EWBBf5D+G/+
         ebsEZjAOZ1m59vYnHz4fjfGDYL4EhR3dpvkFc1rAWfi2X7hFFhq3/hMy+dMAk2NwxADH
         S/Yw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781821418; x=1782426218; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAbPPtVEhTEjkmL7syuFA4mQ8OTbkDTyG0lSg6O4RUs=;
        b=JwtCo/TbIJ3Wd0izUf2hvIU79k1Il3P6wPlX/3XlqEhxxR8AkWcjuw0YYl48M6eFV7
         M88t8bUUBCTeUdz792TH/Mw9yRf1kduyU5iNZjZMrDj+ySj5+3NifVORLsIeDvxdvrqi
         Vi1PR+Uiw9ZUk3KoTkqBK2rvDxNQR6KtFDtYdJKLH1sC8Rmm23d9yjf5WeMs9D54+Tbx
         5Y5vUmPvPRvoAiy63FDuwAhwlf6+M7wuLIBMK0VeVOBmh80DadWNoixNq3/KdXe+kK0H
         BNjocrrI+d/4UDkS4Itu3FsyXzcvpv52D+2Hd5FK3lT+mzNdbBzedulor4UMPBjEQlNb
         FygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781821418; x=1782426218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IAbPPtVEhTEjkmL7syuFA4mQ8OTbkDTyG0lSg6O4RUs=;
        b=g9kkMQhefJ21pkJH5bRoJaF00qbRl2xCQFqdITJIDeovBNMQD+a6nV1hDhyQf64rRN
         rkA/nZFkK83hTKp6xCKOO77k3ULuHzxId0i5X5BMVTX+6I6k6ojzOZn8a4ImuJqHa8ZJ
         H3qLiEVHNwPjnalgQvRCHRKofOVFBDRcfov5/+abXnd4I8bTPOBgpl0E+FLwjdnaKWRO
         OFk9cExRzjX8yAQGMgGTlrHT2cXPw1fz2dcIl5htlWfK7C85Mrnk0KacNdy4ZvtYyaor
         BLvR+nlUQiKsRerAh1aeiv+ebvzrisAntqgmGp/jVCWXexavl48ZpOh8lXeGEn/YnbQE
         JRxg==
X-Gm-Message-State: AOJu0Yy3+65/wCvwCucKCfTRkFgveBqfDEL3IWJJ/Dvp+7izSDLJH/tT
	Fl/fyRjxuhNNKwQglYA4H/bp+Nhr7BdhpdCsxYqM2Mw+vEyDEY+th5B6HchSzCfJSaG9kjZql9e
	7DxHqe9m4Ct2E4C5d6z/17LGOohIAkCE=
X-Gm-Gg: AfdE7cl/QMgC4M6EV3cVjbluwJWegRWlq5XzdtYmZyjYnXjsCAJqSOzMyaYWYvuYGdZ
	h+Qd4U1nwl4T8aZqcctEB68lQJR8qUNm+HqBkVlTG6qP/E7tAmu/OYoxQAIaiMGoc0QaI+tV4IP
	2QtnyIlpw9KCg/cB480QM7ZXrZHyY/+/AFU5ZQxd2qPIZuOu2oPyk61w82rqy8HXIZayltUj1SV
	Kb7hqBDoWkNurdXSZIZ7KPeVgveSoBACYznplfQHHfG+Tk7W5X0HumUl66zKPK8oyOplYq8uWfK
	mf8bpGqbYwZo6ivWIL+CpZGYDeS7O6kR93mUorKgn0emw5xYF+FL
X-Received: by 2002:a05:6000:240a:b0:460:3234:4473 with SMTP id
 ffacd0b85a97d-4650a32ad0amr2177649f8f.41.1781821417548; Thu, 18 Jun 2026
 15:23:37 -0700 (PDT)
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
 <CAJnrk1bK-3tpZoeJQKPLjgpQW2F0YQKVhLeGwkN_5tpBVpZ-VQ@mail.gmail.com>
 <CAJfpeguq+LVHoyC7ZzkF_VSAQdqmQFw4DBztiQA1Jfy=U+D9wA@mail.gmail.com>
 <CAJnrk1Yqa0nvXCBo6GzHc2bP_V5+2dHaJn+2pWkumV0QLr0nSw@mail.gmail.com>
 <CAJfpegv=u=jfOqtHXpEC60unrzO7XFeP9o9HM18AVqWfN=O0Ww@mail.gmail.com> <CAJnrk1b4r0vbrm_HNe5bV11FVmdKDNAcZzkoLtoW_hEmmBjpdg@mail.gmail.com>
In-Reply-To: <CAJnrk1b4r0vbrm_HNe5bV11FVmdKDNAcZzkoLtoW_hEmmBjpdg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 18 Jun 2026 15:23:24 -0700
X-Gm-Features: AVVi8CdKcFzb6c0BdgCxE-sanf821UYEd-uNzAEd07ivDIQH_wEie05DWHnOPl8
Message-ID: <CAJnrk1ZVs2hOc7CRAVb_fQPJiUvqK837MzOWQqv4VB9YU8q6mQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 10:20=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> On Thu, Jun 18, 2026 at 1:37=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu=
> wrote:
> >
> > On Thu, 18 Jun 2026 at 09:03, Joanne Koong <joannelkoong@gmail.com> wro=
te:
> >
> > > imo the main benefit is for incremental buffer consumption (allowing
> > > non-overlapping parts of a buffer to be used by multiple entries
> > > concurrently). To recycle back a buffer that is used by multiple
> > > entries, it would require all requests to have been completed but I
> > > don't think in practice this is a bottleneck with reasonably sized
> > > buffer pools across queues. imo incremental buffer consumption scales
> > > more dynamically with runtime workloads than preallocating fixed
> > > buffers of different sizes across different queues trying to
> > > anticipate / guess workload needs. Overprovisioning small buffers
> > > wastes memory if those requests never appear, while splitting the
> > > memory budget towards smaller pools reduces capacity for concurrent
> > > large requests, and workload patterns might need either at different
> > > times.
> >
> > Hmm, so why partition this memory into buffers up front?
> >
> > We could just as well say that managing that chunk of  memory is up to
> > the kernel.  This would simplify the interface: the buffer size is
> > redundant, since it's the same as the max I/O size, no?
>
> That's a good point, especially since we can just return back offset
> into the bufpools instead of buffer id. That's a much cleaner
> interface. Though I guess if we want to be forwards-compatible with
> having the option of multiple bufpools per queue in the future, we'd
> have to add bufsize to the uapi here now. Do you think we should just
> keep it as is then?

Ignore the last two sentences please, I didn't think through your
original message.

I like your idea a lot about just passing a chunk of memory to the
kernel and offloading the management logic entirely to the kernel.
Maybe I'm missing something obvious, but why would multiple pools per
queue still be needed? If the server needs more capacity, why not just
have the server spin up a new queue? That would have the included
benefit of adding more concurrency, and dynamically adding more queues
is a feature that would be added to fuse uring regardless. For
multipools in one queue, the pools would be discontiguous anyways,
which wouldn't help with fragmentation. I don't think adding a queue
incurs that much memory or cpu overhead, and imo the scenarios where a
server would want to just add more capacity but not parallelism are
uncommon.

>
> >
> > > I think we should still make the design for bufpools
> > > forward-compatible with supporting multiple bufpools if a use case
> > > comes up in the future,
> >
> > Yeah, and separating buffer registration into a separate op would be
> > one step in that direction.   It doesn't have to support multiple
> > bufpools from the start, but splitting out separate functions during
> > initialization is a good idea regardless.
>
> I'm not sure I agree that splitting it out would be a good idea if we
> don't ever end up supporting multiple bufpools (imo, having this in
> QUEUE_SETUP would logically make sense and be more ergonomic) but I'm
> happy to make this change.
>
> >
> > > From my perspective, the use case I see for queues supporting
> > > different payload sizes is for separating IO requests from non-IO
> > > requests (eg lookups, getattrs) onto different queues so that non-IO
> > > requests don't get stuck waiting behind larger IO requests.
> >
> > Note, "queue" could mean two things here:
> >
> >  - fuse's waiting list
> >  - cqe's on the ring
> >
> > Currently there's 1:1 relation between those, but that's not mandatory
> > going forward.  So we could have multiple waiting queues for different
> > types of requests, but a single uring for sending them to the server.
>
> Even with separate waiting queues and the kernel prioritizing sending
> metadata requests before io, isn't there the issue that if the
> requests/entries on the ring are all IO requests and then a storm of
> metadata ops come in, they're still backed up waiting for the IO
> requests to be finished? Or am I missing something?

Thinking about this some more, I think the kernel could just
pre-reserve some ring entries specifically for metadata ops / non-IO
requests. That solves it on the kernel side but the userspace side
would still need a threadpool of some sort if its backend IO blocks
its queue thread.

Thanks,
Joanne
