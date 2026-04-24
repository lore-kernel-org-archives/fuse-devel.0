Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24A917557E
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993496; cv=none; b=ovvXAoeeyXJQpUeTGUjJsk64QbAQPOBO0VZiGRVwQDrSO40CBU7vf3hEuyuoCDhmEkRRE/QqLoTLb9Dz7iytBf9PafjRqkcG+nka2F00rYHuyTCW7o1xw5in/x0EHgkMgzBpPMAIPfURA0PifMhBZQ3RbCcnTt0VXGAxQv9+QLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993496; c=relaxed/simple;
	bh=5K29VPG9qmy3RPiJRvrYQQhELxTpmC4YGriJhwyic/w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s4oEI+OOZ/KqSXFxZmrXozAtYijHYg4Z2XrD5EgkLmVGAnmQuqoTKBozWEhlc+qOd0BbEpp57TuIKtxAF3fMNPEhx5mRYkaTGvk1q3ZTPFA4GomibHczCrEsvkiokEjh5b40B7cpJJ5lqURtv/FkDQcPK0cnG9lMrZKr9CKk8ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLdUvYro; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLdUvYro"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so3554192a91.0
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 18:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776993494; x=1777598294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MW8IAsGWF/P5b0uiHoGfm9LxJzmFi3ly/ooIbadHpZ4=;
        b=TLdUvYrox5EWErlkkCyxQbq61mruQXsT1JO3nJ9u8/NvObDP1hoyXZbYZtRbwtJ++Z
         5nTUA8166W3v9SCiiqXodxqYhwSAHC4oZjxApHGqc9l9oQnXLUz/6KP5aBCndv8PMNx+
         Lej3A8L6HtlrOx6u8C76T+pE0H3xV6FNgD1n4HBABcZIKugE8yyCP/0RLTL7g9AUkrFx
         sE2j6pMHKdPoynLOcDUmmFiJAudsOh5+7tSRW3EOMmYLsbcxcJyyo0MazopMGxzm+dfS
         bARzIsjN73UTwVvqtz2vgyH3YIESCS2IODKTH1E0N/k6N8PT8ELeb3kE1YkTvB9Mlu8p
         Zo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776993494; x=1777598294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MW8IAsGWF/P5b0uiHoGfm9LxJzmFi3ly/ooIbadHpZ4=;
        b=ZLHXF1j7TWf2JzqoWwBYIGHXlPo3xJd/SDvZqu2c44gyuFSQJOWg5XMDgLNY+zqdCZ
         pjT9cUnYjJh1TsNiHyKmz/tlsbCHrh/Z+PHEssMtn9vj4a+dBXInv94bjI4AEaCvikZW
         frKaT03ov5IowIt+3FkjS4gOWkvbaBtTKpC9MFBvd+xbFYCFbGqAMDKTxFnqsnIdzzqB
         DBsdeyHjD59tutNuS4jjpOObbhMxStRLbm2y02ttnmi5nFH0PYZi0az7vRSqZjJoFlav
         xsij5dfs2ucblORICEwewmd4QqSlSLYKr5aqRUqdYgG6Y4vNcrcRFdn/u5pIGWnIl8Yh
         +yrw==
X-Forwarded-Encrypted: i=1; AFNElJ8AUvZYQ44TQGjmGeNyCDEci5RVYG/isilguHGGWiGsdSwcY3Jf+NZ4iQTE+iEf5a/rS8liOjK716h3@lists.linux.dev
X-Gm-Message-State: AOJu0YwnrpOsn9kxFGSi3z2CzpJnStavKfR8X5MMF7A/5GDxLsqgK2ua
	kT9td9/0xaHLhaYMfjG91vRc7OUETFNMO8bjpoEkb1zh5+WceZQM48b7fZI25Q==
X-Gm-Gg: AeBDieubucorXTOaHb2cTHNk7m7F1TmBE9b4rDbSNiRmUoPmHF6YSynxreYnZB8+Dk9
	vUwVQSLnzCUokxj1IfJO52fEdG2GXtZAgjhCNu+3kNrdyiTlQsgiR3Pmd9p/8VE0X1cPd6O60sS
	qAFYk9/OLVSCWwIfZuVLsrFA4xGgh+rTyupubLR/hEeu8oJ9uIdcd1x96Ivxnx7hA/b8auWDLbb
	8ZXmCbgT7ZQ7ZcZtEqwB3gxXjp+9HT/t32PNqTgrWwrwRUDalfyXVGeJUPh0+YErnw14hnp9pYM
	H6TYErxW0un9oP77dviHgw9oC5NtAO3/wZujkVaaSlNjJr8atZloLvNLhfW4E1EsMUicbKcgoY4
	yMiRbECjAKITVkgkPmF5QpvIWEqXfaJ5X+yeBtpZNGyVzcUC5+fL/QTb7FwrgOLuzGooiEC7N1v
	6rA+dPIIIXyWjk48q/4A1fQtLJUtty
X-Received: by 2002:a17:90b:524c:b0:354:a57c:65db with SMTP id 98e67ed59e1d1-3614047a5d4mr31235896a91.20.1776993494183;
        Thu, 23 Apr 2026 18:18:14 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:47::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362b9a79176sm9583656a91.5.2026.04.23.18.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:18:13 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 11/13] fuse: clean up fuse_get_link()
Date: Thu, 23 Apr 2026 18:16:44 -0700
Message-ID: <20260424011646.457682-12-joannelkoong@gmail.com>
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

Replace goto with direct return. No functional changes.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 4f58adb0fdae..f186bf15c6f0 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1847,34 +1847,28 @@ static const char *fuse_get_link(struct dentry *dentry, struct inode *inode,
 	struct folio *folio;
 	int err;
 
-	err = -EIO;
 	if (fuse_is_bad(inode))
-		goto out_err;
+		return ERR_PTR(-EIO);
 
 	if (fc->cache_symlinks)
 		return page_get_link_raw(dentry, inode, callback);
 
-	err = -ECHILD;
 	if (!dentry)
-		goto out_err;
+		return ERR_PTR(-ECHILD);
 
 	folio = folio_alloc(GFP_KERNEL, 0);
-	err = -ENOMEM;
 	if (!folio)
-		goto out_err;
+		return ERR_PTR(-ENOMEM);
 
 	err = fuse_readlink_folio(inode, folio);
 	if (err) {
 		folio_put(folio);
-		goto out_err;
+		return ERR_PTR(err);
 	}
 
 	set_delayed_call(callback, page_put_link, folio);
 
 	return folio_address(folio);
-
-out_err:
-	return ERR_PTR(err);
 }
 
 static int fuse_dir_open(struct inode *inode, struct file *file)
-- 
2.52.0

