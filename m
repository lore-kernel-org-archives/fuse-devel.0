Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFD235CB95
	for <fuse-devel@lists.linux.dev>; Fri,  3 Jul 2026 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783070902; cv=none; b=Q/c7TtafsW3Nu9rI8xVUMlxfZaSRZEFuIM0a4DumtFCA0pHXeQP3564btapESN98MQ6esE9uKDV31DW1LyCyunN6Bh5AbrKMvAyzE6EPZn1S1soMe356IRlLZL0p7+sod2WyT4jFjTDH6GHkHonC68WWkd7k0GLO1B+8lgh8RYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783070902; c=relaxed/simple;
	bh=o7Oj/Glmm0ayp6HA2vscKbnaMio3ZA7xnqfRDryCqzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKvUe3PvZMF9VdV/4cVW5lKADjptitPgyRH2kwpqhViGCDEatZXjIcQrPBU+TORoAE+bx9bSfnxAHr8ZzNOrPHp0kA1ZuE2vEsq0xluHggLnmIQvwkBY69Ov+p/gfGCxRXTolRYx83sJqMY2A+M5EkRGKv4qZVQxaoj8YQsho6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDHomRjZ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDHomRjZ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso280116a12.1
        for <fuse-devel@lists.linux.dev>; Fri, 03 Jul 2026 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783070900; x=1783675700; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZJx4eCybgllyk92N6bHvhBINveUFJUiVL5BNSD9Fr0=;
        b=kDHomRjZziuqgTH6SL+6eweO/5EnUjlDFAc7msCjztFDyvkj/x2Q8I92zEP2wLsTAV
         44XKx6k3DVn+cH2jaQkGquVVMRu5APkRXqmmWwyMMBKc0lLAWZUXWZ0UHOeKJ13JiTrb
         KilNSDFhhRXTMNJg6xciPOokz138vJO6WoOG7EuHItQjqNyJ7nXrIv2aQ6D6dyGoPQ7c
         N6ntt2XEwzaoZO0V295Vr7mRxRL4F5l/xe9rf5+N+Q8pP6f6J7H+5KwbbX3Q/qh4MEGF
         vH7yn+vgKBI2txQI/KWrJiocD1Q+PQVZLUMtfnoeg4aaq6pq9QcJNsrAdbReFKFGbEtW
         aVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783070900; x=1783675700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZJx4eCybgllyk92N6bHvhBINveUFJUiVL5BNSD9Fr0=;
        b=ZQrKO1Q/SKpLMENY3/cPOrx08ilIY+sxrEXOhJMXLe4mYlbAHNjRrcrnZrlPuNxl9U
         z56Yi0lomx9BeWmri0vvEPkQI69GhYWLcv/DOYmb98DSQeCpWTnDNOpYMZIpNSMLjL1Q
         F0EPN+U+O7GDXfcB38siuTtgOUng/xm0PUQQVlKkFijACLXd983pE8gxumLSdcawOg3h
         bMRBFPauWzh5Mndr7lggMap+xsixl0wu2BOhvUbdRtZuDQ38E+ew2EDzr5B6UzYb90pe
         Q35KvzRbfOGL1Ngr2fA04B5z8JF7FxH6weK/iTmsnTY/lvy2bdHVAMuGNzDH8hZJIqTf
         9ULA==
X-Gm-Message-State: AOJu0YwAMQBaXxODCkuuvCbQSOe7YQSm18NX/lgjvNjFF+pz1YLi2yCb
	jFxGWTk728WUrw2ejDuqU6KObOKmtX23wzEdBa0FB2N5/2T8tmqT4lMA
