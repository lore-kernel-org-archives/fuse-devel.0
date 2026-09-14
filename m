Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF00372686
	for <fuse-devel@lists.linux.dev>; Mon, 14 Sep 2026 18:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411023; cv=none; b=BCH6cve3uZUzRBghxGTtLIhmAtxVqeRCBqJbQ9xMppuHwbsDks4frBDkWPz54COcJyNGFew20mWmfRVGxWysWN/ZXxAf2QL/BpDGVFXU20Wq0f2RDsXS2w8+9xkxV82S4oKaYQldqazvkjFpsWpIyjmZ0fwqYvwYAdme5iwn7BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411023; c=relaxed/simple;
	bh=jzmgons7ejK3RqIf9FhUwWMQh0wU6zB2YBwt78fShPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pUPoEIqeElCoKxSldGfdw7pI0TUDu8GrVAXV+3dCspVhhQagBYO7JQXp5oBe86QKZHFjcq8HMCdoLOzQhAiaviq6DArefMfAnprv4G22pAJD2CB9nQ4VLvy08qwpTEi6LAj2t3YJCtbhYX+WVX1PQ9iRikaouqcehvnzqQ9Hl+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oc5Y/5DN; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oc5Y/5DN"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f01363so17006455ad.2
        for <fuse-devel@lists.linux.dev>; Mon, 14 Sep 2026 11:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789411021; x=1790015821; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tbp/X+AmysveQVQvFKs94vOjfQjVlMyD1nl7AhFF9vo=;
        b=Oc5Y/5DNsrGEirNDGMcKeEYKwQPxD535OVnpmoWTRWwaeSqJ9jOlwAYHEjTeYrLoUc
         BAnqtWzizSn+NCQntxLra4gSXAQvz0ocuTOV8y/x35AZQox8fwTS56sFhWeQ6ojlwiS3
         3vrY8UDYXefnsSYMc0Puwyx1I8Uif5WYLCPIqwkwzwVrDx5kxxQMSOSdM58+xta0btok
         wz77B7vWbkShmpsAoYuPf3/6r5Ex5eGQ55gGEPN9ybXnmSbbpZPkGqAj2j+DHb1J/zz4
         mWbywTs9UPcB1G4sWXBubaB2QXUF1Jfq4tTrh//iWq0VvJnwxtpBMUdYlJTW6/e6jqys
         nZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411021; x=1790015821;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tbp/X+AmysveQVQvFKs94vOjfQjVlMyD1nl7AhFF9vo=;
        b=EdUuGRAyIA0oQfmWpGwYy0ghyVtfFhi1FWpea1vX03WsfpvV51+qg/WTrPKxpzu9sV
         Ms2qO2ge2NUSxSs0gL9sbgUVTQYZQq5a99K+lt4QdKZwg/GGCMJBuvqkaWnru2H6ofk+
         SeVdy6xg6HbCADApBu2qdeMBSgEPMHU14DNOL4zGMy7rmUFtdqbB8UdjYQOjQucZ/3w7
         z98LL40JQcZD4KtzzoNr/DqVEgyz5a6Q9Hst/FVQ47JHDOeJucUHgfpiBYfYT+jmW9Z2
         nP30gWTx2G9k54OEFT1PeiQhl+vAVia/bAeCJUoVpxqtB3uKn+XlDhz8mgePp/+sRoVf
         wZnw==
X-Gm-Message-State: AFuF++kkQnWuagjUzc5woLI35pOd2Akc3Nh12WMMKFlFkbMUp2nQe4da
	iWLBwfQwM6W0rTAH+CeiZ4lazOvghqG8w36E7vMzsTrRobYY3qzDFqQJwJkG4w==
X-Gm-Gg: AYBFou2PTYp8SYaMBdneffu7f5FGk3LgiJ19wduo81RfluRwGJWjcHvQUK4UOnDxDoT
	A6kvCYK/5EVxrSuOY43qgVVAdviAa7RrUsXIVjPijzkzM2tvbP1SQfQN38BGJp11TK7sF1NCjIE
	ssQ5+f8mSm1l9gTO5RcV/ZlP/+PVAk+9aufJmCcWED5gFAZjD8Vjylttl529MTsXMwVh0QXDURn
	GUzdio69hpba+31mr4KBlc7bvaxlwQ9cAS25q+vfD92c5/8Kh0i3Ng1DdwA2BDmictgi+N7F71T
	CAOGvAU+yobwhRbx7AQHz14WhdJUQIFizMYFyHhwqPVjwcF3DYS1RdjlcwxJvp+bKbmOhzqjDY4
	/8C69k3UeCFvVKEkt2qUAj7i+Mlo4O6XGqb9I9d1pzMXANSB78hrOS1m5TDVVldBZW0/ACKA+ii
	ncR+rVRY8IB8vFzAQeTKztR4dlIo5mXAXjEg88PJCux4dLM13qv9mn/1cvYJLtbw31eqeLKKJ4E
	1Epja7kfReCGCY8PR0dj1o8bEMF63cEvp6SEAyAeeJiQI4=
