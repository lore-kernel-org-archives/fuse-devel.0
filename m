Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D92C372073
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 20:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779483578; cv=none; b=iyvWoIUEIKQXsyBL3g0/1YOBDBI+XNHX3yaLIFYVJd5EkuXzzu2y4RBjFZBzjipxN6/s1qe8MBPVMZiXzEZjQzCrotI63n2u6aVkqe5RzujqmNS6+Q1sJbLOr38HNavq0uqqqio66WPzJPrZaOK2lj6v+42KXr7rRrpOoT7CJas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779483578; c=relaxed/simple;
	bh=6TCsK5tGXSn6hkviNyl3LaxJOm7tKRl1iouwm4mipcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8xZVDZftULLYBBkePTbq6PffZh7pDGXfBjzjif162PCUcvz4+8+W7KazDLgt9k7zG7ESCtTYfJux5s8a5tc4AF6CdKAKEbge0lpHTLp0h9Vz9nbu0txElFdLeZuP+Gx0uH14AkhVF3EYzUipPNhFJQIsGD/39/fN+IMneRCtPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iesiXBqs; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iesiXBqs"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7d1bcb92072so29526827b3.1
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 13:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779483576; x=1780088376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VC13QyPFZ17M1Q3DGCfqyuJaU0CmyTmQo4MI5UlFoc=;
        b=iesiXBqsuSdHuf721HUrIJ+XJowi7AYoscOB1w1LnGsRAe2f1iOmuQxafJDnduefiL
         IKscfmwyArIHYSkztNRKwwITXfXjWQD5erZpGRwE4uEwIUArWREsUwLeeph9SoZ596t8
         ZmNHi+VjlarCBbrrLhrjwduwh8nZ0MuSZaPMZXSm15HBNCgmAPjyQCJ5QUzTASyYCdd/
         1aBdvCI1Tgqvk9oHKUuJw2f+EiFol6JRYiAZM11s02iraHti1ZKT2mtjEHvAfeO2Z6zc
         RrEU//Q8SxGI37a54vgRpEEYlFE5s/GrWL2QMzLSE3MmAqmlVZpFEN0OAthWl/vXEk3+
         AddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779483576; x=1780088376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5VC13QyPFZ17M1Q3DGCfqyuJaU0CmyTmQo4MI5UlFoc=;
        b=mZUtNhQeElHXDNxmBDTmi/FfYDlfNOi7NqJKcGSACKqXphp6QpfXVLqHleYzvd6W5x
         qRf0tgrul27N1UH3c1KduQVrGQ5qB+Mkg8YdijnpdZcpkSbtB2BLcLvgO90azvL36fdL
         QrNd3hG2zNv/uvM+adEhNLOrZpEQDng4RdCbBeH/N7jTgZsMm+Sp6p9T5C5zYvfeQvOy
         ZpSyLHqZX/2LRyWp5VdV1rPrHMaIM7dX0HaBBacXMpexV6kMq3b8K//zt37yMvm5wn8I
         fzBAJK/IFBGXJQD67EbRbQKyuaDTvakTNx/z64ofL6EAwU/IlZ8YKRajSagRNvi4AI1E
         d09A==
X-Forwarded-Encrypted: i=1; AFNElJ+z+kagrhWbHFbZcEHLZYXcpLVEEQKuqHAre+bZ0hru35o3TSpzz6TnpL+6WSR7ikod7OTEugCFtfTS@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Ij/CcR5IO7HOmrL1YRlJy5pdPgD8NDyxFfaFEyDD2rtn3tNG
	1D8zZ74Gp4WjmajaWeJaDby1eqzghmfHYHcw4eQMlESu8oJR4zTNOS/I
X-Gm-Gg: Acq92OGrKHVR9ew387Ikiw77odKGgV5OF5V7miDJfDoRqGpCQnk+kfmOIbBvg52uoA4
	MDO45FHUeXyMZTz12Q1HiGTwmli4Rx3MwboiZUeCX5qx/4n2VJr4j1LFTR4YsKNeklqfEgH9Zlk
	RpoMWqVEqRsFsPsA/xznnRbnA3P3R72AeLKExOS9o+NHMzVdSGDxrq7hj8PaLXc5xX7wjzzuqGb
	lGDJ1qiqRWR7jMgU6kem5Pll+iWhPCOOIwZ/YNhGft9TnViXpRADev08nKibJD2l7OnTo0oS7UT
	Aru4C9KmyZc3VyNF4q7Ezt7i/PrkXJNiDhY8YXoavcSEK4Cu/jYor85TTOkZXnml8yMITUnOOme
	2Wecr+PegyXOnT9dcyE028CSlDQoNEL/VQJMuHSEiJYLCapL/HTLF9eO8q6S5fm7Ng2o39ZqEna
	NIOy2JenFn0/alXhc/xrb2yStp2kMj
