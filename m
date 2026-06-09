Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADCF274B2A
	for <fuse-devel@lists.linux.dev>; Tue,  9 Jun 2026 00:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780965022; cv=none; b=TSkppQgSZCGJCAdBtMuu4un7+NW6sXo910lV+j/sBFG0FjOP5TecpDxrHH5F+LtwROgIUIe2D7cGVpN9CycRfuXb7WzoT/5gS7Tt7rOp3uRE4iOcZDaQU/4jPvlXsm6RPkeSqc/1PY4XwZlb1QhSDZ2x+keOoLrK5eLokyX47Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780965022; c=relaxed/simple;
	bh=SVHq+/kO02mzIskKkEksKkfsbEZwLNF9WCyiSZCeee8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qlS/wuzeiwujfltkKV6rI9yApYKknTF6vTYYijYji8SlImQA43qjVKo6gokiRw6syIJJdEuspUyc1+q0LGqMdP2BsQ25jkacfIahw4bqTm6vIo8VN5mSnNZsjbdHNy4ReF7RIuAFpZghdf2uIUgjeaQy4FWou7Yraxylzq3m92c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTJGvB6D; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTJGvB6D"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c3543590so32944595ad.2
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 17:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780965020; x=1781569820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EWu3hw5PgVLWrMCQT6BQQXF2x1rCbMDcemQvj9Nivbo=;
        b=CTJGvB6Dle763skD0sulEY7BeoFLK6oDQ34SsLy/AWn0KTLP95OYRAjmgyHI+VOhnr
         JVT5RMrBprLdgLNmXjHFSD2xxn4ni5hs5TMuILBfnlKGyALZ/Y1CQX7gzQsGM8A9BGco
         CUJj5dN7EfYUiTKZhMAsEIszyDZkRNKeOtcqkYafSbVNEETRAxlMXevhXhcqNdSkfa5a
         5QvTLFJohYaqfGSBcNnEpCg9cb3He04JH0uLU6Oj/y0PD+LhZYaz4C4ZrN+LG4irx5fE
         zPt0L1K+nZSqECK3sjGLEr88+rLFagjRyLrt+KpdJJntbQarv08U6ycWrkfGzCx+NcyL
         JchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780965020; x=1781569820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWu3hw5PgVLWrMCQT6BQQXF2x1rCbMDcemQvj9Nivbo=;
        b=nca6Xbtmiw9TiT7UEJA1G5mzWxOLQ7fE0FDb8BeVNCONCVpuYPBuHOVX3EbqZZJCxY
         oMAFlxi4esgW9aMms8k2C4NSkymNJUHaaTixiWXXsrtmrUmY+LHIOGuFAlbSmtJ8MYIp
         jcByTY3TqwwbZAFlyS7g+mjluw75PLA5Bj+WRiMfAdQXJzuX7FH0A30ujPG1HasKcLpn
         szF+pGSx2aXUThTaGyCi1q/f0iZG6CLugAFblYFPvD3OgtFoCnlK19OsNoiXPYHOgbsb
         DF+b6muFE/192/XPcA/b7JCmIYB6niRDYGlnm97yk3nRugeTm0d7JwBSqS9U3nL8K6Mi
         yFQA==
X-Forwarded-Encrypted: i=1; AFNElJ/qc6E4/fW+SS1xUYfSB/O6vRoXmZuN0jHjP7svlKoI3t20/RaUD/KLUvksE6x/FmsxQxVWYxeTR+zO@lists.linux.dev
X-Gm-Message-State: AOJu0YwprOUi++pd4F5EwmYai/D9yKIP7sokf5h71wK/L1X70T4syUOc
	jyl2lNqlx1lM0zvhmoGxmw7gB199by6SwfP4rvm44N4dRK4vugN4mfVw
X-Gm-Gg: Acq92OHEEw6DQtmR4ivXh6bvL7b0Cjv/hwIdQOOjRjkjZqN9wM0MKKoJYE3v4DDXlht
	djtBHCIJAOFS8EQYGn/f7UwuTE/l4XQfWqUMY39Efz+wq2bHdO1iYUvMjOF9Dzoaj4Kq5mbR966
	sCEpYIe5mmXGsN3IdTcVe4D1bX3UVdZH9gyUXprEpH7iA5IYZj3fX4QtvtE6Y2yEhDfj+BI+Y0T
	tZzecAhRON8HWcYse7HDhfVf9htY5Ufg8jUZPQxRkSqxLncEeIm0Ykd/24YOxlFc3j02Ennnki6
	1Mv2h9j6aU2aV5gSMpqQeXsok8OoZmCKiXnBd0g5nIidAEKc3fueywE0nbfq7/856nSmj96Uv/b
	oFW+AonoKhMWDpampR4FmuujLkdHE0Yn6CN8dHiXsLwJPpNM6i+63gNERr6ZUkpU8ERAdFMSAtw
	TorSFvDBCe1+IwLjo5mG2M7oEFYlMQ0t569JsL4RuI4/bhUOZjvEOei1JkXpNeosBjI9tnv1Dfc
	nDVRQ7iPaIl9w==
