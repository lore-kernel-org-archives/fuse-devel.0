Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAC9C2C8
	for <fuse-devel@lists.linux.dev>; Wed, 16 Sep 2026 01:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520742; cv=none; b=nscUw6ITDShRFlHTgajf0+udFFIe/34DJHfCgN75WD7mnoGMnvnTdHOQeg/ou6D7BQnr6NPPDCaY7YEg5gTXEJl62NRGzysUtF61c9bSkVgLK1bmL3GEwIxFIZsR9gJY1bbBYMIM8KZ9XsU+k61x+T86Xj9GqHT19LvjfjLr/hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520742; c=relaxed/simple;
	bh=OHU+ox1pexeqlOgbCgrE5QW89NCsMvP9N/JMS/tKH3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqIK4l2VEGp08fsCJLDvXEyR6YNbEnxP6HowvWbF7G2heFOEm9CHIygSCG71OCKJBU9v5NNyCLhZQiJLpWlMTXG5aQyj3n/MDnYA7chwsuMVsWLufy5MLdq3TVp+SNe8UeyC/1HTxQE8Qq3kxJJNQAs2ifHJXI+kYBIS9VEj29g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/mM3a7A; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/mM3a7A"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-7ff1e4ffb3aso210647a34.1
        for <fuse-devel@lists.linux.dev>; Tue, 15 Sep 2026 18:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520740; x=1790125540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHUYaF/8ROQJZlLnXuxer1AZsVq4EzY+E2EPxNeKuoo=;
        b=n/mM3a7AmsG0YQZgKPsMPd9TufZuQt8Zx4GwW64NIQzO0lJHlBZqkl4ChYkI2KKcBM
         tt+E/w/QY+oVywUehI3mQuJs56eRk4S0McL/bSH8iJv6IYe9/GC90640tp5HsYeHK6jP
         0Hp+GL57zEivqgqLuY4jQ+F6a6YC+rkhGDo1eQ51Cy3GYLfSzAXoiKV04hOU7Qx8w+XC
         m0Pk9NnL7lMQYPlJV7rigd0HpJyfl5HjYgBmQAcfU7uugFJSBibYh8EnxkoUsbC58iVX
         tfPpV0yvro+j3GCFk3ChURNh8vHa64AJTqYHYonjNeDYFIr+Vt7GnnHZKIvWkGU9AdDX
         cY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520740; x=1790125540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VHUYaF/8ROQJZlLnXuxer1AZsVq4EzY+E2EPxNeKuoo=;
        b=mn0wLD4tP8+xW/eNR5I/9rgUQHKeZmxDxHNjwlUJtvgXSdXC+m/SZsaNk9fSNHckvf
         lWofi5yZxSa8rbv4Qj2tz5HI/ad4X6n+lsxttBWb3qxnoQkVMadM2KgHlUikDAPk1VLE
         M5KBvfBcS7y6YSmgbOjmMju/OxVIEw7h0K+EaZlHl1H/2mggLswDcEKt2qXDckvFOF+u
         /EgXP5/KIctTaip0F9jLVFrJlDOd3Ry2nwDYXJZHKA56k2xpqDkDirxZc41G2HMPx7eD
         rEd1trA+wFU0+7mVyiC9x+hSfcFTIBRHybuyBPeKxKdCVxlHCG4YwDS3U0jtqZ9+lmLW
         QuFA==
X-Gm-Message-State: AFuF++kpimVXIR8trZf3TtEOGtnyRPDZCzKuRiwetbnVQOfxY1JA0p70
	FpHDi3Le7hu0fxEZVYPCGNE/+Mr4f5zcdXDRjV7rfxICnE0815hlE3LpbamEaQ==
X-Gm-Gg: AYBFou0lC3R7B4g1DQu3kleSYi4qRFew7HC5SxOkgwhb+MUx3x/VGYZwA7R66jvWdxe
	/NIZkWFpSE3OeOSc6+mN36otfuz+RRYkZCPcieMpvf4/yBXaougSmvv26LN16rBInzJNKzyU+iU
	m58a9FcmCZ0tiNRVTgrBBF75hm84BuvV4krxpcPKkcjDLeIyIg8xO3YwuMefyYzUou6WwrM31Oq
	iv+A8WtMkjJub+BjK3AJ3aCpVwWRz/AZhr0A6TFFETA1R8Lu6O1QG/BrLkDEgSRoLPQ0uQpq4tK
	NcrSMzhWfL3j46XxjwgwLYIPLnyIS5G5VTPntit527kg1O6DsFyw7VU6nGAibDjB3yn1AQ7NCLj
	xR6tGXFUjegBGltlxp3vw/eM2x4viaMahPjuO/QgrEnyrUL6v00txI5xQChBRgW4YKpZpFyZLOW
	FkUsN59bKxZL4PZ5bwXDV/mr4mgRS9M5yRRiXeudA4Wqiq88GJ4ps1E8oQIC+AxUmMEAryKazWF
	G6iVJjPCfrKkzj5ygjLQN6Ox0YG2tcg4KtBhnuphViy6QhQVdQ=
X-Received: by 2002:a05:6820:1693:b0:6b1:a11a:eeaf with SMTP id 006d021491bc7-6c7d0bede08mr993784eaf.13.1789520740023;
        Tue, 15 Sep 2026 18:05:40 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:51::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b06685244sm1102255a34.4.2026.09.15.18.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:05:38 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev
Subject: [PATCH v1 1/3] virtio_fs: zero the correct range on a short read reply
Date: Tue, 15 Sep 2026 18:05:24 -0700
Message-ID: <20260916010526.1318891-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260916010526.1318891-1-joannelkoong@gmail.com>
References: <20260916010526.1318891-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtio_fs_request_complete() zeroes the unfilled tail of a short reply
at [len, thislen) within the folio. That is only correct when the read
started at the beginning of the folio, which is what the
WARN_ON(descs[i].offset) above it documents.

The assumption holds on every configuration that exists today. A fuse
read covers a sub-range of a folio only when iomap trims it to the
blocks of a folio that are not uptodate, which requires the file system
block size to be smaller than the folio. virtio-fs is not block backed,
so its block size is PAGE_SIZE, an order-0 folio is a single block, and
descs[i].offset is always 0.

Large folios make i_blocks_per_folio() greater than one and the
assumption false. iomap_adjust_read_range() skips the blocks that are
already uptodate at the front of the range and hands the position of the
first block that has to be read to ->read_folio_range(), both when
__iomap_write_begin() fills the blocks around an unaligned write and
when a folio that is only partially uptodate is read - in which case one
folio can take several reads at different offsets. fuse turns that
position into offset_in_folio(folio, iter->pos) and stores it in the
descriptor, so the tail that needs zeroing is
[offset + len, offset + thislen).

Zero that range and drop the WARN_ON(). This is a no-op today and a
prerequisite for enabling large folios.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/virtio_fs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index f15e516ebcb5..61ab7cb302c1 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -798,9 +798,11 @@ static void virtio_fs_request_complete(struct fuse_req *req,
 		for (i = 0; i < ap->num_folios; i++) {
 			thislen = ap->descs[i].length;
 			if (len < thislen) {
-				WARN_ON(ap->descs[i].offset);
+				unsigned int offset = ap->descs[i].offset;
+
 				folio = ap->folios[i];
-				folio_zero_segment(folio, len, thislen);
+				folio_zero_segment(folio, offset + len,
+						   offset + thislen);
 				len = 0;
 			} else {
 				len -= thislen;
-- 
2.52.0

