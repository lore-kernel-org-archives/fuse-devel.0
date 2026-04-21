Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437822DC32E
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776769791; cv=pass; b=NkpJUJdrojll5SvN06Kf9ukgBCwSY7/dpA3hI7toC2ziljVK0s86ZgcZv3VTYrGYi2sBoCBSLkXH8k8VdpY4+EdYdzlowt0Hkt0NQzVRDBxyEfMac+gNWGYZtWbilX6udYO+LmGjfdnDxUDClUHFlztChXkSuF5WY174vFx9rl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776769791; c=relaxed/simple;
	bh=ZzVXNZ08lGXGRTgNS0BrSH5OOBEfpPfUpXuuAjCm7YY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJJze5MKA1cvNf+JoqmQjJJNrwy6fl3aNUVdJlhC/JsISXrpPPS3noyR1m9LrrZcL2V7tyQqOTifWlhVMpJpWHdW0ZUwBn29x3mMEAcOi8nmey34Urvs9eRd2qOCucHWN9ap9oHZNZahh9rvyHd+KTfJ/8/ChAfEVwmIA65i3R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNFBG1GF; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNFBG1GF"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ba8472c1613so300784066b.0
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 04:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776769787; cv=none;
        d=google.com; s=arc-20240605;
        b=IIUxPUcUogwDwyh8cyOzx+45sXUMt4ghFbdy1H+84ybVPKyCdvjmsi6A28eA0wnJsU
         BO6unOIe4zbDLPCdbXnnTc4x0a39Vl+rz0MBWHntCWyyF778GxDp/kVOsvHydjHqPZ4u
         ZzpiHTogHObfPxqjjQq5xuuaU4Wl1uDoWSHrm8Bbqml/S6z3pj8Y2PA9cW92yDdqYJzp
         iBU/EihNUdRyLBU1t4TFB2zUdtwXoZP2h/l6c+3IAeiFVnq8j2bDkLv4pM9jN5G/yaNi
         iq6ademJ6rksz0GBVwDZOUwubWglZL8582Ez84ABdoTHQvlk/dMQp+vW4qwCBHx/QwpS
         ykQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vozanz5dQffspPMXoN1jUC5J04yiE7G2AzvWGq75cJU=;
        fh=H/7gILQ6qkai45wlEvWvf4iJbFb5nvsf1rGGRyxgQGg=;
        b=gztYIfNOMvnfeewoxhpb7E7JZzCLriGkIGVDd5x8IPNTj4SYgV8wi/flcScx9pqn4z
         bh8bExfabrp15gN7ZCuf54wMiFVMuI5yrrqBPQgzWYibjqaKMd3lle+GlL+Gp350/lTG
         AlmGqqPdItdqSi+GSFdPJ2AvNjGZZW1wFFWfiyan2gliEfq+SyJN/tgjTCkUCZxIGqSQ
         niQ8ruGWSP4hsJdeBSa+BuAHlFVTJ4tWilZ/2Y0UHKDQ+AWpkcZhTvXd5uxhveaWoQaw
         Tq27ht+43vc9YpbMTPxNH+boWmbEQz2fsEclFu0F7h7vXhDCkn7QVxD/qQzo45QZ7dNh
         PaQw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776769787; x=1777374587; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vozanz5dQffspPMXoN1jUC5J04yiE7G2AzvWGq75cJU=;
        b=HNFBG1GFcvxW1o+Ufyua03vCqOFM/I/0rXd3sUlXDAb5G1l+3ptNErsnW7QNMhYfJf
         67/AEljN6YmRK8KHvIP9tHubZNwSnNb2eqDYKlzOfgAebq9w/BkMlxbHMftFAzDkxVsn
         1fGq6Ut2CRNZ8ZweRuOjWghAoOHHMrwuEWLt9Dd30I0bcjTMhoycFbEAnDuq+J/AVD/p
         Km+J8+WPX31nYTzhbu9dzslT6wnUGEAVQJJWmKy7V+4i2w+K+JXMR2s/wW3kepv5NUAq
         Vx5XDc7l9Htku5i75bXk1vaf8yi7XUMz+MVnh1DP8EJ1LIJxZ/1PnBiMBsNmSYQ1UCJl
         bYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776769787; x=1777374587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vozanz5dQffspPMXoN1jUC5J04yiE7G2AzvWGq75cJU=;
        b=LfE8rSQ9y6l+ihU1w+J3c5QBP33Tx8uQGSmKdvrLdqNBKsabJHoVk0/lt7Mf3l9Njh
         f/glkCCnZ51Qy8GYU/hK1pOgfa+vGMMP/bieywAozYxI4W8wC/Yzc8u1oLtkaAY5l+Gw
         hpRbEr2/jUXaYiXkj8Et/r8Db4nsrSvmKODXiue/PTBO7p4bzJn72q2wyUitBr8UMmSj
         QCL7XR7IYF9iwNZAjwX6jkXsc40sNVLRYXWfQW6J1+XaYJJPdR8C+KsUGdpV2VsP+kJs
         JJUOXypr7Ijh+OGCP7+2PFn7zvayfwT9qC96qcKvdKfLK7CvYVuAgjc5ojj34+8zIXka
         NmSw==
