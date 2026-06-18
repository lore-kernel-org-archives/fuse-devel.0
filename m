Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE583101A6
	for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 16:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781799557; cv=pass; b=fDyDUFAh30+1LBYZ5gQOqQBter1Q8t+0Pgs6FNI+gpUC6jPULJkybwr2NABxBZQ1hCs+Vqv/c88Fb6GX03r7Q2rcJDX5zEBeD/ZH8+pB36iLS2l4lUarHVn0itjJbnvULf9bCQEDjx82A5DdEsc7KyTvWlAJSYQchA8DfUCMNdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781799557; c=relaxed/simple;
	bh=tiVI5r0+dF4hAm24TMlhlWYmwOCH6cOJAfpgx3ccJag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+Jy2GSsxIKNU2iebjlNLgzAy53P34AOQJHf7oGYlmwMBWbnsovmrSfvYGTHV6YLm1QavV5N0pJsjzWZsUpOmOdynl0vAc+41+uLfmLTXEb/sy3o0Phafizv2pd2BS7VVskDv4J4v0whGKvKOkoP+4KITg+u8ijdd79C9v3q0HE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vm5QBIRN; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vm5QBIRN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so9644085e9.0
        for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 09:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781799553; cv=none;
        d=google.com; s=arc-20240605;
        b=ilGlfYIIbZnawXfYGFT5q2YAibg+0nigRvlr1uy/OXqMwsz3B+/FwQ+6fwloQI3DWJ
         eXnV4UtxsOvyqwVK1/1SvJxvL1eSrNyh1GH9oEf2sqLRQep0H9wg8bsXY+lBUvI5YcZt
         96BbEKKtY3QkWVAomad41+bNxJheafqTYtr4x6uAPMA7/CDYfGO2nyy62ZdhqufLoYyd
         gnkfMbeeVxTqhD4QrmYCEX9G2f5Y+8AmrFqRGb2yxQ0lRUzU3gJGPn0c7pSqV3mqJzFT
         AFsYfGLs1A7m2QRuItu+wlEWm1XvtoJp4N3ALd22rZv3V5twN1RXX2ovIiefLwvjCxxQ
         Q5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EU7WciX8sKH+w9b1XEMPGWcaRxUmRR4gN4otWqE07sQ=;
        fh=CJLiEEIl60JCYCPNajPAy5mAxxs2ZMi1edZ7acymDbw=;
        b=KJgDD3LlnXkhjJ9tg9Qp2DT5LzRiHSFXLEaymkdbVVjU/ab2pFEEO23fcZjd4E8TNf
         OYShZWjb6HCem3kNqnm/5dhpK/R7fgN+nAG76jDPSgU+bHUPv5wx4xajTe6Bel/IT1cs
         /3wcRplvlAc8xE5se4AWQ5+4ANt5UYjCeEmuRsHR0CvjepVU6HcvSI+gcd7ty7SeVTEf
         KunFkirZbR6s9x3Vy2K3uc/brkq+kkqVkAicQRsfnc857po4QrVvEehJ+rXdD9IAiGZf
         4vtbL8VngC4xszVFPHa19RxtwGIBYFM2DEyOYJirm8nppoTA+xYs51pVl3j/NSLfY6xx
         oLkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781799553; x=1782404353; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EU7WciX8sKH+w9b1XEMPGWcaRxUmRR4gN4otWqE07sQ=;
        b=Vm5QBIRNy50dqmjufOoz1x1vYgqCRfI2R2dsf8qwcqI69Ftcxkad60LEcg0EcIKdLM
         Lb2kdt6dwXAW6KGx3xUG0LGgjuX3EPEe8QaEj7oe5uqd14f7DP2EzgytYHH9f8dfgMdv
         kMuYPjAW1OuApU8zZhsBjTXVGgWNo23X9YX4jEIl7PbqLJ6/mEJ2VN+v5H8iWuqad6AH
         40F7cd57WnHUe5cmmxz95/1MsvFfSg0bqDxs50CZOV8OF7cdlzY6zsfJYabA8K+2yVVX
         eeA1imwhvkBoB4CjW7b7psBZDiLvlWnD61QtIT/FtzuV5z2gyJ1KmUhH2+R551fEFnla
         birw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781799553; x=1782404353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EU7WciX8sKH+w9b1XEMPGWcaRxUmRR4gN4otWqE07sQ=;
        b=KqsvQ+ix943rqkjr6qR/wbXeGKEp4Wi92sp+jhGIP8Ft7ZL6KZNFSwEgAo2nKHyy85
         CWhv/Fv8Q2av7chWNyqTRFAHb4ot4lZpL1p4cvLmfY30HrRKvZhHonCCGHL293Q2YNn2
         HrK9n/GzYx+g6uw4G8ZPyJb3TheLhA5ikCC9GuUk4aZlrsiDAJKVQLl8hJtkH3TZe1i1
         sflIMBUx+IToEBgQeKvNmgfEAk4vXcbDgiv6B8Uvs8SvAOEzdL58jZsMTWRVqmTRA5R9
         lhPyHuBuIFh72EvFPBCjYxHrCdKX+/lxcerJvxrjAzR2yJwksYpeKha8VD/7ykllXpTW
         McSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qdxoTL+BqVqEcWtKHEIObn95W3aOLaK1d5KcQ4LaOQ/c6SGTOyMGfJoq3VmDzmzaf55hl+Har7v+E@lists.linux.dev
