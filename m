Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50CC22F01
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892775; cv=none; b=jhe2QQYLn19XvVkWYdPX7NMsmhnNYnDjqN3n05LnFsNWvWGyGE/OM8s5UG8zlGYU3OKd3ziR3RnLXM/Z5NuWmXGT8OxoBfOtKy5/tBsUv7QkvZZcEc03v+SdX+Mbha2IfnhU4oba90gJOtkObMiQQKDHY/lobDRQPfq+sMoJ6iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892775; c=relaxed/simple;
	bh=GGev53AoP0vSmo+asSwZmTmpUDDkeHas2DNJDfhrCRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxzCaIUMG0qx+Af7FV0VZLaDLTh1PvGHrGfvVcZTUaL86L956zAS/6/QlODLpKUu3eD+QuY3XWu1Yj7N676OQuselcH1sRewkZm7rzopVAnJ5TSMOHQlEi9ALE9QQcT1InbVEah/E8s0IP7mYa1xgXvMpVS91UvGW3hferVpOnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ym/Xfqxc; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ym/Xfqxc"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7bdc947aaa3so477887b3.0
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892773; x=1779497573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lcp0qd0RpdTlza4drBjjsOWYvBd8r8saxW3po4XlmQ=;
        b=Ym/XfqxcJ8//9mw+HkAfnTGFZ1M8GGf0Kc5loDFJpx6K6xejkmdwb0cMKzZBAa9eSQ
         XOvkLyXT1ur7B1LKMLzahjNd1sV4Ur1nLBuwh+foC26F5qfS8ETmf3j5PHN+lREdtAXD
         0Pes7Cc+EoI3NWjYiMALEtrR2pEYIXcnQaPlQqeI9rNm5tRBe5m3fxlaO5kDd7EM4P7e
         YZOlN+ZREA1Ipu9ocUXHy9XZ1S/7EccMaV8NzCTvVFLWXGda9ws/xObC1iwzQh5wlD2b
         bZ9yTvFkxLPJjpxhDvuq0aXxmeTLOsR19uHhnNpyxvcG4lEGog4X8RYX/xnC9k3pQt4Y
         +Srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892773; x=1779497573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lcp0qd0RpdTlza4drBjjsOWYvBd8r8saxW3po4XlmQ=;
        b=N6vuLPTYxSJXvBRAk4fVyZHjoZXfs7pp9nGzy/CxzKSIkYtpkm4zVg+++yrxLaKFXA
         I5K98k9XDiSngdPGVjNcYXK8mzE1+SsVHHFBzcs0GhvY+tCutzGW345+FQ6N0zqn7BNW
         dEvSRQZE8+P7jFSNZOo0g6iqWtoNTgvu8ijAXwO1qaAgbOCpb8jQQHxA7BrqoNnKZdgy
         eo8Ba2CIXRqTqgXCwKH+19+ar0avX3KklY/qeEWo1KM6n16diQI+IRZwxokJYXC27Wcc
         ctI7w8sTYECwPI05ABtA6FBWFXcDQnso2MbEv5Hb0L5KrzoJUqEFO1yZiI4R4JdKEMMD
         8vqw==
X-Gm-Message-State: AOJu0YwwReJmIXXysk7h1b5FLMD+kBkDVI13C224jOItyItQwYNtczdR
	TTStPPD3xb+H3Hi5EYhkwOfJJ5C9E2tibXaFfZmH7Lzz+SqAa+cq/Ign
X-Gm-Gg: Acq92OGv2PiVY61KtyJsSucHCoiijD5Od1VRChI9Bhj9OWaVEfwEWPacgdzEHsr8EkO
	L9h1xEQTfYAg2bHKin27YMoEZSC+SDf8HBNIhUWInYMMMJRJq5wQ2k2Hw5khK1r4l3OU9IsIrGK
	rfVbYiepcatcbsodMP8p0luCAt90Rr3aC2et++Vf+fawFpK5ZczBAXpqYjJrQL7t0CK2ACWBI1x
	0vowNRns/WCNF3lL48/xdlj13ybbWFy07RzdSUldXgZIYxFpor0v3kiIBWVySkxRhw6lvslqU0v
	+EWIc0iKOG+vKi4Bq81j9CfDrjIW2lqX2PmN85fVc8VkFHRyH6uosN+aaBQQwxawznCFSWD2Je6
	IcWNuTolKix7dy/3rrx8kTLaXLZvGfAkP9qRTbRRYIm+VykHXM5QYEwGYjWe/wkqM6sbtk9pfLy
	gm0ffn01bEfRxZGlpVqxZa
