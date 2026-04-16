Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2040399359
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331031; cv=none; b=GxC4RFHDPof4aIwaLxcrf0DIGER6ahthnE9L/Q6dAAEWMMN/4ATvPkG0tK+LShZmKxtdGFITKAClIh3l4+1yX6/kvQoTeD4yUEDCSsst+K4uxUA4KOqixyGgACuJ/ZJ5wAsz1J8udxi3cp3YiFElOBZaum9596y9n0jSVB9GQqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331031; c=relaxed/simple;
	bh=tL5MxyhgKdQPEnYWXkY90yFm7j9GPJZG2GSBvkIyfvo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=YykAl4r8QRNgShzfPkLZ85ZzN9rhJhvMtUOgQBgpojsCpMBTuGNufi91aDU9bi1E5qsJvQX3sX/Tk44Wxikx6/pDB6t6ZNr6eL6ero5aQZMoINspyYThlO4vNqvvwPyWW/xNFQX8FQFPbakZXRMekKR7t/87e6NhMUJLAZ50kDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SuE0Xulc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SuE0Xulc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FAkHRdmnkBQcpKxRU1yEeGr27CWK7oxfI84jM0J6hw=;
	b=SuE0Xulc3uhXh+2ON7BDOqwKNsqIAYmGpPx45JGEXTs61S6fXAdtJ35vYfTaBKhI5rvvPG
	M/p3UQFChBz1Nd91Q7rkc7EGq31tlQPH0gJDB/RtlHMK1uHsGqkEj+8xY6B04abJxA3LRJ
	PYTScwrMNmGEWpVLSe0hwMefWbpoLm8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-PxmWhZvvNrujW49gsV0RWw-1; Thu, 16 Apr 2026 05:17:04 -0400
X-MC-Unique: PxmWhZvvNrujW49gsV0RWw-1
X-Mimecast-MFC-AGG-ID: PxmWhZvvNrujW49gsV0RWw_1776331023
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-488c2a4e257so50453725e9.3
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331023; x=1776935823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7FAkHRdmnkBQcpKxRU1yEeGr27CWK7oxfI84jM0J6hw=;
        b=OSxlEo2Zg3LCYsnd2Gqbso4bc673YyTqifb80752SeGzN6ec/rWlAklRxtAFfo/oOE
         3qaiDPVkUUmZkPfhJoo87x6BrGg50SUoDJWxMUFnMekvWdvAcCX98vCUhi/7YnrDz6I+
         OJdS6+T8E8hX8kxUyKL71BaiijT+NC06gil2SJPku5/bvSwjU6cNYZ8FDTO6T5UtEwiL
         FpZlDysfE8tB2Jm9wrl6tm7meSX4bzbMNAbh5QV5q9ucKmR+AA6WBV+p4vrigqMhyZ3f
         Z+0p8XMMxpsaaxRpxO2GHmv1a+E5XnlAYBusK+TY9YNjOisim99VqqsgVeVANjeTZ9CK
         HrRg==
X-Gm-Message-State: AOJu0YxPeANghHmULVmNFA90Pr3W6ENuCAN8H4Ix9r/YpKemMdtUTTSF
	qqSJz9AwDcyuTPSLBjBGBR6g9Ba4JhAjZ1qJY6bJqSUFwzpqiyWlUwQxCPMeC9z8/L3ZhsvUmKj
	sYMCfC/Smao3T+jHQPeNaT62jGWIyrnXxNOK3OX4n3zwU3T/IX4aHkJVNMliIZ6+mqVFKdEolgm
	WL4/G2EcH/NPRjfSpzACyPuJX+SkOt6we7nLmqN5ureBPmXGY=
X-Gm-Gg: AeBDievBI00ulBhBHWhfiwq+j3BdjHr8WtMYb3nlHrWMjD7aCUa8f1RvnTpPS8eEuyZ
	Yo6iKKspphtfWkFfZqQ9qiQ3qnJvPMCbKOqKWWiFxIVYdyJ/nO7CWo6swJBSAySvXEiOP/qgMjc
	ND+cHOtCu9R2JwPLj0nDOBQPy/j6ek0PPjOhH05AL1YXcM4TOiiTxVAYA/GuHpGZyFeAQI7TnmO
	Yd28oH61lNu9HrVgQi+gP9T2gEgRR/Vvy7/7qHcSCHjkflN9MMvEK8a//9dFrY10h0AeV1ps3J9
	zMsssXRw6VDTMjEpFp7hNen0B6Uv4XYY3q1IOgUZvJKfpz0LKg6ZnSdSMjxlv2ZFP42erQ7zGV9
	NK2HkIBmHrBKh3ERN2tnqZRg5hNSbp7yYi6/TGhO9YAjRqUFTKGh/HXC3Bu8EeTW1gqjtwtDnQC
	Jg6ouYDA==
