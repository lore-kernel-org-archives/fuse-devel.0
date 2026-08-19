Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF64429019
	for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130460; cv=none; b=H/bxdIJdbY97kdqRLDGmhH8jjTQ1PX5szLvxbzGie5A12IRqiSY2p9+sCfT4TOR40ChXhOSaovW+pqjGxc6KElaOYRj8B778d0TgkUV9MT0x17Bm/8k+7konAhDDb+4XXaigM1NjYFyqYx7e+1C08jFSdYg7yC4JKN9W09wjILc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130460; c=relaxed/simple;
	bh=30SF5M2hOL+Vita9JvlFrVe4U/+ZYzIuQhE2JOCrfbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j4UnHj7bUrV1CHpUHE2tZ2cOkmJ3dceTDCmqWQuKSov9KdvwbON03ORTvYij8bqMLv4jhqDcC5pBy+X1CQFhda8n9+QWmq8jg9Tm+XUYn5hZGw7gGMYt3Ao5ANNj/PvgAnNdlSVEj+ml+RqBWVgqtaUaZW9wtoVbKk8pJA1vprU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=hNV0139G; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="hNV0139G"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787130454; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=oAtj/whM3vl2+gW6BLep6hve2gb8R2O04Z7yxzmDjg0=;
	b=hNV0139GM+d4xIWc+jH/vft8ff6xVGwZ+HTlIcMwXozn4wWJ5v5k/IpxzajmxyVXuyUSMMx8+zP0cqOKo75SUtLeyrqblGwtJzhyDrH2DSrcQbmFES1q8vikC/u4UNI4TpO/5SOytVXzCpxy8CqUNdIYAxCYEnsRazkhFjuq9ys=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R351e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X9G8T02_1787130448;
Received: from x31h02109.sqa.na131.tbsite.net(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X9G8T02_1787130448 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Aug 2026 17:07:33 +0800
From: Baokun Li <libaokun@linux.alibaba.com>
To: fuse-devel@lists.linux.dev
Cc: miklos@szeredi.hu,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cding@ddn.com,
	jefflexu@linux.alibaba.com
Subject: [PATCH] fuse: invalidate the correct range after O_APPEND direct write
Date: Wed, 19 Aug 2026 17:07:28 +0800
Message-ID: <20260819090728.3331501-1-libaokun@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_direct_write_iter() captures pos before generic_write_checks(),
which moves ki_pos to EOF for O_APPEND writes:

  fuse_direct_write_iter()
  {
      pos = iocb->ki_pos;           /* 0 (user-supplied)       */
      generic_write_checks();       /* ki_pos -> EOF           */
      fuse_direct_io();             /* writes at EOF, correct  */
      invalidate(pos, pos + res);   /* [0, res) -- wrong       */
  }

The post-write invalidation targets a stale range instead of the
actual written range at EOF.

This can cause data inconsistency when the file size is not
page-aligned.  The tail page straddling EOF has a valid portion
before EOF that concurrent readers can fault back in during the
DIO write window:

  Tail page (file size X not page-aligned):

    page_start         X (EOF)   page_end
    |--- valid data ----|-- stale --|

  CPU0 (O_APPEND DIO writer)    CPU1 (buffered reader)
  --------------------------    ----------------------
  invalidate [X, X+len)
    tail page evicted
  FUSE_WRITE in flight ...
                                read [page_start, X)
                                  tail page re-faulted
                                  [X, page_end) = stale
  FUSE_WRITE completes
  i_size = X + len
  invalidate [0, len)  <- WRONG
    tail page still cached
                                read [X, X+len)
                                  hits stale tail page
                                  returns old data

Fix by reading pos back from iocb->ki_pos after generic_write_checks(),
as generic_file_direct_write() does.

Also fix a typo in the comment ("may have" -> "may have competed").

Fixes: 2b0408d0284f ("fuse: invalidate page cache after DIO and async DIO writes")
Signed-off-by: Baokun Li <libaokun@linux.alibaba.com>
---
 fs/fuse/file.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 45ebd1b15874..d12a9fdf770e 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1789,13 +1789,14 @@ static ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
 	struct address_space *mapping = inode->i_mapping;
-	loff_t pos = iocb->ki_pos;
 	ssize_t res;
 	bool exclusive;
 
 	fuse_dio_lock(iocb, from, &exclusive);
 	res = generic_write_checks(iocb, from);
 	if (res > 0) {
+		loff_t pos = iocb->ki_pos;
+
 		task_io_account_write(res);
 		if (!is_sync_kiocb(iocb)) {
 			res = fuse_direct_IO(iocb, from);
@@ -1810,7 +1811,7 @@ static ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			/*
 			 * As in generic_file_direct_write(), invalidate after
 			 * write, to invalidate read-ahead cache that may have
-			 * with the write.
+			 * competed with the write.
 			 */
 			invalidate_inode_pages2_range(mapping,
 				pos >> PAGE_SHIFT,
-- 
2.43.7

