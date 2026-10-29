Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270367;
	b=djydmjZ0CMBII9vttzITLRE/iSll0Ar7yvetGp6uyMBJmLbqb/2P6XGv5fEqMtQXKtO8
	 1DAcrAi3HCYWfHzeeImV9XzayrnAcdFhgxH6HddSjvANJ6iRvMlMRuollMeicd3Fs1swx
	 FwZwqLN+O935Um7RE9fjv4hEIc6rjw+kyMA88CcL4z2R1eo61dnDj9vUXdqpjSek7Aueq
	 p2b1MDp9L+KjQn1d8boAYu2I5HNUdj70v8it/atvZWoufKMKxxGAdVQZ8c7yeFPEu/rg2
	 GmoK2dmwNMUj225UeIQWIH2YkApPBbQW12sBI4z/xX8xAquuY+9gGc871lnXOmFl1Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gWikJcHMy/FGJ+Cip1xhfQi9ECC0Fi/XHUzFD+d9ZqY=;
	b=5LFatVg1vjVp7ZiqMJ62vKa3rws/GXHpmupORaCH9qpSSsS4G9iw+5Qh08qQfyRBm4M4
	 /2/ZnIw577mhlZLhGxWeubq6evuD1R657XBePYk1Osf0BPEPaPGBgqZSuv/iSKUs75a5d
	 XT6Xx7DamaP3sZh6m+3CYWfTEluJmXGKz2A18S9AD0GKrTPBk2h4rbNKMr4/g4siItWNv
	 NjOuZB3Xcbar6itC312ap+Xz+CePcXmXWWE27t3bZWePVfZM4Y7+QJUYaPzu5ZzqNHCBe
	 buBLCQU5KJ8YlBsvSC9B27CvrUw7xF41nDlnJvI7Er5eIjcAf7ulOTXNKzBfdqStn3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VyjQ77Qn;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFE360A261A
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFE360A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VyjQ77Qn
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e8c710847so272262666b.0
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270365; x=1793875165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWikJcHMy/FGJ+Cip1xhfQi9ECC0Fi/XHUzFD+d9ZqY=;
        b=VyjQ77QnPqJHroHUh6JXLlXQZ+02wCUn7C3TdApnSD3Hzg3VE+idYV/Z/qjlkfEGbe
         G6Mswu34yhqZJ+jFaAhCWi87Gl+PrhmoJjG/HoYWw/tOl/sJGHCrCONujgmywX9QUkJQ
         zFduMfdsEiF7gIc8upjA2lJo4NgjJ98qDBmDGiNvmB75XO5Rm3nVZndQrZoAEqfkyJFx
         a0Dikkfgvyxv3U2tWmaeUl3gA74aCImfMcDo03P75mh1rL4C90xERDqy2Fr56L1wQD5Z
         81JP6SxUc6/NbEnvO9HzGiBfXytdgrDsV2Q/k3DWKgeI1yx8FafIt3lHq0ZN/VMXxU8D
         FfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270365; x=1793875165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gWikJcHMy/FGJ+Cip1xhfQi9ECC0Fi/XHUzFD+d9ZqY=;
        b=KxaijLl7+A1/wEMfR17BrXfdJAwQt7EzQp55IENeu1oG6uVKaNv+axbWtTcCe2JJso
         oZzsco0khqqthzsM1PCofgr2sP3QexkXELc3zAxgQsE+bnBWGm4cS0m3iMP4IvCv2O3G
         W6Kc517il/gkI79u9QnhbhYiKIL2G+OQxZD81Z2TxD5hzqxepKopzVZmCTK37IhYppfP
         i2caEAwojxoNlmn8Y6BBogeqd8ydhx5vmeYLcDtPE3b02y/t6H44VLVrluwYkzmz+zBC
         NFC3YbLU47U+uPSOUTks+cphAJiz/sW8pkiG3nRdl30E3MZ97SkoxmpObK1EVyXeKL83
         Nj/w==
X-Forwarded-Encrypted: i=1; AKwUvBzX2a4/J+4P9Jso58Qohb4Xvl5NGPTwReBZxTNogRBfKwMPdLpedWxFztpKzalJHKNvQbRaiGX7qVeR@lists.linux.dev
X-Gm-Message-State: AFq9FYK+xf+TmBi8BgFPfCy3eQzw/2eLIQc7663LNDpizmXDIozvZZyG
	YmSyzU46gqpea1ppBmIjc0mDl1cCSKG+Om8u9030RoYGJyK4KhG4xCz6