X-Gm-Gg: AfdE7clZ6XouqizJcdmfquwyWbl5W/P2T6Wb65QjoeVtaQqS2jM+Dc0HZaSdaKHuPWT
	caV8g4Fj8z5kxH0KMZFs2zWDo/aF8z9GESKmVyrfIZi48sNfMgkif9vPmVVjyik469PdZbo1kQ0
	DkWPWM4hHNSRnD4uIcyV9UGNYbExyQagxkyOl5xTd0scCmyF0yQuPQldt7wMbV4ljxg0ksPtx+K
	WCFheHog6QpoC94fE2xdlb6FPmyMPB5D0MbWKsFO6gMr2m5z74YGOpKFLRbq7HFG7wbJ+BaqLbR
	fyjC5RTzJshlbTn1TUSEQtwDzu77w2hN2GN3iIlNmoQ24+e1UlNuPWRFt0+WRjXgaSG5RK2UID7
	Ls41uVnhyOlALvikMFSq03pl7kGNUDjfDIOWt2QTS/XMxpTSvfLns30iTKJOpHbYDzlHr3kGaoB
	7nyEllvgpebNjvuh8XX3v4JoKEslx760hwLjctc/BLp58TFc9vau6UQk/lrN2c8zIJNfYkfNOgS
	8cNnXbB0splaP+ox8Zcc/VcD90vbUSWAdOzi3y8GiVpF/BJeJ+tyeKfdnuw/xJt7kTUoQ==
X-Received: by 2002:a05:6a20:7287:b0:3bf:b50f:71bb with SMTP id adf61e73a8af0-3bfed249d11mr10361052637.27.1783070900067;
        Fri, 03 Jul 2026 02:28:20 -0700 (PDT)
Received: from swethv-c4-folio2.us-west4-a.c.gcs-fuse-test.internal (81.116.125.34.bc.googleusercontent.com. [34.125.116.81])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef188sm17559323c88.2.2026.07.03.02.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 02:28:19 -0700 (PDT)
From: Vadlakonda Swetha <swethav0411@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vadlakonda Swetha <swethav0411@gmail.com>
Subject: [PATCH] fuse: add folio_max_order and folio_min_order controls in fusectl
Date: Fri,  3 Jul 2026 09:28:15 +0000
Message-ID: <20260703092815.4602-1-swethav0411@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose `folio_max_order` and `folio_min_order` entries under the FUSE
control filesystem (`/sys/fs/fuse/connections/<connection_id>/`).

Motivation:
For fuse based systems like GCSFuse (Google Cloud Storage Fuse), large
folios gives a significant boost to the read performance.
- Without large folios, single file read perf is capped at 3GiB/s
- With large folios, we are able to achieve 12GiB/s, 1MB blocksize
- Writes:2GiB/s with large folios vs 1.6GiB/s without folios for 1MB bs

We understand that subfolio dirty page tracking is not available for
writeback cache with large folios. However this is not a blocker for
GCSFuse and similar cloud/network-based filesystems for the following
reasons:

1. We generally recommend applications to use larger io sizes (>1MB)
   for writes because of the latency involved with the network calls.
2. Random writes & small overwrites are also not recommended for cloud
   based filesystems.
3. Beneficial when write back cache is explicitly disabled. Incase of
   GCSFuse, write back cache is disabled for different other reasons.

Providing these controls allow individual filesystems to explicitly opt
into large folios once they evaluate their specific workload patterns.

Why sysfs (/sys/fs/fuse/connections/):
Exposing the folio order range via `fusectl` provides a simple interface
that avoids needing to bump the FUSE UAPI protocol version or update
libfuse, while allowing dynamic tuning of active FUSE mounts.

Testing:
- Verified folio order range assignment on regular inodes.
- Range validation checks (min > max and order > MAX_PAGECACHE_ORDER)
  correctly return -EINVAL.
- Added automated selftest to tools/testing/selftests/filesystems/fuse/.

Signed-off-by: Vadlakonda Swetha <swethav0411@gmail.com>
---
 fs/fuse/control.c                                         | 109 +++++++++++++-
 fs/fuse/fuse_i.h                                          |   6 +
 fs/fuse/inode.c                                           |  13 ++
 tools/testing/selftests/filesystems/fuse/fusectl_test.c  |  33 +++++
 4 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/control.c b/fs/fuse/control.c
index 21ffde596..49144a04d 100644
--- a/fs/fuse/control.c
+++ b/fs/fuse/control.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/fs_context.h>
 #include <linux/namei.h>
+#include <linux/pagemap.h>
 
 #define FUSE_CTL_SUPER_MAGIC 0x65735543
 
