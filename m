Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=50.112.246.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041742;
	b=TJoi9MEFhKL1saoUdLPrWs92J5+bMXfm82B8zqI9t1ULwkCGrAJN6qLDGsRSe0ncIOxe
	 IfRA6eZ6TlnQ2HxN1Ju1bE4BTuY9YwevG12ZChPqUDZ67T7y6scBlglOZ5qCE1q5RzHUs
	 +2opbzUGCyJhfsVrttBw0FOQT7YQAEz6C6qX00Vahynw1BDxTtZPk+26PLl3WTTcVXCHK
	 nKK/WCHMPHrsQlLsjE4D/2gE4viaetsK0G4gTQt9eFjgH2QZNX5mHLWEsZAA0ar+jkkvV
	 vVoe3piTpsBJKPG4Jx2HKdYUbZ23bWICROVTOAAVGf12HRdY/P6r455Xy54X0NaFiLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041742;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=zV7sS6c5FvjLnO1Kkbi3ti+kteLUm8IW/GYPET5Swek=;
	b=ccmBW8R7i41kokFqllSPajMSa1cgvWHYY4dRh1aPgaSqrseeX71c4nJJOVKaR6jcYPtL
	 0BlqrS8gghVzuQOPMc0zYlkC4e5JVipDKkmo6Ekbr1JG7hKH7veD37ftQ6J6eKg3vksaW
	 9HhRki45+EgvGd+jfTEBc5688x2Ln5BZ3bU872GDgjcqjM3W53R5J6cb+4jAoWUfZYXLs
	 bi+a5lN4DGEBxRU/o6Sn7baDD14mSmsbCz187Tf7R6jDUJ9GbemZ38Z9UUVY515Vg6pTS
	 p+NG1p/PmS3BWiz/ADtPtmjsV7eVP4NxuNkNO94WzRRTGMfXeQvKtOYU+Efiuje+PGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=pp0drBPd;
	arc=none smtp.remote-ip=50.112.246.219
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F125606A320
	for <fuse-devel@lists.linux.dev>; Mon, 26 Oct 2026 19:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F125606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=pp0drBPd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793041741; x=1824577741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zV7sS6c5FvjLnO1Kkbi3ti+kteLUm8IW/GYPET5Swek=;
  b=pp0drBPdTRPD4H33RGDldxcJDWdbNzmfCjOhfp4t1UPFa5YQR9/RxVRX
   d2NHU2eVmLk4zivibPOnA64b6D3E2t+nTBDNjZxX4qCDGO08mDcWQr30L
   D76lq8SKHKFh7iLnEBgXl6FoGqHn51+lWWmsuE2XiAD787cMghppHW38S
   9ZgzGsv/k+sTYP9zGSJD6lwNqsitAByPJqlNabWX/mP3nXMfinOWoKEl/
   ZaG3RjJJgX1Un3XYv0ybvLZX7iDcju7w1VjRX7KfGseVOU4rhCYWzjUB3
   t5fcph+NHlVl8m/zx950L5+zEgJwgWwAkDZwbRZtcdXiKvTii2I6BXBqs
   A==;
X-CSE-ConnectionGUID: QUkTu2GnSCqYisOvvxAEvA==
X-CSE-MsgGUID: +mv88h3TQbWUGY8I2VNTzA==
X-IronPort-AV: E=Sophos;i="6.27,180,1787011200"; 
   d="scan'208";a="32062664"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 19:09:01 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:2569]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.97:2525] with esmtp (Farcaster)
 id f11e87af-900d-4a29-abbf-ad9ce222df63; Mon, 26 Oct 2026 19:09:00 +0000 (UTC)
X-Farcaster-Flow-ID: f11e87af-900d-4a29-abbf-ad9ce222df63
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 19:09:00 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 19:08:59 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v3 2/3] fuse: open cached files with FUSE_OPEN_ATOMIC
Date: Mon, 26 Oct 2026 19:07:46 +0000
Message-ID: <20261026190747.2373775-3-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261026190747.2373775-1-jamz@amazon.com>
References: <20261026190747.2373775-1-jamz@amazon.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA003.ant.amazon.com (10.13.139.47) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

When the server implements FUSE_OPEN_ATOMIC, skip LOOKUP for a
regular file being opened, opening it by name from fuse_open() instead.
If the name now refers to a different file or to nothing, drop the
dentry and return -EOPENSTALE, so that the VFS looks the name up again.
A matching reply refreshes the attributes and the entry timeout.

Only an open that skipped the LOOKUP checks the name. Other opens of the
file, such as through /proc/self/fd, open the cached inode as before.
Directory opens keep the LOOKUP. With default_permissions, may_open()
checks the cached attributes before fuse_open(), so the LOOKUP is
skipped only while they are valid, and fuse_open() checks the open
again against the attributes in the reply.

