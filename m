Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096971;
	b=SCrVnqS2xJ5NAX/GzDK0Bgf7fumH7ChK7Ze3FsPmzYaZRJovPTyvvUm2vAIGialxXFI/
	 F/mookheLB9GgpHAW/lYa4GUled4w9CIENQRqOY3riQK6DBynhSUCb5Q77R+JzAvmUML8
	 fncAU1d8uj4ey34UGPtm3hNRp4s5u9cRkYpthshDt6Zx5X7LFq4RVTeJqGmVTyVzIPTEH
	 OnShcOmjvrSTn3fMtg9mF2/roOEktL3pI2plRAaLsOGkJs8DVCCRvea68sLUrLwnJkt96
	 8o8V5s5rz0yn6YaIkXUpmMFTOrkr7+7KPCZg5Jdvnfm3EA3urcRr4K8gMJ3twKPcU1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096971;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=UH38lYI3FtMULZ1HqARchyITExHmeJ22IrKWYDL5lhQ=;
	b=I+l5JPJUZZifhKoN86jTBW9U1Z/dS0iV1awwzV6Xs7zBpqQUoSox+98KfrTf4JSasHvP
	 AWGlLMmAU/dTu853U6/DsSkvVtHuEai2v/AaxIkZbvpegF7vKSr1z3ZBJeV51xfBOlfU3
	 AX2Lf7xK7XApKTuETbCYIfzBmp0nlQGwQcOa1PsOtVVdppfYFJNtAnb/UBKn5bD5rwbij
	 QuiDGDqCiZja2fVwNR3JxfIj7dP8eRIGmWab9q4/KiEHAWZiosL+HjJbDCaJb54gMeYO0
	 YaCzr6KTJ26ZLzIFihRVDBNZhvVDBGrKDGH4Wpsj/Izj+ysnajdQ22AJG7aJ3CgLSdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hp3+Kk55;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84987606A33E
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 14:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84987606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hp3+Kk55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795096969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UH38lYI3FtMULZ1HqARchyITExHmeJ22IrKWYDL5lhQ=;
	b=hp3+Kk55ocZ9sH2CSf4EFJF+GKszzNAsht2nlS8XvFhRuNpuVWHTLnK9qxz2feg8vlYFJa
	UHfdgX2gPpQ+apgiUrIt9NRtrS0EGAs5aLh/ZOC15z5qKO8VJ2ZvZcbrgKuwUnjDe1Cut5
	H57K/9Qy0hgZAr9Hm0ZuwhJo4j0vrvk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-6XTSCAlEObGKt-8LrFOuTw-1; Thu, 19 Nov 2026 09:02:46 -0500
X-MC-Unique: 6XTSCAlEObGKt-8LrFOuTw-1
X-Mimecast-MFC-AGG-ID: 6XTSCAlEObGKt-8LrFOuTw_1795096965
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49090fde23aso1557450f8f.2
        for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 06:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096965; x=1795701765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH38lYI3FtMULZ1HqARchyITExHmeJ22IrKWYDL5lhQ=;
        b=llZC/rp/zdS1I1MZ6HytDyD0kkoLKsEBctC0RHSD+glktij5fUd4qZSfYDAHQ3wGfm
         jFM2HJ2q5smvk/zbMfsmavCfhndWCvY9gPIDR8Av5Gouxw2frrCB6t4bFS9oqslgNxy1
         5aIm/wdCTOKxk151wpEyPESDo0J9tKt5+2XcExEwor393kUZsvhQpiEg+lD3awgzTpm0
         p8tgxf94+nCs0vHfjSyIu/mh04yqsZzc9O3tDOHv3UbN7KYrP41oITovyWEEqkvJ72cZ
         ENsBwNnWqMipnKhAnr7lBKrPE2TigMoO4mcCJrO227P4x8syaJ+gOZ2Em4tFO5dllxNx
         sKVA==
X-Gm-Message-State: APuU4Z8tbHszxh8xZBPsN1M/rDBogDnqdyrigFVabudk4pSeQnCCXhq4
	blq3AFm9UeOmSPCLm7YG5j7XTmr6Uklgu/ZOyp2bsdeuIQ0Y1KiEh3z0n7gHkWOd4HkJeqcf1ZG
	dG4g0n8bjWFS6SwSVMFnk0eZziwYoHcO1cpb81VE9GYF0mrAnOQBC0nW4Vphm0fFmVCJ6DReRMx
	xZQXY+qvN1hmqxEPgqZKVwqJlQKMhNdjbWWuxfvmcf9z7y7dE=
