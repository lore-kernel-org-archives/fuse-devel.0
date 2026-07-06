Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E1B386C08
	for <fuse-devel@lists.linux.dev>; Mon,  6 Jul 2026 02:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783306644; cv=none; b=auQ471q9CD5KNw7WLEginhXRQRnlOaL/hxCClvB+yu3PDtNrUlZWAD7LbQUCGa58fqe4wwZFabfBeYlGDo3AvmRlNOMN0xy5dddVwXV9Furt6RiCotZ1+CwQa1c/K1VkKeNbt7NSKpJeabNfasvVq1IeYkEubd171brv11rYNiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783306644; c=relaxed/simple;
	bh=74umDaW/oR/0VfwpmttI7HW8f17UQCWChBCHJdRj/ro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hn3MsJnIflIzfa44tzg43iY6HDDTJwe7JLKgWWFsJKGPQ+UOqNxFesG6c8hOGGmm6OgSnMfXA3FTd3ydrn7hprf+J3r/5ZsWswuuhpk4X/qiFCdC3AaC48Pe6AuV4NOu9+MmvSMB3tAxMX+bmWzrlORTULl2DCEWpYbbpYiUzjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQC8SC2l; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQC8SC2l"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-847917c3678so1877882b3a.1
        for <fuse-devel@lists.linux.dev>; Sun, 05 Jul 2026 19:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783306643; x=1783911443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIS3WxpZwI00WNR4jAglvrbvaRYxaDp80Lk0sy8LA+g=;
        b=SQC8SC2lYmmrdjK+TyiDAH7hAek6zieMt+dEF0iZneyNPiKc47s2TOzIRFOXl6rF+y
         06A6PkFFoVm0hJgjh6iV6Z9BeEPxfQJAUG7/nc8e1gl+5F+l1cLbl8xBvfUMf3/2ZVVc
         Xu+gAAkS61+AOx3wkgd7b8/1Jf1C1AUuUl8MCVcWNJuPSASDBtwTYonfol5MXaTTSri+
         pfHfUZyCLCfmIVdnX/zCnG6hk5xCYw4SJSql2WykiK2ymj6i5XUz4pa+VPmI+0+PEbey
         lHUuxSlYXJN8Kh0uDO0JgI+6+5NDNQr/tSgwWa7/sLfwVEmgJl86EFUe2lo6j5spTlzE
         bAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783306643; x=1783911443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIS3WxpZwI00WNR4jAglvrbvaRYxaDp80Lk0sy8LA+g=;
        b=c1dy5WVLHd//dRIivzznxde8xQrCoUZ8VaOsuJfswYN2TANHEBJT4x0h1mPShGc3fm
         GUsQWTog30IsB40F1pt1lMiba8ByQ2CGDCG5dVmpyJWT6f/gwE1Wt9cldyhEQWDw12jn
         Df6guzz9MaJAuob8UpwcJYPWVl1Pjdj9kJ6pXJpETgVxar9rjr+DCZH+wSj8xjOQJWSg
         sWajipmMte3knOIy/4e5j5+NexYz66POiE8hcjP4QEkHk8IjuKZJiCfuYqSbUroINF0E
         KAgl0nLKoPwJA7/QbAghtllLbdPK/rTcAUMirNm+CyZGnJSK86dxCV7ltUk1kgAAtKra
         QVKg==
X-Gm-Message-State: AOJu0YzF4iavZCvxO6X7qdXnGB/XIfW9OrT22HdN9I/Y+z6G4Xswo/68
	6n3ShRl0tA0F5fmzmOvNprvyd3CD9Bhnjb6IHjDtLbsTL8NmgFBUtwqB
