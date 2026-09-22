Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515A13909A5
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 06:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057437; cv=none; b=pxv1okJylY3Hs7XFdoJDIgMwZi7MtRlwA6krGWCN5xSAiWpBhTNAXSgEuY3xvoVQ3rx9lGV2rT1m0Z3pjQ/9zwfbpqLXP69DgJsEVaynzkz5+WTvfGZBp3qrd7UmQo4u+t4/K8Ns675z2oS9JXn/EO6427I27geSod1iRmILj5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057437; c=relaxed/simple;
	bh=Lyu0sv9zsDMo2eILo8ZT2FW2fFthTLH8k2CBCDfQA5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=teqxJ3jlem/tY47dRd3pI31vgIMvMmOTjl5UdpgdNB0R9hhp03ESpTUGrsrgzfktcz9NJOrBm/TiGyNqBFe3k49wFZqiayjEY99Lpmi+hzDebP3YhiHaus1T/4/aUZ4wliNTATNwenGBBmabr4WbkkKUmuI0NOl2/iIm2QGoYig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xuy31OHO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xuy31OHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790057435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8F3MYW7fXSGZulHNOZcx1ugoephgqDY8IB9t2ytj14=;
	b=Xuy31OHOYx8vxGV1id+03F2itedIj+Adply8LHiicaYSWadYxOavtqT5xoEbN7enAeRsyx
	sgs3RdjQ2M5kLMtmp4TB3zbfz+Na3JDtz5Zsz7yh0vYuXSaDiQtGH0rf9bugshuwzl4kxV
	6NLzYwWKD1sE4NFacmHAfRq+2OGbP18=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-JQh_IftVN7iHFLvVxd68OQ-1; Tue, 22 Sep 2026 02:10:33 -0400
X-MC-Unique: JQh_IftVN7iHFLvVxd68OQ-1
X-Mimecast-MFC-AGG-ID: JQh_IftVN7iHFLvVxd68OQ_1790057433
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c29476212f1so300845766b.1
        for <fuse-devel@lists.linux.dev>; Mon, 21 Sep 2026 23:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057433; x=1790662233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8F3MYW7fXSGZulHNOZcx1ugoephgqDY8IB9t2ytj14=;
        b=yNi0+QYjJp9gEZsLIHBdZn7CLqc5UR7BsYsceUAnpBH956HeHfqNEY84xcE7L5eaou
         iJ/PH44HyzobhoGQhR4L+J98Ba4DRt/WgRRbI1YffZLl9MBMjJebmMh1gjJuX9/Jf0QH
         CCEka9Iwj5kWRFjJ0lSHGPu4y1afIKW8087lfGoffFE5CCjZVgjK48qh5DQTs1oP07s/
         U4V5XnovI4frudFRHc+lwHhqdJcGpPc2smQlrMZr/e2SSyWNO+UMKaTE9Jd6qwq0QbGs
         m+1sGUCHU1aZ1iZBnyF8XYPIQG1KmfTgXBYdflyoT7fE1Kc/IOUUah4ZIjVG4EfFMrPV
         3xxw==
X-Gm-Message-State: AFuF++m3jCjnNhB5sM68IMVIsu4Mw1rJ2u/5gpQYtg6E44FcdGpDHvQ1
	cPxW37B+3TwQiaLOEbhe0JTUNc1LHJur1UVIL6SH5+lBu8aNJOvolJTHPsecy+fvqPqfytbpu7l
	MsUTH5RmW/YOh+0tgYCIpkwsoFQEWQKdyfCLq2inhfzCHs6ucSBFA2TOLSV91sSOZ0A2jQjiaxf
	Qfi5fdkDYCSXyT3uoNCqpeyGjks12lRQe5tsZHsyScLDvohm0=
X-Gm-Gg: AYBFou3NVoF6zdSY1cPnPCyNyJc6E8IAg77u56oJ4u2F59lWCi1sFTvlQEj0S0m1KH3
	5v168Pxe4H1ZBVdqMpR/rO7B748UbwCY7hH7UP2qsMrTVC7rNSSOJrPPLFsSn/8YQuCCFD9KO2J
	cVc0VV+mb5s8pTnbU04qa2OWtl50RQnf0zhehLqQwYCf4seQGRKf1w8Z7vXbF/Gu/JgirPQlBi8
	59vqF/nuaWajor10fW4/5O5YTHrwYXVOApEcjHZhYnDxBZhybOYsqPWdKs7x8YaNKIEKDeKfbGc
	6F8MJqeMXD7iujDBuP9Mmkw5e2HqwEL4gagtRs8+e3o2M2Muumhg9z6D6o3Fxcy15uxkJ9tDglA
	hUFUHKihiVI+r2DIdaE3Jcye10EfcDvx4BVGKoDxYJ90C0l5F2qiS
X-Received: by 2002:a05:6402:20c3:20b0:6aa:9210:262 with SMTP id 4fb4d7f45d1cf-6aa92100342mr2426552a12.22.1790057432683;
        Mon, 21 Sep 2026 23:10:32 -0700 (PDT)
