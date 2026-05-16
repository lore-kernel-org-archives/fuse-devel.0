Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E733987
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892783; cv=none; b=A3uEQSanvfxtQH4/pzP9Z1qTu7+vsOK0PmJDqqeuXyDKRRuEHrrJzvjSan/ieUL3JtGqxCDZ+/Zo/lFnvnQ4xfgcgHD4Al9069lrkQ8ik+B1wqss9WJKvNgyv1QW481BJ4owa/3hJtjlIYC79xUqkNViZzInnPVVvf0A8f5Js94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892783; c=relaxed/simple;
	bh=83QXb2H8zEYU3YJc6kqnJMkvfyLtCVBTo3qBBCSFH80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDbVlMV0sQ7nRT13WS/Qi/TswskE9RjPZWg17n3Cg2CARQvPFB3PtugeVv2nJmBfxzpRi0mRWL3RUuNIV9L5EqxlRPQfViJgNnFVN90tqosmXG0YZJEFQukrrnKeozZvqf+govkkvBn+F91KdwpHZsxNg9jSfDEXKoQBCG+U904=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnZ95gr2; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnZ95gr2"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-651d6347a69so2786453d50.0
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892781; x=1779497581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0otT9kXQRrcjcRWqrPsgABEM99e3TKRKPZ1SqOUbyY=;
        b=qnZ95gr2nNNUqlshmxucCYigDXEmx250XvP9pd3XoHQrx0EC5LWMfzPzZxVEavqIyU
         f0Rwq/sBdVzu0sP17ipVJMDXhODteLAd4E3u7SmxEAw3dNiSQj5yW5gSEmBlTqjNV62V
         9Q6huOh0DTYtBvgHISuXRK/0HGUVKFseAfpY0OblTLc/27gqYwAjrDTJMsvPaUp878QE
         PrpjH21uO5m/mNEcAseEm/HOrPBA+qO7mJ38fu4LkJ4HIiwH7ihoNJA8XO7fWiV1xq3c
         0R50ZRW0vQuxTrpN1wdMPeH/5bGBke9F6f68Rk9W0841LjqYs8pPNLWgRY0kT09Q8w9x
         WLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892781; x=1779497581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n0otT9kXQRrcjcRWqrPsgABEM99e3TKRKPZ1SqOUbyY=;
        b=ioUrH9VGFOLwqpsnZODAic05dcGlRKXazqvsRDNSQcquHLZE5HWyd5iaKs2tD7O6KH
         EmA8xyGSCUwYkII7PbJY3i4KHwEQYL1PY41T9tzGyaz5G7cP4n9mwFMta3l9VsXVrpgB
         RCFT7xBmLCTngEqb23fPeZpddYumPjZMXfE4fcFy7kYYucdBQQ5JRW/Kx6Mt+lRmtpzd
         d6cfzqcMf9Q/OXszGPBaACLi+x0bI+rZ50FFpnU0FhCbMl/BHD3GlgBw/str2V9ubsqH
         O3Sa5FrySXWkycN3WNXRHJLBsIocEiLgqBzIEAtWRXqXBNq4QKTyQK/iKMdfV7hEgd+O
         bF3Q==
X-Gm-Message-State: AOJu0Yzdyl5+xB7qPUsfDuEdgnsLG7fyoyIg91yGxMdviNi7/cAze33u
	G5+QqFHZJfvlpfVssL1Zz6Nowj8v/evTryJLOBusevj8vVy6EXioQJhu
