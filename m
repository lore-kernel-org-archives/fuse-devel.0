Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5207B388E63
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 18:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224813; cv=none; b=nC8TEc3thzWCbePv02e47awnqjW9WnPFcnMt2b1vC1ntVQjNexSKw84ovFr62QhKJ9bxjyxoThuyzNtPCaPLF1Brr9xYewg9u4aJneTuI/LpRYjX/LUmUY1rc9JkxrDBwYHxZmVglBky8tPyxZHjxvJL6rGdcJG1HwsNt32K+Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224813; c=relaxed/simple;
	bh=83mOg3Wh6U3fJQTFD9urnMsnCEwUpd5C9D50sSBw68U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GEot1yfOWdqmGRANCWTU7a1fEVjwQt0V1/Xvhg1FQYfweBZ2I15Sx66UhVYDqY39WCNHMSbGquDE6GtZKwj90dmTKNsWHySZb1GEDXClPlJSFaGzRKTmRJ/oewZSU8sueArantCw1wdpQXv7NRAlX3hhmh86vjGM9KgiAzXC/dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QI1ZPb+P; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QI1ZPb+P"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb545db3afso2062157a34.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 11:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784224810; x=1784829610; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JRLd71T14YEzjDHBlYRHqio8//1GV8CoOyUJf4jM4wU=;
        b=QI1ZPb+PqOusL57cOU22ZBPVrDjCa5GO/Qrtknt4KBR5IEBuH50CXLxGT3vHNXag4v
         h3MzUsUppPT7XUsg0+P+nziJdpWB8Gaop4lgUd8qU7HnwysOSX0Rw85HU+HFQAjSp7s+
         AnB+F2lOTTb8Y/WBqreEMZfiZhPXL2DsUxlNczC94atZNNajgz9/+kYvOqAUfaBH2bgC
         arf6seCmlRz1aTyj6WuuizC29JMd+1eNUgeR1FH/jGpm8DuiHnD2IhV8Nnl7RLWRZWyS
         EG0PWjIDcOB64NXbqwKtD/IL+MnS5P4RogJFlnwESVASq2IlVY/spezpl0dtxVIhrYYU
         FbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224810; x=1784829610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JRLd71T14YEzjDHBlYRHqio8//1GV8CoOyUJf4jM4wU=;
        b=SbYyBaF+WH3T9+LFKlnxmeBb5sAUIF66yG2H8dP5TZZrH4rQDUbzldz7NwA/qqh7ys
         4F106kPSOPEkCRcSsCbNpf80UiYLlTrQqjss3opNazGU+oHTglS+n4NlUd3bGGDm72WC
         64eCsUBwq0LApMjmCm7HMguF29UkZbNq4pTQJWCBn8bupFiqmT5IlCoSu/lynn7mBGi0
         T9U8Efuw0f7G3UmqOZkYqxp95Dr6mb2cOuQnK1DyUhHztxBjYnlQeOVfl63uyBU3pgFp
         Wbv0GU6cC7bkXZ1Knl6lZobbdV9dZ61IKaDiBIYF1k3htQ3cbtC8g55c25Y3vHu5AlL5
         Xhig==
X-Forwarded-Encrypted: i=1; AHgh+RoHtwVWJA61kGi45etdpHn1DL0B7r8ajhyQlA/YmfQMsKYeF2o+gM1Yeoj+7lZyQZeAcwDRmU6FoPln@lists.linux.dev
X-Gm-Message-State: AOJu0Yw28JgAai4N0c1XLg50f0R4GRxwhP617Ah6mS09AIdwvFlx8iNb
	cJuGT789u2gg3m4I3qZMMIsfDjJMTB/ie6si2t7whwBKT0zdYDPvKcWM
X-Gm-Gg: AfdE7cnChiZ1+4J8o6AqHURqbh/QOEYNbSzUxI/Tgk33Nyq1nIcaKjAIFmdkN6eKnLc
	MAgZJ+tHzsAnpXfOm1xnI+VnYznkPXBI1GDAgsan6QdI2u/jWgCoshi0oa7JG2cniJks6uffKgl
	uZ4gCcr1wcPGR2KTOJSSTXaz4A/6uY7Fo3ILPeF8VQ8dTj4K1Pwm5JybRAEqw3izndUHkQfrEx/
	yVoEO9uDXjBsyrUC5vAyf0G8w0HoRUDxN/D1LIBPjgIaRGFkyAvmTa5st4knPAFlfLyzVnS6oQG
	R37+fN4Ncfw/QA54JdbcjR4ZEcBwxs6U0FevC1IrVfyLm5fhHVoqlcOkleFx4kP0FrpnpKlRfk0
	/w8TEyCTcD5thiiWCiw/SJG0IwMsB2AQvbJUeIw+cyPdUbvRnuS8cfZTaSoo5lakrFHigR+b+3j
	e/0r4j4D0uEo2JI9fDdrVs5fKsnaeg0efK9zFxTJkaCxugpEEdfpGrjOfibRpty+M=
