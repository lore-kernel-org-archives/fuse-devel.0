Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F5234DB56
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 01:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781574268; cv=none; b=UiAhocmh610O/E7qIskCZ5St3c3qKq8p9e+c7/V37O+m0qzbMjwuGrex8uVbgjCaRJuVHJpt+OSFkaY/Wu+wM7PW9ivfd5bKGYNMiFPl3tV2fvEgUVKxWC4KmnRXPKfaGpLX1QpuBlxgRtoke2rAiqwNXAHKWcCGUr1VOv8cY74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781574268; c=relaxed/simple;
	bh=ElPvESyHtIZBIZzEQ3wF/X7fQxATAJZSTHXuF5lmzSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bv02nM12EIBnI391vuAxdhBEWx+z1S7GNfh20mm5kqun8jJUeR2G72FPiQFnAUHiq9TICXAKvXB/IKBNNerkZhQCtoWVdRO78k00eSak7rnX17I9Cf/5JcHTKPFC6bDZN/XN0Ur3MMnaRr09u1yMVUCnqgBtFH4Vwg4xyL7f/i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfljdUy8; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfljdUy8"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-69e9b037d82so3040895eaf.2
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 18:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781574266; x=1782179066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xi5sYG6uyveDGeVU6XwSoMZ8X3XrDX41q4nmlIH5grs=;
        b=lfljdUy8J1UHJA3WTIl8tDx9KaiE+3WmtgUW/18JqxQ3slP1cLlCn/Ru2VpAEeqJfu
         kYOsS9JSUg16H7IieWyWrs/H0EIb44HSxVPDLfMOf4HOizuLud26KRBtDPKuroMYhUkH
         l0IM8sGfY2pVZylA48Zc1nRRxSrZg82i0qZq7wwPKFhUB19yzKjtZzkNla8FUGjDG0wk
         XHJtmoK42XyeY4PbS8CFtwn4W76N/Ov8N3+pe86h0RjUlss/mXQDJ9simc2LmoeqY2sZ
         4UXO2fcsdtgk7FXaU4Mch6k3EOyw4h5BmB/+poD7bC0AWRqOT7yTo6asktNRzbQsx/iM
         ncPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781574266; x=1782179066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xi5sYG6uyveDGeVU6XwSoMZ8X3XrDX41q4nmlIH5grs=;
        b=A88mQ8TK7pAHubiGBxksb6q3Mab+QnbJ8RQ0IYmBi+g1cSyntsgloy4lh9NeP5nKZI
         HU8IwlNGEIJsbqjbHEnSJL2qza8yVVw9hA4xRGB5EwKTyuR508lGVglOcglK9VDug39b
         LODd2NdVrB8B1mHFpk2/j8d+H/SWeQjLH1fkqKx11V6VQVfQbuX1KczwSL9Ee7OknQqd
         g7mRvLmYfI8wJyG4bF2rY69QBm2T8TKDA0sjl3V2RJW+6gDGKov03vOUg4DKJ+1HDi4t
         YHXFdck6pA2V2/jTp0sPXh6BkpDv0du6TZUNRKV9rpjoBvcWU9Q4ycestG+6jf4rK2un
         KyTg==
X-Gm-Message-State: AOJu0YywqqvE9dqu4VnmqXIuEYzNAPuVaC3Iy3UcwqsBOYb3pZXD0tbn
	88XGu4h46wU2KSGc+w2fnRwznZ4u1r01QYJQwsnfEIqDdn9SVcHKei7m
X-Gm-Gg: Acq92OHd87CgmXTrGLnPL6OktgQ8MK90PLNR99Kxr9oQ7UrlnZaVfTfBhkgbqkvTsw+
	Mbbyfkf5XmDDIFPVXoWz9faHXjd0yWaUFdTcarJd3Y6JJQgFRq2PfupiW2FExa/Rb/kwC39YcdH
	nBNAJY4WLclMjU6dIc5ew5FW053cEi2a6F2jH7t43EX/hJOK7d4qNeWWWz3YIEdXMk2Du4Kn87X
	Sa3MuoZkhE52R95zSAtxVvr5AvsNqlplCngbx7HyYlBvVqzcS0MDzv/ylCdqkSilyoAZnMvGwRD
	lbMR+n+CxErbCHnl18a2kQe6i2HR6mMP4jkA1M4alKVxsGxxEpRqIoHKsW1eb0A9Ik8OwgsTI81
	ERvTZjnavXtkFyOpUhGcdxz3j5Iip0JM25ulGULqe0T+ynOTgnMcGWnyvsyzZhmnX9u5udKPvK9
	X2aVIy4WrvfK4oBNoHKQZTT+04Tpa2AYbKRFY+7VJV8g1QTR7l6lKGXKqXR5ddRGVov5LgAOqsQ
	IWB5GhP7RZzAs8rHpBtAS3eL4DdTm2IfKYRsL84NoTLNxQRbiJrM0Y=
