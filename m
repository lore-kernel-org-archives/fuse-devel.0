Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A8B5474F
	for <fuse-devel@lists.linux.dev>; Wed,  1 Jul 2026 00:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782864731; cv=none; b=WGtKfGjQvx/L2/FkDLPRJvBkmFysdk4KUoas3TIshPcOdLSYbHpH9c4uoK67Zc1TFikrfK/gJUqc7sO1BQ9BrVzxPv07hjvCHIBaLRcdVs0qdHwEuOZsxi23AKJsVi/FZWj4CrCSlKmDk6NHLQwD4OV0IeFixJt3+56YaSqwpMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782864731; c=relaxed/simple;
	bh=FNPAmZC9QW0FcXQDJ4HDqkQLOrQ452JWlOTpJCafqw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ibLg595G0onxUnpQZ+jxEty9BITPCW1CZZcJmfd7MarW58YwROeoLDLbIV5c7iBdf0r7wK5uGXwTyHLhanGqOvYKVJuuD2DOngpROfRWxV0Q0LsPNZBrVDlbWwhkGyewxHbCMZ5U2NuQ1alyNokGZEaFrgKnuBODCTyo75pbdMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0tH/4Z0; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0tH/4Z0"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-44ae264a785so17755fac.3
        for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 17:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782864729; x=1783469529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3CY3QZ2wnue9rhqKHqLfVQqYV670BNtYmleR0mKcr4=;
        b=d0tH/4Z0N3muO/lVb/PeeuT4GVxGdUsyw79s4J302/nUoYsFviJQQxdd1+S7ffn54K
         tQBscSJXVIaMkuBH1LuAmS+0lIQFxuV1ikhs3cl6RkL4vn31jdqGJSxrnfAJ0SxrEvpZ
         NuO4vG/A0LlLESBblRcKv3IWHeP+o2c/qAsDDOyM5mAnMOVlCwaTY4aVsG/w8UCtw3p/
         nsS4DV5q3iTo3ESspbKBTnUiqT6xwBw3n7hLhfQSj3m9pop8IkctcoBl2ciJmDvfLA3d
         LwDDThjlcX/UiqJjGrfZMnldGYUKl0uUVBWs/tlAGrlMTC5UVam5I00V/chIcxFqTprc
         Z/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782864729; x=1783469529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y3CY3QZ2wnue9rhqKHqLfVQqYV670BNtYmleR0mKcr4=;
        b=G+g+SkYxRzIQctDSle22yqvnCKvH/wOwHdC+XIhQgfskawE9X+FIEcwdwQPnWfYzmk
         33kD9K5Q5uuTiE4ILEx1bko9ga664x0kR+hDM86M1SY0cy6HRhhJiMeQ+R8sP8iZNIdB
         mcpIvUPDc5klwoG52KCGzGwBVDzHC8QJi8ULH34kSTOGNP0jRJ0QjCA/EXBGotHqi2BN
         bb4F3h0lGHylaN7qjfYmE5W/pLJZPM+E/GqLdHO0mBlm3tPsKAyiwMQlA+ZmOAVYzy3n
         uOocOz9w8WVvqcHK4e8TFSYKjNFh8YXHz+az7mO2JoBeAlHV8JS//52ESEhqJXxQ3AA3
         GH6w==
X-Forwarded-Encrypted: i=1; AHgh+RouoF1AEN/xL1iD9Kd/4ORJ3ZXHNJyv3Erz0fk2gYjp4+VCAMoaFpjzGUIJ+utIBdpfF199e4sJKBoN@lists.linux.dev
X-Gm-Message-State: AOJu0YyOm4y0MMMbKLMVqe0fUW29yHQj1m+tAvnq/IL9YUk6H7AjClTs
	9QR2bdqH/Q7ElLAaxpN4LZaCWn6Bsgk3riurwjl5xffzJ6CTpNP7DFYU
