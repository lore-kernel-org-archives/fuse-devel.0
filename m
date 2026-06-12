Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7AD376A1A
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 21:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298403; cv=none; b=RiUqZCHc+LtyI36sBYAlkLcVZWnfPAwfoKhzsx3IIMonSBzXk0EXj3zIX2Cc2gpdjefPrww2bxwZgU/MQQdSO6Ebq9u9y6hIwNUfQoead7ZsCMcqLrqzxD9EJmVqe/nTwEXLBpxwHAMlo9gJ5QmRpYkWYoELzbkS68OW77HDDOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298403; c=relaxed/simple;
	bh=2R3WtgowZw29taWmAuR6buBOZ+phD8il7/Ct4RiLq1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BL57dWsZZpPg7zaB91/0N0WNQvk3k+gjLyVEaTSbF0D3ueur/eesLvoHhWbjvuZ84BEhEQIaCvIDhS/Z785MQ9aHQ9jo7CN4/dR5xOu6loyZyc/9gEa+V6l038unJEwp0MB1iY/cnqIHUDIn5yzR9a/uewrIKoxEVAz8NFWmwyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RavtbbJX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RavtbbJX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf20f6be6bso11115695ad.3
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 14:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781298401; x=1781903201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w46ouC+qzeXHc6Pci4y4aabO/bskcbOrr7pNQDkllns=;
        b=RavtbbJXwew2O9pyUvZF9umtM3qIVAIMMWJtVJF9povPeYPAWbXWpNNNEO4x8XvcX7
         hAz+0kmymjRqZL1PIThvRe+Bqc2yxToD5cnRlRF46xG2TziU/HrrubY4v9OAuwBcU1Ya
         TmSkK+8vhNLAFsIR02xHKCcaeLkRGrvp5Q0Rxk4Wqn/nDnwbkGfK5xMnMvahDBgHxBKS
         pqS0Nj3kOZrjQNmMTeQDXzQBXMr+XTTvhcoBdl0ev+jEjWxkntCchrLEDNobMtmS9C3h
         lpHtUBBO0TbIRDbcOK43xBnpkMF8ZC6TIkwalXU8dkraCAN5i57zf6o9ekMr7BS556HK
         5snA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781298401; x=1781903201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w46ouC+qzeXHc6Pci4y4aabO/bskcbOrr7pNQDkllns=;
        b=DlPqEcpTmYDFEYTV271WimNgBVIJ/lw4wQPKlPVt4Q113F3c2/rKmjT9B6wfW3NfcW
         VjSvVrUZxbY2e1zUB4v0v/3XKSHrs7bGluxiwrNRHvDAimqiwef+N8tf73TymwZ2XECK
         eRQJ/tRco6eHzT2FnV0oQASGMDzafNERjKcMIz9EMoYDA8uxn+Trr6P8xMR0AVIoMSAW
         HtMeKdXps+0vnMHq9qUiw3cxT7XsPSkY9+ztKcaOi16yChHvllv2HqIzC8Uz2wGHlwy7
         1Uj97bCWLlNuM5C7GRo8Q8YqVF9B/PlSJgHGv7SJ2KKN/1/iy/vgmzMkpVZLgZph3Q+D
         fKGA==
X-Gm-Message-State: AOJu0YxXYNBF3WohVCqL8QUr/d0LFmc2tvbLs1ktMhP1LpHVygVM/FRy
	G0Yqx0vMatq1DI15XV8qcMZ1GbQasN1mjRfkjNpDZEgS2FPZScIJjKtaM8Yzqg==
X-Gm-Gg: Acq92OHvSr24L/uhqDnrYhuQQnmV6JPJURRb+1gX1Yq5rI1MYIaUNgqhu7vdElTY0oL
	TIYTWnm7lt8VklSwmTQkOlGx7jy/pvsM6MR2oSK1TGdu29fn8A3GA9cxNef6HmtIHMx3CvxL2dt
	W7eCUGvniAvV760vsQoJqJHuqtrPS91PYSHTj609Y2XO4HsbWP1od3Me8bnXBwSSuIq8iuDwjKN
	QsAicQepBdVAwDtHhjQL9dUTGWqszUNPS5DaqSmKqphCzpoD+8RJdL2AYyPN8KeTGqRPVDpCsbI
	cLSfelONm9hEw3SFJrnJOkgeSOSKWoR0wOa0yyKbsvK0SCAqmG8G6gn7lf5SO3o7eumZKEQhS16
	J/Ap6GtnqFxVVGTtNjZxXAhmiH6zAyku7Rip5/1aINJhPq7/wg0Af65o0AgGhpIPXJ1AyDDkGdx
	yg58vUnN/MssZR1y0svr+sSMT4ErJAJUQmIjU5IIx9UriJSsbnLVc2+fAQ2FCLPWRSDNGQ4gIfY
	w0=
X-Received: by 2002:a17:903:234b:b0:2bf:bd17:90d4 with SMTP id d9443c01a7336-2c411d79937mr52213845ad.28.1781298401175;
        Fri, 12 Jun 2026 14:06:41 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5d::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb5411sm30271685ad.32.2026.06.12.14.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 14:06:39 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	axboe@kernel.dk,
	jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	bernd@bsbernd.com
Subject: [PATCH v4 00/10] fuse: add io-uring buffer pools and zero-copy 
Date: Fri, 12 Jun 2026 14:05:03 -0700
Message-ID: <20260612210513.1516038-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds buffer pools (implemented internally as a buffer ring) and
zero-copy to fuse io-uring.

