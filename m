Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D3D3655CC
	for <fuse-devel@lists.linux.dev>; Sun, 26 Jul 2026 01:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785031200; cv=none; b=ILUqPeBc2hXFHCPA+h9nTPj03hlyshaOKAx4pUs8It8cRQ35KevCxXOnDaLJyx2xi+8PIMGgQ4HlQ0c0sLOeTEvk4WLQZIrngcVL4zazXMyIOZBC2EswHno9JbTaifcWWxNgHzWW5j9syTGRxQwlwFI3kTdKpd+TdxTo99uOZ4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785031200; c=relaxed/simple;
	bh=NH5raMSM8K5aGx3VXVWhIWxb/BttE1lA7uKf6rnyPJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cwo3WvWgdyquypGJegifILjmAfqYrNcn3ZXIwX+qtzSlfbzYMIf0aXJfcdaINGmU6Z5tRxFJ39s4ons/kcfGMVcjbUpR14tMvTr/k8eUdTVZi7yf+vTVdr43MkRcg4McfETOawP3K3MgTqwqnXU0kcZMtgC39wuZxPnf0sCgRa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVD/Nc0I; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVD/Nc0I"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7ec49608332so743279a34.3
        for <fuse-devel@lists.linux.dev>; Sat, 25 Jul 2026 18:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785031197; x=1785635997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gg16MgmONoPjLbUFY3dyA78voi0asb/XfImqT3Ui7xs=;
        b=mVD/Nc0IvW8Om0Xzvs7hu6ahTPqUB8GGKaY3p+qJkEXMM7cuqcw/JyZNAXzrrb/ZVA
         Ze/I97ByWjf+C1L6o+5+fJ4lCjFjQQbACsqUWEWK5pwNJ+VHQHcboxoII5XdNeRlsvhT
         DP0Vr3OkxkKbKmHJXpKq5j9IsFeLfkPMilurSR75JN/M0EXFyHLmFxZy2j35pGfmCG+i
         yrbH4dtrsIUs+50054RXtDYLe+YXmoZn9IPXv8Ca7ARSB3TAO/3DHkEluCkMj3Ykl4Yd
         THur6OTP8ppi9AbE7jjHMl0dw5bubTjx6UzvkjwZVyx5nmL6/4MILSLQx5yOT2FQP9M1
         xDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785031197; x=1785635997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gg16MgmONoPjLbUFY3dyA78voi0asb/XfImqT3Ui7xs=;
        b=NiOAlAxV+3wLFX1kTwtYalCIfhRuh9jh009/9IDCJiPrD8b5wxCLlNRCU9Gsbm3CUq
         AALk2okrVdS0sZneT5sKQWb0lzURRBijNQazVBMsEy4X2TDj0VXoEBvBGg2Fn/DEo4OG
         mK66NSyWgN7zihPN1G8CJXtCMYwi1KwNEo2H4QIGp6nG9p3ZM5E0Ry//yGDtt1Va2V8q
         P19XzOvvRcAyGkt2/A1+kXuSh3sN1TsjdlCNxCUOkGgN4e1BbKg3ItgWbQM0SfqpcA7W
         3FCqRmnHR3hqfLHas91GxXHTC7A3rM+vQyqyDAaPsN/d5yC/AM4YmDRyMrV+jbisI2r9
         iOzg==
X-Forwarded-Encrypted: i=1; AHgh+RriH71kXEYt4FjgvuzQy++pY4nlQ1l/KWWT2pBtP82Oo2PM6+qQ6qpOJHA+l/gY8sNSdMX4bVHK1j3m@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm85aOCA/m0Tbwsbz/PxDMAH6Us4ja3mDGJDaiEloeqvydjd59
	BOBZIV0JTeZjzuyzUAbsHlUlGPcawdFu5BJXtJTaAjP9Uf5Mjimard2b
X-Gm-Gg: AR+sD12384tZiSKvRuARtzr1amQkbv8Qa7nrtQTMMcMVVUkocYlGAAgZRIi3mLYBUq8
	8WQQULHWar+2xHoQ7OgaCHyZ6xwXi6QR01kznmPX6qu/y4lmqNtApcb2Fbpj2VLdvYabKxpaU/E
	0lS6Vi8QlJu7IYsKTGIA6swjKkzFm+1U4OsT58mwoNaVOJOeqP8JMeASrjGjqqJ8NhH9TEbVOOC
	MsYaUHTZoUCl9kI0gYIvtMBKaOpiyaT6fuuwGfrC5RExaREV5jPfkAmyh1XWajpcyMYYVOv6ceq
	r4wAaNrURJkhCyEYMg2n18gtr4RXIDAkwbrklE+q0pJ0itXgu0a4gj2tSEihC1SWwj/4u0q9LC6
	eTeS0WnpctBNVysIEiqF3EkRit4ZbpARcYQNl+Yq2KO8Iz4atAnIMAltqc/GAM2ohygyL95jJGF
	WoOZY5Gnx+1rBAKwkLCuVVIxmLk2J56btKandjrNkh7aMVpIC4HU+38fm1V8nBi5L4vPGCMdISO
	gBwvBEtDdPsMJmGVAlrKXTD58o/V/mX4U2jOiYM2Nqs
