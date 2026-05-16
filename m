Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C952E414
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892795; cv=none; b=cJ0Q3wpPui9omdv1o9ZmEdu3s1F8DBYncV5qkA1ShpiIJ6QQqZmVqsDmSPbm2OR887zjllWhX2Tsl01kODnaBHC3TnpdWczTku7RTri0CahJVSoDmrywfEERV9e3v5ywshXoHg69P8q7cGZsaJD9nvnasVi49GHoe2qwSI7/4S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892795; c=relaxed/simple;
	bh=HZuLxa9kn33PmOh1eQinrdqY89hmVfqTn5glb5t99L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUSMcpjDil/BvYxYcOki5Yiy328syXKIrt/8ojaGYxSfMIwUQZLq250msKnHAnlgEtvsHAECtnOVKfv3zRkMFfsSBG9iUJcJaWSI0/Q3538NuGmIZPRCgID98kODMR290VFMpPjLm9AsDGpxe6/lFP/7DlWf+hXOFXhYdMuBzZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSXYxewF; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSXYxewF"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7c04749d739so437187b3.3
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892793; x=1779497593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPEeB/dHLBfPqWqQyDIRQ/8jEtODW78QgZfV4bDovUo=;
        b=mSXYxewFo/6OR1s7WwgX++Bqsf29+ksYtYtJWMQ9d34Ibt+j6dcp9TNESg9fAbhmTb
         /UwGqR4mGiv2eeAHFICfdQl8qYrVfnzb9SspYSWCY3akwVRWAJhhQ2RlX1Dk2dyTkTHO
         eowUOMcUNO47hSYJ6zz5EUz+y9QOSQ6E0zbGkwEu12J7rX/yc4kXAOyp37YFWQo2ecd7
         H6oxg7x9SVdy05gTyLWABoyhHhh3I8OcuCIyWSVC2GsPTn3SVmAWQrmyhagsV1LtGAZx
         /uxqGMbf9hLnmIrijxABLP4+/MnCwHdiAiEKOM34giaMMkHtfQrEFVAKMb2q/rkqUK3t
         /JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892793; x=1779497593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cPEeB/dHLBfPqWqQyDIRQ/8jEtODW78QgZfV4bDovUo=;
        b=Zo0KFY/2jGwCEOAU0DggqJCcqQXuNKzfyBOLfKB6gsKkRXHNFmLbSLWaWYtNepNhfV
         ZvNcRD5+9hrVCwzeBf0S+3hxGBYy310kWYyXZkfMTTnvQQbycgggXL9Rwc1TAfZx151J
         B4tFyH+PvPoNrjpd4i/ZJQ4JyREHDnj5AMEo6w/BGCS4m6WeM9JxnfQ+yW/u2bFgUaoj
         K0Kf+pRHlhVVGvzXaRoSZE2py7MQLD1w9i+hQd84euLOwcaiKt0xOzyHic5wlxOZOxbM
         KF99JyErfm3CLQy5qSZRFLDuTTk/3uyC1A6BE+W5um77+jgNeOWB8TSXtlPkCLQQCkL6
         Vifg==
X-Gm-Message-State: AOJu0Yxp+Y8xsRV5c/VokghjE0UcRLf+8fdIZE/P7H9QYzBGSztTrUZJ
	HnprGGOkIIFB1VQHLbQpi37tODQdgPBAI9IwWaXxK3nCUilXJmuMyCL6
X-Gm-Gg: Acq92OEhb0P7x3R71qAY44FQk6hf04KTGcTNy3my5nRqvE8iFRNSKFTnnFfMfT8LMMK
	0ImYSF+6sw5by07F6PoexTOK+88YS4KWdT6+6ngA8uL3XLQuNgU2I0FCspJiGplGToK83YoTB8z
	VUnpPXFMJ+ybeiLcwGMIXeRT8OzgUsFt1Uyd0BpULGYzgoYSV4+3t8i8SRhAsyTBvHXUu9LFEwY
	sh6rIWlpkBh8N0Ql6EkKzfRTdkIMadgmDW2bXwRJB2rXFO71ux7EjcgMCRZNO29hCFPBZFiVeHO
	RKhg0StOutMiIPQfkf7eNRlVbDjpccWFQPtP7vGb0E8/9a3j46QGwnJZaNWXeux1w/0X3MRu8D7
	IBE4wIBBoP+/A0NKaGfgwG69A16GnoE1+yqKZQZgdzRFJfCCRdKgLnog2LmodoJhTzACILd6rKz
	GEm8u8mGOca+5cpmn571Sz
X-Received: by 2002:a05:690c:6c87:b0:7c9:30f5:2048 with SMTP id 00721157ae682-7c9599a3e98mr71634087b3.18.1778892793274;
        Fri, 15 May 2026 17:53:13 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:3f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f22d07f3sm36689457b3.2.2026.05.15.17.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:53:12 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 21/21] docs: fuse: document extended passthrough (FUSE_PASSTHROUGH_INO)
Date: Fri, 15 May 2026 17:40:04 -0700
Message-ID: <20260516004004.1455526-22-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260516004004.1455526-1-joannelkoong@gmail.com>
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
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
 .../filesystems/fuse/fuse-passthrough.rst     | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/Documentation/filesystems/fuse/fuse-passthrough.rst b/Documentation/filesystems/fuse/fuse-passthrough.rst
