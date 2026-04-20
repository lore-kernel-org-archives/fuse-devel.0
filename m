Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FB23876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723529; cv=none; b=pQnNJQtYL2B3Mbd5SUyLg1hYl1/41iWtaCJnU7ciREXXIRqdyvE5KicDe7Ksd30ycAYvjIOWEQED1eM2Yux+6LoBfTT7cNQ0o1qOB/2ozaigofaW9wv3pAZukKEFP917B0MuDcS8wPt8xO8OEITmxTjTVKFKLLn8XgFxzzcpr+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723529; c=relaxed/simple;
	bh=LXSpmLXTTjLzpUcXdolnw/z36d/x12Zv6vtK+ij0ZXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzvImR/moLUvdrR7xBwEHUiVvWOL0iNlVofC4VaQ0YAKhAkXNAVNbVpudJnGzOBaZOJVQKq1RXKTdJ0c1t5gm86a6CTgXdEPJpnGQgXudfMyWII7YR6IuCPl6PZ5GYZCaxnDovuwXEa0ERGnaDzEFgO9ym4eArYHU9DXnx86OJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URuEz4fj; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URuEz4fj"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82735a41920so1474654b3a.2
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723527; x=1777328327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3R46tLzTx5Kn2hUEm+HILc83T4LvG+XFTroFewF8sE=;
        b=URuEz4fjN91lhCctF9f9r80o1SoDPWLC4ZT4cad2jv2nfEqLGwL8RvCIJc/uB2i78y
         qeP6pGwgVTRqdo9y1D4mQ0+XR/E6/2Y1U/vUsCK1uAy72hjHTbjvX1zth6s1lLnVTV2w
         SZrRO+yreM+VFmbpAlGI7vrOFNJsB6r1xKrxDXQ3DcrDBhLRwdA3NxISlv+429WF4FUm
         KFDSGA8b/CDfWNDC7lPEGPIhhYTQOFCqE+eGlxl/NZMjzXeko7+ICo9VnrZxDXnLP3PP
         pCiNhLmJ01TlJICnsHqIleMPW+as3loZXGa8KjWaurzanEQnZmeTNAXAuy50c/UIPtRK
         sViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723527; x=1777328327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g3R46tLzTx5Kn2hUEm+HILc83T4LvG+XFTroFewF8sE=;
        b=JaYpBUz5srugq2jquMa2jiO9jYbuCeLFjzDGFKNx4BpQC7GD7KX+C93hXgZccnJ8wr
         vDrKi9T865vr2Z+TCT1MrV+JGQvuspfncCxqTMxPo+zxpX1vHT2Fb7Qh9Cn/La/1cEc9
         34Y0GF+yrpzvO//jseUKJgApCHT3ERTsahlbiv7xYmLEhmDIIUn0jInGW4B52Z4YR8/c
         VTTsqf/dTADINEq5mG2X13ersEHQ1cjHt55SXIgy6dk8/3YzD5pvmPGWzhEmpnjjpAzc
         VhrmclYgc7gX8h6IT3dRldN0wczYkEAxdUdf8aw/rkC7WxUQ84vN/RPXaSndcBhYVr7e
         GyuA==
X-Forwarded-Encrypted: i=1; AFNElJ/Dwywj8b13Zv7OZEc32gRjjUd+n2KvmfZZA1pYoNueKfD4GNhUF/obHTLcqjJExObpOTnKZh+AyCHd@lists.linux.dev
X-Gm-Message-State: AOJu0YwE55cl07ItVYu/bnedDGn2gS25vyGcycN37Og1oEQ5h5gRNyjG
	xvDGvZjf6ptd++8jmV3wmZLisqjZPwKmi1nmwY18vAQHIPWpPgEdEoPw
