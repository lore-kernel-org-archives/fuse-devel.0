Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704447;
	b=cfT15ezSpVJYzXzrbH1I4ajSwh6SVPb3rouWZTGs9NNpZmauFbfYm5pyfxTmWMPbUpR7
	 Dn8WC/5ySW2HPWqBAgW6MF17BukDY+bl52dQJE3jZ/xmbBosQNcRuL9GOCcEu1Vem+2ih
	 Zgc4zOF0IHtU3EBbEUQDO8oHS1OEzsafbHfB2XAkBaUMTNQacZn0BbKMDQb+knCnBQM4B
	 5sKUZjd93sR+56p2ghC+qCv4C09zutHIQSWYliOKlg+gG/+aEG3ls/jLCrdzsznn1RUZl
	 qiI3obHGPlaXLcw+ffHLLH9ZMowwV3l9Lq34kybEiGpm2Et8V85HW9ZpDhOVsMjSLYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704447;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=Iqfmd6XAEkIO50L1hun+5wUwYYa1P9cDT/Kb3FgMUxk=;
	b=Dz8DIthLm9dJausxquoJnYUgD8YDRAZNsmiJtWygFnJ6rUFocbfhJybPdfJ3drJVUm22
	 +c8AQO9lugNKsGJlBxalLmqiWIVFHm7/N0gHJqqfDViuYGvDx4HnujtKxqpKE4f73c1vA
	 ZssIHq1RUKWBC+Z8cjan8UMjxR44j7l+VdyLQrdKP9x97nKve83M1Kf2DLB0hvxSsOQdq
	 TM44wKnL2KMbaUSIYrNOlzXIxFLMGA/zleb3+GnrSSACD/rTp5ltfQ8HqlLvyiON+R421
	 hotS/k1cmdOpr6ui/iH4wdzoRbFqMVhXksplISj0vo0HJ6USZmENzK3hgqS9cffEzZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GNjFi1El;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CC9606A323
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 14:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42CC9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GNjFi1El
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795704446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iqfmd6XAEkIO50L1hun+5wUwYYa1P9cDT/Kb3FgMUxk=;
	b=GNjFi1ElGmeWFN3ef2N+U9x/P0w4McW/xnd0veRgqebFYNxvX72oOmZWwqq/k0IYuggCKu
	IH9AURjubvr4/H7zTs0vuMRNOkFlkC3xrnZXf55qjWaEZyOa1tHX9upYSIZcet+Sn1nVH1
	NGy2jjXu7UNjMSpgL/Qh8i2y1hrS6/0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-FWxWBEXkMXmbAGAr1L06hw-1; Thu, 26 Nov 2026 14:47:24 +0000
X-MC-Unique: FWxWBEXkMXmbAGAr1L06hw-1
X-Mimecast-MFC-AGG-ID: FWxWBEXkMXmbAGAr1L06hw_1795704443
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bba856092dso13232775e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 06:47:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704443; x=1796309243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iqfmd6XAEkIO50L1hun+5wUwYYa1P9cDT/Kb3FgMUxk=;
        b=F04El2bRlJolo6jMbSQ+Vt+Vp5Axch1GSQIFLpIOgkW8pYy4W7XREMhzKP5qTEOfT4
         nyt6/2R/4Mo6R9kMvZahH7V9J0i4Jhs1b8Fx01GnkPX/IfWoAJ7yjcmNzza3T2a0CzKf
         ouh3AFv9oSgDvJ+AmgR/Wfxwck7XZuVzNuGjDsM4YnGcfeiogD1BSFfp08iIdjVHZ8TU
         OPDl1OFXezCMcu6G1JUOAXQ7dv8r6kuoDQxCLPDXhd+0C05AAGx3Uv6p+pooS3VBcp/x
         TdMjrwgJeMzOmRm6wG9NTIYOzUogLLOGjMHRnCpyMDheepff/fPt8B4drLZ9UFsOXP63
         Fl5w==
X-Gm-Message-State: APuU4Z+1pLrnP97nMDvdyhp50in6+M0qxT0tJj4/9e9hdx1c9H6QEIct
	dC0DnzHujATopAqDP2eA2rmgr+/bWarzJ6V5+JsFj+UtPUA6dJhQ/0sDJa1P7IKRCwqDmQ026j6
	sjRSchp9MM3+ZfUCnMJfPfZYl/xmL6GhBjVOItzwoPY8VBn4k/3aVty3Vjm67hQYmYOkxDCgov5
	moEy+KILEdFAhTthPTf23A25fsP4sc1xivHSg0VHc8byv2OU0=
