Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12874AB1A0
	for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 18:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065877; cv=none; b=DZas7RapUF9klc4ieXAQVCYqJznKFi9YAORHzOFksikVHugjWC6KQiVeASVGO7WXVCPgzj2iPqw1WypOe6sZpEpc4wr89TReeaYufJ5kyUORRm/piMY0kL04WuM67LenTrGsteLnLmurqmygSRkG09LyRNaekiehizRjvg4dAVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065877; c=relaxed/simple;
	bh=ADY0E/FRYWRHk7Nt4TCtye/O+NyvQw/YCRQZj37EZz8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qmAeJLaF5Q9X7LQsY8UbTH4P8+lGlM9lF7f5faEekHPdIr0Z2UMCWqV3E0JQ651tnbdUH1zm3uq8wu8QAyAiLPFBO82hH16x+5NLVkevF2QhMh2niLqkWl1HJWS6lmRhPq2MrH3FX+Z6jJOSdGAcBtRcYCQVz/ZE7rzXZVSfgkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--shayba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jR+2iT8b; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--shayba.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jR+2iT8b"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso61239a91.2
        for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 11:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789065874; x=1789670674; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAhSPIEvBmS+PCKcxa/XH9lFSCc/+FANgNlh9nivbso=;
        b=jR+2iT8bcC8qFCRyqSqqWO1plcvj4+EXbyjsMnjYtixO7vhCCnKgf+pMK4wvzHZ6Ry
         cqcB9xMqBiqc2oLTrkxEcCva/73ejUBGF8WNbtMWJRnU8E6KIwUdh96FWHaBjBCvaYf7
         75wIeg+XENu0CmlhKMFQ4ipd1Gi/uzB7nzvsaCoh8gGjObb1AFoDrkI6vyR553WMdpJs
         /JpO6dF+0FCgTg6tlZb6TBLkWu/UCCyi5Yi3sAo7/lk2dopdPyZgIQHCgGSukLEiei8f
         Y1yfomc2ax+XGangMsvnYzOxk5qy40JV19eOTzOVbSpBUHsnZ+Y0BD9hIH1DPmnEBa2W
         FmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065874; x=1789670674;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAhSPIEvBmS+PCKcxa/XH9lFSCc/+FANgNlh9nivbso=;
        b=Md1LiCY5aTDcLchq2lAH+thPeIzr2668ti2ieXELHQoERjLmiX4qzQwlMBIw0gV62S
         skb37cJ2T/VhTX9rnHVVQgif3T/rPA0Y1W54l+m79fmv/KSPFPsPr7aUHCMJtiMdHHSx
         XR0WpJdwWY1Di7upU+tIUT0biT0LYEq8Or4+XEViTIqo12QQTnCwtnmAWSR0TvO7SYj4
         HQpCHVf7Vpn0R5jP5rIxRfHB2KlfBkcP+QTJyYRZxRRfgLXEv5qIn1hkuMdocWqvw0BU
         zTjJlgP0nbAueHR3Seehe5kHTFR4iIhpYDQkiMM1Sb9s3NazbGWcWew7ZKwQu7ztwYU7
         nAhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzD/gjlfjr3yeFVTpIHwU53vvob6FZOT4C0DgG/5NsNEQXTGFX8Vnn9PIiZLRlJSYKrtnvxtjf1cI16@lists.linux.dev
X-Gm-Message-State: AFuF++meB+n12l+1tO7MxPTEETDGvdapygJyBoI3pKYOkgWjO50QmnEL
	LvHkC/fjOU9friRpOWkVBytg7IKAplS+UAp9ub2rchm4PszFCaxa1gmZfYVmizDo/iBjXCetzd2
	92kvDoQ==
X-Received: from dlbem1.prod.google.com ([2002:a05:7022:1001:b0:13d:2ef5:67a6])
 (user=shayba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a8c:b0:398:9c0c:7c72
 with SMTP id 98e67ed59e1d1-39d9c3891d8mr12597a91.25.1789065873654; Thu, 10
 Sep 2026 11:44:33 -0700 (PDT)
Date: Thu, 10 Sep 2026 18:44:24 +0000
In-Reply-To: <20260909232351.1533034-1-shayba@google.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260909232351.1533034-1-shayba@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910184424.156341-1-shayba@google.com>
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
