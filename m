Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C99533EB10;
	Fri,  4 Sep 2026 13:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527885; cv=none; b=NnIygTZ+RHWFawks7XD0ft4KXb/mXlP7ECfvMiXvBrAO6o7J095FVxxkrEKRbOJHa9eXzY47ZddMfrDLUwde5pOm/b0yGb2BNUFlqfz8jSfQNUAF+m1oJzYMHGNsKVzF9QKBGFnowT8zaGPB5XbM3OEgmlqbTT9wRYmy62wkl2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527885; c=relaxed/simple;
	bh=CFfcmk+xCh71A3AhYt3w56fMlf0+7TDdb5EF1RBYoEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dMGuiMr+XYUmIHLXlugr8zx5FhFuZ/uylkWt6owI+6W4qnrMwguz0hxUTZ78G1SNo3xrXRC2bIYT2j428V0Y9/wxtpl2AP1NTmkcQtWpVTdKgveud8fZy/ndGlPxULAALdmPe3W224sF858JI9E0971roEQworFcpTCbfjJwotM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=sacRFN8L; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="sacRFN8L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=RLZjdbrdHxD1aQp/bFRge0bO/QGIXf1IFiKn7JufqEY=; b=
	sacRFN8Lo63KWR3XtDWIDG05ur+NdUycBSmvaCbdGQ3rHxQkb1B94VuoUhEC7pXM2u0gwuP6CSse5
	C/rpv7bSbL/CzJF77YViocFH+SJAcHr1+RlJXeQ3IRVKsboW5v4PC+RWnnx7nFltLT69G7NjE9/jp
	tLDvnQZPUnhjVvtpY1rZPrVcUhgdrpFxs8G6rvhi+CohTQvvKyoJ7qFqBfJcZtKq9saH+A9WqiwbZ
	G0VUHiuhUx1plj6I1E7hC7JTXg5Jda7M/RK2gAtZInSiFMHfyhOHgf5//0PIIYg8wdiJ21TZWcn/H
	3Qzmn5hGapaOjXhtz/FAlyLBMIDsqvt+Kg==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x2Tno-00Etm2-HN; Fri, 04 Sep 2026 15:17:56 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luis Henriques <luis@igalia.com>
Subject: [PATCH] fuse: rename fuse_direct_io() to fuse_sync_direct_io()
Date: Fri,  4 Sep 2026 14:18:38 +0100
Message-ID: <20260904131838.15365-1-luis@igalia.com>
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
Hi!

Maybe fuse_sync_direct_io() isn't the best name either, but at least it'll
stop confusing me (and etags).

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
+	return fuse_sync_direct_io(&io, to, &pos, FUSE_DIO_CUSE);
 }
 
 static ssize_t cuse_write_iter(struct kiocb *kiocb, struct iov_iter *from)
@@ -109,8 +109,8 @@ static ssize_t cuse_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 	 * No locking or generic_write_checks(), the server is
 	 * responsible for locking and sanity checks.
 	 */
-	return fuse_direct_io(&io, from, &pos,
-			      FUSE_DIO_WRITE | FUSE_DIO_CUSE);
+	return fuse_sync_direct_io(&io, from, &pos,
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
+	ret = fuse_sync_direct_io(&io, from, &iocb->ki_pos, FUSE_DIO_WRITE);
 
 	fuse_write_update_attr(inode, iocb->ki_pos, ret);
 	return ret;
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 8d6135a6108a..bbdbc2dc3a07 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1654,8 +1654,8 @@ static int fuse_get_user_pages(struct fuse_args_pages *ap, struct iov_iter *ii,
 	return ret < 0 ? ret : 0;
 }
 
-ssize_t fuse_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
-		       loff_t *ppos, int flags)
+ssize_t fuse_sync_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
+			    loff_t *ppos, int flags)
 {
 	int write = flags & FUSE_DIO_WRITE;
 	int cuse = flags & FUSE_DIO_CUSE;
@@ -1756,7 +1756,7 @@ ssize_t fuse_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
 
 	return res > 0 ? res : err;
 }
-EXPORT_SYMBOL_GPL(fuse_direct_io);
+EXPORT_SYMBOL_GPL(fuse_sync_direct_io);
 
 static ssize_t __fuse_direct_read(struct fuse_io_priv *io,
 				  struct iov_iter *iter,
@@ -1765,7 +1765,7 @@ static ssize_t __fuse_direct_read(struct fuse_io_priv *io,
 	ssize_t res;
 	struct inode *inode = file_inode(io->iocb->ki_filp);
 
-	res = fuse_direct_io(io, iter, ppos, 0);
+	res = fuse_sync_direct_io(io, iter, ppos, 0);
 
 	fuse_invalidate_atime(inode);
 
@@ -1807,8 +1807,8 @@ static ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		} else {
 			struct fuse_io_priv io = FUSE_IO_PRIV_SYNC(iocb);
 
-			res = fuse_direct_io(&io, from, &iocb->ki_pos,
-					     FUSE_DIO_WRITE);
+			res = fuse_sync_direct_io(&io, from, &iocb->ki_pos,
+						  FUSE_DIO_WRITE);
 			fuse_write_update_attr(inode, iocb->ki_pos, res);
 		}
 		if (res > 0 && mapping->nrpages) {
@@ -2788,7 +2788,7 @@ fuse_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 	}
 
 	if (iov_iter_rw(iter) == WRITE) {
-		ret = fuse_direct_io(io, iter, &pos, FUSE_DIO_WRITE);
+		ret = fuse_sync_direct_io(io, iter, &pos, FUSE_DIO_WRITE);
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
+ * fuse_sync_direct_io() flags
  */
 
 /** If set, it is WRITE; otherwise - READ */
 #define FUSE_DIO_WRITE (1 << 0)
 
-/** CUSE pass fuse_direct_io() a file which f_mapping->host is not from FUSE */
+/** CUSE pass fuse_sync_direct_io() a file which f_mapping->host is not from FUSE */
 #define FUSE_DIO_CUSE  (1 << 1)
 
-ssize_t fuse_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
-		       loff_t *ppos, int flags);
+ssize_t fuse_sync_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
+			    loff_t *ppos, int flags);
 long fuse_do_ioctl(struct file *file, unsigned int cmd, unsigned long arg,
 		   unsigned int flags);
 long fuse_ioctl_common(struct file *file, unsigned int cmd,
