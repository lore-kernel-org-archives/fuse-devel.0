Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90C138F64E
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 09:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882296; cv=none; b=aJrkYEYr/hkCV26CCJpYePWyFk+LMEtd7jb3jxO8ajaSG64TQGwUxplJtYMQCMSJhe4P9XFxAWvJTUKp9VDYntiDriCOS8nEvyenykOeiVikj7Nk3rHTH5BzbpABWkIGNva1NydQyOXMOFk4kJZ3ZMziHERi+lb0O9ANqbdjv7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882296; c=relaxed/simple;
	bh=GEyscDG3hRct4i5PqeupCLPTXDZZMD3LI88vgtxk/oI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GHeFCcWhQEisSD4FPhiNHXtNNS9/cAPJPaNr9fOeGQ5szFh1rQpycWpewAGLG4Zqeozpsn42j6HMvbiaqwp+LRvPX8w3F3j9mKCTJ+GDJEcXAwhts8YW/+SRT7K89t2G4a8Tu6Y4R4X0VIfdjsUlKN90B1vsDsOW//Dt4FvMVOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sABG/+OW; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sABG/+OW"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-313bab9cfe7so292959eec.3
        for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 02:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791882294; x=1792487094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dxhG2H1+Sm23DRdhBURFp45TF5bOWuOpjOESI+s8Fjw=;
        b=sABG/+OW4x2mmcETyJwe9PdS3it3WEaQUBVnkrTvVk8AsEoRXBgUeX1x2sBUyEcrD5
         /rninVvx4gDfhO9CfpMjqrDhM3d8+Osm1GQXsFSOigvvaUqTKzsJJEYNOE4NcqQDOqxJ
         H27xiulAYTkL6D5SScXchsIKcIdxbKhTBfr+kJdML2YA/DhfrRjN9VRTID1J5b+x8cO4
         EJl16mpYIsojq1cGiV5jiYib9reuLCERuz80lUT1mKUVy5oDWml1JRbGD+i7IyvNYgEm
         hoXcmVhTFb0/bXkaHpvGtWXWrITrZX1m5oX+TIjfpU52uJ+2jUTTWvosyix9ClfV9hQ2
         eVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882294; x=1792487094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxhG2H1+Sm23DRdhBURFp45TF5bOWuOpjOESI+s8Fjw=;
        b=mx8p0S9AQwDIEjC2Zx70rO2Jioc7pMH/pUzsDdYVOqGTKnF7tweW6d1g2Fck4lCGp5
         pncEt9lPbQB7CDll8gxEAFpJLTxbkk9ChNADkRP7iVCzyxEXi6ZDAXa8ZHwiBtzgeZ54
         AyR82cosxbRTiUbF4pih5VYO6WRYC0Kg/d1r9hRT3tCCe7lupYpcShCtgXab62oHV3CU
         DnGCFhhh8qXJ8Zyav8/nWx52zP/MtXYe/jFvKgFWZsZbBrE/I/xnhyQ+6qtF64PQhLrd
         UmoZHoHN8K9LhlQ4vbTnLWHlz42pjRZq6U+vaInZxPQUq/OVzq+RDN6UhzuYv5Ka934b
         /+QQ==
X-Gm-Message-State: AFq9FYIBe7gfYMsJY6TZVOQCt6o1k7fBe5AtAuXFtbLL4atOt6wXlY78
	BgXtcEJOAjxKP15PgnY7z+nt2E/u2ch8lBfe+wTrrs3GWM2o6HlVo+Zq
