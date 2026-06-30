Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4161D288530
	for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 21:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854223; cv=none; b=CCNqKNN0lj9HY9YdvwfySXO5RwrrUhJWum9HBrd3YoYQSTY3Zk6HI0Qd2petyjYDT8CvKLSU6Un13nIpTYrpxtQyE8c6cVYINbc/r5vg00gUaXrkFMDQEUMZf91APOQQuvo0T4sLGERAF8W/aZGBPFoRtsT9znLGe0U6X5WzWuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854223; c=relaxed/simple;
	bh=wXxcic38PSWRHAk5SFPOMzdb/55ionWphLKOlqk3EPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zqo3eYBm5vKqexxExZV1lyN3AtpIkLsHsIfX71SWs8SnbsP2IXrBwpQ+eELgzRxumdiq1gN0HMo1UO4RxP41CZ7OK6V3QXNMPlzay2vrphNi4HS/9ybRY10ZIFkOM0JQVYZ+CW727w6WTNmZz7BWSPioUglsGDpjESDpEXZMcOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBa54lu3; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBa54lu3"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e9c6ae2a79so2221773a34.3
        for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 14:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782854221; x=1783459021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U86vXnpQ8dU6zAjp09lEhdprx2GxT7aU0mQqX+/pNoI=;
        b=iBa54lu3xpY9V2qs/q/s46aB3QRVWy5uCxw62LA57C0OSit43jEzvPCEHKuLJkKEC3
         wcpQ4O3uM1odR9k1HrN1/QkVETexUgA7hgm9kDUPuNsaOER+CC3SLIkc2wVs9rbvfkS2
         ogCWllPXviY9yYFq1qlohdlzGMirSayuRgE2oMwfzOnXdkzTrG3rMXiT8JYCc/+DnZUC
         UDh68YZfCcm631VDDkIcENEj3wW6FaL6v89YNjfCmqn+yJHI6rxcdcdnNMeckBnYKzVT
         JjX0gF1jgSfBKHFS/QDQCozh43slDtftsTw8SKDfcwQvTlFPZX975CpghIi4n2bVqPV+
         vbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854221; x=1783459021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U86vXnpQ8dU6zAjp09lEhdprx2GxT7aU0mQqX+/pNoI=;
        b=sEZj7qcNi/5vMuAClftIKWa/OYZmfIWtglM2v3TrO2EILYQ3K1cBSDmNbAXyARfQZJ
         BvVUL1Kw83ciox8je1uVLtcFOpRAqVwhijB0zkaxKx55VthZ1ATzNS3Fu/c5M5s+hmsk
         Uaup8nbWbe7S3FnjoIN2htQtsmEhf8DBnNYKYrQJ8+ijwweNN3lQQfQF93+3Z9N7+hA7
         dKlc7H50G13Owzobqp6xmAqUXcBOQHEgjCSqYANLbCgteJ42O5n78+2pg7D6nYDZ0O5g
         A1axDqIktuvcj7hmSSNQDbPiOINYgW/9EId+ITWtr8ONUzB/RBGMXgkmsId9tI26qigh
         ijzA==
X-Forwarded-Encrypted: i=1; AFNElJ/K9mL+fvY1mZ8yEpou28V5fxMJSQn8iGp6Mq91G4DlNTDV5kBpKT9qMyzh1MLd5Xwffj7v2GpHzBAE@lists.linux.dev
X-Gm-Message-State: AOJu0YzXLbtx1PbAXDsuRnUOzeXAO1h5eZQ0CMu8hDHqzjyMsW01T0GI
	Pkpvcg4hmZQglw57EJxwwxSeoOVOcgg66rOSzlzCoZFAOifLqXG+a+Kr
