Received: from smtp02-ext3.udag.de (smtp02-ext3.udag.de [62.146.106.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFE33CAA50
	for <fuse-devel@lists.linux.dev>; Thu,  4 Jun 2026 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566382; cv=none; b=KFyQEMIjaisNZl1q/tHOzexjIsEyfAJZq80HLXvynUxeJmkvuxyVVUyRgM/tUCMzyQLcmH+2APL0FMVZrziJ9uFgSAlKpnePOkN9eiiwiCQK6D2FL5iyWSAFcnr9kzZ/3yJMzCEE/UsacZsuHmmsjki9akbEiWBIrCWfY9Xugi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566382; c=relaxed/simple;
	bh=kIHUKYth3RzqAa0vIDE4cMpVXhNM2Sjv0ky32TSHgFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwCDIavq9RJMD+vqh8LR7O59LJelW+PZjCKnPLFWQfc4RLquAAD4kR2trEcbvvg5oiA8Q72Tg6sInh7+GQ2QArKlU1OYtjJEynqB58i7nGsr2nje056SdvKgZVubZoJ1dA/dtEDiZzfZj2eNwbXjedeZB8RviVhKejBoIKHqOnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.com; spf=pass smtp.mailfrom=birthelmer.com; dkim=pass (2048-bit key) header.d=birthelmer.com header.i=@birthelmer.com header.b=AQlCaDMq; arc=none smtp.client-ip=62.146.106.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birthelmer.com header.i=@birthelmer.com header.b="AQlCaDMq"
Received: from fedora.fritz.box (065-142-067-156.ip-addr.inexio.net [156.67.142.65])
	by smtp02-ext3.udag.de (Postfix) with ESMTPA id 47B29E05B9;
	Thu,  4 Jun 2026 11:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=birthelmer.com;
	s=uddkim-202310; t=1780566372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0wsDmLNEKGtXZ2Fte1h1PnQTp+arVSPfrZX5pkUEJo=;
	b=AQlCaDMq4+v7SlOHGUFYQ0sCgBiiZaaPr6aJmjQzWkUujzbjYIC8zGfajmpoPsedoxxwmI
	grxqRxAfVwQ6r/amb91enCjYiuWFHSuaeAhywlPJ9NERae9hPXqI/hG/JcxVwUpDYr6pFf
	jwklRfaq8w1ZfBwAoHMsS1LCTGrvFjNgCNV1oO+hcQtmf+g23bGLlLFaTadnkLg+SB8i4K
	RsYN2+T6FULVO58UVtrx+A6xCk+XbBT7GzQsABwHUtnqOg0nRFwQQ4IMpBKR4NpV2UaV1G
	FnY31Q87haMiLAlD1l7NLCUSHhSFzaLUdcrLB0xjIQIG74Y4I+8ld+LG7gwGdw==
Authentication-Results: smtp02-ext3.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.com
From: Horst Birthelmer <horst@birthelmer.com>
Date: Thu, 04 Jun 2026 11:45:45 +0200
Subject: [PATCH v7 4/4] fuse: add compound command for dentry revalidation
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-fuse-compounds-upstream-v7-4-27331d085c2a@ddn.com>
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
In-Reply-To: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
 Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>
Cc: linux-kernel@vger.kernel.org, fuse-devel@lists.linux.dev, 
 Horst Birthelmer <hbirthelmer@ddn.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780566367; l=4463;
 i=hbirthelmer@ddn.com; s=20251006; h=from:subject:message-id;
 bh=ubG6DBB8TVKI3rbqvPq0gS0kwZvdAusJXUsJwNp0rbY=;
 b=gaGjkQG8XtB7uWGo69938xL1O/syxl17L+yPeyvdaZ/Uv8Z9CmKOi3gPrvzZaISHF9r31LxTL
 EmN9oYhhotXC9Qd4PlcUjB5SOCi3FLWAJDVkdwMRCDIFttjClNk+QmD
X-Developer-Key: i=hbirthelmer@ddn.com; a=ed25519;
 pk=v3BVDFoy16EzgHZ23ObqW+kbpURtjrwxgKu8YNDKjGg=

From: Horst Birthelmer <hbirthelmer@ddn.com>

During dentry revalidation the compound LOOKUP+GETATTR
will save a round trip to user space.

Signed-off-by: Horst Birthelmer <hbirthelmer@ddn.com>
---
 fs/fuse/dir.c | 113 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 111 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index b3406c33abd2..99800e8ca895 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -372,6 +372,101 @@ static void fuse_lookup_init(struct fuse_args *args, u64 nodeid,
 	args->out_args[0].value = outarg;
 }
 
+/*
+ * Revalidate a dentry using a compound LOOKUP+GETATTR.  Saves a round
+ * trip when both the entry and the attributes need refreshing.
+ *
+ * Returns 1 if valid, 0 if the dentry should be invalidated, or a
+ * negative errno that the caller should propagate (only -ENOMEM /
+ * -EINTR; other errors are mapped to invalidate).
+ */
+static int fuse_dentry_revalidate_compound(struct inode *dir,
+					   const struct qstr *name,
+					   struct dentry *entry,
+					   struct inode *inode,
+					   struct fuse_mount *fm,
+					   u64 attr_version)
+{
+	struct fuse_entry_out lookup_out = {};
+	struct fuse_attr_out getattr_out = {};
+	struct fuse_getattr_in getattr_in = {};
+	struct fuse_args lookup_args = {};
+	struct fuse_args getattr_args = {};
+	struct fuse_forget_link *forget;
+	int lookup_err = 0, getattr_err = 0;
+	struct fuse_compound_op ops[2] = {
+		{ .arg = &lookup_args,  .error = &lookup_err,
+		  .dep_index = FUSE_COMPOUND_NO_DEP },
+		{ .arg = &getattr_args, .error = &getattr_err,
+		  .dep_index = 0 /* nodeid comes from lookup */ },
+	};
+	struct fuse_inode *fi;
+	int ret;
+
+	forget = fuse_alloc_forget();
+	if (!forget)
+		return -ENOMEM;
+
+	fuse_lookup_init(&lookup_args, get_node_id(dir), name, &lookup_out);
+	/* nodeid is filled from the lookup result before getattr is sent */
+	fuse_getattr_args_fill(&getattr_args, 0, &getattr_in, &getattr_out);
+
+	ret = fuse_compound_send(fm, ops, 2);
+	if (ret == -ENOMEM || ret == -EINTR)
+		goto out;
+	/*
+	 * The non-compound revalidate path propagates -ENOMEM / -EINTR
+	 * from the lookup to VFS instead of treating them as "invalidate
+	 * this dentry".  Keep that behaviour when the lookup ran inside
+	 * a compound: surface the per-subop error to the caller.
+	 */
+	if (lookup_err == -ENOMEM || lookup_err == -EINTR) {
+		ret = lookup_err;
+		goto out;
+	}
+	if (ret < 0 || lookup_err || !lookup_out.nodeid) {
+		ret = 0;
+		goto out;
+	}
+
+	fi = get_fuse_inode(inode);
+	if (lookup_out.nodeid != get_node_id(inode) ||
+	    (bool)IS_AUTOMOUNT(inode) != (bool)(lookup_out.attr.flags & FUSE_ATTR_SUBMOUNT)) {
+		fuse_queue_forget(fm->fc, forget, lookup_out.nodeid, 1);
+		forget = NULL;
+		ret = 0;
+		goto out;
+	}
+
+	spin_lock(&fi->lock);
+	fi->nlookup++;
+	spin_unlock(&fi->lock);
+
+	if (fuse_invalid_attr(&lookup_out.attr) ||
+	    fuse_stale_inode(inode, lookup_out.generation, &lookup_out.attr)) {
+		ret = 0;
+		goto out;
+	}
+
+	forget_all_cached_acls(inode);
+
+	if (!getattr_err && !fuse_invalid_attr(&getattr_out.attr))
+		fuse_change_attributes(inode, &getattr_out.attr, NULL,
+				       ATTR_TIMEOUT(&getattr_out),
+				       attr_version);
+	else
+		fuse_change_attributes(inode, &lookup_out.attr, NULL,
+				       ATTR_TIMEOUT(&lookup_out),
+				       attr_version);
+
+	fuse_change_entry_timeout(entry, &lookup_out);
+	ret = 1;
+
+out:
+	kfree(forget);
+	return ret;
+}
+
 /*
  * Check whether the dentry is still valid
  *
@@ -413,14 +508,28 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 			goto out;
 
 		fm = get_fuse_mount(inode);
+		attr_version = fuse_get_attr_version(fm->fc);
+
+		/*
+		 * Use compound LOOKUP+GETATTR when available to fold the
+		 * attribute refresh into the same round trip.
+		 */
+		if (fm->fc->compound_ops) {
+			ret = fuse_dentry_revalidate_compound(dir, name, entry,
+							      inode, fm,
+							      attr_version);
+			if (ret < 0)
+				goto out;
+			if (ret == 0)
+				goto invalid;
+			goto out;
+		}
 
 		forget = fuse_alloc_forget();
 		ret = -ENOMEM;
 		if (!forget)
 			goto out;
 
-		attr_version = fuse_get_attr_version(fm->fc);
-
 		fuse_lookup_init(&args, get_node_id(dir), name, &outarg);
 		ret = fuse_simple_request(fm, &args);
 		/* Zero nodeid is same as -ENOENT */

-- 
2.54.0

