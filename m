Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F703876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723540; cv=none; b=Bw0HPFszl4q164M6pJS17VZv4j7Gpm5N+QX9CkjG3kJll1nrItcVA3XqcSzeJ/DvWy8xiKOk+yl6oL/kEMmbAscz5t6wM9RdXnOli/SYd/gf8cVv4VgvPDJcDxdvx2fEQtnwkyGtRA36dYxPnCp2Pu3uKYsVRkJXYo7LfpeE0pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723540; c=relaxed/simple;
	bh=PKwrVkC7yjvhdmxWPm4ybCVu+RAXRMQjYOEiU7gOli4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCE1TMQUWUw84+x1MximLobQMFTvMiuKGQBFV68mdey5A++Z1MN2nUxSz2ilfbHWcSaxRJzvqMsZeFDZToNdbbWeLFiFypHGPaboZk/Y4yhiDHCrG7ev0Waq9zkidj61bDTIJ6WrypiYz37YbXp00/PyjSe6CAuTeA1QJmzuYT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9aqjHLd; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9aqjHLd"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so1677150a91.0
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723538; x=1777328338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFkxKxH4dRjploA2WE4R97glOH1c4G85iCji5YtM+sg=;
        b=Z9aqjHLdUj+0hE5KWhLqloNRE39d/usuRb4YBuyaIjNda9T+QOAZpOJ9TvJMnuke5U
         k35eyqb88/FhaV9+ypT0PpsUVivH1y9dUS4zN/otupBTMWlXzsk5dZSKybeCNTgr3A1M
         nbditBrYJyn1E16qzYsAEhMiLviRhOAQzzGweyyEX13DswW97tkTTkktKfKGdh++G+lN
         3TdWbMC/Lqa1auyAHlDz0huOhnr9NifqFYDfAnmPAaGLfROTjKOiy6ioOPocaaZi6uLy
         VqNHfLYsPYh11CDrS5NAAVnLHheiTHLDvIT5Vp7nCFDt/gATs46O2vE6jyVUJArPp9dJ
         1ztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723538; x=1777328338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFkxKxH4dRjploA2WE4R97glOH1c4G85iCji5YtM+sg=;
        b=fflIItGNGDCKB4yfa+8Rm5+DvO689U68qN1Y9FMuB4reUGFeTza6HIoQ3uqT6CMfgr
         cBo4qSuIqTqFUMMBaKESbbInUHIMxidcm5PkmaWjqVwsu7xlr9VI5/1/h9b880qbY091
         x87BqQxvKh/PasDcSet6hN17/G4Fqih0J+6eGSclpp/JGJlFPDEefRrpIGcHST/FlYVk
         w3Euxnkm8w1cDTQGb7aemhGXW3B1z+4AzI3o7ty9dysHpqO2LXjifNguzdzdxiK8pvWa
         4WdOBPQhM4juvGL1G9qle1dykXNpk6e+s9Yir8AhgF8WUwW8NKOjh3oxNULt3dccGzS3
         +JSA==
X-Forwarded-Encrypted: i=1; AFNElJ+/pXgjUOQ7wjpdZXNTBkAHuFVI9w9UsX1HdhUpW3wvoRlbtnhFiqEmKtH9wE7qEszM2mcwP9Z1QGK/@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv5HME4QEWgYZeAtCKBViwHHXDeruuJTbgd0Yarf3Q6U5LJqpV
	tft5IvAoJNWIQ8GMpkFEo+zy3wUV9XtacPxYE/BDLKohxjSbp4QYmfzd
X-Gm-Gg: AeBDieuRGahIbThjlMIKeNQHilz/ERs8bfA7KB1fHzshxouh5IOOD/q2Reslq5pR/hA
	JpZE7sZ/qLVqdKYh1S0urFpUCngJcwYfEibv6UiFOmclgT198ZAbmoBaw9tpIWxP8sC5ERiPLwQ
	VNjcrJYzfVpUfcV6OgGWoDxFZKeXraU/RVdSXcqAUuLV0V4q05kl1MsOLdLzFke0fC2CXbrZerc
	Cj/LeN9rcpOO12NTUpuhhRrwB4kBSnchZcqbyPBbC1EAteE45aCV/1e5rD02Pg7bi78+VWCTncw
	hBCdu3uQBu4ZDgkIvODhZDYD1Mq/baL2QNGSDgwSJKLDTnJnCvWBnpMkpCEryYKpiopxRBU2xaE
	8bBa9t1iW5jIh8H9ePTu3mAiNV/UMUPEHvHeI5Pwc5il05kLBZGk0AnGY410S3BOTvtoegH2xr6
	vYn1iOtG5JdSIrjPydv8tqkdcJkilUS5lBRZHIgAc=
