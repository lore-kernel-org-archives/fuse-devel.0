Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ABE44A3E7
	for <fuse-devel@lists.linux.dev>; Thu,  8 Oct 2026 11:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458419; cv=none; b=IxDULZSNHNCmx1SVIFqq5rcIkld5sTGj2PvZHGaXsWVolZNgGkLKparGQvI5bi7AY+Qzv4TvAgdbGKA2SLApdoj84pZ3jeeek4a6fQHAwKJ+pO5e25nPGmqGzgwny/MnAJpnd2FnE88fxAhQhQ43j0WCsd0FRaKYzbvh17IDIkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458419; c=relaxed/simple;
	bh=2rIGECyZjSF2auczJUR7Yux0Qx/V/7+6fBhD1jR+Xzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=LgxW+X8B8/XrL14F/7SF/IQknfUoYXMwvq8xt7UJDi5Sjxfa910UYU5ND8+z9KCBjoOYEF5K9et6Ce/vNl9x5dY9fkHmDa07Ok3n1HnxT/DnDfxeU/2rE6qHgqDo6+NyQPy6H0lGkse4QHefjAg7D41QigYVPG5tu4FJjR9pUss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T9EK2SY9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T9EK2SY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791458417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9AMWjO0Ab//ipTusaine7Bfhe+JwFGTxnhgr1KvoMWU=;
	b=T9EK2SY9qFjVsMpIW/rpIxx/JEg8SxQB2zMHdLUjw08xqoxlE4Ou6lrB6H9mBaUucXo1sT
	A1LUzDR6sWzMk1QyXmpwRs6pIG9k5wB6kW7niWHEauXjrVLZHs5pmwvs2jH55THCzOv/hs
	WuzGYbFs/hxZD3nXDLg/grLI3AXa99c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-H5RYod0yNgyd653iBkMcEw-1; Thu, 08 Oct 2026 07:20:16 -0400
X-MC-Unique: H5RYod0yNgyd653iBkMcEw-1
X-Mimecast-MFC-AGG-ID: H5RYod0yNgyd653iBkMcEw_1791458415
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c2e8c76334fso411103366b.1
        for <fuse-devel@lists.linux.dev>; Thu, 08 Oct 2026 04:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458415; x=1792063215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9AMWjO0Ab//ipTusaine7Bfhe+JwFGTxnhgr1KvoMWU=;
        b=dHZ2bFCdEnzQPxgtSA1rIM0VABxfFqsJp7eqhoU09QXMnRqsX+NoKCxfrLeG6cdlAu
         vWt5UUQ3ALX7YWvNRvUlAKaPUupF/sX6dv2YzWO6kmoHuOApJne5l2ATJsr0jTABAlSZ
         2BQ2gwRyuCM4555JZ5hz3/sD/Hs7ied3vroJYlrpTJqRnuuX93cxKfQWtPXm0eWYojVt
         gcKIY95MvBdrwlcJlyAAxz3DlDq1ZFKW+RLtJhlmT49QTbFnF/IZPiY4FfXlJPEmlBLt
         uAddJFJ0RQRZ020D2oOTgcQhnFJoL8Ma0rlQ2EMnY3HsJ9ib+V3F1NOFTcjjnKzM1Ql+
         2EAg==
X-Gm-Message-State: AFuF++lPIb/8To2SkLtWCd0QStMaINJbQWo6ugz67EUga3CnS5OBOs+b
	E7GjqMNr0ZrM5dYId4cxjq6B2vpAui+5+8ikng1aPlMCHh57XVpIIR3a+XR7TH81I37lshMMlkM
	7SUDwxaAPfkSEJyxL/6ayc9RW3kculawR8AK6wVTavCu/9L8TYPzQSChdfj4hkbHTkoSd6HaUbC
	5mo/a3HMRYu93oFFhfOYrUgrE2q/bDENwOBW/TaCyuepyZ/ZU=
