Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5E322F01
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892746; cv=none; b=Soo+KAmmFRBY5tpI2QCNmbqOLk9r7PzJcHfbEJrgYJv1+B8QaLtROLU7VLuXkUahHlZMoo2tJ7/bd1uO0ez0jrHbk/xFAZPiusngh0CyzBjeDgcUvaRBnh3G7Vzd2OnmA2+6B1qtcH6m9Nn1w7z3eGGejNDxD3g11XI7lhxejb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892746; c=relaxed/simple;
	bh=vk/vgFQ6+2WpIg9UaWiUarVSqBBGF7EhKS1Qx76mHqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hnSUQ6n7pvRTCGfVc5hFIMRuDEgcc1fThZJFZjFVVNfIr+n1vIA3zzHgR1YUCYmQFBgfamRrRVz7eLZsimxmJF+a2dNR9QzShazuFlm9d8vhxo2kKAvpQUEyWqXGEHLNG7SZjnO5N15pK9J0KM/Qw74uHd1+WrwRfp6XCNWEDI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeAqXwhO; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeAqXwhO"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7bd65714dcaso432237b3.3
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892744; x=1779497544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCsp+ZYKwisIwS3s9YFG8yk7hCyMTUst+sbdjhxh9dI=;
        b=NeAqXwhO7XtmEQU+TWfHwhLoN8g3U2v8OgelTuIkiQm8x7K48qnjfN383NsSGUqr5+
         cFT34/R/3g1T8MU17l0IN4Y/m30vV+qtbsMN76uy4Bsr4iw2fdJr20jC9YgVzgh9gYR+
         IZOuCh+6pJOvgmAop9Jp8qTwLqz9GEFdYdAfbKsg3moQ0BpJ0qNt+cC+ri4V1ou0WTS0
         UbaJoQko5vBR1aJXk5bcB+En0lrY/PoI0Z/K72tJK85MHph+eYxTBlcUKz8LaiZwwaXf
         d15f7hlN5uZDUl1KrhedgOU+/CJXutA2Ioo8cBiJCyK4TqJiwWEnQyVsICg3YXVXWFq/
         dr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892744; x=1779497544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vCsp+ZYKwisIwS3s9YFG8yk7hCyMTUst+sbdjhxh9dI=;
        b=jZzSnbm8hpzg5DerkrbseTMSNrSN8ZaQpTB7tPn6d5qpArXv8MVv9SmZGzfzV30XY8
         y15gQjkAK3ku06pqBOn4ohn+eULIamAvSNjOtbYonbj8Fe+7zoPJ+u2xyNRJ/40WvHPW
         I87YYV1PC1DEK0L86oXR+lqCF2Pfq3rQwFfvnHw2jYznv+kHyDMJAjph2oyvrC6LgyDB
         xVjzj9XCiLFqRWOey5j4DYewD5wE+WZpQaP4Ta94rz+kWqA3XVH9UIsbLGO6gYLLZ3l0
         uu1LoBQr/MhG5wFdSkoCyRk9HiHa4P9vhP95nRUNHLsEvu05O9FFj+47Oz60vHKEJlTz
         ZG/A==
X-Gm-Message-State: AOJu0Yxku4lxC+soXLSL9QGYynbiunApnspRPs/xTDovso58m0XG+oPc
	M5pV2LMkbACoUzPO4CbGXHbsJ1xRwFSzrLQV6hyNaWFDI6ZA3wMOGNuj
