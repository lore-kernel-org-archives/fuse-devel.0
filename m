Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D536137C0FA
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 01:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781574270; cv=none; b=notz2ocQM9N/Y6cvixmn4k6tun7ivcX+zAoMgkFa7RmVVrsXzRICvHLxjijgAjuN2M318O+ZEB1JZ6XrOot2zxGtm/9OBJos47/21ViSWghkCRz1aQN9XEaaqHi1/P1S/Rvwi2IbgX52POjo4b4fhb8UoJBn2Hp39VapzH/SBk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781574270; c=relaxed/simple;
	bh=9rYPaGYsOYUIgGN1Dln2YFc3H/t6q4g3GdGVslp0cVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7NKhiJYOqdylQKfOuScg+NBA8uBGpBcP1B/rfkteREdXj8ndgmdEKRbfzLOMYY/B87IzeLFKWxaG0u5YZafvao10jknlayy2SNaagIZOP/8nw8kl4yKJgboMyr7i7Xxi9PRoznM141puYK3xRDHf0wb7PzxzqFI25tn2j8/o4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxxrAsMx; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxxrAsMx"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e8f690f53aso671379a34.1
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 18:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781574268; x=1782179068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=106sFJEsXiYesLx4tGkbN/uNTqLMyOGAl2xASJCN0Xk=;
        b=YxxrAsMxgAfL3rknizcXi5X6zmpdwH+/b2I7GqIRcMOeoTHw7pDzp0k6VmCxrfk8iK
         YcgpwRrmyRxvYIaJl5v5cdfelAm7Q7vN0TnWxX51R53JiM0XkuLCPnCTMggrzQPE1646
         RilbReDZEF3yUHSKNorRil+lF1d8spnBgvwtxqYM2mNx8DhHxaTvakfL8/cUT2A+KDKT
         ymHKa2N2Bvkx4svQ484hp5x0/oadfVfJVXu/eJ1YlQQuXd6uHoIsYESppXZIZ0Ukr+oy
         YsD8gZY2MfJHFt/fsgdio498xQdG4YhrhOUCwDEliw2vqFUIgWEQvlVYoF3+rng0+83G
         aN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781574268; x=1782179068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=106sFJEsXiYesLx4tGkbN/uNTqLMyOGAl2xASJCN0Xk=;
        b=pTMWU8rzuf7LpKOztx3l25Z6Myb5K+Tzfqsc28Z0lggsOdC7UL+3G8rt6U5dv0IMvO
         QfAN/xmRK3aqNXyLVxRFf013dfLPaN/ph5jjo5OlO6CWQItT82jntCDsxUOTBbK+wSS7
         QJUBzLbOZSWlJzC4DZs//4yBXwqwZ1+8WljG+gEeYrwQZsVCeaJHaPwFSMM2jMGUO8gO
         aR4SmMtp1zhnLf864x1fO0GUdOTmE33qvyGezyDz58o6iIYexrnwCKVcMj2FBf/W8PU1
         /hYvS4ajerRA/sGUWM0fR4DmNbuu16/tbA+/E1yOJ3wadhW77i7SdMAZ90ag07L13Dg8
         vv3w==
X-Gm-Message-State: AOJu0YyGhBg+bbOt4iCOSNJmsKHPaFclNF7F74xtbsfd68Ww/Du2lj+H
	L3W12BHHYJLljaueJ7fuJ1I5gWWwfZy6quuAt1k69qMM9NHeRlzBB7HE
X-Gm-Gg: Acq92OHvB3fme2vKySSQ0hb4TRRmAo1O9Y8bLoAJesjwCDLrN43WAWL7oURlaX5smUE
	HEcKMuqLQ4l80XaydVqHuJnZNPV/v9Pq8HJwUkVwQ4onyaFmeOgE9YIiJTytttNA2Zs3PptbXFJ
	UwIOjGttaCLEI5sVPqxSzyuS0yOvKU9MHzquvRfR++HX8dFOyomTEuwDh60OcEcJ4m6Ze2k3+3d
	ZIvTS8hGw7yFlBRrrkhiM/rhWHuqdGkX/Eu1No3aVeakV0b+J9XP3VK+mBbcPoNxTshitPagH3b
	eNB8sjXhRkoi4gwtPJ6VC03rMsHTiip0lUBMShErGSPYj7c8qB8yheLsr7XoMzhwiO968E4+WAh
	y0R2lXXUimPCsjjVlDKzVZLJ6C3VGtu/EzsFeeqTVZj15E2/QotKwrmYwwu1CVaHczfVxv4ICN+
	mh7PB7lEygHfA49foY7dgeq0e6IeQYXq6VPD0ufkWmT5zPULENR16XGUWnPqQzssHNfm7qsaXRZ
	krgZ7bSN4OOWOSf1bpyYSOq+8d5IGl7VSy4gk35ReljT9oH8TMsriLHOvrOTGun7A==
