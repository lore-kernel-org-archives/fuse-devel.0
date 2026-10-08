Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B919A3793DC
	for <fuse-devel@lists.linux.dev>; Thu,  8 Oct 2026 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458416; cv=none; b=dWl3zyJAsq4yP6MuczIN4ffL9Qa9ugnBVFd/IlaJrO52E4ANPkD5wX6Kr6Wz5K2EI2WDwFCrlVhlcjTY3hHHFSMClkFsiXHnfcPBK6j6oYGQz6OUJQs3N9LfUVEj+c+KwuiqDul+/q7lmnhBnHOvyYHSh2eqvU/UPVzOVfTjW1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458416; c=relaxed/simple;
	bh=19IqXmwYNsjUduLj1avoZqwv6d+lKaGH67IsveE7tU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=G1wkKTQ9757I4c7BFtoUuJrz5YtDuRZLddmFm3wkztnTbatWdtF4ZbmiaQSvDlcmfmuwXzavsWBPdQcFH3K74VfrHpM/p3I3gc0+h9Y9vTJ8fN8DFfd0JVED6d/2UKCFqw8lu+AHdDlhJy+3QvXK9McMt4CFCwBcX/0wCkxwHRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b/C1f6Cq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b/C1f6Cq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791458413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+dzW9NAcK/PemMwwdCNYcD+RAltqa6Xku44UsRnnuA=;
	b=b/C1f6Cqgzgv0anOEjTIQs0qHKIVqmYOjMuKuGelRbkbNyMGLVdhaXJUf3tNW3A0WG8hxr
	CqiTJlUnPjf2xANO/Ft2i+g3E5xcIjn+AzybfSLw5m+mSWkQho4AVnPnoQIwwhGzOx0KIl
	uW9Onv3YYDT/kWiQtw5bJ4WikannJhI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-N6zhhMGgNZK9uSB7-5Wqxg-1; Thu, 08 Oct 2026 07:20:12 -0400
X-MC-Unique: N6zhhMGgNZK9uSB7-5Wqxg-1
X-Mimecast-MFC-AGG-ID: N6zhhMGgNZK9uSB7-5Wqxg_1791458411
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c3167afb84fso338807166b.3
        for <fuse-devel@lists.linux.dev>; Thu, 08 Oct 2026 04:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458411; x=1792063211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+dzW9NAcK/PemMwwdCNYcD+RAltqa6Xku44UsRnnuA=;
        b=Dgygywe+kW1G3e/O9Jl4w/zJGCNN3/lRSyK7nkHSI8PBFGQnzkeqT8CpFYCaKbESFv
         6IopBgIIX9jnV3LFt5RIpxb+W4Mxc5ikRIaMDwFKclFHEG4iS7lp5q61BErmP+KOpjH4
         oF+Id4F+CZ2wr/r7VC1MBfo8swoq6YMxaiOL2NiKyFOgaUCm80RDrecCfi94uLBVI7bV
         Pg6UZQT1FtDZWRPy4hz7QJNzNLXFn/JWpwy7gKNYmgvIjs3QqYSh7OgDkRkxV2HSRfc5
         O9cYEnZYLGxiD4ahiAM+oYVjEzRTVBZkGBzXrybSAcA9JYgnSeevG94ECxXUNxpSdXV3
         U83Q==
X-Gm-Message-State: AFuF++kJeb9vsDw09BOL/9gWya4vveVzCMc6bTChLaHS5V7KKzOakYC2
	/sf1PCg52sbGAnk+lHpxFm1jARAjRELwFPxiJXzjf56rfc/j3obHEWMt4P68MgEd8l7r7IXYHAD
	St0ziATRNVLJANXzCIZnfhjV0l5Dsg7ZmCJ5FZAYUxxDMFfeZjMl44/tHvmdrD1B8BqSDDD0a7X
	qMBYVd+mgLvr7ISFG/775uZnMdD1jzJAQ5hdximXS0nTwBMqQ=
X-Gm-Gg: AYBFou3qOr28PXwtbGi3tB82PfayH2CXKFAfwT0uNXCmMWhtWxw6RKYdg/eQ8CPz5O9
	tzlT9eLXFG5BVU78YQXYZU3XQvq+3hMQtXHVlyv9W+09BQjINseiAmUfmJIvsWYX9tjnE+BgZYz
	jntGRLtwTvZZFUlehAPkEx8oOm34mJ9HJIFfyTTT7rtnhVv72wXI3xEooM13lZka4jPBFUy6p3P
	N39zxh0IQFucVpnU1FWzel3FmXzLokYOLCLnJyW71u57rgalV/uOZmkx30SIHpfaboC7AK+eWOy
	tQDo8eFvBkkxTCblXtbCbxwwF74vMnWvYA13vsd/n1SxlQXQkiPrMMm5iDYNjy5jgjA/qZG2Frb
	MInWtKmDRtL4QzgxYnWhQaYezfolTeKJCMprYavFArlT6+g7XLSp1Xzx2
