Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F22324DD15
	for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 01:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782264187; cv=none; b=Ud+Ku0WFe0irQaZcEBA9zyTAo5mlWRf4gJAVVrqGZY4Y0PQ2RRdu8De30WcLQGs6SUta+/Ba9vnhjC3c2XNal7uA3TC5dWkPh6pufVa/NmVSovtTR5XF1mTrqvH5vvvjnYlfVK/hfsL2kK/sU44ckcw02FAaaECaO798Z8tPztA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782264187; c=relaxed/simple;
	bh=v1Y1QdIYybPo+UkJTt006CAjwnUJ3y6spAYU6LGjTBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TJV3fXnmzDeWAyUAAT02imQjyRu7NQqgqPrYF7HP73T20wiwJ8BM4BnBFcB/aGNA4RFiSQKhdD4FGovHpmzGsoaB6EHLihJcSq08rHa2aKX8TRuKMjdy1m7V+WsfzpXqqqks0hQv3oChoz9aKyeAnMv6xpgxnfTBPvc5NWNZIXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=effdZfHJ; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="effdZfHJ"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-44793168d3bso466520fac.0
        for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 18:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782264185; x=1782868985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GgI6Ih5U1iu39uaT3bJjpXfBGR7ZZ/XYvFDeBngaCls=;
        b=effdZfHJcH4atDn2C3Ge5SdgXvlxCRTEQfPeze5PSc+JQBB60og3XyFxa8q/o6gec0
         fNxBpFKehG+wjrO+1L97rqru20mDFEcZkmPiwoXybou9Sx0Y+p7QNQ7f/yaUGwVL5jHr
         hwFrg6mwMf0Z9351kSR2hQQJuNPLSk7oe55CMDBj3XozYSFM9cSmZ/yGC5Vc7QEY3snD
         5GlBKoDfJB8NDwl6okQBXn+8H/JKzZsp2FZHoQh1NzW/46fST0wzm+RWBnomV4q12tFc
         JOYo+RLStdrqdt1ugAm52BBaEjbtSAcuLHZa8nmaNvoT8FwY+ZbuUfxf03+iMJMkTj0o
         EVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782264185; x=1782868985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgI6Ih5U1iu39uaT3bJjpXfBGR7ZZ/XYvFDeBngaCls=;
        b=hv+z/9Kw8i8ZKOFgCv3EYGbh5RdJmeauQtl7I4iGuCfioiTvrTmIMcx8fDIfwQbI13
         y/uCP7tUJIyR9BJ9LD6JZog+qsS7kLUaWK77tEt8/HkBH5U+Vn6AUfqpbM5y2GfpgiCL
         lgoN5HMGiFnXSVAlrr2mgKW5QNgJR3lbLITtv1/dckg1nudhK/mlA/hYJwY8eeP7nr+k
         l1xI0obsyfhZvYexi78md1a+s6ooxGfd8R9M9hHE2DavNDSz81v5YTL9AKzHIx141wh3
         fAy4hxDt29l97PTXZiwv+AzSKBECd34K+vXh+Z6+EXg+B6dFYI7GcKjS4evsF7lx6v1D
         mDog==
X-Forwarded-Encrypted: i=1; AFNElJ/WQ9wNTGGTMZn5vtkpXY0QwnLvkpUNT8qBnHbxp7kggKV4mE+yBAV8Fq8oEESTqx1hF8Z9KnWPnQfC@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn3wWoomlNkyPoTMzLZ9Qag1cl49V9Ye564a0ZzNX7t/Wf+v8F
	otlHjZqqlzz/5rYPevZBpEQ17m/D6hpWi6X2zMsv7z6BH47L+HaY2ELj
X-Gm-Gg: AfdE7cn3+YIjmZILhvNCMIKYE+9lUJmxCHhsk0S7MM+ld5dgeg+igMEAQAZRT4Bd0Dh
	8QmVRmjUlUzprOlbpI43AHAhb71+PUwpgErt30SCTobcNSsA92nrKgXceuv9FJxJjg2kmNDLomo
	DLGL3HFoe+ShRREYidfVUYNyzPYuoMOdanbJ/YcV3eWQ31Rbfeayd14cVj4WFsH8GM31CX4lsfv
	h+fUM4kkiUhT3yvol36/3IrbSuSW0RuKcWFUAarp/bPSULRZrarGI1GoMrGoqcs8Wd/kZ737TGb
	LbH7MIWDw0wVi4UjuuxIbOmj2W37EOWk6A+LH/wuiGciymiBaCKWukWlC3vvXuF3uCzUaIq5my1
	4ZYAjde10LyUeNwnmAVb1aZXsJjC3mxJPr/a/gJWtnjpqez96qQdFlF862snuv0XeV8iAH8hYHR
	0psvTsZCS3FU68up2Dq2tVbSjv9mf0SDA381zZcJSbFW7aw3Pk0qd8nlffI5yi8C4=
