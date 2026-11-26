Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704449;
	b=cHQIOLqQBp288SkBI8lzBXd//bxgz75NRq348DdMXhPzWKutQswT7f0buOFOJwd4mYYZ
	 PXQi56T9KfMs3FqDQ9c14ihjoc8stwtjvQDdhWMiPAOaqyn0JWH2U8dx8FtWLcJozI0n+
	 9DtRVzG28mSOqHSiCIRuLh5koPtiEkGAYLLqycCrxRfSZP70E5hFqY0cgOx5V46xuPbc4
	 JKkUwfboC9d79Lq3KddkMVre1JB3wfAXxT9JkRSHtvoVPg6GzQfae+6A32f1UEjX/i6Vz
	 /Qr2c2dnG4HPzWhHspyajKXum+m//fnGECK6oQhYBsJwvCNO1SPbc/fbJmqGymgBnAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704449;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=FfRYHG7vpHVxNmVaLC0u/Bjda9EfuJdn6UBFGM2VUjo=;
	b=DfJZ5zbTvD5rLRI/cZmLHNlAKGHIdwY5EcWfsLKpogYYfVYHMq6ZVzfZOAtq4CQlKCtP
	 uvtyMiOrRdMHr6q0RiEqQ7kieWribH7ws304/MthaeGtYHG8HlxQw5PRQhLsX5yJVShlq
	 L1KhxcjN7KsQjLO5P4fvcWGQ3j9bZ0hzWums3z6hAtwMdWPgxO486UDdG+QoNQ/yDIzmW
	 dI2Y7GwNp3QewXHbP6hbmxKEUSfu8W7Vzr4DP3+pqF6aLz2bMtqs5RjMXHeBdZbTj4GTr
	 N1ZScUi8NJt9qEJ/7YRg3vHIgD5Uo9U5GHJm/7lPftBpvG9KnGGe3D0U1PxZKJ7Rt5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h5oZsdyT;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41921606A335
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 14:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41921606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h5oZsdyT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795704448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfRYHG7vpHVxNmVaLC0u/Bjda9EfuJdn6UBFGM2VUjo=;
	b=h5oZsdyTziDprtZx2i93kBfSQqksAIpQlVAWrt0geuMwc4uy/3YE1DsHvkPM/ujA6tRGrf
	F8y6s546E7KFVNORL4rNpP2X1GgSWVa4EtbvnmyYSwbn7qEoCv6gtXxYphIPusOlN+lP6E
	6UURYkE0E4PKtF0jnjk63fo3NmjmNm0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-1HFNCCwqP-KSC5udwop83w-1; Thu, 26 Nov 2026 14:47:26 +0000
X-MC-Unique: 1HFNCCwqP-KSC5udwop83w-1
X-Mimecast-MFC-AGG-ID: 1HFNCCwqP-KSC5udwop83w_1795704445
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4903fc8537aso4768676f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 06:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704445; x=1796309245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfRYHG7vpHVxNmVaLC0u/Bjda9EfuJdn6UBFGM2VUjo=;
        b=1jzpKBP7NuFglVnwtMNp/26rtMvbjSMUZjrqGfqNzFSoi6SqxuNWP23/nqRefRitjE
         AOzCW+ZoazwYlkUVGhFpIKhPWR2n50baGh1k0QkQDSsmVPUUD3uJNXYs23n6WTUWCAw3
         WeoezSlwX0xClBK50+N++Xqu4NwB/s0nYwC9n/uI5JFTgtKHOXYW/zhyyAaw7kwD0N+l
         oC9dec863VZ6rhOOBuG5LbrHiX6qWBhPIU5Vd9XWnPC17KjZPOvuR/gpowpxwEfHYICU
         pqOMwaQdxT1RRfg8r2xbkc57QtJRZy3FY+/ynGA9f6VHoMs3b06NDJXR/wKw7c4RHbUr
         fuqg==
X-Gm-Message-State: APuU4Z+k02DutnnbBKUzfHQqnRaDOtZWiilLrGSugbWY+XODWNEma6Dk
	OjjNuIF9ChrgbDfuEPPQC79DoQq9OrZf+qe/D98AQkyWmeVTlsFqbehtQrqnggaES+c3RDsCnI/
	kJC/0cmc1Md/zUn6u+CdmK1UV9PFaQHU5R9HXkOOk5sS6q+d2bbNSfRf4U/p1hve3fu+YCz2axF
	spLs1Eq70Xj1j+LM5WmWhZ5VP0xHrmM1qDXdjKR1xvt4/rDao=
