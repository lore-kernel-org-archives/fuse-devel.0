Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792712879;
	b=CiDZlb7Hu2HUTBK2S9FkiF0/DSGh9vuZmRAe6j6fsjFMBAo+H2KHlRBYeIY0wgX8QhW8
	 FUKiSZf7VZ24BldoDB1XPB8nSGhP6K/2AdlnOCz6cgiwJyNDYYX+Dfb9vsWzLkQKaquXF
	 sd3j7olI0lcpsVLzNHbgPECAaQqSX+KmbL4+2kIxs9wVX2yVCCeevv46VuNJ3EQusTNAy
	 SRgDAM04gHhWt/Y5fMQRLnmtOUKemZwCYLykV8te0qWpurxKUkxWgfZP/Ydr9RLwzfoXx
	 gCBf/zIr1cCRRZiybipIngwamYlcu2lUutNe24JQ5OP0wwylAI1WxOfNvrCSoEY5b0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792712879;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:X-Stat-Signature:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Spam-Status:X-Session-Marker:
	 X-Session-ID:X-HE-Tag:X-HE-Meta;
	bh=/BddbnAMzLZHxU5xn6ZvfrdLsYLiDnboj+DQVIg7lXw=;
	b=ht1+Kz187oir6v0cBMPxN1XrP4FG1ZQb7AjbIn7QJGK/QbFAxxZczua2yb4Irx6V16in
	 nXz+0Zene/WqDwjH91TbASKyjAR9eXSbMcVWIwH3jCuJeLKhbhr6a8axSIZp9ZB8Cn5Od
	 aVY4La20ox++6IMsf9sStYXmH5U7bm6QlZVo+fScT5nQfoDSHOb3tAC3p46g7hJdrHkBR
	 P8om1F7FHcsygpWTLGmVIYf58i8CqrBLySIo5F2pxRKRXX0k1uRx0BvWUwbGN/nlpHsyi
	 l/kg/eA49wSj1k3AS32ZXxKVbloM17r2rjM4P5SmNb/im3Cvv2zAZmZd9pNC3+ex+lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=groves.net;
	spf=pass smtp.mailfrom=groves.net;
	arc=none smtp.remote-ip=216.40.44.12
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1AA606A319
	for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 23:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A1AA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=groves.net
Received: from omf18.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 9B3CAA0249;
	Thu, 22 Oct 2026 23:47:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: john@groves.net) by omf18.hostedemail.com (Postfix) with ESMTPA id B3D5631;
	Thu, 22 Oct 2026 23:47:48 +0000 (UTC)
Date: Thu, 22 Oct 2026 18:47:47 -0500
From: John Groves <john@groves.net>
To: Miklos Szeredi <miklos@szeredi.hu>, 
	Amir Goldstein <amir73il@gmail.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, Shai Barack <shayba@google.com>, 
	fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Aravind Ramesh <arramesh@micron.com>
Subject: [PATCH] fuse: handle extent map files in fuse_passthrough_fadvise()
Message-ID: <atqdWUCzGxs3wwXw@groves.net>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Stat-Signature: hxy4okpm8cxr4ntrk99nd5orw4umuj54
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: B3D5631
X-Session-Marker: 6A6F686E4067726F7665732E6E6574
X-Session-ID: U2FsdGVkX1/uT6Bt+cMHYMb/ZB4hit0s0sG5FZmh2OA=
X-HE-Tag: 1792712868-64953
X-HE-Meta: U2FsdGVkX1/qqLBHtgyydqZfILDj3gV4s7RgYvxMWhURNWDSduXEwslhfq53rxZEGQ0LjOXKbdZjtkCRAhML0oz3QLL0TUNBnhGmRdDegAnjvU4twUks0Y9cPN8CSjlM+Kdf6MEHcFlNNDJRNFtd3qQIMHYNi1q7esIUyIL15B7amekqUjI1Wpg+aVDy7hjdwPIvKjVwqexiv9hkuIONXeY02IbdMI9PqIDl1TuqjPVI/NFVIB+Nfx1qXABbEwCJbNylz2nTi6e8Zl6KUfHCUExtf3s2WYbrnNdKj3SWtkxa0CGPvk9geQH9kE8gvdj+1tSYyw9COEHX6Bm8EzqZXKVYhefiIehWZp8E7CsMNUtiTh/U/+7uv7cT4h8SGtoFnryCF+ZgW/OtIQ1JfD8XV+XDFbE4j2W+FE3ge3HRZDIrGWeuPWZWrKy2spRue2IF

