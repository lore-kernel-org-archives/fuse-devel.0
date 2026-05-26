Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1761B4218AE
	for <fuse-devel@lists.linux.dev>; Tue, 26 May 2026 17:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818038; cv=pass; b=OWlKxHY5PNL4r9o8FwFMvATd/AlbfQEbMAJ0+d/Prak/5ZR+SKvaXqhm9eHNMUzjrvRnOrK6vRPcljpdkXx8clRx5AUohouW0PYGP5BTfUxxtFBYOw331Pqvu+P9ehUxJCKCjZBJ5e89f6pb905nh9K6zMxQpDV+GyssSoKSVcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818038; c=relaxed/simple;
	bh=JXQc2Y9u924ZchPd969ca8ninZoXxlll3D5aT7jCRt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZuS0En7747BmzIoc3PmoQioAlYtKv5SZQlgq9L5RZa1cLZkWNWve1CgaC/10+EiFtL1Ztszu80RIE3hx6tWRfRh4ILaqf77RNcnhO9R9rq3XXmGiSb/8AM2mR4h56YFPrn3FObxZlS8wNFGJgIeHmzt3GcE7l/DKqG4QmtAQgfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akcFPwKw; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akcFPwKw"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43eb05b1875so5814802f8f.3
        for <fuse-devel@lists.linux.dev>; Tue, 26 May 2026 10:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779818033; cv=none;
        d=google.com; s=arc-20240605;
        b=ZWuhBYiQI5SHK+h+SfEcE8Qw5RLN3F/8J3nr9RjiCpSMqx1vy3BegxmCWgHjWqo5SX
         HeEiukQuPeNSAXdvgr5BRvU6v90Lq+XW27uLSJDTZohYlv/hkZUlsbSsWm/e3cuxcoIn
         BqoRkjpxfW5UVgXUrLvitEgIAqIUG2EODd9EugmRek0jqDAUvtg50MkPT7HLcGHGMyuf
         J4Loakweaah2m0vuTqhIinWRUmAxJsw1iFaR6u5yWXnWiSYXEAd8tycaWweZOoB6Ml3j
         sc9olcwjt87yPqRkaHlfAS05V7yqcLdip0u4VY0TIeIFxpdEgieV0q56E7sFnaDpZJT/
         rWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GZH4OSqdk3uZCBCdKANtr4qyhBZQ0FibmwzuYV16sVI=;
        fh=bpnUAwUMyKs80zx69DQsm5aqFoi2LXHmlXVNZRGj/ds=;
        b=biahaLRdunaJpGdi/fe07XXvvcK2MPtvWfCBrtrsLOKbpvJSxCvPMiIeDSY6z4nYdd
         9ra53r7Q2TFtnXIWkOR9kn5FrIFsnoys9XpU0Iuoqwqhvkw3HnpRQp/zn7UgfN+Y6K5z
         vZ/aL6iNs/PU98sa7nDMsnvPoP0yhXuPY2d1rouVjHpjiGktkIrKLXurPFhYW5JTuZcb
         UP1I6gkePBrMklEyVg7fXqF6J396fgpiWe+hET5kRsWjztt1WaCUh6S+jnSdn9TsbGXF
         9aSR+R9etUant5RUV6ibc/4JFZfJY0EVyJ1JPXIxHvui0UZrWvK/0AHz03cesGAfI98O
         HDbA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779818033; x=1780422833; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZH4OSqdk3uZCBCdKANtr4qyhBZQ0FibmwzuYV16sVI=;
        b=akcFPwKwBBWrf/aDtcdH8Hr/n1AiKs4raJ5k/wVz6/1mspD1SArAA1XN2dBOAj+G1A
         ONa03MMW3g9iLFsuxJXZqm7H3nO1UXpBCp3KwHrIeb8vtnF9xx+miquUuAXHgNQlqEu6
         ODQKWOO5J83KObpmZ7VJDkV6kLsBI6X6bu7A2CK7U6iGH4TSBHIm4z/ezWC5sHblIEPH
         ijJZqsiXc3ZO9EhuBnDOeYQDlpV3TwehKsJVWHcfOcAUQnYyjko65QguaEYWR6lB8Fib
         O7hwXT4bOxnhBeyFkCnO7LxsfJC8q91V8j7WFn4v0sBjRJpaCBATq+6KLKOQrxK8Rfw9
         9cQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818033; x=1780422833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GZH4OSqdk3uZCBCdKANtr4qyhBZQ0FibmwzuYV16sVI=;
        b=cfbGPwpM9lpbCFcsKRSvny4bB1KRQnpDB4atJmbSPO/vHjoVHNwbownZ+V2vSrup1x
         b5hwqUQoQdSjgbpgoE92P93rjhSdBdCNacqCljq33hbp+W7gcxWnV+5kSgRoadjfo06i
         KMHce8HR09jJDp/bP5ZIPR7zBqBJ8B0H7jlg/ZliVHi8bx7PZ++Co0KeP8MMvROyLyj+
         hvd4iWig7Y4lyyjCqJC7HHk1Y/vwV51nkvVFHIkZAUdpD1defkcNbOstjCEBCmxbnJLy
         qp+ePRk2wtBWWLVQxFaEEv+UdvFlIQczSys8tRC2j8ubJcozsmqaecB2olI34NlC6KJR
         RemQ==
