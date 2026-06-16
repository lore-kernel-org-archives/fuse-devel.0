Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84E2407CE3
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 23:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781651613; cv=none; b=EOKFOCF4jEGe8PMTbARQl3kIMpcycc/YMrw6DUgrRfBl+dH84i2SwvRd8wdHC6QsB90YMcNQZZdQjYxVkaPt8qetaPZuWjshNU4WfPAB1DytWUdD+vs5lcAXXFEFFpjH1Ia96aTr40V3kJXHauccEeUHVX91LVpyKLPzq7YVU6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781651613; c=relaxed/simple;
	bh=WymM5QtMKz3MtFgckjzYvilCHmoaUCaCqTAavaXVrcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wwgthrd+uBXOrKrQLoDzBTLxzzdcFS97GidnxxwvO6JY+S8ucsn9siExJCdjeNIvpASHcdY7Sd1h2HLgH0+LeRKRhjIqRLIVARbBCdX6/DjCrDvRCUzQ34lWb2x/jd6aWEqyRfl9z3piGoiVoonOJ1WCw7MdI85tNs6vQ38Almw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+T2x1Ub; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+T2x1Ub"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-43d133d9a28so2017617fac.2
        for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 16:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781651611; x=1782256411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HnhjJZvi2+fNcVO1DAIx52Fn9e2rRuiZqteczjNc1s=;
        b=V+T2x1UbwoLaddrIexGshMs6DyCoPshI0Ho5IzZ0jI127t5zadrzUdx11ToM1KpIXM
         0AVqX5fOTU0t2pko7maUU0DlmXnX3PzWYtEylQzfCrA0Xsn4MjLBaQGh2oVgb7xUeBa7
         IBvAPalDIUsM/Phbi0RIaQv+zbvqliYfGArGL+QWlX+u5dLFyhH1Bb89/0+QSOIB0Qk5
         JFDLDR1qa6pbP0eEff4xChjkWPV06LXlhcVHAShIEDVl4HN4YX+3FWiKWKmzCMUPvQtH
         2KRdlqd+JS3N5spgHywzdCjRHYmd8gGT0ACKFi5HgAYyGc1Ikhi+NaZXJ/k6CAobcrMr
         4bYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781651611; x=1782256411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5HnhjJZvi2+fNcVO1DAIx52Fn9e2rRuiZqteczjNc1s=;
        b=r4TU6WAt7ebPVkqXUNbxhU81We99mcOlpBnZ27tgXjUJC5AYmAvuAPSC5ITrL75JkU
         XQmT73Ss8+0sTKapHxD8AY3P/jRnsGUMEoqOr5h4vYcWg9Sv090mxJ5ZE7KOT16/e2a9
         cYKyDxAwykGxOOjrienTldmZHz+Z/2VjL2O00ec5U8t/UDs3HN8KhyPBp2uHlbMRDJX3
         7tZqZDcMt7u6Ib0oLbSNFSDhPieu9Qel4sKwxfhiHLP9oP9/RsilZW+LXouRIxMffHvd
         72FDabnRf3u+v59wmNJ9/vvJpIwXZkoPGm4HWNcddVhdZFEcclMu6slTGWSIrtRhj/SN
         DsqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NyaToIHIIz01kr6nI6BmBl4mKt+/J8U7rK+CYUHUhaC7kU3RMBRjrbOvg6rmzMlPfqXrd040rdcBO@lists.linux.dev
X-Gm-Message-State: AOJu0YybvThAOUl8jdXmwz7hG7CkH4ouDHsX6wit8KWfVx22SRGO2htU
	V6zOrxGPQaeu+cVft7HQvSdryX/tjhnTuqJzM+DgsrkWA2Lz+H/p09iy
