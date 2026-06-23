Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA85439E9CF
	for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 20:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246590; cv=none; b=N7YHbvdU9JjQTlHZrPZlt1sPIHnXSEtoZ5Rm/RPt0w7OIrdkzMJOG2CNov+7GcXZ/OzxwubwZHxISQMsUKiI272VzvefgxGdgltmOoUIyGbSsuukrfblNy+zIE3RjR7GowdoR578eIHVh4HDunhVSSTk3xNww51rWgYynD7POIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246590; c=relaxed/simple;
	bh=ae9tZLJ9VP0xrA7+kEz3m9adVBnH3W5m1UaMdylFOhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VxwYrzOrbY1njGkw+QLPfy4tUQdF6WkHOmz0yIRfSTbNb3n8ZIEWEWAgWlzRCGs6u1bvqMLv2Jys4lHoIeIMP6uYwAeT0O+c2ofm49pYIyZ7Vm6vfAFE2fq4m/vhQ621owVJSLvdzHFkQiFzV+vRn6fCznkyrP5pgwdZYiW8fnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZbL/BLQ; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZbL/BLQ"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e6dcc22cbcso268054a34.1
        for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 13:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782246588; x=1782851388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NuNi7da+RA4oD3knIL+KO9HKkOpiQqXbFGyr9zpIeq0=;
        b=TZbL/BLQUHJpia9mST5zjhw5oOMveYShR6UK4FMoWI8Z62qqJwKkiAPJW/3DCm16Ct
         s803BeVdRF0f/n6A2fHiMp2fqGxUghYw/V1CjAP8xdzYmizdTTNsS9Hyr+DtaW/rDpDg
         /1s2uvySj/5LXREbhCWcid/lxRdifBX5NsWbSElb0nEcr4P83Wo3D4AQnxMwIbc0uBg6
         wW075KYRrq2cLQ1PuuNDRPdIOJeP3PIMYlygyVHk+1Hyaee1GN3C9L67xoPmlyvSv7xE
         x6WYCv/ltp7m+RjCFZUKG4aMKfNO+FdHTnhvtpy9jFM20ysOeKLtHEn7XSDY0eHgvSNL
         dM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782246588; x=1782851388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuNi7da+RA4oD3knIL+KO9HKkOpiQqXbFGyr9zpIeq0=;
        b=Ri6ZOsMp42rDBRsVfWOumt4vqQbi5I97YapANYn41nTCAYzDw3u+oE3/0p+ZAQ9Uas
         rbz+RtMq28DbnA02QrDclhEHRDbuJBfBq7zit0csAobE0EFZ6DA73xuvSk8Ci7muQ5Nu
         hs3OgJuGiaOCf3e2hBeYhFMI5Hlaomel5av6HBiiYpAsg9ZLyaORSTTjwwM+qt497gMd
         i9p89X45afGx/Rea80Kw1I/V5wdRaYcol/+bKcgOb6zQDeLeNQtRuo2LlsYK71nP8pGx
         mtAnz37MxRd9AiEScXwkaJmkZ4KtCXnVqx6hpvbvDIBq+7UIUn7VPubygNn/tMn9tfT3
         42EQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mheQb2yGkL242SznGrBtpvPu5QaN0YebZGj7r/hy5RHroiuz2SPIO34oy7kNHOqxIS8gSMh68P5yt@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe7Dw1UK6TG9AXF2sTWiRdjF5LZFZUXOnMMJPqG4UjJ8XvJY5a
	hJQwQTxCcRCzjqXVc5bSTdJMU13cBbLp98iGlcF8DMh6nTNMrvgTh+tb
X-Gm-Gg: AfdE7clrx8BNizTjtCvyVS3Qt/iSzX+QK5gT9utyFiHWa7CkzoafZHqs/uUkq88IBQC
	+fGs7HFOxn3oyFrXKU3VBRGO89OVYhM7b/6rb5FQTQDoISBqSSz3xP3wKCAYDOMm2HSVyw9jeTo
	N9TId7JVgSrZ//X0oPfhngLT53FPi4ROeYDBDq/QnTFpznflZKuygpdicJh11T6eepsHauhPXiA
	4aUHjMgpqaD8tTZwI0LJtxkTPeDEfHXnVNRemOi8m+le9Z+N9RkgC0ciTWgjMxRgQ1q0sllHTJc
	ce4vtgp7HOBcd6W5/U/xGq0P5HJIZynaESB+ZDZuWE1QviGoqNJh2r+EcCIE4KmYlV6KkNmHRUq
	qbSnp7iiFk/tLb2wmiAJXlF7znFPV9emlR5elIzpKnrZjOx2VGOS2mcMvQDn+c4IpI0pX+Bkscp
	cKyRKVpVT1KVuJV4anz64EOmTlAmpXn7sJTnmh83c9GoUpNFK53Fe2kQ8mdXQtcveE
X-Received: by 2002:a05:6808:384c:b0:48a:3f80:ee54 with SMTP id 5614622812f47-4907a57a5e9mr275739b6e.23.1782246588618;
        Tue, 23 Jun 2026 13:29:48 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:54::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48aec0ddd7bsm7130470b6e.7.2026.06.23.13.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:29:48 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org,
	hch@lst.de,
	djwong@kernel.org,
	miklos@szeredi.hu
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 0/2] iomap: add helpers to keep uptodate bitmap in sync
Date: Tue, 23 Jun 2026 13:28:40 -0700
Message-ID: <20260623202843.2064992-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is on top of the main linux tree [1] because it depends on some
fuse changes in Miklos's tree that were merged into 7.2 but not yet pulled
into Christian's vfs tree.

The first patch in this series adds two helpers to iomap that update the
uptodate bitmap whenever a folio's uptodate status needs to be set or cleared.

This is so that external callers who need to update the uptodate folio state
from a non-iomap path can do so and keep the bitmap in sync.

The second patch adds the fuse caller side of it. fuse uses these two helpers
in the notify store path for storing server-pushed data into the page cache
pages and in the writethrough path. This series is needed before fuse can
start using large folios.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/

Joanne Koong (2):
  iomap: add helpers to mark and clear folio uptodate state
  fuse: use iomap helpers to update folio uptodate state

 fs/fuse/file.c         |  6 +++---
 fs/fuse/notify.c       |  4 +++-
 fs/iomap/buffered-io.c | 27 +++++++++++++++++++++++++++
 include/linux/iomap.h  |  2 ++
 4 files changed, 35 insertions(+), 4 deletions(-)

-- 
2.52.0

