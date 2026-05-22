Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E9372073
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 20:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779483566; cv=none; b=LjKXq+FxQifAx2+8sX15YZrjMPudTVgXAPpSM/QIZFRf6DqjELxL0Z3qmebg4WrqPN2rIlKDwCHrRImplEK9iamuAAYPAD6QOpCgFqVSU7pCB9S4B17rA0xz8NFvkJoCUPfgswpxmYz7gZ5LHAMnoLHUFYIgXwv6kc1tIw0hK0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779483566; c=relaxed/simple;
	bh=4IVxyGM0Wwzphu843DWrIgUn3h02st9rNpyL/Ko/cwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVCJXnaBjLADgvG/QmzQQkbW35DrmpDsmTWWzJ9aKKb3znEFcPc4fypNQTbCJG5Fh7Rpx/gVj8L/BWtsiTCXz9lrLpCJzAtCCF2MUa3eWBlp/kK6YOEF57uX7B8GYtu8gdvYtFjSwVeqqS5PxadI+fM1mn62A6S0beli4R/t9Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0Wx+VbK; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0Wx+VbK"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-651b4d09141so7702733d50.1
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 13:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779483564; x=1780088364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgXXpacY4dvfWMe3AV+zu39v28RFL3z+famRRutui5U=;
        b=H0Wx+VbKgvlApUcr7OJYPVDJg8JSY5JZEB0cluh4HMhod8SMmJcRWVCMQp9AfXjRGG
         athKApb4K9bils6b+NcJP2f1dDFKNGJwpEcnkQYATZVxcVxSEMr+g5XRQq+RdczHzpJX
         6EUu9Hu8uwfOa9DFRsO6LYVNILLrxMmcbWeeD1PCfkEFpW5yZJ+tHAC7jW6s0TRRc/Ir
         wxByHEiadivEyMYLXLDV+lo96gqQEVrbzmcMHbpzOI+aVGDvJhi1/xJ0OQWHqkBNbWiZ
         g0sou6tZ7up4FUlAKRdGCw/FVWd9oGyVQuGw8azni6XTdXpkwwRgz31Z8sPHEwHeMalo
         qd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779483564; x=1780088364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XgXXpacY4dvfWMe3AV+zu39v28RFL3z+famRRutui5U=;
        b=gi3xjMcf7vg9q1908oIS+WgoDRMgC/EvyLBqWfRlMvvtIJVfc9v8c3NHapfptAmvBb
         DCxc/AqF5CNQtMo5bA7wc0h3YoGWccSO7kOJFrEtOQt1KmpXlPjZJzb92Ao0W+HQ1vVk
         1ekO10gocFPut9UcCkiSoF7veABn6fow5AQgmU0jj1OYgkB6XBuVM0gWuaquEfdf8o7K
         8sPwBzJfWjreGmiwDyhhFiGznrigZwl7n+6YHoUhQ7u6mnoTeaaxMBklvzGcS25bgY9n
         XNEQ5q9mRFRCEEoYRnpCgciyemTJCBgfukjeTZ9h3vxtTnvyp1WuvMR1VJ+/j2qNktrG
         uu5w==
X-Forwarded-Encrypted: i=1; AFNElJ/ctIcz7dcDhgBePKzfPjll2QWoCw5V/MdO6vK/5lwfflwP5E7zdmybaf5NMmprQMJluTim7pnBAGEl@lists.linux.dev
X-Gm-Message-State: AOJu0YzbSqHRiJc9TYVoPmyd22AunMXgS6uhrh9R3Cr/BDHxbDS4DZC/
	8sEHE2GCSzPhshlQsUOpp9Fr1QSh8AI0ppWP7O45FNpQP8yB/pp2tWrJdZEBCg==
X-Gm-Gg: Acq92OHeIFtsVnGdDLTp5V0pJ0sfJ2OH3yMLzlCoQmIpCEyBqIO68aQCCAdmuOzcJip
	sP4bJaYAsSLWxgMJwpaWIGUoXiEewaGeMvDdODQmXTN65evUfU4UgD2b7aiDFWU0QKsA96kBBbW
	qtLRipMfIXvXUjPu0494OQurImo4NW8v+MZHHcyUWAGEBcl5Ceks+V31sDfMxtTYBOWcUiJ8iJK
	KxLrimwetpUnsjmWinlaIk06QmmR4mzjWn8UgnBeavPSYpdKKflBSKJjtw+5mwJ68wri4fGsnfU
	h6Gi5AvARX1XXjNcOrZ27m2YdO77CCdZsAA/SRXCmhsrGQP3hR3dijtQyCG0EOA9Ebpqvdj6rD1
	2g3U8UkhFov+Oqr/+L9NyvDfYpTI27GdFL13ZByYi9X+i3xqRVR6bBoxE5I5OA3ZxNQlss8Zl4W
	F3qGce0H3wNK3WdTxjIg==
