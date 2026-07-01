Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA0140B373
	for <fuse-devel@lists.linux.dev>; Wed,  1 Jul 2026 11:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907011; cv=pass; b=RQ35KbA2lqPHcBuKzJCcoglW6bGl3Q3x4LWKs0EoLiUXCO3KldD3lAlobmNfRmN5OSa429SYpGIzxQRYtfkVyeQX7Me60QUPprA0AKjG3wPiTYSdNMBH0HkqKqz4dsyQrJa6iUmNfWM8/WBPeZYNd69zk6ihXUlQxW7dkD0laps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907011; c=relaxed/simple;
	bh=hGFd8XI5So8JIgFoCbrE+xX47w+ZIkc9As0w2s4B64Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMP6M6XMapy4Ll4wlNxtt+c2vidY8QuEOaWZEFSQ1XR/b5mmyjGUn9muC2oV515xGhwxsFn9uZCKje6L9Z/yG8iCcsJbUG3yCokjytITNmV/o03hsItiQmuS+Xnmhcmb8SgAJI5xHc0jbDK6wS7Ugin++vYEKUz1sTG6O4zirpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNesdYka; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNesdYka"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso1172094a12.2
        for <fuse-devel@lists.linux.dev>; Wed, 01 Jul 2026 04:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782907008; cv=none;
        d=google.com; s=arc-20260327;
        b=eUXypoVRYK9I3iJAq4M3PhRYg4Twnxn1DCifN1iSow84xtpW2p3noqj0kW3V++7T3O
         0eb41luzLkYsoAWLPnf9q4WImaApSzd8EH7npG8FmDO62O/WR1jq8V38FrkaWzMz0CsY
         Wc6NBdMiYWOmNB/EcMuh2sM6dLI5Cp+/PG7xeZ+Rtj3gKacgTJnGcfUJydGJe3hKzqVB
         bP13VJEw006aI1tcrvfOwQQ1FuwfC9+MBQ9GQXRhhiNABMyZNGfHTIorqnOz/brlM2o5
         73DUVU1MXWeAbkkSOmgT96hzTSdrgt4GHFjblQUwjueqUh+6IoZgep4FV+3w62S14/Kz
         nF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5C0wYdAVQwTwGl0T2fm8AqryOGdcAD+UAFC8V2uPL1Y=;
        fh=7JnZIUDUWCGM9nIOBzxVtCxy0MQeI+fG95DBeQO3xt4=;
        b=NwQHo7fMMwt3jbWRW/NUlNzzBILRcJyLMNhbEjY/6QHsvCmEo+vyFkY0lp6QE2GwxJ
         SxcjnYk6u5CP48Fj08r4ROmM3A3xKf9FpiMSsfbMzJztdDI61nyt/AffwFbKW2lYCnka
         l+iUYtJd+TRyQy5nR0P3UeucCDRoXTTQG4NmgF8vnvEwQBkyZWos1Qz/17L1nmt0zSej
         bs7xb71VpykKtU2pUHixOisMD072jJkRNExUjUDWQHZZEAWgTwKPv87LGef6S1PP8YfS
         jBy97ljcLcBF+J0oOBz7mpnB1QT67ptNHAdnPGQGLRqbE7m+D+rvXey42l9NY5jj8BZE
         /U/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782907008; x=1783511808; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5C0wYdAVQwTwGl0T2fm8AqryOGdcAD+UAFC8V2uPL1Y=;
        b=DNesdYkaLG2zJgguMw8sjmd0PXrAUy8ZcnzRCfjjJd0lFgtko/ijxPv6iHJvi7XSlM
         alyRsaU0oqXVOuvBg13Rb+tfRdzNL7XoBW+T0AEOt3zENw5Y9KmIr6cYmdMvkxuN8REY
         zxqxyVrL/E/lEG8dOd8l5EMG4yQUhjHPDhVuzV4mOuvzS7wG3aiwpIxMiQq0cXXyhLkI
         v+OvbOoHsIz1ZvKKZRGFN/4g/df8y/nmG93tJh/DUM3IW7sktGCYqtn7piPDmfu3I7r4
         kxiat18AM8Qxqw0pk3tWGNC0Wp1n//URmgBr99znYNQDjNmD/2+tzP7WfgypqVFmZl1G
         YaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907008; x=1783511808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5C0wYdAVQwTwGl0T2fm8AqryOGdcAD+UAFC8V2uPL1Y=;
        b=bn0EkSa1fLO3QZbqnefkqnLx1I1ZOH26s2OevmudkDChW0snvseK8Hek3MX1tK5a2f
         SuSfQru3t8u/lVUf32DJoztzgWaDAUYutLfCkDjYVBfZLYu094h/2TiZBot7AZp8i2H/
         OEYQ8JqWHXf17NBCy6890HXsu1ZjC4gixPFQq5jwxgKu870BL4M2XjRS1uwSs39FWOPZ
         quIJk1OEsLYKMcreFkH8rQQBCzA9/ZyP3CIY8gVdJkkcytpZUreO6GJf3aYMzPBEg3IO
         xsrzZLIDtWlWbJddRPvh33uQ95F9uiVwbijNNTuMw9lGjoF4ry3Kj90oN9ygGhILd4H5
         DCZw==
