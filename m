Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E1B39A800
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331061; cv=none; b=Di0AidwVz0LXqrBDhIuMV4mZ4VCpGDouawyc7YoZsQwP8xtinqM/Pb3X/MwpTeLw5y0d8QzFiwFj99KLgH7L06qK0jyl0/KGUD9LSzYxigQo7iv+Kfc6Bwtp4F1HUyIn9Pov2NeDgx55kl1loqvFEYPsduVGl0Ad1i1OFVMJu+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331061; c=relaxed/simple;
	bh=LctYstnyNsYTEaC7vhsdQL0VskCsO1rb18RjMA7HIRY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=AFuanTHAbzxhLPNWjvKvOZYoKm9oSixJCSOruGCZ7bn+T3Xhw+sHBlhiB4nQ2nn689YLJlMC08xS4ZxsLkWpNUxliP2BWe/29QsuOdux3XXz3Av8/iG/g96QE6S0BkaEXfpMb2oDkyKZMBDCMq2kLAdVTs/WVppCFfd15v5hJ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e8OFfxHc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e8OFfxHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n2ATAjvzRKiK1x7dmQ7vs9SUKNkDHhKWCMxis7bRbuY=;
	b=e8OFfxHc06PkjVq1LCU2o0gyPHv/Ue9rgK/YsGrGz9egAC8Y/O4NDLks5lPzEFn/NXqRm4
	BHybkc3dHyDz6I836hBWUwDeidCzz0DYN1iAn65rNIcsWPcXxelB/jmfkvnIQ+cFDL7Vpi
	lrbQolp6r+CfU8aoaSWSwC/B8QmsKXQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-9EXeUW5tNraqwuEHUVB-yQ-1; Thu, 16 Apr 2026 05:17:32 -0400
X-MC-Unique: 9EXeUW5tNraqwuEHUVB-yQ-1
X-Mimecast-MFC-AGG-ID: 9EXeUW5tNraqwuEHUVB-yQ_1776331051
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488c2764f83so50888565e9.2
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331051; x=1776935851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n2ATAjvzRKiK1x7dmQ7vs9SUKNkDHhKWCMxis7bRbuY=;
        b=n3c2t4SHk1Jle8aUQYhOVtqslHuoG4WgtgrgwUpzwwapIPjWv2aEuFsvFAvbD0OenP
         CJZaEuXGBQ5i8TzZurWmHyjWtJVxxgDFUZPTo5/ztj+oVgz8LxAcu0+Nmki6WJDSAl2C
         Ak/Y1VCF0Bu9+u1Po+/bg/xS4gPucWnehw13i9JMp1qFm7Uik/iyPGhpvyG/CUAU+b8t
         pv1lHXE54zQUkbcpAr0aTyh4jllp9diB8QDam8tkuaG6vK9JEK+yJKqeCWtZTihUnsmq
         Ga5CTaug3mFGFzp8B2nh0anCgKJtcDDAv+t8uwG1YCip+659oy8Z2YoABr0NRQSqfkFo
         n6vg==
X-Gm-Message-State: AOJu0YyjP/8I4iZGJjT4JgHIntk71T60tMZSu1pAgwx6YGSeKNwKju8q
	/PXFxOKl8vTqz8venCr0Rflx+ZfcbFjqMxhegkIFe0HKaOOtsVbfRqi0TihDU16vT3Yj1Z9iRds
	jndDEKPh+dw7aBALU/exuEe6Sz87cncyW4h4LZipaSrnsa38p5yYe6jIwnU2JW2KahGjgin6ztu
	CY9QMKv+v6oCp48jMq5WLNYd4uEyyps+uRZUzOSQWuN5kL4Eg=
X-Gm-Gg: AeBDiese6g+qU1qxJGx+EmJ4A6dgBvJkMnBeV4d184qwe1S1UYP4Md+g9Gm/DBQbEBV
	SyAZeK/bdJKuetK0LlogFoRZKqnU2S7wVULL1C9YBQBM5ZNAud9xEBQBW8DcLkaYa4GpfPBIcnC
	6ezMqR6ZO5fCEpIlhwSDmHNQ7hYhnr0pY7JrXqeQnnOdsR0PPOq60oi6p11l40j8H5weyM7A868
	XnVlKl1OmIKWxTiQGsR8AGoHC1NIAWuHATb4hwbHeGHdnKYPLTQMb0ypnld+dgTj7XAsOIUoHNe
	lvq6FIuOqRuDSCEVrtiL54Ihtvjyrzdgsnm2M4uU+Sfpkq237eCqj2aRxnSpg7YLIY7hxO9EBNf
	AAQXT7u9teQanSr3DUu7uCb7/TVpY1d3iXfKPJBa7xllFShSOkjT36k7v/mBGDSzDCrNliZSW00
	QDqL/vEw==
