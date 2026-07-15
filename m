Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842DE3B47C6
	for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 17:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137410; cv=none; b=RoHlkX11th1Zn48elekO+spH7CafUjTR78nYbKzLLsaiqNpfPowgMwqaDWBzUnkavU2Qc+iD2Y2EDfqp8N+5y+olAT+kwzrZ2fIwrYV9t3r4j9ctDTdBu2REX+dqh5rig45cW5eae8cMs4jOJZPbwW+P+/QJCem6MTD7PAO7Y5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137410; c=relaxed/simple;
	bh=NHNR9MKOzKYImCQUQZNPPlvA4wqlB+NM6RJgzl6eQCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dk2O2umav6j5RI/QXuAKaV9TiQpUcABKPhvgMWRvNQoApKDIk+TvoS+AKS5tKSVKhRJdEYP/RkE+nkfxHMU729RHkAaNqSZrrW1YqAmUxae+FnCnXCWnvp2BA9JpqGsCBpapifN8MKrt2JKSDmVQelG4LoE9gNtW+HVKjYWHiZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMoBPVAo; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMoBPVAo"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb3865ea6fso3799564a34.2
        for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 10:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784137408; x=1784742208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4h9AQKqH7OWc4BD3uJy3+HI4wlXgrocnJFgRfCOCii4=;
        b=FMoBPVAot+r1mtLX2CqfokAyFnJVAUDhFinbQ0oqs4gYFVrcIO1Kk1yB2y2fzXbAV9
         htSxBdJ5wO5DzA5kYumKyeWK7YspQ009LHBJo+8r1EicoG3nQHdSarPiH1s4TsDdnhgV
         kIiUZQO2is6C5xbI4k1HYttW6axS0F23EP5S9yewHIVZwZSqzsBZdsyVWxdeMxxDG7fQ
         ATSC+CnEzOKJYMKJdIbi6d6CdF90QwNPGpvfFDsWOAeMOZYTEoR+WCxVszzgTyeuI+RT
         /w7GVjANTaLudTPjVutRlF/Ojkl063WBBHJtkrAd53yVZF80B9seGwc2v7loV0oqf/qX
         +sJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784137408; x=1784742208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4h9AQKqH7OWc4BD3uJy3+HI4wlXgrocnJFgRfCOCii4=;
        b=S1Rs/te9ovqaAhMppY+StCXxw/7LhmpWWVimREGAlpxJ0uEvRDKaoBps1C9dYJq25P
         TqF+FSM1GjxZLjvbbYAQeiWKgRmEbiJMoHQ6zpaNvLstSlzrD25P+3IlxffdAjB695tt
         712/RPPSGYegICAJThH98QqwqImYw9wCfrtVFtKzUx5BrskzN4skWd8tGG7uadSooilS
         34wtT8Rz4CPh8JZMqm9VK4163NsZZJqLzW7QCu4jNzTNibbpdmr8UZqP1+CJ75yXk2qM
         4QOdUnCSm3udfwsGIIp6wx5VcejUKCjT1ZMSvgrV1d6k0yzPH8280nFm/pjXE8XKvC07
         XsNw==
X-Gm-Message-State: AOJu0Yy+Qqsp4QfWQaKNNrIkRCvMObppNludpmDrlriPLXhMCa7vilgU
	S21mFUG/lmH1xEJNhSKK4w5wNqqf8pJfOfFpmvOAGhQuaLwAFLOziNCh
