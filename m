Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270362;
	b=Uxry9J0KQxqRAkQae1t+4lJOZGNdTPf4BR1F6ln5tieukZMSSAWxLOSrxOSbyV5IXnYJ
	 /NucfERpz/DbuZCNOzlP/yLGpr1Nd172DN2cgD5l2z3Cu+tDV+35ndomJUwL7tuWF2vAM
	 mrGCgBQ+0FjM3VgSvtgO6HIFNdnF87N1T6M3oqrvLpCK4tOpDWgW8YupGBzr/or0osFfh
	 krF47r+MPn0J5kJ8ij+lEbeDwp824PB6g3j89dKGDfK6VNBd2SxtrMDC1ZnOAs9tD65+X
	 xSvmqDJB9W0WzJ7amhvByllvo+d+TBTPSiPwp9inzRiec60UHo+FQB3seRCh6jVPwaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cmIhezlVC3rHCXHI7CWbXYAAsMg4SBr1TxpHu1OVCHI=;
	b=hh+OTHAKY3uWBdrK7CGtyCNBOMHByuVWLLb5FFfDVAvWXFP7ozOVll2ZTCE+cE21mSLF
	 EyUTpuDq4V8W5OC42/pDasGaeODb8EeC7yKxeEhnHQglabDApQcSnucClzTkQi5LimUh3
	 C6fdls/qn9SGR+ln89F360cLMCZZjrYs1azK5VDYYEiRsNdNABTUC2II35aChUWfdL2w+
	 6LeoKqb7ks5nHZiJ6g3E71hZAm8tJzuduAGYtLGMZ6sKoLHt+dxyfTbPdWlxP7Qa0zy1g
	 MPg6MYlKcwNp3gs2K2qWGQH9ExoWDJw2a2H7EkHjI9oih8+uDo6/1pg9N3GyZWsP1dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XkWcwOMY;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF40F606A320
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF40F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XkWcwOMY
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso409536a12.1
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270360; x=1793875160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmIhezlVC3rHCXHI7CWbXYAAsMg4SBr1TxpHu1OVCHI=;
        b=XkWcwOMYFvE75gdAhhS4CPMapUmBsRg5a2N1NzaA+42QBqasyjIHEbdSZPCiUvvl4t
         tJFFtDKYligtU/R+/G/hwfaGpTHdJUeQ9j73nGe0nf6HJ9lu/zQIlREAr9Sb1ee3oPr9
         LuQi2CNlIysUgCijB3gf20Tch5+FLfzFCxQPyGtWnpLDYyYIGhYL8I11fhwa3YOTL7HN
         FJrAoXfhVIsRXnvWN2ebBAJcJzIua9wr2OGIyac9YB6D+lwiPFgUusGwBYgclCSP9j1H
         BXbvABGIhEWKpjel5w41Bu/9RlB2ZbpDHBqoZa3bO9WPqSkNaxkjmA/S714p7WE7ZjBf
         lOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270360; x=1793875160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmIhezlVC3rHCXHI7CWbXYAAsMg4SBr1TxpHu1OVCHI=;
        b=mNCmm/8C/H7WMqtrUzWVwfqRM/gO5+AQFKkK5KLwK+4jYvCS3tilH5dACu200wWpY5
         fby6F4akPhFXWOFSK585wEGM50ceL4i/dFZQHpD5aAWHqVp0wKbh5wJEiKw3GvzfSHLI
         3MzplZrMVGRH5HB2p38Y+DRwYd2AwS/XzLU3jPzYCcHnA5JgFy4LZHTSeWYhbvmW+vls
         B+0pQEumOeYFrpokXU3mJh760Bb3LZ8WPgX85P3aL12NlBAeLY5fJ/5PoL4StQDkOkjC
         e7iOENU2+oNFnykDw7MoX5v1YwyQBzI8WWLO+F5+oVvAYItsxCB4WFgOR/Q5pWRJosL2
         2Ehg==
X-Forwarded-Encrypted: i=1; AKwUvBwc6TZPrSMt5PGtmlIETO9tUN0NZ7Z0qs0ydvdlbx2n3ahvHy2b19uuYwikJGCWzqOzB2pzkJhZ32rS@lists.linux.dev
X-Gm-Message-State: AFq9FYJ+XnAtpScREx+JjS6o+412nrpbP74CVomUIgmJeZp+nnt6rZOv
	tx6htyU1bqQZecMU8qyzyf8nZB9eDcTXVREl6YdRn3vt12PiOrXjSIYD
