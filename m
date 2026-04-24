Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E4919D89E
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993482; cv=none; b=WeilOKufUpEO2q/MXvR6ws9GqGMeCybZL8w6sgR29DG5NUNpPVRliOV5sOGObUbVMtunNDiASV7L94dyAYv36g/Haq72X9+1VCJJv8FWPpHg32XzxSKeQgpilYT94DmCBWQRCv6LbOCqHqbtEaSIcUuyEkr0iwk5WQwVfOO/F68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993482; c=relaxed/simple;
	bh=dKL1bvODiFCeoKN7OSTEhDmUlQs/IZH1DhbdbZ2r5G4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqVE4mjB37GQbtN61csZkiYeKVd0gQ3xGWt6NMVTJpK9sD5ARtTVrroW88SU+B6CRR7OStybwdmHFqXL0nkGUVRNPbfbHoDkgXeLDJoyV+gwW0/3EnygObofcJXTMTRYccbwxI/yZNSX5R0P0xYNIMHXC+1NUkizt6woHch4bCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgV95u2b; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgV95u2b"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso6530341a91.3
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 18:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776993481; x=1777598281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ge6GjMEgejdAM21fnHzDONS/la3wW2mz5eibJS8maJ0=;
        b=pgV95u2b34h5Z0NQU0i+CI2YcHeVd2l7Cgtjpk0Z6ffF/JP9lhCxkUAkO2A07z3bNS
         GE44vsg795Voqgi8GGE0j3RyBjNfDH7O1KjgN/2IF8cI/ENHhnd+L2AZXG6eN2VDB2Xy
         C4MH7JcDtRE/peU/zT98CKxv3a3LDG1RWXVY6jzxwfmb4hzu5/mMggK3hPgFcOYcD+v9
         44cuCie9XMKO9BX52kzLd2hhMJFc+30UA3DN6weaP+JjNcO7pGcO3wZDHK+PcyspBa3e
         WUfzY7L/b2MyPljVz3Ek0zYwN24jZNi8u7ezul0Wx7ybf+AvC2dXcvO3Oz5iTDbJiIIE
         QLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776993481; x=1777598281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ge6GjMEgejdAM21fnHzDONS/la3wW2mz5eibJS8maJ0=;
        b=WwEx/UwzkgdCdgmiwe/Y3lyo5/dEfswo6H0ESKyl+yVmz+pjVJrWgh1xB2TlD08YHr
         tQCpLYbj05EhBhPvwt6DJ6p6V0hWtzVXDk53d57c0yzcdnNAHEDr1+jTW5rZPqs/VW8x
         /hiiXxdQbENra5Unc9uVkwutiaiMp44E84c6PEaoTEt0p3guJqWEwf+OoeSs6+yIdpLS
         a9jSbE2uw10TNkJr7hnK0vF4Cf/oWcs+6qIJNMxe/sxaJxHx8qMgEXOHInoHB9T/XJxM
         BEis4/JP/mBaB5+vb+Mj6sZWNnpKc/TNsj7/+1SeHxnfgxI2gJ+DatF96bLAlxR7+KTA
         i3Ag==
X-Forwarded-Encrypted: i=1; AFNElJ/fUsnmcSG73SOXwinNaXSZTFC7v2J8Wl/e91EvJvdlA0iUNHThunYeyT42/JKAeEfL+PooRHbnqNhL@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4gmDlM8LuWOyAtsuAm0uvlADUmjdKewmDBkmW2SeVEhKpXFkO
	62ozGveOPNt8ztq+UGIjsdTpBRjEMfxo5JXRIqx2ipw7JCrA77JFm7bJ+j4aLw==
X-Gm-Gg: AeBDievZ55E9QkhJtYHYJak7UhK9AlfhS3phGYoQ0266OnDdtZtHGIXAKQ8di0vNg0U
	hcqvcy6CG2fJq7Y594beHDKUjezbWt/7irqGhc3miFTSrkFJE5qsjW+647PU2Sfd2SWcnnGLRRD
	EQlFta2FGfw40R/OICDbP4tSl057HuhXxI6qPz4u75tsWQ8CMuaT2RZbtTSWBeoWTDk12837HkZ
	VzfDrP4uJ465KHk7r1JatN+BToyLsepRDOD4XIxE7k3ATzqzXvtjVO1caqRc+oxdJ+MmU6CoeM0
	HcLdn/e6XLrj40iqCQIzQEAy/SWm9zvFl7DwYjz5RwPqt7L6oizx6uzNRlf7ETGzLT3qz6261G3
	cDX4BhLU7c/8WCugZKXoliwWQzTL3580DfC+V/Z+oqsk0e2Nq4P5aud/MqSCHlNG5Ggt2WnO3PC
	tZoNe8j2JI7tSjyFP0v6bo4WVE
X-Received: by 2002:a17:90a:dfd0:b0:35b:e5cf:20fc with SMTP id 98e67ed59e1d1-361404b25f2mr29944119a91.26.1776993481121;
        Thu, 23 Apr 2026 18:18:01 -0700 (PDT)
