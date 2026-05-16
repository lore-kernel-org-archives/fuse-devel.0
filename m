Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D37A25228D
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892766; cv=none; b=HPvzDUT0SjsdfUKU+ypS774SSPyobEQOXTJdOUPhfrxWCo1y+RirDCmuFTSwXXRujH8J3HoL8/xt2901Sm4S894brHP2daYBRU1hP/d7fL6KRpIfkhQGqqF0hIKhxJP6sHX2xbma6Uf/DWkoDDbQWqVoKmyICmk6Z9Khyu9nv/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892766; c=relaxed/simple;
	bh=zSJkALzDqGKukVQxTZaJiqRxx6oxqqmIOxTG3xaoZfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pIDHASJ64ou49lfuOJZCWcjtZsEi5W1Zw/UpEdph688Prubpfhuf7OdODNCP66yGSfhdBmA9JdGE7n3X26qYWi19E2HMVsbE/3IGuC6L5GdoBk0EmbThmL/4VF/PsqHzESljw8U2V4dmgiucwtb4Bgfd8VDX4dfonOIhej8bb8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvfRHlAX; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvfRHlAX"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7bd6f65c781so513447b3.1
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892762; x=1779497562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sX7MssyZLaYfDJYTzs3MFepTBP0DFDIJ3NryOJvrQuw=;
        b=lvfRHlAXcBhBx0suICzIEnhYSrkPJiUVM89OcYNxQmkBjsIe3dD8agXSCOsTowrdEj
         zObbG1Cdeu0zKS7KVmoWel5RCqsXnkju2iyjjxFQtcrfgyT5jVySjWC177m8D3/iRLjQ
         eIWDbsDhfaz4xQHdI6wz9SOLJd/iL4OohOBVOT1YDRBX+my9VuA7oQJUVTnIED+XQ54n
         FGZZxG0bhe1j+2XjDEXjSlSvLzAVs7w7FhDUGHctymw+phJHxeHPIM8piAHEgckm3kt9
         pOYQAoEZ2Y/zEd5M9WTBLbXXoesnJf1WY9LClsfHyRkp9z/tSfEPWlNdrX9CgNKRYx+8
         UIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892762; x=1779497562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sX7MssyZLaYfDJYTzs3MFepTBP0DFDIJ3NryOJvrQuw=;
        b=PPoTnlsa1S4gpphg7aUcObtdEhP3xfaTdZnLhfBTzgIUXJY3PplrMWQkMspVqDDmtt
         Mom7itkDz1QF9qwPS0b8Rxf6VDplY8JW10GhU1QK5OEfDDgywwrBIKm244PQpaBhHs+L
         bITzGxkrKksbP9IISXvYDog/yd54qe5UAixpmAr0nOPKuXOSPq6ia/NIPWNXlXVBPvMd
         hB5rJ4qfssGzMkvpYTI7OmLRl1FFUqWWG0nnKS/nS+gEdfz9fyhJq785SyFOkdjAdvha
         jSfovXrIWNWVWslOlYB087OEaJXwRqux1O5t+V3b7T48uw1hNkWqb+6t63Ugrmi/08Wo
         shKQ==
X-Gm-Message-State: AOJu0YzcFT9b0sKr+e446tkqTgKBy734zZQ4NbbnIzHoQqix6ddUIBwy
	djHWypQMwvsC5tChNCRCPTdcyCwGBTreR0qt+b8pSz5jgvooq66fGifk
X-Gm-Gg: Acq92OGc4RdxDRvNRHRBMLb/LfQU+sWNPt/JLmYaLQYjq+HlDprFiXfRWIVJzIHCti1
	DI/NFTvLjh8CXOy2N9EbT3tv53unKJHNzB7rvQMvDfOjdudQX5DBfz8kibVw/acgEOf8S8lbtgg
	7x7tJFDYY+eH/xUzYhAzEH3ho73fSNuxnafgNu6lj46R326MvTCLPIR8jdv2M/RTBgIrXZih4ip
	McI7D/5Us32PY9c0RLmar8wjRR1Xqdq72T3w5hbvkCc4T4ae8j0V6wcUZmfWc/Efwv5+Gpu+gNi
	xhYTx8vq2UmGj2u88xG70BQ8RDd1ZQ6FvCu0dDMBrsQQoLfALJFdLxe7naIdE1XUYGFU7VPBNJb
	LAZEkwHS9Xk4lAaOqRnThRVnzrBjio6XF24zAdewIuyNzooSfwuAZji0ytiM3KnHJQFBTD2MoAY
	quUOsAf68PAAC3DOOwrt5HAp+NJMADYX8=
X-Received: by 2002:a05:690c:9d:b0:7bd:956c:336a with SMTP id 00721157ae682-7c7e6680aa4mr90425957b3.13.1778892762230;
        Fri, 15 May 2026 17:52:42 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:1c::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f2e9324csm37482117b3.22.2026.05.15.17.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:41 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 10/21] fuse: prepare to cache statx attributes from entry replies
Date: Fri, 15 May 2026 17:39:53 -0700
Message-ID: <20260516004004.1455526-11-joannelkoong@gmail.com>
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

Add an arg for a struct fuse_statx pointer to fuse_iget() and pass it
through to fuse_change_attributes_i() so the statx attributes get
persisted in cache.

