Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A004539A81A
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331041; cv=none; b=gQgQIlzT0XQQn1+2txD1vqNiOg46XXwh3ylKgTcP3btWvSTyrUM7DjKHPU7GaFMbb6jys5ZMC/2xkiN5ixHDDgrPUlCH2anXEMo4TKUY+ZV6LSNFbqGP2tq85gCvgJVx0ki9XPwAsx6hvCcI3+4SNEv0x2ND4yC0pQoENUX59Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331041; c=relaxed/simple;
	bh=rAnPPcyPamLpsP8P2z3a5DcysXm50OUQu3dnhoT+U7g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=PuX4zQstHcs27u7rej9LjtfcsuOD/nzdK/EQcs8X1X1sKoVE42J2u800TRIRtP5Geagi4VRCNF+2rqSIpRn1i1YwMcJSye5/3/Zapg7EWlAkF4x7TyOH/YC1gSxZ/Eb5FcSgGYssMycw9dYakBQlEanX/tsLnrDmEdoN6zQUAf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FarDLBpM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FarDLBpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W/2Y6IiaO/mUP1Nrl4o6z/uHOOkkwviI1kk8jZeRPsk=;
	b=FarDLBpMgFEPbAHT6KPCcVE5AxsbKhQKG4CxgGB3bV3v4GC87hII8PYHxOc4XSPO58jqGG
	IQhKA45y3ry80hewBJB84GdnuA4P1mHjOxXPmFJyt4EOC0TEVWn8hF7/TyEVXazQcrBIxh
	TIG5JiIxwhOnVGewis+YxqsSM2EkJY0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-xYQzN6JbOFivFALMYG6krA-1; Thu, 16 Apr 2026 05:17:10 -0400
X-MC-Unique: xYQzN6JbOFivFALMYG6krA-1
X-Mimecast-MFC-AGG-ID: xYQzN6JbOFivFALMYG6krA_1776331029
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4837bfcfe0dso70667065e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331029; x=1776935829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W/2Y6IiaO/mUP1Nrl4o6z/uHOOkkwviI1kk8jZeRPsk=;
        b=CDJKHkbpx3/mYNURu5dlw3aA01m76zCcF/7vleso+KNOu8wf4HsehUp5vOqMvvIirM
         GyUzZHuj4+XjtjH4JyqmKfuaqRWVUen494RmuF1bGreviYjT9K3vdm/hJqIRCo1Hde4k
         hqePZhv3SMnGAeRmQeKKbm0K8GJvAWKLiXVFNpyX1mC3wqqieV0DId9BExiKwAz8Uj9q
         6U+eH+H4q16XE0+mNGRHLxcY+lF5pyfgNbDisyA/rlcWTJJQ84nShrUSU7/6eM1zoB2a
         PF5mQ03PeUXeCHL7oyK7IPjOGG8ja3xxEQnMegYYCauBZayY1i83mazTQeg3saA79woj
         K8aw==
X-Gm-Message-State: AOJu0Yyjn7fQ+57VaEhO7sKxK1JCIomIeWR6dhLv6Jv7pWeHOWcp/I+2
	gMJ6o+To5z9h9D8vb0js6GxF5q4Q/iGUpT3CWPq52G4rFIta2v+QUmvdM5qr/c7WbYkgDqLfgfy
	jrdjjjlnhALfdBmqU+r+GVUi/nms+HHAYTLe1BMQwopRZrlxsS5VXXrteEU45VT/wTBxEpuuxL6
	0tID09qpXYLg1672+8IOY6s5pFC0gpmRBRXLE8oAZCOW7Axwk=
X-Gm-Gg: AeBDietbhhuJN5CkqjuCkVCXZncV4/vB6goBGBFEYdm/BdkdySbgPDMsjwqbiABWAIH
	wa1FIEF4/WID3CHfWSOzBOItsu96ZYNL69qi+tUhvyl5uXN/IO1k+iHmB0UGAk1ovdkDQMGpR9/
	ioxfPSfL1pBsfER+y2raNsTB3hcKpvvY+O80Kuo8QzWphlOgzKvaJ1gZabFMfE1RbVL583o8sLA
	6afCH3F0++ah63snOIQYcmi2b61QoVWjKKhLKz5rcwE1cAxHfVPF5dq2xR4La8/0Z8+Q0wJaLHp
	v6+o9bDqqkhPp0Ui9Lr1Msn1SIMipXJLUvWbnJ8/9c0EDaCpbnFgsI/CWiRJ9uDye4Qgg0C84hl
	dJBE8G2vIr3n2zGsnIeKC44NB5aFzukVH4XoKopmzhdXuE6B0nyTrGWU70cGMRtG4EedHzzijCU
	ULa0MeKQ==
X-Received: by 2002:a05:600c:8b27:b0:488:b1c7:b432 with SMTP id 5b1f17b1804b1-488d6881e82mr326551425e9.24.1776331028953;
        Thu, 16 Apr 2026 02:17:08 -0700 (PDT)
X-Received: by 2002:a05:600c:8b27:b0:488:b1c7:b432 with SMTP id 5b1f17b1804b1-488d6881e82mr326550895e9.24.1776331028421;
        Thu, 16 Apr 2026 02:17:08 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:07 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 05/32] fuse: move 'devices' member from fuse_conn to fuse_chan