X-Gm-Gg: AYBFou3U+qqpeHYjPrODsFOF/BbZplmKhrE6SigqUfT2Sl9DJjqPjWWrV1zImF2reMG
	PHXnGr0YEjaCLkX6axDwLp+j+Mps2zqPDmtI9cEEluDi2gaTV+pWNYF1nw3pp1/x0tMK1Cs9yGh
	ll6CW1lPkYaDIlUUmUAt7FBvTVSUFNUmR4BZyFY7HVZG0yKkdn4vuqpNCauu1t8PndBIJgc8PAm
	WC7YSg1HZRTi4bQ1JxTnkMTgMGGnTBbAskw1xs7+FvblK7ODmW2+EcRsqXVicIJi7VK0mM1nCbm
	qEnw4Ukz+ibpM2Q9kpke0SsI7BGPMk7JtYMANpHHuVXqRpN8Hs8LSyqx0KQLlEYUJE0pGEOvvZM
	HOInbWopeSy9FW+Azo3Bg/uxmIhXCQHOYgVSeERV06axNDwRVOKJaVOO8vyTg9YJsxh0f7GpfHK
	oS+dKNkNFTAhCgC6raiazPtARFeoSdEl8r5Sv4xwWSvedNd3+k5E07EuPU09I90G5mo+jae1b+P
	0p54S3nAdvN/ABPzpXE6KWZYOxkLgJQSYt773p7No6vCRWEVpKBXEjC+/dmi8Xg
X-Received: by 2002:a05:701b:21ce:b0:149:c766:2965 with SMTP id a92af1059eb24-17a0d84a29amr2902969c88.2.1791882293581;
        Tue, 13 Oct 2026 02:04:53 -0700 (PDT)
Received: from localhost.localdomain (45.78.65.84.16clouds.com. [45.78.65.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2d2db98sm35211947c88.10.2026.10.13.02.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:04:52 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fuse: fix copy_file_range reply handling race
Date: Tue, 13 Oct 2026 17:04:47 +0800
Message-ID: <20261013090447.1180121-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__fuse_copy_file_range() selects its request opcode and output buffer
using fc->no_copy_file_range_64, then reads the flag again to handle the
reply. Copies to different destination inodes can run concurrently on
the same connection, so the flag may change while a request is pending.

For example, task A submits FUSE_COPY_FILE_RANGE_64 and waits for its
reply. Task B submits the same opcode, receives -ENOSYS and sets
no_copy_file_range_64. When A receives a successful reply, it reads the
uninitialized outarg.size instead of outarg_64.bytes_copied. This can
produce an incorrect return value, page cache invalidation range and
inode size update, and disclose stack contents if automatic stack
initialization is disabled.

If A also receives -ENOSYS, it instead mistakes that reply for rejection
of the legacy opcode and sets no_copy_file_range, skipping the legacy
fallback and unnecessarily disabling copy offload for the connection.

KCSAN reported the conflicting accesses:

  BUG: KCSAN: data-race in __fuse_copy_file_range / __fuse_copy_file_range

  read to 0xffff8881014a4d4d of 1 bytes by task 123 on cpu 4:
   __fuse_copy_file_range+0x1a7/0x6e0
   fuse_copy_file_range+0x54/0xd0
   vfs_copy_file_range+0x290/0x9d0
   __do_sys_copy_file_range+0x10f/0x2f0

  write to 0xffff8881014a4d4d of 8 bytes by task 119 on cpu 0:
   __fuse_copy_file_range+0x633/0x6e0
   fuse_copy_file_range+0x54/0xd0
   vfs_copy_file_range+0x290/0x9d0
   __do_sys_copy_file_range+0x10f/0x2f0

The bug can lead to leak kernel base address for KASLR bypass, the 
corresponding reproducer can be provided per request.

Use args.opcode for both -ENOSYS handling and output buffer selection.
It records the opcode actually sent and is updated on fallback, keeping
each reply tied to its request regardless of concurrent flag updates.

Fixes: 7a37f55af7af ("fuse: add COPY_FILE_RANGE_64 that allows large copies")
Cc: stable@vger.kernel.org
Assisted-by: GPT-6 Astra
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 fs/fuse/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 9a36d0329e221..939391b48cc9b 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -3019,7 +3019,7 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 	}
 	err = fuse_simple_request(fm, &args);
 	if (err == -ENOSYS) {
-		if (fc->no_copy_file_range_64) {
+		if (args.opcode == FUSE_COPY_FILE_RANGE) {
 			fc->no_copy_file_range = 1;
 			err = -EOPNOTSUPP;
 		} else {
@@ -3030,7 +3030,7 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 	if (err)
 		goto out;
 
-	bytes_copied = fc->no_copy_file_range_64 ?
+	bytes_copied = args.opcode == FUSE_COPY_FILE_RANGE ?
 		outarg.size : outarg_64.bytes_copied;
 
 	if (bytes_copied > len) {
-- 
2.43.0

