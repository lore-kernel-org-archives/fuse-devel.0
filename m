Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793885022;
	b=rDH8aod2YFfCif8opxzH69dezKSSV6dpccHXcu8r0dPATIjDEDtOJC3+AqO1WxiTsMqi
	 qTFBfX6wudHcrRP+b2/z/pUh7GKF1NHy6gjqjbTgPggxpewEdl+xeBwHnzZAALvQCIjUF
	 vWapz/eIoDY5zhX7KtvIpfpKgyx0FbmHHr9Kif5QsaMpTHiY8OHQxhvoLOIRLCFoTQXCR
	 TUhYMbWja+rmVQJKEJWHdyxD5Akf0lwfrRa+BrxB7c8rIjO7QofWNb1xYbtj5Boz1azY7
	 KOwVu6Rq45ciwIrrHDJw+T3OkuEdkJVLMYlTvuf7VV2+Av71DqU1Br+93OBdpkV7yxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885022;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+VLJ9DCi18uNdmQrO4KxoMMbpxM69vcNMJhzFr24WoQ=;
	b=optEWiCh8mQjLqHZpzWSy5TgM5wXs4jNi6ajRlOcEbyKxPzTJK+Ik7E8iiDSoOYYDaZo
	 cXnU3i5NsirKPDue45h1uIuLq5mfzMXY9Y5qardNddq9KbJsciAlHc9nCLvMIuAVAKvu0
	 jYXI0Z+G6ZBT2Q24B5t5dGOF2qrwHGnZKVVEHU8QIwWeKVWCQo6D0XbmTkT17NT/L3TId
	 aGY1BaMbOau0AFI1tW/dWFORfDhdVnuSJlHOFvKiYSJKOG3LgkBLgpQ4MQm5XpNok59r1
	 z8wORIewzZO7/WgIJEtHnblpKPzmi2Kx5+WXe+WTqZzf2d7SQO9rgM2ANwribQrl3tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQP6EKPg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B6B606D824;
	Thu,  5 Nov 2026 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQP6EKPg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793885022;
	b=kCEA7K6C/TjjX12q1vDP043LgNGSUp1A0ftBiLqBlb9LNwVtVhrBOToA2FxHSFUrOG6Z
	 eXTngNSQmU0KCYV4t3hc+oaHTO1E2rYQNP3+edLeoYcsYEZqIiAHvucALI9GFfCCqPHe1
	 eyP8I9mAtDgL2yFQoWNi4L80uIMgKLXTQBfBh8sqUDDS7CUbEutnIMLYPLsuoK3t3HS6k
	 Gs503WSLLWUPpG1kGZUna4ZqBUDwapnUslk66Vzp6BQ8kMvgd6rRmaqXb1tJ8Or/2CEAn
	 5cq3l0aqb7JfabWtvOQe0eH3rS1xg2sQqABrQ7/1UACNVgBkVXCYg5ZtA3RjOtm9hJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793885022;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+VLJ9DCi18uNdmQrO4KxoMMbpxM69vcNMJhzFr24WoQ=;
	b=UCMUTPLP9giLemfatTSFbaJmnp557OLgsjlE98ze38hNUfYJztGodEczUOF9/eGQx5XZ
	 SVr7eXmUEg67YyWTwzOXQ2gCQwhAK0XmJrU6v8WPQndN4iBi5fjXVtb6wU3pR8p6L72oX
	 IviS7ZbtjZkRHRX+md8AygX649Uva1KZKHqG9t/tqs6u/If4yTSsvpqFnP/CO+h+Gbilx
	 GwZ11ipDYNnU9/VeY42nGa7oVRShWtH0mkNTLLBlj4wr7QtX2Q8BzbNeZe67ZSnCEfoT/
	 Oq8uG71whCkTfs0KjBy6jSB0W48QqaGvzQg4MwPdPlZH3w8EkoJf3nRRq6OZ0kbTvFw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA64D1F000C1;
	Thu,  5 Nov 2026 13:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885022;
	bh=+VLJ9DCi18uNdmQrO4KxoMMbpxM69vcNMJhzFr24WoQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=kQP6EKPgiFvR3DLBunpBfMF2PQ3JPRM0C+N1vuadI1mUIF49VpqL9El2q7hHuTUKi
	 lqexFBgxA4qSEifwiuHbY2yOjCfm+6wBQ96wuCrw6ol8j4X/TEZtw99ywwmU2I1RpX
	 b4jvMkDu7hi3fLB2rvEKawZxaLhESbNBN6lkaENuZ9Ki/wuwPZWvdO1VD9MsK+vLxd
	 uJS+Y/lEF6nhZgqK3wZmWF3LpF7duSfMcT/GqCK5STZhJmQuCN9HMA1j5B31DVrbDE
	 9p5dznWu8LxJJFH3AAg/DkW76UDewKAyJ5r6xDc9r2PhChZIGeYdAKrr9eq04fAjZs
	 e9vf7+LlheUHA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3B61C47262;
	Thu,  5 Nov 2026 13:23:41 +0000 (UTC)
