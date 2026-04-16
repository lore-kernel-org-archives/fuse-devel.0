Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DE73822A5
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331051; cv=none; b=Yxx8WQeCTAGU7MoON3oY8/D0wX+LFw4Wvx/81phRT2FyRFo2K/zi8l+JLU0eIFhoyZ4gLkGkdc7gnMwpvlGBtcRp7O/PtzpHF7yd9roiT1uvM2C0g3XEaU2p6r0idJ4E7RznuKXtOzCjsliR3n9RUiTJmDm1EIn4yR624gvHXOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331051; c=relaxed/simple;
	bh=c0dMYzmq5pnvjSxva5+60ky2nykIecRdbCogy2hwyIM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ju9xsSSNSCDrmDaKbmhtk5p8WR8JgnHyRa0mx2WKDXpimB2agRWBj05XGT7wLn/uk08lWrO3HewspPY2ZC++ERXSbdAJOjSuLGlwm16HXRB17DA2lboQjSwtE82Qxvf8aPDwB3WJev6KtBDGiWM6vkYuANn9eEKFW51G4Uxe6+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X2JUg84Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X2JUg84Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qy6H3T7xA/0LZdjm0TMYCdJoyRUTNtcMvJLt8cLLcKo=;
	b=X2JUg84QY4mOUQiJAFGeLhDT15N5+TPdGpS1Ke9C9inWJa8CyKZwYZXDtiYXweotwZpBIv
	HSt1j68mujNri30c4COuy0GxfR4XeW8sS8gQgpzQxLeFeGv/E6wtp4riqMsP89QYpONUYW
	rf1f9ayKVBLhIcqcwjG0fMKiOEykJMw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-O2DDJ2DJOTWOJuRWLiZ_jQ-1; Thu, 16 Apr 2026 05:17:25 -0400
X-MC-Unique: O2DDJ2DJOTWOJuRWLiZ_jQ-1
X-Mimecast-MFC-AGG-ID: O2DDJ2DJOTWOJuRWLiZ_jQ_1776331044
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43efc93e4f6so407204f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331043; x=1776935843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qy6H3T7xA/0LZdjm0TMYCdJoyRUTNtcMvJLt8cLLcKo=;
        b=iiFNl4ecHkQYeWhXsZQEufPhuySograG7iDDKdIp3UQMTOUTV7Z/txZ1/FxrTIDO/s
         OkrHtFU43jHk/yzNCDLGYd0JDhd0d1sHLbkCQGvIwoHLOTEerbUP1Ery53d8W3RqZxmq
         ZCg/YoUPbmECD5ksyKDfE/VmV4EEr1L3jcEIXH5G0FooQIq/7UmyRn4RTpkn5ViiW3qh
         6Yfv4I43PZi8UOXGzHBH4hGhFGQkGIb3279vr9Sxa8fqYVGwPNY3ADeo5z4MhXyCTtZ9
         lxATdeNmt5PKPHwl01BpwZ3LZXb6Ey1DAoGiQnbEA8U/HiBQdC6f1bpltm0eDvbOrWSW
         udTg==
X-Gm-Message-State: AOJu0YwpdseMmg1O9zkfekKGOcrqPHf4mKoj0g8RxKNnpkeafKouTRAw
	Ks/40xEPmOqVn3eInRgQDiuY/7wQ5x1f4FiKJMlkr1JLZ836KIHDAJgzggiNerkhOY1N8fOH4e7
	8PNT1pxE7xzJD4q5khK5XVyNvmWlrTvIT68MUYo2xOXQ6OYFVKQLg1QrpBINJMACFRRbByR6l1D
	BLcnYUWP1PAKxPneTrqxtf222GTCFOBESOeFkvfY1fxQJD1a4=
X-Gm-Gg: AeBDieuhi9KbOCxr3r5wsgmXg/7ZW8Qgip13iNFLpy84qRG5yJCTZE8cNInfl8+Gh5K
	ebzxuB8iRVrvkiIYPDsqDsIR8jKc2BCJKVifcY5VeTvPsJowKoQCirzCM2pDN5lRrZgHPIusvOI
	2PeJn7TGRVuZeaQGnditD3oaFAalf5cUK9cJPSJ81xOk2A9BloOuSMo7pwN1BUOGWxEZ+x89bP6
	CIGW4CG40IcuABh4jbabo3qo6l1lNxYwuSkfX+NNm8z14159q+2ilnHRCMXP0Z6NdVU8oNAfnbP
	EyuP1F7JV2Nzd4YpecCUQLuLzVMXzSHAsU0xyvRTC8BrMvLPSyj1E2bo/8McbPK36LVkw3pv+ia
	cT49/zNt+XNmMaW+ph1Z20yN745DdkliZ7xsbPryccJft6jZb+ax2fPZHcvbbyKYnAEwf2ltNwH
	8gZb8XXw==
