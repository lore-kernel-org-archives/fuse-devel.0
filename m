Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FF0328616
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 18:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226727; cv=none; b=WBffgiaO1E90DCSgQZwX1bKp2jk1fu+nRKt+8bya807jw0IPpN6CLa8IRTSVYkFBEpJP3y92hVRr4ndiLuCz95IsTOb9OOy8uVLCBujPPuZgsKf7FAN/5nqpBbxK6cEYmIB9/NA9V/F34AMJRnhu2CPrcfvJ6Eel0XpZzBCyDak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226727; c=relaxed/simple;
	bh=auWZQCes1SYiM78Bx6ft/8N9YCMdvC6IGI3UHaeJiZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=al5LDFyjD8xmMIKSbaaKoiZYQk+TNik2xwGE2w5tPUmUQnjU7ZLUSmkF+nltdMkTcnH+kDOIAUEumOePnXgBgfQAjo/YhHHuBAzzy6vRxiU9ioT+kAgLGyKYgOeZjws3MdVkU9l9doF5oEccnG/LnlAv3CGnxk+H5tdxLCYyXC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JC0qcHxp; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JC0qcHxp"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4472500e25fso3225921fac.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 11:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784226724; x=1784831524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGagJXdwbk9EI4iOruUFfSJUOVbTgvDqNMG4+de3ekE=;
        b=JC0qcHxp250kBeCQGPuanyqYRHr08WtbvgkGXSTer9syuv8Yihtk1Whu9aSztUg9uB
         oLstAmETE5w/vZc/CSJDQKaJKG0d2TlqZoGP1rGp7WmMZWJfTMhsStrMlpkjJWgVxmId
         8Hc/WyEs3USHdWOdHo6gT/5ZPCYV4mpkrN7Tfn8ddNewOLr1hdhcjDZti06uZ6ARA0dz
         pGJtgRmh8SmBXEb/O83nnKyIsde3EZI03S2CqHDZ9yGoBDJ8qb+aaKBvRY4AwFdE/nvq
         bkm5nu7gzSSJOki94q/sDGI/hFhLU8hPOFU/5pekexlj+TSdtGBeoV8l7a0L5oKTtcdx
         RbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226724; x=1784831524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGagJXdwbk9EI4iOruUFfSJUOVbTgvDqNMG4+de3ekE=;
        b=I618nVcZbdwfLPoom5ONQgbWH7PrXijQ4hTSIZMHn0qlRHdnn5Ec4ZhyNlcvt7WVoW
         xVVc5D8nPjgXOWn8ABIv4JBzE49M4qhYHwwhzRQWsQ7kt19MYW3BUsQlGKQq+BTuhpzF
         ONVjz5j9wCsm1pn9ZL7FQ6obf2hKSmXLa48hVVbBnSWW04YZukBTWTivLaH79sXdVENM
         wB4jFAun/pYJPJe8yIQ1wkpweDg8QmmdDMQAI/uMtKH8lg4Ddb3q1nr9Q12PO2bVRod4
         KYRdHzHlmxBic8Q9zr4CW6qog6YMTABr5IxVef3/SvTRJsjZRKL1xNOza3wWtPpiLjdU
         GkiQ==
X-Gm-Message-State: AOJu0YzAjajzaAY7OQY18v6J7SfjGGbd/XZfk2woHmIvu7q4s3cXOX1P
	K3XJxhXsPwM8+ITGXL55t36bxdRTYAMdIqzqDbBQw9VvQhgP/GFsX8fwYW0Ahg==
X-Gm-Gg: AfdE7cnuLcY87MVOTnm/ZI0KkBCg+8MWpNVCoVit5V2ehlVtK2IxofhAmm7yra7BQ0u
	aCrh7a7uQCBoNW2+qjMAn8kYyE9Obf2AIiSyOegDVhIFHd2d3oUPEdUmx2e/1Q5wDtoqVsxbu3F
	3R8YFzMp2UoCFFAqsXJRuS2z/+YlTY5OvRBR/cSKDEe8IRHIiF17bB0KZChT799DZ/1YbjN/jKf
	m7eLam6vv3VtEpQv2QneBBlapYCtsujfqpiqcxUTVBteZjuz3UdiBPdnLxbPyCZMRU+k+4G616k
	gHmNFxMvogXRjwY9OI4OJB+m79YyRWk45jnjL2yjQHdAgAMFUpoa2MRu70z4Xu8LhfOHfCCtNX8
	U+SkN9tki0mj6bnUAKeVUjDK/emCNmUrCX9fk+j7cLZpaWB76ahMvuMVP3/EjrK78rp8fApnlSC
	1iqH4+zR1XOdW2U/YDSTCoR24rNwRN33pKSkjy9RmZFN7TU4ulks24NQ==
X-Received: by 2002:a05:6870:ac14:b0:448:558c:d83e with SMTP id 586e51a60fabf-4562b5c0edcmr4919538fac.35.1784226724564;
        Thu, 16 Jul 2026 11:32:04 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:49::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451ff78897asm16645430fac.17.2026.07.16.11.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:32:04 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v3 3/3] fuse: publish io-uring queues with release semantics
Date: Thu, 16 Jul 2026 11:31:44 -0700
Message-ID: <20260716183144.2710480-4-joannelkoong@gmail.com>
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
Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 51f985154aa1..c8488ebc1d1f 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -204,7 +204,7 @@ void fuse_uring_destruct(struct fuse_chan *fch)
 		return;
 
 	for (qid = 0; qid < ring->nr_queues; qid++) {
-		struct fuse_ring_queue *queue = ring->queues[qid];
+		struct fuse_ring_queue *queue = READ_ONCE(ring->queues[qid]);
 		struct fuse_ring_ent *ent, *next;
 
 		if (!queue)
@@ -223,7 +223,7 @@ void fuse_uring_destruct(struct fuse_chan *fch)
 
 		kfree(queue->fpq.processing);
 		kfree(queue);
-		ring->queues[qid] = NULL;
+		WRITE_ONCE(ring->queues[qid], NULL);
 	}
 
 	kfree(ring->queues);
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
@@ -1332,7 +1334,7 @@ static struct fuse_ring_queue *fuse_uring_task_to_queue(struct fuse_ring *ring)
 		      ring->nr_queues))
 		qid = 0;
 
-	queue = ring->queues[qid];
+	queue = READ_ONCE(ring->queues[qid]);
 	WARN_ONCE(!queue, "Missing queue for qid %d\n", qid);
 
 	return queue;
-- 
2.52.0

