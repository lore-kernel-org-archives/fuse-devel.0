Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACB63909A5
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 06:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057440; cv=none; b=GVD+TJi+NQe69Hht+QIYiwPKhcpxmT16IICeAMnXKPxidcFmdCpssI7tGOs459vjIuZpxxfn5ZMc4ugslYr3WbfRf7PamtFMeuOqMMyuqefImY31JRP2rurGPjKHjhMPTMWh8B3r7ZHI88ronQcOFq5bDlkAtVIeeJgeDgetuW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057440; c=relaxed/simple;
	bh=vZFEzxbbU3PlRaXD475giUul/4QgQtqu6m90IVngslA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=sRg07uFifOr19bPATBH7skFaHBD9+kYdC3EiXbaqjKMcQHAn/pIFMfqiUQ5mBnvRvwTzIkbVu2OHZa84HB9zC6arbWauuiVCMH6S53214BfNErNLsu06brFOKCY9cnrGZb1la+RrixaMKgUFyh7yZ7Ru6TkeFFjNOhPNetwitf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e2CyLBCk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e2CyLBCk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790057438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oCSzuE8jpVTdXhnvhfTKpmxsZIZ2niZJMdEOlsitS8o=;
	b=e2CyLBCkDJ6gln6jgusl6pxLJXpgoAiNmxmiYGc2V3IxxO9ptw3uYptN+m7Ze/MLZdUwPf
	UEbenfLN3syq7inp2Q/UmcnQCm8Qt4ismQ+19m9AZjvxijYR12Fw1l16ecZsqBoo2ew3Ik
	eONAbknD6UjduuIFwIX16LEYcdsNdO8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-dwwnzYnpOAeI6XW0w5ZnVw-1; Tue, 22 Sep 2026 02:10:35 -0400
X-MC-Unique: dwwnzYnpOAeI6XW0w5ZnVw-1
X-Mimecast-MFC-AGG-ID: dwwnzYnpOAeI6XW0w5ZnVw_1790057434
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a9caf60126so4249215a12.1
        for <fuse-devel@lists.linux.dev>; Mon, 21 Sep 2026 23:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057434; x=1790662234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCSzuE8jpVTdXhnvhfTKpmxsZIZ2niZJMdEOlsitS8o=;
        b=cHv5IwS9YvBwQGdaHcKebfM7czdacS7jfCGEDf3Egt6MPJa12UbnKQGd7lFrKZ1jQ8
         Iznpz5KxiEOBCyjWv8z5lNkXGDWfkvlNo0rhucePxIBQTzvoNlc0seFb9eOjmdTKpHkY
         9Su0oyKWzWHiCdCGiZO+WFqnN/F+1D31vTkP578ixoo3f7yxuL8dzvq3QZheULEZsUF1
         TK/1OmEQLCxG/B3bUNZDK/BrGtfueeFylm81IGZWNNDFs5Mp+P5crAZzJpDsrug2tRHx
         Rp2fBcVQOg5c1TJ7q6LIVyyMyYtICAOMxbFX2gwhZ7PEGpITvpEibCSm3aEkouWxP5+K
         oDew==
X-Gm-Message-State: AFuF++kFtc9BPzMtLOAJ5N+enE7VrRnkhXcWTgF8S5pJSodxQrO/iQlx
	bpOWtmzSDPQJqecSH3f08BGObxvkicfvmafcdqEzgcj32xUPB2OOVKJGsJJiPqi+V1B8qonsVXF
	4T3Ty9wt7NNmAgCU8VUBg+UQ8ZC2jtilbmuR2iqnWinNi/py5wC3XS4jqEo0tmg2LkzHZKBQRk2
	/JW4mO0vU2nz3pa0msVT/P2+0JeijV4uopn9yavS4CuyjJ3QA=
