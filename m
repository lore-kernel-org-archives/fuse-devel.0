Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC4D470EA4
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056833; cv=pass; b=J0H7IDwvXYLDdl5Yalt9q/bkyLLuWzvo48hP41gjhYFYnjAA7bNxnihu6kiC1SH+EsA35ryF/gFuG9RvSet6vDKoKW7hKdL4Zn2r9gb6kGRvzz1rzMC7PmtEERsv6MuKkjK0g4TJRbvoPqE0vHlwYWfXhXlzRvsQkYNuqoCPYkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056833; c=relaxed/simple;
	bh=LjEVV6esf7D0JeoVaCAyrWzzaqfYb3K9N0R+w/rqU0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKVsrbfigloVZIEaujP3gmaDQa0c/Vm3GnueGnQvas4dkzKvr+P4nWFmYJwP5v8Qecq2A0091xr4V8RONvPOtc+CoslvvRl8b9OUi2d/hqmvox/JWFGXjQ+9rkEFqD5Vwd9CAl/LYM3Ftf1J32OpeHZoKvTgCfx7YhcT1qwmaoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxk9L6UT; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxk9L6UT"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso6418278a12.0
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 05:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787056827; cv=none;
        d=google.com; s=arc-20260327;
        b=U0OnojLGpJverAIzdlkQN+kMX+sAcMeCgdCGs/ik7xO6ZnWy6w5ADFDYKL0orj+86g
         fHhrH/y90d3s8Y7D/ZfNlCIc1dnG+PGABqKU6FM6/eRydL5mUvug08zBy9VWvo1egy/i
         Q6UWlFq6xEK5AxaC7AGWqSisGS5avoaU8ffDl8KJSR/2hO0jSy1qtN26po/lDD0hkGPs
         twSEFJ5yex3ldIDmjC+yrEB9K/MgZM2B/Hn9MyMbhFhTAZCOW82Ai9tdTQ3LL77SdrwZ
         z5eFyCBhjt8SthBo1FH+Hx7qxhW76Eg0uITCijI5W9p9UhEBDxpOHuEua1puygUfmEVW
         aing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X8FM17XqDt5wy7TDubFCXesbV8PavyvfQuSkOdQivms=;
        fh=MBkE4s8aGcVndkKg3qTJd6/0HdtBN/XQINFmnJLuNQA=;
        b=A4CuqMuYFSYZc4W1IpnrFmU5Y/WT2XyE0zoDo79F9XCAO+UvZpOrcUaQO1ZGy2AL/M
         WUFVOzOMWcPoZiZ+lH5HH1lBg/iEJgpA6+QKwXnDfuH8Ebv1mQmSqEDqepzLUF11szuC
         t5bnxpbjWYdYZH1h/+3CKBf0MP7yaQ9B7tAKTIE0K74JltcuTPaFQie68FsHRY56tvB2
         pIknbCMPKFvMPh/a65tcD0rHKk5b7w/Y4HFCwaw97q1hkX3n+dgtTRrPXnajl6a2mlTY
         CsDMJ3yALp356Gz1qqZ+Qed3KVRPCZS6dun0Td6JnkVFJBUO2Mnxl/nFkZamYdu6mIDW
         0x/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787056827; x=1787661627; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X8FM17XqDt5wy7TDubFCXesbV8PavyvfQuSkOdQivms=;
        b=gxk9L6UT6Vb5boe5o7Q+HG9p2MSKOpQ5p+C5FdoQWjrgvn43LR5MdXoOQJTHkCN0ag
         c2TUN9USbLiGxeXW8srfeDlMXPCH4ne26OYiWxbZcmfGFXQgv+FxK0sH732WJKyDAEX6
         CWNQJqjmmIX0Fj8FZ58rrTS5DfExvAVPjAoFUgTAtV1jpPAFQuocJ6K2yAyerz8FKsNc
         sQKYVaAN1u2SROkGrNnwXYK99g4TaxoenswTBqtgPOp7XmDr55ZpYAu33e4OseiA2uot
         +6h4fRGs4RUaCwxoWYnErodE9c+AR+7V4v0C4AIBj0wrizIUbDghf6vm7SB6rdmZqrqA
         yiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056827; x=1787661627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8FM17XqDt5wy7TDubFCXesbV8PavyvfQuSkOdQivms=;
        b=p3yAasd8CPjxWi6rMdLZ7Cj7K8F41kZXN0sAzZGLl76bcl5Ju//EE2esEl9Pf18PeU
         rW1iJZqkqctwuU0dSj7WVi2c4WI4vlWkSPLi/9vdg6Fe54c+wMnqzBEt02BiSEFi2o96
         glTJ+Ck9auSG861rwJPiFR/zgjxXqStx8f/1Jw3ixoAiL7KN2SL/o1hNx+L27C4p4dRi
         39iMQFMn4mS7lS4zTIhV2B7S9Ou4uFGJhvZ6flzNxUAbJ/usvNQpy+781rjBVk8UTE/N
         eX7UVScrniRCl8TOPSPoYR1sQg4MamwWNLfkY4TXW7NMjAZy6YzekFX0HX+mrisIZ4Jo
         x6tw==
