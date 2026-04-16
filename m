Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A1439A060
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331063; cv=none; b=cN9sVBe6aXOgiSiEvzeDMdHe4cb8VjFD9quc6Z9QFl7K1jZ1TkLMSfxb6Lbb70sYLkZHIabcnb0AJ8DS0OatKiOiDn58D+5vmsvBqw34xel+FxdPb+EVQAFKVeA7TRPrZJHoWnI5n/42l7iw5qKvc59okHm5TbBVhiaJMb6epc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331063; c=relaxed/simple;
	bh=cTPHIqUjfffPg1SbN9YU4EdCJN6MCkhvMu6sMd4a8LA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ZKpgq8n4eVOYnAwRZL4y4V6D07/E3qhmT3kMFh5i1DEQJyn0xJpZmmzqKPQt5lcO739KLRcNvWbbznOUZOmVzaKD7eXFzLmZYE5VY4TrhJdBr/g2SLAOQI4kY53fHdpWk5Nylkh9N/jHJkwabf+gl8/fri2GeSFYRHA4Kqv0RYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E767uHkO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E767uHkO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPk/yeIL85CGNg1VihA0wb2dmd3GQ79PwQ6zGc6blQw=;
	b=E767uHkO5McNAWeUoD3TO9w8TD0Sn9H32P6eM+BJ2Wzi4K4rwAtVzMXXWkERsrb+wRFnJT
	efWJNhCvAvDcAjkVzsFU7SqK4xHq3a41BlBoXzhjmRCyIW3AOjIeay0dDuLWRNG2IiJSHp
	m/nMCdc4lQgsoLjW1mrVlkwTGsbovfU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-qkyipjY2P7afNApNBr-PvQ-1; Thu, 16 Apr 2026 05:17:29 -0400
X-MC-Unique: qkyipjY2P7afNApNBr-PvQ-1
X-Mimecast-MFC-AGG-ID: qkyipjY2P7afNApNBr-PvQ_1776331048
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-488e1757205so29454305e9.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331048; x=1776935848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TPk/yeIL85CGNg1VihA0wb2dmd3GQ79PwQ6zGc6blQw=;
        b=D2FJrIp09oCg1DUG59+rwk1XdQOrvKOHnETyjb0/EyeFHBbroQwxvRozEYnWneoxg3
         NXtNC58gOcpixcoFL+wLTN6y3ky1kaUZGX2Sj72gf4IPirhSuZwSCr7IyzOxTQWM44CO
         P0YWk0SFzFMIVbxqWhF04KMMKCch9lij/O6AKz2K6HWmQpQeL8Uvzdy3hE4eAWpuL7rV
         hAXHDdpPmTtw9ZPwGyL/Uzj9/LlLTXU6kJtRsaQmyvGSENMHiJhUB1D21QyXl8QYaeD4
         5KspMi4ELoyhCMkQ+5hUILIKZIyz70XS8Icb5cffP2gsydQkY3XwN4aZeIS8rkx5osYH
         uD2A==
X-Gm-Message-State: AOJu0YxT5e2T58n7Fn4K9KZcS/vvJVeqkFE8ar5hlas42+8z3O5JfQXn
	HOvhnhDd/b3PHSrSLfN69Mx3GCf+/vmVunrnrfBd2x2GvQY7NA+q4j0rN7/Xsi6G0Q+tmlgRLtg
	JKxPWAi8vQMqvqAJm1IaDk7IAAi8FIgLIZrD9szHggBqDphN9QnFR78zHMFLanzlyHhtexqwchc
	gY/5z/9R86/z5Q5rt/0BQyYFdD555L5VWmXH1HD9c9c8Nyiqw=
X-Gm-Gg: AeBDieuHEXpRAW6FVaXsvDNy8sw6QMDhPMoljuc/gpkUgXPu/i0QGXSNCFGTbTbThRN
	neouYw5XoRKZV7Pi6BkYyErk7fbfrdpWMimGhtRPZldYRxj3dLJ31xuH5fD1zw+NZ1Ej76FD11J
	0IPvmio+3XtIhGAzNxnMRXsOfu5JK+ickJNxKhwlANNaWhQZYr1Rwd5rI3O42hkol9HDMo6pg45
	pCcVEpJdXUxSiRZku/lXoIS1gCT3ozoIXR9OSoxOA3yUSzzMG5LoC4VRvgZAHi7PxGlPh6QL7YR
	5BRrNpVjMR1qrTDQoEjGaP5oCWYAz4k788oAooJs1YcryorB7dGNyXxJY51Gd12o0liCmzfEvq4
	znOmipxPIenMkdkQcDxkm6TomjvVGtNesAR0A+vTHGcNvQiO6KHayq4XeG/ZGU/9UtcWps/2OjE
	pNXKbrVA==
X-Received: by 2002:a05:600c:6994:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-488d67bbcbamr354946815e9.3.1776331047786;
        Thu, 16 Apr 2026 02:17:27 -0700 (PDT)
X-Received: by 2002:a05:600c:6994:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-488d67bbcbamr354946185e9.3.1776331047293;
        Thu, 16 Apr 2026 02:17:27 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:26 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 18/32] fuse: remove #include "fuse_i.h" from "req_timeout.c"
Date: Thu, 16 Apr 2026 11:16:42 +0200
Message-ID: <20260416091658.462783-19-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: _NJvTfC3JNUrjPdAO6PmgaRNaqOIXJWIkmw_bNVt5MY_1776331048
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Just need to move fuse_abort_conn().

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.h         | 3 +++
 fs/fuse/fuse_i.h      | 2 --
 fs/fuse/req_timeout.c | 1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index 1d3d2e0c9b91..efdaf0bf6f0f 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -41,6 +41,9 @@ struct fuse_dev *fuse_dev_grab(struct file *file);
 
 void fuse_init_server_timeout(struct fuse_chan *fch, unsigned int timeout);
 
+/* Abort all requests */
+void fuse_abort_conn(struct fuse_conn *fc);
+
 #ifdef CONFIG_FUSE_IO_URING
 bool fuse_uring_enabled(void);
 void fuse_uring_destruct(struct fuse_chan *fch);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index a0d120057ddb..af8e05a403e5 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -996,8 +996,6 @@ static inline ssize_t fuse_simple_idmap_request(struct mnt_idmap *idmap,
 int fuse_simple_background(struct fuse_mount *fm, struct fuse_args *args,
 			   gfp_t gfp_flags);
 
-/* Abort all requests */
-void fuse_abort_conn(struct fuse_conn *fc);
 void fuse_wait_aborted(struct fuse_conn *fc);
 
 void fuse_dentry_tree_init(void);
diff --git a/fs/fuse/req_timeout.c b/fs/fuse/req_timeout.c
index ef464bebc0b6..9c48789b941a 100644
--- a/fs/fuse/req_timeout.c
+++ b/fs/fuse/req_timeout.c
@@ -2,7 +2,6 @@
 
 #include "dev.h"
 #include "sysctl.h"
-#include "fuse_i.h"
 #include "fuse_dev_i.h"
 #include "dev_uring_i.h"
 
-- 
2.53.0

