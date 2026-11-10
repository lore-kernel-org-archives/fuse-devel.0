Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.13.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343473;
	b=ctXWuOrkqlYzdvgOgRq70tKyBaZmYnvVdgDKMtR5rBK/kbQDRkmaVGM1KnkR8JD0rCsN
	 A0rzgZx2KhLaO+srBW3HKeJhk+ovhync3btFEushO7wzgHT1VXc+FsV29xYCVTVI16lXA
	 0WfSLT42dAtIHV9hgKHqi6VE5Z9qhPHC70gXUJ1khaOQ/bVIlXzdie+CJtKrMxo8lzjvp
	 wpbZHSRdW1D6o0FbFR+Jrkcf0qYukfGpL2M67weNX6yBbTmOvtW5BxPlwyCkZfUe4eixU
	 jeXOhO26VN9IpE9gA0rbX6xnDRNXOvXZLSsGA8yk0YgkwAiRIcCbqsEcFyAH9wZnmYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343473;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Yr7AmTjhtaDuAyMokVe6PKeMqP8Y5YJ4ICeD0g2OcRo=;
	b=SbBhSusfzXHtkr8Bl7IXGd+Vz4tta473i0yKlH1VL9R2FT2kCOAjVahEEpKSDsYMOLGr
	 Fp+LGdUf7tOmrskLc77qup2mfkbcpiYwn24/OJZDgkPP0kN+BOAg4vnFDqCxmm69xoh9b
	 tWVgWFkdRiuUu6TlZI5X0pJiid3OEzPWVmkYdeV+BAf7wMKRp4SfuLUyLhErNYMr68jhH
	 2CFcOn5vfxs8Fzn19E9VDv1b7XqUIFH3Ew5plhUiMvk+MsNR1PukRSkKwh+XKKGbXIpb6
	 E4N7ziEoaNW/KbwwPpNm/1jDC9v9r/l/MOMMao098ij/4RfQX+HiB/uzNiGs/iQH4Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=dyLy07sf;
	arc=none smtp.remote-ip=52.13.214.179
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C0F606A325
	for <fuse-devel@lists.linux.dev>; Tue, 10 Nov 2026 20:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C0F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=dyLy07sf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794343473; x=1825879473;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Yr7AmTjhtaDuAyMokVe6PKeMqP8Y5YJ4ICeD0g2OcRo=;
  b=dyLy07sf7PIvCOKkuCcVc/okM/Z+jYLpfceJmIOmg/xUCSc6V70HnYoc
   GDBVaRgmU/tsK8r8I2/xu/HRvf7CWomdmE1jCUABQEow2kcbJ4o+H+9mE
   aNL45LsNz5dF9usYcHiB9CUAKY6NGaMDsUYl3mK02prYPv9TPggjuwXKE
   8dQx4AYx1MW3w3P4cpQVh20nouwQuBoKYneVDKD9YCFbYH0mKbPGlcAKN
   iWKtmgT4KpZ4Zr/LV2rTnQtXq39+pcA1ykUSGqqiLD9YHSd6taJJ7rAtk
   OnTgAdXNFa2MS2sHvWfI62Y0Yjsoc/cSS41hu0I9bZPdPWjhanmQzuDL6
   Q==;
X-CSE-ConnectionGUID: ZSFckXSRQNeisxSB3+LUNg==
X-CSE-MsgGUID: RWOS5BvES3KK3asnGgApjQ==
X-IronPort-AV: E=Sophos;i="6.27,206,1787011200"; 
   d="scan'208";a="33630797"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 20:44:32 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:29963]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.61:2525] with esmtp (Farcaster)
 id b05dbcf9-5e5e-4b52-b2d8-099b6a4f9779; Tue, 10 Nov 2026 20:44:32 +0000 (UTC)
X-Farcaster-Flow-ID: b05dbcf9-5e5e-4b52-b2d8-099b6a4f9779
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 10 Nov 2026 20:44:32 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 10 Nov 2026 20:44:31 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v8 0/2] fuse: atomic open
Date: Tue, 10 Nov 2026 20:44:19 +0000
Message-ID: <20261110204421.1251726-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
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

Changes in v8 (from the Sashiko review of v7 [8]):
- Send FUSE_LOOKUP for open() with O_DIRECTORY. The server opens only
  regular files, so FUSE_OPEN_ATOMIC saves no request for O_DIRECTORY.
- Test open() with O_DIRECTORY.

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

v7: https://lore.kernel.org/fuse-devel/20261110155219.2175318-1-jamz@amazon.com/
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
[8] https://sashiko.dev/#/patchset/20261110155219.2175318-1-jamz@amazon.com

Jimmy Zuber (2):
  fuse: add FUSE_OPEN_ATOMIC
  selftests/fuse: add test for FUSE_OPEN_ATOMIC

 fs/fuse/dir.c                                 | 194 ++++++
 fs/fuse/fuse_i.h                              |   6 +
 fs/fuse/fuse_trace.h                          |   1 +
 include/uapi/linux/fuse.h                     |  20 +-
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/atomic_open_test.c       | 594 ++++++++++++++++++
 7 files changed, 817 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/atomic_open_test.c


base-commit: ab9787d7e66ac7e6e94fc975b37c5b56fff98ca9
prerequisite-patch-id: 95a6559bc4490d7d82bc80ba961ac52e80429b34
-- 
2.50.1

