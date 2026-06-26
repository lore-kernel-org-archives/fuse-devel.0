Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A923E3F65EA
	for <fuse-devel@lists.linux.dev>; Fri, 26 Jun 2026 12:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478302; cv=none; b=ddGfrrhPJ/CL2Mb2fngqDwT9PpUTt5RJtcPO3nDndkdMrojcAmAOkkQRzVGm9dbx7mcmb9+nGEv1EJID0tTKA3ybUv75y5LpCKt30dj1GS9k/7R8S6vGj9f7nTk+EtH+fIUXAxaiWJYRk2N+L0smZPbNzXKRyon664mvb+wHnAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478302; c=relaxed/simple;
	bh=Vz3OhwOHlMpWJ+lWe2Y8uFTP7ZzrXzmJBCkG6aJWgaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyi91G8rNyRBDmTGsOLgFEQni+HZtNejOIN5ynuCJu1uRPFONg25nTTGoiCjXhWC9W53iLZaHyDbhVidGVq1wlJmliLrDoByokmQp8u+TJ1fUkMtzwkoG4sxqTSC8CyaTY/UqFbiYCQ0pjseGUGWCgDoH3Bko4xE6Um3Rw4qOmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7yRv3Zm; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7yRv3Zm"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c07c67ad9f2so105613966b.0
        for <fuse-devel@lists.linux.dev>; Fri, 26 Jun 2026 05:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782478298; x=1783083098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAB1FbzWsnF9Lxhl7Ec6EQWiHnMDnluM1YpwBU/0JxI=;
        b=c7yRv3Zm+7kk7DSFwduvudmMY4OAjDlrYRZ+bwHFmNNTESH67pETAQh3VRbE11HK3Q
         spWr5nsK9C2xPibUyM+MQ30fOjts8thhzU7cAqT9Np9bKjYw2exAMPeTyCvEmn0UBDHT
         UW/mjRy+2FYISdHGmQiDjus0zGClz1xhCsnENg923FkxdPgJmQfOJGyxeilCWETwT1wY
         4TdeIxGwKMlOhly0jy8Qty39SJ0KkmAYbznUAVrF4YcjuHWVGpa5s1DspFLpNkEAMiSD
         TRLYoEgUierXFaw5ZOKwIm1tXxNx2aEI9r/bSkSwCqh2b15akncdK5mVO0mUPAs5mTqY
         M7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782478298; x=1783083098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CAB1FbzWsnF9Lxhl7Ec6EQWiHnMDnluM1YpwBU/0JxI=;
        b=elyxiubaTrOlX5pxZgrvBpy6SHfTwp/7VpTwB12kRa/Az+cVx/qXlvwTQfsQjPQRBN
         js66xbt2hQyVRtMPgMb6m/2kNEx/bv9RiKtDLU2zA9RipT5iOGAnxHyFHw1gpAc4GxZ/
         ulNBXRF3YmGSThagyXmDOOgP+ySW7uQ8/lnULDmfgRk2nkSFByWE5AuYFx0HeMvu0yIU
         elj3GZzOBAMRm4fmi1d4JA4JppsxszdoOEvhpbgb3IyonjsM9JGbBRPKBRrm3/uR+kzK
         NFG9l1iMq5H2Mqzz5dtlh2MmIWB0ogCq3dVJd1DVU1TL+3mRXFcqnbmW6EEyE1L6z7WM
         96oQ==
X-Gm-Message-State: AOJu0YyxJSkVRM3K0EDW6vkI+7q5REbNU758pO/Zi2bbHR/SC08SPTUn
	L9g4ECANifacI3Yb0OYyU2uxUOI6xuLqvQl6ILCOc9YIj4WpYU+SL+RL
