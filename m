Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8FA3A6B89
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 17:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224800; cv=none; b=pt886IfKupXML4T1EqbCNbL4q4q/a4TvubYpi3+CEuf4SRLHozxF72VvyttGSPTjB9xJQ7h10fLnUBJpAvrCeBSpVuHTlaJUkuJDahKlRW0P86kKo1w9oua5VCTPkqE5IaDvxwV0/sS5yGx5VTdlelDXA3WtTaOxiZmEC0gva0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224800; c=relaxed/simple;
	bh=DU8FXKGHbv+Xw/FIO/UXkd1Q9z48fLeLGogZn85OPv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnlC0Bdyop5Bm1yhTiAuQSqPVqF1JrhCiGYfOdKEYy+JaGWvYufM5XetPYsPfubBTLoM/APDjBmknXS/8xuIEdjalH716Pqp+hSlg3XHhFQk7P9Hi788D0YOsYY/aj2uJCKvNU9Z/Bu+Zc0LLeHYXm0k8rHSGa1OQ9wEYpS0ZqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xt0o+jMs; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xt0o+jMs"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-497e6956acfso712504b6e.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 10:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784224798; x=1784829598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYst7WNcjmxeB8jO2DDFGMgQcXN9jRbBr24jo13eahg=;
        b=Xt0o+jMstKjKQjvwqi45TG8iO1/SSc96318pHIy1VtfANVxb9V6A0NPJvmTI5RpLjS
         dc02P2Yzoh2a6K596Lw7vDR5qILsqo9T6WyXzYDS6QlZkpYq4b3NJCVoIJvLSdLcCihl
         bCUgPcHVUg3xj4UKqiGF8uykIDctjAkewY2xvvat37Y8NF6hCeDSPYVDeDF+Kyldp3O2
         piqFA4RVcwg+U7T8ugjIgYKbUoQVK7J6lbhDaz29he+V8FDYNRqOox4yE3gSHX+h+5xO
         Pu5qETYdNII15yg1IAf3uc9RShEZtoBldHYjqdDu5fOd3J9ZfBcl2scrxw8gJ4/cV0VA
         fpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224798; x=1784829598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYst7WNcjmxeB8jO2DDFGMgQcXN9jRbBr24jo13eahg=;
        b=EjV6ywJhKqBPzGXqtAyAYdbmThFU3guc5ucbdg73Y7W9cQE8lfjbVX+cA9Kf1OSMqM
         X8qjrFpXVTeDbod+O0M2nWN6CseET1Ki9vtDjb+T8N83ukqgGcn+mtrR9Ww/zixjWTBT
         7ZMWzCKmEdBo6xpdtCHE2V9Nj70XJdUpcax6zdmlXb6Wb47Vn7G3GnLNvlQUYKQPN79A
         +G3M2C+ASyN6L6g9ujM9pGTmuiNs634bxMK8j8AoVzOrqBJRI9HMFp7HFGZf0+lqZXn4
         BeqtA8QF5VjT9qxLfmCa8oomnLefLB4uaFRZyzy9i0pWv2l/JQTXxyQNEBBIJkpIN4j4
         TYew==
X-Forwarded-Encrypted: i=1; AHgh+RoMb0yQBD85UbnBkUuazsQgX4GhZn0/J9wvX8KW2iM+acWNfW8Nyb46JLXOEYrhKqf6B4oFKhXnujn5@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4fZCIff6KR+OgVPhm1XmI1ls3y419IqRKZAs7iQUuAi/zCLaE
	6DfYuvw660yGC3i0fVK37bBWNU+Zx2W5jHHWTQhcd+Sw+3yzIg7fOr1f
X-Gm-Gg: AfdE7cktBVNJW0G30jGdnN2jUOYj26sq/DOzdwzW/S6xddcOlM+SEK6thsOuOmGc9U2
	+Hnhr3DYOgTf3t+EKGdJgUaoIhCn1zykyVt8Jf722ZKbABvvQG6Za0Gz4UWOTI4NiIda/lyCJfF
	yS4EHY5hpI+OEBayxZkIlzgN7w0MCt+RFQYrUpZ8im6oSsHEdbGBcBvulbIPVtatbZqlW156IA+
	e7AN5qOcXY1shbdXTrnF3uNRhgRY/TSOvSf15HshTPzweZGgZduwRF4s7+E6o+hv9yFIVLpKsqQ
	+szhF/6JTRCMYUJNw8c2Y+CIVETS+57Q2O71J2XAmvyPOqF6EwZJnrFM6TO7YCPFSizLSeHfD4I
	yJkqIteInLrADS6/Wpunu/ipXX5frjkPKVz65Fjr9U/S30gfnYeMEWrmPMoU21+mK1QQVI3I4Hy
	CXNccFaKaD1LBiXRQQhHJEsbFYKREgnTTNlpOmJXtEgvyYSsVNYkjtFw==
