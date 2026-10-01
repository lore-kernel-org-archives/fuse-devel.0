Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8093A5E64
	for <fuse-devel@lists.linux.dev>; Thu,  1 Oct 2026 15:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867393; cv=none; b=kqyuwFzs7+5huVTNaHFXvhXrfkXC6XiXO+lL4WoXNwPr8eHXJpPL/+sgzLEz62dxgFUfu5PYccL4Npj9iwL/xnuXchUKCUtr0CHJRC2yt5vlvl2825P0dGIRzPbTPwSqhNj4+FRHOtYz6MptGWj1LvmbEBKKafABclCtEgr57JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867393; c=relaxed/simple;
	bh=lauhRgahkV5El7ove1hrhRJyQEgtL2ETQ6UoRn8MxaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=uPTBZT1P414v5gfOj4XrV6XFnZf8k9tRmInjIu1v36WPYvLWXP4hq9pKhYryKU8/V9V3FADDIuvE4qE0kdB9vccAGGlxUMdNICFfPRQ10vc0Bc5zpsZFnr3Y0/5MznaUrt7l25mu71XSFmgTlVRXWeezcXbX03XD2ZiUinlE/no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YL4ZR3+5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YL4ZR3+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790867390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KYJHALNBktZG4eU5yqphpRLu6S43n2MRcVkQBceoYfw=;
	b=YL4ZR3+5P8vGB0oC28IjkVSq/D/zQptMU6r5EwUvJODN0aj4yptI/ENnDzSO3JoCGFOiBJ
	cjKTIEiLn77in8cQ9CJZJQN9ksESdkMVYq5rODsdNC3yFjqbpMPlta8fA/b/+QcvEobFoH
	to0SyoRgG8UFm+o7Zljdv6N+ZMNC5Gs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-O2jKZScsOzu6_3XxpVbqnA-1; Thu, 01 Oct 2026 11:09:48 -0400
X-MC-Unique: O2jKZScsOzu6_3XxpVbqnA-1
X-Mimecast-MFC-AGG-ID: O2jKZScsOzu6_3XxpVbqnA_1790867388
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c252a2ae8e1so783733166b.1
        for <fuse-devel@lists.linux.dev>; Thu, 01 Oct 2026 08:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867387; x=1791472187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KYJHALNBktZG4eU5yqphpRLu6S43n2MRcVkQBceoYfw=;
        b=G07hhbC7T/ZtHVKXcJf5CWkScjxHBRi0vW1RFZdZA6oCD6xMUyr1EOYGK4Zn5r3Nbr
         QQzDH9C030y1VWodhI2POvXLaNC4DY4jcr3wD18JmpDiUeGJRExXop1im+Yhgy487w2R
         611hwXxK1PPFOyidaFGgYWW0DTwaUZ6zCecQ707uxZu+Zdu1ST7FJ9Mwy1savh7A1MEt
         gVUkXLaRje3pKrgnGaQn3gF+knEogN3/9SK9C114sZDbq1n9GbOL3a2k5JZ+SKc++hon
         8g58j0MPT3o7KizwPrRVX9WDeNq5r7au0FrUDMg+z0vxqAkpvi/PKgsE5PM+xB90yy++
         bGPA==
X-Gm-Message-State: AFuF++mLzS9MnIuP0ceJPPsR7zsF+ksr746YE78lyr+rr09EmnFcYzBW
	2Xr7MdJrYsQxjvEB7zS6fKdNKTnBKxnGG3j5XGTLiKaa0uUsdlYSkOxrUgBy+jqQ2jzIXljVrRd
	EN2DaalAkSqucf0O/8J9am+JgPLCcBXWNZ/0z8NxWYuXgGvywoOF5fvfXf88CxEo9nJCP2svMea
	M2OmYW2YtY6yql++vR74V1nQdtS/2cUrDoS4sDpTNcvXfRbNA=
