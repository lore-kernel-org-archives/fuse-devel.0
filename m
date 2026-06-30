Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65DE1DDC37
	for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 21:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854209; cv=none; b=QEO/qUvh7lFOHN6Oj5uDPcuIvN8SasTW2aDAxQzMzagqpS6EToIydwUQBRKgX6Z5cU5tod90lXunwgss6HadGQo772DfyNdDbJrXIDWqrJ0TKSkIw4GyyeGH2xAgJDlj0VVtgG1qOfJazyk8B6jqrswgx2Q9Sp0qRRpN9yXlNV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854209; c=relaxed/simple;
	bh=srZhoJGi5hurmVHCz6kvPNOwSvWbs4CHnwq7RDtlBIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ATBB9GcQYtyH3ZX7Ie4PsSrL2j2us92+SWCjeVg/aNYrnTN/vgjq8vax8UIvcyB5CaMj1ZhfszvlSas4HlqEX3fX8bTH1woSYWjzZ/9e+Jefhvq2TyuXMMS3rvs3behNxVmqETNg7hDRrMfXEBKBc0GwEPj9IbrBxVkEs7F+YII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8hh7r13; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8hh7r13"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-69d8f70cb0cso3762164eaf.0
        for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 14:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782854207; x=1783459007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oo6xhvaBTtdsTRxDk9nuaB0fFTRo/VyOIBFU9UzBABI=;
        b=P8hh7r13fe8F2j45OSzCG2QzaK9lDTHALjyF5jYvkkpunFo7wTRL9d6IUEl5bZuAyy
         exeZcXxsYTo0UjX4AXdezrjm6UggxqjYKinddxqx+aLtSB/KN13Fd1BZ+0VNy59S6e6L
         LIJ3XDMLwdzsZHpayzM80BWEFBcR8k/+QYyMJK2ZY/bpOT5eVJO2QHylBIf714yjLutX
         z1vY+UokJtkMBuKpn5+e3vXgdU55T4JI7qADd4VQ5CsKiP06LFnWBSPlseZpcNpwH0y4
         E78VaMHDgbBi+100kllapKlFe/luOAeR0l9Ehs21yhSIGWH2U8B0Tllb7RfniZSjzNAw
         nAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854207; x=1783459007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oo6xhvaBTtdsTRxDk9nuaB0fFTRo/VyOIBFU9UzBABI=;
        b=Fcao+yJZnxQi0BqxaEKR1a5FuTwGRlQS9MTUGAV+KI0eRu1MZhnXhE6iqGEE4KklRa
         eUk6ntihSNqkn8BdH9ssOtwtMKdhsyv72OYSNEBbcKpTvhRz+KDIgymc3BHx9zRvIZCt
         stPgGMe8n5jO8iSRPxg1Fl484z+9JXIqrREKz9t1OA8aA8fSpQ8jzx2vsJl+vURaUuSa
         Dg522D1DQBSdCsgq59Rkz2tMgVVti5vLLAyy9PcDAcGLJ5uYR1g2N3O4RCCYkBZyTWQE
         NYVZh2D/nU0xktqJr5jw12SqYMx9ayVOuLnmyQuVlWi23IdVmbwtOhCh+GvZpNbp196F
         Xvhg==
X-Forwarded-Encrypted: i=1; AFNElJ+sxP6e9/6AFQ2rLyqGsyN/ZczOnSqs6wsTDWG/JXyVpaOnShyZBT/mIqpymPtyZRD7bYTlH7qVxxZ3@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi0U5iu4zlKGfCz9GYvPebWHtIZ4KCRweH8qdOsHehXGaBE5e+
	zzmv9MV+YyZX+2M+PndCWLI1wvzs3D+34M12v6LS4FJW4EOC/KqLZHws
X-Gm-Gg: AfdE7cll5ipgBhYGdz24r1GsaAr5vYsu3brsG+jFsFcFvLq1RzenseOGd4g6AiXB3Xk
	eaMBJhHmcBQ5rD2CWy5BObeJRJ7CWYRJcAyTD+PZkXfbzryJ3NpQZkrlK87llZckbG9ikSZ0jZE
	czYrJsnV1MDudmUYkXE4yBybm3MyTZqg8uafqe5wL229KdgGrhs4+vABqGanIKXxH9fGI7hdo7y
	Wovm4cMDFxUNCFQjRynpm/I5dYql0TtX8mEL+PhY+18xmzj3q7E1J3Ye0yW2EJPyU7qzSaSV63U
	P6b34vOC7Ml4iiQOCl11C8+dr/wiAT2QWKDvSE9qsy9WPZkI4DKW4RYuVCVWVQwiVBYMLeFQgX5
	xnj0HU2Oq8CljCBDX6x671G3WsNTvOSH0xTysRzZVNNQrM78gmn5+D6QBQEbFXiIyazi5CKsC9U
	pgfTF8dmDZ4wa+3TBqJ9H4Q/g0A1yzXfMZFAk3PXyrGFj3jBPCZNW3OUcF168SRC8=
X-Received: by 2002:a05:6820:709c:20b0:6a1:40ad:cfac with SMTP id 006d021491bc7-6a1890f4cefmr2920430eaf.13.1782854206716;
        Tue, 30 Jun 2026 14:16:46 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:6::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a18949b384sm2808970eaf.15.2026.06.30.14.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:16:45 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v5 0/6] fuse: add io-uring buffer pools and zero-copy
Date: Tue, 30 Jun 2026 14:14:29 -0700
Message-ID: <20260630211436.2062816-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds fuse io-uring buffer pools and zero-copy.

