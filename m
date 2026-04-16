Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B57439891E
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331031; cv=none; b=aCva+EhvE+YDLNQUWEQ/1ByamokxjYENgVeRVOQxeJHheZoWQp9WXeDxXrX94xS81W3h7H4nyu7lbEWLFUsX5a3B6soMrG8HRypXZuBAsVbJ6q6Z87jNoJ8fs8Ab4/h2CCMQ5guGsAg3XlQ1mkAil08b/LeJtePBjaqez/a8Z9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331031; c=relaxed/simple;
	bh=x/DSvtCyRipWNH91T3HbbeUOM89Uw//kQAjmllL4jPc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=GVb/xCKXzaEsf8QsLjVbWrJflac7HCQf2sd9EYa6z8mZ5Xe4llkEgk5Uu68fBz19PWufQaV5CFAcqlKs/Kwh8Dzx47M2OKLL8i3etAAo/NSJjl0uEWS5rlvV+Qw53wILj6ar/0IY7ksXRvNdONWllyVmxHFs3VjKfly+veUM5Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EqiXXKQo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EqiXXKQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJEDd63xzRQVhGo4HSyO9OcLIgdMyTGFGR0O6k6LKrE=;
	b=EqiXXKQoueDGerw3TqV4OrwYfccjEKM4oMmv1TxAQtsYHwXG1wR9PZETFaRBKNtcmvT+dw
	IC0FJ4jkljzYa+Acpm4w+3e5hy381uDR6YwfyFz91BOpKkHPTFJokbtv8d+j00Hbk9oYkB
	0gqgeklWgFttC2t6D0IL3VyoCQ5Qfw0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-8RViMwCCPgKWugHtgBwXbw-1; Thu, 16 Apr 2026 05:17:05 -0400
X-MC-Unique: 8RViMwCCPgKWugHtgBwXbw-1
X-Mimecast-MFC-AGG-ID: 8RViMwCCPgKWugHtgBwXbw_1776331024
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-488d3eec9bcso39712395e9.3
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331024; x=1776935824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xJEDd63xzRQVhGo4HSyO9OcLIgdMyTGFGR0O6k6LKrE=;
        b=FJZFfKd++sqQlkoE/BkBmTM9sEKMeJT/4uiYTs5E6p9nUfUE/Pau/o2ukK2ewVvjOt
         bGdWZ12Zd7l4JQhkpGeHcrIywdYZmPATRV34VqCrsu3HAGOLrzK3ruJRJbE1kOl+UEvJ
         Q/LGGsxcCs3as2TT+AYq7FnSf1/Jla0dahInl2xYCtBjKb1NsaUmebfhvXjgOnJk97zB
         qOk2z5yQr3SY3JjCfM/cEVoiR+dR3diZQrhduLJLSb4QbGwwYfPsPs+a2/+mLBHE9cKP
         5FfKezhR3vS56KTL69bZShUN9KEDMtL6erTGeG7Osn8r9oqQRAAAeQD2KBu6gPtynw3X
         +03Q==
X-Gm-Message-State: AOJu0Yx8WPpZIb1in3ziuQ1EI70FDhLLOFcYsEuzEZy7Jjs0xmJeCn3U
	WM8gmfpxSTmr0NAEvGBrZuCj36ojUan3WrQFlKZn6NZAGBBfHtw5wUmBu8Rc+OmamyZ1dLj7YnW
	Cv7TbWm5ndNyF1tAV5WlYEIO5QSKh9U3k2dgYJEWBiAfoItGH5lS3KgabucQtnpZgL3jyKNS0/l
	zmLo3hNsTu2hZ5KUXTZ0WinTi0VgtXbzl7dyldg5gBk0tH1lc=
X-Gm-Gg: AeBDieuI4yohpd7/vVGghhvQAc0t+tapWFXR9gimmIQUPCmTAWaOi/lqdFQnyqLRNXI
	R+cLd3bhlJAuRBfx8QyW3/8wxuZCF/+hNm7qrUleRnzlKJA1MgT4bW4LIeQBOfAZ4mm6PcDI3vX
	j0NYK/+2shiOlc8ep+ol/+p61YNjVAwZNPvNg85SAE87R/BrPicwIlMiOEDdnEsgepWYsh87eiy
	ZNfpL278/r0qw4WGtYY7nIsqqpsNDmqL8JdgpYI7+vPs9hRDo0jgJf9bw3tysQNQ7jU9ki9S8bR
	dgtUrDNk1VuqlQbSuOFUwDCKS7iFni1j2M0VE70Aa0drlSexYVmcj+QrmQfKv90eoDDenbbV9i6
	6G7+RZtGTH7ls6LXq+pNymRwIyjKlV67wd+ljvOKcAJIux5UZTCBGOZBzYuAFJGnLSagwjzK+1J
	uPsNHjSg==