X-Received: by 2002:a05:690e:43c3:b0:65d:6eed:4a4e with SMTP id 956f58d0204a3-65ec9772e75mr3856508d50.24.1779483576030;
        Fri, 22 May 2026 13:59:36 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:52::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65ecfd5c9dasm1214285d50.13.2026.05.22.13.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:59:35 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	jlayton@kernel.org,
	axboe@kernel.dk,
	fuse-devel@lists.linux.dev
Subject: [PATCH v3 10/10] docs: fuse: add io-uring buffer pool and zero-copy documentation
Date: Fri, 22 May 2026 13:58:23 -0700
Message-ID: <20260522205823.1597313-11-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260522205823.1597313-1-joannelkoong@gmail.com>
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for fuse over io-uring usage of buffer pools and
zero-copy.

Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 .../filesystems/fuse/fuse-io-uring.rst        | 194 ++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/Documentation/filesystems/fuse/fuse-io-uring.rst b/Documentation/filesystems/fuse/fuse-io-uring.rst
index d73dd0dbd238..79003ddd44fe 100644
--- a/Documentation/filesystems/fuse/fuse-io-uring.rst
+++ b/Documentation/filesystems/fuse/fuse-io-uring.rst
@@ -95,5 +95,199 @@ Sending requests with CQEs
  |    <fuse_unlink()                         |
  |  <sys_unlink()                            |
 
+Buffer pools
+============
 
+Buffer pools decouple the 1:1 relationship between ents and payload buffers,
+which allow for more optimal usage of memory. Entries only 'reserve' a buffer
+when actively processing a request that requires a payload buffer. This
+decoupling also allows for optimizations such as incremental buffer
+consumption which will allow non-overlapping regions of a single buffer to be
+used simultaneously across multiple ents/requests, and the possibility of
+multiple buffer sizes to be supported per ring in the future.
 