X-Forwarded-Encrypted: i=1; AHgh+RrvkQQH0Qn3zMd338A+foDUwV7cjRoC++w4qTzXl5WWTZ8c3TGnaSC/Q1W+0R4Gs0PEhQRrozo82HSa@lists.linux.dev
X-Gm-Message-State: AOJu0YxlstBBpOUljr2NoHgIwvPGuRYE1XJ8iwRBqsSNj+G1ZsIhWcPH
	B5wJ8uZTMmLTwaWjn9i9Ak/qymQN8ya8fmKw9Kv6tAEPG2FSDBSg9NDyb8S+h+T09CqchRqDfAM
	K66WRuknzkz7PeM48zw/I6IQK3jv+sBo=
X-Gm-Gg: AfdE7cmX1tD4bUgVhlfcn2dZdvytPM4qOctaKJxVXl0sCtHRtQl3gA4wF/tGme+9avq
	VFeuT4/1vS3SfzGXdbr0U70zonXWE7Ls1hMjzrR6wHsTGwIYzw6uzLYDxA8hOocW9GGulyikfWU
	ns5ZopsZMYqz2913at2fmmQZL484uJ7Wo3zHff2OI7SlnTzIb3JISDqtbIs+nPHqGNr2/DgCk5w
	Lb+uT7WWZ/cl90lwR0XDD8hkcBahY/FhvGeAuKYjd2xk3BdP8SpzdilvE4sMJ2spMg8/u40Ma0H
	URQTRawO8HeMMvjsqp65X1CUp6Dw9+s=
X-Received: by 2002:a05:6402:274e:b0:66e:abe5:ab22 with SMTP id
 4fb4d7f45d1cf-6989f2fab2dmr667059a12.5.1782907007464; Wed, 01 Jul 2026
 04:56:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630211436.2062816-1-joannelkoong@gmail.com> <20260630211436.2062816-7-joannelkoong@gmail.com>
In-Reply-To: <20260630211436.2062816-7-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 1 Jul 2026 13:56:35 +0200
X-Gm-Features: AVVi8CdugXX6ibuoPzK4zAMPUzgQNqTtz139qC4o81OMkJWZxDlhqBSDo_FhDFI
Message-ID: <CAOQ4uxj8RU8X0V3+74rw9wjBc2w2TH8qaGXgLq6DdjPuQ8tivg@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] docs: fuse: document io-uring buffer pool and
 zero-copy uapi
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, libaokun@linux.alibaba.com, 
	axboe@kernel.dk, bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 11:17=E2=80=AFPM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> Add documentation for fuse over io-uring usage of buffer pools and
> zero-copy.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  .../filesystems/fuse/fuse-io-uring.rst        |   5 +-
>  Documentation/filesystems/fuse/index.rst      |   1 +
>  .../filesystems/fuse/uapi/io-uring.rst        | 143 ++++++++++++++++++
>  3 files changed, 148 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/filesystems/fuse/uapi/io-uring.rst
>
> diff --git a/Documentation/filesystems/fuse/fuse-io-uring.rst b/Documenta=
tion/filesystems/fuse/fuse-io-uring.rst
> index d73dd0dbd238..a92dee057d78 100644
> --- a/Documentation/filesystems/fuse/fuse-io-uring.rst
> +++ b/Documentation/filesystems/fuse/fuse-io-uring.rst
> @@ -95,5 +95,8 @@ Sending requests with CQEs
>   |    <fuse_unlink()                         |
>   |  <sys_unlink()                            |
>
> -
> +Buffer pools and zero-copy
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +For the userspace protocol used to set up buffer pools and zero-copy, se=
e
> +Documentation/filesystems/fuse/uapi/io-uring.rst.