X-Gm-Gg: AYBFou0UCEN+i9UDMydxrlnWDTLSMm2EnVAA3gKo7p6DVKnLBU2p96j8UQ44A+FnOSm
	epA/y7LOphNXuMNo2ZOywsPpzY5FRiWXHhU/k7+vzYGHsBRuhqwK1QZoTeGRgAyVlnlTjW1+/Y6
	cQWQdFRlNT7V4k9GhJdTwzJU1Sv7yhp9uCLAd5smHzlkg8Q1t4mr6EJefCWb2b6TRsBfVRUTwWu
	lNEVq+2TEmcyeOJyknMu7a3rRtjCdUB2OxBCy5OtHL6lHNdaW2SK5XrQpNJkICFc717zRbRYMJz
	2Ib4G8jVcpMXqgc4QF5qMZjuEUnGtKDktOPR38UhGd0eRgLQ55krIpjNGjRnjt6dLWBvywujj9j
	cMs029MDsmNpua6+p4hPgVuciobOTW8HdpbRtUAOnD2T9xxBDmGLc9J6fXErfMJAKV8gY75ovW0
	OdVOysBPc4iMUZAi2f7h70dFsEircA0GM+mFRBS3AOalo+5S3CZbnkErU7mukG6Pxt80tZPRV5p
	U9HI7p8VUmfa/SDnlhky7SV+r/LqeZIgUlqjmx25t5I4JRobYfg2MHIJ+DZy3hepCk2ph2Q9P5I
	P8ZBUyI+RA+m4SXyGJvw57DI8R7ev2RhKYRd0iEXLG9/MawC+fhAa0bCiXc6vD1jJZVWiui27do
	WGcaZzvJN9oCz
X-Received: by 2002:aa7:c957:0:b0:6b4:746a:1dcf with SMTP id 4fb4d7f45d1cf-6b49cc2044fmr2623076a12.43.1793270360146;
        Thu, 29 Oct 2026 03:39:20 -0700 (PDT)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49602346esm2535097a12.7.2026.10.29.03.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:39:19 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	Nirmoy Das <nirmoyd@nvidia.com>
Subject: [PATCH 04/16] ovl: add assertions in dir cache code
Date: Thu, 29 Oct 2026 11:39:08 +0100
Message-ID: <20261029103913.2785828-5-amir73il@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029103913.2785828-1-amir73il@gmail.com>
References: <20261029103913.2785828-1-amir73il@gmail.com>
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

Overlayfs may keep two different types of directory cache
merged (refcounted) and impure (not refcounted) in the inode.

They are mutually exclusive and an overlayfs directory is never
expected to switch between merged and impure modes.

Nevertheless it is hard to prove that races in the code are not
possible, so add assertions to fortify the code accessing the
directory cache to make sure it does not free the unexpected
cache type.

If an assertion fires the code may leak dir cache memory
but it will not access freed cache memory.

Suggested-by: Nirmoy Das <nirmoyd@nvidia.com>
Link: https://lore.kernel.org/r/20260511062057.2365769-1-nirmoyd@nvidia.com/
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/overlayfs/readdir.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/fs/overlayfs/readdir.c b/fs/overlayfs/readdir.c
index ba542a1920127..b875332107d31 100644
--- a/fs/overlayfs/readdir.c
+++ b/fs/overlayfs/readdir.c
@@ -36,6 +36,7 @@ struct ovl_cache_entry {
 struct ovl_dir_cache {
 	long refcount;
 	u64 version;
+	bool is_refcounted;
 	struct list_head entries;
 	struct rb_root root;
 };
@@ -479,13 +480,31 @@ static void ovl_seek_cursor(struct ovl_dir_file *od, loff_t pos)
 	od->cursor = p;
 }
 
+/*
+ * Merged (refcounted) and impure (not refcounted) caches are never
+ * expected to be mixed. On mismatch, detach the cache from the inode
+ * and leak it rather than misuse it. A merged cache is still freed by
+ * its last ovl_cache_put().
+ */
+static struct ovl_dir_cache *ovl_dir_cache_check(struct inode *inode,
+						 bool is_refcounted)
+{
+	struct ovl_dir_cache *cache = ovl_dir_cache(inode);
+
+	if (cache && WARN_ON(cache->is_refcounted != is_refcounted)) {
+		ovl_set_dir_cache(inode, NULL);
+		return NULL;
+	}
+	return cache;
+}
+
 static struct ovl_dir_cache *ovl_cache_get(struct dentry *dentry)
 {
 	int res;
 	struct ovl_dir_cache *cache;
 	struct inode *inode = d_inode(dentry);
 
-	cache = ovl_dir_cache(inode);
+	cache = ovl_dir_cache_check(inode, true);
 	if (cache && ovl_inode_version_get(inode) == cache->version) {
 		WARN_ON(!cache->refcount);
 		cache->refcount++;
@@ -498,6 +517,7 @@ static struct ovl_dir_cache *ovl_cache_get(struct dentry *dentry)
 		return ERR_PTR(-ENOMEM);
 
 	cache->refcount = 1;
+	cache->is_refcounted = true;
 	INIT_LIST_HEAD(&cache->entries);
 	cache->root = RB_ROOT;
 
@@ -698,7 +718,7 @@ static struct ovl_dir_cache *ovl_cache_get_impure(const struct path *path)
 	struct ovl_fs *ofs = OVL_FS(dentry->d_sb);
 	struct ovl_dir_cache *cache;
 
-	cache = ovl_dir_cache(inode);
+	cache = ovl_dir_cache_check(inode, false);
 	if (cache && ovl_inode_version_get(inode) == cache->version)
 		return cache;
 
@@ -710,6 +730,7 @@ static struct ovl_dir_cache *ovl_cache_get_impure(const struct path *path)
 	if (!cache)
 		return ERR_PTR(-ENOMEM);
 
+	cache->is_refcounted = false;
 	res = ovl_dir_read_impure(path, &cache->entries, &cache->root);
 	if (res) {
 		ovl_cache_free(&cache->entries);
-- 
2.55.0

