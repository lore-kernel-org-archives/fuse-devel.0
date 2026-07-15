Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7364F3AEB49
	for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137406; cv=none; b=HeWdfqHaaakSupdOvUPYxkz47Ug0klstpKD+mQtfQn6qVJPFfzWK3fpB0wbAeYhsg/RXvC5wl3VvStZoTnfUJEtUYsVh9Yj7ANdoPkGIoemHGtEVMoqGvW2xYJDLSPXz84rotTgvgiIDf9r5GRdNBiyzmdpntfCjIXw/5Dyn/vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137406; c=relaxed/simple;
	bh=WIWT9uIraRjJe8Zruk72Ry9o3JzoZWoctT2K32LBypo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FInEHRd2Tmk5D5+PO+gV9nO5sAfTyImjmCLVu5qq8CayuNlKcnnEx0Afuja9yUYRou5MGEunVawHLjfesrRlr3wby6wh+jZ0G51hSPAdHTj1h8fbUFfSSo3dHxKcArIhhRoGHUXu/R8ZK3uv32dtflWG8H3nrqcCDIrIsP0679U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDH1vhpb; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDH1vhpb"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7eb787dec99so3507404a34.0
        for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 10:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784137404; x=1784742204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRDBvHODg3VQpoXqCB6D4/SGLo4Efx6JG+J7huRCZqo=;
        b=UDH1vhpbJfFdcL4bgmGrY2AR3wm9QPq00gJFm6huz/in5SGi8kg+ARm7culxH4LboM
         EYQXOcLbckg6ouZeTMHLKFHppl5aaQon6q8dUMVFFmor5JcvdGa1I1on2FMb8ep/wQlM
         rbNmbPfVYvfI49P6ffSg5QOWosy/LguZTc3+3ZciAWIZRKE1dXwy+5iSDwlPrAd0mmvT
         a2lNiDoeZDXGhPF8sVgntO9lYl4Nvf5AvVmeESieAnnxpaAmie5r58I6+vJ/6ExCsUgb
         Xr8kH18HMfcAAiNnRJJbVfYhILlsTINbnY+MY+E1Tcsnb4ozpnqhYD0r2I7JcoMgofHU
         UeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784137404; x=1784742204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRDBvHODg3VQpoXqCB6D4/SGLo4Efx6JG+J7huRCZqo=;
        b=UwYAkQ5X572mAYXqWS1BZnSX6DrRXX/XbeRlQFTprNBYE08wRxRiG3mZGOnr58oJvo
         7wCq9fLUTMev4Myue7nNzHPIC9mVaqGhvMetxJeJo1+nwtUN2lujN8BkkmPuYb9SK2zh
         VCZKmqafjMe0xM8x2Amj8ZPrKU4u2kl3ImZ7Rjx2StdhayneUZKAc/748f1jB+DkVGpR
         YMbPQwKXmQtH82k/tFdyEdzu0q9sWV6XTVC42ksv4Sha+fMObh084X1uNPlH0DOGcHd5
         zSUc5whCkXtQTm55f91fPS6AZPXvYkmXnzDql0KeaiWwQQgxzjuI5CgkyRmPCoMMj04y
         Hy0Q==
X-Gm-Message-State: AOJu0Ywy8rVs06LVFd/Er++leqo0S7hY4RlX25bE9/luKvtu/+fEd9bg
	Xrne/TrYS/VKk2VjifcAsZcrVfV7wtvFL9iIw12Ba86T58JWIKcLu1Ia
X-Gm-Gg: AfdE7clfOnSTlE/MmcbcvFgM89DkGjvlpbLUBoYig3u7yV7efyAdeN8yHaIbrEt7fOn
	kG6MYkS5iSF0y+ijXnj05iDSx0t3egmQbN+uItBCQiawhZ/rjQTxX9GqQPOxYQfgTB8EqBoczn5
	IbmZe14CLXTt5tSESHRD8sXcaDiqp1MliIqkfJ1Kfvk2q9ZnyblPT8HSqhg+0cF/UWM34fg22Ze
	EisLk8F9Sbzhmh1aEVequDQuYJAfXX7Ib1hxKlTWhuxf71DgGgm75nT8CPC2xhpgJmiegElWm5x
	aGsQJxJIdLDV4wcOeuUUymk+SjBR6b0frVn9tPzzhpdYneJhoLKDNx2CWLvb8GXKPCEYVo9aEU8
	sRRZvij5ZQIA5052fAygOUhHM4hbjDtt3irNRr7g2fW8dPfH4Ojrbnwhy/Va9O1A17I24rJiY6r
	l0fAZVX9ZpMBYZdqys+jeKgh1Pp9pS1ivf2YeuoJ4O87I8rlN6TBSHZVEVUju/Eq+wDcH7awsrl
	jA=
