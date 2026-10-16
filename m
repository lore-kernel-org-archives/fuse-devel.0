Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820404D9549
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163853; cv=none; b=QaH/Cr61CrRXZIofs0ljjhqU68DToGrVs3GUHpX4fDhX2QdDFWwUcyXP8syd7djM6GEgAtHSdbooZWdvQmcK5y569gX/Gt/skBweSqqpc8i1/F+y+Re51EaZft/I8lVPo5oxIIlFZMUcuDZ3QvovtKuKtp/YAjRKWsLXdHNeOuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163853; c=relaxed/simple;
	bh=YUkw+dai85UeClnTY/cNJI38d36WxPxX1F8i1DhNk+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=G620F8o0xnWDnjgOJp6ro45/UudGj214wz6Hre3aK1AjLoyF+XzmR0V3wsxMHIPfNQmpeP1G0fmVzkwrohisXQ0uQewG4Hf4EqJzYuolmNcvUdlEMY+Wt1Gx/6fPtQrUI6gphob3OKBuf+MwWEuhlT9QcZz9KCNGNA9HauQgI3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YgJIOWgu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YgJIOWgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792163847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+TROMxDl8UrJYxG0M+aHIDtSYaFMtjE8ArsPy1R4PO0=;
	b=YgJIOWguC/0Tg9Arzi/aW7+90nVakWbSAOL1iHHiDTIe9MvaXBgXm/Fli731jf/rM7/bGz
	TG3hhQfWmhiCLSqwRfv4IAziXy0DQxC/3yreI5pNCuDnxOKU0zkvzVkraO+/aer1ISRgbT
	6WwWGilcPl2U27QjXnlNxUZHtHD8V64=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-hgcxXC1QN7-2ZRcuDZ9yTw-1; Fri, 16 Oct 2026 15:17:24 +0000
X-MC-Unique: hgcxXC1QN7-2ZRcuDZ9yTw-1
X-Mimecast-MFC-AGG-ID: hgcxXC1QN7-2ZRcuDZ9yTw_1792163843
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a019d53f46so489785e9.3
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 08:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163843; x=1792768643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+TROMxDl8UrJYxG0M+aHIDtSYaFMtjE8ArsPy1R4PO0=;
        b=eDTdnQ1ZIBqtSj6XEPCK1PHn0vKXG23XO3YvpF9BfNur2jIWkqlK3/pXyyh91MEhrF
         tzjUIv6m8z7YsSoeLJShfSX2U3z9MQ0Ko4AWvwvyf8oN7UNpHMOiSERCdNGCyQ+gD7u8
         wlYSsro/adBx2RsW7afaJp/HAsk+Nha1ISgqjLrSQIggvc/U4QYC5VC7azn06nt5yhPz
         QeEs1ek3611lrd0TxbhkvlmdGHXibFMUeXYVoQps5b5lpNRfc03LVMABoR1PHIptd/XL
         HHkF4aBESEEmNtOllNlE1wfm0Kj1u0QcWVO85OgNqC6lUl68Z7QCp5Cf5/g4A7ze6gqR
         lqVQ==
X-Gm-Message-State: AFq9FYILCDjv7Zck+Fo5e5UC9Imql/VmglJkbLRklkBOZlhRxnBLCevx
	g4RF0wmQMhmZc3kHxf06g9+rXU7IpzKuQ6Ccek8cD5Jqu4ujBO9F1lEzCAKoX7iDlWldIxXAXfa
	nDDOyCQcoVx0wYKIwTiPBF6lN/Hf54WdcNFP4pRUjAC3PoE+cTgNzcQZQU+YEsa1UzJOO7SElFm
	rC09WI+PaUdxvE1BjeBSA/jd4rN30CEfPj5qnrbr3DfQtFhA0=
X-Gm-Gg: AYBFou04n0b2Q2ON8U9x/vQgoBiqkLhFKDMF56WVucfk+oQBvcRaHNcbKbiTlZUpLns
	0xqGbKc0DFym7NHx5fVSWSFLJT+9+cUSCmlwSVUQ5XIdSPlGwPCiMZk7muuz0EJQ0vdHDV0akZH
	vQMRnO3NhYh946Vp+VKYur1qgVT+vRuqcPjA06E4nyjEM2gqYe+QpGJz4yzqpnv0071MCTyVle1
	a+iBw0Lr7moO3cOKIm4LnwFMuevS0RqKkWDLIpBvqOyxkMtnGLwsz3k1txT0wKT01YjsA/3cgva
	1DjuRDlG/TLrHpDpLQ3wYrRi2UcpHF17hTFUTyQVINX/iLPZ8Hv0u6XbHGiNrG4R9kQM/0iMtlm
	Ky6fBoXU4Og7BIpLPLtChrw==
X-Received: by 2002:a05:600c:1393:b0:4a1:d248:25b5 with SMTP id 5b1f17b1804b1-4a1d760e327mr2401255e9.24.1792163842882;
        Fri, 16 Oct 2026 08:17:22 -0700 (PDT)
X-Received: by 2002:a05:600c:1393:b0:4a1:d248:25b5 with SMTP id 5b1f17b1804b1-4a1d760e327mr2399225e9.24.1792163841216;
        Fri, 16 Oct 2026 08:17:21 -0700 (PDT)
Received: from maszat.com (85-67-2-18.pool.digikabel.hu. [85.67.2.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de7230sm64621665e9.14.2026.10.16.08.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:17:20 -0700 (PDT)
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
Subject: [PATCH v5 01/10] dax: add fsdev_dax_from_file()
Date: Fri, 16 Oct 2026 17:16:28 +0200
Message-ID: <20261016151638.2962413-2-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016151638.2962413-1-mszeredi@redhat.com>
References: <20261016151638.2962413-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -Xsjwf2gGmWF3CX6UHSxcx3AAPBDAX6nSyqitrhjwGI_1792163843
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
 drivers/dax/fsdev.c | 23 +++++++++++++++++++++++
 drivers/dax/super.c |  3 +--
 include/linux/dax.h |  3 ++-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/dax/fsdev.c b/drivers/dax/fsdev.c
index 598604bf5ac5..910665c1f492 100644
--- a/drivers/dax/fsdev.c
+++ b/drivers/dax/fsdev.c
@@ -234,6 +234,29 @@ static const struct file_operations fsdev_fops = {
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

