Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516C448CD67
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 06:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057437; cv=none; b=eIJdB0bYXpA31F0dDz3OS+ER+Gn2dVltRS+wuHAST2pvcyi1LLO1FwFNdeG4I7OjgUdBZsMf657smJW/hFG0bM1MJOL8nwt6N1TlI0NpKmSJdE98f17lV3lMjwIfRXLRoLuUzoQPZs3GUO52nvmw3FwpsfbjFVyQxHhCntkW88M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057437; c=relaxed/simple;
	bh=oDKI0j+WD+jY3v7HbkXt6RrKiconS3S/JzTH21zqcns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ChUYHEclUxOjLCzjEhAFYf+m72bd7apr3r099XkKK8nOu/H9822kEqKMEGCSOXte1icOEDTxTQwfsr3voUgJiRTzyxO+19eZGxU7VfSyJxT8/0e5+8boosDHnvTS7coqHFcPZJTWkE/gh7dSDh6W0Vk3iMD+nCKrdRITgqLNWfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvbyeMNh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvbyeMNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790057435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4LFsA1Wv4zT8jSyoTBGe+bEYuce3SQbSkNKl9RsGmy0=;
	b=UvbyeMNh79FO2ZImUQ+E4ZTZUuEGZSIr/LEVMC1pxWD46QvtxtkQSdbRf0gS60VXf/AHw8
	VukyGpo8g+idVeZnQE8iv3ecpAyQaTLGOFeGLpKv5II0aw9oJKlVKIjVZtXGsRq8gkbvCw
	2QsR5Vx40VIAg7xn2QMtsEtDagirFqc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-5bBOtbvmNACu3i5ZR-AY0w-1; Tue, 22 Sep 2026 02:10:32 -0400
X-MC-Unique: 5bBOtbvmNACu3i5ZR-AY0w-1
X-Mimecast-MFC-AGG-ID: 5bBOtbvmNACu3i5ZR-AY0w_1790057431
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a615ab0c06so4759705a12.2
        for <fuse-devel@lists.linux.dev>; Mon, 21 Sep 2026 23:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057431; x=1790662231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LFsA1Wv4zT8jSyoTBGe+bEYuce3SQbSkNKl9RsGmy0=;
        b=D3oSDH0wZQId0hYStjIxK5Cc2aic5XQxSAWD/2eAtRkdyYIj/SUBMkjUVHVkYtcVJN
         U05ChdAvRzxfP/D0F3TYVnc5pNCMjgGt6O4M3Sn9Ar+fRbYCDL8virrd61DpqgOeLIjt
         1oYgK59mqQvmTpzS212T9SChkZeU2//pV66Ci6dask2wVxlh20Xf25JQvFEHjIl33acb
         8339F2fKn1owQXFi8R5UVfm7T1FH2nq4il7oQmCtDDuQTKHYXK+mX5fQ2iewyOZZma7k
         kmyGhZwnY/cK4dIGRUlsnEBFVnJvCp1xBCXgHOGjHadQgArrhNmdyJnshGimQenssOth
         a0Bg==
X-Gm-Message-State: AFuF++lNmKJe5H/3ipo6fF6Q+FBDfqlmKBz1c6cXsjyJYNpDBcsAMGL/
	CcnO7c4qt/0sAvaZwKCd3sX5lCceVMySPXqVowpoML80lLRXB/VlGBwPPEh2lnVgMkoeEYgPL4M
	jmoxJKU8ZhecJSMFpUCsahZDX3OndpKIMrstiAh81pCmar1jnkpdC7NRKIzvpwWlDn3dz3k89W8
	6IIRvVH8g1E1NJ4/vCv1YgIH8tS8NeK8kZeaR4k6rQcofNwns=
X-Gm-Gg: AYBFou0nemv7liDwB3LV5+RD0YI5yCmc5a2jjry8s1J1uSKGqG2vPM5Wjd601+9+Ic5
	qobDCwANOrpnTbWW8BUqoJW72kmbysRLT7JuWw9aLgTCJy0SxJhENkGvvU8qqenbZzT7+q/OwGl
	0tkRtiqQn3iL4DDsoFQPdRxCBUHYTzvKsLacMLiiOAIPAZWso9bI8iVylemF5yRz2WNWWSU5J0Y
	SCXWH+KEaQC8pXlN8qKE25WeHP1jABv1yUtbjJHgF9oWMLpJFqbMj2RaptKihOfL98l/1Q8WWej
	aN9fUpVBptbZCa/QJb/xDrr7VkMguMDUYM454y+JShkgJ6boInkKLZ3VAv2mpb9pN9o3c+U3vCY
	4gin1RjB0evwS7j7Cwsfi6LytjeW64RYuHrosOro4vkYwyU9/MCy6
X-Received: by 2002:a05:6402:4399:b0:6aa:734b:1a22 with SMTP id 4fb4d7f45d1cf-6aa734b1b3cmr6587250a12.28.1790057430886;
        Mon, 21 Sep 2026 23:10:30 -0700 (PDT)
X-Received: by 2002:a05:6402:4399:b0:6aa:734b:1a22 with SMTP id 4fb4d7f45d1cf-6aa734b1b3cmr6587218a12.28.1790057430338;
        Mon, 21 Sep 2026 23:10:30 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-111.pool.digikabel.hu. [85.66.37.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440df9asm449826a12.4.2026.09.21.23.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:10:29 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>
Subject: [PATCH 04/11] fuse: make fuse_backing_get() static
Date: Tue, 22 Sep 2026 08:10:04 +0200
Message-ID: <20260922061019.3320196-5-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922061019.3320196-1-mszeredi@redhat.com>
References: <20260922061019.3320196-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: htl_Pc_l97QprV2Fsuvi6uXp17ntC_qB-bnzZM8y8Ko_1790057431
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Since it's not used outside of backing.c.

Also remove the fuse_backing_lookup() stub from fuse_i.h, since it's called
only from passthrough.c.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/backing.c |  2 +-
 fs/fuse/fuse_i.h  | 11 -----------
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 472b6afa7dff..433fa3098d71 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -10,7 +10,7 @@
 
 #include <linux/file.h>
 
-struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
+static struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
 {
 	if (fb && refcount_inc_not_zero(&fb->count))
 		return fb;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index b7d8751ba2e0..6cd556a0aa59 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1267,24 +1267,13 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 
 /* backing.c */
 #ifdef CONFIG_FUSE_PASSTHROUGH
-struct fuse_backing *fuse_backing_get(struct fuse_backing *fb);
 void fuse_backing_put(struct fuse_backing *fb);
 struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, int backing_id);
 #else
 
-static inline struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
-{
-	return NULL;
-}
-
 static inline void fuse_backing_put(struct fuse_backing *fb)
 {
 }
-static inline struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc,
-						       int backing_id)
-{
-	return NULL;
-}
 #endif
 
 void fuse_backing_files_init(struct fuse_conn *fc);
-- 
2.54.0