X-Received: by 2002:a05:6820:61d:b0:6a1:51bd:219c with SMTP id 006d021491bc7-6a3d9ff2c5emr2078613eaf.40.1784137404135;
        Wed, 15 Jul 2026 10:43:24 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:49::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38a4bd734sm10472532eaf.4.2026.07.15.10.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:43:23 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: [PATCH v2 2/3] fuse: use release/acquire for fch->initialized
Date: Wed, 15 Jul 2026 10:43:04 -0700
Message-ID: <20260715174305.336261-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260715174305.336261-1-joannelkoong@gmail.com>
References: <20260715174305.336261-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_chan_set_initialized() sets values for the connection state and
then sets fch->initialized to true, but lockless readers read
fch->initialized and if true, go to read the connection state values,
without using any barriers.

There are a few instances where this happens (fuse_uring_cmd() before
dispatching register / commit-and-fetch cmds, fuse_dev_do_wriite() for
handling notify retrieves, etc).

To make this as simple as possible, use release/acquire semantics for
writing/reading fch->initialized. Add the missing read barriers.
This is not marked for stable as these are not realistically reachable
on a well-behaved server, and buggy/malicious servers who trigger this
path fail benignly rather than crash or deadlock the kernel.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/cuse.c      |  3 ++-
 fs/fuse/dev.c       | 17 ++++++-----------
 fs/fuse/dev_uring.c |  4 +++-
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/fs/fuse/cuse.c b/fs/fuse/cuse.c
index 3c15b5ba16d7..96d57735a79f 100644
--- a/fs/fuse/cuse.c
+++ b/fs/fuse/cuse.c
@@ -530,7 +530,8 @@ static int cuse_channel_open(struct inode *inode, struct file *file)
 
 	INIT_LIST_HEAD(&cc->list);
 
-	cc->fc.chan->initialized = 1;
+	/* Pairs with smp_load_acquire() readers of fch->initialized */
+	smp_store_release(&cc->fc.chan->initialized, 1);
 	rc = cuse_send_init(cc);
 	if (rc) {
 		fuse_dev_put(fud);
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index b70c536d7e25..8b68b24af9d7 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -77,20 +77,17 @@ void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_param *pa
 		fch->max_pages = param->max_pages;
 	}
 
-	/* Make sure stores before this are seen on another CPU */
-	smp_wmb();
-	fch->initialized = 1;
+	/* Pairs with smp_load_acquire() readers of fch->initialized */
+	smp_store_release(&fch->initialized, 1);
 	wake_up_all(&fch->blocked_waitq);
 }
 
 static bool fuse_block_alloc(struct fuse_chan *fch, bool for_background)
 {
-	if (!fch->initialized)
+	/* Pairs with smp_store_release() in fuse_chan_set_initialized() */
+	if (!smp_load_acquire(&fch->initialized))
 		return true;
 
-	/* Pairs with smp_wmb() in fuse_chan_set_initialized() */
-	smp_rmb();
-
 	return (for_background && fch->blocked) ||
 	       (fch->io_uring && fch->connected && !fuse_uring_ready(fch));
 }
@@ -126,9 +123,6 @@ static struct fuse_req *fuse_get_req(struct fuse_chan *fch, bool for_background)
 			goto out;
 	}
 
-	/* Matches smp_wmb() in fuse_chan_set_initialized() */
-	smp_rmb();
-
 	err = -ENOTCONN;
 	if (!fch->connected)
 		goto out;
@@ -1894,7 +1888,8 @@ static ssize_t fuse_dev_do_write(struct fuse_dev *fud,
 		 * initialized and connected state
 		 */
 		err = -EINVAL;
-		if (!fch->initialized || !fch->connected)
+		/* Pairs with smp_store_release() in fuse_chan_set_initialized() */
+		if (!smp_load_acquire(&fch->initialized) || !fch->connected)
 			goto copy_finish;
 
 		/* Don't try to move folios (yet) */
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 77c8cec43d9c..51f985154aa1 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1251,8 +1251,10 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
 	/*
 	 * fuse_uring_register() needs the ring to be initialized,
 	 * we need to know the max payload size
+	 *
+	 * Pairs with smp_store_release() in fuse_chan_set_initialized()
 	 */
-	if (!fch->initialized)
+	if (!smp_load_acquire(&fch->initialized))
 		return -EAGAIN;
 
 	switch (cmd_op) {
-- 
2.52.0

