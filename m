Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE32345EC0
	for <fuse-devel@lists.linux.dev>; Thu, 17 Sep 2026 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660054; cv=pass; b=XIZx3iAfY4ooA+Muu2QjeEpMx7XO/KuGU5vSWH+dNE7Vp096pqx953FWnNEACvz+6Vg4wG0XcLzXxc4jKOZfi20rc40ryXeIMJrypyP5j7UNaKoRT/oc6xvzr6VaVVzN3uoS9GsfemRsnDByG1xUuq1sk7ghMZ/8mY7AE5PHYOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660054; c=relaxed/simple;
	bh=y7iJTse76G4ucUZqi+M7vBGe+965ykVSunvIgxX0/3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RPswhZPiURh1YPNjyPrQKRlx+WgWUJXZXXPpzsHEY67ER6TzO8sutmAigM/tSUr0eRWKj6pS+CoKcQx9Q0uamaTcrG287duz38h7c8fmV++7m63FkPPbC+E33A9UBsQ+65wcOLr3feN3GmEs0QyKDwoE10MqFX3aONwrlGPlT0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xhhdijyk; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xhhdijyk"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f9f0b20so173555466b.3
        for <fuse-devel@lists.linux.dev>; Thu, 17 Sep 2026 08:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789660047; cv=none;
        d=google.com; s=arc-20260327;
        b=eERdjrBkeLuG4t9wUm6Cc4TZ+LdUfv3d6e+UEG3IMFDjoeo8ht7G4/WR5kezQ09poV
         29lHBsaI3lUTvP3SswOG62+L/Hszs4M9h+HT3O/a8pgzg3ZE+iEPyN2olMQmulrd2Cgd
         Zg+w3u1uderTdKlPg8dzgKzyVIWioRG0j2faJpqxYIKla8fdM8682PVLYBAd6KNofXfr
         6SPnNmIv1KfR49OAe5GD/Zd8qQ0wbyaXOgI960NSnEIeALPu98o4+ao2nyFrDO45YAPx
         AROUxOBNzalzaLRf/oA91iJvN8H7uAbOO3v9xtSruMwhOpaaBYXAhoF3FUl4PL3QVssK
         OAmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6x6xW2hYJmzX0BckreNr2G2CFmLyrZuvybTX8QaHySY=;
        fh=Gg15tzqkFg22rXo10kQYf+boJX8QiSAiP/A8R1NrV2Y=;
        b=bi2YPa/TZLPOgaJawh7ePZl9+i9vWNvF30G8OaOzCMMrSpYK09+Qw2MRYRHBw6o35Q
         h9wP3Xm9MzZgnE1yY08Hbnkf0UWIlqYLeHfz4Wvr9Hpxk9V5zeub7SD4xHsIxXMvGa6l
         rg9hZlkWb5e/m4PanuivPO0XVO4pbb+7keIZ7KuFnfJyDs5fnlL1OeZjKLCy+liblHYz
         cWkQFaFqFXYNJuOchbaKY0Ecaf2Y5Q9AY5ZVLOczoykG7Nf135xFy4djkLdPSp8YMN9M
         CdcbdB9RmWkyISi7WdTYI9UNX3fSvobo5KF3g4dTmmVL3N+6dLpa4MVrgWNBZAueRjbC
         JP6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789660047; x=1790264847; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6x6xW2hYJmzX0BckreNr2G2CFmLyrZuvybTX8QaHySY=;
        b=XhhdijykGEGNQ+fgb3Of8AUtuGR0BtX+laL1OAKBS/Yd3dgM1G5hFP8/l4fcilE6Ck
         Q+n76x1RGBSXMgGX4XIfAxNqluGHc1MbKgl4MhJidvHkAzdSZj97CYlvMEyjRIc6WC7l
         e3xlN6egcmY6hjoRTYadFgX9m7R4MvXJXpyGKKSKbZUQUxWWFByv9SSkrhd9mXGI6B+i
         oSctPKk+WtwfT4JWNIakB5N+Z+UXAJdTrP8KK0bkBYJY9kvkCo6fK5MAiVaoDJlsXfFo
         4Vx3HjezYci3/KxSuVRrhuHZlh8m6rEFwwnZzhRm639HrvOFFnEBDeO0ONKtqW6XCOKU
         G6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789660047; x=1790264847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6x6xW2hYJmzX0BckreNr2G2CFmLyrZuvybTX8QaHySY=;
        b=JckUCDbp7fQvpJpDIo33BIVYHJe3l+a3ZgvYY/7A25GYnk6wRelbQxcG+3SJJAuQnO
         UxEjlJr1DVelcEjUS6UArnm3d/ihhF1niKB2wjhl5xZ39E1byTEKRIXMU0rTs6qO1L3j
         dKfOGrZIHGzMZMXIMOWSOLI/H2vaU6oQ1y/eBdTgSWP5+J9YK4KvQtasQiEol2Nk/QTC
         s64/R6TrPRCv6OatDRqCwdpN4YpBxgojiRO6gEGaCV26kcgQKFrPY6E7jcqQrHERdoNX
         EdJH5ioHZPqdo+aB8Kt54pgePVe2eHlWF4wPtqTpQd4Xc/lOq73ggACIjhNh7bZghOqb
         IJ8w==
