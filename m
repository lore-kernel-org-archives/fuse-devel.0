Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5951A26D4CA
	for <fuse-devel@lists.linux.dev>; Mon,  1 Jun 2026 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780353442; cv=pass; b=Olpqyg/KgIYT0uVWoHmHiOmz0EpgbJNWmVDUJoRhQezkpXdq3N0i8II59h1BVm3QUVGTbnwSZgFKhbvvgKS0yB3U0xUKVm1qlRJR0mNNnrFztUnm+g6mUGA3o7gpcuonaNb9xyQ4lxIsFINMXFqSsGYx+z6n7daFAVwBcoOC2Gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780353442; c=relaxed/simple;
	bh=FlS4vHbzB3svbHtLlhYtYk3GdOjb8vCaWCeL851q9Bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CI4Uot5u2Vev6MqS5+TGaXOTZSPMw69dTFu7hffCIfAf6B1hmrAfGGruDQgMPsb+/kO2kgxxDrEVo7i2amTL00ee7Tdzcnbb1BtGrPSvhWFqA+QWBt+8zwdUTI0bJjHWD+TBb7108FCrBfM91YHv8jfRQr8EgvDagIoFIAirSYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itF+2vwD; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itF+2vwD"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45efa80e0afso1838714f8f.2
        for <fuse-devel@lists.linux.dev>; Mon, 01 Jun 2026 15:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780353439; cv=none;
        d=google.com; s=arc-20240605;
        b=MTtoN9eXss/HU6c2zFrzUaO7xB9UAXpTAm2kFpEbVIR26+v+SwQvn9ktzzoh/tHMqM
         zohOcXntnCocJuv2WVLiIM0kjp65A16Q3t81seRsSoRDBG5/FDTmJRFxrrMUegYy1xWR
         2fK7Oa2DWfqm/+xxXy39tuTb6utcYJzVsT6ID1QGN3EXjwjGVjBene2C1M1w6VKh1i+V
         cO/jWNt6O11HcSLAHfhsiYmhqXZ2Ii331b+H5VbIGOJxusYJ3etW0cVL20Ae+doM9x+r
         +idd76h2r8Nj4pqbEheZvrrN7KQFS+0azvJwnx+v63K3Ev12W0+pckFveDVPIGIf0ijd
         esxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eg0zY1ItNzKR/oGgt5WUxCziJCY8xz8jH7uuWN2/ouM=;
        fh=vzLW6PPRzngz2JnEEkwd+rD2VqYKcfe34yALzS110Lo=;
        b=Y/sHE6m7nY5ByPzVbOFEbgGrYEr1CxloEZ/kSbHAk0ZNr+PIfT0qRhVDqxsWFRUQG+
         IzbfZRzDGx9IPxrOcbg1HJDTokGTrFw04oS3LS1LjSqo3+WPTnzJ/eu1jORvaxluJdMN
         M4f83ZYjvMKGKzg3YCA/xK18rNZaAQW7CjGffbto+Sj473k5E7aCpEJQVmIuHGMfJnwI
         G1xdMAWMSc3W5hxpLH2+0No+VZ0zNcRuG8tsAIkvlAP/OZd0Hri4QgSPOnDEdfsDaOYO
         coD9KiAXW6344gjal46+LOSgnnGoClcyRjpTKJWhqAEfYPyC7y9/tteMFju0b1MWjyyq
         dYRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780353439; x=1780958239; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eg0zY1ItNzKR/oGgt5WUxCziJCY8xz8jH7uuWN2/ouM=;
        b=itF+2vwDPLMRiuAlUp+swByqA6EwGeK/onQlJVOeOdIcuAnMgvURABAmMvgubGww7h
         rX6WsyoQCVwSthmwDe7L6WeIJ3NoW4nE7erHcd1ItXwGJHRpUrNtzMzrLSkSLTCIb+Qj
         PnqWULPIsqvbi+NSRLPyfRLuBSXaqJL3y9yxepHINiM5LWA3W03cNqvG8bKIaI2XZNsS
         3xT8m4lyoUeqTeTi4cSQephqPg5PsAggp173R8qhRqqqnLl8nSaALmfoxm/E5asBQxtM
         9Ztuy5+Q1U9Xh7mS7+4HV8W+CbxjcxdKczR7A1KP9dmX6l7Lcn7EBxUlM0itMhFjTB/t
         edqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780353439; x=1780958239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eg0zY1ItNzKR/oGgt5WUxCziJCY8xz8jH7uuWN2/ouM=;
        b=sxEdZHXRy7VkgJ8el8ICWHekFP+pLwMCEvhAUV/Pa3pRphmqO7TckfKb8OdJi2vwnC
         XYAJsSgOqV7xxRDAUmHARwYfJhkxKQZxIxOOL3ThqmdnzAxcRtSr+CtyN5AWUqHB21Q9
         N6oWdwYvT5KIfUi+zOwlJVifuAsJmuOj9v8fc4pBra2+gYUH6S12AustkFAGsD+fNU5z
         l6zF9H1cn6Z5lP4pVyOTlNGaUG/CaTKld0bwmy3Y+QR9ZWQXyCYDaA7X8URlc/3vhASY
         99ahpf29nUwgER8v8vFaC/sGeohnDm4E/9bwPyJaGhkMd/b/emDnKaEk9Dn5FVQrcF7Q
         MN4A==
