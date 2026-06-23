Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F24A3C661A;
	Tue, 23 Jun 2026 09:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207737; cv=none; b=Oqnrsp80eTkr4u9sBa9dsn4PL3JbwJX4Y6PuTSAbBFeaqmPvjEGkTGNdDvb941/ZN6MyKSrLHCUbzBsHqO4UlsE7wT7XC71JSFwuCORv3TpeZJFz3uI8hufkPa9+rpdsT3UIVR9TSv7iTqMqa22slVTrbpwN+dXn8XVZxKz0G+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207737; c=relaxed/simple;
	bh=Z8HVg7DZL3ms/UrxnHSOD+ZNwaFokBdndn0TF5itYh0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YZqO8Upotx5zQ7AnfsJoD+lvmkFBBmDkHjtC1FYk2Bwp1RFE8UAmnZWakvR6K4y5N5PGGkXqoCdb5OS+X156jnhf6qnQeaW5uzfd/OpLlBweZR/wBnw+iLasobQikv876VCdw8Ze1fcpc3gAyZhTscxUktjR8XymBK8Z/2f0VyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=NEaDLvEP; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="NEaDLvEP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=8tG69ufJmOMVOeIT73olZ2Nz+sp1lDRv5Fl+mWbKNo4=; b=NEaDLvEPDbUd9e
	JpgRcfZIsEj6aAhrpRyOhxLkMIfBB2SkxzFABXxDWv0b3OTdKITCdX6IRR8NxJT2vxsLgml0CHL/Z
	/QGRj4qQ3BDiqIVE1l8RhzXxe2v26SphS+FpuycUjWHA4HLxnXMZkBfaP7VOQP2gOmm8W719soqoO
	Iytcqi+Z3dUeEYMDFK3/rulcxsKHZQhnXD104Qi9rErhPGwBwtG0tb0bNo0yAk9vcMJRVNlDJxRet
	4BueFmfsx4toGkxzHR3kW77yZxJnrxIfrqBQr5sz1QpDKt0yCEwkgBCRZljFv9x57k2yX3zK4je93
	4EGqXplVzgwwYOgqhb7g==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wbxdv-006gFR-IZ; Tue, 23 Jun 2026 10:42:07 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wbxdv-00000002qXf-12Ul;
	Tue, 23 Jun 2026 10:42:07 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Miklos Szeredi <miklos@szeredi.hu>,
	fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] fuse: make dentry_tree_work static
Date: Tue, 23 Jun 2026 10:42:06 +0100
Message-Id: <20260623094206.678569-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

The dentry_tree_work is not exported, so make it static
to remove the followign sparse warning:
fs/fuse/dir.c:37:21: warning: symbol 'dentry_tree_work' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 fs/fuse/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 0e2a1039fa43..1fed11c0ed9a 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -34,7 +34,7 @@ struct dentry_bucket {
 #define FUSE_HASH_BITS	5
 #define FUSE_HASH_SIZE	(1 << FUSE_HASH_BITS)
 static struct dentry_bucket dentry_hash[FUSE_HASH_SIZE];
-struct delayed_work dentry_tree_work;
+static struct delayed_work dentry_tree_work;
 
 /* Minimum invalidation work queue frequency */
 #define FUSE_DENTRY_INVAL_FREQ_MIN 5
-- 
2.37.2.352.g3c44437643

