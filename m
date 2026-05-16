Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4B328002B
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 02:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778897540; cv=none; b=PpLJsDINJWO+c8gaEA2ZihZG1+uX2MgG6IhfGYushDSGRHeVUFpnPZjAL2fHVGu3yN/c45M3D7roYm3SM+SItQBoKlySuQQrarWRaodlsHdiP/bBFPiZeIWSS4asHsPVVFnw12B4fAoNIde6PFfWtxxfgnCLq57RDc/pvp9vbxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778897540; c=relaxed/simple;
	bh=PZZ5JKgNH61Es/Hc2IRamrNK8+oEWn8kHVx+p0S3BKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mC4ALYjPxYgOX/of0lHW3kKuiBlzNEzAhDiZzIpOuQV/RHUQJn2emBiMHJzQ/1J1FRGcnDY1Hez6ot0U92gyrJ2Cn+/grUTJlaGZ58q2uCWwAxIsWsCM7crz/PV1eyhZjSPa0Al4QJy7CGo7tgrqHZgiyijrBOc2aps+rrdTDvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPfPBYqu; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPfPBYqu"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6563f83ae9fso869035d50.1
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 19:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778897538; x=1779502338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KUUBm1V70Sx0Jeo8Tf25oXT82rFdyb+xfI/2ldjeDs=;
        b=mPfPBYquEWD2uZjQ1os5h7Sm6cZmXVSQz5xA1uvwVPgBLw7P+o7sE1x80diTlJ763T
         spDFQt5774DJcXOjoCtsgBUjxU0lgzhZjcnl/9WYZb4KJpRPRWEfYNyGxgCiduGAkOXB
         D6mkLHAMKq1+V/aoljly62zUq9d3tT+XvfugT68aKKFZ0hGypp3WOSvOXQ6WfTwAWqFn
         q08/Pw6nKsFQvn6iW7bH67g+9y8kMO9v/RpBogRqV4xLqKdwFgYuPZRFPBrbEacGmapE
         fwAYHYEEalTO6gws4EVpQvfOVnDGnWiFZDhBhhCMJoLKkeAYrcawCrdGYs1RWpUdJBQi
         zSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778897538; x=1779502338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0KUUBm1V70Sx0Jeo8Tf25oXT82rFdyb+xfI/2ldjeDs=;
        b=lhFQVTj62eThIFIt1TDUz3G4cZbwlxzN5+gKLXaofGRwNV4B7KwLbklZTga2HiVxOA
         lO8QwIXyLO1h92/8+flYE6QLRWBRFggU6Bg/D2ZWbREvJQQ7yQ3BGcFwc3NkNwzmuds5
         pbKsyKeMaNKC4fy8UZnnKcDUpj2p/MsQuzftfuyru/OX2Fa+AZ3rwca9qT4Lo7pRUDWM
         EqhdcZg9Vr8DpMo2czDc0cZ5ObSECG3w555cXBHFJmIJ9Vjy7NU3BtbyWeEJqJmfQyVr
         7bhUuq/FmiSKoMPQ2y1MHc/MAEgW94atJaDcsL79AueK9q+KO14jZtkxMh/jgnlYhRz2
         rJig==
X-Gm-Message-State: AOJu0Yy66htbdhvrCZkUdhSktaf7NaXjH4O0CBIxExDSvr5zEzMR6yJc
	nJxY4qhh+3naIBESneLtWFHpAP3emxJ+DA7MyUvL/2/pMBpqUl169yvvSA+OrYjA
X-Gm-Gg: Acq92OFDb55bk/AE2ljis32qnrkFSjdE3B4JwzTsYzUacq36bJOc8bDx/wdnzvlh2f6
	8GSICHET+rhnyI1D0NFgKvpVMFPKzhwWFhgz3Nw0Brw1QlInRCcA8rqVU5UfwZdh7j7VL6vRqyo
	VD68LE3OSpzE60ZD5FKFWVo60QvDoI3cBkXPH6FEQlXOQ36kqX/6eXfCdr0yoNaThNlhNPyolK+
	0qqY/TVx+N7EwV/EfUWEkbFCKvYcR/S5xXwF2PyRqBsnRhFEGdq2v3/qYhUSzkgmNChzyrkq9xX
	e5+vfhK4OmZvg9GMBOUnBbafm2V4OHrgTOr26CK+ccX7/1W7Z4CUL+0HiAHBeqB7QKCf/cFNTrw
	G7eQ3jjS1OteHHzaRUBQTOG6TnSVtrQD2gxJhqCagy80v/Rj5znMx1t/BOdrocDqiiD+Z+m1+uc
	U62FCFOHA0lUEmLb2yK8M=
X-Received: by 2002:a05:690e:4296:20b0:65c:2360:dfc8 with SMTP id 956f58d0204a3-65e2276a006mr5975576d50.19.1778897537854;
        Fri, 15 May 2026 19:12:17 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:7::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0d8e701fsm3371532d50.8.2026.05.15.19.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 19:12:17 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	bernd@bsbernd.com,
	ali@ddn.com,
	horst@birthelmer.de
Subject: [PATCH v2 2/3] fuse: check connection abort during ring creation
Date: Fri, 15 May 2026 19:11:37 -0700
Message-ID: <20260516021138.2759874-3-joannelkoong@gmail.com>
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

Check fch->connected under fch->lock in fuse_uring_create() before
attaching a new ring. Without this, a race between fuse_uring_create()
and fuse_chan_abort() can result in the ring, queue, and fpq.processing
table being created after fuse_uring_abort() has already run, leading
to unnecessary allocation and teardown. These are eventually cleaned up
by fuse_uring_destruct() but will linger until the process exits, even
with the connection aborted.

Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 99ebb7c9cc61..d9108b5b5db8 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -244,6 +244,10 @@ static struct fuse_ring *fuse_uring_create(struct fuse_chan *fch)
 	max_payload_size = max(max_payload_size, fch->max_pages * PAGE_SIZE);
 
 	spin_lock(&fch->lock);
+	if (!fch->connected) {
+		spin_unlock(&fch->lock);
+		goto out_err;
+	}
 	if (fch->ring) {
 		/* race, another thread created the ring in the meantime */
 		spin_unlock(&fch->lock);
-- 
2.52.0