X-Gm-Gg: AYBFou1PCh85s2S0hAv+ju+VDbe0MuKo49PHdeutgX/DP2Cacb3Dx8ylmz06hpIph76
	RGUzphSZEUbR558mPxzLDDDW//tcLA8tI6dK0/+r7S79z/ifRCMoiuTcqxHacFduad5zueckRiD
	Tn/rKJPowoT1H1OigbO/B3HlvNO6WnXP7cb1GS3/PyJZVBQ3nfVop0B1tBl/bI8yzdCNeLpTGzE
	9xr9Jw11595DFaYPEvcZ5CopSQravtIv90XzbXvFEY9YsNjVg7er+pwqCTpTBi9mHBsaymLqgCm
	0EtZ6Y7yOaqSelSlt8A18mWxjKj08v7qn73UCm3OOnjOOqHvmyzJU2JAp+iN3LesnbhY/28OuNn
	BU1TgGMUcsM6a51Oz1xDZ+lvlyxm2oIftByyOLTlABjPvBrtC1L7/jen3f14=
X-Received: by 2002:a17:906:7308:b0:c26:19de:9126 with SMTP id a640c23a62f3a-c2e23d7d8c3mr462706566b.25.1790867387578;
        Thu, 01 Oct 2026 08:09:47 -0700 (PDT)
X-Received: by 2002:a17:906:7308:b0:c26:19de:9126 with SMTP id a640c23a62f3a-c2e23d7d8c3mr462702966b.25.1790867387140;
        Thu, 01 Oct 2026 08:09:47 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (193-226-245-188.pool.digikabel.hu. [193.226.245.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d86372sm177735166b.56.2026.10.01.08.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:09:46 -0700 (PDT)
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
Subject: [PATCH v2 4/8] fuse: support opening 64 bit backing ID
Date: Thu,  1 Oct 2026 17:07:22 +0200
Message-ID: <20261001150935.655979-5-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261001150935.655979-1-mszeredi@redhat.com>
References: <20261001150935.655979-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: obwQ2Xj9hwgEo_K53W0GqfAWUKJeu4MqiNDlK07zQCY_1790867388
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
 fs/fuse/fuse_i.h          |  2 +-
 fs/fuse/iomode.c          | 34 ++++++++++++++++++++++++++++------
 fs/fuse/passthrough.c     | 28 ++++++----------------------
 include/uapi/linux/fuse.h |  2 ++
 6 files changed, 44 insertions(+), 31 deletions(-)

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
index 92976906ab05..1036c06fe35a 100644
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
index 003ef3c35d7a..59afebc3dd2b 100644
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
index 1a10bc65fb31..811ea603b776 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -160,7 +160,9 @@ static int fuse_file_passthrough_open(struct inode *inode, struct file *file)
 {
 	struct fuse_file *ff = file->private_data;
 	struct fuse_conn *fc = get_fuse_conn(inode);
+	struct fuse_open_out *outarg = &ff->args->open_outarg;
 	struct fuse_backing *fb;
+	u64 backing_id;
 	int err;
 
 	/* Check allowed conditions for file open in passthrough mode */
@@ -170,18 +172,38 @@ static int fuse_file_passthrough_open(struct inode *inode, struct file *file)
 	if (ff->open_flags & ~FOPEN_PASSTHROUGH_MASK)
 		return fuse_EIO("conflicting open flags");
 
-	fb = fuse_passthrough_open(file, ff->args->open_outarg.backing_id);
-	if (IS_ERR(fb))
-		return PTR_ERR(fb);
+	if (!fc->backing_id_64) {
+		if (outarg->backing_id_64 != 0)
+			return fuse_EIO("64 bit backing ID set");
+
+		backing_id = outarg->backing_id;
+		if (backing_id <= 0)
+			return fuse_EIO("invalid backing ID");
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
+
+	return 0;
 
+passthrough_release:
 	fuse_passthrough_release(ff, fb);
+backing_put:
 	fuse_backing_put(fb);
-
 	return err;
 }
 
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index 313c8d7ffc09..4894842ad6d0 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -150,41 +150,25 @@ ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma)
 
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
index c88d7094af44..60fb2add5e12 100644
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

