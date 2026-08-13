Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC80F3B27E8
	for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 21:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786656050; cv=none; b=OmfX2F+IDPgwKNtEp9N9p4STmNVOt4u5Kp17RJyDQ7jUR0vQH/y2mDPe1PKJWsZXQ1Qk+YmHqsdWnYhWvvmTdoZRlW9ILDN+1imbfS2iD02bO5M9WjwBYiYC/2LBvuVZ8eiafjsaik9HAYi2UKTJ9AxeFUxJsR3dzOo7Xl1rU2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786656050; c=relaxed/simple;
	bh=dKPl/CbCtH6zqxCtODdog6fs7udBgLYyNT2kvn5mMzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CoZOnPVL3O7Qxhrvr5U5GENM5w6YlJvlbcfNqt4eUjX6h0fCbev0nUIu1VvWTpR43XPwcSP2O8OotniiD5ORQTjVguGPYgYABtn4K9CRMKYGRNv9PxMvZAQWzC5jYGPy/CoQJrWkadUESSjpgfZaR8bFzgFdn7SCRtSJ2ZJm0IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=RG7Ceif0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a7KuhGxO; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="RG7Ceif0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a7KuhGxO"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id DE2F31D0035E;
	Thu, 13 Aug 2026 17:20:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 13 Aug 2026 17:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786656045;
	 x=1786742445; bh=yrkTR9EZ/O5pI8cjmiZy/nOOco+iGrRwaIsZFzPVKMk=; b=
	RG7Ceif0VvnmBPDfYraJVwHOhO4wZYO+dIYHKnpH/dRqtPlR04PW9pOe1GuiskVq
	YiPOKRxuTOjqVU+4H+TAU9vLvhOr58Y3MkBPeIUrhQozJ6moUJkyU4JzsG4c4hC9
	+ylIRUCOBHj3IyjRU/Jl9WFpavtEV0qqmn+mzBP99ARMuVwqFjprENTRhecl0pDB
	RsXhGPGEeeMG78faTCOrMJS4q4NF/1gDmOCZ41icDbK3aXzCgdioQJ9atOlJhmPp
	dWckxu37gTst/M9eiVlX1WMSpE1+mPCuAJpkQPY0dbkghsuBcbzSthMaraU2lgJg
	/4gLITnGKnehy2rUFF8MRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786656045; x=
	1786742445; bh=yrkTR9EZ/O5pI8cjmiZy/nOOco+iGrRwaIsZFzPVKMk=; b=a
	7KuhGxOIkiyPScD8T7oeqJxWHsTDnHHVQ7+EJecirGSCImfgQilaBJKkEnB1LZk6
	2Xjpx96zejIX8l4R7k8IqFNvlYy9aj4LvKnXHbGdVVxP/kU3howwAJxd3OQCs5Ft
	99k1kjtTF0wb9+yDWxymRLbfpCdsMrrZAY3pdJS509KiOc+5y9bMz/Nnc6Q5jJS6
	hdYLxm0e6H2u1ZoDZhaAZ6QRfZjByOK5yNYba01KhXGKlewdwRBDJj4A7RgD1pt8
	MWLmnP4QqBdDvy3JX4vHHVXvNiF0MfZwxfr2tY3Qec1ZBkOa5+8FGjKasVAGgFX4
	JgTt5AIdHiVCs0LjQuNzw==
X-ME-Sender: <xms:LDV-airChqrRKA4QrOFIBJd1-sHSgk9r4hya1yNePxC6vnAF9paTQA>
    <xme:LDV-ahXWOafNXJugcsnifx0sEUhVbzSqF0_DMWxBbOMVSK2nQibAFVfrH6XjMj1C3
    y_JaZ7crAQlcE8QRX0ahjjyipQFZnoirZSl0ahSgmL5bOthH0QRoQ>