X-Gm-Gg: AYBFou3JPneEHYaMsGhkFBIJ9SoP1MenyPBft76RZ+vTL6PQrxBksHUBjDyyfKD9XRU
	8dT2P61G8y8OC7qtrM65WbDO5GFdjVxuiAGKRw1e6WBcBw9zr5JzktZT6aPEO9hC+WaFAI59QDZ
	k2PonBYiDd1GITp6cyEG75I9rJgT8tvX/GH16pzTiRJeX+My+M+POqfySpVbYtFgC1FiB13Stao
	3fJN0btUZ8JMHiRRiSOolNYhiH5SmGwNKawOIaUU/NdnMtoNXQ9j9U0pDHZHHWI1FW1RHbgSjGd
	EFUmzJ4smTDLhEH3JJIHdVPh6Id8+DDy7mwa+RY7A12kJJvhKpZUVL+yDVzg8zcNuo4sP83GiCs
	Wbr6Y0l0si4YxKT80+rf7UDBqJ/k2qv/69JzzLg2wJbTn05NH/Vg1r5YF
X-Received: by 2002:a17:907:3d89:b0:c2a:feab:2f19 with SMTP id a640c23a62f3a-c317bb31df2mr484634166b.4.1791458414991;
        Thu, 08 Oct 2026 04:20:14 -0700 (PDT)
X-Received: by 2002:a17:907:3d89:b0:c2a:feab:2f19 with SMTP id a640c23a62f3a-c317bb31df2mr484631966b.4.1791458414561;
        Thu, 08 Oct 2026 04:20:14 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (188-142-152-55.pool.digikabel.hu. [188.142.152.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c2fae53sm204251866b.49.2026.10.08.04.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:20:13 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org
Subject: [PATCH v4 3/9] fuse: add helpers for EIO return value with kernel message
Date: Thu,  8 Oct 2026 13:19:54 +0200
Message-ID: <20261008112004.1899560-4-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008112004.1899560-1-mszeredi@redhat.com>
References: <20261008112004.1899560-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z8UQ_L8py8amFn3POf0o8kv6en71y0GkKZNCa12iM68_1791458415
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Conditions are triggered by a buggy fuse server will result in -EIO which
is hard to interpret without any context.

Add helpers that print a short message to the kernel log as well as
returning the error value.  This serves a dual purpose:

 - documents the error condition inside the code

 - allows the implementor of the fuse server to get the context for the
   error

Some debug messages are removed in favor of this.

This also changes the mmap return value from -ETXTBSY to -ENODEV if a
passthrough open raced with the prior check.  This makes both cases return
-ENODEV if the file is in passthrough mode.

Additionally change the return value of fuse_file_cached_io_open() from an
error value to a bool (true on success) as the error value is translated
anyway.

Currently these use the pr_notice_once() variant.  Possibly should be
changed to a ratelimit of e.g. once per minute.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/file.c        |  6 ++--
 fs/fuse/fuse_i.h      |  4 ++-
 fs/fuse/iomode.c      | 75 ++++++++++++++++++-------------------------
 fs/fuse/passthrough.c | 19 ++++-------
 4 files changed, 43 insertions(+), 61 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 6d707f2b3bff..bde07948d1f0 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -2415,7 +2415,6 @@ static int fuse_file_mmap(struct file *file, struct vm_area_struct *vma)
 	struct fuse_file *ff = file->private_data;
 	struct fuse_conn *fc = ff->fm->fc;
 	struct inode *inode = file_inode(file);
-	int rc;
 
 	/* DAX mmap is superior to direct_io mmap */
 	if (FUSE_IS_VDAX(inode))
@@ -2457,9 +2456,8 @@ static int fuse_file_mmap(struct file *file, struct vm_area_struct *vma)
 		 * After first mmap, the inode stays in caching io mode until
 		 * the direct_io file release.
 		 */
-		rc = fuse_file_cached_io_open(inode, ff);
-		if (rc)
-			return rc;
+		if (!fuse_file_cached_io_open(inode, ff))
+			return -ENODEV;
 	}
 
 	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 8546855386b5..d9ec88028d7b 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -11,6 +11,8 @@
 # define pr_fmt(fmt) "fuse: " fmt
 #endif
 
+#define fuse_EIO(fmt, ...) (pr_notice_once("%s: " fmt "\n", __func__, ##__VA_ARGS__), -EIO)
+
 #include "args.h"
 #include <linux/fuse.h>
 #include <linux/fs.h>
@@ -1251,7 +1253,7 @@ int fuse_fileattr_set(struct mnt_idmap *idmap,
 		      struct dentry *dentry, struct file_kattr *fa);
 
 /* iomode.c */
-int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff);
+bool fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff);
 int fuse_inode_uncached_io_start(struct fuse_inode *fi,
 				 struct fuse_backing *fb);
 void fuse_inode_uncached_io_end(struct fuse_inode *fi);
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index 79637c09e883..1b8b267d0c0d 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -27,15 +27,15 @@ static inline bool fuse_is_io_cache_wait(struct fuse_inode *fi)
  * Blocks new parallel dio writes and waits for the in-progress parallel dio
  * writes to complete.
  */
