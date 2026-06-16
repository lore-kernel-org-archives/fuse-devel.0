Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A10D37C0E7
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 01:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781574270; cv=none; b=ZlsaXqBsEk1KGFPZwY7zNaxX+4aIYaYJqVZXDoNPhBZKftdKVdUUmVe8bn69rWeSkl2qs/hgdAbIUVdHWiEMKbrLDC0ejcTxfYTizal0KoBDSEN9mrtc3pnBkt/hSrDdM0b/ho4c+oRWWOaGQUH88OP80cU6TGwS93jdKimTLnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781574270; c=relaxed/simple;
	bh=j9Odu66lZt7PcnJ5WT6Gll+t3YwuMxXF3z8qxx3vhWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okTfkvyMHj7OX1ckwZ5396ZV5tlJ53ZLA3qUrmbN1GUj7BFOXQcTXTJEjDYl6jzEEym11jqX8+m0ZT1ungBE9DgE3gLcMXtsoizY9qKskBqqYun16gSx5YcoQXWVZHVd80zN3dv6QTfDsunc0UgbPpyygCZB7/i6AtkopQvf9Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBF8dSEy; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBF8dSEy"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-43d23173511so2497547fac.0
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 18:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781574267; x=1782179067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rowMkOrmg67Cdi/fThqMQCof2a6yJIMp5/xtZueyJc=;
        b=BBF8dSEyNKtsZjeX5LVXrzm7r+3xPUivwIvuZJJmI6LYCcHawnXf6NL5LCwBSTVNph
         DkVsitlGuiILuduUsNSla7/KfaiFL8LCnpBwscixxTb5/CDGv87rB4qhwVt3jmgC7dsN
         jr3qRCRHJC31qNo0ip6ZG6uzzo5k6BD6r3rQ3gvSvi+5PwT6Uks10xb5ceRgxq9PlImO
         iIPckAe+5k8v2rV8PLAhko39PmC6/kF/VWqkVEaPzpZwJ0Xu8f2v8FYVPkUTQy4rXp+p
         JyuSzbprLrJ0CpSiEijLud4smjm5Ql1BYHIhAQN74bf80n3s8xwk4wRFPi3aA+UVvTcP
         T9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781574267; x=1782179067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0rowMkOrmg67Cdi/fThqMQCof2a6yJIMp5/xtZueyJc=;
        b=Qf4hF4WBZ26k3GRvU3Oo2rknxcHdY/nogjFcNoquhfKTSM0BjJY/hGLvI99uCJser9
         rqSBN3jGH7zlAMGv4jwQ0CvjsxbH8huZ1T31f8bV5v9fMIps1pzEZY7BF/2aMywThjgx
         HbDebWfOlKAqCd2S7ZD6VAM8te+9Gr0/MbD04NHEhPP7dhHspCdLMlkyy3sHAbdS1bDw
         f2EfqVPK2984xfTsAvsHvv38WgGGhhKK/Ag1q9GaNtD/R5G4AR9WXAKadLXsGr4LTeeU
         Fieg6Eia3YrZ0J8oB0PvUhwwdoc2v/9fg4LpMtVapZM75jq7LWy02O4iQL0/ualWQ67B
         iRmA==
X-Gm-Message-State: AOJu0Yx3i6zbLHuBPnE97/3bKi5+OoH8pUNW8SW78jnwvbdz1YvyGQlL
	+PoJ2WUUPtoSqIsP2NUWB6cgE/T27ri+ABnEvMzZfQO1XqSmgopX+cLZYCzO+w==
X-Gm-Gg: Acq92OHyyys21GctEJLxjen1RsgWZ6rnqd6L8+vYAERloTQXC4J0UcJyjSwDjGnXdim
	kafRLZTtNdSqfh28JpHJxH7OA46VMdVsbu+OYXydLLcbuaCJs+jzFXdQswiPlRrvQMEqT7dksUF
	GX3fKcITZuJaloUj/tfK+ah6J4FD21XKY78+++eD4T+kNilv4v2JNHyAJ+ccMiN0pxqarYLUqhh
	dsPXeHLtnOmm4K54dKjNJ+LAtZhg0Wq2TtRsqPyJ1pBTjHkabwImJc3AdfgqtCA2HgBICzF/7z5
	//Psltf6e7k+gWySkoPYednZyIp9VZuVf8oPwFbPNW5srhyX8ZBxlDpfEUMR12z2dbGP3T9jn1Y
	BtnXCOBvqkklsDAXlqKwVCk6tIJnhVhBf62zdPitm4dcJg3b8e3E6gd8KLjobOf10NdSMng333O
	dlzkN50rU2PgGQl55WsMavJ12iwk0Bky2wTNuLCkdfZopw9qfIn6vpEjdYJnM84DkyTgSl/8k/N
	KKDZ7vaW3KQG+du5PrxK2bOnvk2VgWuHhzEVb7GTuby7XoOaBVR0i0=
X-Received: by 2002:a05:6820:2005:b0:69d:e555:2246 with SMTP id 006d021491bc7-6a0a40439aemr1269105eaf.32.1781574267105;
        Mon, 15 Jun 2026 18:44:27 -0700 (PDT)
Received: from rdf-gcp2.us-central1-b.c.storage-xlrait-66065.internal (163.80.112.136.bc.googleusercontent.com. [136.112.80.163])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69f00b41ed1sm4093011eaf.0.2026.06.15.18.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 18:44:26 -0700 (PDT)
From: Russ Fellows <russ.fellows@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amir73il@gmail.com,
	Russ Fellows <rfellows@xlrait.dev>
Subject: [PATCH v2 1/2] fuse: preserve FOPEN_PARALLEL_DIRECT_WRITES for passthrough opens
Date: Tue, 16 Jun 2026 01:44:18 +0000
Message-ID: <20260616014419.7913-2-russ.fellows@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260616014419.7913-1-russ.fellows@gmail.com>
References: <20260529031918.7361-1-russ.fellows@gmail.com>
 <20260616014419.7913-1-russ.fellows@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Russ Fellows <rfellows@xlrait.dev>

fuse_file_io_open() currently strips FOPEN_PARALLEL_DIRECT_WRITES whenever FOPEN_DIRECT_IO is absent. That rule is correct for the regular direct-IO path, but it is too strict for passthrough opens.

Passthrough I/O already bypasses the page cache through the backing file, so it does not need FOPEN_DIRECT_IO to preserve direct-I/O semantics. Clearing the parallel-write flag for passthrough opens causes the kernel to drop the server's request for parallel direct writes before the passthrough write path ever sees it.

Keep FOPEN_PARALLEL_DIRECT_WRITES for opens that also carry FOPEN_PASSTHROUGH, and continue to clear it for non-passthrough opens that lack FOPEN_DIRECT_IO.

This is a prerequisite for passthrough write parallelism: without it, the subsequent shared-lock path never activates.

Signed-off-by: Russ Fellows <rfellows@xlrait.dev>
---
 fs/fuse/iomode.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index c99e285f3..0301a48d8 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -216,9 +216,12 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
		goto fail;
 
	/*
-	 * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO.
+	 * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO, except for
+	 * passthrough opens which bypass the page cache regardless and do not
+	 * need FOPEN_DIRECT_IO to guarantee direct I/O semantics.
	 */
-	if (!(ff->open_flags & FOPEN_DIRECT_IO))
+	if (!(ff->open_flags & FOPEN_DIRECT_IO) &&
+	    !(ff->open_flags & FOPEN_PASSTHROUGH))
		ff->open_flags &= ~FOPEN_PARALLEL_DIRECT_WRITES;
 
	/*
-- 
2.51.0
