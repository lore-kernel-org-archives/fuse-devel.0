Received: from smtp02-ext3.udag.de (smtp02-ext3.udag.de [62.146.106.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1393C2B95
	for <fuse-devel@lists.linux.dev>; Thu,  4 Jun 2026 09:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566382; cv=none; b=iA5QoQkT6dvN9oPgOZ5pE1kt9cFTRqk/TStoRaT2jqn11FKtfgzSospw0BOOuUJpulPXleugH1HN7oRY+DNT2hY2nXGfomtEu5xTVmTB4xVPuAXW5aeqoM6LX6McSstPrUA+T12Y11UAug09OtF1o9jfdLezJ5sDPa+pUwWx8x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566382; c=relaxed/simple;
	bh=AqyUfgZZlsS6/eTHdH//5yUL1hczxMwgCooZdfyolQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gNwZryk5yd4du5ZFCYbLzLTkrJ244M/ucuIMdtW+8QkK/KA61XIOE+tSYfB+syZ/sPLBQPRM0aKZCa0e4LUUpIQE8NLyJgP8gL03F6VMjlskzSVHjxYuXktk9KVEZ7GLXFzLMJUO0hdGb3WqCdBGe8tja69xc6hsuroXdFSNEzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.com; spf=pass smtp.mailfrom=birthelmer.com; dkim=pass (2048-bit key) header.d=birthelmer.com header.i=@birthelmer.com header.b=Db9HJdTu; arc=none smtp.client-ip=62.146.106.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birthelmer.com header.i=@birthelmer.com header.b="Db9HJdTu"
Received: from fedora.fritz.box (065-142-067-156.ip-addr.inexio.net [156.67.142.65])
	by smtp02-ext3.udag.de (Postfix) with ESMTPA id 888D8E0403;
	Thu,  4 Jun 2026 11:46:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=birthelmer.com;
	s=uddkim-202310; t=1780566371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lMuTmFW5r599WNvlY21ci1uqO+sTbZsvcCQXc9MkK/c=;
	b=Db9HJdTu1b5wHFSYQuOcPLaW2byTF4PPfPgEONZXkP6seO0cPM21yJj2BNgePYe4KTzH+1
	ICF84bhR0RkN2Fak/tv9+GP2RxiOtWkWvuaYPv+fv7VJh9rnwYMgv2NHosQy42ZaqMQIAx
	uyWEYWxjbf8OvMYE3Rff4wiKsM5hc1XDf7IKemUv4+og9iiHLiJSplmNnbOyxwEVpdp0/p
	gWBx2Ox/5rb3L1s6D4XhYs96V6mYQZg1GWII85q+DeP04Do3DvDymbCyBr1OX/1cT1RM1w
	zRYORaqySPziHo9nzA4U6ZxmiAEYKIkXcTea8Jsy3w5h4tdb55Nf4BXlVs/CTA==
Authentication-Results: smtp02-ext3.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.com
From: Horst Birthelmer <horst@birthelmer.com>
Date: Thu, 04 Jun 2026 11:45:44 +0200
Subject: [PATCH v7 3/4] fuse: add an implementation of open+getattr
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-fuse-compounds-upstream-v7-3-27331d085c2a@ddn.com>
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
In-Reply-To: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
 Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>
Cc: linux-kernel@vger.kernel.org, fuse-devel@lists.linux.dev, 
 Horst Birthelmer <hbirthelmer@ddn.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780566367; l=4926;
 i=hbirthelmer@ddn.com; s=20251006; h=from:subject:message-id;
 bh=6af5hNwMWG0GIEHjaQTxHaE+gWa2QypMDLzCwtERvU0=;
 b=lDHZY+dYkMFPfpyGT3E5v3DIJjCD8geSvqnRgv18I0bLakRTKwD7j/YEbxMVSQ8TZQ2tn1TMH
 B16xFECVJ1mBv7ZYdWRl3MxhtvJAl/ckDwK7u+jpiHwG5J2WCCBPCsw
X-Developer-Key: i=hbirthelmer@ddn.com; a=ed25519;
 pk=v3BVDFoy16EzgHZ23ObqW+kbpURtjrwxgKu8YNDKjGg=

From: Horst Birthelmer <hbirthelmer@ddn.com>

Fix the issue described here:
https://lore.kernel.org/all/20240813212149.1909627-1-joannelkoong@gmail.com/

When appending to a file or having stale attributes
we can use a compound to open the file and retrieve
the attributes.

Signed-off-by: Horst Birthelmer <hbirthelmer@ddn.com>
---
 fs/fuse/file.c   | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++---
 fs/fuse/fuse_i.h |  1 +
 fs/fuse/ioctl.c  |  2 +-
 3 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index a7d602225f45..0a47d50c293b 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -144,8 +144,56 @@ static void fuse_file_put(struct fuse_file *ff, bool sync)
 	}
 }
 
