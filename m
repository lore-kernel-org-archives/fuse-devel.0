Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CB84DD3BE
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163856; cv=none; b=K5tCz8V1hXZGg4VcYpVp8lX4vh3TzR68Sr2TRCjrsbhf3W6Qs5LCErSye0RSwYyX+Rp8AjkPFzZPs/QAuhjRvvGm+weAiIJTs1Q+wW9g3zx+N1FduKXoQu1Akk8A61Elnv1OYzFn+eO1nTCF1Z9LmIl4LPuYuH66j4gOoozjLZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163856; c=relaxed/simple;
	bh=3yRr0FlhocGcR7VO5WxDHOp4ZeymCFgQuDHXUjn7lDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=VX6j60V4yj04y+37OPg8mJfsdJRr52eobG+Za8ZEXTEPLAUPoPbD/qp1FrPp9hBESfQS134iG6CzCes7u5ByZE4RAZQQ7Qmn0pZcVQBUT1vvejX+ABZSsdF++sdD5Y5kKdyYsdAggIU3gSzOeg52YMfRfKv0nluD9NHLn4tGzLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VK0idEM0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VK0idEM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792163851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JgPtqRT2FMllXiypAF6AEEEcNDRi1JmQUw2pxnnLLZ8=;
	b=VK0idEM0xqwZos9dqHEAog9WHcLVGaKHi3Nlqlt8LVJwpJgmBuSm0aYA7C74ZQArKD1WyC
	cw6dvL87f5hUb9hAAIaP5UjWfghWSqO5L5EK9s+db3CnSwYkSIOJ+cVkyxal2LeV5PTGwM
	YyTCJHXGNAik8zIpOdKMBEM2PIujvRE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-r91gjY75NFeDc6r28u5-HQ-1; Fri, 16 Oct 2026 15:17:29 +0000
X-MC-Unique: r91gjY75NFeDc6r28u5-HQ-1
X-Mimecast-MFC-AGG-ID: r91gjY75NFeDc6r28u5-HQ_1792163848
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a0761224e1so811585e9.0
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 08:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163848; x=1792768648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JgPtqRT2FMllXiypAF6AEEEcNDRi1JmQUw2pxnnLLZ8=;
        b=IC8OYeKonfnkb5JEFRP66J8A2vN5gEKcEBmRv16Y8m6BFBfXee3zpCPRXJgoB2KnQx
         jckc4a9ohIGXF0CqXbaIYm4hwLBLAlEoa47miUbVIa75e+2vZc/LZd3EQleguDKh2oR0
         HwAXVBNfey+pu43NwIie+rNilHmHXqX+YKP8T8OCS29659gdtGU5qIfXIwOwDyr0Lyln
         JSB4BqpQU79BNfcejYKUtkZczPd6uxlh5xZr6xZRxYq7BBTRhclXSVsuY8A978IhaZ7Y
         HRLUexjiTOVmUUHjzknE1XxsnR++//cI7D/s4p3/oGt36JfDpLtcXQGJ6fM9IoOvExy2
         Vlvw==
X-Gm-Message-State: AFq9FYIwwmd6J88wLp/FU43CBrgxMwebA/mMZ0x3qU40RduiKjEFYm4a
	yshNgRQr65CNiIXHPU1YLdidIDHZVsvhR9bYiUaZNaGvfMD06qed5vZtRx4Su0yAn4bHpjP0/Yn
	lu7BdJDybdGIdLSU3RBxceB1sfe7L9xzBl1fnlDPkSrKzNlQAUogA7U/lf9LIbl/KZcDe4XJAjo
	Fjndz0beWDuyAej/o+ZyxrWZ0JHdzqlGIhJcdA/NEcizRY17w=