X-Received: by 2002:a05:6830:67c6:b0:7dc:c4ae:a689 with SMTP id 46e09a7af769-7ee78a51bb2mr3356144a34.2.1785031197279;
        Sat, 25 Jul 2026 18:59:57 -0700 (PDT)
Received: from rdf-gcp2.us-central1-b.c.storage-xlrait-66065.internal (163.80.112.136.bc.googleusercontent.com. [136.112.80.163])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee29e0ec5bsm9335656a34.10.2026.07.25.18.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 18:59:56 -0700 (PDT)
From: Russ Fellows <russ.fellows@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russ Fellows <russ.fellows@gmail.com>
Subject: [PATCH v4 2/2] fuse: allow parallel direct writes in passthrough write_iter
Date: Sun, 26 Jul 2026 01:59:55 +0000
Message-ID: <20260726015955.319132-3-russ.fellows@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260726015955.319132-1-russ.fellows@gmail.com>
References: <20260616231325.16788-1-russ.fellows@gmail.com>
 <20260726015955.319132-1-russ.fellows@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_passthrough_write_iter() unconditionally took the exclusive inode
lock, so passthrough writes were fully serialised even when the server
advertised FOPEN_PARALLEL_DIRECT_WRITES and the write was direct,
non-append and within EOF.  Native direct-IO writes already take a
shared lock in that case via fuse_dio_lock(); passthrough should do the
same.

Rather than duplicate the direct-IO locking logic, generalise it and
share it between both write paths:

 - rename fuse_dio_wr_exclusive_lock() to fuse_io_wr_exclusive_lock()
   and teach it that a passthrough open without FOPEN_DIRECT_IO only
   qualifies for the shared lock when the write itself is IOCB_DIRECT
   (buffered passthrough writes keep the exclusive lock);
 - factor the uncached-io refcount dance into fuse_parallel_dio_start()
   and fuse_parallel_dio_end(), which are no-ops for the permanent
   uncached iomode that passthrough opens hold, so the shared-lock
   past-EOF re-check works unchanged for both paths;
 - rename fuse_dio_lock()/fuse_dio_unlock() to fuse_io_wr_lock()/
   fuse_io_wr_unlock(), export them via fuse_i.h, and call them from
   fuse_passthrough_write_iter().

No functional change for the native direct-IO write path.

Suggested-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Russ Fellows <russ.fellows@gmail.com>
---
 fs/fuse/file.c        | 53 ++++++++++++++++++++++++++++++++++---------
 fs/fuse/fuse_i.h      |  2 ++
 fs/fuse/passthrough.c |  6 ++---
 3 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 79d1b50..449837a 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1349,19 +1349,29 @@ static bool fuse_io_past_eof(struct kiocb *iocb, struct iov_iter *iter)
 }
 
 /*
- * @return true if an exclusive lock for direct IO writes is needed
+ * @return true if an exclusive lock for direct IO or passthrough writes is
+ * needed
  */