X-Received: by 2002:a05:600c:c0c9:b0:487:1826:d89b with SMTP id 5b1f17b1804b1-488d67e262cmr237680085e9.9.1776331051009;
        Thu, 16 Apr 2026 02:17:31 -0700 (PDT)
X-Received: by 2002:a05:600c:c0c9:b0:487:1826:d89b with SMTP id 5b1f17b1804b1-488d67e262cmr237679755e9.9.1776331050422;
        Thu, 16 Apr 2026 02:17:30 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:29 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 20/32] fuse: split off fuse_args and related definitions into a separate header
Date: Thu, 16 Apr 2026 11:16:44 +0200
Message-ID: <20260416091658.462783-21-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: bmwjilIoIG0Dp94bmwT404KFweZ-77p566FfzfON0Io_1776331051
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This is going to be used by both layers (transport and filesystem)

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/args.h   | 65 ++++++++++++++++++++++++++++++++++++++++++++++++
 fs/fuse/fuse_i.h | 53 +--------------------------------------
 2 files changed, 66 insertions(+), 52 deletions(-)
 create mode 100644 fs/fuse/args.h

diff --git a/fs/fuse/args.h b/fs/fuse/args.h
new file mode 100644
index 000000000000..ecfe51a192af
--- /dev/null
+++ b/fs/fuse/args.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _FS_FUSE_ARGS_H
+#define _FS_FUSE_ARGS_H
+
+#include <linux/types.h>
+
+struct fuse_mount;
+
+/** One input argument of a request */
+struct fuse_in_arg {
+	unsigned size;
+	const void *value;
+};
+
+/** One output argument of a request */
+struct fuse_arg {
+	unsigned size;
+	void *value;
+};
+
+struct fuse_args {
+	u64 nodeid;
+	u32 opcode;
+	u32 uid;
+	u32 gid;
+	u32 pid;
+	u8 in_numargs;
+	u8 out_numargs;
+	u8 ext_idx;
+	bool force:1;
+	bool noreply:1;
+	bool nocreds:1;
+	bool in_pages:1;
+	bool out_pages:1;
+	bool user_pages:1;
+	bool out_argvar:1;
+	bool page_zeroing:1;
+	bool page_replace:1;
+	bool may_block:1;
+	bool is_ext:1;
+	bool is_pinned:1;
+	bool invalidate_vmap:1;
+	bool abort_on_kill:1;
+	struct fuse_in_arg in_args[4];
+	struct fuse_arg out_args[2];
+	void (*end)(struct fuse_args *args, int error);
+	/* Used for kvec iter backed by vmalloc address */
+	void *vmap_base;
+};
+
+/** FUSE folio descriptor */
+struct fuse_folio_desc {
+	unsigned int length;
+	unsigned int offset;
+};
+
+struct fuse_args_pages {
+	struct fuse_args args;
+	struct folio **folios;
+	struct fuse_folio_desc *descs;
+	unsigned int num_folios;
+};
+
+#endif /* _FS_FUSE_ARGS_H */
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index b8655c3b48e2..22a6d58678ad 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -13,6 +13,7 @@
 # define pr_fmt(fmt) "fuse: " fmt
 #endif
 
+#include "args.h"
 #include <linux/fuse.h>
 #include <linux/fs.h>
 #include <linux/mount.h>
@@ -288,58 +289,6 @@ struct fuse_file {
 	bool flock:1;
 };
 
-/** One input argument of a request */
-struct fuse_in_arg {
-	unsigned size;
-	const void *value;
-};
-
-/** One output argument of a request */
-struct fuse_arg {
-	unsigned size;
-	void *value;
-};
-
-/** FUSE folio descriptor */
-struct fuse_folio_desc {
-	unsigned int length;
-	unsigned int offset;
-};
-
-struct fuse_args {
-	uint64_t nodeid;
-	uint32_t opcode;
-	uint8_t in_numargs;
-	uint8_t out_numargs;
-	uint8_t ext_idx;
-	bool force:1;
-	bool noreply:1;
-	bool nocreds:1;
-	bool in_pages:1;
-	bool out_pages:1;
-	bool user_pages:1;
-	bool out_argvar:1;
-	bool page_zeroing:1;
-	bool page_replace:1;
-	bool may_block:1;
-	bool is_ext:1;
-	bool is_pinned:1;
-	bool invalidate_vmap:1;
-	bool abort_on_kill:1;
-	struct fuse_in_arg in_args[4];
-	struct fuse_arg out_args[2];
-	void (*end)(struct fuse_mount *fm, struct fuse_args *args, int error);
-	/* Used for kvec iter backed by vmalloc address */
-	void *vmap_base;
-};
-
-struct fuse_args_pages {
-	struct fuse_args args;
-	struct folio **folios;
-	struct fuse_folio_desc *descs;
-	unsigned int num_folios;
-};
-
 struct fuse_release_args {
 	struct fuse_args args;
 	struct fuse_release_in inarg;
-- 
2.53.0

