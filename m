Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A858372073
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 20:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779483548; cv=none; b=Bxoddwp4yfnYAJQLohOdfPmvEN0+zlAKw3cWNycF2QDzGsN7enRaD9oYpswrXkLwWdInuaCbbnNmd58QOPTjCoYp+DvnTY5caTYp8dI2mTqAq0ayB3kZCxwM/mCB1EWE1Z3mhx3FgTYKjiOlX/rQDstLcyjk7RzsKm5rixl6xFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779483548; c=relaxed/simple;
	bh=oi10fupileZbhIZ623CXE7iY3dnQ14IPhuKT3F+sdLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c4WQ2m//59wQ0vwt2ZfHFBVuBSABiREtMKCzJyvQ2zK8BNuxut8zYZG0Nt3Yc7orPiONVmu0Fyyn14+wnGIxHk++CeIcG+T8/69essUGWEUnqL054P9eK3m/Hoa99D0+ZyKnzFw5zdLmqp64K8mNoBCX/8LM9WTxRHdxHZGWOzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVkHHCGz; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVkHHCGz"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-65c7efdb7d8so8307887d50.3
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779483546; x=1780088346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JE8Pkah1JX3J6X79wD+ciz3YHGD65D5qONcRw6AmFDk=;
        b=lVkHHCGz2QGdj+EB3l23BhYZN3NTGbbGYnyoG3leqXouLrGWnMkK+lA57HQlrd+3bn
         piioBOjtRyyFNzf7jthlDSaXiHQcWxUgnuzeXcxkF4cADI60fxgWTsGIwri+JFHQUheS
         wDdYLCHV2XyvGLYnxnWmogeFGIDxy8SqlOzXw/Twwjw2Lh3TOq3zQsTUmxvqKOFRZODK
         aGh2TVUPdAooC0E7f+5qyYNFmAsbxn7Og1T20qXF3xwDcOcOqqDpMSv2ndtZDaceZ9Q8
         XDs8Uug/aZfFHIOJAZJsP2b4cwlL1/sUqIeLG95JJezUpWbWF0TC7v0Z6B4KdOz7yVUh
         ApVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779483546; x=1780088346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JE8Pkah1JX3J6X79wD+ciz3YHGD65D5qONcRw6AmFDk=;
        b=GsFxr7tW9KZunHpGEQL62DgLzdFMMOYfdhl+p1Yko6iVY7XKWAvImHjknUCZYs13Cz
         d0buPFMeeDuVBO/rXD7v5DN2mrKPFGMQQRNJyt8asJrsiOSZFmLWkh0OAHWDRWJKKCuV
         hAtc0hXSZAFF3OHIZkhhzMVsVn1we9N8sgCkv2rykyDQNRIO412N74E0wrOCVzbcNh7Y
         tDodv4eQDr3tCavVBiA0LyAQqy+yomhXafPdQpyFJIQMCa30I7odmAIUIaheiOHLsP5A
         ra5EoV4i86fKksKeqNNBnXB0EhhLqYfNJ0iKg2KBDjvVqhtYeE2/sSPAwbEIizO3aZxB
         zmMw==
X-Forwarded-Encrypted: i=1; AFNElJ+lScCmBTJvlLML+gYB9reEVDz++m1ambqiUsEPYQN6obohz3afboRXzBwOyp8AFvUp5YzuOBhNZexP@lists.linux.dev
X-Gm-Message-State: AOJu0YxMCP2un1t/+q94l/EdxaJ4N9OLFZcY/3hYy/+ywKa6OuqW/e2v
	0bK/FgEMbuUcrsD2EZILmOwf+p2vX+STLfWnRAC6ogu00Ni7lZRRp9M5
X-Gm-Gg: Acq92OGbLy5Ymlo7XZ0BSAd3xiPpB/x4GxGEWs/xrGNKos3ogPKjawNn1jrJvJ9oJYw
	cdl+lypBC/TaIPoIbn69rxpsF3FKSvbx38uoHrNck8B82fEswafDyTFGSrUmlZv9efpAvQT+DWg
	cXlBiph1m8+4lRQno0134JHKIGAQ4PEKSnkeNgpiYaG65djIOl0x+5UqdeT8KcomkJaW2YChlmN
	C/po00uf8onUQmbrB3zIfvYoVX/2ngJGatHx3QWy5UmhNlTbkmEJ9NliNtETqn6GCRaw3Vo/Ppa
	giduGnghLtqAVGLS2aesLXzPsirByvycYdOeGV6BiF25nMbZjAnZw8WfOPBuCeVQKubM+LvwDfM
	8IYJuq/Grocm+5WYAymXXM7+Y+0afnyRj4cCB/nEVRe+LSA34FxPVd/1/GevMAoGcN5Cm3Xjfx3
	4HKZIWqoEIkAScdQLS/6GzLsUo/Bbu
X-Received: by 2002:a05:690e:154f:10b0:651:9286:578a with SMTP id 956f58d0204a3-65ec9806cebmr4285783d50.25.1779483546002;
        Fri, 22 May 2026 13:59:06 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4c::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65ecfdf467bsm1218827d50.20.2026.05.22.13.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:59:04 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	jlayton@kernel.org,
	axboe@kernel.dk,
	fuse-devel@lists.linux.dev
Subject: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
Date: Fri, 22 May 2026 13:58:13 -0700
Message-ID: <20260522205823.1597313-1-joannelkoong@gmail.com>
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
registered buffers.

This series has a dependency on io-uring registered bvec buffers changes
in [1].

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

[1] https://lore.kernel.org/io-uring/20260402160929.2749744-1-joannelkoong@gmail.com/T/#t
[2] https://github.com/joannekoong/libfuse/commits/zero_copy_v3/

Changelog
---------
v2: https://lore.kernel.org/linux-fsdevel/20260402162840.2989717-1-joannelkoong@gmail.com/
v2 -> v3:
* Rework the uapis to be more ergonomic. Use io-uring registered buffers
  infrastructure instead of doing pinning logic in fuse. Get rid of header
  pinning as that makes no real perf difference
* Rename from "buffer ring" to buffer pool. Logic is the same, just different
  naming

v1: https://lore.kernel.org/linux-fsdevel/20260324224532.3733468-1-joannelkoong@gmail.com/
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
 fs/fuse/dev_uring.c                           | 753 ++++++++++++++----
 fs/fuse/dev_uring_i.h                         |  43 +-
 fs/fuse/fuse_dev_i.h                          |   1 +
 include/uapi/linux/fuse.h                     |  43 +-
 6 files changed, 876 insertions(+), 165 deletions(-)


base-commit: aec58539941927e8e0d1b74f9e134b0298c1e437
-- 
2.52.0

