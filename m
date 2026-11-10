Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.218.115.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325948;
	b=tDeJucJpmhfb3TnogBOhRdZcc9EpdwDjsfxwFasDV+zZ218asqjdM8mUMG238dRPrGCo
	 hbkirqMzQj5+5CDROZ4oZeojvyvjmlBOvAZs0mwj7MYArmTIjyjEDefjzL2pDbmt9dux0
	 mBLFvOCJD9q/W8aVoMEcst5LpvzN6RrNqaIbZm16geFuZD0inHUHcVRItWJKHRit9kakX
	 soFNq0d/DZE5CrygGMVzDi9W+gVK47cqXsI7HsoemaCh6qvw4VA5uVgs7uFux9YOR2rGe
	 NLdWtlM/J6MdlBUx3QDCzBPm7m60AMPxhjU0b+ySAbyZeorWFCpiBa094XfYiMm6dCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325948;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=QZFWKKJE8fGafiVMvaPa6WC0VVsDvT2djAqIlHg0dsU=;
	b=JmbkZLT0mdEtDoEdUrGHWfeYHcFIs+2bgXG/rhImp/Md3VNX4X/ncEriapoIFBftEHPa
	 Xp+U1VztLTrcUbIUSSF4YXoIQoG2ZpdgbN93ocNrxBAm7JWOyXQXfFPcTefVLuV1gV3nh
	 oagJMmIkAHvSOy7T5gROQ2dXKu6TsqJhD9iG0DnB7SMAzzWh+YQLphiC+dFsip09YktDl
	 BmXSOx8g9EeXEjIbgcF0wEpV17T8lrVCP+FiUIZmpQ2K2OPxL4mUeS6GQqrqn4XzB2x5D
	 xzMSZ+BcXuPPukJE/95/PGWlba3am+CIXTNpsKGm+9GmUz++qFw/qqJJWjVNL8Szy3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=opT874PR;
	arc=none smtp.remote-ip=34.218.115.239
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251EC606A31C
	for <fuse-devel@lists.linux.dev>; Tue, 10 Nov 2026 15:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 251EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=opT874PR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794325947; x=1825861947;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QZFWKKJE8fGafiVMvaPa6WC0VVsDvT2djAqIlHg0dsU=;
  b=opT874PROFkJJufqqQOQNGlbnDiXPSZJv45L830ZgIStdrWS8UbKmcXb
   zSVFPgaVYRBndjar1F6q+5IB9mwETrCFvgB7Z8+n1YwZJCzdrkjKyHHAA
   uyUAghKkbS4oUy80Lb/CU3k9IkGE6DsjO5cg2kKJsWw/bnfPOFHZFLhda
   yGy+AEzNgGssm3qkQ2oZIQ3bOAgVzvyAL8nzJTKOj8QqaJJEhGlephqIY
   v56HWkcG4V1yLKB8x5NzG75wKmXth2FgQChVkhSFoFn5bbaS03LYv8ATM
   I+KTQYUQRIywmvtt8n1avk2Rq+nQZav9ekQomerLtioPodwgRH6ainkAk
   A==;
X-CSE-ConnectionGUID: PSjVHh/ORXekdKQx6nR3Ig==
X-CSE-MsgGUID: 5bcDGyqTRESH9B4ZmO5+NQ==
X-IronPort-AV: E=Sophos;i="6.27,206,1787011200"; 
   d="scan'208";a="33402618"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 15:52:26 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:28780]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.61:2525] with esmtp (Farcaster)
 id 9e0d77f1-317a-414e-a53c-30d1b2787d90; Tue, 10 Nov 2026 15:52:26 +0000 (UTC)
X-Farcaster-Flow-ID: 9e0d77f1-317a-414e-a53c-30d1b2787d90
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 10 Nov 2026 15:52:26 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 10 Nov 2026 15:52:25 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v7 0/2] fuse: atomic open
Date: Tue, 10 Nov 2026 15:52:17 +0000
Message-ID: <20261110155219.2175318-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Add FUSE_OPEN_ATOMIC. FUSE_OPEN_ATOMIC is FUSE_LOOKUP plus FUSE_OPEN or
FUSE_CREATE in one request. With FUSE_OPEN_ATOMIC, the kernel opens a
name that is not in the dcache with one request to the server. This
greatly improves performance for file systems where the bottleneck is
calls between the kernel and the server. Servers that don't support
FUSE_OPEN_ATOMIC are handled gracefully.

