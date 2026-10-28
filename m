Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.1.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217916;
	b=DbWtP9VxwPDxAhY2ZokzB3pFkhpGYWQQx/Ny0EhosOs9cZiFiHy84oiPPrwbLsqDca5c
	 js0DomEowJsoiECjRDSbB1ErtvioOB+Q4SKZk9GfDQVoWr0PYYi98HzyfQmeSN3yMdKJK
	 TIuq4jZgiMYfH6PY6qgJ/PFVF22820J/4/bQ3LXjfiiL2fy6k3+MrWasXATUwxtBzEclv
	 g2rIH40I+o2XHQ4spLRYPwRfcoIb+cmTPHgksbmlAZCXm8OVnpdv5eo1eEw2IKcsOty+x
	 fuirDdyndIIATXILBLqzRnrdyVyrWbedmeRfYeDPAUYJZd6OlSy67pAeiuZzDxk2STA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217916;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=MH4iaQR+/jajl4Dh9x8lW+xHi2nG33u+eddfkv6dxw4=;
	b=M16gLnr96HMs4hG0n9+8oudpKFoMB6pSaLTWIM+ua/T2i82I2eU5W1Ny70l+05DRKUfL
	 nW490HCJuQxNW7raSWlSecglcZP7pAwuS7E9Lhs+IxTmqVC2NrmeEnTTVLErpfsSDRjIF
	 clLcJVTHxgzh98HUq240hutCvQvyjIl8/kTg2nFjyYSLfdcLdwkLi0pWSMolqI6AoFwkt
	 1IpO0MGztIWaKV+fLvnVP9hK9lH+DWwwIyGPDGRjQ/JYcIk66GcLjwqIDgquA6RNmT4ZY
	 N70VQLY4d9jnamflo3oC7qc6Wl1eZMmqJpSWweEUlkw2pbgdvZXqtK6041yA8ScbnJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Rqs84GDa;
	arc=none smtp.remote-ip=44.246.1.125
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72A9606A331
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 20:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B72A9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Rqs84GDa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793217915; x=1824753915;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MH4iaQR+/jajl4Dh9x8lW+xHi2nG33u+eddfkv6dxw4=;
  b=Rqs84GDaSqZ8nYCYNJWvnCu3Sg27oBaMW53UBZtoeeia9WcdTRWacP+K
   Ctds9i2J5fcAnpbe5aEVKJmjptF2b6xd8rsktQuXAapNUZHcIZ3im1Jn8
   zfkGYT8Lx/yvM4LvMMFo6Zgxdjn5CPOY9cmvDdJzNI1+3r0iLXLHyP0UU
   ZGbOLa+Q8LfIXQ0ZDBfymnNDTwrMtWv1h7w7NKz2s5sjJfxSB4Rd3SgxB
   2YtvLd5rSEfWlPnHdVuIftwwKzQcpnAmMtfs0L6qJQGRHqTkhlVkmhPnY
   l/mcfdnsEPtKMkcFhGdGHfV0oFOvE1kkBRHn2sPqy3u8liDgprqOJlCS/
   A==;
X-CSE-ConnectionGUID: ZidvGJTFSe+CdlmT2VsfhA==
X-CSE-MsgGUID: IB+nshi0RReTQ2mOvqgSeg==
X-IronPort-AV: E=Sophos;i="6.27,183,1787011200"; 
   d="scan'208";a="32511515"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 20:05:15 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:26098]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.52.149:2525] with esmtp (Farcaster)
 id 301bd968-d4e1-4eed-95f5-25096c9af69f; Wed, 28 Oct 2026 20:05:14 +0000 (UTC)
X-Farcaster-Flow-ID: 301bd968-d4e1-4eed-95f5-25096c9af69f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 28 Oct 2026 20:05:14 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 28 Oct 2026 20:05:13 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v5 0/2] fuse: atomic open
Date: Wed, 28 Oct 2026 20:04:57 +0000
Message-ID: <20261028200459.2922951-1-jamz@amazon.com>
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

The kernel sends FUSE_OPEN_ATOMIC from ->atomic_open() for names
not in the dcache. This replaces a LOOKUP and OPEN or a LOOKUP and
CREATE with a single FUSE_OPEN_ATOMIC. Names in the dcache are not
supported by FUSE_OPEN_ATOMIC, since that needs a VFS change.
FUSE_OPEN_ATOMIC does not carry O_TRUNC, so that the VFS can evaluate
permissions before truncating. Servers that don't support
FUSE_OPEN_ATOMIC are handled gracefully.

This will result in servers seeing opens that the kernel has not yet
permission checked, as with ->atomic_open() on other filesystems. If
the check fails, the kernel will release the opened file.

This series applies on top of "fuse: fix use-after-free in
fuse_create_open() error path" [1].

Tested with a new selftest under UML and KVM.

Changes in v5 (from the Sashiko review of v4 [4]):
- Limit the series to ->atomic_open() and its test. Opening cached
  names (v4 patch 2) moves to a later series.
- Let the VFS check the open after the reply. The request carries the
  open flags without O_TRUNC, and the VFS truncates with SETATTR.
- Handle FUSE_OPEN_ATOMIC in its own function; FUSE_CREATE is unchanged.

Changes in v4 (from the Sashiko review of v3 [3]): a LOOKUP when the
VFS drops O_CREAT or O_TRUNC, permission rechecks, and tests for them.

Changes in v3 (from the Sashiko review of v2 [2]): reply validation
(FOPEN_CREATED, name_max, non-regular and bad inodes, DAX).

Changes in v2: d_splice_alias() for all replies, documentation of the
server's side (NeilBrown), and a rebase onto fuse for-next.

v4: https://lore.kernel.org/fuse-devel/20261026221639.628325-1-jamz@amazon.com/
v3: https://lore.kernel.org/fuse-devel/20261026190747.2373775-1-jamz@amazon.com/
v2: https://lore.kernel.org/fuse-devel/20261026151828.562870-1-jamz@amazon.com/
v1: https://lore.kernel.org/fuse-devel/20261020141647.3271341-1-jamz@amazon.com/

[1] https://lore.kernel.org/fuse-devel/20261026180649.1265825-1-jamz@amazon.com/
[2] https://sashiko.dev/#/patchset/20261026151828.562870-1-jamz@amazon.com
[3] https://sashiko.dev/#/patchset/20261026190747.2373775-1-jamz@amazon.com
[4] https://sashiko.dev/#/patchset/20261026221639.628325-1-jamz@amazon.com

Jimmy Zuber (2):
  fuse: add FUSE_OPEN_ATOMIC
  selftests/fuse: add test for FUSE_OPEN_ATOMIC

 fs/fuse/dir.c                                 | 185 ++++++
 fs/fuse/fuse_i.h                              |   6 +
 fs/fuse/fuse_trace.h                          |   1 +
 include/uapi/linux/fuse.h                     |  20 +-
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/atomic_open_test.c       | 552 ++++++++++++++++++
 7 files changed, 766 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/atomic_open_test.c


base-commit: 9b1da7b4a4e197072e630c3b85d4100a399752ff
prerequisite-patch-id: 95a6559bc4490d7d82bc80ba961ac52e80429b34
-- 
2.50.1

