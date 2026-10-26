Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.83.148.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027923;
	b=IqP60rhgz6zAGZQsQEYUVGZ3w4S2U7wQNt5jQca8R3Hvi4JYpDZyxS346jsJYjfNPjRa
	 B0XhCzPQFWdfAIyKK+p1GLwqHQJSG+oXseqOsyOw5azhHLAGpw1ToOztLaKJDPIGngekq
	 vcHvVXfYY+x6klGRPWOW0wAv3QULsa9uROqdS1xZXe2CzfwrN9hoaXiEssqG0FS+YVz+5
	 OHk8EETAivsOgJ+LoHdsN/RZq5PosISzB3wo+tR89vHqdfTIdKf6QFrErrVTkWaTh8tKE
	 OU4dW0LJx2oObbtgN0aL57qjwG7346+8PU1OcPuEVQ3cyi+XD0vC2Ob8kk6LGQzcZyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027923;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ubItXXW0qI6D4IQ7nqsodkQ2CGCn1wdJNp8fz+VSQDo=;
	b=Ry8f5VdYXIFGVCbxM/Er1js68Rb/HfcUQxktG2WTIdkVpGXRPRPD7luji0L4uEKmHJNU
	 FblcnFUHnK8oOkM6pD6ZxLOjfROYI6GQJqnt2Fa9RemSVKjU5akcTfuaCBM9eKXU51hTT
	 e4lvE4zjleA4dn7N5VEJ2IGw4YpYj2jzFKI0Fldw+ZFGM9r5P8sWW8kVCGg35I0lRVHZC
	 i+mXoLlO51ooxedA///IUKclulw5uK1YYGcx19IQXE1Q0nBPJPQZ/VAoCMitQbq/FflZg
	 GI+Bea/HiFl2uF40A1VaBuEgqaLKggNJQPlb75djXErDswov6dm7zduw1Aa8NJdv7wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=J8qJsshO;
	arc=none smtp.remote-ip=35.83.148.184
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C01606A31E
	for <fuse-devel@lists.linux.dev>; Mon, 26 Oct 2026 15:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98C01606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=J8qJsshO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793027922; x=1824563922;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ubItXXW0qI6D4IQ7nqsodkQ2CGCn1wdJNp8fz+VSQDo=;
  b=J8qJsshOC0DnYk1BhaspfhB9ndCwoo6DC/NBS7pc7qngEnjg3rymQkeb
   +QyVFwKsZppdOOrMT6I1vRhCSQ8Km4ZLbrbkSu3PEyt4+2j3u2Fu+IQcw
   zFly6Jk7NH7vHzxWRcx+3t7wQciqySg5p6Mogw3yG0OIF0VUoLpsCTPpc
   MVuF+TEzctswwSfnR2wcKm66M1A1AsBy8+/tNp9FWnA085/W3dQyqXsKt
   bR/Qer5Bpj2iqoV7lWg7niWnAzfSCuF9YR/9g+VJMRJQ563sJ12Rj7924
   +EuwZ+rYUYVMWQYGuhXy7YWPSx7DIoaW/MuqEM8Ra7CkhswTwgxNORhKy
   g==;
X-CSE-ConnectionGUID: eqSKTsLxRe+BioamPe3wJw==
X-CSE-MsgGUID: jXU7HtC1TuKzWIEp73Zggg==
X-IronPort-AV: E=Sophos;i="6.27,179,1787011200"; 
   d="scan'208";a="32058671"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 15:18:42 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:21316]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.51.230:2525] with esmtp (Farcaster)
 id 25c73dc3-2c15-4c29-b832-1bfaa49daec3; Mon, 26 Oct 2026 15:18:41 +0000 (UTC)
X-Farcaster-Flow-ID: 25c73dc3-2c15-4c29-b832-1bfaa49daec3
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 15:18:41 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 15:18:40 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: jamz <jamz@amazon.com>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, "Bernd
 Schubert" <bernd@bsbernd.com>, Jim Harris <jiharris@nvidia.com>, "Horst
 Birthelmer" <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>,
	NeilBrown <neil@brown.name>
Subject: [PATCH v2 0/3] fuse: atomic open
Date: Mon, 26 Oct 2026 15:18:25 +0000
Message-ID: <20261026151828.562870-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

From: jamz <jamz@amazon.com>

Add FUSE_OPEN_ATOMIC, allowing the kernel to skip LOOKUP to improve
performance. A server implementing FUSE_OPEN_ATOMIC will look up
the name, create it if O_CREAT is supplied, and open it in one request.

The reply says whether the file was created, as Miklos suggested in [1].
The overall pattern follows his sketch in [2]. For a cached
name, the kernel compares the returned nodeid with the cached one and
looks the name up again on a mismatch.

A server without FUSE_OPEN_ATOMIC replies -ENOSYS and keeps today's
behaviour.

Tested with a new selftest under UML and KVM.

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

v1: https://lore.kernel.org/fuse-devel/20261020141647.3271341-1-jamz@amazon.com/

[1] https://lore.kernel.org/all/CAJfpeguEK4JsFo60=yHkpLL6XkDGS7cQ5GOhiFL379KsYk0TsQ@mail.gmail.com/
[2] https://lore.kernel.org/all/CAJfpegvXtXY=Pbxv+dMGFR8mvWN0DUwhSo6NwaVexk6Y6sao+w@mail.gmail.com/

Jimmy Zuber (3):
  fuse: add FUSE_OPEN_ATOMIC
  fuse: open cached files with FUSE_OPEN_ATOMIC
  selftests/fuse: add test for FUSE_OPEN_ATOMIC

 fs/fuse/dir.c                                 | 354 ++++++++++--
 fs/fuse/file.c                                |   4 +-
 fs/fuse/fuse_i.h                              |   7 +
 include/uapi/linux/fuse.h                     |   8 +-
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/atomic_open_test.c       | 518 ++++++++++++++++++
 7 files changed, 841 insertions(+), 54 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/atomic_open_test.c


base-commit: 9b1da7b4a4e197072e630c3b85d4100a399752ff
-- 
2.50.1