X-Gm-Gg: AZFdTZf/z655oSVAdoV3f/mKW0twQzKD5ugLZ7YOr4+dZLGMC9FeoFf6f1PlllsHRXD
	633vZ8fy/Ag2rgX1i4Tu4khZWCoj1k37Z7YiqoghKrhi9RAgWWETf4foi4PRaUzzOy3a7Bavk1+
	1LjnBMkanG/rSqmv4wI30J1QdP908rYG9YvZKbd5tGYlKU7wsuHZ0r4l3Xjq7wEM1wIlqqPC9rE
	G+TT4O5kFO08YBiuVc5onUKtAmbAazfRsBPUhnXGqupeluuKhPmDi4p1PdgUAOv6ooNZfb1D1v4
	k+pLSh5BiedSPuz+HydYFMaExAYTtWtDvI04NhMJ76z1/zzYOVvsdWdL8MozwHVt9hemsfFMsTc
	2H1Pc6Wp2NinqRs56lZfp/ioJ/+yGtsQlzbCQpOloOBWKXvi+vJJOj+HKRaD9C+a9FeJ7TxIWqh
	o6XAD3Atmxiu9HY25F0S4zdKq9kyNcJ4mu
X-Received: by 2002:adf:e188:0:b0:4a7:1613:7207 with SMTP id ffacd0b85a97d-4a716137313mr10114050f8f.18.1795096964005;
        Thu, 19 Nov 2026 06:02:44 -0800 (PST)
X-Received: by 2002:adf:e188:0:b0:4a7:1613:7207 with SMTP id ffacd0b85a97d-4a716137313mr10113964f8f.18.1795096963202;
        Thu, 19 Nov 2026 06:02:43 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (85-66-37-29.pool.digikabel.hu. [85.66.37.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab552a1a4asm6409f8f.34.2026.11.19.06.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:02:42 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 1/2] fuse: don't mark inode DAX without CONFIG_FS_DAX
Date: Thu, 19 Nov 2026 15:02:37 +0100
Message-ID: <20261119140240.1798841-1-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Xclyo31G8_pXuSUXCFB7ZxaYIDjzWm4ttFOlPNLuQFQ_1795096965
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

fuse_init_inode() installs fuse_dax_aops and sets S_DAX for any regular
file whose lookup reply carries FUSE_ATTR_DAX.

Without CONFIG_FS_DAX, S_DAX is zero and IS_DAX() is constant false, so
all of the checks that keep such inodes away from the page cache are
compiled out: the "DAX inode without FOPEN_PASSTHROUGH" rejection in
fuse_file_io_open(), the O_TRUNC check in fuse_open(), the truncate check
in fuse_do_setattr(), the check in fuse_file_fallocate() and the one in
fuse_passthrough_open().  The address space operations are installed
regardless, so the inode ends up in caching I/O mode with aops that have
neither ->read_folio nor ->readahead, and a buffered read, mmap fault or
splice oopses on a NULL callback.  Any user able to mount a fuse
filesystem can trigger this.

Only honor FUSE_ATTR_DAX if DAX can work at all.

Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-bb232f07-d992-4dc6-a6c5-400e98e7133f
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/inode.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 3c0a629cc2fe..c6bfc66317ad 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -418,7 +418,14 @@ static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
 		fuse_init_common(inode);
 		fuse_init_file_inode(inode, attr->flags);
 
-		if ((attr->flags & FUSE_ATTR_DAX) && !fuse_inode_vdax(inode)) {
+		/*
+		 * Without CONFIG_FS_DAX, S_DAX is zero and IS_DAX() is
+		 * constant false, so all the checks that keep DAX inodes away
+		 * from the page cache are compiled out.  Don't install address
+		 * space operations that have no ->read_folio in that case.
+		 */
+		if (IS_ENABLED(CONFIG_FS_DAX) && (attr->flags & FUSE_ATTR_DAX) &&
+		    !fuse_inode_vdax(inode)) {
 			inode->i_flags |= S_DAX;
 			inode->i_data.a_ops = &fuse_dax_aops;
 		}
-- 
2.56.1

