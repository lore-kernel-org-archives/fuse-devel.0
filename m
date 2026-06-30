Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FA52D9ECB
	for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 21:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854213; cv=none; b=qxPVvAlqcyQJSBY7GmuKR4imGmjkcv/FZsnbuXPWY6lYWcYaXUnoZwcsR3JJ5hlHvPruIstNwcYhZnhwqwQoasPqKtlZ9KgybDLQTJpWwoBMGsp2g5khXQ5E7ZGB0gBERRmW/Awj3dUzPLkWaoq6ga8pB8AQYFwYoY6MktwPmt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854213; c=relaxed/simple;
	bh=NABHRxutLJgh0cWwv4Fo6AP+n2/Z25R3Qkoe5ua6I4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Maux/cNeOtZ0CcZM6r9rhf29fwqCDvLg1G+F9T5T3CqZYasXctatBR5WkNn4ltRLZucxhyFP1B+xNQdJOOFC7SOmmUkLJtoHvgByNaRrkkaOYblAD1kfTKlPhVpSaodL8SESj2O/MNQ4gCLLhZjOQyGcZmQ5bQxlE8oNkcPmkA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TI2BKuXU; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TI2BKuXU"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6a18eab71bfso540687eaf.0
        for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 14:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782854211; x=1783459011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kJoz4iC+FN6TgCzhC5tmzH5lb2daEH3XZXFSM7w02M=;
        b=TI2BKuXUmkw1NhTFzDBoFLN2yOyZrNKxP4QIF4JgoMP75ab9FS0Wyc0LNxCOJafeoy
         zr+h160/kwrA+jH/8ziOt2QTE2Pn69R9zkhF/z9L6wsedtwuMJUEWnIwB/UpxucjDNKW
         vxm092F24dp+9S0uqXRDDJGZClp/zPC1LMIsb7egtI2Fes1U3CKl71h0PGP9wRgXVo8u
         CxcpxzzdKc60XtydAlyS+PfYuzB+miu+qdedWlIRMlx75Vo0DY0haJsw46ow0ns5xksj
         hGvAd7nXcTSKqVzfKQz/sJk96iDHn+52lK33JFJvcR8HPZGPnYEgi5mcFpkQRTBYBJka
         6E3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854211; x=1783459011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+kJoz4iC+FN6TgCzhC5tmzH5lb2daEH3XZXFSM7w02M=;
        b=W84LecXb2a0mAVAnKrtH1xSj6cZmIIAlhXG6STqNQzbTmDPtghZmbVvplExaJgNXXM
         OCIom1SQeL3QEfsFQy7v96FU6fPlDpL4iqUKZLvwSoJFChd7+62lQWdhf2xatLWpRy4q
         JAID7Cu+7NZYdooe0InTLZJ604b5tlSwoMJS3kTSiIA/78nXKAmd8ax+PV7kJnbYT7Mh
         tt9QPu4FLUOLOMfL5BhHGYfbXPNfJXRXblw05/gK+oTdB/6ftjQjt6JVSvgR2h/SpM6W
         mCLR4PNyY6W2t/GX0ZHT3JiA+8P1oyAvs1s3kBOLBh24p7Swl1tlxnR5bboIgmfLyKLJ
         TQSw==
X-Forwarded-Encrypted: i=1; AFNElJ8PpMFwoHwQtOKv4DiYP1GYhjtEpEQPOzrHM0wUK1eW2vgvH09WUuvAHzzhI2Liipb5PjxS8hoRpF9k@lists.linux.dev
X-Gm-Message-State: AOJu0YxKBT9JY7lp8G1/kAYjxxVYv9+QtqS8X1eOqmRCZBz+f3GMrrjt
	DfV9q+APS/Cj/2bvs3r8FqEUv++vRPiqBbn2SSLO5pJU18UVKttvXZBK
X-Gm-Gg: AfdE7ckfROIKdX9vRZBq1TU16OKKUelIpLJ7lo+GWalEDFos+z7mMpDv+zgxQP2vFlj
	APNlAlVMQI0BtHw8vyjtxf6aq3rTInzj03aLbcZgACE+GIQUH5O5cm+fqSGK5T3iVsk1fVKmKtP
	x4YyZJgQ6Yy/13EQ/5uIWBoL/4ReSDtvzBIbRE7H3uP6t8FgacIZ4RfR3G+qwv/d+vhi8jSw1DA
	kF9GcNnYe0/xFkiJpgOwB4TjJ4UsoTHrso5myL1Xbuc2ThwzTWqOg8ElvejYb/WiaZo6EPEQAuD
	pNx3D+UGjdRg/X7ueBs0jlvj1RPJiZ2AVjmAf+fEBdeTXVwOCW1D+lQp7fusVIcfeTF0zejVvJt
	0ObjVgPoNe6Q2+6e++Xg+OTE1ukQTDJv8faw9drwSC9lCpTdxouB35+UujCVIXJQlJ7H4EizkG0
	rwxqug4/hRDYS630/1HhnSy8FQUxTK3ShwSx/1za/CFQNAnZfClljmeMgKdArv1881
X-Received: by 2002:a4a:ee98:0:b0:6a1:42bd:d005 with SMTP id 006d021491bc7-6a196c78656mr1376985eaf.48.1782854211353;
        Tue, 30 Jun 2026 14:16:51 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:72::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44c62a0b686sm5522fac.13.2026.06.30.14.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:16:50 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jlayton@kernel.org,
	libaokun@linux.alibaba.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	fuse-devel@lists.linux.dev
Subject: [PATCH v5 2/6] fuse: add FUSE_IO_URING_CMD_ADD_QUEUE
Date: Tue, 30 Jun 2026 14:14:31 -0700
Message-ID: <20260630211436.2062816-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260630211436.2062816-1-joannelkoong@gmail.com>
References: <20260630211436.2062816-1-joannelkoong@gmail.com>
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
index 55e0ecdb2058..96fb3adfb414 100644
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
@@ -1187,9 +1188,9 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 
 	queue = ring->queues[qid];
 	if (!queue) {
-		queue = fuse_uring_create_queue(ring, qid);
-		if (!queue)
-			return -ENOMEM;
+		queue = fuse_uring_create_queue(ring, qid, false);
+		if (IS_ERR(queue))
+			return PTR_ERR(queue);
 	}
 
 	/*
@@ -1204,6 +1205,30 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
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
@@ -1268,6 +1293,12 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
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

