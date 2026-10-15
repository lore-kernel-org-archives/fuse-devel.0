Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF90A558204;
	Thu, 15 Oct 2026 17:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792087074; cv=none; b=JHTrA2IYfijxXCVGTvaBAmbVNm+SU5vtuViBHbZHCeoJ+vhNvh5god/u54e9vz4p4ZFWm8DZtxinaAGuHSzIoFJ65sfISXPw7wBJlCfBHh2dCjaVxeXybxP0xSJUlNGBiPmdqtjQFr8AvSWmn+qp7ooC5/Pjy3DZLPIVDjNePsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792087074; c=relaxed/simple;
	bh=ONn5tgfVwDm8BT2O8Wsc5DAR+oniwRJ4KW4F1WoRg2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rds2AVJ+6x+SoaUndXuFSxzGCltjW3uxB00tgvzZkWqkeErjN23VgXMUR6TRZVq+fNg/Qk7zuJcn/h3M4DNeCbzNvBa4Er9UOqKeztqTZxB5q4k5wwQhNzHRchkXgsmvKa72UJbIqcAwFnjc59gclFGSdnzAn7sZRezjUhIEcnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=IPJweeg8; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="IPJweeg8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=slzMnxiBKoSqhaRlHrQQc/690soy6qzq+CQUtjpNTL0=; b=
	IPJweeg8znI6PX31nRWp8d95WLWk02S81uagkBkSheES+E6ijfP5m2vrXwcEsSpNbdel3YXY9WGH4
	r3Cbf4knoh0nA2EUheYHG6VtSsig502T4xHvMTU+w4/n4rEELrSon1zIqDbRuof9XLf23xBzR3D3a
	I2zOg1V8ez0Vms3Wnq7cQVXaapPxM+o8ZNCyD9AP8ibIBhfmo8BrrmOIEOBp/53Wy4vTrJ1H3eA0k
	oAf4xOv7PgyqyGehltVwDDsA5mIQBxUw3O16LkM7z48AvwKW/nlC9xZ2bQxsaZlOvSQEfLnwCHNdH
	gu9kw2x9DohvHNVsD5XCriEsdXvnX/hAJQ==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xHPhv-000fQx-Vr; Thu, 15 Oct 2026 19:57:36 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [PATCH v2] fuse: rename fuse_direct_io() to fuse_do_direct_io()
Date: Thu, 15 Oct 2026 18:58:56 +0100
Message-ID: <20261015175856.13333-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FUSE has two functions with very similar name: fuse_direct_io() and
fuse_direct_IO().  Which is very confusing.  Rename one of them to remove
the ambiguity.

Signed-off-by: Luis Henriques <luis@igalia.com>
---
 fs/fuse/cuse.c   |  6 +++---
 fs/fuse/dax.c    |  2 +-
 fs/fuse/file.c   | 14 +++++++-------
 fs/fuse/fuse_i.h |  8 ++++----
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/fuse/cuse.c b/fs/fuse/cuse.c
index 4079cf8e5974..01f61fc8e354 100644
--- a/fs/fuse/cuse.c
+++ b/fs/fuse/cuse.c
@@ -98,7 +98,7 @@ static ssize_t cuse_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 	struct fuse_io_priv io = FUSE_IO_PRIV_SYNC(kiocb);
 	loff_t pos = 0;
 
-	return fuse_direct_io(&io, to, &pos, FUSE_DIO_CUSE);
+	return fuse_do_direct_io(&io, to, &pos, FUSE_DIO_CUSE);
 }
 
 static ssize_t cuse_write_iter(struct kiocb *kiocb, struct iov_iter *from)
@@ -109,8 +109,8 @@ static ssize_t cuse_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 	 * No locking or generic_write_checks(), the server is
 	 * responsible for locking and sanity checks.
 	 */
-	return fuse_direct_io(&io, from, &pos,
-			      FUSE_DIO_WRITE | FUSE_DIO_CUSE);
+	return fuse_do_direct_io(&io, from, &pos,
+				   FUSE_DIO_WRITE | FUSE_DIO_CUSE);
 }
 
 static int cuse_open(struct inode *inode, struct file *file)
diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 85cdf0199bc0..86e308960b24 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -709,7 +709,7 @@ static ssize_t fuse_dax_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	struct fuse_io_priv io = FUSE_IO_PRIV_SYNC(iocb);
 	ssize_t ret;
 
-	ret = fuse_direct_io(&io, from, &iocb->ki_pos, FUSE_DIO_WRITE);
+	ret = fuse_do_direct_io(&io, from, &iocb->ki_pos, FUSE_DIO_WRITE);
 
 	fuse_write_update_attr(inode, iocb->ki_pos, ret);
 	return ret;
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 9a36d0329e22..801a2a269906 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1653,8 +1653,8 @@ static int fuse_get_user_pages(struct fuse_args_pages *ap, struct iov_iter *ii,
 	return ret < 0 ? ret : 0;
 }
 
-ssize_t fuse_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
-		       loff_t *ppos, int flags)
+ssize_t fuse_do_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
+			    loff_t *ppos, int flags)
 {
 	int write = flags & FUSE_DIO_WRITE;
 	int cuse = flags & FUSE_DIO_CUSE;
@@ -1755,7 +1755,7 @@ ssize_t fuse_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
 
 	return res > 0 ? res : err;
 }
-EXPORT_SYMBOL_GPL(fuse_direct_io);
+EXPORT_SYMBOL_GPL(fuse_do_direct_io);
 
 static ssize_t __fuse_direct_read(struct fuse_io_priv *io,
 				  struct iov_iter *iter,
@@ -1764,7 +1764,7 @@ static ssize_t __fuse_direct_read(struct fuse_io_priv *io,
 	ssize_t res;
 	struct inode *inode = file_inode(io->iocb->ki_filp);
 
-	res = fuse_direct_io(io, iter, ppos, 0);
+	res = fuse_do_direct_io(io, iter, ppos, 0);
 
 	fuse_invalidate_atime(inode);
 
@@ -1806,8 +1806,8 @@ static ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		} else {
 			struct fuse_io_priv io = FUSE_IO_PRIV_SYNC(iocb);
 
-			res = fuse_direct_io(&io, from, &iocb->ki_pos,
-					     FUSE_DIO_WRITE);
+			res = fuse_do_direct_io(&io, from, &iocb->ki_pos,
+						  FUSE_DIO_WRITE);
 			fuse_write_update_attr(inode, iocb->ki_pos, res);
 		}
 		if (res > 0 && mapping->nrpages) {
@@ -2787,7 +2787,7 @@ fuse_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 	}
 
 	if (iov_iter_rw(iter) == WRITE) {
-		ret = fuse_direct_io(io, iter, &pos, FUSE_DIO_WRITE);
+		ret = fuse_do_direct_io(io, iter, &pos, FUSE_DIO_WRITE);
 		fuse_invalidate_attr_mask(inode, FUSE_STATX_MODSIZE);
 	} else {
 		ret = __fuse_direct_read(io, iter, &pos);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index c8d4c5f3af7e..f892f60d3d22 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1167,17 +1167,17 @@ int fuse_do_open(struct fuse_mount *fm, u64 nodeid, struct file *file,
 		 bool isdir);
 
 /*
- * fuse_direct_io() flags
+ * fuse_do_direct_io() flags
  */
 
 /** If set, it is WRITE; otherwise - READ */
 #define FUSE_DIO_WRITE (1 << 0)
 
-/** CUSE pass fuse_direct_io() a file which f_mapping->host is not from FUSE */
+/** CUSE pass fuse_do_direct_io() a file which f_mapping->host is not from FUSE */
 #define FUSE_DIO_CUSE  (1 << 1)
 
-ssize_t fuse_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
-		       loff_t *ppos, int flags);
+ssize_t fuse_do_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
+			    loff_t *ppos, int flags);
 long fuse_do_ioctl(struct file *file, unsigned int cmd, unsigned long arg,
 		   unsigned int flags);
 long fuse_ioctl_common(struct file *file, unsigned int cmd,
