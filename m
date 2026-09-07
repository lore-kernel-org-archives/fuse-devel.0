Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D26372058;
	Mon,  7 Sep 2026 06:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761113; cv=none; b=HFMNa9N2ymYhrw94PkKm8f3gnXwYN++HQM6v406O7Fq/1cYIvJAQW2Kdlt1g5plkDiWz1uNVAs1r5QC14vubNURLsh2uoQnMcXEGZ6E9klB9AFklpx5SAaSPMiYkScuovjZKc5hDz/1BANMCoUog3a48y5RBuwk2TTHX+44nZ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761113; c=relaxed/simple;
	bh=9orKWGEZ9lUfHOz13R0MuutwxAutMIr1x5Q16KvOFUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uv94JWmr5ryk7r2Q73I8PbYBzPzD5pSe3/rr5hIxPyNeSTT4B8pGzssf3cWRUyzSLp8mWfw+E/yeMSLeOXxKPspSY1UiL+SRAZ+ogeNEdAJLBo1q5k2fkBQkcpWCJwvS+tNbn/qCzKELLUiKLu3KRyeNWATG3SdFIh4pFd37XLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uLuJh3xm; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uLuJh3xm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=OjJ0lPhuwDWz0mKBuGHCQwKRNSMrXhJq6rQPeivDlJA=; b=uLuJh3xmld+g5DnD/lguXv+MmA
	DQGM+RLAEeyzf0mPXY6HuyN2Yrf9nDASl7ytJJFluOGvAvLOLQuEJxhljz1xUI3g1Z0rrbKSHD3Ht
	Dz+cROgn+FbHF58bUyEdMXE9SNFf/CcNgRijVJSZ9+9/QnxhWRnX/2iABNucnbzYzZh6SisSwvcqO
	hAQzwVF4dsEtYy92hwZmbxs5YAlZ3DKiuPcVUv7BoqZdcKkpYk+TtKU66qWSk9rYOEk/54jZyiFVm
	vVJdQQwg8GbU4ZyLjzI7qQHd2BW0nkLn2WWDO+u32wF6k3HAh/Fuc2oVHR0QeZ4MLfVQqssSszZOU
	iwgrn1LA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3STc-00000005zMf-3PBa;
	Mon, 07 Sep 2026 06:05:09 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Bernd Schubert <bernd@bsbernd.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	fuse-devel@lists.linux.dev
Subject: [PATCH] fuse: repair lots of uapi kernel-doc
Date: Sun,  6 Sep 2026 23:05:07 -0700
Message-ID: <20260907060507.2582993-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix all (24) kernel-doc warnings in <uapi/linux/fuse.h>:
- modify some instances to use common C comment style instead of
  kernel-doc
- convert a few instances to use kernel-doc format

The warnings are all of this form (list is truncated for brevity):

Warning: include/uapi/linux/fuse.h:370 This comment starts with '/**', but isn't a kernel-doc comment.
 * Bitmasks for fuse_setattr_in.valid
Warning: include/uapi/linux/fuse.h:386 This comment starts with '/**', but isn't a kernel-doc comment.
 * Flags returned by the OPEN request
Warning: include/uapi/linux/fuse.h:414 This comment starts with '/**', but isn't a kernel-doc comment.
 * INIT request/reply flags
Warning: include/uapi/linux/fuse.h:526 This comment starts with '/**', but isn't a kernel-doc comment.
 * CUSE INIT request/reply flags
Warning: include/uapi/linux/fuse.h:630 This comment starts with '/**', but isn't a kernel-doc comment.
 * extension type
Warning: include/uapi/linux/fuse.h:1307 This comment starts with '/**', but isn't a kernel-doc comment.
 * Header for all fuse-io-uring requests
Warning: include/uapi/linux/fuse.h:1320 This comment starts with '/**', but isn't a kernel-doc comment.
 * sqe commands to the kernel

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>
Cc: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev

 include/uapi/linux/fuse.h |   82 +++++++++++++++++++++---------------
 1 file changed, 50 insertions(+), 32 deletions(-)

