Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0FE3876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723544; cv=none; b=ZTm0Rs6Zlmj29YK3PwruQ0Y3JhW2ZSZEccLPBn3koh0x49yMLA/lzvn5n8L+/64unBso/F/wPUBnr9uFTUPOzYIrVfrRKa9SaECYQFjxHNxAqnoO0C8ZBTxK6tyAN7OiLEue2sr4XNUJD1kvt8S3LkRaTiGKuYl6V6JPs4KB5Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723544; c=relaxed/simple;
	bh=JntQkDtFUhM4E31bauoWflFZw8JP6zjIQV8Md3g/5z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5BQfGxbp0PpSoiXLTXrK4RGZQZ41JDTn/S9UtuNFSUpZ819C1uskSu1IqyGw4bv/Hi8hZ3/WiRp0DrJer9VloWrxn0rB6biYiK336XQq1IGq46N4lDDRN05JSHKIoFCpdOteLmGGuzPL7EiMrLkKeYgoCp5dFoSeridRJp0/qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldIpqmae; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldIpqmae"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82f431c0ab6so1633800b3a.0
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723542; x=1777328342; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvcTvzbIShEwZpdR5zjsN7Iv5lkHpebIWTi37Bufnmo=;
        b=ldIpqmaeiAGbl5iNK+cDODiuxGBI0IIslhbLQDnK5whJ6pth7MjxMugbJVCOZcWL6d
         8Hk5J7f611ncl0hTvKNCMxykzHso0BFCNjSHh83RSecgeEgUTRx1z2MHhb4nkDE3Z1CS
         8ilVk5cJgyJF50NHMZTG27vICjc67hK/E8InNkCZQ6oNLli/l+CWvIoHe5LuzArFdmn+
         NLNrYWXHiH8qJ3mtZB/kpDvSx9f+K6Ohrs8kjM2a0zpn/c3L6u9a1FD3ty3UjS99cAOW
         oKfTqzQtt8+PR2UUe13EURLt8hE1zM1SN61U2CpNmyASoDoxXL0dVs1cFB73WbnfTyoQ
         qPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723542; x=1777328342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NvcTvzbIShEwZpdR5zjsN7Iv5lkHpebIWTi37Bufnmo=;
        b=HXOIbkHl+a9vNxUf92kh9o1iMDEoGaEw2EzI1VHitSELQ8vqatBvYfhSFNdcp6JmkS
         RhAjpeEdTFXxTZ8cQx4FEGidwZHbYed6Yjd1iryipZ/AT4+f46NsA2sOGHjKOBfVEaXw
         7j+Z5wR3sEx3jk+oGWF0xa51VwouQibEmZ3K/0lIKxQpa+Ux9PO+anSKumhjoG2K67AW
         83NG5glGOSMW1f4lTSu0P+xQ1CsKln6bzJRakGeHKNLgTDJiGB4IMjkpOxZzTRU4vWLQ
         QNAbS+QI7nIseyd64PEYXrWBAZBtmGUjF9e9NCxX1DPx5Y6eAn+3eI4PiYhAuWUtBj6/
         c1Rw==
X-Forwarded-Encrypted: i=1; AFNElJ+dmyXNJNpBGAjYG2cKXKlxa6SovDG5Pne5za5bvbsaBD/RUdWy/sNcv1eX/60gcVieXNa80xjE7Jc9@lists.linux.dev
X-Gm-Message-State: AOJu0YxONSudemSS7gc+pPkk09fCMs0cN4Wy9FCLS9+TRg9xrd7VDl0o
	Suf4D00oqS6BwbcWAOD9s7Xq/di75jjF254hwu1OFq+MWgd0wjRfYFkILchL9w==
X-Gm-Gg: AeBDievSSFenkTAE4vniROqYVAxxkXQbSI8p9iaTY94B6+UPla3ktGAU7S8o1yFEAMH
	fjvacadjmWfzDulGUrvNfGO0iLUzorUP/q28NDXWqcMS402QSTqg5zWENWEieooTvtzz09bRXHJ
	nEl4AsSo/gfkw1IAdqFNz6wu1DnKcBdSn7kDWxNR3sUYkLdVgTHa7tiaExafALJAW5cS7Y5Yrsu
	Am6A31hXQgBEOYtpcSzYDS7V9IttoUHmpteW3sVaSF7cL+7DTGGOK6bTbt/tDlqTjmUjAeQuS5K
	/c3ivRbHUro8xAqD+jKOlBaa4KaQgn4eJl4p+Zj3ckWqRN0gyYeSsIqFTjww91vdadZBreMlrOI
	1FJn1L6rLLmGoLIusEbVvALdk9IO/E8S5I+Jy5IKQRgb7EEiZ5osGGNBlHp4Gvy6n1ZUw4rwrcG
	6kFgm2Kq9q8aKaFTWIXi0LGTZAgfCD
