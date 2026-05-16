Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC482472A6
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892789; cv=none; b=V7mm2OCvRWSb8pE6l8OJavHXW72blh3ftcpNnknRx6CZLi/NgJmeTTNH1umNePlAUJHaTDZAA+ZexY7EiJvk7OHyz21clXW8nyjRGUp/z8PVnxkANpXG3tdlMtI3oU94cT76gUcoktPcpQsc4CJNu/f7BbGY2/f/0UjuC+zNxLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892789; c=relaxed/simple;
	bh=UG+RyXmAbf5BMtaJuV+ReumuWH297LQHFH6uXMnK3cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMxeY7bCoHm5mReKnZqTp7paTFpM6u7PPNK641fHDFKgb2eD0AVbVP8mksJ4RulJbk8Q93+bT5VGtppp7Uvj8pgxl+DmdKU4U58WIblNs/TBjWU5qARPRkqmSZCg6yFexU6Vc27NUEru4N9sWrZ/2ybfY9Y0TaMC9Rekeyy+o2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iH6/DL/L; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iH6/DL/L"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7c23248f3a3so573187b3.1
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892787; x=1779497587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpL+NjagBheUb90sz8CHWLzu6c4Er9CRzLxRCD9m2No=;
        b=iH6/DL/LllK+GfEK6KEPW95Dg1jOg2Wk+LAv8jGGFLx0h8mqQYdQl0Ika/kr2WALS5
         uGIia+B1MjjjkZuxwVVNnY14HkL1bMDbMm9QH0Xg1sDOaykAXvEYS9x++e0cuV+0xOF2
         Uykm3dfRnyojVm2ju//rUjlAMdQCRTXvBTK8ERi3vksDsls8PgRa5FknCUfARDyO3+kD
         uBCp1pz4FY9kEz3dlFQZQEIvNu8mXhNtAKxzHNIXwJkLX753f+c/rBgO2VLwJcpLxmNH
         E/9Ogwgf2BhMq2zUomRi4yTXdK8jXg8aFKTSvcZwt/kS4XKJLQ4zDgU8zvGChXzuC6xe
         GoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892787; x=1779497587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HpL+NjagBheUb90sz8CHWLzu6c4Er9CRzLxRCD9m2No=;
        b=qVXSVbsNwkcEu3tf9bctJOxiucu6XBsgQNmi3ZzOzmdWM5qWiwHbVLfNWqo5iz82DN
         7Ez1GBPJod62yIHQERh8ICSFNTGseUnSRGqD3I0j0lEJHWJkNgvbEpPwO69oHwQA01uo
         hw/Bv1CjnOmiVn/+MBsqR+RzXfUerwLw9PTFQZ2JenvoO8NHpQIVrHYbGr0l9z+CW23b
         zJCNtEgEXFU26s+jbwegci1kjnAb3Mk/Q/CqP50plTt7e7GcSyMSoYSyzqdJ4yxr6l1M
         sg9YJovy2tFN+h974dLN8cp9vpM4+pzsulqvLYhyMLyrJlapAqTAKnzTV9pzDBEFp3nn
         2drw==
X-Gm-Message-State: AOJu0Yz/Rs25dzp2JBBm9oIsAYvEjci9Y9P9Xds7rYIMB6FXKxdTo8MS
	IHBy4Faj6is/OgnkSVM51qR2HGf1mExKaCELKnU+MwIXdWTqq3qW2Cbu
X-Gm-Gg: Acq92OHSUKLUkVFGDJGJRq2Nuj59MU/jwEyvGhnGXf8hV2Lb2Ch5rISxxsjeoeeeRA5
	31u82fvmQEAsXOuvhOfUke3VDJNLHYM03OW0V3K1mSOsJ9uvLVqnQfPqBMiMonoZFUDUXbvvXhF
	UNlcrmVve55nlRuihgm0n/u2FwQQUHnmq/UTP4uNMvuL2CFSorvuAtP6hgiurs//ahD7rCWzW0V
	bBDdjKfo0ABGKNcZRNkKo4p63uqoN4BmY8AQmWOcoiQxoRTpEHSyjdPmqiE0yzLjjT+1c7YXDec
	xV9N6Aq5UvgalE+MQwXBa/sIuLemVgGdFJKduKvevm8M0N+J5ZJ2WLhMmPUJOQeeDUGVCP9Dhhc
	tnwWRlRZx4Xv+TNRWH+C3YjfWtbfRjSvbzvE9bU6E6A6wfVtHAEOL2t6jGi/8h+KOa72L6tjHEK
	np+/9LuuDtq/WSIq0pMQVL