X-Received: by 2002:a05:600c:474c:b0:488:a2ac:a340 with SMTP id 5b1f17b1804b1-488d67e7212mr304714275e9.12.1776331022786;
        Thu, 16 Apr 2026 02:17:02 -0700 (PDT)
X-Received: by 2002:a05:600c:474c:b0:488:a2ac:a340 with SMTP id 5b1f17b1804b1-488d67e7212mr304713695e9.12.1776331022117;
        Thu, 16 Apr 2026 02:17:02 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:01 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 01/32] fuse: move request timeout code to a new source file
Date: Thu, 16 Apr 2026 11:16:25 +0200
Message-ID: <20260416091658.462783-2-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 3ee1ynwejSopnFR64pkqzjzTA1lys28dSZTqfXBf3pQ_1776331023
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This marks the first step in cleanly separating the transport layer from
the filesystem layer.

Add "dev.h", which will contain the interface definition for the transport
layer.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/Makefile      |   2 +-
 fs/fuse/dev.c         |  94 --------------------------
 fs/fuse/dev.h         |  10 +++
 fs/fuse/fuse_i.h      |  19 ------
 fs/fuse/inode.c       |  33 +---------
 fs/fuse/req_timeout.c | 150 ++++++++++++++++++++++++++++++++++++++++++
 fs/fuse/sysctl.c      |   1 +
 fs/fuse/sysctl.h      |   9 +++
 8 files changed, 173 insertions(+), 145 deletions(-)
 create mode 100644 fs/fuse/dev.h
 create mode 100644 fs/fuse/req_timeout.c
 create mode 100644 fs/fuse/sysctl.h

diff --git a/fs/fuse/Makefile b/fs/fuse/Makefile
index 22ad9538dfc4..30dd1bee931d 100644
--- a/fs/fuse/Makefile
+++ b/fs/fuse/Makefile
@@ -11,7 +11,7 @@ obj-$(CONFIG_CUSE) += cuse.o
 obj-$(CONFIG_VIRTIO_FS) += virtiofs.o
 
 fuse-y := trace.o	# put trace.o first so we see ftrace errors sooner
-fuse-y += dev.o dir.o file.o inode.o control.o xattr.o acl.o readdir.o ioctl.o
+fuse-y += dev.o dir.o file.o inode.o control.o xattr.o acl.o readdir.o ioctl.o req_timeout.o
 fuse-y += iomode.o
 fuse-$(CONFIG_FUSE_DAX) += dax.o
 fuse-$(CONFIG_FUSE_PASSTHROUGH) += passthrough.o backing.o
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5dda7080f4a9..eea85eaa5e77 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -32,100 +32,6 @@ MODULE_ALIAS("devname:fuse");
 
 static struct kmem_cache *fuse_req_cachep;
 
