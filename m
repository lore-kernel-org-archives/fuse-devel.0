Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA5D3BA249;
	Wed,  1 Jul 2026 11:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903652; cv=none; b=sQJC0zZ4Eez48l1jUd9w2n7We1wajWsB1Rne+011hcdn/OcVO0IBM9fyIFuIHRv7bYuaqQk/+XOPz+Dk+6YEENigwxj+WwbkcSmU5SGFLu11ynvFFPv1L16E3a7lsD7BGk82HQw61oQokAFMvBtMUwhPDDUaKMjfAXNPppM3DWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903652; c=relaxed/simple;
	bh=skVkq1E5zvgV2tQA4cFZMtKn7F88d8U+jQqLuXjZ6qU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FqzM7iJtLeFzma59eqhZg8ArwlDCyn298pu5lVDS5yXTr+iMCt80gFp+ZQY3Q33Evw9HW760XFqBTnupeoQgd2xDt6HOuvmSg3f/me/dB76igYOM0HqQjYz0s8AP//EAXxXbJ9AK5gL+OoqZSe2Lpk9/Ltr7425cAooIbmx3Rbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pwj60eYZ; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pwj60eYZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2lyo4K+aUEqVUosK/K9KJkHdGZoGDVEa22W2daoTvI4=; b=pwj60eYZWUfOPft83rjCAkViYK
	cXRB+vctMVHIgAeXrXSzRNVJn6nbSuPtRmiRH3/MiKnYR/IMvWU6n1Iy+lnJLmxzfruepYXgGNVK0
	56t3tvfSjmdaH+blzQq7/nPe6m5N1c9YxL35LZqFA3gNT/pq7OFZDpG+hi6dbq3usYQEsvI8ysGUn
	qJkCCwYxn5Tw8aTOTVQRUcCMJGPntKoY5xsbriAF93+jv95HdyuJAWpSmMaMDpWt5fl1g4GCS9hUu
	mb4mE6pshTERqhAXkje9TdKlBnzpHTg/gW78ON/zr6aSxqLzek2goeMba9wqS3kMh56V7id4IkcQG
	t/PJGrQQ==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wesgP-007WY6-Hm; Wed, 01 Jul 2026 13:00:45 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matt Harvey <mharvey@jumptrading.com>,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [PATCH] fuse: cache POSIX ACLs when setting them
Date: Wed,  1 Jul 2026 12:00:52 +0100
Message-ID: <20260701110052.5309-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When setting an ACL in an inode we can immediately add it to the cache.
This is a small optimisation, as currently an ACL is only added to the
cache when reading it again, which involves an extra GETXATTR hop into
user-space.

Signed-off-by: Luis Henriques <luis@igalia.com>
---
 fs/fuse/acl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fuse/acl.c b/fs/fuse/acl.c
index 31fb50e16aed..c2584bb75ec7 100644
--- a/fs/fuse/acl.c
+++ b/fs/fuse/acl.c
@@ -155,6 +155,8 @@ int fuse_set_acl(struct mnt_idmap *idmap, struct dentry *dentry,
 		 */
 		forget_all_cached_acls(inode);
 		fuse_invalidate_attr(inode);
+		if (!ret)
+			set_cached_acl(inode, type, acl);
 	}
 
 	return ret;
