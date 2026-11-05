Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891393;
	b=qxjMDdZWKBfurGOwLvGu6Wp3+OcqvtFqYKv+Tv08GJDo2SkQpCVqFT1ttu9kPZsLHGVy
	 U08Fiz0cFRS+V/d7j30y2gOhdvqHyDwG4FyWSQizLiV2eywsGD8HQe/moqNieW3Ywi3Hr
	 eRI1a4aMpZicK5gn+klIQkPXgLyi6NbJxooAoLNpmB+I5AlNAW3Uo7z9F+JwmBUNuS0j7
	 kUlMHM3/SfO54my5aGyn/9bq3rZbi65B/4XKmJUYlXiPgZo5pw/seuk2+FFObpcpCzxN9
	 RKG0pSaGpSoCG/mLO2bm3XOCEH8GcXGtknV5SgilVKwSqUp8QyhMlWxGAHj4wZY4Mkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891393;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=4ggaaPWZDNxL0DAiqx5vNcK9rDHloEyp1DjKsZE36cA=;
	b=43xHrYvbzkHsMSlcBDjGjgAyJGNKDwOUbukJDx8Pn1M6PqLw0abJJImeqCwcDalVGWR4
	 lsVN1QaI6pFb4Ckc8pSkFrcRGchQLk+gInvLi7GciDdFzXctb2IuDSy2kNcu96wi8m/Pi
	 LTeGzXiO01RAtPUfzYtK41M6Me+BQ6Cob/4/HV5UxLOfyhQ075Vy08Ocv0YU2pq6b9Vsp
	 khACuuCWwaQM0G5DvypeE6df539CksX18LHjL5VcU9SkWrbfY/HLDohCL8hWgzebODbFe
	 kuZ6xWuijyvc+N7xpXcCT5hIOrcef7JIUqZr8JUt9sgHRRlNq9X2UTGq8kh2K/3amlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E9xlhRrY;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DB2606A337
	for <fuse-devel@lists.linux.dev>; Thu,  5 Nov 2026 15:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44DB2606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E9xlhRrY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793891392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ggaaPWZDNxL0DAiqx5vNcK9rDHloEyp1DjKsZE36cA=;
	b=E9xlhRrYlKsb/Iw1SH10zh2oykAC5WHoFnOqx1cdAvU571FbXsbS3gFB2Mv9nl0IS3DWiO
	4j/xS52X1NlITMaTbdSwVhogV66LaqjIYxkCZWumSr3n7EArq5k5HtJOZQtGzonzDo5mGN
	ORrRKCHA6L/RnukT4370UJoRKP6HXi0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-sxMrsccxMLCFEWx60eLhlA-1; Thu, 05 Nov 2026 10:09:50 -0500
X-MC-Unique: sxMrsccxMLCFEWx60eLhlA-1
X-Mimecast-MFC-AGG-ID: sxMrsccxMLCFEWx60eLhlA_1793891388
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48df02b91f9so493235f8f.1
        for <fuse-devel@lists.linux.dev>; Thu, 05 Nov 2026 07:09:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891388; x=1794496188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ggaaPWZDNxL0DAiqx5vNcK9rDHloEyp1DjKsZE36cA=;
        b=g6cYXN+G7lTSuu56M5hT7clp5lScDNmaeFoHpUIJA9tsvbi+b7PlwjMkAjEdFsQeHY
         AazqumwBm8okoWjE/mT/bC1+9bdKUyVUBKDlAlERVBmIbI/LKm9cZDN/1jzjI6bcqpoi
         jJ2MsKdyOyGXu2LIYXONu7SVxzxTCov9X488SLFNvB7Ti8dqRYocrU1f3zkU+Ye41B0b
         QfU16kbZuP9TJntKgVZtfzmttj/JNDTyHszfb1FW85cbkDtuLS7WeYTHM+GZNNBUjYDc
         n2ncSOfQeP/zJGSBVR9OeOD5lsUGBSHojxeT70SvVRXKVj5+ZYy0UoZzC+u5tmqWoic6
         hbOg==
X-Gm-Message-State: APuU4Z8jA/BHBrvwpDb2+tn240DumEHjnUO1OFaNBZSq4mwO4wzyzDdW
	lKFY09VJ/fkdCKAt5jrG3ruJhgj4onVq6e6qN95nFzWZJ13VO4QKbIvFL0JJqZlr8Wg2Sr4jwHC
	UmBqoxdPhwM68e0ZZDmWUKIcsNnPwBvZmgbMu++mAVy14nRIAiqcmYDKIZOGmVzlibZ8jVrr0v9
	Ea1DewNJDCbRx3DAS+uID6YkIGvj2okZ1QEIwKiNyTK/LeE8Y=
