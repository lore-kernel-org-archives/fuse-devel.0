Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CD73D9DB4
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 04:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778821019; cv=none; b=cuJLn1rHhtgeO3SEbfCCCIrC6XgkVOUcuYLoyZUhXoR5BgogfzBtTHK+zyYWABKp2+AYremmM2mTkx5gQROUsFHIQq2Si5EO6tPFxupTSl8GEqui3+pClNwHAKHoV6RzlX7/T+tHkqQ5DiHSAvIhPuMxM1V1DQ2OKkvSR94OhRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778821019; c=relaxed/simple;
	bh=OFdEVbdpC3AebCbnGGYLJCYlvH+UTf19g3GUYE3pbXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9g9gBPc06Vl5ZbL2uRnUQmOzQ+ye4/tir9+YU1QTD9G8HguEuxcKrOxo/lx4AE91jqQEfrc7T+9o/nOoG3Lvt6Oox9AeYpgUMg2N+jIQqEYZYrxIBSHKyrsClEuvVC5KEuIQK3cHeEZ4nufczInqLhj95fxiTz3Y8n8BdWV4QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYWHR+HN; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYWHR+HN"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c21049dafso9998276d50.2
        for <fuse-devel@lists.linux.dev>; Thu, 14 May 2026 21:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778821017; x=1779425817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lsLoK3AxyGdMTmEXeQJhC+bemG3+7BtONdzPTpcmFQ=;
        b=RYWHR+HNJrAcdZ1jL4+d7ZcpaQ7zFZBUqTskaD7FOFJv9mW71m1e8V4EEnn8YABKO8
         9AgSrP6ofknEgebAYAKT1BeubUgVeGjQqgLmtx3w7SBaLGpHqql0Eu8+XiDmWb2UMxQr
         FrrZd2pewh8DWxSPhHkhVtzPCyNQzvsTnR2nuoXbk0UXXLHD/2o89gxubtSJB0/HfOlN
         VQvyXNhhoXjMNeotegrhHwBZzKL52WV96CtUczPHmFUvgYEqFrU8eGM00Ijm2dNEih2s
         DDO+iqEavxnRJtXTmqz8HmkkTO9uQLl4vLHHnIQuj62sCaWsLhkT1CXGjx8GuC/EXQqb
         H3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778821017; x=1779425817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lsLoK3AxyGdMTmEXeQJhC+bemG3+7BtONdzPTpcmFQ=;
        b=eZ+PQR/9MeeZwQQ0NMQRra7XFfekecXFsO0EQHd/3y9hvrXkZfJIVxcZRi5BFS2hwi
         JVHy+zOOuTkrBFUGwlO0EIN0o7tvh22xaKXeETOVL0UNmuSFDSa/szUkTN/iv24RjGmx
         qTD3EUHd+64YbBAe1lTWAaeTISj86hnRrY/RRUayMm5lAWPFBrY0OYzj0eS3h90LG9dA
         /VB8CvmMTuVm3NE7/K5r7Hb3JAMIBesyEbHvja9O43I0m51NwQI/dYBhEjjO3diQuo1n
         vIWpRfD0KnU691SBm/OrvTmNGLDH+YL0ifAAjCu6B2Noiv0xsdPbqB+oxq1cajxcYPfj
         DogA==
X-Gm-Message-State: AOJu0Yyp5Du8kmYsyi4pgcnttnwdUwtdCwV+MYlgz0f1JgLLG3DwEjZg
	lnNvIrINt40J0jP3GcvbGgcMMaUBGUtA9ltNDLRL4mnDUOanL8PgrBxd
X-Gm-Gg: Acq92OHEB+QFmaAgFTqfVOi4+Bb8vT8dBFm2CN1NhY/p3vD0LQjLHf3W/sDO577UrCI
	5a2kqBHjvKSmaIq35383K0qlmBUn44Zj2zja/yg3XiXZu5bgR0A7x6xaIBmwPlMSJO4RrP5/K1t
	1kWhBRcdBM0Y1+cZUwWazH6hcIw61FvyJylgYX5gpHTvk56invx6We7Qq3I7LWYvrsbrbNJifb4
	81uIe4rcmlL4mW3PQbcERrpvJj81fHn3ZHqm86j41mD+n1KRUWYqfxIctrfKjTu6pcdDL8CUo0U
	jfi+s56vDrYakJStcb+8H5iXC4eLUqeIoSvSiTAezJEURzx1fCwiT3S80PdhxfYOD0prQlvENf4
	9hPKDFC0Bh9XvgelHHhMwuIsW9kJ+hcF4M73IXloh7usqUeXjaeGpJojEDvmQmgo4K4cmVFx7xq
	hNHRhEoVcoVeMG7x/CEZcgAxpWfw1oh9M=
X-Received: by 2002:a05:690c:4992:b0:7c8:615c:7b55 with SMTP id 00721157ae682-7c95b72f113mr24415277b3.23.1778821016708;
        Thu, 14 May 2026 21:56:56 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:3b::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f22d0851sm24765667b3.1.2026.05.14.21.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 21:56:55 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	bernd@bsbernd.com,
	ali@ddn.com,
	horst@birthelmer.de,
	stable@vger.kernel.org
Subject: [PATCH v1 1/3] fuse: fix race between ring creation and connection abortion
Date: Thu, 14 May 2026 21:55:39 -0700
Message-ID: <20260515045541.1171335-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260515045541.1171335-1-joannelkoong@gmail.com>
References: <20260515045541.1171335-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes this race:
- thread a: fuse_uring_cmd() gets called, passes fch->connected check
  (connection abortion not yet triggered)
- thread b: abort is called, calls fuse_uring_abort(),
fuse_uring_abort() is a no-op since ring == NULL right now
- thread a: creates ring, creates queue, creates entry

which results in
- leaked ring, queue, ent
- if thread a increments queue_refs before thread b calls
  fuse_chan_wait_aborted(), then fuse_chan_wait_aborted() calls
  "wait_event(ring->stop_waitq, atomic_read(&ring->queue_refs) == 0);"
  which will hang the abort/unmount thread indefinitely in unkillable
  state, as nothing will decrement queue_refs or wake stop_waitq.

Fix this by checking fch->connected under fch->lock in
fuse_uring_create() before publishing the ring via
smp_store_release(&fch->ring, ring) under the same lock scope.

Fixes: 24fe962c86f5 ("fuse: {io-uring} Handle SQEs - register commands")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev_uring.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e467b23e6895..cd75f61018ec 100644
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

