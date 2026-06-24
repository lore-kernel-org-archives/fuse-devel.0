Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D36A3E559B
	for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 21:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782336597; cv=none; b=bguHi39RWKr4uu0/zeC97snh1gcL8fmQoYNUTsrLR1L/5BR5wnHsQMfsh70DJGD8UbG5rBUhEobWcvbrGthD/772glMldXNRSyMQ5WyXnZaOCglIQpjYiMfiakVYOyuPGVpJEuAkGbgCUUkcU+Hsm1wD1W+VZBRWf+v3IK8RvUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782336597; c=relaxed/simple;
	bh=TuCF5sKw9UIxxPCRQm3DQ93sKxwz/gr8zeSeRiS6Tks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GHEa/wUmSvZ6K8BU75IzmDa6dI56U5eVry0aL/pV/XQgCg1bccP+vs1wBYQI/Y7MNY4Mh+xo9QlwyTX3YsBLkIQ60uOzoReRjjFirkqAWP1OUH9+Jmm9O2G1RnD6+ZVK9Wu9pirOT1Tz75gkLUtWE2RaDumLDszvKvFm1v4CjNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+8ljmxX; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+8ljmxX"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-69d862236ddso953517eaf.0
        for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 14:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782336594; x=1782941394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cVkmaP5nSHlauDt7X0RCfjMJrLELIxh7onUnnYVHSNA=;
        b=a+8ljmxXcmKAswNX97ogV8N9bgA5DWZiLrhh+M7VMuyabw30lODC+4bVH85+0lzfG6
         /Wh9MWEXU9AM01H5ivTkb7NJe4FOU26Z6j/4YG3PYGTk/e51ud3sfwNKLyMp0wI6jsAS
         nFe1C+BZcHbBFt4eSIhTYKWdH3CS2NBgE90tcwfsmt+iH4Z5OQcoHtrkdG0P8iRQ+296
         f5QFR71+9RGIrhsjOQCEDedzl5SG89ihPqU1BTF/OzIxGLbPgu36t8g85yj1UOHTqrG6
         0tcek21OJPfUBVcb5hMeG+onxD2gHxW1wOSZcrTBim8oj4btTL9HxoWLlIek21quM33/
         N5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782336594; x=1782941394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVkmaP5nSHlauDt7X0RCfjMJrLELIxh7onUnnYVHSNA=;
        b=ZExhZtxfIaLGgfihV+iWJIuc37weUF9FRA7c+g1NopfdAAenXb34yUdqSqudYxab2l
         uwinz67Ei1oZz4gmlrxCLQCyGWf42UWUDV7xndc001e0yAwnbD5aBpVw4wTUQmJKjv5s
         MYGd7oDPvfOxDCmkBHgrSkxAdQttaIcarplL4LpmeJfuUxtk1hw6f1cLpVVFd3S7mdmB
         7oL1NajGgIH5RXdv72k9Ub6mYKKDwnLNwTdPbu+Axo43yHLrHhCLebvXkmxPoRMFEA2d
         afE8eiT1Z6yGRNNpFCjmkjDtbaTZq0AwJ3hlvjiXUgMHSVTTYpcu0AOa2J2Ru/pHxRVv
         CZSg==
X-Forwarded-Encrypted: i=1; AFNElJ/YmBo0yll3b9L1dwMOhL+EoNKJi7XbVwL+bjPE4yhkEjChmMpyZhyIAnaSLjr3ycoIOdQTg236ZDfg@lists.linux.dev
X-Gm-Message-State: AOJu0YwzpHsF9l3zmVvevDeh76Xk5/pMEa1HZX3WhPxheWTO53N4yCQZ
	tpq904RPqnGxe8ySdM8uovbX8GBR/IFCvcil8W8UBf32y8wJxcNO2gjF
X-Gm-Gg: AfdE7cmAjN20pWZ8X83tckrwAoXK7rtOgPEEnXe5AdSFrkZzFm+Wahd5yZ+Go/ylppC
	mp2bhWyzXNqOJlSSVf3IA5dOuPcbTxTSoXFnzp1sWVCoyWwKnRMb2bs92uzkodJnXQ1wfWuRlBL
	oZhWWje4/jkytEj+jjnbYDbidMmYNWttIeYQty8TcOYSY3FDsU6f6iHqjJjjpev9i16wPhXMITB
	9P8LYOvX8mafEiBvmO+Hd5D8V5V2nfB8leCyWNfQTZ3kqdsrcP5lfI8/tshw5kvrxjO+EOhhZGy
	hVNkXzsYr+cuE0xFrXaInkakZN0q6KOs58Ee40b0ttUicGkAt8NjLfP3dzrRlmZKjALAB3BVBpF
	l6d1N0QJlJFsSKIOdUCR+la3/3yvmrhAdzbTt4hGBFFqFT3gqHiCV1rtnEC9IQOlQJLHpn8fOZP
	Wpgs/+EOZlj2MOP3uXqPIXNwoY8Eh693p8h98uC+rdsZaWzJvyEFatSYyGWeeHsAbp
X-Received: by 2002:a05:6820:4b14:b0:69e:ba22:33a8 with SMTP id 006d021491bc7-6a122e90ea3mr3488526eaf.9.1782336594077;
        Wed, 24 Jun 2026 14:29:54 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:57::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472eccfa68sm10448851fac.5.2026.06.24.14.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:29:53 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org
Cc: willy@infradead.org,
	hch@lst.de,
	djwong@kernel.org,
	miklos@szeredi.hu,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: [PATCH v2 0/2] iomap: add helper to keep uptodate bitmap in sync
Date: Wed, 24 Jun 2026 14:29:23 -0700
Message-ID: <20260624212925.1668662-1-joannelkoong@gmail.com>
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

The first patch in this series adds a helper to iomap that also updates the
uptodate bitmap whenever a folio needs to be marked uptodate.

This is so that external callers who need to mark a folio as uptodate from a
non-iomap path can do so and keep the bitmap in sync.

The second patch adds the fuse caller side of it. fuse uses this helper in the
notify store path for storing server-pushed data into the page cache pages and
in the writethrough path when a full folio is copied to the page cache. This
series is needed before fuse can start using large folios [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/
[2] https://lore.kernel.org/fuse-devel/20260624012132.1719941-1-joannelkoong@gmail.com/

Changelog
---------
v1: https://lore.kernel.org/linux-fsdevel/20260623202843.2064992-1-joannelkoong@gmail.com/
v1 -> v2:
* drop helper for clearing uptodate state, as per Matthew and Christoph's
  comments

Joanne Koong (2):
  iomap: add helper to mark folio uptodate
  fuse: use iomap helper to mark folio uptodate

 fs/fuse/file.c         | 2 +-
 fs/fuse/notify.c       | 4 +++-
 fs/iomap/buffered-io.c | 6 ++++++
 include/linux/iomap.h  | 1 +
 4 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.52.0

