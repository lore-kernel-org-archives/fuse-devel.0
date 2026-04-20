Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EA33876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723531; cv=none; b=Oqz0bijdzkmOpAL6wL5HjR19SCfAMO1NlAV6glTNjQTVFmEWKvBkbqBu0l8XycRYN1Rd/3KX7DhuRrY/P75gcRdrylD3bqrtDJGcyWCimyxzMC4Mdx6Hk6+kfSmmIEC8CYp3FjpqLqz6nBaHkzN6+TODPCD8RY0uUlOZ01oYtyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723531; c=relaxed/simple;
	bh=VnyBLSkbcH+0osWagxP7aihciEXY4PKUXx1xD/0fQOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BT6wmFSBSidmvkAZeVDj3CCSbJOjaiXTQG/1dWHG4sksmi6GYSN3QUm5SWdMs/aFQajirNxzH8Cx7Rb52BrXSHqpy1METolHL1lKJZzGw9yEhdUt/LI8rlRF53393XNzeP2acSnAQMPHcP/QEoLyZZDV34qDzRX0eRHJTiQooZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+G4fAKn; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+G4fAKn"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so3329633a91.2
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723529; x=1777328329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsQgXzivEggXn0KR94kaQL4Z27pvtl62YDkCBp8N0OE=;
        b=e+G4fAKn1a364UJznd0Civ0j1pX1JW+9PWAckb8qiP/S8Z/WZqZyFvfq6x+hBt7rEL
         HPSgaWyiJvzVeLH3Xscm/mu0GN7eystty7Oslt97NB2Eon2rZ3VYwiel3i3kbBYpzOhU
         /SPVLvTPP0xOIq2rYqVq6uQsRic0qYzJStQgNASDyUobsfHscSOLWolRaBpavUhExQuc
         bJYVK+JlqEA9h3Pprs0mrim6hNLbLU8DkPfJR3KsS+9nNc4y+rqzjeNfIqxTt3og+T6H
         bCwq87SHPxucqJfW6D8Ge+lmOCFS94f9CTGLeJfn/NeVv4SE2X/D01PcpnMHqzFxoDhj
         44iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723529; x=1777328329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HsQgXzivEggXn0KR94kaQL4Z27pvtl62YDkCBp8N0OE=;
        b=pvJnIIQIcpbXVf5ncluorbeMgUvILNYpCJSlnmVSVg6bS4I1obmpGCnN0pn/y1Tp0Q
         vFUpp0e4ZZkzx4QOD2M0JbrG/Z6KAkY7mJuJcbKbTgkWnLQ0ApSCv59XHk45g5mmZqzj
         jJjEcW9HfILS6cQ7nxw/6M5n17j22YubJetQu9dVC3iv7JqPCGt+3TR5+6Owk54l/g8e
         D/qGfSjHZEn/5sHDfDMFyW7wnHsgfT/rN962DHt9/uK/2ZM2wJqbGCQ7qulhwkh3F1i2
         Y9decuw5mu7lOW8V6KKpLv9MQPA3Yk1st2w0yYH3+CCxodIhR4jsvrOKTk+flSllzSKC
         9b/w==
X-Forwarded-Encrypted: i=1; AFNElJ+z2b4C53yRyu8Z+BIKVg1fFyUVJhs5P8Z8JAbtQpsGQMJzcTXphaFkSQFGthyn67x+UGOk3enibnnW@lists.linux.dev
X-Gm-Message-State: AOJu0YwBfiAADOZs7ZrD8Swec148TxnepUHoXPJW9HZ0bmdSinOEyVrY
	iGmKxGG4AStl8zr04hZFXiYq7LFsqAKAIXh53t0Ff8DUyvFUMVF82Nwhjhp7cw==
X-Gm-Gg: AeBDietG4F6PUCfuvanlUPt435riA+WCK1BPy2adfDo0qHzik5CxZFSnnIKJKU6mI2d
	FBh3k2y818p9sR0c/90/EgDgzeqUGVANGzM1+1g7eA+0VPHSo2NNbBGHS/H6q/NYZmVzFx/DtTt
	32vPyvuxzIPX1kqBXoFHQA/R8Av+9tQHeYoMEPCj6NLY75alvIcql375YhLOHllzi78cqFs6pNK
	NmJ0yDPuJZxHsey+cN+MPlBJxJ5HMYO1MXT+K+1aopVs2wBDitaO+CVkZyBg1xTrJpFzvhyPvV2
	6OGSLYtxuTBjcgLKD1E2bOtUkHIR3fqrjKPfsuQCCfqkVCG2GIKiuVSg5vyPkuTKS7/YU5SisF2
	gwD5goP2jbf+SKrh05vn45EPeFUaeU2zKtqCNyJpMfXxb+oJkUgI/IyscduHr8CBInq3MWV2RXt
	WCJVPKqp6nocvPBfd65wObC08YcYel
