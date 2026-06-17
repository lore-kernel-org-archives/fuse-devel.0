Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A234A3F39EA
	for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701844; cv=pass; b=tKPrwuXjWTGY69uRNghQr++gQyxNPqDzHN9as8hpAWgNixP4B4CH6EPKC7YyWq+aO0R7Jp+Kdu8AgZY5IZR9Xev0H3qWc1ImKQHUV7e2eZrgKJ9ch+++XGnIq6f8ApX3AboNEbDF8R56P+fawa8PavzjSteXDMXQdTytQuTncn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701844; c=relaxed/simple;
	bh=DDLLrTK2+bQu2czfRVNFX5cr7rWhX/nGMMKguVtRPvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ayRTS8+O6Y9Snc4RDVymZNM4rRp/cIZ6tHvkScR+JPM9QbLjHfkNisz7g+bLLpfW8dPXPKiqSEwlxXIOtteMvbC2EzMjU7mOjRpyq+wOJSFKPISx8ftihf3wFg0iExhJvfXNv0aiojeEGl7cO9dptmLtuHnoqWox5TtjbRJKFgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hw1jsXh7; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hw1jsXh7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4629d80fa08so710593f8f.3
        for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 06:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781701841; cv=none;
        d=google.com; s=arc-20240605;
        b=iGGhkOWVHjMBoz1TDMKaSJabK0UkaR28PLv1cYnyR+12yehdZIJl9wX6EpYu3xnuoA
         rpXrMJVFNZgkQfxL+2n/Ryy0O5qoa2eaae3KLIwcVEhU1K0hAf7fF/iQ1GQveXPQmhvs
         OtBuc5XjK4XgsMNoTcmZEWdJq453NghKXVQm7mw+Tn+8J9HGX/awxA8Fr79m78b94DxZ
         lteAIPQyECGjPfRix6we4sc21Xl2w2nziflZzRaLJ/auqrCVjyv3qxXi1m79RRcOTcPX
         qC61BdUspA46vMtpKu1b1cnAnevEhz3T9afRn5irtwisZUaZlBW8fOt+mxBJ9N7L7wi5
         DaKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AbFtTbGoxycCavXstRbefzVGLjiULg0LcxSiv5At1+4=;
        fh=UcnVS9kJhyFvrgm9a4Y7HbcJc28GzxaOssjkd0DVSAY=;
        b=DZTs2T/GwB1XH0SpbLc0q1hct1L6Np6X/9Fc74vBbla7YvQvMXwGGGwxhY1ylDeJ4E
         Z7Avak7aGBB5CkZFWVuad4bDlCsOP43riZbubY+QSKTO6xcIJFk9lgPLodjh3eEbjKJk
         /CIUOUL7hIfDpcu+Be2BJf/+00cXJrFLu5Qvhpeaku+wxBHvwDHg2JP0zOKPmgn03Kyq
         2Frfeft8cQ6gDtR3UsUjhDvfUCZM1x4rtMhbuvuYFip89bYu34lrbk27fCeBMblky4fI
         4ElmY6vevMFNnKnQbSdrnAeG3rEtE9UE/Jy1STqRN2ldbudo6Um/2QKLjKQbvbfLubMR
         SlIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781701841; x=1782306641; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbFtTbGoxycCavXstRbefzVGLjiULg0LcxSiv5At1+4=;
        b=hw1jsXh79Dl6awKAjkiG13cDdGO0nttbYprcDom6cLIrGiNe0s+oP5466MWeN2y+lF
         dmXpc4HNhgUgbKuL/Tz/ZsvBmziu8Y6HiAWGaoTMoIcAQgyxA55HQdFE1twmu7MC+wG+
         1/vENCq2cL+rOuxow3XDQUhqc32s1I9wpWWI8mNyt926Gg75NeBGw24L+A7ew7zyk/rY
         gvaL3WvHYe/1sx6PP68A9mToFzXZxhYdWzuq4Y8AtYShVaPFloJT+qpXjDDnz1AczPhq
         MOnVclaVVaubeHShEHvAijSnC6yHXL6PycA0FGCQQ91u1HfU/y0BRogjC8Uq7Iqdizil
         6mbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701841; x=1782306641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AbFtTbGoxycCavXstRbefzVGLjiULg0LcxSiv5At1+4=;
        b=aW2d5PM//qdMNlJW5CCDWpkd4wWhtvEHNWT+fWGQ2Y4WENyZU+AgiIpWMQl1K7XnnX
         D2kiFQFTcutb/yMsTMOprgpSjYxXpLq7zZr2mklSM0ijtT2zXrmj/UousCOEG7VY/BSf
         GNElKlxI40J1s1bA4MPm7cM0b/cnDFb1lySpLlO764lCkoP4J2cq213phSBhyfXqu7c5
         tWVPFp6ePYt8glQYqIMFoQtrwrY/CBj9uHUIeexRftm5p7H27wxEZUakTFNbFtRCdV2c
         IMOkcXlQkF5+IgBQPV0XzG9qRvYblGefZGYsToXfQspFRhAdC2oI7YAQx0Ra7+pl3kdo
         GEOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9shm2n3JPWSQVUvhKN41D/5/s0G6s9JYekYU31DKu/NXDCTRrYQfi4PoPbeGmP9jJqjbs6s0DwpdO@lists.linux.dev
