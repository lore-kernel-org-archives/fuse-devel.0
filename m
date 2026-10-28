Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178769;
	b=halgTxmgxQS4frndd8AjqXSeRxeMqDk2jmXZtLWdbUkiXiLijCXm/LGhdxVGuwMoRlrm
	 vHvoZ+Jhkie+Pu7U7/wPlhGISCSbnBHYHycGd2OQaU4SoCXETmdsEPAdaQDU37ZxNsOIX
	 cowjUPowobjR6/xJC6qj/EPW69nULKbFqnYsAoVF8L+tFLyBvJ2Z8pK7J2Y8cw7EtNQ34
	 enLw0ekJ3AregslwqbLLAXoH1euQ8WZJR0m0Vj5V7oinl9qA7TyZXQcgLsV0qqzrmVjJj
	 3iUuPEwWCiOltQjOyoAcxYWYHCz+MCKSQP7Kci2aShEhgUN9Y6fOfHYNAYLg4xiM+Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6IxMrzviL/3ORUI+70sYBzrp5XksMtkHqi79/WbE2tY=;
	b=bw6JYYl8zjzRz58gGxvt5lq8TcngiNS0bF5Z6WD7f7Mg5UNdyi1pv2CGL8KBKdVsR49u
	 V/yxDzwC2m75VrZErErZx8j8QmCC4ud16+apdFEPGf1JMirwfY70hB3BlSueMV3hZsb2S
	 MG2ew9emGa7wSb5sIv9BTy3qdfUT+GDt+IhEbvTgv9yJPp3cAd7Y53/s90h5F+lUwfTwn
	 LRFjhQqq+KK+Z/EUENlp/g9KFybqfU6vbS9cixSstmuCCtbF3n4cGQgxQMbAfCAlEBhYj
	 MRsITll8HMeeh6kxKntM+KZucjd2M9hJ/765NgCi215/ZyNokiZwhXrP0PqziyJ1YsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HQ4/Ggcm";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581C9606A31A
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 09:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 581C9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQ4/Ggcm
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso5892815e9.1
        for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 02:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178767; x=1793783567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IxMrzviL/3ORUI+70sYBzrp5XksMtkHqi79/WbE2tY=;
        b=HQ4/GgcmrlACbyJ8U6EtY/I4ZZMcBwuR9zKG08G0qkPJWr4km2VkuE54WgT3VUthDE
         oZCr3Uk52JN7ddstItv3LW/PQ9D0b79F+SeFF5hxgdcRc4X/p9eSZww0lLMD/5cc/NNm
         sJQ7YUTrHidua62c9+JAWzDawNRwEB2YuxClx+OHzYvzOvEeDaoFvVMLCoqvGyEAj9vc
         YZj8TTMGfNTPldMp2pxVvaF9fkVutAi0iQKcKNWxXOWvNUYJIr+JGbLBs6J8QmAuwxRS
         OhaR7jJiUlDS0Dgriv5RBkaQzrliyTi5V0cuaUjlD7CX3IZbs+DHrwA6636IV6Dq7t3/
         iOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178767; x=1793783567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6IxMrzviL/3ORUI+70sYBzrp5XksMtkHqi79/WbE2tY=;
        b=PuChCUYIPsR6l9tswjHPNmKoLQ7ilpaVVFP25Y8siaMKZ+tylvosh57DFO1YTVmIqt
         veBGoqD/n20tGYz8S7J5TBti9dTbbPZ8WW7zeUJ65GVPJ0iW8DIVJT4OKKmGz2/gAJas
         DsrcQaSzwd6p9ABRN1gYQmWBGM6nblGrhvnoZQULlOOCYSTYlgpB7AOoZpqVIJ0TUAR+
         LzSTzZ8aW3O2RX8ccYBA8iRRVwA+h+s6K17vQdhtZc9uNd0K4+5sMBXjh4bbwg7G1kXP
         UPIFeqiAswNMWjOTqlB4ga/KYP7bMC3IcrnUepL/lKLJGLwEe6IJxG2sSYEiN2BVjzvW
         Ykow==
