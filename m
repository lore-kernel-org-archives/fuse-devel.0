Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3F639A7E9
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331042; cv=none; b=SQtak2YF+Cy/a+y0PucWH8qOvbhCvxWPNSq+FYrp7ODuHvErqaLN+l2YI6vO+b1lnAOevm2hISbnvcxqFMeP0b46BsquUmSGEC0LE0Lw7lK/Upv/Ykz3BvtE+0nKt98tDJR23wyjQo/GxrWrSq1P/6kboCvDHsSepevOUkpLdrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331042; c=relaxed/simple;
	bh=CY45qDEWcR+0Y3mSqVSEOzwYND4TCQUSXJ2qk49u0rY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=efKzSZKEPHJkLn9PK1fz7oXDAXTBl8iYUGxuuYc3KvRs7/10TkRlpZi8yEzskGn6B4ijW9bVJs2iNlY2FCTD83mjgI5Ipyasc8J02rBm17MlE7fOb9czRY0Wxz5jOIM06UrOptozYNvB4afNL7/Ko23EhH+XWeHJqmS4+jbEcX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JC2RCnKz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JC2RCnKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkzO7m4jiYzlyojmiFJDVWvDhnuTG+0Vzpc4hhsZS3A=;
	b=JC2RCnKziJLKzKy1pkBrpjCCxcf3El6X89ifVw2eP0nsK0mRORWtrDsWVkbcR0s88KefKq
	znuQUUR5sigFZTIB8wo1bUlcNojx+owyFGb3YwILP8xJySgvBuXKZcYJQW+UFJ/mnPk45K
	zod/o1KLriKyACCDywGawt1bx4LIF1o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-54TueXf8O6y-ktHOvx2jLQ-1; Thu, 16 Apr 2026 05:17:16 -0400
X-MC-Unique: 54TueXf8O6y-ktHOvx2jLQ-1
X-Mimecast-MFC-AGG-ID: 54TueXf8O6y-ktHOvx2jLQ_1776331036
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-488bd1ee9e7so48812375e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331035; x=1776935835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DkzO7m4jiYzlyojmiFJDVWvDhnuTG+0Vzpc4hhsZS3A=;
        b=M1r9kdk4QvE7m3UrmSmG/gL8bw/r2lwy0BkyAzPLxi4t69Gs+91yHmrSJKrfJQw3by
         2zH9pJzdEl76r3K9KG9Qyi/U5DaCxEfLzgRD5XmevVG4jwCgJHIefTPWRNlS3ZDoIW/C
         l6dUmLbp9glVgQbsKnMa378PKbHd8UK7x73NTnvM36SVyQyAbXPbLd6i3dXSQ4oj7NdU
         GjUIE0U9bQIYV0hVXoe+eVw4eKGHp80ZeQXz1l+Vkec4hVpothKvvE7SsZAku+RPxiyG
         AeajSeyCfJrTuoPPVJ1/VokQGqSHSds+7AKzyfjd1uOqtXZIbM54IDW35d3QGTGfCvIs
         j6yw==
X-Gm-Message-State: AOJu0YwY9siTLlR/WXeHIE+6aVfs5aMSs8Sp1ewLwi31mpFBZ/Biut63
	BPLseg8SKCzvlMhvDKhZS2AwXcnuRm6NczpkQB8OEr880uxFlBl0XDo9iVFuFZ9cMRKqdsiPw5b
	gXdWG9FaAWThiu+JeJBLrEnDLFzo5DxejFmFtbr2kpfwxdERB7qOiVygxYYFhOkPc7DaXceHtW3
	f6oWYXYuJalAMzg5W14w30EsWuZmWSTXzJX9VOz1XOJmTv82M=
X-Gm-Gg: AeBDievwO/LvOsmoizHVmEwQVCDQq1KlRdbMPit4bCHJPGFnrxtKGxtVmQNpC26upSh
	ZUeztDza1H1+/PZEhbjBlC2gZvMoOHeXITk1K/mBfqlaDnflVc9eipNKz2kUS4djKJeFwI+bakW
	2YCmYEUu1izKSB1ibRP3OkOsQARoZZ7B/TSMbp4Ng3vwyiKaoULY76WhG39pP2/+qfd4CbzlBZE
	9hVUkZfiPfYyJwKfdrQTtYM0A3d1FgpNhgQweO1xhVJwxE6TdCnnWG5gBMZB4QgdSgzpr75etPZ
	0n6FvYw2/QwubLz2Tk48lZFdFtXMBzCadcZRi5o+EtBR3DKYQS47rCpHpxuq2ljpwEmBQ3GcPFi
	nM9omAQRByOpzo7Ydu7KkwRTxIl9fsP6QPGAyISMxFCbo+2PhDKKX78Ia1Iq6vqY9bHcFXz9QZt
	KF8/xn9Q==
X-Received: by 2002:a05:600c:c10f:b0:487:cd8:4c9 with SMTP id 5b1f17b1804b1-488d689ca8dmr239063355e9.27.1776331035294;
        Thu, 16 Apr 2026 02:17:15 -0700 (PDT)
X-Received: by 2002:a05:600c:c10f:b0:487:cd8:4c9 with SMTP id 5b1f17b1804b1-488d689ca8dmr239062945e9.27.1776331034791;
        Thu, 16 Apr 2026 02:17:14 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:13 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 09/32] fuse: move interrupt related members to fuse_chan
Date: Thu, 16 Apr 2026 11:16:33 +0200
Message-ID: <20260416091658.462783-10-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: itvWNqmQ2wHu2k_7EHX7jaQfb4gLlJmxizVb8wucDwo_1776331036
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Move:

 - no_interrupt

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.c        | 4 ++--
 fs/fuse/fuse_dev_i.h | 3 +++
 fs/fuse/fuse_i.h     | 3 ---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 4d21e22301ed..34ef117daa3f 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -607,7 +607,7 @@ static void request_wait_answer(struct fuse_req *req)
 	struct fuse_iqueue *fiq = &fc->chan->iq;
 	int err;
 
-	if (!fc->no_interrupt) {
+	if (!fc->chan->no_interrupt) {
 		/* Any signal may interrupt this */
 		err = wait_event_interruptible(req->waitq,
 					test_bit(FR_FINISHED, &req->flags));
@@ -2295,7 +2295,7 @@ static ssize_t fuse_dev_do_write(struct fuse_dev *fud,
 		if (nbytes != sizeof(struct fuse_out_header))
 			err = -EINVAL;
 		else if (oh.error == -ENOSYS)
-			fc->no_interrupt = 1;
+			fc->chan->no_interrupt = true;
 		else if (oh.error == -EAGAIN)
 			err = queue_interrupt(req);
 
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index ff1c62297e01..bfd349b88097 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -129,6 +129,9 @@ struct fuse_chan {
 	/** The number of requests waiting for completion */
 	atomic_t num_waiting;
 
+	/** Is interrupt not implemented by fs? */
+	bool no_interrupt;
+
 	/* Use io_uring for communication */
 	unsigned int io_uring;
 
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 701bb18dcb00..59bdabaf994b 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -659,9 +659,6 @@ struct fuse_conn {
 	/** Is create not implemented by fs? */
 	unsigned no_create:1;
 
-	/** Is interrupt not implemented by fs? */
-	unsigned no_interrupt:1;
-
 	/** Is bmap not implemented by fs? */
 	unsigned no_bmap:1;
 
-- 
2.53.0