X-Received: by 2002:a17:90b:2247:b0:35d:8ea1:62df with SMTP id 98e67ed59e1d1-36140493367mr16321077a91.21.1776723538450;
        Mon, 20 Apr 2026 15:18:58 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5b::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613f5766c4sm5941554a91.0.2026.04.20.15.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:57 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 15/17] fuse: add passthrough setattr
Date: Mon, 20 Apr 2026 15:16:35 -0700
Message-ID: <20260420221637.2631478-16-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260420221637.2631478-1-joannelkoong@gmail.com>
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add passthrough setattr for setting the attributes directly on a
backing inode via notify_change() instead of issuing a FUSE_SETATTR
request to the server.

After updating the backing inode, sync the fuse inode's vfs-visible
attributes with a passthrough getattr (which is guaranteed to be
supported, as getattr must be passed through in order to use inode
passthrough) so that it matches the attributes of the backing file.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c             |  3 +++
 fs/fuse/fuse_i.h          |  3 ++-
 fs/fuse/passthrough.c     | 31 +++++++++++++++++++++++++++++++
 include/uapi/linux/fuse.h |  1 +
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index ff9a92d8a496..6dea0f8e384f 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -2546,6 +2546,9 @@ static int fuse_setattr(struct mnt_idmap *idmap, struct dentry *entry,
 	if (!attr->ia_valid)
 		return 0;
 
+	if (fuse_inode_passthrough_op(inode, FUSE_SETATTR))
+		return fuse_passthrough_setattr(inode, attr);
+
 	ret = fuse_do_setattr(idmap, entry, attr, file);
 	if (!ret) {
 		/*
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index daf7b664e1b9..d722382676e2 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1571,7 +1571,7 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 
 /* Inode passthrough operations for backing file attached to inode */
 #define FUSE_PASSTHROUGH_INODE_OPS \
-	(FUSE_PASSTHROUGH_OP_GETATTR)
+	(FUSE_PASSTHROUGH_OP_GETATTR | FUSE_PASSTHROUGH_OP_SETATTR)
 
 #define FUSE_BACKING_MAP_OP(map, op) \
 	((map)->ops_mask & FUSE_PASSTHROUGH_OP(op))
@@ -1683,6 +1683,7 @@ static inline bool fuse_inode_passthrough_op(struct inode *inode,
 
 int fuse_passthrough_getattr(struct inode *inode, struct kstat *stat,
 			     u32 request_mask, unsigned int flags);
+int fuse_passthrough_setattr(struct inode *inode, struct iattr *attr);
 
 static inline bool fuse_use_entry2(struct fuse_conn *fc)
 {
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index 8ecce2a97ee8..c70478f07d6a 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -9,6 +9,7 @@
 
 #include <linux/file.h>
 #include <linux/backing-file.h>
+#include <linux/posix_acl.h>
 #include <linux/splice.h>
 
 static void fuse_file_accessed(struct file *file)
@@ -251,3 +252,33 @@ int fuse_passthrough_getattr(struct inode *inode, struct kstat *stat,
 
 	return 0;
 }
+
+int fuse_passthrough_setattr(struct inode *inode, struct iattr *attr)
+{
+	struct fuse_conn *fc = get_fuse_conn(inode);
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct fuse_backing *fb = fuse_inode_passthrough(fi);
+	const struct cred *old_cred;
+	struct dentry *backing_entry = fb->file->f_path.dentry;
+	struct mnt_idmap *backing_idmap = mnt_idmap(fb->file->f_path.mnt);
+	int err;
+
+	old_cred = override_creds(fb->cred);
+	inode_lock(d_inode(backing_entry));
+	err = notify_change(backing_idmap, backing_entry, attr, NULL);
+	inode_unlock(d_inode(backing_entry));
+	revert_creds(old_cred);
+
+	if (err)
+		return err;
+
+	if (fc->posix_acl)
+		forget_all_cached_acls(inode);
+
+	/*
+	 * Sync the fuse inode's cached attributes with the backing inode after
+	 * updating the backing inode's attributes. The fuse inode's vfs-visible
+	 * fields need to be in sync with the backing inode
+	 */
+	return fuse_passthrough_getattr(inode, NULL, STATX_BASIC_STATS, 0);
+}
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 3963631558f9..040fee549bb9 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -1158,6 +1158,7 @@ struct fuse_backing_map {
 #define FUSE_PASSTHROUGH_OP_WRITE	FUSE_PASSTHROUGH_OP(FUSE_WRITE)
 #define FUSE_PASSTHROUGH_OP_READDIR	FUSE_PASSTHROUGH_OP(FUSE_READDIR)
 #define FUSE_PASSTHROUGH_OP_GETATTR	FUSE_PASSTHROUGH_OP(FUSE_GETATTR)
+#define FUSE_PASSTHROUGH_OP_SETATTR	FUSE_PASSTHROUGH_OP(FUSE_SETATTR)
 
 /* Device ioctls: */
 #define FUSE_DEV_IOC_MAGIC		229
-- 
2.52.0