+To use this, the server must set the FUSE_URING_BUFPOOL flag during
+registration and provide the payload buffer pool through the iovec payload in
+in the first sqe. The server needs to pass init.buf_size and init.nr_bufs
+describing the buffer pool configuration in the struct fuse_uring_cmd_req it
+passes to the kernel. Buffer pool usage is set on a per-ring basis. Please
+note that all subsequent registration SQEs for the same ring must pass in
+consistent flags.
+
+Internally, fuse manages the buffer pool through a buffer ring. At a
+high-level, this is how it works:
+
+* The first REGISTER SQE for a queue creates the queue and sets up the
+  buffer pool. The server passes in the allocated buffer pool in the first
+  registration sqe in iovec[1].
+* When a client request arrives, if the request has copyable data, the kernel
+  selects a buffer from the ring, copies headers and payload data, and
+  completes the sqe.
+* The buf_id of the selected payload buffer is communicated to the server
+  via the fuse_uring_ent_in_out header. The server uses this to locate the
+  payload buffer corresponding to the request.
+* The server processes the request and sends a COMMIT_AND_FETCH SQE with
+  the reply. The kernel processes the reply and recycles the buffer.
+
+Visually, this looks like::
+
+ Payload buffer pool:
+ +-----------+-----------+-----------+-----+
+ | buf 0     | buf 1     | buf 2     | ... |
+ | (buf_size)| (buf_size)| (buf_size)|     |
+ +-----------+-----------+-----------+-----+
+ selected on demand, recycled after each request
+
+Buffer pool request flow
+------------------------::
+
+|  Kernel                                  |  FUSE daemon
+|                                          |
+|  [client request arrives]                |
+|  >fuse_uring_send()                      |
+|    [select payload buf from pool]        |
+|    >fuse_uring_select_buffer()           |
+|    >copy_header_to_ring()                |
+|    [copy payload to selected buf]        |
+|    >fuse_uring_copy_to_ring()            |
+|    [set buf_id in ent_in_out header]     |
+|    >io_uring_cmd_done()                  |
+|                                          |  [CQE received]
+|                                          |  [read header]
+|                                          |  [read payload from buf_id]
+|                                          |  [process request]
+|                                          |  [write reply to header]
+|                                          |  [write reply payload to buf]
+|                                          |  >io_uring_submit()
+|                                          |   COMMIT_AND_FETCH
+|  >fuse_uring_commit_fetch()              |
+|    >fuse_uring_commit()                  |
+|     [copy reply from ring]               |
+|     >fuse_uring_recycle_buffer()         |
+|    >fuse_uring_get_next_fuse_req()       |
+
+Registered buffers
+==================
+
+Servers can pass in an io-uring registered buffer as the buffer pool. When the
+server registers buffers with io-uring, the pages backing the buffers are
+pinned upfront. This eliminates the overhead of pinning/unpinning user pages
+and translating virtual addresses per i/o request. This also allows servers to
+use the same registered buffers for subsequent backing store I/O (eg
+read_fixed/write_fixed), keeping data in the same pinned pages without
+additional pinning or mapping overhead required.
+
+Registered buffers require the buffer pool (FUSE_URING_BUFPOOL) to be
+enabled. To use registered buffers, the server needs to register the
+payload buffers through io-uring and during registration, set the
+FUSE_URING_REGISTERED_BUFFERS init flag (alongside the
+FUSE_URING_BUFPOOL flag) in the registration sqe. For all sqes the
+server passes in (including the registration ones), it needs to follow
+standard protocol for using registered buffers (eg set
+sqe->uring_cmd_flags to include IORING_URING_CMD_FIXED, and pass in the
+index where the registered buffers reside to sqe->buf_index). For an example
+of how to set this up, please refer to the libfuse/lib/fuse_uring.c file.
+
+Zero-copy
+=========
+
+Fuse io-uring zero-copy allows the server to directly read from / write to
+the client's pages, bypassing any intermediary buffer copies. This requires
+the FUSE_URING_ZERO_COPY flag and requires the server to use registered
+buffers. This requires CAP_SYS_ADMIN privileges as zero-copy allows the server
+direct access to the client's underlying pages, rather than operating on an
+intermediary buffer that the contents of client's pages were copied into or on
+page cache folios.
+
+When a fuse request arrives, the kernel registers the relevant pages (pinned
+user pages for direct i/o or underlying page cache folios for buffered i/o)
+into a sparse slot in the server's io_uring registered buffer table. The
+server can then operate on these pages directly using io-uring fixed buffer
+operations (eg read_fixed / write_fixed) and the kernel unregisters these
+pages when the request completes. Non-page-backed args (eg op out headers)
+will go through the payload buffer as normal.
+
+The request flow for the zero-copy write path (client writes data, server
+reads it) is as follows:
+
+Zero-copy write
+---------------::
+|  Kernel                                   |  FUSE server
+|                                           |
+|  "write(fd, buf, 1MB)"                    |
+|                                           |
+|  >sys_write()                             |
+|    >fuse_file_write_iter()                |
+|      >fuse_send_one()                     |
+|        [req->args->in_pages = true]       |
+|        [folios hold client write data]    |
+|                                           |
+|  >fuse_uring_copy_to_ring()               |
+|    >copy_header_to_ring(IN_OUT)           |
+|      [memcpy fuse_in_header]              |
+|    >copy_header_to_ring(OP)               |
+|      [memcpy write_in header]             |
+|                                           |
+|    >fuse_uring_args_to_ring()             |
+|      >setup_fuse_copy_state()             |
+|        [skip_folio_copy = true]           |
+|                                           |
+|      >fuse_uring_set_up_zero_copy()       |
+|        [folio_get for each client folio]  |
+|        [build bio_vec array from folios]  |
+|        >io_buffer_register_bvec()         |
+|          [register pages at               |
+|                ent->zero_copy_index]      |
+|        [ent->zero_copied = true]          |
+|                                           |
+|      >fuse_copy_args()                    |
+|        [skip_folio_copy => return 0       |
+|         for page arg, skip data copy]     |
+|                                           |
+|    >copy_header_to_ring(RING_ENT)         |
+|      [memcpy ent_in_out]                  |
+|    >io_uring_cmd_done()                   |
+|                                           |
+|                                           | [CQE received]
+|                                           |
+|                                           | [issue io_uring READ at
+|                                           |  ent->zero_copy_index]
+|                                           | [reads directly from
+|                                           | client's pages (ZERO_COPY)]
+|                                           |
+|                                           | [write data to backing
+|                                           | store]
+|                                           |  [submit COMMIT AND FETCH]
+|                                           |
+|  >fuse_uring_commit_fetch()               |
+|    >fuse_uring_commit()                   |
+|      >fuse_uring_copy_from_ring()         |
+|    >fuse_uring_req_end()                  |
+|      >io_buffer_unregister(ent->zero_copy_index) |
+|        [unregister sparse buffer]         |
+|      >fuse_zero_copy_release()            |
+|        [folio_put for each folio]         |
+|      [ent->zero_copied = false]           |
+|      >fuse_request_end()                  |
+|        [wake up client]                   |
+
+The zero-copy read path is analogous.
+
+Some requests may have both page-backed args and non-page-backed args.
+For these requests, the page-backed args are zero-copied while the
+non-page-backed args are copied to the buffer selected from the buffer
+pool:
+  zero-copy: pages registered via io_buffer_register_bvec()
+  non-page-backed: copied to payload buffer via fuse_copy_args()
+
+For a request whose payload is zero-copied, the registration/unregistration
+path looks like:
+
+register:  fuse_uring_set_up_zero_copy()
+	     folio_get() for each folio
+	     io_buffer_register_bvec(ent->zero_copy_index)
+
+unregister: fuse_uring_req_end()
+	      io_buffer_unregister(ent->zero_copy_index)
+	      -> fuse_zero_copy_release() callback
+		 folio_put() for each folio
-- 
2.52.0

