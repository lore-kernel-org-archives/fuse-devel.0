Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F8345BE3
	for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 17:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803264; cv=pass; b=svooI6hGtQyxzsjukKLVAM1Q95aK0rcLzHNLnyY4VHfUhT1rdhiAE9QAcWZ6LsgYM4wIUedyVkZpSpIjK7x8l1O2zTqcppvGSGiIPzf8s3GnWdHzpyABWaQa6RB6/UeswNJsQGrNtKulxclS3KP42FcsDSEtBqjcbHhsUky9wqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803264; c=relaxed/simple;
	bh=0Q0WvGrTyP+d2G395hXpFSjqKL3viFpcD5NvIy7yBtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmzd4WswqYrm+zz24bZrseoRHDb3N41Zkcg+mC4xSWVl68fA3diMhMThPlifWEqlqX3wQvfFV5jetRwClY1Qr9+gaMxmmgvJJngggb0k9wYQc945DaY39t8SJUSpHeI43wQYMNOxMQDoVQS8vzRBpFpNf1ttHdqXmRf9/IQEzUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nG9OEZsP; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nG9OEZsP"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-463f1165e16so1066079f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 10:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781803261; cv=none;
        d=google.com; s=arc-20240605;
        b=RlfIFsmODYiywBGFM1yd5LbmFkLAlx31PNJn/nhgxL3+sdLJxPWwVzU9Kte54FgigT
         d5/cc3ukTj52TBtrYp1suhH3CVzB2sgriTN+qwXj1Xz6zEitZHhBeJjWOfE0pwqNOyoa
         wPcG35ln3Qz5BtWXSBXvuD8OgRgdGSzndnw0oe7aOrqT7Z5/TXbSHGVV6FwVjVKUHoC0
         1z71rXa3VG2uFIgR5uovAej+nwIKQE/la6IqJRJMibt3CXH33neNx4npt8mFD1O330vo
         bxBj/OUayM9gr8tj6DPXBtD8PlWj8FbDLDeRuJTdY+NnSp2eOkmt25b8QA2AJn4G6cYe
         exMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EPg/U569krhmWGZ0yj7R94247aY6mnhIa1DTroMIzZA=;
        fh=8bUFTemOwDoWiOdOkdFFPfADoT45yqq3f7053C+zN1s=;
        b=ctV3ABhU6WPnHZUoDRtxDXGXDi48Ike7cq8w22PHci/KtIp8w6BghfIMNo1uBsFz3o
         SoBAMNzxcS7n0SlWHCfpd3mxVf6xmWNYY5h6YeH7y5EzoIpTuLPa512yRL5ymXzkBFD6
         fOF7GM9sD9VM8AhVV5FnNmD6Jnf6K+P7UQ+ySeXbK2fNvN9WL5urzYvHZxMnBHrAbRCc
         mAfoFHi+v58xfoSd+5VSX5WXfSTdjPs6WQvS99XcCEfR9awn1uXhma0Je+Kc/wshSCuW
         tiXkkPUX+blJh86/nkl58mTo1Pwfzk9i9tys3s4YjxvkCGS6+sKI82CIQUqr0Wgs2x2a
         rLsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781803261; x=1782408061; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPg/U569krhmWGZ0yj7R94247aY6mnhIa1DTroMIzZA=;
        b=nG9OEZsPRUQoihqgoi7K9nXcRKYfqQz8vR6JviH/PDT798Gw56yHNzWVvQZQsWemQh
         +z4SyFdNEOxRakQ2TXjcjlEJs+5U9Z73wGUOl16Kt0SRBIZHmQpkm6LwyY+96O2zLU0A
         pyQGT1GbPhi8egDYmKlrcP+zI0eVYcJ6vmDpn0v1lWDmlxK78deMIvSX8PTgNq7J2Ds2
         kXAH3cCj1pSZ8yslZDbgP/EYv5e6/m8yCwwWM3dqDs2cWX461BXl6WXTNpLxEQL7AF5Z
         JSvDB0VBKjPXOx0/kPE8JuufVkvO8UMd2MCj1gl+7URGCcnowvuoxfNpfyMSfkb6C9qR
         iszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803261; x=1782408061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EPg/U569krhmWGZ0yj7R94247aY6mnhIa1DTroMIzZA=;
        b=F+WW5MPz4HAPMnCh48k25kolaN0GguaIzR2zt/39/7dBzLCcNca6e55fkFBbBEEMeW
         73XWGOKw/L5R49HlUZ1kSHTu7j/NN9xK5L+YSUlpW3C9/vX1DpTCZyWTnIuTi13Qffhr
         n0UJjd67B00AN4p+ioACZVjUY62zLpMkQAW3GB8tLhuyo9RJdqeJIghPPFK3BS5dI8c3
         7C3GmFN7m9BJtNTk6put/K3eqVWnkVnmHzFjWib//QJfeJeh1B+jCKe6HHdDRhMFftQ2
         DGxVJirNseet27zC0GVTvmycSCEJBpeZbGpCeDfQP8BszDQVxl1hEPXrc+Ok0phVv7jw
         5l2g==