Prior to this series, ents and buffers are tightly coupled where each entry
has its own dedicated payload buffer, requiring N buffers for N entries where
each buffer must be large enough to accomodate the maximum payload size. This
is suboptimal as most request types require vastly less bytes than the maximum
payload size and some requests do not require payload buffers at all.

This series allows servers to pass in a buffer pool (a contiguous chunk of
memory) that the kernel will use as it wishes for servicing ents/requests.
This decoupling reduces the memory usage requirements needed to use
fuse-io-uring and lets the kernel do any optimizations for assigning payload 
memory to requests.

This series additionally adds zero copy to fuse io-uring. The server can
directly access client pages or page cache folios without copying data through
an intermediary buffer. This requires CAP_SYS_ADMIN privileges and using
buffer pools. The zero copy patch has a dependency on io-uring registered
bvec changes in [1].

This series is on top of commit 7d87a5a284b with the io-uring bvec changes
applied.

The throughput improvements from registered buffers and zero-copy depends on
how much of the server's per-request latency is spent on data copying vs
backing I/O. When backing I/O dominates, the saved memcpy is a negligible
fraction of overall latency. Please also note that for the server to
read/write into the zero-copied pages, the read/write must go through io-uring
as an IORING_OP_READ_FIXED / IORING_OP_WRITE_FIXED operation.

The throughput improvement from zero-copy depends on how much of the
per-request latency is spent on data copying vs backing I/O. The gain
comes from eliminating the payload-buffer memcpy,  but accessing the
zero-copied pages requires the server to issue the read/write as an
IORING_OP_READ/WRITE_FIXED operation. The benefit is largest when the
mempcy is a meaningful fraction of per-request latency while backing i/o
is still noticable enough that the extra io-uring op's overhead doesn't
dominate.

Benchmarked with passthrough_hp (--nopassthrough, q_depth=8) on a
2-socket Intel Xeon Gold 6138 (40 cores / 80 threads), using fio (sync
engine, bs=1M, O_DIRECT, numjobs=2, 30s run + 10s ramp, 3 runs) where
direct-I/O throughput is against a RAM-backed (tmpfs) source (backing
I/O is not the bottleneck):

		baseline   registered-buf   zero-copy   (zc vs base)
direct read     ~5.1 GB/s  ~5.4 GB/s        ~8.9 GB/s   (+75%)
direct write    ~3.4 GB/s  ~4.8 GB/s        ~5.1 GB/s   (+50%)

On a device-bound NVMe (~2 GB/s reads) the read gain shrinks to ~10-16% (no
measurable gains for writes), as backing I/O rather than the eliminated copy
dominates latency. The benefit overall scales with how much of the per-request
latency is the data copy versus backing I/O.

The benchmark script and results can be found in [2]. The libfuse changes can
be found in [3]. To test the server, run:
sudo ~/libfuse/build/example/passthrough_hp ~/src ~/mounts/tmp --nopassthrough
-o io_uring_zero_copy -o io_uring_q_depth=8
Once this series is merged, the libfuse changes will be tidied up and
submitted upstream.

Thanks,
Joanne 

[1] https://lore.kernel.org/io-uring/20260612184840.4058966-1-joannelkoong@gmail.com/T/#t
[2] https://github.com/joannekoong/linux/commits/fuse_zero_copy_benchmarks/
[3] https://github.com/joannekoong/libfuse/commits/zero_copy_v5

Changelog
---------
v4: https://lore.kernel.org/fuse-devel/20260612210513.1516038-1-joannelkoong@gmail.com/
v4 -> v5:
* Address Miklos's feedback (separate uring cmd for adding bufpool, pass only
  bufpool addr and len, pass back bufpool offset instead of buf id, etc)
* Make zero-copy opt-in on file open
* Do any zeroing for short zero-copy reads instead of accidentally skipping that
* Drop Baokun and Jeff's reviewed-bys since the commits had modifications
* Run more rigorous benchmarks, on bare-metal machine

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

v1: https://lore.kernel.org/linux-fsdevel/20260324224532.3733468-1-joannelkoong@gmail.com/
v1 -> v2:
* Drop kernel managed buffers from io-uring infrastructure and move it to fuse
* Add visual diagrams and more documentatoin to commit messages and
  documentation patch

Joanne Koong (6):
  fuse: decouple fuse_ring creation from ent registration
  fuse: add FUSE_IO_URING_CMD_ADD_QUEUE
  fuse: add io-uring buffer pools
  fuse: support registered buffer pools in io-uring
  fuse: add zero-copy over io-uring
  docs: fuse: document io-uring buffer pool and zero-copy uapi

 .../filesystems/fuse/fuse-io-uring.rst        |   5 +-
 Documentation/filesystems/fuse/index.rst      |   1 +
 .../filesystems/fuse/uapi/io-uring.rst        | 143 +++++
 fs/fuse/args.h                                |   2 +
 fs/fuse/dev.c                                 |  27 +-
 fs/fuse/dev.h                                 |   2 +-
 fs/fuse/dev_uring.c                           | 576 +++++++++++++++---
 fs/fuse/dev_uring_i.h                         |  56 +-
 fs/fuse/file.c                                |   2 +
 fs/fuse/fuse_dev_i.h                          |   1 +
 fs/fuse/inode.c                               |   6 +-
 include/uapi/linux/fuse.h                     |  66 +-
 12 files changed, 804 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/filesystems/fuse/uapi/io-uring.rst

-- 
2.52.0