From: =?utf-8?q?Orkun_Emin_Sar=C4=B1_via_B4_Relay?= <devnull+sariorkunemin.gmail.com@kernel.org>
Date: Thu, 05 Nov 2026 16:23:41 +0300
Subject: [PATCH] fuse: don't pass a NULL inode to fuse_inode_backing() on
 release
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-fuse-cuse-release-v1-1-8be1eec02c66@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQpAQBRFf0VvbcpMIX5FFmNcPAnNQ0r+3WBzb
 2dxzkUCzxAqo4s8DhZe5gA6jsgNdu6huA1MJjGZ1kmqul2g3DseE2z4tsmL1NqsgHEUvNWj4/N
 rVvXPsjcj3PaG6L4fffXB23UAAAA=
X-Change-ID: 20261105-fuse-cuse-release-db795aa69e2c
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Orkun_Emin_Sar=C4=B1?= <sariorkunemin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793885020; l=1699;
 i=sariorkunemin@gmail.com; s=20261103; h=from:subject:message-id;
 bh=XgrvzfoNZJLMVh7JOSKQ9IdZU0PRskqYDZqGT15zz/w=;
 b=gbs3HQ72yYDqlKX7DMo75dpKLuTDfDO1J+2qiHIr4nDluBHTjdmRWaPOpizu0jKzK2XzTYiTa
 hkzztqUCQO0BkXO/ll2ZyKLdsCNX0p2Lh5bKH5Zwkjb/pdDG0p9SDZG
X-Developer-Key: i=sariorkunemin@gmail.com; a=ed25519;
 pk=MJ3Y3somkGDQVAXOSR189QAqWOcfzYCRkL1cSQgJXnE=
X-Endpoint-Received: by B4 Relay for sariorkunemin@gmail.com/20261103 with
 auth_id=1408
X-Original-From: =?utf-8?q?Orkun_Emin_Sar=C4=B1?= <sariorkunemin@gmail.com>
Reply-To: sariorkunemin@gmail.com
Content-Transfer-Encoding: 8bit

From: Orkun Emin Sarı <sariorkunemin@gmail.com>

cuse_release() and the error path of fuse_create_open() call
fuse_prepare_release() with a NULL fuse_inode. Since commit bbe2d73a8231
("fuse: don't assume ff->passthrough is set for FOPEN_PASSTHROUGH"),
fuse_prepare_release() calls fuse_inode_backing(fi) whenever the open
reply had FOPEN_PASSTHROUGH set, not only when ff->passthrough was set
up. A CUSE server that sets FOPEN_PASSTHROUGH thus makes the kernel
dereference a NULL pointer when the device is closed.

Pass a NULL backing when there is no inode. fuse_passthrough_release()
only prints it.

Found with AI-assisted code review (Claude Code).

Fixes: bbe2d73a8231 ("fuse: don't assume ff->passthrough is set for FOPEN_PASSTHROUGH")
Signed-off-by: Orkun Emin Sarı <sariorkunemin@gmail.com>
---
No reproducer was run and the fix is not runtime-tested. Build-tested
with LLVM=1 W=1 and FUSE_FS, CUSE and FUSE_PASSTHROUGH enabled.
---
 fs/fuse/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index d5e1cb53d8..36144fdd69 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -320,7 +320,7 @@ static void fuse_prepare_release(struct fuse_inode *fi, struct fuse_file *ff,
 	struct fuse_release_args *ra = &ff->args->release_args;
 
 	if (fuse_is_passthrough(ff))
-		fuse_passthrough_release(ff, fuse_inode_backing(fi));
+		fuse_passthrough_release(ff, fi ? fuse_inode_backing(fi) : NULL);
 
 	/* Inode is NULL on error path of fuse_create_open() */
 	if (likely(fi)) {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261105-fuse-cuse-release-db795aa69e2c

Best regards,
--  
Orkun Emin Sarı <sariorkunemin@gmail.com>


