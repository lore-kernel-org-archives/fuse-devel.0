Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812BF1A3154
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 02:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778897537; cv=none; b=hXNkwS+OKSbZspNfGrfoCVn5+Avy58oIXVVtpk+mDLbSkbyhIeUiJPJx17872p0mzGAomsKtmD5Sd78VBbzyv3u7ecG6HnEBunEFOvk7PZyGi2SyyDPBs2yPw1UoLB4cJ1+U8VwrizxjfG6lfB1vx65PH1i9B4nJoZOU+ioRfBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778897537; c=relaxed/simple;
	bh=AHd5YeVtutAbZkxadD/aQY5HB+EyJsk8qeRwSqLawfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeuQu+crfVq10v4iGIEVhfTFqm7rTGFThTVAOIRqsyM1uIrb8e8ZMkT2wCohPkfZ3qnDuoB8LsR1O1ykUuOO8v0CosT/ABWKClvLM3omhCYbSY7fH04o7lGnAE3pWcpFW3kl/vIvI1lW99KCHVvUTIQNXksCx85abJZY8ih32Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRW7TJyR; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRW7TJyR"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65c52bb5dd7so765669d50.2
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 19:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778897535; x=1779502335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwMIyvXLF7QVH+M7je+E+kLYonxVYHkOjT0cHPKyEmk=;
        b=HRW7TJyR3WuQ5wy3oRYmp52dQv9qudAz5LXgOeRU+W8YCmWLTNw35/VCA1RpvwS8l0
         WUoxEkDt9pOdntbDgdl81RXx8ptNYdH8k2VbsI1GNiAQovEBwlp1NrNK/svR0dYHkznV
         H8I7+uFjS/ZblpTcbU9V8N50XU73WIX9ilxPssIKMXaEU03FYy+ljYIJZKQkZA1CvTtH
         tkmdaQiKxaV6nYTvOt6VB+f4NWAJTCWJEnb5KMDp145ah4pzC6+BmrI5BPwfoF4tgrho
         vXC+Ov/74CAGxarvbzCrWvsPyWQhIrD0gL3uhTVDNTvQDZwI/55DK2MFhCtVWmd0k/Bg
         EgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778897535; x=1779502335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EwMIyvXLF7QVH+M7je+E+kLYonxVYHkOjT0cHPKyEmk=;
        b=f8Fcv4L6IYpPjHLjzYqv2Mqmna7OFtnf4GJTe4FbJAk9ppVV0uqrSaZyGZALTJzZWK
         9LJEcatK9IYUwUCmxx4JswsWBoc702zDl2b2JV3u7lE+HMBEYgENCzbObPHxtHikkZCd
         PurKogfVL0qrhNnzpbs5vrl/VHI6lJPnh/H/OZSMrsIfq+PJGo36g+hsVIzOvSqUYoOx
         zPLxVSVPiTVRoBxn9oKABZZdk5Db7VBqdKCsuSEB9XcxMAXMx3VpbEUALMtK39glgrn1
         D7piypg6vlftqHx12MBuPUWGrZQUG7OCThEjMvu3opbQHbIAmwLLrncvitx0T+t85lEk
         DOeA==
X-Gm-Message-State: AOJu0YyCukrYZG/0iYOVA79DCdaVbHGC4us+h90GckqT4n85zSJPFAdF
	0V7+CJi+pKeyMhLK7fpsquEqZwT8Z5OEN8bsceYeQEw2QENcx1KyIwHw
X-Gm-Gg: Acq92OHfqeA3MBXN3whT0OPz68i26J6tm0PuweoFDgx28AfdaigDW016T1X+FGim83P
	jg9pG/ZQJy0jba48g0KHVMKSW+FBHi+UnH9V7ENehqpSs+ViDkPLlkzK6QDw8G4uYL3+NEc451u
	oeTu5N0v3m7wLvZFixFgCbkmUmr+wf5FsGb7nWw3CZgnJoY+rwHDRbnEnzGxuIgr1YSxCyKmlVW
	9YjBf7xeH6yCDHyDaeu3LTnRZd6AnyLKXdYYj/WxkQ9KetnHKyTXM/2XbjYF/VjCe+VuaXUlXrI
	+dT1IZAOIXzeQdX+x/8RxgTZJPBwLifiFfO5AixU26XuEGpdqG43JQln/q3JUe8WbpjuMi8D7Iq
	z2b8k9/hC6eP17WSvTSRmpU9u3nVLbApHXPu3eVnJ2ZqKJtjrT2UKn5knlJsq8xMpfC+jeHHuBP
	eiG3zRIlsBH+gl7ZVMC7g5HLX9dlSgdm6iMRtqza+L
