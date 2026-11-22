Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353925;
	b=Df3qtqg7xevcZo+gDwOgRzG4be97vLoNktpabLu8JRCvwr435beFx7NP89CEXqQS0ppL
	 GuaNAsBEjeHrup7P812Q5WW3XuZz/g7jbmj6zcm4qha7msOfSZVweJpt0ILN+Z3Rc63cp
	 57wJ6pcdUs5jvRhjcUAEICgvTZACiZ74bl7cPyHMRH4cSYzav+ir3k0BftCqyMm8nOU12
	 IIe82YW83J51GKLeU7DyHCb1/nMPL4NJrLCZU0Ju/EblzChKI0+0c5Ug8/C7lGIScfdjb
	 JxLIqvOQniwOI8C1wTSU28Meanb+mA2URT0dapGs3ixxVh3VbQd8pVvFlJkHNphR/Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=it2HDBJ8y+n4xpS2ivp6/aMFGvQnBMgFANrgQccCA9I=;
	b=jp0pE+g7hl450Ye14jtJrF9fWITOyNUVXqhP10ZvXv/UVY6NUvr5T30Es4QEr8xPe9hB
	 SC7be4BIHtMN98Zpz556MM9+nYQBKpUx12bzOVoMgvbA+ObjAtz8p+EmbZzqyjJtThDKd
	 lYTVF/5SM0J9lUUFP64vzkB8slGEedYnbRGtGqsbhw1tc1SVXpI3VwLggqfyBkRd4/14y
	 1WnMC1RzLtZvZAQYhq4fsmYGvEGo1Qho6yJ4OxKz95SJ3RSCyBqyb0ouCOLOCNbKziBCu
	 vZVXnsw+TujjmQo6Ewgsa8s/wdjr11GMDmQ2kxm0xwk7uIk3W1ODxwENEdbRDiUXTWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ssJ0IjO2;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69790606A320
	for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 13:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69790606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ssJ0IjO2
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so17802225e9.3
        for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 05:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353924; x=1795958724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=it2HDBJ8y+n4xpS2ivp6/aMFGvQnBMgFANrgQccCA9I=;
        b=ssJ0IjO2DtxSpsHt8H+Adl9oVzrbyvcFEiEU7tHFzbxoBuBmlPEFKynubHBnVajBUD
         u/n9vNl96jCk23dvwC/r9onWD13PZFphEdM9u3EWFZNUZqrdPyAsEbRRhRe5d3kmZ61B
         EIuaoCYsm0S/331pWpXUucRgVfL4ML+Y8Ovn9Xs0kQzmMlUm1MlK5hz9HoMmYdQmpyTz
         mKXlBL41SREzZRo+vGI+ZNmVvhXCaxJs2CAWiQZHhCDAu7F8ymRU70EeIZeg7B1kpsZq
         8hvIxtxrc4488vF2VC6zU2UT16jwBB3obinpvd2wvmxkKHI/g8XBTaTx1+LPvd+qQ3bk
         LpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353924; x=1795958724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=it2HDBJ8y+n4xpS2ivp6/aMFGvQnBMgFANrgQccCA9I=;
        b=JbjDhe2y3f6cEJreZcTBqVvJMIUL9FXKm7EwyMmT6ylAzTIheuVS978+7oggV+KKyY
         IrFb6D7CegLcmEhCohF9GFx95WQs99RWdtOyZPKuNUsrHDkgn2csKC0FyS6Dcwe1FF1K
         bkMqQAYQX+kKQw49Di/t7cW4PtFA0iruAb2S/Qal1Li/J6/gGWEzKKsBcgyRZ9f4CN/d
         yoQkhzvl5SgDFovGH6rBmEFeShm73fkG+HHsJaF/9Aldb63D9YBB/NcQnwj9xWwI9XQo
         OCHTR018ilX6N3xoRccHHg3y84Mb50/zWU8c2vT2fFy3gCLZ/7+LznZqkMXbvIqO3BJR
         cnzg==
X-Gm-Message-State: APuU4Z/oJkpkXnYyBo8uAPj//XYwuRVbUbwy+KbCXp0Tzx+ha+29tvff
	FEy7B3iEDbZ6cqMZnWh9NdwiEIMIq9W7x5v1jPxEYKB7ysDJ0XoNFlS2
X-Gm-Gg: AZFdTZePrP0gyVFpJ8VsvC88GGteANqsh1CiwKBsE2HJy93oNGG857OCFxUjMsMjgUw
	gZHKQw6lTvxTN++DDQ1AKBYBcnszSZmQuMVxpX0foNOEF1N98KlBEYGvltckRWGQ8T3NpXx2gAC
	dCmxYdWmH75WpNw0Tpokwf8b6dnfqSqFds8EhGQp4M4Ti7m9AYgX3wEQNfKgsZ3TmnLDFmRulFL
	ygB9klSa8jrEHs7P33cWeNWXlYKCcWs2Sfx64O+siv/FWhqGkHdbeUDVCCWGZoPu1N5ltE6bmtT
	r73KRDzjuU6gW4UcQcE662pjw6iVbMZU6yX1B9nlkesT7VB409ldXt2hZ2MdD8X5kj64lyis9aZ
	YmXHGYUn/LW7fd9H+rw5XBM8EJU6RLzX87S4SwT9fREGzEI90JVBYaMjxUqVFLbfSQz1+7yFudR
	H3VQ8znjoCHpsWbYPnzWeL1CQMTgJ4UdFk+/Cj63UjBAFJ8RJo+w3JYB7ixcmZ7dMqWKMkdO97r
	aP4xgxEKGB3HmziBNxo3YDmGFJHR1V+koUyfXfSeci7jY4HQFpJ3i6q2FTxlV7bLmIvyLw/9oY+
	zJ7PRQ/gvKhv1fObBF5BKcx2gfRVdXmr2y053FVJHyfvpwsY2XaddvtpjKwazlc=
X-Received: by 2002:a05:600c:1d04:b0:4bb:685e:cc42 with SMTP id 5b1f17b1804b1-4bb88817e4emr188073375e9.18.1795353923539;
        Sun, 22 Nov 2026 05:25:23 -0800 (PST)
Received: from t480.fritz.box ([2001:a61:3a4e:c601:fc75:724e:6b78:3649])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b205443sm17174948f8f.39.2026.11.22.05.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:25:23 -0800 (PST)
From: Han-Wen Nienhuys <hanwenn@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-fsdevel@lists.linux.dev,
	mmitar@gmail.com,
	bernd@bsbernd.com,
	Han-Wen Nienhuys <hanwenn@gmail.com>
Subject: [PATCH 1/2] fuse: kill suid/sgid on fallocate and copy_file_range with KILLPRIV_V2
Date: Sun, 22 Nov 2026 14:24:53 +0100
Message-ID: <20261122132454.18764-2-hanwenn@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122132454.18764-1-hanwenn@gmail.com>
References: <20261122132454.18764-1-hanwenn@gmail.com>
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