X-Forwarded-Encrypted: i=1; AFNElJ8daAqqU2OcP94KSxdyeIMW0yfg+5LDuN8q7iUQtJWab3K1u7KfujX3vXTCPjvBagAFXcbPjM1lzo6g@lists.linux.dev
X-Gm-Message-State: AOJu0YwnroEYybWKFDzRpHd3Ec/P3AU4iZLBGMzvEPUqpZvUkGxWmJwP
	jl7MVToHJW5AnN1rdLmWFX1j4xBJd2sxFyP8AA3UvOyeG/lOkwJ0OgKAlRKGAcFdRUTv48TE1eA
	G2tPumWEKsNc1963KuID9b2leRyDyl/0=
X-Gm-Gg: Acq92OFiwPjldoS9E6fXJzuFWwpsH3MCBNA6k7pDKDvKuzD2NjCUPB2fv2110CWlU54
	ivgoc4Gc6nYFPbk+lXCtmhLuqWROUHW+Lxz6wPCAyYKpyoK5ZvQp1d+SJUTMWJR9O79WxAwouGC
	gM6vkCDdgMAMyM6eTErBqaxmXuLIVcGHrMFaHN/2fjB8YTiXVEsPTa4vZtvW53nuwUn0kNJBDGo
	mHIK6V1pic0rurJ7vTe69n3/QFbDD8BCb6L5IsFPB7O9x9SUVTVBhWOl69ylDuf5WtohdUXFVgv
	BUlalw==
X-Received: by 2002:a05:6000:610:b0:44a:fe14:3738 with SMTP id
 ffacd0b85a97d-45eb36905a7mr35043160f8f.10.1779818032492; Tue, 26 May 2026
 10:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1aV1Z0wBQ=ViTKEsojrVkqaNnpRHiBOqFLRL+QtS2gMPA@mail.gmail.com>
 <1c3ef92a-d3b4-47fc-9d34-9c996b8eb0c7@bsbernd.com> <CAJnrk1bOyoUD74byw3ZXWzQ3dAiZObE0V46+=rtkPG8-3vqUEg@mail.gmail.com>
 <55b80c43-2e84-4a42-b383-108f06254b6a@bsbernd.com> <CAJnrk1Zby7T4WMShk+d8QdVoqtAFLSotc9_d0RbGKSnP4fXq9A@mail.gmail.com>
 <1e952be4-6fe1-42c3-a691-114613f2120a@bsbernd.com> <CAJnrk1YKUET6gQoM-S=NdwmyefNbbso+Z+DsokDiGp-8=PPgKA@mail.gmail.com>
 <eac49567-cb04-47a9-be90-5126aa6a4820@bsbernd.com>
