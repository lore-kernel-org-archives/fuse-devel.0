Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712A01A3154
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 02:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778897543; cv=none; b=P9TvP91ARv91dknsEpy+v+r2jl3kkMANTzfi4sB5PZSlzgnCw0T4phTJJVebbPDElFNg81nAESN10OVlo6Kd0NT0whLQf4JRgbiMFVefPO7+95SloUXiiQEdNBV64KLqtBzXv/K0NwV6HnkzQQJANpeTSTXWcD/eiOd/G0KwPQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778897543; c=relaxed/simple;
	bh=6rDfVuGVwaViFTnt51KivUesECctwWwNG4HfJaZ79Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oo4QbL7/1fiFaitrJ5IfKYd795dP+socwor7ScCWPWqekmtsY3dql6whlfgbLZcgoXCcsyPem/WYr9DHwWpI1Dks7hBKlpetbi6YU5eLRzpUwaG91d6VhzpOEWNEsLtbfAnpfJyI7lPt+MFHx+7hznoOAnxkPexdpNEw6O/fc7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpaFIv4M; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpaFIv4M"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7c23248f3a3so865457b3.1
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 19:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778897541; x=1779502341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYNddEeOwGt0k46UY8z9L6gutGtCdNQjs1ntJnn2kyA=;
        b=TpaFIv4M9obXc7viMGIfGOX3gD8hZa8CNCA7UAXDegHUluyHPGPFKacpdNHE2ZAHCR
         Iv98ZJRme3eQT4tMbCTwsQF+7lWlEpYlbfY6SONjXIgoZXmjatjc/O+uO476ezbcdXWv
         0a8mxqTMfQMRlZcH8np1ZTwpwrJ6z9enqZ0LmDXnjCmbRNGDIWRUqMQ4oJz+UXnX4NQ0
         E/7aUaBDQe1zRaq9naujMowsbFmiiba4MCvwMxK+Zz+cjGsj1F0t3iWj+mXCyf62tP8Y
         UELYSbV/S2agloijS094JVgxmWneTf1muKsrEpz0L9mPy+n6SjQsWvDtXkWA4M6S/pcm
         /XdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778897541; x=1779502341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AYNddEeOwGt0k46UY8z9L6gutGtCdNQjs1ntJnn2kyA=;
        b=he2qgSTElGwwZO50JvrKqbECWWtxWbRgfZAqW2znCDRVwkOmwEnki1+ay97wwuY99f
         aBybNEW6CsaoxsYZ6EYI947YVkfGtG0TomvBFONCqtaWLiZEAjkFTIybrezl6Nt6/LWX
         0N0SmBs7nWVC4FeMRXp1nD/g2J2lTyPcpk8g9N6wRqrcIv7Os2+Gbcwh1xG1k+GAZ3Vi
         YL35jp7eSPQfMd1BU/fbGWQp+LhXZDlyMiJLbTUWmb4EtePUSW6zABgn99DtepEh64iu
         yGp+K82LTsAUnUvcvMp3oHRbWW+MgNkW6/05sLo7BXXRykxsR6Wr4eYV8hJcLM2IHyRh
         L2oQ==
X-Gm-Message-State: AOJu0Yz+3QmcJKn/19OtD1XZXUHmKIhFuEMv7anIlNXsfqaobibZSL69
	No4cDAbWl/qAzJhxila0h745BnwSxXmxxRb7VPbB6NZVF9QDB9ZW7ZnR
X-Gm-Gg: Acq92OETF9AbtaEjQaLkbcvZdclPosG6hFkTSlDwLdEM7FbNv3jiBZHvR5FWm9sOWPV
	ViZeoCJPjWD5bCGj+9tOHHphJnFZO5EeuP3R0lh02AAddbZQEVb8j/s3wY9gxZ/xpuD9cm0VZJt
	F0NMtuk3Msh6e65rjSSNWUE1epJvxOz912ng+yfjM4mB3UOLukXQpfeNAb/4Sg2aFsYZJ6UYDuI
	9waaAZNodmPCsbONZwTGJlKXb/mp4UYtzYI5vSzgqKHShgzCK6gqfUGwssfjBuIAimqL9NsTy18
	QVgTIg1luylGbxKjA3xNIh6/HQzx2V6ACSvFOKGURA5ZYqkjfBmpyMs0HGYYa2ja6nsF4RJlYfy
	vI9SlqCA6DiXwr6pp8ZkKuZlsMpo+Xt1GCyh1HvgGSrYPQnEmUDadRPQOmECxfWa7Xg75oBMvLN
	znvkWvN6AnxbbROSZ2gjxMUyGdhFwv3vE=