X-Gm-Gg: AfdE7clIfUGCHuaGdhohenY/cf9U4VnQH27TxGnFxLETRwt79IY0A4prV/ue0In7ek3
	I+uVuyPKaJU61Kc2h04TXrYedBZk2fyBDaqMt67WFlmhi3jL2GYLWKfF6DVlPnb0oEyE6o7ZqeW
	zQYriVUJAgVD0ooslDxCseYwY+M9S/8G0vscEtID+sJecAQqda9jTgCAy0vhHsGdoRtR+39mHzQ
	v6c4qynxu4LOIvRB6aMVoHBpNoi3YDoJVxjtPYl6kcnmw1rJ9hAqrJJzvV5BI3g26FOUK3Vubbn
	FUHa+hXVCcP15DXn3NN1BN/S9/48rZnLMgcNmdmwqnoyQ2LHnKv0/s9TAUMr2SOT+3XR0JxKCFX
	OGZCrRu/Qjn3wAWWb/e06tRkaXTn0fxnTcsRITDISl6FN1sk0BWUcc2i0DYPW5BrMT926tLvT9n
	1T0+M7jl8GN9ZhPRz0O4cs6AASJ4Hkq7g+9Zw=
X-Received: by 2002:a17:906:7955:b0:c10:bfaf:6f73 with SMTP id a640c23a62f3a-c1204495c0amr478108466b.22.1782478297610;
        Fri, 26 Jun 2026 05:51:37 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c121cd03f24sm122511466b.32.2026.06.26.05.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 05:51:37 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH v2] fuse: replace passthrough backing-id IDR with a counter and hashtable
Date: Fri, 26 Jun 2026 12:51:31 +0000
Message-ID: <20260626125131.2117-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621183157.3490-1-mahad.ibrahim.dev@gmail.com>
References: <20260621183157.3490-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The passthrough backing-id IDR carries a /* FIXME: xarray might be space
inefficient */ on its idr_alloc_cyclic() call. Replace it with a cyclic
counter for allocation and a hashtable for lookup.

The hashtable keys are already the set of live ids, so allocation needs
only a counter: it takes the next value, skipping any already present,
all under fc->lock. A live-id count makes it return -ENOSPC when full.

The hashtable is allocated lazily when passthrough is negotiated, so it is
present whenever passthrough is enabled; every dereference is already gated
on fc->passthrough, so no NULL checks are added. On allocation failure
passthrough is left off and the mount continues.

Lookup is now O(chain) rather than the IDR's bounded walk, but runs only at
backing setup, off the read/write path.

Testing

Tested under KASAN and KCSAN in separate builds, since the two cannot be
enabled together. The workload was passthrough_hp under fio with parallel
open/close churn; ftrace confirmed concurrent allocation, lookup, and
removal across CPUs. No KASAN use-after-free and no KCSAN data race in
fs/fuse/backing.c.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>

---

v2:
 - drop the IDA; allocate with a cyclic counter and resolve collisions
   via the hashtable's membership check under fc->lock (Miklos)
 - add a live-id count to bound allocation and return -ENOSPC when full

Uniqueness now comes from the hashtable rather than an allocator that owns
the id space, so this should stay clear of any future 64-bit or
user-assigned-id work. The id is kept 32-bit and kernel-allocated here.