X-Gm-Message-State: AOJu0YyqDqsVEXbMrkMbtq/rqkDjCexYB++JpeLlhgMjdINoeypxBOWe
	UY7gKidwjTSxcplddh1rEp55gX0pK9Ps9tOPTsiY3cp5dhoJGxNwY2uLcPq9qXpmFiFEJjIho/B
	BwyBAVEGZbTAUF/S56m4NXR7TsMnahw4=
X-Gm-Gg: AfdE7cnKH93cg1j0QOWRfmZQfeXtWIMs0Rmlw4mwiAt/HaTdvqr1K9zP3XqURRQG4W9
	usfQL4fql9ci6F89H24hP96nfszJQ4O88Tt/NnKAzVK0ZKnASEJYuvhYIg/JRCsK9xqSVOjcN9U
	wAEcjkccJhKOxNPZSXZz/cN/VWLo0yhxtrk1pLqmJs22K/Mp8eQSnIf76ABgKAb9wJFY+N478qC
	k1JepqGlBu5ZSV+ehSIoG4tsEzftJk9TPP9rL9t5Gqe0nRlSrvEG40QYQXEe+Y/jH/P2Ts+9tJ9
	7BRADHDbPJ6yQKCWcyMjDrjvnSQoGcstXju7606Pyxk4wQMeHJzx
X-Received: by 2002:a05:600c:a43:b0:490:50c5:8153 with SMTP id
 5b1f17b1804b1-4923ef47dcdmr5216085e9.2.1781799552494; Thu, 18 Jun 2026
 09:19:12 -0700 (PDT)
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
 <6d80e19c-00d0-49de-bd8b-7571a81b942d@bsbernd.com> <CAJnrk1bRL+Nk6mDrZyKsymLLGopzL39OQ7on1oDkxcA9zeUYCA@mail.gmail.com>
 <9f0d2b87-ce5d-4c27-b041-dacc5f449efe@bsbernd.com>
In-Reply-To: <9f0d2b87-ce5d-4c27-b041-dacc5f449efe@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 18 Jun 2026 09:19:00 -0700
X-Gm-Features: AVVi8CdF0VWBo4cvSk9WJqWXA4DO7Gg0Lsrj2Ul1UWWJzcuCJs3MgNz237dnU5w
Message-ID: <CAJnrk1Z4AfJ9xTKar_RH8SrLdMsAPuEapwn0QxnaXtmyL1knjQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, axboe@kernel.dk, 
	jlayton@kernel.org, libaokun@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 12:52=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com>=
 wrote:
>
>
>
> On 6/18/26 09:32, Joanne Koong wrote:
> > On Wed, Jun 17, 2026 at 7:22=E2=80=AFAM Bernd Schubert <bernd@bsbernd.c=
om> wrote:
> >>
> >> On 6/17/26 14:49, Joanne Koong wrote:
> >>> On Tue, Jun 16, 2026 at 6:26=E2=80=AFAM Miklos Szeredi <miklos@szered=
i.hu> wrote:
> >>>>
> >>>> On Tue, 16 Jun 2026 at 07:28, Joanne Koong <joannelkoong@gmail.com> =
wrote:
> >>>>>
> >>>>> On Mon, Jun 15, 2026 at 4:41=E2=80=AFAM Miklos Szeredi <miklos@szer=
edi.hu> wrote:
> >>>>>>
> >>>>>> On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com=
> wrote:
> >>>>>>
> >>>>>>> To use this, the server must set the FUSE_URING_BUFPOOL flag duri=
ng
> >>>>>>> registration and provide the payload buffer pool through the iove=
c
> >>>>>>> payload in the first sqe.
> >>>>>>
> >>>>>> I find this interface inconsistent.   Decoupling the buffer(s) fro=
m
> >>>>>> the seq's means that the registration should be decoupled as well,=
 no?