X-Gm-Message-State: AOJu0YxHnDrrebh6xs8OGGVFccBzclHSV2hcqtDjzkrnaINsLCFNFVXt
	RuCO+fozKjUilwMU3ekwGx1uXdMUf+uppu2qIG1OyW+fT1F98Y5D60s9j90Vpe5rExzxzuqc+7a
	v8k5FVdN4laUYMwetxsB1kIMF+7v07ch2+4oodAg=
X-Gm-Gg: AfdE7cndiB8iyCXzKTkUb2XVfG/+PSxEtxS82cKO1yPlY2H7U4kckJo7z12Dhvm6XGf
	Em7X5Mqr4HAr/fyZuq4FAw+Uk6VqFmKoAlpIrh7ynJx3U6hc3+LqOxjSP2lVwtlPOQQxY0aHgZo
	S2vaFAVwdRzlVGRwMgmp8g0w/pOwMOW2g5zWQJULYWhHoh6FJaKFEJScKcZdd6EV3MtNh4id5Jy
	Wq6TL9M47Ibo4q7mXYf/J613oCwNcTogTbG8kcVa44e//wZwkE47JliWk9nbizXaVLrSQGrwzyV
	UK67opM4uYHqCDMPv3mikXouaTZ/R4ork7Id/+xQK4OGunprYy8B
X-Received: by 2002:a5d:420d:0:b0:43f:e721:76b8 with SMTP id
 ffacd0b85a97d-46508afa8f6mr333484f8f.37.1781803260681; Thu, 18 Jun 2026
 10:21:00 -0700 (PDT)
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
 <CAJnrk1Yqa0nvXCBo6GzHc2bP_V5+2dHaJn+2pWkumV0QLr0nSw@mail.gmail.com> <CAJfpegv=u=jfOqtHXpEC60unrzO7XFeP9o9HM18AVqWfN=O0Ww@mail.gmail.com>
In-Reply-To: <CAJfpegv=u=jfOqtHXpEC60unrzO7XFeP9o9HM18AVqWfN=O0Ww@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 18 Jun 2026 10:20:48 -0700
X-Gm-Features: AVVi8Ce6M-buetvBNFhokDwwXdjve2bgc_oo6FUovLtMOu-gZVe0pV6ZWwNWIS8
Message-ID: <CAJnrk1b4r0vbrm_HNe5bV11FVmdKDNAcZzkoLtoW_hEmmBjpdg@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 1:37=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Thu, 18 Jun 2026 at 09:03, Joanne Koong <joannelkoong@gmail.com> wrote=
:
>
> > imo the main benefit is for incremental buffer consumption (allowing
> > non-overlapping parts of a buffer to be used by multiple entries
> > concurrently). To recycle back a buffer that is used by multiple
> > entries, it would require all requests to have been completed but I
> > don't think in practice this is a bottleneck with reasonably sized
> > buffer pools across queues. imo incremental buffer consumption scales
> > more dynamically with runtime workloads than preallocating fixed
> > buffers of different sizes across different queues trying to
> > anticipate / guess workload needs. Overprovisioning small buffers
> > wastes memory if those requests never appear, while splitting the
> > memory budget towards smaller pools reduces capacity for concurrent
> > large requests, and workload patterns might need either at different
> > times.
>
> Hmm, so why partition this memory into buffers up front?
>
> We could just as well say that managing that chunk of  memory is up to
> the kernel.  This would simplify the interface: the buffer size is
> redundant, since it's the same as the max I/O size, no?

That's a good point, especially since we can just return back offset
into the bufpools instead of buffer id. That's a much cleaner
interface. Though I guess if we want to be forwards-compatible with
having the option of multiple bufpools per queue in the future, we'd
have to add bufsize to the uapi here now. Do you think we should just
keep it as is then?

>
> > I think we should still make the design for bufpools
> > forward-compatible with supporting multiple bufpools if a use case
> > comes up in the future,
>
> Yeah, and separating buffer registration into a separate op would be
> one step in that direction.   It doesn't have to support multiple
> bufpools from the start, but splitting out separate functions during
> initialization is a good idea regardless.

I'm not sure I agree that splitting it out would be a good idea if we
don't ever end up supporting multiple bufpools (imo, having this in
QUEUE_SETUP would logically make sense and be more ergonomic) but I'm
happy to make this change.

>
> > From my perspective, the use case I see for queues supporting
> > different payload sizes is for separating IO requests from non-IO
> > requests (eg lookups, getattrs) onto different queues so that non-IO
> > requests don't get stuck waiting behind larger IO requests.
>
> Note, "queue" could mean two things here:
>
>  - fuse's waiting list
>  - cqe's on the ring
>
> Currently there's 1:1 relation between those, but that's not mandatory
> going forward.  So we could have multiple waiting queues for different
> types of requests, but a single uring for sending them to the server.

Even with separate waiting queues and the kernel prioritizing sending
metadata requests before io, isn't there the issue that if the
requests/entries on the ring are all IO requests and then a storm of
metadata ops come in, they're still backed up waiting for the IO
requests to be finished? Or am I missing something?

On the userspace side, I think they'd need a threadpool which would
add extra context-switching overhead and would have to reserve a few
threads in that pool just for non-IO requests, and then have a way to
inspect requests in the ring to prioritize the non-IO ones, which
seems nontrivial. But maybe there's some simpler way to do this that
I'm not seeing.

Thanks,
Joanne
