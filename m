Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9078A379ED8
	for <fuse-devel@lists.linux.dev>; Tue, 26 May 2026 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779811297; cv=pass; b=ild4ss4KUpFHFs7xc9o/Mxs1LONy/x82oHzQndiPlf2ZWp7zpOAuFPRcuxQBHSZzgJWyUQJ9rBZBaZiwilw2YKUqJ5Yl6D42+dO4ICTP/vnhIKB1Atb2IxLe7Uk6s0AvGZbh27CbrV4phKdyZ8lwfOTscLRpl/j+ELwlUhZucHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779811297; c=relaxed/simple;
	bh=ZmFKmTCYvp/wmpkH+lY+TstGeOQ4rvYLU/s/d/jytoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tlkxt+iHLwYgqv1GNyT5N1Q08pe7058rD1d90wPwZ9OmQMZJ2Zjh2xt7ENTtLZHv2WbAUawUf5ZC/Y9ZuZF5Hijbl9i56R0efQSR69oKmIAq5jKDIkumt0eCjkWBzvNaGj7suN1N4lsGBs4euBgJvN32z/Bc/cJDmCCJXR0kdII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RauooXAb; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RauooXAb"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so1661261a12.3
        for <fuse-devel@lists.linux.dev>; Tue, 26 May 2026 09:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779811294; cv=none;
        d=google.com; s=arc-20240605;
        b=RpXdVZvc+wgx0cHwr676AreugdW9FN+GxD4CLp/GVHWCdQY5Dw20DKL8Rg1Yx7pGhk
         OAskYWHcrqtHsu7cnbnSLQgznHPNxszntfcWyEPUc9J98BPW4Xmft6j3WOkuijwCdPHP
         ITrlRh3ktAu9B5SIV5owrq+j2HvuZDmGCcerx9VjizH2v8p6ZAsSVBRYA65mtymwtkiW
         WdCvW82DYYncOMbHI1hKV0s8MnmhEqv7lDKBkf6NuJ+p5rMgEEnrWjNa4vMVAKg6B41j
         vZL7BUo10UMJWPLkfkGmzF4RdqSZFtGjFkBZWm7AZdzkE9lhSmwZ+++gFjlAL1+zhvGC
         9ayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BvPjDI6oYw4mq78+4LFw+EaXk0SBCKNhjS0e1v1hfl0=;
        fh=b1qMU4x5uikr5cmqu1gEimdubQHgJGko0kNK8wtblOA=;
        b=K/dupEspXLbxJbtnTGZybaQuvoQRmlNr/F4nvsBwJhUPvlSYWIZpmBvFg8aU6VNYb5
         CufJpUgQRjmELebbgxSQPAG09e0YhZzHUv7y//zT+JHE3VPiXzCyZOcm+azHUNuST0+F
         V9DWWZ3rRyF5TdkLLWjd3QKwGCiy3CG1WyK/M0m3CYHAa75lklkmqE3c8s/XEIl1rwug
         uGMmzbZORydxBlCx7mfRxjCEKpvjqsy3KNcB2X14a4Z3bslM+HaTFtRxx89M6epUCLgV
         4BJVLvDiI4DEDkvDarU7WFaXdopRYW5DQxfdBbsuTup8YaNiGqfchBLnTgISlTN6ZErb
         au2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779811294; x=1780416094; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvPjDI6oYw4mq78+4LFw+EaXk0SBCKNhjS0e1v1hfl0=;
        b=RauooXAb7s+YIkMMW96wZxclR9gifmpAc+gCxaQUVC1imaquO7qGSWua3xGqv3O97h
         JqS/BtKZoVBh4sqdyoyPsZNaB48p1JPYOrgzwi/u8FtgLzm85ipTDRtlZGXYfoICaOYL
         acRg/Md60j/y+A+mVZh6UTvXV4ITupcd3A3Y2xbnO+V6ZLgjDcpsY9wDxuyObkbtOtO4
         ydWf2VL6DGubZdw9PnT3rWUdzaVam6A2/4dAM00kZP1PhlNX1xg3601VJIr+ghqt8MS1
         sotJ+MfMgHDM8E/SixJscAWrgw4KwluKX4/rNWj75sLDs+kmLbkBNYl2QV+p0uSKyl0h
         mNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779811294; x=1780416094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BvPjDI6oYw4mq78+4LFw+EaXk0SBCKNhjS0e1v1hfl0=;
        b=Nw88WIHF93A+N5MftiDtA+MXcVRwTUDgVYeVLQUCtqugMAwQHkt4gYXjAEABxbuabq
         jPdZjJSY2rPTVnXIDH/cDB6C8nqCvBZVc3ON8B58mmenvSJqYJxCKzdrs/5RKr/GDMnq
         7I98y/LHXGmHxVluO33GD/8JBCeg9Dum4Uxjcu/bvvJh9HItlp1A4vt3nuWDSy9HoQpx
         CCMOE6tkT2YN5HZuV9biFI7FzXbFoGUlAK2PK7ai+r/cUtd6dEHoPKkpqplbkafvhT7m
         KRrXfKJVgzdm/aZoTe/eWfMYzq+lcTmcsSKwhjiTopCe+vbyS7amdQ+0PFrtpPdosVFs
         YrgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LTuk3Iu/ru4UN2YkZgsuwZ8Tz2cn8z9rDkDlgkrqvoiD+d5KbNCkAeJnxQ/CuO2S4BRuBABl/FPjn@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9pZtxYvectutUx54pZO09O+BdRf62tjPWSiYq/D7n8dxdXxDS
	qGfLCnn2CI2UFBZh0sImBr40ZG7xRt8PLWq0YaNE1Jo85iiJYdiVGOIfiZIdW8aqUdGtIeqaYyX
	oLP+EW7+Hs5kzBBCJ3+M4C5ZWr8v2+LM=
