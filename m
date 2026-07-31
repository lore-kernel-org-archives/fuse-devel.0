Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984C1370AE6
	for <fuse-devel@lists.linux.dev>; Fri, 31 Jul 2026 07:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481333; cv=none; b=dT01hTeQlyF7Ae8PiiD4glTIBdOU49lj3ZYSK6Y3NnWWi3zFFpkwmFLe8a/wfah56eSXOq2AInJWnDl3WAhi0F6mjJB07FiUI6+GV8qqhgEv0HI4Cqykn4zcWHx3qWz+ubBcG3d/87n+ySF9qenHg9Sqld30fdvp/akx2j/j3a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481333; c=relaxed/simple;
	bh=foCXtiqE0gFPL3F1keI1B4kV/lVifB1Uc2Dyz6MRAn0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HFuT/xZfaAG0LmdHdn80ncxx2XDZ3rd0TxZyJhZ3axWwxLE0jRA0QHS1V/uXwDWpIQkD7IrJrNFLsQcmZR871yqj89iLeuGUH7MoK2aFr4AWmzP6x8S702zoJRCmw15waQkCAyYnZvabJ0YuwIk/dxELGE35yuT4gs/IW2o84cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; dkim=pass (2048-bit key) header.d=unisoc.com header.i=@unisoc.com header.b=B9e8QRsG; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unisoc.com header.i=@unisoc.com header.b="B9e8QRsG"
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTPS id 66V71Bwm039779
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 31 Jul 2026 15:01:11 +0800 (+08)
	(envelope-from Xuewen.Yan@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX01.spreadtrum.com [10.0.64.7])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4hBH666csQz2KMMbm;
	Fri, 31 Jul 2026 15:01:02 +0800 (CST)
Received: from BJ10918NBW01.spreadtrum.com (10.0.73.73) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Fri, 31 Jul 2026 15:01:08 +0800
From: Xuewen Yan <xuewen.yan@unisoc.com>
To: <miklos@szeredi.hu>, <cmllamas@google.com>, <tkjos@google.com>,
        <jstultz@google.com>
CC: <quic_pkondeti@quicinc.com>, <quic_pragalla@quicinc.com>,
        <qxy65535@gmail.com>, <ke.wang@unisoc.com>, <pin.xia@unisoc.com>,
        <fuse-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH] fuse: give wakeup hints to the scheduler for synchronous requests
Date: Fri, 31 Jul 2026 15:01:02 +0800
Message-ID: <20260731070102.5850-1-xuewen.yan@unisoc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL:SHSQR01.spreadtrum.com 66V71Bwm039779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
	s=default; t=1785481303;
	bh=CMsl8o5kXQxLzgM5Z3mcaSA8U0z33PlPemckYfJtCzQ=;
	h=From:To:CC:Subject:Date;
	b=B9e8QRsGTmeFtrj9XKSUJ3cyk6Qk671X6wVRswkRUr6UK35kvnBcQn3xp+1LXPou/
	 AYMweik/KPA2G5dj1vvxsSK2AlAgAjZpWe5WM2Mqt+Cy0l5c40OvGVF3Orfas3IlDQ
	 geNeclZ8ryQKOCwRU+QYvuYB/XmDJ5pddJniV9NUFBBHo5Aop0Z9fbx75otPOMMfZT
	 vmPwBWhnWBPDoOPfYhGh7nK/5uSk5NLGFDafFNrA/iDQpONIUoWXLzZklZzcaNtxWa
	 SkLXlAtPVGVPrUFOqXBeLMX3nSDhTVpUfEg4XTJ5LEsX8WDYGljyPu7vazejjT+aZn
	 bcUKOJIScFwog==

When a synchronous FUSE request is sent, the in-kernel client queues it
on fiq->pending and wakes the userspace daemon sleeping in
fuse_dev_do_read()->wait_event_interruptible_exclusive(fiq->waitq, ...).
The client then blocks in request_wait_answer() waiting for the reply,
so the waker is about to go to sleep: this is exactly the pattern that
WF_SYNC is meant to optimise.
As Peter Zijlstra explained in the earlier discussion [1],
WF_SYNC is a hint that the waker is about to sleep and the waker and
wakee share data, so stacking the woken thread on the current CPU
is beneficial for cache locality instead of searching for an idle one.

Add a wake_up_sync() wrapper for task on the synchronous request path.

Performance:

  On an Android big.LITTLE device where the FUSE daemon (MediaProvider)
  runs as a background service on the little cores while foreground
  applications run on the big cores, the synchronous wakeup hint lets
  the scheduler pull the daemon thread onto the big core that is
  issuing the request, where the request data is cache-hot.  Measured
  by qixiaoyu [2] on a 2000-picture zip decompression to /sdcard:

    ------------------------------------------
    | Default   | patched     | Improvement |
    ------------------------------------------
    | 13.0 s    | 7.0 s       | 46%         |
    ------------------------------------------

    Server thread wall duration: 3583 ms -> 1276 ms
    Server runs on big core:       5% -> 79%

  The original 4K-file copy/compress/decompress workload [1] on the
  same kind of device showed a ~28% improvement (13.8s -> 9.9s).

  Note: Miklos reported [2] that on his test box he could not observe
  an actual migration from wake_up_interruptible_sync(); the benefit
  appears to be most visible on asymmetric topologies (big.LITTLE,
  where the daemon normally lives on a little core) and on workloads
  dominated by small synchronous requests.  No regression was
  reported on the symmetric- SMP test setups tried.

The earlier version of this change [1] added a `bool sync` argument
to all three hooks of `struct fuse_iqueue_ops` and threaded it
through virtio_fs as well.  Miklos questioned the interface churn,
and the patch has been stalled since.