> >>>>>
> >>>>> Looking at Bernd's reduced queue series [1], I think we'd most like=
ly
> >>>>> want to also pass in the number of reduced queues separate from sqe
> >>>>> registration. I think along the lines of the config sqe Bernd broug=
ht
> >>>>> up, it seems cleanest to add a new cmd op
> >>>>> (FUSE_IO_URING_CMD_QUEUE_SETUP) where queue-level settings (eg flag=
s,
> >>>>> number of queues, bufpool, etc) gets passed in.
> >>>>
> >>>> Why not a separate op for bufpool registration, so it can be done
> >>>> independently of the setup, possibly at some later time?
> >>>
> >>> I'm not really convinced there's a compelling use case for needing
> >>> multiple bufpools in one queue. This was the discussion with Bernd in
> >>> [1] about this. In my opinion, incremental buffer consumption and
> >>> allowing different queues to support different payload sizes would
> >>> address the use cases of multiple bufpools within one queue, but woul=
d
> >>> be simpler.
> >>
> >> To be honest, I have no idea how to implement queues with different IO
> >> sizes. What would be the logic to select a queue? And what is if we
> >
> > With the separation between non-IO queues and IO-queues, I think we
> > could just look at the request type, and dispatch accordingly so that
> > the metadata ops go to the non-io queues and the read/write ops go to
> > the io queues. I think the dispatch logic would be otherwise the same
> > for choosing which particular queue within the non-io or io queues.
> >
> >> start with an single max-IO buf and a single queue (per numa) and then
> >> scale up based on need? Let's say we have:
> >>
> >> Start 1 queue (per numa maybe), one max payload buf in that queue and
> >> allow to scale up to max nr CPUs for the cpu to queue-id mapping. But
> >> now additionally we get for the same CPU
> >>
> >> - multiple queues of the same buf size
> >> - multiple queues of different buf sizes
> >>
> >
> > I'm not seeing why this would be an issue. For multiple queues of the
> > same buffer size, it would just be normal queue selection and for
> > different buffer sizes, we'd jjust have two pools of queues (non-io
> > and io) and select based on request type first which pool then apply
> > normal queue selection within that pool. I think if a server has needs
> > for multiple categories of buffer sizes beyond just non-io vs io,
> > having multiple bufpools per queue makes more sense than dedicated
> > queues to the specific categories of the different buffer sizes, but I
> > doubt this level of granularity would be needed.
>
> I'm pretty much lost. It is a 3 dimensional matrix, made of cpus,
> buffer-size and buffers. I really want to see a logic how you figured
> which queue has free buffers.

We already have logic for this (done in your reduced queue series). I
think we could just reuse that logic. A basic implementation would be
having a separate bitmap for non-IO queues vs IO queues, and then once
you figure out if the request is an IO or non-IO request, the rest of
the dispatch logic would be the same for choosing a queue from either
the non-IO queue pool or the IO queue pool. If you're concerned about
dispatch complexity, I think separate bufpools per queue ends up being
more complicated.

>
> >
> >>
> >> Also, every queue has its own ring, syscall aggregation is not given
> >> anymore.
> >
> > Syscall aggregation still applies within each ring, but I don't think
> > sysclal aggregation is really a big factor given that libfuse and the
> > server handles requests as they arrive and respond as soon as the
> > request is handled, instead of batching multiple responses before
> > submitting; on the dispatch side, requests are sent one by one as they
> > come in rather than batched, so there's no aggregation to lose.
>
> Depends, if fuse server starts with 1 buffer per queue and slowly scales
> up, you basically get exactly one buffer per queue. That is the end of
> aggregation.
>

I really don't think servers will start with 1 buffer per queue.

Happy to discuss this together in the call later today.

Thanks,
Joanne