In-Reply-To: <eac49567-cb04-47a9-be90-5126aa6a4820@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 26 May 2026 10:53:40 -0700
X-Gm-Features: AVHnY4KQZe5CBviMn4cuvVeXWTsPWBUysDlbHebBUC6jiJaNvlSKjQE24pYpRcA
Message-ID: <CAJnrk1aYb6E8Dz2axZTnwMbFCqjPSoC8C--uVvORjLwBGgThzg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 9:57=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
> On 5/26/26 18:01, Joanne Koong wrote:
> > On Sat, May 23, 2026 at 10:08=E2=80=AFAM Bernd Schubert <bernd@bsbernd.=
com> wrote:
> >>
> >>
> >> On 5/23/26 01:08, Joanne Koong wrote:
> >>> On Fri, May 22, 2026 at 3:49=E2=80=AFPM Bernd Schubert <bernd@bsbernd=
.com> wrote:
> >>>>
> >>>> On 5/23/26 00:38, Joanne Koong wrote:
> >>>>> On Fri, May 22, 2026 at 2:51=E2=80=AFPM Bernd Schubert <bernd@bsber=
nd.com> wrote:
> >>>>>>
> >>>>>> One piece I had been pondering a bit about, though did not dive in=
to the
> >>>>>> code yet.
> >>>>>> What is if payload would be registered per ring entry (as without =
your
> >>>>>> changes) and just the header would become a buffer ring (so that c=
ould
> >>>>>
> >>>>> I think payload buffers must be decoupled from ring entries if we w=
ant
> >>>>> to reduce memory usage in the non-zero-copy path.
> >>>>>
> >>>>>> be pinned that way without loosing one page per entry)?  For zero-=
copy
> >>>>>
> >>>>> For the header pinning changes in my branch, the headers are one
> >>>>> contiguous region (not per-entry), which circumvents having to
> >>>>> allocate one page per entry.
> >>>>>
> >>>>>> we could register entries without a payload? Advantage here would =
be
> >>>>>> that that header buffer would determine max number of entries, onl=
y
> >>>>>> little memory would be needed for over-subscribed entries, but ent=
ries
> >>>>>> themselves could be registered dynamically on demand.
> >>>>>
> >>>>> For zero-copy, entries still may have payloads (though the buffers
> >>>>> will definitely not need to be as big as the max payload size!),
> >>>>> either for the non-zero-copyable args or if the request's args aren=
't
> >>>>> page-backed. Unfortunately I think many servers may not be able to =
use
> >>>>> zero-copy due to the CAP_SYS_ADMIN requirements, so I think it'd be
> >>>>> ideal to minimize the memory consumption needed for the non-zero-co=
py
> >>>>> path, through the buffer pool for the payload buffers.
> >>>>
> >>>> Well, my problem is still why would we need to register ring entries=
 if
> >>>> they don't have buffers - why not just register less ring entries th=
en.
> >>>
> >>> Entries may be used for servicing requests even if there are less
> >>> buffers than the number of entries. Most requests don't use the full
> >>> payload buffer size, so for example with incremental buffer
> >>
> >> I think that is an argument for multi-size bufs per ring.
> >
> > Which is what the buffer pool provides (decoupling buffers from
> > entries) if we choose to later add that in the future. With 1:1
> > entry:buffer mapping, each entry requires a buffer that supports the
> > max payload size at registration time.
>
> Let's discuss further below, I would really like to see a design
> discussion how we make that generic for different IO sizes.
>
> >
> >>
> >>> consumption, this would allow multiple entries to use non-overlapping
> >>> regions of the same buffer concurrently. As well, if we want to
> >>> support multiple buffer sizes per ring, there shouldn't be a 1:1
> >>> mapping between ents and buffers. There's also some requests that
> >>
> >> I can counter argue that fuse-server can just send ring entries with a
> >> different payload sizes - fuse-server could dynamically create as many
> >> ring entries of the right size as needed.
> >
> > I don't think this is a good idea. The server would have to
> > guesstimate this as it doesn't know the request size until it sees the
> > request. The server could speculatively pre-register ring ents ahead
>
> How expensive (in terms of memory) usage it is to set up a few small
> buffers? Compared to one large buffer?