X-Forwarded-Encrypted: i=1; AHgh+RoyoAAnNkmITDLTVuvIOd4zUZ5mv3JQtOQy23HbkN76jhWjo+7T7pkf7Trtg4JtAzr3cFCmNZVXCBDO@lists.linux.dev
X-Gm-Message-State: AOJu0YyIPcJu5F5TfloD5YDHU6OSlrRjbLORo2TOi30IEblQzCySeUd+
	zxqPdz+Oway85/f23NHF4ONH4zumdBuV/DQEqLwRsdx14Rxh0ZeUsiuVpJjpwqJyf7gXI07waYp
	zKM5jfFfMCk3jUvXNy0LHR1N1pSomWmM=
X-Gm-Gg: AR+sD13Dga7FsXZ9c0GyWBZbYs3gA32tPrmFIA99bvckPVj6GrzTSLXy07TDg6gwzBK
	FeTa94F7G/6KMtiZHNuSA8ZxmBjr4Pb/VdETy0dHAWr5evw2pPEeF9bz82T0VJziLFGw8X0ozRY
	yof4j6+/BGoVBoKUnPylSU3GEGgguPXcQwo991tWkKg8feBOEk9jml8IVrMQdxtxMVHkH5rgEJ1
	xCbon25IT1ZTUMZJ1vTz28qiSKaIDE46CG1it6IqQ/IaF45FEX3MW694ywrzTD2Q1pnYU6ApLCm
	1Qr8uVquCOZLD29kbqFTIg0Zrc9TB32tnoODic2Nz1XnOw==
X-Received: by 2002:a05:6402:a5d4:10b0:6a1:1bea:8ea0 with SMTP id
 4fb4d7f45d1cf-6a3ef8d65e6mr1538072a12.3.1787056827082; Tue, 18 Aug 2026
 05:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817141156.6079-1-luis@igalia.com> <20260817141156.6079-2-luis@igalia.com>
In-Reply-To: <20260817141156.6079-2-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 18 Aug 2026 14:40:15 +0200
X-Gm-Features: AcwNN1VfmiszQ6kpqQdTZMo3J1V97D0xTkCZ8ak0kKIfDkLlQ6XoE-sspRyDYWU
Message-ID: <CAOQ4uxjsx-Atq3tGsUeakGNZYLVHayVXPne1E6gM0J9tZp+f6g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/8] Documentation: fuse: add document on caches
 being used by FUSE
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 4:11=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> This new file aims at documenting the caches that are used by FUSE.  At
> the moment only symlink, attributes, ACLs and readdir caches are describe=
d.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../filesystems/fuse/fuse-caches.rst          | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
>
> diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentati=
on/filesystems/fuse/fuse-caches.rst
> new file mode 100644
> index 000000000000..071febf45d00
> --- /dev/null
> +++ b/Documentation/filesystems/fuse/fuse-caches.rst
> @@ -0,0 +1,142 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +FUSE Caches
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document summarises the different types of caches that are used in =
FUSE.
> +For each cache type, it attempts to document the rules that are followed=
 to