-const unsigned long fuse_timeout_timer_freq =
-	secs_to_jiffies(FUSE_TIMEOUT_TIMER_FREQ);
-
-bool fuse_request_expired(struct fuse_conn *fc, struct list_head *list)
-{
-	struct fuse_req *req;
-
-	req = list_first_entry_or_null(list, struct fuse_req, list);
-	if (!req)
-		return false;
-	return time_is_before_jiffies(req->create_time + fc->timeout.req_timeout);
-}
-
-static bool fuse_fpq_processing_expired(struct fuse_conn *fc, struct list_head *processing)
-{
-	int i;
-
-	for (i = 0; i < FUSE_PQ_HASH_SIZE; i++)
-		if (fuse_request_expired(fc, &processing[i]))
-			return true;
-
-	return false;
-}
-
-/*
- * Check if any requests aren't being completed by the time the request timeout
- * elapses. To do so, we:
- * - check the fiq pending list
- * - check the bg queue
- * - check the fpq io and processing lists
- *
- * To make this fast, we only check against the head request on each list since
- * these are generally queued in order of creation time (eg newer requests get
- * queued to the tail). We might miss a few edge cases (eg requests transitioning
- * between lists, re-sent requests at the head of the pending list having a
- * later creation time than other requests on that list, etc.) but that is fine
- * since if the request never gets fulfilled, it will eventually be caught.
- */
-void fuse_check_timeout(struct work_struct *work)
-{
-	struct delayed_work *dwork = to_delayed_work(work);
-	struct fuse_conn *fc = container_of(dwork, struct fuse_conn,
-					    timeout.work);
-	struct fuse_iqueue *fiq = &fc->iq;
-	struct fuse_dev *fud;
-	struct fuse_pqueue *fpq;
-	bool expired = false;
-
-	if (!atomic_read(&fc->num_waiting))
-	    goto out;
-
-	spin_lock(&fiq->lock);
-	expired = fuse_request_expired(fc, &fiq->pending);
-	spin_unlock(&fiq->lock);
-	if (expired)
-		goto abort_conn;
-
-	spin_lock(&fc->bg_lock);
-	expired = fuse_request_expired(fc, &fc->bg_queue);
-	spin_unlock(&fc->bg_lock);
-	if (expired)
-		goto abort_conn;
-
-	spin_lock(&fc->lock);
-	if (!fc->connected) {
-		spin_unlock(&fc->lock);
-		return;
-	}
-	list_for_each_entry(fud, &fc->devices, entry) {
-		fpq = &fud->pq;
-		spin_lock(&fpq->lock);
-		if (fuse_request_expired(fc, &fpq->io) ||
-		    fuse_fpq_processing_expired(fc, fpq->processing)) {
-			spin_unlock(&fpq->lock);
-			spin_unlock(&fc->lock);
-			goto abort_conn;
-		}
-
-		spin_unlock(&fpq->lock);
-	}
-	spin_unlock(&fc->lock);
-
-	if (fuse_uring_request_expired(fc))
-	    goto abort_conn;
-
-out:
-	queue_delayed_work(system_percpu_wq, &fc->timeout.work,
-			   fuse_timeout_timer_freq);
-	return;
-
-abort_conn:
-	fuse_abort_conn(fc);
-}
-
 static void fuse_request_init(struct fuse_mount *fm, struct fuse_req *req)
 {
 	INIT_LIST_HEAD(&req->list);
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
new file mode 100644
index 000000000000..f7db15c33cf9
--- /dev/null
+++ b/fs/fuse/dev.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _FS_FUSE_DEV_H
+#define _FS_FUSE_DEV_H
+
+struct fuse_conn;
+
+void fuse_init_server_timeout(struct fuse_conn *fc, unsigned int timeout);
+
+#endif /* _FS_FUSE_DEV_H */
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 17423d4e3cfa..111fb6f3ebc4 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -48,12 +48,6 @@
 /** Number of dentries for each connection in the control filesystem */
 #define FUSE_CTL_NUM_DENTRIES 5
 
-/* Frequency (in seconds) of request timeout checks, if opted into */
-#define FUSE_TIMEOUT_TIMER_FREQ 15
-
-/** Frequency (in jiffies) of request timeout checks, if opted into */
-extern const unsigned long fuse_timeout_timer_freq;
-
 /*
  * Dentries invalidation workqueue period, in seconds.  The value of this
  * parameter shall be >= FUSE_DENTRY_INVAL_FREQ_MIN seconds, or 0 (zero), in
@@ -63,16 +57,6 @@ extern unsigned inval_wq __read_mostly;
 
 /** Maximum of max_pages received in init_out */
 extern unsigned int fuse_max_pages_limit;
-/*
- * Default timeout (in seconds) for the server to reply to a request
- * before the connection is aborted, if no timeout was specified on mount.
- */
-extern unsigned int fuse_default_req_timeout;
-/*
- * Max timeout (in seconds) for the server to reply to a request before
- * the connection is aborted.
- */
-extern unsigned int fuse_max_req_timeout;
 
 /** List of active connections */
 extern struct list_head fuse_conn_list;
@@ -1286,9 +1270,6 @@ void fuse_request_end(struct fuse_req *req);
 void fuse_abort_conn(struct fuse_conn *fc);
 void fuse_wait_aborted(struct fuse_conn *fc);
 
-/* Check if any requests timed out */
-void fuse_check_timeout(struct work_struct *work);
-
 void fuse_dentry_tree_init(void);
 void fuse_dentry_tree_cleanup(void);
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 702a1c619d36..db0ef19f4abe 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -6,6 +6,7 @@
   See the file COPYING.
 */
 
+#include "dev.h"
 #include "fuse_i.h"
 #include "fuse_dev_i.h"
 #include "dev_uring_i.h"
@@ -41,8 +42,6 @@ static int set_global_limit(const char *val, const struct kernel_param *kp);
 
 unsigned int fuse_max_pages_limit = 256;
 /* default is no timeout */
-unsigned int fuse_default_req_timeout;
-unsigned int fuse_max_req_timeout;
 
 unsigned int max_user_bgreq;
 module_param_call(max_user_bgreq, set_global_limit, param_get_uint,
@@ -1311,34 +1310,6 @@ static void process_init_limits(struct fuse_conn *fc, struct fuse_init_out *arg)
 	spin_unlock(&fc->bg_lock);
 }
 
-static void set_request_timeout(struct fuse_conn *fc, unsigned int timeout)
-{
-	fc->timeout.req_timeout = secs_to_jiffies(timeout);
-	INIT_DELAYED_WORK(&fc->timeout.work, fuse_check_timeout);
-	queue_delayed_work(system_percpu_wq, &fc->timeout.work,
-			   fuse_timeout_timer_freq);
-}
-
-static void init_server_timeout(struct fuse_conn *fc, unsigned int timeout)
-{
-	if (!timeout && !fuse_max_req_timeout && !fuse_default_req_timeout)
-		return;
-
-	if (!timeout)
-		timeout = fuse_default_req_timeout;
-
-	if (fuse_max_req_timeout) {
-		if (timeout)
-			timeout = min(fuse_max_req_timeout, timeout);
-		else
-			timeout = fuse_max_req_timeout;
-	}
-
-	timeout = max(FUSE_TIMEOUT_TIMER_FREQ, timeout);
-
-	set_request_timeout(fc, timeout);
-}
-
 struct fuse_init_args {
 	struct fuse_args args;
 	struct fuse_init_in in;
@@ -1491,7 +1462,7 @@ static void process_init_reply(struct fuse_mount *fm, struct fuse_args *args,
 			fc->no_flock = 1;
 		}
 
-		init_server_timeout(fc, timeout);
+		fuse_init_server_timeout(fc, timeout);
 
 		fm->sb->s_bdi->ra_pages =
 				min(fm->sb->s_bdi->ra_pages, ra_pages);
diff --git a/fs/fuse/req_timeout.c b/fs/fuse/req_timeout.c
new file mode 100644
index 000000000000..64d9b503e6c5
--- /dev/null
+++ b/fs/fuse/req_timeout.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "dev.h"
+#include "sysctl.h"
+#include "fuse_i.h"
+#include "fuse_dev_i.h"
+#include "dev_uring_i.h"
+
+/* Frequency (in seconds) of request timeout checks, if opted into */
+#define FUSE_TIMEOUT_TIMER_FREQ 15
+
+/* Frequency (in jiffies) of request timeout checks, if opted into */
+static const unsigned long fuse_timeout_timer_freq =
+	secs_to_jiffies(FUSE_TIMEOUT_TIMER_FREQ);
+
+/*
+ * Default timeout (in seconds) for the server to reply to a request
+ * before the connection is aborted, if no timeout was specified on mount.
+ *
+ * Exported via sysctl
+ */
+unsigned int fuse_default_req_timeout;
+
+/*
+ * Max timeout (in seconds) for the server to reply to a request before
+ * the connection is aborted.
+ *
+ * Exported via sysctl
+ */
+unsigned int fuse_max_req_timeout;
+
+bool fuse_request_expired(struct fuse_conn *fc, struct list_head *list)
+{
+	struct fuse_req *req;
+
+	req = list_first_entry_or_null(list, struct fuse_req, list);
+	if (!req)
+		return false;
+	return time_is_before_jiffies(req->create_time + fc->timeout.req_timeout);
+}
+
+static bool fuse_fpq_processing_expired(struct fuse_conn *fc, struct list_head *processing)
+{
+	int i;
+
+	for (i = 0; i < FUSE_PQ_HASH_SIZE; i++)
+		if (fuse_request_expired(fc, &processing[i]))
+			return true;
+
+	return false;
+}
+
+/*
+ * Check if any requests aren't being completed by the time the request timeout
+ * elapses. To do so, we:
+ * - check the fiq pending list
+ * - check the bg queue
+ * - check the fpq io and processing lists
+ *
+ * To make this fast, we only check against the head request on each list since
+ * these are generally queued in order of creation time (eg newer requests get
+ * queued to the tail). We might miss a few edge cases (eg requests transitioning
+ * between lists, re-sent requests at the head of the pending list having a
+ * later creation time than other requests on that list, etc.) but that is fine
+ * since if the request never gets fulfilled, it will eventually be caught.
+ */
+static void fuse_check_timeout(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct fuse_conn *fc = container_of(dwork, struct fuse_conn,
+					    timeout.work);
+	struct fuse_iqueue *fiq = &fc->iq;
+	struct fuse_dev *fud;
+	struct fuse_pqueue *fpq;
+	bool expired = false;
+
+	if (!atomic_read(&fc->num_waiting))
+		goto out;
+
+	spin_lock(&fiq->lock);
+	expired = fuse_request_expired(fc, &fiq->pending);
+	spin_unlock(&fiq->lock);
+	if (expired)
+		goto abort_conn;
+
+	spin_lock(&fc->bg_lock);
+	expired = fuse_request_expired(fc, &fc->bg_queue);
+	spin_unlock(&fc->bg_lock);
+	if (expired)
+		goto abort_conn;
+
+	spin_lock(&fc->lock);
+	if (!fc->connected) {
+		spin_unlock(&fc->lock);
+		return;
+	}
+	list_for_each_entry(fud, &fc->devices, entry) {
+		fpq = &fud->pq;
+		spin_lock(&fpq->lock);
+		if (fuse_request_expired(fc, &fpq->io) ||
+		    fuse_fpq_processing_expired(fc, fpq->processing)) {
+			spin_unlock(&fpq->lock);
+			spin_unlock(&fc->lock);
+			goto abort_conn;
+		}
+
+		spin_unlock(&fpq->lock);
+	}
+	spin_unlock(&fc->lock);
+
+	if (fuse_uring_request_expired(fc))
+		goto abort_conn;
+
+out:
+	queue_delayed_work(system_percpu_wq, &fc->timeout.work,
+			   fuse_timeout_timer_freq);
+	return;
+
+abort_conn:
+	fuse_abort_conn(fc);
+}
+
+static void set_request_timeout(struct fuse_conn *fc, unsigned int timeout)
+{
+	fc->timeout.req_timeout = secs_to_jiffies(timeout);
+	INIT_DELAYED_WORK(&fc->timeout.work, fuse_check_timeout);
+	queue_delayed_work(system_percpu_wq, &fc->timeout.work,
+			   fuse_timeout_timer_freq);
+}
+
+void fuse_init_server_timeout(struct fuse_conn *fc, unsigned int timeout)
+{
+	if (!timeout && !fuse_max_req_timeout && !fuse_default_req_timeout)
+		return;
+
+	if (!timeout)
+		timeout = fuse_default_req_timeout;
+
+	if (fuse_max_req_timeout) {
+		if (timeout)
+			timeout = min(fuse_max_req_timeout, timeout);
+		else
+			timeout = fuse_max_req_timeout;
+	}
+
+	timeout = max(FUSE_TIMEOUT_TIMER_FREQ, timeout);
+
+	set_request_timeout(fc, timeout);
+}
+
diff --git a/fs/fuse/sysctl.c b/fs/fuse/sysctl.c
index e2d921abcb88..74eca5ce9a2c 100644
--- a/fs/fuse/sysctl.c
+++ b/fs/fuse/sysctl.c
@@ -6,6 +6,7 @@
  */
 #include <linux/sysctl.h>
 
+#include "sysctl.h"
 #include "fuse_i.h"
 
 static struct ctl_table_header *fuse_table_header;
diff --git a/fs/fuse/sysctl.h b/fs/fuse/sysctl.h
new file mode 100644
index 000000000000..948d88417133
--- /dev/null
+++ b/fs/fuse/sysctl.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _FS_FUSE_SYSCTL_H
+#define _FS_FUSE_SYSCTL_H
+
+extern unsigned int fuse_default_req_timeout;
+extern unsigned int fuse_max_req_timeout;
+
+#endif /* _FS_FUSE_SYSCTL_H */
-- 
2.53.0

