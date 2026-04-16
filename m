Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE09F39B4B9
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331074; cv=none; b=cRlZ+zOfr2z/vfKcBjGbJBdVXbx8FAWuTc51Lc7cHiLNO2jzle5l8zOBsW0rw0Zz9XwU8szZg3iSX7mFGQB6KUYahzLwiFwOIh+GgWAAjnBsCqmbwm1iAvURNH2Ns/NhzWjvi5PG4n/RuJCgdl2g/c/tbR1E4NIKCZ7cd8/TCCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331074; c=relaxed/simple;
	bh=IseVwA7+nVwl4mmpZkdG3Nk8WxMIL7qMPYSghlTiSAc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=c1T6GvoRAhanjnqi97Fs/+ZYk6pKsUCdKoNuiyx0Yk4cEgZoTiDmh1mb/a5bGAP5YJE5ZiQA33fc3IRCC+/WaqPPdmIySeDbzezqo/iX49JFu+OrKtyYAJ+BRqyVOr9ROCa1nCBjtk++R59f6NWm+ZdtdQp8C6OUbnUKE6fJkp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I3+7H0m8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I3+7H0m8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JBWYgat9CZjiYcviN78oPc4qkEI83c/hYUCEObNlxbM=;
	b=I3+7H0m81gNQv4a/sTO7BLObU9mpf4VAOaxJ5yLh+M7g3b0wlIUo4FTo4wJW7p+VOeOusB
	HBreciELnR1erzXzmzkiGMEzNVKYAZOVafoKyRfMfPFTGY7KqqZektv3SduNIR7sDwKtQ+
	BPVMmgrPLNx/68Fg/nf9+HfbR7Sblic=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-vYZlN6mYNMyNjNed-tfMiw-1; Thu, 16 Apr 2026 05:17:46 -0400
X-MC-Unique: vYZlN6mYNMyNjNed-tfMiw-1
X-Mimecast-MFC-AGG-ID: vYZlN6mYNMyNjNed-tfMiw_1776331066
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-488bd1ee9e7so48815125e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331065; x=1776935865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JBWYgat9CZjiYcviN78oPc4qkEI83c/hYUCEObNlxbM=;
        b=oY5j5BW15qCGMpa/2Uz3W0cRPk0V/Fvv20bBSITy/CM7UF9YD6A8pqiLr9Z/ts1ZkK
         5N8c8UJKemBOmTE3ahwqZ51/PWLH1X23BWpAZOu4fjE3YGlv289i9yMpjcpNALlfACgz
         2+Zr7k2J+xRwWTmbYDK137sKnHBlSEGY0mKZEWCFszDC6VHJt7tIs7cvOdQZ8VZcLMRj
         n1jiL4s5AZrreocRYmuJSKQjvNas36t7mWz4s+5FpFL7GZ8qtyrFm05XWxbdlISbCMNy
         jwVVqD+Q7EjXyo903u/X3r9pnd0H/10uS3hqx/iiw6u3hQ2L8gMXcxp+qF69hEt/gNp9
         VF5Q==
X-Gm-Message-State: AOJu0YzKZmoMjarXd8eulIBzO2OSI3pdptujPiU5xEdxTqb3YaA/3Xg9
	QhAZVoNP/VdrWuzK+wtU3822V9YlWX9iBHGC9EOYCatmfCXDV0Z/QkQQoMxFO+r24LzEJmV6ROH
	uU5Vt50GyFOdnFwd88+4syhd3NP/AJbjHLUxTdIxhokZ3iCLrXS2rSl+ykef9Jlkw+uUOW4pVjI
	29Rf1rASrR94ksidiLgF1xHazsg3mjaq0zk2Fpw3iFR3CFzKo=
