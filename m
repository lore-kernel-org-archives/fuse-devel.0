Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04EB39A7F5
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331063; cv=none; b=T1+qUL3nxaKIpc2iCDMFtS8FqIYaSGqkyvw/5vaP2FJxkxLcsaZ3vTmYwPGsol1D9RxkI7g/RFYQYAqfmNt6YngrFQ4vrirMzDI8Rq+CJ7XuPjMAeH/+st0lKifB9dRgTLJ2WgzPaLcqUdQ4MDjVIQRS6IaVLQFLZXXEx+aPBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331063; c=relaxed/simple;
	bh=HVSJxOtwKFYvRwjnDlO+jnkg+JmABr9oU+j8w/idV7Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=IwTniC8lpmKPN5PLX15gA9hjWp4+pamfchn/HVtJukt7L2jGV4g8Ka72jRhLdLDF23RRS/hi4oaXJNgY/dexpEqAmoVWSHkNMmnf8fe2GOd8V04tM1TUNbr6RmNm7nrLkn1UQHvQOBMic/Jgzd7wxVwYSudv9Q+IP7AkkBUetIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OOfDPYBW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OOfDPYBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p4dfb7ebiQqTklkwuTWUNTQNMxpyNspY9sJYDq8fi3Q=;
	b=OOfDPYBWFQMVh+oKATZk0/cuHkiCdVQjVaVb7UG8YQ6lsZilAqA+tjWdfgEKNWDfCiyEn7
	GnNYzGU8WBXEy+UhvRGPvoWNsTr1ieWTQheAZwoLWnhsqTeaWDkHhjtCm3+xwSiFnTEeuu
	Tzd6u9BRWNIFF0LwdbZ/hkMrWAp2P+E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-Kp7ev2p5Nym-7IisCOTakQ-1; Thu, 16 Apr 2026 05:17:27 -0400
X-MC-Unique: Kp7ev2p5Nym-7IisCOTakQ-1
X-Mimecast-MFC-AGG-ID: Kp7ev2p5Nym-7IisCOTakQ_1776331047
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488d8deb75fso43415855e9.3
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331046; x=1776935846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p4dfb7ebiQqTklkwuTWUNTQNMxpyNspY9sJYDq8fi3Q=;
        b=QGqpPhO5g0z5KbpE7ZJwGwt266yqtIfKr9e9x4e0dxMa0PaLM/oNnW8fB9FPj8gsqX
         1bJEMpYhcaPuPo4/gk/NtAaKDF3sIbjUr4mnpKcdvwnyO9qpIuAS+ueYEwq7h9Ze8hr3
         0d+7yPzTPvUJyOs/458swAcSVG1Ry91TxmHyINlWzRJAVjWrjrBykIjKu+ahvhoc4Mq8
         XlSoi++CZBDjE4dw/an5IQ7H5v2wKvttIGdfPxRvaPnP4sRaEZ0xuzKIERPps4bp7B6i
         yp1aSpSeyc2SijknRrYR0qefymm9W/GqKbU8CYQMPr2vExI1uXIkchq0NjFSZPXk3p0g
         Xn5g==
X-Gm-Message-State: AOJu0YwnHd5n3B0l8uwGZ2TsJB81Q6ODLXqjpux78PAPonNJDw7aazc6
	9+levjA1AlKuD04RouohkgGhV3URGDu1iMtBccS1qawVNpoG1VqMg3Ukw2PN9sMuwqawEhexdcf
	2+QFzT0UAqjyIsOQhU/samYs4WsIcDZqW6m2B4S5tsPNGJB07zN8X7BDok12jU2xXnGczu2Qzf0
	wmVGLoMjYWqi08qnfDHQCH1zbjTKXUoDLutirTctYJnlKAIaM=
X-Gm-Gg: AeBDieuun7v0ZJk7b9bUXHAtlJwtnTvjKCOtDK37G2/tbW6qrcQJYi2rSPDmOd0hVSx
	yDS3etsDSZN7B2ZI5SOoflHoxFv0j0A6sa37Z2w737Z9zKFsfMV1Oh9VTyh8XXmFd+6B0KRqPqy
	SK6jGY7MHhqVR4AANtFUOZhScZPBwUjpn9EXd+kDEA+EN5hPd/rw6yyTDEd/4Yytvq3Up586rMj
	Gk+XJqy8/Z2/UUuOnK86s7l7cZZ7o1O44e9v8wSMd+NgrT6DVeXAbEW2QVfheYOCK/qpw6/yEdJ
	0SW8cQMJBpOZ5PXjYtrFMl+yuVC77kxusXPTc+6VIXnSsYlN7hWFChcxKQupzn1jYpgrChipfVm
	IVDLd3AdfQbyrBl/JmJGoti9jxqnjJ/tV7epRTvFNOaxx+QGFOfQ0TldiShgEbdCDuvVb+sjaXA
	UjQwHUWA==
X-Received: by 2002:a05:600c:c0dc:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-488d68105d2mr242801675e9.11.1776331046328;
        Thu, 16 Apr 2026 02:17:26 -0700 (PDT)