X-Gm-Gg: Acq92OFTyBkQjSG23juRfBwrGJnx911PPLKH7RcMlF71MoW7U2Iu88GTtLYMFttpjEx
	ROgq6dlr5e/usidlA6TrubLKeRVSdvuerplPtKr9a/0NtfxdT5xJ7UaSmlNuM5e4lgYyBP64VzZ
	oRSIX/gJ6zm4fFEfFNxYeAgQL9qs0+Hv1Uk8TboHcC30hHDKuOsFvBs1VOfQ9QllBXvmOWRzmdu
	T2MsXpxK1+vQbA6M68C5JVhO/68ePX3rKBQpDG53p9v8NtFeP8mShM/3t7zXH4PCCW6HufQ/HP3
	d/0NHjoHddO0NiT7iSN2pZKeEAnWI1cjttAtog+jHYX5APCoGzLD7jTZZQ3NINdas7VRofDN3jM
	yOiidJfzbpqY0yokuaFYQ81hErYW/zb2n/F6z/+ixqjGt0C83J7qZ/lVyTRqxyOlQZVWaigTymE
	W15ktF/HIP+cI56xR3NSbC6I5Ql8iAbeO7SiAlgfTZdO1/FQvcDLf/HavL7g3rezp6TJ9z0djNF
	xF2zqhXAhLz5HyvbXfQIteVVVuU/fQA/uCU1btXySDMPTuLFGB9W5Q=
X-Received: by 2002:a05:6808:17a7:b0:486:3634:e80b with SMTP id 5614622812f47-48942879cc6mr1359571b6e.10.1781651610805;
        Tue, 16 Jun 2026 16:13:30 -0700 (PDT)
Received: from rdf-gcp2.us-central1-b.c.storage-xlrait-66065.internal (163.80.112.136.bc.googleusercontent.com. [136.112.80.163])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f5a1b86sm7530924a34.5.2026.06.16.16.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:13:30 -0700 (PDT)
From: Russ Fellows <russ.fellows@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Amir Goldstein <amir73il@gmail.com>,
	Russ Fellows <russ.fellows@gmail.com>
Subject: [PATCH v3 2/2] fuse: allow parallel direct writes in passthrough write_iter
Date: Tue, 16 Jun 2026 23:13:22 +0000
Message-ID: <20260616231325.16788-3-russ.fellows@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260616231325.16788-1-russ.fellows@gmail.com>
References: <20260616231325.16788-1-russ.fellows@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_passthrough_write_iter() unconditionally called fuse_dio_lock()
from file.c, which required those helpers to be exported.  That coupling
is unnecessary and the exported symbols are undesirable.

Replace the fuse_dio_lock()/fuse_dio_unlock() calls with a
passthrough-specific pair, fuse_passthrough_lock() and
fuse_passthrough_unlock(), that is self-contained in passthrough.c.

The new fuse_passthrough_lock() allows shared inode locking only when
all of the following are true:

  - the open carries FOPEN_PARALLEL_DIRECT_WRITES
  - the write is direct I/O (IOCB_DIRECT)
  - the write is not append (IOCB_APPEND absent)
  - the write does not extend past EOF

The past-EOF check is made once before the lock is taken (fast path
to choose lock type), and then re-checked after taking the shared lock.
This re-check closes the TOCTOU window: a concurrent writer could extend
EOF between the initial check and the lock acquisition; without the
re-check a shared-lock writer could concurrently update i_size.

Passthrough files are always in uncached iomode (established at open
time via fuse_file_uncached_io_open()), so the fuse_inode_uncached_io_start()
guard from fuse_dio_lock() is not needed here.

Restore fuse_dio_lock() and fuse_dio_unlock() to file-private (static).
Remove their declarations from fuse_i.h.

Signed-off-by: Russ Fellows <russ.fellows@gmail.com>
---
 fs/fuse/file.c        |  6 ++--
 fs/fuse/fuse_i.h      |  2 --
 fs/fuse/passthrough.c | 74 +++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 7cba331d0..f8651a195 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1366,8 +1366,8 @@ static bool fuse_dio_wr_exclusive_lock(struct kiocb *iocb, struct iov_iter *from
 	return false;
 }
 
-void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
-		   bool *exclusive)
+static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
+			  bool *exclusive)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
 	struct fuse_inode *fi = get_fuse_inode(inode);
