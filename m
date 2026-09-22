Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412F84A64C5
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 06:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057449; cv=none; b=fLwjb7lOJ8OTZrW9SmeQWKmXg2EBnaORlg+qDNLUQW14ky8EcyLpvJ08+nGSMrl0CFiCIrOSHMKQqKrqarJM6Qn3sTleAVlDDlZ0nYPTu/oP14qF59xWSsiHRfinEAyJQsl3K6re8532mtiFt1e8mmjoCE6uTpgGSoPrVGVei0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057449; c=relaxed/simple;
	bh=loIOGRY13XUwnEnckEqExDrfyJsoQWcoEH+rkXKljcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=bL7gknxE9OcMGFtyZmxHi6Y5KtUWBTkCCzwwcxh6CnqlQU5LgOeTSCMlRsVF+0DZa2/w6Rpiz5MqRrU3y1HZEJk4nTrCZ2ibrf6LwIgNow3qJagjdcuh7j1SA2ca4PnXmsweoClQev2i4AjKs+05Y6G3DJwrFk2srHldz2R4AK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NfnKDSH7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NfnKDSH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790057446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wvlxTvf9XSPY0SLeO0NcbXR04yoLNnw2fQWWn+CC5m0=;
	b=NfnKDSH7aD1LXDWEZyFySTopIrW1/luRzsyL5NpUxxovqUNvkOtfkOwTqq7e/p/gO50Z6A
	pc2sm1/7qGYE0HHF/KFMBWl4N7WvJVo5orbFLBsT3MQrFXNCE1D61MyKd5rhHCJirImJKr
	+u/T3qV5o+BMvJh9XZ7SFLIM+DBeTEk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-DJK5nOg7O4agrOl-kyQ-Kw-1; Tue, 22 Sep 2026 02:10:44 -0400
X-MC-Unique: DJK5nOg7O4agrOl-kyQ-Kw-1
X-Mimecast-MFC-AGG-ID: DJK5nOg7O4agrOl-kyQ-Kw_1790057444
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c252b87e9a2so319976266b.3
        for <fuse-devel@lists.linux.dev>; Mon, 21 Sep 2026 23:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057443; x=1790662243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvlxTvf9XSPY0SLeO0NcbXR04yoLNnw2fQWWn+CC5m0=;
        b=tum9TmZFoEX/2TjvxSmHHScWsDp0b9sRQ/Gf/1t/yImodkCNRQAjl82qCrm67X6O3x
         zr2CpZdNundgiQdwcvDq+MJNimIXObZGwlZKj8WxydfoJUHRgtlb7dyijdeuvqjXoK22
         hTC6qkiG5Al5dBO2ilo9iPd2Y1i82zl+6pVdWPOyzXT4cGcN7xBO0tI6VrEgASav/ky1
         nQYJoA3OLm+mM5hR0XnWZMEoAPpUk5DN0xL7AcX9GEsA63MLSFb/+lpdubdfRUV+mpMF
         OzHGLOx35neNGmrflcxLmxzxualLPk4D5eVLd06x1BmUURTz6igUnJEoY0K7iLdOcoS5
         jMvQ==
X-Gm-Message-State: AFuF++lZI9oeunbWd28I92U29pp4D/7q3zrOZxqo5/kJR8KC/RJAvVeG
	ujCcJu4audCP+AAdoT4jTMyRZKsY5a/JFPpFtMCaZ8sv7RfwG4OJenwP0k5HH7PbPVFiGz74yPZ
	E20w5PxItD+j0I9tTLPFYW+cz/9fAnE7/QgebxQ6N98g31kGUmJhsrSikkEhirROipSjUYMisU3
	WvE4zVgQJaABSKRg02UMM2FR80b5/9oCc9aiIu0yOMqQRCHzo=
X-Gm-Gg: AYBFou2+aV6aE7TQ1/cd86u6PY44eijEfXc/p/MfsDY1qgS7jtJoiITaROY3cgJoiEd
	Ovl8/7jSYwlpTPcb2soKMx2TKW4EEmADYPLDMv7cmmOV8gNgwnpKfsYh1SEBFtmAQzeoflrxyA4
	Mit3W+khiiEm+v79AK2pTaRd5mftceEjZqBwXvhIhm9jEV9Vemeu3mBlkYFIdy5c7CNpMqfUjJS
	rholLRcBgXf1UTnsk5dVezpWnhon319yC68a730DneNsCA+gFvCYNIeks6nnOXHIPDafoOTEUQL
	BozRSF44ZnABUi4RXSXVbtHHGErFCaZ1WR7nSBpK11Smk1xSkfrPA5cIyGzu9VSfW/BtBCCa8QP
	mqXLBrKtSgibtRn7rZ9xn4ryTxTojDIOFUlgAjWFM5Ujg0W55airK
