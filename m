Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A170712B94
	for <fuse-devel@lists.linux.dev>; Fri,  7 Aug 2026 03:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786072557; cv=none; b=O3TfwsRNgrsVfsVf2aaHLwgTyrqiklJTdUZq09ZkuA2Tp5gE6VmdTdOZ3jXgcvxi4WhwdKJ0d01A/WezlZAn9ULc2lQmis8qw+S8I8gxrvkD54F2SYzzqbP/hzE++xgXCtLshMvF+h4hY9zRQXyyFjG5/bvGvRrxbcr8XuCT27Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786072557; c=relaxed/simple;
	bh=3A5C3EXvvGEoWJ1l+7sfPmTDNuAFh/3jvfuQgavhu6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K4T8daJM7QQhBlleLP7aZn1PcGmwhQLc5J7JK56SlkcBraelHE5DRVD5ABeL+aplyM75sJsV5qhwLz03e0CryyC7ESf8aRe5YAkqOoeWLdfGBaOvf8gYZZw+wAtMsQHlzYl0oyARVbaN8ndkvuSv13etU0gvHIv+r4jH6dTGY7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rpUrj0Ri; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rpUrj0Ri"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so1197765a91.1
        for <fuse-devel@lists.linux.dev>; Thu, 06 Aug 2026 20:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786072555; x=1786677355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RCJZpBnqKALyKAEdfIL5xWelEc6Lw3PrSrs6EoGxV8w=;
        b=rpUrj0Rix+LtpVzslVWVz4VITZxQPD305L6dVuQCuKQMkb14cvOYk3JgP+Ec0d6yhs
         H6Ta7M2kOFB4DVdJCriDVvQSgxqb5d//+8zmcG+puJmA2+HbYu5s1MUIXf7ADMov5Jvw
         nRFbyP/h/BZhVok58Jc7CKgUHTfAgvyExTvjTrO5KnJNod5UZFFQU2nCrQmqZicu91Sw
         4kpUOZkH0x0l4qzu8FrINK7nECfszRXeW8vsyB+9Be+lFpyHbrYaHeE2FswdNQc1H5jT
         Ut2+5Zbsx/kFoORr5SPxa9/cH/8Fxlh9GXIrJnJY4tNngh2UVqcBdybl4HOs8N7r8rRn
         BCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786072555; x=1786677355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCJZpBnqKALyKAEdfIL5xWelEc6Lw3PrSrs6EoGxV8w=;
        b=n216oQOAHIbgDMFLfXCSooZxHmzauvl394lvolRTT0f3YQES2zxeK9xyFn8DToH7/r
         naVwpSOw6An5R7ldI2FWXJKAuVMQnrrZwDnulVgFzrtX1iFM4wKIVpK1flQ9PGJIVLkL
         amwiHk5uX6E2aXjdABicOhG9F3sjEwkTIbEDIZGDO/qH9oYhScyL95lUeO0j1cV+a2Um
         6nf4ff0WZUl8W36+G1wy4C5dqWfxC0j+UgJ+PKsMos+SF/15ID2H+KwdylSV/tK1GW2i
         LQACocB8M/sO6dmfEP3uLMjmkmhgMpauq4BluHWMm/96D55V9UyWebG7zIXuntyjuy9G
         N7Vw==
X-Forwarded-Encrypted: i=1; AHgh+RoFW2sY0da6u0rgcLVk9HAzVeISvVoxXRGTtRuI8RgxbPAuHS6AW+NbO1v3t1KhoYGrcRXIRMGe9N9/@lists.linux.dev
X-Gm-Message-State: AOJu0YzmaHVjrhhdzO2NDWKZS1bOcTj1BZhO3LtOr6DKFFOgHSJzxEM/
	U7CS3voMid4wYVU4mABWjYiMJ9oi+hNwn7iuvPlCqOsDmSHkt0v2589l
X-Gm-Gg: AR+sD12OCkE85dKDtAlEyxGMVVH6YTQHkdgAmGw7BmIrhMgeovzfkJSLU0/w0VazqpC
	pPSN6MB1Tf6KKQOvCEVyQhMxcVasqouOTR1xIFtGpt6VeyFHbtqqlXQjfhqqEXsQtmPVQMqYaEL
	J3tUn2yA0OkamQ51pMintVjt4NivhzNlqC7yRPJp51gCL0c+Zr831wzCMM6ye6Ez67CpT7+mAAf
	iejJx7oYaMHlUxyub+n/xJ7oY5wDJoYTGITMOmRNVDlLgZ5E1jAqyfaf7u9MvWmUTpe3t0R6DN+
	ZiQMSiAXJusnwKj/BI7yfYPp9kLvFjfUxz9wCWvsSNsvmDmEgFPv82+5Ts/CSORUmQepo3R/l3w
	6DKqLpyc4YDlGmouWMOPl2rp0TnNUBip4DwXESVMTLU9vEw5Gjplp4E+mXyB/jL6xro15zPQEZx
	F08LD601SjcxCiA0D5E+CpCR+3Myjv5RfYUOyQSbnzqCqqsLpsMoQ/AO0CWPwa099+qjhzZ3iZk
	Gd0/BlfkQ==
