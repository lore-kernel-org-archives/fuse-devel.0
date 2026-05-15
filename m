Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA00382F2E
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 23:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778889155; cv=none; b=J6ZlPl7jUpzVjG+8yxwPad94Q57bly/56yMc4ciwlnJs+N9RHZPRtyfjRNGCmBeplUlvsQKlVYmECIE/DkbvlpItFeHpdzemhC2XquucQCnzPdYKF7D1IbBzeEshHlR+6RvLf4QP4/yTRkvVHVzKu5dfsf5mmv7wD2HHtQxVRZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778889155; c=relaxed/simple;
	bh=5IqH3rtxy34dNHAACvs5lP8NKiJT6VKmEanaZWVybaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrxgjnSuyxAPnwvUmCsfWG+IdQEJWAGKXx1Iz32YxxAaYH6rm0eQj5s9SQNhUbGWQ9VipSfsNWFZDvT5ZWnioUtoW12DuCTaAQlTMNrwHQOyEhi/+U5ushqw7cJqAT7DK+Blt2Bv2DLAoziE0Ex64gw0SJ3OZ1D+iS8FgMKZUHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lihdd.net; spf=pass smtp.mailfrom=lihdd.net; dkim=pass (2048-bit key) header.d=lihdd.net header.i=@lihdd.net header.b=LqIYNAly; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lihdd.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lihdd.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lihdd.net header.i=@lihdd.net header.b="LqIYNAly"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6312970d9e3so278131137.2
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 16:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lihdd.net; s=google; t=1778889153; x=1779493953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQzTKnRgvG1KzI5oOnwgsBb/NWXP2/hzb5cjXiyHb24=;
        b=LqIYNAlyxscRLAiI0qdy1RqxSFP5gE/BXSCPUk4E8wuVoK6yT6UIe+E+ISMUmQjk0w
         PnzOTYp0DergbEo+1BtookP5ajds3Hrj0HrqIyBcT/oXhzrJz9ftM7n035B88m2Vy1qR
         Vix3R/qRBvgPOmIujk9mobZjEAhXrplCjiyuzQGl8Ky7K00bVSpvbF49el4S6ONuVA4C
         muN2MMZ3bPqMjEVEZNfvHQYGoPgngb+eLV0XGWA3KEASvtcxA79pIfhzVq39EzKboLq9
         OONfCBD0rOsXqJqx4bGKS8IXNsmj6CsUxiOKGqzmaIF30xv53kdIjw5RnLeJREgSI+MZ
         iwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778889153; x=1779493953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQzTKnRgvG1KzI5oOnwgsBb/NWXP2/hzb5cjXiyHb24=;
        b=EjcFxepCk+bkGVdvTIlnVtFQTQNN/QMoGKHUmjY0yqTbUEwoq3hjdXg+/2KyGdpgG/
         hjj+VhggvVBOvLw80lCmzYIi3MkJBXTP3gi4J1DGzAbUe5hvORzejy1GpZ1IWcKItd7o
         3/0GsccgYqnmlJP4tbv2chBHeAHUYuk3KrLHoSgMvQ7LWC0bjd0yFmtm6VceGX1HV9Ct
         7z0icMhdXfhdezA47ACvygBQfrlL/6asHGwQAeWY4MR0pT75HNirP8z9O800MOrwE6sf
         IMOYOSN00j2ffS+YvdfRfSVbs6kKYC82IP+8rq4N+Bw5Hpo7d0iYKVQe3wNbjuplowoj
         KuPw==
X-Gm-Message-State: AOJu0Yx7wCBQSp9ljAqwypp2GMgWm13301I9YRTl7id5lnVSvB+fhq97
	ed2tbf+a7KoI5n/MYxlHXZooa5D1DTrJl3Si8I8R9iCTPN9OM6ErZLTn0szj9/y7rxVNk5p+BPn
	iEZ0L
X-Gm-Gg: Acq92OGJtLjMREZbHwrku1og+KP9xkXeEIx+hzmAS+pIHFnAlYHRjyG3pGx5s8gvBU5
	ON0cxoUyP2FPcaYinewvER6EgWKSWmQf6iAeIqvAsBGrME76z0XiwiooUBZHeX5Ztk/kX8iRJef
	dbgx6Iq7qgjT433kTT8BHCviwGPdKLouZT0mVSks+Ak+LIeDP+kJQHkrB3/qwqbXuxMc/Wo6YI0
	7M9aSXiJ4SI5Nqu6zu7LFwFA8Da0yxdEhjtfJzQm/4umPlnzqxeuu+XWyOgZ+wu6k5emohj7veZ
	xCJAOz6zEcexBZ4hvKlbYRom2X5YmHkOXx2DRqfmab1mtq6xsAs36K/YUkauh/hnuBH/OzzG/O1
	G+4NKdmfUdjsDWgF6IQtdiUp89ocEc1e+h2p/XxAWNzin+tSo22Kf2i/xGMC+4C/PgL9d3K74Ae
	1GynoC7URqmVVOczrhm/vvbcL/6xgxzgg0VHRdZhmJ1LPbU9p3