X-Received: by 2002:a17:903:908:b0:2c1:a19:8396 with SMTP id d9443c01a7336-2c1e80ff89amr219953885ad.31.1780965019688;
        Mon, 08 Jun 2026 17:30:19 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4f::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa404fsm191265615ad.37.2026.06.08.17.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 17:30:19 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	fuse-devel@lists.linux.dev,
	Chris Mason <clm@meta.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] fuse: end fuse_req on io-uring cancel task work
Date: Mon,  8 Jun 2026 17:28:55 -0700
Message-ID: <20260609002855.3654601-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Mason <clm@meta.com>

When io_uring delivers task work with tw.cancel set (PF_EXITING,
PF_KTHREAD fallback, or percpu_ref_is_dying on the ring context),
fuse_uring_send_in_task() takes the cancel branch, assigns
-ECANCELED, and falls through to fuse_uring_send(). That path only
flips the entry to FRRS_USERSPACE and completes the io_uring cmd;
it never discharges the ring entry's owning reference to the
fuse_req that fuse_uring_add_req_to_ring_ent() handed it at
dispatch time.

    fuse_uring_send_in_task()
      tw.cancel == true
        err = -ECANCELED
      fuse_uring_send(ent, cmd, err, issue_flags)
        ent->state = FRRS_USERSPACE
        list_move(&ent->list, &queue->ent_in_userspace)
        ent->cmd = NULL
        io_uring_cmd_done(-ECANCELED)
        /* ent->fuse_req still set, req still hashed */

The fuse_req stays linked on fpq->processing[hash] and
fuse_request_end() is never invoked. The originating syscall
thread blocks in D-state in request_wait_answer() until
fuse_abort_conn() runs, which can be the entire connection
lifetime. For FR_BACKGROUND requests fc->num_background is never
decremented either, so repeated cancels inflate the counter until
max_background is hit and all later background ops stall. tw.cancel does
not imply a connection abort (e.g. a single io_uring worker thread exits
while the fuse connection stays up), so this cannot be left for
fuse_abort_conn() to clean up.

Ending the req but still routing the entry through fuse_uring_send()
is not enough: that leaves a req-less entry on ent_in_userspace, and
ent_list_request_expired() dereferences ent->fuse_req unconditionally
on the head of that list, which would then NULL-deref.

Fix the cancel branch to release the entry directly. Remove it from the
queue, complete the io_uring cmd, end the fuse_req, free the entry, and
drop its queue_refs (waking the teardown waiter if it was the last).

Fixes: c2c9af9a0b13 ("fuse: Allow to queue fg requests through io-uring")
Cc: stable@vger.kernel.org
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Assisted-by: kres (claude-opus-4-7)
Signed-off-by: Chris Mason <clm@meta.com>
---
This depends on "fuse: fix moving cancelled entry to ent_in_userspace
list" [1] and should be applied after it. That patch removes the
queue_refs > 0 gate in fuse_uring_abort(); without it, once this cancel
path drops queue_refs to 0 with requests still queued,
fuse_uring_abort() skips fuse_uring_abort_end_requests() and those
requests are never flushed.

[1] https://lore.kernel.org/fuse-devel/20260608192149.23294-4-joannelkoong@gmail.com/

Changelog:
v1: https://lore.kernel.org/fuse-devel/20260605192708.141921-1-joannelkoong@gmail.com/
v1 -> v2: 
* Also clean up ent (Bernd)

 fs/fuse/dev_uring.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index fa807aa4bc2c..4256530281fb 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1236,11 +1236,21 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 			fuse_uring_next_fuse_req(ent, queue, issue_flags);
 			return;
 		}
+		fuse_uring_send(ent, cmd, err, issue_flags);
 	} else {
 		err = -ECANCELED;
-	}
 
-	fuse_uring_send(ent, cmd, err, issue_flags);
+		spin_lock(&queue->lock);
+		list_del_init(&ent->list);
+		spin_unlock(&queue->lock);
+
+		io_uring_cmd_done(cmd, err, issue_flags);
+
+		fuse_uring_req_end(ent, ent->fuse_req, err);
+		kfree(ent);
+		if (atomic_dec_and_test(&queue->ring->queue_refs))
+			wake_up_all(&queue->ring->stop_waitq);
+	}
 }
 
 static struct fuse_ring_queue *fuse_uring_task_to_queue(struct fuse_ring *ring)
-- 
2.52.0