X-Received: by 2002:a05:600c:3acf:b0:485:35a4:939f with SMTP id 5b1f17b1804b1-488d68a8275mr309195435e9.28.1776331023874;
        Thu, 16 Apr 2026 02:17:03 -0700 (PDT)
X-Received: by 2002:a05:600c:3acf:b0:485:35a4:939f with SMTP id 5b1f17b1804b1-488d68a8275mr309194905e9.28.1776331023283;
        Thu, 16 Apr 2026 02:17:03 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:02 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 02/32] fuse: add struct fuse_chan
Date: Thu, 16 Apr 2026 11:16:26 +0200
Message-ID: <20260416091658.462783-3-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 6aV7NDQkzrgOlMlbkSfCjG1wOEXI24z6LtepGbinp8A_1776331024
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The goal is to separate transport layer stuff out from struct fuse_conn,
leaving just the filesystem related members.

Add a new object referenced from fuse_conn.  This patch just implements the
allocation and freeing of this object.

Following patches will move transport related members from fuse_conn to
fuse_chan.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/cuse.c       |  7 ++++++-
 fs/fuse/dev.c        | 13 +++++++++++++
 fs/fuse/dev.h        |  7 +++++++
 fs/fuse/fuse_dev_i.h |  4 ++++
 fs/fuse/fuse_i.h     |  6 +++++-
 fs/fuse/inode.c      | 10 ++++++++--
 fs/fuse/virtio_fs.c  |  8 +++++++-
 7 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/cuse.c b/fs/fuse/cuse.c
index 174333633471..b135c3281a05 100644
--- a/fs/fuse/cuse.c
+++ b/fs/fuse/cuse.c
@@ -51,6 +51,7 @@
 #include <linux/uio.h>
 #include <linux/user_namespace.h>
 
+#include "dev.h"
 #include "fuse_i.h"
 #include "fuse_dev_i.h"
 
@@ -502,8 +503,12 @@ static int cuse_channel_open(struct inode *inode, struct file *file)
 {
 	struct fuse_dev *fud;
 	struct cuse_conn *cc;
+	struct fuse_chan *fch __free(fuse_chan_free) = fuse_chan_new();
 	int rc;
 
+	if (!fch)
+		return -ENOMEM;
+
 	/* set up cuse_conn */
 	cc = kzalloc_obj(*cc);
 	if (!cc)
@@ -514,7 +519,7 @@ static int cuse_channel_open(struct inode *inode, struct file *file)
 	 * be represented in file->f_cred->user_ns.
 	 */
 	fuse_conn_init(&cc->fc, &cc->fm, file->f_cred->user_ns,
-		       &fuse_dev_fiq_ops, NULL);
+		       &fuse_dev_fiq_ops, NULL, no_free_ptr(fch));
 
 	cc->fc.release = cuse_fc_release;
 	fud = fuse_dev_alloc_install(&cc->fc);
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index eea85eaa5e77..3e1e8ce83f1c 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -6,6 +6,7 @@
   See the file COPYING.
 */
 
+#include "dev.h"
 #include "dev_uring_i.h"
 #include "fuse_i.h"
 #include "fuse_dev_i.h"
@@ -319,6 +320,18 @@ const struct fuse_iqueue_ops fuse_dev_fiq_ops = {
 };
 EXPORT_SYMBOL_GPL(fuse_dev_fiq_ops);
 
