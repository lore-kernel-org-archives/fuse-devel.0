Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7056E3876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723510; cv=none; b=nlWk9ubrCKG4XPboLb5/+/6JKna1f2NvHcqPA9WlmAuKGlWYkYjst2wBeZ2FUzezq9PAlA5fk9GTgJWAa1uNXY58wpw8ZmFLpe7Mtsw/40tr5R8Yw9ASKOMKUetne1B5Cs7H/ukIPkbcXbzXTpQnCqkmUALeRKdwYdQ72QOUz5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723510; c=relaxed/simple;
	bh=nuGuL09hfuDUC+xhxghFjNiNBe8M8uU2YlBQlKHJT1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aFBFDhMr2l0vWNxS/q/utGkXXx6Oukb3q7Exrbso/O3sA664GLDYiye6jOvECBRBjlmmO+1VWe8YWwwtOG6aB+Tk9W6u8p29MXM98b+dZOSiIcxDGYLlTRA+jelRStIZXvOm+boMHuUYxHgsyz8v/ggAX4l8ysuInu3e8+ye+Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpAjBRku; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpAjBRku"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f8bf96b46so1709155b3a.2
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723509; x=1777328309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvTkkVXP3GVmT6WAT69UVKj5b+JVaORcRNcE+y/YULY=;
        b=OpAjBRkubWbKJ1eEb8cs1p1xDJO9k8ZBZ/Y/KudY4hg0WPAs1/rgM16zrkqc6uTQTB
         ZVVKwj9buswzXax4rjRBvVlkLacCVrVNmIsm2kcG+pvsgwPd5ZDVtZXelwZ2XRrbS2hR
         YfpYHFFws+jXQbPgPYjS3m3fG5L0SYNBu9lSu4hiB+fUQ9XKJ2tvosHvLhaq9e+yAjSy
         8BW/6Za6LodShP8HamVT953a2sfaYMrNAKv261lNNklJmP2pfN7nHW34e1Ui5ejNQFA5
         mn8XPvJaBSw+OcT5SUA9f3X6rl/xRyOgLW5+LUlD6D7DC2nL2Y4Aq7tzajcwvdhlr1Pl
         tP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723509; x=1777328309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvTkkVXP3GVmT6WAT69UVKj5b+JVaORcRNcE+y/YULY=;
        b=Or7aDWXl/oJomDekjQNETp821IMGwtLUNMMxPbK4XgkJu8gCyKgH7N5l62MXH79BNh
         pqhb3QIjc8hjUaPh653A1/YZ2lKg6P0jId1SI9Gvk3qQU5nLmo99ThiPLrIZ95laIp7R
         myz3wmahV7aWP0zaQi1YsYyDPM/2itpvANRUISey7Q/pJ77CjxdCBmMJxesgX6YUsvo6
         NZYfJ1OX0oZTyg1HpGvnDUwi1DA7aWBrQLf9WFkJ887JRXo4qta2QxPF56FcuZ/kg+b0
         62l5WlZPFug313diWtgDnkjUvLDojbzgKQSfK5AYXzdq9mgdLDlzeuU5q8ZOhNA8NAeu
         JqSw==
X-Forwarded-Encrypted: i=1; AFNElJ+9ohc1G+MGdcO//nYNslabJ3oL6fHJlnKj7x0dj4RQcVcYK2vNvqfUBpr7myc8v4LB15f8/cAuqdBY@lists.linux.dev
X-Gm-Message-State: AOJu0YztOWowY5fdufX7N0PyQeA7gzJG6FVUja5WqXAO1JAhrHEC0K+x
	tr6y/mvJS+/ZzKUCm14l8q/0c90P+0zcmKqD8Mw4wpq3fGVHCV1kZBzUjRqtzQ==
