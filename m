Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0473717A586
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993479; cv=none; b=up7vDq+fI3EoKfL6nYVwAwciDQOGPv3kZ0d674cIZutpcj4t1BwY69LEgNvQ+BV9k1UafKgcKqE0RCTCTmKXCTvQCg7ZXYfG1hadQeDFV9EzLlsNeNdG/bsPkYPHOdoGzkR1Jpb/FaPC21OCnzpEIrPOL7kBDiW/CXvP4TDKTSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993479; c=relaxed/simple;
	bh=RPlBXOtmqbH76uzkKPmYZkw5Afc1Br6GXlboqcJQu5A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TeMi1sE2PY6eQbAezvzVaryTVRnfBd2137IGpznRUlp8vl0zyAuNT8CwkVLMcI2zxrculuJS9IYDM/uCJTI4QzqZ+uUGFz4uY1E0VTt1KhAQT7VXc3kUKGSleXOF+K8x+wSJIZhUN8WBEjHa3ctg6C3F1LEEJ8HYCzfljpIHPbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgyQQriY; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgyQQriY"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f2766905fso3396932b3a.3
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 18:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776993477; x=1777598277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ceSwYZRijAtCgNl9vnkmEkQHP439T7PUtNmM5D6TUw8=;
        b=OgyQQriYpWfQ1/eiCgjnOudPGWvFsYVWNFg3TW1A2vrINEiiEUcXKZuTcxnoNnYXPo
         UKkK8JsZA9x7YUM2IwoFHkZm7BIs4WaqF5HztycPTv0AOwROo8CuS9To9OBnBfqzweB7
         1jkc3s6JsZkRsjnwkIjnrcEmYbnAacHyTG+yc4I5ztCojj1hfL77U86cmZKnHSb+Jfxi
         WW5HE1DPIXz/13Pzotks+CCOuc53ZI8/DCC8JvY3XogRr3Z2V9xRe5qLe6FqbOYCmplW
         rNBuD2cynhAN+ZMg7GZPYVbsvgPFor7idJOBGRitXHLyob3nS3fKEnsE6A3SIp58xn3U
         gETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776993477; x=1777598277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ceSwYZRijAtCgNl9vnkmEkQHP439T7PUtNmM5D6TUw8=;
        b=nlitjbpgp8pDJQHzVC8vTBmIU2vJVZD6hspPUC4f17PoUO+/pKGfA1oG4MjUUaNCua
         Gm7ZhThfdVQHBt0VtpYtdZoLxy6s3JilZ+xsSe3ThwmTpvBqlX0MxDVbdvaOLRgv+HcC
         KnTiw1L47tA1Ne6pQA6D6+M6smTcHxfkcuwsxi/sMC06i+0KYS2QPTQWI4sWSUQw4ysS
         RbnLm0shYkYQmcFM+gdF1BoBll+kb0doA2JFHtPW1hTUfaL2NVn7dSYeG9pqdnTV2BBY
         OLyoXeqrdFWz7bAWyZjyRdEeRBQBKH0Dn6cSjX3JScaGF7QtFEM20/RoeC1SkieNKdRa
         WkHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SOE2YQ1kz/tzm1aGyj5RLwMqb6HniWZn2E7/5xQBhQOc38hRLoBd9FHtDV2YmIeHr/Q56kKVurEj5@lists.linux.dev
X-Gm-Message-State: AOJu0YxPfvjKL9VKDTKevJx8/1Lvq6bVdh5ar0q3I7VBCaMZBiomz7jW
	L8MWtxo0heZDXId/BSGMkgM0B/ROLXA7OyMFIorpfHysO2lqRaIA34i5uV4I0g==
X-Gm-Gg: AeBDiesleYm0d4SRmJOmPxQE3B6iJDWCBIDgI0Q2wT6/8oXiAA9v4S8w/elix+EUnZk
	4KI5+EqkZRd8N7lDTGpI+LSE91IyP1SmV9ckRcw74S5hHjnjT0Tvxe99TxGP+Sdb15y111agO0o
	63A/gN5ZY1IBTnO1Sjq2f7uWu++MwUQ43I+SDWOlBhSCjaGqJImWtrn9KB1kWT3Z90L5ZiOYwLE
	v1LA+47zD7tRHYbqFa+CsAAD6aVYTcPu0MHkTefSKFoDEajwk0NQ9edova2ThnpZnnKG43jhJva
	/GBt0EowmT4xb3e/gmGcpodLhNf4fBN0/NezaGsp7Xc10OLkiSguWbbGRpaTKAyeHDrM5SooumK
	ZTnHswFw/ELcX4Nv7iy4kIn8903910xUrKQU819badds0bCGd7SaIm9T44ZsOzR/8Osx0bUrtj8
	5SUtG86qqpME0hXLTyu2PacnuWPbHDvuUWolrn9eE=
X-Received: by 2002:a05:6a00:1f09:b0:82f:5576:2860 with SMTP id d2e1a72fcca58-82f8c7ded1dmr30278119b3a.9.1776993477352;
        Thu, 23 Apr 2026 18:17:57 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:56::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0092bsm23396818b3a.50.2026.04.23.18.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:17:56 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 02/13] fuse: clean up fuse_lookup_name()
Date: Thu, 23 Apr 2026 18:16:35 -0700
Message-ID: <20260424011646.457682-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260424011646.457682-1-joannelkoong@gmail.com>
References: <20260424011646.457682-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove goto with direct returns. Assign fm->fc to a local variable and
use that. No functional changes.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 6ab05d7d297d..31dc87cfa1af 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -558,22 +558,20 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 	struct fuse_mount *fm = get_fuse_mount_super(sb);
 	FUSE_ARGS(args);
 	struct fuse_forget_link *forget;
+	struct fuse_conn *fc = fm->fc;
 	u64 attr_version, evict_ctr;
 	int err;
 
 	*inode = NULL;
-	err = -ENAMETOOLONG;
-	if (name->len > fm->fc->name_max)
-		goto out;
-
+	if (name->len > fc->name_max)
+		return -ENAMETOOLONG;
 
 	forget = fuse_alloc_forget();
-	err = -ENOMEM;
 	if (!forget)
-		goto out;
+		return -ENOMEM;
 
-	attr_version = fuse_get_attr_version(fm->fc);
-	evict_ctr = fuse_get_evict_ctr(fm->fc);
+	attr_version = fuse_get_attr_version(fc);
+	evict_ctr = fuse_get_evict_ctr(fc);
 
 	fuse_lookup_init(&args, nodeid, name, outarg);
 	err = fuse_simple_request(fm, &args);
@@ -597,13 +595,12 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 		goto out_queue_forget;
 	err = 0;
 
- out_put_forget:
+out_put_forget:
 	kfree(forget);
- out:
 	return err;
 
 out_queue_forget:
-	fuse_chan_queue_forget(fm->fc->chan, forget, outarg->nodeid, 1);
+	fuse_chan_queue_forget(fc->chan, forget, outarg->nodeid, 1);
 	return err;
 }
 
-- 
2.52.0

