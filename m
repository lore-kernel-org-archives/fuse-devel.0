Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41F43BCD39
	for <fuse-devel@lists.linux.dev>; Tue,  2 Jun 2026 22:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440095; cv=none; b=GniFuWDdwBLDDxXP3MGHK7HJkLIYisHHeM3sMc/b0q1dmzQpXE+FzOHoGxGTG/ca46msluqiP/H8w8iEuDjSG7fKeXPIRX7dhS1bp7SyPS3iP2ddmE2stZE6NSwJBpPhi4xE2qjSDUMZWSOGEtrSg1w8xvPwVDJ9yyJ4p74+vAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440095; c=relaxed/simple;
	bh=anJBQfqCpkkieE7QSR3sEiOcNuEBrN+rl6Oxm7d8kq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vla24SxbORChINv5u/Le2R8Xo6Czush1VlL+1PljDVCyPRfx0yn9F4oIgJBLe1VSrD0g7jvYYfRXAe2Pwy4xgbtUeKVPGB+3aOg4q1vBH48fUDlsdhjgAShMcHNih74ROmYLWAPgM0ntO7wyNDDkYsAtwV/Ow9rd2vjuQwyqWgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z9tLDJsY; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z9tLDJsY"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780440091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9ZtFPLiVGfBwb4H3U2XXIZqyHw0d1oq7qglfFlOQDyk=;
	b=Z9tLDJsYbtdD8oKGGGyQZ0XYpKqpBc5Dh6gYEajCLYwFCn8ZozVX507J7cMyvPNTMaE8Gq
	oEXuZzJypSUTh2vEkHdefmqhpETwbZCC3LnM41gBKaGHNBXTds/3wT5Y1I4DjVd/FTORmT
	Z3Hbz9f++eXvPO/zICBEgE0A7Y3Y9So=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Al Viro <viro@zeniv.linux.org.uk>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2] fuse: use QSTR() instead of QSTR_INIT() in fuse_get_dentry
Date: Wed,  3 Jun 2026 00:40:56 +0200
Message-ID: <20260602224054.1087954-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1077; i=thorsten.blum@linux.dev; h=from:subject; bh=anJBQfqCpkkieE7QSR3sEiOcNuEBrN+rl6Oxm7d8kq0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFny0d+WLz1f9DGrWlpc2NM6fxvLwlOqYa9/RNTWFXzu5 C99Vu/fUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABOJ6GFkmHMy2oYpTa/G5WK5 XZDwq9udHxUP6eu6nVZSc/wSWzs7jpHhtV4We/nHQ7MYw+/1Kbk/jov/vURH8LymJ09lzIfeFZ/ 4AQ==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Drop the hard-coded length argument and use the simpler QSTR(). Inline
the code and drop the local variable.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Inline QSTR() and drop the local variable as suggested by Al Viro
- v1: https://lore.kernel.org/lkml/20260422123911.100979-3-thorsten.blum@linux.dev/
---
 fs/fuse/inode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 0897f8e62b4d..51df88e43f6f 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1064,12 +1064,11 @@ static struct dentry *fuse_get_dentry(struct super_block *sb,
 	inode = ilookup5(sb, handle->nodeid, fuse_inode_eq, &handle->nodeid);
 	if (!inode) {
 		struct fuse_entry_out outarg;
-		const struct qstr name = QSTR_INIT(".", 1);
 
 		if (!fc->export_support)
 			goto out_err;
 
-		err = fuse_lookup_name(sb, handle->nodeid, &name, &outarg,
+		err = fuse_lookup_name(sb, handle->nodeid, &QSTR("."), &outarg,
 				       &inode);
 		if (err && err != -ENOENT)
 			goto out_err;
