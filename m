Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.77.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041682;
	b=0tXvjlIcee5msJsi8OkiEnq4aC7FikHkr2tPSMhqRmIXgf35GYW8NRE6pQhuEbK+KDC7
	 M1nY7nuOlirSuiOFveF9l4Vo4FIVwXIHuzoD+ZyWMd/Xj/nHQd/o2sU14HgXqOduWKOgg
	 uWG9ji6eYL5lLb1DK98hVOi1VRddZdbJez/XhFPT4NgA6HWI6uIULiwuEp9Q07xE9YtI7
	 x8LA/kLPF94tv/ElDPxf3Cab5MhomUnKLOgMLKCr/hMcwPT7iv1kI4dMs5c1meBGryev4
	 /BNLygUS3icx5v1XPF/JUqy9R7WhdZHNWNuU2e2mUFhRwOWgYFHEXkX1WfGVyPT8Jdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041682;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=MZeUKMxixS+I1u0ULWTGNUTBLp1on++UqguuEraVu/8=;
	b=3vVUmfaKf8IGmJqvGR7iLbeBDxQ83DDstZzT8Wy+4qYWAzX6dL/C+pTRZ+kdiU+UqT0o
	 1iC7SUYC1++7db7h9CTt4GHneEQqEdL/Imazqu1wcD+olkrBz9yq7mJ+BU+S73Zr6Gf/h
	 RNY876ihfrAHvhpCjLKmzREL49zDCusKZcdUUIlRRztalTdBK45HfnUzpjThoXczzNaM+
	 hW3JHX12CxZ4a2aOj6KTQxUmZhtH9EvIJUxLKtL934LYmmTltUqWVIiiY5U4RMnlUrLyY
	 xlc5JsR0gvWvvLRtdKmsCOsImXxvcatRTXE4iENZEojF+y/WEqOa9yP/I8s6pvQgILg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=oTi9ZBZM;
	arc=none smtp.remote-ip=44.246.77.92
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AD4606A327
	for <fuse-devel@lists.linux.dev>; Mon, 26 Oct 2026 19:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5AD4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=oTi9ZBZM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793041681; x=1824577681;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MZeUKMxixS+I1u0ULWTGNUTBLp1on++UqguuEraVu/8=;
  b=oTi9ZBZMlC4KVAmkZs3TFZpcUwV/uz2HP5NMte37ePiHNmJyE24carvy
   wsn31FbXojFnO8Fasl7BtMFX1BgHwIBlBmg8TMe5sUO2Ejdh0Uo12qAGG
   ucCgJluk62loRfF/W68bg30MfMpmMVw0F5AJUQXCHx9ZtktWOMJxYMTgh
   PYCxh/WLVnJZSSAKNq727cPCX4mdHS979b6+ZS4jG5K79hjoobu7K9VK5
   0aa5GZLRyRcMsH/q8D3NHin6HVpJdj+xhFUrlqZ7XfcGEczZgY9gxTbZI
   sRs0ho/RWs9273JymxKejL4UgUFwlaw1Foj8JMYf13jrvkJ3bNzq7VSJ8
   g==;
X-CSE-ConnectionGUID: m5bOT9+aSNebNif2LbUrkw==
X-CSE-MsgGUID: wwDp98KER6iy1waYEMcB0g==
X-IronPort-AV: E=Sophos;i="6.27,180,1787011200"; 
   d="scan'208";a="32284549"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 19:08:01 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:8357]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.29:2525] with esmtp (Farcaster)
 id b817f386-7e46-4266-b3ea-95762c605afd; Mon, 26 Oct 2026 19:08:01 +0000 (UTC)
X-Farcaster-Flow-ID: b817f386-7e46-4266-b3ea-95762c605afd
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 19:08:00 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 19:07:59 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v3 0/3] fuse: atomic open
Date: Mon, 26 Oct 2026 19:07:44 +0000
Message-ID: <20261026190747.2373775-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Add FUSE_OPEN_ATOMIC, allowing the kernel to skip LOOKUP to improve
performance. A server implementing FUSE_OPEN_ATOMIC will look up
the name, create it if O_CREAT is supplied, and open it in one request.

