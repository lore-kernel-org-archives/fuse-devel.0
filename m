Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FF64457C5
	for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979908; cv=none; b=ZA+gp3MEcpog1r7NrxvB+fuJFJ2ofpwEBClXvOcUrplGNpwlbgHakMTgQ4/bFFe0HplJhku9mG/M8wSAfHu/lh1MXBvtMMN/eyaziYR636B3wkbynrYFHeghQzU+GD14pwxpsk/Rybxbuwh9vvVTDj2Juo1tVKBrM/KgpDPmwZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979908; c=relaxed/simple;
	bh=iTuPbUlen4774ig2yCMvJ99XD5oszOd5LAnS26sa+nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PL6WVNaHpWome2+TOe+yQPvWgVWSdqEa3ddhsqvDZl2j4qzUed7Ua36zNMw+G8u0bmU6y84YziIr41hy6Pg0O1Wv7hBUQAx0r1kSZswBmEFOyq5Gu6COPPtB/RFoCG5Ib+4AurPLTUa5GzxexUN5j9KyXAK0A852o0Ywf62bXzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=IVw0nDLf; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="IVw0nDLf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786979903; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=LZc3qwCUsh6/0o/S/EuPVqXvFA+E/rxqZAGvfeoj3z0=;
	b=IVw0nDLf1B4K5kYKmh9Z0GC9yiUYNdG08Ee6nHXozbW288Wr5CvxQNb6OMARM+K+80uFy2hBwgq47zYjoM5lUv9jaARGtV6MwxyFfHSmkdjV3+1OOEiDX32/v0Y3sJxpsj8wXVTwXPSTyqqDynnMZxQkZqXgSWu1E0bES48JFCU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X9A6oAG_1786979901;
Received: from x31h02109.sqa.na131.tbsite.net(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X9A6oAG_1786979901 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 17 Aug 2026 23:18:21 +0800
From: Baokun Li <libaokun@linux.alibaba.com>
To: fuse-devel@lists.linux.dev
Cc: miklos@szeredi.hu,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vgoyal@redhat.com,
	jefflexu@linux.alibaba.com,
	stable@vger.kernel.org
Subject: [PATCH 2/2] fuse: fix invalidate lock leak on open O_TRUNC DAX failure
Date: Mon, 17 Aug 2026 23:18:01 +0800
Message-ID: <20260817151801.2677899-3-libaokun@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260817151801.2677899-1-libaokun@linux.alibaba.com>
References: <20260817151801.2677899-1-libaokun@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fuse_open() takes filemap_invalidate_lock() for a DAX truncate
(dax_truncate = true) and releases it before the out_inode_unlock
label.  But when fuse_dax_break_layouts() fails, the goto
out_inode_unlock skips the unlock and leaks the rwsem, so any later
fault or truncate on the file stalls on the stale lock.

fuse_dax_break_layouts() can fail with -ERESTARTSYS when a signal
interrupts the wait for busy DAX pages to drain:

  open("file", O_RDWR | O_TRUNC)
  └─ fuse_open()
     ├─ filemap_invalidate_lock()        # dax_truncate
     └─ fuse_dax_break_layouts()
        └─ dax_break_layout()
           └─ wait_page_idle()           # TASK_INTERRUPTIBLE
              └─ fuse_wait_dax_page()    # unlock, schedule, re-lock
                 └─ signal → -ERESTARTSYS
     goto out_inode_unlock               # <- lock leaked

Fix this by moving filemap_invalidate_unlock() below the label so
that all error paths release the lock, and rename the label to
out_unlock as it now covers more than just the inode lock.

Fixes: 2fdbb8dd0155 ("fuse: fix deadlock between atomic O_TRUNC and page invalidation")
Cc: <stable@vger.kernel.org> # v6.0+
Signed-off-by: Baokun Li <libaokun@linux.alibaba.com>
---
 fs/fuse/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index ceada75310b8..e7b2a839f081 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -272,7 +272,7 @@ static int fuse_open(struct inode *inode, struct file *file)
 		filemap_invalidate_lock(inode->i_mapping);
 		err = fuse_dax_break_layouts(inode, 0, -1);
 		if (err)
-			goto out_inode_unlock;
+			goto out_unlock;
 	}
 
 	if (is_wb_truncate || dax_truncate)
@@ -296,9 +296,9 @@ static int fuse_open(struct inode *inode, struct file *file)
 		else if (!(ff->open_flags & FOPEN_KEEP_CACHE))
 			invalidate_inode_pages2(inode->i_mapping);
 	}
+out_unlock:
 	if (dax_truncate)
 		filemap_invalidate_unlock(inode->i_mapping);
-out_inode_unlock:
 	if (is_wb_truncate || dax_truncate)
 		inode_unlock(inode);
 
-- 
2.43.7

