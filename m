Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E942A367288
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 06:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057431; cv=none; b=Gx0q5aXTj1YZBeycxVa2ZssGjlcX1T2oEF0wid/WFX/ai9hzgNxz2w0pdQo94B7eUrN4pdijVBmqoFVck+lZ0MexpDu+NK0e4saHX/4MN6QjtEE2+gejA6jdhXr5lukGSJGmDNWDckofc4K8zUuZsNnkpoSW2Z+fLOYti3O0Khk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057431; c=relaxed/simple;
	bh=m2V3ykmc0+SNe+npHQWwMFOLO2jwXZQuxYFVlVUCHvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=VMJSKQd8YjdpfsvI/rozn8urY2c6xr5Ao94P5NXn7HZEikyi08nJ8QvqtzZGUJr0aNKZrwQJbuv7kvh9f1VHRfDxlYpFOG0gj8AdiYm+oWn433ZYj1WNY2rX6f+yC3VsB5EzBmo5pkCeXBvxazlCFvHJVxzw/VQZyptBe6XRBXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d6A6IrjI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d6A6IrjI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790057429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jS+WnQ/xcVifDMSN02JslsIZ2c9mvQAk2S+FvRtZ3aI=;
	b=d6A6IrjIvcwUvH022AW6H6gb2YHBzquLGzSJ7dt2vDZe5mz1jtxaQAAYrgIpQvnBkWAYfw
	Z/J7tat3veHgFchM6IV/Caph0f2xIscmNQOAvVPihAYcvJAUDECNjtBwVv2lr7fa/Cb1gZ
	vgB26sbENvc/HZX/KwN9MK0R/r5yV2Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-uVY_hEhoP_OzAKWCUOCxUA-1; Tue, 22 Sep 2026 02:10:27 -0400
X-MC-Unique: uVY_hEhoP_OzAKWCUOCxUA-1
X-Mimecast-MFC-AGG-ID: uVY_hEhoP_OzAKWCUOCxUA_1790057426
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a9a8263e05so4991997a12.0
        for <fuse-devel@lists.linux.dev>; Mon, 21 Sep 2026 23:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057426; x=1790662226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jS+WnQ/xcVifDMSN02JslsIZ2c9mvQAk2S+FvRtZ3aI=;
        b=lFaQrN6a/3ckeim3inQ5/B1pnsQUOFaYTz0JA/r52BISdlIxcnCAPD6idAzjxP/Ndq
         WtqTVjoPCj7juhUx5fx9NAFqEQDQhlbiUKFj285rvlNXZzwtK3LsP7PyTXM5Znx8grCE
         9kquvyoM1n45JuCOrKWtmXksADy9d+7t0xHrAHrCOvkYhcCtqr5xUgqlSf0d3FNIpX5Y
         jbFxLxjv4lOCsbWwmqfOOWR411cKIz86q/SRZPndH/CCmUcaB38A+crUKLvFQ9U3sKh0
         xVSJP0rnSiyKaG+w3k8RRGn+so+W7k6rjYYARAzRIcfC9Tly2opyCUvE7UjBO4dLZYQN
         MGXA==
X-Gm-Message-State: AFuF++lZnXP0qsADz+gJWIazi7iI6HvXuZZ4rjkwJS/dYzMnXwBCMem0
	gx1/fTVxxV44QYOOmClSj0dcGNPGV53bnG3XWw4Tte5VwbYjtXlitbGPgMDLWhlstEZel55Tvax
	AZ+uGk9tZQBvKl69UH9sJ997YJcKHVgKwjCLDo/9LRnkcrBijr6zkvGjfcWiv6FKlHPmKFXbCnH
	eGbTGOWMHx+s9y2SWSnuA11q2Hba8ZbQHGzq+5m5Dl9narsCk=
X-Gm-Gg: AYBFou05B0OFSu+p8Ff1MfFp6lAkOpPToCfZicKm9z6cApJ5TXC8leu/lgN2a8hekuu
	xNh8QkULBE01jwHWYXHwl3f/9oAhNcKa3i/XH1Ved8M0I8hkg2BojgfAteeviVzZd7XpC524jqt
	jYLym2qaq0SUZS1rZPa93sHvEzli5F0c0JKLd3OA33ni2Ig5vjgzH31aCVwkc1bHpjE4fp2rzS6
	7dSpHF5IA7FXg0IjRw7amJmMDUGMwmPLY0syZRbOoiCYdnzFeqgchM1ybDfSnZWSsRtfmIiKxJ2
	6pNyfSYbBfnz1UypXAkJpPOIJqMpanZhLQAUJIuSp4CEj/bbz6O5br+1vg5wxHOopfLDCOMsoKi
	w85mXqQZdMty03CYbl9A+yXrGeZPiMepfnLZrZkvsP33ogXjMQ6GM
X-Received: by 2002:a05:6402:23d6:b0:6aa:4a7:5e10 with SMTP id 4fb4d7f45d1cf-6aa576eb85dmr8910633a12.7.1790057426430;
        Mon, 21 Sep 2026 23:10:26 -0700 (PDT)