-int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff)
+bool fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff)
 {
 	struct fuse_inode *fi = get_fuse_inode(inode);
 
 	/* There are no io modes if server does not implement open */
 	if (!ff->args)
-		return 0;
+		return true;
 
-	spin_lock(&fi->lock);
+	guard(spinlock)(&fi->lock);
 	/*
 	 * Setting the bit advises new direct-io writes to use an exclusive
 	 * lock - without it the wait below might be forever.
@@ -53,8 +53,7 @@ int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff)
 	 */
 	if (fuse_inode_backing(fi)) {
 		clear_bit(FUSE_I_CACHE_IO_MODE, &fi->state);
-		spin_unlock(&fi->lock);
-		return -ETXTBSY;
+		return false;
 	}
 
 	WARN_ON(ff->iomode == IOM_UNCACHED);
@@ -64,8 +63,7 @@ int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff)
 			set_bit(FUSE_I_CACHE_IO_MODE, &fi->state);
 		fi->iocachectr++;
 	}
-	spin_unlock(&fi->lock);
-	return 0;
+	return true;
 }
 
 static void fuse_file_cached_io_release(struct fuse_file *ff,
@@ -85,19 +83,16 @@ static void fuse_file_cached_io_release(struct fuse_file *ff,
 int fuse_inode_uncached_io_start(struct fuse_inode *fi, struct fuse_backing *fb)
 {
 	struct fuse_backing *oldfb;
-	int err = 0;
 
-	spin_lock(&fi->lock);
+	guard(spinlock)(&fi->lock);
 	/* deny conflicting backing files on same fuse inode */
 	oldfb = fuse_inode_backing(fi);
-	if (fb && oldfb && oldfb != fb) {
-		err = -EBUSY;
-		goto unlock;
-	}
-	if (fi->iocachectr > 0) {
-		err = -ETXTBSY;
-		goto unlock;
-	}
+	if (fb && oldfb && oldfb != fb)
+		return -EBUSY;
+
+	if (fi->iocachectr > 0)
+		return -ETXTBSY;
+
 	fi->iocachectr--;
 
 	/* fuse inode holds a single refcount of backing file */
@@ -107,9 +102,7 @@ int fuse_inode_uncached_io_start(struct fuse_inode *fi, struct fuse_backing *fb)
 	} else {
 		fuse_backing_put(fb);
 	}
-unlock:
-	spin_unlock(&fi->lock);
-	return err;
+	return 0;
 }
 
 /* Takes uncached_io inode mode reference to be dropped on file release */
@@ -121,8 +114,11 @@ static int fuse_file_uncached_io_open(struct inode *inode,
 	int err;
 
 	err = fuse_inode_uncached_io_start(fi, fb);
-	if (err)
-		return err;
+	if (err) {
+		if (err == -EBUSY)
+			return fuse_EIO("mismatched backing");
+		return fuse_EIO("conflicting caching mode");
+	}
 
 	WARN_ON(ff->iomode != IOM_NONE);
 	ff->iomode = IOM_UNCACHED;
@@ -173,9 +169,11 @@ static int fuse_file_passthrough_open(struct inode *inode, struct file *file)
 	int err;
 
 	/* Check allowed conditions for file open in passthrough mode */
-	if (!IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) || !fc->passthrough ||
-	    (ff->open_flags & ~FOPEN_PASSTHROUGH_MASK))
-		return -EINVAL;
+	if (!IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) || !fc->passthrough)
+		return fuse_EIO("passthrough not enabled");
+
+	if (ff->open_flags & ~FOPEN_PASSTHROUGH_MASK)
+		return fuse_EIO("conflicting open flags");
 
 	fb = fuse_passthrough_open(file, ff->args->open_outarg.backing_id);
 	if (IS_ERR(fb))
