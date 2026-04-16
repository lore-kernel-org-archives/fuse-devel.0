Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228E63822A5
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331071; cv=none; b=gss5CV5IXmfHWaOXnVBHHnvwxbP0gO8bKS/PdqLbn+vruP4n5wVLpap+yC619s+FHAi7ATv25U1mgujxzuTRloOwMLdSW/VKju/T5+aLcIvYMhA7AKePm2ONdlh3TJ6l3SkI7PUgAgYLGA82R4Cgbp8+kn7xMaaWG9ytFnmeBSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331071; c=relaxed/simple;
	bh=6aq+35aRrZ6QxuOOmIX52Xt9QkA2VAkLyDFJbLEmM3Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=pfAgQOnNgzCZ7clUfs4oMYen4r6AemhsUNgqLGYHWaegFcYxTf0GKHt1dHL3BmCAsoGoxcVDzwKHx6ikR/R/+MYkTgQ19GB139gsbegBMhhE6l3HYgUCaz1AvD9toXz8wAWlm2VNP9xEdW1lB27Ui4tmoezYsRuDfAcMHi46WBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ckI+zNYL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ckI+zNYL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ymJZgpLwChgpXN8JIVAU1Eke+0GsP2IQmalxVfv/pfc=;
	b=ckI+zNYLiUXqaCTdTy43CVYubwMRVIuUSnOCehpeNA6i/Jhgxv7UCexpJZt7Du1s2Cn66+
	Z3vos0GqMo9T/Z/WSH5UOnnQUhrpGhYSqy4KR4KjnSctlDsGI8gclo/+uxZ7KYox0zwaf4
	RWElRGitOYJSdyb+LBjIMrTHqRtssTY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-4oVVbw64MnWQePXzIrKAgA-1; Thu, 16 Apr 2026 05:17:44 -0400
X-MC-Unique: 4oVVbw64MnWQePXzIrKAgA-1
X-Mimecast-MFC-AGG-ID: 4oVVbw64MnWQePXzIrKAgA_1776331063
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-488c2aa6becso62662235e9.2
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331063; x=1776935863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ymJZgpLwChgpXN8JIVAU1Eke+0GsP2IQmalxVfv/pfc=;
        b=Z7IO4EhqxFRi+Rx1m24vHiom0J0Mbm8jjZ6lZWuTKxYLF8YfasRpztpjcU6AKXVDKR
         6+JVmIdpxuIAqw+Lg8/JoJd/eW/8h28IsF9hjnuYe/GaSncoBtshAI3iXl8p4QPaKms+
         UdftdmoEBVu3o6sx0iLmusnaY9Z7q5rrTQWkD0/Hf84yIUZi5ot+WHlNdTdPYuSCGXP7
         oA0OYHB5D6GvAAeQwTDEMnKorbX0lo8fOSHQjr5HE5wNpcababtAw/isHdbbAC7I8ygm
         e5vqG0ZOCx7ry1NpZclgv1ySZmVyIQyxp9P6NpTLF+7VPOyiH/mRyCxj4E8n+fYag2aJ
         c6mA==
X-Gm-Message-State: AOJu0Yz2ILc/QtREJ2jFMfBAKhCzxMBe3RunVg2TUqgJuzSj7c7Y3Nsh
	ojD/B48+33uETcWn347Ts+Pr+5uCF2CptVRND94xyFHWVFQmgcjGRy132onAWR5H+fwkXEayjTA
	R2PofG0bqcUK1YqMHv2g7ouUshRHZjod3sGhwujzvWpSW5LhvML2ypTRDbLv5tAc/gmRseydSLD
	5WsREAmJmd9pSgfH4cYjZfBLvgVTb5+2Z6fCBsXx4g5bCnQ7g=
X-Gm-Gg: AeBDieuwQECpt1fAJAO5frslpCrhZCNpZCwByjNThMONHjI1COcevUDsWsFnZ1Hazkg
	lcIu9CeLsJj+14L98feZ82aimJnDHxR6MMBSBG5rQgkmlVktVW70h+HDrPH4UPE//fFlaKLNkSA
	wyOa90zWRpuDdDyPc4MqdPy7SfIsfQeVIZWnbVp9dR37pIx0ZeWcfeorXtwN01lxHL1Jc1yrbe3
	WEbkDh1YIGVUrvkTzchuHiGNs4fiHH9DRqZdWYRp5BowzxuHmXEdmh+DOTJZfH4vGH1OFmWflt2
	x9I+h8xHv7hJmFoz8zhdmEdwp0svdv95k0Q76YCE6v4JURScJLyWGrnoKCDtU0A3J61DX+QLQg4
	zh62itC/Wa3vEQFguCTaz3WxZ44uuReLqtmXybH03PLtYge4jrEFG4ZLXjx8Y1oebFSOyUsPkU7
	swVF6bYg==
