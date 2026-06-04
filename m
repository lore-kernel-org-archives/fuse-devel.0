Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4549930B525
	for <fuse-devel@lists.linux.dev>; Thu,  4 Jun 2026 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780610823; cv=pass; b=LOUwsq/dZ04LGzUWSiDdzttbSmFUxQ+SK7EN1zykbF21sRggPfvP4n2rfhiXEWnDNcKHcQE2gDEl16E4JGyFxUvzWLcoIWf2Jb3V7zOkvrXKRPMq5Tgh9cw5z4spBj5BJy3MnVDd62wl1LugO/CYSiv4KxCgzxwXKJKTdJsZ8/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780610823; c=relaxed/simple;
	bh=niEra8NrHB3sGS8KsIgZOrjNtptkmMkU1bJIlTgYaXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlCtNkzRX4DAr3rjEeVikn6m1+4hcI6UZO0LdM3Jh+Y6sicvtQXDr7WR6Hvh0TNDyFMI4XiRkFlr1jzfRLaCqff16xQqZOQnaJTOOja2jmcIIlh5junjEXBPf/AOpXznrAxF+Odh1+VuSqCySWLJFKMxkARrqK+aMnDNV3M8eT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNt2XU3O; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNt2XU3O"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45eec22fab7so666098f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 04 Jun 2026 15:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780610820; cv=none;
        d=google.com; s=arc-20240605;
        b=gmk42EUGOlWRMYvRY7kwlei8kz/wqw4YHYAxoJk+qIG0B+jrFCv3+VzoB3XR/m3UGP
         JpCfNlrhyIoyJG63SmIUtUuAOEg6jMO/jN1eGPe5jc4J/QBgx+LExjcuvVOT1QfgylFJ
         QXBtwUhM4XZm8Be9/1ykbEG8rEpirzn8mAsFmYbmhqPLn45D9lHfV5TYMt3lJbUId4ox
         dDDLzaEI0kSQfumJ41SYiUTkewBY4XPVYVntIlFzS4h/RpUKwQkYZ1Uvv1B5GU2iSUvK
         r7neqI4TKfYf31/s3J3QHc8AVmcaZ0joUMOTZ8RVPgJmsdNYLWniCyKMHPRiBse+5qHz
         Vo8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FdN21+rhpt+lM5nzU0xa7FNqFa7rofAagsiBs/rDCns=;
        fh=Ud1DVhZNqMD5ECjVutNtTyQ2gEDJWYLHBNzY9ctGsDA=;
        b=bwtb94jovE6B96PGnM+LfW7WfCOeWdYjWLw2zM89u83upbM6HGY9x7W95Ujn3B61Pf
         uWtHmo6SJ19QKfA3/eJfsiADXPgHEX1Qs72hi5lXZl0PI2DEoi5U49ylo3y4HMmmPD7/
         5Sf/i5OK51b9A+GbYGm0u3QwaG8kLsPGgQbuj4ztgeP4+COs5WfhXwdVp6mqxQaw8UqS
         5wuSvtyfKONd9TiWH68Ud7RUoCxWi1YNy4JCHC6/MDLgZUVVWj9h6i4s4fGPb5T80Quw
         MJp6kE+G8w+DQRJ+TYGrnk5DnOKreEmtybdUQUnr5w7beoKvlMCagw9if+QeFro/m44X
         MtWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780610820; x=1781215620; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdN21+rhpt+lM5nzU0xa7FNqFa7rofAagsiBs/rDCns=;
        b=oNt2XU3OOkzHPndAQcBzLSm5nlPtUuAEKOfN/96UbpPrnHXM81V2mtqqW67Rvm3+Tj
         RqZb6eGMwoUKWqhHbhI29LUI3gSak1Cx41/5/CFIPHm4EkBA79KSBL8zj3HFOYhRv/y/
         dkZwJ+XJglX5nvWPzwkGlKjlU3nLdPL1Qas5lV0YYqa5yc9wExMB6qXRcYOFOghf0R9/
         3f7qcQtE3t5Alw+28kj/6uVMXq4OLYCc+ocB20lan8AJ7B46XhP2Ii+J+o881yS821M6
         //vJqzR2Di2XV5Ql7ZY3G4F0LuB0v9tITDnOp8YghidbdAVfNAWra7yOby591ZnNQBYO
         xlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780610820; x=1781215620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FdN21+rhpt+lM5nzU0xa7FNqFa7rofAagsiBs/rDCns=;
        b=GJ144fv3cZewHuPT2/+uVN0b2xYzDRi3ZBqXId3QxpT2gre+oE5wbkcLjomkO1Le9N
         UasoVlq74bSOkF4lA6VDcP/jpYG4IeH8feM9JcZky9Yg5qJNQCZEBsvzdm/2vZatUDT/
         Zaq/GKi7wDgcw7t9MJGjhcZkEYoLaDaRI8g2UG03n9ak9+Br4zjrJ+h/El9Y/ssNHFMr
         A1MOcwHPt5BIvPhFRrQCysR6S0zvqsM0cU1PqYmsap2Ie4x3BbA/eDXtg9bObUxG9JMz
         EwJ/uzcaB/uvQU5YoXkOIKWNtt19zDgqw5YNj2muZvsU4P+0a/FhAfYHFZfyro6bFn+B
         /o1w==
