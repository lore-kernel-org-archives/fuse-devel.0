Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679F122F01
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892766; cv=none; b=G9p5gPv48TsqlA8Xl8wpdnzarHBZnq3cy3IRDkjWZNz5Ji9R3uBZXVuhcamdIdu2zEieOoA39C3Qe3h5QQvSp6+LU29VQITXyGc5IUQVnTbtfCy6J7XmFbQno5BniCwiXM6fBGhfJtKprSFmB+njQUwpX025t9EEBwdtskXE67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892766; c=relaxed/simple;
	bh=GW68JBxZiL4oIZ8PjjI96odSAZ0Qta7Go4XLjdbPhXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ERQd0FnaMzBoOPUZOr3U+OY18y4QjZTvhVnYEqCNtcOIU8jvXO4PsaWc+4tevY0a2fS9QZ6PwbK2Vr5kb6arpAUMn/U3WlwiutmXwpcft3sC4ExYUprOtLMjjE4wQy6KAIK5b0Qp9bQz6qqLtP6xBS85/L9vkWQHHjERyvNyPyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8LN+sCG; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8LN+sCG"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65c0bda7f15so762084d50.0
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892764; x=1779497564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i16TQlkkbENbBbDX7bNqMrCCEBcpvRrlMKDNH85lJ6g=;
        b=e8LN+sCGx/GcAjrKfZ6M6H0LhOgPGro4ALSc7l3q8CcFx1lEXOsnvnlrqKqdv4FgRM
         SuEZ+ibRrFPbTqHFZG5i+qMtiX/Ae4PskttaHMMa5rzedzgkDoN1KBsBE4doVOAVjA1j
         NZZ6lThjVqSO+zjYz+a1Yf9i4GVWrT1mXv5VDqQk6WsYqc70lCZG1jkRW+VP7BN0TnrS
         SZvIZsdyC+H8O6UVRs78Q4NTj0Ju0A5YEXk+RkEXehiCv1WTcze+nCOrK6UqFleWDXSC
         rGf6n9EmAwYQmntOpvOMcZT7UmlvRPcjeXpeUyq28LXuXW3AYCrZxn46AP+d04bcam/P
         xNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892764; x=1779497564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i16TQlkkbENbBbDX7bNqMrCCEBcpvRrlMKDNH85lJ6g=;
        b=YxPboIIZ5NzDB3cgTWvDPFpnuyAuLmnl+tCvr4AEN6zrb4rRp2QniTR4wNbHAdilu1
         MJzfYgTZHtGyIvZOqCh3vEPakbb6pi9hBCzUSwUG6Y3QYQ+UYWTVTNG9IKPrEDeI4UNv
         sImZYlcSWavH9dfMaTNDXZNBqEB+qijcs6u2gtCjYgmE4W1h/LAZwW6lxN3S5HytYDwV
         K8v/2FYD/GycE9qZ3Uyxmd8TjHcK2RbFc4W3vQ/cCOsga4hXl3My+U01FIqiVc0lpRWu
         CsUbiyAtFn5LAf2SD5+OE4hD4sxF2CJXIu+uU3myaJncOIhHgsqTeo9Arhv+upQFmU3u
         gr9A==
X-Gm-Message-State: AOJu0YzWhCPMlTdowXIoX2Qftom2SYo0SwR3/vBu2YXoWfomjlzwHVoW
	WuI69QParYgWVN9YAyrfRurgdCMcMxl2toO6LKaeCJcCrEAliafSyePECluMb8iH
X-Gm-Gg: Acq92OH0/ZFMBkmLPlcYorIkru2EvR6CV6cTsyN8K6tY+0T+DyX34vyLVAlnRXY0FKT
	5cJ9Tx+W0LtIFrYp1qJUqKRChDm8AzxycRVwdv5etrcnAguzuL1FKpxKR47rj1fcF9CddDt0W5Q
	8YqJuPhQF37RLAPgLNRmwvQ6XTSXCmjoNOitvoj+i1kPU3BvNDGJwk/gB+Y4m8yX0tZQ0Pfuk2p
	9qeOAgCuuX9aqxcG3w9dOTlWdjuxSwsSM74QT4FkID9/6R/K02emnb0qAtZNlWmom4q9/xE8Cmc
	4+YYbHyvDO8vgZ0JBrzWO9MFL9oNQ8ylBBvP2zdxduFCko5EJwnU6v21OwJVZUN4AAwLTEfIZpD
	Nq+7gGhNS1iEBVQqdJJu9CtHLz4OmqDc2c9Te7Mc9eihAw7YxKxD7ybxnGva9Ayp1rqzCx6KEMw
	/XTzDIXH4LTa7QEoWNZpPrS/2G8p7rdCk=
X-Received: by 2002:a05:690e:d47:b0:65d:da2c:ca9c with SMTP id 956f58d0204a3-65e227579damr6045836d50.18.1778892764485;
        Fri, 15 May 2026 17:52:44 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:35::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0d658373sm3346383d50.0.2026.05.15.17.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:44 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 11/21] fuse: clean up fuse_dentry_revalidate()
Date: Fri, 15 May 2026 17:39:54 -0700
Message-ID: <20260516004004.1455526-12-joannelkoong@gmail.com>
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

Remove gotos with direct returns and flatten nested if/else structure.
No functional changes.

Suggested-by: Amir Goldstein <amir73il@gmail.com>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 112 +++++++++++++++++++++++---------------------------
 1 file changed, 52 insertions(+), 60 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 7d3c9878b833..a338f2a06b50 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -386,72 +386,31 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 				  struct dentry *entry, unsigned int flags)
 {
 	struct inode *inode;
-	struct fuse_mount *fm;
 	struct fuse_conn *fc;
 	struct fuse_inode *fi;
+	struct fuse_entry_out outarg;
+	struct fuse_forget_link *forget;
+	FUSE_ARGS(args);
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
-
-		fm = get_fuse_mount(inode);
+		return 0;
 
-		forget = fuse_alloc_forget();
-		ret = -ENOMEM;
-		if (!forget)
-			goto out;
+	need_reval = time_before64(fuse_dentry_time(entry), get_jiffies_64()) ||
+		 (flags & (LOOKUP_EXCL | LOOKUP_REVAL | LOOKUP_RENAME_TARGET));
 
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
@@ -459,14 +418,47 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
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
+	if (outarg.nodeid != get_node_id(inode) ||
+	    !!IS_AUTOMOUNT(inode) != !!(outarg.attr.flags & FUSE_ATTR_SUBMOUNT)) {
+		fuse_chan_queue_forget(fc->chan, forget, outarg.nodeid, 1);
+		return 0;
+	}
+
+	kfree(forget);
+	fi = get_fuse_inode(inode);
+	spin_lock(&fi->lock);
+	fi->nlookup++;
+	spin_unlock(&fi->lock);
+
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

