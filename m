Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E710239B4A0
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331048; cv=none; b=pM9Wv7FfBBsCUUa2Rq0D4TDNCBOrCVpgmQAl1L09W6liWtGamHkmnrEPZKcD/8MNVjMnbUY+ZdZA3RFWlNhd04VJbd3o6PV9+YXuaixUqrnUamo8j+9ihnrks0AX597lZ1kd4UW4wiGr9r4zpVqDyrfK19SSc4STWBy1rQ+1THE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331048; c=relaxed/simple;
	bh=lRXrp+/Wt/3Jzs2Mlf5Uv6d4sQzdg+Md+hVUVfGqsrk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=mli8sW+LsdBLLMooIT7G9XlkgF3zKYdKrUe7yVSh8PeQ2kCwlezHu6NaO8ZVrxOETjvLzxG/jgHSmyrgpXG3Erz6hfvkrB3qFmboLXCB9O24oxLz/HMu1jGtPoMrOMxCXuQldWlRtryu1qHnE2Npt1Sz2839UZFlR8UTen2d18o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U2z8OGAT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2z8OGAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m1UEmHJjJy26/ZcPFHdwiCnQsN4/c3i71hg7W4e/53U=;
	b=U2z8OGAT4885vi5xRadPNis8rBLoB1lScuDQsf019QMlbVpiSh7FHbdEFSGtPnOMkbEQqs
	/dVx43T2kXDILPR8q9tf6fizC1fasgc/JugMY6CaxpiGbtH5same/OUtECFxI8U7e9ECzO
	LzELHlpwNqSBzLVoAKOCcBjuadiFjj8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-tyeZQ29fPe-9tvRduNpsCQ-1; Thu, 16 Apr 2026 05:17:19 -0400
X-MC-Unique: tyeZQ29fPe-9tvRduNpsCQ-1
X-Mimecast-MFC-AGG-ID: tyeZQ29fPe-9tvRduNpsCQ_1776331038
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488d4ac6ff9so45273755e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331038; x=1776935838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m1UEmHJjJy26/ZcPFHdwiCnQsN4/c3i71hg7W4e/53U=;
        b=liaqfMuU90y1svzEx1fwDnVFktiYu38O3/N+LVCCkHLMH3dqaxc2eQVO0EnDogNsg2
         rXspP7VPCJr8fl9Gp0Xyz60YNAgN4C1bsV6Ho+K69rq1nQbGCpsKrWHI6+w9H4gTrsNK
         YkZHJNR41yzU3lyoqP7W19D7XTqEHUrvQ24QU7YqXh7yfQEW2VCkYKamZwbLH08+7mW0
         Cx60lC3G8IRRh4G/sKBpNEkFdxJ3tbiuvz27uLCEjN7JoVjCPPjqT8KEuwamVfqosbuV
         AEjOA4NGG/PYCGC9LV3sSYE1CtQDTzweRKAo87Y5yPKE2822ZPg/MaT7IvQn7Apt9wxw
         xxQA==
X-Gm-Message-State: AOJu0YySzlCVJ2uTdrIWcbJ0CZxUEssbIMEQfuqlTe9+9cEXRUgCWEFr
	O6w0hQcBCM0hBJNp4ckpryJgo/UhF+hqOSwLppP1/iySsUH83msA4P+M2fJl82J+sDsWeFC+Bg+
	biqE+AQKKJMouQSOP76LJRzdMx/E64J1aTPLLFJK6vKXxSdGRAOgM6evZgXX3zu9U5xjLdcJ9mB
	5cP31oI3oDj+Osf88tw2cfGTYE6uDLGjHJgPT41YpTFYN7BjM=
X-Gm-Gg: AeBDieulbNz/osJOwsQnw12joUtZdA3Suz2x34mWFXzx68JsBOJK+41wBqYctXXIeuL
	zgS0IJ9Rdr9V1BLEPPNw0bFtSuAqy5G51bplw8tomiE8XDMDXfdR+MxSwEPCi9hZ/vKahe1ogIp
	TDHE9nb9+lN7xKNqtPON/xMYnNNop6tWLMh2bOlDoCLhQHInGcHVvvi4rgsl+Pm5qmKz2sZ7hjt
	Hf7Hi91xieo8XgvzlyVOIBdIltSZWI1r7rj3Yv1vVttZIMbsvoHeQyBSIXVcRbCP5YuWlPb9m7a
	DzS0ZffP0X7tI/f7PRsBcoFdWbJ2Ly1MDbf67aWyeCG+HjKrctzGnSR4j9VJax9jD0gqd/US0aU
	FBk+q19Dze9eQQ/nx6FoTMcDs1psnLvX1v+4eHj1A3KAXxoNX0IVW+OT7ecud/010Gmbd3qpjMD
	hGZXtNBg==
X-Received: by 2002:a05:600d:d:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-488d67b8db8mr271988285e9.2.1776331037800;
        Thu, 16 Apr 2026 02:17:17 -0700 (PDT)
X-Received: by 2002:a05:600d:d:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-488d67b8db8mr271987945e9.2.1776331037299;
        Thu, 16 Apr 2026 02:17:17 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:16 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 11/32] fuse: add back pointer from fuse_chan to fuse_conn
Date: Thu, 16 Apr 2026 11:16:35 +0200
Message-ID: <20260416091658.462783-12-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: wr7hJ6zzZ5zWY_kn7kDRUzUHVS6Po9YJ0ZBFw3ro0sw_1776331038
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Will be needed by callbacks from the transport layer to the fs layer.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/fuse_dev_i.h | 3 +++
 fs/fuse/inode.c      | 1 +
 2 files changed, 4 insertions(+)

diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 472ee0624a27..0bace11373b9 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -96,6 +96,9 @@ struct fuse_chan {
 	 */
 	spinlock_t lock;
 
+	/* back pointer: fc->chan->conn == fc */
+	struct fuse_conn *conn;
+
 	/** Input queue */
 	struct fuse_iqueue iq;
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index c7f7e0ff12f7..d31d7b80c184 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -995,6 +995,7 @@ void fuse_conn_init(struct fuse_conn *fc, struct fuse_mount *fm,
 	INIT_LIST_HEAD(&fc->mounts);
 	list_add(&fm->fc_entry, &fc->mounts);
 	fm->fc = fc;
+	fch->conn = fc;
 	fc->chan = fch;
 }
 EXPORT_SYMBOL_GPL(fuse_conn_init);
-- 
2.53.0