X-Forwarded-Encrypted: i=1; AKwUvBzfVZ6GeIqRRYJHQ0Exb1XSwrqZpKXEAOHWlbRfCt0OJYGCuuwFW8s8vbzTMmziXm8Gutgmmkqq6YaD@lists.linux.dev
X-Gm-Message-State: AFuF++mJu3rFmoCs+xEWRmaQQRnKFXvpX3hkeeo62bHybNTm9RIJEiID
	Zs17wGKlZEAkToe7FLantuUbY08uT5sZ14wPQgbpBIleO43NAzk9dPFTgmDlp7HuCv5xfpsBc3T
	mIgsRTz24DGwGHW/wmMJDbUBjhs8tkkg=
X-Gm-Gg: AYBFou3Zrv96UqwoGAp57bhV66M3chdAtgo5n12C7lFFM72Hy6DhZh8JZyJT3LR0RMF
	GrmPLfyveWDczN+9NrZKv5QtEbWmWlWzrE1ZoUJXRFEboh0s16EI+xDW2rQMX5fsYtVMPSvzPOQ
	Q3qRRXLodoFrPOj0pvVE4qEuCc/alGaopENYA2X1ykp7AKC7BYOrORX4umtf/UTveDvt7PTYrsZ
	YGtPczWGaEYSm+ikMQldJ32CZCTszNCYfDeJWfXlyecCtgXZdmDCx6X0e07AxKqi+pxjYepE9qP
	hrTUNdQw2tcaKaJ1US4oD/TbE9gjU9sc6pbb8WKE+isg7xV9Ao1VYYvk
X-Received: by 2002:a17:907:9343:b0:c29:4490:50c8 with SMTP id
 a640c23a62f3a-c29e51b2d0fmr670404266b.8.1789660046479; Thu, 17 Sep 2026
 08:47:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916155629.32421-1-luis@igalia.com> <20260916155629.32421-2-luis@igalia.com>
In-Reply-To: <20260916155629.32421-2-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 17 Sep 2026 17:47:15 +0200
X-Gm-Features: AcwNN1VotyV4kfW8TwYaGG-9pXTuMI1MGuctXsFZpheLcejQzMscYoicIU6JX-Q
Message-ID: <CAOQ4uxipJkiiy8pURxRFdKYbruBM8wQxArd8uAiv2Dh=tPwNhA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/8] Documentation: fuse: add document on caches
 being used by FUSE
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 5:55=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> This new file aims at documenting the caches that are used by FUSE.  At
> the moment only symlink, attributes, ACLs and readdir caches are describe=
d.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../filesystems/fuse/fuse-caches.rst          | 148 ++++++++++++++++++
>  Documentation/filesystems/fuse/index.rst      |   1 +
>  2 files changed, 149 insertions(+)
>  create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
>
> diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentati=
on/filesystems/fuse/fuse-caches.rst
> new file mode 100644
> index 000000000000..b133066429b1
> --- /dev/null
> +++ b/Documentation/filesystems/fuse/fuse-caches.rst
> @@ -0,0 +1,148 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +FUSE Caches
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document summarises the different types of caches used in FUSE. For=
 each