X-Received: by 2002:a05:6820:1a06:b0:69e:41d8:f7e6 with SMTP id 006d021491bc7-69edc620781mr10181870eaf.13.1781574267764;
        Mon, 15 Jun 2026 18:44:27 -0700 (PDT)
Received: from rdf-gcp2.us-central1-b.c.storage-xlrait-66065.internal (163.80.112.136.bc.googleusercontent.com. [136.112.80.163])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69f00b41ed1sm4093011eaf.0.2026.06.15.18.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 18:44:27 -0700 (PDT)
From: Russ Fellows <russ.fellows@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amir73il@gmail.com,
	Russ Fellows <rfellows@xlrait.dev>
Subject: [PATCH v2 2/2] fuse: allow parallel direct writes in passthrough write_iter
Date: Tue, 16 Jun 2026 01:44:19 +0000
Message-ID: <20260616014419.7913-3-russ.fellows@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260616014419.7913-1-russ.fellows@gmail.com>
References: <20260529031918.7361-1-russ.fellows@gmail.com>
 <20260616014419.7913-1-russ.fellows@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Russ Fellows <rfellows@xlrait.dev>

fuse_passthrough_write_iter() currently relies on the generic fuse_dio_lock() path to decide whether writes may run under a shared inode lock. That couples passthrough to the regular direct-IO helpers and does not make the passthrough-specific safety conditions explicit.

Keep the decision local to passthrough.c instead. Allow shared inode locking only when all of the following are true:

- the open carries FOPEN_PARALLEL_DIRECT_WRITES
- the write is direct I/O
- the write is not append
- the write does not extend past EOF

Buffered writes, append writes, and EOF-extending writes remain serialized under the exclusive inode lock.

This preserves the parallel direct-write win for safe overwrite I/O without exporting extra helper APIs from file.c.

Signed-off-by: Russ Fellows <rfellows@xlrait.dev>
---
 fs/fuse/passthrough.c | 46 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index ee822a983..c32b35a6d 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -25,6 +25,38 @@ static void fuse_passthrough_end_write(struct kiocb *iocb, ssize_t ret)
	fuse_write_update_attr(inode, iocb->ki_pos, ret);
 }
 
+static bool fuse_passthrough_io_past_eof(struct kiocb *iocb,
+					 struct iov_iter *iter)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+
+	return iocb->ki_pos + iov_iter_count(iter) > i_size_read(inode);
+}
+
+static bool fuse_passthrough_write_exclusive(struct kiocb *iocb,
+					     struct iov_iter *iter)
+{
+	struct file *file = iocb->ki_filp;
+	struct fuse_file *ff = file->private_data;
+
+	if (!(ff->open_flags & FOPEN_PARALLEL_DIRECT_WRITES))
+		return true;
+
+	/*
+	 * Passthrough writes do not use the regular FUSE direct-IO iomode path.
+	 * Allow shared locking only for direct overwrite I/O; buffered writes,
+	 * append writes, and writes that may extend EOF remain serialized.
+	 */
+	if (!(iocb->ki_flags & IOCB_DIRECT))
+		return true;
+	if (iocb->ki_flags & IOCB_APPEND)
+		return true;
+	if (fuse_passthrough_io_past_eof(iocb, iter))
+		return true;
+
+	return false;
+}
+
 ssize_t fuse_passthrough_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 {
	struct file *file = iocb->ki_filp;
@@ -54,6 +86,7 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
				    struct iov_iter *iter)
 {
	struct file *file = iocb->ki_filp;
+	struct inode *inode = file_inode(file);
	struct fuse_file *ff = file->private_data;
	struct file *backing_file = fuse_file_passthrough(ff);
	size_t count = iov_iter_count(iter);
@@ -70,10 +103,19 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
	if (!count)
		return 0;
 
-	fuse_dio_lock(iocb, iter, &exclusive);
+	exclusive = fuse_passthrough_write_exclusive(iocb, iter);
+	if (exclusive)
+		inode_lock(inode);
+	else
+		inode_lock_shared(inode);
+
	ret = backing_file_write_iter(backing_file, iter, iocb, iocb->ki_flags,
				     &ctx);
-	fuse_dio_unlock(iocb, exclusive);
+
+	if (exclusive)
+		inode_unlock(inode);
+	else
+		inode_unlock_shared(inode);
 
	return ret;
 }
-- 
2.51.0