X-Forwarded-Encrypted: i=1; AFNElJ9LfX0K7yul9Y8BGnbMWkvLj6PFM1KVzizfgC/zIwSQ44IZNl+FOqHCXe3b/ms14q24qAYJ2C83Surs@lists.linux.dev
X-Gm-Message-State: AOJu0YxGsBywxe1Yb5fs9R/fjq0k/AcErW7H2zyyWMMXrAJSzrft+Di7
	TUDRTuzPfSRGBSQ9B7NRreognG0mpSDUk6aO8Xd0Scx+pgjWA9XELQQCRqYwcfstyXOCsDLH01K
	YV96vcmM+Wuo5Gix/qm2wRLTA4EAlt7I=
X-Gm-Gg: AeBDiet1WMwzQVj0pSjbUmebqO7TaSBdc1zqW8EGqtyKExlNNwHkmqwkGrrcLeI48cB
	7JoMS/YThF3/PUUMuJP4ADBXT1rXOQ0O6d/MRAlGX0Xqa2j4DkTTWl0qdNCFdmzk8WagUyCgcR9
	qBUI/PXauKUpIYJDAj17RFAiWVz3MAW++S1X7J/c8BeL8iiSYxYIgI2Ccl3oQKbPhiv9/FEZ0WD
	UTYP/UYTAIsCjQHBN8KyVC0SwTd3wOKOCez4MI+k3rxApyIDDshDJOm5hRmMLrZN0D3w5BwDTAW
	Mk0J4UtndktMsuo9YWOYcyn0Hi4MhXzCG+3YYRlHUNQSU6V5wdzU
X-Received: by 2002:a17:906:eec2:b0:b9c:6ef1:ed18 with SMTP id
 a640c23a62f3a-ba41a0474f0mr829060566b.25.1776769786936; Tue, 21 Apr 2026
 04:09:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com> <20260420221637.2631478-18-joannelkoong@gmail.com>
In-Reply-To: <20260420221637.2631478-18-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Apr 2026 13:09:35 +0200
X-Gm-Features: AQROBzBXfNATIJNjygBqd9ms69sTb-Nv46oYpnZcSsHjkomm1sodo69VQxcTrek
Message-ID: <CAOQ4uxiKj=+Gcxe87Jpqk_CXm_qrTMpk-OSS4LX1x7ineT3MTw@mail.gmail.com>
Subject: Re: [PATCH v1 17/17] docs: fuse: document extended passthrough (FUSE_PASSTHROUGH_INO)
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 12:19=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> Add section about extended passthrough (FUSE_PASSTHROUGH_INO) mode.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  .../filesystems/fuse/fuse-passthrough.rst     | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>
> diff --git a/Documentation/filesystems/fuse/fuse-passthrough.rst b/Docume=
ntation/filesystems/fuse/fuse-passthrough.rst
> index 2b0e7c2da54a..c7ccea597324 100644
> --- a/Documentation/filesystems/fuse/fuse-passthrough.rst
> +++ b/Documentation/filesystems/fuse/fuse-passthrough.rst
> @@ -25,6 +25,12 @@ operations.
>  Currently, passthrough is supported for operations like ``read(2)``/``wr=
ite(2)``
>  (via ``read_iter``/``write_iter``), ``splice(2)``, and ``mmap(2)``.
>
> +With the extended ``FUSE_PASSTHROUGH_INO`` mode, passthrough is also sup=
ported
> +for inode operations (getattr, setattr), directory operations (readdir),=
 and