This dereference is not clear to me.

The name of the suggested doc is even more puzzling for me
io-uring.rst is really not an adequest standalone name for this doc
and fuse/uapi path is unconventional in Documentation.
The doc is not even pure uapi, it explains about buffer pools and zero copy=
.

Why not include the details inline in fuse-io-uring.rst?
It's not going to be a huge doc and all details seem to be intertwined.

Thanks,
Amir.

>
> diff --git a/Documentation/filesystems/fuse/index.rst b/Documentation/fil=
esystems/fuse/index.rst
> index 393a845214da..0ee75d9df2dd 100644
> --- a/Documentation/filesystems/fuse/index.rst
> +++ b/Documentation/filesystems/fuse/index.rst
> @@ -12,3 +12,4 @@ FUSE (Filesystem in Userspace) Technical Documentation
>     fuse-io
>     fuse-io-uring
>     fuse-passthrough
> +   uapi/io-uring
> diff --git a/Documentation/filesystems/fuse/uapi/io-uring.rst b/Documenta=
tion/filesystems/fuse/uapi/io-uring.rst
> new file mode 100644
> index 000000000000..29f921782fed
> --- /dev/null
> +++ b/Documentation/filesystems/fuse/uapi/io-uring.rst
> @@ -0,0 +1,143 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +FUSE-over-io-uring uapi documentation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Commands
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +``enum fuse_uring_cmd``:
> +
> +``FUSE_IO_URING_CMD_ADD_QUEUE``
> +  Create a queue identified by ``fuse_uring_cmd_req.qid``. Queue-wide
> +  options are passed in ``fuse_uring_cmd_req.flags``:
> +
> +  ``FUSE_URING_ZERO_COPY``
> +    Enable zero-copy on this queue. Requires ``CAP_SYS_ADMIN`` and a buf=
fer
> +    pool, which is added separately via ``ADD_BUFPOOL`` before registeri=
ng
> +    entries (see `Zero-copy`_).
> +
> +``FUSE_IO_URING_CMD_ADD_BUFPOOL``
> +  Register the payload buffer pool for an existing queue. The server pro=
vides
> +  a single contiguous region in ``fuse_uring_cmd_req.bufpool.uaddr`` /
> +  ``.len``. This command must be issued after ``ADD_QUEUE`` and before
> +  registering any payload-carrying entries on that queue. Flags:
> +
> +  ``FUSE_URING_REGISTERED_BUFPOOL``
> +    The pool region is registered ahead of time with io_uring to avoid p=
er i/o
> +    pinning/unpinning and mapping overhead.
> +
> +``FUSE_IO_URING_CMD_REGISTER``
> +  Register a ring entry (a long-lived SQE that carries the request heade=
r
> +  iovec). For a zero-copy queue, ``fuse_uring_cmd_req.ent_zero_copy_buf_=
index``
> +  indicates the reserved registered buffer table slot this entry uses fo=
r
> +  zero-copy (see `Zero-copy`_).
> +
> +``FUSE_IO_URING_CMD_COMMIT_AND_FETCH``
> +  Commit the reply for a completed request and fetch the next one. The
> +  request is identified by ``fuse_uring_cmd_req.commit_id`` (the value t=
he
> +  kernel reported in ``fuse_uring_ent_in_out.commit_id``).
> +
> +Structures
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +``struct fuse_uring_cmd_req`` (80-byte SQE command area):
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +Field                         Meaning
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +``flags``                     Command-specific flags (see each command).
> +``commit_id``                 Request id, for ``COMMIT_AND_FETCH``.
> +``qid``                       Queue index.
> +``bufpool.uaddr``             Pool base address, for ``ADD_BUFPOOL``.
> +``bufpool.len``               Pool length in bytes, for ``ADD_BUFPOOL``.
> +``ent_zero_copy_buf_index``   Per-entry zero-copy slot, for ``REGISTER``=
.
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +``struct fuse_uring_ent_in_out`` (reported by the kernel per request):
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +Field                         Meaning
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +``flags``                     ``FUSE_URING_ENT_ZERO_COPY`` if zero-copie=
d.
> +``commit_id``                 Id to echo back in ``COMMIT_AND_FETCH``.
> +``payload_sz``                Total payload size in bytes (see `Zero-cop=
y`_).
> +``offset``                    Payload buffer offset within the pool.
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +Buffer pools
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Without a buffer pool, every entry needs to pass a dedicated payload buf=
fer
> +large enough for the maximum payload size. A buffer pool decouples entri=
es
> +from payload buffers. The server hands the kernel one contiguous region =
and
> +when the kernel sends the server a request, it indicates the offset into=
 the
