Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD8322F01
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892772; cv=none; b=VZVuoEy1hoQaEl1Xcswys5tp+PX3hBmv58DshDfNGLoEFpgDvi56MlP2SH5Mz+qwfnJNHryXWx143T1FlnWjuKfexoqxfggGJYPkgTq3st702Krf7QRuRLtBa0Ulr7pupcJZF3LrfHicl/hH+Zy1GUSNiZBEm+hFul330QLSwDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892772; c=relaxed/simple;
	bh=A4VZ8s0O9JOoQGYWdt1DG7u85Nb5xzy3TUQ7X6PhLd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NaJulpvYd6GAY6ehFuwL47LZLPymkaRHhs1btzmh1yQQMK+AVG4O8LzecrQpvukasvNvXFhu5OYiUb75zy9fT9TbW2IlayuYvjeEBjyGqPGcknfcscc8RwiGANFTVWjQZGUDFwlzNBn6FY5T0nNzJelCwgZZ5t2w/tAVX5cB7Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYve5Kku; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYve5Kku"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-65c305f381eso976504d50.3
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892770; x=1779497570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIHa5DTBrFVKAuYTCoVTJzIz4u/zcSZ9wJ/ywTEStD8=;
        b=DYve5KkuUJpsZHMU0Ye3f3SH9MqTpyYECAZSL6EpJd01H0T9KhE5/5YZii+IKnyh3e
         Hm0i8iaMOdTvJdbHlMHSlyZu83mQyHI+x8PELQk43+m51Z/BO8fBNObFeWHvIh/anEui
         cBT0EEC2EPdYGIGvNUuB7Y9gEq2Pg4yQ4nPxJxVzsCqcrxy5rA1ERDLZDCF0GxMhRtZl
         591LarY3h2EkIGt4Tir03J9hSSy+m+SRE1TqW8RjCev8mIpA9jilZVcSaxJNTfHzW0dW
         CNdGbwonnF7tOg9lTHw+4Ne/Gl4+z9DIWp9lsd2X+2V6e82sOTS/zlCroQubrfamZJPi
         uDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892770; x=1779497570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HIHa5DTBrFVKAuYTCoVTJzIz4u/zcSZ9wJ/ywTEStD8=;
        b=q4yCwpr+XXxhMCgG5E+JteeAqiz5rgqNIYu/+OBgr7S5MSiiIicZWKwY5Miwakwdtz
         mmoXR3r7yvMXxhMNn1beS2NDK0KHU9PYX7bSyfm7D105lZ41crKB1qLU2LHeP74O4w18
         CJ8GHAftMsMH4KDr0phhoAXMIjkGvMdlsGffoFBJR2nCe98mKFnHKnUljqcMfSiyATyb
         Vc1N1RIcpETCkwJSQvlNeapwj4Oj71tay+6xJbdVE8K1p2ctlkQvs77ohaxGfOBoE/qV
         a0v9Vud5swUkNj8LRci50VNbYXcaj+J1jbgNjbcVI48tUBGY0rYgsGjU1rvqsjqzQb2U
         rlMQ==
X-Gm-Message-State: AOJu0YyCnz4MYQvA/TOWEVKK6tuHiyrlVtDM9UOdeSzI2drJ6uU9h3l8
	EWV7EfUdpml8ZCeDHmNXwTs0npFv35nTb11jtWGHqSKFz05lx7B8CW9H
X-Gm-Gg: Acq92OG8rjX9gNdqZlCt1QGe403HoPn17GgWl+rmifYYi2OXkOw2GNekBTip4a8o8RC
	wgVah21mwCPIQtVrtwnqivs+ivdU8D4vsXT6NMRG4hFwlfrn2/zNreozdjFcwqrGnzhn0dFUNfa
	fF69toZWbJl4B33usQG0YwU6hxCXYJ1rQdIAZEPIO+A0KGrkmPIYNeNgD6KhlsIWimzne1Qs6ar
	4jP1XE/t+9vsEIqlCIqV2sjGmaMblHSEONiCtg/aK4fLatdHqx4NXgq7L2n98Ddnxw0uu8RCMle
	XIBuxZ4+d8OJETJudxLnPzFEzFVN0tJc3I3najvskXqGspGSvMvL7h/92pRRVbTzQ3D8o2+12nl
	sCVGRFAjweg0A9lgVdFP6+G0dhnVs+DQSAIhzTBph8XAkxvS3hGbvowhbrl8jGow9MLNFk+0+rX
	cnEBh+Z12m1r41m4Mv7iy3ru0D2UF1UtU=
X-Received: by 2002:a05:690e:14c4:b0:65c:5e34:7343 with SMTP id 956f58d0204a3-65e2283524fmr6390550d50.44.1778892770438;
        Fri, 15 May 2026 17:52:50 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:16::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e3aa93cdasm45020d50.21.2026.05.15.17.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:49 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 13/21] fuse: add passthrough lookup
Date: Fri, 15 May 2026 17:39:56 -0700
Message-ID: <20260516004004.1455526-14-joannelkoong@gmail.com>
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

Use the new/extended struct fuse_entry2_out for lookups. If a backing id
is set, associate the fuse inode with the backing inode that should be
used for passthrough operations.