The kernel sends FUSE_OPEN_ATOMIC from ->atomic_open(). For a name with
a valid positive dentry, the kernel sends FUSE_OPEN. FUSE_OPEN_ATOMIC
for that would need a VFS change.

If the server opens an existing file, the VFS checks permissions after
the reply, as on other filesystems with ->atomic_open(). If open() fails
after a valid reply with fuse_open_out, the kernel sends FUSE_RELEASE.
The kernel clears O_TRUNC in FUSE_OPEN_ATOMIC, and follows up with a
SETATTR, so it will never truncate files before permission checks.

Earlier series also proposed one request for lookup and open in FUSE
[1][2]. This series covers only ->atomic_open(), with a single new
request and no VFS change.

Note on tmpfile: FUSE_TMPFILE shares fuse_create_open() and its
d_instantiate() with FUSE_CREATE [3], and this series changes
only ->atomic_open() (NeilBrown's question [4]).

This series applies on top of "fuse: fix use-after-free in
fuse_create_open() error path" [5].

I used Claude Code and Sashiko to help write and review the code.
I reviewed and tested every change. Tested with a new selftest under
UML and KVM.

Changes in v7:
- Reword the commit messages and comments after NeilBrown's review of
  v6 [6]: the server can open an existing regular file or return only
  fuse_entry_out, and it opens each file that it creates.
- Test an existing regular file with a reply of only fuse_entry_out.
- Rebase onto fuse for-next at 7.4-rc1.

Changes in v6 (from the Sashiko review of v5 [7]):
- Send FUSE_LOOKUP for O_EXCL without O_CREAT, so do_open() returns
  -EEXIST for an existing name that the caller may not create.
- With FUSE_ATOMIC_O_TRUNC, check O_TRUNC in file->f_flags. On a
  read-only mount, the VFS clears O_TRUNC in the flags argument, and
  file->f_flags contains O_TRUNC.
- Before fuse_iget(), reject fuse_open_out for a file that is not a
  regular file.
- Test read-only mounts.

Changes in v2-v5: see the earlier versions below.

v6: https://lore.kernel.org/fuse-devel/20261029130758.818617-1-jamz@amazon.com/
v5: https://lore.kernel.org/fuse-devel/20261028200459.2922951-1-jamz@amazon.com/
v4: https://lore.kernel.org/fuse-devel/20261026221639.628325-1-jamz@amazon.com/
v3: https://lore.kernel.org/fuse-devel/20261026190747.2373775-1-jamz@amazon.com/
v2: https://lore.kernel.org/fuse-devel/20261026151828.562870-1-jamz@amazon.com/
v1: https://lore.kernel.org/fuse-devel/20261020141647.3271341-1-jamz@amazon.com/

[1] Dharmendra Singh, "FUSE: Implement atomic lookup + open/create"
    https://lore.kernel.org/all/20220517100744.26849-1-dharamhans87@gmail.com/
[2] Bernd Schubert, "fuse: full atomic open and atomic-open-revalidate"
    https://lore.kernel.org/all/20231023183035.11035-1-bschubert@ddn.com/
[3] https://lore.kernel.org/all/20220922084442.2401223-11-mszeredi@redhat.com/
[4] https://lore.kernel.org/fuse-devel/179264679002.1724252.4479504779598097455@noble.neil.brown.name/
[5] https://lore.kernel.org/fuse-devel/20261026180649.1265825-1-jamz@amazon.com/
[6] https://lore.kernel.org/fuse-devel/179332437497.269288.7305999595462479305@noble.neil.brown.name/
[7] https://sashiko.dev/#/patchset/20261028200459.2922951-1-jamz@amazon.com

Jimmy Zuber (2):
  fuse: add FUSE_OPEN_ATOMIC
  selftests/fuse: add test for FUSE_OPEN_ATOMIC

 fs/fuse/dir.c                                 | 193 ++++++
 fs/fuse/fuse_i.h                              |   6 +
 fs/fuse/fuse_trace.h                          |   1 +
 include/uapi/linux/fuse.h                     |  20 +-
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/atomic_open_test.c       | 583 ++++++++++++++++++
 7 files changed, 805 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/atomic_open_test.c


base-commit: ab9787d7e66ac7e6e94fc975b37c5b56fff98ca9
prerequisite-patch-id: 95a6559bc4490d7d82bc80ba961ac52e80429b34
-- 
2.50.1

