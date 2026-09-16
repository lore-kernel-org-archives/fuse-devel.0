Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B16EC2C8
	for <fuse-devel@lists.linux.dev>; Wed, 16 Sep 2026 01:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520738; cv=none; b=p9RP4OREHLew+3LNpPlrPyNNEUQnGr//hlgMd11xn3Guk2g5GPEjdh36O0fFsI8y7SsuCpB8BERXIl/HhWM73KoYegeVtEpRsqgSaLuyZZl9NdZ+Hj80Afw5z68qP1rDjAwDWAc9y8gmdtBxTuhYA7Z0tB6arGefSqMf0hp0SXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520738; c=relaxed/simple;
	bh=oqJxe01qiaXbDSlZB+aN4avughoiPvMSLCXWwzKIdc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rHL96uhF1UYOomcuhvul+Pk5G+RdeWIFI/KMxWsZGx+5ogOlLhqf45jCZqAxTei2Q1rA4exJhxP+y/dZPnPdDfUMJzDuyORUeUpwy4EMm8nL8oCwTsIwoB4ar6PheStzHrCkVrgu3S4ZL/2DRaO9EGHeeQJRe+TUnSJxq0mZ5sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKDKpNW3; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKDKpNW3"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae6b1b26so229750eaf.2
        for <fuse-devel@lists.linux.dev>; Tue, 15 Sep 2026 18:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520736; x=1790125536; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=88dtHSa8WPH4NYU5i+1r9D6cUdt6GdeC9JPuIvkZu08=;
        b=PKDKpNW3RllRcnw3VmvQ/wik+68BP7aMGiZD+++Dkp5adnDU+V5oFh0dmvUF9Z7CMr
         yfGnL44AhKGd+ZGfr1g6x5Ie1cVM1u6b4uyJ7JItOOYGc1qU4f/NroxKHGqs/Ypd/ok2
         sHbYrk0/kZWbknuSYZ10lQTCKr+GeieWThEEvAYD3qgdDnpMwLXMgyrGqC3omQcqRt74
         c88ybjUz/J+gDznjd5z/zV9vb6WIwNQDEYu5NgPnaS1VJcOcPqaQwY2jCZb+lW5ZlOCo
         oXrQ+FdukVkN7vaRCMqbyd3okkpNILBWlCy/Tweyavei1IqrkIEonaTvTDtCEog52Apt
         jJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520736; x=1790125536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88dtHSa8WPH4NYU5i+1r9D6cUdt6GdeC9JPuIvkZu08=;
        b=nP3ff64KxiG2nmlr8A1O9go8M4flueR57qgFAA6F3m0H0IMp9r/SdtSgIPWu/0L7xB
         HywNSjuR5pDCs/8ddAnxTrsfjEuswHEV8x+fb693v/htL8bFTydB0AiE/YpjPNoY5LZ1
         WHFSQ1DlLp34bZ63MgcSYhFios+NCMnE+PJ/C6pdaHX1vUiqiz5dC23vA+9rqScwMiTN
         3PFyYQ7w6aADO1uYKxFX/I49IyP6JzIqrjS5tdicQ5DwcYUEioE3gLSoWcv3IaG8nOHg
         V0BoEfjt+6UIymsG4PqlDbB+k2p1RAliJu8xJ4dL1CgLVWLUZY7NC0sfJ1CdtnKICVJN
         kDvg==
X-Gm-Message-State: AFuF++mYFoRc1E3Yx2SDogaDIEXKkO2PUGqS+te30bfmAuO3nrhh/x4t
	TE5CYtjNx/P7BN+u4QS9APkvYbL3mqevvXENkovu7SUGjQDefM64G3ba
X-Gm-Gg: AYBFou3Tp6s1CfddbDpt7b63HXWqMUiRcq2TqacgSi5WzAuV4yDrkrx6NigJNUIabvF
	4ShiOzBq2NWJ0kkX3S4/92SgBpJfbtXRiKHNMv6EXnUUpjGdSEHjbRHsiKSx8g9YWjb7MPh2ybG
	JqayCWc4x3jAtK2iuf1in9g2xSJxAcs8YpWmQ7yCUleJtK7Sv7qoTRlu0Af+HIkdwRwNildzcld
	dc+6juzvHsjjmLtwJAMsecIN9Ql0OWKqBrykxd4u+LkREka29Xvv5PuXlWzLyERs8fJka+3GMB/
	RqN252y47VYhvg+COkSZIN5l9v+M9bjAFSCcvrPHgN4oXXnbKj0SjQMKOWDTJhY6w+iAIhO1/K1
	vb3+poncQ4pdYaJrsvFx3elA9BCS7IAzGlRZ861YUjQgdN5X7IqFxrXpSLERZi2xPa7cuFJbJ9Z
	/ITxiPHIfFVxRwxowgr0B5tHkA1wmGotVEesvo0fv4aHQm9rIOXfslkNa3DneJrORp94TO9FnbN
	YVxWRG3xrW7pPQnXbwNeVSE72T8geP+DkuYGCxJiHI6NVNBQjU=
X-Received: by 2002:a05:6820:222a:b0:6b1:89ff:8a1a with SMTP id 006d021491bc7-6c7d15cf2a7mr885754eaf.3.1789520736112;
        Tue, 15 Sep 2026 18:05:36 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:47::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c7a78ac1c6sm1445951eaf.13.2026.09.15.18.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:05:34 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev
Subject: [PATCH v1 0/3] fuse: prep patches before enabling large folios
Date: Tue, 15 Sep 2026 18:05:23 -0700
Message-ID: <20260916010526.1318891-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the remaining places where fuse assumes a folio is a single page, or
that a page aligned range is also folio aligned. None of them changes behavior
today, so there are no Fixes tags. Each becomes reachable the moment fuse
enables large folios.

Patch 1 is the virtio-fs counterpart to "fuse: zero the correct range on
a short read reply" [1]. That one is a fix because /dev/fuse serves fuseblk
mounts, where the block size can already be smaller than the folio. virtio-fs
is never block backed, so its block size is guaranteed to be PAGE_SIZE until
large folios are enabled on fuse.

This series is on top of "fuse: don't drop destination page cache on a zero
byte copy reply" [2]. Patch 2 touches the same hunk and relies on the
bytes_copied guard from it.

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/20260904045651.1442505-3-joannelkoong@gmail.com/
[2] https://lore.kernel.org/fuse-devel/20260915235341.523416-1-joannelkoong@gmail.com/

Joanne Koong (3):
  virtio_fs: zero the correct range on a short read reply
  fuse: drop rather than zero the copied range in copy_file_range()
  fuse: replace folio_test_highmem() with folio_test_partial_kmap()

 fs/fuse/dev.c       |  3 ++-
 fs/fuse/file.c      | 21 +++++++++++----------
 fs/fuse/virtio_fs.c |  6 ++++--
 3 files changed, 17 insertions(+), 13 deletions(-)

-- 
2.52.0

