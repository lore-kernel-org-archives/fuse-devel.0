Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680BE2D2486
	for <fuse-devel@lists.linux.dev>; Tue, 28 Jul 2026 03:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785208632; cv=none; b=R45RBSs4yWlHJ//cI0I27iudQPltteRdwMS4dY0AvyAySh/dXjQrWQzf67wsPaOPlE7J4OUvo0Ww/gOGyRo5GYoIZsgiV9b1m9ifCsERufkXhkjH4LO4GH1mIwhUDJanvcuGIAsgMIKAF1sAXia1u+gGUoKu8LRkJbJh4ikJnVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785208632; c=relaxed/simple;
	bh=VHfjlq2gqBebzpTD+TCYy1NeHcNZuS0/XsKY5TCZoG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WMWI9dWW7CoJJr7Nt1JYjabIci3h/+2BaiM9qMyFrbDMOdgnrjmJyLJKRDKnKwymijjV/mVZCqxNlAH+mFQfS4aYqvKWlavVWH1Lit+TUTb7AC7p6tsMfxar4lV2Vs938jNhqwgLRp0MsvUoqrQxc0qOwCdMMPDKDMqT8Z/WekY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=SKJcf501; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="SKJcf501"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785208621; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Sa1kNRpb6cgIMxXAdLoSh/vSemrXDYErw5WYrH16ymk=;
	b=SKJcf501NO+2SvFEeuUnjdoeOSVm9UmeALUkibvnnWqX/4cAGDY3eX3xDX4Yev5L/SiBkznZjMFTvdXAB7T5wsrgvJlSHPyPbGtiP0sCAx82lXlDyv4Q0nB8zm3PgQKyleGqqZW5jfMMlVZ1Tql9fb9g5Uh9wxbkdZjvecXeTKs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0X7zGS4K_1785208601;
Received: from x31h02109.sqa.na131.tbsite.net(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X7zGS4K_1785208601 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 28 Jul 2026 11:16:59 +0800
From: Baokun Li <libaokun@linux.alibaba.com>
To: fuse-devel@lists.linux.dev
Cc: miklos@szeredi.hu,
	jefflexu@linux.alibaba.com,
	winters.zc@antgroup.com,
	stable@vger.kernel.org
Subject: [PATCH] fuse: clear stale intr_entry in fuse_remove_pending_req()
Date: Tue, 28 Jul 2026 11:16:41 +0800
Message-ID: <20260728031641.2497811-1-libaokun@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f8fce75fedf7 ("fuse: clear intr_entry in fuse_resend and
fuse_remove_pending_req") removes stale interrupt entries in
fuse_chan_resend() when requests are moved back to fiq->pending.
However, that cleanup only covers interrupt entries that are already
linked at scan time.  It can race with a concurrent queue_interrupt()
from the request holder:

  CPU 0 (holder thread)           CPU 1 (resend)
  ---------------------           --------------

  req in processing (FR_SENT=1)

  signal arrives
  set_bit(FR_INTERRUPTED)
  test_bit(FR_SENT) -> true
  queue_interrupt():
    spins on fiq->lock ...
                                  fuse_chan_resend():
                                    set_bit(FR_PENDING)
                                    clear_bit(FR_SENT)
                                    spin_lock(&fiq->lock)
                                    cleanup scan:
                                      intr_entry not linked yet
                                      -> list_del_init is a no-op
                                    list_splice -> fiq->pending
                                    spin_unlock(&fiq->lock)
    ... acquires fiq->lock
    list_empty(&req->intr_entry) -> true
    FR_FINISHED not set
    -> intr_entry added to fiq->interrupts
       AFTER the cleanup already ran

  fatal signal arrives
  fuse_remove_pending_req():
    test_bit(FR_PENDING) -> true
    list_del(&req->list)
    __fuse_put_request
  fuse_put_request (refcount -> 0)
  -> req freed, intr_entry dangling
     on fiq->interrupts

fuse_dev_queue_interrupt() only checks list_empty() and FR_FINISHED
before linking intr_entry -- it does not check FR_PENDING, so a
request already spliced back to fiq->pending can still be added to
fiq->interrupts.  The lock contention itself produces the bad
ordering: while the resend holds fiq->lock to scan the queued
requests, the holder spins in queue_interrupt() and links intr_entry
right after the scan finishes.

The dangling entry then causes the same use-after-free that the
above commit describes: fuse_read_interrupt() writes to the freed
slab object via list_del_init() and leaks req->in.h.unique to
userspace.  Once the freed memory is reused, INIT_LIST_HEAD() turns
the entry into a self-loop and list_empty(&fiq->interrupts) returns
false forever, so the daemon reads the same phantom FUSE_INTERRUPT
in an infinite loop and never consumes fiq->pending.

Close the race in fuse_remove_pending_req(), which is the common
bail-out path for both the legacy and the io_uring transport: after
the request is removed from the pending queue, also unlink intr_entry
under fiq->lock before the reference is dropped.  fiq->lock must be
taken explicitly since the lock argument is the ring queue lock in
the io_uring case, while fiq->interrupts is always protected by
fiq->lock.  This runs on the holder thread after any
queue_interrupt() it issued, and no other path can re-link the entry
once the request is off the queues (re-queueing an interrupt from
FUSE_INTERRUPT's -EAGAIN reply requires finding the request in the
processing queue first).

Fixes: 760eac73f9f6 ("fuse: Introduce a new notification type for resend pending requests")
Cc: stable@vger.kernel.org # 6.9
Signed-off-by: Baokun Li <libaokun@linux.alibaba.com>
---
 fs/fuse/dev.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5763a7cd3b37..87891162985c 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -678,6 +678,8 @@ static int queue_interrupt(struct fuse_req *req)
 
 bool fuse_remove_pending_req(struct fuse_req *req, spinlock_t *lock)
 {
+	struct fuse_iqueue *fiq = &req->chan->iq;
+
 	spin_lock(lock);
 	if (test_bit(FR_PENDING, &req->flags)) {
 		/*
@@ -686,6 +688,18 @@ bool fuse_remove_pending_req(struct fuse_req *req, spinlock_t *lock)
 		 */
 		list_del(&req->list);
 		spin_unlock(lock);
+
+		/*
+		 * Remove stale intr_entry queued by queue_interrupt() before
+		 * the request was requeued, which would otherwise dangle on
+		 * fiq->interrupts once the request is freed.
+		 */
+		if (test_bit(FR_INTERRUPTED, &req->flags)) {
+			spin_lock(&fiq->lock);
+			list_del_init(&req->intr_entry);
+			spin_unlock(&fiq->lock);
+		}
+
 		__fuse_put_request(req);
 		req->out.h.error = -EINTR;
 		return true;
-- 
2.43.7