@@ -173,6 +174,94 @@ static ssize_t fuse_conn_congestion_threshold_write(struct file *file,
 	return ret;
 }
 
+static ssize_t fuse_conn_folio_max_order_read(struct file *file,
+					       char __user *buf, size_t len,
+					       loff_t *ppos)
+{
+	struct fuse_conn *fc;
+	unsigned int val;
+
+	fc = fuse_ctl_file_conn_get(file);
+	if (!fc)
+		return 0;
+
+	val = READ_ONCE(fc->folio_max_order);
+	fuse_conn_put(fc);
+
+	return fuse_conn_limit_read(file, buf, len, ppos, val);
+}
+
+static ssize_t fuse_conn_folio_max_order_write(struct file *file,
+						const char __user *buf,
+						size_t count, loff_t *ppos)
+{
+	unsigned int val = 0;
+	struct fuse_conn *fc;
+	ssize_t ret;
+
+	ret = fuse_conn_limit_write(file, buf, count, ppos, &val, MAX_PAGECACHE_ORDER);
+	if (ret <= 0)
+		goto out;
+
+	fc = fuse_ctl_file_conn_get(file);
+	if (!fc)
+		goto out;
+
+	if (val != 0 && val < READ_ONCE(fc->folio_min_order)) {
+		fuse_conn_put(fc);
+		return -EINVAL;
+	}
+
+	WRITE_ONCE(fc->folio_max_order, val);
+	fuse_conn_put(fc);
+out:
+	return ret;
+}
+
+static ssize_t fuse_conn_folio_min_order_read(struct file *file,
+					       char __user *buf, size_t len,
+					       loff_t *ppos)
+{
+	struct fuse_conn *fc;
+	unsigned int val;
+
+	fc = fuse_ctl_file_conn_get(file);
+	if (!fc)
+		return 0;
+
+	val = READ_ONCE(fc->folio_min_order);
+	fuse_conn_put(fc);
+
+	return fuse_conn_limit_read(file, buf, len, ppos, val);
+}
+
+static ssize_t fuse_conn_folio_min_order_write(struct file *file,
+						const char __user *buf,
+						size_t count, loff_t *ppos)
+{
+	unsigned int val = 0;
+	struct fuse_conn *fc;
+	ssize_t ret;
+
+	ret = fuse_conn_limit_write(file, buf, count, ppos, &val, MAX_PAGECACHE_ORDER);
+	if (ret <= 0)
+		goto out;
+
+	fc = fuse_ctl_file_conn_get(file);
+	if (!fc)
+		goto out;
+
+	if (READ_ONCE(fc->folio_max_order) != 0 && val > READ_ONCE(fc->folio_max_order)) {
+		fuse_conn_put(fc);
+		return -EINVAL;
+	}
+
+	WRITE_ONCE(fc->folio_min_order, val);
+	fuse_conn_put(fc);
+out:
+	return ret;
+}
+
 static const struct file_operations fuse_ctl_abort_ops = {
 	.open = nonseekable_open,
 	.write = fuse_conn_abort_write,
@@ -195,6 +284,18 @@ static const struct file_operations fuse_conn_congestion_threshold_ops = {
 	.write = fuse_conn_congestion_threshold_write,
 };
 
+static const struct file_operations fuse_conn_folio_max_order_ops = {
+	.open = nonseekable_open,
+	.read = fuse_conn_folio_max_order_read,
+	.write = fuse_conn_folio_max_order_write,
+};
+
+static const struct file_operations fuse_conn_folio_min_order_ops = {
+	.open = nonseekable_open,
+	.read = fuse_conn_folio_min_order_read,
+	.write = fuse_conn_folio_min_order_write,
+};
+
 static struct dentry *fuse_ctl_add_dentry(struct dentry *parent,
 					  struct fuse_conn *fc,
 					  const char *name, int mode,
@@ -267,7 +368,13 @@ int fuse_ctl_add_conn(struct fuse_conn *fc)
 				 NULL, &fuse_conn_max_background_ops) ||
 	    !fuse_ctl_add_dentry(parent, fc, "congestion_threshold",
 				 S_IFREG | 0600, NULL,
-				 &fuse_conn_congestion_threshold_ops))
+				 &fuse_conn_congestion_threshold_ops) ||
+	    !fuse_ctl_add_dentry(parent, fc, "folio_max_order",
+				 S_IFREG | 0600, NULL,
+				 &fuse_conn_folio_max_order_ops) ||
+	    !fuse_ctl_add_dentry(parent, fc, "folio_min_order",
+				 S_IFREG | 0600, NULL,
+				 &fuse_conn_folio_min_order_ops))
 		goto err;
 
 	return 0;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 85f738c53..e57f52931 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -450,6 +450,12 @@ struct fuse_conn {
 	/** @max_read: Maximum read size */
 	unsigned max_read;
 
+	/** @folio_max_order: Maximum folio order */
+	unsigned int folio_max_order;
+
+	/** @folio_min_order: Minimum folio order */
+	unsigned int folio_min_order;
+
 	/** @max_write: Maximum write size */
 	unsigned max_write;
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index d975073c6..c093a7d45 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -9,6 +9,7 @@
 
 #include <linux/dax.h>
 #include <linux/pagemap.h>
+#include <linux/log2.h>
 #include <linux/slab.h>
 #include <linux/file.h>
 #include <linux/seq_file.h>
@@ -413,6 +414,18 @@ static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
 	if (S_ISREG(inode->i_mode)) {
 		fuse_init_common(inode);
 		fuse_init_file_inode(inode, attr->flags);
+		if (fc->folio_max_order || fc->folio_min_order) {
+			unsigned int max_order;
+
+			max_order = fc->folio_max_order ?
+				    fc->folio_max_order : MAX_PAGECACHE_ORDER;
+			mapping_set_folio_order_range(inode->i_mapping,
+						      fc->folio_min_order,
+						      max_order);
+			pr_info("fuse: inode %llu folio order range set to min=%u, max=%u\n",
+				(unsigned long long)inode->i_ino,
+				fc->folio_min_order, max_order);
+		}
 	} else if (S_ISDIR(inode->i_mode))
 		fuse_init_dir(inode);
 	else if (S_ISLNK(inode->i_mode))
diff --git a/tools/testing/selftests/filesystems/fuse/fusectl_test.c b/tools/testing/selftests/filesystems/fuse/fusectl_test.c
index 0d1d012c3..56c849c3f 100644
--- a/tools/testing/selftests/filesystems/fuse/fusectl_test.c
+++ b/tools/testing/selftests/filesystems/fuse/fusectl_test.c
@@ -137,4 +137,37 @@ TEST_F(fusectl, abort)
 	ASSERT_EQ(errno, ENOTCONN);
 }
 