> +buffer pool for that request's payload.
> +
> +Setup:
> +
> +* Issue ``ADD_QUEUE`` for the qid.
> +* Issue ``ADD_BUFPOOL`` with ``bufpool.uaddr`` and ``bufpool.len`` point=
ing
> +  at the region.
> +* Register entries with ``REGISTER``.
> +
> +For every request that has a payload, the kernel reports where the paylo=
ad
> +lives in ``struct fuse_uring_ent_in_out`` (part of
> +``struct fuse_uring_req_header``):
> +
> +``offset``
> +  Byte offset, within the pool region, for this request's payload buffer=
.
> +  The server adds this to the pool base address to locate the payload.
> +
> +``payload_sz``
> +  Number of payload bytes for this request.
> +
> +A server may register the pool region with io_uring as a fixed buffer. T=
he
> +backing pages are then pinned once, avoiding per-request pinning and add=
ress
> +translation. The server should pass ``FUSE_URING_REGISTERED_BUFPOOL`` as=
 a flag
> +to ``ADD_BUFPOOL`` and set ``IORING_URING_CMD_FIXED`` in
> +``sqe->uring_cmd_flags`` and put the index of the registered bufppol in
> +``sqe->buf_index``. The same registered buffer can be reused for the ser=
ver's
> +backing-store I/O as well (e.g. ``IORING_OP_READ_FIXED`` /
> +``IORING_OP_WRITE_FIXED``).
> +
> +When using registered bufpools, every SQE the server submits must follow=
 the
> +standard fixed-buffer protocol: set ``IORING_URING_CMD_FIXED`` in
> +``sqe->uring_cmd_flags`` and put the index of the registered bufpool in
> +``sqe->buf_index``.
> +
> +Zero-copy
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Zero-copy lets the server read from / write to the client's pages (pinne=
d
> +user pages for direct I/O, or page-cache folios for buffered I/O) withou=
t an
> +intermediary payload copy. Because it grants the server direct access to
> +those pages, it requires ``CAP_SYS_ADMIN``.
> +
> +Requirements:
> +
> +* A zero-copy queue: ``ADD_QUEUE`` with the ``FUSE_URING_ZERO_COPY`` fla=
g set.
> +* A buffer pool: ``ADD_BUFPOOL``.
> +* For each entry, ``REGISTER`` with ``ent_zero_copy_buf_index`` set to t=
he
> +  index this entry uses in the server's io_uring registered-buffer table=
.
> +  This is where the kernel registers the request's pages for the server =
to
> +  access (it is separate from the payload pool). On a non-zero-copy queu=
e this
> +  field must be 0.
> +
> +Zero-copy is selected per open file. The server sets the open-file flag =
in
> +the ``FUSE_OPEN`` / ``FUSE_CREATE`` reply:
> +
> +``FOPEN_IO_URING_ZERO_COPY``
> +  Reads/writes on this open file should use zero-copy.
> +
> +For a request that is zero-copied, the kernel sets ``FUSE_URING_ENT_ZERO=
_COPY``
> +in ``fuse_uring_ent_in_out.flags`` and places the request's pages at the
> +entry's ``ent_zero_copy_buf_index``. The server then issues
> +``IORING_OP_READ_FIXED`` / ``IORING_OP_WRITE_FIXED`` against that index =
to
> +transfer the data directly to/from the client's pages.
> +
> +For such a request, ``payload_sz`` includes the zero-copied page bytes
> +(transferred via the registered buffer at ``ent_zero_copy_buf_index``). =
Any
> +non-page-backed args (e.g. op headers) are still copied through the pool
> +payload buffer at ``offset``.
> --
> 2.52.0
>
>