X-Received: by 2002:a17:903:3dc9:b0:2b2:ecc6:5e28 with SMTP id d9443c01a7336-2b5f9f4e8e6mr118202435ad.25.1776723529263;
        Mon, 20 Apr 2026 15:18:49 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:71::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3c067sm113837715ad.76.2026.04.20.15.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:48 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 10/17] fuse: add struct fuse_entry2_out and helpers for extended entry replies
Date: Mon, 20 Apr 2026 15:16:30 -0700
Message-ID: <20260420221637.2631478-11-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260420221637.2631478-1-joannelkoong@gmail.com>
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add struct fuse_entry2_out, which is a new extended entry reply struct
that carries a backing_id and statx attributes. This will be necessary
for setting fuse passthrough on inodes.

Add helpers that subsequent commits will use to process fuse_entry2_out
for passthrough support for lookup, revalidate, and create.
fuse_statx_to_attr() is also moved to earlier in the file to avoid
forward declaring.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c             | 119 ++++++++++++++++++++++++++++++--------
 fs/fuse/fuse_i.h          |   5 ++
 include/uapi/linux/fuse.h |  14 +++++
 3 files changed, 113 insertions(+), 25 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 94ab05cb89ce..0eacfef52164 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -354,9 +354,9 @@ static void fuse_invalidate_entry(struct dentry *entry)
 	fuse_invalidate_entry_cache(entry);
 }
 
