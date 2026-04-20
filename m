Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088C23876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723513; cv=none; b=jV65YNi46JW2jlDgRhWJ4zRznzwjO3zIGLEzKyDDEgiTKcsWxAvQpNv7RtiEAKVDc+YvjFYZeABu5I9G6RRV5ZCBrRggKMSjJlViG+jcjjLxXYc/nO8p76EnxnqJe1joHsETi5zj5H9RyA5QmprmrSbLEpepRe9sJQs8OEUuuhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723513; c=relaxed/simple;
	bh=P2d8t3V0hEkHS4jgBQEyFaS8/423sYO5l04yE9eKZ9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpG1lEzn8pW1Y/TISDX6IahGYqve1tAhttO3ZbBXxNt++TAxVnBLfSVJi3X4UDARNtsEDXlsMwK8iwlPyv5Fc9PGpm/FaF/L7Yrzv4Ubk5OtWgsvn4/kmaVH6TnQBqKlD5W7ujd0J9Mu3a6A7gdoO07ojdcLHgUmhrszYV655PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4vESI6S; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4vESI6S"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35691a231a7so2351987a91.3
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723511; x=1777328311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxYtTltVzbjYAIUBAVOR+xsKkJTsXW2uaXPT4JdiVag=;
        b=X4vESI6S4uEY5/9ET2qKFy0Ur8B4pAEnypu21RTzllvgeJmb9kWz0LQBoiXIdI8kSN
         ThBT5ZyqDX0QdI3wZ2BgR7p+Llj6n4pFQqsa7NQxqeP8luUTJT9PvEdJfZObKBKqOOZ9
         sVuUyM8RsOX7GW4Qp33wSNURxWp018T/gZamYUkJt2c99MAZrf6hTfjOVXZxK86lRii1
         PP69fjT9gyQT9VKEI5Vn5jAIeT8msBJeksK2PEMFNNUi2Lpn3m8wuRcjOKemYEF5gvxZ
         AGXA2HHz5A3KWEx4ME/LY0zA6RUnWCykoohWEJj9H9HdPKb+fMUU8Iztkk9sze/l3fjx
         M+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723511; x=1777328311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HxYtTltVzbjYAIUBAVOR+xsKkJTsXW2uaXPT4JdiVag=;
        b=qNmsEgHJ/wkXMotv5Z3Y2PIYbkiV5dOBya8xleu0mWNUKNNpGISQgkBcMW5XmAfdYv
         klK0DeWtOZv5Z6iAe3dZc6DuihChHqmG8BY20F1tjE2nrPiSpybewFUVSqunw+/eKSXa
         Zs9uE9z1cAQx5Pd5W4+S5ZengQEBnA4UwumJ8eaCgIVwena3NiVtloYMc0txP2O4VkK6
         C67DYmF6Zs3X5SirTXeMUQ3Bt5zUIjP0hVtgyi9ntfEYPDGoXX6vq/1NUFONXTjDx/pv
         jtOrYCccRI1serLC/aPI/+9DUdyEZLzb12/jxSxBG1IE4tv3Lcq6Hx2aOeyLirz22rz9
         svNg==
X-Forwarded-Encrypted: i=1; AFNElJ/CIMZ0fr+dM/Vu5kBR2TQuFVd+49r3ROCYwL6TCH5F6MlAc2/tdjggFklCMBKbRtBRM/ypZ9SMD939@lists.linux.dev
X-Gm-Message-State: AOJu0YxwM5ZAE3jjZC+x74WJpwHlAZf03mC3IdGzWBysRuFkUx5sf9EW
	BlIg20xfU4Q2oZIfMUhvzqS//3ctJNccqJoKg7s4OEfMQ0B7kgffvUb5
X-Gm-Gg: AeBDiev2lCF8rX70zTdyoTMlHxbQjSOBIUJ157hTX/9+S8YiLoL/UcDI67o4m8Sy/Xl
	SVpplJKvjFkFh58QorBuIjaZTEhTDDVGJN1wIpNyIa+Al42nLSSeIhUP1M1kG7R4IMJm0EvnpH7
	qCegOotztV+YrMfblK42JmGDQGwgSBUFV812+sf1oFp3XcX4+XAbxnbkhWpiYJesjsm9ZptpDG7
	kADNN9Wb8zbVr8GRMGir22lS/8zPbSSlmcQegWQg5rhnGSgstvSYT00PbWfwQCH0gu5qGGFqZFN
	nnRFI/2PVf9Db4jgTYeBd3B2ab8YvEIFVESqCgWCIiXfw364LAjD4xUx7DqkdEDT+9Ps2Y0+gLf
	vL17pp8KJ8vVdcvQucCQwcnBS3Ntc65oNwQWim+diW6rzpybiQ2hTNL6/4CrBpnLkqVA7/N8zht
	yHEtbJQZGDINiEQA7U8wWXK7fs+/iR
X-Received: by 2002:a17:90b:6cd:b0:35d:ac4d:3cb6 with SMTP id 98e67ed59e1d1-361403b790dmr15225409a91.5.1776723511346;
        Mon, 20 Apr 2026 15:18:31 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:47::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614198f775sm13267301a91.16.2026.04.20.15.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:30 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 01/17] fuse: introduce FUSE_PASSTHROUGH_INO mode
Date: Mon, 20 Apr 2026 15:16:21 -0700
Message-ID: <20260420221637.2631478-2-joannelkoong@gmail.com>
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
index 7294bd347412..f239c8a888cb 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1431,7 +1431,6 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
 			  bool *exclusive)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
-	struct fuse_inode *fi = get_fuse_inode(inode);
 
 	*exclusive = fuse_dio_wr_exclusive_lock(iocb, from);
 	if (*exclusive) {
@@ -1446,7 +1445,7 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
 		 * have raced, so check it again.
 		 */
 		if (fuse_io_past_eof(iocb, from) ||
-		    fuse_inode_uncached_io_start(fi, NULL) != 0) {
+		    fuse_inode_uncached_io_start(inode, NULL) != 0) {
 			inode_unlock_shared(inode);
 			inode_lock(inode);
 			*exclusive = true;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 23a241f18623..86fdf873d639 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -913,6 +913,9 @@ struct fuse_conn {
 	/** Passthrough support for read/write IO */
 	unsigned int passthrough:1;
 
+	/** One-to-one mapping between fuse ino to backing ino */
+	unsigned int passthrough_ino:1;
+
 	/* Use pages instead of pointer for kernel I/O */
 	unsigned int use_pages_for_kvec_io:1;
 
@@ -1535,8 +1538,7 @@ int fuse_fileattr_set(struct mnt_idmap *idmap,
 
 /* iomode.c */
 int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff);
-int fuse_inode_uncached_io_start(struct fuse_inode *fi,
-				 struct fuse_backing *fb);
+int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb);
 void fuse_inode_uncached_io_end(struct fuse_inode *fi);
 
 int fuse_file_io_open(struct file *file, struct inode *inode);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 8b64034ab0bb..014b9af42909 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1445,6 +1445,8 @@ static void process_init_reply(struct fuse_mount *fm, struct fuse_args *args,
 				fc->passthrough = 1;
 				fc->max_stack_depth = arg->max_stack_depth;
 				fm->sb->s_stack_depth = arg->max_stack_depth;
+				if (flags & FUSE_PASSTHROUGH_INO)
+					fc->passthrough_ino = 1;
 			}
 			if (flags & FUSE_NO_EXPORT_SUPPORT)
 				fm->sb->s_export_op = &fuse_export_fid_operations;
@@ -1518,8 +1520,12 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
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