X-Received: by 2002:a05:600c:c0c8:b0:488:b749:8482 with SMTP id 5b1f17b1804b1-488d67bbc13mr260607965e9.4.1776331062939;
        Thu, 16 Apr 2026 02:17:42 -0700 (PDT)
X-Received: by 2002:a05:600c:c0c8:b0:488:b749:8482 with SMTP id 5b1f17b1804b1-488d67bbc13mr260607605e9.4.1776331062377;
        Thu, 16 Apr 2026 02:17:42 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:41 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 30/32] fuse: remove #include "fuse_i.h" from dev.c and dev_uring.c
Date: Thu, 16 Apr 2026 11:16:54 +0200
Message-ID: <20260416091658.462783-31-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: YyZGlTQ8vXHLXav3FjvYnCylywpO3lggBEK_Ob97FH8_1776331063
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Move a couple of function declarations from fuse_i.h to dev.h and
fuse_dev_i.h.

Add fuse_conn_get_id() helper that retrieves the connection ID (s_dev) from
fuse_conn.

With the exception of cuse.c, virtio_fs.c and trace.c source files now
either include fuse_i.h or fuse_dev_i/dev_uring_i.h but not both.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/backing.c    |  1 +
 fs/fuse/dev.c        |  5 ++---
 fs/fuse/dev.h        | 26 ++++++++++++++++++++++++++
 fs/fuse/dev_uring.c  |  3 +--
 fs/fuse/fuse_dev_i.h |  7 +++++++
 fs/fuse/fuse_i.h     | 28 ----------------------------
 fs/fuse/inode.c      |  5 +++++
 7 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index d95dfa48483f..3d3f49c2dd42 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2023 CTERA Networks.
  */
 
+#include "dev.h"
 #include "fuse_i.h"
 
 #include <linux/file.h>
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5ebd6f3e0fe4..d6cd066a3fff 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -7,9 +7,8 @@
 */
 
 #include "dev.h"
+#include "args.h"
 #include "dev_uring_i.h"
-#include "fuse_i.h"
-#include "fuse_dev_i.h"
 
 #include <linux/init.h>
 #include <linux/module.h>
@@ -2336,7 +2335,7 @@ static void fuse_dev_show_fdinfo(struct seq_file *seq, struct file *file)
 	if (!fud)
 		return;
 
-	seq_printf(seq, "fuse_connection:\t%u\n", fud->chan->conn->dev);
+	seq_printf(seq, "fuse_connection:\t%u\n", fuse_conn_get_id(fud->chan->conn));
 }
 #endif
 
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index 6437331058d9..aed69fd14c41 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -13,6 +13,7 @@ struct fuse_chan;
 struct fuse_dev;
 struct fuse_args;
 struct fuse_copy_state;
+struct fuse_backing_map;
 struct file;
 struct folio;
 enum fuse_notify_code;
@@ -45,6 +46,16 @@ void fuse_chan_queue_forget(struct fuse_chan *fch, struct fuse_forget_link *forg
 
 DEFINE_FREE(fuse_chan_free, struct fuse_chan *, if (_T) fuse_chan_free(_T))
 
+/**
+ * Initialize the client device
+ */
+int fuse_dev_init(void);
+
+/**
+ * Cleanup the client device
+ */
+void fuse_dev_cleanup(void);
+
 void fuse_dev_install(struct fuse_dev *fud, struct fuse_chan *fch);
 bool fuse_dev_verify(struct fuse_dev *fud, struct fuse_chan *fch);
 void fuse_dev_put(struct fuse_dev *fud);
@@ -58,10 +69,25 @@ void fuse_init_server_timeout(struct fuse_chan *fch, unsigned int timeout);
 void fuse_chan_abort(struct fuse_chan *fch, bool abort_with_err);
 void fuse_chan_wait_aborted(struct fuse_chan *fch);
 
+/**
+ * Acquire reference to fuse_conn
+ */
+struct fuse_conn *fuse_conn_get(struct fuse_conn *fc);
+
+/**
+ * Release reference to fuse_conn
+ */
+void fuse_conn_put(struct fuse_conn *fc);
+
+dev_t fuse_conn_get_id(struct fuse_conn *fc);
+
 void fuse_end_polls(struct fuse_conn *fc);
 int fuse_notify(struct fuse_conn *fc, enum fuse_notify_code code,
 		unsigned int size, struct fuse_copy_state *cs);
 
+int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map);
+int fuse_backing_close(struct fuse_conn *fc, int backing_id);
+
 int fuse_copy_one(struct fuse_copy_state *cs, void *val, unsigned size);
 int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
 		    unsigned offset, unsigned count, int zeroing);
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 64883cf94ab4..5abf447e9710 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -5,9 +5,8 @@
  */
 
 #include "dev.h"