X-Gm-Message-State: AOJu0YzC7ueSamT7VAowLiYWnZun22rkr5wzzo6dZ4FthJVp5qk0lFBW
	nhPvxrLBfT+4vH9FUSO5Wab091o/ePsQ+KZNlBE8bWfQxhB+/F7NP1FBy/Yd6ikaXDlje8dphYG
	ILw1SsMiV3eeoeE1/eDSBHdYmEn7VmJ/7kpXQegk=
X-Gm-Gg: Acq92OGbnjW5sWDwhnRhugkI1HTv1ecXuE0Q7Z40W9mOfW1Yq5Ipy5EBono5zy/uoGe
	2MWbk5lXfnf3OxIfD9vvDLGbXxTiHuyp+wv0e915nG4XMXWyuocNG2qQ2dpeqvL0VYi3LCxNg9o
	tbfobJDWqW2aqFQPodWFnlKeT97EDFu+LKu6wlbqMw6M4rRHA3ogtPSIfaEDXy/DQc9D1xjL0hA
	7KZH0N0rMiGcQLY+tgONm68S3VpLYgFbjsQAmGDJuwJUHJMsRkSliKwHp6BRQ0yaSwxq/Q/1NC8
	Zd8KDq1aG3lEwHAi2p/0o/pxIoo41A1GrWlOB176z/ar2Dk1He6ojYuFkU4BRusbY/U=
X-Received: by 2002:a05:600c:608d:b0:490:53b0:9e53 with SMTP id
 5b1f17b1804b1-492333a1556mr78485235e9.1.1781701840813; Wed, 17 Jun 2026
 06:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com> <CAJfpegsWpKE4kUUQo+NK_cu6oy6h6+A1M=xokvSQbFtZzu9UKQ@mail.gmail.com>
 <CAJnrk1b1nVFZ8dQYA=iGn-p182HNhhRfZEVe-e_ks_daZAU3Rw@mail.gmail.com> <7efc8efa-186c-4d74-a319-e4544acf1ef8@bsbernd.com>
In-Reply-To: <7efc8efa-186c-4d74-a319-e4544acf1ef8@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 17 Jun 2026 09:10:28 -0400
X-Gm-Features: AVVi8Ccb0b1w2e8LSTSRgULxU3vzN8voq-1aPg94t2pXFJpo42em3Ev-XFhubOQ
Message-ID: <CAJnrk1at1agOZkFpGXE4ktvvC1nQ3mAvO_Mmf=ZRPVgfr8mjnA@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, axboe@kernel.dk, 
	jlayton@kernel.org, libaokun@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 6:28=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
> On 6/16/26 07:28, Joanne Koong wrote:
> > On Mon, Jun 15, 2026 at 4:41=E2=80=AFAM Miklos Szeredi <miklos@szeredi.=
hu> wrote:
> >>
> >> On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> wr=
ote:
> >>
> >>> To use this, the server must set the FUSE_URING_BUFPOOL flag during
> >>> registration and provide the payload buffer pool through the iovec
> >>> payload in the first sqe.
> >>
> >> I find this interface inconsistent.   Decoupling the buffer(s) from
> >> the seq's means that the registration should be decoupled as well, no?
> >
> > Looking at Bernd's reduced queue series [1], I think we'd most likely
> > want to also pass in the number of reduced queues separate from sqe
> > registration. I think along the lines of the config sqe Bernd brought
> > up, it seems cleanest to add a new cmd op
> > (FUSE_IO_URING_CMD_QUEUE_SETUP) where queue-level settings (eg flags,
> > number of queues, bufpool, etc) gets passed in. This would have the
> > nice side effect of doing the queue creation in this op instead of
> > right now creating the queue lazily when the first sqe gets
> > registered. On the userspace side, this adds a bit more friction (eg a
> > two-phase setup where userspace submits the queue setup cmd, reaps its
> > completion, and reuses that sqe to register an entry), but that seems
> > like a reasonable tradeoff.
> >
> > Does this sound ok to you and Bernd?
>
> Can we please discuss this on Thursday? I'm by no means opposed to a

Definitely. Discussing this on Thursday sounds like a great idea

> config SQE, but I don't see how it will really help. My issue is that
> any fixed number of queues and queue entries is almost never the right on=
e.

I agree. I definitely think it would be useful to add more queue/ent
capacity dynamically, but imo I think that should be done separately
through a new cmd op after uring setup. I think it'd save some
headache to keep setup and runtime resizing as separate concerns /
paths and would be easier to reason about different races that could
happen and would keep the setup logic simpler.

> The config setting (via SQE, ioctl or FUSE_INIT) could be used to
> prepare the kernel, but final routing update needs to be dynamic.

Agreed that final routing update would be dynamic.

Thanks,
Joanne