X-Received: by 2002:a05:690c:28b:b0:7ba:f3fb:2623 with SMTP id 00721157ae682-7c95c8f201dmr66807957b3.40.1778892772939;
        Fri, 15 May 2026 17:52:52 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:44::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f55b85edsm37663907b3.35.2026.05.15.17.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:52 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 14/21] fuse: add passthrough support for entry creation
Date: Fri, 15 May 2026 17:39:57 -0700
Message-ID: <20260516004004.1455526-15-joannelkoong@gmail.com>
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

Use the new extended fuse_entry2_out reply for entry creation operations
(mknod, mkdir, symlink, link) when FUSE_PASSTHROUGH_INO is enabled.

If the server returns a backing id, the newly created inode will be
automatically associated with the backing file for passthrough
operations. If no backing id is returned (no passthrough), the statx
attributes are cached.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 3a6adae530da..a11f9e4c1999 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1088,9 +1088,12 @@ static struct dentry *create_new_entry(struct mnt_idmap *idmap, struct fuse_moun
 				       struct dentry *entry, umode_t mode)
 {
 	struct fuse_entry_out outarg;
+	struct fuse_entry2_out outarg2;
 	struct inode *inode;
 	struct dentry *d;
 	struct fuse_forget_link *forget;
+	struct fuse_statx *sx = NULL;
+	int backing_id;
 	int epoch, err;
 
 	if (fuse_is_bad(dir))
@@ -1102,11 +1105,18 @@ static struct dentry *create_new_entry(struct mnt_idmap *idmap, struct fuse_moun
 	if (!forget)
 		return ERR_PTR(-ENOMEM);
 
-	memset(&outarg, 0, sizeof(outarg));
 	args->nodeid = get_node_id(dir);
 	args->out_numargs = 1;
-	args->out_args[0].size = sizeof(outarg);
-	args->out_args[0].value = &outarg;
+
+	if (fuse_use_entry2(fm->fc)) {
+		memset(&outarg2, 0, sizeof(outarg2));
+		args->out_args[0].size = sizeof(outarg2);
+		args->out_args[0].value = &outarg2;
+	} else {
+		memset(&outarg, 0, sizeof(outarg));
+		args->out_args[0].size = sizeof(outarg);
+		args->out_args[0].value = &outarg;
+	}
 
 	if (args->opcode != FUSE_LINK) {
 		err = get_create_ext(idmap, args, dir, entry, mode);
@@ -1119,21 +1129,35 @@ static struct dentry *create_new_entry(struct mnt_idmap *idmap, struct fuse_moun
 	if (err)
 		goto out_put_forget_req;
 
+	backing_id = fuse_process_entry2(fm->fc, &outarg2, &outarg, &sx);
+
 	err = -EIO;
 	if (invalid_nodeid(outarg.nodeid) || fuse_invalid_attr(&outarg.attr))
 		goto out_put_forget_req;
+	if (backing_id < 0) {
+		fuse_chan_queue_forget(fm->fc->chan, forget, outarg.nodeid, 1);
+		return ERR_PTR(backing_id);
+	}
 
 	if ((outarg.attr.mode ^ mode) & S_IFMT)
 		goto out_put_forget_req;
 
 	inode = fuse_iget(dir->i_sb, outarg.nodeid, outarg.generation,
-			  &outarg.attr, NULL, ATTR_TIMEOUT(&outarg), 0, 0);
+			  &outarg.attr, sx, ATTR_TIMEOUT(&outarg), 0, 0);
 	if (!inode) {
 		fuse_chan_queue_forget(fm->fc->chan, forget, outarg.nodeid, 1);
 		return ERR_PTR(-ENOMEM);
 	}
 	kfree(forget);
 
+	if (backing_id) {
+		err = fuse_inode_set_passthrough(inode, backing_id);
+		if (err) {
+			iput(inode);
+			return ERR_PTR(err);
+		}
+	}
+
 	d_drop(entry);
 	d = d_splice_alias(inode, entry);
 	if (IS_ERR(d))
-- 
2.52.0