X-Received: by 2002:a05:690c:3705:b0:7c0:4f0:883d with SMTP id 00721157ae682-7c95d1d977cmr73877487b3.44.1778897541467;
        Fri, 15 May 2026 19:12:21 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:1b::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm37583987b3.14.2026.05.15.19.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 19:12:20 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	bernd@bsbernd.com,
	ali@ddn.com,
	horst@birthelmer.de,
	Heechan Kang <gganji11@naver.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/3] fuse: fix moving cancelled entry to ent_in_userspace list
Date: Fri, 15 May 2026 19:11:38 -0700
Message-ID: <20260516021138.2759874-4-joannelkoong@gmail.com>
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

fuse_uring_cancel() moves entries that are available (these have no reqs
attached) to the ent_in_userspace list. ent_list_request_expired()
checks the first entry on ent_in_userspace and dereferences
ent->fuse_req unconditionally, which will crash on a cancelled entry
that was moved to this list.

Fix this by freeing the entry and dropping queue_refs directly in
fuse_uring_cancel(). This is safe because cancel is the cancel handler
itself - after io_uring_cmd_done(), no more cancels will be dispatched
for this command, and teardown serializes with cancel via queue->lock.

Since cancel now decrements queue_refs, fuse_uring_abort() must no
longer gate fuse_uring_abort_end_requests() on queue_refs > 0, as
cancelled entries may have already dropped queue_refs while requests are
still queued. Remove the gate so abort always flushes requests and stops
queues.

Reported-by: Heechan Kang <gganji11@naver.com>
Tested-by: Heechan Kang <gganji11@naver.com>
Fixes: 4fea593e625c ("fuse: optimize over-io-uring request expiration check")
Cc: stable@vger.kernel.org
Co-developed-by: Jian Huang Li <ali@ddn.com>
Co-developed-by: Horst Birthelmer <horst@birthelmer.de>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c   | 6 ++++--
 fs/fuse/dev_uring_i.h | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index d9108b5b5db8..f4ba64a1796a 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -511,8 +511,7 @@ static void fuse_uring_cancel(struct io_uring_cmd *cmd,
 	queue = ent->queue;
 	spin_lock(&queue->lock);
 	if (ent->state == FRRS_AVAILABLE) {
-		ent->state = FRRS_USERSPACE;
-		list_move_tail(&ent->list, &queue->ent_in_userspace);
+		list_del_init(&ent->list);
 		need_cmd_done = true;
 		ent->cmd = NULL;
 	}
@@ -521,6 +520,9 @@ static void fuse_uring_cancel(struct io_uring_cmd *cmd,
 	if (need_cmd_done) {
 		/* no queue lock to avoid lock order issues */
 		io_uring_cmd_done(cmd, -ENOTCONN, issue_flags);
+		kfree(ent);
+		if (atomic_dec_and_test(&queue->ring->queue_refs))
+			wake_up_all(&queue->ring->stop_waitq);
 	}
 }
 
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index 368f4d0790eb..22ec67e39ee0 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -150,10 +150,10 @@ static inline void fuse_uring_abort(struct fuse_chan *fch)
 	if (ring == NULL)
 		return;
 
-	if (atomic_read(&ring->queue_refs) > 0) {
-		fuse_uring_abort_end_requests(ring);
+	fuse_uring_abort_end_requests(ring);
+
+	if (atomic_read(&ring->queue_refs) > 0)
 		fuse_uring_stop_queues(ring);
-	}
 }
 
 static inline void fuse_uring_wait_stopped_queues(struct fuse_chan *fch)
-- 
2.52.0