@@ -1393,7 +1393,7 @@ void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
 	}
 }
 
-void fuse_dio_unlock(struct kiocb *iocb, bool exclusive)
+static void fuse_dio_unlock(struct kiocb *iocb, bool exclusive)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
 	struct fuse_inode *fi = get_fuse_inode(inode);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 8d05c7c52..cc428d04b 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1507,8 +1507,6 @@ int fuse_file_io_open(struct file *file, struct inode *inode);
 void fuse_file_io_release(struct fuse_file *ff, struct inode *inode);
 
 /* file.c */
-void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from, bool *exclusive);
-void fuse_dio_unlock(struct kiocb *iocb, bool exclusive);
 struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
 				 unsigned int open_flags, bool isdir);
 void fuse_file_release(struct inode *inode, struct fuse_file *ff,
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index ee822a983..11c16de4d 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -25,6 +25,76 @@ static void fuse_passthrough_end_write(struct kiocb *iocb, ssize_t ret)
 	fuse_write_update_attr(inode, iocb->ki_pos, ret);
 }
 
+static bool fuse_passthrough_io_past_eof(struct kiocb *iocb,
+					 struct iov_iter *iter)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+
+	return iocb->ki_pos + iov_iter_count(iter) > i_size_read(inode);
+}
+
+/*
+ * Decide whether an exclusive inode lock is required for a passthrough write
+ * before the lock is taken.  Returns true (exclusive needed) unless all of:
+ *   - server advertised FOPEN_PARALLEL_DIRECT_WRITES
+ *   - write is direct I/O (not buffered)
+ *   - write is not append
+ *   - write does not appear to extend past EOF (re-checked after lock below)
+ */
+static bool fuse_passthrough_write_needs_exclusive(struct kiocb *iocb,
+						   struct iov_iter *iter)
+{
+	struct fuse_file *ff = iocb->ki_filp->private_data;
+
+	if (!(ff->open_flags & FOPEN_PARALLEL_DIRECT_WRITES))
+		return true;
+
+	if (!(iocb->ki_flags & IOCB_DIRECT))
+		return true;
+	if (iocb->ki_flags & IOCB_APPEND)
+		return true;
+	if (fuse_passthrough_io_past_eof(iocb, iter))
+		return true;
+
+	return false;
+}
+
+static void fuse_passthrough_lock(struct kiocb *iocb, struct iov_iter *iter,
+				  bool *exclusive)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+
+	*exclusive = fuse_passthrough_write_needs_exclusive(iocb, iter);
+	if (*exclusive) {
+		inode_lock(inode);
+	} else {
+		inode_lock_shared(inode);
+		/*
+		 * The past-EOF check in fuse_passthrough_write_needs_exclusive()
+		 * was made without holding the inode lock and may have raced
+		 * with a concurrent EOF-extending write.  Re-check under the
+		 * shared lock and upgrade to exclusive if the write now reaches
+		 * past EOF, to ensure i_size is never updated without exclusive
+		 * serialisation.
+		 */
+		if (fuse_passthrough_io_past_eof(iocb, iter)) {
+			inode_unlock_shared(inode);
+			inode_lock(inode);
+			*exclusive = true;
+		}
+	}
+}
+
+static void fuse_passthrough_unlock(struct kiocb *iocb, bool exclusive)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+
+	if (exclusive)
+		inode_unlock(inode);
+	else
+		inode_unlock_shared(inode);
+}
+
 ssize_t fuse_passthrough_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 {
 	struct file *file = iocb->ki_filp;
@@ -70,10 +140,10 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
 	if (!count)
 		return 0;
 
-	fuse_dio_lock(iocb, iter, &exclusive);
+	fuse_passthrough_lock(iocb, iter, &exclusive);
 	ret = backing_file_write_iter(backing_file, iter, iocb, iocb->ki_flags,
 				      &ctx);
-	fuse_dio_unlock(iocb, exclusive);
+	fuse_passthrough_unlock(iocb, exclusive);
 
 	return ret;
 }
-- 
2.51.0

