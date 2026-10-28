Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178767;
	b=lAlYWd+Q2K/5M4lkiddwFnqimvU1GKGc/wAoZh3ukuA7Giv1tLKtFnO4NQaSRiSzzmc/
	 nyfWWvJ2zKjdKrywPepedFQyUXYx44Q7EC9ywotWUl1liWdw9JAHOhCgic5jfdlLK8j60
	 8PHtjj/FdxUDMCNRK/Id1kGwyuG6GE8+FggMXK/1cxVE6/R9ADQFCqwbRJSH2Hs2tqX7Z
	 7+G5jYt3dl4DJkQr79dIxGqNvM/uZ+7KxBN+j8w/1IFIZL9Tp6dSGjkt1cjTx73cJd1vD
	 e22NAY5UtvCs5R4CdK3eu+nZms8OGnJJJLxgs8OzUqz9HAX/pLa0Bc3M5KQlqtnLZxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MoTPZQnlX2nPJ0sAMGAwwD/E342tMdpqRBPdbZ+Cego=;
	b=3a4nQ52qmV2dc9Zqd63F/58P0UOF51D8Q6e9YguhSIKX2SoxZjjkur6nc5YadsFil0Li
	 TpqT6m6ecOQHtHVC0CZLvE9kceQeWq5LPL+egEJauc7y973Smit5m/INqUTw8WV86BMA2
	 eSmHTrq9+FYv5o/Hf4iPiQgX08OJWlQI7c9xDNReRPm64Ei1INimMY1qSXUuILDfTRVxp
	 OYO9zNM7goJpCdAAXtSQJ81X0ZMn9XaVTpFAiMvrH5I8yIqoJpIMR+gFSS1ZZUv+CyyRR
	 ZCVIctqhIvDoM0V5RjSKTsVSVZNSKP/brG3uoctwwFAG0w1vlmRaiFVzDpFD4Us/5iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MseNtRDb;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8555E606A31A
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 09:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8555E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MseNtRDb
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so6519585e9.0
        for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 02:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178766; x=1793783566; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MoTPZQnlX2nPJ0sAMGAwwD/E342tMdpqRBPdbZ+Cego=;
        b=MseNtRDbAQr8K4ViyHAm61Y4d7VcjeKMv0Vnalgy42xL4mcg6MnzEjQOcJUXqQgWs7
         H+bZ+a8RP8yIEAdairECUrK3iyJLt61m6O0X6LCPKNazPBF8O7hWnKlyoBnzMhtfQKfK
         qshWpVNwt2Ds6VIrBxYAgnEs5kicWGVKTCy2cKmGxX01YFrI9IZF6Y8MrL7FVS1Bop0T
         OrHvKWElWYbcaQxJ7JZdAevdY3aGYEpBAMBdb5lzOwnLQaiLhHouxnOs54z0GjaNTZgg
         lY4lMw5fd8iQMEkdPNzeVKQbOpWpDloQ7asGpRvflJ1AW3m94ptWsbF5LRhpkOcnRszC
         sLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178766; x=1793783566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MoTPZQnlX2nPJ0sAMGAwwD/E342tMdpqRBPdbZ+Cego=;
        b=A9ot/dtCAtI2ipke/ij0QN+a3W0czQJTZhS+03I4y72tP3jaN/96ZxDUqVv+Mng4+O
         uyCTSf4QslPa2M4/zBARXV5qwjU1kBv45+VHhMHoigGnypPmHAuuIMmxDWnPPYUAoSdC
         0BWRceQxKlbNcsreB9HyZDtfkqdsloDCJlueoyCyiWk1ZnUat3NGhDEuE6/ih5g3syZJ
         Vf0CMFg1veEAeeHHSXoCqtHMRAVEiSWKMvtTi3pjvddCYZx7yWT0yOrMxYa7vrhyDfQy
         0b0233nfOU96Dbojo2FhA8R5IWskyO3YuS0eDJvV0BtGSm9nN2BCf8iu0Q6BDL8ZF3SD
         5+jQ==
X-Gm-Message-State: AFq9FYJ1dmNy5BEYZs/nIpeNtCGiKslxJqfc1ckz+NpgtvoxOnoNdTu9
	AHkUZcJpDhskxqqUlW9atHDksPXRCEaR1F1hdNT14WF2zb5PcRmWBYPF7t2usfSI