The reply says whether the file was created, as Miklos suggested in [1].
The overall pattern follows his sketch in [2]. For a cached
name, the kernel compares the returned nodeid with the cached one and
looks the name up again on a mismatch.

A server without FUSE_OPEN_ATOMIC replies -ENOSYS and keeps today's
behaviour.

This series applies on top of "fuse: fix use-after-free in
fuse_create_open() error path" [3].

Tested with a new selftest under UML and KVM.

Changes in v3 (from the Sashiko review [4]):
- Patch 1: strip FOPEN_CREATED from the open flags, which broke
  passthrough. Check name_max before FUSE_OPEN_ATOMIC. Reject a reply
  whose inode is not a regular file or is bad, and skip page cache
  invalidation for DAX, as fuse_open() does. With default_permissions,
  check the attributes in the reply before opening an existing file.
- Patch 2: only an open that skipped the LOOKUP checks the name, so
  reopens through /proc/self/fd, open_by_handle_at() and other
  vfs_open() callers open by nodeid. Keep the LOOKUP for directory
  opens, and with default_permissions while the cached attributes have
  expired. Check the open again against the attributes in the reply.
  Set the open flags only after the reply checks, so a mismatched
  passthrough reply is released without an inode. Read the parent and
  name under rename_lock, and send RELEASE before FORGET.
- Patch 3: test the above. Skip without /dev/fuse, and leave the server
  state mapped at teardown.

Changes in v2:
- Drop the d_drop() before d_splice_alias() for an entry-only reply, and
  use d_splice_alias() for FUSE_CREATE and FUSE_OPEN_ATOMIC replies.
  FUSE_TMPFILE keeps d_instantiate(), as its dentry stays unhashed
  (NeilBrown).
- Describe what the server does and when the kernel checks permission
  in each case (NeilBrown).
- Check in the selftest that an O_TMPFILE file has no name in its
  directory.
- Rebase onto fuse for-next, which has f1ac607f786f ("VFS: enhance
  d_splice_alias() to handle hashed dentries"). Accept a fuse_open_out
  without backing_id_64, as FUSE_CREATE and FUSE_OPEN now do, and test
  it.

v2: https://lore.kernel.org/fuse-devel/20261026151828.562870-1-jamz@amazon.com/
v1: https://lore.kernel.org/fuse-devel/20261020141647.3271341-1-jamz@amazon.com/

[1] https://lore.kernel.org/all/CAJfpeguEK4JsFo60=yHkpLL6XkDGS7cQ5GOhiFL379KsYk0TsQ@mail.gmail.com/
[2] https://lore.kernel.org/all/CAJfpegvXtXY=Pbxv+dMGFR8mvWN0DUwhSo6NwaVexk6Y6sao+w@mail.gmail.com/
[3] https://lore.kernel.org/fuse-devel/20261026180649.1265825-1-jamz@amazon.com/
[4] https://sashiko.dev/#/patchset/20261026151828.562870-1-jamz@amazon.com

Jimmy Zuber (3):
  fuse: add FUSE_OPEN_ATOMIC
  fuse: open cached files with FUSE_OPEN_ATOMIC
  selftests/fuse: add test for FUSE_OPEN_ATOMIC

 fs/fuse/dir.c                                 | 456 +++++++++++--
 fs/fuse/file.c                                |   4 +-
 fs/fuse/fuse_i.h                              |   7 +
 include/uapi/linux/fuse.h                     |   8 +-
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/atomic_open_test.c       | 624 ++++++++++++++++++
 7 files changed, 1043 insertions(+), 60 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/atomic_open_test.c


base-commit: 9b1da7b4a4e197072e630c3b85d4100a399752ff
prerequisite-patch-id: 95a6559bc4490d7d82bc80ba961ac52e80429b34
-- 
2.50.1