@@ -197,7 +195,6 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
 {
 	struct fuse_file *ff = file->private_data;
 	struct fuse_inode *fi = get_fuse_inode(inode);
-	int err;
 
 	/*
 	 * io modes are not relevant with virtiofs DAX and with server that does not
@@ -208,11 +205,12 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
 
 	/*
 	 * Server is expected to use FOPEN_PASSTHROUGH for all opens of an inode
-	 * which is already open for passthrough.
+	 * which is already open for passthrough.  Using incorrect open mode is
+	 * a server mistake, which results in user visible failure of open()
+	 * with EIO error.
 	 */
-	err = -EINVAL;
 	if (fuse_inode_backing(fi) && !(ff->open_flags & FOPEN_PASSTHROUGH))
-		goto fail;
+		return fuse_EIO("FOPEN_PASSTHROUGH expected");
 
 	/*
 	 * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO.
@@ -233,23 +231,12 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
 		return 0;
 
 	if (ff->open_flags & FOPEN_PASSTHROUGH)
-		err = fuse_file_passthrough_open(inode, file);
-	else
-		err = fuse_file_cached_io_open(inode, ff);
-	if (err)
-		goto fail;
+		return fuse_file_passthrough_open(inode, file);
 
-	return 0;
+	if (!fuse_file_cached_io_open(inode, ff))
+		return fuse_EIO("conflicting passthrough open");
 
-fail:
-	pr_debug("failed to open file in requested io mode (open_flags=0x%x, err=%i).\n",
-		 ff->open_flags, err);
-	/*
-	 * The file open mode determines the inode io mode.
-	 * Using incorrect open mode is a server mistake, which results in
-	 * user visible failure of open() with EIO error.
-	 */
-	return -EIO;
+	return 0;
 }
 
 /* No more pending io and no new io possible to inode via open/mmapped file */
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index b43d3e0f7081..489838462d1e 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -159,34 +159,29 @@ struct fuse_backing *fuse_passthrough_open(struct file *file, int backing_id)
 	struct fuse_conn *fc = ff->fm->fc;
 	struct fuse_backing *fb = NULL;
 	struct file *backing_file;
-	int err;
 
-	err = -EINVAL;
 	if (backing_id <= 0)
-		goto out;
+		return ERR_PTR(fuse_EIO("invalid backing_id"));
 
-	err = -ENOENT;
 	fb = fuse_backing_lookup(fc, backing_id);
 	if (!fb)
-		goto out;
+		return ERR_PTR(fuse_EIO("backing not found"));
 
 	/* Allocate backing file per fuse file to store fuse path */
 	backing_file = backing_file_open(file, file->f_flags,
 					 &fb->file->f_path, fb->cred);
-	err = PTR_ERR(backing_file);
 	if (IS_ERR(backing_file)) {
 		fuse_backing_put(fb);
-		goto out;
+		return ERR_PTR(fuse_EIO("failed to open backing file (%ld)", PTR_ERR(backing_file)));
 	}
 
-	err = 0;
 	ff->passthrough = backing_file;
 	ff->cred = get_cred(fb->cred);
-out:
-	pr_debug("%s: backing_id=%d, fb=0x%p, backing_file=0x%p, err=%i\n", __func__,
-		 backing_id, fb, ff->passthrough, err);
 
-	return err ? ERR_PTR(err) : fb;
+	pr_debug("%s: backing_id=%d, fb=0x%p, backing_file=0x%p\n", __func__,
+		 backing_id, fb, ff->passthrough);
+
+	return fb;
 }
 
 void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing *fb)
-- 
2.54.0

