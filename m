Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.245.243.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793053013;
	b=M4MlAWDooLGKIFmgxv7AOnYFiuAOGSF/N8HgRFNUZxq2xmnR6ky0lJz1sa+kR86UKLyj
	 BaZpC/wHT4QsA9zj3FuLQtN4luxGIV7v3Q4koWzKoX7wIHdwXjFwcGM9uCeDOUdKk6AXw
	 ovX6t+mN0eY8svNM15qlvGmVEo+nvBfEbnf9KN0l9egLCok63OX2qs5IAFplLLvDxUhoO
	 eHJgNRvlgkbBYKd+Q6Zr2t10yibHNDAFs9Pa+G1/6dyOmUF/LJVz8kUyf+U0wXhkaf5q2
	 F0UXnpgOIMCcHorZn9PRx3VwScYZmOrho4exzs9QEw9Iahv9P9j1I9qPJSoFU2bFI+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053013;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=oYLNp/KBd8cWClCriPTlevazgiupONa/MEd8NDSNKdQ=;
	b=s2rZy7C21U+lxOhsgW8C5EbHJYomWkAB3VLL4eUDD/JmGmkNFYyZjHfiFuMkRGEHh3OR
	 D/3biOWIoUfQ4/0jrgXD8Dc1OZb3MaRoMZVRbKB8OdV6SPL8xpc4UNtZxVlkhFUsy2Kt0
	 j9KIVQebCY2lXIQNHuzKeS3/Elrq1B0+qLMHpUd8+cBmeSKVMk1uoF4hnY2vSP9Fb8yvU
	 MJr+ayIghfGxyPhuZoI3r6VMv+rylAN9sz1HdrqfBPdgpSd2LJrbkmAjeV9LhgIcwB4x6
	 xfd4pQaG9pjHnyt7/0dPpNGRHDDEcoGIBASFtEjouZNXlQE2jZWm2im1uUrxQ8w0npw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=kFsWGRIq;
	arc=none smtp.remote-ip=44.245.243.92
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11955606A31B
	for <fuse-devel@lists.linux.dev>; Mon, 26 Oct 2026 22:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11955606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=kFsWGRIq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793053013; x=1824589013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oYLNp/KBd8cWClCriPTlevazgiupONa/MEd8NDSNKdQ=;
  b=kFsWGRIq9JG21OT586/AUbkz8SnknA2Pa656aqJhwiwd/sIbEOmcAoqo
   gU+SmVqV6duUCq4waEuNSwTZViKmGebgTbxpK0SnrpeCxU4++d9VdNjqU
   4ckRI7ZuB25tmWfRK7C00W8Wj1tahMbTcjyCV0EWHjRlApKpcrSXXkuju
   j72ZOnQ1RxWumnrxT4MfccSvSOU2bRo6bMcsOv4b4IEZphOxW9Op1SPUx
   d2OPzFJjFXytevPYX4peOpV09P625xrAsh/irKcF+6huNa+lZluQls6G5
   fpYJjtsa7dak4bLw3+Xk8y4yUrbMO5XrtV07n8cdh6iQXIvQm6rCFiLOP
   w==;
X-CSE-ConnectionGUID: cgixTkttS++4MWkxjhPAxA==
X-CSE-MsgGUID: Eg57CI57S6226rJE7vI+ew==
X-IronPort-AV: E=Sophos;i="6.27,180,1787011200"; 
   d="scan'208";a="31811820"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 22:16:52 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:27532]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.51.230:2525] with esmtp (Farcaster)
 id 60fdc627-6883-4e31-a72c-849f5f907a07; Mon, 26 Oct 2026 22:16:52 +0000 (UTC)
X-Farcaster-Flow-ID: 60fdc627-6883-4e31-a72c-849f5f907a07
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 22:16:51 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 22:16:50 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v4 0/3] fuse: atomic open
Date: Mon, 26 Oct 2026 22:16:36 +0000
Message-ID: <20261026221639.628325-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
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

Changes in v4 (from the Sashiko review of v3 [5]):
- Patch 1: when the VFS dropped O_CREAT or O_TRUNC (no write access to
  the directory, read-only mount), send FUSE_LOOKUP, so that O_CREAT |
  O_EXCL fails with EEXIST and O_TRUNC with EROFS. Reject a reply that
  opened an existing file for O_EXCL. On -EACCES from the check before
  opening, refresh the attributes and check again, as fuse_permission()
  does.
- Patch 2: fuse_open() checks the name on every open of an expired, hashed
  regular file, with no flag, so concurrent opens each check it. An open
  that did not look the name up and finds it changed returns
  -EOPENSTALE, and the retry opens the dropped dentry by nodeid. Backing
  files open by nodeid. O_CREAT opens keep the LOOKUP. The check after
  the reply uses inode_permission() and the O_NOATIME owner check, with
  or without default_permissions. Revalidate before fuse_open() prepares
  O_TRUNC and calls generic_file_open(). Keep an entry timeout of zero,
  and leave a name renamed during the request hashed.
- Patch 3: test O_CREAT | O_EXCL without write access to the directory,
  O_TRUNC on a read-only mount, and concurrent reopens of an expired
  name.

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

v3: https://lore.kernel.org/fuse-devel/20261026190747.2373775-1-jamz@amazon.com/
v2: https://lore.kernel.org/fuse-devel/20261026151828.562870-1-jamz@amazon.com/
v1: https://lore.kernel.org/fuse-devel/20261020141647.3271341-1-jamz@amazon.com/

[1] https://lore.kernel.org/all/CAJfpeguEK4JsFo60=yHkpLL6XkDGS7cQ5GOhiFL379KsYk0TsQ@mail.gmail.com/
[2] https://lore.kernel.org/all/CAJfpegvXtXY=Pbxv+dMGFR8mvWN0DUwhSo6NwaVexk6Y6sao+w@mail.gmail.com/
[3] https://lore.kernel.org/fuse-devel/20261026180649.1265825-1-jamz@amazon.com/
[4] https://sashiko.dev/#/patchset/20261026151828.562870-1-jamz@amazon.com
[5] https://sashiko.dev/#/patchset/20261026190747.2373775-1-jamz@amazon.com

Jimmy Zuber (3):
  fuse: add FUSE_OPEN_ATOMIC
  fuse: open cached files with FUSE_OPEN_ATOMIC
  selftests/fuse: add test for FUSE_OPEN_ATOMIC

 fs/fuse/dir.c                                 | 499 ++++++++++++--
 fs/fuse/file.c                                |  22 +-
 fs/fuse/fuse_i.h                              |   7 +
 include/uapi/linux/fuse.h                     |   8 +-
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/atomic_open_test.c       | 645 ++++++++++++++++++
 7 files changed, 1120 insertions(+), 65 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/atomic_open_test.c


base-commit: 9b1da7b4a4e197072e630c3b85d4100a399752ff
prerequisite-patch-id: 95a6559bc4490d7d82bc80ba961ac52e80429b34
-- 
2.50.1

