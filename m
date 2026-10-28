Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178771;
	b=z2DIHKL5WT9eJkILYwvtufTHzSIyBBHVm1cCYspPYvHamtnarnpkBeW1kSPfTDOaWLxy
	 QweRBmm3tvLbmC6TqcIQ5GjNSN3/PoV16M0h8JA/p7g5YZ3y1aJY1WetmkFLiArFCnsBa
	 HjWXWVzkQJ0NN7hO1TRiECS22IbQTQu2IQ1g2f91T5Ht+EehMguBMKxNGdloMslUPTWHB
	 frAvm5Wgtxj++mGznqjjHjCzwGsroA/JCiX5RlDqK08UtHOOAvubrzN/O/Enj7KYJYCpk
	 Xdx9wQlbVcLN8T4m5Z0TroXgsEG3O1PflPTUs5R+Nt1LenGawm/JKeCbvy8+7q46Klg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SV8Wxy07QIny/e8ggZujjNGNs5qPZ5nBqXtG8JpSEPM=;
	b=5EpWibTbX1MNI6sqQ1NQKITl/saNBoRb77nybLu8kXFOewAZELIJMGaSee0pI4srmRqu
	 PPgbO8KjUKMg0qB4lazB7IgOkFcE3qkYf/KRt/rML7b87d5xItnhOtfZCedelQXGrVKh8
	 DAm/4V/eln8Pu5cVmk6r2qUlEq9kf26Bp9sPwRxg7Gc8xp2cEtYZnTOuyiv+S6ZoGKyOL
	 jRHt6Rg0W/FyZM/N1fIk4wzJSEGina7gpt6HhNDBMhxBt8nI8v0pNzpUEyiv9rL+ix/PO
	 YLiMKQKGLdO/BTPuj+kwDCUvPLTN5XaoZXfMk+PgoTKbwv5R84Ca6OfVerouRXmTC5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKb+2iXq;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C31B606A31A
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 09:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C31B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKb+2iXq
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e00eee27dso493441f8f.0
        for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 02:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178769; x=1793783569; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SV8Wxy07QIny/e8ggZujjNGNs5qPZ5nBqXtG8JpSEPM=;
        b=OKb+2iXq+9D6iviqbqcDWDBVpXaJ+ScTjgsqWc0aJrVAcOIeN8T0f6mH/VGoguNMAt
         vWPvpek1DXShQuWVvgfKpzVeGUaoW0dcvM+FF/cUcs3S/zAdeg+lilvDAh08ELZgmV7a
         4QFkIxQ6bhHdq02RSr+ruCFPTaIczw/s+INhiW7fm3LG2Tx1WULh3fK71oPV9Saa93lR
         v+OwuOaE806KrVgoj0gRO3ZvkuWz1MDYpxuFtKgmFQcMujHzbPc5cJ6rIOKmunWLMmOp
         WzMrs3xvZ4mfrz5ByyGdY7AuN9URlNF5IK7khQQorhSwSStLqNAAreqDH7wB3oFt8n25
         Wn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178769; x=1793783569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SV8Wxy07QIny/e8ggZujjNGNs5qPZ5nBqXtG8JpSEPM=;
        b=x7ue3tuHt/JdKh1THTb65UURgaJrRbd2gFFy7M00vwBmEApKzxI91UeZC+jAI0ksJz
         Sw/zOxfCtzPaOSLh5uDlk107m8Wv62AX3dnq4lwB31QRTqKbsh2p26IqZtkLjuJhIprL
         ZoWP82Zy1MTHn0Af3bZA/yZ94nc4XwHhcBvphiUqKcBWg71lQ1Nu882pyokb0CHIsbXw
         CwJH8oqwyECmOZ/6TYjoCfEtQUEJo3I4PEiQaTi0obbNhaDjOYmqq+FLhXVtpySLly+2
         eu9KrCA32lX1xMgLpcEiBACLMkUJXVH381CmEtHPaQaynHhXG4/0f1Ux+tuH5gjWE/fS
         OA0A==
X-Gm-Message-State: AFq9FYI3oxBdxFysGhCItxyKUR++GdIRpkM3R8v8eLaittQRhpBPY2xn
	iCBiXt2HG8eHNW51kyieqcBcXUJk4Pc1zJELNkgQtKFGjj7C6PyLl6gJ
