Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4DB27707
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892718; cv=none; b=E2AKwJLHWQMLzPn+r3V40VRl5bOC7YX8lxAXNulTp3QSDeMv78TwIe1hbah/W8iqa63OQT/FyWWtxHtcoa9Ee87UjzzSq4dNRJxj4zZ74ZhTYPdibw8w+Wd/coAoGRL/bg2+oTXIpUnFM5BU5MVoDpq3FiTJKqFEzLyGwH9XZmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892718; c=relaxed/simple;
	bh=o67AANEOaaDmaW9WzNpQCZJDqZiiEfxqwrW/Av9TDlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sJyffJlpdw03UZ7TodOaRbsa7kKBw23Y37/iguujNbsDI9nz4iim2dDvwIxWy0wEceqAyfc29AGyPEnVqg3iqNVtXrgOu1+f21SyWqWHTWGqxHy5v7+ihNJ7BWw7MB1o+g0ZLUvSdKdAdbWYAG1EOYnmIa62FXcK/gOvH6qK3/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fl5RDOwT; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fl5RDOwT"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7bd5dde63dbso480747b3.3
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892715; x=1779497515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KLYnxOjuWihDf1OJ1uA3JEFFOQyrieXCrqDHfBzMay4=;
        b=fl5RDOwTTn+0ejbSOk0vJ+++4RpY1itRXEfn3Bh+T1729ZkO6nI4Mqw8HMrD+RyIYq
         ViUl7V8ygEwP2Qho4Sb+on/3t/Ae7qHg76CgH88fulLWHR4DA1FolFxiPlY3upfrVF4H
         PBH5AwMs38zg+VpM6Hw5QN9SXUvnj1qebxseVvrFkYQquOqrqJWrfptkJz+MCvCvD5ws
         TR5PjMqPIuOnNScXLSoUUgPyxkwpeFeNy8Ed532J0NGFX9gOq9J0g3NoEZCAIx+CRn5c
         YAXBrDogJN1IIdQfvArlI+mpDFyzlbnrfMCVvJC9XXpCXnHSCKBaxqHKq3y7Gr9b+30J
         b6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892715; x=1779497515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLYnxOjuWihDf1OJ1uA3JEFFOQyrieXCrqDHfBzMay4=;
        b=HYvAJcy/DJR0C6d83sRu44TJZmrS3eCqsEl8d/JuC+tGrUHYVZ+hP2C4u6RUd70sbZ
         9NXcbOoH1FzLLEoXzhyq0J/mzf0IfN/3bAXuGlSYMfMhYuzTqEYDuzZPZUxg2Nl9YOdl
         K0ndsKLpZ3cTTUoAgzAFqivz1xU0HOzvMN38lL2ZYoHulc3Qv9pryEQsaltDkfi4Tpsk
         Ka4HFHFgLvDB1J9dZUx6lt00XYdu1DpVpKH0tkrwCD33YH9ao1LkLmWKJk25CuHQpvqj
         kNnaX/2ZQz6UuMeapna9cL15O9GeQN3Rc+QIyKjTQ5IpcZoTvS3SL/gqNcUMe/l93nLz
         dlPQ==
X-Gm-Message-State: AOJu0Yzly+Yo1iYQpnVyxIm6tNU0yqdF88J1TmQDKDSVwR38aWKAFuZR
	XzNfqjWm2F/BgSyBWQKVZmVW7rjRqjd5YplSO6cSvT8NCAY/8LHE0QQI
X-Gm-Gg: Acq92OE11RKAH1bPAYE2FYxgvalgYuY53a3j2J4i+umrq8CH69MmNl3qTbvpLOBcLZq
	EqJt9vkbTbozXuiCSD02hMObdTfAmbL8BwLWbyxvprbtW5uBy3EvL9y8l8ckzpvmNYpcQnWVPeI
	mQy4QRdWKq7JP1wPit6wIxgujZKzPHD626rKTpHBVew9pAZnHC5q7zwrsULyHOGAde4qHo8QmTZ
	bWiDU+rHTKTxy78HFfilYJmJyzc7M5h/WNcxpKtDOQl9Bh++Z13Bb/aR+bi5Eahesxo5fmkgV5x
	d73IbdZ0uBd4wbOgczRvqyN5EA/JmRUocONZQwk6DnUG4j1ZQ0SLBTsZktduHRKRwklegsuwZwo
	IvXKR+wJLgVwU0RNQqbooz+uPO+xews9Kuw+Du8Pzxb1QsJ3A5DdnBWJMpTMawB3Wz03yPUyn/c
	etlD+awQPxKwved8PSdn2Rx2MhS4ZAjBg=
