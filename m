Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5144D4A64E6
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 06:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057447; cv=none; b=UXcaG1b7GsHSY+iXViX+o0TwTMjj3mScpRwt2UdXnoDX4+SKIvGdTBKwCILBxqfffewNOWfNPUQu3KP2L1/4Rq7zjfaNiRjo1wcP3PH55/MvGHc2DkLbBTB83Buio9Usf+V6hFqhl5jOeIf/531Q4918+gca/VnHKLhZhPSasIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057447; c=relaxed/simple;
	bh=6TQWyTmF8TUEJjj3ICPwL6iBl03hyPp3Yzi8yhAdrHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Yqx8JgVeHfD5KT+5XvkPP2B4+XnFwX5yAUWiev2ZcFahR3b2z5GTfd1oyG99sBp5TqiyO5GQxXOBy/qHQVOU3SSVHQclGptlCyNU+UdFr6y4tUFWVTBB2p1kJLB6t+PVBd7CWRSAisuZshl8CSn1A3VOLEverOzMZakvmJVfOuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SsrX5Idu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SsrX5Idu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790057442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8GR1gax0q53VCAJae0T1Kyum+iY2jM0oRNYyH/dXAo8=;
	b=SsrX5IduOo1+fkcPHwIlDz+OLecb2PjGAMR5gDY1DK5zTNasC4rVA36Y5sAcIdBhy4NXKm
	geTqBHfcStLuAhZjGDx2QdHPu2VxZMpAywljoc5XCBTWk52ywlzMPa1diK2amviIEv/rdJ
	fKZ1p8mg8S2EIARM6l2GGvLdUlzdA90=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-Hb9oygthOXaOLoG5oObf9w-1; Tue, 22 Sep 2026 02:10:40 -0400
X-MC-Unique: Hb9oygthOXaOLoG5oObf9w-1
X-Mimecast-MFC-AGG-ID: Hb9oygthOXaOLoG5oObf9w_1790057436
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6aaa4535b3bso210148a12.3
        for <fuse-devel@lists.linux.dev>; Mon, 21 Sep 2026 23:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057436; x=1790662236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GR1gax0q53VCAJae0T1Kyum+iY2jM0oRNYyH/dXAo8=;
        b=UzTiV1ADUwb8LbuN6zPXsc9WIK/ZdmxnCccBluJkebIT9y9b6v1y9qMjNfimUjm81w
         f6KZrDDdYeBUjzgzoBuGjlDbhwLKsLXdlJay8Qbs7A2esv/zJwLPVCzej81zTh9PtyKJ
         FLavmanEpAH2um3gPbrjGwDBynpukchDk6ZRkI9W6fTZmKKQeSrmiodP0G+VhbI8MZqm
         jNwKPADuNzE8yMP7ckF7c/2rqUfVJP0EADLGMjcFvZ71m8NoDDd4RYvjmlU1Um4kNq+k
         1YHG9bEeDVJh1Mc1BlP2pTj5Y42FxxiX0cVhrdH85QktcTj2Cp5lrWT6XkgU2RzthLyv
         w4fA==
X-Gm-Message-State: AFuF++ngT4AhIt0XJ6fpsN0E33HyDjA63LiUo1jFGq8d6scs7MHvFUC+
	kmV6dCc3ucUY51NockUGSnCN5pPMQUq5w4gqZX2Fm9mS3bY73wANmoynQmbGjSTewa2uuftABg1
	IDvsjQb6TJmMOGngO+OLDBvivywetngTd3OpVhaixlVEQz3gMiJ/VnXUWCk1iLwyQoNeHesJ5ZU
	Jt2J09tMSZS7IU28sckuFlVXy22lIsdxeb3ZzX6KWR/A7xO14=
X-Gm-Gg: AYBFou29lk/N0YYa+NcZsJ6zrJpptjVcMqrFL3KnJUBHRBjgyoyPkkJXJrnPfut4W5i
	NhW9BI9TQnJP3vsYq5fuueGDU/zH8lA62b8wx09j6QZJAlzCnkMSb6moBt/xfcittGbR3cy2t2t
	se6pr7P+acPR0puOxml07KhDreQ7uRuoZpvaCjycUZ5KZSafvPyJUeuomK5X3Q7eNtdwVK+8AAQ
	WQzgzdm9HDiKSz0LdXTGNXsUZTp/PCbBJDscSOSLzqQpkSOr7IuIEPOEJ7KBucRa2V/qLU2ogwa
	HpyIXuprcH0DUiITCa46aGjMTA6FTMLruIkJZsc5cTYSuuXTwOQ2uEuc4oIOd3LTb+4RN8/Dxep
	D5wWDOK2xJQyFu6oB5glt57WfT12B509MVMzKPoBt5Jm82SEE6Qz7
