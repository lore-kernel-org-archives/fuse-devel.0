Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3631248CD67
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 06:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057447; cv=none; b=Q46uv0StCAwDPqGx4XmXu0LY6cN2k7y6fK6uxcJQLdWD0nke14cSqmioYomJ8lTR7LCyq6HpQy5tJ2BeHK8vhvAqsuRIrXEixu1FBW5enOMA33hpCOOZXJ4rZqFP9O2HAX9L7bWXHYKwwYTmzOXCfs4kJw7NjGu67Mn5pURcBm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057447; c=relaxed/simple;
	bh=LjBvkPKycoKwXUMcvg09C5ow7SdAWXP3f9dTH2tN3XM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=L+y6RoPd/JlXTdh5z1H7eHfSDleC43FS8MsltW2Tsi0tfWVAzDwqg6AADE6pJ5/e07ZGX6AFI9bOwlwAANaTNQ6dbM6j1dnKT/zaiJ7vNNR5LiZMEMxRekSTY8+DzugbOzUkDDWp+sftQROtHahdV7qBowTOeeGOP2bxTYIOpO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QUJKiTT3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QUJKiTT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790057444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I6eahpWFB085b8ylgsY964Du71bpfmu65/WVuCNANa8=;
	b=QUJKiTT3MctAbNN7BN96haesBhLsXsKNryWUy5pvE3/U0yTDgI7zON/q+7Y+2tShG3zYSw
	dQbSyQpoSbffbi0CSoQax6B89BPQECCf5pZEtU9Lj7x4CQY5nJXrBA2fswpofm+EcOVT8W
	lBEjpdfGh6dfQiozYzsUENVeFxWa/f0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-eRkGamGfPI-CivSmWxA9bA-1; Tue, 22 Sep 2026 02:10:42 -0400
X-MC-Unique: eRkGamGfPI-CivSmWxA9bA-1
X-Mimecast-MFC-AGG-ID: eRkGamGfPI-CivSmWxA9bA_1790057442
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c252a2ae8e1so437282066b.1
        for <fuse-devel@lists.linux.dev>; Mon, 21 Sep 2026 23:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057441; x=1790662241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6eahpWFB085b8ylgsY964Du71bpfmu65/WVuCNANa8=;
        b=jokRIH6OrKIcQ39NobCwuOTSWEd6Uc9BcmNen7zlRDkdCDcSY0dpQbtBUhTSTYJXrK
         Hrl9wRzAWcfGvvJNdRDmJ0YvGExY6W8I/JPINZ3hBZmrdC8w95Rj0/DzrdmdR8gCpMtj
         0l/l++N+hptieaU8QBqmQJ7KdaukkE6CO8ybwjrklwlNTdDi5fbnTiEQqiSW+d9nYK+b
         V6xVFPXUvuoWxCP4FgO+aZv417XK7F7ZSXMbGHLH8ONnlBpqxc1c+9vVhrjd/+kQuDW3
         LfVTvgo+8d6MXlH/d8tNerX95PO7UmaxAZ817XV0u64hgPAiabdGtabDLBO0p6HWzKZE
         tzfA==
X-Gm-Message-State: AFuF++nHVJEN3iEUnlHBnlnXbFrmsBFiVCIi6GwS48ATn73alR+MUQmy
	+oqtcclIA24F3+OLMEAY2g9SAas06x0dgueHvb4SNrc+qZSI5GvReSESdsxE/VWuvcSUUXTQnsm
	Q12alwKMjY9UB+lIfmbVianC5iz16pK7abHanrb3z5jgn/UwOkpm0FiWWkqW2TwEmgLEiFbiBWT
	VCKW9BXHcE8XADc7i/wPFlvJA/sJbqMXbxUsfawQVFZyIZ8v8=