X-Gm-Gg: Acq92OEAMIndc3gyoMrvSopaOUSKiG/LOSPwhXoHueuPyALPZ6tIr+8n+a/rqcPYqqj
	7maliGA0B8gEynv3ZwQ8TN5+XEMdHRPsPK8AU2CQ0n2uNIyuVgkt5ZKRIzX+5M5Pqrz+/Snbwv7
	oTiH4nBEZR3dPfBc5vgKelD07yfQ+nrZ7guB7tfdPfYS8iPViPIF9taQhcVXSPPbb8en+mNxV1h
	uirEBVJ1IHC7qlzXrXzGzhfG/N2JdhG/kT3e6i4cmgQ3AP/2N8Pnuvl9VGq9p/Hm7ZNrx6BzIPy
	A1vAxfeRU+8frCEMi4aA230RwqmeFHRaXcDFEOxyLL4X+gLwNX4n0TzBTz65lOgXvVE2ghsh6fJ
	hfW8RZaodYA2ooRLETPsa6R9Do3lJgMOC/Y07Jvc7+LMyAGtqCq6/x4XW6fizJr/TYPx2RuUmyT
	mJvyckUGX9g34IO4NnvaeN
X-Received: by 2002:a05:690c:e3c8:b0:7b8:bc4e:a4c with SMTP id 00721157ae682-7c95c7edf0bmr68435577b3.27.1778892744127;
        Fri, 15 May 2026 17:52:24 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:11::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f4ee635csm37152337b3.32.2026.05.15.17.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:23 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 03/21] fuse: prepare for readdir passthrough on directories
Date: Fri, 15 May 2026 17:39:46 -0700
Message-ID: <20260516004004.1455526-4-joannelkoong@gmail.com>
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

In preparation for readdir passthrough, allow the inode iomode state
to be applicable to directory inodes and prepare the helper
fuse_sync_release() for directories.

Directory inodes will support cached mode, "direct" uncached readdir
mode and readdir passthrough mode, but will not need to wait for
parallel dio like regular files.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/fuse/cuse.c   |  2 +-
 fs/fuse/dir.c    |  4 ++--
 fs/fuse/file.c   | 11 ++++++-----
 fs/fuse/fuse_i.h | 15 +++++++++------
 fs/fuse/inode.c  |  2 +-
 fs/fuse/iomode.c | 31 ++++++++++++++++++-------------
 6 files changed, 37 insertions(+), 28 deletions(-)

diff --git a/fs/fuse/cuse.c b/fs/fuse/cuse.c
index bac327cfc7f1..9c4d7a1993e8 100644
--- a/fs/fuse/cuse.c
+++ b/fs/fuse/cuse.c
@@ -148,7 +148,7 @@ static int cuse_release(struct inode *inode, struct file *file)
 	struct fuse_file *ff = file->private_data;
 	struct fuse_mount *fm = ff->fm;
 
-	fuse_sync_release(NULL, ff, file->f_flags);
+	fuse_sync_release(NULL, ff, file->f_flags, false);
 	fuse_conn_put(fm->fc);
 
 	return 0;
diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index be41c14ef329..937165788e79 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -893,7 +893,7 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 			  &outentry.attr, ATTR_TIMEOUT(&outentry), 0, 0);
 	if (!inode) {
 		flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
-		fuse_sync_release(NULL, ff, flags);
+		fuse_sync_release(NULL, ff, flags, false);
 		fuse_chan_queue_forget(fm->fc->chan, forget, outentry.nodeid, 1);
 		err = -ENOMEM;
 		goto out_err;
@@ -910,7 +910,7 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	}
 	if (err) {
 		fi = get_fuse_inode(inode);
-		fuse_sync_release(fi, ff, flags);
+		fuse_sync_release(fi, ff, flags, false);
 	} else {
 		if (fm->fc->atomic_o_trunc && trunc)
 			truncate_pagecache(inode, 0);
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 06dc8cfe3c7b..332032cd5622 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -285,7 +285,7 @@ static int fuse_open(struct inode *inode, struct file *file)
 		ff = file->private_data;
 		err = fuse_finish_open(inode, file);
 		if (err)
-			fuse_sync_release(fi, ff, file->f_flags);
+			fuse_sync_release(fi, ff, file->f_flags, false);
 		else if (is_truncate)
 			fuse_truncate_update_attr(inode, file);
 	}
