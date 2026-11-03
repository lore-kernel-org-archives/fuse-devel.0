Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695213;
	b=5BNzb7LtrLz6m3iAyeWT/0UjWu7etnYZsxGPkmvxb/EQk8A5wm3D28/HmbFhneeJVod7
	 uyDRlQ2vXCBUiV1Bsoi/g1dF1Sb1zr7sdpHSU6bQ31FEIiWZfHZuu+02sT9twRxuYOuK5
	 ERkPcU3wq6SSgTjcoDe+6HQBmK9V+uy5Pw+3ctpaLmIIsd1PS0MfPeE0Z3RsfK+Y22R3F
	 vXvXr4IXaRke8mScDoWLxfEXPo3U1w45zXxYcfjVqHG5w+WCJKFFKkPIvokilNVYMnNQy
	 2YXvVMRuLLtRJVXCmJRvQFDA5xNpxvGXj8Si8GR3MsJz/ND/PeiFxQdOAHImZqvWAvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=a9yCqBKnWEF+1G5GJ+rwV3M7Y3WdLHInlO9rhMJ5y4c=;
	b=LldUoSXldWfB+zHFRVfZP0VbEbze6ONUjsb747AJ/JKLOzL8S7giWqS9XXsy6Xv65n7T
	 Z2y+IWQCV41zGVgT/XjzDDgcapVD15IJMWwTe2oHrj8ue8CEaCJ2j7OBkeY8fpd+Ae6cV
	 2kCy6XVwbDmeAEcJgARgN+kSFmt7+5iS9Dp/Q3WTJNU46Z+bjPycHN3q2pOP3vALLy9zH
	 tZ+27gBwq2vvuUpbyrv9sLuV9gOwfqskVV+4G7oaIrh+39PR71c+FOCswJwE1N9DoybTB
	 lFItUjwfmQYQdmWR+LCMr/b513INrWQgVO5oBgSsvtuns+p1bpsjmhP28bWl/wtbfNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NeiCnWnp;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D14606A33E
	for <fuse-devel@lists.linux.dev>; Tue,  3 Nov 2026 08:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D14606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NeiCnWnp
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd69ca84740so1886580a12.1
        for <fuse-devel@lists.linux.dev>; Tue, 03 Nov 2026 00:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695212; x=1794300012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9yCqBKnWEF+1G5GJ+rwV3M7Y3WdLHInlO9rhMJ5y4c=;
        b=NeiCnWnpdvXT65a+JQp3SnWW8EzmP9CEqcGV4dZdaH3HbUZfrjsTwB+nLWUWgj5LSm
         i1xAT8SXKVR5ocC80Mr2fqOauMypVOXKtZfF2Qlugwn924H/kgk7oPyT3rs5nzaqA81Q
         SfeekZfEmsxE6p7ykje893WSV/1PpLoBJiJNWFe8fnyWzRiaCsikIuTtPHTq9HsuM//4
         FCUg2O/CQQrHU4KdKS1p6s7zxtqjwedDaiSsEjlzvYps8fZMeoesIFTTH/1dbssRuSAU
         eGD13bAJkPmBvNik2f4lLTpHS2E4+uUOUx7p4q+tRM4yNnRv+mzPHQNyJzJKhjUXj2FI
         rP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695212; x=1794300012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9yCqBKnWEF+1G5GJ+rwV3M7Y3WdLHInlO9rhMJ5y4c=;
        b=lDddqf5nBvk5h2SgKbgI08VkjgtBuD90hGXdiLSQSZkfflQCm/SgdIvmAc0QzNXIr/
         pazGqMM5P7v5v/9XFGHehldVShBdiUF2dEybSdpcRlOhm0pbuzdh1lftRU2afJQ0yt39
         pYcItySMPhBefJibzvUA4TnuUXYFETQofgRm4iZ/6SrglVyLuIgWZ42Gt2RwMy92eoZh
         +IPsJuyKwZg4wT3fq/AbalbMBVvDmUl6Wb1RhiHQMB2CWN1Ufuwa9X1/4+Dt75PBnCRt
         Kv7dSYQmoUBq0sv8ktRz+ckw4bm41XxMKzL4y9aCMyiQ9f+wtrwiYkgjTw48AU7gaUze
         F7Pw==
