Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890458;
	b=GWGZeqtnOZGKL5cRh6TBbOuBWdFxpOk1pyg3L1bAle3qhV8tz1qwHf+HHSseFFMHNRjq
	 RH8O4IuOBeCnsDW8WNY78UEmj6e58mzuEG9IXZREhiSmSt8/hJ7RRiI00Qc4bDT7rdpd1
	 ZbFNnkFTadLo+urrLEUjmZnVNCMtuQmBLbkZveIUvRexiRYg/3txgoQpesnZkf0gZjca6
	 sY+w6yRKJ7V+Qc3LCag1osI0Clmpx7GkkBfM+WORuTuk8ZmSoGzOjpwEJlx4BBm9ymtu7
	 QXycagutwlru34uEElO1PkJuSWEUgvhC4qha8GOQFmdftgrcWEMfwLEK6wW+sUtpNUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890458;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=FhPQ/T4PZ3liAdxrNdJuIhcSRT973hs9+msfzDKvQnk=;
	b=EgOi9KUIINnvvgv4gFhcMBUWqq8ub9FNECVHIBB0I9oGpyD2faAuHZV1heKLa9NuIGFy
	 Qk2bnENNPZn6uGtLMj/1dc4y5Z2gZsbg2yUqQKavw2PnBtMADZ+vKS6Fdac4cOVVMXCyp
	 xVbZLyreKLTw5e1gRTiRLP0GpIU7qD6Q2DUdlCoZttQXQ+js2ILJCE81mvKjbD10JRjVP
	 FLFIgIy3SPAwRRojnabRShDteH4Crkt7pksByN3lrya74PCat1tVIr8jZ9tLyQL0Q90gx
	 6NYXyoHHYkn3hj72x9UzZ10jSCBm/LYs9ZxMNosayPy9CFlnrAtSJrpR4dK9Otmcovw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LMgJ8q7+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B7B606A326
	for <fuse-devel@lists.linux.dev>; Thu,  5 Nov 2026 14:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B7B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LMgJ8q7+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793890457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FhPQ/T4PZ3liAdxrNdJuIhcSRT973hs9+msfzDKvQnk=;
	b=LMgJ8q7+8JIQFz7KT5GnLBF5g3pKw+GMSq9Co5khr55sfr7i2AGQPz27MLZXkF6Lr5Jz3+
	KhYNjhY2LAtmbiYZQocvKPxeQBfvRgIbIiZ6A9Tt001j+nyikaGKnTa1KWSa1pBoFPPt77
	1EO+5Zgrg0iNzzslZHaOD6hRNgj22Rg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-VLjydNhMOoWS2KevyOI69Q-1; Thu, 05 Nov 2026 09:54:15 -0500
X-MC-Unique: VLjydNhMOoWS2KevyOI69Q-1
X-Mimecast-MFC-AGG-ID: VLjydNhMOoWS2KevyOI69Q_1793890454
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e00f3929bso504213f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 05 Nov 2026 06:54:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890454; x=1794495254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FhPQ/T4PZ3liAdxrNdJuIhcSRT973hs9+msfzDKvQnk=;
        b=zEEoagUr4JeRTnGalfuXh5DXqh8oXkaas3LaLawPQ5ghALpccfYYVGMwqizzesm1un
         RqQ3/Xy00sDHabE+qZvG8MV6z9U07EZfaX8c18w4eNwwP69mYSqUBayKXAXCOAKBHr0v
         fnVzg2vlrsggeSeKJ6vCVqNm8VbYBDi7FtdqK04QWA1mGzOgqAbTycjSD0MmzeVXcFIj
         IowLhNKPWcs78WlBKqTBmWMtJGjNzu5pQKyWI/5j/h90NU78uJcIJqVppLxu0eq3q1JB
         QUPAQI/780vQUC5BKcC6NF4odPz6ITqmCioWHDEkCWpc8E7gh0qpfsC8ovbBFfEwC/2u
         V98w==
X-Gm-Message-State: APuU4Z8Whvm7ycXmoJAHH+vqBuhW3EjTuO7+mddJVMGBY4UmaOfhTEGq
	V8K9+Blq08vJCZjsZe5ETGB2Ys+iSxfr8nPh7NT06pJRq0HeACpAZzazHvn88noW+hGhfqcCYQP
	QBLTGFwB/kylTESD18KxsBiCfcZstZOn5RPYUuOE06HHrsvisu9wCEQuA4mTALnGLelEldgt3kJ
	wlz0byB/BZ91m1li7JW13RVyMwHpkcUeUYXr0G86pUqqz7lSw=
