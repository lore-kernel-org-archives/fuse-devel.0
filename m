Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2835779CD
	for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 10:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781518889; cv=pass; b=SNV+yu7kPP+vXHhAP1tYLiStqLjpZEpslYdj8XUSmW/IGppfixWwzw91ycRiBtVs8KThtKGvrc5LDUq9rqzjsdUl24xC8xNUcci/8uq10GSTlMLdHR4kvXYeE5JGijsDJfAEywlwtp4R6gFz+W3qJkuACYnu5cy4YVGh3KsbV8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781518889; c=relaxed/simple;
	bh=gj6VpTzj3Iu4CWz2B/G1WIEQUecMQGnqyTc7qNUNoK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGNynOrVX0mDezmVkTVy0kVAc+5Q/Rt0BM4/y1WPBV3V+MnbOIzYRn/PW1M6c1DP6pBK8BOV+uTkjzW9UuT9o8VOKW03CUvq8HCJIj3AFgieB8O1y7BYawbZyiu51r4WNYlye9cOmuwMs7z62vfmUNbgXnF8OL0UDl9OYf8dn6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=T3o3w1/e; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="T3o3w1/e"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5176ca6bab1so36741581cf.0
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 03:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781518887; cv=none;
        d=google.com; s=arc-20240605;
        b=M9GaCjjKWgjO08jF7UzrOpcZ61ps1bRdtq1dDVWMgMJL2LypzMpRPPZIKDDDFwXF8h
         jZlrLqBr36kEStBS+YAm4CxF4Xh7xZWdmWq/bQ7leeYVCGMnyvUAe435pI9ZucaqlxLf
         zX8BUV82RM+RDDAgswhUaKIO791BJzvSqZqA1nvU5R36qGty1ap+tJig3gWpbscLR2Nh
         0ih1HMraNRJXu/KVL9n+0d4aEEhJ/H9HVreJzBrnzvu0KT1ma1XMC6NG/OiI8LcVrgoS
         z6d7FhvcylJ9C1a2v/iau5ZngJCQywHnfBIBlKxkBmfSAkf++1234wnIu9gLsbhy2gks
         8c2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PnEPp0whAlsg5fwF8OX/4vc8M6YKM32auRgmEYA9JtQ=;
        fh=w2Dy9MBCymTAHXuuQoFoyTRhGtZ+o5YcX5Bg6rpudfc=;
        b=Sxf3BkZsuekV8Z8UbTi83m1UJZbXg1d2MZuPg1WOZr/o1T4CJ9iOAKBBCvqJBEkNLA
         ib8lTbKdbyFnKZugSn7+7uppM+VzzcujWdASGmjkNuyTchKU5nf/Nr0kEXUnMlpYzsb9
         0Zh7i4e8ZflzB154zygz4SiDllC+PouL9ILqHsg99FW5fyNA49EVVKL+FmwkXVmYxS8s
         ZA6K/Eif+TizDKiQ2UFqNoU6FEQinORqh7DtE5H+gjjpJs04IU9MW15lAmaB9PZh0t7/
         t+92dE12abvVYqzSM9UQS4WBnPzb9h2zjJ4YNjHfY25R6e8Xoxmj160uHYikNeYBB85J
         Z2Gw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781518887; x=1782123687; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PnEPp0whAlsg5fwF8OX/4vc8M6YKM32auRgmEYA9JtQ=;
        b=T3o3w1/eJxjg2FQz4GRqN6UpCzIcVb98EiN0hisDJbz7dxUu3iiU/k4OBaEIVBKT8O
         hPPQcBGSp3PnEs9m2Pm2s6Fo5HZd9p+5eTMcnSxxwRqhdsp+RvWFOe10/jaoFW508dkJ
         7Zi41nqMrmsP5qrkqty6UHiOc09t7IELKj08c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781518887; x=1782123687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnEPp0whAlsg5fwF8OX/4vc8M6YKM32auRgmEYA9JtQ=;
        b=RMdXkqtXidDwRMV43Bl9RcEyLoZxGYJodHS9l3cQ7Bo/PpFhWgO8cZIhKYd2ojiULM
         PENR6fNia20Zg36U5kfeF/OjerUFvEwOC+AuOb9yLaPe4T5qtGCARNjMdOdp+67g331m
         ayUQpF9OQ6/mSdCAMyy5NxvSOJgGAM3JSZB8IaQePJlAShUjDSmcbD0JQ7UVGZKU381s
         FLx4a6JIsEuXD6b/Q6wEedNGGIwNnqlNFLgYiPKMpyrIG5Cw6ofnagMZKbLSQ/g2xtEa
         2xN5A0kiE+Q0WqC+tCppF6+953Lle60innE0vKbh+XTOjXCj0on8LT65CCtMSFJhe8kR
         9SeQ==
