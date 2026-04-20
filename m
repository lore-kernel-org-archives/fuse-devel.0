Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88363876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723533; cv=none; b=Ixd/WirHAfeNmyfBZJwcja6uRNgei+kmJz+XZAjvrdk5VINO+MXQsmZLss/FZK39IirErCANMMGKUmm9nLwQKFV8MYCYYBy/fp+9VlwqJrppaaE4p9L+3/pqUFpqMdigvvDk4G8qABy9FiuCctvC30D/pcQo2/ODHgZz2/4esd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723533; c=relaxed/simple;
	bh=94ASfQdngA4B/FDhpUs9AT3PKIxrWuW92WcEVJ51iVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rG+7hA4QIZcYqULfOcVY60r2RoXNTWxQgjJ0IBTHqZli9GBrs3GgThrfcml35WIEo3DE32nwU9qEeAbvAH8ahf+YNHy9UQx+XSPTntMmh8nYvmWsOSqvmj1+GOZzWhL33UAanX4tlZd3tcmRBxIpfARBTJ+njC6Piv+JnP2Px5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxRvCHLh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxRvCHLh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b2d3a9e149so21176405ad.1
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723531; x=1777328331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVwnEZFCfioMImaD4omcTFgfi5snVGdeuNxjvfZmrIQ=;
        b=nxRvCHLhB15OeMQpf59i+VVaa4WhCKbphSXkdATX/Y+IEW/ZlhlrBUNWqeCJ3arDz9
         2rXdnArZBVI7Sv3xgExV/4FvcBRfKZCp338enNZkQaovAcjerGuGfVJ58HhsGVYD9jbH
         9piHdg2w8VqLHdXz7aDcWUuc4GqimoGj9B27Dmim6qcMWdyy8rGYjHhJSIYWhNzKbU3P
         zY+TDjwgECwbTA3E5bBnjD5K7gyDI2wp/bOqu6kHQ6Av0/tl0JknK0h2CHmb7JkyJlly
         MxETscjLOkjoOz6/iJD8RVUhA/9ibUgXAybhyOy36ekIeDlslUM2/HWpTipnf1/+x5et
         ofpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723531; x=1777328331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rVwnEZFCfioMImaD4omcTFgfi5snVGdeuNxjvfZmrIQ=;
        b=rt8/bTkTUNMhs6ci6NaEewsBIBJxNudiZxFF7/MKuWNSWulwgRZ0wHVH2UNbN9TnnU
         Jdxa2CoZOfY1CIW9UnPVsWOXCTZ5rL011R0YI0lf+k0WyYSqfXos9b7LjgKXp2ZkJHzc
         FYbPgPnXZjc+MZ/JvNgcGA/GpQRTyQsxvM4F7LInoVuU4guJbSvbKhfKriYG9/Llupjd
         PHnc12fOWADK2exLOCALM9ytHYA8OLqk0rsYTesGvimdnxFZs+mvveXuhNWp4dN68GcT
         NGsTd1IwFLOGK674toxqfVS5EGsoxrHxWXTpahjp8XZ9Oa7YD5rekRD8e+uHEsbkfSot
         zQyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/poDfK+74xU15M2vxUT1316qOrc+AE1UNR3oD+K2YyoDXzaFkAGFddacs4kBbI7gYe4vK1qLcGM0be@lists.linux.dev
X-Gm-Message-State: AOJu0YyRZw/xwvFQeoDZJLVNJbWFyNakiMUoa4s++QzZHfoQkr0i8P57
	zKG2aP0MtXKq7Ug0+DmPqiq2o1ByB64YdzRhxGLcSkpt+WBgj08mUo9T
