Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0723D0BE4
	for <fuse-devel@lists.linux.dev>; Tue,  2 Jun 2026 09:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780393044; cv=none; b=kPR10BCX912ACSiGJJEM2RuB/MHPl4EIxNXr9nZ6Yd4ELeGSlhZqMPl9HzvAWGFzJJbv+zTuOqfnS8ZqqpI2m6s4138/93fbnemzF8QxCrsSNidT1F46cXabTcgnGHns8PksB670roGqYSNuetEQYyB8Jy/kteTtDe/MTG0UCSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780393044; c=relaxed/simple;
	bh=MgWE8zf7mIu2HiY7Aocnt1hYv5Fr/cnUdG5p1m7dneU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rb04KKugESpl7lulAifyiTkf2jFArDPZrU5lH3FOyKFZ0Qn6sFq2NdvjMhhgJPV+QGnmw34WDI21Wm7/Wbl5uhwabpcYw7oNui8N2H1LF7wZLEQzlIcxokGqNscYo5GSphElGxyOVtATfRHKOyxEHqcfX9/tDNzszuzZlhVQIzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=b6gx0/gY; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="b6gx0/gY"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780393037; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=xg+0duyyUuSuq2n0Q5HwnAmk1WB/jXDpfZ3sPNE5l/k=;
	b=b6gx0/gYcbdHgZ46Jrv51AVlss1ZwodM0Pe73/SyUfC44lkDMhMyKDURul2YcSVDDwunPolIRkkqYhk/C38py8rNYrwf5aFTW3gT6e9jUvHTN3+qw9luu2MFN7tTTbIP7Pwc6o3euUNmxB9ACkcgvYoQqXFOEbqji8OTBh7IA/I=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0X442hlE_1780393035;
Received: from 30.221.147.232(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X442hlE_1780393035 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 17:37:16 +0800
Message-ID: <5a38fc7f-ed3c-41a8-a100-bdff5ab962f5@linux.alibaba.com>
Date: Tue, 2 Jun 2026 17:37:15 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] docs: fuse: add io-uring buffer pool and
 zero-copy documentation
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, bernd@bsbernd.com, jlayton@kernel.org,
 axboe@kernel.dk, fuse-devel@lists.linux.dev
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <20260522205823.1597313-11-joannelkoong@gmail.com>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <20260522205823.1597313-11-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/5/23 04:58, Joanne Koong wrote:
> Add documentation for fuse over io-uring usage of buffer pools and
> zero-copy.
>
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Looks good to me, just one nit below:

Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>

> ---
>  .../filesystems/fuse/fuse-io-uring.rst        | 194 ++++++++++++++++++
>  1 file changed, 194 insertions(+)
>
> diff --git a/Documentation/filesystems/fuse/fuse-io-uring.rst b/Documentation/filesystems/fuse/fuse-io-uring.rst
> index d73dd0dbd238..79003ddd44fe 100644
> --- a/Documentation/filesystems/fuse/fuse-io-uring.rst
> +++ b/Documentation/filesystems/fuse/fuse-io-uring.rst
> @@ -95,5 +95,199 @@ Sending requests with CQEs
>   |    <fuse_unlink()                         |
>   |  <sys_unlink()                            |
>  
> +Buffer pools
> +============
>  
> +Buffer pools decouple the 1:1 relationship between ents and payload buffers,
> +which allow for more optimal usage of memory. Entries only 'reserve' a buffer
> +when actively processing a request that requires a payload buffer. This
> +decoupling also allows for optimizations such as incremental buffer
> +consumption which will allow non-overlapping regions of a single buffer to be
> +used simultaneously across multiple ents/requests, and the possibility of
> +multiple buffer sizes to be supported per ring in the future.
>  
> +To use this, the server must set the FUSE_URING_BUFPOOL flag during
> +registration and provide the payload buffer pool through the iovec payload in
> +in the first sqe. The server needs to pass init.buf_size and init.nr_bufs

Nit: "the iovec payload in in the first sqe" has a duplicated "in".