X-Received: by 2002:a17:906:9f87:b0:c25:c54d:d1a2 with SMTP id a640c23a62f3a-c2a156b259emr1167791866b.18.1790057443499;
        Mon, 21 Sep 2026 23:10:43 -0700 (PDT)
X-Received: by 2002:a17:906:9f87:b0:c25:c54d:d1a2 with SMTP id a640c23a62f3a-c2a156b259emr1167787666b.18.1790057442745;
        Mon, 21 Sep 2026 23:10:42 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-111.pool.digikabel.hu. [85.66.37.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440df9asm449826a12.4.2026.09.21.23.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:10:41 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>
Subject: [PATCH 10/11] fuse: add extent map I/O support
Date: Tue, 22 Sep 2026 08:10:10 +0200
Message-ID: <20260922061019.3320196-11-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 5V-scJA04i0Vo5O-hz5SMfcGEtmN1SYFRL3Bln7ub4I_1790057444
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Wire up read, write, splice and mmap operations for extent-mapped
files through the iomap/DAX infrastructure.

When a passthrough file is opened with an EXTMAP backing, I/O is
dispatched to the dax devices referenced by the extent map.

If an address is not mapped, EIO is returned on the I/O operation.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/backing.c     |  15 +++++
 fs/fuse/ext_map.c     | 138 ++++++++++++++++++++++++++++++++++++++++++
 fs/fuse/fuse_i.h      |   4 ++
 fs/fuse/passthrough.c |  27 +++++++--
 4 files changed, 180 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 484ca29e8aed..14875d48476e 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -224,6 +224,21 @@ int fuse_backing_close(struct fuse_conn *fc, u64 backing_id, bool is_64bit)
 	return err;
 }
 
+bool fuse_backing_is_dax(struct fuse_backing *fb)
+{
+	switch (fb->type) {
+	case FUSE_BACKING_PATH:
+		return false;
+	case FUSE_BACKING_DAXDEV:
+		return true;
+	case FUSE_BACKING_EXTMAP:
+		return fuse_ext_map_is_dax(fb);
+	default:
+		WARN_ON(1);
+		return false;
+	}
+}
+
 struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, u64 backing_id, bool is_64bit)
 {
 	struct fuse_backing *fb;
diff --git a/fs/fuse/ext_map.c b/fs/fuse/ext_map.c
index e5d257fec88c..c752b6ef0686 100644
--- a/fs/fuse/ext_map.c
+++ b/fs/fuse/ext_map.c
@@ -3,6 +3,8 @@
 #include "fuse_i.h"
 #include <linux/rbtree.h>
 #include <linux/pagemap.h>
+#include <linux/iomap.h>
+#include <linux/dax.h>
 
 struct fuse_iext {
 	struct rb_node rb;
@@ -22,6 +24,24 @@ void fuse_ext_map_destroy(struct rb_root *extents)
 	}
 }
 