X-Received: by 2002:a05:6402:44d1:b0:6a9:864c:9d94 with SMTP id 4fb4d7f45d1cf-6aa5478c375mr8418494a12.28.1790057436159;
        Mon, 21 Sep 2026 23:10:36 -0700 (PDT)
X-Received: by 2002:a05:6402:44d1:b0:6a9:864c:9d94 with SMTP id 4fb4d7f45d1cf-6aa5478c375mr8418476a12.28.1790057435685;
        Mon, 21 Sep 2026 23:10:35 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-111.pool.digikabel.hu. [85.66.37.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440df9asm449826a12.4.2026.09.21.23.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:10:33 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>
Subject: [PATCH 07/11] fuse: support opening 64 bit backing ID
Date: Tue, 22 Sep 2026 08:10:07 +0200
Message-ID: <20260922061019.3320196-8-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922061019.3320196-1-mszeredi@redhat.com>
References: <20260922061019.3320196-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ohV4omC_WaQJafXfUZWfu1981RuJ9_OFfPnui6QYnww_1790057436
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add backing_id_64 field to fuse_open_out to allow opening files with
64-bit server-allocated backing IDs.

When the server sets FUSE_BACKING_ID_64 in open_out.open_flags, the
kernel reads the backing ID from open_out.backing_id_64 instead of
open_out.backing_id.

The open reply is now variable-length for backward compatibility with
servers that don't send the new backing_id_64 field.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dir.c             |  3 ++-
 fs/fuse/file.c            |  6 +++++-
 fs/fuse/fuse_i.h          |  4 ++--
 fs/fuse/iomode.c          | 11 ++++++++++-
 fs/fuse/passthrough.c     |  6 +++---
 include/uapi/linux/fuse.h |  4 ++++
 6 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index f48fafccce4b..874ec7cfffb1 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -876,6 +876,7 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	args.out_args[0].value = &outentry;
 	/* Store outarg for fuse_finish_open() */
 	outopenp = &ff->args->open_outarg;
+	args.out_argvar = true; /* compat */
 	args.out_args[1].size = sizeof(*outopenp);
 	args.out_args[1].value = outopenp;
 
@@ -885,7 +886,7 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 
 	err = fuse_simple_idmap_request(idmap, fm, &args);
 	free_ext_value(&args);
-	if (err)
+	if (err < 0)
 		goto out_free_ff;
 
 	err = -EIO;
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index af26de78a199..8643d9a290ac 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -28,6 +28,7 @@ static int fuse_send_open(struct fuse_mount *fm, u64 nodeid,
 {
 	struct fuse_open_in inarg;
 	FUSE_ARGS(args);
+	int res;
 
 	memset(&inarg, 0, sizeof(inarg));
 	inarg.flags = open_flags & ~(O_CREAT | O_EXCL | O_NOCTTY);
@@ -45,10 +46,13 @@ static int fuse_send_open(struct fuse_mount *fm, u64 nodeid,
 	args.in_args[0].size = sizeof(inarg);
 	args.in_args[0].value = &inarg;
 	args.out_numargs = 1;
+	args.out_argvar = true; /* compat */
 	args.out_args[0].size = sizeof(*outargp);
 	args.out_args[0].value = outargp;
 
-	return fuse_simple_request(fm, &args);
+	res = fuse_simple_request(fm, &args);
+
+	return res < 0 ? res : 0;
 }
 
 struct fuse_file *fuse_file_alloc(struct fuse_mount *fm, bool release)
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 75c7997098c1..d36459487bee 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -28,7 +28,7 @@
 #include <linux/backing-dev.h>
 #include <linux/mutex.h>
 #include <linux/rwsem.h>
-#include <linux/rbtree_types.h>
+#include <linux/rbtree.h>
 #include <linux/poll.h>
 #include <linux/workqueue.h>
 #include <linux/kref.h>
@@ -1312,7 +1312,7 @@ static inline struct fuse_backing *fuse_inode_backing_set(struct fuse_inode *fi,
 #endif
 }
 
-struct fuse_backing *fuse_passthrough_open(struct file *file, int backing_id);
+struct fuse_backing *fuse_passthrough_open(struct file *file, u64 backing_id, bool is_64bit);
 void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing *fb);
 
 static inline bool fuse_is_passthrough(struct fuse_file *ff)
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index c25ac580c811..53b0c2a32ed9 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -170,8 +170,12 @@ static int fuse_file_passthrough_open(struct inode *inode, struct file *file)
 	struct fuse_file *ff = file->private_data;
 	struct fuse_conn *fc = get_fuse_conn(inode);
 	struct fuse_backing *fb;
+	u64 backing_id;
+	bool is_64bit = ff->open_flags & FUSE_BACKING_ID_64;
 	int err;
 
+	ff->open_flags &= ~FUSE_BACKING_ID_64;
+
 	/* Check allowed conditions for file open in passthrough mode */
 	if (!IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) || !fc->passthrough)
 		return fuse_EIO("passthrough not enabled");
@@ -179,7 +183,12 @@ static int fuse_file_passthrough_open(struct inode *inode, struct file *file)
 	if (ff->open_flags & ~FOPEN_PASSTHROUGH_MASK)
 		return fuse_EIO("conflicting open flags");
 
-	fb = fuse_passthrough_open(file, ff->args->open_outarg.backing_id);
+	if (!is_64bit)
+		backing_id = ff->args->open_outarg.backing_id;
+	else
+		backing_id = ff->args->open_outarg.backing_id_64;
+
+	fb = fuse_passthrough_open(file, backing_id, is_64bit);
 	if (IS_ERR(fb))
 		return PTR_ERR(fb);
 
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index 56314dea0b5f..49cae366180d 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -153,17 +153,17 @@ ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma)
  *
  * Returns an fb object with elevated refcount to be stored in fuse inode.
  */
