Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923533;
	b=apm5UoXz4wbiMpZOmoVKVGrKDD89L68a96kaA9SUU7eiVsRLzwcVim84+ArAohwBv+FA
	 x04lAsufvgYngkUk1zO5BLWwORppoYTEW0WPq9eEI9HkAKvFYWiCRHyCWwUFo+JpF+d70
	 0RHtukvyJjPCSgp8kpkM81fCZTI/50efM0Cq+ZsxemTNxLYIdh1+Sy1LQ/Cai8NEsI5vx
	 9isLBxP0JWAj2GrptSc7qUMDdGAWlgQterjmVDCM2kMQUNSAybpf8qz5qKzCBe0eAo7o1
	 vACSaW6n8pmxmWDZfkQL87cYZSNEJd+qR+rA1n73dienMtZOj+BDFzGimKUmRTnRTOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X9eeST+DTiB0/P5zHssKOgXfvR+02Yq9ClIKmFNmHPk=;
	b=Gq5FhPoR0sGF9sDtjo8116VKBgVu2n6DUSpasKgFGuxxbGW9CRliKsHY2Y+zhHW7Fftf
	 yOlJlLl7L+z3yWiXB2nLmEjXag3NjRmK4yTV8wL/zeUHM91Yz0a213PZoEn6KHJD1Q9AM
	 uqzAqNRdR3Y81ZcPDmDw4UdIkpa1Shbn6q+Df4aGsgbhmQ8F0cy0jKGb4TYlit6a1mr+H
	 yWbu/42qrvpbBVGkPG8ReiX13MsCiHloUcq8FRCjAPR/HPSbndGIOnhhcDpzFAyQ75J6f
	 vJs2VRFig2eAiwZmsqTijq1wgQ9OmDuRFLtAGW6Kt5soA2UkMiVDJ7fUTfqnzMkqeqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD1U7P+a;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691E4606A329
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 13:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 691E4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD1U7P+a
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e977109392so28276285ad.0
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 05:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794923533; x=1795528333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9eeST+DTiB0/P5zHssKOgXfvR+02Yq9ClIKmFNmHPk=;
        b=oD1U7P+aIHrMdipNAeJKkI0jujeXHn9wS3PaIRCOr9sH0dP3gdc/aTnW1f2w3D0Cm+
         KUKCh4EZIvt7+fX6ZP/zQ1d0I2qM9J2MY/VdFC9dHbGIInB0aEwUEo5uEM3wRhIPCoXq
         q8yrfZUnShsdQcaiDAQHGkZTFjjHAclo+CoRg5ySyOi/oWidZhD83VqJH8auOPv45Awv
         qafOTaZ2kg5kRAPISDNDDgRWxaM8o4FmLDcCa1y6Ie/hiKrOKwwEA0UKfapj4gN79f5R
         epE7mpU3xyqpYz4JWNgEx1iYcjtb/s3X4Yrg4FJwhfVGBjKSqj+c+xKRaWYpoUKOXUcC
         rKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923533; x=1795528333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X9eeST+DTiB0/P5zHssKOgXfvR+02Yq9ClIKmFNmHPk=;
        b=JLe41McubvWaptVKg7dNrfrDL5q7YUv+IOJgALPYQpEsS7LvjX1BMphNg/SxyrpX2C
         sRiMxvqTx8Ui0wlp4plv+JbKjv+vlSFOgKQBskfrTog4+WtbYlI2i/3ZLmwzVvDUnFuW
         cNF1r1sqvmkV7d4kSvkzP3EYffb5+3Yfgwhm+fEiDPS6f6slSBDu3gDE/MDYK9BEAKam
         tJpPN3Vk2h+/x0UJgg514TYKvmOBzJI3pZ36xpSjeKgYMwk0Jb7kYdVmuzv4KA4kT8ny
         m5BIFp/TsjQcOIZ4v+5jfGf+BKah+Cgsm4Xh1ooH8VrkvhrU+WLAiUUBMoY3VIkLI1mN
         sOjQ==
