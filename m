Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A9B3909A5
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 06:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057435; cv=none; b=G0R4W/gB/itWmO2LzSEMehsqTmbI17U6QAKlcZF7D1NqG/6Ih2lG5To4cS0PVyDWhIUA1+Uvfsuw+0cXQwOnCiCoT5MqgI4JDfme5/R32k7w1fFqlljbBSj+OCDGAW6kEwNW2oVrJT8ujQZ3HJbzcB+6BVdHGlUF7I4fdxmu8Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057435; c=relaxed/simple;
	bh=b0QHtrcrtYMZ/s8pU7kKGH6Gl9eOdrRIqR6dhFmfV98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=VkAmhperDDz7zN1xjdPutDcXi4FydqhgOqHUA+rq5Mf/PkCa87vqt3pKN/6g8lELNkaLjtPwvRLza/ufEFb66euz0kmqYrV94JooMT0ZWMD7Hq54SxLkPzURXBYs7ceqUp4YuSFDaj4jHeGhn7LkGEMRWAaNY9f66YYQFKZeqNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EgIhNNto; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EgIhNNto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790057431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8INg0/7CqTl4veYDMbXTklGackAp5PIMO2SUHoQx0xM=;
	b=EgIhNNtoRZBo4Jtf41vPAjYVtgTuzObbYAZbQQx8GYWE4qI3jdA8rfQ32iQeNICc5aWsy1
	NkwUPy3MuGYiB2C5NRQwJH9cr/VSNJW/NuI9Om4TNGoCLS8HWmLnnK5shShl7ObNL06iti
	nBiQ889cUK7m5zWv+UZDVErzAJaBU2c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-SBeGZKNCM_qBNoFJUhFgag-1; Tue, 22 Sep 2026 02:10:30 -0400
X-MC-Unique: SBeGZKNCM_qBNoFJUhFgag-1
X-Mimecast-MFC-AGG-ID: SBeGZKNCM_qBNoFJUhFgag_1790057429
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a9a69637eeso4728910a12.1
        for <fuse-devel@lists.linux.dev>; Mon, 21 Sep 2026 23:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057429; x=1790662229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8INg0/7CqTl4veYDMbXTklGackAp5PIMO2SUHoQx0xM=;
        b=IX+VI+pfuDl/n7/U6iL36SpMlW2Dnhb4PdG8L7DRjhq7L/22wCEruynofbfFyfkyLK
         WtmOQp1p7Z9KR3UAQ+4CoY2+IswAsYu5RX2Ly8KMMWux45fQspLLpIWlNdUvLqUNfQVu
         Mky86Ng+pugKep/4diPj4aD+uKXbu/W+Rj/EBkYmDDbGmoBxYyEUtiHYWVKq2WwkUoks
         zmdFp/OT9JrzXWTa4j1NY3lrWFYej/rNh6+7Cyn2l0OIsN1qBQtBYvzEc+srV1IRUxud
         GvM6EwYq+I7F3cViXXjbzEOxce83mJ+XKBdkF5cYIuufUt5ufRhoFy+VZd6dN1gmUVlo
         W/Vg==
X-Gm-Message-State: AFuF++k+oEAEuBWw3mSMFX7E//kBhPZD2ngKG3co03IypXD8SESAo+pN
	LIGJ5eUNsFtsCO2nmBV8vFGVCZsPl+Ts7YNPlp/p40X2mRGYBzVUNc1TRVn7gmQ9SMHLQsxM6/5
	ocztMR008Cv0EAzQU4M7ef2XSv17bU2Yfv+ts8z/3tqt4v5vT31waRkoPTMSTDeT8LtRhIPKAv4
	WrjOb/3PwltmGll08LvP0bnUxZ3FTd5t4t7RZP7ezLTodTWcc=
X-Gm-Gg: AYBFou1XrwOH5T+V68ugGnF9n+jmJ+57UErdrPh7ikleDIIUNpAwURyalVm9qiGkqne
	YzwwnMWIBhkYVVqUT8w0j/4Cd9E+PtzXLmhC+fnW5WQgp8RH4vbyvYWLKW/6RUCjJEQGZgIORtW
	G6M9tjt72p2blSAQZPQbWP+OQLN+rktStuMzZjnLsfiIdQRkWsTeVPGTSa5fVtTE03D4LEn4r6t
	myrseFic8dDfzQpqY+bfpg5HQdfXn4iW3jI6RU2DDbvDvYTq4x2N1D1cKfJGOe367Q+yb0GyviK
	9RYIpovo6CeHcjWqo4r/QeGa+stoXtWZg2n7k4YbStipc8Eh1spXaU1O5FIXcu01+pu87fpZW42
	0NO1BNE8heNzSeWzZURDWvKGKyD0icWc4rZV1jstpt02d9uDh9X6E
X-Received: by 2002:a05:6402:23c5:b0:6a6:37a3:2b0f with SMTP id 4fb4d7f45d1cf-6aa531566c2mr9165816a12.8.1790057428124;
        Mon, 21 Sep 2026 23:10:28 -0700 (PDT)
