Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991E1378D8E
	for <fuse-devel@lists.linux.dev>; Mon, 27 Jul 2026 23:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785195447; cv=none; b=Hkgya6byCVesip44zAsD/LYJEdZlVwwbvIQVWkHY/yl5KDgQS7GkLlw3/UvU8BRh9DVwMcZBqzv1vBN+HFGKuJBN8F4JVSRxb9oWHNrFQzBgpcKMx3XA7P7DpuyF5VlFOjYRbjhXjgo7te1UBR4eQA6P0MPwnH9W2F+BRx8WBA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785195447; c=relaxed/simple;
	bh=1WH8L/LQfwbDgvXOX50fs46GCINEST5r8Hk4xbxZhKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EiFDJqSb1izUlgtIk7WApg3HP8xUI6p7Z2+UKFbxY9QSB1abgiJRPdipeaz7z5ECs87D2hnhoal0VdeK1/zdU1QQTBMlppLAAwSdpp4ri2jWQB0w5ybJ9LAxTT6MzkhwQwEnwnRrTXjCtuDG8KOMEZXkvH6SglUXTyjcyIBYYS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=UcrT8mSX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="UcrT8mSX"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso36464675ad.2
        for <fuse-devel@lists.linux.dev>; Mon, 27 Jul 2026 16:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1785195446; x=1785800246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+eTeB9Y8fSbfXXCJFsPp6idegL+ISd+9LGy++ETIMQ=;
        b=UcrT8mSXfx5tOhD28ZgYcYV9ZGVLXbjb3lokrFdHl7cTzd5IVaypWccfQ9jH/mpZJh
         4rQ0s1Suw/neWjxoGIcOds0e/FRu42or0FTYdbXbbmQct/gCM9Lbku0LSyF9BE4t5PRv
         BwHau7lpULry89dhJPdMM9GEaf48wdrsraYK5AktOkwvg+Xh8CgOBLS9TkJTUOFkQwWD
         iMOReJ/UQx6a5KuYLdsXIjd5ytxZkNjdMEMQN6PxoDkv0wRAzuiDynKpqwHs9K6nplNp
         O8rGVxt4BV2I6OfrVC6+zB1rNB9A1yzq+c1eUDnwtIJmokPKNCIcySrqNLsuxgXKZWs4
         K3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785195446; x=1785800246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B+eTeB9Y8fSbfXXCJFsPp6idegL+ISd+9LGy++ETIMQ=;
        b=O/cxD+m0mILa5yl1sPBM9V61NhNo0ccLwmFV8UFgJMttqCA5Vq2tSkPFfBuKq6IzWm
         1PzEFAVcNMNy0z4mf3qCbR5EDJQffPOg5PmKRyEoLqpzpymEyXNTdWUvqY7dYekakn+L
         FsbnBDoV33yWHwJxOCSvU7etq0gx0HKS8fGmpgu36CGJyLLG9ZmzRaNoCFS8v0fwqNr8
         k1JuhfihCpPmmkS1gf21TE9xOaXTE58e6ak148YmE6OLi+qMrSEgF2CJEr0ABFSxGj0Z
         NS4mpzD4aDnntIrc+0CVd3IcsN5SHt5x9AFb5Rf+xaahqTinJI+ZYeJVYphZ0apoD7jd
         2xRQ==
X-Gm-Message-State: AOJu0YzLFdpI4pqrR6XBAQsjrw9BChCbsRGlw96PZyyshNNnAlQ9l5NV
	KzVnJ66bGEO6j3fmnvot7Ce8J83kDAUMkqEIIrti5e52sh6ZnG5ruqK4OydZ1g8qag==
