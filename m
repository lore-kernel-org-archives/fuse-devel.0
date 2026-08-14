Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1374A2E21
	for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 19:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734036; cv=none; b=Fj6W5/sYGhWdUSSCm16KAeWY/p+3hHnY2RxgeYA/kyiHmbqAya0AWCMtn0qthFPgRjd/ZoKHQwwqdoniDiEg4MzAUl3b0lzIgPpsIDjFO1g/sp+XJzpu7kez974SSI/rA5/tI1CGp7yHo+NIIDRTOIqP7oyjOzaYrv4ZdBfpy18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734036; c=relaxed/simple;
	bh=+IVUz/gau4eO6nuV9nOMWOGxh6bnY1DeHXhFTioAbuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDHZtSxFGd8BYaI7hFUbMZBIqV1zUj53N9DvRuM3hyxUzg0ehcT6X4vmPTUAmUT4cs53QjnGgVlRnsP7CXS7vds40OPjO9d5hOdgmztnfpDaaN7xPBhE70qayJ/mu3AqZNjLbduI2kDg9mIEwpNBGs+kDFJnVnA4xd9+fS/hSQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0Dt8RWc; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0Dt8RWc"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d049069377so15213555ad.0
        for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 12:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786734032; x=1787338832; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElWFYWmfSjWKNlEDasvt5AFCvWhala5OE0OCp//WijQ=;
        b=J0Dt8RWc7y+455ljQR71tcfMC5fE1mFKXI1wd7Jwhn1EDfYEPeqR2hY2flnOJSOO/M
         RT2feEKl12f5e3OokaFNIbgcL2pE7+Df4FYeD4t9dphmk1oWmxIFmjjncpaptOGa/bSM
         2ad3jUsgBsShlQGiBdoYSQHrvKglLz7ttesNhdUdPhcec2sgeE35SqtfTZQsk/8ymeIu
         xOdsz7C8+1enD+AztPp+1GF/nC69SlZRGGbXXfGg3fZZIxoiwtubClvAb6My6tY4aKDV
         6+R6PTEj3J2+GCkcow7To7AjLF+prDjclWb5A+K2Sz70Ox+B4WteSAS2GCC+qawmQqjR
         ihZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734032; x=1787338832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElWFYWmfSjWKNlEDasvt5AFCvWhala5OE0OCp//WijQ=;
        b=Ag0aVBh3jIPK7E8LlVLPQpm7ZuLY4mNUelu5GZ20gW9B+oQX0Cz+vrFDmeG8eZ2cM0
         9qc/k2llAfrM/cwT6Bf/Bs4hGqjl8oFQrbk+C+QRaVwVaSjFAIy5FEU9LBMprBwDmtyi
         sFyeCEGR+nMNFP7fV9HLJkLMfO8D1mniQDZvfDkvlij1tS/g/FUDUdwLmZgPhuSNU0Ez
         b+lPRjncagcXUyssbAinPbBvS66lYdg6eHrtcUL6kmFBBgLBTUfHkVsfda0oqXx/zfk5
         xBK6XPCoM8kgAtl5ovDJQlMXhCmHzdwklU02fiA0Ex0cOjfrt9Bw5hea3rSW2yLKhq3i
         XyHA==
X-Forwarded-Encrypted: i=1; AHgh+RpCbVyCD0j14a7skpcZ10xzliVyOaY1ERmPmlJQChmrmbmZhY9Ep3hOd2p9WgoRLfNXOkZWf/t0kYQz@lists.linux.dev
X-Gm-Message-State: AOJu0YyyeFIbZRWGqSxj2s94zI7CsJ9BDq8UjbVXbNmfjHN8HBcLm5ew
	0QYqTxvreJpgqkCLQiCPUAxKNnntMhpoaIO3M2XfwZoNxsMSSoaO69DlLVVA6Q==
X-Gm-Gg: AR+sD13LS+5VxGuqQqVHj2ESuTd6Z7QyMbHkcwzujgoY095TvpukTsVCRC2Qk3PMQYX
	K3KYpBWsM/25FyGyr9D73ma+ssbqyhjFzcreOCqbNA8TNWGdRG/1X7A5pMuBomUev6gnk2B9WB6
	BQN+lw3tTOKS3/LNPvYAEGCYmOyMIfpP382m4RWC+wyIqNrZ4rGMFzVQJExOH3AW0uBC7vj7Qzn
	u588I79J6nFV+mzodQ7hPuglNDzrZJgQMM4VLfSrj5AEVf1Tc8zN5v0oS9zsEjN0oiKVG2qsY36
	G7Z8ztAeYWMRgsdPNuYmzf4umFbo/mOgnOtIZ7uunAjPq2x9kbembMe2yxYu15fnrnzDbTRwma8
	U1olSGhpm/cJA9vljWp13Tj5+hXc3iWpmGu4OnMfjmmnN3Coy/kKBdJ1tajfitvz9dpNN42deIK
	030h0WfKNK42rbxCKIgmkPeFFR1yzcbiD828QD2Hxio0fbu30ReZxazCSIml8aLoKmJ0K7j5s0a
	1lrbcqzdx7RLvaUzCUzXeP+K4y808J7GcntVvQS
X-Received: by 2002:a17:903:1850:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2d3b0aeeb01mr103106275ad.1.1786734032205;
        Fri, 14 Aug 2026 12:00:32 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4a::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7540ddsm14161895ad.2.2026.08.14.12.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:00:31 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	amir73il@gmail.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v7 2/6] fuse: add FUSE_IO_URING_CMD_ADD_QUEUE
Date: Fri, 14 Aug 2026 11:59:42 -0700
Message-ID: <20260814185946.3679478-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260814185946.3679478-1-joannelkoong@gmail.com>
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
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

Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c       | 45 +++++++++++++++++++++++++++++++++------
 include/uapi/linux/fuse.h |  8 ++++++-
 2 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 9616778505ba..3b9fd0daef66 100644
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