X-Gm-Gg: AeBDiesJ9WNpvYfcY37lYBLhaPrTOGgqzScrc+5n00p8uwAeblkoPyjwlGwBEAoSmqr
	ofgQJ/Vh2WE+6F5LWOjLejoPuxFYXgcH4Wk2ECRUiUV4FwBA75aVq6TTSj4h5tsj5yD0zHF2Y+d
	7yqhkzRWn2mIq1RVFytjBeLTkkAiMh043NV9zQILl/dt277+wgG5jsY1H0dtbLJ5qFqxc8SHiM9
	iHrMm92OY8Zu9YX5I6c7L8FdA4+xkKmfR6UdN9FpkLyR3fS1vpAgHFlmdLyYDlraO0WguNWaApK
	r2g7gzmfrjvJ3F0DOdpTvx1JAhBmLif/RUnaT8ZzWUX0Ct1/dogbjRQozkoyDPQWvZV+RwnwxaC
	c74WTHE6tjjKK5fEmmaVlMZXC5WFaRl77jD1cZy23lmpU+cQzJesVtEq7IshGFTdNQ/4M+dRg6D
	28KeVcm36k8x34tXVFjBq1ny1TUCtm
X-Received: by 2002:a17:903:1987:b0:2b2:53f5:461f with SMTP id d9443c01a7336-2b5f9ed5153mr137891785ad.25.1776723531092;
        Mon, 20 Apr 2026 15:18:51 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:41::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3bd2bsm119510115ad.74.2026.04.20.15.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:50 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 11/17] fuse: add passthrough lookup
Date: Mon, 20 Apr 2026 15:16:31 -0700
Message-ID: <20260420221637.2631478-12-joannelkoong@gmail.com>
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

Use the new/extended struct fuse_entry2_out for lookups. If a backing id
is set, associate the fuse inode with the backing inode that should be
used for passthrough operations.

If no backing id was set, cache the statx attributes from the reply.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 92 +++++++++++++++++++++++++++++++--------------------
 1 file changed, 57 insertions(+), 35 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 0eacfef52164..9e9b77942dcd 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -354,29 +354,10 @@ static void fuse_invalidate_entry(struct dentry *entry)
 	fuse_invalidate_entry_cache(entry);
 }
 
