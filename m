Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF47139B4BB
	for <fuse-devel@lists.linux.dev>; Tue,  7 Jul 2026 22:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461925; cv=none; b=Sa9Ei3a01PC0DeB5e1jGY3vkCNah5vu6HRtnSyir/yDfAjxYTrrloBkdEeMhg8FDTSfPrHBdvvFC5SdHqSCpwjHEXTFZg1b9jBiIDmJ33ChaTs51R0HEdE1QRuP5IG1fJVMbuYeDYA8va7ThQthGcPbJ0wsx8l+DPVTtAVfaSQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461925; c=relaxed/simple;
	bh=GBujbVPEZZVAXqyMmKyk7DmWYD54fxkCTBG8i9B3nLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxWEdZ0cQLRmi9FBnh9ufPY1j8IkM+MJ3DG4xlnc+3xYLX6AOGZOWhi4uJC1jNGjG50DKxq6ZoTDLPVz/S6GSuLYnLgMRgSWDoQ3nN3Xxp2PuNNLvUkmOqVKmTSBVrbfnA//Y3HUFhMxiyanEWPE9imXSlWHvLKL9YFWv0f+pgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aM02I19l; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aM02I19l"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e9ecd7216cso31793a34.3
        for <fuse-devel@lists.linux.dev>; Tue, 07 Jul 2026 15:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783461923; x=1784066723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXHfyIqqoCUhxJYSOeiM8oC7bsZMutyw8cAv10lODWA=;
        b=aM02I19lm6j6A2qNCCAkO7MUiNkZ8R2OeAUTvhG1d0OqJA/Ced67c6qM9Y2fXwOZLi
         TCm/O/IBtfflee1SbIoKS7rvr4BU3Q+Kt8cbsMefrHG5rl1LukRgyZrUh4rQ/OaVdCTl
         S40lsWOoBCd+6khfjAxMay/6svScF4TbQafqDmbpKQpCNHXb397BP7qwaoXRdBvdh2Pw
         /iVGpfV1Nia4BxfqaJeXef/BwUej7zj8m5IEA4/5sKDkeP9k6ing4LJkZJfz0Sa1Al2Y
         UUEPXd2nLSN/L4KZ7EzqpVWW89o2Dhx8kmYMrbGEmlpU3ZCuB4ga5sQsrw+ikgwfB89I
         zvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783461923; x=1784066723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXHfyIqqoCUhxJYSOeiM8oC7bsZMutyw8cAv10lODWA=;
        b=MDRWSIfvbi15Z2mtSl1hh1hal/BbG2zig7qNIh5P8qega4dP1oEpurQ+YCN8d9Gzqt
         bqz7l5rtz3qsoFOs853QKbn6yROyq39OCGmPPLZpmONHm7ZMHeaGSk8L1YQiXrSI7DG0
         pqPkWjtzLEvulav7YQSh7Xydh2E93VNeBxSZ+Vg/MySmeVvg+mIRK8d9tmVAj/LkmNIb
         9yRY6LHZQWrY2+C3EwgbqjMp32LNchWe7D3IqKnWRtvbiMpp3jQGe/X/UArDnxnuhAeO
         b1UmN9c7LC3gTQj8M28kx7hpV7CoZXDl/wx4YR48m71ke/SbtMEBHr/MtFhjVaN7PKNd
         n+EQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AwOw59HsRSbqJxYVuGbnyEHgbIumHQGEQ7fBg3tbBS7GawDxarVEnZYZetxi5sfmfy/jX4bFWS3y4@lists.linux.dev
X-Gm-Message-State: AOJu0YzPoazSlise6P9+Ij2b1muLDx5U0515BZn7vXlh9nze7rIOs0cw
	QOfwh4CNg32FPcpwVsirs8CkH1vZLmov2r9AJFmVFVXAIfZqOGIJtH5PXIHp1g==
