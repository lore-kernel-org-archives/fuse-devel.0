Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CC62E414
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892738; cv=none; b=SpCPY+aS/3R2n/DL4O02VltjO+LLizXEYxW6PL9CV1ks+/IEq483dB7zmhQEreCGR+/bB09wk1laIN7mylLkEfyElONs8V+/JF9Lz5HANBg0c9VGxf3vxOH7C72gS6cdG5p8N7I+WFh9H01NLt9/X/msZhP1ZlWCejfjzz+762E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892738; c=relaxed/simple;
	bh=7s7v6Q7Q18XwchqsnnBg1CXLt/ALd9UFDwaTvhxe7+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YdjL7dwsHjR5KKLcrYZATBoVYF26Fz7F+4eJTz2DWkWVy8otEo/u9JbAFqybhbPmWSEZ74HGDljxin/6xZMOEZ1UMcxb5NYbJmxzXOzGdLBu3nVtyjdMjWY88jWyhn9pB6r9iOZBDcmewTzWJL3E6S0dejZhDCVziNNopoK6qBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZBqv0xh; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZBqv0xh"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7cb345cb5bfso394977b3.0
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892736; x=1779497536; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s36eFAIzmg/AD7FCSec4sHSYl3AeGXkpY8SXdTrFSxg=;
        b=WZBqv0xhmt0vGvPCcSa/KXEmWPoKy5pTLPMgs8gXrC9IgXPXZBI24H7KdtEE3csGNC
         GDgG/8agZfxYykQlmBGeyrbF4LvPMGsgY4zkRjWVUGxeypw18IR5Zlsw+ljUBlIpJeCg
         GrQDfu7/tIl8PBMraA8stCbO6nDxwy1DFwlxRBgl4VbGXDPNdXYiqWX25Fg/4Kbu2cYc
         Ohw8kEL+qgFSDhruVANX5VOj7D21evJvou5AjlvdkjIwumqFabi6nymm9IcYpLhUS0hp
         FenjK0BVQ2glScVmU6scioPr/65KNekNUW2FAlc0GoQc3bk3SXLF+1OCPj+8Sv7gwm0M
         xJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892736; x=1779497536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s36eFAIzmg/AD7FCSec4sHSYl3AeGXkpY8SXdTrFSxg=;
        b=VaFDsh8cXFIQqCLHvf3xU2wOrS0ovj5H+1xI9xTI0xD+Dxxdyqd1yPjcOGINwWc1rw
         DW3CmwKd3K5Ts5tSf/OSpRyZAdo88Hdq80/u+YNe3s+YoPKZ7nvoVBS/ESgfABvnXeCC
         0I8Ivzg35RWiHP2ls0zVGkxfm0IKRheQ6EnU/4EgoRNZBAl+nqUKXLVGx93OOAbzdiGu
         f9u0VoYfx2AuSSAmmVz45GfS/LhvxsBqOtu3VYJX6cFQwIlUmzy+x07WM1l9XX8bh/dm
         DDIauI4c/Uc4O/EIZIzLBmYtfoilwHudlWEwGya6QtSka5+dVHrIrSYE/USfQR6TCAm8
         8srQ==
X-Gm-Message-State: AOJu0YxH7z6y5yU4/iSg2m4/AbXew7OKLeHzgdY9S7ot4R4BjjYCOaBU
	yWVjcTtcGhGjbdX2DljULXt9qaCJY4qCdylh4JxiMY76IlwXUdK2Hs+Tgi4BHGiI
X-Gm-Gg: Acq92OGgZRp21yQQc2/OJtPeX9sR3bZYiuiPvuxJWqFq2+jlEJs32y122Y8LKkKw3oa
	63PFaR7ntNz85j36TNeu3w8+8HWfTayQyjqvMLepKWxq4u5+BSNyZLtziHUwK3isDdj+tmRrJHi
	My/BhLrulp93XX5ZJceJ/3Z4K1JRQ7zDi9j+O9+JpkxkaAkewP9TCXzCMJqCwx5T8PDNEKJKz+P
	wPRtivi19IvUCA1iH3iLX7EphKDtPeyO0/epfXB5Te1rz2MMwL3DWuly4iopq0V6v//DzmB38hn
	CzyvBJqYh77A+T5IbI5RhZs/SkwV8pOwzDkMFkhnaXzRJ11M7F5RMIbnowlKqst8uOufFwmK13p
	n4JwtFwD/XIq4C31izgTgub98oqeMF2u8MY9Y9+l82PVmn2oWAQBmaG05AshhVGbaFAprD66iyI
	kGIJ6hX6KYftDYiebS89Os
X-Received: by 2002:a05:690c:6811:b0:7b3:c611:7ef5 with SMTP id 00721157ae682-7c958ecab11mr75160067b3.6.1778892736378;
        Fri, 15 May 2026 17:52:16 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:28::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f55b85edsm37657617b3.35.2026.05.15.17.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:15 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 01/21] fuse: introduce FUSE_PASSTHROUGH_INO mode
Date: Fri, 15 May 2026 17:39:44 -0700
Message-ID: <20260516004004.1455526-2-joannelkoong@gmail.com>
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

This is a more strict variant of FUSE_PASSTHROUGH mode, in which the
backing file inode number must match the fuse inode number.

This mode will allow the kernel to instantiate fuse inodes by
passthrough lookup and passthrough readdirplus and notify about those
inodes to the server, using the backing file inode number as a unique
identifier for fuse inodes across kernel and server.

This mode limits the possibility to map multiple fuse inodes to the same
backing file, unless they are all hardlinks.