X-Gm-Gg: AYBFou086++xvSquZpUr1oXZVQkOfk/P0+FAXhTVi6GlM5/S7p5xNLsXff1eU+JSDkN
	I2l55QSE70FD+YRkLTyktrUGoVx0fkdRqROpDG3LC5g+ycmjqJ8Z7AWqzv4QRZnrO4bRI+FL0Yt
	kSeujBaKoSmqjyNizSVs8WqaVN6z2sTUk1Kgm5sHolL/8SUMvp3v+J3cLWh5JEiZEJEBu70BGab
	ENjyKZybteu25c/OHquyHSA6p6RkDG3b/nbkbpiJz+0augTiDq8HzF0jIyVB+8jq2aPA64TZICU
	mmZvVd5gCAPTRwdX9RmWZH3byxGnHRPAkM0wGhaZPVmowTfI79dEYUnLGN4pnzrNW/6GmLOQ5id
	zGhCOxEhjyro5Gv+X2xgvE5gtWuYxM98o0ZncNYJnbjaXYBUq8D7dKPPj+7lJ5F3Ui1bpMgA42W
	oLvrRueVA79tbryNIcQkLNQ73NIk3m3mV3LkCmHWDMgjsgHbfrT3jWvZSW+V1v80J5jAmEwKrSv
	Gs5eAETTYqSfDj8ZSsSiNUOvc6/y5STyVw5et82VQr7IR9c1zKlaQ0s2g65VEGrODbqS7TkwS+9
	BXfCb0pxB8Se1BUgoYbU/XD8guwQ11EBNfBClicdg6iPMnT0YFhoPuZ1XTJPagE=
X-Received: by 2002:a05:600c:3e15:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4a9961f3d36mr26003915e9.6.1793178765655;
        Wed, 28 Oct 2026 02:12:45 -0700 (PDT)
Received: from t480.fritz.box ([2001:a61:3a4e:c601:fc75:724e:6b78:3649])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c42b3c1sm33507215e9.6.2026.10.28.02.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:12:45 -0700 (PDT)
From: Han-Wen Nienhuys <hanwenn@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	Han-Wen Nienhuys <hanwenn@gmail.com>
Subject: [PATCH 1/7] fuse: forget READDIRPLUS entries that were not linked
Date: Wed, 28 Oct 2026 10:12:09 +0100
Message-ID: <20261028091215.914885-2-hanwenn@gmail.com>
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

The server takes a lookup reference for every entry of a READDIRPLUS
reply that has a nodeid, other than "." and "..", and the kernel drops
it with FORGET if it does not link the entry. Two error paths drop the
rest of the reply without doing so, leaking the references on the
server:

- parse_dirplusfile() returns -EIO at an entry with a bad name length
  or a '/' in its name, skipping the entries from there.

- If vm_map_ram() fails, the reply is not parsed at all. Before the
  reply buffer was backed by pages, its allocation failed before the
  request was sent.

Send FORGET for the entries from where parsing stopped. The reply is
read from the pages without mapping them, to also cover the second
case. An entry with a bad name length ends the walk, as the size of
the rest cannot be known. fuse_force_forget() now takes an inode, as
the walk has no file.

Fixes: 0b05b18381ee ("fuse: implement NFS-like readdirplus support")
Fixes: 4dd6f6d3085a ("fuse: back uncached readdir buffers with pages")
Signed-off-by: Han-Wen Nienhuys <hanwenn@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 fs/fuse/readdir.c | 76 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 8 deletions(-)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 83a1cc46fe47..f719545d5f59 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -265,9 +265,8 @@ static int fuse_direntplus_link(struct file *file,
 	return 0;
 }
 
-static void fuse_force_forget(struct file *file, u64 nodeid)
+static void fuse_force_forget(struct inode *inode, u64 nodeid)
 {
-	struct inode *inode = file_inode(file);
 	struct fuse_mount *fm = get_fuse_mount(inode);
 	struct fuse_forget_in inarg;
 	FUSE_ARGS(args);
@@ -286,10 +285,60 @@ static void fuse_force_forget(struct file *file, u64 nodeid)
 	/* ignore errors */
 }
 