+static struct fuse_iext *fuse_find_extent(struct rb_root *extents, u64 offset)
+{
+	struct rb_node *node = extents->rb_node;
+
+	while (node) {
+		struct fuse_iext *fie = rb_entry(node, typeof(*fie), rb);
+
+		if (offset < fie->start)
+			node = node->rb_left;
+		else if (offset >= fie->end)
+			node = node->rb_right;
+		else
+			return fie;
+	}
+
+	return NULL;
+}
+
 static int fuse_add_extent(struct fuse_conn *fc, struct rb_root *extents,
 			   struct fuse_extent *ext)
 {
@@ -76,6 +96,124 @@ static int fuse_add_extent(struct fuse_conn *fc, struct rb_root *extents,
 	return 0;
 }
 
+static int fuse_ext_map_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
+				    unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
+{
+	struct fuse_backing *fb = fuse_inode_backing(get_fuse_inode(inode));
+	struct fuse_iext *fie;
+	loff_t ext_len;
+
+	if (!fb || fb->type != FUSE_BACKING_EXTMAP)
+		return fuse_EIO("missing or wrong type backing");
+
+	fie = fuse_find_extent(&fb->extents, offset);
+	if (!fie)
+		return fuse_EIO("missing mapping");
+
+	if (WARN_ON(fie->backing->type != FUSE_BACKING_DAXDEV))
+		return fuse_EIO("wrong type backing for extent");
+
+	if (fie->backing->dax_error) {
+		fuse_make_bad(inode);
+		return fuse_EIO("dax error");
+	}
+
+	ext_len = fie->end - fie->start;
+
+	iomap->offset = fie->start;
+	iomap->addr = fie->backing_offset;
+	iomap->length = ext_len;
+	iomap->dax_dev = fie->backing->dax_dev;
+	iomap->type = IOMAP_MAPPED;
+	iomap->flags = 0;
+
+	return 0;
+}
+
+static const struct iomap_ops fuse_ext_map_iomap_ops = {
+	.iomap_begin		= fuse_ext_map_iomap_begin,
+};
+
+static vm_fault_t fuse_ext_map_huge_fault(struct vm_fault *vmf, unsigned int order)
+{
+	struct inode *inode = file_inode(vmf->vma->vm_file);
+	bool write_fault = (vmf->flags & FAULT_FLAG_WRITE) && (vmf->vma->vm_flags & VM_SHARED);
+	vm_fault_t ret;
+	unsigned long pfn;
+
+	if (WARN_ON_ONCE(!IS_DAX(inode)))
+		return VM_FAULT_SIGBUS;
+
+	if (write_fault) {
+		sb_start_pagefault(inode->i_sb);
+		file_update_time(vmf->vma->vm_file);
+	}
+
+	ret = dax_iomap_fault(vmf, order, &pfn, NULL, &fuse_ext_map_iomap_ops);
+	if (ret & VM_FAULT_NEEDDSYNC)
+		ret = dax_finish_sync_fault(vmf, order, pfn);
+
+	if (write_fault)
+		sb_end_pagefault(inode->i_sb);
+
+	return ret;
+}
+
+static vm_fault_t fuse_ext_map_fault(struct vm_fault *vmf)
+{
+	return fuse_ext_map_huge_fault(vmf, 0);
+}
+
+static const struct vm_operations_struct fuse_ext_map_vm_ops = {
+	.fault		= fuse_ext_map_fault,
+	.huge_fault	= fuse_ext_map_huge_fault,
+	.page_mkwrite	= fuse_ext_map_fault,
+	.pfn_mkwrite	= fuse_ext_map_fault,
+};
+
+static void fuse_rw_clamp(struct kiocb *iocb, struct iov_iter *ubuf)
+{
+	struct inode *inode = iocb->ki_filp->f_mapping->host;
+	loff_t i_size = i_size_read(inode);
+	loff_t max_count = iocb->ki_pos >= i_size ? 0 : i_size - iocb->ki_pos;
+
+	if (iov_iter_count(ubuf) > max_count)
+		iov_iter_truncate(ubuf, max_count);
+}
+
+ssize_t fuse_ext_map_read_iter(struct kiocb *iocb, struct iov_iter *to)
+{
+	ssize_t res;
+
+	fuse_rw_clamp(iocb, to);
+
+	if (!iov_iter_count(to))
+		return 0;
+
+	res = dax_iomap_rw(iocb, to, &fuse_ext_map_iomap_ops);
+
+	file_accessed(iocb->ki_filp);
+	return res;
+}
+
+ssize_t fuse_ext_map_write_iter(struct kiocb *iocb, struct iov_iter *from)
+{
+	fuse_rw_clamp(iocb, from);
+
+	if (!iov_iter_count(from))
+		return 0;
+
+	return dax_iomap_rw(iocb, from, &fuse_ext_map_iomap_ops);
+}
+
+int fuse_ext_map_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	file_accessed(file);
+	vma->vm_ops = &fuse_ext_map_vm_ops;
+	vm_flags_set(vma, VM_HUGEPAGE);
+	return 0;
+}
+
 bool fuse_ext_map_is_dax(struct fuse_backing *fb)
 {
 	struct fuse_iext *fie;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 928e5c43e43c..50b61e16a15f 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1308,6 +1308,7 @@ void fuse_backing_put(struct fuse_backing *fb);
 
 struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, u64 backing_id, bool is_64bit);
 int fuse_backing_add_64(struct fuse_conn *fc, struct fuse_backing *fb);
