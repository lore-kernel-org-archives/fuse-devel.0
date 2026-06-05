Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E9C3CF215
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 19:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780687680; cv=none; b=RvHVPui5IC+0MHe8F6DYuOXYESP0/WaswbGB1/jm4IuPJ8lo3OpIDJ0t7zIqklzfeJbykI2VQAcUgRJ6fwMooBwniTF/0dqZFTgX6fWmvab0LM9NXZ/KkNQJijJt3GK29jxRZIF1orGEMVQ5vjf9u33eRsa7JHXPZ0HgqHuQXPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780687680; c=relaxed/simple;
	bh=31Z3y7y0ksK1jBF5obj4/irW0nRTbUrrucEu0RLb6Og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u9OuyYAp4coAYRwjzqSjDKUtf4/RZWgJdAXM/6ayHkSukiqBOCaWkfFqkdE3BsDuY0BNjFrtf8NbosrpczfJ5KXOKVg89jFDl3lyCM4Jg8xTUu4xNsY07SNXk0uKyebVIeT3HSUmRvgfXxHW5tJAlK8Kb3H7hqUhSNMUMEPt21s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjGXr4mT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjGXr4mT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf1cda2b17so17725465ad.1
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 12:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780687677; x=1781292477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f71aXW94wH9CfeGDBNkWa7n5fbV3KWrQbSfdeEu5BEQ=;
        b=RjGXr4mTSKuBHUJd8F7V6OS8HjjDt7kPT0QSFyWJeP4K9wmqmD2bjZhwxf+aJuXbG/
         rXFU8RAHh2KEUotjPqmqkvA6z83FQEGIa3REW+x8+/j+a4M7IbWcahPsfnYjC/mw1eTb
         guLuGnlH+r48lGv5yxZJPrCsWH0EncNWZ3fs2EbOMRoYGS/LI1igh3xt43kb+02d2wly
         HzEaajT5AO3FP/M7CKUorut972rGXbbWlSJtgV/EaAMyZBO0JgBIHURb4/0p/z6b2qCB
         CFF4vWMfPx7ydKeh5I5j/Apr0wKGQt3GKt6++dvnAeBPeStTEjmUyKX0lH431Bx73+ub
         Slhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780687677; x=1781292477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f71aXW94wH9CfeGDBNkWa7n5fbV3KWrQbSfdeEu5BEQ=;
        b=DjMoT47uzRS2SP/Gi5NCweUsUpyKjuXDto2UbKcEokbm+BEgdMMw8dsDH9TtpSGYGf
         QictvCGdsYpcgAC/ryakomZs0G/pPN7agppzyMB28pdCjkAegPXnkr/uQqWuK9JJ69Ej
         Ls3TfuXAwGDV6OcGXn01VTUWYYaBTcsjeGMdibp5cZKVtq68tsIgU0AKocmgcNZA7rOt
         h8XcLWJQxveyrt9ECOq+XXCf1KNlUMzCsSg3zGw4RKqwebVz2Fa7p9Jkbdi0LO9TKMXA
         SUnXmQwULeYkqtIhO9VmCcGipiY7OPkcDVghzIWglFELmlswKsQKb0ubJ/B/gd5ehHRk
         V9Bw==
X-Forwarded-Encrypted: i=1; AFNElJ8HJOi2WmAnHU79sGOKsKgCnL6K9Cu9fUQ5rVfJ3539YOowRYDtRmgQKzKe2qKqtf8HE3SHtTRqHHTN@lists.linux.dev
X-Gm-Message-State: AOJu0YwGXe3GcwqFonWfnbWRdQ+rkE6ECOGA73+tpSB0fSG1E8ae06yt
	qP4HLskuRrMOQI6exnPhC6xNaDABI9MRAj8LDegtCL03Z+9K06/OJ0AN