X-Gm-Gg: AfdE7clWLZpfoNo814ICQ9bva+XpG4xhXp4Swvo2hBvVIHuY3hOLOYVuQNrF0l1RxVr
	3ZgAZpn3XUjNx1LJcSTi60bzMhjfEHVxk7oApJkCDwA3adz3Jp01bHdqiTHGI6/YX2qQWrmVNrj
	ksrNTU9MkDSpdNGbDFZ3oWiZnB6CSGN8pZkosY+VJinpp+b43SHjj0o1zdNr47hp3pHDvPgxIIc
	9KAH6hYkX35MU20guBsl8FPKMQpfHRAQiga7R7WlU88AbBt6sOczrGcMxF+ZRIquYBlNoy99BPR
	Fgm1Ph+cRE8zaE7/WxWfRUHINx53fv/Sp4d4eFgZ2etbIYUq8QNVWSNKVMrQI8jsyWfvaolXxa4
	SN34qv+QAwayezf20j78a3Nfjb1ggHZKx4ihdsDWMN0fBwkO4Cl3eHMbChmG9CmJ0LQfX8aqmI1
	0Vbqgf53gSnuK36qWQnE3sGcj1KaQq5fHqgEqcFVotgROEkJz885a6ejfZG9Ux7o9L
X-Received: by 2002:a05:6871:7297:b0:448:ca59:a162 with SMTP id 586e51a60fabf-448dc9b8df0mr4555071fac.34.1782864729159;
        Tue, 30 Jun 2026 17:12:09 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:73::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44c685ae7a3sm272526fac.16.2026.06.30.17.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 17:12:07 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org,
	hch@lst.de
Cc: djwong@kernel.org,
	willy@infradead.org,
	hsiangkao@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>,
	German Maglione <gmaglione@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	fuse-devel@lists.linux.dev (open list:FUSE FILESYSTEM [CORE]),
	linux-kernel@vger.kernel.org (open list),
	virtualization@lists.linux.dev (open list:VIRTIO FILE SYSTEM)
Subject: [PATCH v2 14/18] fuse: convert iomap ops to ->iomap_next()
Date: Tue, 30 Jun 2026 17:09:29 -0700
Message-ID: <20260701000949.1666714-15-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260701000949.1666714-1-joannelkoong@gmail.com>
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert fuse iomap_ops to the new ->iomap_next() callback. This uses the
iomap_process() helper, which finishes the previous mapping if needed
and produces the next one. No functional changes are intended.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dax.c       | 10 ++++++++--
 fs/fuse/file.c      |  8 +++++++-
 fs/fuse/virtio_fs.c |  2 +-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 8b53625ac7ab..e8d8c9f5d728 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -653,9 +653,15 @@ static int fuse_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 	return 0;
 }
 
+static int fuse_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
+			   struct iomap *srcmap)
+{
+	return iomap_process(iter, iomap, srcmap, fuse_iomap_begin,
+			     fuse_iomap_end);
+}
+
 static const struct iomap_ops fuse_iomap_ops = {
-	.iomap_begin = fuse_iomap_begin,
-	.iomap_end = fuse_iomap_end,
+	.iomap_next = fuse_iomap_next,
 };
 
 static void fuse_wait_dax_page(struct inode *inode)
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index e052a0d44dee..5c0d400629cc 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -890,8 +890,14 @@ static int fuse_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	return 0;
 }
 
+static int fuse_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
+			   struct iomap *srcmap)
+{
+	return iomap_process(iter, iomap, srcmap, fuse_iomap_begin, NULL);
+}
+
 static const struct iomap_ops fuse_iomap_ops = {
-	.iomap_begin	= fuse_iomap_begin,
+	.iomap_next	= fuse_iomap_next,
 };
 
 struct fuse_fill_read_data {
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index df25d4faca41..84e699f88574 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -1024,7 +1024,7 @@ static void virtio_fs_cleanup_vqs(struct virtio_device *vdev)
 }
 
 /* Map a window offset to a page frame number.  The window offset will have
- * been produced by .iomap_begin(), which maps a file offset to a window
+ * been produced by .iomap_next(), which maps a file offset to a window
  * offset.
  */
 static long virtio_fs_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
-- 
2.52.0