X-Received: by 2002:a17:907:9483:b0:c26:1648:a060 with SMTP id a640c23a62f3a-c317be37b20mr508928066b.27.1791458411500;
        Thu, 08 Oct 2026 04:20:11 -0700 (PDT)
X-Received: by 2002:a17:907:9483:b0:c26:1648:a060 with SMTP id a640c23a62f3a-c317be37b20mr508920966b.27.1791458410178;
        Thu, 08 Oct 2026 04:20:10 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (188-142-152-55.pool.digikabel.hu. [188.142.152.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c2fae53sm204251866b.49.2026.10.08.04.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:20:09 -0700 (PDT)
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
Subject: [PATCH v4 1/9] dax: add fsdev_dax_from_file()
Date: Thu,  8 Oct 2026 13:19:52 +0200
Message-ID: <20261008112004.1899560-2-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008112004.1899560-1-mszeredi@redhat.com>
References: <20261008112004.1899560-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h5pxZWbv3OpGG6HGasCOncRX_cxiCKnMazqmt-hlObo_1791458411
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: John Groves <John@Groves.net>

If the file is a fsdev_dax open, take the dax_dev from the device inode's
i_cdev.  Return with a reference grabbed on the private dax inode.

Make dax_dev_get() static again (internal to super.c for alloc_dax), export
fsdev_dax_from_file() instead.

This fix is in response to a Sashiko review, and some subsequent analysis.

About the 'fixes' tag: this removes the export of dax_dev_get(), which was
flawed, and replaces it with fsdev_dax_from_file(). It feels like the fixes
tag makes sense for correcting an ABI error.

Fixes: 2ae624d5a555d ("dax: export dax_dev_get()")
Originally-by: John Groves <john@groves.net>
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 drivers/dax/fsdev.c | 24 ++++++++++++++++++++++++
 drivers/dax/super.c |  3 +--
 include/linux/dax.h |  3 ++-
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/dax/fsdev.c b/drivers/dax/fsdev.c
index 598604bf5ac5..04b04d0d3da5 100644
--- a/drivers/dax/fsdev.c
+++ b/drivers/dax/fsdev.c
@@ -234,6 +234,30 @@ static const struct file_operations fsdev_fops = {
 	.release = fsdev_release,
 };
 
+/**
+ * fsdev_dax_from_file - get dax_device from an open file
+ * @file: open device file
+ *
+ * Returns a dax_device pointer if @file refers to a fsdev_dax device.
+ * Otherwise return NULL.
+ *
+ * Caller must put_dax() the returned device when done.
+ */
+struct dax_device *fsdev_dax_from_file(struct file *file)
+{
+	struct dax_device *dax_dev;
+
+	if (file->f_op != &fsdev_fops)
+		return NULL;
+
+	dax_dev = inode_dax(file_inode(file));
+	WARN_ON(!dax_alive(dax_dev));
+	ihold(dax_inode(dax_dev));
+
+	return dax_dev;
+}
+EXPORT_SYMBOL_GPL(fsdev_dax_from_file);
+
 /*
  * Acquire the dev_pagemap for probe: the static (pre-populated) one if
  * present, or a devm-allocated one for the dynamic case. Note that
diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index 45f84b0eb909..25836f389bde 100644
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
@@ -588,7 +588,6 @@ struct dax_device *dax_dev_get(dev_t devt)
 
 	return dax_dev;
 }
-EXPORT_SYMBOL_GPL(dax_dev_get);
 
 struct dax_device *alloc_dax(void *private, const struct dax_operations *ops)
 {
diff --git a/include/linux/dax.h b/include/linux/dax.h
index fe6c3ded1b50..2c9fc81f031b 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -54,7 +54,6 @@ struct dax_device *alloc_dax(void *private, const struct dax_operations *ops);
 void *dax_holder(struct dax_device *dax_dev);
 void put_dax(struct dax_device *dax_dev);
 void kill_dax(struct dax_device *dax_dev);
-struct dax_device *dax_dev_get(dev_t devt);
 void dax_write_cache(struct dax_device *dax_dev, bool wc);
 bool dax_write_cache_enabled(struct dax_device *dax_dev);
 bool dax_synchronous(struct dax_device *dax_dev);
@@ -323,3 +322,5 @@ typedef int (*walk_hmem_fn)(struct device *dev, int target_nid,
 			    const struct resource *res);
 int walk_hmem_resources(struct device *dev, walk_hmem_fn fn);
 #endif
+
+struct dax_device *fsdev_dax_from_file(struct file *file);
-- 
2.54.0