X-Gm-Gg: AYBFou33hGwG55QgrUu4l5X0UmUhSeE2MZ8Px5nMv9iwRiYVaG/sFtAaHV+6wWl3geP
	e2Oo6f8btDJkgNb7HaUYi6hi6P7KVy9z644Ww9rmThXatZAASVQWC/oziLh71adrCmBjLKak4Cz
	D7x9BNvBKBHxbpt7dX/4PefBlH0tlDRODq15lCL5mU9k5C7GJoN0+x49JSDJ1jWYo2qSmXNGSpX
	Iz9vsZIOuTtNNfausaGwsdf2q48EwdM0oVxPRkdMe8MCSi8pkxXPz+qkSKR7Nr7/12QyXVSkS7R
	I7BUOhjFrcGdZo9ovZNq4Lw2HLv0VrRhWRjD2Q2WT6OkGszLcByVixr46q47tOER4gT/dSKEHhv
	JCHBZBIaBJFLuaVFMHrU03atPCdnk3/PT1XY3xXMrq27RiCsDejAW
X-Received: by 2002:a17:906:f58e:b0:c29:448b:f5d4 with SMTP id a640c23a62f3a-c2a15b8902dmr1111140566b.35.1790057441403;
        Mon, 21 Sep 2026 23:10:41 -0700 (PDT)
X-Received: by 2002:a17:906:f58e:b0:c29:448b:f5d4 with SMTP id a640c23a62f3a-c2a15b8902dmr1111138866b.35.1790057440898;
        Mon, 21 Sep 2026 23:10:40 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-111.pool.digikabel.hu. [85.66.37.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440df9asm449826a12.4.2026.09.21.23.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:10:39 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>
Subject: [PATCH 09/11] fuse: add extent map data structure
Date: Tue, 22 Sep 2026 08:10:09 +0200
Message-ID: <20260922061019.3320196-10-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: BEUlBElXF0RbTygzuac_PjlJ-HiIXdsLzzOvE8bQkfo_1790057442
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add support for creating and managing extent maps that map file regions to
dax device regions.

Introduce FUSE_NOTIFY_MAP for populating extent maps from userspace.

Extent maps are handled as a new type of backing and are assigned a 64 bit
backing ID by the server.

One extent consists of

 - offset within the containing backing
 - length of extent
 - target backing ID
 - offset into target backing

Extents must be non-overlapping, and can only refer to dax device backings
for now.

At this point only support creating and populating the extent map in one
operation, though the interface is not limited by this and later may be
changed, so that partial population of an extent map would be possible.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/Makefile          |   2 +-
 fs/fuse/backing.c         |  23 +++++++
 fs/fuse/ext_map.c         | 129 ++++++++++++++++++++++++++++++++++++++
 fs/fuse/fuse_i.h          |  12 +++-
 fs/fuse/notify.c          |  41 ++++++++++++
 include/uapi/linux/fuse.h |  30 ++++++++-
 6 files changed, 234 insertions(+), 3 deletions(-)
 create mode 100644 fs/fuse/ext_map.c

diff --git a/fs/fuse/Makefile b/fs/fuse/Makefile
index 245e67852b03..139f37071a78 100644
--- a/fs/fuse/Makefile
+++ b/fs/fuse/Makefile
@@ -15,7 +15,7 @@ fuse-y += dev.o dir.o file.o inode.o control.o xattr.o acl.o readdir.o ioctl.o r
 fuse-y += poll.o notify.o
 fuse-y += iomode.o
 fuse-$(CONFIG_FUSE_DAX) += dax.o
-fuse-$(CONFIG_FUSE_PASSTHROUGH) += passthrough.o backing.o
+fuse-$(CONFIG_FUSE_PASSTHROUGH) += passthrough.o backing.o ext_map.o
 fuse-$(CONFIG_SYSCTL) += sysctl.o
 fuse-$(CONFIG_FUSE_IO_URING) += dev_uring.o
 
diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index aa558a0c2e64..484ca29e8aed 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -32,6 +32,10 @@ static void fuse_backing_free(struct fuse_backing *fb)
 	case FUSE_BACKING_DAXDEV:
 		fs_put_dax(fb->dax_dev, fb);
 		break;
+
+	case FUSE_BACKING_EXTMAP:
+		fuse_ext_map_destroy(&fb->extents);
+		break;
 	}
 	kfree_rcu(fb, rcu);
 }