X-Received: by 2002:a05:600c:c088:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-488d67bf744mr249648765e9.4.1776331043421;
        Thu, 16 Apr 2026 02:17:23 -0700 (PDT)
X-Received: by 2002:a05:600c:c088:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-488d67bf744mr249648345e9.4.1776331042821;
        Thu, 16 Apr 2026 02:17:22 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:22 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 15/32] fuse: move forget related struct and helpers
Date: Thu, 16 Apr 2026 11:16:39 +0200
Message-ID: <20260416091658.462783-16-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: V9m6T9TktQZeajZEqGP1GJfs5Uzv_guEwLS_xhNfquE_1776331044
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Move:
 - struct fuse_forget_link to fuse_dev_i.h
 - fuse_alloc_forget() to dev.c/dev.h

Rename:
 - fuse_queue_forget -> fuse_chan_queue_forget

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.c        | 11 ++++++++---
 fs/fuse/dev.h        |  5 +++++
 fs/fuse/dir.c        |  9 +++++----
 fs/fuse/fuse_dev_i.h |  8 +++++++-
 fs/fuse/fuse_i.h     | 14 +-------------
 fs/fuse/inode.c      | 11 +++--------
 6 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 3858f6e59925..58cfd0b1fd6f 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -243,6 +243,11 @@ __releases(fiq->lock)
 	spin_unlock(&fiq->lock);
 }
 
+struct fuse_forget_link *fuse_alloc_forget(void)
+{
+	return kzalloc_obj(struct fuse_forget_link, GFP_KERNEL_ACCOUNT);
+}
+
 void fuse_dev_queue_forget(struct fuse_iqueue *fiq,
 			   struct fuse_forget_link *forget)
 {
@@ -550,10 +555,10 @@ static void fuse_send_one(struct fuse_iqueue *fiq, struct fuse_req *req)
 	fiq->ops->send_req(fiq, req);
 }
 
