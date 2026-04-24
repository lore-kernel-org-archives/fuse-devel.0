Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175AE17A586
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993477; cv=none; b=uisORxVfc/7Knv3v1dSUjLuTNvTZlaxrn13llB9WDf/AhDQFyHnRYoq2gAc9kytoH/FBmoiNcVa4CHvwIaeF51h0g/4Xr3nNUy4384o/I4jLywrJy/mx9j8THFHB+WbW2U+FE8fiBqKNjmk81g/rd8bEIghTk1HaxebRp2PVZag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993477; c=relaxed/simple;
	bh=l20gn9MXbxCBvheBdfpoozV/H91tpET70jp0G+Fxvc4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3eweWbJ+NuPvJEsn1klpjwjmkw4vU7fx2705+AXmFSYDUU7mbrYVRcZIdz/EmHOI8RkuSigoLMImNEWASqFHZF9RKjFvHWZ3JPib9J7S68kNyVZpae5ctws8Qhgl3ERljyAHhLn3sunw3r2Gp3mM8I9wwT1QRl8nVH/yR+jUiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2FGg6FC; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2FGg6FC"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8296dabef74so6140381b3a.1
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 18:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776993475; x=1777598275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHHS05dTNRZwRS3t5/laGuDdxQZCfzV+iApvzThoj5I=;
        b=T2FGg6FCWO1IBQhiwdVM2xGI644phuHLKJsjNyCyvImUXf1e2x0BPPUsey7S41qxAi
         h/mWKvBN99JazsoKZFYej12B3MnrGb3Ts6zqTdJ5OGWnKOoxmgzkNQQUhzSD1+uuEGJk
         n9VnvhDM/4RY+w+5ep3xwawPnkJvQjmuQWDLzLaRQsmJ6CVpJcQLGWFI6KxI330joqg/
         qGpSrLEe4eX8RnY5OrS62Ef44Zzx1tauih9dmOyEEP7NMW6JUnGY+l1jA+WBw26ZPl4u
         lYxG7YKpOwHOfT6iefZtvIYEn2w5l3SsY+csXx7ysIOG4J7sUUorwTD9+kDQJN2scL6J
         Arhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776993475; x=1777598275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dHHS05dTNRZwRS3t5/laGuDdxQZCfzV+iApvzThoj5I=;
        b=bAufJ/pQj++ZFi3WyGO3W46aKfCD4Ov9Ipl2SMBpOCiot0fNdTn8MUh04wydL7YY5K
         gL2fR9ZjlbjM2YkewrLNjcT/JylEutvuZXgZGv0sY2RCwa282/E14jbtysLqjpoWYst3
         O+RyngIZZnc5oJV/GfREjenftkMiddXM62UHnYzZ/Je9CJYMghyHdjSG9uYF3Z0b68sz
         TzwYm1af1GI9Oik0b6+YQ4OucG0FFVmyuWvYhduTG8gvfkyFUQFfLQfOxlY1uFEhXQel
         SzU6uHHQymvrw/Mp5B6p9PQMOo2//7X0289ffr3vX0amzaMvkahMvQuEii1tuO7u4q+/
         oKXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9aGYF3updr8WooBueolsN6W5zIWGFKXhkO5Vuk5Wlp6EwBZmb3mRtX6nPfd6racmnXQ/eoigTsxn6@lists.linux.dev
X-Gm-Message-State: AOJu0Yzuv2SK49MbDw72rmRq6FgoLnaSZed4+unTvG96sCzNbU5fbXCm
	Iempl/urTdZAQAVkoTEC3wqLZKNpun483hXg2m+bIFlUKRc8NLDN6WMuiDJ94A==
X-Gm-Gg: AeBDiet0X9HhBudoEJKxY8BlEOcazCCDDFqQPl3V81Tfc3Emi5rs85GHe4/5lRsQnQx
	4de7haNLq2zjBwXEeFKSG/TDsH92OATS/KKV0b20vYdWIWRKdgvvZx5hjMCVS3dxJhp7EdPrhUh
	pKwehbM+WGNrJrNYG/QendbeE/cASwxkAWxe9BPatGGhq0vDoQjJ0bWpUkOjxtPxy09TKQ06o1V
	s/NqbM9eNuy1FwpxEM2uQ6hKAftWJ9DR3ei2m4GPpx45Z8mLztwCqh8tf05RJlbddFLSNDJYdUs
	QJC2S9vGwshJzg0zUmF1sgcqybC7VgcRKCZWdY0Ot7ZSaSEi0qYqzbmGH7Dv5fNIEi/enUwC/Pr
	Yywc8Y4Fm0qBkF8CMAJ301sltZBbi/fyndr2AoxvPWR497II/AnlQdw7/H/QpKfNwh6r7DXUCP/
	4prBz1IvORzxIlsw7kdV5HdCquq/yQWCw4vqA=
X-Received: by 2002:a05:6a00:90a7:b0:82c:24d5:21cb with SMTP id d2e1a72fcca58-82f8c82ef00mr30947602b3a.8.1776993475458;
        Thu, 23 Apr 2026 18:17:55 -0700 (PDT)