+static int fuse_compound_open_getattr(struct fuse_mount *fm, u64 nodeid,
+				      struct inode *inode,
+				      unsigned int open_flags, int opcode,
+				      struct fuse_open_out *outopenp)
+{
+	struct fuse_attr_out attr_outarg = {};
+	struct fuse_args open_args = {};
+	struct fuse_args getattr_args = {};
+	struct fuse_open_in open_in = {};
+	struct fuse_getattr_in getattr_in = {};
+	int open_error = 0, getattr_error = 0;
+	struct fuse_compound_op ops[2] = {
+		{ .arg = &open_args,    .error = &open_error,
+		  .dep_index = FUSE_COMPOUND_NO_DEP },
+		{ .arg = &getattr_args, .error = &getattr_error,
+		  .dep_index = FUSE_COMPOUND_NO_DEP },
+	};
+	int err;
+
+	fuse_open_args_fill(fm, &open_args, nodeid, opcode, open_flags,
+			    &open_in, outopenp);
+	fuse_getattr_args_fill(&getattr_args, nodeid, &getattr_in, &attr_outarg);
+
+	err = fuse_compound_send(fm, ops, 2);
+	if (err)
+		return err;
+
+	/*
+	 * Open succeeded if open_error == 0; the getattr part is best
+	 * effort.  If the server returned invalid or wrong-type attrs as
+	 * part of the compound, mark the inode bad (matching fuse_do_getattr)
+	 * but do not fail the open -- otherwise we would leak the just-
+	 * acquired file handle on the server side.
+	 */
+	if (!getattr_error) {
+		if (fuse_invalid_attr(&attr_outarg.attr) ||
+		    inode_wrong_type(inode, attr_outarg.attr.mode))
+			fuse_make_bad(inode);
+		else
+			fuse_change_attributes(inode, &attr_outarg.attr, NULL,
+					       ATTR_TIMEOUT(&attr_outarg),
+					       fuse_get_attr_version(fm->fc));
+	}
+
+	return open_error;
+}
+
 struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
-				 unsigned int open_flags, bool isdir)
+				struct inode *inode,
+				unsigned int open_flags, bool isdir)
 {
 	struct fuse_conn *fc = fm->fc;
 	struct fuse_file *ff;
@@ -171,9 +219,25 @@ struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
 	if (open) {
 		/* Store outarg for fuse_finish_open() */
 		struct fuse_open_out *outargp = &ff->args->open_outarg;
+		bool try_compound = false;
 		int err;
 
-		err = fuse_send_open(fm, nodeid, open_flags, opcode, outargp);
+		if (inode) {
+			struct fuse_inode *fi = get_fuse_inode(inode);
+
+			try_compound = (open_flags & O_APPEND) ||
+				time_before64(fi->i_time, get_jiffies_64()) ||
+				(fi->inval_mask & STATX_BASIC_STATS);
+		}
+
+		if (try_compound)
+			err = fuse_compound_open_getattr(fm, nodeid, inode,
+							 open_flags, opcode,
+							 outargp);
+		else
+			err = fuse_send_open(fm, nodeid, open_flags, opcode,
+					     outargp);
+
 		if (!err) {
 			ff->fh = outargp->fh;
 			ff->open_flags = outargp->open_flags;
@@ -203,7 +267,8 @@ struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
 int fuse_do_open(struct fuse_mount *fm, u64 nodeid, struct file *file,
 		 bool isdir)
 {
-	struct fuse_file *ff = fuse_file_open(fm, nodeid, file->f_flags, isdir);
+	struct fuse_file *ff = fuse_file_open(fm, nodeid, file_inode(file),
+					      file->f_flags, isdir);
 
 	if (!IS_ERR(ff))
 		file->private_data = ff;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 219312d5f21e..2017908de35e 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1580,6 +1580,7 @@ void fuse_file_io_release(struct fuse_file *ff, struct inode *inode);
 
 /* file.c */
 struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
+				 struct inode *inode,
 				 unsigned int open_flags, bool isdir);
 void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 		       unsigned int open_flags, fl_owner_t id, bool isdir);
diff --git a/fs/fuse/ioctl.c b/fs/fuse/ioctl.c
index fdc175e93f74..07a02e47b2c3 100644
--- a/fs/fuse/ioctl.c
+++ b/fs/fuse/ioctl.c
@@ -494,7 +494,7 @@ static struct fuse_file *fuse_priv_ioctl_prepare(struct inode *inode)
 	if (!S_ISREG(inode->i_mode) && !isdir)
 		return ERR_PTR(-ENOTTY);
 
-	return fuse_file_open(fm, get_node_id(inode), O_RDONLY, isdir);
+	return fuse_file_open(fm, get_node_id(inode), NULL, O_RDONLY, isdir);
 }
 
 static void fuse_priv_ioctl_cleanup(struct inode *inode, struct fuse_file *ff)

-- 
2.54.0