If no backing id was set, cache the statx attributes from the reply.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 66 ++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index b7a9d2b0476a..3a6adae530da 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -420,10 +420,10 @@ static void fuse_entry2_to_entry(struct fuse_entry2_out *outarg2,
 	outarg->attr.flags = outarg2->flags;
 }
 
-static __maybe_unused int fuse_process_entry2(struct fuse_conn *fc,
-					      struct fuse_entry2_out *outarg2,
-					      struct fuse_entry_out *outarg,
-					      struct fuse_statx **sxp)
+static int fuse_process_entry2(struct fuse_conn *fc,
+			       struct fuse_entry2_out *outarg2,
+			       struct fuse_entry_out *outarg,
+			       struct fuse_statx **sxp)
 {
 	if (!fuse_use_entry2(fc))
 		return 0;
@@ -469,7 +469,9 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 	struct fuse_entry_out outarg;
 	struct fuse_entry2_out outarg2;
 	struct fuse_forget_link *forget;
+	struct fuse_statx *sx = NULL;
 	FUSE_ARGS(args);
+	int backing_id = 0;
 	u64 attr_version;
 	bool need_reval;
 	int ret;
@@ -512,15 +514,27 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 
 	fuse_lookup_init(fc, &args, get_node_id(dir), name, &outarg, &outarg2);
 	ret = fuse_simple_request(get_fuse_mount(inode), &args);
+	if (!ret)
+		backing_id = fuse_process_entry2(fc, &outarg2, &outarg, &sx);
 	if (ret || !outarg.nodeid) {
 		kfree(forget);
 		return (ret == -ENOMEM || ret == -EINTR) ? ret : 0;
 	}
 
+	if (backing_id < 0) {
+		ret = backing_id;
+		goto forget;
+	}
+
+	ret = 0;
 	if (outarg.nodeid != get_node_id(inode) ||
-	    !!IS_AUTOMOUNT(inode) != !!(outarg.attr.flags & FUSE_ATTR_SUBMOUNT)) {
-		fuse_chan_queue_forget(fc->chan, forget, outarg.nodeid, 1);
-		return 0;
+	    !!IS_AUTOMOUNT(inode) != !!(outarg.attr.flags & FUSE_ATTR_SUBMOUNT))
+		goto forget;
+
+	if (backing_id) {
+		ret = fuse_inode_set_passthrough(inode, backing_id);
+		if (ret)
+			goto forget;
 	}
 
 	kfree(forget);
@@ -534,10 +548,14 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 		return 0;
 
 	forget_all_cached_acls(inode);
-	fuse_change_attributes(inode, &outarg.attr, NULL, ATTR_TIMEOUT(&outarg),
+	fuse_change_attributes(inode, &outarg.attr, sx, ATTR_TIMEOUT(&outarg),
 			       attr_version);
 	fuse_change_entry_timeout(entry, &outarg);
 	return 1;
+
+forget:
+	fuse_chan_queue_forget(fc->chan, forget, outarg.nodeid, 1);
+	return ret;
 }
 
 static int fuse_dentry_init(struct dentry *dentry)
@@ -631,6 +649,8 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 	struct fuse_forget_link *forget;
 	u64 attr_version, evict_ctr;
 	struct fuse_entry2_out outarg2;
+	struct fuse_statx *sx = NULL;
+	int backing_id;
 	int err;
 
 	*inode = NULL;
@@ -649,9 +669,18 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 
 	fuse_lookup_init(fm->fc, &args, nodeid, name, outarg, &outarg2);
 	err = fuse_simple_request(fm, &args);
+	if (err)
+		goto out_put_forget;
+
+	backing_id = fuse_process_entry2(fm->fc, &outarg2, outarg, &sx);
+
 	/* Zero nodeid is same as -ENOENT, but with valid timeout */
-	if (err || !outarg->nodeid)
+	if (!outarg->nodeid)
 		goto out_put_forget;
+	if (backing_id < 0) {
+		err = backing_id;
+		goto out_send_forget;
+	}
 
 	err = -EIO;
 	if (fuse_invalid_attr(&outarg->attr))
@@ -662,19 +691,28 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 	}
 
 	*inode = fuse_iget(sb, outarg->nodeid, outarg->generation,
-			   &outarg->attr, NULL, ATTR_TIMEOUT(outarg),
+			   &outarg->attr, sx, ATTR_TIMEOUT(outarg),
 			   attr_version, evict_ctr);
 	err = -ENOMEM;
-	if (!*inode) {
-		fuse_chan_queue_forget(fm->fc->chan, forget, outarg->nodeid, 1);
-		goto out;
-	}
+	if (!*inode)
+		goto out_send_forget;
+
 	err = 0;
+	if (backing_id) {
+		err = fuse_inode_set_passthrough(*inode, backing_id);
+		if (err) {
+			iput(*inode);
+			*inode = NULL;
+		}
+	}
 
  out_put_forget:
 	kfree(forget);
  out:
 	return err;
+ out_send_forget:
+	fuse_chan_queue_forget(fm->fc->chan, forget, outarg->nodeid, 1);
+	return err;
 }
 
 static struct dentry *fuse_lookup(struct inode *dir, struct dentry *entry,
-- 
2.52.0