X-Forwarded-Encrypted: i=1; AFNElJ85rBJ/478hUdF0/PF2DzaJV17lGpqYEIoQsgDK185kEw28ynIIuO8enMYcO1KsTsIxySlIvpr1+GI+@lists.linux.dev
X-Gm-Message-State: AOJu0YxpQbrrnaiiQ15oKnD9n0bHscwL/YNGNbiZMFxygr6oif6tB0gD
	HYi9RC49g4HSfMnS1oSA8FYPOm0fxWuDQmz4BwMOteeX5ReVZfKGiDrNqe1coymDFlGHPDXOvAH
	cqXjL8yjgXFJB5lez5Vjsm5+fsCkkBzQ=
X-Gm-Gg: Acq92OFl053YP2N5WID7fpwsx2Jazy/tvpSWM4S5n65U+0sjHrkSzmwUgD3sgRbAA+L
	AouG/xF9NmyouKdpsCt/dzizsXiWWFn8oDu82xEfasE9hDFFX7SJd6jHQBRXCLnzMNTgZg5U/BO
	mkym3JaSkg2U5nc2eAmwMSyzNIbIgfyoXSvP1iBpV5p4Ch3FOsEBcKoqDU7Jvuan+veShjy4aG7
	qKUXSR0UZC6cJTj972cPST2GniujIRwJJ/UkgiA3A5FNbiRJW8WyT63KD/uaoAnTyQZB3CqeVNY
	XFb5gex2Mgyo1u0z
X-Received: by 2002:a05:6000:1144:b0:43d:7e34:889c with SMTP id
 ffacd0b85a97d-46030767345mr831474f8f.39.1780610819622; Thu, 04 Jun 2026
 15:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com>
 <aeb9c03a-0330-4e41-ad33-b884f00691a0@bsbernd.com> <CAJnrk1YPeeCSsQFjaFNROYcOdBO-kTovOTDkCigNKRt57JREJQ@mail.gmail.com>
 <6ecc45f5-4bce-4af2-bfe4-36c69e624b01@bsbernd.com> <CAJnrk1aS=3KwZ3LpiqcK=gKsj7oru-k-1Xpe2j5puDdmn+hjUA@mail.gmail.com>
In-Reply-To: <CAJnrk1aS=3KwZ3LpiqcK=gKsj7oru-k-1Xpe2j5puDdmn+hjUA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 4 Jun 2026 15:06:47 -0700
X-Gm-Features: AVVi8CcIb_AYJSImF0b7Cpg5nU7hd5PHs4qvZHVnUTAGug7FtlRYLVrT1Ferxpc
Message-ID: <CAJnrk1aacCbOWWWvW2xnQZ0a954-4shXdyO9LBn_Fv_dyUAWnw@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 3:37=E2=80=AFPM Joanne Koong <joannelkoong@gmail.com=
> wrote:
>
> On Mon, Jun 1, 2026 at 1:53=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com>=
 wrote:
