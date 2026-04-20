Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187503876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723517; cv=none; b=RGsm5WCtBndM5Au369yjyQfojgjrkvdrrkKUUclRxZ7IcrAsLqWVx+Ti7ya9XZ3Axil1nvhXWNrja20V75z+Ju/bZdk8g13PaRSnvdQqXNuunVT2kPnabLt4VQGLIuL5W3Tq+GPxV2KXbLXsweAOxiLPBTztAriIKIky5fhbuPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723517; c=relaxed/simple;
	bh=2P/aLG7bA5MQfTb2Nhc1ZWD7qlGycx99WSDYCsbdoCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ToZqCSN+24I69S5Kh+8LOyY1ByqB34ljSDJsujfYRHtZTVrrToqoNBDG2dMggzSj5b/KjtHJ4DWkbWPYBvRW5IsGk57l4LZ4OSUkw7tyrH0OsHNyZt0OclL0jgJf4xQirO7WDJuqYuNDdX+URtwZdJkEGaUdRhJgWH6DZ4XnZaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j43J9Hkj; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j43J9Hkj"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so2081569a91.0
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723515; x=1777328315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+1KdsWM02IQI6Hno+yj4dpWMJ57F2MF+2F42NXY/dk=;
        b=j43J9HkjCqsE1mZ830pe44t0EY8oCtp4BCzBSaKjhbyqjqtBkSGBIPMK7EKc6oJXTb
         VaYdoIdQ737DrL2gezvfj7IDkcCdUYTHwWZhsaXO+PrT5FNR/C5ewnb0FeJ0OzcNpsbz
         rC5Ac+8dGWjZH8KXlmLxZO4cXwToiknaSwAGp7R28q7V0dXaixKoXRAeSEB1S2/MPZlV
         C5Tmtqus63Sel/toFWLCuqAPE1FkKcM/nCadM1EfSCWPfbhfKZAV+rPm9Vq3Q5a3hA5i
         JGGi57hjdvA4P38nIYbBwvQWxd6aWv9rt+m5c4wlssJrkvVKC1MxT3GWL++rxh+Q+scp
         +A5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723515; x=1777328315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D+1KdsWM02IQI6Hno+yj4dpWMJ57F2MF+2F42NXY/dk=;
        b=AYa+e1IZ/hp7+0xPdWgkN4l7XusaEBpcaBwmvl7Ye3RBEqX0pTwdINLKJt1mdjKLYQ
         YTPbUqDuFrLBXNYokDMHaylDBod3A0f5H1R6uRnGcTBDmg9SASZLsHth+xBLzE5SYtOP
         /YPVy+HPp3G8bQ38KLvYcNsj+w6bsHQuMHP4R6PWrTwyPAvmb1t9nnnjUO7mK27mAz+A
         UEHFiQ5PTxq2c9gQwEi4Yhx+dZBmSruPQX9r/4kus/PfnqP1yHrxRxnGiwEVXsGrVF+I
         m36/PHncLrQHmxeHp+6TTxA8IVC+gvkTllzuTLPGtQf9Sf+C/+3U/6LUQMj/C3H12VMn
         181w==
X-Forwarded-Encrypted: i=1; AFNElJ/voAkD2qUU5htwfT4PD3hSazhWwbrTm1zbz6F+tnAH+5QiTOv9R5ZAdofiL5js1UkniiF6ZYr12rzg@lists.linux.dev
X-Gm-Message-State: AOJu0YxXYy8O2FkUaDx+GpEMEf/4rt0A96VbPOiM4138uhFxodvZLNxB
	e0IMY0Eedupdw5K935UQhImmV2hmJPq6/RtR4yBJQQNCp17pucMVpuOe
X-Gm-Gg: AeBDiev2H2KwZS3I3Sf+hW/ttbHQBKqtVZZNGsXIeXhsOD0i+68kXT+6Vjy58on+On0
	Lj2P6xuoMhrtouhZRxPFYXijtnJeoNCApEbbHkSmUV9QCFID0sNYJom0NOdodMhwbXDi72xrHW4
	8ZwFXKDLArGXCO1Bb16B+WTWxTB7icMv1KDsBFprdZuyyzY8asXPkg0bwIW06ld9JnkDvfkDg0Y
	Ht7UEyqY38fQGrInyttgavGchBwv2wg4B56XKxcIzDIN81DB+zGMc9C7hFiC3Z4T2CM3V+0gHsw
	l2UIXtYNVSnhI/xGDF3nbYTiPYosQWMjGBiXsGwY3vDeVbn/y4jAierALJb12C+FLMSjAGrqOc+
	2uyk7iDawgr5XFGwnNRQJ/rzgH7ybI8Qvcp2Ih6JdFhEyADYhC0TEqmU8pHKXNXQnTxro2LfYu/
	8WimBrgbnQGeNOdOcjFfeZuzr08MA=
