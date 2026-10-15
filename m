Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94963B7769
	for <fuse-devel@lists.linux.dev>; Thu, 15 Oct 2026 14:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075050; cv=none; b=s8kROBzY6qDSiDbjd6cuXSHZ0JX5MagvqZHNZtsLCEqxYZCab0SjuXUDLti7H/vzcQZNi4DrqKYdPQ+gunZkTTiykas6m5FgE6/zvjoqTXpiAsPEE0Mnld1l5deafAoJHPMm5Z5B8yGL6PwVs6Z2o0NWaIPXzbU/h243ncl0zeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075050; c=relaxed/simple;
	bh=e7a0JqHbQn+Ifj+e2d0s3dq3YSkOFlkpJW3UVbDe8aA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BC95m/ueS2kYFdJ//SDirXqPZoTcAAdBP0ClQVTav0fyH9J508jxslVkAmVMQ1n1I1WWMc/cNPsYS0aQgLGn+5GVyn+PBISnlCTrlHztzDREjLhD+iosLBctOy+OZ2hl3oYtO5d/DMeqDE9wcs72eA/1OkTp6qHel3kEsAU6Nlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y9qMNCzO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y9qMNCzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792075047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cVaScxfWGZyGdjfLb4WHWnu0UKPrFs6PHoRDXzoyfXg=;
	b=Y9qMNCzOtTN9SkLoOYAY0eRpQYA5bos9yFw0I4s+bxndLewHcFCJ0YebTzsfDA0Mq5IO3L
	Dvq0Qf0Focuf1RBQIMFX4mEoDk9ZQI+hMOar5aNJbt98veBzmKV7HewnkFqZMZWULc2040
	qCWzFmfkhMAJaUYfiOtNFC0C66c6sew=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-KsinNRh6Neq8vfVeh05BpQ-1; Thu, 15 Oct 2026 14:37:26 +0000
X-MC-Unique: KsinNRh6Neq8vfVeh05BpQ-1
X-Mimecast-MFC-AGG-ID: KsinNRh6Neq8vfVeh05BpQ_1792075045
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48afe000b94so1495974f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 15 Oct 2026 07:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075045; x=1792679845;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cVaScxfWGZyGdjfLb4WHWnu0UKPrFs6PHoRDXzoyfXg=;
        b=PohU2q9RBUh9Dkkuri9j17sj+rLIAFODw6ZWqgCUruRBNlmpHTZ7u2xcXfx6CiYfHm
         rc6IaUOvRF2lNUgWldx+PAayoBDNZ1rilcdhinKsPKWaYOcLDeiZM0azKSkYR889dxA1
         61NgyhG5ehN1Xql2OrBJ9MKlu7qmDFIEFLi0iiZELwBffwgVHtIPOXcpmEWAaztqnFfc
         g0Hj2QPiu8OyGWXu/m00slC0jFGS71KDqlozlErhwx/6EO6sWSS+DLADSEh1ltKbtIC8
         /1p+b4ZPajVfR8TVrh+QDaNK+MZkIOa2E5VYeEfXXpaPyJmdZaVnxe0QcPQ75D2s6A0A
         q/9w==
X-Gm-Message-State: AFq9FYKRU0bSNLaE11hExmQ5dU/X/CEIPB24GWfqpZaQ896pHOWcVkvK
	QstpcmwLZ3x/IfcHmxbIYkvmyxKZFH1mRq/vZFgxJQmjwznklFEP75bZPxba6l+3GScIt7AWq1a
	64oY2iq2F8ZsGvA2ynTGWYbE5DEuTfR5iRZ1+pQXkEYg+VUbKw8WrZoYM5VLCPqGveTiOVcwXLq
	bsIChFTGwN7ldj/MFCef1CXKTVTVl3OmgcZKWzGqWZ/eqcjlM=