X-Received: by 2002:a05:6820:a09:b0:6a3:e200:4161 with SMTP id 006d021491bc7-6a47054320bmr93600eaf.7.1784224810078;
        Thu, 16 Jul 2026 11:00:10 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:7::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38a4bd734sm12138962eaf.4.2026.07.16.11.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:00:09 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	amir73il@gmail.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v6 6/6] docs: fuse: document io-uring buffer pool and zero-copy uapi
Date: Thu, 16 Jul 2026 10:59:08 -0700
Message-ID: <20260716175908.2339738-7-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260716175908.2339738-1-joannelkoong@gmail.com>
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for fuse over io-uring usage of buffer pools and
zero-copy.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 .../filesystems/fuse/fuse-io-uring.rst        |  36 ++++-
 Documentation/filesystems/fuse/index.rst      |   1 +
 .../fuse/uapi/fuse-uapi-io-uring.rst          | 129 ++++++++++++++++++
 3 files changed, 164 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/filesystems/fuse/uapi/fuse-uapi-io-uring.rst

diff --git a/Documentation/filesystems/fuse/fuse-io-uring.rst b/Documentation/filesystems/fuse/fuse-io-uring.rst
index d73dd0dbd238..29f98057500d 100644
--- a/Documentation/filesystems/fuse/fuse-io-uring.rst
+++ b/Documentation/filesystems/fuse/fuse-io-uring.rst
@@ -11,6 +11,9 @@ and works. For generic details about FUSE see fuse.rst.
 This document also covers the current interface, which is
 still in development and might change.
 
+For the userspace protocol, see
+Documentation/filesystems/fuse/uapi/fuse-uapi-io-uring.rst.
+
 Limitations
 ===========
 As of now not all requests types are supported through io-uring, userspace
@@ -95,5 +98,34 @@ Sending requests with CQEs
  |    <fuse_unlink()                         |
  |  <sys_unlink()                            |
 
-
-
+Buffer pools
+============
+
+Without a buffer pool, every entry needs to pass a dedicated payload buffer
+large enough for the maximum payload size. A buffer pool decouples entries
+from payload buffers. The server hands the kernel one contiguous buffer pool
+of memory and when the kernel sends the server a request, it indicates the
+offset into the pool for that request's payload. Internally, the kernel is
+able to manage/optimize the buffer pool memory however it likes.
+
+A server may also register the pool region with io_uring as a fixed buffer.
+The backing pages are then pinned once, avoiding per-request pinning and
+address translation. This also allows servers to use the same registered
+buffers for subsequent backing store I/O through io-uring, keeping data
+in the same pinned pages without additional pinning / mapping overhead.
+
+Zero-copy
+=========
+
+Zero-copy lets the server read from / write to the client's pages (pinned
+user pages for direct I/O, or page-cache folios for buffered I/O) without an
+intermediary payload copy. This requires CAP_SYS_ADMIN privileges.
+
+When a fuse request arrives for a file that opted into zero-copy, the kernel
+registers the relevant pages (pinned user pages for direct i/o or underlying
+page cache folios for buffered i/o) into a sparse slot in the server's
+io_uring registered buffer table. The server can then operate on these pages
+directly using io-uring fixed buffer operations (eg read_fixed / write_fixed)
+and the kernel unregisters these pages when the request completes.
+Non-page-backed args (eg op out headers) will go through the payload buffer as
+normal.
diff --git a/Documentation/filesystems/fuse/index.rst b/Documentation/filesystems/fuse/index.rst
index 393a845214da..3dada6c4057a 100644
--- a/Documentation/filesystems/fuse/index.rst
+++ b/Documentation/filesystems/fuse/index.rst
@@ -12,3 +12,4 @@ FUSE (Filesystem in Userspace) Technical Documentation
    fuse-io
    fuse-io-uring
    fuse-passthrough
