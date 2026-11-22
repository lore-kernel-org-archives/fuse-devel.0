Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354166;
	b=g6qGapSN8VzPycPAD3KvFffLmyAym0xSZBI2TrGUN/Nhw/IKDyq5BPQro/JISoiilruW
	 jyhOmBXioi6lIh+A8uMa0g1w31S5RCDKHqNUzMIUNM8br+ec9cT39VU2fahATXT9WlwGq
	 ZyEkaOEhFHJr82PZCWuFOfkHqwRcgr+sg/XND226dkuGBc/5fjfGitlW+kwHVsNCgvxf9
	 uj5haQwdXJC4h/a98HlmPT2sMz7+ZK7Mh+tdWUI+REH5Og1HW4IRt0UPiR76geuoDhMVD
	 uJsQ7b6faikz59FZOd1sgSr/i4WBQH5gh8KkyD3NGv38S2cVaiAQJGueIdUkXlb2sUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=it2HDBJ8y+n4xpS2ivp6/aMFGvQnBMgFANrgQccCA9I=;
	b=gFMpqrHK+c6Af5FfZBxRDHAN9ACWy+ijTCzMOcXqaKfATEUMmCY1n5ptKm3rkYjmUHbf
	 kX0u/P2aI9z/jfQ0UvBgCLWHgMlgxIOQTSVgnWj7xjib5Tvw3z8YvwYL847qWk3G27so8
	 nVP+cLKiMQorBkuG4vwQuCf7bsjECfEjkJ0dqan10vB2Bul471lMwZxXs5YtcirbKWzoX
	 6StEkgxFbKbmr6xlIhPqtQMw1rVNO1V5B1egMpy3fGtj/V0H19DWEPzgphrIJPf0e8TzC
	 1KoVhTlgNBv9zn4r8dt8dKsRtyA4ini79fJ0SICStFvjU6QmtqeYZB2rmU8zf82GlUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XpgAzoRH;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4649606A320
	for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 13:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4649606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XpgAzoRH
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so22842785e9.2
        for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 05:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795354164; x=1795958964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=it2HDBJ8y+n4xpS2ivp6/aMFGvQnBMgFANrgQccCA9I=;
        b=XpgAzoRHpUFCpQozDp1Tx6u6Z+CVKN6CAF3px5ZebMt67RC1qBq/sBJSBsDzdOUKsM
         7hSoHL1s8GcsAfYmrejQkSkm1xBgYrygc+zs13paqgrj4BGz420CxTUNtZJPA8XzgwOX
         3CmaF3dtnInwrheiRZtD/ZRqMh9HrVTQi8+1Tft2Vu4OkClLo/GldOJkB1AgVK24Rs4N
         dxaCeYlREnjA7LLlwhzNjGNWV3abi3q6i+DDQUJEbMLPJTHBZYUS2UVEO7mkZE/QLPhp
         u7V8CkTfZZj0Jltv+IdlA7U94eXZpsBiBASrc5ItG+hEdb8+6KM1ZN3G8vVyFlQ0hOVF
         oUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354164; x=1795958964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=it2HDBJ8y+n4xpS2ivp6/aMFGvQnBMgFANrgQccCA9I=;
        b=nX4B5aKvEhMz7adsYUDvRBH0ZS3Pqj5gMNuM7p30Z5dG9sHfPr5rB2J54kFcwgE9wn
         NkrzNJRHkb7EQJMDzYTkzD0ltZyMir4jNMuSJUVXLCa1BJxPGzxOSF9tSlxkbOg9DUWI
         DTCs72dZtrPPCA4DvAYY6e9+k/UtOlGJ8QrgudA+Xd2P1Cw/eMDJGw96AYQ8n4PVrGEA
         PMIP83VETXniEekivdzXCppoYAFVxla3GINmC4aj9UkOdTB4vrYhPqP84DnQy82TIZTj
         zZElbiTVZ4xvJq6NCOf13aJIL5LbnhB/j7Yw2bmJSOZYoKRCRl15hXFfLImh7jlPjkLX
         ExXA==
X-Gm-Message-State: APuU4Z9knsFBeHs5V2cg5RLiCn5gbtFcmlM1B2rDkEO2huXsu/TLTv0E
	ga4htpmfseWXgxdUD12NUl1qLY4kx3QEqchEtuvfmxVyxU2ZD+cd4Z8L