X-Gm-Gg: AYBFou3Xr4RdCdkspn+rvLghLvP9q22DwyD8lincenjFkfzSkkVA2sLOaHxncoKda/T
	EDjQpX69E3U8gNfLiC5kWhdo+2tD562XBkk/Ul7PN2SHzpyz2RUcfaWJDnSik2FrBT7TA3AToMh
	502H+OTiTqCxoODpr6jgMWNbh5tqL1Fmb3vURGuauCMy77AoZP85Jh6VNzzOyKTreQP36+6Qx+W
	hHNk1hsuQMBMLC+vZokG0UMjJwfYisrddT3EyZJy61uzX97i5h4y9leLJ3+sbzmfBCq82BdzKqh
	r4W43dDNteG46AKOzsvnV+ALC1TEg9KScnQcE6kKZpR9o914P/rXN0A4IIY0wTQzQIbiAzNY/Xv
	mRrQuozAWfbPiARPqltxeNg==
X-Received: by 2002:a05:6000:1788:b0:488:8a5d:ffbe with SMTP id ffacd0b85a97d-48dbaaed914mr40761555f8f.33.1792075045026;
        Thu, 15 Oct 2026 07:37:25 -0700 (PDT)
X-Received: by 2002:a05:6000:1788:b0:488:8a5d:ffbe with SMTP id ffacd0b85a97d-48dbaaed914mr40761430f8f.33.1792075044031;
        Thu, 15 Oct 2026 07:37:24 -0700 (PDT)
Received: from maszat.com (85-67-2-18.pool.digikabel.hu. [85.67.2.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa9f9sm19357147f8f.19.2026.10.15.07.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:37:23 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: =?UTF-8?q?=E9=A9=AC=E4=BA=91=E9=BE=99?= <yunlong_ma@buaa.edu.cn>
Subject: [PATCH] fuse: fix NULL pointer dereference in fuse_request_find
Date: Thu, 15 Oct 2026 16:36:44 +0200
Message-ID: <20261015143645.2815315-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fvi_GRInK5HeIBzbTPG6q8v8ee4_Xk8Sm-UYh7eNhQI_1792075045
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fuse_dev_install_with_pq() publishes fud->chan before it stores
fud->pq.processing. The write/splice_write and read paths treat a non-NULL
fud->chan as "installed" and then walk fpq->processing[] without taking
fch->lock, so they can see the new chan while processing is still NULL and
oops in fuse_request_find().

Fix by checking the value of fud->pq.processing before dereferencing.

Fixes: 48649c0603bd ("fuse: alloc pqueue before installing fch in fuse_dev")
Reported-by: 马云龙 <yunlong_ma@buaa.edu.cn>
Closes: https://lore.kernel.org/all/5ddc8efe.1e6d2.1a11fbec860.Coremail.yunlong_ma@buaa.edu.cn/
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 2d7ee5498f1c..815b91e2f33b 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -483,7 +483,7 @@ static bool fuse_dev_install_with_pq(struct fuse_dev *fud, struct fuse_chan *fch
 	}
 	if (pq) {
 		WARN_ON(fud->pq.processing);
-		fud->pq.processing = pq;
+		WRITE_ONCE(fud->pq.processing, pq);
 	}
 	list_add_tail(&fud->entry, &fch->devices);
 	fuse_conn_get(fch->conn);
@@ -1839,8 +1839,13 @@ struct fuse_req *fuse_request_find(struct fuse_pqueue *fpq, u64 unique)
 {
 	unsigned int hash = fuse_req_hash(unique);
 	struct fuse_req *req;
+	struct list_head *pq = READ_ONCE(fpq->processing);
 
-	list_for_each_entry(req, &fpq->processing[hash], list) {
+	/* Race with fuse_dev_install_with_pq() */
+	if (!pq)
+		return NULL;
+
+	list_for_each_entry(req, &pq[hash], list) {
 		if (req->in.h.unique == unique)
 			return req;
 	}
-- 
2.54.0