> +insert, validate and invalidate data into the cache.
> +
> +symlink caching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Whenever there's a link resolution request, the VFS will call into
> +``fuse_get_link()`` which will then send a ``FUSE_READLINK`` request to =
the
> +user-space FUSE server. However, the server can ask the kernel to cache =
all
> +links resolutions by setting the ``FUSE_CACHE_SYMLINKS`` flag during the
> +``FUSE_INIT`` negotiation.
> +
> +If this flag is set, FUSE will immediately call into the VFS
> +``__page_get_link()`` from the ``->get_link()`` inode operation. The fir=
st time
> +this is done for a specific link, it will end-up sending the ``FUSE_READ=
LINK``
> +to user-space but the link contents will then be added into page-cache. =
The next
> +time the link needs to be resolved, it will use the link content that is=
 already
> +cached, and will only fallback into sending the request to use-space if =
the
> +folio isn't up-to-date.
> +
> +Attributes caching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Attributes obtained from user-space, for example when an inode is first
> +looked-up, are cached in the kernel. However, these attributes have a ti=
meout
> +associated and once expired they are invalidated.
> +
> +Thus, the ``FUSE_GETATTR`` operation will be sent to user-space only if =
the
> +attributes aren't yet available, the attributes aren't valid (timeout), =
or if
> +there is an explicit request for doing so (for example, by using the
> +``AT_STATX_FORCE_SYNC`` flag in ``statx``). This may happen in the follo=
wing
> +situations:

"This may happen" what may happen? I don't see it referring to anything.

> +
> +#. An explicit request from VFS to get the attributes for an inode (thro=
ugh the
> +   ``->getattr()`` callback).
> +#. When an ``->llseek()`` is requested to FUSE with a type of request
> +   (``whence``):
> +
> +   -  ``SEEK_{HOLE,DATA}`` and the user-space doesn't implement the
> +      ``FUSE_LSEEK`` operation (it has returned ``ENOSYS``), or
> +   -  ``SEEK_END``
> +
> +#. When doing a buffered read past EOF or automatic page cache invalidat=
ion mode
> +   is enabled (``FUSE_AUTO_INVAL_DATA``).
> +#. When doing a buffered write with write-back cache enabled
> +   (``FUSE_CAP_WRITEBACK_CACHE``).

This list is incomplete and strange. it has post EOF write for
writeback which is the exception
and leaves out every non writeback write.

If you composed this list yourself I highly recommend an LLM for this task
if you used LLM I suggest a stronger model.

Generally speaking, I find that today's robots are much better at writing t=
hese
sorts of docs than I am - as long as I sit at the helm and guide them
about where to expand on and where to keep it concise.

> +
> +ACL caching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +FUSE has allowed the usage of POSIX ACLs for a long time as they could b=
e set
> +and accessed simply as extended attributes. However, it was only with th=
e
> +addition of the ``FUSE_POSIX_ACL`` flag that ACLs started to be fully su=
pported.
> +Without this flag, ACLs can still be set, but the VFS won't use them for
> +performing permission checks - that would be the user-space server's
> +responsibility.
> +
> +Also, without setting ``FUSE_POSIX_ACL``, ACLs will not be cached by the=
 kernel.
