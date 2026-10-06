Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041D83BE174
	for <fuse-devel@lists.linux.dev>; Tue,  6 Oct 2026 10:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283913; cv=none; b=flE6UhDbHewC02Q8LvcrLWjw3nqZH9CH6dqHwoK9/L+A29lTGgJc0GL69Cwa0T2Mzmi0baCw4UcYfwF8h9ltmZc66pj2qz+sxv7uKzT/NBrESjflhiAhjyqZpC5yqwSOEfVXZ+ZfJkIGyiq2ExdUZZUker+FHTo+SVqCol3oZYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283913; c=relaxed/simple;
	bh=LuyziXPlCFJ01VbiESW95qg1GoVoMAU4nqajgXgVaO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dh+rfpfTeoM8dmu9T68DF+hit4prvjz4PVWf5GAK778A26eGUU4iCm/6CaY77ghPYr6loh++8gVRbEg+t/LahfKiEcvuL80yhVBFsLwD3dWpmrG8jdzBs6S8it3PhudaNmZ4xcwRkYCNj2uxEXkdiZL/+29X0QuamjDmaKJfLwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QakpjoP+; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QakpjoP+"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-82395ae2ea8so2635101a34.1
        for <fuse-devel@lists.linux.dev>; Tue, 06 Oct 2026 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791283911; x=1791888711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SCTv/ndgRDuXwjW+M6LtHiJwH/r3XSV8PS/58Df+I+8=;
        b=QakpjoP+dx1evm1F2VOPTdQ7EeKlnkIJ6zpOHVSIG7u2A/SSTBm+8yDLq+RYq2Dsh/
         Ub97izxOQsSf2DvQV/KC8yP0bSYgRVKWFl0s73yzFDq3nv+S+jBNorsveOqHNwK5hR41
         CYk9egUgQM4c8QkOd3/en4ZzpIQ99vWz/ESl9YxszlvNEqFc4p1f+wFVV/LUMmgC1da3
         gmaZ5YUBsEGXifI2Xov6Z0PLcifO86xXqxpCxYDjtEbFHZuW03QlAUtGUrisjzhCWoz5
         7Pkpt8JcR1maH9boE1KvGu7Zr7dF/tucl8RkelDmi7MqZ1oorv/rqCxImVtrUupjRn3b
         5vTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283911; x=1791888711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SCTv/ndgRDuXwjW+M6LtHiJwH/r3XSV8PS/58Df+I+8=;
        b=p/hX6TymBZKbYxEDG/R9bW2T1KwtstUWGU8QX3jy1gGg5CqaRFwEJ9poECuCKVDUR3
         F4JK5fVTa/AAKvtvM5KFDulcGLFdDrVGo+uurGkhZV+4t+FOlwiADVLHthCaMKI3dOC3
         fV6NIPu9o/r5YX5llWcCmR/E1vwuBwj0uL+5XYfqbvXb/ht3v1veFCvhrrZbblkecK6j
         CQcUaBPts5C5yXRaJofTj2QWH43i602RU7JnDevZW2hiphrporOWXtXnkZcfIfN8Gb1D
         s7OkX7BEo8xjRvAR/qQ/eqXXJSfCBp2T5CRwCQryGWObCIfn93gdZI2Xb3zDNW7nUMBo
         8TQQ==
X-Gm-Message-State: AFuF++mSXHNX9QjiTpJy2iZpR+VwQYftGm7v8f6APGthCFFVIxYGjoYs
	g4PKh5PI0wfP5l4LwcYIUYWcdQUMUpz7bErpPg8uKGnjLfmEv4aunmRkNgGsq27+T9E=