> +cache type, it documents the rules to insert data into it. It also docum=
ents the
> +rules for validating and invalidating data in the cache.
> +
> +symlink caching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Whenever there's a link resolution request for a FUSE filesystem, the VF=
S will
> +call into ``fuse_get_link()``, the ``->get_link()`` inode operation. Thi=
s
> +function will then send a ``FUSE_READLINK`` request to the user-space FU=
SE
> +server.
> +
> +The server can ask the kernel to cache all link resolutions by setting t=
he
> +``FUSE_CACHE_SYMLINKS`` flag during the ``FUSE_INIT`` negotiation. If th=
is flag
> +is set, when the VFS calls into the ``->get_link()`` operation, FUSE wil=
l
> +immediately call ``__page_get_link()``. The first time this is done for =
a
> +specific inode, it will result in sending the ``FUSE_READLINK`` request =
to
> +user-space. But the result returned from this request will then be added=
 into
> +the page-cache. The next time this link needs to be resolved, it will us=
e the
> +link resolution already cached, and will only fallback to user-space if =
the
> +folio isn't up-to-date.
> +
> +Attributes caching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Inode attributes may be obtained from user-space by different FUSE opera=
tions.
> +For example, ``FUSE_LOOKUP``, ``FUSE_GETATTR``, and also several other
> +operations that create file system objects (e.g. ``FUSE_MKDIR``). These
> +attributes obtained from user-space are cached by the kernel. They have,
> +however, a timeout associated and once it expires, they are invalidated.=
 The
> +next time the attributes are needed, a request (``FUSE_GETATTR``) will b=
e sent
> +to the FUSE server.
> +
> +The ``FUSE_GETATTR`` request can be sent to user-space in three differen=
t
> +scenarios:
> +
> +#. if the attributes for the inode aren't yet available in the kernel;
> +#. if they are not valid any more (timed-out, or have been invalidated),=
 or
> +#. if there is an explicit request for forcing the request to be sent (f=
or
> +   example, by using the ``AT_STATX_FORCE_SYNC`` flag in ``statx``).
> +
> +Regarding the attributes invalidation, they may happen in several occasi=
ons. For
> +example, upon a user-space request for invalidation, through
> +``FUSE_NOTIFY_INVAL_INODE``, ``FUSE_NOTIFY_INVAL_ENTRY``, or
> +``FUSE_NOTIFY_DELETE`` requests.
> +
> +FUSE uses fine-grained invalidation masks rather than invalidating all
> +attributes at once. The principle is that each operation only invalidate=
s the
> +specific attributes that the operation could have changed on the server.=
 The
> +masks used are:
> +
> +- ``STATX_ATIME`` - after reads and readlink, since the server may updat=
e access
> +  time
> +- ``STATX_CTIME`` - after xattr changes (including ACL set/remove) and r=
ename
> +- ``STATX_BLOCKS`` - after a successful flush with writeback cache, sinc=
e the
> +  server's block count may differ from the local one
> +- ``FUSE_STATX_MODIFY`` (``STATX_MTIME | STATX_CTIME | STATX_BLOCKS``) -=
 after
> +  writeback completion (without writeback cache), since the server may h=
ave
> +  updated modification metadata
> +- ``FUSE_STATX_MODSIZE`` (``FUSE_STATX_MODIFY | STATX_SIZE``) - after wr=
ites,
> +  truncate-on-open, and fallocate, since the server's size and modificat=
ion
> +  metadata may have changed
> +- ``FUSE_STATX_MODDIR`` (``FUSE_STATX_MODSIZE | STATX_NLINK``) - after d=
irectory
> +  modifications (create, unlink, mkdir, rmdir, rename), since the server=
 may
> +  have updated the directory's size, timestamps, and link count
> +- ``STATX_BASIC_STATS`` - as a full invalidation, used for server-initia=
ted
> +  invalidation (FUSE\ :sub:`NOTIFY`\ \_INVAL\ :sub:`INODE`), interrupted

