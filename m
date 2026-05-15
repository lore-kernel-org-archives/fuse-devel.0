Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDDE3E2AC9
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778871324; cv=none; b=Z6Qz6E+cjIdU8l98GoA7JHKmEJzi9y//t0lEoTFCUPyA8VxW2ZXDaJ76XNCpo7xctomKEjSzZB86gOWknn/GGErXXNMqr6V6uB7Rgtx6v2eVhL0Jg3fz4hKQ0inuHJFCtIdiQ9rC5067AQDMZwmDCaHd/72FrL7DSdrpxFRvAEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778871324; c=relaxed/simple;
	bh=kcLqChfaUfsZxdE+ZaoO7Smuxnpjx+gJEFnekfLsXTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OSHZ27fR026vxM2GRQeh3X1889N2LxbgXok2Tpkh409yYYp4W67aLRb08R8t6IuKi5bZMoG2mPIzbhjFY0ZFpEA5BqU5jiLoIJvx0ky9pvZYIEW1OWzZNgEthEaTSNilLNiA5lIF/Hbe1IslH8GNLUMqFEoAk3Rjwpc4nyOZGOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsRmpDrV; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsRmpDrV"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-130c9dcbd25so894066c88.1
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 11:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778871322; x=1779476122; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bvYQW2qTx86IbdiITvwUjahuQt1CJMW14vU3xiZInE4=;
        b=EsRmpDrV4QE8jwN4Ryb7dUQt9Wma3Eu3i9EFNAJQ2ADpVyrCO7HW3F32tRWQrN5oul
         qj7sFJXI4t3YouTjFK4zOvKCdz2ulh+TDmuqjJMYsdzLKQIapsSuiFathdDuCSGmwJzi
         oj2rLaQ+CzWnjIdtMEZ2Cd2DMlZLNmfyssrke8PxU381vlAQGcf50vqywm4U32w5zRFc
         G4uk/ClxmBo+StidoOzlb9Pun70UAHTIyy6I5Gix7lCuhHGi/SsJi3+sNJWR3souBkuN
         v0a2PWC24uWmAAkK3F56v43ntIHYuqbZ8JqaWF24dQuLpw0AJaBzqKRJjVx/p/qR0VV4
         txFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778871322; x=1779476122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvYQW2qTx86IbdiITvwUjahuQt1CJMW14vU3xiZInE4=;
        b=HCqrq9ju7uXh7CTegoifkNXZzj+/bOqc/gu2MVXRZCmowvu5/Dwt7cBKjYVZXYcY1z
         yWmJeuwgbTCNHhZmCj3v8asRC8rm7eQxAR278faOHOD6zvbaCPiXfZUgd0iyKgphx/5l
         esilwnO+S+rrGVx9x3Tq7nzx4tGBzgzRNFsaDqxWL+EEPMS2GTBnXKO2J93HZIboFJxo
         szB7wRhq+YCXPD4RsHT7m9yOwvCuQvsbldCXi3v2Iq+WvgmOcDfyqq45ws22wY0oUlxw
         wdGATQdkk9fErvFEi6gBmsz3x1ytOiib+qVHxLsotGly9b1xRm4su8ToU+t6EW8VLNRD
         2Xqw==
X-Gm-Message-State: AOJu0Yzi0kIBfirvjZMWHo5EIdsak+FgvnkoHvKN1usCmAC5JM6l+hhh
	F9AI9MsqTHUGaiqJ5G3+16xTBPkuzMt62R/AOY2AtBgyYJOlAPDhs9maZ802Ng==
X-Gm-Gg: Acq92OEhKsfcp+JyIphfKiLhghbtUoVfImuebK1SZj6jn64TsD2xqF196cSw1+b0ti5
	A8A6DT4oSUwDiFsWR3DDoWgbpiKeTfyX8P0faMGQrS0k7yIp8Tcb9p3IQ57oLdN12bv+H0+EYf9
	tdaRhgHWaIPlBgsrhkL7MHZuAE02k30bcW2dMZLe7NYNiZSNXDTyZ01IGCXvoZ2c+JTnWfI3bMM
	d77IUgr8LMO9kG7EitRch0ngv/iVPJSmH5McNCFXrM6dWQNACfaSk+zi1noAquZcO9xcWF96sLG
	Ze90fCZAbBBM9IbAgjdh8FBDf7C8/opLrsLhsWvnne63njI5Q5bIYrHKvR3ud+I0i7qsbVNU0Jd
	ZlrckdyLklBM18qZ21LMFXJwyuoYgik707+Uz6ZglmaMd8uR27Q7VEdBhIh/vgs2zeSVdoP4Z7x
	nhYekjG2iQzTE0fqpFHjFDsg9fik7I0QvNccEmZG1jQpcglJods872J1m/FXGrOe89+vHQO+FrQ
	W23bmgjFqpWaAv4tg==
X-Received: by 2002:a05:7300:a888:b0:2f0:ee2:f6c6 with SMTP id 5a478bee46e88-30262b43a2bmr4085107eec.19.1778871322185;
        Fri, 15 May 2026 11:55:22 -0700 (PDT)
Received: from quark-fedora-PF5F60VQ (162-199-88-188.lightspeed.sntcca.sbcglobal.net. [162.199.88.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302947e917dsm7746100eec.12.2026.05.15.11.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 11:55:21 -0700 (PDT)
From: Jun Wu <quark.zju@gmail.com>
To: fuse-devel@lists.linux.dev
Cc: miklos@szeredi.hu,
	luis@igalia.com,
	Jun Wu <quark@meta.com>,
	Joanne Koong <joannelkoong@gmail.com>
Subject: [PATCH v3] fuse: invalidate readdir cache on epoch bump
Date: Fri, 15 May 2026 11:55:20 -0700
Message-ID: <20260515185520.1462772-1-quark.zju@gmail.com>
X-Mailer: git-send-email 2.54.0
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
Reviewed-by: Luis Henriques <luis@igalia.com>
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: Jun Wu <quark@meta.com>
---
Changes in v3:
- Add Reviewed-by tags from Luis and Joanne.
- Resend from a working email setup.

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