X-Gm-Gg: AZFdTZfxNcBF2xL+sKx1D+uB47R2tVZ1RMCUtvTvc9/D0qD2STXqjpFmqMkqa7L33UV
	9mBfqyFXwnr715WCi8h3lth++lm2jQK+EhC3Wi3IJLbrdWdOvXGhitSse0CvE9SIkHthsaBfkvT
	InxJBpo/ANYY+TSxNUEI+fyR0LqmnGG/0q1yPfhos0dDF0kczXh6b/R8NGUqWvrrQhgQwWatRj2
	dy0/f7rQZp1QV5/LPO5LHwJDOkaeLjhuPyADpBTrXWIYe8Tx6Cza4HZNYWU7RNNwROpD+aw0FhY
	tG/NCwPwiYDVFlFeWFFq+AY2If9x1T+zXYatW/HUmS53gOCFgCexG/PReNQF1d0eOqMwpZKfTY1
	ptxQ4b4jl7lZpFWcU6dqWNnPnAJIT2Lvhz6R8mgWaXJOK1XuTfqhOoIAIwuNjtm+KsisOGY31+E
	Cjzd3TefQsY7cjmXI7TJC+jA9nmx8EKmXkhL2yFzq+
X-Received: by 2002:a05:600c:c84:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb8881f47emr439427015e9.25.1795704445059;
        Thu, 26 Nov 2026 06:47:25 -0800 (PST)
