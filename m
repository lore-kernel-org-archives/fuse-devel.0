Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FB93624D4
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 21:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298430; cv=none; b=l5zWUcMIpb6g9jKua+x8IlsRQ66xBhuxwhMvmQlbHmonZxFRb4NKC60jZv60/JHjBmOtvFkgtqRAXFeZ89calOiKSOGlIrcHslm+GPHUxAVqlYKn1V/IT7X7kzrgpt+32FdkAr6k0Yu2ScgitKRmBNy4ynIb/hidigMcwXRoF+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298430; c=relaxed/simple;
	bh=PVDTirPHSP0zXaBrJFn0PYxYYwgzNAI08obzj63Xnb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KX+pXLhfTpHg2auU7KcvB15fItmDplmwxRu5pRIuEOUKzI6OWUSflW27zmYiJ6hIHVWK2AyNV9hIgWp0iRS6IBJJCCXcf5tRsn+sCGcFU5s7bWKzQD/BMoJzn2OZ5cqZIh0zgWs7qXyDSWz6nZvNbsLa+QkNT1FuaJ53HMtIldA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mmc0raG0; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mmc0raG0"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so10256755ad.0
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 14:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781298428; x=1781903228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYpKU670VHHuCbrnOyPVV/DD4rQDGr6galGO6O2TOt0=;
        b=Mmc0raG0mA4ng+F/s5PE6+SZEOaHxdcFywV6Km8JLEb5mmsnQSzsQlb5w4BOWr8TiG
         +irK06xd/nQjYqUPEXtHL1xFHuVIBNg/gFIrIl+snfoIWcqWgReQOyTdbk86DTMQ1HF3
         QdWl1p24MBKUDigWbfFPhFaJv9bBHdIqGAHbuwQ3pj0+a/pqcNubJ4oPkD3ttSmYq8Sr
         c+FPJ6gAZ9T5U29RI8oKYuRk5HTVdTSVz3rVcmjclGbjumGCvEdyIIr+vmGflN7H0V1f
         UHQwN7KRPPzwhA6c+PYi/ObG5IvVihTI/O4HuNIC4YtUsf39+//z6CM/7q4GKc5H/uOZ
         s6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781298428; x=1781903228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tYpKU670VHHuCbrnOyPVV/DD4rQDGr6galGO6O2TOt0=;
        b=gODrsN1VHkiG+aEOTIN6ys2eODpQk5xtKXAz5Px3YWi1TFipWQ6D6d4O+vlUDER0ny
         bAQsAzoXc5zClT1Yzo8ONWgpR4F5evO6+lFWY9VwYR56N6MKFzDenz1iODQOJyET+9Dq
         ttYjVlqV/usSABGK8vCDZtfLrGbVcJTHObu9nJiW7wvW06GpQk/dd2RENbBHePg0rwqy
         3kL+9vB/k2KWXKVhPjRhcUhBvOmh/euhqcHfcSc0m6Vv8OIY4a6YM8so8C+s0t9BjLl/
         ChPptcmmHJy6V2tv8g0EX/1k8lFUGvKzirNRZ7YywKwroayCTN1B47aAlLWTIEFvpJtg
         0X8w==
X-Gm-Message-State: AOJu0Yw4Go7TPzBnYXeoZ4bIrpTHKbHPOokG2/NWqabs8SK37CKhda4l
	IviBoAPv3g9Y7B4fEtuGOwf+NXrEhM+TcwSRmZ5A5FRc+i01gFLwLNRw
X-Gm-Gg: Acq92OFRJkRJb+sr8Coj2Isdbb6iKNdvIKg+CEmx94vrV/sjpe3b0ZU6Eu55kz82ty6
	Bh1koC+lsg+5pRnx0Z67oxocO0KaR3jTCv/wh+ytKkSJ0YYYKcxvKQT2v2Bm23VMF31J1rB3QwY
	Fw6asRrZziY9/OpN1j3/b/FyZg2siBw9+2H7FE1L3Ba2srqrvXLtRN9+rFurVfTH3pJA/pu+jIa
	AmSKuH/pM7sqf4woaelawdiWXAnV3Il/J7RvkQWEaOr+AtGq+CGT9llmDc0pkfxh/cb81z4cRsl
	Y6Ky7iYpVZ5B44M4Jxj/h26BGMaXRr/j9CNgH0CY8vcQZyR7iwL+0Q+ZDebUpLSUJcPXacfeWux
	7Mumc6owuDgzOfZkZGON4CTYqNqRhz+5j65P4KqjCoVY8Apbpx1q8+yZguhnZvqidQfKzA1h4Q6
	k3HFVgmtU+QnT7PfIodDvB4zBd/DQQLgbjKiGTDsb7emwFwhpErMTQ4NfaYi4XeHJ8h7wkqMUHf
	KrkwNu1rA==
X-Received: by 2002:a17:902:c941:b0:2c2:78c4:b74e with SMTP id d9443c01a7336-2c411d79d0cmr51930495ad.27.1781298428409;
        Fri, 12 Jun 2026 14:07:08 -0700 (PDT)
Received: from localhost ([2a03:2880:ff::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c43355843esm31512215ad.80.2026.06.12.14.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 14:07:07 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	axboe@kernel.dk,
	jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	bernd@bsbernd.com
Subject: [PATCH v4 10/10] docs: fuse: add io-uring buffer pool and zero-copy documentation
Date: Fri, 12 Jun 2026 14:05:13 -0700
Message-ID: <20260612210513.1516038-11-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260612210513.1516038-1-joannelkoong@gmail.com>
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
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
Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 .../filesystems/fuse/fuse-io-uring.rst        | 194 ++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/Documentation/filesystems/fuse/fuse-io-uring.rst b/Documentation/filesystems/fuse/fuse-io-uring.rst
index d73dd0dbd238..11d298e47f66 100644
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
+the first sqe. The server needs to pass init.buf_size and init.nr_bufs
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

