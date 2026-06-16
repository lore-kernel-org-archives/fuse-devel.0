Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536F33F58D8
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 23:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781651612; cv=none; b=YWM7y7diOFlL6Wq6RFUZyxv+Xun+uQbqDtb+lfxVfNKjLr7QRNjM34yQ7AqmIQs+/GD3KjEs5jDHFPrErBd7vHyPajRQncjZkUB3UbpewxKmf4QE+FFxhScNxZle061xEDz/qe4DwiMi1Q+cYIvWGGuh64d83/OapWU/2eCRvFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781651612; c=relaxed/simple;
	bh=lkS+KHBqJXeYGJHdOSlajz6hbM4WTk5DhH53EzMx/6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gqO6TXgIZlYy3tioMtMSKxzyteWCg5m1wYB0wlavkAEns5uU4l8mW3B7FgdEIa402CEnM7OHH/yI5g8kD5SeHABkqT95cEUhbaN1k0vUPoc7KIno3AYuFlum0uC23Q1kuz2yERRJa0aWu3e2WFYE5D7HsVXiXSElGi4pGp/TI/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qfPXVq/V; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qfPXVq/V"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e6c047c6bfso4132263a34.3
        for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 16:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781651610; x=1782256410; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84DiwMXLdEq4yqPEouNIMtm8S6/TgLWUF9alM51937s=;
        b=qfPXVq/VU/cq/B/W5dGWC1YUfreb4ZDgBUisZOpgMU5PQPAPfzkAxKk+KuD9gzySob
         +NXwep4joZwF6K1+QsWI/FrpHwqvvNquw61GKmOzaBKuP09o69LYKKmmmG5r06PTZbD1
         hTIqiYVaLbfSHuKuWCqJSUu7qG5+HV2lIgOrSUseiwNnbZtRxVUdda59+bE1/jWiS004
         9sB1KTVCuMYc1JWHw51fnYhmzefxTr/y4QIm+n6vVMKtXWwRcrtC5XdfB6kiGqZNNi7T
         4mze0XOYrvpQslkN6Szcx3W6mHzNLSl1LKngA7oe8MIlsRcc1Yxu80Nrd9dogwuvJfu+
         HiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781651610; x=1782256410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=84DiwMXLdEq4yqPEouNIMtm8S6/TgLWUF9alM51937s=;
        b=QLsEgjHig1sIRRsJMiudwr9g+0g+/bq/gn0Zgz6B9cK7IgB28PC+fptaoltkivfkEb
         mPA8eDJsVpBG5siCgNVtvp303Q8QZY7k/NJiPfJD3YOs2ix9TuG+Gv+9Z4eWT3zJaw0g
         tfWSyVOcd3Ddq5mSKqISN0eO8Gelimp5Z/bxP/mEjiHT2dme0JNbAzNP1QXsRTjHehST
         znyEBZc9f85L/ANxfYjgrrrlyiy8i6g5n4VfIn1EWJ06kYNylXvICzHnAeuW2EKq3HCR
         yprSa9RCCAYlbFe/UUUig/+PR+1Cb8b6kJ0Z/2RzaS7WPfqL2UzNLaZwYXcEuwTwR7rz
         whKA==
X-Forwarded-Encrypted: i=1; AFNElJ8KSsEGBcI5EIYMUJPIDbH2WE33vtyqKuRUw0Dx6rjGQOQ5Dp5IGTCQEgpGSQZKaQWo4j4RWEzGZsx7@lists.linux.dev
X-Gm-Message-State: AOJu0YwDnPijuVxp2mYyykOnZcAQ3QovB41BxKAHqrzuU2mslmUQQ8EV
	T9yjViTi5h8isNzGIziupMMXi7c8my0ozWNFTCDYy8vBqJmC49gFekBj
X-Gm-Gg: Acq92OEwYXj0NOdqioxL/1KWe0VsSF0pDSmyQsPE5coKmQAJSJSlfFqW1rb5w4m/v29
	7Twq5Pkvu7NxxJPWyreIEyZkt5GooUJ9okFuaBXRJwoEAbYeO3NtV5SMb1ntqrVvssCEN1ibRq7
	R91T9HnBw9B5fBVhVc8ogRXEEZTrrGEvoj14aAPpDVZJi1H4OQQ/QZmxZ1Ik2GDiJKbwLXwdr80
	vbid0/nZvdiUAcIZ6o/9T4gb39jdzvAt5w3fIvVotfiwNJNRhHZ29+Ee6QC+553LF+WAVhpw5E+
	0hZjNlaaQoB4RGFC4rEiov5ujPaW9CRpoRF6MYAzhkFuMRm5RXWYeOe6K5W1r/PEWBtNd7INlX+
	GqEIBGldNkCl+G4C2brB1Q/C1uWsDdCmsJUyLiqSAhdRRo4Z1HxLNZs5esSVl/+VAqHXqSy1+FR
	tPxou3g8fom/UY2cUPmrjvJqIhnQ0V2zPxFNuOEwiAvNp5BEFA2MenASFR6SvDogO07f5azTiGr
	CaLXCaY317xFLn727peCLrQkqeuDCM17qLZCHV2je/X+Lqd044fVjk=
X-Received: by 2002:a05:6830:6ae5:b0:7e6:f2ef:e231 with SMTP id 46e09a7af769-7e90b2ae089mr1702940a34.2.1781651610294;
        Tue, 16 Jun 2026 16:13:30 -0700 (PDT)
