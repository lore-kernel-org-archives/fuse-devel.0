Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EC8397E75
	for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 21:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782336607; cv=none; b=mEyDHm7D2I7hof2YcBzgdZuXRZ4otcO4yXMZB++DpQmc/QFiWvR4nFBWtFvpddrRSRtnWxuXzZzoNk9fSOrSvghZ75zGwQ/0tTo+KBAbVX9ZdKpXDbQRF+pNqQqMNyxJO3Tu7E6TP+eEvw1kjXwNYp1QF5KuzLAtorBkpHVgPwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782336607; c=relaxed/simple;
	bh=y9mBjKomb0Ohkd6IM1SyNj7gf9HwdR8XKDbxFncEYsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGRDjyyCpRiWrELkbiJcTYb5sXq9BPmt5iXoyEXXtp0sI30HRybAKQuCJdlr5/axqWfpIwN0OBlixgLfFciJx65EuZbF2Ke1cugjmf0/dOhVrTmo/k1iRsGLVvpAIMhVcsvEj3sfvKxV7Rt2bu0lMGNapn5ps7cxZ7TIcWesYJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/04sHnd; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/04sHnd"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-69ec2ebec61so1000002eaf.3
        for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 14:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782336605; x=1782941405; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrkPDqL0gFKAbIEy421Cyoc2/0k9xEhoVlRCYbqGho4=;
        b=g/04sHndPAijSyaAcDNxwdW4Y5x5f+0U9dYWVGgeIljSz/4iqq7IAhKpBIthAfh+JZ
         O4Pi8E8QtvV8agrXn9G0ThJcAd6/K2tWW/UiCOt0XqOPBHB++imLzu9/JnZJwKJ7jxBg
         aeZEJQr9crXhmdRpzqMYKIgFeoFIPgKN4Kzf5eeQ3nZ1fIK7J5CgQ1ir0txKbyug5Fbo
         Ono30ZZ5kHZO8bJ06CJA3LdkMV86r+GtA6LR+9tIKCRRwO0nQoJlci3oD8tN9Z5lAcRh
         4JGs9QwwFN03Jlxo23ne+/jKhULazLSnBT8osB5O3or8hztl4gYoSXTRkXgkuUvQ8izv
         5HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782336605; x=1782941405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IrkPDqL0gFKAbIEy421Cyoc2/0k9xEhoVlRCYbqGho4=;
        b=SdTPKnqF4XxQhl1P4u/meSO+qHFudvSqB33GvgjJZRpMmEezNVbkFXf1xd3URwUXS9
         KLwH9uhE8EPCDg5WPwWev2uJO9Y6puzo1SY1YmBLWNgRqVdjBLFCfTs4zNdxJTQPKEZW
         CIB2NdLqoTom96yRG/+jDdhqPad1WusU3C6sVaFaK0Z3rpIhdGkSaOFoM89cIbrEzTpC
         NXSS4ORSFQhTCx5bxHinC2/vP8qFwgSChbsoJuBCzXqQ22B9IC8YC5+COwFQYQkszHNZ
         hzYXM1Tlg1W7Ny5tGrTJpnsz07gqk05DlScNVi7GoQmeEW0pHZmAz4lsEQsbpo+tdbUr
         5iCg==
X-Forwarded-Encrypted: i=1; AFNElJ/TxNMZrgoFEWZonR7nh8KljT9176FYMphmx80TbeaKAs2AclLGaLV6+PqLed6ygakeqcKfEk0Udm0i@lists.linux.dev
X-Gm-Message-State: AOJu0YwCEvwoIWwnkk4GdxVlHHlqgE57LHU/Tpt1Fwf5zI9HR7OzQ82j
	zCLMV/9On5dc6MyyksX6S5LT/vnSXoeWpMj+9Xardx5R2IRdyZ+BD01Y