X-Gm-Gg: AfdE7cmhCpoiCywtJtocg8j7jRlCxWmvm8Tdvum0NFP87W0+5rLnPzELoYDu9xk8ySF
	17rdQe8UrN7szD4K1bgOYog4ouc6WfRz+ofnA9V6/4z1EdpajXFsIYePdfaYeJU0IPV7eiXbfle
	wWfCHAy7imuIJONGZrc8zEgZbm6g9+D2mWy8TnX7BqVGgNkMqNOuDnfH3HqtV4WxLvP9bSxwpUU
	qi382dBQGR0Oz1rkB3A//GG6LVRSV/HWNn03gk3DPy4vhr2r5PVEyciXs6xTBTl3LXjp1crFBzx
	AYPPLTee8qnA0nmCf3mE7BCB4hNTaUImot78Uy43X0yUs4K98V9pg1KSQScme1y+m5/UqPxu1Xr
	eNwJ2HnXPErdLEa/yROMMAqfvPhoGkBlGlthAuT8CjCr4RjJ1OcFc41Az9yAnjoj11xVmjqXz1D
	etebS1Eg4WQynB+G+zwF7p/UvG7XKBwd0hlafrd2PzltLgAOEAs8atS/DF7/kXOrl8
X-Received: by 2002:a05:6820:1517:b0:6a1:50eb:211f with SMTP id 006d021491bc7-6a3556c65f1mr4916216eaf.67.1783461922784;
        Tue, 07 Jul 2026 15:05:22 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:41::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a83eb2dsm468220eaf.10.2026.07.07.15.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:05:21 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org
Cc: djwong@kernel.org,
	hch@lst.de,
	miklos@szeredi.hu,
	willy@infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: [PATCH v3 3/3] fuse: use iomap helper to mark folio uptodate
Date: Tue,  7 Jul 2026 15:04:50 -0700
Message-ID: <20260707220450.1200943-4-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260707220450.1200943-1-joannelkoong@gmail.com>
References: <20260707220450.1200943-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When fuse enables large folios, a large folio will be backed by
iomap_folio_state that keeps track of uptodate and dirty state in an
internal bitmap.

Fuse writethrough and notify store paths currently set folio uptodate
state with folio_mark_uptodate(), which touches only the folio-level
flag, but on an iomap-backed folio, that leaves the uptodate bitmap out
of sync.

Use the iomap_folio_mark_uptodate() helper to update both the folio
uptodate state and the iomap uptodate bitmap.

Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/file.c   | 2 +-
 fs/fuse/notify.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index a72959dbcf12..ea4a15a7635a 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1319,7 +1319,7 @@ static ssize_t fuse_fill_write_pages(struct fuse_io_args *ia,
 
 		/* If we copied full folio, mark it uptodate */
 		if (tmp == folio_size(folio))
-			folio_mark_uptodate(folio);
+			iomap_folio_mark_uptodate(folio);
 
 		if (folio_test_uptodate(folio)) {
 			folio_unlock(folio);
diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
index 29578104ae6c..1ba763705d91 100644
--- a/fs/fuse/notify.c
+++ b/fs/fuse/notify.c
@@ -2,6 +2,8 @@
 
 #include "dev.h"
 #include "fuse_i.h"
+
+#include <linux/iomap.h>
 #include <linux/pagemap.h>
 
 static int fuse_notify_poll(struct fuse_conn *fc, unsigned int size,
@@ -192,7 +194,7 @@ static int fuse_notify_store(struct fuse_conn *fc, unsigned int size,
 		if (!folio_test_uptodate(folio) && !err && folio_offset == 0 &&
 		    (nr_bytes == folio_size(folio) || file_size == end)) {
 			folio_zero_segment(folio, nr_bytes, folio_size(folio));
-			folio_mark_uptodate(folio);
+			iomap_folio_mark_uptodate(folio);
 		}
 		folio_unlock(folio);
 		folio_put(folio);
-- 
2.52.0

