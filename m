Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573024;
	b=P5+0zgXf1bIiv6S2dZqV1Qq7cvjxvnvF4FbkO4JwGoAx5f6XoRTNp7zCCbVoBJqIBFE8
	 ssA7hF9a67j4Xw86fQz3qWEsHVVHp+nu+IjSUv8uQocshbMgR3jaiLJp8DUvY46iWMf1m
	 ndJ1TBAnY53vSCRBYzHgE/tmuKVENX1m4CN1194w3oybyPwPKDD9C+7198RhzJf+itbQ6
	 n/Aqd/DhrK2nrwLrwrRbbJ2JtWK+ftD6PSlaLSWV8iXb9ZMggWxCTNPfVfevxRaC/vQ9k
	 vQQFiisWZr37Q/tAoJfjpk5AJMO44CihcQ+7Kgq9KyVf8NA7FDJmCHByw8hGS3debJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573024;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Content-Type:Content-Transfer-Encoding:MIME-Version:From:To:
	 Cc:Subject:Date:Message-id:Reply-To;
	bh=73ZtcKTp5qGNrKuDKOASNH7OCvD7u5plmVey8zIUu98=;
	b=wSsbzXjGJnXQsPm/6kgA3UKk+rEqVg+CkbVIbriXTf6cn4Z4ZOAksZC1FC+4iMWxcIX5
	 L4FOv+H5TncjvGf89Nr1y5ASSkqgDsw0GSwtxwmZn12fkO06TCpM3miXLMOJiXTW1k2Xt
	 SLyIJX+g8M71qyZV0XlSRyPKseV1hrlA2Cb+WPlFeKM3tCo/LUsJlBtS4OcZObUgTKX+g
	 mh0ZEfdDUt9cwRWGJMwFwJOZQy3HB+J0f/5luhRilp2lJO6Tp/hG9Ekgxcsz9bbnldUgz
	 QD9mUTVfUVgXEMOD0QbO0Odg5eVmyoWRFvDKNPOy3K0FxN+NrWiqgGiEa6g+Azx8vzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b="cf+M/U54";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=GTTOz4gZ;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A548606A319
	for <fuse-devel@lists.linux.dev>; Wed, 21 Oct 2026 08:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A548606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=cf+M/U54;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=GTTOz4gZ
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AB3AB7A00FA
	for <fuse-devel@lists.linux.dev>; Wed, 21 Oct 2026 04:57:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 21 Oct 2026 04:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:reply-to:subject:subject:to:to; s=fm2; t=1792573022; x=
	1792659422; bh=73ZtcKTp5qGNrKuDKOASNH7OCvD7u5plmVey8zIUu98=; b=c
	f+M/U54DCPwupnUKh+2cK9KnKE1wnY1bNH6C7a0WPkFTO6lU3+FfByZueQUoEL0k
	PcFyufntypac426bd+nyhcah74BeGHEjSPnJW9rKGp+B2r1ImfAhS3AxiUu9zMn3
	dysxR1ua2HdX2rsp4XYLJPICMUlUDO8vW0zb/45ixIXK+3ZPDZSYz7LfhtVr23/7
	UiUXjD+QUzZUsHAfzv9HAh/jfAOSS/2e+ZkLDIOmLEudb2nkvqjH4Z++Rl9DEp25
	iO/kDDdLu9jAU5gekGlqPrG59niS39zLyTk0mxiIJgrGeEGVQzYizl+utv/f+fN0
	HEzzeK/MsWjT4vsZ6zwiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:reply-to
	:subject:subject:to:to:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1792573022; x=1792659422; bh=73ZtcKTp5qGNr
	KuDKOASNH7OCvD7u5plmVey8zIUu98=; b=GTTOz4gZE+CajpHSyaNRD1I5PGh3A
	3Detz6nELm67Q7VPkuNGhHJiTwHA8AHIlwYj3LzXwdYF8bUfdN1QfAJrJYggcCU1
	UCqIRB0YhuVtL0Oa9wky/ods6e7nhltnoZGKtLpOl6yTxuBzKZ/Wbz0VVxX8GCTp
	Xx7qFAW9wavLx98d7A3KmJRXNr1WcYfZy6WdwsSeGD8/Q9FH0NjS+xrJt3RB2ZY1
	TEV/2m5VpdkDLYIAL5fhLhWMzfE72AFpVMXCR+fnOxBXb9qF3yvvf5H4y6Ai5V7k
	evw5i4k87oCGDcoYsXGW4QPmUr2d/Uik8dFDSJWO1uUvMNcP1CMF2S/sg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792573022; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:WdXUPRezY5I3Vn310PWBjMXIlgGh1ecsMhWKN1WZhmgRMsm
	QYMdnDX6GDXRwCf7bxg2yoI4bU6+C70rCUf9R0j0NrlcZkr9uYzDcGZM4wJd8psF
	rfvHdBCmhonZktZ2SOX1RVjqWIkcA+GnhiaPLNsNfU9kaY5PLPZoO2F2wUaLEnnp
	aEu8tbrHMjHqFU3BoAFCMiXjqBpAFHg0HZoFErisNmxaRMsIgH8zTtY6jhQQf9Tu
	ouH7unaQ2vYMnEFIUeaBSTPyN+ie+LqCIETxhLKTZE7kyuSYYnb39GMPXHg/b5Da
	2ZPFJK3fRWZtnOWpvSjEbcpWxi32+3yJKEVrVkg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,reply-to,subject,to;
