Received: from smtp02-ext3.udag.de (smtp02-ext3.udag.de [62.146.106.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0A03C2768
	for <fuse-devel@lists.linux.dev>; Thu,  4 Jun 2026 09:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566383; cv=none; b=OxstJQRm5zcSzx8UB4zuY2T92HogPG/RCmajUAFiCLCJ1mxaiwwUtPhl//X0ROPWV9e60c/e105kaZrGCz3Yngg7CA5bxtmiwh0bIC7WyQuan9F9xyZANMUjAE/cN6AgwHgyg9nqdOh1J5k5jmO4DV21lCtHUh0gzGlNeMJKdEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566383; c=relaxed/simple;
	bh=/jOUuE8A827fdgh0IwjfkmQUwDq72aMWzDur6/M5Nxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hGafHYPXyKX+ZaZ/75b75CzOLr6+YUpF91ihK51EYbgjx2zJcMzMmdsI7yi1jeNxZHz5pQSxby/7iclkoVfq7THuNehV0gLmJP+rZZ1UT6cHW5yb0EjksU+fhlEuxwE8jBCrmFFSKlnmNIOGIwv/RKAThEJgisvf4iMUXMX6tsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.com; spf=pass smtp.mailfrom=birthelmer.com; dkim=pass (2048-bit key) header.d=birthelmer.com header.i=@birthelmer.com header.b=KPQ9mBYD; arc=none smtp.client-ip=62.146.106.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birthelmer.com header.i=@birthelmer.com header.b="KPQ9mBYD"
Received: from fedora.fritz.box (065-142-067-156.ip-addr.inexio.net [156.67.142.65])
	by smtp02-ext3.udag.de (Postfix) with ESMTPA id B744CE05AC;
	Thu,  4 Jun 2026 11:46:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=birthelmer.com;
	s=uddkim-202310; t=1780566371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JjIvc08CQzM3YhafcvZd048VbZJEJMd2z8bQM4fbVk0=;
	b=KPQ9mBYDw90Cwaiq/eO3PwgtbhcSJEToC7zsy+Vpg2t4xTRzMDqiXaJWpoGqOZi/CRGL6A
	tQWcKFh+e60DQ80wK+TRmS15Des1mRY2TrmkKPQ7LP5iAIVdcI1xBL7H6kOIf8n4bhSQlf
	EGtUnq7/VDAypZ4Dm3GAbmiLAa5FSW6oQnEu4txEhuoTF5DbGAW//AOtZgWgrO/n7NJbWE
	HCHBRpyhsuB+pIzMsqTIsy4IF1VC3tF0xrTX8D/EurLqQW8q/vTsG72JwA56j82XRyNeUG
	E3oGV+6QJTegND1/UfEC+5MN8An8DEBVn2XgYjkHaFw1UHCnUq5YxEb9/bPJvA==
Authentication-Results: smtp02-ext3.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.com
From: Horst Birthelmer <horst@birthelmer.com>
Date: Thu, 04 Jun 2026 11:45:43 +0200
Subject: [PATCH v7 2/4] fuse: create helper functions for filling in fuse
 args for open and getattr
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-fuse-compounds-upstream-v7-2-27331d085c2a@ddn.com>
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
In-Reply-To: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
 Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>
Cc: linux-kernel@vger.kernel.org, fuse-devel@lists.linux.dev, 
 Horst Birthelmer <hbirthelmer@ddn.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780566367; l=4707;
 i=hbirthelmer@ddn.com; s=20251006; h=from:subject:message-id;
 bh=dTYbeJXdiN8bAxaQBlu5xp2dPQ272w4b4WKdf5qCz/A=;
 b=KY8wds4adfF1yBeLx7TW7cjYATy54TI7dL2IYp3Lunh9rhd8ymwRDsBGdI1aPzJfVk8wJF/mn
 Geq2Rp8jrFWCNBgp7WxQuLSH9p2ncT/UclHHBS5XYtrUr2vqWevGNN2
X-Developer-Key: i=hbirthelmer@ddn.com; a=ed25519;
 pk=v3BVDFoy16EzgHZ23ObqW+kbpURtjrwxgKu8YNDKjGg=

From: Horst Birthelmer <hbirthelmer@ddn.com>

create fuse_getattr_args_fill() and fuse_open_args_fill() to fill in
the parameters for the open and getattr calls.

This is in preparation for implementing open+getattr and does not
represent any functional change.

Suggested-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: Horst Birthelmer <hbirthelmer@ddn.com>
---
 fs/fuse/dir.c    | 26 ++++++++++++++++++--------
 fs/fuse/file.c   | 44 ++++++++++++++++++++++++++++----------------
 fs/fuse/fuse_i.h |  6 ++++++
 3 files changed, 52 insertions(+), 24 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index b658b6baf72f..b3406c33abd2 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1475,6 +1475,23 @@ static int fuse_do_statx(struct mnt_idmap *idmap, struct inode *inode,
 	return 0;
 }
 
+/*
+ * Helper function to initialize fuse_args for GETATTR operations
+ */
+void fuse_getattr_args_fill(struct fuse_args *args, u64 nodeid,
+			    struct fuse_getattr_in *inarg,
+			    struct fuse_attr_out *outarg)
+{
+	args->opcode = FUSE_GETATTR;
+	args->nodeid = nodeid;
+	args->in_numargs = 1;
+	args->in_args[0].size = sizeof(*inarg);
+	args->in_args[0].value = inarg;
+	args->out_numargs = 1;
+	args->out_args[0].size = sizeof(*outarg);
+	args->out_args[0].value = outarg;
+}
+
 static int fuse_do_getattr(struct mnt_idmap *idmap, struct inode *inode,
 			   struct kstat *stat, struct file *file)
 {
@@ -1496,14 +1513,7 @@ static int fuse_do_getattr(struct mnt_idmap *idmap, struct inode *inode,
 		inarg.getattr_flags |= FUSE_GETATTR_FH;
 		inarg.fh = ff->fh;
 	}
-	args.opcode = FUSE_GETATTR;
-	args.nodeid = get_node_id(inode);
-	args.in_numargs = 1;
-	args.in_args[0].size = sizeof(inarg);
-	args.in_args[0].value = &inarg;
-	args.out_numargs = 1;
-	args.out_args[0].size = sizeof(outarg);
-	args.out_args[0].value = &outarg;
+	fuse_getattr_args_fill(&args, get_node_id(inode), &inarg, &outarg);
 	err = fuse_simple_request(fm, &args);
 	if (!err) {
 		if (fuse_invalid_attr(&outarg.attr) ||
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index f94f3dc082c6..a7d602225f45 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -23,6 +23,33 @@
 #include <linux/task_io_accounting_ops.h>
 #include <linux/iomap.h>
 
+/*
+ * Helper function to initialize fuse_args for OPEN/OPENDIR operations
+ */
+static void fuse_open_args_fill(struct fuse_mount *fm, struct fuse_args *args,
+				u64 nodeid, int opcode, unsigned int open_flags,
+				struct fuse_open_in *inarg,
+				struct fuse_open_out *outarg)
+{
+	inarg->flags = open_flags & ~(O_CREAT | O_EXCL | O_NOCTTY);
+
+	if (!fm->fc->atomic_o_trunc)
+		inarg->flags &= ~O_TRUNC;
+
+	if (fm->fc->handle_killpriv_v2 &&
+	    (inarg->flags & O_TRUNC) && !capable(CAP_FSETID))
+		inarg->open_flags |= FUSE_OPEN_KILL_SUIDGID;
+
+	args->opcode = opcode;
+	args->nodeid = nodeid;
+	args->in_numargs = 1;
+	args->in_args[0].size = sizeof(*inarg);
+	args->in_args[0].value = inarg;
+	args->out_numargs = 1;
+	args->out_args[0].size = sizeof(*outarg);
+	args->out_args[0].value = outarg;
+}
+
 static int fuse_send_open(struct fuse_mount *fm, u64 nodeid,
 			  unsigned int open_flags, int opcode,
 			  struct fuse_open_out *outargp)
@@ -31,23 +58,8 @@ static int fuse_send_open(struct fuse_mount *fm, u64 nodeid,
 	FUSE_ARGS(args);
 
 	memset(&inarg, 0, sizeof(inarg));
-	inarg.flags = open_flags & ~(O_CREAT | O_EXCL | O_NOCTTY);
-	if (!fm->fc->atomic_o_trunc)
-		inarg.flags &= ~O_TRUNC;
-
-	if (fm->fc->handle_killpriv_v2 &&
-	    (inarg.flags & O_TRUNC) && !capable(CAP_FSETID)) {
-		inarg.open_flags |= FUSE_OPEN_KILL_SUIDGID;
-	}
 
-	args.opcode = opcode;
-	args.nodeid = nodeid;
-	args.in_numargs = 1;
-	args.in_args[0].size = sizeof(inarg);
-	args.in_args[0].value = &inarg;
-	args.out_numargs = 1;
-	args.out_args[0].size = sizeof(*outargp);
-	args.out_args[0].value = outargp;
+	fuse_open_args_fill(fm, &args, nodeid, opcode, open_flags, &inarg, outargp);
 
 	return fuse_simple_request(fm, &args);
 }
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index af4ea2af19d1..219312d5f21e 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1181,6 +1181,12 @@ struct fuse_io_args {
 void fuse_read_args_fill(struct fuse_io_args *ia, struct file *file, loff_t pos,
 			 size_t count, int opcode);
 
+/*
+ * Helper functions to initialize fuse_args for common operations
+ */
+void fuse_getattr_args_fill(struct fuse_args *args, u64 nodeid,
+			    struct fuse_getattr_in *inarg,
+			    struct fuse_attr_out *outarg);
 
 struct fuse_file *fuse_file_alloc(struct fuse_mount *fm, bool release);
 void fuse_file_free(struct fuse_file *ff);

-- 
2.54.0