X-Received: by 2002:a05:6a00:2ea5:b0:82f:37e3:ae82 with SMTP id d2e1a72fcca58-82f8c984060mr16832466b3a.44.1776723542470;
        Mon, 20 Apr 2026 15:19:02 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:59::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9f7735sm11920323b3a.21.2026.04.20.15.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:19:01 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 17/17] docs: fuse: document extended passthrough (FUSE_PASSTHROUGH_INO)
Date: Mon, 20 Apr 2026 15:16:37 -0700
Message-ID: <20260420221637.2631478-18-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260420221637.2631478-1-joannelkoong@gmail.com>
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add section about extended passthrough (FUSE_PASSTHROUGH_INO) mode.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 .../filesystems/fuse/fuse-passthrough.rst     | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/Documentation/filesystems/fuse/fuse-passthrough.rst b/Documentation/filesystems/fuse/fuse-passthrough.rst
index 2b0e7c2da54a..c7ccea597324 100644
--- a/Documentation/filesystems/fuse/fuse-passthrough.rst
+++ b/Documentation/filesystems/fuse/fuse-passthrough.rst
@@ -25,6 +25,12 @@ operations.
 Currently, passthrough is supported for operations like ``read(2)``/``write(2)``
 (via ``read_iter``/``write_iter``), ``splice(2)``, and ``mmap(2)``.
 
+With the extended ``FUSE_PASSTHROUGH_INO`` mode, passthrough is also supported
+for inode operations (getattr, setattr), directory operations (readdir), and
+kernel-initiated open (bypassing ``FUSE_OPEN``). In this mode, a backing file
+can be attached to a fuse inode for its entire lifetime, not just while a file
+is open.
+
 Enabling Passthrough
 ====================
 
@@ -46,6 +52,131 @@ To use FUSE passthrough:
      the ``backing_id`` to release the kernel's reference to the backing file
      when it's no longer needed for passthrough setups.
 
