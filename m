Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D7539A07C
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331070; cv=none; b=fog8F3JsJnRw1D9+B+BL30Zgfu4/6P/eZYgqrqrFQmI83ZxJgbUbjqh0AjU6IrSm2A9O2nKU0bQFTldkPhJcXmlBKgHX857w0ehrpc/zNfCa/HpBnQYVlsJBZlzT8/kqf5h0y7GbHig13wtf8V/Gi7QNBeKZBhsRMrslpoEw96g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331070; c=relaxed/simple;
	bh=kWRewFdsMKvd505QPuqH04Ahh8Q4sFmtFNiMgVLAT3I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=hlZf9Enr3N5rQFtMo8T5YQCWaRSCS2bfWfgBPyDp2wVuxs5RYhrMuukHJFdZaEzlQ4g6H1kI6bB5KumfTr9A7wysXwdJMDCeE/4K8zoSkHCiQWigE31gfAtB+rH2buu01p8MJ6+hSXpMNmZSD2zKlKdk8OjpjRi+U1+qdyPOv0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ifto1QH/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ifto1QH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qj9PBRHOQjpdtUN1kc6XOkc6O6ffTPvl3tnDxlP1g9E=;
	b=ifto1QH/YRoiacrhuuyjDcZpeM9KC3r8+v+rnCKoxET/BOi+LBihF8fZtzfl6mvdKemPy6
	iT6zIiH0S4WD8nhAKafCLnHfIL5T/gPInYTl9yVOlbsPjX1treokZ11PSwbl0bqi5Wme/0
	XmXx2thGVEJIp8Gnd9SRDHzkDj8B8CM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-YlqY88a2OReaISNoXkGTcw-1; Thu, 16 Apr 2026 05:17:40 -0400
X-MC-Unique: YlqY88a2OReaISNoXkGTcw-1
X-Mimecast-MFC-AGG-ID: YlqY88a2OReaISNoXkGTcw_1776331059
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488c2764f83so50889535e9.2
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331059; x=1776935859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qj9PBRHOQjpdtUN1kc6XOkc6O6ffTPvl3tnDxlP1g9E=;
        b=ctmDacZQ5EMemyfgwNIDWPawVMvi+j1IYpM9KV1FG6flFLDyHlhE3zK+yR2HGaeZw2
         9WPJzdiLJgX3QXU4um4SEetDTxokgYDVC/jhcg1CQHlGm8hyvrZjlQOf1woeaXj8DwEh
         ofzdGeh1asbSrBgi9WaZTX5Wc3GgTvvpDMaEQj6rFnN9xYprJBCUIU56uqqpxeIM8J4X
         VKTQ0Bylr4AXTtx2/t8MLbqYPTykcIpvMxRCP4vFNJ3CtGFmcTtlrvB31nWCs+hRKJEH
         5lCFI8HTSlF5/wxzCYbYmNgS1KnY3f3h4V72nIfJpJxKSVu7/lFmw5GOHYwWabiMrVk5
         uZcw==
X-Gm-Message-State: AOJu0Yy0ml5/oxevxRquPRi9+dlxuqt1zfM0l6KUrp5IabrU/O9HsQ7I
	7COjskaqqUMLL40PgID8yBrBBINYZHKgqqmfJ6DQulJea8GffdfvhiA31wFKIxWCQqMqKoWVP0V
	3nt+OOemPPh5jedvnMsBPDQGjMJQVwsLY4aONHHAfuZl+iHUBaftMzP0PgFQGKhKfONbCqE3NF2
	19tmiX6Y22YP66r2J9AdKZ9BBgmSXJVaNauk3k+ejGogcOZDk=
X-Gm-Gg: AeBDietEOgoJJhW9WQx8rpwiovLDlRSXJhnyhFXEObJUOxLHsiwxd2ZzYSVLOYjCTOG
	Hf3xe0rin7Lj7dVsw5grgp/KbAhvRi8eGWnPXgIzD0ueUdGKvg/ZbQBa30N5yHmAhiVgaldfVJG
	EoSR4W4N7ZBoRrLVrnbQCA8rp1185X11gXTUc1W6demfxjspXWBlruotczDKiUn+ZSh/yx/PIVH
	I/9MrTzIlZ4btoCCiqOsuFxmzJ9kHGR/pdS+xdEWq41B/F5ruIHICplXYynsEdQjP0LAmpRcWCM
	5SIMjFJS2HMWBixwEriRjmmcy5EGvsdqjSc1bVtoXFgNLzD9KBYKWsxPA5SATT9NmXJEUyjnMkg
	sqRyuxXfTITQtqUO/CPDL7kLWP3ve2hJLC5+pMGmlmvw1kZmINgMQ4q9b3MVXcBma+a1RAtieK6
	EVCC2+pQ==
X-Received: by 2002:a05:600c:474c:b0:487:219e:42d with SMTP id 5b1f17b1804b1-488d67e72b7mr321369935e9.11.1776331058157;
        Thu, 16 Apr 2026 02:17:38 -0700 (PDT)