X-Gm-Gg: AYBFou0j6Awzz8SQggmFU8O3oB/RyBvvzdkh+aQl9O704aEi/zRStKbOtqUY/YMGf1L
	slFMSekNx91zQXyTEdvolGr9KWfvXtf7IRLbrIULIi7/sJGwg4q6DOxcPyOf8c7BTjl6ihz0ELu
	h0/E8SXGDog+p6fHTUFGQOSVfGXDLcElpUkA2eRkly2L4fUadQseqj7td/MADZ6a1zl9hE4KB2a
	Pv+uezdK7oum/7aaGvfH97SoCONSDmN91BjEyNnBIviSV1TJhraRq++za21AjGto8O7FAb4fK4C
	Hfy5z5LmR7JEk3qaNJ2xTXLyKGdjMDu7jZLQYKCafHO3UwbJFmUlCyUQhCs0UcQC81I9LH/Kr2N
	MjYTMSzMStS4oMB7vGvX3KzjfGURBRS/Xk5e1gWyWOnxiphhfuUyrXeXOP8mbJWP0r2MBk/0WEr
	XUszY6asWUxPN+/e548CCXlVsPoIrBoiA6YBJzG4zlKGRM7XJ3mQsaSs6SIneMw7D5B9JywP8yS
	3fKp+lOnUqAeqknr07rowTBIg54T70klKsUnVFXR3plreSepjxKrf4LTOh+uOpX4Tbf1SnjEdE2
	VJX3Z+jTlddQy2Ez4Fsco9egrnf6GYVQtnXCQXHF7YBShBwpmE+FqfcVBXYZlTQ=
X-Received: by 2002:a05:600c:6209:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4a9640f231dmr33961125e9.3.1793178768762;
        Wed, 28 Oct 2026 02:12:48 -0700 (PDT)
Received: from t480.fritz.box ([2001:a61:3a4e:c601:fc75:724e:6b78:3649])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c42b3c1sm33507215e9.6.2026.10.28.02.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:12:48 -0700 (PDT)
From: Han-Wen Nienhuys <hanwenn@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	Han-Wen Nienhuys <hanwenn@gmail.com>
Subject: [PATCH 4/7] fuse: split readdir requests from struct file
Date: Wed, 28 Oct 2026 10:12:12 +0100
Message-ID: <20261028091215.914885-5-hanwenn@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028091215.914885-1-hanwenn@gmail.com>
References: <20261028091215.914885-1-hanwenn@gmail.com>
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

Make the readdir code work on a struct fuse_file and the dentry of the
directory instead of a struct file, and split the request into setting
up its arguments, sending it, and processing the reply. A following
change reads a directory with background requests, which have no
struct file, and process their replies in a work item.

fuse_file_read_args_fill() is fuse_read_args_fill() for a fuse_file
and the open flags. fuse_readdir_args_end() reports whether the end of
the directory was reached, which the getdents path does not need.

No functional change.

Signed-off-by: Han-Wen Nienhuys <hanwenn@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 fs/fuse/file.c    |  15 +++-
 fs/fuse/fuse_i.h  |   3 +
 fs/fuse/readdir.c | 190 ++++++++++++++++++++++++++++------------------
 3 files changed, 130 insertions(+), 78 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index eb5ae11b6010..9d979deb6cf8 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -606,16 +606,16 @@ static int fuse_fsync(struct file *file, loff_t start, loff_t end,
 	return err;
 }
 
