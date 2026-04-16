Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD95A30DEAC
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331070; cv=none; b=NJ577n6tUl81g9pwnuKPoQXGJSXqkrai+CIi8C55V7vKdW3zmFv5AIOZPFsYewwIMU9B7aykWDcLSaRbFZLgZBnPgxOG5lEKe5nqBr88wp3ZL84Re4Jo2hyfh4Ptzsp/+rWMzbtnEopv+GZG/KNa5XKHObaIBw2+dU/iXzdTZUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331070; c=relaxed/simple;
	bh=oupKbopHoZjGKCXVfgLdV73YFvSm3nL01eZ8SkoReg0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=cc/eLA3GYgKm9UDP9AkHISLf1PmYZqr5bpeBGIwxaMG5MhrIRTsL+Mj5B04OA/bHNBCqduNbbHYbGWu9maXSc/5rQZyf8kJqr2OZvLKuOgWsrNaOmJdFg4yX9CE5m4acmYb4LPlQuy8FlQsjeD9mbtP0vus5ZXV8xy4B1tnSzQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gl9JAOGi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gl9JAOGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hwd2KVO2gNiboi+7UNEBdWG86Ja+wtOAOwDZUksJfYw=;
	b=gl9JAOGicqfP2t2Au4auoic9qpvEtBNcdKKh0oFJc8SsimuJmKV0taasxubicXZxWozVg6
	5X1g5CNwrDahA3jkvWhaPHe4+u2E1MW0ybB3L1S0znU7po3cb6HCyTPWNMBEiUQrvWqWZQ
	TrFiQolVSDULFV4JIX0PRnnc7CxFgq8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-41dTkmuNNIyN5rIWiUC7sg-1; Thu, 16 Apr 2026 05:17:43 -0400
X-MC-Unique: 41dTkmuNNIyN5rIWiUC7sg-1
X-Mimecast-MFC-AGG-ID: 41dTkmuNNIyN5rIWiUC7sg_1776331061
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488c768a9a9so40615675e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331060; x=1776935860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hwd2KVO2gNiboi+7UNEBdWG86Ja+wtOAOwDZUksJfYw=;
        b=QhM/bjLUZmYGICWpGvH+R8AiKi9h4rgjwdkz2exjY33Q1llQkfE3AXk4yXQc1T/CfE
         RyJI7SFr46Xpx1yqysXVH4E1AxPMcUxtYkMF1MP8uWrsmHqc1/7/CYxJEffJVz+S8Azf
         Lnnt5p91xKSviPPpxMR5JsQNENnCJjeVF2IvG1vCdPQq1cp1UkhAgjTzVZemoizPR2QS
         DIyob2fH6wNyJKTETVBZpq5+7Br+ES/TqVwK5e7P0XNyWZp2XdGNvQWAp6zor0Og5iVo
         Ev1XP5YHgiPNHtJaLD+kANi8CJtYSbUObGx9Z9ojFm7R80I7eoOMBcJaBezEqcmKurn4
         tAOw==
X-Gm-Message-State: AOJu0YwD5W2gzTmm13iwM8StceaM+cZpLhqApZZrXIVBd2ftlgQvqouI
	rsVuaWlBlh3uLeq3d9W7sK+eh7hMcIaBuUcpJQQcD+syiJhzUIv9ZkhkHrYrJPJeuiBLjoCq8Fz
	UAmRGtGNsC4OU3B3uh9ABGDoVSFccbZxlGEfQkPohNHvB1cwQy2Bphp6cN03DycAtTW3c2vghTO
	RQw9L+lNrimVCkaei6HAUZoBN2HF2/sSEpFNkGcn/ULqOjjNQ=
X-Gm-Gg: AeBDiev6mjE/ArI/LrnF4rFu/2XyHG4+YS3OmGYA7ThxUZxrfv3nzE+4K15BtjPyzUB
	NB/WN07fvy2qht8gxNassNetlmgVlsVAg6K8l6J0abXdEZUhqrbFoHDbW2cYPlC230GtMxwnGVp
	88lizniH27dmUrvCnyPvPCJds6Z2e1/I8GdY+RZd+zFba1cfwFJmERVX0RGNz2ruGWKh+NzzOgQ
	YxKXbzoa9mJFPzdK7xomzN4ZIvmGIsg+ogaNwXq1+kpDy18K+YGxqH3DcfUT7F5AgaFE7Uvlrp3
	0HbLy71jNGKXQI5C+gM66PCriLoJnqrg3sxjM32IRhgOcrkKGeXyfof8BUjQqJggXwx4Wg6sy6+
	bTq9UjTdVniBdq7JTtcHU3f9l/qLaCBdnyMauJ6q7FhLwH35CJU8sV9dKXm7K6rM+mQ3mbR0iNy
	Dk5N/fSA==
X-Received: by 2002:a05:600c:528c:b0:488:a2ac:a337 with SMTP id 5b1f17b1804b1-488d68c2bffmr322775935e9.21.1776331060439;
        Thu, 16 Apr 2026 02:17:40 -0700 (PDT)
X-Received: by 2002:a05:600c:528c:b0:488:a2ac:a337 with SMTP id 5b1f17b1804b1-488d68c2bffmr322775555e9.21.1776331059990;
        Thu, 16 Apr 2026 02:17:39 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:38 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 28/32] fuse: remove fuse_mutex protection from fuse_dev_ioctl_sync_init()
Date: Thu, 16 Apr 2026 11:16:52 +0200
Message-ID: <20260416091658.462783-29-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: FQ26VW5TmuPcO54XWAjH4qPSLxWnPgDw9L9Hhn9qEZU_1776331061
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

In normal use ioctl(FUSE_DEV_IOC_SYNC_INIT) comes before the mount() or
fsconfig() syscalls, they are executed strictly serially.

If ioctl and mount are performed in parallel, the behavior is
nondeterministic.  Removing the mutex does not change this.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index c59cbfd3ffee..5ebd6f3e0fe4 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -2297,16 +2297,13 @@ static long fuse_dev_ioctl_backing_close(struct file *file, __u32 __user *argp)
 
 static long fuse_dev_ioctl_sync_init(struct file *file)
 {
-	int err = -EINVAL;
 	struct fuse_dev *fud = fuse_file_to_fud(file);
 
-	mutex_lock(&fuse_mutex);
-	if (!fuse_dev_chan_get(fud)) {
-		fud->sync_init = true;
-		err = 0;
-	}
-	mutex_unlock(&fuse_mutex);
-	return err;
+	if (fuse_dev_chan_get(fud))
+		return -EINVAL;
+
+	fud->sync_init = true;
+	return 0;
 }
 
 static long fuse_dev_ioctl(struct file *file, unsigned int cmd,
-- 
2.53.0