X-Gm-Gg: AYBFou1AhbgQaP086uFovvkApo+ow5/X5KeOlaHmucA3JGBqvQV5sREkpxoeBrqo4eQ
	YsXmPOhr3Cc3SMzFaz1NlgwcrM0u8juIL8xY/KT5/32Gdkk5wlfB3GCSTHiYZD+eoypfGfDRTz+
	DQkVb6IYb/TuJP4rlTzVhUkn9Nvzk0Q/eBlMhozy07wQ5/O+CAW/xW8Cb4OxZzKGc0tc03vNKAB
	U5/IVXxOOTGizHwNfjalHwKv+10qyB1XrVFPQDk6yZ0TifW88kCdV233bpZdfyYb2wSNXL7PscE
	l6i1eDClZKdxCp5AYCuSEytBcbe0yAPvbVggTE9D/tXoSOnfkYJ1c9ylLAu/xhPWxiR0hykC4VK
	Cq97IAOVEGvE40aLKqADUiduno2FdHs82pb8PxNuHJQJyp3kVZIs0KEZc1kBaDmD92MNWiGJ6Be
	GAg6eZ1nszM/yiF4ftUCWm/nqbFYkY30EOyTFUCKQHXQH/dHfrCa7EGawqtW6k4xmQqN61MgVwp
	UyakadSrf5nI+JrOiWFtTQGsiw2yjyOXLEG1D1Ia11hlek30Y4=
X-Received: by 2002:a05:6830:6a14:b0:7f6:bca0:3a7d with SMTP id 46e09a7af769-823fc4405b6mr12174646a34.9.1791283910545;
        Tue, 06 Oct 2026 03:51:50 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:47::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8281fcce238sm2157269a34.6.2026.10.06.03.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:51:49 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v1] fuse: don't launder folios of a bad inode
Date: Tue,  6 Oct 2026 03:51:36 -0700
Message-ID: <20261006105136.3751196-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_flush() and fuse_writepages() reject writing back dirty data for
any inode that has been marked bad, but fuse_launder_folio() doesn't.

This can cause the following warning in fuse_write_file_get() to
trigger, as reported by syzbot:

WARNING: fs/fuse/file.c:2043 at fuse_write_file_get fs/fuse/file.c:2043 [inline]
WARNING: fs/fuse/file.c:2043 at fuse_iomap_writeback_range+0x7c8/0x18f0 fs/fuse/file.c:2227
Call Trace:
    iomap_writeback_folio+0x1526/0x2490 fs/iomap/buffered-io.c:2022
    fuse_launder_folio+0x17b/0x240 fs/fuse/file.c:2331
    folio_unmap_invalidate+0x4cd/0x830 mm/truncate.c:634
    invalidate_inode_pages2_range+0x629/0xb30 mm/truncate.c:726
    fuse_open+0x5a6/0x770 fs/fuse/file.c:297

This can be hit on a writeback cache mount:
1) a writeable file is open and a buffered write dirties some pages
2) another thread opens the same file read-only. fuse_open() passes the
   bad inode check and sends OPEN to the server.
3) a SETATTR reply with the wrong file type marks the inode bad
4) the writeable file is closed. Flush and release skip writeback
   because the inode is bad. The pages stay dirty but the file gets
   removed from write_files.
5) server replies to the OPEN. The reply has no FOPEN_KEEP_CACHE, so
   fuse_open() calls invalidate_inode_pages2().
6) the invalidation finds the dirty pages and calls
   fuse_launder_folio(), which finds no wriable file and hits the
   WARN_ON in fuse_write_file_get().

Instead of trying to write back dirty data for the bad inode,
fuse_launder_folio() should return -EIO.

Fixes: 5d069dbe8aaf ("fuse: fix bad inode")
Reported-by: syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e8200299b0556976e13c
Cc: stable@vger.kernel.org
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 6d707f2b3bff..0ef46f6e0267 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -2351,6 +2351,9 @@ static int fuse_launder_folio(struct folio *folio)
 		.wb_ctx	= &data,
 	};
 
+	if (fuse_is_bad(wpc.inode))
+		return -EIO;
+
 	if (folio_clear_dirty_for_io(folio)) {
 		err = iomap_writeback_folio(&wpc, folio);
 		err = fuse_iomap_writeback_submit(&wpc, err);
-- 
2.52.0