X-Forwarded-Encrypted: i=1; AFNElJ/f6AgT9uH/jjgbD4RswVa8NmubBmb33aZtMRxuPx5uhYMOtIo+XTsPcwSwpteaHmyL48Uockkz7RcN@lists.linux.dev
X-Gm-Message-State: AOJu0YxMizsZv7EfmZ3Bn1MSOnZyWmdapqbfLq2hddxHlXsUkrbk2O8Y
	YzRwgtJG8KC6LSgs9lYOIOPhlwGdT3ktgrEPs9RKqkZSQRw7+agZpcDwwUPLBm9dQMh0lteQwdn
	jFlJjbDe4ibjfIFgjSOR/P2dYtRUgV0w=
X-Gm-Gg: Acq92OEVD3+cl9VA8rg5fjSBXBns7x86LFWSvzpWCLx//K/8rg7lAV1+38q7noPgteB
	AYstfTI/l4mZig7rE6zwat2urs3B7uFnnWsJH2fWIAfRa3F8dYUOxiquqgRa5ypxyQRtWbWNzlI
	LB3V8amqvIJb1hfTCrGx2DXeQQwtzQb/DKp0yO8lUuAyp88FZrmsDVhm1f1ecww/t/IOFtWFkPS
	LIoKc5O6r579b51B0xkO35+QYq+EnFxbvPEqSXtRfSTt7lowFyYpAuX23yX3OtfPaNXB5MLvvD8
	IxwsLWvlSAM9EEdO
X-Received: by 2002:a05:6000:4b19:b0:45f:f142:d56d with SMTP id
 ffacd0b85a97d-45ff142d6e9mr14755529f8f.13.1780353438682; Mon, 01 Jun 2026
 15:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com>
 <aeb9c03a-0330-4e41-ad33-b884f00691a0@bsbernd.com> <CAJnrk1YPeeCSsQFjaFNROYcOdBO-kTovOTDkCigNKRt57JREJQ@mail.gmail.com>
 <6ecc45f5-4bce-4af2-bfe4-36c69e624b01@bsbernd.com>
In-Reply-To: <6ecc45f5-4bce-4af2-bfe4-36c69e624b01@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 1 Jun 2026 15:37:06 -0700
X-Gm-Features: AVHnY4L5MlcZ2WpIPHWm8wLnV_O5hn0ic8BUgRqAiN1RaMSJjjyARqKLpSdyE7c
Message-ID: <CAJnrk1aS=3KwZ3LpiqcK=gKsj7oru-k-1Xpe2j5puDdmn+hjUA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 1:53=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> w=
rote:
>
> On 6/1/26 22:19, Joanne Koong wrote:
> > On Fri, May 29, 2026 at 2:27=E2=80=AFPM Bernd Schubert <bernd@bsbernd.c=
om> wrote:
> >>
> >>
> >>
> >> On 5/29/26 18:32, Joanne Koong wrote:
> >>> On Fri, May 22, 2026 at 1:59=E2=80=AFPM Joanne Koong <joannelkoong@gm=
ail.com> wrote:
> >>>>
> >>>> This series adds buffer pools (implemented internally as a buffer ri=
ng) and
> >>>> zero-copy to fuse io-uring.
> >>>>
> >>>> Prior to this series, ents and buffers are tightly coupled where eac=
h entry
> >>>> has its own dedicated payload buffer, requiring N buffers for N entr=
ies where
> >>>> each buffer must be large enough to accomodate the maximum payload s=
ize. This
> >>>> is suboptimal as most request types require vastly less bytes than t=
he maximum
> >>>> payload size and some requests do not require payload buffers at all=
.
> >>>>
> >>>> This series allows servers to pass in a buffer pool (internally mana=
ged as a
> >>>> buffer ring) that the kernel will use for servicing ents/requests. T=
his
> >>>> decoupling reduces the memory usage requirements needed to use fuse-=
io-uring.
> >>>> It allows for future optimizations such as incremental buffer consum=
ption and
> >>>> supporting multiple buffer sizes per ring.
> >>>>
> >>>> This series also allows servers to use io-uring registered buffers a=
s the
> >>>> buffer pool which eliminates the overhead of pinning/unpinning user =
pages and
> >>>> translating virtual addreses per i/o request.
> >>>>
> >>>> This series additionally adds zero copy to fuse io-uring. The server=
 can