X-Gm-Gg: AfdE7cm1Hta3+JpO+m63qNpI3yTzcmrjHLao2eUDIhx45finvOSh0QskhaspaL0fjdx
	6Q3TqF+rD+7zeeuFduKWc5Tz3pnsYicD5/HfZM6I4g8xBu7r9SxyQpF5gRi4NBzx43yw7uT9hfM
	5VySIeBE+2yR7FLO5tqNVgr8rI2Pyu0rzgsMH+F8yTQyDX4wIpBIOqUmCyiH93vv1KnvmXPSZeY
	+1gwmTqC9hXie2iSpyBRyw4HsYCByB8zE5ystfmnzSseLfwrT6smeatQRBg+mQwqHBd3gmyC6hk
	2k+2Noz23ujn/63qgvRNYL4Z/QYgiMbItubgvLN3ptsG5SbYnMFOb5buNBVcaYUCLVsGXxobXxs
	aVDv/KU9uvtE5prd6ySbFXR4xDefroM/kGISFlq4f6RbHc2DOMjql570lPYs0p5QuGj+QRmikyj
	xsF3B3re+cSdGQ8hrePuRuG6TEtf+gsAIgxR3ur3yg/sH+fiZ6ThZbh3i1QY8hgWk=
X-Received: by 2002:a05:6830:2b08:b0:7e9:b4d0:df76 with SMTP id 46e09a7af769-7e9ec7f5f41mr4071932a34.30.1782854221243;
        Tue, 30 Jun 2026 14:17:01 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:1::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec2e353fsm3246572a34.20.2026.06.30.14.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:17:00 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v5 6/6] docs: fuse: document io-uring buffer pool and zero-copy uapi
Date: Tue, 30 Jun 2026 14:14:35 -0700
Message-ID: <20260630211436.2062816-7-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260630211436.2062816-1-joannelkoong@gmail.com>
References: <20260630211436.2062816-1-joannelkoong@gmail.com>
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
 .../filesystems/fuse/fuse-io-uring.rst        |   5 +-
 Documentation/filesystems/fuse/index.rst      |   1 +
 .../filesystems/fuse/uapi/io-uring.rst        | 143 ++++++++++++++++++
 3 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/filesystems/fuse/uapi/io-uring.rst

diff --git a/Documentation/filesystems/fuse/fuse-io-uring.rst b/Documentation/filesystems/fuse/fuse-io-uring.rst
index d73dd0dbd238..a92dee057d78 100644
--- a/Documentation/filesystems/fuse/fuse-io-uring.rst
+++ b/Documentation/filesystems/fuse/fuse-io-uring.rst
@@ -95,5 +95,8 @@ Sending requests with CQEs
  |    <fuse_unlink()                         |
  |  <sys_unlink()                            |
 
-
+Buffer pools and zero-copy
+==========================
+For the userspace protocol used to set up buffer pools and zero-copy, see
+Documentation/filesystems/fuse/uapi/io-uring.rst.
 
diff --git a/Documentation/filesystems/fuse/index.rst b/Documentation/filesystems/fuse/index.rst
index 393a845214da..0ee75d9df2dd 100644
--- a/Documentation/filesystems/fuse/index.rst
+++ b/Documentation/filesystems/fuse/index.rst
@@ -12,3 +12,4 @@ FUSE (Filesystem in Userspace) Technical Documentation
    fuse-io
    fuse-io-uring
    fuse-passthrough
+   uapi/io-uring
diff --git a/Documentation/filesystems/fuse/uapi/io-uring.rst b/Documentation/filesystems/fuse/uapi/io-uring.rst
new file mode 100644
index 000000000000..29f921782fed
--- /dev/null
+++ b/Documentation/filesystems/fuse/uapi/io-uring.rst
@@ -0,0 +1,143 @@
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
+
+Without a buffer pool, every entry needs to pass a dedicated payload buffer
+large enough for the maximum payload size. A buffer pool decouples entries
+from payload buffers. The server hands the kernel one contiguous region and
+when the kernel sends the server a request, it indicates the offset into the
+buffer pool for that request's payload.
+
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
+A server may register the pool region with io_uring as a fixed buffer. The
+backing pages are then pinned once, avoiding per-request pinning and address
+translation. The server should pass ``FUSE_URING_REGISTERED_BUFPOOL`` as a flag
+to ``ADD_BUFPOOL`` and set ``IORING_URING_CMD_FIXED`` in
+``sqe->uring_cmd_flags`` and put the index of the registered bufppol in
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
+
+Zero-copy lets the server read from / write to the client's pages (pinned
+user pages for direct I/O, or page-cache folios for buffered I/O) without an
+intermediary payload copy. Because it grants the server direct access to
+those pages, it requires ``CAP_SYS_ADMIN``.
+
+Requirements:
+
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

