Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA375867E2
	for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 18:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066578; cv=none; b=tj9iAOIJet7VlQisgxnOR6k4nYwc+77uSCskX/TpB9dhWk351ySYSBQgXEh3eaJH50LxaiGhwLxFy6hzXOd9PmIkHyicXtNTTM2QMGvesaxJ0ot7jnSzJ2TMaSaBihPjZitgKcNK8FDXG1/JdV640I5vR3NnPhMgRRywDjUmIsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066578; c=relaxed/simple;
	bh=ADY0E/FRYWRHk7Nt4TCtye/O+NyvQw/YCRQZj37EZz8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bgIQRGxWEM9i7RClT7GCy/mdpGirx6wBXi5HQw7Yl3Ayoj7IAraPgtJS7kU/sURfyvGfxFe4b5xqnTcAsh3/2Q5yOfgGvDbFypEC/As2xiHYvGgqLWif6V4ZzHaUDiLoGAul/Td3V67yMB+vnzg3+veABl1zD3M9c5IhzzlWBss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--shayba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=POiV/EF7; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--shayba.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="POiV/EF7"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so60654a91.3
        for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 11:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789066576; x=1789671376; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAhSPIEvBmS+PCKcxa/XH9lFSCc/+FANgNlh9nivbso=;
        b=POiV/EF7DgWjsjQGQrbn2ahP5lyriqV395JHFGGdgu7dK90vGCh6PiI/KeONbQp2Sf
         KQ5qEtsIRz+P4jhH9JlVXE24MtUp10J1GtZvg7tQFj+jPzLbHxaD5OZRRz9rW6G0RFm+
         UAAALi8SEjggv0hvu+vuAmKptx4cIrZ+XUGIQ6WzaP95WX4s4ZPeidiCmHrjP2UbrM04
         0J+Ga/2/UmfinCTQ7VVyElHRXcqdEwj+CD18F9DUZaFjO/uG0WE5ykYdEmCkCHianFkv
         E+rJu7hNq7TI255ygNmFkvyxrsBT2TbeCupGKAxMGjma4bfmMshO2A01lv+Q10KPLQxd
         GSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066576; x=1789671376;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAhSPIEvBmS+PCKcxa/XH9lFSCc/+FANgNlh9nivbso=;
        b=Rj97RM/eT/WOrT80Utj9+cVCu4MzQbgWl6i9MpdnpN0piprDisTCPl/jCVYwmdMCx3
         O31+/n6vFmHT2lj2irMoYnb/KQWJr/8M8KPsVgTvbDiHfgQtoD2n1Xco9oCTUuO2uvev
         pRUU+cePS2o1FK9eXNUyRg2+3Q0wJCzDqZCSZgJEWRFePaLGzmQ3VIiZ2lq7ca543ZAF
         J7uGaSjcfBMGbWFMsNUQdOhWM7Q8uTGpXFabFI/AG6feaS0ppCdj47I3xUnCP0rRU24p
         vM4LwtCUVZb/CaX91qGRhAbApOaZBSWs0D0jrZ4zI8M9n8WjRbN+d6KtGnxxhicBIotg
         rhNg==
X-Forwarded-Encrypted: i=1; AKwUvByojVrCVGRFz44g4qG/yn8fG6tcoq2a3pijvJFvJ3RpdTjnQJMctkbbQRvW0sNwaONq3sK8T12Ouryd@lists.linux.dev
X-Gm-Message-State: AFuF++mzSkjnbPREvy5Z1MkbfQcqggpWFxoOKmxwxBtnMt7D8EoJdEpi
	AmNDIEtVSUw1k//pfmnUmJb3Amh5sQKkXuNFDOzS32qz0jcQHkm63fCHB4tnQF5icAZ9H1mkA0i
	RuTPvYg==
