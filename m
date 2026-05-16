Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165F025228D
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892786; cv=none; b=pNXerlTff7r1x1O9w8wGkdLdGoAqkKPZvSHPnSsyMXhT/6NdDimDtY0ZXCWA7T0Lj0xH096RzWH1qFdfXfyvs39rcAA9g5XlVKq61w40jCan5VtQS0xLfjxaTqvPyW1LzULzpfl7dxnlGF95simk6IU4BFlEaxc783f7A6CNa98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892786; c=relaxed/simple;
	bh=pB/iMarwsGvZxdwSqwkF0CCgm1K7/63lXSX7V3m4wBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUn50z0PPXj2vQIMItED10fwG8MTmaS+BjwY8IAy+Tu6t6BR1QCBkCXIK+2RbqQCLQNl0aGA1msEG/LGFWQDdNF+Xuz+Fp8YjMPADHt0+omETQFQyeubYUj4gDNRWbhNjrpoktsGGslY0vGUst9Ojk7iEM2nfoL0RqjjfLk1o38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLlmb0b9; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLlmb0b9"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7bdf83185bbso506947b3.2
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892784; x=1779497584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aw3LBRGJ21Qgcn+sxKL5AGoP01BrPzR1EMWQXzshZ7M=;
        b=JLlmb0b92uusIwBTaJMGNTDecgLxO2ax1SkKmQOwXJsfZgal99r+vWuWubqdw9X6Zc
         Z0XneYDjGOqhxASqpcF7YCvx1Ctze14evv3/DxpNU9Ir7XaOVRtZav1ar0De13wl0xMR
         /KsbWqFJx66xdC0VU03LXNGJavJEQptoHlApt/CKd04nJNj9QWhmW41LDqOqHkmhTILo
         8n22BwWV/39gd48pjz9K/dnBwHCFTEiCAgA9TNquqiZfW1+ud0VsfiuVo4mKJjQQLj7g
         lJQ+ELiWmXE4JAcu/rTHgRcEVSwfcRkkFb0GUuCkobacaDwAaVNaJm+ek5ENsoGtHRSb
         vcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892784; x=1779497584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aw3LBRGJ21Qgcn+sxKL5AGoP01BrPzR1EMWQXzshZ7M=;
        b=mKIojaKFeURZSUnEU+Pd37whS0FaVKh8JX6dABYE5sPABl8xdw8+1h4GlXR7TIYFAf
         aAIN1i3vjMRtapB9SI/PuAwYtNZuAQYiLB4n0GhKoPT0k7fnvF5PAStMY1KHxQVGqZLd
         P/Dau58d6x2ewPrGJ+zD/q/YMIq6eHWUQR4/BzkXqA7QFz+6TnmLtOPSoHDnbFZTJGXR
         S5oQov5Ima16YDNNAJaNghA9Wznnfe7xMlO4PN97rxo75cI3dWNqbOjpky4hFHObYMdY
         iQbtjXHs6zfxdkvak/KY5o15XwE+eX2j/tNN0rbDoxH7TQcfK9L6tf91N5SWhcPtbs6y
         c5cQ==
X-Gm-Message-State: AOJu0YyKPzP7e4yQtLgdZBrR6Bfcx8KPd5/i1enW8PASJGhhB+TodcQm
	5o3gNy5z5d2iKSEivDxu5v4QzgQwq+yTHk7R5/o+N3y2fmbDd9FNj5fl19mW8nYU
X-Gm-Gg: Acq92OGyR2e9FCKScNTzL15n3mVz5bks32BODtbhxw9MGw7V416qqomcCgDYcyF5Tu+
	uA4wih/Wav4jcYIz+O2ymJqxv4bquNcKUEsn2SQQI8E01HyRSUtDAvLwlnkAAgJ0WsZjItI6tvl
	yd1yCt+O2mXKqytEOVnBS7mmkmxJuYgD/horn3ivNFscIAOnxyFsrYWojo9+hwgxwcosQ7UBGUM
	1ZFXgu//87/edNjBv7DzdAazkYqPJ2r+2vCldvA/Hj4p7CyBhjnX1SH/MvhzxuhKG91XJCE9vt9
	p6rZiJeyTLF79xB9QJJ6zK2TF6ZCRJOh0Wy1ZVWriLLmXLRsz8lpJf9QCzO3IE/jNGgwDW6QYWf
	f/d25ktcA0wce5ebjuGnOXxVMerwbyBgAArPAud+5u4OcreZYqxqCiDQGMtTcz3HI4W2cRhBUyj
	LRl3JB6W5VTbJZP32aolQ=
