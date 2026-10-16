Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8D13E0230
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 08:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138972; cv=none; b=buEn9xjJpDYiwNyjlpbaplduoeDjL7+xB9qaNLJhxOfFZxSE5/gQTJPCP32N0cmHyw+AhD7vnQczQZN+MSkkBQLvkNolG9m/1eOOUhSomMYVepSjVU4nC0VJ5yt2Bqs8AVQZjwUrIWUUnTEzaCsu2stFKGAW+VvsPF8f2qfH7Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138972; c=relaxed/simple;
	bh=BJaqRKFDXCdn7p9/92Z5Lr7Uvd9Xr/WipsrV9/M9ApQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hHTARC66aYWhwKkAGZRfziIakLkW3xNRRekOME+anxug0l3TD5lhX09wZQ97OzI4et2VwMzq89ZU1uvvanttRwn5jZdq2umAmdFfnUFxAp/AQeI8T0bOXSSp6rd+l8wsZ5BT3SkiyPrzKnlDlQvdBrdn1eFBtmyoGxwnl5zkhHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QCfl3cVH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QCfl3cVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792138968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZThEN8ZJSqgtXAW1SoSmGBPXvicIsIbuI9JZUZw1JNk=;
	b=QCfl3cVH61ohjVV0oPnl8pFwiyP6fBZEYxOoVmodLkUAtbYbaXxDIatFgit4r2CttauMIo
	gzhbPLqwPA1GIeQU6LQweYvivnPTThX0P2nKiGtGbYUA9Brh4xAQPBT4/uF/Cd8WrKtORd
	7OYGNPmqbZDFRxiz1Gfx6YQdtunGeRA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-IKsuoWD6O7-aTTY_eh0KDQ-1; Fri, 16 Oct 2026 08:22:46 +0000
X-MC-Unique: IKsuoWD6O7-aTTY_eh0KDQ-1
X-Mimecast-MFC-AGG-ID: IKsuoWD6O7-aTTY_eh0KDQ_1792138965
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c40420222a0so39125866b.0
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 01:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138965; x=1792743765;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZThEN8ZJSqgtXAW1SoSmGBPXvicIsIbuI9JZUZw1JNk=;
        b=oow7385taEQeAe349O1LXqIQ+Trbkjs+Rek1rfmwVSUXvjhQVZVKG9dgKhSXV4gVTY
         d7fjtirqAi/eLRqZdBmYNbOPM/SxsPupHdM+7MQlMe4yQ440zG8WVXv3JLuWTAOvplTG
         ypUlMn5IfhaoNcXTf5OhuHsFuMvMso3ZVaysxaF9Ntg4CJFTyYTg+Op65Oc9I1iRma7p
         hUGwYwalmNUpA7TbYHL7FMmvQ3XrqaEBMgs5caFS+ZVSjhFtM2BX2XZ4RxDVRzZyAwG4
         /UXGDKjPtNFUbeMF0ZAf/dvYQB4+zicMlUPg7PzeSu5+ouNJpM6cWpAQhpCyPg7UAsDp
         CnWA==
X-Gm-Message-State: AFq9FYINpRG3o+luvpJ/3cu2N5tuUkB/6HttaeOjOKPgEB5JrQJozCE2
	+GjraQQ8rYTpTN0WipwZvvj4gBVCNXMGg2075S9kCpaqwq8/uPnHq0DgfNwXN8tyV955GMgDMeh
	nnI4haoY3psehszyoZR0D6MgOJRHz83ozNKOE6Ja5LwEasvJRltEYp67+fjHl9LecYMmC7AB725
	iNgAcRTu76Y+OGPRo7U8Sgs2C+eYmOqqp7MC4Xg/ffwJhvqn0=
