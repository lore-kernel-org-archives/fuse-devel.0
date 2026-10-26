Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028412;
	b=Sb2RpT/hvMIxgC8gHKIS3+vq2L5rpS/AJ1C4zOa9gNHhDRhPM7Re3s8Ro2V/ZaY1QCAr
	 pX1G6Zv8LyPx0xx7KIeUDjn/YgSP3J5bXxHz48MvfpSngUyPXdM0504zJAPCG1Ml4n/so
	 KDav1J23UbkegRNbDhaUyG3OY3RK/TdWO93d8HyGYYFRt8zNyckzVcBnp/wp3HfqmOhbz
	 MyMYKz5iNGYS+P5rR+t0+XE4OvcsqtexbGjBKNFYscX8u1QzJPmuHXXnijq44pRQifiE4
	 FclyKY6h1J/6JSoNEmIZyDUfzlQhUPEILlCxSEo3MYVfdNOKIaiVOeaHsVw8kLNkXCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028412;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4BbM1F2A3eE/3huE6mUBSIoTTEogwRsBIuQxP9URyvE=;
	b=Lap+UJnahp80psVafagUJIdoM602Zd/d9G29aVjUUzM0aB30usjN3Jrgl1XFelp2nQ3G
	 ZlAj8WTlllfwr3fFC9W1RIaWfAthqNHjDYBeZ0giweKaimvmEMNq/IMaJgZl9xfCvohlz
	 dhV/AZKM0NHDtcdJSvB5365hmMV3xOKhl4XnHDZneCt51iLALLMUryDJ7dYSo+mlPE+in
	 14v0CTJg6Yx1NMDmkhdQbX1H5UtAP3t2p8YDGDB1eywlplZBnQO76fElSrYIvmCGbadnK
	 PdX1a8PG7jmXtS0N6KV8UHOMk3F0sreZkYacE8yqs8baBUX0Y0Lu1iK7g+Ncj5QsrGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bMR3b6IX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD5B606A326;
	Mon, 26 Oct 2026 15:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bMR3b6IX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFD81F01828;
	Mon, 26 Oct 2026 15:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793028412;
	bh=4BbM1F2A3eE/3huE6mUBSIoTTEogwRsBIuQxP9URyvE=;
	h=From:To:Cc:Subject:Date;
	b=bMR3b6IXJMDHxS+HwvpeSWkqJM9tKZwR/yyzNhUVzEyqI3jKFgJvQNZYBk14PXEsO
	 j6FbwckHwrRt1zl3rytWud9MBf9/QXULd61nyUn0NJtxFQFo8GN1h7jwhEGLavNku8
	 ujKFsK2TnZOYJKNg53j4bbg434mK+0K63TjDQeXC1p09BdSOvvby3/Awd9qqxQ40yJ
	 9UzeXl+3rbSHy89NkbSH6RdBJyxbXWnZhFka7d6RKrYgSqIaE48raf3+T3QeuoQs7e
	 QwEVmbnIhB5DVz9+zUpKPKD4IPmDzDBKQPRtz70pbhdEpPQdBMzHk2WL/IAzFwWTw8
	 /0txNbSJiPPpg==
From: Sasha Levin <sashal@kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] fuse: fix link error with CONFIG_FUSE_PASSTHROUGH=n
Date: Mon, 26 Oct 2026 11:26:50 -0400
Message-ID: <20261026152650.102745-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2f19d54c055d ("fuse: support 64 bit, server allocated backing ID")
moved the CONFIG_FUSE_PASSTHROUGH check out of the backing ioctl handlers
and into fuse_get_conn_for_passthrough(). The calls from the handlers
into backing.c, which is only built with CONFIG_FUSE_PASSTHROUGH, are now
only removed if the compiler inlines that helper. It does not have to,
and with gcc 11 and CONFIG_CC_OPTIMIZE_FOR_SIZE it doesn't:

  dev.c:(.text+0x355c): undefined reference to `fuse_backing_open'
  nios2-linux-ld: dev.c:(.text+0x3594): undefined reference to `fuse_backing_open_64'
  nios2-linux-ld: dev.c:(.text+0x35d0): undefined reference to `fuse_backing_close'

Check CONFIG_FUSE_PASSTHROUGH in each handler again, as
fuse_notify_backing_remove() does. The check still comes after the
fuse_get_dev() and -ENOTCONN checks, so the errors userspace sees do not
change.

Fixes: 2f19d54c055d ("fuse: support 64 bit, server allocated backing ID")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610171310.uqRzJkIx-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202610260719.sj08mXBr-lkp@intel.com/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/fuse/dev.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 1a40b60afb986..3641abb90d6bb 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -2334,9 +2334,6 @@ static struct fuse_conn *fuse_get_conn_for_passthrough(struct file *file)
 	if (!smp_load_acquire(&fud->chan->initialized))
 		return ERR_PTR(-ENOTCONN);
 
-	if (!IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
-		return ERR_PTR(-EOPNOTSUPP);
-
 	return fud->chan->conn;
 }
 
@@ -2349,6 +2346,9 @@ static long fuse_dev_ioctl_backing_open(struct file *file,
 	if (IS_ERR(fc))
 		return PTR_ERR(fc);
 
+	if (!IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
+		return -EOPNOTSUPP;
+
 	if (copy_from_user(&map, argp, sizeof(map)))
 		return -EFAULT;
 
@@ -2364,6 +2364,9 @@ static long fuse_dev_ioctl_backing_create(struct file *file,
 	if (IS_ERR(fc))
 		return PTR_ERR(fc);
 
+	if (!IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
+		return -EOPNOTSUPP;
+
 	if (copy_from_user(&map, argp, sizeof(map)))
 		return -EFAULT;
 
@@ -2378,6 +2381,9 @@ static long fuse_dev_ioctl_backing_close(struct file *file, __u32 __user *argp)
 	if (IS_ERR(fc))
 		return PTR_ERR(fc);
 
+	if (!IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
+		return -EOPNOTSUPP;
+
 	if (get_user(backing_id, argp))
 		return -EFAULT;
 

base-commit: 9b1da7b4a4e197072e630c3b85d4100a399752ff
-- 
2.53.0