Lookup uses 256 fixed buckets, so chains lengthen at very high backing
counts; an rhashtable would keep it flat but adds complexity. The fixed
table seemed simpler for the expected counts - happy to switch if you'd
prefer.

 fs/fuse/backing.c | 98 +++++++++++++++++++++++++++++++++++++----------
 fs/fuse/fuse_i.h  | 31 +++++++++++++--
 fs/fuse/inode.c   |  8 ++--
 3 files changed, 111 insertions(+), 26 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 472b6afa7dff..77f4d4b00bf4 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -35,49 +35,99 @@ void fuse_backing_put(struct fuse_backing *fb)
 
 void fuse_backing_files_init(struct fuse_conn *fc)
 {
-	idr_init(&fc->backing_files_map);
+	fc->backing_ids_count = 0;
+	fc->backing_files_next_id = 1;
+	fc->backing_htable = NULL;
 }
 
 static int fuse_backing_id_alloc(struct fuse_conn *fc, struct fuse_backing *fb)
 {
 	int id;
+	struct fuse_backing *iterator;
 
-	idr_preload(GFP_KERNEL);
 	spin_lock(&fc->lock);
-	/* FIXME: xarray might be space inefficient */
-	id = idr_alloc_cyclic(&fc->backing_files_map, fb, 1, 0, GFP_ATOMIC);
+
+	if (fc->backing_ids_count == INT_MAX) {
+		id = -ENOSPC;
+		goto out;
+	}
+
+retry:
+	id = fc->backing_files_next_id;
+	fc->backing_files_next_id = (id == INT_MAX) ? 1 : id + 1;
+
+	hash_for_each_possible(fc->backing_htable->backing_files_ht,
+			       iterator, node, id) {
+		if (iterator->id == id)
+			goto retry;
+	}
+
+	fb->id = id;
+	hash_add_rcu(fc->backing_htable->backing_files_ht, &fb->node, id);
+	fc->backing_ids_count++;
+
+out:
 	spin_unlock(&fc->lock);
-	idr_preload_end();
 
-	WARN_ON_ONCE(id == 0);
 	return id;
 }
 
+int fuse_backing_htable_alloc(struct fuse_conn *fc)
+{
+	struct fuse_backing_htable *ht;
+
+	ht = kzalloc_obj(struct fuse_backing_htable);
+	if (!ht)
+		return -ENOMEM;
+
+	hash_init(ht->backing_files_ht);
+	fc->backing_htable = ht;
+
+	return 0;
+}
+
 static struct fuse_backing *fuse_backing_id_remove(struct fuse_conn *fc,
 						   int id)
 {
-	struct fuse_backing *fb;
+	struct fuse_backing *iterator;
+	struct fuse_backing *fb = NULL;
 
 	spin_lock(&fc->lock);
-	fb = idr_remove(&fc->backing_files_map, id);
+	hash_for_each_possible(fc->backing_htable->backing_files_ht,
+			       iterator, node, id) {
+		if (iterator->id == id) {
+			hash_del_rcu(&iterator->node);
+			fb = iterator;
+			break;
+		}
+	}
+
+	if (fb)
+		fc->backing_ids_count--;
+
 	spin_unlock(&fc->lock);
 
 	return fb;
 }
 
-static int fuse_backing_id_free(int id, void *p, void *data)
+void fuse_backing_files_free(struct fuse_conn *fc)
 {
-	struct fuse_backing *fb = p;
+	struct fuse_backing *fb;
+	struct hlist_node *tmp;
+	int bkt;
 
-	WARN_ON_ONCE(refcount_read(&fb->count) != 1);
-	fuse_backing_free(fb);
-	return 0;
-}
+	if (!fc->backing_htable)
+		return;
 
-void fuse_backing_files_free(struct fuse_conn *fc)
-{
-	idr_for_each(&fc->backing_files_map, fuse_backing_id_free, NULL);
-	idr_destroy(&fc->backing_files_map);
+	hash_for_each_safe(fc->backing_htable->backing_files_ht,
+			   bkt, tmp, fb, node) {
+		hash_del_rcu(&fb->node);
+		WARN_ON_ONCE(refcount_read(&fb->count) != 1);
+		fuse_backing_free(fb);
+	}
+
+	kfree(fc->backing_htable);
+	fc->backing_htable = NULL;
 }
 
 int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