X-Received: by 2002:a05:690c:6c87:b0:7c0:8028:11f7 with SMTP id 00721157ae682-7c959b9720amr74834237b3.6.1778892715333;
        Fri, 15 May 2026 17:51:55 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:3f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c9cf5da147sm15615097b3.20.2026.05.15.17.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:51:54 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 00/21] fuse: extend passthrough to inode operations
Date: Fri, 15 May 2026 17:39:43 -0700
Message-ID: <20260516004004.1455526-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends fuse passthrough to support inode operations (getattr +
setattr) and directory readdir.

The existing FUSE_PASSTHROUGH mode attaches a backing file to a fuse inode
only when a passthrough file is open. This series introduces
FUSE_PASSTHROUGH_INO, a stricter mode requiring one-to-one inode number
mapping, which allows attaching a backing file for the lifetime of the fuse
inode.

This is based off Amir's work. Patches 1-7 are from his git tree in [1].

For testing/debugging, this was done using the passthrough_hp server with the
changes in [2] applied.

This series was run through fstests using passthrough_hp in [2]. There were no
regressions seen compared to passthrough_hp --nopassthrough and an improvement
in generic 683, 684, and 685 (dropping suid/sgid) now passing. Compared to
passthrough_hp without inode operations passed through, generic tests 080 and
215 (mapped write timestamp updates) now pass.

This is on top of commit ea2ff881bb8e ("fuse: reduce attributes invalidated on
directory change") + a locally applied patch [3], in Miklos's fuse tree.

[1] https://github.com/amir73il/linux/commits/fuse-backing-inode-wip/
[2] https://github.com/joannekoong/libfuse/commits/extended_passthrough_v2/
[3] https://lore.kernel.org/fuse-devel/20260513231437.1806724-1-joannelkoong@gmail.com/T/#u

Changelog
---------
v1: https://lore.kernel.org/fuse-devel/CAOQ4uxjBZL6CY0mJEiHrw8aR28MHg5pU+Pfr9fUqGdKPDOdwcw@mail.gmail.com/T/
v1 -> v2:
- Address Amir's feedback (especially about not mixing cached io mode with
  passthrough mode, dropping the passthrough open patch, modeling some of the
  logic after overlayfs)
- Diff between v2 and v1 for Amir's patches 1-7:
  https://gist.github.com/joannekoong/451eb02e716fa6321a622a61a95aea04

Amir Goldstein (7):
  fuse: introduce FUSE_PASSTHROUGH_INO mode
  fuse: prepare for passthrough of inode operations
  fuse: prepare for readdir passthrough on directories
  fuse: implement passthrough for readdir
  fuse: prepare for long lived reference on backing file
  fuse: implement passthrough for getattr/statx
  fuse: prepare to setup backing inode passthrough on lookup

Joanne Koong (14):
  fuse: handle zero ops_mask in FUSE_DEV_IOC_BACKING_OPEN
  fuse: handle partial io passthrough for read/write, splice, and mmap
  fuse: prepare to cache statx attributes from entry replies
  fuse: clean up fuse_dentry_revalidate()
  fuse: add struct fuse_entry2_out and helpers for extended entry
    replies
  fuse: add passthrough lookup
  fuse: add passthrough support for entry creation
  fuse: add passthrough support for create+open
  fuse: allow backing_id=0 in open to inherit inode's backing file
  backing-inode: add backing_inode_copyattr()
  backing-inode: add backing_inode_setattr()
  fuse: add passthrough setattr
  fuse: use passthrough getattr in setattr suid/sgid handling
  docs: fuse: document extended passthrough (FUSE_PASSTHROUGH_INO)

 .../filesystems/fuse/fuse-passthrough.rst     | 126 ++++++
 fs/Makefile                                   |   2 +-
 fs/backing-inode.c                            |  97 +++++
 fs/fuse/backing.c                             |  64 ++-
 fs/fuse/cuse.c                                |   2 +-
 fs/fuse/dir.c                                 | 391 +++++++++++++-----
 fs/fuse/file.c                                |  37 +-
 fs/fuse/fuse_i.h                              |  83 +++-
 fs/fuse/inode.c                               |  27 +-
 fs/fuse/iomode.c                              | 122 +++++-
 fs/fuse/passthrough.c                         | 122 +++++-
 fs/fuse/readdir.c                             |   5 +-
 fs/overlayfs/inode.c                          |  66 +--
 fs/overlayfs/util.c                           |  33 +-
 include/linux/backing-inode.h                 |  18 +
 include/uapi/linux/fuse.h                     |  32 +-
 16 files changed, 969 insertions(+), 258 deletions(-)
 create mode 100644 fs/backing-inode.c
 create mode 100644 include/linux/backing-inode.h

-- 
2.52.0