X-Gm-Message-State: AFq9FYL9IiCv52CVXSAhRUe6uuiFl73jM6KEriPGS9IcLhiex0IseEmx
	m/9Zm3VMrf2FsHK3TfX1wEMh2s1lcq7YBimO7hffJnlOXg5w318Vhz9J
X-Gm-Gg: AYBFou3uSVXhtIBnUD9plZoMZcQMrRu9Hli11c3N7mPxXwaW2YkBP3h+7aJWHma84Xs
	i+Fh9GcIz5r/k0fRCG3G4/35LUQP1ALzkB9koZEynb/wAx1R1lHtBm/YeEwgknhKHSUhjLeH87D
	382AKTn5tGqTtuB1omx79+zEZpm5LF88FyvETKvbkD12+wL35cWJM9q3+TNo8cu3OtJek2SEXPk
	ePW+/4Yup5h7pEgKgY9BOFPaCLMLXK1F1Fle5MDhpvNxu5zpV1mzvdXo4ZMd9nOmllecuqlShDf
	oQ+BMDjrBTeuok0DkPZrctHKFSJ5GacbpBb3V7nk6kBQhD4GxlG7iiIvaYcjPpACN6W0V2YbH4G
	XWxGjoL0ig61B54ACBuF7Lmuvv8Q+0IdDZh4tRNaUV6weyX7knXzMTu0x22iL5YEsR5cPwiY22T
	meNTz6rBrcpYiIM/5xzhR8iIMDEV1XUSgNyOB4foVfee9FV0+gum3NZ6IaT5K7Y+RnsPcZy49Qj
	N/UP7Agx/iyvNQ3DmZPz1NcOBtbCTNigqQ66/zjQ8TVonRMt1AnZgs2wqfUKUFo+5ww39lybjcD
	dwUD5l35urhiqnY+oWTqI6wBbCZbupMxAwMiIc/GciT1HqGF/OWpGXjS3LzO1Hk=
X-Received: by 2002:a05:600c:8183:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4a9677c92d0mr28979785e9.35.1793178766617;
        Wed, 28 Oct 2026 02:12:46 -0700 (PDT)
Received: from t480.fritz.box ([2001:a61:3a4e:c601:fc75:724e:6b78:3649])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c42b3c1sm33507215e9.6.2026.10.28.02.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:12:46 -0700 (PDT)
From: Han-Wen Nienhuys <hanwenn@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	Han-Wen Nienhuys <hanwenn@gmail.com>
Subject: [PATCH 2/7] fuse: add a negative lookup cache for directories
Date: Wed, 28 Oct 2026 10:12:10 +0100
Message-ID: <20261028091215.914885-3-hanwenn@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028091215.914885-1-hanwenn@gmail.com>
References: <20261028091215.914885-1-hanwenn@gmail.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Workloads that probe for names that do not exist (search paths, build
systems) send a FUSE_LOOKUP per probe, and negative dentries only help
from the second probe of each name. If the kernel knows all names in a
directory, it can answer these lookups itself.

Add a per-directory Bloom filter of names, consulted in ->lookup(): a
name that is not in it gets a negative dentry without a request, valid
until the filter expires. A false positive only costs the FUSE_LOOKUP
that would have been sent anyway. The dcache cannot hold this record,
as a reclaimed dentry looks like an absent name, and the readdir cache
is optional and evictable. The filter takes about 10 bits per name,
with probe positions derived from a 64-bit siphash of the name. The
filter is not consulted for LOOKUP_REVAL, with which the VFS retries a
walk after ESTALE to have the server asked, as for negative dentries.
Nothing installs a filter yet.

The filter is kept correct as follows:

- Create, mknod, mkdir, symlink, link and rename add the new name, also
  when the request fails, as it may have been applied before an
  interruption. Removals are not applied: a stale name costs a lookup.
  The filter is dropped once additions reach 1.5 times the count it
  was sized for, at about 5% false positives; names it already reports
  do not count.