X-Gm-Message-State: AOJu0YwJkhc02k0QL2feKgRCeYPimxAk2qJC3dD5odjM7vl6rya0+B3t
	Fun6dBafh2ImgFcKCV2P903+n2h1s15IKxtTJEtyewLQI+W7u1XrBybwlzs1eK8kbSDYlfS5LSF
	u4+ELOQR5bT06i67EDDmlU0u6ooQwLCsCgFQ25VrGkA==
X-Gm-Gg: Acq92OFQhK8vhqh+IsINslD9hhzpMGMLbXIVtcAknF8FuyB3gaiQhBEJmEEsnqgbdPU
	45P227xqv4/4baOCuw8HdJgyKENdhU6jP/OT8zir9MEui9ScN4IZpD7Qm5g8taoCI0IC++VOoOs
	ggSC6I7onuFQC2G2wkPthUt5SM+E+PuXIF4K2OSXGAQceRRWlKgStzWo6F9o13Idi8/Fw5vQVPr
	VbtBlpAdveCju9GR0GukhD9izpyx0zF0VrHgI62mCNTLMEvo1T98QgaGRPx+3bKZPkjdtpinOfF
	uREqjZGB81HWlV9QYF+NMO2Q4yAIRc775XgSstno
X-Received: by 2002:a05:622a:6181:b0:517:9399:fa83 with SMTP id
 d75a77b69052e-517feeea393mr178445481cf.27.1781518886955; Mon, 15 Jun 2026
 03:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
In-Reply-To: <20260612210513.1516038-1-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 15 Jun 2026 12:21:15 +0200
X-Gm-Features: AVVi8CcssQVES81UTTqqPjsebl86EFww6nlYlrBfQCZHRBL4HWEurOTyNM051Jk
Message-ID: <CAJfpegtZDc6nt5vL+oKeJ9TEkYONxRKXYrSNYm0aE3yFFbpzaQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jun 2026 at 23:06, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> This series adds buffer pools (implemented internally as a buffer ring) and
> zero-copy to fuse io-uring.
>
> Prior to this series, ents and buffers are tightly coupled where each entry
> has its own dedicated payload buffer, requiring N buffers for N entries where
> each buffer must be large enough to accomodate the maximum payload size. This
> is suboptimal as most request types require vastly less bytes than the maximum
> payload size and some requests do not require payload buffers at all.
>
> This series allows servers to pass in a buffer pool (internally managed as a
> buffer ring) that the kernel will use for servicing ents/requests. This
> decoupling reduces the memory usage requirements needed to use fuse-io-uring.
> It allows for future optimizations such as incremental buffer consumption and
> supporting multiple buffer sizes per ring.
>
> This series also allows servers to use io-uring registered buffers as the
> buffer pool which eliminates the overhead of pinning/unpinning user pages and
> translating virtual addreses per i/o request.
>
> This series additionally adds zero copy to fuse io-uring. The server can
> directly access client pages or page cache folios without copying data through
> an intermediary buffer. This requires CAP_SYS_ADMIN privileges and using
> registered buffers. Zero copy (patch 9) has a dependency on io-uring registered
> bvec changes in [1].

Overall I think this series is good, the only part notably lacking is
concise uAPI documentation.

I'd even suggest dropping all internal implementation details from the
documentation that was provided, since adding those details to the
commit messages (which you did) should be sufficient.

