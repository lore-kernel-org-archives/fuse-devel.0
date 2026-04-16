Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A775A387357
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331074; cv=none; b=SOhmL1hJBeGEqQ9vtxwsNDA4p97/Vabxwkb0N0HuIJLuVoF0xYtfUBci4dqEIKPIC4Y76eARvOsc/bSyTUysNgAuK3TXkQ9T2KNYxJukMmdjK/AmWau54zqnZQ+GD6vy956+PpWDdwBS8rxcJXLLlfUjnZ+55/t8TEp/9ihHRkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331074; c=relaxed/simple;
	bh=+YTWH/lZVvfoLr0apXjAfpemYjGoHnEqjfudUq5/hSw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=qNANt8awbUNdVlwkEChpoQhvORdj1Nra1jqvjbVzkEBCLbBUSg0DZK3cYm3ktYJks0L4jldGmPneqFnwljYILcCwJY40+BP6Fv3wFfb40DvB4cmym3YmuXR5WHm9MXSqpBxV6ivw8ZnA0WwTN1Yuvai0FRU+JB9t1qqm90njv6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MXm7G9kV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MXm7G9kV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uzSqfcyXD4ximg6Y76NRYLAOye4Lg+D8CbgnM6EyGMI=;
	b=MXm7G9kV0sERBqoEDeXpvugF+0X1NlSn+O29sAsHWwGMOrRnvitWNWtlKdQ46IkuuBW4Bo
	aqYxH+1KouNE2uavF9zBgfF3uf5BnKTPlDdj8jtPK3TM8fL3HIi2vidCCuzL+EcmgFkWTT
	A5m/4xGXcgBB2vTesiCUqrccmyO3ECw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-cKNFAPYhNaS1noLMYawyYw-1; Thu, 16 Apr 2026 05:17:45 -0400
X-MC-Unique: cKNFAPYhNaS1noLMYawyYw-1
X-Mimecast-MFC-AGG-ID: cKNFAPYhNaS1noLMYawyYw_1776331064
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-488c16958e9so55124925e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331064; x=1776935864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uzSqfcyXD4ximg6Y76NRYLAOye4Lg+D8CbgnM6EyGMI=;
        b=NJ6ht79/SWk0yzWVHXq7+4EmPE/rKHVGLnJubHOI9+LIYvKGhp6wA3lnQSgRwJWSS2
         HbdSZSgG3O5xws8y7OfwWwPQaLvPQwqLcuLjmyc2yW52Q0+90S2RzMeCgVLPb6jrwNjC
         cpiNqEML5Hu/iw0GZRANNIlKOgU8DLpKhLpPi8intVv1V3IyVFJqsQvmcRrPaCME0LS1
         owQyhgzzg7pdjrw0c36X6fC+5UuH4OBfcD97WuqbJXnPEApjLyRGihH+OsaGKebrA22g
         3lnyuf0lKsOlzgYeLmjQ1TqELh7Sk1LhkNTv+50bXV6NvbfPKoCn1eGI/WtNvDPcKFQH
         BTRQ==
X-Gm-Message-State: AOJu0YzbR02Ncv5DrOsCDcwBL4uxq/mcM8DTmdPUnH9BsF1aKt/BoKQq
	YMe9o0qwEyhxVN1ovYxN+mmmvONOoOOFX0LYJROK66lCQTeYW3vHiB4sftGFmctiV7lOPNXthBs
	w0+nmRAESpYhWpFOBXl8ln8l6vcoQoM6Z4s6HNm5V4OOObO28vsw0sSLg3MM/wUP2f/Big5FZzv
	z0RgcdudDVoEl407aIpCE57gA5Ns+UUUz5pKbY5M2ozCGePZw=
X-Gm-Gg: AeBDietP7SAvFEMLBQoCLaALMVj1Bi5b4XWvfrO1cgNHvQg+3HoKLu7HpsPVpQsU5dG
	ra1B/nQEVGl/c9/GptdDDzlsiR7tvnGG8ldBuLlq+U17msaUmJZrbdiwsQkHGQeyPLTLmAvH6kT
	qX1haH+43wylZ8K9KNWN6h4D2MdbS44OOMXmQOM7Rs2i6oDPIRigcbIRNN1q2odWIfK47y6uDmj
	1Dm9Hwxrn1Lov/vqsAavsGR7xAv8p/ayqzc+JB5jvDQ4lAO5u1tw3uElZsgmaPKKDhJ633YjDZb
	PyyRq3DhDjht23mdV9i5hea35P+4uSLden02ljWK5R2luxigEw7AqKajwbYzAv2f6pJzCi8P+x4
	fqZbBw+YbT6BRTIb536eUCZkJjpTMzrHT3Ut4kSaWJKrkNsOZA01npe7gmLm41oThXtGqAFLrH5
	2IRSgovA==