-struct fuse_backing *fuse_passthrough_open(struct file *file, int backing_id)
+struct fuse_backing *fuse_passthrough_open(struct file *file, u64 backing_id, bool is_64bit)
 {
 	struct fuse_file *ff = file->private_data;
 	struct fuse_conn *fc = ff->fm->fc;
 	struct fuse_backing *fb = NULL;
 	struct file *backing_file;
 
-	if (backing_id <= 0)
+	if (!is_64bit && (backing_id == 0 || backing_id > INT_MAX))
 		return fuse_ptr_EIO("invalid backing_id");
 
-	fb = fuse_backing_lookup(fc, backing_id, false);
+	fb = fuse_backing_lookup(fc, backing_id, is_64bit);
 	if (!fb)
 		return fuse_ptr_EIO("backing not found");
 
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index f271faa60424..30ec8c124c74 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -253,6 +253,7 @@
  *  - add FUSE_HAS_SYNCFS opt-in flag for privileged userspace servers
  *  - add FUSE_NOTIFY_BACKING_CLOSE
  *  - add struct fuse_notify_backing_close_out
+ *  - add backing_id_64 to fuse_open_out
  *  - add backing_id to fuse_backing_map
  *  - add FUSE_BACKING_ID_64 (multiple structs)
  */
@@ -404,6 +405,7 @@ struct fuse_file_lock {
  *                           (FUSE_URING_ZERO_COPY) and the request carries page
  *                           payload. Otherwise reads/writes fall back to
  *                           copying.
+ * FUSE_BACKING_ID_64: backing ID is server allocated, stored in open_out.backing_id_64
  */
 #define FOPEN_DIRECT_IO		(1 << 0)
 #define FOPEN_KEEP_CACHE	(1 << 1)
@@ -414,6 +416,7 @@ struct fuse_file_lock {
 #define FOPEN_PARALLEL_DIRECT_WRITES	(1 << 6)
 #define FOPEN_PASSTHROUGH	(1 << 7)
 #define FOPEN_IO_URING_ZERO_COPY (1 << 8)
+#define FUSE_BACKING_ID_64	(1 << 30) /* used in multiple structs */
 
 /**
  * INIT request/reply flags
@@ -840,6 +843,7 @@ struct fuse_open_out {
 	uint64_t	fh;
 	uint32_t	open_flags;
 	int32_t		backing_id;
+	uint64_t	backing_id_64;
 };
 
 struct fuse_release_in {
-- 
2.54.0

