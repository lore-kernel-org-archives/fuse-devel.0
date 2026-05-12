Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148F13A8723
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 20:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778616313; cv=none; b=bfesxHBugvTPGTVbT8h2pDoGdz/tJcbR4HsN6J6RQarHN+0OiyRWgHENLiLb9J72N4Q9Cp4Xs57n/GDPFviCiR2pll90+2JnRAGPL6PwZ+jOFspB5CL+/hjoZxEUBNKqmgfCWL6xIV88h9Z1r4xiSdhIUhpMCEvamfkw1G4Oqjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778616313; c=relaxed/simple;
	bh=oauhwQ4bfgPwVDvS1oO+Iizts7tGkAlW1rmqN7jXvFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fctVhbFiaRQ2fkaeha6Z8krFvqI+HpOp/jqPOdow7HATLg5kKOu4OUexI2+Hlx4pjHP52pnDygwTc7FXegRajkvvfaPIzSpZQRDtAuX1BqVZqA27TNv3coLJqzUk7aP7ydwPwnmSjEbrCeAj3uienVy/zj26yKhGGdQYkhL9Im0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCABHdVr; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCABHdVr"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8d7e7f48499so649521485a.1
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 13:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778616311; x=1779221111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6dz5TXqHWQjetWKKAInNPkpUojoo8oCZ/Ayi/D/P0KA=;
        b=qCABHdVrj2HvSq5GQE2xvTV98WS77z/D1BdPgcvVyaIADCk4sv1CwT3zwn0usWSFL/
         seEq6eViG/QIBh3YyFF90WtLHA9JcfYRyY/6ULjA5CxlT1YysLQ/JsDmp7SndWachJdF
         aAKpRQsHqLh9fJQkRTxEvf7Jzsxw91SWK44hS3CDAdncSDsxQup9xpFoscM6S5KGzk5n
         yrrApE0/ZQoJh5xSWXOye52HxIwHvc/ytZNbwMFZEQhtzY13IMfX98K674F+ZNaZUuGc
         tR70n/5m9hMIM8sF5Pnm4yEPzrqB+ibBlurDVaLTVtSeDYy4q4GuLtc7dkp9MJD+YC5F
         GGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778616311; x=1779221111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dz5TXqHWQjetWKKAInNPkpUojoo8oCZ/Ayi/D/P0KA=;
        b=gwl+IQreUUHYAMuX1ngmxI0UDWD5JPUKwycdjJZLY1ygI4oRFZUuoVCcvpcsYgOD8+
         zBQofLKud8KBAyM60ig77nibLHfJZOg6AAvCyIJxVXpS8uDKngGsOqgEXdjU/EuRjUAo
         YVNAEyWG/eExr/hN9HnPgZ6pLEuvrPinpgHBP9jTZhu+O6KULZ3pP/7j3pUrd1Fhp8OD
         9nnIno8xQCtX2nu6B7/Qud/UTelCNybtxfW23UnnYW6S+39qzu9AAfup7XXsUeNkCmyp
         KDVtEH8B/2g8Q0Qm35DM6H6tmd9FrB4Trw6jmYLh5qiz6y8rjckkikgLuLFfsVW94dtr
         pPeg==
X-Forwarded-Encrypted: i=1; AFNElJ+IShNSiBanNfoDtOM9wj4c18EENtvvB1qTBeVJ0R48KtYvNF8qNR2/FN63he26/9vnO1LBv3e/wPHz@lists.linux.dev
X-Gm-Message-State: AOJu0YxkZ6Fzn1AczNerAiP/5Zh3oSjuQ9l0yJuNKAHP6W/MPJM0vd5Y
	908hMMeSRan/AXZfOms5FMPsDvSjzTfBtmGc6MOlLLyvDXhtM5XUDYeV
X-Gm-Gg: Acq92OHXPlLCOSnckh4nGL2LzP/aaPlWfBE20BJW38JuiUbKpsFeXcWX0PSFsfXr1Nq
	HmNIUQWXI/GOMC8tdtHg2G3c9sQU+O8+GXnkMnvAqB2nSKkSwcTLSLJ0yOPaoSM3mRjArW4ju/E
	MJrwBgfWZK/9Ryw1RpVFTk7fD9817lO2LTxE5xqCXL8OKgsddrtAkQ8Tbzn6352Jm4x79iBVFAc
	/9tpiQL3BghcHDid4hBzh7cknSTXz4yfKMc2CjBamc1xjZ8uKjlP/8kvbNqj4QMW36iMNl5Qwr7
	IsWrc5cCfXU2cgf2TOTcWZMYTv3yKIiq9VbD/J7bZGu1B1twLMzcyt2zXT8R1DDWrDqlZrEBcnk
	ru2jA67yrzLJq1ZczGEGH9EaEbH0XpKN9JeBilRVoj+3syQ9VX7FKoxVvxT0Fjjv0k3+AbY7k1J
	lam/j9AU8BT7S6dSgRsA==
X-Received: by 2002:a05:620a:1a10:b0:8e4:ebbb:b162 with SMTP id af79cd13be357-90f884e7aadmr73101385a.9.1778616311117;
        Tue, 12 May 2026 13:05:11 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:71::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm3438265485a.41.2026.05.12.13.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:05:10 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Cc: stable@vger.kernel.org
Subject: [PATCH v1] fuse: use copy_splice_read() for FOPEN_DIRECT_IO splice read
Date: Tue, 12 May 2026 13:04:48 -0700
Message-ID: <20260512200448.3818665-1-joannelkoong@gmail.com>
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

This contradicts FOPEN_DIRECT_IO, which is set by the server to indicate
that the page cache should be bypassed entirely. Subsequent splice reads
can then read stale data from the cache instead of fetching fresh data
from the server.

Use copy_splice_read() instead, which will invoke ->read_iter() on each
splice read, sending a FUSE_READ to the server every time without
populating the page cache.

We do not need to add checking for O_DIRECT since this is already
handled at the vfs layer in do_splice_read().

Fixes: 2cb1e08985e3 ("splice: Use filemap_splice_read() instead of generic_file_splice_read()")
Cc: stable@vger.kernel.org
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/file.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 3bdab8d03373..3ebe18ed0264 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1859,7 +1859,9 @@ static ssize_t fuse_splice_read(struct file *in, loff_t *ppos,
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