X-Received: by 2002:a05:6820:4deb:b0:69d:fee4:2381 with SMTP id 006d021491bc7-6a0a40ef256mr1280037eaf.55.1781574266486;
        Mon, 15 Jun 2026 18:44:26 -0700 (PDT)
Received: from rdf-gcp2.us-central1-b.c.storage-xlrait-66065.internal (163.80.112.136.bc.googleusercontent.com. [136.112.80.163])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69f00b41ed1sm4093011eaf.0.2026.06.15.18.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 18:44:25 -0700 (PDT)
From: Russ Fellows <russ.fellows@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amir73il@gmail.com,
	Russ Fellows <rfellows@xlrait.dev>
Subject: [PATCH v2 0/2] fuse: fix passthrough parallel direct writes with a minimal series
Date: Tue, 16 Jun 2026 01:44:17 +0000
Message-ID: <20260616014419.7913-1-russ.fellows@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260529031918.7361-1-russ.fellows@gmail.com>
References: <20260529031918.7361-1-russ.fellows@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Russ Fellows <rfellows@xlrait.dev>

This series contains the current minimal submit-ready fix for passthrough write
parallelism.

The first patch preserves FOPEN_PARALLEL_DIRECT_WRITES for passthrough opens.
Without that, fuse_file_io_open() strips the flag before passthrough writes see
it, so the kernel never reaches the shared-lock path.

The second patch keeps the lock decision local to passthrough.c and allows
shared inode locking only for safe direct overwrite writes. Append writes,
buffered writes, and writes that may extend EOF remain serialized.

This intentionally replaces the older broader patch direction. The current
minimal series does not export fuse_dio_lock()/fuse_dio_unlock() from file.c,
does not add declarations to fuse_i.h, and does not include the separate
iocachectr/fi->lock cleanup work.

Regarding fuse_passthrough_end_write() safety: the shared lock is only taken
for within-EOF direct overwrites, where i_size does not change. In that case
fuse_passthrough_end_write() -> fuse_write_update_attr() only updates mtime/
ctime, which is safe under a shared inode lock. Past-EOF writes still take
the exclusive lock, so i_size updates are always serialized correctly.

Validated on kernel 6.17.13-p4min with fio 4K random direct writes on a FUSE
passthrough mount backed by XFS on a RAM-backed null_blk device:

  numjobs | FUSE IOPS
  --------|----------
        1 |   481,837
        2 |   931,883
        4 | 1,533,058
        8 | 1,730,477

Raw XFS on the same device at numjobs=8: 1,693,406 IOPS.

Changes since v1:
  - Removed use of fuse_dio_lock()/fuse_dio_unlock() from file.c; the lock
    decision is now self-contained in passthrough.c using inode_lock_shared()
    and inode_unlock_shared() directly.
  - Added explicit IOCB_DIRECT check: parallel locking is only allowed for
    direct I/O, preventing accidental shared locking on buffered writes.
  - Added explicit IOCB_APPEND check: append writes always serialize.
  - Added explicit past-EOF check: writes that extend i_size always serialize.
  - Removed all symbol exports from file.c (fuse_dio_lock, fuse_dio_unlock).
  - Removed all declarations added to fuse_i.h.
  - Split into two patches: iomode.c flag preservation as a prerequisite
    (patch 1) and passthrough.c locking logic as the main change (patch 2).

Russ Fellows (2):
  fuse: preserve FOPEN_PARALLEL_DIRECT_WRITES for passthrough opens
  fuse: allow parallel direct writes in passthrough write_iter

 fs/fuse/iomode.c      |  7 +++++--
 fs/fuse/passthrough.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 4 deletions(-)

-- 
2.51.0