X-Gm-Gg: AYBFou2mMXxwVvOb0fLWNTqClxFVjXnQZjUY0+TTPkwJYiSs1pXvPyt0KCCaatVed5w
	GJ9VdU9nLKTA069Rn/+s5tqGCO4qPAnp3mEOqjgqoYZmXUOCLy/dt9OrCMT07L1/i2Qv/BPTvXK
	50JS3Edlq3ZdIjWc1/GO/wlXzTyqq38kraXztSWiP0Xtw0eKXeZQGPq3RZxeXsbIj+c/ofk5LTV
	YgUrSnJGnhGBTQimMlIvrqyjLw96SHJRNPZPpeeMVQJCav3drprwx682sJ1OVEwLE/Px2DtW8oc
	ykKWLsMt3OMuXBZIdGTmaO9kC1hesz/gBx3yQDufRwaxKtOyZEVX7grb04Ol8sCuYPJBrDloCkr
	rVUe0ZQ3F91FhmezmNl0e8/VufxKB/FKNgasgt+n3HDvqQtM62cGo0GwVKjy+MqzodZIsMNnV4X
	AEzyR2nDZURsk+M98yBkH7up1PzfmGsw4613yzAC3AyII=
X-Received: by 2002:a05:6000:4610:b0:48e:1b11:7ee6 with SMTP id ffacd0b85a97d-49114d42ea3mr5024357f8f.2.1793890454269;
        Thu, 05 Nov 2026 06:54:14 -0800 (PST)
X-Received: by 2002:a05:6000:4610:b0:48e:1b11:7ee6 with SMTP id ffacd0b85a97d-49114d42ea3mr5024313f8f.2.1793890453745;
        Thu, 05 Nov 2026 06:54:13 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (188-142-154-142.pool.digikabel.hu. [188.142.154.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed08536dsm9296429f8f.32.2026.11.05.06.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:54:13 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: NeilBrown <neil@brown.name>
Subject: [PATCH 1/6] fuse: Use d_alloc_trylock() in fuse_direntplus_link()
Date: Thu,  5 Nov 2026 15:54:05 +0100
Message-ID: <20261105145412.83058-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.0
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
X-Mimecast-MFC-PROC-ID: jvAEa_XPVzHsfFWqRiW5uSGTDoSWsoaNfPBtOSNo870_1793890454
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: NeilBrown <neil@brown.name>

fuse uses the results of readdir to prime the dcache.  Using
d_alloc_parallel() can block if there is a concurrent lookup.  Blocking
in that case is pointless as the lookup will add info to the dcache and
there is no value in the readdir waiting to see if it should add the
info too.

Also this call to d_alloc_parallel() is made while the parent
directory is locked.  A proposed change to locking will lock the parent
later, after d_alloc_parallel().  This means it won't be safe to wait in
d_alloc_parallel() while holding the directory lock.

So change to use d_alloc_trylock(), which doesn't require full_name_hash
and d_lookup to be called first.

If d_alloc_trylock() fails with -EWOULDBLOCK or for any other reason,
the consequence is only that fuse_force_forget() is called, which is
required to keep the lookup count on the node consistent between client
and server.  It does not cause the readdir to fail.

Signed-off-by: NeilBrown <neil@brown.name>
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/readdir.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 1f6cf565477f..295cbd645653 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -11,6 +11,7 @@
 #include <linux/pagemap.h>
 #include <linux/highmem.h>
 #include <linux/vmalloc.h>
+#include <linux/namei.h>
 
 static bool fuse_use_readdirplus(struct inode *dir, struct dir_context *ctx)
 {
@@ -195,14 +196,11 @@ static int fuse_direntplus_link(struct file *file,
 	fc = get_fuse_conn(dir);
 	epoch = atomic_read(&fc->epoch);
 
-	name.hash = full_name_hash(parent, name.name, name.len);
-	dentry = d_lookup(parent, &name);
-	if (!dentry) {
 retry:
-		dentry = d_alloc_parallel(parent, &name);
-		if (IS_ERR(dentry))
-			return PTR_ERR(dentry);
-	}
+	dentry = d_alloc_trylock(parent, &name);
+	if (IS_ERR(dentry))
+		return PTR_ERR(dentry);
+
 	if (!d_in_lookup(dentry)) {
 		struct fuse_inode *fi;
 		inode = d_inode(dentry);
-- 
2.56.0

