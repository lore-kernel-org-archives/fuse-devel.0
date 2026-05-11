Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD7A36F433
	for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 12:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503125; cv=none; b=IhFPEPR8kUNLjYL9tt5qQo72miekiGJfedCbN15an8bt4kCBwnNcaxVFw9+2c0q8tQ8hq3sfMdqN7NWTTzVr+uhHKGJRCTYlbqMsuDsI0hXAURg2KhMLnRy+fAqR4zLNbhKIBZhYGRxh0SFAZ6TtVe01hsZajuzuo5Xu8SEiuZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503125; c=relaxed/simple;
	bh=Lsmr25GBc/CLlJAtIrKFYwtcpnYDWSZ8q2Rcr/YomyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=s/uA7VEKFcsGqyzMV5mXnnzS0nO6sZ/rflqosTnTjqyDDmDGuOPwrRxvy10ajCHoQTePUR2MZu7kPgpEF9xbXu7nDDSp0sZ4L+eFXwey85gI+jTm6kQDdk5xD1ZInf1yYLikLpvO+sNcOtR9JjpbhyW1Ea0sZbeJRbjjBSOTHfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=efi1zndL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="efi1zndL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778503123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bQmXAyQcUDXDiTDsVZe3Bui5ONJkZ9dkcOuZPjk6LMs=;
	b=efi1zndLYVjtdx7TfhYgh8o+pNZ0Q4OECW24nzm7k9z/U48yFj0NXC4fJ/bJrjAoaWL1Fn
	HKHHRjWPudN7EShO3WqzZbgcjEx7njXSITJDEMM1KO7p6SKkz33xRQUkPETsUwlOKwrTAH
	ZQGtcE543Nqy42Q+8dtsFtlA2+SaCKo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-fupA4lmgNDmoTt1Xk-zHrA-1; Mon, 11 May 2026 08:38:41 -0400
X-MC-Unique: fupA4lmgNDmoTt1Xk-zHrA-1
X-Mimecast-MFC-AGG-ID: fupA4lmgNDmoTt1Xk-zHrA_1778503120
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-449b2a183d3so3171804f8f.0
        for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 05:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503120; x=1779107920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQmXAyQcUDXDiTDsVZe3Bui5ONJkZ9dkcOuZPjk6LMs=;
        b=BJV644+UBf4XIAKlwLyWT2wozELuWA4F3m+gY9oiTlEx09TSdsOf581On7NvBqyyV7
         ru7lZGc53buLJ6du5m0UD3ER9sI0z9WJnb4xzZfpWLPRKZSr8vrw5TBxssCc3cUzynsL
         A/v6CQory0XJKqvndxRYlSFSEPyTdf2ufDghRDfYhKj/bI5taujPhFRz0DmtP+oITXcR
         MbmLWW9LvZsl7nOTi/lKWw5Rwji1L5CpmSyLFP6erXxppV0cSxldGIw0zBDRlPNwkbfl
         AhI63JK5IlqQVHTqRmr5jziyDUbsGa/egdAniQiGdco6v4pqvc2D9uoUps16pjf6Y7XV
         GJ5Q==
X-Gm-Message-State: AOJu0YyPS7S7gEU2t4Bpfpz/ThgC35fr+MAxy1791sHrK9zoKRLvaNa2
	19Y4JEQNZK5ENcEJjYu/hsEvD/tXic4nIi+65klyBcHojj/Jn/wm4/o9L+43TArp9y7TT2zSKP4
	JeW/bspyYLKY2uqXBr2c+Wv2zm3GYWCDGAw4QSL3sJd4QAYGQH7cjKNiVlwx/CJZtflGBj20Fyx
	MQC83ePLb70ZH1nV4wG/aFChxEm+drh07WzQol/0U7JnnnZKk=
X-Gm-Gg: Acq92OGt1o2PNqKg5tnGnoxREV7hSC1CSE+gg7co9YnkQf3IvMptRaC3kCdJmMn2R4J
	rjWJhxFulL2wvTkYaZYTnrut9GM/f48a+VEp0bzRf8aVoZ81KLKAfSmxmb5f9azXSajewXFRZdw
	3i/uCg0SnoZJ1DOIHhDsx80d6byCV65jdQ+igQFEBE+0o/suTECbtx7XbhpXKEyYrztTyayha68
	WqNl/RPWIu8GIppNOeVXmHljDc0Dklb7KSBbTIn8uRc/6Z4nOmrJgTuyOY8JArgNf1cPxTyzsln
	GtoruUjWq3ymBkd7aeSkjSSc7ALXhFxgLGHBUEItSnaqS0PftuoG9nGz3reBK1DKRlvrJJcV8AU
	6h+n/a5/Bmz1CWKASe+6QgWqpiE23j8oIC2zxL1mYZu2A1C2g5gpamLZfKWmak/9fwmPbC4NznY
	Ax
X-Received: by 2002:a05:600c:8b6e:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-48e5dfcd72emr305435725e9.2.1778503120292;
        Mon, 11 May 2026 05:38:40 -0700 (PDT)
X-Received: by 2002:a05:600c:8b6e:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-48e5dfcd72emr305435205e9.2.1778503119870;
        Mon, 11 May 2026 05:38:39 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (82-131-230-70.pool.digikabel.hu. [82.131.230.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db0b08asm84836755e9.8.2026.05.11.05.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:38:39 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: Amir Goldstein <amir73il@gmail.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: [PATCH] fuse: expand MAINTAINERS with subsystem info, update mailing list
Date: Mon, 11 May 2026 14:38:35 +0200
Message-ID: <20260511123837.64930-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ufhSYYDHy9kTem7V7z2FEEhCtdSOKD0y6gYBKUmHNRA_1778503120
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

- Bernd and Joanne are maintainers for fuse-uring
- Amir is maintainer for passthrough
- mailing list is now officially <fuse-devel@lists.linux.dev>
- change status of fuse-core to be "Supported"

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
[this time to mailing list as well]

 MAINTAINERS | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..6e3da76e4cb1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10574,10 +10574,10 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/fungible/
 
-FUSE: FILESYSTEM IN USERSPACE
+FUSE FILESYSTEM [CORE]
 M:	Miklos Szeredi <miklos@szeredi.hu>
-L:	linux-fsdevel@vger.kernel.org
-S:	Maintained
+L:	fuse-devel@lists.linux.dev
+S:	Supported
 W:	https://github.com/libfuse/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
 F:	Documentation/filesystems/fuse/*
@@ -10585,6 +10585,26 @@ F:	fs/fuse/
 F:	include/uapi/linux/fuse.h
 F:	tools/testing/selftests/filesystems/fuse/
 
+FUSE FILESYSTEM [IO-URING]
+M:	Bernd Schubert <bernd@bsbernd.com>
+M:	Joanne Koong <joannelkoong@gmail.com>
+L:	fuse-devel@lists.linux.dev
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
+F:	Documentation/filesystems/fuse/fuse-io-uring.rst
+F:	fs/fuse/dev_uring.c
+F:	fs/fuse/dev_uring_i.h
+
+FUSE FILESYSTEM [PASSTHROUGH]
+M:	Amir Goldstein <amir73il@gmail.com>
+L:	fuse-devel@lists.linux.dev
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
+F:	Documentation/filesystems/fuse/fuse-passthrough.rst
+F:	fs/fuse/backing.c
+F:	fs/fuse/iomode.c
+F:	fs/fuse/passthrough.c
+
 FUTEX SUBSYSTEM
 M:	Thomas Gleixner <tglx@kernel.org>
 M:	Ingo Molnar <mingo@redhat.com>
-- 
2.54.0