X-Gm-Gg: AYBFou1oVzAXRNdQbai5RIuQVhCkSEXkYJVSixnBf+AaI1QNrcU5ZS4+1Cxg8SZCmLS
	MlrmRe0BLBcGJjYOYoG6SWdTMJXMrSLyZaZ9A2OT46D/va2GVA8abr3ArLs0UW9ES8Li/03MeQr
	lirMdJI6LI2Pakwpw54HuD4rQ10VgWWbSbif/J8pd4861v+gw2zI65ow02lKgXyB/crtA1S0TPo
	Wa28c4DhOcybUMibWmJz5VSSyR1ap64aHaMunrOqjF+AsQ8ssL5t2jc2nELd+D9Vo5JRZSAPQqc
	XR4E1pmn7rkfDqG4nAYAYcS8y16T7hnTMeQ8QbNBtJKSiQhmymrsayT3qj9N/4UwBGY/AkOA3Iq
	rqS1zQuVzv6aG/KCiV4vJqg==
X-Received: by 2002:a05:600c:8709:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a1d75e6fa6mr2961435e9.8.1792163848425;
        Fri, 16 Oct 2026 08:17:28 -0700 (PDT)
X-Received: by 2002:a05:600c:8709:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a1d75e6fa6mr2960745e9.8.1792163847965;
        Fri, 16 Oct 2026 08:17:27 -0700 (PDT)