X-Gm-Gg: Acq92OGbQc5x4nSo5dPe0FNICtjIg73BPfjk7Yy7t4DQfSLUEVqYzvYLj38Gdvm0HeN
	AjMOVOadCYSrBAAH5mdaSBFMF0zXkauSaqi3hTHHJxH2zg8Q82AyFK6XBT1TR5okOHOyrnb1Z2S
	CfUJaTgfq5/zuRoOlANcDmIpNvvnKF57IXC9c8m2pw3ZL1m/pRzmgJ+9+vaotpJnhxpbQdN6hT7
	GTuctZ0axqnmh0oZQllGUc0aAHfbLK6RTVOAk3xfTfQcrJSg/VhvtiWB72JANvkuU2BBBKiQJaK
	hRu+loCRFc/O0TjC
X-Received: by 2002:a17:907:74a:b0:bcf:5de8:567f with SMTP id
 a640c23a62f3a-bdd2580c412mr1118682366b.28.1779811293440; Tue, 26 May 2026
 09:01:33 -0700 (PDT)
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
 <1e952be4-6fe1-42c3-a691-114613f2120a@bsbernd.com>
In-Reply-To: <1e952be4-6fe1-42c3-a691-114613f2120a@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 26 May 2026 09:01:19 -0700
X-Gm-Features: AVHnY4J6vD7Lftrqq4YXTiqOssJ7AleXNXeXHZXwlA6FhC38fyv_N04rjIDAu4Q
Message-ID: <CAJnrk1YKUET6gQoM-S=NdwmyefNbbso+Z+DsokDiGp-8=PPgKA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 10:08=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com>=
 wrote:
>
>
> On 5/23/26 01:08, Joanne Koong wrote:
> > On Fri, May 22, 2026 at 3:49=E2=80=AFPM Bernd Schubert <bernd@bsbernd.c=
om> wrote:
> >>
> >> On 5/23/26 00:38, Joanne Koong wrote:
> >>> On Fri, May 22, 2026 at 2:51=E2=80=AFPM Bernd Schubert <bernd@bsbernd=
.com> wrote:
> >>>>
> >>>> One piece I had been pondering a bit about, though did not dive into=
 the
> >>>> code yet.
> >>>> What is if payload would be registered per ring entry (as without yo=
ur
> >>>> changes) and just the header would become a buffer ring (so that cou=
ld
> >>>
> >>> I think payload buffers must be decoupled from ring entries if we wan=
t
> >>> to reduce memory usage in the non-zero-copy path.
> >>>
> >>>> be pinned that way without loosing one page per entry)?  For zero-co=
py
> >>>
> >>> For the header pinning changes in my branch, the headers are one
> >>> contiguous region (not per-entry), which circumvents having to
> >>> allocate one page per entry.
> >>>
> >>>> we could register entries without a payload? Advantage here would be
> >>>> that that header buffer would determine max number of entries, only
> >>>> little memory would be needed for over-subscribed entries, but entri=
es
> >>>> themselves could be registered dynamically on demand.
> >>>
> >>> For zero-copy, entries still may have payloads (though the buffers
> >>> will definitely not need to be as big as the max payload size!),
> >>> either for the non-zero-copyable args or if the request's args aren't
> >>> page-backed. Unfortunately I think many servers may not be able to us=
e
> >>> zero-copy due to the CAP_SYS_ADMIN requirements, so I think it'd be
> >>> ideal to minimize the memory consumption needed for the non-zero-copy
> >>> path, through the buffer pool for the payload buffers.
> >>
> >> Well, my problem is still why would we need to register ring entries i=
f
> >> they don't have buffers - why not just register less ring entries then=
.
> >
> > Entries may be used for servicing requests even if there are less
> > buffers than the number of entries. Most requests don't use the full
> > payload buffer size, so for example with incremental buffer
>
> I think that is an argument for multi-size bufs per ring.

