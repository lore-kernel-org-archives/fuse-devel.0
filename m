Received: from va-2-111.ptr.blmpb.com (va-2-111.ptr.blmpb.com [209.127.231.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF1D288BA
	for <fuse-devel@lists.linux.dev>; Thu, 23 Jul 2026 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812829; cv=none; b=RSKhoP8WNfMsS1UNsESTF1janbIGTIKxbC8J2KO5Tzk6NjOkJf1n5pzEIW4YZ30rZTqKobekzQBg9gBHbQobTDuHA47Ugz702XDYGeim6xry9lBijPWa4+28gsZdlGMmz7REcB0o4MzzJEJ+oOEkEuhNlOHjnitOsWEeevqO918=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812829; c=relaxed/simple;
	bh=DZ7LOVwtKcR2SgOiA/nezmsa+LgdZ/6uhMFP+lGxz5M=;
	h=Subject:Date:Cc:From:Content-Type:Message-Id:Mime-Version:To; b=LAoE5svS/sGjFBk3YzMGFu0o8PmYVeYPONqTfDqN0kHtJyxUC6shdYOLsXv2Frr5svde0ynJZ7UDEfuAyLfBQNrTBDek/sF+kSdQki3+gQiMSQ+iNRIljLlPRwD3wwMYncY1ev0jOzweeCMVwcZY6UDa55fgfYvMq2Qi7kx253k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=XRPSV2tA; arc=none smtp.client-ip=209.127.231.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="XRPSV2tA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1784812810; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=QbYK/yaSVm7KhKX7ZeS9SqJ7Yk0gKAbykooHzSoc4B8=;
 b=XRPSV2tA1flZMDaNhKS1yUPLGr1S2RNM3KgrWS9uImc/gCPeBQZHTFssOd6EJ7edhI8WJv
 ny9PDJOimtwgXx7VlXxapMDaK+Z0/SJuN7e1/YOY+T/oAYGBCPITc2iRXRjlXM9xs15LT1
 gpeWbe3md54OB7kiNwQ/YdB9K75/NjeP3VTPOVEhNve6ZDPaCAfNyg7nk5Mm4j6J6WO/Lb
 utXCQ8GZmZ9lZR8P7ozuj+OzW/BDX8K4K/qAe05OWvCVvjQJOtMuWQB/ouOboofLsxvqz+
 py6eVo/DgUpoQQqCQZETUM/9Qhjx47heBoWfvuZAmATQsfrxlV/2t6Zu+lvEPQ==
Subject: [PATCH] fuse: fix use-after-free in request resend
Date: Thu, 23 Jul 2026 21:20:04 +0800
Cc: "Zhao Chen" <winters.zc@antgroup.com>, <fuse-devel@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, "Jia Zhu" <zhujia.zj@bytedance.com>, 
	<stable@vger.kernel.org>
From: "Jia Zhu" <zhujia.zj@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Message-Id: <20260723132004.85088-1-zhujia.zj@bytedance.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Original-From: Jia Zhu <zhujia.zj@bytedance.com>
To: "Miklos Szeredi" <miklos@szeredi.hu>
X-Lms-Return-Path: <lba+26a621508+8e14ac+lists.linux.dev+zhujia.zj@bytedance.com>

fuse_chan_resend() moves requests from fpq->processing to a private
to_queue before putting them back on fiq->pending.

The old ordering made FR_PENDING visible before the request was on a
list protected by fiq->lock:

  CPU0: fuse_chan_resend()      CPU1: request_wait_answer()
  ------------------------      ---------------------------
  move req to to_queue
  set FR_PENDING
                                fatal signal
                                fuse_remove_pending_req()
                                  lock fiq->lock
                                  list_del(req->list)
                                  __fuse_put_request(req)
                                    drop queue reference
                                return to fuse_chan_send()
                                fuse_put_request(req)
                                  req may be freed
  clear_bit(FR_SENT)     <----- possible use-after-free
  req->in.h.unique ...   <----- possible use-after-free
  list_splice(to_queue, pending)

fuse_remove_pending_req() treats FR_PENDING as meaning that req->list is
on a queue protected by the lock passed to it. Here req->list still belongs
to the private to_queue, so the signal path can remove and drop the queue
reference while resend still dereferences req.

Fix this by taking fiq->lock before publishing FR_PENDING, and keep the
request state updates and pending-list splice in the same critical
section.

Fixes: 760eac73f9f6 ("fuse: Introduce a new notification type for resend pending requests")
Cc: stable@vger.kernel.org
Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
---
 fs/fuse/dev.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5763a7cd3b37f..a0ca400697611 100644
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
@@ -1781,28 +1781,25 @@ void fuse_chan_resend(struct fuse_chan *fch)
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
 	/*
-	 * Remove interrupt entries for resent requests to prevent stale
-	 * intr_entry on fiq->interrupts after the request is re-queued.
+	 * fuse_remove_pending_req() assumes that FR_PENDING implies req->list
+	 * is protected by the supplied queue lock.  Publish the flag under
+	 * fiq->lock so the request cannot be removed while it is still on the
+	 * private to_queue list.
 	 */
 	list_for_each_entry(req, &to_queue, list) {
+		clear_bit(FR_SENT, &req->flags);
+		/* mark the request as resend request */
+		req->in.h.unique |= FUSE_UNIQUE_RESEND;
 		if (test_bit(FR_INTERRUPTED, &req->flags))
 			list_del_init(&req->intr_entry);
+		set_bit(FR_PENDING, &req->flags);
 	}
 	/* iq and pq requests are both oldest to newest */
 	list_splice(&to_queue, &fiq->pending);
-- 
2.39.5 (Apple Git-154)