X-Forwarded-Encrypted: i=1; AL+hErEocNg5KDcvHBUv4zB4aRVqLj2ZZTNk1dnpwOqkBXl2Jtk9kWJsn0tA059YZ5/rgJCoMlnRoYdihPb0@lists.linux.dev
X-Gm-Message-State: APuU4Z/TLfg/ZmA78j/KyhFSPzGqCVxPvlmEo9A8O4u3Ro5tyvjj92bF
	3sbLvSBCM42eaLUfxnnZBL2uOW9WjBuyUG+fa4724Kf7IDbh/+1oBpXm
X-Gm-Gg: AZFdTZdKU1x+XqC6WO0m46If21T0afEVRXB93aXsb00kQNkctG/iKzfFFEHFkXcCmMs
	FySa+L0QeN6wqNHAfXx/Z+Y+/lQzr0Anach8VItG3KBReisaGkrh2lbzVMQjTk0+GacOA0W2NhC
	p/+OpHcCPcOj/GnIWShK1BuEBMFjSHGtrQ5qf+qEQbsqGTxTpt2r9SWhEMrRRNI60IxCGl7Usj/
	r6xMDGY5v6xq6b8iYmtab8fccPKnwOkpBBT0tUV9dIEIuBmxLg1BPJQcYVDusP5B3R29M0KNhpC
	6Fl8aSG167dnSaynF7z3REXlScOdNiMuEUWMzTQSLANqOVpv5U6DkqynFI9cfukseFczbHGo30H
	E0uliLChWYGYI/mMI+WVXfR1hv8+9ZJufsyPh9UChH8a0WnTtTdBF+2EkDO6Mscaqv8g/qhjDtY
	qyLthwRf4CaiPCX1Dv9oBKDs+9dPxmBR/rkPzZQzmwHPv+bhRhq+wIiaCfgJxBG789QCUT5x8Gs
	D18VglAvkbbptDtvBCwXFOZcoFAvfjhPXuiiTwyQ/La7WSmXzLEJh+OPDV7MjSuth+hAC298/7g
	3fGdwExWUawb2YwdDZqjqwURHXdjw5uS+d5FPqUyAu1MEpZba9TGEk/rMzmLQHl2Cf4CFsE=
X-Received: by 2002:a17:903:3845:b0:2d8:d4cd:dc8f with SMTP id d9443c01a7336-2ee0da9892dmr141649045ad.18.1794923532596;
        Tue, 17 Nov 2026 05:52:12 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a586c1sm15937035ad.43.2026.11.17.05.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:52:12 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jan Kara <jack@suse.cz>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Matt Bobrowski <matt@bobrowski.net>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/3] inotify: copy full qstr length for event names
Date: Tue, 17 Nov 2026 22:51:36 +0900
Message-ID: <20261117135146.3174252-3-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117135146.3174252-1-graypanda.inzag@gmail.com>
References: <20261117135146.3174252-1-graypanda.inzag@gmail.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

inotify_handle_inode_event() allocates the variable-length event via
kmalloc(), reserving name->len + 1 bytes for event->name, and stores
name->len in event->name_len. strscpy() stops at an embedded NUL in
name->name, leaving the trailing name bytes uninitialized.
copy_event_to_user() copies event->name_len bytes from that buffer to
userspace, leaking uninitialized kernel slab memory. The terminator
and alignment padding are zeroed separately in userspace.

Use memcpy() to copy the full qstr length and write the terminator
separately, as __d_alloc() and d_path() handle length-bearing names.

Fixes: ce163918cd33 ("inotify_handle_event(): don't bother with strlen()")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Changes in v2:
- Use memcpy() as suggested by Amir Goldstein and terminate at name->len.
- Copy only the valid qstr bytes to avoid a one-byte read past name->name.

 fs/notify/inotify/inotify_fsnotify.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/inotify_fsnotify.c
index 6e3af6452dcc..ecbfc9b4e99c 100644
--- a/fs/notify/inotify/inotify_fsnotify.c
+++ b/fs/notify/inotify/inotify_fsnotify.c
@@ -120,8 +120,10 @@ int inotify_handle_inode_event(struct fsnotify_mark *inode_mark, u32 mask,
 	event->wd = wd;
 	event->sync_cookie = cookie;
 	event->name_len = len;
-	if (len)
-		strscpy(event->name, name->name, event->name_len + 1);
+	if (len) {
+		memcpy(event->name, name->name, len);
+		event->name[len] = '\0';
+	}
 
 	ret = fsnotify_add_event(group, fsn_event, inotify_merge);
 	if (ret) {