All existing callers pass in NULL for the arg. This change is in
preparation for a new struct fuse_entry2_out outarg which will contain
filled out statx information from the server returned on
LOOKUP/MKDIR/MKNOD/etc requests.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c     |  6 +++---
 fs/fuse/fuse_i.h  |  7 +++----
 fs/fuse/inode.c   | 12 ++++++------
 fs/fuse/readdir.c |  2 +-
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 9a8e525f4d2b..7d3c9878b833 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -590,7 +590,7 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 	}
 
 	*inode = fuse_iget(sb, outarg->nodeid, outarg->generation,
-			   &outarg->attr, ATTR_TIMEOUT(outarg),
+			   &outarg->attr, NULL, ATTR_TIMEOUT(outarg),
 			   attr_version, evict_ctr);
 	err = -ENOMEM;
 	if (!*inode) {
@@ -890,7 +890,7 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	ff->nodeid = outentry.nodeid;
 	ff->open_flags = outopenp->open_flags;
 	inode = fuse_iget(dir->i_sb, outentry.nodeid, outentry.generation,
-			  &outentry.attr, ATTR_TIMEOUT(&outentry), 0, 0);
+			  &outentry.attr, NULL, ATTR_TIMEOUT(&outentry), 0, 0);
 	if (!inode) {
 		flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
 		fuse_sync_release(NULL, ff, flags, false);
@@ -1017,7 +1017,7 @@ static struct dentry *create_new_entry(struct mnt_idmap *idmap, struct fuse_moun
 		goto out_put_forget_req;
 
 	inode = fuse_iget(dir->i_sb, outarg.nodeid, outarg.generation,
-			  &outarg.attr, ATTR_TIMEOUT(&outarg), 0, 0);
+			  &outarg.attr, NULL, ATTR_TIMEOUT(&outarg), 0, 0);
 	if (!inode) {
 		fuse_chan_queue_forget(fm->fc->chan, forget, outarg.nodeid, 1);
 		return ERR_PTR(-ENOMEM);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index a1034533ce60..1f2c849ea4e3 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -912,10 +912,9 @@ extern const struct dentry_operations fuse_dentry_operations;
 /*
  * Get a filled in inode
  */
-struct inode *fuse_iget(struct super_block *sb, u64 nodeid,
-			int generation, struct fuse_attr *attr,
-			u64 attr_valid, u64 attr_version,
-			u64 evict_ctr);
+struct inode *fuse_iget(struct super_block *sb, u64 nodeid, int generation,
+			struct fuse_attr *attr, struct fuse_statx *sx,
+			u64 attr_valid, u64 attr_version, u64 evict_ctr);
 
 int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name,
 		     struct fuse_entry_out *outarg, struct inode **inode);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 9e9c20e846e7..8757c01e3bb2 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -457,8 +457,8 @@ static int fuse_inode_set(struct inode *inode, void *_nodeidp)
 
 struct inode *fuse_iget(struct super_block *sb, u64 nodeid,
 			int generation, struct fuse_attr *attr,
-			u64 attr_valid, u64 attr_version,
-			u64 evict_ctr)
+			struct fuse_statx *sx, u64 attr_valid,
+			u64 attr_version, u64 evict_ctr)
 {
 	struct inode *inode;
 	struct fuse_inode *fi;
@@ -520,7 +520,7 @@ struct inode *fuse_iget(struct super_block *sb, u64 nodeid,
 	fi->nlookup++;
 	spin_unlock(&fi->lock);
 done:
-	fuse_change_attributes_i(inode, attr, NULL, attr_valid, attr_version,
+	fuse_change_attributes_i(inode, attr, sx, attr_valid, attr_version,
 				 evict_ctr);
 	if (is_new_inode)
 		unlock_new_inode(inode);
@@ -1049,7 +1049,7 @@ static struct inode *fuse_get_root_inode(struct super_block *sb, unsigned int mo
 	attr.mode = mode;
 	attr.ino = FUSE_ROOT_ID;
 	attr.nlink = 1;
-	return fuse_iget(sb, FUSE_ROOT_ID, 0, &attr, 0, 0, 0);
+	return fuse_iget(sb, FUSE_ROOT_ID, 0, &attr, NULL, 0, 0, 0);
 }
 
 struct fuse_inode_handle {
@@ -1652,8 +1652,8 @@ static int fuse_fill_super_submount(struct super_block *sb,
 		return -ENOMEM;
 
 	fuse_fill_attr_from_inode(&root_attr, parent_fi);
-	root = fuse_iget(sb, parent_fi->nodeid, 0, &root_attr, 0, 0,
-			 fuse_get_evict_ctr(fm->fc));
+	root = fuse_iget(sb, parent_fi->nodeid, 0, &root_attr, NULL, 0,
+			 0, fuse_get_evict_ctr(fm->fc));
 	/*
 	 * This inode is just a duplicate, so it is not looked up and
 	 * its nlookup should not be incremented.  fuse_iget() does
diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 49226f022339..0dcb2d75d50f 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -234,7 +234,7 @@ static int fuse_direntplus_link(struct file *file,
 		 */
 	} else {
 		inode = fuse_iget(dir->i_sb, o->nodeid, o->generation,
-				  &o->attr, ATTR_TIMEOUT(o),
+				  &o->attr, NULL, ATTR_TIMEOUT(o),
 				  attr_version, evict_ctr);
 		if (!inode)
 			inode = ERR_PTR(-ENOMEM);
-- 
2.52.0