Which is what the buffer pool provides (decoupling buffers from
entries) if we choose to later add that in the future. With 1:1
entry:buffer mapping, each entry requires a buffer that supports the
max payload size at registration time.

>
> > consumption, this would allow multiple entries to use non-overlapping
> > regions of the same buffer concurrently. As well, if we want to
> > support multiple buffer sizes per ring, there shouldn't be a 1:1
> > mapping between ents and buffers. There's also some requests that
>
> I can counter argue that fuse-server can just send ring entries with a
> different payload sizes - fuse-server could dynamically create as many
> ring entries of the right size as needed.

I don't think this is a good idea. The server would have to
guesstimate this as it doesn't know the request size until it sees the
request. The server could speculatively pre-register ring ents ahead
of time but there's no guarantee that would be the right size for the
ring entry either. And once added, if the workload pattern changes,
then the ent and allocated buffer may not be useful anymore. This also
adds (imo needless) complexity to the kernel side. Additionally, the
dynamic ring ents would in the ideal case have payload buffers pinned,
which there is not an non-messy way to do (for buffer pools, the pool
buffer pinning goes through io-uring registered buffers infrastructure
prior to being passed to fuse at registration time). Imo the better
way if you wanted to dynamically add ents would be to add a new buffer
pool to the ring.

>
> > don't need to use payload buffers at all (eg flush, fsync, rmdir,
>
> Could be handled by multi buf sizes as well.

These requests don't require payload buffers.

This series already handles this case (eg not assigning a buffer from
the pool to the request).

>
> > etc).  As well for registered buffers / buffer pinning, it is more
> > optimal for the buffer pool to be allocated contiguously and pinned
> > contiguously rather than passed in one by one as a 1:1 entry:buffer
> > mapping.
>
> I don't think how the buffer is passed to fuse-client/kernel matters for
> (userspace) allocation. I had written before that libfuse's buffer
> allocation is not ideal, I had it continuous in initial development,
> then run into bug and for simplicity changed to per entry allocation.
> Switching back to larger allocations is simple.
> Regarding page mapping/pinning, why does it matter if the buffer in
> kernel is known as per entry or per allocation (assuming payload buffers
> are page aligned)?

It does matter how the buffers are passed to fuse for page pinning.
Please take a look at patch 8 ([PATCH v3 08/10] fuse: support
registered buffers as buffer pools in io-uring) [1]. The buffer pool
is contiguously allocated and registered as an io-uring registered
buffer, and then passed to fuse and by that point, the buffers have
already been pinned by io-uring.

Even irrespective of page pinning, it would still be good to pass the
buffers contiguously up front as a pool instead of per-ent, as the
purpose of this series is to decouple the 1:1 entry:buffer mapping. Eg
if the request an ent is servicing does not require buffers, a buffer
should not be reserved for that ent, amongst other benefits of a
decoupled mapping.

[1] https://lore.kernel.org/fuse-devel/20260522205823.1597313-9-joannelkoon=
g@gmail.com/

>
> I think the more important part for buf rings are pinned headers. For 4K
> pages the loss is maybe still acceptable and the remaining size could be
> used for small requests and I guess would have a perf benefit. For 64K
> pages the loss is quite a lot.

That is orthogonal to this series. This series focuses on payload
buffers, and header pinning is not part of this series as
bufpools/bufrings do not need pinned headers, as it makes no
difference for performance. As mentioned in the previous message, when
I was working on a separate series for removing the dispatch overhead,
I implemented header pinning as part of that, as that is when header
pinning becomes actually useful.

>
>
> Maybe let's summarize
>
> Bufrings
> - Fixed size, allocated at startup, cannot be easily increased or decreas=
ed
> - Allows 0 size payloads (FUSE requests that only need the header)
>
> Entries with payload
> - Allows more flexible setup - fuse server _could_ (not implemented as
> of now) create entries based on incoming IO.
>
> Neither provides real multi-size buffers per ring.
>

I think perhaps there is a misunderstanding of the patches in this series.

This series implements buffer pools, which decouple the 1:1 mapping
between ents and buffers that currently exists. Right now, ents and
buffers are tightly coupled where each entry has its own dedicated
payload buffer, requiring N buffers for N entries where each buffer
must be large enough to accomodate the maximum payload size.

This series allows servers to pass in a buffer pool where the buffers
are not statically mapped to an ent at registration time. This
decoupling reduces the memory usage requirements needed to use
fuse-io-uring. It is the necessary stepping stone for future
optimizations such as incremental buffer consumption (allowing
multiple entries to use non-overlapping regions of the same buffer
concurrently) and supporting multi-size buffers per ring.

Thanks,
Joanne

>
>
> Thanks,
> Bernd
>