@@ -252,9 +256,28 @@ static void fuse_backing_rht_free(void *p, void *data)
 
 void fuse_backing_files_free(struct fuse_conn *fc)
 {
+	struct rhashtable_iter iter;
+	struct fuse_backing *fb;
+
 	idr_for_each(&fc->backing_files_map, fuse_backing_idr_free, NULL);
 	idr_destroy(&fc->backing_files_map);
 
+	/*
+	 * extents are referencing other backings, put these refs before
+	 * destroying the backings themselves
+	 */
+	rhashtable_walk_enter(&fc->backing_64_ht, &iter);
+	rhashtable_walk_start(&iter);
+	while ((fb = rhashtable_walk_next(&iter))) {
+		/* Nothing changing the hash table, -EAGAIN not possible */
+		if (fb->type == FUSE_BACKING_EXTMAP) {
+			fuse_ext_map_destroy(&fb->extents);
+			fb->extents.rb_node = NULL;
+		}
+	}
+	rhashtable_walk_stop(&iter);
+	rhashtable_walk_exit(&iter);
+
 	rhashtable_free_and_destroy(&fc->backing_64_ht, fuse_backing_rht_free, NULL);
 }
 
diff --git a/fs/fuse/ext_map.c b/fs/fuse/ext_map.c
new file mode 100644
index 000000000000..e5d257fec88c
--- /dev/null
+++ b/fs/fuse/ext_map.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "fuse_i.h"
+#include <linux/rbtree.h>
+#include <linux/pagemap.h>
+
+struct fuse_iext {
+	struct rb_node rb;
+	u64 start;
+	u64 end; /* exclusive */
+	struct fuse_backing *backing;
+	u64 backing_offset;
+};
+
+void fuse_ext_map_destroy(struct rb_root *extents)
+{
+	struct fuse_iext *fie, *tmp;
+
+	rbtree_postorder_for_each_entry_safe(fie, tmp, extents, rb) {
+		fuse_backing_put(fie->backing);
+		kfree(fie);
+	}
+}
+
+static int fuse_add_extent(struct fuse_conn *fc, struct rb_root *extents,
+			   struct fuse_extent *ext)
+{
+	struct fuse_iext *new_fie __free(kfree) = kzalloc_obj(*new_fie);
+	struct rb_node *parent = NULL, **link = &extents->rb_node;
+	loff_t end;
+
+	if (!new_fie)
+		return -ENOMEM;
+
+	if (ext->reserved[0] || ext->reserved[1])
+		return fuse_EIO("reserved fields set");
+
+	if (!PAGE_ALIGNED(ext->offset) || !PAGE_ALIGNED(ext->length) || !PAGE_ALIGNED(ext->addr))
+		return fuse_EIO("not page aligned");
+
+	if (!ext->length)
+		return fuse_EIO("zero sized extent");
+
+	if (overflows_type(ext->offset, loff_t) ||
+	    check_add_overflow(ext->offset, ext->length, &end))
+		return fuse_EIO("offset overflow");
+
+	new_fie->start = ext->offset;
+	new_fie->end = end;
+	new_fie->backing_offset = ext->addr;
+
+	while (*link) {
+		struct fuse_iext *fie = rb_entry(*link, typeof(*fie), rb);
+
+		parent = *link;
+		if (new_fie->end <= fie->start)
+			link = &parent->rb_left;
+		else if (new_fie->start >= fie->end)
+			link = &parent->rb_right;
+		else
+			return fuse_EIO("overlap");
+	}
+
+	new_fie->backing = fuse_backing_lookup(fc, ext->backing_id, true);
+	if (!new_fie->backing)
+		return fuse_EIO("backing not found");
+
+	if (new_fie->backing->type != FUSE_BACKING_DAXDEV) {
+		fuse_backing_put(new_fie->backing);
+		return fuse_EIO("backing is not dax device");
+	}
+
+	rb_link_node(&new_fie->rb, parent, link);
+	rb_insert_color(&no_free_ptr(new_fie)->rb, extents);
+
+	return 0;
+}
+
+bool fuse_ext_map_is_dax(struct fuse_backing *fb)
+{
+	struct fuse_iext *fie;
+
+	if (WARN_ON(RB_EMPTY_ROOT(&fb->extents)))
+		return false;
+
+	fie = rb_entry(fb->extents.rb_node, typeof(*fie), rb);
+	return fie->backing->type == FUSE_BACKING_DAXDEV;
+}
+
+int fuse_ext_map_populate(struct fuse_conn *fc, struct fuse_notify_map_out *arg,
+			  struct fuse_extent *ext)
+{
+	struct fuse_backing *fb;
+	unsigned int i;
+	int err;
+
+	if (!arg->num_extents)
+		return fuse_EIO("no extents");
+
+	if (arg->flags & FUSE_MAP_BACKING_CREATE) {
+		fb = kzalloc_obj(*fb);
+		if (!fb)
+			return -ENOMEM;
+
+		refcount_set(&fb->count, 1);
+		fb->type = FUSE_BACKING_EXTMAP;
+		fb->backing_id = arg->backing_id;
+	} else {
+		/* Adding extents to an existing extmap backing is not yet supported */
+		return -EINVAL;
+	}
+
+	for (i = 0; i < arg->num_extents; i++) {
+		err = fuse_add_extent(fc, &fb->extents, &ext[i]);
+		if (err)
+			goto err_put;
+	}
+
+	err = 0;
+	if (arg->flags & FUSE_MAP_BACKING_CREATE) {
+		err = fuse_backing_add_64(fc, fb);
+		if (!err)
+			return 0;
+	}
+
+err_put:
+	fuse_backing_put(fb);
+	return err;
+}
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 00c124bcb88d..928e5c43e43c 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -28,7 +28,7 @@
 #include <linux/backing-dev.h>
 #include <linux/mutex.h>
 #include <linux/rwsem.h>