-static void fuse_lookup_init_simple(struct fuse_args *args, u64 nodeid,
-				    const struct qstr *name,
-				    struct fuse_entry_out *outarg)
-{
-	memset(outarg, 0, sizeof(struct fuse_entry_out));
-	args->opcode = FUSE_LOOKUP;
-	args->nodeid = nodeid;
-	args->in_numargs = 3;
-	fuse_set_zero_arg0(args);
-	args->in_args[1].size = name->len;
-	args->in_args[1].value = name->name;
-	args->in_args[2].size = 1;
-	args->in_args[2].value = "";
-	args->out_numargs = 1;
-	args->out_args[0].size = sizeof(struct fuse_entry_out);
-	args->out_args[0].value = outarg;
-}
-
-static __maybe_unused void fuse_lookup_init(struct fuse_conn *fc,
-					    struct fuse_args *args,
-					    u64 nodeid, const struct qstr *name,
-					    struct fuse_entry_out *outarg,
-					    struct fuse_entry2_out *outarg2)
+static void fuse_lookup_init(struct fuse_conn *fc, struct fuse_args *args,
+			     u64 nodeid, const struct qstr *name,
+			     struct fuse_entry_out *outarg,
+			     struct fuse_entry2_out *outarg2)
 {
 	bool use_entry2 = fuse_use_entry2(fc);
 
@@ -437,10 +418,10 @@ static void fuse_entry2_to_entry(struct fuse_entry2_out *outarg2,
 	fuse_statx_to_attr(&outarg2->statx, &outarg->attr);
 }
 
-static __maybe_unused int fuse_process_entry2(struct fuse_conn *fc,
-					      struct fuse_entry2_out *outarg2,
-					      struct fuse_entry_out *outarg,
-					      struct fuse_statx **sxp)
+static int fuse_process_entry2(struct fuse_conn *fc,
+			       struct fuse_entry2_out *outarg2,
+			       struct fuse_entry_out *outarg,
+			       struct fuse_statx **sxp)
 {
 	if (!fuse_use_entry2(fc))
 		return 0;
@@ -489,9 +470,12 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 	else if (time_before64(fuse_dentry_time(entry), get_jiffies_64()) ||
 		 (flags & (LOOKUP_EXCL | LOOKUP_REVAL | LOOKUP_RENAME_TARGET))) {
 		struct fuse_entry_out outarg;
+		struct fuse_entry2_out outarg2;
+		struct fuse_statx *sx = NULL;
 		FUSE_ARGS(args);
 		struct fuse_forget_link *forget;
 		u64 attr_version;
+		int backing_id = 0;
 
 		/* For negative dentries, always do a fresh lookup */
 		if (!inode)
@@ -510,11 +494,21 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 
 		attr_version = fuse_get_attr_version(fm->fc);
 
-		fuse_lookup_init_simple(&args, get_node_id(dir), name, &outarg);
+		fuse_lookup_init(fc, &args, get_node_id(dir), name, &outarg,
+				 &outarg2);
 		ret = fuse_simple_request(fm, &args);
-		/* Zero nodeid is same as -ENOENT */
-		if (!ret && !outarg.nodeid)
-			ret = -ENOENT;
+		if (!ret) {
+			backing_id = fuse_process_entry2(fm->fc, &outarg2, &outarg, &sx);
+
+			/* Zero nodeid is same as -ENOENT */
+			if (!outarg.nodeid)
+				ret = -ENOENT;
+			else if (backing_id < 0) {
+				fuse_queue_forget(fm->fc, forget,
+						  outarg.nodeid, 1);
+				return backing_id;
+			}
+		}
 		if (!ret) {
 			fi = get_fuse_inode(inode);
 			if (outarg.nodeid != get_node_id(inode) ||
@@ -523,6 +517,14 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 						  outarg.nodeid, 1);
 				goto invalid;
 			}
+			if (backing_id) {
+				ret = fuse_inode_set_passthrough(inode, backing_id);
+				if (ret) {
+					fuse_queue_forget(fm->fc, forget,
+							  outarg.nodeid, 1);
+					return ret;
+				}
+			}
 			spin_lock(&fi->lock);
 			fi->nlookup++;
 			spin_unlock(&fi->lock);
@@ -535,7 +537,7 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 			goto invalid;
 
 		forget_all_cached_acls(inode);
-		fuse_change_attributes(inode, &outarg.attr, NULL,
+		fuse_change_attributes(inode, &outarg.attr, sx,
 				       ATTR_TIMEOUT(&outarg),
 				       attr_version);
 		fuse_change_entry_timeout(entry, &outarg);
@@ -644,9 +646,12 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 		     struct fuse_entry_out *outarg, struct inode **inode)
 {
 	struct fuse_mount *fm = get_fuse_mount_super(sb);
+	struct fuse_entry2_out outarg2;
 	FUSE_ARGS(args);
 	struct fuse_forget_link *forget;
 	u64 attr_version, evict_ctr;
+	struct fuse_statx *sx = NULL;
+	int backing_id;
 	int err;
 
 	*inode = NULL;
@@ -663,11 +668,20 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 	attr_version = fuse_get_attr_version(fm->fc);
 	evict_ctr = fuse_get_evict_ctr(fm->fc);
 
-	fuse_lookup_init_simple(&args, nodeid, name, outarg);
+	fuse_lookup_init(fm->fc, &args, nodeid, name, outarg, &outarg2);
 	err = fuse_simple_request(fm, &args);
+	if (err)
+		goto out_put_forget;
+
+	backing_id = fuse_process_entry2(fm->fc, &outarg2, outarg, &sx);
+
 	/* Zero nodeid is same as -ENOENT, but with valid timeout */
-	if (err || !outarg->nodeid)
+	if (!outarg->nodeid)
 		goto out_put_forget;
+	if (backing_id < 0) {
+		fuse_queue_forget(fm->fc, forget, outarg->nodeid, 1);
+		return backing_id;
+	}
 
 	err = -EIO;
 	if (fuse_invalid_attr(&outarg->attr))
@@ -678,7 +692,7 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 	}
 
 	*inode = fuse_iget(sb, outarg->nodeid, outarg->generation,
-			   &outarg->attr, NULL, ATTR_TIMEOUT(outarg),
+			   &outarg->attr, sx, ATTR_TIMEOUT(outarg),
 			   attr_version, evict_ctr);
 	err = -ENOMEM;
 	if (!*inode) {
@@ -687,6 +701,14 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 	}
 	err = 0;
 
+	if (backing_id) {
+		err = fuse_inode_set_passthrough(*inode, backing_id);
+		if (err) {
+			iput(*inode);
+			*inode = NULL;
+		}
+	}
+
  out_put_forget:
 	kfree(forget);
  out:
-- 
2.52.0