Prior to this series, ents and buffers are tightly coupled where each entry
has its own dedicated payload buffer, requiring N buffers for N entries where
each buffer must be large enough to accomodate the maximum payload size. This
is suboptimal as most request types require vastly less bytes than the maximum
payload size and some requests do not require payload buffers at all.

This series allows servers to pass in a buffer pool (internally managed as a
buffer ring) that the kernel will use for servicing ents/requests. This
decoupling reduces the memory usage requirements needed to use fuse-io-uring.
It allows for future optimizations such as incremental buffer consumption and
supporting multiple buffer sizes per ring.

This series also allows servers to use io-uring registered buffers as the
buffer pool which eliminates the overhead of pinning/unpinning user pages and
translating virtual addreses per i/o request.

This series additionally adds zero copy to fuse io-uring. The server can
directly access client pages or page cache folios without copying data through
an intermediary buffer. This requires CAP_SYS_ADMIN privileges and using
registered buffers. Zero copy (patch 9) has a dependency on io-uring registered
bvec changes in [1].

This series is on top of commit f21c8b1a3b740 in for-next.

The throughput improvements from registered buffers and zero-copy depends on
how much of the server's per-request latency is spent on data copying vs
backing I/O. When backing I/O dominates, the saved memcpy is a negligible
fraction of overall latency. Please also note that for the server to
read/write into the zero-copied pages, the read/write must go through io-uring
as an IORING_OP_READ_FIXED / IORING_OP_WRITE_FIXED operation. If the
server's backing I/O is instantaneous (eg served from cache), the
overhead of the additional io_uring operation may negate the savings
from eliminating the memcpy.

In benchmarks using passthrough_hp on a high-performance NVMe-backed
system, using registered buffers showed around a 10% throughput improvement
for direct randreads (~2150 MiB/s to ~2400 MiB/s), a 4% improvement for direct
sequential reads (~2510 MiB/s to ~2620 MiB/s), a 8% improvement for buffered
randreads (~2100 MiB/s to ~2280 MiB/s), and a 6% improvement for buffered
sequential reads (~2500 MiB/s to ~2670 MiB/s).

Zero-copy showed around a 35% throughput improvement for direct
randreads (~2150 MiB/s to ~2900 MiB/s), a 15% improvement for direct
sequential reads (~2510 MiB/s to ~2900 MiB/s), a 15% improvement for
buffered randreads (~2100 MiB/s to ~2470 MiB/s), and a 10% improvement
for buffered sequential reads (~2500 MiB/s to ~2750 MiB/s). I didn't see
enough of a clear improvement for writes due to write latency being I/O
dominated.

The benchmarks were run using:
  fio --name=test_run --ioengine=sync --rw=rand{read,write} --bs=1M
  --size=1G --numjobs=2 --ramp_time=30 --group_reporting=1

The libfuse changes can be found in [2]. To test the server, run:
sudo ~/libfuse/build/example/passthrough_hp ~/src ~/mounts/tmp
--nopassthrough -o io_uring_zero_copy -o io_uring_q_depth=8
Once this series is merged, the libfuse changes will be tidied up and
submitted upstream.

Thanks,
Joanne 

[1] https://lore.kernel.org/io-uring/20260612184840.4058966-1-joannelkoong@gmail.com/T/#t
[2] https://github.com/joannekoong/libfuse/commits/zero_copy_v4/

Changelog
---------
v3: https://lore.kernel.org/fuse-devel/20260522205823.1597313-1-joannelkoong@gmail.com/
v3 -> v4:
* Add reviewed-bys
* Fix documentation typo, add paragraph about aborts to zero-copy commit
  message, undo unnecessary padding[6] change, add FUSE_HAS_URING_BUFPOOL
  advertisement

v2: https://lore.kernel.org/linux-fsdevel/20260402162840.2989717-1-joannelkoong@gmail.com/
v2 -> v3:
* Rework the uapis to be more ergonomic. Use io-uring registered buffers
  infrastructure instead of doing pinning logic in fuse. Get rid of header
  pinning as that makes no real perf difference
* Rename from "buffer ring" to buffer pool. Logic is the same, just different
  naming

v1:
https://lore.kernel.org/linux-fsdevel/20260324224532.3733468-1-joannelkoong@gmail.com/
v1 -> v2:
* Drop kernel managed buffers from io-uring infrastructure and move it to fuse
* Add visual diagrams and more documentatoin to commit messages and
  documentation patch

Joanne Koong (10):
  fuse: separate next request fetching from sending logic
  fuse: refactor io-uring header copying to ring
  fuse: refactor io-uring header copying from ring
  fuse: use enum types for header copying
  fuse: refactor setting up copy state for payload copying
  fuse: use named constants for io-uring iovec indices
  fuse: add io-uring buffer pools (implemented as buffer ring)
  fuse: support registered buffers as buffer pools in io-uring
  fuse: add zero-copy over io-uring
  docs: fuse: add io-uring buffer pool and zero-copy documentation

 .../filesystems/fuse/fuse-io-uring.rst        | 194 +++++
 fs/fuse/dev.c                                 |   7 +-
 fs/fuse/dev_uring.c                           | 759 ++++++++++++++----
 fs/fuse/dev_uring_i.h                         |  39 +-
 fs/fuse/fuse_dev_i.h                          |   1 +
 fs/fuse/inode.c                               |   2 +-
 include/uapi/linux/fuse.h                     |  40 +-
 7 files changed, 874 insertions(+), 168 deletions(-)

-- 
2.52.0

