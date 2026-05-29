Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1B22472AF
	for <fuse-devel@lists.linux.dev>; Fri, 29 May 2026 16:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780072341; cv=pass; b=gqfflrdrz9uQicjnPAWA10F+x7c5Jzsyez9saJEJIH8xUB3fWnScdAxo/jc4XrErp/DF6fAp2P6vwnqP1BHrVI9R/9H6eOxtVzlBfEWHHuofNmFK9WiybC+WqiHZwGTVG4Bf8+jzsiIldY9SAovb2cXSfWPxnZPW6LrzDs0d/ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780072341; c=relaxed/simple;
	bh=cw1ZkZYvcCBffaI56+L2KfWCyG3V3NW22f0uqw96zoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucuEHJAFYObeFM9WrpHI3pmrnoztNN698HMf0ybHVvJy/49LZRXXIFnmNpM9nXMhxvE51DQDWFL2+4OCFTA5HAS5YLUSp0Hon/438ydKL1WIpbrpLY0hXj2632SmiLbBJaXEXNTO/v3inWLtSjbyB4YWnIQScv/MotywvBTO250=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoX88KmC; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoX88KmC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4909e3fa4b2so7421055e9.0
        for <fuse-devel@lists.linux.dev>; Fri, 29 May 2026 09:32:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780072338; cv=none;
        d=google.com; s=arc-20240605;
        b=DY9HiclJ7kLtkpeuBMOzfx3y4/3RfB6X9MKRpV+hlnD2UTEoCkVNP837wamafrLlm3
         HtF+e//B0/aQD6mvPyM08hj6G1XV/AYpbMvJu3BF5OwrXmh+eOaPrvqlBO5ypqR+vMqH
         LkhCFFnkWGneq1wJ5NH00iREJ+p4jh4qiHzINkemW7j71ewx/Ow+verI5G9AJDVGuzST
         I+cWH8NA+QdPcfamJIkPUiLhASXmONt1biUN6RWfvFTfFWKChBjdXfOgNsAXXhrf/5L8
         GHJxy2VZAacl5teWLVXRSzk0pL/Nog/ULjE7NN2d6NOYlaf6Puq3LmBtIkDsX1x7kNe0
         5Iuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0JyGIQ7v2CBKmjwp+ZQ1yBGEAWI/wZl6zwMiezEbC1g=;
        fh=c5jfx3F2e+AgH2XlOUsDzpMFwXqLa0g489XXvNebytQ=;
        b=M+jy545pyoTN+1+5jw4a+IIUmWAxnIhcgQuPpnEft0TAddLM38nqhNnea1pLWkdLzx
         UjR9bAPFa5yT3UgLlufvBmLmRkbd2OsJwWvBqcHPA0ypqbL6CSwED5Aa7kIxxGaOFUgc
         qtZZQWkARUnzDiVepj1/+RBAm1O964zsakdK+C3FNeXLreOMqn1EPGVhYpX/ruupxZ2W
         zm2mhjOJn7FakBsM5+QrSpG+4IxFBV08KZPvSjlSMbap8+thlzAml0+Wdx0F+aR20Hoq
         A1XSr9nR5b7B4uRwwHzAzzXqLY1i8BVZpZfW2S61afU4xxo2snmwTZtHavMqegsXR9nv
         QWoQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780072338; x=1780677138; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JyGIQ7v2CBKmjwp+ZQ1yBGEAWI/wZl6zwMiezEbC1g=;
        b=OoX88KmCGATPoEj0MsdUvHDZTyxKn/vmyeXHfBDmZMCavLAutQu7OqKU8q1n1yNQcI
         7VHkD6ibWLFSElopS2P7cssQ/LTW8QdWN/3zl1MNg5c2muCPRjbBImLqiai126nPgIAz
         L8KIQA3xMgUDthoKxQt1nCAM6fiQv5zK6uzFk86FGBCWOVsi6AcSPA/2C9iBhwjVJeDH
         Q2FJ7vkK+zo3/DOxCzgaYL+khd8bZv9DJtBbCrkZ4rdsvUaADDjlqk9pmjo70jnU42DK
         m+v6TVMmOAjPXnmJd4tZnFC5cO+03PgJn6FzKaIR/UNBdOBARRQtPeFafp1n5usJXRu3
         0hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780072338; x=1780677138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0JyGIQ7v2CBKmjwp+ZQ1yBGEAWI/wZl6zwMiezEbC1g=;
        b=IPQLmHTswKZp9lI6M2fcpl/CJUy9lS7h6NZ8DFmDuM1gtvlIKHKGuKm22OscvRRJeC
         8HyJOnsuamEx5MNBEPb66fDVEbaaaATz9KPAIBt7C9e0WdWbzj+Rebkz58lgV1pP5j1b
         YPkGrnSbNdlzvTzAmr3kbC/cx6buBjCZhY4+BvoKHxCixtL3nUpNZX+nMk/PqauYbifW
         TdXjBBEUCzBcGNH1LtQy/OFN8I4P5+XjIyqLXXHMpgldJTBfGqCTKPnO6wZD2vc9hXQW
         TJbceMdBdHsSv6KAXiMUmD3Glj3P7iFT+gMf1uRm/V5gXlIS1MT2OvjkG0SDw/CWK3/I
         jXUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Bx3qu9+DcjTYxss8T++ntfbLrYwAjOVMrIeWBnzg0qFlAKx+g3nsbQAqI3YUf918fjlHu7vcia7+t@lists.linux.dev