If the server replies -ENOSYS, fuse_open() sends the skipped LOOKUP
itself.

Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c    | 303 ++++++++++++++++++++++++++++++++++++++++-------
 fs/fuse/file.c   |   4 +-
 fs/fuse/fuse_i.h |   1 +
 3 files changed, 264 insertions(+), 44 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 30cd42247dd4d..ac04e24ea73f5 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -97,6 +97,7 @@ static void fuse_advise_use_readdirplus(struct inode *dir)
 struct fuse_dentry {
 	u64 time;
 	u64 epoch;
+	unsigned long flags;
 	union {
 		struct rcu_head rcu;
 		struct rb_node node;
@@ -104,6 +105,12 @@ struct fuse_dentry {
 	struct dentry *dentry;
 };
 
+/* fuse_dentry flags */
+enum {
+	/* An open skipped LOOKUP, so fuse_open() checks the name */
+	FUSE_D_OPEN_REVAL,
+};
+
 static void __fuse_dentry_tree_del_node(struct fuse_dentry *fd,
 					struct dentry_bucket *bucket)
 {
@@ -379,6 +386,82 @@ static void fuse_lookup_init(struct fuse_args *args, u64 nodeid,
 	args->out_args[0].value = outarg;
 }
 
+/*
+ * Look the name of @entry up again.  Returns 1 if it still refers to the
+ * inode of @entry, refreshing its attributes and entry timeout, 0 if it does
+ * not, or -ENOMEM / -EINTR.
+ */
+static int fuse_revalidate_lookup(struct inode *dir, const struct qstr *name,
+				  struct dentry *entry)
+{
+	struct inode *inode = d_inode(entry);
+	struct fuse_mount *fm = get_fuse_mount(inode);
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct fuse_entry_out outarg;
+	FUSE_ARGS(args);
+	struct fuse_forget_link *forget;
+	u64 attr_version;
+	int ret;
+
+	forget = fuse_alloc_forget();
+	if (!forget)
+		return -ENOMEM;
+
+	attr_version = fuse_get_attr_version(fm->fc);
+
+	fuse_lookup_init(&args, get_node_id(dir), name, &outarg);
+	ret = fuse_simple_request(fm, &args);
+	/* Zero nodeid is same as -ENOENT */
+	if (!ret && !outarg.nodeid)
+		ret = -ENOENT;
+	if (!ret) {
+		if (outarg.nodeid != get_node_id(inode) ||
+		    (bool) IS_AUTOMOUNT(inode) != (bool) (outarg.attr.flags & FUSE_ATTR_SUBMOUNT)) {
+			fuse_chan_queue_forget(fm->fc->chan, forget,
+					       outarg.nodeid, 1);
+			return 0;
+		}
+		spin_lock(&fi->lock);
+		fi->nlookup++;
+		spin_unlock(&fi->lock);
+	}
+	kfree(forget);
+	if (ret == -ENOMEM || ret == -EINTR)
+		return ret;
+	if (ret || fuse_invalid_attr(&outarg.attr) ||
+	    fuse_stale_inode(inode, outarg.generation, &outarg.attr))
+		return 0;
+
+	forget_all_cached_acls(inode);
+	fuse_change_attributes(inode, &outarg.attr, NULL,
+			       ATTR_TIMEOUT(&outarg),
+			       attr_version);
+	fuse_change_entry_timeout(entry, &outarg);
+	return 1;
+}
+
+/*
+ * An open of a regular file whose entry expired leaves the LOOKUP to
+ * fuse_open_revalidate().  With default_permissions, may_open() checks the
+ * cached attributes first, so they must still be valid.
+ */
+static bool fuse_open_skips_lookup(struct fuse_conn *fc, struct dentry *entry,
+				   struct inode *inode, unsigned int flags)
+{
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	u32 perm_mask = STATX_MODE | STATX_UID | STATX_GID;
+
+	if (fc->no_open_atomic || !(flags & LOOKUP_OPEN) ||
+	    (flags & (LOOKUP_EXCL | LOOKUP_REVAL | LOOKUP_RENAME_TARGET |
+		      LOOKUP_DIRECTORY)) ||
+	    !S_ISREG(inode->i_mode) || d_mountpoint(entry))
+		return false;
+
+	return !fc->default_permissions ||
+	       (!(perm_mask & READ_ONCE(fi->inval_mask)) &&
+		!time_before64(fi->i_time, get_jiffies_64()));
+}
+
 /*
  * Check whether the dentry is still valid
  *
@@ -392,7 +475,6 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 				  struct dentry *entry, unsigned int flags)
 {
 	struct inode *inode;
-	struct fuse_mount *fm;
 	struct fuse_conn *fc;
 	struct fuse_inode *fi;
 	struct fuse_dentry *fd = entry->d_fsdata;
@@ -407,57 +489,22 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 		goto invalid;
 	else if (time_before64(fuse_dentry_time(entry), get_jiffies_64()) ||
 		 (flags & (LOOKUP_EXCL | LOOKUP_REVAL | LOOKUP_RENAME_TARGET))) {
-		struct fuse_entry_out outarg;
-		FUSE_ARGS(args);
-		struct fuse_forget_link *forget;
-		u64 attr_version;
-
 		/* For negative dentries, always do a fresh lookup */
 		if (!inode)
 			goto invalid;
 
+		if (fuse_open_skips_lookup(fc, entry, inode, flags)) {
+			set_bit(FUSE_D_OPEN_REVAL, &fd->flags);
+			goto valid;
+		}
+
 		ret = -ECHILD;
 		if (flags & LOOKUP_RCU)
 			goto out;
 
-		fm = get_fuse_mount(inode);
-
-		forget = fuse_alloc_forget();
-		ret = -ENOMEM;
-		if (!forget)
+		ret = fuse_revalidate_lookup(dir, name, entry);
+		if (ret <= 0)
 			goto out;
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
-
-		forget_all_cached_acls(inode);
-		fuse_change_attributes(inode, &outarg.attr, NULL,
-				       ATTR_TIMEOUT(&outarg),
-				       attr_version);
-		fuse_change_entry_timeout(entry, &outarg);
 	} else if (inode) {
 		fi = get_fuse_inode(inode);
 		if (flags & LOOKUP_RCU) {
@@ -467,6 +514,7 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 			fuse_advise_use_readdirplus(dir);
 		}
 	}
+valid:
 	ret = 1;
 out:
 	return ret;
@@ -1051,6 +1099,175 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	return err;
 }
 
+/*
+ * Open a regular file whose LOOKUP fuse_dentry_revalidate() skipped with
+ * FUSE_OPEN_ATOMIC, which revalidates the name in the same request.  Returns
+ * 1 if the file still needs FUSE_OPEN, or -EOPENSTALE if the name no longer
+ * refers to it.
+ *
+ * The flag is per dentry, so a concurrent open that did not look the name up
+ * (e.g. through /proc/self/fd) can take it from an open that did.  The latter
+ * then opens the cached inode, as for an entry that has not expired.
+ */
+int fuse_open_revalidate(struct file *file)
+{
+	struct dentry *entry = file->f_path.dentry;
+	struct fuse_dentry *fd = entry->d_fsdata;
+	struct inode *inode = d_inode(entry);
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct fuse_mount *fm = get_fuse_mount(inode);
+	struct fuse_conn *fc = fm->fc;
+	FUSE_ARGS(args);
+	struct fuse_forget_link *forget;
+	struct fuse_create_in inarg;
+	struct fuse_entry_out outentry;
+	struct fuse_open_out *outopenp;
+	struct name_snapshot name;
+	struct dentry *parent;
+	struct fuse_file *ff;
+	u64 attr_version, time;
+	unsigned int seq;
+	int err;
+
+	if (!test_and_clear_bit(FUSE_D_OPEN_REVAL, &fd->flags))
+		return 1;
+	time = fuse_dentry_time(entry);
+	if (!time_before64(time, get_jiffies_64()))
+		return 1;
+
+	forget = fuse_alloc_forget();
+	if (!forget)
+		return -ENOMEM;
+	ff = fuse_file_alloc(fm, true);
+	if (!ff) {
+		kfree(forget);
+		return -ENOMEM;
+	}
+
+	do {
+		seq = read_seqbegin(&rename_lock);
+		parent = dget_parent(entry);
+		take_dentry_name_snapshot(&name, entry);
+		if (!read_seqretry(&rename_lock, seq))
+			break;
+		release_dentry_name_snapshot(&name);
+		dput(parent);
+	} while (1);
+
+	memset(&inarg, 0, sizeof(inarg));
+	memset(&outentry, 0, sizeof(outentry));
+	inarg.flags = file->f_flags & ~(O_CREAT | O_EXCL | O_NOCTTY);
+	inarg.mode = S_IFREG;
+	args.opcode = FUSE_OPEN_ATOMIC;
+	args.nodeid = get_node_id(d_inode(parent));
+	args.in_numargs = 2;
+	args.in_args[0].size = sizeof(inarg);
+	args.in_args[0].value = &inarg;
+	args.in_args[1].size = name.name.len + 1;
+	args.in_args[1].value = name.name.name;
+	args.out_numargs = 2;
+	args.out_args[0].size = sizeof(outentry);
+	args.out_args[0].value = &outentry;
+	outopenp = &ff->args->open_outarg;
+	args.out_args[1].size = sizeof(*outopenp);
+	args.out_args[1].value = outopenp;
+	args.out_argvar = true;
+
+	attr_version = fuse_get_attr_version(fc);
+	err = fc->no_open_atomic ? -ENOSYS : fuse_simple_request(fm, &args);
+	if (err == -ENOSYS) {
+		/* d_revalidate() skipped the LOOKUP, so send it here */
+		fc->no_open_atomic = 1;
+		err = fuse_revalidate_lookup(d_inode(parent), &name.name,
+					     entry);
+		if (!err) {
+			d_drop(entry);
+			err = -EOPENSTALE;
+		} else if (err > 0 && fc->default_permissions) {
+			err = fuse_may_open(file, inode) ?: 1;
+		}
+		release_dentry_name_snapshot(&name);
+		dput(parent);
+		fuse_file_free(ff);
+		kfree(forget);
+		return err;
+	}
+	release_dentry_name_snapshot(&name);
+	dput(parent);
+
+	if (err == -ENOENT) {
+		d_drop(entry);
+		err = -EOPENSTALE;
+	}
+	if (err < 0)
+		goto out_free;
+
+	if (args.out_args[1].size) {
+		ff->fh = outopenp->fh;
+		ff->nodeid = outentry.nodeid;
+	}
+
+	/* The retry looks the name up again */
+	err = -EOPENSTALE;
+	if (outentry.nodeid != get_node_id(inode) ||
+	    fuse_invalid_attr(&outentry.attr) ||
+	    fuse_stale_inode(inode, outentry.generation, &outentry.attr)) {
+		d_drop(entry);
+		goto out_release;
+	}
+
+	/* Only O_CREAT creates; O_TRUNC leaves the file unopened */
+	err = -EIO;
+	if (args.out_args[1].size &&
+	    (args.out_args[1].size < FUSE_COMPAT_OPEN_OUT_SIZE ||
+	     (outopenp->open_flags & FOPEN_CREATED) ||
+	     (file->f_flags & O_TRUNC)))
+		goto out_release;
+
+	spin_lock(&fi->lock);
+	fi->nlookup++;
+	spin_unlock(&fi->lock);
+	kfree(forget);
+	forget_all_cached_acls(inode);
+	fuse_change_attributes(inode, &outentry.attr, NULL,
+			       ATTR_TIMEOUT(&outentry), attr_version);
+	/* Keep an invalidation that raced with the request */
+	if (fuse_dentry_time(entry) == time)
+		fuse_change_entry_timeout(entry, &outentry);
+
+	/* may_open() checked the attributes from before the request */
+	err = 0;
+	if (fc->default_permissions)
+		err = fuse_may_open(file, inode);
+	if (!args.out_args[1].size) {
+		fuse_file_free(ff);
+		return err ?: 1;
+	}
+	if (err) {
+		fuse_sync_release(fi, ff, file->f_flags);
+		return err;
+	}
+	ff->open_flags = outopenp->open_flags;
+	file->private_data = ff;
+	return 0;
+
+out_release:
+	if (args.out_args[1].size)
+		fuse_sync_release(NULL, ff, file->f_flags);
+	else
+		fuse_file_free(ff);
+	if (outentry.nodeid)
+		fuse_chan_queue_forget(fc->chan, forget, outentry.nodeid, 1);
+	else
+		kfree(forget);
+	return err;
+
+out_free:
+	fuse_file_free(ff);
+	kfree(forget);
+	return err;
+}
+
 static int fuse_mknod(struct mnt_idmap *, struct inode *, struct dentry *,
 		      umode_t, dev_t);
 static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index eb5ae11b6010c..a79aec76ecbea 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -286,7 +286,9 @@ static int fuse_open(struct inode *inode, struct file *file)
 	if (is_wb_truncate || vdax_truncate)
 		fuse_set_nowrite(inode);
 
-	err = fuse_do_open(fm, get_node_id(inode), file, false);
+	err = fuse_open_revalidate(file);
+	if (err > 0)
+		err = fuse_do_open(fm, get_node_id(inode), file, false);
 	if (!err) {
 		ff = file->private_data;
 		err = fuse_finish_open(inode, file);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 0c7874c5da72b..7ff13ebcb9c83 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -994,6 +994,7 @@ void fuse_read_args_fill(struct fuse_io_args *ia, struct file *file, loff_t pos,
 struct fuse_file *fuse_file_alloc(struct fuse_mount *fm, bool release);
 void fuse_file_free(struct fuse_file *ff);
 int fuse_finish_open(struct inode *inode, struct file *file);
+int fuse_open_revalidate(struct file *file);
 
 void fuse_sync_release(struct fuse_inode *fi, struct fuse_file *ff,
 		       unsigned int flags);
-- 
2.50.1