+Extended Passthrough (FUSE_PASSTHROUGH_INO)
+============================================
+
+``FUSE_PASSTHROUGH_INO`` is a stricter variant of ``FUSE_PASSTHROUGH`` in
+which the backing file inode number must match the fuse inode number, enforcing
+a one-to-one mapping. The kernel offers this flag during ``FUSE_INIT`` if
+``CONFIG_FUSE_PASSTHROUGH`` is enabled and the architecture has 64-bit
+``ino_t``. The server accepts by returning it back in the init reply.
+
+Enabling Extended Passthrough
+-----------------------------
+
+To use extended passthrough:
+
+  1. Follow steps 1-2 from `Enabling Passthrough`_ above. The server must
+     also negotiate the ``FUSE_PASSTHROUGH_INO`` capability during
+     ``FUSE_INIT``.
+  2. When registering a backing file via ``FUSE_DEV_IOC_BACKING_OPEN``, set
+     the ``ops_mask`` field in ``struct fuse_backing_map`` to declare which
+     operations should be passed through. At minimum,
+     ``FUSE_PASSTHROUGH_OP_GETATTR`` must be set for any inode-level
+     passthrough.
+  3. When handling a ``LOOKUP``, ``CREATE``, ``MKNOD``, ``MKDIR``,
+     ``SYMLINK``, or ``LINK`` request, the server responds with a
+     ``fuse_entry2_out`` (instead of ``fuse_entry_out``). To enable
+     passthrough on the inode, set ``backing_id`` to the id returned by
+     ``FUSE_DEV_IOC_BACKING_OPEN``. Set ``backing_id`` to 0 for inodes
+     that should not use passthrough. The ``nodeid`` in the response must
+     be the backing file's inode number (``i_ino``). If they don't match,
+     the kernel rejects the passthrough setup with ``-EIO``.
+  4. For passthrough open (``FUSE_PASSTHROUGH_OP_OPEN`` in ``ops_mask``),
+     no further action is needed. The kernel will open the backing file
+     directly without sending ``FUSE_OPEN`` / ``FUSE_OPENDIR`` to the
+     server. ``FUSE_RELEASE`` / ``FUSE_RELEASEDIR`` is also skipped.
+  5. For server-initiated passthrough open (without
+     ``FUSE_PASSTHROUGH_OP_OPEN``), the server handles ``FUSE_OPEN`` /
+     ``FUSE_OPENDIR`` as before and returns ``FOPEN_PASSTHROUGH`` with the
+     ``backing_id`` in the open response. A ``backing_id`` is required even
+     if the inode already has passthrough set up from lookup. The server
+     must use the same ``backing_id``. If the inode has passthrough,
+     the server must set ``FOPEN_PASSTHROUGH`` or ``FOPEN_DIRECT_IO``
+     on open as cached I/O mode is not allowed on passthrough inodes.
+  6. The server should call ``FUSE_DEV_IOC_BACKING_CLOSE`` to release the
+     backing file when it is no longer needed.
+
+Passthrough Operations Mask
+---------------------------
+
+When registering a backing file via ``FUSE_DEV_IOC_BACKING_OPEN``, the server
+sets ``ops_mask`` in ``struct fuse_backing_map`` to declare which operations
+should be passed through::
+
+    FUSE_PASSTHROUGH_OP_READ
+    FUSE_PASSTHROUGH_OP_WRITE
+    FUSE_PASSTHROUGH_OP_READDIR
+    FUSE_PASSTHROUGH_OP_GETATTR
+    FUSE_PASSTHROUGH_OP_SETATTR
+    FUSE_PASSTHROUGH_OP_OPEN
+
+Operations fall into three categories:
+
+**File operations** (read, write, readdir): Activated per-open when the
+server returns ``FOPEN_PASSTHROUGH`` in its open response. The backing file
+reference exists only while the file is open.
+
+**Inode operations** (getattr, setattr): Activated on lookup when the server
+returns a ``backing_id`` in the ``fuse_entry2_out`` response. The backing
+file reference persists for the lifetime of the fuse inode. Getattr is the
+minimum required inode operation.
+
+**Open passthrough**: The kernel opens the backing file directly without
+sending ``FUSE_OPEN`` / ``FUSE_OPENDIR`` to the server. ``FUSE_RELEASE`` /
+``FUSE_RELEASEDIR`` is also skipped. For regular files this implies passthrough
+read/write; for directories it implies passthrough readdir.
+
+Extended Entry Reply
+--------------------
+
+When ``FUSE_PASSTHROUGH_INO`` is negotiated, the kernel uses
+``fuse_entry2_out`` instead of ``fuse_entry_out`` for entry responses.
+This struct carries a ``backing_id`` and ``fuse_statx`` attributes instead
+of ``fuse_attr``.
+
+When ``backing_id > 0``, the kernel associates the inode with the backing file
+for passthrough inode operations. Statx attributes are not cached because
+passthrough getattr fetches them directly from the backing inode.
+
+When ``backing_id == 0`` (no passthrough), the statx attributes from the reply
+are cached normally.
+
+A negative ``backing_id`` is treated as an error. The kernel sends
+``FUSE_FORGET`` for the returned nodeid and fails the operation.
+
+IO Mode State Machine
+---------------------
+
+The ``iocachectr`` field in ``struct fuse_inode`` prevents conflicting access
+modes on the same inode (page-cache I/O and passthrough I/O cannot coexist)::
+
+    iocachectr > 0    Cached mode. N files using page cache.
+    iocachectr == 0   Idle. No files open, no passthrough.
+    iocachectr < 0    Uncached/passthrough mode. |N| references held.
+
+Each open file in passthrough mode holds one reference (``iocachectr--``).
+The inode-level passthrough setup holds one additional long-lived reference
+if the backing has inode ops (getattr/setattr). This long-lived reference is
+released on inode eviction.
+
+Cached mode and passthrough mode are mutually exclusive. Attempting either
+while the other is active returns ``-ETXTBSY``.
+
+For directories, the same mechanism arbitrates between cached readdir
+(``FOPEN_CACHE_DIR``) and passthrough readdir. A directory opened without
+``FOPEN_CACHE_DIR`` and without ``FOPEN_PASSTHROUGH`` is treated as direct I/O
+and does not affect io mode.
+
+Things to note
+--------------
+
+- ``FUSE_PASSTHROUGH_INO`` requires 64-bit ``ino_t``.
+- Readdirplus does not set up inode passthrough. Inodes created via readdirplus
+  use normal FUSE operations until a fresh lookup occurs.
+- An inode's backing association is set once and cannot be changed.
+- Passthrough and cached I/O cannot coexist on the same inode.
+
 Privilege Requirements
 ======================
 
-- 
2.52.0

