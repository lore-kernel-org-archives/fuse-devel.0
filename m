Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B730E0E4
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 18:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226726; cv=none; b=V5ik9UuABT6RcZ8dDgpPaLZQkcyEbfqx6KhnKR6FyKE/rulwJKp4I/jBwnoFS/0dFco9mLAFPUUAF3BR2hkNML9iO4uumanF4KnAWd/W69fc7MgkIr4OZUeeS8motjbU1RO6UdR5EvkInPkqpBPFMcgsBX4K/Gi2dorXJe6n/4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226726; c=relaxed/simple;
	bh=vCa4FJG3x2PP0qDHWg8JPWe7xTJosbd3gMZkDDicx44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3hXJ5jac2loaZ1IVq2cYDMdjoOKJVCkonMSDPI5tHUTjzQfEpvWysIx7mcIkTqIesBHNO55QURE6Nhr4Xfw8Oo2KwXsZO55asFCLUK/HJxPTgCeiZLTMYij7x63syCdQytAruivypxFIbj0HHkyHEEuG3alIg/sgk02W/mzh24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6FNQLk6; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6FNQLk6"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-497d6c2d000so4712451b6e.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 11:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784226722; x=1784831522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP0VI8TvYBMssuEKrk+uruFfFS0XTrxlItslh+BjNYs=;
        b=q6FNQLk689ONlG4LRGxV5P63fby4n6kVOAIaUEtwHMzQalwKNdh5ueqzdzu+Y0Q/fK
         ikDhkt/2S8Lo/sDtVmWSXY12nzwF/zt04Spg6eRm+sUxo7CNt6SaQw/dOafOah4y0Jow
         0E9lludzqWk1ZB9hCOrjIPN6nflk59Zn62A6//lw7ueBOWgztjP6n2QRYeVPQ52X6bFb
         BiHFFSYciruv1KLPgllXOTTqnOhMPsaGo4IjINJTVwclqQs7uciPvXeNFY6y+CrLSMsl
         ADzIgALUyrNd4CufY5OqUi/aJs8XT5Zx2WwbWG0AO5rkqN8qRy/PhaEdHUvyHtdLZaXU
         fM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226722; x=1784831522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SP0VI8TvYBMssuEKrk+uruFfFS0XTrxlItslh+BjNYs=;
        b=Vs9ZXwfGq9gRH5+d8L90IKnFfCCNTyQry7PZCoUAYQ6yHkjY+iDUL0TvhAXBoyc+Ku
         fHlMTkpDLj4BkcM0f/mjunXtytRutvYr1nSwVhR4IxLYxThjLh8zXjLQE6aFYBruYPz0
         G35LXDWr2NIxwwsOZbBqaH1O1gjxiCZqxz4H/ljAjnhkHZH9/HgZ6YGFI3aKkjgEcEDT
         Bwi+fQdJAD6Ni/wGOlG3XWyb0LCAJuh+or5LNPyy+PW4zXfumn4iHtJw/7SwEO2qaR7Y
         EObtmZLbTu6unQXZ6XjsyYoOBDTj5mX0qaxnaI/Zatrf288vv4TwgL/4IOFG1KA3mg96
         tZuw==
X-Gm-Message-State: AOJu0YyvJsq9tGe6DHZQ6lDawXxYa2o3piGm3wZdeT/9+fhnn9rusTVz
	Qhi9YoCqal5cQpgF3xzcjz0CNQT8v39BmC3Lcpj1OeFANXnuwlt/49Nh
X-Gm-Gg: AfdE7cneOXMj8kWX2zUPXj4cXoYeY+907kZX63qZFC813tePI6W9W1mPLrq18nFWDzK
	kYIGHuGISw3yhNt2S+ZkgAbF4T9Glv/6t1zg87/lTTq59kNtwEdF22Efg67N6t2dmwEuxniO1ma
	M5IjulOLrWccw6a+BsSe96Jijvab7HW4MWQqCM4luo7f7JAR0pBB3VsJwXIaojBPpiA/Dm6cvLi
	lv/kA4MgImoB/cdUUBcpLGSn9jlwhk87zQg3u7zU5zrzZoLObijbE6En3zcy55YAzBz7H/hQ3BT
	+VrYW/5MKB/IXEY2YzWx08Brba99GHRASP7nv4JB8qaSdLegB3Ow5dgGaVVUVHpHHpb5hvLxgNB
	ybQTi8A+W7ommiAfi53B3PXarfNDAFSv+WeMlFjYHyfDstDtVe9GpOy2yn9XlhWiGPeTKBMPzZP
	7Am1zGolrPbilu7m6yvvbWyov84u5kdnbQU8QZ8ZcZnFRWk3N0UJJr
X-Received: by 2002:a05:6808:1308:b0:494:e494:8c38 with SMTP id 5614622812f47-4a4725f6028mr7794362b6e.7.1784226722076;
        Thu, 16 Jul 2026 11:32:02 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:9::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1acc83099sm18553435b6e.2.2026.07.16.11.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:32:01 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: [PATCH v3 2/3] fuse: use release/acquire for fch->initialized
Date: Thu, 16 Jul 2026 11:31:43 -0700
Message-ID: <20260716183144.2710480-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260716183144.2710480-1-joannelkoong@gmail.com>
References: <20260716183144.2710480-1-joannelkoong@gmail.com>
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
 fs/fuse/dev.c       | 14 ++++++--------
 fs/fuse/dev_uring.c |  4 +++-
 3 files changed, 11 insertions(+), 10 deletions(-)

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
index bd3b48c4fdff..8b68b24af9d7 100644
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
@@ -1891,7 +1888,8 @@ static ssize_t fuse_dev_do_write(struct fuse_dev *fud,
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