X-Gm-Gg: AZFdTZcgD8OSc5R/Mq4j4xr4nJsNzxcei8mFn2VSLZfix9SzNWDKnnA71kZ/LffkNVW
	vW9deXrehIrQMLG0f/rF7mTbNwyXrmf96gj9A+cYFibvDLxlzjE6bay6Mb3kpltx/cuMhY1QJRb
	Dj+UaQhuuN/cSu4oFMzx457843ndFgAy12qYkvVU/hAgmC1TT9N/ha+Wq8N6EsWcuIrpIgeqVJe
	Jh4nMk59yaAI1JDd5Y+LjITkjkoSRcwMpmTSdZ3pYcimRwRLwvy5Y6qs+LoXTfsdo3RrUwnNrw5
	nklKU1xbPt8JCb+D4UopZU4mh791jBro8rA81yoxjuwPBVJxpYZ8QDh9nR63JZpxUhxjIYqNEGO
	07sI65LCkihZyP6Y2/JxlouAoHgJOAGtHIUvL+nD7Tjn07fTpRj6+1niMXi6CIEVrRcA6Tc3efz
	GkIZk4wQ7iLEL9CL0/h1oHXxed/5SkgjPx3Xbalamc
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr431883025e9.4.1795704442971;
        Thu, 26 Nov 2026 06:47:22 -0800 (PST)
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr431882695e9.4.1795704442556;
        Thu, 26 Nov 2026 06:47:22 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (193-226-214-34.pool.digikabel.hu. [193.226.214.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm388114905e9.0.2026.11.26.06.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:47:21 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	virtualization@lists.linux.dev
Cc: Li Wang <liwang@kylinos.cn>,
	German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 2/5] virtiofs: don't abort DAX removemapping on allocation failure
Date: Thu, 26 Nov 2026 15:47:15 +0100
Message-ID: <20261126144719.232329-2-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126144719.232329-1-mszeredi@redhat.com>
References: <20261126144719.232329-1-mszeredi@redhat.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vLodjTvtVFKGEVkWkVWlmyu1cTif9TKrKsg2Y42B-tk_1795704443
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

dmap_removemapping_list() allocates an array of fuse_removemapping_one
entries to batch the FUSE_REMOVEMAPPING request, and returns -ENOMEM if
that fails.  The only caller, inode_reclaim_dmap_range(), has no way to
recover: it just warns and returns the ranges to the free pool, where
they can be handed to another inode while the server still has them
mapped.  The request is never retried either, so a single failed
allocation is enough to lose the removal.

The allocation is up to FUSE_REMOVEMAPPING_MAX_ENTRY (PAGE_SIZE / 16)
entries, i.e. a page, and it is GFP_NOFS.  Inode eviction and the DAX
free worker are exactly the paths that run under memory pressure, so
this is not hypothetical.

The batch array is only a convenience: dmap_removemapping_one() already
sends a single entry entirely from the stack.  Move it above
dmap_removemapping_list() and use it to remove the ranges one at a time
when the array cannot be allocated.  That is slower, but it cannot fail
for lack of memory, and it only happens under memory pressure.

While at it, initialize ret, which was left uninitialized if the list
passed in was empty.  The current caller checks for that beforehand, so
this is not a bug today.

Fixes: c2d0ad00d948 ("virtiofs: implement dax read/write operations")
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dax.c | 49 +++++++++++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index e20a5ae6fecc..c5bbb5d91026 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -248,18 +248,46 @@ static int fuse_send_removemapping(struct inode *inode,
 	return fuse_simple_request(fm, &args);
 }
 
+static int dmap_removemapping_one(struct inode *inode,
+				  struct fuse_dax_mapping *dmap)
+{
+	struct fuse_removemapping_one forget_one;
+	struct fuse_removemapping_in inarg;
+
+	memset(&inarg, 0, sizeof(inarg));
+	inarg.count = 1;
+	memset(&forget_one, 0, sizeof(forget_one));
+	forget_one.moffset = dmap->window_offset;
+	forget_one.len = dmap->length;
+
+	return fuse_send_removemapping(inode, &inarg, &forget_one);
+}
+
 static int dmap_removemapping_list(struct inode *inode, unsigned int num,
 				   struct list_head *to_remove)
 {
 	struct fuse_removemapping_one *remove_one, *ptr;
 	struct fuse_removemapping_in inarg;
 	struct fuse_dax_mapping *dmap;
-	int ret, i = 0, nr_alloc;
+	int ret = 0, i = 0, nr_alloc;
 
 	nr_alloc = min_t(unsigned int, num, FUSE_REMOVEMAPPING_MAX_ENTRY);
 	remove_one = kmalloc_objs(*remove_one, nr_alloc, GFP_NOFS);
-	if (!remove_one)
-		return -ENOMEM;
+	if (!remove_one) {
+		/*
+		 * The ranges are not reusable until the server has dropped
+		 * the mappings, and the request is never retried, so failing
+		 * here would take them out of use for good.  Fall back to
+		 * removing them one at a time, which needs no allocation;
+		 * slow, but this only happens under memory pressure.
+		 */
+		list_for_each_entry(dmap, to_remove, list) {
+			ret = dmap_removemapping_one(inode, dmap);
+			if (ret)
+				break;
+		}
+		return ret;
+	}
 
 	ptr = remove_one;
 	list_for_each_entry(dmap, to_remove, list) {
@@ -350,21 +378,6 @@ static void inode_reclaim_dmap_range(struct fuse_conn_vdax *fcd,
 	spin_unlock(&fcd->lock);
 }
 
-static int dmap_removemapping_one(struct inode *inode,
-				  struct fuse_dax_mapping *dmap)
-{
-	struct fuse_removemapping_one forget_one;
-	struct fuse_removemapping_in inarg;
-
-	memset(&inarg, 0, sizeof(inarg));
-	inarg.count = 1;
-	memset(&forget_one, 0, sizeof(forget_one));
-	forget_one.moffset = dmap->window_offset;
-	forget_one.len = dmap->length;
-
-	return fuse_send_removemapping(inode, &inarg, &forget_one);
-}
-
 /*
  * It is called from evict_inode() and by that time inode is going away. So
  * this function does not take any locks like fi->vdax->sem for traversing
-- 
2.56.1