X-Gm-Gg: AfdE7clskbt9eXhBtcTrha5j/VTeHelHVtt6JLfukrO5qd7NRZ9l5aBLZdoyyVej6z7
	iM+G+ErnKdaGbNows7iIEEC0/modc3zyZdVFdFxpWIIROuW0OnRynn6IFfPb/e/Ns3ofpAnK79/
	gTKfIZJTJ27MYmmp7GTPTkzChoR11/PjVH7ssz6EDnDns0rlj1VmaSH/powyS09Sh2Z3wq4cPa6
	wT70T0kiavh0zKXsmqlc2gmhnT0zM8d3pc/GIBdBXTiUZ2PUSB1O47VSKRyBdhCLWJWGEgqJ2Uw
	CutI8lIFmf/cQo887Gf19N3LzNhxeMCW5O8DWak+yONKyf2ZO7qY/+K81cFDpaBzwardSnFnatz
	as2lW3S35ml58sxMYBwtF0LfpGDEuByNAFgYABlF19aWY9a8UO4Z1xK9/0eD2PU6/GDxF6wVj3X
	xthaVv+uIXcWjOtHCmEitjgu5mOmzOoqtPdhSuzoodTkSfMuittMoqLyJK/tv06B4=
X-Received: by 2002:a05:6820:1c94:b0:6a0:bec5:a32d with SMTP id 006d021491bc7-6a122e2a1a3mr3797504eaf.1.1782336605122;
        Wed, 24 Jun 2026 14:30:05 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:8::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0ea0f9dc3sm10031295eaf.12.2026.06.24.14.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:30:04 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org
Cc: willy@infradead.org,
	hch@lst.de,
	djwong@kernel.org,
	miklos@szeredi.hu,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: [PATCH v2 2/2] fuse: use iomap helper to mark folio uptodate
Date: Wed, 24 Jun 2026 14:29:25 -0700
Message-ID: <20260624212925.1668662-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260624212925.1668662-1-joannelkoong@gmail.com>
References: <20260624212925.1668662-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When fuse enables large folios, a large folio will be backed by
iomap_folio_state that keeps track of uptodate and dirty state in an
internal bitmap.

Fuse writethrough and notify store paths currently set folio uptodate
state with folio_mark_uptodate(), which touches only the folio-level
flag, but on an iomap-backed folio, that leaves the uptodate bitmap out
of sync.

Use the iomap_folio_mark_uptodate() helper to update both the folio
uptodate state and the iomap uptodate bitmap.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/file.c   | 2 +-
 fs/fuse/notify.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index e052a0d44dee..26f27e113e9c 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1335,7 +1335,7 @@ static ssize_t fuse_fill_write_pages(struct fuse_io_args *ia,
 
 		/* If we copied full folio, mark it uptodate */
 		if (tmp == folio_size(folio))
-			folio_mark_uptodate(folio);
+			iomap_folio_mark_uptodate(folio);
 
 		if (folio_test_uptodate(folio)) {
 			folio_unlock(folio);
diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
index 29578104ae6c..1ba763705d91 100644
--- a/fs/fuse/notify.c
+++ b/fs/fuse/notify.c
@@ -2,6 +2,8 @@
 
 #include "dev.h"
 #include "fuse_i.h"
+
+#include <linux/iomap.h>
 #include <linux/pagemap.h>
 
 static int fuse_notify_poll(struct fuse_conn *fc, unsigned int size,
@@ -192,7 +194,7 @@ static int fuse_notify_store(struct fuse_conn *fc, unsigned int size,
 		if (!folio_test_uptodate(folio) && !err && folio_offset == 0 &&
 		    (nr_bytes == folio_size(folio) || file_size == end)) {
 			folio_zero_segment(folio, nr_bytes, folio_size(folio));
-			folio_mark_uptodate(folio);
+			iomap_folio_mark_uptodate(folio);
 		}
 		folio_unlock(folio);
 		folio_put(folio);
-- 
2.52.0