> +kernel-initiated open (bypassing ``FUSE_OPEN``). In this mode, a backing=
 file
> +can be attached to a fuse inode for its entire lifetime, not just while =
a file
> +is open.
> +
>  Enabling Passthrough
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> @@ -46,6 +52,131 @@ To use FUSE passthrough:
>       the ``backing_id`` to release the kernel's reference to the backing=
 file
>       when it's no longer needed for passthrough setups.
>
> +Extended Passthrough (FUSE_PASSTHROUGH_INO)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +``FUSE_PASSTHROUGH_INO`` is a stricter variant of ``FUSE_PASSTHROUGH`` i=
n
> +which the backing file inode number must match the fuse inode number, en=
forcing
> +a one-to-one mapping. The kernel offers this flag during ``FUSE_INIT`` i=
f
> +``CONFIG_FUSE_PASSTHROUGH`` is enabled and the architecture has 64-bit
> +``ino_t``. The server accepts by returning it back in the init reply.
> +
> +Enabling Extended Passthrough
> +-----------------------------
> +
> +To use extended passthrough:
> +
> +  1. Follow steps 1-2 from `Enabling Passthrough`_ above. The server mus=
t
> +     also negotiate the ``FUSE_PASSTHROUGH_INO`` capability during
> +     ``FUSE_INIT``.
> +  2. When registering a backing file via ``FUSE_DEV_IOC_BACKING_OPEN``, =
set
> +     the ``ops_mask`` field in ``struct fuse_backing_map`` to declare wh=
ich
> +     operations should be passed through. At minimum,
> +     ``FUSE_PASSTHROUGH_OP_GETATTR`` must be set for any inode-level
> +     passthrough.
> +  3. When handling a ``LOOKUP``, ``CREATE``, ``MKNOD``, ``MKDIR``,
> +     ``SYMLINK``, or ``LINK`` request, the server responds with a
> +     ``fuse_entry2_out`` (instead of ``fuse_entry_out``). To enable
> +     passthrough on the inode, set ``backing_id`` to the id returned by
> +     ``FUSE_DEV_IOC_BACKING_OPEN``. Set ``backing_id`` to 0 for inodes
> +     that should not use passthrough. The ``nodeid`` in the response mus=
t
> +     be the backing file's inode number (``i_ino``). If they don't match=
,
> +     the kernel rejects the passthrough setup with ``-EIO``.
> +  4. For passthrough open (``FUSE_PASSTHROUGH_OP_OPEN`` in ``ops_mask``)=
,
> +     no further action is needed. The kernel will open the backing file
> +     directly without sending ``FUSE_OPEN`` / ``FUSE_OPENDIR`` to the
> +     server. ``FUSE_RELEASE`` / ``FUSE_RELEASEDIR`` is also skipped.
> +  5. For server-initiated passthrough open (without
> +     ``FUSE_PASSTHROUGH_OP_OPEN``), the server handles ``FUSE_OPEN`` /
> +     ``FUSE_OPENDIR`` as before and returns ``FOPEN_PASSTHROUGH`` with t=
he
> +     ``backing_id`` in the open response. A ``backing_id`` is required e=
ven
> +     if the inode already has passthrough set up from lookup. The server
> +     must use the same ``backing_id``. If the inode has passthrough,
> +     the server must set ``FOPEN_PASSTHROUGH`` or ``FOPEN_DIRECT_IO``

IIUC (and please do double check this), the server MUST always set
``FOPEN_PASSTHROUGH`` if inode is in passthrough mode and it MAY set
``FOPEN_DIRECT_IO`` *additionally* to opt-out of passthrough when inode
is already in passthrough mode.