X-Gm-Gg: AZFdTZfNEqy/IWhDJjsHYCACnLPAZwy5t8HNicjYy6y4rXByVDIOhXTe4Ji5J7ok5mi
	fhl/tnqRYkp2IOp1Ib/2ZyawtwKDytyutoSd6qUZnEflvaPZmRPpTH/E3eMPHWmXOoca66u/46O
	gLe60FBg6VzPXvbgYfuGFH8TjRJJCgg62p52daZ7AB68yFoxtcAIIRfZ2FSQcZOT1wx7dNDUtQ7
	sluLwIsnmerdFO3qo1/F0vY3zZlRcphXsdb+ZVVsiYpqxHxL168UPplb0Dyjqxt60uwUeR9u+FP
	c7pWkOZRpgTij2Faw8nWGVtU8fIchyTSQLpsPOrfuOipXn7k4XWNDW7mB2sR/WvcrevcAtlgH+/
	0wnTagv8vOI4PinWtWVQlPblGADIUjetOW+8RUo+MeemVWTIQ8c8RaHPfc4fzlslh5HGv9qcdza
	ePZFwbI1DdWtInLUeaq8kIRzrhqc2FNXhnqJ34M/OJsyL/E4f/myenuWwNCSFVPdXZ3kQIv/sb0
	gDa132YalEzld+HJIiAl9TWFbVzZYzw1656vQyAZ0Zv5sFg2OH8c/EILN/jJycupuHJxGm9eOqI
	5RPoaMt/o7POjhVht2jdQt3zCE6q0BQojmxakqucHf/2GZS5gaHw17TkBuwa1bM=
X-Received: by 2002:a05:600c:5246:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4bb887fe892mr199367865e9.7.1795354164205;
        Sun, 22 Nov 2026 05:29:24 -0800 (PST)
Received: from t480.fritz.box ([2001:a61:3a4e:c601:fc75:724e:6b78:3649])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm17286017f8f.16.2026.11.22.05.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:29:23 -0800 (PST)
From: Han-Wen Nienhuys <hanwenn@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-fsdevel@lists.linux.dev,
	mmitar@gmail.com,
	bernd@bsbernd.com,
	Han-Wen Nienhuys <hanwenn@gmail.com>
Subject: [PATCH 1/3] fuse: kill suid/sgid on fallocate and copy_file_range with KILLPRIV_V2
Date: Sun, 22 Nov 2026 14:29:14 +0100
Message-ID: <20261122132916.19066-2-hanwenn@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122132916.19066-1-hanwenn@gmail.com>
References: <20261122132916.19066-1-hanwenn@gmail.com>
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

From: Bernd Schubert <bernd@bsbernd.com>

With FUSE_HANDLE_KILLPRIV_V2, fuse_setattr() drops the mode change that
file_remove_privs() asks for and relies on the server to clear the bits
when it handles the following WRITE request (FUSE_WRITE_KILL_SUIDGID).
fallocate() and copy_file_range() send no WRITE, and the SETATTR sent
from file_modified() carries no kill flag. A caller without CAP_FSETID
can therefore change the contents of a setuid file while the setuid bit
stays set; write() on the same file clears it.

Send FATTR_KILL_SUIDGID in that SETATTR. The VFS sets ATTR_KILL_SUID and
ATTR_KILL_SGID only after its own CAP_FSETID check, so capable() is not
tested again.

This affects every caller of file_remove_privs() and kiocb_modified(),
not only fallocate and copy_file_range: passthrough writes
(backing_file_write_iter()), ext_map writes, DAX writes, and ordinary
cached writes (fuse_perform_write()). Before, their SETATTRs went out
with valid == 0, so no requests are added. On an ordinary write the
server is now asked twice, in the SETATTR and again by
FUSE_WRITE_KILL_SUIDGID on the WRITE, which then finds the bits
already cleared. This happens once: the SETATTR reply updates the
cached mode, so later writes find nothing to kill.

[HWN: rebased onto v7.4-rc3, extended the commit message]