-void fuse_read_args_fill(struct fuse_io_args *ia, struct file *file, loff_t pos,
-			 size_t count, int opcode)
+void fuse_file_read_args_fill(struct fuse_io_args *ia, struct fuse_file *ff,
+			      unsigned int f_flags, loff_t pos, size_t count,
+			      int opcode)
 {
-	struct fuse_file *ff = file->private_data;
 	struct fuse_args *args = &ia->ap.args;
 
 	ia->read.in.fh = ff->fh;
 	ia->read.in.offset = pos;
 	ia->read.in.size = count;
-	ia->read.in.flags = file->f_flags;
+	ia->read.in.flags = f_flags;
 	args->opcode = opcode;
 	args->nodeid = ff->nodeid;
 	args->in_numargs = 1;
@@ -627,6 +627,13 @@ void fuse_read_args_fill(struct fuse_io_args *ia, struct file *file, loff_t pos,
 	args->zero_copy = ff->open_flags & FOPEN_IO_URING_ZERO_COPY;
 }
 
+void fuse_read_args_fill(struct fuse_io_args *ia, struct file *file, loff_t pos,
+			 size_t count, int opcode)
+{
+	fuse_file_read_args_fill(ia, file->private_data, file->f_flags, pos,
+				 count, opcode);
+}
+
 static void fuse_release_user_pages(struct fuse_args_pages *ap, ssize_t nres,
 				    bool should_dirty)
 {
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 7306493f8a2a..8cde95834570 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -999,6 +999,9 @@ struct fuse_io_args {
 	struct fuse_file *ff;
 };
 
+void fuse_file_read_args_fill(struct fuse_io_args *ia, struct fuse_file *ff,
+			      unsigned int f_flags, loff_t pos, size_t count,
+			      int opcode);
 void fuse_read_args_fill(struct fuse_io_args *ia, struct file *file, loff_t pos,
 			 size_t count, int opcode);
 
diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 77fcfd1c7343..af3446aa30f5 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -42,10 +42,9 @@ void fuse_readdir_names_release(struct fuse_file *ff)
 	ff->readdir.names = NULL;
 }
 
-static void fuse_readdir_names_start(struct file *file)
+static void fuse_readdir_names_start(struct fuse_file *ff,
+				     struct inode *inode)
 {
-	struct fuse_file *ff = file->private_data;
-	struct inode *inode = file_inode(file);
 	struct fuse_dir_names_builder *nb;
 
 	fuse_readdir_names_release(ff);
@@ -60,12 +59,12 @@ static void fuse_readdir_names_start(struct file *file)
 	ff->readdir.names = nb;
 }
 
-static void fuse_readdir_names_collect(struct file *file,
+static void fuse_readdir_names_collect(struct fuse_file *ff,
+				       struct inode *inode,
 				       struct fuse_direntplus *direntplus)
 {
-	struct fuse_file *ff = file->private_data;
 	struct fuse_dir_names_builder *nb = ff->readdir.names;
-	struct fuse_conn *fc = get_fuse_conn(file_inode(file));
+	struct fuse_conn *fc = get_fuse_conn(inode);
 	struct fuse_dirent *dirent = &direntplus->dirent;
 	struct fuse_entry_out *o = &direntplus->entry_out;
 
@@ -106,9 +105,9 @@ static void fuse_readdir_names_collect(struct file *file,
 	fuse_readdir_names_release(ff);
 }
 
-static void fuse_readdir_names_publish(struct file *file)
+static void fuse_readdir_names_publish(struct fuse_file *ff,
+				       struct inode *inode)
 {
-	struct fuse_file *ff = file->private_data;
 	struct fuse_dir_names_builder *nb = ff->readdir.names;
 	struct fuse_dir_names *names;
 	unsigned int i;
@@ -127,7 +126,7 @@ static void fuse_readdir_names_publish(struct file *file)
 		goto out;
 	for (i = 0; i < nb->count; i++)
 		fuse_dir_names_insert(names, nb->hash[i]);
-	fuse_dir_names_publish(file_inode(file), names, nb->gen);
+	fuse_dir_names_publish(inode, names, nb->gen);
 out:
 	fuse_readdir_names_release(ff);
 }
@@ -148,10 +147,10 @@ static bool fuse_use_readdirplus(struct inode *dir, struct dir_context *ctx)
 	return false;
 }
 
-static void fuse_add_dirent_to_cache(struct file *file,
+static void fuse_add_dirent_to_cache(struct inode *inode,
 				     struct fuse_dirent *dirent, loff_t pos)
 {
-	struct fuse_inode *fi = get_fuse_inode(file_inode(file));
+	struct fuse_inode *fi = get_fuse_inode(inode);
 	size_t reclen = FUSE_DIRENT_SIZE(dirent);
 	pgoff_t index;
 	struct folio *folio;
@@ -185,9 +184,9 @@ static void fuse_add_dirent_to_cache(struct file *file,
 	spin_unlock(&fi->rdc.lock);
 
 	if (offset)
-		folio = filemap_lock_folio(file->f_mapping, index);
+		folio = filemap_lock_folio(inode->i_mapping, index);
 	else
-		folio = filemap_grab_folio(file->f_mapping, index);
+		folio = filemap_grab_folio(inode->i_mapping, index);
 	if (IS_ERR(folio))
 		return;
 
@@ -214,9 +213,9 @@ static void fuse_add_dirent_to_cache(struct file *file,
 	folio_put(folio);
 }
 
-static void fuse_readdir_cache_end(struct file *file, loff_t pos)
+static void fuse_readdir_cache_end(struct inode *inode, loff_t pos)
 {
-	struct fuse_inode *fi = get_fuse_inode(file_inode(file));
+	struct fuse_inode *fi = get_fuse_inode(inode);
 	loff_t end;
 
 	spin_lock(&fi->rdc.lock);
@@ -231,23 +230,21 @@ static void fuse_readdir_cache_end(struct file *file, loff_t pos)
 	spin_unlock(&fi->rdc.lock);
 
 	/* truncate unused tail of cache */
-	truncate_inode_pages(file->f_mapping, end);
+	truncate_inode_pages(inode->i_mapping, end);
 }
 
-static bool fuse_emit(struct file *file, struct dir_context *ctx,
-		      struct fuse_dirent *dirent)
+static bool fuse_emit(struct fuse_file *ff, struct inode *inode,
+		      struct dir_context *ctx, struct fuse_dirent *dirent)
 {
-	struct fuse_file *ff = file->private_data;
-
 	if (ff->open_flags & FOPEN_CACHE_DIR)
-		fuse_add_dirent_to_cache(file, dirent, ctx->pos);
+		fuse_add_dirent_to_cache(inode, dirent, ctx->pos);
 
 	return dir_emit(ctx, dirent->name, dirent->namelen, dirent->ino,
 			dirent->type | FILLDIR_FLAG_NOINTR);
 }
 
-static int parse_dirfile(char *buf, size_t nbytes, struct file *file,
-			 struct dir_context *ctx)
+static int parse_dirfile(char *buf, size_t nbytes, struct fuse_file *ff,
+			 struct inode *inode, struct dir_context *ctx)
 {
 	while (nbytes >= FUSE_NAME_OFFSET) {
 		struct fuse_dirent *dirent = (struct fuse_dirent *) buf;
@@ -259,7 +256,7 @@ static int parse_dirfile(char *buf, size_t nbytes, struct file *file,
 		if (memchr(dirent->name, '/', dirent->namelen) != NULL)
 			return -EIO;
 
-		if (!fuse_emit(file, ctx, dirent))
+		if (!fuse_emit(ff, inode, ctx, dirent))
 			break;
 
 		buf += reclen;
@@ -270,13 +267,12 @@ static int parse_dirfile(char *buf, size_t nbytes, struct file *file,
 	return 0;
 }
 
-static int fuse_direntplus_link(struct file *file,
+static int fuse_direntplus_link(struct dentry *parent,
 				struct fuse_direntplus *direntplus,
 				u64 attr_version, u64 evict_ctr)
 {
 	struct fuse_entry_out *o = &direntplus->entry_out;
 	struct fuse_dirent *dirent = &direntplus->dirent;
-	struct dentry *parent = file->f_path.dentry;
 	struct qstr name = QSTR_INIT(dirent->name, dirent->namelen);
 	struct dentry *dentry;
 	struct dentry *alias;
@@ -453,11 +449,12 @@ static void fuse_direntplus_forget(struct inode *dir, struct page **pages,
  * On error, returns in @parsed the offset of the first entry that was not
  * linked.
  */
-static int parse_dirplusfile(char *buf, size_t nbytes, struct file *file,
-			     struct dir_context *ctx, u64 attr_version,
-			     u64 evict_ctr, size_t *parsed)
+static int parse_dirplusfile(char *buf, size_t nbytes, struct fuse_file *ff,
+			     struct dentry *parent, struct dir_context *ctx,
+			     u64 attr_version, u64 evict_ctr, size_t *parsed)
 {
 	char *start = buf;
+	struct inode *inode = d_inode(parent);
 	struct fuse_direntplus *direntplus;
 	struct fuse_dirent *dirent;
 	size_t reclen;
@@ -483,24 +480,25 @@ static int parse_dirplusfile(char *buf, size_t nbytes, struct file *file,
 			   we need to send a FORGET for each of those
 			   which we did not link.
 			*/
-			over = !fuse_emit(file, ctx, dirent);
+			over = !fuse_emit(ff, inode, ctx, dirent);
 			if (!over) {
 				ctx->pos = dirent->off;
 				/*
 				 * Only names the caller takes: the rest of the
 				 * reply is sent again by the next request.
 				 */
-				fuse_readdir_names_collect(file, direntplus);
+				fuse_readdir_names_collect(ff, inode,
+							   direntplus);
 			}
 		}
 
 		buf += reclen;
 		nbytes -= reclen;
 
-		ret = fuse_direntplus_link(file, direntplus, attr_version, evict_ctr);
+		ret = fuse_direntplus_link(parent, direntplus, attr_version,
+					   evict_ctr);
 		if (ret)
-			fuse_force_forget(file_inode(file),
-					  direntplus->entry_out.nodeid);
+			fuse_force_forget(inode, direntplus->entry_out.nodeid);
 	}
 
 	return 0;
@@ -547,86 +545,130 @@ static struct page **fuse_readdir_alloc_buf(struct fuse_args_pages *ap, size_t *
 	return NULL;
 }
 
-static int fuse_readdir_uncached(struct file *file, struct dir_context *ctx)
+/* A READDIR or READDIRPLUS request, with its buffer */
+struct fuse_readdir_args {
+	struct fuse_io_args ia;
+	struct page **pages;
+	bool plus;
+	u64 attr_version;
+	u64 evict_ctr;
+};
+
+/*
+ * Set up the zeroed @ra to read the directory from ctx->pos.  If @complete,
+ * collect a complete listing.  The reply must be passed to
+ * fuse_readdir_args_end(), which frees @ra.
+ */
+static int fuse_readdir_args_init(struct fuse_readdir_args *ra,
+				  struct fuse_file *ff, struct inode *inode,
+				  unsigned int f_flags, struct dir_context *ctx,
+				  bool complete)
 {
-	int plus;
-	ssize_t res;
-	struct fuse_file *ff = file->private_data;
-	struct inode *inode = file_inode(file);
-	struct fuse_mount *fm = get_fuse_mount(inode);
-	struct fuse_conn *fc = fm->fc;
-	bool complete = fc->do_readdirplus &&
-			(ff->open_flags & FOPEN_COMPLETE_DIR);
-	struct fuse_io_args ia = {};
-	struct fuse_args_pages *ap = &ia.ap;
-	void *buf;
+	struct fuse_conn *fc = get_fuse_conn(inode);
 	size_t bufsize = clamp((unsigned int) ctx->count, PAGE_SIZE, fc->max_pages << PAGE_SHIFT);
-	u64 attr_version = 0, evict_ctr = 0;
-	size_t nbytes, parsed = 0;
-	bool locked;
-	struct page **pages = fuse_readdir_alloc_buf(ap, &bufsize);
 
-	if (!pages)
+	ra->pages = fuse_readdir_alloc_buf(&ra->ia.ap, &bufsize);
+	if (!ra->pages)
 		return -ENOMEM;
 
 	if (complete && !ctx->pos)
-		fuse_readdir_names_start(file);
+		fuse_readdir_names_start(ff, inode);
 	else if (ff->readdir.names && ff->readdir.names->pos != ctx->pos)
 		fuse_readdir_names_release(ff);
 
 	/* Collecting needs entry timeouts */
-	plus = (complete && ff->readdir.names) ||
-	       fuse_use_readdirplus(inode, ctx);
-	if (plus) {
-		attr_version = fuse_get_attr_version(fm->fc);
-		evict_ctr = fuse_get_evict_ctr(fm->fc);
-		fuse_read_args_fill(&ia, file, ctx->pos, bufsize, FUSE_READDIRPLUS);
-	} else {
-		fuse_read_args_fill(&ia, file, ctx->pos, bufsize, FUSE_READDIR);
+	ra->plus = (complete && ff->readdir.names) ||
+		   fuse_use_readdirplus(inode, ctx);
+	if (ra->plus) {
+		ra->attr_version = fuse_get_attr_version(fc);
+		ra->evict_ctr = fuse_get_evict_ctr(fc);
 	}
-	locked = fuse_lock_inode(inode);
-	res = fuse_simple_request(fm, &ap->args);
-	fuse_unlock_inode(inode, locked);
+	fuse_file_read_args_fill(&ra->ia, ff, f_flags, ctx->pos, bufsize,
+				 ra->plus ? FUSE_READDIRPLUS : FUSE_READDIR);
+	return 0;
+}
+
+/*
+ * Process the result @res of the request in @ra, and free @ra.  Called with
+ * the directory locked shared.
+ */
+static int fuse_readdir_args_end(struct fuse_readdir_args *ra,
+				 struct fuse_file *ff, struct dentry *dentry,
+				 struct dir_context *ctx, ssize_t res, bool *eof)
+{
+	struct inode *inode = d_inode(dentry);
+	struct fuse_args_pages *ap = &ra->ia.ap;
+	size_t nbytes, parsed = 0;
+	void *buf;
+
+	*eof = false;
 	if (res < 0)
 		goto out;
 
 	if (!res) {
+		*eof = true;
 		if (ff->open_flags & FOPEN_CACHE_DIR)
-			fuse_readdir_cache_end(file, ctx->pos);
-		fuse_readdir_names_publish(file);
+			fuse_readdir_cache_end(inode, ctx->pos);
+		fuse_readdir_names_publish(ff, inode);
 		goto out;
 	}
 
 	nbytes = res;
-	buf = vm_map_ram(pages, ap->num_folios, -1);
+	buf = vm_map_ram(ra->pages, ap->num_folios, -1);
 	if (!buf) {
 		res = -ENOMEM;
 	} else {
-		if (plus)
-			res = parse_dirplusfile(buf, nbytes, file, ctx, attr_version,
-						evict_ctr, &parsed);
+		if (ra->plus)
+			res = parse_dirplusfile(buf, nbytes, ff, dentry, ctx,
+						ra->attr_version, ra->evict_ctr,
+						&parsed);
 		else
-			res = parse_dirfile(buf, nbytes, file, ctx);
+			res = parse_dirfile(buf, nbytes, ff, inode, ctx);
 
 		vm_unmap_ram(buf, ap->num_folios);
 	}
 	/* The server took lookup references also for entries not linked */
-	if (plus && res < 0)
-		fuse_direntplus_forget(inode, pages, parsed, nbytes);
+	if (ra->plus && res < 0)
+		fuse_direntplus_forget(inode, ra->pages, parsed, nbytes);
 	if (!res && ff->readdir.names)
 		ff->readdir.names->pos = ctx->pos;
 out:
 	if (res < 0)
 		fuse_readdir_names_release(ff);
 	kfree(ap->folios);
-	release_pages(pages, ap->num_folios);
-	kfree(pages);
+	release_pages(ra->pages, ap->num_folios);
+	kfree(ra->pages);
 
 	fuse_invalidate_atime(inode);
 
 	return res;
 }
 
+static int fuse_readdir_uncached(struct file *file, struct dir_context *ctx)
+{
+	struct fuse_file *ff = file->private_data;
+	struct inode *inode = file_inode(file);
+	struct fuse_conn *fc = get_fuse_conn(inode);
+	bool complete = fc->do_readdirplus &&
+			(ff->open_flags & FOPEN_COMPLETE_DIR);
+	struct fuse_readdir_args ra = {};
+	ssize_t res;
+	bool locked, eof;
+	int err;
+
+	err = fuse_readdir_args_init(&ra, ff, inode, file->f_flags, ctx,
+				     complete);
+	if (err)
+		return err;
+
+	locked = fuse_lock_inode(inode);
+	res = fuse_simple_request(get_fuse_mount(inode), &ra.ia.ap.args);
+	fuse_unlock_inode(inode, locked);
+
+	return fuse_readdir_args_end(&ra, ff, file->f_path.dentry, ctx, res,
+				     &eof);
+}
+
 enum fuse_parse_result {
 	FOUND_ERR = -1,
 	FOUND_NONE = 0,
-- 
2.56.0

