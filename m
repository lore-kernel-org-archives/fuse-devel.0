Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CA747C106
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 06:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057434; cv=none; b=dTt730KbhigE9y4PWryDY41KaxKAs+DvHse8W+N+BaSEzISb2RdInST/fhsXAiKT99qBNzsqJL3fz7L7W7Ed3NYLdXn6NOslywG92evaElgGmCh8FXnJO8BOHgBxSnGcBj6Zl2rGwWrTRVBQl22jJlHaom90urgs/kkocz9DyPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057434; c=relaxed/simple;
	bh=8unU//Y9Zf8zZF3VeQGgS4GC9mNDrqgDPxOBqFcBiNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=i/rDd5xskYYYbeqx+1pN4MnDpc3X9zLfCE0e09uYlRYxEqqaHLpf2ksGDuwtBrbQOucAZBjFTP/y4Bq3I/Pne8q308rk6UHwg3xkn6KBQDBY+Z7G94phkLVmKjqcLTv7leoGKu5poARDDTHtS3u4kPQWS8fBe0Kgw3ZEzeMhmrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XCblm8nD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XCblm8nD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790057432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/QigkUKcjK0+4AYBdVkpUJcAtRH7ea7fIST2FTQTMs=;
	b=XCblm8nD+TASSFlx2uq+PQUvpGGIjP9tZDN6NpchYvGe9jZUIcxUZrjf/YiSOLU0tPGmEj
	4l9Iqn82dCJM8Bfy7BlFcIcjk9tsICJC9ksrAtx5eJkAq4F770eXJQYQMehxaCfyU4GSZT
	SGElpEmsQPLuQfjVRU7SJ6KBwAARfG0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-i8PDxd2XOd6b4bm03Ct1Bg-1; Tue, 22 Sep 2026 02:10:30 -0400
X-MC-Unique: i8PDxd2XOd6b4bm03Ct1Bg-1
X-Mimecast-MFC-AGG-ID: i8PDxd2XOd6b4bm03Ct1Bg_1790057430
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a9b4e3987aso4553210a12.3
        for <fuse-devel@lists.linux.dev>; Mon, 21 Sep 2026 23:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057430; x=1790662230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/QigkUKcjK0+4AYBdVkpUJcAtRH7ea7fIST2FTQTMs=;
        b=EYmfgIFOxSY8OgX36DEaQaLXkUsJ5ut7rnw7eGjQpnHRrNU5bp2eOp957cM/IrKh0J
         ryc6cOiI1oO6K9fce8BBE7Lu75bJPeSdPuGpLPf6iXHL6Oee4oVA1GdXq3NdgPYIM8i/
         fj3v8CLOUlEE9RD2Os8XJZaoBVxsZbnN6wYCYNvfZvPRE0Uv6mmOVop4o7pDjQs/taVU
         rdE1/2QGVxyeNpdieUUmwv+aJ8aNTliUS9gnHfFf8hR/vhAld8AH+MiFi6v7AQIqnj0Y
         TNAlcBU544UDj55ke3vy13apl3Gs1kkgG8t0zgdoPw4O2wsre4CPUBPD76aDN0rQZufq
         Oo5w==
X-Gm-Message-State: AFuF++mlFiOSEcMYp+1LpN+yQTjbt5Wn91ialcaOEU9O0NsYLx6wKUIh
	pjkrSvY8bdzUo21Igb4uozePwZe4KNIdyLG+5VCoJs8GbwSyGOLtui7HtcI1thURXeUrHhvVN8N
	M2ddCvPEL/nZLFxjaATVuGxxbSVNdC2HQUEc1NqZAiGYF4g9HvybBk3fumFS02xf6yqiFLe8Kmu
	lxPsMhEjlySocs17pwV6KBwc3kXT+bBwbwvFqsDm5ZXWL4p5U=
X-Gm-Gg: AYBFou2LrBrLFvp3zrnq2VsTVLsE6Yy5C0iASBOXHnKKpY7FH6aIr4tPRmJKifnDFG2
	Zyk3oIhqstzHT6ITqlBYKBF+Atmgx+fc+e90FlVrBUfaqYY86949f5nvZpVzlyiJxA9u3JHhwHw
	ARQxrSan1DAozaXZWr7XsXttXZPgN9Zbb1NEynAVGag+wFKnnA0W1I3OCHSa8dXuHjxSf95rFLv
	XgkqLG1E7EGSSmvyxzTSlMFq/dFahr0klvfmlqM6wkfWo95LZJ+QPAvJf2xKD1Iq/fk1X7oUUHE
	nuctleQovd4w7PI0LhZA4r4wqhP6845w5hrcdZyw9JN75FL5JPfaOtKvI/YzXuQxwbFdmphGymE
	6SYBuYY7J/KXoeuPMguML14i27p9O5Xd5yvV3FV76GqFz1qizNHH6
X-Received: by 2002:a05:6402:4613:b0:6a9:a5e7:f8d3 with SMTP id 4fb4d7f45d1cf-6aa5780920dmr9694370a12.19.1790057429560;
        Mon, 21 Sep 2026 23:10:29 -0700 (PDT)