Message-Instance: m=1; h=sha256:gmsX5G4WHqW21YPVxTxvGvA+U/yAY6suceskJXD8xrY=:DNkLjtnA3/vU2pwEgI2OVWZ4RMUX+DKU2QGuLCQuaMo=;
X-ME-Sender: <xms:Xn7Yagh4ZMMVCzVJFTaTmcVBS_xWURLK0YVAVpjv-BHH18e0vmYECg>
    <xme:Xn7YavDqkeXZ954gsct_7C_Bb37fw6ov3IC5URUZOej0WeVe28efuRGtJKqBAWUJI
    wTT74Iwuw4Tizo7S9kKEbTrMvKCOXfReaRnPJXZLEC1ifh9sXM>
X-ME-Received: <xmr:Xn7YaluevcFPItnnnFEH-RFFtxV6Me_C9FNtMuf5n8zUPCk6BklSb3lt-45KekaZRJczlYUJzz61M7Nkc2qpuJWzzWpzb5s>
X-ME-Proxy-Cause: dmFkZTEE1a9noe6MOUBJS28U/tHT63+klxLukyQ7MetaeRz38Lc80MHTr4s2HbkIIgSeVf
    4tMmiJh6yHnjK+yCP5McU0NWz8SMUar+wb/1vojFWbiLzMTA5u3TObG/d8s+DHWyKPf8Uc
    ZQ4UuHvGJgCBJqa6474PS/RRSwqemsbaaR8MybNdP0SRI8P2IPK9O0LKwlYxY5noY5MnEd
    HeOX7goskWmfb40vvqR9ayGqcHLRmKnDfX3HKoScJSbOiZiL7h7u93fliK+EUSHM/XtbY0
    y0MHA3Jdw94Iwj0qnoQqqZOkJUpUmghW4bqjutG9NFqynpmYp3AR5cVLhwHE/IBzolRGst
    MRRaTFHpDyqnbNwTU/uEPcM9eazCoBYRl0LdZBtV+zNQ7BltIJFrMa6do+aGEw+EnLxt5d
    ykTyt3ckpORUFDraMbnXn2M4exUvF1pS+hhTv7eJ7Dt6uAEOBZdK6x6xaIEQQCHkF2Pl3S
    6TnOojNInxkiDteSkLzNxHh1HPHCN3X3wg4/JeXGbPrpE/zuDiyRRAUHvkfB/+q3e5t5pF
    lxCr3fLYctbIxVZh7ldY+ZY/ziCoK29X5BTqUjcXmImPgCtKxz/elmz5iEswb8w9VnJSfQ
    SUR8svmJ4HijCw3j+GtEuTSc/iQ5yEWx9WSaDoHuJJFZwZWQW7NgTWFGjWyQ
X-ME-Proxy: <xmx:Xn7YasZ3wOc-j4l2u2rk6mH_f8QAQwpFxi0vASoR_gaaXZM9GampXw>
    <xmx:Xn7YagVh3aC3_rd2zfvah7EAQAwCoqcBnBkt5mUxES_w_faEj24D5w>
    <xmx:Xn7Yao64oMdmgRJO__LLQfWAVFqLZxj_PFxWQr_ISph6BfN4fLL10g>
    <xmx:Xn7Yajjbuocb7XHGfFDDLPN0nTqT-Oqu3fAjhFWSh6p8NjB8grzu-g>
    <xmx:Xn7YanzKtQBUEIUWTlHmy9f-tPqhMoX13_ktDlLWlrVZLi_cnTnkSa-J>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 04:57:01 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev
Subject: [PATCH v2] fuse: Use d_alloc_trylock() in fuse_direntplus_link()
Date: Wed, 21 Oct 2026 19:56:57 +1100
Message-id: <179257301723.1724252.3370267307562330639@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>


From: "NeilBrown" <neil@brown.name>

fuse uses the results of readdir to prime the dcache.  Using
d_alloc_parallel() can block if there is a concurrent lookup.  Blocking
in that case is pointless as the lookup will add info to the dcache and
there is no value in the readdir waiting to see if it should add the
info too.

Also this call to d_alloc_parallel() is made while the parent
directory is locked.  A proposed change to locking will lock the parent
later, after d_alloc_parallel().  This means it won't be safe to wait in
d_alloc_parallel() while holding the directory lock.

So change to use d_alloc_trylock(), which doesn't require full_name_hash
and d_lookup to be called first.

If d_alloc_trylock() fails with -EWOULDBLOCK or for any other reason,
the consequence is only that fuse_force_forget() is called, which is
required to keep the lookup count on the node consistent between client
and server.  It does not cause the readdir to fail.

Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/fuse/readdir.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 5ca87151d70d..3f3e1a921a9c 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -11,6 +11,7 @@
 #include <linux/pagemap.h>
 #include <linux/highmem.h>
 #include <linux/vmalloc.h>
+#include <linux/namei.h>
 
 static bool fuse_use_readdirplus(struct inode *dir, struct dir_context *ctx)
 {
@@ -195,14 +196,11 @@ static int fuse_direntplus_link(struct file *file,
 	fc = get_fuse_conn(dir);
 	epoch = atomic_read(&fc->epoch);
 
-	name.hash = full_name_hash(parent, name.name, name.len);
-	dentry = d_lookup(parent, &name);
-	if (!dentry) {
 retry:
-		dentry = d_alloc_parallel(parent, &name);
-		if (IS_ERR(dentry))
-			return PTR_ERR(dentry);
-	}
+	dentry = d_alloc_trylock(parent, &name);
+	if (IS_ERR(dentry))
+		return PTR_ERR(dentry);
+
 	if (!d_in_lookup(dentry)) {
 		struct fuse_inode *fi;
 		inode = d_inode(dentry);

base-commit: 3879f51857325da9bf3cfb073280257cd16ae067
prerequisite-patch-id: 7676a808b4e89a9a548066cdea1e522d5248fab4
-- 
2.50.0.107.gf914562f5916.dirty

