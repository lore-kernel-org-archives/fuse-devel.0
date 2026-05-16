Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0CE2E414
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892777; cv=none; b=YvZUW8Hgz1hjsSgBRXQSHMUD6HSqPYg9tFdgU2u3m+7ynwi3vzxJcIPVChumJz+0ZKc1APMiLv3b2HNTsQybAoJqQKLZS3yR8mNT5oQgovfTpKdFKJMUb27ehkaBpuaBUOIyBwiKxCN2zHO3mBraHkq+1Ffw8JLIYNuT5iRvqVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892777; c=relaxed/simple;
	bh=jDX/PRY5UaIwdYXq+2UBvCz1YhR4ZFNUuwCxDfdDTTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KbhsPB1lyr5ejutZ25LhJCXNVqGFMBdnAoCgj7UfRsAMHNWSA0w6XZaO/f+yvcAwK5qbrUeRNmTW4nJ23X9MqGgyAIOHsouH7QNPwtoCGQWFddqLlHVaCpgVDrwzQXZmHqTxTGasVFXBkoLqUy1htiPK1nKUjhZRP0SNrqx7ukU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoeVuM1L; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoeVuM1L"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7bf0b1a47b1so546857b3.0
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892775; x=1779497575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88Gw+C1h5VUj69/BTUVHHVf48OhDKUSM917eO0JsfBM=;
        b=XoeVuM1LFOYCF5V31Y/hYym9aRDcaWaXszZupbKZwlOQKBvSlRITgyf59hXShH5GIW
         xMrnQVrlNh4//fjjICpLXWaLOCwXKSlfLkusre0uY9Bp95myNxBGMe0M+hCNqe4sQo2M
         9FgnaVG3WECH6jeMr5Wqm7BZW/tniQhz9PLJThW4o/oDLeY2gnujC/wnBmUhzDpt6OLm
         +LSyKTtBQP7c9+H0/sITOUoRWFpd/lyU0uzS1tO5yPCZp6Z9ZDi58sf20sMfN0Nb2db1
         nFUeX8w4kIuxglaFGsSEGHN6O9mktWMHsBGUuZhG6WA6G4KvLeLjvyjDk5Z4HzEjtFUI
         LvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892775; x=1779497575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=88Gw+C1h5VUj69/BTUVHHVf48OhDKUSM917eO0JsfBM=;
        b=aDp3/jXujI5GGl5QhaH4aIUngvEuUbrHp+foHgz9MMFTOMQY4b4TJ6wrpumOndq+un
         G7pz19bXxDapzxJOFswp/Tzvs+A9Hac3AZQF4JWQRkLRT+o34KAyIqTzJvJfeSFtJR9a
         EfRGnwFfXP/Gpp7rfgwqwsB98r6wqO6wuW3t354U6BM5v5wUgJNJboy2WoCMGdW5MhWr
         Dw3CfATK/3sRwyDzufD2VyXF7KFb3w9re6sU+/uyZK8QIV5aGfoSGZ1BJblygnlBMtTa
         lvTK+vLzOtS5a/KI8YwkqBcC9cxXTjSF9F4kWQjVSIj/xfU0gvqYu304C4VoKs+SgYOt
         fJoQ==
X-Gm-Message-State: AOJu0YzgqqclpHXbp0as2cNzawEZqebTnGDJmsYJsvchkYAAXhRXn+gw
	NASlrkXKDOvF/2ZzVVA48fdDZS5nn8G0LEQp7tiWIEzE3tQmDanOEkF3
X-Gm-Gg: Acq92OFO0NlXyZaGuzNf9bodMXy+f1KalJcsoUU15ii4UhRxbdCeHc7HkcN+KqdbwWz
	yr0Mfg0eWn3OwTVcUK+NQZMECkj+KNdfKLjQhTYCGmYxPcVUKitvIKZlS++ITcuKRsVvQSAzptB
	tLgKqt/R+KySWFVKdZD8dUTJq8pIGrdJj1nDuY6H8S1Prspt/CUq6CSkTsMGXkFR7IBKL6f6dG1
	yAaj/9T/oy1BEYIt4sl/En/tsDARTjKVHhJM1FaVrx2IzjGIY76COJgmdb08DRNHKicIAIlvPrT
	EvMPerC8LLIEptHs+m7LUVz05V/FXfJ2E/dKNQ61RSv4YU26hHz8bDNHfMYza6+vyQdyprOwSVI
	+gdpXUBVFVzDd3NeL8DNlK+Lg98gTgvP7JzkJSDoUc0onY1OT9W8BcGAeNCOMDGogk9BbHrecNt
	7VeqmT7N4lPpr8P5+QHYxLgKPvCFKgyw==