> +     on open as cached I/O mode is not allowed on passthrough inodes.
> +  6. The server should call ``FUSE_DEV_IOC_BACKING_CLOSE`` to release th=
e
> +     backing file when it is no longer needed.
> +
> +Passthrough Operations Mask
> +---------------------------
> +
> +When registering a backing file via ``FUSE_DEV_IOC_BACKING_OPEN``, the s=
erver
> +sets ``ops_mask`` in ``struct fuse_backing_map`` to declare which operat=
ions
> +should be passed through::
> +
> +    FUSE_PASSTHROUGH_OP_READ
> +    FUSE_PASSTHROUGH_OP_WRITE
> +    FUSE_PASSTHROUGH_OP_READDIR
> +    FUSE_PASSTHROUGH_OP_GETATTR
> +    FUSE_PASSTHROUGH_OP_SETATTR
> +    FUSE_PASSTHROUGH_OP_OPEN
> +
> +Operations fall into three categories:
> +
> +**File operations** (read, write, readdir): Activated per-open when the
> +server returns ``FOPEN_PASSTHROUGH`` in its open response. The backing f=
ile
> +reference exists only while the file is open.
> +
> +**Inode operations** (getattr, setattr): Activated on lookup when the se=
rver
> +returns a ``backing_id`` in the ``fuse_entry2_out`` response. The backin=
g
> +file reference persists for the lifetime of the fuse inode. Getattr is t=
he
> +minimum required inode operation.
> +
> +**Open passthrough**: The kernel opens the backing file directly without
> +sending ``FUSE_OPEN`` / ``FUSE_OPENDIR`` to the server. ``FUSE_RELEASE``=
 /
> +``FUSE_RELEASEDIR`` is also skipped. For regular files this implies pass=
through
> +read/write; for directories it implies passthrough readdir.
> +
> +Extended Entry Reply
> +--------------------
> +
> +When ``FUSE_PASSTHROUGH_INO`` is negotiated, the kernel uses
> +``fuse_entry2_out`` instead of ``fuse_entry_out`` for entry responses.
> +This struct carries a ``backing_id`` and ``fuse_statx`` attributes inste=
ad
> +of ``fuse_attr``.
> +
> +When ``backing_id > 0``, the kernel associates the inode with the backin=
g file
> +for passthrough inode operations. Statx attributes are not cached becaus=
e
> +passthrough getattr fetches them directly from the backing inode.
> +
> +When ``backing_id =3D=3D 0`` (no passthrough), the statx attributes from=
 the reply
> +are cached normally.
> +
> +A negative ``backing_id`` is treated as an error. The kernel sends
> +``FUSE_FORGET`` for the returned nodeid and fails the operation.
> +
> +IO Mode State Machine
> +---------------------
> +
> +The ``iocachectr`` field in ``struct fuse_inode`` prevents conflicting a=
ccess
> +modes on the same inode (page-cache I/O and passthrough I/O cannot coexi=
st)::
> +
> +    iocachectr > 0    Cached mode. N files using page cache.
> +    iocachectr =3D=3D 0   Idle. No files open, no passthrough.
> +    iocachectr < 0    Uncached/passthrough mode. |N| references held.
> +
> +Each open file in passthrough mode holds one reference (``iocachectr--``=
).
> +The inode-level passthrough setup holds one additional long-lived refere=
nce
> +if the backing has inode ops (getattr/setattr). This long-lived referenc=
e is
> +released on inode eviction.
> +
> +Cached mode and passthrough mode are mutually exclusive. Attempting eith=
er
> +while the other is active returns ``-ETXTBSY``.
> +
> +For directories, the same mechanism arbitrates between cached readdir
> +(``FOPEN_CACHE_DIR``) and passthrough readdir. A directory opened withou=
t
> +``FOPEN_CACHE_DIR`` and without ``FOPEN_PASSTHROUGH`` is treated as dire=
ct I/O
> +and does not affect io mode.
> +
> +Things to note
> +--------------
> +
> +- ``FUSE_PASSTHROUGH_INO`` requires 64-bit ``ino_t``.
> +- Readdirplus does not set up inode passthrough. Inodes created via read=
dirplus
> +  use normal FUSE operations until a fresh lookup occurs.
> +- An inode's backing association is set once and cannot be changed.
> +- Passthrough and cached I/O cannot coexist on the same inode.
> +

Looks nice.
Adds a few things (e.g. iomodes) that are missing in the doc
for the non-extended passthrough.

Thanks,
Amir.