X-Gm-Gg: AYBFou2ghlix48czxYKq4t95pyZVoDVmFYK74Us6IRp8rNIW5jPh5okwJJqTr+HdBHp
	lvFCIpS/xj4jU951iCc/Lti+Bg6NAGJkkB+K4yjmQw8IUZ/V2q9Am+u+3BGaKLWMfYd5e70pbRS
	qpPbCz627hkB9pb1bzCIJDxUAkf/uOa1SCUE6RSgV2p9/Ar/rqAxYYNCNA2CrJ1ridPNLMPxONV
	gEMNNDvP6J+ganpbgxQ40y4EKtxUTuyNz/R8vflxSBeIgVI2EXL+/Ft/4Y1aeCBMX9CVefESSjt
	SEh4txitlWupYWk0jse9t7JyOWBv1dS2GCZBaM3+hC/r8L47OPpTXMLkXNf57sD9C8Rz37Huvls
	SQOnC3dyzRsCG1OvrI7JfXzVYZ8Xt3WSeFpqXH/quh9FMNAEsLtx7
X-Received: by 2002:a05:6402:4145:b0:6a9:9766:59ad with SMTP id 4fb4d7f45d1cf-6aa548d810emr11368624a12.43.1790057433846;
        Mon, 21 Sep 2026 23:10:33 -0700 (PDT)
