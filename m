Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709FC39BFED
	for <fuse-devel@lists.linux.dev>; Mon,  6 Jul 2026 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326589; cv=none; b=f5z54xnhwd5VJYz0fmM85Oep1yqGrOAVxyWPgm+Uc+3FEslDoh5kfDtsWY6qrwWlG4JvsllpxSOULxi77UD1/I41UjcueaOzGhq2iZsv4yuUW2TAQZ8UAbnjmw3cNAP0vSKzB8EKxm5p3tEMIcY7GmE+MAUnSDBN9/wLuqNqr/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326589; c=relaxed/simple;
	bh=POUmVyf2k7ocz4fos0CD1UZWxHA+IihKlFpxHflZW0g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=auIBrsUh863YRPoOjELjLZf0oe0PNiYLCz/AMKlZNOuGtK5dLGBApEJgc2uvgw1ZhM1lDnAFsFsHk1VV5JPwsPWwjuRl3qBMM8Czej8rcy0XhCjwGpk9ZSrkEFp3kda9icTIs6zDyHNyYBTFwjdgQN5OkT0WxEI0r3dqSLbq2+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=tuzs6MJt; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="tuzs6MJt"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783326572; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=s3KsyjMg0HkDVJgNHi8YbO31/jgfrZ+7vyj8jSMSy9E=;
	b=tuzs6MJtW6Ene4j356fs+caqHCr3EYvXSOV30tA8q6+D6oNY2rlPSc33mw60FfEgDpJwKljdDBzgnLLQRDFTJoFkFwZJoPvBfuqrIbPHICp3qax4bZGhIy1GVNxLbROoMmdo8HebCqveYpU16GCTAqsWxxXSTxykJ4UEbPQC4NY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=jefflexu@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0X6Srb4-_1783326571;
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com fp:SMTPD_---0X6Srb4-_1783326571 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 06 Jul 2026 16:29:31 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] fuse: don't bump attr_version for async direct read completion
Date: Mon,  6 Jul 2026 16:29:31 +0800
Message-Id: <20260706082931.99288-1-jefflexu@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The attr_version counter should only be incremented when cached
attributes are actually modified (as documented in commit 1fb69e781729
("fuse: fix race between getattr and write")).  Async direct reads do not
modify any cached inode attributes (size, mtime, ctime), so bumping
attr_version in fuse_aio_complete() for reads is incorrect.

This unconditional bump causes a livelock when auto_inval_data is
enabled together with writeback_cache: fuse_cache_read_iter() issues a
FUSE_GETATTR before every read, but by the time the response arrives,
an async DIO read completion has already incremented fi->attr_version
past the snapshot taken before the request.  The GETATTR result is then
discarded (attr_version race), fi->i_time is never refreshed, and every
subsequent read triggers yet another GETATTR -- creating an infinite
loop of useless round-trips.

Fix this by only bumping attr_version for write completions, consistent
with the synchronous DIO write path (fuse_write_update_attr) and the
cached write path.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/fuse/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index ceada75310b8..c41287e8bc15 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -688,7 +688,7 @@ static void fuse_aio_complete(struct fuse_io_priv *io, int err, ssize_t pos)
 		struct address_space *mapping = io->iocb->ki_filp->f_mapping;
 		ssize_t res = fuse_get_res_by_io(io);
 
-		if (res >= 0) {
+		if (res >= 0 && io->write) {
 			struct fuse_conn *fc = get_fuse_conn(inode);
 			struct fuse_inode *fi = get_fuse_inode(inode);
 
-- 
2.19.1.6.gb485710b