X-Gm-Message-State: APuU4Z8zo0Trz3ClsP+sjIdnX2UTrvA/RiTdeXwiu15tjrXircwUDSwM
	WRLHvzGVU2y2bfCo/g7cPXPDtTRmvn/pz7NPIvVzq4PO4Wlb0FwjxU5U
X-Gm-Gg: AYBFou2XFKmAyeCIZrckBEjjU48Q1C2RXRksroZJxyTmzGVJ+vMx8WYcGhMdpelK8Ck
	UhEkNmN8BA4sN1KWYxUf4gyW4g9NavNZtPmC7Lu74LmVaMS6j2ArFkyYl5oZrUdPu4YgUXpU1pf
	aLh4X/Hm27hQRAhyFDigYSTJu7+r8KY6bEUhLvIqgESH9/KNvHrxhQIQT7mda2nS//jscHPF0cY
	vYqwFlXJ2NUqEmDuiELkWeM9eTSp8KVZmqDOfJJbI17E5QAB+0cYA3sdCsXQFvnBCFkpGtUhttk
	XEXqGAV93McNEzCl4q/uMBnQYQXoQedfNcqdNzOtK7z+4Z/80yo7D9zKMJs6kd+nAM2TbpP5y8k
	ieWJT7mLu6PoTA6Bxkf7f2Nzw7GzBMH+AOsbixRodkKwnOETqrNdXtC1g27OcYOa1TRAwRNeJ4U
	mxWeEJ8V7ZWD2+DyYpJMalX+DA5N9WRPVRBPsRj2BNQanrsEw++jWVTC4F79s31lfB3Zklk6+lx
	fayAJcPpxq3JKoWuAJNZwnfkWdCLBWQbK3cfgkBIbPtti2LZRO1SLRhSpsKofX6zzGItbgK/GR7
	t0Cc/HZ50xdSs28H/+ABmAAs0PhfFsUZE12Te96iH9gcYMmhd/VJngkx
X-Received: by 2002:a05:6a00:a0c:b0:89e:724d:1ae3 with SMTP id d2e1a72fcca58-8a9ba2299e9mr10800761b3a.2.1793695211896;
        Tue, 03 Nov 2026 00:40:11 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfccsm2998833b3a.9.2026.11.03.00.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:11 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joannelkoong@gmail.com,
	jamz@amazon.com,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] fuse: clear the old EOF tail before writeback-cache writes
Date: Tue,  3 Nov 2026 08:34:25 +0000
Message-ID: <20261103083425.55695-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Buffered writeback-cache writes go through iomap_file_buffered_write(),
but do not clear cached data between the old EOF and the write position.
If a shared mapping dirtied the tail of the old EOF page, an extending
write can expose those bytes as file contents instead of zeros. A later
writeback can also send them to the server.

Clear the gap under the existing inode lock before the buffered write.
Use the same page-cache cleanup as fuse_perform_write() does for
write-through writes, leaving the write range itself untouched.

Fixes: 4d99ff8f12eb ("fuse: Turn writeback cache on")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/fuse/file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index d5e1cb53d86a6b35e63ca31b1065068ea5bdb6be..1c43c2f58e0a127004d74f3a28548b20d3d8a013 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1565,6 +1565,11 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		written = direct_write_fallback(iocb, from, written,
 				fuse_perform_write(iocb, from));
 	} else if (writeback) {
+		loff_t old_size = i_size_read(inode);
+
+		if (iocb->ki_pos > old_size)
+			truncate_pagecache_range(inode, old_size, iocb->ki_pos - 1);
+
 		/*
 		 * Use iomap so that we can do granular uptodate reads
 		 * and granular dirty tracking for large folios.

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0