-#include <linux/rbtree.h>
+#include <linux/rbtree_types.h>
 #include <linux/poll.h>
 #include <linux/workqueue.h>
 #include <linux/kref.h>
@@ -96,6 +96,7 @@ struct fuse_submount_lookup {
 enum fuse_backing_type {
 	FUSE_BACKING_PATH,
 	FUSE_BACKING_DAXDEV,
+	FUSE_BACKING_EXTMAP,
 };
 
 /* Container for data related to mapping to backing file */
@@ -111,6 +112,9 @@ struct fuse_backing {
 			struct dax_device *dax_dev;
 			bool dax_error;
 		};
+		struct {
+			struct rb_root extents;
+		};
 	};
 	u64 backing_id;
 	struct rhash_head hash_node;
@@ -1360,4 +1364,10 @@ extern void fuse_sysctl_unregister(void);
 #define fuse_sysctl_unregister()	do { } while (0)
 #endif /* CONFIG_SYSCTL */
 
+/* ext_map.c */
+
+void fuse_ext_map_destroy(struct rb_root *extents);
+bool fuse_ext_map_is_dax(struct fuse_backing *fb);
+int fuse_ext_map_populate(struct fuse_conn *fc, struct fuse_notify_map_out *arg,
+			  struct fuse_extent *ext);
 #endif /* _FS_FUSE_I_H */
diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
index 7361b56bb973..ce6d85834ea5 100644
--- a/fs/fuse/notify.c
+++ b/fs/fuse/notify.c
@@ -429,6 +429,44 @@ static int fuse_notify_backing_close(struct fuse_conn *fc, unsigned int size,
 
 }
 