Received: from localhost ([2a03:2880:ff::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm22422043b3a.60.2026.04.23.18.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:17:55 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 01/13] fuse: fix missing forget requests in error paths
Date: Thu, 23 Apr 2026 18:16:34 -0700
Message-ID: <20260424011646.457682-2-joannelkoong@gmail.com>
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

If the server returned a valid nodeid but invalid attributes, the kernel
needs to send a forget request to tell the server to release its
reference, else this leads to server-side leaks. These paths only
trigger with a misbehaving server returning invalid attributes, so the
real-world impact is minimal, but forgets should be sent.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 52 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index be41c14ef329..6ab05d7d297d 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -583,7 +583,7 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 
 	err = -EIO;
 	if (fuse_invalid_attr(&outarg->attr))
-		goto out_put_forget;
+		goto out_queue_forget;
 	if (outarg->nodeid == FUSE_ROOT_ID && outarg->generation != 0) {
 		pr_warn_once("root generation should be zero\n");
 		outarg->generation = 0;
@@ -593,16 +593,18 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 			   &outarg->attr, ATTR_TIMEOUT(outarg),
 			   attr_version, evict_ctr);
 	err = -ENOMEM;
-	if (!*inode) {
-		fuse_chan_queue_forget(fm->fc->chan, forget, outarg->nodeid, 1);
-		goto out;
-	}
+	if (!*inode)
+		goto out_queue_forget;
 	err = 0;
 
  out_put_forget:
 	kfree(forget);
  out:
 	return err;
+
+out_queue_forget:
+	fuse_chan_queue_forget(fm->fc->chan, forget, outarg->nodeid, 1);
+	return err;
 }
 
 static struct dentry *fuse_lookup(struct inode *dir, struct dentry *entry,
@@ -882,22 +884,21 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 		goto out_free_ff;
 
 	err = -EIO;
-	if (!S_ISREG(outentry.attr.mode) || invalid_nodeid(outentry.nodeid) ||
-	    fuse_invalid_attr(&outentry.attr))
+	if (invalid_nodeid(outentry.nodeid))
 		goto out_free_ff;
 
 	ff->fh = outopenp->fh;
 	ff->nodeid = outentry.nodeid;
 	ff->open_flags = outopenp->open_flags;
+
+	if (!S_ISREG(outentry.attr.mode) || fuse_invalid_attr(&outentry.attr))
+		goto out_forget;
+
 	inode = fuse_iget(dir->i_sb, outentry.nodeid, outentry.generation,
 			  &outentry.attr, ATTR_TIMEOUT(&outentry), 0, 0);
-	if (!inode) {
-		flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
-		fuse_sync_release(NULL, ff, flags);
-		fuse_chan_queue_forget(fm->fc->chan, forget, outentry.nodeid, 1);
-		err = -ENOMEM;
-		goto out_err;
-	}
+	err = -ENOMEM;
+	if (!inode)
+		goto out_forget;
 	kfree(forget);
 	d_instantiate(entry, inode);
 	entry->d_time = epoch;
@@ -925,6 +926,11 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	kfree(forget);
 out_err:
 	return err;
+out_forget:
+	flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
+	fuse_sync_release(NULL, ff, flags);
+	fuse_chan_queue_forget(fm->fc->chan, forget, outentry.nodeid, 1);
+	return err;
 }
 
 static int fuse_mknod(struct mnt_idmap *, struct inode *, struct dentry *,
@@ -1010,18 +1016,18 @@ static struct dentry *create_new_entry(struct mnt_idmap *idmap, struct fuse_moun
 		goto out_put_forget_req;
 
 	err = -EIO;
-	if (invalid_nodeid(outarg.nodeid) || fuse_invalid_attr(&outarg.attr))
+	if (invalid_nodeid(outarg.nodeid))
 		goto out_put_forget_req;
 
-	if ((outarg.attr.mode ^ mode) & S_IFMT)
-		goto out_put_forget_req;
+	if (fuse_invalid_attr(&outarg.attr) || (outarg.attr.mode ^ mode) & S_IFMT)
+		goto out_forget;
 
 	inode = fuse_iget(dir->i_sb, outarg.nodeid, outarg.generation,
 			  &outarg.attr, ATTR_TIMEOUT(&outarg), 0, 0);
-	if (!inode) {
-		fuse_chan_queue_forget(fm->fc->chan, forget, outarg.nodeid, 1);
-		return ERR_PTR(-ENOMEM);
-	}
+	err = -ENOMEM;
+	if (!inode)
+		goto out_forget;
+
 	kfree(forget);
 
 	d_drop(entry);
@@ -1044,6 +1050,10 @@ static struct dentry *create_new_entry(struct mnt_idmap *idmap, struct fuse_moun
 		fuse_invalidate_entry(entry);
 	kfree(forget);
 	return ERR_PTR(err);
+
+out_forget:
+	fuse_chan_queue_forget(fm->fc->chan, forget, outarg.nodeid, 1);
+	return ERR_PTR(err);
 }
 
 static int create_new_nondir(struct mnt_idmap *idmap, struct fuse_mount *fm,
-- 
2.52.0