> >
> > On 6/1/26 22:19, Joanne Koong wrote:
> > > On Fri, May 29, 2026 at 2:27=E2=80=AFPM Bernd Schubert <bernd@bsbernd=
.com> wrote:
> > >>
> > >>
> > >>
> > >> On 5/29/26 18:32, Joanne Koong wrote:
> > >>> On Fri, May 22, 2026 at 1:59=E2=80=AFPM Joanne Koong <joannelkoong@=
gmail.com> wrote:
> > >>>>
> > >>>> This series adds buffer pools (implemented internally as a buffer =
ring) and
> > >>>> zero-copy to fuse io-uring.
> > >>>>
> > >>>> Prior to this series, ents and buffers are tightly coupled where e=
ach entry
> > >>>> has its own dedicated payload buffer, requiring N buffers for N en=
tries where
> > >>>> each buffer must be large enough to accomodate the maximum payload=
 size. This
> > >>>> is suboptimal as most request types require vastly less bytes than=
 the maximum
> > >>>> payload size and some requests do not require payload buffers at a=
ll.
> > >>>>
> > >>>> This series allows servers to pass in a buffer pool (internally ma=
naged as a
> > >>>> buffer ring) that the kernel will use for servicing ents/requests.=
 This
> > >>>> decoupling reduces the memory usage requirements needed to use fus=
e-io-uring.
> > >>>> It allows for future optimizations such as incremental buffer cons=
umption and
> > >>>> supporting multiple buffer sizes per ring.
> > >>>>
> > >>>> This series also allows servers to use io-uring registered buffers=
 as the
> > >>>> buffer pool which eliminates the overhead of pinning/unpinning use=
r pages and
> > >>>> translating virtual addreses per i/o request.
> > >>>>
> > >>>> This series additionally adds zero copy to fuse io-uring. The serv=
er can
> > >>>> directly access client pages or page cache folios without copying =
data through
> > >>>> an intermediary buffer. This requires CAP_SYS_ADMIN privileges and=
 using