X-Received: by 2002:a05:6870:fba1:b0:43d:5d22:4719 with SMTP id 586e51a60fabf-4473245bbe2mr13902153fac.22.1782264185234;
        Tue, 23 Jun 2026 18:23:05 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:2::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472ec5fd4csm9743258fac.2.2026.06.23.18.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 18:23:04 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: jefflexu@linux.alibaba.com,
	horst@birthelmer.de,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1] fuse: enable large folios
Date: Tue, 23 Jun 2026 18:21:32 -0700
Message-ID: <20260624012132.1719941-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable large folios, capping the max order at the largest request fuse
can issue, so a folio always fits within a single request. The order
range minimum is 0, so under memory pressure the allocator falls back to
smaller folios.

Benchmarks (libfuse passthrough_hp, buffered fio, single job, 4 GiB
file, medians, NUMA-pinned, performance governor, strictlimiting on by
default):

tmpfs backing (page-cache bound):
  workload          bs      large folios off   on        delta
  seq read,  cold,  128k    3110 MiB/s    4514 MiB/s     +45%
  seq read,  cold,  1M      3079 MiB/s    5181 MiB/s     +68%
  seq read,  warm,  128k    2438 MiB/s    4486 MiB/s     +84%
  seq read,  warm,  1M      2403 MiB/s    5123 MiB/s    +113%
  writeback write, seq,128k 1211 MiB/s    1699 MiB/s     +40%
  writeback write, seq, 1M  1462 MiB/s    2208 MiB/s     +51%
  writeback write, rand,128k 1101 MiB/s   1757 MiB/s     +60% +
  writeback write, rand, 1M 1284 MiB/s    2228 MiB/s     +74% +

xfs on NVMe backing (device bound for cold I/O):
  workload          bs      large folios off   on        delta
  seq read,  cold,  128k    2030 MiB/s    2172 MiB/s      +7% *
  seq read,  cold,  1M      1999 MiB/s    2181 MiB/s      +9% *
  seq read,  warm,  128k    2451 MiB/s    4939 MiB/s    +101%
  seq read,  warm,  1M      2340 MiB/s    5639 MiB/s    +141%
  writeback write, seq,128k  637 MiB/s     747 MiB/s     +17% *
  writeback write, seq, 1M   694 MiB/s     833 MiB/s     +20% *
  writeback write, rand,128k 1004 MiB/s   1648 MiB/s     +64% +
  writeback write, rand, 1M 1171 MiB/s    2055 MiB/s     +75% +

(*) device-bandwidth bound. Not much throughput gain but system cpu
utilization was roughly halved
(+) random write was tested as an overwrite of a hot region (under
writeback, this is page-cache bound, so the gain comes from lower
per-folio cpu overhead rather than higher backing-device throughput)

Random reads (4k and 128k) and writethrough writes were neutral with
no regression (no read-modify-write or read-amplification penalty from
large folios)

More information about the benchmark setup and results are in
https://github.com/joannekoong/linux/commits/fuse_large_folios_benchmarks/

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
This has a dependency on the iomap uptodate helpers that were submitted to
Christian's vfs tree [1]. If it's easier to route this patch through
Christian's tree, I can resubmit this.

[1] https://lore.kernel.org/linux-fsdevel/20260623202843.2064992-1-joannelkoong@gmail.com/

 fs/fuse/file.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index cb8da4c06d17..3c9be6d8ede1 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -3136,4 +3136,14 @@ void fuse_init_file_inode(struct inode *inode, unsigned int flags)
 
 	if (IS_ENABLED(CONFIG_FUSE_DAX))
 		fuse_dax_inode_init(inode, flags);
+
+	if (!FUSE_IS_DAX(inode)) {
+		unsigned int max_pages = min(min(fc->max_write,
+						 fc->max_read) >> PAGE_SHIFT,
+					     fc->max_pages);
+
+		if (max_pages)
+			mapping_set_folio_order_range(inode->i_mapping, 0,
+						      ilog2(max_pages));
+	}
 }
-- 
2.52.0