+void fuse_chan_free(struct fuse_chan *fch)
+{
+	kfree(fch);
+}
+EXPORT_SYMBOL_GPL(fuse_chan_free);
+
+struct fuse_chan *fuse_chan_new(void)
+{
+	return kzalloc_obj(struct fuse_chan);
+}
+EXPORT_SYMBOL_GPL(fuse_chan_new);
+
 static void fuse_send_one(struct fuse_iqueue *fiq, struct fuse_req *req)
 {
 	req->in.h.len = sizeof(struct fuse_in_header) +
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index f7db15c33cf9..70e4a75e6942 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -3,7 +3,14 @@
 #ifndef _FS_FUSE_DEV_H
 #define _FS_FUSE_DEV_H
 
+#include <linux/cleanup.h>
+
 struct fuse_conn;
+struct fuse_chan;
+
+struct fuse_chan *fuse_chan_new(void);
+void fuse_chan_free(struct fuse_chan *fch);
+DEFINE_FREE(fuse_chan_free, struct fuse_chan *, if (_T) fuse_chan_free(_T))
 
 void fuse_init_server_timeout(struct fuse_conn *fc, unsigned int timeout);
 
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 910f883cd090..8d69ea8761c5 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -21,6 +21,10 @@ struct fuse_req;
 struct fuse_iqueue;
 struct fuse_forget_link;
 
+struct fuse_chan {
+	/* will move stuff from struct fuse_conn */
+};
+
 struct fuse_copy_state {
 	struct fuse_req *req;
 	struct iov_iter *iter;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 111fb6f3ebc4..deaffe245284 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -668,6 +668,9 @@ struct fuse_conn {
 	/** Input queue */
 	struct fuse_iqueue iq;
 
+	/* transport layer object */
+	struct fuse_chan *chan;
+
 	/** The next unique kernel file handle */
 	atomic64_t khctr;
 
@@ -1313,7 +1316,8 @@ void fuse_pqueue_init(struct fuse_pqueue *fpq);
  */
 void fuse_conn_init(struct fuse_conn *fc, struct fuse_mount *fm,
 		    struct user_namespace *user_ns,
-		    const struct fuse_iqueue_ops *fiq_ops, void *fiq_priv);
+		    const struct fuse_iqueue_ops *fiq_ops, void *fiq_priv,
+		    struct fuse_chan *fch);
 
 /**
  * Release reference to fuse_conn
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index db0ef19f4abe..758cefa9b9b6 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -997,7 +997,7 @@ void fuse_pqueue_init(struct fuse_pqueue *fpq)
 
 void fuse_conn_init(struct fuse_conn *fc, struct fuse_mount *fm,
 		    struct user_namespace *user_ns,
-		    const struct fuse_iqueue_ops *fiq_ops, void *fiq_priv)
+		    const struct fuse_iqueue_ops *fiq_ops, void *fiq_priv, struct fuse_chan *fch)
 {
 	memset(fc, 0, sizeof(*fc));
 	spin_lock_init(&fc->lock);
@@ -1035,6 +1035,7 @@ void fuse_conn_init(struct fuse_conn *fc, struct fuse_mount *fm,
 	INIT_LIST_HEAD(&fc->mounts);
 	list_add(&fm->fc_entry, &fc->mounts);
 	fm->fc = fc;
+	fc->chan = fch;
 }
 EXPORT_SYMBOL_GPL(fuse_conn_init);
 
@@ -1043,6 +1044,7 @@ static void delayed_release(struct rcu_head *p)
 	struct fuse_conn *fc = container_of(p, struct fuse_conn, rcu);
 
 	fuse_uring_destruct(fc);
+	fuse_chan_free(fc->chan);
 
 	put_user_ns(fc->user_ns);
 	fc->release(fc);
@@ -1982,8 +1984,12 @@ static int fuse_get_tree(struct fs_context *fsc)
 	struct fuse_conn *fc;
 	struct fuse_mount *fm;
 	struct super_block *sb;
+	struct fuse_chan *fch __free(fuse_chan_free) = fuse_chan_new();
 	int err;
 
+	if (!fch)
+		return -ENOMEM;
+
 	fc = kmalloc_obj(*fc);
 	if (!fc)
 		return -ENOMEM;
@@ -1994,7 +2000,7 @@ static int fuse_get_tree(struct fs_context *fsc)
 		return -ENOMEM;
 	}
 
-	fuse_conn_init(fc, fm, fsc->user_ns, &fuse_dev_fiq_ops, NULL);
+	fuse_conn_init(fc, fm, fsc->user_ns, &fuse_dev_fiq_ops, NULL, no_free_ptr(fch));
 	fc->release = fuse_free_conn;
 
 	fsc->s_fs_info = fm;
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 12300651a0f1..f6d41b760210 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -19,6 +19,7 @@
 #include <linux/highmem.h>
 #include <linux/cleanup.h>
 #include <linux/uio.h>
+#include "dev.h"
 #include "fuse_i.h"
 #include "fuse_dev_i.h"
 
@@ -1683,8 +1684,12 @@ static int virtio_fs_get_tree(struct fs_context *fsc)
 	struct fuse_conn *fc = NULL;
 	struct fuse_mount *fm;
 	unsigned int virtqueue_size;
+	struct fuse_chan *fch __free(fuse_chan_free) = fuse_chan_new();
 	int err = -EIO;
 
+	if (!fch)
+		return -ENOMEM;
+
 	if (!fsc->source)
 		return invalf(fsc, "No source specified");
 
@@ -1711,7 +1716,8 @@ static int virtio_fs_get_tree(struct fs_context *fsc)
 	if (!fm)
 		goto out_err;
 
-	fuse_conn_init(fc, fm, fsc->user_ns, &virtio_fs_fiq_ops, fs);
+	fuse_conn_init(fc, fm, fsc->user_ns, &virtio_fs_fiq_ops, fs, no_free_ptr(fch));
+
 	fc->release = fuse_free_conn;
 	fc->delete_stale = true;
 	fc->auto_submounts = true;
-- 
2.53.0

