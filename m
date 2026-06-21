Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFF23659E8
	for <fuse-devel@lists.linux.dev>; Sun, 21 Jun 2026 18:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782066732; cv=none; b=EEG5x7BXY+o3X2Ol5mBwZtU9v9BsBeR5sEhgVInbNeFx+fA7jdiu4aZXBTx2To/r4LiUcm0E3OAlmWATGW5fkJ5gg/CmC2BoNUE31kzkrbrMl06WuJM850DdblOrPutL1+LQ4pPJrE8MhwoK8rgTz34eCgR3ePcRagl6Hqzhg9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782066732; c=relaxed/simple;
	bh=vFCKtZzM892N33+v9kr8F0JPvVpvWNYNKNH26A2gaxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HFuhPbrMQENNGpKdQZusO30yP3L7vhmpnfF9m3QQDPPPFRnt9L66+WHcgpv4lS5tT94McG1njmDRXJ8nDj20/AxglYpjRULRgFFGNWihbYH/1ay0OhhC34Gz0xJCj7LziqR0AJs4OhL6fP51Tg67aImgitwMtLPfWyQ1TH41q0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZv7JiCg; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZv7JiCg"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bec450b950dso510256166b.2
        for <fuse-devel@lists.linux.dev>; Sun, 21 Jun 2026 11:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782066725; x=1782671525; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ymtwgv9woTUilM7loFeiBIkzRl3/bYVO/dFHIfMuJqE=;
        b=rZv7JiCgYzoWL/riYCfYLpxliEOiW60+5FEG26CXGlAK4YA0IOzxRbOf6gRoVRTYTp
         goegmpWwWA5u4GJJC2tkR6kMx4F8RsT7fW4QdNg41h7yK7PYd3TqlvcTywmlcCGX8CSG
         AlmXhjJPoH8mpabgwqgVYgv6SjpbKDgrRkH1qCEG1Mi/HnEAhYdukuWr0eSQeyDqgZtZ
         vJrnGuxEMXMB/mhuyVr+JAhf+l+RtIX8jf/hwyF3gOxBPeVgUE7OkAsfkQiw7etixGl2
         s+/+8WPByX+1u9vqPmjZGXuV2P+lWR4HMuY3Q5QHTbT8xVsQrzVl6xrOzRFcyehRU2d1
         HRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782066725; x=1782671525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymtwgv9woTUilM7loFeiBIkzRl3/bYVO/dFHIfMuJqE=;
        b=fe9cOtStPEtOWgDdo42qB3yh8Z30CI/h6KZzN0cEICc/Gh8pF1QNdDY/SUO/mUOgMj
         MhPtTxvkzCMk0QA1OkSGFqOeTTe65CnZBOsDasAhr2wTq2fBcIt6pPVCqnA3zRptP9zL
         /bqlk8r/vEgnyARqarRYKR3DPsXEA5qjkUVWzfgiOGhU4WFM7X+dsx9iBcqrNLs5sZUT
         qH7MDKeaD1jto2uN+RoTBKc+FYqCUhMC0ZheNMfbbKO0chJlJy43tUDQpvH+NpMoQ+cl
         G0OX/Xi1jUTFDaYJytEolnXqqVk4eAYqO4BIuoyezN1uDfieRhMPna8CzepeYyoU+UFg
         53hg==
X-Gm-Message-State: AOJu0YxG+PFzxHHrb79jvHecsO1+SAm9SUFIjMVBuFxx8NUZUhP1Pc6N
	Tenp6fni90DAwFmibf5JSe3nurAtdXmlGAyXy309c4+PcNgi9Yhyidxd
X-Gm-Gg: AfdE7cmongK5KaaMeoS1oyjqE86QYkOpRwAQJdiv1tBGhao9eh/3cXEOtSM4+n0kIoe
	tyxjgx0oSRnBE4u1oLh3VADQly8CWStK/dYoFxFOXoKqfkPtqPyn3g8PqWzSmq/LP1q5kNkyuZd
	EFPoTGs9R7AuIEAwbIpMa3f/WLJXaJq+tqKBwHRqUqWtN/YDpNKkBj8/4DLnoNtkR5dBn5J8Qa7
	kU3FJ8tDMydqFUGc2UieZZ3aoPmytNiYy/fAqLB7CYMsjiTXWuUj4v6OfLIBCm4fwlcoG7MEZLc
	pqlGWHy3TjaZI6k1tp0lfLlc3YQS23Jmb2eZ9HcpYQg06Zu2rYE6fSyc/td6mZ0L/G8HHelnXOx
	jbK8s3CkSExZiso87SnG8xeSNzyWjEXuwSbiewrDCeDjq0dk2uPWqsCRMkDVFOTjZ79LaqIek1p
	TYZFdU/37iwS5gNXrdYfF0HB2JrkybZrAgpCw=
