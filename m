Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FAB3876DF
	for <fuse-devel@lists.linux.dev>; Wed, 13 May 2026 23:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714133; cv=none; b=G79XydicabwhDE8QQeQX4kr8jlu+DKA8OnzLxWZrxuJd6tDwl/j/x2Bb4l6fM5JwbFLlDmOJ+SsMIaUWFw+KZTzYs7geKrtEgA4y4mHVlnMChsPOd3DmMb1t837U7ag0fUQmVJ5wy9NsRSqZ4sijRk8QO5r4thDYOym7EoDx+2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714133; c=relaxed/simple;
	bh=OP6feStZGZdFFWZ14CThiMu8VdQOuHA2BR9V1ND4ff4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cuPmsY/LxZLF0kVN8mQpjSbRR/7D3wUUB9K3KBwg0/+2TftiSwL73/VZ+LAfJvlgxxAWXSqgJlXfsLKCqjNgcKGpg+2EOr7yEovf8i9py0NDV9JWz8UurHLcb2z0x57p5NC2+9+CgGROoFP1xVGlFZ12YPhX9Mc9vGM0qgpv1xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQQJvMQw; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQQJvMQw"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-65dead17c24so2821085d50.2
        for <fuse-devel@lists.linux.dev>; Wed, 13 May 2026 16:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778714131; x=1779318931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W+tDo1tY/LI2PXPcsTmkqJ4CzUr5sNutShNSx1ijTlg=;
        b=cQQJvMQwm/53M+N0EFyGjjtKBfIs+EPmxmrGyuzH6Bgcndt+V+gK/HjIMUWY6GHc1G
         O+PgyPtS1C40Yfb2elbEUq1DPLJqIakGn7Z4RunBPsuHjGbj6fpu2KSzvYckNqc/ljim
         lsIsbbSmH1PyEN387bwA5GUqRZIUIKZGrGC98M+K7ZqBTVLCPXtvott4MYo+SsHKFQuL
         WzAkAaLpfiqfvH5M1OG5mnTSLI7j34JGlUf/UcgRiRvrjNp/nXZWUOohk5NR5cDYYu44
         wbxsALl5lGjJqXn8rWJFBg+5paaaD+XvBtAXu/JKpk/k7wuH/N18H1Po7gZ6fc2whkEv
         1DVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778714131; x=1779318931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+tDo1tY/LI2PXPcsTmkqJ4CzUr5sNutShNSx1ijTlg=;
        b=Md5iq5WuL3AO2e0+49E6cEnNLuMr+k5yxIlgn2ErVfnvULcV1DeKeNTrBPjoBcdvy1
         yWlMY7gVnY6/mXhcW/rW1wG2A3DWoJayObGNkthQn2RQ0fkmIRp/af3ookpvv67Kw4Qa
         OcejuWjkVlYHHkkR1dhes5iklnOuAIKrIns5uW4MX2qtJbih9gpHOlcQF5a8J9qEUI6c
         FlhpWoxtiy0nHmkXuMeK6soJH8SBHBv9RFXXLy07lGqus07rG0Yhgw7saQg8oTyVrGpU
         INFioqdJMkXfMAxOzzLnGG0C6u65sShKtiBxeWWl4tEnK1FMOArANXW1CA8YYfTh61Qv
         ftwA==
X-Forwarded-Encrypted: i=1; AFNElJ+CWlUSSO1f+MfyHlUpD4zquO2SO6XQU1pJbu86zOtFaysJHgjBQTCeYcf28+Z4NsU3AFm1X7oL5Eqw@lists.linux.dev
X-Gm-Message-State: AOJu0YzFpCARKw7UiY8FM9gG6AhWKzqha0DXpIqs1whg1rWOJld8uKZd
	/ORmo5Aat8N7aHiAcSuO+b+i76DmKT8mbZ5uqYcwepJoxTSz7meRiZa4
X-Gm-Gg: Acq92OER0cEgcUmmH8Nm8TIiutK9yZvZkTtGtD/Vh/M7aomkdbTwFwTqDs/KLFmkRZP
	D96gnRyHHrCyewgi8fA48PtQSwn+uSjFegptlId5WGiZoBrbZPGSCc+BHUUwvtjLoVPju6VOfLJ
	8fgVw44F2WSTLN1b6SCt+i4DP/jlR+h6a2smj6bqROWgVJPan7T+Roa8tlZ3NdFbKiXpCNkyQwy
	heHs7zftHZCFclXlCc2Z1zHZJxHXl4F/ubLmY4YcYQz3lXjs6d8FU1IvUXCJb5e1CmvjGO+MWzM
	MTBSmZsQ/C0mVC3i/CWRcG4V4Hkem/jGdd2BlMjEdBGHG3zHQnNwRM/Z15tE6xSVKEPyQcMEILn
	EWqUDKlih18S2o4YaZenq7uv6TavgtWSRX8eKFXakWBWToogAXbHLnSCUXu1PjvmkdRUX+uNuUX
	XT1Znus7vWqHql012i3zex
X-Received: by 2002:a05:690e:4808:b0:65c:1df4:545f with SMTP id 956f58d0204a3-65df63468admr4097359d50.47.1778714131098;
        Wed, 13 May 2026 16:15:31 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:50::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0dbd101asm254164d50.19.2026.05.13.16.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 16:15:30 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v2] fuse: use copy_splice_read() for FOPEN_DIRECT_IO splice read
Date: Wed, 13 May 2026 16:14:37 -0700
Message-ID: <20260513231437.1806724-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When FOPEN_DIRECT_IO is set, fuse_splice_read() calls
filemap_splice_read(), which populates the pipe with pages from the fuse
inode's page cache.

This is incorrect for files opened with FOPEN_DIRECT_IO, where reads
should fetch fresh data from the server rather than using cached (and
potentially stale) data.

Use copy_splice_read() instead, which will invoke ->read_iter() on each
splice read, sending a FUSE_READ to the server every time.

We do not need to add checking for O_DIRECT since this is already
handled at the vfs layer in do_splice_read().

Fixes: 2cb1e08985e3 ("splice: Use filemap_splice_read() instead of generic_file_splice_read()")
Cc: stable@vger.kernel.org
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
v1 -> v2: 
- Reword commit message to be more accurate, per Amir's feedback

v1: https://lore.kernel.org/fuse-devel/20260512200448.3818665-1-joannelkoong@gmail.com/
---
 fs/fuse/file.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index b8fd148dc109..7a35ac3e0023 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1858,7 +1858,9 @@ static ssize_t fuse_splice_read(struct file *in, loff_t *ppos,
 	struct fuse_file *ff = in->private_data;
 
 	/* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
-	if (fuse_file_passthrough(ff) && !(ff->open_flags & FOPEN_DIRECT_IO))
+	if (ff->open_flags & FOPEN_DIRECT_IO)
+		return copy_splice_read(in, ppos, pipe, len, flags);
+	else if (fuse_file_passthrough(ff))
 		return fuse_passthrough_splice_read(in, ppos, pipe, len, flags);
 	else
 		return filemap_splice_read(in, ppos, pipe, len, flags);
-- 
2.52.0

