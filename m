Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671F0405C21
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 23:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778889152; cv=none; b=hYb+4bHP+7AYAYmI66U83Rrh9aDPstGSWEXzWw4en4gTsz7t5sYxHqJlJrgx9iTHkkhjts15zbjNqyGczLxnmTHQ5nuYMJDpPrl15RGeBYRMoGbgl7AXXLZdR/QXQeztRTSLCdU/3sKtGaXJdWZY/5RkNhibnv+Ix3a3SdYq36w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778889152; c=relaxed/simple;
	bh=5IqH3rtxy34dNHAACvs5lP8NKiJT6VKmEanaZWVybaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHJEffb0UaPyrPOGoBdnhPme+9chOZpCNKn0Pd63IATAL/j391rkekakDJrBtz7GxCJ8zZJJ1YFijujGf33/UCORgdJVq5vC/l4YDhQ8VVgLYdFg2S07ZInXsiNC5GQCLnLptKnB3e5lKZL7aUOQLTI0GQsvFgOjBTA2m/1G8RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lihdd.net; spf=pass smtp.mailfrom=lihdd.net; dkim=pass (2048-bit key) header.d=lihdd.net header.i=@lihdd.net header.b=afUeTrgp; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lihdd.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lihdd.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lihdd.net header.i=@lihdd.net header.b="afUeTrgp"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-90fe17c157aso65413785a.0
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 16:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lihdd.net; s=google; t=1778889150; x=1779493950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQzTKnRgvG1KzI5oOnwgsBb/NWXP2/hzb5cjXiyHb24=;
        b=afUeTrgpgKjqhzs32MchKw0880+8F9TqlAqTfChbvgrs1wqMA9r3Ko3XHn5iCaNGw9
         ULDbSV2uKwTNn35vp1nL3xdJRaOX+P3waIvbuBmxg+MvIZPkPEyj/X3YbrM3RUgEBpt4
         8SPzqt6gGWmZcQ7pRUR5kJrMuTp1sMriPDA09yLVDcINChzxP/+JB8LrbNek6ubR6i/G
         KmXxD+8qrQQB33cfqPKgrgSmQEYqmp0/tfH6EFImAYENfQl33yYe9RKIWj2Prh6mYHTd
         MBQPYDswAARzecN2aivk+tZpgeot1i28qfQBknNM6NTFTWj3uvW5GCbKCWyf3hXegZZu
         BpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778889150; x=1779493950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQzTKnRgvG1KzI5oOnwgsBb/NWXP2/hzb5cjXiyHb24=;
        b=i/VWAyqc2+A6cwVCKegt5gPpVzwG/f/Jpa+Gaa86plKb5IvARwlkHqGjF77U2RWUmf
         nhpriUZaLIwGCHuaVGA0B4i6K/Kd5Mp0ZGkqSXA1VZYc2qK3kzAJch81M0a1EHg+VVuU
         0g7vA6GBXoReIu/taFqOsBg4cSAWfHAahyNdY1HmV5RSTSek9aoRGybmubwQ63NlZShB
         Y1IBX87N0ghZisViI28TRhVWDvY3fVHX8dP7wgah6M9DjVewe2NmUjc6wtqmqyUGzNBB
         ayFMpMt1BGftj21NgVjFaY4Jc2t6nnFh2rH8EoKnhpkdWHc3VshhF4lHZ9BlKLVN/fkf
         r4DQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YvAWEhFl585+tf22BTLHGPR0DZf9XEte229ynZPs7ApP08RocKTwsFYaSzFIMTMNIyZmoj71h7JHr@lists.linux.dev
X-Gm-Message-State: AOJu0YyjE66nn0qBxcBFlGbQcvlIuVrAE6JfMUSNYu7hcp9hCCwNpnVp
	ogD/mZmAQYOEKEaV/TYkdvO/qpNkoCac2DD8ySx8bPmjwOnO9+cg0RimBD2hBPjwyrCuwMu3/Ni
	Q5i9X
X-Gm-Gg: Acq92OHqiLQOCNG/ed4RXFeJQ5tohzt1QgKJXpDmOoXiyiS8341ArQIjC/72DSoO5g7
	MLMJa6lwP87WCsr6ZZR61nlwUCMWfrHZ1PBmNzt1etOjD23JEO/jDYbvljO9ZdOqBbVA/aaX8PQ
	1rApEsdX+6W2696nvZy8kQV4ktW3KpvyequW56qA/QaYhBTqDqekukZbPN83JgiugXTLCDa+G2E
	UjWcooO1d9baH8VZ+maLd4KX57XOckyo+11jypgQlIU+y27ar97gh+iDNllVZxxoqC/6ablhrs+
	pFWdXbcyHLF2wvrOg6IMdxtgEoI1qLJVJdMMU5fYwYkzvh6aFIfNGJ9TLonEvFJfSAOa5DIIYx9
	w5+YzDQGqeSKxz7REvpaPe85U/gK65AMBEkCFSZnmrGIteD1SYG9y/k2b0SFOYJ4DB1gR8Ag6iM
	/8SfrTLnPCI4j9yaQQqespePQCZxOZGU/SInSnjQ==
X-Received: by 2002:a05:693c:2c8d:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-3039818738dmr790404eec.11.1778800158757;
        Thu, 14 May 2026 16:09:18 -0700 (PDT)
Received: from quark-fedora-PF5F60VQ.thefacebook.com ([2620:10d:c090:500::1:695d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc464sm5159778eec.14.2026.05.14.16.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 16:09:17 -0700 (PDT)
From: Jun Wu <quark@lihdd.net>
To: miklos@szeredi.hu
Cc: luis@igalia.com,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	Jun Wu <quark@meta.com>
Subject: [PATCH v2] fuse: invalidate readdir cache on epoch bump
Date: Thu, 14 May 2026 16:09:15 -0700
Message-ID: <20260514230915.1208130-1-quark@lihdd.net>
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