X-Gm-Gg: AfdE7clPj7mRw0m71QjUAKPmoP/rmXxz68Y9kjXCiL8DbqCPsOlRj+gx56u8efF0JkI
	hMlxk9iTLFoAciQML229f6B1ATYHIgmSaZIJcFc+25EMGrm0yEUToNVYZNUExFK83Dp0+TcaIQ6
	/XRhwmnt+T2algGHYovebUjz8BDC0ObfpUtpw4OFpmzKHfUVo4vwyA1cC/Dzb9qsvO9oijTyA7i
	68UiXv5ZL39GVNbIVkjEwc0Yxjk4rvRcPM4LYlkur346yrsqfZlxNxSCWUEkvlpV82S8UcLGssT
	bmi6fPg4iaFuGwQsJMHACGJ7W7xdRz6edYcLx0sYcAzxtPUfGlre9dQqlZ9p8Ath90jD4T3jUpz
	u0yoha8+C2DBMEZ6NX4dZq9xxPOH8JJ/NzKDXokQjOpLYkZvyWoiyjlfbdwmjhySwFsm83ybJE5
	ZOJQaRr9bKwOGad06Pw3pCkQ4Frlves+bfRpnJe90UGg1IWF05rev1H586Y/oEGq8z
X-Received: by 2002:a05:6830:4190:b0:7e5:68d0:462d with SMTP id 46e09a7af769-7ec423299b6mr5191121a34.19.1784137408225;
        Wed, 15 Jul 2026 10:43:28 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4a::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ec14489139sm9884551a34.5.2026.07.15.10.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:43:27 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v2 3/3] fuse: publish io-uring queues with release semantics
Date: Wed, 15 Jul 2026 10:43:05 -0700
Message-ID: <20260715174305.336261-4-joannelkoong@gmail.com>
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

fuse_uring_create_queue() initializes a fuse_ring_queue and then
publishes the pointer into ring->queues[qid] with WRITE_ONCE() under the
fch->lock. There are several readers that may concurrently be fetching
that pointer locklessly and then deferencing it.

WRITE_ONCE() doesn't ensure ordering of the queue's field
initialization before the ring->queues[qid] pointer assignment. The
queue must be published with smp_store_release() so the field
initialization is guaranteed to happen before.

Readers in paths where the read may happen concurrently with the store
need to use READ_ONCE() because any race involving a plain access is
undefined.

Fixes: 24fe962c86f5 ("fuse: {io-uring} Handle SQEs - register commands")
Cc: stable@vger.kernel.org
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 51f985154aa1..bf9d51f2a508 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -321,9 +321,11 @@ static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
 	}
 
 	/*
-	 * write_once and lock as the caller mostly doesn't take the lock at all
+	 * fch->lock serializes concurrent creators for this qid.
+	 * smp_store_release() are for the lockless readers who must see a
+	 * fully initialized queue after &ring->queues[qid] is set
 	 */
-	WRITE_ONCE(ring->queues[qid], queue);
+	smp_store_release(&ring->queues[qid], queue);
 	spin_unlock(&fch->lock);
 
 	return queue;
@@ -434,7 +436,7 @@ static void fuse_uring_log_ent_state(struct fuse_ring *ring)
 	struct fuse_ring_ent *ent;
 
 	for (qid = 0; qid < ring->nr_queues; qid++) {
-		struct fuse_ring_queue *queue = ring->queues[qid];
+		struct fuse_ring_queue *queue = READ_ONCE(ring->queues[qid]);
 
 		if (!queue)
 			continue;
@@ -967,7 +969,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
 	if (qid >= ring->nr_queues)
 		return -EINVAL;
 
-	queue = ring->queues[qid];
+	queue = READ_ONCE(ring->queues[qid]);
 	if (!queue)
 		return err;
 	fpq = &queue->fpq;
@@ -1035,7 +1037,7 @@ static bool is_ring_ready(struct fuse_ring *ring, int current_qid)
 		if (current_qid == qid)
 			continue;
 
-		queue = ring->queues[qid];
+		queue = READ_ONCE(ring->queues[qid]);
 		if (!queue) {
 			ready = false;
 			break;
@@ -1191,7 +1193,7 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 		return -EINVAL;
 	}
 
-	queue = ring->queues[qid];
+	queue = READ_ONCE(ring->queues[qid]);
 	if (!queue) {
 		queue = fuse_uring_create_queue(ring, qid);
 		if (!queue)
-- 
2.52.0