X-Received: by 2002:a05:600c:45ce:b0:485:3e19:9e01 with SMTP id 5b1f17b1804b1-488d6890c9dmr345487165e9.28.1776331064101;
        Thu, 16 Apr 2026 02:17:44 -0700 (PDT)
X-Received: by 2002:a05:600c:45ce:b0:485:3e19:9e01 with SMTP id 5b1f17b1804b1-488d6890c9dmr345486675e9.28.1776331063538;
        Thu, 16 Apr 2026 02:17:43 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:42 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 31/32] fuse: alloc pqueue before installing fch in fuse_dev
Date: Thu, 16 Apr 2026 11:16:55 +0200
Message-ID: <20260416091658.462783-32-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: eQHG7NYMfWD1fJhl1PO464LfandOCixHUCzTrzcZc2M_1776331064
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Prior to this patchset, fuse_dev (containing fuse_pqueue) was allocated on
mount.  But now fuse_dev is allocated when opening /dev/fuse, even though
the queues are not needed at that time.

Delay allocation of the pqueue (4k worth of list_head) just before mounting
or cloning a device.

Various distributions (e.g. Debian/Fedora) configure /dev/fuse as world
writable, so the pqueue allocation should be deferred to a privileged
operation (mount) to prevent unprivileged userspace from consuming pinned
kernel memory.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.c        | 75 +++++++++++++++++++++++++++++++++-----------
 fs/fuse/fuse_dev_i.h |  3 ++
 2 files changed, 59 insertions(+), 19 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index d6cd066a3fff..6fbe6084c5ae 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -328,6 +328,7 @@ void fuse_chan_release(struct fuse_chan *fch)
 void fuse_chan_free(struct fuse_chan *fch)
 {
 	WARN_ON(!list_empty(&fch->devices));
+	kfree(fch->pq_prealloc);
 	kfree(fch);
 }
 EXPORT_SYMBOL_GPL(fuse_chan_free);
@@ -354,15 +355,30 @@ struct fuse_chan *fuse_chan_new(void)
 }
 EXPORT_SYMBOL_GPL(fuse_chan_new);
 
+static struct list_head *fuse_pqueue_alloc(void)
+{
+	struct list_head *pq = kzalloc_objs(struct list_head, FUSE_PQ_HASH_SIZE);
+
+	if (pq) {
+		for (int i = 0; i < FUSE_PQ_HASH_SIZE; i++)
+			INIT_LIST_HEAD(&pq[i]);
+	}
+	return pq;
+}
+
 struct fuse_chan *fuse_dev_chan_new(void)
 {
-	struct fuse_chan *fch = fuse_chan_new();
+	struct fuse_chan *fch __free(kfree) = fuse_chan_new();
 	if (!fch)
 		return NULL;
 
+	fch->pq_prealloc = fuse_pqueue_alloc();
+	if (!fch->pq_prealloc)
+		return NULL;
+
 	fuse_iqueue_init(&fch->iq, &fuse_dev_fiq_ops, NULL);
 
-	return fch;
+	return no_free_ptr(fch);
 }
 EXPORT_SYMBOL_GPL(fuse_dev_chan_new);
 
@@ -403,39 +419,42 @@ void fuse_chan_io_uring_enable(struct fuse_chan *fch)
 
 void fuse_pqueue_init(struct fuse_pqueue *fpq)
 {
-	unsigned int i;
-
 	spin_lock_init(&fpq->lock);
-	for (i = 0; i < FUSE_PQ_HASH_SIZE; i++)
-		INIT_LIST_HEAD(&fpq->processing[i]);
 	INIT_LIST_HEAD(&fpq->io);
 	fpq->connected = 1;
+	fpq->processing = NULL;
 }
 