X-Received: by 2002:a17:90b:4c52:b0:35f:b647:d98a with SMTP id 98e67ed59e1d1-361403c3412mr16372277a91.5.1776723515314;
        Mon, 20 Apr 2026 15:18:35 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:1::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fa8e5d3sm5574694a91.2.2026.04.20.15.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:34 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 03/17] fuse: prepare for readdir passthrough on directories
Date: Mon, 20 Apr 2026 15:16:23 -0700
Message-ID: <20260420221637.2631478-4-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260420221637.2631478-1-joannelkoong@gmail.com>
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
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
 fs/fuse/fuse_i.h | 12 ++++++------
 fs/fuse/inode.c  |  2 +-
 fs/fuse/iomode.c | 31 ++++++++++++++++++-------------
 6 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/fs/fuse/cuse.c b/fs/fuse/cuse.c
index dfcb98a654d8..e168740351a0 100644
--- a/fs/fuse/cuse.c
+++ b/fs/fuse/cuse.c
@@ -147,7 +147,7 @@ static int cuse_release(struct inode *inode, struct file *file)
 	struct fuse_file *ff = file->private_data;
 	struct fuse_mount *fm = ff->fm;
 
-	fuse_sync_release(NULL, ff, file->f_flags);
+	fuse_sync_release(NULL, ff, file->f_flags, false);
 	fuse_conn_put(fm->fc);
 
 	return 0;
diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index b658b6baf72f..015f0c103d06 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -893,7 +893,7 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 			  &outentry.attr, ATTR_TIMEOUT(&outentry), 0, 0);
 	if (!inode) {
 		flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
-		fuse_sync_release(NULL, ff, flags);
+		fuse_sync_release(NULL, ff, flags, false);
 		fuse_queue_forget(fm->fc, forget, outentry.nodeid, 1);
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
index f239c8a888cb..3da4ce73e11b 100644
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
@@ -1456,13 +1458,12 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
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
index eb974739dd5e..1c4646ad7c25 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -161,9 +161,6 @@ struct fuse_inode {
 			 * (FUSE_NOWRITE) means more writes are blocked */
 			int writectr;
 
-			/** Number of files/maps using page cache */
-			int iocachectr;
-
 			/* Waitq for writepage completion */
 			wait_queue_head_t page_waitq;
 
@@ -206,6 +203,9 @@ struct fuse_inode {
 	/** Lock to protect write related fields */
 	spinlock_t lock;
 
+	/** Number of files/maps using page cache (negative for passthrough) */
+	int iocachectr;
+
 #ifdef CONFIG_FUSE_DAX
 	/*
 	 * Dax specific inode data
@@ -238,7 +238,7 @@ enum {
 	FUSE_I_BAD,
 	/* Has btime */
 	FUSE_I_BTIME,
-	/* Wants or already has page cache IO */
+	/* Regular file wants or already has page cache IO */
 	FUSE_I_CACHE_IO_MODE,
 	/*
 	 * Client has exclusive access to the inode, either because fs is local
@@ -1192,7 +1192,7 @@ void fuse_file_free(struct fuse_file *ff);
 int fuse_finish_open(struct inode *inode, struct file *file);
 
 void fuse_sync_release(struct fuse_inode *fi, struct fuse_file *ff,
-		       unsigned int flags);
+		       unsigned int flags, bool isdir);
 
 /**
  * Send RELEASE or RELEASEDIR request
@@ -1542,7 +1542,7 @@ int fuse_fileattr_set(struct mnt_idmap *idmap,
 /* iomode.c */
 int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff);
 int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb);
-void fuse_inode_uncached_io_end(struct fuse_inode *fi);
+void fuse_inode_uncached_io_end(struct inode *inode);
 
 int fuse_file_io_open(struct file *file, struct inode *inode);
 void fuse_file_io_release(struct fuse_file *ff, struct inode *inode);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 014b9af42909..bdc135f9fe3e 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -192,10 +192,10 @@ static void fuse_evict_inode(struct inode *inode)
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
index 6815b4506007..2360b32793c2 100644
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
@@ -267,8 +274,6 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
 /* No more pending io and no new io possible to inode via open/mmapped file */
 void fuse_file_io_release(struct fuse_file *ff, struct inode *inode)
 {
-	struct fuse_inode *fi = get_fuse_inode(inode);
-
 	/*
 	 * Last passthrough file close allows caching inode io mode.
 	 * Last caching file close exits caching inode io mode.
@@ -278,10 +283,10 @@ void fuse_file_io_release(struct fuse_file *ff, struct inode *inode)
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

