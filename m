Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED1E2E414
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892753; cv=none; b=PaYjfOf64v+eTKvVy8tG+Z2weUSDCGAnfizPXhruEgwvuy5LfCs+aHrfbuWCFndrhpIfD7oyYSZS/ll/3uO9181ItQsiVn7q4UlgH4vzxx6si703g6rLkmAHwrKpVKri+ZKQEd9hzTJMDUDiiVqHz3UCYIEefnOn97w7DpH8ES0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892753; c=relaxed/simple;
	bh=q3MsSCNkC2aAZMUb4s47hliprc0ZVXGZvkY/LNR7sUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C56mIy5OgDJv85gch5Z9n+KyANEHeTPoluq1p3KIfCPyxKMR9TSBfxxuftDzgBGoBjbTIDBl4gjMWraph4UUuSk8zgjgYHwVnfb/9j/ONYizcBt6x2i0+UiwxHF7AEhiT3XXvPCvt7TmQ7LSALjOZI3zIFiz8eQYRgoaH0BtCyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heOog6uS; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heOog6uS"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bdc947aaa3so476787b3.0
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892750; x=1779497550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6oJwNXaME1pdJ/exvGJeJoZdkywhdbrxnj/RcXxisU=;
        b=heOog6uSNaZktrWnpgsgUU4nhSoNlMzqJilceq6uHegsZUT4f+Df2i0L/DYov9x5IJ
         yPTH1lkRgILBgRShRytipvCpB2lSdZijX1nP3dxdZHr/UUMgsosEH/lROB11faLXLWyz
         yT4PN4/kkllY5uY8AOYDuCvSv9W1ILqDkbHpw+9pCjs/n4fP+8fEJ5fNVhr9YABU/TBx
         +IJ+lHqmYpwEO1i+GJObVR6N1RG5iAP26dGxXGs57MPRJ3AM16DUf8vp+3bKXKna3FxY
         u8WdEQ+EqrgBr1BUvkElbN7D9NC0PE0aZOFzk5FTDp9OcgK+IerKbKb2V38QI8oamiYg
         Dwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892750; x=1779497550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H6oJwNXaME1pdJ/exvGJeJoZdkywhdbrxnj/RcXxisU=;
        b=L4h+WSIdTMRbqbm+R3j+ZDiUr3qBPXiwkhP+cNWlOBJD1FQSg8wQsaQghU33irC5rW
         DOYg4MQYotBWErdRaIp99yuV6vVdaMtnlSVC2hCblVFXBV/6AppndXj+TarMgwso+cFn
         2bxXqSkEd/ZhX5kJ736Svz5kq8WKuIuU0dS5bPIo4FleMzvz88zHElaoXlfrIt3rn2yI
         xljLy9b3gubD5W/4jYNIb6cX4FQ9AJX7I7juMFIE4u2Th6itcHYfbfku60UB/zk+70az
         V7A7iVl29NKhfKy6gezi4vNRyTf/IGrSV9uUiPIWzc526KAlhGah9TPFOx3wpejKov+U
         WPGA==
X-Gm-Message-State: AOJu0YwD1hEVwgeYymQGQqG8KEG78Upl/SV3TxvQyv90sloY139/fKYk
	F0215BU6vrgzfQ2ElnhzAkyX+QdJk/hgQ6Y28PiQnj+HkpK9zwFhlLk4
X-Gm-Gg: Acq92OHetgIfzJAcRyK8HQ9PwzDmLdGaIUFbCpl7I6zxZ7ejvqfxeJPovdbbBgjfSk9
	nd7r+H3sBpQwc+KaBt7VrDYNWfsRmh//OndN34BpnUHhKs2iXJ9YPvJ85QGnUp/jsKY18TIO1bn
	8rIZQHNtP7CUgmmGUA6S4RQOu7eOjXr2sbJC1nbGtEbsQtw5/KwQqCQuItmMToGarlF1y6Pz9lZ
	Vk23RcGkgEWKbyQhMf9yudWM7+/0A6UZkfDZSgV6wQrQ0eVoTWzMmTL8CNxyry5E5ZzYGsouoHG
	p6BgbGxRNZeR6bFCh7QMjkHrdIGy31Glh87ohy8bhb3NJ2Wp+a0TI3SmiCsuZzPRdyiyN7f+cLS
	cdDxo299reQaBWeX4LOqM/3C8x7IQLaGMkJfiQ8VA3AWJ+pOzQu8BL1xTxJMPbZGgPQb3hn8n0y
	FNa1xHbi+SO5xlFPhsI9p4XpMdMUkThBA=
