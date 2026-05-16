Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2862E414
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892780; cv=none; b=DSCX9w9e0s8Ln+KaiP07gpjyzUsXs8XRoNoWQx3k1qV4J2Kj6Lxeb7AxbjA8LwMo6BYm/s2HYXS6n1ucuQygrvPCznxtlWqe5gGETXO+g7QQAgsy7LICVX4ApIKt5C9g6umG7mimNxVtOatmCtgsOkLtWoLVsOH5bAFZCGlpbDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892780; c=relaxed/simple;
	bh=sylTXm6GG/AeEIIF+r9V2b8xCYKj892ovOkVdiUYdL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sq0Gv71rWyLHF9XYDwpTu+dv9okWGeXoNw29Lf9NHrcBITxDGuLBXrsrgDzjVHc5304yyCKKooN8urA3Lhlf7ElJdAmsOR153CrNohZMZP2GbQHOkEyUYFgPm0oDSYPBUTUlZ4GZ1dHcpai6sWgfkAJ6nLlo5UDjqmzG2chkmWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jil8yT5g; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jil8yT5g"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65c477a3278so760894d50.3
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892778; x=1779497578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHwdKv3R2tDj/nunXDqFR2eqVkjOmabqfWOrmMP3FmQ=;
        b=Jil8yT5gSnAcOgymMnNDmfG+fKLKpRQClIqmcoRZ6TkZItQfxtVk3Ub6uTLLMItNnC
         QoL61VV3Uij8ZdqWqiRm3jT2d+Q9lnqTIPRMB8fSmZuaaJVIbDRuY8vJ7qmDppjVgmiI
         a7aBXldBjc8SjF0UlaJ4JanlSQLUrGMnGXf/ACZZlluDQ0aE9Ce6GaKMYEAq5DX4gNtS
         NazoizZwqD6hsZpuxWU5JUkuOyUtFF+9fy5nnuw4JQ+0T3TKwDzlLsdg7z2yVVbC+Jw0
         aJK7opvTJUlrQBafLsjaUz7rGLiDxiH7RVopnE5CCDKIY01LAk/ohzgI8M+s5ZqL0Mo4
         +rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892778; x=1779497578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OHwdKv3R2tDj/nunXDqFR2eqVkjOmabqfWOrmMP3FmQ=;
        b=oVMEoYO2umwfud1uIMeExiQmSwBQ6pRomAPtyl+KlzIVqJDd3l4m3rM0qqMoDkHzOS
         ebKNfoCTgg9ohSOKXozarvBxRUvo8Kq5pdBR3cs4gXcb8v8i5ype1t8aoUmxueOSblyG
         3LVp5JR+MjfAlIxl0d2j0h7l8vRSjtp15XDk9eiGyZhY+g5gmHmPFxEv1shh43GFbgUg
         wXRXYZQv7jfbaEEK9Pdp9R6Pr5RYCXAcA21yAKWpL/xjof5i3JbT+88a360WoNElnN0V
         pUXfv3fbitS6VaDgnToKuf+zAnLpXu4VbJkwcdW6yhtpmNqnQExwWwrD7bn9wmwn5vT/
         aiFQ==
X-Gm-Message-State: AOJu0YyAnR5D7Hxf7hA8eaafFT88pxdJZwni6O1lagl8U/mfiMMVcalL
	V5DtuDqoXZqdXpdaf71nwDFrvRH1rsajYiNzgC3lyPKbogLkmg4Ka4lR
X-Gm-Gg: Acq92OGvZxR1HQ1Da9e9iFekgSsM8tk/QGPCC+IUobv02dueGE3XB815coTB/qeQ+2I
	RGbPTo7scE1xa9rjyczGCkCxIQkz8CaWOa91A+3wLmJa9fM69nTgiN7Vm+GfhNB/F+OtE3XhHYf
	I95Fuwh4sSyQ0EeO8RWn8i5ltONEFhLfs+bente0sG4vxDFJclHCWyAR0QW0znVLgUtHTtz+XLC
	PZ6nDnr2wLCj2HO9oKPqEhe2tEX/kJ6Ywyj4PmbpxNFXok9Btme3sCMBFgY7B1H9M3NXiLCbpyG
	/3gdWxMaroJa+zZSJRWHN9BciCbh3SU7H94dL5zSX3iP44FqMO4LquChVZrL4DxlQMtLsHQoCZG
	eeP43Lq8dIZzNPoKhecLJd6Ifg4b9M6AiSBQOkgbADXQw78Dbyp5Qdb9uwy7YgO6lVKms6zvjL5
	OdXeKdTgMZJzYQcl8JAk/Y
X-Received: by 2002:a53:b41a:0:b0:651:be87:9e5b with SMTP id 956f58d0204a3-65e2285e9a8mr5422284d50.53.1778892778528;
        Fri, 15 May 2026 17:52:58 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:44::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0d89b124sm3307182d50.6.2026.05.15.17.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:57 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 16/21] fuse: allow backing_id=0 in open to inherit inode's backing file
Date: Fri, 15 May 2026 17:39:59 -0700
Message-ID: <20260516004004.1455526-17-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260516004004.1455526-1-joannelkoong@gmail.com>
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With FUSE_PASSTHROUGH_INO, the backing file is associated with the inode
at lookup time. Allow the server to pass in backing_id=0 in the open
response. On the kernel side, this uses the backing file already set up
on the inode.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/passthrough.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index d62a1c751157..ae0137caa06d 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -193,13 +193,17 @@ int fuse_passthrough_readdir(struct file *file, struct dir_context *ctx)
  */
 struct fuse_backing *fuse_passthrough_open(struct file *file, int backing_id)
 {
+	struct fuse_inode *fi = get_fuse_inode(file_inode(file));
 	struct fuse_file *ff = file->private_data;
 	struct fuse_conn *fc = ff->fm->fc;
 	struct fuse_backing *fb = NULL;
 	struct file *backing_file;
 	int err;
 
-	fb = fuse_backing_id_get(fc, backing_id);
+	if (!backing_id && fc->passthrough_ino)
+		fb = fuse_backing_get(fuse_inode_backing(fi));
+	else
+		fb = fuse_backing_id_get(fc, backing_id);
 	if (IS_ERR_OR_NULL(fb)) {
 		err = fb ? PTR_ERR(fb) : -ENOENT;
 		fb = NULL;
-- 
2.52.0

