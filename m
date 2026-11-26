Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704446;
	b=swaDmulhCFoUPOfttE5pHrH/2rS1j5FhvHMrySj6H67d289yBLJi4T2YlejjSsD8Uf87
	 u074LMDsdc4N2sRKDHeJI1VKC3cKUxTx4BTowc6DoMe96MVpq+xrjqpGEJL9R6EOVWGhm
	 zXieJ5EAvpOOecnfOLRnXJ1+CUPP240ivWI1G84PNMxes0hEi3rctPIEb1fuIiKIZV4tb
	 xudnc1LTPMT36izObt4JJ7sqB8clG+t3p1TCu3UN6wMjdOm10phLMH+v6FPTOu1lJIAis
	 WWiI5dYx/V0616FU3t4MUDaB7+yq+W1rk8T9A8xvO50qTU5TpT6/0ZpPGHExh3Vylxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704446;
	h=DMARC-Filter:DKIM-Signature:X-MC-Rep:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=YifvtI16dohalgScYWshuikeWghBJ/xe0p4EKREtgkU=;
	b=ZKboNuuFgBmSvDAQAirVTX3Qj/tF9IEw0q8MnYjff9+SOuxFasjTnHycjGcBMOQqcpVH
	 9rMVqu2MVoQWsHkydOIR0g+p+jOYfk9WfymjRY0LSW3aKxa5dhrPX3n6Y0GM10o6XUgAs
	 IJZU5WqJzsTWtbQqoEZv1WkvonY3jUx/jS5P4KxvT7purlwFE1aP16ZxCivFB/bMoLQx6
	 VyJQ4QX5bdi0tqsfg8HHqUSpF20iDFd4kOqNxSEVaJYNvsDGpulnv7xyzTwhMrz00hNVA
	 giW8Vl0d+OeWxLZd5wt+S0dhdjOr5FA1UPPQMcEDok8urBxwANmIurRNJd2k1+yv/NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MCa2SOK1;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F25606A33C
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 14:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F25606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MCa2SOK1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795704445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YifvtI16dohalgScYWshuikeWghBJ/xe0p4EKREtgkU=;
	b=MCa2SOK1o7JgUXca/aELERmbX2N0/NeE7vTittutQw/qPYUeGVQ4m4oyNlhp7+vfLvav1Y
	m7lrGv9pnelIX/RDpUdCmgEHci+TyHAL9UxAZw4ZvY8JDXMJfRZnxrimMH/UT8R9t9yyIJ
	4rl4Jh339su9/kmYaAT0ELwvzhpUWUY=
X-MC-Rep: binary re single
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-8aO81y_kOXGp9RsNbL3xPw-1; Thu, 26 Nov 2026 14:47:23 +0000
X-MC-Unique: 8aO81y_kOXGp9RsNbL3xPw-1
X-Mimecast-MFC-AGG-ID: 8aO81y_kOXGp9RsNbL3xPw_1795704442
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bba5f21b85so11864715e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 06:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704442; x=1796309242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YifvtI16dohalgScYWshuikeWghBJ/xe0p4EKREtgkU=;
        b=Ny+fZjDJ0ZAYxr5M/UwkWEG8jVT8PXfwOeyNMf2MzyqBrzqH955t83H01goKKcr80L
         NEuk4tkJ/b/+kSRmiJlz+b60qrD9fx4I5v5mxLx/65/X0Km34g7sOJrzdCJdrS7HI/IX
         X+Y21U5zv+VjelleT2EWt9JWkswVCXDLH3ClbxKnwHCNtRDq3RUkmVJe1eZYHe8xM0Fi
         iEtK3O2alo7gRgrKiSKu99DRdzwcRwuGCIvgUl0CatiL8cqPw4JBvrRZsGeAd9qZcXW6
         3Wmzqv8w21uGxeY4VQgfDsXlR3NjotJuad/kmNcSRon2pdd5Nr9K9P+IEb7FlvJKWHTl
         786Q==
X-Gm-Message-State: APuU4Z9oIzhydtfT75lgxjNSit3YVxmsL2vOFwuSvIlbhhxaDXxJDaoC
	b0ROSOVsPlOMpr3+PMIOThVcMVjmlBRr7Fz0N70y/nH61y0VwW937JnZb9mEIjopva6EZx4Ulix
	bStS0oGKL8cS0rraZLaEOOiN7VE6uY6eqpks6PDf0SgkIR8SbTt+EYV5jN2kvGkeZ0M8/SeXbpw
	lsqJfGmAaz2kfAnehRgP73zWJw7HdreOEX4zIziJxyalcObWs=