> +In this case, new inodes ``i_acl`` and ``i_default_acl`` fields will be =
set to
> +``ACL_DONT_CACHE``.
> +
> +On the other hand, if ``FUSE_POSIX_ACL`` is set during ``FUSE_INIT``, wh=
en an
> +ACL is accessed the VFS layer will first check if it's already cached. I=
f it is
> +not, FUSE ``->get_acl`` operation is called, which will eventually send =
a
> +user-space request. Future accesses to this inode ACL will then use the =
cached
> +data.
> +
> +Setting an ACL in an inode, however, won't cache it immediately. It will=
 send
> +user-space a request with the new ACL, and the FUSE server may perform s=
ome
> +modifications before storing it.

Do not encourage this by documenting it please.
It reinforces that this was by design, rather than an oversight which
we don't know.

> +
> +On the other hand, ACLs will be removed for the cache in the following
> +situations:
> +
> +-  When setting an ACL in an inode and the user-space server has set the
> +   ``FUSE_POSIX_ACL`` flag, all previously cached ACLs for this inode wi=
ll be
> +   invalidated.
> +-  When invalidating an inode through the ``FUSE_NOTIFY_INVAL_INODE`` op=
eration.
> +-  When ``->d_revalidate()`` is called for a dentry that requires a look=
up (e.g.
> +   it has expired) and that lookup operation is successful.
> +-  When the VFS needs to check access rights for an inode (by calling
> +   ``->permission()``), attributes may need to be refreshed. If that hap=
pens,
> +   any cached ACLs for that inode will be invalidated.
> +-  After setting an inode attribute (i.e. operation ``FUSE_SETATTR`` is =
sent to
> +   user-space), the user-space server may have also updated the ACLs, so=
 any
> +   cached ACLs for this inode are also invalidated.
> +-  While processing ``FUSE_READDIRPLUS`` and a new dentry is added (unle=
ss this
> +   dentry is already being looked up (``DCACHE_PAR_LOOKUP``))
> +-  In general, when there is the need to sent a ``FUSE_STATX`` or
> +   ``FUSE_GETATTR`` to user-space (e.g. because the attributes have expi=
red).
> +   This may happen in the following cases:
> +
> +   -  When doing an ``->llseek()`` on a file with ``SEEK_END``, ``SEEK_H=
OLE`` or
> +      ``SEEK_DATA``.
> +   -  When the ``FUSE_AUTO_INVAL_DATA`` flag is set at ``INIT`` time (to
> +      automatically invalidate cached pages), and a buffered read
> +      (``->read_iter()``) past EOF is done on a non-passthrough file.
> +   -  When the ``FUSE_WRITEBACK_CACHE`` flag is set at ``INIT`` time, an=
d a
> +      buffered write (``->write_iter()``) past EOF is done on a non-pass=
through
> +      file.
> +   -  When the ``FUSE_AUTO_INVAL_DATA`` flag is set at ``INIT`` time and=
 the VFS
> +      needs to read a directory contents (``->iterate_shared()``) for a
> +      directory that is allowed to be cached.

No reason to repeat the reasons for attr cache invalidation that were
just listed above

> +
> +readdir caching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +When opening a directory for doing a readdir, a ``FUSE_OPENDIR`` will be=
 sent
> +and the user-space server will be responsible for setting the open flags=
 related
> +with caching, namely ``FOPEN_KEEP_CACHE`` and ``FOPEN_CACHE_DIR``.
> +
> +If neither flags are set by the user-space FUSE server, then every ``rea=
ddir``
> +will result in a ``FUSE_READDIR`` (or ``FUSE_READDIRPLUS``) request bein=
g sent.
> +If ``FOPEN_CACHE_DIR`` is set by the server, then the result of a ``read=
dir``
> +will be cached by the kernel and reused. However, if ``FOPEN_KEEP_CACHE`=
` isn't
> +also set, the cache will be invalidated next time the directory is open.

Confusing.
FOPEN_KEEP_CACHE is about keeping the cache on THIS open not on
some NEXT open.

Thanks,
Amir.