X-Gm-Gg: AYBFou32BYYLjwIPEL4tCbiWSkXV58noBTg8CGW9sWreDvuVyy7YuTHz+hwWhFbkYXZ
	Tx/TBaNrpSbAIAAHQM1SyX+zNPn6+ENvQOkJh4bYdcsPsBX4Lr7rZ18IvKvYgvhNyqsRVpIvsK8
	2Vdr+sU+4TxK5lc+vw+h58MHVARi9UFyUilS5TSjsvWo7GQ5Brq5MGsrZIcw+eaLDW/F4TBXzW6
	g4FmgMxciwgDLyhWbfY7NN4YiR4qR3w9Zu8izkgPRiyU65VO30RUY5hfXxvZnfoX3KpifIL/jt+
	bzFXmkGII6Zh8JOVEaYWKxsGbonDLs3Nq0QgwwTVVeoa8q0FWRwUnn/z2d8aYZCSEyZ41yNFwWf
	iPoQSq911g8CBmEZEqE5en3qxckxnw+42ihsSOF3e0pPFkpzgKDYe9QbXdWfGt8WfuBaNJNggj3
	8qH4nHOydCUtaHhUXMUouqjn3RoCuy0byb0T7eBhxEMs8jvHvm/pf176h2938ONIUqTrhtvZbs3
	FIgGcXgDpq7CM/J9cytu1VU4gytDBZYA2e0FmA9hmN4/vxlhYMQ6RSzaLCLzKgNo9lzZ7fG08B7
	YU+NHXawVL96FGjm3nTqjggaZcnaTGGjSwv8IXkopLOO2DCwPVKb/zZ+5QiHAXCq7e2zLRZHAaR
	iPkgN6sWVFmW2Mb1XbuFz3j0/DVlqSPyy
X-Received: by 2002:a17:906:eec8:b0:c46:8c2b:8f7e with SMTP id a640c23a62f3a-c49bd9e322amr444578866b.0.1793270365070;
        Thu, 29 Oct 2026 03:39:25 -0700 (PDT)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm391847266b.23.2026.10.29.03.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:39:24 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	Chris Mason <mason@kernel.org>,
	stable@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 09/16] ovl: use the pinned upper dir in ovl_fix_origin()
Date: Thu, 29 Oct 2026 11:39:13 +0100
Message-ID: <20261029103913.2785828-10-amir73il@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029103913.2785828-1-amir73il@gmail.com>
References: <20261029103913.2785828-1-amir73il@gmail.com>
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

From: Chris Mason <mason@kernel.org>

Renames made directly on the upper filesystem during a lookup crash the
kernel.

A dentry that is passed to vfs_setxattr() must be pinned.
ovl_fix_origin() passes upper->d_parent to ovl_set_impure() without a
reference, and the lookup holds no lock of the upper directory. A
rename on the upper filesystem changes d_parent, and only the child
pins the new parent, so a second rename and an rmdir free it.

With delays in ovl_fix_origin() and ovl_set_impure(), renaming the upper
directory twice and removing the intermediate parent during the lookup
of a merge directory without an origin xattr gave a KASAN
use-after-free in vfs_setxattr().

Fix this by passing the upper dentry that the overlay parent holds.

Fixes: 9678e6303057 ("ovl: fix inconsistent d_ino for legacy merge dir")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
[amir: add helper ovl_set_impure_dir()]
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/overlayfs/namei.c     | 6 ++++--
 fs/overlayfs/overlayfs.h | 6 ++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
index ca899fdfaafd2..cf7908a39f614 100644
--- a/fs/overlayfs/namei.c
+++ b/fs/overlayfs/namei.c
@@ -942,8 +942,10 @@ static int ovl_fix_origin(struct ovl_fs *ofs, struct dentry *dentry,
 		goto out;
 
 	err = ovl_set_origin_fh(ofs, fh, upper);
-	if (!err)
-		err = ovl_set_impure(dentry->d_parent, upper->d_parent);
+	if (!err) {
+		/* upper->d_parent is not stable, use the overlay parent */
+		err = ovl_set_impure_dir(dentry->d_parent);
+	}
 
 	ovl_drop_write(dentry);
 out:
diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 7f3558372c599..c89739e5338b4 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -572,6 +572,12 @@ int ovl_check_setxattr(struct ovl_fs *ofs, struct dentry *upperdentry,
 		       enum ovl_xattr ox, const void *value, size_t size,
 		       int xerr);
 int ovl_set_impure(struct dentry *dentry, struct dentry *upperdentry);
+
+static inline int ovl_set_impure_dir(struct dentry *dentry)
+{
+	return ovl_set_impure(dentry, ovl_dentry_upper(dentry));
+}
+
 bool ovl_inuse_trylock(struct dentry *dentry);
 void ovl_inuse_unlock(struct dentry *dentry);
 bool ovl_is_inuse(struct dentry *dentry);
-- 
2.55.0