+static int fuse_notify_map(struct fuse_conn *fc, unsigned int size,
+			   struct fuse_copy_state *cs)
+{
+	struct fuse_notify_map_out outarg;
+	struct fuse_extent *ext __free(kvfree) = NULL;
+	int err;
+
+	if (size < sizeof(outarg))
+		return -EINVAL;
+
+	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
+	if (err)
+		return err;
+
+	if (outarg.num_extents > FUSE_MAX_EXTENTS)
+		return -EINVAL;
+
+	size -= sizeof(outarg);
+	if (size != outarg.num_extents * sizeof(*ext))
+		return -EINVAL;
+
+	if (outarg.reserved[0] != 0 || outarg.reserved[1] != 0)
+		return -EINVAL;
+
+	if (outarg.flags & ~FUSE_MAP_BACKING_CREATE)
+		return -EINVAL;
+
+	ext = kvmalloc_objs(*ext, outarg.num_extents);
+	if (!ext)
+		return -ENOMEM;
+
+	err = fuse_copy_one(cs, ext, size);
+	if (err)
+		return err;
+
+	return fuse_ext_map_populate(fc, &outarg, ext);
+}
+
 int fuse_notify(struct fuse_conn *fc, enum fuse_notify_code code,
 		unsigned int size, struct fuse_copy_state *cs)
 {
@@ -463,6 +501,9 @@ int fuse_notify(struct fuse_conn *fc, enum fuse_notify_code code,
 	case FUSE_NOTIFY_BACKING_CLOSE:
 		return fuse_notify_backing_close(fc, size, cs);
 
+	case FUSE_NOTIFY_MAP:
+		return fuse_notify_map(fc, size, cs);
+
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 1ba28a2885ad..5368889710c7 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -251,12 +251,15 @@
  *
  *  7.47
  *  - add FUSE_HAS_SYNCFS opt-in flag for privileged userspace servers
- *  - add FUSE_NOTIFY_BACKING_CLOSE
+ *  - add FUSE_NOTIFY_BACKING_CLOSE, FUSE_NOTIFY_MAP
  *  - add struct fuse_notify_backing_close_out
+ *  - add struct fuse_notify_map_out
+ *  - add struct fuse_extent
  *  - add backing_id_64 to fuse_open_out
  *  - add backing_id to fuse_backing_map
  *  - add FUSE_BACKING_IS_DEV (fuse_backing_map.flags)
  *  - add FUSE_BACKING_ID_64 (multiple structs)
+ *  - add FUSE_MAP_BACKING_CREATE (fuse_notify_map_out.flags)
  */
 
 #ifndef _LINUX_FUSE_H
@@ -718,6 +721,7 @@ enum fuse_notify_code {
 	FUSE_NOTIFY_INC_EPOCH = 8,
 	FUSE_NOTIFY_PRUNE = 9,
 	FUSE_NOTIFY_BACKING_CLOSE = 10,
+	FUSE_NOTIFY_MAP = 11,
 };
 
 /* The read buffer is required to be at least 8k, but may be much larger */
@@ -1217,6 +1221,30 @@ struct fuse_notify_backing_close_out {
 	uint64_t	reserved;
 };
 
+/**
+ * notify_map flags
+ *
+ * FUSE_MAP_BACKING_CREATE:	create backing with the supplied ID
+ */
+#define FUSE_MAP_BACKING_CREATE	(1 << 0)
+
+struct fuse_notify_map_out {
+	uint64_t	backing_id;
+	uint32_t	num_extents;
+	uint32_t	flags;
+	uint64_t	reserved[2];
+};
+
+#define FUSE_MAX_EXTENTS 1638
+
+struct fuse_extent {
+	uint64_t	offset;		/* offset of extent into file */
+	uint64_t	length;		/* extent length */
+	uint64_t	backing_id;	/* target backing */
+	uint64_t	addr;		/* target offset within backing file/device */
+	uint64_t	reserved[2];
+};
+
 #define FUSE_SETUPMAPPING_FLAG_WRITE (1ull << 0)
 #define FUSE_SETUPMAPPING_FLAG_READ (1ull << 1)
 struct fuse_setupmapping_in {
-- 
2.54.0