-static void fuse_lookup_init(struct fuse_args *args, u64 nodeid,
-			     const struct qstr *name,
-			     struct fuse_entry_out *outarg)
+static void fuse_lookup_init_simple(struct fuse_args *args, u64 nodeid,
+				    const struct qstr *name,
+				    struct fuse_entry_out *outarg)
 {
 	memset(outarg, 0, sizeof(struct fuse_entry_out));
 	args->opcode = FUSE_LOOKUP;
@@ -372,6 +372,95 @@ static void fuse_lookup_init(struct fuse_args *args, u64 nodeid,
 	args->out_args[0].value = outarg;
 }
 
+static __maybe_unused void fuse_lookup_init(struct fuse_conn *fc,
+					    struct fuse_args *args,
+					    u64 nodeid, const struct qstr *name,
+					    struct fuse_entry_out *outarg,
+					    struct fuse_entry2_out *outarg2)
+{
+	bool use_entry2 = fuse_use_entry2(fc);
+
+	if (use_entry2)
+		memset(outarg2, 0, sizeof(struct fuse_entry2_out));
+	else
+		memset(outarg, 0, sizeof(struct fuse_entry_out));
+
+	args->opcode = FUSE_LOOKUP;
+	args->nodeid = nodeid;
+	args->in_numargs = 3;
+	fuse_set_zero_arg0(args);
+	args->in_args[1].size = name->len;
+	args->in_args[1].value = name->name;
+	args->in_args[2].size = 1;
+	args->in_args[2].value = "";
+	args->out_numargs = 1;
+
+	if (use_entry2) {
+		args->out_args[0].size = sizeof(struct fuse_entry2_out);
+		args->out_args[0].value = outarg2;
+	} else {
+		args->out_args[0].size = sizeof(struct fuse_entry_out);
+		args->out_args[0].value = outarg;
+	}
+}
+
+static void fuse_statx_to_attr(struct fuse_statx *sx, struct fuse_attr *attr)
+{
+	memset(attr, 0, sizeof(*attr));
+	attr->ino = sx->ino;
+	attr->size = sx->size;
+	attr->blocks = sx->blocks;
+	attr->atime = sx->atime.tv_sec;
+	attr->mtime = sx->mtime.tv_sec;
+	attr->ctime = sx->ctime.tv_sec;
+	attr->atimensec = sx->atime.tv_nsec;
+	attr->mtimensec = sx->mtime.tv_nsec;
+	attr->ctimensec = sx->ctime.tv_nsec;
+	attr->mode = sx->mode;
+	attr->nlink = sx->nlink;
+	attr->uid = sx->uid;
+	attr->gid = sx->gid;
+	attr->rdev = new_encode_dev(MKDEV(sx->rdev_major, sx->rdev_minor));
+	attr->blksize = sx->blksize;
+}
+
+static void fuse_entry2_to_entry(struct fuse_entry2_out *outarg2,
+				 struct fuse_entry_out *outarg)
+{
+	memset(outarg, 0, sizeof(struct fuse_entry_out));
+	outarg->nodeid = outarg2->nodeid;
+	outarg->generation = outarg2->generation;
+	outarg->entry_valid = outarg2->entry_valid;
+	outarg->attr_valid = outarg2->attr_valid;
+	outarg->entry_valid_nsec = outarg2->entry_valid_nsec;
+	outarg->attr_valid_nsec = outarg2->attr_valid_nsec;
+	fuse_statx_to_attr(&outarg2->statx, &outarg->attr);
+}
+
+static __maybe_unused int fuse_process_entry2(struct fuse_conn *fc,
+					      struct fuse_entry2_out *outarg2,
+					      struct fuse_entry_out *outarg,
+					      struct fuse_statx **sxp)
+{
+	if (!fuse_use_entry2(fc))
+		return 0;
+
+	fuse_entry2_to_entry(outarg2, outarg);
+
+	/* error */
+	if (outarg2->backing_id < 0)
+		return outarg2->backing_id;
+
+	/*
+	 * If passthrough is enabled (backing_id > 0), statx attributes are not
+	 * cached because passthrough getattr fetches them directly from the
+	 * backing inode
+	 */
+	if (!outarg2->backing_id)
+		*sxp = &outarg2->statx;
+	return outarg2->backing_id;
+}
+
 /*
  * Check whether the dentry is still valid
  *
@@ -421,7 +510,7 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 
 		attr_version = fuse_get_attr_version(fm->fc);
 
-		fuse_lookup_init(&args, get_node_id(dir), name, &outarg);
+		fuse_lookup_init_simple(&args, get_node_id(dir), name, &outarg);
 		ret = fuse_simple_request(fm, &args);
 		/* Zero nodeid is same as -ENOENT */
 		if (!ret && !outarg.nodeid)
@@ -574,7 +663,7 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 	attr_version = fuse_get_attr_version(fm->fc);
 	evict_ctr = fuse_get_evict_ctr(fm->fc);
 
-	fuse_lookup_init(&args, nodeid, name, outarg);
+	fuse_lookup_init_simple(&args, nodeid, name, outarg);
 	err = fuse_simple_request(fm, &args);
 	/* Zero nodeid is same as -ENOENT, but with valid timeout */
 	if (err || !outarg->nodeid)
@@ -1394,26 +1483,6 @@ static void fuse_fillattr(struct mnt_idmap *idmap, struct inode *inode,
 	stat->blksize = 1 << blkbits;
 }
 
-static void fuse_statx_to_attr(struct fuse_statx *sx, struct fuse_attr *attr)
-{
-	memset(attr, 0, sizeof(*attr));
-	attr->ino = sx->ino;
-	attr->size = sx->size;
-	attr->blocks = sx->blocks;
-	attr->atime = sx->atime.tv_sec;
-	attr->mtime = sx->mtime.tv_sec;
-	attr->ctime = sx->ctime.tv_sec;
-	attr->atimensec = sx->atime.tv_nsec;
-	attr->mtimensec = sx->mtime.tv_nsec;
-	attr->ctimensec = sx->ctime.tv_nsec;
-	attr->mode = sx->mode;
-	attr->nlink = sx->nlink;
-	attr->uid = sx->uid;
-	attr->gid = sx->gid;
-	attr->rdev = new_encode_dev(MKDEV(sx->rdev_major, sx->rdev_minor));
-	attr->blksize = sx->blksize;
-}
-
 void fuse_kstat_to_attr(struct fuse_conn *fc, const struct kstat *stat,
 			struct fuse_attr *attr)
 {
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index e422d3dc2202..daf7b664e1b9 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1684,6 +1684,11 @@ static inline bool fuse_inode_passthrough_op(struct inode *inode,
 int fuse_passthrough_getattr(struct inode *inode, struct kstat *stat,
 			     u32 request_mask, unsigned int flags);
 
+static inline bool fuse_use_entry2(struct fuse_conn *fc)
+{
+	return fc->passthrough_ino;
+}
+
 #ifdef CONFIG_SYSCTL
 extern int fuse_sysctl_register(void);
 extern void fuse_sysctl_unregister(void);
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 6404ed95c758..3963631558f9 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -244,6 +244,7 @@
  *  7.46
  *  - add FUSE_PASSTHROUGH_INO
  *  - add ops_mask field to struct fuse_backing_map
+ *  - add fuse_entry2_out
  */
 
 #ifndef _LINUX_FUSE_H
@@ -705,6 +706,19 @@ struct fuse_entry_out {
 	struct fuse_attr attr;
 };
 
+struct fuse_entry2_out {
+	uint64_t	nodeid;
+	uint64_t	generation;
+	uint64_t	entry_valid;
+	uint64_t	attr_valid;
+	uint32_t	entry_valid_nsec;
+	uint32_t	attr_valid_nsec;
+	int32_t		backing_id;
+	uint32_t	flags;
+	uint64_t	reserved;
+	struct fuse_statx statx;
+};
+
 struct fuse_forget_in {
 	uint64_t	nlookup;
 };
-- 
2.52.0