X-ME-Received: <xmr:LDV-albZBwMeNX8vGxYMGy8AJDcf6izA3sQ4wjoLNbv4pAT53f900gfwh2EEZDjE4gTjngALN3S7_gb4KYMuRxudKjz2Mk2XLkYHkIkbbdVLwER7RXrZYZAb>
X-ME-Proxy-Cause: dmFkZTF20b8oImTBDjY9LR6LjoV4jsK/9Jn3ymxFVVOWiDxCXYA2c/MEgbdpM4Xj+rA517
    c8icjuJ33xmcJ52hvI71HQ3dXPuKnJOVpQpR/FoOHlFisDisuTRwNkhJzQ47nx+yU+hTw4
    2xJ9SC8jOYpBz/AfZJfpYk2CMwdxJkXoohArDHtbGRtTcfn+lhDSGo2ytpilqwJhbWYpUB
    50PKLF7JA+S0SnV4SuPgsSpgGJ16rHmNcj0UYhOy8Ei1NglligQgC0b800csdPGDlJYa7a
    MAjj/zxmM1D6omKd2KGfkscbiVSIMPrcLu9Fu8ljg/iEbadEeIqzUuPeA2xxc8s5B59Slf
    sMY/EuwFYUKOTCwyxfRf9PQKBxZNe4XSuejzPYmthjZLT74mbS1168B1SKNMaKmgbbaqVM
    T8f9xMWoC8LIDLF8MrO7Iqyp0Nbtc2O1z98MRR+JoE7EvkY17gKWADybK2YEVx6tkVRLhS
    NcrZ5UcMRV6Y6GosKW4VvCZZPyxYUdFh/Eds95IEgpolE7Epwics6CCEW9nJAIo4Z/x6ex
    QCafgD19uFz5XkFEfniNHBD5Di/ocZABzawLGQ5+m975nj2hcweBe9SPX0OqdEdJ/Tws16
    ksaJSFVWqQq3fUJneIwuOy5RN9FtvFkfzEadXfYVWeYP8hxUMZ5VIYp+W9/Q
X-ME-Proxy: <xmx:LDV-amctMJkRQWoRNFrVhCjKfb8jODO0K-GzqTLfd0-Sk5WB_za9tw>
    <xmx:LDV-an06HCPGA3OlGNRxi0hSxB3GkMWEeTMAugHPetI5wG-lijNcLA>
    <xmx:LDV-alIwNi_xP1x34uaF2HvwE8N-z6G78R8XTbSxJlks7Y9H0GUFkQ>
    <xmx:LDV-auH8oATMDm-2v_ZXZayYRDf5KGaR3-Uq8sddvWRNxUWz1BdA9g>
    <xmx:LTV-aiaTS0iiIBCJeAC-TyuShl1torMDUZvE0S5x514CoW4PVlm7ClnX>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 17:20:42 -0400 (EDT)
