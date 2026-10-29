Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.68.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279291;
	b=V/n7oNRH69yLOhy+Ae3RVY4BRhqy0SqnZTgVr8q1IFV9xO/flYlZKbzqQqV4SARGJ8Gv
	 8GOHNluxxVzmhz9hTutUKdsH7VuG3njC4HO8CLztq+/6Hoe3WwOLIrfbWItbbU6rfaY8s
	 lUbT8QsQcsTohsd8PX9LAHbj2OsDJRjSzaqNkHkHU3Ipj6SlMsALtyRAJFj65IjZ8fqzt
	 DDKsmatNGBZAFd8NaYiag5W3Sfmn7VI7AQq2DaFG4YjlAJnYrIpc+bJ+UoI0n40SUsLy5
	 thpaHNaokeBgKHBFld2RaKryCEfq4eMg3fHDzmRBvHEk+KiXrNetL3RoAnbKLhSIdzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279291;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=slFiZxsS1tIiMG3e0bz0BQMiFhwbOquppwrsT3uKyhk=;
	b=o6r4jknsRWAH6Oc3W0QUZLmEGLMB7CKBys1Wy/KJg0BOMylaB35DXEgqFhJkFFRhjdeP
	 PiOE7z8Tf4zHOaK1WQBCP4ZsXM0yyBv2WTsGVzxn6TNIWlr0pTIQ1Rhby1nq2v147P0l+
	 wMdXazxaG/yfRHSMN+zMpTYj4CU5TRTILeUrlfGf9DLD0I5XiGu+2EIOqAA60Z52TYepe
	 7TIa7eg1+Ji07rpIOG7189C2gSRm8Nlit2kDczMwgv6uug0dXp7/0qLNC0sQq9cV6B7en
	 07X0VUql0hwKQWJjz3YTI6sj0R7yGo1cOIl7RrXG/hwnGCn5OFtAjXlWv904Gc5jvjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=fvZKwbZF;
	arc=none smtp.remote-ip=44.246.68.102
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B39606A31C
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 13:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B39606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=fvZKwbZF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793279291; x=1824815291;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=slFiZxsS1tIiMG3e0bz0BQMiFhwbOquppwrsT3uKyhk=;
  b=fvZKwbZFCuVh/mFNhPfkBbcn13IgaKn0NMVbt12tP/Ne1VVRxBe2RPiV
   +JF7noGQ/siCjwo3Oux1xFPqfZx8keLgrRECS5w25W394VZCqMmp3XqqQ
   mhY5gEoVSw0CK6cuOiuoLi7zoPDKcTQd+f0gCTJZM2UpeHFFl5eRLDmHY
   jloqVJyuNJ+rSMg5M4vGcJ1Xv2xY1FVo/Nb43a2l0maSx6GHKq2VczaqH
   zQVhgbbsuThnIzIIhItpRMUD9NqOk52JWTROW6C/tVJucZO99OSat7eOE
   MwLOUpocJXl/vpvhLXn+NcEpTIIEZayC4g2IY2qMe5OFwQPfWrdwMKHuD
   Q==;
X-CSE-ConnectionGUID: eWcrb3PVSK2XLSmlUwcqhA==
X-CSE-MsgGUID: G+yAjVBITVKxx5W4WAvX3g==
X-IronPort-AV: E=Sophos;i="6.27,184,1787011200"; 
   d="scan'208";a="32484593"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 13:08:10 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:9657]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.22.238:2525] with esmtp (Farcaster)
 id 428f7b37-2baf-4842-9d8c-7649e94ae293; Thu, 29 Oct 2026 13:08:10 +0000 (UTC)
X-Farcaster-Flow-ID: 428f7b37-2baf-4842-9d8c-7649e94ae293
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 29 Oct 2026 13:08:10 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 29 Oct 2026 13:08:09 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v6 0/2] fuse: atomic open
Date: Thu, 29 Oct 2026 13:07:56 +0000
Message-ID: <20261029130758.818617-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA003.ant.amazon.com (10.13.139.47) To
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

Changes in v6 (from the Sashiko review of v5 [5]):
- Keep FUSE_LOOKUP for O_EXCL without O_CREAT, which the VFS passes when
  it may not create the file, so that an existing name gives -EEXIST.
- With FUSE_ATOMIC_O_TRUNC, check O_TRUNC in file->f_flags, which keeps
  it on a read-only mount.
- Check that an opened reply is a regular file before fuse_iget().
- Test read-only mounts.

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

v5: https://lore.kernel.org/fuse-devel/20261028200459.2922951-1-jamz@amazon.com/
v4: https://lore.kernel.org/fuse-devel/20261026221639.628325-1-jamz@amazon.com/
v3: https://lore.kernel.org/fuse-devel/20261026190747.2373775-1-jamz@amazon.com/
v2: https://lore.kernel.org/fuse-devel/20261026151828.562870-1-jamz@amazon.com/
v1: https://lore.kernel.org/fuse-devel/20261020141647.3271341-1-jamz@amazon.com/

[1] https://lore.kernel.org/fuse-devel/20261026180649.1265825-1-jamz@amazon.com/
[2] https://sashiko.dev/#/patchset/20261026151828.562870-1-jamz@amazon.com
[3] https://sashiko.dev/#/patchset/20261026190747.2373775-1-jamz@amazon.com
[4] https://sashiko.dev/#/patchset/20261026221639.628325-1-jamz@amazon.com
[5] https://sashiko.dev/#/patchset/20261028200459.2922951-1-jamz@amazon.com

Jimmy Zuber (2):
  fuse: add FUSE_OPEN_ATOMIC
  selftests/fuse: add test for FUSE_OPEN_ATOMIC

 fs/fuse/dir.c                                 | 193 ++++++
 fs/fuse/fuse_i.h                              |   6 +
 fs/fuse/fuse_trace.h                          |   1 +
 include/uapi/linux/fuse.h                     |  20 +-
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/atomic_open_test.c       | 572 ++++++++++++++++++
 7 files changed, 794 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/atomic_open_test.c


base-commit: 9b1da7b4a4e197072e630c3b85d4100a399752ff
prerequisite-patch-id: 95a6559bc4490d7d82bc80ba961ac52e80429b34
-- 
2.50.1