@@ -408,10 +408,12 @@ static int fuse_release(struct inode *inode, struct file *file)
 }
 
 void fuse_sync_release(struct fuse_inode *fi, struct fuse_file *ff,
-		       unsigned int flags)
+		       unsigned int flags, bool isdir)
 {
+	int opcode = isdir ? FUSE_RELEASEDIR : FUSE_RELEASE;
+
 	WARN_ON(refcount_read(&ff->count) > 1);
-	fuse_prepare_release(fi, ff, flags, FUSE_RELEASE, true);
+	fuse_prepare_release(fi, ff, flags, opcode, true);
 	fuse_file_put(ff, true);
 }
 EXPORT_SYMBOL_GPL(fuse_sync_release);
@@ -1454,13 +1456,12 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
 static void fuse_dio_unlock(struct kiocb *iocb, bool exclusive)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
-	struct fuse_inode *fi = get_fuse_inode(inode);
 
 	if (exclusive) {
 		inode_unlock(inode);
 	} else {
 		/* Allow opens in caching mode after last parallel dio end */
-		fuse_inode_uncached_io_end(fi);
+		fuse_inode_uncached_io_end(inode);
 		inode_unlock_shared(inode);
 	}
 }
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 8e54dc7d56af..2436219338b3 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -160,9 +160,6 @@ struct fuse_inode {
 			 */
 			int writectr;
 
-			/** @iocachectr: Number of files/maps using page cache */
-			int iocachectr;
-
 			/** @page_waitq: Waitq for writepage completion */
 			wait_queue_head_t page_waitq;
 
@@ -216,6 +213,12 @@ struct fuse_inode {
 	/** @lock: Lock to protect write-related fields */
 	spinlock_t lock;
 
+	/**
+	 * @iocachectr: Number of files/maps using page cache (negative for
+	 * passthrough)
+	 */
+	int iocachectr;
+
 #ifdef CONFIG_FUSE_DAX
 	/**
 	 * @dax: Dax specific inode data
@@ -248,7 +251,7 @@ enum {
 	FUSE_I_BAD,
 	/* Has btime */
 	FUSE_I_BTIME,
-	/* Wants or already has page cache IO */
+	/* Regular file wants or already has page cache IO */
 	FUSE_I_CACHE_IO_MODE,
 	/*
 	 * Client has exclusive access to the inode, either because fs is local
@@ -946,7 +949,7 @@ void fuse_file_free(struct fuse_file *ff);
 int fuse_finish_open(struct inode *inode, struct file *file);
 
 void fuse_sync_release(struct fuse_inode *fi, struct fuse_file *ff,
-		       unsigned int flags);
+		       unsigned int flags, bool isdir);
 
 /*
  * Send RELEASE or RELEASEDIR request
@@ -1244,7 +1247,7 @@ int fuse_fileattr_set(struct mnt_idmap *idmap,
 /* iomode.c */
 int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff);
 int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb);
-void fuse_inode_uncached_io_end(struct fuse_inode *fi);
+void fuse_inode_uncached_io_end(struct inode *inode);
 
 int fuse_file_io_open(struct file *file, struct inode *inode);
 void fuse_file_io_release(struct fuse_file *ff, struct inode *inode);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index b2a5892a4dc3..cef8b853b3d8 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -180,10 +180,10 @@ static void fuse_evict_inode(struct inode *inode)
 			atomic64_inc(&fc->evict_ctr);
 	}
 	if (S_ISREG(inode->i_mode) && !fuse_is_bad(inode)) {
-		WARN_ON(fi->iocachectr != 0);
 		WARN_ON(!list_empty(&fi->write_files));
 		WARN_ON(!list_empty(&fi->queued_writes));
 	}
+	WARN_ON(fi->iocachectr != 0);
 }
 
 static int fuse_reconfigure(struct fs_context *fsc)
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index 5517711a3eca..e2e7fbaac9af 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -15,9 +15,12 @@
 /*
  * Return true if need to wait for new opens in caching mode.
  */