Thanks,
Miklos


>
> This series is on top of commit f21c8b1a3b740 in for-next.
>
> The throughput improvements from registered buffers and zero-copy depends on
> how much of the server's per-request latency is spent on data copying vs
> backing I/O. When backing I/O dominates, the saved memcpy is a negligible
> fraction of overall latency. Please also note that for the server to
> read/write into the zero-copied pages, the read/write must go through io-uring
> as an IORING_OP_READ_FIXED / IORING_OP_WRITE_FIXED operation. If the
> server's backing I/O is instantaneous (eg served from cache), the
> overhead of the additional io_uring operation may negate the savings
> from eliminating the memcpy.
>
> In benchmarks using passthrough_hp on a high-performance NVMe-backed
> system, using registered buffers showed around a 10% throughput improvement
> for direct randreads (~2150 MiB/s to ~2400 MiB/s), a 4% improvement for direct
> sequential reads (~2510 MiB/s to ~2620 MiB/s), a 8% improvement for buffered
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
>   fio --name=test_run --ioengine=sync --rw=rand{read,write} --bs=1M
>   --size=1G --numjobs=2 --ramp_time=30 --group_reporting=1
>
> The libfuse changes can be found in [2]. To test the server, run:
> sudo ~/libfuse/build/example/passthrough_hp ~/src ~/mounts/tmp
> --nopassthrough -o io_uring_zero_copy -o io_uring_q_depth=8
> Once this series is merged, the libfuse changes will be tidied up and
> submitted upstream.
>
> Thanks,
> Joanne
>
> [1] https://lore.kernel.org/io-uring/20260612184840.4058966-1-joannelkoong@gmail.com/T/#t
> [2] https://github.com/joannekoong/libfuse/commits/zero_copy_v4/
>
> Changelog
> ---------
> v3: https://lore.kernel.org/fuse-devel/20260522205823.1597313-1-joannelkoong@gmail.com/
> v3 -> v4:
> * Add reviewed-bys
> * Fix documentation typo, add paragraph about aborts to zero-copy commit
>   message, undo unnecessary padding[6] change, add FUSE_HAS_URING_BUFPOOL
>   advertisement
>
> v2: https://lore.kernel.org/linux-fsdevel/20260402162840.2989717-1-joannelkoong@gmail.com/
> v2 -> v3:
> * Rework the uapis to be more ergonomic. Use io-uring registered buffers
>   infrastructure instead of doing pinning logic in fuse. Get rid of header
>   pinning as that makes no real perf difference
> * Rename from "buffer ring" to buffer pool. Logic is the same, just different
>   naming
>
> v1:
> https://lore.kernel.org/linux-fsdevel/20260324224532.3733468-1-joannelkoong@gmail.com/
> v1 -> v2:
> * Drop kernel managed buffers from io-uring infrastructure and move it to fuse
> * Add visual diagrams and more documentatoin to commit messages and
>   documentation patch
>
> Joanne Koong (10):
>   fuse: separate next request fetching from sending logic
>   fuse: refactor io-uring header copying to ring
>   fuse: refactor io-uring header copying from ring
>   fuse: use enum types for header copying
>   fuse: refactor setting up copy state for payload copying
>   fuse: use named constants for io-uring iovec indices
>   fuse: add io-uring buffer pools (implemented as buffer ring)
>   fuse: support registered buffers as buffer pools in io-uring
>   fuse: add zero-copy over io-uring
>   docs: fuse: add io-uring buffer pool and zero-copy documentation
>
>  .../filesystems/fuse/fuse-io-uring.rst        | 194 +++++
>  fs/fuse/dev.c                                 |   7 +-
>  fs/fuse/dev_uring.c                           | 759 ++++++++++++++----
>  fs/fuse/dev_uring_i.h                         |  39 +-
>  fs/fuse/fuse_dev_i.h                          |   1 +
>  fs/fuse/inode.c                               |   2 +-
>  include/uapi/linux/fuse.h                     |  40 +-
>  7 files changed, 874 insertions(+), 168 deletions(-)
>
> --
> 2.52.0
>