> > >>>> registered buffers.
> > >>>>
> > >>>> This series has a dependency on io-uring registered bvec buffers c=
hanges
> > >>>> in [1].
> > >>>>
> > >>>> The throughput improvements from registered buffers and zero-copy =
depends on
> > >>>> how much of the server's per-request latency is spent on data copy=
ing vs
> > >>>> backing I/O. When backing I/O dominates, the saved memcpy is a neg=
ligible
> > >>>> fraction of overall latency. Please also note that for the server =
to
> > >>>> read/write into the zero-copied pages, the read/write must go thro=
ugh io-uring
> > >>>> as an IORING_OP_READ_FIXED / IORING_OP_WRITE_FIXED operation. If t=
he
> > >>>> server's backing I/O is instantaneous (eg served from cache), the
> > >>>> overhead of the additional io_uring operation may negate the savin=
gs
> > >>>> from eliminating the memcpy.
> > >>>>
> > >>>> In benchmarks using passthrough_hp on a high-performance NVMe-back=
ed
> > >>>> system, using registered buffers showed around a 10% throughput im=
provement
> > >>>> for direct randreads (~2150 MiB/s to ~2400 MiB/s), a 4% improvemen=
t for direct
> > >>>> sequential reads (~2510 MiB/s to ~2620 MiB/s), a 8% improvement fo=
r buffered
> > >>>> randreads (~2100 MiB/s to ~2280 MiB/s), and a 6% improvement for b=
uffered
> > >>>> sequential reads (~2500 MiB/s to ~2670 MiB/s).
> > >>>>
> > >>>> Zero-copy showed around a 35% throughput improvement for direct
> > >>>> randreads (~2150 MiB/s to ~2900 MiB/s), a 15% improvement for dire=
ct
> > >>>> sequential reads (~2510 MiB/s to ~2900 MiB/s), a 15% improvement f=
or
> > >>>> buffered randreads (~2100 MiB/s to ~2470 MiB/s), and a 10% improve=
ment
> > >>>> for buffered sequential reads (~2500 MiB/s to ~2750 MiB/s). I didn=
't see
> > >>>> enough of a clear improvement for writes due to write latency bein=
g I/O
> > >>>> dominated.
> > >>>>
> > >>>> The benchmarks were run using:
> > >>>>   fio --name=3Dtest_run --ioengine=3Dsync --rw=3Drand{read,write} =
--bs=3D1M
> > >>>>   --size=3D1G --numjobs=3D2 --ramp_time=3D30 --group_reporting=3D1
> > >>>>
> > >>>> The libfuse changes can be found in [2]. To test the server, run:
> > >>>> sudo ~/libfuse/build/example/passthrough_hp ~/src ~/mounts/tmp
> > >>>> --nopassthrough -o io_uring_zero_copy -o io_uring_q_depth=3D8
> > >>>> Once this series is merged, the libfuse changes will be tidied up =
and
> > >>>> submitted upstream.
> > >>>>
> > >>>> Thanks,
> > >>>> Joanne
> > >>>>
> > >>>> [1] https://lore.kernel.org/io-uring/20260402160929.2749744-1-joan=
nelkoong@gmail.com/T/#t
> > >>>> [2] https://github.com/joannekoong/libfuse/commits/zero_copy_v3/
> > >>>>
> > >>>
> > >>> Miklos,
> > >>>
> > >>> This series has stalled on an architectural question and I'd
> > >>> appreciate your input on the direction.
> > >>>
> > >>> Background:
> > >>> In fuse io-uring, entries are reusable communication slots between =
the
> > >>> kernel and the daemon. When a request needs to be sent from the ker=
nel
> > >>> to the daemon, it is assigned to an available entry. The entry carr=
ies
> > >>> the request to userspace, and the response comes back through the s=
ame
> > >>> entry. The number of entries determines how many requests can be
> > >>> serviced concurrently. Currently, when the daemon registers an entr=
y
> > >>> during fuse io-uring setup, it passes in a payload buffer (sized to
> > >>> the maximum payload, typically 1 MiB) alongside it. The buffer is t=
ied
> > >>> to the entry for the lifetime of the connection.
> > >>>
> > >>> Problem that needs to be solved:
> > >>> Most request types (lookup, getattr, open, etc) require far less th=
an
> > >>> the maximum payload size, and some (flush, fsync, etc) require no
> > >>> payload buffer at all. Every entry reserves a full 1 MiB buffer
> > >>> regardless of actual need. On systems with many entries, this memor=
y
> > >>> cost scales linearly - for example, 64 entries across 8 queues
> > >>> requires 512 MiB of payload buffers alone.
> > >>>
> > >>> Approach A:
> > >>> Decouple entries from payload buffers. Entries become generic - any
> > >>> entry can use any buffer from the pool. At setup time, the daemon
> > >>> passes in a contiguous pool of memory, and the kernel dynamically
> > >>> selects and recycles buffers from this pool as entries are assigned
> > >>> requests. Entries servicing requests with no payloads consume no
> > >>> buffer, and the pool can have fewer buffers than entries. This
> > >>> supports adding multi-size buffers and incremental buffer consumpti=
on
> > >>> (multiple entries using non-overlapping regions of the same buffer
> > >>> concurrently) as optimizations in the future.
> > >>>
> > >>> Approach B:
> > >>> Keep the 1:1 entry-buffer coupling, but allow entries to be registe=
red
> > >>> with different payload buffer sizes at setup time. The daemon would
> > >>> register entries with smaller buffers for metadata-heavy workloads =
and
> > >>> larger buffers for data-heavy ones. This keeps the existing model o=
f
> > >>> passing in a payload buffer during entry registration at setup time
> > >>> and requires no uapi additions. Each entry registration adds buffer
> > >>> capacity whereas with buffer pools, buffer capacity would have to b=
e
> > >>> added as a separate pool.
> > >>>
> > >>> I want to make sure I'm representing both approaches fairly - Bernd=
,
> > >>> please correct anything I've gotten wrong.
> > >>
> > >> I think for B "at setup time" is not entirely correct - buffers in t=
he
> > >> current model buffers and entries can be registered at run time.
> > >>
> > >>
> > >> I have been thinking about approach C, which I think is in between A=
 and B.
