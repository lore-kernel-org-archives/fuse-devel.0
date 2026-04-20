Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE49338F635
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723521; cv=none; b=LE6Iygnsly0KTt4jqtzKfVH5mZRtXPg0MemVUcwIkaXq62Hmi2gsfNimHGDd5jv1237hs5qpDSI5ki7FN6hVtnNtAzWOx4oO7my/XCBxs1rQp/LNeP7l7TpPKFn+q03MmuHKYDaM/IH1zZC3pzGEoMiyLP7yuckxsDTdReLwcYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723521; c=relaxed/simple;
	bh=Q1f4Q5YyTISRSaGMs9VAhbAcMrpGki5leCszA2fnnKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDtaHVwD0GwAeMASBoLHB3zYR4dLfjhGyyHFtqpCDxmSrG9wBBPTV9Xv2CQ3WYsNQZfS48E8DP8TWRYfCTOCiYi+AFq6s+lGP1BN2ArIlhTtcg0Lr5zFkJUwjT6yPwZ+8quU/anYU59fjSqlso7lSoS+499K8A39zppC0fOdSV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tsm22L4E; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tsm22L4E"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35fb16e56efso2364767a91.2
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723519; x=1777328319; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSrVAVP53Vru8myuk8q29ILjYZwwU1dNZwp3t+WkK/o=;
        b=Tsm22L4EUafLnibFnId9ZzMPqJRCojYM/Y+aLvgsA5L8AlPnJ5Huk9V/NDy4SDEoX2
         25nEKtGgaYh4muLqRZToSbeGJZYakPVhNl4tGCWYEdPtO49pVlE2VPjPOVBuWwzk3tSn
         AlqpTQLvo4f7QoAQkNNO/TZE6BPCwsfefn2ySzLfN1TLH4qXSV60OSYxCE8DIdaUFgwz
         h68dw+FlZ8K1ZRXPn0Ar4kdU/QD87sccZGi3Er8NkgDn1dQ+9fYACec/o6iMfuZPsI0F
         TRJj7MYKhOeK9GBzH7c9dufdKouaLDm0ISl63v1auxsfGiI8JEEi5xgztpFLUW/otKch
         /aQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723519; x=1777328319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aSrVAVP53Vru8myuk8q29ILjYZwwU1dNZwp3t+WkK/o=;
        b=NHNHVJd1Pa75StFXG4VsFkS77FH0voxuYbUgckRVyAZfUy2tqm+8WvtLCNJUrQmqsA
         jgdRMvHfGCNqThbd7DAzhVB0PGE6Xe8622rNw+BbTbp0hGtg+fgt1ciTGjTIJBY3Umfl
         Ig/SmLiIyhE/3cUxx/MPLwwDso73UxrnPPZn44F+2qK2YyB+QR+JUdKzBw2K0/lXCtP9
         BqNSSwHzxMkh6V/DYQcF7PsFS7991ZaS4HoO/hAunkNuzjKoj1WUlYWxSR/HJLM+5Sig
         LRayMP/UVs4Iu71JuZLxsLMLIfBtq30Ewhur632Gu3/RSZzdOnR2yKebW0dMDTTSWcwr
         dNMg==
X-Forwarded-Encrypted: i=1; AFNElJ9S2jThdGQ0mhHNat24ydgm790qV8rO0BocrS+c0ODdBGAPGNzxVvV9SF/hyxmUIiCYEQdKyZEaoB3F@lists.linux.dev
X-Gm-Message-State: AOJu0YxRs0yR1VxIqoHCzEJCnIJDZX13dv8Vx8ftwuTUsHFeVxHqQS1Q
	J4sjXCWQWy0HAtFous3+sTdTtxfKNJ/n1/cM670NWX0dnbBvxR22kiMR
X-Gm-Gg: AeBDiet1ysB2opqEwS6CaYB6G5R2aKf9NApnVqgZUfHr/beJ2TEQYAsssNV5Iv63j2b
	u7E2+c3IVVz3YNdlhSuqJBMFNwidfI0TPaUfysVOGmHpMFmIJsooOsrW7n9BojQeyx6JoRvRDtt
	xRU4w8mWFJYEAJXjdomjYXTwKKQigdazAcFQxq73rWEpfI3ayOUL4Lk5Qh9FLiM+uSPrGuoQFmS
	H+gwgoLUeKl2nMx2i+gqKXjnlUMtB9HryG6ApeeK1xiSxas4C3IlDR95tDDkZtUuI/irIsKwcae
	TODJOru4m0BXQ8Zad5dG/Bcg8eMreY+3uUZzqMRfTUK/5CiPKfIdxTU5tOccIdhjKC27BUY7Xv3
	JI44S9pwIvtjfA0PpkpoBo2K/8xgSB7z2v647A6dqKIsgVK8Tms7pW9k3Eokl/ZM/Qx9/DDyDWP
	Vlr+vX/uzyjsFUxdErczkkTPOxNs74