index 2b0e7c2da54a..751d27c6fc5c 100644
--- a/Documentation/filesystems/fuse/fuse-passthrough.rst
+++ b/Documentation/filesystems/fuse/fuse-passthrough.rst
@@ -25,6 +25,11 @@ operations.
 Currently, passthrough is supported for operations like ``read(2)``/``write(2)``
 (via ``read_iter``/``write_iter``), ``splice(2)``, and ``mmap(2)``.
 
+With the extended ``FUSE_PASSTHROUGH_INO`` mode, passthrough is also supported
+for inode operations (getattr, setattr) and directory operations (readdir).
+In this mode, a backing file is attached to a fuse inode for its entire
+lifetime.
+
 Enabling Passthrough
 ====================
 
@@ -46,6 +51,127 @@ To use FUSE passthrough:
      the ``backing_id`` to release the kernel's reference to the backing file
      when it's no longer needed for passthrough setups.
 
+Extended Passthrough (FUSE_PASSTHROUGH_INO)
+============================================
+
+``FUSE_PASSTHROUGH_INO`` is a stricter variant of ``FUSE_PASSTHROUGH`` in
+which the backing file inode number must match the fuse inode number, enforcing
+a one-to-one mapping. The kernel offers this flag during ``FUSE_INIT`` if
+``CONFIG_FUSE_PASSTHROUGH`` is enabled and the architecture has 64-bit
+``ino_t``. The daemon accepts by returning it back in the init reply.
+
+Enabling Extended Passthrough
+-----------------------------
+
+To use extended passthrough:
+
+  1. Follow steps 1-2 from `Enabling Passthrough`_ above. The daemon must
+     also negotiate the ``FUSE_PASSTHROUGH_INO`` capability during
+     ``FUSE_INIT``.
+  2. When registering a backing file via ``FUSE_DEV_IOC_BACKING_OPEN``, set
+     the ``ops_mask`` field in ``struct fuse_backing_map`` to declare which
+     operations should be passed through. At minimum,
+     ``FUSE_PASSTHROUGH_OP_GETATTR`` must be set for any inode-level
+     passthrough.
+  3. When handling a ``LOOKUP``, ``CREATE``, ``MKNOD``, ``MKDIR``,
+     ``SYMLINK``, or ``LINK`` request, the daemon responds with a
+     ``fuse_entry2_out`` (instead of ``fuse_entry_out``). To enable
+     passthrough on the inode, set ``backing_id`` to the id returned by
+     ``FUSE_DEV_IOC_BACKING_OPEN``. Set ``backing_id`` to 0 for inodes
+     that should not use passthrough. The ``nodeid`` in the response must
+     be the backing file's inode number (``i_ino``). If they don't match,
+     the kernel rejects the passthrough setup with ``-EIO``.
+  4. When handling an ``OPEN`` request for a FUSE file, the daemon
+     replies with the ``FOPEN_PASSTHROUGH`` flag set in
+     ``fuse_open_out::open_flags`` and provides the corresponding ``backing_id``
+     in ``fuse_open_out::backing_id`` or leaves ``fuse_open_out::backing_id``
+     blank. If the daemon would like to opt out of passthrough when the inode
+     is already in passthrough mode, it may additionally set
+     ``FOPEN_DIRECT_IO``, which will forward read/write operations directly to
+     the daemon.
+  5. The FUSE daemon should eventually call ``FUSE_DEV_IOC_BACKING_CLOSE`` with
+     the ``backing_id`` to release the kernel's reference to the backing file
+     when it's no longer needed for passthrough setups.
+
+Passthrough Operations Mask
+---------------------------
+
+When registering a backing file via ``FUSE_DEV_IOC_BACKING_OPEN``, the daemon
+sets ``ops_mask`` in ``struct fuse_backing_map`` to declare which operations
+should be passed through::
+
+    FUSE_PASSTHROUGH_OP_READ
+    FUSE_PASSTHROUGH_OP_WRITE
+    FUSE_PASSTHROUGH_OP_READDIR
+    FUSE_PASSTHROUGH_OP_GETATTR
+    FUSE_PASSTHROUGH_OP_SETATTR
+
+Operations fall into two categories, which can be combined:
+
+**Inode operations** (getattr, setattr): Activated on lookup when the daemon
+returns a ``backing_id`` in the ``fuse_entry2_out`` response. The backing
+file reference persists for the lifetime of the fuse inode. Getattr is the
+minimum required inode operation.
+
+**File operations** (read, write, readdir): Require the file to be opened with
+``FOPEN_PASSTHROUGH`` in the daemon's open response. Read and write can be set
+independently for partial passthrough. If only one direction is set, the other
+falls back to direct IO and mmap is disabled.
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
+    iocachectr > 0    Cached mode
+    iocachectr == 0   Idle. No files open, no passthrough
+    iocachectr < 0    Uncached/passthrough mode
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
+- If any inode operations are passed through, this means all opened files need
+  to set the ``FOPEN_PASSTHROUGH`` flag in the open response, even if reads
+  and writes are not passed through. If reads and writes are not passed
+  through, they will go directly to the daemon.
+
 Privilege Requirements
 ======================
 
-- 
2.52.0