X-Received: by 2002:a05:6402:4613:b0:6a9:a5e7:f8d3 with SMTP id 4fb4d7f45d1cf-6aa5780920dmr9694347a12.19.1790057429145;
        Mon, 21 Sep 2026 23:10:29 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-111.pool.digikabel.hu. [85.66.37.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440df9asm449826a12.4.2026.09.21.23.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:10:27 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>
Subject: [PATCH 03/11] fuse: don't assume ff->passthrough is set for FOPEN_PASSTHROUGH
Date: Tue, 22 Sep 2026 08:10:03 +0200
Message-ID: <20260922061019.3320196-4-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: PgK9uKizuCN50Iv2iELFVc22YiATek0jn2RqfDtF7kw_1790057430
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Following patch will introduce extent map passthrough mode, where
ff->passthrough is not set.

Check if in passthrough mode via FOPEN_PASSTHROUGH instead.

No functional change.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/file.c        | 12 ++++++------
 fs/fuse/fuse_i.h      |  8 ++------
 fs/fuse/passthrough.c | 13 +++++++++++--
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 1eadeca0c47d..af26de78a199 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -311,7 +311,7 @@ static void fuse_prepare_release(struct fuse_inode *fi, struct fuse_file *ff,
 	struct fuse_conn *fc = ff->fm->fc;
 	struct fuse_release_args *ra = &ff->args->release_args;
 
-	if (fuse_file_passthrough(ff))
+	if (fuse_is_passthrough(ff))
 		fuse_passthrough_release(ff, fuse_inode_backing(fi));
 
 	/* Inode is NULL on error path of fuse_create_open() */
@@ -1842,7 +1842,7 @@ static ssize_t fuse_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	/* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
 	if (ff->open_flags & FOPEN_DIRECT_IO)
 		return fuse_direct_read_iter(iocb, to);
-	else if (fuse_file_passthrough(ff))
+	else if (fuse_is_passthrough(ff))
 		return fuse_passthrough_read_iter(iocb, to);
 	else
 		return fuse_cache_read_iter(iocb, to);
@@ -1863,7 +1863,7 @@ static ssize_t fuse_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	/* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
 	if (ff->open_flags & FOPEN_DIRECT_IO)
 		return fuse_direct_write_iter(iocb, from);
-	else if (fuse_file_passthrough(ff))
+	else if (fuse_is_passthrough(ff))
 		return fuse_passthrough_write_iter(iocb, from);
 	else
 		return fuse_cache_write_iter(iocb, from);
@@ -1879,7 +1879,7 @@ static ssize_t fuse_splice_read(struct file *in, loff_t *ppos,
 
 	if (ff->open_flags & FOPEN_DIRECT_IO)
 		return copy_splice_read(in, ppos, pipe, len, flags);
-	else if (fuse_file_passthrough(ff))
+	else if (fuse_is_passthrough(ff))
 		return fuse_passthrough_splice_read(in, ppos, pipe, len, flags);
 	else
 		return filemap_splice_read(in, ppos, pipe, len, flags);
@@ -1891,7 +1891,7 @@ static ssize_t fuse_splice_write(struct pipe_inode_info *pipe, struct file *out,
 	struct fuse_file *ff = out->private_data;
 
 	/* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
-	if (fuse_file_passthrough(ff) && !(ff->open_flags & FOPEN_DIRECT_IO))
+	if (fuse_is_passthrough(ff) && !(ff->open_flags & FOPEN_DIRECT_IO))
 		return fuse_passthrough_splice_write(pipe, out, ppos, len, flags);
 	else
 		return iter_file_splice_write(pipe, out, ppos, len, flags);
@@ -2406,7 +2406,7 @@ static int fuse_file_mmap(struct file *file, struct vm_area_struct *vma)
 	 * in passthrough mode, either mmap to backing file or fail mmap,
 	 * because mixing cached mmap and passthrough io mode is not allowed.
 	 */
-	if (fuse_file_passthrough(ff))
+	if (fuse_is_passthrough(ff))
 		return fuse_passthrough_mmap(file, vma);
 	else if (fuse_inode_backing(get_fuse_inode(inode)))
 		return -ENODEV;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 77ccd5b2059b..b7d8751ba2e0 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1313,13 +1313,9 @@ static inline struct fuse_backing *fuse_inode_backing_set(struct fuse_inode *fi,
 struct fuse_backing *fuse_passthrough_open(struct file *file, int backing_id);
 void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing *fb);
 
-static inline struct file *fuse_file_passthrough(struct fuse_file *ff)
+static inline bool fuse_is_passthrough(struct fuse_file *ff)
 {
-#ifdef CONFIG_FUSE_PASSTHROUGH
-	return ff->passthrough;
-#else
-	return NULL;
-#endif
+	return IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) && (ff->open_flags & FOPEN_PASSTHROUGH);
 }
 
 ssize_t fuse_passthrough_read_iter(struct kiocb *iocb, struct iov_iter *iter);
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index f2d08ac2459b..b43d3e0f7081 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -11,6 +11,10 @@
 #include <linux/backing-file.h>
 #include <linux/splice.h>
 
+static inline struct file *fuse_file_passthrough(struct fuse_file *ff)
+{
+	return ff->passthrough;
+}
 static void fuse_file_accessed(struct file *file)
 {
 	struct inode *inode = file_inode(file);
@@ -187,10 +191,15 @@ struct fuse_backing *fuse_passthrough_open(struct file *file, int backing_id)
 
 void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backing *fb)
 {
+	struct file *backing_file = fuse_file_passthrough(ff);
+
 	pr_debug("%s: fb=0x%p, backing_file=0x%p\n", __func__,
-		 fb, ff->passthrough);
+		 fb, backing_file);
+
+	if (!backing_file)
+		return;
 
-	fput(ff->passthrough);
+	fput(backing_file);
 	ff->passthrough = NULL;
 	put_cred(ff->cred);
 	ff->cred = NULL;
-- 
2.54.0