It's not just about the memory savings. Fundamentally, I believe it's
the wrong abstraction to statically couple ents to buffers 1:1 as a
fixed mapping. Entries and buffers serve different purposes. Entries
handle request flow, buffers hold data. Statically coupling them 1:1
is inflexible, introduces unnecessary complexity, and imo has no added
benefit. This series decouples these two concepts. It allows
dynamically adding ents in the future as *generic* ents not tied to a
particular buffer size (eg the added ent can be used to service *any*
request size, not just the size of the buffer it's tied to). With
tying ents to buffers, the server is stuck with a static distribution
that can't adapt to workload changes.

>
> > of time but there's no guarantee that would be the right size for the
> > ring entry either. And once added, if the workload pattern changes,
> > then the ent and allocated buffer may not be useful anymore. This also
> > adds (imo needless) complexity to the kernel side. Additionally, the
> > dynamic ring ents would in the ideal case have payload buffers pinned,
> > which there is not an non-messy way to do (for buffer pools, the pool
> > buffer pinning goes through io-uring registered buffers infrastructure
> > prior to being passed to fuse at registration time). Imo the better
> > way if you wanted to dynamically add ents would be to add a new buffer
> > pool to the ring.
>
> I think the whole point here is that a few small payload sizes are
> negligible to one single max payload.
>
> >
> >>
> >>> don't need to use payload buffers at all (eg flush, fsync, rmdir,
> >>
> >> Could be handled by multi buf sizes as well.
> >
> > These requests don't require payload buffers.
> >
> > This series already handles this case (eg not assigning a buffer from
> > the pool to the request).
>
> It handles exactly one additional case - zero payload size.
>
> >>
> >>> etc).  As well for registered buffers / buffer pinning, it is more
> >>> optimal for the buffer pool to be allocated contiguously and pinned
> >>> contiguously rather than passed in one by one as a 1:1 entry:buffer
> >>> mapping.
> >>
> >> I don't think how the buffer is passed to fuse-client/kernel matters f=
or
> >> (userspace) allocation. I had written before that libfuse's buffer
> >> allocation is not ideal, I had it continuous in initial development,
> >> then run into bug and for simplicity changed to per entry allocation.
> >> Switching back to larger allocations is simple.
> >> Regarding page mapping/pinning, why does it matter if the buffer in
> >> kernel is known as per entry or per allocation (assuming payload buffe=
rs
> >> are page aligned)?
> >
> > It does matter how the buffers are passed to fuse for page pinning.
> > Please take a look at patch 8 ([PATCH v3 08/10] fuse: support
> > registered buffers as buffer pools in io-uring) [1]. The buffer pool
> > is contiguously allocated and registered as an io-uring registered
> > buffer, and then passed to fuse and by that point, the buffers have
> > already been pinned by io-uring.
> >
> > Even irrespective of page pinning, it would still be good to pass the
> > buffers contiguously up front as a pool instead of per-ent, as the
> > purpose of this series is to decouple the 1:1 entry:buffer mapping. Eg
> > if the request an ent is servicing does not require buffers, a buffer
> > should not be reserved for that ent, amongst other benefits of a
> > decoupled mapping.
> >
> > [1] https://lore.kernel.org/fuse-devel/20260522205823.1597313-9-joannel=
koong@gmail.com/
> >
> >>
> >> I think the more important part for buf rings are pinned headers. For =
4K
> >> pages the loss is maybe still acceptable and the remaining size could =
be
> >> used for small requests and I guess would have a perf benefit. For 64K
> >> pages the loss is quite a lot.
> >
> > That is orthogonal to this series. This series focuses on payload
> > buffers, and header pinning is not part of this series as
> > bufpools/bufrings do not need pinned headers, as it makes no
> > difference for performance. As mentioned in the previous message, when
> > I was working on a separate series for removing the dispatch overhead,
> > I implemented header pinning as part of that, as that is when header
> > pinning becomes actually useful.
>
> Yes, header pinning is orthogonal, with the exception that ring entries
> of different payload sizes provide the same feature as buffer pools and
> with that buffer pools would not be a requirement anymore.

Buffer pools / buffer rings make entries generic (can service any
size), whereas per-entry different sizes locks each entry to a
specific size. I don't think ents and buffers should be statically
coupled 1:1.

>
> >> Maybe let's summarize
> >>
> >> Bufrings
> >> - Fixed size, allocated at startup, cannot be easily increased or decr=
eased
> >> - Allows 0 size payloads (FUSE requests that only need the header)
> >>
> >> Entries with payload
> >> - Allows more flexible setup - fuse server _could_ (not implemented as
> >> of now) create entries based on incoming IO.
> >>
> >> Neither provides real multi-size buffers per ring.
> >>
> >
> > I think perhaps there is a misunderstanding of the patches in this seri=
es.
> >
> > This series implements buffer pools, which decouple the 1:1 mapping
> > between ents and buffers that currently exists. Right now, ents and
> > buffers are tightly coupled where each entry has its own dedicated
> > payload buffer, requiring N buffers for N entries where each buffer
> > must be large enough to accomodate the maximum payload size.
> >
> > This series allows servers to pass in a buffer pool where the buffers
> > are not statically mapped to an ent at registration time. This
> > decoupling reduces the memory usage requirements needed to use
> > fuse-io-uring. It is the necessary stepping stone for future
> > optimizations such as incremental buffer consumption (allowing
> > multiple entries to use non-overlapping regions of the same buffer
> > concurrently) and supporting multi-size buffers per ring.
>
> I just don't see "reduces the memory usage" - there are few op code that
> do not need payload buffers. Do you see that exactly these op code
> disturb your workflow and you do need additional entries/buffers for
> those? I do see a lot of lookup/revalidate/getxattr, but not the op
> codes without payload. Equally I see IO that does not max payload for a
> lot of requests types - anything namespace related and reads/writes
> below max payload size.
>
> In the end, what I'm struggling with is that the "zero payload" is just
> one special case of different IO sizes and the entire code and flow is
> changed for this one special case, without a discussion forehand how to
> handle the other cases. And that one special case comes up rarely in my
> own testing and use cases.

I think we're talking past each other. Buffer pools aren't about "zero
payload" as a special case - they're about decoupling buffers from
entries in general. Zero-payload requests are one beneficiary, but the
design enables incremental consumption and multi-size buffers as
future work precisely because of this decoupling.

Thanks,
Joanne

>
>
> Thanks,
> Bernd