X-Gm-Gg: AYBFou0sxYNal3OWFBQ+ce1wjxnwgO22prmYimXMEcVz8IQOzX6+XrlFcPbXwtHz8eD
	tft94DwcOwdOT78e/ulij0uxL6CXVf4pKK/oSBJNRcvIkvGGcHrs0UjswMx8Y/130EcR7J1d3Vn
	lPD80QAhxCzNaoqtfmxZmwt3b/XT82xJdBvpVVz843LK8MIkUzAyT29uCKDVnRDdpXbmYMgwBeW
	dEaBq07JHlq4iXyknLGJf6q6nYUJ7pgtCSrVxj4UWslaJ4R0/M0+CjARNdlEvjLyAaXK9pBt+s4
	LcC/427iZl4/0434YqKC+pHrcg6RBCdRKsjktOb1niefkSkse8UckV+FV7gD9S9kb0snRCpeN+i
	5VFucsDgORPDCvH2u5ihCTdFHLm6T9Le19wUJM/lTG+RY4yBbFviLobug6UurMGXdP8lDV1L4lq
	PkBi98h2lDo/gYaxuRzrH1XwHdm+JXInP6DhZYcOEJUV8=
X-Received: by 2002:a05:6000:4552:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-49115c978eamr3205054f8f.13.1793891387786;
        Thu, 05 Nov 2026 07:09:47 -0800 (PST)
X-Received: by 2002:a05:6000:4552:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-49115c978eamr3205007f8f.13.1793891387238;
        Thu, 05 Nov 2026 07:09:47 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (188-142-154-142.pool.digikabel.hu. [188.142.154.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm9961340f8f.52.2026.11.05.07.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:09:46 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 1/3] virtiofs: fix use-after-free of fs->tag on device removal
Date: Thu,  5 Nov 2026 16:09:40 +0100
Message-ID: <20261105150943.86650-2-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105150943.86650-1-mszeredi@redhat.com>
References: <20261105150943.86650-1-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: H6EVG0yYy_-aWGmMP_jvb_ykCnoL1n_BpT4KEfSSj04_1793891388
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The virtio_fs object is refcounted via its kobject, so a mount can keep it
alive well beyond the lifetime of the virtio device binding.  The tag
string, however, was allocated with devm_kmalloc() and is therefore freed
by devres_release_all() as soon as the device is unbound, i.e. right after
virtio_fs_remove() returns (see device_unbind_cleanup() in
drivers/base/dd.c).

virtio_fs_get_tree() looks up the instance, takes a kobject reference and
then drops virtio_fs_mutex before doing the sleepable part of the mount
(allocations, fuse_conn_init(), sget_fc()).  A concurrent device removal
can complete in that window:

  CPU 0 (mount)                         CPU 1 (remove)
  -------------                         --------------
  virtio_fs_get_tree()
    virtio_fs_find_instance()
    // reference taken, mutex dropped
                                        virtio_fs_remove()
                                          list_del_init(&fs->list);
                                        // driver core unbinds device
                                        // devres frees fs->tag
  virtio_fs_fill_super()
    mutex_lock(&virtio_fs_mutex);
    if (list_empty(&fs->list))
            pr_info(... fs->tag);   <-- use-after-free

The virtio_fs object itself is still valid here, only its tag has been
freed behind its back.

Fix the lifetime mismatch at the source: allocate the tag with kmalloc()
and free it from virtio_fs_ktype_release(), so that it lives exactly as
long as the object embedding it.  All probe error paths already drop the
final kobject reference, so they are covered.  Merely dropping the tag
from the error message would paper over this instance while leaving a
devres pointer embedded in an object that routinely outlives its device.

The other readers of fs->tag are unaffected: tag_show() is fenced off by
the kobject_del() in virtio_fs_remove(), the automatic KOBJ_REMOVE uevent
is emitted from __kobject_del() while the device is still bound, and both
virtio_fs_add_instance() and virtio_fs_find_instance() only walk instances
still on virtio_fs_instances.

Fixes: a62a8ef9d97d ("virtio-fs: add virtiofs filesystem")
Cc: <stable@vger.kernel.org>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-0328b3a1-043b-468e-8425-6a613d91b5ef
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/virtio_fs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index ba8d79c4bcac..ef58bedc3941 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -193,6 +193,7 @@ static void virtio_fs_ktype_release(struct kobject *kobj)
 {
 	struct virtio_fs *vfs = container_of(kobj, struct virtio_fs, kobj);
 
+	kfree(vfs->tag);
 	kfree(vfs->mq_map);
 	kfree(vfs->vqs);
 	kfree(vfs);
@@ -489,7 +490,11 @@ static void virtio_fs_free_devs(struct virtio_fs *fs)
 	}
 }
 
-/* Read filesystem name from virtio config into fs->tag (must kfree()). */
+/*
+ * Read filesystem name from virtio config into fs->tag.  Freed by
+ * virtio_fs_ktype_release() so that it stays valid for as long as the
+ * virtio_fs object itself, which may outlive the virtio device.
+ */
 static int virtio_fs_read_tag(struct virtio_device *vdev, struct virtio_fs *fs)
 {
 	char tag_buf[sizeof_field(struct virtio_fs_config, tag)];
@@ -505,7 +510,7 @@ static int virtio_fs_read_tag(struct virtio_device *vdev, struct virtio_fs *fs)
 		end = &tag_buf[sizeof(tag_buf)];
 
 	len = end - tag_buf;
-	fs->tag = devm_kmalloc(&vdev->dev, len + 1, GFP_KERNEL);
+	fs->tag = kmalloc(len + 1, GFP_KERNEL);
 	if (!fs->tag)
 		return -ENOMEM;
 	memcpy(fs->tag, tag_buf, len);
-- 
2.56.0