X-Gm-Gg: AZFdTZcV07IN77jk7cS1VqnB/B6dHC3A3MlIXsJps5BHVYhYs1ZFcblFQLa0aAgjGYH
	oyqntXeBgsxfZzNjYUqUEIKEoDuJoOkuZKe39AnlFYmLqujs9/TedL5sIcTfpmkC+nriIlC5ndy
	jSGDgVQN2duaavppkzrsu/Bk8foHxWv4uxoPdUPcMktK1cp/25LvcaWfzoJPaYMSZ4FbhuLzQZO
	faia8E4YFTyVoPDx366E6qiDjATzn2hdy7jbKaf2palIv/IxEs3wgC7SQpAHli5q+DvfoCNP5aI
	dnl+K4MEY5kGd1IGZMa5x9q4GdRiPL8afIoCrA/Y7/qqOke8owFPt8UPLIjmnvXRRRufSnpw0mE
	z5nS2L/Bg38/7rSQwC1ODtbDcsPTCpn+yF4+DvAFZtRE46flpGmSAoqhR6qNLVB4bj1yhrJWzwk
	Ua//yvOKrJrfBCZWPSXGswdtEdMvXp9EBGiura4n4Z
X-Received: by 2002:a05:600c:4e0b:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb887fb66cmr446667305e9.5.1795704441890;
        Thu, 26 Nov 2026 06:47:21 -0800 (PST)
X-Received: by 2002:a05:600c:4e0b:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb887fb66cmr446666735e9.5.1795704441481;
        Thu, 26 Nov 2026 06:47:21 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (193-226-214-34.pool.digikabel.hu. [193.226.214.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm388114905e9.0.2026.11.26.06.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:47:20 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	virtualization@lists.linux.dev
Cc: Li Wang <liwang@kylinos.cn>,
	German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 1/5] virtiofs: fix DAX range leak on unmount
Date: Thu, 26 Nov 2026 15:47:14 +0100
Message-ID: <20261126144719.232329-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.1
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
X-Mimecast-MFC-PROC-ID: p5o51ewbzGISpX3xVF1fvWSh0SEPYcxMR8tlom6GNco_1795704442
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

generic_shutdown_super() clears SB_ACTIVE before calling evict_inodes(),
so at unmount time fuse_evict_inode() skipped fuse_vdax_inode_cleanup()
for every remaining inode.  The DAX ranges owned by those inodes stay on
fc->vdax->busy_ranges instead of being returned to the free pool, and
fuse_vdax_conn_free() only frees free_ranges before kfree()ing the
connection, so the busy fuse_dax_mapping objects are leaked.  Nothing
warns about it: fuse_free_inode() kfree()s fi->vdax without checking
that the interval tree is empty.

Call fuse_vdax_inode_cleanup() regardless of SB_ACTIVE.  That is what
virtio_fs_conn_destroy() has always assumed ("Soon evict_inodes() will
be called which will free all memory ranges belonging to all inodes").
Unlike the FORGET in the same block, which is pointless once DESTROY has
been sent, the DAX cleanup is the only thing there that owns memory.

On a full unmount virtio_fs_conn_destroy() has already run by the time
evict_inodes() is called, so the FUSE_REMOVEMAPPING requests sent by
fuse_vdax_inode_cleanup() fail with -ENOTCONN, which
inode_reclaim_dmap_range() ignores.  On a submount unmount the
connection is still alive and those requests are both valid and needed.

Fixes: c2d0ad00d948 ("virtiofs: implement dax read/write operations")
Cc: <stable@vger.kernel.org>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-3b38f8c0-5e4a-4c21-87a6-4f96cc3cf147
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/inode.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 20fbc99f3590..344fcb55a64b 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -150,11 +150,16 @@ static void fuse_evict_inode(struct inode *inode)
 
 	truncate_inode_pages_final(&inode->i_data);
 	clear_inode(inode);
+	/*
+	 * Must be done unconditionally: the DAX ranges owned by this inode
+	 * are freed nowhere else, so skipping this on an inactive
+	 * superblock would leak them.
+	 */
+	if (FUSE_IS_VDAX(inode))
+		fuse_vdax_inode_cleanup(inode);
 	if (inode->i_sb->s_flags & SB_ACTIVE) {
 		struct fuse_conn *fc = get_fuse_conn(inode);
 
-		if (FUSE_IS_VDAX(inode))
-			fuse_vdax_inode_cleanup(inode);
 		if (fi->nlookup) {
 			fuse_chan_queue_forget(fc->chan, fi->forget, fi->nodeid,
 					       fi->nlookup);
-- 
2.56.1

