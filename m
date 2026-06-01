Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC892C0F91
	for <fuse-devel@lists.linux.dev>; Mon,  1 Jun 2026 20:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345177; cv=pass; b=bMudA3UWemI9zb4SADV59Il5JHbO1ydc0Mh8Qlbr7aOoOSUF+3YC8+hqnN5GiIG2Px1wl+FwHgSTvJgHDhJwawyr+zisJF1bSaJIXFYM6APDF6ecif5o80aZKZyoBjk6n6Tyi123qqtY0uYiPhWp2Kwd8C+q2ekHq7x4veCSyPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345177; c=relaxed/simple;
	bh=/8PADPJoH3jp0iCik2jN4qRM3x45YVQBXiwRJSFImNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXMC0wf8/vRlka0a59KU7TtI99lZfe4cE/hZ7UlxD3ag76p7JP2SWlJ2TpI7AmRr6K0zqUbcAjL2f3GAa4D7CPxI/LT0p/DTmGZhJFqEtBgFhrxOO8H7WlVKI4H4aqj4cojmv3fchAGsiUoJo3zd1qYQprl8dgxh/AKIgs/XWHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlZO+6/6; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlZO+6/6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so80435645e9.0
        for <fuse-devel@lists.linux.dev>; Mon, 01 Jun 2026 13:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780345174; cv=none;
        d=google.com; s=arc-20240605;
        b=TuThuqBcA9z4CeiY8K0dUOSqyhOMDesY7jntw0NBmOcp4JKoPFf74CZcd8Rd35MQ21
         T6Y/4kxaKXtgJyKpVd7T8e6cbJ1ICELqT13YEreHEFoGyEsckNuRYDrFiMDTUeVShxPC
         nBEMwFdtW1vEWhNwXoXh3BcZeyII2LuFex51Cnqw4dCwCK1OxlbYUO8TcW7diJFawwpF
         y3rNS0ziLPultWOV8KwHeU7Cd6Gz66X2F3z7gumAzAhp3q9YLEV0EX0+jIkWH8KEIZvl
         lOfmmJYXE1v1bdaOuXljMNf94pvdZ0/kHtEZYT4v756Sllk3H8Tg7SBhWQA9OSY9LljP
         clcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TLyvuYbpf9fR0AyvYPk05jP3aHxuPivxQmjmfqbtSw8=;
        fh=M8lBPvMRpTAC4TeztD3gosvNUeftk7G5iYyYeZE6pcs=;
        b=G+HA38PdyPaJFaTrG/TQke6KyjgWc/LA0PGA/Tosyud3XRhpVllitxpwkqzq/GEpUU
         VnhGka4zIFSesRkoW/TPt2m9bUGUWxt+XeH58uoym27RcpVW+U5VR8AKsfaOMavgIv4W
         j6K4pr4WqxPuNxUMXCIGG5wKBqqu4oDV7aUXo5cquxPgLvfoppmXeZF0kNPbNgncEKgf
         UVzjKmqkNocaE55Qw+bhmhBdgU3vBe/ANpwgsTDF1dWni8PgLGqGbSAIV6Nt3hSAbNnD
         Tyi/mVqQi8n6dGGZhVsg8hxGaFuwA6ickULeJaSeSgOO7Gw8ZycDsvqcZHhT+4DYxZW0
         +oWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780345174; x=1780949974; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLyvuYbpf9fR0AyvYPk05jP3aHxuPivxQmjmfqbtSw8=;
        b=YlZO+6/6q3uoiZ6uKZWPvh/35PKZ6SJtENP3qOy6zta2uLjqk20q+0J+g5m8R21qmw
         sE541l022VlIwHz027bavzU+YmqrFSLPqAp31BgTfVAwSoOke5QUuVhJHQvF0MznPCvM
         uGP36FJi4YGsFwfFIBE/zLoVv/V8Kgq8hlAC+cq4Fx83pidIadQKIA/uybT3Ric6CzoT
         X9xgxbnn/fw+OyZnsEAFw3LXPwOi1O1zTdCZoHuKg04ToQ4251ffkraFzEj1Lv7/R8Bt
         4OrJCvbcYofu9+XTQhrCjvWdRItwr2ktP9xSp5RNtlzrQPeRmf45PzgCPkRm67snqP4z
         LCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780345174; x=1780949974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TLyvuYbpf9fR0AyvYPk05jP3aHxuPivxQmjmfqbtSw8=;
        b=kSB95yPYor2I6sF4nO16Rz5AzUlwtq5lzw9xjQ0ERc66lBpBO8jeRnVfERH4hvJw1s
         c1014B8Vz0O95uOaaY1fv16qhY3LaL4YG9FHBk9rdRDFMszPHeFh607FtRx3NF+D8sCu
         pqXci5FIuS41riv5kQo30dmGv5CJIwS0dqXCcbRpdKWv7f3IC2Ot/VW0PC63t9bNRs3C
         6lAdyn9/D06PH8Oak/n60b/fY7eZc9eHd4Dj3oeX8EtkbAOq7yRDIoe00888ITWGPfYi
         mk5YXcBYvsvSYjboIyNxvYG/J69ZE3E4RtOtaeKxBK5t89/WMW9MDxY/vHaNxbEByUPj
         u0BA==