X-Gm-Message-State: AOJu0YzYm6oxUcACjdik1j5UA+1I0zSPZpi2gJ18uOLig6Q4lz85/raM
	vGBQqMZ33kJUCHxA1cq2MOpnGPD6eSc+waMyTlDS032U/xm66gNIHUgif6BSWpAWuokTYwqDGYQ
	ps4edCzYC2BZOxbrUZRB+qEgwukltDtc=
X-Gm-Gg: Acq92OFFhzBsPn0DrgjxxEXZhY4KPzy5yPhCOaiuhPHsjmhHCA3Z3K9Gy8u7fpRIPtF
	cADD4LcLUdCRjeU4+w/PlZUIRbmSMAozKZ3rXLdsu98d2md5xRohZYCndfyOQKYnx3f3CsZ5qJ4
	feSsJC2su5QjYSpR7NZ+D3KSQ3aymTD99YTx2uS+q4BzE29SELhF7KMhnAXiqYqyKC/El8GFOnp
	CHCboc8u85a+OYttWeqrTnJU1QmzbAmmpajtNXqkOuUX4eKJ/v6WZe+WmkZKIjMXvOxPsezdgd2
	qDKgPmKsC5Cewf0n
X-Received: by 2002:a05:600c:12d3:b0:490:5191:6e1a with SMTP id
 5b1f17b1804b1-490a2948f86mr3719455e9.24.1780072337607; Fri, 29 May 2026
 09:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
In-Reply-To: <20260522205823.1597313-1-joannelkoong@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 29 May 2026 09:32:05 -0700
X-Gm-Features: AVHnY4JYw6WYMrpTeaTlEUid1qjn1x7PLmMk78_bjyOR31-b7AbsRQvNmIbo9vA
Message-ID: <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 1:59=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> This series adds buffer pools (implemented internally as a buffer ring) a=
nd
> zero-copy to fuse io-uring.
>
> Prior to this series, ents and buffers are tightly coupled where each ent=
ry
> has its own dedicated payload buffer, requiring N buffers for N entries w=
here
> each buffer must be large enough to accomodate the maximum payload size. =
This
> is suboptimal as most request types require vastly less bytes than the ma=
ximum
> payload size and some requests do not require payload buffers at all.
>
> This series allows servers to pass in a buffer pool (internally managed a=
s a
> buffer ring) that the kernel will use for servicing ents/requests. This
> decoupling reduces the memory usage requirements needed to use fuse-io-ur=
ing.
> It allows for future optimizations such as incremental buffer consumption=
 and
> supporting multiple buffer sizes per ring.
>
> This series also allows servers to use io-uring registered buffers as the
> buffer pool which eliminates the overhead of pinning/unpinning user pages=
 and
> translating virtual addreses per i/o request.
>
> This series additionally adds zero copy to fuse io-uring. The server can
> directly access client pages or page cache folios without copying data th=
rough
> an intermediary buffer. This requires CAP_SYS_ADMIN privileges and using
> registered buffers.
>
> This series has a dependency on io-uring registered bvec buffers changes
> in [1].
>
> The throughput improvements from registered buffers and zero-copy depends=
 on
