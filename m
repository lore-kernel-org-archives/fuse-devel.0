Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DD117557E
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993490; cv=none; b=WYqqu1pyPkT/xs3E5+rA3lF3U/Ka+8kUr4XR8hLRol8eBdRdFpGoHrcqCuZec3Ppt7HcWlxhDYsFiChACmIiQwUpA1JAIwQaMSpdU+B7lb6RBSHGf8gj3ZGcEkKnKjW2bFqBJxuKGaDvVz1HeCKtDp2qenp8eezh42KZj77PjSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993490; c=relaxed/simple;
	bh=ZgyYr0InxfdBucZTKiwX28daGCyb79hcRDgx3AzTb+o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fiP03F8sLlXUSZ32ACLpumBqDBXosbhasAOpXkmcS8qd/qh9qCwbHSVgBo9pBjiU+8mufCwu4ewmjy5gj0RZpb5ZiMkj9sQNmzGpKdbUf26oZ+JZeyv+sWe/m5uKBMmidJ7tBMzAJgHqa6CsO1xJm50oAjaVaU8Bbbzm6zNQpy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7WfW4C6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7WfW4C6"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a871daa98fso48251925ad.1
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 18:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776993488; x=1777598288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qq8QNzvLqWQNaPAECZY0dePpFSOEV2v27JYDLR0jH3s=;
        b=Y7WfW4C6NIV8FrXLrkHSBfGyPanKQ00qIAPPk34mBK96bHhGJ42GPmfIG4yEpmyfxV
         4QwmY9pdQD1M+95g1cVj4ABUnHTSEoJEALAYm2jshkRvLFyK9OnJI5paWDTs4zswRY5N
         bijNsy+blboQ/6kZQj7aKCE/+c6LulaGjqEoOQwkTasWnrT5mmLVDL+v9R0UeBJS0zEE
         3NOdXsG3rcJIFvAdtwCjC/t77kOMflsbBk57dojxtyKrltw7XiKWIgZOE5aqH7DZ16gh
         c4S6iMNASzVRRzLHJ7NTMQUPgV4hRIIrQ9abD3pnV33kQqhsTxxzrAPtSahfG+c4zAwS
         h+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776993488; x=1777598288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qq8QNzvLqWQNaPAECZY0dePpFSOEV2v27JYDLR0jH3s=;
        b=FjlmiRRmPRtVAR68S1DoSvg0Uw+IUaHIvCvj2pxdWSJvoAzO1b57oJ7stF10G3JkFJ
         PS3n77/RKN/Pvs/Jd1+WHmV9/dEmF5KIf7hHyzdSdLoqerT5jnD655yBZ/V+mAYdX7vy
         gDOoyCqssfQngpIXsSFns8OLWJEOKBgt2M5rx0vuXaRdLtlcsFbN9Gx+X7Fn8Idc1zn2
         V7NefEQroEnQWB5lWdDg3z3yeivd/nHkIFIsxpMlnbPbyGiJ3g0FfFiC446WAafOeX5H
         DPKij55Nk/TIF9jpgf4SVStLbCLZA2OEInAC5ws760VCPbOLNH/Bk5v8qybgEyUc+HcZ
         Ur4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+CV4GU6YdVn/oD4WQ6ojjk9XVu9nEzftuE+izDBJVCS8q91mtH3bM44211SfzgKUms9LkOZt2PSQ4/@lists.linux.dev
X-Gm-Message-State: AOJu0YzkgRTQCRX5cNJxlW7dxJIkDOch7oV+yK3R5gHRUAhClFfsdPla
	3Ffnjcbhpm9vNxfSAKv7zOvPJrRPfwsxTrJx9qpLx5O/IM+lic6Vdoyz
X-Gm-Gg: AeBDietAP7mocHm7T7XuTvmTtYYGk+ZnbHSWDOd2gN/btz3w2OWBslGIgnWUTKhcaiN
	11Pbh7JriZQJXQRPPYbWHwGxVHRQ2yhbChVPglICuJQV+P35Yw292aX2t9p/1HAp20kNA+pSoKs
	VC9C9jTtHcIFNb9x9wySCOYdkzVvbzyVl9l4MVIdegwY8FNJLLCjyXNDZsb5XBeIXbzAJKEoY14
	g/W1DbGOyhubsPzBkklq6VtkQ98mriwHuqmvMx01p28wVYclq+m7ON0nWjEviqfla6vlohlOkwP
	0FJYnAe9+uzXAwD15s+qnsS+ZbrtYBIYGiW6Vg5gP1qVcEFomi8xxkF1oZVQ12F+Lb2bNPQrQgn
	zZ3pqtaWCoNKu5u6URFZMdLhN8PwgqD6GpxUQNp2hP8fpnPOVE1KbAzTEEeuHIV6CrPHpU5GDj5
	Q9NKZ8tCqj+nrg+KOaOOOAbc6X6jS9M2TcwUgt9Z0=
X-Received: by 2002:a17:902:ca8f:b0:2b2:4cd2:e162 with SMTP id d9443c01a7336-2b5f9f61d80mr207792985ad.34.1776993488461;
        Thu, 23 Apr 2026 18:18:08 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4d::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff409sm260813715ad.14.2026.04.23.18.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:18:08 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 08/13] fuse: clean up fuse_link()
Date: Thu, 23 Apr 2026 18:16:41 -0700
Message-ID: <20260424011646.457682-9-joannelkoong@gmail.com>
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

Remove goto with direct return and have -ENOSYS check as an else if. No
functional changes.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 45bbbac8477d..e4d80069c3d8 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1326,7 +1326,7 @@ static int fuse_link(struct dentry *entry, struct inode *newdir,
 	FUSE_ARGS(args);
 
 	if (fm->fc->no_link)
-		goto out;
+		return -EPERM;
 
 	memset(&inarg, 0, sizeof(inarg));
 	inarg.oldnodeid = get_node_id(inode);
@@ -1341,10 +1341,9 @@ static int fuse_link(struct dentry *entry, struct inode *newdir,
 		fuse_update_ctime_in_cache(inode);
 	else if (err == -EINTR)
 		fuse_invalidate_attr(inode);
-
-	if (err == -ENOSYS)
+	else if (err == -ENOSYS)
 		fm->fc->no_link = 1;
-out:
+
 	if (fm->fc->no_link)
 		return -EPERM;
 
-- 
2.52.0