X-Received: by 2002:a05:690c:6e85:b0:7bd:b0a0:509c with SMTP id 00721157ae682-7c95b8260e6mr71533377b3.28.1778892784146;
        Fri, 15 May 2026 17:53:04 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:b::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f5aa24fesm36502657b3.42.2026.05.15.17.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:53:03 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 18/21] backing-inode: add backing_inode_setattr()
Date: Fri, 15 May 2026 17:40:01 -0700
Message-ID: <20260516004004.1455526-19-joannelkoong@gmail.com>
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

Move logic in ovl_setattr() to a generic backing_inode_setattr() function
in fs/backing-inode.c, which other filesystems that use backing inodes
(eg fuse passthrough) will use.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/backing-inode.c            | 54 ++++++++++++++++++++++++++++
 fs/overlayfs/inode.c          | 66 ++++++++++-------------------------
 include/linux/backing-inode.h |  4 +++
 3 files changed, 76 insertions(+), 48 deletions(-)

diff --git a/fs/backing-inode.c b/fs/backing-inode.c
index 474770a1fa9d..e72f278789d8 100644
--- a/fs/backing-inode.c
+++ b/fs/backing-inode.c
@@ -41,3 +41,57 @@ void backing_inode_copyattr(struct inode *inode,
 }
 EXPORT_SYMBOL_GPL(backing_inode_copyattr);
 