-struct fuse_dev *fuse_dev_alloc(void)
+static struct fuse_dev *fuse_dev_alloc_no_pq(void)
 {
 	struct fuse_dev *fud;
-	struct list_head *pq;
 
 	fud = kzalloc_obj(struct fuse_dev);
 	if (!fud)
 		return NULL;
 
 	refcount_set(&fud->ref, 1);
-	pq = kzalloc_objs(struct list_head, FUSE_PQ_HASH_SIZE);
-	if (!pq) {
-		kfree(fud);
-		return NULL;
-	}
-
-	fud->pq.processing = pq;
 	fuse_pqueue_init(&fud->pq);
 
 	return fud;
 }
+
+struct fuse_dev *fuse_dev_alloc(void)
+{
+	struct fuse_dev *fud __free(kfree) = fuse_dev_alloc_no_pq();
+	if (!fud)
+		return NULL;
+
+	fud->pq.processing = fuse_pqueue_alloc();
+	if (!fud->pq.processing)
+		return NULL;
+
+	return no_free_ptr(fud);
+}
 EXPORT_SYMBOL_GPL(fuse_dev_alloc);
 
-void fuse_dev_install(struct fuse_dev *fud, struct fuse_chan *fch)
+static void fuse_dev_install_with_pq(struct fuse_dev *fud, struct fuse_chan *fch,
+				     struct list_head *pq)
 {
 	struct fuse_chan *old_fch;
 
@@ -453,20 +472,33 @@ void fuse_dev_install(struct fuse_dev *fud, struct fuse_chan *fch)
 		 *  - it was set to disconneted
 		 */
 		fch->connected = 0;
+		kfree(pq);
 	} else {
+		if (pq) {
+			WARN_ON(fud->pq.processing);
+			fud->pq.processing = pq;
+		}
 		list_add_tail(&fud->entry, &fch->devices);
 		fuse_conn_get(fch->conn);
 		wake_up_all(&fuse_dev_waitq);
 	}
 	spin_unlock(&fch->lock);
 }
+
+void fuse_dev_install(struct fuse_dev *fud, struct fuse_chan *fch)
+{
+	struct list_head *pq = fch->pq_prealloc;
+
+	fch->pq_prealloc = NULL;
+	fuse_dev_install_with_pq(fud, fch, pq);
+}
 EXPORT_SYMBOL_GPL(fuse_dev_install);
 
 struct fuse_dev *fuse_dev_alloc_install(struct fuse_chan *fch)
 {
 	struct fuse_dev *fud;
 
-	fud = fuse_dev_alloc();
+	fud = fuse_dev_alloc_no_pq();
 	if (!fud)
 		return NULL;
 
@@ -1632,7 +1664,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
 
 static int fuse_dev_open(struct inode *inode, struct file *file)
 {
-	struct fuse_dev *fud = fuse_dev_alloc();
+	struct fuse_dev *fud = fuse_dev_alloc_no_pq();
 
 	if (!fud)
 		return -ENOMEM;
@@ -2231,6 +2263,7 @@ static long fuse_dev_ioctl_clone(struct file *file, __u32 __user *argp)
 {
 	int oldfd;
 	struct fuse_dev *fud, *new_fud;
+	struct list_head *pq;
 
 	if (get_user(oldfd, argp))
 		return -EFAULT;
@@ -2254,7 +2287,11 @@ static long fuse_dev_ioctl_clone(struct file *file, __u32 __user *argp)
 	if (fuse_dev_chan_get(new_fud))
 		return -EINVAL;
 
-	fuse_dev_install(new_fud, fud->chan);
+	pq = fuse_pqueue_alloc();
+	if (!pq)
+		return -ENOMEM;
+
+	fuse_dev_install_with_pq(new_fud, fud->chan, pq);
 
 	return 0;
 }
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 3d945b20f8d5..f9364d4103d4 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -248,6 +248,9 @@ struct fuse_chan {
 	/* Maximum number of pages that can be used in a single request */
 	unsigned int max_pages;
 
+	/* Before being installed into fud, contains the preallocated pq array*/
+	struct list_head *pq_prealloc;
+
 	/** Connection aborted via sysfs, respond with ECONNABORTED on device I/O */
 	bool abort_with_err;
 
-- 
2.53.0