What is this odd subscript format and why? Please remove it.

> +  setattr, and interrupted link
> +
> +The full set of invalidation points can be found by searching for
> +``fuse_invalidate_attr_mask()`` in the FUSE source.
> +
> +ACL caching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +FUSE has allowed the usage of POSIX Access Control Lists (ACLs) for a lo=
ng time,
> +as they can be set and accessed simply as extended attributes. However, =
it was
> +only with the introduction of the ``FUSE_POSIX_ACL`` flag that ACLs star=
ted to
> +be fully supported. Without this flag being set during the ``FUSE_INIT``
> +negotiation, ACLs can still be set, but the VFS won't use them for perfo=
rming
> +permission checks - that would be the user-space server's responsibility=
.
> +
> +Also, without setting ``FUSE_POSIX_ACL``, ACLs will not be cached by the=
 kernel.

This Also, feels out of place and unneeded for the document flow.

> +In this case, new inodes ``i_acl`` and ``i_default_acl`` fields will be =
set to
> +``ACL_DONT_CACHE``.
> +
> +On the other hand, if the ``FUSE_POSIX_ACL`` flag is set then, when an i=
node ACL

This OTOH, feels out of place and unneeded for the document flow.

> +is accessed, VFS will first check if it's already cached. If it is not, =
FUSE
> +``->get_acl()`` operation (``fuse_get_acl()``) is called, which will eve=
ntually
> +send a user-space request. Future accesses to this inode ACL will use th=
e cached
> +data.
> +
> +Setting an ACL in an inode will also result in sending a request to the =
FUSE
> +server for setting it. But this operation won't immediately cache the AC=
L -- it
> +will only be cached after it is accessed again and requested from user-s=
pace.
> +
> +On the other hand, ACLs will be removed from the cache in the following

This OTOH, feels out of place and unneeded for the document flow.
Which text is it referring to? Anyway, text seems better and clear without =
it.

> +situations:
> +
> +- When setting an ACL in an inode (and the ``FUSE_POSIX_ACL`` flag is se=
t),
> +  previously cached ACLs for this inode will be invalidated.
> +- When invalidating an inode through the ``FUSE_NOTIFY_INVAL_INODE`` ope=
ration.
> +- After setting an inode attribute (i.e. operation ``FUSE_SETATTR`` is s=
ent to
> +  user-space), the user-space server may have also updated the ACLs. Thu=
s, any
> +  cached ACLs for this inode are also invalidated.
> +- Whenever attributes are refreshed from the server. For example, when w=
hile

stray while - please remove

> +  revalidating a dentry (``->d_revalidate()``), or when updating a dentr=
y during
> +  while processing a ``FUSE_READDIRPLUS``.

stray while - please remove

> +- In general, when there is the need to send a ``FUSE_STATX`` or
> +  ``FUSE_GETATTR`` to user-space (e.g. when attributes expired).
> +
> +readdir caching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +When opening a directory a ``FUSE_OPENDIR`` will be sent to the FUSE ser=
ver, and
> +server will be responsible for setting the open flags related with cachi=
ng,
> +namely ``FOPEN_KEEP_CACHE`` and ``FOPEN_CACHE_DIR``.
> +
> +If neither flags are set by the user-space FUSE server, then every ``rea=
ddir``
> +will result in a ``FUSE_READDIR`` (or ``FUSE_READDIRPLUS``) request bein=
g sent.
> +If ``FOPEN_CACHE_DIR`` is set by the server, then the result of a ``read=
dir``
> +will be cached by the kernel and reused for the current open.

I understand what you mean but it sounds confusing.

> +``FOPEN_KEEP_CACHE`` is about keeping the cache on **this** open, not on=
 some
> +**next** open.

Suggest:

FOPEN_CACHE_DIR determines if readdir results of this open will be cached a=
nd if
readdir cache will be used to return readdir results during the current ope=
n.
If FOPEN_KEEP_CACHE is set, any readdir cache from previous opens is preser=
ved
when the directory is opened. Otherwise, the old readdir cache is
invalidated on open.

If you accept this phrasing and fix the style nits above, feel free to add

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.