X-Received: by 2002:a05:6402:23c5:b0:6a6:37a3:2b0f with SMTP id 4fb4d7f45d1cf-6aa531566c2mr9165763a12.8.1790057427162;
        Mon, 21 Sep 2026 23:10:27 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-111.pool.digikabel.hu. [85.66.37.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440df9asm449826a12.4.2026.09.21.23.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:10:26 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>
Subject: [PATCH 02/11] fuse: use "vdax" naming for virtiofs DAX
Date: Tue, 22 Sep 2026 08:10:02 +0200
Message-ID: <20260922061019.3320196-3-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: dGLFaYtz2RR51CDHdoiJZyKyiR4eBtN3L9FWhMzNq_U_1790057429
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

We are introducing DAX functionality largely unrelated to the virtiofs
code.  Rename dax -> vdax for the virtiofs case for clarity.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dax.c       | 214 ++++++++++++++++++++++----------------------
 fs/fuse/dir.c       |   4 +-
 fs/fuse/file.c      |  36 ++++----
 fs/fuse/fuse_i.h    |  66 +++++++-------
 fs/fuse/inode.c     |  38 ++++----
 fs/fuse/iomode.c    |   4 +-
 fs/fuse/virtio_fs.c |  18 ++--
 7 files changed, 190 insertions(+), 190 deletions(-)

diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 32c88ef81434..7905e7b36644 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * dax: direct host memory access
+ * dax: direct host memory access for virtiofs
  * Copyright (C) 2020 Red Hat, Inc.
  */
 
@@ -59,7 +59,7 @@ struct fuse_dax_mapping {
 };
 
 /* Per-inode dax map */
-struct fuse_inode_dax {
+struct fuse_inode_vdax {
 	/* Semaphore to protect modifications to the dmap tree */
 	struct rw_semaphore sem;
 
@@ -68,7 +68,7 @@ struct fuse_inode_dax {
 	unsigned long nr;
 };
 
-struct fuse_conn_dax {
+struct fuse_conn_vdax {
 	/* DAX device */
 	struct dax_device *dev;
 
@@ -102,10 +102,10 @@ node_to_dmap(struct interval_tree_node *node)
 }
 
 static struct fuse_dax_mapping *
-alloc_dax_mapping_reclaim(struct fuse_conn_dax *fcd, struct inode *inode);
+alloc_dax_mapping_reclaim(struct fuse_conn_vdax *fcd, struct inode *inode);
 
 static void
-__kick_dmap_free_worker(struct fuse_conn_dax *fcd, unsigned long delay_ms)
+__kick_dmap_free_worker(struct fuse_conn_vdax *fcd, unsigned long delay_ms)
 {
 	unsigned long free_threshold;
 
@@ -117,7 +117,7 @@ __kick_dmap_free_worker(struct fuse_conn_dax *fcd, unsigned long delay_ms)
 				   msecs_to_jiffies(delay_ms));
 }
 
-static void kick_dmap_free_worker(struct fuse_conn_dax *fcd,
+static void kick_dmap_free_worker(struct fuse_conn_vdax *fcd,
 				  unsigned long delay_ms)
 {
 	spin_lock(&fcd->lock);
@@ -125,7 +125,7 @@ static void kick_dmap_free_worker(struct fuse_conn_dax *fcd,
 	spin_unlock(&fcd->lock);
 }
 
-static struct fuse_dax_mapping *alloc_dax_mapping(struct fuse_conn_dax *fcd)
+static struct fuse_dax_mapping *alloc_dax_mapping(struct fuse_conn_vdax *fcd)
 {
 	struct fuse_dax_mapping *dmap;
 
@@ -144,7 +144,7 @@ static struct fuse_dax_mapping *alloc_dax_mapping(struct fuse_conn_dax *fcd)
 }
 
 /* This assumes fcd->lock is held */
-static void __dmap_remove_busy_list(struct fuse_conn_dax *fcd,
+static void __dmap_remove_busy_list(struct fuse_conn_vdax *fcd,
 				    struct fuse_dax_mapping *dmap)
 {
 	list_del_init(&dmap->busy_list);
@@ -152,7 +152,7 @@ static void __dmap_remove_busy_list(struct fuse_conn_dax *fcd,
 	fcd->nr_busy_ranges--;
 }
 
-static void dmap_remove_busy_list(struct fuse_conn_dax *fcd,
+static void dmap_remove_busy_list(struct fuse_conn_vdax *fcd,
 				  struct fuse_dax_mapping *dmap)
 {
 	spin_lock(&fcd->lock);
@@ -161,7 +161,7 @@ static void dmap_remove_busy_list(struct fuse_conn_dax *fcd,
 }
 
 /* This assumes fcd->lock is held */
-static void __dmap_add_to_free_pool(struct fuse_conn_dax *fcd,
+static void __dmap_add_to_free_pool(struct fuse_conn_vdax *fcd,
 				struct fuse_dax_mapping *dmap)
 {
 	list_add_tail(&dmap->list, &fcd->free_ranges);
@@ -169,7 +169,7 @@ static void __dmap_add_to_free_pool(struct fuse_conn_dax *fcd,
 	wake_up(&fcd->range_waitq);
 }
 
-static void dmap_add_to_free_pool(struct fuse_conn_dax *fcd,
+static void dmap_add_to_free_pool(struct fuse_conn_vdax *fcd,
 				struct fuse_dax_mapping *dmap)
 {
 	/* Return fuse_dax_mapping to free list */
@@ -183,7 +183,7 @@ static int fuse_setup_one_mapping(struct inode *inode, unsigned long start_idx,
 				  bool upgrade)
 {
 	struct fuse_mount *fm = get_fuse_mount(inode);
-	struct fuse_conn_dax *fcd = fm->fc->dax;
+	struct fuse_conn_vdax *fcd = fm->fc->vdax;
 	struct fuse_inode *fi = get_fuse_inode(inode);
 	struct fuse_setupmapping_in inarg;
 	loff_t offset = start_idx << FUSE_DAX_SHIFT;
@@ -218,9 +218,9 @@ static int fuse_setup_one_mapping(struct inode *inode, unsigned long start_idx,
 		 */
 		dmap->inode = inode;
 		dmap->itn.start = dmap->itn.last = start_idx;
-		/* Protected by fi->dax->sem */
-		interval_tree_insert(&dmap->itn, &fi->dax->tree);
-		fi->dax->nr++;
+		/* Protected by fi->vdax->sem */
+		interval_tree_insert(&dmap->itn, &fi->vdax->tree);
+		fi->vdax->nr++;
 		spin_lock(&fcd->lock);
 		list_add_tail(&dmap->busy_list, &fcd->busy_ranges);
 		fcd->nr_busy_ranges++;
@@ -288,7 +288,7 @@ static int dmap_removemapping_list(struct inode *inode, unsigned int num,
  * Cleanup dmap entry and add back to free list. This should be called with
  * fcd->lock held.
  */
-static void dmap_reinit_add_to_free_pool(struct fuse_conn_dax *fcd,
+static void dmap_reinit_add_to_free_pool(struct fuse_conn_vdax *fcd,
 					    struct fuse_dax_mapping *dmap)
 {
 	pr_debug("fuse: freeing memory range start_idx=0x%lx end_idx=0x%lx window_offset=0x%llx length=0x%llx\n",
@@ -306,7 +306,7 @@ static void dmap_reinit_add_to_free_pool(struct fuse_conn_dax *fcd,
  * called from evict_inode() path where we know all dmap entries can be
  * reclaimed.
  */
-static void inode_reclaim_dmap_range(struct fuse_conn_dax *fcd,
+static void inode_reclaim_dmap_range(struct fuse_conn_vdax *fcd,
 				     struct inode *inode,
 				     loff_t start, loff_t end)
 {
@@ -319,14 +319,14 @@ static void inode_reclaim_dmap_range(struct fuse_conn_dax *fcd,
 	struct interval_tree_node *node;
 
 	while (1) {
-		node = interval_tree_iter_first(&fi->dax->tree, start_idx,
+		node = interval_tree_iter_first(&fi->vdax->tree, start_idx,
 						end_idx);
 		if (!node)
 			break;
 		dmap = node_to_dmap(node);
 		/* inode is going away. There should not be any users of dmap */
 		WARN_ON(refcount_read(&dmap->refcnt) > 1);
-		interval_tree_remove(&dmap->itn, &fi->dax->tree);
+		interval_tree_remove(&dmap->itn, &fi->vdax->tree);
 		num++;
 		list_add(&dmap->list, &to_remove);
 	}
@@ -335,8 +335,8 @@ static void inode_reclaim_dmap_range(struct fuse_conn_dax *fcd,
 	if (list_empty(&to_remove))
 		return;
 
-	WARN_ON(fi->dax->nr < num);
-	fi->dax->nr -= num;
+	WARN_ON(fi->vdax->nr < num);
+	fi->vdax->nr -= num;
 	err = dmap_removemapping_list(inode, num, &to_remove);
 	if (err && err != -ENOTCONN) {
 		pr_warn("Failed to removemappings. start=0x%llx end=0x%llx\n",
@@ -367,11 +367,11 @@ static int dmap_removemapping_one(struct inode *inode,
 
 /*
  * It is called from evict_inode() and by that time inode is going away. So
- * this function does not take any locks like fi->dax->sem for traversing
+ * this function does not take any locks like fi->vdax->sem for traversing
  * that fuse inode interval tree. If that lock is taken then lock validator
  * complains of deadlock situation w.r.t fs_reclaim lock.
  */
-void fuse_dax_inode_cleanup(struct inode *inode)
+void fuse_vdax_inode_cleanup(struct inode *inode)
 {
 	struct fuse_conn *fc = get_fuse_conn(inode);
 	struct fuse_inode *fi = get_fuse_inode(inode);
@@ -381,8 +381,8 @@ void fuse_dax_inode_cleanup(struct inode *inode)
 	 * before we arrive here. So we should not have to worry about any
 	 * pages/exception entries still associated with inode.
 	 */
-	inode_reclaim_dmap_range(fc->dax, inode, 0, -1);
-	WARN_ON(fi->dax->nr);
+	inode_reclaim_dmap_range(fc->vdax, inode, 0, -1);
+	WARN_ON(fi->vdax->nr);
 }
 
 static void fuse_fill_iomap_hole(struct iomap *iomap, loff_t length)
@@ -414,7 +414,7 @@ static void fuse_fill_iomap(struct inode *inode, loff_t pos, loff_t length,
 		iomap->type = IOMAP_MAPPED;
 		/*
 		 * increace refcnt so that reclaim code knows this dmap is in
-		 * use. This assumes fi->dax->sem mutex is held either
+		 * use. This assumes fi->vdax->sem mutex is held either
 		 * shared/exclusive.
 		 */
 		refcount_inc(&dmap->refcnt);
@@ -434,7 +434,7 @@ static int fuse_setup_new_dax_mapping(struct inode *inode, loff_t pos,
 {
 	struct fuse_inode *fi = get_fuse_inode(inode);
 	struct fuse_conn *fc = get_fuse_conn(inode);
-	struct fuse_conn_dax *fcd = fc->dax;
+	struct fuse_conn_vdax *fcd = fc->vdax;
 	struct fuse_dax_mapping *dmap, *alloc_dmap = NULL;
 	int ret;
 	bool writable = flags & IOMAP_WRITE;
@@ -469,17 +469,17 @@ static int fuse_setup_new_dax_mapping(struct inode *inode, loff_t pos,
 	 * Take write lock so that only one caller can try to setup mapping
 	 * and other waits.
 	 */
-	down_write(&fi->dax->sem);
+	down_write(&fi->vdax->sem);
 	/*
 	 * We dropped lock. Check again if somebody else setup
 	 * mapping already.
 	 */
-	node = interval_tree_iter_first(&fi->dax->tree, start_idx, start_idx);
+	node = interval_tree_iter_first(&fi->vdax->tree, start_idx, start_idx);
 	if (node) {
 		dmap = node_to_dmap(node);
 		fuse_fill_iomap(inode, pos, length, iomap, dmap, flags);
 		dmap_add_to_free_pool(fcd, alloc_dmap);
-		up_write(&fi->dax->sem);
+		up_write(&fi->vdax->sem);
 		return 0;
 	}
 
@@ -488,11 +488,11 @@ static int fuse_setup_new_dax_mapping(struct inode *inode, loff_t pos,
 				     writable, false);
 	if (ret < 0) {
 		dmap_add_to_free_pool(fcd, alloc_dmap);
-		up_write(&fi->dax->sem);
+		up_write(&fi->vdax->sem);
 		return ret;
 	}
 	fuse_fill_iomap(inode, pos, length, iomap, alloc_dmap, flags);
-	up_write(&fi->dax->sem);
+	up_write(&fi->vdax->sem);
 	return 0;
 }
 
@@ -510,14 +510,14 @@ static int fuse_upgrade_dax_mapping(struct inode *inode, loff_t pos,
 	 * Take exclusive lock so that only one caller can try to setup
 	 * mapping and others wait.
 	 */
-	down_write(&fi->dax->sem);
-	node = interval_tree_iter_first(&fi->dax->tree, idx, idx);
+	down_write(&fi->vdax->sem);
+	node = interval_tree_iter_first(&fi->vdax->tree, idx, idx);
 
 	/* We are holding either inode lock or invalidate_lock, and that should
 	 * ensure that dmap can't be truncated. We are holding a reference
 	 * on dmap and that should make sure it can't be reclaimed. So dmap
 	 * should still be there in tree despite the fact we dropped and
-	 * re-acquired the fi->dax->sem lock.
+	 * re-acquired the fi->vdax->sem lock.
 	 */
 	ret = -EIO;
 	if (WARN_ON(!node))
@@ -526,7 +526,7 @@ static int fuse_upgrade_dax_mapping(struct inode *inode, loff_t pos,
 	dmap = node_to_dmap(node);
 
 	/* We took an extra reference on dmap to make sure its not reclaimd.
-	 * Now we hold fi->dax->sem lock and that reference is not needed
+	 * Now we hold fi->vdax->sem lock and that reference is not needed
 	 * anymore. Drop it.
 	 */
 	if (refcount_dec_and_test(&dmap->refcnt)) {
@@ -551,7 +551,7 @@ static int fuse_upgrade_dax_mapping(struct inode *inode, loff_t pos,
 out_fill_iomap:
 	fuse_fill_iomap(inode, pos, length, iomap, dmap, flags);
 out_err:
-	up_write(&fi->dax->sem);
+	up_write(&fi->vdax->sem);
 	return ret;
 }
 
@@ -576,7 +576,7 @@ static int fuse_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
 	iomap->offset = pos;
 	iomap->flags = 0;
 	iomap->bdev = NULL;
-	iomap->dax_dev = fc->dax->dev;
+	iomap->dax_dev = fc->vdax->dev;
 
 	/*
 	 * Both read/write and mmap path can race here. So we need something
@@ -585,33 +585,33 @@ static int fuse_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
 	 * For now, use a semaphore for this. It probably needs to be
 	 * optimized later.
 	 */
-	down_read(&fi->dax->sem);
-	node = interval_tree_iter_first(&fi->dax->tree, start_idx, start_idx);
+	down_read(&fi->vdax->sem);
+	node = interval_tree_iter_first(&fi->vdax->tree, start_idx, start_idx);
 	if (node) {
 		dmap = node_to_dmap(node);
 		if (writable && !dmap->writable) {
 			/* Upgrade read-only mapping to read-write. This will
-			 * require exclusive fi->dax->sem lock as we don't want
+			 * require exclusive fi->vdax->sem lock as we don't want
 			 * two threads to be trying to this simultaneously
 			 * for same dmap. So drop shared lock and acquire
 			 * exclusive lock.
 			 *
-			 * Before dropping fi->dax->sem lock, take reference
+			 * Before dropping fi->vdax->sem lock, take reference
 			 * on dmap so that its not freed by range reclaim.
 			 */
 			refcount_inc(&dmap->refcnt);
-			up_read(&fi->dax->sem);
+			up_read(&fi->vdax->sem);
 			pr_debug("%s: Upgrading mapping at offset 0x%llx length 0x%llx\n",
 				 __func__, pos, length);
 			return fuse_upgrade_dax_mapping(inode, pos, length,
 							flags, iomap);
 		} else {
 			fuse_fill_iomap(inode, pos, length, iomap, dmap, flags);
-			up_read(&fi->dax->sem);
+			up_read(&fi->vdax->sem);
 			return 0;
 		}
 	} else {
-		up_read(&fi->dax->sem);
+		up_read(&fi->vdax->sem);
 		pr_debug("%s: no mapping at offset 0x%llx length 0x%llx\n",
 				__func__, pos, length);
 		if (pos >= i_size_read(inode))
@@ -668,14 +668,14 @@ static void fuse_wait_dax_page(struct inode *inode)
 }
 
 /* Should be called with mapping->invalidate_lock held exclusively. */
-int fuse_dax_break_layouts(struct inode *inode, u64 dmap_start,
+int fuse_vdax_break_layouts(struct inode *inode, u64 dmap_start,
 				  u64 dmap_end)
 {
 	return dax_break_layout(inode, dmap_start, dmap_end,
 				fuse_wait_dax_page);
 }
 
-ssize_t fuse_dax_read_iter(struct kiocb *iocb, struct iov_iter *to)
+ssize_t fuse_vdax_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
 	ssize_t ret;
@@ -715,7 +715,7 @@ static ssize_t fuse_dax_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	return ret;
 }
 
-ssize_t fuse_dax_write_iter(struct kiocb *iocb, struct iov_iter *from)
+ssize_t fuse_vdax_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
 	ssize_t ret;
@@ -761,7 +761,7 @@ static vm_fault_t __fuse_dax_fault(struct vm_fault *vmf, unsigned int order,
 	unsigned long pfn;
 	int error = 0;
 	struct fuse_conn *fc = get_fuse_conn(inode);
-	struct fuse_conn_dax *fcd = fc->dax;
+	struct fuse_conn_vdax *fcd = fc->vdax;
 	bool retry = false;
 
 	if (write)
@@ -822,7 +822,7 @@ static const struct vm_operations_struct fuse_dax_vm_ops = {
 	.pfn_mkwrite	= fuse_dax_pfn_mkwrite,
 };
 
-int fuse_dax_mmap(struct file *file, struct vm_area_struct *vma)
+int fuse_vdax_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	file_accessed(file);
 	vma->vm_ops = &fuse_dax_vm_ops;
@@ -870,8 +870,8 @@ static int reclaim_one_dmap_locked(struct inode *inode,
 		return ret;
 
 	/* Remove dax mapping from inode interval tree now */
-	interval_tree_remove(&dmap->itn, &fi->dax->tree);
-	fi->dax->nr--;
+	interval_tree_remove(&dmap->itn, &fi->vdax->tree);
+	fi->vdax->nr--;
 
 	/* It is possible that umount/shutdown has killed the fuse connection
 	 * and worker thread is trying to reclaim memory in parallel.  Don't
@@ -886,7 +886,7 @@ static int reclaim_one_dmap_locked(struct inode *inode,
 }
 
 /* Find first mapped dmap for an inode and return file offset. Caller needs
- * to hold fi->dax->sem lock either shared or exclusive.
+ * to hold fi->vdax->sem lock either shared or exclusive.
  */
 static struct fuse_dax_mapping *inode_lookup_first_dmap(struct inode *inode)
 {
@@ -894,7 +894,7 @@ static struct fuse_dax_mapping *inode_lookup_first_dmap(struct inode *inode)
 	struct fuse_dax_mapping *dmap;
 	struct interval_tree_node *node;
 
-	for (node = interval_tree_iter_first(&fi->dax->tree, 0, -1); node;
+	for (node = interval_tree_iter_first(&fi->vdax->tree, 0, -1); node;
 	     node = interval_tree_iter_next(node, 0, -1)) {
 		dmap = node_to_dmap(node);
 		/* still in use. */
@@ -912,7 +912,7 @@ static struct fuse_dax_mapping *inode_lookup_first_dmap(struct inode *inode)
  * it back to free pool.
  */
 static struct fuse_dax_mapping *
-inode_inline_reclaim_one_dmap(struct fuse_conn_dax *fcd, struct inode *inode,
+inode_inline_reclaim_one_dmap(struct fuse_conn_vdax *fcd, struct inode *inode,
 			      bool *retry)
 {
 	struct fuse_inode *fi = get_fuse_inode(inode);
@@ -925,14 +925,14 @@ inode_inline_reclaim_one_dmap(struct fuse_conn_dax *fcd, struct inode *inode,
 	filemap_invalidate_lock(inode->i_mapping);
 
 	/* Lookup a dmap and corresponding file offset to reclaim. */
-	down_read(&fi->dax->sem);
+	down_read(&fi->vdax->sem);
 	dmap = inode_lookup_first_dmap(inode);
 	if (dmap) {
 		start_idx = dmap->itn.start;
 		dmap_start = start_idx << FUSE_DAX_SHIFT;
 		dmap_end = dmap_start + FUSE_DAX_SZ - 1;
 	}
-	up_read(&fi->dax->sem);
+	up_read(&fi->vdax->sem);
 
 	if (!dmap)
 		goto out_mmap_sem;
@@ -940,16 +940,16 @@ inode_inline_reclaim_one_dmap(struct fuse_conn_dax *fcd, struct inode *inode,
 	 * Make sure there are no references to inode pages using
 	 * get_user_pages()
 	 */
-	ret = fuse_dax_break_layouts(inode, dmap_start, dmap_end);
+	ret = fuse_vdax_break_layouts(inode, dmap_start, dmap_end);
 	if (ret) {
-		pr_debug("fuse: fuse_dax_break_layouts() failed. err=%d\n",
+		pr_debug("fuse: fuse_vdax_break_layouts() failed. err=%d\n",
 			 ret);
 		dmap = ERR_PTR(ret);
 		goto out_mmap_sem;
 	}
 
-	down_write(&fi->dax->sem);
-	node = interval_tree_iter_first(&fi->dax->tree, start_idx, start_idx);
+	down_write(&fi->vdax->sem);
+	node = interval_tree_iter_first(&fi->vdax->tree, start_idx, start_idx);
 	/* Range already got reclaimed by somebody else */
 	if (!node) {
 		if (retry)
@@ -981,14 +981,14 @@ inode_inline_reclaim_one_dmap(struct fuse_conn_dax *fcd, struct inode *inode,
 		 __func__, inode, dmap->window_offset, dmap->length);
 
 out_write_dmap_sem:
-	up_write(&fi->dax->sem);
+	up_write(&fi->vdax->sem);
 out_mmap_sem:
 	filemap_invalidate_unlock(inode->i_mapping);
 	return dmap;
 }
 
 static struct fuse_dax_mapping *
-alloc_dax_mapping_reclaim(struct fuse_conn_dax *fcd, struct inode *inode)
+alloc_dax_mapping_reclaim(struct fuse_conn_vdax *fcd, struct inode *inode)
 {
 	struct fuse_dax_mapping *dmap;
 	struct fuse_inode *fi = get_fuse_inode(inode);
@@ -1015,18 +1015,18 @@ alloc_dax_mapping_reclaim(struct fuse_conn_dax *fcd, struct inode *inode)
 		 * if a deadlock is possible if we sleep with
 		 * mapping->invalidate_lock held and worker to free memory
 		 * can't make progress due to unavailability of
-		 * mapping->invalidate_lock.  So sleep only if fi->dax->nr=0
+		 * mapping->invalidate_lock.  So sleep only if fi->vdax->nr=0
 		 */
 		if (retry)
 			continue;
 		/*
 		 * There are no mappings which can be reclaimed. Wait for one.
-		 * We are not holding fi->dax->sem. So it is possible
+		 * We are not holding fi->vdax->sem. So it is possible
 		 * that range gets added now. But as we are not holding
 		 * mapping->invalidate_lock, worker should still be able to
 		 * free up a range and wake us up.
 		 */
-		if (!fi->dax->nr && !(fcd->nr_free_ranges > 0)) {
+		if (!fi->vdax->nr && !(fcd->nr_free_ranges > 0)) {
 			if (wait_event_killable_exclusive(fcd->range_waitq,
 					(fcd->nr_free_ranges > 0))) {
 				return ERR_PTR(-EINTR);
@@ -1035,7 +1035,7 @@ alloc_dax_mapping_reclaim(struct fuse_conn_dax *fcd, struct inode *inode)
 	}
 }
 
-static int lookup_and_reclaim_dmap_locked(struct fuse_conn_dax *fcd,
+static int lookup_and_reclaim_dmap_locked(struct fuse_conn_vdax *fcd,
 					  struct inode *inode,
 					  unsigned long start_idx)
 {
@@ -1045,7 +1045,7 @@ static int lookup_and_reclaim_dmap_locked(struct fuse_conn_dax *fcd,
 	struct interval_tree_node *node;
 
 	/* Find fuse dax mapping at file offset inode. */
-	node = interval_tree_iter_first(&fi->dax->tree, start_idx, start_idx);
+	node = interval_tree_iter_first(&fi->vdax->tree, start_idx, start_idx);
 
 	/* Range already got cleaned up by somebody else */
 	if (!node)
@@ -1071,10 +1071,10 @@ static int lookup_and_reclaim_dmap_locked(struct fuse_conn_dax *fcd,
  * Free a range of memory.
  * Locking:
  * 1. Take mapping->invalidate_lock to block dax faults.
- * 2. Take fi->dax->sem to protect interval tree and also to make sure
+ * 2. Take fi->vdax->sem to protect interval tree and also to make sure
  *    read/write can not reuse a dmap which we might be freeing.
  */
-static int lookup_and_reclaim_dmap(struct fuse_conn_dax *fcd,
+static int lookup_and_reclaim_dmap(struct fuse_conn_vdax *fcd,
 				   struct inode *inode,
 				   unsigned long start_idx,
 				   unsigned long end_idx)
@@ -1085,22 +1085,22 @@ static int lookup_and_reclaim_dmap(struct fuse_conn_dax *fcd,
 	loff_t dmap_end = (dmap_start + FUSE_DAX_SZ) - 1;
 
 	filemap_invalidate_lock(inode->i_mapping);
-	ret = fuse_dax_break_layouts(inode, dmap_start, dmap_end);
+	ret = fuse_vdax_break_layouts(inode, dmap_start, dmap_end);
 	if (ret) {
-		pr_debug("virtio_fs: fuse_dax_break_layouts() failed. err=%d\n",
+		pr_debug("virtio_fs: fuse_vdax_break_layouts() failed. err=%d\n",
 			 ret);
 		goto out_mmap_sem;
 	}
 
-	down_write(&fi->dax->sem);
+	down_write(&fi->vdax->sem);
 	ret = lookup_and_reclaim_dmap_locked(fcd, inode, start_idx);
-	up_write(&fi->dax->sem);
+	up_write(&fi->vdax->sem);
 out_mmap_sem:
 	filemap_invalidate_unlock(inode->i_mapping);
 	return ret;
 }
 
-static int try_to_free_dmap_chunks(struct fuse_conn_dax *fcd,
+static int try_to_free_dmap_chunks(struct fuse_conn_vdax *fcd,
 				   unsigned long nr_to_free)
 {
 	struct fuse_dax_mapping *dmap, *pos, *temp;
@@ -1161,7 +1161,7 @@ static int try_to_free_dmap_chunks(struct fuse_conn_dax *fcd,
 static void fuse_dax_free_mem_worker(struct work_struct *work)
 {
 	int ret;
-	struct fuse_conn_dax *fcd = container_of(work, struct fuse_conn_dax,
+	struct fuse_conn_vdax *fcd = container_of(work, struct fuse_conn_vdax,
 						 free_work.work);
 	ret = try_to_free_dmap_chunks(fcd, FUSE_DAX_RECLAIM_CHUNK);
 	if (ret) {
@@ -1186,16 +1186,16 @@ static void fuse_free_dax_mem_ranges(struct list_head *mem_list)
 	}
 }
 
-void fuse_dax_conn_free(struct fuse_conn *fc)
+void fuse_vdax_conn_free(struct fuse_conn *fc)
 {
-	if (fc->dax) {
-		fuse_free_dax_mem_ranges(&fc->dax->free_ranges);
-		kfree(fc->dax);
-		fc->dax = NULL;
+	if (fc->vdax) {
+		fuse_free_dax_mem_ranges(&fc->vdax->free_ranges);
+		kfree(fc->vdax);
+		fc->vdax = NULL;
 	}
 }
 
-static int fuse_dax_mem_range_init(struct fuse_conn_dax *fcd)
+static int fuse_dax_mem_range_init(struct fuse_conn_vdax *fcd)
 {
 	long nr_pages, nr_ranges;
 	struct fuse_dax_mapping *range;
@@ -1247,13 +1247,13 @@ static int fuse_dax_mem_range_init(struct fuse_conn_dax *fcd)
 	return ret;
 }
 
-int fuse_dax_conn_alloc(struct fuse_conn *fc, enum fuse_dax_mode dax_mode,
+int fuse_vdax_conn_alloc(struct fuse_conn *fc, enum fuse_vdax_mode dax_mode,
 			struct dax_device *dax_dev)
 {
-	struct fuse_conn_dax *fcd;
+	struct fuse_conn_vdax *fcd;
 	int err;
 
-	fc->dax_mode = dax_mode;
+	fc->vdax_mode = dax_mode;
 
 	if (!dax_dev)
 		return 0;
@@ -1270,22 +1270,22 @@ int fuse_dax_conn_alloc(struct fuse_conn *fc, enum fuse_dax_mode dax_mode,
 		return err;
 	}
 
-	fc->dax = fcd;
+	fc->vdax = fcd;
 	return 0;
 }
 
-bool fuse_dax_inode_alloc(struct super_block *sb, struct fuse_inode *fi)
+bool fuse_vdax_inode_alloc(struct super_block *sb, struct fuse_inode *fi)
 {
 	struct fuse_conn *fc = get_fuse_conn_super(sb);
 
-	fi->dax = NULL;
-	if (fc->dax) {
-		fi->dax = kzalloc_obj(*fi->dax, GFP_KERNEL_ACCOUNT);
-		if (!fi->dax)
+	fi->vdax = NULL;
+	if (fc->vdax) {
+		fi->vdax = kzalloc_obj(*fi->vdax, GFP_KERNEL_ACCOUNT);
+		if (!fi->vdax)
 			return false;
 
-		init_rwsem(&fi->dax->sem);
-		fi->dax->tree = RB_ROOT_CACHED;
+		init_rwsem(&fi->vdax->sem);
+		fi->vdax->tree = RB_ROOT_CACHED;
 	}
 
 	return true;
@@ -1299,26 +1299,26 @@ static const struct address_space_operations fuse_dax_file_aops  = {
 static bool fuse_should_enable_dax(struct inode *inode, unsigned int flags)
 {
 	struct fuse_conn *fc = get_fuse_conn(inode);
-	enum fuse_dax_mode dax_mode = fc->dax_mode;
+	enum fuse_vdax_mode dax_mode = fc->vdax_mode;
 
-	if (dax_mode == FUSE_DAX_NEVER)
+	if (dax_mode == FUSE_VDAX_NEVER)
 		return false;
 
 	/*
-	 * fc->dax may be NULL in 'inode' mode when filesystem device doesn't
+	 * fc->vdax may be NULL in 'inode' mode when filesystem device doesn't
 	 * support DAX, in which case it will silently fallback to 'never' mode.
 	 */
-	if (!fc->dax)
+	if (!fc->vdax)
 		return false;
 
-	if (dax_mode == FUSE_DAX_ALWAYS)
+	if (dax_mode == FUSE_VDAX_ALWAYS)
 		return true;
 
 	/* dax_mode is FUSE_DAX_INODE* */
-	return fc->inode_dax && (flags & FUSE_ATTR_DAX);
+	return fc->inode_vdax && (flags & FUSE_ATTR_DAX);
 }
 
-void fuse_dax_inode_init(struct inode *inode, unsigned int flags)
+void fuse_vdax_inode_init(struct inode *inode, unsigned int flags)
 {
 	if (!fuse_should_enable_dax(inode, flags))
 		return;
@@ -1327,18 +1327,18 @@ void fuse_dax_inode_init(struct inode *inode, unsigned int flags)
 	inode->i_data.a_ops = &fuse_dax_file_aops;
 }
 
-void fuse_dax_dontcache(struct inode *inode, unsigned int flags)
+void fuse_vdax_dontcache(struct inode *inode, unsigned int flags)
 {
 	struct fuse_conn *fc = get_fuse_conn(inode);
 
-	if (fuse_is_inode_dax_mode(fc->dax_mode) &&
+	if (fuse_is_inode_vdax_mode(fc->vdax_mode) &&
 	    ((bool) IS_DAX(inode) != (bool) (flags & FUSE_ATTR_DAX)))
 		d_mark_dontcache(inode);
 }
 
-bool fuse_dax_check_alignment(struct fuse_conn *fc, unsigned int map_alignment)
+bool fuse_vdax_check_alignment(struct fuse_conn *fc, unsigned int map_alignment)
 {
-	if (fc->dax && (map_alignment > FUSE_DAX_SHIFT)) {
+	if (fc->vdax && (map_alignment > FUSE_DAX_SHIFT)) {
 		pr_warn("FUSE: map_alignment %u incompatible with dax mem range size %u\n",
 			map_alignment, FUSE_DAX_SZ);
 		return false;
@@ -1346,12 +1346,12 @@ bool fuse_dax_check_alignment(struct fuse_conn *fc, unsigned int map_alignment)
 	return true;
 }
 
-void fuse_dax_cancel_work(struct fuse_conn *fc)
+void fuse_vdax_cancel_work(struct fuse_conn *fc)
 {
-	struct fuse_conn_dax *fcd = fc->dax;
+	struct fuse_conn_vdax *fcd = fc->vdax;
 
 	if (fcd)
 		cancel_delayed_work_sync(&fcd->free_work);
 
 }
-EXPORT_SYMBOL_GPL(fuse_dax_cancel_work);
+EXPORT_SYMBOL_GPL(fuse_vdax_cancel_work);
diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index e49b4e874b15..f48fafccce4b 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -2174,10 +2174,10 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		is_truncate = true;
 	}
 
-	if (FUSE_IS_DAX(inode) && is_truncate) {
+	if (FUSE_IS_VDAX(inode) && is_truncate) {
 		filemap_invalidate_lock(mapping);
 		fault_blocked = true;
-		err = fuse_dax_break_layouts(inode, 0, -1);
+		err = fuse_vdax_break_layouts(inode, 0, -1);
 		if (err)
 			goto unlock;
 	}
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 4bdf5dec2cb9..1eadeca0c47d 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -119,7 +119,7 @@ static void fuse_file_put(struct fuse_file *ff, bool sync)
 			 * DAX inodes may need to issue a number of synchronous
 			 * request for clearing the mappings.
 			 */
-			if (ra && ra->inode && FUSE_IS_DAX(ra->inode))
+			if (ra && ra->inode && FUSE_IS_VDAX(ra->inode))
 				args->may_block = true;
 			args->end = fuse_release_end;
 			if (fuse_simple_background(ff->fm, args,
@@ -256,7 +256,7 @@ static int fuse_open(struct inode *inode, struct file *file)
 	int err;
 	bool is_truncate = (file->f_flags & O_TRUNC) && fc->atomic_o_trunc;
 	bool is_wb_truncate = is_truncate && fc->writeback_cache;
-	bool dax_truncate = is_truncate && FUSE_IS_DAX(inode);
+	bool vdax_truncate = is_truncate && FUSE_IS_VDAX(inode);
 
 	if (fuse_is_bad(inode))
 		return -EIO;
@@ -265,17 +265,17 @@ static int fuse_open(struct inode *inode, struct file *file)
 	if (err)
 		return err;
 
-	if (is_wb_truncate || dax_truncate)
+	if (is_wb_truncate || vdax_truncate)
 		inode_lock(inode);
 
-	if (dax_truncate) {
+	if (vdax_truncate) {
 		filemap_invalidate_lock(inode->i_mapping);
-		err = fuse_dax_break_layouts(inode, 0, -1);
+		err = fuse_vdax_break_layouts(inode, 0, -1);
 		if (err)
 			goto out_unlock;
 	}
 
-	if (is_wb_truncate || dax_truncate)
+	if (is_wb_truncate || vdax_truncate)
 		fuse_set_nowrite(inode);
 
 	err = fuse_do_open(fm, get_node_id(inode), file, false);
@@ -288,7 +288,7 @@ static int fuse_open(struct inode *inode, struct file *file)
 			fuse_truncate_update_attr(inode, file);
 	}
 
-	if (is_wb_truncate || dax_truncate)
+	if (is_wb_truncate || vdax_truncate)
 		fuse_release_nowrite(inode);
 	if (!err) {
 		if (is_truncate)
@@ -297,9 +297,9 @@ static int fuse_open(struct inode *inode, struct file *file)
 			invalidate_inode_pages2(inode->i_mapping);
 	}
 out_unlock:
-	if (dax_truncate)
+	if (vdax_truncate)
 		filemap_invalidate_unlock(inode->i_mapping);
-	if (is_wb_truncate || dax_truncate)
+	if (is_wb_truncate || vdax_truncate)
 		inode_unlock(inode);
 
 	return err;
@@ -1836,8 +1836,8 @@ static ssize_t fuse_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	if (fuse_is_bad(inode))
 		return -EIO;
 
-	if (FUSE_IS_DAX(inode))
-		return fuse_dax_read_iter(iocb, to);
+	if (FUSE_IS_VDAX(inode))
+		return fuse_vdax_read_iter(iocb, to);
 
 	/* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
 	if (ff->open_flags & FOPEN_DIRECT_IO)
@@ -1857,8 +1857,8 @@ static ssize_t fuse_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	if (fuse_is_bad(inode))
 		return -EIO;
 
-	if (FUSE_IS_DAX(inode))
-		return fuse_dax_write_iter(iocb, from);
+	if (FUSE_IS_VDAX(inode))
+		return fuse_vdax_write_iter(iocb, from);
 
 	/* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
 	if (ff->open_flags & FOPEN_DIRECT_IO)
@@ -2398,8 +2398,8 @@ static int fuse_file_mmap(struct file *file, struct vm_area_struct *vma)
 	int rc;
 
 	/* DAX mmap is superior to direct_io mmap */
-	if (FUSE_IS_DAX(inode))
-		return fuse_dax_mmap(file, vma);
+	if (FUSE_IS_VDAX(inode))
+		return fuse_vdax_mmap(file, vma);
 
 	/*
 	 * If inode is in passthrough io mode, because it has some file open
@@ -2848,7 +2848,7 @@ static long fuse_file_fallocate(struct file *file, int mode, loff_t offset,
 		.mode = mode
 	};
 	int err;
-	bool block_faults = FUSE_IS_DAX(inode) &&
+	bool block_faults = FUSE_IS_VDAX(inode) &&
 		(!(mode & FALLOC_FL_KEEP_SIZE) ||
 		 (mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_ZERO_RANGE)));
 
@@ -2862,7 +2862,7 @@ static long fuse_file_fallocate(struct file *file, int mode, loff_t offset,
 	inode_lock(inode);
 	if (block_faults) {
 		filemap_invalidate_lock(inode->i_mapping);
-		err = fuse_dax_break_layouts(inode, 0, -1);
+		err = fuse_vdax_break_layouts(inode, 0, -1);
 		if (err)
 			goto out;
 	}
@@ -3131,5 +3131,5 @@ void fuse_init_file_inode(struct inode *inode, unsigned int flags)
 	init_waitqueue_head(&fi->direct_io_waitq);
 
 	if (IS_ENABLED(CONFIG_FUSE_DAX))
-		fuse_dax_inode_init(inode, flags);
+		fuse_vdax_inode_init(inode, flags);
 }
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 97d356588d00..77ccd5b2059b 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -220,9 +220,9 @@ struct fuse_inode {
 
 #ifdef CONFIG_FUSE_DAX
 	/**
-	 * @dax: Dax specific inode data
+	 * @vdax: Virtiofs DAX specific inode data
 	 */
-	struct fuse_inode_dax *dax;
+	struct fuse_inode_vdax *vdax;
 #endif
 	/** @submount_lookup: Submount specific lookup tracking */
 	struct fuse_submount_lookup *submount_lookup;
@@ -364,16 +364,16 @@ struct fuse_io_priv {
 	.iocb = i,			\
 }
 
-enum fuse_dax_mode {
-	FUSE_DAX_INODE_DEFAULT,	/* default */
-	FUSE_DAX_ALWAYS,	/* "-o dax=always" */
-	FUSE_DAX_NEVER,		/* "-o dax=never" */
-	FUSE_DAX_INODE_USER,	/* "-o dax=inode" */
+enum fuse_vdax_mode {
+	FUSE_VDAX_INODE_DEFAULT,	/* default */
+	FUSE_VDAX_ALWAYS,		/* "-o dax=always" */
+	FUSE_VDAX_NEVER,		/* "-o dax=never" */
+	FUSE_VDAX_INODE_USER,		/* "-o dax=inode" */
 };
 
-static inline bool fuse_is_inode_dax_mode(enum fuse_dax_mode mode)
+static inline bool fuse_is_inode_vdax_mode(enum fuse_vdax_mode mode)
 {
-	return mode == FUSE_DAX_INODE_DEFAULT || mode == FUSE_DAX_INODE_USER;
+	return mode == FUSE_VDAX_INODE_DEFAULT || mode == FUSE_VDAX_INODE_USER;
 }
 
 struct fuse_fs_context {
@@ -392,13 +392,13 @@ struct fuse_fs_context {
 	bool no_force_umount:1;
 	bool legacy_opts_show:1;
 	bool syncfs_capable:1;
-	enum fuse_dax_mode dax_mode;
+	enum fuse_vdax_mode vdax_mode;
 	unsigned int max_read;
 	unsigned int blksize;
 	const char *subtype;
 
-	/* DAX device, may be NULL */
-	struct dax_device *dax_dev;
+	/* Virtiofs DAX device, may be NULL */
+	struct dax_device *vdax_dev;
 };
 
 struct fuse_sync_bucket {
@@ -693,8 +693,8 @@ struct fuse_conn {
 	 */
 	unsigned int create_supp_group:1;
 
-	/** @inode_dax: Does the filesystem support per inode DAX? */
-	unsigned int inode_dax:1;
+	/** @inode_vdax: Does the filesystem support per inode virtiofs DAX? */
+	unsigned int inode_vdax:1;
 
 	/** @no_tmpfile: Is tmpfile not implemented by fs? */
 	unsigned int no_tmpfile:1;
@@ -754,11 +754,11 @@ struct fuse_conn {
 	struct rw_semaphore killsb;
 
 #ifdef CONFIG_FUSE_DAX
-	/** @dax_mode: Dax mode */
-	enum fuse_dax_mode dax_mode;
+	/** @vdax_mode: Virtiofs DAX mode */
+	enum fuse_vdax_mode vdax_mode;
 
-	/** @dax: Dax specific conn data, non-NULL if DAX is enabled */
-	struct fuse_conn_dax *dax;
+	/** @dax: Dax specific conn data, non-NULL if virtiofs DAX is enabled */
+	struct fuse_conn_vdax *vdax;
 #endif
 
 	/** @mounts: List of filesystems using this connection */
@@ -1226,21 +1226,21 @@ void fuse_free_conn(struct fuse_conn *fc);
 
 /* dax.c */
 
-#define FUSE_IS_DAX(inode) (IS_ENABLED(CONFIG_FUSE_DAX) && IS_DAX(inode))
-
-ssize_t fuse_dax_read_iter(struct kiocb *iocb, struct iov_iter *to);
-ssize_t fuse_dax_write_iter(struct kiocb *iocb, struct iov_iter *from);
-int fuse_dax_mmap(struct file *file, struct vm_area_struct *vma);
-int fuse_dax_break_layouts(struct inode *inode, u64 dmap_start, u64 dmap_end);
-int fuse_dax_conn_alloc(struct fuse_conn *fc, enum fuse_dax_mode mode,
-			struct dax_device *dax_dev);
-void fuse_dax_conn_free(struct fuse_conn *fc);
-bool fuse_dax_inode_alloc(struct super_block *sb, struct fuse_inode *fi);
-void fuse_dax_inode_init(struct inode *inode, unsigned int flags);
-void fuse_dax_inode_cleanup(struct inode *inode);
-void fuse_dax_dontcache(struct inode *inode, unsigned int flags);
-bool fuse_dax_check_alignment(struct fuse_conn *fc, unsigned int map_alignment);
-void fuse_dax_cancel_work(struct fuse_conn *fc);
+#define FUSE_IS_VDAX(inode) (IS_ENABLED(CONFIG_FUSE_DAX) && IS_DAX(inode))
+
+ssize_t fuse_vdax_read_iter(struct kiocb *iocb, struct iov_iter *to);
+ssize_t fuse_vdax_write_iter(struct kiocb *iocb, struct iov_iter *from);
+int fuse_vdax_mmap(struct file *file, struct vm_area_struct *vma);
+int fuse_vdax_break_layouts(struct inode *inode, u64 dmap_start, u64 dmap_end);
+int fuse_vdax_conn_alloc(struct fuse_conn *fc, enum fuse_vdax_mode mode,
+			struct dax_device *vdax_dev);
+void fuse_vdax_conn_free(struct fuse_conn *fc);
+bool fuse_vdax_inode_alloc(struct super_block *sb, struct fuse_inode *fi);
+void fuse_vdax_inode_init(struct inode *inode, unsigned int flags);
+void fuse_vdax_inode_cleanup(struct inode *inode);
+void fuse_vdax_dontcache(struct inode *inode, unsigned int flags);
+bool fuse_vdax_check_alignment(struct fuse_conn *fc, unsigned int map_alignment);
+void fuse_vdax_cancel_work(struct fuse_conn *fc);
 
 /* ioctl.c */
 long fuse_file_ioctl(struct file *file, unsigned int cmd, unsigned long arg);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index c93d744b661e..e88daf88f913 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -100,7 +100,7 @@ static struct inode *fuse_alloc_inode(struct super_block *sb)
 	if (!fi->forget)
 		goto out_free;
 
-	if (IS_ENABLED(CONFIG_FUSE_DAX) && !fuse_dax_inode_alloc(sb, fi))
+	if (IS_ENABLED(CONFIG_FUSE_DAX) && !fuse_vdax_inode_alloc(sb, fi))
 		goto out_free_forget;
 
 	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
@@ -122,7 +122,7 @@ static void fuse_free_inode(struct inode *inode)
 	mutex_destroy(&fi->mutex);
 	kfree(fi->forget);
 #ifdef CONFIG_FUSE_DAX
-	kfree(fi->dax);
+	kfree(fi->vdax);
 #endif
 	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
 		fuse_backing_put(fuse_inode_backing(fi));
@@ -148,7 +148,7 @@ static void fuse_evict_inode(struct inode *inode)
 	/* Will write inode on close/munmap and in all other dirtiers */
 	WARN_ON(inode_state_read_once(inode) & I_DIRTY_INODE);
 
-	if (FUSE_IS_DAX(inode))
+	if (FUSE_IS_VDAX(inode))
 		dax_break_layout_final(inode);
 
 	truncate_inode_pages_final(&inode->i_data);
@@ -156,8 +156,8 @@ static void fuse_evict_inode(struct inode *inode)
 	if (inode->i_sb->s_flags & SB_ACTIVE) {
 		struct fuse_conn *fc = get_fuse_conn(inode);
 
-		if (FUSE_IS_DAX(inode))
-			fuse_dax_inode_cleanup(inode);
+		if (FUSE_IS_VDAX(inode))
+			fuse_vdax_inode_cleanup(inode);
 		if (fi->nlookup) {
 			fuse_chan_queue_forget(fc->chan, fi->forget, fi->nodeid,
 					       fi->nlookup);
@@ -386,7 +386,7 @@ static void fuse_change_attributes_i(struct inode *inode, struct fuse_attr *attr
 	}
 
 	if (IS_ENABLED(CONFIG_FUSE_DAX))
-		fuse_dax_dontcache(inode, attr->flags);
+		fuse_vdax_dontcache(inode, attr->flags);
 }
 
 void fuse_change_attributes(struct inode *inode, struct fuse_attr *attr,
@@ -954,11 +954,11 @@ static int fuse_show_options(struct seq_file *m, struct dentry *root)
 			seq_printf(m, ",blksize=%lu", sb->s_blocksize);
 	}
 #ifdef CONFIG_FUSE_DAX
-	if (fc->dax_mode == FUSE_DAX_ALWAYS)
+	if (fc->vdax_mode == FUSE_VDAX_ALWAYS)
 		seq_puts(m, ",dax=always");
-	else if (fc->dax_mode == FUSE_DAX_NEVER)
+	else if (fc->vdax_mode == FUSE_VDAX_NEVER)
 		seq_puts(m, ",dax=never");
-	else if (fc->dax_mode == FUSE_DAX_INODE_USER)
+	else if (fc->vdax_mode == FUSE_VDAX_INODE_USER)
 		seq_puts(m, ",dax=inode");
 #endif
 
@@ -1017,7 +1017,7 @@ void fuse_conn_put(struct fuse_conn *fc)
 		return;
 
 	if (IS_ENABLED(CONFIG_FUSE_DAX))
-		fuse_dax_conn_free(fc);
+		fuse_vdax_conn_free(fc);
 	cancel_work_sync(&fc->epoch_work);
 	fuse_chan_release(fc->chan);
 	put_pid_ns(fc->pid_ns);
@@ -1375,11 +1375,11 @@ static void process_init_reply(struct fuse_args *args, int error)
 			}
 			if (IS_ENABLED(CONFIG_FUSE_DAX)) {
 				if (flags & FUSE_MAP_ALIGNMENT &&
-				    !fuse_dax_check_alignment(fc, arg->map_alignment)) {
+				    !fuse_vdax_check_alignment(fc, arg->map_alignment)) {
 					ok = false;
 				}
 				if (flags & FUSE_HAS_INODE_DAX)
-					fc->inode_dax = 1;
+					fc->inode_vdax = 1;
 			}
 			if (flags & FUSE_HANDLE_KILLPRIV_V2) {
 				fc->handle_killpriv_v2 = 1;
@@ -1492,9 +1492,9 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 		FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_ALLOW_IDMAP |
 		FUSE_REQUEST_TIMEOUT;
 #ifdef CONFIG_FUSE_DAX
-	if (fm->fc->dax)
+	if (fm->fc->vdax)
 		flags |= FUSE_MAP_ALIGNMENT;
-	if (fuse_is_inode_dax_mode(fm->fc->dax_mode))
+	if (fuse_is_inode_vdax_mode(fm->fc->vdax_mode))
 		flags |= FUSE_HAS_INODE_DAX;
 #endif
 	if (fm->fc->auto_submounts)
@@ -1779,7 +1779,7 @@ int fuse_fill_super_common(struct super_block *sb, struct fuse_fs_context *ctx)
 	sb->s_subtype = ctx->subtype;
 	ctx->subtype = NULL;
 	if (IS_ENABLED(CONFIG_FUSE_DAX)) {
-		err = fuse_dax_conn_alloc(fc, ctx->dax_mode, ctx->dax_dev);
+		err = fuse_vdax_conn_alloc(fc, ctx->vdax_mode, ctx->vdax_dev);
 		if (err)
 			goto err;
 	}
@@ -1788,7 +1788,7 @@ int fuse_fill_super_common(struct super_block *sb, struct fuse_fs_context *ctx)
 	fm->sb = sb;
 	err = fuse_bdi_init(fc, sb);
 	if (err)
-		goto err_free_dax;
+		goto err_free_vdax;
 
 	/* Handle umasking inside the fuse code */
 	if (sb->s_flags & SB_POSIXACL)
@@ -1811,7 +1811,7 @@ int fuse_fill_super_common(struct super_block *sb, struct fuse_fs_context *ctx)
 	set_default_d_op(sb, &fuse_dentry_operations);
 	root_dentry = d_make_root(root);
 	if (!root_dentry)
-		goto err_free_dax;
+		goto err_free_vdax;
 
 	mutex_lock(&fuse_mutex);
 	err = -EINVAL;
@@ -1837,9 +1837,9 @@ int fuse_fill_super_common(struct super_block *sb, struct fuse_fs_context *ctx)
  err_unlock:
 	mutex_unlock(&fuse_mutex);
 	dput(root_dentry);
- err_free_dax:
+ err_free_vdax:
 	if (IS_ENABLED(CONFIG_FUSE_DAX))
-		fuse_dax_conn_free(fc);
+		fuse_vdax_conn_free(fc);
  err:
 	return err;
 }
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index 3728933188f3..79637c09e883 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -200,10 +200,10 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
 	int err;
 
 	/*
-	 * io modes are not relevant with DAX and with server that does not
+	 * io modes are not relevant with virtiofs DAX and with server that does not
 	 * implement open.
 	 */
-	if (FUSE_IS_DAX(inode) || !ff->args)
+	if (FUSE_IS_VDAX(inode) || !ff->args)
 		return 0;
 
 	/*
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index f15e516ebcb5..c82486d47a6c 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -102,9 +102,9 @@ static int virtio_fs_enqueue_req(struct virtio_fs_vq *fsvq,
 				 gfp_t gfp);
 
 static const struct constant_table dax_param_enums[] = {
-	{"always",	FUSE_DAX_ALWAYS },
-	{"never",	FUSE_DAX_NEVER },
-	{"inode",	FUSE_DAX_INODE_USER },
+	{"always",	FUSE_VDAX_ALWAYS },
+	{"never",	FUSE_VDAX_NEVER },
+	{"inode",	FUSE_VDAX_INODE_USER },
 	{}
 };
 
@@ -132,10 +132,10 @@ static int virtio_fs_parse_param(struct fs_context *fsc,
 
 	switch (opt) {
 	case OPT_DAX:
-		ctx->dax_mode = FUSE_DAX_ALWAYS;
+		ctx->vdax_mode = FUSE_VDAX_ALWAYS;
 		break;
 	case OPT_DAX_ENUM:
-		ctx->dax_mode = result.uint_32;
+		ctx->vdax_mode = result.uint_32;
 		break;
 	default:
 		return -EINVAL;
@@ -1592,14 +1592,14 @@ static int virtio_fs_fill_super(struct super_block *sb, struct fs_context *fsc)
 			goto err_free_fuse_devs;
 	}
 
-	if (ctx->dax_mode != FUSE_DAX_NEVER) {
-		if (ctx->dax_mode == FUSE_DAX_ALWAYS && !fs->dax_dev) {
+	if (ctx->vdax_mode != FUSE_VDAX_NEVER) {
+		if (ctx->vdax_mode == FUSE_VDAX_ALWAYS && !fs->dax_dev) {
 			err = -EINVAL;
 			pr_err("virtio-fs: dax can't be enabled as filesystem"
 			       " device does not support it.\n");
 			goto err_free_fuse_devs;
 		}
-		ctx->dax_dev = fs->dax_dev;
+		ctx->vdax_dev = fs->dax_dev;
 	}
 	err = fuse_fill_super_common(sb, ctx);
 	if (err < 0)
@@ -1634,7 +1634,7 @@ static void virtio_fs_conn_destroy(struct fuse_mount *fm)
 	 * will free all memory ranges belonging to all inodes.
 	 */
 	if (IS_ENABLED(CONFIG_FUSE_DAX))
-		fuse_dax_cancel_work(fc);
+		fuse_vdax_cancel_work(fc);
 
 	/* Stop forget queue. Soon destroy will be sent */
 	spin_lock(&fsvq->lock);
-- 
2.54.0

