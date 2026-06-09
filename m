Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731C0343D85
	for <fuse-devel@lists.linux.dev>; Tue,  9 Jun 2026 21:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781041039; cv=none; b=hv+7yEOjDergTS4GaZ78KrRKQOdFxEmmj/iEn+cI3vbkrGO1SIfT3sWsfa5U+aB+PAF8XVmDEQd0f67hEeuc6lww07BiTY+yIU9aBcufk8Jac8CdwWZcLY1HrWXxJVD7w/BEussbOmU3Fx5/NUotiETVLpGhX1exh9/2ZBLuxC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781041039; c=relaxed/simple;
	bh=OiJQ4YTpdVihAaxQ2tru+SEaP7d4NxUzh9+NIJjvxmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EpXmunDahpDoSOjUYl4SHRqFuTSu4v3mV5MlRhh0Mtv3d8OCV/bdRNxjjmWyXvRQ1xmFniS//boh5dvBvbzo5oeKE5f+u11e6AjQYzxAsOuzUsNCDbsM8bZbRCDbMnKWYn0odpBfifMLutiuSvkLOkFz2DisInIuKj8w6KqfFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ghmwxx3Z; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ghmwxx3Z"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36bcf3d2565so4294888a91.3
        for <fuse-devel@lists.linux.dev>; Tue, 09 Jun 2026 14:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781041036; x=1781645836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g/d6AWHJfnPs07a6Dbxbqhw92UJsliGSMLCIPRaYN0E=;
        b=Ghmwxx3Zw/NImF5uTJz4zUQ3pTTpK8TXbo79zc1N758nZUvuy+cHVyhgkDfFVKuRPy
         oIrL/tzoa1XJnL/+SuuN+xQnsNue+Kn6tjct6/Qashj9nndfvUP/sRqTadBatUekPlYC
         lsqQyaHg13scNzY30RUhAz0XZLwV0VSH4HssAUol2fiha4PkS/zVJsYgrIXFOVFyjXX7
         kvxcG56wlHY3DArzgsQfQfRvgAOwKijs2kRYE+LTNIMeo/GA+teDvveMpIw+R5n/eP5h
         djDReoRLEcir3n/SRrq6RmlRCFSe7sz8gsPkuXAfe0y959SkGMzL7f1TwT4RLZDipYlf
         vO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041036; x=1781645836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/d6AWHJfnPs07a6Dbxbqhw92UJsliGSMLCIPRaYN0E=;
        b=kCFR60C6gxo0cNpzPHSvUWoJS+doQZFTVMzyv6v/zMduxOSCUygnD+jMfV1d/YTBbU
         RNVBs8zy4U3OyLjXszHNJCq/frsz/9/XLZbqOZalZJ9ot1j+AfeIQMJNLzGWTub+QiTl
         4iO7mRgYSKkVTpbjKrKqzF9umbo9LbOVNyC4ufdBe4tMXMoH7YmgV68zCKMQGeERTDUr
         9oWzCquiMfwtamVY5PL7RRJh5nfYXPOJ1oZaW4O8ofnbtqVJMrg8Whs7fO/20CLMA6MJ
         WXuQU7sYd/TWoZql7OZ8WpiBZogvXsBocUqrImosnkGODxb8tQTxUuoZe6NXQw3z7cWk
         wfuw==
X-Gm-Message-State: AOJu0Yx9W7VjIRLR/fgy48VXhPrzyO3oEKlLNSqAEqJLx6jUex3cRbFn
	eUZAwKW9JQ/ZFyGCoUy65csNRM9gj15XQkFwJOgUell6Z5Ge+r8SU2sb
X-Gm-Gg: Acq92OGDZE/qH8Zml+nL9LE/v7dqzypLqtBY0swzWrOx01uxiHbSyBCHEnf/Pw1/EXF
	mlyXdqzZA58TdzSM2O++PL68E4f4UEhAvqPWjg00VJtkKql/DWv7pE02lqL7SqMEp0prPJcGv1I
	qPp+4JmhpnzbjRNokd7MrWZ+wpLAMkty2xlx9Yf5f5M6ir2c2WO5eRK2axYQVanjcVqkhnpXVcB
	55OReU+YFWllmPXmM886r8iH2osScmMxtc3qF4Ha920MkNe97DlbKOtyZTxLKcC5Ge4nKKHFCN6
	a4XvKkU604wSDa/oOUNwzS3pUWUo5wWYoYKb+O/S9hUz6Xh98I8exv+FV6SqvOGlUvDG9WaBgHq
	ACzVTWxmibb8LxtFGy/RmDvyz5JPBYBTsETNkXCqgvGj0xcm9aQmJcULMQQZ9c6ZA+qjtR9khCO
	ul91eJwMIADbj9W6utqkbsGB+AmXxG/JvC5EE37lGv+Y9I9jooWa6owljtPQzAiSEcHP34/YTIq
	flBHRiuNW3E
X-Received: by 2002:a17:90a:d606:b0:36d:ee3b:fcae with SMTP id 98e67ed59e1d1-370ee447899mr22047577a91.6.1781041036428;
        Tue, 09 Jun 2026 14:37:16 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:7::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221cc3dsm22322107b3a.1.2026.06.09.14.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 14:37:15 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	bernd@bsbernd.com,
	stable@kernel.org
Subject: [PATCH v1] fuse: remove request-less entries from ent_w_req_queue to fix NULL deref
Date: Tue,  9 Jun 2026 14:36:58 -0700
Message-ID: <20260609213658.3679900-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a copy into the userspace ring buffer fails, a request will be
terminated and fuse_uring_req_end() will set ent->fuse_req to NULL but
it will leave the entry on ent_w_req_queue in FRRS_FUSE_REQ state. This
can lead to a NULL deref if the request expiration logic scans
ent_w_req_queue in the window before the entry is moved off it.

Fix this by taking the entry off ent_w_req_queue and changing its state
from FRRS_FUSE_REQ to FRRS_INVALID before terminating the request.

Fixes: 4fea593e625c ("fuse: optimize over-io-uring request expiration check")
Cc: stable@kernel.org
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index f74ca57f81ec..3a784f182883 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -708,10 +708,20 @@ static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
 	int err;
 
 	err = fuse_uring_copy_to_ring(ent, req);
-	if (!err)
+	if (!err) {
 		set_bit(FR_SENT, &req->flags);
-	else
+	} else {
+		/*
+		 * Copying the request failed. Remove the entry from the
+		 * ent_w_req_queue list and terminate the request
+		 */
+		spin_lock(&ent->queue->lock);
+		list_del_init(&ent->list);
+		ent->state = FRRS_INVALID;
+		spin_unlock(&ent->queue->lock);
+
 		fuse_uring_req_end(ent, req, err);
+	}
 
 	return err;
 }
-- 
2.52.0

