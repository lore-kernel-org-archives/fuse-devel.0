Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A70F4ADD9B
	for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 19:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734050; cv=none; b=VTsXKyhL7Pnxa+gDDSk3RgZLRYM4VcPtyY99ssQXQdVdbpDEj9SfXp5oaQ403aj1ytrpDQKLF/FstNXxr4VWK0n6ouXQ99WsEFTLs5RT3fwCBwpBLEQE6aQcTQA6lh1A1gKbE6reB9aV66WpRG7QwjzPbv9AUrNGwYjEmg3mdk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734050; c=relaxed/simple;
	bh=1QC6L8Ncv1Tg5hPEdv+OQr86E7Gvppg5xWUQOT+qnxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9HkejypCYTRV0h3eljMws/b+cLmFizxAu8jOG+RmUkrJ4wffsiIzSQEY3C5GMPCInWvfKqUWPbZ1VlQJQGCAzfiTc8gjjETgEUDMYyjnfq85HfOJuhjaxcMiXhZCIJroQOm3Q4eJvDIuJz7ecG0fxK9GgBkPzsSIrkf1N5VOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUSQ3XGJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUSQ3XGJ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so18344985ad.1
        for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 12:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786734042; x=1787338842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mzMerttDsOfbpanKYvzPBMaaP/LbFZq2gC3FgUEkFw=;
        b=WUSQ3XGJDoUI8q/j6+9WkJVfUBxDu/i8vBAq7fKo/Q0rAt4opKlv5wU/jhayUyxEQV
         wt/MvylIDcmFn5EBeJPmIuFAU0fjLmAShZrtc1Unxap2xbnmuVIzGbPIBlFnPwmWj0ty
         05Hr62JcivKAlqPzYTN9C+nGmeLj6I/B9QPEJOvvF7g2oOTqVW9iYpxC3J/uqUzeZNoR
         KDUtSThqbf5z7pmLbMpCIQnKDxxWSDZFZh1pgDjgUnf2NAMIrYa1ZMn9E+Spik1qSHnM
         pECRyGlnG+OMKKnOyEiYIFYL9qBNZvvWisgCmvUbLFAeLXRhAZnrezvcIEl2B+nh+ffC
         t1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734042; x=1787338842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4mzMerttDsOfbpanKYvzPBMaaP/LbFZq2gC3FgUEkFw=;
        b=VXrrdXORUeg5b4GC47RgfhMgG0XZcutzUr5mLRrkSblWUovYbj8DxD7ryTzTSVPsBU
         AVLez8QAUJU8hmJVKZzERRP7iYOx7W7X6gpuLPfOjz1Pjh3yyEgM6O2IEBl1bL7dIrEo
         sesIEyWOgsP0fWDW659z6A8OgKzNlXtk/WBN7vzu17Eix6sYlcNcQZzftlPGdbPU1Kzd
         U6It2SCNofgxSJOAjEv9yy04w1+q5KFkY5U3v0trZ1rEoemOKHwd1WPo8Fg3NC5fdZtv
         UeFD8LcZntDtPRIeEvXAZPj9dTq6pEoyKV6fk1LublgBYEheCVNIEdgOm//NhktkgbLM
         SkAg==
X-Forwarded-Encrypted: i=1; AHgh+RrgNG88gcNi0hxaEvNUsrLaYb+zcfWCyJhEnrH6XFyYeStcjiEYfPmoXRH1Tx+W5Ayad0kuOVAk+a5s@lists.linux.dev
X-Gm-Message-State: AOJu0YzfNZMMOECLmnPjF/yfjqogE39b/JykkhhD7JD7AHvzfADIuygr
	E7VUd8L1v2S3PMBV+OdOrPAKDZzNEn6qjfuDhLux3PckVLeGHh1fsc6z7R0I1g==
X-Gm-Gg: AR+sD11+cUc5IvjnjdLG+MC69qNapgVZvRcv6maKgBlzXv34kS590DvioeMHJmMBjDN
	2TaQOD2YnjdiWhozB50n6a3xeGlmySMQwpMvVs6QSjf3wE7xcXW4U47/7aQETjjVAGvGp60U9Ye
	VXMr7B5e+AsBZSur0EpAXHsVepSLTKyQozhy3utwnXO+BI7hfBX9kXtLkT+TnHk79omlPfY1qNJ
	G2u42Fie8BhBfmQ+gOKhX9C27dHPrhiWhXyKfFblNCk8arDbmR/Ndh22FdmkgIGvKvyOvn01iC7
	k/V5TjdC0wvNoMvfQ60k1PcAGdH7iFO3/Oyyqg7pIJ9cFVIfxSxNZAwyvBtF0lp9mynxQK5vJxD
	XbbtrzR0LOLHYAyVCOYMmqKKK+8IXiREtZcPeD4fQJEkC2mmx+sYIqwEODeCYDSkYnTYWDyAIFN
	3fQitp1bLPgYDMziVLDzTbN0n7uFz1mgJADmZSOf8rn4ffa9UsV95By0RiXWEZ5KL8Mg49HXAN/
	oikmnIDkLoCe70qy7nJ8CbPDnaJAXBOaD6AdiFe
X-Received: by 2002:a17:902:e80b:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2d3b0cebeaemr92728785ad.21.1786734041508;
        Fri, 14 Aug 2026 12:00:41 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:55::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae805f4dsm14248995ad.37.2026.08.14.12.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:00:40 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	amir73il@gmail.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v7 6/6] docs: fuse: document io-uring buffer pool and zero-copy uapi
Date: Fri, 14 Aug 2026 11:59:46 -0700
Message-ID: <20260814185946.3679478-7-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260814185946.3679478-1-joannelkoong@gmail.com>
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for fuse over io-uring usage of buffer pools and
zero-copy.

Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 .../filesystems/fuse/fuse-io-uring.rst        |  36 ++++-
 Documentation/filesystems/fuse/index.rst      |   1 +
 .../fuse/uapi/fuse-uapi-io-uring.rst          | 126 ++++++++++++++++++
 3 files changed, 161 insertions(+), 2 deletions(-)
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
index 000000000000..8367be7ea29d
--- /dev/null
+++ b/Documentation/filesystems/fuse/uapi/fuse-uapi-io-uring.rst
@@ -0,0 +1,126 @@
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
+  registering any payload-carrying entries on that queue.
+  ``fuse_uring_cmd_req.flags`` must be 0. Submitting this command with
+  ``IORING_URING_CMD_FIXED`` marks the pool as registered, which avoids per
+  i/o pinning/unpinning and mapping overhead (see `Buffer pools`_).
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
+``bufpool.reserved``          Must be 0, for ``ADD_BUFPOOL``.
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
+To use registered buffers, the server registers the pool region with io_uring
+and submits ``ADD_BUFPOOL`` with ``IORING_URING_CMD_FIXED`` set in
+``sqe->uring_cmd_flags`` and the index of the registered bufpool in
+``sqe->buf_index``. Every SQE the server submits afterwards must follow the
+same fixed-buffer protocol, carrying ``IORING_URING_CMD_FIXED`` and that same
+``sqe->buf_index``. The same registered buffer can be reused for the server's
+backing-store I/O as well (e.g. ``IORING_OP_READ_FIXED`` /
+``IORING_OP_WRITE_FIXED``).
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