This mode is only supported on 64bit arch, where ino_t is u64.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/fuse/file.c            |  3 +--
 fs/fuse/fuse_i.h          |  6 ++++--
 fs/fuse/inode.c           |  8 +++++++-
 fs/fuse/iomode.c          | 13 ++++++++++---
 include/uapi/linux/fuse.h |  6 +++++-
 5 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 7a35ac3e0023..06dc8cfe3c7b 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1429,7 +1429,6 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
 			  bool *exclusive)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
-	struct fuse_inode *fi = get_fuse_inode(inode);
 
 	*exclusive = fuse_dio_wr_exclusive_lock(iocb, from);
 	if (*exclusive) {
@@ -1444,7 +1443,7 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
 		 * have raced, so check it again.
 		 */
 		if (fuse_io_past_eof(iocb, from) ||
-		    fuse_inode_uncached_io_start(fi, NULL) != 0) {
+		    fuse_inode_uncached_io_start(inode, NULL) != 0) {
 			inode_unlock_shared(inode);
 			inode_lock(inode);
 			*exclusive = true;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 3a7ac74a23ed..0b925ac3e195 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -698,6 +698,9 @@ struct fuse_conn {
 	/** @passthrough: Passthrough support for read/write IO */
 	unsigned int passthrough:1;
 
+	/** @passthrough_ino: One-to-one mapping between fuse ino to backing ino */
+	unsigned int passthrough_ino:1;
+
 	/** @use_pages_for_kvec_io: Use pages instead of pointer for kernel I/O */
 	unsigned int use_pages_for_kvec_io:1;
 
@@ -1237,8 +1240,7 @@ int fuse_fileattr_set(struct mnt_idmap *idmap,
 
 /* iomode.c */
 int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff);
-int fuse_inode_uncached_io_start(struct fuse_inode *fi,
-				 struct fuse_backing *fb);
+int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb);
 void fuse_inode_uncached_io_end(struct fuse_inode *fi);
 
 int fuse_file_io_open(struct file *file, struct inode *inode);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 33009227e91d..b2a5892a4dc3 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1397,6 +1397,8 @@ static void process_init_reply(struct fuse_args *args, int error)
 				fc->passthrough = 1;
 				fc->max_stack_depth = arg->max_stack_depth;
 				fm->sb->s_stack_depth = arg->max_stack_depth;
+				if (flags & FUSE_PASSTHROUGH_INO)
+					fc->passthrough_ino = 1;
 			}
 			if (flags & FUSE_NO_EXPORT_SUPPORT)
 				fm->sb->s_export_op = &fuse_export_fid_operations;
@@ -1476,8 +1478,12 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 #endif
 	if (fm->fc->auto_submounts)
 		flags |= FUSE_SUBMOUNTS;
-	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
+	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH)) {
 		flags |= FUSE_PASSTHROUGH;
+		/* one-to-one ino mapping requires 64bit ino */
+		if (sizeof(ino_t) == sizeof(u64))
+			flags |= FUSE_PASSTHROUGH_INO;
+	}
 
 	/*
 	 * This is just an information flag for fuse server. No need to check
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index 3728933188f3..ca3b28597722 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -82,8 +82,10 @@ static void fuse_file_cached_io_release(struct fuse_file *ff,
 }
 
 /* Start strictly uncached io mode where cache access is not allowed */
-int fuse_inode_uncached_io_start(struct fuse_inode *fi, struct fuse_backing *fb)
+int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb)
 {
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct fuse_conn *fc = get_fuse_conn(inode);
 	struct fuse_backing *oldfb;
 	int err = 0;
 
@@ -94,6 +96,12 @@ int fuse_inode_uncached_io_start(struct fuse_inode *fi, struct fuse_backing *fb)
 		err = -EBUSY;
 		goto unlock;
 	}
+	/* With FUSE_PASSTHROUGH_INO, fuse and backing ino must match */
+	if (fb && fc->passthrough_ino &&
+	    fb->file->f_inode->i_ino != inode->i_ino) {
+		err = -EIO;
+		goto unlock;
+	}
 	if (fi->iocachectr > 0) {
 		err = -ETXTBSY;
 		goto unlock;
@@ -117,10 +125,9 @@ static int fuse_file_uncached_io_open(struct inode *inode,
 				      struct fuse_file *ff,
 				      struct fuse_backing *fb)
 {
-	struct fuse_inode *fi = get_fuse_inode(inode);
 	int err;
 
-	err = fuse_inode_uncached_io_start(fi, fb);
+	err = fuse_inode_uncached_io_start(inode, fb);
 	if (err)
 		return err;
 
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index c13e1f9a2f12..4be9ccc5b3ff 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -240,6 +240,9 @@
  *  - add FUSE_COPY_FILE_RANGE_64
  *  - add struct fuse_copy_file_range_out
  *  - add FUSE_NOTIFY_PRUNE
+ *
+ *  7.46
+ *  - add FUSE_PASSTHROUGH_INO
  */
 
 #ifndef _LINUX_FUSE_H
@@ -275,7 +278,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 45
+#define FUSE_KERNEL_MINOR_VERSION 46
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -495,6 +498,7 @@ struct fuse_file_lock {
 #define FUSE_ALLOW_IDMAP	(1ULL << 40)
 #define FUSE_OVER_IO_URING	(1ULL << 41)
 #define FUSE_REQUEST_TIMEOUT	(1ULL << 42)
+#define FUSE_PASSTHROUGH_INO	(1ULL << 43)
 
 /**
  * CUSE INIT request/reply flags
-- 
2.52.0

