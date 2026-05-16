Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02EA22F01
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892770; cv=none; b=YED7WnRrC3ixvD2FNvStFqn2hHykDvAt/i/OHYaNbZPMbcTQC/58I0MclXEKcF43Yh5HbPK6+y8m3PuQA8jpOQqtKGlsRwzldX9MeGEiSF42XnQ47TjyGtOxrJQ/zlWtbCX/FR3QIKK3d+ltNyz9qeeNWh5qHwC1aPuDQ0CSa9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892770; c=relaxed/simple;
	bh=IKE2ECzuZoeIlo1qCugbDvxgsChcKtb3wsZTlzTiKyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGgCUaMzcMvVMMbrZolEF2OoG8emoGo+cG8/555KB+KkqO0jXUC4rrb5iPjq/Lt2HfROkhoNkP0nOPLQLtWgKWN9Ks4yG5s7pQbCxGvzBPiG9hq3+1bFtl1wNwHB2bhjcx8mZZun2OQcFEqWCoae57J/BAg1kJADUHIvg6mnf9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSpwep0o; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSpwep0o"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7bdf83185bbso506077b3.2
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892768; x=1779497568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G64BUX6juTlTXRdAMI5OSG+73f4295wyUe3ByxrhLmY=;
        b=WSpwep0oDr/Q1FtCURAjl+Zy+uWGd5s4MOJ5B1pNnOaG///CAL2ceQyCCwfrlxB2Hu
         0xwcxRJRyMl6eYTWZloTOCDtac3P4m/9KSi1uhIBfFr/nSIRJ7uT+kX/9HouCMsQ0YFJ
         KRSmFSrS2SPmpMpmCba3MwejGNMf3bnVNzCfQj92+2R2pgI/7s5sJ5Qa8kvnOjwsFgbF
         1y6s7SbgHbfg4VHcp6yMa/TdcUvOKDpUYN5JvxdNsSHcGAsjkBNogWGgV0aurFpD/zX2
         246J1GQn8S3FPKWseNSxbeddFYajb+u0+Al0C1zbaBwXomJXmDecwf6V28wt8uXv+GOE
         mZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892768; x=1779497568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G64BUX6juTlTXRdAMI5OSG+73f4295wyUe3ByxrhLmY=;
        b=r3tchOMQOL7vaD3ptbonCofekD8Lchy5LZEeRwYwRrzKlewbiJsjoc7RiErtbp52t5
         ybhMvsS/dLoApUr975QpB+eRrZJqYXwV3iwxqAc/QD0yTr2eZ0HLz+UAozSVZ4wzafH7
         PHd73xGn50pS6QEc1t+GAtBz143WQA078Qufxe0hJoXwO1rjv1gb9oZBiRt1+rTqF943
         aTvBZK1tYrDvkhZi8xF8a75jU02PAIuljKnNHbBEDb0F/oJRfO9PbxXu3KKq1S3mzRID
         w9yYUIVTktS1WVMgXSRNGTnPoXYSqc8mv006FI07tdNHkNzNZ2kKDVkyvJBWdM7TnZln
         /1Bw==
X-Gm-Message-State: AOJu0Yx8a8JcFHamp6MNiqN7d49ZxbhKqn3i3KRBhz/xG2WrAxelrz74
	92S4mbIq31WMaNQnyxbI6qin24q7nFJ2VxLhh1sb0NcObyYfZ8z1cOzA
X-Gm-Gg: Acq92OHpdLW/AhR3Z40p608CyEe/48HbNwmqIuGHZml/lfHinymlBEl5/6AqNqL+C3L
	HuCNuQw1H84D/ta1Nt2cNxleOmpppDJSbN2ACfkSI6Uefkwpw8YwCKpL5ogEhkVNA+V1wycIiXK
	O8bZev6SHxyznNMWYFbObMpTzwvn9NMHgu/BkschWkQEk4AEjP4W86NB8nNwItCyliiluBKFfRy
	P8aybwJPjaCeIgAJeBCskmsjdJp3QPGo00x/LAx8EodDs75q8iDl0QhU1gd8HbrjI1+FChDCB/G
	yrBX09ykFZaDR4c9PFgvxs28cN5Uh3KOitediOXSc8w/5JwNpHV/nijL7Qw+TIoCcjlnocn4T+B
	oVKFiHpvZMwaamoi8WQl7DKengg26q1qhT13QIaypeI7Kui9zGI6fseTuJ9tTDNRjenbxL5yrUh
	dPqliRX8Pp+yRKzCIif5VL9cEBW6eCtDM=