X-Received: by 2002:a05:600c:c84:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb8881f47emr439426315e9.25.1795704444517;
        Thu, 26 Nov 2026 06:47:24 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (193-226-214-34.pool.digikabel.hu. [193.226.214.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm388114905e9.0.2026.11.26.06.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:47:23 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	virtualization@lists.linux.dev
Cc: Li Wang <liwang@kylinos.cn>,
	German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 4/5] virtiofs: abort the connection if the server fails to unmap a DAX range
Date: Thu, 26 Nov 2026 15:47:17 +0100
Message-ID: <20261126144719.232329-4-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 4FPeP9J1cFisKlN_gRqF2cyT1RLu_MCrKyQD37FqpZc_1795704445
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

If FUSE_REMOVEMAPPING fails, at least one range is still mapped on the
server side.  Both callers return the ranges to the free pool regardless,
so the next allocation can hand one to a different inode while the server
still has it mapped, exposing one file's data in another.

The ranges cannot be reused, but they also cannot usefully be tracked.
The requests are sent in batches and the first failure aborts the rest, so
it is not known which of them the server did drop; and a server that
refuses a request it is required to honour will keep refusing, so every
range ends up retired one by one, with nothing to replenish the pool.
__fuse_dax_fault() then waits uninterruptibly in wait_event() for a free
range that can never arrive.  Quietly retiring ranges only delays the
failure and makes it worse when it comes.

Abort the connection instead.  No FUSE_SETUPMAPPING can succeed after
that, so no range is ever handed out again and the pool stays reusable
without any bookkeeping, which is why both callers can go back to
ignoring the error.  The abort is done in fuse_send_removemapping(),
synchronously, because it has to happen before the caller returns the
ranges to the free pool: deferring it would leave a window in which
another thread could allocate a range and map it on top of the one the
server kept.

A dead connection is not such a case: the server is not going to access
the ranges any more, so they stay reusable.  Test the connection rather
than matching on -ENOTCONN, which missed the -ECONNABORTED and -ENODEV
that fuse_chan_abort() ends requests with.  For that, add a
fuse_chan_connected() accessor, as fuse_chan is private to dev.c.

For the abort to mean what it says, a failure has to be the server's
fault and nothing else.  Send the request with args.force, which allocates
with __GFP_NOFAIL and waits uninterruptibly, so that neither a fatal
signal on the calling task nor a failed request allocation is mistaken
for a refusal.  The remaining kernel-side allocation failures were
addressed by the two preceding patches.

Note that the uninterruptible wait means an unresponsive server now hangs
the caller rather than letting a fatal signal out; the connection's
request timeout, if configured, is what breaks that.  This matches what
the rest of the eviction path already does.

Fixes: c2d0ad00d948 ("virtiofs: implement dax read/write operations")
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dax.c | 59 ++++++++++++++++++++++++++++++++++++++-------------
 fs/fuse/dev.c |  5 +++++
 fs/fuse/dev.h |  1 +
 3 files changed, 50 insertions(+), 15 deletions(-)

diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index c5bbb5d91026..ac84ada25a5a 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2020 Red Hat, Inc.
  */
 
+#include "dev.h"
 #include "fuse_i.h"
 
 #include <linux/delay.h>
@@ -229,6 +230,25 @@ static int fuse_setup_one_mapping(struct inode *inode, unsigned long start_idx,
 	return 0;
 }
 
+/*
+ * The server is required to drop the mappings it is asked to drop.  If it
+ * refuses, the ranges stay mapped on the server side, and handing one to
+ * another inode would expose one file's data in another.
+ *
+ * Rather than keep track of which ranges are still live, abort the
+ * connection.  No FUSE_SETUPMAPPING can succeed after that, so no range is
+ * ever handed out again and the pool can be reused without a second thought.
+ * The abort has to happen here, before the caller returns the ranges to the
+ * free pool, so that it cannot race with a concurrent allocation.
+ *
+ * A dead connection is not such a case: the server is not going to access
+ * the ranges any more, so they stay reusable.  Test the connection rather
+ * than matching on -ENOTCONN, which misses the -ECONNABORTED and -ENODEV
+ * that fuse_chan_abort() ends requests with.
+ *
+ * The request is sent with args.force so that neither a fatal signal nor a
+ * failed request allocation can be mistaken for the server refusing.
+ */
 static int fuse_send_removemapping(struct inode *inode,
 				   struct fuse_removemapping_in *inargp,
 				   struct fuse_removemapping_one *remove_one)
@@ -236,6 +256,7 @@ static int fuse_send_removemapping(struct inode *inode,
 	struct fuse_inode *fi = get_fuse_inode(inode);
 	struct fuse_mount *fm = get_fuse_mount(inode);
 	FUSE_ARGS(args);
+	int ret;
 
 	args.opcode = FUSE_REMOVEMAPPING;
 	args.nodeid = fi->nodeid;
@@ -245,7 +266,16 @@ static int fuse_send_removemapping(struct inode *inode,
 	args.in_args[1].value = inargp;
 	args.in_args[2].size = inargp->count * sizeof(*remove_one);
 	args.in_args[2].value = remove_one;
-	return fuse_simple_request(fm, &args);
+	args.force = true;
+
+	ret = fuse_simple_request(fm, &args);
+	if (ret && fuse_chan_connected(fm->fc->chan)) {
+		pr_err("fuse: server failed to remove DAX mapping, aborting connection.  count=%u offset=0x%llx len=0x%llx ret=%d\n",
+		       inargp->count, remove_one->moffset, remove_one->len,
+		       ret);
+		fuse_chan_abort(fm->fc->chan, false);
+	}
+	return ret;
 }
 
 static int dmap_removemapping_one(struct inode *inode,
@@ -340,7 +370,7 @@ static void inode_reclaim_dmap_range(struct fuse_conn_vdax *fcd,
 {
 	struct fuse_inode *fi = get_fuse_inode(inode);
 	struct fuse_dax_mapping *dmap, *n;
-	int err, num = 0;
+	int num = 0;
 	LIST_HEAD(to_remove);
 	unsigned long start_idx = start >> FUSE_DAX_SHIFT;
 	unsigned long end_idx = end >> FUSE_DAX_SHIFT;
@@ -365,11 +395,13 @@ static void inode_reclaim_dmap_range(struct fuse_conn_vdax *fcd,
 
 	WARN_ON(fi->vdax->nr < num);
 	fi->vdax->nr -= num;
-	err = dmap_removemapping_list(inode, num, &to_remove);
-	if (err && err != -ENOTCONN) {
-		pr_warn("Failed to removemappings. start=0x%llx end=0x%llx\n",
-			start, end);
-	}
+	/*
+	 * A failure is dealt with in fuse_send_removemapping(): either the
+	 * connection is already gone, or it has just been aborted because the
+	 * server refused.  Either way nothing can be mapped any more, so the
+	 * ranges are safe to return to the free pool.
+	 */
+	dmap_removemapping_list(inode, num, &to_remove);
 	spin_lock(&fcd->lock);
 	list_for_each_entry_safe(dmap, n, &to_remove, list) {
 		list_del_init(&dmap->list);
@@ -882,15 +914,12 @@ static int reclaim_one_dmap_locked(struct inode *inode,
 	interval_tree_remove(&dmap->itn, &fi->vdax->tree);
 	fi->vdax->nr--;
 
-	/* It is possible that umount/shutdown has killed the fuse connection
-	 * and worker thread is trying to reclaim memory in parallel.  Don't
-	 * warn in that case.
+	/*
+	 * A failure is dealt with in fuse_send_removemapping(), which aborts
+	 * the connection if the server refused.  The caller owns the mapping
+	 * either way.
 	 */
-	ret = dmap_removemapping_one(inode, dmap);
-	if (ret && ret != -ENOTCONN) {
-		pr_warn("Failed to remove mapping. offset=0x%llx len=0x%llx ret=%d\n",
-			dmap->window_offset, dmap->length, ret);
-	}
+	dmap_removemapping_one(inode, dmap);
 	return 0;
 }
 
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index b198cc729cba..c653aabf2449 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -424,6 +424,11 @@ unsigned int fuse_chan_num_waiting(struct fuse_chan *fch)
 	return atomic_read(&fch->num_waiting);
 }
 
+bool fuse_chan_connected(struct fuse_chan *fch)
+{
+	return READ_ONCE(fch->connected);
+}
+
 void fuse_chan_set_fc(struct fuse_chan *fch, struct fuse_conn *fc)
 {
 	fch->conn = fc;
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index dbffd5bed2f5..71f56e71c899 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -34,6 +34,7 @@ unsigned int fuse_chan_num_background(struct fuse_chan *fch);
 unsigned int fuse_chan_max_background(struct fuse_chan *fch);
 void fuse_chan_max_background_set(struct fuse_chan *fch, unsigned int val);
 unsigned int fuse_chan_num_waiting(struct fuse_chan *fch);
+bool fuse_chan_connected(struct fuse_chan *fch);
 void fuse_chan_set_fc(struct fuse_chan *fch, struct fuse_conn *fc);
 void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_param *param);
 ssize_t fuse_chan_send(struct fuse_chan *fch, struct fuse_args *args);
-- 
2.56.1