X-Gm-Gg: Acq92OH42OqY3aHrEo/D7h5xE7G2oc2eHb5wzmSDvStfwxnuSNuO0DUAFL843eH547H
	j1AT2SG1+FhdO5PRBqfrdI8q8IRy9D/jLRIM0q+Fo5ymRFJtjoTJROzDSfFIi8MXU+eiVvESCm9
	UZvndkQZ+VC6lr7y2JFDbAWzWqQKzs1EboAxirnzK2NtWSkdx2gkTcL8ZgJAy6UwJyvaGJflyQg
	9b08ehA/atmVeZSgyftiq0A6eGZx9JbCOFMnvqXGIY9PdFfgsnWaa2SBN1+9JMNhCnsSteSoyOx
	BKkiWCMhdEYl/3e/un66BlcwNUByt91spmKCA4B9pCT49LmolAc482GUtM9RoZBCpOiEh4/7fo1
	PxrRXyKsAYClKXfbBMT6FkuNHzAO3TQafGnNShOFagVgogvUSdOTg23Fb+4GOSNBswqufOt/yJk
	5QnhRrEPxLPImq2w4UpHGySo8rNQ8=
X-Received: by 2002:a17:903:2385:b0:2c0:dc5c:9069 with SMTP id d9443c01a7336-2c1ec54cc43mr41203005ad.2.1780687676741;
        Fri, 05 Jun 2026 12:27:56 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:9::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166391d53sm133125475ad.65.2026.06.05.12.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 12:27:56 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	fuse-devel@lists.linux.dev,
	Chris Mason <clm@meta.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] fuse: fix data races on ring->ready
Date: Fri,  5 Jun 2026 12:27:07 -0700
Message-ID: <20260605192708.141921-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260605192708.141921-1-joannelkoong@gmail.com>
References: <20260605192708.141921-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Mason <clm@meta.com>

On weakly-ordered architectures, the store to fiq->ops can be
reordered past the store to ring->ready, allowing a CPU that sees
ring->ready == true via fuse_uring_ready() to dispatch requests
through a stale fiq->ops pointer. Upgrade the store to
smp_store_release() and the load in fuse_uring_ready() to
smp_load_acquire() so that the preceding WRITE_ONCE(fiq->ops, ...)
is visible to any CPU that observes ring->ready == true.

Additionally, fuse_uring_do_register() publishes ring->ready with
WRITE_ONCE() but the fast-path check reads it with a plain load.
This is a marked-vs-unmarked access that KCSAN will flag. Wrap it in
READ_ONCE() to mark it without adding unnecessary ordering.

Also wrap the fc->ring load in fuse_uring_ready() in READ_ONCE() to
prevent the compiler from reloading it between the NULL check and the
dereference.

Fixes: c2c9af9a0b13 ("fuse: Allow to queue fg requests through io-uring")
Cc: stable@vger.kernel.org
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Assisted-by: kres (claude-opus-4-7)
Signed-off-by: Chris Mason <clm@meta.com>
---
 fs/fuse/dev_uring.c   | 4 ++--
 fs/fuse/dev_uring_i.h | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e33847436693..7cd50990b097 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -986,12 +986,12 @@ static void fuse_uring_do_register(struct fuse_ring_ent *ent,
 	fuse_uring_ent_avail(ent, queue);
 	spin_unlock(&queue->lock);
 
-	if (!ring->ready) {
+	if (!READ_ONCE(ring->ready)) {
 		bool ready = is_ring_ready(ring, queue->qid);
 
 		if (ready) {
 			WRITE_ONCE(fiq->ops, &fuse_io_uring_ops);
-			WRITE_ONCE(ring->ready, true);
+			smp_store_release(&ring->ready, true);
 			wake_up_all(&fch->blocked_waitq);
 		}
 	}
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index 368f4d0790eb..6af604e17b2d 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -167,7 +167,9 @@ static inline void fuse_uring_wait_stopped_queues(struct fuse_chan *fch)
 
 static inline bool fuse_uring_ready(struct fuse_chan *fch)
 {
-	return fch->ring && fch->ring->ready;
+	struct fuse_ring *ring = READ_ONCE(fch->ring);
+
+	return ring && smp_load_acquire(&ring->ready);
 }
 
 #else /* CONFIG_FUSE_IO_URING */
-- 
2.52.0