X-Received: by 2002:a17:907:6d11:b0:bec:18d5:ddf5 with SMTP id a640c23a62f3a-c0b60a30acbmr467832166b.7.1782066725004;
        Sun, 21 Jun 2026 11:32:05 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e497e7dsm227762766b.5.2026.06.21.11.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 11:32:04 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH] fuse: replace passthrough backing-id IDR with IDA plus hashtable
Date: Sun, 21 Jun 2026 18:31:57 +0000
Message-ID: <20260621183157.3490-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The passthrough code maps an integer backing id to a struct fuse_backing
using an IDR. idr_alloc_cyclic() stores the fuse_backing pointer at the
id's index, so the IDR keeps one populated radix-tree slot per live id. A
comment flags the cost:

	/* FIXME: xarray might be space inefficient */

Replace the IDR with an IDA for id allocation and a separate hashtable for
the id-to-pointer lookup. The IDA needs far less memory per id; the
hashtable adds a fixed per-connection cost. The net effect is a space win
that grows with the number of live backings, as quantified below.

Both IDR and IDA are built on the xarray and walk the same xa_node
(XA_CHUNK_SIZE is 64 slots per node, and an xa_node is about 576 bytes on
64-bit). The difference is what fills those slots. The IDR stores one
fuse_backing pointer per id, so N live ids occupy N slots and need roughly
N/64 leaf nodes. The IDA stores a 128-byte bitmap that covers 1024 ids
(IDA_BITMAP_BITS), so the same N ids occupy about N/1024 slots. The id
space is the same; the IDA represents it far more densely.

In the dense limit the IDR costs about nine bytes per id (a 576-byte node
over 64 slots), while the IDA costs about 0.13 bytes per id (a 128-byte
bitmap over 1024 ids). 4096 live ids would occupy 65 xa_nodes in the IDR
(about 37 KB) versus roughly 3 KB for the IDA plus the 2 KB hashtable.
The fixed hashtable makes the new scheme slightly larger below a couple
hundred backings; above that it uses progressively less memory than the
IDR, and the gap widens as the count grows.

These figures assume dense, low-numbered ids, which is the most favorable
case for the IDR. Cyclic allocation drives ids upward and leaves holes as
backings are closed, spreading the IDR's live entries across more,
less-full leaf nodes; each IDA chunk still covers 1024 ids however they are
spread, so it degrades more slowly. The dense case is therefore the
smallest the gain gets; sparser ids only widen it.

The new fields in struct fuse_backing (an int id and a struct hlist_node)
add 24 bytes on x86-64, keeping the structure within the kmalloc-64 slab,
so per-object allocation should remain unchanged.

The hashtable has a fixed 256 buckets (DECLARE_HASHTABLE order 8), so
lookup time grows with the chain length, about N/256 on average, which is
O(N) in complexity. At a few thousand backings the chains hold one or two
entries; at a very large count (for example 100000 backings, about 390
per chain) this is slower than the IDR's bounded radix walk (at most six
levels for 31-bit ids, effectively O(1)). fuse_backing_lookup() runs once
when a passthrough file open attaches its backing, not on each read or
write, since passthrough I/O goes directly to the backing file, so the
cost stays off the data path. An rhashtable would keep lookup flat as the
count grows at the cost of more complexity; the fixed table was chosen
for simplicity.

The hashtable is 2 KB. Embedding it in struct fuse_conn would charge that
to every connection, including the majority that never enable passthrough,
so fc->backing_htable is a pointer allocated lazily by
fuse_backing_htable_alloc() when passthrough is negotiated in
process_init_reply(). The IDA itself stays embedded, since it is small. If
the allocation fails, passthrough is left disabled and init continues,
matching how the other negotiated features in process_init_reply() behave.
This preserves the invariant that fc->backing_htable is non-NULL exactly
when fc->passthrough is set. Every dereference of the table is in
fuse_backing_id_alloc(), fuse_backing_id_remove() or fuse_backing_lookup(),
all reached only through the BACKING_OPEN and BACKING_CLOSE ioctls, which
check fc->passthrough first. A connection that fails the allocation
therefore behaves like any non-passthrough connection, and the lookup paths
need no NULL checks.

