Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91874BC001
	for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 19:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734031; cv=none; b=VdtUvMcNlC6KqRovmhJ218qz/jJXqoqZfZjnsqc+Osm/lV7aYhQ5je8yT38ouUUi+GksfYzui2A2I2HZ2CUMA5ORfrJUd8R82UJucgbsvCDy0ecA+hUfJdCbNB2ghFnUQjPNLJJB/eaBfeDgenDDPI4PFcU04+99WloN7fjQx7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734031; c=relaxed/simple;
	bh=bG5e5cjVRppM1fUA3KNiGJX4n/Uw8b7kaAOSaxtuwcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ntoD1PqdOpzSwU0uMpv0TBm4GcY9IoXQ+cHpg5sys68B2YczNDXr5jZaBo8PE8e4ng0sM/b/JTMbJw9t3O9GpYy64IZkItzjJv9NZCaJt+Y86ioroXUkrO9nD8ozQyk7X8MgdaqNsjwBlNjs80jiYMTCmbpP0kTrbeKQYGgMa7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKsqqmwV; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKsqqmwV"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e88b60121so1148120a91.3
        for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786734028; x=1787338828; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tpe39WXheaLTBpDbJTYF3XO6rYPGvl+6Lg2H5On9Cs4=;
        b=pKsqqmwVlP74My1IHX/zyNc6eGNBCbXeKVggfDsYgkC+2C/ngH8zAyWofDCsmd5WJC
         Hfw8Mft2vSnfPKwjex9Cycu3LcUZ9VKa7xu9ocR+aC4qg8X+129vR7uukUP+6fG8F49T
         yNJLvuKkgu+cRJgiq2HJNQvqdX5mzE2wFU4iTQfnz9ayH3i1VzIpFTWss8Qbo2c+9FF1
         MCmNn6BsWUEdwaKb2chnyqCwyhJ2yY3OM5KqbT+AofViM+VL55Sm7CusfTNm5hr9ZYai
         KNsHDg49BpcX675nOMaxNdnYFJKfS6CwzfywwFoGHSbvPiVnlFqdVdmahKGgqWvvord+
         xGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734028; x=1787338828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tpe39WXheaLTBpDbJTYF3XO6rYPGvl+6Lg2H5On9Cs4=;
        b=jIvB2QdJKvuJNKJ0A2AjhfScQKCRoidG3OY4hLJniZ/q+eCpQAPmCGa/wS49fsIz0i
         GKoDr55CJerKuBrxDBdZzknToab1iVHZkCoMrOjamkRNVbF+3/CZcvWIho+PXI245twS
         pnNXrKR1Vpx8zWsNLUYufDw5p7TvrhAnQBSZpkdUbaC5JdRP4zf4+jbijs51facO1W1h
         Bvl7Js3+8tCPs0jJvCIL3sW5GoJPl8EYwPFoA62e8LKEjGNCKvcE1Cwd2bVLWNZScgS6
         yOHQ0rFuMJWN2HBcwgRmDJA0Flawi9K81BdP3I3iGuTEpF8FWiwwtRnTPpqJL5IzRDxW
         P4Fg==
X-Forwarded-Encrypted: i=1; AHgh+RropXL2F4Xsb2Ue//Ksaf86PVRjtbW/lcyxSU9e4Nka7GVsW+tJFnaNL+ogKFj380olCjEoXV2Uvd8j@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo+DF/8m6zmMZmL6sktGmC+WPcaOOX9CGWKYvG7v5DLrhqlyR0
	+QIuPdVdut2C4ji9keAYCpRLAJlq10r58G1lLjYP68TrMhLflzOyc2bR