Received: from maszat.com (85-67-2-18.pool.digikabel.hu. [85.67.2.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de7230sm64621665e9.14.2026.10.16.08.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:17:27 -0700 (PDT)
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
Subject: [PATCH v5 05/10] fuse: support opening 64 bit backing ID
Date: Fri, 16 Oct 2026 17:16:32 +0200
Message-ID: <20261016151638.2962413-6-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016151638.2962413-1-mszeredi@redhat.com>
References: <20261016151638.2962413-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0bWDyenhlmTmuTtQ8XUSUYVOae-rLb78HOODWUojTOU_1792163848
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add backing_id_64 field to fuse_open_out to allow opening files with
64-bit server-allocated backing IDs.

If the connection was initialized with FUSE_PASSTHROUGH_V2, the kernel
reads the backing ID from open_out.backing_id_64 instead of
open_out.backing_id.

The open reply is now variable-length for backward compatibility with
servers that don't send the new backing_id_64 field.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dir.c             |  3 ++-
 fs/fuse/file.c            |  6 +++++-
 fs/fuse/fuse_i.h          |  2 +-
 fs/fuse/iomode.c          | 35 +++++++++++++++++++++++++++++------
 fs/fuse/passthrough.c     | 28 ++++++----------------------
 include/uapi/linux/fuse.h |  2 ++
 6 files changed, 45 insertions(+), 31 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 4ee40f22500e..cb3a42ac3238 100644
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
index eb04f08ac907..d6eb2bb182d1 100644
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
index c1cc79bf6ea2..9e3a6206b7a7 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1314,7 +1314,7 @@ static inline struct fuse_backing *fuse_inode_backing_set(struct fuse_inode *fi,
 #endif
 }
 
-struct fuse_backing *fuse_passthrough_open(struct file *file, int backing_id);
+int fuse_passthrough_open(struct file *file, struct fuse_backing *fb);
 void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing *fb);
 
 static inline bool fuse_is_passthrough(struct fuse_file *ff)
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index 1b8b267d0c0d..8b4774c80b11 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -165,7 +165,9 @@ static int fuse_file_passthrough_open(struct inode *inode, struct file *file)
 {
 	struct fuse_file *ff = file->private_data;
 	struct fuse_conn *fc = get_fuse_conn(inode);
+	struct fuse_open_out *outarg = &ff->args->open_outarg;
 	struct fuse_backing *fb;
+	u64 backing_id;
 	int err;
 
 	/* Check allowed conditions for file open in passthrough mode */
@@ -175,18 +177,39 @@ static int fuse_file_passthrough_open(struct inode *inode, struct file *file)
 	if (ff->open_flags & ~FOPEN_PASSTHROUGH_MASK)
 		return fuse_EIO("conflicting open flags");
 
-	fb = fuse_passthrough_open(file, ff->args->open_outarg.backing_id);
-	if (IS_ERR(fb))
-		return PTR_ERR(fb);
+	if (!fc->backing_id_64) {
+		if (outarg->backing_id_64 != 0)
+			return fuse_EIO("64 bit backing ID set");
+
+		if (outarg->backing_id <= 0)
+			return fuse_EIO("invalid backing ID");
+
+		backing_id = outarg->backing_id;
+	} else {
+		if (outarg->backing_id != 0)
+			return fuse_EIO("32 bit backing ID set");
+
+		backing_id = outarg->backing_id_64;
+	}
+	fb = fuse_backing_lookup(fc, backing_id);
+	if (!fb)
+		return fuse_EIO("backing not found");
+
+	err = fuse_passthrough_open(file, fb);
+	if (err)
+		goto backing_put;
 
 	/* First passthrough file open denies caching inode io mode */
 	err = fuse_file_uncached_io_open(inode, ff, fb);
-	if (!err)
-		return 0;
+	if (err)
+		goto passthrough_release;
 
+	return 0;
+
+passthrough_release:
 	fuse_passthrough_release(ff, fb);
+backing_put:
 	fuse_backing_put(fb);
-
 	return err;
 }
 
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index 8f53ef8945d2..9bf8ce33f549 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -163,41 +163,25 @@ int fuse_passthrough_fadvise(struct fuse_file *ff, loff_t offset, loff_t len, in
 
 /*
  * Setup passthrough to a backing file.
- *
- * Returns an fb object with elevated refcount to be stored in fuse inode.
  */
-struct fuse_backing *fuse_passthrough_open(struct file *file, int backing_id)
+int fuse_passthrough_open(struct file *file, struct fuse_backing *fb)
 {
 	struct fuse_file *ff = file->private_data;
-	struct fuse_conn *fc = ff->fm->fc;
-	struct fuse_backing *fb = NULL;
 	struct file *backing_file;
 
-	if (fc->backing_id_64)
-		return ERR_PTR(fuse_EIO("incompatible backing version"));
-
-	if (backing_id <= 0)
-		return ERR_PTR(fuse_EIO("invalid backing_id"));
-
-	fb = fuse_backing_lookup(fc, backing_id);
-	if (!fb)
-		return ERR_PTR(fuse_EIO("backing not found"));
-
 	/* Allocate backing file per fuse file to store fuse path */
 	backing_file = backing_file_open(file, file->f_flags,
 					 &fb->file->f_path, fb->cred);
-	if (IS_ERR(backing_file)) {
-		fuse_backing_put(fb);
-		return ERR_PTR(fuse_EIO("failed to open backing file (%ld)", PTR_ERR(backing_file)));
-	}
+	if (IS_ERR(backing_file))
+		return fuse_EIO("failed to open backing file (%ld)", PTR_ERR(backing_file));
 
 	ff->passthrough = backing_file;
 	ff->cred = get_cred(fb->cred);
 
-	pr_debug("%s: backing_id=%d, fb=0x%p, backing_file=0x%p\n", __func__,
-		 backing_id, fb, ff->passthrough);
+	pr_debug("%s: backing_id=%llu, fb=0x%p, backing_file=0x%p\n", __func__,
+		 fb->backing_id, fb, ff->passthrough);
 
-	return fb;
+	return 0;
 }
 
 void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing *fb)
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 37c83c54d960..90e0a9be7df0 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -254,6 +254,7 @@
  *  - add FUSE_PASSTHROUGH_V2
  *  - add FUSE_DEV_IOC_BACKING_CREATE, struct fuse_backing_create_in
  *  - add FUSE_NOTIFY_BACKING_REMOVE, struct fuse_notify_backing_remove_out
+ *  - add backing_id_64 to fuse_open_out
  */
 
 #ifndef _LINUX_FUSE_H
@@ -841,6 +842,7 @@ struct fuse_open_out {
 	uint64_t	fh;
 	uint32_t	open_flags;
 	int32_t		backing_id;
+	uint64_t	backing_id_64;
 };
 
 struct fuse_release_in {
-- 
2.54.0