+static void fuse_readdir_copy(struct page **pages, size_t off, void *dst,
+			      size_t len)
+{
+	while (len) {
+		size_t n = min(len, PAGE_SIZE - offset_in_page(off));
+
+		memcpy_from_page(dst, pages[off >> PAGE_SHIFT],
+				 offset_in_page(off), n);
+		dst += n;
+		off += n;
+		len -= n;
+	}
+}
+
+/*
+ * Forget the entries from @off to @end.  The pages are not mapped, as this
+ * also follows a failure of vm_map_ram().
+ */
+static void fuse_direntplus_forget(struct inode *dir, struct page **pages,
+				   size_t off, size_t end)
+{
+	while (end - off >= FUSE_NAME_OFFSET_DIRENTPLUS) {
+		struct fuse_direntplus direntplus;
+		struct fuse_dirent *dirent = &direntplus.dirent;
+		char name[2];
+		size_t reclen;
+
+		fuse_readdir_copy(pages, off, &direntplus,
+				  FUSE_NAME_OFFSET_DIRENTPLUS);
+		if (!dirent->namelen || dirent->namelen > FUSE_NAME_MAX)
+			break;
+		reclen = FUSE_DIRENTPLUS_SIZE(&direntplus);
+		if (reclen > end - off)
+			break;
+
+		fuse_readdir_copy(pages, off + FUSE_NAME_OFFSET_DIRENTPLUS, name,
+				  min_t(size_t, dirent->namelen, sizeof(name)));
+		if (direntplus.entry_out.nodeid &&
+		    !name_is_dot_dotdot(name, dirent->namelen))
+			fuse_force_forget(dir, direntplus.entry_out.nodeid);
+
+		off += reclen;
+	}
+}
+
+/*
+ * On error, returns in @parsed the offset of the first entry that was not
+ * linked.
+ */
 static int parse_dirplusfile(char *buf, size_t nbytes, struct file *file,
 			     struct dir_context *ctx, u64 attr_version,
-			     u64 evict_ctr)
+			     u64 evict_ctr, size_t *parsed)
 {
+	char *start = buf;
 	struct fuse_direntplus *direntplus;
 	struct fuse_dirent *dirent;
 	size_t reclen;
@@ -302,11 +351,11 @@ static int parse_dirplusfile(char *buf, size_t nbytes, struct file *file,
 		reclen = FUSE_DIRENTPLUS_SIZE(direntplus);
 
 		if (!dirent->namelen || dirent->namelen > FUSE_NAME_MAX)
-			return -EIO;
+			goto err;
 		if (reclen > nbytes)
 			break;
 		if (memchr(dirent->name, '/', dirent->namelen) != NULL)
-			return -EIO;
+			goto err;
 
 		if (!over) {
 			/* We fill entries into dstbuf only as much as
@@ -325,10 +374,15 @@ static int parse_dirplusfile(char *buf, size_t nbytes, struct file *file,
 
 		ret = fuse_direntplus_link(file, direntplus, attr_version, evict_ctr);
 		if (ret)
-			fuse_force_forget(file, direntplus->entry_out.nodeid);
+			fuse_force_forget(file_inode(file),
+					  direntplus->entry_out.nodeid);
 	}
 
 	return 0;
+
+err:
+	*parsed = buf - start;
+	return -EIO;
 }
 
 static struct page **fuse_readdir_alloc_buf(struct fuse_args_pages *ap, size_t *bufsize)
@@ -380,6 +434,7 @@ static int fuse_readdir_uncached(struct file *file, struct dir_context *ctx)
 	void *buf;
 	size_t bufsize = clamp((unsigned int) ctx->count, PAGE_SIZE, fc->max_pages << PAGE_SHIFT);
 	u64 attr_version = 0, evict_ctr = 0;
+	size_t nbytes, parsed = 0;
 	bool locked;
 	struct page **pages = fuse_readdir_alloc_buf(ap, &bufsize);
 
@@ -408,17 +463,22 @@ static int fuse_readdir_uncached(struct file *file, struct dir_context *ctx)
 		goto out;
 	}
 
+	nbytes = res;
 	buf = vm_map_ram(pages, ap->num_folios, -1);
 	if (!buf) {
 		res = -ENOMEM;
 	} else {
 		if (plus)
-			res = parse_dirplusfile(buf, res, file, ctx, attr_version, evict_ctr);
+			res = parse_dirplusfile(buf, nbytes, file, ctx, attr_version,
+						evict_ctr, &parsed);
 		else
-			res = parse_dirfile(buf, res, file, ctx);
+			res = parse_dirfile(buf, nbytes, file, ctx);
 
 		vm_unmap_ram(buf, ap->num_folios);
 	}
+	/* The server took lookup references also for entries not linked */
+	if (plus && res < 0)
+		fuse_direntplus_forget(inode, pages, parsed, nbytes);
 out:
 	kfree(ap->folios);
 	release_pages(pages, ap->num_folios);
-- 
2.56.0