X-Received: by 2002:a05:690c:9404:b0:7bd:b048:868 with SMTP id 00721157ae682-7c959b9728bmr61527897b3.8.1778892749881;
        Fri, 15 May 2026 17:52:29 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:29::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c9cf5da147sm15620257b3.20.2026.05.15.17.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:28 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 05/21] fuse: prepare for long lived reference on backing file
Date: Fri, 15 May 2026 17:39:48 -0700
Message-ID: <20260516004004.1455526-6-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260516004004.1455526-1-joannelkoong@gmail.com>
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Amir Goldstein <amir73il@gmail.com>

Currently backing file is attached to fuse inode on the first
passthrough open of the inode and detached on last passthrough close.

In preparation for attaching a backing file to inode with no open file,
allow attaching a single long lived reference on fuse inode backing file
that will be used for passthrough of inode operations and detached on
fuse inode evict.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/fuse/file.c   |  3 ++-
 fs/fuse/fuse_i.h |  5 +++--
 fs/fuse/inode.c  |  5 +++++
 fs/fuse/iomode.c | 16 ++++++++++++----
 4 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 828e3fc0ec31..1173811b2ea7 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1442,6 +1442,7 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
 			  bool *exclusive)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
+	struct fuse_file *ff = iocb->ki_filp->private_data;
 
 	*exclusive = fuse_dio_wr_exclusive_lock(iocb, from);
 	if (*exclusive) {
@@ -1456,7 +1457,7 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
 		 * have raced, so check it again.
 		 */
 		if (fuse_io_past_eof(iocb, from) ||
-		    fuse_inode_uncached_io_start(inode, NULL) != 0) {
+		    fuse_inode_uncached_io_start(inode, ff, NULL) != 0) {
 			inode_unlock_shared(inode);
 			inode_lock(inode);
 			*exclusive = true;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 23d2510f8e93..502b3b3f7e89 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -258,7 +258,7 @@ enum {
 	 * or the fuse server has an exclusive "lease" on distributed fs
 	 */
 	FUSE_I_EXCLUSIVE,
-	/* Has backing file for inode ops passthrough */
+	/* Has long lived backing file for inode ops passthrough */
 	FUSE_I_PASSTHROUGH,
 };
 
@@ -1246,7 +1246,8 @@ int fuse_fileattr_set(struct mnt_idmap *idmap,
 
 /* iomode.c */
 int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff);
-int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb);
+int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_file *ff,
+				 struct fuse_backing *fb);
 void fuse_inode_uncached_io_end(struct inode *inode);
 
 int fuse_file_io_open(struct file *file, struct inode *inode);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index cef8b853b3d8..9e9c20e846e7 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -183,6 +183,11 @@ static void fuse_evict_inode(struct inode *inode)
 		WARN_ON(!list_empty(&fi->write_files));
 		WARN_ON(!list_empty(&fi->queued_writes));
 	}
+	/* fuse inode may have a long lived reference to backing file */
+	if (fuse_inode_backing(fi)) {
+		WARN_ON(!test_bit(FUSE_I_PASSTHROUGH, &fi->state));
+		fuse_inode_uncached_io_end(inode);
+	}
 	WARN_ON(fi->iocachectr != 0);
 }
 
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index c83a070cd834..6e2ddfe384b3 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -87,7 +87,8 @@ static void fuse_file_cached_io_release(struct fuse_file *ff,
 }
 
 /* Start strictly uncached io mode where cache access is not allowed */
-int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb)
+int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_file *ff,
+				 struct fuse_backing *fb)
 {
 	struct fuse_inode *fi = get_fuse_inode(inode);
 	struct fuse_conn *fc = get_fuse_conn(inode);
@@ -116,12 +117,19 @@ int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb)
 		err = -ETXTBSY;
 		goto unlock;
 	}
-	fi->iocachectr--;
+	/* every open file holds a single refcount of backing file... */
+	if (ff)
+		fi->iocachectr--;
 
-	/* fuse inode holds a single refcount of backing file */
 	if (fb && !oldfb) {
 		oldfb = fuse_inode_backing_set(fi, fb);
 		WARN_ON_ONCE(oldfb != NULL);
+		/* ...and an optional extra refcount for inode ops */
+		if ((fb->ops_mask & FUSE_PASSTHROUGH_INODE_OPS)) {
+			WARN_ON_ONCE(test_bit(FUSE_I_PASSTHROUGH, &fi->state));
+			set_bit(FUSE_I_PASSTHROUGH, &fi->state);
+			fi->iocachectr--;
+		}
 	} else {
 		fuse_backing_put(fb);
 	}
@@ -137,7 +145,7 @@ static int fuse_file_uncached_io_open(struct inode *inode,
 {
 	int err;
 
-	err = fuse_inode_uncached_io_start(inode, fb);
+	err = fuse_inode_uncached_io_start(inode, ff, fb);
 	if (err)
 		return err;
 
-- 
2.52.0