X-Received: by 2002:a05:600c:474c:b0:487:219e:42d with SMTP id 5b1f17b1804b1-488d67e72b7mr321369315e9.11.1776331057453;
        Thu, 16 Apr 2026 02:17:37 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:36 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 26/32] fuse: create notify.c
Date: Thu, 16 Apr 2026 11:16:50 +0200
Message-ID: <20260416091658.462783-27-mszeredi@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416091658.462783-1-mszeredi@redhat.com>
References: <20260416091658.462783-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Uc_muhhBwvUgnzKYcsIQpqBbL0mX0j_8Qyxn3q1K2nI_1776331059
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Move FUSE_NOTIFY_* handling into a separate source file.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/Makefile     |   2 +-
 fs/fuse/dev.c        | 458 ++-----------------------------------------
 fs/fuse/dev.h        |  12 +-
 fs/fuse/fuse_dev_i.h |   1 -
 fs/fuse/notify.c     | 434 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 461 insertions(+), 446 deletions(-)
 create mode 100644 fs/fuse/notify.c

diff --git a/fs/fuse/Makefile b/fs/fuse/Makefile
index 26086bf5b494..245e67852b03 100644
--- a/fs/fuse/Makefile
+++ b/fs/fuse/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_VIRTIO_FS) += virtiofs.o
 
 fuse-y := trace.o	# put trace.o first so we see ftrace errors sooner
 fuse-y += dev.o dir.o file.o inode.o control.o xattr.o acl.o readdir.o ioctl.o req_timeout.o req.o