Fixes: 8981bdfda744 ("fuse: don't send ATTR_MODE to kill suid/sgid for handle_killpriv_v2")
Reported-by: Mitar <mmitar@gmail.com>
Closes: https://lore.kernel.org/fuse-devel/CAKLmikMhOYpGEw6uCqX_Bm0JPEg-4FhdJMNa9+tgtw3-Kf+eZg@mail.gmail.com/
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
Link: https://lore.kernel.org/fuse-devel/e75cf549-07a6-4095-bbf8-8caff7a3338b@bsbernd.com/
Signed-off-by: Han-Wen Nienhuys <hanwenn@gmail.com>
---
 fs/fuse/dir.c    | 13 +++++++++++--
 fs/fuse/file.c   |  3 ++-
 fs/fuse/fuse_i.h |  2 +-
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index a04d93d5fc44..ae62b975a1bc 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -2148,7 +2148,7 @@ int fuse_flush_times(struct inode *inode, struct fuse_file *ff)
  * and the actual truncation by hand.
  */
 int fuse_do_setattr(const struct mnt_idmap *idmap, struct dentry *dentry,
-		    struct iattr *attr, struct file *file)
+		    struct iattr *attr, struct file *file, bool kill_suidgid)
 {
 	struct inode *inode = d_inode(dentry);
 	struct fuse_mount *fm = get_fuse_mount(inode);
@@ -2241,6 +2241,13 @@ int fuse_do_setattr(const struct mnt_idmap *idmap, struct dentry *dentry,
 	    attr->ia_valid & (ATTR_UID | ATTR_GID))
 		inarg.valid |= FATTR_KILL_SUIDGID;
 
+	/*
+	 * fuse_setattr() dropped the mode change for the kill request. The VFS
+	 * already applied the CAP_FSETID rule, so no capable() test here.
+	 */
+	if (fc->handle_killpriv_v2 && kill_suidgid)
+		inarg.valid |= FATTR_KILL_SUIDGID;
+
 	if (attr->ia_valid & ATTR_SIZE) {
 		/* For mandatory locking in truncate */
 		inarg.valid |= FATTR_LOCKOWNER;
@@ -2337,6 +2344,7 @@ static int fuse_setattr(const struct mnt_idmap *idmap, struct dentry *entry,
 	struct inode *inode = d_inode(entry);
 	struct fuse_conn *fc = get_fuse_conn(inode);
 	struct file *file = (attr->ia_valid & ATTR_FILE) ? attr->ia_file : NULL;
+	bool kill_suidgid = false;
 	int ret;
 
 	if (fuse_is_bad(inode))
@@ -2346,6 +2354,7 @@ static int fuse_setattr(const struct mnt_idmap *idmap, struct dentry *entry,
 		return -EACCES;
 
 	if (attr->ia_valid & (ATTR_KILL_SUID | ATTR_KILL_SGID)) {
+		kill_suidgid = true;
 		attr->ia_valid &= ~(ATTR_KILL_SUID | ATTR_KILL_SGID |
 				    ATTR_MODE);
 
@@ -2378,7 +2387,7 @@ static int fuse_setattr(const struct mnt_idmap *idmap, struct dentry *entry,
 	if (!attr->ia_valid)
 		return 0;
 
-	ret = fuse_do_setattr(idmap, entry, attr, file);
+	ret = fuse_do_setattr(idmap, entry, attr, file, kill_suidgid);
 	if (!ret) {
 		/*
 		 * If filesystem supports acls it may have updated acl xattrs in
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 993a1d2b3151..efd35218f613 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -2766,7 +2766,8 @@ static void fuse_do_truncate(struct file *file)
 	attr.ia_file = file;
 	attr.ia_valid |= ATTR_FILE;
 
-	fuse_do_setattr(file_mnt_idmap(file), file_dentry(file), &attr, file);
+	fuse_do_setattr(file_mnt_idmap(file), file_dentry(file), &attr, file,
+			false);
 }
 
 static inline loff_t fuse_round_up(struct fuse_conn *fc, loff_t off)
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index e0992fcbcc55..6ed2d71dc9d1 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1250,7 +1250,7 @@ int fuse_flush_times(struct inode *inode, struct fuse_file *ff);
 int fuse_write_inode(struct inode *inode, struct writeback_control *wbc);
 
 int fuse_do_setattr(const struct mnt_idmap *idmap, struct dentry *dentry,
-		    struct iattr *attr, struct file *file);
+		    struct iattr *attr, struct file *file, bool kill_suidgid);
 
 void fuse_unlock_inode(struct inode *inode, bool locked);
 bool fuse_lock_inode(struct inode *inode);
-- 
2.56.1