X-Received: by 2002:a05:690c:82:b0:7bf:ff7:ea6e with SMTP id 00721157ae682-7c959e88e5emr75469197b3.4.1778892775431;
        Fri, 15 May 2026 17:52:55 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:1::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f22d0290sm38505117b3.9.2026.05.15.17.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:54 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 15/21] fuse: add passthrough support for create+open
Date: Fri, 15 May 2026 17:39:58 -0700
Message-ID: <20260516004004.1455526-16-joannelkoong@gmail.com>
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

Use the extended fuse_entry2_out reply for FUSE_CREATE and FUSE_TMPFILE
when FUSE_PASSTHROUGH_INO is enabled. If the server returns a backing
id, the newly created inode is associated with the backing file for
passthrough operations before the dentry is instantiated.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index a11f9e4c1999..4c7e3e1604af 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -934,9 +934,12 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	struct fuse_create_in inarg;
 	struct fuse_open_out *outopenp;
 	struct fuse_entry_out outentry;
+	struct fuse_entry2_out outentry2;
+	struct fuse_statx *sx = NULL;
 	struct fuse_inode *fi;
 	struct fuse_file *ff;
 	int epoch, err;
+	int backing_id;
 	bool trunc = flags & O_TRUNC;
 
 	/* Userspace expects S_IFREG in create mode */
@@ -957,7 +960,6 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 
 	flags &= ~O_NOCTTY;
 	memset(&inarg, 0, sizeof(inarg));
-	memset(&outentry, 0, sizeof(outentry));
 	inarg.flags = flags;
 	inarg.mode = mode;
 	inarg.umask = current_umask();
@@ -975,8 +977,15 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	args.in_args[1].size = entry->d_name.len + 1;
 	args.in_args[1].value = entry->d_name.name;
 	args.out_numargs = 2;
-	args.out_args[0].size = sizeof(outentry);
-	args.out_args[0].value = &outentry;
+	if (fuse_use_entry2(fm->fc)) {
+		memset(&outentry2, 0, sizeof(outentry2));
+		args.out_args[0].size = sizeof(outentry2);
+		args.out_args[0].value = &outentry2;
+	} else {
+		memset(&outentry, 0, sizeof(outentry));
+		args.out_args[0].size = sizeof(outentry);
+		args.out_args[0].value = &outentry;
+	}
 	/* Store outarg for fuse_finish_open() */
 	outopenp = &ff->args->open_outarg;
 	args.out_args[1].size = sizeof(*outopenp);
@@ -991,6 +1000,8 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	if (err)
 		goto out_free_ff;
 
+	backing_id = fuse_process_entry2(fm->fc, &outentry2, &outentry, &sx);
+
 	err = -EIO;
 	if (!S_ISREG(outentry.attr.mode) || invalid_nodeid(outentry.nodeid) ||
 	    fuse_invalid_attr(&outentry.attr))
@@ -999,16 +1010,26 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	ff->fh = outopenp->fh;
 	ff->nodeid = outentry.nodeid;
 	ff->open_flags = outopenp->open_flags;
+
+	if (backing_id < 0) {
+		err = backing_id;
+		goto out_queue_forget;
+	}
+
 	inode = fuse_iget(dir->i_sb, outentry.nodeid, outentry.generation,
-			  &outentry.attr, NULL, ATTR_TIMEOUT(&outentry), 0, 0);
+			  &outentry.attr, sx, ATTR_TIMEOUT(&outentry), 0, 0);
 	if (!inode) {
-		flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
-		fuse_sync_release(NULL, ff, flags, false);
-		fuse_chan_queue_forget(fm->fc->chan, forget, outentry.nodeid, 1);
 		err = -ENOMEM;
-		goto out_err;
+		goto out_queue_forget;
 	}
 	kfree(forget);
+	if (backing_id) {
+		err = fuse_inode_set_passthrough(inode, backing_id);
+		if (err) {
+			iput(inode);
+			goto out_sync_release;
+		}
+	}
 	d_instantiate(entry, inode);
 	entry->d_time = epoch;
 	fuse_change_entry_timeout(entry, &outentry);
@@ -1035,6 +1056,12 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	kfree(forget);
 out_err:
 	return err;
+out_queue_forget:
+	fuse_chan_queue_forget(fm->fc->chan, forget, outentry.nodeid, 1);
+out_sync_release:
+	flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
+	fuse_sync_release(NULL, ff, flags, false);
+	return err;
 }
 
 static int fuse_mknod(struct mnt_idmap *, struct inode *, struct dentry *,
-- 
2.52.0