X-Forwarded-Encrypted: i=1; AFNElJ+LeFjrHW3J9OmOGGZ0WtrYf0k0HvLYdbx0E9PZ28h0EeTjX21OcaCIYetH0qRJHM3m1ouuTD2jBgtN@lists.linux.dev
X-Gm-Message-State: AOJu0YxN/TH9liT5/exR3d934O2Z83BR5q3jeStMjbArqTyZ0j7mjgPC
	RYHfqUdsjvpa/Qa5m+uEIy+n/q84OavFkg/Gw01rNPiuAe6DfoHP4XH897SQ7M42sAfA9QE13Ag
	LknZAPejJI6cwpiENfQGOh5ybgQO2c0U=
X-Gm-Gg: Acq92OFBiE1lcYvutPDtxZkzU4QWV8xlITyXQzTbqNNHVGFyIwc5AqRw0etVs9YOXmG
	nQz+ieXDhDmMfMQUsOx9w9djiC/sWKLJZdqjeM9l/FWfwaW4DLmQ0wBvNxVsNMJcKi/PIWuTGjb
	ldUrBo3qSAYf0uL1D72/ugV03Dni6YY1g3PDNtPTe9M4PdTINijiHNZTFDNL5dWVJqsnFr0Ci7a
	REH3g1rhDXswt0kqlfGLnH6emgM38U/EZk6pjYhWmfvSrBwqfvje57pUSIywxBazi1sqZoecYL5
	dPX23Lx+jw4oOUYR
X-Received: by 2002:a05:600c:6287:b0:490:a1a6:6f24 with SMTP id
 5b1f17b1804b1-490a29338a8mr228844215e9.15.1780345174338; Mon, 01 Jun 2026
 13:19:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com> <aeb9c03a-0330-4e41-ad33-b884f00691a0@bsbernd.com>
In-Reply-To: <aeb9c03a-0330-4e41-ad33-b884f00691a0@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 1 Jun 2026 13:19:22 -0700
X-Gm-Features: AVHnY4KUTjoDDiwD8gJ16srnJIBJpfoj95yC8I7JghsTmHlJXtN-tqxis7W9oLI
Message-ID: <CAJnrk1YPeeCSsQFjaFNROYcOdBO-kTovOTDkCigNKRt57JREJQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 2:27=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
>
> On 5/29/26 18:32, Joanne Koong wrote:
> > On Fri, May 22, 2026 at 1:59=E2=80=AFPM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> >>
> >> This series adds buffer pools (implemented internally as a buffer ring=
) and
> >> zero-copy to fuse io-uring.
> >>
> >> Prior to this series, ents and buffers are tightly coupled where each =
entry
> >> has its own dedicated payload buffer, requiring N buffers for N entrie=
s where
> >> each buffer must be large enough to accomodate the maximum payload siz=
e. This
> >> is suboptimal as most request types require vastly less bytes than the=
 maximum
> >> payload size and some requests do not require payload buffers at all.
> >>
> >> This series allows servers to pass in a buffer pool (internally manage=
d as a
> >> buffer ring) that the kernel will use for servicing ents/requests. Thi=
s
> >> decoupling reduces the memory usage requirements needed to use fuse-io=
-uring.
> >> It allows for future optimizations such as incremental buffer consumpt=
ion and
> >> supporting multiple buffer sizes per ring.
> >>
> >> This series also allows servers to use io-uring registered buffers as =
the
> >> buffer pool which eliminates the overhead of pinning/unpinning user pa=
ges and
> >> translating virtual addreses per i/o request.
> >>
> >> This series additionally adds zero copy to fuse io-uring. The server c=
an
> >> directly access client pages or page cache folios without copying data=
 through