> >>>> directly access client pages or page cache folios without copying da=
ta through
> >>>> an intermediary buffer. This requires CAP_SYS_ADMIN privileges and u=
sing
> >>>> registered buffers.
> >>>>
> >>>> This series has a dependency on io-uring registered bvec buffers cha=
nges
> >>>> in [1].
> >>>>
> >>>> The throughput improvements from registered buffers and zero-copy de=
pends on
> >>>> how much of the server's per-request latency is spent on data copyin=
g vs
> >>>> backing I/O. When backing I/O dominates, the saved memcpy is a negli=
gible
> >>>> fraction of overall latency. Please also note that for the server to
> >>>> read/write into the zero-copied pages, the read/write must go throug=
h io-uring
> >>>> as an IORING_OP_READ_FIXED / IORING_OP_WRITE_FIXED operation. If the
> >>>> server's backing I/O is instantaneous (eg served from cache), the
> >>>> overhead of the additional io_uring operation may negate the savings
> >>>> from eliminating the memcpy.
> >>>>
> >>>> In benchmarks using passthrough_hp on a high-performance NVMe-backed
> >>>> system, using registered buffers showed around a 10% throughput impr=
ovement
> >>>> for direct randreads (~2150 MiB/s to ~2400 MiB/s), a 4% improvement =
for direct
> >>>> sequential reads (~2510 MiB/s to ~2620 MiB/s), a 8% improvement for =
buffered
> >>>> randreads (~2100 MiB/s to ~2280 MiB/s), and a 6% improvement for buf=
fered
> >>>> sequential reads (~2500 MiB/s to ~2670 MiB/s).
> >>>>
> >>>> Zero-copy showed around a 35% throughput improvement for direct
> >>>> randreads (~2150 MiB/s to ~2900 MiB/s), a 15% improvement for direct
> >>>> sequential reads (~2510 MiB/s to ~2900 MiB/s), a 15% improvement for
> >>>> buffered randreads (~2100 MiB/s to ~2470 MiB/s), and a 10% improveme=
nt
> >>>> for buffered sequential reads (~2500 MiB/s to ~2750 MiB/s). I didn't=
 see
