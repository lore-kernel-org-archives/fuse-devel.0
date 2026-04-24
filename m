Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F9495E5
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993501; cv=none; b=lBQqa73sLXirVg/SkkUmIaI7O+UkAkdUdKU370E5tfIgiSJAQD6h6vasg6Y3PEpEa/k2Y4pUj3WZMQLKgLYiWL/g6W50XLYUW70ng9A3g5sJXNzYrcZTU37l1oGJsT5sQkqu8UZRWH4B/8nVftYALIYVguIdT+a/S0ZKJzu49No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993501; c=relaxed/simple;
	bh=2Qr1twnUAOmdVleOt/WDW1J2EdPTiy8vXVcEZdLrNxI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q6MR9byLJD3LxYEwPhxXEvcgwLlfknxV2o+atH9Vt8bXBVZbqdiUfPuDYzQ5hFNB5YksikZaT6Sk+pADvJasxZQLhR2t1VXSS3NiylRqpegQ48xdjAWiqhdxVDXRNtmnu4YGzk4qyqGj7SKWRY95hJzQ/28Glh4dAVfxrvdKHYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiW/64F1; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiW/64F1"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c7971d0d97dso4299343a12.1
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 18:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776993499; x=1777598299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQj0z9eB2iOdHQWiGily5hFxzL37xYP3cpHWV5AUwHs=;
        b=hiW/64F1GY+et25+LxQrUq6mjC28KjIZf6I20BhR8zXF2bP1SU7g4N7Mqz5xXJF1Au
         IAZjZA/NG9nTD6fTMhQru1uP7bfToPz0q2ShsnE08yJlf80rei1PBCK9oWsbIF93WbTl
         3jmNgmjldhLjGaUTllEaR0ZehqKvpHApjPlkQyaKmAKL1ZWGqDyv1GWcCucICCxgdkHe
         uddidy+wGPXrtfd4mfkD03oqyPZVw2v9CcKgaA1S1eHjCQnQxkS673RCHa0YO7E3ideb
         ztkr6NH5py8jhgA5cot0r9v/4FAJF54NytE7qAkctGi7xyUwqo9lNobM0yyPF5t8RoMj
         a4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776993499; x=1777598299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CQj0z9eB2iOdHQWiGily5hFxzL37xYP3cpHWV5AUwHs=;
        b=DQzA/M1xqgKfgu1IsuW/Z7Am6ait4UYzbRnHsWt0a6ywgrzhynJsnzkkxn42EpeWuy
         wozPwtwLzhsUVKGc71+zfJww3Tjq3xjoqcrQpHy8Sr9rUJ7KrZWqByqwoACKZJSvE8ra
         i77Zz/SA4ZbfmGsJpNJ7rtxnueKhOjtXV5GSeRr8WbiqL7a6yr6VqxWDyEH6dMXnPw1n
         8Z9mPkZ/pmfkpF0cVXd3ZbLa/5rU7+jLBzW7jB22+lmKwcvFX4848cjLO0jxQ8PR07CX
         fJg656jcsJcSu3mTMzCG0crOBSOrXY6hmFWzLMSYEZ5FGWtlpz/88LoVvkp6Zp/C3+be
         BWTA==
X-Forwarded-Encrypted: i=1; AFNElJ9J+r3dNVDedFDPoivjb3WGa7G2Nlwwjeh6TgD4rv5aUXE5vFLuqxCf5U0cIOM0fllD+/LZ1TC6Ybey@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ3h5IbSLE8ExUd3b7zmddvfHSqgu0yDObj9ZuXC/Z/8/SyI96
	0k2niEwa07TIGPKMIsM9NUCZ+V1Ov7yLt1snGyWUAVsFO0vD/D3fgbf1uZbqzQ==
X-Gm-Gg: AeBDieurBfChnupiYusqdUQD1RtJRz7qBkSRwPMDI8S1kCsOISgKIt0yDxjuMMybhCM
	+ylXbywMkmRZ2E4dhr/tXK45cGqPvZVb7MGiv881tMJ+jXaBzDLQ27bGP++NOyC0tRWtVRORz/O
	jIuYrC9Ts4iazmR5cQ3MPFnKPnNtXwZ9NG8vWSf0GJR/+i4XWv6CsXdyK7X6b0WDWr13eL9YGE0
	q5TasEs/0hhcNTggpdZ/uOnE58Rjt+HdVbjrWXBYYnqB7Tbwy1dNeDMicEnrShA8YOsMDVWX0+f
	eB2ZLMuv839gH95R80lsyniLVVGlRg+bz1kKT6PKMABxcdAoH4JmLzJthPgvZawOwx0gNskEw42
	aCNllYLR88YhfA60PX3pj+8zmygq34xcc/+EvTuKTZzg622IyJyPf39pmxqyYRZ5IX646Q6RB6R
	4+ZLrzdQuX9nqo5y9PiVPJiUG0
X-Received: by 2002:a05:6a20:7a8f:b0:3a3:170e:a4dd with SMTP id adf61e73a8af0-3a3170ef691mr5800724637.5.1776993499280;
        Thu, 23 Apr 2026 18:18:19 -0700 (PDT)
Received: from localhost ([2a03:2880:ff::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e985a72sm22747468b3a.11.2026.04.23.18.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:18:18 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 12/13] fuse: clean up fuse_dir_open()
Date: Thu, 23 Apr 2026 18:16:45 -0700
Message-ID: <20260424011646.457682-13-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260424011646.457682-1-joannelkoong@gmail.com>
References: <20260424011646.457682-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Restructure logic to reduce if-else nesting. No functional changes.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index f186bf15c6f0..bdeea7065c5c 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1873,6 +1873,7 @@ static const char *fuse_get_link(struct dentry *dentry, struct inode *inode,
 
 static int fuse_dir_open(struct inode *inode, struct file *file)
 {
+	struct fuse_file *ff;
 	struct fuse_mount *fm = get_fuse_mount(inode);
 	int err;
 
@@ -1884,21 +1885,21 @@ static int fuse_dir_open(struct inode *inode, struct file *file)
 		return err;
 
 	err = fuse_do_open(fm, get_node_id(inode), file, true);
-	if (!err) {
-		struct fuse_file *ff = file->private_data;
+	if (err)
+		return err;
 
-		/*
-		 * Keep handling FOPEN_STREAM and FOPEN_NONSEEKABLE for
-		 * directories for backward compatibility, though it's unlikely
-		 * to be useful.
-		 */
-		if (ff->open_flags & (FOPEN_STREAM | FOPEN_NONSEEKABLE))
-			nonseekable_open(inode, file);
-		if (!(ff->open_flags & FOPEN_KEEP_CACHE))
-			invalidate_inode_pages2(inode->i_mapping);
-	}
+	ff = file->private_data;
 
-	return err;
+	/*
+	 * Keep handling FOPEN_STREAM and FOPEN_NONSEEKABLE for directories for
+	 * backward compatibility, though it's unlikely to be useful.
+	 */
+	if (ff->open_flags & (FOPEN_STREAM | FOPEN_NONSEEKABLE))
+		nonseekable_open(inode, file);
+	if (!(ff->open_flags & FOPEN_KEEP_CACHE))
+		invalidate_inode_pages2(inode->i_mapping);
+
+	return 0;
 }
 
 static int fuse_dir_release(struct inode *inode, struct file *file)
-- 
2.52.0