-void fuse_queue_forget(struct fuse_conn *fc, struct fuse_forget_link *forget,
-		       u64 nodeid, u64 nlookup)
+void fuse_chan_queue_forget(struct fuse_chan *fch, struct fuse_forget_link *forget,
+			    u64 nodeid, u64 nlookup)
 {
-	struct fuse_iqueue *fiq = &fc->chan->iq;
+	struct fuse_iqueue *fiq = &fch->iq;
 
 	forget->forget_one.nodeid = nodeid;
 	forget->forget_one.nlookup = nlookup;
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index 7994f5290252..1d3d2e0c9b91 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -25,6 +25,11 @@ void fuse_chan_set_fc(struct fuse_chan *fch, struct fuse_conn *fc);
 void fuse_chan_set_initialized(struct fuse_chan *fch);
 void fuse_chan_io_uring_enable(struct fuse_chan *fch);
 
+struct fuse_forget_link *fuse_alloc_forget(void);
+void fuse_chan_queue_forget(struct fuse_chan *fch, struct fuse_forget_link *forget,
+			    u64 nodeid, u64 nlookup);
+
+
 DEFINE_FREE(fuse_chan_free, struct fuse_chan *, if (_T) fuse_chan_free(_T))
 
 void fuse_dev_install(struct fuse_dev *fud, struct fuse_conn *fc);
diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index b658b6baf72f..f7443ca37e35 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -6,6 +6,7 @@
   See the file COPYING.
 */
 
+#include "dev.h"
 #include "fuse_i.h"
 
 #include <linux/pagemap.h>
@@ -430,7 +431,7 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 			fi = get_fuse_inode(inode);
 			if (outarg.nodeid != get_node_id(inode) ||
 			    (bool) IS_AUTOMOUNT(inode) != (bool) (outarg.attr.flags & FUSE_ATTR_SUBMOUNT)) {
-				fuse_queue_forget(fm->fc, forget,
+				fuse_chan_queue_forget(fm->fc->chan, forget,
 						  outarg.nodeid, 1);
 				goto invalid;
 			}
@@ -593,7 +594,7 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 			   attr_version, evict_ctr);
 	err = -ENOMEM;
 	if (!*inode) {
-		fuse_queue_forget(fm->fc, forget, outarg->nodeid, 1);
+		fuse_chan_queue_forget(fm->fc->chan, forget, outarg->nodeid, 1);
 		goto out;
 	}
 	err = 0;
@@ -894,7 +895,7 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	if (!inode) {
 		flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
 		fuse_sync_release(NULL, ff, flags);
-		fuse_queue_forget(fm->fc, forget, outentry.nodeid, 1);
+		fuse_chan_queue_forget(fm->fc->chan, forget, outentry.nodeid, 1);
 		err = -ENOMEM;
 		goto out_err;
 	}
@@ -1019,7 +1020,7 @@ static struct dentry *create_new_entry(struct mnt_idmap *idmap, struct fuse_moun
 	inode = fuse_iget(dir->i_sb, outarg.nodeid, outarg.generation,
 			  &outarg.attr, ATTR_TIMEOUT(&outarg), 0, 0);
 	if (!inode) {
-		fuse_queue_forget(fm->fc, forget, outarg.nodeid, 1);
+		fuse_chan_queue_forget(fm->fc->chan, forget, outarg.nodeid, 1);
 		return ERR_PTR(-ENOMEM);
 	}
 	kfree(forget);
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index f20a28448e55..ef72159eb558 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -6,6 +6,7 @@
 #ifndef _FS_FUSE_DEV_I_H
 #define _FS_FUSE_DEV_I_H
 
+#include <linux/fuse.h>
 #include <linux/types.h>
 
 /* Ordinary requests have even IDs, while interrupts IDs are odd */
@@ -18,7 +19,6 @@ struct fuse_arg;
 struct fuse_args;
 struct fuse_pqueue;
 struct fuse_iqueue;
-struct fuse_forget_link;
 
 /**
  * Request flags
@@ -106,6 +106,12 @@ struct fuse_req {
 	unsigned long create_time;
 };
 
+/* One forget request */
+struct fuse_forget_link {
+	struct fuse_forget_one forget_one;
+	struct fuse_forget_link *next;
+};
+
 /**
  * Input queue callbacks
  *
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 18fa729bfef2..a0d120057ddb 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -68,11 +68,7 @@ extern struct mutex fuse_mutex;
 extern unsigned int max_user_bgreq;
 extern unsigned int max_user_congthresh;
 
-/* One forget request */
-struct fuse_forget_link {
-	struct fuse_forget_one forget_one;
-	struct fuse_forget_link *next;
-};
+struct fuse_forget_link;
 
 /* Submount lookup tracking */
 struct fuse_submount_lookup {
@@ -883,14 +879,6 @@ struct inode *fuse_iget(struct super_block *sb, u64 nodeid,
 int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name,
 		     struct fuse_entry_out *outarg, struct inode **inode);
 
-/**
- * Send FORGET command
- */
-void fuse_queue_forget(struct fuse_conn *fc, struct fuse_forget_link *forget,
-		       u64 nodeid, u64 nlookup);
-
-struct fuse_forget_link *fuse_alloc_forget(void);
-
 /*
  * Initialize READ or READDIR request
  */
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 507b50b0d631..85088b0671a9 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -66,11 +66,6 @@ MODULE_PARM_DESC(max_user_congthresh,
 static struct file_system_type fuseblk_fs_type;
 #endif
 
-struct fuse_forget_link *fuse_alloc_forget(void)
-{
-	return kzalloc_obj(struct fuse_forget_link, GFP_KERNEL_ACCOUNT);
-}
-
 static struct fuse_submount_lookup *fuse_alloc_submount_lookup(void)
 {
 	struct fuse_submount_lookup *sl;
@@ -144,7 +139,7 @@ static void fuse_cleanup_submount_lookup(struct fuse_conn *fc,
 	if (!refcount_dec_and_test(&sl->count))
 		return;
 
-	fuse_queue_forget(fc, sl->forget, sl->nodeid, 1);
+	fuse_chan_queue_forget(fc->chan, sl->forget, sl->nodeid, 1);
 	sl->forget = NULL;
 	kfree(sl);
 }
@@ -167,8 +162,8 @@ static void fuse_evict_inode(struct inode *inode)
 		if (FUSE_IS_DAX(inode))
 			fuse_dax_inode_cleanup(inode);
 		if (fi->nlookup) {
-			fuse_queue_forget(fc, fi->forget, fi->nodeid,
-					  fi->nlookup);
+			fuse_chan_queue_forget(fc->chan, fi->forget, fi->nodeid,
+					       fi->nlookup);
 			fi->forget = NULL;
 		}
 
-- 
2.53.0