Re-work it so the exported interface is left alone.  The hint is
carried in a new FR_SYNC_WAKEUP bit of the existing `fuse_req->flags`
bitfield (an `unsigned long`, so no layout change):

  - __fuse_request_send() sets the flag before fuse_send_one().
  - fuse_dev_queue_req() consumes it with test_and_clear_bit() and
    forwards the result to fuse_dev_wake_and_unlock(), which then
    picks wake_up_sync() or wake_up().
  - The forget, interrupt and resend paths pass `false` explicitly,
    preserving their original wake_up() behaviour.

Only /dev/fuse ever wakes fiq->waitq; virtio_fs and fuse_uring
dispatch through their own transport and never call wake_up(), so
threading `sync` through their ops would just add an unused argument.
test_and_clear_bit() makes the flag a one-shot hint that cannot leak
into a future requeue, and no extra cleanup is needed in
fuse_request_end()/fuse_put_request().

[1] https://lore.kernel.org/lkml/1638780405-38026-1-git-send-email-quic_pragalla@quicinc.com/
[2] https://lore.kernel.org/lkml/20221222093407.GA1141@mi-HP-ProDesk-680-G4-MT/

This work is based on "Pradeep P V K <quic_pragalla@quicinc.com>"  and
"Pavankumar Kondeti <quic_pkondeti@quicinc.com>"

Assisted-by: TRAE:GLM-5.2
Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
---
 fs/fuse/dev.c        | 22 ++++++++++++++++------
 fs/fuse/fuse_dev_i.h |  3 +++
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5763a7cd3b37..689470a548a2 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -210,10 +210,13 @@ EXPORT_SYMBOL_GPL(fuse_req_hash);
 /*
  * A new request is available, wake fiq->waitq
  */
-static void fuse_dev_wake_and_unlock(struct fuse_iqueue *fiq)
+static void fuse_dev_wake_and_unlock(struct fuse_iqueue *fiq, bool sync)
 __releases(fiq->lock)
 {
-	wake_up(&fiq->waitq);
+	if (sync)
+		wake_up_sync(&fiq->waitq);
+	else
+		wake_up(&fiq->waitq);
 	kill_fasync(&fiq->fasync, SIGIO, POLL_IN);
 	spin_unlock(&fiq->lock);
 }
@@ -230,7 +233,7 @@ void fuse_dev_queue_forget(struct fuse_iqueue *fiq,
 	if (fiq->connected) {
 		fiq->forget_list_tail->next = forget;
 		fiq->forget_list_tail = forget;
-		fuse_dev_wake_and_unlock(fiq);
+		fuse_dev_wake_and_unlock(fiq, false);
 	} else {
 		kfree(forget);
 		spin_unlock(&fiq->lock);
@@ -251,7 +254,7 @@ void fuse_dev_queue_interrupt(struct fuse_iqueue *fiq, struct fuse_req *req)
 			list_del_init(&req->intr_entry);
 			spin_unlock(&fiq->lock);
 		} else  {
-			fuse_dev_wake_and_unlock(fiq);
+			fuse_dev_wake_and_unlock(fiq, false);
 		}
 	} else {
 		spin_unlock(&fiq->lock);
@@ -281,11 +284,13 @@ EXPORT_SYMBOL_GPL(fuse_request_assign_unique);
 
 static void fuse_dev_queue_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 {
+	bool sync = test_and_clear_bit(FR_SYNC_WAKEUP, &req->flags);
+
 	spin_lock(&fiq->lock);
 	if (fiq->connected) {
 		fuse_request_assign_unique_locked(fiq, req);
 		list_add_tail(&req->list, &fiq->pending);
-		fuse_dev_wake_and_unlock(fiq);
+		fuse_dev_wake_and_unlock(fiq, sync);
 	} else {
 		spin_unlock(&fiq->lock);
 		req->out.h.error = -ENOTCONN;
@@ -752,6 +757,11 @@ static void __fuse_request_send(struct fuse_req *req)
 	/* acquire extra reference, since request is still needed after
 	   fuse_request_end() */
 	__fuse_get_request(req);
+	/*
+	 * This is a synchronous request: the caller will block waiting for
+	 * the answer. Hint the scheduler via wake_up_sync().
+	 */
+	set_bit(FR_SYNC_WAKEUP, &req->flags);
 	fuse_send_one(fiq, req);
 
 	request_wait_answer(req);
@@ -1806,7 +1816,7 @@ void fuse_chan_resend(struct fuse_chan *fch)
 	}
 	/* iq and pq requests are both oldest to newest */
 	list_splice(&to_queue, &fiq->pending);
-	fuse_dev_wake_and_unlock(fiq);
+	fuse_dev_wake_and_unlock(fiq, false);
 }
 
 /* Look up request on processing list by unique ID */
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 668c8391d61c..40a791094813 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -38,6 +38,8 @@ struct fuse_iqueue;
  * @FR_PRIVATE:		request is on private list
  * @FR_ASYNC:		request is asynchronous
  * @FR_URING:		request is handled through fuse-io-uring
+ * @FR_SYNC_WAKEUP:	use synchronous wakeup when queueing this request to
+ *			give the scheduler a hint about the waker task
  */
 enum fuse_req_flag {
 	FR_ISREPLY,
@@ -53,6 +55,7 @@ enum fuse_req_flag {
 	FR_PRIVATE,
 	FR_ASYNC,
 	FR_URING,
+	FR_SYNC_WAKEUP,
 };
 
 /**
-- 
2.25.1