> >>>> enough of a clear improvement for writes due to write latency being =
I/O
> >>>> dominated.
> >>>>
> >>>> The benchmarks were run using:
> >>>>   fio --name=3Dtest_run --ioengine=3Dsync --rw=3Drand{read,write} --=
bs=3D1M
> >>>>   --size=3D1G --numjobs=3D2 --ramp_time=3D30 --group_reporting=3D1
> >>>>
> >>>> The libfuse changes can be found in [2]. To test the server, run:
> >>>> sudo ~/libfuse/build/example/passthrough_hp ~/src ~/mounts/tmp
> >>>> --nopassthrough -o io_uring_zero_copy -o io_uring_q_depth=3D8
> >>>> Once this series is merged, the libfuse changes will be tidied up an=
d
> >>>> submitted upstream.
> >>>>
> >>>> Thanks,
> >>>> Joanne
> >>>>
> >>>> [1] https://lore.kernel.org/io-uring/20260402160929.2749744-1-joanne=
lkoong@gmail.com/T/#t
> >>>> [2] https://github.com/joannekoong/libfuse/commits/zero_copy_v3/
> >>>>
> >>>
> >>> Miklos,
> >>>
> >>> This series has stalled on an architectural question and I'd
> >>> appreciate your input on the direction.
> >>>
> >>> Background:
> >>> In fuse io-uring, entries are reusable communication slots between th=
e
> >>> kernel and the daemon. When a request needs to be sent from the kerne=
l
> >>> to the daemon, it is assigned to an available entry. The entry carrie=
s
> >>> the request to userspace, and the response comes back through the sam=
e
> >>> entry. The number of entries determines how many requests can be
> >>> serviced concurrently. Currently, when the daemon registers an entry
> >>> during fuse io-uring setup, it passes in a payload buffer (sized to
> >>> the maximum payload, typically 1 MiB) alongside it. The buffer is tie=
d
> >>> to the entry for the lifetime of the connection.
> >>>
> >>> Problem that needs to be solved:
> >>> Most request types (lookup, getattr, open, etc) require far less than
> >>> the maximum payload size, and some (flush, fsync, etc) require no
> >>> payload buffer at all. Every entry reserves a full 1 MiB buffer
> >>> regardless of actual need. On systems with many entries, this memory
> >>> cost scales linearly - for example, 64 entries across 8 queues
> >>> requires 512 MiB of payload buffers alone.
> >>>
> >>> Approach A:
> >>> Decouple entries from payload buffers. Entries become generic - any
> >>> entry can use any buffer from the pool. At setup time, the daemon
> >>> passes in a contiguous pool of memory, and the kernel dynamically
> >>> selects and recycles buffers from this pool as entries are assigned
> >>> requests. Entries servicing requests with no payloads consume no
> >>> buffer, and the pool can have fewer buffers than entries. This
> >>> supports adding multi-size buffers and incremental buffer consumption
> >>> (multiple entries using non-overlapping regions of the same buffer
> >>> concurrently) as optimizations in the future.
> >>>
> >>> Approach B:
> >>> Keep the 1:1 entry-buffer coupling, but allow entries to be registere=
d
> >>> with different payload buffer sizes at setup time. The daemon would
> >>> register entries with smaller buffers for metadata-heavy workloads an=
d
> >>> larger buffers for data-heavy ones. This keeps the existing model of
> >>> passing in a payload buffer during entry registration at setup time
> >>> and requires no uapi additions. Each entry registration adds buffer
> >>> capacity whereas with buffer pools, buffer capacity would have to be
> >>> added as a separate pool.
> >>>
> >>> I want to make sure I'm representing both approaches fairly - Bernd,
> >>> please correct anything I've gotten wrong.
> >>
> >> I think for B "at setup time" is not entirely correct - buffers in the
> >> current model buffers and entries can be registered at run time.
> >>
> >>
> >> I have been thinking about approach C, which I think is in between A a=
nd B.
> >> I my mind approach C does the registration per entry, but payload
> >> buffers get added to a buf array, if a payload is set.
> >> Max array size would be negotiated as in your approach or maybe better
> >> with a config SQE. Different IO size could achieved by multiple buf ar=
rays.
> >
> > Ok, so it looks like we agree that entries should be decoupled from
> > buffers. Now it looks like the remaining disagreement is how the
> > buffers get passed in.
>
> Well let's say, I don't see what speaks against decoupling it. The
> memory saving effect is due to the special form of different request
> sizes (0 and max payload).
>
> >
> > I still think it's simpler and cleaner to pass in the buffers as a
> > contiguous pool upfront instead of passing in each buffer
> > individually.
>
> My issue with this approach is still the same, incrementally registering
> memory when one needs it is hard. Example, I have a few external SSDs
> that are connected most of the time, but I only need them every few
> days. Why would I need to spend memory for the fuse transport all the
> time? The ideal situation would be: libfuse detects heavy usage and
> registers more entries and buffers.
> Current fuse kernel supports it. I just didn't get to it to implement
> dynamic registration in libfuse yet - a matter of time.
> Missing is some form of kernel unregister, although easy to add, if
> unregister is treated as request OP.
>
> With a contiguous buffer pool I wouldn't know how to register on demand
> and unregistering is even harder.

For the scenario you mentioned above, you could register/unregister a
buffer pool within one queue or alternatively, register/unregister a
new queue, depending on the workload. I think the details can be
worked out once we agree on the core design, but I don't think it
would be more complicated with contiguous buffer pools.

>
> Also, if we still have races during register phase, doing it on demand
> wouldn't change anything in the current scheme - either the race is
> there or it is not, because current scheme is dynamic registration from
> kernel point of view.
>
>
> No we need to keep that old scheme one way or the other, but we could
> deprecate one form and avoid adding new features (like different buffer
> sizes). However, if buffer pools have a limited usability, once needs to
> do those features for both approaches.
>
> >
> > Miklos, what are your thoughts?
>
> Just a short reminder that it was actually Miklos to request the dynamic
> registration way. Initially it was all static, taken from the ublk tag
> model. Making it dynamic added some headache, but in the end I also
> noticed that it can be useful.

I wasn't there when that conversation happened a few years ago, so I'm
not sure if Miklos's stance still pertains here where ents are
decoupled from buffers. I think we need Miklos to clarify this for us.

Thanks,
Joanne

>
>
> Thanks,
> Bernd
>
>
