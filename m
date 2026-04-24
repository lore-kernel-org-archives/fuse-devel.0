Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7DB1A9F96
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993486; cv=none; b=ESLLI6ZOjBAWjGjnxygbqMhpLbtNJzCht/Ru5fkxgzDJKsUlrZar9fGgb+dlm4Ez2HAdtlsrpcqibGfmkJQH7xqEQ8SsPZrhjxGlSp9tcYluYDfz3B36YVPLKKJXi3Z6d9I9Wm4tCbnzUQHXeGeXb+5g6NynKvk/vHhZR3qnPIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993486; c=relaxed/simple;
	bh=i3zXaF7y8U31UDvf00I++RM2rUHa6VZBcbalaCWE1zA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eB8utzpFkmKAtLPQUAleXUmph8WolpnAHNkGt7O0rXasR1WkktYgsdCvWTAmNoTUvYuietem9anI94HgYZ8q26MVVX2ug7xvWeooOfrsp0Z0AIdK25Shp903q7P9oiDGOWEH/jPEW/+AHLJxatUE7RBeGEKygBs8/RsYUziQjEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crCx0jqN; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crCx0jqN"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso2633188b3a.0
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 18:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776993485; x=1777598285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i42/P6pPLsjBailhIrXsBLv1DOi8o6YntkL6jFxcCWc=;
        b=crCx0jqNDv2ukfYQRwZsS4Pyp1AcUfjbPYopxmPIbXwsjoJp/5UWau9l7Zf5gw+wZR
         XkAjilcUtnX48bEuP4RvFQK1G/1iTha+KSzZ+7p5R2SPKxNgRii0lV3BD7J8xJdWsgrt
         D7aenNQV6VTXQ47i4776i4LpxPrF1hm1o3oj0PnYXMFI87CImOQ+ubLicKx5jVMAUx0M
         1GezlsAddp1QSbWjNDbub6oICGlStdInLFYp4oNpepYH7paxfbzwfXEip+b/g2DyM5zV
         eUfm4V6Pr1NEnNCabyhICloIhxFQxy+nWw9emVwb9B+IGtSBnybzMD1zHMSf/cVcLnke
         RSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776993485; x=1777598285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i42/P6pPLsjBailhIrXsBLv1DOi8o6YntkL6jFxcCWc=;
        b=k0Pv56bt4AnuhZAbTIFWIi3iIR/OhW3wMtUOqDa9PeyQCpVvC9hsA9r8VVX0XS6VeD
         cvMJazWO+NU/fP3/vkDnOB9oEoezqTAxGE1FNV2strlouFM4zpcNMHXJ1ovtqJqXmjHu
         vCO56y80yKSTALOM0fpwbHXz0PI2TtG8957xb2LSWfBsCLpLgfLMmR+UN5mDLJhMhNG2
         MJ/sDHgTugmdHwC0XgRblZJjCt/toKigGAIFDACoCn20tCZu46w30tYLnVbRzWaCDktN
         Sz8KLNmz40vvkOUc+lETFHMYvNAMiS+VpBVbC32Xjp88Qiv3URi0bouceD1LiGd60KKM
         /vgA==
X-Forwarded-Encrypted: i=1; AFNElJ+Byh4nOEDQKGQhQJmxeEpHO5rEBATNcUJzkloqo3e+Eoyqzft5C+r9bddfhLZhPosy3flQKmbXenfC@lists.linux.dev
X-Gm-Message-State: AOJu0YzPBwSFzxbMzMiv6JcS7NQbH4SGOsxnZqv3bLMA5zuH4w49ZwvN
	skRuaxOtzIYK8HglfrwgEJcPNkn9q0B1o+1aNbtmZArrPhCmDAIx7nEo1Dr8Aw==
X-Gm-Gg: AeBDievvDLrHwn2FS+YpB0dYTA0OKjweptxotyn/X4Jy4P8k6JmkG3ThOXIZu6Jr3nl
	e2UGyZBaUjoLPGHjCmhamsgdDwYnhhs3FSpYXLOaDtvnf5H015BEMe/b92QduS/A+jS8upXhM1p
	IOXkoMDPfr7Bce7qRgajfTvdfsKIo3ZDnG/7K63/tputUJPecBRvadlISE+7hJY9heD/Ro0t3xo
	v4YdXVxuyVWsMn8/8ogb6bZZqY0OO8ZBharO0N7EENtzIcL8WJEQ8rlNVDcx1a+zi2TiHREXL7t
	QgFz4xcNnNkG3YxIdY+LbzFomkCUN8bAlhjhMml1cO7e+WeGygW/1deT79ej9AadPzAVbbm3wb8
	v4DzSlUsjgi4tesRfkumQNdcX7SAKVsJ2EZ22zozzJG6bsPLCdO7luAwUa2BeM0NUcLd2WIRpFV
	o5+8tSV3CchOYwfoKkkN9poxbJgJg=
X-Received: by 2002:aa7:88cf:0:b0:82c:2205:507d with SMTP id d2e1a72fcca58-82f8c92f8c3mr31281919b3a.36.1776993484645;
        Thu, 23 Apr 2026 18:18:04 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:3::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe40dasm21248238b3a.40.2026.04.23.18.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:18:04 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 06/13] fuse: clean up fuse_rename2()
Date: Thu, 23 Apr 2026 18:16:39 -0700
Message-ID: <20260424011646.457682-7-joannelkoong@gmail.com>
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

Move flag validation into the flags branch and return early to eliminate
the else block. No functional changes.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 4a6c9e2340bb..b87236af4bf7 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1293,10 +1293,10 @@ static int fuse_rename2(struct mnt_idmap *idmap, struct inode *olddir,
 	if (fuse_is_bad(olddir))
 		return -EIO;
 
-	if (flags & ~(RENAME_NOREPLACE | RENAME_EXCHANGE | RENAME_WHITEOUT))
-		return -EINVAL;
-
 	if (flags) {
+		if (flags & ~(RENAME_NOREPLACE | RENAME_EXCHANGE | RENAME_WHITEOUT))
+			return -EINVAL;
+
 		if (fc->no_rename2 || fc->minor < 23)
 			return -EINVAL;
 
@@ -1308,13 +1308,12 @@ static int fuse_rename2(struct mnt_idmap *idmap, struct inode *olddir,
 			fc->no_rename2 = 1;
 			err = -EINVAL;
 		}
-	} else {
-		err = fuse_rename_common(&invalid_mnt_idmap, olddir, oldent, newdir, newent, 0,
-					 FUSE_RENAME,
-					 sizeof(struct fuse_rename_in));
+		return err;
 	}
 
-	return err;
+	return fuse_rename_common(&invalid_mnt_idmap, olddir, oldent, newdir,
+				  newent, 0, FUSE_RENAME,
+				  sizeof(struct fuse_rename_in));
 }
 
 static int fuse_link(struct dentry *entry, struct inode *newdir,
-- 
2.52.0