> how much of the server's per-request latency is spent on data copying vs
> backing I/O. When backing I/O dominates, the saved memcpy is a negligible
> fraction of overall latency. Please also note that for the server to
> read/write into the zero-copied pages, the read/write must go through io-=
uring
> as an IORING_OP_READ_FIXED / IORING_OP_WRITE_FIXED operation. If the
> server's backing I/O is instantaneous (eg served from cache), the
> overhead of the additional io_uring operation may negate the savings
> from eliminating the memcpy.
>
> In benchmarks using passthrough_hp on a high-performance NVMe-backed
> system, using registered buffers showed around a 10% throughput improveme=
nt
> for direct randreads (~2150 MiB/s to ~2400 MiB/s), a 4% improvement for d=
irect
> sequential reads (~2510 MiB/s to ~2620 MiB/s), a 8% improvement for buffe=
red
> randreads (~2100 MiB/s to ~2280 MiB/s), and a 6% improvement for buffered
> sequential reads (~2500 MiB/s to ~2670 MiB/s).
>
> Zero-copy showed around a 35% throughput improvement for direct
> randreads (~2150 MiB/s to ~2900 MiB/s), a 15% improvement for direct
> sequential reads (~2510 MiB/s to ~2900 MiB/s), a 15% improvement for
> buffered randreads (~2100 MiB/s to ~2470 MiB/s), and a 10% improvement
> for buffered sequential reads (~2500 MiB/s to ~2750 MiB/s). I didn't see
> enough of a clear improvement for writes due to write latency being I/O
> dominated.
>
> The benchmarks were run using:
>   fio --name=3Dtest_run --ioengine=3Dsync --rw=3Drand{read,write} --bs=3D=
1M
>   --size=3D1G --numjobs=3D2 --ramp_time=3D30 --group_reporting=3D1
>
> The libfuse changes can be found in [2]. To test the server, run:
> sudo ~/libfuse/build/example/passthrough_hp ~/src ~/mounts/tmp
> --nopassthrough -o io_uring_zero_copy -o io_uring_q_depth=3D8
> Once this series is merged, the libfuse changes will be tidied up and
> submitted upstream.
>
> Thanks,
> Joanne
>
> [1] https://lore.kernel.org/io-uring/20260402160929.2749744-1-joannelkoon=
g@gmail.com/T/#t
> [2] https://github.com/joannekoong/libfuse/commits/zero_copy_v3/
>

Miklos,

This series has stalled on an architectural question and I'd
appreciate your input on the direction.

Background:
In fuse io-uring, entries are reusable communication slots between the
kernel and the daemon. When a request needs to be sent from the kernel
to the daemon, it is assigned to an available entry. The entry carries
the request to userspace, and the response comes back through the same
entry. The number of entries determines how many requests can be
serviced concurrently. Currently, when the daemon registers an entry
during fuse io-uring setup, it passes in a payload buffer (sized to
the maximum payload, typically 1 MiB) alongside it. The buffer is tied
to the entry for the lifetime of the connection.

Problem that needs to be solved:
Most request types (lookup, getattr, open, etc) require far less than
the maximum payload size, and some (flush, fsync, etc) require no
payload buffer at all. Every entry reserves a full 1 MiB buffer
regardless of actual need. On systems with many entries, this memory
cost scales linearly - for example, 64 entries across 8 queues
requires 512 MiB of payload buffers alone.

Approach A:
Decouple entries from payload buffers. Entries become generic - any
entry can use any buffer from the pool. At setup time, the daemon
passes in a contiguous pool of memory, and the kernel dynamically
selects and recycles buffers from this pool as entries are assigned
requests. Entries servicing requests with no payloads consume no
buffer, and the pool can have fewer buffers than entries. This
supports adding multi-size buffers and incremental buffer consumption
(multiple entries using non-overlapping regions of the same buffer
concurrently) as optimizations in the future.

Approach B:
Keep the 1:1 entry-buffer coupling, but allow entries to be registered
with different payload buffer sizes at setup time. The daemon would
register entries with smaller buffers for metadata-heavy workloads and
larger buffers for data-heavy ones. This keeps the existing model of
passing in a payload buffer during entry registration at setup time
and requires no uapi additions. Each entry registration adds buffer
capacity whereas with buffer pools, buffer capacity would have to be
added as a separate pool.

I want to make sure I'm representing both approaches fairly - Bernd,
please correct anything I've gotten wrong.

Miklos, what are your thoughts?

Thanks,
Joanne
