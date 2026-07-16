Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFE73AF678
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 17:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224794; cv=none; b=n6dOeLB4i5UUDKKn0QIL/MXHhcBmfhNzoYcw/LHZcTxBLvLbakE3rKKokJQ6iuONnjRATYML5XgCKdNq0LGqUq5OqHOz5O6SKfx1tBYN2vaCctYbBQumbkW8teoAFkJEICH3xLBHigrs//uUThj2XlzgdlH/6ueqpS4zr9pz9bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224794; c=relaxed/simple;
	bh=JdJkCAqSPMkyeuoVPcyHxAVz9vuOlCReGpJsjLsd2VI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RZ+rXU9B/KZVuUMulU26EXSKdFA+fjHvxoSBbAfG8zpk71zKUtd4GNe1ovlXX9E0HlEjkZCv7NJsycIH/HD40p9W5XHpzaLfFoGl24CJ/vCQbSB01eCfeHUD5IEH/B8l6fcGCJ3c5KGPzvzdJ15GFl+nM4HYj/YSOGyOCR5vhqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/CiElvm; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/CiElvm"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-43bf9548df4so3539622fac.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 10:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784224791; x=1784829591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Umu98Nn8yuwqmYOA/mpn5fk2aY2nzCueaauDYNUeD28=;
        b=Q/CiElvmhQzdgXArjoa9HkxgzCfjlzFRGZw/qwBCuypQjsimolC8NOTmb8yBMs0/7q
         2WKUjmBECCP3q2Qn7ogWW/enO6X3HxF366SzCRc5bHiX9P2kEXfhxH0nW9ubWJXPT2YG
         HoHDPrJH2lSlPr71rpnPKwxh6tBUOW5uAfE5VfOG6v/cAt6aJnuqSYSSMIBJxEuQ74MW
         w2sdeKE43rfAujEGYzabTmsS9331oz07Y28faHDaOk1wqU5kv7ea32ijqdj1PW/B4ZgU
         nLu8HaQRc1wWUotklY8NhfsBdy+5JiCV48RLont5/xMZ4w+6JGz6F66w547T/0CWynd0
         fcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224791; x=1784829591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Umu98Nn8yuwqmYOA/mpn5fk2aY2nzCueaauDYNUeD28=;
        b=abnLosN9foS8Efc3HxB7UgpBd02+S/vOPNT+jUqT+BORsSsu2X15L5IaHj9aQyuN06
         DLCYs6EWseqUUyyo/EFJPwSPaPTfNSCDtrbiuNvdkTujODjvg3HxHsAVylacknJ4/rEH
         O9aNkVa/i0h0umwC70/1YH5kPjV4kr4BmDBzOPw+7pBzpfcYYZr6y+jNdixMgTjQIdRy
         hJVBuOe93mvUwYzKCHtv2VHc2aF3ttI/CJuts8OxKNoa6PLMvTqzMSBhjBxtDASagyQ+
         4e8lcir/kJPddWkJRCPAjKStheT5YXRM4n8Owm2omgwWaBLobS6a3cO4vR8+ucG/ETTP
         m+3g==
X-Forwarded-Encrypted: i=1; AHgh+RqJWerYETsBKdwYRcpUj8aUCo9PvSBt8gFi4fdCyhhyCz2nrmj5dOJaCYxrT12DfNRpQ13mxrgrjdRy@lists.linux.dev
X-Gm-Message-State: AOJu0YxX1YtUvq7KrI2emLYkWsonRYTlQKzaGULtlycYqWUI8xdfjxaa
	a0yQxYDjQ3eyaq1XuLzcW49LbV6Du0HlWAzlCCdnPZVhlsrfwsG3FVwa/Wox6Q==
X-Gm-Gg: AfdE7cke6XpFUZmG2konc4v8XwAmP/orraGfL/LsmDdyXBwCknAWuhD4yDqqOgmWf77
	Y31ko14pZlEUan1Uj/86tNtYXJh5JNFpYznFjkSaWjZN3TlhWj5evOASE+/beaq6+zArkNATpxM
	XJdY2Ka4QsBBh7tlMNvwpGoag5L4X5MCBp/TLcmrt9pGOqJAmg426Sfvz42wbB27Xy9aejryBQ9
	FKl4zmp3ajB36puG7hqnv2Q+simqBiJ16CPCeoqDc2a2FYTmbYjsr+1X6jxJE2tH0M3yACPpYbW
	Nz47MGYdS7QgymfdXkvibucLYN4X0F1qIVtlsxa/aI4UGxmjm6JbI97bgHvVWpDAbdqxVeuNByE
	y/u3dDLaHFouuEdBSGZ5eI2yxDoy9sTUo3GoFljfneciMw26oXamaxiIqb+NUO2u7oGvNTvFo3Y
	4pG+UwGcDR2BK8eTS8dTBiNBNB22vC8GVIAVfpqTKvvIQieGJeSfSCRuVned7pifE5
X-Received: by 2002:a05:6870:3042:b0:448:558c:d82e with SMTP id 586e51a60fabf-4560b8a7908mr7520135fac.39.1784224791319;
        Thu, 16 Jul 2026 10:59:51 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4a::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4560a9b178fsm7759843fac.5.2026.07.16.10.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:59:50 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	amir73il@gmail.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v6 0/6] fuse: add io-uring buffer pools and zero-copy
Date: Thu, 16 Jul 2026 10:59:02 -0700
Message-ID: <20260716175908.2339738-1-joannelkoong@gmail.com>
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
[4] https://github.com/joannekoong/libfuse/commits/zero_copy_v5

Changelog
---------
v5: https://lore.kernel.org/fuse-devel/20260630211436.2062816-1-joannelkoong@gmail.com/
v5 -> v6:
* Remove WARN_ON tag, add missing barrier (Sashiko)
* Bring back some documentation from v4, rename uapi doc (Amir)

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

 .../filesystems/fuse/fuse-io-uring.rst        |  36 +-
 Documentation/filesystems/fuse/index.rst      |   1 +
 .../fuse/uapi/fuse-uapi-io-uring.rst          | 129 ++++
 fs/fuse/args.h                                |   2 +
 fs/fuse/dev.c                                 |  27 +-
 fs/fuse/dev.h                                 |   2 +-
 fs/fuse/dev_uring.c                           | 577 +++++++++++++++---
 fs/fuse/dev_uring_i.h                         |  56 +-
 fs/fuse/file.c                                |   2 +
 fs/fuse/fuse_dev_i.h                          |   1 +
 fs/fuse/inode.c                               |   6 +-
 include/uapi/linux/fuse.h                     |  66 +-
 12 files changed, 821 insertions(+), 84 deletions(-)
 create mode 100644 Documentation/filesystems/fuse/uapi/fuse-uapi-io-uring.rst

-- 
2.52.0