> +describing the buffer pool configuration in the struct fuse_uring_cmd_req it
> +passes to the kernel. Buffer pool usage is set on a per-ring basis. Please
> +note that all subsequent registration SQEs for the same ring must pass in
> +consistent flags.
> +
> +Internally, fuse manages the buffer pool through a buffer ring. At a
> +high-level, this is how it works:
> +
> +* The first REGISTER SQE for a queue creates the queue and sets up the
> +  buffer pool. The server passes in the allocated buffer pool in the first
> +  registration sqe in iovec[1].
> +* When a client request arrives, if the request has copyable data, the kernel
> +  selects a buffer from the ring, copies headers and payload data, and
> +  completes the sqe.
> +* The buf_id of the selected payload buffer is communicated to the server
> +  via the fuse_uring_ent_in_out header. The server uses this to locate the
> +  payload buffer corresponding to the request.
> +* The server processes the request and sends a COMMIT_AND_FETCH SQE with
> +  the reply. The kernel processes the reply and recycles the buffer.
> +
> +Visually, this looks like::
> +
> + Payload buffer pool:
> + +-----------+-----------+-----------+-----+
> + | buf 0     | buf 1     | buf 2     | ... |
> + | (buf_size)| (buf_size)| (buf_size)|     |
> + +-----------+-----------+-----------+-----+
> + selected on demand, recycled after each request
> +
> +Buffer pool request flow
> +------------------------::
> +
> +|  Kernel                                  |  FUSE daemon
> +|                                          |
> +|  [client request arrives]                |
> +|  >fuse_uring_send()                      |
> +|    [select payload buf from pool]        |
> +|    >fuse_uring_select_buffer()           |
> +|    >copy_header_to_ring()                |
> +|    [copy payload to selected buf]        |
> +|    >fuse_uring_copy_to_ring()            |
> +|    [set buf_id in ent_in_out header]     |
> +|    >io_uring_cmd_done()                  |
> +|                                          |  [CQE received]
> +|                                          |  [read header]
> +|                                          |  [read payload from buf_id]
> +|                                          |  [process request]
> +|                                          |  [write reply to header]
> +|                                          |  [write reply payload to buf]
> +|                                          |  >io_uring_submit()
> +|                                          |   COMMIT_AND_FETCH
> +|  >fuse_uring_commit_fetch()              |
> +|    >fuse_uring_commit()                  |
> +|     [copy reply from ring]               |
> +|     >fuse_uring_recycle_buffer()         |
> +|    >fuse_uring_get_next_fuse_req()       |
> +
> +Registered buffers
> +==================
> +
> +Servers can pass in an io-uring registered buffer as the buffer pool. When the
> +server registers buffers with io-uring, the pages backing the buffers are
> +pinned upfront. This eliminates the overhead of pinning/unpinning user pages
> +and translating virtual addresses per i/o request. This also allows servers to
> +use the same registered buffers for subsequent backing store I/O (eg
> +read_fixed/write_fixed), keeping data in the same pinned pages without
> +additional pinning or mapping overhead required.
> +
> +Registered buffers require the buffer pool (FUSE_URING_BUFPOOL) to be
> +enabled. To use registered buffers, the server needs to register the
> +payload buffers through io-uring and during registration, set the
> +FUSE_URING_REGISTERED_BUFFERS init flag (alongside the
> +FUSE_URING_BUFPOOL flag) in the registration sqe. For all sqes the
> +server passes in (including the registration ones), it needs to follow
> +standard protocol for using registered buffers (eg set
> +sqe->uring_cmd_flags to include IORING_URING_CMD_FIXED, and pass in the
> +index where the registered buffers reside to sqe->buf_index). For an example
> +of how to set this up, please refer to the libfuse/lib/fuse_uring.c file.
> +
> +Zero-copy
> +=========
> +
> +Fuse io-uring zero-copy allows the server to directly read from / write to
> +the client's pages, bypassing any intermediary buffer copies. This requires
> +the FUSE_URING_ZERO_COPY flag and requires the server to use registered
> +buffers. This requires CAP_SYS_ADMIN privileges as zero-copy allows the server
> +direct access to the client's underlying pages, rather than operating on an
> +intermediary buffer that the contents of client's pages were copied into or on
> +page cache folios.
> +
> +When a fuse request arrives, the kernel registers the relevant pages (pinned
> +user pages for direct i/o or underlying page cache folios for buffered i/o)
> +into a sparse slot in the server's io_uring registered buffer table. The
> +server can then operate on these pages directly using io-uring fixed buffer
> +operations (eg read_fixed / write_fixed) and the kernel unregisters these
> +pages when the request completes. Non-page-backed args (eg op out headers)
> +will go through the payload buffer as normal.
> +
> +The request flow for the zero-copy write path (client writes data, server
> +reads it) is as follows:
> +
> +Zero-copy write
> +---------------::
> +|  Kernel                                   |  FUSE server
> +|                                           |
> +|  "write(fd, buf, 1MB)"                    |
> +|                                           |
> +|  >sys_write()                             |
> +|    >fuse_file_write_iter()                |
> +|      >fuse_send_one()                     |
> +|        [req->args->in_pages = true]       |
> +|        [folios hold client write data]    |
> +|                                           |
> +|  >fuse_uring_copy_to_ring()               |
> +|    >copy_header_to_ring(IN_OUT)           |
> +|      [memcpy fuse_in_header]              |
> +|    >copy_header_to_ring(OP)               |
> +|      [memcpy write_in header]             |
> +|                                           |
> +|    >fuse_uring_args_to_ring()             |
> +|      >setup_fuse_copy_state()             |
> +|        [skip_folio_copy = true]           |
> +|                                           |
> +|      >fuse_uring_set_up_zero_copy()       |
> +|        [folio_get for each client folio]  |
> +|        [build bio_vec array from folios]  |
> +|        >io_buffer_register_bvec()         |
> +|          [register pages at               |
> +|                ent->zero_copy_index]      |
> +|        [ent->zero_copied = true]          |
> +|                                           |
> +|      >fuse_copy_args()                    |
> +|        [skip_folio_copy => return 0       |
> +|         for page arg, skip data copy]     |
> +|                                           |
> +|    >copy_header_to_ring(RING_ENT)         |
> +|      [memcpy ent_in_out]                  |
> +|    >io_uring_cmd_done()                   |
> +|                                           |
> +|                                           | [CQE received]
> +|                                           |
> +|                                           | [issue io_uring READ at
> +|                                           |  ent->zero_copy_index]
> +|                                           | [reads directly from
> +|                                           | client's pages (ZERO_COPY)]
> +|                                           |
> +|                                           | [write data to backing
> +|                                           | store]
> +|                                           |  [submit COMMIT AND FETCH]
> +|                                           |
> +|  >fuse_uring_commit_fetch()               |
> +|    >fuse_uring_commit()                   |
> +|      >fuse_uring_copy_from_ring()         |
> +|    >fuse_uring_req_end()                  |
> +|      >io_buffer_unregister(ent->zero_copy_index) |
> +|        [unregister sparse buffer]         |
> +|      >fuse_zero_copy_release()            |
> +|        [folio_put for each folio]         |
> +|      [ent->zero_copied = false]           |
> +|      >fuse_request_end()                  |
> +|        [wake up client]                   |
> +
> +The zero-copy read path is analogous.
> +
> +Some requests may have both page-backed args and non-page-backed args.
> +For these requests, the page-backed args are zero-copied while the
> +non-page-backed args are copied to the buffer selected from the buffer
> +pool:
> +  zero-copy: pages registered via io_buffer_register_bvec()
> +  non-page-backed: copied to payload buffer via fuse_copy_args()
> +
> +For a request whose payload is zero-copied, the registration/unregistration
> +path looks like:
> +
> +register:  fuse_uring_set_up_zero_copy()
> +	     folio_get() for each folio
> +	     io_buffer_register_bvec(ent->zero_copy_index)
> +
> +unregister: fuse_uring_req_end()
> +	      io_buffer_unregister(ent->zero_copy_index)
> +	      -> fuse_zero_copy_release() callback
> +		 folio_put() for each folio