> >> an intermediary buffer. This requires CAP_SYS_ADMIN privileges and usi=
ng
> >> registered buffers.
> >>
> >> This series has a dependency on io-uring registered bvec buffers chang=
es
> >> in [1].
> >>
> >> The throughput improvements from registered buffers and zero-copy depe=
nds on
> >> how much of the server's per-request latency is spent on data copying =
vs
> >> backing I/O. When backing I/O dominates, the saved memcpy is a negligi=
ble
> >> fraction of overall latency. Please also note that for the server to
> >> read/write into the zero-copied pages, the read/write must go through =
io-uring
> >> as an IORING_OP_READ_FIXED / IORING_OP_WRITE_FIXED operation. If the
> >> server's backing I/O is instantaneous (eg served from cache), the
> >> overhead of the additional io_uring operation may negate the savings
> >> from eliminating the memcpy.
> >>
> >> In benchmarks using passthrough_hp on a high-performance NVMe-backed
> >> system, using registered buffers showed around a 10% throughput improv=
ement
> >> for direct randreads (~2150 MiB/s to ~2400 MiB/s), a 4% improvement fo=
r direct
> >> sequential reads (~2510 MiB/s to ~2620 MiB/s), a 8% improvement for bu=
ffered
> >> randreads (~2100 MiB/s to ~2280 MiB/s), and a 6% improvement for buffe=
red
> >> sequential reads (~2500 MiB/s to ~2670 MiB/s).
> >>
> >> Zero-copy showed around a 35% throughput improvement for direct
> >> randreads (~2150 MiB/s to ~2900 MiB/s), a 15% improvement for direct
> >> sequential reads (~2510 MiB/s to ~2900 MiB/s), a 15% improvement for
> >> buffered randreads (~2100 MiB/s to ~2470 MiB/s), and a 10% improvement
> >> for buffered sequential reads (~2500 MiB/s to ~2750 MiB/s). I didn't s=
ee
> >> enough of a clear improvement for writes due to write latency being I/=
O
> >> dominated.
> >>
> >> The benchmarks were run using:
> >>   fio --name=3Dtest_run --ioengine=3Dsync --rw=3Drand{read,write} --bs=
=3D1M
> >>   --size=3D1G --numjobs=3D2 --ramp_time=3D30 --group_reporting=3D1
> >>
> >> The libfuse changes can be found in [2]. To test the server, run:
> >> sudo ~/libfuse/build/example/passthrough_hp ~/src ~/mounts/tmp
> >> --nopassthrough -o io_uring_zero_copy -o io_uring_q_depth=3D8
> >> Once this series is merged, the libfuse changes will be tidied up and
> >> submitted upstream.
> >>
> >> Thanks,
> >> Joanne
> >>
> >> [1] https://lore.kernel.org/io-uring/20260402160929.2749744-1-joannelk=
oong@gmail.com/T/#t
> >> [2] https://github.com/joannekoong/libfuse/commits/zero_copy_v3/
> >>
> >
> > Miklos,
> >
> > This series has stalled on an architectural question and I'd
> > appreciate your input on the direction.
> >
> > Background:
> > In fuse io-uring, entries are reusable communication slots between the
> > kernel and the daemon. When a request needs to be sent from the kernel
> > to the daemon, it is assigned to an available entry. The entry carries
> > the request to userspace, and the response comes back through the same
> > entry. The number of entries determines how many requests can be
> > serviced concurrently. Currently, when the daemon registers an entry
> > during fuse io-uring setup, it passes in a payload buffer (sized to
> > the maximum payload, typically 1 MiB) alongside it. The buffer is tied
> > to the entry for the lifetime of the connection.
> >
> > Problem that needs to be solved:
> > Most request types (lookup, getattr, open, etc) require far less than
> > the maximum payload size, and some (flush, fsync, etc) require no
> > payload buffer at all. Every entry reserves a full 1 MiB buffer
> > regardless of actual need. On systems with many entries, this memory
> > cost scales linearly - for example, 64 entries across 8 queues
> > requires 512 MiB of payload buffers alone.
> >
> > Approach A:
> > Decouple entries from payload buffers. Entries become generic - any
> > entry can use any buffer from the pool. At setup time, the daemon
> > passes in a contiguous pool of memory, and the kernel dynamically
> > selects and recycles buffers from this pool as entries are assigned
> > requests. Entries servicing requests with no payloads consume no
> > buffer, and the pool can have fewer buffers than entries. This
> > supports adding multi-size buffers and incremental buffer consumption
> > (multiple entries using non-overlapping regions of the same buffer
> > concurrently) as optimizations in the future.
> >
> > Approach B:
> > Keep the 1:1 entry-buffer coupling, but allow entries to be registered
> > with different payload buffer sizes at setup time. The daemon would
> > register entries with smaller buffers for metadata-heavy workloads and
> > larger buffers for data-heavy ones. This keeps the existing model of
> > passing in a payload buffer during entry registration at setup time
> > and requires no uapi additions. Each entry registration adds buffer
> > capacity whereas with buffer pools, buffer capacity would have to be
> > added as a separate pool.
> >
> > I want to make sure I'm representing both approaches fairly - Bernd,
> > please correct anything I've gotten wrong.
>
> I think for B "at setup time" is not entirely correct - buffers in the
> current model buffers and entries can be registered at run time.
>
>
> I have been thinking about approach C, which I think is in between A and =
B.
> I my mind approach C does the registration per entry, but payload
> buffers get added to a buf array, if a payload is set.
> Max array size would be negotiated as in your approach or maybe better
> with a config SQE. Different IO size could achieved by multiple buf array=
s.

Ok, so it looks like we agree that entries should be decoupled from
buffers. Now it looks like the remaining disagreement is how the
buffers get passed in.

I still think it's simpler and cleaner to pass in the buffers as a
contiguous pool upfront instead of passing in each buffer
individually.

Miklos, what are your thoughts?

Thanks,
Joanne

>
>
> Thanks,
> Bernd
>