+bool fuse_backing_is_dax(struct fuse_backing *fb);
 #else
 
 static inline void fuse_backing_put(struct fuse_backing *fb)
@@ -1367,6 +1368,9 @@ extern void fuse_sysctl_unregister(void);
 /* ext_map.c */
 
 void fuse_ext_map_destroy(struct rb_root *extents);
+ssize_t fuse_ext_map_write_iter(struct kiocb *iocb, struct iov_iter *from);
+ssize_t fuse_ext_map_read_iter(struct kiocb *iocb, struct iov_iter *to);
+int fuse_ext_map_mmap(struct file *file, struct vm_area_struct *vma);
 bool fuse_ext_map_is_dax(struct fuse_backing *fb);
 int fuse_ext_map_populate(struct fuse_conn *fc, struct fuse_notify_map_out *arg,
 			  struct fuse_extent *ext);
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index adc9d2d8e203..5b0886562408 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -35,7 +35,6 @@ ssize_t fuse_passthrough_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 	struct fuse_file *ff = file->private_data;
 	struct file *backing_file = fuse_file_passthrough(ff);
 	size_t count = iov_iter_count(iter);
-	ssize_t ret;
 	struct backing_file_ctx ctx = {
 		.cred = ff->cred,
 		.accessed = fuse_file_accessed,
@@ -48,10 +47,10 @@ ssize_t fuse_passthrough_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 	if (!count)
 		return 0;
 
-	ret = backing_file_read_iter(backing_file, iter, iocb, iocb->ki_flags,
-				     &ctx);
+	if (!backing_file)
+		return fuse_ext_map_read_iter(iocb, iter);
 
-	return ret;
+	return backing_file_read_iter(backing_file, iter, iocb, iocb->ki_flags, &ctx);
 }
 
 ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
@@ -74,6 +73,9 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
 	if (!count)
 		return 0;
 
+	if (!backing_file)
+		return fuse_ext_map_write_iter(iocb, iter);
+
 	inode_lock(inode);
 	ret = backing_file_write_iter(backing_file, iter, iocb, iocb->ki_flags,
 				      &ctx);
@@ -98,6 +100,9 @@ ssize_t fuse_passthrough_splice_read(struct file *in, loff_t *ppos,
 	pr_debug("%s: backing_file=0x%p, pos=%lld, len=%zu, flags=0x%x\n", __func__,
 		 backing_file, *ppos, len, flags);
 
+	if (!backing_file)
+		return copy_splice_read(in, ppos, pipe, len, flags);
+
 	init_sync_kiocb(&iocb, in);
 	iocb.ki_pos = *ppos;
 	ret = backing_file_splice_read(backing_file, &iocb, pipe, len, flags, &ctx);
@@ -123,6 +128,9 @@ ssize_t fuse_passthrough_splice_write(struct pipe_inode_info *pipe,
 	pr_debug("%s: backing_file=0x%p, pos=%lld, len=%zu, flags=0x%x\n", __func__,
 		 backing_file, *ppos, len, flags);
 
+	if (!backing_file)
+		return iter_file_splice_write(pipe, out, ppos, len, flags);
+
 	inode_lock(inode);
 	init_sync_kiocb(&iocb, out);
 	iocb.ki_pos = *ppos;
@@ -145,6 +153,9 @@ ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma)
 	pr_debug("%s: backing_file=0x%p, start=%lu, end=%lu\n", __func__,
 		 backing_file, vma->vm_start, vma->vm_end);
 
+	if (!backing_file)
+		return fuse_ext_map_mmap(file, vma);
+
 	return backing_file_mmap(backing_file, vma, &ctx);
 }
 
@@ -167,6 +178,14 @@ struct fuse_backing *fuse_passthrough_open(struct file *file, u64 backing_id, bo
 	if (!fb)
 		return fuse_ptr_EIO("backing not found");
 
+	if (fb->type == FUSE_BACKING_EXTMAP) {
+		if (fuse_backing_is_dax(fb) != !!IS_DAX(file_inode(file))) {
+			fuse_backing_put(fb);
+			return fuse_ptr_EIO("dax mode mismatch");
+		}
+		return fb;
+	}
+
 	if (fb->type != FUSE_BACKING_PATH) {
 		fuse_backing_put(fb);
 		return fuse_ptr_EIO("invalid backing type");
-- 
2.54.0