X-Received: by 2002:a05:600c:c0dc:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-488d68105d2mr242801285e9.11.1776331045739;
        Thu, 16 Apr 2026 02:17:25 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:24 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 17/32] fuse: remove #include "fuse_i.h" from "dev_uring_i.h"
Date: Thu, 16 Apr 2026 11:16:41 +0200
Message-ID: <20260416091658.462783-18-mszeredi@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416091658.462783-1-mszeredi@redhat.com>
References: <20260416091658.462783-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EsYmnFbcu4XixQ1ZxnUjsD_6HFrtl5TfrzIJxa5-pVo_1776331047
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Start getting rid of fs layer stuff from transport layer files.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.c         |  8 ++++----
 fs/fuse/dev_uring_i.h | 19 +++++++++----------
 fs/fuse/fuse_dev_i.h  |  4 ++++
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 8096c861e853..fadad23e8369 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -82,7 +82,7 @@ void fuse_chan_set_initialized(struct fuse_chan *fch)
 static bool fuse_block_alloc(struct fuse_conn *fc, bool for_background)
 {
 	return !fc->chan->initialized || (for_background && fc->chan->blocked) ||
-	       (fc->chan->io_uring && fc->chan->connected && !fuse_uring_ready(fc));
+	       (fc->chan->io_uring && fc->chan->connected && !fuse_uring_ready(fc->chan));
 }
 
 static void fuse_drop_waiting(struct fuse_conn *fc)
@@ -876,7 +876,7 @@ static int fuse_request_queue_background(struct fuse_req *req)
 	__set_bit(FR_ISREPLY, &req->flags);
 
 #ifdef CONFIG_FUSE_IO_URING
-	if (fuse_uring_ready(fc))
+	if (fuse_uring_ready(fc->chan))
 		return fuse_request_queue_background_uring(fc, req);
 #endif
 
@@ -2660,7 +2660,7 @@ void fuse_abort_conn(struct fuse_conn *fc)
 		 * fc->chan->lock must not be taken to avoid conflicts with io-uring
 		 * locks
 		 */
-		fuse_uring_abort(fc);
+		fuse_uring_abort(fc->chan);
 	} else {
 		spin_unlock(&fc->chan->lock);
 	}
@@ -2673,7 +2673,7 @@ void fuse_wait_aborted(struct fuse_conn *fc)
 	smp_mb();
 	wait_event(fc->chan->blocked_waitq, fuse_chan_num_waiting(fc->chan) == 0);
 
-	fuse_uring_wait_stopped_queues(fc);
+	fuse_uring_wait_stopped_queues(fc->chan);
 }
 
 int fuse_dev_release(struct inode *inode, struct file *file)
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index d14299eff1dd..741fdead2161 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -7,7 +7,6 @@
 #ifndef _FS_FUSE_DEV_URING_I_H
 #define _FS_FUSE_DEV_URING_I_H
 
-#include "fuse_i.h"
 #include "fuse_dev_i.h"
 
 #ifdef CONFIG_FUSE_IO_URING
@@ -144,9 +143,9 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req);
 bool fuse_uring_remove_pending_req(struct fuse_req *req);
 bool fuse_uring_request_expired(struct fuse_chan *fch);
 
-static inline void fuse_uring_abort(struct fuse_conn *fc)
+static inline void fuse_uring_abort(struct fuse_chan *fch)
 {
-	struct fuse_ring *ring = fc->chan->ring;
+	struct fuse_ring *ring = fch->ring;
 
 	if (ring == NULL)
 		return;
@@ -157,31 +156,31 @@ static inline void fuse_uring_abort(struct fuse_conn *fc)
 	}
 }
 
-static inline void fuse_uring_wait_stopped_queues(struct fuse_conn *fc)
+static inline void fuse_uring_wait_stopped_queues(struct fuse_chan *fch)
 {
-	struct fuse_ring *ring = fc->chan->ring;
+	struct fuse_ring *ring = fch->ring;
 
 	if (ring)
 		wait_event(ring->stop_waitq,
 			   atomic_read(&ring->queue_refs) == 0);
 }
 
-static inline bool fuse_uring_ready(struct fuse_conn *fc)
+static inline bool fuse_uring_ready(struct fuse_chan *fch)
 {
-	return fc->chan->ring && fc->chan->ring->ready;
+	return fch->ring && fch->ring->ready;
 }
 
 #else /* CONFIG_FUSE_IO_URING */
 
-static inline void fuse_uring_abort(struct fuse_conn *fc)
+static inline void fuse_uring_abort(struct fuse_chan *fch)
 {
 }
 
-static inline void fuse_uring_wait_stopped_queues(struct fuse_conn *fc)
+static inline void fuse_uring_wait_stopped_queues(struct fuse_chan *fch)
 {
 }
 
-static inline bool fuse_uring_ready(struct fuse_conn *fc)
+static inline bool fuse_uring_ready(struct fuse_chan *fch)
 {
 	return false;
 }
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 2e1c251572ca..fd1ccc8df60d 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -8,6 +8,10 @@
 
 #include <linux/fuse.h>
 #include <linux/types.h>
+#include <linux/refcount.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+#include <linux/fs.h>
 
 /* Ordinary requests have even IDs, while interrupts IDs are odd */
 #define FUSE_INT_REQ_BIT (1ULL << 0)
-- 
2.53.0