X-Received: by 2002:a05:690e:b4a:b0:653:2e4:bdef with SMTP id 956f58d0204a3-65eacd9a506mr7279945d50.19.1779483563927;
        Fri, 22 May 2026 13:59:23 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:71::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38c43bfc8sm13214697b3.42.2026.05.22.13.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:59:23 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	jlayton@kernel.org,
	axboe@kernel.dk,
	fuse-devel@lists.linux.dev
Subject: [PATCH v3 06/10] fuse: use named constants for io-uring iovec indices
Date: Fri, 22 May 2026 13:58:19 -0700
Message-ID: <20260522205823.1597313-7-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260522205823.1597313-1-joannelkoong@gmail.com>
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace magic indices 0 and 1 for the iovec array with named constants
FUSE_URING_IOV_HEADERS and FUSE_URING_IOV_PAYLOAD. This makes the usages
self-documenting and prepares for buffer ring support which will also
reference these iovec slots by index.

Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 3aa6268bd28b..5f407a79c280 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -18,7 +18,8 @@ MODULE_PARM_DESC(enable_uring,
 		 "Enable userspace communication through io-uring");
 
 #define FUSE_URING_IOV_SEGS 2 /* header and payload */
-
+#define FUSE_URING_IOV_HEADERS 0
+#define FUSE_URING_IOV_PAYLOAD 1
 
 bool fuse_uring_enabled(void)
 {
@@ -1057,8 +1058,8 @@ static void fuse_uring_do_register(struct fuse_ring_ent *ent,
 }
 
 /*
- * sqe->addr is a ptr to an iovec array, iov[0] has the headers, iov[1]
- * the payload
+ * sqe->addr is a ptr to an iovec array, iov[FUSE_URING_IOV_HEADERS] has the
+ * headers, iov[FUSE_URING_IOV_PAYLOAD] the payload
  */
 static int fuse_uring_get_iovec_from_sqe(const struct io_uring_sqe *sqe,
 					 struct iovec iov[FUSE_URING_IOV_SEGS])
@@ -1088,8 +1089,8 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 {
 	struct fuse_ring *ring = queue->ring;
 	struct fuse_ring_ent *ent;
-	size_t payload_size;
 	struct iovec iov[FUSE_URING_IOV_SEGS];
+	struct iovec *headers, *payload;
 	int err;
 
 	err = fuse_uring_get_iovec_from_sqe(cmd->sqe, iov);
@@ -1100,15 +1101,16 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 	}
 
 	err = -EINVAL;
-	if (iov[0].iov_len < sizeof(struct fuse_uring_req_header)) {
-		pr_info_ratelimited("Invalid header len %zu\n", iov[0].iov_len);
+	headers = &iov[FUSE_URING_IOV_HEADERS];
+	if (headers->iov_len < sizeof(struct fuse_uring_req_header)) {
+		pr_info_ratelimited("Invalid header len %zu\n", headers->iov_len);
 		return ERR_PTR(err);
 	}
 
-	payload_size = iov[1].iov_len;
-	if (payload_size < ring->max_payload_sz) {
+	payload = &iov[FUSE_URING_IOV_PAYLOAD];
+	if (payload->iov_len < ring->max_payload_sz) {
 		pr_info_ratelimited("Invalid req payload len %zu\n",
-				    payload_size);
+				    payload->iov_len);
 		return ERR_PTR(err);
 	}
 
@@ -1120,8 +1122,8 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 	INIT_LIST_HEAD(&ent->list);
 
 	ent->queue = queue;
-	ent->headers = iov[0].iov_base;
-	ent->payload = iov[1].iov_base;
+	ent->headers = headers->iov_base;
+	ent->payload = payload->iov_base;
 
 	atomic_inc(&ring->queue_refs);
 	return ent;
-- 
2.52.0