X-Received: by 2002:a17:90b:2e41:b0:35d:aeb2:25b2 with SMTP id 98e67ed59e1d1-361404aeddcmr16674305a91.27.1776723519128;
        Mon, 20 Apr 2026 15:18:39 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:47::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614371a7c8sm11182471a91.5.2026.04.20.15.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:38 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 05/17] fuse: prepare for long lived reference on backing file
Date: Mon, 20 Apr 2026 15:16:25 -0700
Message-ID: <20260420221637.2631478-6-joannelkoong@gmail.com>
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

From: Amir Goldstein <amir73il@gmail.com>

Currently backing file is attached to fuse inode on the first
passthrough open of the inode and detached on last passthrough close.

In preparation for attaching a backing file to inode with no open file,
allow attaching a single long lived reference on fuse inode backing file
that will be used for passthrough of inode operations and detached on
fuse inode evict.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/fuse/file.c   |  3 ++-
 fs/fuse/fuse_i.h |  5 +++--
 fs/fuse/inode.c  |  5 +++++
 fs/fuse/iomode.c | 16 ++++++++++++----
 4 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 0db6abcf1033..e719c54c12d2 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1444,6 +1444,7 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
 			  bool *exclusive)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
+	struct fuse_file *ff = iocb->ki_filp->private_data;
 
 	*exclusive = fuse_dio_wr_exclusive_lock(iocb, from);
 	if (*exclusive) {
@@ -1458,7 +1459,7 @@ static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
 		 * have raced, so check it again.
 		 */
 		if (fuse_io_past_eof(iocb, from) ||
-		    fuse_inode_uncached_io_start(inode, NULL) != 0) {
+		    fuse_inode_uncached_io_start(inode, ff, NULL) != 0) {
 			inode_unlock_shared(inode);
 			inode_lock(inode);
 			*exclusive = true;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 99798a9de3ed..73de8a9c079c 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -245,7 +245,7 @@ enum {
 	 * or the fuse server has an exclusive "lease" on distributed fs
 	 */
 	FUSE_I_EXCLUSIVE,
-	/* Has backing file for inode ops passthrough */
+	/* Has long lived backing file for inode ops passthrough */
 	FUSE_I_PASSTHROUGH,
 };
 
@@ -1541,7 +1541,8 @@ int fuse_fileattr_set(struct mnt_idmap *idmap,
 
 /* iomode.c */
 int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff);
-int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb);
+int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_file *ff,
+				 struct fuse_backing *fb);
 void fuse_inode_uncached_io_end(struct inode *inode);
 
 int fuse_file_io_open(struct file *file, struct inode *inode);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index bdc135f9fe3e..c80ec5d2ce82 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -195,6 +195,11 @@ static void fuse_evict_inode(struct inode *inode)
 		WARN_ON(!list_empty(&fi->write_files));
 		WARN_ON(!list_empty(&fi->queued_writes));
 	}
+	/* fuse inode may have a long lived reference to backing file */
+	if (fuse_inode_backing(fi)) {
+		WARN_ON(!test_bit(FUSE_I_PASSTHROUGH, &fi->state));
+		fuse_inode_uncached_io_end(inode);
+	}
 	WARN_ON(fi->iocachectr != 0);
 }
 
diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index 3753b78cbb56..54259ead41a4 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -87,7 +87,8 @@ static void fuse_file_cached_io_release(struct fuse_file *ff,
 }
 
 /* Start strictly uncached io mode where cache access is not allowed */
-int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb)
+int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_file *ff,
+				 struct fuse_backing *fb)
 {
 	struct fuse_inode *fi = get_fuse_inode(inode);
 	struct fuse_conn *fc = get_fuse_conn(inode);
@@ -116,12 +117,19 @@ int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_backing *fb)
 		err = -ETXTBSY;
 		goto unlock;
 	}
-	fi->iocachectr--;
+	/* every open file holds a single refcount of backing file... */
+	if (ff)
+		fi->iocachectr--;
 
-	/* fuse inode holds a single refcount of backing file */
 	if (fb && !oldfb) {
 		oldfb = fuse_inode_backing_set(fi, fb);
 		WARN_ON_ONCE(oldfb != NULL);
+		/* ...and an optional extra refcount for inode ops */
+		if ((fb->ops_mask & FUSE_PASSTHROUGH_INODE_OPS)) {
+			WARN_ON_ONCE(test_bit(FUSE_I_PASSTHROUGH, &fi->state));
+			set_bit(FUSE_I_PASSTHROUGH, &fi->state);
+			fi->iocachectr--;
+		}
 	} else {
 		fuse_backing_put(fb);
 	}
@@ -137,7 +145,7 @@ static int fuse_file_uncached_io_open(struct inode *inode,
 {
 	int err;
 
-	err = fuse_inode_uncached_io_start(inode, fb);
+	err = fuse_inode_uncached_io_start(inode, ff, fb);
 	if (err)
 		return err;
 
-- 
2.52.0