X-Gm-Gg: AeBDietdyGjO9KppNUuLrA3oWz4FAW+25q8rtpPjwQoydS7syGhb5ng9Acp3HJcKSkH
	sJSfgnvgPDU5hDQ5a2DqcFBgHmX/RXA4sZ5Q7Y11Sd/rGTrBronbIwqom2iANEUZh/Y8QrCYMca
	BkQY5Iz/27AqbOnGaVpb9miMWvVUPFHSobQawYS0m7fUvAMRkmvIzpCdMLdWsAiMvPSmIQe4K1s
	XJekG3PsRpn4VTUOWXxrHMMkmZ4iA5txhknV7BANKE7DeVroxLJGtf/3ScQ3PkAQT0wY2PyvK37
	rX8sjDM+W3LZQj2I8mtjaWR3CBa2Unjp+GU4+sXfCIcwUBTl3NlVkZJeIVca9wIv63y1VtzRsjM
	l+AgP4g52pOFSh5ecUDlCvZor8daJhkTVQj2ZtjhAW8Fi5muw8fjOdraJX4Le9Xj3Xh0ziBK6+K
	0nutp18A1KnWvE4G236DP2yuGAFa0d
X-Received: by 2002:a05:6a20:938e:b0:3a1:2dbd:c33 with SMTP id adf61e73a8af0-3a12dbd622dmr7477077637.21.1776723508783;
        Mon, 20 Apr 2026 15:18:28 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:41::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797704c332sm8798880a12.30.2026.04.20.15.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:28 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 00/17] fuse: extend passthrough to inode operations
Date: Mon, 20 Apr 2026 15:16:20 -0700
Message-ID: <20260420221637.2631478-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends fuse passthrough to support inode operations (getattr,
setattr), directory readdir, and kernel-initiated open on backing files.

The existing FUSE_PASSTHROUGH mode attaches a backing file to a fuse inode
only when a passthrough file is open. This series introduces
FUSE_PASSTHROUGH_INO, a stricter mode requiring one-to-one inode number
mapping, which allows attaching a backing file for the lifetime of the fuse
inode.

Future work includes passthrough for additional operations (rename, unlink,
readdirplus) and full subtree passthrough, which will be part of a separate
series.

Patches 1-7 are from Amir from his git tree in [1]. There were a few
modifications made (removed separate FUSE_PASSTHROUGH_OP_STATX op,
modified fuse_kstat_to_attr() - the full diff of changes is in [2]); if there
are any mistakes, those are mine and not Amir's.

For testing/debugging, this was done using the passthrough_hp server with the
changes from [3]. readdirplus passthrough is not yet implemented, so after an
ls, subsequent operations on listed files will go through the server until
their dentries expire and a fresh lookup sets up passthrough. During
testing/debugging, I avoided ls and accessed files directly.

[1] https://github.com/amir73il/linux/commits/fuse-backing-inode-wip/
[2] https://gist.github.com/joannekoong/1e55f90c355a928eb5fa0ac9972c1d0e
[3] https://github.com/joannekoong/libfuse/commits/extended_passthrough

Amir Goldstein (7):
  fuse: introduce FUSE_PASSTHROUGH_INO mode
  fuse: prepare for passthrough of inode operations
  fuse: prepare for readdir passthrough on directories
  fuse: implement passthrough for readdir
  fuse: prepare for long lived reference on backing file
  fuse: implement passthrough for getattr/statx
  fuse: prepare to setup backing inode passthrough on lookup

Joanne Koong (10):
  fuse: add passthrough ops gating
  fuse: prepare to cache statx attributes from entry replies
  fuse: add struct fuse_entry2_out and helpers for extended entry
    replies
  fuse: add passthrough lookup
  fuse: add passthrough support for entry creation
  fuse: add passthrough support for atomic file creation
  fuse: use passthrough getattr in setattr suid/sgid handling
  fuse: add passthrough setattr
  fuse: add passthrough open
  docs: fuse: document extended passthrough (FUSE_PASSTHROUGH_INO)

 .../filesystems/fuse/fuse-passthrough.rst     | 131 ++++++++
 fs/fuse/backing.c                             |  58 +++-
 fs/fuse/cuse.c                                |   2 +-
 fs/fuse/dir.c                                 | 293 +++++++++++++++---
 fs/fuse/file.c                                |  61 +++-
 fs/fuse/fuse_i.h                              | 112 ++++++-
 fs/fuse/inode.c                               |  27 +-
 fs/fuse/iomode.c                              | 114 +++++--
 fs/fuse/passthrough.c                         | 170 +++++++++-
 fs/fuse/readdir.c                             |   5 +-
 include/uapi/linux/fuse.h                     |  33 +-
 11 files changed, 871 insertions(+), 135 deletions(-)

-- 
2.52.0