X-Gm-Gg: AeBDieuYEyuYR6UO9VFAFESAF9CFIcSdrs+zAbRLRgp1jzz7ly9yssA4Tf0lx+dpS9E
	2n0G1uHSEwPoBz8nizVrOwe0oSbFCy+rItKxj++06EJT/HaIeKWji/rzRD+EQ0iBbw7RY5y41It
	nyDNR6I0kUtotauNT7xTmhzm4Sa3G3kX4ZGGNAfw5vzfL/Gs/XYWGyxiERPWS6W+By8ii3Y9nPP
	8TtVxowv0qNwyKhGQG1nysREo2IL/wo7ZJ668BOt3t6zz9anlj5Pl9IBxPwYgfUjSmGQvSRxH80
	nmlYhtrbvq+4DLj0n+2fYyc3YCmCrcO3L0GivpJ13wJUNu4FSGc6fH7QE/GqtYHVVLE/2tXAYnt
	44fLQqJlrgloufGFulzq6HqHXv5NOohtlgpCf1Bgock4Hsx0ujMAGLOlhvD4dJwa/6bCQNdUI66
	7ohy70BQ==
X-Received: by 2002:a05:600d:d:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-488d67df531mr280497715e9.3.1776331065365;
        Thu, 16 Apr 2026 02:17:45 -0700 (PDT)
X-Received: by 2002:a05:600d:d:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-488d67df531mr280497315e9.3.1776331064829;
        Thu, 16 Apr 2026 02:17:44 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:43 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 32/32] fuse: simplify fuse_dev_ioctl_clone()
Date: Thu, 16 Apr 2026 11:16:56 +0200
Message-ID: <20260416091658.462783-33-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: MWXYKT6miKOdwAh2bsXeQc_r6TiJHHvFFDWuoCJafB8_1776331066
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Don't need to check if the new device file is already initialized, since
fuse_dev_install_with_pq() will do that anyway.

Make fuse_dev_install_with_pq() return a boolean value indicating success so
that fuse_dev_ioctl_clone() can return an error in case of failure.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 6fbe6084c5ae..25c5c853a791 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -453,12 +453,15 @@ struct fuse_dev *fuse_dev_alloc(void)
 }
 EXPORT_SYMBOL_GPL(fuse_dev_alloc);
 
-static void fuse_dev_install_with_pq(struct fuse_dev *fud, struct fuse_chan *fch,
+/*
+ * Installs @fch into @fud, return true on success.  "Consumes" @pq in either case.
+ */
+static bool fuse_dev_install_with_pq(struct fuse_dev *fud, struct fuse_chan *fch,
 				     struct list_head *pq)
 {
 	struct fuse_chan *old_fch;
 
-	spin_lock(&fch->lock);
+	guard(spinlock)(&fch->lock);
 	/*
 	 * Pairs with:
 	 *  - xchg() in fuse_dev_release()
@@ -473,16 +476,16 @@ static void fuse_dev_install_with_pq(struct fuse_dev *fud, struct fuse_chan *fch
 		 */
 		fch->connected = 0;
 		kfree(pq);
-	} else {
-		if (pq) {
-			WARN_ON(fud->pq.processing);
-			fud->pq.processing = pq;
-		}
-		list_add_tail(&fud->entry, &fch->devices);
-		fuse_conn_get(fch->conn);
-		wake_up_all(&fuse_dev_waitq);
+		return false;
 	}
-	spin_unlock(&fch->lock);
+	if (pq) {
+		WARN_ON(fud->pq.processing);
+		fud->pq.processing = pq;
+	}
+	list_add_tail(&fud->entry, &fch->devices);
+	fuse_conn_get(fch->conn);
+	wake_up_all(&fuse_dev_waitq);
+	return true;
 }
 
 void fuse_dev_install(struct fuse_dev *fud, struct fuse_chan *fch)
@@ -2283,15 +2286,13 @@ static long fuse_dev_ioctl_clone(struct file *file, __u32 __user *argp)
 	if (IS_ERR(fud))
 		return PTR_ERR(fud);
 
-	new_fud = fuse_file_to_fud(file);
-	if (fuse_dev_chan_get(new_fud))
-		return -EINVAL;
-
 	pq = fuse_pqueue_alloc();
 	if (!pq)
 		return -ENOMEM;
 
-	fuse_dev_install_with_pq(new_fud, fud->chan, pq);
+	new_fud = fuse_file_to_fud(file);
+	if (!fuse_dev_install_with_pq(new_fud, fud->chan, pq))
+		return -EINVAL;
 
 	return 0;
 }
-- 
2.53.0