Received: from rdf-gcp2.us-central1-b.c.storage-xlrait-66065.internal (163.80.112.136.bc.googleusercontent.com. [136.112.80.163])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f5a1b86sm7530924a34.5.2026.06.16.16.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:13:29 -0700 (PDT)
From: Russ Fellows <russ.fellows@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Amir Goldstein <amir73il@gmail.com>,
	Russ Fellows <russ.fellows@gmail.com>
Subject: [PATCH v3 1/2] fuse: preserve FOPEN_PARALLEL_DIRECT_WRITES for passthrough opens
Date: Tue, 16 Jun 2026 23:13:21 +0000
Message-ID: <20260616231325.16788-2-russ.fellows@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260616231325.16788-1-russ.fellows@gmail.com>
References: <20260616231325.16788-1-russ.fellows@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fuse_file_io_open() clears FOPEN_PARALLEL_DIRECT_WRITES for any open
that lacks FOPEN_DIRECT_IO.  That rule is too strict for passthrough
opens, which already bypass the page cache through the backing file
and do not need FOPEN_DIRECT_IO to guarantee direct-I/O semantics.
Clearing the flag before the passthrough write path sees it prevents
the kernel from ever taking the shared-lock path for passthrough writes.

Introduce FOPEN_IOMODE helper macros to classify the effective I/O mode
of an open file:

  FOPEN_IOMODE_IS_CACHED(oflags)      - page-cache I/O (neither flag)
  FOPEN_IOMODE_IS_DIRECT(oflags)      - DIRECT_IO is set
  FOPEN_IOMODE_IS_PASSTHROUGH(oflags) - PASSTHROUGH only (no DIRECT_IO)

Use FOPEN_IOMODE_IS_CACHED to express the PARALLEL_DIRECT_WRITES guard
cleanly: the flag is only suppressed for cached iomode, not for passthrough
or direct-IO mode.

This is a prerequisite for passthrough write parallelism; without it the
shared-lock path in the subsequent patch never activates.

Signed-off-by: Russ Fellows <russ.fellows@gmail.com>
---
 fs/fuse/iomode.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index c99e285f3..46e60b04c 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -165,6 +165,23 @@ static void fuse_file_uncached_io_release(struct fuse_file *ff,
 	(FOPEN_PASSTHROUGH | FOPEN_DIRECT_IO | FOPEN_PARALLEL_DIRECT_WRITES | \
 	 FOPEN_NOFLUSH)
 
+/*
+ * Helpers to classify the effective I/O mode of an open file.
+ *
+ * FOPEN_IOMODE()         - extract the mode-relevant bits
+ * FOPEN_IOMODE_IS_CACHED - neither DIRECT_IO nor PASSTHROUGH: page-cache I/O
+ * FOPEN_IOMODE_IS_DIRECT - DIRECT_IO is set (may also have PASSTHROUGH)
+ * FOPEN_IOMODE_IS_PASSTHROUGH - PASSTHROUGH only, without DIRECT_IO
+ */
+#define FOPEN_IOMODE(oflags) \
+	((oflags) & (FOPEN_DIRECT_IO | FOPEN_PASSTHROUGH))
+#define FOPEN_IOMODE_IS_CACHED(oflags) \
+	(FOPEN_IOMODE(oflags) == 0)
+#define FOPEN_IOMODE_IS_DIRECT(oflags) \
+	(FOPEN_IOMODE(oflags) & FOPEN_DIRECT_IO)
+#define FOPEN_IOMODE_IS_PASSTHROUGH(oflags) \
+	(FOPEN_IOMODE(oflags) == FOPEN_PASSTHROUGH)
+
 static int fuse_file_passthrough_open(struct inode *inode, struct file *file)
 {
 	struct fuse_file *ff = file->private_data;
@@ -216,9 +233,11 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
 		goto fail;
 
 	/*
-	 * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO.
+	 * FOPEN_PARALLEL_DIRECT_WRITES is not supported with cached iomode.
+	 * Passthrough and direct-IO both bypass the page cache, so both are
+	 * eligible to enable parallel direct writes.
 	 */
-	if (!(ff->open_flags & FOPEN_DIRECT_IO))
+	if (FOPEN_IOMODE_IS_CACHED(ff->open_flags))
 		ff->open_flags &= ~FOPEN_PARALLEL_DIRECT_WRITES;
 
 	/*
@@ -228,8 +247,13 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
 	 * Note that if user opens a file open with O_DIRECT, but server did
 	 * not specify FOPEN_DIRECT_IO, a later fcntl() could remove O_DIRECT,
 	 * so we put the inode in caching mode to prevent parallel dio.
+	 *
+	 * Pure direct-IO (DIRECT_IO without PASSTHROUGH) needs no page-cache
+	 * iomode machinery — return early.  When DIRECT_IO and PASSTHROUGH are
+	 * both set, write_iter uses the direct-IO path but the backing file
+	 * still needs to be opened below.
 	 */
-	if ((ff->open_flags & FOPEN_DIRECT_IO) &&
+	if (FOPEN_IOMODE_IS_DIRECT(ff->open_flags) &&
 	    !(ff->open_flags & FOPEN_PASSTHROUGH))
 		return 0;
 
-- 
2.51.0