X-Received: from dld34.prod.google.com ([2002:a05:7022:322:b0:142:e0f7:1a4d])
 (user=shayba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5287:b0:398:9bd5:490d
 with SMTP id 98e67ed59e1d1-39d9c22e224mr103903a91.20.1789066576318; Thu, 10
 Sep 2026 11:56:16 -0700 (PDT)
Date: Thu, 10 Sep 2026 18:56:14 +0000
In-Reply-To: <20260909232351.1533034-1-shayba@google.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260909232351.1533034-1-shayba@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910185614.262511-1-shayba@google.com>
Subject: [PATCH v2] fuse: Forward vfs_fadvise to backing_file in passthrough mode
From: Shai Barack <shayba@google.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bschubert@ddn.com>, 
	Sandeep Dhavale <dhavale@google.com>, Akilesh Kailash <akailash@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shai Barack <shayba@google.com>
Content-Type: text/plain; charset="UTF-8"

When an application invokes posix_fadvise(..., POSIX_FADV_DONTNEED) or
other fadvise advice on a FUSE passthrough file descriptor, the VFS
currently only executes generic_fadvise() on the upper FUSE inode
mapping.

Because FUSE passthrough does not forward fadvise operations to the
underlying backing file, pages residing in the lower filesystem's
pagecache remain resident in memory.

During media-heavy workloads (such as image thumbnail generation or
streaming), single-access file data accumulates in the inactive pagecache
of the lower filesystem. Under memory pressure, the kernel retains these
stale media pages and instead evicts active executable pages from
running processes, leading to severe direct reclaim latency spikes.

Architecturally, Linux VFS supports filesystem-specific fadvise
delegation via the .fadvise hook in struct file_operations. Implement
fuse_file_fadvise() in fs/fuse/file.c and register it in
fuse_file_operations. When passthrough is active on a fuse_file,
fuse_file_fadvise() forwards the vfs_fadvise() call to the lower
backing_file under the opened credentials, allowing POSIX_FADV_DONTNEED
to cleanly invalidate the physical backing filesystem pagecache.

Signed-off-by: Shai Barack <shayba@google.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Bernd Schubert <bschubert@ddn.com>
Cc: Sandeep Dhavale <dhavale@google.com>
Cc: Akilesh Kailash <akailash@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: fuse-devel@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
v2:
- Remove redundant !backing_file check in fuse_passthrough_fadvise() (Amir Goldstein)
- Remove unused fuse_passthrough_fadvise() stub under #ifndef CONFIG_FUSE_PASSTHROUGH (Amir Goldstein)
- Reorder fuse_passthrough_fadvise() above fuse_passthrough_open() alongside other passthrough ops (Amir Goldstein)
- Add fuse-devel@lists.linux.dev to CC list (Amir Goldstein, TJ Mercier)

 fs/fuse/file.c        | 11 +++++++++++
 fs/fuse/fuse_i.h      |  1 +
 fs/fuse/passthrough.c | 13 +++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index a4d736945..81709ab82 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -3537,6 +3537,16 @@ static ssize_t fuse_copy_file_range(struct file *src_file, loff_t src_off,
 	return ret;
 }
 
+static int fuse_file_fadvise(struct file *file, loff_t offset, loff_t len, int advice)
+{
+	struct fuse_file *ff = file->private_data;
+
+	if (fuse_file_passthrough(ff))
+		return fuse_passthrough_fadvise(ff, offset, len, advice);
+
+	return generic_fadvise(file, offset, len, advice);
+}
+
 static const struct file_operations fuse_file_operations = {
 	.llseek		= fuse_file_llseek,
 	.read_iter	= fuse_file_read_iter,
@@ -3557,6 +3567,7 @@ static const struct file_operations fuse_file_operations = {
 	.fallocate	= fuse_file_fallocate,
 	.copy_file_range = fuse_copy_file_range,
 	.fop_flags	= FOP_DONTCACHE,
+	.fadvise	= fuse_file_fadvise,
 };
 
 static const struct address_space_operations fuse_file_aops  = {
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 939553b34..6c60716e7 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1581,6 +1581,7 @@ ssize_t fuse_passthrough_splice_write(struct pipe_inode_info *pipe,
 				      struct file *out, loff_t *ppos,
 				      size_t len, unsigned int flags);
 ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma);
+int fuse_passthrough_fadvise(struct fuse_file *ff, loff_t offset, loff_t len, int advice);
 
 /* backing.c */
 
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index 059e57969..8a8fa6b8c 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -160,6 +160,19 @@ ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma)
 	return backing_file_mmap(backing_file, vma, &ctx);
 }
 
+int fuse_passthrough_fadvise(struct fuse_file *ff, loff_t offset, loff_t len, int advice)
+{
+	struct file *backing_file = fuse_file_passthrough(ff);
+	const struct cred *old_cred;
+	int ret;
+
+	old_cred = override_creds(ff->cred);
+	ret = vfs_fadvise(backing_file, offset, len, advice);
+	revert_creds(old_cred);
+
+	return ret;
+}
+
 struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
 {
 	if (fb && refcount_inc_not_zero(&fb->count))
-- 
2.43.0
