Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703120;
	b=d/R12WNV6fhYETRjggmlZ4nnGSTYyXHj6ARsWUOpJIcydT5sHH0G9ZM0XQdJin3HSXji
	 JprDcwVABiU2SHUGML3eVBjg0TKDyjcYaLQurNK6xLjCgqJ05IURY3B3mip1TaUoFLf7Q
	 /+4fcjXz/yT3T7Bm1fu/FV4pA5eJnVZZFj9FoAzANvO4sTJ7H+QDfxz9M1LsB94gpaqTG
	 vPmFbliXYP6MVZM6CTqnFyGlobouTaUN2sfw/xsh7plKByT0JFJ7WF/3PNSQgA6rcwFLz
	 JW3g2CN7Y6wmJKgpwXq5/qi7NWH539hQr+7pB+H/pLkhRXD5I2QYbh9CzALoOnzgmBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703120;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=Zn9n+tqyRPBDAzS3KW5PeMnhh8vbI3GNFVNvV+khVUI=;
	b=K8t2Zufg4a4shAQG5giJQqNCqrhr9CKYnAjQ7HC8o24w71x6C60ZXorLMHnRXtnqhW8r
	 4cswJoBtsOUNh3NoUFT7FkmRmT3Gl9QMgqpkhBQ0hBluaApBySdFErYQJeWIVeBFsezjv
	 BIBsX4m02UalzFKgP1UA5LQ6dr9zZS3wB5fq4QAqSbnEftuVrZyuadazwofx8/y9tmM7o
	 HYGhiCqT7YyMqc1/0EKKGCSMHl4qUPMY3RIrGZqOF4Iwi3lYe5eBxGrz3rAXdyVZrKE1y
	 fE3kmBGAogm+oJyTMFtMpW6gionPKl7sX5CDYDCbTvYe9px/X1RpoJVJ8rch8KjHzkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eHdOmuAJ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF53606A31E
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 14:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF53606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eHdOmuAJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795703118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zn9n+tqyRPBDAzS3KW5PeMnhh8vbI3GNFVNvV+khVUI=;
	b=eHdOmuAJtw9suIPQgaNuJiDGRC6+DyU3e90QUUMzjfK5ValudTB5qCipOvKJ7QIS2CHTmi
	bqzwPXVGTjwsclnmxHvVypsLIEnNZuVOxOMBzqWxZw6y/I/2732D1gWso3UTwp/1z8QCEY
	qtRW7Q0ePSkcPryRfe3HIR/58JpcS6M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-efPc7MUYMSWqHlVBmTwupQ-1; Thu, 26 Nov 2026 14:25:16 +0000
X-MC-Unique: efPc7MUYMSWqHlVBmTwupQ-1
X-Mimecast-MFC-AGG-ID: efPc7MUYMSWqHlVBmTwupQ_1795703115
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0461e040so5566828f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 06:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703115; x=1796307915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zn9n+tqyRPBDAzS3KW5PeMnhh8vbI3GNFVNvV+khVUI=;
        b=JmiKpDsSnuXXLXgVMOoc1rsRx9OX3Qpv0mTRvuW41ia/egzXd3nXMWX6T2CRldNNTN
         zEyK44IkvKYaUQAwP9d78WS/7eNqEJFb9SfyFfTJ1BF3y/KwHrmBxcAoyU+EE69KJVmF
         d/WHrjzxYvi7TV+Nm/7lbWB27SwjFZbjcLjFiqR4bgCaqmwdYwP1oews+aKYQdbsYP7G
         qMnhn7IYLvoir4Wx+CC7bmFrFO1x9guI14nD0bXZrcx8AcIeJlQyTN2cpws4wEZNDeKm
         ZK74RqkI/MNzljQ3ZOQnPv/NwM/Ng1F4MwmpGhvdoq2oNRFJuqKvK4ILwNNO/+34Q2FQ
         bW/g==