X-Received: by 2002:a05:6402:4145:b0:6a9:9766:59ad with SMTP id 4fb4d7f45d1cf-6aa548d810emr11368590a12.43.1790057433300;
        Mon, 21 Sep 2026 23:10:33 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-111.pool.digikabel.hu. [85.66.37.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440df9asm449826a12.4.2026.09.21.23.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:10:32 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>
Subject: [PATCH 06/11] fuse: support 64 bit, server allocated backing ID
Date: Tue, 22 Sep 2026 08:10:06 +0200
Message-ID: <20260922061019.3320196-7-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: DFF0VU7WxZG4pVhnad016MRRiXUmQX1Hml-KLzZPjkU_1790057434
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add support for server allocated 64-bit backing IDs alongside the
existing kernel allocated 32-bit IDs.

Opened with FUSE_DEV_IOC_BACKING_OPEN, but the backing ID is sent via
fuse_backing_map.backing_id, with FUSE_BACKING_ID_64 being set in .flags.

Closed with FUSE_NOTIFY_BACKING_CLOSE.  Since close only provides the
backing ID, not the file descriptor, it doesn't have to be done with an
ioctl.

All 64 bit values are valid.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/backing.c         | 121 +++++++++++++++++++++++++-------------
 fs/fuse/dev.c             |   2 +-
 fs/fuse/dev.h             |   2 +-
 fs/fuse/fuse_i.h          |  13 +++-
 fs/fuse/notify.c          |  23 ++++++++
 fs/fuse/passthrough.c     |   2 +-
 include/uapi/linux/fuse.h |  19 +++++-
 7 files changed, 133 insertions(+), 49 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 433fa3098d71..58dbdd17c1ef 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -9,6 +9,7 @@
 #include "fuse_i.h"
 
 #include <linux/file.h>
+#include <linux/rhashtable.h>
 
 static struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
 {
@@ -33,11 +34,6 @@ void fuse_backing_put(struct fuse_backing *fb)
 		fuse_backing_free(fb);
 }
 
-void fuse_backing_files_init(struct fuse_conn *fc)
-{
-	idr_init(&fc->backing_files_map);
-}
-
 static int fuse_backing_id_alloc(struct fuse_conn *fc, struct fuse_backing *fb)
 {
 	int id;
@@ -53,38 +49,42 @@ static int fuse_backing_id_alloc(struct fuse_conn *fc, struct fuse_backing *fb)
 	return id;
 }
 
-static struct fuse_backing *fuse_backing_id_remove(struct fuse_conn *fc,
-						   int id)
-{
-	struct fuse_backing *fb;
+static const struct rhashtable_params fuse_backing_params = {
+	.head_offset = offsetof(struct fuse_backing, hash_node),
+	.key_offset = offsetof(struct fuse_backing, backing_id),
+	.key_len = sizeof_field(struct fuse_backing, backing_id),
+};
 
-	spin_lock(&fc->lock);
-	fb = idr_remove(&fc->backing_files_map, id);
-	spin_unlock(&fc->lock);
-
-	return fb;
+int fuse_backing_add_64(struct fuse_conn *fc, struct fuse_backing *fb)
+{
+	return rhashtable_insert_fast(&fc->backing_64_ht, &fb->hash_node, fuse_backing_params);
 }
 
-static int fuse_backing_id_free(int id, void *p, void *data)
+static struct fuse_backing *fuse_backing_id_remove(struct fuse_conn *fc, u64 id, bool is_64bit)
 {
-	struct fuse_backing *fb = p;
+	struct fuse_backing *fb;
+	int err;
 
-	WARN_ON_ONCE(refcount_read(&fb->count) != 1);
-	fuse_backing_free(fb);
-	return 0;
-}
+	guard(spinlock)(&fc->lock);
+	if (!is_64bit)
+		return idr_remove(&fc->backing_files_map, id);
 
-void fuse_backing_files_free(struct fuse_conn *fc)
-{
-	idr_for_each(&fc->backing_files_map, fuse_backing_id_free, NULL);
-	idr_destroy(&fc->backing_files_map);
+	fb = rhashtable_lookup_fast(&fc->backing_64_ht, &id, fuse_backing_params);
+	if (!fb)
+		return NULL;
+
+	err = rhashtable_remove_fast(&fc->backing_64_ht, &fb->hash_node, fuse_backing_params);
+	WARN_ON(err);
+
+	return fb;
 }
 
 int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 {
 	struct file *file;
 	struct super_block *backing_sb;
-	struct fuse_backing *fb = NULL;
+	struct fuse_backing *fb;
+	bool is_64bit = map->flags & FUSE_BACKING_ID_64;
 	int res;
 
 	pr_debug("%s: fd=%d flags=0x%x\n", __func__, map->fd, map->flags);
@@ -95,7 +95,10 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 		goto out;
 
 	res = -EINVAL;
-	if (map->flags || map->padding)
+	if (map->flags & ~FUSE_BACKING_ID_64)
+		goto out;
+
+	if (!is_64bit && map->backing_id != 0)
 		goto out;
 
 	file = fget_raw(map->fd);
@@ -120,9 +123,13 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 
 	fb->file = file;
 	fb->cred = get_current_cred();
+	fb->backing_id = map->backing_id;
 	refcount_set(&fb->count, 1);
 
-	res = fuse_backing_id_alloc(fc, fb);
+	if (is_64bit)
+		res = fuse_backing_add_64(fc, fb);
+	else
+		res = fuse_backing_id_alloc(fc, fb);
 	if (res < 0) {
 		fuse_backing_free(fb);
 		fb = NULL;
@@ -138,24 +145,19 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 	goto out;
 }
 
-int fuse_backing_close(struct fuse_conn *fc, int backing_id)
+int fuse_backing_close(struct fuse_conn *fc, u64 backing_id, bool is_64bit)
 {
 	struct fuse_backing *fb = NULL;
 	int err;
 
-	pr_debug("%s: backing_id=%d\n", __func__, backing_id);
-
-	/* TODO: relax CAP_SYS_ADMIN once backing files are visible to lsof */
-	err = -EPERM;
-	if (!fc->passthrough || !capable(CAP_SYS_ADMIN))
-		goto out;
+	pr_debug("%s: backing_id=%lld\n", __func__, backing_id);
 
 	err = -EINVAL;
-	if (backing_id <= 0)
+	if (!is_64bit && (backing_id == 0 || backing_id > INT_MAX))
 		goto out;
 
 	err = -ENOENT;
-	fb = fuse_backing_id_remove(fc, backing_id);
+	fb = fuse_backing_id_remove(fc, backing_id, is_64bit);
 	if (!fb)
 		goto out;
 
@@ -167,14 +169,49 @@ int fuse_backing_close(struct fuse_conn *fc, int backing_id)
 	return err;
 }
 
-struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, int backing_id)
+struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, u64 backing_id, bool is_64bit)
 {
 	struct fuse_backing *fb;
 
-	rcu_read_lock();
-	fb = idr_find(&fc->backing_files_map, backing_id);
-	fb = fuse_backing_get(fb);
-	rcu_read_unlock();
+	guard(rcu)();
+	if (!is_64bit)
+		fb = idr_find(&fc->backing_files_map, backing_id);
+	else
+		fb = rhashtable_lookup(&fc->backing_64_ht, &backing_id, fuse_backing_params);
 
-	return fb;
+	return fuse_backing_get(fb);
+}
+
+static void fuse_backing_check_free(struct fuse_backing *fb)
+{
+	WARN_ON_ONCE(refcount_read(&fb->count) != 1);
+	fuse_backing_free(fb);
+}
+
+static int fuse_backing_idr_free(int id, void *p, void *data)
+{
+	fuse_backing_check_free(p);
+	return 0;
+}
+
+static void fuse_backing_rht_free(void *p, void *data)
+{
+	fuse_backing_check_free(p);
+}
+
+void fuse_backing_files_free(struct fuse_conn *fc)
+{
+	idr_for_each(&fc->backing_files_map, fuse_backing_idr_free, NULL);
+	idr_destroy(&fc->backing_files_map);
+
+	rhashtable_free_and_destroy(&fc->backing_64_ht, fuse_backing_rht_free, NULL);
+}
+
+void fuse_backing_files_init(struct fuse_conn *fc)
+{
+	int err;
+
+	idr_init(&fc->backing_files_map);
+	err = rhashtable_init(&fc->backing_64_ht, &fuse_backing_params);
+	WARN_ON(err); /* fails on programming error only */
 }
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 4fec31fc0b84..c6361c914b35 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -2357,7 +2357,7 @@ static long fuse_dev_ioctl_backing_close(struct file *file, __u32 __user *argp)
 	if (get_user(backing_id, argp))
 		return -EFAULT;
 
-	return fuse_backing_close(fud->chan->conn, backing_id);
+	return fuse_backing_close(fud->chan->conn, backing_id, false);
 }
 
 static long fuse_dev_ioctl_sync_init(struct file *file)
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index 8d25378c0918..6f2f6c3822e1 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -86,7 +86,7 @@ int fuse_notify(struct fuse_conn *fc, enum fuse_notify_code code,
 		unsigned int size, struct fuse_copy_state *cs);
 
 int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map);