X-Gm-Gg: Acq92OEg7PzlAp+ojDTXN52/3EM9aHfOP1mtmcgsIwch4nwCtApSjT53phOHI4J9cIo
	1Fc8uXXPQnVwBRdOvdLag9MFbb5GIuicUIp2AsoYKuc2XCMmnOQh2tBu6dpWRem6Ukt3KwvmpAQ
	OVG3FXJkXC2uiUV/m5z0QlOFXlJqMO0BgaAV0cCDoNahVhnaEkSamGmu3I1gVRUUsybR9JEmOMI
	jDlWCDontluZF6Bu78na4WBZ3oeJHW1CwB6XBzKbY+EUTlgGyjMQsV1Mp9TKkdyW1EBgNsjElnM
	r4bTFHneomZCZcL770XN6hhXLHkkzoAtIrYPYQHSZn/dNCJSQDJJ2p/7IzixIdfFpHF+Ixku1w5
	/SAjM8u5p7tCZBzM+L5hHXdYNe987deh7/HN2L0fJlNH7XYAkFvmGO2VAbOgPqZdhVWAUrBwn2W
	KC9rbWTT6CrzVneteC4peHZPq5aYAQ1gU=
X-Received: by 2002:a05:690e:250b:10b0:657:a6a4:6ee2 with SMTP id 956f58d0204a3-65e21483a73mr4552396d50.3.1778892780961;
        Fri, 15 May 2026 17:53:00 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:1f::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0dbcda4bsm3285218d50.18.2026.05.15.17.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:53:00 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 17/21] backing-inode: add backing_inode_copyattr()
Date: Fri, 15 May 2026 17:40:00 -0700
Message-ID: <20260516004004.1455526-18-joannelkoong@gmail.com>
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

Move logic in ovl_copyattr() to a generic backing_inode_copyattr()
function in a new fs/backing-inode.c, which other filesystems that use
backing inodes (eg fuse passthrough) will use.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/Makefile                   |  2 +-
 fs/backing-inode.c            | 43 +++++++++++++++++++++++++++++++++++
 fs/overlayfs/util.c           | 33 +++------------------------
 include/linux/backing-inode.h | 14 ++++++++++++
 4 files changed, 61 insertions(+), 31 deletions(-)
 create mode 100644 fs/backing-inode.c
 create mode 100644 include/linux/backing-inode.h

diff --git a/fs/Makefile b/fs/Makefile
index cf4a745e9679..3f8a227d4938 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -40,7 +40,7 @@ obj-$(CONFIG_COMPAT_BINFMT_ELF)	+= compat_binfmt_elf.o
 obj-$(CONFIG_BINFMT_ELF_FDPIC)	+= binfmt_elf_fdpic.o
 obj-$(CONFIG_BINFMT_FLAT)	+= binfmt_flat.o
 
-obj-$(CONFIG_FS_STACK)		+= backing-file.o
+obj-$(CONFIG_FS_STACK)		+= backing-file.o backing-inode.o
 obj-$(CONFIG_FS_MBCACHE)	+= mbcache.o
 obj-$(CONFIG_FS_POSIX_ACL)	+= posix_acl.o
 obj-$(CONFIG_NFS_COMMON)	+= nfs_common/
diff --git a/fs/backing-inode.c b/fs/backing-inode.c
new file mode 100644
index 000000000000..474770a1fa9d
--- /dev/null
+++ b/fs/backing-inode.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Common helpers for stackable filesystems and backing inodes.
+ */
+
+#include <linux/backing-inode.h>
+
+/*
+ * backing_inode_copyattr - copy inode attributes from a backing inode
+ *
+ * When a filesystem copies inode information from a backing layer to its own
+ * inode, it applies the idmapping of the backing mount, ensuring that
+ * the inode ownership will correctly reflect the ownership of the idmapped
+ * backing mount. For example, an idmapped backing mount mapping id 1001 to id
+ * 1000 will take care to map any backing inode owned by id 1001 to id 1000.
+ * These mapping helpers are nops when the backing mount isn't idmapped.
+ */
+void backing_inode_copyattr(struct inode *inode,
+			    const struct path *backing_path)
+{
+	struct inode *realinode;
+	struct mnt_idmap *real_idmap;
+	vfsuid_t vfsuid;
+	vfsgid_t vfsgid;
+
+	realinode = d_inode_rcu(backing_path->dentry);
+	real_idmap = mnt_idmap(backing_path->mnt);
+
+	spin_lock(&inode->i_lock);
+	vfsuid = i_uid_into_vfsuid(real_idmap, realinode);
+	vfsgid = i_gid_into_vfsgid(real_idmap, realinode);
+
+	inode->i_uid = vfsuid_into_kuid(vfsuid);
+	inode->i_gid = vfsgid_into_kgid(vfsgid);
+	inode->i_mode = realinode->i_mode;
+	inode_set_atime_to_ts(inode, inode_get_atime(realinode));
+	inode_set_mtime_to_ts(inode, inode_get_mtime(realinode));
+	inode_set_ctime_to_ts(inode, inode_get_ctime(realinode));
+	i_size_write(inode, i_size_read(realinode));
+	spin_unlock(&inode->i_lock);
+}
+EXPORT_SYMBOL_GPL(backing_inode_copyattr);
+
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index 3f1b763a8bb4..3e7d66c26c10 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -16,6 +16,7 @@
 #include <linux/namei.h>
 #include <linux/ratelimit.h>
 #include <linux/overflow.h>