--- linux-next-20260904.orig/include/uapi/linux/fuse.h
+++ linux-next-20260904/include/uapi/linux/fuse.h
@@ -367,7 +367,7 @@ struct fuse_file_lock {
 	uint32_t	pid; /* tgid */
 };
 
-/**
+/*
  * Bitmasks for fuse_setattr_in.valid
  */
 #define FATTR_MODE	(1 << 0)
@@ -383,7 +383,7 @@ struct fuse_file_lock {
 #define FATTR_CTIME	(1 << 10)
 #define FATTR_KILL_SUIDGID	(1 << 11)
 
-/**
+/*
  * Flags returned by the OPEN request
  *
  * FOPEN_DIRECT_IO: bypass page cache for this open file
@@ -411,7 +411,7 @@ struct fuse_file_lock {
 #define FOPEN_PASSTHROUGH	(1 << 7)
 #define FOPEN_IO_URING_ZERO_COPY (1 << 8)
 
-/**
+/*
  * INIT request/reply flags
  *
  * FUSE_ASYNC_READ: asynchronous read requests
@@ -523,30 +523,30 @@ struct fuse_file_lock {
 #define FUSE_HAS_IO_URING_BUFPOOL (1ULL << 43)
 #define FUSE_HAS_SYNCFS		(1ULL << 44)
 
-/**
+/*
  * CUSE INIT request/reply flags
  *
  * CUSE_UNRESTRICTED_IOCTL:  use unrestricted ioctl
  */
 #define CUSE_UNRESTRICTED_IOCTL	(1 << 0)
 
-/**
+/*
  * Release flags
  */
 #define FUSE_RELEASE_FLUSH	(1 << 0)
 #define FUSE_RELEASE_FLOCK_UNLOCK	(1 << 1)
 
-/**
+/*
  * Getattr flags
  */
 #define FUSE_GETATTR_FH		(1 << 0)
 
-/**
+/*
  * Lock flags
  */
 #define FUSE_LK_FLOCK		(1 << 0)
 
-/**
+/*
  * WRITE flags
  *
  * FUSE_WRITE_CACHE: delayed write from page cache, file handle is guessed
@@ -560,12 +560,12 @@ struct fuse_file_lock {
 /* Obsolete alias; this flag implies killing suid/sgid only. */
 #define FUSE_WRITE_KILL_PRIV	FUSE_WRITE_KILL_SUIDGID
 
-/**
+/*
  * Read flags
  */
 #define FUSE_READ_LOCKOWNER	(1 << 1)
 
-/**
+/*
  * Ioctl flags
  *
  * FUSE_IOCTL_COMPAT: 32bit compat ioctl on 64bit machine
@@ -586,21 +586,21 @@ struct fuse_file_lock {
 
 #define FUSE_IOCTL_MAX_IOV	256
 
-/**
+/*
  * Poll flags
  *
  * FUSE_POLL_SCHEDULE_NOTIFY: request poll notify
  */
 #define FUSE_POLL_SCHEDULE_NOTIFY (1 << 0)
 
-/**
+/*
  * Fsync flags
  *
  * FUSE_FSYNC_FDATASYNC: Sync data only, not metadata
  */
 #define FUSE_FSYNC_FDATASYNC	(1 << 0)
 
-/**
+/*
  * fuse_attr flags
  *
  * FUSE_ATTR_SUBMOUNT: Object is a submount root
@@ -609,28 +609,28 @@ struct fuse_file_lock {
 #define FUSE_ATTR_SUBMOUNT      (1 << 0)
 #define FUSE_ATTR_DAX		(1 << 1)
 
-/**
+/*
  * Open flags
  * FUSE_OPEN_KILL_SUIDGID: Kill suid and sgid if executable
  */
 #define FUSE_OPEN_KILL_SUIDGID	(1 << 0)
 
-/**
+/*
  * setxattr flags
  * FUSE_SETXATTR_ACL_KILL_SGID: Clear SGID when system.posix_acl_access is set
  */
 #define FUSE_SETXATTR_ACL_KILL_SGID	(1 << 0)
 
-/**
+/*
  * notify_inval_entry flags
  * FUSE_EXPIRE_ONLY
  */
 #define FUSE_EXPIRE_ONLY		(1 << 0)
 
 /**
- * extension type
- * FUSE_MAX_NR_SECCTX: maximum value of &fuse_secctx_header.nr_secctx
- * FUSE_EXT_GROUPS: &fuse_supp_groups extension
+ * enum fuse_ext_type - extension type
+ * @FUSE_MAX_NR_SECCTX: maximum value of &fuse_secctx_header.nr_secctx
+ * @FUSE_EXT_GROUPS: &fuse_supp_groups extension
  */
 enum fuse_ext_type {
 	/* Types 0..31 are reserved for fuse_secctx_header */
@@ -1036,14 +1036,14 @@ struct fuse_fallocate_in {
 };
 
 /**
- * FUSE request unique ID flag
+ * define FUSE_UNIQUE_RESEND - FUSE request unique ID flag
  *
  * Indicates whether this is a resend request. The receiver should handle this
  * request accordingly.
  */
 #define FUSE_UNIQUE_RESEND (1ULL << 63)
 
-/**
+/*
  * This value will be set by the kernel to
  * (struct fuse_in_header).{uid,gid} fields in
  * case when:
@@ -1273,12 +1273,12 @@ struct fuse_supp_groups {
 };
 
 /**
- * Size of the ring buffer header
+ * define FUSE_URING_IN_OUT_HEADER_SZ - Size of the ring buffer header
  */
 #define FUSE_URING_IN_OUT_HEADER_SZ 128
 #define FUSE_URING_OP_IN_OUT_SZ 128
 
-/**
+/*
  * fuse_uring_ent_in_out flags
  *
  * FUSE_URING_ENT_ZERO_COPY: Set if the ent's payload is zero-copied
@@ -1305,34 +1305,52 @@ struct fuse_uring_ent_in_out {
 };
 
 /**
- * Header for all fuse-io-uring requests
+ * struct fuse_uring_req_header - Header for all fuse-io-uring requests
  */
 struct fuse_uring_req_header {
-	/* struct fuse_in_header / struct fuse_out_header */
+	/**
+	 * @in_out: struct fuse_in_header / struct fuse_out_header
+	 */
 	char in_out[FUSE_URING_IN_OUT_HEADER_SZ];
 
-	/* per op code header */
+	/**
+	 * @op_in: per op code header
+	 */
 	char op_in[FUSE_URING_OP_IN_OUT_SZ];
 
+	/**
+	 * @ring_ent_in_out: TBD
+	 */
 	struct fuse_uring_ent_in_out ring_ent_in_out;
 };
 
 /**
- * sqe commands to the kernel
+ * enum fuse_uring_cmd - sqe commands to the kernel
  */
 enum fuse_uring_cmd {
+	/** @FUSE_IO_URING_CMD_INVALID: invalid command value */
 	FUSE_IO_URING_CMD_INVALID = 0,
 
-	/* register the request buffer and fetch a fuse request */
+	/**
+	 * @FUSE_IO_URING_CMD_REGISTER: register the request buffer and
+	 * fetch a fuse request
+	 */
 	FUSE_IO_URING_CMD_REGISTER = 1,
 
-	/* commit fuse request result and fetch next request */
+	/**
+	 * @FUSE_IO_URING_CMD_COMMIT_AND_FETCH: commit fuse request result
+	 * and fetch next request
+	 */
 	FUSE_IO_URING_CMD_COMMIT_AND_FETCH = 2,
 
-	/* add a queue */
+	/**
+	 * @FUSE_IO_URING_CMD_ADD_QUEUE: add a queue
+	 */
 	FUSE_IO_URING_CMD_ADD_QUEUE = 3,
 
-	/* add a bufpool to a queue */
+	/**
+	 * @FUSE_IO_URING_CMD_ADD_BUFPOOL: add a bufpool to a queue
+	 */
 	FUSE_IO_URING_CMD_ADD_BUFPOOL = 4,
 };
 
@@ -1344,7 +1362,7 @@ enum fuse_uring_cmd {
  */
 #define FUSE_URING_ZERO_COPY		(1 << 0)
 
-/**
+/*
  * In the 80B command area of the SQE.
  */
 struct fuse_uring_cmd_req {