@@ -169,10 +219,18 @@ int fuse_backing_close(struct fuse_conn *fc, int backing_id)
 
 struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, int backing_id)
 {
-	struct fuse_backing *fb;
+	struct fuse_backing *iterator;
+	struct fuse_backing *fb = NULL;
 
 	rcu_read_lock();
-	fb = idr_find(&fc->backing_files_map, backing_id);
+	hash_for_each_possible_rcu(fc->backing_htable->backing_files_ht,
+				   iterator, node, backing_id) {
+		if (iterator->id == backing_id) {
+			fb = iterator;
+			break;
+		}
+	}
+
 	fb = fuse_backing_get(fb);
 	rcu_read_unlock();
 
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 85f738c53122..db4c07a496f0 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -30,6 +30,7 @@
 #include <linux/pid_namespace.h>
 #include <linux/refcount.h>
 #include <linux/user_namespace.h>
+#include <linux/hashtable.h>
 
 /** Default max number of pages that can be used in a single read request */
 #define FUSE_DEFAULT_MAX_PAGES_PER_REQ 32
@@ -94,6 +95,10 @@ struct fuse_backing {
 	/* refcount */
 	refcount_t count;
 	struct rcu_head rcu;
+
+	/* ID Allocation */
+	int id;
+	struct hlist_node node;
 };
 
 /**
@@ -407,6 +412,12 @@ struct fuse_sync_bucket {
 	struct rcu_head rcu;
 };
 
+#ifdef CONFIG_FUSE_PASSTHROUGH
+struct fuse_backing_htable {
+	DECLARE_HASHTABLE(backing_files_ht, 8);
+};
+#endif
+
 /**
  * struct fuse_conn - A Fuse connection.
  *
@@ -418,7 +429,9 @@ struct fuse_conn {
 	/**
 	 * @lock: Lock protecting:
 	 * - polled_files
-	 * - backing_files_map
+	 * - backing_files_next_id
+	 * - backing_ids_count
+	 * - backing_htable (modifications)
 	 * - curr_bucket
 	 */
 	spinlock_t lock;
@@ -759,8 +772,14 @@ struct fuse_conn {
 	struct fuse_sync_bucket __rcu *curr_bucket;
 
 #ifdef CONFIG_FUSE_PASSTHROUGH
-	/** @backing_files_map: IDR for backing files ids */
-	struct idr backing_files_map;
+	/** @backing_ids_count: Count of total allocated IDs */
+	unsigned int backing_ids_count;
+
+	/** @backing_files_next_id: Cursor for cyclic allocation */
+	unsigned int backing_files_next_id;
+
+	/** @backing_htable: Pointer to external hashtable */
+	struct fuse_backing_htable *backing_htable;
 #endif
 };
 
@@ -1259,6 +1278,7 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 struct fuse_backing *fuse_backing_get(struct fuse_backing *fb);
 void fuse_backing_put(struct fuse_backing *fb);
 struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, int backing_id);
+int fuse_backing_htable_alloc(struct fuse_conn *fc);
 #else
 
 static inline struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
@@ -1274,6 +1294,11 @@ static inline struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc,
 {
 	return NULL;
 }
+
+static inline int fuse_backing_htable_alloc(struct fuse_conn *fc)
+{
+	return -EOPNOTSUPP;
+}
 #endif
 
 void fuse_backing_files_init(struct fuse_conn *fc);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index d975073c6029..8adb1eb7ff51 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1389,9 +1389,11 @@ static void process_init_reply(struct fuse_args *args, int error)
 			    arg->max_stack_depth > 0 &&
 			    arg->max_stack_depth <= FILESYSTEM_MAX_STACK_DEPTH &&
 			    !(flags & FUSE_WRITEBACK_CACHE))  {
-				fc->passthrough = 1;
-				fc->max_stack_depth = arg->max_stack_depth;
-				fm->sb->s_stack_depth = arg->max_stack_depth;
+				if (!fuse_backing_htable_alloc(fc)) {
+					fc->passthrough = 1;
+					fc->max_stack_depth = arg->max_stack_depth;
+					fm->sb->s_stack_depth = arg->max_stack_depth;
+				}
 			}
 			if (flags & FUSE_NO_EXPORT_SUPPORT)
 				fm->sb->s_export_op = &fuse_export_fid_operations;
-- 
2.54.0

