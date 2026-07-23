Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A433EE1EF
	for <fuse-devel@lists.linux.dev>; Thu, 23 Jul 2026 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801283; cv=none; b=dieFbw54BRbhtP2kXViHMvb4O1yzgbGm+Fifx19NsoidEuHyPXfo/kl4Z8yeeSMCm7ZNKDnQls7awPJw2sxHBdUuF0yA4iV+Kya7il3pEJOWnEJ1QHyUhMy44lzmPuWkBsjXfYN3oD+R2fa5Rvj/RCPzG/NRRtXP8DI8jeQXXXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801283; c=relaxed/simple;
	bh=WIJ8zoCUR21GYtd/zYEWmLmg3ioW227TCu8s+oTOfKk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IBgfwDLXcS0xg/kjjq4dpFExuLCvAAePkej4/EEZpEyKn5J6ccTBSrzufHYiI+HlqAL2T6vLJsgKeYgKMjAy7kJclSyz/4I0POwfFuRuhSkgiz9Ze7b0GfUYtqyEllFd7TcU8zJAtytc5VVRotwnm32/crobIjcgktxXjMMQ8yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=VTd6fWfp; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="VTd6fWfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1784801272;
	bh=SyEj6ffhKouPQ65FzqWZ5omOcf6iNe2eBQKGES0cck0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=VTd6fWfpbNBDdG+HPX3ue5XktIZlJwgRJjAk+l7pkS9Kx7tdGLNNdh27GQCtUuwmF
	 pl3eevsfNtD47ef4LJhBlJsFg4gTTwC2f3QD0tjBS5W0cAthokwTjzIpi2kKruULDS
	 pG01iD8oBOrynt574zLkoJtMmlUSN0OuzsarVbIs=
X-QQ-mid: esmtpgz14t1784801267t5021f021
X-QQ-Originating-IP: yyiCvLDjUzqqWBNqmYNCBz3TUBXDcMyCPvYE+a4CS2c=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Jul 2026 18:07:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14259689437232123810
EX-QQ-RecipientCnt: 5
From: Yichong Chen <chenyichong@uniontech.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Niels de Vos <ndevos@redhat.com>,
	fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH] fuse: skip destination updates for zero-byte copy
Date: Thu, 23 Jul 2026 18:07:43 +0800
Message-Id: <20260723100743.93881-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NuZvjORXcxgLWFkBUrOYQfPWW27rgSZIJzLGP1CB2PEHa44jzlqwyah1
	+VFkkFncDJ1fUs4d60DaT8YyJ0vC9OHpGpZ3uAesl+TzLG4Khf1HKCRDKLcdt+xrP7rCZdP
	W8QvzMTNq5eYxg3f9w14h6nhsR8+XpkndMzoMvv+sUGZVkdZM3p6JKF9M+ayXh50IZzYvy/
	pj4s6t6oU52jHVZd924GjgLIFNRNtNlt+iVLM6N0fJj47XqTaUaeDbvt2SRdttprDFTDHBe
	T06kjYIQ4FCT+SnP50Sd3tQXY7Dn2tOHt1wpqsBsVRGxQBcJLg8Ikmz+qYEV+fs2WeTuv7E
	cYaw1vQ3kCHbkTJgMTexxKU543XCu7VzEDTKxVq2zoAYoFWn3vkadNcB57j/24FbCGGlGkU
	ZVaXr8zNCmXbi/v7SrM+E0RVIMx/atjYtEJy1tguLeGhW+ssZ+pZ2yglsXqiRIW79GOh3cJ
	Jk3alOiGa9Ymp08w83MKLgfDpsHJMdqj3su3ZfLbG6z1HRaVEAGIUezLmDkya1NRm30s9IM
	VBY63faCbM2hXqB+Z4130FcAVv49g7G4Qv+g5htrqmDZNEMWcgT7Mv9e99jNo2a250oQoY+
	uM7bsfvp1Sy3BGD3sEpsNWzAmHxdrDEwAAZDFkM7wSuLG3+BGpggk1jt/3zaFF7fHsV/L02
	KnKrIbp3MKgIyMjaMrOJyVY8H2jEHY1fG8R15rOm+e9Wf5XlSuSIK3rs2bTf9acvXt3Zec/
	3thJfE4Dh9WGFTsbgdurpUdC/osExOjDU/EoPN70lIYOl3OtqbKPMiaHtlDmKbTeQXBqlc+
	7EUjn01lyIrrcVhHa2Z4haQupmBquOH7I/5E+HfSHew4PQh8Zx6/id2BUzm7Nwl/IP0JyKB
	s5eByekt+bOjIDl6djsUd1FvHgvlbVs+U/9abgwtGn5F+6lAAOY/l68vU75p3M6bUrtn0AD
	lLMU0ppiX2cjZU//iZG44WiFTUJyIV/M4esHcm9As9aGiPW1NIgInjeTCvMJpABj3UJt4Oa
	C5CYArriI7cTtBmlNE/65/EWaAmww=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

__fuse_copy_file_range() may receive a successful copy reply with zero
bytes copied.  This can happen even though the VFS only calls the file
operation with a non-zero length, for example if the FUSE daemon reaches
EOF while the kernel has stale source size information.

In that case no data was written to the destination.  Do not invalidate
the destination page cache or update the destination timestamps and cached
size state for a zero-byte copy result.

Fixes: 88bc7d5097a1 ("fuse: add support for copy_file_range()")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/fuse/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index ceada75310b8..75eb97b26912 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -3040,6 +3040,10 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 		err = -EIO;
 		goto out;
 	}
+	if (!bytes_copied) {
+		err = 0;
+		goto out;
+	}
 
 	truncate_inode_pages_range(inode_out->i_mapping,
 				   ALIGN_DOWN(pos_out, PAGE_SIZE),
-- 
2.51.0

