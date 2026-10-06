Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A26B391E78
	for <fuse-devel@lists.linux.dev>; Tue,  6 Oct 2026 18:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791309688; cv=none; b=XfhbF40AClDKnSOZex9o7Tswf+c+DowOYwW2GWECex5ml3ztVwdvLzSsNCKQbGsHQvY82S15UKBFJjBtBVtB6YKjqBzjETDAT47Ms6FQZ8dYicOUsEyQ+L9zEbBVChTfXefzcYSA+2wFF4RKtEfpnLuWP2ur1rXs8dZjiRDC8bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791309688; c=relaxed/simple;
	bh=QqGsxUZuEtLO/SWJKab8EXCQqECv/GPyBy+79b3jBMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=joHFnQ/wHjxkuKKpGlLPKpbGGCWEqZiV4bOVaNlwNJ2ou5Pxcb04vZ+mVCuB/wJRvMUjxFUWepQV1w1EJDW+aCQJnAOY1LqsNpiPH6+La4FzH8e5b3whBSKmx+Bx75HrwruogOc59IYgDTuhLl1lbdtkTXgr/VOMHQ9jcExFzzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YTD/q1Y0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YTD/q1Y0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791309686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wUOje82dfH+H4WczVQo1AOkLQDRbkjxsMyPdE9CHREA=;
	b=YTD/q1Y0zH0oSAo3x39VePB9R3vGFhRQQrBQMUCFpbGwojcLnhP7XhVcLy4jSAZS3jd+dr
	+wP2wDXJFjPQs/SEfua5Pud8ndnnvOtzVeUVX0QG6aujr+2esau8gkEqp5tArsLBvaKV92
	bPLvJViflA0V80V1FrXBT5m2SkjBKAw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-IRHuVBNcPvqoyrrGIlaBgA-1; Tue, 06 Oct 2026 14:01:24 -0400
X-MC-Unique: IRHuVBNcPvqoyrrGIlaBgA-1
X-Mimecast-MFC-AGG-ID: IRHuVBNcPvqoyrrGIlaBgA_1791309683
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2e7daa588bso103135566b.0
        for <fuse-devel@lists.linux.dev>; Tue, 06 Oct 2026 11:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791309683; x=1791914483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wUOje82dfH+H4WczVQo1AOkLQDRbkjxsMyPdE9CHREA=;
        b=fK3kC7SDToCu9wS2n/A9a33yOHPeIIWzgNuhKJiy926MDu5niaKVXEVuXr95srd8Zf
         xcw7Rg6FNl29ehxp40eDZN4xcjMxGXiS18nkuGX8cgl1hpe1B7BTAB5BZ1BnIwib7xcD
         zdz+t1KUNn6eMoBwChhH8ga/8J9VrFlB1Wd4AyIw3lKkHGeV7r4TIqXfZyWuiKd//83p
         a+DP23ClNoVpjyHZTykKzFh/xM6reL+xSfQdnIsNdkxDGHXVq9QnMYGl0iXryR/IMlV9
         DwH43ApUBZWm0cBUQEmCuLhGYsTcnGpBRybwHTS1pN2g1SYZbmrn/pWcad1XUswvySDH
         RgNA==
X-Gm-Message-State: AFuF++nV2wqW/gfXJRQVQ1m0tDJmMNeGDLEz75BXWPKjMGqMhz5obvGN
	h/5yXOJBxlIyBAQ1ZHzK9sWJpxUaNPNwSoc7qRsluTCGJwLcLOjwQcoSIEsfHU3yl1066shS4AR
	1ZRy6kSEKFRf41l5tmQZXGjkqUBMqulwv/zfHqC1lOLke7zzreAmNg9EFfiPL8g3otRTkuei4Rc
	Sil/aEy8WIyLEngjc0njClv7jWMUMX8BU5kKUKK92AtR38DAU=
X-Gm-Gg: AYBFou2SVpRvg6+/cSXz41y1Y/u85BVGcATZ2TbcpkkRy/DB9MwbUFSHZuBEQcPmmfx
	p1SY7kr1mCBafuXc2Un+v8zjkrwhMppKM+0N7nDBU92bAOcI7fsrGEOp5G5gNA6JpCX8TDvLnSi
	j6AXO1vXtrjDFU3aivJK/LAnJz8Ro3Z73eOD6lMigNsYB5A8jHbS8Pxn7QWgkq5aunvNoD7mcNE
	sHUG1Oyt0OwNmC3aJ9wCh10mNRM8emea3B8NMGdBhWr8Xxy7X6bYjz7KOl4U0aWnTRoLxaZO3OY
	JnlZexywkEyinuT6gNncfkJ4fScmd9yp7cnQKpmPyFjLB7IneojRKCfe+h8E64dSs5kQxOELXtL
	VCcVUUEM/Uk7cuq5CoeVaybwtinU/mMAbnKFDvTQv0RwUtAB0IgMCb3bp
X-Received: by 2002:a17:907:9691:b0:c2d:fc0b:551a with SMTP id a640c23a62f3a-c316989b2d1mr226171566b.0.1791309682680;
        Tue, 06 Oct 2026 11:01:22 -0700 (PDT)
X-Received: by 2002:a17:907:9691:b0:c2d:fc0b:551a with SMTP id a640c23a62f3a-c316989b2d1mr226167566b.0.1791309682192;
        Tue, 06 Oct 2026 11:01:22 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (188-142-152-55.pool.digikabel.hu. [188.142.152.55])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e5942sm5056684a12.9.2026.10.06.11.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:01:21 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <John@Groves.net>,
	John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org
Subject: [PATCH v3 1/9] dax: replace exported dax_dev_get() with non-allocating dax_dev_find()
Date: Tue,  6 Oct 2026 20:01:06 +0200
Message-ID: <20261006180115.1425232-2-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261006180115.1425232-1-mszeredi@redhat.com>
References: <20261006180115.1425232-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RU3AHRAYtuwRVHP0svVXSz2rKbwUr5jWzjUlq6G30XQ_1791309683
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
export dax_dev_find() instead.  Also add the missing CONFIG_DAX=n stub.

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