Date: Thu, 16 Apr 2026 11:16:29 +0200
Message-ID: <20260416091658.462783-6-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Bu9XJm38pAJnEoGZwCArfbXc-8xnybTst3_dN9WC0dQ_1776331029
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This belongs in the transport layer.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.c         | 17 ++++++++++++-----
 fs/fuse/fuse_dev_i.h  |  5 ++++-
 fs/fuse/fuse_i.h      |  3 ---
 fs/fuse/inode.c       |  2 --
 fs/fuse/req_timeout.c |  2 +-
 5 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 416c144c6e0d..18bad9089917 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -342,13 +342,20 @@ void fuse_chan_release(struct fuse_chan *fch)
 
 void fuse_chan_free(struct fuse_chan *fch)
 {
+	WARN_ON(!list_empty(&fch->devices));
 	kfree(fch);
 }
 EXPORT_SYMBOL_GPL(fuse_chan_free);
 
 struct fuse_chan *fuse_chan_new(void)
 {
-	return kzalloc_obj(struct fuse_chan);
+	struct fuse_chan *fch = kzalloc_obj(struct fuse_chan);
+	if (!fch)
+		return NULL;
+
+	INIT_LIST_HEAD(&fch->devices);
+
+	return fch;
 }
 EXPORT_SYMBOL_GPL(fuse_chan_new);
 
@@ -417,7 +424,7 @@ void fuse_dev_install(struct fuse_dev *fud, struct fuse_conn *fc)
 		 */
 		fc->connected = 0;
 	} else {
-		list_add_tail(&fud->entry, &fc->devices);
+		list_add_tail(&fud->entry, &fc->chan->devices);
 		fuse_conn_get(fc);
 	}
 	spin_unlock(&fc->lock);
@@ -2046,7 +2053,7 @@ static void fuse_resend(struct fuse_conn *fc)
 		return;
 	}
 
-	list_for_each_entry(fud, &fc->devices, entry) {
+	list_for_each_entry(fud, &fc->chan->devices, entry) {
 		struct fuse_pqueue *fpq = &fud->pq;
 
 		spin_lock(&fpq->lock);
@@ -2519,7 +2526,7 @@ void fuse_abort_conn(struct fuse_conn *fc)
 		spin_unlock(&fc->bg_lock);
 
 		fuse_set_initialized(fc);
-		list_for_each_entry(fud, &fc->devices, entry) {
+		list_for_each_entry(fud, &fc->chan->devices, entry) {
 			struct fuse_pqueue *fpq = &fud->pq;
 
 			spin_lock(&fpq->lock);
@@ -2605,7 +2612,7 @@ int fuse_dev_release(struct inode *inode, struct file *file)
 		spin_lock(&fc->lock);
 		list_del(&fud->entry);
 		/* Are we the last open device? */
-		last = list_empty(&fc->devices);
+		last = list_empty(&fc->chan->devices);
 		spin_unlock(&fc->lock);
 
 		if (last) {
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index e80409c2f496..459f37ece46a 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -90,6 +90,9 @@ struct fuse_iqueue {
 struct fuse_chan {
 	/** Input queue */
 	struct fuse_iqueue iq;
+
+	/** List of device instances belonging to this connection */
+	struct list_head devices;
 };
 
 #define FUSE_PQ_HASH_BITS 8
@@ -125,7 +128,7 @@ struct fuse_dev {
 	/** Processing queue */
 	struct fuse_pqueue pq;
 
-	/** list entry on fc->devices */
+	/** list entry on fch->devices */
 	struct list_head entry;
 };
 
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index fd5f741693ca..6185b97df106 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -835,9 +835,6 @@ struct fuse_conn {
 	 */
 	struct rw_semaphore killsb;
 
-	/** List of device instances belonging to this connection */
-	struct list_head devices;
-
 #ifdef CONFIG_FUSE_DAX
 	/* Dax mode */
 	enum fuse_dax_mode dax_mode;
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index ac6a0b736fb9..4d958c53900f 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -982,7 +982,6 @@ void fuse_conn_init(struct fuse_conn *fc, struct fuse_mount *fm,
 	init_waitqueue_head(&fc->blocked_waitq);
 	INIT_LIST_HEAD(&fc->bg_queue);
 	INIT_LIST_HEAD(&fc->entry);
-	INIT_LIST_HEAD(&fc->devices);
 	atomic_set(&fc->num_waiting, 0);
 	fc->max_background = FUSE_DEFAULT_MAX_BACKGROUND;
 	fc->congestion_threshold = FUSE_DEFAULT_CONGESTION_THRESHOLD;
@@ -1543,7 +1542,6 @@ EXPORT_SYMBOL_GPL(fuse_send_init);
 
 void fuse_free_conn(struct fuse_conn *fc)
 {
-	WARN_ON(!list_empty(&fc->devices));
 	kfree(fc);
 }
 EXPORT_SYMBOL_GPL(fuse_free_conn);
diff --git a/fs/fuse/req_timeout.c b/fs/fuse/req_timeout.c
index 5357a2d63b3f..ca44a7940174 100644
--- a/fs/fuse/req_timeout.c
+++ b/fs/fuse/req_timeout.c
@@ -94,7 +94,7 @@ static void fuse_check_timeout(struct work_struct *work)
 		spin_unlock(&fc->lock);
 		return;
 	}
-	list_for_each_entry(fud, &fc->devices, entry) {
+	list_for_each_entry(fud, &fc->chan->devices, entry) {
 		fpq = &fud->pq;
 		spin_lock(&fpq->lock);
 		if (fuse_request_expired(fc, &fpq->io) ||
-- 
2.53.0