X-Received: by 2002:a17:903:98f:b0:2d8:d4ce:7e40 with SMTP id d9443c01a7336-2dd6c7622e4mr78861825ad.21.1789411020855;
        Mon, 14 Sep 2026 11:37:00 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd46670194sm41297975ad.68.2026.09.14.11.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:37:00 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Mon, 14 Sep 2026 11:36:48 -0700
Subject: [PATCH] fuse: Cache unsupported ioctl requests
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-fuse-cache-no-ioctl-v1-1-70a05053ef0f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAL8+qGoC/x3MQQqAIBBA0avErBtIo6SuEi3UxhwIDa0IorsnL
 d/i/wcyJaYMY/VAooszx1Ag6gqs12El5KUYZCP7ZhAC3ZkJrbaeMETkaI8NhTGdarVU3aCglHs
 ix/d/neb3/QBdJnKsZQAAAA==
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Robet Byrnes <byrnes@wildpumpkin.net>, 
 Stanislav Kinsburskii <skinsburskii@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789411020; l=2578;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=jzmgons7ejK3RqIf9FhUwWMQh0wU6zB2YBwt78fShPA=;
 b=fZcg7MJ0BGyyXplRSHhYQzsaoJ1SQW3/6NfqoliVBmJfruNzKoyQEzb9GRIHSzZnyxllMkpoJ
 Yho+76oIKAnCKGevYFfAPUBDiUKRewz1nnKfgQwvsJGowfdnIQdIXiE
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

A server that does not implement FUSE_IOCTL returns -ENOSYS for each
request. Cache this response on the connection and return -ENOTTY for
subsequent ioctl requests without contacting the server.

Only cache request-level -ENOSYS. Errors in fuse_ioctl_out.result apply
to individual commands and must not disable ioctl support for the
connection.

Check the cached flag before preparing regular ioctl requests and before
opening a file for file-attribute ioctls, avoiding unnecessary allocations
and open/release requests.

Signed-off-by: Robet Byrnes <byrnes@wildpumpkin.net>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 fs/fuse/fuse_i.h |  3 +++
 fs/fuse/ioctl.c  | 12 ++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 97d356588d00..e9d8b48069dd 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -720,6 +720,9 @@ struct fuse_conn {
 	/** @sync_init: Is synchronous FUSE_INIT allowed? */
 	unsigned int sync_init:1;
 
+	/** @no_ioctl: Is ioctl not implemented by fs? */
+	unsigned no_ioctl:1;
+
 	/** @max_stack_depth: Maximum stack depth for passthrough backing files */
 	int max_stack_depth;
 
diff --git a/fs/fuse/ioctl.c b/fs/fuse/ioctl.c
index dc3a188f5d72..3ae50a25064b 100644
--- a/fs/fuse/ioctl.c
+++ b/fs/fuse/ioctl.c
@@ -23,9 +23,11 @@ static ssize_t fuse_send_ioctl(struct fuse_mount *fm, struct fuse_args *args,
 
 	ret = fuse_simple_request(fm, args);
 
-	/* Translate ENOSYS, which shouldn't be returned from fs */
-	if (ret == -ENOSYS)
+	/* Cache request-level ENOSYS only; outarg->result is per-command. */
+	if (ret == -ENOSYS) {
+		fm->fc->no_ioctl = 1;
 		ret = -ENOTTY;
+	}
 
 	if (ret >= 0 && outarg->result == -ENOSYS)
 		outarg->result = -ENOTTY;
@@ -233,6 +235,9 @@ long fuse_do_ioctl(struct file *file, unsigned int cmd, unsigned long arg,
 	struct iov_iter ii;
 	struct fuse_args_pages ap = {};
 
+	if (fm->fc->no_ioctl)
+		return -ENOTTY;
+
 #if BITS_PER_LONG == 32
 	inarg.flags |= FUSE_IOCTL_32BIT;
 #else
@@ -492,6 +497,9 @@ static struct fuse_file *fuse_priv_ioctl_prepare(struct inode *inode)
 	if (!S_ISREG(inode->i_mode) && !isdir)
 		return ERR_PTR(-ENOTTY);
 
+	if (fm->fc->no_ioctl)
+		return ERR_PTR(-ENOTTY);
+
 	return fuse_file_open(fm, get_node_id(inode), O_RDONLY, isdir);
 }
 

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260911-fuse-cache-no-ioctl-1bb573a27597

Best regards,
-- 
Stanislav Kinsburskii <skinsburskii@gmail.com>

