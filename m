Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.68.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510487;
	b=sObF1ZRIpOIOFkqZIuSOQgRXk93b0eHHH4vlXMEvJ5N9YEc76kKzE6VRsUTE1/F02baM
	 PE2xL9BkFI4f+nGIZ7QbBKfkesMinX6LMOTk5F+Avi76NxNS5D5OLSQTPwulv1GiyXnoz
	 ugtguOu6PgVwWo+t54mbgL95lliyBNwq4vBHajME1AanM9ysY5o/j5hO23eEfXiiWbfkN
	 WEMfg6Lcwpq05pqoHmUtB1fGyRQ22W73Z7DbnmGPAZqbzW4dqevCxGFOocQrIzZBsVryM
	 3lEM3uaJOekUBWkuqCjDuxMwCidRjUtIL2oxkC6x+cc1osMnNnW20uh8vIgS5OPRLAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510487;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=jY/RYDNZQKLWWuVjcLPzBjF1+mi9bZRTEHR8KKJX5FU=;
	b=baL7d/uQIHx7ADR9kpNIQygkcJTeYu0edvEValut7VRjdQdJdCR0bCWW7Reer3oNwPlH
	 8sB89jrMhHYrFjTAJepQ3HIxHdQwroS5BRUmDDBOnOLg5tUmzNMDJDS+fxuAhK8WnM74T
	 79/rdIHQJqvGC9WLZ4WcCWr4baS+A4W6iZvXMlnwrAgtjjGExxw1pKWsrGEVXoqq2dylZ
	 UwfJGJdKracXuxLBjpdVdkJ10J2IF/fTZgpPUR0iKIo/IVloSuvZntQxKxcHuA5uDcHMM
	 lU7r0E7F6IE0uffpgcNmCVfhXDME84+f9ETocAT7hZ4gN/NFvbAAE23LR/BAb/aNwPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=l6Zl9qxv;
	arc=none smtp.remote-ip=44.246.68.102
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F02A606A31B
	for <fuse-devel@lists.linux.dev>; Tue, 20 Oct 2026 15:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F02A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=l6Zl9qxv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792510487; x=1824046487;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jY/RYDNZQKLWWuVjcLPzBjF1+mi9bZRTEHR8KKJX5FU=;
  b=l6Zl9qxv74oamOFQyXf7fN3TaBS1RP6Xx6/WXG13asFgVex8TYsXwoOM
   JzFX7Q7EC/wh72TMBRAaAKvnXJt3EknGR8bYlpJ5nsBWDr6xFoQRrIfMY
   0ksLCjJ+a4pBhG6oqPGjDJchYADlGD6UAr+uK1fMH71zn8oO2PxClG6ju
   19ZKDNJ1BPmXePFQQ5CqCMTt8YLj395GUBMwXMY1E+Ixfk32Ix8tZVc65
   F6Rt9R59z6EDWEbWDWW+xVraewSjQm2Y5LmwvVy4uzHx8h9J8cF3tv1Es
   DZNO3CAVv3tnKJJmJmBvQv7kxCtsbZriMEV7mNqE1KoN06/58swugBbIU
   g==;
X-CSE-ConnectionGUID: f/+S0pvbRhC6EDMnCMdCQQ==
X-CSE-MsgGUID: ajvgQGzbTdmURAd6Y4zJBQ==
X-IronPort-AV: E=Sophos;i="6.27,168,1787011200"; 
   d="scan'208";a="31668898"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 15:34:46 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:11818]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.1:2525] with esmtp (Farcaster)
 id ae251e3d-0861-4860-beb1-ced817c03ec4; Tue, 20 Oct 2026 15:34:46 +0000 (UTC)
X-Farcaster-Flow-ID: ae251e3d-0861-4860-beb1-ced817c03ec4
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 20 Oct 2026 15:34:46 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Tue, 20 Oct 2026 15:34:45 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>
Subject: [PATCH 0/2] fuse: skip LOOKUP before exclusive create
Date: Tue, 20 Oct 2026 15:34:30 +0000
Message-ID: <20261020153432.3812719-1-jamz@amazon.com>
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

mkdir(), mknod(), symlink(), link() and renameat2() with RENAME_NOREPLACE
look the new name up with FUSE_LOOKUP before sending the request. This
series adds an INIT flag, FUSE_EXCL_CREATE, with which the server fails
these requests with -EEXIST for an existing name, so the kernel can skip
the LOOKUP.

Tested with the new selftest under UML and KVM.


Jimmy Zuber (2):
  fuse: skip LOOKUP before exclusive create
  selftests/fuse: test FUSE_EXCL_CREATE

 fs/fuse/dir.c                                 |  10 +
 fs/fuse/fuse_i.h                              |   3 +
 fs/fuse/inode.c                               |   4 +-
 include/uapi/linux/fuse.h                     |  10 +-
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/excl_create_test.c       | 339 ++++++++++++++++++
 7 files changed, 367 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/excl_create_test.c


base-commit: b776cbe24cc1b79c7f5101762b0069b3f48b6a4b
-- 
2.50.1