+#include <linux/backing-inode.h>
 #include "overlayfs.h"
 
 /* Get write access to upper mnt - may fail if upper sb was remounted ro */
@@ -1503,38 +1504,10 @@ int ovl_sync_status(struct ovl_fs *ofs)
 	return errseq_check(&mnt->mnt_sb->s_wb_err, ofs->errseq);
 }
 
-/*
- * ovl_copyattr() - copy inode attributes from layer to ovl inode
- *
- * When overlay copies inode information from an upper or lower layer to the
- * relevant overlay inode it will apply the idmapping of the upper or lower
- * layer when doing so ensuring that the ovl inode ownership will correctly
- * reflect the ownership of the idmapped upper or lower layer. For example, an
- * idmapped upper or lower layer mapping id 1001 to id 1000 will take care to
- * map any lower or upper inode owned by id 1001 to id 1000. These mapping
- * helpers are nops when the relevant layer isn't idmapped.
- */
 void ovl_copyattr(struct inode *inode)
 {
 	struct path realpath;
-	struct inode *realinode;
-	struct mnt_idmap *real_idmap;
-	vfsuid_t vfsuid;
-	vfsgid_t vfsgid;
 
-	realinode = ovl_i_path_real(inode, &realpath);
-	real_idmap = mnt_idmap(realpath.mnt);
-
-	spin_lock(&inode->i_lock);
-	vfsuid = i_uid_into_vfsuid(real_idmap, realinode);
-	vfsgid = i_gid_into_vfsgid(real_idmap, realinode);
-
-	inode->i_uid = vfsuid_into_kuid(vfsuid);
-	inode->i_gid = vfsgid_into_kgid(vfsgid);
-	inode->i_mode = realinode->i_mode;
-	inode_set_atime_to_ts(inode, inode_get_atime(realinode));
-	inode_set_mtime_to_ts(inode, inode_get_mtime(realinode));
-	inode_set_ctime_to_ts(inode, inode_get_ctime(realinode));
-	i_size_write(inode, i_size_read(realinode));
-	spin_unlock(&inode->i_lock);
+	ovl_i_path_real(inode, &realpath);
+	backing_inode_copyattr(inode, &realpath);
 }
diff --git a/include/linux/backing-inode.h b/include/linux/backing-inode.h
new file mode 100644
index 000000000000..6b43cba9fabd
--- /dev/null
+++ b/include/linux/backing-inode.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Common helpers for stackable filesystems and backing inodes.
+ */
+
+#ifndef _LINUX_BACKING_INODE_H
+#define _LINUX_BACKING_INODE_H
+
+#include <linux/fs.h>
+
+void backing_inode_copyattr(struct inode *inode,
+			    const struct path *backing_path);
+
+#endif /* _LINUX_BACKING_INODE_H */
-- 
2.52.0