+int backing_inode_setattr(struct dentry *dentry,
+			  const struct path *backing_path,
+			  struct iattr *attr, const struct cred *cred)
+{
+	struct dentry *backing_dentry = backing_path->dentry;
+	struct inode *winode = NULL;
+	int err;
+
+	if (attr->ia_valid & ATTR_SIZE) {
+		winode = d_inode(backing_dentry);
+		err = get_write_access(winode);
+		if (err)
+			return err;
+	}
+
+	/*
+	 * Clear ATTR_MODE to avoid BUG_ON in notify_change(), which does not
+	 * allow ATTR_MODE together with ATTR_KILL_SUID/SGID (the first
+	 * notify_change() converted ATTR_KILL_SUID/SGID into ATTR_MODE using
+	 * @dentry's inode mode).
+	 *
+	 * This also ensures notify_change() recomputes the mode from the
+	 * backing inode's current mode, instead of a potentially stale value
+	 * from @dentry's inode.
+	 */
+	if (attr->ia_valid & (ATTR_KILL_SUID|ATTR_KILL_SGID))
+		attr->ia_valid &= ~ATTR_MODE;
+
+	/*
+	 * The filesystem's file is not meaningful to the backing filesystem.
+	 * Clear ATTR_FILE so the backing filesystem does not try to use it.
+	 */
+	attr->ia_valid &= ~ATTR_FILE;
+
+	err = mnt_want_write(backing_path->mnt);
+	if (err)
+		goto out_put_write;
+
+	inode_lock(backing_dentry->d_inode);
+	scoped_with_creds(cred)
+		err = notify_change(mnt_idmap(backing_path->mnt),
+				    backing_dentry, attr, NULL);
+	if (!err)
+		backing_inode_copyattr(dentry->d_inode, backing_path);
+	inode_unlock(backing_dentry->d_inode);
+	mnt_drop_write(backing_path->mnt);
+
+out_put_write:
+	if (winode)
+		put_write_access(winode);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(backing_inode_setattr);
diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
index 00c69707bda9..f1cd67e6e9c8 100644
--- a/fs/overlayfs/inode.c
+++ b/fs/overlayfs/inode.c
@@ -15,16 +15,17 @@
 #include <linux/namei.h>
 #include <linux/posix_acl.h>
 #include <linux/posix_acl_xattr.h>
+#include <linux/backing-inode.h>
 #include "overlayfs.h"
 
 
 int ovl_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		struct iattr *attr)
 {
+	struct path backing_path;
 	int err;
 	struct ovl_fs *ofs = OVL_FS(dentry->d_sb);
 	bool full_copy_up = false;
-	struct dentry *upperdentry;
 
 	err = setattr_prepare(&nop_mnt_idmap, dentry, attr);
 	if (err)
@@ -39,57 +40,26 @@ int ovl_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		err = ovl_copy_up(dentry);
 	else
 		err = ovl_copy_up_with_data(dentry);
-	if (!err) {
-		struct inode *winode = NULL;
-
-		upperdentry = ovl_dentry_upper(dentry);
-
-		if (attr->ia_valid & ATTR_SIZE) {
-			winode = d_inode(upperdentry);
-			err = get_write_access(winode);
-			if (err)
-				goto out;
-		}
-
-		if (attr->ia_valid & (ATTR_KILL_SUID|ATTR_KILL_SGID))
-			attr->ia_valid &= ~ATTR_MODE;
 
-		/*
-		 * We might have to translate ovl file into real file object
-		 * once use cases emerge.  For now, simply don't let underlying
-		 * filesystem rely on attr->ia_file
-		 */
-		attr->ia_valid &= ~ATTR_FILE;
-
-		/*
-		 * If open(O_TRUNC) is done, VFS calls ->setattr with ATTR_OPEN
-		 * set.  Overlayfs does not pass O_TRUNC flag to underlying
-		 * filesystem during open -> do not pass ATTR_OPEN.  This
-		 * disables optimization in fuse which assumes open(O_TRUNC)
-		 * already set file size to 0.  But we never passed O_TRUNC to
-		 * fuse.  So by clearing ATTR_OPEN, fuse will be forced to send
-		 * setattr request to server.
-		 */
-		attr->ia_valid &= ~ATTR_OPEN;
+	if (err)
+		return err;
 
-		err = ovl_want_write(dentry);
-		if (err)
-			goto out_put_write;
+	/*
+	 * If open(O_TRUNC) is done, VFS calls ->setattr with ATTR_OPEN
+	 * set.  Overlayfs does not pass O_TRUNC flag to underlying
+	 * filesystem during open -> do not pass ATTR_OPEN.  This
+	 * disables optimization in fuse which assumes open(O_TRUNC)
+	 * already set file size to 0.  But we never passed O_TRUNC to
+	 * fuse.  So by clearing ATTR_OPEN, fuse will be forced to send
+	 * setattr request to server.
+	 */
+	attr->ia_valid &= ~ATTR_OPEN;
 
-		inode_lock(upperdentry->d_inode);
-		with_ovl_creds(dentry->d_sb)
-			err = ovl_do_notify_change(ofs, upperdentry, attr);
-		if (!err)
-			ovl_copyattr(dentry->d_inode);
-		inode_unlock(upperdentry->d_inode);
-		ovl_drop_write(dentry);
+	backing_path.dentry = ovl_dentry_upper(dentry);
+	backing_path.mnt = ovl_upper_mnt(ofs);
 
-out_put_write:
-		if (winode)
-			put_write_access(winode);
-	}
-out:
-	return err;
+	return backing_inode_setattr(dentry, &backing_path, attr,
+				     ovl_creds(dentry->d_sb));
 }
 
 static void ovl_map_dev_ino(struct dentry *dentry, struct kstat *stat, int fsid)
diff --git a/include/linux/backing-inode.h b/include/linux/backing-inode.h
index 6b43cba9fabd..fd02c87e0f99 100644
--- a/include/linux/backing-inode.h
+++ b/include/linux/backing-inode.h
@@ -11,4 +11,8 @@
 void backing_inode_copyattr(struct inode *inode,
 			    const struct path *backing_path);
 
+int backing_inode_setattr(struct dentry *dentry,
+			  const struct path *backing_path,
+			  struct iattr *attr, const struct cred *cred);
+
 #endif /* _LINUX_BACKING_INODE_H */
-- 
2.52.0