Received: from localhost ([2a03:2880:ff::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614189343esm21247787a91.6.2026.04.23.18.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:18:00 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Cc: Amir Goldstein <amir73il@gmail.com>
Subject: [PATCH v1 04/13] fuse: clean up fuse_dentry_revalidate()
Date: Thu, 23 Apr 2026 18:16:37 -0700
Message-ID: <20260424011646.457682-5-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260424011646.457682-1-joannelkoong@gmail.com>
References: <20260424011646.457682-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove gotos with direct returns and flatten nested if/else structure.
No functional changes.

Suggested-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Cc: Amir Goldstein <amir73il@gmail.com>
---
 fs/fuse/dir.c | 114 ++++++++++++++++++++++++--------------------------
 1 file changed, 54 insertions(+), 60 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 112d979c49c5..c5b3cb001147 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -386,72 +386,32 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 				  struct dentry *entry, unsigned int flags)
 {
 	struct inode *inode;
-	struct fuse_mount *fm;
 	struct fuse_conn *fc;
 	struct fuse_inode *fi;
+	struct fuse_entry_out outarg;
+	struct fuse_forget_link *forget;
+	FUSE_ARGS(args);
+	bool automount_changed;
+	u64 attr_version;
+	bool need_reval;
 	int ret;
 
 	fc = get_fuse_conn_super(dir->i_sb);
 	if (entry->d_time < atomic_read(&fc->epoch))
-		goto invalid;
+		return 0;
 
 	inode = d_inode_rcu(entry);
 	if (inode && fuse_is_bad(inode))
-		goto invalid;
-	else if (time_before64(fuse_dentry_time(entry), get_jiffies_64()) ||
-		 (flags & (LOOKUP_EXCL | LOOKUP_REVAL | LOOKUP_RENAME_TARGET))) {
-		struct fuse_entry_out outarg;
-		FUSE_ARGS(args);
-		struct fuse_forget_link *forget;
-		u64 attr_version;
-
-		/* For negative dentries, always do a fresh lookup */
-		if (!inode)
-			goto invalid;
-
-		ret = -ECHILD;
-		if (flags & LOOKUP_RCU)
-			goto out;
+		return 0;
 
-		fm = get_fuse_mount(inode);
+	need_reval = time_before64(fuse_dentry_time(entry), get_jiffies_64()) ||
+		 (flags & (LOOKUP_EXCL | LOOKUP_REVAL | LOOKUP_RENAME_TARGET));
 
-		forget = fuse_alloc_forget();
-		ret = -ENOMEM;
-		if (!forget)
-			goto out;
-
-		attr_version = fuse_get_attr_version(fm->fc);
-
-		fuse_lookup_init(&args, get_node_id(dir), name, &outarg);
-		ret = fuse_simple_request(fm, &args);
-		/* Zero nodeid is same as -ENOENT */
-		if (!ret && !outarg.nodeid)
-			ret = -ENOENT;
-		if (!ret) {
-			fi = get_fuse_inode(inode);
-			if (outarg.nodeid != get_node_id(inode) ||
-			    (bool) IS_AUTOMOUNT(inode) != (bool) (outarg.attr.flags & FUSE_ATTR_SUBMOUNT)) {
-				fuse_chan_queue_forget(fm->fc->chan, forget,
-						  outarg.nodeid, 1);
-				goto invalid;
-			}
-			spin_lock(&fi->lock);
-			fi->nlookup++;
-			spin_unlock(&fi->lock);
-		}
-		kfree(forget);
-		if (ret == -ENOMEM || ret == -EINTR)
-			goto out;
-		if (ret || fuse_invalid_attr(&outarg.attr) ||
-		    fuse_stale_inode(inode, outarg.generation, &outarg.attr))
-			goto invalid;
+	/* For negative dentries that need revalidation, always do a fresh lookup */
+	if (!inode)
+		return need_reval ? 0 : 1;
 
-		forget_all_cached_acls(inode);
-		fuse_change_attributes(inode, &outarg.attr, NULL,
-				       ATTR_TIMEOUT(&outarg),
-				       attr_version);
-		fuse_change_entry_timeout(entry, &outarg);
-	} else if (inode) {
+	if (!need_reval) {
 		fi = get_fuse_inode(inode);
 		if (flags & LOOKUP_RCU) {
 			if (test_bit(FUSE_I_INIT_RDPLUS, &fi->state))
@@ -459,14 +419,48 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 		} else if (test_and_clear_bit(FUSE_I_INIT_RDPLUS, &fi->state)) {
 			fuse_advise_use_readdirplus(dir);
 		}
+
+		return 1;
 	}
-	ret = 1;
-out:
-	return ret;
 
-invalid:
-	ret = 0;
-	goto out;
+	if (flags & LOOKUP_RCU)
+		return -ECHILD;
+
+	forget = fuse_alloc_forget();
+	if (!forget)
+		return -ENOMEM;
+
+	attr_version = fuse_get_attr_version(fc);
+
+	fuse_lookup_init(&args, get_node_id(dir), name, &outarg);
+	ret = fuse_simple_request(get_fuse_mount(inode), &args);
+	if (ret || !outarg.nodeid) {
+		kfree(forget);
+		return (ret == -ENOMEM || ret == -EINTR) ? ret : 0;
+	}
+
+	automount_changed =
+		!!IS_AUTOMOUNT(inode) != !!(outarg.attr.flags & FUSE_ATTR_SUBMOUNT);
+
+	if (outarg.nodeid != get_node_id(inode) || automount_changed) {
+		fuse_chan_queue_forget(fc->chan, forget, outarg.nodeid, 1);
+		return 0;
+	}
+	fi = get_fuse_inode(inode);
+	spin_lock(&fi->lock);
+	fi->nlookup++;
+	spin_unlock(&fi->lock);
+
+	kfree(forget);
+	if (fuse_invalid_attr(&outarg.attr) ||
+	    fuse_stale_inode(inode, outarg.generation, &outarg.attr))
+		return 0;
+
+	forget_all_cached_acls(inode);
+	fuse_change_attributes(inode, &outarg.attr, NULL, ATTR_TIMEOUT(&outarg),
+			       attr_version);
+	fuse_change_entry_timeout(entry, &outarg);
+	return 1;
 }
 
 static int fuse_dentry_init(struct dentry *dentry)
-- 
2.52.0