X-Gm-Gg: AR+sD11pN7guHvVwFSgKb8+g+eJnYXDVUWvPs9KSoQTl5zV9cOLmHJx4gBs93avfUxl
	IEwLPTJl+7a4PCcKo4BaQAf9+YJaJJ/0ELrfzY2nl+lpuXFeZLxygW3HFPVgaCVCEZYgz9+awYk
	Vm1WeX+GhqkaVGnd2T1OT9Zkd3afaK7pX2K4Ih4/pFzCBx2GJUVHEmoXUgk/itf6cEqKTC3E7NN
	RVbC61XCcwryauAA7Y4YABy/2jZB9zfryff8uoTB/MWjqCbO0Uyp6M0ZDnDkppbSNZOAQrcCSsN
	H2NkcmC6w7L0TG7R5rCrqnL81dlOx8GHk+7X0WWaKC4CTYXfti17mu1PAafSpCIpf7WH1HMZ+EZ
	jc2JeMtcPuZqKkkA+aGZ++APTD09xndQS+PLNCMdiPT++IPsuK2PXu6lREiZUoFkx9K5YEtMulb
	AeMUhMjULWNvveWq9013ChEn+mROGccznfrDklYLS/uqnq7V77QlyqySM6iYts8X8x/bwhjRxyg
	Tu+RyxryxY/RZ3Y1Sy5dMLV6CDubp+H6B9i9Qh7
X-Received: by 2002:a17:90b:48c1:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-3933b792c20mr9744594a91.9.1786734027727;
        Fri, 14 Aug 2026 12:00:27 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:70::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ebb88c80sm3773119a91.10.2026.08.14.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:00:27 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	amir73il@gmail.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v7 0/6] fuse: add io-uring buffer pools and zero-copy
Date: Fri, 14 Aug 2026 11:59:40 -0700
Message-ID: <20260814185946.3679478-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series implements fuse io-uring buffer pools and zero-copy.

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

This series is on top of commit 7d87a5a284bb and on top of the io-uring bvec
changes and the changes from the series in [2] applied.

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

The benchmark script and results can be found in [3]. The libfuse changes can
be found in [4]. To test the server, run:
sudo ~/libfuse/build/example/passthrough_hp ~/src ~/mounts/tmp --nopassthrough
-o io_uring_zero_copy -o io_uring_q_depth=8
Once this series is merged, the libfuse changes will be tidied up and
submitted upstream.

Thanks,
Joanne 

[1] https://lore.kernel.org/io-uring/20260612184840.4058966-1-joannelkoong@gmail.com/T/#t
[2] https://lore.kernel.org/fuse-devel/20260715174305.336261-1-joannelkoong@gmail.com/
[3] https://github.com/joannekoong/linux/commits/fuse_zero_copy_benchmarks/
[4] https://github.com/joannekoong/libfuse/commits/zero_copy_v7

Changelog
---------
v6: https://lore.kernel.org/fuse-devel/20260716175908.2339738-1-joannelkoong@gmail.com/
v6 -> v7:
* Use kvmalloc_flex() instead of kmalloc (Bernd)
* Remove registered bufpool flag and add reserved add-bufpool flag, as per
  Bernd's preference (Bernd)

v5: https://lore.kernel.org/fuse-devel/20260630211436.2062816-1-joannelkoong@gmail.com/
v5 -> v6:
* Remove WARN_ON tag, add missing barrier (Sashiko)
* Bring back some documentation from v4, rename uapi doc (Amir)

v4: https://lore.kernel.org/fuse-devel/20260612210513.1516038-1-joannelkoong@gmail.com/
v4 -> v5:
* Address Miklos's feedback (separate uring cmd for adding bufpool, pass only
  bufpool addr and len, pass back bufpool offset instead of buf id, etc)
* Make zero-copy opt-in on file open
* Do any zeroing for short zero-copy reads instead of accidentally skipping
* that
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

 .../filesystems/fuse/fuse-io-uring.rst        |  36 +-
 Documentation/filesystems/fuse/index.rst      |   1 +
 .../fuse/uapi/fuse-uapi-io-uring.rst          | 126 ++++
 fs/fuse/args.h                                |   2 +
 fs/fuse/dev.c                                 |  32 +-
 fs/fuse/dev.h                                 |   2 +-
 fs/fuse/dev_uring.c                           | 572 +++++++++++++++---
 fs/fuse/dev_uring_i.h                         |  56 +-
 fs/fuse/file.c                                |   2 +
 fs/fuse/fuse_dev_i.h                          |   2 +
 fs/fuse/inode.c                               |   6 +-
 include/uapi/linux/fuse.h                     |  63 +-
 12 files changed, 816 insertions(+), 84 deletions(-)
 create mode 100644 Documentation/filesystems/fuse/uapi/fuse-uapi-io-uring.rst

-- 
2.52.0