X-Received: by 2002:a05:690c:4a01:b0:79a:b440:5c77 with SMTP id 00721157ae682-7c959e890bfmr76962837b3.17.1778892767815;
        Fri, 15 May 2026 17:52:47 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:23::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7ef2cdd8csm37234067b3.0.2026.05.15.17.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:47 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 12/21] fuse: add struct fuse_entry2_out and helpers for extended entry replies
Date: Fri, 15 May 2026 17:39:55 -0700
Message-ID: <20260516004004.1455526-13-joannelkoong@gmail.com>
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

Add struct fuse_entry2_out, which is a new extended entry reply struct
that carries a backing_id and statx attributes. This will be necessary
for setting fuse passthrough on inodes.

Add helpers that subsequent commits will use to process fuse_entry2_out
for passthrough support for lookup, revalidate, and create.
fuse_statx_to_attr() is also moved to earlier in the file to avoid
forward declaring.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c             | 116 +++++++++++++++++++++++++++++---------
 fs/fuse/fuse_i.h          |   5 ++
 include/uapi/linux/fuse.h |  14 +++++
 3 files changed, 107 insertions(+), 28 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index a338f2a06b50..b7a9d2b0476a 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -355,11 +355,18 @@ static void fuse_invalidate_entry(struct dentry *entry)
 	fuse_invalidate_entry_cache(entry);
 }
 
-static void fuse_lookup_init(struct fuse_args *args, u64 nodeid,
-			     const struct qstr *name,
-			     struct fuse_entry_out *outarg)
+static void fuse_lookup_init(struct fuse_conn *fc, struct fuse_args *args,
+			     u64 nodeid, const struct qstr *name,
+			     struct fuse_entry_out *outarg,
+			     struct fuse_entry2_out *outarg2)
 {
-	memset(outarg, 0, sizeof(struct fuse_entry_out));
+	bool use_entry2 = fuse_use_entry2(fc);
+
+	if (use_entry2)
+		memset(outarg2, 0, sizeof(struct fuse_entry2_out));
+	else
+		memset(outarg, 0, sizeof(struct fuse_entry_out));
+
 	args->opcode = FUSE_LOOKUP;
 	args->nodeid = nodeid;
 	args->in_numargs = 3;
@@ -369,8 +376,79 @@ static void fuse_lookup_init(struct fuse_args *args, u64 nodeid,
 	args->in_args[2].size = 1;
 	args->in_args[2].value = "";
 	args->out_numargs = 1;
-	args->out_args[0].size = sizeof(struct fuse_entry_out);
-	args->out_args[0].value = outarg;
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
+	outarg->attr.flags = outarg2->flags;
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
+	/*
+	 * Convert entry2 format to entry format before error checking since the
+	 * caller needs outarg->nodeid field even on error
+	 */
+	fuse_entry2_to_entry(outarg2, outarg);
+
+	if (outarg2->reserved)
+		return -EINVAL;
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
 }
 
 /*
@@ -389,6 +467,7 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 	struct fuse_conn *fc;
 	struct fuse_inode *fi;
 	struct fuse_entry_out outarg;
+	struct fuse_entry2_out outarg2;
 	struct fuse_forget_link *forget;
 	FUSE_ARGS(args);
 	u64 attr_version;
@@ -431,7 +510,7 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 
 	attr_version = fuse_get_attr_version(fc);
 
-	fuse_lookup_init(&args, get_node_id(dir), name, &outarg);
+	fuse_lookup_init(fc, &args, get_node_id(dir), name, &outarg, &outarg2);
 	ret = fuse_simple_request(get_fuse_mount(inode), &args);
 	if (ret || !outarg.nodeid) {
 		kfree(forget);
@@ -551,6 +630,7 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 	FUSE_ARGS(args);
 	struct fuse_forget_link *forget;
 	u64 attr_version, evict_ctr;
+	struct fuse_entry2_out outarg2;
 	int err;
 
 	*inode = NULL;
@@ -567,7 +647,7 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 	attr_version = fuse_get_attr_version(fm->fc);
 	evict_ctr = fuse_get_evict_ctr(fm->fc);
 
-	fuse_lookup_init(&args, nodeid, name, outarg);
+	fuse_lookup_init(fm->fc, &args, nodeid, name, outarg, &outarg2);
 	err = fuse_simple_request(fm, &args);
 	/* Zero nodeid is same as -ENOENT, but with valid timeout */
 	if (err || !outarg->nodeid)
@@ -1386,26 +1466,6 @@ static void fuse_fillattr(struct mnt_idmap *idmap, struct inode *inode,
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
index 1f2c849ea4e3..89c9333e9702 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1368,6 +1368,11 @@ static inline bool fuse_passthrough_op(struct inode *inode, enum fuse_opcode op)
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