+TEST_F(fusectl, folio_orders)
+{
+	char max_path[PATH_MAX];
+	char min_path[PATH_MAX];
+	int fd;
+
+	sprintf(max_path, "/sys/fs/fuse/connections/%d/folio_max_order", self->connection);
+	sprintf(min_path, "/sys/fs/fuse/connections/%d/folio_min_order", self->connection);
+
+	/* 1. Verify sysfs files exist */
+	ASSERT_EQ(0, access(max_path, F_OK));
+	ASSERT_EQ(0, access(min_path, F_OK));
+
+	/* 2. Set valid folio_max_order = 8 */
+	write_file(_metadata, max_path, "8");
+	/* 3. Set valid folio_min_order = 4 */
+	write_file(_metadata, min_path, "4");
+
+	/* 4. Reject invalid write: min_order > max_order (e.g. min=10, max=8) */
+	fd = open(min_path, O_WRONLY);
+	ASSERT_GE(fd, 0);
+	ASSERT_LT(write(fd, "10", 2), 0);
+	ASSERT_EQ(errno, EINVAL);
+	close(fd);
+
+	/* 5. Reject invalid write: max_order < min_order (e.g. max=2, min=4) */
+	fd = open(max_path, O_WRONLY);
+	ASSERT_GE(fd, 0);
+	ASSERT_LT(write(fd, "2", 1), 0);
+	ASSERT_EQ(errno, EINVAL);
+	close(fd);
+}
+
 TEST_HARNESS_MAIN
-- 
2.45.2