-static bool fuse_dio_wr_exclusive_lock(struct kiocb *iocb, struct iov_iter *from)
+static bool fuse_io_wr_exclusive_lock(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct file *file = iocb->ki_filp;
 	struct fuse_file *ff = file->private_data;
 	struct inode *inode = file_inode(iocb->ki_filp);
 	struct fuse_inode *fi = get_fuse_inode(inode);
+	bool fopen_direct_io = ff->open_flags & FOPEN_DIRECT_IO;
 
 	/* Server side has to advise that it supports parallel dio writes. */
 	if (!(ff->open_flags & FOPEN_PARALLEL_DIRECT_WRITES))
 		return true;
 
+	/*
+	 * Passthrough opens without FOPEN_DIRECT_IO only support parallel
+	 * writes for I/O that is itself direct (IOCB_DIRECT); buffered
+	 * passthrough writes still need the exclusive lock.
+	 */
+	if (!fopen_direct_io && !(iocb->ki_flags & IOCB_DIRECT))
+		return true;
+
 	/*
 	 * Append will need to know the eventual EOF - always needs an
 	 * exclusive lock.
@@ -1380,13 +1390,33 @@ static bool fuse_dio_wr_exclusive_lock(struct kiocb *iocb, struct iov_iter *from
 	return false;
 }
 
-static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
-			  bool *exclusive)
+static int fuse_parallel_dio_start(struct fuse_file *ff, struct fuse_inode *fi)
+{
+	/* Passthrough opens are in permanent uncached mode */
+	if (ff->iomode == IOM_UNCACHED)
+		return 0;
+
+	return fuse_inode_uncached_io_start(fi, NULL);
+}
+
+static void fuse_parallel_dio_end(struct fuse_file *ff, struct fuse_inode *fi)
+{
+	/* Passthrough opens are in permanent uncached mode */
+	if (ff->iomode == IOM_UNCACHED)
+		return;
+
+	/* Allow opens in caching mode after last parallel dio end */
+	fuse_inode_uncached_io_end(fi);
+}
+
+/* Take shared/exclusive inode lock for a direct IO or passthrough write */
+void fuse_io_wr_lock(struct kiocb *iocb, struct iov_iter *from, bool *exclusive)
 {
+	struct fuse_file *ff = iocb->ki_filp->private_data;
 	struct inode *inode = file_inode(iocb->ki_filp);
 	struct fuse_inode *fi = get_fuse_inode(inode);
 
-	*exclusive = fuse_dio_wr_exclusive_lock(iocb, from);
+	*exclusive = fuse_io_wr_exclusive_lock(iocb, from);
 	if (*exclusive) {
 		inode_lock(inode);
 	} else {
@@ -1399,7 +1429,7 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
 		 * have raced, so check it again.
 		 */
 		if (fuse_io_past_eof(iocb, from) ||
-		    fuse_inode_uncached_io_start(fi, NULL) != 0) {
+		    fuse_parallel_dio_start(ff, fi) != 0) {
 			inode_unlock_shared(inode);
 			inode_lock(inode);
 			*exclusive = true;
@@ -1407,16 +1437,17 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
 	}
 }
 
-static void fuse_dio_unlock(struct kiocb *iocb, bool exclusive)
+/* Release the inode lock taken for a direct IO or passthrough write */
+void fuse_io_wr_unlock(struct kiocb *iocb, bool exclusive)
 {
+	struct fuse_file *ff = iocb->ki_filp->private_data;
 	struct inode *inode = file_inode(iocb->ki_filp);
 	struct fuse_inode *fi = get_fuse_inode(inode);
 
 	if (exclusive) {
 		inode_unlock(inode);
 	} else {
-		/* Allow opens in caching mode after last parallel dio end */
-		fuse_inode_uncached_io_end(fi);
+		fuse_parallel_dio_end(ff, fi);
 		inode_unlock_shared(inode);
 	}
 }
@@ -1759,7 +1790,7 @@ static ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	ssize_t res;
 	bool exclusive;
 
-	fuse_dio_lock(iocb, from, &exclusive);
+	fuse_io_wr_lock(iocb, from, &exclusive);
 	res = generic_write_checks(iocb, from);
 	if (res > 0) {
 		task_io_account_write(res);
@@ -1773,7 +1804,7 @@ static ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			fuse_write_update_attr(inode, iocb->ki_pos, res);
 		}
 	}
-	fuse_dio_unlock(iocb, exclusive);
+	fuse_io_wr_unlock(iocb, exclusive);
 
 	return res;
 }
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index c288f28..821eccf 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1529,6 +1529,8 @@ struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
 				 unsigned int open_flags, bool isdir);
 void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 		       unsigned int open_flags, fl_owner_t id, bool isdir);
+void fuse_io_wr_lock(struct kiocb *iocb, struct iov_iter *from, bool *exclusive);
+void fuse_io_wr_unlock(struct kiocb *iocb, bool exclusive);
 
 /* backing.c */
 #ifdef CONFIG_FUSE_PASSTHROUGH
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index f2d08ac..2f4fe90 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -54,11 +54,11 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
 				    struct iov_iter *iter)
 {
 	struct file *file = iocb->ki_filp;
-	struct inode *inode = file_inode(file);
 	struct fuse_file *ff = file->private_data;
 	struct file *backing_file = fuse_file_passthrough(ff);
 	size_t count = iov_iter_count(iter);
 	ssize_t ret;
+	bool exclusive;
 	struct backing_file_ctx ctx = {
 		.cred = ff->cred,
 		.end_write = fuse_passthrough_end_write,
@@ -70,10 +70,10 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
 	if (!count)
 		return 0;
 
-	inode_lock(inode);
+	fuse_io_wr_lock(iocb, iter, &exclusive);
 	ret = backing_file_write_iter(backing_file, iter, iocb, iocb->ki_flags,
 				      &ctx);
-	inode_unlock(inode);
+	fuse_io_wr_unlock(iocb, exclusive);
 
 	return ret;
 }
-- 
2.51.0