-static inline bool fuse_is_io_cache_wait(struct fuse_inode *fi)
+static inline bool fuse_is_io_cache_wait(struct inode *inode)
 {
-	return READ_ONCE(fi->iocachectr) < 0 && !fuse_inode_backing(fi);
+	struct fuse_inode *fi = get_fuse_inode(inode);
+
+	return S_ISREG(inode->i_mode) &&
+		READ_ONCE(fi->iocachectr) < 0 && !fuse_inode_backing(fi);
 }
 
 /*
@@ -40,10 +43,10 @@ int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff)
 	 * Setting the bit advises new direct-io writes to use an exclusive
 	 * lock - without it the wait below might be forever.
 	 */
-	while (fuse_is_io_cache_wait(fi)) {
+	while (fuse_is_io_cache_wait(inode)) {
 		set_bit(FUSE_I_CACHE_IO_MODE, &fi->state);
 		spin_unlock(&fi->lock);
-		wait_event(fi->direct_io_waitq, !fuse_is_io_cache_wait(fi));
+		wait_event(fi->direct_io_waitq, !fuse_is_io_cache_wait(inode));
 		spin_lock(&fi->lock);
 	}
 
@@ -69,8 +72,10 @@ int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff)
 }
 
 static void fuse_file_cached_io_release(struct fuse_file *ff,
-					struct fuse_inode *fi)
+					struct inode *inode)
 {
+	struct fuse_inode *fi = get_fuse_inode(inode);
+
 	spin_lock(&fi->lock);
 	WARN_ON(fi->iocachectr <= 0);
 	WARN_ON(ff->iomode != IOM_CACHED);
@@ -141,15 +146,17 @@ static int fuse_file_uncached_io_open(struct inode *inode,
 	return 0;
 }
 
-void fuse_inode_uncached_io_end(struct fuse_inode *fi)
+void fuse_inode_uncached_io_end(struct inode *inode)
 {
+	struct fuse_inode *fi = get_fuse_inode(inode);
 	struct fuse_backing *oldfb = NULL;
 
 	spin_lock(&fi->lock);
 	WARN_ON(fi->iocachectr >= 0);
 	fi->iocachectr++;
 	if (!fi->iocachectr) {
-		wake_up(&fi->direct_io_waitq);
+		if (S_ISREG(inode->i_mode))
+			wake_up(&fi->direct_io_waitq);
 		oldfb = fuse_inode_backing_set(fi, NULL);
 	}
 	spin_unlock(&fi->lock);
@@ -159,11 +166,11 @@ void fuse_inode_uncached_io_end(struct fuse_inode *fi)
 
 /* Drop uncached_io reference from passthrough open */
 static void fuse_file_uncached_io_release(struct fuse_file *ff,
-					  struct fuse_inode *fi)
+					  struct inode *inode)
 {
 	WARN_ON(ff->iomode != IOM_UNCACHED);
 	ff->iomode = IOM_NONE;
-	fuse_inode_uncached_io_end(fi);
+	fuse_inode_uncached_io_end(inode);
 }
 
 /*
@@ -278,8 +285,6 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
 /* No more pending io and no new io possible to inode via open/mmapped file */
 void fuse_file_io_release(struct fuse_file *ff, struct inode *inode)
 {
-	struct fuse_inode *fi = get_fuse_inode(inode);
-
 	/*
 	 * Last passthrough file close allows caching inode io mode.
 	 * Last caching file close exits caching inode io mode.
@@ -289,10 +294,10 @@ void fuse_file_io_release(struct fuse_file *ff, struct inode *inode)
 		/* Nothing to do */
 		break;
 	case IOM_UNCACHED:
-		fuse_file_uncached_io_release(ff, fi);
+		fuse_file_uncached_io_release(ff, inode);
 		break;
 	case IOM_CACHED:
-		fuse_file_cached_io_release(ff, fi);
+		fuse_file_cached_io_release(ff, inode);
 		break;
 	}
 }
-- 
2.52.0