X-Received: by 2002:a17:90b:2dc5:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-3909d79f314mr7651334a91.4.1786072554897;
        Thu, 06 Aug 2026 20:15:54 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([2409:8a55:94ec:7c81:f9fc:df1b:ed1e:972c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b30d465csm388060a91.2.2026.08.06.20.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 20:15:54 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Zhao Chen <winters.zc@antgroup.com>,
	fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shihuang Liu <shlomojune6@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fuse: fix use-after-free in fuse_chan_resend()
Date: Fri,  7 Aug 2026 11:15:34 +0800
Message-ID: <20260807031534.4362-1-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_chan_resend() sets FR_PENDING before acquiring fiq->lock
and before the request is actually inserted into fiq->pending.
A concurrent cancellation path may therefore observe FR_PENDING,
incorrectly assume that the request belongs to the lock-protected
pending list, remove it, and drop the queue-held reference.
The waiting thread may then release the final reference
and free the request while fuse_chan_resend() still holds
and accesses it, resulting in a use-after-free.

The following is a simple race scenario:

CPU1                                CPUx

fuse_chan_resend()
  move req from processing
  to stack-local to_queue

  set FR_PENDING
                                    request receives SIGKILL

                                    fuse_remove_pending_req()
                                        sees FR_PENDING set
                                        list_del(&req->list)
                                        drop queue reference

                                    request thread drops its reference
                                    refcount reaches zero
                                    req is freed

  access struct fuse_req
  lead to use-after-free

A FUSE request being resent concurrently with fatal-signal
cancellation can trigger a slab use-after-free.
[   27.327266] ==================================================================
[   27.329157] BUG: KASAN: slab-use-after-free in fuse_chan_resend+0x29c/0x7c0
[   27.330554] Write of size 8 at addr ffff8880079975a0 by task exploit/1711

Move the FR_PENDING publication and the other resend state updates
under fiq->lock, in the same critical section that requeues the
requests on fiq->pending. This prevents cancellation from observing
FR_PENDING while the request is still on the private to_queue list.

Fixes: 760eac73f9f6 ("fuse: Introduce a new notification type for resend pending requests")
Cc: stable@vger.kernel.org
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 fs/fuse/dev.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5763a7cd3b37..e54567bd247e 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1760,7 +1760,7 @@ static ssize_t fuse_dev_splice_read(struct file *in, loff_t *ppos,
 void fuse_chan_resend(struct fuse_chan *fch)
 {
 	struct fuse_dev *fud;
-	struct fuse_req *req, *next;
+	struct fuse_req *req;
 	struct fuse_iqueue *fiq = &fch->iq;
 	LIST_HEAD(to_queue);
 	unsigned int i;
@@ -1781,18 +1781,9 @@ void fuse_chan_resend(struct fuse_chan *fch)
 	}
 	spin_unlock(&fch->lock);
 
-	list_for_each_entry_safe(req, next, &to_queue, list) {
-		set_bit(FR_PENDING, &req->flags);
-		clear_bit(FR_SENT, &req->flags);
-		/* mark the request as resend request */
-		req->in.h.unique |= FUSE_UNIQUE_RESEND;
-	}
-
 	spin_lock(&fiq->lock);
 	if (!fiq->connected) {
 		spin_unlock(&fiq->lock);
-		list_for_each_entry(req, &to_queue, list)
-			clear_bit(FR_PENDING, &req->flags);
 		fuse_dev_end_requests(&to_queue);
 		return;
 	}
@@ -1801,6 +1792,11 @@ void fuse_chan_resend(struct fuse_chan *fch)
 	 * intr_entry on fiq->interrupts after the request is re-queued.
 	 */
 	list_for_each_entry(req, &to_queue, list) {
+		set_bit(FR_PENDING, &req->flags);
+		clear_bit(FR_SENT, &req->flags);
+		/* mark the request as resend request */
+		req->in.h.unique |= FUSE_UNIQUE_RESEND;
+
 		if (test_bit(FR_INTERRUPTED, &req->flags))
 			list_del_init(&req->intr_entry);
 	}
-- 
2.43.0