X-Gm-Gg: AeBDietux3rdg+EPyPHue3nxOHdlaM9r1C4r5xaId3sIPOA7DFF/hPgnOPlgz6ianYC
	tlubzXYxlfSzvBP/oVmT4mcCPwvzF6DHG3zFz000So59UJby3hxNT1aOr1HLRRUn9N+I6RfL9nV
	51NOg0ul2s5TsHU5yjWYp/scoCK2TXpOVIxADXP9iMqZJ78346+OPoiiMHgk6pem7ku6bjQRlZ4
	uAbT8puTv8LItwtfERl73uBTcfDUbS3pXPReVvi0JmxF8qqdfTYYxEgvIjnMvj59ZauKK42BfdA
	TqtU6PI2afWV7KzNQlg14LpHnVoq6/O+9lAoEOJOf6bqlqFKk99HQEryDpSYC/z+6lQXBixoHHy
	NI0HxTN6EC2DpAfz3ynzs5nqn7hhXlNcn4EYdYNL4h6EdzAvydVBLmu1icSBg3LCpne0++m4mxJ
	3VGW9tb8Ov1cFQTd+9h5GPkX7QlzCF
X-Received: by 2002:a05:6a00:21d3:b0:82a:6de8:fa50 with SMTP id d2e1a72fcca58-82f8c82eac0mr15746030b3a.18.1776723527150;
        Mon, 20 Apr 2026 15:18:47 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:44::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ea02ef7sm10792277b3a.25.2026.04.20.15.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:46 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 09/17] fuse: prepare to cache statx attributes from entry replies
Date: Mon, 20 Apr 2026 15:16:29 -0700
Message-ID: <20260420221637.2631478-10-joannelkoong@gmail.com>
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

Add an arg for a struct fuse_statx pointer to fuse_iget() and pass it
through to fuse_change_attributes_i() so the statx attributes get
persisted in cache.

All existing callers pass in NULL for the arg. This change is in
preparation for a new struct fuse_entry2_out outarg which will contain
filled out statx information from the server returned on
LOOKUP/MKDIR/MKNOD/etc requests.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c     |  6 +++---
 fs/fuse/fuse_i.h  |  7 +++----
 fs/fuse/inode.c   | 12 ++++++------
 fs/fuse/readdir.c |  2 +-
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 2d037591a3ab..94ab05cb89ce 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -589,7 +589,7 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
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
 		fuse_queue_forget(fm->fc, forget, outarg.nodeid, 1);
 		return ERR_PTR(-ENOMEM);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 45d9184d0f7a..e422d3dc2202 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1147,10 +1147,9 @@ extern const struct dentry_operations fuse_dentry_operations;
 /**
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
index c80ec5d2ce82..3b71685e7148 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -469,8 +469,8 @@ static int fuse_inode_set(struct inode *inode, void *_nodeidp)
 
 struct inode *fuse_iget(struct super_block *sb, u64 nodeid,
 			int generation, struct fuse_attr *attr,
-			u64 attr_valid, u64 attr_version,
-			u64 evict_ctr)
+			struct fuse_statx *sx, u64 attr_valid,
+			u64 attr_version, u64 evict_ctr)
 {
 	struct inode *inode;
 	struct fuse_inode *fi;
@@ -532,7 +532,7 @@ struct inode *fuse_iget(struct super_block *sb, u64 nodeid,
 	fi->nlookup++;
 	spin_unlock(&fi->lock);
 done:
-	fuse_change_attributes_i(inode, attr, NULL, attr_valid, attr_version,
+	fuse_change_attributes_i(inode, attr, sx, attr_valid, attr_version,
 				 evict_ctr);
 	if (is_new_inode)
 		unlock_new_inode(inode);
@@ -1070,7 +1070,7 @@ static struct inode *fuse_get_root_inode(struct super_block *sb, unsigned int mo
 	attr.mode = mode;
 	attr.ino = FUSE_ROOT_ID;
 	attr.nlink = 1;
-	return fuse_iget(sb, FUSE_ROOT_ID, 0, &attr, 0, 0, 0);
+	return fuse_iget(sb, FUSE_ROOT_ID, 0, &attr, NULL, 0, 0, 0);
 }
 
 struct fuse_inode_handle {
@@ -1755,8 +1755,8 @@ static int fuse_fill_super_submount(struct super_block *sb,
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
index 1f2ff63cd317..7bd17b3389e6 100644
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