X-Received: by 2002:a05:6402:23d6:b0:6aa:4a7:5e10 with SMTP id 4fb4d7f45d1cf-6aa576eb85dmr8910608a12.7.1790057425954;
        Mon, 21 Sep 2026 23:10:25 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-111.pool.digikabel.hu. [85.66.37.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440df9asm449826a12.4.2026.09.21.23.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:10:23 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <John@Groves.net>,
	John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH 01/11] dax: replace exported dax_dev_get() with non-allocating dax_dev_find()
Date: Tue, 22 Sep 2026 08:10:01 +0200
Message-ID: <20260922061019.3320196-2-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: ooZgWTZWcojaMmcNKJ-F89k46yWgvOaRkgA-rPKU8nA_1790057426
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: John Groves <John@Groves.net>

This fix is in response to a Sashiko review, and some subsequent
analysis.

dax_dev_get() uses iget5_locked() which creates a new inode if no
matching one exists. This is correct for the internal caller
(alloc_dax), but dangerous for external callers that look up devices
from user-supplied or metadata-supplied dev_t values:

1. A new inode is created with DAXDEV_ALIVE set but no backing driver,
   no ops, and no IDA-allocated minor number.

2. On teardown, dax_destroy_inode() warns because kill_dax() was never
   called, and dax_free_inode() calls ida_free() for a minor that was
   never ida_alloc'd -- potentially freeing the minor of a real device.

Add dax_dev_find() which uses ilookup5() for lookup-only semantics:
it returns an existing dax_device with an elevated inode reference, or
NULL if no device with the given dev_t exists. It never creates inodes.
A dax_alive() check under dax_read_lock() guards against returning a
device that is concurrently being torn down by kill_dax().

Make dax_dev_get() static again (internal to super.c for alloc_dax),
export dax_dev_find() instead, and update the two external callers
(famfs_inode.c, famfs.c). Also add the missing CONFIG_DAX=n stub.

About the 'fixes' tag: this removes the export of dax_dev_get(),
which was flawed, and replaces is with dax_dev_find(). It feels like
the fixes tag makes sense for correcting an ABI error.

Fixes: 2ae624d5a555d ("dax: export dax_dev_get()")
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Alison Schofield <alison.schofield@intel.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
Signed-off-by: John Groves <john@groves.net>
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 drivers/dax/super.c | 38 ++++++++++++++++++++++++++++++++++++--
 include/linux/dax.h |  6 +++++-
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index 45f84b0eb909..824e1f6df378 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -565,7 +565,7 @@ static int dax_set(struct inode *inode, void *data)
 	return 0;
 }
 
-struct dax_device *dax_dev_get(dev_t devt)
+static struct dax_device *dax_dev_get(dev_t devt)
 {
 	struct dax_device *dax_dev;
 	struct inode *inode;
@@ -588,7 +588,41 @@ struct dax_device *dax_dev_get(dev_t devt)
 
 	return dax_dev;
 }
-EXPORT_SYMBOL_GPL(dax_dev_get);
+
+/**
+ * dax_dev_find - look up an existing dax_device by dev_t
+ * @devt: the device number to find
+ *
+ * Returns a dax_device with an elevated inode reference, or NULL if no
+ * device with the given dev_t exists. Unlike dax_dev_get(), this never
+ * allocates a new inode -- it is safe for external callers that are looking
+ * up devices from user-supplied or metadata-supplied dev_t values.
+ *
+ * Caller must put_dax() the returned device when done.
+ */
+struct dax_device *dax_dev_find(dev_t devt)
+{
+	struct dax_device *dax_dev;
+	struct inode *inode;
+	int id;
+
+	inode = ilookup5(dax_superblock, hash_32(devt + DAXFS_MAGIC, 31),
+			 dax_test, &devt);
+	if (!inode)
+		return NULL;
+
+	dax_dev = to_dax_dev(inode);
+	id = dax_read_lock();
+	if (!dax_alive(dax_dev)) {
+		dax_read_unlock(id);
+		iput(inode);
+		return NULL;
+	}
+	dax_read_unlock(id);
+
+	return dax_dev;
+}
+EXPORT_SYMBOL_GPL(dax_dev_find);
 
 struct dax_device *alloc_dax(void *private, const struct dax_operations *ops)
 {
diff --git a/include/linux/dax.h b/include/linux/dax.h
index fe6c3ded1b50..29113eb95e72 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -54,7 +54,7 @@ struct dax_device *alloc_dax(void *private, const struct dax_operations *ops);
 void *dax_holder(struct dax_device *dax_dev);
 void put_dax(struct dax_device *dax_dev);
 void kill_dax(struct dax_device *dax_dev);
-struct dax_device *dax_dev_get(dev_t devt);
+struct dax_device *dax_dev_find(dev_t devt);
 void dax_write_cache(struct dax_device *dax_dev, bool wc);
 bool dax_write_cache_enabled(struct dax_device *dax_dev);
 bool dax_synchronous(struct dax_device *dax_dev);
@@ -92,6 +92,10 @@ static inline void put_dax(struct dax_device *dax_dev)
 static inline void kill_dax(struct dax_device *dax_dev)
 {
 }
+static inline struct dax_device *dax_dev_find(dev_t devt)
+{
+	return NULL;
+}
 static inline void dax_write_cache(struct dax_device *dax_dev, bool wc)
 {
 }
-- 
2.54.0