X-Received: by 2002:a05:6808:148b:b0:497:db25:8a2a with SMTP id 5614622812f47-4a4b2314453mr2015770b6e.13.1784224797995;
        Thu, 16 Jul 2026 10:59:57 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:73::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a41f5b69bfsm13328570b6e.17.2026.07.16.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:59:56 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	amir73il@gmail.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v6 2/6] fuse: add FUSE_IO_URING_CMD_ADD_QUEUE
Date: Thu, 16 Jul 2026 10:59:04 -0700
Message-ID: <20260716175908.2339738-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260716175908.2339738-1-joannelkoong@gmail.com>
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse-over-io-uring queues are currently created lazily, as a side effect
of the first FUSE_IO_URING_CMD_REGISTER command for a given qid. This
ties queue creation to entry registration.

Add a FUSE_IO_URING_CMD_ADD_QUEUE command so a server can create a queue
explicitly, decoupling queue setup from entry registration. This is
additionally a prerequisite for FUSE_IO_URING_CMD_ADD_BUFPOOL, which
attaches a buffer pool to an existing queue and therefore needs the
queue to have been created first.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c       | 45 +++++++++++++++++++++++++++++++++------
 include/uapi/linux/fuse.h |  8 ++++++-
 2 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index b7c6100c4176..fdf1058e582c 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -281,7 +281,8 @@ void fuse_uring_conn_init(struct fuse_chan *fch)
 }
 
 static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
-						       int qid)
+						       int qid,
+						       bool fail_if_exists)
 {
 	struct fuse_chan *fch = ring->chan;
 	struct fuse_ring_queue *queue;
@@ -289,11 +290,11 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 
 	queue = kzalloc_obj(*queue, GFP_KERNEL_ACCOUNT);
 	if (!queue)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	pq = fuse_pqueue_alloc();
 	if (!pq) {
 		kfree(queue);
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	queue->qid = qid;
@@ -316,7 +317,7 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 		spin_unlock(&fch->lock);
 		kfree(queue->fpq.processing);
 		kfree(queue);
-		return ring->queues[qid];
+		return fail_if_exists ? ERR_PTR(-EEXIST) : ring->queues[qid];
 	}
 
 	/*
@@ -1189,9 +1190,9 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 
 	queue = READ_ONCE(ring->queues[qid]);
 	if (!queue) {
-		queue = fuse_uring_create_queue(ring, qid);
-		if (!queue)
-			return -ENOMEM;
+		queue = fuse_uring_create_queue(ring, qid, false);
+		if (IS_ERR(queue))
+			return PTR_ERR(queue);
 	}
 
 	/*
@@ -1206,6 +1207,30 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 	return fuse_uring_do_register(ent, cmd, issue_flags);
 }
 
+static int fuse_uring_add_queue(struct io_uring_cmd *cmd, struct fuse_chan *fch)
+{
+	const struct fuse_uring_cmd_req *cmd_req =
+		io_uring_sqe128_cmd(cmd->sqe, struct fuse_uring_cmd_req);
+	struct fuse_ring *ring = smp_load_acquire(&fch->ring);
+	unsigned int qid = READ_ONCE(cmd_req->qid);
+	uint64_t flags = READ_ONCE(cmd_req->flags);
+	struct fuse_ring_queue *queue;
+
+	if (!ring || flags)
+		return -EINVAL;
+
+	if (qid >= ring->nr_queues) {
+		pr_info_ratelimited("fuse: Invalid ring qid %u\n", qid);
+		return -EINVAL;
+	}
+
+	queue = fuse_uring_create_queue(ring, qid, true);
+	if (IS_ERR(queue))
+		return PTR_ERR(queue);
+
+	return 0;
+}
+
 /*
  * Entry function from io_uring to handle the given passthrough command
  * (op code IORING_OP_URING_CMD)
@@ -1272,6 +1297,12 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
 			return err;
 		}
 		break;
+	case FUSE_IO_URING_CMD_ADD_QUEUE:
+		err = fuse_uring_add_queue(cmd, fch);
+		if (err)
+			pr_info_once("FUSE_IO_URING_CMD_ADD_QUEUE failed err=%d\n",
+				     err);
+		return err;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index c13e1f9a2f12..cfb055c0c764 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -240,6 +240,9 @@
  *  - add FUSE_COPY_FILE_RANGE_64
  *  - add struct fuse_copy_file_range_out
  *  - add FUSE_NOTIFY_PRUNE
+ *
+ *  7.46
+ *  - add FUSE_IO_URING_CMD_ADD_QUEUE
  */
 
 #ifndef _LINUX_FUSE_H
@@ -275,7 +278,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 45
+#define FUSE_KERNEL_MINOR_VERSION 46
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -1292,6 +1295,9 @@ enum fuse_uring_cmd {
 
 	/* commit fuse request result and fetch next request */
 	FUSE_IO_URING_CMD_COMMIT_AND_FETCH = 2,
+
+	/* add a queue */
+	FUSE_IO_URING_CMD_ADD_QUEUE = 3,
 };
 
 /**
-- 
2.52.0