This addresses a collision between the pending backing_file fadvise
patch and the new extent-mapping code for famfs (which falls into the
passthrough bucket.

A file opened with FOPEN_PASSTHROUGH on an extent map backing has no
backing file: fuse_passthrough_open() returns before setting
ff->passthrough and ff->cred.  fuse_file_fadvise() routes every
FOPEN_PASSTHROUGH file to fuse_passthrough_fadvise(), which installed
the NULL ff->cred on the task with override_creds() and then passed the
NULL backing file to vfs_fadvise().  Any posix_fadvise(), readahead()
or madvise(MADV_WILLNEED) on such a file oopsed.  fio triggers it at
file open with its default invalidate and fadvise_hint settings.

Fall back to generic_fadvise() when there is no backing file, as the
other passthrough helpers fall back to their extent map or generic
implementations.  generic_fadvise() already ignores advice on DAX
inodes while keeping the EINVAL and ESPIPE checks.

Reported-by: Aravind Ramesh <arramesh@micron.com>
Fixes: 69f77a06ffad ("fuse: Forward vfs_fadvise to backing_file in passthrough mode")
Tested-by: John Groves <john@groves.net>
Signed-off-by: John Groves <john@groves.net>
---
 fs/fuse/file.c        | 2 +-
 fs/fuse/fuse_i.h      | 2 +-
 fs/fuse/passthrough.c | 6 +++++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index da73d1e183c4..eb5ae11b6010 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -3129,7 +3129,7 @@ static int fuse_file_fadvise(struct file *file, loff_t offset, loff_t len, int a
 	struct fuse_file *ff = file->private_data;
 
 	if (fuse_is_passthrough(ff))
-		return fuse_passthrough_fadvise(ff, offset, len, advice);
+		return fuse_passthrough_fadvise(file, offset, len, advice);
 
 	return generic_fadvise(file, offset, len, advice);
 }
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 311252eef2e9..c91af283aef2 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1368,7 +1368,7 @@ ssize_t fuse_passthrough_splice_write(struct pipe_inode_info *pipe,
 				      struct file *out, loff_t *ppos,
 				      size_t len, unsigned int flags);
 ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma);
-int fuse_passthrough_fadvise(struct fuse_file *ff, loff_t offset, loff_t len, int advice);
+int fuse_passthrough_fadvise(struct file *file, loff_t offset, loff_t len, int advice);
 
 #ifdef CONFIG_SYSCTL
 extern int fuse_sysctl_register(void);
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index 1c1cf1085c9c..0ed964c479d9 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -159,12 +159,16 @@ ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma)
 	return backing_file_mmap(backing_file, vma, &ctx);
 }
 
-int fuse_passthrough_fadvise(struct fuse_file *ff, loff_t offset, loff_t len, int advice)
+int fuse_passthrough_fadvise(struct file *file, loff_t offset, loff_t len, int advice)
 {
+	struct fuse_file *ff = file->private_data;
 	struct file *backing_file = fuse_file_passthrough(ff);
 	const struct cred *old_cred;
 	int ret;
 
+	if (!backing_file)
+		return generic_fadvise(file, offset, len, advice);
+
 	old_cred = override_creds(ff->cred);
 	ret = vfs_fadvise(backing_file, offset, len, advice);
 	revert_creds(old_cred);
-- 
2.56.0

