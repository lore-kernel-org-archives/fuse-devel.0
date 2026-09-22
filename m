Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B0A4A204F
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 06:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057452; cv=none; b=KZls6w4s5CWkiixetIyEMelISOWHCkRYJwxFUhNRxPk6svFCh8RtkE9t9VZigudfMNKHfTf92Yg+O2APvFYjYIpGTZwGBPQoZ6e9ynKF38X+N39F5xEHKtMtYqZDNtJ/gPJoOnu0RC6xIwTLm3H0zb7GuwRtvT8bBC+KkbM3W/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057452; c=relaxed/simple;
	bh=HJzzizSHZl0RK5PpH5LFJZ4Mu81iC+5UJNO8fNfc8RY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=tG7ysBe76dsY6loVPdlgJaJQJiIJ0n+PnJDjeqDKVmdta8J6NEANt/dGZwqkeNtXQQHozpBoBjJt5q+ow6jHknkhGXw91jzxDUHLfH+JchEZ2cBuodqNqS91IKao8DRZx013jMbIX1nUIN/iQ48qnzKdEYDo/3dKqoR1YZbwp1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RpvOwfTP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RpvOwfTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790057449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHJvscmxxBMP8SNwM+SRbF+qH15mZc/FFUoZbgr/o98=;
	b=RpvOwfTPSlcMUE+jurb9A2zjMXLzDL2B3EyFASFMoXhzZmtLI9rezaSzOPbzUpAbab0Y0W
	+FETtakoWb4JYLyNL6TBjZLZpUIpuvs8UyZk6g3gqpasdWcqlkOOrJJSckQfUbYWHpWRRu
	kFTmnXpi/XqOXOmM5BZWYCBsOrns/vk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-bFWgApIyP_ObAqUX9ue9jw-1; Tue, 22 Sep 2026 02:10:47 -0400
X-MC-Unique: bFWgApIyP_ObAqUX9ue9jw-1
X-Mimecast-MFC-AGG-ID: bFWgApIyP_ObAqUX9ue9jw_1790057446
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c2531b5afe6so59607466b.1
        for <fuse-devel@lists.linux.dev>; Mon, 21 Sep 2026 23:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057446; x=1790662246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iHJvscmxxBMP8SNwM+SRbF+qH15mZc/FFUoZbgr/o98=;
        b=cpR0kiP9zNytSdGe5c5cH8d+89PRLX26Vshwklo1xepcZqlGcPWVb/aFmEjwyKP+PD
         fnYG6XSbRNMlqHuRKBK/DhP8Ry+d4LvlmjiEULSSpr/Ahj89qFm5JcXL9qYIGjH1+T89
         Jm1aiAZHMi5SRtTE9KFP171Z/KeAagJmQcLswBci8oQzUQU9SnGSWkn4GDNJTERMz1aL
         +BlS+t29gMckBYVlu2d7/wU/f9ZBXQGRGQK+v0ch4/siTbndzxaaZ8V5SOMfCMe4WogT
         TjeRqIJFFqUIcZ1iD8HWC51TyBufA6V57R/qW5CChweeNiZbWiSGdh8TlwODPTxrzvQx
         3d4A==
X-Gm-Message-State: AFuF++m6ZCNlt9guymoQjS9EwaPPeOtjs2Or9WlBhBFIYPOTSTfRXmtK
	uB7OD+dSa6SVov8nWXX0bQ/S6tx7TnjsorbxQImiCNCtKlzTU7QJaGszqv64KJFh1CVvbrcLeGq
	PRcHF0oH3LC0/xv1gMVin8d7XZcMr66k0uzSDOGDL1mVaUkR5H7d3QE2WDQlTtEhxr4+OTvilJR
	cPFNhJ2QQA7MYM7wvdhEq2cWdQHftulhosRBlw1yI4e9NWDd0=
X-Gm-Gg: AYBFou0uW72lD6B26ZvL84cq1C5/9Dc0A9cglSZKgwua0KnoiydUmhM23PIaHJ56+b+
	jeAjSPT17LtU8cTESLKd0Hgvx/7Nk94Bs7zYL5rHF2eulzJbCZw7USX3rcpli1h/bHYSm1/drIj
	XNx5mUids94LSMzBEgIVqQtlWBFpdB0tfdUyvPUE7FystwBr1txe9zwkJfQdBlGXDLlO4SiSmda
	biG9KGZi+zy8e8OMvB6sg6YCaXRzEgK4bLDJY1zCV1pyQFkSRRv/sRfVCkFvv3uO5XH8m629Jz4
	UmM+3qLfVpiLlkwtTicC7yAD7JuMVI1YdfyH9emRfPuDCeqNlcGb4WZn6eKxXGpdvYz0qXsBF/f
	HuVxdNS3cOze9YWY9iqb7+F7TJnEvcxQkEEbpATfH0X8U2JyCjJph
X-Received: by 2002:a17:907:272b:b0:c29:d77b:d945 with SMTP id a640c23a62f3a-c2a8d716815mr141257166b.22.1790057446363;
        Mon, 21 Sep 2026 23:10:46 -0700 (PDT)