X-Received: by 2002:a05:690e:1403:b0:65e:39d1:d9f4 with SMTP id 956f58d0204a3-65e39d1e47amr428522d50.9.1778897535504;
        Fri, 15 May 2026 19:12:15 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:b::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e3aa93cdasm117281d50.21.2026.05.15.19.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 19:12:14 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	bernd@bsbernd.com,
	ali@ddn.com,
	horst@birthelmer.de,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] fuse: fix race between registration and connection abortion
Date: Fri, 15 May 2026 19:11:36 -0700
Message-ID: <20260516021138.2759874-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260516021138.2759874-1-joannelkoong@gmail.com>
References: <20260516021138.2759874-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes this race:
- thread a: io_uring_enter -> register sqe ->
  fuse_uring_create_ring_ent -> allocate ent but doesn't grab queue_ref
  yet
- thread b: fuse_conn_destroy() -> fuse_chan_abort() ->
  fuse_uring_abort() is a no-op due to queue ref being 0
- thread a: grabs the queue_ref, queue_ref is now 1, rest of
  fuse_uring_do_register() logic executes
- thread b: fuse_chan_abort() returns, fuse_chan_wait_aborted() now runs
  and calls
  "wait_event(ring->stop_waitq, atomic_read(&ring->queue_refs) == 0);"
The abort/unmount thread will hang indefinitely in unkillable state as
nothing will decrement queue_refs or wake stop_waitq, and the ring,
queue, and ent are leaked.

Fix this by checking fch->connected under fch->lock after the created
ent has grabbed a ref count on the queue. This ensures that in the
scenario above, it is guaranteed that we either release the queue ref
and wake up stop_waitq (in case fuse_chan_wait_aborted() is already
waiting) in fuse_uring_do_register() when we detect !fch->connected, or
if the connection is aborted after the check, it is guaranteed that the
async teardown worker will be running in the background cleaning up ents
and decrementing the ent's ref on the queue, which will unblock the
eventual queue and ring teardown.

Fixes: 24fe962c86f5 ("fuse: {io-uring} Handle SQEs - register commands")
Cc: <stable@vger.kernel.org>
Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e467b23e6895..99ebb7c9cc61 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -973,15 +973,26 @@ static bool is_ring_ready(struct fuse_ring *ring, int current_qid)
 /*
  * fuse_uring_req_fetch command handling
  */
-static void fuse_uring_do_register(struct fuse_ring_ent *ent,
-				   struct io_uring_cmd *cmd,
-				   unsigned int issue_flags)
+static int fuse_uring_do_register(struct fuse_ring_ent *ent,
+				  struct io_uring_cmd *cmd,
+				  unsigned int issue_flags)
 {
 	struct fuse_ring_queue *queue = ent->queue;
 	struct fuse_ring *ring = queue->ring;
 	struct fuse_chan *fch = ring->chan;
 	struct fuse_iqueue *fiq = &fch->iq;
 
+	spin_lock(&fch->lock);
+	/* abort teardown path is running or has run */
+	if (!fch->connected) {
+		spin_unlock(&fch->lock);
+		if (atomic_dec_and_test(&ring->queue_refs))
+			wake_up_all(&ring->stop_waitq);
+		kfree(ent);
+		return -ECONNABORTED;
+	}
+	spin_unlock(&fch->lock);
+
 	fuse_uring_prepare_cancel(cmd, issue_flags, ent);
 
 	spin_lock(&queue->lock);
@@ -998,6 +1009,7 @@ static void fuse_uring_do_register(struct fuse_ring_ent *ent,
 			wake_up_all(&fch->blocked_waitq);
 		}
 	}
+	return 0;
 }
 
 /*
@@ -1114,9 +1126,7 @@ static int fuse_uring_register(struct io_uring_cmd *cmd,
 	if (IS_ERR(ent))
 		return PTR_ERR(ent);
 
-	fuse_uring_do_register(ent, cmd, issue_flags);
-
-	return 0;
+	return fuse_uring_do_register(ent, cmd, issue_flags);
 }
 
 /*
-- 
2.52.0