-fuse-y += poll.o
+fuse-y += poll.o notify.o
 fuse-y += iomode.o
 fuse-$(CONFIG_FUSE_DAX) += dax.o
 fuse-$(CONFIG_FUSE_PASSTHROUGH) += passthrough.o backing.o
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index a76822bd81c2..fe415454de0f 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1201,8 +1201,8 @@ static int fuse_ref_folio(struct fuse_copy_state *cs, struct folio *folio,
  * Copy a folio in the request to/from the userspace buffer.  Must be
  * done atomically
  */
-static int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
-			   unsigned offset, unsigned count, int zeroing)
+int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
+		    unsigned offset, unsigned count, int zeroing)
 {
 	int err;
 	struct folio *folio = *foliop;
@@ -1283,7 +1283,7 @@ static int fuse_copy_folios(struct fuse_copy_state *cs, unsigned nbytes,
 }
 
 /* Copy a single argument in the request to/from userspace buffer */
-static int fuse_copy_one(struct fuse_copy_state *cs, void *val, unsigned size)
+int fuse_copy_one(struct fuse_copy_state *cs, void *val, unsigned size)
 {
 	while (size) {
 		if (!cs->len) {
@@ -1715,343 +1715,6 @@ static ssize_t fuse_dev_splice_read(struct file *in, loff_t *ppos,
 	return ret;
 }
 
-static int fuse_notify_poll(struct fuse_conn *fc, unsigned int size,
-			    struct fuse_copy_state *cs)
-{
-	struct fuse_notify_poll_wakeup_out outarg;
-	int err;
-
-	if (size != sizeof(outarg))
-		return -EINVAL;
-
-	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
-	if (err)
-		return err;
-
-	fuse_copy_finish(cs);
-	return fuse_notify_poll_wakeup(fc, &outarg);
-}
-
-static int fuse_notify_inval_inode(struct fuse_conn *fc, unsigned int size,
-				   struct fuse_copy_state *cs)
-{
-	struct fuse_notify_inval_inode_out outarg;
-	int err;
-
-	if (size != sizeof(outarg))
-		return -EINVAL;
-
-	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
-	if (err)
-		return err;
-	fuse_copy_finish(cs);
-
-	down_read(&fc->killsb);
-	err = fuse_reverse_inval_inode(fc, outarg.ino,
-				       outarg.off, outarg.len);
-	up_read(&fc->killsb);
-	return err;
-}
-
-static int fuse_notify_inval_entry(struct fuse_conn *fc, unsigned int size,
-				   struct fuse_copy_state *cs)
-{
-	struct fuse_notify_inval_entry_out outarg;
-	int err;
-	char *buf;
-	struct qstr name;
-
-	if (size < sizeof(outarg))
-		return -EINVAL;
-
-	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
-	if (err)
-		return err;
-
-	if (outarg.namelen > fc->name_max)
-		return -ENAMETOOLONG;
-
-	err = -EINVAL;
-	if (size != sizeof(outarg) + outarg.namelen + 1)
-		return -EINVAL;
-
-	buf = kzalloc(outarg.namelen + 1, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	name.name = buf;
-	name.len = outarg.namelen;
-	err = fuse_copy_one(cs, buf, outarg.namelen + 1);
-	if (err)
-		goto err;
-	fuse_copy_finish(cs);
-	buf[outarg.namelen] = 0;
-
-	down_read(&fc->killsb);
-	err = fuse_reverse_inval_entry(fc, outarg.parent, 0, &name, outarg.flags);
-	up_read(&fc->killsb);
-err:
-	kfree(buf);
-	return err;
-}
-
-static int fuse_notify_delete(struct fuse_conn *fc, unsigned int size,
-			      struct fuse_copy_state *cs)
-{
-	struct fuse_notify_delete_out outarg;
-	int err;
-	char *buf;
-	struct qstr name;
-
-	if (size < sizeof(outarg))
-		return -EINVAL;
-
-	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
-	if (err)
-		return err;
-
-	if (outarg.namelen > fc->name_max)
-		return -ENAMETOOLONG;
-
-	if (size != sizeof(outarg) + outarg.namelen + 1)
-		return -EINVAL;
-
-	buf = kzalloc(outarg.namelen + 1, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	name.name = buf;
-	name.len = outarg.namelen;
-	err = fuse_copy_one(cs, buf, outarg.namelen + 1);
-	if (err)
-		goto err;
-	fuse_copy_finish(cs);
-	buf[outarg.namelen] = 0;
-
-	down_read(&fc->killsb);
-	err = fuse_reverse_inval_entry(fc, outarg.parent, outarg.child, &name, 0);
-	up_read(&fc->killsb);
-err:
-	kfree(buf);
-	return err;
-}
-
-static int fuse_notify_store(struct fuse_conn *fc, unsigned int size,
-			     struct fuse_copy_state *cs)
-{
-	struct fuse_notify_store_out outarg;
-	struct inode *inode;
-	struct address_space *mapping;
-	u64 nodeid;
-	int err;
-	unsigned int num;
-	loff_t file_size;
-	loff_t pos;
-	loff_t end;
-
-	if (size < sizeof(outarg))
-		return -EINVAL;
-
-	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
-	if (err)
-		return err;
-
-	if (size - sizeof(outarg) != outarg.size)
-		return -EINVAL;
-
-	if (outarg.offset >= MAX_LFS_FILESIZE)
-		return -EINVAL;
-
-	nodeid = outarg.nodeid;
-	pos = outarg.offset;
-	num = min(outarg.size, MAX_LFS_FILESIZE - pos);
-
-	down_read(&fc->killsb);
-
-	err = -ENOENT;
-	inode = fuse_ilookup(fc, nodeid,  NULL);
-	if (!inode)
-		goto out_up_killsb;
-
-	mapping = inode->i_mapping;
-	file_size = i_size_read(inode);
-	end = pos + num;
-	if (end > file_size) {
-		file_size = end;
-		fuse_write_update_attr(inode, file_size, num);
-	}
-
-	while (num) {
-		struct folio *folio;
-		unsigned int folio_offset;
-		unsigned int nr_bytes;
-		pgoff_t index = pos >> PAGE_SHIFT;
-
-		folio = filemap_grab_folio(mapping, index);
-		err = PTR_ERR(folio);
-		if (IS_ERR(folio))
-			goto out_iput;
-
-		folio_offset = offset_in_folio(folio, pos);
-		nr_bytes = min(num, folio_size(folio) - folio_offset);
-
-		err = fuse_copy_folio(cs, &folio, folio_offset, nr_bytes, 0);
-		if (!folio_test_uptodate(folio) && !err && folio_offset == 0 &&
-		    (nr_bytes == folio_size(folio) || file_size == end)) {
-			folio_zero_segment(folio, nr_bytes, folio_size(folio));
-			folio_mark_uptodate(folio);
-		}
-		folio_unlock(folio);
-		folio_put(folio);
-
-		if (err)
-			goto out_iput;
-
-		pos += nr_bytes;
-		num -= nr_bytes;
-	}
-
-	err = 0;
-
-out_iput:
-	iput(inode);
-out_up_killsb:
-	up_read(&fc->killsb);
-	return err;
-}
-
-struct fuse_retrieve_args {
-	struct fuse_args_pages ap;
-	struct fuse_notify_retrieve_in inarg;
-};
-
-static void fuse_retrieve_end(struct fuse_args *args, int error)
-{
-	struct fuse_retrieve_args *ra =
-		container_of(args, typeof(*ra), ap.args);
-
-	release_pages(ra->ap.folios, ra->ap.num_folios);
-	kfree(ra);
-}
-
-static int fuse_retrieve(struct fuse_mount *fm, struct inode *inode,
-			 struct fuse_notify_retrieve_out *outarg)
-{
-	int err;
-	struct address_space *mapping = inode->i_mapping;
-	loff_t file_size;
-	unsigned int num;
-	unsigned int offset;
-	size_t total_len = 0;
-	unsigned int num_pages;
-	struct fuse_conn *fc = fm->fc;
-	struct fuse_retrieve_args *ra;
-	size_t args_size = sizeof(*ra);
-	struct fuse_args_pages *ap;
-	struct fuse_args *args;
-	loff_t pos = outarg->offset;
-
-	offset = offset_in_page(pos);
-	file_size = i_size_read(inode);
-
-	num = min(outarg->size, fc->max_write);
-	if (pos > file_size)
-		num = 0;
-	else if (num > file_size - pos)
-		num = file_size - pos;
-
-	num_pages = DIV_ROUND_UP(num + offset, PAGE_SIZE);
-	num_pages = min(num_pages, fc->max_pages);
-	num = min(num, num_pages << PAGE_SHIFT);
-
-	args_size += num_pages * (sizeof(ap->folios[0]) + sizeof(ap->descs[0]));
-
-	ra = kzalloc(args_size, GFP_KERNEL);
-	if (!ra)
-		return -ENOMEM;
-
-	ap = &ra->ap;
-	ap->folios = (void *) (ra + 1);
-	ap->descs = (void *) (ap->folios + num_pages);
-
-	args = &ap->args;
-	args->nodeid = outarg->nodeid;
-	args->opcode = FUSE_NOTIFY_REPLY;
-	args->in_numargs = 3;
-	args->in_pages = true;
-	args->end = fuse_retrieve_end;
-
-	while (num && ap->num_folios < num_pages) {
-		struct folio *folio;
-		unsigned int folio_offset;
-		unsigned int nr_bytes;
-		pgoff_t index = pos >> PAGE_SHIFT;
-
-		folio = filemap_get_folio(mapping, index);
-		if (IS_ERR(folio))
-			break;
-
-		folio_offset = offset_in_folio(folio, pos);
-		nr_bytes = min(folio_size(folio) - folio_offset, num);
-
-		ap->folios[ap->num_folios] = folio;
-		ap->descs[ap->num_folios].offset = folio_offset;
-		ap->descs[ap->num_folios].length = nr_bytes;
-		ap->num_folios++;
-
-		pos += nr_bytes;
-		num -= nr_bytes;
-		total_len += nr_bytes;
-	}
-	ra->inarg.offset = outarg->offset;
-	ra->inarg.size = total_len;
-	fuse_set_zero_arg0(args);
-	args->in_args[1].size = sizeof(ra->inarg);
-	args->in_args[1].value = &ra->inarg;
-	args->in_args[2].size = total_len;
-
-	err = fuse_simple_notify_reply(fm, args, outarg->notify_unique);
-	if (err)
-		fuse_retrieve_end(args, err);
-
-	return err;
-}
-
-static int fuse_notify_retrieve(struct fuse_conn *fc, unsigned int size,
-				struct fuse_copy_state *cs)
-{
-	struct fuse_notify_retrieve_out outarg;
-	struct fuse_mount *fm;
-	struct inode *inode;
-	u64 nodeid;
-	int err;
-
-	if (size != sizeof(outarg))
-		return -EINVAL;
-
-	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
-	if (err)
-		return err;
-
-	fuse_copy_finish(cs);
-
-	if (outarg.offset >= MAX_LFS_FILESIZE)
-		return -EINVAL;
-
-	down_read(&fc->killsb);
-	err = -ENOENT;
-	nodeid = outarg.nodeid;
-
-	inode = fuse_ilookup(fc, nodeid, &fm);
-	if (inode) {
-		err = fuse_retrieve(fm, inode, &outarg);
-		iput(inode);
-	}
-	up_read(&fc->killsb);
-
-	return err;
-}
-
 /*
  * Resending all processing queue requests.
  *
@@ -2065,7 +1728,7 @@ static int fuse_notify_retrieve(struct fuse_conn *fc, unsigned int size,
  * if the FUSE daemon takes careful measures to avoid processing duplicated
  * non-idempotent requests.
  */
-static void fuse_resend(struct fuse_chan *fch)
+void fuse_chan_resend(struct fuse_chan *fch)
 {
 	struct fuse_dev *fud;
 	struct fuse_req *req, *next;
@@ -2109,108 +1772,6 @@ static void fuse_resend(struct fuse_chan *fch)
 	fuse_dev_wake_and_unlock(fiq);
 }
 
-static int fuse_notify_resend(struct fuse_conn *fc)
-{
-	fuse_resend(fc->chan);
-	return 0;
-}
-
-/*
- * Increments the fuse connection epoch.  This will result of dentries from
- * previous epochs to be invalidated.  Additionally, if inval_wq is set, a work
- * queue is scheduled to trigger the invalidation.
- */
-static int fuse_notify_inc_epoch(struct fuse_conn *fc)
-{
-	atomic_inc(&fc->epoch);
-	if (inval_wq)
-		schedule_work(&fc->epoch_work);
-
-	return 0;
-}
-
-static int fuse_notify_prune(struct fuse_conn *fc, unsigned int size,
-			     struct fuse_copy_state *cs)
-{
-	struct fuse_notify_prune_out outarg;
-	const unsigned int batch = 512;
-	u64 *nodeids __free(kfree) = kmalloc(sizeof(u64) * batch, GFP_KERNEL);
-	unsigned int num, i;
-	int err;
-
-	if (!nodeids)
-		return -ENOMEM;
-
-	if (size < sizeof(outarg))
-		return -EINVAL;
-
-	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
-	if (err)
-		return err;
-
-	if (size - sizeof(outarg) != outarg.count * sizeof(u64))
-		return -EINVAL;
-
-	for (; outarg.count; outarg.count -= num) {
-		num = min(batch, outarg.count);
-		err = fuse_copy_one(cs, nodeids, num * sizeof(u64));
-		if (err)
-			return err;
-
-		scoped_guard(rwsem_read, &fc->killsb) {
-			for (i = 0; i < num; i++)
-				fuse_try_prune_one_inode(fc, nodeids[i]);
-		}
-	}
-	return 0;
-}
-
-static int fuse_notify(struct fuse_conn *fc, enum fuse_notify_code code,
-		       unsigned int size, struct fuse_copy_state *cs)
-{
-	/*
-	 * Only allow notifications during while the connection is in an
-	 * initialized and connected state
-	 */
-	if (!fc->chan->initialized || !fc->chan->connected)
-		return -EINVAL;
-
-	/* Don't try to move folios (yet) */
-	cs->move_folios = false;
-
-	switch (code) {
-	case FUSE_NOTIFY_POLL:
-		return fuse_notify_poll(fc, size, cs);
-
-	case FUSE_NOTIFY_INVAL_INODE:
-		return fuse_notify_inval_inode(fc, size, cs);
-
-	case FUSE_NOTIFY_INVAL_ENTRY:
-		return fuse_notify_inval_entry(fc, size, cs);
-
-	case FUSE_NOTIFY_STORE:
-		return fuse_notify_store(fc, size, cs);
-
-	case FUSE_NOTIFY_RETRIEVE:
-		return fuse_notify_retrieve(fc, size, cs);
-
-	case FUSE_NOTIFY_DELETE:
-		return fuse_notify_delete(fc, size, cs);
-
-	case FUSE_NOTIFY_RESEND:
-		return fuse_notify_resend(fc);
-
-	case FUSE_NOTIFY_INC_EPOCH:
-		return fuse_notify_inc_epoch(fc);
-
-	case FUSE_NOTIFY_PRUNE:
-		return fuse_notify_prune(fc, size, cs);
-
-	default:
-		return -EINVAL;
-	}
-}
-
 /* Look up request on processing list by unique ID */
 struct fuse_req *fuse_request_find(struct fuse_pqueue *fpq, u64 unique)
 {
@@ -2285,6 +1846,17 @@ static ssize_t fuse_dev_do_write(struct fuse_dev *fud,
 	 * and error contains notification code.
 	 */
 	if (!oh.unique) {
+		/*
+		 * Only allow notifications during while the connection is in an
+		 * initialized and connected state
+		 */
+		err = -EINVAL;
+		if (!fch->initialized || !fch->connected)
+			goto copy_finish;
+
+		/* Don't try to move folios (yet) */
+		cs->move_folios = false;
+
 		err = fuse_notify(fch->conn, oh.error, nbytes - sizeof(oh), cs);
 		goto copy_finish;
 	}
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index 2c4d0c53ffbb..2bf4aba256d1 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -12,7 +12,10 @@ struct fuse_conn;
 struct fuse_chan;
 struct fuse_dev;
 struct fuse_args;
+struct fuse_copy_state;
 struct file;
+struct folio;
+enum fuse_notify_code;
 
 struct fuse_chan *fuse_chan_new(void);
 struct fuse_chan *fuse_dev_chan_new(void);
@@ -28,12 +31,12 @@ void fuse_chan_io_uring_enable(struct fuse_chan *fch);
 ssize_t fuse_chan_send(struct fuse_chan *fch, struct fuse_args *args);
 int fuse_chan_send_bg(struct fuse_chan *fch, struct fuse_args *args, gfp_t gfp_flags);
 int fuse_chan_send_notify_reply(struct fuse_chan *fch, struct fuse_args *args, u64 unique);
+void fuse_chan_resend(struct fuse_chan *fch);
 
 struct fuse_forget_link *fuse_alloc_forget(void);
 void fuse_chan_queue_forget(struct fuse_chan *fch, struct fuse_forget_link *forget,
 			    u64 nodeid, u64 nlookup);
 
-
 DEFINE_FREE(fuse_chan_free, struct fuse_chan *, if (_T) fuse_chan_free(_T))
 
 void fuse_dev_install(struct fuse_dev *fud, struct fuse_chan *fch);
@@ -50,6 +53,13 @@ void fuse_chan_abort(struct fuse_chan *fch, bool abort_with_err);
 void fuse_chan_wait_aborted(struct fuse_chan *fch);
 
 void fuse_end_polls(struct fuse_conn *fc);
+int fuse_notify(struct fuse_conn *fc, enum fuse_notify_code code,
+		unsigned int size, struct fuse_copy_state *cs);
+
+int fuse_copy_one(struct fuse_copy_state *cs, void *val, unsigned size);
+int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
+		    unsigned offset, unsigned count, int zeroing);
+void fuse_copy_finish(struct fuse_copy_state *cs);
 
 #ifdef CONFIG_FUSE_IO_URING
 bool fuse_uring_enabled(void);
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index c0a2ca6cbaf0..61b054b73cb8 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -355,7 +355,6 @@ void fuse_dev_end_requests(struct list_head *head);
 
 void fuse_copy_init(struct fuse_copy_state *cs, bool write,
 			   struct iov_iter *iter);
-void fuse_copy_finish(struct fuse_copy_state *cs);
 int fuse_copy_args(struct fuse_copy_state *cs, unsigned int numargs,
 		   unsigned int argpages, struct fuse_arg *args,
 		   int zeroing);
diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
new file mode 100644
index 000000000000..f200a33f0533
--- /dev/null
+++ b/fs/fuse/notify.c
@@ -0,0 +1,434 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "dev.h"
+#include "fuse_i.h"
+#include <linux/pagemap.h>
+
+static int fuse_notify_poll(struct fuse_conn *fc, unsigned int size,
+			    struct fuse_copy_state *cs)
+{
+	struct fuse_notify_poll_wakeup_out outarg;
+	int err;
+
+	if (size != sizeof(outarg))
+		return -EINVAL;
+
+	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
+	if (err)
+		return err;
+
+	fuse_copy_finish(cs);
+	return fuse_notify_poll_wakeup(fc, &outarg);
+}
+
+static int fuse_notify_inval_inode(struct fuse_conn *fc, unsigned int size,
+				   struct fuse_copy_state *cs)
+{
+	struct fuse_notify_inval_inode_out outarg;
+	int err;
+
+	if (size != sizeof(outarg))
+		return -EINVAL;
+
+	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
+	if (err)
+		return err;
+	fuse_copy_finish(cs);
+
+	down_read(&fc->killsb);
+	err = fuse_reverse_inval_inode(fc, outarg.ino,
+				       outarg.off, outarg.len);
+	up_read(&fc->killsb);
+	return err;
+}
+
+static int fuse_notify_inval_entry(struct fuse_conn *fc, unsigned int size,
+				   struct fuse_copy_state *cs)
+{
+	struct fuse_notify_inval_entry_out outarg;
+	int err;
+	char *buf;
+	struct qstr name;
+
+	if (size < sizeof(outarg))
+		return -EINVAL;
+
+	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
+	if (err)
+		return err;
+
+	if (outarg.namelen > fc->name_max)
+		return -ENAMETOOLONG;
+
+	err = -EINVAL;
+	if (size != sizeof(outarg) + outarg.namelen + 1)
+		return -EINVAL;
+
+	buf = kzalloc(outarg.namelen + 1, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	name.name = buf;
+	name.len = outarg.namelen;
+	err = fuse_copy_one(cs, buf, outarg.namelen + 1);
+	if (err)
+		goto err;
+	fuse_copy_finish(cs);
+	buf[outarg.namelen] = 0;
+
+	down_read(&fc->killsb);
+	err = fuse_reverse_inval_entry(fc, outarg.parent, 0, &name, outarg.flags);
+	up_read(&fc->killsb);
+err:
+	kfree(buf);
+	return err;
+}
+
+static int fuse_notify_delete(struct fuse_conn *fc, unsigned int size,
+			      struct fuse_copy_state *cs)
+{
+	struct fuse_notify_delete_out outarg;
+	int err;
+	char *buf;
+	struct qstr name;
+
+	if (size < sizeof(outarg))
+		return -EINVAL;
+
+	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
+	if (err)
+		return err;
+
+	if (outarg.namelen > fc->name_max)
+		return -ENAMETOOLONG;
+
+	if (size != sizeof(outarg) + outarg.namelen + 1)
+		return -EINVAL;
+
+	buf = kzalloc(outarg.namelen + 1, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	name.name = buf;
+	name.len = outarg.namelen;
+	err = fuse_copy_one(cs, buf, outarg.namelen + 1);
+	if (err)
+		goto err;
+	fuse_copy_finish(cs);
+	buf[outarg.namelen] = 0;
+
+	down_read(&fc->killsb);
+	err = fuse_reverse_inval_entry(fc, outarg.parent, outarg.child, &name, 0);
+	up_read(&fc->killsb);
+err:
+	kfree(buf);
+	return err;
+}
+
+static int fuse_notify_store(struct fuse_conn *fc, unsigned int size,
+			     struct fuse_copy_state *cs)
+{
+	struct fuse_notify_store_out outarg;
+	struct inode *inode;
+	struct address_space *mapping;
+	u64 nodeid;
+	int err;
+	unsigned int num;
+	loff_t file_size;
+	loff_t pos;
+	loff_t end;
+
+	if (size < sizeof(outarg))
+		return -EINVAL;
+
+	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
+	if (err)
+		return err;
+
+	if (size - sizeof(outarg) != outarg.size)
+		return -EINVAL;
+
+	if (outarg.offset >= MAX_LFS_FILESIZE)
+		return -EINVAL;
+
+	nodeid = outarg.nodeid;
+	pos = outarg.offset;
+	num = min(outarg.size, MAX_LFS_FILESIZE - pos);
+
+	down_read(&fc->killsb);
+
+	err = -ENOENT;
+	inode = fuse_ilookup(fc, nodeid,  NULL);
+	if (!inode)
+		goto out_up_killsb;
+
+	mapping = inode->i_mapping;
+	file_size = i_size_read(inode);
+	end = pos + num;
+	if (end > file_size) {
+		file_size = end;
+		fuse_write_update_attr(inode, file_size, num);
+	}
+
+	while (num) {
+		struct folio *folio;
+		unsigned int folio_offset;
+		unsigned int nr_bytes;
+		pgoff_t index = pos >> PAGE_SHIFT;
+
+		folio = filemap_grab_folio(mapping, index);
+		err = PTR_ERR(folio);
+		if (IS_ERR(folio))
+			goto out_iput;
+
+		folio_offset = offset_in_folio(folio, pos);
+		nr_bytes = min(num, folio_size(folio) - folio_offset);
+
+		err = fuse_copy_folio(cs, &folio, folio_offset, nr_bytes, 0);
+		if (!folio_test_uptodate(folio) && !err && folio_offset == 0 &&
+		    (nr_bytes == folio_size(folio) || file_size == end)) {
+			folio_zero_segment(folio, nr_bytes, folio_size(folio));
+			folio_mark_uptodate(folio);
+		}
+		folio_unlock(folio);
+		folio_put(folio);
+
+		if (err)
+			goto out_iput;
+
+		pos += nr_bytes;
+		num -= nr_bytes;
+	}
+
+	err = 0;
+
+out_iput:
+	iput(inode);
+out_up_killsb:
+	up_read(&fc->killsb);
+	return err;
+}
+
+struct fuse_retrieve_args {
+	struct fuse_args_pages ap;
+	struct fuse_notify_retrieve_in inarg;
+};
+
+static void fuse_retrieve_end(struct fuse_args *args, int error)
+{
+	struct fuse_retrieve_args *ra =
+		container_of(args, typeof(*ra), ap.args);
+
+	release_pages(ra->ap.folios, ra->ap.num_folios);
+	kfree(ra);
+}
+
+static int fuse_retrieve(struct fuse_mount *fm, struct inode *inode,
+			 struct fuse_notify_retrieve_out *outarg)
+{
+	int err;
+	struct address_space *mapping = inode->i_mapping;
+	loff_t file_size;
+	unsigned int num;
+	unsigned int offset;
+	size_t total_len = 0;
+	unsigned int num_pages;
+	struct fuse_conn *fc = fm->fc;
+	struct fuse_retrieve_args *ra;
+	size_t args_size = sizeof(*ra);
+	struct fuse_args_pages *ap;
+	struct fuse_args *args;
+	loff_t pos = outarg->offset;
+
+	offset = offset_in_page(pos);
+	file_size = i_size_read(inode);
+
+	num = min(outarg->size, fc->max_write);
+	if (pos > file_size)
+		num = 0;
+	else if (num > file_size - pos)
+		num = file_size - pos;
+
+	num_pages = DIV_ROUND_UP(num + offset, PAGE_SIZE);
+	num_pages = min(num_pages, fc->max_pages);
+	num = min(num, num_pages << PAGE_SHIFT);
+
+	args_size += num_pages * (sizeof(ap->folios[0]) + sizeof(ap->descs[0]));
+
+	ra = kzalloc(args_size, GFP_KERNEL);
+	if (!ra)
+		return -ENOMEM;
+
+	ap = &ra->ap;
+	ap->folios = (void *) (ra + 1);
+	ap->descs = (void *) (ap->folios + num_pages);
+
+	args = &ap->args;
+	args->nodeid = outarg->nodeid;
+	args->opcode = FUSE_NOTIFY_REPLY;
+	args->in_numargs = 3;
+	args->in_pages = true;
+	args->end = fuse_retrieve_end;
+
+	while (num && ap->num_folios < num_pages) {
+		struct folio *folio;
+		unsigned int folio_offset;
+		unsigned int nr_bytes;
+		pgoff_t index = pos >> PAGE_SHIFT;
+
+		folio = filemap_get_folio(mapping, index);
+		if (IS_ERR(folio))
+			break;
+
+		folio_offset = offset_in_folio(folio, pos);
+		nr_bytes = min(folio_size(folio) - folio_offset, num);
+
+		ap->folios[ap->num_folios] = folio;
+		ap->descs[ap->num_folios].offset = folio_offset;
+		ap->descs[ap->num_folios].length = nr_bytes;
+		ap->num_folios++;
+
+		pos += nr_bytes;
+		num -= nr_bytes;
+		total_len += nr_bytes;
+	}
+	ra->inarg.offset = outarg->offset;
+	ra->inarg.size = total_len;
+	fuse_set_zero_arg0(args);
+	args->in_args[1].size = sizeof(ra->inarg);
+	args->in_args[1].value = &ra->inarg;
+	args->in_args[2].size = total_len;
+
+	err = fuse_simple_notify_reply(fm, args, outarg->notify_unique);
+	if (err)
+		fuse_retrieve_end(args, err);
+
+	return err;
+}
+
+static int fuse_notify_retrieve(struct fuse_conn *fc, unsigned int size,
+				struct fuse_copy_state *cs)
+{
+	struct fuse_notify_retrieve_out outarg;
+	struct fuse_mount *fm;
+	struct inode *inode;
+	u64 nodeid;
+	int err;
+
+	if (size != sizeof(outarg))
+		return -EINVAL;
+
+	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
+	if (err)
+		return err;
+
+	fuse_copy_finish(cs);
+
+	if (outarg.offset >= MAX_LFS_FILESIZE)
+		return -EINVAL;
+
+	down_read(&fc->killsb);
+	err = -ENOENT;
+	nodeid = outarg.nodeid;
+
+	inode = fuse_ilookup(fc, nodeid, &fm);
+	if (inode) {
+		err = fuse_retrieve(fm, inode, &outarg);
+		iput(inode);
+	}
+	up_read(&fc->killsb);
+
+	return err;
+}
+
+static int fuse_notify_resend(struct fuse_conn *fc)
+{
+	fuse_chan_resend(fc->chan);
+	return 0;
+}
+
+/*
+ * Increments the fuse connection epoch.  This will result of dentries from
+ * previous epochs to be invalidated.  Additionally, if inval_wq is set, a work
+ * queue is scheduled to trigger the invalidation.
+ */
+static int fuse_notify_inc_epoch(struct fuse_conn *fc)
+{
+	atomic_inc(&fc->epoch);
+	if (inval_wq)
+		schedule_work(&fc->epoch_work);
+
+	return 0;
+}
+
+static int fuse_notify_prune(struct fuse_conn *fc, unsigned int size,
+			     struct fuse_copy_state *cs)
+{
+	struct fuse_notify_prune_out outarg;
+	const unsigned int batch = 512;
+	u64 *nodeids __free(kfree) = kmalloc(sizeof(u64) * batch, GFP_KERNEL);
+	unsigned int num, i;
+	int err;
+
+	if (!nodeids)
+		return -ENOMEM;
+
+	if (size < sizeof(outarg))
+		return -EINVAL;
+
+	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
+	if (err)
+		return err;
+
+	if (size - sizeof(outarg) != outarg.count * sizeof(u64))
+		return -EINVAL;
+
+	for (; outarg.count; outarg.count -= num) {
+		num = min(batch, outarg.count);
+		err = fuse_copy_one(cs, nodeids, num * sizeof(u64));
+		if (err)
+			return err;
+
+		scoped_guard(rwsem_read, &fc->killsb) {
+			for (i = 0; i < num; i++)
+				fuse_try_prune_one_inode(fc, nodeids[i]);
+		}
+	}
+	return 0;
+}
+
+int fuse_notify(struct fuse_conn *fc, enum fuse_notify_code code,
+		unsigned int size, struct fuse_copy_state *cs)
+{
+	switch (code) {
+	case FUSE_NOTIFY_POLL:
+		return fuse_notify_poll(fc, size, cs);
+
+	case FUSE_NOTIFY_INVAL_INODE:
+		return fuse_notify_inval_inode(fc, size, cs);
+
+	case FUSE_NOTIFY_INVAL_ENTRY:
+		return fuse_notify_inval_entry(fc, size, cs);
+
+	case FUSE_NOTIFY_STORE:
+		return fuse_notify_store(fc, size, cs);
+
+	case FUSE_NOTIFY_RETRIEVE:
+		return fuse_notify_retrieve(fc, size, cs);
+
+	case FUSE_NOTIFY_DELETE:
+		return fuse_notify_delete(fc, size, cs);
+
+	case FUSE_NOTIFY_RESEND:
+		return fuse_notify_resend(fc);
+
+	case FUSE_NOTIFY_INC_EPOCH:
+		return fuse_notify_inc_epoch(fc);
+
+	case FUSE_NOTIFY_PRUNE:
+		return fuse_notify_prune(fc, size, cs);
+
+	default:
+		return -EINVAL;
+	}
+}
-- 
2.53.0