X-Gm-Gg: AfdE7ckOt6GxfqjP0k2Vwu/iqFqmMrt2+Zbn45w42pbfNglfHIuoBWpn4KMng7DtaMe
	QnyKrgeQ/oTyCh8NIgvy63FSQ6hX0jQ3EqYKmQEqgipMHrZrGp28kyfZyCtzUz3YlS51mxxOEa0
	UWY511Fa97S2emAWRp5JEFY8Xa5D5u6GgGvTE86Tx8FK25wx24OzxUGx85bvvy5z4qMnQXri3Fx
	2D7W0eN410MLYYAu6RJCOPM3tvStWmDvOW9cD9qu6mUg96hi5/9PwGcImlVLQ9w320ZxRL7HEcp
	X/kCXTQxkh+HCt41c+73Jpcf5SZOg0sfiStZpOGJpYIFmtfhZbbVKKkBwJ/NVc/uuqWQz3YNLhs
	4BHJjqz0tRN05Ka+2dYy+xzGO3JdvPzMnVVqnpRAqnkbYPrLkSVrR0bv3oiezM8ONwz3oqDt62K
	+qp+wyXo3bliIaonOO15uVkFG+bTdXC7RaYTPUiZfXxEsZP9dju7NHZV1uZg==
X-Received: by 2002:a05:6a21:6b0d:b0:3b4:6af4:bdce with SMTP id adf61e73a8af0-3c03f9cb1bamr6596642637.20.1783306642585;
        Sun, 05 Jul 2026 19:57:22 -0700 (PDT)
Received: from localhost.localdomain ([101.90.17.205])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e91b0a2c4sm4988244a12.19.2026.07.05.19.57.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 05 Jul 2026 19:57:21 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	Yafang Shao <laoar.shao@gmail.com>,
	David Howells <dhowells@redhat.com>
Subject: [RFC PATCH] fuse: fall back to copy_splice_read() when i_size is zero
Date: Mon,  6 Jul 2026 10:57:05 +0800
Message-ID: <20260706025705.58301-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After upgrading the kernel from 6.1.y to 6.18.y on production servers,
some containers failed to read lxcfs data. The root cause is that our
lxcfs is still at the old v3.0.4, which does not include commit
25982f5 ("Set the file size to 4k") [0].

Between 6.1.y and 6.18.y, the FUSE splice_read path was converted
from generic_file_splice_read() to filemap_splice_read() by commit
2cb1e08985e3 ("splice: Use filemap_splice_read() instead of
generic_file_splice_read()"). Unlike generic_file_splice_read(),
filemap_splice_read() strictly checks i_size and refuses to read
from zero-size files, which breaks virtual FUSE filesystems like
the old lxcfs.

While the proper long-term fix is to upgrade lxcfs, the kernel
should be resilient to this common FUSE daemon behavior. Therefore,
when i_size is zero, fall back to copy_splice_read() instead of
filemap_splice_read(). copy_splice_read() calls the file's read_iter
operation, which sends a FUSE_READ request to the daemon and lets it
generate the content dynamically. This is safe because for genuinely
empty files the daemon simply returns 0 bytes.

Link: https://github.com/lxc/lxcfs/commit/25982f5d7e008e6ad13df28af3006ab8286f4c97 [0]
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: David Howells <dhowells@redhat.com>
---
 fs/fuse/file.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index e052a0d44dee..78a499b24ac8 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1893,8 +1893,14 @@ static ssize_t fuse_splice_read(struct file *in, loff_t *ppos,
 	/* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
 	if (fuse_file_passthrough(ff) && !(ff->open_flags & FOPEN_DIRECT_IO))
 		return fuse_passthrough_splice_read(in, ppos, pipe, len, flags);
-	else
+	else if (i_size_read(in->f_mapping->host))
+		/* filemap_splice_read() requires non-zero i_size; for virtual
+		 * FUSE daemons that report st_size = 0, fall back to
+		 * copy_splice_read() which reaches the daemon via read_iter.
+		 */
 		return filemap_splice_read(in, ppos, pipe, len, flags);
+	else
+		return copy_splice_read(in, ppos, pipe, len, flags);
 }
 
 static ssize_t fuse_splice_write(struct pipe_inode_info *pipe, struct file *out,
-- 
2.52.0