X-Gm-Gg: AYBFou2CSIGoZ9LYTaio6WV+8SnKg6qFBVeNC0FDqOk1eo3S/RYu7k+qfjbFTc9FnoM
	FT2hlPbGo/pEBTLpotSDmkkQavLSpRPA83oBfvwwNexJYkpATx+JfVAazabH7QMqCZmf8Ll02tm
	7yHhKUl/uNn80rP1NVi1/AWwd8G3xa7Tj1+lpnQcAUqQXzAHxdWIJifqtUZFRq5xHy4yhk0J31F
	txOwh0jtoYgvCADjbl6v7zCcBYmovbxOnoOwu3WbzOluywfabwLFFRw/APe+YwwPRMn9kYGrwvT
	OBfhZ4v2pZPkMBNqcYTSS8r75dN+VVO+wKbyVbwMifIrlX0LUshH+NkePwOkNxuzzZey77UXpzs
	eELp4knYfE2BsPHA/t69yO3ntEvmtBEPt5eWpcldncrTvsg==
X-Received: by 2002:a17:907:7243:b0:c40:5de7:33d8 with SMTP id a640c23a62f3a-c405de7462cmr130513966b.0.1792138965456;
        Fri, 16 Oct 2026 01:22:45 -0700 (PDT)
X-Received: by 2002:a17:907:7243:b0:c40:5de7:33d8 with SMTP id a640c23a62f3a-c405de7462cmr130512666b.0.1792138964941;
        Fri, 16 Oct 2026 01:22:44 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-67-2-18.pool.digikabel.hu. [85.67.2.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091ab8665sm47256466b.66.2026.10.16.01.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:22:44 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: =?UTF-8?q?=E9=A9=AC=E4=BA=91=E9=BE=99?= <yunlong_ma@buaa.edu.cn>
Subject: [PATCH v2] fuse: fix NULL pointer dereference in fuse_request_find
Date: Fri, 16 Oct 2026 10:22:42 +0200
Message-ID: <20261016082243.2865588-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WVJRfhuuiD-FX-sbUsAS7dKH9MnYI3k165Ztv2CA-7c_1792138965
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fuse_dev_install_with_pq() publishes fud->chan before it stores
fud->pq.processing. The write/splice_write and read paths treat a non-NULL
fud->chan as "installed" and then walk fpq->processing[] without taking
fch->lock, so they can see the new chan while processing is still NULL and
oops in fuse_request_find().

Fix by taking fpq->lock around the cmpxchg + fud->pq.processing assignment.
This protects all call sites that dereference fpq->processing, since these
have fpq->lock held.

Fixes: 48649c0603bd ("fuse: alloc pqueue before installing fch in fuse_dev")
Reported-by: 马云龙 <yunlong_ma@buaa.edu.cn>
Closes: https://lore.kernel.org/all/5ddc8efe.1e6d2.1a11fbec860.Coremail.yunlong_ma@buaa.edu.cn/
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
v2:
 - fix race against fuse_dev_read() as well (Sashiko)

 fs/fuse/dev.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 2d7ee5498f1c..adffa0e3b607 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -466,24 +466,27 @@ static bool fuse_dev_install_with_pq(struct fuse_dev *fud, struct fuse_chan *fch
 	struct fuse_chan *old_fch;
 
 	guard(spinlock)(&fch->lock);
-	/*
-	 * Pairs with:
-	 *  - xchg() in fuse_dev_release()
-	 *  - smp_load_acquire() in fuse_dev_fc_get()
-	 */
-	old_fch = cmpxchg(&fud->chan, NULL, fch);
-	if (old_fch) {
+	/* protect fud->pq.processing assignment */
+	scoped_guard(spinlock, &fud->pq.lock) {
 		/*
-		 * failed to set fud->chan because
-		 *  - it was already set to a different fc
-		 *  - it was set to disconneted
+		 * Pairs with:
+		 *  - xchg() in fuse_dev_release()
+		 *  - smp_load_acquire() in fuse_dev_fc_get()
 		 */
-		kfree(pq);
-		return false;
-	}
-	if (pq) {
-		WARN_ON(fud->pq.processing);
-		fud->pq.processing = pq;
+		old_fch = cmpxchg(&fud->chan, NULL, fch);
+		if (old_fch) {
+			/*
+			 * failed to set fud->chan because
+			 *  - it was already set to a different fc
+			 *  - it was set to disconneted
+			 */
+			kfree(pq);
+			return false;
+		}
+		if (pq) {
+			WARN_ON(fud->pq.processing);
+			fud->pq.processing = pq;
+		}
 	}
 	list_add_tail(&fud->entry, &fch->devices);
 	fuse_conn_get(fch->conn);
-- 
2.54.0