Message-ID: <d3d41c2d-f8a6-4c43-8d08-78f767781277@bsbernd.com>
Date: Thu, 13 Aug 2026 23:20:40 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] docs: fuse: document io-uring buffer pool and
 zero-copy uapi
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-7-joannelkoong@gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260716175908.2339738-7-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/16/26 19:59, Joanne Koong wrote:
> Add documentation for fuse over io-uring usage of buffer pools and
> zero-copy.
> 
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  .../filesystems/fuse/fuse-io-uring.rst        |  36 ++++-
>  Documentation/filesystems/fuse/index.rst      |   1 +
>  .../fuse/uapi/fuse-uapi-io-uring.rst          | 129 ++++++++++++++++++
>  3 files changed, 164 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/filesystems/fuse/uapi/fuse-uapi-io-uring.rst
> 
> diff --git a/Documentation/filesystems/fuse/fuse-io-uring.rst b/Documentation/filesystems/fuse/fuse-io-uring.rst
> index d73dd0dbd238..29f98057500d 100644
> --- a/Documentation/filesystems/fuse/fuse-io-uring.rst
> +++ b/Documentation/filesystems/fuse/fuse-io-uring.rst
> @@ -11,6 +11,9 @@ and works. For generic details about FUSE see fuse.rst.
>  This document also covers the current interface, which is
>  still in development and might change.
>  
> +For the userspace protocol, see
> +Documentation/filesystems/fuse/uapi/fuse-uapi-io-uring.rst.
> +
>  Limitations
>  ===========
>  As of now not all requests types are supported through io-uring, userspace
> @@ -95,5 +98,34 @@ Sending requests with CQEs
>   |    <fuse_unlink()                         |
>   |  <sys_unlink()                            |
>  
> -
> -
> +Buffer pools
> +============
> +
> +Without a buffer pool, every entry needs to pass a dedicated payload buffer
> +large enough for the maximum payload size. A buffer pool decouples entries
> +from payload buffers. The server hands the kernel one contiguous buffer pool
> +of memory and when the kernel sends the server a request, it indicates the
> +offset into the pool for that request's payload. Internally, the kernel is
> +able to manage/optimize the buffer pool memory however it likes.
> +
> +A server may also register the pool region with io_uring as a fixed buffer.
> +The backing pages are then pinned once, avoiding per-request pinning and
> +address translation. This also allows servers to use the same registered
> +buffers for subsequent backing store I/O through io-uring, keeping data
> +in the same pinned pages without additional pinning / mapping overhead.
> +
> +Zero-copy
> +=========
> +
> +Zero-copy lets the server read from / write to the client's pages (pinned
> +user pages for direct I/O, or page-cache folios for buffered I/O) without an
> +intermediary payload copy. This requires CAP_SYS_ADMIN privileges.
> +
> +When a fuse request arrives for a file that opted into zero-copy, the kernel
> +registers the relevant pages (pinned user pages for direct i/o or underlying
> +page cache folios for buffered i/o) into a sparse slot in the server's
> +io_uring registered buffer table. The server can then operate on these pages
> +directly using io-uring fixed buffer operations (eg read_fixed / write_fixed)
> +and the kernel unregisters these pages when the request completes.
> +Non-page-backed args (eg op out headers) will go through the payload buffer as
> +normal.
> diff --git a/Documentation/filesystems/fuse/index.rst b/Documentation/filesystems/fuse/index.rst
> index 393a845214da..3dada6c4057a 100644
> --- a/Documentation/filesystems/fuse/index.rst
> +++ b/Documentation/filesystems/fuse/index.rst
> @@ -12,3 +12,4 @@ FUSE (Filesystem in Userspace) Technical Documentation
>     fuse-io
>     fuse-io-uring
>     fuse-passthrough
> +   uapi/fuse-uapi-io-uring
> diff --git a/Documentation/filesystems/fuse/uapi/fuse-uapi-io-uring.rst b/Documentation/filesystems/fuse/uapi/fuse-uapi-io-uring.rst
> new file mode 100644
> index 000000000000..66b0fcbcde24
> --- /dev/null
> +++ b/Documentation/filesystems/fuse/uapi/fuse-uapi-io-uring.rst
> @@ -0,0 +1,129 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=====================================
> +FUSE-over-io-uring uapi documentation
> +=====================================
> +
> +Commands
> +========
> +
> +``enum fuse_uring_cmd``:
> +
> +``FUSE_IO_URING_CMD_ADD_QUEUE``
> +  Create a queue identified by ``fuse_uring_cmd_req.qid``. Queue-wide
> +  options are passed in ``fuse_uring_cmd_req.flags``:
> +
> +  ``FUSE_URING_ZERO_COPY``
> +    Enable zero-copy on this queue. Requires ``CAP_SYS_ADMIN`` and a buffer
> +    pool, which is added separately via ``ADD_BUFPOOL`` before registering
> +    entries (see `Zero-copy`_).
> +
> +``FUSE_IO_URING_CMD_ADD_BUFPOOL``
> +  Register the payload buffer pool for an existing queue. The server provides
> +  a single contiguous region in ``fuse_uring_cmd_req.bufpool.uaddr`` /
> +  ``.len``. This command must be issued after ``ADD_QUEUE`` and before
> +  registering any payload-carrying entries on that queue. Flags:
> +
> +  ``FUSE_URING_REGISTERED_BUFPOOL``
> +    The pool region is registered ahead of time with io_uring to avoid per i/o
> +    pinning/unpinning and mapping overhead.
> +
> +``FUSE_IO_URING_CMD_REGISTER``
> +  Register a ring entry (a long-lived SQE that carries the request header
> +  iovec). For a zero-copy queue, ``fuse_uring_cmd_req.ent_zero_copy_buf_index``
> +  indicates the reserved registered buffer table slot this entry uses for
> +  zero-copy (see `Zero-copy`_).
> +
> +``FUSE_IO_URING_CMD_COMMIT_AND_FETCH``
> +  Commit the reply for a completed request and fetch the next one. The
> +  request is identified by ``fuse_uring_cmd_req.commit_id`` (the value the
> +  kernel reported in ``fuse_uring_ent_in_out.commit_id``).
> +
> +Structures
> +==========
> +
> +``struct fuse_uring_cmd_req`` (80-byte SQE command area):
> +
> +============================  ==================================================
> +Field                         Meaning
> +============================  ==================================================
> +``flags``                     Command-specific flags (see each command).
> +``commit_id``                 Request id, for ``COMMIT_AND_FETCH``.
> +``qid``                       Queue index.
> +``bufpool.uaddr``             Pool base address, for ``ADD_BUFPOOL``.
> +``bufpool.len``               Pool length in bytes, for ``ADD_BUFPOOL``.
> +``ent_zero_copy_buf_index``   Per-entry zero-copy slot, for ``REGISTER``.
> +============================  ==================================================
> +
> +``struct fuse_uring_ent_in_out`` (reported by the kernel per request):
> +
> +============================  ==================================================
> +Field                         Meaning
> +============================  ==================================================
> +``flags``                     ``FUSE_URING_ENT_ZERO_COPY`` if zero-copied.
> +``commit_id``                 Id to echo back in ``COMMIT_AND_FETCH``.
> +``payload_sz``                Total payload size in bytes (see `Zero-copy`_).
> +``offset``                    Payload buffer offset within the pool.
> +============================  ==================================================
> +
> +Buffer pools
> +============
> +Setup:
> +
> +* Issue ``ADD_QUEUE`` for the qid.
> +* Issue ``ADD_BUFPOOL`` with ``bufpool.uaddr`` and ``bufpool.len`` pointing
> +  at the region.
> +* Register entries with ``REGISTER``.
> +
> +For every request that has a payload, the kernel reports where the payload
> +lives in ``struct fuse_uring_ent_in_out`` (part of
> +``struct fuse_uring_req_header``):
> +
> +``offset``
> +  Byte offset, within the pool region, for this request's payload buffer.
> +  The server adds this to the pool base address to locate the payload.
> +
> +``payload_sz``
> +  Number of payload bytes for this request.
> +
> +To use registered buffers, the server should pass ``FUSE_URING_REGISTERED_BUFPOOL``
> +as a flag to ``ADD_BUFPOOL`` and set ``IORING_URING_CMD_FIXED`` in
> +``sqe->uring_cmd_flags`` and put the index of the registered bufpool in
> +``sqe->buf_index``. The same registered buffer can be reused for the server's
> +backing-store I/O as well (e.g. ``IORING_OP_READ_FIXED`` /
> +``IORING_OP_WRITE_FIXED``).
> +
> +When using registered bufpools, every SQE the server submits must follow the
> +standard fixed-buffer protocol: set ``IORING_URING_CMD_FIXED`` in
> +``sqe->uring_cmd_flags`` and put the index of the registered bufpool in
> +``sqe->buf_index``.
> +
> +Zero-copy
> +=========
> +Requirements:
> +
> +* The server must be privileged (``CAP_SYS_ADMIN``).
> +* A zero-copy queue: ``ADD_QUEUE`` with the ``FUSE_URING_ZERO_COPY`` flag set.
> +* A buffer pool: ``ADD_BUFPOOL``.
> +* For each entry, ``REGISTER`` with ``ent_zero_copy_buf_index`` set to the
> +  index this entry uses in the server's io_uring registered-buffer table.
> +  This is where the kernel registers the request's pages for the server to
> +  access (it is separate from the payload pool). On a non-zero-copy queue this
> +  field must be 0.
> +
> +Zero-copy is selected per open file. The server sets the open-file flag in
> +the ``FUSE_OPEN`` / ``FUSE_CREATE`` reply:
> +
> +``FOPEN_IO_URING_ZERO_COPY``
> +  Reads/writes on this open file should use zero-copy.
> +
> +For a request that is zero-copied, the kernel sets ``FUSE_URING_ENT_ZERO_COPY``
> +in ``fuse_uring_ent_in_out.flags`` and places the request's pages at the
> +entry's ``ent_zero_copy_buf_index``. The server then issues
> +``IORING_OP_READ_FIXED`` / ``IORING_OP_WRITE_FIXED`` against that index to
> +transfer the data directly to/from the client's pages.
> +
> +For such a request, ``payload_sz`` includes the zero-copied page bytes
> +(transferred via the registered buffer at ``ent_zero_copy_buf_index``). Any
> +non-page-backed args (e.g. op headers) are still copied through the pool
> +payload buffer at ``offset``.

Thank you for the additional documentation!

Reviewed-by: Bernd Schubert <bernd@bsbernd.com>