-int fuse_backing_close(struct fuse_conn *fc, int backing_id);
+int fuse_backing_close(struct fuse_conn *fc, u64 backing_id, bool is_64bit);
 
 int fuse_copy_one(struct fuse_copy_state *cs, void *val, unsigned size);
 int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index b698857dfe13..75c7997098c1 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -28,7 +28,7 @@
 #include <linux/backing-dev.h>
 #include <linux/mutex.h>
 #include <linux/rwsem.h>
-#include <linux/rbtree.h>
+#include <linux/rbtree_types.h>
 #include <linux/poll.h>
 #include <linux/workqueue.h>
 #include <linux/kref.h>
@@ -36,6 +36,7 @@
 #include <linux/pid_namespace.h>
 #include <linux/refcount.h>
 #include <linux/user_namespace.h>
+#include <linux/rhashtable-types.h>
 
 /** Default max number of pages that can be used in a single read request */
 #define FUSE_DEFAULT_MAX_PAGES_PER_REQ 32
@@ -96,7 +97,8 @@ struct fuse_submount_lookup {
 struct fuse_backing {
 	struct file *file;
 	const struct cred *cred;
-
+	u64 backing_id;
+	struct rhash_head hash_node;
 	/* refcount */
 	refcount_t count;
 	struct rcu_head rcu;
@@ -776,6 +778,9 @@ struct fuse_conn {
 #ifdef CONFIG_FUSE_PASSTHROUGH
 	/** @backing_files_map: IDR for backing files ids */
 	struct idr backing_files_map;
+
+	/** @backing_64_ht: 64 bit ID lookup hash table */
+	struct rhashtable backing_64_ht;
 #endif
 };
 
@@ -1274,7 +1279,9 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 /* backing.c */
 #ifdef CONFIG_FUSE_PASSTHROUGH
 void fuse_backing_put(struct fuse_backing *fb);
-struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, int backing_id);
+
+struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, u64 backing_id, bool is_64bit);
+int fuse_backing_add_64(struct fuse_conn *fc, struct fuse_backing *fb);
 #else
 
 static inline void fuse_backing_put(struct fuse_backing *fb)
diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
index 1ba763705d91..7361b56bb973 100644
--- a/fs/fuse/notify.c
+++ b/fs/fuse/notify.c
@@ -409,6 +409,26 @@ static int fuse_notify_prune(struct fuse_conn *fc, unsigned int size,
 	return 0;
 }
 
+static int fuse_notify_backing_close(struct fuse_conn *fc, unsigned int size,
+				     struct fuse_copy_state *cs)
+{
+	struct fuse_notify_backing_close_out outarg;
+	int err;
+
+	if (size != sizeof(outarg))
+		return -EINVAL;
+
+	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
+	if (err)
+		return err;
+
+	if (outarg.reserved)
+		return -EINVAL;
+
+	return fuse_backing_close(fc, outarg.backing_id, true);
+
+}
+
 int fuse_notify(struct fuse_conn *fc, enum fuse_notify_code code,
 		unsigned int size, struct fuse_copy_state *cs)
 {
@@ -440,6 +460,9 @@ int fuse_notify(struct fuse_conn *fc, enum fuse_notify_code code,
 	case FUSE_NOTIFY_PRUNE:
 		return fuse_notify_prune(fc, size, cs);
 
+	case FUSE_NOTIFY_BACKING_CLOSE:
+		return fuse_notify_backing_close(fc, size, cs);
+
 	default:
 		return -EINVAL;
 	}
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index 0e2e1066b984..56314dea0b5f 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -163,7 +163,7 @@ struct fuse_backing *fuse_passthrough_open(struct file *file, int backing_id)
 	if (backing_id <= 0)
 		return fuse_ptr_EIO("invalid backing_id");
 
-	fb = fuse_backing_lookup(fc, backing_id);
+	fb = fuse_backing_lookup(fc, backing_id, false);
 	if (!fb)
 		return fuse_ptr_EIO("backing not found");
 
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 10a7f31c4bdf..f271faa60424 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -251,6 +251,10 @@
  *
  *  7.47
  *  - add FUSE_HAS_SYNCFS opt-in flag for privileged userspace servers
+ *  - add FUSE_NOTIFY_BACKING_CLOSE
+ *  - add struct fuse_notify_backing_close_out
+ *  - add backing_id to fuse_backing_map
+ *  - add FUSE_BACKING_ID_64 (multiple structs)
  */
 
 #ifndef _LINUX_FUSE_H
@@ -709,6 +713,7 @@ enum fuse_notify_code {
 	FUSE_NOTIFY_RESEND = 7,
 	FUSE_NOTIFY_INC_EPOCH = 8,
 	FUSE_NOTIFY_PRUNE = 9,
+	FUSE_NOTIFY_BACKING_CLOSE = 10,
 };
 
 /* The read buffer is required to be at least 8k, but may be much larger */
@@ -1153,10 +1158,17 @@ struct fuse_notify_prune_out {
 	uint64_t	spare;
 };
 
+/**
+ * flags for fuse_backing_map
+ *
+ * FUSE_BACKING_ID_64: backing ID is server allocated, stored in @backing_id
+ */
+#define FUSE_BACKING_ID_64	(1 << 30) /* used in multiple structs */
+
 struct fuse_backing_map {
 	int32_t		fd;
 	uint32_t	flags;
-	uint64_t	padding;
+	uint64_t	backing_id;
 };
 
 /* Device ioctls: */
@@ -1193,6 +1205,11 @@ struct fuse_copy_file_range_out {
 	uint64_t	bytes_copied;
 };
 
+struct fuse_notify_backing_close_out {
+	uint64_t	backing_id;
+	uint64_t	reserved;
+};
+
 #define FUSE_SETUPMAPPING_FLAG_WRITE (1ull << 0)
 #define FUSE_SETUPMAPPING_FLAG_READ (1ull << 1)
 struct fuse_setupmapping_in {
-- 
2.54.0