X-Received: by 2002:a17:907:272b:b0:c29:d77b:d945 with SMTP id a640c23a62f3a-c2a8d716815mr141254666b.22.1790057445944;
        Mon, 21 Sep 2026 23:10:45 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-111.pool.digikabel.hu. [85.66.37.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440df9asm449826a12.4.2026.09.21.23.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:10:44 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>
Subject: [PATCH 11/11] fuse: add support for striped backing
Date: Tue, 22 Sep 2026 08:10:11 +0200
Message-ID: <20260922061019.3320196-12-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: iGulTb2snY4kAslu0qNa2jfZLOeJ-ShpvSWJ1IgGK8c_1790057446
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add the FUSE_MAP_CYCLIC flag for FUSE_NOTIFY_MAP notifications to enable
creating striped maps.

This is just a set of regular extents that repeats after the end of the
last extent using a striping pattern (i.e. on the target backings the
stripes have a contiguous footprint).

Two additional limits apply compared to non-cyclic extent map population:

 - the size of the extents (chunk size) must be equal

 - the extents must start from zero offset and follow the previous without
   one with a gap.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/ext_map.c         | 27 ++++++++++++++++++++++++---
 fs/fuse/fuse_i.h          |  1 +
 fs/fuse/notify.c          |  2 +-
 include/uapi/linux/fuse.h |  4 +++-
 4 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/ext_map.c b/fs/fuse/ext_map.c
index c752b6ef0686..52f3fb0bb571 100644
--- a/fs/fuse/ext_map.c
+++ b/fs/fuse/ext_map.c
@@ -101,12 +101,18 @@ static int fuse_ext_map_iomap_begin(struct inode *inode, loff_t offset, loff_t l
 {
 	struct fuse_backing *fb = fuse_inode_backing(get_fuse_inode(inode));
 	struct fuse_iext *fie;
+	u64 ncycle = 0, seq_off = 0, addr, tmp;
 	loff_t ext_len;
 
 	if (!fb || fb->type != FUSE_BACKING_EXTMAP)
 		return fuse_EIO("missing or wrong type backing");
 
-	fie = fuse_find_extent(&fb->extents, offset);
+	if (fb->cycle_length) {
+		ncycle = offset / fb->cycle_length;
+		seq_off = ncycle * fb->cycle_length;
+	}
+
+	fie = fuse_find_extent(&fb->extents, offset - seq_off);
 	if (!fie)
 		return fuse_EIO("missing mapping");
 
@@ -119,9 +125,12 @@ static int fuse_ext_map_iomap_begin(struct inode *inode, loff_t offset, loff_t l
 	}
 
 	ext_len = fie->end - fie->start;
+	addr = fie->backing_offset;
+	if (check_mul_overflow(ncycle, ext_len, &tmp) || check_add_overflow(addr, tmp, &addr))
+		return fuse_EIO("extent address overflow");
 
-	iomap->offset = fie->start;
-	iomap->addr = fie->backing_offset;
+	iomap->offset = fie->start + seq_off;
+	iomap->addr = addr;
 	iomap->length = ext_len;
 	iomap->dax_dev = fie->backing->dax_dev;
 	iomap->type = IOMAP_MAPPED;
@@ -231,6 +240,7 @@ int fuse_ext_map_populate(struct fuse_conn *fc, struct fuse_notify_map_out *arg,
 	struct fuse_backing *fb;
 	unsigned int i;
 	int err;
+	u64 chunk_size = 0;
 
 	if (!arg->num_extents)
 		return fuse_EIO("no extents");
@@ -248,7 +258,18 @@ int fuse_ext_map_populate(struct fuse_conn *fc, struct fuse_notify_map_out *arg,
 		return -EINVAL;
 	}
 
+	if (arg->flags & FUSE_MAP_CYCLIC) {
+		chunk_size = ext[0].length;
+		err = -EINVAL;
+		if (check_mul_overflow(chunk_size, arg->num_extents, &fb->cycle_length))
+			goto err_put;
+	}
+
 	for (i = 0; i < arg->num_extents; i++) {
+		err = -EINVAL;
+		if (chunk_size && (ext[i].offset != chunk_size * i || ext[i].length != chunk_size))
+			goto err_put;
+
 		err = fuse_add_extent(fc, &fb->extents, &ext[i]);
 		if (err)
 			goto err_put;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 50b61e16a15f..a34db4ad4bc4 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -114,6 +114,7 @@ struct fuse_backing {
 		};
 		struct {
 			struct rb_root extents;
+			u64 cycle_length;
 		};
 	};
 	u64 backing_id;
diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
index ce6d85834ea5..cbaa953e9db5 100644
--- a/fs/fuse/notify.c
+++ b/fs/fuse/notify.c
@@ -453,7 +453,7 @@ static int fuse_notify_map(struct fuse_conn *fc, unsigned int size,
 	if (outarg.reserved[0] != 0 || outarg.reserved[1] != 0)
 		return -EINVAL;
 
-	if (outarg.flags & ~FUSE_MAP_BACKING_CREATE)
+	if (outarg.flags & ~(FUSE_MAP_BACKING_CREATE | FUSE_MAP_CYCLIC))
 		return -EINVAL;
 
 	ext = kvmalloc_objs(*ext, outarg.num_extents);
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 5368889710c7..c100e6d78f7e 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -259,7 +259,7 @@
  *  - add backing_id to fuse_backing_map
  *  - add FUSE_BACKING_IS_DEV (fuse_backing_map.flags)
  *  - add FUSE_BACKING_ID_64 (multiple structs)
- *  - add FUSE_MAP_BACKING_CREATE (fuse_notify_map_out.flags)
+ *  - add FUSE_MAP_CYCLIC, FUSE_MAP_BACKING_CREATE (fuse_map_out.flags)
  */
 
 #ifndef _LINUX_FUSE_H
@@ -1225,8 +1225,10 @@ struct fuse_notify_backing_close_out {
  * notify_map flags
  *
  * FUSE_MAP_BACKING_CREATE:	create backing with the supplied ID
+ * FUSE_MAP_CYCLIC:		map repeats after last extent
  */
 #define FUSE_MAP_BACKING_CREATE	(1 << 0)
+#define FUSE_MAP_CYCLIC		(1 << 1)
 
 struct fuse_notify_map_out {
 	uint64_t	backing_id;
-- 
2.54.0