> > >> I my mind approach C does the registration per entry, but payload
> > >> buffers get added to a buf array, if a payload is set.
> > >> Max array size would be negotiated as in your approach or maybe bett=
er
> > >> with a config SQE. Different IO size could achieved by multiple buf =
arrays.
> > >
> > > Ok, so it looks like we agree that entries should be decoupled from
> > > buffers. Now it looks like the remaining disagreement is how the
> > > buffers get passed in.
> >
> > Well let's say, I don't see what speaks against decoupling it. The
> > memory saving effect is due to the special form of different request
> > sizes (0 and max payload).
> >
> > >
> > > I still think it's simpler and cleaner to pass in the buffers as a
> > > contiguous pool upfront instead of passing in each buffer
> > > individually.
> >
> > My issue with this approach is still the same, incrementally registerin=
g
> > memory when one needs it is hard. Example, I have a few external SSDs
> > that are connected most of the time, but I only need them every few
> > days. Why would I need to spend memory for the fuse transport all the
> > time? The ideal situation would be: libfuse detects heavy usage and
> > registers more entries and buffers.
> > Current fuse kernel supports it. I just didn't get to it to implement
> > dynamic registration in libfuse yet - a matter of time.
> > Missing is some form of kernel unregister, although easy to add, if
> > unregister is treated as request OP.
> >
> > With a contiguous buffer pool I wouldn't know how to register on demand
> > and unregistering is even harder.
>
> For the scenario you mentioned above, you could register/unregister a
> buffer pool within one queue or alternatively, register/unregister a
> new queue, depending on the workload. I think the details can be
> worked out once we agree on the core design, but I don't think it
> would be more complicated with contiguous buffer pools.
>
> >
> > Also, if we still have races during register phase, doing it on demand
> > wouldn't change anything in the current scheme - either the race is
> > there or it is not, because current scheme is dynamic registration from
> > kernel point of view.
> >
> >
> > No we need to keep that old scheme one way or the other, but we could
> > deprecate one form and avoid adding new features (like different buffer
> > sizes). However, if buffer pools have a limited usability, once needs t=
o
> > do those features for both approaches.
> >
> > >
> > > Miklos, what are your thoughts?
> >
> > Just a short reminder that it was actually Miklos to request the dynami=
c
> > registration way. Initially it was all static, taken from the ublk tag
> > model. Making it dynamic added some headache, but in the end I also
> > noticed that it can be useful.
>
> I wasn't there when that conversation happened a few years ago, so I'm
> not sure if Miklos's stance still pertains here where ents are
> decoupled from buffers. I think we need Miklos to clarify this for us.
>
> Thanks,
> Joanne
>

Miklos,

With entries decoupled from buffers, the remaining question is how
buffers should be passed in:

Contiguously: daemon passes in a contiguous pool upfront
Per-buffer: daemon passes buffers in individually

In my opinion, passing in the buffers contiguously as a pool leads to
simpler and cleaner logic at the fuse, io-uring, and userspace layers.
If a daemon wants to dynamically add/remove buffer capacity in the
future, they can add/remove another buffer pool or another ring,
depending on their workload.

From Bernd's perspective, passing in each buffer individually allows
daemons who want to dynamically add/remove buffer capacity in the
future to add/remove capacity one buffer at a time based on load
instead of needing to commit upfront to adding/removing a pool.

Could you please share your preference? This series is targeting the
quickly approaching 7.2 merge window.

Thanks,
Joanne

> >
> >
> > Thanks,
> > Bernd
> >
> >