X-Received: by 2002:a05:6402:20c3:20b0:6aa:9210:262 with SMTP id 4fb4d7f45d1cf-6aa92100342mr2426534a12.22.1790057432170;
        Mon, 21 Sep 2026 23:10:32 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-111.pool.digikabel.hu. [85.66.37.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440df9asm449826a12.4.2026.09.21.23.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:10:31 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>
Subject: [PATCH 05/11] fuse: add helpers for EIO return value with kernel message
Date: Tue, 22 Sep 2026 08:10:05 +0200
Message-ID: <20260922061019.3320196-6-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: n7h5ulq2YOn09Xw1-tgNEglbBU3Hh6_y3T_FATNs7to_1790057433
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Conditions are triggered by a buggy fuse server will result in -EIO which
is hard to interpret without any context.

Add helpers that print a short message to the kernel log as well as
returning the error value.  This serves a dual purpuse:

 - documents the error condition inside the code

 - allows the implementor of the fuse server to get the context for the
   error

Some debug messages are removed in favor of this.

Currently these use the pr_notice_once() variant.  Possibly should be
changed to a ratelimit of e.g. once per minute.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/fuse_i.h      |  6 ++++++
 fs/fuse/iomode.c      | 26 ++++++++------------------
 fs/fuse/passthrough.c | 16 ++++------------
 3 files changed, 18 insertions(+), 30 deletions(-)

diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 6cd556a0aa59..b698857dfe13 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -11,6 +11,12 @@
 # define pr_fmt(fmt) "fuse: " fmt
 #endif
 
+#define fuse_EIO(msg) (pr_notice_once("%s: %s\n", __func__, msg), -EIO)
+#define fuse_err_EIO(msg, err) (pr_notice_once("%s: %s (%d)\n", __func__, msg, (int) (err)), -EIO)
+
+#define fuse_ptr_EIO(msg) ERR_PTR(fuse_EIO(msg))
+#define fuse_err_ptr_EIO(msg, err) ERR_PTR(fuse_err_EIO(msg, err))
+
 #include "args.h"
 #include <linux/fuse.h>
 #include <linux/fs.h>
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index 79637c09e883..c25ac580c811 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -122,7 +122,7 @@ static int fuse_file_uncached_io_open(struct inode *inode,
 
 	err = fuse_inode_uncached_io_start(fi, fb);
 	if (err)
-		return err;
+		return fuse_err_EIO("failed to start uncached I/O", err);
 
 	WARN_ON(ff->iomode != IOM_NONE);
 	ff->iomode = IOM_UNCACHED;
@@ -173,9 +173,11 @@ static int fuse_file_passthrough_open(struct inode *inode, struct file *file)
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
@@ -212,7 +214,7 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
 	 */
 	err = -EINVAL;
 	if (fuse_inode_backing(fi) && !(ff->open_flags & FOPEN_PASSTHROUGH))
-		goto fail;
+		return fuse_EIO("FOPEN_PASSTHROUGH expected");
 
 	/*
 	 * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO.
@@ -236,20 +238,8 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
 		err = fuse_file_passthrough_open(inode, file);
 	else
 		err = fuse_file_cached_io_open(inode, ff);
-	if (err)
-		goto fail;
-
-	return 0;
 
-fail:
-	pr_debug("failed to open file in requested io mode (open_flags=0x%x, err=%i).\n",
-		 ff->open_flags, err);
-	/*
-	 * The file open mode determines the inode io mode.
-	 * Using incorrect open mode is a server mistake, which results in
-	 * user visible failure of open() with EIO error.
-	 */
-	return -EIO;
+	return err;
 }
 
 /* No more pending io and no new io possible to inode via open/mmapped file */
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index b43d3e0f7081..0e2e1066b984 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -159,34 +159,26 @@ struct fuse_backing *fuse_passthrough_open(struct file *file, int backing_id)
 	struct fuse_conn *fc = ff->fm->fc;
 	struct fuse_backing *fb = NULL;
 	struct file *backing_file;
-	int err;
 
-	err = -EINVAL;
 	if (backing_id <= 0)
-		goto out;
+		return fuse_ptr_EIO("invalid backing_id");
 
-	err = -ENOENT;
 	fb = fuse_backing_lookup(fc, backing_id);
 	if (!fb)
-		goto out;
+		return fuse_ptr_EIO("backing not found");
 
 	/* Allocate backing file per fuse file to store fuse path */
 	backing_file = backing_file_open(file, file->f_flags,
 					 &fb->file->f_path, fb->cred);
-	err = PTR_ERR(backing_file);
 	if (IS_ERR(backing_file)) {
 		fuse_backing_put(fb);
-		goto out;
+		return fuse_err_ptr_EIO("failed to open backing file", PTR_ERR(backing_file));
 	}
 
-	err = 0;
 	ff->passthrough = backing_file;
 	ff->cred = get_cred(fb->cred);
-out:
-	pr_debug("%s: backing_id=%d, fb=0x%p, backing_file=0x%p, err=%i\n", __func__,
-		 backing_id, fb, ff->passthrough, err);
 
-	return err ? ERR_PTR(err) : fb;
+	return fb;
 }
 
 void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing *fb)
-- 
2.54.0