The IDA has no cyclic allocator, so an explicit cursor
(backing_files_next_id) is kept: ida_alloc_range() searches from the cursor
to INT_MAX, and on -ENOSPC the cursor resets to 1 and the allocation is
retried exactly once. The cursor is accessed with READ_ONCE/WRITE_ONCE; two
concurrent allocators may read the same value, but the IDA still returns
distinct ids, so the cursor is only a hint to avoid immediate reuse.

Tested with KCSAN and with KASAN in separate builds, as the two are
mutually exclusive. KCSAN with lockdep and PROVE_RCU reported no data races
in fs/fuse under a passthrough workload. Under KASAN, a passthrough server
drove fuse_backing_lookup() and fuse_backing_id_remove() concurrently on
the same ids; a temporary udelay() in the lookup, not part of this series,
widened the window between the hashtable match and fuse_backing_get() so
the concurrent free reliably overlapped it. No KASAN, RCU-debug, or
kmemleak reports resulted. fio (16 jobs, io_uring, randrw 4k, 300s) over a
passthrough mount showed no significant throughput change against the IDR
version.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 fs/fuse/backing.c | 96 +++++++++++++++++++++++++++++++++++++----------
 fs/fuse/fuse_i.h  | 27 ++++++++++++-
 fs/fuse/inode.c   |  8 ++--
 3 files changed, 106 insertions(+), 25 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 472b6afa7dff..322d676bcc16 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -35,49 +35,97 @@ void fuse_backing_put(struct fuse_backing *fb)
 
 void fuse_backing_files_init(struct fuse_conn *fc)
 {
-	idr_init(&fc->backing_files_map);
+	ida_init(&fc->backing_files_map);
+	fc->backing_files_next_id = 1;
+	fc->backing_htable = NULL;
 }
 
 static int fuse_backing_id_alloc(struct fuse_conn *fc, struct fuse_backing *fb)
 {
 	int id;
+	int attempt = 1;
+
+retry:
+
+	id = ida_alloc_range(&fc->backing_files_map,
+			     READ_ONCE(fc->backing_files_next_id), INT_MAX, GFP_KERNEL);
+
+	if (id < 0) {
+		if (id == -ENOSPC && attempt--) {
+			WRITE_ONCE(fc->backing_files_next_id, 1);
+			goto retry;
+		}
+		return id;
+	}
+
+	fb->id = id;
 
-	idr_preload(GFP_KERNEL);
 	spin_lock(&fc->lock);
-	/* FIXME: xarray might be space inefficient */
-	id = idr_alloc_cyclic(&fc->backing_files_map, fb, 1, 0, GFP_ATOMIC);
+	hash_add_rcu(fc->backing_htable->backing_files_ht, &fb->node, id);
+	WRITE_ONCE(fc->backing_files_next_id, (id == INT_MAX) ? 1 : id + 1);
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
 	spin_unlock(&fc->lock);
 
+	if (fb)
+		ida_free(&fc->backing_files_map, id);
+
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
+		goto out;
 
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
+
+out:
+	ida_destroy(&fc->backing_files_map);
 }
 
 int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
@@ -169,10 +217,18 @@ int fuse_backing_close(struct fuse_conn *fc, int backing_id)
 
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
index 85f738c53122..7965c1681b58 100644
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
@@ -759,8 +770,14 @@ struct fuse_conn {
 	struct fuse_sync_bucket __rcu *curr_bucket;
 
 #ifdef CONFIG_FUSE_PASSTHROUGH
-	/** @backing_files_map: IDR for backing files ids */
-	struct idr backing_files_map;
+	/** @backing_files_map: IDA for backing files ids */
+	struct ida backing_files_map;
+
+	/** @backing_files_next_id: Cursor for cyclic allocation */
+	unsigned int backing_files_next_id;
+
+	/** @backing_htable: Pointer to external hashtable */
+	struct fuse_backing_htable *backing_htable;
 #endif
 };
 
@@ -1259,6 +1276,7 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 struct fuse_backing *fuse_backing_get(struct fuse_backing *fb);
 void fuse_backing_put(struct fuse_backing *fb);
 struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, int backing_id);
+int fuse_backing_htable_alloc(struct fuse_conn *fc);
 #else
 
 static inline struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
@@ -1274,6 +1292,11 @@ static inline struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc,
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