X-Received: by 2002:a05:7300:fd16:b0:2f2:6dde:df66 with SMTP id 5a478bee46e88-3039868c86cmr874858eec.22.1778804053795;
        Thu, 14 May 2026 17:14:13 -0700 (PDT)
Received: from quark-fedora-PF5F60VQ.thefacebook.com ([2620:10d:c090:500::1:695d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e69esm6094972eec.1.2026.05.14.17.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 17:14:13 -0700 (PDT)
From: Jun Wu <quark@lihdd.net>
To: fuse-devel@lists.linux.dev
Cc: miklos@szeredi.hu,
	luis@igalia.com,
	Jun Wu <quark@meta.com>
Subject: [PATCH v2] fuse: invalidate readdir cache on epoch bump
Date: Thu, 14 May 2026 17:14:12 -0700
Message-ID: <20260515001412.1270472-1-quark@lihdd.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260331223927.763741-1-quark@lihdd.net>
References: <20260331223927.763741-1-quark@lihdd.net>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jun Wu <quark@meta.com>

FUSE_NOTIFY_INC_EPOCH invalidates dentries, but does not invalidate cached
readdir results. A process with cwd inside a FUSE mount can therefore
observe stale readdir(".") output after an epoch bump.

Fix this by recording epoch in the readdir cache and checking it on reuse.

Minimal reproducer:

- mount a tiny FUSE fs with an empty root directory
- on opendir, enable fi->cache_readdir and fi->keep_cache
- chdir into the mount and call readdir(".") to populate readdir cache
- make the FUSE server report one file in the root directory
- send only FUSE_NOTIFY_INC_EPOCH
- call readdir(".") again; before this change it stays stale, after this
  change it sees the new file

Fixes: 2396356a945b ("fuse: add more control over cache invalidation behaviour")
Signed-off-by: Jun Wu <quark@meta.com>
---
Changes in v2:
- Addresses Joanne Koong's suggestions:
  - Drop the FUSE_EPOCH_READDIR init flag.
  - Add Fixes tag.
- Rebase onto current mainline.
---
 fs/fuse/dev.c     | 6 +++---
 fs/fuse/fuse_i.h  | 3 +++
 fs/fuse/readdir.c | 5 ++++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5dda7080f4a9..35e04b064f37 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -2038,9 +2038,9 @@ static int fuse_notify_resend(struct fuse_conn *fc)
 }
 
 /*
- * Increments the fuse connection epoch.  This will result of dentries from
- * previous epochs to be invalidated.  Additionally, if inval_wq is set, a work
- * queue is scheduled to trigger the invalidation.
+ * Increments the fuse connection epoch.  This will cause dentries and
+ * readdir caches from previous epochs to be invalidated.  Additionally,
+ * if inval_wq is set, a work queue is scheduled to trigger the invalidation.
  */
 static int fuse_notify_inc_epoch(struct fuse_conn *fc)
 {
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 17423d4e3cfa..aa8d6dfbbcc7 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -191,6 +191,9 @@ struct fuse_inode {
 			/* iversion of directory when cache was started */
 			u64 iversion;
 
+			/* epoch of fc when cache was started */
+			int epoch;
+
 			/* protects above fields */
 			spinlock_t lock;
 		} rdc;
diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index db5ae8ec1030..b18d971e2bb4 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -442,6 +442,7 @@ static void fuse_rdc_reset(struct inode *inode)
 	fi->rdc.version++;
 	fi->rdc.size = 0;
 	fi->rdc.pos = 0;
+	fi->rdc.epoch = 0;
 }
 
 #define UNCACHED 1
@@ -483,6 +484,7 @@ static int fuse_readdir_cached(struct file *file, struct dir_context *ctx)
 		if (!ctx->pos && !fi->rdc.size) {
 			fi->rdc.mtime = inode_get_mtime(inode);
 			fi->rdc.iversion = inode_query_iversion(inode);
+			fi->rdc.epoch = atomic_read(&fc->epoch);
 		}
 		spin_unlock(&fi->rdc.lock);
 		return UNCACHED;
@@ -496,7 +498,8 @@ static int fuse_readdir_cached(struct file *file, struct dir_context *ctx)
 		struct timespec64 mtime = inode_get_mtime(inode);
 
 		if (inode_peek_iversion(inode) != fi->rdc.iversion ||
-		    !timespec64_equal(&fi->rdc.mtime, &mtime)) {
+		    !timespec64_equal(&fi->rdc.mtime, &mtime) ||
+		    fi->rdc.epoch != atomic_read(&fc->epoch)) {
 			fuse_rdc_reset(inode);
 			goto retry_locked;
 		}
-- 
2.54.0