- FUSE_NOTIFY_INVAL_ENTRY adds the name, whether or not it has a
  dentry, so that announcing a remote addition keeps the filter.
  FUSE_NOTIFY_INVAL_INODE on the directory drops it, and an epoch bump
  invalidates it.

- Every local modification bumps a generation counter. A listing is
  only installed if the counter is unchanged since the listing was
  started, so it need not be collected under a lock.

Negative dentries made from the filter get its expiry. A server that
adds a name remotely must send FUSE_NOTIFY_INVAL_ENTRY for it, the same
contract as for negative LOOKUP replies. A filter that expired or is
from an old epoch is freed by the next lookup that finds it.

Signed-off-by: Han-Wen Nienhuys <hanwenn@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 fs/fuse/Makefile    |   2 +-
 fs/fuse/dir.c       |  34 +++++-
 fs/fuse/dir_names.c | 260 ++++++++++++++++++++++++++++++++++++++++++++
 fs/fuse/fuse_i.h    |  37 +++++++
 fs/fuse/inode.c     |   5 +
 5 files changed, 332 insertions(+), 6 deletions(-)
 create mode 100644 fs/fuse/dir_names.c

diff --git a/fs/fuse/Makefile b/fs/fuse/Makefile
index da9e802d7ae1..5143de6702f1 100644
--- a/fs/fuse/Makefile
+++ b/fs/fuse/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_VIRTIO_FS) += virtiofs.o
 
 fuse-y := trace.o	# put trace.o first so we see ftrace errors sooner
 fuse-y += dev.o dir.o file.o inode.o control.o xattr.o acl.o readdir.o ioctl.o req_timeout.o req.o
-fuse-y += poll.o notify.o
+fuse-y += poll.o notify.o dir_names.o
 fuse-y += iomode.o
 fuse-$(CONFIG_FUSE_VDAX) += dax.o
 fuse-$(CONFIG_FUSE_PASSTHROUGH) += passthrough.o backing.o ext_map.o
diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 28516a1760e2..10efd6d32c0c 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -326,6 +326,7 @@ static void fuse_dir_changed(struct inode *dir)
 {
 	fuse_invalidate_attr_mask(dir, FUSE_STATX_MODDIR);
 	inode_maybe_inc_iversion(dir, false);
+	fuse_dir_names_changed(dir);
 }
 
 /*
@@ -622,6 +623,7 @@ static struct dentry *fuse_lookup(struct inode *dir, struct dentry *entry,
 	int err, epoch;
 	bool outarg_valid = true;
 	bool locked;
+	u64 neg_time = 0;
 
 	if (fuse_is_bad(dir))
 		return ERR_PTR(-EIO);
@@ -629,10 +631,17 @@ static struct dentry *fuse_lookup(struct inode *dir, struct dentry *entry,
 	fc = get_fuse_conn_super(dir->i_sb);
 	epoch = atomic_read(&fc->epoch);
 
-	locked = fuse_lock_inode(dir);
-	err = fuse_lookup_name(dir->i_sb, get_node_id(dir), &entry->d_name,
-			       &outarg, &inode);
-	fuse_unlock_inode(dir, locked);
+	/* After ESTALE, the VFS retries with LOOKUP_REVAL to ask the server */
+	if (!(flags & LOOKUP_REVAL) && entry->d_name.len <= fc->name_max &&
+	    fuse_dir_names_absent(dir, &entry->d_name, &neg_time)) {
+		inode = NULL;
+		err = -ENOENT;
+	} else {
+		locked = fuse_lock_inode(dir);
+		err = fuse_lookup_name(dir->i_sb, get_node_id(dir),
+				       &entry->d_name, &outarg, &inode);
+		fuse_unlock_inode(dir, locked);
+	}
 	if (err == -ENOENT) {
 		outarg_valid = false;
 		err = 0;
@@ -651,7 +660,9 @@ static struct dentry *fuse_lookup(struct inode *dir, struct dentry *entry,
 
 	entry = newent ? newent : entry;
 	fuse_dentry_set_epoch(entry, epoch);
-	if (outarg_valid)
+	if (neg_time)
+		fuse_dentry_settime(entry, neg_time);
+	else if (outarg_valid)
 		fuse_change_entry_timeout(entry, &outarg);
 	else
 		fuse_invalidate_entry_cache(entry);
@@ -886,6 +897,9 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 
 	err = fuse_simple_idmap_request(idmap, fm, &args);
 	free_ext_value(&args);
+	/* Also on error: an interrupted request may still have created it */
+	if (opcode == FUSE_CREATE)
+		fuse_dir_names_add(dir, &entry->d_name);
 	if (err < 0)
 		goto out_free_ff;
 
@@ -1014,6 +1028,8 @@ static struct dentry *create_new_entry(struct mnt_idmap *idmap, struct fuse_moun
 
 	err = fuse_simple_idmap_request(idmap, fm, args);
 	free_ext_value(args);
+	/* Also on error, see fuse_create_open() */
+	fuse_dir_names_add(dir, &entry->d_name);
 	if (err)
 		goto out_put_forget_req;
 
@@ -1278,6 +1294,8 @@ static int fuse_rename_common(struct mnt_idmap *idmap, struct inode *olddir, str
 	args.in_args[2].size = newent->d_name.len + 1;
 	args.in_args[2].value = newent->d_name.name;
 	err = fuse_simple_idmap_request(idmap, fm, &args);
+	/* Also on error, see fuse_create_open() */
+	fuse_dir_names_add(newdir, &newent->d_name);
 	if (!err) {
 		/* ctime changes */
 		fuse_update_ctime(d_inode(oldent));
@@ -1613,6 +1631,10 @@ int fuse_reverse_inval_entry(struct fuse_conn *fc, u64 parent_nodeid,
 	if (!S_ISDIR(parent->i_mode))
 		goto unlock;
 
+	/* Not for deletions; a new name has no dentry */
+	if (!child_nodeid)
+		fuse_dir_names_add(parent, name);
+
 	err = -ENOENT;
 	dir = d_find_alias(parent);
 	if (!dir)
@@ -2485,6 +2507,8 @@ void fuse_init_dir(struct inode *inode)
 	fi->rdc.size = 0;
 	fi->rdc.pos = 0;
 	fi->rdc.version = 0;
+	RCU_INIT_POINTER(fi->rdc.names, NULL);
+	fi->rdc.names_gen = 0;
 }
 
 static int fuse_symlink_read_folio(struct file *null, struct folio *folio)
diff --git a/fs/fuse/dir_names.c b/fs/fuse/dir_names.c
new file mode 100644
index 000000000000..b9b25e25baf8
--- /dev/null
+++ b/fs/fuse/dir_names.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * FUSE: Filesystem in Userspace
+ *
+ * Negative lookup cache.  A directory can carry a Bloom filter of its names,
+ * built from a complete listing supplied by the server.  A name that is not in
+ * the filter does not exist, so its lookup is answered without a request until
+ * the listing expires.  False positives only cause a FUSE_LOOKUP.
+ */
+
+#include "fuse_i.h"
+
+struct fuse_dir_names {
+	struct rcu_head rcu;
+	u64 expires;
+	int epoch;
+	/* number of bits - 1 */
+	u32 mask;
+	/* names added, and the limit before the false positive rate degrades */
+	unsigned int count;
+	unsigned int max_count;
+	unsigned long bits[];
+};
+
+/* About 1% false positives at the initial size */
+#define FUSE_DIR_NAMES_BITS_PER_NAME 10
+#define FUSE_DIR_NAMES_PROBES 7
+
+u64 fuse_dir_name_hash(struct fuse_conn *fc, const char *name,
+		       unsigned int len)
+{
+	return siphash(name, len, &fc->names_key);
+}
+
+static void fuse_dir_names_set(struct fuse_dir_names *names, u64 hash)
+{
+	u32 h1 = hash, h2 = (hash >> 32) | 1;
+	int i;
+
+	for (i = 0; i < FUSE_DIR_NAMES_PROBES; i++)
+		set_bit((h1 + i * h2) & names->mask, names->bits);
+}
+
+static bool fuse_dir_names_test(struct fuse_dir_names *names, u64 hash)
+{
+	u32 h1 = hash, h2 = (hash >> 32) | 1;
+	int i;
+
+	for (i = 0; i < FUSE_DIR_NAMES_PROBES; i++) {
+		if (!test_bit((h1 + i * h2) & names->mask, names->bits))
+			return false;
+	}
+	return true;
+}
+
+/*
+ * Allocate an empty filter sized for @count names.  Negative answers from it
+ * are valid until @expires, and only in @epoch.
+ */
+struct fuse_dir_names *fuse_dir_names_alloc(unsigned int count, u64 expires,
+					    int epoch)
+{
+	struct fuse_dir_names *names;
+	unsigned long nbits;
+
+	if (WARN_ON(count > FUSE_DIR_NAMES_MAX))
+		return NULL;
+
+	nbits = roundup_pow_of_two(max_t(unsigned long,
+					 count * FUSE_DIR_NAMES_BITS_PER_NAME,
+					 BITS_PER_LONG));
+	names = kvzalloc(struct_size(names, bits, BITS_TO_LONGS(nbits)),
+			 GFP_KERNEL_ACCOUNT);
+	if (!names)
+		return NULL;
+
+	names->expires = expires;
+	names->epoch = epoch;
+	names->mask = nbits - 1;
+	/* At 1.5 times the size, about 5% false positives */
+	names->max_count = 3 * nbits / (2 * FUSE_DIR_NAMES_BITS_PER_NAME);
+	return names;
+}
+
+/* Add a name to a filter that is not yet published */
+void fuse_dir_names_insert(struct fuse_dir_names *names, u64 hash)
+{
+	names->count++;
+	fuse_dir_names_set(names, hash);
+}
+
+void fuse_dir_names_discard(struct fuse_dir_names *names)
+{
+	kvfree(names);
+}
+
+/*
+ * The generation of @dir's names changes with every local modification, so a
+ * listing started at a generation is complete if it is unchanged.
+ */
+u64 fuse_dir_names_gen(struct inode *dir)
+{
+	struct fuse_inode *fi = get_fuse_inode(dir);
+	u64 gen;
+
+	spin_lock(&fi->rdc.lock);
+	gen = fi->rdc.names_gen;
+	spin_unlock(&fi->rdc.lock);
+
+	return gen;
+}
+
+/*
+ * Install @names as the filter of @dir, if the listing it was built from,
+ * started at generation @gen, is still complete.  Consumes @names.
+ */
+bool fuse_dir_names_publish(struct inode *dir, struct fuse_dir_names *names,
+			    u64 gen)
+{
+	struct fuse_conn *fc = get_fuse_conn(dir);
+	struct fuse_inode *fi = get_fuse_inode(dir);
+	struct fuse_dir_names *old = NULL;
+	bool published = false;
+
+	if (!time_before64(get_jiffies_64(), names->expires))
+		goto out;
+
+	spin_lock(&fi->rdc.lock);
+	if (gen == fi->rdc.names_gen &&
+	    names->epoch == atomic_read(&fc->epoch)) {
+		old = rcu_replace_pointer(fi->rdc.names, names,
+					  lockdep_is_held(&fi->rdc.lock));
+		names = NULL;
+		published = true;
+	}
+	spin_unlock(&fi->rdc.lock);
+
+	if (old)
+		kvfree_rcu(old, rcu);
+out:
+	kvfree(names);
+	return published;
+}
+
+void fuse_dir_names_changed(struct inode *dir)
+{
+	struct fuse_inode *fi = get_fuse_inode(dir);
+
+	spin_lock(&fi->rdc.lock);
+	fi->rdc.names_gen++;
+	spin_unlock(&fi->rdc.lock);
+}
+
+/* Removed names are not tracked: they stay in the filter */
+void fuse_dir_names_add(struct inode *dir, const struct qstr *name)
+{
+	struct fuse_conn *fc = get_fuse_conn(dir);
+	struct fuse_inode *fi = get_fuse_inode(dir);
+	struct fuse_dir_names *names, *old = NULL;
+	u64 hash;
+
+	/* Checked under the lock, as a listing may be published meanwhile */
+	spin_lock(&fi->rdc.lock);
+	fi->rdc.names_gen++;
+	names = rcu_dereference_protected(fi->rdc.names,
+					  lockdep_is_held(&fi->rdc.lock));
+	if (!names)
+		goto out;
+
+	hash = fuse_dir_name_hash(fc, name->name, name->len);
+	if (!fuse_dir_names_test(names, hash)) {
+		if (names->count >= names->max_count) {
+			old = names;
+			RCU_INIT_POINTER(fi->rdc.names, NULL);
+		} else {
+			fuse_dir_names_insert(names, hash);
+		}
+	}
+out:
+	spin_unlock(&fi->rdc.lock);
+
+	if (old)
+		kvfree_rcu(old, rcu);
+}
+
+void fuse_dir_names_invalidate(struct inode *dir)
+{
+	struct fuse_inode *fi = get_fuse_inode(dir);
+	struct fuse_dir_names *old;
+
+	spin_lock(&fi->rdc.lock);
+	fi->rdc.names_gen++;
+	old = rcu_replace_pointer(fi->rdc.names, NULL,
+				  lockdep_is_held(&fi->rdc.lock));
+	spin_unlock(&fi->rdc.lock);
+
+	if (old)
+		kvfree_rcu(old, rcu);
+}
+
+/* Called from ->free_inode(), after an RCU grace period */
+void fuse_dir_names_free(struct inode *dir)
+{
+	kvfree(rcu_dereference_protected(get_fuse_inode(dir)->rdc.names, 1));
+}
+
+static bool fuse_dir_names_current(struct fuse_conn *fc,
+				   struct fuse_dir_names *names)
+{
+	return names && names->epoch == atomic_read(&fc->epoch) &&
+	       time_before64(get_jiffies_64(), names->expires);
+}
+
+/* Free a stale filter early; called under rcu_read_lock() */
+static void fuse_dir_names_drop_stale(struct fuse_inode *fi,
+				      struct fuse_dir_names *names)
+{
+	bool drop;
+
+	spin_lock(&fi->rdc.lock);
+	drop = rcu_access_pointer(fi->rdc.names) == names;
+	if (drop)
+		RCU_INIT_POINTER(fi->rdc.names, NULL);
+	spin_unlock(&fi->rdc.lock);
+
+	if (drop)
+		kvfree_rcu(names, rcu);
+}
+
+/*
+ * Is @name known not to exist in @dir?  If so, return the time until which
+ * this is valid in @expires.
+ */
+bool fuse_dir_names_absent(struct inode *dir, const struct qstr *name,
+			   u64 *expires)
+{
+	struct fuse_conn *fc = get_fuse_conn(dir);
+	struct fuse_inode *fi = get_fuse_inode(dir);
+	struct fuse_dir_names *names;
+	bool absent = false;
+	u64 hash;
+
+	if (!rcu_access_pointer(fi->rdc.names))
+		return false;
+
+	hash = fuse_dir_name_hash(fc, name->name, name->len);
+
+	rcu_read_lock();
+	names = rcu_dereference(fi->rdc.names);
+	if (!fuse_dir_names_current(fc, names)) {
+		if (names)
+			fuse_dir_names_drop_stale(fi, names);
+	} else if (!fuse_dir_names_test(names, hash)) {
+		*expires = names->expires;
+		absent = true;
+	}
+	rcu_read_unlock();
+
+	return absent;
+}
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index c91af283aef2..2a75c9597811 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -33,6 +33,7 @@
 #include <linux/refcount.h>
 #include <linux/user_namespace.h>
 #include <linux/rhashtable-types.h>
+#include <linux/siphash.h>
 
 /** Default max number of pages that can be used in a single read request */
 #define FUSE_DEFAULT_MAX_PAGES_PER_REQ 32
@@ -229,6 +230,18 @@ struct fuse_inode {
 			 */
 			u64 iversion;
 
+			/**
+			 * @names: Bloom filter of the names, for negative
+			 * lookups, RCU protected
+			 */
+			struct fuse_dir_names __rcu *names;
+
+			/**
+			 * @names_gen: incremented on local modifications, to
+			 * detect incomplete listings
+			 */
+			u64 names_gen;
+
 			/** @lock: protects above fields */
 			spinlock_t lock;
 		} rdc;
@@ -653,6 +666,9 @@ struct fuse_conn {
 	/** @readdirplus_auto: Does the filesystem want adaptive readdirplus? */
 	unsigned readdirplus_auto:1;
 
+	/** @names_key: Key for hashing names in directory name filters */
+	siphash_key_t names_key;
+
 	/**
 	 * @async_dio: Does the filesystem support asynchronous direct-IO
 	 * submission?
@@ -1259,6 +1275,27 @@ int fuse_set_acl(struct mnt_idmap *, struct dentry *dentry,
 /* readdir.c */
 int fuse_readdir(struct file *file, struct dir_context *ctx);
 
+/* dir_names.c */
+
+/* Largest listing that gets a name filter */
+#define FUSE_DIR_NAMES_MAX (1U << 18)
+
+u64 fuse_dir_name_hash(struct fuse_conn *fc, const char *name,
+		       unsigned int len);
+struct fuse_dir_names *fuse_dir_names_alloc(unsigned int count, u64 expires,
+					    int epoch);
+void fuse_dir_names_insert(struct fuse_dir_names *names, u64 hash);
+void fuse_dir_names_discard(struct fuse_dir_names *names);
+u64 fuse_dir_names_gen(struct inode *dir);
+bool fuse_dir_names_publish(struct inode *dir, struct fuse_dir_names *names,
+			    u64 gen);
+void fuse_dir_names_changed(struct inode *dir);
+void fuse_dir_names_add(struct inode *dir, const struct qstr *name);
+void fuse_dir_names_invalidate(struct inode *dir);
+void fuse_dir_names_free(struct inode *dir);
+bool fuse_dir_names_absent(struct inode *dir, const struct qstr *name,
+			   u64 *expires);
+
 void fuse_free_conn(struct fuse_conn *fc);
 
 /* dax.c */
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 1341b681d0ed..c5229eed363d 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -121,6 +121,8 @@ static void fuse_free_inode(struct inode *inode)
 
 	mutex_destroy(&fi->mutex);
 	kfree(fi->forget);
+	if (S_ISDIR(inode->i_mode))
+		fuse_dir_names_free(inode);
 #ifdef CONFIG_FUSE_VDAX
 	kfree(fi->vdax);
 #endif
@@ -570,6 +572,8 @@ int fuse_reverse_inval_inode(struct fuse_conn *fc, u64 nodeid,
 
 	fuse_invalidate_attr(inode);
 	forget_all_cached_acls(inode);
+	if (S_ISDIR(inode->i_mode))
+		fuse_dir_names_invalidate(inode);
 	if (offset >= 0) {
 		pg_start = offset >> PAGE_SHIFT;
 		if (len <= 0)
@@ -983,6 +987,7 @@ void fuse_conn_init(struct fuse_conn *fc, struct fuse_mount *fm,
 	refcount_set(&fc->count, 1);
 	atomic_set(&fc->epoch, 1);
 	INIT_WORK(&fc->epoch_work, fuse_epoch_work);
+	get_random_bytes(&fc->names_key, sizeof(fc->names_key));
 	INIT_LIST_HEAD(&fc->entry);
 	fc->congestion_threshold = FUSE_DEFAULT_CONGESTION_THRESHOLD;
 	atomic64_set(&fc->khctr, 0);
-- 
2.56.0

