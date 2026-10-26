Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=50.112.246.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038032;
	b=Kxcxa+NLivi40D3dCDXRrdn6wvB8jHYKp9QnRK32lrTo1rN+q0lXJGY1XCdvZ7RReq5T
	 RuIHxFmhPRB5KpfI/yNQjWC9FZjvh3qZCLx+OHsO1P66UMioZpIL8l13KpMbqb8AXsvW5
	 YlUAA+JtAS51qp/LzE8721Ek2vtojqNvjs+NKB2XJ8WTQ0z7wN6ZcCFhybkY+xgq6n25w
	 D0l5i7j40V5apPAG/oSHIRlDok9wEZRNIStFKEeceArFajkGV/skGAZCRVcJTcQy8+p9l
	 S+OyhCKzd2RHWwCSkrdiGBq1io9qjVEpRDh8DzplQlUbxzMb/pli+CV+pBgMKEpHGRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038032;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=qufDdGDnVMzNJjFSQNb7wpETChRpwokNim7OCaEYUvk=;
	b=SkX2mpsVWqC+pDzz08ij7xelvhnPFDWXqoBh6icP9EAqtQb/YA/H9k+QbA3WC6g0kVgj
	 8zfzirPuHK90kqoN9IrinW0IEKheDV35ly3PL/tryXHZWc74GcfX/wwcJmGfFFU04zJqG
	 BLqOp7SBrdNed60RzPzc55Sw+3YxUVkrQvqKhC7eJh0lCDIkaUPxzrSxsvNJCP0EuZiK1
	 xt5Gvw6p/7krocfthgVsw1150OnxLoa+Or0MF/9ENSiAkzyzgVkVc2XnGB9KM3tfvpnvA
	 pN2EtfdLkxkyQFrgEnSx/nPAqoOiMOEZiAtQljSNTY/frLtDizIJ0yDAYzMWQ3oOJYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=KG7mcpkh;
	arc=none smtp.remote-ip=50.112.246.219
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65DA606A31A
	for <fuse-devel@lists.linux.dev>; Mon, 26 Oct 2026 18:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=KG7mcpkh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793038031; x=1824574031;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qufDdGDnVMzNJjFSQNb7wpETChRpwokNim7OCaEYUvk=;
  b=KG7mcpkhmjWEsTYk67KDrFrC7kfmlYanYdDE5NW9LeyCySOAQurHXLr3
   fql5Z2ew/4APZ3YExlsmlzvmLVxQBqqKJfg4im45W8HECap4R5QT9Ooxi
   bON7uVhJzmPKbMxtrSmCdEs5+N/2xNnkSG7peWCFEUl+XYXrnhcoWyRsX
   6hMAFHAHOeSvrHjdQej4ieNT/iqGlty2NDm4jHdzgQzIyc8Lft8hB+w0h
   gWJF0HW8CK7TnxM+oLlorRhlLe53N8m9KTkXd+Fi5LD4MAH1qRKgAwNnt
   I/Ijk2MThb0Ifj2BhKRBsjifRcHDzpKK9+2/eN4h64PSPxHlziP6MYp2j
   Q==;
X-CSE-ConnectionGUID: ZT1Asl9sQLqoQXv5kCjZsA==
X-CSE-MsgGUID: Vde9M0YuR72L+n4pwRNE8w==
X-IronPort-AV: E=Sophos;i="6.27,179,1787011200"; 
   d="scan'208";a="32056671"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 18:07:11 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:14738]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.29:2525] with esmtp (Farcaster)
 id 13710d47-7562-4549-a8cd-ad7ad4475763; Mon, 26 Oct 2026 18:07:11 +0000 (UTC)
X-Farcaster-Flow-ID: 13710d47-7562-4549-a8cd-ad7ad4475763
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 18:07:10 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 18:07:10 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>
Subject: [PATCH] fuse: fix use-after-free in fuse_create_open() error path
Date: Mon, 26 Oct 2026 18:06:49 +0000
Message-ID: <20261026180649.1265825-1-jamz@amazon.com>
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

An open can still fail after fuse_finish_open() has succeeded. For
example, an O_DIRECT open fails with -EINVAL if the file has no
->direct_IO method. By then the VFS has marked the file as open, so it
releases the file itself, which calls fuse_release().

fuse_create_open() also frees the fuse_file whenever finish_open()
fails, so fuse_release() then uses the freed fuse_file.

This happens when a file is created with O_DIRECT on a DAX inode that is
opened for passthrough, because fuse_dax_aops has no ->direct_IO.

Only free the fuse_file in fuse_create_open() if the file was not
opened.

Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
Link: https://sashiko.dev/#/patchset/20261026151828.562870-1-jamz@amazon.com?part=1
Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
Found by Sashiko while reviewing the FUSE_OPEN_ATOMIC series (see Link).
To reproduce it without a DAX device, I removed ->direct_IO from
fuse_file_aops and ran the open under UML with KASAN:

  BUG: KASAN: slab-use-after-free in fuse_file_release+0x31/0x123
  ...
  fuse_file_release+0x31/0x123
  fuse_release_common+0x65/0x71
  fuse_release+0x7f/0x8a

With this patch the open fails with -EINVAL and KASAN reports nothing.

 fs/fuse/dir.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 28516a1760e24..4c64a4f812395 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -917,8 +917,11 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 		err = finish_open(file, entry, fuse_finish_open);
 	}
 	if (err) {
-		fi = get_fuse_inode(inode);
-		fuse_sync_release(fi, ff, flags);
+		/* fput() releases a file that finish_open() opened */
+		if (!(file->f_mode & FMODE_OPENED)) {
+			fi = get_fuse_inode(inode);
+			fuse_sync_release(fi, ff, flags);
+		}
 	} else {
 		if (fm->fc->atomic_o_trunc && trunc)
 			truncate_pagecache(inode, 0);

base-commit: 9b1da7b4a4e197072e630c3b85d4100a399752ff
-- 
2.50.1