X-Gm-Gg: AR+sD11eLTUnA7qgG1iYRtSIETsbyvZOMNXm69jaK+U34LaQVWCW8sIxCwnHxknpcmF
	qyOFdIEEoS72RyxlP2LHQaq3Ax3Oxf4EIIsGelzkcn/K36EJtChYNS4mRwbixIwsl1kGjDdvVHy
	/EquMPfc+8N2cd48EAD6hg65OQFr0ia2mmwlC93JFGf6wMpNkg5ITXIvGkuL1tY9/pdMcV56M/+
	RL5KMNybRKobx8sh0/oPYvBmru0NT9htVpmsAQM7iDRItq3Tf0vVnIyJ32hcjwhQbcmROzXwybL
	paqqj1z+2CGinyciVWiofVJvtf0kbtwaCQb6iqfeC2aWb04dlszO4VvXG71jjOyVSti1f93EHVd
	tK7agOvBLB/1JmZzrXHTkq29nm7joFFYiu2RJpzwGDMcibnFPbda3TnbZM1UW1biBbtbdtxcELQ
	==
X-Received: by 2002:a17:903:90d:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2d015a87ab5mr88895ad.10.1785195446053;
        Mon, 27 Jul 2026 16:37:26 -0700 (PDT)
Received: from p1.. ([2607:fb90:ec26:45a7:d22f:3f56:f9b2:423f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde4650a5sm42256915ad.0.2026.07.27.16.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 16:37:25 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: fuse-devel@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	bestswngs@gmail.com,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH v5 3/3] fuse: deduplicate the oversized-request error selection
Date: Mon, 27 Jul 2026 16:37:06 -0700
Message-ID: <20260727233706.218446-3-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727233706.218446-1-xmei5@asu.edu>
References: <20260727233706.218446-1-xmei5@asu.edu>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_dev_do_read() and fuse_uring_args_to_ring() both pick the error for
a request that does not fit the server's buffer, and both special-case
FUSE_SETXATTR.  Move that choice into a helper so the two transports
cannot drift apart.

No functional change.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
---
v4: introduce fuse_req_too_large_error as a helper
v5: add the explaining comment Joanne suggested; add her Reviewed-by

 fs/fuse/dev.c        |  5 +----
 fs/fuse/dev_uring.c  |  2 +-
 fs/fuse/fuse_dev_i.h | 13 +++++++++++++
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5763a7cd3b37..d290d2a215d5 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1584,10 +1584,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
 
 	/* If request is too large, reply with an error and restart the read */
 	if (nbytes < reqsize) {
-		req->out.h.error = -EIO;
-		/* SETXATTR is special, since it may contain too large data */
-		if (args->opcode == FUSE_SETXATTR)
-			req->out.h.error = -E2BIG;
+		req->out.h.error = fuse_req_too_large_error(args);
 		fuse_request_end(req);
 		goto restart;
 	}
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 248e5a3e340e..46d948a047e4 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -729,7 +729,7 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 	}
 
 	if (fuse_len_args(num_args, (struct fuse_arg *)in_args) > ent->payload_sz)
-		return args->opcode == FUSE_SETXATTR ? -E2BIG : -EIO;
+		return fuse_req_too_large_error(args);
 
 	/* copy the payload */
 	err = fuse_copy_args(&cs, num_args, args->in_pages,
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 668c8391d61c..0bd5611e57c1 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -13,6 +13,8 @@
 #include <linux/workqueue.h>
 #include <linux/fs.h>
 
+#include "args.h"
+
 /* Ordinary requests have even IDs, while interrupts IDs are odd */
 #define FUSE_INT_REQ_BIT (1ULL << 0)
 #define FUSE_REQ_ID_STEP (1ULL << 1)
@@ -362,6 +364,17 @@ static inline struct fuse_dev *__fuse_get_dev(struct file *file)
 	return fud;
 }
 
+/*
+ * A request whose payload size exceeds the transport buffer size is
+ * rejected with -EIO.  The exception is FUSE_SETXATTR, whose value may
+ * legitimately be oversized and is rejected with -E2BIG, matching the
+ * vfs setxattr path.
+ */
+static inline int fuse_req_too_large_error(struct fuse_args *args)
+{
+	return args->opcode == FUSE_SETXATTR ? -E2BIG : -EIO;
+}
+
 void fuse_iqueue_init(struct fuse_iqueue *fiq, const struct fuse_iqueue_ops *ops, void *priv);
 
 struct fuse_dev *fuse_get_dev(struct file *file);
-- 
2.43.0