X-Received: by 2002:a05:690c:6c87:b0:7c0:8028:11f7 with SMTP id 00721157ae682-7c959b9720amr74865897b3.6.1778892787079;
        Fri, 15 May 2026 17:53:07 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:15::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f5c965d6sm38268157b3.47.2026.05.15.17.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:53:06 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 19/21] fuse: add passthrough setattr
Date: Fri, 15 May 2026 17:40:02 -0700
Message-ID: <20260516004004.1455526-20-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260516004004.1455526-1-joannelkoong@gmail.com>
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add passthrough setattr which sets attributes directly on the backing
inode through backing_inode_setattr() instead of sending FUSE_SETATTR to
the server.

Passthrough setattr is checked before the
handle_killpriv/handle_killpriv_v2 suid/sgid stripping because the
stripping is handled natively by notify_change() on the backing inode.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c             |  3 +++
 fs/fuse/fuse_i.h          |  3 ++-
 fs/fuse/passthrough.c     | 28 ++++++++++++++++++++++++++++
 include/uapi/linux/fuse.h |  1 +
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 4c7e3e1604af..b67b3b334e69 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -2506,6 +2506,9 @@ static int fuse_setattr(struct mnt_idmap *idmap, struct dentry *entry,
 	if (!fuse_allow_current_process(get_fuse_conn(inode)))
 		return -EACCES;
 
+	if (fuse_passthrough_op(inode, FUSE_SETATTR))
+		return fuse_passthrough_setattr(entry, attr);
+
 	if (attr->ia_valid & (ATTR_KILL_SUID | ATTR_KILL_SGID)) {
 		attr->ia_valid &= ~(ATTR_KILL_SUID | ATTR_KILL_SGID |
 				    ATTR_MODE);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 89c9333e9702..0d978a9837a0 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1279,7 +1279,7 @@ ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *from);
 
 /* Inode passthrough operations for backing file attached to inode */
 #define FUSE_PASSTHROUGH_INODE_OPS \
-	(FUSE_PASSTHROUGH_OP_GETATTR)
+	(FUSE_PASSTHROUGH_OP_GETATTR | FUSE_PASSTHROUGH_OP_SETATTR)
 
 #define FUSE_BACKING_MAP_OP(map, op) \
 	((map)->ops_mask & FUSE_PASSTHROUGH_OP(op))
@@ -1367,6 +1367,7 @@ static inline bool fuse_passthrough_op(struct inode *inode, enum fuse_opcode op)
 
 int fuse_passthrough_getattr(struct inode *inode, struct kstat *stat,
 			     u32 request_mask, unsigned int flags);
+int fuse_passthrough_setattr(struct dentry *entry, struct iattr *attr);
 
 static inline bool fuse_use_entry2(struct fuse_conn *fc)
 {
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index ae0137caa06d..c083ab68537e 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -9,6 +9,8 @@
 
 #include <linux/file.h>
 #include <linux/backing-file.h>
+#include <linux/backing-inode.h>
+#include <linux/posix_acl.h>
 #include <linux/splice.h>
 
 static void fuse_file_accessed(struct file *file)
@@ -275,3 +277,29 @@ int fuse_passthrough_getattr(struct inode *inode, struct kstat *stat,
 
 	return 0;
 }
+
+int fuse_passthrough_setattr(struct dentry *entry, struct iattr *attr)
+{
+	struct inode *inode = d_inode(entry);
+	struct fuse_conn *fc = get_fuse_conn(inode);
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct fuse_backing *fb = fuse_inode_backing(fi);
+	struct path path;
+	int err;
+
+	err = setattr_prepare(&nop_mnt_idmap, entry, attr);
+	if (err)
+		return err;
+
+	path.mnt = fb->file->f_path.mnt;
+	path.dentry = fb->file->f_path.dentry;
+
+	err = backing_inode_setattr(entry, &path, attr, fb->cred);
+	if (err)
+		return err;
+
+	if (fc->posix_acl)
+		forget_all_cached_acls(inode);
+
+	return 0;
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