X-Gm-Message-State: APuU4Z+qRhpIERSP5g1u9nxWOKgvzGyOzUZaq6BQnmlBMBkCZEjy5Cgi
	NGd794jROL3BSQrNUPCeXDT6XyDU3xJqw/hdOhY7QIVe6v8pfYAqci6DwBuV/kDF89FGrvMZ7C2
	VYwZ+yt1JNIngXQ3JQLZb4wiyJO/yfhVfpqclc2fLnNFNC1QmP8gxReayhitAoyGPKANyVBnojc
	gwYC0R56ou5j4UsvBZVfNaUsEtXUOpyW/Xtmz8SS1v+mvUTZs=
X-Gm-Gg: AZFdTZf5mZBiH8/qgZmjZ+4Rc9jh2KuRLpIUURTisWvGYGudzIWcqyTP9ToKtUtD4d+
	pPVBmukD6jS0NRWboyfay7/MaIL4+CDkhxDKJ1wnlJog968jWTE/uuH2jYzmwNh5LNtBkAuQCKQ
	ZeiFoJcqMIr+tz16sDijtuqLwWtZR8lVv8J/T5lJmvwaN4ELxHpQoC1xa1TnfmKg3b+HXI0AztU
	b4LKulnYK3h+hkpnFUN0C/7ZgHaOmZQcWFoocWmgQ+t4l1J+hKdN2PGOiAVAuWEhk6/Yo1BvDxB
	qOsF0tslq8dQ8pqDwn6FnBWslkBQcXo50qanXxnlouI/ZWyl1l5d2rePLR/ZCssYcP4Gp4Kth5a
	1ibfMZuNV6OzqLmCUbOeUxqFnuH61z4VU0tA7ewFDmfHFgRj1JQruz/bT0rcmjk+lxeld1DBxQ8
	E3F6wPocCNJ7QlKReLWkKKGn3y5Jf3S1aBtGD4o9Ze
X-Received: by 2002:a05:6000:470c:b0:4a7:557:fc0 with SMTP id ffacd0b85a97d-4abb225fb4bmr40278737f8f.32.1795703114979;
        Thu, 26 Nov 2026 06:25:14 -0800 (PST)
X-Received: by 2002:a05:6000:470c:b0:4a7:557:fc0 with SMTP id ffacd0b85a97d-4abb225fb4bmr40278676f8f.32.1795703114370;
        Thu, 26 Nov 2026 06:25:14 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (193-226-214-34.pool.digikabel.hu. [193.226.214.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm40768370f8f.42.2026.11.26.06.25.13
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:25:13 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Subject: [PATCH 1/6] fuse: fix fuse_create_open() error path
Date: Thu, 26 Nov 2026 15:25:01 +0100
Message-ID: <20261126142512.219535-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G2ypkPfdmHYncWnsztIR9XtAKWTj4qQmZ_Kp7sVDrEQ_1795703115
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Don't release fuse_file twice if finish_open() already set FMODE_OPENED.

This is triggered by calling open(..., O_CREAT | O_DIRECT) on a inode
created with FUSE_ATTR_DAX.  Since a_ops->direct_IO is unset, this will
trip the late O_DIRECT check in do_dentry_open().

Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-29703e58-1f2f-4d70-a476-06c6335ede10
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dir.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index a04d93d5fc44..af1d91c7a181 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -921,8 +921,16 @@ static int fuse_create_open(const struct mnt_idmap *idmap, struct inode *dir,
 		err = finish_open(file, entry, fuse_finish_open);
 	}
 	if (err) {
-		fi = get_fuse_inode(inode);
-		fuse_sync_release(fi, ff, flags);
+		if (!(file->f_mode & FMODE_OPENED)) {
+			/*
+			 * Only release ff here if the file was not opened.  If
+			 * finish_open() failed after having set FMODE_OPENED, then the
+			 * VFS owns the file and will call fuse_release(), which
+			 * releases ff.
+			 */
+			fi = get_fuse_inode(inode);
+			fuse_sync_release(fi, ff, flags);
+		}
 	} else {
 		if (fm->fc->atomic_o_trunc && trunc)
 			truncate_pagecache(inode, 0);
-- 
2.56.1