-#include "fuse_i.h"
+#include "args.h"
 #include "dev_uring_i.h"
-#include "fuse_dev_i.h"
 #include "fuse_trace.h"
 
 #include <linux/fs.h>
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 3acf73be3990..3d945b20f8d5 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -364,6 +364,11 @@ void fuse_dev_end_requests(struct list_head *head);
 
 void fuse_copy_init(struct fuse_copy_state *cs, bool write,
 			   struct iov_iter *iter);
+/**
+ * Return the number of bytes in an arguments list
+ */
+unsigned int fuse_len_args(unsigned int numargs, struct fuse_arg *args);
+
 int fuse_copy_args(struct fuse_copy_state *cs, unsigned int numargs,
 		   unsigned int argpages, struct fuse_arg *args,
 		   int zeroing);
@@ -389,6 +394,8 @@ u64 fuse_get_unique(struct fuse_iqueue *fiq);
 struct fuse_dev *fuse_dev_alloc_install(struct fuse_chan *fch);
 struct fuse_dev *fuse_dev_alloc(void);
 
+int fuse_dev_release(struct inode *inode, struct file *file);
+
 /**
  * Initialize the fuse processing queue
  */
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index f7a9c7cedd39..8c58a030d296 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -907,16 +907,6 @@ void fuse_change_attributes_common(struct inode *inode, struct fuse_attr *attr,
 
 u32 fuse_get_cache_mask(struct inode *inode);
 
-/**
- * Initialize the client device
- */
-int fuse_dev_init(void);
-
-/**
- * Cleanup the client device
- */
-void fuse_dev_cleanup(void);
-
 int fuse_ctl_init(void);
 void __exit fuse_ctl_cleanup(void);
 
@@ -971,22 +961,12 @@ u64 fuse_time_to_jiffies(u64 sec, u32 nsec);
 
 void fuse_change_entry_timeout(struct dentry *entry, struct fuse_entry_out *o);
 
-/**
- * Acquire reference to fuse_conn
- */
-struct fuse_conn *fuse_conn_get(struct fuse_conn *fc);
-
 /**
  * Initialize fuse_conn
  */
 void fuse_conn_init(struct fuse_conn *fc, struct fuse_mount *fm,
 		    struct user_namespace *user_ns, struct fuse_chan *fch);
 
-/**
- * Release reference to fuse_conn
- */
-void fuse_conn_put(struct fuse_conn *fc);
-
 int fuse_send_init(struct fuse_mount *fm);
 
 /**
@@ -1105,7 +1085,6 @@ long fuse_do_ioctl(struct file *file, unsigned int cmd, unsigned long arg,
 long fuse_ioctl_common(struct file *file, unsigned int cmd,
 		       unsigned long arg, unsigned int flags);
 __poll_t fuse_file_poll(struct file *file, poll_table *wait);
-int fuse_dev_release(struct inode *inode, struct file *file);
 
 bool fuse_write_update_attr(struct inode *inode, loff_t pos, ssize_t written);
 
@@ -1136,11 +1115,6 @@ int fuse_set_acl(struct mnt_idmap *, struct dentry *dentry,
 /* readdir.c */
 int fuse_readdir(struct file *file, struct dir_context *ctx);
 
-/**
- * Return the number of bytes in an arguments list
- */
-unsigned int fuse_len_args(unsigned int numargs, struct fuse_arg *args);
-
 void fuse_free_conn(struct fuse_conn *fc);
 
 /* dax.c */
@@ -1208,8 +1182,6 @@ static inline struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc,
 
 void fuse_backing_files_init(struct fuse_conn *fc);
 void fuse_backing_files_free(struct fuse_conn *fc);
-int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map);
-int fuse_backing_close(struct fuse_conn *fc, int backing_id);
 
 /* passthrough.c */
 static inline struct fuse_backing *fuse_inode_backing(struct fuse_inode *fi)
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 38f379374067..33009227e91d 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1031,6 +1031,11 @@ struct fuse_conn *fuse_conn_get(struct fuse_conn *fc)
 }
 EXPORT_SYMBOL_GPL(fuse_conn_get);
 
+dev_t fuse_conn_get_id(struct fuse_conn *fc)
+{
+	return fc->dev;
+}
+
 static struct inode *fuse_get_root_inode(struct super_block *sb, unsigned int mode)
 {
 	struct fuse_attr attr;
-- 
2.53.0