+   uapi/fuse-uapi-io-uring
diff --git a/Documentation/filesystems/fuse/uapi/fuse-uapi-io-uring.rst b/Documentation/filesystems/fuse/uapi/fuse-uapi-io-uring.rst
new file mode 100644
index 000000000000..66b0fcbcde24
--- /dev/null
+++ b/Documentation/filesystems/fuse/uapi/fuse-uapi-io-uring.rst
@@ -0,0 +1,129 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================================
+FUSE-over-io-uring uapi documentation
+=====================================
+
+Commands
+========
+
+``enum fuse_uring_cmd``:
+
+``FUSE_IO_URING_CMD_ADD_QUEUE``
+  Create a queue identified by ``fuse_uring_cmd_req.qid``. Queue-wide
+  options are passed in ``fuse_uring_cmd_req.flags``:
+
+  ``FUSE_URING_ZERO_COPY``
+    Enable zero-copy on this queue. Requires ``CAP_SYS_ADMIN`` and a buffer
+    pool, which is added separately via ``ADD_BUFPOOL`` before registering
+    entries (see `Zero-copy`_).
+
+``FUSE_IO_URING_CMD_ADD_BUFPOOL``
+  Register the payload buffer pool for an existing queue. The server provides
+  a single contiguous region in ``fuse_uring_cmd_req.bufpool.uaddr`` /
+  ``.len``. This command must be issued after ``ADD_QUEUE`` and before
+  registering any payload-carrying entries on that queue. Flags:
+
+  ``FUSE_URING_REGISTERED_BUFPOOL``
+    The pool region is registered ahead of time with io_uring to avoid per i/o
+    pinning/unpinning and mapping overhead.
+
+``FUSE_IO_URING_CMD_REGISTER``
+  Register a ring entry (a long-lived SQE that carries the request header
+  iovec). For a zero-copy queue, ``fuse_uring_cmd_req.ent_zero_copy_buf_index``
+  indicates the reserved registered buffer table slot this entry uses for
+  zero-copy (see `Zero-copy`_).
+
+``FUSE_IO_URING_CMD_COMMIT_AND_FETCH``
+  Commit the reply for a completed request and fetch the next one. The
+  request is identified by ``fuse_uring_cmd_req.commit_id`` (the value the
+  kernel reported in ``fuse_uring_ent_in_out.commit_id``).
+
+Structures
+==========
+
+``struct fuse_uring_cmd_req`` (80-byte SQE command area):
+
+============================  ==================================================
+Field                         Meaning
+============================  ==================================================
+``flags``                     Command-specific flags (see each command).
+``commit_id``                 Request id, for ``COMMIT_AND_FETCH``.
+``qid``                       Queue index.
+``bufpool.uaddr``             Pool base address, for ``ADD_BUFPOOL``.
+``bufpool.len``               Pool length in bytes, for ``ADD_BUFPOOL``.
+``ent_zero_copy_buf_index``   Per-entry zero-copy slot, for ``REGISTER``.
+============================  ==================================================
+
+``struct fuse_uring_ent_in_out`` (reported by the kernel per request):
+
+============================  ==================================================
+Field                         Meaning
+============================  ==================================================
+``flags``                     ``FUSE_URING_ENT_ZERO_COPY`` if zero-copied.
+``commit_id``                 Id to echo back in ``COMMIT_AND_FETCH``.
+``payload_sz``                Total payload size in bytes (see `Zero-copy`_).
+``offset``                    Payload buffer offset within the pool.
+============================  ==================================================
+
+Buffer pools
+============
+Setup:
+
+* Issue ``ADD_QUEUE`` for the qid.
+* Issue ``ADD_BUFPOOL`` with ``bufpool.uaddr`` and ``bufpool.len`` pointing
+  at the region.
+* Register entries with ``REGISTER``.
+
+For every request that has a payload, the kernel reports where the payload
+lives in ``struct fuse_uring_ent_in_out`` (part of
+``struct fuse_uring_req_header``):
+
+``offset``
+  Byte offset, within the pool region, for this request's payload buffer.
+  The server adds this to the pool base address to locate the payload.
+
+``payload_sz``
+  Number of payload bytes for this request.
+
+To use registered buffers, the server should pass ``FUSE_URING_REGISTERED_BUFPOOL``
+as a flag to ``ADD_BUFPOOL`` and set ``IORING_URING_CMD_FIXED`` in
+``sqe->uring_cmd_flags`` and put the index of the registered bufpool in
+``sqe->buf_index``. The same registered buffer can be reused for the server's
+backing-store I/O as well (e.g. ``IORING_OP_READ_FIXED`` /
+``IORING_OP_WRITE_FIXED``).
+
+When using registered bufpools, every SQE the server submits must follow the
+standard fixed-buffer protocol: set ``IORING_URING_CMD_FIXED`` in
+``sqe->uring_cmd_flags`` and put the index of the registered bufpool in
+``sqe->buf_index``.
+
+Zero-copy
+=========
+Requirements:
+
+* The server must be privileged (``CAP_SYS_ADMIN``).
+* A zero-copy queue: ``ADD_QUEUE`` with the ``FUSE_URING_ZERO_COPY`` flag set.
+* A buffer pool: ``ADD_BUFPOOL``.
+* For each entry, ``REGISTER`` with ``ent_zero_copy_buf_index`` set to the
+  index this entry uses in the server's io_uring registered-buffer table.
+  This is where the kernel registers the request's pages for the server to
+  access (it is separate from the payload pool). On a non-zero-copy queue this
+  field must be 0.
+
+Zero-copy is selected per open file. The server sets the open-file flag in
+the ``FUSE_OPEN`` / ``FUSE_CREATE`` reply:
+
+``FOPEN_IO_URING_ZERO_COPY``
+  Reads/writes on this open file should use zero-copy.
+
+For a request that is zero-copied, the kernel sets ``FUSE_URING_ENT_ZERO_COPY``
+in ``fuse_uring_ent_in_out.flags`` and places the request's pages at the
+entry's ``ent_zero_copy_buf_index``. The server then issues
+``IORING_OP_READ_FIXED`` / ``IORING_OP_WRITE_FIXED`` against that index to
+transfer the data directly to/from the client's pages.
+
+For such a request, ``payload_sz`` includes the zero-copied page bytes
+(transferred via the registered buffer at ``ent_zero_copy_buf_index``). Any
+non-page-backed args (e.g. op headers) are still copied through the pool
+payload buffer at ``offset``.
-- 
2.52.0

